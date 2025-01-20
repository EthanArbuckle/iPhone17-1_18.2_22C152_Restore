@interface GmoController
- ($9816EE93AC90BBB150E2CDBAC981FECC)factorySpotsLocRefDist;
- ($9816EE93AC90BBB150E2CDBAC981FECC)operationalSpotsLocRefDist;
- ($9816EE93AC90BBB150E2CDBAC981FECC)sopSpotsLoc;
- ($9816EE93AC90BBB150E2CDBAC981FECC)spotsCRRefDist;
- (BOOL)engineNeedsConfiguration;
- (BOOL)homographyRunConditionsWithTimestamp:(double)a3;
- (BOOL)isSopSpotsLocLoaded;
- (BOOL)shouldSaveToFile;
- (BOOL)solutionOKLast;
- (GlobalEstimationCtrl)hCtrlLast;
- (GmoCfgBits)gmoCfgBits;
- (GmoController)initWithUnitInfo:(PeridotUnitInfo *)a3;
- (GmoDbgServices)dbgSrvc;
- (GmoEngine)engine;
- (PDAnchors)currAnchors;
- (PeridotUnitInfo)unitInfo;
- (SessionState)sessionCalcState;
- (SessionState)sessionState;
- (double)lastHomographyAttemptTimeSec;
- (double)timeBetweenHomographyAttemps;
- (float)snrHysteresisPct;
- (float)spotSizeSigma;
- (gmoCoreAnalyticsTelemetry)ca;
- (id).cxx_construct;
- (id)getGmoMetaDataArray;
- (int)processFrameWithBank:(const GmoProcessBankInputs *)a3 gmoResult:(GmoResult *)a4;
- (unint64_t)bankCounter;
- (unint64_t)gmoRefDist;
- (unint64_t)minFramesBetweenHomogCycle;
- (unsigned)isSphere;
- (vector<common::PeridotSpotValues<CGPoint>,)localSpotsLocRefDist;
- (vector<common::PeridotSpotValues<float>,)localNa;
- (vector<std::vector<SpecsResults>,)specsOut;
- (void)setBankCounter:(unint64_t)a3;
- (void)setCurrAnchors:(PDAnchors *)a3;
- (void)setEngineNeedsConfiguration:(BOOL)a3;
- (void)setGmoCfgBits:(GmoCfgBits)a3;
- (void)setGmoRefDist:(unint64_t)a3;
- (void)setIsSphere:(unsigned __int8)a3;
- (void)setSessionPersistentData:(SessionStatePersistentData *)a3;
- (void)setSnrHysteresisPct:(float)a3;
@end

@implementation GmoController

- (int)processFrameWithBank:(const GmoProcessBankInputs *)a3 gmoResult:(GmoResult *)a4
{
  uint64_t v4 = ((uint64_t (*)(GmoController *, SEL, const GmoProcessBankInputs *))MEMORY[0x270FA5388])(self, a2, a3);
  uint64_t v144 = *MEMORY[0x263EF8340];
  if (*(void *)(v4 + 64) > 0x1DFuLL) {
    return 1;
  }
  v7 = v6;
  v8 = v5;
  uint64_t v9 = v4;
  objc_msgSend(*(id *)(v4 + 40), "addDbgDataFor_gmoBankInput:");
  unsigned __int8 *v7 = 0;
  if (![*(id *)(v9 + 40) bankNumInHomogCycle])
  {
    uint64_t v10 = *(void *)(v9 + 32) + 36444;
    *(void *)&__p[8] = 64;
    *(void *)__p = v10;
    [*(id *)(v9 + 40) startOfHomogCycle];
    objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_gmoInit:", __p);
    objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_gmoConfig:", v9 + 12);
    objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_operationalSpotLocation10m:", v9 + 1148);
    objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_factorySpotLocation10m:", v9 + 2052);
    objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_operationalSpotLocation70cm:", *(void *)(v9 + 32) + 344396);
    objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_factorySpotLocation70cm:", *(void *)(v9 + 32) + 342588);
  }
  if (*(unsigned char *)(v9 + 8))
  {
    if ([*(id *)(v9 + 48) configureEngineWithSpecConfig:(char *)v8 + 8966]) {
      return 1;
    }
    *(unsigned char *)(v9 + 8) = 0;
  }
  if ([*(id *)(v9 + 48) calculateSpecQs:v8 pulsesPerphase:10134 specsOut:*(void *)(*(void *)(v9 + 152) + 24 * (*(void *)(v9 + 64) >> 3)) + 756 * *v8])return 1; {
  uint64_t v11 = *(void *)(v9 + 64) >> 3;
  }
  uint64_t v12 = *v8;
  v13 = (float *)(*(void *)(v9 + 128) + 448 * v11 + 56 * *v8);
  float *v13 = *((float *)v8 + 21) * 100.0;
  v13[1] = *((float *)v8 + 27) * 100.0;
  v13[2] = *((float *)v8 + 33) * 100.0;
  v13[3] = *((float *)v8 + 39) * 100.0;
  v13[4] = *((float *)v8 + 45) * 100.0;
  v13[5] = *((float *)v8 + 51) * 100.0;
  v13[6] = *((float *)v8 + 57) * 100.0;
  v13[7] = *((float *)v8 + 63) * 100.0;
  v13[8] = *((float *)v8 + 69) * 100.0;
  v13[9] = *((float *)v8 + 75) * 100.0;
  v13[10] = *((float *)v8 + 81) * 100.0;
  v13[11] = *((float *)v8 + 87) * 100.0;
  v13[12] = *((float *)v8 + 93) * 100.0;
  v13[13] = *((float *)v8 + 99) * 100.0;
  if ([*(id *)(v9 + 48) findSpotLocation:*(void *)(*(void *)(v9 + 152) + 24 * v11) + 756 * v12 withAnchors:(char *)v8 + 8924 spotLocationEstimation:v125 outBound:v124])return 1; {
  unint64_t v16 = *(void *)(v9 + 96);
  }
  v17 = (int32x4_t *)operator new(0x38uLL);
  *(float *)v18.i32 = (float)v16;
  int32x4_t v19 = vdupq_lane_s32(v18, 0);
  int32x4_t *v17 = v19;
  v17[1] = v19;
  v17[2] = v19;
  *(float *)v17[3].i32 = (float)v16;
  *(float *)&v17[3].i32[1] = (float)v16;
  float32x2_t v20 = (float32x2_t)v8[10];
  v19.i64[0] = *(uint64_t *)((char *)v8 + 76);
  v20.i32[1] = *((_DWORD *)v8 + 26);
  float64x2_t v21 = (float64x2_t)vdupq_n_s64(0x3FE999999999999AuLL);
  int8x8_t v22 = (int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(v20), v21));
  v19.i32[1] = *((_DWORD *)v8 + 25);
  float64x2_t v23 = vcvtq_f64_f32(*(float32x2_t *)v19.i8);
  float64x2_t v24 = (float64x2_t)vdupq_n_s64(0x424176592E000000uLL);
  int8x8_t v25 = (int8x8_t)vcvt_f32_f64(vmulq_f64(v23, v24));
  *(int32x2_t *)&v23.f64[0] = vdup_n_s32(0x7FC00000u);
  int8x8_t v26 = vbsl_s8(v22, v25, *(int8x8_t *)&v23.f64[0]);
  float32x2_t v27 = (float32x2_t)v8[16];
  float32x2_t v28 = *(float32x2_t *)((char *)v8 + 124);
  v27.i32[1] = *((_DWORD *)v8 + 38);
  v28.i32[1] = *((_DWORD *)v8 + 37);
  v136[0] = v26;
  v136[1] = vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(v27), v21)), (int8x8_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v28), v24)), *(int8x8_t *)&v23.f64[0]);
  float32x2_t v29 = (float32x2_t)v8[22];
  float32x2_t v30 = *(float32x2_t *)((char *)v8 + 172);
  v29.i32[1] = *((_DWORD *)v8 + 50);
  v30.i32[1] = *((_DWORD *)v8 + 49);
  int8x8_t v31 = vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(v29), v21)), (int8x8_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v30), v24)), *(int8x8_t *)&v23.f64[0]);
  float32x2_t v32 = (float32x2_t)v8[28];
  float32x2_t v33 = *(float32x2_t *)((char *)v8 + 220);
  v32.i32[1] = *((_DWORD *)v8 + 62);
  v33.i32[1] = *((_DWORD *)v8 + 61);
  v136[2] = v31;
  v136[3] = vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(v32), v21)), (int8x8_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v33), v24)), *(int8x8_t *)&v23.f64[0]);
  float32x2_t v34 = (float32x2_t)v8[34];
  float32x2_t v35 = *(float32x2_t *)((char *)v8 + 268);
  v34.i32[1] = *((_DWORD *)v8 + 74);
  v35.i32[1] = *((_DWORD *)v8 + 73);
  int8x8_t v36 = vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(v34), v21)), (int8x8_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v35), v24)), *(int8x8_t *)&v23.f64[0]);
  float32x2_t v37 = (float32x2_t)v8[40];
  float32x2_t v38 = *(float32x2_t *)((char *)v8 + 316);
  v37.i32[1] = *((_DWORD *)v8 + 86);
  v38.i32[1] = *((_DWORD *)v8 + 85);
  int8x8_t v39 = vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(v37), v21)), (int8x8_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v38), v24)), *(int8x8_t *)&v23.f64[0]);
  float32x2_t v40 = (float32x2_t)v8[46];
  v40.i32[1] = *((_DWORD *)v8 + 98);
  int64x2_t v41 = vcgtq_f64(vcvtq_f64_f32(v40), v21);
  float32x2_t v42 = *(float32x2_t *)((char *)v8 + 364);
  v42.i32[1] = *((_DWORD *)v8 + 97);
  uint64_t v43 = *(void *)(v9 + 104);
  uint64_t v44 = *(void *)(v9 + 64) >> 3;
  v136[4] = v36;
  v136[5] = v39;
  v136[6] = vbsl_s8((int8x8_t)vmovn_s64(v41), (int8x8_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v42), v24)), *(int8x8_t *)&v23.f64[0]);
  peridot::compensateForParallax(*(void **)(*(void *)(v9 + 32) + 402528), 0xEu, (uint64_t)v125, (uint64_t)v136, 0, (uint64_t)v17, 0, v43 + 1792 * v44 + 224 * *v8);
  objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_findSpotLocation:withAnchors:spotLocationEstimation:outBound:", *(void *)(*(void *)(v9 + 152) + 24 * (*(void *)(v9 + 64) >> 3)) + 756 * *v8, (char *)v8 + 8924, *(void *)(v9 + 104) + 1792 * (*(void *)(v9 + 64) >> 3) + 224 * *v8, v124);
  ++*(void *)(v9 + 64);
  unsigned int v123 = 0;
  memset(v121, 0, sizeof(v121));
  *(_DWORD *)v118 = 0;
  uint64_t v102 = 0;
  uint64_t v103 = 1;
  char v104 = 0;
  uint64_t v105 = 0;
  v101 = &unk_270717410;
  uint64_t v110 = 0;
  v113 = 0;
  uint64_t v115 = 0;
  v114 = 0;
  uint64_t v108 = 0;
  v106 = &unk_2707171D8;
  uint64_t v107 = 0;
  char v109 = 0;
  bzero(v112, 0x380uLL);
  uint64_t v45 = *(void *)(v9 + 56);
  v112[224] = *(_DWORD *)(v45 + 896);
  LOBYTE(v112[225]) = *(unsigned char *)(v45 + 900);
  uint64_t v100 = 0;
  float v111 = 0.0;
  memset(&v99, 0, sizeof(v99));
  unsigned int v46 = time(0);
  CRandomGenerator::CRandomGenerator((CRandomGenerator *)__p, v46);
  float v47 = CRandomGenerator::UniformRand((CRandomGenerator *)__p);
  *(int32x2_t *)(v9 + 784) = vcvt_s32_f32(vrnda_f32(vmul_n_f32((float32x2_t)0x4150000040E00000, v47)));
  char v48 = spotMovementBuckets[llroundf(v47 * 9.0)];
  *(unsigned char *)(v9 + 805) = v48;
  *(unsigned char *)(v9 + 804) = v48;
  CRandomGenerator::~CRandomGenerator((CRandomGenerator *)__p);
  int v49 = [(id)v9 homographyRunConditionsWithTimestamp:*((double *)v8 + 8)];
  v118[0] = v49;
  if (!v49)
  {
LABEL_25:
    if (!v118[1]) {
      goto LABEL_34;
    }
    goto LABEL_26;
  }
  v50 = &_os_log_internal;
  id v51 = &_os_log_internal;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    int v52 = [*(id *)(v9 + 40) numOfHomogCylce];
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = "-[GmoController processFrameWithBank:gmoResult:]";
    *(_WORD *)&__p[12] = 1024;
    *(_DWORD *)&__p[14] = v52;
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Evaluating conditions for homography cycle: %d", __p, 0x12u);
  }

  v53 = v50;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    peridot::getThermalStateString(__p);
    v54 = v139 >= 0 ? __p : *(unsigned char **)__p;
    LODWORD(v134[0]) = 136315394;
    *(void *)((char *)v134 + 4) = "-[GmoController processFrameWithBank:gmoResult:]";
    WORD2(v134[1]) = 2080;
    *(void *)((char *)&v134[1] + 6) = v54;
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Thermal State is: %s", (uint8_t *)v134, 0x16u);
    if (SHIBYTE(v139) < 0) {
      operator delete(*(void **)__p);
    }
  }

  if ([*(id *)(v9 + 48) blockSmoothing:v9 + 104 localNa:v9 + 128 specsOut:v9 + 152 numOfFrames:*(void *)(v9 + 64) >> 3 smoothedSpotsLoc:v122 validSpotsIndexes:v121 numOfValidSpots:&v123 smoothedSNR:__src smoothedSNa:v119])goto LABEL_70; {
  *(_DWORD *)(v9 + 792) = v123;
  }
  v118[1] = [*(id *)(v9 + 48) conditionsForHomography];
  if (!v118[1])
  {
    v55 = &_os_log_internal;
    id v56 = &_os_log_internal;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__p = 136315138;
      *(void *)&__p[4] = "-[GmoController processFrameWithBank:gmoResult:]";
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Conditions for GlobalEstimation are false.", __p, 0xCu);
    }

    goto LABEL_25;
  }
LABEL_26:
  unsigned int v57 = v123;
  if (v123 < 0x29)
  {
    v74 = &_os_log_internal;
    id v75 = &_os_log_internal;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__p = 136315650;
      *(void *)&__p[4] = "-[GmoController processFrameWithBank:gmoResult:]";
      *(_WORD *)&__p[12] = 1024;
      *(_DWORD *)&__p[14] = v57;
      __int16 v138 = 1024;
      int v139 = 40;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Not enough qualified spots for GMO Solution: %u <= %d", __p, 0x18u);
    }
  }
  else
  {
    v118[2] = 1;
    if ((*(unsigned char *)(v9 + 12) & 4) != 0)
    {
      if ([*(id *)(v9 + 48) globalEstimation:v9 + 1148 estSpotLocAtRefDist:v122 validSpotsIndexes:v121 result:&v100])goto LABEL_70; {
      memset(v134, 0, sizeof(v134));
      }
      int v135 = 0;
      v118[3] = [*(id *)(v9 + 48) homogClassifier:&v100 camCalib:*(void *)(*(void *)(v9 + 32) + 402528) smoothedSpotsLocAtRefDist:v122 currentSpotsLocAtRefDist:*(void *)(v9 + 56) factorySpotsLocAtRefDist:v9 + 1148 validSpotsIndexes:v121 smoothedSNR:__src smoothedSNa:v119 gmoMetrics:&v99 estTols:v134];
      objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_homogClassifier:estTols:", &v99, v134);
      v82 = &_os_log_internal;
      id v83 = &_os_log_internal;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 136316162;
        *(void *)&__p[4] = "-[GmoController processFrameWithBank:gmoResult:]";
        *(_WORD *)&__p[12] = 1024;
        *(_DWORD *)&__p[14] = v118[3];
        __int16 v138 = 1024;
        int v139 = v100;
        __int16 v140 = 1024;
        int v141 = HIDWORD(v100);
        __int16 v142 = 2048;
        double v143 = v111;
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: GlobalEstimation hOK: %d with trials: %d, inliers: %d, modelError: %f", __p, 0x28u);
      }
    }
    else
    {
      memcpy(v112, *(const void **)(v9 + 56), 0x388uLL);
      for (uint64_t i = 0; i != 896; i += 112)
      {
        v59 = (_DWORD *)((char *)&v100 + i);
        int v60 = *(_DWORD *)&v122[i + 4];
        v59[23] = *(_DWORD *)&v122[i];
        v59[24] = v60;
        int v61 = *(_DWORD *)&v122[i + 12];
        v59[25] = *(_DWORD *)&v122[i + 8];
        v59[26] = v61;
        int v62 = *(_DWORD *)&v122[i + 20];
        v59[27] = *(_DWORD *)&v122[i + 16];
        v59[28] = v62;
        int v63 = *(_DWORD *)&v122[i + 28];
        v59[29] = *(_DWORD *)&v122[i + 24];
        v59[30] = v63;
        int v64 = *(_DWORD *)&v122[i + 36];
        v59[31] = *(_DWORD *)&v122[i + 32];
        v59[32] = v64;
        int v65 = *(_DWORD *)&v122[i + 44];
        v59[33] = *(_DWORD *)&v122[i + 40];
        v59[34] = v65;
        int v66 = *(_DWORD *)&v122[i + 52];
        v59[35] = *(_DWORD *)&v122[i + 48];
        v59[36] = v66;
        int v67 = *(_DWORD *)&v122[i + 60];
        v59[37] = *(_DWORD *)&v122[i + 56];
        v59[38] = v67;
        int v68 = *(_DWORD *)&v122[i + 68];
        v59[39] = *(_DWORD *)&v122[i + 64];
        v59[40] = v68;
        int v69 = *(_DWORD *)&v122[i + 76];
        v59[41] = *(_DWORD *)&v122[i + 72];
        v59[42] = v69;
        int v70 = *(_DWORD *)&v122[i + 84];
        v59[43] = *(_DWORD *)&v122[i + 80];
        v59[44] = v70;
        int v71 = *(_DWORD *)&v122[i + 92];
        v59[45] = *(_DWORD *)&v122[i + 88];
        v59[46] = v71;
        int v72 = *(_DWORD *)&v122[i + 100];
        v59[47] = *(_DWORD *)&v122[i + 96];
        v59[48] = v72;
        int v73 = *(_DWORD *)&v122[i + 108];
        v59[49] = *(_DWORD *)&v122[i + 104];
        v59[50] = v73;
      }
      v118[3] = 1;
    }
  }
LABEL_34:
  if ((*(unsigned char *)(v9 + 12) & 4) != 0 && v118[0])
  {
    v76 = *(void **)(v9 + 40);
    memcpy(__dst, __src, sizeof(__dst));
    objc_msgSend(v76, "addDbgDataFor_globalEstimation:spotLocationAtRefDist:smoothedSNR:validSpotsIndexes:result:hCtrl:", v9 + 1148, v122, __dst, v121, &v100, v118);
  }
  if (!v118[3]) {
    goto LABEL_57;
  }
  uint64_t v96 = 0;
  [*(id *)(v9 + 48) clipSpotsLocation:v112 refSpotsLoc:v9 + 1148 clippedSpotLocations:v134 numOfClippedSpots:&v96];
  *(_DWORD *)(v9 + 820) = v96;
  unint64_t v95 = 0;
  LODWORD(v77) = *(_DWORD *)(v9 + 20);
  if (![*(id *)(v9 + 48) getAnchorsWithHysteresis:v134 currAnchors:v9 + 444 snrHysteresisPct:&v116 anchorsWithHist:v117 violations:v97 anchorMoveIdx:__p spotLocationsAtRefDist:v77 anchorsMoved:&v95])
  {
    for (uint64_t j = 0; j != 14; ++j)
    {
      v80 = &v94[j * 3];
      unsigned char *v80 = v116.banks[0].anchors[j].x - *(unsigned char *)(v9 + j * 3 + 444);
      v80[1] = v116.banks[0].anchors[j].y - *(unsigned char *)(v9 + j * 3 + 445);
      v80[2] = v116.banks[0].anchors[j].useNorthHS2 != *(unsigned __int8 *)(v9 + j * 3 + 446);
    }
    for (uint64_t k = 486; k != 528; k += 3)
    {
      v94[k - 444] = *((unsigned char *)&v112[122] + k + 3) - *(unsigned char *)(v9 + k);
      v94[k - 443] = *((unsigned char *)&v112[123] + k) - *(unsigned char *)(v9 + k + 1);
      v94[k - 442] = *((unsigned __int8 *)&v112[123] + k + 1) != *(unsigned __int8 *)(v9 + k + 2);
    }
    do
    {
      v94[k - 444] = *((unsigned char *)&v112[122] + k + 3) - *(unsigned char *)(v9 + k);
      v94[k - 443] = *((unsigned char *)&v112[123] + k) - *(unsigned char *)(v9 + k + 1);
      v94[k - 442] = *((unsigned __int8 *)&v112[123] + k + 1) != *(unsigned __int8 *)(v9 + k + 2);
      k += 3;
    }
    while (k != 570);
    do
    {
      v94[k - 444] = *((unsigned char *)&v112[122] + k + 3) - *(unsigned char *)(v9 + k);
      v94[k - 443] = *((unsigned char *)&v112[123] + k) - *(unsigned char *)(v9 + k + 1);
      v94[k - 442] = *((unsigned __int8 *)&v112[123] + k + 1) != *(unsigned __int8 *)(v9 + k + 2);
      k += 3;
    }
    while (k != 612);
    do
    {
      v94[k - 444] = *((unsigned char *)&v112[122] + k + 3) - *(unsigned char *)(v9 + k);
      v94[k - 443] = *((unsigned char *)&v112[123] + k) - *(unsigned char *)(v9 + k + 1);
      v94[k - 442] = *((unsigned __int8 *)&v112[123] + k + 1) != *(unsigned __int8 *)(v9 + k + 2);
      k += 3;
    }
    while (k != 654);
    do
    {
      v94[k - 444] = *((unsigned char *)&v112[122] + k + 3) - *(unsigned char *)(v9 + k);
      v94[k - 443] = *((unsigned char *)&v112[123] + k) - *(unsigned char *)(v9 + k + 1);
      v94[k - 442] = *((unsigned __int8 *)&v112[123] + k + 1) != *(unsigned __int8 *)(v9 + k + 2);
      k += 3;
    }
    while (k != 696);
    do
    {
      v94[k - 444] = *((unsigned char *)&v112[122] + k + 3) - *(unsigned char *)(v9 + k);
      v94[k - 443] = *((unsigned char *)&v112[123] + k) - *(unsigned char *)(v9 + k + 1);
      v94[k - 442] = *((unsigned __int8 *)&v112[123] + k + 1) != *(unsigned __int8 *)(v9 + k + 2);
      k += 3;
    }
    while (k != 738);
    do
    {
      v94[k - 444] = *((unsigned char *)&v112[122] + k + 3) - *(unsigned char *)(v9 + k);
      v94[k - 443] = *((unsigned char *)&v112[123] + k) - *(unsigned char *)(v9 + k + 1);
      v94[k - 442] = *((unsigned __int8 *)&v112[123] + k + 1) != *(unsigned __int8 *)(v9 + k + 2);
      k += 3;
    }
    while (k != 780);
    LODWORD(v78) = *(_DWORD *)(v9 + 20);
    objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_getAnchorsWithHysteresis:currAnchors:snrHysteresisPct:anchorsWithHist:violations:numOfClippedSpots:anchorMoveIdx:spotLocationsAtRefDist:numQualifiedSpot:anchorsShift:anchorsMoved:", v112, v9 + 444, &v116, v117, v96, v97, v78, __p, v123, v94, v95);
    if (v117[0])
    {
      unsigned __int8 *v7 = 0;
      *((void *)v7 + 2) = 0;
      *((void *)v7 + 3) = 0;
      *((void *)v7 + 1) = 0;
      v7[32] = 0;
    }
    else
    {
      unsigned __int8 *v7 = 1;
      *(float *)(v9 + 800) = (float)v95;
      gmoCoreAnalyticsTelemetry::setAnchorMovement((gmoCoreAnalyticsTelemetry *)(v9 + 780), &v116, (PDAnchors *)(v9 + 444));
      memcpy(*(void **)(v9 + 56), v112, 0x388uLL);
      memcpy((void *)(v9 + 444), &v116, 0x150uLL);
      *((void *)v7 + 2) = v9 + 444;
      *((void *)v7 + 3) = *(void *)(v9 + 56);
      *((void *)v7 + 1) = v95;
      v7[32] = [(id)v9 shouldSaveToFile];
    }
    *(_DWORD *)(v9 + 24) = *(_DWORD *)v118;
    *(unsigned char *)(v9 + 11) = *v7;
    if ((*(unsigned char *)(v9 + 15) & 0x40) == 0) {
      goto LABEL_57;
    }
    float v93 = 0.0;
    if (![*(id *)(v9 + 48) calculateItpQual:v9 + 444 spotLocations:v9 + 2052 result:&v93])
    {
      float v92 = -1000.0;
      if (!*(unsigned char *)(v9 + 9)
        || ![*(id *)(v9 + 48) calculateItpQual:v9 + 444 spotLocations:v9 + 2956 result:&v92])
      {
        objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_itpQual:itpQualSop:", &v93, &v92);
        uint64_t v91 = 0;
        float v89 = -1000.0;
        float v90 = -1000.0;
        if (![*(id *)(v9 + 48) calculateGtErrP95:v9 + 2052 spotLocations:v112 result:(char *)&v91 + 4]&& !objc_msgSend(*(id *)(v9 + 48), "calculateGtErrP95:spotLocations:result:", v9 + 2052, v122, &v91))
        {
          v84 = &_os_log_internal;
          id v85 = &_os_log_internal;
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            int v126 = 136315906;
            v127 = "-[GmoController processFrameWithBank:gmoResult:]";
            __int16 v128 = 2048;
            double v129 = v93;
            __int16 v130 = 2048;
            double v131 = *((float *)&v91 + 1);
            __int16 v132 = 2048;
            double v133 = *(float *)&v91;
            _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: itpQual: %f, globalErrP95: %f, smoothedErrP95: %f", (uint8_t *)&v126, 0x2Au);
          }

          if (!*(unsigned char *)(v9 + 9)) {
            goto LABEL_92;
          }
          if (![*(id *)(v9 + 48) calculateGtErrP95:v9 + 2956 spotLocations:v112 result:&v90]&& !objc_msgSend(*(id *)(v9 + 48), "calculateGtErrP95:spotLocations:result:", v9 + 2956, v122, &v89))
          {
            v86 = &_os_log_internal;
            id v87 = &_os_log_internal;
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              int v126 = 136315906;
              v127 = "-[GmoController processFrameWithBank:gmoResult:]";
              __int16 v128 = 2048;
              double v129 = v92;
              __int16 v130 = 2048;
              double v131 = v90;
              __int16 v132 = 2048;
              double v133 = v89;
              _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: itpQualSop: %f, globalErrP95Sop: %f, smoothedErrP95Sop: %f", (uint8_t *)&v126, 0x2Au);
            }

LABEL_92:
            objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_gtErrP95:smoothedErrP95:gtErrP95Sop:smoothedErrP95Sop:", (char *)&v91 + 4, &v91, &v90, &v89);
LABEL_57:
            if (v118[0]) {
              objc_msgSend(*(id *)(v9 + 40), "addDbgDataFor_gmoBankOutput:anchorsWithHist:spotLocationsAtRefDist:", v122, v9 + 444, *(void *)(v9 + 56));
            }
            if (*v7 && !v117[0]) {
              gmoCoreAnalyticsTelemetry::setSpotsMovement(v9 + 780, (float32x2_t *)(v9 + 2052), (float32x2_t *)(v9 + 1148), *((float32x2_t **)v7 + 3));
            }
            if ((*(unsigned char *)(v9 + 12) & 4) != 0 && v118[2])
            {
              gmoCoreAnalyticsTelemetry::setHOk((gmoCoreAnalyticsTelemetry *)(v9 + 780), v118[3], *v7);
              GmoMetrics v88 = v99;
              gmoCoreAnalyticsTelemetry::setHomogMetrics((gmoCoreAnalyticsTelemetry *)(v9 + 780), &v88);
              gmoCoreAnalyticsTelemetry::reportHomogStats((gmoCoreAnalyticsTelemetry *)(v9 + 780));
            }
            [*(id *)(v9 + 40) endOfBank];
            if (v118[0])
            {
              *(void *)(v9 + 64) = 0;
              if (v118[1]) {
                [*(id *)(v9 + 40) endOfHomogCycle];
              }
            }
            int v14 = 0;
            goto LABEL_71;
          }
        }
      }
    }
  }
LABEL_70:
  int v14 = 1;
LABEL_71:
  if (v113)
  {
    v114 = v113;
    operator delete(v113);
  }
  v106 = &unk_2707171D8;
  if (v107 && v109)
  {
    MEMORY[0x25A2D62A0]();
    uint64_t v107 = 0;
    uint64_t v110 = 0;
    char v109 = 0;
  }
  uint64_t v108 = 0;
  v101 = &unk_270717370;
  if (v102 && v104) {
    MEMORY[0x25A2D62A0]();
  }
  std::array<std::vector<unsigned char>,8ul>::~array((uint64_t)v121);
  operator delete(v17);
  return v14;
}

- (BOOL)homographyRunConditionsWithTimestamp:(double)a3
{
  unint64_t bankCounter = self->_bankCounter;
  if (a3 - self->_lastHomographyAttemptTimeSec >= self->_timeBetweenHomographyAttemps && (self->_bankCounter & 7) == 0)
  {
    if (self->_minFramesBetweenHomogCycle > bankCounter >> 3 && bankCounter <= 0x1DF) {
      return 0;
    }
  }
  else if (bankCounter < 0x1E0)
  {
    return 0;
  }
  self->_lastHomographyAttemptTimeSec = a3;
  return 1;
}

- (GmoCfgBits)gmoCfgBits
{
  return (GmoCfgBits)self->_gmoCfgBits.all;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 0;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((_DWORD *)self + 110) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  return self;
}

- (void)setSessionPersistentData:(SessionStatePersistentData *)a3
{
  if (a3)
  {
    memcpy(&self->_sessionState, a3, sizeof(self->_sessionState));
    self->_ca._longTermEventPersistentData.homogDoneCount = self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.homogDoneCount;
    *(_OWORD *)&self->_ca._longTermEventPersistentData.sessionCount = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.sessionCount;
    long long v4 = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[20];
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP95Arr[16] = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[16];
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP95Arr[20] = v4;
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP95Arr[24] = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[24];
    *(void *)&self->_ca._longTermEventPersistentData.calibErrP95Arr[28] = *(void *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[28];
    long long v5 = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[4];
    *(_OWORD *)self->_ca._longTermEventPersistentData.calibErrP95Arr = *(_OWORD *)self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr;
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP95Arr[4] = v5;
    long long v6 = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[12];
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP95Arr[8] = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[8];
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP95Arr[12] = v6;
    long long v7 = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[12];
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP50Arr[8] = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[8];
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP50Arr[12] = v7;
    long long v8 = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[4];
    *(_OWORD *)self->_ca._longTermEventPersistentData.calibErrP50Arr = *(_OWORD *)self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr;
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP50Arr[4] = v8;
    *(void *)&self->_ca._longTermEventPersistentData.calibErrP50Arr[28] = *(void *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[28];
    long long v9 = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[24];
    long long v10 = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[16];
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP50Arr[20] = *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[20];
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP50Arr[24] = v9;
    *(_OWORD *)&self->_ca._longTermEventPersistentData.calibErrP50Arr[16] = v10;
  }
}

- (GmoController)initWithUnitInfo:(PeridotUnitInfo *)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  v94.receiver = self;
  v94.super_class = (Class)GmoController;
  long long v4 = [(GmoController *)&v94 init];
  long long v5 = v4;
  long long v6 = v4;
  if (!v4) {
    goto LABEL_89;
  }
  uint64_t v91 = v4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v96 = "-[GmoController initWithUnitInfo:]";
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Init ...", buf, 0xCu);
  }
  v91->_sessionState.persistent.pattern = [&unk_27071DC18 intValue];
  v91->_sessionState.persistent.version = [&unk_27071DC30 intValue];
  v91->_gmoCfgBits.all = 0;
  v91->_unitInfo = a3;
  v91->_gmoRefDist = 10000;
  v91->_isSphere = a3->var0.operationalSpotLocations.normalRange.isSphere;
  *(void *)&v91->_spotSizeSigma = 0x40C000003EC28F5CLL;
  long long v7 = [GmoEngine alloc];
  *(float *)&double v8 = v91->_spotSizeSigma;
  uint64_t v9 = -[GmoEngine initWithPulseShape:pulseShapeSize:spotSizeSigma:unitInfo:](v7, "initWithPulseShape:pulseShapeSize:spotSizeSigma:unitInfo:", &v91->_unitInfo->var0.pulseShape, 64, v8);
  engine = v91->_engine;
  v91->_engine = (GmoEngine *)v9;

  uint64_t v12 = v91;
  v91->_engineNeedsConfiguration = 1;
  begin = (char *)v91->_localSpotsLocRefDist.__begin_;
  end = (char *)v91->_localSpotsLocRefDist.__end_;
  v15 = (char *)(end - begin);
  unint64_t v16 = 0x6DB6DB6DB6DB6DB7 * ((end - begin) >> 8);
  if (v16 > 0x3B)
  {
    if (v15 == (char *)107520) {
      goto LABEL_22;
    }
    float32x2_t v27 = begin + 107520;
    goto LABEL_18;
  }
  value = v91->_localSpotsLocRefDist.__end_cap_.__value_;
  if (0x6DB6DB6DB6DB6DB7 * ((value - end) >> 8) >= 60 - v16)
  {
    bzero(v91->_localSpotsLocRefDist.__end_, 1792 * ((((unint64_t)(105728 - (void)v15) >> 8) * (unsigned __int128)0x2492492492492493uLL) >> 64)+ 1792);
    float32x2_t v27 = &end[1792
             * ((((unint64_t)(105728 - (void)v15) >> 8) * (unsigned __int128)0x2492492492492493uLL) >> 64)
             + 1792];
LABEL_18:
    v91->_localSpotsLocRefDist.__end_ = v27;
    goto LABEL_22;
  }
  unint64_t v18 = 0x6DB6DB6DB6DB6DB7 * ((value - begin) >> 8);
  unint64_t v19 = 0xDB6DB6DB6DB6DB6ELL * ((value - begin) >> 8);
  if (v19 <= 0x3C) {
    unint64_t v19 = 60;
  }
  if (v18 >= 0x12492492492492) {
    unint64_t v20 = 0x24924924924924;
  }
  else {
    unint64_t v20 = v19;
  }
  if (v20 > 0x24924924924924) {
    goto LABEL_92;
  }
  float64x2_t v21 = (char *)operator new(1792 * v20);
  int8x8_t v22 = &v21[256 * ((end - begin) >> 8)];
  float64x2_t v23 = &v21[1792 * v20];
  size_t v24 = 1792 * ((((unint64_t)(105728 - (void)v15) >> 8) * (unsigned __int128)0x2492492492492493uLL) >> 64)
      + 1792;
  bzero(v22, v24);
  int8x8_t v25 = &v22[v24];
  if (end == begin)
  {
    int8x8_t v26 = v91;
  }
  else
  {
    do
    {
      end -= 1792;
      v22 -= 1792;
      memcpy(v22, end, 0x700uLL);
    }
    while (end != begin);
    int8x8_t v26 = v91;
    end = (char *)v91->_localSpotsLocRefDist.__begin_;
  }
  v26->_localSpotsLocRefDist.__begin_ = v22;
  v26->_localSpotsLocRefDist.__end_ = v25;
  v26->_localSpotsLocRefDist.__end_cap_.__value_ = v23;
  uint64_t v12 = v26;
  if (end) {
    operator delete(end);
  }
LABEL_22:
  float32x2_t v28 = (char *)v12->_localNa.__begin_;
  float32x2_t v29 = (char *)v12->_localNa.__end_;
  float32x2_t v30 = (char *)(v29 - v28);
  unint64_t v31 = 0x6DB6DB6DB6DB6DB7 * ((v29 - v28) >> 6);
  if (v31 > 0x3B)
  {
    if (v30 == (char *)26880) {
      goto LABEL_40;
    }
    float32x2_t v42 = v28 + 26880;
    goto LABEL_36;
  }
  float32x2_t v32 = v12->_localNa.__end_cap_.__value_;
  if (0x6DB6DB6DB6DB6DB7 * ((v32 - v29) >> 6) >= 60 - v31)
  {
    bzero(v12->_localNa.__end_, 448 * ((((unint64_t)(26432 - (void)v30) >> 6) * (unsigned __int128)0x2492492492492493uLL) >> 64) + 448);
    float32x2_t v42 = &v29[448
             * ((((unint64_t)(26432 - (void)v30) >> 6) * (unsigned __int128)0x2492492492492493uLL) >> 64)
             + 448];
LABEL_36:
    v12->_localNa.__end_ = v42;
    goto LABEL_40;
  }
  unint64_t v33 = 0x6DB6DB6DB6DB6DB7 * ((v32 - v28) >> 6);
  unint64_t v34 = 0xDB6DB6DB6DB6DB6ELL * ((v32 - v28) >> 6);
  if (v34 <= 0x3C) {
    unint64_t v34 = 60;
  }
  if (v33 >= 0x49249249249249) {
    unint64_t v35 = 0x92492492492492;
  }
  else {
    unint64_t v35 = v34;
  }
  if (v35 > 0x92492492492492) {
    goto LABEL_92;
  }
  int8x8_t v36 = (char *)operator new(448 * v35);
  float32x2_t v37 = &v36[64 * ((v29 - v28) >> 6)];
  float32x2_t v38 = &v36[448 * v35];
  size_t v39 = 448 * ((((unint64_t)(26432 - (void)v30) >> 6) * (unsigned __int128)0x2492492492492493uLL) >> 64)
      + 448;
  bzero(v37, v39);
  float32x2_t v40 = &v37[v39];
  if (v29 == v28)
  {
    int64x2_t v41 = v91;
  }
  else
  {
    do
    {
      v29 -= 448;
      v37 -= 448;
      memcpy(v37, v29, 0x1C0uLL);
    }
    while (v29 != v28);
    int64x2_t v41 = v91;
    float32x2_t v29 = (char *)v91->_localNa.__begin_;
  }
  v41->_localNa.__begin_ = v37;
  v41->_localNa.__end_ = v40;
  v41->_localNa.__end_cap_.__value_ = v38;
  uint64_t v12 = v41;
  if (v29) {
    operator delete(v29);
  }
LABEL_40:
  uint64_t v43 = (char *)v12->_specsOut.__begin_;
  uint64_t v44 = (char *)v12->_specsOut.__end_;
  uint64_t v45 = (char *)(v44 - v43);
  unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * ((v44 - v43) >> 3);
  float v90 = v5;
  if (v46 <= 0x3B)
  {
    float v47 = v12->_specsOut.__end_cap_.__value_;
    if (0xAAAAAAAAAAAAAAABLL * ((v47 - v44) >> 3) >= 60 - v46)
    {
      bzero(v44, 24 * ((1416 - (uint64_t)v45) / 0x18uLL) + 24);
      v12->_specsOut.__end_ = &v44[24 * ((1416 - (uint64_t)v45) / 0x18uLL) + 24];
      goto LABEL_66;
    }
    unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * ((v47 - v43) >> 3);
    unint64_t v49 = 0x5555555555555556 * ((v47 - v43) >> 3);
    if (v49 <= 0x3C) {
      unint64_t v49 = 60;
    }
    if (v48 >= 0x555555555555555) {
      unint64_t v50 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v50 = v49;
    }
    if (v50 <= 0xAAAAAAAAAAAAAAALL)
    {
      id v51 = (char *)operator new(24 * v50);
      int v52 = &v51[8 * ((v44 - v43) >> 3)];
      v53 = &v51[24 * v50];
      size_t v54 = 24 * ((1416 - (uint64_t)v45) / 0x18uLL) + 24;
      bzero(v52, v54);
      v55 = &v52[v54];
      if (v44 == v43)
      {
        v91->_specsOut.__begin_ = v52;
        v91->_specsOut.__end_ = v55;
        v91->_specsOut.__end_cap_.__value_ = v53;
        uint64_t v12 = v91;
      }
      else
      {
        do
        {
          id v56 = v52;
          *((void *)v52 - 2) = 0;
          *((void *)v52 - 1) = 0;
          long long v57 = *(_OWORD *)(v44 - 24);
          v44 -= 24;
          v11.i32[1] = DWORD1(v57);
          *(_OWORD *)(v52 - 24) = v57;
          v52 -= 24;
          *((void *)v56 - 1) = *((void *)v44 + 2);
          *(void *)uint64_t v44 = 0;
          *((void *)v44 + 1) = 0;
          *((void *)v44 + 2) = 0;
        }
        while (v44 != v43);
        uint64_t v44 = (char *)v91->_specsOut.__begin_;
        v58 = (char *)v91->_specsOut.__end_;
        v91->_specsOut.__begin_ = v52;
        v91->_specsOut.__end_ = v55;
        v91->_specsOut.__end_cap_.__value_ = v53;
        uint64_t v12 = v91;
        if (v58 != v44)
        {
          v59 = v58;
          do
          {
            int v61 = (void *)*((void *)v59 - 3);
            v59 -= 24;
            int v60 = v61;
            if (v61)
            {
              *((void *)v58 - 2) = v60;
              operator delete(v60);
            }
            v58 = v59;
          }
          while (v59 != v44);
        }
      }
      if (v44) {
        operator delete(v44);
      }
      goto LABEL_66;
    }
LABEL_92:
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  if (v45 != (char *)1440)
  {
    int v62 = v43 + 1440;
    if (v44 != v62)
    {
      int v63 = (char *)v12->_specsOut.__end_;
      do
      {
        int v65 = (void *)*((void *)v63 - 3);
        v63 -= 24;
        int v64 = v65;
        if (v65)
        {
          *((void *)v44 - 2) = v64;
          operator delete(v64);
        }
        uint64_t v44 = v63;
      }
      while (v63 != v62);
    }
    v12->_specsOut.__end_ = v62;
  }
LABEL_66:
  for (uint64_t i = 0; i != 60; ++i)
  {
    int v67 = (char *)v12->_specsOut.__begin_;
    int v68 = &v67[24 * i];
    int v70 = v68 + 8;
    int v69 = (char *)*((void *)v68 + 1);
    int v71 = *(char **)v68;
    uint64_t v72 = (uint64_t)&v69[-*(void *)v68];
    unint64_t v73 = 0xA53FA94FEA53FA95 * (v72 >> 2);
    if (v73 > 7)
    {
      if (v72 != 6048) {
        *int v70 = v71 + 6048;
      }
    }
    else
    {
      v74 = &v67[24 * i];
      uint64_t v77 = *((void *)v74 + 2);
      v76 = (char **)(v74 + 16);
      uint64_t v75 = v77;
      if (0xA53FA94FEA53FA95 * ((v77 - (uint64_t)v69) >> 2) >= 8 - v73)
      {
        bzero(v69, 756 * ((5292 - v72) / 0x2F4uLL) + 756);
        *int v70 = &v69[756 * ((5292 - v72) / 0x2F4uLL) + 756];
      }
      else
      {
        float v93 = v76;
        unint64_t v78 = 0xA53FA94FEA53FA95 * ((v75 - (uint64_t)v71) >> 2);
        uint64_t v79 = 2 * v78;
        if (2 * v78 <= 8) {
          uint64_t v79 = 8;
        }
        if (v78 >= 0x2B580AD602B580) {
          unint64_t v80 = 0x56B015AC056B01;
        }
        else {
          unint64_t v80 = v79;
        }
        if (v80 > 0x56B015AC056B01) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v81 = (char *)operator new(756 * v80);
        v82 = &v81[4 * (v72 >> 2)];
        size_t v92 = 756 * ((5292 - v72) / 0x2F4uLL) + 756;
        bzero(v82, v92);
        id v83 = v82;
        if (v69 == v71)
        {
          v84 = v93;
        }
        else
        {
          v84 = v93;
          do
          {
            v69 -= 756;
            v83 -= 756;
            memcpy(v83, v69, 0x2F4uLL);
          }
          while (v69 != v71);
          int v69 = *(char **)v68;
        }
        id v85 = &v81[756 * v80];
        *(void *)int v68 = v83;
        uint64_t v12 = v91;
        *int v70 = &v82[v92];
        NSObject *v84 = v85;
        if (v69) {
          operator delete(v69);
        }
      }
    }
  }
  *(float *)v11.i32 = (float)v12->_gmoRefDist;
  peridot::compensateForParallax(v12->_unitInfo->var1, (int32x2_t *)&v12->_unitInfo->var0.operationalSpotLocations, 0, (float32x4_t *)&v90->_operationalSpotsLocRefDist, v11);
  *(float *)v86.i32 = (float)v12->_gmoRefDist;
  peridot::compensateForParallax(v12->_unitInfo->var1, (int32x2_t *)&v12->_unitInfo->var0.factorySpotLocations, 0, (float32x4_t *)&v90->_factorySpotsLocRefDist, v86);
  if (![(GmoEngine *)v12->_engine getAnchorsWithHysteresis:&v90->_operationalSpotsLocRefDist anchorsWithHist:&v90->_currAnchors])
  {
    long long v6 = v91;
    p_var3 = &v91->_unitInfo->var3;
    v91->_spotsCRRefDist = p_var3;
    memcpy(p_var3, &v90->_operationalSpotsLocRefDist, sizeof($9816EE93AC90BBB150E2CDBAC981FECC));
    *(_OWORD *)&v91->_unint64_t bankCounter = xmmword_259120350;
    *(_OWORD *)&v91->_lastHomographyAttemptTimeSec = xmmword_259120360;
    v91->_isSopSpotsLocLoaded = 0;
    gmoCoreAnalyticsTelemetry::init(&v90->_ca);
LABEL_89:
    id v87 = v6;
    goto LABEL_90;
  }
  id v87 = 0;
  long long v6 = v91;
LABEL_90:

  return v87;
}

- (void)setGmoCfgBits:(GmoCfgBits)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[GmoController setGmoCfgBits:]";
    __int16 v9 = 1024;
    v10.all = a3.all;
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Setting GMO Config to: 0x%X", (uint8_t *)&v7, 0x12u);
  }
  self->_gmoCfgBits = a3;
  if ((a3.all & 0x80000000) != 0)
  {
    long long v5 = objc_alloc_init(GmoDbgServices);
    dbgSrvc = self->_dbgSrvc;
    self->_dbgSrvc = v5;
  }
}

- (void).cxx_destruct
{
  begin = (char *)self->_specsOut.__begin_;
  if (begin)
  {
    end = (char *)self->_specsOut.__end_;
    long long v5 = self->_specsOut.__begin_;
    if (end != begin)
    {
      long long v6 = (char *)self->_specsOut.__end_;
      do
      {
        double v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        int v7 = v8;
        if (v8)
        {
          *((void *)end - 2) = v7;
          operator delete(v7);
        }
        end = v6;
      }
      while (v6 != begin);
      long long v5 = self->_specsOut.__begin_;
    }
    self->_specsOut.__end_ = begin;
    operator delete(v5);
  }
  __int16 v9 = self->_localNa.__begin_;
  if (v9)
  {
    self->_localNa.__end_ = v9;
    operator delete(v9);
  }
  GmoCfgBits v10 = self->_localSpotsLocRefDist.__begin_;
  if (v10)
  {
    self->_localSpotsLocRefDist.__end_ = v10;
    operator delete(v10);
  }
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_dbgSrvc, 0);
}

- (gmoCoreAnalyticsTelemetry)ca
{
  return (gmoCoreAnalyticsTelemetry *)memcpy(retstr, &self->_ca, sizeof(gmoCoreAnalyticsTelemetry));
}

- (SessionState)sessionState
{
  return (SessionState *)memcpy(retstr, &self->_sessionState, sizeof(SessionState));
}

- (BOOL)solutionOKLast
{
  return self->_solutionOKLast;
}

- (GlobalEstimationCtrl)hCtrlLast
{
  return self->_hCtrlLast;
}

- (void)setSnrHysteresisPct:(float)a3
{
  self->_snrHysteresisPct = a3;
}

- (float)snrHysteresisPct
{
  return self->_snrHysteresisPct;
}

- (float)spotSizeSigma
{
  return self->_spotSizeSigma;
}

- (void)setGmoRefDist:(unint64_t)a3
{
  self->_gmoRefDist = a3;
}

- (unint64_t)gmoRefDist
{
  return self->_gmoRefDist;
}

- (double)timeBetweenHomographyAttemps
{
  return self->_timeBetweenHomographyAttemps;
}

- (double)lastHomographyAttemptTimeSec
{
  return self->_lastHomographyAttemptTimeSec;
}

- (unint64_t)minFramesBetweenHomogCycle
{
  return self->_minFramesBetweenHomogCycle;
}

- (void)setBankCounter:(unint64_t)a3
{
  self->_unint64_t bankCounter = a3;
}

- (unint64_t)bankCounter
{
  return self->_bankCounter;
}

- (void)setIsSphere:(unsigned __int8)a3
{
  self->_isSphere = a3;
}

- (unsigned)isSphere
{
  return self->_isSphere;
}

- (vector<std::vector<SpecsResults>,)specsOut
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self->_specsOut.__begin_;
  end = (char *)self->_specsOut.__end_;
  result = (vector<std::vector<SpecsResults>, std::allocator<std::vector<SpecsResults>>> *)(end - begin);
  if (end != begin)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)result >> 3);
    if (v7 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    result = (vector<std::vector<SpecsResults>, std::allocator<std::vector<SpecsResults>>> *)operator new((size_t)result);
    double v8 = result;
    uint64_t v9 = 0;
    retstr->__begin_ = result;
    retstr->__end_ = result;
    v17 = retstr;
    retstr->__end_cap_.__value_ = result + v7;
    do
    {
      GmoCfgBits v10 = &v8[v9];
      uint64_t v11 = &begin[v9 * 24];
      v10->__begin_ = 0;
      v10->__end_ = 0;
      v10->__end_cap_.__value_ = 0;
      v13 = *(unsigned char **)&begin[v9 * 24];
      uint64_t v12 = *(unsigned char **)&begin[v9 * 24 + 8];
      int64_t v14 = v12 - v13;
      if (v12 != v13)
      {
        if (0xA53FA94FEA53FA95 * (v14 >> 2) >= 0x56B015AC056B02) {
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        }
        v15 = (char *)operator new(v14);
        v10->__begin_ = v15;
        v10->__end_ = v15;
        unint64_t v16 = &v15[4 * (v14 >> 2)];
        v10->__end_cap_.__value_ = v16;
        result = (vector<std::vector<SpecsResults>, std::allocator<std::vector<SpecsResults>>> *)memcpy(v15, v13, v14);
        v10->__end_ = v16;
      }
      ++v9;
    }
    while (v11 + 24 != end);
    v17->__end_ = &v8[v9];
  }
  return result;
}

- (void)setCurrAnchors:(PDAnchors *)a3
{
}

- (PDAnchors)currAnchors
{
  return (PDAnchors *)memcpy(retstr, &self->_currAnchors, sizeof(PDAnchors));
}

- (BOOL)isSopSpotsLocLoaded
{
  return self->_isSopSpotsLocLoaded;
}

- ($9816EE93AC90BBB150E2CDBAC981FECC)sopSpotsLoc
{
  return ($9816EE93AC90BBB150E2CDBAC981FECC *)memcpy(retstr, &self->_sopSpotsLoc, sizeof($9816EE93AC90BBB150E2CDBAC981FECC));
}

- (vector<common::PeridotSpotValues<float>,)localNa
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  end = self[5].__end_;
  value = self[5].__end_cap_.__value_;
  int64_t v6 = value - end;
  if (value != end)
  {
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (v6 >> 6)) >= 0x92492492492493) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v7 = (char *)operator new(v6);
    retstr->__begin_ = v7;
    double v8 = &v7[64 * (v6 >> 6)];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<common::PeridotSpotValues<float>, std::allocator<common::PeridotSpotValues<float>>> *)memcpy(v7, end, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (vector<common::PeridotSpotValues<CGPoint>,)localSpotsLocRefDist
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  end = self[4].__end_;
  value = self[4].__end_cap_.__value_;
  int64_t v6 = value - end;
  if (value != end)
  {
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (v6 >> 8)) >= 0x24924924924925) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v7 = (char *)operator new(v6);
    retstr->__begin_ = v7;
    double v8 = &v7[256 * (v6 >> 8)];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<common::PeridotSpotValues<CGPoint>, std::allocator<common::PeridotSpotValues<CGPoint>>> *)memcpy(v7, end, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- ($9816EE93AC90BBB150E2CDBAC981FECC)spotsCRRefDist
{
  return self->_spotsCRRefDist;
}

- ($9816EE93AC90BBB150E2CDBAC981FECC)factorySpotsLocRefDist
{
  return ($9816EE93AC90BBB150E2CDBAC981FECC *)memcpy(retstr, &self->_factorySpotsLocRefDist, sizeof($9816EE93AC90BBB150E2CDBAC981FECC));
}

- ($9816EE93AC90BBB150E2CDBAC981FECC)operationalSpotsLocRefDist
{
  return ($9816EE93AC90BBB150E2CDBAC981FECC *)memcpy(retstr, &self->_operationalSpotsLocRefDist, sizeof($9816EE93AC90BBB150E2CDBAC981FECC));
}

- (void)setEngineNeedsConfiguration:(BOOL)a3
{
  self->_engineNeedsConfiguration = a3;
}

- (BOOL)engineNeedsConfiguration
{
  return self->_engineNeedsConfiguration;
}

- (GmoEngine)engine
{
  return self->_engine;
}

- (GmoDbgServices)dbgSrvc
{
  return self->_dbgSrvc;
}

- (PeridotUnitInfo)unitInfo
{
  return self->_unitInfo;
}

- (SessionState)sessionCalcState
{
  if (self->_hCtrlLast.hOk && self->_solutionOKLast)
  {
    gmoCoreAnalyticsTelemetry::reportLongTermStats(&self->_ca);
    p_coreAnalyticsPersistentData = &self->_sessionState.persistent.coreAnalyticsPersistentData;
    uint64_t v6 = *(void *)&self->_ca._longTermEventPersistentData.lastEventYear;
    if (self->_ca._isFireLongTermEvent)
    {
      self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[29] = 0.0;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[21] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[25] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[13] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[17] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[5] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[9] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[27] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP50Arr[1] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[19] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[23] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[11] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[15] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[3] = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.calibErrP95Arr[7] = 0u;
      *(_OWORD *)&p_coreAnalyticsPersistentData->coreAnalyticsLongTermData.sessionCount = 0u;
      *(_OWORD *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.homogDoneCount = 0u;
      self->_ca._isFireLongTermEvent = 0;
    }
    else
    {
      memcpy(p_coreAnalyticsPersistentData, &self->_ca._longTermEventPersistentData, sizeof(CoreAnalyticsPersistentData));
      ++self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.sessionCount;
    }
    *(void *)&self->_sessionState.persistent.coreAnalyticsPersistentData.coreAnalyticsLongTermData.lastEventYear = v6;
  }
  return (SessionState *)memcpy(retstr, &self->_sessionState, sizeof(SessionState));
}

- (BOOL)shouldSaveToFile
{
  return 0;
}

- (id)getGmoMetaDataArray
{
  return [(GmoDbgServices *)self->_dbgSrvc getGmoMetaDataArray];
}

@end