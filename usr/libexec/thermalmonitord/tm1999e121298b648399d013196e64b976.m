@interface tm1999e121298b648399d013196e64b976
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm1999e121298b648399d013196e64b976

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACCC;
  int v5 = qword_1000AACDC;
  int v6 = dword_1000AACE8;
  int v7 = dword_1000AACEC;
  id v8 = [(CommonProduct *)self findComponent:18];
  double v9 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  *(float *)&double v9 = v9;
  [v8 calculateControlEffort:v9];
  sub_100031714(31, (int)((double)v5 * 1.06 + 67.0 + (double)v7 * -0.08));
  sub_100031714(32, (int)((double)v4 * 0.88 + -22.0 + (double)v6 * 0.13));
  float v10 = (float)dword_1000AAD4C;
  id v11 = [(CommonProduct *)self findComponent:19];
  float v12 = v10 / 100.0;
  *(float *)&double v13 = v12;
  [v11 calculateControlEffort:v13];
  id v14 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v15 = v12;
  [v14 calculateControlEffort:v15];
  id v16 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v17 = v12;

  [v16 calculateControlEffort:v17];
}

- (void)updateCoreAnalyticsInfo
{
}

@end