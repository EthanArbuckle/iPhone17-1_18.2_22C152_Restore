@interface H13FastDemosaicStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (H13FastDemosaicShaders)shaders;
- (H13FastDemosaicStage)initWithMetalContext:(id)a3 staticParameters:(id)a4 outputGammaEncoded:(BOOL)a5;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation H13FastDemosaicStage

- (H13FastDemosaicStage)initWithMetalContext:(id)a3 staticParameters:(id)a4 outputGammaEncoded:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)H13FastDemosaicStage;
  v11 = [(H13FastDemosaicStage *)&v21 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  if (!v9) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v11->_metal, a3);
  if (!v10) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v12->_staticParameters, a4);
  v13 = [[H13FastDemosaicStageMetal alloc] initWithMetalContext:v9];
  stageMetal = v12->_stageMetal;
  v12->_stageMetal = v13;

  v15 = v12->_stageMetal;
  if (!v15) {
    goto LABEL_8;
  }
  v16 = [(H13FastDemosaicStageMetal *)v15 shaders];

  if (v16)
  {
    uint64_t v17 = [(H13FastDemosaicStageMetal *)v12->_stageMetal shaders];
    shaders = v12->_shaders;
    v12->_shaders = (H13FastDemosaicShaders *)v17;

    v12->_outputDownscaleFactor = 1;
    v12->_outputGammaEncoded = a5;
    v19 = v12;
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    v19 = 0;
  }

  return v19;
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  return 1751527984;
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
  uint64_t v7 = -[H13FastDemosaicStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    v8 = [[H13FastDemosaicConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7 outputGammaEncoded:self->_outputGammaEncoded];
  }
  else
  {
    FigDebugAssert3();
    v8 = 0;
  }

  return v8;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  id v3 = a3;
  int v4 = [v3 maximumOutputDimensions];
  int v5 = (unint64_t)[v3 maximumOutputDimensions] >> 32;

  return 16 * (v4 * v5);
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
  v13 = [[H13FastDemosaicStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (int)runWithArgs:(id)a3
{
  id v4 = a3;
  long long v65 = 0u;
  memset(v64, 0, sizeof(v64));
  id v5 = [(H13FastDemosaicStage *)self metal];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v26 = FigSignalErrorAt();
    goto LABEL_41;
  }
  id v6 = v4;
  uint64_t v7 = [v6 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v26 = FigSignalErrorAt();
LABEL_60:

    goto LABEL_41;
  }
  id v9 = [v6 config];
  id v10 = [v6 bounds];

  if (!v10) {
    goto LABEL_44;
  }
  id v11 = [v6 inputFrame];

  if (!v11) {
    goto LABEL_44;
  }
  id v12 = [v6 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v12);
  unint64_t v14 = v13;

  v15 = [v6 inputTex];

  if (!v15
    || ([v6 inputFrame],
        v16 = objc_claimAutoreleasedReturnValue(),
        -[SoftISPInputFrame metadata]((uint64_t)v16),
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v16,
        (v61 = (void *)v17) == 0))
  {
LABEL_44:
    int v26 = FigSignalErrorAt();
LABEL_54:

    goto LABEL_60;
  }
  v18 = [v6 outputLumaTex];

  if (v18)
  {
    v19 = [v6 outputLumaTex];
    uint64_t v20 = [v19 pixelFormat];

    if (v20 != 25) {
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v21 = [(H13FastDemosaicStage *)self createIntermediateMetalTexture:@"h13f.dem.outputLumaTex" pixelFormat:25 width:v14 height:HIDWORD(v14)];
    v62 = (void *)v21;
    if (!v21)
    {
LABEL_51:
      int v26 = FigSignalErrorAt();
      goto LABEL_53;
    }
    [v6 setOutputLumaTex:v21];
    FigMetalDecRef();
  }
  v22 = [v6 outputChromaTex];

  if (v22)
  {
    v23 = [v6 outputChromaTex];
    uint64_t v24 = [v23 pixelFormat];

    if (v24 != 65) {
      goto LABEL_51;
    }
  }
  else
  {
    v63 = [(H13FastDemosaicStage *)self createIntermediateMetalTexture:@"h13f.dem.outputChromaTex" pixelFormat:65 width:v14 >> 1 height:v14 >> 33];

    if (!v63)
    {
      int v26 = FigSignalErrorAt();

      goto LABEL_53;
    }
    objc_msgSend(v6, "setOutputChromaTex:");
    FigMetalDecRef();
  }
  v25 = [v6 inputFrame];
  int v26 = [v9 getDemosaicConfigForInputFrame:v25 demosaicConfig:v64];

  if (v26)
  {
    FigDebugAssert3();
LABEL_53:

    goto LABEL_54;
  }
  DWORD1(v64[0]) = 0;
  if (v18)
  {
    v27 = [v6 bounds];
    uint64_t v28 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v27);
    WORD5(v64[0]) = WORD2(v28);
    WORD4(v64[0]) = v28;
  }
  else
  {
    DWORD2(v64[0]) = 0;
  }
  v60 = v9;
  if (v22)
  {
    v29 = [v6 bounds];
    uint32x2_t v30 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v29), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    HIWORD(v64[0]) = v30.i16[2];
    WORD6(v64[0]) = v30.i16[0];
  }
  else
  {
    HIDWORD(v64[0]) = 0;
  }
  v59 = [v5 commandBuffer];
  if (!v59)
  {
    int v26 = FigSignalErrorAt();
LABEL_59:

    goto LABEL_60;
  }
  staticParameters = self->_staticParameters;
  v32 = [v6 inputFrame];
  v33 = -[SoftISPStaticParameters tuningParametersForInputFrameMetadata:tuningType:](staticParameters, "tuningParametersForInputFrameMetadata:tuningType:", v61, -[SoftISPInputFrame tuningType]((uint64_t)v32));

  if (!v33) {
    FigSignalErrorAt();
  }
  v57 = v5;
  id v58 = v4;
  v56 = v33;
  if (!BYTE4(v65))
  {
    v42 = [v33 objectForKeyedSubscript:@"Demosaic"];
    v43 = v42;
    if (!v42)
    {
      FigSignalErrorAt();
      v43 = (void *)MEMORY[0x263EFFA78];
    }
    id v40 = v43;

    v44 = objc_opt_new();
    if (v44)
    {
      v41 = v44;
      int v45 = [v44 readPlist:v40];
      if (!v45)
      {
        [(H13FastDemosaicStageMetal *)self->_stageMetal setZimmerDEMTuningParams:v41];
        v55 = 0;
        v38 = 0;
        goto LABEL_38;
      }
      int v26 = v45;
      FigDebugAssert3();
    }
    else
    {
      int v26 = FigSignalErrorAt();
    }

    goto LABEL_58;
  }
  v34 = [v33 objectForKeyedSubscript:@"QDEM"];
  v35 = v34;
  if (!v34)
  {
    FigSignalErrorAt();
    v35 = (void *)MEMORY[0x263EFFA78];
  }
  id v36 = v35;

  v37 = objc_opt_new();
  if (!v37)
  {
    int v26 = FigSignalErrorAt();
LABEL_50:

LABEL_58:
    goto LABEL_59;
  }
  v38 = v37;
  int v39 = [v37 readPlist:v36];
  if (v39)
  {
    int v26 = v39;
    FigDebugAssert3();

    goto LABEL_50;
  }
  v55 = v36;
  [(H13FastDemosaicStageMetal *)self->_stageMetal setQdemTuningParams:v38];
  id v40 = 0;
  v41 = 0;
LABEL_38:
  stageMetal = self->_stageMetal;
  v47 = [v6 inputTex];
  v48 = [v6 bounds];
  -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v48);
  double v50 = v49;
  v51 = [v6 outputLumaTex];
  v52 = [v6 outputChromaTex];
  int v26 = [(H13FastDemosaicStageMetal *)stageMetal runWithInputTex:v47 demosaicConfig:v64 outputSize:v51 outputTexY:v52 outputTexUV:v59 commandBuffer:v50];

  if (v26)
  {
    FigDebugAssert3();

    id v5 = v57;
  }
  else
  {
    [v6 setInputTex:0];
    v53 = [v6 outputFrame];
    [v53 addCompletionHandlerToCommandBuffer:v59];

    id v5 = v57;
    [v57 commit];
  }
  id v4 = v58;
LABEL_41:

  return v26;
}

- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  id v10 = [(FigMetalContext *)self->_metal allocator];
  id v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = [v11 desc];
  [v12 setTextureType:2];

  unint64_t v13 = [v11 desc];
  [v13 setWidth:a5];

  unint64_t v14 = [v11 desc];
  [v14 setHeight:a6];

  v15 = [v11 desc];
  [v15 setUsage:7];

  v16 = [v11 desc];
  [v16 setPixelFormat:a4];

  [v11 setLabel:0];
  uint64_t v17 = [(FigMetalContext *)self->_metal allocator];
  v18 = (void *)[v17 newTextureWithDescriptor:v11];

  if (!v18)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v18 = 0;
  }

  return v18;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (H13FastDemosaicShaders)shaders
{
  return self->_shaders;
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
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_stageMetal, 0);
}

@end