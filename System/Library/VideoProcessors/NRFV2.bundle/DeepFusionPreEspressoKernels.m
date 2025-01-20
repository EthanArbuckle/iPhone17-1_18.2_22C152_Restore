@interface DeepFusionPreEspressoKernels
- (DeepFusionPreEspressoKernels)initWithMetal:(id)a3 networkVersion:(int)a4;
@end

@implementation DeepFusionPreEspressoKernels

- (DeepFusionPreEspressoKernels)initWithMetal:(id)a3 networkVersion:(int)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DeepFusionPreEspressoKernels;
  v8 = [(DeepFusionPreEspressoKernels *)&v29 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_computePipelineStateFor_constants_(v6, v7, @"yuvCopyAndBias", 0);
    yuvCopyAndBias = v8->_yuvCopyAndBias;
    v8->_yuvCopyAndBias = (MTLComputePipelineState *)v9;

    if (!v8->_yuvCopyAndBias) {
      goto LABEL_10;
    }
    uint64_t v12 = objc_msgSend_computePipelineStateFor_constants_(v6, v11, @"yuvPlanarRGBToRGBA", 0);
    yuvPlanarRGBToRGBA = v8->_yuvPlanarRGBToRGBA;
    v8->_yuvPlanarRGBToRGBA = (MTLComputePipelineState *)v12;

    if (!v8->_yuvPlanarRGBToRGBA
      || (objc_msgSend_computePipelineStateFor_constants_(v6, v14, @"filterChroma", 0),
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          filterChroma = v8->_filterChroma,
          v8->_filterChroma = (MTLComputePipelineState *)v15,
          filterChroma,
          !v8->_filterChroma))
    {
LABEL_10:
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v25 = 0;
      goto LABEL_9;
    }
    id v17 = objc_alloc_init(MEMORY[0x263F128B0]);
    BOOL v28 = a4 == 2;
    objc_msgSend_setConstantValue_type_atIndex_(v17, v18, (uint64_t)&v28, 53, 1);
    int v27 = 0;
    estimateAndTuneNoise = v8->_estimateAndTuneNoise;
    do
    {
      objc_msgSend_setConstantValue_type_atIndex_(v17, v19, (uint64_t)&v27, 53, 0);
      uint64_t v22 = objc_msgSend_computePipelineStateFor_constants_(v6, v21, @"estimateAndTuneNoise", (uint64_t)v17);
      v23 = estimateAndTuneNoise[v27];
      estimateAndTuneNoise[v27] = (MTLComputePipelineState *)v22;

      int v24 = v27++;
    }
    while (v24 < 1);
  }
  v25 = v8;
LABEL_9:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterChroma, 0);
  objc_storeStrong((id *)&self->_yuvPlanarRGBToRGBA, 0);
  objc_storeStrong((id *)&self->_yuvCopyAndBias, 0);
  uint64_t v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end