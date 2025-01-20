@interface BlinkDetectionShaders
- (BlinkDetectionShaders)initWithMetal:(id)a3;
@end

@implementation BlinkDetectionShaders

- (BlinkDetectionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BlinkDetectionShaders;
  v5 = [(BlinkDetectionShaders *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 computePipelineStateFor:@"BlinkDetection" constants:0];
    blinkDetectionComputePipeline = v5->blinkDetectionComputePipeline;
    v5->blinkDetectionComputePipeline = (MTLComputePipelineState *)v6;

    v8 = v5;
    if (!v5->blinkDetectionComputePipeline)
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v8 = 0;
      }
      else {
        v8 = v5;
      }
    }
  }
  else
  {
    FigDebugAssert3();
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
}

@end