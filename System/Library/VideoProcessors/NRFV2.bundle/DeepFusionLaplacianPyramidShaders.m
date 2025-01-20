@interface DeepFusionLaplacianPyramidShaders
- (DeepFusionLaplacianPyramidShaders)initWithMetal:(id)a3;
@end

@implementation DeepFusionLaplacianPyramidShaders

- (DeepFusionLaplacianPyramidShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)DeepFusionLaplacianPyramidShaders;
  v6 = [(DeepFusionLaplacianPyramidShaders *)&v32 init];
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"boxPyramid5x5", 0);
  krnBoxPyramid5x5 = v6->_krnBoxPyramid5x5;
  v6->_krnBoxPyramid5x5 = (MTLComputePipelineState *)v7;

  if (!v6->_krnBoxPyramid5x5) {
    goto LABEL_12;
  }
  uint64_t v10 = objc_msgSend_computePipelineStateFor_constants_(v4, v9, @"bilinearPyramid", 0);
  krnBilinearPyramid = v6->_krnBilinearPyramid;
  v6->_krnBilinearPyramid = (MTLComputePipelineState *)v10;

  if (!v6->_krnBilinearPyramid) {
    goto LABEL_12;
  }
  uint64_t v13 = objc_msgSend_computePipelineStateFor_constants_(v4, v12, @"gaussianPyramid5SeparableH", 0);
  krnGaussianPyramid5SeparableH = v6->_krnGaussianPyramid5SeparableH;
  v6->_krnGaussianPyramid5SeparableH = (MTLComputePipelineState *)v13;

  if (!v6->_krnGaussianPyramid5SeparableH) {
    goto LABEL_12;
  }
  uint64_t v16 = objc_msgSend_computePipelineStateFor_constants_(v4, v15, @"gaussianPyramid5SeparableV", 0);
  krnGaussianPyramid5SeparableV = v6->_krnGaussianPyramid5SeparableV;
  v6->_krnGaussianPyramid5SeparableV = (MTLComputePipelineState *)v16;

  if (!v6->_krnGaussianPyramid5SeparableV) {
    goto LABEL_12;
  }
  uint64_t v19 = objc_msgSend_computePipelineStateFor_constants_(v4, v18, @"laplacianPyramidSubtractionPass", 0);
  krnLaplacianPyramidSubtractionPass = v6->_krnLaplacianPyramidSubtractionPass;
  v6->_krnLaplacianPyramidSubtractionPass = (MTLComputePipelineState *)v19;

  if (!v6->_krnLaplacianPyramidSubtractionPass) {
    goto LABEL_12;
  }
  uint64_t v22 = objc_msgSend_computePipelineStateFor_constants_(v4, v21, @"laplacianPyramidGaussianH", 0);
  krnLaplacianGaussianH = v6->_krnLaplacianGaussianH;
  v6->_krnLaplacianGaussianH = (MTLComputePipelineState *)v22;

  if (!v6->_krnLaplacianGaussianH) {
    goto LABEL_12;
  }
  uint64_t v25 = objc_msgSend_computePipelineStateFor_constants_(v4, v24, @"laplacianPyramidGaussianV", 0);
  krnLaplacianGaussianV = v6->_krnLaplacianGaussianV;
  v6->_krnLaplacianGaussianV = (MTLComputePipelineState *)v25;

  if (!v6->_krnLaplacianGaussianV) {
    goto LABEL_12;
  }
  uint64_t v28 = objc_msgSend_computePipelineStateFor_constants_(v4, v27, @"laplacianPyramidGaussianVLap", 0);
  krnLaplacianGaussianVLap = v6->_krnLaplacianGaussianVLap;
  v6->_krnLaplacianGaussianVLap = (MTLComputePipelineState *)v28;

  if (v6->_krnLaplacianGaussianVLap)
  {
LABEL_10:
    v30 = v6;
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    FigSignalErrorAt();
    v30 = 0;
  }

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_krnLaplacianPyramidSubtractionPass, 0);
  objc_storeStrong((id *)&self->_krnLaplacianGaussianVLap, 0);
  objc_storeStrong((id *)&self->_krnLaplacianGaussianV, 0);
  objc_storeStrong((id *)&self->_krnLaplacianGaussianH, 0);
  objc_storeStrong((id *)&self->_krnGaussianPyramid5SeparableV, 0);
  objc_storeStrong((id *)&self->_krnGaussianPyramid5SeparableH, 0);
  objc_storeStrong((id *)&self->_krnBilinearPyramid, 0);

  objc_storeStrong((id *)&self->_krnBoxPyramid5x5, 0);
}

@end