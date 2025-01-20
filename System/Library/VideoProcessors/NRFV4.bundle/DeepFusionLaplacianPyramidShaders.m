@interface DeepFusionLaplacianPyramidShaders
- (DeepFusionLaplacianPyramidShaders)initWithMetal:(id)a3;
@end

@implementation DeepFusionLaplacianPyramidShaders

- (DeepFusionLaplacianPyramidShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DeepFusionLaplacianPyramidShaders;
  v5 = [(DeepFusionLaplacianPyramidShaders *)&v20 init];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"boxPyramid5x5" constants:0];
  krnBoxPyramid5x5 = v5->_krnBoxPyramid5x5;
  v5->_krnBoxPyramid5x5 = (MTLComputePipelineState *)v6;

  if (!v5->_krnBoxPyramid5x5) {
    goto LABEL_10;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"bilinearPyramid" constants:0];
  krnBilinearPyramid = v5->_krnBilinearPyramid;
  v5->_krnBilinearPyramid = (MTLComputePipelineState *)v8;

  if (!v5->_krnBilinearPyramid) {
    goto LABEL_10;
  }
  uint64_t v10 = [v4 computePipelineStateFor:@"gaussianPyramid5_16x18" constants:0];
  krnGaussianPyramid5_16x18 = v5->_krnGaussianPyramid5_16x18;
  v5->_krnGaussianPyramid5_16x18 = (MTLComputePipelineState *)v10;

  if (!v5->_krnGaussianPyramid5_16x18) {
    goto LABEL_10;
  }
  uint64_t v12 = [v4 computePipelineStateFor:@"laplacianPyramidSubtractionPass" constants:0];
  krnLaplacianPyramidSubtractionPass = v5->_krnLaplacianPyramidSubtractionPass;
  v5->_krnLaplacianPyramidSubtractionPass = (MTLComputePipelineState *)v12;

  if (!v5->_krnLaplacianPyramidSubtractionPass) {
    goto LABEL_10;
  }
  uint64_t v14 = [v4 computePipelineStateFor:@"laplacianPyramidGaussian" constants:0];
  krnLaplacianGaussian = v5->_krnLaplacianGaussian;
  v5->_krnLaplacianGaussian = (MTLComputePipelineState *)v14;

  if (!v5->_krnLaplacianGaussian) {
    goto LABEL_10;
  }
  uint64_t v16 = [v4 computePipelineStateFor:@"laplacianPyramidGaussianLap" constants:0];
  krnLaplacianGaussianLap = v5->_krnLaplacianGaussianLap;
  v5->_krnLaplacianGaussianLap = (MTLComputePipelineState *)v16;

  if (v5->_krnLaplacianGaussianLap)
  {
LABEL_8:
    v18 = v5;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    FigSignalErrorAt();
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_krnLaplacianPyramidSubtractionPass, 0);
  objc_storeStrong((id *)&self->_krnLaplacianGaussianLap, 0);
  objc_storeStrong((id *)&self->_krnLaplacianGaussian, 0);
  objc_storeStrong((id *)&self->_krnGaussianPyramid5_16x18, 0);
  objc_storeStrong((id *)&self->_krnBilinearPyramid, 0);

  objc_storeStrong((id *)&self->_krnBoxPyramid5x5, 0);
}

@end