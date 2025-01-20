@interface SemanticStylesShaders
- (SemanticStylesShaders)initWithMetalContext:(id)a3;
@end

@implementation SemanticStylesShaders

- (SemanticStylesShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  v21.receiver = self;
  v21.super_class = (Class)SemanticStylesShaders;
  self = [(SemanticStylesShaders *)&v21 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"ssCalculateLocalHistogramStats", 0);
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  ssCalculateLocalHistogramStats = self->_ssCalculateLocalHistogramStats;
  self->_ssCalculateLocalHistogramStats = v6;

  if (!self->_ssCalculateLocalHistogramStats) {
    goto LABEL_11;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v8, @"ssCalculateGlobalHistogram", 0);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  ssCalculateGlobalHistogram = self->_ssCalculateGlobalHistogram;
  self->_ssCalculateGlobalHistogram = v9;

  if (!self->_ssCalculateGlobalHistogram) {
    goto LABEL_11;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v11, @"ssCalculateGlobalStats", 0);
  v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  ssCalculateGlobalStats = self->_ssCalculateGlobalStats;
  self->_ssCalculateGlobalStats = v12;

  if (!self->_ssCalculateGlobalStats) {
    goto LABEL_11;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v14, @"ssCreateGuide", 0);
  v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  ssCreateGuide = self->_ssCreateGuide;
  self->_ssCreateGuide = v15;

  if (!self->_ssCreateGuide
    || (objc_msgSend_computePipelineStateFor_constants_(v4, v17, @"ssRenderAdjustments", 0),
        v18 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        ssRenderAdjustments = self->_ssRenderAdjustments,
        self->_ssRenderAdjustments = v18,
        ssRenderAdjustments,
        !self->_ssRenderAdjustments))
  {
LABEL_11:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_8:

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssRenderAdjustments, 0);
  objc_storeStrong((id *)&self->_ssCreateGuide, 0);
  objc_storeStrong((id *)&self->_ssCalculateGlobalStats, 0);
  objc_storeStrong((id *)&self->_ssCalculateGlobalHistogram, 0);

  objc_storeStrong((id *)&self->_ssCalculateLocalHistogramStats, 0);
}

@end