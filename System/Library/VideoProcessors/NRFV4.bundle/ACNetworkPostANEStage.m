@interface ACNetworkPostANEStage
- (ACNetworkPostANEStage)initWithMetal:(id)a3;
- (RawDFNetworkStageShared)shared;
- (int)processTilePipelineStage:(id)a3;
- (void)setShared:(id)a3;
@end

@implementation ACNetworkPostANEStage

- (ACNetworkPostANEStage)initWithMetal:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACNetworkPostANEStage;
  v5 = [(ACNetworkPostANEStage *)&v12 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"artifactNetworkPostprocess" constants:0];
  artifactNetworkPostprocess = v5->_artifactNetworkPostprocess;
  v5->_artifactNetworkPostprocess = (MTLComputePipelineState *)v6;

  v8 = v5;
  if (!v5->_artifactNetworkPostprocess)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_4:
    v8 = 0;
  }
  v10 = v8;

  return v10;
}

- (int)processTilePipelineStage:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 commandBuffer];
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [(ACNetworkPostANEStage *)self shared];
  [v4 tileIndex];
  if (v6)
  {
    objc_msgSend(v6, "getTileForIndex:");
  }
  else
  {
    uint64_t v31 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
  }

  v7 = [v4 userContext];
  if (v7 && ([v5 computeCommandEncoder], (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
    [v8 setLabel:@"artifactNetworkPostprocess"];
    [v9 setComputePipelineState:self->_artifactNetworkPostprocess];
    [v9 setImageblockWidth:32 height:32];
    v10 = [(ACNetworkPostANEStage *)self shared];
    objc_msgSend(v9, "setBytes:length:atIndex:", objc_msgSend(v10, "shaderUniforms") + 16, 224, 2);

    [v9 setBytes:&v29 length:40 atIndex:0];
    v11 = [v4 previousNetwork];
    objc_super v12 = [v11 inputs];
    uint64_t v13 = [v12 objectAtIndexedSubscript:1];
    [v9 setTexture:v13 atIndex:0];

    v14 = [v4 previousNetwork];
    v15 = [v14 outputs];
    v16 = [v15 objectAtIndexedSubscript:0];
    [v9 setTexture:v16 atIndex:1];

    v17 = [(ACNetworkPostANEStage *)self shared];
    v18 = [v17 outputLumaTexture];
    [v9 setTexture:v18 atIndex:2];

    v19 = [(ACNetworkPostANEStage *)self shared];
    v20 = [v19 outputChromaTexture];
    [v9 setTexture:v20 atIndex:3];

    v26[0] = (uint64_t)(HIDWORD(v30) + (v30 < 0)) >> 1;
    v26[1] = (uint64_t)(int)(v31 + ((int)v31 < 0)) >> 1;
    v26[2] = 1;
    int64x2_t v24 = vdupq_n_s64(0x10uLL);
    uint64_t v25 = 1;
    [v9 dispatchThreads:v26 threadsPerThreadgroup:&v24];
    [v9 endEncoding];
    [v4 setLastCommandBuffer:v5];

    int v21 = 0;
  }
  else
  {
    int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    int v21 = -73438;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v21;
}

- (RawDFNetworkStageShared)shared
{
  return self->_shared;
}

- (void)setShared:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shared, 0);

  objc_storeStrong((id *)&self->_artifactNetworkPostprocess, 0);
}

@end