@interface FigStillDepthProcessorANE
- (BOOL)allocateResources;
- (BOOL)disparityQualityIsHigh;
- (FigStillDepthProcessorANE)init;
- (FigStillDepthProcessorANE)initWithParameters:(depthProcessorParameters *)a3 commandQueue:(id)a4;
- (NSArray)faceLandmarksArray;
- (float)disparityQualityScore;
- (int)convertDepth:(__CVBuffer *)a3 toDisparity:(__CVBuffer *)a4;
- (int)figDepthQuality;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 parametersDictionary:(id)a5 outputDisparityBuffer:(__CVBuffer *)a6;
- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 personSegmentationMaskBuffer:(__CVBuffer *)a5 instanceSegmentationMaskBufferArray:(id)a6 instanceSegmentationConfidences:(id)a7 parametersDictionary:(id)a8 outputDisparityBuffer:(__CVBuffer *)a9;
- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 rgbSegmentationMaskBuffer:(__CVBuffer *)a5 parametersDictionary:(id)a6 outputDisparityBuffer:(__CVBuffer *)a7;
- (int)scaleInputDepth:(__CVBuffer *)a3 toDisparity:(__CVBuffer *)a4;
- (int)setTuningParameters:(id)a3;
- (void)dealloc;
- (void)setFaceLandmarksArray:(id)a3;
@end

@implementation FigStillDepthProcessorANE

- (int)prewarmWithTuningParameters:(id)a3
{
  return 0;
}

- (int)setTuningParameters:(id)a3
{
  return 0;
}

- (FigStillDepthProcessorANE)init
{
  memset(v9, 0, sizeof(v9));
  v3 = [FigStillDepthProcessorANE alloc];
  v7 = (FigStillDepthProcessorANE *)objc_msgSend_initWithParameters_commandQueue_(v3, v4, (uint64_t)v9, 0, v5, v6);

  return v7;
}

- (FigStillDepthProcessorANE)initWithParameters:(depthProcessorParameters *)a3 commandQueue:(id)a4
{
  id v5 = a4;
  v29.receiver = self;
  v29.super_class = (Class)FigStillDepthProcessorANE;
  id v6 = [(FigStillDepthProcessorANE *)&v29 init];
  if (v6)
  {
    v7 = (void *)MEMORY[0x263F086E0];
    uint64_t v8 = objc_opt_class();
    v13 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11, v12);
    id v14 = objc_alloc(MEMORY[0x263F2EE30]);
    uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v14, v15, (uint64_t)v13, (uint64_t)v5, v16, v17);
    v19 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = inited;

    if (*((void *)v6 + 1)
      && (v20 = [ANEDepthScalingProcessor alloc],
          uint64_t v25 = objc_msgSend_initWithMetalContext_(v20, v21, *((void *)v6 + 1), v22, v23, v24),
          v26 = (void *)*((void *)v6 + 2),
          *((void *)v6 + 2) = v25,
          v26,
          *((void *)v6 + 2)))
    {
      v27 = (FigStillDepthProcessorANE *)v6;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)allocateResources
{
  return 1;
}

- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 parametersDictionary:(id)a5 outputDisparityBuffer:(__CVBuffer *)a6
{
  id v12 = a5;
  if (a3 && a6 && !objc_msgSend_convertDepth_toDisparity_(self, v9, (uint64_t)a3, (uint64_t)a6, v10, v11))
  {
    self->_disparityQualityScore = 1.0;
    self->_disparityQualityIsHigh = 1;
    faceLandmarksArray = self->_faceLandmarksArray;
    if (faceLandmarksArray) {
      BOOL v19 = (int)objc_msgSend_count(faceLandmarksArray, v13, v14, v15, v16, v17) > 0;
    }
    else {
      BOOL v19 = 0;
    }
    self->_figDepthQuality = v19;
    v20 = self->_faceLandmarksArray;
    self->_faceLandmarksArray = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    uint64_t v24 = self->_faceLandmarksArray;
    self->_faceLandmarksArray = 0;

    if (v23)
    {
      int v21 = 17;
      goto LABEL_9;
    }
  }
  int v21 = 0;
LABEL_9:

  return v21;
}

- (int)scaleInputDepth:(__CVBuffer *)a3 toDisparity:(__CVBuffer *)a4
{
  v7 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, a2, (uint64_t)a3, 55, 17, 0);
  if (v7)
  {
    uint64_t v11 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v6, (uint64_t)a4, 25, 23, 0);
    if (v11)
    {
      int v12 = objc_msgSend_scaleFromDepth_toDisparity_(self->_depthScaling, v8, (uint64_t)v7, (uint64_t)v11, v9, v10);
      if (v12)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v12 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
    uint64_t v11 = 0;
  }

  return v12;
}

- (int)convertDepth:(__CVBuffer *)a3 toDisparity:(__CVBuffer *)a4
{
  if (a3
    && a4
    && CVPixelBufferGetPixelFormatType(a3) == 1717855600
    && CVPixelBufferGetPixelFormatType(a4) == 1751411059
    && CVPixelBufferGetWidth(a3)
    && CVPixelBufferGetHeight(a3)
    && CVPixelBufferGetWidth(a4)
    && CVPixelBufferGetHeight(a4))
  {
    objc_msgSend_scaleInputDepth_toDisparity_(self, v7, (uint64_t)a3, (uint64_t)a4, v8, v9);
    objc_msgSend_waitForSchedule(self->_metalContext, v10, v11, v12, v13, v14);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  return 0;
}

- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 rgbSegmentationMaskBuffer:(__CVBuffer *)a5 parametersDictionary:(id)a6 outputDisparityBuffer:(__CVBuffer *)a7
{
  return MEMORY[0x270F9A6D0](self, sel_processDepthBuffer_yuvBuffer_parametersDictionary_outputDisparityBuffer_, a3, a4, a6, a7);
}

- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 personSegmentationMaskBuffer:(__CVBuffer *)a5 instanceSegmentationMaskBufferArray:(id)a6 instanceSegmentationConfidences:(id)a7 parametersDictionary:(id)a8 outputDisparityBuffer:(__CVBuffer *)a9
{
  return MEMORY[0x270F9A6D0](self, sel_processDepthBuffer_yuvBuffer_parametersDictionary_outputDisparityBuffer_, a3, a4, a8, a9);
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)FigStillDepthProcessorANE;
  [(FigStillDepthProcessorANE *)&v7 dealloc];
}

- (NSArray)faceLandmarksArray
{
  return self->_faceLandmarksArray;
}

- (void)setFaceLandmarksArray:(id)a3
{
}

- (float)disparityQualityScore
{
  return self->_disparityQualityScore;
}

- (BOOL)disparityQualityIsHigh
{
  return self->_disparityQualityIsHigh;
}

- (int)figDepthQuality
{
  return self->_figDepthQuality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceLandmarksArray, 0);
  objc_storeStrong((id *)&self->_depthScaling, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end