@interface RawNightModePostDemosaic
- (RawNightModePostDemosaic)initWithMetalContext:(id)a3;
- (int)suppressChroma:(id)a3 lumaTexture:(id)a4 outputChromaTexture:(id)a5 inputMetadata:(id)a6 tuningParams:(id)a7;
@end

@implementation RawNightModePostDemosaic

- (RawNightModePostDemosaic)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RawNightModePostDemosaic;
  v6 = [(RawNightModePostDemosaic *)&v12 init];
  v7 = v6;
  if (v5
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[H13FastPostDemosaicProcMetal alloc] initWithMetalContext:v7->_metal], stageMetal = v7->_stageMetal, v7->_stageMetal = v8, stageMetal, v7->_stageMetal))
  {
    v10 = v7;
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v10 = 0;
  }

  return v10;
}

- (int)suppressChroma:(id)a3 lumaTexture:(id)a4 outputChromaTexture:(id)a5 inputMetadata:(id)a6 tuningParams:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  if (dword_26B430EA8)
  {
    id v27 = v16;
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v17 = v27;
  }
  memset(v29, 0, 512);
  memset(v28, 0, 512);
  if (!v17)
  {
    FigDebugAssert3();
LABEL_13:
    int v24 = FigSignalErrorAt();
    goto LABEL_9;
  }
  [v17 postDemosaicProcControls];
  int v19 = +[H13FastPostDemosaicProcConfigMetal getChromaSuppressionConfigInputFrameMetadata:v15 tuningControls:v29 chromaSuppressionConfig:v28];
  if (v19)
  {
    int v24 = v19;
    FigDebugAssert3();
    goto LABEL_9;
  }
  v20 = [(FigMetalContext *)self->_metal commandQueue];
  v21 = [v20 commandBuffer];

  if (!v21)
  {
    FigDebugAssert3();
    goto LABEL_13;
  }
  char v31 = 0;
  long long v30 = 0u;
  v28[131] = 0u;
  stageMetal = self->_stageMetal;
  unsigned int v23 = [v13 width];
  LOBYTE(v26) = 0;
  int v24 = -[H13FastPostDemosaicProcMetal runWithInputLumaTex:inputChromaTex:postDemosaicProcConfig:chromaSuppressionConfig:outputSize:outputLumaTex:outputChromaTex:commandBuffer:outputFrame:isQuadra:](stageMetal, "runWithInputLumaTex:inputChromaTex:postDemosaicProcConfig:chromaSuppressionConfig:outputSize:outputLumaTex:outputChromaTex:commandBuffer:outputFrame:isQuadra:", v13, v12, v29, v28, v13, v14, COERCE_DOUBLE(__PAIR64__([v13 height], v23)), v21, 0, v26);
  if (v24) {
    FigDebugAssert3();
  }
  else {
    [v21 commit];
  }

LABEL_9:
  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stageMetal, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end