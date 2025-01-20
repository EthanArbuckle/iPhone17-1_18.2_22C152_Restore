@interface VGFaceFittingFrameSelector
+ (vector<float)getFaceKitTrackedLandmarks:()(ext_vector_type(2;
- (BOOL)startFaceExpressionCapture:(unint64_t)a3;
- (CGRect)getValidDataFrameBounds:(id)a3;
- (FrameRejectionState)checkMotionBlurFilter:(SEL)a3 frameTimestampMS:(id)a4;
- (VGFaceFittingFrameSelector)initWithOptions:(id)a3 faceKitSemantics:(__CFDictionary *)a4;
- (id).cxx_construct;
- (id)_currentState;
- (id)addPoseWithCaptureData:(id)a3 tracking:(id)a4 externalTracking:(BOOL)a5 metricsData:(void *)a6;
- (id)allPoseSelectors;
- (id)enrolledPoses;
- (id)expressionSelectors;
- (id)finish;
- (id)neutralSelectors;
- (id)posesFromSelectors:(id)a3;
- (void)addPoseWithCaptureData:tracking:externalTracking:metricsData:;
- (void)checkDistanceFilter:(float32x4_t)a3@<Q3> frameTimestampMS:;
@end

@implementation VGFaceFittingFrameSelector

- (id)allPoseSelectors
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(VGFaceFittingFrameSelector *)self neutralSelectors];
  [v3 addObjectsFromArray:v4];

  v5 = [(VGFaceFittingFrameSelector *)self expressionSelectors];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (id)neutralSelectors
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = v3;
  if (self->_poseSelector) {
    objc_msgSend(v3, "addObject:");
  }

  return v4;
}

- (id)expressionSelectors
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableDictionary count](self->_expressionsSelector, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_expressionsSelector;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = -[NSMutableDictionary objectForKey:](self->_expressionsSelector, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

+ (vector<float)getFaceKitTrackedLandmarks:()(ext_vector_type(2
{
  v4 = v3;
  id v5 = a3;
  uint64_t v6 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetFaceKitTrackedLandmarks", (const char *)&unk_260D385D9, v16, 2u);
  }

  v7 = [v5 objectForKeyedSubscript:@"smooth_data"];
  v8 = [v7 objectForKeyedSubscript:@"geometry"];
  v9 = [v8 objectForKeyedSubscript:@"landmarks"];
  unint64_t v10 = [v9 length];
  id v11 = v9;
  uint64_t v12 = [v11 bytes];
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(v4, v10 >> 3);
  if (v10 >= 8)
  {
    uint64_t v13 = 0;
    if (v10 >> 3 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v10 >> 3;
    }
    do
    {
      *(void *)(*v4 + 8 * v13) = *(void *)(v12 + 8 * v13);
      ++v13;
    }
    while (v14 != v13);
  }

  __57__VGFaceFittingFrameSelector_getFaceKitTrackedLandmarks___block_invoke();
  return v15;
}

void __57__VGFaceFittingFrameSelector_getFaceKitTrackedLandmarks___block_invoke()
{
  v0 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetFaceKitTrackedLandmarks", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (void)checkDistanceFilter:(float32x4_t)a3@<Q3> frameTimestampMS:
{
  id v5 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CheckDistanceFilter", (const char *)&unk_260D385D9, buf, 2u);
  }

  if ([*(id *)(a1 + 48) useSimpleSelector]) {
    goto LABEL_4;
  }
  [*(id *)(a1 + 48) distanceFilterCloseThreshold];
  float v6 = vmuls_lane_f32(0.1, a3, 2);
  v7 = *(void **)(a1 + 48);
  if (v6 < v8)
  {
    [v7 distanceFilterCloseThreshold];
    float v10 = v9;
    *(_DWORD *)a2 = 26;
    id v11 = NSString;
    [*(id *)(a1 + 48) distanceFilterCloseThreshold];
    uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", @"face too close: %g cm < %g cm", v6, v12);
LABEL_9:
    *(void *)(a2 + 8) = v13;
    *(_DWORD *)(a2 + 16) = 0;
    *(float *)(a2 + 20) = vabds_f32(v6, v10);
    *(void *)(a2 + 24) = 0;
    goto LABEL_10;
  }
  [v7 distanceFilterFarThreshold];
  if (v6 > v14)
  {
    [*(id *)(a1 + 48) distanceFilterFarThreshold];
    float v10 = v15;
    *(_DWORD *)a2 = 27;
    v16 = NSString;
    [*(id *)(a1 + 48) distanceFilterFarThreshold];
    uint64_t v13 = objc_msgSend(v16, "stringWithFormat:", @"face too far: %g cm > %g cm", v6, v17);
    goto LABEL_9;
  }
LABEL_4:
  *(_DWORD *)a2 = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 8) = 0;
LABEL_10:
  __67__VGFaceFittingFrameSelector_checkDistanceFilter_frameTimestampMS___block_invoke();
}

void __67__VGFaceFittingFrameSelector_checkDistanceFilter_frameTimestampMS___block_invoke()
{
  v0 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CheckDistanceFilter", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (FrameRejectionState)checkMotionBlurFilter:(SEL)a3 frameTimestampMS:(id)a4
{
  id v8 = a4;
  float v9 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v9))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CheckMotionBlurFilter", (const char *)&unk_260D385D9, (uint8_t *)&v17, 2u);
  }

  float v10 = objc_opt_class();
  if (v10)
  {
    [v10 getFaceKitTrackedLandmarks:v8];
    id v11 = v21;
    uint64_t v12 = (uint64_t)v22;
  }
  else
  {
    uint64_t v12 = 0;
    id v11 = 0;
    v21 = 0;
    v22 = 0;
    uint64_t v23 = 0;
  }
  unint64_t v17 = a5;
  __p = 0;
  v19 = 0;
  uint64_t v20 = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&__p, v11, v12, (v12 - (uint64_t)v11) >> 3);
  char v13 = vg::frame_selection::VGBlurDetector::detectMotionBlur((uint64_t *)self->_blurDetector.__ptr_.__value_, (uint64_t *)&v17);
  if (!v14)
  {
    retstr->reason = 7;
    float v15 = @"motion blur is initializing temporal state from this frame";
    goto LABEL_10;
  }
  if (v13)
  {
    retstr->reason = 6;
    float v15 = @"motion blur detected";
LABEL_10:
    *(void *)&retstr->outOfFovOffset = 0;
    retstr->debugDictionary = 0;
    retstr->description = &v15->isa;
    goto LABEL_12;
  }
  retstr->reason = 0;
  *(void *)&retstr->outOfFovOffset = 0;
  retstr->debugDictionary = 0;
  retstr->description = 0;
LABEL_12:
  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }
  if (v21)
  {
    v22 = v21;
    operator delete(v21);
  }
  __69__VGFaceFittingFrameSelector_checkMotionBlurFilter_frameTimestampMS___block_invoke();

  return result;
}

void __69__VGFaceFittingFrameSelector_checkMotionBlurFilter_frameTimestampMS___block_invoke()
{
  v0 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CheckMotionBlurFilter", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (CGRect)getValidDataFrameBounds:(id)a3
{
  id v3 = a3;
  v4 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetValidDataFrameBounds", (const char *)&unk_260D385D9, buf, 2u);
  }

  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v3 depth]);
  size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v3 depth]);
  int32x2_t v16 = (int32x2_t)getImageBBoxAboveThreshold((__CVBuffer *)[v3 depth], 0.015).n128_u64[0];
  int32x2_t v8 = v7;
  __54__VGFaceFittingFrameSelector_getValidDataFrameBounds___block_invoke();
  int32x2_t v9 = vsub_s32(v8, v16);
  double v10 = (float)((float)v9.i32[0] / (float)Width);
  double v11 = (float)((float)v9.i32[1] / (float)Height);

  double v12 = (float)((float)v16.i32[0] / (float)Width);
  double v13 = (float)((float)v16.i32[1] / (float)Height);
  double v14 = v10;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

void __54__VGFaceFittingFrameSelector_getValidDataFrameBounds___block_invoke()
{
  v0 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetValidDataFrameBounds", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (VGFaceFittingFrameSelector)initWithOptions:(id)a3 faceKitSemantics:(__CFDictionary *)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VGFaceFittingFrameSelector;
  v37 = [(VGFaceFittingFrameSelector *)&v38 init];
  if (v37)
  {
    if (a4)
    {
      CFRetain(a4);
      facekitSemantics = v37->_facekitSemantics;
      v37->_facekitSemantics = (NSDictionary *)a4;
    }
    v36 = +[VGFrameSelectorOptions optionsWithCaptureOptions:v6];
    int32x2_t v8 = [[VGFrameSelector alloc] initWithOptions:v36];
    poseSelector = v37->_poseSelector;
    v37->_poseSelector = v8;

    double v10 = (void *)MEMORY[0x263EFF9A0];
    double v11 = [v6 requiredExpressions];
    uint64_t v12 = objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    expressionsSelector = v37->_expressionsSelector;
    v37->_expressionsSelector = (NSMutableDictionary *)v12;

    for (unint64_t i = 0; ; ++i)
    {
      double v15 = [v6 requiredExpressions];
      BOOL v16 = i < [v15 count];

      if (!v16) {
        break;
      }
      unint64_t v17 = [v6 requiredExpressions];
      v18 = [v17 objectAtIndex:i];
      int v19 = [v18 intValue];

      uint64_t v20 = v19;
      v21 = objc_opt_new();
      v22 = objc_opt_new();
      [v22 setYawFrameCount:1];
      LODWORD(v23) = 1057360530;
      [v22 setYawLimit:v23];
      v41[0] = v21;
      v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
      [v22 setYawExpressionFilters:v24];

      v25 = [[VGFrameSelector alloc] initWithOptions:v22];
      v26 = v37->_expressionsSelector;
      v27 = [NSNumber numberWithUnsignedInteger:v20];
      [(NSMutableDictionary *)v26 setObject:v25 forKeyedSubscript:v27];
    }
    v37->_frameCount = 0;
    p_options = (id *)&v37->_options;
    objc_storeStrong((id *)&v37->_options, a3);
    trackedFaceIdentifier = v37->_trackedFaceIdentifier;
    v37->_trackedFaceIdentifier = 0;

    if ([(VGFaceCaptureOptions *)v37->_options useMotionBlurFilter])
    {
      *(_DWORD *)buf = 1106247680;
      [*p_options motionBlurThreshold];
      LODWORD(v40) = v30;
      BYTE4(v40) = 0;
      vg::frame_selection::VGBlurDetector::create();
    }
    v31 = __VGLogSharedInstance();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      id v32 = *p_options;
      *(_DWORD *)buf = 138412290;
      id v40 = v32;
      _os_log_impl(&dword_260C8D000, v31, OS_LOG_TYPE_DEBUG, " Initialized FaceFittingSelector with face capture options:\n%@ ", buf, 0xCu);
    }

    v33 = v37;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (BOOL)startFaceExpressionCapture:(unint64_t)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  [v6 setYawFrameCount:1];
  LODWORD(v7) = 1057360530;
  [v6 setYawLimit:v7];
  v13[0] = v5;
  int32x2_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v6 setYawExpressionFilters:v8];

  int32x2_t v9 = [[VGFrameSelector alloc] initWithOptions:v6];
  expressionsSelector = self->_expressionsSelector;
  double v11 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)expressionsSelector setObject:v9 forKeyedSubscript:v11];

  return 1;
}

- (id)_currentState
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = [(VGFaceFittingFrameSelector *)self allPoseSelectors];
  unint64_t v2 = 0;
  uint64_t v3 = 0;
  uint64_t v4 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v55 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v3 += [v7 remainingPosesCount];
        v2 += [v7 requiredPosesCount];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v4);
  }

  obja = objc_alloc_init(VGFaceSelectionState);
  [(VGSelectionState *)obja setFailed:v2 == 0];
  if (![(VGSelectionState *)obja failed])
  {
    [(VGSelectionState *)obja setCompleted:v3 == 0];
    if (v2)
    {
      *(float *)&double v8 = (float)(v2 - v3) / (float)v2;
      [(VGSelectionState *)obja setProgress:v8];
    }
    int32x2_t v9 = [(VGFrameSelector *)self->_poseSelector yawResults];
    [(VGFaceSelectionState *)obja setYawAngleCapturedPoses:v9];

    double v10 = [(VGFrameSelector *)self->_poseSelector pitchResults];
    [(VGFaceSelectionState *)obja setPitchAngleCapturedPoses:v10];

    double v11 = [(VGFrameSelector *)self->_poseSelector yawResults];
    [(VGFaceSelectionState *)obja setPosesForHairCapturedPoses:v11];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    poseSelector = self->_poseSelector;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&poseSelector count:1];
    double v13 = [(VGFaceFittingFrameSelector *)self posesFromSelectors:v12];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v67 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v51;
      while (2)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(v13);
          }
          unint64_t v17 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          if ([v17 frontPose])
          {
            [(VGFaceSelectionState *)obja setCapturedFrontPose:v17];
            goto LABEL_21;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v67 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    v18 = [MEMORY[0x263EFF9A0] dictionary];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v36 = self->_expressionsSelector;
    uint64_t v19 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v46 objects:v65 count:16];
    if (v19)
    {
      uint64_t v37 = *(void *)v47;
      do
      {
        uint64_t v38 = v19;
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v47 != v37) {
            objc_enumerationMutation(v36);
          }
          uint64_t v21 = *(void *)(*((void *)&v46 + 1) + 8 * k);
          v22 = [(NSMutableDictionary *)self->_expressionsSelector objectForKey:v21];
          double v23 = [v22 results];

          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v64 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v43;
            do
            {
              for (uint64_t m = 0; m != v25; ++m)
              {
                if (*(void *)v43 != v26) {
                  objc_enumerationMutation(v24);
                }
                v28 = [v24 objectForKey:*(void *)(*((void *)&v42 + 1) + 8 * m)];
                [v18 setObject:v28 forKeyedSubscript:v21];
              }
              uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v64 count:16];
            }
            while (v25);
          }
        }
        uint64_t v19 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v46 objects:v65 count:16];
      }
      while (v19);
    }

    [(VGFaceSelectionState *)obja setExpressionCapturedPoses:v18];
    [(VGFaceSelectionState *)obja setCompletionScore:0.0];
    v29 = [(VGFaceSelectionState *)obja capturedFrontPose];
    BOOL v30 = v29 == 0;

    if (!v30)
    {
      LODWORD(v31) = 0.25;
      [(VGFaceSelectionState *)obja setCompletionScore:v31];
      float v33 = 1.0;
      if ([(VGFrameSelector *)self->_poseSelector completed]
        || (float v33 = 0.5, [(VGFrameSelector *)self->_poseSelector completedYaw])
        || [(VGFrameSelector *)self->_poseSelector completedPitch])
      {
        *(float *)&double v32 = v33;
        [(VGFaceSelectionState *)obja setCompletionScore:v32];
      }
    }
  }
  v34 = __VGLogSharedInstance();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v59 = v3;
    __int16 v60 = 2048;
    unint64_t v61 = v2;
    __int16 v62 = 2112;
    v63 = obja;
    _os_log_impl(&dword_260C8D000, v34, OS_LOG_TYPE_DEBUG, " %lu/%lu %@ ", buf, 0x20u);
  }

  return obja;
}

- (id)addPoseWithCaptureData:(id)a3 tracking:(id)a4 externalTracking:(BOOL)a5 metricsData:(void *)a6
{
  uint64_t v168 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v104 = a4;
  double v11 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AddPoseWithCaptureData", (const char *)&unk_260D385D9, buf, 2u);
  }

  ++self->_frameCount;
  if (v10) {
    [v10 timestamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  double v13 = [(VGFaceFittingFrameSelector *)self _currentState];
  unint64_t v14 = (unint64_t)(Seconds * 1000.0);
  v156[0] = a6;
  v156[1] = v14;
  uint64_t v15 = self;
  if ([v13 failed])
  {
    int v152 = 1;
    uint64_t v155 = 0;
    v153 = @"enrollment failed";
    uint64_t v154 = 0;
    -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v152);
    if ([(VGFaceCaptureOptions *)v15->_options useMotionBlurFilter]) {
      vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
    }
    goto LABEL_27;
  }
  if (!a5)
  {
    unint64_t frameCount = self->_frameCount;
    if (frameCount <= 0x32)
    {
      int v148 = 10;
      objc_msgSend(NSString, "stringWithFormat:", @"not ready [%lu / %lu]", frameCount, 50);
      uint64_t v149 = v151 = 0;
      uint64_t v150 = 0;
      -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v148);
LABEL_27:
      id v26 = v13;
      goto LABEL_112;
    }
  }
  if (!v104)
  {
    int v144 = 2;
    uint64_t v147 = 0;
    v145 = @"no tracking data";
    uint64_t v146 = 0;
    -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v144);
    if ([(VGFaceCaptureOptions *)v15->_options useMotionBlurFilter]) {
      vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
    }
    goto LABEL_27;
  }
  v100 = [v104 objectForKeyedSubscript:@"tracked_faces"];
  if (!v100 || ![v100 count])
  {
    int v140 = 3;
    uint64_t v143 = 0;
    v141 = @"no tracked face";
    uint64_t v142 = 0;
    -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v140);
    if ([(VGFaceCaptureOptions *)v15->_options useMotionBlurFilter]) {
      vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
    }
    id v26 = v13;
    goto LABEL_111;
  }
  v98 = [v100 objectAtIndexedSubscript:0];
  if (!v98)
  {
    int v136 = 3;
    uint64_t v139 = 0;
    v137 = @"null tracked face";
    uint64_t v138 = 0;
    -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v136);
    if ([(VGFaceCaptureOptions *)v15->_options useMotionBlurFilter]) {
      vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
    }
    id v26 = v13;
    goto LABEL_110;
  }
  if ([(VGFaceCaptureOptions *)v15->_options useAmbientLightFilter])
  {
    unint64_t v17 = [v98 objectForKeyedSubscript:@"vg_ambient_light"];
    v18 = v17;
    if (v17)
    {
      [v17 floatValue];
      float v20 = v19;
      [(VGFaceCaptureOptions *)v15->_options ambientLightFilterLowThreshold];
      if (v20 < v21)
      {
        int v132 = 5;
        v22 = NSString;
        [v18 floatValue];
        float v24 = v23;
        [(VGFaceCaptureOptions *)v15->_options ambientLightFilterLowThreshold];
        objc_msgSend(v22, "stringWithFormat:", @"low ambient light [%g < %g]", v24, v25);
        uint64_t v134 = 0;
        uint64_t v133 = v135 = 0;
        -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v132);
        if ([(VGFaceCaptureOptions *)v15->_options useMotionBlurFilter]) {
          vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
        }
        id v26 = v13;

        goto LABEL_110;
      }
    }
  }
  if ([(VGFaceCaptureOptions *)v15->_options useTrackedFaceIdentifierFilter])
  {
    v27 = [v98 objectForKeyedSubscript:@"identifier"];
    v28 = v27;
    if (v27)
    {
      if (v15->_trackedFaceIdentifier)
      {
        if ((objc_msgSend(v27, "isEqualToString:") & 1) == 0)
        {
          int v128 = 4;
          [NSString stringWithFormat:@"tracked face changed [%@ != %@]", v28, v15->_trackedFaceIdentifier];
          uint64_t v130 = 0;
          uint64_t v129 = v131 = 0;
          -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v128);
          if ([(VGFaceCaptureOptions *)v15->_options useMotionBlurFilter]) {
            vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
          }
          id v26 = v13;

          goto LABEL_110;
        }
      }
      else
      {
        objc_storeStrong((id *)&v15->_trackedFaceIdentifier, v27);
      }
    }
  }
  v29 = [v98 objectForKeyedSubscript:@"confidence"];
  [v29 floatValue];
  if (v30 < 0.95)
  {
    int v124 = 8;
    double v31 = NSString;
    [v29 floatValue];
    objc_msgSend(v31, "stringWithFormat:", @"low confidence [%g < %g]", v32, 0x3FEE666660000000);
    uint64_t v126 = 0;
    uint64_t v125 = v127 = 0;
    -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v124);
    if ([(VGFaceCaptureOptions *)v15->_options useMotionBlurFilter]) {
      vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
    }
    id v26 = v13;
    goto LABEL_109;
  }
  v96 = v29;
  if (![(VGFaceCaptureOptions *)v15->_options useMotionBlurFilter])
  {
LABEL_49:
    float32x4_t v33 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
    float32x4_t v34 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
    float32x4_t v35 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
    float32x4_t v116 = *(float32x4_t *)MEMORY[0x263EF89A8];
    float32x4_t v117 = v33;
    float32x4_t v118 = v34;
    float32x4_t v119 = v35;
    v92 = [v98 objectForKeyedSubscript:@"smooth_data"];
    v97 = [v92 objectForKeyedSubscript:@"pose"];
    v99 = [v97 objectForKeyedSubscript:@"rotation"];
    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v37 = [v99 objectAtIndex:i];
      for (uint64_t j = 0; j != 3; ++j)
      {
        v39 = [v37 objectAtIndex:j];
        [v39 floatValue];
        v116.i32[4 * j + i] = v40;
      }
    }
    v41 = [v97 objectForKeyedSubscript:@"translation"];
    uint64_t v42 = 0;
    float32x4_t v101 = v119;
    do
    {
      long long v43 = [v41 objectAtIndexedSubscript:v42];
      [v43 floatValue];
      float32x4_t v105 = v101;
      *(_DWORD *)((unint64_t)&v105 & 0xFFFFFFFFFFFFFFF3 | (4 * (v42 & 3))) = v44;
      float32x4_t v101 = v105;

      ++v42;
    }
    while (v42 != 3);
    float32x4_t v119 = v101;
    {
      -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::kRotateBy180AroundX = xmmword_260D21CB0;
      unk_26A8E4760 = xmmword_260D21CC0;
      xmmword_26A8E4770 = xmmword_260D21CD0;
      unk_26A8E4780 = xmmword_260D21CE0;
    }
    uint64_t v45 = 0;
    float32x4_t v46 = v116;
    float32x4_t v47 = v117;
    float32x4_t v48 = v118;
    float32x4_t v49 = v119;
    *(_OWORD *)v165 = -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::kRotateBy180AroundX;
    *(_OWORD *)&v165[16] = unk_26A8E4760;
    long long v166 = xmmword_26A8E4770;
    long long v167 = unk_26A8E4780;
    do
    {
      *(float32x4_t *)&buf[v45] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(_OWORD *)&v165[v45])), v47, *(float32x2_t *)&v165[v45], 1), v48, *(float32x4_t *)&v165[v45], 2), v49, *(float32x4_t *)&v165[v45], 3);
      v45 += 16;
    }
    while (v45 != 64);
    double v102 = *(double *)buf;
    double v94 = *(double *)&v161;
    double v95 = v159;
    double v93 = *(double *)&v162;
    buf[0] = 0;
    LOBYTE(v161) = 0;
    if ([(VGFaceCaptureOptions *)v15->_options useDepthFovFilter])
    {
      [(VGFaceFittingFrameSelector *)v15 getValidDataFrameBounds:v10];
      *(void *)buf = v50;
      *(void *)&buf[8] = v51;
      double v159 = v52;
      id v160 = v53;
      if (!(_BYTE)v161) {
        LOBYTE(v161) = 1;
      }
    }
    if ([(VGFaceCaptureOptions *)v15->_options useDistanceFilter])
    {
      -[VGFaceFittingFrameSelector checkDistanceFilter:frameTimestampMS:](v15, "checkDistanceFilter:frameTimestampMS:", v14, v102, v95, v94, v93);
      if (*(_DWORD *)v165)
      {
        int v112 = *(_DWORD *)v165;
        id v113 = *(id *)&v165[8];
        uint64_t v114 = *(void *)&v165[16];
        id v115 = *(id *)&v165[24];
        -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v112);
        id v26 = v13;

LABEL_107:
        goto LABEL_108;
      }
    }
    long long v54 = -[VGFrameSelector processCaptureData:trackingData:framePose:validDataFrameBounds:](v15->_poseSelector, "processCaptureData:trackingData:framePose:validDataFrameBounds:", v10, v104, buf, v102, v95, v94, v93);
    v103 = v54;
    if ([v54 isSuccessful])
    {
      if (a6)
      {
        int v55 = [v54 motionType];
        uint64_t v111 = [v54 targetAngleId];
        *(void *)v165 = &v111;
        long long v56 = std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t **)a6 + 3 * v55 + 44, (unint64_t *)&v111, (uint64_t)&std::piecewise_construct, (uint64_t **)v165);
        if (!v56[5])
        {
          __uint64_t v57 = vg::shared::Time((vg::shared *)v56);
          uint64_t v111 = [v54 targetAngleId];
          *(void *)v165 = &v111;
          std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t **)a6 + 3 * v55 + 55, (unint64_t *)&v111, (uint64_t)&std::piecewise_construct, (uint64_t **)v165)[5] = v57;
        }
        uint64_t v111 = [v54 targetAngleId];
        *(void *)v165 = &v111;
        v58 = std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t **)a6 + 3 * v55 + 44, (unint64_t *)&v111, (uint64_t)&std::piecewise_construct, (uint64_t **)v165);
        ++v58[5];
      }
      uint64_t v59 = [(VGFaceFittingFrameSelector *)v15 _currentState];

      double v13 = (void *)v59;
    }
    if (v54) {
      [v54 rejectionState];
    }
    else {
      memset(v110, 0, sizeof(v110));
    }
    -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, (int *)v110);
    objc_msgSend(v13, "setPoseIndex:", objc_msgSend(v54, "poseIndex"));
    [v54 yawInDegrees];
    objc_msgSend(v13, "setYawAngle:");
    [v54 pitchInDegrees];
    objc_msgSend(v13, "setPitchAngle:");
    int v60 = [v54 motionType];
    if (v60)
    {
      unint64_t v61 = 0;
    }
    else
    {
      __int16 v62 = NSNumber;
      [v54 angleInDegrees];
      unint64_t v61 = objc_msgSend(v62, "numberWithFloat:");
    }
    [v13 setYawTargetAngle:v61];
    if (!v60) {

    }
    int v63 = [v54 motionType];
    if (v63 == 1)
    {
      v64 = NSNumber;
      [v54 angleInDegrees];
      v65 = objc_msgSend(v64, "numberWithFloat:");
    }
    else
    {
      v65 = 0;
    }
    [v13 setPitchTargetAngle:v65];
    if (v63 == 1) {

    }
    v66 = [v54 debugData];
    [v13 setDebugData:v66];

    v67 = [v54 bodyPoseFrameState];
    [v13 setBodyPoseFrameState:v67];

    v68 = [v13 yawTargetAngle];
    if (v68)
    {
      uint64_t v69 = [v13 yawAngleCapturedPoses];
      v70 = [v13 yawTargetAngle];
      v71 = [v69 objectForKey:v70];
      BOOL v72 = v71 == 0;

      if (v72)
      {
        v73 = __VGLogSharedInstance();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          v74 = [v13 yawTargetAngle];
          *(_DWORD *)v165 = 134218242;
          *(void *)&v165[4] = v14;
          *(_WORD *)&v165[12] = 2112;
          *(void *)&v165[14] = v74;
          _os_log_impl(&dword_260C8D000, v73, OS_LOG_TYPE_DEBUG, " Frame#%zu reported target angle %@ (yaw) through selection state is not present in keys of yaw captured poses dictionary ", v165, 0x16u);
        }
      }
    }
    v75 = [v13 pitchTargetAngle];
    if (v75)
    {
      v76 = [v13 pitchAngleCapturedPoses];
      v77 = [v13 pitchTargetAngle];
      v78 = [v76 objectForKey:v77];
      BOOL v79 = v78 == 0;

      if (v79)
      {
        v80 = __VGLogSharedInstance();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          v81 = [v13 pitchTargetAngle];
          *(_DWORD *)v165 = 134218242;
          *(void *)&v165[4] = v14;
          *(_WORD *)&v165[12] = 2112;
          *(void *)&v165[14] = v81;
          _os_log_impl(&dword_260C8D000, v80, OS_LOG_TYPE_DEBUG, " Frame#%zu reported target angle %@ (pitch) through selection state is not present in keys of pitch captured poses dictionary ", v165, 0x16u);
        }
      }
    }
    v82 = [(VGFaceFittingFrameSelector *)v15 allPoseSelectors];
    v83 = [(VGFaceFittingFrameSelector *)v15 posesFromSelectors:v82];
    [v13 setTronPoses:v83];

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    poseSelector = v15->_poseSelector;
    v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:&poseSelector count:1];
    v85 = [(VGFaceFittingFrameSelector *)v15 posesFromSelectors:v84];

    uint64_t v86 = [v85 countByEnumeratingWithState:&v106 objects:v164 count:16];
    if (v86)
    {
      uint64_t v87 = *(void *)v107;
      while (2)
      {
        for (uint64_t k = 0; k != v86; ++k)
        {
          if (*(void *)v107 != v87) {
            objc_enumerationMutation(v85);
          }
          v89 = *(void **)(*((void *)&v106 + 1) + 8 * k);
          if ([v89 frontPose])
          {
            [v13 setCapturedFrontPose:v89];
            v90 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v89, 0);
            [v13 setHairPoses:v90];

            goto LABEL_104;
          }
        }
        uint64_t v86 = [v85 countByEnumeratingWithState:&v106 objects:v164 count:16];
        if (v86) {
          continue;
        }
        break;
      }
    }
LABEL_104:

    if ([v13 completed]) {
      v15->_selectionCompleted = 1;
    }
    id v26 = v13;

    goto LABEL_107;
  }
  [(VGFaceFittingFrameSelector *)v15 checkMotionBlurFilter:v98 frameTimestampMS:v14];
  if (!*(_DWORD *)buf)
  {

    goto LABEL_49;
  }
  int v120 = *(_DWORD *)buf;
  id v121 = *(id *)&buf[8];
  double v122 = v159;
  id v123 = v160;
  -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v156, v13, &v120);
  id v26 = v13;

LABEL_108:
  v29 = v96;
LABEL_109:

LABEL_110:
LABEL_111:

LABEL_112:
  __91__VGFaceFittingFrameSelector_addPoseWithCaptureData_tracking_externalTracking_metricsData___block_invoke();

  return v26;
}

void __91__VGFaceFittingFrameSelector_addPoseWithCaptureData_tracking_externalTracking_metricsData___block_invoke()
{
  v0 = VGLogVGFaceFittingFrameSelector();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AddPoseWithCaptureData", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (void)addPoseWithCaptureData:tracking:externalTracking:metricsData:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (*a1)
  {
    uint64_t v6 = *a1 + 8 * *a3;
    ++*(void *)(v6 + 16);
  }
  double v7 = [VGFrameRejectionState alloc];
  int v17 = *a3;
  id v8 = *((id *)a3 + 1);
  uint64_t v9 = *((void *)a3 + 2);
  id v10 = (void *)*((void *)a3 + 3);
  id v18 = v8;
  uint64_t v19 = v9;
  id v11 = v10;
  id v20 = v11;
  if (v7)
  {
    double v7 = [(VGFrameRejectionState *)v7 initFromInternalRejectionState:&v17];
  }
  else
  {
  }
  [v5 setRejectionState:v7];

  uint64_t v12 = __VGLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = a1[1];
    vg::frame_selection::frameRejectionReasonToString(*a3, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    uint64_t v15 = *((void *)a3 + 1);
    *(_DWORD *)buf = 134218498;
    uint64_t v22 = v13;
    __int16 v23 = 2080;
    float v24 = p_p;
    __int16 v25 = 2112;
    uint64_t v26 = v15;
    _os_log_impl(&dword_260C8D000, v12, OS_LOG_TYPE_DEBUG, " Frame#%zu rejection state: %s description: %@ ", buf, 0x20u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

- (id)posesFromSelectors:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "array", v3);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    uint64_t v22 = *(void *)v35;
    do
    {
      uint64_t v23 = v5;
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v8 = [v7 yawResults];
        uint64_t v9 = [v7 pitchResults];
        __int16 v25 = [v8 keysSortedByValueUsingComparator:&__block_literal_global_311];
        float v24 = [v9 keysSortedByValueUsingComparator:&__block_literal_global_313];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v10 = v25;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v10);
              }
              unint64_t v14 = [v8 objectForKey:*(void *)(*((void *)&v30 + 1) + 8 * j)];
              [v4 addObject:v14];
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v11);
        }

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = v24;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v27;
          do
          {
            for (uint64_t k = 0; k != v16; ++k)
            {
              if (*(void *)v27 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v19 = [v9 objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * k)];
              [v4 addObject:v19];
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }
          while (v16);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v5);
  }

  return v4;
}

uint64_t __49__VGFaceFittingFrameSelector_posesFromSelectors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = NSNumber;
  [v4 selectedAngle];
  double v7 = objc_msgSend(v6, "numberWithFloat:");
  id v8 = NSNumber;
  [v5 selectedAngle];
  uint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
  uint64_t v10 = [v7 compare:v9];

  return v10;
}

uint64_t __49__VGFaceFittingFrameSelector_posesFromSelectors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = NSNumber;
  [v4 selectedAngle];
  double v7 = objc_msgSend(v6, "numberWithFloat:");
  id v8 = NSNumber;
  [v5 selectedAngle];
  uint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
  uint64_t v10 = [v7 compare:v9];

  return v10;
}

- (id)enrolledPoses
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(VGFrameSelector *)self->_poseSelector completedYaw])
  {
    id v4 = [(VGFrameSelector *)self->_poseSelector selectedYawValidPoses];
    id v5 = [v4 allValues];
    [v3 addObjectsFromArray:v5];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v6 = [(VGFrameSelector *)self->_poseSelector selectedYawValidPoses];
    double v7 = [v6 allValues];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v11 frontPose]) {
            [v3 addObject:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  if ([(VGFrameSelector *)self->_poseSelector completedPitch])
  {
    uint64_t v12 = [(VGFrameSelector *)self->_poseSelector selectedPitchValidPoses];
    uint64_t v13 = [v12 allValues];
    [v3 addObjectsFromArray:v13];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "setTrackingData:", self->_facekitSemantics, (void)v19);
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  return v14;
}

- (id)finish
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_selectionCompleted)
  {
    id v3 = [(VGFaceFittingFrameSelector *)self neutralSelectors];
    id v4 = [(VGFaceFittingFrameSelector *)self posesFromSelectors:v3];

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "setTrackingData:", self->_facekitSemantics, (void)v10);
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v5 = [(VGFaceFittingFrameSelector *)self enrolledPoses];
  }

  return v5;
}

- (void).cxx_destruct
{
  std::unique_ptr<vg::frame_selection::VGBlurDetector>::reset[abi:ne180100]((vg::frame_selection::VGBlurDetector **)&self->_blurDetector, 0);
  objc_storeStrong((id *)&self->_trackedFaceIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_facekitSemantics, 0);
  objc_storeStrong((id *)&self->_expressionsSelector, 0);

  objc_storeStrong((id *)&self->_poseSelector, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  return self;
}

@end