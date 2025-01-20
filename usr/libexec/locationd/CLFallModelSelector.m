@interface CLFallModelSelector
- (BOOL)fillFallThresholds:(FallThresholds *)a3;
- (BOOL)fillOtherFallModel:(FallModel *)a3;
- (BOOL)fillSlipFallModel:(FallModel *)a3;
- (BOOL)fillTripFallModel:(FallModel *)a3;
- (BOOL)selectModels;
- (BOOL)setSelectionFeatureValue:(id)a3 value:(id)a4;
- (CLFallModelSelector)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation CLFallModelSelector

- (CLFallModelSelector)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLFallModelSelector;
  [(CLFallModelSelector *)&v4 init];
  if (self) {
    self->fSelectionFeatures = (NSMutableDictionary *)objc_opt_new();
  }
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFallModelSelector;
  [(CLFallModelSelector *)&v3 dealloc];
}

- (BOOL)setSelectionFeatureValue:(id)a3 value:(id)a4
{
  return 1;
}

- (BOOL)selectModels
{
  *(_OWORD *)self->fTripFallModel.fRatioMaxAbsX = xmmword_102477DB0;
  LODWORD(self->fTripFallModel.fRatioMaxAbsX[16]) = dword_102477DF0;
  long long v3 = xmmword_102477DE0;
  long long v4 = xmmword_102477DC0;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[8] = unk_102477DD0;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[12] = v3;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[4] = v4;
  LODWORD(self->fTripFallModel.fRatioMaxAbsY[16]) = dword_102477E34;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[12] = unk_102477E24;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[8] = unk_102477E14;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[4] = unk_102477E04;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAbsY = *(_OWORD *)algn_102477DF4;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAbsZ = unk_102477E38;
  long long v5 = unk_102477E48;
  long long v6 = unk_102477E58;
  long long v7 = unk_102477E68;
  LODWORD(self->fTripFallModel.fRatioMaxAbsZ[16]) = dword_102477E78;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[12] = v7;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[8] = v6;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[4] = v5;
  memcpy(self->fTripFallModel.fRatioMaxJerkVM, &unk_102477E7C, sizeof(self->fTripFallModel.fRatioMaxJerkVM));
  long long v8 = unk_102477F98;
  *(_OWORD *)self->fTripFallModel.fRatioMinInertialZ = xmmword_102477F88;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[4] = v8;
  LODWORD(self->fTripFallModel.fRatioMinInertialZ[20]) = dword_102477FD8;
  long long v9 = xmmword_102477FC8;
  long long v10 = xmmword_102477FA8;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[12] = unk_102477FB8;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[16] = v9;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[8] = v10;
  uint64_t v11 = qword_102477FFC;
  long long v12 = unk_102477FEC;
  *(_OWORD *)self->fTripFallModel.fRatioAccelPathLength = xmmword_102477FDC;
  *(_OWORD *)&self->fTripFallModel.fRatioAccelPathLength[4] = v12;
  *(void *)&self->fTripFallModel.fRatioAccelPathLength[8] = v11;
  long long v13 = xmmword_102478004;
  long long v14 = *(_OWORD *)algn_102478014;
  long long v15 = unk_102478034;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[8] = xmmword_102478024;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[12] = v15;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePreimpact = v13;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[4] = v14;
  long long v16 = xmmword_102478044;
  long long v17 = *(_OWORD *)algn_102478054;
  long long v18 = unk_102478074;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[8] = xmmword_102478064;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[12] = v18;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePostimpact = v16;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[4] = v17;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[0].double firstBinEdge = xmmword_102478084;
  long long v19 = xmmword_102478094;
  long long v20 = unk_1024780A4;
  long long v21 = xmmword_1024780B4;
  *(void *)&self->fTripFallModel.fLikelihoodRatioInfo[5].float binSize = qword_1024780C4;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[2].binNum = v20;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[4].double firstBinEdge = v21;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[1].float binSize = v19;
  long long v22 = xmmword_1024780CC;
  long long v23 = unk_1024780DC;
  long long v24 = xmmword_1024780EC;
  long long v25 = unk_1024780FC;
  LODWORD(self->fSlipFallModel.fRatioMaxAbsX[10]) = dword_10247810C;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[2] = v24;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[6] = v25;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[6].double firstBinEdge = v22;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[7].float binSize = v23;
  long long v26 = unk_102478110;
  long long v27 = unk_102478120;
  long long v28 = unk_102478130;
  long long v29 = unk_102478140;
  LODWORD(self->fSlipFallModel.fRatioMaxAbsY[10]) = dword_102478150;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[2] = v28;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[6] = v29;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[11] = v26;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[15] = v27;
  long long v30 = *(_OWORD *)algn_102478154;
  long long v31 = unk_102478164;
  long long v32 = unk_102478174;
  long long v33 = unk_102478184;
  LODWORD(self->fSlipFallModel.fRatioMaxAbsZ[10]) = dword_102478194;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[2] = v32;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[6] = v33;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[11] = v30;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[15] = v31;
  memcpy(&self->fSlipFallModel.fRatioMaxAbsZ[11], &unk_102478198, 0x10CuLL);
  long long v34 = unk_1024782D4;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[2] = xmmword_1024782C4;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[6] = v34;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[10] = xmmword_1024782E4;
  LODWORD(self->fSlipFallModel.fRatioMinInertialZ[14]) = dword_1024782F4;
  long long v35 = unk_1024782B4;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[61] = xmmword_1024782A4;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[65] = v35;
  long long v36 = unk_102478308;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[15] = xmmword_1024782F8;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[19] = v36;
  *(void *)&self->fSlipFallModel.fRatioAccelPathLength[2] = qword_102478318;
  long long v37 = xmmword_102478340;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[6] = unk_102478350;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[2] = v37;
  long long v38 = xmmword_102478320;
  *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[8] = *(_OWORD *)algn_102478330;
  *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[4] = v38;
  long long v39 = xmmword_102478380;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[6] = unk_102478390;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[2] = v39;
  long long v40 = xmmword_102478360;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[14] = *(_OWORD *)algn_102478370;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[10] = v40;
  long long v41 = unk_1024783B0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[10] = xmmword_1024783A0;
  long long v42 = xmmword_1024783C0;
  long long v43 = unk_1024783D0;
  *(void *)&self->fSlipFallModel.fLikelihoodRatioInfo[3].float binSize = qword_1024783E0;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[2].double firstBinEdge = v43;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[0].binNum = v42;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[14] = v41;
  long long v44 = xmmword_1024783E8;
  long long v45 = unk_1024783F8;
  long long v46 = xmmword_102478408;
  long long v47 = unk_102478418;
  LODWORD(self->fOtherFallModel.fRatioMaxAbsX[4]) = dword_102478428;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[6].binNum = v46;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsX = v47;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[4].double firstBinEdge = v44;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[5].float binSize = v45;
  long long v48 = unk_10247842C;
  long long v49 = unk_10247843C;
  long long v50 = unk_10247844C;
  long long v51 = unk_10247845C;
  LODWORD(self->fOtherFallModel.fRatioMaxAbsY[4]) = dword_10247846C;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[13] = v50;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsY = v51;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[5] = v48;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[9] = v49;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[5] = unk_102478470;
  long long v52 = unk_102478480;
  long long v53 = unk_102478490;
  long long v54 = unk_1024784A0;
  LODWORD(self->fOtherFallModel.fRatioMaxAbsZ[4]) = dword_1024784B0;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsZ = v54;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[13] = v53;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[9] = v52;
  memcpy(&self->fOtherFallModel.fRatioMaxAbsZ[5], &unk_1024784B4, 0x10CuLL);
  long long v55 = unk_1024785F0;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[63] = xmmword_1024785E0;
  *(_OWORD *)self->fOtherFallModel.fRatioMinInertialZ = v55;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[4] = xmmword_102478600;
  LODWORD(self->fOtherFallModel.fRatioMinInertialZ[8]) = dword_102478610;
  long long v56 = unk_1024785D0;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[55] = xmmword_1024785C0;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[59] = v56;
  long long v57 = unk_102478624;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[9] = xmmword_102478614;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[13] = v57;
  *(void *)&self->fOtherFallModel.fRatioMinInertialZ[17] = qword_102478634;
  long long v58 = unk_10247866C;
  *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[6] = xmmword_10247865C;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePreimpact = v58;
  long long v59 = *(_OWORD *)algn_10247864C;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[19] = xmmword_10247863C;
  *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[2] = v59;
  long long v60 = unk_1024786AC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[12] = xmmword_10247869C;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePostimpact = v60;
  long long v61 = *(_OWORD *)algn_10247868C;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[4] = xmmword_10247867C;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[8] = v61;
  long long v62 = xmmword_1024786BC;
  long long v63 = unk_1024786CC;
  long long v64 = xmmword_1024786DC;
  long long v65 = unk_1024786EC;
  *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[1].float binSize = qword_1024786FC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[12] = v64;
  *(_OWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[0].double firstBinEdge = v65;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[4] = v62;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[8] = v63;
  id v66 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"Age"];
  id v67 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"Gender"];
  id v68 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"Height"];
  id v69 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"Weight"];
  id v70 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"Pal"];
  id v71 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"Vo2max"];
  id v72 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"MetMinPercentile"];
  id v182 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"MetMinCount"];
  id v73 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"Workout"];
  id v74 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"HKWorkout"];
  id v183 = [(NSMutableDictionary *)self->fSelectionFeatures objectForKey:@"BackgroundAWDLoggingEnabled"];
  if (v66) {
    [v66 floatValue];
  }
  else {
    *(float *)&int v75 = NAN;
  }
  float v195 = *(float *)&v75;
  unsigned int v194 = [v67 intValue];
  if (v68) {
    [v68 floatValue];
  }
  else {
    *(float *)&int v76 = NAN;
  }
  float v193 = *(float *)&v76;
  if (v69) {
    [v69 floatValue];
  }
  else {
    *(float *)&int v77 = NAN;
  }
  float v192 = *(float *)&v77;
  if (v70) {
    [v70 floatValue];
  }
  else {
    *(float *)&int v78 = NAN;
  }
  float v191 = *(float *)&v78;
  if (v71) {
    [v71 floatValue];
  }
  else {
    *(float *)&int v79 = NAN;
  }
  float v190 = *(float *)&v79;
  if (v72) {
    [v72 doubleValue];
  }
  else {
    *(double *)&uint64_t v80 = NAN;
  }
  double v189 = *(double *)&v80;
  if (v182) {
    id v81 = [v72 integerValue];
  }
  else {
    id v81 = 0;
  }
  unint64_t v188 = (unint64_t)v81;
  if (v73) {
    id v82 = [v73 integerValue];
  }
  else {
    id v82 = 0;
  }
  id v187 = v82;
  if (v74) {
    id v83 = [v74 integerValue];
  }
  else {
    id v83 = 0;
  }
  id v186 = v83;
  if (v183) {
    unsigned int v84 = [v183 BOOLValue];
  }
  else {
    unsigned int v84 = 0;
  }
  sub_1004EE5CC("BehaviorOverrideAge", &v195);
  sub_1004EE720("BehaviorOverrideGender", (int *)&v194);
  sub_1004EE5CC("BehaviorOverrideHeight", &v193);
  sub_1004EE5CC("BehaviorOverrideWeight", &v192);
  sub_1004EE5CC("BehaviorOverridePal", &v191);
  sub_1004EE5CC("BehaviorOverrideVO2Max", &v190);
  sub_1000C7F88(buf);
  int v85 = sub_1000A699C(*(uint64_t *)buf, "BehaviorOverrideMetMinPercentile", &v189);
  if (*(void *)v197) {
    sub_1000DB0A0(*(std::__shared_weak_count **)v197);
  }
  if (v85)
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1022B7650);
    }
    v86 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v197 = 2082;
      *(void *)&v197[2] = "";
      __int16 v198 = 2082;
      double v199 = COERCE_DOUBLE("BehaviorOverrideMetMinPercentile");
      __int16 v200 = 1026;
      *(_DWORD *)v201 = (int)v189;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Overriding behavior feature\", \"key\":%{public, location:escape_only}s, \"value\":%{public}d}", buf, 0x22u);
    }
  }
  sub_1004EE870("BehaviorOverrideMetMinCount", (uint64_t *)&v188);
  sub_1004EE870("BehaviorOverrideWorkout", (uint64_t *)&v187);
  sub_1004EE870("BehaviorOverrideHKWorkout", (uint64_t *)&v186);
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_1022B7650);
  }
  v87 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68291587;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v197 = 2082;
    *(void *)&v197[2] = "";
    __int16 v198 = 2049;
    double v199 = v195;
    __int16 v200 = 1025;
    *(_DWORD *)v201 = v194;
    *(_WORD *)&v201[4] = 2049;
    *(double *)&v201[6] = v193;
    *(_WORD *)&v201[14] = 2049;
    *(double *)&v201[16] = v192;
    *(_WORD *)&v201[24] = 2049;
    *(double *)&v201[26] = v191;
    *(_WORD *)&v201[34] = 2049;
    *(double *)&v201[36] = v190;
    *(_WORD *)&v201[44] = 2049;
    *(double *)&v201[46] = v189;
    *(_WORD *)&v201[54] = 2049;
    *(void *)&v201[56] = v188;
    *(_WORD *)v202 = 2049;
    *(void *)&v202[2] = v187;
    *(_WORD *)v203 = 2049;
    *(void *)&v203[2] = v186;
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Selecting models\", \"age\":\"%{private}f\", \"gender\":%{private}d, \"height\":\"%{private}f\", \"weight\":\"%{private}f\", \"pal\":\"%{private}f\", \"vo2max\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"metminCount\":%{private}ld, \"workout\":%{private}ld, \"hkWorkout\":%{private}ld}", buf, 0x72u);
  }
  v88 = &self->fOtherFallModel.fLikelihoodRatioInfo[2];
  *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[4].float binSize = 0x41A0000041033333;
  self->fOtherFallModel.fLikelihoodRatioInfo[5].double firstBinEdge = 8.0;
  float v89 = v195;
  if ((LODWORD(v195) & 0x7FFFFFFFu) > 0x7F7FFFFF || v195 < 65.0)
  {
    *(_OWORD *)&v88->double firstBinEdge = xmmword_101D21EA0;
    *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[3].float binSize = 0x420A666640900000;
    self->fOtherFallModel.fLikelihoodRatioInfo[4].double firstBinEdge = 4.3;
    *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].float binSize = 0xA00000023;
    self->fOtherFallModel.fLikelihoodRatioInfo[6].double firstBinEdge = 0.05;
    self->fOtherFallModel.fLikelihoodRatioInfo[7].double firstBinEdge = 7.0;
    *(void *)&self->fThresholds.float fImpactMaxAccelNormAlertThreshold = 0x1400000014;
    LODWORD(self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold) = 30;
    LOWORD(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 257;
    BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 1;
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1022B7650);
    }
    v93 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
    {
      double firstBinEdge = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
      float binSize = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
      int v96 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
      double v97 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
      double v98 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
      float fImpactMaxAccelNormAlertThreshold = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
      float fImpactMaxAccelNormLoggingStatsThreshold = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
      float fImpactMaxAccelNormLoggingHeartRateThreshold = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
      int fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold_low = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v103 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v104 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      *(_DWORD *)buf = 68292355;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v197 = 2082;
      *(void *)&v197[2] = "";
      __int16 v198 = 2050;
      double v199 = firstBinEdge;
      __int16 v200 = 2049;
      *(double *)v201 = v195;
      *(_WORD *)&v201[8] = 1025;
      *(float *)&v201[10] = binSize;
      *(_WORD *)&v201[14] = 1025;
      *(_DWORD *)&v201[16] = v96;
      *(_WORD *)&v201[20] = 2049;
      *(double *)&v201[22] = v189;
      *(_WORD *)&v201[30] = 2049;
      *(double *)&v201[32] = v97;
      *(_WORD *)&v201[40] = 2049;
      *(double *)&v201[42] = v98;
      *(_WORD *)&v201[50] = 1025;
      *(float *)&v201[52] = fImpactMaxAccelNormAlertThreshold;
      *(_WORD *)&v201[56] = 1025;
      *(float *)&v201[58] = fImpactMaxAccelNormLoggingStatsThreshold;
      *(_WORD *)&v201[62] = 1025;
      *(float *)v202 = fImpactMaxAccelNormLoggingHeartRateThreshold;
      *(_WORD *)&v202[4] = 1025;
      *(_DWORD *)&v202[6] = fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold_low;
      *(_WORD *)v203 = 1025;
      *(_DWORD *)&v203[2] = v103;
      *(_WORD *)&v203[6] = 1025;
      *(_DWORD *)&v203[8] = v104;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Model Selector - Picked thresholds based on features\", \"impactMaxAccelNormAlertThreshold\":\"%{public}f\", \"age\":\"%{private}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{private}d, \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThreshold\":\"%{private}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresholdLow\":%{private}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLieThreshold\":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}", buf, 0x74u);
    }
    if (v84)
    {
      *(_DWORD *)buf = -1;
      uint64_t v105 = sub_1000A6958();
      sub_10013E418(v105, @"FallRandomBucket", buf);
      uint32_t v106 = *(_DWORD *)buf;
      if (*(_DWORD *)buf >= 6u)
      {
        uint32_t v106 = arc4random_uniform(6u);
        *(_DWORD *)buf = v106;
        uint64_t v107 = sub_1000A6958();
        sub_1000EA2A4(v107, @"FallRandomBucket", buf);
        uint64_t v108 = sub_1000A6958();
        (*(void (**)(uint64_t))(*(void *)v108 + 944))(v108);
      }
      LODWORD(v88->firstBinEdge) = dword_101D9C85C[v106];
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_1022B7650);
      }
      v109 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
      {
        double v110 = v88->firstBinEdge;
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v197 = 2082;
        *(void *)&v197[2] = "";
        __int16 v198 = 2050;
        double v199 = v110;
        __int16 v200 = 2049;
        *(double *)v201 = v195;
        *(_WORD *)&v201[8] = 2049;
        *(double *)&v201[10] = v189;
        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Model Selector - Revised thresholds based on background analytics requirements\", \"impactMaxAccelNormAlertThreshold\":\"%{public}f\", \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\"}", buf, 0x30u);
      }
    }
  }
  else
  {
    *(_OWORD *)&v88->double firstBinEdge = xmmword_101D21EB0;
    *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[3].float binSize = 0x420A666640900000;
    self->fOtherFallModel.fLikelihoodRatioInfo[4].double firstBinEdge = 4.3;
    *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].float binSize = 0xA00000018;
    self->fOtherFallModel.fLikelihoodRatioInfo[6].double firstBinEdge = 0.05;
    self->fOtherFallModel.fLikelihoodRatioInfo[7].double firstBinEdge = 10.0;
    uint64_t v90 = 0x600000006;
    if (((v186 - 3) > 0x3E || ((1 << (v186 - 3)) & 0x402931C2835080BFLL) == 0)
      && v186 != 1)
    {
      uint64_t v90 = 0x300000002;
    }
    *(void *)&self->fThresholds.float fImpactMaxAccelNormAlertThreshold = v90;
    LODWORD(self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold) = 10;
    LOWORD(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 0;
    BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 0;
    if ((*(void *)&v189 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    {
      int v92 = -1;
    }
    else
    {
      float v91 = v189;
      if (v91 >= 2.4)
      {
        if (v91 <= 5.1)
        {
          uint64_t v153 = 0;
          int v92 = -1;
          float v154 = NAN;
          do
          {
            float v155 = vabds_f32(v91, dword_101D9BF9C[v153]);
            if (v155 < v154 || (LODWORD(v154) & 0x7FFFFFFFu) > 0x7F7FFFFF)
            {
              int v92 = v153;
              float v154 = v155;
            }
            ++v153;
          }
          while (v153 != 28);
        }
        else
        {
          int v92 = 27;
        }
      }
      else
      {
        int v92 = 0;
      }
    }
    if (v89 < 68.0)
    {
      unsigned int v111 = 0;
      goto LABEL_78;
    }
    if (v89 > 86.0)
    {
      unsigned int v111 = 18;
      goto LABEL_78;
    }
    uint64_t v112 = 0;
    unsigned int v111 = -1;
    float v113 = NAN;
    do
    {
      float v114 = vabds_f32(v89, dword_101D9BF50[v112]);
      if (v114 < v113 || (LODWORD(v113) & 0x7FFFFFFFu) > 0x7F7FFFFF)
      {
        unsigned int v111 = v112;
        float v113 = v114;
      }
      ++v112;
    }
    while (v112 != 19);
    if ((v111 & 0x80000000) == 0)
    {
LABEL_78:
      float v117 = *((float *)&unk_101D9C00C + v111 + 266);
      if (v92 < 0)
      {
        v88->double firstBinEdge = v117;
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_1022B7650);
        }
        uint64_t v122 = qword_1024190F8;
        if (!os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_93;
        }
        double v124 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
        float v125 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
        int v126 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
        double v127 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
        double v128 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
        float v129 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
        float v130 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
        float v131 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
        int v132 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        int v133 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        int v134 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        *(_DWORD *)buf = 68292355;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v197 = 2082;
        *(void *)&v197[2] = "";
        __int16 v198 = 2050;
        double v199 = v124;
        __int16 v200 = 1025;
        *(float *)v201 = v125;
        *(_WORD *)&v201[4] = 1025;
        *(_DWORD *)&v201[6] = v126;
        *(_WORD *)&v201[10] = 2049;
        *(double *)&v201[12] = v195;
        *(_WORD *)&v201[20] = 2049;
        *(double *)&v201[22] = v189;
        *(_WORD *)&v201[30] = 2049;
        *(double *)&v201[32] = v127;
        *(_WORD *)&v201[40] = 2049;
        *(double *)&v201[42] = v128;
        *(_WORD *)&v201[50] = 1025;
        *(float *)&v201[52] = v129;
        *(_WORD *)&v201[56] = 1025;
        *(float *)&v201[58] = v130;
        *(_WORD *)&v201[62] = 1025;
        *(float *)v202 = v131;
        *(_WORD *)&v202[4] = 1025;
        *(_DWORD *)&v202[6] = v132;
        *(_WORD *)v203 = 1025;
        *(_DWORD *)&v203[2] = v133;
        *(_WORD *)&v203[6] = 1025;
        *(_DWORD *)&v203[8] = v134;
        v135 = "{\"msg%{public}.0s\":\"Model Selector - Picked thresholds based on age only\", \"impactMaxAccelNormAlertT"
               "hreshold\":\"%{public}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{priva"
               "te}d, \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThreshold\":\"%{p"
               "rivate}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresholdLow\":%{p"
               "rivate}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLieThreshold\""
               ":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkoutShouldCancel"
               "AlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}";
        v136 = v122;
        uint32_t v137 = 116;
      }
      else
      {
        int v184 = 14;
        int v185 = 7;
        sub_1004EE720("BehaviorOverrideThresholdConvergenceMinimumDayCount", &v185);
        sub_1004EE720("BehaviorOverrideThresholdConvergenceMaximumDayCount", &v184);
        int v118 = 48 * v185;
        int v119 = 48 * v184;
        float v120 = (float)(uint64_t)(v188 - 48 * v185) / (float)(48 * v184 - 48 * v185);
        if (v120 >= 0.0)
        {
          float v138 = *((float *)&unk_101D9C00C + 19 * v92 + v111);
          if (v120 >= 1.0)
          {
            v88->double firstBinEdge = v138;
            double v121 = 1.0;
          }
          else
          {
            v88->double firstBinEdge = (float)(v117 * (float)(1.0 - v120)) + (float)(v120 * v138);
            double v121 = v120;
          }
        }
        else
        {
          v88->double firstBinEdge = v117;
          double v121 = 0.0;
        }
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_1022B7650);
        }
        uint64_t v139 = qword_1024190F8;
        if (!os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_93;
        }
        double v140 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
        float v141 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
        int v142 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
        double v143 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
        double v144 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
        float v145 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
        float v146 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
        float v147 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
        int v148 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        int v149 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        int v150 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        *(_DWORD *)buf = 68293379;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v197 = 2082;
        *(void *)&v197[2] = "";
        __int16 v198 = 2050;
        double v199 = v140;
        __int16 v200 = 1025;
        *(float *)v201 = v141;
        *(_WORD *)&v201[4] = 1025;
        *(_DWORD *)&v201[6] = v142;
        *(_WORD *)&v201[10] = 1026;
        *(_DWORD *)&v201[12] = v118;
        *(_WORD *)&v201[16] = 1026;
        *(_DWORD *)&v201[18] = v119;
        *(_WORD *)&v201[22] = 2050;
        *(void *)&v201[24] = v188;
        *(_WORD *)&v201[32] = 2050;
        *(double *)&v201[34] = v121;
        *(_WORD *)&v201[42] = 2049;
        *(double *)&v201[44] = v195;
        *(_WORD *)&v201[52] = 2049;
        *(double *)&v201[54] = v189;
        *(_WORD *)&v201[62] = 2049;
        *(double *)v202 = v143;
        *(_WORD *)&v202[8] = 2049;
        *(double *)v203 = v144;
        *(_WORD *)&v203[8] = 1025;
        *(float *)&v203[10] = v145;
        __int16 v204 = 1025;
        float v205 = v146;
        __int16 v206 = 1025;
        float v207 = v147;
        __int16 v208 = 1025;
        int v209 = v148;
        __int16 v210 = 1025;
        int v211 = v149;
        __int16 v212 = 1025;
        int v213 = v150;
        v135 = "{\"msg%{public}.0s\":\"Model Selector - Picked thresholds based on features\", \"impactMaxAccelNormAlertT"
               "hreshold\":\"%{public}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{priva"
               "te}d, \"minMetminCount\":%{public}d, \"maxMetminCount\":%{public}d, \"metminCount\":%{public}ld, \"alpha\""
               ":\"%{public}f\", \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThresh"
               "old\":\"%{private}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresho"
               "ldLow\":%{private}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLi"
               "eThreshold\":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkout"
               "ShouldCancelAlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}";
        v136 = v139;
        uint32_t v137 = 148;
      }
      _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, v135, buf, v137);
LABEL_93:
      v123.i32[0] = LODWORD(self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge);
      float32x2_t v151 = (float32x2_t)vdup_lane_s32(v123, 0);
      *(int8x8_t *)&self->fOtherFallModel.fLikelihoodRatioInfo[2].float binSize = vbsl_s8((int8x8_t)vcgt_f32(v151, *(float32x2_t *)&self->fOtherFallModel.fLikelihoodRatioInfo[2].binSize), *(int8x8_t *)&self->fOtherFallModel.fLikelihoodRatioInfo[2].binSize, (int8x8_t)v151);
      if (self->fOtherFallModel.fLikelihoodRatioInfo[3].firstBinEdge < *(float *)v123.i32) {
        v123.i32[0] = LODWORD(self->fOtherFallModel.fLikelihoodRatioInfo[3].firstBinEdge);
      }
      LODWORD(self->fOtherFallModel.fLikelihoodRatioInfo[3].firstBinEdge) = v123.i32[0];
      return 1;
    }
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_1022B7650);
    }
    v158 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_FAULT))
    {
      double v159 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
      float v160 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
      int v161 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
      double v162 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
      double v163 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
      float v164 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
      float v165 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
      float v166 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
      int v167 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v168 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v169 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      *(_DWORD *)buf = 68292355;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v197 = 2082;
      *(void *)&v197[2] = "";
      __int16 v198 = 2050;
      double v199 = v159;
      __int16 v200 = 1025;
      *(float *)v201 = v160;
      *(_WORD *)&v201[4] = 1025;
      *(_DWORD *)&v201[6] = v161;
      *(_WORD *)&v201[10] = 2049;
      *(double *)&v201[12] = v195;
      *(_WORD *)&v201[20] = 2049;
      *(double *)&v201[22] = v189;
      *(_WORD *)&v201[30] = 2049;
      *(double *)&v201[32] = v162;
      *(_WORD *)&v201[40] = 2049;
      *(double *)&v201[42] = v163;
      *(_WORD *)&v201[50] = 1025;
      *(float *)&v201[52] = v164;
      *(_WORD *)&v201[56] = 1025;
      *(float *)&v201[58] = v165;
      *(_WORD *)&v201[62] = 1025;
      *(float *)v202 = v166;
      *(_WORD *)&v202[4] = 1025;
      *(_DWORD *)&v202[6] = v167;
      *(_WORD *)v203 = 1025;
      *(_DWORD *)&v203[2] = v168;
      *(_WORD *)&v203[6] = 1025;
      *(_DWORD *)&v203[8] = v169;
      _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Model Selector - Could not pick thresholds based on available features - Falling back to defaults\", \"impactMaxAccelNormAlertThreshold\":\"%{public}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{private}d, \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThreshold\":\"%{private}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresholdLow\":%{private}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLieThreshold\":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}", buf, 0x74u);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_1022B7650);
      }
    }
    v170 = qword_1024190F8;
    if (os_signpost_enabled((os_log_t)qword_1024190F8))
    {
      double v171 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
      float v172 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
      int v173 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
      double v174 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
      double v175 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
      float v176 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
      float v177 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
      float v178 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
      int v179 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v180 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v181 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      *(_DWORD *)buf = 68292355;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v197 = 2082;
      *(void *)&v197[2] = "";
      __int16 v198 = 2050;
      double v199 = v171;
      __int16 v200 = 1025;
      *(float *)v201 = v172;
      *(_WORD *)&v201[4] = 1025;
      *(_DWORD *)&v201[6] = v173;
      *(_WORD *)&v201[10] = 2049;
      *(double *)&v201[12] = v195;
      *(_WORD *)&v201[20] = 2049;
      *(double *)&v201[22] = v189;
      *(_WORD *)&v201[30] = 2049;
      *(double *)&v201[32] = v174;
      *(_WORD *)&v201[40] = 2049;
      *(double *)&v201[42] = v175;
      *(_WORD *)&v201[50] = 1025;
      *(float *)&v201[52] = v176;
      *(_WORD *)&v201[56] = 1025;
      *(float *)&v201[58] = v177;
      *(_WORD *)&v201[62] = 1025;
      *(float *)v202 = v178;
      *(_WORD *)&v202[4] = 1025;
      *(_DWORD *)&v202[6] = v179;
      *(_WORD *)v203 = 1025;
      *(_DWORD *)&v203[2] = v180;
      *(_WORD *)&v203[6] = 1025;
      *(_DWORD *)&v203[8] = v181;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v170, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Model Selector - Could not pick thresholds based on available features - Falling back to defaults", "{\"msg%{public}.0s\":\"Model Selector - Could not pick thresholds based on available features - Falling back to defaults\", \"impactMaxAccelNormAlertThreshold\":\"%{public}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{private}d, \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThreshold\":\"%{private}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresholdLow\":%{private}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLieThreshold\":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}", buf, 0x74u);
    }
  }
  return 1;
}

- (BOOL)fillTripFallModel:(FallModel *)a3
{
  if (a3)
  {
    *(_OWORD *)a3->fRatioMaxAbsX = *(_OWORD *)self->fTripFallModel.fRatioMaxAbsX;
    long long v5 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[4];
    long long v6 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[8];
    long long v7 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[12];
    a3->fRatioMaxAbsX[16] = self->fTripFallModel.fRatioMaxAbsX[16];
    *(_OWORD *)&a3->fRatioMaxAbsX[8] = v6;
    *(_OWORD *)&a3->fRatioMaxAbsX[12] = v7;
    *(_OWORD *)&a3->fRatioMaxAbsX[4] = v5;
    long long v8 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[8];
    long long v9 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[12];
    float v10 = self->fTripFallModel.fRatioMaxAbsY[16];
    *(_OWORD *)&a3->fRatioMaxAbsY[4] = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[4];
    a3->fRatioMaxAbsY[16] = v10;
    *(_OWORD *)&a3->fRatioMaxAbsY[12] = v9;
    *(_OWORD *)&a3->fRatioMaxAbsY[8] = v8;
    *(_OWORD *)a3->fRatioMaxAbsY = *(_OWORD *)self->fTripFallModel.fRatioMaxAbsY;
    long long v11 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[8];
    long long v12 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[12];
    float v13 = self->fTripFallModel.fRatioMaxAbsZ[16];
    *(_OWORD *)&a3->fRatioMaxAbsZ[4] = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[4];
    a3->fRatioMaxAbsZ[16] = v13;
    *(_OWORD *)&a3->fRatioMaxAbsZ[12] = v12;
    *(_OWORD *)&a3->fRatioMaxAbsZ[8] = v11;
    *(_OWORD *)a3->fRatioMaxAbsZ = *(_OWORD *)self->fTripFallModel.fRatioMaxAbsZ;
    memcpy(a3->fRatioMaxJerkVM, self->fTripFallModel.fRatioMaxJerkVM, sizeof(a3->fRatioMaxJerkVM));
    long long v14 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[4];
    *(_OWORD *)a3->fRatioMinInertialZ = *(_OWORD *)self->fTripFallModel.fRatioMinInertialZ;
    *(_OWORD *)&a3->fRatioMinInertialZ[4] = v14;
    long long v16 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[12];
    long long v15 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[16];
    long long v17 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[8];
    a3->fRatioMinInertialZ[20] = self->fTripFallModel.fRatioMinInertialZ[20];
    *(_OWORD *)&a3->fRatioMinInertialZ[12] = v16;
    *(_OWORD *)&a3->fRatioMinInertialZ[16] = v15;
    *(_OWORD *)&a3->fRatioMinInertialZ[8] = v17;
    long long v18 = *(_OWORD *)self->fTripFallModel.fRatioAccelPathLength;
    long long v19 = *(_OWORD *)&self->fTripFallModel.fRatioAccelPathLength[4];
    *(void *)&a3->fRatioAccelPathLength[8] = *(void *)&self->fTripFallModel.fRatioAccelPathLength[8];
    *(_OWORD *)a3->fRatioAccelPathLength = v18;
    *(_OWORD *)&a3->fRatioAccelPathLength[4] = v19;
    long long v20 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[4];
    long long v21 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[8];
    long long v22 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[12];
    *(_OWORD *)a3->fRatioMaxAngleChangePreimpact = *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePreimpact;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[4] = v20;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[8] = v21;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[12] = v22;
    long long v24 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[8];
    long long v23 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[12];
    long long v25 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[4];
    *(_OWORD *)a3->fRatioMaxAngleChangePostimpact = *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePostimpact;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[4] = v25;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[8] = v24;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[12] = v23;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[0].double firstBinEdge = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[0].firstBinEdge;
    long long v27 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[2].binNum;
    long long v26 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[4].firstBinEdge;
    long long v28 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[1].binSize;
    *(void *)&a3->fLikelihoodRatioInfo[5].float binSize = *(void *)&self->fTripFallModel.fLikelihoodRatioInfo[5].binSize;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[2].binNum = v27;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[4].double firstBinEdge = v26;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[1].float binSize = v28;
  }
  return a3 != 0;
}

- (BOOL)fillSlipFallModel:(FallModel *)a3
{
  if (a3)
  {
    *(_OWORD *)a3->fRatioMaxAbsX = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
    long long v5 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[7].binSize;
    long long v6 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[2];
    long long v7 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[6];
    a3->fRatioMaxAbsX[16] = self->fSlipFallModel.fRatioMaxAbsX[10];
    *(_OWORD *)&a3->fRatioMaxAbsX[8] = v6;
    *(_OWORD *)&a3->fRatioMaxAbsX[12] = v7;
    *(_OWORD *)&a3->fRatioMaxAbsX[4] = v5;
    long long v9 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[2];
    long long v8 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[6];
    float v10 = self->fSlipFallModel.fRatioMaxAbsY[10];
    *(_OWORD *)&a3->fRatioMaxAbsY[4] = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[15];
    a3->fRatioMaxAbsY[16] = v10;
    *(_OWORD *)&a3->fRatioMaxAbsY[12] = v8;
    *(_OWORD *)&a3->fRatioMaxAbsY[8] = v9;
    *(_OWORD *)a3->fRatioMaxAbsY = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[11];
    long long v12 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[2];
    long long v11 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[6];
    float v13 = self->fSlipFallModel.fRatioMaxAbsZ[10];
    *(_OWORD *)&a3->fRatioMaxAbsZ[4] = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[15];
    a3->fRatioMaxAbsZ[16] = v13;
    *(_OWORD *)&a3->fRatioMaxAbsZ[12] = v11;
    *(_OWORD *)&a3->fRatioMaxAbsZ[8] = v12;
    *(_OWORD *)a3->fRatioMaxAbsZ = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[11];
    memcpy(a3->fRatioMaxJerkVM, &self->fSlipFallModel.fRatioMaxAbsZ[11], sizeof(a3->fRatioMaxJerkVM));
    long long v14 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[65];
    *(_OWORD *)a3->fRatioMinInertialZ = *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[61];
    *(_OWORD *)&a3->fRatioMinInertialZ[4] = v14;
    long long v16 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[6];
    long long v15 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[10];
    long long v17 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[2];
    a3->fRatioMinInertialZ[20] = self->fSlipFallModel.fRatioMinInertialZ[14];
    *(_OWORD *)&a3->fRatioMinInertialZ[12] = v16;
    *(_OWORD *)&a3->fRatioMinInertialZ[16] = v15;
    *(_OWORD *)&a3->fRatioMinInertialZ[8] = v17;
    long long v18 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[15];
    long long v19 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[19];
    *(void *)&a3->fRatioAccelPathLength[8] = *(void *)&self->fSlipFallModel.fRatioAccelPathLength[2];
    *(_OWORD *)a3->fRatioAccelPathLength = v18;
    *(_OWORD *)&a3->fRatioAccelPathLength[4] = v19;
    long long v20 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[2];
    long long v21 = *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[8];
    long long v22 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[6];
    *(_OWORD *)a3->fRatioMaxAngleChangePreimpact = *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[4];
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[4] = v21;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[8] = v20;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[12] = v22;
    long long v23 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[6];
    long long v24 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[2];
    long long v25 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[14];
    *(_OWORD *)a3->fRatioMaxAngleChangePostimpact = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[10];
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[4] = v25;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[8] = v24;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[12] = v23;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[0].double firstBinEdge = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[10];
    long long v26 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[0].binNum;
    long long v27 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
    long long v28 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[14];
    *(void *)&a3->fLikelihoodRatioInfo[5].float binSize = *(void *)&self->fSlipFallModel.fLikelihoodRatioInfo[3].binSize;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[2].binNum = v26;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[4].double firstBinEdge = v27;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[1].float binSize = v28;
  }
  return a3 != 0;
}

- (BOOL)fillOtherFallModel:(FallModel *)a3
{
  if (a3)
  {
    *(_OWORD *)a3->fRatioMaxAbsX = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[4].firstBinEdge;
    long long v5 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[5].binSize;
    long long v6 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[6].binNum;
    long long v7 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsX;
    a3->fRatioMaxAbsX[16] = self->fOtherFallModel.fRatioMaxAbsX[4];
    *(_OWORD *)&a3->fRatioMaxAbsX[8] = v6;
    *(_OWORD *)&a3->fRatioMaxAbsX[12] = v7;
    *(_OWORD *)&a3->fRatioMaxAbsX[4] = v5;
    long long v9 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[13];
    long long v8 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsY;
    float v10 = self->fOtherFallModel.fRatioMaxAbsY[4];
    *(_OWORD *)&a3->fRatioMaxAbsY[4] = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[9];
    a3->fRatioMaxAbsY[16] = v10;
    *(_OWORD *)&a3->fRatioMaxAbsY[12] = v8;
    *(_OWORD *)&a3->fRatioMaxAbsY[8] = v9;
    *(_OWORD *)a3->fRatioMaxAbsY = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[5];
    long long v11 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[13];
    long long v12 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsZ;
    float v13 = self->fOtherFallModel.fRatioMaxAbsZ[4];
    *(_OWORD *)&a3->fRatioMaxAbsZ[4] = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[9];
    a3->fRatioMaxAbsZ[16] = v13;
    *(_OWORD *)&a3->fRatioMaxAbsZ[12] = v12;
    *(_OWORD *)&a3->fRatioMaxAbsZ[8] = v11;
    *(_OWORD *)a3->fRatioMaxAbsZ = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[5];
    memcpy(a3->fRatioMaxJerkVM, &self->fOtherFallModel.fRatioMaxAbsZ[5], sizeof(a3->fRatioMaxJerkVM));
    long long v14 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[59];
    *(_OWORD *)a3->fRatioMinInertialZ = *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[55];
    *(_OWORD *)&a3->fRatioMinInertialZ[4] = v14;
    long long v15 = *(_OWORD *)self->fOtherFallModel.fRatioMinInertialZ;
    long long v16 = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[4];
    long long v17 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[63];
    a3->fRatioMinInertialZ[20] = self->fOtherFallModel.fRatioMinInertialZ[8];
    *(_OWORD *)&a3->fRatioMinInertialZ[12] = v15;
    *(_OWORD *)&a3->fRatioMinInertialZ[16] = v16;
    *(_OWORD *)&a3->fRatioMinInertialZ[8] = v17;
    long long v18 = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[9];
    long long v19 = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[13];
    *(void *)&a3->fRatioAccelPathLength[8] = *(void *)&self->fOtherFallModel.fRatioMinInertialZ[17];
    *(_OWORD *)a3->fRatioAccelPathLength = v18;
    *(_OWORD *)&a3->fRatioAccelPathLength[4] = v19;
    long long v20 = *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[2];
    long long v21 = *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[6];
    long long v22 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePreimpact;
    *(_OWORD *)a3->fRatioMaxAngleChangePreimpact = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[19];
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[4] = v20;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[8] = v21;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[12] = v22;
    long long v24 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[12];
    long long v23 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePostimpact;
    long long v25 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[8];
    *(_OWORD *)a3->fRatioMaxAngleChangePostimpact = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[4];
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[4] = v25;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[8] = v24;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[12] = v23;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[0].double firstBinEdge = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[4];
    long long v27 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[12];
    long long v26 = *(_OWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[0].firstBinEdge;
    long long v28 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[8];
    *(void *)&a3->fLikelihoodRatioInfo[5].float binSize = *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[1].binSize;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[2].binNum = v27;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[4].double firstBinEdge = v26;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[1].float binSize = v28;
  }
  return a3 != 0;
}

- (BOOL)fillFallThresholds:(FallThresholds *)a3
{
  if (a3) {
    sub_1004EEDE0((uint64_t)a3, (uint64_t)&self->fOtherFallModel.fLikelihoodRatioInfo[2]);
  }
  return a3 != 0;
}

- (id).cxx_construct
{
  return self;
}

@end