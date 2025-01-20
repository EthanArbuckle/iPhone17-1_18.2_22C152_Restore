@interface H13FastDemosaicShaders
- (H13FastDemosaicShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)convertToSingleChannel;
- (MTLComputePipelineState)ispQDEMRedBlueStage_RGB;
- (MTLComputePipelineState)ispQDEMRedBlueStage_YCbCr;
- (MTLComputePipelineState)zimmerDemosaicPackStage;
- (MTLComputePipelineState)zimmerDemosaicStage_Bayer_RB_RGB;
- (MTLComputePipelineState)zimmerDemosaicStage_Stacked_BGGR_RGB;
- (MTLComputePipelineState)zimmerDemosaicStage_Stacked_BGGR_YCbCr;
- (MTLComputePipelineState)zimmerDemosaicStage_Stacked_RGGB_RGB;
- (MTLComputePipelineState)zimmerDemosaicStage_Stacked_RGGB_YCbCr;
- (SoftISPKernelWithFunctionConstants)ispQDEMGreenStage;
@end

@implementation H13FastDemosaicShaders

- (H13FastDemosaicShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_18;
  }
  v29.receiver = self;
  v29.super_class = (Class)H13FastDemosaicShaders;
  self = [(H13FastDemosaicShaders *)&v29 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_15;
  }
  uint64_t v5 = objc_opt_new();
  if (!v5)
  {
LABEL_18:
    FigDebugAssert3();
LABEL_20:

    self = 0;
    goto LABEL_15;
  }
  v6 = (void *)v5;
  v7 = [v4 computePipelineStateFor:@"H13FastDemosaic::zimmerDemosaicStage_Bayer_RB_RGB" constants:0];
  zimmerDemosaicStage_Bayer_RB_RGB = self->_zimmerDemosaicStage_Bayer_RB_RGB;
  self->_zimmerDemosaicStage_Bayer_RB_RGB = v7;

  if (!self->_zimmerDemosaicStage_Bayer_RB_RGB) {
    goto LABEL_19;
  }
  v9 = [v4 computePipelineStateFor:@"H13FastDemosaic::zimmerDemosaicStage_Stacked_RGGB_YCbCr" constants:0];
  zimmerDemosaicStage_Stacked_RGGB_YCbCr = self->_zimmerDemosaicStage_Stacked_RGGB_YCbCr;
  self->_zimmerDemosaicStage_Stacked_RGGB_YCbCr = v9;

  if (!self->_zimmerDemosaicStage_Stacked_RGGB_YCbCr) {
    goto LABEL_19;
  }
  v11 = [v4 computePipelineStateFor:@"H13FastDemosaic::zimmerDemosaicStage_Stacked_BGGR_YCbCr" constants:0];
  zimmerDemosaicStage_Stacked_BGGR_YCbCr = self->_zimmerDemosaicStage_Stacked_BGGR_YCbCr;
  self->_zimmerDemosaicStage_Stacked_BGGR_YCbCr = v11;

  if (!self->_zimmerDemosaicStage_Stacked_BGGR_YCbCr) {
    goto LABEL_19;
  }
  v13 = [v4 computePipelineStateFor:@"H13FastDemosaic::zimmerDemosaicStage_Stacked_RGGB_RGB" constants:0];
  zimmerDemosaicStage_Stacked_RGGB_RGB = self->_zimmerDemosaicStage_Stacked_RGGB_RGB;
  self->_zimmerDemosaicStage_Stacked_RGGB_RGB = v13;

  if (!self->_zimmerDemosaicStage_Stacked_RGGB_RGB) {
    goto LABEL_19;
  }
  v15 = [v4 computePipelineStateFor:@"H13FastDemosaic::zimmerDemosaicStage_Stacked_BGGR_RGB" constants:0];
  zimmerDemosaicStage_Stacked_BGGR_RGB = self->_zimmerDemosaicStage_Stacked_BGGR_RGB;
  self->_zimmerDemosaicStage_Stacked_BGGR_RGB = v15;

  if (!self->_zimmerDemosaicStage_Stacked_BGGR_RGB) {
    goto LABEL_19;
  }
  v17 = [v4 computePipelineStateFor:@"H13FastDemosaic::zimmerDemosaicYUVPackStage" constants:0];
  zimmerDemosaicPackStage = self->_zimmerDemosaicPackStage;
  self->_zimmerDemosaicPackStage = v17;

  if (!self->_zimmerDemosaicPackStage) {
    goto LABEL_19;
  }
  v19 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastDemosaic::ispQDEMGreenStage" usingNamespace:@"H13FastDemosaic::FunctionConstants" paramCombinations:&unk_270E99070];
  ispQDEMGreenStage = self->_ispQDEMGreenStage;
  self->_ispQDEMGreenStage = v19;

  if (!self->_ispQDEMGreenStage) {
    goto LABEL_19;
  }
  char v28 = 1;
  [v6 setConstantValue:&v28 type:53 atIndex:0];
  v21 = [v4 computePipelineStateFor:@"H13FastDemosaic::ispQDEMRedBlueStage" constants:v6];
  ispQDEMRedBlueStage_RGB = self->_ispQDEMRedBlueStage_RGB;
  self->_ispQDEMRedBlueStage_RGB = v21;

  if (!self->_ispQDEMRedBlueStage_RGB) {
    goto LABEL_19;
  }
  char v28 = 0;
  [v6 setConstantValue:&v28 type:53 atIndex:0];
  v23 = [v4 computePipelineStateFor:@"H13FastDemosaic::ispQDEMRedBlueStage" constants:v6];
  ispQDEMRedBlueStage_YCbCr = self->_ispQDEMRedBlueStage_YCbCr;
  self->_ispQDEMRedBlueStage_YCbCr = v23;

  if (!self->_ispQDEMRedBlueStage_YCbCr
    || ([v4 computePipelineStateFor:@"H13FastDemosaic::convertToSingleChannel" constants:0],
        v25 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        convertToSingleChannel = self->_convertToSingleChannel,
        self->_convertToSingleChannel = v25,
        convertToSingleChannel,
        !self->_convertToSingleChannel))
  {
LABEL_19:
    FigDebugAssert3();

    goto LABEL_20;
  }
  self = self;

LABEL_15:
  return self;
}

- (MTLComputePipelineState)zimmerDemosaicStage_Bayer_RB_RGB
{
  return self->_zimmerDemosaicStage_Bayer_RB_RGB;
}

- (MTLComputePipelineState)zimmerDemosaicStage_Stacked_RGGB_YCbCr
{
  return self->_zimmerDemosaicStage_Stacked_RGGB_YCbCr;
}

- (MTLComputePipelineState)zimmerDemosaicStage_Stacked_BGGR_YCbCr
{
  return self->_zimmerDemosaicStage_Stacked_BGGR_YCbCr;
}

- (MTLComputePipelineState)zimmerDemosaicStage_Stacked_RGGB_RGB
{
  return self->_zimmerDemosaicStage_Stacked_RGGB_RGB;
}

- (MTLComputePipelineState)zimmerDemosaicStage_Stacked_BGGR_RGB
{
  return self->_zimmerDemosaicStage_Stacked_BGGR_RGB;
}

- (MTLComputePipelineState)zimmerDemosaicPackStage
{
  return self->_zimmerDemosaicPackStage;
}

- (MTLComputePipelineState)ispQDEMRedBlueStage_RGB
{
  return self->_ispQDEMRedBlueStage_RGB;
}

- (MTLComputePipelineState)ispQDEMRedBlueStage_YCbCr
{
  return self->_ispQDEMRedBlueStage_YCbCr;
}

- (MTLComputePipelineState)convertToSingleChannel
{
  return self->_convertToSingleChannel;
}

- (SoftISPKernelWithFunctionConstants)ispQDEMGreenStage
{
  return self->_ispQDEMGreenStage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ispQDEMGreenStage, 0);
  objc_storeStrong((id *)&self->_convertToSingleChannel, 0);
  objc_storeStrong((id *)&self->_ispQDEMRedBlueStage_YCbCr, 0);
  objc_storeStrong((id *)&self->_ispQDEMRedBlueStage_RGB, 0);
  objc_storeStrong((id *)&self->_zimmerDemosaicPackStage, 0);
  objc_storeStrong((id *)&self->_zimmerDemosaicStage_Stacked_BGGR_RGB, 0);
  objc_storeStrong((id *)&self->_zimmerDemosaicStage_Stacked_RGGB_RGB, 0);
  objc_storeStrong((id *)&self->_zimmerDemosaicStage_Stacked_BGGR_YCbCr, 0);
  objc_storeStrong((id *)&self->_zimmerDemosaicStage_Stacked_RGGB_YCbCr, 0);

  objc_storeStrong((id *)&self->_zimmerDemosaicStage_Bayer_RB_RGB, 0);
}

@end