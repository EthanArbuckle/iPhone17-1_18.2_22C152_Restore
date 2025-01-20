@interface CMIColourConstancyProcessorV1
- (BOOL)clippingRecoveryEnabled;
- (BOOL)saturationBoostEnabled;
- (BOOL)supportsExternalMemoryResource;
- (CMIColourConstancyProcessorDelegate)delegate;
- (CMIExternalMemoryResource)externalMemoryResource;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSMutableDictionary)confidenceMapMetadata;
- (NSMutableDictionary)outputImageMetadata;
- (__CVBuffer)outputColourAccuracyConfidenceImagePixelBuffer;
- (__CVBuffer)outputImagePixelBuffer;
- (float)outputCenterWeightedMeanColourAccuracyConfidenceLevel;
- (id)externalMemoryDescriptorForConfiguration:(id)a3;
- (int)addFrame:(__CVBuffer *)a3 metadata:(id)a4 frameType:(unsigned int)a5 frameParams:(id)a6;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (void)dealloc;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setClippingRecoveryEnabled:(BOOL)a3;
- (void)setConfidenceMapMetadata:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalMemoryResource:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutputCenterWeightedMeanColourAccuracyConfidenceLevel:(float)a3;
- (void)setOutputColourAccuracyConfidenceImagePixelBuffer:(__CVBuffer *)a3;
- (void)setOutputImageMetadata:(id)a3;
- (void)setOutputImagePixelBuffer:(__CVBuffer *)a3;
- (void)setSaturationBoostEnabled:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation CMIColourConstancyProcessorV1

- (void)dealloc
{
  [(CMIColourConstancyProcessorV1 *)self resetState];
  v3.receiver = self;
  v3.super_class = (Class)CMIColourConstancyProcessorV1;
  [(CMIColourConstancyProcessorV1 *)&v3 dealloc];
}

- (int)setup
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  objc_super v3 = +[NSBundle bundleForClass:objc_opt_class()];
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v4 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v3 andOptionalCommandQueue:self->_metalCommandQueue];
  metalContext = self->_metalContext;
  self->_metalContext = v4;

  if (!self->_metalContext)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  id v6 = objc_alloc((Class)FigMetalAllocator);
  v7 = [(FigMetalContext *)self->_metalContext device];
  id v8 = [v6 initWithDevice:v7 allocatorType:2];
  [(FigMetalContext *)self->_metalContext setAllocator:v8];

  v9 = [(FigMetalContext *)self->_metalContext allocator];

  if (!v9)
  {
LABEL_11:
    int v10 = FigSignalErrorAt();
    goto LABEL_7;
  }
  int v10 = sub_10914((uint64_t)self);
  if (v10) {
    FigDebugAssert3();
  }
LABEL_7:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v10;
}

- (int)prewarm
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  int v3 = sub_10914((uint64_t)self);
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  return v3;
}

- (void)setExternalMemoryResource:(id)a3
{
  objc_storeStrong((id *)&self->_externalMemoryResource, a3);
  id v5 = a3;
  [(CMIColourConstancyCoreV1 *)self->_colourConstancyCoreProcessor setExternalMemoryResource:v5];
}

- (BOOL)supportsExternalMemoryResource
{
  return 1;
}

- (id)externalMemoryDescriptorForConfiguration:(id)a3
{
  v4 = objc_opt_new();
  id v5 = v4;
  if (v4)
  {
    if (!self || self->_allocatorSetupComplete)
    {
      uint64_t v6 = 0;
    }
    else
    {
      self->_enableDebuggingOutput = 0;
      uint64_t v6 = 92274688;
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
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (self->_allocatorSetupComplete)
  {
    int v4 = 0;
    goto LABEL_19;
  }
  id v5 = [(FigMetalContext *)self->_metalContext allocator];

  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    v7 = v6;
    if (!v6)
    {
      FigDebugAssert3();
      int v4 = FigSignalErrorAt();
      goto LABEL_18;
    }
    [v6 setWireMemory:1];
    [v7 setResourceOptions:512];
    [v7 setLabel:@"FigMetalAllocator_ColourConstancy"];
    if (!self->_externalMemoryResource
      || ![(CMIColourConstancyProcessorV1 *)self supportsExternalMemoryResource])
    {
      if (self->_allocatorSetupComplete)
      {
        uint64_t v11 = 0;
      }
      else
      {
        self->_enableDebuggingOutput = 0;
        uint64_t v11 = 92274688;
      }
      [v7 setMemSize:v11];
      v12 = [(FigMetalContext *)self->_metalContext allocator];
      int v4 = [v12 setupWithDescriptor:v7];

      if (v4)
      {
        FigSignalErrorAt();
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    id v8 = [(CMIExternalMemoryResource *)self->_externalMemoryResource allocatorBackend];
    v9 = v8;
    if (v8)
    {
      if (self->_allocatorSetupComplete)
      {
        FigDebugAssert3();
      }
      else
      {
        self->_enableDebuggingOutput = 0;
        if ((unint64_t)[v8 memSize] >> 23 >= 0xB)
        {
          objc_msgSend(v7, "setMemSize:", objc_msgSend(v9, "memSize"));
          int v10 = [(FigMetalContext *)self->_metalContext allocator];
          int v4 = [v10 setupWithDescriptor:v7 allocatorBackend:v9];

          if (!v4)
          {

LABEL_17:
            int v4 = 0;
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
      int v4 = 0;
      goto LABEL_30;
    }
    int v4 = FigSignalErrorAt();
    goto LABEL_30;
  }
  int v4 = FigSignalErrorAt();
LABEL_19:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  return v4;
}

- (int)process
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (!self->_allocatorSetupComplete)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    FigDebugAssert3();
    int v50 = 6;
    goto LABEL_49;
  }
  ambientPixelBuffer = self->_ambientPixelBuffer;
  if (!ambientPixelBuffer)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
LABEL_70:
    FigDebugAssert3();
    int v50 = 1;
    goto LABEL_49;
  }
  if (!self->_processorData.brackets[0].bracketMetadata)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  if (!self->_processorData.brackets[0].lumaTexture)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  if (!self->_processorData.brackets[0].chromaTexture)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  if (!self->_flashPixelBuffer)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  if (!self->_processorData.brackets[1].bracketMetadata)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  if (!self->_processorData.brackets[1].lumaTexture)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  if (!self->_processorData.brackets[1].chromaTexture)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  if (!self->_outputImagePixelBuffer)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  if (!self->_outputColourAccuracyConfidenceImagePixelBuffer)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ambientPixelBuffer);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(self->_flashPixelBuffer))
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    FigDebugAssert3();
    int v50 = 0;
    goto LABEL_49;
  }
  size_t Width = CVPixelBufferGetWidth(self->_ambientPixelBuffer);
  if (Width != CVPixelBufferGetWidth(self->_flashPixelBuffer))
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  size_t Height = CVPixelBufferGetHeight(self->_ambientPixelBuffer);
  if (Height != CVPixelBufferGetHeight(self->_flashPixelBuffer))
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  size_t v8 = CVPixelBufferGetWidth(self->_outputImagePixelBuffer);
  if (v8 != CVPixelBufferGetWidth(self->_flashPixelBuffer))
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  size_t v9 = CVPixelBufferGetHeight(self->_outputImagePixelBuffer);
  if (v9 != CVPixelBufferGetHeight(self->_flashPixelBuffer))
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  CVPixelBufferGetPixelFormatType(self->_outputImagePixelBuffer);
  if (FigCaptureUncompressedPixelFormatForPixelFormat() != 875704422)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  CVPixelBufferGetPixelFormatType(self->_outputColourAccuracyConfidenceImagePixelBuffer);
  if (FigCaptureUncompressedPixelFormatForPixelFormat() != 1278226488)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_70;
  }
  int v10 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:self->_outputImagePixelBuffer pixelFormat:10 usage:7 plane:0];
  outputLumaTexture = self->_processorData.outputLumaTexture;
  self->_processorData.outputLumaTexture = v10;

  if (!self->_processorData.outputLumaTexture)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
LABEL_74:
    FigDebugAssert3();
    int v50 = 4;
    goto LABEL_49;
  }
  v12 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:self->_outputImagePixelBuffer pixelFormat:30 usage:7 plane:1];
  outputChromaTexture = self->_processorData.outputChromaTexture;
  self->_processorData.outputChromaTexture = v12;

  if (!self->_processorData.outputChromaTexture)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_74;
  }
  v14 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:self->_outputColourAccuracyConfidenceImagePixelBuffer pixelFormat:10 usage:7 plane:0];
  outputColourAccuracyConfidenceTexture = self->_processorData.outputColourAccuracyConfidenceTexture;
  self->_processorData.outputColourAccuracyConfidenceTexture = v14;

  if (!self->_processorData.outputColourAccuracyConfidenceTexture)
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    goto LABEL_74;
  }
  if (gGMFigKTraceEnabled == 1)
  {
    kdebug_trace();
    if (gGMFigKTraceEnabled == 1)
    {
      kdebug_trace();
      if (gGMFigKTraceEnabled == 1)
      {
        kdebug_trace();
        if (gGMFigKTraceEnabled == 1) {
          kdebug_trace();
        }
      }
    }
  }
  v16 = [(NSDictionary *)self->_processorData.brackets[1].bracketMetadata objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_MinimumValidBufferRectForGDC];
  CFDictionaryRef v17 = [(NSDictionary *)self->_processorData.brackets[1].bracketMetadata objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_FinalCropRect];
  CFDictionaryRef v18 = v17;
  CFDictionaryRef v54 = v17;
  if (!v16)
  {
    if (v17)
    {
      memset(&rect, 0, sizeof(rect));
      if (CGRectMakeWithDictionaryRepresentation(v17, &rect))
      {
        v22 = [(NSDictionary *)self->_processorData.brackets[1].bracketMetadata objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_StillImageProcessingMetadata];
        v23 = [v22 objectForKeyedSubscript:kFigCaptureStillImageProcessingMetadataKey_FinalAspectRatio];
        [v23 doubleValue];

        [(MTLTexture *)self->_processorData.brackets[1].lumaTexture width];
        [(MTLTexture *)self->_processorData.brackets[1].lumaTexture height];
        FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect();
        double x = v58.origin.x;
        double y = v58.origin.y;
        double v26 = v58.size.width;
        double v27 = v58.size.height;
        if (!CGRectIsNull(v58))
        {
          unsigned int v19 = (int)v26;
          unint64_t v20 = (int)v27;
          unint64_t v21 = (int)x | ((unint64_t)(int)y << 32);
LABEL_37:
          confidenceMapMetadata = self->_confidenceMapMetadata;
          self->_confidenceMapMetadata = 0;

          goto LABEL_38;
        }
        uint64_t v53 = v2;
        LODWORD(v52) = 0;
      }
      else
      {
        uint64_t v53 = v2;
        LODWORD(v52) = 0;
      }
      FigDebugAssert3();

      goto LABEL_88;
    }
    unsigned int v19 = [(MTLTexture *)self->_processorData.brackets[1].lumaTexture width];
    unint64_t v21 = 0;
    unint64_t v20 = (unint64_t)[(MTLTexture *)self->_processorData.brackets[1].lumaTexture height];
    goto LABEL_37;
  }
  memset(&rect, 0, sizeof(rect));
  if (!CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v16, &rect))
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    FigDebugAssert3();

LABEL_88:
    int v50 = 2;
    goto LABEL_49;
  }
  unsigned int v19 = (int)rect.size.width;
  unint64_t v20 = (int)rect.size.height;
  unint64_t v21 = (int)rect.origin.x | ((unint64_t)(int)rect.origin.y << 32);
  FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata();
  [(MTLTexture *)self->_processorData.brackets[1].lumaTexture width];
  [(MTLTexture *)self->_processorData.brackets[1].lumaTexture height];
  CVPixelBufferGetWidth(self->_outputColourAccuracyConfidenceImagePixelBuffer);
  CVPixelBufferGetHeight(self->_outputColourAccuracyConfidenceImagePixelBuffer);
  FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop();
LABEL_38:
  CFDictionaryRef v29 = [(NSDictionary *)self->_processorData.brackets[1].bracketMetadata objectForKeyedSubscript:kFigCaptureStreamMetadata_SensorCropRect];
  if (v29)
  {
    CFDictionaryRef v30 = v29;
    memset(&v56, 0, sizeof(v56));
    if (CGRectMakeWithDictionaryRepresentation(v29, &v56))
    {
      char v55 = 0;
      unsigned int v31 = [(NSDictionary *)self->_processorData.brackets[1].bracketMetadata cmi_intValueForKey:kFigCaptureStreamMetadata_RawSensorWidth defaultValue:0 found:&v55];
      if (v55)
      {
        unsigned int v32 = v31;
        unsigned int v33 = [(NSDictionary *)self->_processorData.brackets[1].bracketMetadata cmi_intValueForKey:kFigCaptureStreamMetadata_RawSensorHeight defaultValue:0 found:&v55];
        if (v55)
        {
          unsigned int v34 = v33;
          int v35 = v32 - [(MTLTexture *)self->_processorData.brackets[1].lumaTexture width];
          if (v35 < 0)
          {
            uint64_t v53 = v2;
            LODWORD(v52) = 0;
          }
          else
          {
            int v36 = v34 - [(MTLTexture *)self->_processorData.brackets[1].lumaTexture height];
            if (v36 >= 0)
            {
              if ([(NSDictionary *)self->_processorData.brackets[1].bracketMetadata cmi_intValueForKey:kFigCaptureStreamMetadata_QuadraBinningFactor defaultValue:0 found:0] == 1)
              {
                unsigned int v37 = (int)v56.origin.x + v21;
                int v38 = (int)v56.origin.y + HIDWORD(v21);
                char v39 = 1;
                unint64_t v40 = (unint64_t)vadd_s32((int32x2_t)__PAIR64__(v34, v32), (int32x2_t)__PAIR64__(v34, v32));
              }
              else
              {
                char v39 = 0;
                unsigned int v37 = v21 + (v35 >> 1);
                int v38 = HIDWORD(v21) + (v36 >> 1);
                unint64_t v40 = __PAIR64__(v34, v32);
              }
              *(void *)&rect.origin.double x = __PAIR64__(v20, v19);
              *(void *)&rect.origin.double y = __PAIR64__(v38, v37);
              LOBYTE(rect.size.width) = v39;
              *(_WORD *)((char *)&rect.size.width + 1) = 0;
              BYTE3(rect.size.width) = 0;
              unsigned int v41 = sub_120BC((uint64_t)self, v19 | (v20 << 32), v21, (long long *)&rect, *(double *)&v40);
              if (v41)
              {
                int v50 = v41;
                uint64_t v53 = v2;
                LODWORD(v52) = 0;
                FigDebugAssert3();
              }
              else
              {
                [(NSMutableDictionary *)self->_outputImageMetadata setObject:&__kCFBooleanTrue forKeyedSubscript:kFigCaptureSampleBufferMetadata_ConstantColorApplied];
                *(float *)&double v42 = self->_outputCenterWeightedMeanColourAccuracyConfidenceLevel;
                v43 = +[NSNumber numberWithFloat:v42];
                [(NSMutableDictionary *)self->_outputImageMetadata setObject:v43 forKeyedSubscript:kFigCaptureSampleBufferMetadata_ConstantColorCenterWeightedMeanConfidenceLevel];

                [(NSMutableDictionary *)self->_outputImageMetadata setObject:&off_31790 forKeyedSubscript:kFigCaptureSampleBufferMetadata_ConstantColorAnalyticsVersion];
                LODWORD(v44) = *(_DWORD *)self->_strobeWhitePoint;
                v45 = +[NSNumber numberWithFloat:v44];
                [(NSMutableDictionary *)self->_outputImageMetadata setObject:v45 forKeyedSubscript:kFigCaptureSampleBufferMetadata_ConstantColorStrobeWhitePointRGain];

                LODWORD(v46) = *(_DWORD *)&self->_strobeWhitePoint[4];
                v47 = +[NSNumber numberWithFloat:v46];
                [(NSMutableDictionary *)self->_outputImageMetadata setObject:v47 forKeyedSubscript:kFigCaptureSampleBufferMetadata_ConstantColorStrobeWhitePointGGain];

                LODWORD(v48) = *(_DWORD *)&self->_strobeWhitePoint[8];
                v49 = +[NSNumber numberWithFloat:v48];
                [(NSMutableDictionary *)self->_outputImageMetadata setObject:v49 forKeyedSubscript:kFigCaptureSampleBufferMetadata_ConstantColorStrobeWhitePointBGain];

                [(CMIColourConstancyCoreV1 *)self->_colourConstancyCoreProcessor figProcessorDebugDump];
                int v50 = 0;
              }
              goto LABEL_49;
            }
            uint64_t v53 = v2;
            LODWORD(v52) = 0;
          }
        }
        else
        {
          uint64_t v53 = v2;
          LODWORD(v52) = 0;
        }
      }
      else
      {
        uint64_t v53 = v2;
        LODWORD(v52) = 0;
      }
    }
    else
    {
      uint64_t v53 = v2;
      LODWORD(v52) = 0;
    }
    FigDebugAssert3();
  }
  else
  {
    uint64_t v53 = v2;
    LODWORD(v52) = 0;
    FigDebugAssert3();
  }

  int v50 = 2;
LABEL_49:
  [(CMIColourConstancyCoreV1 *)self->_colourConstancyCoreProcessor purgeResources];
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  return v50;
}

- (int)purgeResources
{
  int v3 = [(FigMetalContext *)self->_metalContext allocator];
  id v4 = [v3 usedSizeAll];

  if (v4)
  {
    FigDebugAssert3();
  }
  else
  {
    id v5 = [(FigMetalContext *)self->_metalContext allocator];
    [v5 reset];

    uint64_t v6 = [(FigMetalContext *)self->_metalContext allocator];
    [v6 purgeResources];
  }
  return 0;
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

  lscGainsTexture = self->_processorData.brackets[0].lscGainsTexture;
  self->_processorData.brackets[0].lscGainsTexture = 0;

  bracketMetadata = self->_processorData.brackets[0].bracketMetadata;
  self->_processorData.brackets[0].bracketMetadata = 0;

  CVPixelBufferRelease(self->_flashPixelBuffer);
  self->_flashPixelBuffer = 0;
  flashFrameParams = self->_flashFrameParams;
  self->_flashFrameParams = 0;

  *(_OWORD *)self->_strobeWhitePoint = 0u;
  size_t v9 = self->_processorData.brackets[1].lumaTexture;
  self->_processorData.brackets[1].lumaTexture = 0;

  int v10 = self->_processorData.brackets[1].chromaTexture;
  self->_processorData.brackets[1].chromaTexture = 0;

  uint64_t v11 = self->_processorData.brackets[1].lscGainsTexture;
  self->_processorData.brackets[1].lscGainsTexture = 0;

  v12 = self->_processorData.brackets[1].bracketMetadata;
  self->_processorData.brackets[1].bracketMetadata = 0;

  CVPixelBufferRelease(self->_outputImagePixelBuffer);
  CVPixelBufferRelease(self->_outputColourAccuracyConfidenceImagePixelBuffer);
  self->_outputImagePixelBuffer = 0;
  self->_outputColourAccuracyConfidenceImagePixelBuffer = 0;
  outputLumaTexture = self->_processorData.outputLumaTexture;
  self->_processorData.outputLumaTexture = 0;

  outputChromaTexture = self->_processorData.outputChromaTexture;
  self->_processorData.outputChromaTexture = 0;

  outputColourAccuracyConfidenceTexture = self->_processorData.outputColourAccuracyConfidenceTexture;
  self->_processorData.outputColourAccuracyConfidenceTexture = 0;

  outputImageMetadata = self->_outputImageMetadata;
  self->_outputImageMetadata = 0;

  confidenceMapMetadata = self->_confidenceMapMetadata;
  self->_confidenceMapMetadata = 0;

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
    id v14 = 0;
    int v30 = 6;
    goto LABEL_35;
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !v12
    || CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v12 lscGains]) != 1380411457)
  {
    FigDebugAssert3();
    id v14 = 0;
    goto LABEL_34;
  }
  v13 = [(FigMetalContext *)self->_metalContext allocator];
  id v14 = [v13 newTextureDescriptor];

  if (!v14)
  {
    FigDebugAssert3();
    int v30 = 7;
    goto LABEL_35;
  }
  if (!v11)
  {
    FigDebugAssert3();
    int v30 = 2;
    goto LABEL_35;
  }
  CVPixelBufferGetPixelFormatType(a3);
  if (FigCaptureUncompressedPixelFormatForPixelFormat() != 1751527984) {
    goto LABEL_33;
  }
  if (!self->_isSetupTuningParametersDone)
  {
    v15 = [v11 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType];
    v16 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:v15];
    sub_13058((uint64_t)self, v16);
  }
  if (!CVPixelBufferIsPlanar(a3) || CVPixelBufferGetPlaneCount(a3) != 2) {
    goto LABEL_33;
  }
  if (a5)
  {
    if (a5 == 1)
    {
      uint64_t v17 = 120;
      uint64_t v18 = 56;
      uint64_t v19 = 40;
      goto LABEL_18;
    }
LABEL_34:
    int v30 = 1;
    goto LABEL_35;
  }
  uint64_t v17 = 80;
  uint64_t v18 = 48;
  uint64_t v19 = 32;
LABEL_18:
  *(Class *)((char *)&self->super.isa + v19) = CVPixelBufferRetain(a3);
  objc_storeStrong((id *)((char *)&self->super.isa + v18), a6);
  unint64_t v20 = (char *)self + v17;
  objc_storeStrong((id *)(&self->_allocatorSetupComplete + v17), a4);
  if (![v12 lscGains])
  {
LABEL_33:
    FigDebugAssert3();
    goto LABEL_34;
  }
  uint64_t v21 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", [v12 lscGains], 115, 23, 0);
  v22 = (void *)*((void *)v20 + 3);
  *((void *)v20 + 3) = v21;

  if (*((void *)v20 + 3))
  {
    v23 = [v12 lscParams];

    if (v23)
    {
      uint64_t v24 = [v12 lscParams];
      v25 = (void *)*((void *)v20 + 4);
      *((void *)v20 + 4) = v24;

      uint64_t v26 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:25 usage:7 plane:0];
      double v27 = *(void **)v20;
      *(void *)unint64_t v20 = v26;

      if (*(void *)v20)
      {
        uint64_t v28 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:65 usage:7 plane:1];
        CFDictionaryRef v29 = (void *)*((void *)v20 + 1);
        *((void *)v20 + 1) = v28;

        if (*((void *)v20 + 1))
        {
          int v30 = 0;
          goto LABEL_35;
        }
      }
      goto LABEL_38;
    }
    goto LABEL_33;
  }
LABEL_38:
  FigDebugAssert3();
  int v30 = 4;
LABEL_35:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v30;
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
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

- (NSMutableDictionary)confidenceMapMetadata
{
  return self->_confidenceMapMetadata;
}

- (void)setConfidenceMapMetadata:(id)a3
{
}

- (__CVBuffer)outputColourAccuracyConfidenceImagePixelBuffer
{
  return self->_outputColourAccuracyConfidenceImagePixelBuffer;
}

- (void)setOutputColourAccuracyConfidenceImagePixelBuffer:(__CVBuffer *)a3
{
}

- (float)outputCenterWeightedMeanColourAccuracyConfidenceLevel
{
  return self->_outputCenterWeightedMeanColourAccuracyConfidenceLevel;
}

- (void)setOutputCenterWeightedMeanColourAccuracyConfidenceLevel:(float)a3
{
  self->_outputCenterWeightedMeanColourAccuracyConfidenceLevel = a3;
}

- (BOOL)clippingRecoveryEnabled
{
  return self->_clippingRecoveryEnabled;
}

- (void)setClippingRecoveryEnabled:(BOOL)a3
{
  self->_clippingRecoveryEnabled = a3;
}

- (BOOL)saturationBoostEnabled
{
  return self->_saturationBoostEnabled;
}

- (void)setSaturationBoostEnabled:(BOOL)a3
{
  self->_saturationBoostEnabled = a3;
}

- (CMIColourConstancyProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CMIColourConstancyProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_confidenceMapMetadata, 0);
  objc_storeStrong((id *)&self->_outputImageMetadata, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_colourConstancyCoreProcessor, 0);
  objc_storeStrong((id *)&self->_colourConstancyCoreConfig, 0);
  sub_16728((uint64_t)&self->_processorData);
  objc_storeStrong((id *)&self->_flashFrameParams, 0);
  objc_storeStrong((id *)&self->_ambientFrameParams, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end