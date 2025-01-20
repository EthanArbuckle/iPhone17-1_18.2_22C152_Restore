@interface MotionDetectionShaders
- (MotionDetectionShaders)initWithMetal:(id)a3;
@end

@implementation MotionDetectionShaders

- (MotionDetectionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MotionDetectionShaders;
  v6 = [(MotionDetectionShaders *)&v38 init];
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"kernelMotionDetectGenClippingMapAndDownscale", 0);
  motionDetectGenClippingMapAndDownscale = v6->_motionDetectGenClippingMapAndDownscale;
  v6->_motionDetectGenClippingMapAndDownscale = (MTLComputePipelineState *)v7;

  if (!v6->_motionDetectGenClippingMapAndDownscale) {
    goto LABEL_14;
  }
  uint64_t v10 = objc_msgSend_computePipelineStateFor_constants_(v4, v9, @"kernelMotionDetectGenClippingMapAndDownscaleLinear", 0);
  motionDetectGenClippingMapAndDownscaleLinear = v6->_motionDetectGenClippingMapAndDownscaleLinear;
  v6->_motionDetectGenClippingMapAndDownscaleLinear = (MTLComputePipelineState *)v10;

  if (!v6->_motionDetectGenClippingMapAndDownscaleLinear) {
    goto LABEL_14;
  }
  uint64_t v13 = objc_msgSend_computePipelineStateFor_constants_(v4, v12, @"motionDetectGradient", 0);
  motionDetectGradient = v6->_motionDetectGradient;
  v6->_motionDetectGradient = (MTLComputePipelineState *)v13;

  if (!v6->_motionDetectGradient) {
    goto LABEL_14;
  }
  uint64_t v16 = objc_msgSend_computePipelineStateFor_constants_(v4, v15, @"motionDetectWarp", 0);
  motionDetectWarp = v6->_motionDetectWarp;
  v6->_motionDetectWarp = (MTLComputePipelineState *)v16;

  if (!v6->_motionDetectWarp) {
    goto LABEL_14;
  }
  uint64_t v19 = objc_msgSend_computePipelineStateFor_constants_(v4, v18, @"motionDetectDilate", 0);
  motionDetectDilate = v6->_motionDetectDilate;
  v6->_motionDetectDilate = (MTLComputePipelineState *)v19;

  if (!v6->_motionDetectDilate) {
    goto LABEL_14;
  }
  uint64_t v22 = objc_msgSend_computePipelineStateFor_constants_(v4, v21, @"motionDetectDiffGradient", 0);
  motionDetectDiffGradient = v6->_motionDetectDiffGradient;
  v6->_motionDetectDiffGradient = (MTLComputePipelineState *)v22;

  if (!v6->_motionDetectDiffGradient) {
    goto LABEL_14;
  }
  uint64_t v25 = objc_msgSend_computePipelineStateFor_constants_(v4, v24, @"motionDetectMaxTileAvg", 0);
  motionDetectMaxTileAvg = v6->_motionDetectMaxTileAvg;
  v6->_motionDetectMaxTileAvg = (MTLComputePipelineState *)v25;

  if (!v6->_motionDetectMaxTileAvg) {
    goto LABEL_14;
  }
  uint64_t v28 = objc_msgSend_computePipelineStateFor_constants_(v4, v27, @"motionDetectLLDownscale", 0);
  motionDetectLLDownscale = v6->_motionDetectLLDownscale;
  v6->_motionDetectLLDownscale = (MTLComputePipelineState *)v28;

  if (!v6->_motionDetectLLDownscale) {
    goto LABEL_14;
  }
  uint64_t v31 = objc_msgSend_computePipelineStateFor_constants_(v4, v30, @"motionDetectLL", 0);
  motionDetectLL = v6->_motionDetectLL;
  v6->_motionDetectLL = (MTLComputePipelineState *)v31;

  if (!v6->_motionDetectLL) {
    goto LABEL_14;
  }
  uint64_t v34 = objc_msgSend_computePipelineStateFor_constants_(v4, v33, @"motionDetectLLSumReduce", 0);
  motionDetectLLSumReduce = v6->_motionDetectLLSumReduce;
  v6->_motionDetectLLSumReduce = (MTLComputePipelineState *)v34;

  if (v6->_motionDetectLLSumReduce)
  {
LABEL_12:
    v36 = v6;
  }
  else
  {
LABEL_14:
    FigDebugAssert3();
    FigSignalErrorAt();
    v36 = 0;
  }

  return v36;
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