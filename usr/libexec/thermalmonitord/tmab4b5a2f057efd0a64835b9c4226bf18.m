@interface tmab4b5a2f057efd0a64835b9c4226bf18
- (id)initProduct:(id)a3;
- (int)computeMaxCGTemp;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tmab4b5a2f057efd0a64835b9c4226bf18

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tmab4b5a2f057efd0a64835b9c4226bf18;
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
    [(tmab4b5a2f057efd0a64835b9c4226bf18 *)self resetVTFilterState];
  }
  int v4 = qword_1000AACCC;
  int v6 = qword_1000AACD4;
  int v5 = HIDWORD(qword_1000AACD4);
  int v7 = qword_1000AACDC;
  int v8 = HIDWORD(qword_1000AACDC);
  int v9 = dword_1000AACE4;
  int v10 = dword_1000AACE8;
  id v11 = [(CommonProduct *)self findComponent:18];
  float v12 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v13 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v14 = v13;
  *(float *)&double v13 = v12;
  [v11 calculateControlEffort:v13 trigger:v14];
  double v15 = (double)v6;
  double v16 = (double)v10;
  sub_100031714(53, (int)((double)v6 * 0.32 + -61.0 + (double)v8 * 0.37 + (double)v10 * 0.29));
  float v17 = (float)SHIDWORD(qword_1000AAD9C);
  id v18 = [(CommonProduct *)self findComponent:19];
  float v19 = v17 / 100.0;
  *(float *)&double v20 = v19;
  [v18 calculateControlEffort:v20];
  id v21 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v22 = v19;
  [v21 calculateControlEffort:v22];
  unsigned int v23 = [[self findComponent:0] currentLoadingIndex];
  float v24 = (double)(int)(v23 * v23) / 100.0;
  float filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0) {
    float v24 = filteredBacklightCurrentLI2 + (float)((float)(v24 - filteredBacklightCurrentLI2) * 0.076923);
  }
  self->_float filteredBacklightCurrentLI2 = v24;
  sub_100031714(55, (int)((double)v4 * 1.22 + 3.0 + (double)v9 * -0.09 + v16 * -0.1 + v24 * 5.78));
  sub_100031714(54, (int)((double)v4 * 0.42 + -49.0 + (double)v7 * 0.43 + v16 * 0.15));
  sub_100031714(57, (int)((double)v5 * -0.3 + 119.0 + (double)v7 * 1.31 + v16 * -0.05));
  float v26 = (float)dword_1000AADA8;
  id v27 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v28 = v26 / 100.0;
  [v27 calculateControlEffort:v28];
  sub_100031714(58, (int)(v15 * 0.87 + -29.0 + (double)v5 * -0.28 + (double)v8 * 0.39));
  sub_100031714(56, (int)(v15 * 1.21 + 16.0 + (double)v7 * -0.38 + v16 * 0.14));
  float v29 = (float)(int)qword_1000AADAC;
  id v30 = [(CommonProduct *)self findComponent:22];

  *(float *)&double v31 = v29 / 100.0;
  [v30 calculateControlEffort:v31];
}

- (int)computeMaxCGTemp
{
  if (dword_1000AADA4 <= dword_1000AADA8) {
    return dword_1000AADA8;
  }
  else {
    return dword_1000AADA4;
  }
}

- (void)updateCoreAnalyticsInfo
{
}

@end