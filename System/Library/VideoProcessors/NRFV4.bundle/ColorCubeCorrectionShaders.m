@interface ColorCubeCorrectionShaders
- (ColorCubeCorrectionShaders)initWithMetal:(id)a3;
@end

@implementation ColorCubeCorrectionShaders

- (ColorCubeCorrectionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ColorCubeCorrectionShaders;
  v5 = [(ColorCubeCorrectionShaders *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 computePipelineStateFor:@"red_face_fix" constants:0];
    colorCubeCorrectionComputePipeline = v5->colorCubeCorrectionComputePipeline;
    v5->colorCubeCorrectionComputePipeline = (MTLComputePipelineState *)v6;

    if (v5->colorCubeCorrectionComputePipeline)
    {
      uint64_t v8 = [v4 computePipelineStateFor:@"maskedCubeApply" constants:0];
      maskedColorCubeCorrectionComputePipeline = v5->maskedColorCubeCorrectionComputePipeline;
      v5->maskedColorCubeCorrectionComputePipeline = (MTLComputePipelineState *)v8;

      if (v5->maskedColorCubeCorrectionComputePipeline) {
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
  objc_storeStrong((id *)&self->maskedColorCubeCorrectionComputePipeline, 0);

  objc_storeStrong((id *)&self->colorCubeCorrectionComputePipeline, 0);
}

@end