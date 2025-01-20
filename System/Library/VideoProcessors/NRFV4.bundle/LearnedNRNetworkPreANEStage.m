@interface LearnedNRNetworkPreANEStage
- (LearnedNRNetworkPreANEStage)initWithMetal:(id)a3;
- (int)processTilePipelineStage:(id)a3;
@end

@implementation LearnedNRNetworkPreANEStage

- (LearnedNRNetworkPreANEStage)initWithMetal:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LearnedNRNetworkPreANEStage;
  v5 = [(LearnedNRNetworkPreANEStage *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"LearnedNR::createTileForQuadra" constants:0];
  createTileForQuadraInput = v5->_createTileForQuadraInput;
  v5->_createTileForQuadraInput = (MTLComputePipelineState *)v6;

  if (!v5->_createTileForQuadraInput) {
    goto LABEL_6;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"LearnedNR::createTileForRawInput" constants:0];
  createTileForRawInput = v5->_createTileForRawInput;
  v5->_createTileForRawInput = (MTLComputePipelineState *)v8;

  if (v5->_createTileForRawInput)
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

- (int)processTilePipelineStage:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 commandBuffer];
  v7 = v6;
  if (!v6 || ([v6 computeCommandEncoder], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    int v28 = -73358;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_11:

    goto LABEL_7;
  }
  v9 = v8;
  v10 = [(LearnedNRNetworkStageBase *)self shared];
  uint64_t v11 = [v10 framePropertiesAddress];

  if (!v11)
  {
    int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    int v28 = -73358;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_11;
  }
  [(LearnedNRNetworkStageBase *)self shared];
  v12 = v31 = v7;
  int v13 = [v12 isQuadra];
  uint64_t v14 = &OBJC_IVAR___LearnedNRNetworkPreANEStage__createTileForRawInput;
  if (v13) {
    uint64_t v14 = &OBJC_IVAR___LearnedNRNetworkPreANEStage__createTileForQuadraInput;
  }
  id v15 = *(id *)((char *)&self->super.super.isa + *v14);

  v16 = [(LearnedNRNetworkStageBase *)self shared];
  [v5 tileIndex];
  unint64_t v17 = objc_msgSend(v16, "getTileForIndex:");
  v3.i32[0] = v17;

  *(uint32x2_t *)v18.i8 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)*(_OWORD *)&vmovl_u16(v3), (int8x8_t)0xFFFF0000FFFFLL), 0xFuLL);
  *(uint32x2_t *)v18.i8 = vshr_n_u32((uint32x2_t)vshr_n_s32(vshl_n_s32((int32x2_t)*(_OWORD *)&vaddw_u16(v18, v3), 0x10uLL), 0x10uLL), 1uLL);
  v35[1] = v18.i16[2];
  v35[0] = v18.i16[0];
  [v9 setComputePipelineState:v15];
  v19 = [(LearnedNRNetworkStageBase *)self shared];
  v20 = [v19 inputRawTexture];
  [v9 setTexture:v20 atIndex:0];

  v21 = [v5 nextNetwork];
  v22 = [v21 inputs];
  v23 = [v22 objectAtIndexedSubscript:0];
  [v9 setTexture:v23 atIndex:1];

  v24 = [(LearnedNRNetworkStageBase *)self shared];
  v25 = [v24 inputLSCGainsTexture];
  [v9 setTexture:v25 atIndex:2];

  [v9 setBytes:v35 length:4 atIndex:0];
  [v9 setBytes:v11 length:304 atIndex:1];
  uint64_t v26 = (v17 >> 33) & 0x7FFF;
  unint64_t v27 = v17 >> 49;
  v7 = v31;
  v34[0] = v26;
  v34[1] = v27;
  v34[2] = 1;
  int64x2_t v32 = vdupq_n_s64(0x10uLL);
  uint64_t v33 = 1;
  [v9 dispatchThreads:v34 threadsPerThreadgroup:&v32];
  [v9 endEncoding];
  [v5 setLastCommandBuffer:v31];

  int v28 = 0;
LABEL_7:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createTileForQuadraInput, 0);

  objc_storeStrong((id *)&self->_createTileForRawInput, 0);
}

@end