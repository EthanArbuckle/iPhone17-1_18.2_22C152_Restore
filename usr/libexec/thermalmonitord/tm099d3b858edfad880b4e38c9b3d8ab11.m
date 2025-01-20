@interface tm099d3b858edfad880b4e38c9b3d8ab11
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

@implementation tm099d3b858edfad880b4e38c9b3d8ab11

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm099d3b858edfad880b4e38c9b3d8ab11;
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
  self->_filteredTempRearCameraDieWithDefault = -1;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000AACCC;
}

- (int)arcModuleTemperature
{
  return HIDWORD(qword_1000AAD8C);
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  BOOL v3 = a3;
  int v49 = [(tm099d3b858edfad880b4e38c9b3d8ab11 *)self gasGaugeBatteryTemperature];
  int v5 = dword_1000AACE4;
  int v6 = dword_1000AAD84;
  int v50 = HIDWORD(qword_1000AACD4);
  int v51 = qword_1000AAD88;
  int v52 = unk_1000AAD90;
  int v8 = HIDWORD(qword_1000AAD94);
  int v7 = qword_1000AAD9C;
  int v9 = HIDWORD(qword_1000AAD9C);
  uint64_t v10 = [+[SensorDispatcherHelper sharedInstance] getTemperatureFromSMCForKey:@"TV0s"];
  if ((int)v10 <= -2501)
  {
    v11 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055AA4(v11);
    }
    uint64_t v10 = 4294967196;
  }
  if (v3) {
    [(tm099d3b858edfad880b4e38c9b3d8ab11 *)self resetVTFilterState];
  }
  unsigned int v12 = [[self findComponent:0] currentLoadingIndex];
  float v13 = (double)(int)(v12 * v12) / 100.0;
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v13 = (float)filteredBacklightCurrentLI2 + (float)((float)(v13 - (float)filteredBacklightCurrentLI2) * 0.076923);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v13;
  if (v8 <= v7) {
    int v15 = v7;
  }
  else {
    int v15 = v8;
  }
  if (v15 <= v9) {
    int v15 = v9;
  }
  int v16 = v15 & ~(v15 >> 31);
  int filteredTempRearCameraDieWithDefault = self->_filteredTempRearCameraDieWithDefault;
  if ((filteredTempRearCameraDieWithDefault & 0x80000000) == 0) {
    int v16 = (int)(float)((float)filteredTempRearCameraDieWithDefault
  }
                     + (float)((float)(v16 - filteredTempRearCameraDieWithDefault) * 0.16667));
  self->_int filteredTempRearCameraDieWithDefault = v16;
  id v18 = [(CommonProduct *)self findComponent:18];
  float v19 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v20 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v21 = v20;
  *(float *)&double v20 = v19;
  [v18 calculateControlEffort:v20 trigger:v21];
  sub_100031714(56, (int)((double)v5 * 0.299+ 6.19+ (double)v6 * 0.686+ (double)self->_filteredTempRearCameraDieWithDefault * -0.0193));
  sub_100031714(54, (int)((double)v49 * 0.29 + 11.0 + (double)v50 * 0.67));
  sub_100031714(55, v10);
  sub_100031714(61, (int)((double)v5 * 0.22+ 284.0+ (double)v6 * 0.2+ (double)v51 * 0.48+ (double)self->_filteredBacklightCurrentLI2 * 1.73));
  sub_100031714(63, (int)((double)v5 * 0.07 + 214.5 + (double)v51 * 0.893 + (double)(v52 & ~(v52 >> 31)) * 0.0046));
  sub_100031714(59, (int)((double)v5 * -0.68 + -184.0 + (double)v6 * 1.73));
  sub_100031714(57, (int)((double)v49 * 0.52 + 16.0 + (double)v50 * 0.45));
  sub_100031714(58, (int)((double)v49 * 0.37 + 28.0 + (double)v50 * 0.59));
  sub_100031714(60, (int)((double)self->_filteredBacklightCurrentLI2 * 0.655+ 274.0+ (double)v49 * 0.00135+ (double)v51 * 0.949));
  float v22 = (float)(int)qword_1000AADAC;
  id v23 = [(CommonProduct *)self findComponent:19];
  float v24 = v22 / 100.0;
  *(float *)&double v25 = v24;
  [v23 calculateControlEffort:v25];
  id v26 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v27 = v24;
  [v26 calculateControlEffort:v27];
  float v28 = (float)dword_1000AADBC;
  id v29 = [(CommonProduct *)self findComponent:21];
  float v30 = v28 / 100.0;
  *(float *)&double v31 = v30;
  [v29 calculateControlEffort:v31];
  id v32 = [(CommonProduct *)self findComponent:26];
  *(float *)&double v33 = v30;
  [v32 calculateControlEffort:v33];
  float v34 = (float)SHIDWORD(qword_1000AADB4);
  id v35 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v36 = v34 / 100.0;
  [v35 calculateControlEffort:v36];
  float v37 = (float)dword_1000AADC8;
  id v38 = [(CommonProduct *)self findComponent:23];
  *(float *)&double v39 = v37 / 100.0;
  [v38 calculateControlEffort:v39];
  float v40 = (float)SHIDWORD(qword_1000AADAC);
  id v41 = [(CommonProduct *)self findComponent:24];
  float v42 = v40 / 100.0;
  *(float *)&double v43 = v42;
  [v41 calculateControlEffort:v43];
  id v44 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v45 = v42;
  [v44 calculateControlEffort:v45];
  if ([(CommonProduct *)self getChargerState])
  {
    float v46 = (float)dword_1000AADA8;
    id v47 = [(CommonProduct *)self findComponent:27];
    *(float *)&double v48 = v46 / 100.0;
  }
  else
  {
    id v47 = [(CommonProduct *)self findComponent:27];
    LODWORD(v48) = 30.0;
  }
  [v47 calculateControlEffort:v48];
}

- (id)getGridX
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003AF58;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000AA6F8 != -1) {
    dispatch_once(&qword_1000AA6F8, block);
  }
  return self->gridX;
}

- (id)getGridY
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B034;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000AA700 != -1) {
    dispatch_once(&qword_1000AA700, block);
  }
  return self->gridY;
}

- (int)compute2DGridTemps
{
  int v3 = [(tm099d3b858edfad880b4e38c9b3d8ab11 *)self gasGaugeBatteryTemperature];
  double v4 = (double)dword_1000AAD84;
  double v5 = (double)(int)qword_1000AAD88;
  double v6 = (double)SHIDWORD(qword_1000AACDC);
  int v8 = HIDWORD(qword_1000AACD4);
  int v7 = qword_1000AACD4;
  int32x2_t v9 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068E70, (float64x2_t)xmmword_100068E60, (double)dword_1000AAD84), (float64x2_t)xmmword_100068E80, (double)(int)qword_1000AAD88), (float64x2_t)vdupq_n_s64(0xBFCC28F5C28F5C29), (double)SHIDWORD(qword_1000AACDC))));
  int v10 = (int)((double)dword_1000AAD84 * 1.12
            + 89.0
            + (double)(int)qword_1000AAD88 * 0.05
            + (double)SHIDWORD(qword_1000AACDC) * -0.21);
  *(int32x2_t *)self->super.baseVT = v9;
  self->super.baseVT[2] = v10;
  *(int32x2_t *)&self->super.baseVT[3] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068EA0, (float64x2_t)xmmword_100068E90, v4), (float64x2_t)vdupq_n_s64(0xBFCD70A3D70A3D71), v6)));
  self->super.baseVT[5] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.76
                              + 148.0
                              + v4 * 0.78
                              + v5 * 0.22
                              + v6 * -0.08);
  self->super.baseVT[6] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.795
                              + 130.5
                              + v4 * 0.815
                              + v5 * 0.185
                              + v6 * -0.08);
  self->super.baseVT[7] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.625
                              + 89.0
                              + v4 * 0.865
                              + v5 * 0.135
                              + v6 * -0.065);
  self->super.baseVT[8] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.546
                              + -11.4
                              + (double)v3 * 0.256
                              + (double)self->_filteredTempRearCameraDieWithDefault * 0.136
                              + v4 * 0.498
                              + v5 * 0.078);
  self->super.baseVT[9] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.25
                              + -45.5
                              + v4 * 1.17
                              + v5 * 0.035
                              + (double)v8 * -0.22);
  self->super.baseVT[10] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.53
                               + 106.0
                               + (double)v3 * 0.14
                               + v4 * 0.45
                               + v5 * 0.3);
  self->super.baseVT[11] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.66
                               + 93.0
                               + (double)v3 * 0.19
                               + v4 * 0.47
                               + v5 * 0.24);
  self->super.baseVT[12] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.11 + 176.0 + v4 * 0.61 + v5 * 0.3);
  self->super.baseVT[13] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.45
                               + 90.0
                               + v6 * 0.06
                               + v4 * 0.63
                               + v5 * 0.23);
  self->super.baseVT[14] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.86
                               + 25.0
                               + (double)v3 * 0.33
                               + v6 * 0.08
                               + v4 * 0.53);
  self->super.baseVT[15] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.8
                               + 132.0
                               + (double)v3 * 0.18
                               + v4 * 0.24
                               + v5 * 0.48);
  self->super.baseVT[16] = (int)((double)self->_filteredBacklightCurrentLI2 * 2.04
                               + 128.0
                               + (double)v3 * 0.24
                               + v4 * 0.23
                               + v5 * 0.42);
  self->super.baseVT[17] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.98
                               + 136.0
                               + (double)v3 * 0.33
                               + v4 * 0.22
                               + v5 * 0.35);
  self->super.baseVT[18] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.9
                               + 134.0
                               + (double)v3 * 0.41
                               + v4 * 0.2
                               + v5 * 0.3);
  self->super.baseVT[19] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.11
                               + 110.0
                               + (double)v3 * 0.42
                               + v4 * 0.26
                               + v5 * 0.23);
  self->super.baseVT[20] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.42
                               + 161.0
                               + (double)v7 * -0.12
                               + v4 * 0.28
                               + v5 * 0.77);
  self->super.baseVT[21] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.63
                               + 133.0
                               + (double)v3 * 0.68
                               + v6 * -0.09
                               + v5 * 0.35);
  self->super.baseVT[22] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.27 + 309.0 + v4 * 0.2 + v5 * 0.7);
  self->super.baseVT[23] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.64
                               + 141.0
                               + (double)v3 * 0.83
                               + v6 * -0.11
                               + v5 * 0.21);
  self->super.baseVT[24] = (int)((double)v3 * 0.64 + 6.0 + v6 * -0.28 + v4 * 0.44 + v5 * 0.18);
  int32x4_t v11 = vdupq_lane_s32(v9, 0);
  uint64_t v12 = 1;
  int32x4_t v13 = v11;
  do
  {
    int32x4_t v14 = *(int32x4_t *)&self->super.baseVT[v12];
    int32x4_t v11 = vminq_s32(v11, v14);
    int32x4_t v13 = vmaxq_s32(v13, v14);
    v12 += 4;
  }
  while (v12 != 25);
  sub_100031714(62, (vmaxvq_s32(v13) - vminvq_s32(v11)));
  return self->super.baseVT;
}

- (void)updateCoreAnalyticsInfo
{
}

@end