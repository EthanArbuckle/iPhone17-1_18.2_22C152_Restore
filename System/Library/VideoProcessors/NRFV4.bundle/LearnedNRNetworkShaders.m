@interface LearnedNRNetworkShaders
- (LearnedNRNetworkShaders)initWithMetal:(id)a3;
@end

@implementation LearnedNRNetworkShaders

- (LearnedNRNetworkShaders)initWithMetal:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LearnedNRNetworkShaders;
  v5 = [(LearnedNRNetworkShaders *)&v12 init];
  if (!v5
    || ([v4 computePipelineStateFor:@"LearnedNR::convertYUV420toRGB" constants:0],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        convertYUV420toRGB = v5->_convertYUV420toRGB,
        v5->_convertYUV420toRGB = (MTLComputePipelineState *)v6,
        convertYUV420toRGB,
        v8 = v5,
        !v5->_convertYUV420toRGB))
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
}

@end