@interface ROI
- ($90F8316DFF8C7E624C13ADF498D66361)descriptor;
- (BOOL)LSIsHighRisk;
- (BOOL)doneKPToBBoxViaGraphTraversal;
- (BOOL)isPredictedFromPast;
- (BOOL)isReflectedLS;
- (BOOL)isTracked;
- (BOOL)isTrajectoryPruningPassed;
- (BOOL)kpIsFromHW;
- (BOOL)lsHasBeenUsedForTrackingGhost;
- (BOOL)trackFail;
- (NSMutableArray)matchedLS;
- (NSMutableArray)trackIDsAfterMerge;
- (NSString)LSTrackID;
- (ROI)LSTrackingMatched;
- (ROI)initWithBbox:(ROI *)self;
- (ROI)initWithBbox:(id *)a3 descriptor:;
- (ROI)temporalDetectionMatched;
- (double)LSOrGGBbox;
- (double)bbox;
- (double)defaultOpticalCenter;
- (double)differenceOfGaussianAndLumaFeature;
- (double)differenceOfGaussianAndLumaFeaturePredictedLocation;
- (double)differenceOfGaussianAndLumaFeatureReflection;
- (double)getReflectedBboxAroundCenter:(void *)a1;
- (float)area;
- (float)dist2ghost;
- (float)dist2opticalCenter;
- (float)getLocationMatchCostWith:(id)a3;
- (float)getPixelFeatureMatchCostWith:(id)a3;
- (float32x2_t)getReflectedBboxCenterAroundCenter:(void *)a1;
- (int)LSTrackingVote;
- (int)lowSaliencyCnt;
- (int)predictedFromPastCnt;
- (int)temporalDetectionVote;
- (int)trackID;
- (int)trackedCnt;
- (void)generateLocationFromBBox;
- (void)lumaFeatureVector;
- (void)lumaFeatureVectorPredictedLocation;
- (void)lumaFeatureVectorReflection;
- (void)reflectAroundCenter:(ROI *)self;
- (void)setArea:(float)a3;
- (void)setBbox:(ROI *)self;
- (void)setDefaultOpticalCenter:(ROI *)self;
- (void)setDescriptor:(id *)a3;
- (void)setDifferenceOfGaussianAndLumaFeature:(ROI *)self;
- (void)setDifferenceOfGaussianAndLumaFeaturePredictedLocation:(ROI *)self;
- (void)setDifferenceOfGaussianAndLumaFeatureReflection:(ROI *)self;
- (void)setDist2ghost:(float)a3;
- (void)setDist2opticalCenter:(float)a3;
- (void)setDoneKPToBBoxViaGraphTraversal:(BOOL)a3;
- (void)setIsPredictedFromPast:(BOOL)a3;
- (void)setIsReflectedLS:(BOOL)a3;
- (void)setIsTracked:(BOOL)a3;
- (void)setIsTrajectoryPruningPassed:(BOOL)a3;
- (void)setKpIsFromHW:(BOOL)a3;
- (void)setLSIsHighRisk:(BOOL)a3;
- (void)setLSOrGGBbox:(ROI *)self;
- (void)setLSTrackID:(id)a3;
- (void)setLSTrackingMatched:(id)a3;
- (void)setLSTrackingVote:(int)a3;
- (void)setLowSaliencyCnt:(int)a3;
- (void)setLsHasBeenUsedForTrackingGhost:(BOOL)a3;
- (void)setLumaFeatureVector:(ROI *)self;
- (void)setLumaFeatureVectorPredictedLocation:(ROI *)self;
- (void)setLumaFeatureVectorReflection:(ROI *)self;
- (void)setMatchedLS:(id)a3;
- (void)setPredictedFromPastCnt:(int)a3;
- (void)setTemporalDetectionMatched:(id)a3;
- (void)setTemporalDetectionVote:(int)a3;
- (void)setTrackFail:(BOOL)a3;
- (void)setTrackID:(int)a3;
- (void)setTrackIDsAfterMerge:(id)a3;
- (void)setTrackedCnt:(int)a3;
@end

@implementation ROI

- (ROI)initWithBbox:(ROI *)self
{
  double v7 = v2;
  v8.receiver = self;
  v8.super_class = (Class)ROI;
  v3 = [(ROI *)&v8 init];
  v4 = v3;
  if (v3)
  {
    [(ROI *)v3 setBbox:v7];
    v5 = v4;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v4;
}

- (ROI)initWithBbox:(id *)a3 descriptor:
{
  v4 = -[ROI initWithBbox:](self, "initWithBbox:");
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3[4].var4;
    v13[6] = *(_OWORD *)&a3[4].var0;
    v13[7] = v6;
    long long v7 = *(_OWORD *)&a3[6].var0;
    v13[8] = *(_OWORD *)&a3[5].var2;
    v13[9] = v7;
    long long v8 = *(_OWORD *)&a3[2].var0;
    v13[2] = *(_OWORD *)&a3[1].var2;
    v13[3] = v8;
    long long v9 = *(_OWORD *)&a3[3].var2;
    v13[4] = *(_OWORD *)&a3[2].var4;
    v13[5] = v9;
    long long v10 = *(_OWORD *)&a3->var4;
    v13[0] = *(_OWORD *)&a3->var0;
    v13[1] = v10;
    [(ROI *)v4 setDescriptor:v13];
    v11 = v5;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v5;
}

- (float)getLocationMatchCostWith:(id)a3
{
  id v4 = a3;
  [(ROI *)self descriptor];
  if (v4)
  {
    [v4 descriptor];
    float32x2_t v5 = v8;
  }
  else
  {
    float32x2_t v5 = 0;
  }

  float32x2_t v6 = vsub_f32(v9, v5);
  return sqrtf(vaddv_f32(vmul_f32(v6, v6)));
}

- (float)getPixelFeatureMatchCostWith:(id)a3
{
  id v4 = a3;
  [(ROI *)self descriptor];
  if (v4)
  {
    [v4 descriptor];
    unsigned int v5 = v35;
    if (v36 < v35) {
      unsigned int v5 = v36;
    }
    if (!v5) {
      goto LABEL_12;
    }
    [v4 descriptor];
    int8x16_t v6 = (int8x16_t)vaddq_s16(vaddq_s16(v31, v33), vaddq_s16(v32, v34));
    *(int16x4_t *)v6.i8 = vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
    int8x16_t v7 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v6.i8);
    uint32x4_t v8 = vaddw_u16((uint32x4_t)vextq_s8(v7, v7, 8uLL), *(uint16x4_t *)v6.i8);
    int v9 = (__int16)(v8.i16[0] + v8.i16[2]);
    [(ROI *)self descriptor];
    int8x16_t v10 = (int8x16_t)vaddq_s16(vaddq_s16(v27, v29), vaddq_s16(v28, v30));
    *(int16x4_t *)v10.i8 = vadd_s16(*(int16x4_t *)v10.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL));
    int8x16_t v11 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v10.i8);
    uint32x4_t v12 = vaddw_u16((uint32x4_t)vextq_s8(v11, v11, 8uLL), *(uint16x4_t *)v10.i8);
    int v13 = v9 <= (__int16)(v12.i16[0] + v12.i16[2]) ? (__int16)(v12.i16[0] + v12.i16[2]) : v9;
    if (v13 >= 1)
    {
      [v4 descriptor];
      [(ROI *)self descriptor];
      int8x16_t v14 = (int8x16_t)vaddq_s16(vaddq_s16(vabsq_s16(vsubq_s16(v25, v21)), vabsq_s16(vsubq_s16(v23, v19))), vaddq_s16(vabsq_s16(vsubq_s16(v26, v22)), vabsq_s16(vsubq_s16(v24, v20))));
      *(int16x4_t *)v14.i8 = vadd_s16(*(int16x4_t *)v14.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL));
      int8x16_t v15 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v14.i8);
      uint32x4_t v16 = vaddw_u16((uint32x4_t)vextq_s8(v15, v15, 8uLL), *(uint16x4_t *)v14.i8);
      float v17 = (float)(__int16)(v16.i16[0] + v16.i16[2]) / 8160.0;
    }
    else
    {
LABEL_12:
      float v17 = INFINITY;
    }
  }
  else
  {
    float v17 = INFINITY;
  }

  return v17;
}

- (void)reflectAroundCenter:(ROI *)self
{
  float32x2_t v3 = v2;
  [(ROI *)self bbox];
  float32x2_t v7 = v5;
  [(ROI *)self bbox];
  double v8 = COERCE_DOUBLE(vadd_f32(vsub_f32(v3, vadd_f32(v7, (float32x2_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL))), v3));
  [(ROI *)self bbox];
  [(ROI *)self setBbox:v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  [(ROI *)self descriptor];
  [(ROI *)self descriptor];
  *(float32x2_t *)&long long v11 = vadd_f32(vsub_f32(v3, v10), v3);
  v9[6] = v17;
  v9[7] = v18;
  v9[8] = v19;
  v9[9] = v20;
  v9[2] = v13;
  v9[3] = v14;
  v9[4] = v15;
  v9[5] = v16;
  v9[0] = v11;
  v9[1] = v12;
  [(ROI *)self setDescriptor:v9];
}

- (double)getReflectedBboxAroundCenter:(void *)a1
{
  [a1 bbox];
  float32x2_t v7 = v4;
  [a1 bbox];
  double v8 = COERCE_DOUBLE(vadd_f32(vsub_f32(a2, vadd_f32(v7, (float32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL))), a2));
  [a1 bbox];
  return v8;
}

- (void)generateLocationFromBBox
{
  [(ROI *)self bbox];
  float32x2_t v5 = v3;
  [(ROI *)self bbox];
  self[1].super.isa = (Class)vadd_f32(v5, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL), (float32x2_t)0x3F0000003F000000));
}

- (float32x2_t)getReflectedBboxCenterAroundCenter:(void *)a1
{
  [a1 bbox];
  float32x2_t v7 = v4;
  [a1 bbox];
  return vmla_f32(vneg_f32(vmla_f32(v7, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL))), (float32x2_t)0x4000000040000000, a2);
}

- (double)bbox
{
  objc_copyStruct(&v2, (const void *)(a1 + 128), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setBbox:(ROI *)self
{
  long long v3 = v2;
  objc_copyStruct(self->_bbox, &v3, 16, 1, 0);
}

- (float)area
{
  return self->_area;
}

- (void)setArea:(float)a3
{
  self->_area = a3;
}

- ($90F8316DFF8C7E624C13ADF498D66361)descriptor
{
  objc_copyStruct(retstr, &self[1], 160, 1, 0);
  return result;
}

- (void)setDescriptor:(id *)a3
{
}

- (double)LSOrGGBbox
{
  objc_copyStruct(&v2, (const void *)(a1 + 144), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setLSOrGGBbox:(ROI *)self
{
  long long v3 = v2;
  objc_copyStruct(self->_LSOrGGBbox, &v3, 16, 1, 0);
}

- (int)temporalDetectionVote
{
  return self->_temporalDetectionVote;
}

- (void)setTemporalDetectionVote:(int)a3
{
  self->_temporalDetectionVote = a3;
}

- (int)LSTrackingVote
{
  return self->_LSTrackingVote;
}

- (void)setLSTrackingVote:(int)a3
{
  self->_LSTrackingVote = a3;
}

- (NSMutableArray)matchedLS
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMatchedLS:(id)a3
{
}

- (BOOL)doneKPToBBoxViaGraphTraversal
{
  return self->_doneKPToBBoxViaGraphTraversal;
}

- (void)setDoneKPToBBoxViaGraphTraversal:(BOOL)a3
{
  self->_doneKPToBBoxViaGraphTraversal = a3;
}

- (BOOL)trackFail
{
  return self->_trackFail;
}

- (void)setTrackFail:(BOOL)a3
{
  self->_trackFail = a3;
}

- (ROI)temporalDetectionMatched
{
  return (ROI *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTemporalDetectionMatched:(id)a3
{
}

- (ROI)LSTrackingMatched
{
  return (ROI *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLSTrackingMatched:(id)a3
{
}

- (int)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (NSString)LSTrackID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLSTrackID:(id)a3
{
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (BOOL)isTrajectoryPruningPassed
{
  return self->_isTrajectoryPruningPassed;
}

- (void)setIsTrajectoryPruningPassed:(BOOL)a3
{
  self->_isTrajectoryPruningPassed = a3;
}

- (BOOL)LSIsHighRisk
{
  return self->_LSIsHighRisk;
}

- (void)setLSIsHighRisk:(BOOL)a3
{
  self->_LSIsHighRisk = a3;
}

- (double)defaultOpticalCenter
{
  return *(double *)(a1 + 88);
}

- (void)setDefaultOpticalCenter:(ROI *)self
{
  *(void *)self->_defaultOpticalCenter = v2;
}

- (BOOL)isPredictedFromPast
{
  return self->_isPredictedFromPast;
}

- (void)setIsPredictedFromPast:(BOOL)a3
{
  self->_isPredictedFromPast = a3;
}

- (int)predictedFromPastCnt
{
  return self->_predictedFromPastCnt;
}

- (void)setPredictedFromPastCnt:(int)a3
{
  self->_predictedFromPastCnt = a3;
}

- (int)trackedCnt
{
  return self->_trackedCnt;
}

- (void)setTrackedCnt:(int)a3
{
  self->_trackedCnt = a3;
}

- (int)lowSaliencyCnt
{
  return self->_lowSaliencyCnt;
}

- (void)setLowSaliencyCnt:(int)a3
{
  self->_lowSaliencyCnt = a3;
}

- (NSMutableArray)trackIDsAfterMerge
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTrackIDsAfterMerge:(id)a3
{
}

- (BOOL)isReflectedLS
{
  return self->_isReflectedLS;
}

- (void)setIsReflectedLS:(BOOL)a3
{
  self->_isReflectedLS = a3;
}

- (BOOL)lsHasBeenUsedForTrackingGhost
{
  return self->_lsHasBeenUsedForTrackingGhost;
}

- (void)setLsHasBeenUsedForTrackingGhost:(BOOL)a3
{
  self->_lsHasBeenUsedForTrackingGhost = a3;
}

- (void)lumaFeatureVector
{
}

- (void)setLumaFeatureVector:(ROI *)self
{
  long long v3 = *v2;
  long long v4 = v2[1];
  long long v5 = v2[3];
  v6[2] = v2[2];
  v6[3] = v5;
  v6[0] = v3;
  v6[1] = v4;
  objc_copyStruct(self->_lumaFeatureVector, v6, 64, 1, 0);
}

- (void)lumaFeatureVectorReflection
{
}

- (void)setLumaFeatureVectorReflection:(ROI *)self
{
  long long v3 = *v2;
  long long v4 = v2[1];
  long long v5 = v2[3];
  v6[2] = v2[2];
  v6[3] = v5;
  v6[0] = v3;
  v6[1] = v4;
  objc_copyStruct(self->_lumaFeatureVectorReflection, v6, 64, 1, 0);
}

- (void)lumaFeatureVectorPredictedLocation
{
}

- (void)setLumaFeatureVectorPredictedLocation:(ROI *)self
{
  long long v3 = *v2;
  long long v4 = v2[1];
  long long v5 = v2[3];
  v6[2] = v2[2];
  v6[3] = v5;
  v6[0] = v3;
  v6[1] = v4;
  objc_copyStruct(self->_lumaFeatureVectorPredictedLocation, v6, 64, 1, 0);
}

- (double)differenceOfGaussianAndLumaFeature
{
  return *(double *)(a1 + 104);
}

- (void)setDifferenceOfGaussianAndLumaFeature:(ROI *)self
{
  *(void *)self->_differenceOfGaussianAndLumaFeature = v2;
}

- (double)differenceOfGaussianAndLumaFeatureReflection
{
  return *(double *)(a1 + 112);
}

- (void)setDifferenceOfGaussianAndLumaFeatureReflection:(ROI *)self
{
  *(void *)self->_differenceOfGaussianAndLumaFeatureReflection = v2;
}

- (double)differenceOfGaussianAndLumaFeaturePredictedLocation
{
  return *(double *)(a1 + 120);
}

- (void)setDifferenceOfGaussianAndLumaFeaturePredictedLocation:(ROI *)self
{
  *(void *)self->_differenceOfGaussianAndLumaFeaturePredictedLocation = v2;
}

- (float)dist2ghost
{
  return self->_dist2ghost;
}

- (void)setDist2ghost:(float)a3
{
  self->_dist2ghost = a3;
}

- (float)dist2opticalCenter
{
  return self->_dist2opticalCenter;
}

- (void)setDist2opticalCenter:(float)a3
{
  self->_dist2opticalCenter = a3;
}

- (BOOL)kpIsFromHW
{
  return self->_kpIsFromHW;
}

- (void)setKpIsFromHW:(BOOL)a3
{
  self->_kpIsFromHW = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackIDsAfterMerge, 0);
  objc_storeStrong((id *)&self->_LSTrackID, 0);
  objc_storeStrong((id *)&self->_LSTrackingMatched, 0);
  objc_storeStrong((id *)&self->_temporalDetectionMatched, 0);

  objc_storeStrong((id *)&self->_matchedLS, 0);
}

@end