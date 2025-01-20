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
  v18.receiver = self;
  v18.super_class = (Class)GuidedFilterShaders;
  self = [(GuidedFilterShaders *)&v18 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_7;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"gfDownsampleGuide", 0);
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  gfDownsampleGuide = self->_gfDownsampleGuide;
  self->_gfDownsampleGuide = v6;

  if (!self->_gfDownsampleGuide) {
    goto LABEL_10;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v8, @"gfCalculateCoefficients", 0);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  gfCalculateCoefficients = self->_gfCalculateCoefficients;
  self->_gfCalculateCoefficients = v9;

  if (!self->_gfCalculateCoefficients) {
    goto LABEL_10;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v11, @"gfFilterCoefficients", 0);
  v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  gfFilterCoefficients = self->_gfFilterCoefficients;
  self->_gfFilterCoefficients = v12;

  if (!self->_gfFilterCoefficients
    || (objc_msgSend_computePipelineStateFor_constants_(v4, v14, @"gfApplyCoefficients", 0),
        v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        gfApplyCoefficients = self->_gfApplyCoefficients,
        self->_gfApplyCoefficients = v15,
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