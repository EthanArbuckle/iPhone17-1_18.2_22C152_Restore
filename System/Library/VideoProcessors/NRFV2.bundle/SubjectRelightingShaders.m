@interface SubjectRelightingShaders
- (SubjectRelightingShaders)initWithMetalContext:(id)a3;
@end

@implementation SubjectRelightingShaders

- (SubjectRelightingShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_13;
  }
  v27.receiver = self;
  v27.super_class = (Class)SubjectRelightingShaders;
  self = [(SubjectRelightingShaders *)&v27 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_10;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"srlV2GlobalSparseHistogram", 0);
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlV2GlobalHistogram = self->_srlV2GlobalHistogram;
  self->_srlV2GlobalHistogram = v6;

  if (!self->_srlV2GlobalHistogram) {
    goto LABEL_13;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v8, @"srlV2FaceSparseHistogram", 0);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlV2FaceHistogram = self->_srlV2FaceHistogram;
  self->_srlV2FaceHistogram = v9;

  if (!self->_srlV2FaceHistogram) {
    goto LABEL_13;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v11, @"srlV2CalcCoefficients", 0);
  v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlV2CalcCoefficients = self->_srlV2CalcCoefficients;
  self->_srlV2CalcCoefficients = v12;

  if (!self->_srlV2CalcCoefficients) {
    goto LABEL_13;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v14, @"srlV2GlobalSparseHistogramLivePhotos", 0);
  v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlV2GlobalHistogramLivePhotos = self->_srlV2GlobalHistogramLivePhotos;
  self->_srlV2GlobalHistogramLivePhotos = v15;

  if (!self->_srlV2GlobalHistogramLivePhotos) {
    goto LABEL_13;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v17, @"srlV2FaceSparseHistogramLivePhotos", 0);
  v18 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlV2FaceHistogramLivePhotos = self->_srlV2FaceHistogramLivePhotos;
  self->_srlV2FaceHistogramLivePhotos = v18;

  if (!self->_srlV2FaceHistogramLivePhotos) {
    goto LABEL_13;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v20, @"srlV2CalcCoefficientsLivePhotos", 0);
  v21 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlV2CalcCoefficientsLivePhotos = self->_srlV2CalcCoefficientsLivePhotos;
  self->_srlV2CalcCoefficientsLivePhotos = v21;

  if (!self->_srlV2CalcCoefficientsLivePhotos
    || (objc_msgSend_computePipelineStateFor_constants_(v4, v23, @"srlV2Apply", 0),
        v24 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        srlV2Apply = self->_srlV2Apply,
        self->_srlV2Apply = v24,
        srlV2Apply,
        !self->_srlV2Apply))
  {
LABEL_13:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_10:

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srlV2Apply, 0);
  objc_storeStrong((id *)&self->_srlV2CalcCoefficientsLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlV2FaceHistogramLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlV2GlobalHistogramLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlV2CalcCoefficients, 0);
  objc_storeStrong((id *)&self->_srlV2FaceHistogram, 0);

  objc_storeStrong((id *)&self->_srlV2GlobalHistogram, 0);
}

@end