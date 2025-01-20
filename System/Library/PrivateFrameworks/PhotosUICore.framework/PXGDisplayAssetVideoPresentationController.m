@interface PXGDisplayAssetVideoPresentationController
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_timeRangeConvertedFromVideoSessionTimeRange:(SEL)a3;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_videoSessionTimeRangeConvertedFromTimeRange:(SEL)a3;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeConvertedFromVideoSessionTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoSessionTimeConvertedFromTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)actualTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginningTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)desiredTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pendingSeekTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pendingSeekToleranceAfter;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pendingSeekToleranceBefore;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration;
- (BOOL)_timeConversionNeeded;
- (BOOL)isAtEnd;
- (BOOL)isCleanApertureCompensationEnabled;
- (BOOL)isCrossfadingFromStillToVideoEnabled;
- (BOOL)isDuckingOtherAudioEnabled;
- (BOOL)isLoopingEnabled;
- (BOOL)isMixingAudioWithOthersEnabled;
- (BOOL)isPendingSeekScheduled;
- (BOOL)isReadyForImmediatePlayback;
- (BOOL)isVisible;
- (BOOL)resetsDesiredPlayStateOnHide;
- (BOOL)shouldDisableAutomaticPixelBufferUpdates;
- (BOOL)shouldDisplayPreviousNonNullPixelBuffer;
- (BOOL)shouldFadeVolumeChange;
- (BOOL)shouldRewindOnBackAction;
- (CGSize)targetSize;
- (NSMutableDictionary)timeObserversByTime;
- (NSString)audioSessionCategory;
- (NSString)description;
- (NSString)diagnosticDescription;
- (NSString)identifier;
- (OS_dispatch_queue)accessQueue;
- (PXDisplayAsset)displayAsset;
- (PXGDisplayAssetVideoPresentationController)init;
- (PXGDisplayAssetVideoPresentationController)initWithDisplayAsset:(id)a3 accessQueue:(id)a4;
- (PXGDisplayAssetVideoPresentationController)initWithDisplayAsset:(id)a3 accessQueue:(id)a4 videoSessionManager:(id)a5 options:(id)a6 loadingPriority:(int64_t)a7;
- (PXGDisplayAssetVideoPresentationControllerDelegate)delegate;
- (PXGVideoSessionPixelBufferSource)pixelBufferSource;
- (PXVideoSession)videoSession;
- (PXVideoSessionManager)videoSessionManager;
- (PXVideoSessionManagerDisplayAssetOptions)options;
- (double)desiredPlaybackRate;
- (float)pendingPrerollRate;
- (float)volume;
- (id)pixelBufferSourceWithMediaProvider:(id)a3;
- (id)videoSessionWithMediaProvider:(id)a3;
- (int64_t)actualPlayState;
- (int64_t)desiredPlayState;
- (int64_t)loadingPriority;
- (int64_t)pixelBufferSourceCounter;
- (void)_notifyReachedTime:(id *)a3;
- (void)_performPendingPrerollIfNeeded;
- (void)_performPendingSeekIfNeeded;
- (void)_performPrerollAtRate:(float)a3;
- (void)_performSeekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5;
- (void)_prerollCompletedSuccessfully:(BOOL)a3;
- (void)_setupPixelBufferSourceIfNeededWithMediaProvider:(id)a3;
- (void)_setupVideoSessionIfNeededWithMediaProvider:(id)a3;
- (void)_updatePresentationControllerState;
- (void)_updateVideoSession;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)prerollForImmediatePlaybackAtRate:(float)a3 withMediaProvider:(id)a4;
- (void)recyclePixelBufferSource;
- (void)seekToBeginning;
- (void)setActualPlayState:(int64_t)a3;
- (void)setActualTime:(id *)a3;
- (void)setAudioSessionCategory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setDesiredPlaybackRate:(double)a3;
- (void)setDesiredTime:(id *)a3;
- (void)setDesiredTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5;
- (void)setIsAtEnd:(BOOL)a3;
- (void)setIsCleanApertureCompensationEnabled:(BOOL)a3;
- (void)setIsCrossfadingFromStillToVideoEnabled:(BOOL)a3;
- (void)setIsDuckingOtherAudioEnabled:(BOOL)a3;
- (void)setIsLoopingEnabled:(BOOL)a3;
- (void)setIsMixingAudioWithOthersEnabled:(BOOL)a3;
- (void)setIsReadyForImmediatePlayback:(BOOL)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setPendingPrerollRate:(float)a3;
- (void)setPendingSeekTime:(id *)a3;
- (void)setPendingSeekToleranceAfter:(id *)a3;
- (void)setPendingSeekToleranceBefore:(id *)a3;
- (void)setPixelBufferSource:(id)a3;
- (void)setPixelBufferSourceCounter:(int64_t)a3;
- (void)setPlaybackStartTime:(id *)a3;
- (void)setPlaybackTimeRange:(id *)a3;
- (void)setResetsDesiredPlayStateOnHide:(BOOL)a3;
- (void)setShouldDisableAutomaticPixelBufferUpdates:(BOOL)a3;
- (void)setShouldDisplayPreviousNonNullPixelBuffer:(BOOL)a3;
- (void)setShouldFadeVolumeChange:(BOOL)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setTimeObserversByTime:(id)a3;
- (void)setVideoDuration:(id *)a3;
- (void)setVideoSession:(id)a3;
- (void)setVolume:(float)a3;
- (void)setVolume:(float)a3 withFade:(BOOL)a4;
- (void)startObservingBoundaryTime:(id *)a3;
- (void)stopObservingBoundaryTime:(id *)a3;
- (void)synchronouslySeekToDesiredTime:(id *)a3 updatePixelBufferSource:(BOOL)a4;
@end

@implementation PXGDisplayAssetVideoPresentationController

- (BOOL)shouldRewindOnBackAction
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(PXGDisplayAssetVideoPresentationController *)self isLoopingEnabled]) {
    goto LABEL_6;
  }
  memset(&buf, 0, sizeof(buf));
  [(PXGDisplayAssetVideoPresentationController *)self beginningTime];
  memset(&v13, 0, sizeof(v13));
  [(PXGDisplayAssetVideoPresentationController *)self actualTime];
  memset(&v12, 0, sizeof(v12));
  CMTime lhs = v13;
  CMTime v11 = buf;
  CMTimeSubtract(&v12, &lhs, &v11);
  v3 = PLStoryGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    CMTime lhs = v12;
    v4 = (__CFString *)CMTimeCopyDescription(0, &lhs);
    LODWORD(lhs.value) = 134218242;
    *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)self;
    LOWORD(lhs.flags) = 2112;
    *(void *)((char *)&lhs.flags + 2) = v4;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%p playedDuration: %@", (uint8_t *)&lhs, 0x16u);
  }
  if ((v12.flags & 0x1D) != 1)
  {
LABEL_6:
    CMTimeFlags v8 = 0;
  }
  else
  {
    CMTime lhs = v12;
    double Seconds = CMTimeGetSeconds(&lhs);
    v6 = +[PXStorySettings sharedInstance];
    [v6 significantPlayedDuration];
    CMTimeFlags v8 = Seconds > v7;
  }
  v9 = PLStoryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.value) = 134218240;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
    LOWORD(buf.flags) = 1024;
    *(CMTimeFlags *)((char *)&buf.flags + 2) = v8;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "%p shouldRewindOnBackAction: %i", (uint8_t *)&buf, 0x12u);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeObserversByTime, 0);
  objc_storeStrong((id *)&self->_pixelBufferSource, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_videoSessionManager, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
}

- (int64_t)loadingPriority
{
  return self->_loadingPriority;
}

- (void)setShouldFadeVolumeChange:(BOOL)a3
{
  self->_shouldFadeVolumeChange = a3;
}

- (BOOL)shouldFadeVolumeChange
{
  return self->_shouldFadeVolumeChange;
}

- (void)setTimeObserversByTime:(id)a3
{
}

- (NSMutableDictionary)timeObserversByTime
{
  return self->_timeObserversByTime;
}

- (void)setPendingSeekToleranceAfter:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_pendingSeekToleranceAfter.value = *(_OWORD *)&a3->var0;
  self->_pendingSeekToleranceAfter.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pendingSeekToleranceAfter
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[17];
  return self;
}

- (void)setPendingSeekToleranceBefore:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_pendingSeekToleranceBefore.value = *(_OWORD *)&a3->var0;
  self->_pendingSeekToleranceBefore.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pendingSeekToleranceBefore
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[16];
  return self;
}

- (void)setPendingSeekTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_pendingSeekTime.value = *(_OWORD *)&a3->var0;
  self->_pendingSeekTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pendingSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[15];
  return self;
}

- (void)setPendingPrerollRate:(float)a3
{
  self->_pendingPrerollRate = a3;
}

- (float)pendingPrerollRate
{
  return self->_pendingPrerollRate;
}

- (void)setPixelBufferSourceCounter:(int64_t)a3
{
  self->_pixelBufferSourceCounter = a3;
}

- (int64_t)pixelBufferSourceCounter
{
  return self->_pixelBufferSourceCounter;
}

- (void)setPixelBufferSource:(id)a3
{
}

- (PXGVideoSessionPixelBufferSource)pixelBufferSource
{
  return self->_pixelBufferSource;
}

- (void)setVideoSession:(id)a3
{
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)isMixingAudioWithOthersEnabled
{
  return self->_isMixingAudioWithOthersEnabled;
}

- (BOOL)isDuckingOtherAudioEnabled
{
  return self->_isDuckingOtherAudioEnabled;
}

- (NSString)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (BOOL)isCleanApertureCompensationEnabled
{
  return self->_isCleanApertureCompensationEnabled;
}

- (BOOL)isCrossfadingFromStillToVideoEnabled
{
  return self->_isCrossfadingFromStillToVideoEnabled;
}

- (BOOL)isLoopingEnabled
{
  return self->_isLoopingEnabled;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRange
{
  long long v3 = *(_OWORD *)&self[9].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[9].var0.var0;
  *(_OWORD *)&retstr->var0.int64_t var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[9].var1.var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[14];
  return self;
}

- (BOOL)isAtEnd
{
  return self->_isAtEnd;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)actualTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[13];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)desiredTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[12];
  return self;
}

- (int64_t)actualPlayState
{
  return self->_actualPlayState;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (BOOL)resetsDesiredPlayStateOnHide
{
  return self->_resetsDesiredPlayStateOnHide;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (BOOL)isReadyForImmediatePlayback
{
  return self->_isReadyForImmediatePlayback;
}

- (BOOL)shouldDisableAutomaticPixelBufferUpdates
{
  return self->_shouldDisableAutomaticPixelBufferUpdates;
}

- (BOOL)shouldDisplayPreviousNonNullPixelBuffer
{
  return self->_shouldDisplayPreviousNonNullPixelBuffer;
}

- (void)setDelegate:(id)a3
{
}

- (PXGDisplayAssetVideoPresentationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGDisplayAssetVideoPresentationControllerDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PXVideoSessionManagerDisplayAssetOptions)options
{
  return self->_options;
}

- (PXVideoSessionManager)videoSessionManager
{
  return self->_videoSessionManager;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (double)desiredPlaybackRate
{
  return self->_desiredPlaybackRate;
}

- (void)setPlaybackStartTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_playbackStartTime.value = *(_OWORD *)&a3->var0;
  self->_playbackStartTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[11];
  return self;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v8 = a3;
  if ((void *)VideoSessionObservationContext == a5)
  {
    if (v6)
    {
      v9 = [(PXGDisplayAssetVideoPresentationController *)self accessQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__PXGDisplayAssetVideoPresentationController_observable_didChange_context___block_invoke;
      block[3] = &unk_1E5DD36F8;
      block[4] = self;
      dispatch_async(v9, block);
    }
    if ((v6 & 0x2C4) != 0) {
      [(PXGDisplayAssetVideoPresentationController *)self _invalidatePresentationControllerState];
    }
    if ((v6 & 0x2000) != 0)
    {
      v10 = [(PXGDisplayAssetVideoPresentationController *)self accessQueue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __75__PXGDisplayAssetVideoPresentationController_observable_didChange_context___block_invoke_2;
      v11[3] = &unk_1E5DD36F8;
      v11[4] = self;
      dispatch_async(v10, v11);
    }
  }
}

uint64_t __75__PXGDisplayAssetVideoPresentationController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateVideoSession];
}

uint64_t __75__PXGDisplayAssetVideoPresentationController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _performPendingSeekIfNeeded];
  v2 = *(void **)(a1 + 32);
  return [v2 _performPendingPrerollIfNeeded];
}

- (NSString)diagnosticDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(PXGDisplayAssetVideoPresentationController *)self displayAsset];
  [(id)objc_claimAutoreleasedReturnValue() playbackStyle];
  PXDisplayAssetPlaybackStyleDescription();
}

- (void)_notifyReachedTime:(id *)a3
{
  v5 = [(PXGDisplayAssetVideoPresentationController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(PXGDisplayAssetVideoPresentationController *)self delegate];
    long long v8 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(PXGDisplayAssetVideoPresentationController *)self _timeConvertedFromVideoSessionTime:&v8];
    [v7 assetVideoPresentationController:self didReachTime:v10];
  }
}

- (void)stopObservingBoundaryTime:(id *)a3
{
  v4 = (void *)MEMORY[0x1E4F29238];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  [(PXGDisplayAssetVideoPresentationController *)self _videoSessionTimeConvertedFromTime:&v13];
  v5 = [v4 valueWithCMTime:v14];
  char v6 = [(PXGDisplayAssetVideoPresentationController *)self timeObserversByTime];
  double v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    long long v8 = [MEMORY[0x1E4F1CA98] null];
    char v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      v10 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
      CMTime v11 = [v10 videoPlayer];
      [v11 removeTimeObserver:v7];
    }
  }
  CMTime v12 = [(PXGDisplayAssetVideoPresentationController *)self timeObserversByTime];
  [v12 removeObjectForKey:v5];
}

- (void)startObservingBoundaryTime:(id *)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F29238];
  $3CC8671D27C23BF42ADDB32F2B5E48AE location = *a3;
  [(PXGDisplayAssetVideoPresentationController *)self _videoSessionTimeConvertedFromTime:&location];
  char v6 = [v5 valueWithCMTime:v26];
  double v7 = [(PXGDisplayAssetVideoPresentationController *)self timeObserversByTime];
  long long v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8
    || ([MEMORY[0x1E4F1CA98] null],
        char v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqual:v9],
        v9,
        v10))
  {
    CMTime v11 = [MEMORY[0x1E4F1CA98] null];
    CMTime v12 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
    if (v12)
    {
      objc_initWeak((id *)&location, self);
      $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = [v12 videoPlayer];
      v27[0] = v6;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      v15 = [(PXGDisplayAssetVideoPresentationController *)self accessQueue];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __73__PXGDisplayAssetVideoPresentationController_startObservingBoundaryTime___block_invoke;
      v21 = &unk_1E5DCE6A8;
      objc_copyWeak(&v22, (id *)&location);
      long long v23 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      uint64_t v16 = [v13 addBoundaryTimeObserverForTimes:v14 queue:v15 usingBlock:&v18];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)&location);
      CMTime v11 = (void *)v16;
    }
    v17 = [(PXGDisplayAssetVideoPresentationController *)self timeObserversByTime];
    [v17 setObject:v11 forKeyedSubscript:v6];
  }
}

void __73__PXGDisplayAssetVideoPresentationController_startObservingBoundaryTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  [WeakRetained _notifyReachedTime:&v3];
}

- (void)_performPendingSeekIfNeeded
{
  if ([(PXGDisplayAssetVideoPresentationController *)self isPendingSeekScheduled])
  {
    [(PXGDisplayAssetVideoPresentationController *)self pendingSeekTime];
    [(PXGDisplayAssetVideoPresentationController *)self pendingSeekToleranceBefore];
    [(PXGDisplayAssetVideoPresentationController *)self pendingSeekToleranceAfter];
    [(PXGDisplayAssetVideoPresentationController *)self _performSeekToTime:v5 toleranceBefore:v4 toleranceAfter:v3];
  }
}

- (BOOL)isPendingSeekScheduled
{
  [(PXGDisplayAssetVideoPresentationController *)self pendingSeekTime];
  return (v3 & 0x1D) == 1;
}

- (void)synchronouslySeekToDesiredTime:(id *)a3 updatePixelBufferSource:(BOOL)a4
{
  BOOL v4 = a4;
  memset(&v7[1], 0, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  v7[0] = *a3;
  [(PXGDisplayAssetVideoPresentationController *)self _videoSessionTimeConvertedFromTime:v7];
  char v6 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
  v7[0] = v7[1];
  [v6 seekToExactTime:v7 updatePixelBuffer:v4 waitUntilComplete:1];
}

- (void)_performSeekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  char v9 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
  if ([v9 isReadyForSeeking])
  {
    long long v27 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(PXGDisplayAssetVideoPresentationController *)self _videoSessionTimeConvertedFromTime:&v27];
    *(_OWORD *)&a3->var0 = v29;
    int64_t v10 = v30;
    a3->int64_t var3 = v30;
    long long v29 = *(_OWORD *)&a3->var0;
    int64_t v30 = v10;
    long long v27 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    long long v25 = *(_OWORD *)&a5->var0;
    int64_t v26 = a5->var3;
    [v9 seekToTime:&v29 toleranceBefore:&v27 toleranceAfter:&v25 completionHandler:0];
    long long v23 = *MEMORY[0x1E4F1F9F8];
    long long v12 = v23;
    int64_t v24 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    int64_t v11 = v24;
    [(PXGDisplayAssetVideoPresentationController *)self setPendingSeekTime:&v23];
    long long v21 = v12;
    int64_t v22 = v11;
    [(PXGDisplayAssetVideoPresentationController *)self setPendingSeekToleranceBefore:&v21];
    long long v19 = v12;
    int64_t v20 = v11;
    [(PXGDisplayAssetVideoPresentationController *)self setPendingSeekToleranceAfter:&v19];
    *(_OWORD *)&self->_desiredTime.value = v12;
    self->_desiredTime.epoch = v11;
  }
  else
  {
    long long v17 = *(_OWORD *)&a3->var0;
    int64_t v18 = a3->var3;
    [(PXGDisplayAssetVideoPresentationController *)self setPendingSeekTime:&v17];
    long long v15 = *(_OWORD *)&a4->var0;
    int64_t v16 = a4->var3;
    [(PXGDisplayAssetVideoPresentationController *)self setPendingSeekToleranceBefore:&v15];
    long long v13 = *(_OWORD *)&a5->var0;
    int64_t v14 = a5->var3;
    [(PXGDisplayAssetVideoPresentationController *)self setPendingSeekToleranceAfter:&v13];
  }
}

- (void)setDesiredTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_desiredTime.value = *(_OWORD *)&a3->var0;
  self->_desiredTime.epoch = var3;
  [(PXGDisplayAssetVideoPresentationController *)self signalChange:16];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
  [(PXGDisplayAssetVideoPresentationController *)self _performSeekToTime:&v12 toleranceBefore:&v11 toleranceAfter:&v10];
}

- (void)setDesiredTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  long long v5 = *MEMORY[0x1E4F1FA10];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  long long v3 = v5;
  uint64_t v4 = v6;
  [(PXGDisplayAssetVideoPresentationController *)self setDesiredTime:&v7 toleranceBefore:&v5 toleranceAfter:&v3];
}

- (void)seekToBeginning
{
  memset(&v9, 0, sizeof(v9));
  [(PXGDisplayAssetVideoPresentationController *)self beginningTime];
  [(PXGDisplayAssetVideoPresentationController *)self actualTime];
  CMTime time1 = v9;
  if (CMTimeCompare(&time1, &time2))
  {
    CMTime time1 = v9;
    long long v5 = *MEMORY[0x1E4F1FA48];
    uint64_t v6 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v3 = v5;
    uint64_t v4 = v6;
    [(PXGDisplayAssetVideoPresentationController *)self setDesiredTime:&time1 toleranceBefore:&v5 toleranceAfter:&v3];
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginningTime
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  CGSize result = [(PXGDisplayAssetVideoPresentationController *)self playbackStartTime];
  unsigned int var2 = retstr->var2;
  if ((var2 & 1) == 0)
  {
    CGSize result = [(PXGDisplayAssetVideoPresentationController *)self playbackTimeRange];
    *(_OWORD *)&retstr->var0 = v8;
    retstr->int64_t var3 = v9;
    unsigned int var2 = retstr->var2;
  }
  if ((var2 & 1) == 0)
  {
    uint64_t v7 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1FA48];
    retstr->int64_t var3 = *(void *)(v7 + 16);
  }
  return result;
}

- (void)setVolume:(float)a3 withFade:(BOOL)a4
{
  BOOL v4 = a4;
  [(PXGDisplayAssetVideoPresentationController *)self volume];
  if (*(float *)&v7 != a3)
  {
    *(float *)&double v7 = a3;
    [(PXGDisplayAssetVideoPresentationController *)self setVolume:v7];
    [(PXGDisplayAssetVideoPresentationController *)self setShouldFadeVolumeChange:v4];
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
}

- (void)setIsMixingAudioWithOthersEnabled:(BOOL)a3
{
  if (self->_isMixingAudioWithOthersEnabled != a3)
  {
    self->_isMixingAudioWithOthersEnabled = a3;
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
}

- (void)setIsDuckingOtherAudioEnabled:(BOOL)a3
{
  if (self->_isDuckingOtherAudioEnabled != a3)
  {
    self->_isDuckingOtherAudioEnabled = a3;
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
}

- (void)setAudioSessionCategory:(id)a3
{
  long long v5 = (NSString *)a3;
  if (self->_audioSessionCategory != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_audioSessionCategory, a3);
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
    long long v5 = v6;
  }
}

- (void)setDesiredPlaybackRate:(double)a3
{
  if (self->_desiredPlaybackRate != a3)
  {
    self->_desiredPlaybackRate = a3;
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
}

- (void)setIsCleanApertureCompensationEnabled:(BOOL)a3
{
  if (self->_isCleanApertureCompensationEnabled != a3)
  {
    self->_isCleanApertureCompensationEnabled = a3;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:2048];
  }
}

- (void)setIsCrossfadingFromStillToVideoEnabled:(BOOL)a3
{
  if (self->_isCrossfadingFromStillToVideoEnabled != a3)
  {
    self->_isCrossfadingFromStillToVideoEnabled = a3;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:256];
  }
}

- (void)setIsLoopingEnabled:(BOOL)a3
{
  if (self->_isLoopingEnabled != a3)
  {
    self->_isLoopingEnabled = a3;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:128];
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
}

- (void)setPlaybackTimeRange:(id *)a3
{
  p_playbackTimeRange = &self->_playbackTimeRange;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.epoch = v6;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
  long long v7 = *(_OWORD *)&self->_playbackTimeRange.start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_playbackTimeRange.start.value;
  *(_OWORD *)&v10.start.epoch = v7;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_playbackTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->var0.var0;
    long long v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_playbackTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_playbackTimeRange->duration.timescale = v9;
    *(_OWORD *)&p_playbackTimeRange->start.value = v8;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:64];
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
}

- (void)setResetsDesiredPlayStateOnHide:(BOOL)a3
{
  if (self->_resetsDesiredPlayStateOnHide != a3) {
    self->_resetsDesiredPlayStateOnHide = a3;
  }
}

- (void)setIsVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    if (!a3
      && [(PXGDisplayAssetVideoPresentationController *)self resetsDesiredPlayStateOnHide])
    {
      [(PXGDisplayAssetVideoPresentationController *)self setDesiredPlayState:0];
    }
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
}

- (void)setDesiredPlayState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_desiredPlayState != a3)
  {
    self->_int64_t desiredPlayState = a3;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:2];
    BOOL v4 = [(PXGDisplayAssetVideoPresentationController *)self log];
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        int v17 = 134217984;
        uint64_t v18 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXGDisplayAssetPresentationControllerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    long long v7 = v4;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        uint64_t v10 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        int64_t desiredPlayState = self->_desiredPlayState;
        int v17 = 134218240;
        uint64_t v18 = v10;
        __int16 v19 = 2048;
        int64_t v20 = desiredPlayState;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXGDisplayAssetPresentationControllerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = v7;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        int64_t v16 = self->_desiredPlayState;
        int v17 = 134218240;
        uint64_t v18 = v15;
        __int16 v19 = 2048;
        int64_t v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXGDisplayAssetPresentationControllerChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
}

- (void)setShouldDisableAutomaticPixelBufferUpdates:(BOOL)a3
{
  if (self->_shouldDisableAutomaticPixelBufferUpdates != a3)
  {
    self->_shouldDisableAutomaticPixelBufferUpdates = a3;
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
}

- (void)setShouldDisplayPreviousNonNullPixelBuffer:(BOOL)a3
{
  if (self->_shouldDisplayPreviousNonNullPixelBuffer != a3)
  {
    self->_shouldDisplayPreviousNonNullPixelBuffer = a3;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:8];
  }
}

- (void)_prerollCompletedSuccessfully:(BOOL)a3
{
  os_signpost_id_t v5 = [(PXGDisplayAssetVideoPresentationController *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PXGDisplayAssetVideoPresentationController__prerollCompletedSuccessfully___block_invoke;
  v6[3] = &unk_1E5DCFE98;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __76__PXGDisplayAssetVideoPresentationController__prerollCompletedSuccessfully___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PXGDisplayAssetVideoPresentationController__prerollCompletedSuccessfully___block_invoke_2;
  v3[3] = &__block_descriptor_33_e69_v16__0___PXGMutableDisplayAssetVideoPresentationController_Private__8l;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 performChanges:v3];
}

uint64_t __76__PXGDisplayAssetVideoPresentationController__prerollCompletedSuccessfully___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsReadyForImmediatePlayback:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_performPendingPrerollIfNeeded
{
  [(PXGDisplayAssetVideoPresentationController *)self pendingPrerollRate];
  if (v3 > 0.0)
  {
    -[PXGDisplayAssetVideoPresentationController _performPrerollAtRate:](self, "_performPrerollAtRate:");
  }
}

- (void)_performPrerollAtRate:(float)a3
{
  os_signpost_id_t v5 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
  os_signpost_id_t v6 = [v5 videoPlayer];

  [v6 rate];
  if (*(float *)&v7 == 0.0
    && [v6 status] == 1
    && ![(PXGDisplayAssetVideoPresentationController *)self isPendingSeekScheduled])
  {
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = __68__PXGDisplayAssetVideoPresentationController__performPrerollAtRate___block_invoke;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = &unk_1E5DCE660;
    objc_copyWeak(&v13, &location);
    *(float *)&double v8 = a3;
    [v6 prerollAtRate:&v9 completionHandler:v8];
    -[PXGDisplayAssetVideoPresentationController setPendingPrerollRate:](self, "setPendingPrerollRate:", 0.0, v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    *(float *)&double v7 = a3;
    [(PXGDisplayAssetVideoPresentationController *)self setPendingPrerollRate:v7];
  }
}

void __68__PXGDisplayAssetVideoPresentationController__performPrerollAtRate___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _prerollCompletedSuccessfully:a2];
}

- (void)prerollForImmediatePlaybackAtRate:(float)a3 withMediaProvider:(id)a4
{
  [(PXGDisplayAssetVideoPresentationController *)self _setupPixelBufferSourceIfNeededWithMediaProvider:a4];
  *(float *)&double v6 = a3;
  [(PXGDisplayAssetVideoPresentationController *)self _performPrerollAtRate:v6];
}

- (void)setVideoDuration:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 videoDuration = &self->_videoDuration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 videoDuration = self->_videoDuration;
  if (CMTimeCompare(&time1, (CMTime *)&videoDuration))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_videoDuration->epoch = a3->var3;
    *(_OWORD *)&p_videoDuration->value = v6;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:1024];
  }
}

- (void)setIsAtEnd:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_isAtEnd != a3)
  {
    self->_BOOL isAtEnd = a3;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:512];
    char v4 = [(PXGDisplayAssetVideoPresentationController *)self log];
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        int v17 = 134217984;
        uint64_t v18 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXGDisplayAssetPresentationControllerChangedIsAtEnd", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    double v7 = v4;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        uint64_t v10 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        BOOL isAtEnd = self->_isAtEnd;
        int v17 = 134218240;
        uint64_t v18 = v10;
        __int16 v19 = 2048;
        BOOL v20 = isAtEnd;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXGDisplayAssetPresentationControllerChangedIsAtEnd", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = v7;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        BOOL v16 = self->_isAtEnd;
        int v17 = 134218240;
        uint64_t v18 = v15;
        __int16 v19 = 2048;
        BOOL v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXGDisplayAssetPresentationControllerChangedIsAtEnd", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)setIsReadyForImmediatePlayback:(BOOL)a3
{
  if (self->_isReadyForImmediatePlayback != a3)
  {
    self->_isReadyForImmediatePlayback = a3;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:1];
  }
}

- (void)setActualPlayState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_actualPlayState != a3)
  {
    self->_int64_t actualPlayState = a3;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:4];
    char v4 = [(PXGDisplayAssetVideoPresentationController *)self log];
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        int v17 = 134217984;
        uint64_t v18 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXGDisplayAssetPresentationControllerChangedActualPlayState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    double v7 = v4;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        uint64_t v10 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        int64_t actualPlayState = self->_actualPlayState;
        int v17 = 134218240;
        uint64_t v18 = v10;
        __int16 v19 = 2048;
        int64_t v20 = actualPlayState;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXGDisplayAssetPresentationControllerChangedActualPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }

    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = v7;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        int64_t v16 = self->_actualPlayState;
        int v17 = 134218240;
        uint64_t v18 = v15;
        __int16 v19 = 2048;
        int64_t v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXGDisplayAssetPresentationControllerChangedActualPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)setActualTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 actualTime = &self->_actualTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 actualTime = self->_actualTime;
  if (CMTimeCompare(&time1, (CMTime *)&actualTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_actualTime->epoch = a3->var3;
    *(_OWORD *)&p_actualTime->value = v6;
    [(PXGDisplayAssetVideoPresentationController *)self signalChange:32];
  }
}

- (void)_updatePresentationControllerState
{
  float v3 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
  uint64_t v4 = [v3 playState];
  if ((unint64_t)(v4 - 1) > 4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1AB35CBE0[v4 - 1];
  }
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  if (v3) {
    [v3 currentTime];
  }
  long long v14 = v18;
  uint64_t v15 = v19;
  [(PXGDisplayAssetVideoPresentationController *)self _timeConvertedFromVideoSessionTime:&v14];
  long long v18 = v16;
  uint64_t v19 = v17;
  char v6 = [v3 isAtEnd];
  long long v16 = 0uLL;
  uint64_t v17 = 0;
  if (v3) {
    [v3 videoDuration];
  }
  double v7 = [(PXGDisplayAssetVideoPresentationController *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PXGDisplayAssetVideoPresentationController__updatePresentationControllerState__block_invoke;
  block[3] = &unk_1E5DCE638;
  block[4] = self;
  void block[5] = v5;
  long long v9 = v18;
  uint64_t v10 = v19;
  char v13 = v6;
  long long v11 = v16;
  uint64_t v12 = v17;
  dispatch_async(v7, block);
}

uint64_t __80__PXGDisplayAssetVideoPresentationController__updatePresentationControllerState__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__PXGDisplayAssetVideoPresentationController__updatePresentationControllerState__block_invoke_2;
  v3[3] = &__block_descriptor_89_e69_v16__0___PXGMutableDisplayAssetVideoPresentationController_Private__8l;
  v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  char v8 = *(unsigned char *)(a1 + 96);
  long long v6 = *(_OWORD *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 88);
  return [v1 performChanges:v3];
}

void __80__PXGDisplayAssetVideoPresentationController__updatePresentationControllerState__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setActualPlayState:v3];
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  [v4 setActualTime:&v7];
  [v4 setIsAtEnd:*(unsigned __int8 *)(a1 + 88)];
  long long v5 = *(_OWORD *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 80);
  [v4 setVideoDuration:&v5];
}

- (void)_updateVideoSession
{
  uint64_t v3 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];

  if (v3)
  {
    int64_t desiredPlayState = self->_desiredPlayState;
    BOOL v5 = [(PXGDisplayAssetVideoPresentationController *)self isVisible];
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v6 = desiredPlayState == 1 && v5;
    long long v17 = 0uLL;
    [(PXGDisplayAssetVideoPresentationController *)self playbackTimeRange];
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    [(PXGDisplayAssetVideoPresentationController *)self _videoSessionTimeRangeConvertedFromTimeRange:v16];
    long long v17 = v16[3];
    long long v18 = v16[4];
    long long v19 = v16[5];
    BOOL v7 = [(PXGDisplayAssetVideoPresentationController *)self isLoopingEnabled];
    if (BYTE12(v17))
    {
      BOOL v8 = 0;
      if ((BYTE4(v19) & 1) != 0 && !*((void *)&v19 + 1)) {
        BOOL v8 = v18 >= 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
    long long v9 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PXGDisplayAssetVideoPresentationController__updateVideoSession__block_invoke;
    v10[3] = &unk_1E5DCE5F0;
    v10[4] = self;
    v10[5] = v6;
    long long v11 = v17;
    long long v12 = v18;
    long long v13 = v19;
    BOOL v14 = v7;
    BOOL v15 = v8;
    [v9 performChanges:v10 withPresentationContext:0 presenter:self->_videoSessionPresenter];
  }
}

void __65__PXGDisplayAssetVideoPresentationController__updateVideoSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDesiredPlayState:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) desiredPlaybackRate];
  objc_msgSend(v3, "setDesiredPlaybackRate:");
  long long v4 = *(_OWORD *)(a1 + 64);
  v13[0] = *(_OWORD *)(a1 + 48);
  v13[1] = v4;
  v13[2] = *(_OWORD *)(a1 + 80);
  [v3 setPlaybackTimeRange:v13];
  if (!*(unsigned char *)(a1 + 96))
  {
    [v3 setSeekToBeginningAtEnd:0];
    BOOL v5 = v3;
    uint64_t v6 = 0;
LABEL_6:
    [v5 setLoopingEnabled:v6];
    goto LABEL_7;
  }
  if (!*(unsigned char *)(a1 + 97))
  {
    BOOL v5 = v3;
    uint64_t v6 = 1;
    goto LABEL_6;
  }
  [v3 setSeekToBeginningAtEnd:1];
LABEL_7:
  objc_msgSend(v3, "setShouldDisableAutomaticPixelBufferUpdates:", objc_msgSend(*(id *)(a1 + 32), "shouldDisableAutomaticPixelBufferUpdates"));
  [*(id *)(a1 + 32) volume];
  int v8 = v7;
  uint64_t v9 = [*(id *)(a1 + 32) shouldFadeVolumeChange];
  LODWORD(v10) = v8;
  [v3 setVolume:v9 withFade:v10];
  uint64_t v11 = [*(id *)(a1 + 32) isMixingAudioWithOthersEnabled];
  if ([*(id *)(a1 + 32) isDuckingOtherAudioEnabled] && *(void *)(a1 + 40) == 1) {
    v11 |= 2uLL;
  }
  long long v12 = [*(id *)(a1 + 32) audioSessionCategory];
  [v3 setAudioSessionCategory:v12 mode:*MEMORY[0x1E4F15050] routeSharingPolicy:0 options:v11];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXGDisplayAssetVideoPresentationController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXGDisplayAssetVideoPresentationController;
  [(PXGDisplayAssetVideoPresentationController *)&v6 performChanges:v4];
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_videoSessionTimeRangeConvertedFromTimeRange:(SEL)a3
{
  CGSize result = ($28FEB1B56BB3ED5175BFC6DE64DE503F *)[(PXGDisplayAssetVideoPresentationController *)self _timeConversionNeeded];
  if (result
    && (a4->var0.var2 & 1) != 0
    && (a4->var1.var2 & 1) != 0
    && !a4->var1.var3
    && (a4->var1.var0 & 0x8000000000000000) == 0)
  {
    memset(&v11, 0, sizeof(v11));
    CMTime start = (CMTime)a4->var0;
    [(PXGDisplayAssetVideoPresentationController *)self _videoSessionTimeConvertedFromTime:&start];
    CMTime start = v11;
    $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a4->var1;
    return ($28FEB1B56BB3ED5175BFC6DE64DE503F *)CMTimeRangeMake((CMTimeRange *)retstr, &start, (CMTime *)&var1);
  }
  else
  {
    long long v8 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&retstr->var0.int64_t var3 = v8;
    *(_OWORD *)&retstr->var1.$3CC8671D27C23BF42ADDB32F2B5E48AE var1 = *(_OWORD *)&a4->var1.var1;
  }
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_timeRangeConvertedFromVideoSessionTimeRange:(SEL)a3
{
  CGSize result = ($28FEB1B56BB3ED5175BFC6DE64DE503F *)[(PXGDisplayAssetVideoPresentationController *)self _timeConversionNeeded];
  if (result
    && (a4->var0.var2 & 1) != 0
    && (a4->var1.var2 & 1) != 0
    && !a4->var1.var3
    && (a4->var1.var0 & 0x8000000000000000) == 0)
  {
    memset(&v11, 0, sizeof(v11));
    CMTime start = (CMTime)a4->var0;
    [(PXGDisplayAssetVideoPresentationController *)self _timeConvertedFromVideoSessionTime:&start];
    CMTime start = v11;
    $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a4->var1;
    return ($28FEB1B56BB3ED5175BFC6DE64DE503F *)CMTimeRangeMake((CMTimeRange *)retstr, &start, (CMTime *)&var1);
  }
  else
  {
    long long v8 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&retstr->var0.int64_t var3 = v8;
    *(_OWORD *)&retstr->var1.$3CC8671D27C23BF42ADDB32F2B5E48AE var1 = *(_OWORD *)&a4->var1.var1;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoSessionTimeConvertedFromTime:(SEL)a3
{
  CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PXGDisplayAssetVideoPresentationController *)self _timeConversionNeeded];
  if (result)
  {
    long long v8 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
    uint64_t v9 = v8;
    if (v8) {
      [v8 segmentTimeRangeOfOriginalVideo];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    CMTime time = (CMTime)*a4;
    int v10 = CMTimeRangeContainsTime(&range, &time);

    CMTime v11 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
    long long v12 = v11;
    if (v10)
    {
      if (v11) {
        [v11 segmentTimeRangeOfOriginalVideo];
      }
      else {
        memset(&v15, 0, sizeof(v15));
      }
      CMTime rhs = v15;
      CMTime time = (CMTime)*a4;
      CMTimeSubtract((CMTime *)retstr, &time, &rhs);
    }
    else
    {
      if (v11)
      {
        [v11 segmentTimeRangeOfOriginalVideo];
      }
      else
      {
        int64_t v14 = 0;
        long long v13 = 0u;
      }
      *(_OWORD *)&retstr->var0 = v13;
      retstr->int64_t var3 = v14;
    }
  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    retstr->int64_t var3 = a4->var3;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeConvertedFromVideoSessionTime:(SEL)a3
{
  CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PXGDisplayAssetVideoPresentationController *)self _timeConversionNeeded];
  if (result)
  {
    long long v8 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 segmentTimeRangeOfOriginalVideo];
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v11 = 0u;
    }
    *(_OWORD *)&lhs.value = v11;
    lhs.epoch = v12;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
    CMTimeAdd((CMTime *)retstr, &lhs, (CMTime *)&v10);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    retstr->int64_t var3 = a4->var3;
  }
  return result;
}

- (BOOL)_timeConversionNeeded
{
  v2 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
  char v3 = [v2 isSegmentOfOriginalVideo];

  return v3;
}

- (void)_setupPixelBufferSourceIfNeededWithMediaProvider:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PXGDisplayAssetVideoPresentationController *)self pixelBufferSource];

  if (!v5)
  {
    [(PXGDisplayAssetVideoPresentationController *)self _setupVideoSessionIfNeededWithMediaProvider:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v6 = [(PXGDisplayAssetVideoPresentationController *)self options];
    int v7 = [v6 strategies];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      uint64_t v11 = 4;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v13 quality] < v11) {
            uint64_t v11 = [v13 quality];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [(PXGDisplayAssetVideoPresentationController *)self targetSize];
    PXSizeIsEmpty();
  }
}

- (void)_setupVideoSessionIfNeededWithMediaProvider:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
  objc_super v6 = [v5 contentProvider];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 mediaProvider];
    BOOL v8 = v7 == v4;

    if (!v4) {
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!v4) {
      goto LABEL_20;
    }
  }
  if (!v8)
  {
    uint64_t v9 = [(PXGDisplayAssetVideoPresentationController *)self videoSessionManager];
    uint64_t v10 = [(PXGDisplayAssetVideoPresentationController *)self displayAsset];
    uint64_t v11 = [(PXGDisplayAssetVideoPresentationController *)self options];
    long long v12 = [v9 videoSessionForAsset:v10 withOptions:v11 mediaProvider:v4];

    long long v13 = [(PXGDisplayAssetVideoPresentationController *)self log];
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        uint64_t v16 = [(PXGDisplayAssetVideoPresentationController *)self logContext];
        uint64_t v17 = [v12 logContext];
        long long v18 = [(PXGDisplayAssetVideoPresentationController *)self displayAsset];
        uint64_t v19 = [v18 uuid];
        *(_DWORD *)CMTime buf = 134218498;
        uint64_t v34 = v16;
        __int16 v35 = 2050;
        uint64_t v36 = v17;
        __int16 v37 = 2114;
        v38 = v19;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_EVENT, v15, "PXGDisplayAssetVideoPresentationControllerCreatedVideoSession", "Context=%{signpost.telemetry:string2}lu videoSession=%{public}llu, asset.uuid=%{public}@", buf, 0x20u);
      }
    }

    [v12 registerChangeObserver:self context:VideoSessionObservationContext];
    objc_msgSend(v12, "loadIfNeededWithPriority:", -[PXGDisplayAssetVideoPresentationController loadingPriority](self, "loadingPriority"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    int64_t v20 = [(PXGDisplayAssetVideoPresentationController *)self timeObserversByTime];
    uint64_t v21 = (void *)[v20 copy];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          int64_t v26 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (v26) {
            [v26 CMTimeValue];
          }
          else {
            memset(v27, 0, sizeof(v27));
          }
          [(PXGDisplayAssetVideoPresentationController *)self startObservingBoundaryTime:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v23);
    }

    [(PXGDisplayAssetVideoPresentationController *)self setVideoSession:v12];
    [(PXGDisplayAssetVideoPresentationController *)self _invalidateVideoSession];
  }
LABEL_20:
}

- (void)recyclePixelBufferSource
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(PXGDisplayAssetVideoPresentationController *)self setPixelBufferSource:0];
  [(PXGDisplayAssetVideoPresentationController *)self setPixelBufferSourceCounter:[(PXGDisplayAssetVideoPresentationController *)self pixelBufferSourceCounter] - 1];
  if ([(PXGDisplayAssetVideoPresentationController *)self pixelBufferSourceCounter] <= 0)
  {
    uint64_t v19 = [(PXGDisplayAssetVideoPresentationController *)self videoSession];
    [v19 unregisterChangeObserver:self context:VideoSessionObservationContext];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    char v3 = [(PXGDisplayAssetVideoPresentationController *)self timeObserversByTime];
    id v4 = (void *)[v3 copy];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v10 = [(PXGDisplayAssetVideoPresentationController *)self timeObserversByTime];
          uint64_t v11 = [v10 objectForKeyedSubscript:v9];

          long long v12 = [MEMORY[0x1E4F1CA98] null];
          char v13 = [v11 isEqual:v12];

          if ((v13 & 1) == 0)
          {
            os_signpost_id_t v14 = [v19 videoPlayer];
            [v14 removeTimeObserver:v11];

            os_signpost_id_t v15 = [MEMORY[0x1E4F1CA98] null];
            uint64_t v16 = [(PXGDisplayAssetVideoPresentationController *)self timeObserversByTime];
            [v16 setObject:v15 forKeyedSubscript:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    uint64_t v17 = [v19 videoPlayer];
    [v17 cancelPendingPrerolls];

    if (v19)
    {
      long long v18 = [(PXGDisplayAssetVideoPresentationController *)self videoSessionManager];
      [v18 checkInVideoSession:v19];

      [(PXGDisplayAssetVideoPresentationController *)self setVideoSession:0];
    }
  }
}

- (id)pixelBufferSourceWithMediaProvider:(id)a3
{
  [(PXGDisplayAssetVideoPresentationController *)self _setupPixelBufferSourceIfNeededWithMediaProvider:a3];
  [(PXGDisplayAssetVideoPresentationController *)self setPixelBufferSourceCounter:[(PXGDisplayAssetVideoPresentationController *)self pixelBufferSourceCounter] + 1];
  return [(PXGDisplayAssetVideoPresentationController *)self pixelBufferSource];
}

- (id)videoSessionWithMediaProvider:(id)a3
{
  [(PXGDisplayAssetVideoPresentationController *)self _setupVideoSessionIfNeededWithMediaProvider:a3];
  return [(PXGDisplayAssetVideoPresentationController *)self videoSession];
}

- (NSString)description
{
  char v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PXGDisplayAssetVideoPresentationController *)self displayAsset];
  uint64_t v7 = [v6 uuid];
  BOOL v8 = [v3 stringWithFormat:@"<%@: %p asset:%@>", v5, self, v7];

  return (NSString *)v8;
}

- (void)dealloc
{
  [(PXVideoSessionManager *)self->_videoSessionManager checkInVideoSession:self->_videoSession];
  v3.receiver = self;
  v3.super_class = (Class)PXGDisplayAssetVideoPresentationController;
  [(PXGDisplayAssetVideoPresentationController *)&v3 dealloc];
}

- (PXGDisplayAssetVideoPresentationController)initWithDisplayAsset:(id)a3 accessQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
  uint64_t v9 = +[PXVideoSessionManager sharedInstance];
  uint64_t v10 = [(PXGDisplayAssetVideoPresentationController *)self initWithDisplayAsset:v7 accessQueue:v6 videoSessionManager:v9 options:v8 loadingPriority:0];

  return v10;
}

- (PXGDisplayAssetVideoPresentationController)initWithDisplayAsset:(id)a3 accessQueue:(id)a4 videoSessionManager:(id)a5 options:(id)a6 loadingPriority:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PXGDisplayAssetVideoPresentationController;
  uint64_t v17 = [(PXGDisplayAssetVideoPresentationController *)&v33 init];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayAsset, a3);
    if (v14)
    {
      uint64_t v19 = (OS_dispatch_queue *)v14;
      accessQueue = v18->_accessQueue;
      v18->_accessQueue = v19;
    }
    else
    {
      long long v21 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v22 = MEMORY[0x1E4F14428];
      accessQueue = v18->_accessQueue;
      v18->_accessQueue = v21;
    }

    objc_storeStrong((id *)&v18->_videoSessionManager, a5);
    objc_storeStrong((id *)&v18->_options, a6);
    v18->_videoSessionPresenter = &v18->_videoSessionPresenter;
    long long v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    timeObserversByTime = v18->_timeObserversByTime;
    v18->_timeObserversByTime = v23;

    uint64_t v25 = MEMORY[0x1E4F1F9F8];
    long long v32 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v18->_desiredTime.value = *MEMORY[0x1E4F1F9F8];
    int64_t v26 = *(void *)(v25 + 16);
    v18->_desiredTime.epoch = v26;
    objc_storeStrong((id *)&v18->_audioSessionCategory, (id)*MEMORY[0x1E4F14F68]);
    uint64_t v27 = MEMORY[0x1E4F1FA20];
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&v18->_playbackTimeRange.start.value = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&v18->_playbackTimeRange.start.epoch = v28;
    *(_OWORD *)&v18->_playbackTimeRange.duration.timescale = *(_OWORD *)(v27 + 32);
    *(_OWORD *)&v18->_playbackStartTime.value = v32;
    v18->_playbackStartTime.epoch = v26;
    v18->_loadingPriority = a7;
    v18->_isVisible = 1;
    uint64_t v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p", v18);
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v29;

    v18->_desiredPlaybackRate = 1.0;
  }

  return v18;
}

- (PXGDisplayAssetVideoPresentationController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGDisplayAssetVideoPresentationController.m", 51, @"%s is not available as initializer", "-[PXGDisplayAssetVideoPresentationController init]");

  abort();
}

@end