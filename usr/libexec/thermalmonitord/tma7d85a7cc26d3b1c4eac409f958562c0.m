@interface tma7d85a7cc26d3b1c4eac409f958562c0
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

@implementation tma7d85a7cc26d3b1c4eac409f958562c0

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tma7d85a7cc26d3b1c4eac409f958562c0;
  id v3 = [(CommonProduct *)&v6 initProduct:a3];
  v4 = v3;
  if (v3) {
    [v3 resetVTFilterState];
  }
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = 1;
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
  int v5 = [(tma7d85a7cc26d3b1c4eac409f958562c0 *)self gasGaugeBatteryTemperature];
  int v6 = qword_1000AABD4;
  LODWORD(v63) = HIDWORD(qword_1000AABD4);
  int v8 = dword_1000AABDC;
  int v7 = dword_1000AABE0;
  int v9 = dword_1000AAC60;
  int v66 = qword_1000AABE4;
  int v67 = dword_1000AAC64;
  if (v3) {
    [(tma7d85a7cc26d3b1c4eac409f958562c0 *)self resetVTFilterState];
  }
  unsigned int v10 = [[self findComponent:0, v63] currentLoadingIndex];
  float v11 = (double)(int)(v10 * v10) / 100.0;
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v11 = (float)filteredBacklightCurrentLI2 + (float)((float)(v11 - (float)filteredBacklightCurrentLI2) * 0.14286);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v11;
  int v13 = qword_1000AAD88;
  if ((int)qword_1000AAD88 <= SHIDWORD(qword_1000AAD88)) {
    int v13 = HIDWORD(qword_1000AAD88);
  }
  int v14 = v13 & ~(v13 >> 31);
  int filteredMaxRadioTemp = self->_filteredMaxRadioTemp;
  if ((filteredMaxRadioTemp & 0x80000000) == 0) {
    int v14 = (int)(float)((float)filteredMaxRadioTemp + (float)((float)(v14 - filteredMaxRadioTemp) * 0.25));
  }
  self->_int filteredMaxRadioTemp = v14;
  int v16 = dword_1000AAD78;
  if (dword_1000AAD78 <= dword_1000AAD80) {
    int v16 = dword_1000AAD80;
  }
  int v17 = v16 & ~(v16 >> 31);
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
  sub_100031714(51, (int)((double)v6 * 0.24 + -80.0 + (double)v8 * 0.18 + (double)v7 * 0.14 + (double)v9 * 0.45));
  double v23 = (double)v64;
  double v65 = (double)v5 * 0.47 + -70.0 + (double)v6 * -0.38 + (double)v64 * 0.14 + (double)v8 * 0.79;
  sub_100031714(49, (int)(v65 + (double)self->_filteredMaxRadioTemp * -0.05));
  sub_100031714(50, (int)((double)v5 * 0.91 + 71.0 + (double)v6 * -0.21 + v23 * 0.09 + (double)v8 * 0.23));
  sub_100031714(57, (int)((double)v5 * 1.07+ 55.0+ v23 * -0.16+ (double)v8 * 0.16+ (double)v7 * 0.34+ (double)v66 * -0.42));
  sub_100031714(56, (int)((double)v5 * 1.13+ 94.0+ (double)v8 * 0.29+ (double)v7 * 0.24+ (double)v66 * -0.7+ (double)self->_filteredMaxCameraTemp * 0.07));
  sub_100031714(58, (int)((double)v5+ 65.0+ (double)v8 * 0.19+ (double)v7 * 0.15+ (double)v66 * -0.36+ (double)self->_filteredMaxRadioTemp * -0.04));
  double v24 = (double)(v67 & ~(v67 >> 31));
  sub_100031714(60, (int)((double)v9 * 0.92 + -52.0 + v23 * -0.05 + (double)v8 * 0.13 + v24 * -0.06));
  sub_100031714(52, (int)((double)v8 * 0.12+ 138.0+ (double)v66 * 0.22+ (double)v9 * 0.69+ (double)self->_filteredMaxRadioTemp * -0.12+ (double)self->_filteredMaxCameraTemp * -0.12+ v24 * -0.09));
  sub_100031714(53, (int)(v65 + (double)self->_filteredMaxRadioTemp * -0.05));
  sub_100031714(54, 3000);
  sub_100031714(55, 3000);
  float v25 = (float)unk_1000AAD90;
  id v26 = [(CommonProduct *)self findComponent:19];
  float v27 = v25 / 100.0;
  *(float *)&double v28 = v27;
  [v26 calculateControlEffort:v28];
  id v29 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v30 = v27;
  [v29 calculateControlEffort:v30];
  float v31 = (float)SHIDWORD(qword_1000AADAC);
  id v32 = [(CommonProduct *)self findComponent:21];
  float v33 = v31 / 100.0;
  *(float *)&double v34 = v33;
  [v32 calculateControlEffort:v34];
  id v35 = [(CommonProduct *)self findComponent:23];
  *(float *)&double v36 = v33;
  [v35 calculateControlEffort:v36];
  float v37 = (float)dword_1000AADBC;
  id v38 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v39 = v37 / 100.0;
  [v38 calculateControlEffort:v39];
  float v40 = (float)(int)qword_1000AAD9C;
  id v41 = [(CommonProduct *)self findComponent:24];
  *(float *)&double v42 = v40 / 100.0;
  [v41 calculateControlEffort:v42];
  float v43 = (float)SHIDWORD(qword_1000AAD9C);
  id v44 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v45 = v43 / 100.0;
  [v44 calculateControlEffort:v45];
  float v46 = (float)dword_1000AADA4;
  id v47 = [(CommonProduct *)self findComponent:26];
  *(float *)&double v48 = v46 / 100.0;
  [v47 calculateControlEffort:v48];
  float v49 = (float)dword_1000AADA8;
  id v50 = [(CommonProduct *)self findComponent:27];
  *(float *)&double v51 = v49 / 100.0;
  [v50 calculateControlEffort:v51];
  unsigned int v52 = [(CommonProduct *)self getChargerState];
  if (v52 - 10 > 0x3C) {
    goto LABEL_18;
  }
  float v53 = (float)(int)qword_1000AAD94;
  if (((1 << (v52 - 10)) & 0x1004010000100000) == 0)
  {
    if (v52 == 10)
    {
      id v58 = [(CommonProduct *)self findComponent:28];
      *(float *)&double v59 = v53 / 100.0;
LABEL_20:
      [v58 calculateControlEffort:v59 *(void *)&v65];
      id v56 = [(CommonProduct *)self findComponent:29];
      LODWORD(v57) = 30.0;
      goto LABEL_21;
    }
LABEL_18:
    if (v52) {
      goto LABEL_22;
    }
    id v58 = [(CommonProduct *)self findComponent:28];
    LODWORD(v59) = 30.0;
    goto LABEL_20;
  }
  id v54 = [(CommonProduct *)self findComponent:28];
  LODWORD(v55) = 30.0;
  [v54 calculateControlEffort:v55];
  id v56 = [(CommonProduct *)self findComponent:29];
  *(float *)&double v57 = v53 / 100.0;
LABEL_21:
  [v56 calculateControlEffort:v57 *(void *)&v65];
LABEL_22:
  float v60 = (float)SHIDWORD(qword_1000AAD94);
  id v61 = -[CommonProduct findComponent:](self, "findComponent:", 30, *(void *)&v65);

  *(float *)&double v62 = v60 / 100.0;
  [v61 calculateControlEffort:v62];
}

- (id)getGridX
{
  return &off_10008D880;
}

- (id)getGridY
{
  return &off_10008D898;
}

- (int)compute2DGridTemps
{
  int v3 = [(tma7d85a7cc26d3b1c4eac409f958562c0 *)self gasGaugeBatteryTemperature];
  uint64_t v4 = qword_1000AABD4;
  int v6 = dword_1000AABDC;
  int v5 = dword_1000AABE0;
  double v7 = (double)(int)qword_1000AABE4;
  double v8 = (double)dword_1000AAC60;
  unsigned int v9 = (int)((double)v3 * 0.53
           + 130.8
           + (double)(int)qword_1000AABE4 * -0.24
           + (double)self->_filteredBacklightCurrentLI2 * 0.01
           + (double)dword_1000AAC60 * 0.65);
  self->super.baseVT[0] = v9;
  self->super.baseVT[1] = (int)((double)v3 * 0.54
                              + 282.1
                              + v7 * -0.22
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.61);
  self->super.baseVT[2] = (int)((double)v3 * 0.83
                              + 364.2
                              + v7 * -0.29
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.39);
  self->super.baseVT[3] = (int)((double)v3
                              + 334.9
                              + v7 * -0.35
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.27);
  self->super.baseVT[4] = (int)((double)v3 * 1.1 + 291.9 + (double)v6 * 0.07 + v7 * -0.43 + v8 * 0.17);
  self->super.baseVT[5] = (int)((double)v3 * 0.48
                              + -5.4
                              + (double)v6 * 0.14
                              + v7 * -0.04
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.4);
  self->super.baseVT[6] = (int)((double)v3 * 0.63
                              + 80.9
                              + (double)v6 * 0.14
                              + v7 * -0.12
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.32);
  self->super.baseVT[7] = (int)((double)v3 * 0.76
                              + 135.7
                              + (double)v6 * 0.15
                              + v7 * -0.19
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.23);
  self->super.baseVT[8] = (int)((double)v3 * 0.84
                              + 179.1
                              + (double)v6 * 0.17
                              + v7 * -0.25
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.17);
  self->super.baseVT[9] = (int)((double)v3 * 1.14
                              + 100.9
                              + (double)(int)v4 * -0.39
                              + (double)v6 * 0.54
                              + v7 * -0.41
                              + v8 * 0.1);
  self->super.baseVT[10] = (int)((double)v3 * 0.44
                               + -96.5
                               + (double)v6 * 0.35
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01
                               + v8 * 0.2);
  self->super.baseVT[11] = (int)((double)v3 * 0.52
                               + -10.6
                               + (double)v6 * 0.29
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01
                               + v8 * 0.15);
  self->super.baseVT[12] = (int)((double)v3
                               + 65.0
                               + (double)v6 * 0.19
                               + (double)v5 * 0.15
                               + v7 * -0.36
                               + (double)self->_filteredMaxRadioTemp * -0.04);
  self->super.baseVT[13] = (int)((double)v3 * 1.07
                               + 220.4
                               + (double)SHIDWORD(v4) * 0.35
                               + v7 * -0.5
                               + (double)self->_filteredBacklightCurrentLI2 * 0.0);
  self->super.baseVT[14] = (int)((double)v3 * 0.93
                               + 170.0
                               + (double)v6 * 0.27
                               + v7 * -0.28
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[15] = (int)((double)v3 * 0.74
                               + 10.9
                               + (double)v6 * 0.39
                               + (double)v5 * 0.25
                               + v7 * -0.41
                               + (double)self->_filteredBacklightCurrentLI2 * 0.0);
  self->super.baseVT[16] = (int)((double)v3 * 0.7
                               + -37.1
                               + (double)v6 * 0.48
                               + v7 * -0.21
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[17] = (int)((double)v3 * 0.77
                               + -2.1
                               + (double)v6 * 0.47
                               + v7 * -0.28
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[18] = (int)((double)v3 * 0.85
                               + 30.5
                               + (double)v6 * 0.39
                               + v7 * -0.28
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[19] = (int)((double)v3 * 0.98
                               + 112.4
                               + (double)v6 * 0.31
                               + (double)v5 * 0.12
                               + v7 * -0.48
                               + (double)self->_filteredBacklightCurrentLI2 * 0.0);
  self->super.baseVT[20] = (int)((double)v3 * 0.86
                               + 122.7
                               + (double)(int)v4 * 0.21
                               + (double)v6 * 0.32
                               + (double)v5 * 0.29
                               + v7 * -0.73);
  self->super.baseVT[21] = (int)((double)v3 * 0.75
                               + 96.4
                               + (double)(int)v4 * 0.51
                               + (double)v5 * 0.24
                               + v7 * -0.56
                               + (double)self->_filteredBacklightCurrentLI2 * 0.0);
  self->super.baseVT[22] = (int)((double)v3 * 1.07
                               + 55.0
                               + (double)SHIDWORD(v4) * -0.16
                               + (double)v6 * 0.16
                               + (double)v5 * 0.34
                               + v7 * -0.42);
  self->super.baseVT[23] = (int)((double)v3 * 0.82
                               + 122.3
                               + (double)(int)v4 * 0.53
                               + (double)v5 * 0.17
                               + v7 * -0.59
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[24] = (int)((double)v3 * 0.92
                               + 124.8
                               + (double)(int)v4 * 0.48
                               + (double)v5 * 0.16
                               + v7 * -0.65
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
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