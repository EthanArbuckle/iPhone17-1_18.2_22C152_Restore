@interface tm408f6d8c14caf38138befe9f3b97ef02
- (id)initProduct:(id)a3;
- (int)computeMaxCGTemp;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm408f6d8c14caf38138befe9f3b97ef02

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm408f6d8c14caf38138befe9f3b97ef02;
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
    [(tm408f6d8c14caf38138befe9f3b97ef02 *)self resetVTFilterState];
  }
  int v5 = qword_1000AACCC;
  int v4 = HIDWORD(qword_1000AACCC);
  int v6 = HIDWORD(qword_1000AACD4);
  int v7 = qword_1000AACDC;
  int v8 = HIDWORD(qword_1000AACDC);
  int v30 = dword_1000AACE4;
  int v9 = dword_1000AACEC;
  int v10 = dword_1000AACF0;
  id v11 = [(CommonProduct *)self findComponent:18];
  float v12 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v13 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v14 = v13;
  *(float *)&double v13 = v12;
  [v11 calculateControlEffort:v13 trigger:v14];
  sub_100031714(55, (int)((double)v5 * 0.194 + -184.5 + (double)v8 * 0.341 + (double)v9 * 0.516));
  float v15 = (float)dword_1000AADA8;
  id v16 = [(CommonProduct *)self findComponent:19];
  float v17 = v15 / 100.0;
  *(float *)&double v18 = v17;
  [v16 calculateControlEffort:v18];
  id v19 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v20 = v17;
  [v19 calculateControlEffort:v20];
  unsigned int v21 = [[self findComponent:0] currentLoadingIndex];
  float v22 = (double)(int)(v21 * v21) / 100.0;
  float filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0) {
    float v22 = filteredBacklightCurrentLI2 + (float)((float)(v22 - filteredBacklightCurrentLI2) * 0.076923);
  }
  self->_float filteredBacklightCurrentLI2 = v22;
  sub_100031714(57, (int)((double)v4 * 0.37 + 113.9 + (double)v10 * 0.58 + v22 * 4.99));
  sub_100031714(56, (int)((double)v4 * 0.39 + -103.38 + (double)v7 * 0.4 + (double)v9 * 0.19));
  sub_100031714(59, (int)((double)v4 * 0.12 + -10.06 + (double)v10 * 0.83));
  float v24 = (float)SHIDWORD(qword_1000AADAC);
  id v25 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v26 = v24 / 100.0;
  [v25 calculateControlEffort:v26];
  sub_100031714(60, (int)((double)v6 * 0.59 + 91.72 + (double)v7 * 0.35));
  sub_100031714(58, (int)((double)v6 * 0.75 + -39.61 + (double)v30 * 0.25));
  float v27 = (float)(int)qword_1000AADB4;
  id v28 = [(CommonProduct *)self findComponent:22];

  *(float *)&double v29 = v27 / 100.0;
  [v28 calculateControlEffort:v29];
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