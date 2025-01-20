@interface tmf02fbce43bb83f6eb51bd31374aa8279
- (id)initProduct:(id)a3;
- (int)gasGaugeBatteryTemperature;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tmf02fbce43bb83f6eb51bd31374aa8279

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tmf02fbce43bb83f6eb51bd31374aa8279;
  id v3 = [(CommonProduct *)&v6 initProduct:a3];
  v4 = v3;
  if (v3) {
    [v3 resetVTFilterState];
  }
  return v4;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000AACCC;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACCC;
  int v5 = dword_1000AACE4;
  int v7 = HIDWORD(qword_1000AACD4);
  int v6 = qword_1000AACDC;
  id v8 = [(CommonProduct *)self findComponent:18];
  float v9 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v10 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v11 = v10;
  *(float *)&double v10 = v9;
  [v8 calculateControlEffort:v10 trigger:v11];
  sub_100031714(52, (int)((double)v4 * 0.88 + -22.0 + (double)v6 * 0.13));
  sub_100031714(51, (int)((double)v5 * 1.06 + 67.0 + (double)v7 * -0.08));
  float v12 = (float)(int)qword_1000AAD9C;
  id v13 = [(CommonProduct *)self findComponent:19];
  float v14 = v12 / 100.0;
  *(float *)&double v15 = v14;
  [v13 calculateControlEffort:v15];
  id v16 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v17 = v14;

  [v16 calculateControlEffort:v17];
}

- (void)updateCoreAnalyticsInfo
{
}

@end