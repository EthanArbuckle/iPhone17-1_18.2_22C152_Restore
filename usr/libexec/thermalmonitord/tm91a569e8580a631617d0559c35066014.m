@interface tm91a569e8580a631617d0559c35066014
- (id)initProduct:(id)a3;
- (int)computeMaxCGTemp;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm91a569e8580a631617d0559c35066014

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm91a569e8580a631617d0559c35066014;
  id v3 = [(CommonProduct *)&v6 initProduct:a3];
  v4 = v3;
  if (v3) {
    [v3 resetVTFilterState];
  }
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1.0;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  if (a3) {
    [(tm91a569e8580a631617d0559c35066014 *)self resetVTFilterState];
  }
  int v4 = qword_1000AACCC;
  int v5 = HIDWORD(qword_1000AACD4);
  int v6 = HIDWORD(qword_1000AACDC);
  int v7 = dword_1000AACE4;
  int v8 = dword_1000AACE8;
  int v9 = dword_1000AACEC;
  int v10 = dword_1000AACF0;
  id v11 = [(CommonProduct *)self findComponent:18];
  float v12 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v13 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v14 = v13;
  *(float *)&double v13 = v12;
  [v11 calculateControlEffort:v13 trigger:v14];
  double v15 = (double)v4;
  sub_100031714(55, (int)((double)v4 * 0.71 + 110.45 + (double)v9 * 0.35));
  float v16 = (float)dword_1000AADA8;
  id v17 = [(CommonProduct *)self findComponent:19];
  float v18 = v16 / 100.0;
  *(float *)&double v19 = v18;
  [v17 calculateControlEffort:v19];
  id v20 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v21 = v18;
  [v20 calculateControlEffort:v21];
  unsigned int v22 = [[self findComponent:0] currentLoadingIndex];
  float v23 = (double)(int)(v22 * v22) / 100.0;
  float filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0) {
    float v23 = filteredBacklightCurrentLI2 + (float)((float)(v23 - filteredBacklightCurrentLI2) * 0.125);
  }
  self->_float filteredBacklightCurrentLI2 = v23;
  sub_100031714(57, (int)((double)v10 * 0.91 + 396.03 + v23 * 7.41));
  sub_100031714(56, (int)(v15 * 0.6 + -161.14 + (double)v7 * 0.35 + (double)v9 * 0.1));
  sub_100031714(59, (int)(v15 * 0.63 + 168.86 + (double)v10 * 0.3));
  float v25 = (float)SHIDWORD(qword_1000AADAC);
  id v26 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v27 = v25 / 100.0;
  [v26 calculateControlEffort:v27];
  sub_100031714(60, (int)((double)v6 * 0.74 + 26.19 + (double)v7 * 0.25));
  sub_100031714(58, (int)((double)v5 * 0.8 + 35.11 + (double)v8 * 0.2));
  float v28 = (float)(int)qword_1000AADB4;
  id v29 = [(CommonProduct *)self findComponent:22];

  *(float *)&double v30 = v28 / 100.0;
  [v29 calculateControlEffort:v30];
}

- (int)computeMaxCGTemp
{
  if ((int)qword_1000AADAC <= SHIDWORD(qword_1000AADAC)) {
    return HIDWORD(qword_1000AADAC);
  }
  else {
    return qword_1000AADAC;
  }
}

- (void)updateCoreAnalyticsInfo
{
}

@end