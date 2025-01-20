@interface RawNightModeGreenGhost
+ (int)prewarmShaders:(id)a3;
- (GreenGhostLowLightTuningParams)tuning;
- (MTLTexture)ggMaxFusionWeights;
- (NSDictionary)cameraInfoByPortType;
- (NSMutableDictionary)sidecarMetadata;
- (RawNightModeGreenGhost)initWithMetalContext:(id)a3;
- (RawNightModeInputFrame)referenceFrame;
- (int)applyInpaintWithDownscaledRGB:(id)a3 propagatedRGB:(id)a4 propagatedGradient:(id)a5 outputRGB:(id)a6 params:(LowLightInpaintTuning *)a7;
- (int)canMitigationProceedWithMaxMaskAverage:(float)a3;
- (int)computeFusionWeightsNonRefLuma:(id)a3 nonRefChroma:(id)a4 maskMBBinary:(id)a5 nonRefProperties:(id)a6 output:(id)a7 params:(LowLightFusionTuning *)a8;
- (int)computeLSCWBGParams;
- (int)computeTemporalVariationsNonRefLuma:(id)a3 nonRefProperties:(id)a4 params:(MultiBandDetectionTuning *)a5;
- (int)defineSensorType;
- (int)extractFaceBodyBoundariesWithFaceBoundaryPaddingRatio:(RawNightModeGreenGhost *)self;
- (int)fuseNonRefFrame:(id)a3 downscaledLuma:(id)a4 downscaledChroma:(id)a5 maskMBBinary:(id)a6 output:(id)a7 params:(LowLightTuning *)a8;
- (int)guidedFilter:(id)a3 withGuideLuma:(id)a4 guideChroma:(id)a5 params:(LowLightRefinementTuning *)a6 output:(id)a7;
- (int)mixRefFrameWithAccumulator:(id)a3;
- (int)prepareFrame:(id)a3 outputLuma:(id)a4 outputChroma:(id)a5;
- (int)prepareInpaintWithInputTexture:(id)a3 outputRGBTexture:(id)a4 outputGradidentTexture:(id)a5 params:(LowLightInpaintTuning *)a6;
- (int)processNonReferenceFrame:(id)a3 forBatch:(id)a4;
- (int)processReferenceFrame:(id)a3 gdcMode:(int)a4;
- (int)propagateRGB:(id)a3 gradient:(id)a4 outputRGB:(id)a5 outputGradient:(id)a6 params:(LowLightInpaintTuning *)a7;
- (int)refineMaskWithGuideLuma:(id)a3 guideChroma:(id)a4 params:(LowLightRefinementTuning *)a5 maskMBBinary:(id)a6;
- (int)reset;
- (int)residualCorrectionOfAccumulator:(id)a3;
- (int)runFusionWithNonRefFrame:(id)a3 fusionWeights:(id)a4 output:(id)a5 params:(LowLightFusionTuning *)a6;
- (int)singleBracketDetectionWithLuma:(id)a3 chroma:(id)a4 params:(DetectionTuning *)a5;
- (int)updateDetectionWithNonRefLuma:(id)a3 maskMBBinary:(id)a4 properties:(id)a5 params:(LowLightTuning *)a6;
- (int)updateFusionWeights:(id)a3;
- (int)updateMaskComputeGradientsFor:(id)a3 outputMask:(id)a4 outputGradient:(id)a5 params:(LowLightInpaintTuning *)a6;
- (void)dealloc;
- (void)releaseTextures;
- (void)scaleFaceBodyBoundariesWithSizeRatio:(float)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setReferenceFrame:(id)a3;
- (void)setTuning:(id)a3;
@end

@implementation RawNightModeGreenGhost

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3
    && (v4 = [[RawNightModeGreenGhost alloc] initWithMetalContext:v3]) != 0)
  {
    int v5 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    v4 = 0;
  }

  return v5;
}

- (RawNightModeGreenGhost)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)RawNightModeGreenGhost;
  v6 = [(RawNightModeGreenGhost *)&v47 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_23;
  }
  if (!v5) {
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  *(_WORD *)&v7->_canMitigationProceed = 256;
  v7->_nonRefFramesCount = 0;
  v7->_gdcMode = 0;
  v8 = [(FigMetalContext *)v7->_metal device];
  uint64_t v9 = [v8 newBufferWithLength:4 options:0];
  sumMaskBuffer = v7->_sumMaskBuffer;
  v7->_sumMaskBuffer = (MTLBuffer *)v9;

  if (!v7->_sumMaskBuffer) {
    goto LABEL_23;
  }
  v11 = [[GreenGhostCommon alloc] initWithMetalContext:v5];
  greenGhostCommon = v7->_greenGhostCommon;
  v7->_greenGhostCommon = v11;

  if (!v7->_greenGhostCommon) {
    goto LABEL_23;
  }
  v13 = [[TextureUtils alloc] initWithMetalContext:v5];
  textureUtils = v7->_textureUtils;
  v7->_textureUtils = v13;

  if (!v7->_textureUtils) {
    goto LABEL_23;
  }
  uint64_t v15 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::prepareFrame" constants:0];
  rawNMGreenGhostPrepareFrame = v7->_rawNMGreenGhostPrepareFrame;
  v7->_rawNMGreenGhostPrepareFrame = (MTLComputePipelineState *)v15;

  if (!v7->_rawNMGreenGhostPrepareFrame) {
    goto LABEL_23;
  }
  uint64_t v17 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::computeSumMask" constants:0];
  rawNMGreenGhostComputeSumMask = v7->_rawNMGreenGhostComputeSumMask;
  v7->_rawNMGreenGhostComputeSumMask = (MTLComputePipelineState *)v17;

  if (!v7->_rawNMGreenGhostComputeSumMask) {
    goto LABEL_23;
  }
  uint64_t v19 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::computeTmpVariations" constants:0];
  rawNMGreenGhostComputeTmpVar = v7->_rawNMGreenGhostComputeTmpVar;
  v7->_rawNMGreenGhostComputeTmpVar = (MTLComputePipelineState *)v19;

  if (!v7->_rawNMGreenGhostComputeTmpVar) {
    goto LABEL_23;
  }
  uint64_t v21 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::refineMask" constants:0];
  rawNMGreenGhostRefineMask = v7->_rawNMGreenGhostRefineMask;
  v7->_rawNMGreenGhostRefineMask = (MTLComputePipelineState *)v21;

  if (!v7->_rawNMGreenGhostRefineMask) {
    goto LABEL_23;
  }
  uint64_t v23 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::guidedFilterHorizontal" constants:0];
  rawNMGreenGhostHorzGuidedFilter = v7->_rawNMGreenGhostHorzGuidedFilter;
  v7->_rawNMGreenGhostHorzGuidedFilter = (MTLComputePipelineState *)v23;

  if (!v7->_rawNMGreenGhostHorzGuidedFilter) {
    goto LABEL_23;
  }
  uint64_t v25 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::guidedFilterVerticalThreshold" constants:0];
  rawNMGreenGhostVertGuidedFilter = v7->_rawNMGreenGhostVertGuidedFilter;
  v7->_rawNMGreenGhostVertGuidedFilter = (MTLComputePipelineState *)v25;

  if (!v7->_rawNMGreenGhostVertGuidedFilter) {
    goto LABEL_23;
  }
  uint64_t v27 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::computeNeighborDiff" constants:0];
  rawNMGreenGhostComputeNeighborDiff = v7->_rawNMGreenGhostComputeNeighborDiff;
  v7->_rawNMGreenGhostComputeNeighborDiff = (MTLComputePipelineState *)v27;

  if (!v7->_rawNMGreenGhostComputeNeighborDiff) {
    goto LABEL_23;
  }
  uint64_t v29 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::computeFusionWeights" constants:0];
  rawNMGreenGhostComputeFuseWeights = v7->_rawNMGreenGhostComputeFuseWeights;
  v7->_rawNMGreenGhostComputeFuseWeights = (MTLComputePipelineState *)v29;

  if (!v7->_rawNMGreenGhostComputeFuseWeights) {
    goto LABEL_23;
  }
  uint64_t v31 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::ggmFusion" constants:0];
  rawNMGreenGhostFusion = v7->_rawNMGreenGhostFusion;
  v7->_rawNMGreenGhostFusion = (MTLComputePipelineState *)v31;

  if (!v7->_rawNMGreenGhostFusion) {
    goto LABEL_23;
  }
  uint64_t v33 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::updateFusionWeightsAcc" constants:0];
  rawNMGreenGhostUpdateWeights = v7->_rawNMGreenGhostUpdateWeights;
  v7->_rawNMGreenGhostUpdateWeights = (MTLComputePipelineState *)v33;

  if (!v7->_rawNMGreenGhostUpdateWeights) {
    goto LABEL_23;
  }
  uint64_t v35 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::mixingFusedAndReference" constants:0];
  rawNMGreenGhostMixFusedAndReference = v7->_rawNMGreenGhostMixFusedAndReference;
  v7->_rawNMGreenGhostMixFusedAndReference = (MTLComputePipelineState *)v35;

  if (!v7->_rawNMGreenGhostMixFusedAndReference) {
    goto LABEL_23;
  }
  uint64_t v37 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::updateMaskComputeGradient" constants:0];
  rawNMGreenGhostUpdateMaskGrad = v7->_rawNMGreenGhostUpdateMaskGrad;
  v7->_rawNMGreenGhostUpdateMaskGrad = (MTLComputePipelineState *)v37;

  if (!v7->_rawNMGreenGhostUpdateMaskGrad) {
    goto LABEL_23;
  }
  uint64_t v39 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::propagateNeighborhood" constants:0];
  rawNMGreenGhostPropagateRGBGradient = v7->_rawNMGreenGhostPropagateRGBGradient;
  v7->_rawNMGreenGhostPropagateRGBGradient = (MTLComputePipelineState *)v39;

  if (!v7->_rawNMGreenGhostPropagateRGBGradient) {
    goto LABEL_23;
  }
  uint64_t v41 = [v5 computePipelineStateFor:@"RawNightModeGreenGhost::inpainting" constants:0];
  rawNMGreenGhostInpaint = v7->_rawNMGreenGhostInpaint;
  v7->_rawNMGreenGhostInpaint = (MTLComputePipelineState *)v41;

  if (!v7->_rawNMGreenGhostInpaint) {
    goto LABEL_23;
  }
  uint64_t v43 = objc_opt_new();
  sidecarMetadata = v7->_sidecarMetadata;
  v7->_sidecarMetadata = (NSMutableDictionary *)v43;

  if (v7->_sidecarMetadata)
  {
    v45 = v7;
  }
  else
  {
LABEL_23:
    FigDebugAssert3();
    v45 = 0;
  }

  return v45;
}

- (void)releaseTextures
{
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  FigMetalDecRef();
}

- (int)reset
{
  *(_WORD *)&self->_canMitigationProceed = 256;
  self->_nonRefFramesCount = 0;
  self->_gdcMode = 0;
  referenceFrame = self->_referenceFrame;
  self->_referenceFrame = 0;

  [(RawNightModeGreenGhost *)self releaseTextures];
  return 0;
}

- (void)dealloc
{
  sumMaskBuffer = self->_sumMaskBuffer;
  self->_sumMaskBuffer = 0;

  v4.receiver = self;
  v4.super_class = (Class)RawNightModeGreenGhost;
  [(RawNightModeGreenGhost *)&v4 dealloc];
}

- (int)defineSensorType
{
  id v3 = (__CVBuffer *)-[RawNightModeInputFrame pixelBuffer]((uint64_t)self->_referenceFrame);
  objc_super v4 = -[RawNightModeInputFrame metadata]((uint64_t)self->_referenceFrame);
  unsigned int v5 = determineCFALayout(v3, v4);

  if (v5 - 1 < 2)
  {
    int v6 = 1;
LABEL_5:
    self->_sensorType = v6;
    return 0;
  }
  if (v5 == 3)
  {
    int v6 = 2;
    goto LABEL_5;
  }

  return FigSignalErrorAt();
}

- (int)prepareFrame:(id)a3 outputLuma:(id)a4 outputChroma:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v23 = -[RawNightModeInputFrame firstPix]((uint64_t)v8);
  v11 = [(FigMetalContext *)self->_metal commandBuffer];
  v12 = v11;
  if (v11 && ([v11 computeCommandEncoder], (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = v13;
    [v13 setComputePipelineState:self->_rawNMGreenGhostPrepareFrame];
    uint64_t v15 = -[RawNightModeInputFrame textures]((uint64_t)v8);
    v16 = [v15 objectAtIndexedSubscript:0];
    [v14 setTexture:v16 atIndex:0];

    [v14 setTexture:v9 atIndex:1];
    [v14 setTexture:v10 atIndex:2];
    [v14 setBytes:&v23 length:4 atIndex:0];
    unint64_t v17 = [(MTLComputePipelineState *)self->_rawNMGreenGhostPrepareFrame threadExecutionWidth];
    unint64_t v18 = [(MTLComputePipelineState *)self->_rawNMGreenGhostPrepareFrame maxTotalThreadsPerThreadgroup]/ v17;
    v22[0] = [v9 width];
    v22[1] = [v9 height];
    v22[2] = 1;
    v21[0] = v17;
    v21[1] = v18;
    v21[2] = 1;
    [v14 dispatchThreads:v22 threadsPerThreadgroup:v21];
    [v14 endEncoding];
    [(FigMetalContext *)self->_metal commit];

    int v19 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
  }

  return v19;
}

- (void)scaleFaceBodyBoundariesWithSizeRatio:(float)a3
{
  uint64_t nFaces = self->_faceBodyBoundaries.nFaces;
  self->_faceBodyBoundariesDownscaled.uint64_t nFaces = nFaces;
  if (nFaces)
  {
    objc_super v4 = (float32x4_t *)self;
    do
    {
      v4[27] = vmulq_n_f32(v4[5], a3);
      ++v4;
      --nFaces;
    }
    while (nFaces);
  }
  uint64_t v5 = *(unsigned int *)&self->_anon_44[172];
  *(_DWORD *)&self->_anon_1a4[172] = v5;
  if (v5)
  {
    do
    {
      *(float32x4_t *)&self->_anon_1a4[188] = vmulq_n_f32(*(float32x4_t *)&self->_anon_44[188], a3);
      self = (RawNightModeGreenGhost *)((char *)self + 16);
      --v5;
    }
    while (v5);
  }
}

- (int)extractFaceBodyBoundariesWithFaceBoundaryPaddingRatio:(RawNightModeGreenGhost *)self
{
  double v3 = v2;
  uint64_t v5 = (__CVBuffer *)-[RawNightModeInputFrame pixelBuffer]((uint64_t)self->_referenceFrame);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v5, 0);
  v7 = (__CVBuffer *)-[RawNightModeInputFrame pixelBuffer]((uint64_t)self->_referenceFrame);
  double v8 = (double)WidthOfPlane;
  double HeightOfPlane = (double)CVPixelBufferGetHeightOfPlane(v7, 0);
  greenGhostCommon = self->_greenGhostCommon;
  v11 = -[RawNightModeInputFrame properties]((uint64_t)self->_referenceFrame);
  v12 = [v11 meta];
  int v13 = -[GreenGhostCommon extractFaceBodyBoundariesFromFaceLandMarks:ev0FrameMetadata:imgSize:faceBoundaryPaddingRatio:bodyBoundaryPaddingRatio:output:](greenGhostCommon, "extractFaceBodyBoundariesFromFaceLandMarks:ev0FrameMetadata:imgSize:faceBoundaryPaddingRatio:bodyBoundaryPaddingRatio:output:", 0, v12, &self->_faceBodyBoundaries, v8, HeightOfPlane, v3, COERCE_DOUBLE(1036831949));

  if (v13)
  {
    FigDebugAssert3();
  }
  else
  {
    LODWORD(v14) = 0.25;
    [(RawNightModeGreenGhost *)self scaleFaceBodyBoundariesWithSizeRatio:v14];
  }
  return v13;
}

- (int)singleBracketDetectionWithLuma:(id)a3 chroma:(id)a4 params:(DetectionTuning *)a5
{
  uint64_t v22 = 0;
  id v8 = a4;
  id v9 = a3;
  unsigned int v10 = [v9 width];
  unsigned int v11 = [v9 height];
  *(void *)&long long v12 = 0;
  *((void *)&v12 + 1) = __PAIR64__(v11, v10);
  long long v20 = v12;
  uint64_t v21 = 1065353216;
  greenGhostCommon = self->_greenGhostCommon;
  maskSB = self->_maskSB;
  long long v15 = *(_OWORD *)&a5[1].var2.var1;
  v19[2] = *(_OWORD *)&a5[1].var0.var1;
  v19[3] = v15;
  v19[4] = *(_OWORD *)&a5[2].var0.var2;
  long long v16 = *(_OWORD *)&a5->var2.var0;
  v19[0] = *(_OWORD *)&a5->var0.var0;
  v19[1] = v16;
  int v17 = [(GreenGhostCommon *)greenGhostCommon detectionWithLuma:v9 croppedLuma:v9 chroma:v8 outputMask:maskSB params:v19 processingROIInfo:&v20];

  if (v17) {
    FigDebugAssert3();
  }
  return v17;
}

- (int)canMitigationProceedWithMaxMaskAverage:(float)a3
{
  *(_DWORD *)[(MTLBuffer *)self->_sumMaskBuffer contents] = 0;
  uint64_t v5 = [(FigMetalContext *)self->_metal commandBuffer];
  int v6 = v5;
  if (v5 && ([v5 computeCommandEncoder], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    [v7 setComputePipelineState:self->_rawNMGreenGhostComputeSumMask];
    [v8 setTexture:self->_maskSB atIndex:0];
    [v8 setBuffer:self->_sumMaskBuffer offset:0 atIndex:0];
    unint64_t v9 = [(MTLComputePipelineState *)self->_rawNMGreenGhostComputeSumMask threadExecutionWidth];
    unint64_t v10 = [(MTLComputePipelineState *)self->_rawNMGreenGhostComputeSumMask maxTotalThreadsPerThreadgroup]/ v9;
    uint64_t v11 = [(MTLTexture *)self->_maskSB width];
    uint64_t v12 = [(MTLTexture *)self->_maskSB height];
    v25[0] = v11;
    v25[1] = v12;
    v25[2] = 1;
    v24[0] = v9;
    v24[1] = v10;
    v24[2] = 1;
    [v8 dispatchThreads:v25 threadsPerThreadgroup:v24];
    [v8 endEncoding];
    [(FigMetalContext *)self->_metal commit];
    [(FigMetalContext *)self->_metal waitForIdle];
    double v13 = (float)*(unsigned int *)[(MTLBuffer *)self->_sumMaskBuffer contents];
    uint64_t v14 = [(MTLTexture *)self->_maskSB width];
    float v15 = v13 / ((float)(unint64_t)([(MTLTexture *)self->_maskSB height] * v14) * 255.0);
    self->_canMitigationProceed = v15 < a3;
    BOOL v16 = v15 > a3;
    int v17 = objc_msgSend(NSNumber, "numberWithFloat:");
    [(NSMutableDictionary *)self->_sidecarMetadata setObject:v17 forKeyedSubscript:@"maskAverage"];

    *(float *)&double v18 = a3;
    int v19 = [NSNumber numberWithFloat:v18];
    [(NSMutableDictionary *)self->_sidecarMetadata setObject:v19 forKeyedSubscript:@"maxMaskAverage"];

    long long v20 = [NSNumber numberWithBool:self->_canMitigationProceed];
    [(NSMutableDictionary *)self->_sidecarMetadata setObject:v20 forKeyedSubscript:@"canMitigationProceed"];

    uint64_t v21 = [NSNumber numberWithBool:v16];
    [(NSMutableDictionary *)self->_sidecarMetadata setObject:v21 forKeyedSubscript:@"exceedsMaxMaskAverage"];

    int v22 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
  }

  return v22;
}

- (int)computeLSCWBGParams
{
  double v3 = -[RawNightModeInputFrame metadata]((uint64_t)self->_referenceFrame);

  if (v3
    && (-[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)self->_referenceFrame),
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4)
    && self->_cameraInfoByPortType)
  {
    uint64_t v5 = -[RawNightModeInputFrame metadata]((uint64_t)self->_referenceFrame);
    cameraInfoByPortType = self->_cameraInfoByPortType;
    v7 = -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)self->_referenceFrame);
    int v8 = +[RawNightModeProcessor populateLSCWBGParamsFromMetadata:v5 cameraInfoByPortType:cameraInfoByPortType lscGainMapParameters:v7 params:self->_anon_300];

    return v8;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)processReferenceFrame:(id)a3 gdcMode:(int)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (dword_26B430EA8)
  {
    int v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  if (!v7 || !self->_tuning) {
    goto LABEL_32;
  }
  [(NSMutableDictionary *)self->_sidecarMetadata setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isEnabled"];
  tuning = self->_tuning;
  if (tuning) {
    [(GreenGhostLowLightTuningParams *)tuning tuningParams];
  }
  else {
    memset(v48, 0, 88);
  }
  long long v51 = *(_OWORD *)((char *)&v48[2] + 8);
  long long v52 = *(_OWORD *)((char *)&v48[3] + 8);
  long long v53 = *(_OWORD *)((char *)&v48[4] + 8);
  long long v49 = *(_OWORD *)((char *)v48 + 8);
  long long v50 = *(_OWORD *)((char *)&v48[1] + 8);
  objc_storeStrong((id *)&self->_referenceFrame, a3);
  self->_gdcMode = a4;
  int v10 = [(RawNightModeGreenGhost *)self defineSensorType];
  if (v10)
  {
    int v27 = v10;
LABEL_35:
    FigDebugAssert3();
    goto LABEL_22;
  }
  int v11 = [(RawNightModeGreenGhost *)self computeLSCWBGParams];
  if (v11)
  {
    int v27 = v11;
    goto LABEL_35;
  }
  uint64_t v12 = (__CVBuffer *)-[RawNightModeInputFrame pixelBuffer]((uint64_t)v7);
  size_t v13 = CVPixelBufferGetWidthOfPlane(v12, 0) >> 2;
  uint64_t v14 = (__CVBuffer *)-[RawNightModeInputFrame pixelBuffer]((uint64_t)v7);
  size_t v15 = CVPixelBufferGetHeightOfPlane(v14, 0) >> 2;
  BOOL v16 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggRefFrameLumaTexture" width:v13 height:v15 pixelFormat:25 compressionDisabled:1];
  refFrameDownscaledLumaTexture = self->_refFrameDownscaledLumaTexture;
  self->_refFrameDownscaledLumaTexture = v16;

  if (!self->_refFrameDownscaledLumaTexture) {
    goto LABEL_32;
  }
  double v18 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggRefFrameChromaTexture" width:v13 height:v15 pixelFormat:65 compressionDisabled:1];
  refFrameDownscaledChromaTexture = self->_refFrameDownscaledChromaTexture;
  self->_refFrameDownscaledChromaTexture = v18;

  if (!self->_refFrameDownscaledChromaTexture) {
    goto LABEL_32;
  }
  int v20 = -[RawNightModeGreenGhost prepareFrame:outputLuma:outputChroma:](self, "prepareFrame:outputLuma:outputChroma:", v7, self->_refFrameDownscaledLumaTexture);
  if (v20)
  {
    int v27 = v20;
    goto LABEL_35;
  }
  uint64_t v21 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggMaskSB" width:v13 height:v15 pixelFormat:25 compressionDisabled:1];
  maskSB = self->_maskSB;
  self->_maskSB = v21;

  if (!self->_maskSB)
  {
LABEL_32:
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_22;
  }
  int v23 = [(RawNightModeGreenGhost *)self singleBracketDetectionWithLuma:self->_refFrameDownscaledLumaTexture chroma:self->_refFrameDownscaledChromaTexture params:&v49];
  if (v23)
  {
    int v27 = v23;
    goto LABEL_35;
  }
  v24 = self->_tuning;
  if (v24)
  {
    [(GreenGhostLowLightTuningParams *)v24 tuningParams];
    LODWORD(v25) = DWORD2(v31);
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    double v25 = 0.0;
    uint64_t v47 = 0;
  }
  int v26 = -[RawNightModeGreenGhost canMitigationProceedWithMaxMaskAverage:](self, "canMitigationProceedWithMaxMaskAverage:", v25, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44,
          v45,
          v46,
          v47);
  if (v26)
  {
    int v27 = v26;
    goto LABEL_35;
  }
  if (self->_canMitigationProceed) {
    [(NSMutableDictionary *)self->_sidecarMetadata setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isRunning"];
  }
  int v27 = 0;
LABEL_22:
  if (!self->_canMitigationProceed) {
    [(RawNightModeGreenGhost *)self releaseTextures];
  }

  return v27;
}

- (int)computeTemporalVariationsNonRefLuma:(id)a3 nonRefProperties:(id)a4 params:(MultiBandDetectionTuning *)a5
{
  id v8 = a3;
  referenceFrame = self->_referenceFrame;
  id v10 = a4;
  int v11 = -[RawNightModeInputFrame properties]((uint64_t)referenceFrame);
  uint64_t v12 = (_OWORD *)[v10 regHomography];
  long long v14 = v12[1];
  long long v13 = v12[2];
  v32[0] = *v12;
  v32[1] = v14;
  v32[2] = v13;
  size_t v15 = [v11 meta];
  uint64_t v16 = [v15 exposureParams];
  int v17 = [v10 meta];

  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v16, [v17 exposureParams], v11);
  float v31 = RelativeBrightnessForProperties;
  BOOL v30 = !self->_isFirstNonRefFrame;
  if (self->_maskMB
    && self->_maxVariationTex
    && ([(FigMetalContext *)self->_metal commandBuffer],
        (int v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v20 = v19;
    uint64_t v21 = [v19 computeCommandEncoder];
    if (v21)
    {
      int v22 = v21;
      [v21 setComputePipelineState:self->_rawNMGreenGhostComputeTmpVar];
      [v22 setImageblockWidth:16 height:16];
      [v22 setTexture:self->_refFrameDownscaledLumaTexture atIndex:0];
      [v22 setTexture:v8 atIndex:1];
      [v22 setTexture:self->_maskSB atIndex:2];
      [v22 setTexture:self->_maxVariationTex atIndex:3];
      [v22 setTexture:self->_maskMB atIndex:4];
      [v22 setBytes:&v31 length:4 atIndex:0];
      [v22 setBytes:v32 length:48 atIndex:1];
      [v22 setBytes:a5 length:8 atIndex:2];
      [v22 setBytes:&v30 length:1 atIndex:3];
      uint64_t v23 = [(MTLTexture *)self->_maskMB width];
      uint64_t v24 = [(MTLTexture *)self->_maskMB height];
      v29[0] = v23;
      v29[1] = v24;
      v29[2] = 1;
      int64x2_t v27 = vdupq_n_s64(0x10uLL);
      uint64_t v28 = 1;
      [v22 dispatchThreads:v29 threadsPerThreadgroup:&v27];
      [v22 endEncoding];
      [(FigMetalContext *)self->_metal commit];

      int v25 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v25 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
  }

  return v25;
}

- (int)guidedFilter:(id)a3 withGuideLuma:(id)a4 guideChroma:(id)a5 params:(LowLightRefinementTuning *)a6 output:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = [v15 width];
  uint64_t v17 = [v15 height];
  id v39 = 0;
  unsigned int var0 = a6->var0;
  float var1 = a6->var1;
  float var2 = a6->var2;
  float v37 = var1;
  if (([v15 width] & 1) != 0
    || ([v15 height] & 1) != 0
    || ([(FigMetalContext *)self->_metal commandBuffer],
        (int v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
    goto LABEL_7;
  }
  int v20 = v19;
  uint64_t v21 = [v19 computeCommandEncoder];
  if (!v21)
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
LABEL_11:

    goto LABEL_7;
  }
  int v22 = (void *)v21;
  uint64_t v23 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"intermTex" width:v16 height:v17 pixelFormat:25 compressionDisabled:1];
  id v39 = v23;
  if (!v23)
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();

    goto LABEL_11;
  }
  uint64_t v24 = v23;
  [v22 setComputePipelineState:self->_rawNMGreenGhostHorzGuidedFilter];
  [v22 setTexture:v12 atIndex:0];
  [v22 setTexture:v13 atIndex:1];
  [v22 setTexture:v14 atIndex:2];
  [v22 setTexture:v24 atIndex:3];
  [v22 setBytes:&var0 length:4 atIndex:0];
  [v22 setBytes:&v37 length:4 atIndex:1];
  unint64_t v25 = [(MTLComputePipelineState *)self->_rawNMGreenGhostHorzGuidedFilter threadExecutionWidth];
  id v26 = v12;
  unint64_t v27 = [(MTLComputePipelineState *)self->_rawNMGreenGhostHorzGuidedFilter maxTotalThreadsPerThreadgroup]/ v25;
  v35[0] = (unint64_t)[v15 width] >> 1;
  v35[1] = (unint64_t)[v15 height] >> 1;
  v35[2] = 1;
  v34[0] = v25;
  v34[1] = v27;
  v34[2] = 1;
  [v22 dispatchThreads:v35 threadsPerThreadgroup:v34];
  [v22 setComputePipelineState:self->_rawNMGreenGhostVertGuidedFilter];
  [v22 setTexture:v24 atIndex:0];
  [v22 setTexture:v13 atIndex:1];
  [v22 setTexture:v14 atIndex:2];
  [v22 setTexture:v15 atIndex:3];
  [v22 setBytes:&var0 length:4 atIndex:0];
  [v22 setBytes:&v37 length:4 atIndex:1];
  [v22 setBytes:&var2 length:4 atIndex:2];
  unint64_t v28 = [(MTLComputePipelineState *)self->_rawNMGreenGhostVertGuidedFilter threadExecutionWidth];
  unint64_t v29 = [(MTLComputePipelineState *)self->_rawNMGreenGhostVertGuidedFilter maxTotalThreadsPerThreadgroup]/ v28;
  v33[0] = (unint64_t)[v15 width] >> 1;
  v33[1] = (unint64_t)[v15 height] >> 1;
  v33[2] = 1;
  v32[0] = v28;
  v32[1] = v29;
  id v12 = v26;
  v32[2] = 1;
  [v22 dispatchThreads:v33 threadsPerThreadgroup:v32];
  [v22 endEncoding];
  [(FigMetalContext *)self->_metal commit];
  FigMetalDecRef();

  int v30 = 0;
LABEL_7:

  return v30;
}

- (int)refineMaskWithGuideLuma:(id)a3 guideChroma:(id)a4 params:(LowLightRefinementTuning *)a5 maskMBBinary:(id)a6
{
  id v30 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(MTLTexture *)self->_maskMB width];
  uint64_t v13 = [(MTLTexture *)self->_maskMB height];
  id v33 = 0;
  id v34 = 0;
  if ([(MTLTexture *)self->_maskMB width]) {
    goto LABEL_16;
  }
  if ([(MTLTexture *)self->_maskMB height]) {
    goto LABEL_16;
  }
  id v14 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"intermMask1" width:v12 height:v13 pixelFormat:25 compressionDisabled:1];
  id v34 = v14;
  if (!v14) {
    goto LABEL_16;
  }
  id v15 = v14;
  int v16 = [(RawNightModeGreenGhost *)self guidedFilter:self->_maskMB withGuideLuma:v30 guideChroma:v10 params:a5 output:v14];
  if (v16)
  {
    int v20 = v16;
    goto LABEL_15;
  }
  uint64_t v17 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"intermMask2" width:v12 height:v13 pixelFormat:25 compressionDisabled:1];
  id v33 = v17;
  if (!v17) {
    goto LABEL_16;
  }
  int v19 = v17;
  *(float *)&double v18 = a5->var3;
  int v20 = [(GreenGhostCommon *)self->_greenGhostCommon dilateTexture:v15 withNormalizedRadius:v17 output:v18];
  FigMetalDecRef();
  if (v20)
  {
LABEL_15:
    FigDebugAssert3();
    goto LABEL_10;
  }
  uint64_t v21 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v21)
  {
LABEL_16:
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    goto LABEL_10;
  }
  int v22 = v21;
  uint64_t v23 = [v21 computeCommandEncoder];
  if (v23)
  {
    uint64_t v24 = v23;
    [v23 setComputePipelineState:self->_rawNMGreenGhostRefineMask];
    [v24 setTexture:v19 atIndex:0];
    [v24 setTexture:self->_maskMB atIndex:1];
    [v24 setTexture:v11 atIndex:2];
    [v24 setBytes:&a5->var4 length:4 atIndex:0];
    unint64_t v25 = [(MTLComputePipelineState *)self->_rawNMGreenGhostRefineMask threadExecutionWidth];
    unint64_t v26 = [(MTLComputePipelineState *)self->_rawNMGreenGhostRefineMask maxTotalThreadsPerThreadgroup]/ v25;
    unint64_t v27 = (unint64_t)[(MTLTexture *)self->_maskMB width] >> 1;
    unint64_t v28 = [(MTLTexture *)self->_maskMB height];
    v32[0] = v27;
    v32[1] = v28 >> 1;
    v32[2] = 1;
    v31[0] = v25;
    v31[1] = v26;
    v31[2] = 1;
    [v24 dispatchThreads:v32 threadsPerThreadgroup:v31];
    [v24 endEncoding];
    [(FigMetalContext *)self->_metal commit];

    int v20 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
  }
LABEL_10:
  FigMetalDecRef();
  FigMetalDecRef();

  return v20;
}

- (int)updateDetectionWithNonRefLuma:(id)a3 maskMBBinary:(id)a4 properties:(id)a5 params:(LowLightTuning *)a6
{
  id v10 = a4;
  int v11 = [(RawNightModeGreenGhost *)self computeTemporalVariationsNonRefLuma:a3 nonRefProperties:a5 params:&a6[6].maxMaskAverage];
  if (v11)
  {
    int v12 = v11;
    goto LABEL_5;
  }
  int v12 = [(RawNightModeGreenGhost *)self refineMaskWithGuideLuma:self->_refFrameDownscaledLumaTexture guideChroma:self->_refFrameDownscaledChromaTexture params:&a6[7] maskMBBinary:v10];
  if (v12) {
LABEL_5:
  }
    FigDebugAssert3();

  return v12;
}

- (int)computeFusionWeightsNonRefLuma:(id)a3 nonRefChroma:(id)a4 maskMBBinary:(id)a5 nonRefProperties:(id)a6 output:(id)a7 params:(LowLightFusionTuning *)a8
{
  id v62 = a3;
  id v63 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  uint64_t v16 = [v14 width];
  id v59 = v14;
  uint64_t v17 = [v14 height];
  double v18 = (_OWORD *)[v15 regHomography];
  long long v20 = v18[1];
  long long v19 = v18[2];
  v73[0] = *v18;
  v73[1] = v20;
  v73[2] = v19;
  uint64_t v21 = -[RawNightModeInputFrame properties]((uint64_t)self->_referenceFrame);
  int v22 = [v21 meta];
  uint64_t v23 = [v22 exposureParams];
  uint64_t v24 = [v15 meta];

  v58 = v21;
  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v23, [v24 exposureParams], v21);

  float v72 = RelativeBrightnessForProperties;
  id v70 = 0;
  id v68 = 0;
  id v69 = 0;
  unint64_t v26 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"innerMask" width:v16 height:v17 pixelFormat:25 compressionDisabled:1];
  id v71 = v26;
  if (!v26) {
    goto LABEL_23;
  }
  unint64_t v27 = v26;
  unint64_t v28 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"outerMask" width:v16 height:v17 pixelFormat:25 compressionDisabled:1];
  id v70 = v28;
  if (!v28) {
    goto LABEL_23;
  }
  unint64_t v29 = v28;
  id v30 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"diffTex" width:v16 height:v17 pixelFormat:25 compressionDisabled:1];
  id v69 = v30;
  if (!v30) {
    goto LABEL_23;
  }
  float v31 = v30;
  long long v32 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"intermediateFusionWeights" width:v16 height:v17 pixelFormat:25 compressionDisabled:1];
  id v68 = v32;
  if (!v32) {
    goto LABEL_23;
  }
  id v33 = v32;
  unint64_t v34 = [v13 width];
  unint64_t v35 = [v13 height];
  if (v34 <= v35) {
    unint64_t v37 = v35;
  }
  else {
    unint64_t v37 = v34;
  }
  *(float *)&double v36 = 1.0 / (float)v37;
  int v38 = [(GreenGhostCommon *)self->_greenGhostCommon erodeTexture:v13 withNormalizedRadius:v27 output:v36];
  if (v38)
  {
    int v55 = v38;
    FigDebugAssert3();
LABEL_24:
    long long v45 = v59;
    goto LABEL_17;
  }
  id v39 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v39)
  {
LABEL_23:
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();
    goto LABEL_24;
  }
  long long v40 = v39;
  id v60 = v13;
  long long v41 = [v39 computeCommandEncoder];
  if (v41)
  {
    long long v42 = v41;
    v57 = v40;
    [v41 setComputePipelineState:self->_rawNMGreenGhostComputeNeighborDiff];
    [v42 setTexture:self->_refFrameDownscaledLumaTexture atIndex:0];
    [v42 setTexture:self->_refFrameDownscaledChromaTexture atIndex:1];
    [v42 setTexture:v62 atIndex:2];
    [v42 setTexture:v63 atIndex:3];
    [v42 setTexture:v60 atIndex:4];
    [v42 setTexture:v27 atIndex:5];
    [v42 setTexture:v31 atIndex:6];
    [v42 setTexture:v29 atIndex:7];
    [v42 setBytes:&v72 length:4 atIndex:0];
    [v42 setBytes:v73 length:48 atIndex:1];
    [v42 setBytes:a8 length:40 atIndex:2];
    unint64_t v43 = [(MTLComputePipelineState *)self->_rawNMGreenGhostComputeNeighborDiff threadExecutionWidth];
    unint64_t v44 = [(MTLComputePipelineState *)self->_rawNMGreenGhostComputeNeighborDiff maxTotalThreadsPerThreadgroup]/ v43;
    v67[0] = [v29 width];
    v67[1] = [v29 height];
    v67[2] = 1;
    v66[0] = v43;
    v66[1] = v44;
    v66[2] = 1;
    [v42 dispatchThreads:v67 threadsPerThreadgroup:v66];
    [v42 setComputePipelineState:self->_rawNMGreenGhostComputeFuseWeights];
    [v42 setTexture:v29 atIndex:0];
    [v42 setTexture:v27 atIndex:1];
    [v42 setTexture:v31 atIndex:2];
    [v42 setTexture:v62 atIndex:3];
    [v42 setTexture:v63 atIndex:4];
    [v42 setTexture:self->_maskMB atIndex:5];
    long long v45 = v59;
    [v42 setTexture:v59 atIndex:6];
    [v42 setBytes:&v72 length:4 atIndex:0];
    [v42 setBytes:v73 length:48 atIndex:1];
    [v42 setBytes:a8 length:40 atIndex:2];
    [v42 setBytes:&self->_faceBodyBoundariesDownscaled length:352 atIndex:3];
    unint64_t v46 = [(MTLComputePipelineState *)self->_rawNMGreenGhostComputeFuseWeights threadExecutionWidth];
    unint64_t v47 = [(MTLComputePipelineState *)self->_rawNMGreenGhostComputeFuseWeights maxTotalThreadsPerThreadgroup]/ v46;
    v65[0] = [v31 width];
    v65[1] = [v31 height];
    v65[2] = 1;
    v64[0] = v46;
    v64[1] = v47;
    v64[2] = 1;
    [v42 dispatchThreads:v65 threadsPerThreadgroup:v64];
    [v42 endEncoding];
    [(FigMetalContext *)self->_metal commit];
    *(float *)&double v48 = a8[1].var1;
    int v49 = [(GreenGhostCommon *)self->_greenGhostCommon erodeTexture:v59 withNormalizedRadius:v33 output:v48];
    if (v49
      || (int v49 = [(GreenGhostCommon *)self->_greenGhostCommon boxFilter:v33 withRadius:a8[1].var2 output:v59]) != 0)
    {
      int v55 = v49;
      FigDebugAssert3();
    }
    else
    {
      long long v50 = [(NSMutableDictionary *)self->_sidecarMetadata objectForKeyedSubscript:@"RelativeBrightness"];

      if (!v50)
      {
        long long v51 = objc_opt_new();
        [(NSMutableDictionary *)self->_sidecarMetadata setObject:v51 forKeyedSubscript:@"RelativeBrightness"];
      }
      long long v52 = [(NSMutableDictionary *)self->_sidecarMetadata objectForKeyedSubscript:@"RelativeBrightness"];
      *(float *)&double v53 = v72;
      uint64_t v54 = [NSNumber numberWithFloat:v53];
      [v52 addObject:v54];

      int v55 = 0;
    }
    id v13 = v60;
  }
  else
  {
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();

    long long v45 = v59;
  }
LABEL_17:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v55;
}

- (int)runFusionWithNonRefFrame:(id)a3 fusionWeights:(id)a4 output:(id)a5 params:(LowLightFusionTuning *)a6
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 width];
  uint64_t v13 = [v10 height];
  id v14 = -[RawNightModeInputFrame properties]((uint64_t)self->_referenceFrame);
  id v15 = -[RawNightModeInputFrame properties]((uint64_t)v9);
  uint64_t v16 = (long long *)[v15 regHomography];
  long long v17 = v16[1];
  long long v119 = *v16;
  long long v120 = v17;
  long long v121 = v16[2];
  double v18 = [v14 meta];
  uint64_t v19 = [v18 exposureParams];
  id v62 = v15;
  long long v20 = [v15 meta];
  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v19, [v20 exposureParams], v14);

  memset(&v118[8], 0, 114);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  memset(v118, 0, 114);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  int v22 = -[RawNightModeInputFrame firstPix]((uint64_t)self->_referenceFrame);
  if (self->_isFirstNonRefFrame && !self->_ggFusionWeightsAcc)
  {
    uint64_t v23 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"_ggFusionWeightsAcc" width:v12 height:v13 pixelFormat:25 compressionDisabled:1];
    ggFusionWeightsAcc = self->_ggFusionWeightsAcc;
    self->_ggFusionWeightsAcc = v23;
  }
  if (!self->_ggFusionWeightsAcc) {
    goto LABEL_18;
  }
  unint64_t v25 = -[RawNightModeInputFrame lscGainsTex]((uint64_t)self->_referenceFrame);

  if (!v25) {
    goto LABEL_18;
  }
  unsigned int sensorType = self->_sensorType;
  int gdcMode = self->_gdcMode;
  BOOL v28 = gdcMode != 0;
  BOOL v29 = sensorType == 2;
  if (gdcMode)
  {
    if (!-[RawNightModeInputFrame gdcParams]((uint64_t)self->_referenceFrame)) {
      goto LABEL_18;
    }
    id v30 = (_OWORD *)-[RawNightModeInputFrame gdcParams]((uint64_t)self->_referenceFrame);
    long long v31 = v30[2];
    *(_OWORD *)((char *)&v118[11] + 2) = v30[3];
    long long v32 = v30[5];
    *(_OWORD *)((char *)&v118[12] + 2) = v30[4];
    *(_OWORD *)((char *)&v118[13] + 2) = v32;
    *(_OWORD *)((char *)&v118[14] + 2) = v30[6];
    long long v33 = v30[1];
    *(_OWORD *)((char *)&v118[8] + 2) = *v30;
    *(_OWORD *)((char *)&v118[9] + 2) = v33;
    *(_OWORD *)((char *)&v118[10] + 2) = v31;
    unint64_t v34 = (long long *)-[RawNightModeInputFrame gdcParams]((uint64_t)self->_referenceFrame);
    long long v35 = v34[5];
    long long v115 = v34[4];
    long long v116 = v35;
    long long v117 = v34[6];
    long long v36 = v34[1];
    long long v111 = *v34;
    long long v112 = v36;
    long long v37 = v34[3];
    long long v113 = v34[2];
    long long v114 = v37;
    if (!-[RawNightModeInputFrame gdcParams]((uint64_t)v9)) {
      goto LABEL_18;
    }
    int v38 = (_OWORD *)-[RawNightModeInputFrame gdcParams]((uint64_t)v9);
    long long v39 = v38[2];
    *(_OWORD *)((char *)&v118[3] + 2) = v38[3];
    long long v40 = v38[5];
    *(_OWORD *)((char *)&v118[4] + 2) = v38[4];
    *(_OWORD *)((char *)&v118[5] + 2) = v40;
    *(_OWORD *)((char *)&v118[6] + 2) = v38[6];
    long long v41 = v38[1];
    *(_OWORD *)((char *)v118 + 2) = *v38;
    *(_OWORD *)((char *)&v118[1] + 2) = v41;
    *(_OWORD *)((char *)&v118[2] + 2) = v39;
    long long v42 = (long long *)-[RawNightModeInputFrame gdcParams]((uint64_t)self->_referenceFrame);
    long long v43 = v42[5];
    long long v108 = v42[4];
    long long v109 = v43;
    long long v110 = v42[6];
    long long v44 = v42[1];
    long long v104 = *v42;
    long long v105 = v44;
    long long v45 = v42[3];
    long long v106 = v42[2];
    long long v107 = v45;
    unsigned int sensorType = self->_sensorType;
  }
  BOOL isFirstNonRefFrame = self->_isFirstNonRefFrame;
  long long v47 = *MEMORY[0x263EF89A0];
  long long v48 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  v66[0] = 0u;
  v66[1] = v47;
  LOBYTE(v66[0]) = isFirstNonRefFrame;
  *((float *)v66 + 1) = RelativeBrightnessForProperties;
  long long v49 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  v66[2] = v48;
  void v66[3] = v49;
  v66[6] = v121;
  v66[4] = v119;
  v66[5] = v120;
  *(void *)v67 = sensorType;
  *(_DWORD *)&v67[8] = v22;
  v67[12] = v29;
  v67[13] = v28;
  __int16 v74 = v118[15];
  long long v73 = v118[14];
  long long v72 = v118[13];
  long long v71 = v118[12];
  long long v70 = v118[11];
  long long v69 = v118[10];
  long long v68 = v118[9];
  *(_OWORD *)&v67[14] = v118[8];
  long long v75 = v111;
  long long v76 = v112;
  long long v80 = v116;
  long long v81 = v117;
  long long v78 = v114;
  long long v79 = v115;
  long long v77 = v113;
  uint64_t v82 = 0;
  int v83 = v22;
  BOOL v84 = v29;
  BOOL v85 = v28;
  long long v88 = v118[2];
  long long v89 = v118[3];
  long long v86 = v118[0];
  long long v87 = v118[1];
  long long v91 = v118[5];
  long long v92 = v118[6];
  long long v90 = v118[4];
  __int16 v93 = v118[7];
  long long v94 = v104;
  long long v95 = v105;
  long long v99 = v109;
  long long v100 = v110;
  long long v97 = v107;
  long long v98 = v108;
  long long v96 = v106;
  uint64_t v101 = 0;
  long long v50 = *(_OWORD *)&self->_anon_300[16];
  long long v102 = *(_OWORD *)self->_anon_300;
  long long v103 = v50;
  long long v51 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v51)
  {
LABEL_18:
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    goto LABEL_13;
  }
  long long v52 = v51;
  double v53 = [v51 computeCommandEncoder];
  if (v53)
  {
    uint64_t v54 = v53;
    [v53 setComputePipelineState:self->_rawNMGreenGhostFusion];
    [v54 setImageblockWidth:32 height:32];
    int v55 = -[RawNightModeInputFrame textures]((uint64_t)self->_referenceFrame);
    v56 = [v55 objectAtIndexedSubscript:0];
    [v54 setTexture:v56 atIndex:0];

    v57 = -[RawNightModeInputFrame textures]((uint64_t)v9);
    v58 = [v57 objectAtIndexedSubscript:0];
    [v54 setTexture:v58 atIndex:1];

    [v54 setTexture:self->_maskMB atIndex:2];
    [v54 setTexture:v10 atIndex:3];
    [v54 setTexture:self->_ggFusionWeightsAcc atIndex:4];
    [v54 setTexture:v11 atIndex:5];
    [v54 setTexture:0 atIndex:6];
    [v54 setTexture:0 atIndex:7];
    id v59 = -[RawNightModeInputFrame lscGainsTex]((uint64_t)self->_referenceFrame);
    [v54 setTexture:v59 atIndex:8];

    [v54 setBytes:v66 length:640 atIndex:0];
    v65[0] = (unint64_t)[v11 width] >> 1;
    v65[1] = (unint64_t)[v11 height] >> 1;
    v65[2] = 1;
    int64x2_t v63 = vdupq_n_s64(0x10uLL);
    uint64_t v64 = 1;
    [v54 dispatchThreads:v65 threadsPerThreadgroup:&v63];
    [v54 endEncoding];
    [(FigMetalContext *)self->_metal commit];

    int v60 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
  }
LABEL_13:

  return v60;
}

- (int)updateFusionWeights:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 width];
  uint64_t v6 = [v4 height];
  if (self->_isFirstNonRefFrame && !self->_ggMaxFusionWeights)
  {
    id v7 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"_ggMaxFusionWeights" width:v5 height:v6 pixelFormat:25 compressionDisabled:1];
    ggMaxFusionWeights = self->_ggMaxFusionWeights;
    self->_ggMaxFusionWeights = v7;
  }
  if (self->_ggMaxFusionWeights
    && ([(FigMetalContext *)self->_metal commandBuffer],
        (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = v9;
    id v11 = [v9 computeCommandEncoder];
    if (v11)
    {
      uint64_t v12 = v11;
      [v11 setComputePipelineState:self->_rawNMGreenGhostUpdateWeights];
      [v12 setImageblockWidth:16 height:16];
      [v12 setTexture:v4 atIndex:0];
      [v12 setTexture:self->_maskMB atIndex:1];
      [v12 setTexture:self->_ggFusionWeightsAcc atIndex:2];
      [v12 setTexture:self->_ggMaxFusionWeights atIndex:3];
      [v12 setBytes:&self->_isFirstNonRefFrame length:1 atIndex:0];
      v17[0] = [v4 width];
      v17[1] = [v4 height];
      v17[2] = 1;
      int64x2_t v15 = vdupq_n_s64(0x10uLL);
      uint64_t v16 = 1;
      [v12 dispatchThreads:v17 threadsPerThreadgroup:&v15];
      [v12 endEncoding];
      [(FigMetalContext *)self->_metal commit];

      int v13 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v13 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
  }

  return v13;
}

- (int)fuseNonRefFrame:(id)a3 downscaledLuma:(id)a4 downscaledChroma:(id)a5 maskMBBinary:(id)a6 output:(id)a7 params:(LowLightTuning *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = +[RawNightModeProcessor createMetalTextureWithMetalContext:label:width:height:pixelFormat:compressionDisabled:](RawNightModeProcessor, "createMetalTextureWithMetalContext:label:width:height:pixelFormat:compressionDisabled:", self->_metal, @"currentFusionWeights", [v17 width], objc_msgSend(v17, "height"), 25, 1);
  unint64_t v26 = (void *)v19;
  if (!v19)
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    goto LABEL_5;
  }
  uint64_t v20 = v19;
  p_maxMaskAverage = (char *)&a8[8].maxMaskAverage;
  int v22 = -[RawNightModeInputFrame properties]((uint64_t)v14);
  int v23 = [(RawNightModeGreenGhost *)self computeFusionWeightsNonRefLuma:v15 nonRefChroma:v16 maskMBBinary:v17 nonRefProperties:v22 output:v20 params:&a8[8].maxMaskAverage];

  if (v23) {
    goto LABEL_9;
  }
  int v24 = [(RawNightModeGreenGhost *)self runFusionWithNonRefFrame:v14 fusionWeights:v20 output:v18 params:p_maxMaskAverage];
  if (v24)
  {
    int v23 = v24;
    goto LABEL_9;
  }
  int v23 = [(RawNightModeGreenGhost *)self updateFusionWeights:v20];
  if (v23) {
LABEL_9:
  }
    FigDebugAssert3();
LABEL_5:
  FigMetalDecRef();

  return v23;
}

- (int)processNonReferenceFrame:(id)a3 forBatch:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (dword_26B430EA8)
  {
    id v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v63 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0;
  type = 0;
  long long v44 = 0;
  [(RawNightModeInputFrame *)self->_referenceFrame normalisedGlobalSharpness];
  float v10 = v9;
  [v6 normalisedGlobalSharpness];
  if (!self->_canMitigationProceed) {
    goto LABEL_22;
  }
  if (!v6) {
    goto LABEL_32;
  }
  if (!v7) {
    goto LABEL_32;
  }
  tuning = self->_tuning;
  if (!tuning) {
    goto LABEL_32;
  }
  float v13 = v11;
  [(GreenGhostLowLightTuningParams *)tuning tuningParams];
  if (v10 <= 0.0)
  {
    if (dword_26B430EA8)
    {
LABEL_21:
      BOOL v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    if ((float)(v13 / v10) >= *((float *)&v47 + 1))
    {
      id v14 = -[RawNightModeInputFrame properties]((uint64_t)v6);
      char v15 = [v14 hasValidRegistration];

      if (v15)
      {
        id v16 = (__CVBuffer *)-[RawNightModeInputFrame pixelBuffer]((uint64_t)v6);
        size_t v17 = CVPixelBufferGetWidthOfPlane(v16, 0) >> 2;
        id v18 = (__CVBuffer *)-[RawNightModeInputFrame pixelBuffer]((uint64_t)v6);
        size_t v19 = CVPixelBufferGetHeightOfPlane(v18, 0) >> 2;
        uint64_t v20 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggNonRefFrameLumaTexture" width:v17 height:v19 pixelFormat:25 compressionDisabled:1];
        type = (void *)v20;
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggNonRefFrameChromaTexture" width:v17 height:v19 pixelFormat:65 compressionDisabled:1];
          long long v45 = (void *)v22;
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggMaskMBBinary" width:v17 height:v19 pixelFormat:25 compressionDisabled:1];
            long long v44 = (void *)v24;
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v43 = v23;
              int v26 = [(RawNightModeGreenGhost *)self prepareFrame:v6 outputLuma:v21 outputChroma:v23];
              if (v26)
              {
                int v30 = v26;
                goto LABEL_40;
              }
              if (!self->_isFirstNonRefFrame) {
                goto LABEL_29;
              }
              int v27 = [(RawNightModeGreenGhost *)self extractFaceBodyBoundariesWithFaceBoundaryPaddingRatio:*(double *)&v48];
              if (v27)
              {
                int v30 = v27;
                goto LABEL_40;
              }
              BOOL v28 = self->_faceBodyBoundaries.nFaces || (unint64_t)(*(_DWORD *)&self->_anon_44[172] != 0);
              long long v32 = [NSNumber numberWithBool:v28];
              [(NSMutableDictionary *)self->_sidecarMetadata setObject:v32 forKeyedSubscript:@"foundFacesOrBodies"];

              if (self->_maxVariationTex
                || (+[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"_maxVariationTex" width:v17 height:v19 pixelFormat:25 compressionDisabled:1], long long v33 = (MTLTexture *)objc_claimAutoreleasedReturnValue(), maxVariationTex = self->_maxVariationTex, self->_maxVariationTex = v33, maxVariationTex, self->_maxVariationTex))
              {
                if (self->_maskMB
                  || (+[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"_maskMB" width:v17 height:v19 pixelFormat:25 compressionDisabled:1], long long v35 = (MTLTexture *)objc_claimAutoreleasedReturnValue(), maskMB = self->_maskMB, self->_maskMB = v35, maskMB, self->_maskMB))
                {
LABEL_29:
                  long long v37 = -[RawNightModeInputFrame properties]((uint64_t)v6);
                  int v30 = [(RawNightModeGreenGhost *)self updateDetectionWithNonRefLuma:v21 maskMBBinary:v25 properties:v37 params:&v47];

                  if (!v30)
                  {
                    int v38 = [v7 accumulator];
                    long long v39 = [v38 bandTextures];
                    long long v40 = [v39 objectAtIndexedSubscript:0];
                    int v30 = [(RawNightModeGreenGhost *)self fuseNonRefFrame:v6 downscaledLuma:v21 downscaledChroma:v43 maskMBBinary:v25 output:v40 params:&v47];

                    if (!v30)
                    {
                      self->_BOOL isFirstNonRefFrame = 0;
                      ++self->_nonRefFramesCount;
                      goto LABEL_23;
                    }
                  }
LABEL_40:
                  FigDebugAssert3();
                  goto LABEL_23;
                }
              }
            }
          }
        }
LABEL_32:
        FigDebugAssert3();
        int v30 = FigSignalErrorAt();
        goto LABEL_23;
      }
    }
    if (dword_26B430EA8) {
      goto LABEL_21;
    }
  }
LABEL_22:
  int v30 = 0;
LABEL_23:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v30;
}

- (int)mixRefFrameWithAccumulator:(id)a3
{
  id v79 = 0;
  uint64_t v5 = [a3 bandTextures];
  id v6 = [v5 objectAtIndexedSubscript:0];

  memset(v78, 0, sizeof(v78));
  int v77 = 0;
  if (self->_canMitigationProceed && self->_maskMB && self->_ggFusionWeightsAcc)
  {
    if (!a3) {
      goto LABEL_29;
    }
    if (!self->_tuning) {
      goto LABEL_29;
    }
    id v7 = -[RawNightModeInputFrame lscGainsTex]((uint64_t)self->_referenceFrame);

    if (!v7) {
      goto LABEL_29;
    }
    tuning = self->_tuning;
    if (tuning)
    {
      [(GreenGhostLowLightTuningParams *)tuning tuningParams];
      float v9 = self->_tuning;
      int v10 = DWORD2(v70);
      if (v9)
      {
        [(GreenGhostLowLightTuningParams *)v9 tuningParams];
        int v11 = HIDWORD(v53);
        goto LABEL_12;
      }
    }
    else
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      int v10 = 0;
      uint64_t v76 = 0;
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    int v11 = 0;
    uint64_t v59 = 0;
LABEL_12:
    int v77 = v11;
    LODWORD(v78[0]) = -[RawNightModeInputFrame firstPix]((uint64_t)self->_referenceFrame);
    int sensorType = self->_sensorType;
    int gdcMode = self->_gdcMode;
    BYTE5(v78[0]) = gdcMode != 0;
    BYTE4(v78[0]) = sensorType == 2;
    if (gdcMode)
    {
      if (!-[RawNightModeInputFrame gdcParams]((uint64_t)self->_referenceFrame)) {
        goto LABEL_29;
      }
      id v14 = (_OWORD *)-[RawNightModeInputFrame gdcParams]((uint64_t)self->_referenceFrame);
      long long v16 = v14[1];
      long long v15 = v14[2];
      *(_OWORD *)((char *)v78 + 8) = *v14;
      *(_OWORD *)((char *)&v78[1] + 8) = v16;
      *(_OWORD *)((char *)&v78[2] + 8) = v15;
      long long v17 = v14[5];
      long long v18 = v14[6];
      long long v19 = v14[4];
      *(_OWORD *)((char *)&v78[3] + 8) = v14[3];
      *(_OWORD *)((char *)&v78[6] + 8) = v18;
      *(_OWORD *)((char *)&v78[5] + 8) = v17;
      *(_OWORD *)((char *)&v78[4] + 8) = v19;
      uint64_t v20 = (_OWORD *)-[RawNightModeInputFrame gdcParams]((uint64_t)self->_referenceFrame);
      long long v22 = v20[1];
      long long v21 = v20[2];
      *(_OWORD *)((char *)&v78[7] + 8) = *v20;
      *(_OWORD *)((char *)&v78[8] + 8) = v22;
      *(_OWORD *)((char *)&v78[9] + 8) = v21;
      long long v23 = v20[5];
      long long v24 = v20[6];
      long long v25 = v20[4];
      *(_OWORD *)((char *)&v78[10] + 8) = v20[3];
      *(_OWORD *)((char *)&v78[13] + 8) = v24;
      *(_OWORD *)((char *)&v78[12] + 8) = v23;
      *(_OWORD *)((char *)&v78[11] + 8) = v25;
    }
    int v26 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggInnerMask" width:[(MTLTexture *)self->_maskMB width] height:[(MTLTexture *)self->_maskMB height] pixelFormat:25 compressionDisabled:1];
    id v79 = v26;
    if (v26)
    {
      BOOL v28 = v26;
      LODWORD(v27) = v10;
      int v29 = [(GreenGhostCommon *)self->_greenGhostCommon erodeTexture:self->_maskMB withNormalizedRadius:v26 output:v27];
      if (v29)
      {
        int v38 = v29;
        FigDebugAssert3();
        goto LABEL_21;
      }
      int v30 = [(FigMetalContext *)self->_metal commandBuffer];
      if (v30)
      {
        long long v31 = v30;
        long long v32 = [v30 computeCommandEncoder];
        if (!v32)
        {
          FigDebugAssert3();
          int v38 = FigSignalErrorAt();

          goto LABEL_21;
        }
        long long v33 = v32;
        [v32 setComputePipelineState:self->_rawNMGreenGhostMixFusedAndReference];
        [v33 setImageblockWidth:32 height:32];
        unint64_t v34 = -[RawNightModeInputFrame textures]((uint64_t)self->_referenceFrame);
        long long v35 = [v34 objectAtIndexedSubscript:0];
        [v33 setTexture:v35 atIndex:0];

        [v33 setTexture:v28 atIndex:1];
        [v33 setTexture:self->_ggFusionWeightsAcc atIndex:2];
        [v33 setTexture:0 atIndex:3];
        [v33 setTexture:0 atIndex:4];
        long long v36 = -[RawNightModeInputFrame lscGainsTex]((uint64_t)self->_referenceFrame);
        [v33 setTexture:v36 atIndex:5];

        [v33 setTexture:v6 atIndex:6];
        [v33 setBytes:&v77 length:4 atIndex:0];
        long long v37 = -[RawNightModeInputFrame properties]((uint64_t)self->_referenceFrame);
        objc_msgSend(v33, "setBytes:length:atIndex:", objc_msgSend(v37, "regHomography"), 48, 1);

        [v33 setBytes:&self->_sensorType length:4 atIndex:2];
        [v33 setBytes:v78 length:240 atIndex:3];
        [v33 setBytes:self->_anon_300 length:32 atIndex:4];
        v42[0] = (unint64_t)[v6 width] >> 1;
        v42[1] = (unint64_t)[v6 height] >> 1;
        v42[2] = 1;
        int64x2_t v40 = vdupq_n_s64(0x10uLL);
        uint64_t v41 = 1;
        [v33 dispatchThreads:v42 threadsPerThreadgroup:&v40];
        [v33 endEncoding];
        [(FigMetalContext *)self->_metal commit];

        goto LABEL_20;
      }
    }
LABEL_29:
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
    goto LABEL_21;
  }
LABEL_20:
  int v38 = 0;
LABEL_21:
  FigMetalDecRef();

  return v38;
}

- (int)updateMaskComputeGradientsFor:(id)a3 outputMask:(id)a4 outputGradient:(id)a5 params:(LowLightInpaintTuning *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v30 = a5;
  int v35 = 1054168405;
  uint64_t v12 = [v11 width];
  uint64_t v13 = [v11 height];
  uint64_t v34 = *(void *)&a6->var0;
  id v14 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggIntermediateMask" width:v12 height:v13 pixelFormat:25 compressionDisabled:1];
  id v33 = v14;
  if (v14)
  {
    long long v15 = v14;
    long long v16 = [(FigMetalContext *)self->_metal commandBuffer];
    long long v17 = v16;
    if (v16)
    {
      long long v18 = [v16 computeCommandEncoder];
      long long v19 = v18;
      if (v18)
      {
        [v18 setComputePipelineState:self->_rawNMGreenGhostUpdateMaskGrad];
        id v29 = v10;
        [v19 setTexture:v10 atIndex:0];
        [v19 setTexture:self->_ggMaxFusionWeights atIndex:1];
        [v19 setTexture:v11 atIndex:2];
        [v19 setTexture:v30 atIndex:3];
        [v19 setTexture:v15 atIndex:4];
        [v19 setBytes:&v34 length:8 atIndex:0];
        [v19 setBytes:&v35 length:4 atIndex:1];
        unint64_t v20 = [(MTLComputePipelineState *)self->_rawNMGreenGhostUpdateMaskGrad threadExecutionWidth];
        unint64_t v21 = [(MTLComputePipelineState *)self->_rawNMGreenGhostUpdateMaskGrad maxTotalThreadsPerThreadgroup];
        v32[0] = v12;
        v32[1] = v13;
        v32[2] = 1;
        v31[0] = v20;
        v31[1] = v21 / v20;
        v31[2] = 1;
        [v19 dispatchThreads:v32 threadsPerThreadgroup:v31];
        [v19 endEncoding];
        [(FigMetalContext *)self->_metal commit];
        float var2 = (float)a6->var2;
        unint64_t v23 = [v15 width];
        unint64_t v24 = [v15 height];
        if (v23 <= v24) {
          unint64_t v26 = v24;
        }
        else {
          unint64_t v26 = v23;
        }
        *(float *)&double v25 = var2 / (float)v26;
        int v27 = [(GreenGhostCommon *)self->_greenGhostCommon dilateTexture:v15 withNormalizedRadius:v11 output:v25];
        if (v27) {
          FigDebugAssert3();
        }
        id v10 = v29;
      }
      else
      {
        FigDebugAssert3();
        int v27 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v27 = FigSignalErrorAt();
      long long v19 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    long long v19 = 0;
    long long v17 = 0;
  }
  FigMetalDecRef();

  return v27;
}

- (int)propagateRGB:(id)a3 gradient:(id)a4 outputRGB:(id)a5 outputGradient:(id)a6 params:(LowLightInpaintTuning *)a7
{
  id v12 = a3;
  id v30 = a4;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = [(MTLTexture *)self->_maskMB width];
  unint64_t v16 = [(MTLTexture *)self->_maskMB height];
  float var0 = a7->var5.var0;
  long long v17 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggDilatedMask" width:v15 height:v16 pixelFormat:25 compressionDisabled:1];
  id v33 = v17;
  if (!v17) {
    goto LABEL_12;
  }
  long long v19 = v17;
  if (v15 <= v16) {
    unint64_t v20 = v16;
  }
  else {
    unint64_t v20 = v15;
  }
  *(float *)&double v18 = 1.0 / (float)v20;
  int v21 = [(GreenGhostCommon *)self->_greenGhostCommon dilateTexture:self->_maskMB withNormalizedRadius:v17 output:v18];
  if (v21)
  {
    int v28 = v21;
    FigDebugAssert3();
    goto LABEL_9;
  }
  long long v22 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v22)
  {
LABEL_12:
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
    goto LABEL_9;
  }
  unint64_t v23 = v22;
  unint64_t v24 = [v22 computeCommandEncoder];
  if (v24)
  {
    double v25 = v24;
    [v24 setComputePipelineState:self->_rawNMGreenGhostPropagateRGBGradient];
    [v25 setTexture:v12 atIndex:0];
    [v25 setTexture:v30 atIndex:1];
    [v25 setTexture:self->_maskMB atIndex:2];
    [v25 setTexture:v19 atIndex:3];
    [v25 setTexture:v13 atIndex:4];
    [v25 setTexture:v14 atIndex:5];
    [v25 setBytes:&var0 length:4 atIndex:0];
    unint64_t v26 = [(MTLComputePipelineState *)self->_rawNMGreenGhostPropagateRGBGradient threadExecutionWidth];
    unint64_t v27 = [(MTLComputePipelineState *)self->_rawNMGreenGhostPropagateRGBGradient maxTotalThreadsPerThreadgroup];
    v32[0] = v15;
    v32[1] = v16;
    v32[2] = 1;
    v31[0] = v26;
    v31[1] = v27 / v26;
    v31[2] = 1;
    [v25 dispatchThreads:v32 threadsPerThreadgroup:v31];
    [v25 endEncoding];
    [(FigMetalContext *)self->_metal commit];

    int v28 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
  }
LABEL_9:
  FigMetalDecRef();

  return v28;
}

- (int)prepareInpaintWithInputTexture:(id)a3 outputRGBTexture:(id)a4 outputGradidentTexture:(id)a5 params:(LowLightInpaintTuning *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 width];
  uint64_t v14 = [v12 height];
  unint64_t v24 = 0;
  uint64_t v15 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggGradient" width:v13 height:v14 pixelFormat:25 compressionDisabled:1];
  double v25 = (void *)v15;
  if (!v15) {
    goto LABEL_11;
  }
  uint64_t v16 = v15;
  int v17 = [(RawNightModeGreenGhost *)self updateMaskComputeGradientsFor:v10 outputMask:self->_maskMB outputGradient:v15 params:a6];
  if (v17)
  {
    int v22 = v17;
    goto LABEL_13;
  }
  int v18 = [(RawNightModeGreenGhost *)self propagateRGB:v10 gradient:v16 outputRGB:v11 outputGradient:v12 params:a6];
  if (v18)
  {
    int v22 = v18;
    goto LABEL_13;
  }
  FigMetalDecRef();
  uint64_t v19 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggIntermediateMask" width:v13 height:v14 pixelFormat:25 compressionDisabled:1];
  unint64_t v24 = (void *)v19;
  if (!v19)
  {
LABEL_11:
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
    goto LABEL_7;
  }
  uint64_t v20 = v19;
  int v21 = [(GreenGhostCommon *)self->_greenGhostCommon boxFilter:self->_maskMB withRadius:LODWORD(a6->var4) output:v19];
  if (v21)
  {
    int v22 = v21;
    goto LABEL_13;
  }
  int v22 = [(GreenGhostCommon *)self->_greenGhostCommon boxFilter:v20 withRadius:LODWORD(a6->var4) output:self->_maskMB];
  if (v22) {
LABEL_13:
  }
    FigDebugAssert3();
LABEL_7:
  FigMetalDecRef();
  FigMetalDecRef();

  return v22;
}

- (int)applyInpaintWithDownscaledRGB:(id)a3 propagatedRGB:(id)a4 propagatedGradient:(id)a5 outputRGB:(id)a6 params:(LowLightInpaintTuning *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [v15 width];
  unint64_t v17 = [v15 height];
  int v18 = [(FigMetalContext *)self->_metal commandBuffer];
  int v28 = v18;
  if (v18)
  {
    id v19 = v14;
    id v20 = v13;
    id v21 = v12;
    int v22 = [v18 computeCommandEncoder];
    if (v22)
    {
      unint64_t v23 = v22;
      [v22 setComputePipelineState:self->_rawNMGreenGhostInpaint];
      [v23 setImageblockWidth:32 height:32];
      unint64_t v24 = v16;
      double v25 = v21;
      [v23 setTexture:v21 atIndex:0];
      id v13 = v20;
      [v23 setTexture:v20 atIndex:1];
      id v14 = v19;
      [v23 setTexture:v19 atIndex:2];
      [v23 setTexture:self->_maskMB atIndex:3];
      [v23 setTexture:v15 atIndex:4];
      [v23 setBytes:a7 length:88 atIndex:0];
      [v23 setBytes:&self->_faceBodyBoundaries length:352 atIndex:1];
      [v23 setBytes:&self->_nonRefFramesCount length:4 atIndex:2];
      v31[0] = v24 >> 1;
      v31[1] = v17 >> 1;
      v31[2] = 1;
      int64x2_t v29 = vdupq_n_s64(0x10uLL);
      uint64_t v30 = 1;
      [v23 dispatchThreads:v31 threadsPerThreadgroup:&v29];
      [v23 endEncoding];
      [(FigMetalContext *)self->_metal commit];

      id v12 = v25;
      int v26 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v26 = FigSignalErrorAt();
      id v13 = v20;
      id v14 = v19;
    }
  }
  else
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
  }

  return v26;
}

- (int)residualCorrectionOfAccumulator:(id)a3
{
  id v4 = a3;
  uint64_t v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v31 = 0;
  long long v32 = 0;
  uint64_t v30 = 0;
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  if (!self->_canMitigationProceed) {
    goto LABEL_14;
  }
  if (!self->_maskMB)
  {
    [(NSMutableDictionary *)self->_sidecarMetadata setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"skipRepair"];
LABEL_14:
    int v22 = 0;
LABEL_15:
    float v9 = 0;
    goto LABEL_16;
  }
  if (!v4
    || ([v4 bandTextures],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectAtIndexedSubscript:0],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6)
    || (tuning = self->_tuning) == 0)
  {
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
    goto LABEL_15;
  }
  [(GreenGhostLowLightTuningParams *)tuning tuningParams];
  long long v35 = v26;
  long long v36 = v27;
  long long v37 = v28;
  uint64_t v38 = v29;
  long long v33 = v24;
  long long v34 = v25;
  id v8 = [v4 bandTextures];
  float v9 = [v8 objectAtIndexedSubscript:0];

  unint64_t v10 = (unint64_t)[v9 width] >> 2;
  unint64_t v11 = (unint64_t)[v9 height] >> 2;
  uint64_t v12 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggDownscaledRGBTexture" width:v10 height:v11 pixelFormat:115 compressionDisabled:1];
  long long v32 = (void *)v12;
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = v12;
  uint64_t v14 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggPropagatedRGBTexture" width:v10 height:v11 pixelFormat:115 compressionDisabled:1];
  long long v31 = (void *)v14;
  if (!v14
    || (uint64_t v15 = v14,
        +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"ggPropagatedGradient" width:v10 height:v11 pixelFormat:25 compressionDisabled:1], uint64_t v16 = objc_claimAutoreleasedReturnValue(), (v30 = (void *)v16) == 0))
  {
LABEL_18:
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
    goto LABEL_16;
  }
  uint64_t v17 = v16;
  int v18 = [(GreenGhostCommon *)self->_greenGhostCommon downscaleInput:v9 output:v13];
  if (v18)
  {
    int v22 = v18;
LABEL_21:
    FigDebugAssert3();
    goto LABEL_16;
  }
  int v19 = [(RawNightModeGreenGhost *)self prepareInpaintWithInputTexture:v13 outputRGBTexture:v15 outputGradidentTexture:v17 params:&v33];
  if (v19)
  {
    int v22 = v19;
    goto LABEL_21;
  }
  id v20 = [v4 bandTextures];
  id v21 = [v20 objectAtIndexedSubscript:0];
  int v22 = [(RawNightModeGreenGhost *)self applyInpaintWithDownscaledRGB:v13 propagatedRGB:v15 propagatedGradient:v17 outputRGB:v21 params:&v33];

  if (v22) {
    goto LABEL_21;
  }
LABEL_16:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v22;
}

- (RawNightModeInputFrame)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(id)a3
{
}

- (GreenGhostLowLightTuningParams)tuning
{
  return self->_tuning;
}

- (void)setTuning:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (MTLTexture)ggMaxFusionWeights
{
  return self->_ggMaxFusionWeights;
}

- (NSMutableDictionary)sidecarMetadata
{
  return self->_sidecarMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidecarMetadata, 0);
  objc_storeStrong((id *)&self->_ggMaxFusionWeights, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuning, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostInpaint, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostPropagateRGBGradient, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostUpdateMaskGrad, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostMixFusedAndReference, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostUpdateWeights, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostFusion, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostComputeFuseWeights, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostComputeNeighborDiff, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostVertGuidedFilter, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostHorzGuidedFilter, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostRefineMask, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostComputeTmpVar, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostComputeSumMask, 0);
  objc_storeStrong((id *)&self->_rawNMGreenGhostPrepareFrame, 0);
  objc_storeStrong((id *)&self->_ggFusionWeightsAcc, 0);
  objc_storeStrong((id *)&self->_maskMB, 0);
  objc_storeStrong((id *)&self->_maxVariationTex, 0);
  objc_storeStrong((id *)&self->_maskSB, 0);
  objc_storeStrong((id *)&self->_refFrameDownscaledChromaTexture, 0);
  objc_storeStrong((id *)&self->_refFrameDownscaledLumaTexture, 0);
  objc_storeStrong((id *)&self->_sumMaskBuffer, 0);
  objc_storeStrong((id *)&self->_textureUtils, 0);
  objc_storeStrong((id *)&self->_greenGhostCommon, 0);
  objc_storeStrong((id *)&self->_referenceFrame, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end