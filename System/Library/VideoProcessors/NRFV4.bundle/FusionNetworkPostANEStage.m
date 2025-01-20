@interface FusionNetworkPostANEStage
- (FusionNetworkPostANEStage)initWithMetal:(id)a3;
- (RawDFNetworkStageShared)shared;
- (int)processTilePipelineStage:(id)a3;
- (void)setShared:(id)a3;
@end

@implementation FusionNetworkPostANEStage

- (FusionNetworkPostANEStage)initWithMetal:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FusionNetworkPostANEStage;
  v5 = [(FusionNetworkPostANEStage *)&v14 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [[RawDFApplyNetworkWeights alloc] initWithContext:v4];
  applyNetworkWeights = v5->_applyNetworkWeights;
  v5->_applyNetworkWeights = v6;

  if (!v5->_applyNetworkWeights
    || ([v4 computePipelineStateFor:@"artifactNetworkPreprocess" constants:0],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        artifactNetworkPreprocess = v5->_artifactNetworkPreprocess,
        v5->_artifactNetworkPreprocess = (MTLComputePipelineState *)v8,
        artifactNetworkPreprocess,
        v10 = v5,
        !v5->_artifactNetworkPreprocess))
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_5:
    v10 = 0;
  }
  v12 = v10;

  return v12;
}

- (int)processTilePipelineStage:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v79 = 0;
  v5 = [v4 commandBuffer];
  uint64_t v78 = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  v6 = [(FusionNetworkPostANEStage *)self shared];
  v7 = v4;
  [v4 tileIndex];
  if (v6)
  {
    objc_msgSend(v6, "getTileForIndex:");
  }
  else
  {
    uint64_t v78 = 0;
    long long v76 = 0u;
    long long v77 = 0u;
  }

  uint64_t v8 = [v4 userContext];
  if (!v8) {
    goto LABEL_14;
  }
  v9 = [(FusionNetworkPostANEStage *)self shared];
  v10 = [v9 metal];
  v11 = [v10 allocator];
  v12 = (void *)[v11 newTextureDescriptor];

  if (v12)
  {
    v13 = [v12 desc];
    [v13 setCompressionMode:2];

    objc_super v14 = [v12 desc];
    [v14 setCompressionFootprint:0];

    uint64_t v15 = [v12 desc];
    [v15 setUsage:7];

    v16 = [v12 desc];
    [v16 setPixelFormat:115];

    v17 = [v12 desc];
    [v17 setWidth:SHIDWORD(v76)];

    v18 = [v12 desc];
    [v18 setHeight:(int)v77];

    [v12 setLabel:0];
    v19 = [(FusionNetworkPostANEStage *)self shared];
    v20 = [v19 metal];
    v21 = [v20 allocator];
    v22 = (void *)[v21 newTextureWithDescriptor:v12];
    id v79 = v22;

    if (v22)
    {
      v52 = v12;
      applyNetworkWeights = self->_applyNetworkWeights;
      v66 = [(FusionNetworkPostANEStage *)self shared];
      uint64_t v63 = [v66 shaderUniforms];
      v65 = [v7 previousNetwork];
      v69 = [v65 outputs];
      v61 = [v8 gaussianImagePyramidsForFrame:0];
      v60 = [v8 gaussianImagePyramidsForFrame:1];
      v68 = [v8 laplacianImagePyramidsForFrame:0];
      v58 = [v8 laplacianImagePyramidsForFrame:1];
      v67 = [v8 gaussianNoisePyramidsForFrame:0];
      v54 = v8;
      v57 = [v8 gaussianNoisePyramidsForFrame:1];
      v62 = [(FusionNetworkPostANEStage *)self shared];
      v56 = [v62 inputSyntheticEV0FusionMap];
      [(FusionNetworkPostANEStage *)self shared];
      v59 = v53 = v7;
      v55 = [v59 inputSyntheticLongFusionMap];
      v23 = [(FusionNetworkPostANEStage *)self shared];
      v24 = [v23 inputSyntheticReferenceFusionMap];
      v25 = [(FusionNetworkPostANEStage *)self shared];
      v26 = [v25 inputSkyMask];
      v27 = [(FusionNetworkPostANEStage *)self shared];
      v28 = [v27 inputSkinMask];
      v51 = v22;
      LODWORD(applyNetworkWeights) = -[RawDFApplyNetworkWeights applyWeightsOnTile:uniforms:commandBuffer:networkWeights:syntheticReferenceGaussianImagePyramids:syntheticLongGaussianImagePyramids:syntheticReferenceLaplacianImagePyramids:syntheticLongLaplacianImagePyramids:syntheticReferenceGaussianNoisePyramids:syntheticLongGaussianNoisePyramids:syntheticEV0FusionMap:syntheticLongFusionMap:syntheticReferenceFusionMap:skyMask:skinMask:fusedImage:](applyNetworkWeights, "applyWeightsOnTile:uniforms:commandBuffer:networkWeights:syntheticReferenceGaussianImagePyramids:syntheticLongGaussianImagePyramids:syntheticReferenceLaplacianImagePyramids:syntheticLongLaplacianImagePyramids:syntheticReferenceGaussianNoisePyramids:syntheticLongGaussianNoisePyramids:syntheticEV0FusionMap:syntheticLongFusionMap:syntheticReferenceFusionMap:skyMask:skinMask:fusedImage:", &v76, v63, v68, v58, v67, v57, v56, v55, v24, v26, v28, v22);

      int v29 = (int)applyNetworkWeights;
      if (applyNetworkWeights)
      {
        FigDebugAssert3();

        v7 = v53;
        uint64_t v8 = v54;
      }
      else
      {
        v7 = v53;
        v30 = [v53 nextNetwork];

        if (v30)
        {
          v31 = [v5 computeCommandEncoder];
          uint64_t v8 = v54;
          if (!v31)
          {
            int v75 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
            int v29 = -73370;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_13;
          }
          v32 = v31;
          [v31 setLabel:@"artifactNetworkPreprocess"];
          [v32 setComputePipelineState:self->_artifactNetworkPreprocess];
          [v32 setImageblockWidth:32 height:32];
          [v32 setTexture:v51 atIndex:0];
          v33 = [v54 srNoiseMap];
          [v32 setTexture:v33 atIndex:1];

          v34 = [v53 nextNetwork];
          v35 = [v34 inputs];
          v36 = [v35 objectAtIndexedSubscript:0];
          [v32 setTexture:v36 atIndex:2];

          v37 = [v53 nextNetwork];
          v38 = [v37 inputs];
          v39 = [v38 objectAtIndexedSubscript:1];
          [v32 setTexture:v39 atIndex:3];

          [v32 setBytes:&v76 length:40 atIndex:0];
          *(void *)&long long v40 = SHIDWORD(v76);
          *((void *)&v40 + 1) = (int)v77;
          long long v72 = v40;
          uint64_t v73 = 1;
          int64x2_t v70 = vdupq_n_s64(0x20uLL);
          uint64_t v71 = 1;
          [v32 dispatchThreads:&v72 threadsPerThreadgroup:&v70];
          [v32 endEncoding];
        }
        else
        {
          v41 = self->_applyNetworkWeights;
          v42 = [(FusionNetworkPostANEStage *)self shared];
          v43 = [v42 outputLumaTexture];
          v44 = [(FusionNetworkPostANEStage *)self shared];
          v45 = [v44 outputChromaTexture];
          v46 = [(FusionNetworkPostANEStage *)self shared];
          int v29 = -[RawDFApplyNetworkWeights convertYUV444To420AndUntile:yuvTile:outLuma:outChroma:uniforms:commandBuffer:](v41, "convertYUV444To420AndUntile:yuvTile:outLuma:outChroma:uniforms:commandBuffer:", &v76, v51, v43, v45, [v46 shaderUniforms] + 16, v5);

          uint64_t v8 = v54;
          if (v29)
          {
            FigDebugAssert3();

            goto LABEL_13;
          }
        }
        [v53 setLastCommandBuffer:v5];
        FigMetalDecRef();

        int v29 = 0;
      }
    }
    else
    {
      int v75 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
      int v29 = -73370;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
LABEL_14:
    int v75 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    int v29 = -73370;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_13:

  return v29;
}

- (RawDFNetworkStageShared)shared
{
  return self->_shared;
}

- (void)setShared:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shared, 0);
  objc_storeStrong((id *)&self->_artifactNetworkPreprocess, 0);

  objc_storeStrong((id *)&self->_applyNetworkWeights, 0);
}

@end