@interface RawDFApplyNetworkWeights
- (RawDFApplyNetworkWeights)initWithContext:(id)a3;
- (int)applyWeightsOnTile:(TileBounds *)a3 uniforms:(RawDFNetworkUniforms *)a4 commandBuffer:(id)a5 networkWeights:(id)a6 syntheticReferenceGaussianImagePyramids:(id)a7 syntheticLongGaussianImagePyramids:(id)a8 syntheticReferenceLaplacianImagePyramids:(id)a9 syntheticLongLaplacianImagePyramids:(id)a10 syntheticReferenceGaussianNoisePyramids:(id)a11 syntheticLongGaussianNoisePyramids:(id)a12 syntheticEV0FusionMap:(id)a13 syntheticLongFusionMap:(id)a14 syntheticReferenceFusionMap:(id)a15 skyMask:(id)a16 skinMask:(id)a17 fusedImage:(id)a18;
- (int)convertYUV444To420AndUntile:(TileBounds *)a3 yuvTile:(id)a4 outLuma:(id)a5 outChroma:(id)a6 uniforms:(RawDFNoiseUniforms *)a7 commandBuffer:(id)a8;
- (int)deghostLevel:(int)a3 tile:(TileBounds *)a4 uniforms:(RawDFNetworkUniforms *)a5 commandBuffer:(id)a6 fusionWeights:(id)a7 srLaplacian:(id)a8 srGaussian:(id)a9 srNoiseGaussian:(id)a10 sllLaplacian:(id)a11 sllGaussian:(id)a12 sllNoiseGaussian:(id)a13 syntheticEV0FusionMap:(id)a14 syntheticLongFusionMap:(id)a15 syntheticReferenceFusionMap:(id)a16 skyMask:(id)a17 outDeghosted:(id)a18;
- (int)denoiseLevel:(int)a3 uniforms:(RawDFDenoiseUniforms *)a4 commandBuffer:(id)a5 fusionWeights:(id)a6 deghostedTex:(id)a7 skyMask:(id)a8 skinMask:(id)a9 outTex:(id)a10;
- (int)upsampleUsingLaplacianPyramid:(id)a3 commandBuffer:(id)a4 andAddPreviousLevel:(id)a5 toCurrentLevel:(id)a6;
@end

@implementation RawDFApplyNetworkWeights

- (RawDFApplyNetworkWeights)initWithContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFApplyNetworkWeights;
  v6 = [(RawDFApplyNetworkWeights *)&v14 init];
  v7 = v6;
  if (!v6
    || !v5
    || (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[RawDFApplyNetworkWeightsShaders alloc] initWithMetal:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v10 = v7, !v7->_shaders))
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (int)applyWeightsOnTile:(TileBounds *)a3 uniforms:(RawDFNetworkUniforms *)a4 commandBuffer:(id)a5 networkWeights:(id)a6 syntheticReferenceGaussianImagePyramids:(id)a7 syntheticLongGaussianImagePyramids:(id)a8 syntheticReferenceLaplacianImagePyramids:(id)a9 syntheticLongLaplacianImagePyramids:(id)a10 syntheticReferenceGaussianNoisePyramids:(id)a11 syntheticLongGaussianNoisePyramids:(id)a12 syntheticEV0FusionMap:(id)a13 syntheticLongFusionMap:(id)a14 syntheticReferenceFusionMap:(id)a15 skyMask:(id)a16 skinMask:(id)a17 fusedImage:(id)a18
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v84 = a5;
  id v83 = a6;
  id v86 = a7;
  id v85 = a8;
  id v87 = a9;
  id v89 = a10;
  id v82 = a11;
  id v81 = a12;
  v21 = self;
  id v80 = a13;
  id v79 = a14;
  id v78 = a15;
  id v22 = a16;
  id v75 = a17;
  id v23 = a18;
  long long v98 = 0u;
  long long v99 = 0u;
  v24 = [(FigMetalContext *)self->_metal allocator];
  v25 = (void *)[v24 newTextureDescriptor];

  if (!v25)
  {
    v69 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
    v31 = v83;
    int v60 = -73337;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v72 = 0;
    v76 = v89;
    v77 = v87;
    goto LABEL_21;
  }
  v26 = [v25 desc];
  [v26 setCompressionMode:2];

  v27 = [v25 desc];
  [v27 setCompressionFootprint:0];

  v28 = [v25 desc];
  [v28 setUsage:7];

  v29 = [v25 desc];
  [v29 setPixelFormat:115];

  *(void *)&long long v98 = v23;
  uint64_t v30 = 1;
  v31 = v83;
  v32 = a3;
  do
  {
    uint64_t v33 = a3->var3 >> v30;
    v34 = [v25 desc];
    [v34 setWidth:v33];

    uint64_t v35 = a3->var4 >> v30;
    v36 = [v25 desc];
    [v36 setHeight:v35];

    [v25 setLabel:0];
    v37 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v38 = [v37 newTextureWithDescriptor:v25];
    v39 = (void *)*((void *)&v98 + v30);
    *((void *)&v98 + v30) = v38;

    if (!v38)
    {
      v64 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
      int v60 = -73337;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v72 = 0;
      v76 = v89;
      v77 = v87;
      goto LABEL_21;
    }
    ++v30;
  }
  while (v30 != 4);
  v40 = [v86 objectAtIndexedSubscript:3];
  v77 = [v87 arrayByAddingObject:v40];

  v41 = [v85 objectAtIndexedSubscript:3];
  v76 = [v89 arrayByAddingObject:v41];

  v72 = [[DeepFusionLaplacianPyramid alloc] initWithMetalContext:self->_metal];
  if (!v72)
  {
    v70 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
    int v60 = -73337;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v72 = 0;
    goto LABEL_21;
  }
  id v71 = v23;
  uint64_t v42 = 0;
  v43 = (char *)&v99 + 8;
  uint64_t v44 = 3;
  v73 = v25;
  do
  {
    v96 = v43;
    v45 = &a4[v42];
    *(_DWORD *)&v45[664].useArtifactCorrectionNetwork = v44;
    long long v46 = *(_OWORD *)&v32->var0;
    long long v47 = *(_OWORD *)&v32->var4;
    *(void *)&v45[644].useArtifactCorrectionNetwork = *(void *)&v32->var8;
    *(_OWORD *)&v45[612].useArtifactCorrectionNetwork = v46;
    *(_OWORD *)&v45[628].useArtifactCorrectionNetwork = v47;
    *(void *)&v45[656].useArtifactCorrectionNetwork = *(void *)&a4[8].useArtifactCorrectionNetwork;
    uint64_t v48 = v32->var3 >> v44;
    v49 = [v25 desc];
    [v49 setWidth:v48];

    uint64_t v50 = v32->var4 >> v44;
    v51 = [v25 desc];
    [v51 setHeight:v50];

    [v25 setLabel:0];
    v52 = [v25 desc];
    if (![v52 width])
    {

LABEL_20:
      v65 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
      id v23 = v71;
      int v60 = -73337;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_21;
    }
    v53 = [v25 desc];
    uint64_t v54 = [v53 height];

    if (!v54) {
      goto LABEL_20;
    }
    v55 = [(FigMetalContext *)v21->_metal allocator];
    v97 = (void *)[v55 newTextureWithDescriptor:v25];

    if (!v97)
    {
      v68 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
      id v23 = v71;
      int v60 = -73337;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_29:
      goto LABEL_21;
    }
    uint64_t v88 = v42;
    v94 = [v31 objectAtIndexedSubscript:v44];
    v93 = [v77 objectAtIndexedSubscript:v44];
    v92 = [v86 objectAtIndexedSubscript:v44];
    v90 = [v82 objectAtIndexedSubscript:v44];
    [v76 objectAtIndexedSubscript:v44];
    v57 = id v56 = v22;
    v58 = [v85 objectAtIndexedSubscript:v44];
    v59 = [v81 objectAtIndexedSubscript:v44];
    int v60 = [(RawDFApplyNetworkWeights *)v21 deghostLevel:v44 tile:v32 uniforms:a4 commandBuffer:v84 fusionWeights:v94 srLaplacian:v93 srGaussian:v92 srNoiseGaussian:v90 sllLaplacian:v57 sllGaussian:v58 sllNoiseGaussian:v59 syntheticEV0FusionMap:v80 syntheticLongFusionMap:v79 syntheticReferenceFusionMap:v78 skyMask:v56 outDeghosted:v97];

    if (v60)
    {
      FigDebugAssert3();
      v31 = v83;
      id v22 = v56;
LABEL_27:
      id v23 = v71;
      v25 = v73;
      goto LABEL_29;
    }
    v31 = v83;
    v61 = [v83 objectAtIndexedSubscript:v44];
    int v60 = [(RawDFApplyNetworkWeights *)v21 denoiseLevel:v44 uniforms:&a4[v42 + 592] commandBuffer:v84 fusionWeights:v61 deghostedTex:v97 skyMask:v56 skinMask:v75 outTex:*v96];

    id v22 = v56;
    if (v60)
    {
      FigDebugAssert3();
      goto LABEL_27;
    }
    FigMetalDecRef();
    v25 = v73;
    if (v42)
    {
      int v62 = [(RawDFApplyNetworkWeights *)v21 upsampleUsingLaplacianPyramid:v72 commandBuffer:v84 andAddPreviousLevel:v96[1] toCurrentLevel:*v96];
      if (v62)
      {
        int v60 = v62;
        FigDebugAssert3();
        id v23 = v71;
        goto LABEL_29;
      }
    }

    --v44;
    v42 -= 80;
    v43 = (char *)(v96 - 1);
    v32 = a3;
  }
  while (v88 != -240);

  for (uint64_t i = 8; i != 32; i += 8)
    FigMetalDecRef();
  v72 = 0;
  int v60 = 0;
  id v23 = v71;
LABEL_21:

  for (uint64_t j = 24; j != -8; j -= 8)
  return v60;
}

- (int)deghostLevel:(int)a3 tile:(TileBounds *)a4 uniforms:(RawDFNetworkUniforms *)a5 commandBuffer:(id)a6 fusionWeights:(id)a7 srLaplacian:(id)a8 srGaussian:(id)a9 srNoiseGaussian:(id)a10 sllLaplacian:(id)a11 sllGaussian:(id)a12 sllNoiseGaussian:(id)a13 syntheticEV0FusionMap:(id)a14 syntheticLongFusionMap:(id)a15 syntheticReferenceFusionMap:(id)a16 skyMask:(id)a17 outDeghosted:(id)a18
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v43 = a7;
  id v19 = a8;
  id v20 = a9;
  id v44 = a10;
  id v21 = a11;
  id v22 = a12;
  id v45 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  id v27 = a18;
  v28 = [a6 computeCommandEncoder];
  v29 = v28;
  id v38 = v20;
  v41 = v22;
  uint64_t v42 = v21;
  if (v28)
  {
    [v28 setLabel:@"apply network deghosting shader"];
    [v29 setComputePipelineState:self->_shaders->_applyNetworkDeghosting];
    [v29 setImageblockWidth:32 height:32];
    [v29 setTexture:v43 atIndex:0];
    [v29 setTexture:v19 atIndex:1];
    [v29 setTexture:v20 atIndex:2];
    [v29 setTexture:v44 atIndex:3];
    [v29 setTexture:v21 atIndex:4];
    [v29 setTexture:v22 atIndex:5];
    [v29 setTexture:v45 atIndex:6];
    [v29 setTexture:v26 atIndex:8];
    [v29 setTexture:v25 atIndex:9];
    [v29 setTexture:v23 atIndex:10];
    [v29 setTexture:v24 atIndex:11];
    [v29 setTexture:v27 atIndex:12];
    [v29 setBytes:&a5[16] length:224 atIndex:2];
    [v29 setBytes:&a5[28 * a3 + 240] length:28 atIndex:1];
    [v29 setBytes:&a5[80 * a3 + 352] length:80 atIndex:5];
    v48[0] = [v19 width];
    v48[1] = [v19 height];
    v48[2] = 1;
    int64x2_t v46 = vdupq_n_s64(0x20uLL);
    uint64_t v47 = 1;
    [v29 dispatchThreads:v48 threadsPerThreadgroup:&v46];
    [v29 endEncoding];
    int v40 = 0;
    uint64_t v30 = v43;
    v31 = v44;
    v32 = v38;
  }
  else
  {
    int v50 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    v31 = v44;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v40 = -73337;
    v32 = v20;
    uint64_t v30 = v43;
  }

  return v40;
}

- (int)denoiseLevel:(int)a3 uniforms:(RawDFDenoiseUniforms *)a4 commandBuffer:(id)a5 fusionWeights:(id)a6 deghostedTex:(id)a7 skyMask:(id)a8 skinMask:(id)a9 outTex:(id)a10
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = [a5 computeCommandEncoder];
  id v22 = v21;
  if (v21)
  {
    uint64_t v23 = 8;
    if (!a3) {
      uint64_t v23 = 16;
    }
    [v21 setComputePipelineState:*(Class *)((char *)&self->_shaders->super.isa + v23)];
    [v22 setTexture:v16 atIndex:0];
    [v22 setTexture:v17 atIndex:1];
    [v22 setTexture:v18 atIndex:2];
    [v22 setTexture:v19 atIndex:3];
    [v22 setTexture:v20 atIndex:4];
    [v22 setBytes:a4 length:80 atIndex:5];
    v29[0] = [v20 width];
    v29[1] = [v20 height];
    v29[2] = 1;
    long long v27 = xmmword_263380150;
    uint64_t v28 = 1;
    [v22 dispatchThreads:v29 threadsPerThreadgroup:&v27];
    [v22 endEncoding];
    int v24 = 0;
  }
  else
  {
    int v31 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v24 = -73337;
  }

  return v24;
}

- (int)upsampleUsingLaplacianPyramid:(id)a3 commandBuffer:(id)a4 andAddPreviousLevel:(id)a5 toCurrentLevel:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v38 = 0;
  objc_super v14 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v15 = (void *)[v14 newTextureDescriptor];

  if (!v15) {
    goto LABEL_10;
  }
  id v16 = [v15 desc];
  [v16 setCompressionMode:2];

  id v17 = [v15 desc];
  [v17 setCompressionFootprint:0];

  id v18 = [v15 desc];
  [v18 setUsage:7];

  uint64_t v19 = [v12 pixelFormat];
  id v20 = [v15 desc];
  [v20 setPixelFormat:v19];

  uint64_t v21 = 2 * [v12 width];
  id v22 = [v15 desc];
  [v22 setWidth:v21];

  uint64_t v23 = 2 * [v12 height];
  int v24 = [v15 desc];
  [v24 setHeight:v23];

  [v15 setLabel:@"tmp_gaussian_upsampled_color_tex"];
  id v25 = [(FigMetalContext *)self->_metal allocator];
  id v26 = (void *)[v25 newTextureWithDescriptor:v15];
  id v38 = v26;

  if (!v26) {
    goto LABEL_10;
  }
  int v27 = [v10 upsampleUsing:v11 inputTex:v12 outputTexUpsampled:v26 upsamplingFilter:1];
  if (v27)
  {
    int v30 = v27;
    FigDebugAssert3();
    goto LABEL_6;
  }
  uint64_t v28 = [v11 computeCommandEncoder];
  if (!v28)
  {
LABEL_10:
    int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    int v30 = -73337;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_6;
  }
  v29 = v28;
  [v28 setComputePipelineState:self->_shaders->_addPreviousPyramidLevel];
  [v29 setImageblockWidth:32 height:32];
  [v29 setTexture:v13 atIndex:0];
  [v29 setTexture:v26 atIndex:1];
  v35[0] = [v26 width];
  v35[1] = [v26 height];
  v35[2] = 1;
  int64x2_t v33 = vdupq_n_s64(0x20uLL);
  uint64_t v34 = 1;
  [v29 dispatchThreads:v35 threadsPerThreadgroup:&v33];
  [v29 endEncoding];
  FigMetalDecRef();

  int v30 = 0;
LABEL_6:

  return v30;
}

- (int)convertYUV444To420AndUntile:(TileBounds *)a3 yuvTile:(id)a4 outLuma:(id)a5 outChroma:(id)a6 uniforms:(RawDFNoiseUniforms *)a7 commandBuffer:(id)a8
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = [a8 computeCommandEncoder];
  id v18 = v17;
  if (!v17) {
    goto LABEL_7;
  }
  if (!self->_shaders->_untileAndConvert444To420) {
    goto LABEL_7;
  }
  objc_msgSend(v17, "setComputePipelineState:");
  [v18 setImageblockWidth:32 height:32];
  [v18 setBytes:a3 length:40 atIndex:0];
  [v18 setTexture:v14 atIndex:0];
  [v18 setTexture:v15 atIndex:1];
  [v18 setTexture:v16 atIndex:2];
  [v18 setBytes:a7 length:224 atIndex:2];
  int var7 = a3->var7;
  if (var7 & 1) != 0 || (int var8 = a3->var8, (var8))
  {
LABEL_7:
    int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    int v21 = -73337;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v26[0] = (uint64_t)(var7 + (var7 < 0)) >> 1;
    v26[1] = (uint64_t)(var8 + (var8 < 0)) >> 1;
    v26[2] = 1;
    int64x2_t v24 = vdupq_n_s64(0x10uLL);
    uint64_t v25 = 1;
    [v18 dispatchThreads:v26 threadsPerThreadgroup:&v24];
    [v18 endEncoding];
    int v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end