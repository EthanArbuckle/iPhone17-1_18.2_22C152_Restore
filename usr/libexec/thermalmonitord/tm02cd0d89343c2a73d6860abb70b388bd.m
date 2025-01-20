@interface tm02cd0d89343c2a73d6860abb70b388bd
- (id)initProduct:(id)a3;
- (int)arcModuleTemperature;
- (int)gasGaugeBatteryTemperature;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm02cd0d89343c2a73d6860abb70b388bd

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm02cd0d89343c2a73d6860abb70b388bd;
  id v3 = [(CommonProduct *)&v6 initProduct:a3];
  v4 = v3;
  if (v3) {
    [v3 resetVTFilterState];
  }
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredArcModuleTemperature = -1;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000AACCC;
}

- (int)arcModuleTemperature
{
  return HIDWORD(qword_1000AAD8C);
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(tm02cd0d89343c2a73d6860abb70b388bd *)self gasGaugeBatteryTemperature];
  int v6 = HIDWORD(qword_1000AACCC);
  int v73 = qword_1000AACD4;
  int v8 = HIDWORD(qword_1000AACD4);
  int v7 = qword_1000AACDC;
  int v9 = HIDWORD(qword_1000AACDC);
  int v10 = [(tm02cd0d89343c2a73d6860abb70b388bd *)self arcModuleTemperature];
  if (v3) {
    [(tm02cd0d89343c2a73d6860abb70b388bd *)self resetVTFilterState];
  }
  unsigned int v11 = [[self findComponent:0] currentLoadingIndex];
  float v12 = (double)(int)(v11 * v11) / 100.0;
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v12 = (float)filteredBacklightCurrentLI2 + (float)((float)(v12 - (float)filteredBacklightCurrentLI2) * 0.076923);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v12;
  int filteredArcModuleTemperature = self->_filteredArcModuleTemperature;
  if ((filteredArcModuleTemperature & 0x80000000) == 0) {
    int v10 = (int)(float)((float)filteredArcModuleTemperature
  }
                     + (float)((float)(v10 - filteredArcModuleTemperature) * 0.14286));
  self->_int filteredArcModuleTemperature = v10;
  id v15 = [(CommonProduct *)self findComponent:18];
  float v16 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v17 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v18 = v17;
  *(float *)&double v17 = v16;
  [v15 calculateControlEffort:v17 trigger:v18];
  sub_100031714(53, (int)((double)(int)v5 * 0.5 + 146.1 + (double)v9 * 0.42));
  sub_100031714(52, (int)((double)(int)v5 * 0.46 + 152.1 + (double)v8 * 0.51));
  sub_100031714(60, (int)((double)self->_filteredBacklightCurrentLI2 * -0.76 + 37.1 + (double)v6 * 0.96));
  sub_100031714(57, (int)((double)self->_filteredBacklightCurrentLI2 * 9.57 + 635.0 + (double)v6 * 0.74));
  sub_100031714(54, (int)((double)(int)v5 * 0.85 + -233.1 + (double)v8 * 0.05 + (double)v7 * 0.15));
  sub_100031714(55, (int)((double)(int)v5 * 0.71 + 177.4 + (double)v8 * 0.1 + (double)v7 * 0.15));
  sub_100031714(56, (int)((double)(int)v5 * 0.64 + 45.16 + (double)v8 * 0.32));
  sub_100031714(58, (int)((double)v6 * 1.11+ -192.0+ (double)v73 * -0.09+ (double)self->_filteredArcModuleTemperature * 0.019));
  sub_100031714(59, v5);
  float v19 = (float)(int)qword_1000AAD9C;
  id v20 = [(CommonProduct *)self findComponent:19];
  float v21 = v19 / 100.0;
  *(float *)&double v22 = v21;
  [v20 calculateControlEffort:v22];
  id v23 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v24 = v21;
  [v23 calculateControlEffort:v24];
  float v25 = (float)SHIDWORD(qword_1000AAD9C);
  id v26 = [(CommonProduct *)self findComponent:21];
  float v27 = v25 / 100.0;
  *(float *)&double v28 = v27;
  [v26 calculateControlEffort:v28];
  id v29 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v30 = v27;
  [v29 calculateControlEffort:v30];
  float v31 = (float)dword_1000AADA8;
  id v32 = [(CommonProduct *)self findComponent:23];
  float v33 = v31 / 100.0;
  *(float *)&double v34 = v33;
  [v32 calculateControlEffort:v34];
  id v35 = [(CommonProduct *)self findComponent:32];
  *(float *)&double v36 = v33;
  [v35 calculateControlEffort:v36];
  float v37 = (float)dword_1000AADA4;
  id v38 = [(CommonProduct *)self findComponent:27];
  float v39 = v37 / 100.0;
  *(float *)&double v40 = v39;
  [v38 calculateControlEffort:v40];
  id v41 = [(CommonProduct *)self findComponent:33];
  *(float *)&double v42 = v39;
  [v41 calculateControlEffort:v42];
  float v43 = (float)(int)qword_1000AADAC;
  id v44 = [(CommonProduct *)self findComponent:24];
  *(float *)&double v45 = v43 / 100.0;
  [v44 calculateControlEffort:v45];
  float v46 = (float)(int)qword_1000AADB4;
  id v47 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v48 = v46 / 100.0;
  [v47 calculateControlEffort:v48];
  float v49 = (float)SHIDWORD(qword_1000AADAC);
  id v50 = [(CommonProduct *)self findComponent:26];
  *(float *)&double v51 = v49 / 100.0;
  [v50 calculateControlEffort:v51];
  unsigned int v52 = [(CommonProduct *)self getChargerState];
  if (v52 - 10 > 0x3C) {
    goto LABEL_12;
  }
  if (((1 << (v52 - 10)) & 0x1004010000100000) == 0)
  {
    if (v52 == 10)
    {
      float v63 = (float)dword_1000AADA8;
      id v64 = [(CommonProduct *)self findComponent:28];
      *(float *)&double v65 = v63 / 100.0;
      [v64 calculateControlEffort:v65];
      float v66 = (float)dword_1000AADA4;
      id v67 = [(CommonProduct *)self findComponent:29];
      *(float *)&double v68 = v66 / 100.0;
LABEL_14:
      [v67 calculateControlEffort:v68];
      id v71 = [(CommonProduct *)self findComponent:30];
      LODWORD(v72) = 30.0;
      [v71 calculateControlEffort:v72];
      id v61 = [(CommonProduct *)self findComponent:31];
      LODWORD(v62) = 30.0;
      goto LABEL_15;
    }
LABEL_12:
    if (v52) {
      return;
    }
    id v69 = [(CommonProduct *)self findComponent:28];
    LODWORD(v70) = 30.0;
    [v69 calculateControlEffort:v70];
    id v67 = [(CommonProduct *)self findComponent:29];
    LODWORD(v68) = 30.0;
    goto LABEL_14;
  }
  id v53 = [(CommonProduct *)self findComponent:28];
  LODWORD(v54) = 30.0;
  [v53 calculateControlEffort:v54];
  id v55 = [(CommonProduct *)self findComponent:29];
  LODWORD(v56) = 30.0;
  [v55 calculateControlEffort:v56];
  float v57 = (float)dword_1000AADA8;
  id v58 = [(CommonProduct *)self findComponent:30];
  *(float *)&double v59 = v57 / 100.0;
  [v58 calculateControlEffort:v59];
  float v60 = (float)dword_1000AADA4;
  id v61 = [(CommonProduct *)self findComponent:31];
  *(float *)&double v62 = v60 / 100.0;
LABEL_15:

  [v61 calculateControlEffort:v62];
}

- (void)updateCoreAnalyticsInfo
{
}

@end