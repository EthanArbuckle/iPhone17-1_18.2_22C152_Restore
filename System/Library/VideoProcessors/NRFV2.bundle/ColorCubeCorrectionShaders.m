@interface ColorCubeCorrectionShaders
- (ColorCubeCorrectionShaders)initWithMetal:(id)a3;
@end

@implementation ColorCubeCorrectionShaders

- (ColorCubeCorrectionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ColorCubeCorrectionShaders;
  v6 = [(ColorCubeCorrectionShaders *)&v16 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"red_face_fix", 0);
    colorCubeCorrectionComputePipeline = v6->colorCubeCorrectionComputePipeline;
    v6->colorCubeCorrectionComputePipeline = (MTLComputePipelineState *)v7;

    if (v6->colorCubeCorrectionComputePipeline)
    {
      uint64_t v10 = objc_msgSend_computePipelineStateFor_constants_(v4, v9, @"maskedCubeApply", 0);
      maskedColorCubeCorrectionComputePipeline = v6->maskedColorCubeCorrectionComputePipeline;
      v6->maskedColorCubeCorrectionComputePipeline = (MTLComputePipelineState *)v10;

      if (v6->maskedColorCubeCorrectionComputePipeline) {
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
  objc_storeStrong((id *)&self->maskedColorCubeCorrectionComputePipeline, 0);

  objc_storeStrong((id *)&self->colorCubeCorrectionComputePipeline, 0);
}

@end