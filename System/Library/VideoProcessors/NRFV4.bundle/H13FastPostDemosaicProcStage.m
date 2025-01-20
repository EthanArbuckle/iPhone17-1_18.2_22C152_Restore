@interface H13FastPostDemosaicProcStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (H13FastPostDemosaicProcShaders)shaders;
- (H13FastPostDemosaicProcStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
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

@implementation H13FastPostDemosaicProcStage

- (H13FastPostDemosaicProcStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)H13FastPostDemosaicProcStage;
  v9 = [(H13FastPostDemosaicProcStage *)&v19 init];
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
  v11 = [[H13FastPostDemosaicProcMetal alloc] initWithMetalContext:v7];
  stageMetal = v10->_stageMetal;
  v10->_stageMetal = v11;

  v13 = v10->_stageMetal;
  if (!v13) {
    goto LABEL_8;
  }
  v14 = [(H13FastPostDemosaicProcMetal *)v13 shaders];

  if (v14)
  {
    uint64_t v15 = [(H13FastPostDemosaicProcMetal *)v10->_stageMetal shaders];
    shaders = v10->_shaders;
    v10->_shaders = (H13FastPostDemosaicProcShaders *)v15;

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
  uint64_t v7 = -[H13FastPostDemosaicProcStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    id v8 = [[H13FastPostDemosaicProcConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7];
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
  id v3 = a3;
  int v4 = [v3 maximumOutputDimensions];
  int v5 = (unint64_t)[v3 maximumOutputDimensions] >> 32;

  return 9 * (v5 * v4);
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
  v13 = [[H13FastPostDemosaicProcStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (int)runWithArgs:(id)a3
{
  id v4 = a3;
  bzero(v67, 0x4D0uLL);
  bzero(v63, 0x840uLL);
  id v5 = [(H13FastPostDemosaicProcStage *)self metal];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v32 = FigSignalErrorAt();
    goto LABEL_38;
  }
  id v6 = v4;
  uint64_t v7 = [v6 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v32 = FigSignalErrorAt();
LABEL_52:

    goto LABEL_38;
  }
  v60 = [v6 config];
  id v9 = [v6 bounds];

  if (!v9) {
    goto LABEL_42;
  }
  id v10 = [v6 inputFrame];

  if (!v10) {
    goto LABEL_42;
  }
  id v11 = [v6 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v11);
  unint64_t v13 = v12;

  v14 = [v6 inputLumaTex];

  if (!v14) {
    goto LABEL_42;
  }
  uint64_t v15 = [v6 inputChromaTex];

  if (!v15) {
    goto LABEL_42;
  }
  v16 = [v6 inputFrame];
  int v17 = -[SoftISPInputFrame cfaLayout]((uint64_t)v16);

  v18 = [v6 inputFrame];
  objc_super v19 = -[SoftISPInputFrame metadata]((uint64_t)v18);

  if (!v19)
  {
LABEL_42:
    int v32 = FigSignalErrorAt();
LABEL_51:

    goto LABEL_52;
  }
  v20 = [v6 inputFrame];
  v21 = -[SoftISPInputFrame processingOptions]((uint64_t)v20);

  if (!v21)
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
LABEL_48:

    goto LABEL_51;
  }
  char v22 = objc_msgSend(v21, "cmi_BOOLValueForKey:defaultValue:found:", @"AllowUnclampedOutputs", 0, 0);
  v23 = [v6 outputLumaTex];

  v58 = v21;
  v59 = v19;
  if (!v23)
  {
    uint64_t v26 = [(H13FastPostDemosaicProcStage *)self createIntermediateMetalTexture:@"h13f.postDemProc.outputLumaTex" pixelFormat:25 width:v13 height:HIDWORD(v13)];
    v61 = (void *)v26;
    if (v26)
    {
      [v6 setOutputLumaTex:v26];
      FigMetalDecRef();

      goto LABEL_14;
    }
    int v32 = FigSignalErrorAt();

    goto LABEL_48;
  }
  v24 = [v6 outputLumaTex];
  uint64_t v25 = [v24 pixelFormat];

  if (v25 != 25) {
    goto LABEL_49;
  }
LABEL_14:
  v27 = [v6 outputChromaTex];

  if (v27)
  {
    v28 = [v6 outputChromaTex];
    uint64_t v29 = [v28 pixelFormat];

    if (v29 != 65) {
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v30 = [(H13FastPostDemosaicProcStage *)self createIntermediateMetalTexture:@"h13f.postDemProc.outputChromaTex" pixelFormat:65 width:v13 >> 1 height:v13 >> 33];
    v62 = (void *)v30;
    if (!v30)
    {
LABEL_49:
      int v32 = FigSignalErrorAt();
      goto LABEL_50;
    }
    [v6 setOutputChromaTex:v30];
    FigMetalDecRef();
  }
  v31 = [v6 inputFrame];
  int v32 = [v60 getPostDemosaicProcConfigForInputFrame:v31 postDemosaicProcConfig:v67 chromaSuppressionConfig:v63];

  if (v32)
  {
    FigDebugAssert3();
LABEL_50:

    goto LABEL_51;
  }
  uint64_t v69 = 0;
  int v33 = v68;
  if (!v23 || v68)
  {
    int v70 = 0;
    if (!v27)
    {
LABEL_27:
      int v71 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v34 = [v6 bounds];
    uint64_t v35 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v34);
    HIWORD(v70) = WORD2(v35);
    LOWORD(v70) = v35;

    int v33 = v68;
    if (!v27) {
      goto LABEL_27;
    }
  }
  if (v33) {
    goto LABEL_27;
  }
  v36 = [v6 bounds];
  uint32x2_t v37 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v36), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
  HIWORD(v71) = v37.i16[2];
  LOWORD(v71) = v37.i16[0];

LABEL_28:
  char v72 = v22;
  uint64_t v64 = 0;
  if (v23)
  {
    v38 = [v6 bounds];
    uint64_t v39 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v38);
    HIWORD(v65) = WORD2(v39);
    LOWORD(v65) = v39;
  }
  else
  {
    int v65 = 0;
  }
  id v57 = v4;
  if (v27)
  {
    v40 = [v6 bounds];
    uint32x2_t v41 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v40), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    HIWORD(v66) = v41.i16[2];
    LOWORD(v66) = v41.i16[0];
  }
  else
  {
    int v66 = 0;
  }
  uint64_t v42 = [v5 commandBuffer];
  if (v42)
  {
    v43 = (void *)v42;
    v56 = v5;
    BOOL v44 = v17 == 3;
    stageMetal = self->_stageMetal;
    v46 = [v6 inputLumaTex];
    v47 = [v6 inputChromaTex];
    v48 = [v6 bounds];
    -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v48);
    double v50 = v49;
    v51 = [v6 outputLumaTex];
    v52 = [v6 outputChromaTex];
    v53 = [v6 outputFrame];
    LOBYTE(v55) = v44;
    int v32 = [(H13FastPostDemosaicProcMetal *)stageMetal runWithInputLumaTex:v46 inputChromaTex:v47 postDemosaicProcConfig:v67 chromaSuppressionConfig:v63 outputSize:v51 outputLumaTex:v52 outputChromaTex:v50 commandBuffer:v43 outputFrame:v53 isQuadra:v55];

    if (v32)
    {
      FigDebugAssert3();
    }
    else
    {
      [v6 setInputLumaTex:0];
      [v6 setInputChromaTex:0];
    }

    id v5 = v56;
    id v4 = v57;
  }
  else
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
  }
LABEL_38:

  return v32;
}

- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  id v10 = [(FigMetalContext *)self->_metal allocator];
  id v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_6;
  }
  unint64_t v12 = [v11 desc];
  [v12 setTextureType:2];

  unint64_t v13 = [v11 desc];
  [v13 setWidth:a5];

  v14 = [v11 desc];
  [v14 setHeight:a6];

  uint64_t v15 = [v11 desc];
  [v15 setUsage:7];

  v16 = [v11 desc];
  [v16 setPixelFormat:a4];

  [v11 setLabel:0];
  int v17 = [(FigMetalContext *)self->_metal allocator];
  v18 = (void *)[v17 newTextureWithDescriptor:v11];

  if (!v18)
  {
LABEL_6:
    FigSignalErrorAt();
    v18 = 0;
  }

  return v18;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (H13FastPostDemosaicProcShaders)shaders
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