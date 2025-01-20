@interface RawDFColorMatchShaders
- (RawDFColorMatchShaders)initWithMetal:(id)a3;
@end

@implementation RawDFColorMatchShaders

- (RawDFColorMatchShaders)initWithMetal:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RawDFColorMatchShaders;
  v5 = [(RawDFColorMatchShaders *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"kernelRawDFPickRandomSamples" constants:0];
  kernelRawDFPickRandomSamples = v5->_kernelRawDFPickRandomSamples;
  v5->_kernelRawDFPickRandomSamples = (MTLComputePipelineState *)v6;

  if (!v5->_kernelRawDFPickRandomSamples) {
    goto LABEL_6;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"kernelRawDFColorAdjustmentInplace" constants:0];
  kernelRawDFColorAdjustmentInplace = v5->_kernelRawDFColorAdjustmentInplace;
  v5->_kernelRawDFColorAdjustmentInplace = (MTLComputePipelineState *)v8;

  if (v5->_kernelRawDFColorAdjustmentInplace)
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
  objc_storeStrong((id *)&self->_kernelRawDFColorAdjustmentInplace, 0);

  objc_storeStrong((id *)&self->_kernelRawDFPickRandomSamples, 0);
}

@end