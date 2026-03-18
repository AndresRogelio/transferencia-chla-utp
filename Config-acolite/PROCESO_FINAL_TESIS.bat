@echo off
REM ============================================================================
REM  PROCESO_FINAL_TESIS.bat
REM  Procesamiento masivo de 71 imagenes Sentinel-2 L1C con ACOLITE
REM  Canal de Panama | Rango temporal: 2016-07-14 a 2022-11-15
REM
REM  CONTEXTO:
REM  ACOLITE no procesa correctamente listas de imagenes en bulk cuando hay
REM  diferencias de tiempo entre granulos (error s2_granule_time_difference).
REM  La solucion fue generar un settings individual por imagen y ejecutarlos
REM  secuencialmente desde este .bat.
REM
REM  COMO USAR:
REM  1. Editar las rutas ACOLITE_EXE, CARPETA_SAFE y CARPETA_SETTINGS abajo
REM  2. Asegurarse de que cada settings_N.txt existe en CARPETA_SETTINGS
REM     (generados por la Celda 7 del notebook 02_descarga_S2_S3_ACOLITE.ipynb)
REM  3. Ejecutar este .bat como administrador desde cmd
REM
REM  RUTAS A EDITAR:
REM  ACOLITE_EXE  = ruta completa al ejecutable acolite.exe
REM  CARPETA_SETTINGS = carpeta donde estan los settings_0.txt ... settings_70.txt
REM ============================================================================

set ACOLITE_EXE="D:\Canal\acolite_py_win_20251013.0\acolite_py_win\dist\acolite\acolite.exe"
set CARPETA_SETTINGS="D:\Canal\temp_settings"

echo Iniciando procesamiento masivo del Canal de Panama...
echo ------------------------------------------
echo Procesando 1 de 71: S2A_MSIL1C_20160714T154552_N0500_R111_T17PPL_20231002T121134.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_0.txt
echo ------------------------------------------
echo Procesando 2 de 71: S2A_MSIL1C_20170209T154541_N0500_R111_T17PPL_20230917T090530.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_1.txt
echo ------------------------------------------
echo Procesando 3 de 71: S2A_MSIL1C_20170420T154551_N0500_R111_T17PPL_20230919T212244.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_2.txt
echo ------------------------------------------
echo Procesando 4 de 71: S2A_MSIL1C_20170510T154551_N0500_R111_T17PPL_20230907T102739.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_3.txt
echo ------------------------------------------
echo Procesando 5 de 71: S2A_MSIL1C_20171017T154551_N0500_R111_T17PPL_20230910T004545.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_4.txt
echo ------------------------------------------
echo Procesando 6 de 71: S2A_MSIL1C_20180525T154551_N0500_R111_T17PPL_20230822T191707.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_5.txt
echo ------------------------------------------
echo Procesando 7 de 71: S2A_MSIL1C_20180614T154551_N0500_R111_T17PPL_20230715T235037.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_6.txt
echo ------------------------------------------
echo Procesando 8 de 71: S2A_MSIL1C_20181121T154541_N0500_R111_T17PPL_20230702T105936.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_7.txt
echo ------------------------------------------
echo Procesando 9 de 71: S2A_MSIL1C_20190110T154551_N0500_R111_T17PPL_20221209T041402.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_8.txt
echo ------------------------------------------
echo Procesando 10 de 71: S2A_MSIL1C_20190130T154551_N0500_R111_T17PPL_20230214T104714.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_9.txt
echo ------------------------------------------
echo Procesando 11 de 71: S2A_MSIL1C_20190219T154551_N0500_R111_T17PPL_20221212T070530.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_10.txt
echo ------------------------------------------
echo Procesando 12 de 71: S2A_MSIL1C_20190321T154551_N0500_R111_T17PPL_20221111T030903.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_11.txt
echo ------------------------------------------
echo Procesando 13 de 71: S2A_MSIL1C_20190410T154551_N0500_R111_T17PPL_20221015T122508.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_12.txt
echo ------------------------------------------
echo Procesando 14 de 71: S2A_MSIL1C_20190520T154551_N0500_R111_T17PPL_20221209T212822.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_13.txt
echo ------------------------------------------
echo Procesando 15 de 71: S2A_MSIL1C_20190619T154551_N0500_R111_T17PPL_20230623T224843.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_14.txt
echo ------------------------------------------
echo Procesando 16 de 71: S2A_MSIL1C_20190709T154601_N0500_R111_T17PPL_20230603T181333.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_15.txt
echo ------------------------------------------
echo Procesando 17 de 71: S2A_MSIL1C_20190808T154551_N0500_R111_T17PPL_20230504T080329.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_16.txt
echo ------------------------------------------
echo Procesando 18 de 71: S2A_MSIL1C_20190917T154551_N0500_R111_T17PPL_20230501T002941.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_17.txt
echo ------------------------------------------
echo Procesando 19 de 71: S2A_MSIL1C_20191226T154541_N0500_R111_T17PPL_20230704T145426.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_18.txt
echo ------------------------------------------
echo Procesando 20 de 71: S2A_MSIL1C_20200115T154541_N0500_R111_T17PPL_20230428T164202.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_19.txt
echo ------------------------------------------
echo Procesando 21 de 71: S2A_MSIL1C_20200204T154541_N0500_R111_T17PPL_20230623T195131.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_20.txt
echo ------------------------------------------
echo Procesando 22 de 71: S2A_MSIL1C_20200623T154601_N0500_R111_T17PPL_20230414T123434.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_21.txt
echo ------------------------------------------
echo Procesando 23 de 71: S2A_MSIL1C_20200901T154551_N0500_R111_T17PPL_20230310T115439.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_22.txt
echo ------------------------------------------
echo Procesando 24 de 71: S2A_MSIL1C_20201021T154601_N0500_R111_T17PPL_20230307T045237.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_23.txt
echo ------------------------------------------
echo Procesando 25 de 71: S2A_MSIL1C_20201130T154551_N0500_R111_T17PPL_20230322T134248.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_24.txt
echo ------------------------------------------
echo Procesando 26 de 71: S2A_MSIL1C_20201210T154551_N0500_R111_T17PPL_20230224T190325.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_25.txt
echo ------------------------------------------
echo Procesando 27 de 71: S2A_MSIL1C_20210119T154551_N0500_R111_T17PPL_20230520T093032.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_26.txt
echo ------------------------------------------
echo Procesando 28 de 71: S2A_MSIL1C_20210218T154551_N0500_R111_T17PPL_20230521T091822.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_27.txt
echo ------------------------------------------
echo Procesando 29 de 71: S2A_MSIL1C_20210519T154551_N0500_R111_T17PPL_20230208T222713.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_28.txt
echo ------------------------------------------
echo Procesando 30 de 71: S2A_MSIL1C_20210608T154551_N0500_R111_T17PPL_20230130T055919.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_29.txt
echo ------------------------------------------
echo Procesando 31 de 71: S2A_MSIL1C_20210817T154551_N0500_R111_T17PPL_20230119T011357.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_30.txt
echo ------------------------------------------
echo Procesando 32 de 71: S2A_MSIL1C_20211026T154551_N0500_R111_T17PPL_20230106T221937.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_31.txt
echo ------------------------------------------
echo Procesando 33 de 71: S2A_MSIL1C_20211215T154551_N0500_R111_T17PPL_20221224T153110.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_32.txt
echo ------------------------------------------
echo Procesando 34 de 71: S2A_MSIL1C_20220124T154551_N0510_R111_T17PPL_20240505T035718.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_33.txt
echo ------------------------------------------
echo Procesando 35 de 71: S2A_MSIL1C_20220315T154551_N0510_R111_T17PPL_20240529T084418.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_34.txt
echo ------------------------------------------
echo Procesando 36 de 71: S2A_MSIL1C_20220524T154601_N0510_R111_T17PPL_20240617T023225.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_35.txt
echo ------------------------------------------
echo Procesando 37 de 71: S2A_MSIL1C_20220921T154601_N0510_R111_T17PPL_20240724T111741.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_36.txt
echo ------------------------------------------
echo Procesando 38 de 71: S2B_MSIL1C_20171012T154539_N0500_R111_T17PPL_20230814T130500.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_37.txt
echo ------------------------------------------
echo Procesando 39 de 71: S2B_MSIL1C_20171121T154539_N0500_R111_T17PPL_20230823T114200.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_38.txt
echo ------------------------------------------
echo Procesando 40 de 71: S2B_MSIL1C_20171221T154539_N0500_R111_T17PPL_20230807T195407.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_39.txt
echo ------------------------------------------
echo Procesando 41 de 71: S2B_MSIL1C_20180120T154539_N0500_R111_T17PPL_20230801T052356.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_40.txt
echo ------------------------------------------
echo Procesando 42 de 71: S2B_MSIL1C_20180321T154549_N0500_R111_T17PPL_20230729T093444.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_41.txt
echo ------------------------------------------
echo Procesando 43 de 71: S2B_MSIL1C_20180619T154549_N0500_R111_T17PPL_20230716T024038.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_42.txt
echo ------------------------------------------
echo Procesando 44 de 71: S2B_MSIL1C_20180719T154549_N0500_R111_T17PPL_20230713T114726.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_43.txt
echo ------------------------------------------
echo Procesando 45 de 71: S2B_MSIL1C_20180808T154549_N0500_R111_T17PPL_20230826T011540.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_44.txt
echo ------------------------------------------
echo Procesando 46 de 71: S2B_MSIL1C_20181017T154549_N0500_R111_T17PPL_20230620T215750.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_45.txt
echo ------------------------------------------
echo Procesando 47 de 71: S2B_MSIL1C_20190115T154549_N0500_R111_T17PPL_20221220T010940.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_46.txt
echo ------------------------------------------
echo Procesando 48 de 71: S2B_MSIL1C_20190415T154559_N0500_R111_T17PPL_20221022T225806.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_47.txt
echo ------------------------------------------
echo Procesando 49 de 71: S2B_MSIL1C_20190515T154559_N0500_R111_T17PPL_20230617T194534.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_48.txt
echo ------------------------------------------
echo Procesando 50 de 71: S2B_MSIL1C_20190525T154559_N0500_R111_T17PPL_20221216T082130.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_49.txt
echo ------------------------------------------
echo Procesando 51 de 71: S2B_MSIL1C_20190704T154559_N0500_R111_T17PPL_20221217T163525.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_50.txt
echo ------------------------------------------
echo Procesando 52 de 71: S2B_MSIL1C_20190813T154559_N0500_R111_T17PPL_20230505T191957.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_51.txt
echo ------------------------------------------
echo Procesando 53 de 71: S2B_MSIL1C_20190912T154549_N0500_R111_T17PPL_20230503T121522.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_52.txt
echo ------------------------------------------
echo Procesando 54 de 71: S2B_MSIL1C_20191121T154549_N0500_R111_T17PPL_20230614T085537.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_53.txt
echo ------------------------------------------
echo Procesando 55 de 71: S2B_MSIL1C_20200130T154539_N0500_R111_T17PPL_20230425T143647.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_54.txt
echo ------------------------------------------
echo Procesando 56 de 71: S2B_MSIL1C_20200219T154549_N0500_R111_T17PPL_20230427T024802.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_55.txt
echo ------------------------------------------
echo Procesando 57 de 71: S2B_MSIL1C_20200310T154549_N0500_R111_T17PPL_20230410T194407.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_56.txt
echo ------------------------------------------
echo Procesando 58 de 71: S2B_MSIL1C_20200519T154549_N0500_R111_T17PPL_20230403T053851.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_57.txt
echo ------------------------------------------
echo Procesando 59 de 71: S2B_MSIL1C_20200728T154549_N0500_R111_T17PPL_20230325T075030.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_58.txt
echo ------------------------------------------
echo Procesando 60 de 71: S2B_MSIL1C_20200916T154549_N0500_R111_T17PPL_20230401T112956.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_59.txt
echo ------------------------------------------
echo Procesando 61 de 71: S2B_MSIL1C_20201006T154559_N0500_R111_T17PPL_20230306T115716.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_60.txt
echo ------------------------------------------
echo Procesando 62 de 71: S2B_MSIL1C_20210713T154549_N0500_R111_T17PPL_20230126T071651.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_61.txt
echo ------------------------------------------
echo Procesando 63 de 71: S2B_MSIL1C_20210921T154549_N0500_R111_T17PPL_20231031T103225.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_62.txt
echo ------------------------------------------
echo Procesando 64 de 71: S2B_MSIL1C_20211220T154549_N0500_R111_T17PPL_20221223T161345.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_63.txt
echo ------------------------------------------
echo Procesando 65 de 71: S2B_MSIL1C_20220119T154549_N0510_R111_T17PPL_20240502T162023.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_64.txt
echo ------------------------------------------
echo Procesando 66 de 71: S2B_MSIL1C_20220208T154549_N0510_R111_T17PPL_20240513T095712.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_65.txt
echo ------------------------------------------
echo Procesando 67 de 71: S2B_MSIL1C_20220419T154549_N0510_R111_T17PPL_20240605T225204.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_66.txt
echo ------------------------------------------
echo Procesando 68 de 71: S2B_MSIL1C_20220519T154549_N0510_R111_T17PPL_20240612T163126.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_67.txt
echo ------------------------------------------
echo Procesando 69 de 71: S2B_MSIL1C_20220628T154559_N0510_R111_T17PPL_20240626T093842.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_68.txt
echo ------------------------------------------
echo Procesando 70 de 71: S2B_MSIL1C_20220817T154549_N0510_R111_T17PPL_20240626T224611.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_69.txt
echo ------------------------------------------
echo Procesando 71 de 71: S2B_MSIL1C_20221115T154549_N0510_R111_T17PPL_20240709T125250.SAFE
%ACOLITE_EXE% --cli --settings=%CARPETA_SETTINGS%\settings_70.txt
echo ==========================================
echo PROCESO COMPLETADO EXITOSAMENTE.
pause
