@interface RawDFSyntheticReferenceUnpackShaders
- (RawDFSyntheticReferenceUnpackShaders)initWithMetal:(id)a3;
@end

@implementation RawDFSyntheticReferenceUnpackShaders

- (RawDFSyntheticReferenceUnpackShaders)initWithMetal:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RawDFSyntheticReferenceUnpackShaders;
  v5 = [(RawDFSyntheticReferenceUnpackShaders *)&v12 init];
  if (v5)
  {
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"RawDFSyntheticReference::%s", "kernelRawDFSyntheticReferenceUnpack");
    uint64_t v7 = [v4 computePipelineStateFor:v6 constants:0];
    kernelRawDFSyntheticReferenceUnpack = v5->_kernelRawDFSyntheticReferenceUnpack;
    v5->_kernelRawDFSyntheticReferenceUnpack = (MTLComputePipelineState *)v7;

    if (!v5->_kernelRawDFSyntheticReferenceUnpack)
    {
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v9 = 0;
      goto LABEL_5;
    }
  }
  v9 = v5;
LABEL_5:

  return v9;
}

- (void).cxx_destruct
{
}

@end