@interface LocalToneMappingShaders
- (LocalToneMappingShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)ltm;
@end

@implementation LocalToneMappingShaders

- (LocalToneMappingShaders)initWithMetalContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)LocalToneMappingShaders;
    v5 = [(LocalToneMappingShaders *)&v12 init];
    if (v5)
    {
      v6 = v5;
      uint64_t v7 = [v4 computePipelineStateFor:@"LocalToneMapping::LTM" constants:0];
      ltm = v6->_ltm;
      v6->_ltm = (MTLComputePipelineState *)v7;

      if (!v6->_ltm)
      {
        FigDebugAssert3();
        FigSignalErrorAt();
      }
      self = v6;
    }
    else
    {
      FigDebugAssert3();
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v6 = 0;
      self = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    if (FigSignalErrorAt()) {
      v6 = 0;
    }
    else {
      v6 = self;
    }
  }
  v9 = v6;

  return v9;
}

- (MTLComputePipelineState)ltm
{
  return self->_ltm;
}

- (void).cxx_destruct
{
}

@end