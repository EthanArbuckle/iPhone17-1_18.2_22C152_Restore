@interface CRImageReaderTrackingSession
- (BOOL)didDispatchOCROnFrame;
- (BOOL)didRunAssociationOnFrame;
- (BOOL)shouldIncludeLinesInTrackingResult;
- (BOOL)usesGroupedRegions;
- (BOOL)wasLatestFrameUnstableForFirstAcquisition;
- (CRImageReaderTrackingResult)latestResult;
- (CRImageReaderTrackingSession)initWithTrackingLevel:(unint64_t)a3;
- (CRImageReaderTrackingSession)initWithTrackingLevel:(unint64_t)a3 debuggingSession:(BOOL)a4;
- (CRImageReaderTrackingSession)initWithTrackingLevel:(unint64_t)a3 ocrFrameInterval:(unint64_t)a4;
- (double)lowFrequencyOCRElapsedTimeAboveMinimumStability;
- (float)applyOpticalFlowTrackingForFrame:(uint64_t)a1;
- (id).cxx_construct;
- (uint64_t)_dispatchAtOCRFrameInterval:(uint64_t)a1;
- (uint64_t)_dispatchIfReady:(uint64_t)a1;
- (uint64_t)dispatchIfReady:(uint64_t)a1;
- (uint64_t)shouldRunOCROnCurrentFrame;
- (uint64_t)trackedRegionType;
- (unint64_t)ocrUpdateMode;
- (void)prepareSessionForOCRDispatch;
- (void)saveQuadsAfterAssociation;
- (void)setDidDispatchOCROnFrame:(BOOL)a3;
- (void)setDidRunAssociationOnFrame:(BOOL)a3;
- (void)setLatestResult:(id)a3;
- (void)setLowFrequencyOCRElapsedTimeAboveMinimumStability:(double)a3;
- (void)setOcrUpdateMode:(unint64_t)a3;
- (void)setShouldIncludeLinesInTrackingResult:(BOOL)a3;
- (void)updateOCRUpdateModeWithStability:(id)a3 frameDuration:(double)a4;
@end

@implementation CRImageReaderTrackingSession

- (CRImageReaderTrackingSession)initWithTrackingLevel:(unint64_t)a3 debuggingSession:(BOOL)a4
{
  self->_debuggingSession = a4;
  return [(CRImageReaderTrackingSession *)self initWithTrackingLevel:a3];
}

- (CRImageReaderTrackingSession)initWithTrackingLevel:(unint64_t)a3 ocrFrameInterval:(unint64_t)a4
{
  v22.receiver = self;
  v22.super_class = (Class)CRImageReaderTrackingSession;
  v6 = [(CRImageReaderTrackingSession *)&v22 init];
  v7 = v6;
  if (a3 <= 1) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = a3;
  }
  v6->_shouldIncludeLinesInTrackingResult = 0;
  v9 = [[CRImageReaderTrackingResult alloc] initWithTrackingLevel:v8];
  latestResult = v7->_latestResult;
  v7->_latestResult = v9;

  v11 = (VisionCoreSparseOpticalFlowSession *)objc_alloc_init(MEMORY[0x1E4FB3F40]);
  BOOL v12 = a3 == 0;
  optFlowSession = v7->_optFlowSession;
  v7->_optFlowSession = v11;

  v14 = (long long *)MEMORY[0x1E4F14998];
  *(_WORD *)&v7->_ocrInProgress = 256;
  long long v15 = *v14;
  long long v16 = v14[1];
  *(_OWORD *)v7->_anon_d0 = *v14;
  *(_OWORD *)&v7->_anon_d0[16] = v16;
  long long v17 = v14[2];
  *(_OWORD *)&v7->_anon_d0[32] = v17;
  *(_OWORD *)&v7[1].super.isa = v15;
  *(_OWORD *)&v7[1]._wasLastFrameUnstableForFirstAcquisition = v16;
  *(_OWORD *)&v7[1]._trackingLevel = v17;
  v7->_downscaleRate = 4.0;
  v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v19 = dispatch_queue_create("com.apple.CoreRecognition.trackingOCRQueue", v18);
  ocrQueue = v7->_ocrQueue;
  v7->_ocrQueue = (OS_dispatch_queue *)v19;

  v7->_ocrFrameInterval = a4;
  v7->_replacedQuadArea = 0.0;
  *(_OWORD *)&v7->_frameCount = 0u;
  v7->_ocrUpdateMode = 1;
  v7->_lowFrequencyOCRElapsedTimeAboveMinimumStability = 0.0;
  *(_WORD *)&v7->_didDispatchOCROnFrame = 0;
  *(_OWORD *)&v7->_lastOCRDispatchTime = 0u;
  v7->_trackingLevel = v8;
  v7->_usesGroupedRegions = v12;

  return v7;
}

- (CRImageReaderTrackingSession)initWithTrackingLevel:(unint64_t)a3
{
  return [(CRImageReaderTrackingSession *)self initWithTrackingLevel:a3 ocrFrameInterval:0];
}

- (uint64_t)dispatchIfReady:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 64)) {
      uint64_t v4 = -[CRImageReaderTrackingSession _dispatchAtOCRFrameInterval:](a1, v3);
    }
    else {
      uint64_t v4 = -[CRImageReaderTrackingSession _dispatchIfReady:](a1, v3);
    }
    uint64_t v5 = v4;
    ++*(void *)(a1 + 48);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)_dispatchAtOCRFrameInterval:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    if (!(*(void *)(a1 + 48) % *(void *)(a1 + 64)) && (*(unsigned char *)(a1 + 11) & 1) != 0)
    {
      Property = objc_getProperty((id)a1, v3, 40, 1);
      dispatch_barrier_sync(Property, &__block_literal_global_17);
    }
    if (*(unsigned char *)(a1 + 11) || *(void *)(a1 + 48) % *(void *)(a1 + 64))
    {
      a1 = 0;
    }
    else
    {
      id v7 = objc_initWeak(&location, (id)a1);
      id v9 = objc_getProperty((id)a1, v8, 40, 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__CRImageReaderTrackingSession__dispatchAtOCRFrameInterval___block_invoke_2;
      block[3] = &unk_1E6CDB290;
      v10 = v9;
      objc_copyWeak(&v13, &location);
      id v12 = v4;
      dispatch_async(v10, block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      a1 = 1;
    }
  }

  return a1;
}

- (uint64_t)_dispatchIfReady:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 11))
    {
      a1 = 0;
    }
    else
    {
      id v4 = objc_initWeak(&location, (id)a1);
      id Property = objc_getProperty((id)a1, v5, 40, 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__CRImageReaderTrackingSession__dispatchIfReady___block_invoke;
      block[3] = &unk_1E6CDB290;
      id v7 = Property;
      objc_copyWeak(&v11, &location);
      id v10 = v3;
      dispatch_async(v7, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      a1 = 1;
    }
  }

  return a1;
}

- (uint64_t)trackedRegionType
{
  if (result)
  {
    unint64_t v1 = *(void *)(result + 32);
    self;
    if (v1 > 2) {
      return 0;
    }
    else {
      return qword_1DD8CE380[v1];
    }
  }
  return result;
}

- (float)applyOpticalFlowTrackingForFrame:(uint64_t)a1
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v126 = a2;
  if (a1)
  {
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    id v3 = (id)CRSignpostLog_signPostOSLog;
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    SEL v5 = (id)CRSignpostLog_signPostOSLog;
    v6 = v5;
    unint64_t v113 = v4 - 1;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "OCRTrackingApplyOpticalFlowE2E", "", buf, 2u);
    }
    os_signpost_id_t v114 = v4;

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    id v7 = (id)CRSignpostLog_signPostOSLog;
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    id v9 = (id)CRSignpostLog_signPostOSLog;
    id v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "OCRTrackingInputPrep", "", buf, 2u);
    }

    ++*(void *)(a1 + 56);
    double Current = CFAbsoluteTimeGetCurrent();
    double v12 = *(double *)(a1 + 72);
    *(CFAbsoluteTime *)(a1 + 72) = CFAbsoluteTimeGetCurrent();
    unint64_t v13 = [v126 width];
    float v14 = *(float *)(a1 + 20);
    unint64_t v15 = [v126 height];
    float v16 = (float)v13 / v14;
    float v17 = (float)v15 / *(float *)(a1 + 20);
    if ((int)v16) {
      double v18 = v16 + 1.0;
    }
    else {
      double v18 = v16;
    }
    if ((int)v17) {
      double v19 = v17 + 1.0;
    }
    else {
      double v19 = v17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (*(unsigned char *)(a1 + 12)) {
        uint64_t v20 = 1278226488;
      }
      else {
        uint64_t v20 = 1111970369;
      }
      texture = (__CVBuffer *)objc_msgSend(v126, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:", buf, 1, v20, 1, 1, 1.0 / *(float *)(a1 + 20), v18, v19);
    }
    else
    {
      if (*(unsigned char *)(a1 + 12))
      {
        v21 = [v126 imageByConvertingToColorSpace:0];
        objc_super v22 = (__CVBuffer *)objc_msgSend(v21, "pixelBufferWithScale:paddedToSize:", 1.0 / *(float *)(a1 + 20), v18, v19);
      }
      else
      {
        objc_super v22 = (__CVBuffer *)objc_msgSend(v126, "pixelBufferWithScale:paddedToSize:", 1.0 / *(float *)(a1 + 20), v18, v19);
      }
      texture = CRCreateIOSurfacePixelBufferFromPixelBuffer(v22);
      CVPixelBufferRelease(v22);
    }
    v23 = (void *)MEMORY[0x1E4F1CA48];
    v24 = *(void **)(a1 + 24);
    id location = (id *)(a1 + 24);
    if (*(unsigned char *)(a1 + 8)) {
      [v24 regionTrackingGroups];
    }
    else {
    v25 = [v24 trackedRegions];
    }
    v26 = objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v25, "count"));

    v133 = objc_opt_new();
    v134 = objc_opt_new();
    if (*(unsigned char *)(a1 + 8))
    {
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      v27 = [*location regionTrackingGroups];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v148 objects:v163 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v149;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v149 != v29) {
              objc_enumerationMutation(v27);
            }
            v31 = *(void **)(*((void *)&v148 + 1) + 8 * i);
            v32 = [v31 vcQuad];
            *(float *)&double v33 = 1.0 / *(float *)(a1 + 20);
            v34 = [v32 quadAfterScaling:v33];

            [v26 addObject:v34];
            [v134 setObject:v31 forKeyedSubscript:v34];
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v148 objects:v163 count:16];
        }
        while (v28);
      }
    }
    else
    {
      long long v146 = 0u;
      long long v147 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      v27 = [*location trackedRegions];
      uint64_t v35 = [v27 countByEnumeratingWithState:&v144 objects:v162 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v145;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v145 != v36) {
              objc_enumerationMutation(v27);
            }
            v38 = *(void **)(*((void *)&v144 + 1) + 8 * j);
            v39 = [v38 vcImageSpaceQuad];
            *(float *)&double v40 = 1.0 / *(float *)(a1 + 20);
            v41 = [v39 quadAfterScaling:v40];

            [v26 addObject:v41];
            [v133 setObject:v38 forKeyedSubscript:v41];
          }
          uint64_t v35 = [v27 countByEnumeratingWithState:&v144 objects:v162 count:16];
        }
        while (v35);
      }
    }

    v117 = (void *)[v26 copy];
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v42 = (id)CRSignpostLog_signPostOSLog;
    v43 = v42;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v43, OS_SIGNPOST_INTERVAL_END, v8, "OCRTrackingInputPrep", "", buf, 2u);
    }

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v44 = (id)CRSignpostLog_signPostOSLog;
    os_signpost_id_t v45 = os_signpost_id_generate(v44);

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v46 = (id)CRSignpostLog_signPostOSLog;
    v47 = v46;
    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v45, "OCRTrackingComputeHomographies", "", buf, 2u);
    }

    if (*(unsigned char *)(a1 + 10))
    {
      uint64_t v160 = *MEMORY[0x1E4FB3FD0];
      uint64_t v161 = MEMORY[0x1E4F1CC38];
      v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
    }
    else
    {
      v118 = (void *)MEMORY[0x1E4F1CC08];
    }
    v48 = (void *)MEMORY[0x1E01BF820]();
    uint64_t v49 = *(void *)(a1 + 96);
    id v143 = 0;
    v127 = [MEMORY[0x1E4FB3F38] computeHomographiesForQuadrilaterals:v117 inFrame:texture session:v49 options:v118 error:&v143];
    id v119 = v143;
    if (texture != (__CVBuffer *)[v126 pixelBuffer]) {
      CVPixelBufferRelease(texture);
    }
    if (*(unsigned char *)(a1 + 10))
    {
      uint64_t v50 = [*(id *)(a1 + 96) debuggingResult];
      v51 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v50;

      uint64_t v52 = [*(id *)(a1 + 96) debuggingMemoryResult];
      v53 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v52;
    }
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v54 = (id)CRSignpostLog_signPostOSLog;
    v55 = v54;
    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v55, OS_SIGNPOST_INTERVAL_END, v45, "OCRTrackingComputeHomographies", "", buf, 2u);
    }

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v56 = (id)CRSignpostLog_signPostOSLog;
    os_signpost_id_t spid = os_signpost_id_generate(v56);

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v57 = (id)CRSignpostLog_signPostOSLog;
    v58 = v57;
    os_signpost_id_t v111 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v58, OS_SIGNPOST_INTERVAL_BEGIN, spid, "OCRTrackingApplyHomographies", "", buf, 2u);
    }

    obuint64_t j = [[CRImageReaderTrackingResult alloc] initWithTrackingLevel:*(void *)(a1 + 32)];
    [*(id *)(a1 + 96) sceneHomography];
    v61.i64[0] = __PAIR64__(v60, v62.u32[1]);
    v62.i32[0] = v62.i32[2];
    v61.i64[1] = __PAIR64__(v63.u32[0], v62.u32[2]);
    v62.i64[0] = vextq_s8(v63, v62, 4uLL).u64[0];
    v62.i64[1] = v64;
    if ((vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_f32(v61), (int16x8_t)vceqzq_f32((float32x4_t)v62))))) & 1) != 0|| v59 != 0.0)
    {
      objc_msgSend(*(id *)(a1 + 96), "sceneHomography", v111);
      *(float *)&double v66 = v65;
      if (v65 != 0.0)
      {
        objc_msgSend(*(id *)(a1 + 96), "sceneHomography", v66);
        uint64_t v70 = 0;
        long long v71 = *(_OWORD *)(a1 + 224);
        long long v72 = *(_OWORD *)(a1 + 240);
        v164[0] = *(_OWORD *)(a1 + 208);
        v164[1] = v71;
        v164[2] = v72;
        do
        {
          *(float32x4_t *)&buf[v70 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v67, COERCE_FLOAT(v164[v70])), v68, *(float32x2_t *)&v164[v70], 1), v69, (float32x4_t)v164[v70], 2);
          ++v70;
        }
        while (v70 != 3);
        uint64_t v73 = *(void *)buf;
        long long v74 = v168;
        long long v75 = v169;
        *(_DWORD *)(a1 + 216) = *(_DWORD *)&buf[8];
        *(_DWORD *)(a1 + 232) = DWORD2(v74);
        *(void *)(a1 + 208) = v73;
        *(void *)(a1 + 224) = v74;
        *(_DWORD *)(a1 + 248) = DWORD2(v75);
        *(void *)(a1 + 240) = v75;
        *(float *)&uint64_t v73 = 1.0 / *((float *)&v75 + 2);
        float32x4_t v76 = *(float32x4_t *)(a1 + 240);
        float32x4_t v77 = vmulq_n_f32(*(float32x4_t *)(a1 + 208), 1.0 / *((float *)&v75 + 2));
        float32x4_t v78 = vmulq_n_f32(*(float32x4_t *)(a1 + 224), 1.0 / *((float *)&v75 + 2));
        *(_DWORD *)(a1 + 216) = v77.i32[2];
        *(_DWORD *)(a1 + 232) = v78.i32[2];
        *(void *)(a1 + 208) = v77.i64[0];
        *(void *)(a1 + 224) = v78.i64[0];
        float32x4_t v79 = vmulq_n_f32(v76, *(float *)&v73);
        *(_DWORD *)(a1 + 248) = v79.i32[2];
        *(void *)(a1 + 240) = v79.i64[0];
      }
    }
    v80 = objc_opt_new();
    v120 = v80;
    v122 = objc_opt_new();
    v123 = objc_opt_new();
    v124 = objc_opt_new();
    uint64_t v139 = 0;
    v140 = (float *)&v139;
    uint64_t v141 = 0x2020000000;
    int v142 = 0;
    if (*(unsigned char *)(a1 + 8))
    {
      v81 = (id *)v136;
      v136[0] = MEMORY[0x1E4F143A8];
      v136[1] = 3221225472;
      v136[2] = __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke;
      v136[3] = &unk_1E6CDB218;
      id v82 = v134;
      v138 = &v139;
      v136[4] = v82;
      v136[5] = a1;
      v136[6] = v124;
      v136[7] = v122;
      v136[8] = v123;
      id v137 = v80;
      [v127 enumerateKeysAndObjectsUsingBlock:v136];
    }
    else
    {
      v81 = (id *)v135;
      v135[0] = MEMORY[0x1E4F143A8];
      v135[1] = 3221225472;
      v135[2] = __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_3;
      v135[3] = &unk_1E6CDB268;
      id v83 = v133;
      v135[9] = &v139;
      v135[4] = v83;
      v135[5] = a1;
      v135[6] = v124;
      v135[7] = v80;
      v135[8] = v123;
      [v127 enumerateKeysAndObjectsUsingBlock:v135];
    }

    [(CRImageReaderTrackingResult *)obj setTrackedRegions:v80];
    [(CRImageReaderTrackingResult *)obj setRemovedRegionIDs:v124];
    [(CRImageReaderTrackingResult *)obj setUpdatedRegionIDs:v123];
    [(CRImageReaderTrackingResult *)obj setRegionTrackingGroups:v122];
    unint64_t v84 = *(void *)(a1 + 56);
    *(float *)&double v85 = (float)v84;
    if (v84 >= 8) {
      *(float *)&double v85 = 7.5;
    }
    -[CRImageReaderTrackingResult markTracksNotConformingSameHomographyUsingGroupsAtOCRDispatch:ransacReprojError:markedQuadArea:](obj, "markTracksNotConformingSameHomographyUsingGroupsAtOCRDispatch:ransacReprojError:markedQuadArea:", 0, v85, *(double *)(a1 + 80), v111);
    v86 = [v126 sceneStabilityMetric];
    [(id)a1 updateOCRUpdateModeWithStability:v86 frameDuration:Current - v12];

    if (*(unsigned char *)(a1 + 8) && (unint64_t)(*(void *)(a1 + 136) - 1) >= 2)
    {
      v115 = obj;
      v87 = [(CRImageReaderTrackingResult *)v115 regionTrackingGroups];
      v128 = (void *)[v87 mutableCopy];

      v88 = [(CRImageReaderTrackingResult *)v115 trackedRegions];
      v89 = (void *)[v88 mutableCopy];

      v90 = [(CRImageReaderTrackingResult *)v115 trackedRegions];
      v129 = (void *)[v90 mutableCopy];

      v91 = [(CRImageReaderTrackingResult *)v115 removedRegionIDs];
      v130 = (void *)[v91 mutableCopy];

      long long v158 = 0u;
      long long v159 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      v92 = [(CRImageReaderTrackingResult *)v115 regionTrackingGroups];
      CVPixelBufferRef texturea = v92;
      uint64_t v93 = [(__CVBuffer *)v92 countByEnumeratingWithState:&v156 objects:buf count:16];
      if (v93)
      {
        uint64_t v94 = *(void *)v157;
        do
        {
          for (uint64_t k = 0; k != v93; ++k)
          {
            if (*(void *)v157 != v94) {
              objc_enumerationMutation(texturea);
            }
            v96 = *(void **)(*((void *)&v156 + 1) + 8 * k);
            if ([v96 trackNeedsReplacement])
            {
              [v128 removeObject:v96];
              v97 = CROSLogForCategory(1);
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v98 = *(void *)(a1 + 48);
                *(_DWORD *)v165 = 134217984;
                uint64_t v166 = v98;
                _os_log_impl(&dword_1DD733000, v97, OS_LOG_TYPE_DEFAULT, "Replaced a group due to ransac (frame %ld)", v165, 0xCu);
              }

              v99 = [v96 trackingID];
              [v129 removeObject:v99];

              v100 = [v96 trackingID];
              [v130 addObject:v100];

              long long v154 = 0u;
              long long v155 = 0u;
              long long v152 = 0u;
              long long v153 = 0u;
              v101 = [v96 children];
              uint64_t v102 = [v101 countByEnumeratingWithState:&v152 objects:v164 count:16];
              if (v102)
              {
                uint64_t v103 = *(void *)v153;
                do
                {
                  for (uint64_t m = 0; m != v102; ++m)
                  {
                    if (*(void *)v153 != v103) {
                      objc_enumerationMutation(v101);
                    }
                    [v89 removeObject:*(void *)(*((void *)&v152 + 1) + 8 * m)];
                  }
                  uint64_t v102 = [v101 countByEnumeratingWithState:&v152 objects:v164 count:16];
                }
                while (v102);
              }
            }
          }
          v92 = texturea;
          uint64_t v93 = [(__CVBuffer *)texturea countByEnumeratingWithState:&v156 objects:buf count:16];
        }
        while (v93);
      }

      [(CRImageReaderTrackingResult *)v115 setTrackedRegions:v89];
      [(CRImageReaderTrackingResult *)v115 setRegionTrackingGroups:v128];
      [(CRImageReaderTrackingResult *)v115 setUpdatedRegionIDs:v129];
      [(CRImageReaderTrackingResult *)v115 setRemovedRegionIDs:v130];
    }
    objc_storeStrong(location, obj);
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v105 = (id)CRSignpostLog_signPostOSLog;
    v106 = v105;
    if (v112 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v106, OS_SIGNPOST_INTERVAL_END, spid, "OCRTrackingApplyHomographies", "", buf, 2u);
    }

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    v107 = (id)CRSignpostLog_signPostOSLog;
    v108 = v107;
    if (v113 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v108, OS_SIGNPOST_INTERVAL_END, v114, "OCRTrackingApplyOpticalFlowE2E", "", buf, 2u);
    }

    float v109 = v140[6];
    _Block_object_dispose(&v139, 8);
  }
  else
  {
    float v109 = 0.0;
  }

  return v109;
}

void __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  [v6 reprojectionError];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v8;
  if (v6)
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    id v9 = [v7 boundingQuad];
    id v10 = [v9 denormalizedQuad];

    [v6 warpTransform];
    long long v35 = v12;
    long long v36 = v11;
    long long v34 = v13;
    int v14 = *(_DWORD *)(*(void *)(a1 + 40) + 20);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_2;
    v41[3] = &unk_1E6CDB1F0;
    v44 = &v45;
    id v15 = v10;
    id v42 = v15;
    id v16 = v7;
    id v43 = v16;
    LODWORD(v17) = v14;
    objc_msgSend(v16, "applyHomographyTransform:downscaleRate:shouldApply:", v41, *(double *)&v36, *(double *)&v35, *(double *)&v34, v17);
    double v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "groupID"));
    [v16 setHomographyGroupID:v18];

    uint64_t v19 = [v6 groupID];
    uint64_t v20 = [v16 vcQuad];
    [v20 setHomographyGroupID:v19];

    if (*((unsigned char *)v46 + 24))
    {
      [v15 area];
      *(double *)(*(void *)(a1 + 40) + 80) = v21 + *(double *)(*(void *)(a1 + 40) + 80);
      objc_super v22 = *(void **)(a1 + 48);
      v23 = [v16 trackingID];
      [v22 addObject:v23];
    }
    else
    {
      [*(id *)(a1 + 56) addObject:v16];
      uint64_t v29 = *(void **)(a1 + 64);
      v30 = [v16 trackingID];
      [v29 addObject:v30];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v23 = [v16 children];
      uint64_t v31 = [v23 countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v38 != v32) {
              objc_enumerationMutation(v23);
            }
            objc_msgSend(*(id *)(a1 + 72), "addObject:", *(void *)(*((void *)&v37 + 1) + 8 * i), v34, v35, v36);
          }
          uint64_t v31 = [v23 countByEnumeratingWithState:&v37 objects:v49 count:16];
        }
        while (v31);
      }
    }

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v24 = [v7 boundingQuad];
    v25 = [v24 denormalizedQuad];
    [v25 area];
    *(double *)(*(void *)(a1 + 40) + 80) = v26 + *(double *)(*(void *)(a1 + 40) + 80);

    v27 = *(void **)(a1 + 48);
    uint64_t v28 = [v7 trackingID];
    [v27 addObject:v28];
  }
}

BOOL __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = +[CRTrackingFilter shouldFilterHomographyWithResultQuad:originalQuad:imageSize:](CRTrackingFilter, "shouldFilterHomographyWithResultQuad:originalQuad:imageSize:", v7, *(void *)(a1 + 32), a3, a4);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) originalBoundingQuad];
    id v10 = [v9 denormalizedQuad];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = +[CRTrackingFilter shouldEdgeIntersectionFilterQuad:originalQuad:imageSize:](CRTrackingFilter, "shouldEdgeIntersectionFilterQuad:originalQuad:imageSize:", v7, v10, a3, a4);

    BOOL v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0;
  }

  return v8;
}

void __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  [v6 reprojectionError];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
  if (v6)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    id v9 = [v7 boundingQuad];
    id v10 = [v9 denormalizedQuad];

    [v6 warpTransform];
    double v22 = v12;
    double v23 = v11;
    double v21 = v13;
    int v14 = *(_DWORD *)(*(void *)(a1 + 40) + 20);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_4;
    v24[3] = &unk_1E6CDB240;
    double v26 = &v27;
    id v15 = v10;
    id v25 = v15;
    LODWORD(v16) = v14;
    objc_msgSend(v7, "applyHomographyTransform:downscaleRate:shouldApply:", v24, v23, v22, v21, v16);
    [v7 setSignificantTranscriptChange:0];
    if (*((unsigned char *)v28 + 24))
    {
      double v17 = *(void **)(a1 + 48);
    }
    else
    {
      [*(id *)(a1 + 56) addObject:v7];
      double v17 = *(void **)(a1 + 64);
    }
    double v18 = [v7 trackingID];
    [v17 addObject:v18];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    uint64_t v19 = *(void **)(a1 + 48);
    uint64_t v20 = [v7 trackingID];
    [v19 addObject:v20];
  }
}

BOOL __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_4(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[CRTrackingFilter shouldFilterHomographyWithResultQuad:originalQuad:imageSize:](CRTrackingFilter, "shouldFilterHomographyWithResultQuad:originalQuad:imageSize:", v7, *(void *)(a1 + 32), a3, a4);
  BOOL v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;

  return v8;
}

- (void)updateOCRUpdateModeWithStability:(id)a3 frameDuration:(double)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = [(CRImageReaderTrackingSession *)self ocrUpdateMode];
  if (v7)
  {
    [v7 doubleValue];
    if (v9 < 0.976)
    {
      uint64_t v10 = 0;
LABEL_26:
      [(CRImageReaderTrackingSession *)self setOcrUpdateMode:v10];
      goto LABEL_27;
    }
  }
  if (self && a4 > 0.100000001 && self->_frameCount)
  {
    uint64_t v11 = 4;
LABEL_8:
    [(CRImageReaderTrackingSession *)self setOcrUpdateMode:v11];
    goto LABEL_27;
  }
  if (v7 && ([v7 doubleValue], v12 > 0.984))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (self) {
      double lastFrameTime = self->_lastFrameTime;
    }
    else {
      double lastFrameTime = 0.0;
    }
    [(CRImageReaderTrackingSession *)self lowFrequencyOCRElapsedTimeAboveMinimumStability];
    [(CRImageReaderTrackingSession *)self setLowFrequencyOCRElapsedTimeAboveMinimumStability:v15 + Current - lastFrameTime];
    [v7 doubleValue];
    if (v16 > 0.988)
    {
      [(CRImageReaderTrackingSession *)self lowFrequencyOCRElapsedTimeAboveMinimumStability];
      if (v17 > 1.0) {
        [(CRImageReaderTrackingSession *)self setOcrUpdateMode:4];
      }
    }
  }
  else
  {
    [(CRImageReaderTrackingSession *)self setLowFrequencyOCRElapsedTimeAboveMinimumStability:0.0];
  }
  if (v8 == [(CRImageReaderTrackingSession *)self ocrUpdateMode]
    || [(CRImageReaderTrackingSession *)self ocrUpdateMode] == 4)
  {
    [(CRImageReaderTrackingSession *)self lowFrequencyOCRElapsedTimeAboveMinimumStability];
    if (v18 == 0.0)
    {
      if (!v7 || ([v7 doubleValue], v19 <= 0.978))
      {
        uint64_t v10 = 1;
        goto LABEL_26;
      }
      uint64_t v20 = [(CRImageReaderTrackingSession *)self latestResult];
      os_signpost_id_t v4 = [v20 trackedRegions];
      if ([v4 count])
      {
        double v21 = self->_replacedQuadArea / self->_totalQuadArea;

        if (v21 <= 0.2)
        {
          uint64_t v11 = 2;
          goto LABEL_8;
        }
      }
      else
      {
      }
      if (self->_replacedQuadArea / self->_totalQuadArea > 0.2)
      {
        double v33 = CROSLogForCategory(1);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t frameCount = self->_frameCount;
          double v35 = self->_replacedQuadArea / self->_totalQuadArea;
          int v36 = 134218240;
          uint64_t v37 = frameCount;
          __int16 v38 = 2048;
          double v39 = v35;
          _os_log_impl(&dword_1DD733000, v33, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: switching to as fast as possible: (frame %ld, replaced area ratio %f)", (uint8_t *)&v36, 0x16u);
        }
      }
      uint64_t v11 = 1;
      goto LABEL_8;
    }
  }
LABEL_27:
  if (v8 != [(CRImageReaderTrackingSession *)self ocrUpdateMode])
  {
    double v22 = CROSLogForCategory(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v23 = [(CRImageReaderTrackingSession *)self ocrUpdateMode];
      if (self) {
        unint64_t v24 = self->_frameCount;
      }
      else {
        unint64_t v24 = 0;
      }
      int v36 = 134218754;
      uint64_t v37 = v8;
      __int16 v38 = 2048;
      double v39 = *(double *)&v23;
      __int16 v40 = 2048;
      unint64_t v41 = v24;
      __int16 v42 = 2112;
      id v43 = v7;
      _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: %ld -> %ld (frame %ld, scene %@)", (uint8_t *)&v36, 0x2Au);
    }
  }
  if ([(CRImageReaderTrackingSession *)self ocrUpdateMode] == 1)
  {
    double v25 = CFAbsoluteTimeGetCurrent();
    if (self->_ocrDispatchTimestamps.c.__size_.__value_ >= 5
      && (*(double **)((char *)self->_ocrDispatchTimestamps.c.__map_.__begin_
                     + ((self->_ocrDispatchTimestamps.c.__start_ >> 6) & 0x3FFFFFFFFFFFFF8)))[self->_ocrDispatchTimestamps.c.__start_ & 0x1FF] > v25 + -5.0)
    {
      [(CRImageReaderTrackingSession *)self setOcrUpdateMode:2];
      double v26 = CROSLogForCategory(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v27 = [(CRImageReaderTrackingSession *)self ocrUpdateMode];
        int v36 = 134217984;
        uint64_t v37 = v27;
        _os_log_impl(&dword_1DD733000, v26, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: [KILL SWITCH] %lu", (uint8_t *)&v36, 0xCu);
      }
    }
  }
  uint64_t v28 = [MEMORY[0x1E4F28F80] processInfo];
  BOOL v29 = [v28 thermalState] > 1;

  if (v29
    && [(CRImageReaderTrackingSession *)self ocrUpdateMode] <= 2
    && [(CRImageReaderTrackingSession *)self ocrUpdateMode])
  {
    [(CRImageReaderTrackingSession *)self setOcrUpdateMode:3];
    uint64_t v28 = CROSLogForCategory(1);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v30 = [(CRImageReaderTrackingSession *)self ocrUpdateMode];
      int v36 = 134217984;
      uint64_t v37 = v30;
      _os_log_impl(&dword_1DD733000, v28, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: [THERMAL PRESSURE OVERRIDE] %lu", (uint8_t *)&v36, 0xCu);
    }
  }
  if (qword_1EB58C978 != -1) {
    dispatch_once(&qword_1EB58C978, &__block_literal_global_7);
  }
  if (_MergedGlobals_12)
  {
    uint64_t v28 = [(CRImageReaderTrackingSession *)self ocrUpdateMode];
    if (v28 != [(id)_MergedGlobals_12 unsignedIntegerValue])
    {
      if ([(CRImageReaderTrackingSession *)self ocrUpdateMode])
      {
        uint64_t v28 = CROSLogForCategory(1);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 138412290;
          uint64_t v37 = _MergedGlobals_12;
          _os_log_impl(&dword_1DD733000, v28, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: [DEFAULTS OVERRIDE] %@", (uint8_t *)&v36, 0xCu);
        }

        -[CRImageReaderTrackingSession setOcrUpdateMode:](self, "setOcrUpdateMode:", [(id)_MergedGlobals_12 unsignedIntegerValue]);
      }
    }
  }
  unint64_t v31 = [(CRImageReaderTrackingSession *)self ocrUpdateMode];
  if (v31)
  {
    BOOL v32 = 0;
    if (!self) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  uint64_t v28 = [(CRImageReaderTrackingSession *)self latestResult];
  os_signpost_id_t v4 = [v28 trackedRegions];
  BOOL v32 = [v4 count] == 0;
  if (self) {
LABEL_55:
  }
    self->_wasLastFrameUnstableForFirstAcquisition = v32;
LABEL_56:
  if (!v31)
  {
  }
}

void __79__CRImageReaderTrackingSession_updateOCRUpdateModeWithStability_frameDuration___block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"com.apple.CoreRecognition.tracking_ocr_update_mode_override"];
  unint64_t v1 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = v0;
}

- (uint64_t)shouldRunOCROnCurrentFrame
{
  if (result)
  {
    unint64_t v1 = (double *)result;
    if (*(void *)(result + 64))
    {
      return 1;
    }
    else
    {
      double Current = CFAbsoluteTimeGetCurrent();
      double v3 = v1[15];
      uint64_t v4 = [v1 ocrUpdateMode];
      result = 1;
      switch(v4)
      {
        case 0:
          return 0;
        case 2:
          double v5 = 1.5;
          goto LABEL_9;
        case 3:
          double v5 = 2.0;
          goto LABEL_9;
        case 4:
          double v5 = 3.0;
LABEL_9:
          result = Current - v3 > v5;
          break;
        default:
          return result;
      }
    }
  }
  return result;
}

- (void)prepareSessionForOCRDispatch
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  *(CFAbsoluteTime *)(a1 + 120) = CFAbsoluteTimeGetCurrent();
  uint64_t v2 = MEMORY[0x1E4F14998];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
  *(_OWORD *)(a1 + 208) = *MEMORY[0x1E4F14998];
  *(_OWORD *)(a1 + 224) = v3;
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(v2 + 32);
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  uint64_t v4 = [*(id *)(a1 + 24) trackedRegions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v123 objects:v128 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v124;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v124 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v123 + 1) + 8 * i) updatePreviousAssociationQuad];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v123 objects:v128 count:16];
    }
    while (v5);
  }

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  unint64_t v8 = objc_msgSend(*(id *)(a1 + 24), "regionTrackingGroups", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v119 objects:v127 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v120;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v120 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v119 + 1) + 8 * j) updatePreviousAssociationQuad];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v119 objects:v127 count:16];
    }
    while (v9);
  }

  double v12 = *(char **)(a1 + 168);
  double v13 = *(void ***)(a1 + 160);
  uint64_t v14 = v12 - (char *)v13;
  if (v12 == (char *)v13) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = ((v12 - (char *)v13) << 6) - 1;
  }
  unint64_t v16 = *(void *)(a1 + 184);
  uint64_t v17 = *(void *)(a1 + 192);
  unint64_t v18 = v17 + v16;
  if (v15 == v17 + v16)
  {
    BOOL v19 = v16 >= 0x200;
    unint64_t v20 = v16 - 512;
    if (v19)
    {
      *(void *)(a1 + 184) = v20;
      unint64_t v23 = *v13;
      double v21 = (char *)(v13 + 1);
      double v22 = v23;
      *(void *)(a1 + 160) = v21;
      if (v12 == *(char **)(a1 + 176))
      {
        unint64_t v24 = *(void *)(a1 + 152);
        uint64_t v25 = (uint64_t)&v21[-v24];
        if ((unint64_t)v21 <= v24)
        {
          uint64_t v51 = (uint64_t)&v12[-v24];
          BOOL v50 = v51 == 0;
          uint64_t v52 = v51 >> 2;
          if (v50) {
            unint64_t v53 = 1;
          }
          else {
            unint64_t v53 = v52;
          }
          v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v53);
          v56 = &v54[8 * (v53 >> 2)];
          v57 = *(uint64_t **)(a1 + 160);
          double v12 = v56;
          uint64_t v58 = *(void *)(a1 + 168) - (void)v57;
          if (v58)
          {
            double v12 = &v56[v58 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v59 = 8 * (v58 >> 3);
            unsigned int v60 = &v54[8 * (v53 >> 2)];
            do
            {
              uint64_t v61 = *v57++;
              *(void *)unsigned int v60 = v61;
              v60 += 8;
              v59 -= 8;
            }
            while (v59);
          }
          int8x16_t v62 = *(void **)(a1 + 152);
          *(void *)(a1 + 152) = v54;
          *(void *)(a1 + 160) = v56;
          *(void *)(a1 + 168) = v12;
          *(void *)(a1 + 176) = &v54[8 * v55];
          if (v62)
          {
            operator delete(v62);
            double v12 = *(char **)(a1 + 168);
          }
        }
        else
        {
          uint64_t v26 = v25 >> 3;
          BOOL v27 = v25 >> 3 < -1;
          uint64_t v28 = (v25 >> 3) + 2;
          if (v27) {
            uint64_t v29 = v28;
          }
          else {
            uint64_t v29 = v26 + 1;
          }
          uint64_t v30 = -(v29 >> 1);
          uint64_t v31 = v29 >> 1;
          BOOL v32 = &v21[-8 * v31];
          int64_t v33 = v12 - v21;
          if (v12 != v21)
          {
            memmove(&v21[-8 * v31], v21, v12 - v21);
            double v12 = *(char **)(a1 + 160);
          }
          long long v34 = &v12[8 * v30];
          double v12 = &v32[v33];
          *(void *)(a1 + 160) = v34;
          *(void *)(a1 + 168) = &v32[v33];
        }
      }
      *(void *)double v12 = v22;
    }
    else
    {
      uint64_t v35 = v14 >> 3;
      int v36 = *(char **)(a1 + 176);
      uint64_t v37 = *(void ***)(a1 + 152);
      if (v14 >> 3 >= (unint64_t)((v36 - (char *)v37) >> 3))
      {
        if (v36 == (char *)v37) {
          unint64_t v40 = 1;
        }
        else {
          unint64_t v40 = (v36 - (char *)v37) >> 2;
        }
        unint64_t v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v40);
        uint64_t v43 = v42;
        uint64_t v44 = operator new(0x1000uLL);
        uint64_t v45 = &v41[8 * v35];
        v46 = &v41[8 * v43];
        if (v35 == v43)
        {
          uint64_t v47 = 8 * v35;
          if (v14 < 1)
          {
            uint64_t v86 = v47 >> 2;
            if (v12 == (char *)v13) {
              unint64_t v87 = 1;
            }
            else {
              unint64_t v87 = v86;
            }
            v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v87);
            uint64_t v45 = &v88[8 * (v87 >> 2)];
            v46 = &v88[8 * v89];
            if (v41) {
              operator delete(v41);
            }
            unint64_t v41 = v88;
          }
          else
          {
            uint64_t v48 = v47 >> 3;
            if (v48 >= -1) {
              unint64_t v49 = v48 + 1;
            }
            else {
              unint64_t v49 = v48 + 2;
            }
            v45 -= 8 * (v49 >> 1);
          }
        }
        *(void *)uint64_t v45 = v44;
        v90 = v45 + 8;
        for (uint64_t k = *(void *)(a1 + 168); k != *(void *)(a1 + 160); k -= 8)
        {
          if (v45 == v41)
          {
            if (v90 >= v46)
            {
              if (v46 == v41) {
                unint64_t v96 = 1;
              }
              else {
                unint64_t v96 = (v46 - v41) >> 2;
              }
              v97 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v96);
              v99 = v97;
              uint64_t v45 = &v97[(2 * v96 + 6) & 0xFFFFFFFFFFFFFFF8];
              uint64_t v100 = v90 - v41;
              BOOL v50 = v90 == v41;
              v90 = v45;
              if (!v50)
              {
                v90 = &v45[v100 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v101 = 8 * (v100 >> 3);
                uint64_t v102 = v45;
                uint64_t v103 = (uint64_t *)v41;
                do
                {
                  uint64_t v104 = *v103++;
                  *(void *)uint64_t v102 = v104;
                  v102 += 8;
                  v101 -= 8;
                }
                while (v101);
              }
              v46 = &v97[8 * v98];
              if (v41) {
                operator delete(v41);
              }
              unint64_t v41 = v99;
            }
            else
            {
              uint64_t v92 = (v46 - v90) >> 3;
              if (v92 >= -1) {
                uint64_t v93 = v92 + 1;
              }
              else {
                uint64_t v93 = v92 + 2;
              }
              uint64_t v94 = v93 >> 1;
              uint64_t v45 = &v41[8 * (v93 >> 1)];
              v95 = v41;
              if (v90 != v41)
              {
                memmove(v45, v41, v90 - v41);
                v95 = v90;
              }
              v90 = &v95[8 * v94];
            }
          }
          uint64_t v105 = *(void *)(k - 8);
          *((void *)v45 - 1) = v105;
          v45 -= 8;
        }
        v106 = *(void **)(a1 + 152);
        *(void *)(a1 + 152) = v41;
        *(void *)(a1 + 160) = v45;
        *(void *)(a1 + 168) = v90;
        *(void *)(a1 + 176) = v46;
        if (v106) {
          operator delete(v106);
        }
        goto LABEL_52;
      }
      __int16 v38 = operator new(0x1000uLL);
      double v39 = v38;
      if (v36 == v12)
      {
        if (v13 == v37)
        {
          if (v12 == (char *)v13) {
            unint64_t v64 = 1;
          }
          else {
            unint64_t v64 = (v36 - (char *)v13) >> 2;
          }
          float v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v64);
          double v13 = (void **)&v65[8 * ((v64 + 3) >> 2)];
          float32x4_t v67 = *(void ***)(a1 + 160);
          float32x4_t v68 = v13;
          uint64_t v69 = *(void *)(a1 + 168) - (void)v67;
          if (v69)
          {
            float32x4_t v68 = (void **)((char *)v13 + (v69 & 0xFFFFFFFFFFFFFFF8));
            uint64_t v70 = 8 * (v69 >> 3);
            long long v71 = v13;
            do
            {
              long long v72 = *v67++;
              *v71++ = v72;
              v70 -= 8;
            }
            while (v70);
          }
          uint64_t v73 = *(void **)(a1 + 152);
          *(void *)(a1 + 152) = v65;
          *(void *)(a1 + 160) = v13;
          *(void *)(a1 + 168) = v68;
          *(void *)(a1 + 176) = &v65[8 * v66];
          if (v73)
          {
            operator delete(v73);
            double v13 = *(void ***)(a1 + 160);
          }
        }
        *(v13 - 1) = v39;
        long long v74 = *(char **)(a1 + 160);
        long long v75 = *(char **)(a1 + 168);
        *(void *)(a1 + 160) = v74 - 8;
        uint64_t v76 = *((void *)v74 - 1);
        *(void *)(a1 + 160) = v74;
        if (v75 == *(char **)(a1 + 176))
        {
          unint64_t v77 = *(void *)(a1 + 152);
          uint64_t v78 = (uint64_t)&v74[-v77];
          if ((unint64_t)v74 <= v77)
          {
            uint64_t v107 = (uint64_t)&v75[-v77];
            BOOL v50 = v107 == 0;
            uint64_t v108 = v107 >> 2;
            if (v50) {
              unint64_t v109 = 1;
            }
            else {
              unint64_t v109 = v108;
            }
            v110 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v109);
            unint64_t v112 = &v110[8 * (v109 >> 2)];
            unint64_t v113 = *(uint64_t **)(a1 + 160);
            long long v75 = v112;
            uint64_t v114 = *(void *)(a1 + 168) - (void)v113;
            if (v114)
            {
              long long v75 = &v112[v114 & 0xFFFFFFFFFFFFFFF8];
              uint64_t v115 = 8 * (v114 >> 3);
              v116 = &v110[8 * (v109 >> 2)];
              do
              {
                uint64_t v117 = *v113++;
                *(void *)v116 = v117;
                v116 += 8;
                v115 -= 8;
              }
              while (v115);
            }
            v118 = *(void **)(a1 + 152);
            *(void *)(a1 + 152) = v110;
            *(void *)(a1 + 160) = v112;
            *(void *)(a1 + 168) = v75;
            *(void *)(a1 + 176) = &v110[8 * v111];
            if (v118)
            {
              operator delete(v118);
              long long v75 = *(char **)(a1 + 168);
            }
          }
          else
          {
            uint64_t v79 = v78 >> 3;
            BOOL v27 = v78 >> 3 < -1;
            uint64_t v80 = (v78 >> 3) + 2;
            if (v27) {
              uint64_t v81 = v80;
            }
            else {
              uint64_t v81 = v79 + 1;
            }
            uint64_t v82 = -(v81 >> 1);
            uint64_t v83 = v81 >> 1;
            unint64_t v84 = &v74[-8 * v83];
            int64_t v85 = v75 - v74;
            if (v75 != v74)
            {
              memmove(&v74[-8 * v83], v74, v75 - v74);
              long long v74 = *(char **)(a1 + 160);
            }
            long long v75 = &v84[v85];
            *(void *)(a1 + 160) = &v74[8 * v82];
            *(void *)(a1 + 168) = &v84[v85];
          }
        }
        *(void *)long long v75 = v76;
      }
      else
      {
        *(void *)double v12 = v38;
      }
    }
    *(void *)(a1 + 168) += 8;
LABEL_52:
    double v13 = *(void ***)(a1 + 160);
    unint64_t v16 = *(void *)(a1 + 184);
    uint64_t v17 = *(void *)(a1 + 192);
    unint64_t v18 = v16 + v17;
  }
  (*(void **)((char *)v13 + ((v18 >> 6) & 0x3FFFFFFFFFFFFF8)))[v18 & 0x1FF] = *(void *)(a1 + 120);
  *(void *)(a1 + 192) = v17 + 1;
  if ((unint64_t)(v17 + 1) >= 6)
  {
    unint64_t v63 = v16 + 1;
    *(void *)(a1 + 184) = v63;
    *(void *)(a1 + 192) = v17;
    if (v63 >= 0x400)
    {
      operator delete(*v13);
      *(void *)(a1 + 160) += 8;
      *(void *)(a1 + 184) -= 512;
    }
  }
}

- (void)saveQuadsAfterAssociation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v2 = [*(id *)(a1 + 24) trackedRegions];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v19 != v4) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) updateBoundingQuadAfterOCR];
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v3);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 24), "regionTrackingGroups", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t j = 0; j != v7; ++j)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * j);
          [v10 updateBoundingQuadAfterOCR];
          uint64_t v11 = [v10 boundingQuad];
          double v12 = [v11 denormalizedQuad];
          [v12 area];
          *(double *)(a1 + 88) = v13 + *(double *)(a1 + 88);
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v7);
    }

    *(void *)(a1 + 80) = 0;
    *(void *)(a1 + 56) = 0;
  }
}

void __49__CRImageReaderTrackingSession__dispatchIfReady___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    WeakRetained[11] = 1;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = objc_loadWeakRetained(v2);
  if (v4) {
    v4[11] = 0;
  }
}

void __60__CRImageReaderTrackingSession__dispatchAtOCRFrameInterval___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    WeakRetained[11] = 1;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = objc_loadWeakRetained(v2);
  if (v4) {
    v4[11] = 0;
  }
}

- (BOOL)usesGroupedRegions
{
  return self->_usesGroupedRegions;
}

- (CRImageReaderTrackingResult)latestResult
{
  return (CRImageReaderTrackingResult *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLatestResult:(id)a3
{
}

- (BOOL)wasLatestFrameUnstableForFirstAcquisition
{
  return self->_wasLatestFrameUnstableForFirstAcquisition;
}

- (BOOL)shouldIncludeLinesInTrackingResult
{
  return self->_shouldIncludeLinesInTrackingResult;
}

- (void)setShouldIncludeLinesInTrackingResult:(BOOL)a3
{
  self->_shouldIncludeLinesInTrackingResult = a3;
}

- (BOOL)didDispatchOCROnFrame
{
  return self->_didDispatchOCROnFrame;
}

- (void)setDidDispatchOCROnFrame:(BOOL)a3
{
  self->_didDispatchOCROnFrame = a3;
}

- (BOOL)didRunAssociationOnFrame
{
  return self->_didRunAssociationOnFrame;
}

- (void)setDidRunAssociationOnFrame:(BOOL)a3
{
  self->_didRunAssociationOnFrame = a3;
}

- (unint64_t)ocrUpdateMode
{
  return self->_ocrUpdateMode;
}

- (void)setOcrUpdateMode:(unint64_t)a3
{
  self->_ocrUpdateMode = a3;
}

- (double)lowFrequencyOCRElapsedTimeAboveMinimumStability
{
  return self->_lowFrequencyOCRElapsedTimeAboveMinimumStability;
}

- (void)setLowFrequencyOCRElapsedTimeAboveMinimumStability:(double)a3
{
  self->_lowFrequencyOCRElapsedTimeAboveMinimumStability = a3;
}

- (void).cxx_destruct
{
  begin = self->_ocrDispatchTimestamps.c.__map_.__begin_;
  end = self->_ocrDispatchTimestamps.c.__map_.__end_;
  self->_ocrDispatchTimestamps.c.__size_.__value_ = 0;
  unint64_t v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_ocrDispatchTimestamps.c.__map_.__end_;
      begin = self->_ocrDispatchTimestamps.c.__map_.__begin_ + 1;
      self->_ocrDispatchTimestamps.c.__map_.__begin_ = begin;
      unint64_t v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  unint64_t v6 = v5 >> 3;
  if (v6 == 1)
  {
    unint64_t v7 = 256;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    unint64_t v7 = 512;
LABEL_7:
    self->_ocrDispatchTimestamps.c.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      uint64_t v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    uint64_t v10 = self->_ocrDispatchTimestamps.c.__map_.__begin_;
    uint64_t v9 = self->_ocrDispatchTimestamps.c.__map_.__end_;
    if (v9 != v10) {
      self->_ocrDispatchTimestamps.c.__map_.__end_ = (double **)((char *)v9
    }
                                                               + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_ocrDispatchTimestamps.c.__map_.__first_;
  if (first) {
    operator delete(first);
  }
  objc_storeStrong((id *)&self->_debuggingMemoryResult, 0);
  objc_storeStrong((id *)&self->_debuggingResult, 0);
  objc_storeStrong((id *)&self->_optFlowSession, 0);
  objc_storeStrong((id *)&self->_ocrQueue, 0);
  objc_storeStrong((id *)&self->_latestResult, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  return self;
}

@end