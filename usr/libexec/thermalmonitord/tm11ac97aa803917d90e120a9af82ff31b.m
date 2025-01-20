@interface tm11ac97aa803917d90e120a9af82ff31b
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm11ac97aa803917d90e120a9af82ff31b

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACD4;
  int v5 = dword_1000AACF8;
  v12.receiver = self;
  v12.super_class = (Class)tm11ac97aa803917d90e120a9af82ff31b;
  [(tm0624042662bdd34b4bbbfc0f7da95deb *)&v12 updateAllThermalLoad:a3];
  sub_100031714(55, (int)((double)v4 * 0.37 + 107.62 + (double)v5 * 0.58));
  float v6 = (float)dword_1000AADA8;
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