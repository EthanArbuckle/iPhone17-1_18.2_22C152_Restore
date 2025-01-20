@interface FusionNetworkPreANEStage
- (FusionNetworkPreANEStage)initWithMetal:(id)a3 isV2:(BOOL)a4;
- (RawDFNetworkStageShared)shared;
- (int)processTilePipelineStage:(id)a3;
- (void)setShared:(id)a3;
@end

@implementation FusionNetworkPreANEStage

- (FusionNetworkPreANEStage)initWithMetal:(id)a3 isV2:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FusionNetworkPreANEStage;
  v7 = [(FusionNetworkPreANEStage *)&v14 init];
  if (!v7) {
    goto LABEL_4;
  }
  v8 = [[RawDFNetworkPreprocess alloc] initWithContext:v6 isV2:v4];
  preproc = v7->_preproc;
  v7->_preproc = v8;

  v10 = v7;
  if (!v7->_preproc)
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_4:
    v10 = 0;
  }
  v12 = v10;

  return v12;
}

- (int)processTilePipelineStage:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 commandBuffer];
  id v6 = [FusionNetworkTileContext alloc];
  v7 = [(FusionNetworkPreANEStage *)self shared];
  v8 = [v7 metal];
  v9 = -[FusionNetworkTileContext initWithMetal:withInstance:](v6, "initWithMetal:withInstance:", v8, [v4 bufferIndex]);

  if (v9)
  {
    [v4 setUserContext:v9];
    uint64_t v64 = 0;
    long long v62 = 0u;
    long long v63 = 0u;
    v10 = [(FusionNetworkPreANEStage *)self shared];
    [v4 tileIndex];
    v61 = v5;
    if (v10)
    {
      objc_msgSend(v10, "getTileForIndex:");
    }
    else
    {
      uint64_t v64 = 0;
      long long v62 = 0u;
      long long v63 = 0u;
    }

    preproc = self->_preproc;
    v54 = [(FusionNetworkPreANEStage *)self shared];
    v59 = [v54 inputSyntheticReference];
    v52 = [(FusionNetworkPreANEStage *)self shared];
    v57 = [v52 inputSyntheticReferenceFusionMap];
    v50 = [(FusionNetworkPreANEStage *)self shared];
    v40 = [v50 inputSyntheticEV0FusionMap];
    v48 = [(FusionNetworkPreANEStage *)self shared];
    v36 = [v48 inputSyntheticLongFusionMap];
    v46 = [(FusionNetworkPreANEStage *)self shared];
    v35 = [v46 inputLSCGainsTexture];
    v44 = [(FusionNetworkPreANEStage *)self shared];
    uint64_t v33 = [v44 shaderUniforms] + 16;
    v31 = [(FusionNetworkTileContext *)v9 srNoiseMap];
    v38 = [(FusionNetworkTileContext *)v9 gaussianImagePyramidsForFrame:0];
    v11 = [v38 objectAtIndexedSubscript:0];
    v34 = [(FusionNetworkTileContext *)v9 gaussianNoisePyramidsForFrame:0];
    v30 = [v34 objectAtIndexedSubscript:0];
    v32 = [v4 nextNetwork];
    v12 = [v32 inputs];
    v13 = [v12 objectAtIndexedSubscript:0];
    [v4 nextNetwork];
    objc_super v14 = v56 = v4;
    uint64_t v15 = [v14 inputs];
    v16 = [v15 objectAtIndexedSubscript:2];
    LODWORD(preproc) = [(RawDFNetworkPreprocess *)preproc estimateNoiseAndTileSyntheticReference:v59 syntheticReferenceFusionMap:v57 syntheticEV0FusionMap:v40 syntheticLongFusionMap:v36 lscGains:v35 tile:&v62 uniforms:v33 commandBuffer:v5 outSyntheticReferenceRGBTile:v31 outSyntheticReferenceTile:v11 outSyntheticReferenceNoiseTile:v30 outSyntheticReferencePlanarTile:v13 outSyntheticReferenceNoisePlanarTile:v16];

    int v17 = (int)preproc;
    if (preproc) {
      goto LABEL_11;
    }
    v18 = self->_preproc;
    v58 = [(FusionNetworkPreANEStage *)self shared];
    v60 = [v58 inputSyntheticLong];
    v55 = [(FusionNetworkPreANEStage *)self shared];
    v19 = [v55 inputSyntheticEV0FusionMap];
    v53 = [(FusionNetworkPreANEStage *)self shared];
    v45 = [v53 inputSyntheticLongFusionMap];
    v51 = [(FusionNetworkPreANEStage *)self shared];
    v43 = [v51 inputLSCGainsTexture];
    v49 = [(FusionNetworkPreANEStage *)self shared];
    uint64_t v20 = [v49 shaderUniforms] + 16;
    v47 = [(FusionNetworkTileContext *)v9 gaussianImagePyramidsForFrame:1];
    v37 = [v47 objectAtIndexedSubscript:0];
    v41 = [(FusionNetworkTileContext *)v9 gaussianNoisePyramidsForFrame:1];
    v21 = [v41 objectAtIndexedSubscript:0];
    v39 = [v56 nextNetwork];
    v22 = [v39 inputs];
    v23 = [v22 objectAtIndexedSubscript:1];
    v24 = [v56 nextNetwork];
    v25 = [v24 inputs];
    v26 = [v25 objectAtIndexedSubscript:3];
    int v17 = [(RawDFNetworkPreprocess *)v18 estimateNoiseAndTileSyntheticLong:v60 syntheticEV0FusionMap:v19 syntheticLongFusionMap:v45 lscGains:v43 tile:&v62 uniforms:v20 commandBuffer:v61 outSyntheticLongTile:v37 outSyntheticLongNoiseTile:v21 outSyntheticLongPlanarTile:v23 outSyntheticLongNoisePlanarTile:v26];

    if (v17)
    {
LABEL_11:
      FigDebugAssert3();
      v27 = v56;
      v5 = v61;
    }
    else
    {
      v5 = v61;
      int v17 = [(FusionNetworkTileContext *)v9 generatePyramidsWithCommandBuffer:v61];
      if (v17)
      {
        FigDebugAssert3();
        v27 = v56;
      }
      else
      {
        v27 = v56;
        [v56 setLastCommandBuffer:v61];
      }
    }
  }
  else
  {
    int v66 = 0;
    char v65 = 0;
    v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v17 = -73369;
    v27 = v4;
  }

  return v17;
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

  objc_storeStrong((id *)&self->_preproc, 0);
}

@end