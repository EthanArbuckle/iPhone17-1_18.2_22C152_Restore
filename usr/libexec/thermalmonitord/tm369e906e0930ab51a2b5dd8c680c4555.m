@interface tm369e906e0930ab51a2b5dd8c680c4555
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm369e906e0930ab51a2b5dd8c680c4555

- (void)updateAllThermalLoad:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(tmb76592841479b191dd96577dabc78635 *)self gasGaugeBatteryTemperature];
  int v6 = qword_1000AABD4;
  int v7 = dword_1000AABE0;
  v14.receiver = self;
  v14.super_class = (Class)tm369e906e0930ab51a2b5dd8c680c4555;
  [(tmb76592841479b191dd96577dabc78635 *)&v14 updateAllThermalLoad:v3];
  sub_100031714(51, (int)((double)v5 * 0.16 + -118.0 + (double)v6 * 0.71 + (double)v7 * 0.14));
  float v8 = (float)SHIDWORD(qword_1000AAD94);
  id v9 = [(CommonProduct *)self findComponent:22];
  float v10 = v8 / 100.0;
  *(float *)&double v11 = v10;
  [v9 calculateControlEffort:v11];
  id v12 = [(CommonProduct *)self findComponent:23];
  *(float *)&double v13 = v10;
  [v12 calculateControlEffort:v13];
}

- (void)updateCoreAnalyticsInfo
{
}

@end