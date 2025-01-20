@interface tma8fdeb8d5d40a6fc75e76f541ccdfac4
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tma8fdeb8d5d40a6fc75e76f541ccdfac4

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACD4;
  int v5 = dword_1000AACE4;
  int v6 = dword_1000AACEC;
  v13.receiver = self;
  v13.super_class = (Class)tma8fdeb8d5d40a6fc75e76f541ccdfac4;
  [(tm62a6a44d269463582cca62859fbfb389 *)&v13 updateAllThermalLoad:a3];
  sub_100031714(55, (int)((double)v4 * 0.02 + -26.0 + (double)v5 * 0.83 + (double)v6 * 0.17));
  float v7 = (float)dword_1000AADA8;
  id v8 = [(CommonProduct *)self findComponent:23];
  float v9 = v7 / 100.0;
  *(float *)&double v10 = v9;
  [v8 calculateControlEffort:v10];
  id v11 = [(CommonProduct *)self findComponent:24];
  *(float *)&double v12 = v9;
  [v11 calculateControlEffort:v12];
}

- (void)updateCoreAnalyticsInfo
{
}

@end