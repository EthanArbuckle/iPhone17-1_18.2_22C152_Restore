@interface CZDemosaicShader
- (CZDemosaicShader)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)czDemosaicStage;
@end

@implementation CZDemosaicShader

- (CZDemosaicShader)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)CZDemosaicShader;
  self = [(CZDemosaicShader *)&v8 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_4;
  }
  v5 = [v4 computePipelineStateFor:@"czDemosaicStage" constants:0];
  czDemosaicStage = self->_czDemosaicStage;
  self->_czDemosaicStage = v5;

  if (!self->_czDemosaicStage)
  {
LABEL_7:
    FigDebugAssert3();

    self = 0;
  }
LABEL_4:

  return self;
}

- (MTLComputePipelineState)czDemosaicStage
{
  return self->_czDemosaicStage;
}

- (void).cxx_destruct
{
}

@end