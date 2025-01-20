@interface tmad80096ce0126d046ebbef0e89cc46f8
- (id)initProduct:(id)a3;
- (int)gasGaugeBatteryTemperature;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tmad80096ce0126d046ebbef0e89cc46f8

- (id)initProduct:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)tmad80096ce0126d046ebbef0e89cc46f8;
  return [(CommonProduct *)&v4 initProduct:a3];
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000AACCC;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACCC;
  int v5 = dword_1000AACF8;
  int v6 = qword_1000AACDC;
  int v32 = HIDWORD(qword_1000AACD4);
  int v7 = HIDWORD(qword_1000AACDC);
  int v8 = dword_1000AACE4;
  int v9 = dword_1000AACE8;
  int v10 = dword_1000AACEC;
  id v11 = [(CommonProduct *)self findComponent:18];
  float v12 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v13 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v14 = v13;
  *(float *)&double v13 = v12;
  [v11 calculateControlEffort:v13 trigger:v14];
  sub_100031714(52, (int)((double)v6 * 0.4 + -43.94 + (double)v9 * 0.59));
  double v15 = (double)v7;
  double v16 = (double)v8;
  sub_100031714(53, (int)((double)v7 * 0.72 + -49.02 + (double)v8 * 0.29));
  float v17 = (float)(int)qword_1000AAD9C;
  id v18 = [(CommonProduct *)self findComponent:19];
  float v19 = v17 / 100.0;
  *(float *)&double v20 = v19;
  [v18 calculateControlEffort:v20];
  id v21 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v22 = v19;
  [v21 calculateControlEffort:v22];
  unsigned int v23 = [[self findComponent:0] currentLoadingIndex];
  float v24 = (double)(int)(v23 * v23) / 100.0;
  float filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0) {
    float v24 = filteredBacklightCurrentLI2 + (float)((float)(v24 - filteredBacklightCurrentLI2) * 0.14286);
  }
  self->_float filteredBacklightCurrentLI2 = v24;
  sub_100031714(54, (int)(v24 * 2.74 + 230.79 + (double)v4 * 1.4 + v16 * -0.38));
  float v26 = (float)dword_1000AADA4;
  id v27 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v28 = v26 / 100.0;
  [v27 calculateControlEffort:v28];
  sub_100031714(56, (int)((double)v5 * 0.34 + -10.0 + v15 * 0.52 + v16 * 0.14));
  sub_100031714(57, (int)(v15 * 0.62 + -28.27 + v16 * 0.28 + (double)v10 * 0.1));
  sub_100031714(58, (int)((double)v32 * 0.09 + 49.39 + (double)v6 * 0.41 + v15 * 0.47));
  sub_100031714(55, (int)((double)v4 * 0.62 + -8.64 + (double)v9 * 0.39));
  float v29 = (float)dword_1000AADA8;
  id v30 = [(CommonProduct *)self findComponent:22];

  *(float *)&double v31 = v29 / 100.0;
  [v30 calculateControlEffort:v31];
}

- (void)updateCoreAnalyticsInfo
{
}

@end