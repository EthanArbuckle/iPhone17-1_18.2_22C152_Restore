@interface tmbb7eeddea74c8fcfad763f3ffbf59d08
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tmbb7eeddea74c8fcfad763f3ffbf59d08

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACCC;
  int v5 = HIDWORD(qword_1000AACDC);
  v12.receiver = self;
  v12.super_class = (Class)tmbb7eeddea74c8fcfad763f3ffbf59d08;
  [(tm2c2215485370d730a0de95e9234264e9 *)&v12 updateAllThermalLoad:a3];
  sub_100031714(43, (int)((double)v4 * 0.45 + 55.01 + (double)v5 * 0.51));
  float v6 = (float)dword_1000AAD78;
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