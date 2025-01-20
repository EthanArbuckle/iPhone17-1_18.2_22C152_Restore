@interface H13FastPostDemosaicProcShaders
- (H13FastPostDemosaicProcShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)postDemosaicProcStage_RGB_to_YCC;
- (MTLComputePipelineState)postDemosaicProcStage_YCC4202YUV420;
- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_CCUV;
- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_CCUV_Sparse;
- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_RGB;
- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_filterQCC;
- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_filterQCC_Sparse;
- (MTLComputePipelineState)postDemosaicProcStage_directionalLowpass_RGB;
- (MTLComputePipelineState)postDemosaicProcStage_directionalLowpass_YCbCr;
- (SoftISPKernelWithFunctionConstants)postDemosaicProcStage_dotFix;
@end

@implementation H13FastPostDemosaicProcShaders

- (H13FastPostDemosaicProcShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  __int16 v30 = 1;
  __int16 v29 = 2;
  if (!v4)
  {
    FigDebugAssert3();
LABEL_18:

    self = 0;
    goto LABEL_14;
  }
  v28.receiver = self;
  v28.super_class = (Class)H13FastPostDemosaicProcShaders;
  self = [(H13FastPostDemosaicProcShaders *)&v28 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_14;
  }
  id v5 = objc_alloc_init(MEMORY[0x263F128B0]);
  [v5 setConstantValue:&v30 type:37 withName:@"H13FastPostDemosaicProc::FunctionConstants::chromaSmoothingSpacing"];
  id v6 = objc_alloc_init(MEMORY[0x263F128B0]);
  [v6 setConstantValue:&v29 type:37 withName:@"H13FastPostDemosaicProc::FunctionConstants::chromaSmoothingSpacing"];
  v7 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastPostDemosaicProc::postDemosaicProcStage_dotFix" usingNamespace:@"H13FastPostDemosaicProc::FunctionConstants" paramCombinations:&unk_270E98FD0];
  postDemosaicProcStage_dotFix = self->_postDemosaicProcStage_dotFix;
  self->_postDemosaicProcStage_dotFix = v7;

  if (!self->_postDemosaicProcStage_dotFix) {
    goto LABEL_17;
  }
  v9 = [v4 computePipelineStateFor:@"H13FastPostDemosaicProc::postDemosaicProcStage_RGB_to_YCC" constants:0];
  postDemosaicProcStage_RGB_to_YCC = self->_postDemosaicProcStage_RGB_to_YCC;
  self->_postDemosaicProcStage_RGB_to_YCC = v9;

  if (!self->_postDemosaicProcStage_RGB_to_YCC) {
    goto LABEL_17;
  }
  v11 = [v4 computePipelineStateFor:@"H13FastPostDemosaicProc::postDemosaicProcStage_directionalLowpass_YCbCr" constants:0];
  postDemosaicProcStage_directionalLowpass_YCbCr = self->_postDemosaicProcStage_directionalLowpass_YCbCr;
  self->_postDemosaicProcStage_directionalLowpass_YCbCr = v11;

  if (!self->_postDemosaicProcStage_directionalLowpass_YCbCr) {
    goto LABEL_17;
  }
  v13 = [v4 computePipelineStateFor:@"H13FastPostDemosaicProc::postDemosaicProcStage_directionalLowpass_RGB" constants:0];
  postDemosaicProcStage_directionalLowpass_RGB = self->_postDemosaicProcStage_directionalLowpass_RGB;
  self->_postDemosaicProcStage_directionalLowpass_RGB = v13;

  if (!self->_postDemosaicProcStage_directionalLowpass_RGB) {
    goto LABEL_17;
  }
  v15 = [v4 computePipelineStateFor:@"H13FastPostDemosaicProc::postDemosaicProcStage_YCC4202YUV420" constants:0];
  postDemosaicProcStage_YCC4202YUV420 = self->_postDemosaicProcStage_YCC4202YUV420;
  self->_postDemosaicProcStage_YCC4202YUV420 = v15;

  if (!self->_postDemosaicProcStage_YCC4202YUV420) {
    goto LABEL_17;
  }
  v17 = [v4 computePipelineStateFor:@"H13FastPostDemosaicProc::postDemosaicProcStage_chromaSuppression_CCUV" constants:v5];
  postDemosaicProcStage_chromaSuppression_CCUV = self->_postDemosaicProcStage_chromaSuppression_CCUV;
  self->_postDemosaicProcStage_chromaSuppression_CCUV = v17;

  if (!self->_postDemosaicProcStage_chromaSuppression_CCUV) {
    goto LABEL_17;
  }
  v19 = [v4 computePipelineStateFor:@"H13FastPostDemosaicProc::postDemosaicProcStage_chromaSuppression_CCUV" constants:v6];
  postDemosaicProcStage_chromaSuppression_CCUV_Sparse = self->_postDemosaicProcStage_chromaSuppression_CCUV_Sparse;
  self->_postDemosaicProcStage_chromaSuppression_CCUV_Sparse = v19;

  if (!self->_postDemosaicProcStage_chromaSuppression_CCUV_Sparse) {
    goto LABEL_17;
  }
  v21 = [v4 computePipelineStateFor:@"H13FastPostDemosaicProc::postDemosaicProcStage_chromaSuppression_filterQCC" constants:v5];
  postDemosaicProcStage_chromaSuppression_filterQCC = self->_postDemosaicProcStage_chromaSuppression_filterQCC;
  self->_postDemosaicProcStage_chromaSuppression_filterQCC = v21;

  if (!self->_postDemosaicProcStage_chromaSuppression_filterQCC) {
    goto LABEL_17;
  }
  v23 = [v4 computePipelineStateFor:@"H13FastPostDemosaicProc::postDemosaicProcStage_chromaSuppression_filterQCC" constants:v6];
  postDemosaicProcStage_chromaSuppression_filterQCC_Sparse = self->_postDemosaicProcStage_chromaSuppression_filterQCC_Sparse;
  self->_postDemosaicProcStage_chromaSuppression_filterQCC_Sparse = v23;

  if (!self->_postDemosaicProcStage_chromaSuppression_filterQCC_Sparse
    || ([v4 computePipelineStateFor:@"H13FastPostDemosaicProc::postDemosaicProcStage_chromaSuppression_RGB" constants:0], v25 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), postDemosaicProcStage_chromaSuppression_RGB = self->_postDemosaicProcStage_chromaSuppression_RGB, self->_postDemosaicProcStage_chromaSuppression_RGB = v25, postDemosaicProcStage_chromaSuppression_RGB, !self->_postDemosaicProcStage_chromaSuppression_RGB))
  {
LABEL_17:
    FigDebugAssert3();

    goto LABEL_18;
  }
  self = self;

LABEL_14:
  return self;
}

- (SoftISPKernelWithFunctionConstants)postDemosaicProcStage_dotFix
{
  return self->_postDemosaicProcStage_dotFix;
}

- (MTLComputePipelineState)postDemosaicProcStage_RGB_to_YCC
{
  return self->_postDemosaicProcStage_RGB_to_YCC;
}

- (MTLComputePipelineState)postDemosaicProcStage_directionalLowpass_YCbCr
{
  return self->_postDemosaicProcStage_directionalLowpass_YCbCr;
}

- (MTLComputePipelineState)postDemosaicProcStage_directionalLowpass_RGB
{
  return self->_postDemosaicProcStage_directionalLowpass_RGB;
}

- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_filterQCC
{
  return self->_postDemosaicProcStage_chromaSuppression_filterQCC;
}

- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_filterQCC_Sparse
{
  return self->_postDemosaicProcStage_chromaSuppression_filterQCC_Sparse;
}

- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_RGB
{
  return self->_postDemosaicProcStage_chromaSuppression_RGB;
}

- (MTLComputePipelineState)postDemosaicProcStage_YCC4202YUV420
{
  return self->_postDemosaicProcStage_YCC4202YUV420;
}

- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_CCUV
{
  return self->_postDemosaicProcStage_chromaSuppression_CCUV;
}

- (MTLComputePipelineState)postDemosaicProcStage_chromaSuppression_CCUV_Sparse
{
  return self->_postDemosaicProcStage_chromaSuppression_CCUV_Sparse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postDemosaicProcStage_chromaSuppression_CCUV_Sparse, 0);
  objc_storeStrong((id *)&self->_postDemosaicProcStage_chromaSuppression_CCUV, 0);
  objc_storeStrong((id *)&self->_postDemosaicProcStage_YCC4202YUV420, 0);
  objc_storeStrong((id *)&self->_postDemosaicProcStage_chromaSuppression_RGB, 0);
  objc_storeStrong((id *)&self->_postDemosaicProcStage_chromaSuppression_filterQCC_Sparse, 0);
  objc_storeStrong((id *)&self->_postDemosaicProcStage_chromaSuppression_filterQCC, 0);
  objc_storeStrong((id *)&self->_postDemosaicProcStage_directionalLowpass_RGB, 0);
  objc_storeStrong((id *)&self->_postDemosaicProcStage_directionalLowpass_YCbCr, 0);
  objc_storeStrong((id *)&self->_postDemosaicProcStage_RGB_to_YCC, 0);

  objc_storeStrong((id *)&self->_postDemosaicProcStage_dotFix, 0);
}

@end