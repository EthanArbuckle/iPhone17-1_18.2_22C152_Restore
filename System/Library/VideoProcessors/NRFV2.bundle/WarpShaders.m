@interface WarpShaders
- (WarpShaders)initWithMetal:(id)a3;
@end

@implementation WarpShaders

- (WarpShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WarpShaders;
  v6 = [(WarpShaders *)&v16 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"warpCompute", 0);
    warpComputePipeline = v6->warpComputePipeline;
    v6->warpComputePipeline = (MTLComputePipelineState *)v7;

    if (v6->warpComputePipeline)
    {
      uint64_t v10 = objc_msgSend_computePipelineStateFor_constants_(v4, v9, @"warpComputeYCbCr", 0);
      warpComputePipelineYCbCr = v6->warpComputePipelineYCbCr;
      v6->warpComputePipelineYCbCr = (MTLComputePipelineState *)v10;

      if (v6->warpComputePipelineYCbCr) {
        goto LABEL_4;
      }
    }
    FigDebugAssert3();
    int v15 = FigSignalErrorAt();
    v12 = 0;
    if (!v15) {
LABEL_4:
    }
      v12 = v6;
  }
  else
  {
    FigDebugAssert3();
    v12 = 0;
  }
  v13 = v12;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->warpComputePipelineYCbCr, 0);

  objc_storeStrong((id *)&self->warpComputePipeline, 0);
}

@end