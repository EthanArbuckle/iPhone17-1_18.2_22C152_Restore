void CFRelease(CFTypeRef cf)
{
  _CFRelease(cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return _CMGetAttachment(target, key, attachmentModeOut);
}

uint64_t CMIGetMetalPixelFormatForPixelBuffer()
{
  return _CMIGetMetalPixelFormatForPixelBuffer();
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return _CVMetalTextureCacheCreate(allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return _CVMetalTextureCacheCreateTextureFromImage(allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex, textureOut);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return _CVMetalTextureGetTexture(image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreate(allocator, width, height, pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return _FigCFDictionaryGetCGRectIfPresent();
}

uint64_t FigCaptureMetadataUtilitiesRectNormalizedToRect()
{
  return _FigCaptureMetadataUtilitiesRectNormalizedToRect();
}

uint64_t FigCaptureUnPackedPixelFormatForPixelFormat()
{
  return _FigCaptureUnPackedPixelFormatForPixelFormat();
}

uint64_t FigCaptureUncompressedPixelFormatForPixelFormat()
{
  return _FigCaptureUncompressedPixelFormatForPixelFormat();
}

uint64_t FigDebugAssert3()
{
  return _FigDebugAssert3();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return _FigGetCFPreferenceNumberWithDefault();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t fig_log_get_emitter()
{
  return _fig_log_get_emitter();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__compileShaders(void *a1, const char *a2, ...)
{
  return [a1 _compileShaders];
}

id objc_msgSend__isStreaming(void *a1, const char *a2, ...)
{
  return [a1 _isStreaming];
}

id objc_msgSend_allocatorBackend(void *a1, const char *a2, ...)
{
  return [a1 allocatorBackend];
}

id objc_msgSend_applyDither(void *a1, const char *a2, ...)
{
  return [a1 applyDither];
}

id objc_msgSend_backendAllocator(void *a1, const char *a2, ...)
{
  return [a1 backendAllocator];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_castIntensity(void *a1, const char *a2, ...)
{
  return [a1 castIntensity];
}

id objc_msgSend_castType(void *a1, const char *a2, ...)
{
  return [a1 castType];
}

id objc_msgSend_colorBias(void *a1, const char *a2, ...)
{
  return [a1 colorBias];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commandQueue(void *a1, const char *a2, ...)
{
  return [a1 commandQueue];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_deltaMapRegionToRenderRect(void *a1, const char *a2, ...)
{
  return [a1 deltaMapRegionToRenderRect];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getDefaultProcessorConfigurationForStreaming(void *a1, const char *a2, ...)
{
  return [a1 getDefaultProcessorConfigurationForStreaming];
}

id objc_msgSend_globalLinearSystemMixFactor(void *a1, const char *a2, ...)
{
  return [a1 globalLinearSystemMixFactor];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_inputCropRectWithinPrimaryCaptureRect(void *a1, const char *a2, ...)
{
  return [a1 inputCropRectWithinPrimaryCaptureRect];
}

id objc_msgSend_inputDeltaMapPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputDeltaMapPixelBuffer];
}

id objc_msgSend_inputGainMapPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputGainMapPixelBuffer];
}

id objc_msgSend_inputLearningTargetPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputLearningTargetPixelBuffer];
}

id objc_msgSend_inputLearningTargetThumbnailPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputLearningTargetThumbnailPixelBuffer];
}

id objc_msgSend_inputLinearCropRect(void *a1, const char *a2, ...)
{
  return [a1 inputLinearCropRect];
}

id objc_msgSend_inputLinearMetadataDict(void *a1, const char *a2, ...)
{
  return [a1 inputLinearMetadataDict];
}

id objc_msgSend_inputLinearPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputLinearPixelBuffer];
}

id objc_msgSend_inputMetadataDict(void *a1, const char *a2, ...)
{
  return [a1 inputMetadataDict];
}

id objc_msgSend_inputPersonMaskCropRect(void *a1, const char *a2, ...)
{
  return [a1 inputPersonMaskCropRect];
}

id objc_msgSend_inputPersonMaskPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputPersonMaskPixelBuffer];
}

id objc_msgSend_inputPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputPixelBuffer];
}

id objc_msgSend_inputReferenceForDeltaMapComputationCropRect(void *a1, const char *a2, ...)
{
  return [a1 inputReferenceForDeltaMapComputationCropRect];
}

id objc_msgSend_inputReferenceForDeltaMapComputationPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputReferenceForDeltaMapComputationPixelBuffer];
}

id objc_msgSend_inputSRLPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputSRLPixelBuffer];
}

id objc_msgSend_inputSkinMaskCropRect(void *a1, const char *a2, ...)
{
  return [a1 inputSkinMaskCropRect];
}

id objc_msgSend_inputSkinMaskPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputSkinMaskPixelBuffer];
}

id objc_msgSend_inputSkyMaskCropRect(void *a1, const char *a2, ...)
{
  return [a1 inputSkyMaskCropRect];
}

id objc_msgSend_inputSkyMaskPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputSkyMaskPixelBuffer];
}

id objc_msgSend_inputSmartStyle(void *a1, const char *a2, ...)
{
  return [a1 inputSmartStyle];
}

id objc_msgSend_inputStyleCoefficientsPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputStyleCoefficientsPixelBuffer];
}

id objc_msgSend_inputThumbnailPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputThumbnailPixelBuffer];
}

id objc_msgSend_inputTuningType(void *a1, const char *a2, ...)
{
  return [a1 inputTuningType];
}

id objc_msgSend_inputUnstyledCropRect(void *a1, const char *a2, ...)
{
  return [a1 inputUnstyledCropRect];
}

id objc_msgSend_inputUnstyledPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputUnstyledPixelBuffer];
}

id objc_msgSend_inputUnstyledThumbnailCropRect(void *a1, const char *a2, ...)
{
  return [a1 inputUnstyledThumbnailCropRect];
}

id objc_msgSend_inputUnstyledThumbnailPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputUnstyledThumbnailPixelBuffer];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_intermediateStyleRendererThumbnailSize(void *a1, const char *a2, ...)
{
  return [a1 intermediateStyleRendererThumbnailSize];
}

id objc_msgSend_lastComputedCurveParameter(void *a1, const char *a2, ...)
{
  return [a1 lastComputedCurveParameter];
}

id objc_msgSend_lastComputedRelightingStats(void *a1, const char *a2, ...)
{
  return [a1 lastComputedRelightingStats];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_memSize(void *a1, const char *a2, ...)
{
  return [a1 memSize];
}

id objc_msgSend_metalCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 metalCommandQueue];
}

id objc_msgSend_metalSharedEvent(void *a1, const char *a2, ...)
{
  return [a1 metalSharedEvent];
}

id objc_msgSend_outputCodedLinearThumbnailMetadata(void *a1, const char *a2, ...)
{
  return [a1 outputCodedLinearThumbnailMetadata];
}

id objc_msgSend_outputCodedLinearThumbnailPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 outputCodedLinearThumbnailPixelBuffer];
}

id objc_msgSend_outputDeltaMapCropRect(void *a1, const char *a2, ...)
{
  return [a1 outputDeltaMapCropRect];
}

id objc_msgSend_outputDeltaMapPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 outputDeltaMapPixelBuffer];
}

id objc_msgSend_outputImageStatistics(void *a1, const char *a2, ...)
{
  return [a1 outputImageStatistics];
}

id objc_msgSend_outputImageStatisticsExtended(void *a1, const char *a2, ...)
{
  return [a1 outputImageStatisticsExtended];
}

id objc_msgSend_outputIntegratedCoefficients(void *a1, const char *a2, ...)
{
  return [a1 outputIntegratedCoefficients];
}

id objc_msgSend_outputLearnedStyleCoefficientsPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 outputLearnedStyleCoefficientsPixelBuffer];
}

id objc_msgSend_outputRenderRect(void *a1, const char *a2, ...)
{
  return [a1 outputRenderRect];
}

id objc_msgSend_outputSmallLightMapPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 outputSmallLightMapPixelBuffer];
}

id objc_msgSend_outputSmallLinearLightMapPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 outputSmallLinearLightMapPixelBuffer];
}

id objc_msgSend_outputStyledCropRect(void *a1, const char *a2, ...)
{
  return [a1 outputStyledCropRect];
}

id objc_msgSend_outputStyledPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 outputStyledPixelBuffer];
}

id objc_msgSend_personMaskDilatedMaskVal(void *a1, const char *a2, ...)
{
  return [a1 personMaskDilatedMaskVal];
}

id objc_msgSend_personMasksValidHint(void *a1, const char *a2, ...)
{
  return [a1 personMasksValidHint];
}

id objc_msgSend_prewarm(void *a1, const char *a2, ...)
{
  return [a1 prewarm];
}

id objc_msgSend_primaryCaptureRect(void *a1, const char *a2, ...)
{
  return [a1 primaryCaptureRect];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_processorSpecificOptions(void *a1, const char *a2, ...)
{
  return [a1 processorSpecificOptions];
}

id objc_msgSend_purgeResources(void *a1, const char *a2, ...)
{
  return [a1 purgeResources];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetState(void *a1, const char *a2, ...)
{
  return [a1 resetState];
}

id objc_msgSend_residualsCalculationDisabled(void *a1, const char *a2, ...)
{
  return [a1 residualsCalculationDisabled];
}

id objc_msgSend_semanticStyleSceneType(void *a1, const char *a2, ...)
{
  return [a1 semanticStyleSceneType];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_smartStyleVersion(void *a1, const char *a2, ...)
{
  return [a1 smartStyleVersion];
}

id objc_msgSend_spotlightAffineTransform(void *a1, const char *a2, ...)
{
  return [a1 spotlightAffineTransform];
}

id objc_msgSend_srlCurrentValueWeight(void *a1, const char *a2, ...)
{
  return [a1 srlCurrentValueWeight];
}

id objc_msgSend_styleEngineConfiguration(void *a1, const char *a2, ...)
{
  return [a1 styleEngineConfiguration];
}

id objc_msgSend_styleEngineTuningParameters(void *a1, const char *a2, ...)
{
  return [a1 styleEngineTuningParameters];
}

id objc_msgSend_subjectRelightingEnabled(void *a1, const char *a2, ...)
{
  return [a1 subjectRelightingEnabled];
}

id objc_msgSend_supportsExternalMemoryResource(void *a1, const char *a2, ...)
{
  return [a1 supportsExternalMemoryResource];
}

id objc_msgSend_temporalFilterInputBufferSize(void *a1, const char *a2, ...)
{
  return [a1 temporalFilterInputBufferSize];
}

id objc_msgSend_thumbnailSize(void *a1, const char *a2, ...)
{
  return [a1 thumbnailSize];
}

id objc_msgSend_toneBias(void *a1, const char *a2, ...)
{
  return [a1 toneBias];
}

id objc_msgSend_tuningParameters(void *a1, const char *a2, ...)
{
  return [a1 tuningParameters];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_waitForIdle(void *a1, const char *a2, ...)
{
  return [a1 waitForIdle];
}

id objc_msgSend_waitUntilCompleted(void *a1, const char *a2, ...)
{
  return [a1 waitUntilCompleted];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}