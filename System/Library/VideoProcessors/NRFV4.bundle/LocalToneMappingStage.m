@interface LocalToneMappingStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (LocalToneMappingStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createDeviceMetalTexture:(id)a3 textureType:(unint64_t)a4 pixelFormat:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7 depth:(unint64_t)a8;
- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation LocalToneMappingStage

- (LocalToneMappingStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LocalToneMappingStage;
  v9 = [(LocalToneMappingStage *)&v15 init];
  v10 = v9;
  if (v9
    && v7
    && (objc_storeStrong((id *)&v9->_metal, a3), v8)
    && (objc_storeStrong((id *)&v10->_staticParameters, a4),
        v11 = [[LocalToneMappingShaders alloc] initWithMetalContext:v7], shaders = v10->_shaders, v10->_shaders = v11, shaders, v10->_shaders))
  {
    v10->_outputDownscaleFactor = 1;
    v13 = v10;
  }
  else
  {
    FigDebugAssert3();
    v13 = 0;
  }

  return v13;
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  if (a4) {
    return 0;
  }
  else {
    return 875704422;
  }
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
  id v6 = a3;
  if (a4)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    id v7 = 0;
  }
  else
  {
    id v7 = [[LocalToneMappingConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6];
  }

  return v7;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  id v3 = a3;
  int v4 = [v3 maximumOutputDimensions];
  int v5 = v4 * ((unint64_t)[v3 maximumOutputDimensions] >> 32);

  return (3 * v5) >> 1;
}

- (int)validateInputFrame:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
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
  v13 = [[LocalToneMappingStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (int)runWithArgs:(id)a3
{
  id v5 = a3;
  memset(v69, 0, 80);
  id v6 = [(LocalToneMappingStage *)self metal];
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v29 = FigSignalErrorAt();
    goto LABEL_29;
  }
  id v7 = v5;
  int v8 = [v7 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v29 = FigSignalErrorAt();
LABEL_45:

    goto LABEL_29;
  }
  id v10 = [v7 config];
  id v11 = [v7 bounds];

  if (!v11) {
    goto LABEL_33;
  }
  id v12 = [v7 inputFrame];

  if (!v12) {
    goto LABEL_33;
  }
  v13 = [v7 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v13);
  unint64_t v15 = v14;

  v16 = [v7 inputLumaTex];

  if (!v16) {
    goto LABEL_33;
  }
  v17 = [v7 inputChromaTex];

  if (!v17) {
    goto LABEL_33;
  }
  v18 = [v7 outputLumaTex];

  if (v18)
  {
    v19 = [v7 outputLumaTex];
    uint64_t v20 = [v19 pixelFormat];

    if (v20 != 10) {
      goto LABEL_33;
    }
  }
  else
  {
    v21 = [(LocalToneMappingStage *)self createIntermediateMetalTexture:@"tm.outputLumaTex" pixelFormat:10 width:v15 height:HIDWORD(v15)];
    id v65 = v21;
    if (!v21) {
      goto LABEL_33;
    }
    [v7 setOutputLumaTex:v21];
    FigMetalDecRef();
  }
  v22 = [v7 outputChromaTex];

  uint64_t v23 = v15 >> 1;
  unint64_t v24 = v15 >> 33;
  unint64_t v58 = v24;
  uint64_t v59 = v23;
  if (v22)
  {
    v25 = [v7 outputChromaTex];
    uint64_t v26 = [v25 pixelFormat];

    if (v26 != 30) {
      goto LABEL_33;
    }
  }
  else
  {
    v27 = [(LocalToneMappingStage *)self createIntermediateMetalTexture:@"tm.outputChromaTex" pixelFormat:30 width:v23 height:v24];
    id v65 = v27;
    if (!v27) {
      goto LABEL_33;
    }
    [v7 setOutputChromaTex:v27];
    FigMetalDecRef();
  }
  v28 = [v7 outputFrame];
  int v29 = [v10 getLocalToneCurveDimsForOutputFrame:v28 width:&v68 height:&v67 lumaEntries:&v66];

  if (v29)
  {
    uint64_t v54 = v3;
    LODWORD(v53) = v29;
    FigDebugAssert3();
    goto LABEL_44;
  }
  v61 = [(LocalToneMappingStage *)self createDeviceMetalTexture:@"tm.localCurves" textureType:7 pixelFormat:20 width:v66 height:v68 depth:v67];
  if (!v61)
  {
    uint64_t v54 = v3;
    LODWORD(v53) = 0;
    FigDebugAssert3();
LABEL_33:
    int v29 = FigSignalErrorAt();
LABEL_44:

    goto LABEL_45;
  }
  v60 = [(LocalToneMappingStage *)self createDeviceMetalTexture:@"tm.globalLumaCurve" textureType:0 pixelFormat:20 width:257 height:1 depth:1];
  if (!v60)
  {
    uint64_t v54 = v3;
    LODWORD(v53) = 0;
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
LABEL_43:

    goto LABEL_44;
  }
  uint64_t v30 = [(LocalToneMappingStage *)self createDeviceMetalTexture:@"tm.perComponentCurve" textureType:0 pixelFormat:20 width:257 height:1 depth:1];
  if (!v30)
  {
    uint64_t v54 = v3;
    LODWORD(v53) = 0;
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
LABEL_42:

    goto LABEL_43;
  }
  v31 = v10;
  v32 = v18;
  v56 = v6;
  id v33 = v5;
  v34 = (void *)v30;
  v35 = [v7 inputFrame];
  v36 = [v7 outputFrame];
  v37 = [v7 bounds];
  v55 = v34;
  v57 = v31;
  int v29 = [v31 getToneMappingConfigForInputFrame:v35 outputFrame:v36 bounds:v37 config:v69 localCurves:v61 globalLumaCurve:v60 perComponentCurve:v34];

  if (v29)
  {
    uint64_t v54 = v3;
    LODWORD(v53) = v29;
    FigDebugAssert3();

    id v5 = v33;
    id v6 = v56;
    goto LABEL_29;
  }
  id v5 = v33;
  if (v32)
  {
    v38 = [v7 bounds];
    uint64_t v39 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v38);
    WORD3(v69[0]) = WORD2(v39);
    WORD2(v69[0]) = v39;
  }
  id v6 = v56;
  if (v22)
  {
    v40 = [v7 bounds];
    uint32x2_t v41 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v40), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    WORD5(v69[0]) = v41.i16[2];
    WORD4(v69[0]) = v41.i16[0];
  }
  v42 = [v56 commandBuffer];
  id v10 = v57;
  if (!v42)
  {
    int v29 = FigSignalErrorAt();
LABEL_41:

    goto LABEL_42;
  }
  v43 = v42;
  uint64_t v44 = [v42 computeCommandEncoder];
  if (!v44)
  {
    int v29 = FigSignalErrorAt();

    goto LABEL_41;
  }
  v45 = (void *)v44;
  v46 = [(LocalToneMappingShaders *)self->_shaders ltm];
  [v45 setComputePipelineState:v46];

  v47 = [v7 inputLumaTex];
  [v45 setTexture:v47 atIndex:0];

  v48 = [v7 inputChromaTex];
  [v45 setTexture:v48 atIndex:1];

  v49 = [v7 outputLumaTex];
  [v45 setTexture:v49 atIndex:2];

  v50 = [v7 outputChromaTex];
  [v45 setTexture:v50 atIndex:3];

  [v45 setTexture:v61 atIndex:10];
  [v45 setTexture:v60 atIndex:11];
  [v45 setTexture:v55 atIndex:12];
  [v45 setBytes:v69 length:80 atIndex:0];
  v64[0] = v59;
  v64[1] = v58;
  v64[2] = 1;
  int64x2_t v62 = vdupq_n_s64(0x10uLL);
  uint64_t v63 = 1;
  [v45 dispatchThreads:v64 threadsPerThreadgroup:&v62];
  [v45 endEncoding];

  v51 = [v7 outputFrame];
  [v51 addCompletionHandlerToCommandBuffer:v43];

  [v56 commit];
  int v29 = 0;
LABEL_29:
  objc_msgSend(0, "endEncoding", v53, v54);

  return v29;
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

  v13 = [v11 desc];
  [v13 setWidth:a5];

  unint64_t v14 = [v11 desc];
  [v14 setHeight:a6];

  unint64_t v15 = [v11 desc];
  [v15 setUsage:7];

  v16 = [v11 desc];
  [v16 setPixelFormat:a4];

  [v11 setLabel:0];
  v17 = [(FigMetalContext *)self->_metal allocator];
  v18 = (void *)[v17 newTextureWithDescriptor:v11];

  if (!v18)
  {
LABEL_6:
    FigSignalErrorAt();
    v18 = 0;
  }

  return v18;
}

- (id)createDeviceMetalTexture:(id)a3 textureType:(unint64_t)a4 pixelFormat:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7 depth:(unint64_t)a8
{
  id v14 = a3;
  unint64_t v15 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:a5 width:a6 height:a7 mipmapped:0];
  [v15 setDepth:a8];
  [v15 setTextureType:a4];
  [v15 setUsage:7];
  v16 = [(FigMetalContext *)self->_metal device];
  v17 = (void *)[v16 newTextureWithDescriptor:v15];

  if (v17)
  {
    [v17 setLabel:v14];
    id v18 = v17;
  }
  else
  {
    FigSignalErrorAt();
  }

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
}

@end