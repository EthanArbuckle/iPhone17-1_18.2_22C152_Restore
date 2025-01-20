@interface tme50c7cce5aa77185119a01eb2c6550e4
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tme50c7cce5aa77185119a01eb2c6550e4

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v5 = HIDWORD(qword_1000AACDC);
  int v4 = dword_1000AACE4;
  v12.receiver = self;
  v12.super_class = (Class)tme50c7cce5aa77185119a01eb2c6550e4;
  [(tmf02fbce43bb83f6eb51bd31374aa8279 *)&v12 updateAllThermalLoad:a3];
  sub_100031714(53, (int)((double)v4 * 0.66 + 11.0 + (double)v5 * 0.36));
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