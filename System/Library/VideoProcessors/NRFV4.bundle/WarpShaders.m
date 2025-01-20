@interface WarpShaders
- (WarpShaders)initWithMetal:(id)a3;
@end

@implementation WarpShaders

- (WarpShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WarpShaders;
  v5 = [(WarpShaders *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 computePipelineStateFor:@"warpCompute" constants:0];
    warpComputePipeline = v5->warpComputePipeline;
    v5->warpComputePipeline = (MTLComputePipelineState *)v6;

    if (v5->warpComputePipeline)
    {
      uint64_t v8 = [v4 computePipelineStateFor:@"warpComputeYCbCr" constants:0];
      warpComputePipelineYCbCr = v5->warpComputePipelineYCbCr;
      v5->warpComputePipelineYCbCr = (MTLComputePipelineState *)v8;

      if (v5->warpComputePipelineYCbCr) {
        goto LABEL_4;
      }
    }
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
    v10 = 0;
    if (!v13) {
LABEL_4:
    }
      v10 = v5;
  }
  else
  {
    FigDebugAssert3();
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->warpComputePipelineYCbCr, 0);

  objc_storeStrong((id *)&self->warpComputePipeline, 0);
}

@end