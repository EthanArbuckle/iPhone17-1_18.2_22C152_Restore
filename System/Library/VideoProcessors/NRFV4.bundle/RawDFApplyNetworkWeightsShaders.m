@interface RawDFApplyNetworkWeightsShaders
- (RawDFApplyNetworkWeightsShaders)initWithMetal:(id)a3;
@end

@implementation RawDFApplyNetworkWeightsShaders

- (RawDFApplyNetworkWeightsShaders)initWithMetal:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RawDFApplyNetworkWeightsShaders;
  v5 = [(RawDFApplyNetworkWeightsShaders *)&v20 init];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"filterDenoise" constants:0];
  filterDenoise = v5->_filterDenoise;
  v5->_filterDenoise = (MTLComputePipelineState *)v6;

  if (!v5->_filterDenoise) {
    goto LABEL_8;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"filterDenoiseLumaOnly" constants:0];
  filterDenoiseLumaOnly = v5->_filterDenoiseLumaOnly;
  v5->_filterDenoiseLumaOnly = (MTLComputePipelineState *)v8;

  if (!v5->_filterDenoiseLumaOnly) {
    goto LABEL_8;
  }
  uint64_t v10 = [v4 computePipelineStateFor:@"applyNetworkDeghosting" constants:0];
  applyNetworkDeghosting = v5->_applyNetworkDeghosting;
  v5->_applyNetworkDeghosting = (MTLComputePipelineState *)v10;

  if (!v5->_applyNetworkDeghosting) {
    goto LABEL_8;
  }
  uint64_t v12 = [v4 computePipelineStateFor:@"addPreviousPyramidLevel" constants:0];
  addPreviousPyramidLevel = v5->_addPreviousPyramidLevel;
  v5->_addPreviousPyramidLevel = (MTLComputePipelineState *)v12;

  if (!v5->_addPreviousPyramidLevel
    || ([v4 computePipelineStateFor:@"untileAndConvert444To420" constants:0],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        untileAndConvert444To420 = v5->_untileAndConvert444To420,
        v5->_untileAndConvert444To420 = (MTLComputePipelineState *)v14,
        untileAndConvert444To420,
        v16 = v5,
        !v5->_untileAndConvert444To420))
  {
LABEL_8:
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v16 = 0;
  }
  v17 = v16;

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_untileAndConvert444To420, 0);
  objc_storeStrong((id *)&self->_addPreviousPyramidLevel, 0);
  objc_storeStrong((id *)&self->_applyNetworkDeghosting, 0);
  objc_storeStrong((id *)&self->_filterDenoiseLumaOnly, 0);

  objc_storeStrong((id *)&self->_filterDenoise, 0);
}

@end