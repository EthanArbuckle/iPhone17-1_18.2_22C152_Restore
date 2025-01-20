@interface GDCStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (GDCStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
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

@implementation GDCStage

- (GDCStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GDCStage;
  v9 = [(GDCStage *)&v18 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v9->_metal, a3);
  if (!v10->_metal) {
    goto LABEL_8;
  }
  if (!v8) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v10->_staticParameters, a4);
  if (FigGetCFPreferenceNumberWithDefault()) {
    goto LABEL_6;
  }
  id v11 = objc_alloc(MEMORY[0x263F2EE00]);
  v12 = [(FigMetalContext *)v10->_metal commandQueue];
  v13 = [(FigMetalContext *)v10->_metal allocator];
  uint64_t v14 = [v11 initWithOptionalCommandQueue:v12 allocator:v13];
  warpStage = v10->_warpStage;
  v10->_warpStage = (CMIWarpStage *)v14;

  if (v10->_warpStage)
  {
LABEL_6:
    v10->_outputDownscaleFactor = 1;
    v16 = v10;
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    v16 = 0;
  }

  return v16;
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
  uint64_t v7 = -[GDCStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    id v8 = [[GDCConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7];
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
  v13 = [[GDCStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (int)runWithArgs:(id)a3
{
  id v4 = a3;
  memset(v60, 0, 112);
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  int v59 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v24 = FigSignalErrorAt();
    goto LABEL_30;
  }
  id v5 = v4;
  id v6 = [v5 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v24 = FigSignalErrorAt();
LABEL_37:

    goto LABEL_30;
  }
  int v8 = [v5 config];
  id v9 = [v5 bounds];

  if (!v9) {
    goto LABEL_35;
  }
  id v10 = [v5 inputFrame];

  if (!v10) {
    goto LABEL_35;
  }
  id v11 = [v5 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v11);
  unint64_t v13 = v12;

  uint64_t v14 = [v5 outputLumaTex];

  if (v14)
  {
    v15 = [v5 outputLumaTex];
    uint64_t v16 = [v15 pixelFormat];

    if (v16 != 25)
    {
LABEL_35:
      int v24 = FigSignalErrorAt();
LABEL_36:

      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v17 = [(GDCStage *)self createIntermediateMetalTexture:@"h13f.gdc.outputLumaTex" pixelFormat:25 width:v13 height:HIDWORD(v13)];
    v55 = (void *)v17;
    if (!v17) {
      goto LABEL_35;
    }
    [v5 setOutputLumaTex:v17];
    FigMetalDecRef();
  }
  objc_super v18 = [v5 outputChromaTex];

  if (v18)
  {
    v19 = [v5 outputChromaTex];
    uint64_t v20 = [v19 pixelFormat];

    if (v20 != 65) {
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v21 = [(GDCStage *)self createIntermediateMetalTexture:@"h13f.gdc.outputChromaTex" pixelFormat:65 width:v13 >> 1 height:v13 >> 33];
    v56 = (void *)v21;
    if (!v21) {
      goto LABEL_35;
    }
    [v5 setOutputChromaTex:v21];
    FigMetalDecRef();
  }
  v22 = [v5 inputFrame];
  v23 = [v5 bounds];
  int v24 = [v8 getWarpConfigForInputFrame:v22 bounds:v23 warpConfig:&v57];

  if (v24)
  {
    FigDebugAssert3();
    goto LABEL_36;
  }
  if (!v14)
  {
    LODWORD(v58) = 0;
    if (v18) {
      goto LABEL_18;
    }
LABEL_20:
    HIDWORD(v58) = 0;
    goto LABEL_21;
  }
  v25 = [v5 bounds];
  uint64_t v26 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v25);
  WORD1(v58) = WORD2(v26);
  LOWORD(v58) = v26;

  if (!v18) {
    goto LABEL_20;
  }
LABEL_18:
  v27 = [v5 bounds];
  uint32x2_t v28 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v27), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
  HIWORD(v58) = v28.i16[2];
  WORD2(v58) = v28.i16[0];

LABEL_21:
  v29 = [v5 inputLumaTex];

  if (!v29) {
    goto LABEL_35;
  }
  v30 = [v5 inputChromaTex];

  if (!v30) {
    goto LABEL_35;
  }
  v31 = [v5 outputLumaTex];

  if (!v31) {
    goto LABEL_35;
  }
  v32 = [v5 outputChromaTex];

  if (!v32) {
    goto LABEL_35;
  }
  id v54 = v4;
  v33 = v8;
  v34 = (void *)MEMORY[0x263F2ED78];
  v35 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)self->_staticParameters);
  v36 = [v5 inputFrame];
  v37 = -[SoftISPInputFrame portType](v36);
  v38 = [v35 objectForKeyedSubscript:v37];
  v39 = [v5 inputFrame];
  v40 = -[SoftISPInputFrame metadata]((uint64_t)v39);
  int v24 = [v34 getGDCParams:v60 cameraInfo:v38 metadata:v40];

  if (v24) {
    goto LABEL_39;
  }
  [(FigMetalContext *)self->_metal forceCommit];
  v41 = [v5 outputLumaTex];
  [v41 width];

  v42 = [v5 outputLumaTex];
  [v42 height];

  v43 = [v5 inputFrame];
  -[SoftISPInputFrame frameID]((uint64_t)v43);

  warpStage = self->_warpStage;
  v45 = [v5 inputLumaTex];
  v46 = [v5 inputChromaTex];
  v47 = [v5 outputLumaTex];
  v48 = [v5 outputChromaTex];
  LOBYTE(v53) = 0;
  int v24 = [(CMIWarpStage *)warpStage runGDCWithInputLuma:v45 inputChromaTex:v46 outputLumaTex:v47 outputChromaTex:v48 warpConfig:&v57 gdcParams:v60 inverseGDC:v53];

  if (v24)
  {
LABEL_39:
    FigDebugAssert3();
LABEL_41:

    goto LABEL_29;
  }
  [v5 setInputLumaTex:0];
  [v5 setInputChromaTex:0];
  uint64_t v49 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v49)
  {
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
    goto LABEL_41;
  }
  v50 = (void *)v49;
  v51 = [v5 outputFrame];
  [v51 addCompletionHandlerToCommandBuffer:v50];

  [(FigMetalContext *)self->_metal commit];
  int v24 = 0;
LABEL_29:
  id v4 = v54;
LABEL_30:

  return v24;
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

  uint64_t v14 = [v11 desc];
  [v14 setHeight:a6];

  v15 = [v11 desc];
  [v15 setUsage:7];

  uint64_t v16 = [v11 desc];
  [v16 setPixelFormat:a4];

  [v11 setLabel:0];
  uint64_t v17 = [(FigMetalContext *)self->_metal allocator];
  objc_super v18 = (void *)[v17 newTextureWithDescriptor:v11];

  if (!v18)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    objc_super v18 = 0;
  }

  return v18;
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

  objc_storeStrong((id *)&self->_warpStage, 0);
}

@end