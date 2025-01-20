@interface tm828a342ad9cfe9c0b3cf1b7aa4d65404
- (id)initProduct:(id)a3;
- (int)arcModuleTemperature;
- (int)computeMaxCGTemp;
- (int)gasGaugeBatteryTemperature;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm828a342ad9cfe9c0b3cf1b7aa4d65404

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm828a342ad9cfe9c0b3cf1b7aa4d65404;
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
  self->_filteredTempRearCameraDie = -1;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000AACCC;
}

- (int)arcModuleTemperature
{
  return 3000;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(tm828a342ad9cfe9c0b3cf1b7aa4d65404 *)self gasGaugeBatteryTemperature];
  int v6 = HIDWORD(qword_1000AACCC);
  int v7 = qword_1000AACD4;
  int v8 = HIDWORD(qword_1000AACD4);
  uint64_t v9 = [+[SensorDispatcherHelper sharedInstance] getTemperatureFromSMCForKey:@"TV0s"];
  if ((int)v9 <= -2501)
  {
    v10 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055AA4(v10);
    }
    uint64_t v9 = 4294967196;
  }
  if (v3) {
    [(tm828a342ad9cfe9c0b3cf1b7aa4d65404 *)self resetVTFilterState];
  }
  unsigned int v11 = [[self findComponent:0] currentLoadingIndex];
  float v12 = (double)(int)(v11 * v11) / 100.0;
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v12 = (float)filteredBacklightCurrentLI2 + (float)((float)(v12 - (float)filteredBacklightCurrentLI2) * 0.33333);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v12;
  id v14 = [(CommonProduct *)self findComponent:18];
  float v15 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v16 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v17 = v16;
  *(float *)&double v16 = v15;
  [v14 calculateControlEffort:v16 trigger:v17];
  sub_100031714(46, (int)((double)v7 * 0.55 + -33.0 + (double)v8 * 0.11));
  sub_100031714(44, (int)((double)v7 * 0.57 + -30.0 + (double)v8 * 0.09));
  sub_100031714(50, (int)((double)v6 * 0.11 + -54.0 + (double)v8 * 0.24));
  sub_100031714(51, (int)((double)v5 * 1.27 + -108.08 + (double)v7 * -0.23));
  sub_100031714(48, (int)((double)v5 * -0.79 + 199.0 + (double)v7 * 0.6));
  sub_100031714(47, (int)((double)v7 * 0.26 + -87.0 + (double)v8 * 0.51));
  sub_100031714(49, (int)((double)v6 * -0.02 + 61.0 + (double)self->_filteredBacklightCurrentLI2 * 7.56));
  sub_100031714(45, v9);
  float v18 = (float)dword_1000AAD84;
  id v19 = [(CommonProduct *)self findComponent:19];
  float v20 = v18 / 100.0;
  *(float *)&double v21 = v20;
  [v19 calculateControlEffort:v21];
  id v22 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v23 = v20;
  [v22 calculateControlEffort:v23];
  float v24 = (float)unk_1000AAD90;
  id v25 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v26 = v24 / 100.0;
  [v25 calculateControlEffort:v26];
  float v27 = (float)SHIDWORD(qword_1000AAD88);
  id v28 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v29 = v27 / 100.0;
  [v28 calculateControlEffort:v29];
  float v30 = (float)SHIDWORD(qword_1000AAD94);
  id v31 = [(CommonProduct *)self findComponent:23];
  *(float *)&double v32 = v30 / 100.0;
  [v31 calculateControlEffort:v32];
  float v33 = (float)(int)qword_1000AAD88;
  id v34 = [(CommonProduct *)self findComponent:24];
  float v35 = v33 / 100.0;
  *(float *)&double v36 = v35;
  [v34 calculateControlEffort:v36];
  id v37 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v38 = v35;
  [v37 calculateControlEffort:v38];
  if ([(CommonProduct *)self getChargerState])
  {
    float v39 = (float)dword_1000AAD80;
    id v40 = [(CommonProduct *)self findComponent:26];
    *(float *)&double v41 = v39 / 100.0;
  }
  else
  {
    id v40 = [(CommonProduct *)self findComponent:26];
    LODWORD(v41) = 30.0;
  }
  [v40 calculateControlEffort:v41];
}

- (int)computeMaxCGTemp
{
  if ((int)qword_1000AAD94 <= SHIDWORD(qword_1000AAD8C)) {
    return HIDWORD(qword_1000AAD8C);
  }
  else {
    return qword_1000AAD94;
  }
}

- (void)updateCoreAnalyticsInfo
{
}

@end