@interface PTRenderEffectContainer
- (PTRenderEffect)renderEffect;
- (PTRenderEffectContainer)initWithMetalContext:(id)a3 renderEffect:(id)a4 colorSize:(id *)a5;
- (PTRenderEffectContainer)initWithMetalContext:(id)a3 rgbaOutputPixelFormat:(unint64_t)a4 depthOutputPixelFormat:(unint64_t)a5 colorSize:(id *)a6;
- (PTRenderEffectInput)renderEffectInput;
- (PTRenderEffectOutput)renderEffectOutput;
- (void)setRenderEffect:(id)a3;
- (void)setRenderEffectInput:(id)a3;
- (void)setRenderEffectOutput:(id)a3;
@end

@implementation PTRenderEffectContainer

- (PTRenderEffectContainer)initWithMetalContext:(id)a3 renderEffect:(id)a4 colorSize:(id *)a5
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v9 rgbaOutputPixelFormat];
  uint64_t v12 = [v9 depthOutputPixelFormat];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = *a5;
  v13 = [(PTRenderEffectContainer *)self initWithMetalContext:v10 rgbaOutputPixelFormat:v11 depthOutputPixelFormat:v12 colorSize:&v16];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_renderEffect, a4);
    v14 = v13;
  }

  return v13;
}

- (PTRenderEffectContainer)initWithMetalContext:(id)a3 rgbaOutputPixelFormat:(unint64_t)a4 depthOutputPixelFormat:(unint64_t)a5 colorSize:(id *)a6
{
  id v10 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PTRenderEffectContainer;
  uint64_t v11 = [(PTRenderEffectContainer *)&v23 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    renderEffectInput = v11->_renderEffectInput;
    v11->_renderEffectInput = (PTRenderEffectInput *)v12;

    if (!v11->_renderEffectInput)
    {
      a4 = _PTLogSystem();
      if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_ERROR)) {
        -[PTRenderEffectContainer initWithMetalContext:rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:]((os_log_t)a4);
      }
      goto LABEL_19;
    }
    if (a4)
    {
      a4 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a4 width:a6->var0 height:a6->var1 mipmapped:0];
      [(id)a4 setTextureType:2];
      [(id)a4 setUsage:7];
      [(id)a4 setStorageMode:0];
      v14 = [v10 device];
      unint64_t v15 = [v14 newTextureWithDescriptor:a4];

      if (!v15)
      {
        a5 = _PTLogSystem();
        if (os_log_type_enabled((os_log_t)a5, OS_LOG_TYPE_ERROR)) {
          -[PTRenderEffectContainer initWithMetalContext:rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:]((os_log_t)a5);
        }
LABEL_18:

LABEL_19:
        v20 = 0;
        goto LABEL_20;
      }

      a4 = v15;
    }
    if (a5)
    {
      $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a5 width:a6->var0 height:a6->var1 mipmapped:0];
      [v16 setTextureType:2];
      [v16 setUsage:7];
      [v16 setStorageMode:0];
      v17 = [v10 device];
      a5 = [v17 newTextureWithDescriptor:v16];
    }
    v18 = [[PTRenderEffectOutput alloc] initWithEffectRGBA:a4 effectDepth:a5];
    renderEffectOutput = v11->_renderEffectOutput;
    v11->_renderEffectOutput = v18;

    if (v11->_renderEffectOutput)
    {
      v20 = v11;

LABEL_20:
      goto LABEL_21;
    }
    v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PTRenderEffectContainer initWithMetalContext:rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:](v21);
    }

    goto LABEL_18;
  }
  v20 = 0;
LABEL_21:

  return v20;
}

- (PTRenderEffect)renderEffect
{
  return self->_renderEffect;
}

- (void)setRenderEffect:(id)a3
{
}

- (PTRenderEffectInput)renderEffectInput
{
  return self->_renderEffectInput;
}

- (void)setRenderEffectInput:(id)a3
{
}

- (PTRenderEffectOutput)renderEffectOutput
{
  return self->_renderEffectOutput;
}

- (void)setRenderEffectOutput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderEffectOutput, 0);
  objc_storeStrong((id *)&self->_renderEffectInput, 0);

  objc_storeStrong((id *)&self->_renderEffect, 0);
}

- (void)initWithMetalContext:(os_log_t)log rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "_renderEffectInput";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)initWithMetalContext:(os_log_t)log rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "_renderEffectOutput";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)initWithMetalContext:(os_log_t)log rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:.cold.3(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Cannot create texture", v1, 2u);
}

@end