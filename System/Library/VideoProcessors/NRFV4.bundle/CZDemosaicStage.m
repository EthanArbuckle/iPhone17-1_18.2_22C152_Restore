@interface CZDemosaicStage
- (CZDemosaicStage)initWithMetalContext:(id)a3;
- (FigMetalContext)metal;
- (int)getDemosaicConfigForInputFrameMetadata:(id)a3 demosaicConfig:(id *)a4;
- (int)runWithInputTex:(id)a3 inputMetadata:(id)a4 firstPix:(int)a5 outputRGBATex:(id)a6;
@end

@implementation CZDemosaicStage

- (CZDemosaicStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CZDemosaicStage;
  v6 = [(CZDemosaicStage *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[CZDemosaicShader alloc] initWithMetalContext:v5], shader = v7->_shader, v7->_shader = v8, shader, v7->_shader))
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

- (int)getDemosaicConfigForInputFrameMetadata:(id)a3 demosaicConfig:(id *)a4
{
  if (a3)
  {
    id v5 = [a3 objectForKeyedSubscript:*MEMORY[0x263F2F388]];
    unsigned int v6 = (unsigned __int16)[v5 intValue];

    int result = 0;
    a4->var0 = ceilf((float)((float)v6 + (float)v6) / (float)(65535.0 - (float)v6));
  }
  else
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -73428;
  }
  return result;
}

- (int)runWithInputTex:(id)a3 inputMetadata:(id)a4 firstPix:(int)a5 outputRGBATex:(id)a6
{
  v31[19] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(CZDemosaicStage *)self metal];
  v31[0] = 0;
  if (!v10 || !v11 || !v12)
  {
    int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
LABEL_12:
    int v24 = -73428;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_13:

    goto LABEL_8;
  }
  int v14 = [(CZDemosaicStage *)self getDemosaicConfigForInputFrameMetadata:v11 demosaicConfig:v31];
  if (v14)
  {
    int v24 = v14;
    FigDebugAssert3();
    goto LABEL_8;
  }
  BYTE4(v31[0]) = a5 == 2;
  v15 = [v13 commandBuffer];
  if (!v15)
  {
    int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    goto LABEL_12;
  }
  v16 = v15;
  uint64_t v17 = [v15 computeCommandEncoder];
  if (!v17)
  {
    int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    int v24 = -73428;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_13;
  }
  v18 = (void *)v17;
  v19 = [(CZDemosaicShader *)self->_shader czDemosaicStage];
  [v18 setComputePipelineState:v19];

  [v18 setTexture:v10 atIndex:0];
  [v18 setTexture:v12 atIndex:1];
  [v18 setBytes:v31 length:8 atIndex:0];
  v20 = [(CZDemosaicShader *)self->_shader czDemosaicStage];
  unint64_t v21 = [v20 threadExecutionWidth];

  v22 = [(CZDemosaicShader *)self->_shader czDemosaicStage];
  unint64_t v23 = [v22 maxTotalThreadsPerThreadgroup] / v21;

  v28[0] = (unint64_t)[v12 width] >> 1;
  v28[1] = (unint64_t)[v12 height] >> 1;
  v28[2] = 1;
  v27[0] = v21;
  v27[1] = v23;
  v27[2] = 1;
  [v18 dispatchThreads:v28 threadsPerThreadgroup:v27];
  [v18 endEncoding];
  [v13 commit];

  int v24 = 0;
LABEL_8:

  return v24;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_shader, 0);
}

@end