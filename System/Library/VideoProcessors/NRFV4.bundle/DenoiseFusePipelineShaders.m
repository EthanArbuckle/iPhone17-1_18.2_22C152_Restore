@interface DenoiseFusePipelineShaders
- (DenoiseFusePipelineShaders)initWithMetal:(id)a3;
@end

@implementation DenoiseFusePipelineShaders

- (DenoiseFusePipelineShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DenoiseFusePipelineShaders;
  v5 = [(DenoiseFusePipelineShaders *)&v10 init];
  if (v5
    && ([v4 computePipelineStateFor:@"stationaryDownsampleForInference" constants:0],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        downsampleInference = v5->_downsampleInference,
        v5->_downsampleInference = (MTLComputePipelineState *)v6,
        downsampleInference,
        !v5->_downsampleInference))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end