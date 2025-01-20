@interface RawDFNetworkPreprocess
- (RawDFNetworkPreprocess)initWithContext:(id)a3 isV2:(BOOL)a4;
- (int)estimateNoiseAndTileSyntheticLong:(id)a3 syntheticEV0FusionMap:(id)a4 syntheticLongFusionMap:(id)a5 lscGains:(id)a6 tile:(TileBounds *)a7 uniforms:(RawDFNoiseUniforms *)a8 commandBuffer:(id)a9 outSyntheticLongTile:(id)a10 outSyntheticLongNoiseTile:(id)a11 outSyntheticLongPlanarTile:(id)a12 outSyntheticLongNoisePlanarTile:(id)a13;
- (int)estimateNoiseAndTileSyntheticReference:(id)a3 syntheticReferenceFusionMap:(id)a4 syntheticEV0FusionMap:(id)a5 syntheticLongFusionMap:(id)a6 lscGains:(id)a7 tile:(TileBounds *)a8 uniforms:(RawDFNoiseUniforms *)a9 commandBuffer:(id)a10 outSyntheticReferenceRGBTile:(id)a11 outSyntheticReferenceTile:(id)a12 outSyntheticReferenceNoiseTile:(id)a13 outSyntheticReferencePlanarTile:(id)a14 outSyntheticReferenceNoisePlanarTile:(id)a15;
@end

@implementation RawDFNetworkPreprocess

- (RawDFNetworkPreprocess)initWithContext:(id)a3 isV2:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RawDFNetworkPreprocess;
  v8 = [(RawDFNetworkPreprocess *)&v16 init];
  v9 = v8;
  if (!v8
    || !v7
    || (objc_storeStrong((id *)&v8->_metal, a3),
        v10 = [[RawDFNetworkPreprocessShaders alloc] initWithMetal:v7 isV2:v4], shaders = v9->_shaders, v9->_shaders = v10, shaders, v12 = v9, !v9->_shaders))
  {
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v12 = 0;
  }
  v13 = v12;

  return v13;
}

- (int)estimateNoiseAndTileSyntheticLong:(id)a3 syntheticEV0FusionMap:(id)a4 syntheticLongFusionMap:(id)a5 lscGains:(id)a6 tile:(TileBounds *)a7 uniforms:(RawDFNoiseUniforms *)a8 commandBuffer:(id)a9 outSyntheticLongTile:(id)a10 outSyntheticLongNoiseTile:(id)a11 outSyntheticLongPlanarTile:(id)a12 outSyntheticLongNoisePlanarTile:(id)a13
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v42 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  v24 = [a9 computeCommandEncoder];
  v25 = v24;
  id v41 = v23;
  v26 = v22;
  if (!v24)
  {
    v28 = v21;
    v27 = v20;
    int v48 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    id v38 = v18;
    os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
LABEL_7:
    v34 = v40;
    int v35 = -73318;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v32 = v38;
    v30 = v41;
    v29 = v42;
    goto LABEL_4;
  }
  v27 = v20;
  [v24 setLabel:@"estimate SL noise"];
  if (!self->_shaders->_estimateNoiseAndTileSL)
  {
    v28 = v21;
    int v48 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    id v38 = v18;
    os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    goto LABEL_7;
  }
  objc_msgSend(v25, "setComputePipelineState:");
  [v25 setImageblockWidth:16 height:16];
  [v25 setTexture:v40 atIndex:0];
  [v25 setTexture:v18 atIndex:11];
  v28 = v21;
  v29 = v42;
  [v25 setTexture:v42 atIndex:2];
  [v25 setTexture:v19 atIndex:3];
  [v25 setTexture:v20 atIndex:4];
  [v25 setTexture:v21 atIndex:5];
  [v25 setTexture:v26 atIndex:6];
  v30 = v41;
  [v25 setTexture:v41 atIndex:7];
  [v25 setBytes:a7 length:40 atIndex:0];
  [v25 setBytes:a8 length:224 atIndex:2];
  uint64_t v31 = *(void *)&a7->var3;
  v32 = v18;
  *(void *)&long long v33 = (int)v31;
  *((void *)&v33 + 1) = SHIDWORD(v31);
  long long v45 = v33;
  uint64_t v46 = 1;
  v34 = v40;
  int64x2_t v43 = vdupq_n_s64(0x10uLL);
  uint64_t v44 = 1;
  [v25 dispatchThreads:&v45 threadsPerThreadgroup:&v43];
  [v25 endEncoding];
  int v35 = 0;
LABEL_4:

  return v35;
}

- (int)estimateNoiseAndTileSyntheticReference:(id)a3 syntheticReferenceFusionMap:(id)a4 syntheticEV0FusionMap:(id)a5 syntheticLongFusionMap:(id)a6 lscGains:(id)a7 tile:(TileBounds *)a8 uniforms:(RawDFNoiseUniforms *)a9 commandBuffer:(id)a10 outSyntheticReferenceRGBTile:(id)a11 outSyntheticReferenceTile:(id)a12 outSyntheticReferenceNoiseTile:(id)a13 outSyntheticReferencePlanarTile:(id)a14 outSyntheticReferenceNoisePlanarTile:(id)a15
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v46 = a3;
  id v45 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v44 = a14;
  id v43 = a15;
  v25 = [a10 computeCommandEncoder];
  v26 = v25;
  v47 = v19;
  int v48 = v20;
  v27 = v23;
  v28 = v22;
  v29 = v21;
  if (!v25)
  {
    int v54 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    v30 = v46;
    int v37 = -73318;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_7:
    v32 = v24;
    uint64_t v31 = v45;
    v34 = v43;
    long long v33 = v44;
    goto LABEL_4;
  }
  [v25 setLabel:@"estimate SR noise"];
  if (!self->_shaders->_estimateNoiseAndTileSR)
  {
    int v54 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    int v37 = -73318;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v30 = v46;
    goto LABEL_7;
  }
  objc_msgSend(v26, "setComputePipelineState:");
  [v26 setImageblockWidth:16 height:16];
  v30 = v46;
  [v26 setTexture:v46 atIndex:0];
  [v26 setTexture:v20 atIndex:11];
  [v26 setTexture:v19 atIndex:2];
  uint64_t v31 = v45;
  [v26 setTexture:v45 atIndex:1];
  [v26 setTexture:v21 atIndex:3];
  [v26 setTexture:v27 atIndex:4];
  v32 = v24;
  [v26 setTexture:v24 atIndex:5];
  long long v33 = v44;
  [v26 setTexture:v44 atIndex:6];
  v34 = v43;
  [v26 setTexture:v43 atIndex:7];
  [v26 setTexture:v28 atIndex:8];
  [v26 setBytes:a8 length:40 atIndex:0];
  [v26 setBytes:a9 length:224 atIndex:2];
  uint64_t v35 = *(void *)&a8->var3;
  *(void *)&long long v36 = (int)v35;
  *((void *)&v36 + 1) = SHIDWORD(v35);
  long long v51 = v36;
  uint64_t v52 = 1;
  int64x2_t v49 = vdupq_n_s64(0x10uLL);
  uint64_t v50 = 1;
  [v26 dispatchThreads:&v51 threadsPerThreadgroup:&v49];
  [v26 endEncoding];
  int v37 = 0;
LABEL_4:

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end