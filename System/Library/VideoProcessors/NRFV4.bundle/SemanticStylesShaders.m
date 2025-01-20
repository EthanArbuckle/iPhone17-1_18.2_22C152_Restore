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
  v16.receiver = self;
  v16.super_class = (Class)SemanticStylesShaders;
  self = [(SemanticStylesShaders *)&v16 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
  v5 = [v4 computePipelineStateFor:@"ssCalculateLocalHistogramStats" constants:0];
  ssCalculateLocalHistogramStats = self->_ssCalculateLocalHistogramStats;
  self->_ssCalculateLocalHistogramStats = v5;

  if (!self->_ssCalculateLocalHistogramStats) {
    goto LABEL_11;
  }
  v7 = [v4 computePipelineStateFor:@"ssCalculateGlobalHistogram" constants:0];
  ssCalculateGlobalHistogram = self->_ssCalculateGlobalHistogram;
  self->_ssCalculateGlobalHistogram = v7;

  if (!self->_ssCalculateGlobalHistogram) {
    goto LABEL_11;
  }
  v9 = [v4 computePipelineStateFor:@"ssCalculateGlobalStats" constants:0];
  ssCalculateGlobalStats = self->_ssCalculateGlobalStats;
  self->_ssCalculateGlobalStats = v9;

  if (!self->_ssCalculateGlobalStats) {
    goto LABEL_11;
  }
  v11 = [v4 computePipelineStateFor:@"ssCreateGuide" constants:0];
  ssCreateGuide = self->_ssCreateGuide;
  self->_ssCreateGuide = v11;

  if (!self->_ssCreateGuide
    || ([v4 computePipelineStateFor:@"ssRenderAdjustments" constants:0],
        v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        ssRenderAdjustments = self->_ssRenderAdjustments,
        self->_ssRenderAdjustments = v13,
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