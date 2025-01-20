@interface RawDFLanczos
- (RawDFLanczos)initWithMetalContext:(id)a3;
- (int)encodeToCommandBuffer:(id)a3 input:(id)a4 output:(id)a5;
@end

@implementation RawDFLanczos

- (RawDFLanczos)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RawDFLanczos;
  v6 = [(RawDFLanczos *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    uint64_t v8 = [(FigMetalContext *)v7->_metal computePipelineStateFor:@"lanczos3_half4_sqr2" constants:0];
    lanczos3_half4_sqr2 = v7->_lanczos3_half4_sqr2;
    v7->_lanczos3_half4_sqr2 = (MTLComputePipelineState *)v8;

    if (!v7->_lanczos3_half4_sqr2)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      v7 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v7;
}

- (int)encodeToCommandBuffer:(id)a3 input:(id)a4 output:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  float v11 = (float)(unint64_t)[v9 width];
  double v12 = (float)(v11 / (float)(unint64_t)[v10 width]);
  if (v12 > 1.3411765
    && v12 < 1.48235298
    && (uint64_t v13 = [v9 pixelFormat], v13 == objc_msgSend(v10, "pixelFormat"))
    && ([v9 pixelFormat] == 25
     || [v9 pixelFormat] == 65
     || [v9 pixelFormat] == 115))
  {
    v14 = [v8 computeCommandEncoder];
    [v14 setComputePipelineState:self->_lanczos3_half4_sqr2];
    [v14 setImageblockWidth:16 height:16];
    [v14 setTexture:v9 atIndex:0];
    [v14 setTexture:v10 atIndex:1];
    v18[0] = [v10 width];
    v18[1] = [v10 height];
    v18[2] = 1;
    int64x2_t v21 = vdupq_n_s64(0x10uLL);
    uint64_t v22 = 1;
    [v14 dispatchThreads:v18 threadsPerThreadgroup:&v21];
    [v14 endEncoding];

    int v15 = 0;
  }
  else
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    int v15 = -73322;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lanczos3_half4_sqr2, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end