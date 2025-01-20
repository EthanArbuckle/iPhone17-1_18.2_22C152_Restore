@interface PTScreenCaptureComposite
- (PTScreenCaptureComposite)initWithMetalContext:(id)a3;
- (int)floatingAlphaCutout:(id)a3 inPersonSegmentation:(id)a4 bilbyPersonMask:(id)a5 bilbyEffectMask:(id)a6 bilbyFloatingBackgroundRGBA:(id)a7 outVideoColorBufferRGBA:(id)a8;
@end

@implementation PTScreenCaptureComposite

- (PTScreenCaptureComposite)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PTScreenCaptureComposite;
  v6 = [(PTScreenCaptureComposite *)&v13 init];
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(PTMetalContext *)v7->_metalContext computePipelineStateFor:@"floatingAlphaCutout" withConstants:0];
  floatingAlphaCutout = v7->_floatingAlphaCutout;
  v7->_floatingAlphaCutout = (MTLComputePipelineState *)v8;

  if (!v7->_floatingAlphaCutout)
  {
    v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTScreenCaptureComposite initWithMetalContext:](v11);
    }

    goto LABEL_7;
  }
  v10 = v7;
LABEL_8:

  return v10;
}

- (int)floatingAlphaCutout:(id)a3 inPersonSegmentation:(id)a4 bilbyPersonMask:(id)a5 bilbyEffectMask:(id)a6 bilbyFloatingBackgroundRGBA:(id)a7 outVideoColorBufferRGBA:(id)a8
{
  metalContext = self->_metalContext;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [(PTMetalContext *)metalContext commandBuffer];
  v22 = [v21 computeCommandEncoder];

  [v22 setComputePipelineState:self->_floatingAlphaCutout];
  [v22 setTexture:v20 atIndex:0];

  [v22 setTexture:v19 atIndex:1];
  [v22 setTexture:v18 atIndex:2];

  [v22 setTexture:v17 atIndex:3];
  [v22 setTexture:v16 atIndex:4];

  [v22 setTexture:v15 atIndex:5];
  uint64_t v23 = [v15 width];
  uint64_t v24 = [v15 height];

  v28[0] = v23;
  v28[1] = v24;
  v28[2] = 1;
  long long v26 = xmmword_1D081F8F0;
  uint64_t v27 = 1;
  [v22 dispatchThreads:v28 threadsPerThreadgroup:&v26];
  [v22 endEncoding];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingAlphaCutout, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "_floatingAlphaCutout";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

@end