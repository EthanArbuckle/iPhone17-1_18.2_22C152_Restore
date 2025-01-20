@interface tmb6716640bd4d840b4ec454b38cb27d3c
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tmb6716640bd4d840b4ec454b38cb27d3c

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v5 = qword_1000AACDC;
  int v4 = HIDWORD(qword_1000AACDC);
  v12.receiver = self;
  v12.super_class = (Class)tmb6716640bd4d840b4ec454b38cb27d3c;
  [(tmb8686d62322e302fccf2995e45c72b1d *)&v12 updateAllThermalLoad:a3];
  sub_100031714(59, (int)((double)v5 * 0.73 + -22.19 + (double)v4 * 0.27));
  float v6 = (float)SHIDWORD(qword_1000AADB4);
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