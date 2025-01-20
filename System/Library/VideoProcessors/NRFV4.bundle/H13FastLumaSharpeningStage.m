@interface H13FastLumaSharpeningStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (H13FastLumaSharpeningStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createIntermediateMetalDeviceTexture:(id)a3 withPixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation H13FastLumaSharpeningStage

- (H13FastLumaSharpeningStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)H13FastLumaSharpeningStage;
  v9 = [(H13FastLumaSharpeningStage *)&v19 init];
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
  v11 = [[H13FastLumaSharpeningStageMetal alloc] initWithMetalContext:v7];
  stageMetal = v10->_stageMetal;
  v10->_stageMetal = v11;

  v13 = v10->_stageMetal;
  if (!v13) {
    goto LABEL_8;
  }
  v14 = [(H13FastLumaSharpeningStageMetal *)v13 shaders];

  if (v14)
  {
    uint64_t v15 = [(H13FastLumaSharpeningStageMetal *)v10->_stageMetal shaders];
    shaders = v10->_shaders;
    v10->_shaders = (H13FastLumaSharpeningShaders *)v15;

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
  uint64_t v7 = -[H13FastLumaSharpeningStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    id v8 = [[H13FastLumaSharpeningConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7];
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
  v13 = [[H13FastLumaSharpeningStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (id)createIntermediateMetalDeviceTexture:(id)a3 withPixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  uint64_t v7 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:a4 width:a5 height:a6 mipmapped:0];
  int v8 = v7;
  if (v7)
  {
    [v7 setUsage:3];
    id v9 = [(FigMetalContext *)self->_metal device];
    id v10 = (void *)[v9 newTextureWithDescriptor:v8];

    if (v10)
    {
      [v10 setLabel:0];
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    id v10 = 0;
  }

  return v10;
}

- (int)runWithArgs:(id)a3
{
  id v5 = a3;
  memset(v44, 0, 76);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v35 = FigSignalErrorAt();
    goto LABEL_15;
  }
  id v6 = v5;
  uint64_t v7 = [v6 bounds];
  if (!v7)
  {
    int v35 = FigSignalErrorAt();
LABEL_22:

    goto LABEL_15;
  }
  int v8 = (void *)v7;
  id v9 = [v6 inputFrame];
  id v10 = -[SoftISPInputFrame processingOptions]((uint64_t)v9);

  if (!v10)
  {
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v11 = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", @"AllowUnclampedOutputs", 0, 0);
  id v12 = [v6 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v35 = FigSignalErrorAt();

    goto LABEL_21;
  }
  v14 = [v6 config];
  uint64_t v15 = [v6 inputFrame];
  int v16 = [v14 getLumaSharpeningConfigForInputFrame:v15 lumaSharpeningConfig:v44];

  if (v16)
  {
    uint64_t v38 = v3;
    LODWORD(v37) = 0;
    FigDebugAssert3();
  }
  v17 = objc_msgSend(v6, "outputLumaTex", v37, v38);

  v40 = v10;
  id v41 = v5;
  if (!v17)
  {
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
    uint64_t v20 = v19;
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
    v22 = [(H13FastLumaSharpeningStage *)self createIntermediateMetalDeviceTexture:@"h13fastysh.out" withPixelFormat:25 width:v20 height:HIDWORD(v21)];
    v43[0] = v22;
    if (v22)
    {
      [v6 setOutputLumaTex:v22];
      FigMetalDecRef();
      v23 = [v6 outputLumaTex];
      id v24 = v43[0];
      v43[0] = v23;

      goto LABEL_11;
    }
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();

    goto LABEL_21;
  }
  uint64_t v18 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);
  WORD1(v44[0]) = WORD2(v18);
  LOWORD(v44[0]) = v18;
LABEL_11:
  uint64_t v25 = v11;
  v39 = v14;
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
  unint64_t v27 = v26;
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
  v29 = (void *)HIDWORD(v28);
  if (v17)
  {
    uint64_t v30 = (int)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);
    uint64_t v31 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8) >> 32;
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
  }
  stageMetal = self->_stageMetal;
  v33 = [v6 inputLumaTex];
  v34 = [v6 outputLumaTex];
  v43[0] = (id)v27;
  v43[1] = v29;
  v43[2] = (id)1;
  v42[0] = v30;
  v42[1] = v31;
  v42[2] = 0;
  int v35 = [(H13FastLumaSharpeningStageMetal *)stageMetal encodeWithConfig:v44 inputTex:v33 outputTex:v34 isRGB:0 allowUnclampedOutputs:v25 sourceSize:v43 destOrigin:v42];

  id v5 = v41;
LABEL_15:

  return v35;
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