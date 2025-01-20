@interface DisparityShaders
- (DisparityShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)demosaicBayerToARGB;
- (MTLComputePipelineState)demosaicQuadraBayerToARGB;
@end

@implementation DisparityShaders

- (DisparityShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)DisparityShaders;
  self = [(DisparityShaders *)&v10 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_5;
  }
  v5 = [v4 computePipelineStateFor:@"SoftISPDisparity::demosaicBayerToARGB" constants:0];
  demosaicBayerToARGB = self->_demosaicBayerToARGB;
  self->_demosaicBayerToARGB = v5;

  if (!self->_demosaicBayerToARGB
    || ([v4 computePipelineStateFor:@"SoftISPDisparity::demosaicQuadraBayerToARGB" constants:0], v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), demosaicQuadraBayerToARGB = self->_demosaicQuadraBayerToARGB, self->_demosaicQuadraBayerToARGB = v7, demosaicQuadraBayerToARGB, !self->_demosaicQuadraBayerToARGB))
  {
LABEL_8:
    FigDebugAssert3();

    self = 0;
  }
LABEL_5:

  return self;
}

- (MTLComputePipelineState)demosaicBayerToARGB
{
  return self->_demosaicBayerToARGB;
}

- (MTLComputePipelineState)demosaicQuadraBayerToARGB
{
  return self->_demosaicQuadraBayerToARGB;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demosaicQuadraBayerToARGB, 0);

  objc_storeStrong((id *)&self->_demosaicBayerToARGB, 0);
}

@end