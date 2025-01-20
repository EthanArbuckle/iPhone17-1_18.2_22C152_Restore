@interface VISWrapper
- (BOOL)flipHorizontalOrientationEnabled;
- (BOOL)longPressModeEnabled;
- (BOOL)smartStyleReversibilityProcessingEnabled;
- (VISConfiguration)configuration;
- (VISWrapperDelegate)delegate;
- (int)_updateConfiguration;
- (int)enqueueBufferForProcessing:(opaqueCMSampleBuffer *)a3;
- (int)finishProcessing;
- (int)prepareToProcess;
- (int)purgeResources;
- (void)didCompleteRenderingOfBuffer:(__CVBuffer *)a3 withStatus:(int)a4;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3;
- (void)setLongPressModeEnabled:(BOOL)a3;
- (void)setSmartStyleReversibilityProcessingEnabled:(BOOL)a3;
@end

@implementation VISWrapper

- (int)prepareToProcess
{
  if (self->_buffersEnqueued)
  {
    id v4 = 0;
    int v56 = -12782;
  }
  else if (self->_configuration)
  {
    p_sbpRef = &self->_sbpRef;
    if (self->_sbpRef)
    {
      sbp_gvs_invalidate();
      if (*p_sbpRef)
      {
        CFRelease(*p_sbpRef);
        *p_sbpRef = 0;
      }
    }
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    if (!v4) {
      goto LABEL_28;
    }
    v5 = +[NSNumber numberWithUnsignedInt:[(VISConfiguration *)self->_configuration extendedOutputRowsToFill]];
    [v4 setObject:v5 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_NumberOfExtendedRowsOfOutputBufferToFill];

    v6 = [(VISConfiguration *)self->_configuration inputPixelBufferAttributes];
    [v4 setObject:v6 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_InputPixelBufferAttributes];

    v7 = [(VISConfiguration *)self->_configuration outputPixelBufferAttributes];
    [v4 setObject:v7 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_OutputPixelBufferAttributes];

    v8 = +[NSNumber numberWithInt:dword_472F0[(int)[(VISConfiguration *)self->_configuration transformPlatform]]];
    [v4 setObject:v8 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_TransformPlatform];

    v9 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration blurBorderPixels]];
    [v4 setObject:v9 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_BlurBorderPixels];

    v10 = +[NSNumber numberWithInt:dword_47368[(int)[(VISConfiguration *)self->_configuration smoothingMethod]]];
    [v4 setObject:v10 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_SmoothingMethod];

    v11 = +[NSNumber numberWithInt:dword_47380[(int)[(VISConfiguration *)self->_configuration motionBlurShimmerMitigationMethod]]];
    [v4 setObject:v11 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_MotionBlurShimmerMitigationMethod];

    id v12 = [(VISConfiguration *)self->_configuration ispProcessingSession];
    [v4 setObject:v12 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_IspProcessingSession];
    v13 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration sphereCorrectionEnabled]];
    [v4 setObject:v13 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_EnableSphereCorrection];

    v14 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration useISPMotionData]];
    [v4 setObject:v14 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_UseISPMotionData];

    v15 = +[NSNumber numberWithUnsignedInt:[(VISConfiguration *)self->_configuration cinematicLookAheadFrameCount]];
    [v4 setObject:v15 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_CinematicLookAheadFrameCount];

    [(VISConfiguration *)self->_configuration cinematicLookAheadTime];
    v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v4 setObject:v16 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_CinematicLookAheadTime];

    v17 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration attachStabilizedOutputCameraTrajectory]];
    [v4 setObject:v17 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_AttachStabilizedOutputCameraTrajectory];

    v18 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration attachStabilizedTrajectoryHomography]];
    [v4 setObject:v18 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_AttachStabilizedTrajectoryHomography];

    v19 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration attachEstimatedMotionVector]];
    [v4 setObject:v19 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_AttachEstimatedMotionVector];

    v20 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration onlyGenerateTransformsParameters]];
    [v4 setObject:v20 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_OnlyGenerateTransformsParameters];

    [(VISConfiguration *)self->_configuration minDistanceForBravoParallaxShift];
    v21 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v4 setObject:v21 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_MinDistanceForBravoParallaxShift];

    v22 = [(VISConfiguration *)self->_configuration distortionCorrectionEnabledPortTypes];
    id v23 = [v22 count];

    if (v23)
    {
      v24 = [(VISConfiguration *)self->_configuration distortionCorrectionEnabledPortTypes];
      [v4 setObject:v24 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_DistortionCorrectionEnabledPortTypes];
    }
    v25 = [(VISConfiguration *)self->_configuration distortionCompensationEnabledPortTypes];
    id v26 = [v25 count];

    if (v26)
    {
      v27 = [(VISConfiguration *)self->_configuration distortionCompensationEnabledPortTypes];
      [v4 setObject:v27 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_DistortionCompensationEnabledPortTypes];
    }
    v28 = [(VISConfiguration *)self->_configuration videoSTFParameters];
    [v4 setObject:v28 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_VideoSTFParameters];

    v29 = [(VISConfiguration *)self->_configuration videoGreenGhostMitigationParameters];
    [v4 setObject:v29 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_VideoGreenGhostMitigationParameters];

    v30 = +[NSNumber numberWithInt:[(VISConfiguration *)self->_configuration gpuPriority]];
    [v4 setObject:v30 forKeyedSubscript:kFigCaptureSampleBufferProcessorOption_GpuPriority];

    v31 = [(VISConfiguration *)self->_configuration metalCommandQueue];
    [v4 setObject:v31 forKeyedSubscript:kFigCaptureSampleBufferProcessorOption_MetalCommandQueue];

    v32 = +[NSNumber numberWithUnsignedInt:[(VISConfiguration *)self->_configuration metalSubmissionAndCompletionQueuePriority]];
    [v4 setObject:v32 forKeyedSubscript:kFigCaptureSampleBufferProcessorOption_MetalSubmissionAndCompletionQueuePriority];

    v33 = [(VISConfiguration *)self->_configuration emitSampleBufferSemaphore];
    [v4 setObject:v33 forKeyedSubscript:kFigCaptureSampleBufferProcessorProperty_PixelBufferPoolAllocationSemaphore];

    v34 = [(VISConfiguration *)self->_configuration sensorIDDict];
    [v4 setObject:v34 forKeyedSubscript:kFigCaptureSampleBufferProcessorOption_SensorIDDictionary];

    v35 = [(VISConfiguration *)self->_configuration cameraInfoByPortType];
    [v4 setObject:v35 forKeyedSubscript:kFigCaptureSampleBufferProcessorOption_CameraInfoByPortType];

    [(VISConfiguration *)self->_configuration horizonCorrectionThreshold];
    v36 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v4 setObject:v36 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_HorizonCorrectionThreshold];

    v37 = +[NSNumber numberWithInt:[(VISConfiguration *)self->_configuration horizonCorrectionMode]];
    [v4 setObject:v37 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_HorizonCorrectionMode];

    v38 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration zoomSmoothingEnabled]];
    [v4 setObject:v38 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_ZoomSmoothingEnabled];

    v39 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration applyFrameCropOffset]];
    [v4 setObject:v39 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_ApplyFrameCropOffset];

    v40 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration enableRollingShutterCorrectionOnly]];
    [v4 setObject:v40 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_EnableRollingShutterCorrectionOnly];

    v41 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration disableTransformLimitsForPredeterminedTrajectory]];
    [v4 setObject:v41 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_DisableTransformLimitsForPredeterminedTrajectory];

    v42 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration useCameraGeometry]];
    [v4 setObject:v42 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_UseCameraGeometry];

    v43 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration smartStyleRenderingEnabled]];
    [v4 setObject:v43 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_SmartStyleRenderingEnabled];

    v44 = +[NSNumber numberWithBool:[(VISConfiguration *)self->_configuration smartStyleReversibilityEnabled]];
    [v4 setObject:v44 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_SmartStyleReversibilityEnabled];

    v45 = +[NSNumber numberWithUnsignedLongLong:[(VISConfiguration *)self->_configuration smartStyleMemoryPoolId]];
    [v4 setObject:v45 forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_SmartStyleMemoryPoolId];

    [(VISConfiguration *)self->_configuration livePhotoCleanOutputRect];
    if (!CGRectIsEmpty(v62))
    {
      [(VISConfiguration *)self->_configuration livePhotoCleanOutputRect];
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v63);
      [v4 setObject:CFAutorelease(DictionaryRepresentation) forKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorOption_LivePhotoCleanOutputRect];
    }
    int v47 = FigSampleBufferProcessorCreateForGyroVideoStabilization((const __CFDictionary *)v4, &self->_sbpRef);
    if (v47) {
      goto LABEL_21;
    }
    v48 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pixelBuffersRendered = self->_pixelBuffersRendered;
    self->_pixelBuffersRendered = v48;

    if (!self->_pixelBuffersRendered) {
      goto LABEL_28;
    }
    v50 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pixelBuffersProcessed = self->_pixelBuffersProcessed;
    self->_pixelBuffersProcessed = v50;

    if (!self->_pixelBuffersProcessed) {
      goto LABEL_28;
    }
    v52 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sampleBuffersProcessed = self->_sampleBuffersProcessed;
    self->_sampleBuffersProcessed = v52;

    if (self->_sampleBuffersProcessed
      && (self->_pixelBuffersLock
       || (v54 = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate(), (self->_pixelBuffersLock = v54) != 0)))
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (*(unsigned char *)(DerivedStorage + 24))
      {
        int v47 = FigSignalErrorAt();
        if (v47)
        {
LABEL_21:
          int v56 = v47;
          fig_log_get_emitter();
LABEL_34:
          FigDebugAssert3();
          goto LABEL_27;
        }
      }
      else
      {
        *(void *)uint64_t DerivedStorage = _sampleBufferImagePreStabilizationCallback;
      }
      int v47 = sbp_gvs_setPostOutputCallback((uint64_t)self->_sbpRef, (uint64_t)_sampleBufferImageReadyCallback, (uint64_t)self);
      if (v47) {
        goto LABEL_21;
      }
      v57 = [(VISConfiguration *)self->_configuration cameraExtrinsicMatrix];

      if (v57)
      {
        sbpRef = self->_sbpRef;
        v59 = (const void *)kFigVideoStabilizationSampleBufferProcessorProperty_IMUToCameraExtrinsic;
        v60 = [(VISConfiguration *)self->_configuration cameraExtrinsicMatrix];
        int v56 = sbp_gvs_setProperty((uint64_t)sbpRef, v59, v60);

        if (v56)
        {
          fig_log_get_emitter();
          goto LABEL_34;
        }
      }
      int v56 = 0;
      *(_WORD *)&self->_buffersEnqueued = 0;
    }
    else
    {
LABEL_28:
      int v56 = -12786;
    }
  }
  else
  {
    id v4 = 0;
    int v56 = -12780;
  }
LABEL_27:

  return v56;
}

- (int)enqueueBufferForProcessing:(opaqueCMSampleBuffer *)a3
{
  if (self->_sbpRef && self->_configuration && a3)
  {
    unsigned int v5 = [(VISWrapper *)self _updateConfiguration];
    if (v5)
    {
      int v6 = v5;
      fig_log_get_emitter();
    }
    else
    {
      int v6 = sbp_gvs_processSampleBuffer((uint64_t)self->_sbpRef, a3);
      if (!v6)
      {
        self->_buffersEnqueued = 1;
        return v6;
      }
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    FigSignalErrorAt();
    return v6;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)finishProcessing
{
  sbpRef = self->_sbpRef;
  if (!sbpRef) {
    return 0;
  }
  self->_finishProcessing = 1;
  int v4 = sbp_gvs_finishPendingProcessing((uint64_t)sbpRef);
  if (v4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  else
  {
    *(_WORD *)&self->_buffersEnqueued = 0;
    [(NSMutableArray *)self->_pixelBuffersRendered removeAllObjects];
    [(NSMutableArray *)self->_pixelBuffersProcessed removeAllObjects];
    [(NSMutableArray *)self->_sampleBuffersProcessed removeAllObjects];
  }
  return v4;
}

- (int)purgeResources
{
  if (self->_sbpRef)
  {
    self->_buffersEnqueued = 0;
    sbp_gvs_invalidate();
    sbpRef = self->_sbpRef;
    if (sbpRef)
    {
      CFRelease(sbpRef);
      self->_sbpRef = 0;
    }
    if (self->_pixelBuffersLock)
    {
      FigSimpleMutexDestroy();
      self->_pixelBuffersLock = 0;
    }
  }
  return 0;
}

- (int)_updateConfiguration
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage) {
    return -12782;
  }
  uint64_t v4 = DerivedStorage;
  configuration = self->_configuration;
  if (!configuration) {
    return -12780;
  }
  if (*(unsigned char *)(v4 + 32))
  {
    *(unsigned char *)(v4 + 84) = [(VISConfiguration *)configuration videoStabilizationDisabled];
    if (![(VISConfiguration *)self->_configuration sphereVideoEnabled]
      || *(unsigned char *)(v4 + 28137))
    {
      *(unsigned char *)(v4 + 28136) = [(VISConfiguration *)self->_configuration sphereVideoEnabled];
      if (!*(unsigned char *)(v4 + 328)) {
        goto LABEL_10;
      }
      if (*(double *)(v4 + 29488) <= 0.0 || *(double *)(v4 + 29496) <= 0.0) {
        return -12782;
      }
      int v6 = sbp_enableLongPressMode(v4, self->_longPressModeEnabled);
      if (!v6)
      {
LABEL_10:
        [*(id *)(v4 + 48) removeAllObjects];
        id v7 = objc_alloc_init((Class)NSMutableDictionary);
        v8 = *(void **)(v4 + 48);
        *(void *)(v4 + 48) = v7;

        if (!*(void *)(v4 + 48)) {
          return -12786;
        }
        [*(id *)(v4 + 56) removeAllObjects];
        id v9 = objc_alloc_init((Class)NSMutableDictionary);
        v10 = *(void **)(v4 + 56);
        *(void *)(v4 + 56) = v9;

        if (!*(void *)(v4 + 56)) {
          return -12786;
        }
        v11 = [(VISConfiguration *)self->_configuration outputAttachmentsPixelBufferPools];

        if (v11)
        {
          id v12 = *(void **)(v4 + 48);
          v13 = [(VISConfiguration *)self->_configuration outputAttachmentsPixelBufferPools];
          [v12 addEntriesFromDictionary:v13];
        }
        v14 = [(VISConfiguration *)self->_configuration outputAttachmentsAuxAttributes];

        if (v14)
        {
          v15 = *(void **)(v4 + 56);
          v16 = [(VISConfiguration *)self->_configuration outputAttachmentsAuxAttributes];
          [v15 addEntriesFromDictionary:v16];
        }
        if (*(unsigned char *)(v4 + 29704))
        {
LABEL_27:
          if ([(VISConfiguration *)self->_configuration frameRateConversionEnabled]&& *(_DWORD *)(v4 + 27148) == 1)
          {
            *(unsigned char *)(v4 + 29762) = [(VISConfiguration *)self->_configuration frameRateConversionEnabled];
            *(_DWORD *)(v4 + 29772) = 0;
            *(void *)(v4 + 29764) = 0xFFFFFFFFLL;
            *(_WORD *)(v4 + 29780) = 1;
          }
          if (!self->_flipHorizontalOrientationEnabled || !*(_DWORD *)(v4 + 172))
          {
            *(unsigned char *)(v4 + 203) = self->_flipHorizontalOrientationEnabled;
            if (*(unsigned char *)(v4 + 30065)) {
              *(unsigned char *)(v4 + 30066) = self->_smartStyleReversibilityProcessingEnabled;
            }
            [(VISConfiguration *)self->_configuration outputPixelBufferPool];
            [(VISConfiguration *)self->_configuration outputDepthPixelBufferPool];
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            v21 = [(VISConfiguration *)self->_configuration outputAttachmentsPixelBufferPools];
            v22 = (char *)[v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v28;
              while (1)
              {
                if (*(void *)v28 != v24) {
                  objc_enumerationMutation(v21);
                }
                if (!--v23)
                {
                  id v23 = (char *)[v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
                  if (!v23) {
                    break;
                  }
                }
              }
            }

            return 0;
          }
          return -12782;
        }
        if (*(_DWORD *)(v4 + 172)
          || (int v6 = sbp_enableP3ToBT2020Conversion(v4, (const char *)[(VISConfiguration *)self->_configuration p3ToBT2020ConversionEnabled])) == 0)
        {
          if ([(VISConfiguration *)self->_configuration outputPixelBufferPool]) {
            objc_msgSend(*(id *)(v4 + 48), "setObject:forKeyedSubscript:", -[VISConfiguration outputPixelBufferPool](self->_configuration, "outputPixelBufferPool"), @"OutputBufferPrimary");
          }
          if ([(VISConfiguration *)self->_configuration outputDepthPixelBufferPool]) {
            objc_msgSend(*(id *)(v4 + 48), "setObject:forKeyedSubscript:", -[VISConfiguration outputDepthPixelBufferPool](self->_configuration, "outputDepthPixelBufferPool"), @"OutputBufferDepth");
          }
          v17 = [(VISConfiguration *)self->_configuration outputAuxAttributes];

          if (v17)
          {
            v18 = [(VISConfiguration *)self->_configuration outputAuxAttributes];
            [*(id *)(v4 + 56) setObject:v18 forKeyedSubscript:@"OutputBufferPrimary"];
          }
          v19 = [(VISConfiguration *)self->_configuration outputDepthAuxAttributes];

          if (v19)
          {
            v20 = [(VISConfiguration *)self->_configuration outputDepthAuxAttributes];
            [*(id *)(v4 + 56) setObject:v20 forKeyedSubscript:@"OutputBufferDepth"];
          }
          goto LABEL_27;
        }
      }
      int v25 = v6;
      fig_log_get_emitter();
      FigDebugAssert3();
      return v25;
    }
    return -12780;
  }
  return 0;
}

- (void)didCompleteRenderingOfBuffer:(__CVBuffer *)a3 withStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  FigSimpleMutexLock();
  id v7 = [(NSMutableArray *)self->_pixelBuffersProcessed indexOfObject:a3];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_pixelBuffersRendered addObject:a3];
    FigSimpleMutexUnlock();
  }
  else
  {
    id v8 = v7;
    id v9 = [(NSMutableArray *)self->_sampleBuffersProcessed objectAtIndexedSubscript:v7];

    if (v9)
    {
      CFRetain(v9);
      [(NSMutableArray *)self->_sampleBuffersProcessed removeObjectAtIndex:v8];
      [(NSMutableArray *)self->_pixelBuffersProcessed removeObjectAtIndex:v8];
      FigSimpleMutexUnlock();
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained didCompleteProcessingOfBuffer:v9 withStatus:v4];

      CFRelease(v9);
    }
    else
    {
      [(NSMutableArray *)self->_sampleBuffersProcessed removeObjectAtIndex:v8];
      [(NSMutableArray *)self->_pixelBuffersProcessed removeObjectAtIndex:v8];
      FigSimpleMutexUnlock();
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 didCompleteProcessingOfBuffer:0 withStatus:v4];
    }
  }
}

- (BOOL)longPressModeEnabled
{
  return self->_longPressModeEnabled;
}

- (void)setLongPressModeEnabled:(BOOL)a3
{
  self->_longPressModeEnabled = a3;
}

- (BOOL)flipHorizontalOrientationEnabled
{
  return self->_flipHorizontalOrientationEnabled;
}

- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3
{
  self->_flipHorizontalOrientationEnabled = a3;
}

- (BOOL)smartStyleReversibilityProcessingEnabled
{
  return self->_smartStyleReversibilityProcessingEnabled;
}

- (void)setSmartStyleReversibilityProcessingEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityProcessingEnabled = a3;
}

- (VISConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (VISWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VISWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sampleBuffersProcessed, 0);
  objc_storeStrong((id *)&self->_pixelBuffersProcessed, 0);

  objc_storeStrong((id *)&self->_pixelBuffersRendered, 0);
}

@end