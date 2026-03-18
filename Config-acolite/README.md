# Configuración de ACOLITE

Esta carpeta contiene los archivos de configuración usados para la corrección
atmosférica con ACOLITE (versión `acolite_py_win_20251013.0`).

---

## acolite_settings.txt

Archivo de settings global usado como plantilla base para cada imagen. Los
parámetros clave y su justificación:

### Sensor y compatibilidad temporal

```
s2_include_all_granules=True
s2_time_difference_check=False
s2_granule_time_difference_check=False
```

> **Por que estas 3 lineas son criticas:** ACOLITE lanza un error al procesar
> granulos S2 con diferencias horarias en los metadatos (comun en el archivo
> de reempaquetado de Copernicus). Sin estas flags, el proceso aborta
> silenciosamente sin producir ningun archivo de salida.

### Resolucion y parametros de salida

```
s2_target_res=20
l2w_parameters=Rrs_*,chl_oc3,chl_re_gons,spm_nechad2016,tur_nechad2016,fai
```

Se usa 20 m (en lugar de 10 m) para que las bandas del red-edge (704, 740, 783 nm)
queden en la misma resolucion que las bandas VIS. A 10 m solo existen 443, 492,
560 y 665 nm.

### Correccion atmosferica

```
atmospheric_correction_method=dark_spectrum
dsf_aot_estimate=tiled
dsf_residual_glint_correction=True
```

Metodo DSF (Dark Spectrum Fitting) tiled: estima AOT por teselas, mas robusto
para escenas con mezcla tierra-agua como los embalses del Canal.

### Mascara de agua

```
l2w_mask_threshold=0.055
l2w_mask_negative_rhow=False
```

El umbral 0.055 en Rho_w para separar agua/tierra fue ajustado empiricamente
para las condiciones opticas de los embalses tropicales. Se desactiva el
enmascaramiento de reflectancias negativas porque ACOLITE puede producirlas
legitimas en bandas NIR en aguas muy oscuras.

### Gestion de disco

```
delete_extracted_input=True
l1r_delete_netcdf=True
l2r_delete_netcdf=True
delete_acolite_run_text_files=True
```

Vital para no agotar el espacio en disco al procesar 71 imagenes (~55 GB total
antes de limpieza). Solo se conservan los archivos `_L2W.nc` finales.

### ROI

```
limit=8.8971,-80.1127,9.4322,-79.4597
```

Formato: Sur, Oeste, Norte, Este. Cubre Lago Gatun, Lago Alhajuela y Embalse
Miraflores con un buffer de ~5 km.

---

## PROCESO_FINAL_TESIS.bat

Script de procesamiento masivo para las 71 imagenes Sentinel-2 (S2A y S2B,
2016-2022).

### Por que un .bat en lugar del modo batch nativo de ACOLITE?

ACOLITE permite pasar una lista de imagenes directamente via `inputfile=`,
pero al hacerlo con granulos de fechas muy separadas produce el error:

```
ERROR: time difference between granules exceeds threshold
```

La solucion fue generar un archivo `settings_N.txt` individual por imagen
(Celda 7 del notebook `02_descarga_S2_S3_ACOLITE.ipynb`) y ejecutarlos
secuencialmente desde este .bat, de modo que cada llamada a ACOLITE procesa
exactamente una imagen a la vez.

### Como usar

1. Editar las dos variables al inicio del .bat:
   ```bat
   set ACOLITE_EXE="ruta\completa\a\acolite.exe"
   set CARPETA_SETTINGS="ruta\completa\a\temp_settings"
   ```

2. Generar los `settings_0.txt` ... `settings_70.txt` ejecutando la
   **Celda 7** del notebook `notebooks/02_descarga_S2_S3_ACOLITE.ipynb`.

3. Ejecutar el .bat desde cmd (no hace falta administrador, pero si espacio
   suficiente en disco -- minimo ~15 GB libres).

### Imagenes procesadas (71 escenas, tile 17PPL)

| # | Plataforma | Fecha | ID |
|---|---|---|---|
| 1 | S2A | 2016-07-14 | S2A_MSIL1C_20160714T154552... |
| 2 | S2A | 2017-02-09 | S2A_MSIL1C_20170209T154541... |
| ... | ... | ... | ... |
| 71 | S2B | 2022-11-15 | S2B_MSIL1C_20221115T154549... |

Rango temporal total: **2016-07-14 a 2022-11-15**
Sensor: Sentinel-2A y Sentinel-2B, tile UTM 17PPL
