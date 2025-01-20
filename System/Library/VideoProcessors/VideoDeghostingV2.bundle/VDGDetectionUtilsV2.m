@interface VDGDetectionUtilsV2
- ($E04785D6C22F149E9B1B648872290F90)configuration;
- (BOOL)ghostIsHighConfidence:(id)a3;
- (BOOL)isBoxSizeValidForProcessing:(float)a3 AndErodeBy:;
- (BOOL)locIsInSearchRange:(float)a3 searchLocation:(float)a4 defaultSearchLocation:(BOOL)a5 searchRadius:defaultSearchRange:searchInGivenLocsOnly:;
- (BOOL)updatePrevLSDoGAndLumaFeaturesWithMetalBuffers:(id *)a3;
- (CGPoint)calcOpticalCenterFromMetaData:(id)a3;
- (VDGDetectionUtilsV2)initWithMetalToolBox:(id)a3 configuration:(id *)a4 tuningParams:(id *)a5;
- (double)getSearchLocation:(void *)a3;
- (float)getTemporalDetectionSearchRadiusForReferenceFrameIndex:(float)a3 minSearchRadius:(float)a4 slope:(float)a5;
- (float)getTrajectoryMatchingCostGG:(id)a3;
- (float32x2_t)predictPrevLSLocation:(int32x4_t)a3 usingPrevToCurrentHomography:(uint64_t)a4;
- (id)generateDetectionRoiList:(id)a3;
- (id)getBestROIInROIList:(id)a3 referenceROI:(id)a4;
- (void)clearReferencedROIsForROIList:(id)a3;
- (void)dealloc;
- (void)findTinyKeypointLocationsFromLS:(id)a3 inputTexture:(id)a4 dilation:(float)a5 estimatedOpticalCenter:(id *)a6 metalBuffers:(int)a7 maxBufferLength:(float)a8 keypointSampleStepCount:;
- (void)generateBoxesForDoGAndLumaAndForLSROIs:(id)a3 prevGGROIs:(id)a4 inputTexture:(id)a5 opticalCenter:(id *)a6 metalBuffers:(int)a7 maxBufferLength:;
- (void)generateBoxesForDoGAndLumaAndForPrevLSROIs:(double)a3 homography:(double)a4 metalBuffers:(uint64_t)a5 maxBufferLength:(void *)a6;
- (void)generateTrajectoryForROI:(id)a3 isGG:(BOOL)a4;
- (void)generateTrajectoryForROIList:(id)a3 isGG:(BOOL)a4;
- (void)getGGCandidatesFromROIList:(id)a3 GGList:(id *)a4;
- (void)getHighRiskLS:(id)a3;
- (void)getTopGhostsInList:(id)a3 k:(signed __int16)a4 opticalCenter:(int)a5 ghostCntGatingTh:;
- (void)getTopLSInList:(id)a3 k:(signed __int16)a4 dist2ghostTol:(float)a5;
- (void)getTopLSInListByDroppingBottoms:(id)a3 k:(signed __int16)a4 dist2ghostTol:(float)a5;
- (void)getTopLSInListByKeepingTops:(id)a3 k:(signed __int16)a4 dist2ghostTol:(float)a5;
- (void)pruneGGList:(id *)a3 LSBBoxList:(id *)a4 reflectedLSBBoxList:getMatchedLS:pruneLS:pruneGG:;
- (void)pruneGGList:(id *)a3 LSList:(id *)a4 opticalCenter:(float)a5 costToKeepLS:(float)a6 costToKeepGG:;
- (void)pruneLSBasedOnDist2Ghost:(id)a3;
- (void)pruneUsingTrajectoryGGList:(id)a3;
- (void)removeDuplicateRois:(id)a3;
- (void)removeRedundantLS:(id)a3;
- (void)setConfiguration:(id *)a3;
- (void)setDefaultOpticalCenterForList:(id)a3 opticalCenter:;
- (void)setSimParams:(_simParamsStruct *)a3 withMetaData:(id)a4;
- (void)sortArray:(float *)a3 ofLength:(unsigned int)a4;
- (void)sortKPs:(id)a3 opticalCenter:;
- (void)updateDoGAndLumaFeaturesWithMetalBuffers:(id *)a3;
- (void)updateNewRoiPixFea:(VDGDetectionUtilsV2 *)self withRefPixFea:(SEL)a2;
@end

@implementation VDGDetectionUtilsV2

- (VDGDetectionUtilsV2)initWithMetalToolBox:(id)a3 configuration:(id *)a4 tuningParams:(id *)a5
{
  id v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)VDGDetectionUtilsV2;
  v9 = [(VDGDetectionUtilsV2 *)&v23 init];
  if (!v9) {
    goto LABEL_12;
  }
  v10 = v8 ? (GGMMetalToolBox *)v8 : objc_alloc_init(GGMMetalToolBox);
  metalToolBox = v9->_metalToolBox;
  v9->_metalToolBox = v10;

  long long v12 = *(_OWORD *)&a4->var0.var0;
  long long v13 = *(_OWORD *)&a4->var0.var7;
  long long v14 = *(_OWORD *)&a4->var1.var4;
  *(_OWORD *)&v9->_configuration.externalCfg.lightMode = *(_OWORD *)&a4->var1.var0;
  *(_OWORD *)&v9->_configuration.externalCfg.frameDelay = v14;
  *(_OWORD *)&v9->_configuration.internalCfg.clipThreshold = v12;
  *(_OWORD *)&v9->_configuration.internalCfg.enableColorMask = v13;
  size_t v15 = a5->var12 + (uint64_t)a5->var15;
  v9->_reflectedLSListLen = v15;
  v9->_reflectedLSList = (BOOL *)malloc_type_malloc(v15, 0x100004077774924uLL);
  uint64_t v16 = a5->var12 + (uint64_t)a5->var15;
  v9->_bboxListLen = v16;
  *(void *)v9->_bboxList = malloc_type_malloc(16 * v16, 0x1000040451B5BE8uLL);
  int64_t var15 = a5->var15;
  v9->_locationListLen = var15;
  *(void *)v9->_locationList = malloc_type_malloc(8 * var15, 0x100004000313F17uLL);
  size_t v18 = a5->var15;
  v9->_kpIsFromHWListLen = v18;
  v9->_kpIsFromHWList = (BOOL *)malloc_type_malloc(v18, 0x100004077774924uLL);
  int64_t v19 = a5->var15;
  v9->_dist2OpticalCenterListLen = v19;
  v20 = (float *)malloc_type_malloc(4 * v19, 0x100004052888210uLL);
  v9->_dist2OpticalCenterList = v20;
  if (!v9->_reflectedLSList) {
    goto LABEL_12;
  }
  if (*(void *)v9->_bboxList && *(void *)v9->_locationList && v9->_kpIsFromHWList && v20)
  {
    v21 = v9;
  }
  else
  {
LABEL_12:
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  free(*(void **)self->_bboxList);
  free(self->_reflectedLSList);
  free(*(void **)self->_locationList);
  free(self->_kpIsFromHWList);
  free(self->_dist2OpticalCenterList);
  v3.receiver = self;
  v3.super_class = (Class)VDGDetectionUtilsV2;
  [(VDGDetectionUtilsV2 *)&v3 dealloc];
}

- (BOOL)ghostIsHighConfidence:(id)a3
{
  id v3 = a3;
  if (([v3 isTrajectoryPruningPassed] & 1) != 0
    || (int)[v3 trackedCnt] >= 1)
  {
    unsigned int v4 = [v3 isReflectedLS] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)generateTrajectoryForROI:(id)a3 isGG:(BOOL)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4) {
    [v5 temporalDetectionMatched];
  }
  else {
  v7 = [v5 LSTrackingMatched];
  }
  id v8 = v7;
  if (v7)
  {
    [v7 bbox];
    float32x2_t v18 = v9;
    [v8 bbox];
    float32x2_t v11 = vadd_f32(v18, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL), (float32x2_t)0x3F0000003F000000));
    [v6 bbox];
    float32x2_t v19 = v12;
    [v6 bbox];
    float32x2_t v14 = vadd_f32(v19, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL), (float32x2_t)0x3F0000003F000000));
    if (!a4)
    {
      [v8 defaultOpticalCenter];
      float32x2_t v11 = sub_17B6C(v11, v15);
      [v6 defaultOpticalCenter];
      float32x2_t v14 = sub_17B6C(v14, v16);
    }
    float32x2_t v17 = vsub_f32(v14, v11);
    long long v30 = 0u;
    *(_OWORD *)v31[0].f32 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    [v8 descriptor];
    v31[1] = v17;
    v21[6] = v28;
    v21[7] = v29;
    v21[2] = v24;
    v21[3] = v25;
    v21[4] = v26;
    v21[5] = v27;
    v21[0] = v22;
    v21[1] = v23;
    v21[8] = v30;
    v21[9] = *(_OWORD *)v31[0].f32;
    [v8 setDescriptor:v21];
  }
  else
  {
    float32x2_t v17 = (float32x2_t)vdup_n_s32(0x7F800000u);
  }
  long long v30 = 0u;
  *(_OWORD *)v31[0].f32 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  if (v6) {
    [v6 descriptor];
  }
  v31[0] = v17;
  v20[6] = v28;
  v20[7] = v29;
  v20[2] = v24;
  v20[3] = v25;
  v20[4] = v26;
  v20[5] = v27;
  v20[0] = v22;
  v20[1] = v23;
  v20[8] = v30;
  v20[9] = *(_OWORD *)v31[0].f32;
  [v6 setDescriptor:v20];
}

- (void)generateTrajectoryForROIList:(id)a3 isGG:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      int8x16_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(VDGDetectionUtilsV2 *)self generateTrajectoryForROI:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) isGG:v4];
        int8x16_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (float)getTrajectoryMatchingCostGG:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 matchedLS];
  if (v3)
  {
    [v3 descriptor];
    float32x2_t v5 = (float32x2_t)v62;
  }
  else
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    float32x2_t v5 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
  }
  float v6 = 1.0;
  if ([v4 count])
  {
    uint32x2_t v7 = (uint32x2_t)vceq_f32(v5, (float32x2_t)vdup_n_s32(0x7F800000u));
    if ((vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v8 = v4;
      id v9 = [v8 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v9)
      {
        id v11 = v9;
        *(float32x2_t *)&long long v10 = vmul_f32(v5, v5);
        unsigned __int32 v12 = vadd_f32(*(float32x2_t *)&v10, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v10, 1)).u32[0];
        float v13 = vaddv_f32(*(float32x2_t *)&v10);
        *(float32x2_t *)&long long v10 = vrsqrte_f32((float32x2_t)v12);
        *(float32x2_t *)&long long v10 = vmul_f32(*(float32x2_t *)&v10, vrsqrts_f32((float32x2_t)v12, vmul_f32(*(float32x2_t *)&v10, *(float32x2_t *)&v10)));
        float32x2_t v14 = vmul_n_f32(v5, vmul_f32(*(float32x2_t *)&v10, vrsqrts_f32((float32x2_t)v12, vmul_f32(*(float32x2_t *)&v10, *(float32x2_t *)&v10))).f32[0]);
        uint64_t v15 = *(void *)v39;
        float32x2_t v16 = 0;
        *(void *)&long long v10 = 0;
        long long v36 = v10;
        float32x2_t v17 = (float32x2_t)vdup_n_s32(0x7F800000u);
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v39 != v15) {
              objc_enumerationMutation(v8);
            }
            float32x2_t v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (v19)
            {
              [v19 descriptor];
              float32x2_t v21 = (float32x2_t)v51;
            }
            else
            {
              v20.i32[1] = 0;
              long long v50 = 0u;
              long long v51 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              float32x2_t v21 = 0;
              long long v42 = 0u;
              long long v43 = 0u;
            }
            v20.i32[0] = 0;
            uint32x2_t v22 = (uint32x2_t)vceq_f32(v21, v17);
            int32x2_t v23 = (int32x2_t)vpmin_u32(v22, v22);
            int v24 = v23.i32[0];
            float32x2_t v25 = (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v20, v23), 0), (int8x8_t)0x8000000080000000, (int8x8_t)v21);
            long long v26 = v36;
            if (v24 >= 0) {
              *(float *)&long long v26 = *(float *)&v36 + 1.0;
            }
            long long v36 = v26;
            float32x2_t v16 = vadd_f32(v16, v25);
          }
          id v11 = [v8 countByEnumeratingWithState:&v38 objects:v52 count:16];
        }
        while (v11);

        float v6 = 1.0;
        if (*(float *)&v36 != 0.0)
        {
          float32x2_t v27 = vdiv_f32(v16, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v36, 0));
          float32x2_t v28 = vmul_f32(v27, v27);
          float v29 = sqrtf(vaddv_f32(v28));
          if (v29 > 10.0)
          {
            float32x2_t v37 = v28;
            [v3 setIsTrajectoryPruningPassed:1];
            float v30 = sqrtf(v13);
            float v6 = -1.0;
            if (v30 > 1.0)
            {
              float v31 = vabds_f32(v30, v29);
              if (v30 >= v29) {
                float v30 = v29;
              }
              if (v31 <= (float)(v30 + v30))
              {
                unsigned __int32 v32 = vadd_f32(v37, (float32x2_t)vdup_lane_s32((int32x2_t)v37, 1)).u32[0];
                float32x2_t v33 = vrsqrte_f32((float32x2_t)v32);
                float32x2_t v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)v32, vmul_f32(v33, v33)));
                float v6 = vaddv_f32(vmul_f32(v14, vmul_n_f32(v27, vmul_f32(v34, vrsqrts_f32((float32x2_t)v32, vmul_f32(v34, v34))).f32[0])));
              }
            }
          }
        }
      }
      else
      {
      }
    }
  }

  return v6;
}

- (void)pruneUsingTrajectoryGGList:(id)a3
{
  id v4 = a3;
  float32x2_t v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isReflectedLS", (void)v13) & 1) == 0)
        {
          [(VDGDetectionUtilsV2 *)self getTrajectoryMatchingCostGG:v11];
          if (v12 <= 0.3) {
            [v5 addObject:v11];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [v6 removeObjectsInArray:v5];
}

- (void)getHighRiskLS:(id)a3
{
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    float32x2_t v7 = (float32x2_t)vdup_n_s32(0x7F800000u);
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v9)
        {
          [*(id *)(*((void *)&v17 + 1) + 8 * i) descriptor];
          float32x2_t v10 = (float32x2_t)v30;
        }
        else
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          float32x2_t v10 = 0;
          long long v21 = 0u;
          long long v22 = 0u;
        }
        [v9 bbox];
        float32x4_t v16 = v11;
        [v9 bbox];
        float32x4_t v13 = vmulq_laneq_f32(v16, v12, 3);
        v13.i32[0] = v13.i32[2];
        BOOL v15 = 0;
        if (v13.f32[2] > 10000.0)
        {
          *(float32x2_t *)v13.f32 = vmul_f32(v10, v10);
          v13.f32[0] = sqrtf(vaddv_f32(*(float32x2_t *)v13.f32));
          if (v13.f32[0] <= 10.0
            || (uint32x2_t v14 = (uint32x2_t)vceq_f32(v10, v7), *(uint32x2_t *)v13.f32 = vpmin_u32(v14, v14), v13.i32[0] < 0))
          {
            BOOL v15 = 1;
          }
        }
        objc_msgSend(v9, "setLSIsHighRisk:", v15, *(double *)v13.i64);
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v31 count:16];
    }
    while (v5);
  }
}

- (void)setDefaultOpticalCenterForList:(id)a3 opticalCenter:
{
  double v4 = v3;
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setDefaultOpticalCenter:v4];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (double)getSearchLocation:(void *)a3
{
  id v3 = a3;
  [v3 bbox];
  float32x2_t v25 = v4;
  [v3 bbox];
  int8x16_t v24 = v5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [v3 matchedLS];
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v51 count:16];
  if (!v7)
  {

    double v22 = COERCE_DOUBLE(vdup_n_s32(0x7F800000u));
    goto LABEL_19;
  }
  id v8 = v7;
  int8x16_t v9 = vextq_s8(v24, v24, 8uLL);
  float32x2_t v10 = vadd_f32(v25, vmul_f32(*(float32x2_t *)v9.i8, (float32x2_t)0x3F0000003F000000));
  uint64_t v11 = *(void *)v28;
  v9.i64[0] = 0;
  int8x16_t v26 = v9;
  float32x2_t v12 = 0;
  float32x2_t v13 = (float32x2_t)vdup_n_s32(0x7F800000u);
  do
  {
    uint32x2_t v14 = 0;
    long long v15 = 0uLL;
    do
    {
      if (*(void *)v28 != v11)
      {
        objc_enumerationMutation(v6);
        long long v15 = 0uLL;
      }
      float32x4_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v14);
      if (!v16)
      {
        long long v49 = v15;
        long long v50 = v15;
        long long v47 = v15;
        long long v48 = v15;
        long long v45 = v15;
        long long v46 = v15;
        long long v43 = v15;
        long long v44 = v15;
        long long v41 = v15;
        long long v42 = v15;
        if ((vpmin_u32(*(uint32x2_t *)&v15, *(uint32x2_t *)&v15).u32[0] & 0x80000000) != 0) {
          goto LABEL_13;
        }
        long long v39 = v15;
        long long v40 = v15;
        long long v37 = v15;
        long long v38 = v15;
        long long v35 = v15;
        long long v36 = v15;
        long long v33 = v15;
        long long v34 = v15;
        float32x2_t v18 = 0;
        long long v31 = v15;
        long long v32 = v15;
        goto LABEL_11;
      }
      [*(id *)(*((void *)&v27 + 1) + 8 * (void)v14) descriptor];
      uint32x2_t v17 = (uint32x2_t)vceq_f32(*(float32x2_t *)((char *)&v50 + 8), v13);
      if ((vpmin_u32(v17, v17).u32[0] & 0x80000000) == 0)
      {
        [v16 descriptor];
        float32x2_t v18 = *(float32x2_t *)((char *)&v40 + 8);
        long long v15 = 0uLL;
LABEL_11:
        float32x2_t v12 = vadd_f32(v12, v18);
        int8x16_t v19 = v26;
        *(float *)v19.i32 = *(float *)v26.i32 + 1.0;
        int8x16_t v26 = v19;
        goto LABEL_13;
      }
      long long v15 = 0uLL;
LABEL_13:
      uint32x2_t v14 = (char *)v14 + 1;
    }
    while (v8 != v14);
    id v8 = [v6 countByEnumeratingWithState:&v27 objects:v51 count:16];
  }
  while (v8);

  double v20 = COERCE_DOUBLE(vdup_n_s32(0x7F800000u));
  double v21 = COERCE_DOUBLE(vadd_f32(v10, vdiv_f32(v12, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 0))));
  if (*(float *)v26.i32 > 0.0) {
    double v22 = v21;
  }
  else {
    double v22 = v20;
  }
LABEL_19:

  return v22;
}

- (BOOL)locIsInSearchRange:(float)a3 searchLocation:(float)a4 defaultSearchLocation:(BOOL)a5 searchRadius:defaultSearchRange:searchInGivenLocsOnly:
{
  float32x2_t v8 = vsub_f32(*(float32x2_t *)&a4, *(float32x2_t *)&a3);
  BOOL v9 = sqrtf(vaddv_f32(vmul_f32(v8, v8))) <= v6;
  float32x2_t v10 = vsub_f32(v5, *(float32x2_t *)&a3);
  BOOL v11 = !a5;
  if (sqrtf(vaddv_f32(vmul_f32(v10, v10))) > v7) {
    BOOL v11 = 0;
  }
  if (a4 == INFINITY) {
    return v11;
  }
  else {
    return v9;
  }
}

- (void)removeRedundantLS:(id)a3
{
  id v45 = a3;
  id v3 = +[NSMutableArray array];
  if ([v45 count])
  {
    unint64_t v4 = 0;
    uint64_t v5 = 1;
    while (1)
    {
      float v6 = [v45 objectAtIndexedSubscript:v4];
      [v6 bbox];
      float v43 = v7;
      [v6 bbox];
      float v42 = v8;
      [v6 bbox];
      float rect1_8 = v9;
      [v6 bbox];
      float32x4_t v40 = v10;
      if ((unint64_t)[v45 count] > ++v4) {
        break;
      }
LABEL_27:

      ++v5;
      if ((unint64_t)[v45 count] <= v4) {
        goto LABEL_28;
      }
    }
    double v34 = v43;
    double v35 = v42;
    float v33 = vmuls_lane_f32(rect1_8, v40, 3);
    uint64_t v11 = v5;
    while (1)
    {
      float32x2_t v12 = [v45 objectAtIndexedSubscript:v11];
      [v12 bbox];
      CGFloat v14 = v13;
      [v12 bbox];
      CGFloat v16 = v15;
      [v12 bbox];
      float v37 = v17;
      CGFloat v18 = v17;
      [v12 bbox];
      float v36 = v19;
      v51.size.double height = v19;
      v47.origin.CGFloat x = v34;
      v47.origin.CGFloat y = v35;
      v47.size.double width = rect1_8;
      v47.size.double height = v40.f32[3];
      CGFloat v44 = v14;
      v51.origin.CGFloat x = v14;
      CGFloat v41 = v16;
      v51.origin.CGFloat y = v16;
      *(CGFloat *)v40.i64 = v18;
      v51.size.double width = v18;
      double rect1 = v19;
      CGRect v48 = CGRectIntersection(v47, v51);
      CGFloat x = v48.origin.x;
      CGFloat y = v48.origin.y;
      double width = v48.size.width;
      double height = v48.size.height;
      v48.origin.CGFloat x = v34;
      v48.origin.CGFloat y = v35;
      v48.size.double width = rect1_8;
      v48.size.double height = v40.f32[3];
      v52.origin.CGFloat x = x;
      v52.origin.CGFloat y = y;
      v52.size.double width = width;
      v52.size.double height = height;
      BOOL v24 = CGRectEqualToRect(v48, v52);
      float32x2_t v25 = v6;
      if (!v24)
      {
        v49.origin.CGFloat x = v44;
        v49.origin.CGFloat y = v41;
        *(void *)&v49.size.double width = v40.i64[0];
        v49.size.double height = rect1;
        v53.origin.CGFloat x = x;
        v53.origin.CGFloat y = y;
        v53.size.double width = width;
        v53.size.double height = height;
        BOOL v26 = CGRectEqualToRect(v49, v53);
        float32x2_t v25 = v12;
        if (!v26)
        {
          v50.origin.CGFloat x = x;
          v50.origin.CGFloat y = y;
          v50.size.double width = width;
          v50.size.double height = height;
          if (CGRectIsNull(v50)) {
            goto LABEL_8;
          }
          float v27 = height * width;
          float v28 = v27 / v33;
          float v29 = v27 / (float)(v37 * v36);
          BOOL v30 = v28 >= 0.5 && v29 < 0.5;
          float32x2_t v25 = v6;
          if (!v30)
          {
            BOOL v31 = v28 >= 0.5 || v29 < 0.5;
            float32x2_t v25 = v12;
            if (v31)
            {
              if (v28 < 0.5 || v29 < 0.5) {
                goto LABEL_8;
              }
              if (v28 <= v29) {
                float32x2_t v25 = v12;
              }
              else {
                float32x2_t v25 = v6;
              }
            }
          }
        }
      }
      [v3 addObject:v25];
LABEL_8:

      if ((unint64_t)[v45 count] <= ++v11) {
        goto LABEL_27;
      }
    }
  }
LABEL_28:
  [v45 removeObjectsInArray:v3];
}

- (float32x2_t)predictPrevLSLocation:(int32x4_t)a3 usingPrevToCurrentHomography:(uint64_t)a4
{
  if (a6)
  {
    int32x4_t v12 = a2;
    int32x4_t v13 = a3;
    int32x4_t v11 = a1;
    id v6 = a6;
    [v6 descriptor];
    float v14 = v16;
    [v6 descriptor];

    a1 = v11;
    a2 = v12;
    a3 = v13;
    float32x2_t v7 = v15;
  }
  else
  {
    float32x2_t v7 = 0;
    float v14 = 0.0;
  }
  float32x4_t v8 = (float32x4_t)vtrn2q_s32(a1, a2);
  v8.i32[2] = a3.i32[1];
  int32x4_t v9 = (int32x4_t)vaddq_f32((float32x4_t)vzip1q_s32(vzip2q_s32(a1, a3), vdupq_laneq_s32(a2, 2)), vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(a1, a3), a2), v14), v8, v7, 1));
  return vdiv_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_laneq_s32(v9, 2));
}

- (void)pruneGGList:(id *)a3 LSBBoxList:(id *)a4 reflectedLSBBoxList:getMatchedLS:pruneLS:pruneGG:
{
  uint64_t v8 = v4;
  float32x4_t v10 = a3;
  if (v6)
  {
    float v43 = +[NSMutableArray array];
    if ([*a4 count])
    {
      uint64_t v11 = 0;
      id v12 = 0;
      unsigned int v13 = 0;
      do
      {
        int8x16_t v46 = *(int8x16_t *)(v8 + 16 * v11);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v14 = *v10;
        id v15 = [v14 countByEnumeratingWithState:&v47 objects:v71 count:16];
        if (v15)
        {
          id v16 = v15;
          int32x2_t v45 = (int32x2_t)vextq_s8(v46, v46, 8uLL).u64[0];
          uint64_t v17 = *(void *)v48;
          while (2)
          {
            CGFloat v18 = 0;
            float v19 = v12;
            do
            {
              if (*(void *)v48 != v17) {
                objc_enumerationMutation(v14);
              }
              id v12 = *(id *)(*((void *)&v47 + 1) + 8 * (void)v18);

              if (v12)
              {
                [v12 descriptor];
                float32x2_t v20 = (float32x2_t)v61;
              }
              else
              {
                long long v69 = 0u;
                long long v70 = 0u;
                long long v67 = 0u;
                long long v68 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                float32x2_t v20 = 0;
                long long v61 = 0u;
                long long v62 = 0u;
              }
              int32x2_t v21 = vcvt_s32_f32(v20);
              uint32x2_t v22 = (uint32x2_t)vcge_s32(v21, *(int32x2_t *)v46.i8);
              if ((vpmin_u32(v22, v22).u32[0] & 0x80000000) != 0)
              {
                uint32x2_t v23 = (uint32x2_t)vcge_s32(v45, v21);
                if ((vpmin_u32(v23, v23).u32[0] & 0x80000000) != 0)
                {

                  id v14 = [*a4 objectAtIndexedSubscript:v11];
                  [v43 addObject:v14];
                  goto LABEL_18;
                }
              }
              CGFloat v18 = (char *)v18 + 1;
              float v19 = v12;
            }
            while (v16 != v18);
            id v16 = [v14 countByEnumeratingWithState:&v47 objects:v71 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        id v12 = 0;
LABEL_18:

        uint64_t v11 = ++v13;
        float32x4_t v10 = a3;
      }
      while ((unint64_t)[*a4 count] > v13);
    }
    else
    {
      id v12 = 0;
    }
    id v42 = *a4;
    *a4 = v43;

LABEL_43:
    return;
  }
  if (v7)
  {
    int v24 = v5;
    if ([*a3 count])
    {
      uint64_t v25 = 0;
      id v12 = 0;
      unsigned int v26 = 0;
      do
      {
        float v27 = v12;
        id v12 = [*v10 objectAtIndexedSubscript:v25];

        if (v12)
        {
          [v12 descriptor];
          float32x2_t v28 = (float32x2_t)v51;
        }
        else
        {
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          float32x2_t v28 = 0;
          long long v51 = 0u;
          long long v52 = 0u;
        }
        if ([*a4 count])
        {
          uint64_t v29 = 0;
          char v30 = 0;
          int32x2_t v31 = vcvt_s32_f32(v28);
          unsigned int v32 = 1;
          do
          {
            int8x16_t v33 = *(int8x16_t *)(v8 + 16 * v29);
            uint32x2_t v34 = (uint32x2_t)vcge_s32(v31, *(int32x2_t *)v33.i8);
            if ((vpmin_u32(v34, v34).u32[0] & 0x80000000) != 0)
            {
              uint32x2_t v35 = (uint32x2_t)vcge_s32((int32x2_t)*(_OWORD *)&vextq_s8(v33, v33, 8uLL), v31);
              unsigned __int32 v36 = vpmin_u32(v35, v35).u32[0];
              if ((v36 & 0x80000000) != 0 && v24)
              {
                float v37 = [v12 matchedLS];

                if (!v37)
                {
                  long long v38 = +[NSMutableArray array];
                  [v12 setMatchedLS:v38];
                }
                long long v39 = [v12 matchedLS];
                float32x4_t v40 = [*a4 objectAtIndexedSubscript:v29];
                [v39 addObject:v40];

                char v30 = 1;
              }
              else if ((v36 & 0x80000000) != 0)
              {
                float32x4_t v10 = a3;
                goto LABEL_38;
              }
            }
            uint64_t v29 = v32;
          }
          while ((unint64_t)[*a4 count] > v32++);
          float32x4_t v10 = a3;
          if (v30) {
            goto LABEL_38;
          }
        }
        [*v10 removeObjectAtIndex:v25];
        --v26;
LABEL_38:
        uint64_t v25 = ++v26;
      }
      while ((unint64_t)[*v10 count] > v26);
      goto LABEL_43;
    }
  }
}

- (float)getTemporalDetectionSearchRadiusForReferenceFrameIndex:(float)a3 minSearchRadius:(float)a4 slope:(float)a5
{
  float result = a3 * a5;
  if (result <= a4) {
    return a4;
  }
  return result;
}

- (id)getBestROIInROIList:(id)a3 referenceROI:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    int32x4_t v9 = 0;
    unsigned int v10 = 1;
    float v11 = 0.0;
    float v12 = 0.0;
    float v13 = 0.0;
    while (1)
    {
      if (v10 == 1)
      {
        id v14 = [v5 objectAtIndexedSubscript:0];

        if (v14)
        {
          [v14 descriptor];
          float32x2_t v15 = *(float32x2_t *)((char *)&v40 + 8);
          if (v6) {
            goto LABEL_6;
          }
LABEL_11:
          float32x2_t v39 = 0;
          float32x2_t v16 = 0;
        }
        else
        {
          long long v40 = 0u;
          float32x2_t v15 = 0;
          if (!v6) {
            goto LABEL_11;
          }
LABEL_6:
          [v6 descriptor];
          float32x2_t v16 = v39;
        }
        float v20 = vaddv_f32(vabd_f32(v15, v16));
        if (v14)
        {
          [v14 descriptor];
          float v13 = *((float *)&v38 + 3);
          [v14 descriptor];
          float v12 = v37;
        }
        else
        {
          long long v38 = 0u;
          float v37 = 0.0;
          float v13 = 0.0;
          float v12 = 0.0;
        }
        goto LABEL_35;
      }
      uint64_t v17 = [v5 objectAtIndexedSubscript:v7];

      if (v17)
      {
        [v17 descriptor];
        float32x2_t v18 = *(float32x2_t *)((char *)&v36 + 8);
        if (v6) {
          goto LABEL_9;
        }
      }
      else
      {
        long long v36 = 0u;
        float32x2_t v18 = 0;
        if (v6)
        {
LABEL_9:
          [v6 descriptor];
          float32x2_t v19 = *(float32x2_t *)((char *)&v35 + 8);
          goto LABEL_16;
        }
      }
      long long v35 = 0u;
      float32x2_t v19 = 0;
LABEL_16:
      float v20 = vaddv_f32(vabd_f32(v18, v19));
      if (v20 > (float)(v11 + -1.0))
      {
        if (vabds_f32(v20, v11) > 1.0) {
          goto LABEL_18;
        }
        if (v17)
        {
          [v17 descriptor];
          LODWORD(v21) = HIDWORD(v32);
          if (*((float *)&v32 + 3) >= (float)(v13 + 0.03))
          {
            id v14 = v17;

            [v14 descriptor];
            float v13 = *((float *)&v31 + 3);
            [v14 descriptor];
            float v12 = v30;
            goto LABEL_34;
          }
          objc_msgSend(v17, "descriptor", v21);
          if (vabds_f32(v29, v13) <= 0.03)
          {
            [v17 descriptor];
            if (v28 >= v12)
            {
              id v14 = v17;

              [v14 descriptor];
              float v12 = v27;
              goto LABEL_34;
            }
          }
LABEL_18:
          id v14 = v9;
          uint64_t v8 = v17;
        }
        else
        {
          long long v32 = 0u;
          if ((float)(v13 + 0.03) <= 0.0)
          {

            id v14 = 0;
            uint64_t v8 = 0;
            long long v31 = 0u;
            float v30 = 0.0;
            float v13 = 0.0;
            float v12 = 0.0;
            goto LABEL_35;
          }
          float v29 = 0.0;
          if (vabds_f32(0.0, v13) <= 0.03)
          {
            float v28 = 0.0;
            if (v12 <= 0.0)
            {

              id v14 = 0;
              uint64_t v8 = 0;
              long long v26 = 0u;
              float v27 = 0.0;
              float v12 = 0.0;
              long long v24 = 0u;
              long long v25 = 0u;
              goto LABEL_35;
            }
          }
          uint64_t v8 = 0;
          id v14 = v9;
        }
        float v20 = v11;
        goto LABEL_35;
      }
      id v14 = v17;

      if (v17)
      {
        [v14 descriptor];
        float v13 = *((float *)&v34 + 3);
        [v14 descriptor];
        float v12 = v33;
LABEL_34:
        uint64_t v8 = v14;
        goto LABEL_35;
      }
      id v14 = 0;
      uint64_t v8 = 0;
      long long v34 = 0u;
      float v33 = 0.0;
      float v13 = 0.0;
      float v12 = 0.0;
LABEL_35:
      uint64_t v7 = v10;
      BOOL v22 = (unint64_t)objc_msgSend(v5, "count", v24, v25, v26) > v10++;
      float v11 = v20;
      int32x4_t v9 = v14;
      if (!v22) {
        goto LABEL_40;
      }
    }
  }
  id v14 = 0;
  uint64_t v8 = 0;
LABEL_40:

  return v14;
}

- (void)sortArray:(float *)a3 ofLength:(unsigned int)a4
{
}

- (void)setSimParams:(_simParamsStruct *)a3 withMetaData:(id)a4
{
  *(_OWORD *)a3->var1 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  *(_OWORD *)a3->var0 = 0u;
  a3->var2 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  memset(&v14[8], 0, 304);
  objc_msgSend(a4, "objectForKeyedSubscript:", @"IspScalerInfo", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  id v5 = 0);
  [v5 getBytes:v14 length:576];
  *(int32x2_t *)&a3->var3 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)((char *)&v14[8] + 8)));
  float v6 = v24;
  float v7 = v26;
  float v8 = v26 * v21;
  a3->var1[0] = v24 * *((float *)&v19 + 2);
  a3->var1[1] = v8;
  float v9 = v25;
  float v10 = v27;
  float v11 = (float)(v23 * v27) + (float)(v7 * v22);
  a3->var1[2] = (float)(v25 * v23) + (float)(v6 * v20);
  a3->var1[3] = v11;
  float v12 = v7 * *(float *)&v16;
  a3->var0[0] = v6 * *(float *)&v15;
  a3->var0[1] = v12;
  float v13 = (float)(v10 * *(float *)&v17) + (float)(v7 * *((float *)&v16 + 1));
  a3->var0[2] = (float)(v9 * *(float *)&v17) + (float)(v6 * *((float *)&v15 + 2));
  a3->var0[3] = v13;
}

- (CGPoint)calcOpticalCenterFromMetaData:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = [v3 objectForKeyedSubscript:@"OpticalCenter"];
  v16.double x = 0.0;
  v16.double y = 0.0;
  CGPointMakeWithDictionaryRepresentation(v4, &v16);
  double x = v16.x;
  double y = v16.y;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  memset(v17, 0, sizeof(v17));
  float v7 = [v3 objectForKeyedSubscript:@"IspScalerInfo"];

  [v7 getBytes:v17 length:576];
  float v8 = *(double *)&v18;
  float v9 = *((double *)&v18 + 1);
  float v10 = x - v8;
  float v11 = y - v9;
  double v12 = (float)(v28 + (float)(v10 * v27));
  double v13 = (float)(v30 + (float)(v11 * v29));

  double v14 = v12;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)pruneGGList:(id *)a3 LSList:(id *)a4 opticalCenter:(float)a5 costToKeepLS:(float)a6 costToKeepGG:
{
  float v7 = v6;
  double v9 = *(double *)&a5;
  float v11 = +[NSMutableArray array];
  +[NSMutableArray array];
  int32x2_t v45 = a4;
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = *a4;
  id v12 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0;
    uint64_t v48 = *(void *)v63;
    do
    {
      double v15 = 0;
      CGPoint v16 = v14;
      do
      {
        if (*(void *)v63 != v48) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v62 + 1) + 8 * (void)v15);

        [v14 reflectAroundCenter:v9];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v17 = *a3;
        id v18 = [v17 countByEnumeratingWithState:&v58 objects:v68 count:16];
        if (v18)
        {
          id v19 = v18;
          id v20 = 0;
          uint64_t v21 = *(void *)v59;
          float v22 = INFINITY;
          do
          {
            long long v23 = 0;
            long long v24 = v20;
            do
            {
              if (*(void *)v59 != v21) {
                objc_enumerationMutation(v17);
              }
              id v20 = *(id *)(*((void *)&v58 + 1) + 8 * (void)v23);

              [v14 getLocationMatchCostWith:v20];
              if (v25 < v22) {
                float v22 = v25;
              }
              long long v23 = (char *)v23 + 1;
              long long v24 = v20;
            }
            while (v19 != v23);
            id v19 = [v17 countByEnumeratingWithState:&v58 objects:v68 count:16];
          }
          while (v19);
        }
        else
        {
          float v22 = INFINITY;
        }

        if (v22 <= a6) {
          [v11 addObject:v14];
        }
        double v15 = (char *)v15 + 1;
        CGPoint v16 = v14;
      }
      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v13);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v26 = *a3;
  id v27 = [v26 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v27)
  {
    id v28 = v27;
    float v29 = 0;
    id v30 = 0;
    uint64_t v31 = *(void *)v55;
    do
    {
      long long v32 = 0;
      float v33 = v30;
      do
      {
        if (*(void *)v55 != v31) {
          objc_enumerationMutation(v26);
        }
        id v30 = *(id *)(*((void *)&v54 + 1) + 8 * (void)v32);

        if ([v11 count])
        {
          uint64_t v34 = 0;
          unsigned int v35 = 1;
          float v36 = INFINITY;
          float v37 = v29;
          do
          {
            float v29 = [v11 objectAtIndexedSubscript:v34];

            [v30 getLocationMatchCostWith:v29];
            if (v38 < v36) {
              float v36 = v38;
            }
            uint64_t v34 = v35;
            BOOL v39 = (unint64_t)[v11 count] > v35++;
            float v37 = v29;
          }
          while (v39);
        }
        else
        {
          float v36 = INFINITY;
        }
        if (v36 <= v7) {
          [v46 addObject:v30];
        }
        long long v32 = (char *)v32 + 1;
        float v33 = v30;
      }
      while (v32 != v28);
      id v28 = [v26 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v28);
  }
  else
  {
    float v29 = 0;
  }

  objc_storeStrong(a3, v46);
  objc_storeStrong(v45, v11);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v40 = *v45;
  id v41 = [v40 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v51;
    do
    {
      for (i = 0; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v51 != v43) {
          objc_enumerationMutation(v40);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * i) reflectAroundCenter:v9];
      }
      id v42 = [v40 countByEnumeratingWithState:&v50 objects:v66 count:16];
    }
    while (v42);
  }
}

- (void)sortKPs:(id)a3 opticalCenter:
{
  float32x2_t v5 = v4;
  id v7 = a3;
  id v8 = [v7 count];
  if ((uint64_t)v8 > self->_locationListLen
    || (id v9 = v8, (uint64_t)v8 > self->_dist2OpticalCenterListLen)
    || (uint64_t)v8 > self->_kpIsFromHWListLen)
  {
    fig_log_get_emitter();
    LODWORD(v31) = 0;
    FigDebugAssert3();
    objc_msgSend(v7, "removeAllObjects", v31, v3);
  }
  else if ((uint64_t)v8 >= 1)
  {
    unint64_t v10 = 0;
    do
    {
      float v11 = [v7 objectAtIndexedSubscript:v10];
      id v12 = v11;
      if (v11)
      {
        [v11 descriptor];
        uint64_t v13 = v32;
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v32 = 0;
      }
      *(void *)(*(void *)self->_locationList + 8 * v10) = v13;

      float32x2_t v14 = vsub_f32(v5, *(float32x2_t *)(*(void *)self->_locationList + 8 * v10));
      self->_dist2OpticalCenterList[v10] = sqrtf(vaddv_f32(vmul_f32(v14, v14)));
      double v15 = [v7 objectAtIndexedSubscript:v10];
      self->_kpIsFromHWList[v10] = [v15 kpIsFromHW];

      ++v10;
    }
    while (v9 != (id)v10);
    uint64_t v20 = 0;
    kpIsFromHWList = self->_kpIsFromHWList;
    dist2OpticalCenterList = self->_dist2OpticalCenterList;
    do
    {
      id v23 = (id)(v20 + 1);
      uint64_t v24 = v20;
      if (v20 + 1 < (uint64_t)v9)
      {
        uint64_t v25 = *(void *)self->_locationList;
        BOOL v26 = kpIsFromHWList[v20];
        *(float *)&double v17 = dist2OpticalCenterList[v20];
        double v16 = *(double *)(v25 + 8 * v20);
        uint64_t v24 = v20;
        uint64_t v27 = v20 + 1;
        do
        {
          double v18 = *(double *)(v25 + 8 * v27);
          *(float *)&double v19 = dist2OpticalCenterList[v27];
          if (!v26 && kpIsFromHWList[v27]
            || (kpIsFromHWList[v27] || !v26)
            && (*(float *)&v19 < *(float *)&v17
             || *(float *)&v19 <= *(float *)&v17
             && ((int32x2_t v28 = vcgt_f32(*(float32x2_t *)&v16, *(float32x2_t *)&v18), (v28.i8[0] & 1) != 0)
              || (vceq_f32(*(float32x2_t *)&v18, *(float32x2_t *)&v16).u32[0] & 1) != 0 && (v28.i8[4] & 1) != 0)))
          {
            double v16 = *(double *)(v25 + 8 * v27);
            BOOL v26 = kpIsFromHWList[v27];
            *(float *)&double v17 = dist2OpticalCenterList[v27];
            uint64_t v24 = v27;
          }
          ++v27;
        }
        while (v9 != (id)v27);
      }
      if (v20 != v24)
      {
        objc_msgSend(v7, "exchangeObjectAtIndex:withObjectAtIndex:", v20, v24, v16, v17, v18, v19);
        uint64_t v29 = *(void *)self->_locationList;
        double v16 = *(double *)(v29 + 8 * v20);
        double v17 = *(double *)(v29 + 8 * v24);
        *(double *)(v29 + 8 * v20) = v17;
        *(double *)(*(void *)self->_locationList + 8 * v24) = v16;
        kpIsFromHWList = self->_kpIsFromHWList;
        BOOL v30 = kpIsFromHWList[v20];
        kpIsFromHWList[v20] = kpIsFromHWList[v24];
        kpIsFromHWList[v24] = v30;
        dist2OpticalCenterList = self->_dist2OpticalCenterList;
        *(float *)&double v16 = dist2OpticalCenterList[v20];
        *(float *)&double v17 = dist2OpticalCenterList[v24];
        dist2OpticalCenterList[v20] = *(float *)&v17;
        dist2OpticalCenterList[v24] = *(float *)&v16;
      }
      ++v20;
    }
    while (v23 != v9);
  }
}

- (void)removeDuplicateRois:(id)a3
{
  id v51 = a3;
  id v5 = [v51 count];
  if ((uint64_t)v5 > self->_reflectedLSListLen || (uint64_t v6 = (uint64_t)v5, (uint64_t)v5 > self->_bboxListLen))
  {
    fig_log_get_emitter();
    LODWORD(v49) = 0;
    FigDebugAssert3();
    objc_msgSend(v51, "removeAllObjects", v49, v3);
  }
  else
  {
    long long v50 = +[NSMutableArray array];
    id v7 = v51;
    if (v6 >= 1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v9 = [v7 objectAtIndexedSubscript:i];
        [v9 bbox];
        *(_OWORD *)(*(void *)self->_bboxList + 16 * i) = v10;

        float v11 = [v51 objectAtIndexedSubscript:i];
        self->_reflectedLSList[i] = [v11 isReflectedLS];

        id v7 = v51;
      }
      uint64_t v12 = 0;
      unsigned int v13 = 0;
      int v14 = 2;
      while (1)
      {
        uint64_t v15 = v13 + 1;
        BOOL v16 = self->_reflectedLSList[v12] || v6 <= v15;
        if (!v16) {
          break;
        }
LABEL_57:
        ++v14;
        uint64_t v12 = ++v13;
        if (v6 <= v15) {
          goto LABEL_58;
        }
      }
      double v17 = (float *)(*(void *)self->_bboxList + 16 * v12);
      double v18 = v17[3];
      double v19 = v17[2];
      double v20 = v17[1];
      double v21 = *v17;
      unsigned int v22 = v14;
      uint64_t v23 = v13 + 1;
      while (1)
      {
        if (self->_reflectedLSList[v23]) {
          goto LABEL_55;
        }
        uint64_t v24 = (float *)(*(void *)self->_bboxList + 16 * v23);
        double v25 = *v24;
        double v26 = v24[1];
        double v27 = v24[2];
        double v28 = v24[3];
        v53.origin.double x = v21;
        v53.origin.double y = v20;
        v53.size.double width = v19;
        v53.size.double height = v18;
        v57.origin.double x = v25;
        v57.origin.double y = v26;
        v57.size.double width = v27;
        v57.size.double height = v28;
        BOOL v29 = CGRectIntersectsRect(v53, v57);
        id v7 = v51;
        if (!v29) {
          goto LABEL_55;
        }
        v54.origin.double x = v21;
        v54.origin.double y = v20;
        v54.size.double width = v19;
        v54.size.double height = v18;
        v58.origin.double x = v25;
        v58.origin.double y = v26;
        v58.size.double width = v27;
        v58.size.double height = v28;
        if (CGRectEqualToRect(v54, v58)) {
          break;
        }
        v55.origin.double x = v21;
        v55.origin.double y = v20;
        v55.size.double width = v19;
        v55.size.double height = v18;
        v59.origin.double x = v25;
        v59.origin.double y = v26;
        v59.size.double width = v27;
        v59.size.double height = v28;
        if (CGRectContainsRect(v55, v59))
        {
          BOOL v30 = [v51 objectAtIndexedSubscript:v12];
          float v33 = [v51 objectAtIndexedSubscript:v23];
          if (([v30 isTracked] & 1) != 0 || !objc_msgSend(v33, "isTracked"))
          {
            if ([v30 isTracked] && objc_msgSend(v33, "isTracked"))
            {
              unsigned int v37 = [v30 trackID];
              unsigned int v38 = [v33 trackID];
              if ((int)v37 >= (int)v38) {
                uint64_t v39 = v38;
              }
              else {
                uint64_t v39 = v37;
              }
              [v30 setTrackID:v39];
              unsigned int v40 = [v30 trackedCnt];
              unsigned int v41 = [v33 trackedCnt];
              if ((int)v40 <= (int)v41) {
                uint64_t v42 = v41;
              }
              else {
                uint64_t v42 = v40;
              }
              [v30 setTrackedCnt:v42];
            }
          }
          else
          {
            [v30 setIsTracked:1];
            objc_msgSend(v30, "setTrackedCnt:", objc_msgSend(v33, "trackedCnt"));
            objc_msgSend(v30, "setTrackID:", objc_msgSend(v33, "trackID"));
            uint64_t v34 = [v33 temporalDetectionMatched];
            [v30 setTemporalDetectionMatched:v34];

            objc_msgSend(v30, "setIsPredictedFromPast:", objc_msgSend(v33, "isPredictedFromPast"));
            objc_msgSend(v30, "setPredictedFromPastCnt:", objc_msgSend(v33, "predictedFromPastCnt"));
            objc_msgSend(v30, "setIsTrajectoryPruningPassed:", objc_msgSend(v33, "isTrajectoryPruningPassed"));
          }
          uint64_t v32 = v33;
          goto LABEL_53;
        }
        v56.origin.double x = v25;
        v56.origin.double y = v26;
        v56.size.double width = v27;
        v56.size.double height = v28;
        v60.origin.double x = v21;
        v60.origin.double y = v20;
        v60.size.double width = v19;
        v60.size.double height = v18;
        BOOL v35 = CGRectContainsRect(v56, v60);
        id v7 = v51;
        if (v35)
        {
          float v33 = [v51 objectAtIndexedSubscript:v12];
          uint64_t v32 = [v51 objectAtIndexedSubscript:v23];
          if (([v32 isTracked] & 1) != 0 || !objc_msgSend(v33, "isTracked"))
          {
            if ([v33 isTracked] && objc_msgSend(v32, "isTracked"))
            {
              unsigned int v43 = [v33 trackID];
              unsigned int v44 = [v32 trackID];
              if ((int)v43 >= (int)v44) {
                uint64_t v45 = v44;
              }
              else {
                uint64_t v45 = v43;
              }
              [v32 setTrackID:v45];
              unsigned int v46 = [v33 trackedCnt];
              unsigned int v47 = [v32 trackedCnt];
              if ((int)v46 <= (int)v47) {
                uint64_t v48 = v47;
              }
              else {
                uint64_t v48 = v46;
              }
              [v32 setTrackedCnt:v48];
            }
          }
          else
          {
            [v32 setIsTracked:1];
            objc_msgSend(v32, "setTrackedCnt:", objc_msgSend(v33, "trackedCnt"));
            objc_msgSend(v32, "setTrackID:", objc_msgSend(v33, "trackID"));
            float v36 = [v33 temporalDetectionMatched];
            [v32 setTemporalDetectionMatched:v36];

            objc_msgSend(v32, "setIsPredictedFromPast:", objc_msgSend(v33, "isPredictedFromPast"));
            objc_msgSend(v32, "setPredictedFromPastCnt:", objc_msgSend(v33, "predictedFromPastCnt"));
            objc_msgSend(v32, "setIsTrajectoryPruningPassed:", objc_msgSend(v33, "isTrajectoryPruningPassed"));
          }
          BOOL v30 = v33;
          goto LABEL_53;
        }
LABEL_55:
        uint64_t v23 = v22;
        BOOL v16 = v6 <= v22++;
        if (v16) {
          goto LABEL_57;
        }
      }
      BOOL v30 = [v51 objectAtIndexedSubscript:v12];
      uint64_t v31 = [v51 objectAtIndexedSubscript:v23];
      if (v30 == (void *)v31)
      {
        uint64_t v32 = v30;
      }
      else
      {
        uint64_t v32 = (void *)v31;
        if ([v30 isTracked] && !objc_msgSend(v32, "isTracked"))
        {
          float v33 = v32;
          goto LABEL_53;
        }
        if (([v30 isTracked] & 1) == 0
          && ([v32 isTracked] & 1) != 0)
        {
          float v33 = v30;
          goto LABEL_53;
        }
        float v33 = v32;
        if (v22 - 1 > v13) {
LABEL_53:
        }
          [v50 addObject:v33];
      }

      id v7 = v51;
      goto LABEL_55;
    }
LABEL_58:
    [v7 removeObjectsInArray:v50];
  }
}

- (void)updateNewRoiPixFea:(VDGDetectionUtilsV2 *)self withRefPixFea:(SEL)a2
{
  int v4 = 0;
  long long v6 = v2[2];
  long long v5 = v2[3];
  long long v8 = *v2;
  long long v7 = v2[1];
  do
  {
    v19[0] = v8;
    v19[1] = v7;
    v19[2] = v6;
    v19[3] = v5;
    float v9 = (float)*((__int16 *)v19 + (v4 & 0x1F));
    long long v10 = *v3;
    long long v11 = v3[1];
    long long v12 = v3[3];
    v18[2] = v3[2];
    v18[3] = v12;
    v18[0] = v10;
    v18[1] = v11;
    int v13 = (int)(float)((float)((float)*((__int16 *)v18 + (v4 & 0x1F)) * 0.9) + (float)(v9 * 0.1));
    long long v14 = v8;
    long long v15 = v7;
    long long v16 = v6;
    long long v17 = v5;
    *((_WORD *)&v14 + (v4 & 0x1F)) = v13;
    long long v6 = v16;
    long long v5 = v17;
    long long v8 = v14;
    long long v7 = v15;
    v2[2] = v16;
    v2[3] = v5;
    long long *v2 = v8;
    v2[1] = v7;
    ++v4;
  }
  while (v4 != 32);
}

- (id)generateDetectionRoiList:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
    do
    {
      float v9 = [v3 objectAtIndexedSubscript:v5];
      [v9 bbox];
      float v23 = v10;
      [v9 bbox];
      float v22 = v11;
      [v9 bbox];
      float v21 = v12;
      [v9 bbox];
      float v20 = v13;
      uint64_t v26 = 0;
      long long v24 = 0u;
      long long v25 = 0u;
      LODWORD(v24) = objc_msgSend(v9, "trackID", v14);
      BYTE4(v24) = [v9 isTracked];
      BYTE5(v24) = [v9 isPredictedFromPast];
      HIDWORD(v24) = [v9 predictedFromPastCnt];
      if (v9)
      {
        [v9 descriptor];
        uint64_t v15 = v28;
      }
      else
      {
        long long v28 = 0u;
        uint64_t v15 = 0;
        memset(&v27[10], 0, 144);
      }
      *((void *)&v25 + 1) = v15;
      LODWORD(v25) = [v9 lowSaliencyCnt];
      LOBYTE(v26) = [v9 isTrajectoryPruningPassed];
      DWORD2(v24) = [v9 trackedCnt];
      BYTE1(v26) = [v9 isReflectedLS];
      long long v16 = [DetectedROI alloc];
      if (v9) {
        [v9 descriptor];
      }
      else {
        memset(v27, 0, 160);
      }
      long long v17 = -[DetectedROI initWithTrackingSessionId:roiId:roi:LSRoi:descriptor:propertiesForPostProcPipeVisualization:](v16, "initWithTrackingSessionId:roiId:roi:LSRoi:descriptor:propertiesForPostProcPipeVisualization:", 0, v5, v27, &v24, v23, v22, v21, v20, CGRectNull.origin.x, y, width, height);
      *(float *)&double v18 = sub_17710();
      [(DetectedROI *)v17 setConfidence:v18];
      [v4 addObject:v17];

      ++v5;
    }
    while ((unint64_t)[v3 count] > v5);
  }

  return v4;
}

- (void)findTinyKeypointLocationsFromLS:(id)a3 inputTexture:(id)a4 dilation:(float)a5 estimatedOpticalCenter:(id *)a6 metalBuffers:(int)a7 maxBufferLength:(float)a8 keypointSampleStepCount:
{
  int32x2_t v42 = v8;
  double v11 = *(double *)&a8;
  int32x2_t v40 = *(int32x2_t *)&a5;
  id v44 = a3;
  id v13 = a4;
  uint64_t v14 = (float32x2_t *)[a6->var5 contents];
  unsigned int v15 = [v13 width];
  unsigned int v16 = [v13 height];
  if ([v44 count])
  {
    unint64_t v18 = 0;
    int v19 = 0;
    int32x2_t v20 = vadd_s32((int32x2_t)__PAIR64__(v16, v15), (int32x2_t)0x200000002);
    *(float *)v17.i32 = *(float *)v40.i32 + *(float *)v40.i32;
    float32x2_t v21 = (float32x2_t)vdup_lane_s32(v40, 0);
    float32x2_t v22 = (float32x2_t)vdup_lane_s32(v17, 0);
    int32x2_t v23 = vadd_s32((int32x2_t)__PAIR64__(v16, v15), (int32x2_t)-1);
    float32x2_t v24 = (float32x2_t)vdup_lane_s32(v42, 0);
    long long v43 = 0u;
    do
    {
      long long v25 = [v44 objectAtIndexedSubscript:v18];
      [v25 reflectAroundCenter:v11];
      [v25 bbox];
      int32x2_t v41 = vmax_s32(vcvt_s32_f32(vsub_f32(v26, v21)), 0);
      [v25 bbox];
      float32x2_t v38 = v27;
      [v25 bbox];
      int32x2_t v39 = vmin_s32(v23, vcvt_s32_f32(vadd_f32(v21, vadd_f32(v38, (float32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL)))));
      [v25 bbox];
      int32x2_t v30 = (int32x2_t)__PAIR64__(DWORD1(v43), v41.u32[0]);
      *((void *)&v31 + 1) = *((void *)&v43 + 1);
      if (vcgt_s32(v41, v39).u8[0])
      {
        *(void *)&long long v31 = __PAIR64__(DWORD1(v43), v41.u32[0]);
      }
      else
      {
        int32x2_t v32 = vcvt_s32_f32(vdiv_f32(vadd_f32(v22, (float32x2_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL)), v24));
        int32x2_t v33 = vcgt_s32((int32x2_t)0x100000001, v32);
        int32x2_t v34 = vsub_s32((int32x2_t)vbic_s8((int8x8_t)v32, (int8x8_t)v33), v33);
        do
        {
          v30.i32[1] = v41.i32[1];
          if (v41.i32[1] <= v39.i32[1])
          {
            int v35 = v41.i32[1];
            do
            {
              uint32x2_t v36 = (uint32x2_t)vcgt_s32(v30, (int32x2_t)0x100000001);
              if ((vpmin_u32(v36, v36).u32[0] & 0x80000000) != 0)
              {
                uint32x2_t v37 = (uint32x2_t)vcge_s32(v20, v30);
                if ((vpmin_u32(v37, v37).u32[0] & 0x80000000) != 0 && v19 < a7) {
                  v14[v19++] = vcvt_f32_s32(v30);
                }
              }
              v35 += v34.i32[1];
              v30.i32[1] = v35;
            }
            while (v35 <= v39.i32[1]);
          }
          LODWORD(v31) = vadd_s32(v30, v34).u32[0];
          DWORD1(v31) = v30.i32[1];
          v30.i32[0] = v31;
        }
        while ((int)v31 <= v39.i32[0]);
      }
      long long v43 = v31;
      [v25 reflectAroundCenter:v11];

      ++v18;
    }
    while ((unint64_t)[v44 count] > v18);
  }
  else
  {
    int v19 = 0;
  }
  *(_DWORD *)[a6->var7 contents] = v19;
}

- (void)getGGCandidatesFromROIList:(id)a3 GGList:(id *)a4
{
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        double v11 = v8;
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(id *)(*((void *)&v13 + 1) + 8 * i);

        if (v8)
        {
          [v8 descriptor];
          LODWORD(v12) = DWORD1(v20);
          if (*((float *)&v20 + 1) > 0.99) {
            objc_msgSend(*a4, "addObject:", v8, v12);
          }
        }
        else
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v27 count:16];
    }
    while (v7);
  }
}

- (BOOL)isBoxSizeValidForProcessing:(float)a3 AndErodeBy:
{
  float v5 = v3;
  if (v3 >= v6) {
    float v5 = v6;
  }
  *(float *)v4.i32 = *(float *)v4.i32 + *(float *)v4.i32;
  if (v5 <= *(float *)v4.i32) {
    return 0;
  }
  float32x2_t v7 = vsub_f32((float32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)&a3, *(int8x16_t *)&a3, 8uLL), (float32x2_t)vdup_lane_s32(v4, 0));
  return sqrtf(0.03125 * vmul_lane_f32(v7, v7, 1).f32[0]) > 0.0;
}

- (void)generateBoxesForDoGAndLumaAndForPrevLSROIs:(double)a3 homography:(double)a4 metalBuffers:(uint64_t)a5 maxBufferLength:(void *)a6
{
  id v11 = a6;
  double v12 = v11;
  if (v11)
  {
    id v13 = [v11 count];
    if (a7)
    {
      if (v13)
      {
        uint64_t v14 = +[NSMutableArray array];
        id v15 = a1[4];
        a1[4] = (id)v14;

        uint64_t v16 = +[NSMutableArray array];
        id v17 = a1[5];
        a1[5] = (id)v16;

        uint64_t v40 = a7;
        long long v18 = [*(id *)(a7 + 72) contents];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        int32x2_t v39 = v12;
        id v19 = v12;
        id v20 = [v19 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v20)
        {
          id v21 = v20;
          int v22 = 0;
          uint64_t v23 = *(void *)v47;
          __asm
          {
            FMOV            V10.2S, #5.0
            FMOV            V11.2S, #-10.0
          }
          do
          {
            for (uint64_t i = 0; i != v21; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v47 != v23) {
                objc_enumerationMutation(v19);
              }
              long long v31 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              objc_msgSend(a1, "predictPrevLSLocation:usingPrevToCurrentHomography:", v31, a2, a3, a4, v39);
              float32x2_t v33 = v32;
              [v31 bbox];
              float32x2_t v45 = vadd_f32(v33, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL), (float32x2_t)0xBF000000BF000000));
              [v31 bbox];
              *(void *)&double v36 = vextq_s8(v35, v35, 8uLL).u64[0];
              float32x2_t v44 = *(float32x2_t *)&v36;
              LODWORD(v36) = 5.0;
              if ([a1 isBoxSizeValidForProcessing:*(double *)&v45 AndErodeBy:v36]) {
                BOOL v37 = v22 < a8;
              }
              else {
                BOOL v37 = 0;
              }
              if (v37)
              {
                [a1[4] addObject:v31];
                [a1[5] addObject:&off_3D310];
                *(float32x2_t *)&long long v38 = vadd_f32(v45, _D10);
                *((float32x2_t *)&v38 + 1) = vadd_f32(v44, _D11);
                v18[v22++] = v38;
              }
            }
            id v21 = [v19 countByEnumeratingWithState:&v46 objects:v50 count:16];
          }
          while (v21);
        }
        else
        {
          int v22 = 0;
        }

        *(_DWORD *)[*(id *)(v40 + 104) contents] = v22;
        double v12 = v39;
      }
    }
  }
}

- (void)generateBoxesForDoGAndLumaAndForLSROIs:(id)a3 prevGGROIs:(id)a4 inputTexture:(id)a5 opticalCenter:(id *)a6 metalBuffers:(int)a7 maxBufferLength:
{
  double v10 = v7;
  id v13 = a3;
  id v14 = a4;
  id v15 = +[NSMutableArray array];
  processedROIs = self->_processedROIs;
  self->_processedROIs = v15;

  id v17 = +[NSMutableArray array];
  processedType = self->_processedType;
  self->_processedType = v17;

  LODWORD(a4) = [v13 count];
  if ([v14 count] + 2 * a4)
  {
    long long v52 = a6;
    id v19 = [a6->var8 contents];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v53 = v13;
    id v20 = v13;
    id v21 = [v20 countByEnumeratingWithState:&v64 objects:v69 count:16];
    __asm
    {
      FMOV            V9.2S, #5.0
      FMOV            V10.2S, #-10.0
    }
    id v54 = v14;
    if (v21)
    {
      id v28 = v21;
      int v29 = 0;
      id v30 = 0;
      uint64_t v31 = *(void *)v65;
      do
      {
        float32x2_t v32 = 0;
        float32x2_t v33 = v30;
        do
        {
          if (*(void *)v65 != v31) {
            objc_enumerationMutation(v20);
          }
          id v30 = *(id *)(*((void *)&v64 + 1) + 8 * (void)v32);

          [v30 bbox];
          if (-[VDGDetectionUtilsV2 isBoxSizeValidForProcessing:AndErodeBy:](self, "isBoxSizeValidForProcessing:AndErodeBy:"))
          {
            BOOL v34 = v29 < a7;
          }
          else
          {
            BOOL v34 = 0;
          }
          if (v34)
          {
            [(NSMutableArray *)self->_processedROIs addObject:v30];
            [(NSMutableArray *)self->_processedType addObject:&off_3D328];
            [v30 bbox];
            float32x2_t v57 = vadd_f32(v35, _D9);
            [v30 bbox];
            *(float32x2_t *)&long long v37 = v57;
            *((float32x2_t *)&v37 + 1) = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL), _D10);
            v19[v29++] = v37;
          }
          [v30 getReflectedBboxAroundCenter:v10];
          if (-[VDGDetectionUtilsV2 isBoxSizeValidForProcessing:AndErodeBy:](self, "isBoxSizeValidForProcessing:AndErodeBy:"))
          {
            BOOL v38 = v29 < a7;
          }
          else
          {
            BOOL v38 = 0;
          }
          if (v38)
          {
            [(NSMutableArray *)self->_processedROIs addObject:v30];
            [(NSMutableArray *)self->_processedType addObject:&off_3D340];
            [v30 getReflectedBboxAroundCenter:v10];
            v19[v29++] = v39;
          }
          float32x2_t v32 = (char *)v32 + 1;
          float32x2_t v33 = v30;
        }
        while (v28 != v32);
        id v28 = [v20 countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v28);

      id v14 = v54;
    }
    else
    {
      int v29 = 0;
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v14;
    id v40 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v40)
    {
      id v41 = v40;
      id v42 = 0;
      uint64_t v43 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v41; uint64_t i = (char *)i + 1)
        {
          float32x2_t v45 = v42;
          if (*(void *)v61 != v43) {
            objc_enumerationMutation(obj);
          }
          id v42 = *(id *)(*((void *)&v60 + 1) + 8 * i);

          [(VDGDetectionUtilsV2 *)self getSearchLocation:v42];
          if (v46.f32[0] != INFINITY)
          {
            float32x2_t v58 = v46;
            [v42 bbox];
            float32x2_t v59 = vadd_f32(v58, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL), (float32x2_t)0xBF000000BF000000));
            [v42 bbox];
            *(void *)&double v49 = vextq_s8(v48, v48, 8uLL).u64[0];
            float32x2_t v56 = *(float32x2_t *)&v49;
            LODWORD(v49) = 5.0;
            if ([(VDGDetectionUtilsV2 *)self isBoxSizeValidForProcessing:*(double *)&v59 AndErodeBy:v49])
            {
              BOOL v50 = v29 < a7;
            }
            else
            {
              BOOL v50 = 0;
            }
            if (v50)
            {
              [(NSMutableArray *)self->_processedROIs addObject:v42];
              [(NSMutableArray *)self->_processedType addObject:&off_3D310];
              *(float32x2_t *)&long long v51 = vadd_f32(v59, _D9);
              *((float32x2_t *)&v51 + 1) = vadd_f32(v56, _D10);
              v19[v29++] = v51;
            }
          }
        }
        id v41 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v41);

      id v14 = v54;
    }

    *(_DWORD *)[v52->var12 contents] = v29;
    id v13 = v53;
  }
}

- (void)updateDoGAndLumaFeaturesWithMetalBuffers:(id *)a3
{
  if (*(int *)[a3->var12 contents] >= 1)
  {
    float v5 = (double *)[a3->var10 contents];
    signed int v6 = [(NSMutableArray *)self->_processedROIs count];
    int var20 = a3->var20;
    uint64_t v8 = var20 >= v6 ? v6 : var20;
    if ((int)v8 >= 1)
    {
      uint64_t v9 = 0;
      double v10 = 0;
      long long v28 = 0u;
      long long v30 = 0u;
      long long v32 = 0u;
      long long v34 = 0u;
      do
      {
        id v11 = v10;
        double v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_processedROIs, "objectAtIndexedSubscript:", v9, v28, v30, v32, v34);

        uint64_t v12 = 0;
        id v13 = &v5[17 * v9];
        uint64_t v44 = *((void *)v13 + 16);
        long long v14 = *((_OWORD *)v13 + 7);
        v43[6] = *((_OWORD *)v13 + 6);
        v43[7] = v14;
        long long v15 = *((_OWORD *)v13 + 3);
        v43[2] = *((_OWORD *)v13 + 2);
        v43[3] = v15;
        long long v16 = *((_OWORD *)v13 + 5);
        v43[4] = *((_OWORD *)v13 + 4);
        v43[5] = v16;
        long long v17 = *((_OWORD *)v13 + 1);
        v43[0] = *(_OWORD *)v13;
        v43[1] = v17;
        long long v19 = v33;
        long long v18 = v35;
        long long v21 = v29;
        long long v20 = v31;
        do
        {
          float v22 = *((float *)v43 + v12);
          long long v36 = v21;
          long long v37 = v20;
          long long v38 = v19;
          long long v39 = v18;
          *((_WORD *)&v36 + (v12 & 0x1F)) = (int)v22;
          long long v19 = v38;
          long long v18 = v39;
          long long v21 = v36;
          long long v20 = v37;
          ++v12;
        }
        while (v12 != 32);
        long long v28 = v36;
        long long v30 = v37;
        long long v32 = v38;
        long long v34 = v39;
        double v23 = v5[17 * v9 + 16];
        long long v24 = [(NSMutableArray *)self->_processedType objectAtIndexedSubscript:v9];
        unsigned int v25 = [v24 intValue];

        if (v25)
        {
          long long v26 = [(NSMutableArray *)self->_processedType objectAtIndexedSubscript:v9];
          unsigned int v27 = [v26 intValue];

          if (v27 == 1)
          {
            v41[0] = v28;
            v41[1] = v30;
            v41[2] = v32;
            v41[3] = v34;
            [v10 setLumaFeatureVectorReflection:v41];
            [v10 setDifferenceOfGaussianAndLumaFeatureReflection:v23];
          }
          else
          {
            v40[0] = v28;
            v40[1] = v30;
            v40[2] = v32;
            v40[3] = v34;
            [v10 setLumaFeatureVectorPredictedLocation:v40];
            [v10 setDifferenceOfGaussianAndLumaFeaturePredictedLocation:v23];
          }
        }
        else
        {
          v42[0] = v28;
          v42[1] = v30;
          v42[2] = v32;
          v42[3] = v34;
          [v10 setLumaFeatureVector:v42];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          if (v10) {
            [v10 descriptor];
          }
          long long v50 = v28;
          long long v51 = v30;
          long long v52 = v32;
          long long v53 = v34;
          LODWORD(v54) = 32;
          [v10 setDifferenceOfGaussianAndLumaFeature:v23];
          v45[6] = v52;
          v45[7] = v53;
          v45[8] = v54;
          v45[9] = v55;
          v45[2] = v48;
          v45[3] = v49;
          v45[4] = v50;
          v45[5] = v51;
          v45[0] = v46;
          v45[1] = v47;
          [v10 setDescriptor:v45];
        }
        ++v9;
      }
      while (v9 != v8);
    }
  }
}

- (BOOL)updatePrevLSDoGAndLumaFeaturesWithMetalBuffers:(id *)a3
{
  if (!a3 || *(int *)[a3->var13 contents] < 1) {
    return 0;
  }
  float v5 = (double *)[a3->var11 contents];
  int var21 = [(NSMutableArray *)self->_processedPrevLSROIs count];
  if (a3->var20 < var21) {
    int var21 = a3->var21;
  }
  if (var21 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    long long v28 = 0u;
    long long v30 = 0u;
    long long v32 = 0u;
    long long v34 = 0u;
    uint64_t v9 = var21;
    do
    {
      double v10 = v8;
      uint64_t v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_processedPrevLSROIs, "objectAtIndexedSubscript:", v7, v28, v30, v32, v34);

      uint64_t v11 = 0;
      uint64_t v12 = &v5[17 * v7];
      uint64_t v44 = *((void *)v12 + 16);
      long long v13 = *((_OWORD *)v12 + 7);
      v43[6] = *((_OWORD *)v12 + 6);
      v43[7] = v13;
      long long v14 = *((_OWORD *)v12 + 3);
      v43[2] = *((_OWORD *)v12 + 2);
      v43[3] = v14;
      long long v15 = *((_OWORD *)v12 + 5);
      v43[4] = *((_OWORD *)v12 + 4);
      v43[5] = v15;
      long long v16 = *((_OWORD *)v12 + 1);
      v43[0] = *(_OWORD *)v12;
      v43[1] = v16;
      long long v18 = v33;
      long long v17 = v35;
      long long v20 = v29;
      long long v19 = v31;
      do
      {
        float v21 = *((float *)v43 + v11);
        long long v36 = v20;
        long long v37 = v19;
        long long v38 = v18;
        long long v39 = v17;
        *((_WORD *)&v36 + (v11 & 0x1F)) = (int)v21;
        long long v18 = v38;
        long long v17 = v39;
        long long v20 = v36;
        long long v19 = v37;
        ++v11;
      }
      while (v11 != 32);
      long long v28 = v36;
      long long v30 = v37;
      long long v32 = v38;
      long long v34 = v39;
      double v22 = v5[17 * v7 + 16];
      double v23 = [(NSMutableArray *)self->_processedPrevLSType objectAtIndexedSubscript:v7];
      unsigned int v24 = [v23 intValue];

      if (v24)
      {
        unsigned int v25 = [(NSMutableArray *)self->_processedPrevLSType objectAtIndexedSubscript:v7];
        unsigned int v26 = [v25 intValue];

        if (v26 == 1)
        {
          v41[0] = v28;
          v41[1] = v30;
          v41[2] = v32;
          v41[3] = v34;
          [v8 setLumaFeatureVectorReflection:v41];
          [v8 setDifferenceOfGaussianAndLumaFeatureReflection:v22];
        }
        else
        {
          v40[0] = v28;
          v40[1] = v30;
          v40[2] = v32;
          v40[3] = v34;
          [v8 setLumaFeatureVectorPredictedLocation:v40];
          [v8 setDifferenceOfGaussianAndLumaFeaturePredictedLocation:v22];
        }
      }
      else
      {
        v42[0] = v28;
        v42[1] = v30;
        v42[2] = v32;
        v42[3] = v34;
        [v8 setLumaFeatureVector:v42];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        if (v8) {
          [v8 descriptor];
        }
        long long v50 = v28;
        long long v51 = v30;
        long long v52 = v32;
        long long v53 = v34;
        LODWORD(v54) = 32;
        [v8 setDifferenceOfGaussianAndLumaFeature:v22];
        v45[6] = v52;
        v45[7] = v53;
        v45[8] = v54;
        v45[9] = v55;
        v45[2] = v48;
        v45[3] = v49;
        v45[4] = v50;
        v45[5] = v51;
        v45[0] = v46;
        v45[1] = v47;
        [v8 setDescriptor:v45];
      }
      ++v7;
    }
    while (v7 != v9);
  }
  return 1;
}

- (void)clearReferencedROIsForROIList:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setTemporalDetectionMatched:0];
        [v8 setLSTrackingMatched:0];
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)getTopLSInListByDroppingBottoms:(id)a3 k:(signed __int16)a4 dist2ghostTol:(float)a5
{
  int v6 = a4;
  id v15 = a3;
  if ((unint64_t)[v15 count] > v6)
  {
    unint64_t v7 = v6;
    do
    {
      uint64_t v8 = [v15 objectAtIndexedSubscript:0];
      if ((unint64_t)[v15 count] < 2)
      {
        long long v11 = v15;
      }
      else
      {
        uint64_t v9 = 1;
        int v10 = 1;
        long long v11 = v15;
        do
        {
          long long v12 = [v11 objectAtIndexedSubscript:v9];
          if (sub_5EF4(v8, v12, a5))
          {
            id v13 = v12;

            uint64_t v8 = v13;
          }

          uint64_t v9 = (__int16)++v10;
          BOOL v14 = (unint64_t)[v15 count] > (__int16)v10;
          long long v11 = v15;
        }
        while (v14);
      }
      [v11 removeObject:v8];
    }
    while ((unint64_t)[v15 count] > v7);
  }
}

- (void)getTopLSInListByKeepingTops:(id)a3 k:(signed __int16)a4 dist2ghostTol:(float)a5
{
  int v6 = a4;
  id v17 = a3;
  if ((unint64_t)[v17 count] > v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = +[NSMutableArray array];
    uint64_t v9 = v8;
    while ((unint64_t)[v8 count] < v7)
    {
      int v10 = [v17 objectAtIndexedSubscript:0];
      if ((unint64_t)[v17 count] < 2)
      {
        id v13 = v17;
      }
      else
      {
        uint64_t v11 = 1;
        int v12 = 1;
        id v13 = v17;
        do
        {
          BOOL v14 = [v13 objectAtIndexedSubscript:v11];
          if ((sub_5EF4(v10, v14, a5) & 1) == 0)
          {
            id v15 = v14;

            int v10 = v15;
          }

          uint64_t v11 = (__int16)++v12;
          BOOL v16 = (unint64_t)[v17 count] > (__int16)v12;
          id v13 = v17;
        }
        while (v16);
      }
      [v13 removeObject:v10];
      [v9 addObject:v10];

      uint64_t v8 = v9;
    }
    [v17 removeAllObjects];
    [v17 addObjectsFromArray:v9];
  }
}

- (void)getTopLSInList:(id)a3 k:(signed __int16)a4 dist2ghostTol:(float)a5
{
}

- (void)pruneLSBasedOnDist2Ghost:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "dist2ghost", (void)v12);
        if (v11 > 128.0) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v5 removeObjectsInArray:v4];
}

- (void)getTopGhostsInList:(id)a3 k:(signed __int16)a4 opticalCenter:(int)a5 ghostCntGatingTh:
{
  float32x2_t v7 = v5;
  int v8 = a4;
  id v9 = a3;
  if ((unint64_t)[v9 count] > v8)
  {
    if ((unint64_t)[v9 count] > a5) {
      [v9 removeAllObjects];
    }
    unint64_t v10 = v8;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          BOOL v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v16 bbox];
          float32x2_t v29 = v17;
          [v16 bbox];
          *(float32x2_t *)v18.i8 = vsub_f32(vmla_f32(v29, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)), v7);
          *(float32x2_t *)v18.i8 = vmul_f32(*(float32x2_t *)v18.i8, *(float32x2_t *)v18.i8);
          *(float *)v18.i32 = sqrtf(vaddv_f32(*(float32x2_t *)v18.i8));
          [v16 setDist2opticalCenter:*(double *)v18.i64];
        }
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }

    while (1)
    {
      if ((unint64_t)[v11 count] <= v10) {
        goto LABEL_26;
      }
      id v19 = [v11 objectAtIndexedSubscript:0];
      if ((unint64_t)[v11 count] >= 2) {
        break;
      }
LABEL_25:
      [v11 removeObject:v19];
    }
    uint64_t v20 = 1;
    int v21 = 1;
    while (1)
    {
      double v22 = [v11 objectAtIndexedSubscript:v20];
      id v19 = v19;
      id v23 = v22;
      if (([v23 isTracked] & 1) == 0)
      {
        if ([v19 isTracked]) {
          break;
        }
      }
      if ([v23 isTracked] && (objc_msgSend(v19, "isTracked") & 1) == 0)
      {

        id v28 = v19;
        goto LABEL_23;
      }
      [v23 dist2opticalCenter];
      float v25 = v24;
      [v19 dist2opticalCenter];
      float v27 = v26;

      if (v25 > v27) {
        goto LABEL_21;
      }
LABEL_24:

      uint64_t v20 = (__int16)++v21;
      if ((unint64_t)[v11 count] <= (__int16)v21) {
        goto LABEL_25;
      }
    }

LABEL_21:
    id v28 = v23;
LABEL_23:

    id v19 = v28;
    goto LABEL_24;
  }
LABEL_26:
}

- ($E04785D6C22F149E9B1B648872290F90)configuration
{
  long long v3 = *(_OWORD *)&self[2].var0.var7;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var0;
  *(_OWORD *)&retstr->var0.var7 = v3;
  long long v4 = *(_OWORD *)&self[2].var1.var4;
  *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var1.var4 = v4;
  return self;
}

- (void)setConfiguration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var7;
  long long v5 = *(_OWORD *)&a3->var1.var4;
  *(_OWORD *)&self->_configuration.externalCfg.lightMode = *(_OWORD *)&a3->var1.var0;
  *(_OWORD *)&self->_configuration.externalCfg.frameDeladouble y = v5;
  *(_OWORD *)&self->_configuration.internalCfg.clipThreshold = v3;
  *(_OWORD *)&self->_configuration.internalCfg.enableColorMask = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedPrevLSType, 0);
  objc_storeStrong((id *)&self->_processedPrevLSROIs, 0);
  objc_storeStrong((id *)&self->_processedType, 0);
  objc_storeStrong((id *)&self->_processedROIs, 0);

  objc_storeStrong((id *)&self->_metalToolBox, 0);
}

@end