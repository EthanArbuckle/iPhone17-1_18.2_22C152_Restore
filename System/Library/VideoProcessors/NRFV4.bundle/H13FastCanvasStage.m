@interface H13FastCanvasStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (H13FastCanvasStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
- (SoftISPStaticParameters)staticParameters;
- (id)auxiliaryPixelFormatsForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
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

@implementation H13FastCanvasStage

- (H13FastCanvasStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)H13FastCanvasStage;
  v9 = [(H13FastCanvasStage *)&v19 init];
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
  v11 = [[H13FastCanvasStageMetal alloc] initWithMetalContext:v7];
  stageMetal = v10->_stageMetal;
  v10->_stageMetal = v11;

  v13 = v10->_stageMetal;
  if (!v13) {
    goto LABEL_8;
  }
  v14 = [(H13FastCanvasStageMetal *)v13 shaders];

  if (v14)
  {
    uint64_t v15 = [(H13FastCanvasStageMetal *)v10->_stageMetal shaders];
    shaders = v10->_shaders;
    v10->_shaders = (H13FastCanvasShaders *)v15;

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
  return determineCompressedOutputPixelFormat(875704422, a4);
}

- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5
{
  return 0;
}

- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  return ($F61E096109CF133FD2477F48C7D0CEE7)0;
}

- (id)auxiliaryPixelFormatsForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = &unk_270E98BF0;
  v7[0] = &unk_270E98C08;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = -[H13FastCanvasStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    id v8 = [[H13FastCanvasConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7];
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
  v13 = [[H13FastCanvasStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

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
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = FigSignalErrorAt();
    id v13 = 0;
    id v10 = 0;
    uint64_t v7 = 0;
    id v6 = 0;
    goto LABEL_26;
  }
  id v6 = v5;
  uint64_t v7 = [v6 bounds];
  if (!v7
    || ([v6 config],
        int v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) == 0))
  {
    int v12 = FigSignalErrorAt();
    id v13 = 0;
    id v10 = 0;
    goto LABEL_26;
  }
  id v10 = [v6 config];
  id v11 = [v6 outputFrame];
  id v56 = 0;
  int v12 = [v10 getCanvasQueueForOutputFrame:v11 canvasQueue:&v56];
  id v13 = v56;

  if (v12)
  {
    uint64_t v55 = v3;
    LODWORD(v54) = 0;
    FigDebugAssert3();
  }
  v14 = objc_msgSend(v6, "inputTex", v54, v55);

  if (v14)
  {
    uint64_t v15 = [v6 outputTex];

    if (v15)
    {
      v16 = [v6 outputTex];
      uint64_t v17 = [v16 pixelFormat];

      if (v17 != 115) {
        goto LABEL_30;
      }
      goto LABEL_16;
    }
    v22 = [v6 outputTex];
    uint64_t v23 = [v22 pixelFormat];
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v7);
    uint64_t v25 = v24;
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v7);
    v27 = [(H13FastCanvasStage *)self createIntermediateMetalDeviceTexture:@"softisp.h13fast.canvas.output" withPixelFormat:v23 width:v25 height:HIDWORD(v26)];

    if (v27)
    {
      [v6 setOutputTex:v27];
      FigMetalDecRef();

LABEL_16:
      stageMetal = self->_stageMetal;
      v29 = [v6 inputTex];
      v30 = [v6 outputTex];
      int v12 = [(H13FastCanvasStageMetal *)stageMetal encodeWithCanvasQueueRGB:v13 inputTex:v29 outputTex:v30];
LABEL_25:

      goto LABEL_26;
    }
LABEL_29:
    FigDebugAssert3();
LABEL_30:
    int v12 = FigSignalErrorAt();
    goto LABEL_26;
  }
  v18 = [v6 inputLumaTex];

  if (v18)
  {
    objc_super v19 = [v6 outputLumaTex];

    if (v19)
    {
      v20 = [v6 outputLumaTex];
      uint64_t v21 = [v20 pixelFormat];

      if (v21 != 10) {
        goto LABEL_30;
      }
    }
    else
    {
      v31 = [v6 outputLumaTex];
      uint64_t v32 = [v31 pixelFormat];
      -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v7);
      uint64_t v34 = v33;
      -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v7);
      v36 = [(H13FastCanvasStage *)self createIntermediateMetalDeviceTexture:@"softisp.h13fast.canvas.outputLuma" withPixelFormat:v32 width:v34 height:HIDWORD(v35)];

      if (!v36) {
        goto LABEL_29;
      }
      [v6 setOutputLumaTex:v36];
      FigMetalDecRef();
    }
    v37 = [v6 outputChromaTex];

    if (v37)
    {
      v38 = [v6 outputChromaTex];
      uint64_t v39 = [v38 pixelFormat];

      if (v39 != 30) {
        goto LABEL_30;
      }
    }
    else
    {
      v40 = [v6 outputChromaTex];
      uint64_t v41 = [v40 pixelFormat];
      -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v7);
      uint64_t v43 = v42 >> 1;
      -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v7);
      v45 = [(H13FastCanvasStage *)self createIntermediateMetalDeviceTexture:@"softisp.h13fast.canvas.outputChroma" withPixelFormat:v41 width:v43 height:v44 >> 33];

      if (!v45) {
        goto LABEL_29;
      }
      [v6 setOutputChromaTex:v45];
      FigMetalDecRef();
    }
    v46 = self->_stageMetal;
    v29 = [v6 inputLumaTex];
    v30 = [v6 inputChromaTex];
    v47 = [v6 outputLumaTex];
    [v6 outputChromaTex];
    v48 = v7;
    id v49 = v5;
    v50 = v10;
    v52 = id v51 = v13;
    int v12 = [(H13FastCanvasStageMetal *)v46 encodeWithCanvasQueueYUV:v51 inputLumaTex:v29 inputChromaTex:v30 outputLumaTex:v47 outputChromaTex:v52];

    id v13 = v51;
    id v10 = v50;
    id v5 = v49;
    uint64_t v7 = v48;

    goto LABEL_25;
  }
LABEL_26:

  return v12;
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