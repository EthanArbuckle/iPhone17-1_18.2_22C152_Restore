@interface CMISoftwareFlashRenderingProcessorV2
- (BOOL)supportsExternalMemoryResource;
- (CMIExternalMemoryResource)externalMemoryResource;
- (CMISoftwareFlashRenderingProcessorDelegate)delegate;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSMutableDictionary)linearOutputImageMetadata;
- (NSMutableDictionary)outputImageMetadata;
- (__CVBuffer)linearOutputImagePixelBuffer;
- (__CVBuffer)outputImagePixelBuffer;
- (id)externalMemoryDescriptorForConfiguration:(id)a3;
- (int)addFrame:(__CVBuffer *)a3 metadata:(id)a4 frameType:(unsigned int)a5 frameParams:(id)a6;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (uint64_t)allocateAssetsForBracket:(uint64_t)a1 bracketIdx:;
- (uint64_t)allocateSharedAssets:(uint64_t)a1;
- (uint64_t)calculateWhitePoints:(float32x4_t *)a3 outputFlashWhitePoint:(float32x4_t *)a4 outputStrobeWhitePoint:(float32x4_t *)a5 outputAmbientWhitePointTuned:(float32x4_t *)a6 outputStrobeWhitePointTuned:;
- (uint64_t)encodeCoreAnalyticsIntermediate:(uint64_t)a3 flashWhitePoint:(double)a4 strobeWhitePoint:(double)a5 ambientWhitePointTuned:(double)a6 strobeWhitePointTuned:(double)a7 cropRect:(double)a8;
- (uint64_t)encodeSoftwareFlashRendering:(uint64_t)a3 flashWhitePoint:(long long *)a4 strobeWhitePoint:(double)a5 ambientWhitePointTuned:(double)a6 strobeWhitePointTuned:(double)a7 cropRect:(double)a8 LSCCropRect:(__n128)a9 fullSizeCropRect:(double)a10;
- (uint64_t)initialiseSoftwareFlashRenderingBlocks;
- (uint64_t)setupTuningParameters:(uint64_t)a1;
- (void)dealloc;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalMemoryResource:(id)a3;
- (void)setLinearOutputImageMetadata:(id)a3;
- (void)setLinearOutputImagePixelBuffer:(__CVBuffer *)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutputImageMetadata:(id)a3;
- (void)setOutputImagePixelBuffer:(__CVBuffer *)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation CMISoftwareFlashRenderingProcessorV2

- (void)dealloc
{
  [(CMISoftwareFlashRenderingProcessorV2 *)self resetState];
  v3.receiver = self;
  v3.super_class = (Class)CMISoftwareFlashRenderingProcessorV2;
  [(CMISoftwareFlashRenderingProcessorV2 *)&v3 dealloc];
}

- (int)setup
{
  objc_super v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v5 = (FigMetalContext *)[objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v4 andOptionalCommandQueue:self->_metalCommandQueue];
  metalContext = self->_metalContext;
  self->_metalContext = v5;

  if (self->_metalContext)
  {
    id v7 = objc_alloc(MEMORY[0x263F2EE10]);
    v8 = [(FigMetalContext *)self->_metalContext device];
    v9 = (void *)[v7 initWithDevice:v8 allocatorType:2];
    [(FigMetalContext *)self->_metalContext setAllocator:v9];

    v10 = [(FigMetalContext *)self->_metalContext allocator];

    if (v10)
    {
      int v11 = -[CMISoftwareFlashRenderingProcessorV2 initialiseSoftwareFlashRenderingBlocks]((uint64_t)self);
      if (v11) {
        FigDebugAssert3();
      }
    }
    else
    {
      int v11 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v11 = 0;
  }
  if (*v3 == 1) {
    kdebug_trace();
  }

  return v11;
}

- (uint64_t)initialiseSoftwareFlashRenderingBlocks
{
  if (result)
  {
    v1 = (void *)result;
    uint64_t v2 = [(id)objc_opt_new() init];
    objc_super v3 = (void *)v1[56];
    v1[56] = v2;

    if (!v1[56]) {
      goto LABEL_10;
    }
    uint64_t v4 = [(id)objc_opt_new() initWithMetalContext:v1[1] externalMemoryResource:v1[3]];
    v5 = (void *)v1[57];
    v1[57] = v4;

    if (!v1[57]) {
      goto LABEL_10;
    }
    uint64_t v6 = [(id)objc_opt_new() init];
    id v7 = (void *)v1[58];
    v1[58] = v6;

    if (!v1[58]) {
      goto LABEL_10;
    }
    uint64_t v8 = [(id)objc_opt_new() initWithMetalContext:v1[1]];
    v9 = (void *)v1[59];
    v1[59] = v8;

    if (!v1[59]) {
      goto LABEL_10;
    }
    uint64_t v10 = [(id)objc_opt_new() init];
    int v11 = (void *)v1[60];
    v1[60] = v10;

    if (!v1[60]) {
      goto LABEL_10;
    }
    uint64_t v12 = [(id)objc_opt_new() initWithMetalContext:v1[1]];
    v13 = (void *)v1[61];
    v1[61] = v12;

    if (v1[61])
    {
      return 0;
    }
    else
    {
LABEL_10:
      FigDebugAssert3();
      return 7;
    }
  }
  return result;
}

- (int)prewarm
{
  objc_super v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  int v4 = -[CMISoftwareFlashRenderingProcessorV2 initialiseSoftwareFlashRenderingBlocks]((uint64_t)self);
  if (*v3 == 1) {
    kdebug_trace();
  }
  return v4;
}

- (BOOL)supportsExternalMemoryResource
{
  return 1;
}

- (id)externalMemoryDescriptorForConfiguration:(id)a3
{
  int v4 = objc_opt_new();
  v5 = v4;
  if (v4)
  {
    if (!self || self->_allocatorSetupComplete)
    {
      uint64_t v6 = 0;
    }
    else
    {
      self->_enableDebuggingOutput = 0;
      uint64_t v6 = 68157440;
    }
    [v4 setMemSize:v6];
    [v5 setAllocatorType:2];
  }
  else
  {
    FigDebugAssert3();
  }

  return v5;
}

- (int)prepareToProcess:(unsigned int)a3
{
  int v4 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (self->_allocatorSetupComplete)
  {
    int v5 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = [(FigMetalContext *)self->_metalContext allocator];

  if (v6)
  {
    id v7 = objc_opt_new();
    uint64_t v8 = v7;
    if (!v7)
    {
      FigDebugAssert3();
      int v5 = FigSignalErrorAt();
      goto LABEL_18;
    }
    [v7 setWireMemory:1];
    [v8 setResourceOptions:512];
    [v8 setLabel:@"FigMetalAllocator_SoftwareFlashRendering"];
    if (!self->_externalMemoryResource
      || ![(CMISoftwareFlashRenderingProcessorV2 *)self supportsExternalMemoryResource])
    {
      if (self->_allocatorSetupComplete)
      {
        uint64_t v12 = 0;
      }
      else
      {
        self->_enableDebuggingOutput = 0;
        uint64_t v12 = 68157440;
      }
      [v8 setMemSize:v12];
      v13 = [(FigMetalContext *)self->_metalContext allocator];
      int v5 = [v13 setupWithDescriptor:v8];

      if (v5)
      {
        FigSignalErrorAt();
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    v9 = [(CMIExternalMemoryResource *)self->_externalMemoryResource allocatorBackend];
    uint64_t v10 = v9;
    if (v9)
    {
      if (self->_allocatorSetupComplete)
      {
        FigDebugAssert3();
      }
      else
      {
        self->_enableDebuggingOutput = 0;
        if ((unint64_t)[v9 memSize] >> 20 >= 0x41)
        {
          objc_msgSend(v8, "setMemSize:", objc_msgSend(v10, "memSize"));
          int v11 = [(FigMetalContext *)self->_metalContext allocator];
          int v5 = [v11 setupWithDescriptor:v8 allocatorBackend:v10];

          if (!v5)
          {

LABEL_17:
            int v5 = 0;
            self->_allocatorSetupComplete = 1;
LABEL_18:

            goto LABEL_19;
          }
          FigDebugAssert3();
          FigSignalErrorAt();
LABEL_30:

          goto LABEL_18;
        }
      }
      int v5 = 0;
      goto LABEL_30;
    }
    int v5 = FigSignalErrorAt();
    goto LABEL_30;
  }
  int v5 = FigSignalErrorAt();
LABEL_19:
  if (*v4 == 1) {
    kdebug_trace();
  }
  return v5;
}

- (int)process
{
  int v4 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (!self->_allocatorSetupComplete)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    FigDebugAssert3();
    v19 = 0;
    int v15 = 6;
    goto LABEL_76;
  }
  ambientPixelBuffer = self->_ambientPixelBuffer;
  if (!ambientPixelBuffer)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
LABEL_102:
    FigDebugAssert3();
    v19 = 0;
LABEL_103:
    int v15 = 1;
    goto LABEL_76;
  }
  if (!*(void *)&self->_anon_68[56])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  if (!self->_processorData.brackets[0].lumaTexture)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  if (!self->_processorData.brackets[0].chromaTexture)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  if (!self->_flashPixelBuffer)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  if (!*(void *)&self->_anon_68[184])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  if (!*(void *)&self->_anon_68[88])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  if (!*(void *)&self->_anon_68[96])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  if (!self->_outputImagePixelBuffer)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ambientPixelBuffer);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(self->_flashPixelBuffer))
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    FigDebugAssert3();
    v19 = 0;
LABEL_75:
    int v15 = 0;
    goto LABEL_76;
  }
  size_t Width = CVPixelBufferGetWidth(self->_ambientPixelBuffer);
  if (Width != CVPixelBufferGetWidth(self->_flashPixelBuffer))
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  size_t Height = CVPixelBufferGetHeight(self->_ambientPixelBuffer);
  if (Height != CVPixelBufferGetHeight(self->_flashPixelBuffer))
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  size_t v9 = CVPixelBufferGetWidth(self->_outputImagePixelBuffer);
  if (v9 != CVPixelBufferGetWidth(self->_flashPixelBuffer))
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  size_t v10 = CVPixelBufferGetHeight(self->_outputImagePixelBuffer);
  if (v10 != CVPixelBufferGetHeight(self->_flashPixelBuffer))
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  CVPixelBufferGetPixelFormatType(self->_outputImagePixelBuffer);
  if (FigCaptureUncompressedPixelFormatForPixelFormat() != 1751527984)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  uint64_t v11 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:self->_outputImagePixelBuffer pixelFormat:25 usage:7 plane:0];
  uint64_t v12 = *(void **)&self->_anon_68[216];
  *(void *)&self->_anon_68[216] = v11;

  if (!*(void *)&self->_anon_68[216])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
LABEL_97:
    FigDebugAssert3();
    v19 = 0;
LABEL_109:
    int v15 = 4;
    goto LABEL_76;
  }
  uint64_t v13 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:self->_outputImagePixelBuffer pixelFormat:65 usage:7 plane:1];
  v14 = *(void **)&self->_anon_68[224];
  *(void *)&self->_anon_68[224] = v13;

  if (!*(void *)&self->_anon_68[224])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_97;
  }
  if (*v4 == 1) {
    kdebug_trace();
  }
  int v15 = -[CMISoftwareFlashRenderingProcessorV2 allocateSharedAssets:]((uint64_t)self);
  if (*v4 == 1) {
    kdebug_trace();
  }
  if (v15)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
LABEL_100:
    FigDebugAssert3();
    v19 = 0;
    goto LABEL_76;
  }
  if (*v4 == 1) {
    kdebug_trace();
  }
  int v16 = -[CMISoftwareFlashRenderingProcessorV2 allocateAssetsForBracket:bracketIdx:]((uint64_t)self);
  int v15 = -[CMISoftwareFlashRenderingProcessorV2 allocateAssetsForBracket:bracketIdx:]((uint64_t)self) | v16;
  if (*v4 == 1) {
    kdebug_trace();
  }
  if (v15)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_100;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_102;
  }
  if (*v4 == 1) {
    kdebug_trace();
  }
  id v18 = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = (void *)[v18 processorNewInferences:self];

  if (*v4 == 1) {
    kdebug_trace();
  }
  if (!v19) {
    goto LABEL_103;
  }
  int v20 = [v19 status];
  if (v20)
  {
    int v15 = v20;
    goto LABEL_76;
  }
  uint64_t v21 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", [v19 skinMatte], 10, 7, 0);
  v22 = *(void **)&self->_anon_68[240];
  *(void *)&self->_anon_68[240] = v21;

  if (!*(void *)&self->_anon_68[240])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
LABEL_108:
    FigDebugAssert3();
    goto LABEL_109;
  }
  uint64_t v23 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", [v19 skyMatte], 10, 7, 0);
  v24 = *(void **)&self->_anon_68[232];
  *(void *)&self->_anon_68[232] = v23;

  if (!*(void *)&self->_anon_68[232])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_108;
  }
  uint64_t v25 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", [v19 personMask], 25, 7, 0);
  v26 = *(void **)&self->_anon_68[248];
  *(void *)&self->_anon_68[248] = v25;

  if (!*(void *)&self->_anon_68[248])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_108;
  }
  v96[0] = 0;
  unsigned int v27 = objc_msgSend(*(id *)&self->_anon_68[184], "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F600], 0, v96);
  if (!v96[0])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
LABEL_114:
    FigDebugAssert3();
    int v15 = 2;
    goto LABEL_76;
  }
  unsigned int v28 = v27;
  unsigned int v29 = objc_msgSend(*(id *)&self->_anon_68[184], "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F5F8], 0, v96);
  if (!v96[0])
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_114;
  }
  unsigned int v30 = v29;
  int v31 = v28 - [*(id *)&self->_anon_68[88] width];
  if (v31 < 0)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_114;
  }
  int v32 = v30 - [*(id *)&self->_anon_68[88] height];
  if (v32 < 0)
  {
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_114;
  }
  int v33 = (int)(*(double *)&self->_anon_68[136]
            * (double)(unint64_t)[*(id *)&self->_anon_68[88] width]);
  int v34 = v33 & ~(v33 >> 31);
  if (v34 >= (int)[*(id *)&self->_anon_68[88] width]) {
    int v34 = [*(id *)&self->_anon_68[88] width];
  }
  unsigned int v81 = v28;
  int v35 = (int)(*(double *)&self->_anon_68[144]
            * (double)(unint64_t)[*(id *)&self->_anon_68[88] height]);
  uint64_t v36 = v35 & ~(v35 >> 31);
  if ((int)v36 >= (int)[*(id *)&self->_anon_68[88] height]) {
    uint64_t v36 = [*(id *)&self->_anon_68[88] height];
  }
  int v37 = (int)(*(double *)&self->_anon_68[120]
            * (double)(unint64_t)[*(id *)&self->_anon_68[88] width]);
  int v38 = v37 & ~(v37 >> 31);
  if (v38 >= (int)[*(id *)&self->_anon_68[88] width]) {
    int v38 = [*(id *)&self->_anon_68[88] width];
  }
  int32x2_t v82 = (int32x2_t)__PAIR64__(v30, v81);
  int v39 = (int)(*(double *)&self->_anon_68[128]
            * (double)(unint64_t)[*(id *)&self->_anon_68[88] height]);
  uint64_t v40 = v39 & ~(v39 >> 31);
  if ((int)v40 >= (int)[*(id *)&self->_anon_68[88] height]) {
    uint64_t v40 = [*(id *)&self->_anon_68[88] height];
  }
  double v42 = *(double *)&self->_anon_68[152];
  double v41 = *(double *)&self->_anon_68[160];
  if (objc_msgSend(*(id *)&self->_anon_68[184], "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 0, 0) == 1)
  {
    int32x2_t v82 = vadd_s32(v82, v82);
    int v43 = (int)v42;
    int v44 = (int)v41;
    char v45 = 1;
  }
  else
  {
    char v45 = 0;
    int v43 = v31 >> 1;
    int v44 = v32 >> 1;
  }
  float32x4_t v95 = 0uLL;
  float32x4_t v94 = 0uLL;
  float32x4_t v93 = 0uLL;
  float32x4_t v92 = 0uLL;
  __n128 v91 = 0uLL;
  int v46 = -[CMISoftwareFlashRenderingProcessorV2 calculateWhitePoints:outputFlashWhitePoint:outputStrobeWhitePoint:outputAmbientWhitePointTuned:outputStrobeWhitePointTuned:]((float32x4_t *)self, &v95, &v94, &v93, &v92, (float32x4_t *)&v91);
  if (v46)
  {
    int v15 = v46;
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
LABEL_117:
    FigDebugAssert3();
    int v4 = (_DWORD *)MEMORY[0x263F00E10];
    goto LABEL_76;
  }
  int v47 = v38;
  uint64_t v48 = v38 | (unint64_t)(v40 << 32);
  *(void *)&long long v87 = __PAIR64__(v36, v34);
  uint64_t v49 = v34 | (unint64_t)(v36 << 32);
  DWORD2(v87) = v43 + v47;
  HIDWORD(v87) = v44 + v40;
  char v88 = v45;
  __int16 v89 = 0;
  char v90 = 0;
  double v76 = *(double *)v93.i64;
  double v77 = *(double *)v95.i64;
  double v79 = *(double *)v92.i64;
  double v80 = *(double *)v94.i64;
  double v78 = v91.n128_f64[0];
  int v50 = [(CMISoftwareFlashRenderingProcessorV2 *)(uint64_t)self encodeSoftwareFlashRendering:v48 flashWhitePoint:&v87 strobeWhitePoint:*(double *)v95.i64 ambientWhitePointTuned:*(double *)v94.i64 strobeWhitePointTuned:*(double *)v93.i64 cropRect:*(double *)v92.i64 LSCCropRect:v91 fullSizeCropRect:*(double *)&v82];
  if (v50)
  {
    int v15 = v50;
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
    goto LABEL_117;
  }
  int v4 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  int v51 = [(CMISoftwareFlashRenderingProcessorV2 *)(uint64_t)self encodeCoreAnalyticsIntermediate:v48 flashWhitePoint:v77 strobeWhitePoint:v80 ambientWhitePointTuned:v76 strobeWhitePointTuned:v79 cropRect:v78];
  if (v51)
  {
    int v15 = v51;
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
  }
  else
  {
    if (*v4 == 1) {
      kdebug_trace();
    }
    int v52 = [(CMISoftwareFlashRenderingCoreV2 *)self->_softwareFlashRenderingCoreProcessor finishProcessing];
    if (!v52)
    {
      if (self->_linearOutputImageMetadata)
      {
        if (*v4 == 1) {
          kdebug_trace();
        }
        id v53 = [(CMISoftwareFlashRenderingProRawGlobalWhitePointV2 *)self->_proRawGlobalWhitePointProcessor globalWhitePointBuffer];
        v54 = (float *)[v53 contents];

        *(float *)&double v55 = 1.0 / fmaxf(*v54, 0.00000011921);
        float v56 = 1.0 / fmaxf(v54[1], 0.00000011921);
        linearOutputImageMetadata = self->_linearOutputImageMetadata;
        float v58 = 1.0 / fmaxf(v54[2], 0.00000011921);
        v59 = [NSNumber numberWithFloat:v55];
        [(NSMutableDictionary *)linearOutputImageMetadata setValue:v59 forKey:*MEMORY[0x263F2F308]];

        v60 = self->_linearOutputImageMetadata;
        *(float *)&double v61 = v56;
        v62 = [NSNumber numberWithFloat:v61];
        [(NSMutableDictionary *)v60 setValue:v62 forKey:*MEMORY[0x263F2F300]];

        v63 = self->_linearOutputImageMetadata;
        *(float *)&double v64 = v58;
        v65 = [NSNumber numberWithFloat:v64];
        [(NSMutableDictionary *)v63 setValue:v65 forKey:*MEMORY[0x263F2F2C8]];

        if (*v4 != 1) {
          goto LABEL_71;
        }
        kdebug_trace();
      }
      if (*v4 == 1) {
        kdebug_trace();
      }
LABEL_71:
      unsigned int v85 = 0;
      unsigned int v86 = 0;
      int v83 = -1082130432;
      int v84 = -1082130432;
      int v66 = [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self->_coreAnalyticsProcessor calculateCorrectionStrengthAndDirectionWithAmbientWhitePointTuned:&v86 flashWhitePoint:&v85 strobeWhitePointTuned:&v84 outputForegroundCorrectionStrengthScale:&v83 outputBackgroundCorrectionStrengthScale:v79 outputForegroundCorrectionDirection:v80 outputBackgroundCorrectionDirection:v78];
      if (!v66)
      {
        [(NSMutableDictionary *)self->_outputImageMetadata setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F2F1A0]];
        v67 = [NSNumber numberWithInt:v86];
        [(NSMutableDictionary *)self->_outputImageMetadata setObject:v67 forKeyedSubscript:*MEMORY[0x263F2F1C0]];

        v68 = [NSNumber numberWithInt:v85];
        [(NSMutableDictionary *)self->_outputImageMetadata setObject:v68 forKeyedSubscript:*MEMORY[0x263F2F1B0]];

        LODWORD(v69) = v84;
        v70 = [NSNumber numberWithFloat:v69];
        [(NSMutableDictionary *)self->_outputImageMetadata setObject:v70 forKeyedSubscript:*MEMORY[0x263F2F1B8]];

        LODWORD(v71) = v83;
        v72 = [NSNumber numberWithFloat:v71];
        [(NSMutableDictionary *)self->_outputImageMetadata setObject:v72 forKeyedSubscript:*MEMORY[0x263F2F1A8]];

        [(NSMutableDictionary *)self->_outputImageMetadata setObject:&unk_270E98380 forKeyedSubscript:*MEMORY[0x263F2F198]];
        if (*v4 == 1) {
          kdebug_trace();
        }
        [(CMISoftwareFlashRenderingCoreV2 *)self->_softwareFlashRenderingCoreProcessor figProcessorDebugDump];
        [(CMISoftwareFlashRenderingProRawGlobalWhitePointV2 *)self->_proRawGlobalWhitePointProcessor figProcessorDebugDump];
        [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self->_coreAnalyticsProcessor figProcessorDebugDump];
        goto LABEL_75;
      }
      int v15 = v66;
      uint64_t v75 = v2;
      LODWORD(v74) = 0;
      goto LABEL_121;
    }
    int v15 = v52;
    uint64_t v75 = v2;
    LODWORD(v74) = 0;
  }
LABEL_121:
  FigDebugAssert3();
LABEL_76:
  [(CMISoftwareFlashRenderingCoreV2 *)self->_softwareFlashRenderingCoreProcessor purgeResources];
  [(CMISoftwareFlashRenderingProRawGlobalWhitePointV2 *)self->_proRawGlobalWhitePointProcessor purgeResources];
  [(CMISoftwareFlashRenderingCoreAnalyticsV2 *)self->_coreAnalyticsProcessor purgeResources];
  if (*v4 == 1) {
    kdebug_trace();
  }

  return v15;
}

- (uint64_t)allocateSharedAssets:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 8) allocator];
  objc_super v3 = (void *)[v2 newTextureDescriptor];

  if (!v3)
  {
    FigDebugAssert3();
    int v5 = 0;
LABEL_9:
    uint64_t v6 = 7;
    goto LABEL_5;
  }
  int v4 = [*(id *)(a1 + 8) allocator];
  int v5 = (void *)[v4 newBufferDescriptor];

  if (!v5)
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_5:

  return v6;
}

- (uint64_t)allocateAssetsForBracket:(uint64_t)a1 bracketIdx:
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = malloc_type_calloc(0x400uLL, 4uLL, 0x100004052888210uLL);
  if (!v2)
  {
    FigDebugAssert3();
    int v4 = 0;
LABEL_9:
    uint64_t v5 = 7;
    goto LABEL_5;
  }
  objc_super v3 = [*(id *)(a1 + 8) allocator];
  int v4 = (void *)[v3 newTextureDescriptor];

  if (!v4)
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  uint64_t v5 = 0;
LABEL_5:
  free(v2);

  return v5;
}

- (uint64_t)calculateWhitePoints:(float32x4_t *)a3 outputFlashWhitePoint:(float32x4_t *)a4 outputStrobeWhitePoint:(float32x4_t *)a5 outputAmbientWhitePointTuned:(float32x4_t *)a6 outputStrobeWhitePointTuned:
{
  if (!a1) {
    return 0;
  }
  float32x2_t v36 = 0;
  uint64_t v37 = 0;
  float32x2_t v34 = 0;
  uint64_t v35 = 0;
  float32x2_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v12 = +[CMISoftwareFlashRenderingCommon getWhiteBalanceGains:a1[10].i64[0] outputVector:&v36];
  if (v12)
  {
    uint64_t v14 = v12;
    goto LABEL_9;
  }
  uint64_t v13 = +[CMISoftwareFlashRenderingCommon getWhiteBalanceGains:a1[18].i64[0] outputVector:&v34];
  if (v13)
  {
    uint64_t v14 = v13;
    goto LABEL_9;
  }
  uint64_t v14 = +[CMISoftwareFlashRenderingCommon getStrobeWhiteBalanceGains:a1[31].i64[1] metadata:a1[18].i64[0] outputVector:&v32];
  if (v14)
  {
LABEL_9:
    FigDebugAssert3();
    return v14;
  }
  *(float32x2_t *)v15.f32 = vmaxnm_f32(v36, (float32x2_t)0x3400000034000000);
  v15.i32[2] = fmaxf(*(float *)&v37, 0.00000011921);
  __asm { FMOV            V7.4S, #1.0 }
  float32x4_t v23 = vdivq_f32(_Q7, v15);
  *(float32x2_t *)v17.f32 = vmaxnm_f32(v34, (float32x2_t)0x3400000034000000);
  v17.i32[2] = fmaxf(*(float *)&v35, 0.00000011921);
  *(float32x2_t *)v16.f32 = vmaxnm_f32(v32, (float32x2_t)0x3400000034000000);
  v16.i32[2] = fmaxf(*(float *)&v33, 0.00000011921);
  float32x4_t v24 = vdivq_f32(_Q7, v16);
  float32x4_t v25 = vmulq_f32(a1[23], v23);
  float32x4_t v26 = vmulq_f32(a1[24], v24);
  float32x4_t v27 = vmulq_n_f32(vsubq_f32(v25, v26), a1[25].f32[1]);
  float32x4_t v28 = vaddq_f32(v25, vmulq_n_f32(vsubq_f32(v26, v25), a1[25].f32[0]));
  float32x4_t v29 = vaddq_f32(v26, v27);
  __asm { FMOV            V4.2S, #1.0 }
  *(float32x2_t *)v27.f32 = vmaxnm_f32(vminnm_f32(*(float32x2_t *)v28.f32, _D4), 0);
  v27.i32[2] = fmaxf(fminf(v28.f32[2], 1.0), 0.0);
  *(float32x2_t *)v28.f32 = vmaxnm_f32(vminnm_f32(*(float32x2_t *)v29.f32, _D4), 0);
  v28.i32[2] = fmaxf(fminf(v29.f32[2], 1.0), 0.0);
  *a2 = v23;
  *a3 = vdivq_f32(_Q7, v17);
  *a4 = v24;
  *a5 = v27;
  *a6 = v28;
  return v14;
}

- (uint64_t)encodeSoftwareFlashRendering:(uint64_t)a3 flashWhitePoint:(long long *)a4 strobeWhitePoint:(double)a5 ambientWhitePointTuned:(double)a6 strobeWhitePointTuned:(double)a7 cropRect:(double)a8 LSCCropRect:(__n128)a9 fullSizeCropRect:(double)a10
{
  if (!a1) {
    return 0;
  }
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v15 = +[CMISoftwareFlashRenderingCommon calculateEIT:*(void *)(a1 + 160) result:(char *)&v45 + 4];
  if (v15)
  {
    uint64_t v35 = v15;
    goto LABEL_14;
  }
  uint64_t v16 = +[CMISoftwareFlashRenderingCommon calculateEIT:*(void *)(a1 + 288) result:&v45];
  if (v16)
  {
    uint64_t v35 = v16;
    goto LABEL_14;
  }
  uint64_t v17 = +[CMISoftwareFlashRenderingCommon getLensShadingCorrectionMaxGain:*(void *)(a1 + 176) outputMaxGain:(char *)&v44 + 4];
  if (v17)
  {
    uint64_t v35 = v17;
    goto LABEL_14;
  }
  uint64_t v18 = +[CMISoftwareFlashRenderingCommon getLensShadingCorrectionMaxGain:*(void *)(a1 + 304) outputMaxGain:&v44];
  if (v18)
  {
    uint64_t v35 = v18;
    goto LABEL_14;
  }
  uint64_t v19 = [*(id *)(a1 + 456) prepareToProcessWithConfig:*(void *)(a1 + 448) processingType:0];
  if (v19)
  {
    uint64_t v35 = v19;
    goto LABEL_14;
  }
  v22 = *(void **)(a1 + 456);
  uint64_t v23 = *(void *)(a1 + 64);
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v25 = *(void *)(a1 + 192);
  uint64_t v26 = *(void *)(a1 + 200);
  long long v27 = *(_OWORD *)(a1 + 80);
  long long v28 = *(_OWORD *)(a1 + 208);
  uint64_t v29 = *(void *)(a1 + 168);
  uint64_t v30 = *(void *)(a1 + 296);
  LODWORD(v20) = HIDWORD(v44);
  LODWORD(v21) = v44;
  uint64_t v31 = *(void *)(a1 + 344);
  uint64_t v32 = *(void *)(a1 + 352);
  uint64_t v33 = *(void *)(a1 + 320);
  uint64_t v34 = *(void *)(a1 + 328);
  long long v42 = *a4;
  int v43 = *((_DWORD *)a4 + 4);
  uint64_t v35 = objc_msgSend(v22, "applyWithAmbientLumaTexture:ambientChromaTexture:flashLumaTexture:flashChromaTexture:ambientYUVOffsets:flashYUVOffsets:ambientLSCGainsTexture:flashLSCGainsTexture:ambientLSCMaxGain:flashLSCMaxGain:skinMaskTexture:personMaskTexture:ambientWhitePoint:flashWhitePoint:strobeWhitePoint:ambientWhitePointTuned:strobeWhitePointTuned:ambientIntegrationTime:flashIntegrationTime:cropRect:LSCCropRect:fullSizeDimensions:outputLumaTexture:outputChromaTexture:", v23, v24, v25, v26, v29, v30, *(double *)&v27, *(double *)&v28, v20, v21, a5, a6, a7, a8,
          v31,
          v32,
          *(_OWORD *)&a9,
          __PAIR64__(v45, HIDWORD(v45)),
          a2,
          a3,
          &v42,
          *(void *)&a10,
          v33,
          v34);
  if (v35) {
LABEL_14:
  }
    FigDebugAssert3();
  return v35;
}

- (uint64_t)encodeCoreAnalyticsIntermediate:(uint64_t)a3 flashWhitePoint:(double)a4 strobeWhitePoint:(double)a5 ambientWhitePointTuned:(double)a6 strobeWhitePointTuned:(double)a7 cropRect:(double)a8
{
  if (!a1) {
    return 0;
  }
  uint64_t v11 = [*(id *)(a1 + 8) commandBuffer];
  if (!v11)
  {
    FigDebugAssert3();
    uint64_t v19 = FigSignalErrorAt();
    goto LABEL_8;
  }
  uint64_t v12 = [*(id *)(a1 + 488) prepareToProcessWithConfig:*(void *)(a1 + 480)];
  if (v12)
  {
    uint64_t v19 = v12;
    goto LABEL_14;
  }
  uint64_t v13 = *(void **)(a1 + 488);
  uint64_t v14 = *(void *)(a1 + 192);
  uint64_t v15 = *(void *)(a1 + 200);
  uint64_t v16 = *(void *)(a1 + 320);
  uint64_t v17 = *(void *)(a1 + 328);
  uint64_t v18 = [*(id *)(a1 + 456) spatialWhitePointsRBTexture];
  uint64_t v19 = objc_msgSend(v13, "calculatePercentileDeltaEuvBuffers:sourceLumaTexture:sourceChromaTexture:destinationLumaTexture:destinationChromaTexture:spatialWhitePointsRBTexture:ambientWhitePoint:flashWhitePoint:strobeWhitePoint:ambientWhitePointTuned:strobeWhitePointTuned:yuvOffsets:cropRect:", v11, v14, v15, v16, v17, v18, a4, a5, a6, a7, a8, *(double *)(a1 + 208), a2, a3);

  if (v19) {
    goto LABEL_14;
  }
  uint64_t v20 = [*(id *)(a1 + 472) prepareToProcessWithConfig:*(void *)(a1 + 464)];
  if (v20)
  {
    uint64_t v19 = v20;
    goto LABEL_14;
  }
  double v21 = *(void **)(a1 + 472);
  v22 = [*(id *)(a1 + 456) spatialWhitePointsRBTexture];
  uint64_t v19 = [v21 encodeGlobalWhitePointTo:v11 spatialWhitePointsRBTexture:v22];

  if (v19)
  {
LABEL_14:
    FigDebugAssert3();
    goto LABEL_8;
  }
  [*(id *)(a1 + 8) commit];
LABEL_8:

  return v19;
}

- (int)purgeResources
{
  int v3 = [(CMISoftwareFlashRenderingCoreV2 *)self->_softwareFlashRenderingCoreProcessor purgeResources];
  int v4 = [(FigMetalContext *)self->_metalContext allocator];
  uint64_t v5 = [v4 usedSizeAll];

  if (v5)
  {
    FigDebugAssert3();
  }
  else
  {
    uint64_t v6 = [(FigMetalContext *)self->_metalContext allocator];
    [v6 reset];

    id v7 = [(FigMetalContext *)self->_metalContext allocator];
    [v7 purgeResources];
  }
  return v3;
}

- (int)finishProcessing
{
  return 0;
}

- (int)resetState
{
  CVPixelBufferRelease(self->_ambientPixelBuffer);
  self->_ambientPixelBuffer = 0;
  ambientFrameParams = self->_ambientFrameParams;
  self->_ambientFrameParams = 0;

  lumaTexture = self->_processorData.brackets[0].lumaTexture;
  self->_processorData.brackets[0].lumaTexture = 0;

  chromaTexture = self->_processorData.brackets[0].chromaTexture;
  self->_processorData.brackets[0].chromaTexture = 0;

  uint64_t v6 = *(void **)&self->_anon_68[64];
  *(void *)&self->_anon_68[64] = 0;

  id v7 = *(void **)&self->_anon_68[56];
  *(void *)&self->_anon_68[56] = 0;

  CVPixelBufferRelease(self->_flashPixelBuffer);
  self->_flashPixelBuffer = 0;
  flashFrameParams = self->_flashFrameParams;
  self->_flashFrameParams = 0;

  size_t v9 = *(void **)&self->_anon_68[88];
  *(void *)&self->_anon_68[88] = 0;

  size_t v10 = *(void **)&self->_anon_68[96];
  *(void *)&self->_anon_68[96] = 0;

  uint64_t v11 = *(void **)&self->_anon_68[192];
  *(void *)&self->_anon_68[192] = 0;

  uint64_t v12 = *(void **)&self->_anon_68[184];
  *(void *)&self->_anon_68[184] = 0;

  CVPixelBufferRelease(self->_outputImagePixelBuffer);
  CVPixelBufferRelease(self->_linearOutputImagePixelBuffer);
  self->_outputImagePixelBuffer = 0;
  self->_linearOutputImagePixelBuffer = 0;
  uint64_t v13 = *(void **)&self->_anon_68[216];
  *(void *)&self->_anon_68[216] = 0;

  uint64_t v14 = *(void **)&self->_anon_68[224];
  *(void *)&self->_anon_68[224] = 0;

  outputImageMetadata = self->_outputImageMetadata;
  self->_outputImageMetadata = 0;

  linearOutputImageMetadata = self->_linearOutputImageMetadata;
  self->_linearOutputImageMetadata = 0;

  self->_isSetupTuningParametersDone = 0;
  return 0;
}

- (int)addFrame:(__CVBuffer *)a3 metadata:(id)a4 frameType:(unsigned int)a5 frameParams:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  if (!self->_allocatorSetupComplete)
  {
    FigDebugAssert3();
    uint64_t v14 = 0;
    CFDictionaryRef v40 = 0;
    uint64_t v23 = 0;
    CFDictionaryRef v26 = 0;
    int v45 = 6;
    goto LABEL_44;
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !v12
    || CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v12 lscGains]) != 1380411457)
  {
    FigDebugAssert3();
    uint64_t v14 = 0;
    goto LABEL_42;
  }
  uint64_t v13 = [(FigMetalContext *)self->_metalContext allocator];
  uint64_t v14 = (void *)[v13 newTextureDescriptor];

  if (!v14)
  {
    FigDebugAssert3();
    CFDictionaryRef v40 = 0;
    uint64_t v23 = 0;
    CFDictionaryRef v26 = 0;
    int v45 = 7;
    goto LABEL_44;
  }
  if (!v11)
  {
    FigDebugAssert3();
    CFDictionaryRef v40 = 0;
    uint64_t v23 = 0;
    goto LABEL_40;
  }
  CVPixelBufferGetPixelFormatType(a3);
  if (FigCaptureUncompressedPixelFormatForPixelFormat() != 1751527984) {
    goto LABEL_41;
  }
  if (!self->_isSetupTuningParametersDone)
  {
    uint64_t v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
    uint64_t v16 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:v15];
    -[CMISoftwareFlashRenderingProcessorV2 setupTuningParameters:]((uint64_t)self, v16);
  }
  if (!CVPixelBufferIsPlanar(a3) || CVPixelBufferGetPlaneCount(a3) != 2) {
    goto LABEL_41;
  }
  if (a5)
  {
    if (a5 == 1)
    {
      uint64_t v17 = 12;
      uint64_t v18 = 56;
      uint64_t v19 = 40;
      goto LABEL_18;
    }
LABEL_42:
    CFDictionaryRef v40 = 0;
    uint64_t v23 = 0;
LABEL_43:
    CFDictionaryRef v26 = 0;
    int v45 = 1;
    goto LABEL_44;
  }
  uint64_t v17 = 4;
  uint64_t v18 = 48;
  uint64_t v19 = 32;
LABEL_18:
  *(Class *)((char *)&self->super.isa + v19) = CVPixelBufferRetain(a3);
  objc_storeStrong((id *)((char *)&self->super.isa + v18), a6);
  uint64_t v20 = (char *)self + v17 * 16;
  objc_storeStrong((id *)&self->_processorData.brackets[v17 + 2].lumaTexture, a4);
  if (![v12 lscGains])
  {
LABEL_41:
    FigDebugAssert3();
    goto LABEL_42;
  }
  uint64_t v21 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", [v12 lscGains], 115, 23, 0);
  v22 = (void *)*((void *)v20 + 13);
  *((void *)v20 + 13) = v21;

  if (!*((void *)v20 + 13))
  {
    FigDebugAssert3();
    CFDictionaryRef v40 = 0;
    uint64_t v23 = 0;
    CFDictionaryRef v26 = 0;
LABEL_51:
    int v45 = 4;
    goto LABEL_44;
  }
  uint64_t v23 = [v12 lscParams];

  if (!v23)
  {
    FigDebugAssert3();
    CFDictionaryRef v40 = 0;
    goto LABEL_43;
  }
  uint64_t v24 = [v12 lscParams];
  uint64_t v25 = (void *)*((void *)v20 + 14);
  *((void *)v20 + 14) = v24;

  CFDictionaryRef v26 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2F110]];
  CFDictionaryRef v27 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2EFB0]];
  uint64_t v23 = v27;
  memset(&rect, 0, sizeof(rect));
  if (v26)
  {
    if (!CGRectMakeWithDictionaryRepresentation(v26, &rect))
    {
      FigDebugAssert3();
      CFDictionaryRef v40 = 0;
      goto LABEL_53;
    }
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    BOOL IsEmpty = CGRectIsEmpty(rect);
    v31.f64[0] = (double)Width;
    if (IsEmpty)
    {
      rect.origin.x = 0.0;
      rect.origin.y = 0.0;
      rect.size.width = (double)Width;
      rect.size.height = (double)Height;
      goto LABEL_31;
    }
    v31.f64[1] = (double)Height;
    CGPoint v32 = (CGPoint)vdivq_f64((float64x2_t)rect.origin, v31);
    _Q0 = (CGSize)vdivq_f64((float64x2_t)rect.size, v31);
    rect.origin = v32;
    goto LABEL_30;
  }
  if (v27)
  {
    if (CGRectMakeWithDictionaryRepresentation(v27, &rect))
    {
      CGRect rect = CGRectInset(rect, -0.05, -0.05);
      v48.origin.x = 0.0;
      v48.origin.y = 0.0;
      v48.size.width = 1.0;
      v48.size.height = 1.0;
      CGRect rect = CGRectIntersection(rect, v48);
      goto LABEL_31;
    }
    FigDebugAssert3();
    CFDictionaryRef v40 = 0;
LABEL_40:
    CFDictionaryRef v26 = 0;
    goto LABEL_53;
  }
  rect.origin.x = 0.0;
  rect.origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
LABEL_30:
  rect.CGSize size = _Q0;
LABEL_31:
  CGSize size = rect.size;
  *((_OWORD *)v20 + 2) = rect.origin;
  *((CGSize *)v20 + 3) = size;
  CFDictionaryRef v39 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2F660]];
  CFDictionaryRef v40 = v39;
  if (v39 && CGRectMakeWithDictionaryRepresentation(v39, (CGRect *)v20 + 2))
  {
    uint64_t v41 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:25 usage:7 plane:0];
    long long v42 = *(void **)v20;
    *(void *)uint64_t v20 = v41;

    if (*(void *)v20)
    {
      uint64_t v43 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:65 usage:7 plane:1];
      uint64_t v44 = (void *)*((void *)v20 + 1);
      *((void *)v20 + 1) = v43;

      if (*((void *)v20 + 1))
      {
        int v45 = 0;
        *((_OWORD *)v20 + 1) = 0u;
        goto LABEL_44;
      }
    }
    FigDebugAssert3();
    goto LABEL_51;
  }
  FigDebugAssert3();
LABEL_53:
  int v45 = 2;
LABEL_44:
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }

  return v45;
}

- (uint64_t)setupTuningParameters:(uint64_t)a1
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (a1)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"SWFRThumbnailHeight"];
    if (v6)
    {
      id v7 = [v5 objectForKeyedSubscript:@"SWFRThumbnailHeight"];
      uint64_t v8 = (id *)(a1 + 448);
      objc_msgSend(*(id *)(a1 + 448), "setThumbnailHeight:", objc_msgSend(v7, "intValue"));
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 448);
      objc_msgSend(*(id *)(a1 + 448), "setThumbnailHeight:", objc_msgSend(*(id *)(a1 + 448), "thumbnailHeight"));
    }

    size_t v9 = [v5 objectForKeyedSubscript:@"SWFRThumbnailWidth"];
    if (v9)
    {
      size_t v10 = [v5 objectForKeyedSubscript:@"SWFRThumbnailWidth"];
      objc_msgSend(*v8, "setThumbnailWidth:", objc_msgSend(v10, "intValue"));
    }
    else
    {
      objc_msgSend(*v8, "setThumbnailWidth:", objc_msgSend(*v8, "thumbnailWidth"));
    }

    uint64_t v11 = [*v8 thumbnailHeight];
    id v12 = [*v8 whiteBalanceAmbientConfig];
    [v12 setSpatialWhitePointsGridHeight:v11];

    uint64_t v13 = [*v8 thumbnailWidth];
    uint64_t v14 = [*v8 whiteBalanceAmbientConfig];
    [v14 setSpatialWhitePointsGridWidth:v13];

    uint64_t v15 = [*v8 thumbnailWidth];
    uint64_t v16 = [*v8 styleTransferConfig];
    [v16 setSourceThumbnailWidth:v15];

    uint64_t v17 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"preferenceGainAmbientWhitePoint"];
    uint64_t v19 = [v18 objectAtIndexedSubscript:0];
    if (v19)
    {
      uint64_t v2 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
      uint64_t v20 = [v2 objectForKeyedSubscript:@"preferenceGainAmbientWhitePoint"];
      uint64_t v21 = [v20 objectAtIndexedSubscript:0];
      [v21 floatValue];
      *(_DWORD *)(a1 + 368) = v22;
    }
    else
    {
      *(_DWORD *)(a1 + 368) = 1065353216;
    }

    uint64_t v23 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"preferenceGainAmbientWhitePoint"];
    uint64_t v25 = [v24 objectAtIndexedSubscript:1];
    if (v25)
    {
      uint64_t v2 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
      CFDictionaryRef v26 = [v2 objectForKeyedSubscript:@"preferenceGainAmbientWhitePoint"];
      CFDictionaryRef v27 = [v26 objectAtIndexedSubscript:1];
      [v27 floatValue];
      *(_DWORD *)(a1 + 372) = v28;
    }
    else
    {
      *(_DWORD *)(a1 + 372) = 1065353216;
    }

    uint64_t v29 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"preferenceGainAmbientWhitePoint"];
    float64x2_t v31 = [v30 objectAtIndexedSubscript:2];
    if (v31)
    {
      uint64_t v2 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
      CGPoint v32 = [v2 objectForKeyedSubscript:@"preferenceGainAmbientWhitePoint"];
      uint64_t v33 = [v32 objectAtIndexedSubscript:2];
      [v33 floatValue];
      *(_DWORD *)(a1 + 376) = v34;
    }
    else
    {
      *(_DWORD *)(a1 + 376) = 1065353216;
    }

    uint64_t v35 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
    float32x2_t v36 = [v35 objectForKeyedSubscript:@"preferenceGainStrobeWhitePoint"];
    uint64_t v37 = [v36 objectAtIndexedSubscript:0];
    if (v37)
    {
      uint64_t v2 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
      int v38 = [v2 objectForKeyedSubscript:@"preferenceGainStrobeWhitePoint"];
      CFDictionaryRef v39 = [v38 objectAtIndexedSubscript:0];
      [v39 floatValue];
      *(_DWORD *)(a1 + 384) = v40;
    }
    else
    {
      *(_DWORD *)(a1 + 384) = 1065353216;
    }

    uint64_t v41 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
    long long v42 = [v41 objectForKeyedSubscript:@"preferenceGainStrobeWhitePoint"];
    uint64_t v43 = [v42 objectAtIndexedSubscript:1];
    if (v43)
    {
      uint64_t v2 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
      uint64_t v44 = [v2 objectForKeyedSubscript:@"preferenceGainStrobeWhitePoint"];
      int v45 = [v44 objectAtIndexedSubscript:1];
      [v45 floatValue];
      *(_DWORD *)(a1 + 388) = v46;
    }
    else
    {
      *(_DWORD *)(a1 + 388) = 1065353216;
    }

    int v47 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
    CGRect v48 = [v47 objectForKeyedSubscript:@"preferenceGainStrobeWhitePoint"];
    uint64_t v49 = [v48 objectAtIndexedSubscript:2];
    if (v49)
    {
      uint64_t v2 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
      int v50 = [v2 objectForKeyedSubscript:@"preferenceGainStrobeWhitePoint"];
      int v51 = [v50 objectAtIndexedSubscript:2];
      [v51 floatValue];
      *(_DWORD *)(a1 + 392) = v52;
    }
    else
    {
      *(_DWORD *)(a1 + 392) = 1065353216;
    }

    id v53 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
    v54 = [v53 objectForKeyedSubscript:@"preferenceAmbientWhitePointToStrobeAdjustmentFactor"];
    if (v54)
    {
      double v55 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
      uint64_t v2 = [v55 objectForKeyedSubscript:@"preferenceAmbientWhitePointToStrobeAdjustmentFactor"];
      [v2 floatValue];
      *(_DWORD *)(a1 + 400) = v56;
    }
    else
    {
      *(_DWORD *)(a1 + 400) = 0;
    }

    v57 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
    float v58 = [v57 objectForKeyedSubscript:@"preferenceStrobeWhitePointToAmbientAdjustmentFactor"];
    if (v58)
    {
      v59 = [v5 objectForKeyedSubscript:@"PreferenceWhitePoints"];
      uint64_t v2 = [v59 objectForKeyedSubscript:@"preferenceStrobeWhitePointToAmbientAdjustmentFactor"];
      [v2 floatValue];
      *(_DWORD *)(a1 + 404) = v60;
    }
    else
    {
      *(_DWORD *)(a1 + 404) = 0;
    }

    double v61 = [v5 objectForKeyedSubscript:@"SensorSpaceConversion"];
    v62 = [v61 objectForKeyedSubscript:@"ClippedConfidenceLikelihoodScale"];
    if (v62)
    {
      v63 = [v5 objectForKeyedSubscript:@"SensorSpaceConversion"];
      uint64_t v2 = [v63 objectForKeyedSubscript:@"ClippedConfidenceLikelihoodScale"];
      [v2 floatValue];
    }
    else
    {
      v63 = [*v8 sensorSpaceConversionConfig];
      [v63 clippedConfidenceLikelihoodScale];
    }
    int v65 = v64;
    int v66 = [*v8 sensorSpaceConversionConfig];
    LODWORD(v67) = v65;
    [v66 setClippedConfidenceLikelihoodScale:v67];

    if (v62) {
    v68 = [v5 objectForKeyedSubscript:@"SensorSpaceConversion"];
    }
    double v69 = [v68 objectForKeyedSubscript:@"ClippedConfidenceLikelihoodExponent"];
    if (v69)
    {
      v70 = [v5 objectForKeyedSubscript:@"SensorSpaceConversion"];
      uint64_t v2 = [v70 objectForKeyedSubscript:@"ClippedConfidenceLikelihoodExponent"];
      [v2 floatValue];
    }
    else
    {
      v70 = [*v8 sensorSpaceConversionConfig];
      [v70 clippedConfidenceLikelihoodExponent];
    }
    int v72 = v71;
    v73 = [*v8 sensorSpaceConversionConfig];
    LODWORD(v74) = v72;
    [v73 setClippedConfidenceLikelihoodExponent:v74];

    if (v69) {
    uint64_t v75 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
    }
    double v76 = [v75 objectForKeyedSubscript:@"StrobeBeamProfileScaleMinimum"];
    if (v76)
    {
      double v77 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
      uint64_t v2 = [v77 objectForKeyedSubscript:@"StrobeBeamProfileScaleMinimum"];
      [v2 floatValue];
    }
    else
    {
      double v77 = [*v8 strobeCorrectionConfig];
      [v77 strobeBeamProfileScaleMinimum];
    }
    int v79 = v78;
    double v80 = [*v8 strobeCorrectionConfig];
    LODWORD(v81) = v79;
    [v80 setStrobeBeamProfileScaleMinimum:v81];

    if (v76) {
    int32x2_t v82 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
    }
    int v83 = [v82 objectForKeyedSubscript:@"StrobeBeamProfileScaleMaximum"];
    if (v83)
    {
      int v84 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
      uint64_t v2 = [v84 objectForKeyedSubscript:@"StrobeBeamProfileScaleMaximum"];
      [v2 floatValue];
    }
    else
    {
      int v84 = [*v8 strobeCorrectionConfig];
      [v84 strobeBeamProfileScaleMaximum];
    }
    int v86 = v85;
    long long v87 = [*v8 strobeCorrectionConfig];
    LODWORD(v88) = v86;
    [v87 setStrobeBeamProfileScaleMaximum:v88];

    if (v83) {
    __int16 v89 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
    }
    char v90 = [v89 objectForKeyedSubscript:@"StrobeBeamProfileComponentZeroThreshold"];
    if (v90)
    {
      __n128 v91 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
      uint64_t v2 = [v91 objectForKeyedSubscript:@"StrobeBeamProfileComponentZeroThreshold"];
      [v2 floatValue];
    }
    else
    {
      __n128 v91 = [*v8 strobeCorrectionConfig];
      [v91 strobeBeamProfileComponentZeroThreshold];
    }
    int v93 = v92;
    float32x4_t v94 = [*v8 strobeCorrectionConfig];
    LODWORD(v95) = v93;
    [v94 setStrobeBeamProfileComponentZeroThreshold:v95];

    if (v90) {
    v96 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
    }
    v97 = [v96 objectForKeyedSubscript:@"StrobeBeamProfileComponentOneThreshold"];
    if (v97)
    {
      v98 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
      uint64_t v2 = [v98 objectForKeyedSubscript:@"StrobeBeamProfileComponentOneThreshold"];
      [v2 floatValue];
    }
    else
    {
      v98 = [*v8 strobeCorrectionConfig];
      [v98 strobeBeamProfileComponentOneThreshold];
    }
    int v100 = v99;
    v101 = [*v8 strobeCorrectionConfig];
    LODWORD(v102) = v100;
    [v101 setStrobeBeamProfileComponentOneThreshold:v102];

    if (v97) {
    v103 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
    }
    v104 = [v103 objectForKeyedSubscript:@"AmbientStrobeBeamProfileMixFactor"];
    if (v104)
    {
      v105 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
      uint64_t v2 = [v105 objectForKeyedSubscript:@"AmbientStrobeBeamProfileMixFactor"];
      [v2 floatValue];
    }
    else
    {
      v105 = [*v8 strobeCorrectionConfig];
      [v105 ambientStrobeBeamProfileMixFactor];
    }
    int v107 = v106;
    v108 = [*v8 strobeCorrectionConfig];
    LODWORD(v109) = v107;
    [v108 setAmbientStrobeBeamProfileMixFactor:v109];

    if (v104) {
    v110 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v111 = [v110 objectForKeyedSubscript:@"SpatialWhiteBalancingEnabled"];
    if (v111)
    {
      v112 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v112 objectForKeyedSubscript:@"SpatialWhiteBalancingEnabled"];
      uint64_t v113 = [v2 BOOLValue];
    }
    else
    {
      v112 = [*v8 whiteBalanceAmbientConfig];
      uint64_t v113 = [v112 spatialWhiteBalancingEnabled];
    }
    v114 = [*v8 whiteBalanceAmbientConfig];
    [v114 setSpatialWhiteBalancingEnabled:v113];

    if (v111) {
    v115 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v116 = [v115 objectForKeyedSubscript:@"SpatialWhitePointsAmbientShadowZeroThreshold"];
    if (v116)
    {
      v117 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v117 objectForKeyedSubscript:@"SpatialWhitePointsAmbientShadowZeroThreshold"];
      [v2 floatValue];
    }
    else
    {
      v117 = [*v8 whiteBalanceAmbientConfig];
      [v117 spatialWhitePointsAmbientShadowZeroThreshold];
    }
    int v119 = v118;
    v120 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v121) = v119;
    [v120 setSpatialWhitePointsAmbientShadowZeroThreshold:v121];

    if (v116) {
    v122 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v123 = [v122 objectForKeyedSubscript:@"SpatialWhitePointsAmbientShadowOneThreshold"];
    if (v123)
    {
      v124 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v124 objectForKeyedSubscript:@"SpatialWhitePointsAmbientShadowOneThreshold"];
      [v2 floatValue];
    }
    else
    {
      v124 = [*v8 whiteBalanceAmbientConfig];
      [v124 spatialWhitePointsAmbientShadowOneThreshold];
    }
    int v126 = v125;
    v127 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v128) = v126;
    [v127 setSpatialWhitePointsAmbientShadowOneThreshold:v128];

    if (v123) {
    v129 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v130 = [v129 objectForKeyedSubscript:@"SpatialWhitePointsAmbientSaturationZeroThreshold"];
    if (v130)
    {
      v131 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v131 objectForKeyedSubscript:@"SpatialWhitePointsAmbientSaturationZeroThreshold"];
      [v2 floatValue];
    }
    else
    {
      v131 = [*v8 whiteBalanceAmbientConfig];
      [v131 spatialWhitePointsAmbientSaturationZeroThreshold];
    }
    int v133 = v132;
    v134 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v135) = v133;
    [v134 setSpatialWhitePointsAmbientSaturationZeroThreshold:v135];

    if (v130) {
    v136 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v137 = [v136 objectForKeyedSubscript:@"SpatialWhitePointsAmbientSaturationOneThreshold"];
    if (v137)
    {
      v138 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v138 objectForKeyedSubscript:@"SpatialWhitePointsAmbientSaturationOneThreshold"];
      [v2 floatValue];
    }
    else
    {
      v138 = [*v8 whiteBalanceAmbientConfig];
      [v138 spatialWhitePointsAmbientSaturationOneThreshold];
    }
    int v140 = v139;
    v141 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v142) = v140;
    [v141 setSpatialWhitePointsAmbientSaturationOneThreshold:v142];

    if (v137) {
    v143 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v144 = [v143 objectForKeyedSubscript:@"SpatialWhitePointsStrobeSaturationZeroThreshold"];
    if (v144)
    {
      v145 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v145 objectForKeyedSubscript:@"SpatialWhitePointsStrobeSaturationZeroThreshold"];
      [v2 floatValue];
    }
    else
    {
      v145 = [*v8 whiteBalanceAmbientConfig];
      [v145 spatialWhitePointsStrobeSaturationZeroThreshold];
    }
    int v147 = v146;
    v148 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v149) = v147;
    [v148 setSpatialWhitePointsStrobeSaturationZeroThreshold:v149];

    if (v144) {
    v150 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v151 = [v150 objectForKeyedSubscript:@"SpatialWhitePointsStrobeSaturationOneThreshold"];
    if (v151)
    {
      v152 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v152 objectForKeyedSubscript:@"SpatialWhitePointsStrobeSaturationOneThreshold"];
      [v2 floatValue];
    }
    else
    {
      v152 = [*v8 whiteBalanceAmbientConfig];
      [v152 spatialWhitePointsStrobeSaturationOneThreshold];
    }
    int v154 = v153;
    v155 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v156) = v154;
    [v155 setSpatialWhitePointsStrobeSaturationOneThreshold:v156];

    if (v151) {
    v157 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v158 = [v157 objectForKeyedSubscript:@"SpatialWhitePointsStrobeAmbientMinRatioZeroThreshold"];
    if (v158)
    {
      v159 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v159 objectForKeyedSubscript:@"SpatialWhitePointsStrobeAmbientMinRatioZeroThreshold"];
      [v2 floatValue];
    }
    else
    {
      v159 = [*v8 whiteBalanceAmbientConfig];
      [v159 spatialWhitePointsStrobeAmbientMinRatioZeroThreshold];
    }
    int v161 = v160;
    v162 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v163) = v161;
    [v162 setSpatialWhitePointsStrobeAmbientMinRatioZeroThreshold:v163];

    if (v158) {
    v164 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v165 = [v164 objectForKeyedSubscript:@"SpatialWhitePointsStrobeAmbientMinRatioOneThreshold"];
    if (v165)
    {
      v166 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v166 objectForKeyedSubscript:@"SpatialWhitePointsStrobeAmbientMinRatioOneThreshold"];
      [v2 floatValue];
    }
    else
    {
      v166 = [*v8 whiteBalanceAmbientConfig];
      [v166 spatialWhitePointsStrobeAmbientMinRatioOneThreshold];
    }
    int v168 = v167;
    v169 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v170) = v168;
    [v169 setSpatialWhitePointsStrobeAmbientMinRatioOneThreshold:v170];

    if (v165) {
    v171 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v172 = [v171 objectForKeyedSubscript:@"CoarseWhitePointsSpatialGridWidth"];
    if (v172)
    {
      v173 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v173 objectForKeyedSubscript:@"CoarseWhitePointsSpatialGridWidth"];
      uint64_t v174 = [v2 intValue];
    }
    else
    {
      v173 = [*v8 whiteBalanceAmbientConfig];
      uint64_t v174 = [v173 coarseWhitePointsSpatialGridWidth];
    }
    v175 = [*v8 whiteBalanceAmbientConfig];
    [v175 setCoarseWhitePointsSpatialGridWidth:v174];

    if (v172) {
    v176 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v177 = [v176 objectForKeyedSubscript:@"CoarseWhitePointsSpatialGridHeight"];
    if (v177)
    {
      v178 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v178 objectForKeyedSubscript:@"CoarseWhitePointsSpatialGridHeight"];
      uint64_t v179 = [v2 intValue];
    }
    else
    {
      v178 = [*v8 whiteBalanceAmbientConfig];
      uint64_t v179 = [v178 coarseWhitePointsSpatialGridHeight];
    }
    v180 = [*v8 whiteBalanceAmbientConfig];
    [v180 setCoarseWhitePointsSpatialGridHeight:v179];

    if (v177) {
    v181 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v182 = [v181 objectForKeyedSubscript:@"CoarseWhitePointsGaussianSigma"];
    if (v182)
    {
      v183 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v183 objectForKeyedSubscript:@"CoarseWhitePointsGaussianSigma"];
      [v2 floatValue];
    }
    else
    {
      v183 = [*v8 whiteBalanceAmbientConfig];
      [v183 coarseWhitePointsGaussianSigma];
    }
    int v185 = v184;
    v186 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v187) = v185;
    [v186 setCoarseWhitePointsGaussianSigma:v187];

    if (v182) {
    v188 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v189 = [v188 objectForKeyedSubscript:@"FusionSpatialWhitePointLikelihood"];
    if (v189)
    {
      v190 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v190 objectForKeyedSubscript:@"FusionSpatialWhitePointLikelihood"];
      [v2 floatValue];
    }
    else
    {
      v190 = [*v8 whiteBalanceAmbientConfig];
      [v190 fusionSpatialWhitePointLikelihood];
    }
    int v192 = v191;
    v193 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v194) = v192;
    [v193 setFusionSpatialWhitePointLikelihood:v194];

    if (v189) {
    v195 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v196 = [v195 objectForKeyedSubscript:@"FusionCoarseSpatialWhitePointLikelihood"];
    if (v196)
    {
      v197 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v197 objectForKeyedSubscript:@"FusionCoarseSpatialWhitePointLikelihood"];
      [v2 floatValue];
    }
    else
    {
      v197 = [*v8 whiteBalanceAmbientConfig];
      [v197 fusionCoarseSpatialWhitePointLikelihood];
    }
    int v199 = v198;
    v200 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v201) = v199;
    [v200 setFusionCoarseSpatialWhitePointLikelihood:v201];

    if (v196) {
    v202 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v203 = [v202 objectForKeyedSubscript:@"FusionAmbientWhitePointLikelihood"];
    if (v203)
    {
      v204 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v204 objectForKeyedSubscript:@"FusionAmbientWhitePointLikelihood"];
      [v2 floatValue];
    }
    else
    {
      v204 = [*v8 whiteBalanceAmbientConfig];
      [v204 fusionAmbientWhitePointLikelihood];
    }
    int v206 = v205;
    v207 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v208) = v206;
    [v207 setFusionAmbientWhitePointLikelihood:v208];

    if (v203) {
    v209 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
    }
    v210 = [v209 objectForKeyedSubscript:@"FusionSpatialWhitePointCorrectionStrength"];
    if (v210)
    {
      v211 = [v5 objectForKeyedSubscript:@"WhiteBalanceAmbient"];
      uint64_t v2 = [v211 objectForKeyedSubscript:@"FusionSpatialWhitePointCorrectionStrength"];
      [v2 floatValue];
    }
    else
    {
      v211 = [*v8 whiteBalanceAmbientConfig];
      [v211 fusionSpatialWhitePointCorrectionStrength];
    }
    int v213 = v212;
    v214 = [*v8 whiteBalanceAmbientConfig];
    LODWORD(v215) = v213;
    [v214 setFusionSpatialWhitePointCorrectionStrength:v215];

    if (v210) {
    v216 = [v5 objectForKeyedSubscript:@"CombineBalancedComponents"];
    }
    v217 = [v216 objectForKeyedSubscript:@"ClippingCorrectionEnabled"];
    if (v217)
    {
      v218 = [v5 objectForKeyedSubscript:@"CombineBalancedComponents"];
      uint64_t v2 = [v218 objectForKeyedSubscript:@"ClippingCorrectionEnabled"];
      uint64_t v219 = [v2 BOOLValue];
    }
    else
    {
      v218 = [*v8 combineBalancedComponentsConfig];
      uint64_t v219 = [v218 clippingCorrectionEnabled];
    }
    v220 = [*v8 combineBalancedComponentsConfig];
    [v220 setClippingCorrectionEnabled:v219];

    if (v217) {
    v221 = [v5 objectForKeyedSubscript:@"CombineBalancedComponents"];
    }
    v222 = [v221 objectForKeyedSubscript:@"ClippingCorrectionTransitionGain"];
    if (v222)
    {
      v223 = [v5 objectForKeyedSubscript:@"CombineBalancedComponents"];
      uint64_t v2 = [v223 objectForKeyedSubscript:@"ClippingCorrectionTransitionGain"];
      [v2 floatValue];
    }
    else
    {
      v223 = [*v8 combineBalancedComponentsConfig];
      [v223 clippingCorrectionTransitionGain];
    }
    int v225 = v224;
    v226 = [*v8 combineBalancedComponentsConfig];
    LODWORD(v227) = v225;
    [v226 setClippingCorrectionTransitionGain:v227];

    if (v222) {
    v228 = [v5 objectForKeyedSubscript:@"CombineBalancedComponents"];
    }
    v229 = [v228 objectForKeyedSubscript:@"ClippingCorrectionTransitionExponent"];
    if (v229)
    {
      v230 = [v5 objectForKeyedSubscript:@"CombineBalancedComponents"];
      uint64_t v2 = [v230 objectForKeyedSubscript:@"ClippingCorrectionTransitionExponent"];
      [v2 floatValue];
    }
    else
    {
      v230 = [*v8 combineBalancedComponentsConfig];
      [v230 clippingCorrectionTransitionExponent];
    }
    int v232 = v231;
    v233 = [*v8 combineBalancedComponentsConfig];
    LODWORD(v234) = v232;
    [v233 setClippingCorrectionTransitionExponent:v234];

    if (v229) {
    v235 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v236 = [v235 objectForKeyedSubscript:@"SpeedModeStyleTransferEnabled"];
    if (v236)
    {
      v237 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v237 objectForKeyedSubscript:@"SpeedModeStyleTransferEnabled"];
      uint64_t v238 = [v2 BOOLValue];
    }
    else
    {
      v237 = [*v8 styleTransferConfig];
      uint64_t v238 = [v237 speedModeStyleTransferEnabled];
    }
    v239 = [*v8 styleTransferConfig];
    [v239 setSpeedModeStyleTransferEnabled:v238];

    if (v236) {
    v240 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v241 = [v240 objectForKeyedSubscript:@"StyleTransferThumbnailWidth"];
    if (v241)
    {
      v242 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v242 objectForKeyedSubscript:@"StyleTransferThumbnailWidth"];
      uint64_t v243 = [v2 intValue];
    }
    else
    {
      v242 = [*v8 styleTransferConfig];
      uint64_t v243 = [v242 styleTransferThumbnailWidth];
    }
    v244 = [*v8 styleTransferConfig];
    [v244 setStyleTransferThumbnailWidth:v243];

    if (v241) {
    v245 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v246 = [v245 objectForKeyedSubscript:@"StyleTransferThumbnailHeight"];
    if (v246)
    {
      v247 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v247 objectForKeyedSubscript:@"StyleTransferThumbnailHeight"];
      uint64_t v248 = [v2 intValue];
    }
    else
    {
      v247 = [*v8 styleTransferConfig];
      uint64_t v248 = [v247 styleTransferThumbnailHeight];
    }
    v249 = [*v8 styleTransferConfig];
    [v249 setStyleTransferThumbnailHeight:v248];

    if (v246) {
    v250 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v251 = [v250 objectForKeyedSubscript:@"StyleTransferThumbnailSharpness"];
    if (v251)
    {
      v252 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v252 objectForKeyedSubscript:@"StyleTransferThumbnailSharpness"];
      [v2 floatValue];
    }
    else
    {
      v252 = [*v8 styleTransferConfig];
      [v252 styleTransferThumbnailSharpness];
    }
    int v254 = v253;
    v255 = [*v8 styleTransferConfig];
    LODWORD(v256) = v254;
    [v255 setStyleTransferThumbnailSharpness:v256];

    if (v251) {
    v257 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v258 = [v257 objectForKeyedSubscript:@"StyleTransferGammaCorrection"];
    if (v258)
    {
      v259 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v259 objectForKeyedSubscript:@"StyleTransferGammaCorrection"];
      [v2 floatValue];
    }
    else
    {
      v259 = [*v8 styleTransferConfig];
      [v259 styleTransferGammaCorrection];
    }
    int v261 = v260;
    v262 = [*v8 styleTransferConfig];
    LODWORD(v263) = v261;
    [v262 setStyleTransferGammaCorrection:v263];

    if (v258) {
    v264 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v265 = [v264 objectForKeyedSubscript:@"ClippingCorrectionEnabled"];
    if (v265)
    {
      v266 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v266 objectForKeyedSubscript:@"ClippingCorrectionEnabled"];
      uint64_t v267 = [v2 BOOLValue];
    }
    else
    {
      v266 = [*v8 styleTransferConfig];
      uint64_t v267 = [v266 clippingCorrectionEnabled];
    }
    v268 = [*v8 styleTransferConfig];
    [v268 setClippingCorrectionEnabled:v267];

    if (v265) {
    v269 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v270 = [v269 objectForKeyedSubscript:@"ClippingCorrectionTransitionGain"];
    if (v270)
    {
      v271 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v271 objectForKeyedSubscript:@"ClippingCorrectionTransitionGain"];
      [v2 floatValue];
    }
    else
    {
      v271 = [*v8 styleTransferConfig];
      [v271 clippingCorrectionTransitionGain];
    }
    int v273 = v272;
    v274 = [*v8 styleTransferConfig];
    LODWORD(v275) = v273;
    [v274 setClippingCorrectionTransitionGain:v275];

    if (v270) {
    v276 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v277 = [v276 objectForKeyedSubscript:@"ClippingCorrectionTransitionExponent"];
    if (v277)
    {
      v278 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v278 objectForKeyedSubscript:@"ClippingCorrectionTransitionExponent"];
      [v2 floatValue];
    }
    else
    {
      v278 = [*v8 styleTransferConfig];
      [v278 clippingCorrectionTransitionExponent];
    }
    int v280 = v279;
    v281 = [*v8 styleTransferConfig];
    LODWORD(v282) = v280;
    [v281 setClippingCorrectionTransitionExponent:v282];

    if (v277) {
    v283 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v284 = [v283 objectForKeyedSubscript:@"LearningModulationMaskCloseKernelSize"];
    if (v284)
    {
      v285 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v285 objectForKeyedSubscript:@"LearningModulationMaskCloseKernelSize"];
      uint64_t v286 = [v2 intValue];
    }
    else
    {
      v285 = [*v8 styleTransferConfig];
      uint64_t v286 = [v285 learningModulationMaskCloseKernelSize];
    }
    v287 = [*v8 styleTransferConfig];
    [v287 setLearningModulationMaskCloseKernelSize:v286];

    if (v284) {
    v288 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v289 = [v288 objectForKeyedSubscript:@"LearningModulationMaskPersonModulationWeight"];
    if (v289)
    {
      v290 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v290 objectForKeyedSubscript:@"LearningModulationMaskPersonModulationWeight"];
      [v2 floatValue];
    }
    else
    {
      v290 = [*v8 styleTransferConfig];
      [v290 learningModulationMaskPersonModulationWeight];
    }
    int v292 = v291;
    v293 = [*v8 styleTransferConfig];
    LODWORD(v294) = v292;
    [v293 setLearningModulationMaskPersonModulationWeight:v294];

    if (v289) {
    v295 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v296 = [v295 objectForKeyedSubscript:@"LearningModulationMaskSkinModulationWeight"];
    if (v296)
    {
      v297 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v297 objectForKeyedSubscript:@"LearningModulationMaskSkinModulationWeight"];
      [v2 floatValue];
    }
    else
    {
      v297 = [*v8 styleTransferConfig];
      [v297 learningModulationMaskSkinModulationWeight];
    }
    int v299 = v298;
    v300 = [*v8 styleTransferConfig];
    LODWORD(v301) = v299;
    [v300 setLearningModulationMaskSkinModulationWeight:v301];

    if (v296) {
    v302 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v303 = [v302 objectForKeyedSubscript:@"LearningModulationMaskSkinGapModulationWeight"];
    if (v303)
    {
      v304 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      uint64_t v2 = [v304 objectForKeyedSubscript:@"LearningModulationMaskSkinGapModulationWeight"];
      [v2 floatValue];
    }
    else
    {
      v304 = [*v8 styleTransferConfig];
      [v304 learningModulationMaskSkinGapModulationWeight];
    }
    int v306 = v305;
    v307 = [*v8 styleTransferConfig];
    LODWORD(v308) = v306;
    [v307 setLearningModulationMaskSkinGapModulationWeight:v308];

    if (v303) {
    objc_msgSend(*(id *)(a1 + 480), "setSpatialGridHeight:", objc_msgSend(*(id *)(a1 + 480), "spatialGridHeight"));
    }
    objc_msgSend(*(id *)(a1 + 480), "setSpatialGridWidth:", objc_msgSend(*(id *)(a1 + 480), "spatialGridWidth"));
    [*(id *)(a1 + 480) foregroundMixFactorThreshold];
    objc_msgSend(*(id *)(a1 + 480), "setForegroundMixFactorThreshold:");
    [*(id *)(a1 + 480) numCorrectionDirectionWhitePointSamples];
    objc_msgSend(*(id *)(a1 + 480), "setNumCorrectionDirectionWhitePointSamples:");
    objc_msgSend(*(id *)(a1 + 480), "setCastStrengthMetricNumHistogramBins:", objc_msgSend(*(id *)(a1 + 480), "castStrengthMetricNumHistogramBins"));
    [*(id *)(a1 + 480) castStrengthMetricMaxDeltaEuv];
    objc_msgSend(*(id *)(a1 + 480), "setCastStrengthMetricMaxDeltaEuv:");
    [*(id *)(a1 + 480) castStrengthMetricMinSampleRatio];
    objc_msgSend(*(id *)(a1 + 480), "setCastStrengthMetricMinSampleRatio:");
    [*(id *)(a1 + 480) castStrengthMetricSummaryPercentile];
    objc_msgSend(*(id *)(a1 + 480), "setCastStrengthMetricSummaryPercentile:");
    objc_msgSend(*(id *)(a1 + 480), "castCorrectionStrengthThreshold_Imperceptible");
    objc_msgSend(*(id *)(a1 + 480), "setCastCorrectionStrengthThreshold_Imperceptible:");
    objc_msgSend(*(id *)(a1 + 480), "castCorrectionStrengthThreshold_Mild");
    objc_msgSend(*(id *)(a1 + 480), "setCastCorrectionStrengthThreshold_Mild:");
    objc_msgSend(*(id *)(a1 + 480), "castCorrectionStrengthThreshold_Medium");
    objc_msgSend(*(id *)(a1 + 480), "setCastCorrectionStrengthThreshold_Medium:");
    objc_msgSend(*(id *)(a1 + 480), "castCorrectionStrengthThreshold_Strong");
    objc_msgSend(*(id *)(a1 + 480), "setCastCorrectionStrengthThreshold_Strong:");
    *(unsigned char *)(a1 + 496) = 1;
  }

  return 0;
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (__CVBuffer)outputImagePixelBuffer
{
  return self->_outputImagePixelBuffer;
}

- (void)setOutputImagePixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)outputImageMetadata
{
  return self->_outputImageMetadata;
}

- (void)setOutputImageMetadata:(id)a3
{
}

- (__CVBuffer)linearOutputImagePixelBuffer
{
  return self->_linearOutputImagePixelBuffer;
}

- (void)setLinearOutputImagePixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)linearOutputImageMetadata
{
  return self->_linearOutputImageMetadata;
}

- (void)setLinearOutputImageMetadata:(id)a3
{
}

- (CMISoftwareFlashRenderingProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CMISoftwareFlashRenderingProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linearOutputImageMetadata, 0);
  objc_storeStrong((id *)&self->_outputImageMetadata, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsProcessor, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsConfig, 0);
  objc_storeStrong((id *)&self->_proRawGlobalWhitePointProcessor, 0);
  objc_storeStrong((id *)&self->_proRawGlobalWhitePointConfig, 0);
  objc_storeStrong((id *)&self->_softwareFlashRenderingCoreProcessor, 0);
  objc_storeStrong((id *)&self->_softwareFlashRenderingCoreConfig, 0);
  __destructor_16_AB0s128n2_S_s0_s8_s96_s104_s112_AE_s256_s264_s272_s280_s288((uint64_t)&self->_processorData);
  objc_storeStrong((id *)&self->_flashFrameParams, 0);
  objc_storeStrong((id *)&self->_ambientFrameParams, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end