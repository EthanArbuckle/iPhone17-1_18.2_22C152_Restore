@interface CMISoftwareFlashRenderingCoreAnalyticsV2
- (CMISoftwareFlashRenderingCoreAnalyticsV2)initWithMetalContext:(id)a3;
- (int)_calculateCastCorrectionDirectionWithNewWhitePoint:(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self oldWhitePoint:(SEL)a2 outputCorrectionDirection:(float *)a3;
- (int)_calculateCastStrengthMetricScaleWithPercentileDeltaEuvBuffer:(id)a3 outputCorrectionStrengthScale:(int *)a4;
- (int)_calculateDominantCastCorrectionDirectionsWithAmbientWhitePointTuned:(unsigned int)a3 flashWhitePoint:(float)a4 strobeWhitePointTuned:(float *)a5 numCorrectionDirectionWhitePointSamples:(float *)a6 foregroundMixFactorThreshold:outputBackgroundCorrectionDirection:outputForegroundCorrectionDirection:;
- (int)_clearHistogramBuffers:(id)a3 outputForegroundHistogramBuffer:(id)a4 outputBackgroundHistogramBuffer:(id)a5;
- (int)_encodeAnalyticSampleHistogramsCalculate:(id)a3 sourceLumaTexture:(id)a4 sourceChromaTexture:(id)a5 destinationLumaTexture:(id)a6 destinationChromaTexture:(id)a7 whitePointMixingMapTexture:(id)a8 yuvOffsets:(CMISoftwareFlashRenderingCropRect)a9 cropRect:(float)a10 foregroundMixFactorThreshold:(unsigned int)a11 numHistogramBins:(float)a12 maxDeltaEuv:(id)a13 outputForegroundHistogramBuffer:(id)a14 outputBackgroundHistogramBuffer:;
- (int)_encodeCoreAnalyticPercentileSampleCalculate:(id)a3 analyticSampleHistogramBuffer:(id)a4 numHistogramBins:(unsigned int)a5 histogramScaleFactor:(float)a6 minSampleRatio:(float)a7 summaryPercentile:(float)a8 maxDeltaEuv:(float)a9 outputPercentileDeltaEuvBuffer:(id)a10;
- (int)_encodeWhitePointMixingMapThumbnailBoxCreate:(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self spatialWhitePointsRBTexture:(SEL)a2 ambientWhitePoint:(id)a3 strobeWhitePoint:(id)a4 outputWhitePointMixingMapRTexture:(id)a5;
- (int)calculateCorrectionStrengthAndDirectionWithAmbientWhitePointTuned:(int *)a3 flashWhitePoint:(int *)a4 strobeWhitePointTuned:(float *)a5 outputForegroundCorrectionStrengthScale:(float *)a6 outputBackgroundCorrectionStrengthScale:outputForegroundCorrectionDirection:outputBackgroundCorrectionDirection:;
- (int)calculatePercentileDeltaEuvBuffers:(id)a3 sourceLumaTexture:(id)a4 sourceChromaTexture:(id)a5 destinationLumaTexture:(id)a6 destinationChromaTexture:(id)a7 spatialWhitePointsRBTexture:(id)a8 ambientWhitePoint:(CMISoftwareFlashRenderingCropRect)a9 flashWhitePoint:strobeWhitePoint:ambientWhitePointTuned:strobeWhitePointTuned:yuvOffsets:cropRect:;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingCoreAnalyticsV2

- (CMISoftwareFlashRenderingCoreAnalyticsV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMISoftwareFlashRenderingCoreAnalyticsV2;
  v6 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  if (!v5) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"createWhitePointMixingMapThumbnailBoxV2" constants:0];
  createWhitePointMixingMapThumbnailBoxPipelineState = v7->_createWhitePointMixingMapThumbnailBoxPipelineState;
  v7->_createWhitePointMixingMapThumbnailBoxPipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_createWhitePointMixingMapThumbnailBoxPipelineState) {
    goto LABEL_8;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateAnalyticSampleHistogramsV2" constants:0];
  calculateCoreAnalyticHistogramsPipelineState = v7->_calculateCoreAnalyticHistogramsPipelineState;
  v7->_calculateCoreAnalyticHistogramsPipelineState = (MTLComputePipelineState *)v10;

  if (!v7->_calculateCoreAnalyticHistogramsPipelineState) {
    goto LABEL_8;
  }
  uint64_t v12 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateCoreAnalyticPercentileSampleV2" constants:0];
  calculateCoreAnalyticPercentileSamplePipelineState = v7->_calculateCoreAnalyticPercentileSamplePipelineState;
  v7->_calculateCoreAnalyticPercentileSamplePipelineState = (MTLComputePipelineState *)v12;

  if (v7->_calculateCoreAnalyticPercentileSamplePipelineState)
  {
    v14 = v7;
  }
  else
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = 0;
  }

  return v14;
}

- (int)purgeResources
{
  return 0;
}

- (int)prepareToProcessWithConfig:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
    v18 = 0;
    int v31 = 11;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_config, a3);
  v6 = [(FigMetalContext *)self->_metalContext allocator];
  v7 = (void *)[v6 newTextureDescriptor];

  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
LABEL_15:
    int v31 = 7;
    goto LABEL_10;
  }
  uint64_t v8 = [v7 desc];
  [v8 setTextureType:2];

  uint64_t v9 = [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config spatialGridWidth];
  uint64_t v10 = [v7 desc];
  [v10 setWidth:v9];

  uint64_t v11 = [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config spatialGridHeight];
  uint64_t v12 = [v7 desc];
  [v12 setHeight:v11];

  v13 = [v7 desc];
  [v13 setPixelFormat:25];

  [v7 setLabel:0];
  v14 = [(FigMetalContext *)self->_metalContext allocator];
  v15 = (MTLTexture *)[v14 newTextureWithDescriptor:v7];
  whitePointMixingMapTexture = self->_whitePointMixingMapTexture;
  self->_whitePointMixingMapTexture = v15;

  if (!self->_whitePointMixingMapTexture)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
LABEL_17:
    int v31 = 6;
    goto LABEL_10;
  }
  v17 = [(FigMetalContext *)self->_metalContext allocator];
  v18 = (void *)[v17 newBufferDescriptor];

  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_15;
  }
  objc_msgSend(v18, "setLength:", 4* -[CMISoftwareFlashRenderingCoreAnalyticsV2Configuration castStrengthMetricNumHistogramBins](self->_config, "castStrengthMetricNumHistogramBins"));
  [v18 setOptions:0];
  [v18 setLabel:0];
  v19 = [(FigMetalContext *)self->_metalContext allocator];
  v20 = (MTLBuffer *)[v19 newBufferWithDescriptor:v18];
  foregroundAnalyticSampleHistogramBuffer = self->_foregroundAnalyticSampleHistogramBuffer;
  self->_foregroundAnalyticSampleHistogramBuffer = v20;

  if (!self->_foregroundAnalyticSampleHistogramBuffer) {
    goto LABEL_16;
  }
  objc_msgSend(v18, "setLength:", 4* -[CMISoftwareFlashRenderingCoreAnalyticsV2Configuration castStrengthMetricNumHistogramBins](self->_config, "castStrengthMetricNumHistogramBins"));
  [v18 setOptions:0];
  [v18 setLabel:0];
  v22 = [(FigMetalContext *)self->_metalContext allocator];
  v23 = (MTLBuffer *)[v22 newBufferWithDescriptor:v18];
  backgroundAnalyticSampleHistogramBuffer = self->_backgroundAnalyticSampleHistogramBuffer;
  self->_backgroundAnalyticSampleHistogramBuffer = v23;

  if (!self->_backgroundAnalyticSampleHistogramBuffer) {
    goto LABEL_16;
  }
  [v18 setLength:4];
  [v18 setOptions:0];
  [v18 setLabel:0];
  v25 = [(FigMetalContext *)self->_metalContext allocator];
  v26 = (MTLBuffer *)[v25 newBufferWithDescriptor:v18];
  foregroundPercentileDeltaEuvBuffer = self->_foregroundPercentileDeltaEuvBuffer;
  self->_foregroundPercentileDeltaEuvBuffer = v26;

  if (!self->_foregroundPercentileDeltaEuvBuffer) {
    goto LABEL_16;
  }
  [v18 setLength:4];
  [v18 setOptions:0];
  [v18 setLabel:0];
  v28 = [(FigMetalContext *)self->_metalContext allocator];
  v29 = (MTLBuffer *)[v28 newBufferWithDescriptor:v18];
  backgroundPercentileDeltaEuvBuffer = self->_backgroundPercentileDeltaEuvBuffer;
  self->_backgroundPercentileDeltaEuvBuffer = v29;

  if (!self->_backgroundPercentileDeltaEuvBuffer)
  {
LABEL_16:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_17;
  }
  int v31 = 0;
LABEL_10:

  return v31;
}

- (int)_calculateCastCorrectionDirectionWithNewWhitePoint:(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self oldWhitePoint:(SEL)a2 outputCorrectionDirection:(float *)a3
{
  if (a3)
  {
    float v5 = *(float *)&v3 / fmaxf(*(float *)&v4, 0.00000011921);
    float v6 = fmaxf(*((float *)&v4 + 2), 0.00000011921);
    if ((float)(v5 / fmaxf((float)(*((float *)&v3 + 2) / v6) * (float)(*((float *)&v3 + 2) / v6), 0.00000011921)) <= 1.0) {
      *a3 = 1.0;
    }
    else {
      *a3 = 0.0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return 0;
}

- (int)_calculateDominantCastCorrectionDirectionsWithAmbientWhitePointTuned:(unsigned int)a3 flashWhitePoint:(float)a4 strobeWhitePointTuned:(float *)a5 numCorrectionDirectionWhitePointSamples:(float *)a6 foregroundMixFactorThreshold:outputBackgroundCorrectionDirection:outputForegroundCorrectionDirection:
{
  double v23 = v6;
  float32x4_t v24 = *(float32x4_t *)&a4;
  if (a5 && a6)
  {
    *a5 = 0.0;
    if (a3 <= 1) {
      unsigned int v12 = 1;
    }
    else {
      unsigned int v12 = a3;
    }
    float v13 = (float)(v12 - 1);
    *a6 = 0.0;
    unsigned int v14 = (float)(v13 * v8);
    float v25 = -1.0;
    if (a3)
    {
      unsigned int v16 = 0;
      float v17 = fmaxf(v13, 0.00000011921);
      float32x4_t v22 = vsubq_f32(v7, v24);
      while (1)
      {
        int v18 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self _calculateCastCorrectionDirectionWithNewWhitePoint:&v25 oldWhitePoint:*(double *)vmlaq_n_f32(v24, v22, (float)v16 / v17).i64 outputCorrectionDirection:v23];
        if (v18) {
          break;
        }
        if (v16 <= v14) {
          v19 = a5;
        }
        else {
          v19 = a6;
        }
        float *v19 = v25 + *v19;
        if (a3 == ++v16) {
          goto LABEL_13;
        }
      }
      int v20 = v18;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
LABEL_13:
      int v20 = 0;
      *a5 = *a5 / (float)(v14 + 1);
      *a6 = *a6 / (float)(a3 - (v14 + 1));
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v20;
}

- (int)_calculateCastStrengthMetricScaleWithPercentileDeltaEuvBuffer:(id)a3 outputCorrectionStrengthScale:(int *)a4
{
  id v6 = a3;
  float32x4_t v7 = v6;
  if (!a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_12;
  }
  float v8 = *(float *)[v6 contents];
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castCorrectionStrengthThreshold_Strong];
  if (v8 >= v9)
  {
    int v13 = 4;
LABEL_11:
    *a4 = v13;
    goto LABEL_12;
  }
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castCorrectionStrengthThreshold_Medium];
  if (v8 >= v10)
  {
    int v13 = 3;
    goto LABEL_11;
  }
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castCorrectionStrengthThreshold_Mild];
  if (v8 >= v11)
  {
    int v13 = 2;
    goto LABEL_11;
  }
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castCorrectionStrengthThreshold_Imperceptible];
  if (v8 >= v12)
  {
    int v13 = 1;
    goto LABEL_11;
  }
  *a4 = 0;
LABEL_12:

  return 0;
}

- (int)_encodeWhitePointMixingMapThumbnailBoxCreate:(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self spatialWhitePointsRBTexture:(SEL)a2 ambientWhitePoint:(id)a3 strobeWhitePoint:(id)a4 outputWhitePointMixingMapRTexture:(id)a5
{
  long long v19 = v5;
  long long v20 = v6;
  id v10 = a3;
  id v11 = a4;
  long long v24 = v19;
  long long v23 = v20;
  id v12 = a5;
  if (v10 && ([v10 computeCommandEncoder], (int v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v14 = v13;
    [v13 setComputePipelineState:self->_createWhitePointMixingMapThumbnailBoxPipelineState];
    [v14 setTexture:v11 atIndex:0];
    [v14 setTexture:v12 atIndex:1];
    [v14 setBytes:&v24 length:16 atIndex:0];
    [v14 setBytes:&v23 length:16 atIndex:1];
    unint64_t v15 = [(MTLComputePipelineState *)self->_createWhitePointMixingMapThumbnailBoxPipelineState threadExecutionWidth];
    unint64_t v16 = [(MTLComputePipelineState *)self->_createWhitePointMixingMapThumbnailBoxPipelineState maxTotalThreadsPerThreadgroup]/ v15;
    v22[0] = [v12 width];
    v22[1] = [v12 height];
    v22[2] = 1;
    v21[0] = v15;
    v21[1] = v16;
    v21[2] = 1;
    [v14 dispatchThreads:v22 threadsPerThreadgroup:v21];
    [v14 endEncoding];

    int v17 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v17 = 8;
  }

  return v17;
}

- (int)_clearHistogramBuffers:(id)a3 outputForegroundHistogramBuffer:(id)a4 outputBackgroundHistogramBuffer:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  float v9 = [a3 blitCommandEncoder];
  if (v9)
  {
    objc_msgSend(v9, "fillBuffer:range:value:", v7, 0, objc_msgSend(v7, "length"), 0);
    objc_msgSend(v9, "fillBuffer:range:value:", v8, 0, objc_msgSend(v8, "length"), 0);
    [v9 endEncoding];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return 0;
}

- (int)_encodeAnalyticSampleHistogramsCalculate:(id)a3 sourceLumaTexture:(id)a4 sourceChromaTexture:(id)a5 destinationLumaTexture:(id)a6 destinationChromaTexture:(id)a7 whitePointMixingMapTexture:(id)a8 yuvOffsets:(CMISoftwareFlashRenderingCropRect)a9 cropRect:(float)a10 foregroundMixFactorThreshold:(unsigned int)a11 numHistogramBins:(float)a12 maxDeltaEuv:(id)a13 outputForegroundHistogramBuffer:(id)a14 outputBackgroundHistogramBuffer:
{
  int v20 = v14;
  long long v41 = *(_OWORD *)&a10;
  id v23 = a13;
  id v24 = a14;
  CMISoftwareFlashRenderingCropRect v49 = a9;
  id v25 = a3;
  id v43 = a4;
  id v26 = a5;
  id v27 = a6;
  id v28 = a7;
  id v29 = a8;
  long long v48 = v41;
  int v46 = v20;
  float v47 = a12;
  id v30 = v23;
  id v31 = v24;
  if (v25 && ([v25 computeCommandEncoder], (v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v33 = v32;
    [v32 setComputePipelineState:self->_calculateCoreAnalyticHistogramsPipelineState];
    [v33 setTexture:v43 atIndex:0];
    id v42 = v26;
    [v33 setTexture:v26 atIndex:1];
    [v33 setTexture:v27 atIndex:2];
    [v33 setTexture:v28 atIndex:3];
    [v33 setTexture:v29 atIndex:4];
    [v33 setBytes:&v48 length:16 atIndex:0];
    [v33 setBytes:&v49 length:16 atIndex:1];
    [v33 setBytes:&v47 length:4 atIndex:2];
    [v33 setBytes:&a11 length:4 atIndex:3];
    [v33 setBytes:&v46 length:4 atIndex:4];
    [v33 setBuffer:v30 offset:0 atIndex:5];
    [v33 setBuffer:v31 offset:0 atIndex:6];
    unint64_t v34 = [(MTLComputePipelineState *)self->_calculateCoreAnalyticHistogramsPipelineState threadExecutionWidth];
    id v35 = v25;
    id v36 = v30;
    id v37 = v27;
    unint64_t v38 = [(MTLComputePipelineState *)self->_calculateCoreAnalyticHistogramsPipelineState maxTotalThreadsPerThreadgroup]/ v34;
    v45[0] = [v29 width];
    v45[1] = [v29 height];
    v45[2] = 1;
    v44[0] = v34;
    v44[1] = v38;
    id v27 = v37;
    id v30 = v36;
    id v25 = v35;
    v44[2] = 1;
    id v26 = v42;
    [v33 dispatchThreads:v45 threadsPerThreadgroup:v44];
    [v33 endEncoding];

    int v39 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v39 = 9;
  }

  return v39;
}

- (int)_encodeCoreAnalyticPercentileSampleCalculate:(id)a3 analyticSampleHistogramBuffer:(id)a4 numHistogramBins:(unsigned int)a5 histogramScaleFactor:(float)a6 minSampleRatio:(float)a7 summaryPercentile:(float)a8 maxDeltaEuv:(float)a9 outputPercentileDeltaEuvBuffer:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  unsigned int v34 = a5;
  float v32 = a7;
  float v33 = a6;
  float v30 = a9;
  float v31 = a8;
  id v20 = a10;
  if (v18 && ([v18 computeCommandEncoder], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    float32x4_t v22 = v21;
    [v21 setComputePipelineState:self->_calculateCoreAnalyticPercentileSamplePipelineState];
    [v22 setBuffer:v20 offset:0 atIndex:0];
    [v22 setBuffer:v19 offset:0 atIndex:1];
    [v22 setBytes:&v34 length:4 atIndex:2];
    [v22 setBytes:&v33 length:4 atIndex:3];
    [v22 setBytes:&v32 length:4 atIndex:4];
    [v22 setBytes:&v31 length:4 atIndex:5];
    [v22 setBytes:&v30 length:4 atIndex:6];
    unint64_t v23 = [(MTLComputePipelineState *)self->_calculateCoreAnalyticPercentileSamplePipelineState threadExecutionWidth];
    unint64_t v24 = [(MTLComputePipelineState *)self->_calculateCoreAnalyticPercentileSamplePipelineState maxTotalThreadsPerThreadgroup];
    int64x2_t v28 = vdupq_n_s64(1uLL);
    uint64_t v29 = 1;
    v27[0] = v23;
    v27[1] = v24 / v23;
    v27[2] = 1;
    [v22 dispatchThreads:&v28 threadsPerThreadgroup:v27];
    [v22 endEncoding];

    int v25 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v25 = 9;
  }

  return v25;
}

- (int)calculatePercentileDeltaEuvBuffers:(id)a3 sourceLumaTexture:(id)a4 sourceChromaTexture:(id)a5 destinationLumaTexture:(id)a6 destinationChromaTexture:(id)a7 spatialWhitePointsRBTexture:(id)a8 ambientWhitePoint:(CMISoftwareFlashRenderingCropRect)a9 flashWhitePoint:strobeWhitePoint:ambientWhitePointTuned:strobeWhitePointTuned:yuvOffsets:cropRect:
{
  double v57 = v11;
  double v58 = v9;
  double v60 = v10;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  int v23 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self _encodeWhitePointMixingMapThumbnailBoxCreate:v18 spatialWhitePointsRBTexture:a8 ambientWhitePoint:self->_whitePointMixingMapTexture strobeWhitePoint:v58 outputWhitePointMixingMapRTexture:v60];
  if (v23) {
    goto LABEL_7;
  }
  int v23 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self _clearHistogramBuffers:v18 outputForegroundHistogramBuffer:self->_foregroundAnalyticSampleHistogramBuffer outputBackgroundHistogramBuffer:self->_backgroundAnalyticSampleHistogramBuffer];
  if (v23) {
    goto LABEL_7;
  }
  uint64_t v59 = [(MTLTexture *)self->_whitePointMixingMapTexture width];
  uint64_t v24 = [(MTLTexture *)self->_whitePointMixingMapTexture height];
  whitePointMixingMapTexture = self->_whitePointMixingMapTexture;
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config foregroundMixFactorThreshold];
  int v27 = v26;
  unsigned int v28 = [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricNumHistogramBins];
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricMaxDeltaEuv];
  LODWORD(v30) = v29;
  LODWORD(v56) = v28;
  LODWORD(v31) = v27;
  int v23 = -[CMISoftwareFlashRenderingCoreAnalyticsV2 _encodeAnalyticSampleHistogramsCalculate:sourceLumaTexture:sourceChromaTexture:destinationLumaTexture:destinationChromaTexture:whitePointMixingMapTexture:yuvOffsets:cropRect:foregroundMixFactorThreshold:numHistogramBins:maxDeltaEuv:outputForegroundHistogramBuffer:outputBackgroundHistogramBuffer:](self, "_encodeAnalyticSampleHistogramsCalculate:sourceLumaTexture:sourceChromaTexture:destinationLumaTexture:destinationChromaTexture:whitePointMixingMapTexture:yuvOffsets:cropRect:foregroundMixFactorThreshold:numHistogramBins:maxDeltaEuv:outputForegroundHistogramBuffer:outputBackgroundHistogramBuffer:", v18, v19, v20, v21, v22, whitePointMixingMapTexture, v57, v31, v30, *(void *)&a9.var0, *(void *)&a9.var2, v56, self->_foregroundAnalyticSampleHistogramBuffer, self->_backgroundAnalyticSampleHistogramBuffer);
  if (v23) {
    goto LABEL_7;
  }
  foregroundAnalyticSampleHistogramBuffer = self->_foregroundAnalyticSampleHistogramBuffer;
  uint64_t v33 = [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricNumHistogramBins];
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricMinSampleRatio];
  int v35 = v34;
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricSummaryPercentile];
  int v37 = v36;
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricMaxDeltaEuv];
  LODWORD(v39) = v38;
  *(float *)&double v40 = (float)(unint64_t)(v24 * v59);
  LODWORD(v41) = v35;
  LODWORD(v42) = v37;
  int v23 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self _encodeCoreAnalyticPercentileSampleCalculate:v18 analyticSampleHistogramBuffer:foregroundAnalyticSampleHistogramBuffer numHistogramBins:v33 histogramScaleFactor:self->_foregroundPercentileDeltaEuvBuffer minSampleRatio:v40 summaryPercentile:v41 maxDeltaEuv:v42 outputPercentileDeltaEuvBuffer:v39];
  if (v23)
  {
LABEL_7:
    int v54 = v23;
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();
    goto LABEL_6;
  }
  backgroundAnalyticSampleHistogramBuffer = self->_backgroundAnalyticSampleHistogramBuffer;
  uint64_t v44 = [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricNumHistogramBins];
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricMinSampleRatio];
  int v46 = v45;
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricSummaryPercentile];
  int v48 = v47;
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config castStrengthMetricMaxDeltaEuv];
  LODWORD(v50) = v49;
  *(float *)&double v51 = (float)(unint64_t)(v24 * v59);
  LODWORD(v52) = v46;
  LODWORD(v53) = v48;
  int v54 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self _encodeCoreAnalyticPercentileSampleCalculate:v18 analyticSampleHistogramBuffer:backgroundAnalyticSampleHistogramBuffer numHistogramBins:v44 histogramScaleFactor:self->_backgroundPercentileDeltaEuvBuffer minSampleRatio:v51 summaryPercentile:v52 maxDeltaEuv:v53 outputPercentileDeltaEuvBuffer:v50];
  if (v54)
  {
    fig_log_get_emitter();
    goto LABEL_12;
  }
LABEL_6:

  return v54;
}

- (int)calculateCorrectionStrengthAndDirectionWithAmbientWhitePointTuned:(int *)a3 flashWhitePoint:(int *)a4 strobeWhitePointTuned:(float *)a5 outputForegroundCorrectionStrengthScale:(float *)a6 outputBackgroundCorrectionStrengthScale:outputForegroundCorrectionDirection:outputBackgroundCorrectionDirection:
{
  if (!a3 || !a4 || !a5 || !a6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  double v20 = v6;
  double v21 = v7;
  double v22 = v8;
  int v13 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self _calculateCastStrengthMetricScaleWithPercentileDeltaEuvBuffer:self->_foregroundPercentileDeltaEuvBuffer outputCorrectionStrengthScale:a3];
  if (v13
    || (int v13 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self _calculateCastStrengthMetricScaleWithPercentileDeltaEuvBuffer:self->_backgroundPercentileDeltaEuvBuffer outputCorrectionStrengthScale:a4]) != 0)
  {
    int v18 = v13;
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
    return v18;
  }
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config numCorrectionDirectionWhitePointSamples];
  uint64_t v15 = v14;
  [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)self->_config foregroundMixFactorThreshold];
  LODWORD(v17) = v16;
  int v18 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self _calculateDominantCastCorrectionDirectionsWithAmbientWhitePointTuned:v15 flashWhitePoint:a6 strobeWhitePointTuned:a5 numCorrectionDirectionWhitePointSamples:v20 foregroundMixFactorThreshold:v21 outputBackgroundCorrectionDirection:v22 outputForegroundCorrectionDirection:v17];
  if (v18)
  {
    fig_log_get_emitter();
    goto LABEL_13;
  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAnalyticSampleHistogramBuffer, 0);
  objc_storeStrong((id *)&self->_foregroundAnalyticSampleHistogramBuffer, 0);
  objc_storeStrong((id *)&self->_backgroundPercentileDeltaEuvBuffer, 0);
  objc_storeStrong((id *)&self->_foregroundPercentileDeltaEuvBuffer, 0);
  objc_storeStrong((id *)&self->_whitePointMixingMapTexture, 0);
  objc_storeStrong((id *)&self->_calculateCoreAnalyticPercentileSamplePipelineState, 0);
  objc_storeStrong((id *)&self->_calculateCoreAnalyticHistogramsPipelineState, 0);
  objc_storeStrong((id *)&self->_createWhitePointMixingMapThumbnailBoxPipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end