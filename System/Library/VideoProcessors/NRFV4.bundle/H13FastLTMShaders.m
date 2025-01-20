@interface H13FastLTMShaders
- (H13FastLTMShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)ltmDemosaic;
- (MTLComputePipelineState)ltmDemosaicQuadra;
- (MTLComputePipelineState)ltmDemosaicQuadra4Channel;
- (MTLComputePipelineState)ltmDownsampleRGB_2x;
- (MTLComputePipelineState)ltmDownsampleYCbCrToRGB;
@end

@implementation H13FastLTMShaders

- (H13FastLTMShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  v16.receiver = self;
  v16.super_class = (Class)H13FastLTMShaders;
  self = [(H13FastLTMShaders *)&v16 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
  v5 = [v4 computePipelineStateFor:@"H13FastLTM::ltmDownsampleYCbCrToRGB" constants:0];
  ltmDownsampleYCbCrToRGB = self->_ltmDownsampleYCbCrToRGB;
  self->_ltmDownsampleYCbCrToRGB = v5;

  if (!self->_ltmDownsampleYCbCrToRGB) {
    goto LABEL_11;
  }
  v7 = [v4 computePipelineStateFor:@"H13FastLTM::ltmDemosaic" constants:0];
  ltmDemosaic = self->_ltmDemosaic;
  self->_ltmDemosaic = v7;

  if (!self->_ltmDemosaic) {
    goto LABEL_11;
  }
  v9 = [v4 computePipelineStateFor:@"H13FastLTM::ltmDemosaicQuadra" constants:0];
  ltmDemosaicQuadra = self->_ltmDemosaicQuadra;
  self->_ltmDemosaicQuadra = v9;

  if (!self->_ltmDemosaicQuadra) {
    goto LABEL_11;
  }
  v11 = [v4 computePipelineStateFor:@"H13FastLTM::ltmDemosaicQuadra4Channel" constants:0];
  ltmDemosaicQuadra4Channel = self->_ltmDemosaicQuadra4Channel;
  self->_ltmDemosaicQuadra4Channel = v11;

  if (!self->_ltmDemosaicQuadra4Channel
    || ([v4 computePipelineStateFor:@"H13CommonLTM::ltmDownsampleRGB_2x" constants:0],
        v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        ltmDownsampleRGB_2x = self->_ltmDownsampleRGB_2x,
        self->_ltmDownsampleRGB_2x = v13,
        ltmDownsampleRGB_2x,
        !self->_ltmDownsampleRGB_2x))
  {
LABEL_11:
    FigDebugAssert3();

    self = 0;
  }
LABEL_8:

  return self;
}

- (MTLComputePipelineState)ltmDownsampleYCbCrToRGB
{
  return self->_ltmDownsampleYCbCrToRGB;
}

- (MTLComputePipelineState)ltmDemosaic
{
  return self->_ltmDemosaic;
}

- (MTLComputePipelineState)ltmDemosaicQuadra
{
  return self->_ltmDemosaicQuadra;
}

- (MTLComputePipelineState)ltmDemosaicQuadra4Channel
{
  return self->_ltmDemosaicQuadra4Channel;
}

- (MTLComputePipelineState)ltmDownsampleRGB_2x
{
  return self->_ltmDownsampleRGB_2x;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltmDownsampleRGB_2x, 0);
  objc_storeStrong((id *)&self->_ltmDemosaicQuadra4Channel, 0);
  objc_storeStrong((id *)&self->_ltmDemosaicQuadra, 0);
  objc_storeStrong((id *)&self->_ltmDemosaic, 0);

  objc_storeStrong((id *)&self->_ltmDownsampleYCbCrToRGB, 0);
}

@end