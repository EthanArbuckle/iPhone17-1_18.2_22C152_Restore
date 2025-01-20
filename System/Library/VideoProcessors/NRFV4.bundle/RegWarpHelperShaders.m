@interface RegWarpHelperShaders
- (RegWarpHelperShaders)initWithMetalContext:(id)a3;
@end

@implementation RegWarpHelperShaders

- (RegWarpHelperShaders)initWithMetalContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  v11.receiver = self;
  v11.super_class = (Class)RegWarpHelperShaders;
  self = [(RegWarpHelperShaders *)&v11 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_5;
  }
  v5 = [v4 computePipelineStateFor:@"rwppDownsampleAndConvert10To8" constants:0];
  downsampleAndConvert10To8 = self->_downsampleAndConvert10To8;
  self->_downsampleAndConvert10To8 = v5;

  if (!self->_downsampleAndConvert10To8)
  {
LABEL_8:
    FigDebugAssert3();
LABEL_10:

    self = 0;
    goto LABEL_5;
  }
  v7 = [v4 computePipelineStateFor:@"downsampleRGBToLuma" constants:0];
  downsampleRGBToLuma = self->_downsampleRGBToLuma;
  self->_downsampleRGBToLuma = v7;

  if (!self->_downsampleRGBToLuma)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
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