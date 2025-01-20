@interface tm76592ae7abfee600e1da3e897fcf94c9
- (id)initProduct:(id)a3;
- (int)arcModuleTemperature;
- (int)computeMaxCGTemp;
- (int)gasGaugeBatteryTemperature;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm76592ae7abfee600e1da3e897fcf94c9

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm76592ae7abfee600e1da3e897fcf94c9;
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
  int v6 = qword_1000AACD4;
  int v5 = HIDWORD(qword_1000AACD4);
  int v7 = HIDWORD(qword_1000AACDC);
  int v40 = dword_1000AACE4;
  int v41 = qword_1000AACDC;
  int v8 = dword_1000AAD84;
  int v9 = qword_1000AAD88;
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
    [(tm76592ae7abfee600e1da3e897fcf94c9 *)self resetVTFilterState];
  }
  unsigned int v12 = [[self findComponent:0] currentLoadingIndex];
  float v13 = (double)(int)(v12 * v12) / 100.0;
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v13 = (float)filteredBacklightCurrentLI2 + (float)((float)(v13 - (float)filteredBacklightCurrentLI2) * 0.076923);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v13;
  id v15 = [(CommonProduct *)self findComponent:18];
  float v16 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v17 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v18 = v17;
  *(float *)&double v17 = v16;
  [v15 calculateControlEffort:v17 trigger:v18];
  sub_100031714(54, (int)((double)v6 * 0.48 + 110.0 + (double)v5 * 0.45));
  sub_100031714(53, (int)((double)v6 * 0.36 + 157.0 + (double)v5 * 0.57));
  sub_100031714(59, (int)((double)v6 * 0.65+ 78.0+ (double)v7 * -0.13+ (double)v9 * 0.44+ (double)self->_filteredBacklightCurrentLI2 * -1.99));
  sub_100031714(55, (int)((double)v6 * 0.67 + 262.0 + (double)v5 * 0.23));
  sub_100031714(56, (int)((double)v6 * 0.867 + -108.0 + (double)v8 * 0.0532 + (double)v9 * 0.0811));
  sub_100031714(58, (int)((double)v6 * 0.6+ 107.0+ (double)v7 * -0.26+ (double)v9 * 0.63+ (double)self->_filteredBacklightCurrentLI2 * 4.67));
  sub_100031714(57, (int)((double)v5 * 1.29 + -99.0 + (double)v7 * -0.65 + (double)v40 * -0.14 + (double)v8 * 0.49));
  sub_100031714(60, (int)((double)v6 * 1.23 + -12.7 - (double)v41 + (double)v40 * 0.372 + (double)v9 * 0.374));
  sub_100031714(61, v10);
  float v19 = (float)dword_1000AADA4;
  id v20 = [(CommonProduct *)self findComponent:19];
  float v21 = v19 / 100.0;
  *(float *)&double v22 = v21;
  [v20 calculateControlEffort:v22];
  id v23 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v24 = v21;
  [v23 calculateControlEffort:v24];
  float v25 = (float)(int)qword_1000AADB4;
  id v26 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v27 = v25 / 100.0;
  [v26 calculateControlEffort:v27];
  float v28 = (float)SHIDWORD(qword_1000AADAC);
  id v29 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v30 = v28 / 100.0;
  [v29 calculateControlEffort:v30];
  float v31 = (float)dword_1000AADBC;
  id v32 = [(CommonProduct *)self findComponent:23];
  *(float *)&double v33 = v31 / 100.0;
  [v32 calculateControlEffort:v33];
  float v34 = (float)dword_1000AADA8;
  id v35 = [(CommonProduct *)self findComponent:24];
  float v36 = v34 / 100.0;
  *(float *)&double v37 = v36;
  [v35 calculateControlEffort:v37];
  id v38 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v39 = v36;
  [v38 calculateControlEffort:v39];
}

- (int)computeMaxCGTemp
{
  if (SHIDWORD(qword_1000AADB4) <= (int)qword_1000AADB4) {
    return qword_1000AADB4;
  }
  else {
    return HIDWORD(qword_1000AADB4);
  }
}

- (void)updateCoreAnalyticsInfo
{
}

@end