@interface SubjectRelightingShaders
- (SubjectRelightingShaders)initWithMetalContext:(id)a3;
@end

@implementation SubjectRelightingShaders

- (SubjectRelightingShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_16;
  }
  v26.receiver = self;
  v26.super_class = (Class)SubjectRelightingShaders;
  self = [(SubjectRelightingShaders *)&v26 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_13;
  }
  v5 = [v4 computePipelineStateFor:@"srlV2GlobalSparseHistogram" constants:0];
  srlV2GlobalHistogram = self->_srlV2GlobalHistogram;
  self->_srlV2GlobalHistogram = v5;

  if (!self->_srlV2GlobalHistogram) {
    goto LABEL_16;
  }
  v7 = [v4 computePipelineStateFor:@"srlV2FaceSparseHistogram" constants:0];
  srlV2FaceHistogram = self->_srlV2FaceHistogram;
  self->_srlV2FaceHistogram = v7;

  if (!self->_srlV2FaceHistogram) {
    goto LABEL_16;
  }
  v9 = [v4 computePipelineStateFor:@"srlV2CalcCoefficients" constants:0];
  srlV2CalcCoefficients = self->_srlV2CalcCoefficients;
  self->_srlV2CalcCoefficients = v9;

  if (!self->_srlV2CalcCoefficients) {
    goto LABEL_16;
  }
  v11 = [v4 computePipelineStateFor:@"srlV2GlobalSparseHistogramLivePhotos" constants:0];
  srlV2GlobalHistogramLivePhotos = self->_srlV2GlobalHistogramLivePhotos;
  self->_srlV2GlobalHistogramLivePhotos = v11;

  if (!self->_srlV2GlobalHistogramLivePhotos) {
    goto LABEL_16;
  }
  v13 = [v4 computePipelineStateFor:@"srlV2FaceSparseHistogramLivePhotos" constants:0];
  srlV2FaceHistogramLivePhotos = self->_srlV2FaceHistogramLivePhotos;
  self->_srlV2FaceHistogramLivePhotos = v13;

  if (!self->_srlV2FaceHistogramLivePhotos) {
    goto LABEL_16;
  }
  v15 = [v4 computePipelineStateFor:@"srlV3CalcCoefficientsLivePhotos" constants:0];
  srlV2CalcCoefficientsLivePhotos = self->_srlV2CalcCoefficientsLivePhotos;
  self->_srlV2CalcCoefficientsLivePhotos = v15;

  if (!self->_srlV2CalcCoefficientsLivePhotos) {
    goto LABEL_16;
  }
  v17 = [v4 computePipelineStateFor:@"srlV2Apply" constants:0];
  srlV2Apply = self->_srlV2Apply;
  self->_srlV2Apply = v17;

  if (!self->_srlV2Apply) {
    goto LABEL_16;
  }
  v19 = [v4 computePipelineStateFor:@"srlV3CalcCoefficients" constants:0];
  srlV3CalcCoefficients = self->_srlV3CalcCoefficients;
  self->_srlV3CalcCoefficients = v19;

  if (!self->_srlV3CalcCoefficients) {
    goto LABEL_16;
  }
  v21 = [v4 computePipelineStateFor:@"srlV3CalcPostSRLStats" constants:0];
  srlV3CalcPostSRLStats = self->_srlV3CalcPostSRLStats;
  self->_srlV3CalcPostSRLStats = v21;

  if (!self->_srlV3CalcPostSRLStats
    || ([v4 computePipelineStateFor:@"srlV3Apply" constants:0],
        v23 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        srlV3Apply = self->_srlV3Apply,
        self->_srlV3Apply = v23,
        srlV3Apply,
        !self->_srlV3Apply))
  {
LABEL_16:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_13:

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srlV3CalcPostSRLStats, 0);
  objc_storeStrong((id *)&self->_srlV3CalcCoefficients, 0);
  objc_storeStrong((id *)&self->_srlV3Apply, 0);
  objc_storeStrong((id *)&self->_srlV2Apply, 0);
  objc_storeStrong((id *)&self->_srlV2CalcCoefficientsLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlV2FaceHistogramLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlV2GlobalHistogramLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlV2CalcCoefficients, 0);
  objc_storeStrong((id *)&self->_srlV2FaceHistogram, 0);

  objc_storeStrong((id *)&self->_srlV2GlobalHistogram, 0);
}

@end