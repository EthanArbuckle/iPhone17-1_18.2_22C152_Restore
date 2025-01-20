@interface tma603bec8e9fff217df1da4b628b0272a
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tma603bec8e9fff217df1da4b628b0272a

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACCC;
  int v5 = qword_1000AACDC;
  int v6 = dword_1000AACF4;
  v13.receiver = self;
  v13.super_class = (Class)tma603bec8e9fff217df1da4b628b0272a;
  [(tm91a569e8580a631617d0559c35066014 *)&v13 updateAllThermalLoad:a3];
  sub_100031714(63, (int)((double)v4 * 0.16 + -68.02 + (double)v5 * 0.21 + (double)v6 * 0.63));
  float v7 = (float)dword_1000AADC8;
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