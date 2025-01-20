@interface tmb16d8e8edc0f89afd1f7fe25529ab7fa
- (id)initProduct:(id)a3;
- (int)arcModuleTemperature;
- (int)computeMaxCGTemp;
- (int)gasGaugeBatteryTemperature;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tmb16d8e8edc0f89afd1f7fe25529ab7fa

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tmb16d8e8edc0f89afd1f7fe25529ab7fa;
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
  return dword_1000AAD84;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  BOOL v3 = a3;
  int v45 = [(tmb16d8e8edc0f89afd1f7fe25529ab7fa *)self gasGaugeBatteryTemperature];
  int v6 = HIDWORD(qword_1000AACCC);
  int v5 = qword_1000AACD4;
  int v7 = HIDWORD(qword_1000AACD4);
  int v8 = dword_1000AAD7C;
  int v9 = HIDWORD(qword_1000AAD88);
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
    [(tmb16d8e8edc0f89afd1f7fe25529ab7fa *)self resetVTFilterState];
  }
  int v12 = v9 & ~(v9 >> 31);
  int filteredTempRearCameraDie = self->_filteredTempRearCameraDie;
  if ((filteredTempRearCameraDie & 0x80000000) == 0) {
    int v12 = (int)(float)((float)filteredTempRearCameraDie + (float)((float)(v12 - filteredTempRearCameraDie) * 0.25));
  }
  self->_int filteredTempRearCameraDie = v12;
  unsigned int v14 = [[self findComponent:0] currentLoadingIndex];
  float v15 = (double)(int)(v14 * v14) / 100.0;
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v15 = (float)filteredBacklightCurrentLI2 + (float)((float)(v15 - (float)filteredBacklightCurrentLI2) * 0.33333);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v15;
  id v17 = [(CommonProduct *)self findComponent:18];
  float v18 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v19 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v20 = v19;
  *(float *)&double v19 = v18;
  [v17 calculateControlEffort:v19 trigger:v20];
  sub_100031714(51, (int)((double)v5 * 0.55 + -33.0 + (double)v7 * 0.11 + (double)v8 * 0.33));
  sub_100031714(49, (int)((double)v5 * 0.57 + -30.0 + (double)v7 * 0.09 + (double)v8 * 0.33));
  sub_100031714(55, (int)((double)v6 * 0.11 + -54.0 + (double)v7 * 0.24 + (double)v8 * 0.63));
  sub_100031714(56, (int)((double)v45 * 1.27 + -108.08 + (double)v5 * -0.23));
  sub_100031714(53, (int)((double)v45 * -0.79+ 199.0+ (double)v5 * 0.6+ (double)v8 * 1.14+ (double)self->_filteredTempRearCameraDie * 0.06));
  sub_100031714(52, (int)((double)v5 * 0.26 + -87.0 + (double)v7 * 0.51 + (double)v8 * 0.23));
  sub_100031714(54, (int)((double)v6 * -0.02 + 61.0 + (double)v8 * 1.03 + (double)self->_filteredBacklightCurrentLI2* 7.56));
  sub_100031714(50, v10);
  float v21 = (float)SHIDWORD(qword_1000AAD94);
  id v22 = [(CommonProduct *)self findComponent:19];
  float v23 = v21 / 100.0;
  *(float *)&double v24 = v23;
  [v22 calculateControlEffort:v24];
  id v25 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v26 = v23;
  [v25 calculateControlEffort:v26];
  float v27 = (float)dword_1000AADA4;
  id v28 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v29 = v27 / 100.0;
  [v28 calculateControlEffort:v29];
  float v30 = (float)SHIDWORD(qword_1000AAD9C);
  id v31 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v32 = v30 / 100.0;
  [v31 calculateControlEffort:v32];
  float v33 = (float)(int)qword_1000AADAC;
  id v34 = [(CommonProduct *)self findComponent:23];
  *(float *)&double v35 = v33 / 100.0;
  [v34 calculateControlEffort:v35];
  float v36 = (float)(int)qword_1000AAD9C;
  id v37 = [(CommonProduct *)self findComponent:24];
  float v38 = v36 / 100.0;
  *(float *)&double v39 = v38;
  [v37 calculateControlEffort:v39];
  id v40 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v41 = v38;
  [v40 calculateControlEffort:v41];
  if ([(CommonProduct *)self getChargerState])
  {
    float v42 = (float)(int)qword_1000AAD94;
    id v43 = [(CommonProduct *)self findComponent:26];
    *(float *)&double v44 = v42 / 100.0;
  }
  else
  {
    id v43 = [(CommonProduct *)self findComponent:26];
    LODWORD(v44) = 30.0;
  }
  [v43 calculateControlEffort:v44];
}

- (int)computeMaxCGTemp
{
  if (dword_1000AADA8 <= dword_1000AADA4) {
    return dword_1000AADA4;
  }
  else {
    return dword_1000AADA8;
  }
}

- (void)updateCoreAnalyticsInfo
{
}

@end