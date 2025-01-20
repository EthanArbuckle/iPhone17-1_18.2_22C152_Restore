@interface tm62a6a44d269463582cca62859fbfb389
- (id)initProduct:(id)a3;
- (int)computeMaxCGTemp;
- (int)gasGaugeBatteryTemperature;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm62a6a44d269463582cca62859fbfb389

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm62a6a44d269463582cca62859fbfb389;
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
  return qword_1000AACCC;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(tm62a6a44d269463582cca62859fbfb389 *)self gasGaugeBatteryTemperature];
  int v7 = qword_1000AACDC;
  int v6 = HIDWORD(qword_1000AACDC);
  int v9 = dword_1000AACE4;
  int v8 = dword_1000AACE8;
  int v11 = dword_1000AACEC;
  int v10 = dword_1000AACF0;
  if (v3) {
    [(tm62a6a44d269463582cca62859fbfb389 *)self resetVTFilterState];
  }
  id v12 = [(CommonProduct *)self findComponent:18];
  float v13 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v14 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v15 = v14;
  *(float *)&double v14 = v13;
  [v12 calculateControlEffort:v14 trigger:v15];
  double v16 = (double)v5;
  double v33 = (double)v7;
  double v17 = (double)v6;
  sub_100031714(47, (int)((double)v5 * 0.56 + -109.0 + (double)v7 * 0.53 + (double)v6 * -0.07));
  float v18 = (float)(int)qword_1000AAD88;
  id v19 = [(CommonProduct *)self findComponent:19];
  float v20 = v18 / 100.0;
  *(float *)&double v21 = v20;
  [v19 calculateControlEffort:v21];
  id v22 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v23 = v20;
  [v22 calculateControlEffort:v23];
  unsigned int v24 = [[self findComponent:0] currentLoadingIndex];
  float v25 = (double)(int)(v24 * v24) / 100.0;
  float filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0) {
    float v25 = filteredBacklightCurrentLI2 + (float)((float)(v25 - filteredBacklightCurrentLI2) * 0.14286);
  }
  self->_float filteredBacklightCurrentLI2 = v25;
  sub_100031714(49, (int)(v17 * -0.69 + -39.0 + (double)v11 * -0.33 + (double)v10 * 2.0 + v25 * 7.2));
  sub_100031714(48, (int)(v17 * -0.38 + -148.0 + (double)v9 * 0.73 + (double)v8 * -0.42 + (double)v10 * 1.09));
  sub_100031714(51, (int)((double)v9 * 1.25 + 30.0 + (double)v8 * -0.28));
  float v27 = (float)unk_1000AAD90;
  id v28 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v29 = v27 / 100.0;
  [v28 calculateControlEffort:v29];
  sub_100031714(52, (int)(v16 * 1.44 + 91.0 + v33 * -0.16 + v17 * -0.25));
  sub_100031714(53, (int)(v16 * 1.08 + -152.0 + v17 * -0.28 + (double)v9 * 0.24));
  sub_100031714(54, (int)(v16 * 1.28 + -183.0 + v33 * -0.31 + v17 * -0.38 + (double)v9 * 0.48));
  sub_100031714(50, (int)(v16 * 0.52 + -33.0 + (double)v10 * 0.48));
  float v30 = (float)(int)qword_1000AAD94;
  id v31 = [(CommonProduct *)self findComponent:22];

  *(float *)&double v32 = v30 / 100.0;
  [v31 calculateControlEffort:v32];
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