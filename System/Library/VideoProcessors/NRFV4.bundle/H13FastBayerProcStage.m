@interface H13FastBayerProcStage
+ (id)createIntermediateMetalTexture:(id)a3 label:(id)a4 pixelFormat:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7 compressed:(BOOL)a8;
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- ($FA854DD5444320DDC86C81E6605CE88F)sifrFrameId;
- (BOOL)_shouldApplyGDC:(id)a3;
- (BOOL)shouldRunDraftDemosaic:(id)a3;
- (BOOL)sifrFrameIdMatchesFrameId:(id)a3;
- (CMIWarpStage)warpStage;
- (FigMetalContext)metal;
- (H13FastAWB)awb;
- (H13FastBayerProcShaders)shaders;
- (H13FastBayerProcStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
- (MTLBuffer)flareDetectionResultBuffer;
- (MTLTexture)sifrThumbnailTexture;
- (NSDictionary)processingOptions;
- (SoftISPStaticParameters)staticParameters;
- (id)auxiliaryPixelFormatsForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 compressed:(BOOL)a7;
- (id)createThumbnailTextureArray:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (id)getProcessingOptionsForFrame:(id)a3;
- (id)sharpnessScoreInstance;
- (int)_getWarpConfigForInputFrame:(id)a3 bounds:(id)a4 warpConfig:(CMIWarpConfig *)a5;
- (int)dispatchHRCreateHuemapThumbnailsWithInputTexture:(id)a3 outputTexture:(id)a4 config:(HRConfig *)a5 args:;
- (int)dispatchHRDGnuCorrectionWithInputTexture:(id)a3 outputTextures:(id *)a4 lscMetadata:(id *)a5 config:hrdConfigForFlareCorrection:args:isQuadra:gnuEnabled:;
- (int)dispatchHRDRedBlueFilterWithTextures:(id *)a3 config:(HRDConfig *)a4 args:(id)a5 isQuadra:(BOOL)a6;
- (int)dispatchHRPreprocessDSLUTWithInputTexture:(id)a3 outputTexture:(id)a4 config:(HRConfig *)a5 args:;
- (int)dispatchHRWithInputTextures:(H13FastBayerProcStage *)self outputTexture:(SEL)a2 hrdConfig:(id *)a3 hrConfig:(id)a4 args:(HRDConfig *)a5 isQuadra:(HRConfig *)a6;
- (int)dispatchHuemapGenerationInputTexture:(id)a3 outputTexture:(id)a4 config:(FrontEndProcessorThumbnailConfig *)a5 args:(id)a6 isQuadra:(BOOL)a7;
- (int)dispatchHuemapMotionCompensationWithSifr:(id)a3 ev0:(id)a4 outputTexture:(id)a5 config:(HuemapMotionCompensationConfig *)a6 args:(id)a7 lscMetadata:(id *)a8;
- (int)dispatchHuemapWithInputTexture:(id)a3 outputTexture:(id)a4 config:(HuemapConfig *)a5 args:(id)a6 lscMetadata:(id *)a7;
- (int)initSSC;
- (int)prepareLSCMetadata:(H13FastBayerProcStage *)self withArgs:(SEL)a2 forAWB:(id *)a3;
- (int)processPreHRWithConfig:(id)a3 inputTex:(id)a4 outputTex:(id)a5 lscMetadata:(id *)a6 hrEnabled:wbgEnabled:lscEnabled:outputFrame:awbComputedGains:;
- (int)runAWBWithArgs:(id)a3 awbComputedGOCGains:updatedMetadata:lscGainsTex:inputTex:auxEnabled:hrEnabled:;
- (int)runDraftDemosaicWithArgs:(id)a3 inputTexture:(id)a4 outputFrame:(id)a5 outputMetadata:(id)a6 isQuadra:(BOOL)a7;
- (int)runFlareDetectionWithConfig:(id)a3 inputTex:(id)a4 flareDetectionConfig:(FlareDetectionConfig *)a5 lscMetadata:(id *)a6 outputMetadata:;
- (int)runHOCLBinWithArgs:(id)a3 hoclBinConfig:(HOCLBinConfig *)a4 hoclBinConfigForFlareCorrection:(HOCLBinConfig *)a5 inputTexture:(id)a6;
- (int)runHRWithInputTextures:(H13FastBayerProcStage *)self outputTexture:(SEL)a2 outputMetadata:(id *)a3 isFinalOutput:(id)a4 isQuadra:(id)a5 runHR:(BOOL)a6 args:(BOOL)a7 lscMetadata:(BOOL)a8 awbComputedGains:(id)a9 hrdConfigForFlareCorrection:(id *)a10;
- (int)runHuemapGenerateInputThumbnailWithInputTexture:(id)a3 outputTexture:(id *)a4 lscConfig:(LSCConfig *)a5 isSifr:args:awbComputedGains:isQuadra:;
- (int)runHuemapGenerationWithInputTexture:(id)a3 outputTexture:(id *)a4 lscConfig:(LSCConfig *)a5 args:awbComputedGains:lscMetadata:applyLscToThumbnailsIfNecessary:;
- (int)runHuemapMotionCompensationWithSifrTexture:(id)a3 ev0ThumbnailTexture:(id)a4 outputTexture:(id *)a5 args:(id)a6 lscMetadata:(id *)a7;
- (int)runSSCWithArgs:(SSCConfig *)a3 inputTexture:(id)a4 outputMetadata:(id)a5 firstPixel:(int)a6 isQuadra:(BOOL)a7;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
- (void)setFlareDetectionResultBuffer:(id)a3;
- (void)setProcessingOptions:(id)a3;
- (void)setSifrFrameId:(id)a3;
- (void)setSifrThumbnailTexture:(id)a3;
@end

@implementation H13FastBayerProcStage

- (H13FastBayerProcStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)H13FastBayerProcStage;
  v9 = [(H13FastBayerProcStage *)&v29 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_13;
  }
  if (!v7) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v9->_metal, a3);
  if (!v8) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v10->_staticParameters, a4);
  v11 = [[H13FastBayerProcShaders alloc] initWithMetalContext:v7];
  shaders = v10->_shaders;
  v10->_shaders = v11;

  if (!v10->_shaders) {
    goto LABEL_13;
  }
  v13 = [[H13FastAWB alloc] initWithMetalContext:v7];
  awb = v10->_awb;
  v10->_awb = v13;

  if (!v10->_awb) {
    goto LABEL_13;
  }
  if (!FigGetCFPreferenceNumberWithDefault())
  {
    if ([(H13FastBayerProcStage *)v10 initSSC]) {
      goto LABEL_13;
    }
    id v15 = objc_alloc(MEMORY[0x263F2EE00]);
    v16 = [(FigMetalContext *)v10->_metal commandQueue];
    v17 = [(FigMetalContext *)v10->_metal allocator];
    uint64_t v18 = [v15 initWithOptionalCommandQueue:v16 allocator:v17];
    warpStage = v10->_warpStage;
    v10->_warpStage = (CMIWarpStage *)v18;

    if (!v10->_warpStage) {
      goto LABEL_13;
    }
  }
  v10->_outputDownscaleFactor = 1;
  v20 = [[ChromaticAberrationRecovery alloc] initWithMetalContext:v7];
  car = v10->_car;
  v10->_car = v20;

  if (!v10->_car) {
    goto LABEL_13;
  }
  v22 = [(FigMetalContext *)v10->_metal device];
  uint64_t v23 = [v22 newBufferWithLength:4 options:0];
  flareDetectionResultBuffer = v10->_flareDetectionResultBuffer;
  v10->_flareDetectionResultBuffer = (MTLBuffer *)v23;

  v25 = v10->_flareDetectionResultBuffer;
  if (v25)
  {
    uint64_t v26 = [(MTLBuffer *)v25 contents];
    *(unsigned char *)uint64_t v26 = 0;
    *(_WORD *)(v26 + 2) = 0;
    v27 = v10;
  }
  else
  {
LABEL_13:
    FigDebugAssert3();
    v27 = 0;
  }

  return v27;
}

- (int)initSSC
{
  v2 = [(H13FastBayerProcStage *)self sharpnessScoreInstance];
  if (v2)
  {
    int v3 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v3 = FigSignalErrorAt();
  }

  return v3;
}

- (id)sharpnessScoreInstance
{
  int v3 = objc_getAssociatedObject(self, (const void *)SharpnessScoreInstanceKey);
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F2EDC8]);
    v5 = [(H13FastBayerProcStage *)self metal];
    v6 = [v5 commandQueue];
    int v3 = (void *)[v4 initWithOptionalCommandQueue:v6 kernelWeights:0];

    if (v3)
    {
      objc_setAssociatedObject(self, (const void *)SharpnessScoreInstanceKey, v3, (void *)1);
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v3;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (void)setProcessingOptions:(id)a3
{
}

- (id)createThumbnailTextureArray:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  id v8 = [(H13FastBayerProcStage *)self metal];
  v9 = [v8 allocator];
  v10 = (void *)[v9 newTextureDescriptor];

  if (!v10) {
    goto LABEL_6;
  }
  v11 = [v10 desc];
  [v11 setTextureType:3];

  v12 = [v10 desc];
  [v12 setWidth:a4];

  v13 = [v10 desc];
  [v13 setHeight:a5];

  v14 = [v10 desc];
  [v14 setArrayLength:4];

  id v15 = [v10 desc];
  [v15 setUsage:3];

  v16 = [v10 desc];
  [v16 setPixelFormat:93];

  [v10 setLabel:0];
  v17 = [(H13FastBayerProcStage *)self metal];
  uint64_t v18 = [v17 allocator];
  v19 = (void *)[v18 newTextureWithDescriptor:v10];

  if (!v19)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v19 = 0;
  }

  return v19;
}

- (int)dispatchHuemapGenerationInputTexture:(id)a3 outputTexture:(id)a4 config:(FrontEndProcessorThumbnailConfig *)a5 args:(id)a6 isQuadra:(BOOL)a7
{
  BOOL v8 = a7;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v32 = a6;
  id v15 = [(H13FastBayerProcStage *)self metal];
  v16 = [(H13FastBayerProcStage *)self shaders];
  v46[0] = 0;
  id v17 = v13;
  v46[1] = v17;
  int64x2_t v47 = vdupq_n_s64(1uLL);
  id v18 = v14;
  id v48 = v18;
  long long v49 = xmmword_263480490;
  uint64_t v50 = 0;
  uint64_t v51 = -1;
  uint64_t v35 = 0;
  char v36 = 0;
  uint64_t v37 = 80;
  v38 = a5;
  uint64_t v39 = 0;
  long long v40 = xmmword_263481600;
  char v41 = 0;
  uint64_t v42 = -1;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = -1;
  v19 = [v15 commandBuffer];
  v20 = v19;
  if (!v19)
  {
    uint64_t v31 = v7;
    LODWORD(v30) = 0;
    FigDebugAssert3();
    goto LABEL_13;
  }
  v21 = [v19 computeCommandEncoder];
  if (!v21)
  {
LABEL_13:
    int v26 = FigSignalErrorAt();
    v22 = 0;
    goto LABEL_7;
  }
  if (v8) {
    [v16 huemapThumbnailGeneration0Quadra];
  }
  else {
  v22 = [v16 huemapThumbnailGeneration0];
  }
  [v21 setComputePipelineState:v22];
  +[SoftISPArgsTools setAllArgumentsOnEncoder:v21 textures:v46 argIdentifiers:&v35];
  unint64_t v23 = [v22 threadExecutionWidth];
  unint64_t v24 = [v22 maxTotalThreadsPerThreadgroup];
  v34[0] = (unint64_t)[v18 width] >> 1;
  v34[1] = (unint64_t)[v18 height] >> 1;
  v34[2] = 1;
  v33[0] = v23;
  v33[1] = v24 / v23;
  v33[2] = 1;
  [v21 dispatchThreads:v34 threadsPerThreadgroup:v33];
  [v21 endEncoding];

  v25 = [v32 outputFrame];
  [v25 addCompletionHandlerToCommandBuffer:v20];

  [v15 commit];
  int v26 = 0;
LABEL_7:
  objc_msgSend(0, "endEncoding", v30, v31);
  for (uint64_t i = 80; i != -16; i -= 48)
    objc_destroyWeak((id *)((char *)&v35 + i));
  for (uint64_t j = 7; j != -2; j -= 3)

  return v26;
}

- (int)runHuemapGenerateInputThumbnailWithInputTexture:(id)a3 outputTexture:(id *)a4 lscConfig:(LSCConfig *)a5 isSifr:args:awbComputedGains:isQuadra:
{
  unsigned int v9 = v7;
  double v41 = v8;
  v10 = v6;
  int v11 = v5;
  id v15 = a3;
  id v16 = v10;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  memset(v43, 0, sizeof(v43));
  if (!a5)
  {
    FigDebugAssert3();
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    int v28 = FigSignalErrorAt();
    int v26 = 0;
    id v17 = 0;
LABEL_17:
    uint64_t v35 = 0;
    unint64_t v23 = 0;
    goto LABEL_13;
  }
  id v17 = v16;
  id v18 = [v17 inputFrame];

  if (!v18)
  {
    int v28 = FigSignalErrorAt();
    int v26 = 0;
    goto LABEL_17;
  }
  long long v40 = a4;
  unsigned int v39 = v9;
  v19 = [v17 inputFrame];
  -[SoftISPInputFrame sensorReadoutRect]((uint64_t)v19);
  int8x8_t v21 = v20;

  v22 = [v17 inputFrame];
  unint64_t v23 = [(H13FastBayerProcStage *)self getProcessingOptionsForFrame:v22];

  unint64_t v24 = [v17 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v28 = FigSignalErrorAt();
    int v26 = 0;
LABEL_20:
    uint64_t v35 = 0;
    goto LABEL_13;
  }
  int v26 = [v17 config];
  v27 = [v17 inputFrame];
  int v28 = [v26 getGOCConfigForInputFrame:v27 gocConfig:v43 lscConfig:a5 hrEnabled:1 awbComputedGains:v23 processingOptions:v41];

  if (v28)
  {
    FigDebugAssert3();
    goto LABEL_20;
  }
  uint64_t v42 = v23;
  id v29 = v16;
  id v30 = v15;
  uint64_t v31 = [v17 inputFrame];
  id v32 = [v17 bounds];
  int v28 = [v26 getFrontEndConfigForInputFrame:v31 bounds:v32 frontEndThumbnailConfig:&v44 gocConfig:v43];

  if (v28)
  {
    FigDebugAssert3();
    uint64_t v35 = 0;
    id v15 = v30;
  }
  else
  {
    int8x8_t v33 = vand_s8(v21, (int8x8_t)0xFFFF0000FFFFLL);
    v33.i32[0] /= (unsigned __int16)v45;
    v33.i32[1] /= WORD1(v45);
    int8x8_t v38 = v33;
    v34 = @"EV0";
    if (v11) {
      v34 = @"Sifr";
    }
    uint64_t v35 = [NSString stringWithFormat:@"h13f.bayerProcHuemap%@Thumbnail", v34];
    id v36 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:v35 pixelFormat:23 width:v38.u32[0] height:v38.u32[1] compressed:0];
    *long long v40 = v36;
    id v15 = v30;
    if (v36)
    {
      int v28 = [(H13FastBayerProcStage *)self dispatchHuemapGenerationInputTexture:v30 outputTexture:v36 config:&v44 args:v17 isQuadra:v39];
      id v16 = v29;
      if (v28) {
        FigDebugAssert3();
      }
      goto LABEL_12;
    }
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
  }
  id v16 = v29;
LABEL_12:
  unint64_t v23 = v42;
LABEL_13:

  return v28;
}

- (int)dispatchHuemapMotionCompensationWithSifr:(id)a3 ev0:(id)a4 outputTexture:(id)a5 config:(HuemapMotionCompensationConfig *)a6 args:(id)a7 lscMetadata:(id *)a8
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  long long v46 = [(H13FastBayerProcStage *)self metal];
  id v17 = [(H13FastBayerProcStage *)self shaders];
  id v18 = [v16 inputFrame];
  int v19 = -[SoftISPInputFrame cfaLayout]((uint64_t)v18);

  v71[0] = 0;
  id v44 = v14;
  v71[1] = v44;
  int64x2_t v72 = vdupq_n_s64(1uLL);
  id v20 = v13;
  id v73 = v20;
  long long v74 = xmmword_2634804A0;
  id v21 = v15;
  id v75 = v21;
  int64x2_t v76 = vdupq_n_s64(3uLL);
  if (v19 == 3)
  {
    id v22 = 0;
    unint64_t v23 = (void *)*((void *)a8 + 17);
  }
  else
  {
    id v22 = *((id *)a8 + 17);
    unint64_t v23 = 0;
  }
  id v77 = v22;
  long long v78 = xmmword_2634804C0;
  long long v80 = xmmword_263481600;
  id v79 = v23;
  uint64_t v81 = 0;
  uint64_t v82 = -1;
  unint64_t v24 = [v16 inputFrame];
  __int16 v25 = -[SoftISPInputFrame huemapThumbnailDownscalingFactor]((uint64_t)v24);
  int v26 = [v16 inputFrame];
  __int16 v27 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v26) * v25;

  v49[1] = v27;
  v49[0] = v27;
  uint64_t v50 = 0;
  char v51 = 0;
  uint64_t v52 = 80;
  v53 = a6;
  uint64_t v54 = 0;
  int64x2_t v55 = vdupq_n_s64(1uLL);
  char v56 = 0;
  uint64_t v57 = 128;
  v58 = a8;
  uint64_t v59 = 0;
  long long v60 = xmmword_2634804A0;
  char v61 = 0;
  uint64_t v62 = 4;
  v63 = v49;
  uint64_t v64 = 0;
  long long v65 = xmmword_263481600;
  char v66 = 0;
  uint64_t v67 = -1;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = -1;
  int v28 = [v46 commandBuffer];
  id v29 = v28;
  if (!v28)
  {
    uint64_t v42 = v43;
    LODWORD(v41) = 0;
    FigDebugAssert3();
    goto LABEL_13;
  }
  id v30 = [v28 computeCommandEncoder];
  if (!v30)
  {
LABEL_13:
    int v37 = FigSignalErrorAt();
    goto LABEL_7;
  }
  uint64_t v31 = [v17 huemapMotionCompensation];
  [v30 setComputePipelineState:v31];

  +[SoftISPArgsTools setAllArgumentsOnEncoder:v30 textures:v71 argIdentifiers:&v50];
  id v32 = [v17 huemapMotionCompensation];
  unint64_t v33 = [v32 threadExecutionWidth];

  v34 = [v17 huemapMotionCompensation];
  unint64_t v35 = [v34 maxTotalThreadsPerThreadgroup];

  v48[0] = (unint64_t)[v21 width] >> 1;
  v48[1] = (unint64_t)[v21 height] >> 1;
  v48[2] = 1;
  v47[0] = v33;
  v47[1] = v35 / v33;
  v47[2] = 1;
  [v30 dispatchThreads:v48 threadsPerThreadgroup:v47];
  [v30 endEncoding];

  id v36 = [v16 outputFrame];
  [v36 addCompletionHandlerToCommandBuffer:v29];

  [v46 commit];
  int v37 = 0;
LABEL_7:
  objc_msgSend(0, "endEncoding", v41, v42);
  for (uint64_t i = 176; i != -16; i -= 48)
    objc_destroyWeak((id *)((char *)&v50 + i));
  for (uint64_t j = 16; j != -2; j -= 3)

  return v37;
}

- (int)runHuemapMotionCompensationWithSifrTexture:(id)a3 ev0ThumbnailTexture:(id)a4 outputTexture:(id *)a5 args:(id)a6 lscMetadata:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  memset(v23, 0, sizeof(v23));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    id v16 = [v15 config];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v18 = [v15 config];
      int v19 = [v15 inputFrame];
      int v20 = [v18 getHuemapMotionCompensationConfigForInputFrame:v19 huemapMotionCompensationConfig:v23];

      if (v20) {
        goto LABEL_11;
      }
      -[H13FastBayerProcStage createIntermediateMetalTexture:pixelFormat:width:height:compressed:](self, "createIntermediateMetalTexture:pixelFormat:width:height:compressed:", @"h13f.BayerProc.mcThumbnail", 23, [v12 width], objc_msgSend(v12, "height"), 0);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      *a5 = v21;
      if (!v21)
      {
        FigDebugAssert3();
        int v20 = FigSignalErrorAt();
        goto LABEL_6;
      }
      int v20 = [(H13FastBayerProcStage *)self dispatchHuemapMotionCompensationWithSifr:v12 ev0:v13 outputTexture:v21 config:v23 args:v15 lscMetadata:a7];
      if (v20) {
LABEL_11:
      }
        FigDebugAssert3();
    }
    else
    {
      int v20 = FigSignalErrorAt();
      id v18 = 0;
    }
  }
  else
  {
    int v20 = FigSignalErrorAt();
    id v18 = 0;
    id v15 = 0;
  }
LABEL_6:

  return v20;
}

- (int)dispatchHuemapWithInputTexture:(id)a3 outputTexture:(id)a4 config:(HuemapConfig *)a5 args:(id)a6 lscMetadata:(id *)a7
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v42 = [(H13FastBayerProcStage *)self metal];
  id v15 = [(H13FastBayerProcStage *)self shaders];
  id v16 = [v14 inputFrame];
  int v17 = -[SoftISPInputFrame cfaLayout]((uint64_t)v16);

  v67[0] = 0;
  id v18 = v12;
  v67[1] = v18;
  int64x2_t v68 = vdupq_n_s64(1uLL);
  id v19 = v13;
  id v69 = v19;
  long long v70 = xmmword_263481E30;
  if (v17 == 3)
  {
    id v20 = 0;
    id v21 = (void *)*((void *)a7 + 17);
  }
  else
  {
    id v20 = *((id *)a7 + 17);
    id v21 = 0;
  }
  id v71 = v20;
  long long v72 = xmmword_2634804B0;
  id v73 = v21;
  long long v74 = xmmword_263481600;
  uint64_t v75 = 0;
  uint64_t v76 = -1;
  id v22 = [v14 inputFrame];
  __int16 v23 = -[SoftISPInputFrame huemapThumbnailDownscalingFactor]((uint64_t)v22);
  unint64_t v24 = [v14 inputFrame];
  __int16 v25 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v24) * v23;

  v45[1] = v25;
  v45[0] = v25;
  uint64_t v46 = 0;
  char v47 = 0;
  uint64_t v48 = 48;
  long long v49 = a5;
  uint64_t v50 = 0;
  int64x2_t v51 = vdupq_n_s64(1uLL);
  char v52 = 0;
  uint64_t v53 = 128;
  uint64_t v54 = a7;
  uint64_t v55 = 0;
  long long v56 = xmmword_2634804A0;
  char v57 = 0;
  uint64_t v58 = 4;
  uint64_t v59 = v45;
  uint64_t v60 = 0;
  long long v61 = xmmword_263481600;
  char v62 = 0;
  uint64_t v63 = -1;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = -1;
  int v26 = [v42 commandBuffer];
  __int16 v27 = v26;
  if (!v26)
  {
    uint64_t v40 = v41;
    LODWORD(v39) = 0;
    FigDebugAssert3();
    goto LABEL_13;
  }
  int v28 = [v26 computeCommandEncoder];
  if (!v28)
  {
LABEL_13:
    int v35 = FigSignalErrorAt();
    goto LABEL_7;
  }
  id v29 = [v15 huemap];
  [v28 setComputePipelineState:v29];

  +[SoftISPArgsTools setAllArgumentsOnEncoder:v28 textures:v67 argIdentifiers:&v46];
  id v30 = [v15 huemap];
  unint64_t v31 = [v30 threadExecutionWidth];

  id v32 = [v15 huemap];
  unint64_t v33 = [v32 maxTotalThreadsPerThreadgroup];

  v44[0] = [v19 width];
  v44[1] = [v19 height];
  v44[2] = 1;
  v43[0] = v31;
  v43[1] = v33 / v31;
  v43[2] = 1;
  [v28 dispatchThreads:v44 threadsPerThreadgroup:v43];
  [v28 endEncoding];

  v34 = [v14 outputFrame];
  [v34 addCompletionHandlerToCommandBuffer:v27];

  [v42 commit];
  int v35 = 0;
LABEL_7:
  objc_msgSend(0, "endEncoding", v39, v40);
  for (uint64_t i = 176; i != -16; i -= 48)
    objc_destroyWeak((id *)((char *)&v46 + i));
  for (uint64_t j = 13; j != -2; j -= 3)

  return v35;
}

- (int)runHuemapGenerationWithInputTexture:(id)a3 outputTexture:(id *)a4 lscConfig:(LSCConfig *)a5 args:awbComputedGains:lscMetadata:applyLscToThumbnailsIfNecessary:
{
  char v9 = v7;
  uint64_t v10 = v6;
  double v29 = v8;
  int v11 = v5;
  id v15 = a3;
  id v16 = v11;
  long long v32 = 0u;
  memset(v31, 0, sizeof(v31));
  memset(v30, 0, sizeof(v30));
  if (!a5)
  {
    FigDebugAssert3();
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    int v24 = FigSignalErrorAt();
    id v20 = 0;
    id v17 = 0;
LABEL_15:
    id v22 = 0;
    goto LABEL_11;
  }
  id v17 = v16;
  id v18 = [v17 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v24 = FigSignalErrorAt();
    id v20 = 0;
    goto LABEL_15;
  }
  id v28 = v16;
  id v20 = [v17 config];
  id v21 = [v17 inputFrame];
  id v22 = [(H13FastBayerProcStage *)self getProcessingOptionsForFrame:v21];

  __int16 v23 = [v17 inputFrame];
  int v24 = [v20 getGOCConfigForInputFrame:v23 gocConfig:v30 lscConfig:a5 hrEnabled:1 awbComputedGains:v22 processingOptions:v29];

  if (v24
    || ([v17 inputFrame],
        __int16 v25 = objc_claimAutoreleasedReturnValue(),
        int v24 = [v20 getHuemapConfigForInputFrame:v25 huemapConfig:v31 gocConfig:v30],
        v25,
        v24))
  {
    FigDebugAssert3();
LABEL_18:
    id v16 = v28;
    goto LABEL_11;
  }
  if ((v9 & 1) == 0) {
    LOBYTE(v32) = 0;
  }
  -[H13FastBayerProcStage createThumbnailTextureArray:width:height:](self, "createThumbnailTextureArray:width:height:", @"h13f.BayerProc.huemap", (unint64_t)[v15 width] >> 1, (unint64_t)objc_msgSend(v15, "height") >> 1);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = v26;
  if (!v26)
  {
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
    goto LABEL_18;
  }
  int v24 = [(H13FastBayerProcStage *)self dispatchHuemapWithInputTexture:v15 outputTexture:v26 config:v31 args:v17 lscMetadata:v10];
  id v16 = v28;
  if (v24) {
    FigDebugAssert3();
  }
LABEL_11:

  return v24;
}

- (int)runSSCWithArgs:(SSCConfig *)a3 inputTexture:(id)a4 outputMetadata:(id)a5 firstPixel:(int)a6 isQuadra:(BOOL)a7
{
  BOOL v52 = a7;
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v56 = a4;
  id v53 = a5;
  double v8 = [v53 objectForKeyedSubscript:*MEMORY[0x263F2F440]];
  uint64_t v9 = *MEMORY[0x263F2F288];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F288]];
  uint64_t v11 = *MEMORY[0x263F2F290];
  id v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F290]];

  uint64_t v55 = v12;
  DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v12, 1uLL);
  uint64_t v54 = v8;
  id v14 = [v8 objectForKeyedSubscript:v9];
  [v14 setObject:DeepCopy forKeyedSubscript:v11];

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = DeepCopy;
  uint64_t v15 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v58 = *(void *)v70;
    uint64_t v17 = *MEMORY[0x263F2F620];
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v70 != v58) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        char v68 = 0;
        objc_msgSend(v19, "cmi_cgRectForKey:defaultValue:found:", v17, &v68, 0.0, 0.0, 0.0, 0.0);
        if (!v68)
        {
          FigDebugAssert3();
          int v48 = FigSignalErrorAt();

          id v40 = v55;
          id v36 = v56;
          char v47 = v53;
          uint64_t v39 = v54;
          goto LABEL_13;
        }
        float v24 = a3->var2 / 100.0;
        double v25 = (float)(v24 * 0.5);
        double v26 = v21 - v23 * v25;
        double v27 = (float)(v24 + 1.0);
        double v28 = v22 * v27;
        double v29 = v23 * v27;
        v73[0] = @"X";
        id v30 = [NSNumber numberWithDouble:v20 - v22 * v25];
        v74[0] = v30;
        v73[1] = @"Y";
        unint64_t v31 = [NSNumber numberWithDouble:v26];
        v74[1] = v31;
        v73[2] = @"Width";
        long long v32 = [NSNumber numberWithDouble:v28];
        v74[2] = v32;
        v73[3] = @"Height";
        unint64_t v33 = [NSNumber numberWithDouble:v29];
        v74[3] = v33;
        v34 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:4];
        [v19 setObject:v34 forKeyedSubscript:v17];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v35 = objc_alloc(MEMORY[0x263F2ED70]);
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __93__H13FastBayerProcStage_SSC__runSSCWithArgs_inputTexture_outputMetadata_firstPixel_isQuadra___block_invoke;
  v63[3] = &unk_2655C8390;
  id v64 = obj;
  BOOL v67 = v52;
  id v36 = v56;
  id v37 = v56;
  id v65 = v37;
  uint64_t v66 = a3;
  id v38 = obj;
  uint64_t v39 = (void *)[v35 initWithBlock:v63];

  id v40 = [(H13FastBayerProcStage *)self sharpnessScoreInstance];
  if (!v40)
  {
    FigDebugAssert3();
    int v48 = FigSignalErrorAt();
LABEL_16:
    char v47 = v53;
    goto LABEL_13;
  }
  uint64_t v41 = [(H13FastBayerProcStage *)self metal];
  uint64_t v42 = [v41 allocator];
  [v40 setAllocator:v42];

  uint64_t var0 = a3->var0;
  id v62 = 0;
  LODWORD(v42) = [v40 calculateFromRawTexture:v37 andFromRoi:v39 sourceComponent:var0 isQuadra:v52 firstPixel:a6 toResult:&v62];
  id v44 = v62;
  if (v42)
  {
    FigDebugAssert3();
    int v48 = FigSignalErrorAt();

    goto LABEL_16;
  }

  id v45 = objc_alloc(MEMORY[0x263F2ED70]);
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __93__H13FastBayerProcStage_SSC__runSSCWithArgs_inputTexture_outputMetadata_firstPixel_isQuadra___block_invoke_3;
  v60[3] = &unk_2655C83B8;
  id v61 = v44;
  id v40 = v44;
  uint64_t v46 = (void *)[v45 initWithBlock:v60];
  char v47 = v53;
  [v53 setObject:v46 forKeyedSubscript:@"SharpnessScore"];

  int v48 = 0;
LABEL_13:

  return v48;
}

id __93__H13FastBayerProcStage_SSC__runSSCWithArgs_inputTexture_outputMetadata_firstPixel_isQuadra___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v34 = objc_opt_new();
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned char *)(a1 + 56)) {
      int v4 = 4;
    }
    else {
      int v4 = 2;
    }
    int v33 = v4;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v2;
    uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v32 = *(void *)v36;
      uint64_t v7 = *MEMORY[0x263F2F620];
      double v8 = (double)v33;
      if (v3) {
        char v9 = 2;
      }
      else {
        char v9 = 1;
      }
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(obj);
          }
          objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "cmi_cgRectForKey:defaultValue:found:", v7, 0, 0.0, 0.0, 0.0, 0.0);
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;
          int v18 = (int)(v17 * (double)(unint64_t)[*(id *)(a1 + 40) width] / v8);
          unint64_t v19 = [*(id *)(a1 + 40) height];
          int v20 = (int)(v14 * (double)(unint64_t)[*(id *)(a1 + 40) width] / v8);
          unint64_t v21 = [*(id *)(a1 + 40) height];
          int v22 = v18 & ~(v18 >> 31);
          if ((unint64_t)[*(id *)(a1 + 40) width] >> v9 < v22 + v20) {
            int v20 = (int)[*(id *)(a1 + 40) width] / v33 - v22;
          }
          int v23 = (int)(v16 * (double)v21 / v8);
          int v24 = (int)(v12 * (double)v19 / v8) & ~((int)(v12 * (double)v19 / v8) >> 31);
          if ((unint64_t)[*(id *)(a1 + 40) height] >> v9 < v24 + v23) {
            int v23 = (int)[*(id *)(a1 + 40) height] / v33 - v24;
          }
          v42.origin.x = (double)v22;
          v42.origin.y = (double)v24;
          v42.size.width = (double)v20;
          v42.size.height = (double)v23;
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v42);
          [v34 addObject:DictionaryRepresentation];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v6);
    }
  }
  double v26 = [v34 sortedArrayUsingComparator:&__block_literal_global_20];
  unint64_t v27 = [v26 count];
  unint64_t v28 = *(int *)(*(void *)(a1 + 48) + 4);
  if (v27 < v28) {
    unint64_t v28 = [v26 count];
  }
  double v29 = objc_msgSend(v26, "subarrayWithRange:", 0, v28);

  return v29;
}

BOOL __93__H13FastBayerProcStage_SSC__runSSCWithArgs_inputTexture_outputMetadata_firstPixel_isQuadra___block_invoke_2(uint64_t a1, const __CFDictionary *a2, void *a3)
{
  memset(&rect, 0, sizeof(rect));
  memset(&v6, 0, sizeof(v6));
  CFDictionaryRef v4 = a3;
  CGRectMakeWithDictionaryRepresentation(a2, &rect);
  CGRectMakeWithDictionaryRepresentation(v4, &v6);

  return (int)(rect.size.width * rect.size.height) < (int)(v6.size.width * v6.size.height);
}

id __93__H13FastBayerProcStage_SSC__runSSCWithArgs_inputTexture_outputMetadata_firstPixel_isQuadra___block_invoke_3(uint64_t a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"ImageScore";
  v2 = NSNumber;
  [*(id *)(a1 + 32) fullImageScore];
  int v3 = objc_msgSend(v2, "numberWithFloat:");
  v7[1] = @"FaceScores";
  v8[0] = v3;
  CFDictionaryRef v4 = [*(id *)(a1 + 32) facesScores];
  v8[1] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (BOOL)shouldRunDraftDemosaic:(id)a3
{
  id v4 = a3;
  char v16 = 0;
  uint64_t v5 = -[SoftISPInputFrame metadata]((uint64_t)v4);
  if (v5)
  {
    CGRect v6 = [(H13FastBayerProcStage *)self staticParameters];
    uint64_t v7 = [v6 tuningParametersForInputFrameMetadata:v5 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v4)];

    if (!v7) {
      FigSignalErrorAt();
    }
    double v8 = [v7 objectForKeyedSubscript:@"DraftDemosaic"];
    char v9 = v8;
    if (!v8)
    {
      FigSignalErrorAt();
      char v9 = (void *)MEMORY[0x263EFFA78];
    }
    id v10 = v9;

    double v11 = [(H13FastBayerProcStage *)self getProcessingOptionsForFrame:v4];
    double v12 = [v11 objectForKeyedSubscript:@"SoftISPAuxiliaryType"];
    int v13 = [v12 containsObject:&unk_270E98BA8];

    if (v13)
    {
      char v14 = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, &v16);
      if (!v16) {
        FigSignalErrorAt();
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v7 = 0;
    id v10 = 0;
    char v14 = 0;
    double v11 = 0;
  }

  return v14;
}

- (int)runDraftDemosaicWithArgs:(id)a3 inputTexture:(id)a4 outputFrame:(id)a5 outputMetadata:(id)a6 isQuadra:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v71 = a4;
  id v13 = a5;
  id v70 = a6;
  id v79 = 0;
  id v80 = 0;
  memset(v78, 0, sizeof(v78));
  v76[0] = 0;
  v76[1] = 0;
  int v77 = 0;
  char v14 = [v12 config];
  objc_opt_class();
  LOBYTE(a5) = objc_opt_isKindOfClass();

  if ((a5 & 1) == 0)
  {
    int v51 = FigSignalErrorAt();
    goto LABEL_26;
  }
  double v15 = [v12 config];
  char v16 = [v12 bounds];

  if (!v16
    || ([v12 inputFrame], double v17 = objc_claimAutoreleasedReturnValue(), v17, !v17))
  {
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();

    goto LABEL_26;
  }
  long long v69 = v13;
  BOOL v18 = v7;
  unint64_t v19 = [v12 inputFrame];
  $F61E096109CF133FD2477F48C7D0CEE7 v20 = -[H13FastBayerProcStage auxiliaryPixelBufferSizeForAuxiliaryType:inputPixelFormat:width:height:](self, "auxiliaryPixelBufferSizeForAuxiliaryType:inputPixelFormat:width:height:", 1, [v15 inputPixelFormat], objc_msgSend(v15, "maximumOutputDimensions"), (unint64_t)objc_msgSend(v15, "maximumOutputDimensions") >> 32);
  uint64_t var0 = v20.var0.var0;
  if (!v20.var0.var0) {
    goto LABEL_31;
  }
  uint64_t v22 = HIDWORD(*(void *)&v20);
  if (!v20.var0.var1) {
    goto LABEL_31;
  }
  if (((unint64_t)[v15 maximumOutputDimensions] >> 32) / v20.var0.var1 != 2) {
    goto LABEL_32;
  }
  uint64_t v23 = [v69 getAuxiliaryPixelBufferForAuxiliaryType:1];
  if (!v23)
  {
LABEL_31:
    FigDebugAssert3();
LABEL_32:
    int v51 = FigSignalErrorAt();

LABEL_39:
    goto LABEL_25;
  }
  uint64_t v24 = v23;
  id v65 = v15;
  double v25 = [(H13FastBayerProcStage *)self metal];
  double v26 = [v25 bindPixelBufferToMTL2DTexture:v24 pixelFormat:520 usage:65543 plane:0];
  id v80 = v26;

  if (!v26)
  {
    FigDebugAssert3();
LABEL_34:
    int v51 = FigSignalErrorAt();

LABEL_36:
    id v62 = v65;
LABEL_37:

    goto LABEL_25;
  }
  BOOL v27 = [(H13FastBayerProcStage *)self _shouldApplyGDC:v19];
  if (v27)
  {
    id v28 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:@"h13f.draftDEM.intermediateTex" pixelFormat:71 width:var0 height:v22 compressed:0];
    id v79 = v28;
    if (!v28) {
      goto LABEL_34;
    }
  }
  else
  {
    id v28 = v26;
    id v79 = v28;
  }
  uint64_t v66 = v19;
  double v29 = [v12 bounds];
  uint64_t v30 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v29);

  unint64_t v31 = [v12 bounds];
  -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v31);
  int8x8_t v33 = v32;

  v34 = [(H13FastBayerProcStage *)self metal];
  [v34 forceCommit];

  long long v35 = [(H13FastBayerProcStage *)self metal];
  double v15 = [v35 commandBuffer];

  if (!v15)
  {
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();

    goto LABEL_36;
  }
  uint64_t v36 = [v15 computeCommandEncoder];
  if (!v36)
  {
    int v51 = FigSignalErrorAt();

    goto LABEL_39;
  }
  long long v37 = (void *)v36;
  id v64 = v15;
  uint32x2_t v63 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)v30, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
  uint32x2_t v67 = vshr_n_u32((uint32x2_t)vand_s8(v33, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
  long long v38 = [(H13FastBayerProcStage *)self shaders];
  uint64_t v39 = v38;
  unsigned __int16 v40 = v67.i16[0];
  if (v18)
  {
    uint64_t v41 = [v38 draftDemosaicQuadra2x];
    [v37 setComputePipelineState:v41];

    unsigned __int16 v40 = (unsigned __int16)v67.i16[0] >> 1;
    unsigned __int16 v42 = (unsigned __int16)v67.i16[2] >> 1;
    uint64_t v43 = 16;
  }
  else
  {
    id v44 = [v38 draftDemosaicBayer];
    [v37 setComputePipelineState:v44];

    unsigned __int16 v42 = v67.u16[2];
    uint64_t v43 = 32;
  }
  uint64_t v45 = v42;
  v74[1] = v63.i16[2];
  v74[0] = v63.i16[0];
  float v75 = 1.0;
  uint64_t v46 = [v70 objectForKeyedSubscript:*MEMORY[0x263F2F4F8]];
  char v47 = v46;
  if (v46) {
    float v75 = (float)(int)[v46 intValue] * 0.00024414;
  }

  [v37 setTexture:v71 atIndex:0];
  [v37 setTexture:v28 atIndex:1];
  [v37 setBytes:v74 length:8 atIndex:0];
  [v37 setImageblockWidth:32 height:32];
  v73[0] = v43;
  v73[1] = v43;
  v73[2] = 1;
  v72[0] = v40;
  v72[1] = v45;
  v72[2] = 1;
  [v37 dispatchThreads:v72 threadsPerThreadgroup:v73];
  [v37 endEncoding];

  int v48 = v66;
  if (v27)
  {
    long long v49 = [(H13FastBayerProcStage *)self metal];
    [v49 forceCommit];

    uint64_t v50 = [v12 bounds];
    int v51 = [(H13FastBayerProcStage *)self _getWarpConfigForInputFrame:v66 bounds:v50 warpConfig:v76];

    if (v51)
    {
      FigDebugAssert3();

      id v62 = v64;
      goto LABEL_37;
    }
    BOOL v52 = (void *)MEMORY[0x263F2ED78];
    id v53 = [(H13FastBayerProcStage *)self staticParameters];
    uint64_t v54 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v53);
    id v68 = v12;
    uint64_t v55 = [v12 inputFrame];
    id v56 = -[SoftISPInputFrame portType](v55);
    char v57 = [v54 objectForKeyedSubscript:v56];
    uint64_t v58 = -[SoftISPInputFrame metadata]((uint64_t)v66);
    int v51 = [v52 getGDCParams:v78 cameraInfo:v57 metadata:v58];

    if (v51)
    {
      FigDebugAssert3();

      id v12 = v68;
      goto LABEL_25;
    }
    uint64_t v59 = [(H13FastBayerProcStage *)self warpStage];
    [v59 runGDC:v28 outputTex:v26 warpConfig:v76 gdcParams:v78 inverseGDC:0];

    int v48 = v66;
    id v12 = v68;
  }
  uint64_t v60 = [(H13FastBayerProcStage *)self metal];
  [v60 waitForSchedule];

  int v51 = 0;
LABEL_25:
  id v13 = v69;
LABEL_26:
  FigMetalDecRef();
  FigMetalDecRef();

  return v51;
}

- (BOOL)_shouldApplyGDC:(id)a3
{
  id v4 = a3;
  char v14 = 0;
  uint64_t v5 = -[SoftISPInputFrame metadata]((uint64_t)v4);
  CGRect v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F078]];
    LODWORD(v8) = [v7 BOOLValue];

    if (v8)
    {
      char v9 = [(H13FastBayerProcStage *)self staticParameters];
      id v10 = [v9 tuningParametersForInputFrameMetadata:v6 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v4)];

      if (!v10) {
        FigSignalErrorAt();
      }
      double v8 = [v10 objectForKeyedSubscript:@"DraftDemosaic"];
      double v11 = v8;
      if (!v8)
      {
        FigSignalErrorAt();
        double v11 = (void *)MEMORY[0x263EFFA78];
      }
      id v12 = v11;

      LOBYTE(v8) = objc_msgSend(v12, "cmi_BOOLValueForKey:defaultValue:found:", @"ApplyGDC", 0, &v14);
      if (!v14) {
        FigSignalErrorAt();
      }
    }
    else
    {
      id v10 = 0;
      id v12 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    id v10 = 0;
    id v12 = 0;
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (int)_getWarpConfigForInputFrame:(id)a3 bounds:(id)a4 warpConfig:(CMIWarpConfig *)a5
{
  id v7 = a3;
  id v8 = a4;
  char v9 = v8;
  if (v7 && v8 && a5 && (-[SoftISPInputFrame metadata]((uint64_t)v7), (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v11 = (void *)v10;
    uint64_t v12 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v9);
    int8x8_t v24 = vand_s8((int8x8_t)-[SoftISPInputFrame sensorCropRect]((uint64_t)v7), (int8x8_t)0xFFFF0000FFFFLL);
    int32x2_t v13 = (int32x2_t)vand_s8((int8x8_t)vdup_n_s32(-[SoftISPInputFrame quadraBinningFactor]((uint64_t)v7)), (int8x8_t)0xFFFF0000FFFFLL);
    v13.i32[0] = v24.i32[0] / (unsigned __int32)v13.i32[0];
    v13.i32[1] = v24.i32[1] / (unsigned __int32)v13.i32[1];
    uint32x2_t v14 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)vsub_s32((int32x2_t)v12, v13), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    *((_WORD *)a5 + 1) = v14.i16[2];
    *(_WORD *)a5 = v14.i16[0];
    -[SoftISPInputFrame sensorCropRect]((uint64_t)v7);
    uint64_t v25 = v15;
    unsigned int v16 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v7);
    v17.i32[0] = v25 / v16;
    v17.i32[1] = HIDWORD(v25) / v16;
    uint32x2_t v18 = vshr_n_u32((uint32x2_t)vand_s8(v17, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    *((_WORD *)a5 + 3) = v18.i16[2];
    *((_WORD *)a5 + 2) = v18.i16[0];
    uint32x2_t v19 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)-[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v9), (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    *((_WORD *)a5 + 5) = v19.i16[2];
    *((_WORD *)a5 + 4) = v19.i16[0];
    -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v9);
    uint32x2_t v21 = vshr_n_u32((uint32x2_t)vand_s8(v20, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    *((_WORD *)a5 + 9) = v21.i16[2];
    *((_WORD *)a5 + 8) = v21.i16[0];

    int v22 = 0;
  }
  else
  {
    int v22 = FigSignalErrorAt();
  }

  return v22;
}

- (int)dispatchHRDGnuCorrectionWithInputTexture:(id)a3 outputTextures:(id *)a4 lscMetadata:(id *)a5 config:hrdConfigForFlareCorrection:args:isQuadra:gnuEnabled:
{
  id v8 = v7;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = v8;
  int v48 = [(H13FastBayerProcStage *)self metal];
  char v47 = [(H13FastBayerProcStage *)self shaders];
  unsigned int v16 = [v15 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v16);
  unsigned int v46 = v17;

  uint32x2_t v18 = [v15 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v18);
  unint64_t v45 = v19;

  v79[0] = 0;
  id v20 = v14;
  v79[1] = v20;
  int64x2_t v80 = vdupq_n_s64(1uLL);
  id v81 = a4->var0;
  long long v82 = xmmword_263482110;
  id v83 = *((id *)a5 + 17);
  long long v84 = xmmword_2634804B0;
  id v21 = a4->var1;
  long long v86 = xmmword_263480490;
  id v85 = v21;
  uint64_t v87 = 0;
  uint64_t v88 = -1;
  uint64_t v53 = 0;
  char v54 = 0;
  uint64_t v55 = 336;
  uint64_t v56 = v10;
  uint64_t v57 = 0;
  int64x2_t v58 = v80;
  char v59 = 0;
  uint64_t v60 = 128;
  id v61 = a5;
  uint64_t v62 = 0;
  long long v63 = xmmword_2634804A0;
  char v64 = 0;
  uint64_t v65 = 336;
  uint64_t v66 = v9;
  uint64_t v67 = 0;
  long long v68 = xmmword_2634804B0;
  char v69 = 1;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  int v22 = [(H13FastBayerProcStage *)self flareDetectionResultBuffer];
  objc_initWeak(&v72, v22);
  uint64_t v23 = v15;
  long long v73 = xmmword_263481600;
  char v74 = 0;
  uint64_t v75 = -1;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = -1;

  if (!v90 || (v91 & 1) != 0)
  {
    id v28 = [v48 commandBuffer];
    double v26 = v28;
    if (v28)
    {
      uint64_t v25 = [v28 computeCommandEncoder];
      if (v25)
      {
        double v29 = [v48 allocator];
        BOOL v30 = [v29 allocatorType] == 2;

        if (v30) {
          [v25 insertCompressedTextureReinterpretationFlush];
        }
        unint64_t v31 = v46 >> 1;
        if (v90)
        {
          int8x8_t v24 = [v47 hrdGnuCorrectionQuadra];
          v31 >>= 1;
          unint64_t v32 = v45 >> 34;
        }
        else
        {
          int8x8_t v33 = [v47 hrdGnuCorrection];
          int v51 = @"gnuEnabled";
          v34 = [NSNumber numberWithBool:v91];
          BOOL v52 = v34;
          long long v35 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          int8x8_t v24 = [v33 getPipelineStateWithParams:v35];

          unint64_t v32 = v45 >> 33;
        }
        if (!v24)
        {
          LODWORD(v42) = 0;
          FigDebugAssert3();
          int v27 = FigSignalErrorAt();
          int8x8_t v24 = 0;
          objc_msgSend(v25, "endEncoding", v42, v44);
          goto LABEL_14;
        }
        [v25 setComputePipelineState:v24];
        +[SoftISPArgsTools setAllArgumentsOnEncoder:v25 textures:v79 argIdentifiers:&v53];
        unint64_t v36 = [v24 threadExecutionWidth];
        unint64_t v37 = [v24 maxTotalThreadsPerThreadgroup];
        v50[0] = v31;
        v50[1] = v32;
        v50[2] = 1;
        v49[0] = v36;
        v49[1] = v37 / v36;
        _WORD v49[2] = 1;
        [v25 dispatchThreads:v50 threadsPerThreadgroup:v49];
        [v25 endEncoding];

        long long v38 = [v23 outputFrame];
        [v38 addCompletionHandlerToCommandBuffer:v26];

        [v48 commit];
        uint64_t v25 = 0;
        int v27 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v43 = v44;
      LODWORD(v42) = 0;
      FigDebugAssert3();
    }
    int v27 = FigSignalErrorAt();
    int8x8_t v24 = 0;
    uint64_t v25 = 0;
LABEL_13:
    objc_msgSend(0, "endEncoding", v42, v43);
    goto LABEL_14;
  }
  int8x8_t v24 = 0;
  uint64_t v25 = 0;
  double v26 = 0;
  int v27 = 0;
LABEL_14:
  for (uint64_t i = 224; i != -16; i -= 48)
    objc_destroyWeak((id *)((char *)&v53 + i));
  for (uint64_t j = 13; j != -2; j -= 3)

  return v27;
}

- (int)dispatchHRDRedBlueFilterWithTextures:(id *)a3 config:(HRDConfig *)a4 args:(id)a5 isQuadra:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v10 = a5;
  double v11 = [(H13FastBayerProcStage *)self metal];
  uint64_t v12 = [(H13FastBayerProcStage *)self shaders];
  int32x2_t v13 = [v10 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v13);
  unsigned int v15 = v14;

  unsigned int v16 = [v10 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v16);
  unint64_t v18 = v17;

  v52[0] = 0;
  v52[1] = a3->var0;
  int64x2_t v53 = vdupq_n_s64(1uLL);
  id v54 = a3->var1;
  long long v55 = xmmword_2634804A0;
  id v56 = a3->var2;
  long long v57 = xmmword_263482120;
  id v19 = a3->var3;
  long long v59 = xmmword_263480490;
  id v58 = v19;
  uint64_t v60 = 0;
  uint64_t v61 = -1;
  uint64_t v41 = 0;
  char v42 = 0;
  uint64_t v43 = 336;
  uint64_t v44 = a4;
  uint64_t v45 = 0;
  long long v46 = xmmword_263481600;
  char v47 = 0;
  uint64_t v48 = -1;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = -1;
  id v20 = [v12 hrdRedBlueFilter];
  uint64_t v21 = [v20 threadExecutionWidth];

  if (v21 != 32)
  {
    uint64_t v36 = v37;
    LODWORD(v35) = 0;
    FigDebugAssert3();
    double v26 = 0;
    int v34 = 133;
LABEL_18:
    int v30 = v34 | 0xFFFEE002;
    goto LABEL_11;
  }
  int v22 = [v12 hrdRedBlueFilter];
  unint64_t v23 = [v22 maxTotalThreadsPerThreadgroup];

  if (v23 <= 0x3FF)
  {
    uint64_t v36 = v37;
    LODWORD(v35) = 0;
    FigDebugAssert3();
    double v26 = 0;
    int v34 = 132;
    goto LABEL_18;
  }
  id var3 = a3->var3;
  if (var3 && var3 == a3->var0)
  {
    uint64_t v36 = v37;
    LODWORD(v35) = 0;
    FigDebugAssert3();
    double v26 = 0;
    int v30 = -73726;
  }
  else
  {
    uint64_t v25 = [v11 commandBuffer];
    double v26 = v25;
    if (v25)
    {
      int v27 = [v25 computeCommandEncoder];
      if (v27)
      {
        if (v6) {
          [v12 hrdRedBlueFilterQuadra];
        }
        else {
        id v28 = [v12 hrdRedBlueFilter];
        }
        [v27 setComputePipelineState:v28];

        +[SoftISPArgsTools setAllArgumentsOnEncoder:v27 textures:v52 argIdentifiers:&v41];
        v40[0] = ((unint64_t)(v15 >> 1) + 31) >> 5;
        v40[1] = ((v18 >> 33) + 31) >> 5;
        v40[2] = 1;
        int64x2_t v38 = vdupq_n_s64(0x20uLL);
        uint64_t v39 = 1;
        [v27 dispatchThreadgroups:v40 threadsPerThreadgroup:&v38];
        [v27 endEncoding];

        double v29 = [v10 outputFrame];
        [v29 addCompletionHandlerToCommandBuffer:v26];

        [v11 commit];
        int v30 = 0;
      }
      else
      {
        int v30 = FigSignalErrorAt();
      }
    }
    else
    {
      uint64_t v36 = v37;
      LODWORD(v35) = 0;
      FigDebugAssert3();
      int v30 = FigSignalErrorAt();
      double v26 = 0;
    }
  }
LABEL_11:
  objc_msgSend(0, "endEncoding", v35, v36);
  for (uint64_t i = 80; i != -16; i -= 48)
    objc_destroyWeak((id *)((char *)&v41 + i));
  for (uint64_t j = 13; j != -2; j -= 3)

  return v30;
}

- (int)dispatchHRPreprocessDSLUTWithInputTexture:(id)a3 outputTexture:(id)a4 config:(HRConfig *)a5 args:
{
  id v7 = v5;
  id v11 = a3;
  id v12 = a4;
  id v13 = v7;
  unsigned int v14 = [(H13FastBayerProcStage *)self metal];
  unsigned int v15 = [(H13FastBayerProcStage *)self shaders];
  unsigned int v16 = [v14 commandBuffer];
  unint64_t v17 = v16;
  if (!v16)
  {
    uint64_t v29 = v6;
    LODWORD(v28) = 0;
    FigDebugAssert3();
    goto LABEL_6;
  }
  uint64_t v18 = [v16 computeCommandEncoder];
  if (!v18)
  {
LABEL_6:
    int v26 = FigSignalErrorAt();
    goto LABEL_4;
  }
  id v19 = (void *)v18;
  id v20 = [v15 hrPreprocessDSLUT];
  [v19 setComputePipelineState:v20];

  [v19 setTexture:v11 atIndex:5];
  [v19 setTexture:v12 atIndex:6];
  [v19 setBytes:a5 length:256 atIndex:0];
  uint64_t v21 = [v15 hrPreprocessDSLUT];
  unint64_t v22 = [v21 threadExecutionWidth];

  unint64_t v23 = [v15 hrPreprocessDSLUT];
  unint64_t v24 = [v23 maxTotalThreadsPerThreadgroup] / v22;

  v31[0] = [v12 width];
  v31[1] = [v12 height];
  _OWORD v31[2] = 1;
  v30[0] = v22;
  v30[1] = v24;
  v30[2] = 1;
  [v19 dispatchThreads:v31 threadsPerThreadgroup:v30];
  [v19 endEncoding];

  uint64_t v25 = [v13 outputFrame];
  [v25 addCompletionHandlerToCommandBuffer:v17];

  [v14 commit];
  int v26 = 0;
LABEL_4:
  objc_msgSend(0, "endEncoding", v28, v29);

  return v26;
}

- (int)dispatchHRCreateHuemapThumbnailsWithInputTexture:(id)a3 outputTexture:(id)a4 config:(HRConfig *)a5 args:
{
  id v7 = v5;
  id v11 = a3;
  id v12 = a4;
  id v13 = v7;
  unsigned int v14 = [(H13FastBayerProcStage *)self metal];
  unsigned int v15 = [(H13FastBayerProcStage *)self shaders];
  unsigned int v16 = [v14 commandBuffer];
  unint64_t v17 = v16;
  if (!v16)
  {
    uint64_t v29 = v6;
    LODWORD(v28) = 0;
    FigDebugAssert3();
    goto LABEL_6;
  }
  uint64_t v18 = [v16 computeCommandEncoder];
  if (!v18)
  {
LABEL_6:
    int v26 = FigSignalErrorAt();
    goto LABEL_4;
  }
  id v19 = (void *)v18;
  id v20 = [v15 hrGenerateHuemapThumbnails];
  [v19 setComputePipelineState:v20];

  [v19 setTexture:v11 atIndex:7];
  [v19 setTexture:v12 atIndex:8];
  [v19 setBytes:a5 length:256 atIndex:0];
  uint64_t v21 = [v15 hrGenerateHuemapThumbnails];
  unint64_t v22 = [v21 threadExecutionWidth];

  unint64_t v23 = [v15 hrGenerateHuemapThumbnails];
  unint64_t v24 = [v23 maxTotalThreadsPerThreadgroup] / v22;

  v31[0] = [v12 width];
  v31[1] = [v12 height];
  _OWORD v31[2] = 1;
  v30[0] = v22;
  v30[1] = v24;
  v30[2] = 1;
  [v19 dispatchThreads:v31 threadsPerThreadgroup:v30];
  [v19 endEncoding];

  uint64_t v25 = [v13 outputFrame];
  [v25 addCompletionHandlerToCommandBuffer:v17];

  [v14 commit];
  int v26 = 0;
LABEL_4:
  objc_msgSend(0, "endEncoding", v28, v29);

  return v26;
}

- (int)dispatchHRWithInputTextures:(H13FastBayerProcStage *)self outputTexture:(SEL)a2 hrdConfig:(id *)a3 hrConfig:(id)a4 args:(HRDConfig *)a5 isQuadra:(HRConfig *)a6
{
  int v8 = v7;
  uint64_t v9 = v6;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = v9;
  int64x2_t v38 = [(H13FastBayerProcStage *)self metal];
  uint64_t v37 = [(H13FastBayerProcStage *)self shaders];
  unsigned int v16 = [v15 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v16);
  unint64_t v18 = v17;

  v57[0] = 1;
  v57[1] = a3->var0;
  long long v58 = xmmword_2634804A0;
  id v59 = a3->var1;
  long long v60 = xmmword_263482130;
  id v61 = a3->var2;
  long long v62 = xmmword_263482140;
  id v63 = a3->var3;
  long long v64 = xmmword_263482150;
  id v65 = a3->var4;
  long long v66 = xmmword_263482160;
  id v67 = a3->var5;
  long long v68 = xmmword_263482170;
  id v69 = a3->var6;
  long long v70 = xmmword_263482180;
  id v71 = a3->var7;
  long long v72 = xmmword_263482190;
  id v73 = a3->var8;
  long long v74 = xmmword_2634821A0;
  id v75 = a3->var9;
  long long v76 = xmmword_2634821B0;
  id v19 = v14;
  id v77 = v19;
  long long v78 = xmmword_263480490;
  uint64_t v79 = 0;
  uint64_t v80 = -1;
  uint64_t v41 = 0;
  char v42 = 0;
  uint64_t v43 = 336;
  uint64_t v44 = a5;
  uint64_t v45 = 0;
  int64x2_t v46 = vdupq_n_s64(1uLL);
  char v47 = 0;
  uint64_t v48 = 256;
  uint64_t v49 = a6;
  uint64_t v50 = 0;
  long long v51 = xmmword_263481600;
  char v52 = 0;
  uint64_t v53 = -1;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = -1;
  if (v8)
  {
    switch(*((_WORD *)a6 + 10))
    {
      case 0:
        uint64_t v20 = objc_msgSend(v37, "hrHighlightRecoveryQuadra_FirstPixGR");
        goto LABEL_12;
      case 1:
        uint64_t v20 = objc_msgSend(v37, "hrHighlightRecoveryQuadra_FirstPixR");
        goto LABEL_12;
      case 2:
        uint64_t v20 = objc_msgSend(v37, "hrHighlightRecoveryQuadra_FirstPixB");
        goto LABEL_12;
      case 3:
        uint64_t v20 = objc_msgSend(v37, "hrHighlightRecoveryQuadra_FirstPixGB");
        goto LABEL_12;
      default:
        goto LABEL_19;
    }
  }
  switch(*((_WORD *)a6 + 10))
  {
    case 0:
      uint64_t v20 = objc_msgSend(v37, "hrHighlightRecovery_FirstPixGR");
      goto LABEL_12;
    case 1:
      uint64_t v20 = objc_msgSend(v37, "hrHighlightRecovery_FirstPixR");
      goto LABEL_12;
    case 2:
      uint64_t v20 = objc_msgSend(v37, "hrHighlightRecovery_FirstPixB");
      goto LABEL_12;
    case 3:
      uint64_t v20 = objc_msgSend(v37, "hrHighlightRecovery_FirstPixGB");
LABEL_12:
      uint64_t v21 = (void *)v20;
      if (!v20) {
        goto LABEL_19;
      }
      unint64_t v22 = [v38 commandBuffer];
      unint64_t v23 = v22;
      if (v22)
      {
        unint64_t v24 = [v22 computeCommandEncoder];
        uint64_t v25 = v24;
        if (v24)
        {
          [v24 setComputePipelineState:v21];
          +[SoftISPArgsTools setAllArgumentsOnEncoder:v25 textures:v57 argIdentifiers:&v41];
          unint64_t v26 = [v21 threadExecutionWidth];
          unint64_t v27 = [v21 maxTotalThreadsPerThreadgroup];
          if (v8) {
            char v28 = 2;
          }
          else {
            char v28 = 1;
          }
          v40[0] = (unint64_t)v18 >> v28;
          v40[1] = HIDWORD(v18) >> v28;
          v40[2] = 1;
          v39[0] = v26;
          v39[1] = v27 / v26;
          v39[2] = 1;
          [v25 dispatchThreads:v40 threadsPerThreadgroup:v39];
          [v25 endEncoding];

          uint64_t v29 = [v15 outputFrame];
          [v29 addCompletionHandlerToCommandBuffer:v23];

          [v38 commit];
          int v30 = 0;
        }
        else
        {
          int v30 = FigSignalErrorAt();
        }
      }
      else
      {
        uint64_t v35 = v36;
        LODWORD(v34) = 0;
        FigDebugAssert3();
        int v30 = FigSignalErrorAt();
LABEL_20:
        unint64_t v23 = 0;
      }
      objc_msgSend(0, "endEncoding", v34, v35);
      for (uint64_t i = 128; i != -16; i -= 48)
        objc_destroyWeak((id *)((char *)&v41 + i));
      for (uint64_t j = 34; j != -2; j -= 3)

      return v30;
    default:
LABEL_19:
      uint64_t v35 = v36;
      LODWORD(v34) = 0;
      FigDebugAssert3();
      int v30 = FigSignalErrorAt();
      uint64_t v21 = 0;
      goto LABEL_20;
  }
}

- (int)runHRWithInputTextures:(H13FastBayerProcStage *)self outputTexture:(SEL)a2 outputMetadata:(id *)a3 isFinalOutput:(id)a4 isQuadra:(id)a5 runHR:(BOOL)a6 args:(BOOL)a7 lscMetadata:(BOOL)a8 awbComputedGains:(id)a9 hrdConfigForFlareCorrection:(id *)a10
{
  double v74 = v10;
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v76 = a4;
  id v77 = a5;
  id v80 = a9;
  memset(v109, 0, 336);
  char v108 = 0;
  obuint64_t j = 0;
  id v107 = 0;
  *(_OWORD *)location = 0u;
  *(_OWORD *)v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  *(_OWORD *)v99 = 0u;
  uint64_t v81 = [(H13FastBayerProcStage *)self metal];
  if (!a10)
  {
    FigDebugAssert3();
    goto LABEL_65;
  }
  id v72 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_65:
    int v27 = FigSignalErrorAt();
    uint64_t v79 = 0;
    id v17 = 0;
LABEL_67:
    long long v82 = 0;
    goto LABEL_63;
  }
  id v17 = v80;
  unint64_t v18 = [v17 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v27 = FigSignalErrorAt();
    uint64_t v79 = 0;
    goto LABEL_67;
  }
  long long v82 = [v17 config];
  uint64_t v20 = [v17 inputFrame];
  uint64_t v79 = [(H13FastBayerProcStage *)self getProcessingOptionsForFrame:v20];

  uint64_t v21 = [v17 inputFrame];

  if (!v21) {
    goto LABEL_102;
  }
  unint64_t v22 = [v17 bounds];

  if (!v22) {
    goto LABEL_102;
  }
  unint64_t v23 = [v17 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v23);
  unint64_t v25 = v24;

  unint64_t v26 = [v17 inputFrame];
  int v27 = [v82 getHRDConfigForInputFrame:v26 processingOptions:v79 hrdConfig:v109 overwriteSubGnuforFlare:0];

  if (v27)
  {
    FigDebugAssert3();
    goto LABEL_63;
  }
  char v28 = [v17 inputFrame];
  int v27 = [v82 getHREnabledForInputFrame:v28 processingOptions:v79 hrEnabled:&v108];

  if (v27)
  {
    FigDebugAssert3();
    goto LABEL_63;
  }
  if (v13)
  {
    uint64_t v29 = [v17 bounds];
    uint64_t v30 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v29);
    uint32x2_t v31 = vshr_n_u32(vsra_n_u32((uint32x2_t)v30, (uint32x2_t)v30, 0x1FuLL), 1uLL);
    WORD3(v109[0]) = v31.i16[2];
    WORD2(v109[0]) = v31.i16[0];
  }
  if (BYTE8(v109[0]) | BYTE9(v109[0]))
  {
    if (v12)
    {
LABEL_15:
      uint64_t v34 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:@"h13f.bayerProcHRDGnuGrGb" pixelFormat:65 width:v25 >> 1 height:v25 >> 33 compressed:1];
      id v35 = obj;
      obuint64_t j = v34;

      uint64_t v36 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:@"h13f.bayerProcHRDGrRBGb" pixelFormat:115 width:v25 >> 1 height:v25 >> 33 compressed:1];
      id v37 = v107;
      id v107 = v36;

      if (!obj || !v107) {
        goto LABEL_101;
      }
      BOOL v32 = 1;
      goto LABEL_20;
    }
    BOOL v32 = 1;
  }
  else
  {
    BOOL v32 = *(unsigned char *)(v110 + 9) != 0;
    if (v12)
    {
      if (!*(unsigned char *)(v110 + 9))
      {
        id v33 = obj;
        obuint64_t j = 0;

        objc_storeStrong(&v107, a3->var2);
        BOOL v32 = 0;
        goto LABEL_20;
      }
      goto LABEL_15;
    }
  }
  int64x2_t v38 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:@"h13f.bayerProcHRDGnuGrGb" pixelFormat:115 width:v25 >> 1 height:v25 >> 33 compressed:1];
  id v39 = obj;
  obuint64_t j = v38;

  if (!obj) {
    goto LABEL_101;
  }
LABEL_20:
  BYTE1(v69) = v32;
  LOBYTE(v69) = v12;
  int v27 = -[H13FastBayerProcStage dispatchHRDGnuCorrectionWithInputTexture:outputTextures:lscMetadata:config:hrdConfigForFlareCorrection:args:isQuadra:gnuEnabled:](self, "dispatchHRDGnuCorrectionWithInputTexture:outputTextures:lscMetadata:config:hrdConfigForFlareCorrection:args:isQuadra:gnuEnabled:", a3->var2, &obj, a10, v109, v110, v17, v69);
  if (v27)
  {
    FigDebugAssert3();
    goto LABEL_63;
  }
  objc_storeStrong(&location[1], obj);
  p_var2 = &v107;
  if (!v12) {
    p_var2 = &a3->var2;
  }
  objc_storeStrong(location, *p_var2);
  if (v11 && !v12)
  {
    uint64_t v41 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:@"h13f.bayerProcHRDRedBlueFilterRB" pixelFormat:65 width:v25 >> 1 height:v25 >> 33 compressed:1];
    id v42 = v105[0];
    v105[0] = v41;

    if (!v105[0]) {
      goto LABEL_101;
    }
  }
  if (v12 && v11)
  {
    uint64_t v43 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:@"h13f.bayerProcHRDRedBlueFilterOut" pixelFormat:115 width:v25 >> 1 height:v25 >> 33 compressed:1];
    id v44 = v105[1];
    v105[1] = v43;

    if (!v105[1])
    {
LABEL_101:
      FigDebugAssert3();
LABEL_102:
      int v27 = FigSignalErrorAt();
      goto LABEL_63;
    }
  }
  else
  {
    objc_storeStrong(&v105[1], v72);
    FigMetalIncRef();
  }
  int v27 = [(H13FastBayerProcStage *)self dispatchHRDRedBlueFilterWithTextures:location config:v109 args:v17 isQuadra:v12];
  if (v27)
  {
    FigDebugAssert3();
    goto LABEL_63;
  }
  if (!v11)
  {
    int v27 = 0;
    goto LABEL_63;
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  float32x4_t v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v45 = [v17 inputFrame];
  int64x2_t v46 = [v17 bounds];
  int v27 = [v82 getHRConfigForInputFrame:v45 bounds:v46 awbComputedGains:a10 lscConfig:&v83 hrConfig:v77 outputMetadata:v74];

  if (v27)
  {
    FigDebugAssert3();
    long long v70 = 0;
    id v71 = 0;
    char v52 = 0;
    id v73 = 0;
    id v75 = 0;
    uint64_t v54 = 0;
    long long v57 = 0;
    long long v60 = 0;
    id v63 = 0;
    goto LABEL_61;
  }
  if (!BYTE13(v83)
    || !BYTE14(v83)
    || !HIBYTE(v83)
    || !(_BYTE)v84
    || !BYTE1(v84)
    || (void)v83 != 1
    || (uint32x4_t v47 = (uint32x4_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3A83126Fu), vabsq_f32(vaddq_f32(v89, (float32x4_t)vdupq_n_s32(0xBEAAAAAB)))), v47.i32[3] = v47.i32[2], (vminvq_u32(v47) & 0x80000000) == 0)|| ([MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:55 width:65 height:5 mipmapped:0], (v71 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    id v71 = 0;
LABEL_78:
    long long v70 = 0;
    char v52 = 0;
    id v75 = 0;
LABEL_79:
    id v73 = 0;
LABEL_80:
    uint64_t v54 = 0;
LABEL_81:
    long long v57 = 0;
LABEL_82:
    long long v60 = 0;
LABEL_83:
    id v63 = 0;
    goto LABEL_61;
  }
  uint64_t v48 = [v81 device];
  id v75 = (void *)[v48 newTextureWithDescriptor:v71];

  if (!v75)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_78;
  }
  uint64_t v49 = [v17 inputFrame];
  int v27 = [v82 loadSoftClipLUTForInputFrame:v49 hrConfig:&v83 toTexture:v75];

  if (v27)
  {
    FigDebugAssert3();
    long long v70 = 0;
    char v52 = 0;
    id v73 = 0;
    uint64_t v54 = 0;
    long long v57 = 0;
    long long v60 = 0;
    id v63 = 0;
    goto LABEL_61;
  }
  long long v70 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:33 height:33 mipmapped:0];
  if (!v70)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    long long v70 = 0;
LABEL_89:
    char v52 = 0;
    goto LABEL_79;
  }
  uint64_t v50 = [v81 device];
  id v73 = (id)[v50 newTextureWithDescriptor:v70];

  if (!v73)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_89;
  }
  long long v51 = [v17 inputFrame];
  int v27 = [v82 loadHPBLUTForInputFrame:v51 toTexture:v73];

  if (v27)
  {
    FigDebugAssert3();
    char v52 = 0;
    uint64_t v54 = 0;
    long long v57 = 0;
    long long v60 = 0;
    id v63 = 0;
    goto LABEL_61;
  }
  char v52 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:25 width:65 height:1 mipmapped:0];
  [v52 setTextureType:0];
  [v52 setUsage:17];
  uint64_t v53 = [v81 device];
  uint64_t v54 = (void *)[v53 newTextureWithDescriptor:v52];

  if (!v54)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_80;
  }
  uint64_t v55 = [v17 inputFrame];
  int v27 = [v82 loadMixClipLUTForInputFrame:v55 toTexture:v54];

  if (v27)
  {
    FigDebugAssert3();
    long long v57 = 0;
    long long v60 = 0;
    id v63 = 0;
    goto LABEL_61;
  }
  [v52 setWidth:17];
  uint64_t v56 = [v81 device];
  long long v57 = (void *)[v56 newTextureWithDescriptor:v52];

  if (!v57)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_81;
  }
  long long v58 = [v17 inputFrame];
  int v27 = [v82 loadRcvLUTForInputFrame:v58 hrConfig:&v83 toTexture:v57];

  if (v27)
  {
    FigDebugAssert3();
    long long v60 = 0;
    id v63 = 0;
    goto LABEL_61;
  }
  [v52 setWidth:129];
  id v59 = [v81 device];
  long long v60 = (void *)[v59 newTextureWithDescriptor:v52];

  if (!v60)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_82;
  }
  id v61 = [v17 inputFrame];
  int v27 = [v82 loadInBlendLUTForInputFrame:v61 hrConfig:&v83 toTexture:v60];

  if (v27)
  {
    FigDebugAssert3();
    id v63 = 0;
    goto LABEL_61;
  }
  [v52 setWidth:129];
  long long v62 = [v81 device];
  id v63 = (void *)[v62 newTextureWithDescriptor:v52];

  if (!v63)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_83;
  }
  long long v64 = [v17 inputFrame];
  int v27 = [v82 loadHPPPInBlendLUTForInputFrame:v64 toTexture:v63];

  if (!v27)
  {
    uint64_t v65 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:@"h13f.bayerProcHRSoftClipLUT" pixelFormat:25 width:65 height:6 compressed:0];
    long long v66 = (void *)v100;
    *(void *)&long long v100 = v65;

    if (!(void)v100)
    {
      FigDebugAssert3();
      int v27 = FigSignalErrorAt();
      goto LABEL_61;
    }
    int v27 = [(H13FastBayerProcStage *)self dispatchHRPreprocessDSLUTWithInputTexture:v75 outputTexture:(void)v100 config:&v83 args:v17];
    if (!v27)
    {
      p_obuint64_t j = &v105[1];
      if (!v12) {
        p_obuint64_t j = &obj;
      }
      objc_storeStrong(v99, *p_obj);
      objc_storeStrong(&v99[1], v105[0]);
      objc_storeStrong((id *)&v103 + 1, a3->var1);
      objc_storeStrong((id *)&v100 + 1, a3->var0);
      objc_storeStrong((id *)&v101, v73);
      objc_storeStrong((id *)&v101 + 1, v54);
      objc_storeStrong((id *)&v102, v57);
      objc_storeStrong((id *)&v102 + 1, v60);
      objc_storeStrong((id *)&v103, v63);
      int v27 = [(H13FastBayerProcStage *)self dispatchHRWithInputTextures:v99 outputTexture:v76 hrdConfig:v109 hrConfig:&v83 args:v17 isQuadra:v12];
      if (!v27) {
        goto LABEL_61;
      }
    }
  }
  FigDebugAssert3();
LABEL_61:

LABEL_63:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  __destructor_8_s0_s8_s16_s24_s32_s40_s48_s56_s64_s72((uint64_t)v99);
  __destructor_8_s0_s8_s16_s24((uint64_t)location);

  return v27;
}

- (int)runHOCLBinWithArgs:(id)a3 hoclBinConfig:(HOCLBinConfig *)a4 hoclBinConfigForFlareCorrection:(HOCLBinConfig *)a5 inputTexture:(id)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  BOOL v13 = [(H13FastBayerProcStage *)self metal];
  id v14 = [(H13FastBayerProcStage *)self shaders];
  v54[0] = 0;
  id v15 = v12;
  v54[1] = v15;
  long long v55 = xmmword_2634821F0;
  uint64_t v56 = 0;
  uint64_t v57 = -1;
  uint64_t v33 = 0;
  char v34 = 0;
  uint64_t v35 = 6;
  uint64_t v36 = a4;
  uint64_t v37 = 0;
  int64x2_t v38 = vdupq_n_s64(1uLL);
  char v39 = 0;
  uint64_t v40 = 6;
  uint64_t v41 = a5;
  uint64_t v42 = 0;
  long long v43 = xmmword_2634804A0;
  char v44 = 1;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  unsigned int v16 = [(H13FastBayerProcStage *)self flareDetectionResultBuffer];
  objc_initWeak(&v47, v16);
  long long v48 = xmmword_263481600;
  char v49 = 0;
  uint64_t v50 = -1;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = -1;

  if (!a4->var0 && !a5->var0)
  {
    unint64_t v18 = 0;
    int v24 = 0;
    goto LABEL_7;
  }
  id v17 = [v13 commandBuffer];
  unint64_t v18 = v17;
  if (!v17)
  {
    uint64_t v29 = v6;
    LODWORD(v28) = 0;
    FigDebugAssert3();
    goto LABEL_14;
  }
  id v19 = [v17 computeCommandEncoder];
  if (!v19)
  {
LABEL_14:
    int v24 = FigSignalErrorAt();
    goto LABEL_6;
  }
  uint64_t v20 = [v14 hoclBin];
  [v19 setComputePipelineState:v20];

  unint64_t v21 = [v15 width];
  unint64_t v22 = [v15 height];
  +[SoftISPArgsTools setAllArgumentsOnEncoder:v19 textures:v54 argIdentifiers:&v33];
  [v19 setImageblockWidth:32 height:32];
  int64x2_t v31 = vdupq_n_s64(0x10uLL);
  uint64_t v32 = 1;
  v30[0] = v21 >> 1;
  v30[1] = v22 >> 1;
  v30[2] = 1;
  [v19 dispatchThreads:v30 threadsPerThreadgroup:&v31];
  [v19 endEncoding];

  unint64_t v23 = [v11 outputFrame];
  [v23 addCompletionHandlerToCommandBuffer:v18];

  [v13 commit];
  int v24 = 0;
LABEL_6:
  objc_msgSend(0, "endEncoding", v28, v29);
LABEL_7:
  for (uint64_t i = 176; i != -16; i -= 48)
    objc_destroyWeak((id *)((char *)&v33 + i));
  for (uint64_t j = 4; j != -2; j -= 3)

  return v24;
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  return 1647719528;
}

- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = [(H13FastBayerProcStage *)self auxiliaryPixelFormatsForInputPixelFormat:*(void *)&a4 outputCompressionLevel:*(void *)&a5];
  if (!v6)
  {
    FigSignalErrorAt();
    goto LABEL_5;
  }
  int v7 = [NSNumber numberWithUnsignedInt:v5];
  int v8 = [v6 objectForKey:v7];

  if (!v8)
  {
LABEL_5:
    unsigned int v11 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = [NSNumber numberWithUnsignedInt:v5];
  double v10 = [v6 objectForKeyedSubscript:v9];
  unsigned int v11 = [v10 unsignedIntValue];

LABEL_6:
  return v11;
}

- (id)auxiliaryPixelFormatsForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = &unk_270E98C20;
  v7[0] = &unk_270E98C38;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  if (a3 == 1) {
    return ($F61E096109CF133FD2477F48C7D0CEE7)((a5 >> 1) | ((unint64_t)(a6 >> 1) << 32));
  }
  else {
    return ($F61E096109CF133FD2477F48C7D0CEE7)0;
  }
}

- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = -[H13FastBayerProcStage auxiliaryPixelFormatsForInputPixelFormat:outputCompressionLevel:](self, "auxiliaryPixelFormatsForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    int v8 = [[H13FastBayerProcConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 auxiliaryPixelFormats:v7];
  }
  else
  {
    FigDebugAssert3();
    int v8 = 0;
  }

  return v8;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  id v3 = a3;
  int v4 = [v3 maximumOutputDimensions];
  uint64_t v5 = (11 * v4 * ((unint64_t)[v3 maximumOutputDimensions] >> 32));
  id v6 = (void *)MEMORY[0x263F2EDC8];
  uint64_t v7 = [v3 maximumOutputDimensions];
  unint64_t v8 = [v3 maximumOutputDimensions];

  return [v6 bytesRequiredForProcessingImageWith:v7 height:HIDWORD(v8)] + v5;
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
  BOOL v13 = [[H13FastBayerProcStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (int)prepareLSCMetadata:(H13FastBayerProcStage *)self withArgs:(SEL)a2 forAWB:(id *)a3
{
  int v5 = v4;
  v53[6] = *MEMORY[0x263EF8340];
  id v8 = v3;
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int v15 = FigSignalErrorAt();
    PixelBuffer = 0;
    id v17 = 0;
    id v11 = 0;
    id v9 = 0;
    goto LABEL_20;
  }
  id v9 = v8;
  id v10 = [v9 inputFrame];
  id v11 = [(H13FastBayerProcStage *)self getProcessingOptionsForFrame:v10];

  if (v5)
  {
    id v12 = [v9 inputFrame];
    BOOL v13 = [v9 bounds];
    id v14 = [v9 config];
    LOBYTE(v46) = 1;
    int v15 = +[LensShadingCorrectionConfig getLSCMetadata:lscMetadata:bounds:stageConfigMode:processingOptions:metalCtx:staticParameters:forAWB:](LensShadingCorrectionConfig, "getLSCMetadata:lscMetadata:bounds:stageConfigMode:processingOptions:metalCtx:staticParameters:forAWB:", v12, a3, v13, [v14 stageConfigMode], v11, self->_metal, self->_staticParameters, v46);

    if (v15) {
      FigDebugAssert3();
    }
    PixelBuffer = 0;
    goto LABEL_7;
  }
  unint64_t v18 = [v9 inputFrame];
  [v18 readLSCMetadata:a3];

  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  if (!PixelBuffer)
  {
    FigDebugAssert3();
    int v15 = FigSignalErrorAt();
LABEL_7:
    id v17 = 0;
    goto LABEL_20;
  }
  int v19 = copyMTLTextureToPixelBuffer(*((void **)a3 + 17), PixelBuffer);
  if (v19)
  {
    int v15 = v19;
    FigDebugAssert3();
    goto LABEL_7;
  }
  uint64_t v20 = [v9 outputFrame];
  [v20 setLscPixelBuffer:PixelBuffer];

  unint64_t v21 = [v9 inputFrame];
  unint64_t v22 = -[SoftISPInputFrame metadata]((uint64_t)v21);
  int v23 = objc_msgSend(v22, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F4E0], 0, 0);

  id v17 = 0;
  int v50 = v23;
  if (v23 == 1)
  {
    id v17 = (__CVBuffer *)CreatePixelBuffer();
    if (!v17)
    {
      FigDebugAssert3();
      int v15 = FigSignalErrorAt();
      goto LABEL_20;
    }
    int v24 = copyMTLTextureToPixelBuffer(*((void **)a3 + 18), v17);
    if (v24)
    {
      int v15 = v24;
      FigDebugAssert3();
      goto LABEL_20;
    }
    unint64_t v25 = [v9 outputFrame];
    [v25 setFlashLSCPixelBuffer:v17];
  }
  id v47 = v17;
  long long v48 = PixelBuffer;
  uint64_t v51 = v11;
  id v49 = v8;
  unint64_t v26 = [v9 inputFrame];
  int v27 = -[SoftISPInputFrame processingOptions]((uint64_t)v26);
  int v28 = objc_msgSend(v27, "cmi_BOOLValueForKey:defaultValue:found:", @"Aux", 0, 0);

  v52[0] = *MEMORY[0x263F2F800];
  uint64_t v29 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)a3 + 6)];
  v53[0] = v29;
  v52[1] = *MEMORY[0x263F2F7E0];
  uint64_t v30 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)a3 + 7)];
  v53[1] = v30;
  void v52[2] = *MEMORY[0x263F2F7E8];
  *(float *)&double v31 = 1.0 / *((float *)a3 + 4);
  uint64_t v32 = [NSNumber numberWithFloat:v31];
  v53[2] = v32;
  v52[3] = *MEMORY[0x263F2F7F8];
  double v33 = *((double *)a3 + 3);
  LOWORD(v34) = *((_WORD *)a3 + 4);
  *(float *)&double v33 = (float)(1.0 / *(float *)&v33) / (float)v34;
  uint64_t v35 = [NSNumber numberWithFloat:v33];
  v53[3] = v35;
  v52[4] = *MEMORY[0x263F2F7F0];
  LOWORD(v36) = *((_WORD *)a3 + 5);
  *(float *)&double v37 = (float)(1.0 / *((float *)a3 + 7)) / (float)v36;
  int64x2_t v38 = [NSNumber numberWithFloat:v37];
  v53[4] = v38;
  v52[5] = *MEMORY[0x263F2F808];
  char v39 = [NSNumber numberWithInt:v28 ^ 1u];
  v53[5] = v39;
  uint64_t v40 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:6];
  uint64_t v41 = (void *)[v40 mutableCopy];

  if (v41)
  {
    id v8 = v49;
    if (v50 == 1 && *((void *)a3 + 18))
    {
      LODWORD(v42) = *((_DWORD *)a3 + 10);
      long long v43 = [NSNumber numberWithFloat:v42];
      [v41 setObject:v43 forKeyedSubscript:*MEMORY[0x263F2F7D8]];
    }
    char v44 = [v9 outputFrame];
    [v44 setLscParameters:v41];
  }
  else
  {
    FigDebugAssert3();
    id v8 = v49;
  }
  id v17 = v47;
  PixelBuffer = v48;

  int v15 = 0;
  id v11 = v51;
LABEL_20:
  CVPixelBufferRelease(PixelBuffer);
  CVPixelBufferRelease(v17);

  return v15;
}

- (int)processPreHRWithConfig:(id)a3 inputTex:(id)a4 outputTex:(id)a5 lscMetadata:(id *)a6 hrEnabled:wbgEnabled:lscEnabled:outputFrame:awbComputedGains:
{
  double v62 = v9;
  char v10 = v7;
  uint64_t v11 = v6;
  v84[1] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v66 = a4;
  id v16 = a5;
  id v17 = v86;
  bzero(v80, 0x370uLL);
  long long v79 = 0u;
  memset(v78, 0, sizeof(v78));
  if (!v15)
  {
    uint64_t v56 = v8;
    LODWORD(v55) = 0;
    FigDebugAssert3();
    long long v64 = 0;
    unsigned int v36 = 0;
    double v31 = 0;
    uint64_t v52 = 0;
    uint64_t v20 = 0;
    int v23 = 0;
    unint64_t v21 = 0;
    int v53 = 0;
    goto LABEL_20;
  }
  unint64_t v18 = [v15 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v53 = FigSignalErrorAt();
    long long v64 = 0;
    unsigned int v36 = 0;
    double v31 = 0;
    uint64_t v52 = 0;
    uint64_t v20 = 0;
    int v23 = 0;
    unint64_t v21 = 0;
    goto LABEL_20;
  }
  uint64_t v20 = [v15 config];
  unint64_t v21 = [v15 inputFrame];
  if (!v21)
  {
    int v53 = FigSignalErrorAt();
    long long v64 = 0;
    unsigned int v36 = 0;
    double v31 = 0;
    uint64_t v52 = 0;
    int v23 = 0;
    goto LABEL_20;
  }
  uint64_t v22 = [v15 bounds];
  int v23 = (void *)v22;
  if (!v22)
  {
    int v53 = FigSignalErrorAt();
    long long v64 = 0;
LABEL_31:
    unsigned int v36 = 0;
    double v31 = 0;
    uint64_t v52 = 0;
    goto LABEL_20;
  }
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels](v22);
  uint64_t v61 = v24;
  int v25 = -[SoftISPInputFrame cfaLayout]((uint64_t)v21);
  uint64_t v26 = [(H13FastBayerProcStage *)self getProcessingOptionsForFrame:v21];
  int v65 = v25;
  long long v64 = (void *)v26;
  if (v25 != 3)
  {
    int v27 = [v20 getRNFConfigForInputFrame:v21 bounds:v23 processingOptions:v26 rnfConfig:v80];
    uint64_t v26 = (uint64_t)v64;
    if (v27)
    {
      int v53 = v27;
      uint64_t v56 = v8;
      LODWORD(v55) = v27;
      goto LABEL_30;
    }
  }
  int v28 = [v20 getGOCConfigForInputFrame:v21 gocConfig:v78 lscConfig:a6 hrEnabled:v11 awbComputedGains:v26 processingOptions:v62];
  if (v28)
  {
    int v53 = v28;
    uint64_t v56 = v8;
    LODWORD(v55) = v28;
LABEL_30:
    FigDebugAssert3();
    goto LABEL_31;
  }
  uint64_t v29 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v29)
  {
    uint64_t v56 = v8;
    LODWORD(v55) = 0;
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
    goto LABEL_31;
  }
  uint64_t v30 = v29;
  double v31 = [v29 computeCommandEncoder];
  if (v31)
  {
    uint64_t v57 = v30;
    uint64_t v58 = v23;
    id v59 = v21;
    id v63 = v20;
    *(unsigned char *)a6 = v85;
    LOBYTE(v78[0]) = v10;
    shaders = self->_shaders;
    long long v60 = v17;
    if (v65 == 3)
    {
      double v33 = [(H13FastBayerProcShaders *)shaders preHRQuadra];
      long long v83 = @"allowUnclampedOutputs";
      unsigned int v34 = [NSNumber numberWithBool:v79];
      v84[0] = v34;
      uint64_t v35 = [NSDictionary dictionaryWithObjects:v84 forKeys:&v83 count:1];
      unsigned int v36 = [v33 getPipelineStateWithParams:v35];
    }
    else
    {
      double v33 = [(H13FastBayerProcShaders *)shaders preHR];
      v81[0] = @"rnfEnabled";
      unsigned int v34 = [NSNumber numberWithBool:v80[0]];
      v82[0] = v34;
      v81[1] = @"useLocalMaxForNoiseModel";
      uint64_t v35 = [NSNumber numberWithBool:v80[1]];
      v82[1] = v35;
      v81[2] = @"allowUnclampedOutputs";
      [NSNumber numberWithBool:v79];
      v38 = id v37 = v16;
      v82[2] = v38;
      [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:3];
      char v39 = self;
      v41 = id v40 = v15;
      unsigned int v36 = [v33 getPipelineStateWithParams:v41];

      id v15 = v40;
      self = v39;

      id v16 = v37;
    }

    if (v36)
    {
      [v31 setComputePipelineState:v36];
      [v31 setTexture:v66 atIndex:0];
      [v31 setTexture:*((void *)a6 + 17) atIndex:1];
      [v31 setTexture:v16 atIndex:2];
      [v31 setBytes:v80 length:880 atIndex:0];
      [v31 setBytes:a6 length:128 atIndex:1];
      [v31 setBytes:v78 length:112 atIndex:2];
      unint64_t v42 = [v36 threadExecutionWidth];
      unint64_t v43 = [v36 maxTotalThreadsPerThreadgroup];
      if (v65 == 3) {
        char v44 = 2;
      }
      else {
        char v44 = 1;
      }
      v77[0] = v61 >> v44;
      v77[1] = (HIDWORD(v61) >> v44);
      v77[2] = 1;
      v76[0] = v42;
      v76[1] = v43 / v42;
      void v76[2] = 1;
      [v31 dispatchThreads:v77 threadsPerThreadgroup:v76];
      [v31 endEncoding];

      int v45 = [v16 width];
      int v46 = [v16 height];
      id v47 = [v15 inputFrame];
      unsigned __int16 v48 = -[SoftISPInputFrame frameID]((uint64_t)v47) >> 16;

      if (*MEMORY[0x263F00E10])
      {
        int v49 = v48;
        int v50 = [v57 commandQueue];
        uint64_t v51 = [v50 commandBuffer];

        [v51 setLabel:@"KTRACE_MTLCMDBUF"];
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __140__H13FastBayerProcStage_processPreHRWithConfig_inputTex_outputTex_lscMetadata_hrEnabled_wbgEnabled_lscEnabled_outputFrame_awbComputedGains___block_invoke;
        void v72[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
        int v73 = v45;
        int v74 = v46;
        int v75 = v49;
        [v51 addCompletedHandler:v72];
        [v51 commit];
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        v68[2] = __140__H13FastBayerProcStage_processPreHRWithConfig_inputTex_outputTex_lscMetadata_hrEnabled_wbgEnabled_lscEnabled_outputFrame_awbComputedGains___block_invoke_2;
        v68[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
        int v69 = v45;
        int v70 = v46;
        int v71 = v49;
        [v57 addCompletedHandler:v68];
      }
      id v17 = v60;
      [v60 addCompletionHandlerToCommandBuffer:v57];
      [(FigMetalContext *)self->_metal commit];
      double v31 = 0;
      uint64_t v52 = v57;
      int v53 = 0;
      uint64_t v20 = v63;
      int v23 = v58;
      unint64_t v21 = v59;
    }
    else
    {
      uint64_t v56 = v8;
      LODWORD(v55) = 0;
      FigDebugAssert3();
      int v53 = FigSignalErrorAt();
      unint64_t v21 = v59;
      id v17 = v60;
      uint64_t v20 = v63;
      uint64_t v52 = v57;
      int v23 = v58;
    }
  }
  else
  {
    uint64_t v56 = v8;
    LODWORD(v55) = 0;
    FigDebugAssert3();
    uint64_t v52 = v30;
    int v53 = FigSignalErrorAt();
    unsigned int v36 = 0;
  }
LABEL_20:
  objc_msgSend(v31, "endEncoding", v55, v56);

  return v53;
}

uint64_t __140__H13FastBayerProcStage_processPreHRWithConfig_inputTex_outputTex_lscMetadata_hrEnabled_wbgEnabled_lscEnabled_outputFrame_awbComputedGains___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __140__H13FastBayerProcStage_processPreHRWithConfig_inputTex_outputTex_lscMetadata_hrEnabled_wbgEnabled_lscEnabled_outputFrame_awbComputedGains___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

+ (id)createIntermediateMetalTexture:(id)a3 label:(id)a4 pixelFormat:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7 compressed:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a3;
  BOOL v13 = [v12 allocator];
  id v14 = (void *)[v13 newTextureDescriptor];

  if (!v14) {
    goto LABEL_9;
  }
  id v15 = [v14 desc];
  [v15 setTextureType:2];

  id v16 = [v14 desc];
  [v16 setWidth:a6];

  id v17 = [v14 desc];
  [v17 setHeight:a7];

  uint64_t v18 = v8 ? 16387 : 3;
  int v19 = [v14 desc];
  [v19 setUsage:v18];

  uint64_t v20 = [v14 desc];
  [v20 setPixelFormat:a5];

  unint64_t v21 = [v14 desc];
  [v21 setCompressionMode:v8];

  [v14 setLabel:0];
  uint64_t v22 = [v12 allocator];
  int v23 = (void *)[v22 newTextureWithDescriptor:v14];

  if (!v23)
  {
LABEL_9:
    FigDebugAssert3();
    FigSignalErrorAt();
    int v23 = 0;
  }

  return v23;
}

- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 compressed:(BOOL)a7
{
  return +[H13FastBayerProcStage createIntermediateMetalTexture:self->_metal label:a3 pixelFormat:a4 width:a5 height:a6 compressed:a7];
}

- (BOOL)sifrFrameIdMatchesFrameId:(id)a3
{
  return (([(H13FastBayerProcStage *)self sifrFrameId] ^ a3.var0) & 0xFF000000000000) == 0
      && !(([(H13FastBayerProcStage *)self sifrFrameId] ^ a3.var0) >> 56)
      && (([(H13FastBayerProcStage *)self sifrFrameId] ^ a3.var0) & 0x10000000000) == 0;
}

- (int)runAWBWithArgs:(id)a3 awbComputedGOCGains:updatedMetadata:lscGainsTex:inputTex:auxEnabled:hrEnabled:
{
  int v76 = v7;
  double v9 = v6;
  char v10 = v5;
  uint64_t v11 = v4;
  id v12 = v3;
  id v14 = a3;
  id v78 = v11;
  id v15 = v10;
  id v16 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v25 = FigSignalErrorAt();
    id v17 = 0;
LABEL_37:
    unint64_t v21 = 0;
    uint64_t v20 = 0;
LABEL_39:
    char v39 = 0;
    goto LABEL_34;
  }
  id v17 = v14;
  uint64_t v18 = [v17 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v25 = FigSignalErrorAt();
    goto LABEL_37;
  }
  uint64_t v20 = [v17 config];
  unint64_t v21 = [v17 inputFrame];
  if (!v21)
  {
    int v25 = FigSignalErrorAt();
    goto LABEL_39;
  }
  int v75 = v12;
  uint64_t v22 = [(H13FastBayerProcStage *)self getProcessingOptionsForFrame:v21];
  id v77 = (void *)v22;
  if ([v20 stageConfigMode] == 1)
  {
    awb = self->_awb;
    uint64_t v24 = [v17 bounds];
    int v25 = [(H13FastAWB *)awb configForInputFrame:v21 bounds:v24 processingOptions:v22 staticParameters:self->_staticParameters registers:0];

    double v74 = 0.0;
    if (v25) {
      goto LABEL_40;
    }
  }
  else if ([v20 stageConfigMode] == 2)
  {
    id v71 = v16;
    id v26 = v15;
    int v27 = self->_awb;
    int v28 = [v17 bounds];
    staticParameters = self->_staticParameters;
    uint64_t v30 = -[SoftISPInputFrame registers]((uint64_t)v21);
    uint64_t v31 = v22;
    uint64_t v32 = (void *)v30;
    int v33 = [(H13FastAWB *)v27 configForInputFrame:v21 bounds:v28 processingOptions:v31 staticParameters:staticParameters registers:v30];

    if (v33)
    {
      uint64_t v67 = v8;
      LODWORD(v64) = v33;
      FigDebugAssert3();
    }
    id v15 = v26;
    int v34 = -[H13FastAWB run:lscGainsTex:hrEnabled:auxEnabled:updatedMetadata:](self->_awb, "run:lscGainsTex:hrEnabled:auxEnabled:updatedMetadata:", v71, v26, v79 != 0, v76 != 0, v78, v64, v67);
    if (v34)
    {
      uint64_t v68 = v8;
      LODWORD(v65) = v34;
      FigDebugAssert3();
    }
    [(H13FastAWB *)self->_awb readAWBComboGains];
    double v74 = v35;
    unsigned int v36 = self->_awb;
    id v37 = [v17 bounds];
    int64x2_t v38 = v36;
    char v39 = v77;
    int v25 = [(H13FastAWB *)v38 configForInputFrame:v21 bounds:v37 processingOptions:v77 staticParameters:self->_staticParameters registers:0];

    if (v25)
    {
      FigDebugAssert3();
      id v16 = v71;
      goto LABEL_34;
    }
    id v16 = v71;
  }
  else if ([v20 stageConfigMode] == 3)
  {
    id v40 = self->_awb;
    uint64_t v41 = [v17 bounds];
    id v42 = v15;
    unint64_t v43 = self->_staticParameters;
    -[SoftISPInputFrame registers]((uint64_t)v21);
    id v72 = v16;
    v45 = id v44 = v14;
    int v46 = v43;
    id v15 = v42;
    int v25 = [(H13FastAWB *)v40 configForInputFrame:v21 bounds:v41 processingOptions:v77 staticParameters:v46 registers:v45];

    id v14 = v44;
    id v16 = v72;

    double v74 = 0.0;
    if (v25) {
      goto LABEL_40;
    }
  }
  else
  {
    double v74 = 0.0;
    if ([v20 stageConfigMode] == 4)
    {
      id v47 = self->_awb;
      unsigned __int16 v48 = [v17 bounds];
      int v49 = [(H13FastAWB *)v47 configForInputFrame:v21 bounds:v48 processingOptions:v77 staticParameters:self->_staticParameters registers:0];

      if (v49)
      {
        uint64_t v67 = v8;
        LODWORD(v64) = v49;
        FigDebugAssert3();
      }
      id v73 = v14;
      int v50 = self->_awb;
      uint64_t v51 = objc_msgSend(v17, "inputTex", v64, v67);
      id v70 = v15;
      int v52 = [(H13FastAWB *)v50 run:v51 lscGainsTex:v15 hrEnabled:v79 != 0 auxEnabled:v76 != 0 updatedMetadata:v78];

      if (v52)
      {
        uint64_t v69 = v8;
        LODWORD(v66) = v52;
        FigDebugAssert3();
      }
      [(H13FastAWB *)self->_awb readAWBComboGains];
      double v74 = v53;
      uint64_t v54 = self->_awb;
      uint64_t v55 = [v17 bounds];
      uint64_t v56 = self->_staticParameters;
      uint64_t v57 = -[SoftISPInputFrame registers]((uint64_t)v21);
      int v25 = [(H13FastAWB *)v54 configForInputFrame:v21 bounds:v55 processingOptions:v77 staticParameters:v56 registers:v57];

      if (v25)
      {
        FigDebugAssert3();
        id v15 = v70;
        id v14 = v73;
        goto LABEL_41;
      }
      id v15 = v70;
      id v14 = v73;
    }
  }
  uint64_t v58 = self->_awb;
  id v59 = [v17 inputTex];
  int v25 = [(H13FastAWB *)v58 run:v59 lscGainsTex:v15 hrEnabled:v79 != 0 auxEnabled:v76 != 0 updatedMetadata:v78];

  if (v25)
  {
LABEL_40:
    FigDebugAssert3();
LABEL_41:
    char v39 = v77;
    goto LABEL_34;
  }
  char v39 = v77;
  if ([v20 stageConfigMode] == 2
    || [v20 stageConfigMode] == 4)
  {
    int v60 = [(H13FastAWB *)self->_awb compareAWBComboGains:v74];
    int v25 = v60;
    if (v60)
    {
      uint64_t v67 = v8;
      LODWORD(v64) = v60;
      FigDebugAssert3();
    }
  }
  else
  {
    int v25 = 0;
  }
  [(H13FastAWB *)self->_awb readAWBGOCGains];
  int v62 = DWORD2(v61);
  *int v75 = v61;
  if (DWORD2(v61) <= v61) {
    int v62 = v61;
  }
  if (!(v62 | DWORD1(v61)))
  {
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
  }
LABEL_34:

  return v25;
}

- (id)getProcessingOptionsForFrame:(id)a3
{
  int v4 = -[SoftISPInputFrame processingOptions]((uint64_t)a3);
  int v5 = [(H13FastBayerProcStage *)self processingOptions];

  if (v5)
  {
    id v6 = (id)[v4 mutableCopy];
    int v7 = [(H13FastBayerProcStage *)self processingOptions];
    [v6 addEntriesFromDictionary:v7];
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (int)runWithArgs:(id)a3
{
  id v4 = a3;
  id location = 0;
  id v130 = 0;
  id v127 = 0;
  id v128 = 0;
  id v125 = 0;
  id v126 = 0;
  id v124 = 0;
  long long v123 = 0u;
  memset(v122, 0, sizeof(v122));
  id v121 = 0;
  long long v120 = 0u;
  memset(v119, 0, sizeof(v119));
  unsigned int v118 = 0;
  double v117 = 0.0;
  int v116 = 0;
  uint64_t v115 = 0;
  int v5 = [v4 bounds];
  -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v5);

  id v6 = [v4 bounds];
  -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v6);

  char v85 = v4;
  int v7 = [v4 inputFrame];
  -[SoftISPInputFrame frameID]((uint64_t)v7);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v18 = FigSignalErrorAt();
    float32x4_t v89 = 0;
    long long v90 = 0;
    long long v86 = 0;
    long long v87 = 0;
    long long v88 = 0;
    long long v84 = 0;
    id v8 = 0;
    goto LABEL_110;
  }
  id v8 = v4;
  double v9 = [v8 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v18 = FigSignalErrorAt();
    float32x4_t v89 = 0;
    long long v90 = 0;
    long long v86 = 0;
LABEL_114:
    long long v88 = 0;
LABEL_116:
    long long v84 = 0;
    long long v87 = 0;
    goto LABEL_110;
  }
  long long v86 = [v8 config];
  uint64_t v11 = [v8 inputTex];

  if (!v11)
  {
    int v18 = FigSignalErrorAt();
    float32x4_t v89 = 0;
    long long v90 = 0;
    goto LABEL_114;
  }
  long long v88 = [v8 inputTex];
  long long v87 = [v8 inputFrame];
  if (!v87)
  {
    int v18 = FigSignalErrorAt();
    float32x4_t v89 = 0;
    long long v90 = 0;
    goto LABEL_116;
  }
  uint64_t v12 = [v8 bounds];
  long long v84 = (void *)v12;
  if (!v12)
  {
    int v18 = FigSignalErrorAt();
    float32x4_t v89 = 0;
    long long v90 = 0;
    long long v84 = 0;
    goto LABEL_110;
  }
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels](v12);
  unint64_t v14 = v13;
  int v15 = -[SoftISPInputFrame cfaLayout]((uint64_t)v87);
  float32x4_t v89 = [(H13FastBayerProcStage *)self getProcessingOptionsForFrame:v87];
  id v16 = [v8 outputFrame];
  id v17 = [v16 metadata];
  long long v90 = (void *)[v17 mutableCopy];

  if (!v90)
  {
    int v18 = FigSignalErrorAt();
    long long v90 = 0;
    goto LABEL_110;
  }
  int v18 = [(H13FastBayerProcStage *)self prepareLSCMetadata:v122 withArgs:v8 forAWB:0];
  if (v18)
  {
    FigDebugAssert3();
    goto LABEL_110;
  }
  int v19 = [v8 inputFrame];
  unint64_t v81 = -[SoftISPInputFrame frameID]((uint64_t)v19);

  char v114 = 0;
  uint64_t v20 = [v8 inputFrame];
  int v18 = [v86 getHRDEnabledForInputFrame:v20 hrdEnabled:&v114];

  if (v18)
  {
    FigDebugAssert3();
    goto LABEL_110;
  }
  unsigned int v83 = objc_msgSend(v89, "cmi_BOOLValueForKey:defaultValue:found:", @"SFHR", 0, 0);
  unint64_t v21 = [v8 inputSyntheticThumbnailTex];

  char v113 = 0;
  uint64_t v22 = [v8 inputFrame];
  int v18 = [v86 getHREnabledForInputFrame:v22 processingOptions:v89 hrEnabled:&v113];

  if (v18) {
    goto LABEL_121;
  }
  if (!v114 && v113)
  {
    FigDebugAssert3();
    goto LABEL_128;
  }
  uint64_t v23 = v113 ? 1 : v83;
  uint64_t v24 = [NSNumber numberWithBool:v23];
  [v90 setObject:v24 forKeyedSubscript:*MEMORY[0x263F2F4F0]];

  uint64_t v25 = objc_msgSend(v89, "cmi_BOOLValueForKey:defaultValue:found:", @"Aux", 0, 0);
  int v18 = [(H13FastBayerProcStage *)self prepareLSCMetadata:v119 withArgs:v8 forAWB:1];
  if (v18)
  {
LABEL_121:
    FigDebugAssert3();
    goto LABEL_110;
  }
  int v26 = 0;
  __int16 v112 = 0;
  int v111 = 0;
  if (v15 == 3)
  {
    int v27 = [v8 inputFrame];
    int v18 = [v86 getHOCLBinConfigForInputFrame:v27 staticParameters:self->_staticParameters hoclBinConfig:&v111];

    if (v18)
    {
LABEL_130:
      FigDebugAssert3();
      goto LABEL_110;
    }
    int v26 = v111;
  }
  BOOL v29 = v15 == 3 && v26 != 0;
  BOOL v82 = v29;
  LOBYTE(v79) = v23;
  int v18 = [(H13FastBayerProcStage *)self runAWBWithArgs:v8 awbComputedGOCGains:&v117 updatedMetadata:v90 lscGainsTex:*((void *)&v120 + 1) inputTex:v88 auxEnabled:v25 hrEnabled:v79];
  if (v18) {
    goto LABEL_130;
  }
  if (v23)
  {
    if (v118 <= LODWORD(v117)) {
      unsigned int v30 = LODWORD(v117);
    }
    else {
      unsigned int v30 = v118;
    }
    if (HIDWORD(v117) <= v30) {
      uint64_t v31 = v30;
    }
    else {
      uint64_t v31 = HIDWORD(v117);
    }
    uint64_t v32 = [NSNumber numberWithUnsignedInt:v31];
  }
  else
  {
    uint64_t v32 = &unk_270E98C50;
  }
  [v90 setObject:v32 forKeyedSubscript:*MEMORY[0x263F2F4F8]];
  if (v23) {

  }
  int v33 = [v8 outputTex];

  if (v33)
  {
    int v34 = [v8 outputTex];
    uint64_t v35 = [v34 pixelFormat];

    if (v35 != 115) {
      goto LABEL_128;
    }
    if (v23) {
      goto LABEL_45;
    }
  }
  else
  {
    *(void *)&long long v91 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:@"h13f.bayerProc.outputTex" pixelFormat:115 width:v14 >> 1 height:v14 >> 33 compressed:1];

    if (!(void)v91)
    {
      int v18 = FigSignalErrorAt();

      goto LABEL_110;
    }
    objc_msgSend(v8, "setOutputTex:");
    FigMetalDecRef();

    if (v23) {
      goto LABEL_45;
    }
  }
  if (!v114)
  {
    unsigned int v36 = [v8 outputTex];
    id v125 = v36;
    goto LABEL_46;
  }
LABEL_45:
  unsigned int v36 = [(H13FastBayerProcStage *)self createIntermediateMetalTexture:@"h13f.bayerProc.gocOutputTex" pixelFormat:115 width:v14 >> 1 height:v14 >> 33 compressed:1];
  id v125 = v36;
  if (!v36)
  {
LABEL_128:
    int v65 = FigSignalErrorAt();
    goto LABEL_129;
  }
LABEL_46:
  char v37 = objc_msgSend(v89, "cmi_BOOLValueForKey:defaultValue:found:", @"LSC", 1, 0);
  uint64_t v38 = objc_msgSend(v89, "cmi_BOOLValueForKey:defaultValue:found:", @"WBG", 1, 0);
  char v39 = [v8 outputFrame];
  LOBYTE(v80) = v37;
  int v40 = [(H13FastBayerProcStage *)self processPreHRWithConfig:v8 inputTex:v88 outputTex:v36 lscMetadata:v122 hrEnabled:v23 wbgEnabled:v38 lscEnabled:v117 outputFrame:v80 awbComputedGains:v39];

  if (v40) {
    goto LABEL_128;
  }
  if (objc_msgSend(v89, "cmi_BOOLValueForKey:defaultValue:found:", @"SSC", 0, 0))
  {
    uint64_t v41 = [v8 inputFrame];
    int v18 = [v86 getSSCConfigForInputFrame:v41 processingOptions:v89 sscConfig:&v115];

    if (v18) {
      goto LABEL_130;
    }
    id v42 = [v8 inputTex];
    int v18 = -[H13FastBayerProcStage runSSCWithArgs:inputTexture:outputMetadata:firstPixel:isQuadra:](self, "runSSCWithArgs:inputTexture:outputMetadata:firstPixel:isQuadra:", &v115, v42, v90, -[SoftISPInputFrame firstPixel]((uint64_t)v87), v15 == 3);

    if (v18) {
      goto LABEL_130;
    }
  }
  uint64_t v110 = 0;
  memset(v109, 0, sizeof(v109));
  memset(v107, 0, sizeof(v107));
  long long v108 = 0u;
  if (v15 == 3)
  {
    unint64_t v43 = [v8 inputFrame];
    id v44 = [v8 bounds];
    int v18 = [v86 getFlareDetectionConfigForInputFrame:v43 flareDetectionConfig:v109 flareCorrectionConfig:v107 bounds:v44 hoclBinConfig:&v111 outputMetadata:v90];

    if (v18
      || BYTE4(v110)
      && (int v18 = [(H13FastBayerProcStage *)self runFlareDetectionWithConfig:v8 inputTex:v88 flareDetectionConfig:v109 lscMetadata:v122 outputMetadata:v90]) != 0)
    {
      FigDebugAssert3();
      goto LABEL_110;
    }
  }
  int v45 = [v8 inputFrame];
  int v46 = -[SoftISPInputFrame rawThumbnailSifr]((uint64_t)v45);
  if (v46) {
    BOOL v47 = v21 == 0;
  }
  else {
    BOOL v47 = 0;
  }
  int v48 = v47;

  if (v23)
  {
    LOBYTE(v91) = 0;
    if (v48)
    {
      int v49 = [v8 inputFrame];
      int v50 = -[SoftISPInputFrame rawThumbnailSifr]((uint64_t)v49);
      id v51 = location;
      id location = v50;

      goto LABEL_63;
    }
    if ((v81 & 0x100000000) != 0) {
      char v52 = v83;
    }
    else {
      char v52 = 1;
    }
    if ((v52 & 1) == 0)
    {
      obuint64_t j = location;
      int v18 = [(H13FastBayerProcStage *)self runHuemapGenerateInputThumbnailWithInputTexture:v88 outputTexture:&obj lscConfig:v122 isSifr:1 args:v8 awbComputedGains:v15 == 3 isQuadra:v117];
      objc_storeStrong(&location, obj);
      if (v18)
      {
        FigDebugAssert3();
        goto LABEL_110;
      }
      [(H13FastBayerProcStage *)self setSifrThumbnailTexture:location];
      uint64_t v56 = [v8 inputFrame];
      -[H13FastBayerProcStage setSifrFrameId:](self, "setSifrFrameId:", -[SoftISPInputFrame frameID]((uint64_t)v56));

      id v57 = location;
      id location = 0;

      [v8 setInputTex:0];
      goto LABEL_109;
    }
    if (v21)
    {
      double v53 = [v8 inputSyntheticThumbnailTex];
      id v54 = location;
      id location = v53;

      if (location)
      {
LABEL_72:
        if (!objc_msgSend(v89, "cmi_BOOLValueForKey:defaultValue:found:", @"Aux", 0, 0))
        {
          uint64_t v55 = [v8 inputFrame];
          int v18 = [v86 getMotionCompensationEnabledForInputFrame:v55 mcEnabled:&v91];

          if (!v18)
          {
            if (v21)
            {
              LOBYTE(v91) = 0;
              goto LABEL_76;
            }
            if (!(_BYTE)v91)
            {
LABEL_76:

              [v8 setInputTex:0];
              id v105 = 0;
              int v18 = [(H13FastBayerProcStage *)self runHuemapGenerationWithInputTexture:location outputTexture:&v105 lscConfig:v122 args:v8 awbComputedGains:v122 lscMetadata:1 applyLscToThumbnailsIfNecessary:v117];
              id v128 = v105;
              FigMetalDecRef();
              if (v18) {
                goto LABEL_77;
              }
              goto LABEL_91;
            }
            if (v48)
            {
              uint64_t v58 = [v8 inputFrame];
              id v59 = -[SoftISPInputFrame rawThumbnailMainEv0]((uint64_t)v58);
              id v60 = v127;
              id v127 = v59;

              goto LABEL_88;
            }
            id v104 = v127;
            int v18 = [(H13FastBayerProcStage *)self runHuemapGenerateInputThumbnailWithInputTexture:v88 outputTexture:&v104 lscConfig:v122 isSifr:HIDWORD(v81) & 1 args:v8 awbComputedGains:v15 == 3 isQuadra:v117];
            objc_storeStrong(&v127, v104);
            if (!v18)
            {
LABEL_88:

              [v8 setInputTex:0];
              id v103 = v126;
              int v18 = [(H13FastBayerProcStage *)self runHuemapMotionCompensationWithSifrTexture:location ev0ThumbnailTexture:v127 outputTexture:&v103 args:v8 lscMetadata:v122];
              objc_storeStrong(&v126, v103);
              if (v18) {
                goto LABEL_77;
              }
              FigMetalDecRef();
              FigMetalDecRef();
              id v102 = 0;
              int v18 = [(H13FastBayerProcStage *)self runHuemapGenerationWithInputTexture:v126 outputTexture:&v102 lscConfig:v122 args:v8 awbComputedGains:v122 lscMetadata:0 applyLscToThumbnailsIfNecessary:v117];
              id v128 = v102;
              if (v18) {
                goto LABEL_77;
              }
              FigMetalDecRef();
LABEL_91:
              long long v88 = 0;
              goto LABEL_92;
            }
          }
LABEL_132:
          FigDebugAssert3();
          goto LABEL_110;
        }
        FigDebugAssert3();
        int v65 = FigSignalErrorAt();
LABEL_129:
        int v18 = v65;
        goto LABEL_110;
      }
    }
    else
    {
      if (v83) {
        goto LABEL_63;
      }
      long long v61 = [(H13FastBayerProcStage *)self sifrThumbnailTexture];
      id v62 = location;
      id location = v61;

      [(H13FastBayerProcStage *)self setSifrThumbnailTexture:0];
      if (location)
      {
        id v63 = [v8 inputFrame];
        BOOL v64 = -[H13FastBayerProcStage sifrFrameIdMatchesFrameId:](self, "sifrFrameIdMatchesFrameId:", -[SoftISPInputFrame frameID]((uint64_t)v63));

        if (v64)
        {
LABEL_63:
          if (!location || (BYTE4(v81) & (v21 == 0)) != 0) {
            goto LABEL_92;
          }
          goto LABEL_72;
        }
      }
    }
    int v65 = FigSignalErrorAt();
    goto LABEL_129;
  }
LABEL_92:
  if (v82)
  {
    int v18 = [(H13FastBayerProcStage *)self runHOCLBinWithArgs:v8 hoclBinConfig:&v111 hoclBinConfigForFlareCorrection:&v108 inputTexture:v36];
    if (v18) {
      goto LABEL_132;
    }
  }
  uint64_t v66 = [v8 inputFrame];
  uint64_t v67 = -[SoftISPInputFrame processingOptions]((uint64_t)v66);
  int v68 = objc_msgSend(v67, "cmi_BOOLValueForKey:defaultValue:found:", @"CAR", 0, 0);

  int v69 = v15 == 3 ? v68 : 0;
  if (v69 == 1)
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v91 = 0u;
    id v70 = [v8 inputFrame];
    staticParameters = self->_staticParameters;
    id v72 = [v8 bounds];
    int v18 = +[ChromaticAberrationRecoveryConfig getCARConfigForInputFrame:v70 staticParameters:staticParameters bounds:v72 carConfig:&v91];

    if (v18) {
      goto LABEL_132;
    }
    int v18 = [(ChromaticAberrationRecovery *)self->_car runCARWithArgs:&v91 targetTexture:v36];
    if (v18) {
      goto LABEL_132;
    }
  }

  [v8 setInputTex:0];
  if ((v23 & 1) != 0 || v114 || BYTE4(v110))
  {
    *(void *)&long long v91 = *((id *)&v123 + 1);
    *((void *)&v91 + 1) = v128;
    *(void *)&long long v92 = v125;
    double v74 = [v8 outputTex];
    int v18 = [(H13FastBayerProcStage *)self runHRWithInputTextures:&v91 outputTexture:v74 outputMetadata:v90 isFinalOutput:v33 != 0 isQuadra:v15 == 3 runHR:v23 args:v117 lscMetadata:v8 awbComputedGains:v122 hrdConfigForFlareCorrection:v107];

    if (v18)
    {
      FigDebugAssert3();
      __destructor_8_s0_s8_s16((uint64_t)&v91);
      goto LABEL_108;
    }
    __destructor_8_s0_s8_s16((uint64_t)&v91);
  }
  else
  {
    id v73 = [v8 outputTex];
    FigMetalIncRef();
  }
  int v75 = [v8 outputFrame];
  [v75 setMetadata:v90];

  if (![(H13FastBayerProcStage *)self shouldRunDraftDemosaic:v87])
  {
LABEL_109:
    long long v88 = 0;
    int v18 = 0;
    goto LABEL_110;
  }
  int v76 = [v8 outputTex];
  id v77 = [v8 outputFrame];
  int v18 = [(H13FastBayerProcStage *)self runDraftDemosaicWithArgs:v8 inputTexture:v76 outputFrame:v77 outputMetadata:v90 isQuadra:v15 == 3];

  if (!v18)
  {
LABEL_108:
    long long v88 = 0;
    goto LABEL_110;
  }
LABEL_77:
  FigDebugAssert3();
  long long v88 = 0;
LABEL_110:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v18;
}

- (H13FastBayerProcShaders)shaders
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

- ($FA854DD5444320DDC86C81E6605CE88F)sifrFrameId
{
  return ($FA854DD5444320DDC86C81E6605CE88F)self->_sifrFrameId.frameID;
}

- (void)setSifrFrameId:(id)a3
{
  self->_sifrFrameId.frameID = a3.var0;
}

- (MTLTexture)sifrThumbnailTexture
{
  return (MTLTexture *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSifrThumbnailTexture:(id)a3
{
}

- (H13FastAWB)awb
{
  return self->_awb;
}

- (CMIWarpStage)warpStage
{
  return self->_warpStage;
}

- (NSDictionary)processingOptions
{
  return self->_processingOptions;
}

- (MTLBuffer)flareDetectionResultBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFlareDetectionResultBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flareDetectionResultBuffer, 0);
  objc_storeStrong((id *)&self->_processingOptions, 0);
  objc_storeStrong((id *)&self->_warpStage, 0);
  objc_storeStrong((id *)&self->_awb, 0);
  objc_storeStrong((id *)&self->_sifrThumbnailTexture, 0);
  objc_storeStrong((id *)&self->_staticParameters, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_car, 0);
}

- (int)runFlareDetectionWithConfig:(id)a3 inputTex:(id)a4 flareDetectionConfig:(FlareDetectionConfig *)a5 lscMetadata:(id *)a6 outputMetadata:
{
  int v7 = v6;
  id v12 = a3;
  id v60 = a4;
  id v13 = v7;
  unint64_t v14 = [(H13FastBayerProcStage *)self metal];
  int v15 = [(H13FastBayerProcStage *)self shaders];
  id v74 = 0;
  id v75 = 0;
  if (v12)
  {
    id v16 = a6;
    unint64_t v17 = *(unsigned __int16 *)&a5->var7;
    int v18 = [v12 config];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v20 = [v12 inputFrame];
      if (v20 && ([v12 bounds], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v22 = a5;
        id v59 = (void *)v21;
        -[SoftISPBounds processingRegionWithinSensorInReadoutPixels](v21);
        int8x8_t v24 = vand_s8((int8x8_t)vadd_s32(vdup_n_s32((unsigned __int16)v17 & 0xFFFC), vadd_s32(v23, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
        v24.i32[0] /= (v17 & 0xFFFC);
        v24.i32[1] /= (v17 & 0xFFFC);
        int32x2_t v56 = (int32x2_t)v24;
        uint64_t v53 = v24.u32[0];
        uint64_t v54 = v24.u32[1];
        uint64_t v25 = -[H13FastBayerProcStage createIntermediateMetalTexture:pixelFormat:width:height:compressed:](self, "createIntermediateMetalTexture:pixelFormat:width:height:compressed:", @"h13f.bayerProc.flareMapTex", 115);
        id v74 = v25;
        if (v25)
        {
          int v26 = v25;
          char v52 = self;
          uint64_t v55 = v20;
          uint32x2_t v57 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)vadd_s32(v56, (int32x2_t)0x1F0000001FLL), (int8x8_t)0xFFFF0000FFFFLL), 5uLL);
          int v27 = [v14 device];
          unsigned __int16 v48 = v57.i16[0];
          unsigned __int16 v49 = v57.u16[2];
          __int16 v50 = v57.i16[0] * v57.i16[2];
          int v28 = v14;
          BOOL v29 = (void *)[v27 newBufferWithLength:(2 * v57.i32[0] * v57.i32[1]) options:0];
          id v75 = v29;

          uint64_t v58 = v28;
          unsigned int v30 = [v28 commandBuffer];
          if (v30)
          {
            id v51 = v30;
            uint64_t v31 = [v30 computeCommandEncoder];
            if (!v31)
            {
              FigDebugAssert3();
              int v45 = FigSignalErrorAt();
              uint64_t v20 = v55;
              unint64_t v14 = v58;
              int v46 = v59;
              id v42 = v51;
              goto LABEL_11;
            }
            uint64_t v32 = (void *)v31;
            id v33 = v13;
            id v34 = v12;
            unint64_t v35 = v17 >> 2;
            unsigned int v36 = [v15 generateFlareMapPerThreadgroup];
            [v32 setComputePipelineState:v36];

            [v32 setTexture:v60 atIndex:0];
            [v32 setTexture:*((void *)v16 + 17) atIndex:1];
            [v32 setTexture:v26 atIndex:2];
            [v32 setBytes:v22 length:40 atIndex:0];
            [v32 setBytes:v16 length:128 atIndex:1];
            v73[0] = v53;
            v73[1] = v54;
            v73[2] = 1;
            v72[0] = v35;
            v72[1] = v35;
            id v12 = v34;
            id v13 = v33;
            v72[2] = 1;
            [v32 dispatchThreadgroups:v73 threadsPerThreadgroup:v72];
            char v37 = [v15 summarizeFlareMap];
            [v32 setComputePipelineState:v37];

            [v32 setTexture:v26 atIndex:0];
            [v32 setBuffer:v29 offset:0 atIndex:0];
            [v32 setBytes:v22 length:40 atIndex:1];
            v71[0] = v48;
            v71[1] = v49;
            void v71[2] = 1;
            int64x2_t v69 = vdupq_n_s64(0x20uLL);
            uint64_t v70 = 1;
            [v32 dispatchThreadgroups:v71 threadsPerThreadgroup:&v69];
            __int16 v68 = v50;
            uint64_t v38 = [v15 calcuateFlareDetectionResult];
            [v32 setComputePipelineState:v38];

            [v32 setBuffer:v29 offset:0 atIndex:0];
            char v39 = [(H13FastBayerProcStage *)v52 flareDetectionResultBuffer];
            [v32 setBuffer:v39 offset:0 atIndex:1];

            [v32 setBytes:v22 length:40 atIndex:2];
            [v32 setBytes:&v68 length:2 atIndex:3];
            int64x2_t v66 = vdupq_n_s64(1uLL);
            uint64_t v67 = 1;
            int64x2_t v64 = v66;
            uint64_t v65 = 1;
            [v32 dispatchThreadgroups:&v66 threadsPerThreadgroup:&v64];
            [v32 endEncoding];

            unint64_t v14 = v58;
            [v58 commit];
            int v40 = [(H13FastBayerProcStage *)v52 flareDetectionResultBuffer];
            id v41 = objc_alloc(MEMORY[0x263F2ED70]);
            v61[0] = MEMORY[0x263EF8330];
            v61[1] = 3221225472;
            v61[2] = __126__H13FastBayerProcStage_FlareDetection__runFlareDetectionWithConfig_inputTex_flareDetectionConfig_lscMetadata_outputMetadata___block_invoke;
            v61[3] = &unk_2655C8448;
            id v42 = v51;
            id v62 = v42;
            id v63 = v40;
            id v43 = v40;
            id v44 = (void *)[v41 initWithBlock:v61];
            [v13 setObject:v44 forKeyedSubscript:*MEMORY[0x263F2EFE8]];

            int v45 = 0;
          }
          else
          {
            FigDebugAssert3();
            int v45 = FigSignalErrorAt();
            id v42 = 0;
            unint64_t v14 = v58;
          }
          uint64_t v20 = v55;
        }
        else
        {
          int v45 = FigSignalErrorAt();
          id v42 = 0;
        }
        int v46 = v59;
      }
      else
      {
        int v45 = FigSignalErrorAt();
        id v42 = 0;
        int v46 = 0;
      }
    }
    else
    {
      int v45 = FigSignalErrorAt();
      id v42 = 0;
      int v46 = 0;
      uint64_t v20 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    id v42 = 0;
    int v46 = 0;
    uint64_t v20 = 0;
    int v45 = 0;
  }
LABEL_11:
  FigMetalDecRef();
  FigMetalDecRef();
  [0 endEncoding];

  return v45;
}

id __126__H13FastBayerProcStage_FlareDetection__runFlareDetectionWithConfig_inputTex_flareDetectionConfig_lscMetadata_outputMetadata___block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) waitUntilCompleted];
  id v2 = (unsigned __int8 *)[*(id *)(a1 + 40) contents];
  v7[0] = *MEMORY[0x263F2EFF0];
  id v3 = [NSNumber numberWithBool:*v2];
  v8[0] = v3;
  v7[1] = *MEMORY[0x263F2EFF8];
  id v4 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v2 + 1)];
  v8[1] = v4;
  int v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

@end