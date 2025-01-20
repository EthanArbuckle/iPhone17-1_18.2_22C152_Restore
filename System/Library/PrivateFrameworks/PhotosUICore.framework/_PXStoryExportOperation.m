@interface _PXStoryExportOperation
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exportDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoQueue_firstWrittenStoryTime;
- (AVAssetReader)audioQueue_assetReader;
- (AVAssetReaderAudioMixOutput)audioQueue_audioMixOutput;
- (AVAssetWriter)assetWriter;
- (AVAssetWriterInput)audioQueue_audioWriter;
- (AVAssetWriterInputPixelBufferAdaptor)videoWriterQueue_pixelBufferWriter;
- (BOOL)_waitForStoryStateWhileExportingCanContinueByWatchingChanges:(unint64_t)a3 timeout:(id *)a4 verificationBlock:(id)a5;
- (BOOL)_waitWhileExportingCanContinueForSemaphore:(id)a3 timeout:(id *)a4;
- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5;
- (BOOL)hasAudioForExport;
- (BOOL)isCancelled;
- (BOOL)isHUDVisible;
- (BOOL)shouldContinueExporting;
- (BOOL)storyQueue_isWaitingForResources;
- (NSError)error;
- (NSProgress)progress;
- (NSString)uniqueIdentifier;
- (NSURL)destinationURL;
- (OS_dispatch_queue)audioQueue;
- (OS_dispatch_queue)storyQueue;
- (OS_dispatch_queue)videoWriterQueue;
- (OS_dispatch_semaphore)completedWritingVideoFrameSemaphore;
- (OS_dispatch_semaphore)layoutCompleteSemaphore;
- (PXAudioCueSource)audioCueSource;
- (PXGEngine)storyQueue_engine;
- (PXGPixelBufferMetalRenderDestination)storyQueue_pixelBufferRenderDestination;
- (PXMediaProvider)storyQueue_mediaProvider;
- (PXObservable)HUDObservable;
- (PXStoryExportConfiguration)configuration;
- (PXStoryExportVideoOptions)videoOptions;
- (PXStoryModel)storyQueue_storyModel;
- (PXStoryPacingController)storyQueue_pacingController;
- (PXStoryRelatedController)HUDRelatedController;
- (PXStorySongController)storyQueue_songController;
- (PXStoryStyle)exportedStyle;
- (_PXStoryExportOperation)initWithURL:(id)a3 configuration:(id)a4 qualityOfService:(int64_t)a5 progressHandler:(id)a6;
- (id)_audibleVideoHilightsInStory;
- (id)_storyQueue_createStoryModel;
- (id)_videoOutputSettings;
- (id)collectAnalyticsForExportBegin;
- (id)diagnosticCueStringForSize:(CGSize)a3 withIndicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5;
- (id)diagnosticHUDContentProviderForType:(int64_t)a3;
- (id)pixelBufferAttributes;
- (id)progressHandler;
- (int64_t)cuesVersion;
- (int64_t)diagnosticHUDType;
- (int64_t)status;
- (unint64_t)HUDContentChangeDescriptor;
- (unint64_t)HUDStoryModelChangeDescriptor;
- (unint64_t)HUDVisibiltyChangeDescriptor;
- (void)_addAudioAssetsForVideoHilightsToAudioCompositionBuilder:(id)a3;
- (void)_addAudioInputToAssetWriter:(id)a3;
- (void)_addMetadataToAssetWriter:(id)a3;
- (void)_addSongAssetToAudioCompositionBuilder:(id)a3;
- (void)_addVideoInputToAssetWriter:(id)a3;
- (void)_advanceLayoutToStoryTime:(id *)a3;
- (void)_audioWriteQueue_cancelAudioExport;
- (void)_audioWriteQueue_exportAudioWithCompletionHandler:(id)a3;
- (void)_audioWriteQueue_setupAudioReaderWithAudioExportComposition:(id)a3 audioMix:(id)a4;
- (void)_checkForDriftFromCurrentTime:(id *)a3;
- (void)_exportAudioWithCompletionHandler:(id)a3;
- (void)_exportVideo;
- (void)_finishWriting;
- (void)_handleMediaRequestCompletedForSongAsset:(id)a3 avAsset:(id)a4 audioMix:(id)a5 info:(id)a6 audioCompositionBuilder:(id)a7;
- (void)_initializeProgress;
- (void)_preloadStoryResourcesAndWaitForBuffering;
- (void)_setError:(id)a3;
- (void)_setExportDuration:(id *)a3;
- (void)_setExportedStyle:(id)a3;
- (void)_setHasAudioForExport:(BOOL)a3;
- (void)_setOutroDuration:(id *)a3;
- (void)_setStatus:(int64_t)a3;
- (void)_setupAudioExporting;
- (void)_setupStoryLayout;
- (void)_setupStoryModel;
- (void)_setupWriter;
- (void)_signalSemaphoresForFailedExport;
- (void)_storyQueue_advanceLayoutToStoryTime:(id *)a3;
- (void)_storyQueue_checkForDriftFromCurrentTime:(id *)a3;
- (void)_storyQueue_processRenderedLayoutPixelBuffer:(__CVBuffer *)a3;
- (void)_videoWriterQueue_writeVideoWithPixelBuffer:(__CVBuffer *)a3 forStoryTime:(id *)a4;
- (void)_writeVideoWithPixelBuffer:(__CVBuffer *)a3 forStoryTime:(id *)a4;
- (void)cancel;
- (void)collectAnalyticsForExportEnd:(id)a3;
- (void)dealloc;
- (void)engineSetNeedsUpdate:(id)a3;
- (void)main;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAssetWriter:(id)a3;
- (void)setAudioQueue_assetReader:(id)a3;
- (void)setAudioQueue_audioMixOutput:(id)a3;
- (void)setAudioQueue_audioWriter:(id)a3;
- (void)setStoryQueue_engine:(id)a3;
- (void)setStoryQueue_mediaProvider:(id)a3;
- (void)setStoryQueue_pacingController:(id)a3;
- (void)setStoryQueue_pixelBufferRenderDestination:(id)a3;
- (void)setStoryQueue_songController:(id)a3;
- (void)setStoryQueue_storyModel:(id)a3;
- (void)setVideoQueue_firstWrittenStoryTime:(id *)a3;
- (void)setVideoWriterQueue_pixelBufferWriter:(id)a3;
@end

@implementation _PXStoryExportOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoWriterQueue_pixelBufferWriter, 0);
  objc_storeStrong((id *)&self->_videoWriterQueue, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_audioQueue_audioMixOutput, 0);
  objc_storeStrong((id *)&self->_audioQueue_audioWriter, 0);
  objc_storeStrong((id *)&self->_audioQueue_assetReader, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
  objc_storeStrong((id *)&self->_storyQueue_pixelBufferRenderDestination, 0);
  objc_storeStrong((id *)&self->_storyQueue_songController, 0);
  objc_storeStrong((id *)&self->_storyQueue_pacingController, 0);
  objc_storeStrong((id *)&self->_storyQueue_mediaProvider, 0);
  objc_storeStrong((id *)&self->_storyQueue_storyModel, 0);
  objc_storeStrong((id *)&self->_storyQueue_engine, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_completedWritingVideoFrameSemaphore, 0);
  objc_storeStrong((id *)&self->_layoutCompleteSemaphore, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_videoOptions, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_frequentSignpostLog, 0);
  objc_storeStrong((id *)&self->_signpostLog, 0);
  objc_storeStrong((id *)&self->_stateQueue_exportedStyle, 0);
  objc_storeStrong((id *)&self->_stateQueue_error, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

- (void)setVideoQueue_firstWrittenStoryTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_videoQueue_firstWrittenStoryTime.value = *(_OWORD *)&a3->var0;
  self->_videoQueue_firstWrittenStoryTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoQueue_firstWrittenStoryTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[23];
  return self;
}

- (void)setVideoWriterQueue_pixelBufferWriter:(id)a3
{
}

- (AVAssetWriterInputPixelBufferAdaptor)videoWriterQueue_pixelBufferWriter
{
  return self->_videoWriterQueue_pixelBufferWriter;
}

- (OS_dispatch_queue)videoWriterQueue
{
  return self->_videoWriterQueue;
}

- (void)setAssetWriter:(id)a3
{
}

- (AVAssetWriter)assetWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 528, 1);
}

- (void)setAudioQueue_audioMixOutput:(id)a3
{
}

- (AVAssetReaderAudioMixOutput)audioQueue_audioMixOutput
{
  return self->_audioQueue_audioMixOutput;
}

- (void)setAudioQueue_audioWriter:(id)a3
{
}

- (AVAssetWriterInput)audioQueue_audioWriter
{
  return self->_audioQueue_audioWriter;
}

- (void)setAudioQueue_assetReader:(id)a3
{
}

- (AVAssetReader)audioQueue_assetReader
{
  return self->_audioQueue_assetReader;
}

- (OS_dispatch_queue)audioQueue
{
  return self->_audioQueue;
}

- (void)setStoryQueue_pixelBufferRenderDestination:(id)a3
{
}

- (PXGPixelBufferMetalRenderDestination)storyQueue_pixelBufferRenderDestination
{
  return self->_storyQueue_pixelBufferRenderDestination;
}

- (void)setStoryQueue_songController:(id)a3
{
}

- (PXStorySongController)storyQueue_songController
{
  return self->_storyQueue_songController;
}

- (void)setStoryQueue_pacingController:(id)a3
{
}

- (PXStoryPacingController)storyQueue_pacingController
{
  return self->_storyQueue_pacingController;
}

- (void)setStoryQueue_mediaProvider:(id)a3
{
}

- (void)setStoryQueue_storyModel:(id)a3
{
}

- (PXStoryModel)storyQueue_storyModel
{
  return self->_storyQueue_storyModel;
}

- (void)setStoryQueue_engine:(id)a3
{
}

- (PXGEngine)storyQueue_engine
{
  return self->_storyQueue_engine;
}

- (BOOL)storyQueue_isWaitingForResources
{
  return self->_storyQueue_isWaitingForResources;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (OS_dispatch_semaphore)completedWritingVideoFrameSemaphore
{
  return self->_completedWritingVideoFrameSemaphore;
}

- (OS_dispatch_semaphore)layoutCompleteSemaphore
{
  return self->_layoutCompleteSemaphore;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (PXStoryExportVideoOptions)videoOptions
{
  return self->_videoOptions;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (PXStoryExportConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)_waitWhileExportingCanContinueForSemaphore:(id)a3 timeout:(id *)a4
{
  v6 = a3;
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&v13, 0.5, 600);
  CMTime v12 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  while (1)
  {
    dispatch_time_t v7 = dispatch_time(0, 500000000);
    intptr_t v8 = dispatch_semaphore_wait(v6, v7);
    if (!v8) {
      break;
    }
    if (![(_PXStoryExportOperation *)self shouldContinueExporting]) {
      break;
    }
    if ((a4->var2 & 0x1D) == 1)
    {
      CMTime lhs = v12;
      CMTime v10 = v13;
      CMTimeAdd(&v12, &lhs, &v10);
      CMTime lhs = v12;
      CMTime v10 = (CMTime)*a4;
      if ((CMTimeCompare(&lhs, &v10) & 0x80000000) == 0) {
        break;
      }
    }
  }

  return v8 == 0;
}

- (unint64_t)HUDStoryModelChangeDescriptor
{
  return 0;
}

- (unint64_t)HUDContentChangeDescriptor
{
  return 0;
}

- (unint64_t)HUDVisibiltyChangeDescriptor
{
  return 0;
}

- (PXObservable)HUDObservable
{
  return 0;
}

- (id)diagnosticHUDContentProviderForType:(int64_t)a3
{
  v4 = [(_PXStoryExportOperation *)self storyQueue_storyModel];
  v5 = [v4 diagnosticHUDContentProviderForType:a3];

  return v5;
}

- (PXStoryRelatedController)HUDRelatedController
{
  return 0;
}

- (int64_t)diagnosticHUDType
{
  v2 = +[PXStorySettings sharedInstance];
  int64_t v3 = [v2 exportHUDType];

  return v3;
}

- (BOOL)isHUDVisible
{
  v2 = +[PXStorySettings sharedInstance];
  BOOL v3 = [v2 exportHUDType] != 0;

  return v3;
}

- (void)collectAnalyticsForExportEnd:(id)a3
{
  id v4 = a3;
  v5 = [(_PXStoryExportOperation *)self storyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___PXStoryExportOperation_collectAnalyticsForExportEnd___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)collectAnalyticsForExportBegin
{
  v2 = [(_PXStoryExportOperation *)self configuration];
  BOOL v3 = +[PXStoryExportManager collectAnalyticsForExportBeginWithConfiguration:v2];

  return v3;
}

- (id)diagnosticCueStringForSize:(CGSize)a3 withIndicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5
{
  id v8 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(_PXStoryExportOperation *)self audioCueSource];
  [(_PXStoryExportOperation *)self currentTime];
  CMTimeMakeWithSeconds(&duration, 3.0, PXAudioDefaultCMTimeScale);
  CMTimeRangeMake(&v19, &start, &duration);
  long long v10 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  long long v11 = *(_OWORD *)&a5->var0.var3;
  v14[0] = *(_OWORD *)&a5->var0.var0;
  v14[1] = v11;
  v14[2] = *(_OWORD *)&a5->var1.var1;
  long long v15 = v10;
  CMTime v12 = [v9 diagnosticStringForTimeRange:&v19 indicatorTime:&v15 rangeIndicatorTimeRange:v14 stringLength:50];

  return v12;
}

- (int64_t)cuesVersion
{
  v2 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v2);

  return 0;
}

- (PXAudioCueSource)audioCueSource
{
  BOOL v3 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(_PXStoryExportOperation *)self storyQueue_storyModel];
  v5 = [v4 currentStyle];
  id v6 = [v5 cueSource];

  return (PXAudioCueSource *)v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  v5 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  id v9 = [(_PXStoryExportOperation *)self storyQueue_pacingController];
  id v6 = [v9 timeSource];
  dispatch_time_t v7 = v6;
  if (v6)
  {
    [v6 currentTime];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->int64_t var3 = 0;
  }

  return result;
}

- (void)engineSetNeedsUpdate:(id)a3
{
  id v5 = a3;
  id v4 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v4);

  if (self->_storyQueue_isWaitingForResources) {
    [v5 updateIfNeeded];
  }
}

- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  CMTime v12 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  CMTime v13 = [(_PXStoryExportOperation *)self storyQueue_engine];
  v14 = [v13 entityManager];
  long long v15 = [v14 loadingStatus];

  id v16 = v15;
  uint64_t v17 = [v16 states];
  [v10 visibleRect];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __61___PXStoryExportOperation_engine_shouldRenderLayout_sprites___block_invoke;
  v35[3] = &unk_1E5DC7788;
  uint64_t v39 = v17;
  SEL v40 = a2;
  v35[4] = self;
  v38 = &v41;
  id v26 = v16;
  id v36 = v26;
  id v27 = v10;
  id v37 = v27;
  objc_msgSend(v11, "enumerateSpritesInRect:usingBlock:", v35, v19, v21, v23, v25);
  v28 = v42;
  self->_storyQueue_isWaitingForResources = *((unsigned char *)v42 + 24);
  int v29 = *((unsigned __int8 *)v28 + 24);
  if (!*((unsigned char *)v28 + 24))
  {
    v30 = self->_frequentSignpostLog;
    v31 = v30;
    os_signpost_id_t frequentSignpostID = self->_frequentSignpostID;
    if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v30))
    {
      *(_WORD *)v34 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v31, OS_SIGNPOST_INTERVAL_END, frequentSignpostID, "StoryExportLayoutRenderLoadingSpriteContent", "", v34, 2u);
    }
  }
  _Block_object_dispose(&v41, 8);

  return v29 == 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  dispatch_time_t v7 = [(_PXStoryExportOperation *)self progressHandler];

  if (v7)
  {
    id v9 = [(_PXStoryExportOperation *)self progressHandler];
    id v8 = [(_PXStoryExportOperation *)self progress];
    v9[2](v9, v8);
  }
}

- (void)_initializeProgress
{
  BOOL v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  progress = self->_progress;
  self->_progress = v3;

  objc_initWeak(&location, self);
  [(NSProgress *)self->_progress setCancellable:1];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  dispatch_time_t v7 = __46___PXStoryExportOperation__initializeProgress__block_invoke;
  id v8 = &unk_1E5DD32D0;
  objc_copyWeak(&v9, &location);
  [(NSProgress *)self->_progress setCancellationHandler:&v5];
  [(NSProgress *)self->_progress addObserver:self, @"fractionCompleted", 0, 0, v5, v6, v7, v8 forKeyPath options context];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_audioWriteQueue_cancelAudioExport
{
  BOOL v3 = [(_PXStoryExportOperation *)self audioQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(_PXStoryExportOperation *)self audioQueue_audioWriter];
  [v4 markAsFinished];

  id v5 = [(_PXStoryExportOperation *)self audioQueue_assetReader];
  [v5 cancelReading];
}

- (void)_audioWriteQueue_exportAudioWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(_PXStoryExportOperation *)self audioQueue];
  dispatch_assert_queue_V2(v5);

  if ([(_PXStoryExportOperation *)self shouldContinueExporting])
  {
    uint64_t v6 = [(_PXStoryExportOperation *)self audioQueue_audioWriter];
    dispatch_time_t v7 = [(_PXStoryExportOperation *)self audioQueue_audioMixOutput];
    memset(&v38, 0, sizeof(v38));
    [(_PXStoryExportOperation *)self exportDuration];
    if ([v6 isReadyForMoreMediaData])
    {
      while (1)
      {
        id v8 = (void *)MEMORY[0x1AD10CB00]();
        id v9 = (opaqueCMSampleBuffer *)[v7 copyNextSampleBuffer];
        if (!v9) {
          break;
        }
        id v10 = v9;
        memset(&v37, 0, sizeof(v37));
        CMSampleBufferGetPresentationTimeStamp(&v37, v9);
        CMTime time1 = v37;
        CMTime time2 = v38;
        int32_t v11 = CMTimeCompare(&time1, &time2);
        if (v11 < 0 && ([v6 appendSampleBuffer:v10] & 1) == 0)
        {
          CMTime v12 = [(_PXStoryExportOperation *)self assetWriter];
          CMTime v13 = [v12 error];
          double v19 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v13, @"failed to write audio sample", v14, v15, v16, v17, v18, v34);
          [(_PXStoryExportOperation *)self _setError:v19];
        }
        CFRelease(v10);
        BOOL v20 = [(_PXStoryExportOperation *)self shouldContinueExporting];
        if ((v11 & 0x80000000) == 0 || !v20) {
          goto LABEL_15;
        }
        if (([v6 isReadyForMoreMediaData] & 1) == 0) {
          goto LABEL_19;
        }
      }
      double v21 = [(_PXStoryExportOperation *)self audioQueue_assetReader];
      uint64_t v22 = [v21 status];

      if (v22 == 3)
      {
        double v23 = [(_PXStoryExportOperation *)self audioQueue_assetReader];
        double v24 = [v23 error];
        v30 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v24, @"failed to read audio sample", v25, v26, v27, v28, v29, v34);
        [(_PXStoryExportOperation *)self _setError:v30];
      }
      [(_PXStoryExportOperation *)self shouldContinueExporting];
LABEL_15:
      [(_PXStoryExportOperation *)self _audioWriteQueue_cancelAudioExport];
      [v6 markAsFinished];
      v4[2](v4);
      v31 = self->_signpostLog;
      v32 = v31;
      os_signpost_id_t signpostID = self->_signpostID;
      if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v31))
      {
        LOWORD(v37.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v32, OS_SIGNPOST_INTERVAL_END, signpostID, "StoryExportAudio", "", (uint8_t *)&v37, 2u);
      }
    }
LABEL_19:
  }
  else
  {
    [(_PXStoryExportOperation *)self _audioWriteQueue_cancelAudioExport];
    v4[2](v4);
  }
}

- (void)_exportAudioWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_signpostLog;
  uint64_t v6 = v5;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    id v8 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportAudio", "exporting audio %{public}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = __Block_byref_object_copy__229312;
  double v21 = __Block_byref_object_dispose__229313;
  id v22 = 0;
  id v9 = [(_PXStoryExportOperation *)self audioQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___PXStoryExportOperation__exportAudioWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = &buf;
  dispatch_sync(v9, block);

  objc_initWeak(&location, self);
  id v10 = *(void **)(*((void *)&buf + 1) + 40);
  int32_t v11 = [(_PXStoryExportOperation *)self audioQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61___PXStoryExportOperation__exportAudioWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5DD1848;
  objc_copyWeak(&v15, &location);
  id v12 = v4;
  id v14 = v12;
  [v10 requestMediaDataWhenReadyOnQueue:v11 usingBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

- (void)_addAudioInputToAssetWriter:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F15228];
  v21[0] = *MEMORY[0x1E4F151E0];
  v21[1] = v5;
  v22[0] = &unk_1F02D9730;
  v22[1] = &unk_1F02D9718;
  v21[2] = *MEMORY[0x1E4F15270];
  v22[2] = &unk_1F02D9748;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  id v7 = objc_alloc(MEMORY[0x1E4F163C0]);
  id v8 = (void *)[v7 initWithMediaType:*MEMORY[0x1E4F15BA8] outputSettings:v6];
  [v8 setExpectsMediaDataInRealTime:0];
  id v9 = [(_PXStoryExportOperation *)self audioQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___PXStoryExportOperation__addAudioInputToAssetWriter___block_invoke;
  block[3] = &unk_1E5DD32A8;
  block[4] = self;
  id v10 = v8;
  id v20 = v10;
  dispatch_sync(v9, block);

  if (([v4 canAddInput:v10] & 1) == 0)
  {
    uint64_t v17 = PXStoryErrorCreateWithCodeDebugFormat(10, @"Cannot add audio input", v11, v12, v13, v14, v15, v16, v18);
    [(_PXStoryExportOperation *)self _setError:v17];
  }
  if ([(_PXStoryExportOperation *)self shouldContinueExporting]) {
    [v4 addInput:v10];
  }
}

- (void)_audioWriteQueue_setupAudioReaderWithAudioExportComposition:(id)a3 audioMix:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_PXStoryExportOperation *)self audioQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = self->_signpostLog;
  id v10 = v9;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v9))
  {
    uint64_t v12 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    *(_DWORD *)long long buf = 138543362;
    v51 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequestSetupAudio", "requesting music asset for %{public}@", buf, 0xCu);
  }
  id v47 = 0;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v6 error:&v47];
  id v19 = v47;
  if (v13)
  {
    [(_PXStoryExportOperation *)self setAudioQueue_assetReader:v13];
    id v46 = v6;
    id v20 = [v6 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
    uint64_t v21 = *MEMORY[0x1E4F15228];
    v48[0] = *MEMORY[0x1E4F151E0];
    v48[1] = v21;
    v49[0] = &unk_1F02D9700;
    v49[1] = &unk_1F02D9718;
    v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F16380]) initWithAudioTracks:v20 audioSettings:v45];
    [v22 setAudioMix:v7];
    [v22 setAlwaysCopiesSampleData:0];
    if ([v13 canAddOutput:v22])
    {
      [v13 addOutput:v22];
      [(_PXStoryExportOperation *)self setAudioQueue_audioMixOutput:v22];
    }
    else
    {
      uint64_t v28 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v19, @"cannot add audio mix to asset reader", v23, v24, v25, v26, v27, v42);
      [(_PXStoryExportOperation *)self _setError:v28];
    }
    uint64_t v29 = [(_PXStoryExportOperation *)self audioQueue_assetReader];
    char v30 = [v29 startReading];

    if ((v30 & 1) == 0)
    {
      uint64_t v43 = [(_PXStoryExportOperation *)self audioQueue_assetReader];
      v31 = [v43 error];
      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v31, @"failed to read from audio asset", v32, v33, v34, v35, v36, (uint64_t)v43);
      v38 = id v37 = v7;
      [(_PXStoryExportOperation *)self _setError:v38];

      id v7 = v37;
    }
    uint64_t v39 = self->_signpostLog;
    SEL v40 = v39;
    os_signpost_id_t v41 = self->_signpostID;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v39))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v41, "StoryExportRequestSetupAudio", "", buf, 2u);
    }

    [(_PXStoryExportOperation *)self _setHasAudioForExport:1];
    id v6 = v46;
  }
  else
  {
    id v20 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v19, @"cannot create audio reader", v14, v15, v16, v17, v18, v42);
    [(_PXStoryExportOperation *)self _setError:v20];
  }
}

- (id)_audibleVideoHilightsInStory
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [(_PXStoryExportOperation *)self storyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___PXStoryExportOperation__audibleVideoHilightsInStory__block_invoke;
  block[3] = &unk_1E5DD0D90;
  block[4] = self;
  SEL v12 = a2;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(v5, block);

  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (void)_addAudioAssetsForVideoHilightsToAudioCompositionBuilder:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  uint64_t v24 = [(_PXStoryExportOperation *)self _audibleVideoHilightsInStory];
  if ([v24 count])
  {
    id v4 = [MEMORY[0x1E4F390D0] defaultManager];
    memset(&v47, 0, sizeof(v47));
    CMTimeMakeWithSeconds(&v47, 30.0, 600);
    uint64_t v5 = objc_alloc_init(PXVideoRequestOptions);
    id v6 = +[PXStorySettings sharedInstance];
    PXSetupPXVideoRequestOptionsForDeliveryQuality(v5, [v6 exportVideoQuality]);

    [(PXVideoRequestOptions *)v5 setNetworkAccessAllowed:1];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v24;
    uint64_t v27 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v44;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v44 != v26) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
        if (v8)
        {
          [*(id *)(*((void *)&v43 + 1) + 8 * v7) loadingVideoTimeRange];
        }
        else
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v40 = 0u;
        }
        v39[0] = v40;
        v39[1] = v41;
        v39[2] = v42;
        [(PXVideoRequestOptions *)v5 setTimeRange:v39];
        v37[0] = 0;
        v37[1] = v37;
        v37[2] = 0x2020000000;
        char v38 = 0;
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
        id v10 = [v8 asset];
        id v11 = [(PXVideoRequestOptions *)v5 photoKitRequestOptions];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke;
        v33[3] = &unk_1E5DC7738;
        v33[4] = self;
        v33[5] = v8;
        id v34 = v28;
        uint64_t v36 = v37;
        SEL v12 = v9;
        uint64_t v35 = v12;
        uint64_t v13 = [v4 requestAVAssetForVideo:v10 options:v11 resultHandler:v33];

        CMTime v32 = v47;
        if (![(_PXStoryExportOperation *)self _waitWhileExportingCanContinueForSemaphore:v12 timeout:&v32])
        {
          uint64_t v14 = [(_PXStoryExportOperation *)self audioQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke_407;
          block[3] = &unk_1E5DD0588;
          v31 = v37;
          char v30 = v12;
          dispatch_sync(v14, block);

          [v4 cancelImageRequest:v13];
          if (![(_PXStoryExportOperation *)self isCancelled])
          {
            uint64_t v15 = [v8 asset];
            id v22 = PXStoryErrorCreateWithCodeDebugFormat(10, @"Timed out waiting for asset %@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
            [(_PXStoryExportOperation *)self _setError:v22];
          }
        }
        BOOL v23 = [(_PXStoryExportOperation *)self shouldContinueExporting];

        _Block_object_dispose(v37, 8);
        if (!v23) {
          break;
        }
        if (v27 == ++v7)
        {
          uint64_t v27 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v27) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)_handleMediaRequestCompletedForSongAsset:(id)a3 avAsset:(id)a4 audioMix:(id)a5 info:(id)a6 audioCompositionBuilder:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(_PXStoryExportOperation *)self audioQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __114___PXStoryExportOperation__handleMediaRequestCompletedForSongAsset_avAsset_audioMix_info_audioCompositionBuilder___block_invoke;
  v23[3] = &unk_1E5DC76E8;
  id v24 = v13;
  uint64_t v25 = self;
  id v26 = v15;
  id v27 = v12;
  id v28 = v16;
  id v29 = v14;
  id v18 = v14;
  id v19 = v16;
  id v20 = v12;
  id v21 = v15;
  id v22 = v13;
  dispatch_sync(v17, v23);
}

- (void)_addSongAssetToAudioCompositionBuilder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self->_signpostLog;
  uint64_t v7 = v6;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    dispatch_semaphore_t v9 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequestMusicAsset", "requesting music asset for %{public}@", (uint8_t *)&buf, 0xCu);
  }
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  CMTime v32 = __Block_byref_object_copy__229312;
  uint64_t v33 = __Block_byref_object_dispose__229313;
  id v34 = 0;
  id v11 = [(_PXStoryExportOperation *)self storyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66___PXStoryExportOperation__addSongAssetToAudioCompositionBuilder___block_invoke;
  block[3] = &unk_1E5DC76C0;
  void block[4] = self;
  p_long long buf = &buf;
  id v24 = &v26;
  SEL v25 = a2;
  id v12 = v5;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  dispatch_sync(v11, block);

  if (v27[3])
  {
    memset(&v19, 0, sizeof(v19));
    CMTimeMakeWithSeconds(&v19, 120.0, 600);
    CMTime v18 = v19;
    if (![(_PXStoryExportOperation *)self _waitWhileExportingCanContinueForSemaphore:v13 timeout:&v18])
    {
      [*(id *)(*((void *)&buf + 1) + 40) cancelRequest:v27[3]];
      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v13, v14);
    }
  }
  id v15 = self->_signpostLog;
  id v16 = v15;
  os_signpost_id_t v17 = self->_signpostID;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v15))
  {
    LOWORD(v19.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "StoryExportRequestMusicAsset", "", (uint8_t *)&v19, 2u);
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v26, 8);
}

- (void)_setupAudioExporting
{
  BOOL v3 = [PXStoryExportAudioCompositionBuilder alloc];
  [(_PXStoryExportOperation *)self exportDuration];
  [(_PXStoryExportOperation *)self outroDuration];
  id v4 = [(PXStoryExportAudioCompositionBuilder *)v3 initWithMaximumDuration:v10 outroDuration:v9];
  [(_PXStoryExportOperation *)self _addSongAssetToAudioCompositionBuilder:v4];
  if ([(_PXStoryExportOperation *)self shouldContinueExporting]) {
    [(_PXStoryExportOperation *)self _addAudioAssetsForVideoHilightsToAudioCompositionBuilder:v4];
  }
  if ([(_PXStoryExportOperation *)self shouldContinueExporting])
  {
    id v5 = [(_PXStoryExportOperation *)self audioQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47___PXStoryExportOperation__setupAudioExporting__block_invoke;
    v6[3] = &unk_1E5DD32A8;
    uint64_t v7 = v4;
    id v8 = self;
    dispatch_sync(v5, v6);
  }
}

- (void)_storyQueue_checkForDriftFromCurrentTime:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_storyQueue_hasEncounteredDriftError)
  {
    long long v12 = 0uLL;
    id v5 = [(_PXStoryExportOperation *)self storyQueue_storyModel];
    id v6 = v5;
    if (v5) {
      [v5 nominalPlaybackTime];
    }
    else {
      long long v12 = 0uLL;
    }

    *(_OWORD *)&time.value = v12;
    time.epoch = 0;
    *(_OWORD *)&v11.value = *(_OWORD *)&a3->var0;
    v11.epoch = a3->var3;
    double Seconds = CMTimeGetSeconds(&time);
    CMTime time = v11;
    if (vabdd_f64(Seconds, CMTimeGetSeconds(&time)) > 0.5)
    {
      self->_storyQueue_hasEncounteredDriftError = 1;
      id v8 = PLStoryGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        CMTime time = (CMTime)*a3;
        Float64 v9 = CMTimeGetSeconds(&time);
        *(_OWORD *)&time.value = v12;
        time.epoch = 0;
        Float64 v10 = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 134218754;
        *(CMTimeValue *)((char *)&time.value + 4) = 0x3FE0000000000000;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = v9;
        HIWORD(time.epoch) = 2048;
        Float64 v14 = v10;
        __int16 v15 = 2112;
        id v16 = self;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_FAULT, "Unexpected drift (>%.2fs) between export current time (%.2fs) and story model nominal playback time (%.2fs) during export operation %@", (uint8_t *)&time, 0x2Au);
      }
    }
  }
}

- (void)_checkForDriftFromCurrentTime:(id *)a3
{
  objc_initWeak(&location, self);
  id v5 = [(_PXStoryExportOperation *)self storyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___PXStoryExportOperation__checkForDriftFromCurrentTime___block_invoke;
  block[3] = &unk_1E5DCE6A8;
  objc_copyWeak(&v7, &location);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_exportVideo
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_signpostLog;
  id v4 = v3;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    id v6 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    LODWORD(buf.value) = 138543362;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v6;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportVideo", "exporting video %{public}@", (uint8_t *)&buf, 0xCu);
  }
  objc_initWeak(&location, self);
  id v7 = [(_PXStoryExportOperation *)self storyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___PXStoryExportOperation__exportVideo__block_invoke;
  block[3] = &unk_1E5DD20C8;
  void block[4] = self;
  objc_copyWeak(&v41, &location);
  dispatch_sync(v7, block);

  memset(&v39, 0, sizeof(v39));
  [(_PXStoryExportOperation *)self exportDuration];
  v38.epoch = 0;
  *(_OWORD *)&v38.value = PXStoryTimeZero;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [(_PXStoryExportOperation *)self configuration];
  Float64 v9 = [v8 videoOptions];
  CMTimeMake(&v36, 1, [v9 frameRate]);
  CMTime v37 = v36;

  CMTime buf = v39;
  double Seconds = CMTimeGetSeconds(&buf);
  CMTime buf = v37;
  double v11 = CMTimeGetSeconds(&buf);
  long long v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  id v13 = [(_PXStoryExportOperation *)self progress];
  [v13 addChild:v12 withPendingUnitCount:70];

  uint64_t v14 = 0;
  float v15 = Seconds / v11;
  unint64_t v16 = vcvtps_s32_f32(v15);
  do
  {
    if (![(_PXStoryExportOperation *)self shouldContinueExporting]) {
      break;
    }
    CMTime buf = v38;
    CMTime time2 = v39;
    if ((CMTimeCompare(&buf, &time2) & 0x80000000) == 0) {
      break;
    }
    uint64_t v17 = (void *)MEMORY[0x1AD10CB00]();
    CMTime buf = v38;
    [(_PXStoryExportOperation *)self _advanceLayoutToStoryTime:&buf];
    CMTime v18 = [(_PXStoryExportOperation *)self layoutCompleteSemaphore];
    dispatch_time_t v19 = dispatch_time(0, 30000000000);
    intptr_t v20 = dispatch_semaphore_wait(v18, v19);

    if (v20)
    {
      CMTime buf = v38;
      *(double *)&uint64_t v21 = CMTimeGetSeconds(&buf);
      uint64_t v28 = PXStoryErrorCreateWithCodeDebugFormat(10, @"timed out waiting for layout to complete at time %f", v22, v23, v24, v25, v26, v27, v21);
      [(_PXStoryExportOperation *)self _setError:v28];
    }
    else
    {
      uint64_t v29 = [(_PXStoryExportOperation *)self completedWritingVideoFrameSemaphore];
      dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);

      CMTime buf = v38;
      CMTime time2 = v37;
      CMTimeAdd(&v35, &buf, &time2);
      CMTime v38 = v35;
      ++v14;
      [v12 setCompletedUnitCount:(uint64_t)(double)(100 * v14 / v16)];
      if (__ROR8__(0x888888888888888 - 0x1111111111111111 * v14, 1) <= 0x888888888888888uLL)
      {
        CMTime buf = v38;
        [(_PXStoryExportOperation *)self _checkForDriftFromCurrentTime:&buf];
      }
    }
  }
  while (!v20);
  char v30 = [(_PXStoryExportOperation *)self videoWriterQueue];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __39___PXStoryExportOperation__exportVideo__block_invoke_3;
  v34[3] = &unk_1E5DD36F8;
  v34[4] = self;
  dispatch_sync(v30, v34);

  uint64_t v31 = self->_signpostLog;
  CMTime v32 = v31;
  os_signpost_id_t v33 = self->_signpostID;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v31))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v32, OS_SIGNPOST_INTERVAL_END, v33, "StoryExportVideo", "", (uint8_t *)&buf, 2u);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)_videoWriterQueue_writeVideoWithPixelBuffer:(__CVBuffer *)a3 forStoryTime:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = [(_PXStoryExportOperation *)self videoWriterQueue];
  dispatch_assert_queue_V2(v7);

  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = self->_frequentSignpostLog;
  Float64 v9 = v8;
  os_signpost_id_t frequentSignpostID = self->_frequentSignpostID;
  if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v8))
  {
    CMTime time = (CMTime)*a4;
    Float64 Seconds = CMTimeGetSeconds(&time);
    long long v12 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    LODWORD(time.value) = 134218242;
    *(Float64 *)((char *)&time.value + 4) = Seconds;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = v12;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, frequentSignpostID, "StoryExportWriteVideoFrame", "append video frame at %f for export %{public}@", (uint8_t *)&time, 0x16u);
  }
  id v13 = [(_PXStoryExportOperation *)self videoWriterQueue_pixelBufferWriter];
  uint64_t v14 = [v13 assetWriterInput];

  if (([v14 isReadyForMoreMediaData] & 1) == 0)
  {
    do
    {
      if (![(_PXStoryExportOperation *)self shouldContinueExporting]) {
        break;
      }
      [MEMORY[0x1E4F29060] sleepForTimeInterval:0.01];
    }
    while (![v14 isReadyForMoreMediaData]);
  }
  if ([(_PXStoryExportOperation *)self shouldContinueExporting])
  {
    [(_PXStoryExportOperation *)self videoQueue_firstWrittenStoryTime];
    if ((v33 & 1) == 0)
    {
      long long v31 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      [(_PXStoryExportOperation *)self setVideoQueue_firstWrittenStoryTime:&v31];
    }
    [(_PXStoryExportOperation *)self videoQueue_firstWrittenStoryTime];
    CMTime time = (CMTime)*a4;
    CMTime rhs = *(CMTime *)v29;
    CMTimeSubtract(&v30, &time, &rhs);
    CMTime time = v30;
    float v15 = [(_PXStoryExportOperation *)self videoWriterQueue_pixelBufferWriter];
    CMTime rhs = time;
    char v16 = [v15 appendPixelBuffer:a3 withPresentationTime:&rhs];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [(_PXStoryExportOperation *)self assetWriter];
      CMTime v18 = [v17 error];
      uint64_t v24 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v18, @"failed to write sample with assetWriterAdapter", v19, v20, v21, v22, v23, *(uint64_t *)v29);
      [(_PXStoryExportOperation *)self _setError:v24];
    }
  }
  uint64_t v25 = [(_PXStoryExportOperation *)self completedWritingVideoFrameSemaphore];
  dispatch_semaphore_signal(v25);

  uint64_t v26 = self->_frequentSignpostLog;
  uint64_t v27 = v26;
  os_signpost_id_t v28 = self->_frequentSignpostID;
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v26))
  {
    LOWORD(time.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v27, OS_SIGNPOST_INTERVAL_END, v28, "StoryExportWriteVideoFrame", "", (uint8_t *)&time, 2u);
  }
}

- (void)_writeVideoWithPixelBuffer:(__CVBuffer *)a3 forStoryTime:(id *)a4
{
  CVPixelBufferRetain(a3);
  objc_initWeak(&location, self);
  id v7 = [(_PXStoryExportOperation *)self videoWriterQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___PXStoryExportOperation__writeVideoWithPixelBuffer_forStoryTime___block_invoke;
  v8[3] = &unk_1E5DC7648;
  objc_copyWeak(v9, &location);
  v9[1] = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  dispatch_async(v7, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (id)pixelBufferAttributes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(_PXStoryExportOperation *)self videoOptions];
  [v4 resolutionInPixels];
  double v6 = v5;
  double v8 = v7;

  [v3 setObject:&unk_1F02D96E8 forKeyedSubscript:*MEMORY[0x1E4F24D70]];
  Float64 v9 = [NSNumber numberWithDouble:v6];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F24E10]];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [NSNumber numberWithDouble:v8];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F24D08]];

  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F24D40]];
  [v3 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:*MEMORY[0x1E4F24D20]];
  double v11 = (void *)[v3 copy];

  return v11;
}

- (id)_videoOutputSettings
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(_PXStoryExportOperation *)self videoOptions];
  [v4 resolutionInPixels];
  double v6 = v5;
  double v8 = v7;

  Float64 v9 = [NSNumber numberWithDouble:v6];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F16300]];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [NSNumber numberWithDouble:v8];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F162A0]];

  double v11 = [(_PXStoryExportOperation *)self videoOptions];
  uint64_t v12 = [v11 codec];

  id v13 = (void *)MEMORY[0x1E4F16228];
  if (v12)
  {
    if (v12 != 1) {
      goto LABEL_6;
    }
    if ([MEMORY[0x1E4F8CC30] currentDeviceHEVCCapabilities]) {
      id v13 = (void *)MEMORY[0x1E4F16230];
    }
  }
  [v3 setObject:*v13 forKeyedSubscript:*MEMORY[0x1E4F16220]];
LABEL_6:
  uint64_t v14 = [(_PXStoryExportOperation *)self videoOptions];
  float v15 = [v14 averageBitratePerSecond];

  if (v15)
  {
    uint64_t v19 = *MEMORY[0x1E4F161D8];
    v20[0] = v15;
    char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F16268]];
  }
  uint64_t v17 = (void *)[v3 copy];

  return v17;
}

- (void)_addVideoInputToAssetWriter:(id)a3
{
  id v4 = a3;
  double v5 = [(_PXStoryExportOperation *)self _videoOutputSettings];
  id v6 = objc_alloc(MEMORY[0x1E4F163C0]);
  double v7 = (void *)[v6 initWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v5];
  [v7 setExpectsMediaDataInRealTime:0];
  double v8 = [(_PXStoryExportOperation *)self pixelBufferAttributes];
  Float64 v9 = (void *)[objc_alloc(MEMORY[0x1E4F163D8]) initWithAssetWriterInput:v7 sourcePixelBufferAttributes:v8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(_PXStoryExportOperation *)self videoWriterQueue];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __55___PXStoryExportOperation__addVideoInputToAssetWriter___block_invoke;
  uint64_t v22 = &unk_1E5DD32A8;
  uint64_t v23 = self;
  id v24 = v9;
  id v11 = v9;
  dispatch_sync(v10, &v19);

  if (([v4 canAddInput:v7] & 1) == 0)
  {
    CMTime v18 = PXStoryErrorCreateWithCodeDebugFormat(10, @"Cannot add video input", v12, v13, v14, v15, v16, v17, v19);
    [(_PXStoryExportOperation *)self _setError:v18];
  }
  if ([(_PXStoryExportOperation *)self shouldContinueExporting]) {
    [v4 addInput:v7];
  }
}

- (void)_storyQueue_processRenderedLayoutPixelBuffer:(__CVBuffer *)a3
{
  double v5 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(_PXStoryExportOperation *)self layoutCompleteSemaphore];
  dispatch_semaphore_signal(v6);

  double v7 = self->_frequentSignpostLog;
  double v8 = v7;
  os_signpost_id_t frequentSignpostID = self->_frequentSignpostID;
  if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)CMTime buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, frequentSignpostID, "StoryExportLayoutRenderVideoFrame", "", buf, 2u);
  }

  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(_PXStoryExportOperation *)self storyQueue_pacingController];
  id v11 = [v10 timeSource];

  if (v11) {
    [v11 currentTime];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  [(_PXStoryExportOperation *)self _writeVideoWithPixelBuffer:a3 forStoryTime:v12];
}

- (void)_storyQueue_advanceLayoutToStoryTime:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v5 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(_PXStoryExportOperation *)self storyQueue_pacingController];
  double v7 = [v6 timeSource];
  double v8 = v7;
  memset(&v19, 0, sizeof(v19));
  if (v7) {
    [v7 currentTime];
  }
  else {
    memset(&v18[32], 0, 24);
  }
  CMTime lhs = (CMTime)*a3;
  CMTime rhs = *(CMTime *)&v18[32];
  CMTimeSubtract(&v19, &lhs, &rhs);
  if (([v6 canChangePlaybackTime] & 1) == 0) {
    PXAssertGetLog();
  }
  CMTime lhs = v19;
  [v8 incrementByTime:&lhs];
  Float64 v9 = [(_PXStoryExportOperation *)self storyQueue_engine];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [v9 layout];
  [v10 setNeedsUpdate];

  id v11 = [(_PXStoryExportOperation *)self storyQueue_engine];
  uint64_t v12 = [v11 displayLink];

  CMTime lhs = v19;
  CMTime rhs = v19;
  *(CMTime *)CMTime v18 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (!CMTimeCompare(&rhs, (CMTime *)v18)) {
    CMTimeMake(&lhs, 1, 600);
  }
  CMTime rhs = lhs;
  [v12 incrementTargetTimeWithInterval:CMTimeGetSeconds(&rhs)];
  uint64_t v13 = self->_frequentSignpostLog;
  uint64_t v14 = v13;
  os_signpost_id_t frequentSignpostID = self->_frequentSignpostID;
  if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    uint64_t v16 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    LODWORD(rhs.value) = 138543362;
    *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)v16;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, frequentSignpostID, "StoryExportLayoutRenderLoadingSpriteContent", "loading layout sprites for export %{public}@", (uint8_t *)&rhs, 0xCu);
  }
  uint64_t v17 = [(_PXStoryExportOperation *)self storyQueue_engine];
  [v17 updateIfNeeded];
}

- (void)_advanceLayoutToStoryTime:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v5 = self->_frequentSignpostLog;
  id v6 = v5;
  os_signpost_id_t frequentSignpostID = self->_frequentSignpostID;
  if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    CMTime time = (CMTime)*a3;
    Float64 Seconds = CMTimeGetSeconds(&time);
    Float64 v9 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    LODWORD(time.value) = 134218242;
    *(Float64 *)((char *)&time.value + 4) = Seconds;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, frequentSignpostID, "StoryExportLayoutRenderVideoFrame", "request layout render at %f for export %{public}@", (uint8_t *)&time, 0x16u);
  }
  objc_initWeak((id *)&time, self);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(_PXStoryExportOperation *)self storyQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53___PXStoryExportOperation__advanceLayoutToStoryTime___block_invoke;
  v11[3] = &unk_1E5DCE6A8;
  objc_copyWeak(&v12, (id *)&time);
  long long v13 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  dispatch_async(v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&time);
}

- (id)_storyQueue_createStoryModel
{
  id v3 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(_PXStoryExportOperation *)self configuration];
  double v5 = [v4 storyConfiguration];
  id v6 = [(_PXStoryExportOperation *)self storyQueue];
  double v7 = (void *)[v5 copyWithStoryQueue:v6];

  os_log_t v8 = os_log_create((const char *)*MEMORY[0x1E4F8C518], "Export");
  [v7 setLog:v8];

  [v7 setOptions:1];
  Float64 v9 = [(_PXStoryExportOperation *)self configuration];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [v9 extendedTraitCollection];

  id v11 = [v7 timelineProducer];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    PXStoryTimelineProducerCreateDefault();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v14 = v13;

  uint64_t v15 = [[PXStoryRecipeManager alloc] initWithConfiguration:v7];
  uint64_t v16 = [[PXStoryResourcesDataSourceManager alloc] initWithRecipeManager:v15];
  uint64_t v17 = [PXStoryStyleManager alloc];
  CMTime v18 = [v7 errorReporter];
  CMTime v19 = [(PXStoryStyleManager *)v17 initWithRecipeManager:v15 errorReporter:v18];

  uint64_t v20 = [[PXStoryTimelineSpecManager alloc] initWithExtendedTraitCollection:v10 configuration:v7];
  uint64_t v21 = +[PXStoryTimelineManager timelineManagerWithTimelineProducer:v14 resourcesDataSourceManager:v16 styleManager:v19 specManager:v20 configuration:v7 loadingCoordinator:0 paperTrailOptions:0];
  uint64_t v22 = -[PXStoryLayoutSpecManager initWithExtendedTraitCollection:options:storyConfigurationOptions:]([PXStoryLayoutSpecManager alloc], "initWithExtendedTraitCollection:options:storyConfigurationOptions:", v10, 0, [v7 options]);
  uint64_t v23 = [[PXStoryModel alloc] initWithTimelineManager:v21 layoutSpecManager:v22 configuration:v7];

  return v23;
}

- (void)_setupStoryLayout
{
  id v4 = [(_PXStoryExportOperation *)self videoWriterQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___PXStoryExportOperation__setupStoryLayout__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_sync(v4, block);

  if ([(_PXStoryExportOperation *)self shouldContinueExporting])
  {
    double v5 = [(_PXStoryExportOperation *)self storyQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44___PXStoryExportOperation__setupStoryLayout__block_invoke_3;
    v6[3] = &unk_1E5DD08D8;
    void v6[4] = self;
    v6[5] = a2;
    dispatch_sync(v5, v6);
  }
}

- (PXMediaProvider)storyQueue_mediaProvider
{
  id v3 = [(_PXStoryExportOperation *)self storyQueue];
  dispatch_assert_queue_V2(v3);

  storyQueue_mediaProvider = self->_storyQueue_mediaProvider;
  if (!storyQueue_mediaProvider)
  {
    double v5 = [(_PXStoryExportOperation *)self configuration];
    id v6 = [v5 storyConfiguration];

    double v7 = [v6 mediaProvider];
    os_log_t v8 = self->_storyQueue_mediaProvider;
    self->_storyQueue_mediaProvider = v7;

    storyQueue_mediaProvider = self->_storyQueue_mediaProvider;
  }
  return storyQueue_mediaProvider;
}

- (BOOL)_waitForStoryStateWhileExportingCanContinueByWatchingChanges:(unint64_t)a3 timeout:(id *)a4 verificationBlock:(id)a5
{
  id v8 = a5;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__229312;
  v32[4] = __Block_byref_object_dispose__229313;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(_PXStoryExportOperation *)self storyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke;
  block[3] = &unk_1E5DC75D8;
  uint64_t v27 = v32;
  void block[4] = self;
  unint64_t v29 = a3;
  id v11 = v10;
  id v24 = v11;
  id v12 = v8;
  id v26 = v12;
  os_signpost_id_t v28 = v30;
  id v13 = v9;
  uint64_t v25 = v13;
  dispatch_sync(v11, block);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a4;
  LOBYTE(a4) = [(_PXStoryExportOperation *)self _waitWhileExportingCanContinueForSemaphore:v13 timeout:&v22];
  uint64_t v14 = [(_PXStoryExportOperation *)self storyQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke_3;
  v17[3] = &unk_1E5DC7600;
  char v21 = (char)a4;
  CMTime v19 = v32;
  uint64_t v20 = v30;
  CMTime v18 = v13;
  uint64_t v15 = v13;
  dispatch_sync(v14, v17);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  return (char)a4;
}

- (void)_preloadStoryResourcesAndWaitForBuffering
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = self->_signpostLog;
  id v4 = v3;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    id v6 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequestPreloadStoryResources", "preload story resources for export %{public}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__229312;
  CMTime v35 = __Block_byref_object_dispose__229313;
  id v36 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  void v30[3] = __Block_byref_object_copy__229312;
  v30[4] = __Block_byref_object_dispose__229313;
  id v31 = 0;
  double v7 = [(_PXStoryExportOperation *)self storyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke;
  block[3] = &unk_1E5DCCE38;
  void block[4] = self;
  void block[5] = &buf;
  void block[6] = v30;
  dispatch_sync(v7, block);

  id v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  dispatch_semaphore_t v9 = [(_PXStoryExportOperation *)self progress];
  [v9 addChild:v8 withPendingUnitCount:30];

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__229312;
  v27[4] = __Block_byref_object_dispose__229313;
  id v28 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(_PXStoryExportOperation *)self storyQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_4;
  void v21[3] = &unk_1E5DC7540;
  id v24 = v27;
  p_long long buf = &buf;
  uint64_t v26 = 7;
  id v11 = v8;
  id v22 = v11;
  uint64_t v23 = self;
  dispatch_sync(v10, v21);

  *(_OWORD *)CMTime v19 = *MEMORY[0x1E4F1FA10];
  uint64_t v20 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  [(_PXStoryExportOperation *)self _waitForStoryStateWhileExportingCanContinueByWatchingChanges:0x200000 timeout:v19 verificationBlock:&__block_literal_global_330_229486];
  id v12 = [(_PXStoryExportOperation *)self storyQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_7;
  v18[3] = &unk_1E5DC7588;
  v18[4] = v27;
  v18[5] = &buf;
  v18[6] = v30;
  dispatch_sync(v12, v18);

  if ([(_PXStoryExportOperation *)self shouldContinueExporting])
  {
    id v13 = [(_PXStoryExportOperation *)self storyQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_10;
    v17[3] = &unk_1E5DD36F8;
    void v17[4] = self;
    dispatch_sync(v13, v17);
  }
  uint64_t v14 = self->_signpostLog;
  uint64_t v15 = v14;
  os_signpost_id_t v16 = self->_signpostID;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v14))
  {
    *(_WORD *)CMTime v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "StoryExportRequestPreloadStoryResources", "", v19, 2u);
  }

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(&buf, 8);
}

- (void)_setupStoryModel
{
  id v4 = [(_PXStoryExportOperation *)self storyQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43___PXStoryExportOperation__setupStoryModel__block_invoke;
  v5[3] = &unk_1E5DD08D8;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);
}

- (void)_finishWriting
{
  if ([(_PXStoryExportOperation *)self isCancelled])
  {
    id v3 = [(_PXStoryExportOperation *)self assetWriter];
    [v3 cancelWriting];
  }
  else
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    double v5 = [(_PXStoryExportOperation *)self assetWriter];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41___PXStoryExportOperation__finishWriting__block_invoke;
    v17[3] = &unk_1E5DD36F8;
    dispatch_semaphore_t v18 = v4;
    id v3 = v4;
    [v5 finishWritingWithCompletionHandler:v17];

    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }

  id v6 = [(_PXStoryExportOperation *)self error];
  if (!v6)
  {
    double v7 = [(_PXStoryExportOperation *)self assetWriter];
    uint64_t v8 = [v7 status];

    if (v8 != 3) {
      return;
    }
    id v6 = [(_PXStoryExportOperation *)self assetWriter];
    dispatch_semaphore_t v9 = [v6 error];
    uint64_t v15 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v9, @"failed to finish writing asset", v10, v11, v12, v13, v14, v16);
    [(_PXStoryExportOperation *)self _setError:v15];
  }
}

- (void)_addMetadataToAssetWriter:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F165A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setKeySpace:*MEMORY[0x1E4F15DF8]];
  [v5 setKey:*MEMORY[0x1E4F15E88]];
  [v5 setValue:@"Memories"];
  v7[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v4 setMetadata:v6];
}

- (void)_setupWriter
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = self->_signpostLog;
  id v4 = v3;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    id v6 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequestSetupVideoWriter", "begin video writer setup for export %{public}@", buf, 0xCu);
  }
  double v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [(_PXStoryExportOperation *)self destinationURL];
  dispatch_semaphore_t v9 = [v8 path];
  int v10 = [v7 fileExistsAtPath:v9];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v12 = [(_PXStoryExportOperation *)self destinationURL];
    id v28 = 0;
    [v11 removeItemAtURL:v12 error:&v28];
    id v13 = v28;

    if (v13)
    {
      [(_PXStoryExportOperation *)self _setError:v13];
      goto LABEL_23;
    }
  }
  id v14 = objc_alloc(MEMORY[0x1E4F163B8]);
  uint64_t v15 = [(_PXStoryExportOperation *)self destinationURL];
  uint64_t v16 = *MEMORY[0x1E4F15AB0];
  id v27 = 0;
  uint64_t v17 = (void *)[v14 initWithURL:v15 fileType:v16 error:&v27];
  id v13 = v27;

  if (v13) {
    goto LABEL_8;
  }
  [(_PXStoryExportOperation *)self setAssetWriter:v17];
  [(_PXStoryExportOperation *)self _addVideoInputToAssetWriter:v17];
  if (![(_PXStoryExportOperation *)self shouldContinueExporting]) {
    goto LABEL_18;
  }
  if ([(_PXStoryExportOperation *)self hasAudioForExport]) {
    [(_PXStoryExportOperation *)self _addAudioInputToAssetWriter:v17];
  }
  if ([(_PXStoryExportOperation *)self shouldContinueExporting]) {
    [(_PXStoryExportOperation *)self _addMetadataToAssetWriter:v17];
  }
  if ([(_PXStoryExportOperation *)self shouldContinueExporting])
  {
    if ([v17 startWriting])
    {
      uint64_t v23 = [(_PXStoryExportOperation *)self assetWriter];
      *(_OWORD *)long long buf = *MEMORY[0x1E4F1FA48];
      uint64_t v30 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [v23 startSessionAtSourceTime:buf];
      id v13 = 0;
      goto LABEL_9;
    }
    id v13 = [v17 error];
    if (v13)
    {
LABEL_8:
      uint64_t v23 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v13, @"Failed to setup asset writer", v18, v19, v20, v21, v22, (uint64_t)v27);
      [(_PXStoryExportOperation *)self _setError:v23];
LABEL_9:
    }
  }
  else
  {
LABEL_18:
    id v13 = 0;
  }
  id v24 = self->_signpostLog;
  uint64_t v25 = v24;
  os_signpost_id_t v26 = self->_signpostID;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v24))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v25, OS_SIGNPOST_INTERVAL_END, v26, "StoryExportRequestSetupVideoWriter", "", buf, 2u);
  }

LABEL_23:
}

- (void)main
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = self->_signpostLog;
  id v4 = v3;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    id v6 = [(_PXStoryExportOperation *)self uniqueIdentifier];
    double v7 = [(_PXStoryExportOperation *)self destinationURL];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequest", "beginning story export %{public}@ to %@", buf, 0x16u);
  }
  [(_PXStoryExportOperation *)self collectAnalyticsForExportBegin];
  objc_claimAutoreleasedReturnValue();
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v14 = __Block_byref_object_copy__229312;
  uint64_t v15 = __Block_byref_object_dispose__229313;
  uint64_t v16 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __31___PXStoryExportOperation_main__block_invoke;
  uint64_t v11 = &unk_1E5DD2B08;
  uint64_t v12 = buf;
  px_dispatch_on_main_queue();
}

- (void)_signalSemaphoresForFailedExport
{
  id v3 = [(_PXStoryExportOperation *)self layoutCompleteSemaphore];
  dispatch_semaphore_signal(v3);

  id v4 = [(_PXStoryExportOperation *)self completedWritingVideoFrameSemaphore];
  dispatch_semaphore_signal(v4);
}

- (void)_setExportedStyle:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __45___PXStoryExportOperation__setExportedStyle___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

- (PXStoryStyle)exportedStyle
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__229312;
  int v10 = __Block_byref_object_dispose__229313;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40___PXStoryExportOperation_exportedStyle__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PXStoryStyle *)v3;
}

- (void)_setOutroDuration:(id *)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45___PXStoryExportOperation__setOutroDuration___block_invoke;
  v4[3] = &unk_1E5DD01C8;
  v4[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  dispatch_sync(stateQueue, v4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  int v10 = &unk_1AB5D584F;
  uint64_t v11 = 0;
  stateQueue = self->_stateQueue;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40___PXStoryExportOperation_outroDuration__block_invoke;
  v6[3] = &unk_1E5DCDEC8;
  v6[5] = &v7;
  void v6[6] = a3;
  void v6[4] = self;
  dispatch_sync(stateQueue, v6);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)_setExportDuration:(id *)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46___PXStoryExportOperation__setExportDuration___block_invoke;
  v4[3] = &unk_1E5DD01C8;
  v4[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  dispatch_sync(stateQueue, v4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exportDuration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  int v10 = &unk_1AB5D584F;
  uint64_t v11 = 0;
  stateQueue = self->_stateQueue;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41___PXStoryExportOperation_exportDuration__block_invoke;
  v6[3] = &unk_1E5DCDEC8;
  v6[5] = &v7;
  void v6[6] = a3;
  void v6[4] = self;
  dispatch_sync(stateQueue, v6);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)_setHasAudioForExport:(BOOL)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49___PXStoryExportOperation__setHasAudioForExport___block_invoke;
  v4[3] = &unk_1E5DCFE98;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(stateQueue, v4);
}

- (BOOL)hasAudioForExport
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44___PXStoryExportOperation_hasAudioForExport__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)status
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33___PXStoryExportOperation_status__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setStatus:(int64_t)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38___PXStoryExportOperation__setStatus___block_invoke;
  v4[3] = &unk_1E5DD08D8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

- (NSError)error
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__229312;
  int v10 = __Block_byref_object_dispose__229313;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32___PXStoryExportOperation_error__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (void)_setError:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __37___PXStoryExportOperation__setError___block_invoke;
  int v10 = &unk_1E5DD32A8;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, &v7);
  if (v6) {
    [(_PXStoryExportOperation *)self _signalSemaphoresForFailedExport];
  }
}

- (BOOL)shouldContinueExporting
{
  id v3 = [(_PXStoryExportOperation *)self error];
  if (v3) {
    LOBYTE(v4) = 0;
  }
  else {
    BOOL v4 = ![(_PXStoryExportOperation *)self isCancelled];
  }

  return v4;
}

- (BOOL)isCancelled
{
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryExportOperation;
  return [(_PXStoryExportOperation *)&v3 isCancelled];
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)_PXStoryExportOperation;
  [(_PXStoryExportOperation *)&v5 cancel];
  objc_super v3 = [(_PXStoryExportOperation *)self progress];
  [v3 setCancellationHandler:0];

  BOOL v4 = [(_PXStoryExportOperation *)self progress];
  [v4 cancel];

  [(_PXStoryExportOperation *)self _signalSemaphoresForFailedExport];
}

- (void)dealloc
{
  progress = self->_progress;
  if (progress) {
    [(NSProgress *)progress removeObserver:self forKeyPath:@"fractionCompleted"];
  }
  v4.receiver = self;
  v4.super_class = (Class)_PXStoryExportOperation;
  [(_PXStoryExportOperation *)&v4 dealloc];
}

- (_PXStoryExportOperation)initWithURL:(id)a3 configuration:(id)a4 qualityOfService:(int64_t)a5 progressHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_PXStoryExportOperation;
  id v14 = [(_PXStoryExportOperation *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = [v15 UUIDString];
    uint64_t v17 = (void *)*((void *)v14 + 47);
    *((void *)v14 + 47) = v16;

    objc_storeStrong((id *)v14 + 49, a3);
    objc_storeStrong((id *)v14 + 48, a4);
    uint64_t v18 = _Block_copy(v13);
    uint64_t v19 = (void *)*((void *)v14 + 52);
    *((void *)v14 + 52) = v18;

    uint64_t v20 = [v12 videoOptions];
    uint64_t v21 = (void *)*((void *)v14 + 51);
    *((void *)v14 + 51) = v20;

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.exportOperation.externalStateQueue", 0);
    uint64_t v23 = (void *)*((void *)v14 + 31);
    *((void *)v14 + 31) = v22;

    *((void *)v14 + 32) = 0;
    *(void *)(v14 + 284) = 0;
    *(void *)(v14 + 292) = 0;
    *(void *)(v14 + 276) = 0;
    [v14 setQualityOfService:a5];
    px_dispatch_qos_from_nsqualityofservice();
  }

  return 0;
}

@end