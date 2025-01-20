@interface SoftISPProcessor
+ (BOOL)_isPipelineTypeValid:(int)a3;
+ (NSSet)allSupportedPipelineTypes;
+ (void)initialize;
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForPipeline:(int)a3 auxiliaryType:(int)a4 inputPixelFormat:(unsigned int)a5 width:(unsigned int)a6 height:(unsigned int)a7;
- (BOOL)supportsExternalMemoryResource;
- (CMIExternalMemoryResource)externalMemoryResource;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)moduleCalibrationByPortType;
- (NSDictionary)outputCompressionLevelByPipeline;
- (NSDictionary)tuningParameters;
- (NSFastEnumeration)supportedPipelineTypes;
- (NSString)description;
- (SoftISPProcessor)init;
- (SoftISPProcessorDelegate)delegate;
- (id)externalMemoryDescriptorForConfiguration:(id)a3;
- (int)_outputCompressionLevelForPipeline:(int)a3;
- (int)_processInputFrame:(id)a3 isFinalPass:(BOOL)a4;
- (int)_processInputFrames:(id)a3 isFinalPass:(BOOL)a4;
- (int)addFrame:(opaqueCMSampleBuffer *)a3 uniqueID:(unint64_t)a4;
- (int)addFrame:(opaqueCMSampleBuffer *)a3 uniqueID:(unint64_t)a4 processingOptions:(id)a5;
- (int)deviceGeneration;
- (int)finishProcessing;
- (int)pipelineType;
- (int)prepareToProcess:(int)a3 prepareDescriptor:(id)a4;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)processIfPossible;
- (int)purgeResources;
- (int)resetState;
- (int)setReferenceFrameByUniqueID:(unint64_t)a3;
- (int)setup;
- (int)tuningFlagForProcessingOption:(id)a3 tuningType:(int)a4 metadata:(id)a5;
- (unint64_t)outputDownscaleFactorForPipeline:(int)a3;
- (unsigned)auxiliaryPixelFormatForPipeline:(int)a3 auxiliaryType:(int)a4 inputPixelFormat:(unsigned int)a5;
- (unsigned)outputPixelFormatForPipeline:(int)a3 inputPixelFormat:(unsigned int)a4;
- (void)_clearInputFrames;
- (void)_readDefaults;
- (void)finishScheduling;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceGeneration:(int)a3;
- (void)setExternalMemoryResource:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setModuleCalibrationByPortType:(id)a3;
- (void)setOutputCompressionLevelByPipeline:(id)a3;
- (void)setSupportedPipelineTypes:(id)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation SoftISPProcessor

- (unsigned)outputPixelFormatForPipeline:(int)a3 inputPixelFormat:(unsigned int)a4
{
  if (!self->_pipelines) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (!+[SoftISPProcessor _isPipelineTypeValid:](SoftISPProcessor, "_isPipelineTypeValid:")) {
    goto LABEL_5;
  }
  pipelines = self->_pipelines;
  v8 = [NSNumber numberWithUnsignedInt:v5];
  v9 = [(NSDictionary *)pipelines objectForKeyedSubscript:v8];

  if (v9)
  {
    unsigned int v10 = objc_msgSend(v9, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", v4, -[SoftISPProcessor _outputCompressionLevelForPipeline:](self, "_outputCompressionLevelForPipeline:", v5));

    return v10;
  }
  else
  {
LABEL_5:
    return FigSignalErrorAt();
  }
}

- (int)_outputCompressionLevelForPipeline:(int)a3
{
  outputCompressionLevelByPipeline = self->_outputCompressionLevelByPipeline;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  uint64_t v5 = [(NSDictionary *)outputCompressionLevelByPipeline objectForKeyedSubscript:v4];

  if (v5) {
    int v6 = [v5 intValue];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

+ (BOOL)_isPipelineTypeValid:(int)a3
{
  v3 = (void *)__allSupportedPipelineTypes;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  LOBYTE(v3) = [v3 containsObject:v4];

  return (char)v3;
}

- (int)setup
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  inputFrames = self->_inputFrames;
  self->_inputFrames = v4;

  if (!self->_inputFrames) {
    goto LABEL_11;
  }
  int v6 = (FigMetalContext *)[objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v3 andOptionalCommandQueue:self->_metalCommandQueue];
  metal = self->_metal;
  self->_metal = v6;

  v8 = self->_metal;
  if (!v8) {
    goto LABEL_11;
  }
  [(FigMetalContext *)v8 setAllowCommandBufferCommitsOnlyByForceCommit:1];
  v9 = [(FigMetalContext *)self->_metal commandQueue];
  metalCommandQueue = self->_metalCommandQueue;
  self->_metalCommandQueue = v9;

  if (!self->_metalCommandQueue) {
    goto LABEL_11;
  }
  id v11 = objc_alloc(MEMORY[0x263F2EE10]);
  v12 = [(FigMetalContext *)self->_metal device];
  v13 = (void *)[v11 initWithDevice:v12 allocatorType:2];
  [(FigMetalContext *)self->_metal setAllocator:v13];

  v14 = [(FigMetalContext *)self->_metal allocator];

  if (!v14) {
    goto LABEL_11;
  }
  self->_allocatorSize = 0;
  [(SoftISPProcessor *)self _readDefaults];
  if (!self->_cameraInfoByPortType) {
    goto LABEL_11;
  }
  v15 = [[SoftISPStaticParameters alloc] initWithCameraInfoByPortType:self->_cameraInfoByPortType tuningParameters:self->_tuningParameters moduleCalibrationByPortType:self->_moduleCalibrationByPortType metalContext:self->_metal deviceGeneration:self->_deviceGeneration];
  staticParameters = self->_staticParameters;
  self->_staticParameters = v15;

  v17 = self->_staticParameters;
  if (!v17) {
    goto LABEL_11;
  }
  createPipelines(self->_supportedPipelineTypes, self->_metal, v17);
  v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  pipelines = self->_pipelines;
  self->_pipelines = v18;

  if (self->_pipelines)
  {
    [(SoftISPProcessor *)self resetState];
    int v20 = 0;
  }
  else
  {
LABEL_11:
    int v20 = FigSignalErrorAt();
  }

  return v20;
}

- (void)setTuningParameters:(id)a3
{
  objc_msgSend(a3, "cmi_dictionary");
  self->_tuningParameters = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x270F9A758]();
}

- (void)setSupportedPipelineTypes:(id)a3
{
}

- (void)setOutputCompressionLevelByPipeline:(id)a3
{
}

- (void)setModuleCalibrationByPortType:(id)a3
{
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (void)setDeviceGeneration:(int)a3
{
  self->_deviceGeneration = a3;
}

- (void)setCameraInfoByPortType:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    cameraInfoByPortType = self->_cameraInfoByPortType;
    p_cameraInfoByPortType = &self->_cameraInfoByPortType;
    uint64_t v5 = cameraInfoByPortType;
    if (cameraInfoByPortType) {
      [(NSDictionary *)v5 isEqualToDictionary:v8];
    }
    objc_storeStrong((id *)p_cameraInfoByPortType, a3);
  }
  else
  {
    FigSignalErrorAt();
  }
}

- (int)resetState
{
  [(FigMetalContext *)self->_metal waitForSchedule];
  objc_storeWeak((id *)&self->_delegate, 0);
  [(SoftISPProcessor *)self _clearInputFrames];
  v3 = [(FigMetalContext *)self->_metal allocator];
  [v3 reset];

  return 0;
}

- (SoftISPProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)SoftISPProcessor;
  v2 = [(SoftISPProcessor *)&v6 init];
  v3 = v2;
  if (v2
    && (objc_storeStrong((id *)&v2->_supportedPipelineTypes, (id)__allFastPipelineTypes), v3->_supportedPipelineTypes))
  {
    uint64_t v4 = v3;
  }
  else
  {
    FigDebugAssert3();
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_readDefaults
{
  self->_allocatorForceSize = 0;
  self->_allocatorWireMemory = 0;
}

- (void)_clearInputFrames
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_inputFrames;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if (!-[SoftISPInputFrame processed](v8)) {
          -[SoftISPInputFrame frameID](v8);
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_inputFrames removeAllObjects];
}

+ (void)initialize
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", &unk_270E98968, &unk_270E98980, &unk_270E98998, &unk_270E989B0, &unk_270E989C8, &unk_270E989E0, &unk_270E989F8, &unk_270E98A10, &unk_270E98A28, &unk_270E98A40, &unk_270E98A58, &unk_270E98A70, &unk_270E98A88, &unk_270E98AA0, &unk_270E98AB8, &unk_270E98AD0, &unk_270E98AE8,
         &unk_270E98B00,
         &unk_270E98B18,
         &unk_270E98B30,
         0);
  v3 = (void *)__allFastPipelineTypes;
  __allFastPipelineTypes = v2;

  uint64_t v4 = (void *)__allFastPipelineTypes;

  objc_storeStrong((id *)&__allSupportedPipelineTypes, v4);
}

- (int)prewarm
{
  return 0;
}

+ (NSSet)allSupportedPipelineTypes
{
  return (NSSet *)(id)__allSupportedPipelineTypes;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@(currentConfig=%@, currentPipeline=%@, inputFrames=%@)", v5, self->_currentConfig, self->_currentPipeline, self->_inputFrames];

  return (NSString *)v6;
}

- (int)purgeResources
{
  int v2 = [(SoftISPProcessor *)self resetState];
  if (v2) {
    FigDebugAssert3();
  }
  return v2;
}

- (unsigned)auxiliaryPixelFormatForPipeline:(int)a3 auxiliaryType:(int)a4 inputPixelFormat:(unsigned int)a5
{
  if (!self->_pipelines) {
    goto LABEL_5;
  }
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (!+[SoftISPProcessor _isPipelineTypeValid:](SoftISPProcessor, "_isPipelineTypeValid:")) {
    goto LABEL_5;
  }
  pipelines = self->_pipelines;
  long long v10 = [NSNumber numberWithUnsignedInt:v7];
  long long v11 = [(NSDictionary *)pipelines objectForKeyedSubscript:v10];

  if (v11)
  {
    unsigned int v12 = objc_msgSend(v11, "auxiliaryPixelFormatForAuxiliaryType:inputPixelFormat:outputCompressionLevel:", v6, v5, -[SoftISPProcessor _outputCompressionLevelForPipeline:](self, "_outputCompressionLevelForPipeline:", v7));

    return v12;
  }
  else
  {
LABEL_5:
    FigSignalErrorAt();
    return 0;
  }
}

- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForPipeline:(int)a3 auxiliaryType:(int)a4 inputPixelFormat:(unsigned int)a5 width:(unsigned int)a6 height:(unsigned int)a7
{
  if (!self->_pipelines) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  if (!+[SoftISPProcessor _isPipelineTypeValid:](SoftISPProcessor, "_isPipelineTypeValid:")) {
    goto LABEL_5;
  }
  pipelines = self->_pipelines;
  uint64_t v14 = [NSNumber numberWithUnsignedInt:v11];
  v15 = [(NSDictionary *)pipelines objectForKeyedSubscript:v14];

  if (v15)
  {
    $F61E096109CF133FD2477F48C7D0CEE7 v16 = ($F61E096109CF133FD2477F48C7D0CEE7)[v15 auxiliaryPixelBufferSizeForAuxiliaryType:v10 inputPixelFormat:v9 width:v8 height:v7];

    return v16;
  }
  else
  {
LABEL_5:
    FigSignalErrorAt();
    return ($F61E096109CF133FD2477F48C7D0CEE7)0;
  }
}

- (unint64_t)outputDownscaleFactorForPipeline:(int)a3
{
  if (!self->_pipelines) {
    return (int)FigSignalErrorAt();
  }
  uint64_t v3 = *(void *)&a3;
  if (!+[SoftISPProcessor _isPipelineTypeValid:](SoftISPProcessor, "_isPipelineTypeValid:")) {
    return (int)FigSignalErrorAt();
  }
  pipelines = self->_pipelines;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v7 = [(NSDictionary *)pipelines objectForKeyedSubscript:v6];

  if (!v7) {
    return (int)FigSignalErrorAt();
  }
  unint64_t v8 = [v7 outputDownscaleFactor];

  return v8;
}

- (int)pipelineType
{
  return self->_currentPipelineType;
}

- (BOOL)supportsExternalMemoryResource
{
  return 1;
}

- (id)externalMemoryDescriptorForConfiguration:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 processorSpecificOptions];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"PrepareDescriptorByPipelineType"];

  if (v6)
  {
    id v21 = v4;
    context = (void *)MEMORY[0x263E64AA0]();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v14 = [v7 objectForKeyedSubscript:v13];
          v15 = [(NSDictionary *)self->_pipelines objectForKeyedSubscript:v13];
          $F61E096109CF133FD2477F48C7D0CEE7 v16 = objc_msgSend(v15, "configForPrepareDescriptor:outputCompressionLevel:", v14, -[SoftISPProcessor _outputCompressionLevelForPipeline:](self, "_outputCompressionLevelForPipeline:", objc_msgSend(v13, "intValue")));
          if (v16 && v10 <= [v15 bytesRequiredForConfig:v16]) {
            unint64_t v10 = [v15 bytesRequiredForConfig:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v10 = 0;
    }

    v17 = objc_opt_new();
    v18 = v17;
    id v4 = v21;
    if (v17)
    {
      [v17 setMemSize:v10];
      [v18 setAllocatorType:2];
    }
    else
    {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    v18 = 0;
  }

  return v18;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return -73724;
}

- (int)prepareToProcess:(int)a3 prepareDescriptor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (!self->_pipelines) {
    goto LABEL_30;
  }
  if (!+[SoftISPProcessor _isPipelineTypeValid:v4]) {
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_30;
  }
  self->_enableCMIResource = [v6 cmiResourceEnabled];
  pipelines = self->_pipelines;
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v4];
  uint64_t v9 = [(NSDictionary *)pipelines objectForKeyedSubscript:v8];
  currentPipeline = self->_currentPipeline;
  self->_currentPipeline = v9;

  uint64_t v11 = self->_currentPipeline;
  if (!v11) {
    goto LABEL_30;
  }
  self->_currentPipelineType = v4;
  unsigned int v12 = [(SoftISPStage *)v11 configForPrepareDescriptor:v6 outputCompressionLevel:[(SoftISPProcessor *)self _outputCompressionLevelForPipeline:v4]];
  currentConfig = self->_currentConfig;
  self->_currentConfig = v12;

  if (!self->_currentConfig) {
    goto LABEL_30;
  }
  unint64_t v14 = -[SoftISPStage bytesRequiredForConfig:](self->_currentPipeline, "bytesRequiredForConfig:");
  if (v14 == -1)
  {
    FigDebugAssert3();
    goto LABEL_30;
  }
  unint64_t v15 = v14;
  if (v14 > self->_allocatorSize)
  {
    $F61E096109CF133FD2477F48C7D0CEE7 v16 = [(FigMetalContext *)self->_metal allocator];

    if (v16)
    {
      v17 = objc_opt_new();
      v18 = v17;
      if (v17)
      {
        [v17 setWireMemory:self->_allocatorWireMemory];
        [v18 setLabel:@"FigMetalAllocator_SoftISP"];
        [v18 setAllocationHint:1];
        if (self->_externalMemoryResource
          && [(SoftISPProcessor *)self supportsExternalMemoryResource])
        {
          v19 = [(CMIExternalMemoryResource *)self->_externalMemoryResource allocatorBackend];
          int v20 = v19;
          if (v19)
          {
            if ([v19 memSize] < v15)
            {
              int v22 = 0;
            }
            else
            {
              objc_msgSend(v18, "setMemSize:", objc_msgSend(v20, "memSize"));
              id v21 = [(FigMetalContext *)self->_metal allocator];
              int v22 = [v21 setupWithDescriptor:v18 allocatorBackend:v20];

              if (!v22)
              {
                self->_allocatorSize = [v20 memSize];

LABEL_22:
                goto LABEL_23;
              }
              FigDebugAssert3();
              FigSignalErrorAt();
            }
          }
          else
          {
            int v22 = FigSignalErrorAt();
          }

          goto LABEL_38;
        }
        if (!self->_enableCMIResource)
        {
          if (v15 <= self->_allocatorForceSize) {
            unint64_t allocatorForceSize = self->_allocatorForceSize;
          }
          else {
            unint64_t allocatorForceSize = v15;
          }
          [v18 setMemSize:allocatorForceSize];
          long long v24 = [(FigMetalContext *)self->_metal allocator];
          int v22 = [v24 setupWithDescriptor:v18];

          if (!v22)
          {
            self->_allocatorSize = allocatorForceSize;
            goto LABEL_22;
          }
          FigSignalErrorAt();
LABEL_38:

          goto LABEL_24;
        }
      }
      else
      {
        FigDebugAssert3();
      }
      int v22 = FigSignalErrorAt();
      goto LABEL_38;
    }
LABEL_30:
    int v22 = FigSignalErrorAt();
    goto LABEL_24;
  }
LABEL_23:
  int v22 = 0;
  self->_currentSensorID = [v6 sensorID];
LABEL_24:

  return v22;
}

- (int)addFrame:(opaqueCMSampleBuffer *)a3 uniqueID:(unint64_t)a4 processingOptions:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (_DWORD *)MEMORY[0x263F00E10];
  if (!a3)
  {
    int v22 = FigSignalErrorAt();

    goto LABEL_12;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CVPixelBufferGetWidthOfPlane(ImageBuffer, 0);
  CVPixelBufferGetHeightOfPlane(ImageBuffer, 0);
  if (*v9 == 1) {
    kdebug_trace();
  }
  uint64_t v11 = [(SoftISPStage *)self->_currentPipeline bytesRequiredForConfig:self->_currentConfig];
  if (v11 == -1)
  {
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
LABEL_20:

    goto LABEL_12;
  }
  unint64_t v12 = v11;
  v13 = [(FigMetalContext *)self->_metal allocator];
  unint64_t v14 = [v13 memSize];

  if (v12 > v14)
  {
    int v22 = FigSignalErrorAt();
LABEL_22:

    goto LABEL_23;
  }
  if (v8)
  {
    unint64_t v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
    $F61E096109CF133FD2477F48C7D0CEE7 v16 = [v15 persistentDomainForName:@"com.apple.coremedia"];
    v17 = [v16 objectForKeyedSubscript:@"softisp_overrides"];

    if (!v17)
    {
LABEL_10:
      int v20 = [[SoftISPInputFrame alloc] initWithSampleBuffer:a3 uniqueID:a4 processingOptions:v8];
      uint64_t v9 = (_DWORD *)MEMORY[0x263F00E10];
      if (v20)
      {
        id v21 = v20;
        [(NSMutableArray *)self->_inputFrames addObject:v20];

        int v22 = 0;
        goto LABEL_12;
      }
      int v22 = FigSignalErrorAt();

      goto LABEL_20;
    }
    v18 = (void *)[v8 mutableCopy];
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v18, "cmi_mergeEntriesFromDictionary:", v17);

      id v8 = v19;
      goto LABEL_10;
    }
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();

    goto LABEL_22;
  }
  int v22 = FigSignalErrorAt();
LABEL_23:
  uint64_t v9 = (_DWORD *)MEMORY[0x263F00E10];
LABEL_12:
  if (*v9 == 1) {
    kdebug_trace();
  }
  return v22;
}

- (int)addFrame:(opaqueCMSampleBuffer *)a3 uniqueID:(unint64_t)a4
{
  return [(SoftISPProcessor *)self addFrame:a3 uniqueID:a4 processingOptions:MEMORY[0x263EFFA78]];
}

- (int)setReferenceFrameByUniqueID:(unint64_t)a3
{
  if (self->_currentPipeline)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 0;
    }
    int v5 = [(SoftISPStage *)self->_currentPipeline setReferenceFrameByUniqueID:a3];
    if (v5) {
      FigDebugAssert3();
    }
    return v5;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (int)processIfPossible
{
  int result = [(SoftISPProcessor *)self _processInputFrames:self->_inputFrames isFinalPass:0];
  if (result)
  {
    return FigSignalErrorAt();
  }
  return result;
}

- (int)process
{
  if (-[SoftISPProcessor _processInputFrames:isFinalPass:](self, "_processInputFrames:isFinalPass:", self->_inputFrames, 1)|| (-[FigMetalContext allocator](self->_metal, "allocator"), v3 = objc_claimAutoreleasedReturnValue(), uint64_t v4 = [v3 usedSizeAll], v3, v4))
  {
    int v5 = FigSignalErrorAt();
  }
  else
  {
    int v5 = 0;
  }
  [(SoftISPProcessor *)self _clearInputFrames];
  return v5;
}

- (int)tuningFlagForProcessingOption:(id)a3 tuningType:(int)a4 metadata:(id)a5
{
  return [(SoftISPStaticParameters *)self->_staticParameters tuningFlagForProcessingOption:a3 tuningType:*(void *)&a4 metadata:a5];
}

- (void)finishScheduling
{
}

- (int)finishProcessing
{
  return 0;
}

- (int)_processInputFrame:(id)a3 isFinalPass:(BOOL)a4
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (!v6
    || -[SoftISPInputFrame processed]((BOOL)v6)
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate), WeakRetained, !WeakRetained)
    || !self->_currentPipeline
    || !self->_currentConfig
    || !self->_pipelines
    || (uint64_t v9 = [[SoftISPOutputFrame alloc] initWithInputFrame:v7 maximumOutputDimensions:[(SoftISPConfig *)self->_currentConfig maximumOutputDimensions] outputDownscaleFactor:[(SoftISPStage *)self->_currentPipeline outputDownscaleFactor] parentProcessor:self]) == 0)
  {
    uint64_t v96 = FigSignalErrorAt();
    v67 = 0;
    v51 = 0;
    int v20 = 0;
    goto LABEL_93;
  }
  unint64_t v10 = v9;
  [(SoftISPOutputFrame *)v9 setEnableCMIResource:self->_enableCMIResource];
  if ([(SoftISPConfig *)self->_currentConfig validateInputFrame:v7]) {
    goto LABEL_91;
  }
  int v11 = [(SoftISPStage *)self->_currentPipeline validateInputFrame:v7 config:self->_currentConfig];
  if (!a4 && v11 == -73675)
  {
    int v20 = v10;
    v67 = 0;
    v51 = 0;
    id obj = 0;
    v53 = 0;
    int v22 = 0;
    uint64_t v96 = 0;
    goto LABEL_82;
  }
  if (v11)
  {
LABEL_91:
    int v20 = v10;
    uint64_t v96 = FigSignalErrorAt();
    v67 = 0;
    v51 = 0;
LABEL_93:
    id obj = 0;
    v53 = 0;
    int v22 = 0;
    goto LABEL_82;
  }
  location = (id *)&self->_delegate;
  char v12 = [(SoftISPConfig *)self->_currentConfig outputPixelFormat] == 1380411457
     || [(SoftISPConfig *)self->_currentConfig outputPixelFormat] == 2085775425
     || [(SoftISPConfig *)self->_currentConfig outputPixelFormat] == 793929793
     || [(SoftISPConfig *)self->_currentConfig outputPixelFormat] == 760375361
     || [(SoftISPConfig *)self->_currentConfig outputPixelFormat] == 642934849;
  int v13 = -[SoftISPOutputFrame outputDownscaleFactor]((uint64_t)v10);
  unsigned int v14 = (-[SoftISPInputFrame quadraBinningFactor]((uint64_t)v7) * v13) << v12;
  id v15 = objc_loadWeakRetained(location);
  uint64_t v16 = -[SoftISPInputFrame uniqueID]((uint64_t)v7);
  uint64_t v17 = [(SoftISPConfig *)self->_currentConfig outputPixelFormat];
  -[SoftISPOutputFrame outputBufferRectWithinSensorCropRect]((uint64_t)v10);
  uint64_t v19 = v18 / v14;
  int v20 = v10;
  -[SoftISPOutputFrame outputBufferRectWithinSensorCropRect]((uint64_t)v10);
  int v22 = (__CVBuffer *)[v15 newOutputPixelBufferForUniqueID:v16 pixelFormat:v17 width:v19 height:v21 / v14];

  if (!v22)
  {
LABEL_95:
    uint64_t v96 = FigSignalErrorAt();
    v67 = 0;
    v51 = 0;
    id obj = 0;
    v53 = 0;
    goto LABEL_82;
  }
  if (isVersatilePixelFormat([(SoftISPConfig *)self->_currentConfig outputPixelFormat]))
  {
    long long v23 = (__CVBuffer *)-[SoftISPInputFrame pixelBuffer]((uint64_t)v7);
    long long v24 = -[SoftISPInputFrame metadata]((uint64_t)v7);
    LODWORD(v23) = determineFirstPixel(v23, v24);

    long long v25 = (__CVBuffer *)-[SoftISPInputFrame pixelBuffer]((uint64_t)v7);
    v26 = -[SoftISPInputFrame metadata]((uint64_t)v7);
    unsigned int v27 = determineCFALayout(v25, v26);

    switch((int)v23)
    {
      case 0:
        if (v27 == 3) {
          goto LABEL_95;
        }
        id v28 = &unk_270E98B48;
        break;
      case 1:
        v29 = &unk_270E98B60;
        v30 = &unk_270E98A28;
        goto LABEL_24;
      case 2:
        v29 = &unk_270E98B78;
        v30 = &unk_270E98998;
LABEL_24:
        if (v27 == 3) {
          v29 = v30;
        }
        id v28 = v29;
        break;
      case 3:
        if (v27 == 3) {
          goto LABEL_95;
        }
        id v28 = &unk_270E98B90;
        break;
      default:
        goto LABEL_30;
    }
    CVBufferSetAttachment(v22, (CFStringRef)*MEMORY[0x263F04238], v28, kCVAttachmentMode_ShouldPropagate);
  }
LABEL_30:
  [(SoftISPOutputFrame *)v10 setPixelBuffer:v22];
  CVPixelBufferRelease(v22);
  v31 = -[SoftISPInputFrame processingOptions]((uint64_t)v7);
  v32 = [v31 objectForKeyedSubscript:@"SoftISPAuxiliaryType"];

  v108 = self;
  v103 = v32;
  if (v32)
  {
    uint64_t v105 = (uint64_t)v7;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id obj = v32;
    uint64_t v33 = [obj countByEnumeratingWithState:&v109 objects:v113 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v110;
      while (2)
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v110 != v35) {
            objc_enumerationMutation(obj);
          }
          v37 = *(void **)(*((void *)&v109 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_90:
            uint64_t v96 = FigSignalErrorAt();

            v67 = 0;
            v51 = 0;
            v53 = 0;
            int v22 = 0;
            id v7 = (void *)v105;
            self = v108;
            int v20 = v10;
            goto LABEL_82;
          }
          uint64_t v38 = [v37 unsignedIntValue];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = [(SoftISPProcessor *)v108 auxiliaryPixelFormatForPipeline:v108->_currentPipelineType auxiliaryType:v38 inputPixelFormat:[(SoftISPConfig *)v108->_currentConfig inputPixelFormat]];
            currentPipeline = v108->_currentPipeline;
            uint64_t v42 = [(SoftISPConfig *)v108->_currentConfig inputPixelFormat];
            -[SoftISPOutputFrame outputBufferRectWithinSensorCropRect]((uint64_t)v10);
            uint64_t v44 = v43 / v14;
            -[SoftISPOutputFrame outputBufferRectWithinSensorCropRect]((uint64_t)v10);
            unint64_t v46 = [(SoftISPStage *)currentPipeline auxiliaryPixelBufferSizeForAuxiliaryType:v39 inputPixelFormat:v42 width:v44 height:v45 / v14];
            if (v40)
            {
              uint64_t v47 = v46;
              if (v46)
              {
                unint64_t v48 = HIDWORD(v46);
                if (HIDWORD(v46))
                {
                  id v49 = objc_loadWeakRetained(location);
                  v50 = (__CVBuffer *)[v49 newOutputAuxiliaryPixelBufferForUniqueID:-[SoftISPInputFrame uniqueID](v105) pixelFormat:v40 width:v47 height:v48];

                  if (!v50) {
                    goto LABEL_90;
                  }
                  [(SoftISPOutputFrame *)v10 setAuxiliaryPixelBuffer:v50 auxiliaryType:v39];
                  CVPixelBufferRelease(v50);
                }
              }
            }
          }
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v109 objects:v113 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }

    id v7 = (void *)v105;
    self = v108;
  }
  int v20 = v10;
  if (-[SoftISPConfig validateOutputFrame:](self->_currentConfig, "validateOutputFrame:", v10, v103))
  {
    uint64_t v96 = FigSignalErrorAt();
    v67 = 0;
    v51 = 0;
    v53 = 0;
    goto LABEL_102;
  }
  v51 = [[SoftISPBounds alloc] initWithInputFrame:v7 outputFrame:v10 quadraBinned:0];
  if (!v51)
  {
    uint64_t v96 = FigSignalErrorAt();
    v67 = 0;
    v53 = 0;
    int v22 = 0;
    id obj = v104;
    int v20 = v10;
    goto LABEL_82;
  }
  v52 = -[SoftISPInputFrame metadata]((uint64_t)v7);
  v53 = (void *)[v52 mutableCopy];

  v54 = -[SoftISPInputFrame processingOptions]((uint64_t)v7);
  int v55 = objc_msgSend(v54, "cmi_BOOLValueForKey:defaultValue:found:", @"Aux", 0, 0);

  if (v55) {
    [v53 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F2F628]];
  }
  v56 = [NSNumber numberWithInt:-[SoftISPInputFrame pipelineBlackLevel]((uint64_t)v7)];
  [v53 setObject:v56 forKeyedSubscript:*MEMORY[0x263F2F388]];

  -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v51);
  -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v51);
  -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v51);
  -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v51);
  -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v51);
  -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v51);
  -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v51);
  -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v51);
  v57 = (__CVBuffer *)-[SoftISPInputFrame pixelBuffer]((uint64_t)v7);
  CVPixelBufferGetWidth(v57);
  v58 = (__CVBuffer *)-[SoftISPInputFrame pixelBuffer]((uint64_t)v7);
  CVPixelBufferGetHeight(v58);
  CVPixelBufferGetWidth([(SoftISPOutputFrame *)v10 pixelBuffer]);
  CVPixelBufferGetHeight([(SoftISPOutputFrame *)v10 pixelBuffer]);
  FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop();
  v59 = [v53 objectForKeyedSubscript:*MEMORY[0x263F2F668]];
  int v60 = [v59 intValue];

  if (v60 == 2068)
  {
    FigCaptureMetadataUtilitiesNormalizeCropRect();
    FigCaptureMetadataUtilitiesUpdateDetectedObjectsInfoAndFacesArrayWithCropRect();
  }
  v61 = [v53 objectForKeyedSubscript:*MEMORY[0x263F2EFB0]];
  [v53 setObject:v61 forKeyedSubscript:*MEMORY[0x263F2EFB8]];

  [(SoftISPOutputFrame *)v10 setMetadata:v53];
  id v62 = objc_loadWeakRetained(location);
  char v63 = objc_opt_respondsToSelector();

  if (v63)
  {
    id v64 = objc_loadWeakRetained(location);
    [v64 notifyProcessInputFrameForUniqueID:-[SoftISPInputFrame uniqueID]((uint64_t)v7)];
  }
  self = v108;
  if (-[SoftISPInputFrame bindTexturesForConfig:metalContext:]((uint64_t)v7, v108->_currentConfig, v108->_metal))goto LABEL_87; {
  currentConfig = v108->_currentConfig;
  }
  metal = v108->_metal;
  if (!v108->_enableCMIResource)
  {
    if (![(SoftISPOutputFrame *)v10 bindTexturesForConfig:currentConfig metalContext:metal])goto LABEL_57; {
LABEL_87:
    }
    int v20 = v10;
    uint64_t v96 = FigSignalErrorAt();
    v67 = 0;
    goto LABEL_102;
  }
  if ([(SoftISPOutputFrame *)v10 allocateTexturesForConfig:currentConfig metalContext:metal])
  {
    goto LABEL_87;
  }
LABEL_57:
  v67 = [(SoftISPStage *)v108->_currentPipeline createArgsWithConfig:v108->_currentConfig bounds:v51 inputFrame:v7 outputFrame:v10];
  if (v67)
  {
    if (objc_opt_respondsToSelector())
    {
      v68 = -[SoftISPInputFrame textures]((uint64_t)v7);
      uint64_t v69 = [v68 count];

      if (v69)
      {
        v70 = -[SoftISPInputFrame textures]((uint64_t)v7);
        v71 = [v70 objectAtIndexedSubscript:0];
        [v67 setInputTex:v71];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v72 = -[SoftISPInputFrame textures]((uint64_t)v7);
      uint64_t v73 = [v72 count];

      if (v73)
      {
        v74 = -[SoftISPInputFrame textures]((uint64_t)v7);
        v75 = [v74 objectAtIndexedSubscript:0];
        [v67 setInputLumaTex:v75];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v76 = -[SoftISPInputFrame textures]((uint64_t)v7);
      unint64_t v77 = [v76 count];

      if (v77 >= 2)
      {
        v78 = -[SoftISPInputFrame textures]((uint64_t)v7);
        v79 = [v78 objectAtIndexedSubscript:1];
        [v67 setInputChromaTex:v79];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v80 = [(SoftISPOutputFrame *)v10 textures];
      uint64_t v81 = [v80 count];

      if (v81)
      {
        v82 = [(SoftISPOutputFrame *)v10 textures];
        v83 = [v82 objectAtIndexedSubscript:0];
        [v67 setOutputTex:v83];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v84 = [(SoftISPOutputFrame *)v10 textures];
      uint64_t v85 = [v84 count];

      if (v85)
      {
        v86 = [(SoftISPOutputFrame *)v10 textures];
        v87 = [v86 objectAtIndexedSubscript:0];
        [v67 setOutputLumaTex:v87];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v88 = [(SoftISPOutputFrame *)v10 textures];
      unint64_t v89 = [v88 count];

      if (v89 >= 2)
      {
        v90 = [(SoftISPOutputFrame *)v10 textures];
        v91 = [v90 objectAtIndexedSubscript:1];
        [v67 setOutputChromaTex:v91];
      }
    }
    if ([(SoftISPStage *)v108->_currentPipeline runWithArgs:v67])
    {
      int v20 = v10;
    }
    else
    {
      v92 = [(SoftISPOutputFrame *)v10 commandBuffer];

      if (v92)
      {
        [(FigMetalContext *)v108->_metal waitForSchedule];
        -[SoftISPInputFrame setProcessed:]((uint64_t)v7, 1);
        -[SoftISPInputFrame releaseInputResources]((uint64_t)v7);
        [(SoftISPOutputFrame *)v10 setError:0];
        [v67 setOutputTex:0];
        [v67 setOutputLumaTex:0];
        [v67 setOutputChromaTex:0];
        id v93 = objc_loadWeakRetained(location);
        char v94 = objc_opt_respondsToSelector();

        if (v94)
        {
          id v95 = objc_loadWeakRetained(location);
          [v95 outputFrameEnqueued:v10];
        }
        int v20 = v10;
        [(SoftISPOutputFrame *)v10 signalAllCommandBuffersEnqueued];
        int v22 = 0;
        uint64_t v96 = 0;
        goto LABEL_81;
      }
      int v20 = v10;
    }
  }
  else
  {
    int v20 = v10;
  }
  uint64_t v96 = FigSignalErrorAt();
LABEL_102:
  int v22 = 0;
LABEL_81:
  id obj = v104;
LABEL_82:
  CVPixelBufferRelease(v22);
  CVPixelBufferRelease(0);
  v97 = v20;
  if (v96)
  {
    [(SoftISPOutputFrame *)v20 setPixelBuffer:0];
    [(SoftISPOutputFrame *)v20 setMetadata:0];
    [(SoftISPOutputFrame *)v20 setError:v96];
    [(SoftISPOutputFrame *)v20 releaseAuxiliaryPixelBuffers];
    p_delegate = &self->_delegate;
    id v99 = objc_loadWeakRetained((id *)p_delegate);
    char v100 = objc_opt_respondsToSelector();

    if (v100)
    {
      id v101 = objc_loadWeakRetained((id *)p_delegate);
      [v101 outputFrameEnqueueFailure:v97];
    }
  }

  return v96;
}

- (int)_processInputFrames:(id)a3 isFinalPass:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  id v8 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    [v6 count];
    kdebug_trace();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (!-[SoftISPInputFrame processed](v14))
        {
          int v15 = [(SoftISPProcessor *)self _processInputFrame:v14 isFinalPass:v4];
          if (v15)
          {
            int v16 = v15;
            FigDebugAssert3();
            goto LABEL_13;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  int v16 = 0;
LABEL_13:

  if (*v8 == 1)
  {
    [v9 count];
    kdebug_trace();
  }

  return v16;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
}

- (int)deviceGeneration
{
  return self->_deviceGeneration;
}

- (NSFastEnumeration)supportedPipelineTypes
{
  return self->_supportedPipelineTypes;
}

- (SoftISPProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SoftISPProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)outputCompressionLevelByPipeline
{
  return self->_outputCompressionLevelByPipeline;
}

- (NSDictionary)moduleCalibrationByPortType
{
  return self->_moduleCalibrationByPortType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleCalibrationByPortType, 0);
  objc_storeStrong((id *)&self->_outputCompressionLevelByPipeline, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_supportedPipelineTypes, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_staticParameters, 0);
  objc_storeStrong((id *)&self->_inputFrames, 0);
  objc_storeStrong((id *)&self->_pipelines, 0);
  objc_storeStrong((id *)&self->_currentPipeline, 0);
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end