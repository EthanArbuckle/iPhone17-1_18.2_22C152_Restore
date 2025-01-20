@interface tm79a186acb73b90c8968af9e764432e15
- (id)initProduct:(id)a3;
- (int)computeMaxCGTemp;
- (int)gasGaugeBatteryTemperature;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm79a186acb73b90c8968af9e764432e15

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm79a186acb73b90c8968af9e764432e15;
  id v3 = [(CommonProduct *)&v6 initProduct:a3];
  v4 = v3;
  if (v3) {
    [v3 resetVTFilterState];
  }
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1.0;
}

- (int)gasGaugeBatteryTemperature
{
  return dword_1000AABCC[0];
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(tm79a186acb73b90c8968af9e764432e15 *)self gasGaugeBatteryTemperature];
  int v6 = HIDWORD(qword_1000AABD4);
  int v8 = dword_1000AABE0;
  int v7 = qword_1000AABE4;
  int v9 = xmmword_1000AABEC;
  if (v3) {
    [(tm79a186acb73b90c8968af9e764432e15 *)self resetVTFilterState];
  }
  id v10 = [(CommonProduct *)self findComponent:18];
  float v11 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v12 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v13 = v12;
  *(float *)&double v12 = v11;
  [v10 calculateControlEffort:v12 trigger:v13];
  double v14 = (double)v5;
  sub_100031714(47, (int)((double)v5 * 0.7 + -70.0 + (double)v6 * 0.24 + (double)v8 * 0.09));
  float v15 = (float)(int)qword_1000AAD88;
  id v16 = [(CommonProduct *)self findComponent:19];
  float v17 = v15 / 100.0;
  *(float *)&double v18 = v17;
  [v16 calculateControlEffort:v18];
  id v19 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v20 = v17;
  [v19 calculateControlEffort:v20];
  unsigned int v21 = [[self findComponent:0] currentLoadingIndex];
  float filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  float v23 = (double)(int)(v21 * v21) / 100.0;
  if (filteredBacklightCurrentLI2 >= 0.0) {
    float v23 = filteredBacklightCurrentLI2 + (float)((float)(v23 - filteredBacklightCurrentLI2) * 0.14286);
  }
  self->_float filteredBacklightCurrentLI2 = v23;
  sub_100031714(49, (int)(v14 * 1.64 + 210.0 + (double)v6 * -0.42 + (double)v9 * -0.27));
  sub_100031714(48, (int)(v14 * 1.34 + 83.0 + (double)v7 * -0.22 + (double)v9 * -0.18));
  sub_100031714(50, (int)(v14 + 60.0));
  float v24 = (float)(int)qword_1000AAD94;
  id v25 = [(CommonProduct *)self findComponent:21];

  *(float *)&double v26 = v24 / 100.0;
  [v25 calculateControlEffort:v26];
}

- (int)computeMaxCGTemp
{
  if ((int)qword_1000AAD8C <= SHIDWORD(qword_1000AAD8C)) {
    return HIDWORD(qword_1000AAD8C);
  }
  else {
    return qword_1000AAD8C;
  }
}

- (void)updateCoreAnalyticsInfo
{
}

@end