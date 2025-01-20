@interface RegWarpShaders
- (MTLComputePipelineState)demosaicQuarterLuma;
- (RegWarpShaders)initWithMetalContext:(id)a3;
@end

@implementation RegWarpShaders

- (RegWarpShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)RegWarpShaders;
  self = [(RegWarpShaders *)&v8 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_4;
  }
  v5 = [v4 computePipelineStateFor:@"SoftISPRegWarp::demosaicQuarterLuma" constants:0];
  demosaicQuarterLuma = self->_demosaicQuarterLuma;
  self->_demosaicQuarterLuma = v5;

  if (!self->_demosaicQuarterLuma)
  {
LABEL_7:
    FigDebugAssert3();

    self = 0;
  }
LABEL_4:

  return self;
}

- (MTLComputePipelineState)demosaicQuarterLuma
{
  return self->_demosaicQuarterLuma;
}

- (void).cxx_destruct
{
}

@end