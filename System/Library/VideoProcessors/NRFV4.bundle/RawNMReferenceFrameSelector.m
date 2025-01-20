@interface RawNMReferenceFrameSelector
+ (id)compareFramesA:(id)a3 frameB:(id)a4 usingTuningParams:(id)a5;
+ (int)prewarmShaders:(id)a3;
- (NSMutableArray)framesAwaitingFusion;
- (NSMutableDictionary)sidecarMetadata;
- (RawNMReferenceFrameSelector)initWithMetal:(id)a3;
- (RawNightModeInputFrame)referenceFrame;
- (int)addFrame:(id)a3 forMode:(int)a4 usingTuningParams:(id)a5;
- (int)analyseNewFrame:(id)a3 frameIndex:(int)a4 usingTuningParams:(id)a5;
- (int)forceSelection;
- (int)legacyAnalyseNewFrame:(id)a3 frameIndex:(int)a4;
- (int)referenceFrameCandidatesCount;
- (int)referenceFrameIndex;
- (int)reset;
- (int)status;
- (void)setFramesAwaitingFusion:(id)a3;
- (void)setReferenceFrameCandidatesCount:(int)a3;
- (void)setReferenceFrameIndex:(int)a3;
@end

@implementation RawNMReferenceFrameSelector

+ (int)prewarmShaders:(id)a3
{
  return 0;
}

- (RawNMReferenceFrameSelector)initWithMetal:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RawNMReferenceFrameSelector;
  v6 = [(RawNMReferenceFrameSelector *)&v10 init];
  v7 = v6;
  if (!v6)
  {
    FigSignalErrorAt();
LABEL_7:
    v8 = 0;
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  if ([(RawNMReferenceFrameSelector *)v7 reset])
  {
    FigDebugAssert3();
    goto LABEL_7;
  }
  v8 = v7;
LABEL_4:

  return v8;
}

- (int)reset
{
  self->_frameIndexCounter = 0;
  self->_status = 1;
  currentBestFrame = self->_currentBestFrame;
  self->_currentBestFrame = 0;

  self->_currentBestFrameIndex = 0;
  self->_maxFocusScore = 0.0;
  self->_shortestExposureTime = 3.4028e38;
  referenceFrame = self->_referenceFrame;
  self->_referenceFrame = 0;

  *(void *)&self->_referenceFrameIndex = -1;
  id v5 = (NSMutableDictionary *)objc_opt_new();
  sidecarMetadata = self->_sidecarMetadata;
  self->_sidecarMetadata = v5;

  return 0;
}

+ (id)compareFramesA:(id)a3 frameB:(id)a4 usingTuningParams:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 normalisedFaceSharpness];
  float v11 = v10;
  [v8 normalisedFaceSharpness];
  float v13 = v12;
  if (v11 > v12) {
    float v12 = v11;
  }
  float v14 = 0.0;
  BOOL v15 = v12 <= 0.0;
  float v16 = vabds_f32(v11, v13) / v12;
  if (v15) {
    float v17 = 0.0;
  }
  else {
    float v17 = v16;
  }
  v18 = [v9 objectForKeyedSubscript:@"ReferenceFrameSelection"];

  LODWORD(v19) = 1008981770;
  objc_msgSend(v18, "cmi_floatValueForKey:defaultValue:found:", @"FaceSharpnessEquivalencePercentage", 0, v19);
  float v21 = v20;
  if (v11 <= v13) {
    v22 = v8;
  }
  else {
    v22 = v7;
  }
  id v23 = v22;
  v24 = v23;
  if (v17 <= v21)
  {
    [v7 normalisedGlobalSharpness];
    float v26 = v25;
    [v8 normalisedGlobalSharpness];
    float v28 = *(float *)&v27;
    if (v26 <= *(float *)&v27) {
      float v29 = *(float *)&v27;
    }
    else {
      float v29 = v26;
    }
    float v30 = vabds_f32(v26, *(float *)&v27) / v29;
    if (v29 > 0.0) {
      float v14 = v30;
    }
    LODWORD(v27) = 1028443341;
    objc_msgSend(v18, "cmi_floatValueForKey:defaultValue:found:", @"GlobalSharpnessEquivalencePercentage", 0, v27);
    float v32 = v31;
    [v24 normalisedFaceSharpness];
    if (v33 <= 0.0 || (id v23 = v24, v29 > 0.0) && (id v23 = v24, v14 >= v32))
    {
      if (v26 <= v28) {
        id v23 = v8;
      }
      else {
        id v23 = v7;
      }
    }
  }
  id v34 = v23;

  return v34;
}

- (int)legacyAnalyseNewFrame:(id)a3 frameIndex:(int)a4
{
  id v7 = a3;
  id v8 = -[RawNightModeInputFrame properties]((uint64_t)v7);
  id v9 = [v8 meta];
  float v10 = *(float *)([v9 exposureParams] + 52);

  float shortestExposureTime = self->_shortestExposureTime;
  if (v10 > (float)(shortestExposureTime + 0.0001))
  {
    float v14 = 0;
    double v19 = 0;
  }
  else
  {
    float v12 = shortestExposureTime + -0.0001;
    if (v10 < (float)(shortestExposureTime + -0.0001)) {
      self->_float shortestExposureTime = v10;
    }
    float v13 = -[RawNightModeInputFrame metadata]((uint64_t)v7);
    float v14 = v13;
    if (!v13)
    {
      FigDebugAssert3();
      int v26 = FigSignalErrorAt();
      double v19 = 0;
      goto LABEL_15;
    }
    BOOL v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F2F378]];
    [v15 doubleValue];
    double v17 = v16;

    v18 = [v14 objectForKeyedSubscript:@"SharpnessScore"];
    double v19 = v18;
    if (v18)
    {
      float v20 = [v18 objectForKeyedSubscript:@"ImageScore"];
      [v20 doubleValue];
      double v17 = v21;
      v22 = [v19 objectForKeyedSubscript:@"FaceScores"];
      if ([v22 count])
      {
        id v23 = [v22 objectAtIndex:0];
        [v23 doubleValue];
        double v17 = v24;
      }
    }
    if (v10 < v12 || v17 > self->_maxFocusScore)
    {
      self->_maxFocusScore = v17;
      objc_storeStrong((id *)&self->_currentBestFrame, a3);
      self->_currentBestFrameIndex = a4;
      objc_storeStrong((id *)&self->_referenceFrame, self->_currentBestFrame);
    }
  }
  int v26 = 0;
LABEL_15:

  return v26;
}

- (int)analyseNewFrame:(id)a3 frameIndex:(int)a4 usingTuningParams:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  float v11 = -[RawNightModeInputFrame properties]((uint64_t)v9);
  float v12 = [v11 meta];
  float v13 = *(float *)([v12 exposureParams] + 52);

  float shortestExposureTime = self->_shortestExposureTime;
  if (v13 > (float)(shortestExposureTime + 0.0001))
  {
    double v17 = 0;
  }
  else
  {
    float v15 = shortestExposureTime + -0.0001;
    if (v13 < (float)(shortestExposureTime + -0.0001)) {
      self->_float shortestExposureTime = v13;
    }
    double v16 = +[RawNMReferenceFrameSelector compareFramesA:self->_currentBestFrame frameB:v9 usingTuningParams:v10];
    double v17 = v16;
    if (v13 < v15 || v16 != self->_currentBestFrame)
    {
      objc_storeStrong((id *)&self->_currentBestFrame, a3);
      self->_currentBestFrameIndex = a4;
      objc_storeStrong((id *)&self->_referenceFrame, self->_currentBestFrame);
    }
  }

  return 0;
}

- (int)addFrame:(id)a3 forMode:(int)a4 usingTuningParams:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    FigDebugAssert3();
LABEL_27:
    int v33 = FigSignalErrorAt();
    goto LABEL_24;
  }
  if (dword_26B430EA8)
  {
    float v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  float v12 = [(NSMutableDictionary *)self->_sidecarMetadata objectForKeyedSubscript:@"NormalizedSharpnessScore", v36, v37];

  if (!v12)
  {
    float v13 = objc_opt_new();
    [(NSMutableDictionary *)self->_sidecarMetadata setObject:v13 forKeyedSubscript:@"NormalizedSharpnessScore"];
  }
  id v14 = v10;
  float v15 = [(NSMutableDictionary *)self->_sidecarMetadata objectForKeyedSubscript:@"NormalizedSharpnessScore"];
  double v16 = NSNumber;
  [v9 normalisedFaceSharpness];
  double v17 = objc_msgSend(v16, "numberWithFloat:");
  [v15 addObject:v17];

  v18 = [(NSMutableDictionary *)self->_sidecarMetadata objectForKeyedSubscript:@"ExposureTime"];

  if (!v18)
  {
    double v19 = objc_opt_new();
    [(NSMutableDictionary *)self->_sidecarMetadata setObject:v19 forKeyedSubscript:@"ExposureTime"];
  }
  float v20 = [(NSMutableDictionary *)self->_sidecarMetadata objectForKeyedSubscript:@"ExposureTime"];
  double v21 = NSNumber;
  v22 = -[RawNightModeInputFrame properties]((uint64_t)v9);
  id v23 = [v22 meta];
  LODWORD(v24) = *(_DWORD *)([v23 exposureParams] + 52);
  float v25 = [v21 numberWithFloat:v24];
  [v20 addObject:v25];

  if (a4 != 3)
  {
    double v27 = [(NSMutableDictionary *)self->_sidecarMetadata objectForKeyedSubscript:@"Method"];
    [v27 addObject:@"EnhancedMotionFreezing"];

    int referenceFrameIndex = self->_referenceFrameIndex;
    uint64_t frameIndexCounter = self->_frameIndexCounter;
    id v10 = v14;
    if (referenceFrameIndex == -1)
    {
      int v30 = [(RawNMReferenceFrameSelector *)self analyseNewFrame:v9 frameIndex:frameIndexCounter usingTuningParams:v14];
      if (v30)
      {
        int v33 = v30;
        FigDebugAssert3();
        goto LABEL_24;
      }
      LODWORD(frameIndexCounter) = self->_frameIndexCounter;
    }
    else if (referenceFrameIndex == frameIndexCounter)
    {
      objc_storeStrong((id *)&self->_currentBestFrame, a3);
      LODWORD(frameIndexCounter) = self->_frameIndexCounter;
      self->_currentBestFrameIndex = frameIndexCounter;
    }
    if (frameIndexCounter == self->_referenceFrameCandidatesCount - 1)
    {
      currentBestFrame = self->_currentBestFrame;
      if (!currentBestFrame) {
        goto LABEL_26;
      }
      if (dword_26B430EA8)
      {
        float v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        currentBestFrame = self->_currentBestFrame;
      }
      objc_storeStrong((id *)&self->_referenceFrame, currentBestFrame);
      self->_int referenceFrameIndex = self->_currentBestFrameIndex;
      self->_status = 2;
      id v34 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [(NSMutableDictionary *)self->_sidecarMetadata setObject:v34 forKeyedSubscript:@"ReferenceFrameIndex"];
    }
    int v33 = 0;
    goto LABEL_24;
  }
  id v10 = v14;
  if (self->_status == 2)
  {
LABEL_26:
    FigDebugAssert3();
    goto LABEL_27;
  }
  if (dword_26B430EA8)
  {
    int v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_storeStrong((id *)&self->_referenceFrame, a3);
  int v33 = 0;
  self->_status = 2;
LABEL_24:
  ++self->_frameIndexCounter;

  return v33;
}

- (int)referenceFrameIndex
{
  return self->_currentBestFrameIndex;
}

- (int)forceSelection
{
  currentBestFrame = self->_currentBestFrame;
  if (currentBestFrame)
  {
    if (dword_26B430EA8)
    {
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      currentBestFrame = self->_currentBestFrame;
    }
    objc_storeStrong((id *)&self->_referenceFrame, currentBestFrame);
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (NSMutableArray)framesAwaitingFusion
{
  return self->_framesAwaitingFusion;
}

- (void)setFramesAwaitingFusion:(id)a3
{
}

- (RawNightModeInputFrame)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrameIndex:(int)a3
{
  self->_int referenceFrameIndex = a3;
}

- (int)referenceFrameCandidatesCount
{
  return self->_referenceFrameCandidatesCount;
}

- (void)setReferenceFrameCandidatesCount:(int)a3
{
  self->_referenceFrameCandidatesCount = a3;
}

- (NSMutableDictionary)sidecarMetadata
{
  return self->_sidecarMetadata;
}

- (int)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidecarMetadata, 0);
  objc_storeStrong((id *)&self->_referenceFrame, 0);
  objc_storeStrong((id *)&self->_framesAwaitingFusion, 0);
  objc_storeStrong((id *)&self->_currentBestFrame, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end