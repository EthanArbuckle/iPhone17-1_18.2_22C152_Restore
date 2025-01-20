@interface RawDFNetworkPreprocessShaders
- (RawDFNetworkPreprocessShaders)initWithMetal:(id)a3 isV2:(BOOL)a4;
@end

@implementation RawDFNetworkPreprocessShaders

- (RawDFNetworkPreprocessShaders)initWithMetal:(id)a3 isV2:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = &stru_270E53418;
  if (v4) {
    v7 = @"V2";
  }
  v8 = v7;
  v20.receiver = self;
  v20.super_class = (Class)RawDFNetworkPreprocessShaders;
  v9 = [(RawDFNetworkPreprocessShaders *)&v20 init];
  if (!v9) {
    goto LABEL_7;
  }
  v10 = [NSString stringWithFormat:@"estimateNoiseAndTileSyntheticLong%@", v8];
  uint64_t v11 = [v6 computePipelineStateFor:v10 constants:0];
  estimateNoiseAndTileSL = v9->_estimateNoiseAndTileSL;
  v9->_estimateNoiseAndTileSL = (MTLComputePipelineState *)v11;

  if (!v9->_estimateNoiseAndTileSL) {
    goto LABEL_7;
  }
  v13 = [NSString stringWithFormat:@"estimateNoiseAndTileSyntheticReference%@", v8];
  uint64_t v14 = [v6 computePipelineStateFor:v13 constants:0];
  estimateNoiseAndTileSR = v9->_estimateNoiseAndTileSR;
  v9->_estimateNoiseAndTileSR = (MTLComputePipelineState *)v14;

  v16 = v9;
  if (!v9->_estimateNoiseAndTileSR)
  {
LABEL_7:
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
  objc_storeStrong((id *)&self->_estimateNoiseAndTileSR, 0);

  objc_storeStrong((id *)&self->_estimateNoiseAndTileSL, 0);
}

@end