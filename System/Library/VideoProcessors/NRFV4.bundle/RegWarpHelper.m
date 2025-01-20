@interface RegWarpHelper
+ (int)prewarmShaders:(id)a3;
- (RegWarpHelper)initWithMetal:(id)a3;
- (int)convertInput10BitPixBuf:(__CVBuffer *)a3 downsampledOutput8BitPixBuf:(__CVBuffer *)a4 mtlCommandBuffer:(id)a5;
- (int)downsampleInputRGB:(id)a3 toLuma:(id)a4;
@end

@implementation RegWarpHelper

- (RegWarpHelper)initWithMetal:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
  v13.receiver = self;
  v13.super_class = (Class)RegWarpHelper;
  v6 = [(RegWarpHelper *)&v13 init];
  self = v6;
  if (!v6)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  v7 = +[RegWarpHelperShared sharedInstance];
  v8 = [v7 getShaders:self->_metal];
  shaders = self->_shaders;
  self->_shaders = v8;

  if (self->_shaders)
  {
    v10 = self;
  }
  else
  {
    FigDebugAssert3();
    if (FigSignalErrorAt()) {
      v10 = 0;
    }
    else {
      v10 = self;
    }
  }
LABEL_7:
  v11 = v10;

  return v11;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RegWarpHelper alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)convertInput10BitPixBuf:(__CVBuffer *)a3 downsampledOutput8BitPixBuf:(__CVBuffer *)a4 mtlCommandBuffer:(id)a5
{
  id v8 = a5;
  v9 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:+[LumaChromaImage getMetalLumaFormat:a3] usage:1 plane:0];
  if (v9
    && (-[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a4, +[LumaChromaImage getMetalLumaFormat:](LumaChromaImage, "getMetalLumaFormat:", a4), 2, 0), (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0)&& ((v11 = (void *)v10, [v9 pixelFormat] != 25)|| objc_msgSend(v11, "pixelFormat") != 10|| (v12 = objc_msgSend(v11, "newTextureViewWithPixelFormat:", 11), v11, (v11 = (void *)v12) != 0)))
  {
    objc_super v13 = [v8 computeCommandEncoder];
    if (v13)
    {
      v14 = v13;
      [v13 setComputePipelineState:self->_shaders->_downsampleAndConvert10To8];
      [v14 setTexture:v9 atIndex:0];
      [v14 setTexture:v11 atIndex:1];
      v19[0] = (unint64_t)[v9 width] >> 2;
      v19[1] = (unint64_t)[v9 height] >> 2;
      v19[2] = 1;
      int64x2_t v17 = vdupq_n_s64(0x10uLL);
      uint64_t v18 = 1;
      [v14 dispatchThreads:v19 threadsPerThreadgroup:&v17];
      [v14 endEncoding];

      int v15 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v15 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v15 = FigSignalErrorAt();
  }

  return v15;
}

- (int)downsampleInputRGB:(id)a3 toLuma:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 pixelFormat];
  uint64_t v9 = [v7 pixelFormat];
  if ((v8 == 70 || v8 == 115)
    && (v9 == 10 || v9 == 25)
    && (uint64_t v10 = [v7 width], objc_msgSend(v6, "width") == 2 * v10)
    && (uint64_t v11 = [v7 height], objc_msgSend(v6, "height") == 2 * v11))
  {
    uint64_t v12 = [(FigMetalContext *)self->_metal commandBuffer];
    if (v12)
    {
      objc_super v13 = v12;
      v14 = [v12 computeCommandEncoder];
      if (v14)
      {
        int v15 = v14;
        [v14 setComputePipelineState:self->_shaders->_downsampleRGBToLuma];
        [v15 setTexture:v6 atIndex:0];
        [v15 setTexture:v7 atIndex:1];
        [v15 setImageblockWidth:32 height:32];
        v21[0] = [v7 width];
        v21[1] = [v7 height];
        v21[2] = 1;
        int64x2_t v19 = vdupq_n_s64(0x20uLL);
        uint64_t v20 = 1;
        [v15 dispatchThreads:v21 threadsPerThreadgroup:&v19];
        [v15 endEncoding];
        [(FigMetalContext *)self->_metal commit];

        int v16 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v16 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v16 = FigSignalErrorAt();
    }
  }
  else
  {
    int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int64x2_t v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v16 = -1;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end