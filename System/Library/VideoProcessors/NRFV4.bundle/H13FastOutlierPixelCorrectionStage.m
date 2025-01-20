@interface H13FastOutlierPixelCorrectionStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (H13FastOutlierPixelCorrectionStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 compressed:(BOOL)a7;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation H13FastOutlierPixelCorrectionStage

- (H13FastOutlierPixelCorrectionStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)H13FastOutlierPixelCorrectionStage;
  v9 = [(H13FastOutlierPixelCorrectionStage *)&v19 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v9->_metal, a3);
  if (!v8) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v10->_staticParameters, a4);
  v11 = [[H13FastOutlierPixelCorrectionStageMetal alloc] initWithMetalContext:v7];
  stageMetal = v10->_stageMetal;
  v10->_stageMetal = v11;

  v13 = v10->_stageMetal;
  if (!v13) {
    goto LABEL_8;
  }
  v14 = [(H13FastOutlierPixelCorrectionStageMetal *)v13 shaders];

  if (v14)
  {
    uint64_t v15 = [(H13FastOutlierPixelCorrectionStageMetal *)v10->_stageMetal shaders];
    shaders = v10->_shaders;
    v10->_shaders = (H13FastOutlierPixelCorrectionShaders *)v15;

    v10->_outputDownscaleFactor = 1;
    v17 = v10;
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    v17 = 0;
  }

  return v17;
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  return determineCompressedOutputPixelFormat(1751527984, a4);
}

- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5
{
  return 0;
}

- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  return ($F61E096109CF133FD2477F48C7D0CEE7)0;
}

- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = -[H13FastOutlierPixelCorrectionStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    id v8 = [[H13FastOutlierPixelCorrectionConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7];
  }
  else
  {
    FigDebugAssert3();
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  return 0;
}

- (int)validateInputFrame:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && v6) {
    int v8 = 0;
  }
  else {
    int v8 = FigSignalErrorAt();
  }

  return v8;
}

- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[H13FastOutlierPixelCorrectionStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 compressed:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = [(FigMetalContext *)self->_metal allocator];
  v13 = (void *)[v12 newTextureDescriptor];

  if (!v13) {
    goto LABEL_9;
  }
  v14 = [v13 desc];
  [v14 setTextureType:2];

  uint64_t v15 = [v13 desc];
  [v15 setWidth:a5];

  v16 = [v13 desc];
  [v16 setHeight:a6];

  uint64_t v17 = v7 ? 16387 : 3;
  v18 = [v13 desc];
  [v18 setUsage:v17];

  objc_super v19 = [v13 desc];
  [v19 setPixelFormat:a4];

  v20 = [v13 desc];
  [v20 setCompressionMode:v7];

  [v13 setLabel:0];
  v21 = [(FigMetalContext *)self->_metal allocator];
  v22 = (void *)[v21 newTextureWithDescriptor:v13];

  if (!v22)
  {
LABEL_9:
    FigDebugAssert3();
    FigSignalErrorAt();
    v22 = 0;
  }

  return v22;
}

- (int)runWithArgs:(id)a3
{
  id v5 = a3;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v17 = FigSignalErrorAt();
    uint64_t v15 = 0;
    int v8 = 0;
    id v6 = 0;
    goto LABEL_18;
  }
  id v6 = v5;
  uint64_t v7 = [v6 bounds];
  int v8 = (void *)v7;
  if (!v7) {
    goto LABEL_21;
  }
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels](v7);
  uint32x2_t v10 = v9;
  uint64_t v11 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);
  id v12 = [v6 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_21:
    int v17 = FigSignalErrorAt();
    uint64_t v15 = 0;
    goto LABEL_18;
  }
  uint32x2_t v14 = v10;
  uint64_t v15 = [v6 config];
  v16 = [v6 inputFrame];
  int v17 = [v15 getOutlierPixelCorrectionConfig:&v49 forInputFrame:v16];

  if (v17)
  {
    uint64_t v39 = v3;
    LODWORD(v38) = 0;
    FigDebugAssert3();
  }
  uint32x2_t v42 = vshr_n_u32(v14, 1uLL);
  uint64_t v44 = v11;
  v18 = objc_msgSend(v6, "outputTex", v38, v39);

  if ((_BYTE)v49)
  {
    if (v18)
    {
      HIWORD(v50) = WORD2(v44);
      WORD2(v50) = v44;
      goto LABEL_16;
    }
    HIDWORD(v50) = 0;
    v32 = [(H13FastOutlierPixelCorrectionStage *)self createIntermediateMetalTexture:@"h13f.opc.outputTex" pixelFormat:115 width:v42.u16[0] height:v42.u16[2] compressed:1];
    v47[0] = v32;
    if (v32)
    {
      [v6 setOutputTex:v32];
      FigMetalDecRef();

LABEL_16:
      stageMetal = self->_stageMetal;
      v34 = [v6 inputTex];
      v35 = [v6 outputTex];
      int v17 = [(H13FastOutlierPixelCorrectionStageMetal *)stageMetal runWithConfig:&v49 inputTex:v34 outputTex:v35];

      if (v17)
      {
        uint64_t v39 = v3;
        LODWORD(v38) = v17;
        FigDebugAssert3();
      }
      goto LABEL_18;
    }
LABEL_24:
    int v17 = FigSignalErrorAt();
    goto LABEL_18;
  }
  if (!v18)
  {
    v37 = [v6 inputTex];
    [v6 setOutputTex:v37];

    goto LABEL_18;
  }
  objc_super v19 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v19)
  {
    uint64_t v39 = v3;
    LODWORD(v38) = 0;
    FigDebugAssert3();
    goto LABEL_24;
  }
  v20 = v19;
  uint64_t v21 = [v19 blitCommandEncoder];
  v22 = (void *)v21;
  if (v21)
  {
    v40 = (void *)v42.u16[0];
    v41 = (void *)v21;
    unsigned __int16 v23 = v42.u16[2];
    v43 = v20;
    v24 = v15;
    unint64_t v25 = v23;
    id v26 = v5;
    uint64_t v27 = (unsigned __int16)v44;
    unsigned __int16 v28 = WORD2(v44);
    v45 = self;
    uint64_t v29 = v28;
    v30 = [v6 inputTex];
    memset(v48, 0, sizeof(v48));
    v31 = [v6 outputTex];
    v47[0] = v40;
    v47[1] = (id)v25;
    uint64_t v15 = v24;
    v47[2] = (id)1;
    v46[0] = v27;
    v46[1] = v29;
    id v5 = v26;
    v22 = v41;
    v20 = v43;
    v46[2] = 0;
    [v41 copyFromTexture:v30 sourceSlice:0 sourceLevel:0 sourceOrigin:v48 sourceSize:v47 toTexture:v31 destinationSlice:0 destinationLevel:0 destinationOrigin:v46];

    [v41 endEncoding];
    [(FigMetalContext *)v45->_metal commit];
  }
  else
  {
    uint64_t v39 = v3;
    LODWORD(v38) = 0;
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
  }

LABEL_18:
  objc_msgSend(v6, "setInputTex:", 0, v38, v39);

  return v17;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (SoftISPStaticParameters)staticParameters
{
  return self->_staticParameters;
}

- (unsigned)outputDownscaleFactor
{
  return self->_outputDownscaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticParameters, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_stageMetal, 0);
}

@end