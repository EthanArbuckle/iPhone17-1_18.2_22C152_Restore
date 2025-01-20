@interface H13FastCanvasStageMetal
- (FigMetalContext)metal;
- (H13FastCanvasShaders)shaders;
- (H13FastCanvasStageMetal)initWithMetalContext:(id)a3;
- (int)encodeWithCanvasQueueRGB:(id)a3 inputTex:(id)a4 outputTex:(id)a5;
- (int)encodeWithCanvasQueueYUV:(id)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7;
- (void)setMetal:(id)a3;
@end

@implementation H13FastCanvasStageMetal

- (H13FastCanvasStageMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)H13FastCanvasStageMetal;
  v6 = [(H13FastCanvasStageMetal *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[H13FastCanvasShaders alloc] initWithMetalContext:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v7->_shaders))
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

- (int)encodeWithCanvasQueueRGB:(id)a3 inputTex:(id)a4 outputTex:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(FigMetalContext *)self->_metal commandBuffer];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 blitCommandEncoder];
    memset(v16, 0, sizeof(v16));
    v15[0] = [v7 width];
    v15[1] = [v7 height];
    v15[2] = 1;
    memset(v14, 0, sizeof(v14));
    [v11 copyFromTexture:v7 sourceSlice:0 sourceLevel:0 sourceOrigin:v16 sourceSize:v15 toTexture:v8 destinationSlice:0 destinationLevel:0 destinationOrigin:v14];
    [v11 endEncoding];

    [(FigMetalContext *)self->_metal commit];
    int v12 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
  }

  return v12;
}

- (int)encodeWithCanvasQueueYUV:(id)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [(FigMetalContext *)self->_metal commandBuffer];
  v16 = v15;
  if (v15)
  {
    v17 = [v15 blitCommandEncoder];
    memset(v26, 0, sizeof(v26));
    v25[0] = [v11 width];
    v25[1] = [v11 height];
    v25[2] = 1;
    memset(v24, 0, sizeof(v24));
    [v17 copyFromTexture:v11 sourceSlice:0 sourceLevel:0 sourceOrigin:v26 sourceSize:v25 toTexture:v13 destinationSlice:0 destinationLevel:0 destinationOrigin:v24];
    [v17 endEncoding];

    v18 = [v16 blitCommandEncoder];
    memset(v23, 0, sizeof(v23));
    v22[0] = [v12 width];
    v22[1] = [v12 height];
    v22[2] = 1;
    memset(v21, 0, sizeof(v21));
    [v18 copyFromTexture:v12 sourceSlice:0 sourceLevel:0 sourceOrigin:v23 sourceSize:v22 toTexture:v14 destinationSlice:0 destinationLevel:0 destinationOrigin:v21];
    [v18 endEncoding];

    [(FigMetalContext *)self->_metal commit];
    int v19 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
  }

  return v19;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (void)setMetal:(id)a3
{
}

- (H13FastCanvasShaders)shaders
{
  return self->_shaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_shaders, 0);
}

@end