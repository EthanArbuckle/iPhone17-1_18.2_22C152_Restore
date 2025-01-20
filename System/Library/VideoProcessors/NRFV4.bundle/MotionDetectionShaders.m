@interface MotionDetectionShaders
- (MotionDetectionShaders)initWithMetal:(id)a3;
@end

@implementation MotionDetectionShaders

- (MotionDetectionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MotionDetectionShaders;
  v5 = [(MotionDetectionShaders *)&v28 init];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"kernelMotionDetectGenClippingMapAndDownscale" constants:0];
  motionDetectGenClippingMapAndDownscale = v5->_motionDetectGenClippingMapAndDownscale;
  v5->_motionDetectGenClippingMapAndDownscale = (MTLComputePipelineState *)v6;

  if (!v5->_motionDetectGenClippingMapAndDownscale) {
    goto LABEL_14;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"kernelMotionDetectGenClippingMapAndDownscaleLinear" constants:0];
  motionDetectGenClippingMapAndDownscaleLinear = v5->_motionDetectGenClippingMapAndDownscaleLinear;
  v5->_motionDetectGenClippingMapAndDownscaleLinear = (MTLComputePipelineState *)v8;

  if (!v5->_motionDetectGenClippingMapAndDownscaleLinear) {
    goto LABEL_14;
  }
  uint64_t v10 = [v4 computePipelineStateFor:@"motionDetectGradient" constants:0];
  motionDetectGradient = v5->_motionDetectGradient;
  v5->_motionDetectGradient = (MTLComputePipelineState *)v10;

  if (!v5->_motionDetectGradient) {
    goto LABEL_14;
  }
  uint64_t v12 = [v4 computePipelineStateFor:@"motionDetectWarp" constants:0];
  motionDetectWarp = v5->_motionDetectWarp;
  v5->_motionDetectWarp = (MTLComputePipelineState *)v12;

  if (!v5->_motionDetectWarp) {
    goto LABEL_14;
  }
  uint64_t v14 = [v4 computePipelineStateFor:@"motionDetectDilate" constants:0];
  motionDetectDilate = v5->_motionDetectDilate;
  v5->_motionDetectDilate = (MTLComputePipelineState *)v14;

  if (!v5->_motionDetectDilate) {
    goto LABEL_14;
  }
  uint64_t v16 = [v4 computePipelineStateFor:@"motionDetectDiffGradient" constants:0];
  motionDetectDiffGradient = v5->_motionDetectDiffGradient;
  v5->_motionDetectDiffGradient = (MTLComputePipelineState *)v16;

  if (!v5->_motionDetectDiffGradient) {
    goto LABEL_14;
  }
  uint64_t v18 = [v4 computePipelineStateFor:@"motionDetectMaxTileAvg" constants:0];
  motionDetectMaxTileAvg = v5->_motionDetectMaxTileAvg;
  v5->_motionDetectMaxTileAvg = (MTLComputePipelineState *)v18;

  if (!v5->_motionDetectMaxTileAvg) {
    goto LABEL_14;
  }
  uint64_t v20 = [v4 computePipelineStateFor:@"motionDetectLLDownscale" constants:0];
  motionDetectLLDownscale = v5->_motionDetectLLDownscale;
  v5->_motionDetectLLDownscale = (MTLComputePipelineState *)v20;

  if (!v5->_motionDetectLLDownscale) {
    goto LABEL_14;
  }
  uint64_t v22 = [v4 computePipelineStateFor:@"motionDetectLL" constants:0];
  motionDetectLL = v5->_motionDetectLL;
  v5->_motionDetectLL = (MTLComputePipelineState *)v22;

  if (!v5->_motionDetectLL) {
    goto LABEL_14;
  }
  uint64_t v24 = [v4 computePipelineStateFor:@"motionDetectLLSumReduce" constants:0];
  motionDetectLLSumReduce = v5->_motionDetectLLSumReduce;
  v5->_motionDetectLLSumReduce = (MTLComputePipelineState *)v24;

  if (v5->_motionDetectLLSumReduce)
  {
LABEL_12:
    v26 = v5;
  }
  else
  {
LABEL_14:
    FigDebugAssert3();
    FigSignalErrorAt();
    v26 = 0;
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDetectLLSumReduce, 0);
  objc_storeStrong((id *)&self->_motionDetectLL, 0);
  objc_storeStrong((id *)&self->_motionDetectLLDownscale, 0);
  objc_storeStrong((id *)&self->_motionDetectMaxTileAvg, 0);
  objc_storeStrong((id *)&self->_motionDetectDiffGradient, 0);
  objc_storeStrong((id *)&self->_motionDetectDilate, 0);
  objc_storeStrong((id *)&self->_motionDetectWarp, 0);
  objc_storeStrong((id *)&self->_motionDetectGradient, 0);
  objc_storeStrong((id *)&self->_motionDetectGenClippingMapAndDownscaleLinear, 0);

  objc_storeStrong((id *)&self->_motionDetectGenClippingMapAndDownscale, 0);
}

@end