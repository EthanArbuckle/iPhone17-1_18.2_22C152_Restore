@interface H13FastPowerBlurStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (H13FastPowerBlurStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
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

@implementation H13FastPowerBlurStage

- (H13FastPowerBlurStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)H13FastPowerBlurStage;
  v9 = [(H13FastPowerBlurStage *)&v19 init];
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
  v11 = [[H13FastPowerBlurStageMetal alloc] initWithMetalContext:v7];
  stageMetal = v10->_stageMetal;
  v10->_stageMetal = v11;

  v13 = v10->_stageMetal;
  if (!v13) {
    goto LABEL_8;
  }
  v14 = [(H13FastPowerBlurStageMetal *)v13 shaders];

  if (v14)
  {
    uint64_t v15 = [(H13FastPowerBlurStageMetal *)v10->_stageMetal shaders];
    shaders = v10->_shaders;
    v10->_shaders = (H13FastPowerBlurShaders *)v15;

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
  uint64_t v7 = -[H13FastPowerBlurStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    id v8 = [[H13FastPowerBlurConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7];
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
  uint64_t v4 = 2 * [v3 maximumOutputDimensions];
  unint64_t v5 = [v3 maximumOutputDimensions];

  return ((v4 * HIDWORD(v5)) & 0x3FFFFFFFFFFFFFFELL) + 4 * v4 * HIDWORD(v5) + 4 * v4 * HIDWORD(v5);
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
  v13 = [[H13FastPowerBlurStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

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
  id v6 = [(H13FastPowerBlurStage *)self metal];
  long long v81 = 0u;
  long long v82 = 0u;
  memset(v80, 0, sizeof(v80));
  v79 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v13 = FigSignalErrorAt();
    id v11 = 0;
    int v8 = 0;
    id v7 = 0;
    goto LABEL_26;
  }
  id v7 = v5;
  int v8 = [v7 bounds];
  if (!v8
    || ([v7 config],
        id v9 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        (isKindOfClass & 1) == 0))
  {
    int v13 = FigSignalErrorAt();
    id v11 = 0;
    goto LABEL_26;
  }
  id v11 = [v7 config];
  char v78 = 0;
  id v12 = [v7 inputFrame];
  int v13 = [v11 getPowerBlurConfigForInputFrame:v12 PowerBlurConfig:v80 enablePowerBlur:&v78];

  if (v13)
  {
    uint64_t v64 = v3;
    LODWORD(v63) = 0;
    FigDebugAssert3();
  }
  v68 = v6;
  if (v78)
  {
    metal = self->_metal;
    uint64_t v15 = [v7 outputFrame];
    uint64_t v16 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", [v15 lscPixelBuffer], 115, 23, 0);
    v79 = (void *)v16;

    if (!v16)
    {
      FigDebugAssert3();
      int v13 = FigSignalErrorAt();
      goto LABEL_26;
    }
    v17 = [v7 outputLumaTex];

    if (v17)
    {
      v18 = [v7 outputLumaTex];
      uint64_t v19 = [v18 pixelFormat];

      if (v19 != 25) {
        goto LABEL_36;
      }
    }
    else
    {
      -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
      uint64_t v32 = v31;
      -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
      v34 = [(H13FastPowerBlurStage *)self createIntermediateMetalDeviceTexture:@"h13f.powerblur.outputLumaTex" withPixelFormat:25 width:v32 height:HIDWORD(v33)];
      id v75 = v34;
      if (!v34) {
        goto LABEL_35;
      }
      [v7 setOutputLumaTex:v34];
      FigMetalDecRef();
    }
    v35 = objc_msgSend(v7, "outputChromaTex", v63, v64);

    if (v35)
    {
      v36 = [v7 outputChromaTex];
      uint64_t v37 = [v36 pixelFormat];

      if (v37 != 65) {
        goto LABEL_36;
      }
LABEL_20:
      *((void *)&v81 + 1) = 0;
      if (v17)
      {
        v42 = [v7 bounds];
        uint64_t v43 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v42);
        WORD1(v82) = WORD2(v43);
        LOWORD(v82) = v43;

        if (v35)
        {
LABEL_22:
          v44 = [v7 bounds];
          uint32x2_t v45 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v44), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
          WORD3(v82) = v45.i16[2];
          WORD2(v82) = v45.i16[0];

LABEL_25:
          stageMetal = self->_stageMetal;
          v47 = [v7 inputLumaTex];
          v48 = [v7 inputChromaTex];
          v49 = [v7 outputLumaTex];
          v50 = [v7 outputChromaTex];
          int v13 = [(H13FastPowerBlurStageMetal *)stageMetal runWithConfig:v80 inputLumaTex:v47 inputChromaTex:v48 outputLumaTex:v49 outputChromaTex:v50 lscGainsTex:v16];

          id v6 = v68;
          [v68 commit];
LABEL_26:
          FigMetalDecRef();
          v51 = v79;
          goto LABEL_31;
        }
      }
      else
      {
        LODWORD(v82) = 0;
        if (v35) {
          goto LABEL_22;
        }
      }
      DWORD1(v82) = 0;
      goto LABEL_25;
    }
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
    uint64_t v39 = v38 >> 1;
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
    v41 = [(H13FastPowerBlurStage *)self createIntermediateMetalDeviceTexture:@"h13f.powerblur.outputChromaTex" withPixelFormat:65 width:v39 height:v40 >> 33];
    id v75 = v41;
    if (v41)
    {
      [v7 setOutputChromaTex:v41];
      FigMetalDecRef();

      goto LABEL_20;
    }
LABEL_35:
    FigDebugAssert3();
LABEL_36:
    int v13 = FigSignalErrorAt();
    id v6 = v68;
    goto LABEL_26;
  }
  v66 = v11;
  id v67 = v5;
  v20 = [v7 outputLumaTex];

  if (v20)
  {
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
    uint64_t v22 = v21;
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
    unint64_t v24 = HIDWORD(v23);
    uint64_t v25 = (int)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);
    uint64_t v26 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8) >> 32;
    v27 = [v68 commandBuffer];
    v28 = [v27 blitCommandEncoder];

    v29 = [v7 inputLumaTex];
    v30 = [v7 outputLumaTex];
    id v75 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t v72 = v22;
    unint64_t v73 = v24;
    uint64_t v74 = 1;
    uint64_t v69 = v25;
    uint64_t v70 = v26;
    uint64_t v71 = 0;
    [v28 copyFromTexture:v29 sourceSlice:0 sourceLevel:0 sourceOrigin:&v75 sourceSize:&v72 toTexture:v30 destinationSlice:0 destinationLevel:0 destinationOrigin:&v69];

    [v28 endEncoding];
  }
  else
  {
    v28 = [v7 inputLumaTex];
    [v7 setOutputLumaTex:v28];
  }

  v52 = [v7 outputChromaTex];

  if (v52)
  {
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
    uint64_t v65 = v53 >> 1;
    -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
    unint64_t v55 = v54 >> 33;
    uint64_t v56 = (int)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);
    v57 = v8;
    uint64_t v58 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8) >> 32;
    id v6 = v68;
    v59 = [v68 commandBuffer];
    v51 = [v59 blitCommandEncoder];

    v60 = [v7 inputChromaTex];
    v61 = [v7 outputChromaTex];
    id v75 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t v72 = v65;
    unint64_t v73 = v55;
    uint64_t v74 = 1;
    uint64_t v69 = v56;
    uint64_t v70 = v58;
    int v8 = v57;
    uint64_t v71 = 0;
    [v51 copyFromTexture:v60 sourceSlice:0 sourceLevel:0 sourceOrigin:&v75 sourceSize:&v72 toTexture:v61 destinationSlice:0 destinationLevel:0 destinationOrigin:&v69];

    [v51 endEncoding];
    id v11 = v66;
    id v5 = v67;
  }
  else
  {
    v51 = [v7 inputChromaTex];
    [v7 setOutputChromaTex:v51];
    id v5 = v67;
    id v6 = v68;
    id v11 = v66;
  }
LABEL_31:

  return v13;
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