@interface tm48f05d1771cf4a49db2ccd3808afb48c
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

@implementation tm48f05d1771cf4a49db2ccd3808afb48c

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm48f05d1771cf4a49db2ccd3808afb48c;
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
  int v5 = [(tm48f05d1771cf4a49db2ccd3808afb48c *)self gasGaugeBatteryTemperature];
  int v6 = HIDWORD(qword_1000AACD4);
  int v49 = dword_1000AACE4;
  int v7 = dword_1000AAD84;
  int v50 = qword_1000AAD88;
  int v51 = qword_1000AACD4;
  int v8 = HIDWORD(qword_1000AAD94);
  int v9 = qword_1000AAD9C;
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
    [(tm48f05d1771cf4a49db2ccd3808afb48c *)self resetVTFilterState];
  }
  unsigned int v12 = [[self findComponent:0] currentLoadingIndex];
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  float v14 = (double)(int)(v12 * v12) / 100.0;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v14 = (float)filteredBacklightCurrentLI2 + (float)((float)(v14 - (float)filteredBacklightCurrentLI2) * 0.14286);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v14;
  if (v8 <= v9) {
    int v15 = v9;
  }
  else {
    int v15 = v8;
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
  sub_100031714(56, (int)((double)v6 * 0.2962+ 35.0+ (double)v7 * 0.6829+ (double)self->_filteredTempRearCameraDieWithDefault * -0.005));
  sub_100031714(54, (int)((double)v5 * 0.102 + 100.0 + (double)v49 * 0.513 + (double)v7 * 0.35));
  sub_100031714(55, v10);
  sub_100031714(61, (int)((double)self->_filteredBacklightCurrentLI2 * 0.366+ 129.7+ (double)v7 * 0.589+ (double)v50 * 0.338));
  sub_100031714(60, (int)((double)self->_filteredBacklightCurrentLI2 * 5.5+ 120.0+ (double)v5 * -0.175+ (double)v7 * 0.16+ (double)v50 * 0.927));
  sub_100031714(57, (int)((double)v5 * 0.19 + 300.0 + (double)v6 * 0.68));
  sub_100031714(58, (int)((double)v5 * 0.59 + 33.0 + (double)v49 * 0.41));
  sub_100031714(59, (int)((double)self->_filteredBacklightCurrentLI2 * 0.437+ 152.3+ (double)v6 * -0.493+ (double)v7 * 1.479+ (double)self->_filteredTempRearCameraDieWithDefault * 0.0223));
  sub_100031714(63, (int)((double)v5 * -0.132 + 130.0 + (double)v51 * 0.089 + (double)v50 * 1.021));
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
  block[2] = sub_10001FA74;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000AA040 != -1) {
    dispatch_once(&qword_1000AA040, block);
  }
  return self->gridX;
}

- (id)getGridY
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FB50;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000AA048 != -1) {
    dispatch_once(&qword_1000AA048, block);
  }
  return self->gridY;
}

- (int)compute2DGridTemps
{
  int v3 = [(tm48f05d1771cf4a49db2ccd3808afb48c *)self gasGaugeBatteryTemperature];
  int v5 = HIDWORD(qword_1000AACD4);
  int v4 = qword_1000AACD4;
  int v6 = dword_1000AACE4;
  double v7 = (double)SHIDWORD(qword_1000AACDC);
  double v8 = (double)dword_1000AAD84;
  double v9 = (double)(int)qword_1000AAD88;
  int32x2_t v10 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000685F0, (float64x2_t)xmmword_1000685E0, (double)SHIDWORD(qword_1000AACDC)), (float64x2_t)xmmword_100068600, (double)dword_1000AAD84), (float64x2_t)xmmword_100068610, (double)(int)qword_1000AAD88)));
  *(int32x2_t *)self->super.baseVT = v10;
  self->super.baseVT[2] = (int)(v7 * -0.205 + 12.2 + v8 * 1.06 + v9 * 0.106);
  *(int32x2_t *)&self->super.baseVT[3] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068630, (float64x2_t)xmmword_100068620, v7), (float64x2_t)xmmword_100068640, v8)));
  self->super.baseVT[5] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.236
                              + 135.4
                              + v8 * 0.7335
                              + v9 * 0.268
                              + v7 * -0.0835);
  self->super.baseVT[6] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.46
                              + 117.6
                              + v8 * 0.7605
                              + v9 * 0.2455
                              + v7 * -0.079);
  self->super.baseVT[7] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.352
                              + 73.1
                              + v8 * 0.815
                              + v9 * 0.1985
                              + v7 * -0.0685);
  self->super.baseVT[8] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.105
                              + -4.713
                              + (double)v5 * -0.065
                              + v7 * -0.026
                              + v8 * 0.944
                              + v9 * 0.126);
  self->super.baseVT[9] = (int)((double)self->_filteredBacklightCurrentLI2 * -0.0745
                              + -48.05
                              + v8 * 1.12
                              + v9 * 0.051
                              + (double)v5 * -0.1715);
  self->super.baseVT[10] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.544 + 202.0 + v8 * 0.485 + v9 * 0.408);
  self->super.baseVT[11] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.825 + 200.0 + v8 * 0.505 + v9 * 0.392);
  self->super.baseVT[12] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.366 + 129.7 + v8 * 0.589 + v9 * 0.338);
  self->super.baseVT[13] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.85 + 102.0 + v8 * 0.664 + v9 * 0.285);
  self->super.baseVT[14] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.562
                               + 69.1
                               + (double)v6 * 0.177
                               + v8 * 0.521
                               + v9 * 0.252);
  self->super.baseVT[15] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.917 + 215.7 + v8 * 0.298 + v9 * 0.603);
  self->super.baseVT[16] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.112 + 214.4 + v8 * 0.308 + v9 * 0.599);
  self->super.baseVT[17] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.075 + 236.0 + v8 * 0.328 + v9 * 0.579);
  self->super.baseVT[18] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.12
                               + 241.0
                               + (double)v3 * 0.086
                               + v8 * 0.317
                               + v9 * 0.5);
  self->super.baseVT[19] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.8
                               + 255.0
                               + (double)v3 * 0.11
                               + v8 * 0.33
                               + v9 * 0.46);
  self->super.baseVT[20] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.791
                               + 201.0
                               + (double)v3 * -0.175
                               + v8 * 0.16
                               + v9 * 0.927);
  self->super.baseVT[21] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.25 + 189.0 + v8 * 0.106 + v9 * 0.832);
  self->super.baseVT[22] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.366 + 129.0 + v8 * 0.589 + v9 * 0.338);
  *(int32x2_t *)&self->super.baseVT[23] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068660, (float64x2_t)xmmword_100068650, (double)v3), (float64x2_t)xmmword_100068670, (double)v4), (float64x2_t)xmmword_100068680, v8), (float64x2_t)xmmword_100068690, v9)));
  int32x4_t v11 = vdupq_lane_s32(v10, 0);
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