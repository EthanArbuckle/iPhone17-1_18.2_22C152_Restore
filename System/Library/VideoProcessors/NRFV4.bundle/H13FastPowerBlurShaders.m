@interface H13FastPowerBlurShaders
- (H13FastPowerBlurShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)applyPowerBlur;
- (MTLComputePipelineState)remosaicRGB;
- (MTLComputePipelineState)remosaicYUV;
- (MTLComputePipelineState)resampleHalfSizeToFullSizeRGB;
- (MTLComputePipelineState)resampleHalfSizeToFullSizeYUV;
- (MTLComputePipelineState)resampleRawAndCreateHighFrequencyMap;
@end

@implementation H13FastPowerBlurShaders

- (H13FastPowerBlurShaders)initWithMetalContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)H13FastPowerBlurShaders;
    v5 = [(H13FastPowerBlurShaders *)&v10 init];
    if (v5)
    {
      v6 = v5;
      loadKernel(v4, (uint64_t)"remosaicRGB", (void **)&v5->_remosaicRGB);
      loadKernel(v4, (uint64_t)"remosaicYUV", (void **)&v6->_remosaicYUV);
      loadKernel(v4, (uint64_t)"resampleRawAndCreateHighFrequencyMap", (void **)&v6->_resampleRawAndCreateHighFrequencyMap);
      loadKernel(v4, (uint64_t)"applyPowerBlur", (void **)&v6->_applyPowerBlur);
      loadKernel(v4, (uint64_t)"resampleHalfSizeToFullSizeRGB", (void **)&v6->_resampleHalfSizeToFullSizeRGB);
      loadKernel(v4, (uint64_t)"resampleHalfSizeToFullSizeYUV", (void **)&v6->_resampleHalfSizeToFullSizeYUV);
      self = v6;
    }
    else
    {
      FigDebugAssert3();
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
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
  v7 = v6;

  return v7;
}

- (MTLComputePipelineState)remosaicYUV
{
  return self->_remosaicYUV;
}

- (MTLComputePipelineState)remosaicRGB
{
  return self->_remosaicRGB;
}

- (MTLComputePipelineState)resampleRawAndCreateHighFrequencyMap
{
  return self->_resampleRawAndCreateHighFrequencyMap;
}

- (MTLComputePipelineState)applyPowerBlur
{
  return self->_applyPowerBlur;
}

- (MTLComputePipelineState)resampleHalfSizeToFullSizeRGB
{
  return self->_resampleHalfSizeToFullSizeRGB;
}

- (MTLComputePipelineState)resampleHalfSizeToFullSizeYUV
{
  return self->_resampleHalfSizeToFullSizeYUV;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resampleHalfSizeToFullSizeYUV, 0);
  objc_storeStrong((id *)&self->_resampleHalfSizeToFullSizeRGB, 0);
  objc_storeStrong((id *)&self->_applyPowerBlur, 0);
  objc_storeStrong((id *)&self->_resampleRawAndCreateHighFrequencyMap, 0);
  objc_storeStrong((id *)&self->_remosaicRGB, 0);

  objc_storeStrong((id *)&self->_remosaicYUV, 0);
}

@end