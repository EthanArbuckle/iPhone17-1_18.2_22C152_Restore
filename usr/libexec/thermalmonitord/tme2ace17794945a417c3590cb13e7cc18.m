@interface tme2ace17794945a417c3590cb13e7cc18
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

@implementation tme2ace17794945a417c3590cb13e7cc18

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tme2ace17794945a417c3590cb13e7cc18;
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
  self->_tsrrTransitionStepCount = 0;
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
  int v5 = [(tme2ace17794945a417c3590cb13e7cc18 *)self gasGaugeBatteryTemperature];
  int v6 = HIDWORD(qword_1000AABD4);
  int v7 = dword_1000AABDC;
  int v61 = dword_1000AABE0;
  int v62 = qword_1000AABD4;
  int v60 = qword_1000AABE4;
  int v8 = dword_1000AAC60;
  int v63 = dword_1000AAC64;
  unsigned int v64 = [(CommonProduct *)self getChargerState];
  if (v3) {
    [(tme2ace17794945a417c3590cb13e7cc18 *)self resetVTFilterState];
  }
  unsigned int v9 = [[self findComponent:0] currentLoadingIndex];
  float v10 = (double)(int)(v9 * v9) / 100.0;
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v10 = (float)filteredBacklightCurrentLI2 + (float)((float)(v10 - (float)filteredBacklightCurrentLI2) * 0.14286);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v10;
  int v12 = qword_1000AAD88;
  if ((int)qword_1000AAD88 <= SHIDWORD(qword_1000AAD88)) {
    int v12 = HIDWORD(qword_1000AAD88);
  }
  int v13 = v12 & ~(v12 >> 31);
  int filteredMaxRadioTemp = self->_filteredMaxRadioTemp;
  if ((filteredMaxRadioTemp & 0x80000000) == 0) {
    int v13 = (int)(float)((float)filteredMaxRadioTemp + (float)((float)(v13 - filteredMaxRadioTemp) * 0.25));
  }
  self->_int filteredMaxRadioTemp = v13;
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
  sub_100031714(51, (int)((double)v5 * 0.14+ -58.0+ (double)v6 * 0.03+ (double)v7 * 0.64+ (double)v8 * 0.16+ (double)self->_filteredMaxRadioTemp * -0.11));
  sub_100031714(49, (int)((double)v5 * 0.39+ -10.0+ (double)v6 * 0.55+ (double)v7 * 0.38+ (double)v60 * -0.33+ (double)self->_filteredMaxRadioTemp * -0.07));
  sub_100031714(50, (int)((double)v5 * 0.53 + -114.0 + (double)v7 * 0.46 + (double)v61 * 0.31 + (double)v60 * -0.29));
  sub_100031714(53, (int)((double)v62 * 1.89+ 71.0+ (double)v7 * -1.09+ (double)v60 * 0.16+ (double)self->_filteredMaxCameraTemp * -0.06));
  sub_100031714(58, (int)((double)v5 * 0.76+ 156.0+ (double)v7 * 0.59+ (double)v60 * -0.43+ (double)self->_filteredBacklightCurrentLI2 * 0.01+ (double)self->_filteredMaxRadioTemp * -0.11));
  sub_100031714(57, (int)((double)v61 * 0.18+ -40.0+ (double)v60 * -0.26+ (double)v8 * 1.13+ (double)self->_filteredBacklightCurrentLI2 * 0.02+ (double)(v63 & ~(v63 >> 31)) * -0.04));
  sub_100031714(60, (int)((double)v8 * 0.89 + -29.0 + (double)v7 * 0.04 + (double)v61 * -0.09 + (double)v60 * 0.14));
  sub_100031714(52, (int)((double)v7 * 0.57+ -391.0+ (double)v61 * -0.47+ (double)v60 * 0.88+ (double)self->_filteredMaxRadioTemp * -0.09));
  sub_100031714(56, (int)((double)v62 * 2.51+ -131.0+ (double)v7 * -1.97+ (double)v8 * 0.41+ (double)self->_filteredBacklightCurrentLI2 * 0.02));
  sub_100031714(54, 3000);
  sub_100031714(55, 3000);
  int tsrrTransitionStepCount = self->_tsrrTransitionStepCount;
  if (v64 == 10)
  {
    if (tsrrTransitionStepCount >= 10)
    {
      LODWORD(v25) = qword_1000AAD9C;
      goto LABEL_23;
    }
    int v24 = 1;
  }
  else
  {
    if (tsrrTransitionStepCount <= 0)
    {
      uint64_t v25 = qword_1000AAD9C;
      goto LABEL_25;
    }
    int v24 = -1;
  }
  tsrrTransitionStepCount += v24;
  self->_int tsrrTransitionStepCount = tsrrTransitionStepCount;
  uint64_t v25 = qword_1000AAD9C;
  if (tsrrTransitionStepCount >= 1) {
LABEL_23:
  }
    uint64_t v25 = ((HIDWORD(qword_1000AAD94) - (int)v25) * tsrrTransitionStepCount / 10 + v25);
LABEL_25:
  sub_100031714(52, v25);
  float v26 = (float)SHIDWORD(qword_1000AAD94);
  id v27 = [(CommonProduct *)self findComponent:19];
  float v28 = v26 / 100.0;
  *(float *)&double v29 = v28;
  [v27 calculateControlEffort:v29];
  id v30 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v31 = v28;
  [v30 calculateControlEffort:v31];
  float v32 = (float)SHIDWORD(qword_1000AADAC);
  id v33 = [(CommonProduct *)self findComponent:21];
  float v34 = v32 / 100.0;
  *(float *)&double v35 = v34;
  [v33 calculateControlEffort:v35];
  id v36 = [(CommonProduct *)self findComponent:23];
  *(float *)&double v37 = v34;
  [v36 calculateControlEffort:v37];
  float v38 = (float)dword_1000AADBC;
  id v39 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v40 = v38 / 100.0;
  [v39 calculateControlEffort:v40];
  float v41 = (float)(int)qword_1000AAD9C;
  id v42 = [(CommonProduct *)self findComponent:24];
  *(float *)&double v43 = v41 / 100.0;
  [v42 calculateControlEffort:v43];
  float v44 = (float)SHIDWORD(qword_1000AAD9C);
  id v45 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v46 = v44 / 100.0;
  [v45 calculateControlEffort:v46];
  float v47 = (float)dword_1000AADA4;
  id v48 = [(CommonProduct *)self findComponent:26];
  *(float *)&double v49 = v47 / 100.0;
  [v48 calculateControlEffort:v49];
  float v50 = (float)dword_1000AADA8;
  id v51 = [(CommonProduct *)self findComponent:27];
  *(float *)&double v52 = v50 / 100.0;
  [v51 calculateControlEffort:v52];
  if (!v64)
  {
    id v54 = [(CommonProduct *)self findComponent:28];
    LODWORD(v55) = 30.0;
    goto LABEL_29;
  }
  float v53 = (float)(int)qword_1000AAD94;
  if (v64 == 10)
  {
    id v54 = [(CommonProduct *)self findComponent:28];
    *(float *)&double v55 = v53 / 100.0;
LABEL_29:
    [v54 calculateControlEffort:v55];
    id v56 = [(CommonProduct *)self findComponent:29];
    LODWORD(v57) = 30.0;
    goto LABEL_33;
  }
  if (v64 - 30 > 0x28 || ((1 << (v64 - 30)) & 0x10040100001) == 0) {
    return;
  }
  id v58 = [(CommonProduct *)self findComponent:28];
  LODWORD(v59) = 30.0;
  [v58 calculateControlEffort:v59];
  id v56 = [(CommonProduct *)self findComponent:29];
  *(float *)&double v57 = v53 / 100.0;
LABEL_33:

  [v56 calculateControlEffort:v57];
}

- (id)getGridX
{
  return &off_10008D8F8;
}

- (id)getGridY
{
  return &off_10008D910;
}

- (int)compute2DGridTemps
{
  int v3 = [(tme2ace17794945a417c3590cb13e7cc18 *)self gasGaugeBatteryTemperature];
  int v4 = dword_1000AABDC;
  int v5 = dword_1000AAC64;
  double v6 = (double)(int)qword_1000AABD4;
  double v7 = (double)SHIDWORD(qword_1000AABD4);
  double v8 = (double)dword_1000AABE0;
  double v9 = (double)(int)qword_1000AABE4;
  double v10 = (double)dword_1000AAC60;
  int32x2_t v11 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068FD0, (float64x2_t)xmmword_100068FC0, (double)(int)qword_1000AABD4), (float64x2_t)xmmword_100068FE0, (double)SHIDWORD(qword_1000AABD4)), (float64x2_t)xmmword_100068FF0, (double)dword_1000AABE0), (float64x2_t)xmmword_100069000, (double)(int)qword_1000AABE4), (float64x2_t)xmmword_100069010, (double)dword_1000AAC60)));
  *(int32x2_t *)self->super.baseVT = v11;
  self->super.baseVT[2] = (int)((double)v3 * 0.54
                              + -4.5
                              + v6 * 0.81
                              + v8 * 0.17
                              + v9 * -0.56
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[3] = (int)(v6 * 2.0
                              + -138.6
                              + v7 * -0.29
                              + (double)v4 * -1.16
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02
                              + v10 * 0.39);
  self->super.baseVT[4] = (int)(v6 * 2.11
                              + -97.8
                              + (double)v4 * -1.45
                              + v9 * -0.2
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v10 * 0.47);
  self->super.baseVT[5] = (int)((double)v3 * 0.42
                              + 58.0
                              + (double)v4 * 0.88
                              + v9 * -0.33
                              + (double)self->_filteredMaxRadioTemp * -0.16);
  self->super.baseVT[6] = (int)((double)v3 * 0.48
                              + -61.0
                              + (double)v4 * 0.62
                              + v9 * -0.13
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[7] = (int)((double)v3 * 0.56
                              + -53.4
                              + v6 * 0.57
                              + v9 * -0.15
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[8] = (int)((double)v3 * 0.69
                              + -44.9
                              + v6 * 0.61
                              + v9 * -0.34
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[9] = (int)((double)v3 * 0.72
                              + 23.2
                              + v6 * 0.58
                              + v9 * -0.37
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[10] = (int)((double)v3 * 0.37
                               + 28.6
                               + (double)v4 * 0.3
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01
                               + v10 * 0.28);
  self->super.baseVT[11] = (int)((double)v3 * 0.77
                               + -83.3
                               + (double)v4 * 0.43
                               + v9 * -0.22
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[12] = (int)((double)v3 * 0.76
                               + 156.0
                               + (double)v4 * 0.59
                               + v9 * -0.43
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01
                               + (double)self->_filteredMaxRadioTemp * -0.11);
  self->super.baseVT[13] = (int)((double)v3 * 0.89
                               + -42.0
                               + (double)v4 * 0.42
                               + v9 * -0.34
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[14] = (int)((double)v3 * 1.02 + -45.6 + v7 * 0.46 + (double)v4 * 0.27 + v9 * -0.76);
  self->super.baseVT[15] = (int)((double)v3 * 0.47
                               + -53.8
                               + (double)v4 * 0.21
                               + v9 * -0.18
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.48);
  self->super.baseVT[16] = (int)((double)v3 * 0.45
                               + -47.0
                               + (double)v4 * 0.2
                               + v9 * -0.17
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.5);
  self->super.baseVT[17] = (int)((double)v3 * 1.1
                               + -4.8
                               + v7 * 0.69
                               + v8 * -0.13
                               + v9 * -0.67
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[18] = (int)((double)v3 * 1.1
                               + 10.9
                               + v7 * 0.69
                               + v8 * -0.12
                               + v9 * -0.69
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[19] = (int)((double)v3 * 1.11
                               + -1.5
                               + v7 * 0.45
                               + (double)v4 * 0.15
                               + v9 * -0.73
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[20] = (int)((double)v3 * 0.41
                               + -75.0
                               + v7 * 0.27
                               + v9 * -0.43
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.74);
  self->super.baseVT[21] = (int)(v6 * -0.28
                               + 90.4
                               + (double)v4 * 0.34
                               + v9 * -0.11
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 1.03);
  self->super.baseVT[22] = (int)(v8 * 0.18
                               + -40.0
                               + v9 * -0.26
                               + v10 * 1.13
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + (double)(v5 & ~(v5 >> 31)) * -0.04);
  self->super.baseVT[23] = (int)(v7 * -0.65
                               + 166.5
                               + (double)v4 * 0.37
                               + v8 * 0.28
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.96);
  self->super.baseVT[24] = (int)((double)v3 * 0.53
                               + -21.4
                               + (double)v4 * 0.24
                               + v9 * -0.37
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.58);
  int32x4_t v12 = vdupq_lane_s32(v11, 0);
  uint64_t v13 = 1;
  int32x4_t v14 = v12;
  do
  {
    int32x4_t v15 = *(int32x4_t *)&self->super.baseVT[v13];
    int32x4_t v12 = vminq_s32(v12, v15);
    int32x4_t v14 = vmaxq_s32(v14, v15);
    v13 += 4;
  }
  while (v13 != 25);
  sub_100031714(59, (vmaxvq_s32(v14) - vminvq_s32(v12)));
  return self->super.baseVT;
}

- (void)updateCoreAnalyticsInfo
{
}

@end