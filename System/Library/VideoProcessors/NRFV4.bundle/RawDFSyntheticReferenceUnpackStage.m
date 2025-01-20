@interface RawDFSyntheticReferenceUnpackStage
+ (int)prewarmShaders:(id)a3;
- (RawDFSyntheticReferenceUnpackStage)initWithMetalContext:(id)a3;
- (int)unpackSyntheticReference:(id)a3 toOutputTex:(id)a4;
@end

@implementation RawDFSyntheticReferenceUnpackStage

- (RawDFSyntheticReferenceUnpackStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFSyntheticReferenceUnpackStage;
  v6 = [(RawDFSyntheticReferenceUnpackStage *)&v14 init];
  v7 = v6;
  if (!v6
    || !v5
    || (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[RawDFSyntheticReferenceUnpackShaders alloc] initWithMetal:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v10 = v7, !v7->_shaders))
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }
  v11 = v10;

  return v11;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RawDFSyntheticReferenceUnpackShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)unpackSyntheticReference:(id)a3 toOutputTex:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    int v15 = -73279;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_17:

    goto LABEL_8;
  }
  v9 = [(FigMetalContext *)self->_metal commandQueue];
  v10 = [v9 commandBuffer];

  if (!v10)
  {
    FigDebugAssert3();
    int v15 = FigSignalErrorAt();
    goto LABEL_8;
  }
  v11 = [v10 computeCommandEncoder];
  if (!v11)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    int v15 = -73279;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_16:

    goto LABEL_17;
  }
  v12 = v11;
  [v11 setTexture:v6 atIndex:0];
  [v12 setTexture:v8 atIndex:1];
  v13 = self->_shaders->_kernelRawDFSyntheticReferenceUnpack;
  if (!v13)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    objc_super v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    int v15 = -73279;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_15:

    goto LABEL_16;
  }
  objc_super v14 = v13;
  [v12 setComputePipelineState:v13];
  if ((unint64_t)[v14 maxTotalThreadsPerThreadgroup] <= 0x3FF)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    int v15 = -73279;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_15;
  }
  [v12 setImageblockWidth:32 height:32];
  v18[0] = [v8 width];
  v18[1] = [v8 height];
  v18[2] = 1;
  int64x2_t v21 = vdupq_n_s64(0x20uLL);
  uint64_t v22 = 1;
  [v12 dispatchThreads:v18 threadsPerThreadgroup:&v21];
  [v12 endEncoding];
  [v10 commit];

  int v15 = 0;
LABEL_8:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end