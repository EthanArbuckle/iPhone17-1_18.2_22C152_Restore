@interface tm57b622634d75d34f6315daf54954a970
- (id)initProduct:(id)a3;
- (int)computeMaxCGTemp;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm57b622634d75d34f6315daf54954a970

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm57b622634d75d34f6315daf54954a970;
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
    [(tm57b622634d75d34f6315daf54954a970 *)self resetVTFilterState];
  }
  int v4 = qword_1000AACCC;
  int v5 = qword_1000AACD4;
  int v7 = HIDWORD(qword_1000AACDC);
  int v6 = dword_1000AACE4;
  int v9 = dword_1000AACE8;
  int v8 = dword_1000AACEC;
  id v10 = [(CommonProduct *)self findComponent:18];
  float v11 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v12 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v13 = v12;
  *(float *)&double v12 = v11;
  [v10 calculateControlEffort:v12 trigger:v13];
  double v14 = (double)v5;
  double v15 = (double)v7;
  sub_100031714(53, (int)((double)v5 * 0.4 + -126.0 + (double)v7 * 0.22 + (double)v9 * 0.39));
  float v16 = (float)SHIDWORD(qword_1000AAD9C);
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
  sub_100031714(55, (int)((double)v4 * 0.89 + 181.0 + (double)v6 * -0.29 + (double)v8 * 0.42 + v23 * 8.64));
  sub_100031714(54, (int)((double)v4 * 0.55 + -9.0 + v15 * 0.26 + (double)v9 * 0.22));
  sub_100031714(57, (int)((double)v4 * 0.81 + 54.0 + v15 * 0.32 + (double)v6 * -0.13));
  float v25 = (float)dword_1000AADA8;
  id v26 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v27 = v25 / 100.0;
  [v26 calculateControlEffort:v27];
  sub_100031714(58, (int)((double)v4 * 0.4 + -38.0 + v14 * 0.46 + (double)v6 * 0.15));
  sub_100031714(56, (int)(v14 * 1.1 + -75.0 + v15 * -0.25 + (double)v6 * 0.15));
  float v28 = (float)(int)qword_1000AADAC;
  id v29 = [(CommonProduct *)self findComponent:22];

  *(float *)&double v30 = v28 / 100.0;
  [v29 calculateControlEffort:v30];
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