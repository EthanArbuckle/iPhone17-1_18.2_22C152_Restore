@interface tmb8686d62322e302fccf2995e45c72b1d
- (id)initProduct:(id)a3;
- (int)gasGaugeBatteryTemperature;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tmb8686d62322e302fccf2995e45c72b1d

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tmb8686d62322e302fccf2995e45c72b1d;
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
  int v4 = dword_1000AACF8;
  int v5 = qword_1000AACCC;
  int v31 = HIDWORD(qword_1000AACCC);
  int v6 = qword_1000AACD4;
  int v7 = qword_1000AACDC;
  int v8 = HIDWORD(qword_1000AACDC);
  int v10 = dword_1000AACE8;
  int v9 = dword_1000AACEC;
  id v11 = [(CommonProduct *)self findComponent:18];
  float v12 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v13 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v14 = v13;
  *(float *)&double v13 = v12;
  [v11 calculateControlEffort:v13 trigger:v14];
  double v15 = (double)v5;
  sub_100031714(52, (int)((double)v5 * 0.2 + -16.92 + (double)v8 * 0.79));
  sub_100031714(53, (int)((double)v5 * 0.61 + 181.3 + (double)v7 * 0.28));
  float v16 = (float)(int)qword_1000AAD9C;
  id v17 = [(CommonProduct *)self findComponent:19];
  float v18 = v16 / 100.0;
  *(float *)&double v19 = v18;
  [v17 calculateControlEffort:v19];
  id v20 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v21 = v18;
  [v20 calculateControlEffort:v21];
  unsigned int v22 = [[self findComponent:0] currentLoadingIndex];
  float v23 = (double)(int)(v22 * v22) / 100.0;
  float filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0) {
    float v23 = filteredBacklightCurrentLI2 + (float)((float)(v23 - filteredBacklightCurrentLI2) * 0.14286);
  }
  self->_float filteredBacklightCurrentLI2 = v23;
  sub_100031714(54, (int)(v23 * 0.8 + -115.3 + v15 * 0.98 + (double)v6 * 0.05));
  sub_100031714(56, (int)((double)v4 * 0.48 + -27.45 + (double)v6 * 0.3 + (double)v10 * 0.22));
  sub_100031714(57, (int)((double)v4 * 0.51 + -71.07 + (double)v7 * 0.21 + (double)v10 * 0.29));
  sub_100031714(58, (int)(v15 * 0.11 + -24.71 + (double)v4 * 0.96 + (double)v9 * -0.07));
  float v25 = (float)dword_1000AADA4;
  id v26 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v27 = v25 / 100.0;
  [v26 calculateControlEffort:v27];
  sub_100031714(55, (int)((double)v31 * -0.01 + -65.87 + (double)v6 * 1.02));
  float v28 = (float)dword_1000AADA8;
  id v29 = [(CommonProduct *)self findComponent:22];

  *(float *)&double v30 = v28 / 100.0;
  [v29 calculateControlEffort:v30];
}

- (void)updateCoreAnalyticsInfo
{
}

@end