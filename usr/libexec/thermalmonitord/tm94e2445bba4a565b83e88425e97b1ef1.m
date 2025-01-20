@interface tm94e2445bba4a565b83e88425e97b1ef1
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm94e2445bba4a565b83e88425e97b1ef1

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACDC;
  int v5 = dword_1000AACE4;
  v12.receiver = self;
  v12.super_class = (Class)tm94e2445bba4a565b83e88425e97b1ef1;
  [(tm1999e121298b648399d013196e64b976 *)&v12 updateAllThermalLoad:a3];
  sub_100031714(33, (int)((double)v4 * 0.66 + 11.0 + (double)v5 * 0.36));
  float v6 = (float)dword_1000AAD50;
  id v7 = [(CommonProduct *)self findComponent:22];
  float v8 = v6 / 100.0;
  *(float *)&double v9 = v8;
  [v7 calculateControlEffort:v9];
  id v10 = [(CommonProduct *)self findComponent:23];
  *(float *)&double v11 = v8;
  [v10 calculateControlEffort:v11];
}

- (void)updateCoreAnalyticsInfo
{
}

@end