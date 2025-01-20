@interface tm1abb817bd9d9587b77a661846b96f9e4
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm1abb817bd9d9587b77a661846b96f9e4

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = HIDWORD(qword_1000AACCC);
  int v5 = HIDWORD(qword_1000AACDC);
  v12.receiver = self;
  v12.super_class = (Class)tm1abb817bd9d9587b77a661846b96f9e4;
  [(tm408f6d8c14caf38138befe9f3b97ef02 *)&v12 updateAllThermalLoad:a3];
  sub_100031714(63, (int)((double)v4 * 0.17 + -31.03 + (double)v5 * 0.83));
  float v6 = (float)dword_1000AADC8;
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