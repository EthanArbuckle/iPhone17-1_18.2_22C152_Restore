@interface tm8781978eb55d0bd57cba1d7f3875e199
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm8781978eb55d0bd57cba1d7f3875e199

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACDC;
  int v5 = dword_1000AACEC;
  v12.receiver = self;
  v12.super_class = (Class)tm8781978eb55d0bd57cba1d7f3875e199;
  [(tmad80096ce0126d046ebbef0e89cc46f8 *)&v12 updateAllThermalLoad:a3];
  sub_100031714(59, (int)((double)v4 * 0.91 + -34.51 + (double)v5 * 0.09));
  float v6 = (float)SHIDWORD(qword_1000AADB4);
  id v7 = [(CommonProduct *)self findComponent:23];
  float v8 = v6 / 100.0;
  *(float *)&double v9 = v8;
  [v7 calculateControlEffort:v9];
  id v10 = [(CommonProduct *)self findComponent:24];
  *(float *)&double v11 = v8;
  [v10 calculateControlEffort:v11];
}

- (void)updateCoreAnalyticsInfo
{
}

@end