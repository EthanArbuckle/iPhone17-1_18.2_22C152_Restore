@interface LearnedNRNetworkPostANEStage
- (LearnedNRNetworkPostANEStage)initWithMetal:(id)a3;
- (MTLTexture)outputChromaTexture;
- (MTLTexture)outputLumaTexture;
- (int)processTilePipelineStage:(id)a3;
- (void)setOutputChromaTexture:(id)a3;
- (void)setOutputLumaTexture:(id)a3;
@end

@implementation LearnedNRNetworkPostANEStage

- (LearnedNRNetworkPostANEStage)initWithMetal:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LearnedNRNetworkPostANEStage;
  v5 = [(LearnedNRNetworkPostANEStage *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"LearnedNR::processDenoisedRgbForRawInput" constants:0];
  processDenoisedRgbForRawInput = v5->_processDenoisedRgbForRawInput;
  v5->_processDenoisedRgbForRawInput = (MTLComputePipelineState *)v6;

  if (!v5->_processDenoisedRgbForRawInput) {
    goto LABEL_6;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"LearnedNR::lumaAddbackForRawInput" constants:0];
  lumaAddbackForRawInput = v5->_lumaAddbackForRawInput;
  v5->_lumaAddbackForRawInput = (MTLComputePipelineState *)v8;

  if (v5->_lumaAddbackForRawInput)
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
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v65 = [v4 commandBuffer];
  v5 = [v65 computeCommandEncoder];
  uint64_t v6 = [(LearnedNRNetworkStageBase *)self shared];
  v66 = v4;
  [v4 tileIndex];
  unint64_t v7 = objc_msgSend(v6, "getTileForIndex:");
  uint64_t v9 = v8;
  v10.i32[0] = v8;
  uint16x4_t v63 = v10;
  LODWORD(v4) = WORD1(v8);

  int v83 = v9;
  unsigned int v11 = v4 + (v7 >> 16);
  v82[1] = v11;
  v82[0] = v7 + v9;
  id v80 = 0;
  id v81 = 0;
  v12 = [(LearnedNRNetworkStageBase *)self shared];
  objc_super v13 = [v12 metal];
  uint64_t v14 = [v13 allocator];
  v15 = (void *)[v14 newTextureDescriptor];

  if (!v15)
  {
    int v79 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
    v58 = v65;
    v43 = v66;
LABEL_11:
    int v59 = -73359;
    goto LABEL_12;
  }
  v16 = [v15 desc];
  [v16 setCompressionMode:2];

  v17 = [v15 desc];
  [v17 setCompressionFootprint:0];

  v18 = [v15 desc];
  [v18 setUsage:7];

  v19 = [v15 desc];
  [v19 setPixelFormat:115];

  v20 = [v15 desc];
  [v20 setWidth:800];

  v21 = [v15 desc];
  [v21 setHeight:736];

  [v15 setLabel:@"tileDeltaTex"];
  v22 = [(LearnedNRNetworkStageBase *)self shared];
  v23 = [v22 metal];
  v24 = [v23 allocator];
  v25 = (void *)[v24 newTextureWithDescriptor:v15];
  id v81 = v25;

  if (!v25)
  {
    int v79 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
    v58 = v65;
    v43 = v66;
    int v59 = -73359;
LABEL_12:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_6;
  }
  v26 = v15;
  unsigned int v27 = v11;
  [v26 setLabel:@"tileLumaTex"];
  v28 = [(LearnedNRNetworkStageBase *)self shared];
  v29 = [v28 metal];
  v30 = [v29 allocator];
  v62 = v26;
  v31 = (void *)[v30 newTextureWithDescriptor:v26];
  id v80 = v31;

  if (!v31)
  {
    int v79 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
    v58 = v65;
    v43 = v66;
    v15 = v62;
    int v59 = -73359;
    goto LABEL_12;
  }
  v32 = [(LearnedNRNetworkStageBase *)self shared];
  uint64_t v33 = [v32 framePropertiesAddress];

  if (!v33)
  {
    int v79 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
    v58 = v65;
    v43 = v66;
    v15 = v62;
    goto LABEL_11;
  }
  v34.i32[0] = HIDWORD(v7);
  v35.i32[0] = HIDWORD(v9);
  int32x2_t v36 = vsub_s32((int32x2_t)*(_OWORD *)&vmovl_u16(v34), (int32x2_t)*(_OWORD *)&vaddl_u16(v35, v63));
  int32x2_t v37 = vdup_n_s32(0xFFFEu);
  int32x2_t v38 = vadd_s32((int32x2_t)*(_OWORD *)&vmovl_u16(v63), v37);
  v77[1] = v38.i16[2];
  v77[0] = v38.i16[0];
  int32x2_t v39 = vadd_s32((int32x2_t)__PAIR64__(v27, (int)v7 + (int)v9), v37);
  v76[1] = v39.i16[2];
  v76[0] = v39.i16[0];
  uint32x2_t v40 = (uint32x2_t)vand_s8((int8x8_t)v36, (int8x8_t)0xFFFF0000FFFFLL);
  int32x2_t v41 = vadd_s32(v36, (int32x2_t)0x200000002);
  int32x2_t v42 = vadd_s32(v36, (int32x2_t)0x400000004);
  v36.i32[0] = 131074;
  v36.i16[2] = v41.i16[0];
  v36.i16[3] = v41.i16[2];
  int32x2_t v75 = v36;
  [v5 setComputePipelineState:self->_processDenoisedRgbForRawInput];
  v43 = v66;
  v44 = [v66 previousNetwork];
  v45 = [v44 outputs];
  v46 = [v45 objectAtIndexedSubscript:0];
  [v5 setTexture:v46 atIndex:0];

  v47 = [(LearnedNRNetworkStageBase *)self shared];
  v48 = [v47 inputRawTexture];
  [v5 setTexture:v48 atIndex:1];

  v49 = [(LearnedNRNetworkStageBase *)self shared];
  v50 = [v49 inputLSCGainsTexture];
  [v5 setTexture:v50 atIndex:2];

  [v5 setTexture:v31 atIndex:3];
  v51 = [(LearnedNRNetworkPostANEStage *)self outputChromaTexture];
  [v5 setTexture:v51 atIndex:4];

  [v5 setTexture:v25 atIndex:5];
  [v5 setBytes:v77 length:4 atIndex:0];
  [v5 setBytes:v76 length:4 atIndex:1];
  [v5 setBytes:&v75 length:8 atIndex:2];
  [v5 setBytes:v33 length:304 atIndex:3];
  v52.i64[0] = v42.u32[0];
  v52.i64[1] = v42.u32[1];
  v53.i64[0] = 0xFFFFLL;
  v53.i64[1] = 0xFFFFLL;
  int8x16_t v73 = vandq_s8(v52, v53);
  uint64_t v74 = 1;
  int64x2_t v64 = vdupq_n_s64(0x10uLL);
  int64x2_t v71 = v64;
  uint64_t v72 = 1;
  [v5 dispatchThreads:&v73 threadsPerThreadgroup:&v71];
  uint32x2_t v54 = vshr_n_u32(v40, 1uLL);
  [v5 setComputePipelineState:self->_lumaAddbackForRawInput];
  [v5 setTexture:v31 atIndex:0];
  [v5 setTexture:v25 atIndex:1];
  v55 = [(LearnedNRNetworkPostANEStage *)self outputLumaTexture];
  [v5 setTexture:v55 atIndex:2];

  v56 = [(LearnedNRNetworkStageBase *)self shared];
  v57 = [v56 inputLSCGainsTexture];
  [v5 setTexture:v57 atIndex:3];

  [v5 setBytes:&v83 length:4 atIndex:0];
  [v5 setBytes:v82 length:4 atIndex:1];
  [v5 setBytes:v33 length:304 atIndex:2];
  v52.i64[0] = v54.u32[0];
  v52.i64[1] = v54.u32[1];
  int8x16_t v69 = v52;
  uint64_t v70 = 1;
  int64x2_t v67 = v64;
  uint64_t v68 = 1;
  [v5 dispatchThreads:&v69 threadsPerThreadgroup:&v67];
  [v5 endEncoding];
  FigMetalDecRef();
  FigMetalDecRef();
  v58 = v65;
  [v66 setLastCommandBuffer:v65];
  int v59 = 0;
  v15 = v62;
LABEL_6:

  return v59;
}

- (MTLTexture)outputLumaTexture
{
  return self->_outputLumaTexture;
}

- (void)setOutputLumaTexture:(id)a3
{
}

- (MTLTexture)outputChromaTexture
{
  return self->_outputChromaTexture;
}

- (void)setOutputChromaTexture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputChromaTexture, 0);
  objc_storeStrong((id *)&self->_outputLumaTexture, 0);
  objc_storeStrong((id *)&self->_lumaAddbackForRawInput, 0);

  objc_storeStrong((id *)&self->_processDenoisedRgbForRawInput, 0);
}

@end