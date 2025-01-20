@interface BlinkDetectionShaders
- (BlinkDetectionShaders)initWithMetal:(id)a3;
@end

@implementation BlinkDetectionShaders

- (BlinkDetectionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BlinkDetectionShaders;
  v6 = [(BlinkDetectionShaders *)&v12 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"BlinkDetection", 0);
    blinkDetectionComputePipeline = v6->blinkDetectionComputePipeline;
    v6->blinkDetectionComputePipeline = (MTLComputePipelineState *)v7;

    v9 = v6;
    if (!v6->blinkDetectionComputePipeline)
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v9 = 0;
      }
      else {
        v9 = v6;
      }
    }
  }
  else
  {
    FigDebugAssert3();
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (void).cxx_destruct
{
}

@end