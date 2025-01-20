@interface CMIImagePyramidShaders
- (CMIImagePyramidShaders)initWithMetal:(id)a3;
@end

@implementation CMIImagePyramidShaders

- (CMIImagePyramidShaders)initWithMetal:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMIImagePyramidShaders;
  v5 = [(CMIImagePyramidShaders *)&v11 init];
  if (v5
    && ([v4 computePipelineStateFor:@"CMIImagePyramid::downscale2x" constants:0],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        downscale2x = v5->_downscale2x,
        v5->_downscale2x = (MTLComputePipelineState *)v6,
        downscale2x,
        !v5->_downscale2x))
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end