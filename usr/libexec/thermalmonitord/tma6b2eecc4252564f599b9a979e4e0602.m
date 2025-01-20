@interface tma6b2eecc4252564f599b9a979e4e0602
- (id)getGridX;
- (id)getGridY;
- (id)initProduct:(id)a3;
- (int)arcModuleTemperature;
- (int)compute2DGridTemps;
- (int)gasGaugeBatteryTemperature;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tma6b2eecc4252564f599b9a979e4e0602

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tma6b2eecc4252564f599b9a979e4e0602;
  id v3 = [(CommonProduct *)&v6 initProduct:a3];
  v4 = v3;
  if (v3) {
    [v3 resetVTFilterState];
  }
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredTempRearCameraDie = -1;
  self->_filteredTempRearCameraDieWithDefault = -1;
  self->_filteredTempArc = -1;
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredTP3R = -1;
  self->_filteredTP3R_2DGrid = -1;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000AACCC;
}

- (int)arcModuleTemperature
{
  return qword_1000AAD94;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(tma6b2eecc4252564f599b9a979e4e0602 *)self gasGaugeBatteryTemperature];
  int v6 = HIDWORD(qword_1000AACD4);
  unint64_t v81 = __PAIR64__(HIDWORD(qword_1000AAD88), HIDWORD(qword_1000AACCC));
  int v7 = qword_1000AACDC;
  unint64_t v79 = __PAIR64__(qword_1000AACD4, HIDWORD(qword_1000AACDC));
  int v9 = qword_1000AAD9C;
  int v8 = HIDWORD(qword_1000AAD9C);
  if (v3) {
    [(tma6b2eecc4252564f599b9a979e4e0602 *)self resetVTFilterState];
  }
  unsigned int v10 = [[-[CommonProduct findComponent:](self, "findComponent:", 0, v79) currentLoadingIndex];
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  float v12 = (double)(int)(v10 * v10) / 100.0;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v12 = (float)filteredBacklightCurrentLI2 + (float)((float)(v12 - (float)filteredBacklightCurrentLI2) * 0.11111);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v12;
  if (v9 <= v8) {
    int v13 = v8;
  }
  else {
    int v13 = v9;
  }
  int v14 = v13 & ~(v13 >> 31);
  int filteredTempRearCameraDie = self->_filteredTempRearCameraDie;
  if ((filteredTempRearCameraDie & 0x80000000) == 0) {
    int v14 = (int)(float)((float)filteredTempRearCameraDie + (float)((float)(v14 - filteredTempRearCameraDie) * 0.25));
  }
  self->_int filteredTempRearCameraDie = v14;
  if (v6 <= v9) {
    int v16 = v9;
  }
  else {
    int v16 = v6;
  }
  if (v16 <= v8) {
    int v16 = v8;
  }
  int filteredTempRearCameraDieWithDefault = self->_filteredTempRearCameraDieWithDefault;
  if ((filteredTempRearCameraDieWithDefault & 0x80000000) == 0) {
    int v16 = (int)(float)((float)filteredTempRearCameraDieWithDefault
  }
                     + (float)((float)(v16 - filteredTempRearCameraDieWithDefault) * 0.25));
  self->_int filteredTempRearCameraDieWithDefault = v16;
  int v18 = qword_1000AAD94;
  int filteredTempArc = self->_filteredTempArc;
  if ((filteredTempArc & 0x80000000) == 0) {
    int v18 = (int)(float)((float)filteredTempArc + (float)((float)(qword_1000AAD94 - filteredTempArc) * 0.16667));
  }
  self->_int filteredTempArc = v18;
  int filteredTP3R = self->_filteredTP3R;
  if ((filteredTP3R & 0x80000000) == 0) {
    int v7 = (int)(float)((float)filteredTP3R + (float)((float)(v7 - filteredTP3R) * 0.14286));
  }
  self->_int filteredTP3R = v7;
  id v21 = [(CommonProduct *)self findComponent:18];
  float v22 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v23 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v24 = v23;
  *(float *)&double v23 = v22;
  [v21 calculateControlEffort:v23 trigger:v24];
  sub_100031714(55, (int)((double)(int)v5 * 0.5+ -80.17+ (double)(int)v80 * 0.49+ (double)self->_filteredTempRearCameraDie * 0.01));
  sub_100031714(54, (int)((double)(int)v5 * 0.45 + 222.2 + (double)SHIDWORD(v80) * 0.48));
  sub_100031714(57, (int)((double)(int)v5 * 0.3 + -31.18 + (double)self->_filteredTP3R * 0.7));
  sub_100031714(60, (int)((double)(int)v5 * 0.7 + 109.92 + (double)(int)v81 * 0.22));
  sub_100031714(59, (int)((double)(int)v5 * 0.14+ 146.3+ (double)self->_filteredBacklightCurrentLI2 * 1.19+ (double)SHIDWORD(v81) * 0.83));
  sub_100031714(56, (int)((double)(int)v5 * 0.61 + -49.44 + (double)self->_filteredTP3R * 0.38));
  sub_100031714(58, (int)((double)(int)v5 * 0.64 + -15.28 + (double)self->_filteredTempRearCameraDieWithDefault * 0.32));
  sub_100031714(62, (int)((double)SHIDWORD(v81) * 0.88+ 330.2+ (double)SHIDWORD(v80) * 0.08+ (double)self->_filteredTempArc * 0.02));
  sub_100031714(63, v5);
  float v25 = (float)dword_1000AADA4;
  id v26 = [(CommonProduct *)self findComponent:19];
  float v27 = v25 / 100.0;
  *(float *)&double v28 = v27;
  [v26 calculateControlEffort:v28];
  id v29 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v30 = v27;
  [v29 calculateControlEffort:v30];
  float v31 = (float)dword_1000AADA8;
  id v32 = [(CommonProduct *)self findComponent:21];
  float v33 = v31 / 100.0;
  *(float *)&double v34 = v33;
  [v32 calculateControlEffort:v34];
  id v35 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v36 = v33;
  [v35 calculateControlEffort:v36];
  float v37 = (float)SHIDWORD(qword_1000AADAC);
  id v38 = [(CommonProduct *)self findComponent:23];
  float v39 = v37 / 100.0;
  *(float *)&double v40 = v39;
  [v38 calculateControlEffort:v40];
  id v41 = [(CommonProduct *)self findComponent:32];
  *(float *)&double v42 = v39;
  [v41 calculateControlEffort:v42];
  float v43 = (float)(int)qword_1000AADAC;
  id v44 = [(CommonProduct *)self findComponent:27];
  float v45 = v43 / 100.0;
  *(float *)&double v46 = v45;
  [v44 calculateControlEffort:v46];
  id v47 = [(CommonProduct *)self findComponent:33];
  *(float *)&double v48 = v45;
  [v47 calculateControlEffort:v48];
  float v49 = (float)(int)qword_1000AADB4;
  id v50 = [(CommonProduct *)self findComponent:24];
  *(float *)&double v51 = v49 / 100.0;
  [v50 calculateControlEffort:v51];
  float v52 = (float)dword_1000AADC4;
  id v53 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v54 = v52 / 100.0;
  [v53 calculateControlEffort:v54];
  float v55 = (float)SHIDWORD(qword_1000AADB4);
  id v56 = [(CommonProduct *)self findComponent:26];
  *(float *)&double v57 = v55 / 100.0;
  [v56 calculateControlEffort:v57];
  unsigned int v58 = [(CommonProduct *)self getChargerState];
  if (v58 - 10 > 0x3C) {
    goto LABEL_26;
  }
  if (((1 << (v58 - 10)) & 0x1004010000100000) == 0)
  {
    if (v58 == 10)
    {
      float v69 = (float)SHIDWORD(qword_1000AADAC);
      id v70 = [(CommonProduct *)self findComponent:28];
      *(float *)&double v71 = v69 / 100.0;
      [v70 calculateControlEffort:v71];
      float v72 = (float)(int)qword_1000AADAC;
      id v73 = [(CommonProduct *)self findComponent:29];
      *(float *)&double v74 = v72 / 100.0;
LABEL_28:
      [v73 calculateControlEffort:v74];
      id v77 = [(CommonProduct *)self findComponent:30];
      LODWORD(v78) = 30.0;
      [v77 calculateControlEffort:v78];
      id v67 = [(CommonProduct *)self findComponent:31];
      LODWORD(v68) = 30.0;
      goto LABEL_29;
    }
LABEL_26:
    if (v58) {
      return;
    }
    id v75 = [(CommonProduct *)self findComponent:28];
    LODWORD(v76) = 30.0;
    [v75 calculateControlEffort:v76];
    id v73 = [(CommonProduct *)self findComponent:29];
    LODWORD(v74) = 30.0;
    goto LABEL_28;
  }
  id v59 = [(CommonProduct *)self findComponent:28];
  LODWORD(v60) = 30.0;
  [v59 calculateControlEffort:v60];
  id v61 = [(CommonProduct *)self findComponent:29];
  LODWORD(v62) = 30.0;
  [v61 calculateControlEffort:v62];
  float v63 = (float)SHIDWORD(qword_1000AADAC);
  id v64 = [(CommonProduct *)self findComponent:30];
  *(float *)&double v65 = v63 / 100.0;
  [v64 calculateControlEffort:v65];
  float v66 = (float)(int)qword_1000AADAC;
  id v67 = [(CommonProduct *)self findComponent:31];
  *(float *)&double v68 = v66 / 100.0;
LABEL_29:

  [v67 calculateControlEffort:v68];
}

- (id)getGridX
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013AB8;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000A26A8 != -1) {
    dispatch_once(&qword_1000A26A8, block);
  }
  return self->gridX;
}

- (id)getGridY
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013B94;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000A26B0 != -1) {
    dispatch_once(&qword_1000A26B0, block);
  }
  return self->gridY;
}

- (int)compute2DGridTemps
{
  int v3 = [(tma6b2eecc4252564f599b9a979e4e0602 *)self gasGaugeBatteryTemperature];
  int v5 = HIDWORD(qword_1000AACCC);
  int v4 = qword_1000AACD4;
  int v6 = qword_1000AACDC;
  int v7 = dword_1000AACE4;
  int v8 = HIDWORD(qword_1000AAD88);
  int filteredTP3R_2DGrid = self->_filteredTP3R_2DGrid;
  if ((filteredTP3R_2DGrid & 0x80000000) == 0) {
    int v6 = (int)(float)((float)filteredTP3R_2DGrid + (float)((float)(qword_1000AACDC - filteredTP3R_2DGrid) * 0.33333));
  }
  self->_int filteredTP3R_2DGrid = v6;
  int32x2_t v10 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067A00, (float64x2_t)xmmword_1000679F0, (double)v3), (float64x2_t)xmmword_100067A10, (double)v5), (float64x2_t)xmmword_100067A20, (double)v8)));
  *(int32x2_t *)self->super.baseVT = v10;
  *(int32x2_t *)&self->super.baseVT[2] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067A40, (float64x2_t)xmmword_100067A30, (double)v3), (float64x2_t)xmmword_100067A50, (double)v5), (float64x2_t)xmmword_100067A60, (double)v8)));
  self->super.baseVT[4] = (int)((double)v5 * 0.55 + -165.0 + (double)v8 * 0.48);
  *(int32x2_t *)&self->super.baseVT[5] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067A80, (float64x2_t)xmmword_100067A70, (double)v3), (float64x2_t)xmmword_100067A90, (double)v5), (float64x2_t)xmmword_100067AA0, (double)v8)));
  *(int32x2_t *)&self->super.baseVT[7] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067AC0, (float64x2_t)xmmword_100067AB0, (double)v3), (float64x2_t)xmmword_100067AD0, (double)v5), (float64x2_t)xmmword_100067AE0, (double)v8)));
  self->super.baseVT[9] = (int)((double)v5 * 0.13 + -262.0 + (double)v4 * 0.34 + (double)v8 * 0.59);
  *(int32x2_t *)&self->super.baseVT[10] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067AF0, (float64x2_t)vdupq_n_s64(0x3FD1DB22D0E56042uLL), (double)v3), (float64x2_t)xmmword_100067B00, (double)v5), (float64x2_t)xmmword_100067B10, (double)v8)));
  *(int32x2_t *)&self->super.baseVT[12] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067B30, (float64x2_t)xmmword_100067B20, (double)v3), (float64x2_t)xmmword_100067B40, (double)v5), (float64x2_t)xmmword_100067B50, (double)v8)));
  self->super.baseVT[14] = (int)((double)v5 * 0.09
                               + -293.0
                               + (double)self->_filteredTP3R_2DGrid * 0.29
                               + (double)v8 * 0.71);
  *(int32x2_t *)&self->super.baseVT[15] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067B70, (float64x2_t)xmmword_100067B60, (double)v3), (float64x2_t)xmmword_100067B80, (double)v8)));
  *(int32x2_t *)&self->super.baseVT[17] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067BA0, (float64x2_t)xmmword_100067B90, (double)v3), (float64x2_t)xmmword_100067BB0, (double)v8)));
  self->super.baseVT[19] = (int)((double)v3 * 0.13 + -142.0 + (double)v7 * 0.01 + (double)v8 * 0.91);
  self->super.baseVT[20] = (int)((double)v3 * -0.148 + -208.0 + (double)v8 * 1.23);
  self->super.baseVT[21] = (int)((double)self->_filteredTP3R_2DGrid * -0.02 + -92.1 + (double)v8 * 1.07);
  self->super.baseVT[22] = (int)((double)v3 * -0.01 + -21.0 + (double)v8 * 1.05);
  self->super.baseVT[23] = (int)((double)v3 * 0.07 + 13.1 + (double)v5 * -0.05 + (double)v8 * 1.02);
  self->super.baseVT[24] = (int)((double)v3 * -0.02 + -118.0 + (double)v7 * -0.04 + (double)v8 * 1.13);
  int32x4_t v11 = vdupq_lane_s32(v10, 0);
  uint64_t v12 = 1;
  int32x4_t v13 = v11;
  do
  {
    int32x4_t v14 = *(int32x4_t *)&self->super.baseVT[v12];
    int32x4_t v13 = vminq_s32(v13, v14);
    int32x4_t v11 = vmaxq_s32(v11, v14);
    v12 += 4;
  }
  while (v12 != 25);
  sub_100031714(61, (vmaxvq_s32(v11) - vminvq_s32(v13)));
  return self->super.baseVT;
}

- (void)updateCoreAnalyticsInfo
{
}

@end