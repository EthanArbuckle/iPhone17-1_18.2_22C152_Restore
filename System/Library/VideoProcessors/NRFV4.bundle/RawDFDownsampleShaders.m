@interface RawDFDownsampleShaders
- (RawDFDownsampleShaders)initWithMetal:(id)a3;
@end

@implementation RawDFDownsampleShaders

- (RawDFDownsampleShaders)initWithMetal:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RawDFDownsampleShaders;
  v5 = [(RawDFDownsampleShaders *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"kernelRawDFDownsample" constants:0];
  kernelRawDFDownsample = v5->_kernelRawDFDownsample;
  v5->_kernelRawDFDownsample = (MTLComputePipelineState *)v6;

  if (!v5->_kernelRawDFDownsample) {
    goto LABEL_6;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"kernelRawDFResample" constants:0];
  kernelRawDFResample = v5->_kernelRawDFResample;
  v5->_kernelRawDFResample = (MTLComputePipelineState *)v8;

  if (v5->_kernelRawDFResample)
  {
LABEL_4:
    v10 = v5;
  }
  else
  {
LABEL_6:
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernelRawDFResample, 0);

  objc_storeStrong((id *)&self->_kernelRawDFDownsample, 0);
}

@end