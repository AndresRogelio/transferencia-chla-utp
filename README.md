# 🛰️ Pipeline de Monitoreo de Calidad del Agua — Canal de Panamá

> Estimación de clorofila-a en el Canal de Panamá mediante imágenes satelitales Sentinel-2/3,
> corrección atmosférica con ACOLITE y redes neuronales de densidad mixta (MDN).

---

## 📋 Descripción

Este repositorio contiene el pipeline completo de teledetección para monitorear la calidad del agua del Canal de Panamá durante el periodo **2016–2026**. El flujo integra la descarga automática de imágenes satelitales desde el catálogo de Copernicus, la corrección atmosférica con ACOLITE, la extracción georreferenciada de reflectancias y la estimación de clorofila-a mediante el modelo **MDN (Mixture Density Network)**.

---

## 🗂️ Estructura del Proyecto

```
Canal/
├── Data/
│   ├── chla_panama_2016_2026.csv          # Datos de campo (fechas, coordenadas, chl-a)
│   ├── lista_descarga_L1.csv              # IDs de imágenes S2/S3 a descargar
│   └── Matriz_Resultados_SIN_NEGATIVOS.csv # Resultado final con CHL_MDN
│
├── Procesado/                             # Archivos NetCDF L2W generados por ACOLITE
│   └── *_L2W.nc
│
├── temp_settings/                         # Archivos de configuración por imagen
│   └── settings_N.txt
│
├── Matriz_Completa_RAW_Georreferenciada.csv  # Extracción cruda de Rrs y algoritmos
├── Matriz_Validacion_Inteligente.csv         # Extracción con búsqueda expandida
├── Reporte_Diagnostico_Fallos.csv            # Diagnóstico de fallos por estación
├── estadisticas_extraccion.csv               # Métricas de calidad del proceso
├── extraccion_log.txt                        # Log detallado de la extracción
└── Pipeline_Completo_Canal_Panama.ipynb      # Notebook principal (este pipeline)

E:\Canal\
├── Imagenes_Satelitales/                  # ZIPs descargados de Copernicus
└── Temp_Work/                             # Carpetas .SAFE / .SEN3 descomprimidas
```

---

## ⚙️ Requisitos

### Python

| Paquete | Versión mínima | Notas |
|---------|---------------|-------|
| Python | 3.12 | Requerido por MDN-STREAM |
| pandas | ≥ 2.0 | |
| numpy | ≥ 1.26 | |
| scikit-learn | ≥ 1.3 | Requiere parche de compatibilidad (ver §8.1) |
| netCDF4 | ≥ 1.6 | Lectura de archivos ACOLITE |
| requests | ≥ 2.31 | Descarga desde Copernicus |
| scipy | ≥ 1.11 | Cálculo de distancias espaciales |
| MDN-STREAM | development | Ver instalación abajo |

### Software externo

| Herramienta | Versión | Uso |
|-------------|---------|-----|
| [ACOLITE](https://github.com/acolite/acolite) | `20251013.0` | Corrección atmosférica (Dark Spectrum Fitting) |
| Cuenta [Copernicus CDSE](https://dataspace.copernicus.eu) | — | Descarga de imágenes Sentinel |

---

## 🚀 Instalación

### 1. Crear entorno virtual

```bash
# Con virtualenv
python3.12 -m venv AQV_env_11_19_25
source AQV_env_11_19_25/bin/activate        # Linux / macOS
AQV_env_11_19_25\Scripts\activate           # Windows

# O con conda
conda create -n AQV_env_11_19_25 python=3.12
conda activate AQV_env_11_19_25
```

### 2. Instalar dependencias

```bash
pip install pandas numpy scikit-learn netCDF4 requests scipy

# MDN-STREAM (rama development)
pip install git+https://github.com/STREAM-RS/MDN-STREAM.git@development
```

### 3. Descargar ACOLITE

```bash
# Descargar el ejecutable para Windows desde:
# https://github.com/acolite/acolite/releases
# Extraer en: D:\Canal\acolite_py_win_20251013.0\
```

---

## 🗺️ Área de Estudio

| Parámetro | Valor |
|-----------|-------|
| Región | Canal de Panamá |
| Coordenadas AOI | `POINT(-79.8 9.1)` |
| Recorte espacial | `8.8971°N, 80.1127°W — 9.4322°N, 79.4597°W` |
| Periodo | 2016 – 2026 |

---

## 📖 Flujo de Trabajo

El notebook está dividido en **8 secciones** que deben ejecutarse en orden:

```
§1 Configuración
    └─► Rutas, credenciales y parámetros globales

§2 Búsqueda
    └─► Consulta OData a Copernicus por cada fecha de muestreo
    └─► Genera: lista_descarga_L1.csv

§3 Descarga
    ├─► Fase 3.1: Sentinel-2 MSI (S2MSI1C)
    ├─► Fase 3.2: Sentinel-3 OLCI (OL_1_EFR___)
    └─► Fase 3.3: Descarga puntual por nombre de imagen

§4 Gestión de Archivos
    ├─► 4.1 Renombrado de ZIPs (nombre correcto desde contenido interno)
    ├─► 4.2 Descompresión de .SAFE / .SEN3
    └─► 4.3 Lista de rutas para ACOLITE

§5 ACOLITE
    ├─► 5.1 Generación del script .bat (procesamiento masivo)
    └─► 5.2 Inspección de variables Rrs en NetCDF

§6 Extracción
    ├─► 6.1 Extractor principal: ventana espacial 3×3 px
    └─► 6.2 Extractor inteligente: búsqueda expandida 11×11 px

§7 Diagnóstico
    └─► Reporte de fallos: Agua / Nube / Tierra / Borde / Fuera de imagen

§8 MDN
    ├─► 8.1 Fix de compatibilidad sklearn
    ├─► 8.2 Predicción CHL_MDN
    └─► 8.3 Verificación final
```

---

## 🛰️ Sensores y Productos

### Imágenes satelitales

| Sensor | Tipo de producto | Nivel |
|--------|-----------------|-------|
| Sentinel-2A/B MSI | `S2MSI1C` | L1C |
| Sentinel-3 OLCI | `OL_1_EFR___` | L1 EFR |

### Bandas Rrs extraídas (S2A / S2B)

| Columna | S2A (nm) | S2B (nm) | Descripción |
|---------|----------|----------|-------------|
| Rrs_443 | 443 | 442 | Azul — aerosoles |
| Rrs_492 | 492 | 492 | Azul-verde |
| Rrs_560 | 560 | 559 | Verde |
| Rrs_665 | 665 | 665 | Rojo |
| Rrs_704 | 704 | 704 | Red edge 1 |
| Rrs_740 | 740 | 739 | Red edge 2 |
| Rrs_783 | 783 | 780 | Red edge 3 |
| Rrs_833 | 833 | 833 | NIR |
| Rrs_865 | 865 | 864 | NIR amplio |

### Algoritmos ACOLITE

| Variable | Descripción |
|----------|-------------|
| `CHL_OC3` | Clorofila-a (OC3, basado en banda azul/verde) |
| `CHL_RE_GONS` | Clorofila-a (Gons, red edge) |
| `CHL_RE_GONS740` | Variante Gons con banda 740 nm |
| `CHL_NN` | Clorofila-a (red neuronal) |
| `TUR_NECHAD2016` | Turbidez (Nechad et al. 2016) |
| `SPM_NECHAD2016` | Sólidos en suspensión |
| `FAI` | Floating Algae Index |
| `CHL_MDN` | **Clorofila-a MDN** *(producto final)* |

---

## 🔧 Parámetros de Corrección Atmosférica (ACOLITE)

| Parámetro | Valor | Descripción |
|-----------|-------|-------------|
| `atmospheric_correction_method` | `dark_spectrum` | Dark Spectrum Fitting (DSF) |
| `dsf_aot_estimate` | `tiled` | Estimación tileada del AOT |
| `dsf_residual_glint_correction` | `True` | Corrección de sun-glint residual |
| `s2_target_res` | `20 m` | Resolución espacial objetivo |
| `l2w_mask_threshold` | `0.055` | Umbral de máscara de agua |
| `merge_tiles` | `True` | Une los granulos en una sola imagen |
| `ancillary_data` | `True` | Usa datos auxiliares (METEO) |

---

## 🧠 Modelo MDN

El modelo de estimación de clorofila utiliza **Mixture Density Networks** del paquete [MDN-STREAM](https://github.com/STREAM-RS/MDN-STREAM):

| Parámetro | Valor |
|-----------|-------|
| Sensor | MSI (Sentinel-2) |
| Producto | `chl` |
| Model UID | `1b79098defa9693eb03ac734467c3854cf4fb81ce3d1a96b9bf0f511f1c997b1` |

> **Referencia:** O'Shea et al. — *MDN Tutorials*, STREAM-RS Group.

---

## 📊 Archivo de Datos de Campo

El archivo `chla_panama_2016_2026.csv` debe contener al menos las siguientes columnas:

| Columna | Tipo | Descripción |
|---------|------|-------------|
| `date` | `YYYY-MM-DD` | Fecha del muestreo |
| `site` | string | Nombre de la estación |
| `Latitud` | float | Latitud decimal (WGS84) |
| `Longitud` | float | Longitud decimal (WGS84) |
| `data` | float | Concentración de chl-a in situ (mg/m³) |

---

## ⚠️ Notas Importantes

1. **Credenciales:** Registrarse en [dataspace.copernicus.eu](https://dataspace.copernicus.eu) y reemplazar `TU_EMAIL` y `TU_PASSWORD` en la celda de configuración global (§1).

2. **Espacio en disco:** Cada imagen Sentinel-2 ocupa ~700 MB comprimida. Para 200+ imágenes se requieren al menos **200–300 GB** en la unidad `E:\`.

3. **Valores negativos en Rrs:** ACOLITE puede generar valores negativos en píxeles problemáticos. El pipeline los fuerza a `0` antes de aplicar MDN (§8.2).

4. **Token Copernicus:** El token JWT expira cada 10 minutos. La función `download_product()` renueva automáticamente el token cuando recibe un error `401`.

5. **Entorno MDN:** Las secciones §1–§7 pueden ejecutarse en cualquier entorno Python 3.x. La **§8 (MDN) requiere estrictamente** el entorno `AQV_env_11_19_25` con Python 3.12.

---

## 📄 Licencia

Uso académico, Universidad Tecnológica de Panamá.

---

## ✉️ Contacto

andresrogelio26@gmail.com
