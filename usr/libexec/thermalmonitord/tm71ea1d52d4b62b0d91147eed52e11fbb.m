@interface tm71ea1d52d4b62b0d91147eed52e11fbb
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

@implementation tm71ea1d52d4b62b0d91147eed52e11fbb

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)tm71ea1d52d4b62b0d91147eed52e11fbb;
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
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredArcModuleTemperature = -1;
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
  uint64_t v4 = qword_1000AACCC;
  int v5 = qword_1000AACD4;
  unint64_t v84 = __PAIR64__(HIDWORD(qword_1000AACD4), HIDWORD(qword_1000AACCC));
  int v6 = qword_1000AACDC;
  int v7 = dword_1000AACE4;
  int v9 = qword_1000AAD9C;
  int v8 = HIDWORD(qword_1000AAD9C);
  int v86 = HIDWORD(qword_1000AAD88);
  int v87 = HIDWORD(qword_1000AACDC);
  if (a3) {
    [(tm71ea1d52d4b62b0d91147eed52e11fbb *)self resetVTFilterState];
  }
  if (v9 <= v8) {
    int v10 = v8;
  }
  else {
    int v10 = v9;
  }
  int v11 = v10 & ~(v10 >> 31);
  int filteredTempRearCameraDie = self->_filteredTempRearCameraDie;
  if ((filteredTempRearCameraDie & 0x80000000) == 0) {
    int v11 = (int)(float)((float)filteredTempRearCameraDie + (float)((float)(v11 - filteredTempRearCameraDie) * 0.25));
  }
  self->_int filteredTempRearCameraDie = v11;
  if (v6 <= v9) {
    int v13 = v9;
  }
  else {
    int v13 = v6;
  }
  if (v13 <= v8) {
    int v13 = v8;
  }
  int filteredTempRearCameraDieWithDefault = self->_filteredTempRearCameraDieWithDefault;
  if ((filteredTempRearCameraDieWithDefault & 0x80000000) == 0) {
    int v13 = (int)(float)((float)filteredTempRearCameraDieWithDefault
  }
                     + (float)((float)(v13 - filteredTempRearCameraDieWithDefault) * 0.25));
  self->_int filteredTempRearCameraDieWithDefault = v13;
  unsigned int v15 = [[-[CommonProduct findComponent:](self, "findComponent:", 0, v84) currentLoadingIndex];
  float v16 = (double)(int)(v15 * v15) / 100.0;
  int filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0) {
    float v16 = (float)filteredBacklightCurrentLI2 + (float)((float)(v16 - (float)filteredBacklightCurrentLI2) * 0.14286);
  }
  self->_int filteredBacklightCurrentLI2 = (int)v16;
  int v18 = qword_1000AAD94 & ~((int)qword_1000AAD94 >> 31);
  int filteredArcModuleTemperature = self->_filteredArcModuleTemperature;
  if ((filteredArcModuleTemperature & 0x80000000) == 0) {
    int v18 = (int)(float)((float)filteredArcModuleTemperature
  }
                     + (float)((float)(v18 - filteredArcModuleTemperature) * 0.16667));
  self->_int filteredArcModuleTemperature = v18;
  id v20 = [(CommonProduct *)self findComponent:18];
  float v21 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  double v22 = (double)[(CommonProduct *)self dieTempFilteredMaxAverage] / 100.0;
  *(float *)&double v23 = v22;
  *(float *)&double v22 = v21;
  [v20 calculateControlEffort:v22 trigger:v23];
  sub_100031714(55, (int)((double)(int)v4 * 0.44+ -10.62+ (double)v7 * 0.52+ (double)self->_filteredTempRearCameraDie * 0.021));
  sub_100031714(54, (int)((double)v5 * 0.61 + 144.25 + (double)v7 * 0.32));
  sub_100031714(60, (int)((double)(int)v85 * 1.01 + -106.0 + (double)SHIDWORD(v85) * -0.02));
  sub_100031714(59, (int)((double)v86 * 0.59+ -30.85+ (double)self->_filteredBacklightCurrentLI2 * 0.85+ (double)(int)v4 * 0.4));
  sub_100031714(56, (int)((double)(int)v85 * 0.37 + -63.16 + (double)v87 * 0.59));
  sub_100031714(57, (int)((double)v5 * 0.58 + -74.85 + (double)v87 * 0.4));
  sub_100031714(58, (int)((double)(int)v85 * 0.64 + -1.74 + (double)self->_filteredTempRearCameraDieWithDefault * 0.32));
  sub_100031714(62, (int)((double)v86 * 0.82+ 330.2+ (double)SHIDWORD(v85) * 0.08+ (double)self->_filteredArcModuleTemperature * 0.05));
  sub_100031714(63, v4);
  float v24 = (float)dword_1000AADA4;
  id v25 = [(CommonProduct *)self findComponent:19];
  float v26 = v24 / 100.0;
  *(float *)&double v27 = v26;
  [v25 calculateControlEffort:v27];
  id v28 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v29 = v26;
  [v28 calculateControlEffort:v29];
  float v30 = (float)dword_1000AADA8;
  id v31 = [(CommonProduct *)self findComponent:21];
  float v32 = v30 / 100.0;
  *(float *)&double v33 = v32;
  [v31 calculateControlEffort:v33];
  id v34 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v35 = v32;
  [v34 calculateControlEffort:v35];
  float v36 = (float)SHIDWORD(qword_1000AADAC);
  id v37 = [(CommonProduct *)self findComponent:23];
  float v38 = v36 / 100.0;
  *(float *)&double v39 = v38;
  [v37 calculateControlEffort:v39];
  id v40 = [(CommonProduct *)self findComponent:28];
  *(float *)&double v41 = v38;
  [v40 calculateControlEffort:v41];
  float v42 = (float)(int)qword_1000AADAC;
  id v43 = [(CommonProduct *)self findComponent:27];
  float v44 = v42 / 100.0;
  *(float *)&double v45 = v44;
  [v43 calculateControlEffort:v45];
  id v46 = [(CommonProduct *)self findComponent:29];
  *(float *)&double v47 = v44;
  [v46 calculateControlEffort:v47];
  float v48 = (float)(int)qword_1000AADB4;
  id v49 = [(CommonProduct *)self findComponent:24];
  *(float *)&double v50 = v48 / 100.0;
  [v49 calculateControlEffort:v50];
  float v51 = (float)dword_1000AADC4;
  id v52 = [(CommonProduct *)self findComponent:25];
  *(float *)&double v53 = v51 / 100.0;
  [v52 calculateControlEffort:v53];
  float v54 = (float)SHIDWORD(qword_1000AADB4);
  id v55 = [(CommonProduct *)self findComponent:26];
  *(float *)&double v56 = v54 / 100.0;
  [v55 calculateControlEffort:v56];
  unsigned int v57 = [(CommonProduct *)self getChargerState];
  if (v57 - 10 > 0x3C) {
    goto LABEL_24;
  }
  if (((1 << (v57 - 10)) & 0x1004010000100000) == 0)
  {
    if (v57 == 10)
    {
      float v68 = (float)SHIDWORD(qword_1000AADAC);
      id v69 = [(CommonProduct *)self findComponent:32];
      *(float *)&double v70 = v68 / 100.0;
      [v69 calculateControlEffort:v70];
      float v71 = (float)(int)qword_1000AADAC;
      id v72 = [(CommonProduct *)self findComponent:33];
      *(float *)&double v73 = v71 / 100.0;
      [v72 calculateControlEffort:v73];
      id v74 = [(CommonProduct *)self findComponent:30];
      LODWORD(v75) = 30.0;
      [v74 calculateControlEffort:v75];
      v76 = self;
      uint64_t v77 = 31;
LABEL_26:
      id v66 = [(CommonProduct *)v76 findComponent:v77];
      LODWORD(v67) = 30.0;
      goto LABEL_27;
    }
LABEL_24:
    if (v57) {
      return;
    }
    id v78 = [(CommonProduct *)self findComponent:30];
    LODWORD(v79) = 30.0;
    [v78 calculateControlEffort:v79];
    id v80 = [(CommonProduct *)self findComponent:31];
    LODWORD(v81) = 30.0;
    [v80 calculateControlEffort:v81];
    id v82 = [(CommonProduct *)self findComponent:32];
    LODWORD(v83) = 30.0;
    [v82 calculateControlEffort:v83];
    v76 = self;
    uint64_t v77 = 33;
    goto LABEL_26;
  }
  id v58 = [(CommonProduct *)self findComponent:32];
  LODWORD(v59) = 30.0;
  [v58 calculateControlEffort:v59];
  id v60 = [(CommonProduct *)self findComponent:33];
  LODWORD(v61) = 30.0;
  [v60 calculateControlEffort:v61];
  float v62 = (float)SHIDWORD(qword_1000AADAC);
  id v63 = [(CommonProduct *)self findComponent:30];
  *(float *)&double v64 = v62 / 100.0;
  [v63 calculateControlEffort:v64];
  float v65 = (float)(int)qword_1000AADAC;
  id v66 = [(CommonProduct *)self findComponent:31];
  *(float *)&double v67 = v65 / 100.0;
LABEL_27:

  [v66 calculateControlEffort:v67];
}

- (id)getGridX
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B380;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000AA728 != -1) {
    dispatch_once(&qword_1000AA728, block);
  }
  return self->gridX;
}

- (id)getGridY
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B45C;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000AA730 != -1) {
    dispatch_once(&qword_1000AA730, block);
  }
  return self->gridY;
}

- (int)compute2DGridTemps
{
  int v3 = [(tm71ea1d52d4b62b0d91147eed52e11fbb *)self gasGaugeBatteryTemperature];
  int v4 = HIDWORD(qword_1000AACD4);
  int v6 = HIDWORD(qword_1000AACDC);
  int v5 = dword_1000AACE4;
  double v7 = (double)(int)qword_1000AACD4;
  double v8 = (double)SHIDWORD(qword_1000AAD88);
  baseVT = self->super.baseVT;
  int32x2_t v10 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067A00, (float64x2_t)xmmword_1000679F0, (double)v3), (float64x2_t)xmmword_100067A10, (double)(int)qword_1000AACD4), (float64x2_t)xmmword_100067A20, (double)SHIDWORD(qword_1000AAD88))));
  int32x2_t v11 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100069180, (float64x2_t)xmmword_100067A30, (double)v3), (float64x2_t)xmmword_100069190, (double)(int)qword_1000AACD4), (float64x2_t)xmmword_1000691A0, (double)SHIDWORD(qword_1000AAD88))));
  *(int32x2_t *)baseVT = v10;
  *((int32x2_t *)baseVT + 1) = v11;
  baseVT[4] = (int)(v7 * 0.55 + -135.0 + v8 * 0.42);
  *(int32x2_t *)(baseVT + 5) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000691B0, (float64x2_t)xmmword_100067A70, (double)v3), (float64x2_t)xmmword_1000691C0, v7), (float64x2_t)xmmword_100067AA0, v8)));
  *(int32x2_t *)(baseVT + 7) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000691D0, (float64x2_t)xmmword_100067AB0, (double)v3), (float64x2_t)xmmword_1000691E0, v7), (float64x2_t)xmmword_100067AE0, v8)));
  baseVT[9] = (int)(v7 * 0.13 + -262.0 + (double)v4 * 0.34 + v8 * 0.59);
  *((int32x2_t *)baseVT + 5) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067AF0, (float64x2_t)vdupq_n_s64(0x3FD1DB22D0E56042uLL), (double)v3), (float64x2_t)xmmword_100067B00, v7), (float64x2_t)xmmword_100067B10, v8)));
  *((int32x2_t *)baseVT + 6) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067B30, (float64x2_t)xmmword_100067B20, (double)v3), (float64x2_t)xmmword_1000691F0, v7), (float64x2_t)xmmword_100069200, v8)));
  baseVT[14] = (int)(v7 * 0.1 + -243.0 + (double)v6 * 0.29 + v8 * 0.71);
  *(int32x2_t *)(baseVT + 15) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100069220, (float64x2_t)xmmword_100069210, (double)v3), (float64x2_t)xmmword_100069230, v8)));
  *(int32x2_t *)(baseVT + 17) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067BA0, (float64x2_t)xmmword_100067B90, (double)v3), (float64x2_t)xmmword_100069240, v8)));
  baseVT[19] = (int)((double)v3 * 0.13 + -142.0 + (double)v5 * 0.01 + v8 * 0.91);
  baseVT[20] = (int)((double)v3 * -0.148 + 3.0 + v8 * 1.13);
  baseVT[21] = (int)((double)v6 * -0.02 + -92.1 + v8 * 1.05);
  baseVT[22] = (int)((double)v3 * -0.01 + -21.0 + v8 * 1.05);
  baseVT[23] = (int)((double)v3 * 0.07 + 13.1 + v7 * -0.05 + v8 * 0.99);
  baseVT[24] = (int)((double)v3 * -0.02 + -118.0 + (double)v5 * -0.04 + v8 * 1.13);
  int32x4_t v12 = vdupq_lane_s32(v10, 0);
  uint64_t v13 = 1;
  int32x4_t v14 = v12;
  do
  {
    int32x4_t v15 = *(int32x4_t *)&baseVT[v13];
    int32x4_t v12 = vminq_s32(v12, v15);
    int32x4_t v14 = vmaxq_s32(v14, v15);
    v13 += 4;
  }
  while (v13 != 25);
  sub_100031714(61, (vmaxvq_s32(v14) - vminvq_s32(v12)));
  return baseVT;
}

- (void)updateCoreAnalyticsInfo
{
}

@end