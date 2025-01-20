@interface tm2c2215485370d730a0de95e9234264e9
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm2c2215485370d730a0de95e9234264e9

- (void)updateAllThermalLoad:(BOOL)a3
{
  uint64_t v4 = qword_1000AACCC;
  int v5 = qword_1000AACD4;
  int v6 = dword_1000AACEC;
  id v7 = [(CommonProduct *)self findComponent:18];
  double v8 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  *(float *)&double v8 = v8;
  [v7 calculateControlEffort:v8];
  sub_100031714(40, (int)((double)(int)v4 * 0.57 + 68.76 + (double)v6 * 0.42));
  sub_100031714(41, (int)((double)v5 * 1.14 + 155.88 + (double)v6 * -0.29));
  sub_100031714(42, v4);
  float v9 = (float)dword_1000AAD6C;
  id v10 = [(CommonProduct *)self findComponent:19];
  float v11 = v9 / 100.0;
  *(float *)&double v12 = v11;
  [v10 calculateControlEffort:v12];
  id v13 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v14 = v11;

  [v13 calculateControlEffort:v14];
}

- (void)updateCoreAnalyticsInfo
{
}

@end