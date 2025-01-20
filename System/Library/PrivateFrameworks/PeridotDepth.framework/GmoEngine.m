@interface GmoEngine
- (BOOL)conditionsForHomography;
- (BOOL)homogClassifier:(const void *)a3 camCalib:(id)a4 smoothedSpotsLocAtRefDist:(id *)a5 currentSpotsLocAtRefDist:(id *)a6 factorySpotsLocAtRefDist:(id *)a7 validSpotsIndexes:(const void *)a8 smoothedSNR:(const void *)a9 smoothedSNa:(const void *)a10 gmoMetrics:(GmoMetrics *)a11 estTols:(EstTols *)a12;
- (GmoEngine)initWithPulseShape:(const float *)a3 pulseShapeSize:(unint64_t)a4 spotSizeSigma:(float)a5 unitInfo:(const PeridotUnitInfo *)a6;
- (NSArray)avgSpecSnr;
- (NSArray)avgStd;
- (NSArray)snrWeight;
- (PRIConfigSpec)specConfig;
- (const)unitInfo;
- (float)allowedDistFromCalib;
- (float)calcHomogModelErrorR:(void *)a3 estSpotLocAtRefDistValid:(void *)a4 globalEstimationResult:(void *)a5;
- (float)minSpecQsSnr;
- (float)spotSizeSigma;
- (id).cxx_construct;
- (int)blockSmoothing:(void *)a3 localNa:(const void *)a4 specsOut:(void *)a5 numOfFrames:(unint64_t)a6 smoothedSpotsLoc:(id *)a7 validSpotsIndexes:(void *)a8 numOfValidSpots:(unsigned int *)a9 smoothedSNR:(void *)a10 smoothedSNa:(void *)a11;
- (int)calculateGtErrP95:(id *)a3 spotLocations:(id *)a4 result:(float *)a5;
- (int)calculateItpQual:(const PDAnchors *)a3 spotLocations:(id *)a4 result:(float *)a5;
- (int)calculateSnrLoss:(const PDAnchors *)a3 gtSpotLocations:(id *)a4 radialTargetFlag:(BOOL)a5 gtSnr:(void *)a6 snrLoss:(void *)a7;
- (int)calculateSpecQs:(const GmoProcessBankInputs *)a3 pulsesPerphase:(unint64_t)a4 specsOut:(SpecsResults *)a5;
- (int)configureEngineWithSpecConfig:(const PRIConfigSpec *)a3;
- (int)findSpotLocation1D:(float)a3 spotLocation:(float *)a4 outBound:(BOOL *)a5;
- (int)findSpotLocation:(const SpecsResults *)a3 withAnchors:(const SpConfig *)a4 spotLocationEstimation:(void *)a5 outBound:(void *)a6;
- (int)getAnchorsWithHysteresis:(id *)a3 anchorsWithHist:(PDAnchors *)a4;
- (int)getAnchorsWithHysteresis:(id *)a3 currAnchors:(const PDAnchors *)a4 snrHysteresisPct:(float)a5 anchorsWithHist:(PDAnchors *)a6 violations:(spViolations *)a7 anchorMoveIdx:(void *)a8 spotLocationsAtRefDist:(id *)a9 anchorsMoved:(unint64_t *)a10;
- (int)globalEstimation:(id *)a3 estSpotLocAtRefDist:(id *)a4 validSpotsIndexes:(const void *)a5 result:(void *)a6;
- (unint64_t)ambientSpecTableSize;
- (unint64_t)binsArraySize;
- (unint64_t)centerLeftHp;
- (unint64_t)centerLeftHs;
- (unint64_t)centerRightHp;
- (unint64_t)centerRightHs;
- (unint64_t)echoSpecTableSize;
- (unint64_t)maxSnrLimit;
- (unint64_t)refXSize;
- (unint64_t)totBinsHp;
- (unint64_t)totBinsHs;
- (vector<std::vector<unsigned)specPhasePriOrder;
- (void)ambientSpecTable;
- (void)calculateGaussianIntegralForFrame:(id *)a3 anchors:(const PDAnchors *)a4 spotSize:(float)a5 integral:(void *)a6;
- (void)clipSpotsLocation:(id *)a3 refSpotsLoc:(id *)a4 clippedSpotLocations:(id *)a5 numOfClippedSpots:(unint64_t *)a6;
- (void)echoSpecTable;
- (void)excludeBins;
- (void)getHomogTols:(const void *)a3 camMat:(id *)a4 estTols:(EstTols *)a5;
- (void)numSpecBins;
- (void)refRelQs;
- (void)refX;
- (void)setUnitInfo:(const PeridotUnitInfo *)a3;
- (void)specSwitch:(unint64_t)a3 from:(const PRIConfigSpec *)a4 toBuffer:(unsigned __int8)a5[16];
@end

@implementation GmoEngine

- (int)findSpotLocation:(const SpecsResults *)a3 withAnchors:(const SpConfig *)a4 spotLocationEstimation:(void *)a5 outBound:(void *)a6
{
  unint64_t v11 = 0;
  BOOL v12 = 1;
  int64x2_t v13 = vdupq_n_s64(0x7FF8000000000000uLL);
  int64x2_t v44 = v13;
  v14 = (float *)a3;
  while (1)
  {
    float v15 = v14[56];
    float v16 = v15 + v14[14];
    float v17 = v14[42];
    float v18 = fmaxf((float)(v16 + (float)(v17 + *v14)) + 0.000005, 0.0);
    float v19 = v14[70];
    float v20 = (float)((float)(v19 + v14[28]) + v16) + 0.000004;
    if (v20 <= v18) {
      float v21 = v18;
    }
    else {
      float v21 = v20;
    }
    float v22 = v14[98];
    float v23 = v22 + v15;
    float v24 = v14[84];
    float v25 = (float)(v23 + (float)(v24 + v17)) + 0.000003;
    BOOL v26 = v25 <= v21;
    if (v25 <= v21) {
      float v27 = v21;
    }
    else {
      float v27 = v25;
    }
    if (v20 <= v18) {
      BOOL v26 = 0;
    }
    float v28 = v14[112];
    float v29 = (float)((float)(v28 + v19) + v23) + 0.000002;
    uint64_t v30 = v25 > v21 || v29 > v27;
    if (v29 > v27) {
      BOOL v26 = 1;
    }
    else {
      float v29 = v27;
    }
    float v31 = v14[140] + v22;
    if ((float)((float)(v31 + (float)(v14[126] + v24)) + 0.000001) > v29)
    {
      float v29 = (float)(v31 + (float)(v14[126] + v24)) + 0.000001;
      uint64_t v30 = 2;
      BOOL v26 = 0;
    }
    float v32 = (float)(v14[154] + v28) + v31;
    if (v32 <= v29) {
      float v33 = v29;
    }
    else {
      float v33 = v32;
    }
    if (v32 <= v29) {
      unint64_t v34 = v30;
    }
    else {
      unint64_t v34 = 2;
    }
    unsigned int v35 = v32 > v29 || v26;
    v36 = &a3->var0[v34][v35][v11];
    float v37 = *v36;
    *(float *)v13.i32 = v36[42] + *v36;
    uint64_t v38 = 2;
    if (!v35) {
      uint64_t v38 = 1;
    }
    float v39 = a3->var0[v34][v38][v11];
    *(float *)v13.i32 = *(float *)v13.i32 / v33;
    uint64_t v45 = 0;
    if (-[GmoEngine findSpotLocation1D:spotLocation:outBound:](self, "findSpotLocation1D:spotLocation:outBound:", (char *)&v45 + 4, a6, *(double *)v13.i64, *(_OWORD *)&v44))
    {
      break;
    }
    *(float *)&double v40 = (float)(v39 + v37) / v33;
    v41.i8[0] = a4->var0[v11];
    *(double *)a5 = (float)((float)v35
                          + (float)((float)(*((float *)&v45 + 1) + -1.0)
                                  + (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v41)).i32[0]));
    if ([(GmoEngine *)self findSpotLocation1D:&v45 spotLocation:(char *)a6 + 1 outBound:v40])
    {
      break;
    }
    v42.i8[0] = a4->var1[v11];
    *(double *)v13.i64 = (float)((float)v34
                               + (float)((float)(*(float *)&v45 + -1.0)
                                       + (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v42)).i32[0]));
    *((void *)a5 + 1) = v13.i64[0];
    if (v14[168] < self->_minSpecQsSnr)
    {
      v13.i32[1] = v44.i32[1];
      *(int64x2_t *)a5 = v44;
    }
    BOOL v12 = v11 < 0xD;
    ++v14;
    a5 = (char *)a5 + 16;
    a6 = (char *)a6 + 2;
    if (++v11 == 14) {
      return 0;
    }
  }
  return v12;
}

- (int)findSpotLocation1D:(float)a3 spotLocation:(float *)a4 outBound:(BOOL *)a5
{
  *a5 = 0;
  value = self->_refRelQs.__ptr_.__value_;
  if (*value < a3)
  {
    float v6 = *self->_refX.__ptr_.__value_;
LABEL_5:
    *a4 = v6;
    *a5 = 1;
    return 0;
  }
  unint64_t v7 = self->_refXSize - 1;
  if (value[v7] > a3)
  {
    float v6 = self->_refX.__ptr_.__value_[v7];
    goto LABEL_5;
  }
  unint64_t v9 = 1;
  do
  {
    unint64_t v10 = v9;
    float v11 = value[v9];
    if (v9 >= v7) {
      break;
    }
    ++v9;
  }
  while (v11 >= a3);
  *a4 = (float)((float)((float)(self->_refX.__ptr_.__value_[v10] - self->_refX.__ptr_.__value_[v10 - 1])
                      * (float)(a3 - value[v10 - 1]))
              / (float)(v11 - value[v10 - 1]))
      + self->_refX.__ptr_.__value_[v10 - 1];
  return 0;
}

- (int)calculateSpecQs:(const GmoProcessBankInputs *)a3 pulsesPerphase:(unint64_t)a4 specsOut:(SpecsResults *)a5
{
  uint64_t v343 = ((uint64_t (*)(GmoEngine *, SEL, const GmoProcessBankInputs *))MEMORY[0x270FA5388])(self, a2, a3);
  __b = v5;
  v378[1018] = *MEMORY[0x263EF8340];
  uint64_t v9 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(v6 + 32);
  uint64_t v345 = v6;
  if (v8) {
    _ZF = v9 == 0;
  }
  else {
    _ZF = 1;
  }
  if (!_ZF)
  {
    uint64_t v11 = 0;
    double v375 = -(double)v7;
    float64x2_t v371 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 / (double)v7), 0);
    float64x2_t v373 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v7 + -1.0), 0);
    BOOL v12 = (float32x2_t *)(v6 + 892);
    int64x2_t v13 = (float32x4_t *)v378;
    __asm { FMOV            V0.2D, #1.0 }
    float64x2_t v369 = _Q0;
    do
    {
      uint64_t v346 = v11;
      uint64_t v17 = 0;
      float v18 = v13;
      float v19 = v12;
      do
      {
        float v20 = v18;
        float v21 = v19;
        uint64_t v22 = v9;
        do
        {
          float32x4_t v23 = *(float32x4_t *)v21[-4].f32;
          float64x2_t v24 = vcvtq_f64_f32(*(float32x2_t *)v23.f32);
          float64x2_t v25 = vcvt_hight_f64_f32(v23);
          float64x2_t v364 = vmlsq_f64(v369, v371, (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v25, v373), (int8x16_t)v373, (int8x16_t)v25));
          float64x2_t __xd = vmlsq_f64(v369, v371, (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v24, v373), (int8x16_t)v373, (int8x16_t)v24));
          long double v359 = log(__xd.f64[1]);
          v26.f64[0] = log(__xd.f64[0]);
          v26.f64[1] = v359;
          float64x2_t v360 = v26;
          __xd.f64[0] = log(v364.f64[1]);
          v27.f64[0] = log(v364.f64[0]);
          v27.f64[1] = __xd.f64[0];
          v20[-2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(v360, v375)), vmulq_n_f64(v27, v375));
          float32x4_t v28 = *(float32x4_t *)v21[-2].f32;
          float64x2_t v29 = vcvtq_f64_f32(*(float32x2_t *)v28.f32);
          float64x2_t v30 = vcvt_hight_f64_f32(v28);
          float64x2_t v365 = vmlsq_f64(v369, v371, (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v30, v373), (int8x16_t)v373, (int8x16_t)v30));
          float64x2_t __xe = vmlsq_f64(v369, v371, (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v29, v373), (int8x16_t)v373, (int8x16_t)v29));
          v360.f64[0] = log(__xe.f64[1]);
          v31.f64[0] = log(__xe.f64[0]);
          v31.f64[1] = v360.f64[0];
          float64x2_t v361 = v31;
          __xe.f64[0] = log(v365.f64[1]);
          v32.f64[0] = log(v365.f64[0]);
          v32.f64[1] = __xe.f64[0];
          v20[-1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(v361, v375)), vmulq_n_f64(v32, v375));
          float64x2_t v33 = vcvtq_f64_f32(*v21);
          float64x2_t v34 = vcvt_hight_f64_f32(*(float32x4_t *)v21->f32);
          float64x2_t v366 = vmlsq_f64(v369, v371, (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v34, v373), (int8x16_t)v373, (int8x16_t)v34));
          float64x2_t __xf = vmlsq_f64(v369, v371, (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v33, v373), (int8x16_t)v373, (int8x16_t)v33));
          v361.f64[0] = log(__xf.f64[1]);
          v35.f64[0] = log(__xf.f64[0]);
          v35.f64[1] = v361.f64[0];
          float64x2_t v362 = v35;
          __xf.f64[0] = log(v366.f64[1]);
          v36.f64[0] = log(v366.f64[0]);
          v36.f64[1] = __xf.f64[0];
          *float v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(v362, v375)), vmulq_n_f64(v36, v375));
          v21 += 84;
          v20 += 42;
          --v22;
        }
        while (v22);
        ++v17;
        v19 += 336;
        v18 += 168;
      }
      while (v17 != v8);
      uint64_t v11 = v346 + 1;
      v12 += 6;
      v13 += 3;
    }
    while (v346 != 13);
  }
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  float v39 = (float *)(v345 + 412);
  double v40 = (float *)(v345 + 80);
  int8x8_t v41 = (unint64_t *)v343;
  do
  {
    if (v39[1] > 0.8)
    {
      double v42 = *v40;
      double v43 = v39[5];
      if (v43 <= 0.8)
      {
        if (v42 > 0.8)
        {
          float v45 = *v39;
          int64x2_t v44 = (char *)&v378[1011] + v37;
          *(float *)((char *)&v378[1011] + v37) = *v39;
          goto LABEL_24;
        }
      }
      else if (v42 > 0.8)
      {
        int64x2_t v44 = (char *)&v378[1011] + 4 * v38;
        *(float *)((char *)&v378[1011] + v37) = *v39;
        float v45 = v39[4];
LABEL_24:
        *(float *)((char *)&v378[1004] + v37) = v45;
        v47 = (char *)&v378[1004] + 4 * v38;
        goto LABEL_27;
      }
      int64x2_t v44 = (char *)&v378[1011] + v37;
      *(_DWORD *)((char *)&v378[1011] + v37) = 2143289344;
      v47 = (char *)&v378[1004] + v37;
      *(_DWORD *)((char *)&v378[1004] + v37) = 2143289344;
LABEL_27:
      if (v39[3] > 0.8) {
        goto LABEL_12;
      }
      if (v43 <= 0.8) {
        goto LABEL_14;
      }
      goto LABEL_31;
    }
    if (v39[5] <= 0.8)
    {
      *(_DWORD *)((char *)&v378[1011] + v37) = 2143289344;
      v47 = (char *)&v378[1004] + v37;
      goto LABEL_13;
    }
    if (*v40 <= 0.8)
    {
      int64x2_t v44 = (char *)&v378[1011] + 4 * v38;
      *(_DWORD *)((char *)&v378[1011] + v37) = 2143289344;
      v47 = (char *)&v378[1004] + 4 * v38;
      *(_DWORD *)((char *)&v378[1004] + v37) = 2143289344;
    }
    else
    {
      int v46 = *((_DWORD *)v39 + 4);
      int64x2_t v44 = (char *)&v378[1011] + v37;
      *(_DWORD *)((char *)&v378[1011] + v37) = v46;
      v47 = (char *)&v378[1004] + v37;
      *(_DWORD *)((char *)&v378[1004] + v37) = v46;
    }
LABEL_31:
    if (v39[7] > 0.8)
    {
LABEL_12:
      *(_DWORD *)int64x2_t v44 = 2143289344;
LABEL_13:
      *(_DWORD *)v47 = 2143289344;
    }
LABEL_14:
    ++v38;
    v37 += 4;
    v40 += 6;
    v39 += 8;
  }
  while (v37 != 56);
  memset_pattern16(__b, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 56, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 112, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 168, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 224, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 280, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 336, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 392, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 448, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 504, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 560, &unk_259120E70, 0x38uLL);
  memset_pattern16(__b + 616, &unk_259120E70, 0x38uLL);
  unint64_t v49 = 0;
  unint64_t v372 = 0;
  unint64_t v50 = 0;
  unint64_t v374 = 0;
  unint64_t v51 = 0;
  v363 = __b + 728;
  *((_DWORD *)__b + 188) = 0;
  *((_OWORD *)__b + 45) = 0u;
  *((_OWORD *)__b + 46) = 0u;
  *((_OWORD *)__b + 43) = 0u;
  *((_OWORD *)__b + 44) = 0u;
  *((_OWORD *)__b + 42) = 0u;
  BOOL v370 = 1;
  float v52 = 0.25;
  double v53 = 0.5;
  float v54 = -1.0;
  double v55 = 0.25;
  double v56 = 4.0;
  double v57 = -1.0;
  while (1)
  {
    unint64_t v376 = v49;
    double v58 = v57 - (double)v41[6] + round(*((float *)&v378[1011] + v49) / (*(float *)(v345 + 40) * v56));
    unint64_t v59 = (unint64_t)v58;
    if ((unint64_t)v58 > 0x5B)
    {
      float v367 = 0.0;
      goto LABEL_178;
    }
    unint64_t v60 = v41[20];
    uint64_t v61 = *(void *)(v60 + (v59 << 7));
    if (v61)
    {
      unint64_t v62 = v41[20];
      unint64_t v63 = (unint64_t)v58;
      v64 = (char *)operator new(8uLL);
      *(void *)v64 = v61;
      v65 = v64 + 8;
      v66 = v64;
      int8x8_t v41 = (unint64_t *)v343;
      unint64_t v59 = v63;
      unint64_t v60 = v62;
    }
    else
    {
      v65 = 0;
      v66 = 0;
    }
    unint64_t __x = v59;
    unint64_t v67 = v59 << 7;
    uint64_t v68 = *(void *)(v60 + ((v59 << 7) | 0x20));
    unint64_t v368 = v59 << 7;
    if (!v68)
    {
      v75 = v65;
      goto LABEL_63;
    }
    unint64_t v69 = v60;
    uint64_t v70 = v65 - v66;
    uint64_t v71 = (v65 - v66) >> 3;
    unint64_t v72 = v71 + 1;
    if ((unint64_t)(v71 + 1) >> 61) {
      goto LABEL_378;
    }
    if (v70 >> 2 > v72) {
      unint64_t v72 = v70 >> 2;
    }
    if ((unint64_t)v70 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v73 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v73 = v72;
    }
    if (v73)
    {
      if (v73 >> 61) {
        goto LABEL_380;
      }
      v74 = (char *)operator new(8 * v73);
    }
    else
    {
      v74 = 0;
    }
    v76 = &v74[8 * v71];
    *(void *)v76 = v68;
    v75 = v76 + 8;
    if (v65 == v66)
    {
      v78 = (unint64_t *)v343;
      unint64_t v60 = v69;
      goto LABEL_59;
    }
    unint64_t v77 = v65 - v66 - 8;
    v78 = (unint64_t *)v343;
    if (v77 < 0x18)
    {
      v79 = v65;
      unint64_t v60 = v69;
      do
      {
LABEL_58:
        uint64_t v85 = *((void *)v79 - 1);
        v79 -= 8;
        *((void *)v76 - 1) = v85;
        v76 -= 8;
      }
      while (v79 != v66);
      goto LABEL_59;
    }
    uint64_t v80 = (v77 >> 3) + 1;
    v79 = &v65[-8 * (v80 & 0x3FFFFFFFFFFFFFFCLL)];
    v81 = &v74[8 * v71 - 16];
    v82 = v65 - 16;
    uint64_t v83 = v80 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v84 = *(_OWORD *)v82;
      *((_OWORD *)v81 - 1) = *((_OWORD *)v82 - 1);
      *(_OWORD *)v81 = v84;
      v81 -= 32;
      v82 -= 32;
      v83 -= 4;
    }
    while (v83);
    v76 -= 8 * (v80 & 0x3FFFFFFFFFFFFFFCLL);
    unint64_t v60 = v69;
    if (v80 != (v80 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_58;
    }
LABEL_59:
    v65 = &v74[8 * v73];
    if (v66)
    {
      operator delete(v66);
      int8x8_t v41 = v78;
      unint64_t v60 = v78[20];
      v66 = v76;
    }
    else
    {
      v66 = v76;
      int8x8_t v41 = v78;
    }
    unint64_t v67 = v368;
LABEL_63:
    uint64_t v86 = *(void *)(v60 + (v67 | 0x40));
    if (!v86) {
      goto LABEL_66;
    }
    if (v75 < v65)
    {
      *(void *)v75 = v86;
      v75 += 8;
LABEL_66:
      v87 = v75;
      goto LABEL_85;
    }
    unint64_t v347 = v60;
    uint64_t v88 = (v75 - v66) >> 3;
    unint64_t v89 = v88 + 1;
    if ((unint64_t)(v88 + 1) >> 61) {
      goto LABEL_378;
    }
    if ((v65 - v66) >> 2 > v89) {
      unint64_t v89 = (v65 - v66) >> 2;
    }
    if ((unint64_t)(v65 - v66) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v90 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v90 = v89;
    }
    if (v90)
    {
      if (v90 >> 61) {
        goto LABEL_380;
      }
      v91 = operator new(8 * v90);
    }
    else
    {
      v91 = 0;
    }
    v92 = &v91[8 * v88];
    *(void *)v92 = v86;
    v87 = v92 + 8;
    if (v75 == v66)
    {
      int8x8_t v41 = (unint64_t *)v343;
      unint64_t v60 = v347;
      v65 = &v91[8 * v90];
      if (!v66) {
        goto LABEL_84;
      }
LABEL_83:
      operator delete(v66);
      unint64_t v60 = v41[20];
      goto LABEL_84;
    }
    unint64_t v93 = v75 - 8 - v66;
    if (v93 < 0x58 || (unint64_t)(v66 - v91) < 0x20)
    {
      v94 = v75;
      int8x8_t v41 = (unint64_t *)v343;
      unint64_t v60 = v347;
      do
      {
LABEL_81:
        uint64_t v95 = *((void *)v94 - 1);
        v94 -= 8;
        *((void *)v92 - 1) = v95;
        v92 -= 8;
      }
      while (v94 != v66);
      goto LABEL_82;
    }
    uint64_t v315 = (v93 >> 3) + 1;
    v94 = &v75[-8 * (v315 & 0x3FFFFFFFFFFFFFFCLL)];
    v316 = &v91[8 * v88 - 16];
    v317 = v75 - 16;
    uint64_t v318 = v315 & 0x3FFFFFFFFFFFFFFCLL;
    int8x8_t v41 = (unint64_t *)v343;
    do
    {
      long long v319 = *(_OWORD *)v317;
      *(v316 - 1) = *((_OWORD *)v317 - 1);
      _OWORD *v316 = v319;
      v316 -= 2;
      v317 -= 32;
      v318 -= 4;
    }
    while (v318);
    v92 -= 8 * (v315 & 0x3FFFFFFFFFFFFFFCLL);
    unint64_t v60 = v347;
    if (v315 != (v315 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_81;
    }
LABEL_82:
    v65 = &v91[8 * v90];
    if (v66) {
      goto LABEL_83;
    }
LABEL_84:
    v66 = v92;
    unint64_t v67 = v368;
LABEL_85:
    uint64_t v96 = *(void *)(v60 + (v67 | 0x60));
    if (!v96) {
      goto LABEL_88;
    }
    if (v87 < v65)
    {
      *(void *)v87 = v96;
      v87 += 8;
LABEL_88:
      v97 = v87;
      v98 = v66;
      unint64_t v49 = v376;
      goto LABEL_105;
    }
    uint64_t v99 = (v87 - v66) >> 3;
    unint64_t v100 = v99 + 1;
    if ((unint64_t)(v99 + 1) >> 61) {
LABEL_378:
    }
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    if ((v65 - v66) >> 2 > v100) {
      unint64_t v100 = (v65 - v66) >> 2;
    }
    if ((unint64_t)(v65 - v66) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v100 = 0x1FFFFFFFFFFFFFFFLL;
    }
    if (v100)
    {
      if (v100 >> 61) {
LABEL_380:
      }
        std::__throw_bad_array_new_length[abi:ne180100]();
      v101 = operator new(8 * v100);
    }
    else
    {
      v101 = 0;
    }
    v98 = &v101[8 * v99];
    *(void *)v98 = v96;
    v97 = v98 + 8;
    if (v87 != v66)
    {
      unint64_t v102 = v87 - 8 - v66;
      if (v102 >= 0x58 && (unint64_t)(v66 - v101) >= 0x20)
      {
        uint64_t v320 = (v102 >> 3) + 1;
        v103 = &v87[-8 * (v320 & 0x3FFFFFFFFFFFFFFCLL)];
        v321 = &v101[8 * v99 - 16];
        v322 = v87 - 16;
        uint64_t v323 = v320 & 0x3FFFFFFFFFFFFFFCLL;
        int8x8_t v41 = (unint64_t *)v343;
        do
        {
          long long v324 = *(_OWORD *)v322;
          *(v321 - 1) = *((_OWORD *)v322 - 1);
          _OWORD *v321 = v324;
          v321 -= 2;
          v322 -= 32;
          v323 -= 4;
        }
        while (v323);
        v98 -= 8 * (v320 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v49 = v376;
        if (v320 == (v320 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_103:
          if (!v66) {
            goto LABEL_105;
          }
LABEL_104:
          operator delete(v66);
          goto LABEL_105;
        }
      }
      else
      {
        v103 = v87;
        int8x8_t v41 = (unint64_t *)v343;
        unint64_t v49 = v376;
      }
      do
      {
        uint64_t v104 = *((void *)v103 - 1);
        v103 -= 8;
        *((void *)v98 - 1) = v104;
        v98 -= 8;
      }
      while (v103 != v66);
      goto LABEL_103;
    }
    int8x8_t v41 = (unint64_t *)v343;
    unint64_t v49 = v376;
    if (v66) {
      goto LABEL_104;
    }
LABEL_105:
    uint64_t v105 = v97 - v98;
    if (v97 == v98) {
      break;
    }
    uint64_t v106 = 0;
    unint64_t v51 = 0;
    unint64_t v107 = v105 >> 3;
    uint64_t v108 = *(void *)(v345 + 8);
    if (v107 <= 1) {
      uint64_t v109 = 1;
    }
    else {
      uint64_t v109 = v107;
    }
    float v110 = 0.0;
    float v111 = 0.0;
    float v112 = 0.0;
    float v113 = 0.0;
    float v114 = 0.0;
    float v115 = 0.0;
    do
    {
      unint64_t v116 = *(void *)&v98[8 * v106];
      unint64_t v117 = vcvtpd_u64_f64((double)v116 * v55);
      if (v117 == 3) {
        uint64_t v118 = 1;
      }
      else {
        uint64_t v118 = v117;
      }
      if (v117 == 1) {
        uint64_t v118 = 3;
      }
      if (v108) {
        unint64_t v117 = v118;
      }
      unint64_t v119 = v117 - 1;
      unint64_t v120 = (unint64_t)fmod((double)(v116 - 1), 4.0);
      _CF = v119 > 2 || v120 >= 4;
      if (_CF)
      {
LABEL_376:
        operator delete(v98);
        return v370;
      }
      v122 = (float *)&v377[168 * v119 + 42 * v120 + 3 * v49];
      float v110 = v110 + *v122;
      float v111 = v111 + v122[1];
      float v112 = v112 + v122[2];
      float v113 = v113 + v122[3];
      float v114 = v114 + v122[4];
      float v115 = v115 + v122[5];
      v51 += *(void *)(v41[17] + 32 * v116 - 32);
      ++v106;
    }
    while (v109 != v106);
    unint64_t v123 = v41[22];
    uint64_t v124 = *(void *)(v123 + (__x << 6));
    if (v124)
    {
      v125 = (char *)operator new(8uLL);
      *(void *)v125 = v124;
      v126 = v125 + 8;
      v127 = v125;
    }
    else
    {
      v126 = 0;
      v127 = 0;
    }
    unint64_t v129 = *(void *)(v123 + ((__x << 6) | 0x20));
    if (v129)
    {
      uint64_t v130 = v126 - v127;
      uint64_t v131 = (v126 - v127) >> 3;
      unint64_t v132 = v131 + 1;
      if ((unint64_t)(v131 + 1) >> 61) {
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      }
      if (v130 >> 2 > v132) {
        unint64_t v132 = v130 >> 2;
      }
      _CF = (unint64_t)v130 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v133 = 0x1FFFFFFFFFFFFFFFLL;
      if (!_CF) {
        unint64_t v133 = v132;
      }
      if (v133)
      {
        if (v133 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v134 = (char *)operator new(8 * v133);
      }
      else
      {
        v134 = 0;
      }
      v136 = (unint64_t *)&v134[8 * v131];
      unint64_t *v136 = v129;
      v135 = (char *)(v136 + 1);
      if (v126 == v127)
      {
        unint64_t v49 = v376;
      }
      else
      {
        unint64_t v137 = v126 - v127 - 8;
        unint64_t v49 = v376;
        if (v137 < 0x18)
        {
          v138 = v126;
          goto LABEL_150;
        }
        uint64_t v139 = (v137 >> 3) + 1;
        v138 = &v126[-8 * (v139 & 0x3FFFFFFFFFFFFFFCLL)];
        v140 = &v134[8 * v131 - 16];
        v141 = v126 - 16;
        uint64_t v142 = v139 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v143 = *(_OWORD *)v141;
          *((_OWORD *)v140 - 1) = *((_OWORD *)v141 - 1);
          *(_OWORD *)v140 = v143;
          v140 -= 32;
          v141 -= 32;
          v142 -= 4;
        }
        while (v142);
        v136 -= v139 & 0x3FFFFFFFFFFFFFFCLL;
        if (v139 != (v139 & 0x3FFFFFFFFFFFFFFCLL))
        {
          do
          {
LABEL_150:
            unint64_t v144 = *((void *)v138 - 1);
            v138 -= 8;
            *--v136 = v144;
          }
          while (v138 != v127);
        }
      }
      if (v127) {
        operator delete(v127);
      }
    }
    else
    {
      v135 = v126;
      v136 = (unint64_t *)v127;
      unint64_t v49 = v376;
    }
    float v337 = v112;
    float v339 = v113;
    float v348 = v114;
    float __xa = v115;
    if (v135 != (char *)v136)
    {
      unint64_t v374 = 0;
      unint64_t v145 = (v135 - (char *)v136) >> 3;
      float v367 = 0.0;
      uint64_t v146 = *(void *)(v345 + 8);
      if (v145 <= 1) {
        uint64_t v147 = 1;
      }
      else {
        uint64_t v147 = v145;
      }
      v148 = v136;
      float v149 = 0.0;
      float v150 = 0.0;
      float v151 = 0.0;
      float v152 = 0.0;
      float v153 = 0.0;
      float v154 = 0.0;
      while (1)
      {
        unint64_t v156 = *v148++;
        unint64_t v155 = v156;
        unint64_t v157 = vcvtpd_u64_f64((double)v156 * 0.25);
        if (v157 == 3) {
          uint64_t v158 = 1;
        }
        else {
          uint64_t v158 = v157;
        }
        if (v157 == 1) {
          uint64_t v158 = 3;
        }
        if (v146) {
          unint64_t v157 = v158;
        }
        unint64_t v159 = v157 - 1;
        unint64_t v160 = (unint64_t)fmod((double)(v155 - 1), 4.0);
        if (v159 > 2 || v160 >= 4) {
          break;
        }
        v162 = &v377[168 * v159];
        unint64_t v49 = v376;
        v163 = (float *)&v162[42 * v160 + 3 * v376];
        float v149 = v149 + *v163;
        float v150 = v150 + v163[1];
        float v151 = v151 + v163[2];
        float v152 = v152 + v163[3];
        float v153 = v153 + v163[4];
        float v154 = v154 + v163[5];
        v374 += *(void *)(v41[17] + 32 * v155 - 32);
        if (!--v147) {
          goto LABEL_172;
        }
      }
      char v128 = 0;
      unint64_t v49 = v376;
      goto LABEL_175;
    }
    unint64_t v374 = 0;
    float v149 = 0.0;
    float v150 = 0.0;
    float v151 = 0.0;
    float v152 = 0.0;
    float v153 = 0.0;
    float v154 = 0.0;
LABEL_172:
    float v164 = 1.0 / (float)v374;
    float v165 = v149 * v164;
    float v166 = v150 * v164;
    float v167 = v151 * v164;
    float v168 = v152 * v164;
    float v169 = v153 * v164;
    float v170 = v154 * v164;
    v171 = (float *)&__b[4 * v49];
    float *v171 = v110 - (float)(v165 * (float)v51);
    v171[14] = v111 - (float)(v166 * (float)v51);
    v171[28] = v337 - (float)(v167 * (float)v51);
    v171[42] = v339 - (float)(v168 * (float)v51);
    v171[56] = v348 - (float)(v169 * (float)v51);
    v171[70] = __xa - (float)(v170 * (float)v51);
    char v128 = 1;
    v363[v49] = 1;
    float v367 = (float)((float)(v170 + v169) + (float)((float)(v168 + v167) + (float)(v166 + v165))) * 0.16667;
    if (v136) {
LABEL_175:
    }
      operator delete(v136);
    float v52 = 0.25;
    double v53 = 0.5;
    float v54 = -1.0;
    double v55 = 0.25;
    double v56 = 4.0;
    double v57 = -1.0;
    if (v98) {
      goto LABEL_125;
    }
LABEL_177:
    if ((v128 & 1) == 0) {
      return v370;
    }
LABEL_178:
    LODWORD(v48) = 0;
    float v172 = (float)(v54 - (float)v41[4]) + roundf(*((float *)&v378[1004] + v49) / *(float *)(v345 + 40));
    unint64_t v173 = (unint64_t)v172;
    if ((unint64_t)v172 <= 0x5B)
    {
      unint64_t v174 = v41[20];
      uint64_t v175 = *(void *)(v174 + (v173 << 7) + 16);
      if (v175)
      {
        unint64_t v176 = v41[20];
        unint64_t v177 = (unint64_t)v172;
        v178 = (char *)operator new(8uLL);
        *(void *)v178 = v175;
        v179 = v178 + 8;
        v180 = v178;
        unint64_t v173 = v177;
        unint64_t v174 = v176;
      }
      else
      {
        v179 = 0;
        v180 = 0;
      }
      uint64_t v181 = 16 * v173;
      unint64_t v182 = v173 << 7;
      uint64_t v183 = *(void *)(v174 + ((v173 << 7) | 0x30));
      unint64_t v349 = v173;
      unint64_t __xb = v173 << 7;
      if (!v183)
      {
        v189 = v179;
        int8x8_t v41 = (unint64_t *)v343;
        goto LABEL_206;
      }
      unint64_t v340 = v174;
      uint64_t v184 = v179 - v180;
      uint64_t v185 = (v179 - v180) >> 3;
      unint64_t v186 = v185 + 1;
      if ((unint64_t)(v185 + 1) >> 61) {
        goto LABEL_379;
      }
      if (v184 >> 2 > v186) {
        unint64_t v186 = v184 >> 2;
      }
      if ((unint64_t)v184 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v187 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v187 = v186;
      }
      if (v187)
      {
        if (!(v187 >> 61))
        {
          v188 = (char *)operator new(8 * v187);
          goto LABEL_194;
        }
LABEL_381:
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v188 = 0;
LABEL_194:
      v190 = &v188[8 * v185];
      *(void *)v190 = v183;
      v189 = v190 + 8;
      if (v179 == v180)
      {
        int8x8_t v41 = (unint64_t *)v343;
      }
      else
      {
        unint64_t v191 = v179 - v180 - 8;
        int8x8_t v41 = (unint64_t *)v343;
        if (v191 < 0x18)
        {
          v192 = v179;
          goto LABEL_201;
        }
        uint64_t v193 = (v191 >> 3) + 1;
        v192 = &v179[-8 * (v193 & 0x3FFFFFFFFFFFFFFCLL)];
        v194 = &v188[8 * v185 - 16];
        v195 = v179 - 16;
        uint64_t v196 = v193 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v197 = *(_OWORD *)v195;
          *((_OWORD *)v194 - 1) = *((_OWORD *)v195 - 1);
          *(_OWORD *)v194 = v197;
          v194 -= 32;
          v195 -= 32;
          v196 -= 4;
        }
        while (v196);
        v190 -= 8 * (v193 & 0x3FFFFFFFFFFFFFFCLL);
        if (v193 != (v193 & 0x3FFFFFFFFFFFFFFCLL))
        {
          do
          {
LABEL_201:
            uint64_t v198 = *((void *)v192 - 1);
            v192 -= 8;
            *((void *)v190 - 1) = v198;
            v190 -= 8;
          }
          while (v192 != v180);
        }
      }
      v179 = &v188[8 * v187];
      if (v180)
      {
        operator delete(v180);
        unint64_t v174 = v41[20];
        v180 = v190;
      }
      else
      {
        v180 = v190;
        unint64_t v174 = v340;
      }
      unint64_t v182 = __xb;
LABEL_206:
      uint64_t v199 = *(void *)(v174 + ((8 * v181) | 0x50));
      if (!v199)
      {
LABEL_209:
        v200 = v189;
        goto LABEL_230;
      }
      if (v189 < v179)
      {
        *(void *)v189 = v199;
        v189 += 8;
        goto LABEL_209;
      }
      uint64_t v201 = (v189 - v180) >> 3;
      unint64_t v202 = v201 + 1;
      if ((unint64_t)(v201 + 1) >> 61) {
        goto LABEL_379;
      }
      unint64_t v341 = v174;
      if ((v179 - v180) >> 2 > v202) {
        unint64_t v202 = (v179 - v180) >> 2;
      }
      if ((unint64_t)(v179 - v180) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v203 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v203 = v202;
      }
      if (v203)
      {
        if (v203 >> 61) {
          goto LABEL_381;
        }
        v204 = operator new(8 * v203);
      }
      else
      {
        v204 = 0;
      }
      v205 = &v204[8 * v201];
      *(void *)v205 = v199;
      v200 = v205 + 8;
      if (v189 == v180)
      {
        int8x8_t v41 = (unint64_t *)v343;
        v179 = &v204[8 * v203];
        if (v180) {
          goto LABEL_226;
        }
      }
      else
      {
        unint64_t v206 = v189 - 8 - v180;
        if (v206 < 0x58 || (unint64_t)(v180 - v204) < 0x20)
        {
          v207 = v189;
          int8x8_t v41 = (unint64_t *)v343;
          goto LABEL_224;
        }
        uint64_t v325 = (v206 >> 3) + 1;
        v207 = &v189[-8 * (v325 & 0x3FFFFFFFFFFFFFFCLL)];
        v326 = &v204[8 * v201 - 16];
        v327 = v189 - 16;
        uint64_t v328 = v325 & 0x3FFFFFFFFFFFFFFCLL;
        int8x8_t v41 = (unint64_t *)v343;
        do
        {
          long long v329 = *(_OWORD *)v327;
          *(v326 - 1) = *((_OWORD *)v327 - 1);
          _OWORD *v326 = v329;
          v326 -= 2;
          v327 -= 32;
          v328 -= 4;
        }
        while (v328);
        v205 -= 8 * (v325 & 0x3FFFFFFFFFFFFFFCLL);
        if (v325 != (v325 & 0x3FFFFFFFFFFFFFFCLL))
        {
          do
          {
LABEL_224:
            uint64_t v208 = *((void *)v207 - 1);
            v207 -= 8;
            *((void *)v205 - 1) = v208;
            v205 -= 8;
          }
          while (v207 != v180);
        }
        v179 = &v204[8 * v203];
        if (v180)
        {
LABEL_226:
          operator delete(v180);
          unint64_t v174 = v41[20];
          v180 = v205;
          goto LABEL_229;
        }
      }
      v180 = v205;
      unint64_t v174 = v341;
LABEL_229:
      unint64_t v182 = __xb;
LABEL_230:
      uint64_t v209 = *(void *)(v174 + (v182 | 0x70));
      if (!v209)
      {
LABEL_233:
        v210 = v200;
        v98 = v180;
        unint64_t v49 = v376;
        goto LABEL_250;
      }
      if (v200 < v179)
      {
        *(void *)v200 = v209;
        v200 += 8;
        goto LABEL_233;
      }
      uint64_t v211 = (v200 - v180) >> 3;
      unint64_t v212 = v211 + 1;
      if ((unint64_t)(v211 + 1) >> 61) {
LABEL_379:
      }
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      if ((v179 - v180) >> 2 > v212) {
        unint64_t v212 = (v179 - v180) >> 2;
      }
      if ((unint64_t)(v179 - v180) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v212 = 0x1FFFFFFFFFFFFFFFLL;
      }
      if (v212)
      {
        if (v212 >> 61) {
          goto LABEL_381;
        }
        v213 = operator new(8 * v212);
      }
      else
      {
        v213 = 0;
      }
      v98 = &v213[8 * v211];
      *(void *)v98 = v209;
      v210 = v98 + 8;
      if (v200 == v180)
      {
        int8x8_t v41 = (unint64_t *)v343;
        unint64_t v49 = v376;
        if (v180) {
          goto LABEL_249;
        }
      }
      else
      {
        unint64_t v214 = v200 - 8 - v180;
        unint64_t v49 = v376;
        if (v214 < 0x58 || (unint64_t)(v180 - v213) < 0x20)
        {
          v215 = v200;
          int8x8_t v41 = (unint64_t *)v343;
          goto LABEL_247;
        }
        uint64_t v330 = (v214 >> 3) + 1;
        v215 = &v200[-8 * (v330 & 0x3FFFFFFFFFFFFFFCLL)];
        v331 = &v213[8 * v211 - 16];
        v332 = v200 - 16;
        uint64_t v333 = v330 & 0x3FFFFFFFFFFFFFFCLL;
        int8x8_t v41 = (unint64_t *)v343;
        do
        {
          long long v334 = *(_OWORD *)v332;
          *(v331 - 1) = *((_OWORD *)v332 - 1);
          _OWORD *v331 = v334;
          v331 -= 2;
          v332 -= 32;
          v333 -= 4;
        }
        while (v333);
        v98 -= 8 * (v330 & 0x3FFFFFFFFFFFFFFCLL);
        if (v330 != (v330 & 0x3FFFFFFFFFFFFFFCLL))
        {
          do
          {
LABEL_247:
            uint64_t v216 = *((void *)v215 - 1);
            v215 -= 8;
            *((void *)v98 - 1) = v216;
            v98 -= 8;
          }
          while (v215 != v180);
        }
        if (v180) {
LABEL_249:
        }
          operator delete(v180);
      }
LABEL_250:
      if (v210 == v98)
      {
        char v240 = 1;
        *(void *)&long long v48 = 0;
        v98 = v210;
        double v56 = 4.0;
        double v57 = -1.0;
        if (!v210) {
          goto LABEL_271;
        }
      }
      else
      {
        uint64_t v217 = 0;
        unint64_t v50 = 0;
        unint64_t v218 = (v210 - v98) >> 3;
        uint64_t v219 = *(void *)(v345 + 8);
        if (v218 <= 1) {
          uint64_t v220 = 1;
        }
        else {
          uint64_t v220 = v218;
        }
        float v221 = 0.0;
        float v222 = 0.0;
        float v223 = 0.0;
        float v224 = 0.0;
        float v225 = 0.0;
        float v226 = 0.0;
        do
        {
          unint64_t v227 = *(void *)&v98[8 * v217];
          unint64_t v228 = vcvtpd_u64_f64((double)v227 * v55);
          if (v228 == 3) {
            uint64_t v229 = 1;
          }
          else {
            uint64_t v229 = v228;
          }
          if (v228 == 1) {
            uint64_t v229 = 3;
          }
          if (v219) {
            unint64_t v228 = v229;
          }
          unint64_t v230 = v228 - 1;
          *(double *)&long long v231 = fmod((double)(v227 - 1), 4.0);
          unint64_t v232 = (unint64_t)*(double *)&v231;
          if (v230 > 2 || v232 >= 4) {
            goto LABEL_376;
          }
          v234 = (float *)&v377[168 * v230 + 42 * v232 + 3 * v49];
          float v221 = v221 + v234[6];
          float v222 = v222 + v234[7];
          float v223 = v223 + v234[8];
          float v224 = v224 + v234[9];
          float v225 = v225 + v234[10];
          float v226 = v226 + v234[11];
          v50 += *(void *)(v41[17] + 32 * v227 - 16);
          ++v217;
        }
        while (v220 != v217);
        unint64_t v235 = v41[22];
        uint64_t v236 = *(void *)(v235 + (v349 << 6) + 16);
        if (v236)
        {
          v237 = (char *)operator new(8uLL);
          *(void *)v237 = v236;
          v238 = v237 + 8;
          v239 = v237;
        }
        else
        {
          v238 = 0;
          v239 = 0;
        }
        unint64_t v275 = *(void *)(v235 + ((v349 << 6) | 0x30));
        float v342 = v223;
        if (v275)
        {
          uint64_t v276 = v238 - v239;
          uint64_t v277 = (v238 - v239) >> 3;
          unint64_t v278 = v277 + 1;
          if ((unint64_t)(v277 + 1) >> 61) {
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          }
          if (v276 >> 2 > v278) {
            unint64_t v278 = v276 >> 2;
          }
          _CF = (unint64_t)v276 >= 0x7FFFFFFFFFFFFFF8;
          unint64_t v279 = 0x1FFFFFFFFFFFFFFFLL;
          if (!_CF) {
            unint64_t v279 = v278;
          }
          if (v279)
          {
            if (v279 >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v280 = (char *)operator new(8 * v279);
          }
          else
          {
            v280 = 0;
          }
          v282 = (unint64_t *)&v280[8 * v277];
          unint64_t *v282 = v275;
          v281 = (char *)(v282 + 1);
          if (v238 == v239)
          {
            unint64_t v49 = v376;
          }
          else
          {
            unint64_t v283 = v238 - v239 - 8;
            unint64_t v49 = v376;
            if (v283 < 0x18)
            {
              v284 = v238;
              goto LABEL_332;
            }
            uint64_t v285 = (v283 >> 3) + 1;
            v284 = &v238[-8 * (v285 & 0x3FFFFFFFFFFFFFFCLL)];
            v286 = &v280[8 * v277 - 16];
            v287 = v238 - 16;
            uint64_t v288 = v285 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v231 = *(_OWORD *)v287;
              *((_OWORD *)v286 - 1) = *((_OWORD *)v287 - 1);
              *(_OWORD *)v286 = v231;
              v286 -= 32;
              v287 -= 32;
              v288 -= 4;
            }
            while (v288);
            v282 -= v285 & 0x3FFFFFFFFFFFFFFCLL;
            if (v285 != (v285 & 0x3FFFFFFFFFFFFFFCLL))
            {
              do
              {
LABEL_332:
                unint64_t v289 = *((void *)v284 - 1);
                v284 -= 8;
                *--v282 = v289;
              }
              while (v284 != v239);
            }
          }
          if (v239) {
            operator delete(v239);
          }
        }
        else
        {
          v281 = v238;
          v282 = (unint64_t *)v239;
          unint64_t v49 = v376;
        }
        float v336 = v224;
        float v338 = v225;
        float v350 = v226;
        if (v281 != (char *)v282)
        {
          unint64_t v372 = 0;
          unint64_t v290 = (v281 - (char *)v282) >> 3;
          *(void *)&long long v231 = 0;
          long long __xc = v231;
          uint64_t v291 = *(void *)(v345 + 8);
          if (v290 <= 1) {
            uint64_t v292 = 1;
          }
          else {
            uint64_t v292 = v290;
          }
          v293 = v282;
          float v294 = 0.0;
          float v295 = 0.0;
          float v296 = 0.0;
          float v297 = 0.0;
          float v298 = 0.0;
          float v299 = 0.0;
          while (1)
          {
            unint64_t v301 = *v293++;
            unint64_t v300 = v301;
            unint64_t v302 = vcvtpd_u64_f64((double)v301 * 0.25);
            if (v302 == 3) {
              uint64_t v303 = 1;
            }
            else {
              uint64_t v303 = v302;
            }
            if (v302 == 1) {
              uint64_t v303 = 3;
            }
            if (v291) {
              unint64_t v302 = v303;
            }
            unint64_t v304 = v302 - 1;
            *(double *)&long long v231 = fmod((double)(v300 - 1), 4.0);
            unint64_t v305 = (unint64_t)*(double *)&v231;
            if (v304 > 2 || v305 >= 4) {
              break;
            }
            v307 = &v377[168 * v304];
            unint64_t v49 = v376;
            v308 = (float *)&v307[42 * v305 + 3 * v376];
            float v294 = v294 + v308[6];
            float v295 = v295 + v308[7];
            float v296 = v296 + v308[8];
            float v297 = v297 + v308[9];
            float v298 = v298 + v308[10];
            float v299 = v299 + v308[11];
            v372 += *(void *)(v41[17] + 32 * v300 - 16);
            if (!--v292) {
              goto LABEL_354;
            }
          }
          char v240 = 0;
          unint64_t v49 = v376;
          goto LABEL_357;
        }
        unint64_t v372 = 0;
        float v294 = 0.0;
        float v295 = 0.0;
        float v296 = 0.0;
        float v297 = 0.0;
        float v298 = 0.0;
        float v299 = 0.0;
LABEL_354:
        *(float *)&long long v231 = 1.0 / (float)v372;
        float v309 = v294 * *(float *)&v231;
        float v310 = v295 * *(float *)&v231;
        float v311 = v296 * *(float *)&v231;
        float v312 = v297 * *(float *)&v231;
        float v313 = v298 * *(float *)&v231;
        *(float *)&long long v231 = v299 * *(float *)&v231;
        v314 = (float *)&__b[4 * v49];
        v314[84] = v221 - (float)(v309 * (float)v50);
        v314[98] = v222 - (float)(v310 * (float)v50);
        v314[112] = v342 - (float)(v311 * (float)v50);
        v314[126] = v336 - (float)(v312 * (float)v50);
        v314[140] = v338 - (float)(v313 * (float)v50);
        v314[154] = v350 - (float)(*(float *)&v231 * (float)v50);
        char v240 = 1;
        __b[v49 + 742] = 1;
        *(float *)&long long v231 = (float)((float)(*(float *)&v231 + v313) + (float)((float)(v312 + v311) + (float)(v310 + v309)))
                        * 0.16667;
        long long __xc = v231;
        if (v282) {
LABEL_357:
        }
          operator delete(v282);
        float v52 = 0.25;
        double v53 = 0.5;
        float v54 = -1.0;
        double v55 = 0.25;
        double v56 = 4.0;
        double v57 = -1.0;
        long long v48 = __xc;
        if (!v98)
        {
LABEL_271:
          if (v240) {
            goto LABEL_272;
          }
          return v370;
        }
      }
      long long __xg = v48;
      operator delete(v98);
      long long v48 = __xg;
      goto LABEL_271;
    }
LABEL_272:
    if (v363[v49] || __b[v49 + 742])
    {
      v241 = (float *)&__b[4 * v49];
      float v242 = v241[56];
      float v243 = v242 + v241[14];
      float v244 = v241[42];
      float v245 = (float)(v243 + (float)(v244 + *v241)) + 0.000005;
      float v246 = fmaxf(v245, 0.0);
      if (v245 <= 0.0) {
        float v247 = 0.0;
      }
      else {
        float v247 = v245 * v52;
      }
      float v248 = v241[70];
      float v249 = (float)((float)(v248 + v241[28]) + v243) + 0.000004;
      if (v249 > v246) {
        float v247 = v249 * v52;
      }
      else {
        float v249 = v246;
      }
      float v250 = v241[98];
      float v251 = v250 + v242;
      float v252 = v241[84];
      float v253 = (float)(v251 + (float)(v252 + v244)) + 0.000003;
      if (v253 <= v249) {
        float v254 = v249;
      }
      else {
        float v254 = v253;
      }
      if (v253 > v249) {
        float v247 = v253 * v52;
      }
      float v255 = v241[112];
      float v256 = (float)((float)(v255 + v248) + v251) + 0.000002;
      LODWORD(v257) = v256 > v254;
      if (v256 > v254) {
        float v247 = v256 * v52;
      }
      else {
        float v256 = v254;
      }
      if (v253 > v249) {
        uint64_t v257 = 1;
      }
      else {
        uint64_t v257 = v257;
      }
      float v258 = v241[140] + v250;
      float v259 = (float)(v258 + (float)(v241[126] + v252)) + 0.000001;
      BOOL v260 = v259 <= v256;
      if (v259 <= v256)
      {
        float v261 = v247;
      }
      else
      {
        float v256 = (float)(v258 + (float)(v241[126] + v252)) + 0.000001;
        float v261 = v259 * v52;
      }
      float v262 = (float)(v241[154] + v255) + v258;
      BOOL v263 = v260 && v262 <= v256;
      uint64_t v264 = 2;
      if (v263) {
        uint64_t v264 = v257;
      }
      if (v262 <= v256) {
        float v265 = v261;
      }
      else {
        float v265 = v262 * v52;
      }
      *(double *)&uint64_t v266 = v265;
      if (v264 == 2)
      {
        double v273 = *(double *)&v266
             / sqrt(*(double *)&v266 + ((double)v50 * (double)v50 / (double)v372 + (double)v50) * *(float *)&v48);
      }
      else
      {
        v267.i64[0] = v51;
        v267.i64[1] = v50;
        float64x2_t v268 = vcvtq_f64_u64(v267);
        v269.i64[0] = v374;
        v269.i64[1] = v372;
        float64x2_t v270 = vaddq_f64(vdivq_f64(vmulq_f64(v268, v268), vcvtq_f64_u64(v269)), v268);
        float64x2_t v271 = (float64x2_t)vdupq_lane_s64(v266, 0);
        double v272 = vaddvq_f64(vdivq_f64(v271, vsqrtq_f64(vmlaq_f64(v271, vcvtq_f64_f32((float32x2_t)__PAIR64__(v48, LODWORD(v367))), v270))))* v53;
        double v273 = *(double *)&v266
             / sqrt(*(double *)&v266 + ((double)v51 * (double)v51 / (double)v374 + (double)v51) * v367);
        if (v264) {
          double v273 = v272;
        }
      }
      float v274 = v273;
      *(float *)&__b[4 * v49 + 672] = v274;
    }
    BOOL v370 = v49++ < 0xD;
    if (v49 == 14) {
      return v370;
    }
  }
  char v128 = 1;
  float v367 = 0.0;
  v98 = v97;
  if (!v97) {
    goto LABEL_177;
  }
LABEL_125:
  operator delete(v98);
  if (v128) {
    goto LABEL_178;
  }
  return v370;
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  return self;
}

- (GmoEngine)initWithPulseShape:(const float *)a3 pulseShapeSize:(unint64_t)a4 spotSizeSigma:(float)a5 unitInfo:(const PeridotUnitInfo *)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)GmoEngine;
  uint64_t v6 = [(GmoEngine *)&v14 init];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v16 = "-[GmoEngine initWithPulseShape:pulseShapeSize:spotSizeSigma:unitInfo:]";
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: GMOE Init ...", buf, 0xCu);
  }
  if (v6)
  {
    *((void *)v6 + 13) = 25;
    *(void *)(v6 + 12) = 0x3FE6666640200000;
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"0", @"0.5", @"1.5", @"2.5", @"3.5", @"4.5", @"5.5", @"6.5", @"7.5", @"8.5", @"9.5", @"11", @"13", @"15", @"17", @"19", @"21",
           @"23",
           @"25",
           @"27",
           @"29",
           @"32.5",
           @"37.5",
           @"42.5",
           @"47.5",
           @"52.5",
           @"57.5",
           @"62.5",
           @"67.5",
           0);
    uint64_t v8 = (void *)*((void *)v6 + 14);
    *((void *)v6 + 14) = v7;

    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"10", @"1.2528", @"0.3622", @"0.1795", @"0.1291", @"0.1120", @"0.0952", @"0.0805", @"0.0668", @"0.0563", @"0.0480", @"0.0405", @"0.0341", @"0.0293", @"0.0253", @"0.0213", @"0.0193",
           @"0.0175",
           @"0.0165",
           @"0.0154",
           @"0.0142",
           @"0.0127",
           @"0.0115",
           @"0.0104",
           @"0.0096",
           @"0.0087",
           @"0.0084",
           @"0.0079",
           @"0.0074",
           0);
    unint64_t v10 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 15) = v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"0", @"3", @"21", @"52", @"89", @"131", @"180", @"256", @"363", @"509", @"711", @"996", @"1378", @"1877", @"2580", @"3375", @"4266",
            @"5035",
            @"5836",
            @"6722",
            @"8044",
            @"9794",
            @"12037",
            @"14470",
            @"17426",
            @"20003",
            @"22709",
            @"25351",
            @"28560",
            0);
    BOOL v12 = (void *)*((void *)v6 + 16);
    *((void *)v6 + 16) = v11;

    *((void *)v6 + 11) = 21;
    operator new[]();
  }
  return 0;
}

- (int)getAnchorsWithHysteresis:(id *)a3 anchorsWithHist:(PDAnchors *)a4
{
  uint64_t v6 = 0;
  LODWORD(v4) = -1.0;
  return [(GmoEngine *)self getAnchorsWithHysteresis:a3 currAnchors:v10 snrHysteresisPct:a4 anchorsWithHist:v9 violations:v8 anchorMoveIdx:v7 spotLocationsAtRefDist:v4 anchorsMoved:&v6];
}

- (int)getAnchorsWithHysteresis:(id *)a3 currAnchors:(const PDAnchors *)a4 snrHysteresisPct:(float)a5 anchorsWithHist:(PDAnchors *)a6 violations:(spViolations *)a7 anchorMoveIdx:(void *)a8 spotLocationsAtRefDist:(id *)a9 anchorsMoved:(unint64_t *)a10
{
  *a10 = 0;
  v18.i32[0] = 1161527296;
  peridot::compensateForParallax(self->_unitInfo->var1, (int32x2_t *)a3, 0, (float32x4_t *)a9, v18);
  peridot::anchorsForSpotLocations((uint64_t)a9, (BOOL *)a6);
  memcpy(__dst, a6, sizeof(__dst));
  peridot::checkSpViolations((peridot *)__dst, (PDAnchors *)a7, v19);
  if (a5 != -1.0)
  {
    if ([(GmoEngine *)self calculateSnrLoss:a4 gtSpotLocations:a3 radialTargetFlag:1 gtSnr:v56 snrLoss:v55])
    {
      return 1;
    }
    float v21 = 1.0 / (float)((float)(100.0 / a5) + 1.0);
    uint64_t v22 = (BOOL *)a8 + 6;
    float32x4_t v23 = &a4->banks[0].anchors[7];
    float64x2_t v24 = &a6->banks[0].anchors[7];
    uint64_t v25 = 52;
    do
    {
      float v26 = *(float *)&v55[v25 - 52];
      *(v22 - 6) = v26 > v21;
      if (v26 <= v21)
      {
        float64x2_t v27 = v24 - 7;
        __int16 v28 = *(_WORD *)&v23[-7].x;
        v27->useNorthHS2 = v23[-7].useNorthHS2;
        *(_WORD *)&v27->x = v28;
      }
      else
      {
        ++*a10;
      }
      float v29 = *(float *)&v55[v25 - 48];
      *(v22 - 5) = v29 > v21;
      if (v29 <= v21)
      {
        __int16 v30 = *(_WORD *)&v23[-6].x;
        v24[-6].useNorthHS2 = v23[-6].useNorthHS2;
        *(_WORD *)&v24[-6].x = v30;
      }
      else
      {
        ++*a10;
      }
      float v31 = *(float *)&v55[v25 - 44];
      *(v22 - 4) = v31 > v21;
      if (v31 <= v21)
      {
        __int16 v32 = *(_WORD *)&v23[-5].x;
        v24[-5].useNorthHS2 = v23[-5].useNorthHS2;
        *(_WORD *)&v24[-5].x = v32;
      }
      else
      {
        ++*a10;
      }
      float v33 = *(float *)&v55[v25 - 40];
      *(v22 - 3) = v33 > v21;
      if (v33 <= v21)
      {
        __int16 v34 = *(_WORD *)&v23[-4].x;
        v24[-4].useNorthHS2 = v23[-4].useNorthHS2;
        *(_WORD *)&v24[-4].x = v34;
      }
      else
      {
        ++*a10;
      }
      float v35 = *(float *)&v55[v25 - 36];
      *(v22 - 2) = v35 > v21;
      if (v35 <= v21)
      {
        __int16 v36 = *(_WORD *)&v23[-3].x;
        v24[-3].useNorthHS2 = v23[-3].useNorthHS2;
        *(_WORD *)&v24[-3].x = v36;
      }
      else
      {
        ++*a10;
      }
      float v37 = *(float *)&v55[v25 - 32];
      *(v22 - 1) = v37 > v21;
      if (v37 <= v21)
      {
        __int16 v38 = *(_WORD *)&v23[-2].x;
        v24[-2].useNorthHS2 = v23[-2].useNorthHS2;
        *(_WORD *)&v24[-2].x = v38;
      }
      else
      {
        ++*a10;
      }
      float v39 = *(float *)&v55[v25 - 28];
      *uint64_t v22 = v39 > v21;
      if (v39 <= v21)
      {
        __int16 v40 = *(_WORD *)&v23[-1].x;
        v24[-1].useNorthHS2 = v23[-1].useNorthHS2;
        *(_WORD *)&v24[-1].x = v40;
      }
      else
      {
        ++*a10;
      }
      float v41 = *(float *)&v55[v25 - 24];
      v22[1] = v41 > v21;
      if (v41 <= v21)
      {
        __int16 v42 = *(_WORD *)&v23->x;
        v24->useNorthHS2 = v23->useNorthHS2;
        *(_WORD *)&v24->x = v42;
      }
      else
      {
        ++*a10;
      }
      float v43 = *(float *)&v55[v25 - 20];
      v22[2] = v43 > v21;
      if (v43 <= v21)
      {
        __int16 v44 = *(_WORD *)&v23[1].x;
        v24[1].useNorthHS2 = v23[1].useNorthHS2;
        *(_WORD *)&v24[1].x = v44;
      }
      else
      {
        ++*a10;
      }
      float v45 = *(float *)&v55[v25 - 16];
      v22[3] = v45 > v21;
      if (v45 <= v21)
      {
        __int16 v46 = *(_WORD *)&v23[2].x;
        v24[2].useNorthHS2 = v23[2].useNorthHS2;
        *(_WORD *)&v24[2].x = v46;
      }
      else
      {
        ++*a10;
      }
      float v47 = *(float *)&v55[v25 - 12];
      v22[4] = v47 > v21;
      if (v47 <= v21)
      {
        __int16 v48 = *(_WORD *)&v23[3].x;
        v24[3].useNorthHS2 = v23[3].useNorthHS2;
        *(_WORD *)&v24[3].x = v48;
      }
      else
      {
        ++*a10;
      }
      float v49 = *(float *)&v55[v25 - 8];
      v22[5] = v49 > v21;
      if (v49 <= v21)
      {
        __int16 v50 = *(_WORD *)&v23[4].x;
        v24[4].useNorthHS2 = v23[4].useNorthHS2;
        *(_WORD *)&v24[4].x = v50;
      }
      else
      {
        ++*a10;
      }
      float v51 = *(float *)&v55[v25 - 4];
      v22[6] = v51 > v21;
      if (v51 <= v21)
      {
        __int16 v52 = *(_WORD *)&v23[5].x;
        v24[5].useNorthHS2 = v23[5].useNorthHS2;
        *(_WORD *)&v24[5].x = v52;
      }
      else
      {
        ++*a10;
      }
      float v53 = *(float *)&v55[v25];
      v22[7] = v53 > v21;
      if (v53 <= v21)
      {
        __int16 v54 = *(_WORD *)&v23[6].x;
        v24[6].useNorthHS2 = v23[6].useNorthHS2;
        *(_WORD *)&v24[6].x = v54;
      }
      else
      {
        ++*a10;
      }
      v25 += 56;
      v22 += 14;
      v23 += 14;
      v24 += 14;
    }
    while (v25 != 500);
  }
  return 0;
}

- (int)configureEngineWithSpecConfig:(const PRIConfigSpec *)a3
{
  uint64_t v3 = ((uint64_t (*)(GmoEngine *, SEL, const PRIConfigSpec *))MEMORY[0x270FA5388])(self, a2, a3);
  v5 = v4;
  uint64_t v6 = v3;
  uint64_t v276 = *MEMORY[0x263EF8340];
  bzero(*(void **)(v3 + 144), *(void *)(v3 + 152));
  bzero(*(void **)(v6 + 136), 8 * *(void *)(v6 + 152));
  bzero(*(void **)(v6 + 160), 8 * *(void *)(v6 + 168));
  bzero(*(void **)(v6 + 176), 8 * *(void *)(v6 + 184));
  long long v7 = *v5;
  long long v8 = v5[1];
  long long v9 = v5[2];
  *(_OWORD *)(v6 + 264) = v5[3];
  *(_OWORD *)(v6 + 248) = v9;
  *(_OWORD *)(v6 + 232) = v8;
  *(_OWORD *)(v6 + 216) = v7;
  long long v10 = v5[4];
  long long v11 = v5[5];
  long long v12 = v5[7];
  *(_OWORD *)(v6 + 312) = v5[6];
  *(_OWORD *)(v6 + 328) = v12;
  *(_OWORD *)(v6 + 280) = v10;
  *(_OWORD *)(v6 + 296) = v11;
  uint64_t v244 = v6 + 216;
  bzero(v275, 0x1140uLL);
  uint64_t v13 = 0;
  float64x2_t v268 = (void *)v6;
  objc_msgSend((id)v6, "specSwitch:from:toBuffer:", 0, v6 + 216, &v269, 14, 15, 12, 13);
  while (1)
  {
    uint64_t v245 = v13;
    float v16 = (unsigned __int8 *)operator new(0x10uLL);
    *(_OWORD *)float v16 = v269;
    int v264 = *v16;
    int v17 = v16[1];
    int v18 = v16[2];
    int v19 = v16[3];
    int v20 = v16[4];
    int v21 = v16[5];
    int v22 = v16[6];
    int v23 = v16[7];
    int v24 = v16[8];
    int v246 = v16[9];
    int v248 = v16[10];
    int v250 = v16[11];
    int v252 = v16[12];
    int __b = v16[13];
    int v257 = v16[14];
    int v262 = v16[15];
    uint64_t v25 = (int64x2_t *)operator new(0x80uLL);
    uint64_t v26 = 0;
    uint64_t v27 = v17 == 0;
    BOOL v28 = v18 == 0;
    BOOL v29 = v19 == 0;
    BOOL v30 = v20 == 0;
    *uint64_t v25 = (int64x2_t)xmmword_2591200C0;
    v25[1] = (int64x2_t)xmmword_2591200D0;
    v25[2] = (int64x2_t)xmmword_2591200E0;
    v25[3] = (int64x2_t)xmmword_2591200F0;
    v25[4] = (int64x2_t)xmmword_259120100;
    v25[5] = (int64x2_t)xmmword_259120110;
    v25[6] = v243;
    v25[7] = v242;
    uint64_t v31 = 1;
    __int16 v32 = (uint64_t *)v25;
    float v33 = v268;
    do
    {
      float v35 = &v25->i64[v31];
      uint64_t v36 = *v35;
      uint64_t v37 = *v32;
      if (v16[*v35] < v16[v37])
      {
        uint64_t v38 = v26;
        do
        {
          *(uint64_t *)((char *)&v25->i64[1] + v38) = v37;
          if (!v38)
          {
            __int16 v34 = (uint64_t *)v25;
            goto LABEL_7;
          }
          uint64_t v37 = *(uint64_t *)((char *)&v25->i64[-1] + v38);
          v38 -= 8;
        }
        while (v16[v36] < v16[v37]);
        __int16 v34 = (uint64_t *)((char *)&v25->i64[1] + v38);
LABEL_7:
        *__int16 v34 = v36;
      }
      ++v31;
      v26 += 8;
      __int16 v32 = v35;
    }
    while (v31 != 16);
    int64x2_t v39 = vdupq_n_s64(1uLL);
    if (!v264) {
      ++v27;
    }
    unint64_t v40 = v27
        + v28
        + v29
        + v30
        + (v21 == 0)
        + (unint64_t)(v22 == 0)
        + (v23 == 0)
        + (v24 == 0)
        + (v246 == 0)
        + (unint64_t)(v248 == 0)
        + (v250 == 0)
        + (v252 == 0)
        + (__b == 0)
        + (v257 == 0)
        + (unint64_t)(v262 == 0);
    int64x2_t v41 = vaddq_s64(v25[1], v39);
    *uint64_t v25 = vaddq_s64(*v25, v39);
    v25[1] = v41;
    int64x2_t v42 = vaddq_s64(v25[3], v39);
    v25[2] = vaddq_s64(v25[2], v39);
    v25[3] = v42;
    int64x2_t v43 = vaddq_s64(v25[5], v39);
    v25[4] = vaddq_s64(v25[4], v39);
    v25[5] = v43;
    int64x2_t v44 = vaddq_s64(v25[6], v39);
    int64x2_t v45 = vaddq_s64(v25[7], v39);
    v25[6] = v44;
    v25[7] = v45;
    if (v40 == 16)
    {
      __int16 v46 = 0;
      long long v265 = 0u;
    }
    else
    {
      uint64_t v47 = 8 * v40;
      size_t v48 = 128 - 8 * v40;
      float v49 = (char *)operator new(v48);
      __int16 v46 = &v49[8 * (v48 >> 3)];
      memcpy(v49, &v25->i8[v47], 128 - v47);
      *(void *)&long long v50 = v49;
      *((void *)&v50 + 1) = v46;
      long long v265 = v50;
    }
    __int16 v52 = (char *)v268[25];
    unint64_t v51 = v268[26];
    if ((unint64_t)v52 < v51)
    {
      *(_OWORD *)__int16 v52 = v265;
      *((void *)v52 + 2) = v46;
      objc_super v14 = v52 + 24;
      uint64_t v15 = v245;
    }
    else
    {
      float v53 = (unsigned char *)v268[24];
      unint64_t v54 = 0xAAAAAAAAAAAAAAABLL * ((v52 - v53) >> 3) + 1;
      if (v54 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - (void)v53) >> 3);
      if (2 * v55 > v54) {
        unint64_t v54 = 2 * v55;
      }
      if (v55 >= 0x555555555555555) {
        unint64_t v56 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v56 = v54;
      }
      if (v56 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      double v57 = (char *)operator new(24 * v56);
      double v58 = &v57[8 * ((v52 - v53) >> 3)];
      unint64_t v59 = &v57[24 * v56];
      *(_OWORD *)double v58 = v265;
      *((void *)v58 + 2) = v46;
      objc_super v14 = v58 + 24;
      if (v52 == v53)
      {
        v268[24] = v58;
        v268[25] = v14;
        v268[26] = v59;
        uint64_t v15 = v245;
      }
      else
      {
        uint64_t v15 = v245;
        do
        {
          long long v60 = *(_OWORD *)(v52 - 24);
          v52 -= 24;
          *(_OWORD *)(v58 - 24) = v60;
          v58 -= 24;
          *((void *)v58 + 2) = *((void *)v52 + 2);
          *(void *)__int16 v52 = 0;
          *((void *)v52 + 1) = 0;
          *((void *)v52 + 2) = 0;
        }
        while (v52 != v53);
        __int16 v52 = (char *)v268[24];
        uint64_t v61 = (char *)v268[25];
        v268[24] = v58;
        v268[25] = v14;
        v268[26] = v59;
        if (v61 != v52)
        {
          unint64_t v62 = v61;
          do
          {
            v64 = (void *)*((void *)v62 - 3);
            v62 -= 24;
            unint64_t v63 = v64;
            if (v64)
            {
              *((void *)v61 - 2) = v63;
              operator delete(v63);
            }
            uint64_t v61 = v62;
          }
          while (v62 != v52);
        }
      }
      if (v52) {
        operator delete(v52);
      }
    }
    v268[25] = v14;
    operator delete(v25);
    operator delete(v16);
    uint64_t v13 = v15 + 1;
    if (v13 == 4) {
      break;
    }
    objc_msgSend(v268, "specSwitch:from:toBuffer:", v13, v244, &v269, *(_OWORD *)&v242, *(_OWORD *)&v243);
  }
  uint64_t v65 = 0;
  v66 = v275;
  do
  {
    unint64_t v69 = (unsigned __int8 *)(v244 + 8 * v65);
    uint64_t v70 = v69[1];
    if (v70 > 0x5C) {
      return 1;
    }
    uint64_t v71 = *v69;
    unint64_t v72 = v70 - v71;
    if (v71 < v70)
    {
      if (v72 <= 1)
      {
        uint64_t v73 = v71;
        goto LABEL_48;
      }
      unint64_t v74 = v72 & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v75 = 12 * v71;
      unint64_t v76 = v72 & 0xFFFFFFFFFFFFFFFELL;
      do
      {
        unint64_t v77 = &v66[v75];
        *unint64_t v77 = 1;
        v77[48] = 1;
        v75 += 24;
        v76 -= 2;
      }
      while (v76);
      if (v72 != v74)
      {
        uint64_t v73 = v74 + v71;
LABEL_48:
        uint64_t v78 = v70 - v73;
        uint64_t v79 = 12 * v73;
        do
        {
          LOBYTE(v66[v79]) = 1;
          v79 += 12;
          --v78;
        }
        while (v78);
      }
    }
    uint64_t v80 = 4 * v65;
    uint64_t v81 = v268[18];
    *(unsigned char *)(v81 + 4 * v65) = v71 < 4;
    uint64_t v82 = v268[17];
    *(void *)(v82 + 32 * v65) = v72;
    uint64_t v83 = v244 + 8 * v65;
    uint64_t v84 = *(unsigned __int8 *)(v83 + 3);
    if (v84 >= 0x5D) {
      return 1;
    }
    uint64_t v85 = *(unsigned __int8 *)(v83 + 2);
    unint64_t v86 = v84 - v85;
    if (v85 < v84)
    {
      if (v86 > 1)
      {
        unint64_t v88 = v86 & 0xFFFFFFFFFFFFFFFELL;
        uint64_t v89 = 12 * v85;
        unint64_t v90 = v86 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          v91 = &v66[v89];
          *((unsigned char *)v91 + 1) = 1;
          *((unsigned char *)v91 + 49) = 1;
          v89 += 24;
          v90 -= 2;
        }
        while (v90);
        if (v86 == v88) {
          goto LABEL_60;
        }
        uint64_t v87 = v88 + v85;
      }
      else
      {
        uint64_t v87 = v85;
      }
      uint64_t v92 = v84 - v87;
      uint64_t v93 = (48 * v87) | 1;
      do
      {
        *((unsigned char *)v66 + v93) = 1;
        v93 += 48;
        --v92;
      }
      while (v92);
    }
LABEL_60:
    *(unsigned char *)(v81 + (v80 | 1)) = v85 < 4;
    *(void *)(v82 + 8 * (v80 | 1)) = v86;
    uint64_t v94 = v244 + 8 * v65;
    unint64_t v95 = *(unsigned __int8 *)(v94 + 5);
    int result = 1;
    if (v95 >= 0x18) {
      return result;
    }
    uint64_t v97 = *(unsigned __int8 *)(v94 + 4);
    unint64_t v98 = 4 * v95;
    unint64_t v99 = v98 - 4 * v97;
    if (v98 > 4 * v97)
    {
      uint64_t v100 = 48 * v97;
      do
      {
        v101 = &v66[v100];
        *((unsigned char *)v101 + 2) = 1;
        *((unsigned char *)v101 + 50) = 1;
        v100 += 24;
        v99 -= 2;
      }
      while (v99);
    }
    unint64_t v102 = (4 * v97) | 1;
    *(unsigned char *)(v81 + (v80 | 2)) = v102 < 0x14;
    *(void *)(v82 + 8 * (v80 | 2)) = v98 - v102 + 1;
    uint64_t v103 = v244 + 8 * v65;
    unint64_t v104 = *(unsigned __int8 *)(v103 + 7);
    int result = 1;
    if (v104 > 0x17) {
      return result;
    }
    uint64_t v105 = *(unsigned __int8 *)(v103 + 6);
    unint64_t v106 = 4 * v104;
    unint64_t v107 = v106 - 4 * v105;
    if (v106 > 4 * v105)
    {
      uint64_t v108 = 48 * v105;
      do
      {
        uint64_t v109 = &v66[v108];
        *((unsigned char *)v109 + 3) = 1;
        *((unsigned char *)v109 + 51) = 1;
        v108 += 24;
        v107 -= 2;
      }
      while (v107);
    }
    unint64_t v67 = (4 * v105) | 1;
    uint64_t v68 = v80 | 3;
    *(unsigned char *)(v81 + v68) = v67 < 0x14;
    *(void *)(v82 + 8 * v68) = v106 - v67 + 1;
    ++v65;
    ++v66;
  }
  while (v65 != 12);
  float v110 = 0;
  float v111 = 0;
  float v253 = 0;
  float v112 = 0;
  unint64_t v113 = 0;
  unint64_t v114 = 0;
  unint64_t v115 = 0;
  while (2)
  {
    unint64_t v116 = 0;
    __ba = (char *)&v270 + v115;
    unint64_t v258 = v113;
    unint64_t v263 = v115;
    uint64_t v266 = v112;
    uint64_t v247 = 16 * v115;
    unint64_t v117 = v275;
    unint64_t v118 = v114;
    do
    {
      unint64_t v119 = v116 + v247;
      uint64_t v120 = v116 + v247 + 4;
      uint64_t v249 = v116 + v247 + 12;
      uint64_t v251 = v116 + v247 + 8;
      if (v116 >= 2)
      {
        uint64_t v129 = 0;
        uint64_t v130 = (unsigned __int8 *)v117;
        do
        {
          if (!*((unsigned char *)&v275[v129] + v116))
          {
            long long v273 = 0u;
            memset(v274, 0, sizeof(v274));
            long long v271 = 0u;
            long long v272 = 0u;
            long long v270 = 0u;
            unint64_t v131 = v33[8] + v263;
            if (v131 >= 0x5C) {
              unint64_t v131 = 92;
            }
            if (v131 > v263)
            {
              memset(__ba, 1, v131 - v263);
              unint64_t v114 = v118;
              unint64_t v113 = v258;
              float v112 = v266;
            }
            uint64_t v132 = 0;
            unint64_t v133 = v130;
            while (1)
            {
              int v134 = *v133;
              v133 += 48;
              if (v134)
              {
                if (*((unsigned char *)&v270 + v132)) {
                  break;
                }
              }
              if (++v132 == 92) {
                goto LABEL_95;
              }
            }
            uint64_t v135 = v33[20];
            uint64_t v136 = v116 + v247;
            if (!*(void *)(v135 + 8 * v119)
              || (uint64_t v136 = v116 + v247 + 4, !*(void *)(v135 + 8 * v120))
              || (uint64_t v136 = v116 + v247 + 8, !*(void *)(v135 + 8 * v251))
              || (uint64_t v136 = v116 + v247 + 12, !*(void *)(v135 + 8 * v249)))
            {
              *(void *)(v135 + 8 * v136) = v129 + 1;
            }
          }
LABEL_95:
          ++v129;
          v130 += 4;
        }
        while (v129 != 12);
      }
      else
      {
        uint64_t v121 = 0;
        v122 = (unsigned __int8 *)v117;
        do
        {
          if (!*((unsigned char *)&v275[v121] + v116))
          {
            long long v273 = 0u;
            memset(v274, 0, sizeof(v274));
            long long v271 = 0u;
            long long v272 = 0u;
            long long v270 = 0u;
            unint64_t v123 = v33[9] + v263;
            if (v123 >= 0x5C) {
              unint64_t v123 = 92;
            }
            if (v123 > v263)
            {
              memset(__ba, 1, v123 - v263);
              unint64_t v114 = v118;
              unint64_t v113 = v258;
              float v112 = v266;
            }
            uint64_t v124 = 0;
            v125 = v122;
            while (1)
            {
              int v126 = *v125;
              v125 += 48;
              if (v126)
              {
                if (*((unsigned char *)&v270 + v124)) {
                  break;
                }
              }
              if (++v124 == 92) {
                goto LABEL_78;
              }
            }
            uint64_t v127 = v33[20];
            uint64_t v128 = v116 + v247;
            if (!*(void *)(v127 + 8 * v119)
              || (uint64_t v128 = v116 + v247 + 4, !*(void *)(v127 + 8 * v120))
              || (uint64_t v128 = v116 + v247 + 8, !*(void *)(v127 + 8 * v251))
              || (uint64_t v128 = v116 + v247 + 12, !*(void *)(v127 + 8 * v249)))
            {
              *(void *)(v127 + 8 * v128) = v121 + 1;
            }
          }
LABEL_78:
          ++v121;
          v122 += 4;
        }
        while (v121 != 12);
      }
      ++v116;
      unint64_t v117 = (_DWORD *)((char *)v117 + 1);
    }
    while (v116 != 4);
    uint64_t v137 = 0;
    while (2)
    {
      uint64_t v138 = v137 + v247;
      uint64_t v139 = v33[20];
      uint64_t v140 = *(void *)(v139 + 8 * (v137 + v247));
      uint64_t v267 = v137;
      __bb = (void *)(v137 + v247);
      if (!v140)
      {
        unint64_t v144 = v111;
        goto LABEL_150;
      }
      uint64_t v141 = v33[24];
      uint64_t v142 = v141 + 24 * v137;
      long long v143 = *(void **)v142;
      unint64_t v144 = v111;
      if (*(void *)v142 == *(void *)(v142 + 8)) {
        goto LABEL_148;
      }
      unint64_t v145 = (char *)v253;
      uint64_t v259 = *(void *)(v139 + 8 * (v137 + v247));
      while (2)
      {
        if (*v143 == v140)
        {
          uint64_t v146 = ((uint64_t)v143 - *(void *)(v141 + 24 * v137)) >> 3;
          if ((unint64_t)v144 < v114)
          {
            *v144++ = v146;
          }
          else
          {
            uint64_t v147 = v144 - v110;
            unint64_t v148 = v147 + 1;
            if ((unint64_t)(v147 + 1) >> 61) {
LABEL_285:
            }
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v114 - (void)v110) >> 2 > v148) {
              unint64_t v148 = (uint64_t)(v114 - (void)v110) >> 2;
            }
            if (v114 - (unint64_t)v110 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v149 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v149 = v148;
            }
            if (v149)
            {
              if (v149 >> 61) {
LABEL_286:
              }
                std::__throw_bad_array_new_length[abi:ne180100]();
              float v150 = operator new(8 * v149);
            }
            else
            {
              float v150 = 0;
            }
            float v111 = (uint64_t *)&v150[8 * v147];
            *float v111 = v146;
            float v151 = v111 + 1;
            if (v144 != v110)
            {
              unint64_t v152 = (char *)(v144 - 1) - (char *)v110;
              if (v152 < 0x168)
              {
                float v153 = v144;
                goto LABEL_132;
              }
              if (&v150[(char *)v144 - (char *)v110 - 8 - (v152 & 0xFFFFFFFFFFFFFFF8)] > &v150[(char *)v144
                                                                                                - (char *)v110
                                                                                                - 8])
              {
                float v153 = v144;
                goto LABEL_132;
              }
              if ((uint64_t *)((char *)v144 - (v152 & 0xFFFFFFFFFFFFFFF8) - 8) > v144 - 1)
              {
                float v153 = v144;
                goto LABEL_132;
              }
              if ((unint64_t)((char *)v110 - v150) < 0x20)
              {
                float v153 = v144;
                goto LABEL_132;
              }
              uint64_t v156 = (v152 >> 3) + 1;
              float v153 = &v144[-(v156 & 0x3FFFFFFFFFFFFFFCLL)];
              unint64_t v157 = &v150[8 * v147 - 16];
              uint64_t v158 = v144 - 2;
              uint64_t v159 = v156 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v160 = *(_OWORD *)v158;
                *(v157 - 1) = *((_OWORD *)v158 - 1);
                *unint64_t v157 = v160;
                v157 -= 2;
                v158 -= 4;
                v159 -= 4;
              }
              while (v159);
              v111 -= v156 & 0x3FFFFFFFFFFFFFFCLL;
              if (v156 != (v156 & 0x3FFFFFFFFFFFFFFCLL))
              {
                do
                {
LABEL_132:
                  uint64_t v154 = *--v153;
                  *--float v111 = v154;
                }
                while (v153 != v110);
              }
            }
            unint64_t v145 = &v150[8 * v149];
            if (v110)
            {
              unint64_t v155 = &v150[8 * v149];
              operator delete(v110);
              unint64_t v145 = v155;
              float v110 = v111;
              float v33 = v268;
              uint64_t v141 = v268[24];
              float v112 = (uint64_t *)v155;
              unint64_t v113 = (unint64_t)v155;
              unint64_t v114 = (unint64_t)v155;
              unint64_t v144 = v151;
            }
            else
            {
              float v110 = v111;
              float v112 = (uint64_t *)&v150[8 * v149];
              unint64_t v113 = (unint64_t)v112;
              unint64_t v114 = (unint64_t)v145;
              unint64_t v144 = v151;
              float v33 = v268;
            }
            uint64_t v137 = v267;
            uint64_t v140 = v259;
          }
        }
        if (++v143 != *(void **)(v141 + 24 * v137 + 8)) {
          continue;
        }
        break;
      }
      float v253 = (uint64_t *)v145;
      uint64_t v139 = v33[20];
LABEL_148:
      uint64_t v138 = (uint64_t)__bb;
LABEL_150:
      uint64_t v161 = *(void *)(v139 + 8 * v138 + 32);
      if (!v161) {
        goto LABEL_187;
      }
      uint64_t v162 = v33[24];
      uint64_t v163 = v162 + 24 * v137;
      float v164 = *(void **)v163;
      if (*(void *)v163 == *(void *)(v163 + 8)) {
        goto LABEL_186;
      }
      float v165 = (char *)v253;
      uint64_t v260 = *(void *)(v139 + 8 * v138 + 32);
      while (2)
      {
        if (*v164 == v161)
        {
          uint64_t v166 = ((uint64_t)v164 - *(void *)(v162 + 24 * v137)) >> 3;
          if ((unint64_t)v144 < v113)
          {
            *v144++ = v166;
            unint64_t v114 = v113;
          }
          else
          {
            uint64_t v167 = v144 - v110;
            unint64_t v168 = v167 + 1;
            if ((unint64_t)(v167 + 1) >> 61) {
              goto LABEL_285;
            }
            if ((uint64_t)(v113 - (void)v110) >> 2 > v168) {
              unint64_t v168 = (uint64_t)(v113 - (void)v110) >> 2;
            }
            if (v113 - (unint64_t)v110 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v169 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v169 = v168;
            }
            if (v169)
            {
              if (v169 >> 61) {
                goto LABEL_286;
              }
              float v170 = operator new(8 * v169);
            }
            else
            {
              float v170 = 0;
            }
            float v111 = (uint64_t *)&v170[8 * v167];
            *float v111 = v166;
            v171 = v111 + 1;
            if (v144 != v110)
            {
              unint64_t v172 = (char *)(v144 - 1) - (char *)v110;
              if (v172 < 0x168)
              {
                unint64_t v173 = v144;
                goto LABEL_170;
              }
              if (&v170[(char *)v144 - (char *)v110 - 8 - (v172 & 0xFFFFFFFFFFFFFFF8)] > &v170[(char *)v144
                                                                                                - (char *)v110
                                                                                                - 8])
              {
                unint64_t v173 = v144;
                goto LABEL_170;
              }
              if ((uint64_t *)((char *)v144 - (v172 & 0xFFFFFFFFFFFFFFF8) - 8) > v144 - 1)
              {
                unint64_t v173 = v144;
                goto LABEL_170;
              }
              if ((unint64_t)((char *)v110 - v170) < 0x20)
              {
                unint64_t v173 = v144;
                goto LABEL_170;
              }
              uint64_t v176 = (v172 >> 3) + 1;
              unint64_t v173 = &v144[-(v176 & 0x3FFFFFFFFFFFFFFCLL)];
              unint64_t v177 = &v170[8 * v167 - 16];
              v178 = v144 - 2;
              uint64_t v179 = v176 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v180 = *(_OWORD *)v178;
                *(v177 - 1) = *((_OWORD *)v178 - 1);
                *unint64_t v177 = v180;
                v177 -= 2;
                v178 -= 4;
                v179 -= 4;
              }
              while (v179);
              v111 -= v176 & 0x3FFFFFFFFFFFFFFCLL;
              if (v176 != (v176 & 0x3FFFFFFFFFFFFFFCLL))
              {
                do
                {
LABEL_170:
                  uint64_t v174 = *--v173;
                  *--float v111 = v174;
                }
                while (v173 != v110);
              }
            }
            float v165 = &v170[8 * v169];
            if (v110)
            {
              uint64_t v175 = &v170[8 * v169];
              operator delete(v110);
              float v165 = v175;
              float v110 = v111;
              float v33 = v268;
              uint64_t v162 = v268[24];
              float v112 = (uint64_t *)v175;
              unint64_t v113 = (unint64_t)v175;
              unint64_t v144 = v171;
              unint64_t v114 = (unint64_t)v175;
            }
            else
            {
              float v110 = v111;
              float v112 = (uint64_t *)&v170[8 * v169];
              unint64_t v113 = (unint64_t)v112;
              unint64_t v144 = v171;
              unint64_t v114 = (unint64_t)v165;
              float v33 = v268;
            }
            uint64_t v137 = v267;
            uint64_t v161 = v260;
          }
        }
        if (++v164 != *(void **)(v162 + 24 * v137 + 8)) {
          continue;
        }
        break;
      }
      float v253 = (uint64_t *)v165;
      uint64_t v139 = v33[20];
LABEL_186:
      uint64_t v138 = (uint64_t)__bb;
LABEL_187:
      uint64_t v181 = *(void *)(v139 + 8 * v138 + 64);
      if (v181)
      {
        uint64_t v182 = v33[24];
        uint64_t v183 = v182 + 24 * v137;
        uint64_t v184 = *(void **)v183;
        if (*(void *)v183 != *(void *)(v183 + 8))
        {
          uint64_t v185 = v253;
          uint64_t v261 = *(void *)(v139 + 8 * v138 + 64);
          while (1)
          {
            if (*v184 == v181)
            {
              uint64_t v186 = ((uint64_t)v184 - *(void *)(v182 + 24 * v137)) >> 3;
              if (v144 >= v112)
              {
                uint64_t v187 = v144 - v110;
                unint64_t v188 = v187 + 1;
                if ((unint64_t)(v187 + 1) >> 61) {
                  goto LABEL_285;
                }
                if (((char *)v112 - (char *)v110) >> 2 > v188) {
                  unint64_t v188 = ((char *)v112 - (char *)v110) >> 2;
                }
                if ((unint64_t)((char *)v112 - (char *)v110) >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v189 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v189 = v188;
                }
                if (v189)
                {
                  if (v189 >> 61) {
                    goto LABEL_286;
                  }
                  v190 = operator new(8 * v189);
                }
                else
                {
                  v190 = 0;
                }
                float v111 = (uint64_t *)&v190[8 * v187];
                *float v111 = v186;
                unint64_t v191 = v111 + 1;
                if (v144 != v110)
                {
                  unint64_t v192 = (char *)(v144 - 1) - (char *)v110;
                  if (v192 < 0x168)
                  {
                    uint64_t v193 = v144;
                    goto LABEL_207;
                  }
                  if (&v190[(char *)v144 - (char *)v110 - 8 - (v192 & 0xFFFFFFFFFFFFFFF8)] > &v190[(char *)v144 - (char *)v110 - 8])
                  {
                    uint64_t v193 = v144;
                    goto LABEL_207;
                  }
                  if ((uint64_t *)((char *)v144 - (v192 & 0xFFFFFFFFFFFFFFF8) - 8) > v144 - 1)
                  {
                    uint64_t v193 = v144;
                    goto LABEL_207;
                  }
                  if ((unint64_t)((char *)v110 - v190) < 0x20)
                  {
                    uint64_t v193 = v144;
                    goto LABEL_207;
                  }
                  uint64_t v196 = (v192 >> 3) + 1;
                  uint64_t v193 = &v144[-(v196 & 0x3FFFFFFFFFFFFFFCLL)];
                  long long v197 = &v190[8 * v187 - 16];
                  uint64_t v198 = v144 - 2;
                  uint64_t v199 = v196 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    long long v200 = *(_OWORD *)v198;
                    *(v197 - 1) = *((_OWORD *)v198 - 1);
                    *long long v197 = v200;
                    v197 -= 2;
                    v198 -= 4;
                    v199 -= 4;
                  }
                  while (v199);
                  v111 -= v196 & 0x3FFFFFFFFFFFFFFCLL;
                  if (v196 != (v196 & 0x3FFFFFFFFFFFFFFCLL))
                  {
                    do
                    {
LABEL_207:
                      uint64_t v194 = *--v193;
                      *--float v111 = v194;
                    }
                    while (v193 != v110);
                  }
                }
                uint64_t v185 = (uint64_t *)&v190[8 * v189];
                if (v110)
                {
                  v195 = &v190[8 * v189];
                  operator delete(v110);
                  uint64_t v185 = (uint64_t *)v195;
                  float v110 = v111;
                  float v33 = v268;
                  uint64_t v182 = v268[24];
                  float v112 = (uint64_t *)v195;
                  unint64_t v144 = v191;
                  unint64_t v113 = (unint64_t)v195;
                  unint64_t v114 = (unint64_t)v195;
                }
                else
                {
                  float v110 = v111;
                  float v112 = (uint64_t *)&v190[8 * v189];
                  unint64_t v144 = v191;
                  unint64_t v113 = (unint64_t)v112;
                  unint64_t v114 = (unint64_t)v185;
                  float v33 = v268;
                }
                uint64_t v137 = v267;
                uint64_t v181 = v261;
                goto LABEL_191;
              }
              *v144++ = v186;
              unint64_t v113 = (unint64_t)v112;
              unint64_t v114 = (unint64_t)v112;
            }
LABEL_191:
            if (++v184 == *(void **)(v182 + 24 * v137 + 8))
            {
              uint64_t v139 = v33[20];
              goto LABEL_225;
            }
          }
        }
        uint64_t v185 = v253;
LABEL_225:
        uint64_t v138 = (uint64_t)__bb;
      }
      else
      {
        uint64_t v185 = v253;
      }
      uint64_t v201 = *(void *)(v139 + 8 * v138 + 96);
      if (v201)
      {
        uint64_t v202 = v33[24];
        uint64_t v203 = v202 + 24 * v137;
        v204 = *(void **)v203;
        if (*(void *)v203 != *(void *)(v203 + 8))
        {
          v205 = v110;
          while (1)
          {
            if (*v204 == v201)
            {
              uint64_t v207 = ((uint64_t)v204 - *(void *)(v202 + 24 * v137)) >> 3;
              if (v144 >= v185)
              {
                uint64_t v208 = v185;
                uint64_t v209 = v144 - v205;
                unint64_t v210 = v209 + 1;
                if ((unint64_t)(v209 + 1) >> 61) {
                  goto LABEL_285;
                }
                unint64_t v211 = (char *)v185 - (char *)v205;
                unint64_t v212 = ((char *)v208 - (char *)v205) >> 2;
                if (v212 > v210) {
                  unint64_t v210 = v212;
                }
                if (v211 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v213 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v213 = v210;
                }
                if (v213)
                {
                  if (v213 >> 61) {
                    goto LABEL_286;
                  }
                  uint64_t v214 = v202;
                  v215 = operator new(8 * v213);
                  uint64_t v202 = v214;
                }
                else
                {
                  v215 = 0;
                }
                float v110 = (uint64_t *)&v215[8 * v209];
                *float v110 = v207;
                unint64_t v206 = v110 + 1;
                if (v144 == v205)
                {
                  float v33 = v268;
                  uint64_t v185 = (uint64_t *)&v215[8 * v213];
                  if (v205) {
                    goto LABEL_249;
                  }
                }
                else
                {
                  unint64_t v216 = (char *)(v144 - 1) - (char *)v205;
                  float v33 = v268;
                  if (v216 < 0x168)
                  {
                    uint64_t v217 = v144;
                    goto LABEL_247;
                  }
                  if (&v215[(char *)v144 - (char *)v205 - 8 - (v216 & 0xFFFFFFFFFFFFFFF8)] > &v215[(char *)v144 - (char *)v205 - 8])
                  {
                    uint64_t v217 = v144;
                    goto LABEL_247;
                  }
                  if ((uint64_t *)((char *)v144 - (v216 & 0xFFFFFFFFFFFFFFF8) - 8) > v144 - 1)
                  {
                    uint64_t v217 = v144;
                    goto LABEL_247;
                  }
                  if ((unint64_t)((char *)v205 - v215) < 0x20)
                  {
                    uint64_t v217 = v144;
                    goto LABEL_247;
                  }
                  uint64_t v220 = (v216 >> 3) + 1;
                  uint64_t v217 = &v144[-(v220 & 0x3FFFFFFFFFFFFFFCLL)];
                  float v221 = &v215[8 * v209 - 16];
                  float v222 = v144 - 2;
                  uint64_t v223 = v220 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    long long v224 = *(_OWORD *)v222;
                    *(v221 - 1) = *((_OWORD *)v222 - 1);
                    *float v221 = v224;
                    v221 -= 2;
                    v222 -= 4;
                    v223 -= 4;
                  }
                  while (v223);
                  v110 -= v220 & 0x3FFFFFFFFFFFFFFCLL;
                  if (v220 != (v220 & 0x3FFFFFFFFFFFFFFCLL))
                  {
                    do
                    {
LABEL_247:
                      uint64_t v218 = *--v217;
                      *--float v110 = v218;
                    }
                    while (v217 != v205);
                  }
                  uint64_t v185 = (uint64_t *)&v215[8 * v213];
                  if (v205)
                  {
LABEL_249:
                    uint64_t v219 = v185;
                    operator delete(v205);
                    uint64_t v185 = v219;
                    uint64_t v202 = v33[24];
                  }
                }
                float v111 = v110;
                float v112 = v185;
                unint64_t v113 = (unint64_t)v185;
                unint64_t v114 = (unint64_t)v185;
                uint64_t v137 = v267;
                goto LABEL_230;
              }
              *unint64_t v144 = v207;
              float v110 = v205;
              unint64_t v206 = v144 + 1;
              float v112 = v185;
              unint64_t v113 = (unint64_t)v185;
              unint64_t v114 = (unint64_t)v185;
              float v33 = v268;
            }
            else
            {
              float v110 = v205;
              unint64_t v206 = v144;
            }
LABEL_230:
            ++v204;
            v205 = v110;
            unint64_t v144 = v206;
            if (v204 == *(void **)(v202 + 24 * v137 + 8)) {
              goto LABEL_264;
            }
          }
        }
      }
      unint64_t v206 = v144;
LABEL_264:
      float v253 = v185;
      float v225 = (unint64_t *)v111;
      float v226 = v111;
      if (v111 != v206)
      {
        unint64_t v227 = v111 + 1;
        float v225 = (unint64_t *)v111;
        float v226 = v111;
        if (v111 + 1 != v206)
        {
          unint64_t v228 = *v111;
          unint64_t v229 = *v111;
          unint64_t v230 = (unint64_t *)(v111 + 1);
          float v225 = (unint64_t *)v111;
          long long v231 = v111 + 1;
          do
          {
            unint64_t v233 = *v231++;
            unint64_t v232 = v233;
            BOOL v234 = v229 >= v233;
            if (v229 <= v233) {
              unint64_t v229 = v232;
            }
            if (!v234) {
              float v225 = v230;
            }
            unint64_t v230 = (unint64_t *)v231;
          }
          while (v231 != v206);
          float v226 = v111;
          unint64_t v235 = v111 + 1;
          do
          {
            unint64_t v237 = *v235++;
            unint64_t v236 = v237;
            if (v237 < v228)
            {
              unint64_t v228 = v236;
              float v226 = v227;
            }
            unint64_t v227 = v235;
          }
          while (v235 != v206);
        }
      }
      if (v111 != v206)
      {
        uint64_t v238 = *v226;
        uint64_t v239 = v33[24];
        uint64_t v240 = *(void *)(v239 + 24 * v137);
        if (v238) {
          *(void *)(v33[22] + 8 * (v137 + 8 * v263)) = *(void *)(v240 + 8 * v238 - 8);
        }
        unint64_t v241 = *v225;
        if (v241 < ((*(void *)(v239 + 24 * v137 + 8) - v240) >> 3) - 1) {
          *(void *)(v33[22] + 8 * (((8 * v263) | 4) + v137)) = *(void *)(v240 + 8 * v241 + 8);
        }
      }
      if (++v137 != 4) {
        continue;
      }
      break;
    }
    unint64_t v115 = v263 + 1;
    if (v263 != 91) {
      continue;
    }
    break;
  }
  if (v111) {
    operator delete(v111);
  }
  return 0;
}

- (void)specSwitch:(unint64_t)a3 from:(const PRIConfigSpec *)a4 toBuffer:(unsigned __int8)a5[16]
{
  switch(a3)
  {
    case 0uLL:
      *a5 = a4->data[0].spect1hs1;
      a5[1] = a4->data[1].spect1hs1;
      a5[2] = a4->data[2].spect1hs1;
      a5[3] = a4->data[3].spect1hs1;
      a5[4] = a4->data[4].spect1hs1;
      a5[5] = a4->data[5].spect1hs1;
      a5[6] = a4->data[6].spect1hs1;
      a5[7] = a4->data[7].spect1hs1;
      a5[8] = a4->data[8].spect1hs1;
      a5[9] = a4->data[9].spect1hs1;
      a5[10] = a4->data[10].spect1hs1;
      a5[11] = a4->data[11].spect1hs1;
      a5[12] = a4->data[12].spect1hs1;
      a5[13] = a4->data[13].spect1hs1;
      a5[14] = a4->data[14].spect1hs1;
      p_spect1hs2 = &a4->data[15];
      goto LABEL_6;
    case 1uLL:
      *a5 = a4->data[0].spect1hs2;
      a5[1] = a4->data[1].spect1hs2;
      a5[2] = a4->data[2].spect1hs2;
      a5[3] = a4->data[3].spect1hs2;
      a5[4] = a4->data[4].spect1hs2;
      a5[5] = a4->data[5].spect1hs2;
      a5[6] = a4->data[6].spect1hs2;
      a5[7] = a4->data[7].spect1hs2;
      a5[8] = a4->data[8].spect1hs2;
      a5[9] = a4->data[9].spect1hs2;
      a5[10] = a4->data[10].spect1hs2;
      a5[11] = a4->data[11].spect1hs2;
      a5[12] = a4->data[12].spect1hs2;
      a5[13] = a4->data[13].spect1hs2;
      a5[14] = a4->data[14].spect1hs2;
      p_spect1hs2 = (PRIConfigSpecSingle *)&a4->data[15].spect1hs2;
      goto LABEL_6;
    case 2uLL:
      *a5 = a4->data[0].spect1hp;
      a5[1] = a4->data[1].spect1hp;
      a5[2] = a4->data[2].spect1hp;
      a5[3] = a4->data[3].spect1hp;
      a5[4] = a4->data[4].spect1hp;
      a5[5] = a4->data[5].spect1hp;
      a5[6] = a4->data[6].spect1hp;
      a5[7] = a4->data[7].spect1hp;
      a5[8] = a4->data[8].spect1hp;
      a5[9] = a4->data[9].spect1hp;
      a5[10] = a4->data[10].spect1hp;
      a5[11] = a4->data[11].spect1hp;
      a5[12] = a4->data[12].spect1hp;
      a5[13] = a4->data[13].spect1hp;
      a5[14] = a4->data[14].spect1hp;
      p_spect1hs2 = (PRIConfigSpecSingle *)&a4->data[15].spect1hp;
      goto LABEL_6;
    case 3uLL:
      *a5 = a4->data[0].spect1pepx;
      a5[1] = a4->data[1].spect1pepx;
      a5[2] = a4->data[2].spect1pepx;
      a5[3] = a4->data[3].spect1pepx;
      a5[4] = a4->data[4].spect1pepx;
      a5[5] = a4->data[5].spect1pepx;
      a5[6] = a4->data[6].spect1pepx;
      a5[7] = a4->data[7].spect1pepx;
      a5[8] = a4->data[8].spect1pepx;
      a5[9] = a4->data[9].spect1pepx;
      a5[10] = a4->data[10].spect1pepx;
      a5[11] = a4->data[11].spect1pepx;
      a5[12] = a4->data[12].spect1pepx;
      a5[13] = a4->data[13].spect1pepx;
      a5[14] = a4->data[14].spect1pepx;
      p_spect1hs2 = (PRIConfigSpecSingle *)&a4->data[15].spect1pepx;
LABEL_6:
      a5[15] = p_spect1hs2->spect1hs1;
      break;
    default:
      return;
  }
}

- (void).cxx_destruct
{
  begin = (char *)self->_specPhasePriOrder.__begin_;
  if (begin)
  {
    end = (char *)self->_specPhasePriOrder.__end_;
    v5 = self->_specPhasePriOrder.__begin_;
    if (end != begin)
    {
      uint64_t v6 = (char *)self->_specPhasePriOrder.__end_;
      do
      {
        long long v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        long long v7 = v8;
        if (v8)
        {
          *((void *)end - 2) = v7;
          operator delete(v7);
        }
        end = v6;
      }
      while (v6 != begin);
      v5 = self->_specPhasePriOrder.__begin_;
    }
    self->_specPhasePriOrder.__end_ = begin;
    operator delete(v5);
  }
  value = self->_ambientSpecTable.__ptr_.__value_;
  self->_ambientSpecTable.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x25A2D62A0](value, 0x1000C8000313F17);
  }
  long long v10 = self->_echoSpecTable.__ptr_.__value_;
  self->_echoSpecTable.__ptr_.__value_ = 0;
  if (v10) {
    MEMORY[0x25A2D62A0](v10, 0x1000C8000313F17);
  }
  long long v11 = self->_excludeBins.__ptr_.__value_;
  self->_excludeBins.__ptr_.__value_ = 0;
  if (v11) {
    MEMORY[0x25A2D62A0](v11, 0x1000C8077774924);
  }
  long long v12 = self->_numSpecBins.__ptr_.__value_;
  self->_numSpecBins.__ptr_.__value_ = 0;
  if (v12) {
    MEMORY[0x25A2D62A0](v12, 0x1000C8000313F17);
  }
  objc_storeStrong((id *)&self->_snrWeight, 0);
  objc_storeStrong((id *)&self->_avgStd, 0);
  objc_storeStrong((id *)&self->_avgSpecSnr, 0);
  uint64_t v13 = self->_refRelQs.__ptr_.__value_;
  self->_refRelQs.__ptr_.__value_ = 0;
  if (v13) {
    MEMORY[0x25A2D62A0](v13, 0x1000C8052888210);
  }
  objc_super v14 = self->_refX.__ptr_.__value_;
  self->_refX.__ptr_.__value_ = 0;
  if (v14)
  {
    JUMPOUT(0x25A2D62A0);
  }
}

- (unint64_t)ambientSpecTableSize
{
  return self->_ambientSpecTableSize;
}

- (void)ambientSpecTable
{
  return &self->_ambientSpecTable;
}

- (unint64_t)echoSpecTableSize
{
  return self->_echoSpecTableSize;
}

- (void)echoSpecTable
{
  return &self->_echoSpecTable;
}

- (vector<std::vector<unsigned)specPhasePriOrder
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self->_specPhasePriOrder.__begin_;
  end = (char *)self->_specPhasePriOrder.__end_;
  int result = (vector<std::vector<unsigned long>, std::allocator<std::vector<unsigned long>>> *)(end - begin);
  if (end != begin)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)result >> 3);
    if (v7 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    int result = (vector<std::vector<unsigned long>, std::allocator<std::vector<unsigned long>>> *)operator new((size_t)result);
    long long v8 = result;
    uint64_t v9 = 0;
    retstr->__begin_ = result;
    retstr->__end_ = result;
    retstr->__end_cap_.__value_ = result + v7;
    do
    {
      long long v10 = &v8[v9];
      long long v11 = &begin[v9 * 24];
      v10->__begin_ = 0;
      v10->__end_ = 0;
      v10->__end_cap_.__value_ = 0;
      uint64_t v13 = *(unsigned char **)&begin[v9 * 24];
      long long v12 = *(unsigned char **)&begin[v9 * 24 + 8];
      int64_t v14 = v12 - v13;
      if (v12 != v13)
      {
        if (v14 < 0) {
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v15 = (char *)operator new(v12 - v13);
        v10->__begin_ = v15;
        v10->__end_ = v15;
        float v16 = &v15[8 * (v14 >> 3)];
        v10->__end_cap_.__value_ = v16;
        int result = (vector<std::vector<unsigned long>, std::allocator<std::vector<unsigned long>>> *)memcpy(v15, v13, v14);
        v10->__end_ = v16;
      }
      ++v9;
    }
    while (v11 + 24 != end);
    retstr->__end_ = &v8[v9];
  }
  return result;
}

- (unint64_t)binsArraySize
{
  return self->_binsArraySize;
}

- (void)excludeBins
{
  return &self->_excludeBins;
}

- (void)numSpecBins
{
  return &self->_numSpecBins;
}

- (NSArray)snrWeight
{
  return self->_snrWeight;
}

- (NSArray)avgStd
{
  return self->_avgStd;
}

- (NSArray)avgSpecSnr
{
  return self->_avgSpecSnr;
}

- (float)allowedDistFromCalib
{
  return self->_allowedDistFromCalib;
}

- (unint64_t)maxSnrLimit
{
  return self->_maxSnrLimit;
}

- (float)minSpecQsSnr
{
  return self->_minSpecQsSnr;
}

- (PRIConfigSpec)specConfig
{
  return &self->_specConfig;
}

- (void)refRelQs
{
  return &self->_refRelQs;
}

- (unint64_t)refXSize
{
  return self->_refXSize;
}

- (void)refX
{
  return &self->_refX;
}

- (float)spotSizeSigma
{
  return self->_spotSizeSigma;
}

- (unint64_t)totBinsHs
{
  return self->_totBinsHs;
}

- (unint64_t)totBinsHp
{
  return self->_totBinsHp;
}

- (unint64_t)centerRightHs
{
  return self->_centerRightHs;
}

- (unint64_t)centerLeftHs
{
  return self->_centerLeftHs;
}

- (unint64_t)centerRightHp
{
  return self->_centerRightHp;
}

- (unint64_t)centerLeftHp
{
  return self->_centerLeftHp;
}

- (void)setUnitInfo:(const PeridotUnitInfo *)a3
{
  self->_unitInfo = a3;
}

- (const)unitInfo
{
  return self->_unitInfo;
}

- (int)globalEstimation:(id *)a3 estSpotLocAtRefDist:(id *)a4 validSpotsIndexes:(const void *)a5 result:(void *)a6
{
  if (*((unsigned char *)a5 + 8)
     - *(unsigned char *)a5
     + *((unsigned char *)a5 + 32)
     - *((unsigned char *)a5 + 24)
     + *((unsigned char *)a5 + 56)
     - *((unsigned char *)a5 + 48)
     + *((unsigned char *)a5 + 80)
     - *((unsigned char *)a5 + 72)
     + *((unsigned char *)a5 + 104)
     - *((unsigned char *)a5 + 96)
     + *((unsigned char *)a5 + 128)
     - *((unsigned char *)a5 + 120)
     + *((unsigned char *)a5 + 152)
     - *((unsigned char *)a5 + 144)
     + *((unsigned char *)a5 + 176)
     - *((unsigned char *)a5 + 168))
  {
    operator new[]();
  }
  operator new[]();
}

- (float)calcHomogModelErrorR:(void *)a3 estSpotLocAtRefDistValid:(void *)a4 globalEstimationResult:(void *)a5
{
  unsigned int v5 = *((_DWORD *)a5 + 1);
  if (!v5) {
    return INFINITY;
  }
  uint64_t v6 = (unsigned int *)*((void *)a5 + 2);
  float v7 = 0.0;
  uint64_t v8 = *((unsigned int *)a5 + 1);
  do
  {
    unsigned int v9 = *v6++;
    long long v10 = (double *)(*((void *)a3 + 1) + 8 * *(unsigned __int8 *)(*((void *)a5 + 125) + v9));
    float v11 = *v10;
    long long v12 = (double *)(*((void *)a4 + 1) + 8 * v9);
    float v13 = *v12;
    float v14 = v10[*((unsigned int *)a3 + 5)];
    float v15 = v12[*((unsigned int *)a4 + 5)];
    float v7 = (float)(v7 + (float)((float)(v11 - v13) * (float)(v11 - v13)))
       + (float)((float)(v14 - v15) * (float)(v14 - v15));
    --v8;
  }
  while (v8);
  return sqrtf(v7 / (float)v5);
}

- (void)getHomogTols:(const void *)a3 camMat:(id *)a4 estTols:(EstTols *)a5
{
  unsigned int v5 = &unk_2707171D8;
  operator new[]();
}

- (BOOL)homogClassifier:(const void *)a3 camCalib:(id)a4 smoothedSpotsLocAtRefDist:(id *)a5 currentSpotsLocAtRefDist:(id *)a6 factorySpotsLocAtRefDist:(id *)a7 validSpotsIndexes:(const void *)a8 smoothedSNR:(const void *)a9 smoothedSNa:(const void *)a10 gmoMetrics:(GmoMetrics *)a11 estTols:(EstTols *)a12
{
  uint64_t v775 = *MEMORY[0x263EF8340];
  float v15 = (float32x2_t *)((char *)a3 + 876);
  float v16 = (float32x2_t *)((char *)a3 + 540);
  int v17 = (float32x2_t *)((char *)a3 + 260);
  a4;
  uint64_t v18 = *((void *)a3 + 126) - *((void *)a3 + 125);
  a11->var2 = (float)v18 * 0.0089286;
  float32x2_t v19 = *(float32x2_t *)((char *)a3 + 92);
  float32x2_t v20 = vsub_f32(v19, (float32x2_t)a7->var0[0].var0[0]);
  float32x2_t v21 = vmul_f32(v20, v20);
  float32x2_t v22 = vsub_f32(v19, (float32x2_t)a5->var0[0].var0[0]);
  float32x2_t v23 = vmul_f32(v22, v22);
  float32x2_t v24 = *(float32x2_t *)((char *)a3 + 100);
  float32x2_t v25 = vsub_f32(v24, (float32x2_t)a7->var0[0].var0[1]);
  float32x2_t v26 = vmul_f32(v25, v25);
  float32x2_t v27 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v21, 1), v21), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v26, 1), v26)));
  float32x2_t v28 = vsub_f32(v24, (float32x2_t)a5->var0[0].var0[1]);
  float32x2_t v29 = vmul_f32(v28, v28);
  float32x2_t v30 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v23, 1), v23), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v29, 1), v29)));
  float32x2_t v31 = *(float32x2_t *)((char *)a3 + 108);
  float32x2_t v32 = vsub_f32(v31, (float32x2_t)a7->var0[0].var0[2]);
  float32x2_t v33 = vmul_f32(v32, v32);
  float32x2_t v34 = vsub_f32(v31, (float32x2_t)a5->var0[0].var0[2]);
  float32x2_t v35 = vmul_f32(v34, v34);
  float32x2_t v36 = *(float32x2_t *)((char *)a3 + 116);
  float32x2_t v37 = vsub_f32(v36, (float32x2_t)a7->var0[0].var0[3]);
  float32x2_t v38 = vmul_f32(v37, v37);
  float32x2_t v39 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v33, 1), v33), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v38, 1), v38)));
  float32x2_t v40 = vsub_f32(v36, (float32x2_t)a5->var0[0].var0[3]);
  float32x2_t v41 = vmul_f32(v40, v40);
  float32x2_t v42 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v35, 1), v35), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v41, 1), v41)));
  float32x2_t v43 = *(float32x2_t *)((char *)a3 + 124);
  float32x2_t v44 = vsub_f32(v43, (float32x2_t)a7->var0[0].var0[4]);
  float32x2_t v45 = vmul_f32(v44, v44);
  float32x2_t v46 = (float32x2_t)a5->var0[0].var0[5];
  float32x2_t v47 = vsub_f32(v43, (float32x2_t)a5->var0[0].var0[4]);
  float32x2_t v48 = vmul_f32(v47, v47);
  float32x2_t v49 = *(float32x2_t *)((char *)a3 + 132);
  float32x2_t v50 = vsub_f32(v49, (float32x2_t)a7->var0[0].var0[5]);
  float32x2_t v51 = vmul_f32(v50, v50);
  float32x2_t v663 = v27;
  float32x2_t v664 = v39;
  float32x2_t v719 = v30;
  float32x2_t v720 = v42;
  float32x2_t v52 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v45, 1), v45), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v51, 1), v51)));
  float32x2_t v53 = vsub_f32(v49, v46);
  float32x2_t v54 = vmul_f32(v53, v53);
  float32x2_t v55 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v48, 1), v48), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v54, 1), v54)));
  float32x2_t v56 = *(float32x2_t *)((char *)a3 + 140);
  float32x2_t v57 = vsub_f32(v56, (float32x2_t)a7->var0[0].var0[6]);
  float32x2_t v58 = vmul_f32(v57, v57);
  float32x2_t v59 = (float32x2_t)a5->var0[0].var0[7];
  float32x2_t v60 = vsub_f32(v56, (float32x2_t)a5->var0[0].var0[6]);
  float32x2_t v61 = vmul_f32(v60, v60);
  float32x2_t v62 = *(float32x2_t *)((char *)a3 + 148);
  float32x2_t v63 = vsub_f32(v62, (float32x2_t)a7->var0[0].var0[7]);
  float32x2_t v64 = vmul_f32(v63, v63);
  float32x2_t v665 = v52;
  float32x2_t v666 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v58, 1), v58), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v64, 1), v64)));
  float32x2_t v65 = vsub_f32(v62, v59);
  float32x2_t v66 = vmul_f32(v65, v65);
  float32x2_t v67 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v61, 1), v61), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v66, 1), v66)));
  float32x2_t v68 = *(float32x2_t *)((char *)a3 + 156);
  float32x2_t v69 = vsub_f32(v68, (float32x2_t)a7->var0[0].var0[8]);
  float32x2_t v70 = vmul_f32(v69, v69);
  float32x2_t v71 = (float32x2_t)a5->var0[0].var0[9];
  float32x2_t v72 = vsub_f32(v68, (float32x2_t)a5->var0[0].var0[8]);
  float32x2_t v73 = vmul_f32(v72, v72);
  float32x2_t v74 = *(float32x2_t *)((char *)a3 + 164);
  float32x2_t v75 = vsub_f32(v74, (float32x2_t)a7->var0[0].var0[9]);
  float32x2_t v721 = v55;
  float32x2_t v722 = v67;
  float32x2_t v76 = vmul_f32(v75, v75);
  float32x2_t v77 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v70, 1), v70), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v76, 1), v76)));
  float32x2_t v78 = vsub_f32(v74, v71);
  float32x2_t v79 = vmul_f32(v78, v78);
  float32x2_t v80 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v73, 1), v73), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v79, 1), v79)));
  float32x2_t v81 = *(float32x2_t *)((char *)a3 + 172);
  float32x2_t v82 = vsub_f32(v81, (float32x2_t)a7->var0[0].var0[10]);
  float32x2_t v83 = vmul_f32(v82, v82);
  float32x2_t v84 = (float32x2_t)a5->var0[0].var0[11];
  float32x2_t v85 = vsub_f32(v81, (float32x2_t)a5->var0[0].var0[10]);
  float32x2_t v86 = vmul_f32(v85, v85);
  float32x2_t v87 = *(float32x2_t *)((char *)a3 + 180);
  float32x2_t v88 = vsub_f32(v87, (float32x2_t)a7->var0[0].var0[11]);
  float32x2_t v89 = vmul_f32(v88, v88);
  float32x2_t v667 = v77;
  float32x2_t v668 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v83, 1), v83), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v89, 1), v89)));
  float32x2_t v90 = vsub_f32(v87, v84);
  float32x2_t v91 = vmul_f32(v90, v90);
  float32x2_t v723 = v80;
  float32x2_t v724 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v86, 1), v86), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v91, 1), v91)));
  float32x2_t v92 = *(float32x2_t *)((char *)a3 + 188);
  float32x2_t v93 = vsub_f32(v92, (float32x2_t)a7->var0[0].var0[12]);
  float32x2_t v94 = vmul_f32(v93, v93);
  float32x2_t v95 = vsub_f32(v92, (float32x2_t)a5->var0[0].var0[12]);
  float32x2_t v96 = vmul_f32(v95, v95);
  float32x2_t v97 = *(float32x2_t *)((char *)a3 + 196);
  float32x2_t v98 = vsub_f32(v97, (float32x2_t)a7->var0[0].var0[13]);
  float32x2_t v99 = vmul_f32(v98, v98);
  float32x2_t v100 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v94, 1), v94), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v99, 1), v99)));
  float32x2_t v101 = vsub_f32(v97, (float32x2_t)a5->var0[0].var0[13]);
  float32x2_t v102 = vmul_f32(v101, v101);
  float32x2_t v103 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v96, 1), v96), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v102, 1), v102)));
  float32x2_t v104 = *(float32x2_t *)((char *)a3 + 204);
  float32x2_t v105 = vsub_f32(v104, (float32x2_t)a7->var0[1].var0[0]);
  float32x2_t v106 = vmul_f32(v105, v105);
  float32x2_t v107 = (float32x2_t)a5->var0[1].var0[1];
  float32x2_t v108 = vsub_f32(v104, (float32x2_t)a5->var0[1].var0[0]);
  float32x2_t v109 = vmul_f32(v108, v108);
  float32x2_t v110 = *(float32x2_t *)((char *)a3 + 212);
  float32x2_t v111 = vsub_f32(v110, (float32x2_t)a7->var0[1].var0[1]);
  float32x2_t v112 = vmul_f32(v111, v111);
  float32x2_t v669 = v100;
  float32x2_t v670 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v106, 1), v106), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v112, 1), v112)));
  float32x2_t v113 = vsub_f32(v110, v107);
  float32x2_t v114 = vmul_f32(v113, v113);
  float32x2_t v725 = v103;
  float32x2_t v726 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v109, 1), v109), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v114, 1), v114)));
  float32x2_t v115 = *(float32x2_t *)((char *)a3 + 220);
  float32x2_t v116 = vsub_f32(v115, (float32x2_t)a7->var0[1].var0[2]);
  float32x2_t v117 = vmul_f32(v116, v116);
  float32x2_t v118 = vsub_f32(v115, (float32x2_t)a5->var0[1].var0[2]);
  float32x2_t v119 = vmul_f32(v118, v118);
  float32x2_t v120 = *(float32x2_t *)((char *)a3 + 228);
  float32x2_t v121 = vsub_f32(v120, (float32x2_t)a7->var0[1].var0[3]);
  float32x2_t v122 = vmul_f32(v121, v121);
  float32x2_t v123 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v117, 1), v117), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v122, 1), v122)));
  float32x2_t v124 = vsub_f32(v120, (float32x2_t)a5->var0[1].var0[3]);
  float32x2_t v125 = vmul_f32(v124, v124);
  float32x2_t v126 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v119, 1), v119), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v125, 1), v125)));
  float32x2_t v127 = *(float32x2_t *)((char *)a3 + 236);
  float32x2_t v128 = vsub_f32(v127, (float32x2_t)a7->var0[1].var0[4]);
  float32x2_t v129 = vmul_f32(v128, v128);
  float32x2_t v130 = (float32x2_t)a5->var0[1].var0[5];
  float32x2_t v131 = vsub_f32(v127, (float32x2_t)a5->var0[1].var0[4]);
  float32x2_t v132 = vmul_f32(v131, v131);
  float32x2_t v133 = *(float32x2_t *)((char *)a3 + 244);
  float32x2_t v134 = vsub_f32(v133, (float32x2_t)a7->var0[1].var0[5]);
  float32x2_t v135 = vmul_f32(v134, v134);
  float32x2_t v671 = v123;
  float32x2_t v672 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v129, 1), v129), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v135, 1), v135)));
  float32x2_t v136 = vsub_f32(v133, v130);
  float32x2_t v137 = vmul_f32(v136, v136);
  float32x2_t v727 = v126;
  float32x2_t v728 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v132, 1), v132), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v137, 1), v137)));
  float32x2_t v138 = *(float32x2_t *)((char *)a3 + 252);
  float32x2_t v139 = vsub_f32(v138, (float32x2_t)a7->var0[1].var0[6]);
  float32x2_t v140 = vmul_f32(v139, v139);
  float32x2_t v141 = vsub_f32(v138, (float32x2_t)a5->var0[1].var0[6]);
  float32x2_t v142 = vmul_f32(v141, v141);
  float32x2_t v143 = v17[1];
  float32x2_t v144 = vsub_f32(*v17, (float32x2_t)a7->var0[1].var0[7]);
  float32x2_t v145 = vmul_f32(v144, v144);
  float32x2_t v146 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v140, 1), v140), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v145, 1), v145)));
  float32x2_t v147 = vsub_f32(*v17, (float32x2_t)a5->var0[1].var0[7]);
  float32x2_t v148 = vmul_f32(v147, v147);
  float32x2_t v149 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v142, 1), v142), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v148, 1), v148)));
  float32x2_t v150 = vsub_f32(v143, (float32x2_t)a7->var0[1].var0[8]);
  float32x2_t v151 = vmul_f32(v150, v150);
  float32x2_t v152 = (float32x2_t)a5->var0[1].var0[9];
  float32x2_t v153 = vsub_f32(v143, (float32x2_t)a5->var0[1].var0[8]);
  float32x2_t v154 = vmul_f32(v153, v153);
  float32x2_t v155 = v17[2];
  float32x2_t v156 = v17[3];
  float32x2_t v157 = vsub_f32(v155, (float32x2_t)a7->var0[1].var0[9]);
  float32x2_t v158 = vmul_f32(v157, v157);
  float32x2_t v673 = v146;
  float32x2_t v674 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v151, 1), v151), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v158, 1), v158)));
  float32x2_t v159 = vsub_f32(v155, v152);
  float32x2_t v160 = vmul_f32(v159, v159);
  float32x2_t v729 = v149;
  float32x2_t v730 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v154, 1), v154), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v160, 1), v160)));
  float32x2_t v161 = vsub_f32(v156, (float32x2_t)a7->var0[1].var0[10]);
  float32x2_t v162 = vmul_f32(v161, v161);
  float32x2_t v163 = vsub_f32(v156, (float32x2_t)a5->var0[1].var0[10]);
  float32x2_t v164 = vmul_f32(v163, v163);
  float32x2_t v165 = v17[4];
  float32x2_t v166 = v17[5];
  float32x2_t v167 = vsub_f32(v165, (float32x2_t)a7->var0[1].var0[11]);
  float32x2_t v168 = vmul_f32(v167, v167);
  float32x2_t v169 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v162, 1), v162), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v168, 1), v168));
  float32x2_t v170 = vsub_f32(v165, (float32x2_t)a5->var0[1].var0[11]);
  float32x2_t v171 = vmul_f32(v170, v170);
  float32x2_t v172 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v164, 1), v164), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v171, 1), v171)));
  float32x2_t v173 = vsub_f32(v166, (float32x2_t)a7->var0[1].var0[12]);
  float32x2_t v174 = vmul_f32(v173, v173);
  float32x2_t v175 = (float32x2_t)a5->var0[1].var0[13];
  float32x2_t v176 = vsub_f32(v166, (float32x2_t)a5->var0[1].var0[12]);
  float32x2_t v177 = vmul_f32(v176, v176);
  float32x2_t v178 = v17[6];
  float32x2_t v179 = v17[7];
  float32x2_t v180 = vsub_f32(v178, (float32x2_t)a7->var0[1].var0[13]);
  float32x2_t v181 = vmul_f32(v180, v180);
  float32x2_t v675 = vsqrt_f32(v169);
  float32x2_t v676 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v174, 1), v174), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v181, 1), v181)));
  float32x2_t v182 = vsub_f32(v178, v175);
  float32x2_t v183 = vmul_f32(v182, v182);
  float32x2_t v731 = v172;
  float32x2_t v732 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v177, 1), v177), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v183, 1), v183)));
  float32x2_t v184 = vsub_f32(v179, (float32x2_t)a7->var0[2].var0[0]);
  float32x2_t v185 = vmul_f32(v184, v184);
  float32x2_t v186 = vsub_f32(v179, (float32x2_t)a5->var0[2].var0[0]);
  float32x2_t v187 = vmul_f32(v186, v186);
  float32x2_t v188 = v17[8];
  float32x2_t v189 = v17[9];
  float32x2_t v190 = vsub_f32(v188, (float32x2_t)a7->var0[2].var0[1]);
  float32x2_t v191 = vmul_f32(v190, v190);
  float32x2_t v192 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v185, 1), v185), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v191, 1), v191)));
  float32x2_t v193 = vsub_f32(v188, (float32x2_t)a5->var0[2].var0[1]);
  float32x2_t v194 = vmul_f32(v193, v193);
  float32x2_t v195 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v187, 1), v187), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v194, 1), v194)));
  float32x2_t v196 = vsub_f32(v189, (float32x2_t)a7->var0[2].var0[2]);
  float32x2_t v197 = vmul_f32(v196, v196);
  float32x2_t v198 = vsub_f32(v189, (float32x2_t)a5->var0[2].var0[2]);
  float32x2_t v199 = vmul_f32(v198, v198);
  float32x2_t v200 = v17[10];
  float32x2_t v201 = v17[11];
  float32x2_t v202 = vsub_f32(v200, (float32x2_t)a7->var0[2].var0[3]);
  float32x2_t v203 = vmul_f32(v202, v202);
  float32x2_t v204 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v197, 1), v197), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v203, 1), v203)));
  float32x2_t v205 = vsub_f32(v200, (float32x2_t)a5->var0[2].var0[3]);
  float32x2_t v206 = vmul_f32(v205, v205);
  float32x2_t v677 = v192;
  float32x2_t v678 = v204;
  float32x2_t v733 = v195;
  float32x2_t v734 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v199, 1), v199), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v206, 1), v206)));
  float32x2_t v207 = vsub_f32(v201, (float32x2_t)a7->var0[2].var0[4]);
  float32x2_t v208 = vmul_f32(v207, v207);
  float32x2_t v209 = vsub_f32(v201, (float32x2_t)a5->var0[2].var0[4]);
  float32x2_t v210 = vmul_f32(v209, v209);
  int32x2_t v211 = (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v210, 1), v210);
  float32x2_t v212 = v17[12];
  float32x2_t v213 = v17[13];
  float32x2_t v214 = vsub_f32(v212, (float32x2_t)a7->var0[2].var0[5]);
  float32x2_t v215 = vmul_f32(v214, v214);
  float32x2_t v216 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v208, 1), v208), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v215, 1), v215)));
  float32x2_t v217 = vsub_f32(v212, (float32x2_t)a5->var0[2].var0[5]);
  float32x2_t v218 = vmul_f32(v217, v217);
  float32x2_t v219 = vsqrt_f32((float32x2_t)vzip1_s32(v211, (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v218, 1), v218)));
  float32x2_t v220 = vsub_f32(v213, (float32x2_t)a7->var0[2].var0[6]);
  float32x2_t v221 = vmul_f32(v220, v220);
  float32x2_t v222 = (float32x2_t)a5->var0[2].var0[7];
  float32x2_t v223 = vsub_f32(v213, (float32x2_t)a5->var0[2].var0[6]);
  float32x2_t v224 = vmul_f32(v223, v223);
  int32x2_t v225 = (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v224, 1), v224);
  float32x2_t v226 = v17[14];
  float32x2_t v227 = v17[15];
  float32x2_t v228 = vsub_f32(v226, (float32x2_t)a7->var0[2].var0[7]);
  float32x2_t v229 = vmul_f32(v228, v228);
  float32x2_t v679 = v216;
  float32x2_t v680 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v221, 1), v221), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v229, 1), v229)));
  float32x2_t v230 = vsub_f32(v226, v222);
  float32x2_t v231 = vmul_f32(v230, v230);
  float32x2_t v735 = v219;
  float32x2_t v736 = vsqrt_f32((float32x2_t)vzip1_s32(v225, (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v231, 1), v231)));
  float32x2_t v232 = vsub_f32(v227, (float32x2_t)a7->var0[2].var0[8]);
  float32x2_t v233 = vmul_f32(v232, v232);
  float32x2_t v234 = vsub_f32(v227, (float32x2_t)a5->var0[2].var0[8]);
  float32x2_t v235 = vmul_f32(v234, v234);
  float32x2_t v236 = v17[16];
  float32x2_t v237 = v17[17];
  float32x2_t v238 = vsub_f32(v236, (float32x2_t)a7->var0[2].var0[9]);
  float32x2_t v239 = vmul_f32(v238, v238);
  float32x2_t v240 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v233, 1), v233), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v239, 1), v239));
  float32x2_t v241 = vsub_f32(v236, (float32x2_t)a5->var0[2].var0[9]);
  float32x2_t v242 = vmul_f32(v241, v241);
  float32x2_t v243 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v235, 1), v235), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v242, 1), v242)));
  float32x2_t v244 = vsub_f32(v237, (float32x2_t)a7->var0[2].var0[10]);
  float32x2_t v245 = vmul_f32(v244, v244);
  float32x2_t v246 = (float32x2_t)a5->var0[2].var0[11];
  float32x2_t v247 = vsub_f32(v237, (float32x2_t)a5->var0[2].var0[10]);
  float32x2_t v248 = vmul_f32(v247, v247);
  float32x2_t v249 = v17[18];
  float32x2_t v250 = v17[19];
  float32x2_t v251 = vsub_f32(v249, (float32x2_t)a7->var0[2].var0[11]);
  float32x2_t v252 = vmul_f32(v251, v251);
  float32x2_t v681 = vsqrt_f32(v240);
  float32x2_t v682 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v245, 1), v245), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v252, 1), v252)));
  float32x2_t v253 = vsub_f32(v249, v246);
  float32x2_t v254 = vmul_f32(v253, v253);
  float32x2_t v737 = v243;
  float32x2_t v738 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v248, 1), v248), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v254, 1), v254)));
  float32x2_t v255 = vsub_f32(v250, (float32x2_t)a7->var0[2].var0[12]);
  float32x2_t v256 = vmul_f32(v255, v255);
  float32x2_t v257 = vsub_f32(v250, (float32x2_t)a5->var0[2].var0[12]);
  float32x2_t v258 = vmul_f32(v257, v257);
  float32x2_t v259 = v17[20];
  float32x2_t v260 = v17[21];
  float32x2_t v261 = vsub_f32(v259, (float32x2_t)a7->var0[2].var0[13]);
  float32x2_t v262 = vmul_f32(v261, v261);
  float32x2_t v263 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v256, 1), v256), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v262, 1), v262)));
  float32x2_t v264 = vsub_f32(v259, (float32x2_t)a5->var0[2].var0[13]);
  float32x2_t v265 = vmul_f32(v264, v264);
  float32x2_t v266 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v258, 1), v258), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v265, 1), v265)));
  float32x2_t v267 = vsub_f32(v260, (float32x2_t)a7->var0[3].var0[0]);
  float32x2_t v268 = vmul_f32(v267, v267);
  float32x2_t v269 = vsub_f32(v260, (float32x2_t)a5->var0[3].var0[0]);
  float32x2_t v270 = vmul_f32(v269, v269);
  float32x2_t v271 = v17[22];
  float32x2_t v272 = v17[23];
  float32x2_t v273 = vsub_f32(v271, (float32x2_t)a7->var0[3].var0[1]);
  float32x2_t v274 = vmul_f32(v273, v273);
  float32x2_t v275 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v268, 1), v268), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v274, 1), v274)));
  float32x2_t v276 = vsub_f32(v271, (float32x2_t)a5->var0[3].var0[1]);
  float32x2_t v277 = vmul_f32(v276, v276);
  float32x2_t v683 = v263;
  float32x2_t v684 = v275;
  float32x2_t v739 = v266;
  float32x2_t v740 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v270, 1), v270), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v277, 1), v277)));
  float32x2_t v278 = vsub_f32(v272, (float32x2_t)a7->var0[3].var0[2]);
  float32x2_t v279 = vmul_f32(v278, v278);
  float32x2_t v280 = vsub_f32(v272, (float32x2_t)a5->var0[3].var0[2]);
  float32x2_t v281 = vmul_f32(v280, v280);
  int32x2_t v282 = (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v281, 1), v281);
  float32x2_t v283 = v17[24];
  float32x2_t v284 = v17[25];
  float32x2_t v285 = vsub_f32(v283, (float32x2_t)a7->var0[3].var0[3]);
  float32x2_t v286 = vmul_f32(v285, v285);
  float32x2_t v287 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v279, 1), v279), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v286, 1), v286)));
  float32x2_t v288 = vsub_f32(v283, (float32x2_t)a5->var0[3].var0[3]);
  float32x2_t v289 = vmul_f32(v288, v288);
  float32x2_t v290 = vsqrt_f32((float32x2_t)vzip1_s32(v282, (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v289, 1), v289)));
  float32x2_t v291 = vsub_f32(v284, (float32x2_t)a7->var0[3].var0[4]);
  float32x2_t v292 = vmul_f32(v291, v291);
  float32x2_t v293 = (float32x2_t)a5->var0[3].var0[5];
  float32x2_t v294 = vsub_f32(v284, (float32x2_t)a5->var0[3].var0[4]);
  float32x2_t v295 = vmul_f32(v294, v294);
  int32x2_t v296 = (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v295, 1), v295);
  float32x2_t v297 = v17[26];
  float32x2_t v298 = v17[27];
  float32x2_t v299 = vsub_f32(v297, (float32x2_t)a7->var0[3].var0[5]);
  float32x2_t v300 = vmul_f32(v299, v299);
  float32x2_t v685 = v287;
  float32x2_t v686 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v292, 1), v292), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v300, 1), v300)));
  float32x2_t v301 = vsub_f32(v297, v293);
  float32x2_t v302 = vmul_f32(v301, v301);
  float32x2_t v741 = v290;
  float32x2_t v742 = vsqrt_f32((float32x2_t)vzip1_s32(v296, (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v302, 1), v302)));
  float32x2_t v303 = vsub_f32(v298, (float32x2_t)a7->var0[3].var0[6]);
  float32x2_t v304 = vmul_f32(v303, v303);
  float32x2_t v305 = vsub_f32(v298, (float32x2_t)a5->var0[3].var0[6]);
  float32x2_t v306 = vmul_f32(v305, v305);
  float32x2_t v307 = v17[28];
  float32x2_t v308 = v17[29];
  float32x2_t v309 = vsub_f32(v307, (float32x2_t)a7->var0[3].var0[7]);
  float32x2_t v310 = vmul_f32(v309, v309);
  float32x2_t v311 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v304, 1), v304), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v310, 1), v310));
  float32x2_t v312 = vsub_f32(v307, (float32x2_t)a5->var0[3].var0[7]);
  float32x2_t v313 = vmul_f32(v312, v312);
  float32x2_t v314 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v306, 1), v306), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v313, 1), v313));
  float32x2_t v315 = vsub_f32(v308, (float32x2_t)a7->var0[3].var0[8]);
  float32x2_t v316 = vmul_f32(v315, v315);
  float32x2_t v317 = (float32x2_t)a5->var0[3].var0[9];
  float32x2_t v318 = vsub_f32(v308, (float32x2_t)a5->var0[3].var0[8]);
  float32x2_t v319 = vmul_f32(v318, v318);
  float32x2_t v320 = v17[30];
  float32x2_t v321 = v17[31];
  float32x2_t v322 = vsub_f32(v320, (float32x2_t)a7->var0[3].var0[9]);
  float32x2_t v323 = vmul_f32(v322, v322);
  float32x2_t v687 = vsqrt_f32(v311);
  float32x2_t v688 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v316, 1), v316), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v323, 1), v323)));
  float32x2_t v324 = vsub_f32(v320, v317);
  float32x2_t v325 = vmul_f32(v324, v324);
  float32x2_t v743 = vsqrt_f32(v314);
  float32x2_t v744 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v319, 1), v319), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v325, 1), v325)));
  float32x2_t v326 = vsub_f32(v321, (float32x2_t)a7->var0[3].var0[10]);
  float32x2_t v327 = vmul_f32(v326, v326);
  float32x2_t v328 = vsub_f32(v321, (float32x2_t)a5->var0[3].var0[10]);
  float32x2_t v329 = vmul_f32(v328, v328);
  float32x2_t v330 = v17[32];
  float32x2_t v331 = v17[33];
  float32x2_t v332 = vsub_f32(v330, (float32x2_t)a7->var0[3].var0[11]);
  float32x2_t v333 = vmul_f32(v332, v332);
  float32x2_t v334 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v327, 1), v327), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v333, 1), v333)));
  float32x2_t v335 = vsub_f32(v330, (float32x2_t)a5->var0[3].var0[11]);
  float32x2_t v336 = vmul_f32(v335, v335);
  float32x2_t v337 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v329, 1), v329), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v336, 1), v336)));
  float32x2_t v338 = vsub_f32(v331, (float32x2_t)a7->var0[3].var0[12]);
  float32x2_t v339 = vmul_f32(v338, v338);
  float32x2_t v340 = (float32x2_t)a5->var0[3].var0[13];
  float32x2_t v341 = vsub_f32(v331, (float32x2_t)a5->var0[3].var0[12]);
  float32x2_t v342 = vmul_f32(v341, v341);
  float32x2_t v343 = v17[34];
  float32x2_t v344 = vsub_f32(v343, (float32x2_t)a7->var0[3].var0[13]);
  float32x2_t v345 = vmul_f32(v344, v344);
  float32x2_t v689 = v334;
  float32x2_t v690 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v339, 1), v339), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v345, 1), v345)));
  float32x2_t v346 = vsub_f32(v343, v340);
  float32x2_t v347 = vmul_f32(v346, v346);
  float32x2_t v348 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v342, 1), v342), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v347, 1), v347)));
  float32x2_t v349 = *v16;
  float32x2_t v350 = v16[1];
  float32x2_t v351 = (float32x2_t)a7->var0[4].var0[1];
  float32x2_t v352 = vsub_f32(*v16, (float32x2_t)a7->var0[4].var0[0]);
  float32x2_t v353 = vmul_f32(v352, v352);
  float32x2_t v745 = v337;
  float32x2_t v746 = v348;
  int32x2_t v354 = (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v353, 1), v353);
  float32x2_t v355 = vsub_f32(v349, (float32x2_t)a5->var0[4].var0[0]);
  float32x2_t v356 = vmul_f32(v355, v355);
  float32x2_t v357 = vsub_f32(v350, v351);
  float32x2_t v358 = vmul_f32(v357, v357);
  float32x2_t v359 = vsub_f32(v350, (float32x2_t)a5->var0[4].var0[1]);
  float32x2_t v360 = vmul_f32(v359, v359);
  float32x2_t v361 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v356, 1), v356), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v360, 1), v360));
  float32x2_t v362 = v16[2];
  float32x2_t v363 = v16[3];
  float32x2_t v364 = vsub_f32(v362, (float32x2_t)a7->var0[4].var0[2]);
  float32x2_t v365 = vmul_f32(v364, v364);
  float32x2_t v366 = (float32x2_t)a5->var0[4].var0[3];
  float32x2_t v367 = vsub_f32(v362, (float32x2_t)a5->var0[4].var0[2]);
  float32x2_t v368 = vmul_f32(v367, v367);
  float32x2_t v369 = vsqrt_f32((float32x2_t)vzip1_s32(v354, (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v358, 1), v358)));
  float32x2_t v370 = vsub_f32(v363, (float32x2_t)a7->var0[4].var0[3]);
  float32x2_t v371 = vmul_f32(v370, v370);
  float32x2_t v691 = v369;
  float32x2_t v692 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v365, 1), v365), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v371, 1), v371)));
  float32x2_t v372 = vsub_f32(v363, v366);
  float32x2_t v373 = vmul_f32(v372, v372);
  float32x2_t v747 = vsqrt_f32(v361);
  float32x2_t v748 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v368, 1), v368), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v373, 1), v373)));
  float32x2_t v374 = v16[4];
  float32x2_t v375 = v16[5];
  float32x2_t v376 = vsub_f32(v374, (float32x2_t)a7->var0[4].var0[4]);
  float32x2_t v377 = vmul_f32(v376, v376);
  float32x2_t v378 = vsub_f32(v374, (float32x2_t)a5->var0[4].var0[4]);
  float32x2_t v379 = vmul_f32(v378, v378);
  float32x2_t v380 = vsub_f32(v375, (float32x2_t)a7->var0[4].var0[5]);
  float32x2_t v381 = vmul_f32(v380, v380);
  float32x2_t v382 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v377, 1), v377), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v381, 1), v381));
  float32x2_t v383 = vsub_f32(v375, (float32x2_t)a5->var0[4].var0[5]);
  float32x2_t v384 = vmul_f32(v383, v383);
  float32x2_t v385 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v379, 1), v379), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v384, 1), v384));
  float32x2_t v386 = v16[6];
  float32x2_t v387 = v16[7];
  float32x2_t v388 = vsub_f32(v386, (float32x2_t)a7->var0[4].var0[6]);
  float32x2_t v389 = vmul_f32(v388, v388);
  float32x2_t v390 = (float32x2_t)a5->var0[4].var0[7];
  float32x2_t v391 = vsub_f32(v386, (float32x2_t)a5->var0[4].var0[6]);
  float32x2_t v392 = vmul_f32(v391, v391);
  float32x2_t v393 = vsub_f32(v387, (float32x2_t)a7->var0[4].var0[7]);
  float32x2_t v394 = vmul_f32(v393, v393);
  float32x2_t v693 = vsqrt_f32(v382);
  float32x2_t v694 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v389, 1), v389), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v394, 1), v394)));
  float32x2_t v395 = vsub_f32(v387, v390);
  float32x2_t v396 = vmul_f32(v395, v395);
  float32x2_t v749 = vsqrt_f32(v385);
  float32x2_t v750 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v392, 1), v392), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v396, 1), v396)));
  float32x2_t v397 = v16[8];
  float32x2_t v398 = v16[9];
  float32x2_t v399 = vsub_f32(v397, (float32x2_t)a7->var0[4].var0[8]);
  float32x2_t v400 = vmul_f32(v399, v399);
  float32x2_t v401 = vsub_f32(v397, (float32x2_t)a5->var0[4].var0[8]);
  float32x2_t v402 = vmul_f32(v401, v401);
  float32x2_t v403 = vsub_f32(v398, (float32x2_t)a7->var0[4].var0[9]);
  float32x2_t v404 = vmul_f32(v403, v403);
  float32x2_t v405 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v400, 1), v400), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v404, 1), v404)));
  float32x2_t v406 = vsub_f32(v398, (float32x2_t)a5->var0[4].var0[9]);
  float32x2_t v407 = vmul_f32(v406, v406);
  float32x2_t v408 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v402, 1), v402), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v407, 1), v407)));
  float32x2_t v409 = v16[10];
  float32x2_t v410 = v16[11];
  float32x2_t v411 = vsub_f32(v409, (float32x2_t)a7->var0[4].var0[10]);
  float32x2_t v412 = vmul_f32(v411, v411);
  float32x2_t v413 = vsub_f32(v409, (float32x2_t)a5->var0[4].var0[10]);
  float32x2_t v414 = vmul_f32(v413, v413);
  float32x2_t v415 = vsub_f32(v410, (float32x2_t)a7->var0[4].var0[11]);
  float32x2_t v416 = vmul_f32(v415, v415);
  float32x2_t v695 = v405;
  float32x2_t v696 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v412, 1), v412), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v416, 1), v416)));
  float32x2_t v417 = vsub_f32(v410, (float32x2_t)a5->var0[4].var0[11]);
  float32x2_t v418 = vmul_f32(v417, v417);
  float32x2_t v751 = v408;
  float32x2_t v752 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v414, 1), v414), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v418, 1), v418)));
  float32x2_t v419 = v16[12];
  float32x2_t v420 = v16[13];
  float32x2_t v421 = vsub_f32(v419, (float32x2_t)a7->var0[4].var0[12]);
  float32x2_t v422 = vmul_f32(v421, v421);
  float32x2_t v423 = vsub_f32(v419, (float32x2_t)a5->var0[4].var0[12]);
  float32x2_t v424 = vmul_f32(v423, v423);
  float32x2_t v425 = vsub_f32(v420, (float32x2_t)a7->var0[4].var0[13]);
  float32x2_t v426 = vmul_f32(v425, v425);
  float32x2_t v427 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v422, 1), v422), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v426, 1), v426)));
  float32x2_t v428 = vsub_f32(v420, (float32x2_t)a5->var0[4].var0[13]);
  float32x2_t v429 = vmul_f32(v428, v428);
  float32x2_t v430 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v424, 1), v424), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v429, 1), v429)));
  float32x2_t v431 = v16[14];
  float32x2_t v432 = v16[15];
  float32x2_t v433 = vsub_f32(v431, (float32x2_t)a7->var0[5].var0[0]);
  float32x2_t v434 = vmul_f32(v433, v433);
  float32x2_t v435 = vsub_f32(v431, (float32x2_t)a5->var0[5].var0[0]);
  float32x2_t v436 = vmul_f32(v435, v435);
  float32x2_t v437 = vsub_f32(v432, (float32x2_t)a7->var0[5].var0[1]);
  float32x2_t v438 = vmul_f32(v437, v437);
  float32x2_t v697 = v427;
  float32x2_t v698 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v434, 1), v434), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v438, 1), v438)));
  float32x2_t v439 = vsub_f32(v432, (float32x2_t)a5->var0[5].var0[1]);
  float32x2_t v440 = vmul_f32(v439, v439);
  float32x2_t v753 = v430;
  float32x2_t v754 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v436, 1), v436), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v440, 1), v440)));
  float32x2_t v441 = v16[16];
  float32x2_t v442 = v16[17];
  float32x2_t v443 = vsub_f32(v441, (float32x2_t)a7->var0[5].var0[2]);
  float32x2_t v444 = vmul_f32(v443, v443);
  float32x2_t v445 = vsub_f32(v441, (float32x2_t)a5->var0[5].var0[2]);
  float32x2_t v446 = vmul_f32(v445, v445);
  float32x2_t v447 = vsub_f32(v442, (float32x2_t)a7->var0[5].var0[3]);
  float32x2_t v448 = vmul_f32(v447, v447);
  float32x2_t v449 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v444, 1), v444), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v448, 1), v448)));
  float32x2_t v450 = vsub_f32(v442, (float32x2_t)a5->var0[5].var0[3]);
  float32x2_t v451 = vmul_f32(v450, v450);
  float32x2_t v452 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v446, 1), v446), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v451, 1), v451)));
  float32x2_t v453 = v16[18];
  float32x2_t v454 = v16[19];
  float32x2_t v455 = vsub_f32(v453, (float32x2_t)a7->var0[5].var0[4]);
  float32x2_t v456 = vmul_f32(v455, v455);
  float32x2_t v457 = vsub_f32(v453, (float32x2_t)a5->var0[5].var0[4]);
  float32x2_t v458 = vmul_f32(v457, v457);
  float32x2_t v459 = vsub_f32(v454, (float32x2_t)a7->var0[5].var0[5]);
  float32x2_t v460 = vmul_f32(v459, v459);
  float32x2_t v699 = v449;
  float32x2_t v700 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v456, 1), v456), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v460, 1), v460)));
  float32x2_t v461 = vsub_f32(v454, (float32x2_t)a5->var0[5].var0[5]);
  float32x2_t v462 = vmul_f32(v461, v461);
  float32x2_t v755 = v452;
  float32x2_t v756 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v458, 1), v458), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v462, 1), v462)));
  float32x2_t v463 = v16[20];
  float32x2_t v464 = v16[21];
  float32x2_t v465 = vsub_f32(v463, (float32x2_t)a7->var0[5].var0[6]);
  float32x2_t v466 = vmul_f32(v465, v465);
  float32x2_t v467 = vsub_f32(v463, (float32x2_t)a5->var0[5].var0[6]);
  float32x2_t v468 = vmul_f32(v467, v467);
  float32x2_t v469 = vsub_f32(v464, (float32x2_t)a7->var0[5].var0[7]);
  float32x2_t v470 = vmul_f32(v469, v469);
  float32x2_t v471 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v466, 1), v466), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v470, 1), v470)));
  float32x2_t v472 = vsub_f32(v464, (float32x2_t)a5->var0[5].var0[7]);
  float32x2_t v473 = vmul_f32(v472, v472);
  float32x2_t v474 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v468, 1), v468), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v473, 1), v473)));
  float32x2_t v475 = v16[22];
  float32x2_t v476 = v16[23];
  float32x2_t v477 = vsub_f32(v475, (float32x2_t)a7->var0[5].var0[8]);
  float32x2_t v478 = vmul_f32(v477, v477);
  float32x2_t v479 = vsub_f32(v475, (float32x2_t)a5->var0[5].var0[8]);
  float32x2_t v480 = vmul_f32(v479, v479);
  float32x2_t v481 = vsub_f32(v476, (float32x2_t)a7->var0[5].var0[9]);
  float32x2_t v482 = vmul_f32(v481, v481);
  float32x2_t v701 = v471;
  float32x2_t v702 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v478, 1), v478), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v482, 1), v482)));
  float32x2_t v483 = vsub_f32(v476, (float32x2_t)a5->var0[5].var0[9]);
  float32x2_t v484 = vmul_f32(v483, v483);
  float32x2_t v757 = v474;
  float32x2_t v758 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v480, 1), v480), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v484, 1), v484)));
  float32x2_t v485 = v16[24];
  float32x2_t v486 = v16[25];
  float32x2_t v487 = vsub_f32(v485, (float32x2_t)a7->var0[5].var0[10]);
  float32x2_t v488 = vmul_f32(v487, v487);
  float32x2_t v489 = vsub_f32(v485, (float32x2_t)a5->var0[5].var0[10]);
  float32x2_t v490 = vmul_f32(v489, v489);
  float32x2_t v491 = vsub_f32(v486, (float32x2_t)a7->var0[5].var0[11]);
  float32x2_t v492 = vmul_f32(v491, v491);
  float32x2_t v493 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v488, 1), v488), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v492, 1), v492)));
  float32x2_t v494 = vsub_f32(v486, (float32x2_t)a5->var0[5].var0[11]);
  float32x2_t v495 = vmul_f32(v494, v494);
  float32x2_t v496 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v490, 1), v490), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v495, 1), v495)));
  float32x2_t v497 = v16[26];
  float32x2_t v498 = v16[27];
  float32x2_t v499 = vsub_f32(v497, (float32x2_t)a7->var0[5].var0[12]);
  float32x2_t v500 = vmul_f32(v499, v499);
  float32x2_t v501 = vsub_f32(v497, (float32x2_t)a5->var0[5].var0[12]);
  float32x2_t v502 = vmul_f32(v501, v501);
  float32x2_t v503 = vsub_f32(v498, (float32x2_t)a7->var0[5].var0[13]);
  float32x2_t v504 = vmul_f32(v503, v503);
  float32x2_t v703 = v493;
  float32x2_t v704 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v500, 1), v500), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v504, 1), v504)));
  float32x2_t v505 = vsub_f32(v498, (float32x2_t)a5->var0[5].var0[13]);
  float32x2_t v506 = vmul_f32(v505, v505);
  float32x2_t v759 = v496;
  float32x2_t v760 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v502, 1), v502), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v506, 1), v506)));
  float32x2_t v507 = v16[28];
  float32x2_t v508 = v16[29];
  float32x2_t v509 = vsub_f32(v507, (float32x2_t)a7->var0[6].var0[0]);
  float32x2_t v510 = vmul_f32(v509, v509);
  float32x2_t v511 = vsub_f32(v507, (float32x2_t)a5->var0[6].var0[0]);
  float32x2_t v512 = vmul_f32(v511, v511);
  float32x2_t v513 = vsub_f32(v508, (float32x2_t)a7->var0[6].var0[1]);
  float32x2_t v514 = vmul_f32(v513, v513);
  float32x2_t v515 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v510, 1), v510), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v514, 1), v514)));
  float32x2_t v516 = vsub_f32(v508, (float32x2_t)a5->var0[6].var0[1]);
  float32x2_t v517 = vmul_f32(v516, v516);
  float32x2_t v518 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v512, 1), v512), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v517, 1), v517)));
  float32x2_t v519 = v16[30];
  float32x2_t v520 = v16[31];
  float32x2_t v521 = vsub_f32(v519, (float32x2_t)a7->var0[6].var0[2]);
  float32x2_t v522 = vmul_f32(v521, v521);
  float32x2_t v523 = vsub_f32(v519, (float32x2_t)a5->var0[6].var0[2]);
  float32x2_t v524 = vmul_f32(v523, v523);
  float32x2_t v525 = vsub_f32(v520, (float32x2_t)a7->var0[6].var0[3]);
  float32x2_t v526 = vmul_f32(v525, v525);
  float32x2_t v705 = v515;
  float32x2_t v706 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v522, 1), v522), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v526, 1), v526)));
  float32x2_t v527 = vsub_f32(v520, (float32x2_t)a5->var0[6].var0[3]);
  float32x2_t v528 = vmul_f32(v527, v527);
  float32x2_t v761 = v518;
  float32x2_t v762 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v524, 1), v524), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v528, 1), v528)));
  float32x2_t v529 = v16[32];
  float32x2_t v530 = v16[33];
  float32x2_t v531 = vsub_f32(v529, (float32x2_t)a7->var0[6].var0[4]);
  float32x2_t v532 = vmul_f32(v531, v531);
  float32x2_t v533 = vsub_f32(v529, (float32x2_t)a5->var0[6].var0[4]);
  float32x2_t v534 = vmul_f32(v533, v533);
  float32x2_t v535 = vsub_f32(v530, (float32x2_t)a7->var0[6].var0[5]);
  float32x2_t v536 = vmul_f32(v535, v535);
  float32x2_t v537 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v532, 1), v532), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v536, 1), v536)));
  float32x2_t v538 = vsub_f32(v530, (float32x2_t)a5->var0[6].var0[5]);
  float32x2_t v539 = vmul_f32(v538, v538);
  float32x2_t v540 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v534, 1), v534), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v539, 1), v539)));
  float32x2_t v541 = v16[34];
  float32x2_t v542 = v16[35];
  float32x2_t v543 = vsub_f32(v541, (float32x2_t)a7->var0[6].var0[6]);
  float32x2_t v544 = vmul_f32(v543, v543);
  float32x2_t v545 = vsub_f32(v541, (float32x2_t)a5->var0[6].var0[6]);
  float32x2_t v546 = vmul_f32(v545, v545);
  float32x2_t v547 = vsub_f32(v542, (float32x2_t)a7->var0[6].var0[7]);
  float32x2_t v548 = vmul_f32(v547, v547);
  float32x2_t v707 = v537;
  float32x2_t v708 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v544, 1), v544), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v548, 1), v548)));
  float32x2_t v549 = vsub_f32(v542, (float32x2_t)a5->var0[6].var0[7]);
  float32x2_t v550 = vmul_f32(v549, v549);
  float32x2_t v763 = v540;
  float32x2_t v764 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v546, 1), v546), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v550, 1), v550)));
  float32x2_t v551 = v16[36];
  float32x2_t v552 = v16[37];
  float32x2_t v553 = vsub_f32(v551, (float32x2_t)a7->var0[6].var0[8]);
  float32x2_t v554 = vmul_f32(v553, v553);
  float32x2_t v555 = vsub_f32(v551, (float32x2_t)a5->var0[6].var0[8]);
  float32x2_t v556 = vmul_f32(v555, v555);
  float32x2_t v557 = vsub_f32(v552, (float32x2_t)a7->var0[6].var0[9]);
  float32x2_t v558 = vmul_f32(v557, v557);
  float32x2_t v559 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v554, 1), v554), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v558, 1), v558)));
  float32x2_t v560 = vsub_f32(v552, (float32x2_t)a5->var0[6].var0[9]);
  float32x2_t v561 = vmul_f32(v560, v560);
  float32x2_t v562 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v556, 1), v556), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v561, 1), v561)));
  float32x2_t v563 = v16[38];
  float32x2_t v564 = v16[39];
  float32x2_t v565 = vsub_f32(v563, (float32x2_t)a7->var0[6].var0[10]);
  float32x2_t v566 = vmul_f32(v565, v565);
  float32x2_t v567 = vsub_f32(v563, (float32x2_t)a5->var0[6].var0[10]);
  float32x2_t v568 = vmul_f32(v567, v567);
  float32x2_t v569 = vsub_f32(v564, (float32x2_t)a7->var0[6].var0[11]);
  float32x2_t v570 = vmul_f32(v569, v569);
  float32x2_t v709 = v559;
  float32x2_t v710 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v566, 1), v566), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v570, 1), v570)));
  float32x2_t v571 = vsub_f32(v564, (float32x2_t)a5->var0[6].var0[11]);
  float32x2_t v572 = vmul_f32(v571, v571);
  float32x2_t v765 = v562;
  float32x2_t v766 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v568, 1), v568), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v572, 1), v572)));
  float32x2_t v573 = v16[40];
  float32x2_t v574 = v16[41];
  float32x2_t v575 = vsub_f32(v573, (float32x2_t)a7->var0[6].var0[12]);
  float32x2_t v576 = vmul_f32(v575, v575);
  float32x2_t v577 = vsub_f32(v573, (float32x2_t)a5->var0[6].var0[12]);
  float32x2_t v578 = vmul_f32(v577, v577);
  float32x2_t v579 = vsub_f32(v574, (float32x2_t)a7->var0[6].var0[13]);
  float32x2_t v580 = vmul_f32(v579, v579);
  float32x2_t v581 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v576, 1), v576), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v580, 1), v580)));
  float32x2_t v582 = vsub_f32(v574, (float32x2_t)a5->var0[6].var0[13]);
  float32x2_t v583 = vmul_f32(v582, v582);
  float32x2_t v584 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v578, 1), v578), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v583, 1), v583)));
  float32x2_t v585 = v15[1];
  float32x2_t v586 = vsub_f32(*v15, (float32x2_t)a7->var0[7].var0[0]);
  float32x2_t v587 = vmul_f32(v586, v586);
  float32x2_t v588 = vsub_f32(*v15, (float32x2_t)a5->var0[7].var0[0]);
  float32x2_t v589 = vmul_f32(v588, v588);
  float32x2_t v590 = vsub_f32(v585, (float32x2_t)a7->var0[7].var0[1]);
  float32x2_t v591 = vmul_f32(v590, v590);
  float32x2_t v711 = v581;
  float32x2_t v712 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v587, 1), v587), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v591, 1), v591)));
  float32x2_t v592 = vsub_f32(v585, (float32x2_t)a5->var0[7].var0[1]);
  float32x2_t v593 = vmul_f32(v592, v592);
  float32x2_t v767 = v584;
  float32x2_t v768 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v589, 1), v589), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v593, 1), v593)));
  float32x2_t v594 = v15[2];
  float32x2_t v595 = v15[3];
  float32x2_t v596 = vsub_f32(v594, (float32x2_t)a7->var0[7].var0[2]);
  float32x2_t v597 = vmul_f32(v596, v596);
  float32x2_t v598 = vsub_f32(v594, (float32x2_t)a5->var0[7].var0[2]);
  float32x2_t v599 = vmul_f32(v598, v598);
  float32x2_t v600 = vsub_f32(v595, (float32x2_t)a7->var0[7].var0[3]);
  float32x2_t v601 = vmul_f32(v600, v600);
  float32x2_t v602 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v597, 1), v597), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v601, 1), v601)));
  float32x2_t v603 = vsub_f32(v595, (float32x2_t)a5->var0[7].var0[3]);
  float32x2_t v604 = vmul_f32(v603, v603);
  float32x2_t v605 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v599, 1), v599), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v604, 1), v604)));
  float32x2_t v606 = v15[4];
  float32x2_t v607 = v15[5];
  float32x2_t v608 = vsub_f32(v606, (float32x2_t)a7->var0[7].var0[4]);
  float32x2_t v609 = vmul_f32(v608, v608);
  float32x2_t v610 = vsub_f32(v606, (float32x2_t)a5->var0[7].var0[4]);
  float32x2_t v611 = vmul_f32(v610, v610);
  float32x2_t v612 = vsub_f32(v607, (float32x2_t)a7->var0[7].var0[5]);
  float32x2_t v613 = vmul_f32(v612, v612);
  float32x2_t v713 = v602;
  float32x2_t v714 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v609, 1), v609), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v613, 1), v613)));
  float32x2_t v614 = vsub_f32(v607, (float32x2_t)a5->var0[7].var0[5]);
  float32x2_t v615 = vmul_f32(v614, v614);
  float32x2_t v769 = v605;
  float32x2_t v770 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v611, 1), v611), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v615, 1), v615)));
  float32x2_t v616 = v15[6];
  float32x2_t v617 = v15[7];
  float32x2_t v618 = vsub_f32(v616, (float32x2_t)a7->var0[7].var0[6]);
  float32x2_t v619 = vmul_f32(v618, v618);
  float32x2_t v620 = vsub_f32(v616, (float32x2_t)a5->var0[7].var0[6]);
  float32x2_t v621 = vmul_f32(v620, v620);
  float32x2_t v622 = vsub_f32(v617, (float32x2_t)a7->var0[7].var0[7]);
  float32x2_t v623 = vmul_f32(v622, v622);
  float32x2_t v624 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v619, 1), v619), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v623, 1), v623)));
  float32x2_t v625 = vsub_f32(v617, (float32x2_t)a5->var0[7].var0[7]);
  float32x2_t v626 = vmul_f32(v625, v625);
  float32x2_t v627 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v621, 1), v621), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v626, 1), v626)));
  float32x2_t v628 = v15[8];
  float32x2_t v629 = v15[9];
  float32x2_t v630 = vsub_f32(v628, (float32x2_t)a7->var0[7].var0[8]);
  float32x2_t v631 = vmul_f32(v630, v630);
  float32x2_t v632 = vsub_f32(v628, (float32x2_t)a5->var0[7].var0[8]);
  float32x2_t v633 = vmul_f32(v632, v632);
  float32x2_t v634 = vsub_f32(v629, (float32x2_t)a7->var0[7].var0[9]);
  float32x2_t v635 = vmul_f32(v634, v634);
  float32x2_t v715 = v624;
  float32x2_t v716 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v631, 1), v631), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v635, 1), v635)));
  float32x2_t v636 = vsub_f32(v629, (float32x2_t)a5->var0[7].var0[9]);
  float32x2_t v637 = vmul_f32(v636, v636);
  float32x2_t v771 = v627;
  float32x2_t v772 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v633, 1), v633), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v637, 1), v637)));
  float32x2_t v638 = v15[10];
  float32x2_t v639 = v15[11];
  float32x2_t v640 = vsub_f32(v638, (float32x2_t)a7->var0[7].var0[10]);
  float32x2_t v641 = vmul_f32(v640, v640);
  float32x2_t v642 = vsub_f32(v638, (float32x2_t)a5->var0[7].var0[10]);
  float32x2_t v643 = vmul_f32(v642, v642);
  float32x2_t v644 = vsub_f32(v639, (float32x2_t)a7->var0[7].var0[11]);
  float32x2_t v645 = vmul_f32(v644, v644);
  float32x2_t v646 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v641, 1), v641), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v645, 1), v645));
  float32x2_t v647 = vsub_f32(v639, (float32x2_t)a5->var0[7].var0[11]);
  float32x2_t v648 = vmul_f32(v647, v647);
  float32x2_t v649 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v643, 1), v643), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v648, 1), v648));
  float32x2_t v650 = v15[12];
  float32x2_t v651 = v15[13];
  float32x2_t v652 = vsub_f32(v650, (float32x2_t)a7->var0[7].var0[12]);
  float32x2_t v653 = vmul_f32(v652, v652);
  float32x2_t v654 = vsub_f32(v651, (float32x2_t)a7->var0[7].var0[13]);
  float32x2_t v655 = vmul_f32(v654, v654);
  float32x2_t v656 = (float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v653, 1), v653), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v655, 1), v655));
  float32x2_t v657 = (float32x2_t)a5->var0[7].var0[12];
  float32x2_t v717 = vsqrt_f32(v646);
  float32x2_t v718 = vsqrt_f32(v656);
  float32x2_t v658 = vsub_f32(v650, v657);
  float32x2_t v659 = vmul_f32(v658, v658);
  float32x2_t v660 = vsub_f32(v651, (float32x2_t)a5->var0[7].var0[13]);
  float32x2_t v661 = vmul_f32(v660, v660);
  float32x2_t v773 = vsqrt_f32(v649);
  float32x2_t v774 = vsqrt_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v659, 1), v659), (int32x2_t)vadd_f32((float32x2_t)vdup_lane_s32((int32x2_t)v661, 1), v661)));
  if (v18) {
    operator new[]();
  }
  operator new[]();
}

- (BOOL)conditionsForHomography
{
  return 1;
}

- (int)blockSmoothing:(void *)a3 localNa:(const void *)a4 specsOut:(void *)a5 numOfFrames:(unint64_t)a6 smoothedSpotsLoc:(id *)a7 validSpotsIndexes:(void *)a8 numOfValidSpots:(unsigned int *)a9 smoothedSNR:(void *)a10 smoothedSNa:(void *)a11
{
  ((void (*)(GmoEngine *, SEL, void *))MEMORY[0x270FA5388])(self, a2, a3);
  long long v12 = v11;
  uint64_t v647 = v13;
  unint64_t v15 = v14;
  int v17 = v16;
  float32x2_t v19 = v18;
  uint64_t v689 = *MEMORY[0x263EF8340];
  *a9 = 0;
  float32x2_t v20 = (unsigned char *)*v11;
  float32x2_t v648 = v11;
  float32x2_t v22 = v21;
  if (v11[2] - *v11 >= 0xEuLL) {
    goto LABEL_22;
  }
  float32x2_t v23 = (unsigned char *)v11[1];
  float32x2_t v24 = operator new(0xEuLL);
  unint64_t v25 = v23 - v20;
  float32x2_t v26 = &v24[v23 - v20];
  float32x2_t v27 = v26;
  if (v23 != v20)
  {
    if (v25 < 8)
    {
      float32x2_t v28 = &v24[v23 - v20];
      goto LABEL_17;
    }
    float32x2_t v28 = &v24[v23 - v20];
    if ((unint64_t)(v20 - v24) >= 0x20)
    {
      if (v25 >= 0x20)
      {
        unint64_t v29 = v25 & 0xFFFFFFFFFFFFFFE0;
        float32x2_t v30 = (long long *)(v23 - 16);
        float32x2_t v31 = &v24[v23 - 16 - v20];
        unint64_t v32 = v25 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v33 = *v30;
          *(v31 - 1) = *(v30 - 1);
          *float32x2_t v31 = v33;
          v31 -= 2;
          v30 -= 2;
          v32 -= 32;
        }
        while (v32);
        if (v25 == v29) {
          goto LABEL_19;
        }
        if ((v25 & 0x18) == 0)
        {
          float32x2_t v28 = &v26[-v29];
          v23 -= v29;
          goto LABEL_17;
        }
      }
      else
      {
        unint64_t v29 = 0;
      }
      unint64_t v34 = v29 - (v25 & 0xFFFFFFFFFFFFFFF8);
      float32x2_t v35 = &v23[-v29 - 8];
      int64_t v36 = v35 - v20;
      do
      {
        uint64_t v37 = *(void *)v35;
        v35 -= 8;
        *(void *)&v24[v36] = v37;
        v36 -= 8;
        v34 += 8;
      }
      while (v34);
      if (v25 == (v25 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_19;
      }
      float32x2_t v28 = &v26[-(v25 & 0xFFFFFFFFFFFFFFF8)];
      v23 -= v25 & 0xFFFFFFFFFFFFFFF8;
    }
LABEL_17:
    float32x2_t v38 = v28 - 1;
    do
    {
      char v39 = *--v23;
      *v38-- = v39;
    }
    while (v23 != v20);
LABEL_19:
    float32x2_t v27 = v24;
  }
  long long v12 = v648;
  *float32x2_t v648 = v27;
  v648[1] = v26;
  v648[2] = v24 + 14;
  if (v20) {
    operator delete(v20);
  }
LABEL_22:
  float32x2_t v40 = (unsigned char *)v12[3];
  if (v12[5] - (void)v40 > 0xDuLL) {
    goto LABEL_43;
  }
  float32x2_t v41 = (unsigned char *)v12[4];
  float32x2_t v42 = operator new(0xEuLL);
  unint64_t v43 = v41 - v40;
  float32x2_t v44 = &v42[v41 - v40];
  float32x2_t v45 = v44;
  if (v41 != v40)
  {
    if (v43 < 8)
    {
      float32x2_t v46 = &v42[v41 - v40];
      goto LABEL_38;
    }
    float32x2_t v46 = &v42[v41 - v40];
    if ((unint64_t)(v40 - v42) >= 0x20)
    {
      if (v43 >= 0x20)
      {
        unint64_t v47 = v43 & 0xFFFFFFFFFFFFFFE0;
        float32x2_t v48 = (long long *)(v41 - 16);
        float32x2_t v49 = &v42[v41 - 16 - v40];
        unint64_t v50 = v43 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v51 = *v48;
          *(v49 - 1) = *(v48 - 1);
          *float32x2_t v49 = v51;
          v49 -= 2;
          v48 -= 2;
          v50 -= 32;
        }
        while (v50);
        if (v43 == v47) {
          goto LABEL_40;
        }
        if ((v43 & 0x18) == 0)
        {
          float32x2_t v46 = &v44[-v47];
          v41 -= v47;
          goto LABEL_38;
        }
      }
      else
      {
        unint64_t v47 = 0;
      }
      unint64_t v52 = v47 - (v43 & 0xFFFFFFFFFFFFFFF8);
      float32x2_t v53 = &v41[-v47 - 8];
      int64_t v54 = v53 - v40;
      do
      {
        uint64_t v55 = *(void *)v53;
        v53 -= 8;
        *(void *)&v42[v54] = v55;
        v54 -= 8;
        v52 += 8;
      }
      while (v52);
      if (v43 == (v43 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_40;
      }
      float32x2_t v46 = &v44[-(v43 & 0xFFFFFFFFFFFFFFF8)];
      v41 -= v43 & 0xFFFFFFFFFFFFFFF8;
    }
LABEL_38:
    float32x2_t v56 = v46 - 1;
    do
    {
      char v57 = *--v41;
      *v56-- = v57;
    }
    while (v41 != v40);
LABEL_40:
    float32x2_t v45 = v42;
  }
  long long v12 = v648;
  v648[3] = v45;
  v648[4] = v44;
  v648[5] = v42 + 14;
  if (v40) {
    operator delete(v40);
  }
LABEL_43:
  float32x2_t v58 = (unsigned char *)v12[6];
  if (v12[8] - (void)v58 > 0xDuLL) {
    goto LABEL_64;
  }
  float32x2_t v59 = (unsigned char *)v12[7];
  float32x2_t v60 = operator new(0xEuLL);
  unint64_t v61 = v59 - v58;
  float32x2_t v62 = &v60[v59 - v58];
  float32x2_t v63 = v62;
  if (v59 != v58)
  {
    if (v61 < 8)
    {
      float32x2_t v64 = &v60[v59 - v58];
      goto LABEL_59;
    }
    float32x2_t v64 = &v60[v59 - v58];
    if ((unint64_t)(v58 - v60) >= 0x20)
    {
      if (v61 >= 0x20)
      {
        unint64_t v65 = v61 & 0xFFFFFFFFFFFFFFE0;
        float32x2_t v66 = (long long *)(v59 - 16);
        float32x2_t v67 = &v60[v59 - 16 - v58];
        unint64_t v68 = v61 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v69 = *v66;
          *(v67 - 1) = *(v66 - 1);
          *float32x2_t v67 = v69;
          v67 -= 2;
          v66 -= 2;
          v68 -= 32;
        }
        while (v68);
        if (v61 == v65) {
          goto LABEL_61;
        }
        if ((v61 & 0x18) == 0)
        {
          float32x2_t v64 = &v62[-v65];
          v59 -= v65;
          goto LABEL_59;
        }
      }
      else
      {
        unint64_t v65 = 0;
      }
      unint64_t v70 = v65 - (v61 & 0xFFFFFFFFFFFFFFF8);
      float32x2_t v71 = &v59[-v65 - 8];
      int64_t v72 = v71 - v58;
      do
      {
        uint64_t v73 = *(void *)v71;
        v71 -= 8;
        *(void *)&v60[v72] = v73;
        v72 -= 8;
        v70 += 8;
      }
      while (v70);
      if (v61 == (v61 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_61;
      }
      float32x2_t v64 = &v62[-(v61 & 0xFFFFFFFFFFFFFFF8)];
      v59 -= v61 & 0xFFFFFFFFFFFFFFF8;
    }
LABEL_59:
    float32x2_t v74 = v64 - 1;
    do
    {
      char v75 = *--v59;
      *v74-- = v75;
    }
    while (v59 != v58);
LABEL_61:
    float32x2_t v63 = v60;
  }
  long long v12 = v648;
  v648[6] = v63;
  v648[7] = v62;
  v648[8] = v60 + 14;
  if (v58) {
    operator delete(v58);
  }
LABEL_64:
  float32x2_t v76 = (unsigned char *)v12[9];
  if (v12[11] - (void)v76 > 0xDuLL) {
    goto LABEL_85;
  }
  float32x2_t v77 = (unsigned char *)v12[10];
  float32x2_t v78 = operator new(0xEuLL);
  unint64_t v79 = v77 - v76;
  float32x2_t v80 = &v78[v77 - v76];
  float32x2_t v81 = v80;
  if (v77 != v76)
  {
    if (v79 < 8)
    {
      float32x2_t v82 = &v78[v77 - v76];
      goto LABEL_80;
    }
    float32x2_t v82 = &v78[v77 - v76];
    if ((unint64_t)(v76 - v78) >= 0x20)
    {
      if (v79 >= 0x20)
      {
        unint64_t v83 = v79 & 0xFFFFFFFFFFFFFFE0;
        float32x2_t v84 = (long long *)(v77 - 16);
        float32x2_t v85 = &v78[v77 - 16 - v76];
        unint64_t v86 = v79 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v87 = *v84;
          *(v85 - 1) = *(v84 - 1);
          *float32x2_t v85 = v87;
          v85 -= 2;
          v84 -= 2;
          v86 -= 32;
        }
        while (v86);
        if (v79 == v83) {
          goto LABEL_82;
        }
        if ((v79 & 0x18) == 0)
        {
          float32x2_t v82 = &v80[-v83];
          v77 -= v83;
          goto LABEL_80;
        }
      }
      else
      {
        unint64_t v83 = 0;
      }
      unint64_t v88 = v83 - (v79 & 0xFFFFFFFFFFFFFFF8);
      float32x2_t v89 = &v77[-v83 - 8];
      int64_t v90 = v89 - v76;
      do
      {
        uint64_t v91 = *(void *)v89;
        v89 -= 8;
        *(void *)&v78[v90] = v91;
        v90 -= 8;
        v88 += 8;
      }
      while (v88);
      if (v79 == (v79 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_82;
      }
      float32x2_t v82 = &v80[-(v79 & 0xFFFFFFFFFFFFFFF8)];
      v77 -= v79 & 0xFFFFFFFFFFFFFFF8;
    }
LABEL_80:
    float32x2_t v92 = v82 - 1;
    do
    {
      char v93 = *--v77;
      *v92-- = v93;
    }
    while (v77 != v76);
LABEL_82:
    float32x2_t v81 = v78;
  }
  long long v12 = v648;
  v648[9] = v81;
  v648[10] = v80;
  v648[11] = v78 + 14;
  if (v76) {
    operator delete(v76);
  }
LABEL_85:
  float32x2_t v94 = (unsigned char *)v12[12];
  if (v12[14] - (void)v94 > 0xDuLL) {
    goto LABEL_106;
  }
  float32x2_t v95 = (unsigned char *)v12[13];
  float32x2_t v96 = operator new(0xEuLL);
  unint64_t v97 = v95 - v94;
  float32x2_t v98 = &v96[v95 - v94];
  float32x2_t v99 = v98;
  if (v95 != v94)
  {
    if (v97 < 8)
    {
      float32x2_t v100 = &v96[v95 - v94];
      goto LABEL_101;
    }
    float32x2_t v100 = &v96[v95 - v94];
    if ((unint64_t)(v94 - v96) >= 0x20)
    {
      if (v97 >= 0x20)
      {
        unint64_t v101 = v97 & 0xFFFFFFFFFFFFFFE0;
        float32x2_t v102 = (long long *)(v95 - 16);
        float32x2_t v103 = &v96[v95 - 16 - v94];
        unint64_t v104 = v97 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v105 = *v102;
          *(v103 - 1) = *(v102 - 1);
          _OWORD *v103 = v105;
          v103 -= 2;
          v102 -= 2;
          v104 -= 32;
        }
        while (v104);
        if (v97 == v101) {
          goto LABEL_103;
        }
        if ((v97 & 0x18) == 0)
        {
          float32x2_t v100 = &v98[-v101];
          v95 -= v101;
          goto LABEL_101;
        }
      }
      else
      {
        unint64_t v101 = 0;
      }
      unint64_t v106 = v101 - (v97 & 0xFFFFFFFFFFFFFFF8);
      float32x2_t v107 = &v95[-v101 - 8];
      int64_t v108 = v107 - v94;
      do
      {
        uint64_t v109 = *(void *)v107;
        v107 -= 8;
        *(void *)&v96[v108] = v109;
        v108 -= 8;
        v106 += 8;
      }
      while (v106);
      if (v97 == (v97 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_103;
      }
      float32x2_t v100 = &v98[-(v97 & 0xFFFFFFFFFFFFFFF8)];
      v95 -= v97 & 0xFFFFFFFFFFFFFFF8;
    }
LABEL_101:
    float32x2_t v110 = v100 - 1;
    do
    {
      char v111 = *--v95;
      *v110-- = v111;
    }
    while (v95 != v94);
LABEL_103:
    float32x2_t v99 = v96;
  }
  long long v12 = v648;
  v648[12] = v99;
  v648[13] = v98;
  v648[14] = v96 + 14;
  if (v94) {
    operator delete(v94);
  }
LABEL_106:
  float32x2_t v112 = (unsigned char *)v12[15];
  if (v12[17] - (void)v112 > 0xDuLL) {
    goto LABEL_127;
  }
  float32x2_t v113 = (unsigned char *)v12[16];
  float32x2_t v114 = operator new(0xEuLL);
  unint64_t v115 = v113 - v112;
  float32x2_t v116 = &v114[v113 - v112];
  float32x2_t v117 = v116;
  if (v113 != v112)
  {
    if (v115 < 8)
    {
      float32x2_t v118 = &v114[v113 - v112];
      goto LABEL_122;
    }
    float32x2_t v118 = &v114[v113 - v112];
    if ((unint64_t)(v112 - v114) >= 0x20)
    {
      if (v115 >= 0x20)
      {
        unint64_t v119 = v115 & 0xFFFFFFFFFFFFFFE0;
        float32x2_t v120 = (long long *)(v113 - 16);
        float32x2_t v121 = &v114[v113 - 16 - v112];
        unint64_t v122 = v115 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v123 = *v120;
          *(v121 - 1) = *(v120 - 1);
          *float32x2_t v121 = v123;
          v121 -= 2;
          v120 -= 2;
          v122 -= 32;
        }
        while (v122);
        if (v115 == v119) {
          goto LABEL_124;
        }
        if ((v115 & 0x18) == 0)
        {
          float32x2_t v118 = &v116[-v119];
          v113 -= v119;
          goto LABEL_122;
        }
      }
      else
      {
        unint64_t v119 = 0;
      }
      unint64_t v124 = v119 - (v115 & 0xFFFFFFFFFFFFFFF8);
      float32x2_t v125 = &v113[-v119 - 8];
      int64_t v126 = v125 - v112;
      do
      {
        uint64_t v127 = *(void *)v125;
        v125 -= 8;
        *(void *)&v114[v126] = v127;
        v126 -= 8;
        v124 += 8;
      }
      while (v124);
      if (v115 == (v115 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_124;
      }
      float32x2_t v118 = &v116[-(v115 & 0xFFFFFFFFFFFFFFF8)];
      v113 -= v115 & 0xFFFFFFFFFFFFFFF8;
    }
LABEL_122:
    float32x2_t v128 = v118 - 1;
    do
    {
      char v129 = *--v113;
      *v128-- = v129;
    }
    while (v113 != v112);
LABEL_124:
    float32x2_t v117 = v114;
  }
  long long v12 = v648;
  v648[15] = v117;
  v648[16] = v116;
  v648[17] = v114 + 14;
  if (v112) {
    operator delete(v112);
  }
LABEL_127:
  float32x2_t v130 = (unsigned char *)v12[18];
  if (v12[20] - (void)v130 > 0xDuLL) {
    goto LABEL_148;
  }
  float32x2_t v131 = (unsigned char *)v12[19];
  float32x2_t v132 = operator new(0xEuLL);
  unint64_t v133 = v131 - v130;
  float32x2_t v134 = &v132[v131 - v130];
  float32x2_t v135 = v134;
  if (v131 != v130)
  {
    if (v133 < 8)
    {
      float32x2_t v136 = &v132[v131 - v130];
      goto LABEL_143;
    }
    float32x2_t v136 = &v132[v131 - v130];
    if ((unint64_t)(v130 - v132) >= 0x20)
    {
      if (v133 >= 0x20)
      {
        unint64_t v137 = v133 & 0xFFFFFFFFFFFFFFE0;
        float32x2_t v138 = (long long *)(v131 - 16);
        float32x2_t v139 = &v132[v131 - 16 - v130];
        unint64_t v140 = v133 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v141 = *v138;
          *(v139 - 1) = *(v138 - 1);
          *float32x2_t v139 = v141;
          v139 -= 2;
          v138 -= 2;
          v140 -= 32;
        }
        while (v140);
        if (v133 == v137) {
          goto LABEL_145;
        }
        if ((v133 & 0x18) == 0)
        {
          float32x2_t v136 = &v134[-v137];
          v131 -= v137;
          goto LABEL_143;
        }
      }
      else
      {
        unint64_t v137 = 0;
      }
      unint64_t v142 = v137 - (v133 & 0xFFFFFFFFFFFFFFF8);
      float32x2_t v143 = &v131[-v137 - 8];
      int64_t v144 = v143 - v130;
      do
      {
        uint64_t v145 = *(void *)v143;
        v143 -= 8;
        *(void *)&v132[v144] = v145;
        v144 -= 8;
        v142 += 8;
      }
      while (v142);
      if (v133 == (v133 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_145;
      }
      float32x2_t v136 = &v134[-(v133 & 0xFFFFFFFFFFFFFFF8)];
      v131 -= v133 & 0xFFFFFFFFFFFFFFF8;
    }
LABEL_143:
    float32x2_t v146 = v136 - 1;
    do
    {
      char v147 = *--v131;
      *v146-- = v147;
    }
    while (v131 != v130);
LABEL_145:
    float32x2_t v135 = v132;
  }
  long long v12 = v648;
  v648[18] = v135;
  v648[19] = v134;
  v648[20] = v132 + 14;
  if (v130) {
    operator delete(v130);
  }
LABEL_148:
  float32x2_t v148 = (unsigned char *)v12[21];
  if (v12[23] - (void)v148 <= 0xDuLL)
  {
    float32x2_t v149 = (unsigned char *)v648[22];
    float32x2_t v150 = operator new(0xEuLL);
    unint64_t v151 = v149 - v148;
    float32x2_t v152 = &v150[v149 - v148];
    float32x2_t v153 = v152;
    if (v149 == v148) {
      goto LABEL_167;
    }
    if (v151 < 8)
    {
      float32x2_t v154 = &v150[v149 - v148];
      goto LABEL_164;
    }
    float32x2_t v154 = &v150[v149 - v148];
    if ((unint64_t)(v148 - v150) >= 0x20)
    {
      if (v151 >= 0x20)
      {
        unint64_t v155 = v151 & 0xFFFFFFFFFFFFFFE0;
        float32x2_t v156 = (long long *)(v149 - 16);
        float32x2_t v157 = &v150[v149 - 16 - v148];
        unint64_t v158 = v151 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v159 = *v156;
          *(v157 - 1) = *(v156 - 1);
          *float32x2_t v157 = v159;
          v157 -= 2;
          v156 -= 2;
          v158 -= 32;
        }
        while (v158);
        if (v151 == v155) {
          goto LABEL_166;
        }
        if ((v151 & 0x18) == 0)
        {
          float32x2_t v154 = &v152[-v155];
          v149 -= v155;
          goto LABEL_164;
        }
      }
      else
      {
        unint64_t v155 = 0;
      }
      unint64_t v160 = v155 - (v151 & 0xFFFFFFFFFFFFFFF8);
      float32x2_t v161 = &v149[-v155 - 8];
      int64_t v162 = v161 - v148;
      do
      {
        uint64_t v163 = *(void *)v161;
        v161 -= 8;
        *(void *)&v150[v162] = v163;
        v162 -= 8;
        v160 += 8;
      }
      while (v160);
      if (v151 == (v151 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_166;
      }
      float32x2_t v154 = &v152[-(v151 & 0xFFFFFFFFFFFFFFF8)];
      v149 -= v151 & 0xFFFFFFFFFFFFFFF8;
    }
LABEL_164:
    float32x2_t v164 = v154 - 1;
    do
    {
      char v165 = *--v149;
      *v164-- = v165;
    }
    while (v149 != v148);
LABEL_166:
    float32x2_t v153 = v150;
LABEL_167:
    v648[21] = v153;
    v648[22] = v152;
    v648[23] = v150 + 14;
    if (v148) {
      operator delete(v148);
    }
  }
  int v688 = 1116143616;
  v687[4] = xmmword_259122410;
  v687[5] = unk_259122420;
  v687[6] = xmmword_259122430;
  v687[0] = xmmword_2591223D0;
  v687[1] = unk_2591223E0;
  int v686 = 1189027840;
  v687[2] = xmmword_2591223F0;
  v687[3] = unk_259122400;
  v685[4] = xmmword_259122484;
  v685[5] = unk_259122494;
  v685[6] = xmmword_2591224A4;
  v685[0] = xmmword_259122444;
  v685[1] = unk_259122454;
  v685[2] = xmmword_259122464;
  v685[3] = unk_259122474;
  __p = 0;
  float32x2_t v682 = 0;
  float32x2_t v683 = 0;
  unint64_t v649 = v15;
  float32x2_t v646 = v19;
  float32x2_t v645 = v17;
  if (!v15)
  {
    float32x2_t v166 = 0;
    goto LABEL_276;
  }
  if (v15 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  }
  float32x2_t v166 = (char *)operator new(24 * v15);
  bzero(v166, 24 * ((24 * v15 - 24) / 0x18) + 24);
  uint64_t v167 = 0;
  __p = v166;
  float32x2_t v682 = (void **)&v166[24 * ((24 * v15 - 24) / 0x18) + 24];
  float32x2_t v683 = &v166[24 * v15];
  while (2)
  {
    float32x2_t v168 = &v166[24 * v167];
    float32x2_t v170 = v168 + 8;
    uint64_t v169 = *((void *)v168 + 1);
    uint64_t v171 = *(void *)v168;
    uint64_t v172 = v169 - *(void *)v168;
    unint64_t v173 = 0xAAAAAAAAAAAAAAABLL * (v172 >> 3);
    if (v173 > 7)
    {
      if (v172 != 192)
      {
        uint64_t v174 = v171 + 192;
        if (v169 != v171 + 192)
        {
          uint64_t v175 = *((void *)v168 + 1);
          do
          {
            float32x2_t v177 = *(void **)(v175 - 24);
            v175 -= 24;
            float32x2_t v176 = v177;
            if (v177)
            {
              *(void *)(v169 - 16) = v176;
              operator delete(v176);
            }
            uint64_t v169 = v175;
          }
          while (v175 != v174);
        }
        *float32x2_t v170 = v174;
      }
    }
    else
    {
      std::vector<std::vector<float>>::__append((uint64_t)v168, 8 - v173);
    }
    uint64_t v178 = 0;
    uint64_t v179 = *((void *)__p + 3 * v167);
    float32x2_t v180 = v22;
    uint64_t v658 = v167;
    do
    {
      uint64_t v181 = v179 + 24 * v178;
      float32x2_t v182 = (void *)(v181 + 8);
      float32x2_t v183 = *(char **)(v181 + 8);
      float32x2_t v184 = *(char **)v181;
      uint64_t v185 = (uint64_t)&v183[-*(void *)v181];
      if ((unint64_t)v185 <= 0x37)
      {
        float32x2_t v186 = v180;
        uint64_t v187 = v185 >> 2;
        unint64_t v188 = 14 - (v185 >> 2);
        uint64_t v189 = v179 + 24 * v178;
        uint64_t v192 = *(void *)(v189 + 16);
        float32x2_t v191 = (void *)(v189 + 16);
        uint64_t v190 = v192;
        if (v188 <= (v192 - (uint64_t)v183) >> 2)
        {
          bzero(v183, 4 * v188);
          *float32x2_t v182 = &v183[4 * v188];
          float32x2_t v180 = v186;
          uint64_t v167 = v658;
          goto LABEL_206;
        }
        uint64_t v193 = v190 - (void)v184;
        unint64_t v194 = v193 >> 1;
        if ((unint64_t)(v193 >> 1) <= 0xE) {
          unint64_t v194 = 14;
        }
        if ((unint64_t)v193 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v194 = 0x3FFFFFFFFFFFFFFFLL;
        }
        if (v194 >> 62) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        unint64_t v654 = v194;
        float32x2_t v656 = v191;
        float32x2_t v195 = (char *)operator new(4 * v194);
        size_t v196 = 4 * v188;
        float32x2_t v650 = v195;
        uint64_t v652 = 4 * v188;
        float32x2_t v197 = &v195[4 * v187];
        bzero(v197, v196);
        if (v183 == v184)
        {
          float32x2_t v199 = v197;
          float32x2_t v180 = v186;
          float32x2_t v201 = v650;
          uint64_t v200 = v652;
          goto LABEL_204;
        }
        unint64_t v198 = v183 - 4 - v184;
        float32x2_t v180 = v186;
        if (v198 >= 0x2C)
        {
          float32x2_t v201 = v650;
          uint64_t v200 = v652;
          float32x2_t v199 = v197;
          if ((unint64_t)(&v183[-(v185 & 0xFFFFFFFFFFFFFFFCLL)] - v650) >= 0x20)
          {
            uint64_t v202 = (v198 >> 2) + 1;
            float32x2_t v203 = &v650[4 * v187 - 16];
            float32x2_t v204 = v183 - 16;
            uint64_t v205 = v202 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v206 = *(_OWORD *)v204;
              *((_OWORD *)v203 - 1) = *((_OWORD *)v204 - 1);
              *(_OWORD *)float32x2_t v203 = v206;
              v203 -= 32;
              v204 -= 32;
              v205 -= 8;
            }
            while (v205);
            float32x2_t v199 = &v197[-4 * (v202 & 0x7FFFFFFFFFFFFFF8)];
            v183 -= 4 * (v202 & 0x7FFFFFFFFFFFFFF8);
            if (v202 == (v202 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_204:
              *(void *)uint64_t v181 = v199;
              *float32x2_t v182 = &v197[v200];
              *float32x2_t v656 = &v201[4 * v654];
              uint64_t v167 = v658;
              if (v184)
              {
                float32x2_t v208 = v180;
                operator delete(v184);
                float32x2_t v180 = v208;
              }
              goto LABEL_206;
            }
          }
        }
        else
        {
          float32x2_t v199 = v197;
          float32x2_t v201 = v650;
          uint64_t v200 = v652;
        }
        do
        {
          int v207 = *((_DWORD *)v183 - 1);
          v183 -= 4;
          *((_DWORD *)v199 - 1) = v207;
          v199 -= 4;
        }
        while (v183 != v184);
        goto LABEL_204;
      }
      if (v185 != 56) {
        *float32x2_t v182 = v184 + 56;
      }
LABEL_206:
      uint64_t v209 = *(void *)(*v180 + 24 * v167);
      float32x2_t v166 = (char *)__p;
      float32x2_t v210 = (uint64_t *)((char *)__p + 24 * v167);
      float v211 = *(float *)(v209 + 756 * v178 + 672);
      if (v211 <= 25.0)
      {
        uint64_t v179 = *v210;
        uint64_t v212 = *(void *)(v179 + 24 * v178);
        if (v211 >= 2.5) {
          *(float *)uint64_t v212 = v211;
        }
        else {
          *(_DWORD *)uint64_t v212 = 0;
        }
      }
      else
      {
        uint64_t v179 = *v210;
        uint64_t v212 = *(void *)(v179 + 24 * v178);
        *(_DWORD *)uint64_t v212 = 1103626240;
      }
      float v213 = *(float *)(v209 + 756 * v178 + 676);
      if (v213 <= 25.0)
      {
        if (v213 >= 2.5) {
          *(float *)(v212 + 4) = v213;
        }
        else {
          *(_DWORD *)(v212 + 4) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 4) = 1103626240;
      }
      float v214 = *(float *)(v209 + 756 * v178 + 680);
      if (v214 <= 25.0)
      {
        if (v214 >= 2.5) {
          *(float *)(v212 + 8) = v214;
        }
        else {
          *(_DWORD *)(v212 + 8) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 8) = 1103626240;
      }
      float v215 = *(float *)(v209 + 756 * v178 + 684);
      if (v215 <= 25.0)
      {
        if (v215 >= 2.5) {
          *(float *)(v212 + 12) = v215;
        }
        else {
          *(_DWORD *)(v212 + 12) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 12) = 1103626240;
      }
      float v216 = *(float *)(v209 + 756 * v178 + 688);
      if (v216 <= 25.0)
      {
        if (v216 >= 2.5) {
          *(float *)(v212 + 16) = v216;
        }
        else {
          *(_DWORD *)(v212 + 16) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 16) = 1103626240;
      }
      float v217 = *(float *)(v209 + 756 * v178 + 692);
      if (v217 <= 25.0)
      {
        if (v217 >= 2.5) {
          *(float *)(v212 + 20) = v217;
        }
        else {
          *(_DWORD *)(v212 + 20) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 20) = 1103626240;
      }
      float v218 = *(float *)(v209 + 756 * v178 + 696);
      if (v218 <= 25.0)
      {
        if (v218 >= 2.5) {
          *(float *)(v212 + 24) = v218;
        }
        else {
          *(_DWORD *)(v212 + 24) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 24) = 1103626240;
      }
      float v219 = *(float *)(v209 + 756 * v178 + 700);
      if (v219 <= 25.0)
      {
        if (v219 >= 2.5) {
          *(float *)(v212 + 28) = v219;
        }
        else {
          *(_DWORD *)(v212 + 28) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 28) = 1103626240;
      }
      float v220 = *(float *)(v209 + 756 * v178 + 704);
      if (v220 <= 25.0)
      {
        if (v220 >= 2.5) {
          *(float *)(v212 + 32) = v220;
        }
        else {
          *(_DWORD *)(v212 + 32) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 32) = 1103626240;
      }
      float v221 = *(float *)(v209 + 756 * v178 + 708);
      if (v221 <= 25.0)
      {
        if (v221 >= 2.5) {
          *(float *)(v212 + 36) = v221;
        }
        else {
          *(_DWORD *)(v212 + 36) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 36) = 1103626240;
      }
      float v222 = *(float *)(v209 + 756 * v178 + 712);
      if (v222 <= 25.0)
      {
        if (v222 >= 2.5) {
          *(float *)(v212 + 40) = v222;
        }
        else {
          *(_DWORD *)(v212 + 40) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 40) = 1103626240;
      }
      float v223 = *(float *)(v209 + 756 * v178 + 716);
      if (v223 <= 25.0)
      {
        if (v223 >= 2.5) {
          *(float *)(v212 + 44) = v223;
        }
        else {
          *(_DWORD *)(v212 + 44) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 44) = 1103626240;
      }
      float v224 = *(float *)(v209 + 756 * v178 + 720);
      if (v224 <= 25.0)
      {
        if (v224 >= 2.5) {
          *(float *)(v212 + 48) = v224;
        }
        else {
          *(_DWORD *)(v212 + 48) = 0;
        }
      }
      else
      {
        *(_DWORD *)(v212 + 48) = 1103626240;
      }
      float v225 = *(float *)(v209 + 756 * v178 + 724);
      if (v225 > 25.0)
      {
        *(_DWORD *)(v212 + 52) = 1103626240;
      }
      else if (v225 >= 2.5)
      {
        *(float *)(v212 + 52) = v225;
      }
      else
      {
        *(_DWORD *)(v212 + 52) = 0;
      }
      ++v178;
    }
    while (v178 != 8);
    float32x2_t v22 = v180;
    if (++v167 != v649) {
      continue;
    }
    break;
  }
LABEL_276:
  float32x2_t v677 = v687;
  uint64_t v678 = 0x1D00000001;
  char v679 = 0;
  uint64_t v680 = 116;
  uint64_t v675 = 116;
  float32x2_t v676 = &unk_270717688;
  uint64_t v673 = 0x1D00000001;
  char v674 = 0;
  float32x2_t v671 = &unk_270717688;
  float32x2_t v672 = v685;
  unint64_t v226 = v649;
  if (!v649)
  {
    *((_OWORD *)a10 + 26) = 0u;
    *((_OWORD *)a10 + 27) = 0u;
    *((_OWORD *)a10 + 24) = 0u;
    *((_OWORD *)a10 + 25) = 0u;
    *((_OWORD *)a10 + 22) = 0u;
    *((_OWORD *)a10 + 23) = 0u;
    *((_OWORD *)a10 + 20) = 0u;
    *((_OWORD *)a10 + 21) = 0u;
    *((_OWORD *)a10 + 18) = 0u;
    *((_OWORD *)a10 + 19) = 0u;
    *((_OWORD *)a10 + 16) = 0u;
    *((_OWORD *)a10 + 17) = 0u;
    *((_OWORD *)a10 + 14) = 0u;
    *((_OWORD *)a10 + 15) = 0u;
    *((_OWORD *)a10 + 12) = 0u;
    *((_OWORD *)a10 + 13) = 0u;
    *((_OWORD *)a10 + 10) = 0u;
    *((_OWORD *)a10 + 11) = 0u;
    *((_OWORD *)a10 + 8) = 0u;
    *((_OWORD *)a10 + 9) = 0u;
    *((_OWORD *)a10 + 6) = 0u;
    *((_OWORD *)a10 + 7) = 0u;
    *((_OWORD *)a10 + 4) = 0u;
    *((_OWORD *)a10 + 5) = 0u;
    *((_OWORD *)a10 + 2) = 0u;
    *((_OWORD *)a10 + 3) = 0u;
    *(_OWORD *)a10 = 0u;
    *((_OWORD *)a10 + 1) = 0u;
    int32x4_t v596 = vdupq_n_s32(0x7FC00000u);
    *(int32x4_t *)a11 = v596;
    *((int32x4_t *)a11 + 1) = v596;
    *((int32x4_t *)a11 + 2) = v596;
    *((int32x4_t *)a11 + 3) = v596;
    *((int32x4_t *)a11 + 4) = v596;
    *((int32x4_t *)a11 + 5) = v596;
    *((int32x4_t *)a11 + 6) = v596;
    *((int32x4_t *)a11 + 7) = v596;
    *((int32x4_t *)a11 + 8) = v596;
    *((int32x4_t *)a11 + 9) = v596;
    *((int32x4_t *)a11 + 10) = v596;
    *((int32x4_t *)a11 + 11) = v596;
    *((int32x4_t *)a11 + 12) = v596;
    *((int32x4_t *)a11 + 13) = v596;
    *((int32x4_t *)a11 + 14) = v596;
    *((int32x4_t *)a11 + 15) = v596;
    *((int32x4_t *)a11 + 16) = v596;
    *((int32x4_t *)a11 + 17) = v596;
    *((int32x4_t *)a11 + 18) = v596;
    *((int32x4_t *)a11 + 19) = v596;
    *((int32x4_t *)a11 + 20) = v596;
    *((int32x4_t *)a11 + 21) = v596;
    *((int32x4_t *)a11 + 22) = v596;
    *((int32x4_t *)a11 + 23) = v596;
    *((int32x4_t *)a11 + 24) = v596;
    *((int32x4_t *)a11 + 25) = v596;
    *((int32x4_t *)a11 + 26) = v596;
    *((int32x4_t *)a11 + 27) = v596;
    float32x2_t v236 = v646;
    goto LABEL_590;
  }
  uint64_t v227 = 0;
  float32x2_t v228 = v684;
  do
  {
    uint64_t v229 = 0;
    float32x2_t v659 = v228;
    do
    {
      float32x2_t v230 = *(float **)(*(void *)&v166[24 * v227] + v229);
      uint64_t v668 = 0xE00000001;
      char v669 = 0;
      uint64_t v670 = 56;
      float32x2_t v666 = &unk_270717688;
      float32x2_t v667 = v230;
      uint64_t v663 = 0xE00000001;
      char v664 = 0;
      uint64_t v665 = 56;
      float32x2_t v661 = &unk_270717688;
      v662 = v228;
      Interp1<float,LinearInterpolator<float>>((uint64_t)&v676, (uint64_t)&v671, v230, 14, (uint64_t)&v661);
      float32x2_t v661 = &unk_270717340;
      if (v662 && v664) {
        MEMORY[0x25A2D62A0]();
      }
      float32x2_t v666 = &unk_270717340;
      if (v667 && v669) {
        MEMORY[0x25A2D62A0]();
      }
      v229 += 24;
      v228 += 7;
    }
    while (v229 != 192);
    ++v227;
    float32x2_t v228 = v659 + 56;
  }
  while (v227 != v649);
  uint64_t v231 = 0;
  unint64_t v226 = v649;
  unint64_t v232 = v649 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v233 = 56 * (v649 - 1);
  BOOL v234 = !is_mul_ok(v649 - 1, 0x1C0uLL);
  float32x2_t v235 = (float *)v684;
  float32x2_t v236 = v646;
  while (2)
  {
    if (v649 < 2)
    {
      unint64_t v237 = 0;
      float v238 = 0.0;
      goto LABEL_294;
    }
    float v239 = 0.0;
    float32x2_t v240 = v235;
    unint64_t v241 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v242 = 0.0;
    do
    {
      float v239 = *v240 + v239;
      float v242 = v240[112] + v242;
      v240 += 224;
      v241 -= 2;
    }
    while (v241);
    float v238 = v242 + v239;
    unint64_t v237 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_294:
      unint64_t v243 = v649 - v237;
      uint64_t v244 = 112 * v237;
      do
      {
        float v238 = v235[v244] + v238;
        v244 += 112;
        --v243;
      }
      while (v243);
    }
    unint64_t v245 = 0;
    float32x2_t v246 = &v684[7 * v231];
    char v247 = &v246[v233] < v246 || v234;
    float v248 = 1.0 / v238;
    if (v649 < 2) {
      goto LABEL_304;
    }
    if (v247) {
      goto LABEL_304;
    }
    float32x2_t v249 = v235;
    unint64_t v250 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v251 = v249[112] * v248;
      *float32x2_t v249 = *v249 * v248;
      v249[112] = v251;
      v249 += 224;
      v250 -= 2;
    }
    while (v250);
    unint64_t v245 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_304:
      unint64_t v252 = v649 - v245;
      uint64_t v253 = 112 * v245;
      do
      {
        v235[v253] = v235[v253] * v248;
        v253 += 112;
        --v252;
      }
      while (v252);
    }
    if (v649 < 2)
    {
      unint64_t v254 = 0;
      float v255 = 0.0;
      goto LABEL_311;
    }
    float v256 = 0.0;
    float32x2_t v257 = v235;
    unint64_t v258 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v259 = 0.0;
    do
    {
      float v256 = v257[1] + v256;
      float v259 = v257[113] + v259;
      v257 += 224;
      v258 -= 2;
    }
    while (v258);
    float v255 = v259 + v256;
    unint64_t v254 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_311:
      unint64_t v260 = v649 - v254;
      uint64_t v261 = (448 * v254) | 4;
      do
      {
        float v255 = *(float *)((char *)v235 + v261) + v255;
        v261 += 448;
        --v260;
      }
      while (v260);
    }
    unint64_t v262 = 0;
    char v263 = (char *)&v246[v233] + 4 < (char *)v246 + 4 || v234;
    float v264 = 1.0 / v255;
    if (v649 < 2) {
      goto LABEL_321;
    }
    if (v263) {
      goto LABEL_321;
    }
    float32x2_t v265 = v235;
    unint64_t v266 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v267 = v265[113] * v264;
      v265[1] = v265[1] * v264;
      v265[113] = v267;
      v265 += 224;
      v266 -= 2;
    }
    while (v266);
    unint64_t v262 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_321:
      unint64_t v268 = v649 - v262;
      uint64_t v269 = (448 * v262) | 4;
      do
      {
        *(float *)((char *)v235 + v269) = *(float *)((char *)v235 + v269) * v264;
        v269 += 448;
        --v268;
      }
      while (v268);
    }
    if (v649 < 2)
    {
      unint64_t v270 = 0;
      float v271 = 0.0;
      goto LABEL_328;
    }
    float v272 = 0.0;
    float32x2_t v273 = v235;
    unint64_t v274 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v275 = 0.0;
    do
    {
      float v272 = v273[2] + v272;
      float v275 = v273[114] + v275;
      v273 += 224;
      v274 -= 2;
    }
    while (v274);
    float v271 = v275 + v272;
    unint64_t v270 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_328:
      unint64_t v276 = v649 - v270;
      uint64_t v277 = (448 * v270) | 8;
      do
      {
        float v271 = *(float *)((char *)v235 + v277) + v271;
        v277 += 448;
        --v276;
      }
      while (v276);
    }
    unint64_t v278 = 0;
    char v279 = &v246[v233 + 1] < v246 + 1 || v234;
    float v280 = 1.0 / v271;
    if (v649 < 2) {
      goto LABEL_338;
    }
    if (v279) {
      goto LABEL_338;
    }
    float32x2_t v281 = v235;
    unint64_t v282 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v283 = v281[114] * v280;
      v281[2] = v281[2] * v280;
      v281[114] = v283;
      v281 += 224;
      v282 -= 2;
    }
    while (v282);
    unint64_t v278 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_338:
      unint64_t v284 = v649 - v278;
      uint64_t v285 = (448 * v278) | 8;
      do
      {
        *(float *)((char *)v235 + v285) = *(float *)((char *)v235 + v285) * v280;
        v285 += 448;
        --v284;
      }
      while (v284);
    }
    if (v649 < 2)
    {
      unint64_t v286 = 0;
      float v287 = 0.0;
      goto LABEL_345;
    }
    float v288 = 0.0;
    float32x2_t v289 = v235;
    unint64_t v290 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v291 = 0.0;
    do
    {
      float v288 = v289[3] + v288;
      float v291 = v289[115] + v291;
      v289 += 224;
      v290 -= 2;
    }
    while (v290);
    float v287 = v291 + v288;
    unint64_t v286 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_345:
      unint64_t v292 = v649 - v286;
      uint64_t v293 = (448 * v286) | 0xC;
      do
      {
        float v287 = *(float *)((char *)v235 + v293) + v287;
        v293 += 448;
        --v292;
      }
      while (v292);
    }
    unint64_t v294 = 0;
    char v295 = (char *)&v246[v233 + 1] + 4 < (char *)v246 + 12 || v234;
    float v296 = 1.0 / v287;
    if (v649 < 2) {
      goto LABEL_355;
    }
    if (v295) {
      goto LABEL_355;
    }
    float32x2_t v297 = v235;
    unint64_t v298 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v299 = v297[115] * v296;
      v297[3] = v297[3] * v296;
      v297[115] = v299;
      v297 += 224;
      v298 -= 2;
    }
    while (v298);
    unint64_t v294 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_355:
      unint64_t v300 = v649 - v294;
      uint64_t v301 = (448 * v294) | 0xC;
      do
      {
        *(float *)((char *)v235 + v301) = *(float *)((char *)v235 + v301) * v296;
        v301 += 448;
        --v300;
      }
      while (v300);
    }
    if (v649 < 2)
    {
      unint64_t v302 = 0;
      float v303 = 0.0;
      goto LABEL_362;
    }
    float v304 = 0.0;
    float32x2_t v305 = v235;
    unint64_t v306 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v307 = 0.0;
    do
    {
      float v304 = v305[4] + v304;
      float v307 = v305[116] + v307;
      v305 += 224;
      v306 -= 2;
    }
    while (v306);
    float v303 = v307 + v304;
    unint64_t v302 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_362:
      unint64_t v308 = v649 - v302;
      uint64_t v309 = (448 * v302) | 0x10;
      do
      {
        float v303 = *(float *)((char *)v235 + v309) + v303;
        v309 += 448;
        --v308;
      }
      while (v308);
    }
    unint64_t v310 = 0;
    char v311 = &v246[v233 + 2] < v246 + 2 || v234;
    float v312 = 1.0 / v303;
    if (v649 < 2) {
      goto LABEL_372;
    }
    if (v311) {
      goto LABEL_372;
    }
    float32x2_t v313 = v235;
    unint64_t v314 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v315 = v313[116] * v312;
      v313[4] = v313[4] * v312;
      v313[116] = v315;
      v313 += 224;
      v314 -= 2;
    }
    while (v314);
    unint64_t v310 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_372:
      unint64_t v316 = v649 - v310;
      uint64_t v317 = (448 * v310) | 0x10;
      do
      {
        *(float *)((char *)v235 + v317) = *(float *)((char *)v235 + v317) * v312;
        v317 += 448;
        --v316;
      }
      while (v316);
    }
    if (v649 < 2)
    {
      unint64_t v318 = 0;
      float v319 = 0.0;
      goto LABEL_379;
    }
    float v320 = 0.0;
    float32x2_t v321 = v235;
    unint64_t v322 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v323 = 0.0;
    do
    {
      float v320 = v321[5] + v320;
      float v323 = v321[117] + v323;
      v321 += 224;
      v322 -= 2;
    }
    while (v322);
    float v319 = v323 + v320;
    unint64_t v318 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_379:
      unint64_t v324 = v649 - v318;
      uint64_t v325 = (448 * v318) | 0x14;
      do
      {
        float v319 = *(float *)((char *)v235 + v325) + v319;
        v325 += 448;
        --v324;
      }
      while (v324);
    }
    unint64_t v326 = 0;
    char v327 = (char *)&v246[v233 + 2] + 4 < (char *)v246 + 20 || v234;
    float v328 = 1.0 / v319;
    if (v649 < 2) {
      goto LABEL_389;
    }
    if (v327) {
      goto LABEL_389;
    }
    float32x2_t v329 = v235;
    unint64_t v330 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v331 = v329[117] * v328;
      v329[5] = v329[5] * v328;
      v329[117] = v331;
      v329 += 224;
      v330 -= 2;
    }
    while (v330);
    unint64_t v326 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_389:
      unint64_t v332 = v649 - v326;
      uint64_t v333 = (448 * v326) | 0x14;
      do
      {
        *(float *)((char *)v235 + v333) = *(float *)((char *)v235 + v333) * v328;
        v333 += 448;
        --v332;
      }
      while (v332);
    }
    if (v649 < 2)
    {
      unint64_t v334 = 0;
      float v335 = 0.0;
      goto LABEL_396;
    }
    float v336 = 0.0;
    float32x2_t v337 = v235;
    unint64_t v338 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v339 = 0.0;
    do
    {
      float v336 = v337[6] + v336;
      float v339 = v337[118] + v339;
      v337 += 224;
      v338 -= 2;
    }
    while (v338);
    float v335 = v339 + v336;
    unint64_t v334 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_396:
      unint64_t v340 = v649 - v334;
      uint64_t v341 = (448 * v334) | 0x18;
      do
      {
        float v335 = *(float *)((char *)v235 + v341) + v335;
        v341 += 448;
        --v340;
      }
      while (v340);
    }
    unint64_t v342 = 0;
    char v343 = &v246[v233 + 3] < v246 + 3 || v234;
    float v344 = 1.0 / v335;
    if (v649 < 2) {
      goto LABEL_406;
    }
    if (v343) {
      goto LABEL_406;
    }
    float32x2_t v345 = v235;
    unint64_t v346 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v347 = v345[118] * v344;
      v345[6] = v345[6] * v344;
      v345[118] = v347;
      v345 += 224;
      v346 -= 2;
    }
    while (v346);
    unint64_t v342 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_406:
      unint64_t v348 = v649 - v342;
      uint64_t v349 = (448 * v342) | 0x18;
      do
      {
        *(float *)((char *)v235 + v349) = *(float *)((char *)v235 + v349) * v344;
        v349 += 448;
        --v348;
      }
      while (v348);
    }
    if (v649 < 2)
    {
      unint64_t v350 = 0;
      float v351 = 0.0;
      goto LABEL_413;
    }
    float v352 = 0.0;
    float32x2_t v353 = v235;
    unint64_t v354 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v355 = 0.0;
    do
    {
      float v352 = v353[7] + v352;
      float v355 = v353[119] + v355;
      v353 += 224;
      v354 -= 2;
    }
    while (v354);
    float v351 = v355 + v352;
    unint64_t v350 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_413:
      unint64_t v356 = v649 - v350;
      uint64_t v357 = (448 * v350) | 0x1C;
      do
      {
        float v351 = *(float *)((char *)v235 + v357) + v351;
        v357 += 448;
        --v356;
      }
      while (v356);
    }
    unint64_t v358 = 0;
    char v359 = (char *)&v246[v233 + 3] + 4 < (char *)v246 + 28 || v234;
    float v360 = 1.0 / v351;
    if (v649 < 2) {
      goto LABEL_423;
    }
    if (v359) {
      goto LABEL_423;
    }
    float32x2_t v361 = v235;
    unint64_t v362 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v363 = v361[119] * v360;
      v361[7] = v361[7] * v360;
      v361[119] = v363;
      v361 += 224;
      v362 -= 2;
    }
    while (v362);
    unint64_t v358 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_423:
      unint64_t v364 = v649 - v358;
      uint64_t v365 = (448 * v358) | 0x1C;
      do
      {
        *(float *)((char *)v235 + v365) = *(float *)((char *)v235 + v365) * v360;
        v365 += 448;
        --v364;
      }
      while (v364);
    }
    if (v649 < 2)
    {
      unint64_t v366 = 0;
      float v367 = 0.0;
      goto LABEL_430;
    }
    float v368 = 0.0;
    float32x2_t v369 = v235;
    unint64_t v370 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v371 = 0.0;
    do
    {
      float v368 = v369[8] + v368;
      float v371 = v369[120] + v371;
      v369 += 224;
      v370 -= 2;
    }
    while (v370);
    float v367 = v371 + v368;
    unint64_t v366 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_430:
      unint64_t v372 = v649 - v366;
      uint64_t v373 = (448 * v366) | 0x20;
      do
      {
        float v367 = *(float *)((char *)v235 + v373) + v367;
        v373 += 448;
        --v372;
      }
      while (v372);
    }
    unint64_t v374 = 0;
    char v375 = &v246[v233 + 4] < v246 + 4 || v234;
    float v376 = 1.0 / v367;
    if (v649 < 2) {
      goto LABEL_440;
    }
    if (v375) {
      goto LABEL_440;
    }
    float32x2_t v377 = v235;
    unint64_t v378 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v379 = v377[120] * v376;
      v377[8] = v377[8] * v376;
      v377[120] = v379;
      v377 += 224;
      v378 -= 2;
    }
    while (v378);
    unint64_t v374 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_440:
      unint64_t v380 = v649 - v374;
      uint64_t v381 = (448 * v374) | 0x20;
      do
      {
        *(float *)((char *)v235 + v381) = *(float *)((char *)v235 + v381) * v376;
        v381 += 448;
        --v380;
      }
      while (v380);
    }
    if (v649 < 2)
    {
      unint64_t v382 = 0;
      float v383 = 0.0;
      goto LABEL_447;
    }
    float v384 = 0.0;
    float32x2_t v385 = v235;
    unint64_t v386 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v387 = 0.0;
    do
    {
      float v384 = v385[9] + v384;
      float v387 = v385[121] + v387;
      v385 += 224;
      v386 -= 2;
    }
    while (v386);
    float v383 = v387 + v384;
    unint64_t v382 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_447:
      unint64_t v388 = v649 - v382;
      uint64_t v389 = (448 * v382) | 0x24;
      do
      {
        float v383 = *(float *)((char *)v235 + v389) + v383;
        v389 += 448;
        --v388;
      }
      while (v388);
    }
    unint64_t v390 = 0;
    char v391 = (char *)&v246[v233 + 4] + 4 < (char *)v246 + 36 || v234;
    float v392 = 1.0 / v383;
    if (v649 < 2) {
      goto LABEL_457;
    }
    if (v391) {
      goto LABEL_457;
    }
    float32x2_t v393 = v235;
    unint64_t v394 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v395 = v393[121] * v392;
      v393[9] = v393[9] * v392;
      v393[121] = v395;
      v393 += 224;
      v394 -= 2;
    }
    while (v394);
    unint64_t v390 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_457:
      unint64_t v396 = v649 - v390;
      uint64_t v397 = (448 * v390) | 0x24;
      do
      {
        *(float *)((char *)v235 + v397) = *(float *)((char *)v235 + v397) * v392;
        v397 += 448;
        --v396;
      }
      while (v396);
    }
    if (v649 < 2)
    {
      unint64_t v398 = 0;
      float v399 = 0.0;
      goto LABEL_464;
    }
    float v400 = 0.0;
    float32x2_t v401 = v235;
    unint64_t v402 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v403 = 0.0;
    do
    {
      float v400 = v401[10] + v400;
      float v403 = v401[122] + v403;
      v401 += 224;
      v402 -= 2;
    }
    while (v402);
    float v399 = v403 + v400;
    unint64_t v398 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_464:
      unint64_t v404 = v649 - v398;
      uint64_t v405 = (448 * v398) | 0x28;
      do
      {
        float v399 = *(float *)((char *)v235 + v405) + v399;
        v405 += 448;
        --v404;
      }
      while (v404);
    }
    unint64_t v406 = 0;
    char v407 = &v246[v233 + 5] < v246 + 5 || v234;
    float v408 = 1.0 / v399;
    if (v649 < 2) {
      goto LABEL_474;
    }
    if (v407) {
      goto LABEL_474;
    }
    float32x2_t v409 = v235;
    unint64_t v410 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v411 = v409[122] * v408;
      v409[10] = v409[10] * v408;
      v409[122] = v411;
      v409 += 224;
      v410 -= 2;
    }
    while (v410);
    unint64_t v406 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_474:
      unint64_t v412 = v649 - v406;
      uint64_t v413 = (448 * v406) | 0x28;
      do
      {
        *(float *)((char *)v235 + v413) = *(float *)((char *)v235 + v413) * v408;
        v413 += 448;
        --v412;
      }
      while (v412);
    }
    if (v649 < 2)
    {
      unint64_t v414 = 0;
      float v415 = 0.0;
      goto LABEL_481;
    }
    float v416 = 0.0;
    float32x2_t v417 = v235;
    unint64_t v418 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v419 = 0.0;
    do
    {
      float v416 = v417[11] + v416;
      float v419 = v417[123] + v419;
      v417 += 224;
      v418 -= 2;
    }
    while (v418);
    float v415 = v419 + v416;
    unint64_t v414 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_481:
      unint64_t v420 = v649 - v414;
      uint64_t v421 = (448 * v414) | 0x2C;
      do
      {
        float v415 = *(float *)((char *)v235 + v421) + v415;
        v421 += 448;
        --v420;
      }
      while (v420);
    }
    unint64_t v422 = 0;
    char v423 = (char *)&v246[v233 + 5] + 4 < (char *)v246 + 44 || v234;
    float v424 = 1.0 / v415;
    if (v649 < 2) {
      goto LABEL_491;
    }
    if (v423) {
      goto LABEL_491;
    }
    float32x2_t v425 = v235;
    unint64_t v426 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v427 = v425[123] * v424;
      v425[11] = v425[11] * v424;
      v425[123] = v427;
      v425 += 224;
      v426 -= 2;
    }
    while (v426);
    unint64_t v422 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_491:
      unint64_t v428 = v649 - v422;
      uint64_t v429 = (448 * v422) | 0x2C;
      do
      {
        *(float *)((char *)v235 + v429) = *(float *)((char *)v235 + v429) * v424;
        v429 += 448;
        --v428;
      }
      while (v428);
    }
    if (v649 < 2)
    {
      unint64_t v430 = 0;
      float v431 = 0.0;
      goto LABEL_498;
    }
    float v432 = 0.0;
    float32x2_t v433 = v235;
    unint64_t v434 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v435 = 0.0;
    do
    {
      float v432 = v433[12] + v432;
      float v435 = v433[124] + v435;
      v433 += 224;
      v434 -= 2;
    }
    while (v434);
    float v431 = v435 + v432;
    unint64_t v430 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_498:
      unint64_t v436 = v649 - v430;
      uint64_t v437 = (448 * v430) | 0x30;
      do
      {
        float v431 = *(float *)((char *)v235 + v437) + v431;
        v437 += 448;
        --v436;
      }
      while (v436);
    }
    unint64_t v438 = 0;
    char v439 = &v246[v233 + 6] < v246 + 6 || v234;
    float v440 = 1.0 / v431;
    if (v649 < 2) {
      goto LABEL_508;
    }
    if (v439) {
      goto LABEL_508;
    }
    float32x2_t v441 = v235;
    unint64_t v442 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v443 = v441[124] * v440;
      v441[12] = v441[12] * v440;
      v441[124] = v443;
      v441 += 224;
      v442 -= 2;
    }
    while (v442);
    unint64_t v438 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_508:
      unint64_t v444 = v649 - v438;
      uint64_t v445 = (448 * v438) | 0x30;
      do
      {
        *(float *)((char *)v235 + v445) = *(float *)((char *)v235 + v445) * v440;
        v445 += 448;
        --v444;
      }
      while (v444);
    }
    if (v649 < 2)
    {
      unint64_t v446 = 0;
      float v447 = 0.0;
      goto LABEL_515;
    }
    float v448 = 0.0;
    float32x2_t v449 = v235;
    unint64_t v450 = v649 & 0xFFFFFFFFFFFFFFFELL;
    float v451 = 0.0;
    do
    {
      float v448 = v449[13] + v448;
      float v451 = v449[125] + v451;
      v449 += 224;
      v450 -= 2;
    }
    while (v450);
    float v447 = v451 + v448;
    unint64_t v446 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_515:
      unint64_t v452 = v649 - v446;
      uint64_t v453 = (448 * v446) | 0x34;
      do
      {
        float v447 = *(float *)((char *)v235 + v453) + v447;
        v453 += 448;
        --v452;
      }
      while (v452);
    }
    unint64_t v454 = 0;
    char v455 = (char *)&v246[v233 + 6] + 4 < (char *)v246 + 52 || v234;
    float v456 = 1.0 / v447;
    if (v649 < 2) {
      goto LABEL_525;
    }
    if (v455) {
      goto LABEL_525;
    }
    float32x2_t v457 = v235;
    unint64_t v458 = v649 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v459 = v457[125] * v456;
      v457[13] = v457[13] * v456;
      v457[125] = v459;
      v457 += 224;
      v458 -= 2;
    }
    while (v458);
    unint64_t v454 = v649 & 0xFFFFFFFFFFFFFFFELL;
    if (v232 != v649)
    {
LABEL_525:
      unint64_t v460 = v649 - v454;
      uint64_t v461 = (448 * v454) | 0x34;
      do
      {
        *(float *)((char *)v235 + v461) = *(float *)((char *)v235 + v461) * v456;
        v461 += 448;
        --v460;
      }
      while (v460);
    }
    ++v231;
    v235 += 14;
    if (v231 != 8) {
      continue;
    }
    break;
  }
  uint64_t v462 = 0;
  float32x2_t v463 = (float *)v684;
  float32x2_t v464 = (uint64_t *)__p;
  do
  {
    float32x2_t v465 = (float *)((char *)a10 + 56 * v462);
    *float32x2_t v465 = 0.0;
    float v466 = 0.0;
    float32x2_t v467 = v464;
    float32x2_t v468 = v463;
    unint64_t v469 = v649;
    do
    {
      uint64_t v470 = *v467;
      v467 += 3;
      float v466 = v466 + (float)(*v468 * **(float **)(v470 + 24 * v462));
      *float32x2_t v465 = v466;
      v468 += 112;
      --v469;
    }
    while (v469);
    v465[1] = 0.0;
    float v471 = 0.0;
    float32x2_t v472 = v464;
    uint64_t v473 = 1;
    unint64_t v474 = v649;
    do
    {
      uint64_t v475 = *v472;
      v472 += 3;
      float v471 = v471 + (float)(v463[v473] * *(float *)(*(void *)(v475 + 24 * v462) + 4));
      v465[1] = v471;
      v473 += 112;
      --v474;
    }
    while (v474);
    v465[2] = 0.0;
    float v476 = 0.0;
    float32x2_t v477 = v464;
    uint64_t v478 = 2;
    unint64_t v479 = v649;
    do
    {
      uint64_t v480 = *v477;
      v477 += 3;
      float v476 = v476 + (float)(v463[v478] * *(float *)(*(void *)(v480 + 24 * v462) + 8));
      v465[2] = v476;
      v478 += 112;
      --v479;
    }
    while (v479);
    v465[3] = 0.0;
    float v481 = 0.0;
    float32x2_t v482 = v464;
    uint64_t v483 = 3;
    unint64_t v484 = v649;
    do
    {
      uint64_t v485 = *v482;
      v482 += 3;
      float v481 = v481 + (float)(v463[v483] * *(float *)(*(void *)(v485 + 24 * v462) + 12));
      v465[3] = v481;
      v483 += 112;
      --v484;
    }
    while (v484);
    v465[4] = 0.0;
    float v486 = 0.0;
    float32x2_t v487 = v464;
    uint64_t v488 = 4;
    unint64_t v489 = v649;
    do
    {
      uint64_t v490 = *v487;
      v487 += 3;
      float v486 = v486 + (float)(v463[v488] * *(float *)(*(void *)(v490 + 24 * v462) + 16));
      v465[4] = v486;
      v488 += 112;
      --v489;
    }
    while (v489);
    v465[5] = 0.0;
    float v491 = 0.0;
    float32x2_t v492 = v464;
    uint64_t v493 = 5;
    unint64_t v494 = v649;
    do
    {
      uint64_t v495 = *v492;
      v492 += 3;
      float v491 = v491 + (float)(v463[v493] * *(float *)(*(void *)(v495 + 24 * v462) + 20));
      v465[5] = v491;
      v493 += 112;
      --v494;
    }
    while (v494);
    v465[6] = 0.0;
    float v496 = 0.0;
    float32x2_t v497 = v464;
    uint64_t v498 = 6;
    unint64_t v499 = v649;
    do
    {
      uint64_t v500 = *v497;
      v497 += 3;
      float v496 = v496 + (float)(v463[v498] * *(float *)(*(void *)(v500 + 24 * v462) + 24));
      v465[6] = v496;
      v498 += 112;
      --v499;
    }
    while (v499);
    v465[7] = 0.0;
    float v501 = 0.0;
    float32x2_t v502 = v464;
    uint64_t v503 = 7;
    unint64_t v504 = v649;
    do
    {
      uint64_t v505 = *v502;
      v502 += 3;
      float v501 = v501 + (float)(v463[v503] * *(float *)(*(void *)(v505 + 24 * v462) + 28));
      v465[7] = v501;
      v503 += 112;
      --v504;
    }
    while (v504);
    v465[8] = 0.0;
    float v506 = 0.0;
    float32x2_t v507 = v464;
    uint64_t v508 = 8;
    unint64_t v509 = v649;
    do
    {
      uint64_t v510 = *v507;
      v507 += 3;
      float v506 = v506 + (float)(v463[v508] * *(float *)(*(void *)(v510 + 24 * v462) + 32));
      v465[8] = v506;
      v508 += 112;
      --v509;
    }
    while (v509);
    v465[9] = 0.0;
    float v511 = 0.0;
    float32x2_t v512 = v464;
    uint64_t v513 = 9;
    unint64_t v514 = v649;
    do
    {
      uint64_t v515 = *v512;
      v512 += 3;
      float v511 = v511 + (float)(v463[v513] * *(float *)(*(void *)(v515 + 24 * v462) + 36));
      v465[9] = v511;
      v513 += 112;
      --v514;
    }
    while (v514);
    v465[10] = 0.0;
    float v516 = 0.0;
    float32x2_t v517 = v464;
    uint64_t v518 = 10;
    unint64_t v519 = v649;
    do
    {
      uint64_t v520 = *v517;
      v517 += 3;
      float v516 = v516 + (float)(v463[v518] * *(float *)(*(void *)(v520 + 24 * v462) + 40));
      v465[10] = v516;
      v518 += 112;
      --v519;
    }
    while (v519);
    v465[11] = 0.0;
    float v521 = 0.0;
    float32x2_t v522 = v464;
    uint64_t v523 = 11;
    unint64_t v524 = v649;
    do
    {
      uint64_t v525 = *v522;
      v522 += 3;
      float v521 = v521 + (float)(v463[v523] * *(float *)(*(void *)(v525 + 24 * v462) + 44));
      v465[11] = v521;
      v523 += 112;
      --v524;
    }
    while (v524);
    v465[12] = 0.0;
    float v526 = 0.0;
    float32x2_t v527 = v464;
    uint64_t v528 = 12;
    unint64_t v529 = v649;
    do
    {
      uint64_t v530 = *v527;
      v527 += 3;
      float v526 = v526 + (float)(v463[v528] * *(float *)(*(void *)(v530 + 24 * v462) + 48));
      v465[12] = v526;
      v528 += 112;
      --v529;
    }
    while (v529);
    v465[13] = 0.0;
    float v531 = 0.0;
    float32x2_t v532 = v464;
    uint64_t v533 = 13;
    unint64_t v534 = v649;
    do
    {
      uint64_t v535 = *v532;
      v532 += 3;
      float v531 = v531 + (float)(v463[v533] * *(float *)(*(void *)(v535 + 24 * v462) + 52));
      v465[13] = v531;
      v533 += 112;
      --v534;
    }
    while (v534);
    ++v462;
    v463 += 14;
  }
  while (v462 != 8);
  uint64_t v536 = 0;
  uint64_t v537 = 0;
  uint64_t v538 = 4;
  uint64_t v539 = 8;
  uint64_t v540 = 12;
  uint64_t v541 = 16;
  uint64_t v542 = 20;
  uint64_t v543 = 24;
  uint64_t v544 = 28;
  uint64_t v545 = 32;
  uint64_t v546 = 36;
  uint64_t v547 = 40;
  float v548 = 1.0 / (float)v649;
  uint64_t v549 = 44;
  uint64_t v550 = 48;
  uint64_t v551 = 52;
  do
  {
    float32x2_t v552 = (float *)((char *)a11 + 56 * v537);
    uint64_t v553 = *v645;
    *float32x2_t v552 = 0.0;
    float32x2_t v554 = (float *)(v553 + v536);
    float v555 = 0.0;
    unint64_t v556 = v649;
    do
    {
      float v555 = v555 + *v554;
      *float32x2_t v552 = v555;
      v554 += 112;
      --v556;
    }
    while (v556);
    *float32x2_t v552 = v555 * v548;
    v552[1] = 0.0;
    float32x2_t v557 = (float *)(v553 + v538);
    float v558 = 0.0;
    unint64_t v559 = v649;
    do
    {
      float v558 = v558 + *v557;
      v552[1] = v558;
      v557 += 112;
      --v559;
    }
    while (v559);
    v552[1] = v558 * v548;
    v552[2] = 0.0;
    float32x2_t v560 = (float *)(v553 + v539);
    float v561 = 0.0;
    unint64_t v562 = v649;
    do
    {
      float v561 = v561 + *v560;
      v552[2] = v561;
      v560 += 112;
      --v562;
    }
    while (v562);
    v552[2] = v561 * v548;
    v552[3] = 0.0;
    float32x2_t v563 = (float *)(v553 + v540);
    float v564 = 0.0;
    unint64_t v565 = v649;
    do
    {
      float v564 = v564 + *v563;
      v552[3] = v564;
      v563 += 112;
      --v565;
    }
    while (v565);
    v552[3] = v564 * v548;
    v552[4] = 0.0;
    float32x2_t v566 = (float *)(v553 + v541);
    float v567 = 0.0;
    unint64_t v568 = v649;
    do
    {
      float v567 = v567 + *v566;
      v552[4] = v567;
      v566 += 112;
      --v568;
    }
    while (v568);
    v552[4] = v567 * v548;
    v552[5] = 0.0;
    float32x2_t v569 = (float *)(v553 + v542);
    float v570 = 0.0;
    unint64_t v571 = v649;
    do
    {
      float v570 = v570 + *v569;
      v552[5] = v570;
      v569 += 112;
      --v571;
    }
    while (v571);
    v552[5] = v570 * v548;
    v552[6] = 0.0;
    float32x2_t v572 = (float *)(v553 + v543);
    float v573 = 0.0;
    unint64_t v574 = v649;
    do
    {
      float v573 = v573 + *v572;
      v552[6] = v573;
      v572 += 112;
      --v574;
    }
    while (v574);
    v552[6] = v573 * v548;
    v552[7] = 0.0;
    float32x2_t v575 = (float *)(v553 + v544);
    float v576 = 0.0;
    unint64_t v577 = v649;
    do
    {
      float v576 = v576 + *v575;
      v552[7] = v576;
      v575 += 112;
      --v577;
    }
    while (v577);
    v552[7] = v576 * v548;
    v552[8] = 0.0;
    float32x2_t v578 = (float *)(v553 + v545);
    float v579 = 0.0;
    unint64_t v580 = v649;
    do
    {
      float v579 = v579 + *v578;
      v552[8] = v579;
      v578 += 112;
      --v580;
    }
    while (v580);
    v552[8] = v579 * v548;
    v552[9] = 0.0;
    float32x2_t v581 = (float *)(v553 + v546);
    float v582 = 0.0;
    unint64_t v583 = v649;
    do
    {
      float v582 = v582 + *v581;
      v552[9] = v582;
      v581 += 112;
      --v583;
    }
    while (v583);
    v552[9] = v582 * v548;
    v552[10] = 0.0;
    float32x2_t v584 = (float *)(v553 + v547);
    float v585 = 0.0;
    unint64_t v586 = v649;
    do
    {
      float v585 = v585 + *v584;
      v552[10] = v585;
      v584 += 112;
      --v586;
    }
    while (v586);
    v552[10] = v585 * v548;
    v552[11] = 0.0;
    float32x2_t v587 = (float *)(v553 + v549);
    float v588 = 0.0;
    unint64_t v589 = v649;
    do
    {
      float v588 = v588 + *v587;
      v552[11] = v588;
      v587 += 112;
      --v589;
    }
    while (v589);
    v552[11] = v588 * v548;
    v552[12] = 0.0;
    float32x2_t v590 = (float *)(v553 + v550);
    float v591 = 0.0;
    unint64_t v592 = v649;
    do
    {
      float v591 = v591 + *v590;
      v552[12] = v591;
      v590 += 112;
      --v592;
    }
    while (v592);
    v552[12] = v591 * v548;
    v552[13] = 0.0;
    float32x2_t v593 = (float *)(v553 + v551);
    float v594 = 0.0;
    unint64_t v595 = v649;
    do
    {
      float v594 = v594 + *v593;
      v552[13] = v594;
      v593 += 112;
      --v595;
    }
    while (v595);
    ++v537;
    v536 += 56;
    v538 += 56;
    v539 += 56;
    v552[13] = v594 * v548;
    v540 += 56;
    v541 += 56;
    v542 += 56;
    v543 += 56;
    v544 += 56;
    v545 += 56;
    v546 += 56;
    v547 += 56;
    v549 += 56;
    v550 += 56;
    v551 += 56;
  }
  while (v537 != 8);
LABEL_590:
  uint64_t v597 = 0;
  uint64_t v598 = 0;
  float32x2_t v599 = v684;
  int8x8_t v600 = (int8x8_t)vdup_n_s32(0x7FC00000u);
  while (2)
  {
    uint64_t v601 = 0;
    uint64_t v602 = v647 + 112 * v598;
    uint64_t v653 = v598;
    uint64_t v655 = v597;
    float32x2_t v603 = &v648[3 * v598];
    float32x2_t v604 = v603 + 1;
    float32x2_t v660 = v603 + 2;
    float32x2_t v651 = v599;
    uint64_t v657 = v602;
    while (2)
    {
      if (v226)
      {
        float32x2_t v606 = (int8x16_t *)(*v236 + v597);
        float32x2_t v607 = 0;
        float32x2_t v608 = (float *)v599;
        unint64_t v609 = v226;
        do
        {
          float32x2_t v607 = vmla_n_f32(v607, vcvt_f32_f64((float64x2_t)vandq_s8(*v606, vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)v606), (int8x16_t)vcgezq_f64(*(float64x2_t *)v606)))), *v608);
          v608 += 112;
          v606 += 112;
          --v609;
        }
        while (v609);
      }
      else
      {
        float32x2_t v607 = 0;
      }
      int8x8_t v610 = (int8x8_t)vceqz_f32(v607);
      *(int8x8_t *)(v602 + 8 * v601) = vbsl_s8(v610, v600, (int8x8_t)v607);
      if (((v610.i32[0] | v610.i32[1]) & 1) == 0)
      {
        float32x2_t v611 = (unsigned char *)*v604;
        if ((unint64_t)*v604 < *v660)
        {
          *float32x2_t v611 = v601;
          uint64_t v605 = (uint64_t)(v611 + 1);
        }
        else
        {
          float32x2_t v612 = v236;
          float32x2_t v613 = (unsigned char **)v603;
          float32x2_t v614 = (unsigned char *)*v603;
          unint64_t v615 = (unint64_t)&v611[-*v603];
          unint64_t v616 = v615 + 1;
          if ((uint64_t)(v615 + 1) < 0) {
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v617 = *v660 - (void)v614;
          if (2 * v617 > v616) {
            unint64_t v616 = 2 * v617;
          }
          if (v617 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v618 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v618 = v616;
          }
          if (v618)
          {
            size_t v619 = v618;
            float32x2_t v620 = (char *)operator new(v618);
            size_t v618 = v619;
          }
          else
          {
            float32x2_t v620 = 0;
          }
          float32x2_t v621 = &v620[v615];
          v620[v615] = v601;
          uint64_t v605 = (uint64_t)&v620[v615 + 1];
          if (v611 == v614)
          {
            float32x2_t v603 = v613;
            goto LABEL_631;
          }
          if (v615 >= 8 && (unint64_t)(v614 - v620) >= 0x20)
          {
            if (v615 >= 0x20)
            {
              unint64_t v622 = v615 & 0xFFFFFFFFFFFFFFE0;
              float32x2_t v623 = &v620[v615 - 16];
              float32x2_t v624 = (long long *)(v611 - 16);
              unint64_t v625 = v615 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                long long v626 = *v624;
                *((_OWORD *)v623 - 1) = *(v624 - 1);
                *(_OWORD *)float32x2_t v623 = v626;
                v623 -= 32;
                v624 -= 2;
                v625 -= 32;
              }
              while (v625);
              if (v615 == v622) {
                goto LABEL_625;
              }
              if ((v615 & 0x18) != 0) {
                goto LABEL_622;
              }
              v621 -= v622;
              v611 -= v622;
            }
            else
            {
              unint64_t v622 = 0;
LABEL_622:
              unint64_t v627 = v622 - (v615 & 0xFFFFFFFFFFFFFFF8);
              float32x2_t v628 = &v611[-v622];
              float32x2_t v629 = &v620[&v611[-v622] - v614 - 8];
              float32x2_t v630 = (uint64_t *)(v628 - 8);
              do
              {
                uint64_t v631 = *v630--;
                *(void *)float32x2_t v629 = v631;
                v629 -= 8;
                v627 += 8;
              }
              while (v627);
              if (v615 == (v615 & 0xFFFFFFFFFFFFFFF8))
              {
LABEL_625:
                float32x2_t v611 = v614;
                float32x2_t v621 = v620;
                float32x2_t v603 = v613;
                goto LABEL_631;
              }
              v621 -= v615 & 0xFFFFFFFFFFFFFFF8;
              v611 -= v615 & 0xFFFFFFFFFFFFFFF8;
            }
          }
          float32x2_t v632 = v621 - 1;
          do
          {
            char v633 = *--v611;
            *v632-- = v633;
          }
          while (v611 != v614);
          float32x2_t v603 = v613;
          float32x2_t v611 = *v613;
          float32x2_t v621 = v620;
LABEL_631:
          *float32x2_t v603 = v621;
          *float32x2_t v604 = v605;
          *float32x2_t v660 = &v620[v618];
          unint64_t v226 = v649;
          float32x2_t v236 = v612;
          if (v611) {
            operator delete(v611);
          }
          uint64_t v602 = v657;
        }
        *float32x2_t v604 = v605;
        ++*a9;
      }
      ++v601;
      float32x2_t v599 = (void *)((char *)v599 + 4);
      v597 += 16;
      if (v601 != 14) {
        continue;
      }
      break;
    }
    uint64_t v598 = v653 + 1;
    float32x2_t v599 = v651 + 7;
    uint64_t v597 = v655 + 224;
    if (v653 != 7) {
      continue;
    }
    break;
  }
  float32x2_t v671 = &unk_270717340;
  if (v672 && v674) {
    MEMORY[0x25A2D62A0]();
  }
  float32x2_t v676 = &unk_270717340;
  if (v677 && v679) {
    MEMORY[0x25A2D62A0]();
  }
  float32x2_t v634 = (void **)__p;
  if (__p)
  {
    float32x2_t v635 = v682;
    if (v682 != __p)
    {
      float32x2_t v636 = v682;
      do
      {
        float32x2_t v639 = (char *)*(v636 - 3);
        v636 -= 3;
        float32x2_t v638 = v639;
        if (v639)
        {
          float32x2_t v640 = (char *)*(v635 - 2);
          float32x2_t v637 = v638;
          if (v640 != v638)
          {
            float32x2_t v641 = (char *)*(v635 - 2);
            do
            {
              float32x2_t v643 = (void *)*((void *)v641 - 3);
              v641 -= 24;
              float32x2_t v642 = v643;
              if (v643)
              {
                *((void *)v640 - 2) = v642;
                operator delete(v642);
              }
              float32x2_t v640 = v641;
            }
            while (v641 != v638);
            float32x2_t v637 = *v636;
          }
          *(v635 - 2) = v638;
          operator delete(v637);
        }
        float32x2_t v635 = v636;
      }
      while (v636 != v634);
    }
    operator delete(v634);
  }
  return 0;
}

- (void)clipSpotsLocation:(id *)a3 refSpotsLoc:(id *)a4 clippedSpotLocations:(id *)a5 numOfClippedSpots:(unint64_t *)a6
{
  uint64_t v6 = 0;
  uint64_t v61 = *MEMORY[0x263EF8340];
  float allowedDistFromCalib = self->_allowedDistFromCalib;
  *a6 = 0;
  a5->var1 = a3->var1;
  a5->var2 = a3->var2;
  __int16 v8 = *(_WORD *)a3->var3;
  a5->var3[2] = a3->var3[2];
  *(_WORD *)a5->var3 = v8;
  unint64_t v9 = *a6;
  do
  {
    float32x2_t v10 = (float32x2_t)a4->var0[0].var0[v6];
    float32x2_t v11 = vsub_f32((float32x2_t)a3->var0[0].var0[v6], v10);
    float v12 = sqrtf(vaddv_f32(vmul_f32(v11, v11)));
    float v13 = 1.0;
    if (v12 == 0.0)
    {
      if (v12 <= allowedDistFromCalib) {
        goto LABEL_2;
      }
LABEL_10:
      *a6 = ++v9;
      goto LABEL_2;
    }
    if (allowedDistFromCalib >= v12) {
      float v14 = v12;
    }
    else {
      float v14 = allowedDistFromCalib;
    }
    float v13 = v14 / v12;
    if (v12 > allowedDistFromCalib) {
      goto LABEL_10;
    }
LABEL_2:
    a5->var0[0].var0[v6++] = ($94F468A8D4C62B317260615823C2B210)vmla_n_f32(v10, v11, v13);
  }
  while (v6 != 14);
  for (uint64_t i = 0; i != 14; ++i)
  {
    float32x2_t v16 = (float32x2_t)a4->var0[1].var0[i];
    float32x2_t v17 = vsub_f32((float32x2_t)a3->var0[1].var0[i], v16);
    float v18 = sqrtf(vaddv_f32(vmul_f32(v17, v17)));
    float v19 = 1.0;
    if (v18 == 0.0)
    {
      if (v18 <= allowedDistFromCalib) {
        goto LABEL_12;
      }
LABEL_20:
      *a6 = ++v9;
      goto LABEL_12;
    }
    if (allowedDistFromCalib >= v18) {
      float v20 = v18;
    }
    else {
      float v20 = allowedDistFromCalib;
    }
    float v19 = v20 / v18;
    if (v18 > allowedDistFromCalib) {
      goto LABEL_20;
    }
LABEL_12:
    a5->var0[1].var0[i] = ($94F468A8D4C62B317260615823C2B210)vmla_n_f32(v16, v17, v19);
  }
  for (uint64_t j = 0; j != 14; ++j)
  {
    float32x2_t v22 = (float32x2_t)a4->var0[2].var0[j];
    float32x2_t v23 = vsub_f32((float32x2_t)a3->var0[2].var0[j], v22);
    float v24 = sqrtf(vaddv_f32(vmul_f32(v23, v23)));
    float v25 = 1.0;
    if (v24 == 0.0)
    {
      if (v24 <= allowedDistFromCalib) {
        goto LABEL_22;
      }
LABEL_30:
      *a6 = ++v9;
      goto LABEL_22;
    }
    if (allowedDistFromCalib >= v24) {
      float v26 = v24;
    }
    else {
      float v26 = allowedDistFromCalib;
    }
    float v25 = v26 / v24;
    if (v24 > allowedDistFromCalib) {
      goto LABEL_30;
    }
LABEL_22:
    a5->var0[2].var0[j] = ($94F468A8D4C62B317260615823C2B210)vmla_n_f32(v22, v23, v25);
  }
  for (uint64_t k = 0; k != 14; ++k)
  {
    float32x2_t v28 = (float32x2_t)a4->var0[3].var0[k];
    float32x2_t v29 = vsub_f32((float32x2_t)a3->var0[3].var0[k], v28);
    float v30 = sqrtf(vaddv_f32(vmul_f32(v29, v29)));
    float v31 = 1.0;
    if (v30 == 0.0)
    {
      if (v30 <= allowedDistFromCalib) {
        goto LABEL_32;
      }
LABEL_40:
      *a6 = ++v9;
      goto LABEL_32;
    }
    if (allowedDistFromCalib >= v30) {
      float v32 = v30;
    }
    else {
      float v32 = allowedDistFromCalib;
    }
    float v31 = v32 / v30;
    if (v30 > allowedDistFromCalib) {
      goto LABEL_40;
    }
LABEL_32:
    a5->var0[3].var0[k] = ($94F468A8D4C62B317260615823C2B210)vmla_n_f32(v28, v29, v31);
  }
  for (uint64_t m = 0; m != 14; ++m)
  {
    float32x2_t v34 = (float32x2_t)a4->var0[4].var0[m];
    float32x2_t v35 = vsub_f32((float32x2_t)a3->var0[4].var0[m], v34);
    float v36 = sqrtf(vaddv_f32(vmul_f32(v35, v35)));
    float v37 = 1.0;
    if (v36 == 0.0)
    {
      if (v36 <= allowedDistFromCalib) {
        goto LABEL_42;
      }
LABEL_50:
      *a6 = ++v9;
      goto LABEL_42;
    }
    if (allowedDistFromCalib >= v36) {
      float v38 = v36;
    }
    else {
      float v38 = allowedDistFromCalib;
    }
    float v37 = v38 / v36;
    if (v36 > allowedDistFromCalib) {
      goto LABEL_50;
    }
LABEL_42:
    a5->var0[4].var0[m] = ($94F468A8D4C62B317260615823C2B210)vmla_n_f32(v34, v35, v37);
  }
  for (uint64_t n = 0; n != 14; ++n)
  {
    float32x2_t v40 = (float32x2_t)a4->var0[5].var0[n];
    float32x2_t v41 = vsub_f32((float32x2_t)a3->var0[5].var0[n], v40);
    float v42 = sqrtf(vaddv_f32(vmul_f32(v41, v41)));
    float v43 = 1.0;
    if (v42 == 0.0)
    {
      if (v42 <= allowedDistFromCalib) {
        goto LABEL_52;
      }
LABEL_60:
      *a6 = ++v9;
      goto LABEL_52;
    }
    if (allowedDistFromCalib >= v42) {
      float v44 = v42;
    }
    else {
      float v44 = allowedDistFromCalib;
    }
    float v43 = v44 / v42;
    if (v42 > allowedDistFromCalib) {
      goto LABEL_60;
    }
LABEL_52:
    a5->var0[5].var0[n] = ($94F468A8D4C62B317260615823C2B210)vmla_n_f32(v40, v41, v43);
  }
  for (iuint64_t i = 0; ii != 14; ++ii)
  {
    float32x2_t v46 = (float32x2_t)a4->var0[6].var0[ii];
    float32x2_t v47 = vsub_f32((float32x2_t)a3->var0[6].var0[ii], v46);
    float v48 = sqrtf(vaddv_f32(vmul_f32(v47, v47)));
    float v49 = 1.0;
    if (v48 == 0.0)
    {
      if (v48 <= allowedDistFromCalib) {
        goto LABEL_62;
      }
LABEL_70:
      *a6 = ++v9;
      goto LABEL_62;
    }
    if (allowedDistFromCalib >= v48) {
      float v50 = v48;
    }
    else {
      float v50 = allowedDistFromCalib;
    }
    float v49 = v50 / v48;
    if (v48 > allowedDistFromCalib) {
      goto LABEL_70;
    }
LABEL_62:
    a5->var0[6].var0[ii] = ($94F468A8D4C62B317260615823C2B210)vmla_n_f32(v46, v47, v49);
  }
  for (juint64_t j = 0; jj != 14; ++jj)
  {
    float32x2_t v52 = (float32x2_t)a4->var0[7].var0[jj];
    float32x2_t v53 = vsub_f32((float32x2_t)a3->var0[7].var0[jj], v52);
    float v54 = sqrtf(vaddv_f32(vmul_f32(v53, v53)));
    float v55 = 1.0;
    if (v54 == 0.0)
    {
      if (v54 <= allowedDistFromCalib) {
        goto LABEL_72;
      }
LABEL_80:
      *a6 = ++v9;
      goto LABEL_72;
    }
    if (allowedDistFromCalib >= v54) {
      float v56 = v54;
    }
    else {
      float v56 = allowedDistFromCalib;
    }
    float v55 = v56 / v54;
    if (v54 > allowedDistFromCalib) {
      goto LABEL_80;
    }
LABEL_72:
    a5->var0[7].var0[jj] = ($94F468A8D4C62B317260615823C2B210)vmla_n_f32(v52, v53, v55);
  }
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v57 = 136315394;
      float32x2_t v58 = "-[GmoEngine clipSpotsLocation:refSpotsLoc:clippedSpotLocations:numOfClippedSpots:]";
      __int16 v59 = 2048;
      unint64_t v60 = v9;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Number of clipped spots is: %zu", (uint8_t *)&v57, 0x16u);
    }
  }
}

- (int)calculateGtErrP95:(id *)a3 spotLocations:(id *)a4 result:(float *)a5
{
  uint64_t v5 = 0;
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v6 = &a4->var0[0].var0[7];
  float v7 = &a3->var0[0].var0[7];
  do
  {
    float v8 = v6[-7].var0 - v7[-7].var0;
    float v9 = v6[-7].var1 - v7[-7].var1;
    float v10 = v6[-6].var0 - v7[-6].var0;
    float v11 = v6[-6].var1 - v7[-6].var1;
    float v12 = v6[-5].var0 - v7[-5].var0;
    float v13 = v6[-5].var1 - v7[-5].var1;
    float v14 = v6[-4].var0 - v7[-4].var0;
    float v15 = v6[-4].var1 - v7[-4].var1;
    float v16 = (float)(v8 * v8) + (float)(v9 * v9);
    float v17 = v6[-3].var0 - v7[-3].var0;
    float v18 = v17 * v17;
    float v19 = v6[-3].var1 - v7[-3].var1;
    float v20 = (float)(v10 * v10) + (float)(v11 * v11);
    float v21 = v6[-2].var0 - v7[-2].var0;
    float v22 = (float)(v12 * v12) + (float)(v13 * v13);
    float v23 = v6[-2].var1 - v7[-2].var1;
    float v24 = (float)(v14 * v14) + (float)(v15 * v15);
    float v25 = v6[-1].var0 - v7[-1].var0;
    float v26 = v6[-1].var1 - v7[-1].var1;
    float v27 = v18 + (float)(v19 * v19);
    float v28 = (float)(v21 * v21) + (float)(v23 * v23);
    float v29 = v6->var1 - v7->var1;
    float v30 = (float)(v25 * v25) + (float)(v26 * v26);
    float v31 = v6[1].var0 - v7[1].var0;
    float v32 = v6[1].var1 - v7[1].var1;
    float v33 = (float)((float)(v6->var0 - v7->var0) * (float)(v6->var0 - v7->var0)) + (float)(v29 * v29);
    float v34 = v6[2].var0 - v7[2].var0;
    float v35 = v6[2].var1 - v7[2].var1;
    float v36 = (float)(v31 * v31) + (float)(v32 * v32);
    float v37 = v6[3].var0 - v7[3].var0;
    float v38 = (float)(v34 * v34) + (float)(v35 * v35);
    float v39 = v6[3].var1 - v7[3].var1;
    float v40 = (float)(v37 * v37) + (float)(v39 * v39);
    float v41 = v6[4].var0 - v7[4].var0;
    float v42 = v6[4].var1 - v7[4].var1;
    float v43 = (float)(v41 * v41) + (float)(v42 * v42);
    float var1 = v6[5].var1;
    float v45 = v7[5].var1;
    float v46 = v6[5].var0 - v7[5].var0;
    float32x2_t v47 = (float *)&v55[v5];
    float *v47 = sqrtf(v16);
    v47[1] = sqrtf(v20);
    float v48 = sqrtf(v28);
    float v49 = (float)(v46 * v46) + (float)((float)(var1 - v45) * (float)(var1 - v45));
    v47[2] = sqrtf(v22);
    v47[3] = sqrtf(v24);
    float var0 = v6[6].var0;
    float v51 = v6[6].var1;
    float v52 = v7[6].var0;
    float v53 = v7[6].var1;
    v47[4] = sqrtf(v27);
    v47[5] = v48;
    v47[6] = sqrtf(v30);
    v47[7] = sqrtf(v33);
    v47[8] = sqrtf(v36);
    v47[9] = sqrtf(v38);
    v47[10] = sqrtf(v40);
    v47[11] = sqrtf(v43);
    v47[12] = sqrtf(v49);
    v47[13] = sqrtf((float)((float)(var0 - v52) * (float)(var0 - v52)) + (float)((float)(v51 - v53) * (float)(v51 - v53)));
    v5 += 56;
    v6 += 14;
    v7 += 14;
  }
  while (v5 != 448);
  *a5 = common::utils::prctile<float>((uint64_t)v55, 0x5Fu);
  return 0;
}

- (int)calculateItpQual:(const PDAnchors *)a3 spotLocations:(id *)a4 result:(float *)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  [(GmoEngine *)self calculateSnrLoss:a3 gtSpotLocations:a4 radialTargetFlag:1 gtSnr:v43 snrLoss:v13];
  __asm { FMOV            V0.4S, #1.0 }
  v44[0] = vsubq_f32(_Q0, v13[0]);
  v44[1] = vsubq_f32(_Q0, v13[1]);
  v44[2] = vsubq_f32(_Q0, v13[2]);
  __asm { FMOV            V1.2S, #1.0 }
  float32x4_t v46 = vsubq_f32(_Q0, v15);
  float32x4_t v47 = vsubq_f32(_Q0, v16);
  float32x4_t v48 = vsubq_f32(_Q0, v17);
  float32x2_t v45 = vsub_f32(_D1, v14);
  float32x2_t v49 = vsub_f32(_D1, v18);
  float32x4_t v50 = vsubq_f32(_Q0, v19);
  float32x4_t v51 = vsubq_f32(_Q0, v20);
  float32x4_t v52 = vsubq_f32(_Q0, v21);
  float32x4_t v54 = vsubq_f32(_Q0, v23);
  float32x4_t v55 = vsubq_f32(_Q0, v24);
  float32x4_t v56 = vsubq_f32(_Q0, v25);
  float32x2_t v53 = vsub_f32(_D1, v22);
  float32x2_t v57 = vsub_f32(_D1, v26);
  float32x4_t v58 = vsubq_f32(_Q0, v27);
  float32x4_t v59 = vsubq_f32(_Q0, v28);
  float32x4_t v60 = vsubq_f32(_Q0, v29);
  float32x4_t v62 = vsubq_f32(_Q0, v31);
  float32x4_t v63 = vsubq_f32(_Q0, v32);
  float32x4_t v64 = vsubq_f32(_Q0, v33);
  float32x2_t v61 = vsub_f32(_D1, v30);
  float32x2_t v65 = vsub_f32(_D1, v34);
  float32x4_t v66 = vsubq_f32(_Q0, v35);
  float32x4_t v67 = vsubq_f32(_Q0, v36);
  float32x4_t v68 = vsubq_f32(_Q0, v37);
  float32x4_t v70 = vsubq_f32(_Q0, v39);
  float32x4_t v71 = vsubq_f32(_Q0, v40);
  float32x4_t v72 = vsubq_f32(_Q0, v41);
  float32x2_t v69 = vsub_f32(_D1, v38);
  float32x2_t v73 = vsub_f32(_D1, v42);
  *a5 = common::utils::prctile<float>((uint64_t)v44, 5u);
  return 0;
}

- (int)calculateSnrLoss:(const PDAnchors *)a3 gtSpotLocations:(id *)a4 radialTargetFlag:(BOOL)a5 gtSnr:(void *)a6 snrLoss:(void *)a7
{
  uint64_t v7 = ((uint64_t (*)(GmoEngine *, SEL, const PDAnchors *))MEMORY[0x270FA5388])(self, a2, a3);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  float32x2_t v14 = (void *)v7;
  v15.i32[0] = 1161527296;
  peridot::compensateForParallax(*(void **)(*(void *)(v7 + 24) + 402528), v16, 0, v29, v15);
  peridot::anchorsForSpotLocations((uint64_t)v29, v28);
  LODWORD(v17) = 0.5;
  [v14 calculateGaussianIntegralForFrame:v29 anchors:v28 spotSize:v27 integral:v17];
  LODWORD(v18) = 0.5;
  [v14 calculateGaussianIntegralForFrame:v29 anchors:v13 spotSize:v26 integral:v18];
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  do
  {
    uint64_t v21 = 0;
    uint64_t v22 = v19;
    do
    {
      float v23 = sqrtf((float)((float)(*(float *)&v27[v22 + 4] + *(float *)&v27[v22])+ (float)(*(float *)&v27[v22 + 8] + *(float *)&v27[v22 + 12]))+ (float)(*(float *)&v27[v22 + 16] + *(float *)&v27[v22 + 20]));
      float v24 = sqrtf((float)((float)(*(float *)&v26[v22 + 4] + *(float *)&v26[v22])+ (float)(*(float *)&v26[v22 + 8] + *(float *)&v26[v22 + 12]))+ (float)(*(float *)&v26[v22 + 16] + *(float *)&v26[v22 + 20]));
      *(float *)(v11 + v21) = v23;
      *(float *)(v9 + v21) = 1.0 - (float)(v24 / v23);
      v21 += 4;
      v22 += 48;
    }
    while (v21 != 56);
    ++v20;
    v9 += 56;
    v11 += 56;
    v19 += 672;
  }
  while (v20 != 8);
  return 0;
}

- (void)calculateGaussianIntegralForFrame:(id *)a3 anchors:(const PDAnchors *)a4 spotSize:(float)a5 integral:(void *)a6
{
  uint64_t v8 = 0;
  p_float var1 = &a3->var0[0].var0[0].var1;
  p_y = &a4->banks[0].anchors[0].y;
  float v10 = 0.70711 / a5;
  do
  {
    uint64_t v11 = 0;
    float v12 = (float)v8;
    uint64_t v13 = p_y;
    float32x2_t v14 = p_var1;
    int32x2_t v15 = (char *)a6;
    do
    {
      uint64_t v16 = 0;
      double v17 = v13;
      double v18 = v14;
      do
      {
        LOBYTE(a5) = *(v17 - 1);
        v6.i32[0] = *(__int32 *)(v18 - 1);
        float v19 = (float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a5)).i32[0] - *(float *)v6.i32)
            + v12;
        float v20 = v19 + -1.0;
        v6.i8[0] = *v17;
        float v21 = (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v6)).i32[0] - *v18;
        float v22 = v21 + -1.0;
        double v23 = erff(v10 * v19);
        float v24 = (v23 - erff(v10 * v20)) * 0.5;
        double v25 = erff(v10 * v21);
        double v26 = (v25 - erff(v10 * v22)) * 0.5;
        *(float *)&double v26 = v26;
        a5 = *(float *)&v26 * v24;
        *(float *)&v15[v16] = a5;
        v16 += 48;
        v18 += 2;
        v17 += 3;
      }
      while (v16 != 672);
      ++v11;
      v15 += 672;
      v14 += 28;
      v13 += 42;
    }
    while (v11 != 8);
    uint64_t v27 = 0;
    float32x4_t v28 = p_y;
    float32x4_t v29 = p_var1;
    float32x2_t v30 = (char *)a6;
    float v31 = 1.0;
    do
    {
      float32x4_t v32 = v28;
      float32x4_t v33 = v29;
      for (uint64_t i = 12; i != 684; i += 48)
      {
        LOBYTE(a5) = *(v32 - 1);
        v6.i32[0] = *(__int32 *)(v33 - 1);
        float v35 = (float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a5)).i32[0] - *(float *)v6.i32)
            + v12;
        float v36 = v35 + -1.0;
        v6.i8[0] = *v32;
        float v37 = (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v6)).i32[0] - *v33;
        float v38 = v37 + v31;
        double v39 = erff(v10 * v35);
        *(float *)&double v39 = (v39 - erff(v10 * v36)) * 0.5;
        double v40 = erff(v10 * v38);
        float v41 = erff(v10 * v37);
        float v31 = 1.0;
        double v42 = (v40 - v41) * 0.5;
        *(float *)&double v42 = v42;
        a5 = *(float *)&v42 * *(float *)&v39;
        *(float *)&v30[i] = a5;
        v33 += 2;
        v32 += 3;
      }
      ++v27;
      v30 += 672;
      v29 += 28;
      v28 += 42;
    }
    while (v27 != 8);
    uint64_t v43 = 0;
    float v44 = p_y;
    float32x2_t v45 = p_var1;
    float32x4_t v46 = (char *)a6;
    do
    {
      float32x4_t v47 = v44;
      float32x4_t v48 = v45;
      for (uint64_t j = 24; j != 696; j += 48)
      {
        LOBYTE(a5) = *(v47 - 1);
        v6.i32[0] = *(__int32 *)(v48 - 1);
        float v50 = (float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a5)).i32[0] - *(float *)v6.i32)
            + v12;
        float v51 = v50 + -1.0;
        v6.i8[0] = *v47;
        float v52 = (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v6)).i32[0] - *v48;
        float v53 = v52 + 2.0;
        float v54 = v52 + v31;
        double v55 = erff(v10 * v50);
        float v56 = (v55 - erff(v10 * v51)) * 0.5;
        double v57 = erff(v10 * v53);
        float v58 = erff(v10 * v54);
        float v31 = 1.0;
        double v59 = (v57 - v58) * 0.5;
        *(float *)&double v59 = v59;
        a5 = *(float *)&v59 * v56;
        *(float *)&v46[j] = a5;
        v48 += 2;
        v47 += 3;
      }
      ++v43;
      v46 += 672;
      v45 += 28;
      v44 += 42;
    }
    while (v43 != 8);
    uint64_t v60 = 0;
    float32x2_t v61 = p_y;
    float32x4_t v62 = p_var1;
    float32x4_t v63 = (char *)a6;
    float v64 = 2.0;
    float v65 = 3.0;
    do
    {
      float32x4_t v66 = v61;
      float32x4_t v67 = v62;
      for (uint64_t k = 36; k != 708; k += 48)
      {
        LOBYTE(a5) = *(v66 - 1);
        v6.i32[0] = *(__int32 *)(v67 - 1);
        float v69 = (float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&a5)).i32[0] - *(float *)v6.i32)
            + v12;
        float v70 = v69 + -1.0;
        v6.i8[0] = *v66;
        float v71 = (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v6)).i32[0] - *v67;
        float v72 = v71 + v65;
        float v73 = v71 + v64;
        double v74 = erff(v10 * v69);
        float v75 = (v74 - erff(v10 * v70)) * 0.5;
        double v76 = erff(v10 * v72);
        float v77 = erff(v10 * v73);
        float v65 = 3.0;
        float v64 = 2.0;
        double v78 = (v76 - v77) * 0.5;
        *(float *)&double v78 = v78;
        a5 = *(float *)&v78 * v75;
        *(float *)&v63[k] = a5;
        v67 += 2;
        v66 += 3;
      }
      ++v60;
      v63 += 672;
      v62 += 28;
      v61 += 42;
    }
    while (v60 != 8);
    ++v8;
    a6 = (char *)a6 + 4;
  }
  while (v8 != 3);
}

@end