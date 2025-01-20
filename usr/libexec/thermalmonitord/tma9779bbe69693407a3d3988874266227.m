@interface tma9779bbe69693407a3d3988874266227
- (id)getGridX;
- (id)getGridY;
- (id)initProduct:(id)a3;
- (int)arcModuleTemperature;
- (int)compute2DGridTemps;
- (int)gasGaugeBatteryTemperature;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tma9779bbe69693407a3d3988874266227

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tma9779bbe69693407a3d3988874266227;
  id v3 = [(CommonProduct *)&v6 initProduct:a3];
  v4 = v3;
  if (v3) {
    [v3 resetVTFilterState];
  }
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredMaxRadioTemp = -1;
  self->_filteredMaxCameraTemp = -1;
}

- (int)gasGaugeBatteryTemperature
{
  return dword_1000AABCC[0];
}

- (int)arcModuleTemperature
{
  return dword_1000AAC64;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(tma9779bbe69693407a3d3988874266227 *)self gasGaugeBatteryTemperature];
  int v6 = qword_1000AABD4;
  int v7 = HIDWORD(qword_1000AABD4);
  int v58 = dword_1000AABE0;
  int v59 = qword_1000AABE4;
  int v60 = dword_1000AABDC;
  int v61 = dword_1000AAC60;
  int v62 = dword_1000AAC64;
  if (v3) {
    [(tma9779bbe69693407a3d3988874266227 *)self resetVTFilterState];
  }
  unsigned int v8 = [[self findComponent:0] currentLoadingIndex];
  float v9 = (double)(int)(v8 * v8) / 100.0;
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v9 = (float)filteredBacklightCurrentLI2 + (float)((float)(v9 - (float)filteredBacklightCurrentLI2) * 0.14286);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v9;
  int v11 = qword_1000AAD88;
  if ((int)qword_1000AAD88 <= SHIDWORD(qword_1000AAD88)) {
    int v11 = HIDWORD(qword_1000AAD88);
  }
  int v12 = v11 & ~(v11 >> 31);
  int filteredMaxRadioTemp = self->_filteredMaxRadioTemp;
  if (filteredMaxRadioTemp < 0) {
    int v14 = v12;
  }
  else {
    int v14 = (int)(float)((float)filteredMaxRadioTemp + (float)((float)(v12 - filteredMaxRadioTemp) * 0.25));
  }
  self->_int filteredMaxRadioTemp = v14;
  int v15 = dword_1000AAD78;
  int v16 = dword_1000AAD7C;
  if (dword_1000AAD7C <= dword_1000AAD80) {
    int v16 = dword_1000AAD80;
  }
  if (dword_1000AAD78 <= v16) {
    int v15 = v16;
  }
  int v17 = v15 & ~(v15 >> 31);
  int filteredMaxCameraTemp = self->_filteredMaxCameraTemp;
  if ((filteredMaxCameraTemp & 0x80000000) == 0) {
    int v17 = (int)(float)((float)filteredMaxCameraTemp + (float)((float)(v17 - filteredMaxCameraTemp) * 0.25));
  }
  self->_int filteredMaxCameraTemp = v17;
  id v19 = [(CommonProduct *)self findComponent:18];
  float v20 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v21 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v22 = v21;
  *(float *)&double v21 = v20;
  [v19 calculateControlEffort:v21 trigger:v22];
  sub_100031714(51, (int)((double)v5 * 0.29+ 6.0+ (double)v6 * 0.44+ (double)v7 * 0.24+ (double)self->_filteredMaxRadioTemp * -0.06+ (double)self->_filteredMaxCameraTemp * -0.03));
  sub_100031714(49, (int)((double)v5 * 0.16+ 8.0+ (double)v6 * 0.62+ (double)v7 * 0.19+ (double)self->_filteredMaxRadioTemp * -0.05+ (double)self->_filteredMaxCameraTemp * -0.02));
  sub_100031714(50, (int)((double)v5 * 0.3 + 389.0 + (double)v7 * 0.94 + (double)v58 * -0.58 + (double)v59 * 0.28));
  sub_100031714(58, (int)((double)v5 * 0.71+ 204.0+ (double)v60 * 0.25+ (double)v58 * -0.07+ (double)self->_filteredBacklightCurrentLI2 * 0.02));
  sub_100031714(54, 3000);
  sub_100031714(57, (int)((double)v5 * 0.98+ 329.0+ (double)v58 * -0.11+ (double)self->_filteredBacklightCurrentLI2 * 0.04));
  sub_100031714(60, (int)((double)v61 * 0.95 + -67.0 + (double)v60 * 0.1 + (double)(v62 & ~(v62 >> 31)) * -0.03));
  sub_100031714(55, 3000);
  sub_100031714(56, (int)((double)v5 * 0.26+ -65.0+ (double)v6 * 3.03+ (double)v7 * -0.39+ (double)v60 * -1.95+ (double)self->_filteredBacklightCurrentLI2 * 0.02));
  sub_100031714(52, (int)((double)v6 * 0.3+ -70.0+ (double)v58 * 0.15+ (double)v59 * 0.12+ (double)v61 * 0.43+ (double)self->_filteredMaxRadioTemp * -0.04));
  sub_100031714(53, (int)((double)v5 * 0.33 + 93.0 + (double)v7 * 0.34 + (double)v60 * 0.27 + (double)v12 * -0.01));
  float v23 = (float)SHIDWORD(qword_1000AAD94);
  id v24 = [(CommonProduct *)self findComponent:19];
  float v25 = v23 / 100.0;
  *(float *)&double v26 = v25;
  [v24 calculateControlEffort:v26];
  id v27 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v28 = v25;
  [v27 calculateControlEffort:v28];
  float v29 = (float)SHIDWORD(qword_1000AADAC);
  id v30 = [(CommonProduct *)self findComponent:21];
  float v31 = v29 / 100.0;
  *(float *)&double v32 = v31;
  [v30 calculateControlEffort:v32];
  id v33 = [(CommonProduct *)self findComponent:23];
  *(float *)&double v34 = v31;
  [v33 calculateControlEffort:v34];
  float v35 = (float)dword_1000AADBC;
  id v36 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v37 = v35 / 100.0;
  [v36 calculateControlEffort:v37];
  float v38 = (float)(int)qword_1000AAD9C;
  id v39 = [(CommonProduct *)self findComponent:24];
  *(float *)&double v40 = v38 / 100.0;
  [v39 calculateControlEffort:v40];
  float v41 = (float)SHIDWORD(qword_1000AAD9C);
  id v42 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v43 = v41 / 100.0;
  [v42 calculateControlEffort:v43];
  float v44 = (float)dword_1000AADA4;
  id v45 = [(CommonProduct *)self findComponent:26];
  *(float *)&double v46 = v44 / 100.0;
  [v45 calculateControlEffort:v46];
  float v47 = (float)dword_1000AADA8;
  id v48 = [(CommonProduct *)self findComponent:27];
  *(float *)&double v49 = v47 / 100.0;
  [v48 calculateControlEffort:v49];
  unsigned int v50 = [(CommonProduct *)self getChargerState];
  if (v50 - 10 > 0x3C) {
    goto LABEL_21;
  }
  float v51 = (float)(int)qword_1000AAD94;
  if (((1 << (v50 - 10)) & 0x1004010000100000) == 0)
  {
    if (v50 == 10)
    {
      id v56 = [(CommonProduct *)self findComponent:28];
      *(float *)&double v57 = v51 / 100.0;
LABEL_23:
      [v56 calculateControlEffort:v57];
      id v54 = [(CommonProduct *)self findComponent:29];
      LODWORD(v55) = 30.0;
      goto LABEL_24;
    }
LABEL_21:
    if (v50) {
      return;
    }
    id v56 = [(CommonProduct *)self findComponent:28];
    LODWORD(v57) = 30.0;
    goto LABEL_23;
  }
  id v52 = [(CommonProduct *)self findComponent:28];
  LODWORD(v53) = 30.0;
  [v52 calculateControlEffort:v53];
  id v54 = [(CommonProduct *)self findComponent:29];
  *(float *)&double v55 = v51 / 100.0;
LABEL_24:

  [v54 calculateControlEffort:v55];
}

- (id)getGridX
{
  return &off_10008D7F0;
}

- (id)getGridY
{
  return &off_10008D808;
}

- (int)compute2DGridTemps
{
  int v3 = [(tma9779bbe69693407a3d3988874266227 *)self gasGaugeBatteryTemperature];
  uint64_t v4 = qword_1000AABD4;
  int v5 = qword_1000AABE4;
  double v6 = (double)dword_1000AABDC;
  double v7 = (double)dword_1000AABE0;
  double v8 = (double)dword_1000AAC60;
  unsigned int v9 = (int)((double)dword_1000AABDC * 1.01
           + -116.6
           + (double)dword_1000AABE0 * -0.31
           + (double)self->_filteredBacklightCurrentLI2 * 0.01
           + (double)dword_1000AAC60 * 0.27);
  self->super.baseVT[0] = v9;
  self->super.baseVT[1] = (int)((double)SHIDWORD(v4) * -0.69
                              + -117.3
                              + v6 * 1.44
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.24);
  self->super.baseVT[2] = (int)((double)(int)v4 * 1.3
                              + -110.5
                              + (double)SHIDWORD(v4) * -0.55
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.24);
  self->super.baseVT[3] = (int)((double)(int)v4 * 1.35
                              + -46.7
                              + (double)SHIDWORD(v4) * -0.63
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.24);
  self->super.baseVT[4] = (int)((double)(int)v4 * 1.43
                              + -129.5
                              + (double)SHIDWORD(v4) * -0.75
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.27);
  self->super.baseVT[5] = (int)((double)v3 * 0.22
                              + -17.3
                              + (double)(int)v4 * 0.66
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.08);
  self->super.baseVT[6] = (int)((double)SHIDWORD(v4) * -0.29
                              + -85.6
                              + v6 * 0.95
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02
                              + v8 * 0.32);
  self->super.baseVT[7] = (int)((double)(int)v4 * 0.83
                              + -54.0
                              + (double)SHIDWORD(v4) * -0.25
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02
                              + v8 * 0.4);
  self->super.baseVT[8] = (int)((double)(int)v4 * 0.86
                              + -31.4
                              + (double)SHIDWORD(v4) * -0.33
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02
                              + v8 * 0.44);
  self->super.baseVT[9] = (int)((double)SHIDWORD(v4) * -0.6
                              + -3.6
                              + v6 * 1.15
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.41);
  self->super.baseVT[10] = (int)((double)v3 * 0.44
                               + 121.8
                               + (double)SHIDWORD(v4) * 0.13
                               + v6 * 0.15
                               + (double)v5 * 0.2
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[11] = (int)((double)v3 * 0.26
                               + -117.6
                               + (double)SHIDWORD(v4) * -0.18
                               + v6 * 0.61
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.31);
  self->super.baseVT[12] = (int)((double)v3 * 0.71
                               + 204.0
                               + v6 * 0.25
                               + v7 * -0.07
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[13] = (int)((double)v3 * 0.3
                               + -65.2
                               + (double)SHIDWORD(v4) * -0.39
                               + v6 * 0.71
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.35);
  self->super.baseVT[14] = (int)((double)v3 * 0.32
                               + -33.5
                               + (double)SHIDWORD(v4) * -0.41
                               + v6 * 0.7
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.34);
  self->super.baseVT[15] = (int)((double)v3 * 0.22
                               + -39.4
                               + (double)SHIDWORD(v4) * -0.14
                               + v6 * 0.31
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.59);
  self->super.baseVT[16] = (int)((double)v3 * 0.25
                               + -5.8
                               + (double)SHIDWORD(v4) * -0.26
                               + v6 * 0.43
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.56);
  self->super.baseVT[17] = (int)((double)v3 * 0.29
                               + 10.3
                               + (double)SHIDWORD(v4) * -0.34
                               + v6 * 0.52
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.52);
  self->super.baseVT[18] = (int)((double)v3 * 0.3
                               + 27.9
                               + (double)SHIDWORD(v4) * -0.38
                               + v6 * 0.56
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.49);
  self->super.baseVT[19] = (int)((double)v3 * 0.31
                               + 27.6
                               + (double)SHIDWORD(v4) * -0.42
                               + v6 * 0.58
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.49);
  self->super.baseVT[20] = (int)((double)v3 * 0.26
                               + -86.4
                               + v6 * 0.2
                               + (double)v5 * -0.41
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.95);
  self->super.baseVT[21] = (int)((double)(int)v4 * -0.73
                               + 76.4
                               + (double)SHIDWORD(v4) * -0.4
                               + v6 * 1.19
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.92);
  self->super.baseVT[22] = (int)(v8 * 0.15
                               + 84.0
                               + v7 * -0.85
                               + (double)v5 * 1.64
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03);
  self->super.baseVT[23] = (int)((double)v3 * 0.26
                               + 141.7
                               + (double)SHIDWORD(v4) * -0.47
                               + v6 * 0.57
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.59);
  self->super.baseVT[24] = (int)((double)v3 * 0.27
                               + 20.3
                               + (double)SHIDWORD(v4) * -0.72
                               + v6 * 0.85
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.56);
  int32x4_t v10 = vdupq_n_s32(v9);
  uint64_t v11 = 1;
  int32x4_t v12 = v10;
  do
  {
    int32x4_t v13 = *(int32x4_t *)&self->super.baseVT[v11];
    int32x4_t v10 = vminq_s32(v10, v13);
    int32x4_t v12 = vmaxq_s32(v12, v13);
    v11 += 4;
  }
  while (v11 != 25);
  sub_100031714(59, (vmaxvq_s32(v12) - vminvq_s32(v10)));
  return self->super.baseVT;
}

- (void)updateCoreAnalyticsInfo
{
}

@end