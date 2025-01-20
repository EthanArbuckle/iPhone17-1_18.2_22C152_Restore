@interface H13FastOutlierPixelCorrectionStageMetal
- (FigMetalContext)metal;
- (H13FastOutlierPixelCorrectionShaders)shaders;
- (H13FastOutlierPixelCorrectionStageMetal)initWithMetalContext:(id)a3;
- (int)runWithConfig:(const OutlierPixelCorrectionConfig *)a3 inputTex:(id)a4 outputTex:(id)a5;
- (void)setMetal:(id)a3;
@end

@implementation H13FastOutlierPixelCorrectionStageMetal

- (H13FastOutlierPixelCorrectionShaders)shaders
{
  return self->_shaders;
}

- (H13FastOutlierPixelCorrectionStageMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)H13FastOutlierPixelCorrectionStageMetal;
  v6 = [(H13FastOutlierPixelCorrectionStageMetal *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[H13FastOutlierPixelCorrectionShaders alloc] initWithMetalContext:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v7->_shaders))
  {
    v10 = v7;
  }
  else
  {
    FigDebugAssert3();
    v10 = 0;
  }

  return v10;
}

- (int)runWithConfig:(const OutlierPixelCorrectionConfig *)a3 inputTex:(id)a4 outputTex:(id)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if ([v8 pixelFormat] != 115 || objc_msgSend(v9, "pixelFormat") != 115) {
    goto LABEL_10;
  }
  int v10 = [v8 width];
  int v11 = [v8 height];
  objc_super v12 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v12)
  {
    FigDebugAssert3();
LABEL_10:
    int v20 = FigSignalErrorAt();
    goto LABEL_7;
  }
  v13 = v12;
  uint64_t v14 = [v12 computeCommandEncoder];
  if (v14)
  {
    v15 = (void *)v14;
    id v22 = v9;
    id v23 = v8;
    v16 = [(H13FastOutlierPixelCorrectionShaders *)self->_shaders outlierPixelCorrection];
    v27 = @"skipSize";
    v17 = [NSNumber numberWithUnsignedInt:a3->var1];
    v28[0] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v19 = [v16 getPipelineStateWithParams:v18];

    if (v19)
    {
      [v15 setComputePipelineState:v19];
      [v15 setImageblockWidth:16 height:16];
      id v8 = v23;
      [v15 setTexture:v23 atIndex:0];
      id v9 = v22;
      [v15 setTexture:v22 atIndex:1];
      [v15 setBytes:a3 length:16 atIndex:0];
      v26[0] = (v10 + 15) >> 4;
      v26[1] = (v11 + 15) >> 4;
      v26[2] = 1;
      int64x2_t v24 = vdupq_n_s64(0x10uLL);
      uint64_t v25 = 1;
      [v15 dispatchThreadgroups:v26 threadsPerThreadgroup:&v24];
      [v15 endEncoding];

      [(FigMetalContext *)self->_metal commit];
      int v20 = 0;
    }
    else
    {
      int v20 = FigSignalErrorAt();

      id v9 = v22;
      id v8 = v23;
    }
  }
  else
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
  }
LABEL_7:

  return v20;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (void)setMetal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_shaders, 0);
}

@end