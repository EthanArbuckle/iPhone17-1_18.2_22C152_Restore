@interface RawDFZoomShaders
- (RawDFZoomShaders)initWithMetal:(id)a3;
@end

@implementation RawDFZoomShaders

- (RawDFZoomShaders)initWithMetal:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)RawDFZoomShaders;
    v5 = [(RawDFZoomShaders *)&v15 init];
    if (v5)
    {
      self = v5;
      v6 = [v4 computePipelineStateFor:@"kernelRawDFZoomApplyMirror" constants:0];
      applyMirrorKernel = self->_applyMirrorKernel;
      self->_applyMirrorKernel = v6;

      if (self->_applyMirrorKernel
        && ([v4 computePipelineStateFor:@"kernelRawDFZoomApplyZoom" constants:0],
            v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
            applyZoomKernel = self->_applyZoomKernel,
            self->_applyZoomKernel = v8,
            applyZoomKernel,
            self->_applyZoomKernel))
      {
        v10 = self;
      }
      else
      {
        v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v10 = 0;
      }
    }
    else
    {
      FigDebugAssert3();
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v10 = 0;
      self = 0;
    }
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
  v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyZoomKernel, 0);

  objc_storeStrong((id *)&self->_applyMirrorKernel, 0);
}

@end