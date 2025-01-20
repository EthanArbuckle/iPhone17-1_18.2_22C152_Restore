@interface tm257c64334e7f7d6d00dc8421c66da872
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm257c64334e7f7d6d00dc8421c66da872

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACCC;
  int v5 = dword_1000AACEC;
  v12.receiver = self;
  v12.super_class = (Class)tm257c64334e7f7d6d00dc8421c66da872;
  [(tmab4b5a2f057efd0a64835b9c4226bf18 *)&v12 updateAllThermalLoad:a3];
  sub_100031714(63, (int)((double)v4 * 0.105 + -164.3 + (double)v5 * 0.904));
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