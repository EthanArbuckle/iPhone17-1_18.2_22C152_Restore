@interface tm99cbb6a8c39b59c1e8203b1c2ab4ecf8
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm99cbb6a8c39b59c1e8203b1c2ab4ecf8

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = HIDWORD(qword_1000AACD4);
  int v5 = HIDWORD(qword_1000AACDC);
  int v6 = dword_1000AACE8;
  int v7 = dword_1000AACF0;
  v14.receiver = self;
  v14.super_class = (Class)tm99cbb6a8c39b59c1e8203b1c2ab4ecf8;
  [(tm57b622634d75d34f6315daf54954a970 *)&v14 updateAllThermalLoad:a3];
  sub_100031714(63, (int)((double)v4 * 0.23 + -0.06 + (double)v5 * 0.25 + (double)v6 * 0.01 + (double)v7 * 0.5));
  float v8 = (float)dword_1000AADC8;
  id v9 = [(CommonProduct *)self findComponent:23];
  float v10 = v8 / 100.0;
  *(float *)&double v11 = v10;
  [v9 calculateControlEffort:v11];
  id v12 = [(CommonProduct *)self findComponent:24];
  *(float *)&double v13 = v10;
  [v12 calculateControlEffort:v13];
}

- (void)updateCoreAnalyticsInfo
{
}

@end