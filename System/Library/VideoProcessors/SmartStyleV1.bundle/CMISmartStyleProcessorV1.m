@interface CMISmartStyleProcessorV1
+ (id)getDefaultProcessorConfigurationForStills;
+ (id)getDefaultProcessorConfigurationForStillsReversibility;
+ (id)getDefaultProcessorConfigurationForStreaming;
+ (id)getDefaultProcessorConfigurationForStreamingWithFilterType:(unint64_t)a3;
+ (unint64_t)getSmartStyleCoefficientsFilterType:(id)a3;
+ (unsigned)getRequiredFilteredCoefficientsPixelBufferPoolSizeForFilterType:(unint64_t)a3;
+ (unsigned)getRequiredInputBufferSizeForFilterType:(unint64_t)a3;
- (BOOL)_isStreaming;
- (BOOL)shouldFlushCVMTLTextureCacheAfterProcessing;
- (BOOL)supportsExternalMemoryResource;
- (BOOL)useLiveMetalAllocations;
- (CMIExternalMemoryResource)externalMemoryResource;
- (CMISmartStyleProcessorBaseConfiguration)configuration;
- (CMISmartStyleProcessorInputOutput)inputOutput;
- (CMISmartStyleProcessorUtilities)utilities;
- (CMISmartStyleProcessorV1)init;
- (CMISmartStyleProcessorV1)initWithOptionalMetalCommandQueue:(id)a3;
- (MTLCommandQueue)metalCommandQueue;
- (MTLTexture)outputIntegratedStyleCoefficientsTexture;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSString)instanceLabel;
- (__CVBuffer)styleRendererOutputStyledThumbnailPixelBuffer;
- (id)externalMemoryDescriptorForConfiguration:(id)a3;
- (int)_configureInputLinearPixelBufferForPixelBufferRenderer:(__CVBuffer *)a3 withinputLinearCropRect:(CGRect)a4;
- (int)_configureInputUnstyledPixelBufferForPixelBufferRenderer:(__CVBuffer *)a3 withinputUnstyledCropRect:(CGRect)a4 inputUnstyledThumbnailPixelBuffer:(__CVBuffer *)a5 withinputUnstyledThumbnailCropRect:(CGRect)a6;
- (int)_configureOutputStyledThumbnailPixelBufferForPixelBufferRenderer:(__CVBuffer *)a3 unstyledThumbnailPixelBuffer:(__CVBuffer *)a4;
- (int)_configureStyleEngineTargetThumbnailPixelBuffer:(__CVBuffer *)a3 inputTargetThumbnailPixelBuffer:(__CVBuffer *)a4;
- (int)_rendererProcessingTypeForProcessingType:(unsigned int)a3;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (uint64_t)_configureStyleEngineInputUnstyledThumbnailPixelBuffer:(double)a3 withinputUnstyledCropRect:(double)a4 inputUnstyledThumbnailPixelBuffer:(double)a5 withinputUnstyledThumbnailCropRect:(double)a6 inputUnstyledThumbnailUsedForTargetGenerationPixelBuffer:(double)a7 withInputUnstyledThumbnailUsedForTargetGenerationCropRect:(double)a8;
- (unint64_t)_requestedMemSize:(unsigned int)a3;
- (unsigned)_pixelFormatCompatibleWithStyleProcessing:(unsigned int)a3;
- (unsigned)_styleEngineProcessingTypeForProcessingType:(unsigned int)a3;
- (void)dealloc;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setExternalMemoryResource:(id)a3;
- (void)setInputOutput:(id)a3;
- (void)setInstanceLabel:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setShouldFlushCVMTLTextureCacheAfterProcessing:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
- (void)setUseLiveMetalAllocations:(BOOL)a3;
@end

@implementation CMISmartStyleProcessorV1

- (CMISmartStyleProcessorV1)init
{
  v8.receiver = self;
  v8.super_class = (Class)CMISmartStyleProcessorV1;
  v2 = [(CMISmartStyleProcessorV1 *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_previousSRLCurveParameter = -1.0;
    v4 = +[CMISmartStyleCommonSettings tuningParametersForVariant:0];
    [v4 srlCurrentValueWeight];
    v3->_srlWeight = v5;

    v6 = v3;
  }
  else
  {
    FigDebugAssert3();
  }

  return v3;
}

- (CMISmartStyleProcessorV1)initWithOptionalMetalCommandQueue:(id)a3
{
  id v5 = a3;
  v6 = [(CMISmartStyleProcessorV1 *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalCommandQueue, a3);
    objc_super v8 = v7;
  }
  else
  {
    FigDebugAssert3();
  }

  return v7;
}

- (void)dealloc
{
  [(CMISmartStyleProcessorV1 *)self finishProcessing];
  [(CMISmartStyleProcessorV1 *)self purgeResources];
  utilities = self->_utilities;
  self->_utilities = 0;

  v4.receiver = self;
  v4.super_class = (Class)CMISmartStyleProcessorV1;
  [(CMISmartStyleProcessorV1 *)&v4 dealloc];
}

- (int)prepareToProcess:(unsigned int)a3
{
  uint64_t v4 = *(void *)&a3;
  if (self->_processingType == a3)
  {
    v14 = 0;
    v15 = 0;
    goto LABEL_41;
  }
  self->_processingType = a3;
  if (a3 >= 0x20 || (configuration = self->_configuration) == 0)
  {
    uint64_t v61 = v3;
    LODWORD(v60) = 0;
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    goto LABEL_54;
  }
  if (self->_isSetupDone) {
    goto LABEL_11;
  }
  v7 = [(CMISmartStyleProcessorBaseConfiguration *)configuration styleEngineConfiguration];
  id v8 = [v7 copy];

  objc_msgSend(v8, "setFastStyleApplication:", -[CMISmartStyleProcessorBaseConfiguration conformsToProtocol:](self->_configuration, "conformsToProtocol:", &OBJC_PROTOCOL___CMISmartStyleProcessorStreamingConfiguration));
  [v8 setShouldFlushCVMTLTextureCacheAfterProcessing:self->_shouldFlushCVMTLTextureCacheAfterProcessing];
  [v8 setShouldFlushCVMTLBufferCacheAfterProcessing:1];
  v9 = [(CMISmartStyleProcessorBaseConfiguration *)self->_configuration styleEngineTuningParameters];
  v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

  [v10 addEntriesFromDictionary:self->_tuningParameters];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setTuningParameters:v10];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setConfiguration:v8];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setLabel:self->_instanceLabel];
  if ([(CMIStyleEngineProcessor *)self->_styleEngineProcessor setup])
  {
    uint64_t v61 = v3;
    LODWORD(v60) = 0;
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
LABEL_53:

LABEL_54:
    v15 = 0;
    v14 = 0;
    if (v20) {
      goto LABEL_44;
    }
    goto LABEL_41;
  }
  if ([(CMISmartStyleProcessorBaseConfiguration *)self->_configuration conformsToProtocol:&OBJC_PROTOCOL___CMISmartStyleProcessorStreamingConfiguration])id v11 = [(CMISmartStyleProcessorBaseConfiguration *)self->_configuration temporalFilterInputBufferSize]; {
  else
  }
    id v11 = 0;
  v12 = [[CMISmartStyleProcessorUtilitiesV1 alloc] initWithStyleEngine:self->_styleEngineProcessor temporalFilterBufferSize:v11 withMetalContext:self->_metalContext];
  utilities = self->_utilities;
  self->_utilities = (CMISmartStyleProcessorUtilities *)v12;

  if (!self->_utilities)
  {
    uint64_t v61 = v3;
    LODWORD(v60) = 0;
    FigDebugAssert3();
    int v20 = 7;
    goto LABEL_53;
  }

LABEL_11:
  v14 = objc_opt_new();
  if (!v14)
  {
    uint64_t v61 = v3;
    LODWORD(v60) = 0;
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    v15 = 0;
    if (v20) {
      goto LABEL_44;
    }
    goto LABEL_41;
  }
  objc_msgSend(v14, "setMemSize:", -[CMISmartStyleProcessorV1 _requestedMemSize:](self, "_requestedMemSize:", self->_processingType));
  [v14 setWireMemory:1];
  [v14 setLabel:@"FigMetalAllocator_SmartStyleMetalRenderer_"];
  if ([(FigMetalAllocator *)self->_cmImagingAllocator memSize])
  {
    v15 = 0;
    goto LABEL_21;
  }
  if (![(CMISmartStyleProcessorV1 *)self supportsExternalMemoryResource]
    || (externalMemoryResource = self->_externalMemoryResource) == 0)
  {
    int v20 = [(FigMetalAllocator *)self->_cmImagingAllocator setupWithDescriptor:v14];
    v15 = (CMIExternalMemoryResource *)objc_alloc_init((Class)CMIExternalMemoryResource);
    v21 = [(FigMetalAllocator *)self->_cmImagingAllocator backendAllocator];
    [(CMIExternalMemoryResource *)v15 setAllocatorBackend:v21];

    if (v20)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      goto LABEL_44;
    }
    goto LABEL_20;
  }
  v15 = externalMemoryResource;
  v17 = [(CMIExternalMemoryResource *)self->_externalMemoryResource allocatorBackend];
  v18 = v17;
  if (!v17)
  {
    int v20 = FigSignalErrorAt();
    goto LABEL_65;
  }
  objc_msgSend(v14, "setMemSize:", objc_msgSend(v17, "memSize"));
  unsigned int v19 = [(FigMetalAllocator *)self->_cmImagingAllocator setupWithDescriptor:v14 allocatorBackend:v18];
  if (v19)
  {
    int v20 = v19;
    uint64_t v61 = v3;
    LODWORD(v60) = v19;
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_65:

    if (v20) {
      goto LABEL_44;
    }
    goto LABEL_41;
  }

LABEL_20:
  objc_storeStrong((id *)&self->_usedMemoryResource, v15);
LABEL_21:
  unsigned int v22 = [(CMISmartStyleProcessorBaseConfiguration *)self->_configuration conformsToProtocol:&OBJC_PROTOCOL___CMISmartStyleProcessorStillImageConfiguration];
  v23 = self->_configuration;
  if (v22)
  {
    v24 = v23;
    [(CMISmartStyleProcessorBaseConfiguration *)v24 intermediateStyleRendererThumbnailSize];
    if (v25 <= 0.0
      || ([(CMISmartStyleProcessorBaseConfiguration *)v24 intermediateStyleRendererThumbnailSize], v26 <= 0.0))
    {
LABEL_50:
      FigDebugAssert3();

      int v20 = 1;
      goto LABEL_44;
    }
    goto LABEL_28;
  }
  unsigned int v27 = [(CMISmartStyleProcessorBaseConfiguration *)v23 conformsToProtocol:&OBJC_PROTOCOL___CMISmartStyleProcessorStreamingConfiguration];
  v28 = self->_configuration;
  if (v27)
  {
    v24 = v28;
    [(CMISmartStyleProcessorBaseConfiguration *)v24 intermediateStyleRendererThumbnailSize];
    if (v29 <= 0.0) {
      goto LABEL_50;
    }
    [(CMISmartStyleProcessorBaseConfiguration *)v24 intermediateStyleRendererThumbnailSize];
    if (v30 <= 0.0) {
      goto LABEL_50;
    }
LABEL_28:
    [(CMISmartStyleProcessorBaseConfiguration *)v24 intermediateStyleRendererThumbnailSize];
    self->_intermediateStyleRendererThumbnailSize.width = v31;
    self->_intermediateStyleRendererThumbnailSize.height = v32;
    v33 = [(CMISmartStyleProcessorBaseConfiguration *)v24 styleEngineConfiguration];
    [v33 thumbnailSize];
    self->_styleEngineTargetThumbnailSize.width = v34;
    self->_styleEngineTargetThumbnailSize.height = v35;

    goto LABEL_30;
  }
  if (v28) {
    goto LABEL_59;
  }
LABEL_30:
  self->_shouldGenerateTarget = (v4 & 8) != 0;
  self->_shouldEncodeLinear = v4 >> 4;
  self->_shouldLearn = v4 & 1;
  self->_shouldIntegrate = (v4 & 2) != 0;
  self->_shouldApply = (v4 & 4) != 0;
  if (!v4) {
    goto LABEL_59;
  }
  if (self->_isSetupDone) {
    goto LABEL_37;
  }
  if ((v4 >> 3))
  {
    v36 = (CMISmartStylePixelBufferRenderer *)[objc_alloc((Class)CMISmartStylePixelBufferRendererV1) initWithOptionalMetalCommandQueue:self->_metalCommandQueue allocator:self->_cmImagingAllocator];
    smartStylePixelBufferRenderer = self->_smartStylePixelBufferRenderer;
    self->_smartStylePixelBufferRenderer = v36;

    v38 = self->_smartStylePixelBufferRenderer;
    if (!v38) {
      goto LABEL_62;
    }
    [(CMISmartStylePixelBufferRenderer *)v38 setInstanceLabel:self->_instanceLabel];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setUseLiveMetalAllocations:self->_useLiveMetalAllocations];
    if (![(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setup])
    {
      v39 = (CMISubjectRelightingStage *)[objc_alloc((Class)CMISubjectRelightingStage) initWithOptionalMetalCommandQueue:self->_metalCommandQueue];
      subjectRelightingStage = self->_subjectRelightingStage;
      self->_subjectRelightingStage = v39;

      if (self->_subjectRelightingStage) {
        goto LABEL_36;
      }
LABEL_62:
      FigDebugAssert3();
      int v20 = 7;
      goto LABEL_44;
    }
LABEL_59:
    uint64_t v61 = v3;
    LODWORD(v60) = 0;
    FigDebugAssert3();
LABEL_60:
    int v20 = FigSignalErrorAt();
    if (v20) {
      goto LABEL_44;
    }
    goto LABEL_41;
  }
LABEL_36:
  self->_isSetupDone = 1;
LABEL_37:
  v62 = v15;
  v63 = v14;
  CFStringRef v41 = kCVPixelBufferWidthKey;
  v67[0] = kCVPixelBufferWidthKey;
  v42 = +[NSNumber numberWithDouble:self->_intermediateStyleRendererThumbnailSize.width];
  v68[0] = v42;
  CFStringRef v43 = kCVPixelBufferHeightKey;
  v67[1] = kCVPixelBufferHeightKey;
  v44 = +[NSNumber numberWithDouble:self->_intermediateStyleRendererThumbnailSize.height];
  CFStringRef v45 = kCVPixelBufferBytesPerRowAlignmentKey;
  v68[1] = v44;
  v68[2] = &off_18738;
  unsigned int v64 = v4;
  CFStringRef v46 = kCVPixelBufferPlaneAlignmentKey;
  v67[2] = kCVPixelBufferBytesPerRowAlignmentKey;
  v67[3] = kCVPixelBufferPlaneAlignmentKey;
  CFStringRef v47 = kCVPixelBufferMetalCompatibilityKey;
  v68[3] = &off_18738;
  v68[4] = &__kCFBooleanTrue;
  CFStringRef v48 = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  v67[4] = kCVPixelBufferMetalCompatibilityKey;
  v67[5] = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  CFStringRef v49 = kCVPixelBufferIOSurfacePropertiesKey;
  v67[6] = kCVPixelBufferIOSurfacePropertiesKey;
  v68[5] = &__kCFBooleanTrue;
  v68[6] = &__NSDictionary0__struct;
  v50 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:7];
  styleRendererPixelBufferAttributes = self->_styleRendererPixelBufferAttributes;
  self->_styleRendererPixelBufferAttributes = v50;

  v65[0] = v41;
  v52 = +[NSNumber numberWithDouble:self->_styleEngineTargetThumbnailSize.width];
  v66[0] = v52;
  v65[1] = v43;
  v53 = +[NSNumber numberWithDouble:self->_styleEngineTargetThumbnailSize.height];
  v66[1] = v53;
  v66[2] = &off_18738;
  v65[2] = v45;
  v65[3] = v46;
  uint64_t v4 = v64;
  v66[3] = &off_18738;
  v66[4] = &__kCFBooleanTrue;
  v66[5] = &__kCFBooleanTrue;
  v65[4] = v47;
  v65[5] = v48;
  v65[6] = v49;
  v66[6] = &__NSDictionary0__struct;
  v54 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:7];
  styleEnginePixelBufferAttributes = self->_styleEnginePixelBufferAttributes;
  self->_styleEnginePixelBufferAttributes = v54;

  uint64_t v56 = [(CMISmartStyleProcessorV1 *)self _rendererProcessingTypeForProcessingType:v64];
  if (v56)
  {
    v15 = v62;
    v14 = v63;
    if ([(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer prepareToProcess:v56])
    {
      uint64_t v61 = v3;
      LODWORD(v60) = 0;
      FigDebugAssert3();
      goto LABEL_60;
    }
  }
  else
  {
    v15 = v62;
    v14 = v63;
  }
LABEL_41:
  uint64_t v57 = -[CMISmartStyleProcessorV1 _styleEngineProcessingTypeForProcessingType:](self, "_styleEngineProcessingTypeForProcessingType:", v4, v60, v61);
  if (v57)
  {
    uint64_t v58 = v57;
    [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setExternalMemoryResource:self->_usedMemoryResource];
    [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setUseLiveMetalAllocations:self->_useLiveMetalAllocations];
    int v20 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor prepareToProcess:v58];
  }
  else
  {
    int v20 = 0;
  }
LABEL_44:

  return v20;
}

- (int)process
{
  uint64_t v3 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputSmartStyle];
  v240 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputMetadataDict];
  v236 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputLinearMetadataDict];
  uint64_t v4 = (__CVBuffer *)[(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputUnstyledPixelBuffer];
  id v5 = (__CVBuffer *)[(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputUnstyledThumbnailPixelBuffer];
  id v207 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputLearningTargetPixelBuffer];
  id v206 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputLearningTargetThumbnailPixelBuffer];
  id v227 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputLinearPixelBuffer];
  id v219 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputGainMapPixelBuffer];
  v6 = (__CVBuffer *)[(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputPersonMaskPixelBuffer];
  v7 = (__CVBuffer *)[(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputSkinMaskPixelBuffer];
  id v8 = (__CVBuffer *)[(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputSkyMaskPixelBuffer];
  id v180 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputSRLPixelBuffer];
  id v183 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputStyleCoefficientsPixelBuffer];
  id v9 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputDeltaMapPixelBuffer];
  v10 = (__CVBuffer *)[(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputReferenceForDeltaMapComputationPixelBuffer];
  unsigned int v220 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput semanticStyleSceneType];
  uint64_t v230 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputTuningType];
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput personMasksValidHint];
  int v12 = v11;
  unsigned int v218 = [(CMISmartStyleProcessorV1 *)self _isStreaming];
  v13 = (__CVBuffer *)[(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputStyledPixelBuffer];
  id v222 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputSmallLightMapPixelBuffer];
  id v221 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputSmallLinearLightMapPixelBuffer];
  v229 = (__CVBuffer *)[(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputDeltaMapPixelBuffer];
  id v224 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputLearnedStyleCoefficientsPixelBuffer];
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputUnstyledCropRect];
  if (CGRectIsEmpty(v241))
  {
    double Width = (double)CVPixelBufferGetWidth(v4);
    double Height = (double)CVPixelBufferGetHeight(v4);
    double v14 = 0.0;
    double v15 = 0.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputUnstyledCropRect];
    double v14 = v16;
    double v15 = v17;
    double Height = v19;
    double Width = v18;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputUnstyledThumbnailCropRect];
  if (CGRectIsEmpty(v242))
  {
    double v235 = (double)CVPixelBufferGetWidth(v5);
    double v233 = 0.0;
    double v234 = (double)CVPixelBufferGetHeight(v5);
    double v232 = 0.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputUnstyledThumbnailCropRect];
    double v232 = v21;
    double v233 = v20;
    double v234 = v23;
    double v235 = v22;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputPersonMaskCropRect];
  if (CGRectIsEmpty(v243))
  {
    double v217 = (double)CVPixelBufferGetWidth(v6);
    double v215 = 0.0;
    double v216 = (double)CVPixelBufferGetHeight(v6);
    double v214 = 0.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputPersonMaskCropRect];
    double v214 = v25;
    double v215 = v24;
    double v216 = v27;
    double v217 = v26;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputSkyMaskCropRect];
  if (CGRectIsEmpty(v244))
  {
    double v213 = (double)CVPixelBufferGetWidth(v8);
    double v211 = 0.0;
    double v212 = (double)CVPixelBufferGetHeight(v8);
    double v210 = 0.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputSkyMaskCropRect];
    double v210 = v29;
    double v211 = v28;
    double v212 = v31;
    double v213 = v30;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputSkinMaskCropRect];
  if (CGRectIsEmpty(v245))
  {
    double v209 = (double)CVPixelBufferGetWidth(v7);
    double v208 = (double)CVPixelBufferGetHeight(v7);
    double v32 = 0.0;
    double v33 = 0.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputSkinMaskCropRect];
    double v32 = v34;
    double v33 = v35;
    double v208 = v37;
    double v209 = v36;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputStyledCropRect];
  if (CGRectIsEmpty(v246))
  {
    double v195 = (double)CVPixelBufferGetWidth(v13);
    double v194 = 0.0;
    double v192 = (double)CVPixelBufferGetHeight(v13);
    double v193 = 0.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputStyledCropRect];
    double v193 = v39;
    double v194 = v38;
    double v195 = v40;
    double v192 = v41;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputDeltaMapCropRect];
  v203 = v13;
  if (CGRectIsEmpty(v247))
  {
    CVPixelBufferGetWidth(v229);
    CVPixelBufferGetHeight(v229);
    double v178 = 0.0;
    double v179 = 0.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputDeltaMapCropRect];
    double v178 = v43;
    double v179 = v42;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputReferenceForDeltaMapComputationCropRect];
  if (CGRectIsEmpty(v248))
  {
    CVPixelBufferGetWidth(v10);
    CVPixelBufferGetHeight(v10);
    double v176 = 0.0;
    double v177 = 0.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputReferenceForDeltaMapComputationCropRect];
    double v176 = v45;
    double v177 = v44;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput primaryCaptureRect];
  v204 = v10;
  id v205 = v9;
  if (CGRectIsEmpty(v249))
  {
    double v185 = 0.0;
    double v186 = 0.0;
    double v46 = 1.0;
    double v184 = 1.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput primaryCaptureRect];
    double v185 = v47;
    double v186 = v48;
    double v46 = v49;
    double v184 = v50;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputCropRectWithinPrimaryCaptureRect];
  id v51 = v227;
  double v239 = v15;
  double v201 = v46;
  if (CGRectIsEmpty(v250))
  {
    CGFloat v189 = 1.0;
    CGFloat v190 = 0.0;
    CGFloat v188 = 0.0;
    CGFloat v187 = 1.0;
  }
  else
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputCropRectWithinPrimaryCaptureRect];
    CGFloat v187 = v53;
    CGFloat v188 = v52;
    CGFloat v189 = v55;
    CGFloat v190 = v54;
  }
  double y = CGRectNull.origin.y;
  double v57 = CGRectNull.size.width;
  double v58 = CGRectNull.size.height;
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputRenderRect];
  *(double *)&v226[16] = v57;
  *(double *)&v226[24] = v58;
  *(double *)&v226[8] = y;
  *(CGFloat *)v226 = CGRectNull.origin.x;
  if (!CGRectIsEmpty(v251))
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputRenderRect];
    *(void *)v226 = v59;
    *(void *)&v226[8] = v60;
    *(void *)&v226[16] = v61;
    *(void *)&v226[24] = v62;
  }
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput deltaMapRegionToRenderRect];
  IsEmptdouble y = CGRectIsEmpty(v252);
  double v64 = v58;
  double v65 = v57;
  double v66 = y;
  CGFloat x = CGRectNull.origin.x;
  BOOL v191 = IsEmpty;
  if (!IsEmpty) {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput deltaMapRegionToRenderRect];
  }
  double v181 = x;
  double v182 = v66;
  double v174 = v65;
  double v175 = v64;
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput spotlightAffineTransform];
  double v199 = v69;
  double v200 = v68;
  double v198 = v70;
  [(CMISmartStyleProcessorInputOutput *)self->_inputOutput globalLinearSystemMixFactor];
  int v196 = v71;
  unsigned int v202 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput residualsCalculationDisabled];
  unsigned int v197 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput applyDither];
  v231 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput metalSharedEvent];
  if (v231)
  {
    v72 = [(FigMetalContext *)self->_metalContext commandBuffer];
    if (!v72) {
      goto LABEL_145;
    }
    v73 = v72;
    [v72 encodeWaitForEvent:v231 value:1];
    [(FigMetalContext *)self->_metalContext commit];
  }
  if (self->_shouldGenerateTarget)
  {
    if (!((unint64_t)v4 | (unint64_t)v5) || !v240 || !v227)
    {
LABEL_151:
      FigDebugAssert3();
      int v169 = 1;
      goto LABEL_162;
    }
    unsigned int v74 = -[CMISmartStyleProcessorV1 _configureInputUnstyledPixelBufferForPixelBufferRenderer:withinputUnstyledCropRect:inputUnstyledThumbnailPixelBuffer:withinputUnstyledThumbnailCropRect:](self, "_configureInputUnstyledPixelBufferForPixelBufferRenderer:withinputUnstyledCropRect:inputUnstyledThumbnailPixelBuffer:withinputUnstyledThumbnailCropRect:", v4, v5, v14, v239, Width, Height, v233, v232, v235, v234);
    if (v74)
    {
      int v169 = v74;
      goto LABEL_161;
    }
    id v75 = [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer inputPixelBuffer];
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputLinearCropRect];
    if (CGRectIsEmpty(v253))
    {
      [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputLinearPixelBuffer:v227];
    }
    else
    {
      [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputLinearCropRect];
      unsigned int v76 = -[CMISmartStyleProcessorV1 _configureInputLinearPixelBufferForPixelBufferRenderer:withinputLinearCropRect:](self, "_configureInputLinearPixelBufferForPixelBufferRenderer:withinputLinearCropRect:", v227);
      if (v76)
      {
        int v169 = v76;
        goto LABEL_161;
      }
    }
    unsigned int v77 = [(CMISmartStyleProcessorV1 *)self _configureOutputStyledThumbnailPixelBufferForPixelBufferRenderer:v4 unstyledThumbnailPixelBuffer:v5];
    if (v77)
    {
      int v169 = v77;
      goto LABEL_161;
    }
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputStyle:v3];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputMetadataDict:v240];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputLinearMetadataDict:v236];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputGainMapPixelBuffer:v219];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputPersonMaskPixelBuffer:v6];
    -[CMISmartStylePixelBufferRenderer setInputPersonMaskCropRect:](self->_smartStylePixelBufferRenderer, "setInputPersonMaskCropRect:", v215, v214, v217, v216);
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputSkinMaskPixelBuffer:v7];
    -[CMISmartStylePixelBufferRenderer setInputSkinMaskCropRect:](self->_smartStylePixelBufferRenderer, "setInputSkinMaskCropRect:", v32, v33, v209, v208);
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputSkyMaskPixelBuffer:v8];
    -[CMISmartStylePixelBufferRenderer setInputSkyMaskCropRect:](self->_smartStylePixelBufferRenderer, "setInputSkyMaskCropRect:", v211, v210, v213, v212);
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setSemanticStyleSceneType:v220];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setTuningParameterVariant:v230];
    if (self->_shouldFlushCVMTLTextureCacheAfterProcessing) {
      uint64_t v78 = 0;
    }
    else {
      uint64_t v78 = v218;
    }
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setIsStreaming:v78];
    LODWORD(v79) = v12;
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setPersonMasksValidHint:v79];
    v80 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputImageStatistics];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setOutputImageStatistics:v80];

    v81 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputImageStatisticsExtended];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setOutputImageStatisticsExtended:v81];

    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setOutputSmallLightMapPixelBuffer:v222];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setOutputSmallLinearLightMapPixelBuffer:v221];
    if ([(CMISmartStyleProcessorInputOutput *)self->_inputOutput subjectRelightingEnabled]&& v7&& v6)
    {
      if (!v180)
      {
        int v169 = FigSignalErrorAt();
        v139 = (void *)v230;
        goto LABEL_140;
      }
      v82 = [v240 objectForKeyedSubscript:kFigCaptureStreamMetadata_DetectedObjectsInfo];
      v83 = [v82 objectForKeyedSubscript:kFigCaptureStreamDetectedObjectsInfoKey_HumanFaces];

      v84 = [v240 objectForKeyedSubscript:kFigCaptureStreamMetadata_ExposureBias];
      [v84 floatValue];
      int v86 = v85;

      LODWORD(v173) = 0;
      LODWORD(v87) = v86;
      [(CMISubjectRelightingStage *)self->_subjectRelightingStage runSRLForLivePhotosWithInputBuffer:v180 skinMask:v7 personMask:v6 instanceMasks:0 instanceMaskConfidences:0 skinToneClassification:0 expBias:v87 exifOrientation:v173 srlV2Plist:0 faceDataFromANST:v83];
      [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputSRLCoefficientsBuf:0];
      float previousSRLCurveParameter = self->_previousSRLCurveParameter;
      [(CMISubjectRelightingStage *)self->_subjectRelightingStage lastComputedCurveParameter];
      float v90 = -1.0;
      if (*(float *)&v89 != -1.0 && previousSRLCurveParameter == -1.0) {
        float v92 = *(float *)&v89;
      }
      else {
        float v92 = previousSRLCurveParameter;
      }
      if (v92 != -1.0 || *(float *)&v89 != -1.0) {
        float v90 = (float)(*(float *)&v89 * self->_srlWeight) + (float)((float)(1.0 - self->_srlWeight) * v92);
      }
      *(float *)&double v89 = v90;
      [(CMISmartStyleProcessorInputOutput *)self->_inputOutput setOutputSRLCurveParameter:v89];
      *(float *)&double v93 = v90;
      [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputSRLCurveParameter:v93];
      self->_float previousSRLCurveParameter = v90;
      v94 = [(CMISubjectRelightingStage *)self->_subjectRelightingStage lastComputedRelightingStats];
      v7 = +[NSData dataWithData:v94];
      [(CMISmartStyleProcessorInputOutput *)self->_inputOutput setOutputSRLStats:v7];

      id v51 = v227;
    }
    else
    {
      [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputSRLCoefficientsBuf:0];
      LODWORD(v95) = -1.0;
      [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputSRLCurveParameter:v95];
      LODWORD(v96) = -1.0;
      [(CMISmartStyleProcessorInputOutput *)self->_inputOutput setOutputSRLCurveParameter:v96];
      [(CMISmartStyleProcessorInputOutput *)self->_inputOutput setOutputSRLStats:0];
    }
  }
  else
  {
    id v75 = 0;
  }
  if (self->_shouldEncodeLinear)
  {
    [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputLinearCropRect];
    if (CGRectIsEmpty(v254))
    {
      [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputLinearPixelBuffer:v51];
    }
    else
    {
      [(CMISmartStyleProcessorInputOutput *)self->_inputOutput inputLinearCropRect];
      unsigned int v97 = -[CMISmartStyleProcessorV1 _configureInputLinearPixelBufferForPixelBufferRenderer:withinputLinearCropRect:](self, "_configureInputLinearPixelBufferForPixelBufferRenderer:withinputLinearCropRect:", v51);
      if (v97)
      {
        int v169 = v97;
        goto LABEL_161;
      }
    }
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputMetadataDict:v240];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputLinearMetadataDict:v236];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setOutputCodedLinearPixelBuffer:[(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputCodedLinearThumbnailPixelBuffer]];
    v98 = [(CMISmartStyleProcessorInputOutput *)self->_inputOutput outputCodedLinearThumbnailMetadata];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setOutputCodedLinearMetadata:v98];
  }
  if ((self->_shouldGenerateTarget || self->_shouldEncodeLinear)
    && [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer process])
  {
LABEL_145:
    FigDebugAssert3();
    int v169 = FigSignalErrorAt();
LABEL_162:
    v139 = (void *)v230;
    goto LABEL_140;
  }
  if (self->_shouldLearn)
  {
    if ((unint64_t)v4 | (unint64_t)v5 && (self->_shouldIntegrate || self->_shouldApply || v224))
    {
      unsigned int v99 = -[CMISmartStyleProcessorV1 _configureStyleEngineInputUnstyledThumbnailPixelBuffer:withinputUnstyledCropRect:inputUnstyledThumbnailPixelBuffer:withinputUnstyledThumbnailCropRect:inputUnstyledThumbnailUsedForTargetGenerationPixelBuffer:withInputUnstyledThumbnailUsedForTargetGenerationCropRect:](self, "_configureStyleEngineInputUnstyledThumbnailPixelBuffer:withinputUnstyledCropRect:inputUnstyledThumbnailPixelBuffer:withinputUnstyledThumbnailCropRect:inputUnstyledThumbnailUsedForTargetGenerationPixelBuffer:withInputUnstyledThumbnailUsedForTargetGenerationCropRect:", v4, v5, v75, v14, v239, Width, Height, v233, v232, v235, v234, *(void *)&CGRectNull.origin.x, *(void *)&y, *(void *)&v57, *(void *)&v58);
      if (v99)
      {
        int v169 = v99;
        goto LABEL_161;
      }
      id v100 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor inputThumbnailPixelBuffer];
      unsigned int v101 = [(CMISmartStyleProcessorV1 *)self _configureStyleEngineTargetThumbnailPixelBuffer:v207 inputTargetThumbnailPixelBuffer:v206];
      if (v101)
      {
        int v169 = v101;
        goto LABEL_161;
      }
      [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setOutputLinearSystemCoefficientsPixelBuffer:v224];
      v102 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor tuningParameters];
      float v103 = 0.0;
      objc_msgSend(v102, "cmi_floatValueForKey:defaultValue:found:", @"StylePriorStrength", 0, 0.0);
      float v105 = v104;
      float v106 = 1.0;
      if (v104 < 1.0)
      {
        v7 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor tuningParameters];
        [(__CVBuffer *)v7 cmi_floatValueForKey:@"StylePriorStrength" defaultValue:0 found:0.0];
        if (v107 <= 0.0) {
          goto LABEL_86;
        }
      }
      v108 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor tuningParameters];
      objc_msgSend(v108, "cmi_floatValueForKey:defaultValue:found:", @"StylePriorStrength", 0, 0.0);
      if (v109 < 1.0)
      {
        v110 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor tuningParameters];
        objc_msgSend(v110, "cmi_floatValueForKey:defaultValue:found:", @"StylePriorStrength", 0, 0.0);
        float v106 = v111;
      }
      float v103 = v106;
      if (v105 < 1.0)
      {
LABEL_86:

        float v106 = v103;
      }

      p_previousStyle = &self->_previousStyle;
      v113 = [(CMISmartStyle *)self->_previousStyle castType];
      v114 = [v3 castType];
      if (![v113 isEqualToString:v114]) {
        goto LABEL_91;
      }
      [(CMISmartStyle *)*p_previousStyle toneBias];
      float v116 = v115;
      [v3 toneBias];
      if (vabds_f32(v116, v117) > 0.00000011921) {
        goto LABEL_91;
      }
      [(CMISmartStyle *)*p_previousStyle colorBias];
      float v119 = v118;
      [v3 colorBias];
      if (vabds_f32(v119, v120) <= 0.00000011921
        && ([(CMISmartStyle *)*p_previousStyle castIntensity],
            float v122 = v121,
            [v3 castIntensity],
            vabds_f32(v122, v123) <= 0.00000011921))
      {
        float v172 = vabds_f32(self->_previousPriorStrength, v106);

        if (v172 <= 0.00000011921) {
          goto LABEL_93;
        }
      }
      else
      {
LABEL_91:
      }
      v124 = [v3 castType];
      [v3 toneBias];
      int v126 = v125;
      [v3 colorBias];
      int v128 = v127;
      [v3 castIntensity];
      LODWORD(v130) = v129;
      LODWORD(v131) = v126;
      LODWORD(v132) = v128;
      *(float *)&double v133 = v106;
      +[CMISmartStyleCCMPriorGenerator calculatePriorCCMforCast:v124 tone:v131 color:v132 intensity:v130 priorStrength:v133];
      double v228 = v134;
      double v223 = v136;
      double v225 = v135;
      v137 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
      objc_msgSend(v137, "setLinearSystemPriorMatrix:", v228, v225, v223);

LABEL_93:
      objc_storeStrong((id *)&self->_previousStyle, v3);
      self->_previousPriorStrength = v106;
      goto LABEL_95;
    }
    goto LABEL_151;
  }
  id v100 = 0;
LABEL_95:
  if (!self->_shouldIntegrate) {
    goto LABEL_102;
  }
  if (self->_shouldLearn)
  {
    if (v100) {
      goto LABEL_102;
    }
    goto LABEL_101;
  }
  if (!v183)
  {
LABEL_159:
    FigDebugAssert3();
    int v169 = 7;
    goto LABEL_162;
  }
  -[CMIStyleEngineProcessor setInputLinearSystemCoefficientsPixelBuffer:](self->_styleEngineProcessor, "setInputLinearSystemCoefficientsPixelBuffer:");
  if (!v100)
  {
LABEL_101:
    unsigned int v138 = -[CMISmartStyleProcessorV1 _configureStyleEngineInputUnstyledThumbnailPixelBuffer:withinputUnstyledCropRect:inputUnstyledThumbnailPixelBuffer:withinputUnstyledThumbnailCropRect:inputUnstyledThumbnailUsedForTargetGenerationPixelBuffer:withInputUnstyledThumbnailUsedForTargetGenerationCropRect:](self, "_configureStyleEngineInputUnstyledThumbnailPixelBuffer:withinputUnstyledCropRect:inputUnstyledThumbnailPixelBuffer:withinputUnstyledThumbnailCropRect:inputUnstyledThumbnailUsedForTargetGenerationPixelBuffer:withInputUnstyledThumbnailUsedForTargetGenerationCropRect:", v4, v5, v75, v14, v239, Width, Height, v233, v232, v235, v234, *(void *)&CGRectNull.origin.x, *(void *)&y, *(void *)&v57, *(void *)&v58);
    if (!v138) {
      goto LABEL_102;
    }
    int v169 = v138;
LABEL_161:
    FigDebugAssert3();
    goto LABEL_162;
  }
LABEL_102:
  if (!self->_shouldApply)
  {
    v139 = (void *)v230;
    if (self->_shouldLearn) {
      goto LABEL_133;
    }
    goto LABEL_131;
  }
  if (self->_shouldLearn)
  {
    if (v100) {
      goto LABEL_111;
    }
    goto LABEL_110;
  }
  if (!v183) {
    goto LABEL_159;
  }
  -[CMIStyleEngineProcessor setInputLinearSystemCoefficientsPixelBuffer:](self->_styleEngineProcessor, "setInputLinearSystemCoefficientsPixelBuffer:");
  if (v100) {
    goto LABEL_111;
  }
LABEL_110:
  unsigned int v140 = -[CMISmartStyleProcessorV1 _configureStyleEngineInputUnstyledThumbnailPixelBuffer:withinputUnstyledCropRect:inputUnstyledThumbnailPixelBuffer:withinputUnstyledThumbnailCropRect:inputUnstyledThumbnailUsedForTargetGenerationPixelBuffer:withInputUnstyledThumbnailUsedForTargetGenerationCropRect:](self, "_configureStyleEngineInputUnstyledThumbnailPixelBuffer:withinputUnstyledCropRect:inputUnstyledThumbnailPixelBuffer:withinputUnstyledThumbnailCropRect:inputUnstyledThumbnailUsedForTargetGenerationPixelBuffer:withInputUnstyledThumbnailUsedForTargetGenerationCropRect:", v4, v5, v75, v14, v239, Width, Height, v233, v232, v235, v234, *(void *)&CGRectNull.origin.x, *(void *)&y, *(void *)&v57, *(void *)&v58);
  if (v140)
  {
    int v169 = v140;
    goto LABEL_161;
  }
LABEL_111:
  v141 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor configuration];
  LODWORD(v142) = v196;
  [v141 setGlobalLinearSystemMixFactor:v142];

  -[CMIStyleEngineProcessor setSpotlightAffineTransform:](self->_styleEngineProcessor, "setSpotlightAffineTransform:", v200, v199, v198);
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setApplyDither:v197];
  v255.origin.CGFloat x = v185;
  v255.origin.double y = v186;
  v255.size.width = v201;
  v255.size.height = v184;
  if (!CGRectIsEmpty(v255))
  {
    int64_t v143 = CVPixelBufferGetWidth((CVPixelBufferRef)[(CMIStyleEngineProcessor *)self->_styleEngineProcessor inputThumbnailPixelBuffer]);
    int64_t v144 = CVPixelBufferGetHeight((CVPixelBufferRef)[(CMIStyleEngineProcessor *)self->_styleEngineProcessor inputThumbnailPixelBuffer]);
    CGFloat v145 = v185 * (double)v143;
    CGFloat v146 = v201 * (double)v143;
    CGFloat v147 = v186 * (double)v144;
    CGFloat v148 = v184 * (double)v144;
    v149 = [(CMISmartStyleProcessorBaseConfiguration *)self->_configuration styleEngineConfiguration];
    [v149 thumbnailSize];
    CGFloat v151 = v150;
    v152 = [(CMISmartStyleProcessorBaseConfiguration *)self->_configuration styleEngineConfiguration];
    [v152 thumbnailSize];
    v262.size.height = v153;
    v262.origin.CGFloat x = 0.0;
    v262.origin.double y = 0.0;
    v256.origin.CGFloat x = v145;
    v256.origin.double y = v147;
    v256.size.width = v146;
    v256.size.height = v148;
    v262.size.width = v151;
    CGRect v257 = CGRectIntersection(v256, v262);
    -[CMIStyleEngineProcessor setSpotlightIntegrationROI:](self->_styleEngineProcessor, "setSpotlightIntegrationROI:", v257.origin.x, v257.origin.y, v257.size.width, v257.size.height);
  }
  v263.origin.CGFloat x = 0.0;
  v263.origin.double y = 0.0;
  v263.size.width = 1.0;
  v263.size.height = 1.0;
  v258.size.width = v187;
  v258.origin.CGFloat x = v188;
  v258.size.height = v189;
  v258.origin.double y = v190;
  CGRect v259 = CGRectIntersection(v258, v263);
  -[CMIStyleEngineProcessor setSpotlightZoomROI:](self->_styleEngineProcessor, "setSpotlightZoomROI:", v259.origin.x, v259.origin.y, v259.size.width, v259.size.height);
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setInputPixelBuffer:v4];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setOutputPixelBuffer:v203];
  v260.origin.CGFloat x = v14;
  v260.size.width = Width;
  v260.origin.double y = v239;
  v260.size.height = Height;
  if (!CGRectIsEmpty(v260))
  {
    double v154 = (double)CVPixelBufferGetWidth(v4);
    double v155 = (double)CVPixelBufferGetHeight(v4);
    if (v204) {
      BOOL v156 = !v191;
    }
    else {
      BOOL v156 = 0;
    }
    double v157 = v181 - v14;
    double v158 = v182 - v239;
    if (!v156 || v229 == 0)
    {
      double v157 = -v14;
      double v158 = -v239;
    }
    -[CMIStyleEngineProcessor setInputImageRect:](self->_styleEngineProcessor, "setInputImageRect:", v157, v158, v154, v155);
  }
  v261.origin.CGFloat x = v194;
  v261.origin.double y = v193;
  v261.size.width = v195;
  v261.size.height = v192;
  if (!CGRectIsEmpty(v261))
  {
    -[CMIStyleEngineProcessor setImageSize:](self->_styleEngineProcessor, "setImageSize:", v195, v192);
    double v159 = (double)CVPixelBufferGetWidth(v203);
    -[CMIStyleEngineProcessor setOutputImageRect:](self->_styleEngineProcessor, "setOutputImageRect:", -v194, -v193, v159, (double)CVPixelBufferGetHeight(v203));
  }
  v139 = (void *)v230;
  if (v204)
  {
    if (v229)
    {
      double v160 = (double)CVPixelBufferGetWidth(v204);
      double v161 = (double)CVPixelBufferGetHeight(v204);
      [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setInputOriginalPixelBuffer:v204];
      -[CMIStyleEngineProcessor setInputOriginalImageRect:](self->_styleEngineProcessor, "setInputOriginalImageRect:", -v177, -v176, v160, v161);
      double v162 = (double)CVPixelBufferGetWidth(v229);
      double v163 = (double)CVPixelBufferGetHeight(v229);
      [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setOutputDeltaMapPixelBuffer:v229];
      -[CMIStyleEngineProcessor setOutputImageRect:](self->_styleEngineProcessor, "setOutputImageRect:", -v179, -v178, v162, v163);
      if (!v191) {
        -[CMIStyleEngineProcessor setRegionToRender:](self->_styleEngineProcessor, "setRegionToRender:", v181, v182, v174, v175);
      }
    }
  }
  if (!CGRectIsEmpty(*(CGRect *)v226)) {
    -[CMIStyleEngineProcessor setRegionToRender:](self->_styleEngineProcessor, "setRegionToRender:", *(double *)v226, *(double *)&v226[8], *(double *)&v226[16], *(double *)&v226[24]);
  }
  if (v205) {
    [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setInputDeltaMapPixelBuffer:v205];
  }
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setResidualsCalculationDisabled:v202];
  if (self->_shouldLearn) {
    goto LABEL_133;
  }
LABEL_131:
  if (!self->_shouldIntegrate && !self->_shouldApply)
  {
    int v169 = 0;
    goto LABEL_140;
  }
LABEL_133:
  v164 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor tuningParameters];
  if (v139)
  {
    v165 = [v3 castType];

    if (v165)
    {
      v166 = [v3 castType];
      v167 = +[CMISmartStyleCommonSettings styleEngineSpecificTuningForTuningVariant:v139 andCast:v166];
      v168 = objc_msgSend(v167, "cmi_dictionaryMergedWithDefaultDict:", v164);
      [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setTuningParameters:v168];
    }
  }
  if ([(CMIStyleEngineProcessor *)self->_styleEngineProcessor process]
    || [(CMIStyleEngineProcessor *)self->_styleEngineProcessor resetState])
  {
    FigDebugAssert3();
    int v169 = FigSignalErrorAt();
  }
  else
  {
    [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setTuningParameters:v164];
    int v169 = 0;
  }

LABEL_140:
  inputOutput = self->_inputOutput;
  self->_inputOutput = 0;

  return v169;
}

- (int)finishProcessing
{
  if (!self->_smartStylePixelBufferRenderer || !self->_styleEngineProcessor) {
    goto LABEL_5;
  }
  uint64_t v3 = [(FigMetalContext *)self->_metalContext commandQueue];
  uint64_t v4 = [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer metalCommandQueue];
  if (v3 == v4)
  {
    id v5 = [(FigMetalContext *)self->_metalContext commandQueue];
    v6 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor metalCommandQueue];

    if (v5 == v6)
    {
LABEL_5:
      [(FigMetalContext *)self->_metalContext waitForIdle];
      return 0;
    }
  }
  else
  {
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)purgeResources
{
  if ([(CMIStyleEngineProcessor *)self->_styleEngineProcessor purgeResources]
    || [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer purgeResources])
  {
    FigDebugAssert3();
    int v3 = FigSignalErrorAt();
  }
  else
  {
    int v3 = 0;
  }
  styleRendererInputUnstyledThumbnailPixelBuffer = self->_styleRendererInputUnstyledThumbnailPixelBuffer;
  if (styleRendererInputUnstyledThumbnailPixelBuffer)
  {
    CFRelease(styleRendererInputUnstyledThumbnailPixelBuffer);
    self->_styleRendererInputUnstyledThumbnailPixelBuffer = 0;
  }
  styleRendererOutputStyledThumbnailPixelBuffer = self->_styleRendererOutputStyledThumbnailPixelBuffer;
  if (styleRendererOutputStyledThumbnailPixelBuffer)
  {
    CFRelease(styleRendererOutputStyledThumbnailPixelBuffer);
    self->_styleRendererOutputStyledThumbnailPixelBuffer = 0;
  }
  styleEngineInputUnstyledThumbnailPixelBuffer = self->_styleEngineInputUnstyledThumbnailPixelBuffer;
  if (styleEngineInputUnstyledThumbnailPixelBuffer)
  {
    CFRelease(styleEngineInputUnstyledThumbnailPixelBuffer);
    self->_styleEngineInputUnstyledThumbnailPixelBuffer = 0;
  }
  styleEngineInputTargetStyledThumbnailPixelBuffer = self->_styleEngineInputTargetStyledThumbnailPixelBuffer;
  if (styleEngineInputTargetStyledThumbnailPixelBuffer)
  {
    CFRelease(styleEngineInputTargetStyledThumbnailPixelBuffer);
    self->_styleEngineInputTargetStyledThumbnailPixelBuffer = 0;
  }
  styleRendererInputLinearThumbnailPixelBuffer = self->_styleRendererInputLinearThumbnailPixelBuffer;
  if (styleRendererInputLinearThumbnailPixelBuffer)
  {
    CFRelease(styleRendererInputLinearThumbnailPixelBuffer);
    self->_styleRendererInputLinearThumbnailPixelBuffer = 0;
  }
  self->_float previousSRLCurveParameter = -1.0;
  return v3;
}

- (BOOL)supportsExternalMemoryResource
{
  return 1;
}

- (unint64_t)_requestedMemSize:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)CMIExternalMemoryConfiguration);
  CFStringRef v22 = @"ProcessingType";
  v6 = +[NSNumber numberWithUnsignedInt:[(CMISmartStyleProcessorV1 *)self _styleEngineProcessingTypeForProcessingType:v3]];
  double v23 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v8 = [v5 initWithMaxInputDimensions:0 inputPixelFormat:0 maxOutputDimensions:0 cmiResourceEnabled:0 processorSpecificOptions:v7];

  if (v8)
  {
    id v9 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor externalMemoryDescriptorForConfiguration:v8];
    id v10 = [v9 memSize];
    id v11 = v10;
    if (self->_useLiveMetalAllocations)
    {
      unint64_t v12 = 18253824;
      if ((unint64_t)v10 > 0x1168800) {
        unint64_t v12 = (unint64_t)v10;
      }
      if ((v3 & 8) == 0) {
        unint64_t v12 = (unint64_t)v10;
      }
      BOOL v13 = (v3 & 1) == 0;
      if (v12 <= 0x2600000) {
        uint64_t v14 = 39845888;
      }
      else {
        uint64_t v14 = v12;
      }
      BOOL v15 = (v3 & 6) == 0;
      if (v9)
      {
        BOOL v13 = 1;
        BOOL v15 = 1;
      }
      if (!v13) {
        unint64_t v12 = v14;
      }
      uint64_t v16 = 0x800000;
      if (v12 > 0x800000) {
        uint64_t v16 = v12;
      }
      if (!v15) {
        unint64_t v12 = v16;
      }
      if (v12 <= 0x2600000) {
        uint64_t v17 = 39845888;
      }
      else {
        uint64_t v17 = v12;
      }
      BOOL v18 = v3 == 0;
    }
    else
    {
      id v19 = [v9 memSize];
      unint64_t v12 = (unint64_t)v19 + (void)v11 + 18253824;
      if ((v3 & 8) == 0) {
        unint64_t v12 = (unint64_t)v19 + (void)v11 + 428032;
      }
      BOOL v18 = v3 == 0;
      uint64_t v17 = 66488320;
    }
    if (v18) {
      unint64_t v20 = v17;
    }
    else {
      unint64_t v20 = v12;
    }
  }
  else
  {
    FigDebugAssert3();
    unint64_t v20 = 0;
  }

  return v20;
}

- (id)externalMemoryDescriptorForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CMIExternalMemoryConfiguration) initWithMaxInputDimensions:0 inputPixelFormat:0 maxOutputDimensions:0 cmiResourceEnabled:0 processorSpecificOptions:&off_18818];
  if (v5)
  {
    v6 = [(CMISmartStyleProcessorBaseConfiguration *)self->_configuration styleEngineConfiguration];
    [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setConfiguration:v6];

    v7 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor externalMemoryDescriptorForConfiguration:v5];
    if (v7)
    {
      id v8 = [v4 processorSpecificOptions];
      id v9 = [v8 objectForKeyedSubscript:@"ProcessingType"];
      id processingType = [v9 unsignedIntValue];
      if (!processingType) {
        id processingType = self->_processingType;
      }
      objc_msgSend(v7, "setMemSize:", -[CMISmartStyleProcessorV1 _requestedMemSize:](self, "_requestedMemSize:", processingType));
    }
    else
    {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    v7 = 0;
  }

  return v7;
}

- (int)setup
{
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  if (!v4) {
    goto LABEL_16;
  }
  id v5 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v4 andOptionalCommandQueue:self->_metalCommandQueue];
  metalContext = self->_metalContext;
  self->_metalContext = v5;

  if (!self->_metalContext) {
    goto LABEL_16;
  }
  id v7 = objc_alloc((Class)FigMetalAllocator);
  id v8 = [(FigMetalContext *)self->_metalContext device];
  id v9 = (FigMetalAllocator *)[v7 initWithDevice:v8 allocatorType:2];
  cmImagingAllocator = self->_cmImagingAllocator;
  self->_cmImagingAllocator = v9;

  if (!self->_cmImagingAllocator)
  {
    FigDebugAssert3();
    int v14 = FigSignalErrorAt();
    goto LABEL_12;
  }
  metalCommandQueue = self->_metalCommandQueue;
  if (metalCommandQueue)
  {
    unint64_t v12 = metalCommandQueue;
  }
  else
  {
    unint64_t v12 = [(FigMetalContext *)self->_metalContext commandQueue];
  }
  BOOL v13 = self->_metalCommandQueue;
  self->_metalCommandQueue = v12;

  if (!self->_metalCommandQueue) {
    goto LABEL_16;
  }
  int v14 = 0;
  if (!self->_styleEngineProcessor && !CFPreferenceNumberWithDefault)
  {
    BOOL v15 = (CMIStyleEngineProcessor *)[objc_alloc((Class)CMIStyleEngineProcessor) initWithOptionalMetalCommandQueue:self->_metalCommandQueue withCoefficientSynchronization:1];
    styleEngineProcessor = self->_styleEngineProcessor;
    self->_styleEngineProcessor = v15;

    if (self->_styleEngineProcessor)
    {
LABEL_11:
      int v14 = 0;
      goto LABEL_12;
    }
LABEL_16:
    FigDebugAssert3();
    goto LABEL_11;
  }
LABEL_12:

  return v14;
}

- (int)prewarm
{
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  id v4 = [[CMISmartStyleProcessorUtilitiesV1 alloc] initWithStyleEngine:self->_styleEngineProcessor temporalFilterBufferSize:1 withMetalContext:self->_metalContext];
  utilities = self->_utilities;
  self->_utilities = (CMISmartStyleProcessorUtilities *)v4;

  if (!self->_utilities)
  {
    FigDebugAssert3();
    return 0;
  }
  if (CFPreferenceNumberWithDefault) {
    return 0;
  }
  if (![(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer prewarm])
  {
    v6 = +[CMIStyleEngineCommonSettings tuningParametersForUseCase:0];
    [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setTuningParameters:v6];

    id v7 = +[CMIStyleEngineCommonSettings configurationForUseCase:0];
    [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setConfiguration:v7];

    if (![(CMIStyleEngineProcessor *)self->_styleEngineProcessor setup]
      && ![(CMIStyleEngineProcessor *)self->_styleEngineProcessor prewarm])
    {
      id v8 = +[CMIStyleEngineCommonSettings tuningParametersForUseCase:1];
      [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setTuningParameters:v8];

      id v9 = +[CMIStyleEngineCommonSettings configurationForUseCase:1];
      [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setConfiguration:v9];

      if (![(CMIStyleEngineProcessor *)self->_styleEngineProcessor setup]
        && ![(CMIStyleEngineProcessor *)self->_styleEngineProcessor prewarm])
      {
        return 0;
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)resetState
{
  if ([(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer resetState]
    || (int result = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor resetState]) != 0)
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    self->_id processingType = 0;
  }
  return result;
}

- (void)setTuningParameters:(id)a3
{
  smartStylePixelBufferRenderer = self->_smartStylePixelBufferRenderer;
  id v5 = a3;
  [(CMISmartStylePixelBufferRenderer *)smartStylePixelBufferRenderer setTuningParameters:v5];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setTuningParameters:v5];
}

- (void)setCameraInfoByPortType:(id)a3
{
  smartStylePixelBufferRenderer = self->_smartStylePixelBufferRenderer;
  id v5 = a3;
  [(CMISmartStylePixelBufferRenderer *)smartStylePixelBufferRenderer setCameraInfoByPortType:v5];
  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setCameraInfoByPortType:v5];
}

+ (unint64_t)getSmartStyleCoefficientsFilterType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"iir"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"iir3"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"fir10"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)getDefaultProcessorConfigurationForStills
{
  v2 = objc_opt_new();
  objc_msgSend(v2, "setIntermediateStyleRendererThumbnailSize:", 1024.0, 768.0);
  id v3 = +[CMIStyleEngineCommonSettings configurationForUseCase:0];
  id v4 = [v3 copy];
  [v2 setStyleEngineConfiguration:v4];

  id v5 = +[CMIStyleEngineCommonSettings tuningParametersForUseCase:0];
  id v6 = [v5 copy];
  [v2 setStyleEngineTuningParameters:v6];

  return v2;
}

+ (id)getDefaultProcessorConfigurationForStreaming
{
  v2 = objc_opt_new();
  objc_msgSend(v2, "setIntermediateStyleRendererThumbnailSize:", 256.0, 192.0);
  id v3 = +[CMIStyleEngineCommonSettings configurationForUseCase:1];
  [v2 setStyleEngineConfiguration:v3];

  id v4 = +[CMIStyleEngineCommonSettings tuningParametersForUseCase:1];
  [v2 setStyleEngineTuningParameters:v4];

  [v2 setTemporalFilterInputBufferSize:0];

  return v2;
}

+ (id)getDefaultProcessorConfigurationForStreamingWithFilterType:(unint64_t)a3
{
  id v5 = [a1 getDefaultProcessorConfigurationForStreaming];
  objc_msgSend(v5, "setTemporalFilterInputBufferSize:", objc_msgSend(a1, "getRequiredInputBufferSizeForFilterType:", a3));

  return v5;
}

+ (unsigned)getRequiredFilteredCoefficientsPixelBufferPoolSizeForFilterType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return dword_17E50[a3 - 1];
  }
}

+ (unsigned)getRequiredInputBufferSizeForFilterType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return dword_17E60[a3 - 1];
  }
}

+ (id)getDefaultProcessorConfigurationForStillsReversibility
{
  v2 = objc_opt_new();
  objc_msgSend(v2, "setIntermediateStyleRendererThumbnailSize:", 1024.0, 768.0);
  id v3 = +[CMIStyleEngineCommonSettings configurationForUseCase:7];
  id v4 = [v3 copy];
  [v2 setStyleEngineConfiguration:v4];

  id v5 = +[CMIStyleEngineCommonSettings tuningParametersForUseCase:7];
  id v6 = [v5 copy];
  [v2 setStyleEngineTuningParameters:v6];

  return v2;
}

- (void)setConfiguration:(id)a3
{
  id v6 = a3;
  id v5 = objc_opt_class();
  if (([v5 isEqual:objc_opt_class()] & 1) == 0)
  {
    [(CMISmartStyleProcessorV1 *)self purgeResources];
    objc_storeStrong((id *)&self->_configuration, a3);
    self->_isSetupDone = 0;
  }
}

- (CMISmartStyleProcessorBaseConfiguration)configuration
{
  return self->_configuration;
}

- (int)_rendererProcessingTypeForProcessingType:(unsigned int)a3
{
  return ((int)(a3 << 28) >> 31) & 3 | (4 * ((a3 >> 4) & 1));
}

- (unsigned)_styleEngineProcessingTypeForProcessingType:(unsigned int)a3
{
  return a3 & 7;
}

- (int)_configureInputUnstyledPixelBufferForPixelBufferRenderer:(__CVBuffer *)a3 withinputUnstyledCropRect:(CGRect)a4 inputUnstyledThumbnailPixelBuffer:(__CVBuffer *)a5 withinputUnstyledThumbnailCropRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  if (a3)
  {
    double v12 = a4.size.height;
    double v13 = a4.size.width;
    double v14 = a4.origin.y;
    double v15 = a4.origin.x;
    uint64_t v16 = a3;
  }
  else
  {
    double v15 = a6.origin.x;
    double v14 = a6.origin.y;
    double v13 = a6.size.width;
    uint64_t v16 = a5;
    double v12 = a6.size.height;
    if (!a5) {
      goto LABEL_24;
    }
  }
  if (self->_intermediateStyleRendererThumbnailSize.width <= (double)CVPixelBufferGetWidth(a5))
  {
    size_t v17 = CVPixelBufferGetHeight(a5);
    double v18 = self->_intermediateStyleRendererThumbnailSize.height;
    if (v18 <= (double)v17 && width >= self->_intermediateStyleRendererThumbnailSize.width && height >= v18)
    {
      double v15 = x;
      double v14 = y;
      double v13 = width;
      uint64_t v16 = a5;
      double v12 = height;
    }
  }
  if (self->_intermediateStyleRendererThumbnailSize.width == (double)CVPixelBufferGetWidth(v16))
  {
    size_t v20 = CVPixelBufferGetHeight(v16);
    double v21 = self->_intermediateStyleRendererThumbnailSize.height;
    if (v21 == (double)v20 && v13 == self->_intermediateStyleRendererThumbnailSize.width && v12 == v21)
    {
      smartStylePixelBufferRenderer = self->_smartStylePixelBufferRenderer;
      double v25 = v16;
      goto LABEL_22;
    }
  }
  styleRendererInputUnstyledThumbnailPixelBuffer = self->_styleRendererInputUnstyledThumbnailPixelBuffer;
  if (!styleRendererInputUnstyledThumbnailPixelBuffer)
  {
    OSType v24 = [(CMISmartStyleProcessorV1 *)self _pixelFormatCompatibleWithStyleProcessing:CVPixelBufferGetPixelFormatType(v16)];
    if (CVPixelBufferCreate(kCFAllocatorDefault, (unint64_t)self->_intermediateStyleRendererThumbnailSize.width, (unint64_t)self->_intermediateStyleRendererThumbnailSize.height, v24, (CFDictionaryRef)self->_styleRendererPixelBufferAttributes, &self->_styleRendererInputUnstyledThumbnailPixelBuffer))
    {
      goto LABEL_24;
    }
    styleRendererInputUnstyledThumbnailPixelBuffer = self->_styleRendererInputUnstyledThumbnailPixelBuffer;
  }
  if (!-[CMISmartStyleProcessorUtilities downScalePixelBuffer:toPixelBuffer:inputROI:](self->_utilities, "downScalePixelBuffer:toPixelBuffer:inputROI:", v16, styleRendererInputUnstyledThumbnailPixelBuffer, v15, v14, v13, v12))
  {
    double v25 = self->_styleRendererInputUnstyledThumbnailPixelBuffer;
    smartStylePixelBufferRenderer = self->_smartStylePixelBufferRenderer;
LABEL_22:
    [(CMISmartStylePixelBufferRenderer *)smartStylePixelBufferRenderer setInputPixelBuffer:v25];
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputThumbnailPixelBuffer:a5];
    return 0;
  }
LABEL_24:

  return FigSignalErrorAt();
}

- (int)_configureInputLinearPixelBufferForPixelBufferRenderer:(__CVBuffer *)a3 withinputLinearCropRect:(CGRect)a4
{
  if (!a3)
  {
    FigDebugAssert3();
    goto LABEL_13;
  }
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  p_styleRendererInputLinearThumbnailPixelBuffer = &self->_styleRendererInputLinearThumbnailPixelBuffer;
  if (self->_styleRendererInputLinearThumbnailPixelBuffer)
  {
    unsigned int v11 = +[CMIStyleEngineProcessorUtilities numberOfPixelBufferPlanesThatNeedToBeBoundToMTLTextures:a3];
    unsigned int v12 = +[CMIStyleEngineProcessorUtilities numberOfPixelBufferPlanesThatNeedToBeBoundToMTLTextures:*p_styleRendererInputLinearThumbnailPixelBuffer];
    double v13 = *p_styleRendererInputLinearThumbnailPixelBuffer;
    if (v11 == v12)
    {
      if (v13) {
        goto LABEL_10;
      }
    }
    else if (v13)
    {
      CFRelease(*p_styleRendererInputLinearThumbnailPixelBuffer);
      *p_styleRendererInputLinearThumbnailPixelBuffer = 0;
    }
  }
  size_t v14 = (unint64_t)self->_intermediateStyleRendererThumbnailSize.width;
  size_t v15 = (unint64_t)self->_intermediateStyleRendererThumbnailSize.height;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (CVPixelBufferCreate(kCFAllocatorDefault, v14, v15, PixelFormatType, (CFDictionaryRef)self->_styleRendererPixelBufferAttributes, p_styleRendererInputLinearThumbnailPixelBuffer))
  {
    goto LABEL_13;
  }
  double v13 = *p_styleRendererInputLinearThumbnailPixelBuffer;
LABEL_10:
  if (!-[CMISmartStyleProcessorUtilities downScalePixelBuffer:toPixelBuffer:inputROI:](self->_utilities, "downScalePixelBuffer:toPixelBuffer:inputROI:", a3, v13, x, y, width, height))
  {
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setInputLinearPixelBuffer:self->_styleRendererInputLinearThumbnailPixelBuffer];
    return 0;
  }
LABEL_13:

  return FigSignalErrorAt();
}

- (int)_configureOutputStyledThumbnailPixelBufferForPixelBufferRenderer:(__CVBuffer *)a3 unstyledThumbnailPixelBuffer:(__CVBuffer *)a4
{
  if (a4) {
    id v7 = a4;
  }
  else {
    id v7 = a3;
  }
  OSType v8 = [(CMISmartStyleProcessorV1 *)self _pixelFormatCompatibleWithStyleProcessing:CVPixelBufferGetPixelFormatType(v7)];
  if (!self->_styleRendererOutputStyledThumbnailPixelBuffer
    && CVPixelBufferCreate(kCFAllocatorDefault, (unint64_t)self->_intermediateStyleRendererThumbnailSize.width, (unint64_t)self->_intermediateStyleRendererThumbnailSize.height, v8, (CFDictionaryRef)self->_styleRendererPixelBufferAttributes, &self->_styleRendererOutputStyledThumbnailPixelBuffer))
  {
    return FigSignalErrorAt();
  }
  else
  {
    if (a4) {
      id v9 = a4;
    }
    else {
      id v9 = a3;
    }
    CVBufferPropagateAttachments(v9, self->_styleRendererOutputStyledThumbnailPixelBuffer);
    [(CMISmartStylePixelBufferRenderer *)self->_smartStylePixelBufferRenderer setOutputPixelBuffer:self->_styleRendererOutputStyledThumbnailPixelBuffer];
    return 0;
  }
}

- (int)_configureStyleEngineTargetThumbnailPixelBuffer:(__CVBuffer *)a3 inputTargetThumbnailPixelBuffer:(__CVBuffer *)a4
{
  unsigned int v7 = [(CMISmartStyleProcessorV1 *)self _isStreaming];
  if (v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 3;
  }
  if (self->_shouldGenerateTarget)
  {
    double width = self->_styleEngineTargetThumbnailSize.width;
    double height = self->_styleEngineTargetThumbnailSize.height;
    if (self->_intermediateStyleRendererThumbnailSize.width == width
      && self->_intermediateStyleRendererThumbnailSize.height == height)
    {
      styleRendererOutputStyledThumbnailPixelBuffer = self->_styleRendererOutputStyledThumbnailPixelBuffer;
LABEL_38:
      styleEngineProcessor = self->_styleEngineProcessor;
      goto LABEL_39;
    }
    styleEngineInputTargetStyledThumbnailPixelBuffer = self->_styleEngineInputTargetStyledThumbnailPixelBuffer;
    if (!styleEngineInputTargetStyledThumbnailPixelBuffer)
    {
      size_t v13 = (unint64_t)width;
      size_t v14 = (unint64_t)height;
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(self->_styleRendererOutputStyledThumbnailPixelBuffer);
      if (CVPixelBufferCreate(kCFAllocatorDefault, v13, v14, PixelFormatType, (CFDictionaryRef)self->_styleEnginePixelBufferAttributes, &self->_styleEngineInputTargetStyledThumbnailPixelBuffer))
      {
        goto LABEL_41;
      }
      styleEngineInputTargetStyledThumbnailPixelBuffer = self->_styleEngineInputTargetStyledThumbnailPixelBuffer;
    }
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double v18 = CGRectNull.size.width;
    double v19 = CGRectNull.size.height;
    unsigned int v20 = -[CMISmartStyleProcessorUtilities downScalePixelBuffer:toPixelBuffer:inputROI:filterOption:](self->_utilities, "downScalePixelBuffer:toPixelBuffer:inputROI:filterOption:", self->_styleRendererOutputStyledThumbnailPixelBuffer, styleEngineInputTargetStyledThumbnailPixelBuffer, v8, CGRectNull.origin.x, y, v18, v19);
    if (v20) {
      char v21 = v7;
    }
    else {
      char v21 = 1;
    }
    if (v21) {
      goto LABEL_36;
    }
    utilities = self->_utilities;
    double v23 = self->_styleRendererOutputStyledThumbnailPixelBuffer;
    OSType v24 = self->_styleEngineInputTargetStyledThumbnailPixelBuffer;
    goto LABEL_35;
  }
  if (a4)
  {
    double v25 = (double)CVPixelBufferGetWidth(a4);
    double v26 = (double)CVPixelBufferGetHeight(a4);
    if (self->_styleEngineTargetThumbnailSize.width == v25 && self->_styleEngineTargetThumbnailSize.height == v26)
    {
      styleEngineProcessor = self->_styleEngineProcessor;
      styleRendererOutputStyledThumbnailPixelBuffer = a4;
LABEL_39:
      [(CMIStyleEngineProcessor *)styleEngineProcessor setTargetThumbnailPixelBuffer:styleRendererOutputStyledThumbnailPixelBuffer];
      return 0;
    }
    goto LABEL_41;
  }
  size_t v30 = CVPixelBufferGetWidth(a3);
  size_t v31 = CVPixelBufferGetHeight(a3);
  double v32 = self->_styleEngineTargetThumbnailSize.width;
  if (v32 >= (double)v30 && self->_styleEngineTargetThumbnailSize.height >= (double)v31)
  {
    styleEngineProcessor = self->_styleEngineProcessor;
    styleRendererOutputStyledThumbnailPixelBuffer = a3;
    goto LABEL_39;
  }
  double v33 = self->_styleEngineInputTargetStyledThumbnailPixelBuffer;
  if (!v33)
  {
    size_t v34 = (unint64_t)v32;
    size_t v35 = (unint64_t)self->_styleEngineTargetThumbnailSize.height;
    OSType v36 = CVPixelBufferGetPixelFormatType(a3);
    if (CVPixelBufferCreate(kCFAllocatorDefault, v34, v35, v36, (CFDictionaryRef)self->_styleEnginePixelBufferAttributes, &self->_styleEngineInputTargetStyledThumbnailPixelBuffer))
    {
      goto LABEL_41;
    }
    double v33 = self->_styleEngineInputTargetStyledThumbnailPixelBuffer;
  }
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double v18 = CGRectNull.size.width;
  double v19 = CGRectNull.size.height;
  unsigned int v20 = -[CMISmartStyleProcessorUtilities downScalePixelBuffer:toPixelBuffer:inputROI:filterOption:](self->_utilities, "downScalePixelBuffer:toPixelBuffer:inputROI:filterOption:", a3, v33, v8, CGRectNull.origin.x, y, v18, v19);
  if (v20) {
    char v37 = v7;
  }
  else {
    char v37 = 1;
  }
  if ((v37 & 1) == 0)
  {
    utilities = self->_utilities;
    OSType v24 = self->_styleEngineInputTargetStyledThumbnailPixelBuffer;
    double v23 = a3;
LABEL_35:
    unsigned int v20 = -[CMISmartStyleProcessorUtilities downScalePixelBuffer:toPixelBuffer:inputROI:filterOption:](utilities, "downScalePixelBuffer:toPixelBuffer:inputROI:filterOption:", v23, v24, 0, x, y, v18, v19);
  }
LABEL_36:
  if (!v20)
  {
    styleRendererOutputStyledThumbnailPixelBuffer = self->_styleEngineInputTargetStyledThumbnailPixelBuffer;
    goto LABEL_38;
  }
LABEL_41:

  return FigSignalErrorAt();
}

- (BOOL)_isStreaming
{
  return [(CMISmartStyleProcessorBaseConfiguration *)self->_configuration conformsToProtocol:&OBJC_PROTOCOL___CMISmartStyleProcessorStreamingConfiguration];
}

- (uint64_t)_configureStyleEngineInputUnstyledThumbnailPixelBuffer:(double)a3 withinputUnstyledCropRect:(double)a4 inputUnstyledThumbnailPixelBuffer:(double)a5 withinputUnstyledThumbnailCropRect:(double)a6 inputUnstyledThumbnailUsedForTargetGenerationPixelBuffer:(double)a7 withInputUnstyledThumbnailUsedForTargetGenerationCropRect:(double)a8
{
  if (a12) {
    a5 = a9;
  }
  if (a12) {
    a4 = a8;
  }
  if (a12) {
    a3 = a7;
  }
  if (a12) {
    a2 = a6;
  }
  if (a12) {
    a11 = a12;
  }
  if (a13
    && *(double *)(a1 + 152) < (double)CVPixelBufferGetWidth(a13)
    && *(double *)(a1 + 160) < (double)CVPixelBufferGetHeight(a13))
  {
    a11 = a13;
    a2 = a14;
    a3 = a15;
    a4 = a16;
    a5 = a17;
  }
  unsigned int v27 = [(id)a1 _isStreaming];
  if (a13) {
    int v28 = v27;
  }
  else {
    int v28 = 1;
  }
  if (v28) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = 3;
  }
  if (*(double *)(a1 + 152) == (double)CVPixelBufferGetWidth(a11))
  {
    size_t Height = CVPixelBufferGetHeight(a11);
    double v31 = *(double *)(a1 + 160);
    if (v31 == (double)Height && a4 == *(double *)(a1 + 152) && a5 == v31)
    {
      double v38 = *(void **)(a1 + 48);
      char v37 = a11;
      goto LABEL_42;
    }
  }
  uint64_t v33 = *(void *)(a1 + 112);
  if (!v33)
  {
    OSType v34 = [(id)a1 _pixelFormatCompatibleWithStyleProcessing:CVPixelBufferGetPixelFormatType(a11)];
    if (CVPixelBufferCreate(kCFAllocatorDefault, (unint64_t)*(double *)(a1 + 152), (unint64_t)*(double *)(a1 + 160), v34, *(CFDictionaryRef *)(a1 + 128), (CVPixelBufferRef *)(a1 + 112)))
    {
      goto LABEL_44;
    }
    uint64_t v33 = *(void *)(a1 + 112);
  }
  unsigned int v35 = objc_msgSend(*(id *)(a1 + 56), "downScalePixelBuffer:toPixelBuffer:inputROI:filterOption:", a11, v33, v29, a2, a3, a4, a5);
  if (v35) {
    char v36 = v28;
  }
  else {
    char v36 = 1;
  }
  if ((v36 & 1) == 0) {
    unsigned int v35 = objc_msgSend(*(id *)(a1 + 56), "downScalePixelBuffer:toPixelBuffer:inputROI:filterOption:", a11, *(void *)(a1 + 112), 0, a2, a3, a4, a5);
  }
  if (!v35)
  {
    char v37 = *(__CVBuffer **)(a1 + 112);
    double v38 = *(void **)(a1 + 48);
LABEL_42:
    [v38 setInputThumbnailPixelBuffer:v37];
    return 0;
  }
LABEL_44:

  return FigSignalErrorAt();
}

- (unsigned)_pixelFormatCompatibleWithStyleProcessing:(unsigned int)a3
{
  FigCaptureUncompressedPixelFormatForPixelFormat();
  unsigned int result = FigCaptureUnPackedPixelFormatForPixelFormat();
  if ((result & 0xFFFFFFEF) == 0x34323066) {
    return 1111970369;
  }
  return result;
}

- (MTLTexture)outputIntegratedStyleCoefficientsTexture
{
  return (MTLTexture *)[(CMIStyleEngineProcessor *)self->_styleEngineProcessor outputIntegratedCoefficients];
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (NSString)instanceLabel
{
  return self->_instanceLabel;
}

- (void)setInstanceLabel:(id)a3
{
}

- (CMISmartStyleProcessorUtilities)utilities
{
  return self->_utilities;
}

- (CMISmartStyleProcessorInputOutput)inputOutput
{
  return self->_inputOutput;
}

- (void)setInputOutput:(id)a3
{
}

- (__CVBuffer)styleRendererOutputStyledThumbnailPixelBuffer
{
  return self->_styleRendererOutputStyledThumbnailPixelBuffer;
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
}

- (BOOL)shouldFlushCVMTLTextureCacheAfterProcessing
{
  return self->_shouldFlushCVMTLTextureCacheAfterProcessing;
}

- (void)setShouldFlushCVMTLTextureCacheAfterProcessing:(BOOL)a3
{
  self->_shouldFlushCVMTLTextureCacheAfterProcessing = a3;
}

- (BOOL)useLiveMetalAllocations
{
  return self->_useLiveMetalAllocations;
}

- (void)setUseLiveMetalAllocations:(BOOL)a3
{
  self->_useLiveMetalAllocations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputIntegratedStyleCoefficientsTexture, 0);
  objc_storeStrong((id *)&self->_inputOutput, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_instanceLabel, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_previousStyle, 0);
  objc_storeStrong((id *)&self->_styleEnginePixelBufferAttributes, 0);
  objc_storeStrong((id *)&self->_styleRendererPixelBufferAttributes, 0);
  objc_storeStrong((id *)&self->_subjectRelightingStage, 0);
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_styleEngineProcessor, 0);
  objc_storeStrong((id *)&self->_smartStylePixelBufferRenderer, 0);
  objc_storeStrong((id *)&self->_cmImagingAllocator, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_usedMemoryResource, 0);

  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
}

@end