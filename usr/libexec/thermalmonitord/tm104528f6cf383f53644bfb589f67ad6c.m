@interface tm104528f6cf383f53644bfb589f67ad6c
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm104528f6cf383f53644bfb589f67ad6c

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACDC;
  int v5 = dword_1000AACE4;
  v12.receiver = self;
  v12.super_class = (Class)tm104528f6cf383f53644bfb589f67ad6c;
  [(tmbcef8363c84453940399f01f368bea58 *)&v12 updateAllThermalLoad:a3];
  sub_100031714(53, (int)((double)v4 * 0.66 + -89.0 + (double)v5 * 0.36));
  float v6 = (float)SHIDWORD(qword_1000AAD9C);
  id v7 = [(CommonProduct *)self findComponent:21];
  float v8 = v6 / 100.0;
  *(float *)&double v9 = v8;
  [v7 calculateControlEffort:v9];
  id v10 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v11 = v8;
  [v10 calculateControlEffort:v11];
}

- (void)updateCoreAnalyticsInfo
{
}

@end