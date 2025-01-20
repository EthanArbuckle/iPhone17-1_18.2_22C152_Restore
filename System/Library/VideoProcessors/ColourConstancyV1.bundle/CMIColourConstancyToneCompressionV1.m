@interface CMIColourConstancyToneCompressionV1
- (CMIColourConstancyToneCompressionV1)initWithMetalContext:(id)a3;
- (MTLTexture)toneCompressionCurveTexture;
- (id)calculateToneCompressionCurve:(double)a3 strobeComponentRGBTexture:(double)a4 strobeCCM:(uint64_t)a5;
- (int)_clearHistogramBuffer:(id)a3 outputHistogramBuffer:(id)a4;
- (int)_encodeBalancedIntensityDensityHistogramCalculate:(id)a3 inputIntensityHistogramBuffer:(id)a4 histogramScaleFactor:(float)a5 balanceDenseToSparseExponentFactor:(float)a6 minimumProbabilityDensity:(float)a7 outputBalancedIntensityDensityHistogramTexture:(id)a8;
- (int)_encodeGaussianWeightedSupportApply:(id)a3 inputBalancedIntensityDensityHistogramTexture:(id)a4 kernelSupportGaussianSigma:(float)a5 sigmaToFilterScale:(float)a6 outputKernelWeightedIntensityDensityHistogramTexture:(id)a7;
- (int)_encodeToneCompressionCurveCalculate:(id)a3 inputKernelWeightedIntensityDensityHistogramTexture:(id)a4 outputToneCompressionCurveTexture:(id)a5;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
- (uint64_t)_encodeIntensityHistogramCalculate:(__n128)a3 strobeComponentRGBTexture:(__n128)a4 strobeCCM:(uint64_t)a5 numHistogramBins:(void *)a6 outputIntensityHistogramBuffer:(void *)a7;
@end

@implementation CMIColourConstancyToneCompressionV1

- (CMIColourConstancyToneCompressionV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CMIColourConstancyToneCompressionV1;
  v6 = [(CMIColourConstancyToneCompressionV1 *)&v18 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  if (!v5) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateIntensityHistogramV1" constants:0];
  calculateIntensityHistogramPipelineState = v7->_calculateIntensityHistogramPipelineState;
  v7->_calculateIntensityHistogramPipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_calculateIntensityHistogramPipelineState) {
    goto LABEL_9;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateBalancedIntensityDensityHistogramV1" constants:0];
  calculateBalancedIntensityDensityHistogramPipelineState = v7->_calculateBalancedIntensityDensityHistogramPipelineState;
  v7->_calculateBalancedIntensityDensityHistogramPipelineState = (MTLComputePipelineState *)v10;

  if (!v7->_calculateBalancedIntensityDensityHistogramPipelineState) {
    goto LABEL_9;
  }
  uint64_t v12 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::applyGaussianWeightedSupportV1" constants:0];
  applyGaussianWeightedSupportPipelineState = v7->_applyGaussianWeightedSupportPipelineState;
  v7->_applyGaussianWeightedSupportPipelineState = (MTLComputePipelineState *)v12;

  if (!v7->_applyGaussianWeightedSupportPipelineState) {
    goto LABEL_9;
  }
  uint64_t v14 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateToneCompressionCurveV1" constants:0];
  calculateToneCompressionCurvePipelineState = v7->_calculateToneCompressionCurvePipelineState;
  v7->_calculateToneCompressionCurvePipelineState = (MTLComputePipelineState *)v14;

  if (v7->_calculateToneCompressionCurvePipelineState)
  {
    v16 = v7;
  }
  else
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = 0;
  }

  return v16;
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
    id v12 = 0;
    id v7 = 0;
    int v29 = 8;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&self->_config, a3);
  v6 = [(FigMetalContext *)self->_metalContext allocator];
  id v7 = [v6 newBufferDescriptor];

  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v12 = 0;
LABEL_14:
    int v29 = 7;
    goto LABEL_9;
  }
  objc_msgSend(v7, "setLength:", 4* -[CMIColourConstancyToneCompressionConfigurationV1 numIntensityHistogramBins](self->_config, "numIntensityHistogramBins"));
  [v7 setOptions:0];
  [v7 setLabel:0];
  uint64_t v8 = [(FigMetalContext *)self->_metalContext allocator];
  v9 = (MTLBuffer *)[v8 newBufferWithDescriptor:v7];
  intensityHistogramBuffer = self->_intensityHistogramBuffer;
  self->_intensityHistogramBuffer = v9;

  if (!self->_intensityHistogramBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v12 = 0;
LABEL_16:
    int v29 = 6;
    goto LABEL_9;
  }
  v11 = [(FigMetalContext *)self->_metalContext allocator];
  id v12 = [v11 newTextureDescriptor];

  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_14;
  }
  v13 = [v12 desc];
  [v13 setTextureType:0];

  uint64_t v14 = [(CMIColourConstancyToneCompressionConfigurationV1 *)self->_config numIntensityHistogramBins];
  v15 = [v12 desc];
  [v15 setWidth:v14];

  v16 = [v12 desc];
  [v16 setHeight:1];

  v17 = [v12 desc];
  [v17 setPixelFormat:55];

  [v12 setLabel:0];
  objc_super v18 = [(FigMetalContext *)self->_metalContext allocator];
  v19 = (MTLTexture *)[v18 newTextureWithDescriptor:v12];
  balancedIntensityDensityHistogramTexture = self->_balancedIntensityDensityHistogramTexture;
  self->_balancedIntensityDensityHistogramTexture = v19;

  if (!self->_balancedIntensityDensityHistogramTexture) {
    goto LABEL_15;
  }
  [v12 setLabel:0];
  v21 = [(FigMetalContext *)self->_metalContext allocator];
  v22 = (MTLTexture *)[v21 newTextureWithDescriptor:v12];
  kernelWeightedIntensityDensityHistogramTexture = self->_kernelWeightedIntensityDensityHistogramTexture;
  self->_kernelWeightedIntensityDensityHistogramTexture = v22;

  if (!self->_kernelWeightedIntensityDensityHistogramTexture) {
    goto LABEL_15;
  }
  uint64_t v24 = [(CMIColourConstancyToneCompressionConfigurationV1 *)self->_config numIntensityHistogramBins]+ 1;
  v25 = [v12 desc];
  [v25 setWidth:v24];

  [v12 setLabel:0];
  v26 = [(FigMetalContext *)self->_metalContext allocator];
  v27 = (MTLTexture *)[v26 newTextureWithDescriptor:v12];
  toneCompressionCurveTexture = self->_toneCompressionCurveTexture;
  self->_toneCompressionCurveTexture = v27;

  if (!self->_toneCompressionCurveTexture)
  {
LABEL_15:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_16;
  }
  int v29 = 0;
LABEL_9:

  return v29;
}

- (int)_clearHistogramBuffer:(id)a3 outputHistogramBuffer:(id)a4
{
  id v5 = a4;
  v6 = [a3 blitCommandEncoder];
  if (v6)
  {
    objc_msgSend(v6, "fillBuffer:range:value:", v5, 0, objc_msgSend(v5, "length"), 0);
    [v6 endEncoding];
    int v7 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v7 = 10;
  }

  return v7;
}

- (uint64_t)_encodeIntensityHistogramCalculate:(__n128)a3 strobeComponentRGBTexture:(__n128)a4 strobeCCM:(uint64_t)a5 numHistogramBins:(void *)a6 outputIntensityHistogramBuffer:(void *)a7
{
  v25[0] = a2;
  v25[1] = a3;
  v25[2] = a4;
  id v13 = a6;
  id v14 = a7;
  int v24 = a8;
  id v15 = a9;
  if (v13 && ([v13 computeCommandEncoder], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = v16;
    [v16 setComputePipelineState:*(void *)(a1 + 24)];
    [v17 setTexture:v14 atIndex:0];
    [v17 setBytes:v25 length:48 atIndex:0];
    [v17 setBytes:&v24 length:4 atIndex:1];
    [v17 setBuffer:v15 offset:0 atIndex:2];
    unint64_t v18 = (unint64_t)[*(id *)(a1 + 24) threadExecutionWidth];
    unint64_t v19 = (unint64_t)[*(id *)(a1 + 24) maxTotalThreadsPerThreadgroup] / v18;
    v23[0] = [v14 width];
    v23[1] = [v14 height];
    v23[2] = 1;
    v22[0] = v18;
    v22[1] = v19;
    v22[2] = 1;
    [v17 dispatchThreads:v23 threadsPerThreadgroup:v22];
    [v17 endEncoding];

    uint64_t v20 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v20 = 10;
  }

  return v20;
}

- (int)_encodeBalancedIntensityDensityHistogramCalculate:(id)a3 inputIntensityHistogramBuffer:(id)a4 histogramScaleFactor:(float)a5 balanceDenseToSparseExponentFactor:(float)a6 minimumProbabilityDensity:(float)a7 outputBalancedIntensityDensityHistogramTexture:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  float v26 = a6;
  float v27 = a5;
  float v25 = a7;
  id v16 = a8;
  if (v14 && ([v14 computeCommandEncoder], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v18 = v17;
    [v17 setComputePipelineState:self->_calculateBalancedIntensityDensityHistogramPipelineState];
    [v18 setBuffer:v15 offset:0 atIndex:0];
    [v18 setBytes:&v27 length:4 atIndex:1];
    [v18 setBytes:&v26 length:4 atIndex:2];
    [v18 setBytes:&v25 length:4 atIndex:3];
    [v18 setTexture:v16 atIndex:0];
    unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)self->_calculateBalancedIntensityDensityHistogramPipelineState threadExecutionWidth];
    unint64_t v20 = (unint64_t)[(MTLComputePipelineState *)self->_calculateBalancedIntensityDensityHistogramPipelineState maxTotalThreadsPerThreadgroup]/ v19;
    v24[0] = [v16 width];
    v24[1] = [v16 height];
    v24[2] = 1;
    v23[0] = v19;
    v23[1] = v20;
    v23[2] = 1;
    [v18 dispatchThreads:v24 threadsPerThreadgroup:v23];
    [v18 endEncoding];

    int v21 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v21 = 10;
  }

  return v21;
}

- (int)_encodeGaussianWeightedSupportApply:(id)a3 inputBalancedIntensityDensityHistogramTexture:(id)a4 kernelSupportGaussianSigma:(float)a5 sigmaToFilterScale:(float)a6 outputKernelWeightedIntensityDensityHistogramTexture:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  float v23 = a6;
  float v24 = a5;
  id v14 = a7;
  if (v12 && ([v12 computeCommandEncoder], (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v16 = v15;
    [v15 setComputePipelineState:self->_applyGaussianWeightedSupportPipelineState];
    [v16 setTexture:v13 atIndex:0];
    [v16 setTexture:v14 atIndex:1];
    [v16 setBytes:&v24 length:4 atIndex:0];
    [v16 setBytes:&v23 length:4 atIndex:1];
    unint64_t v17 = (unint64_t)[(MTLComputePipelineState *)self->_applyGaussianWeightedSupportPipelineState threadExecutionWidth];
    unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)self->_applyGaussianWeightedSupportPipelineState maxTotalThreadsPerThreadgroup]/ v17;
    v22[0] = [v14 width];
    v22[1] = [v14 height];
    v22[2] = 1;
    v21[0] = v17;
    v21[1] = v18;
    v21[2] = 1;
    [v16 dispatchThreads:v22 threadsPerThreadgroup:v21];
    [v16 endEncoding];

    int v19 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = 10;
  }

  return v19;
}

- (int)_encodeToneCompressionCurveCalculate:(id)a3 inputKernelWeightedIntensityDensityHistogramTexture:(id)a4 outputToneCompressionCurveTexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ([v8 computeCommandEncoder], (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v12 = v11;
    [v11 setComputePipelineState:self->_calculateToneCompressionCurvePipelineState];
    [v12 setTexture:v9 atIndex:0];
    [v12 setTexture:v10 atIndex:1];
    unint64_t v13 = (unint64_t)[(MTLComputePipelineState *)self->_calculateToneCompressionCurvePipelineState threadExecutionWidth];
    unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)self->_calculateToneCompressionCurvePipelineState maxTotalThreadsPerThreadgroup];
    int64x2_t v18 = vdupq_n_s64(1uLL);
    uint64_t v19 = 1;
    v17[0] = v13;
    v17[1] = v14 / v13;
    v17[2] = 1;
    [v12 dispatchThreads:&v18 threadsPerThreadgroup:v17];
    [v12 endEncoding];

    int v15 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v15 = 10;
  }

  return v15;
}

- (id)calculateToneCompressionCurve:(double)a3 strobeComponentRGBTexture:(double)a4 strobeCCM:(uint64_t)a5
{
  id v9 = a6;
  id v10 = a7;
  id v11 = [(id)a1 _clearHistogramBuffer:v9 outputHistogramBuffer:*(void *)(a1 + 56)];
  if (v11) {
    goto LABEL_7;
  }
  id v11 = objc_msgSend((id)a1, "_encodeIntensityHistogramCalculate:strobeComponentRGBTexture:strobeCCM:numHistogramBins:outputIntensityHistogramBuffer:", v9, v10, objc_msgSend(*(id *)(a1 + 16), "numIntensityHistogramBins"), *(void *)(a1 + 56), a2, a3, a4);
  if (v11) {
    goto LABEL_7;
  }
  id v12 = [v10 width];
  float v13 = (float)(unint64_t)((void)[v10 height] * (void)v12);
  uint64_t v14 = *(void *)(a1 + 56);
  [*(id *)(a1 + 16) balanceDenseToSparseExponentFactor];
  int v16 = v15;
  [*(id *)(a1 + 16) minimumProbabilityDensity];
  LODWORD(v18) = v17;
  *(float *)&double v19 = v13;
  LODWORD(v20) = v16;
  id v11 = [(id)a1 _encodeBalancedIntensityDensityHistogramCalculate:v9 inputIntensityHistogramBuffer:v14 histogramScaleFactor:*(void *)(a1 + 64) balanceDenseToSparseExponentFactor:v19 minimumProbabilityDensity:v20 outputBalancedIntensityDensityHistogramTexture:v18];
  if (v11
    || (uint64_t v21 = *(void *)(a1 + 64),
        [*(id *)(a1 + 16) kernelSupportGaussianSigma],
        int v23 = v22,
        [*(id *)(a1 + 16) kernelSupportSigmaToFilterScale],
        LODWORD(v25) = v24,
        LODWORD(v26) = v23,
        id v11 = [(id)a1 _encodeGaussianWeightedSupportApply:v9 inputBalancedIntensityDensityHistogramTexture:v21 kernelSupportGaussianSigma:*(void *)(a1 + 72) sigmaToFilterScale:v26 outputKernelWeightedIntensityDensityHistogramTexture:v25], v11))
  {
LABEL_7:
    id v27 = v11;
    fig_log_get_emitter();
LABEL_10:
    FigDebugAssert3();
    goto LABEL_6;
  }
  id v27 = [(id)a1 _encodeToneCompressionCurveCalculate:v9 inputKernelWeightedIntensityDensityHistogramTexture:*(void *)(a1 + 72) outputToneCompressionCurveTexture:*(void *)(a1 + 80)];
  if (v27)
  {
    fig_log_get_emitter();
    goto LABEL_10;
  }
LABEL_6:

  return v27;
}

- (MTLTexture)toneCompressionCurveTexture
{
  return (MTLTexture *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toneCompressionCurveTexture, 0);
  objc_storeStrong((id *)&self->_kernelWeightedIntensityDensityHistogramTexture, 0);
  objc_storeStrong((id *)&self->_balancedIntensityDensityHistogramTexture, 0);
  objc_storeStrong((id *)&self->_intensityHistogramBuffer, 0);
  objc_storeStrong((id *)&self->_calculateToneCompressionCurvePipelineState, 0);
  objc_storeStrong((id *)&self->_applyGaussianWeightedSupportPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateBalancedIntensityDensityHistogramPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateIntensityHistogramPipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end