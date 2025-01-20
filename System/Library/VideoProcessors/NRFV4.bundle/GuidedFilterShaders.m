@interface GuidedFilterShaders
- (GuidedFilterShaders)initWithMetalContext:(id)a3;
@end

@implementation GuidedFilterShaders

- (GuidedFilterShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_10;
  }
  v14.receiver = self;
  v14.super_class = (Class)GuidedFilterShaders;
  self = [(GuidedFilterShaders *)&v14 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_7;
  }
  v5 = [v4 computePipelineStateFor:@"gfDownsampleGuide" constants:0];
  gfDownsampleGuide = self->_gfDownsampleGuide;
  self->_gfDownsampleGuide = v5;

  if (!self->_gfDownsampleGuide) {
    goto LABEL_10;
  }
  v7 = [v4 computePipelineStateFor:@"gfCalculateCoefficients" constants:0];
  gfCalculateCoefficients = self->_gfCalculateCoefficients;
  self->_gfCalculateCoefficients = v7;

  if (!self->_gfCalculateCoefficients) {
    goto LABEL_10;
  }
  v9 = [v4 computePipelineStateFor:@"gfFilterCoefficients" constants:0];
  gfFilterCoefficients = self->_gfFilterCoefficients;
  self->_gfFilterCoefficients = v9;

  if (!self->_gfFilterCoefficients
    || ([v4 computePipelineStateFor:@"gfApplyCoefficients" constants:0],
        v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        gfApplyCoefficients = self->_gfApplyCoefficients,
        self->_gfApplyCoefficients = v11,
        gfApplyCoefficients,
        !self->_gfApplyCoefficients))
  {
LABEL_10:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_7:

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gfApplyCoefficients, 0);
  objc_storeStrong((id *)&self->_gfFilterCoefficients, 0);
  objc_storeStrong((id *)&self->_gfCalculateCoefficients, 0);

  objc_storeStrong((id *)&self->_gfDownsampleGuide, 0);
}

@end