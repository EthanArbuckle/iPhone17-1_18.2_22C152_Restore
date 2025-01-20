@interface RegWarpHelperShaders
- (RegWarpHelperShaders)initWithMetalContext:(id)a3;
@end

@implementation RegWarpHelperShaders

- (RegWarpHelperShaders)initWithMetalContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  v13.receiver = self;
  v13.super_class = (Class)RegWarpHelperShaders;
  self = [(RegWarpHelperShaders *)&v13 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_5;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"rwppDownsampleAndConvert10To8", 0);
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  downsampleAndConvert10To8 = self->_downsampleAndConvert10To8;
  self->_downsampleAndConvert10To8 = v6;

  if (!self->_downsampleAndConvert10To8)
  {
LABEL_8:
    FigDebugAssert3();
LABEL_10:

    self = 0;
    goto LABEL_5;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v8, @"downsampleRGBToLuma", 0);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  downsampleRGBToLuma = self->_downsampleRGBToLuma;
  self->_downsampleRGBToLuma = v9;

  if (!self->_downsampleRGBToLuma)
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_10;
  }
LABEL_5:

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsampleRGBToLuma, 0);

  objc_storeStrong((id *)&self->_downsampleAndConvert10To8, 0);
}

@end