@interface PXVideoSession
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)segmentTimeRangeOfOriginalVideo;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration;
- (AVPlayerItem)playerItem;
- (AVPlayerItemVideoOutput)videoOutput;
- (BOOL)_isOnUpdateQueue;
- (BOOL)_request4k60StreamAllowance;
- (BOOL)allowsExternalPlayback;
- (BOOL)isAtBeginning;
- (BOOL)isAtEnd;
- (BOOL)isBuffering;
- (BOOL)isExpectingVideoView;
- (BOOL)isLoopingEnabled;
- (BOOL)isPlayable;
- (BOOL)isPlayerTimeAdvancing;
- (BOOL)isReadyForSeeking;
- (BOOL)isSegmentOfOriginalVideo;
- (BOOL)isStalled;
- (BOOL)isUpdatingAudioSession;
- (BOOL)isVideoOutputReady;
- (BOOL)preventsSleepDuringVideoPlayback;
- (BOOL)seekToBeginningAtEnd;
- (BOOL)shouldDisableAutomaticPixelBufferUpdates;
- (CGAffineTransform)preferredTransform;
- (CGImage)generateSnapshotImage;
- (CGSize)naturalSize;
- (CGSize)videoOutputSize;
- (NSError)error;
- (NSString)audioSessionCategory;
- (NSString)audioSessionMode;
- (NSString)debugDetailedDescription;
- (NSString)description;
- (NSString)statusDescription;
- (PFSlowMotionTimeRangeMapper)timeRangeMapper;
- (PXPhotosensitivityProcessing)photoSensitivityProcessing;
- (PXVideoContentProvider)contentProvider;
- (PXVideoSession)init;
- (PXVideoSession)initWithContentProvider:(id)a3 videoPlayer:(id)a4 resourceReclamationController:(id)a5;
- (PXVideoSession)initWithContentProvider:(id)a3 videoPlayer:(id)a4 resourceReclamationController:(id)a5 playerCreationDelay:(double)a6;
- (PXVideoSessionDelegate)delegate;
- (__CVBuffer)currentPixelBuffer;
- (double)desiredPlaybackRate;
- (float)nominalFrameRate;
- (float)volume;
- (id)_disconnectVideoPlayer;
- (id)_newVideoView;
- (id)_playbackStateDescription;
- (id)_stateQueue_newPresentationStateFromCurrentWithPresenter:(void *)a3;
- (id)audioSession;
- (id)currentPlayerItem;
- (id)dequeueVideoView;
- (id)performFinalCleanup;
- (id)pixelBufferOutputSizes;
- (id)playbackTimeRangeEndBoundaryObserver;
- (id)videoPlayer;
- (int64_t)audioStatus;
- (int64_t)desiredPlayState;
- (int64_t)pixelBufferFrameDropsCount;
- (int64_t)playState;
- (unint64_t)audioSessionCategoryOptions;
- (unint64_t)audioSessionRouteSharingPolicy;
- (unint64_t)pixelBufferOutputTokenCount;
- (void)_addOutput:(id)a3 toPlayerItem:(id)a4;
- (void)_assertOnUpdateQueue;
- (void)_audioSessionQueue_initializeAudioSession;
- (void)_audioSessionQueue_updateAudioSessionWithCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6;
- (void)_avPlayerTimeDidChange:(id *)a3;
- (void)_didFinishInitializingAudioSession;
- (void)_handleAssetTracksDidLoadForAsset:(id)a3;
- (void)_handleContentLoadingResult:(id)a3;
- (void)_handleDidReachPlaybackTimeRangeEnd;
- (void)_handleDisplayLink:(id)a3;
- (void)_handlePlayabilityDidLoadForAsset:(id)a3;
- (void)_handlePlayerItemSeekDidFinish;
- (void)_handlePlayerTimeAdvancementTimer:(id)a3;
- (void)_handleTrackGeometryDidLoad;
- (void)_loadAssetTracksIfNeeded;
- (void)_mainQueue_actuallyPrewarmVideoView;
- (void)_mainQueue_setDisplayLink:(id)a3;
- (void)_mainQueue_setDisplayLinkPaused:(BOOL)a3;
- (void)_mainQueue_updateCurrentPixelBufferWithVideoOutput:(id)a3;
- (void)_performBlockOnUpdateQueue:(id)a3;
- (void)_performChanges:(id)a3;
- (void)_rebuildAVObjects;
- (void)_relinquishAny4k60StreamAllowance;
- (void)_removeAllVideoOutputs;
- (void)_setPlayabilityFromAsset:(id)a3;
- (void)_updateAVPlayerPlayState;
- (void)_updateAtBeginningOrEnd;
- (void)_updateAtBeginningOrEndWithPlayerItemDuration:(id *)a3 success:(BOOL)a4 error:(id)a5;
- (void)_updateAudioStatus;
- (void)_updateBuffering;
- (void)_updateCurrenPixelBufferAfterSeekingToTime:(id *)a3 completionLock:(id)a4;
- (void)_updateCurrentPixelBuffer;
- (void)_updateCurrentPlayerItem;
- (void)_updateDisplayLinkState;
- (void)_updateDuration;
- (void)_updateFromCurrentPresentationState;
- (void)_updatePlayState;
- (void)_updatePlayability;
- (void)_updatePlayerItem;
- (void)_updatePlayerItemInPlayer;
- (void)_updatePlayerVolume;
- (void)_updateQueue_decrementPendingPlayerItemSeekCount;
- (void)_updateQueue_registerChangeObserver:(id)a3 context:(void *)a4;
- (void)_updateQueue_seekToPlaybackTimeRangeStartIfNeeded;
- (void)_updateQueue_unregisterChangeObserver:(id)a3 context:(void *)a4;
- (void)_updateReadyForSeeking;
- (void)_updateStalled;
- (void)_updateTrackGeometry;
- (void)_updateVideoOutput;
- (void)_updateVolumeAnimator;
- (void)_videoQueue_updateTrackGeometryWithPlayerItem:(id)a3;
- (void)_videoWorkQueue_updateCurrenPixelBufferAfterSeekingToTime:(id *)a3 completionLock:(id)a4;
- (void)_videoWorkQueue_updateCurrentPixelBufferWithVideoOutput:(id)a3 outputTime:(double)a4;
- (void)avPlayer:(id)a3 itemDidPlayToEnd:(id)a4;
- (void)cancelLoading;
- (void)cancelPixelBufferOutputWithRequestIdentifier:(id)a3;
- (void)dealloc;
- (void)didPerformChanges;
- (void)enterPresentationContext:(int64_t)a3 presenter:(void *)a4;
- (void)incrementPixelBufferFrameDropsCount;
- (void)leavePresentationContext:(int64_t)a3 presenter:(void *)a4;
- (void)loadIfNeededWithPriority:(int64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)outputMediaDataWillChange:(id)a3;
- (void)performChanges:(id)a3;
- (void)performChanges:(id)a3 withPresentationContext:(int64_t)a4 presenter:(void *)a5;
- (void)prewarmVideoView;
- (void)recycleVideoView:(id)a3;
- (void)registerChangeObserver:(id)a3 context:(void *)a4;
- (void)requestPixelBufferOutputWithRequestIdentifier:(id)a3 maxOutputSize:(CGSize)a4;
- (void)resourceReclamationEventDidOccur:(id)a3;
- (void)seekToExactTime:(id *)a3 updatePixelBuffer:(BOOL)a4 waitUntilComplete:(BOOL)a5;
- (void)seekToPlaybackStartTime;
- (void)seekToTime:(id *)a3 completionHandler:(id)a4;
- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6;
- (void)setAllowsExternalPlayback:(BOOL)a3;
- (void)setAtBeginning:(BOOL)a3;
- (void)setAtEnd:(BOOL)a3;
- (void)setAudioSession:(id)a3;
- (void)setAudioSessionCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6;
- (void)setAudioStatus:(int64_t)a3;
- (void)setBuffering:(BOOL)a3;
- (void)setCurrentPixelBuffer:(__CVBuffer *)a3;
- (void)setCurrentPlayerItem:(id)a3;
- (void)setCurrentTime:(id *)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setDesiredPlaybackRate:(double)a3;
- (void)setIsReadyForSeeking:(BOOL)a3;
- (void)setIsVideoOutputReady:(BOOL)a3;
- (void)setLoopingEnabled:(BOOL)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setNominalFrameRate:(float)a3;
- (void)setPlayState:(int64_t)a3;
- (void)setPlayable:(BOOL)a3;
- (void)setPlaybackStartTime:(id *)a3;
- (void)setPlaybackTimeRange:(id *)a3;
- (void)setPlaybackTimeRangeEndBoundaryObserver:(id)a3;
- (void)setPlayerItem:(id)a3 segmentTimeRangeOfOriginalVideo:(id *)a4 timeRangeMapper:(id)a5;
- (void)setPlayerTimeAdvancing:(BOOL)a3;
- (void)setPreferredTransform:(CGAffineTransform *)a3;
- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3;
- (void)setSeekToBeginningAtEnd:(BOOL)a3;
- (void)setShouldDisableAutomaticPixelBufferUpdates:(BOOL)a3;
- (void)setStalled:(BOOL)a3;
- (void)setUpdatingAudioSession:(BOOL)a3;
- (void)setVideoDuration:(id *)a3;
- (void)setVideoOutput:(id)a3 size:(CGSize)a4;
- (void)setVideoPlayer:(id)a3;
- (void)setVolume:(float)a3 withFade:(BOOL)a4;
- (void)unregisterChangeObserver:(id)a3 context:(void *)a4;
- (void)wrappedAudioSession:(id)a3 didChangeVolumeFrom:(float)a4 to:(float)a5;
@end

@implementation PXVideoSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoSensitivityProcessing, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainQueue_displayLink, 0);
  objc_storeStrong((id *)&self->_mainQueue_volumeAnimator, 0);
  objc_storeStrong((id *)&self->_playbackReporter, 0);
  objc_storeStrong((id *)&self->_stateQueue_audioSession, 0);
  objc_storeStrong(&self->_stateQueue_playerTimeObservationToken, 0);
  objc_storeStrong((id *)&self->_stateQueue_videoPlayer, 0);
  objc_storeStrong((id *)&self->_stateQueue_videoOutputReadyLock, 0);
  objc_storeStrong((id *)&self->_stateQueue_readyForSeekingLock, 0);
  objc_storeStrong((id *)&self->_stateQueue_isPlayableLock, 0);
  objc_storeStrong((id *)&self->_stateQueue_timeRangeMapper, 0);
  objc_storeStrong((id *)&self->_stateQueue_playerItem, 0);
  objc_storeStrong((id *)&self->_stateQueue_currentPlayerItem, 0);
  objc_storeStrong((id *)&self->_stateQueue_videoOutput, 0);
  objc_storeStrong((id *)&self->_stateQueue_audioSessionMode, 0);
  objc_storeStrong((id *)&self->_stateQueue_audioSessionCategory, 0);
  objc_storeStrong(&self->_stateQueue_playbackTimeRangeEndBoundaryObserver, 0);
  objc_storeStrong((id *)&self->_stateQueue_pixelBufferPausedOutputTokens, 0);
  objc_storeStrong((id *)&self->_stateQueue_pixelBufferOutputSizesByTokens, 0);
  objc_storeStrong((id *)&self->_stateQueue_pixelBufferOutputTokens, 0);
  objc_storeStrong((id *)&self->_stateQueue_presentationStatesByContext, 0);
  objc_storeStrong((id *)&self->_mainQueue_videoViewQueue, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_videoWorkQueue, 0);
  objc_storeStrong((id *)&self->_audioSessionQueue, 0);
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_playerTimeAdvancementTimer, 0);
}

- (PXPhotosensitivityProcessing)photoSensitivityProcessing
{
  return self->_photoSensitivityProcessing;
}

- (BOOL)isExpectingVideoView
{
  return self->_isExpectingVideoView;
}

- (BOOL)isUpdatingAudioSession
{
  return self->_isUpdatingAudioSession;
}

- (BOOL)allowsExternalPlayback
{
  return self->_allowsExternalPlayback;
}

- (NSError)error
{
  return self->_error;
}

- (void)setCurrentTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_currentTime.value = *(_OWORD *)&a3->var0;
  self->_currentTime.epoch = var3;
}

- (PXVideoContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setDelegate:(id)a3
{
}

- (PXVideoSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXVideoSessionDelegate *)WeakRetained;
}

- (void)_performBlockOnUpdateQueue:(id)a3
{
  block = (void (**)(void))a3;
  if ([(PXVideoSession *)self _isOnUpdateQueue]) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)self->_updateQueue, block);
  }
}

- (void)_assertOnUpdateQueue
{
  if (![(PXVideoSession *)self _isOnUpdateQueue])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoSession.m", 2696, @"Expected %s to be called on the update queue", "-[PXVideoSession _assertOnUpdateQueue]");
  }
}

- (BOOL)_isOnUpdateQueue
{
  return dispatch_get_specific((const void *)QueueIdentifierContext) == self->_updateQueueIdentifier;
}

- (NSString)statusDescription
{
  v2 = [(PXVideoSession *)self contentProvider];
  v3 = [v2 loadingResult];
  id v4 = [v3 resultDebugDescription];
  v5 = v4;
  if (!v4) {
    id v4 = @"Video Not Loaded";
  }
  v6 = v4;

  return v6;
}

- (NSString)debugDetailedDescription
{
  v3 = [(PXVideoSession *)self description];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(PXVideoSession *)self videoPlayer];
  [v4 appendFormat:@"\n\tAVPlayer: %@", v5];

  uint64_t v6 = [(PXVideoSession *)self playerItem];
  v7 = (void *)v6;
  if (v6)
  {
    [v4 appendFormat:@"\n\tPlayer Item: %@", v6];
    objc_msgSend(v4, "appendFormat:", @"\n\t\tisPlaybackBufferEmpty: %i", objc_msgSend(v7, "isPlaybackBufferEmpty"));
    objc_msgSend(v4, "appendFormat:", @"\n\t\tisPlaybackBufferFull: %i", objc_msgSend(v7, "isPlaybackBufferFull"));
    objc_msgSend(v4, "appendFormat:", @"\n\t\tisPlaybackLikelyToKeepUp: %i", objc_msgSend(v7, "isPlaybackLikelyToKeepUp"));
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", @"\n\tPlayer Item: None", v9);
  }

  return (NSString *)v4;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(PXVideoSession *)self contentProvider];
  [v3 appendFormat:@"Content Provider: %@\n", v4];

  int64_t v5 = [(PXVideoSession *)self desiredPlayState];
  uint64_t v6 = @"Playing";
  if (v5 != 1) {
    uint64_t v6 = 0;
  }
  if (!v5) {
    uint64_t v6 = @"Paused";
  }
  [v3 appendFormat:@"Desired Play State: %@\n", v6];
  unint64_t v7 = [(PXVideoSession *)self playState];
  v8 = 0;
  if (v7 <= 5) {
    v8 = off_1E5DCCEF0[v7];
  }
  [v3 appendFormat:@"Play State: %@\n", v8];
  objc_msgSend(v3, "appendFormat:", @"Stalled: %i\n", -[PXVideoSession isStalled](self, "isStalled"));
  objc_msgSend(v3, "appendFormat:", @"At Beginning: %i End: %i\n", -[PXVideoSession isAtBeginning](self, "isAtBeginning"), -[PXVideoSession isAtEnd](self, "isAtEnd"));
  uint64_t v9 = [(PXVideoSession *)self _playbackStateDescription];
  [v3 appendFormat:@"Playback: %@\n", v9];

  v10 = [(PXVideoSession *)self videoOutput];
  [v3 appendFormat:@"VideoOutput: %@\n", v10];

  if (self->_stateQueue_obtainedFirstPixelBuffer) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = v11;
  [v3 appendFormat:@"Got First Pixel Buffer: %@\n", v12];

  objc_msgSend(v3, "appendFormat:", @"Pixel Buffer Frame Drops: %ld", -[PXVideoSession pixelBufferFrameDropsCount](self, "pixelBufferFrameDropsCount"));
  objc_msgSend(v3, "appendFormat:", @"\tBuffering: %i\n", -[PXVideoSession isBuffering](self, "isBuffering"));
  v13 = NSString;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = objc_msgSend(v3, "px_stringByIndentingNewLines");
  v17 = [v13 stringWithFormat:@"<%@ %p> {\n\t%@}", v15, self, v16];

  return (NSString *)v17;
}

- (void)_handleAssetTracksDidLoadForAsset:(id)a3
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:a3];
    int64_t v5 = [v4 firstObject];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__PXVideoSession__handleAssetTracksDidLoadForAsset___block_invoke;
    v7[3] = &unk_1E5DD0328;
    id v8 = v5;
    uint64_t v9 = self;
    id v6 = v5;
    [(PXVideoSession *)self _performChanges:v7];
  }
}

void __52__PXVideoSession__handleAssetTracksDidLoadForAsset___block_invoke(uint64_t a1, void *a2)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) statusOfValueForKey:@"preferredTransform" error:0] == 2
    && [*(id *)(a1 + 32) statusOfValueForKey:@"naturalSize" error:0] == 2
    && [*(id *)(a1 + 32) statusOfValueForKey:@"nominalFrameRate" error:0] == 2)
  {
    if (*(unsigned char *)(*(void *)(a1 + 40) + 696) && (*(unsigned char *)(*(void *)(a1 + 40) + 688) & 0x10) != 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PXVideoSession _handleAssetTracksDidLoadForAsset:]_block_invoke"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXVideoSession.m", 2645, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    *(void *)(*(void *)(a1 + 40) + 680) |= 0x10uLL;
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v4 = *(void **)(a1 + 32);
    v11[0] = @"preferredTransform";
    v11[1] = @"naturalSize";
    v11[2] = @"nominalFrameRate";
    int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__PXVideoSession__handleAssetTracksDidLoadForAsset___block_invoke_2;
    v8[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v9, &location);
    [v4 loadValuesAsynchronouslyForKeys:v5 completionHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __52__PXVideoSession__handleAssetTracksDidLoadForAsset___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTrackGeometryDidLoad];
}

- (void)_loadAssetTracksIfNeeded
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXVideoSession *)self playerItem];
  id v4 = [v3 asset];

  if (v4)
  {
    if ([v4 statusOfValueForKey:@"tracks" error:0] == 2)
    {
      [(PXVideoSession *)self _handleAssetTracksDidLoadForAsset:v4];
    }
    else
    {
      objc_initWeak(&location, v4);
      objc_initWeak(&from, self);
      v11[0] = @"tracks";
      int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __42__PXVideoSession__loadAssetTracksIfNeeded__block_invoke;
      v6[3] = &unk_1E5DD0838;
      objc_copyWeak(&v7, &from);
      objc_copyWeak(&v8, &location);
      [v4 loadValuesAsynchronouslyForKeys:v5 completionHandler:v6];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

void __42__PXVideoSession__loadAssetTracksIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAssetTracksDidLoadForAsset:v2];
}

- (id)_playbackStateDescription
{
  int64_t v3 = [(PXVideoSession *)self desiredPlayState];
  unint64_t v4 = [(PXVideoSession *)self playState];
  if (v4 > 5) {
    v26 = 0;
  }
  else {
    v26 = off_1E5DCCEA8[v4];
  }
  int64_t v5 = [(PXVideoSession *)self videoPlayer];
  unint64_t v6 = [v5 status];
  if (v6 > 2) {
    v25 = 0;
  }
  else {
    v25 = off_1E5DCCED8[v6];
  }
  BOOL v27 = [(PXVideoSession *)self isBuffering];
  BOOL v7 = [(PXVideoSession *)self isPlayerTimeAdvancing];
  BOOL v8 = [(PXVideoSession *)self isStalled];
  memset(&v30, 0, sizeof(v30));
  id v9 = [(PXVideoSession *)self videoPlayer];
  v10 = v9;
  if (v9) {
    [v9 currentTime];
  }
  else {
    memset(&v30, 0, sizeof(v30));
  }

  memset(&v29, 0, sizeof(v29));
  v11 = [(PXVideoSession *)self videoPlayer];
  v12 = v11;
  if (v11) {
    [v11 currentItemDuration];
  }
  else {
    memset(&v29, 0, sizeof(v29));
  }
  v13 = @"▶︎";
  if (v3 != 1) {
    v13 = 0;
  }
  if (v3) {
    v14 = v13;
  }
  else {
    v14 = @"‖";
  }

  unsigned int v15 = [v5 currentItemIsLikelyToKeepUp];
  unsigned int v16 = [v5 currentItemPlaybackBufferFull];
  unsigned int v17 = [v5 currentItemPlaybackBufferEmpty];
  [v5 rate];
  v18 = NSString;
  double v20 = v19;
  CMTime v28 = v30;
  v21 = __43__PXVideoSession__playbackStateDescription__block_invoke(&v28);
  CMTime v28 = v29;
  v22 = __43__PXVideoSession__playbackStateDescription__block_invoke(&v28);
  v23 = [v18 stringWithFormat:@"%@ %@ %@ b%i a%i s%i l%i f%i e%i r%.1f %@/%@", v14, v26, v25, v27, v7, v8, v15, v16, v17, *(void *)&v20, v21, v22];

  return v23;
}

__CFString *__43__PXVideoSession__playbackStateDescription__block_invoke(CMTime *a1)
{
  if ((a1->flags & 0x1D) == 1)
  {
    CMTime time = *a1;
    objc_msgSend(NSString, "stringWithFormat:", @"%0.3f", CMTimeGetSeconds(&time));
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = @"?";
  }
  return v1;
}

- (void)_handleDidReachPlaybackTimeRangeEnd
{
}

- (void)_updateQueue_decrementPendingPlayerItemSeekCount
{
}

- (void)_handlePlayerItemSeekDidFinish
{
  objc_initWeak(&location, self);
  updateQueue = self->_updateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PXVideoSession__handlePlayerItemSeekDidFinish__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(updateQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__PXVideoSession__handlePlayerItemSeekDidFinish__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateQueue_decrementPendingPlayerItemSeekCount");
}

- (void)_updateQueue_seekToPlaybackTimeRangeStartIfNeeded
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  int64_t v3 = [(PXVideoSession *)self playerItem];
  if (v3 && ([(PXVideoSession *)self playState] != 3 || [(PXVideoSession *)self isAtEnd]))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    [(PXVideoSession *)self playbackTimeRange];
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    [(PXVideoSession *)self playbackStartTime];
    memset(&v13, 0, sizeof(v13));
    unint64_t v4 = (CMTime *)MEMORY[0x1E4F1FA48];
    CMTime v13 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    ++self->_updateQueue_pendingPlayerItemSeekCount;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__PXVideoSession__updateQueue_seekToPlaybackTimeRangeStartIfNeeded__block_invoke;
    v7[3] = &unk_1E5DCCE88;
    v8[1] = *(id *)&Current;
    CMTime v9 = v13;
    objc_copyWeak(v8, &location);
    range.start = v13;
    CMTime time = *v4;
    CMTime v6 = time;
    [v3 seekToTime:&range toleranceBefore:&time toleranceAfter:&v6 completionHandler:v7];
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

void __67__PXVideoSession__updateQueue_seekToPlaybackTimeRangeStartIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = *(double *)(a1 + 40);
  unint64_t v4 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CMTime v7 = *(CMTime *)(a1 + 48);
    Float64 Seconds = CMTimeGetSeconds(&v7);
    LODWORD(v7.value) = 134218240;
    *(Float64 *)((char *)&v7.value + 4) = Seconds;
    LOWORD(v7.flags) = 2048;
    *(double *)((char *)&v7.flags + 2) = Current - v3;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Seeked to start time %.2f in %f seconds", (uint8_t *)&v7, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePlayerItemSeekDidFinish];
}

- (void)_removeAllVideoOutputs
{
  [(PXVideoSession *)self _relinquishAny4k60StreamAllowance];
  double v3 = [(PXVideoSession *)self playerItem];
  videoWorkQueue = self->_videoWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PXVideoSession__removeAllVideoOutputs__block_invoke;
  block[3] = &unk_1E5DD36F8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(videoWorkQueue, block);
}

void __40__PXVideoSession__removeAllVideoOutputs__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) outputs];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__PXVideoSession__removeAllVideoOutputs__block_invoke_2;
  v3[3] = &unk_1E5DCCE60;
  id v4 = *(id *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __40__PXVideoSession__removeAllVideoOutputs__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDelegate:0 queue:0];
  [*(id *)(a1 + 32) removeOutput:v3];
}

- (void)_updateAVPlayerPlayState
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v8 = [(PXVideoSession *)self videoPlayer];
  int64_t v4 = [(PXVideoSession *)self playState];
  if (v4 == 2)
  {
    [v8 pause];
LABEL_7:
    id v5 = v8;
    goto LABEL_8;
  }
  if (v4 == 3)
  {
    [(PXVideoPlaybackReporter *)self->_playbackReporter reportPlaybackBegan];
    [(PXVideoSession *)self desiredPlaybackRate];
    *(float *)&double v7 = v7;
    [v8 setRate:v7];
    goto LABEL_7;
  }
  id v5 = v8;
  if (!v4)
  {
    CMTime v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXVideoSession.m" lineNumber:2462 description:@"unknown play state"];

    abort();
  }
LABEL_8:
}

- (void)_updateCurrentPlayerItem
{
  id v4 = [(PXVideoSession *)self videoPlayer];
  id v3 = [v4 currentItem];
  [(PXVideoSession *)self setCurrentPlayerItem:v3];
}

- (void)_updatePlayState
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(PXVideoSession *)self _assertOnUpdateQueue];
  id v3 = [(PXVideoSession *)self contentProvider];
  id v4 = [v3 loadingResult];
  id v5 = [v4 playerItem];
  if (v5)
  {
  }
  else
  {
    CMTime v9 = [(PXVideoSession *)self contentProvider];
    v10 = [v9 loadingResult];
    v11 = [v10 error];

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      CMTime v13 = [(PXVideoSession *)self contentProvider];
      uint64_t v14 = [v13 loadingResult];
      uint64_t v15 = [v14 error];
      objc_msgSend(v12, "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXVideoSessionErrorDomain", 1, v15, @"Video loading failed");
      CMTime v6 = (NSError *)objc_claimAutoreleasedReturnValue();

      double v7 = PLVideoPlaybackGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        int v25 = 138412546;
        v26 = self;
        __int16 v27 = 2112;
        CMTime v28 = v6;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "%@ encountered error: %@", (uint8_t *)&v25, 0x16u);
      }
LABEL_21:
      uint64_t v8 = 5;
      goto LABEL_22;
    }
  }
  if (![(PXVideoSession *)self isPlayable]
    && [(PXVideoSession *)self desiredPlayState] == 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXVideoSessionErrorDomain", 2, 0, @"Video is not playable on this device");
    CMTime v6 = (NSError *)objc_claimAutoreleasedReturnValue();
    double v7 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
  double v7 = [(PXVideoSession *)self videoPlayer];
  if ([(PXVideoSession *)self isUpdatingAudioSession])
  {
    CMTime v6 = 0;
    uint64_t v8 = 1;
    goto LABEL_22;
  }
  uint64_t v16 = [v7 status];
  if (v16 == 2)
  {
    long long v17 = (void *)MEMORY[0x1E4F28C58];
    long long v18 = [v7 error];
    objc_msgSend(v17, "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXVideoSessionErrorDomain", 2, v18, @"AVPlayer state == PXVideoSessionActualPlayStateFailed");
    CMTime v6 = (NSError *)objc_claimAutoreleasedReturnValue();

    long long v19 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (v16 != 1)
  {
    CMTime v6 = 0;
    uint64_t v8 = v16 == 0;
    goto LABEL_22;
  }
  if ([v7 currentItemStatus] == 2)
  {
    double v20 = (void *)MEMORY[0x1E4F28C58];
    v21 = [v7 currentItem];
    v22 = [v21 error];
    objc_msgSend(v20, "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXVideoSessionErrorDomain", 2, v22, @"AVPlayerItem status == AVPlayerItemStatusFailed");
    CMTime v6 = (NSError *)objc_claimAutoreleasedReturnValue();

    long long v19 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_19:
      int v25 = 138412546;
      v26 = self;
      __int16 v27 = 2112;
      CMTime v28 = v6;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "%@ encountered error: %@", (uint8_t *)&v25, 0x16u);
    }
LABEL_20:

    goto LABEL_21;
  }
  int64_t v24 = [(PXVideoSession *)self desiredPlayState];
  if (v24 == 1)
  {
    CMTime v6 = 0;
    if ([(PXVideoSession *)self isBuffering]) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 3;
    }
  }
  else
  {
    CMTime v6 = 0;
    if (v24) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 2;
    }
  }
LABEL_22:

  error = self->_error;
  self->_error = v6;

  [(PXVideoSession *)self setPlayState:v8];
}

- (void)_updateReadyForSeeking
{
  id v5 = [(PXVideoSession *)self videoPlayer];
  if ([v5 status] == 1)
  {
    id v3 = [v5 currentItem];
    BOOL v4 = [v3 status] == 1;
  }
  else
  {
    BOOL v4 = 0;
  }
  [(PXVideoSession *)self setIsReadyForSeeking:v4];
}

- (void)_updatePlayerVolume
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PXVideoSession__updatePlayerVolume__block_invoke;
  v6[3] = &unk_1E5DD0588;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(MEMORY[0x1E4F14428], v6);
  int v3 = *((_DWORD *)v8 + 6);
  BOOL v4 = [(PXVideoSession *)self videoPlayer];
  LODWORD(v5) = v3;
  [v4 setVolume:v5];

  _Block_object_dispose(&v7, 8);
}

float __37__PXVideoSession__updatePlayerVolume__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 760) presentationValue];
  float result = v2;
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateVolumeAnimator
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v6 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXVideoSession__updateVolumeAnimator__block_invoke;
  block[3] = &unk_1E5DCCE38;
  void block[4] = self;
  block[5] = v7;
  block[6] = v5;
  dispatch_sync(stateQueue, block);
  px_dispatch_on_main_queue();
}

float __39__PXVideoSession__updateVolumeAnimator__block_invoke(void *a1)
{
  float result = *(float *)(a1[4] + 476);
  *(float *)(*(void *)(a1[5] + 8) + 24) = result;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 480);
  return result;
}

void __39__PXVideoSession__updateVolumeAnimator__block_invoke_2(void *a1)
{
  v1 = *(void **)(a1[4] + 760);
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __39__PXVideoSession__updateVolumeAnimator__block_invoke_3;
    v3[3] = &unk_1E5DCCE10;
    void v3[4] = a1[6];
    [v1 performChangesWithDuration:2 curve:v3 changes:0.25];
  }
  else
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __39__PXVideoSession__updateVolumeAnimator__block_invoke_4;
    v2[3] = &unk_1E5DCCE10;
    v2[4] = a1[6];
    [v1 performChangesWithoutAnimation:v2];
  }
  kdebug_trace();
}

uint64_t __39__PXVideoSession__updateVolumeAnimator__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setValue:*(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __39__PXVideoSession__updateVolumeAnimator__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setValue:*(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

- (void)_updatePlayerItemInPlayer
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  int v3 = [(PXVideoSession *)self playerItem];
  if (!v3)
  {
    id v8 = 0;
    double v5 = [(PXVideoSession *)self videoPlayer];
    char v6 = v5;
    id v7 = 0;
LABEL_7:
    [v5 replaceCurrentItemWithPlayerItem:v7];
    goto LABEL_8;
  }
  if (!self->_updateQueue_didFinishInitializingAudioSession) {
    goto LABEL_9;
  }
  id v8 = v3;
  BOOL v4 = [(PXVideoSession *)self isLoopingEnabled];
  double v5 = [(PXVideoSession *)self videoPlayer];
  char v6 = v5;
  if (!v4)
  {
    id v7 = v8;
    goto LABEL_7;
  }
  [v5 setLoopingEnabled:1 withTemplateItem:v8];
LABEL_8:

  int v3 = v8;
LABEL_9:
}

- (void)_updatePlayerItem
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__PXVideoSession__updatePlayerItem__block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  void v3[4] = self;
  [(PXVideoSession *)self _performChanges:v3];
}

void __35__PXVideoSession__updatePlayerItem__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) contentProvider];
  int v3 = [v2 loadingResult];

  BOOL v4 = *(void **)(a1 + 32);
  double v5 = [v3 playerItem];
  if (v3)
  {
    [v3 timeRange];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  char v6 = objc_msgSend(v3, "timeRangeMapper", v7, v8, v9);
  [v4 setPlayerItem:v5 segmentTimeRangeOfOriginalVideo:&v7 timeRangeMapper:v6];
}

- (void)_updateStalled
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  int64_t v3 = [(PXVideoSession *)self desiredPlayState];
  int64_t v4 = [(PXVideoSession *)self playState];
  int v5 = ![(PXVideoSession *)self isPlayerTimeAdvancing];
  if (v4 != 4) {
    int v5 = 0;
  }
  if (v4 == 1) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = v5;
  }
  if (v3 == 1) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  [(PXVideoSession *)self setStalled:v7];
}

- (void)_updateBuffering
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  id v7 = [(PXVideoSession *)self videoPlayer];
  int v3 = [v7 currentItemIsLikelyToKeepUp];
  int v4 = [v7 currentItemPlaybackBufferFull];
  int v5 = [v7 currentItem];
  if (v5) {
    uint64_t v6 = (v3 | v4) ^ 1u;
  }
  else {
    uint64_t v6 = 0;
  }

  [(PXVideoSession *)self setBuffering:v6];
}

- (void)_updateAtBeginningOrEndWithPlayerItemDuration:(id *)a3 success:(BOOL)a4 error:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!a4)
  {
    int v10 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v8;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Failed to load video duration. Error: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_10;
  }
  long long v9 = [(PXVideoSession *)self videoPlayer];
  int v10 = v9;
  long long v19 = 0uLL;
  CMTimeEpoch v20 = 0;
  if (v9) {
    [v9 currentTime];
  }
  memset(&buf, 0, sizeof(buf));
  [(PXVideoSession *)self playbackTimeRange];
  if ((BYTE12(v19) & 0x1D) != 1 || (a3->var2 & 0x1D) != 1)
  {
LABEL_10:
    BOOL v12 = 0;
    BOOL v11 = 1;
    goto LABEL_11;
  }
  *(_OWORD *)&time1.start.value = v19;
  time1.start.epoch = v20;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  BOOL v11 = CMTimeCompare(&time1.start, &time2) < 1;
  *(_OWORD *)&time1.start.value = v19;
  time1.start.epoch = v20;
  CMTime time2 = (CMTime)*a3;
  if (CMTimeCompare(&time1.start, &time2) < 0)
  {
    if (buf.start.flags)
    {
      BOOL v12 = 0;
      if ((buf.duration.flags & 1) != 0 && !buf.duration.epoch && (buf.duration.value & 0x8000000000000000) == 0)
      {
        CMTimeRange time1 = buf;
        CMTimeRangeGetEnd(&v17, &time1);
        *(_OWORD *)&time1.start.value = v19;
        time1.start.epoch = v20;
        BOOL v12 = CMTimeCompare(&time1.start, &v17) >= 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 1;
  }
LABEL_11:

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PXVideoSession__updateAtBeginningOrEndWithPlayerItemDuration_success_error___block_invoke;
  v13[3] = &unk_1E5DCCDE8;
  v13[4] = self;
  BOOL v14 = v11;
  BOOL v15 = v12;
  [(PXVideoSession *)self _performChanges:v13];
}

uint64_t __78__PXVideoSession__updateAtBeginningOrEndWithPlayerItemDuration_success_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAtBeginning:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 41);
  int v3 = *(void **)(a1 + 32);
  return [v3 setAtEnd:v2];
}

- (void)_updateAtBeginningOrEnd
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  int v3 = [(PXVideoSession *)self videoPlayer];
  uint64_t v4 = [(PXVideoSession *)self playerItem];
  int v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [v5 asset];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __41__PXVideoSession__updateAtBeginningOrEnd__block_invoke;
    v8[3] = &unk_1E5DCCDC0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v6, "px_loadDurationWithCompletionHandler:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__PXVideoSession__updateAtBeginningOrEnd__block_invoke_2;
    void v7[3] = &unk_1E5DD0FA8;
    void v7[4] = self;
    [(PXVideoSession *)self _performChanges:v7];
  }
}

void __41__PXVideoSession__updateAtBeginningOrEnd__block_invoke(uint64_t a1, long long *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  long long v9 = *a2;
  uint64_t v10 = *((void *)a2 + 2);
  [WeakRetained _updateAtBeginningOrEndWithPlayerItemDuration:&v9 success:a3 error:v7];
}

uint64_t __41__PXVideoSession__updateAtBeginningOrEnd__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAtBeginning:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setAtEnd:0];
}

- (void)setNominalFrameRate:(float)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PXVideoSession_setNominalFrameRate___block_invoke;
  block[3] = &unk_1E5DCCD98;
  float v9 = a3;
  void block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x400) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PXVideoSession setNominalFrameRate:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXVideoSession.m", 2258, @"invalidating %lu after it already has been updated", 1024);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x400uLL;
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __38__PXVideoSession_setNominalFrameRate___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  float v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 552) != v2)
  {
    *(float *)(v1 + 552) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (float)nominalFrameRate
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PXVideoSession_nominalFrameRate__block_invoke;
  void v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __34__PXVideoSession_nominalFrameRate__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 552);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PXVideoSession_setNaturalSize___block_invoke;
  block[3] = &unk_1E5DCC9D0;
  *(CGFloat *)&void block[6] = width;
  *(CGFloat *)&void block[7] = height;
  void block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x400) != 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXVideoSession setNaturalSize:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXVideoSession.m", 2236, @"invalidating %lu after it already has been updated", 1024);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x400uLL;
  }
  _Block_object_dispose(&v10, 8);
}

__n128 __33__PXVideoSession_setNaturalSize___block_invoke(__n128 *a1)
{
  uint64_t v1 = a1 + 3;
  result.n128_u64[0] = a1[3].n128_u64[0];
  float v3 = (__n128 *)(a1[2].n128_u64[0] + 536);
  if (v3->n128_f64[0] != result.n128_f64[0] || *(double *)(a1[2].n128_u64[0] + 544) != a1[3].n128_f64[1])
  {
    __n128 result = *v1;
    __n128 *v3 = *v1;
    *(unsigned char *)(*(void *)(a1[2].n128_u64[1] + 8) + 24) = 1;
  }
  return result;
}

- (CGSize)naturalSize
{
  uint64_t v8 = 0;
  int v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  BOOL v11 = &unk_1AB5D584F;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PXVideoSession_naturalSize__block_invoke;
  void v7[3] = &unk_1E5DD0588;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

__n128 __29__PXVideoSession_naturalSize__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 536);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PXVideoSession_setPreferredTransform___block_invoke;
  void v7[3] = &unk_1E5DCCC78;
  long long v6 = *(_OWORD *)&a3->c;
  long long v8 = *(_OWORD *)&a3->a;
  long long v9 = v6;
  long long v10 = *(_OWORD *)&a3->tx;
  void v7[4] = self;
  void v7[5] = &v11;
  dispatch_sync(stateQueue, v7);
  if (*((unsigned char *)v12 + 24)) {
    [(PXVideoSession *)self signalChange:2048];
  }
  _Block_object_dispose(&v11, 8);
}

__n128 __40__PXVideoSession_setPreferredTransform___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = v2 + 488;
  long long v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 80);
  long long v5 = *(_OWORD *)(v2 + 488);
  long long v6 = *(_OWORD *)(v2 + 520);
  *(_OWORD *)&v9.c = *(_OWORD *)(v2 + 504);
  *(_OWORD *)&v9.tx = v6;
  *(_OWORD *)&v9.a = v5;
  if (!CGAffineTransformEqualToTransform(&t1, &v9))
  {
    __n128 result = *(__n128 *)(a1 + 48);
    long long v8 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v3 + 32) = v8;
    *(__n128 *)uint64_t v3 = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x5010000000;
  uint64_t v12 = &unk_1AB5D584F;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __36__PXVideoSession_preferredTransform__block_invoke;
  v8[3] = &unk_1E5DD0588;
  void v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(stateQueue, v8);
  long long v5 = v10;
  long long v6 = *((_OWORD *)v10 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v10 + 2);
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

__n128 __36__PXVideoSession_preferredTransform__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v3 = *(_OWORD *)(*(void *)(a1 + 32) + 504);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 520);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 488);
  *(_OWORD *)(v1 + 48) = v3;
  *(__n128 *)(v1 + 64) = result;
  return result;
}

- (void)_videoQueue_updateTrackGeometryWithPlayerItem:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 asset];
  if ([v5 statusOfValueForKey:@"tracks" error:0] == 2
    && ([v5 tracks],
        long long v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7))
  {
    long long v8 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v5];
    uint64_t v9 = [v8 firstObject];

    if ([v9 statusOfValueForKey:@"preferredTransform" error:0] == 2)
    {
      long long v25 = 0u;
      long long v24 = 0u;
      long long v23 = 0u;
      if (v9) {
        [v9 preferredTransform];
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke;
      v19[3] = &unk_1E5DCCD48;
      v19[4] = self;
      long long v20 = v23;
      long long v21 = v24;
      long long v22 = v25;
      [(PXVideoSession *)self _performChanges:v19];
    }
    if ([v9 statusOfValueForKey:@"naturalSize" error:0] == 2)
    {
      [v9 naturalSize];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_2;
      v18[3] = &unk_1E5DD0460;
      v18[4] = self;
      v18[5] = v10;
      v18[6] = v11;
      [(PXVideoSession *)self _performChanges:v18];
    }
    if ([v9 statusOfValueForKey:@"nominalFrameRate" error:0] == 2)
    {
      [v9 nominalFrameRate];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_3;
      v16[3] = &unk_1E5DCCD70;
      v16[4] = self;
      int v17 = v12;
      [(PXVideoSession *)self _performChanges:v16];
    }
  }
  else
  {
    [v4 presentationSize];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_4;
    v15[3] = &unk_1E5DD0460;
    v15[4] = self;
    v15[5] = v13;
    v15[6] = v14;
    [(PXVideoSession *)self _performChanges:v15];
  }
}

uint64_t __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setPreferredTransform:v3];
}

uint64_t __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNaturalSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_3(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) setNominalFrameRate:a2];
}

uint64_t __64__PXVideoSession__videoQueue_updateTrackGeometryWithPlayerItem___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNaturalSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setPreferredTransform:v5];
  return [*(id *)(a1 + 32) setNominalFrameRate:0.0];
}

- (void)_updateTrackGeometry
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  long long v3 = [(PXVideoSession *)self playerItem];
  id v4 = [v3 videoComposition];
  long long v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __38__PXVideoSession__updateTrackGeometry__block_invoke;
    v11[3] = &unk_1E5DD0328;
    void v11[4] = self;
    id v12 = v4;
    [(PXVideoSession *)self _performChanges:v11];
  }
  else if ([v3 status] == 1)
  {
    objc_initWeak(&location, self);
    videoWorkQueue = self->_videoWorkQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PXVideoSession__updateTrackGeometry__block_invoke_2;
    block[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v9, &location);
    id v8 = v3;
    dispatch_async(videoWorkQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

uint64_t __38__PXVideoSession__updateTrackGeometry__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setPreferredTransform:v5];
  [*(id *)(a1 + 40) renderSize];
  return objc_msgSend(*(id *)(a1 + 32), "setNaturalSize:");
}

void __38__PXVideoSession__updateTrackGeometry__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_videoQueue_updateTrackGeometryWithPlayerItem:", *(void *)(a1 + 32));
}

- (void)_updateAudioStatus
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  long long v3 = [(PXVideoSession *)self playerItem];
  if (v3)
  {
    id v4 = [(PXVideoSession *)self videoPlayer];
    if ([v4 currentItemHasEnabledAudio]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PXVideoSession__updateAudioStatus__block_invoke;
  v6[3] = &unk_1E5DD09C8;
  void v6[4] = self;
  v6[5] = v5;
  [(PXVideoSession *)self _performChanges:v6];
}

uint64_t __36__PXVideoSession__updateAudioStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAudioStatus:*(void *)(a1 + 40)];
}

- (void)_setPlayabilityFromAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    char v6 = [v4 isPlayable];
  }
  else {
    char v6 = 1;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __43__PXVideoSession__setPlayabilityFromAsset___block_invoke;
  v8[3] = &unk_1E5DD0978;
  char v10 = v6;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(PXVideoSession *)self _performChanges:v8];
}

void __43__PXVideoSession__setPlayabilityFromAsset___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setPlayable:*(unsigned __int8 *)(a1 + 48)];
  if (!*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) setPlayState:5];
    uint64_t v2 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Attempted to play unplayable video asset: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_handlePlayabilityDidLoadForAsset:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PXVideoSession *)self playerItem];
    id v6 = [v5 asset];

    if (v6 == v4)
    {
      id v12 = 0;
      uint64_t v7 = [v4 statusOfValueForKey:@"playable" error:&v12];
      id v8 = v12;
      if (v7 == 2)
      {
        [(PXVideoSession *)self _setPlayabilityFromAsset:v4];
      }
      else
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __52__PXVideoSession__handlePlayabilityDidLoadForAsset___block_invoke;
        v9[3] = &unk_1E5DD11E8;
        v9[4] = self;
        id v10 = v4;
        id v11 = v8;
        [(PXVideoSession *)self _performChanges:v9];
      }
    }
  }
}

void __52__PXVideoSession__handlePlayabilityDidLoadForAsset___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setPlayState:5];
  uint64_t v2 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Failed to load playable status of video %@: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_updatePlayability
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v3 = [(PXVideoSession *)self playerItem];
  uint64_t v4 = [v3 asset];

  id v13 = 0;
  uint64_t v5 = [v4 statusOfValueForKey:@"playable" error:&v13];
  id v6 = v13;
  if (v5 == 2)
  {
    [(PXVideoSession *)self _setPlayabilityFromAsset:v4];
  }
  else if (v5 == 3)
  {
    __int16 v7 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 138412546;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed to load playable status of video %@: %@", buf, 0x16u);
    }

    [(PXVideoSession *)self setPlayState:5];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v4);
    uint64_t v14 = @"playable";
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__PXVideoSession__updatePlayability__block_invoke;
    v9[3] = &unk_1E5DD0838;
    objc_copyWeak(&v10, (id *)buf);
    objc_copyWeak(&v11, &location);
    [v4 loadValuesAsynchronouslyForKeys:v8 completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __36__PXVideoSession__updatePlayability__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handlePlayabilityDidLoadForAsset:v2];
}

- (void)_handlePlayerTimeAdvancementTimer:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PXVideoSession__handlePlayerTimeAdvancementTimer___block_invoke;
  _OWORD v3[3] = &unk_1E5DD0FA8;
  void v3[4] = self;
  [(PXVideoSession *)self _performChanges:v3];
}

uint64_t __52__PXVideoSession__handlePlayerTimeAdvancementTimer___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(&v12, 0, sizeof(v12));
  id v2 = [*(id *)(a1 + 32) videoPlayer];
  uint64_t v3 = v2;
  if (v2) {
    [v2 currentTime];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }

  BOOL v4 = 0;
  uint64_t v5 = *(void *)(a1 + 32) + 716;
  CMTimeValue v13 = *(void *)v5;
  CMTimeFlags v6 = *(_DWORD *)(v5 + 12);
  CMTimeScale v14 = *(_DWORD *)(v5 + 8);
  CMTimeEpoch v7 = *(void *)(v5 + 16);
  long long v8 = *(_OWORD *)&v12.value;
  *(void *)(v5 + 16) = v12.epoch;
  *(_OWORD *)uint64_t v5 = v8;
  if ((v12.flags & 0x1D) == 1 && (v6 & 0x1D) == 1)
  {
    CMTime time1 = v12;
    time2.value = v13;
    time2.timescale = v14;
    time2.flags = v6;
    time2.epoch = v7;
    BOOL v4 = CMTimeCompare(&time1, &time2) > 0;
  }
  return [*(id *)(a1 + 32) setPlayerTimeAdvancing:v4];
}

- (void)_avPlayerTimeDidChange:(id *)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PXVideoSession__avPlayerTimeDidChange___block_invoke;
  _OWORD v5[3] = &unk_1E5DCCD20;
  v5[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [(PXVideoSession *)self _performChanges:v5];
}

void __41__PXVideoSession__avPlayerTimeDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 1) != 0)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [MEMORY[0x1E4F28B00] currentHandler];
    CMTimeEpoch v7 = [NSString stringWithUTF8String:"-[PXVideoSession _avPlayerTimeDidChange:]_block_invoke"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXVideoSession.m", 2067, @"invalidating %lu after it already has been updated", 256);

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x100uLL;
  [*(id *)(a1 + 32) signalChange:128];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 136);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXVideoSession__avPlayerTimeDidChange___block_invoke_2;
  block[3] = &unk_1E5DD01C8;
  void block[4] = v4;
  long long v9 = *(_OWORD *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  dispatch_async(v5, block);
}

__n128 __41__PXVideoSession__avPlayerTimeDidChange___block_invoke_2(uint64_t a1)
{
  long long v1 = (__n128 *)(*(void *)(a1 + 32) + 588);
  unint64_t v2 = *(void *)(a1 + 56);
  __n128 result = *(__n128 *)(a1 + 40);
  __n128 *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

- (void)_handleTrackGeometryDidLoad
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PXVideoSession__handleTrackGeometryDidLoad__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXVideoSession *)self _performChanges:v2];
}

void __45__PXVideoSession__handleTrackGeometryDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 688) & 0x10) != 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[PXVideoSession _handleTrackGeometryDidLoad]_block_invoke"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 2060, @"invalidating %lu after it already has been updated", 16);

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x10uLL;
}

- (id)pixelBufferOutputSizes
{
  uint64_t v6 = 0;
  CMTimeEpoch v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__257854;
  uint64_t v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PXVideoSession_pixelBufferOutputSizes__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__PXVideoSession_pixelBufferOutputSizes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)pixelBufferOutputTokenCount
{
  uint64_t v6 = 0;
  CMTimeEpoch v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PXVideoSession_pixelBufferOutputTokenCount__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__PXVideoSession_pixelBufferOutputTokenCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 168) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAtEnd:(BOOL)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v11 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__PXVideoSession_setAtEnd___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v7 = a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v9 + 24)) {
    [(PXVideoSession *)self signalChange:512];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __27__PXVideoSession_setAtEnd___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 482))
  {
    *(unsigned char *)(v2 + 482) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)isAtEnd
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__PXVideoSession_isAtEnd__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__PXVideoSession_isAtEnd__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 482);
  return result;
}

- (void)setAtBeginning:(BOOL)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v11 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PXVideoSession_setAtBeginning___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v7 = a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v9 + 24)) {
    [(PXVideoSession *)self signalChange:256];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __33__PXVideoSession_setAtBeginning___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 483))
  {
    *(unsigned char *)(v2 + 483) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)isAtBeginning
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__PXVideoSession_isAtBeginning__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__PXVideoSession_isAtBeginning__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 483);
  return result;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  CMTimeScale v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PXVideoSession_setDesiredPlayState___block_invoke;
  block[3] = &unk_1E5DCCCF8;
  void block[4] = self;
  void block[5] = &v13;
  void block[6] = &v17;
  void block[7] = a3;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v6 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v14[3];
      uint64_t v8 = @"Playing";
      if (v7 == 1) {
        char v9 = @"Playing";
      }
      else {
        char v9 = 0;
      }
      if (v7) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = @"Paused";
      }
      if (a3 != 1) {
        uint64_t v8 = 0;
      }
      *(_DWORD *)CMTimeRange buf = 138412802;
      long long v22 = v10;
      __int16 v23 = 2112;
      if (!a3) {
        uint64_t v8 = @"Paused";
      }
      long long v24 = v8;
      __int16 v25 = 2112;
      v26 = self;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "[Video Session] Desired play state changing from %@ to %@\n\t%@", buf, 0x20u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __38__PXVideoSession_setDesiredPlayState___block_invoke_353;
    v11[3] = &unk_1E5DD09C8;
    void v11[4] = self;
    void v11[5] = a3;
    [(PXVideoSession *)self _performChanges:v11];
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void *__38__PXVideoSession_setDesiredPlayState___block_invoke(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 248);
  if (result[7] != *(void *)(*(void *)(result[5] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 1;
    *(void *)(result[4] + 248) = result[7];
  }
  return result;
}

void __38__PXVideoSession_setDesiredPlayState___block_invoke_353(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) signalChange:8];
  uint64_t v4 = [*(id *)(a1 + 32) log];
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      uint64_t v7 = [*(id *)(a1 + 32) logContext];
      *(_DWORD *)CMTimeRange buf = 134217984;
      uint64_t v21 = v7;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXVideoSessionChangeDesiredPlayState", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  uint64_t v8 = v4;
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      uint64_t v11 = [*(id *)(a1 + 32) logContext];
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)CMTimeRange buf = 134218240;
      uint64_t v21 = v11;
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXVideoSessionChangeDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
    }
  }

  uint64_t v13 = v8;
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, *(const void **)(a1 + 32));
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      uint64_t v16 = [*(id *)(a1 + 32) logContext];
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)CMTimeRange buf = 134218240;
      uint64_t v21 = v16;
      __int16 v22 = 2048;
      uint64_t v23 = v17;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXVideoSessionChangeDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
    }
  }

  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 688) & 0xC0) != 0)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[PXVideoSession setDesiredPlayState:]_block_invoke"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"PXVideoSession.m", 1993, @"invalidating %lu after it already has been updated", 192);

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0xC0uLL;
}

- (int64_t)desiredPlayState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PXVideoSession_desiredPlayState__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__PXVideoSession_desiredPlayState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 248);
  return result;
}

- (void)setPlayState:(int64_t)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PXVideoSession_setPlayState___block_invoke;
  block[3] = &unk_1E5DCCCF8;
  void block[4] = self;
  void block[5] = &v37;
  void block[6] = &v33;
  void block[7] = a3;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v38 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x680) != 0)
    {
      CMTime v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = [NSString stringWithUTF8String:"-[PXVideoSession setPlayState:]"];
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"PXVideoSession.m", 1958, @"invalidating %lu after it already has been updated", 1664);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x680uLL;
    [(PXVideoSession *)self signalChange:4];
    uint64_t v6 = [(PXVideoSession *)self log];
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        uint64_t v9 = [(PXVideoSession *)self logContext];
        *(_DWORD *)CMTimeRange buf = 134217984;
        uint64_t v42 = v9;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXVideoSessionChangePlayState", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    os_signpost_id_t v10 = v6;
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        uint64_t v13 = [(PXVideoSession *)self logContext];
        *(_DWORD *)CMTimeRange buf = 134218240;
        uint64_t v42 = v13;
        __int16 v43 = 2048;
        int64_t v44 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_EVENT, v12, "PXVideoSessionChangePlayState", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
      }
    }

    os_signpost_id_t v14 = v10;
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        uint64_t v17 = [(PXVideoSession *)self logContext];
        *(_DWORD *)CMTimeRange buf = 134218240;
        uint64_t v42 = v17;
        __int16 v43 = 2048;
        int64_t v44 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXVideoSessionChangePlayState", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
      }
    }

    id v18 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v19 = v34[3];
      if (v19 > 5) {
        char v20 = 0;
      }
      else {
        char v20 = off_1E5DCCEF0[v19];
      }
      if ((unint64_t)a3 > 5) {
        uint64_t v21 = 0;
      }
      else {
        uint64_t v21 = off_1E5DCCEF0[a3];
      }
      *(_DWORD *)CMTimeRange buf = 138412802;
      uint64_t v42 = (uint64_t)v20;
      __int16 v43 = 2112;
      int64_t v44 = (int64_t)v21;
      __int16 v45 = 2112;
      v46 = self;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "[Video Session] Actual play state changing from %@ to %@\n\t%@", buf, 0x20u);
    }

    if (a3 == 5)
    {
      __int16 v22 = [(PXVideoSession *)self contentProvider];
      uint64_t v23 = [v22 analyticsPayload];
      uint64_t v24 = (void *)[v23 mutableCopy];

      __int16 v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      [v24 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F56560]];

      uint64_t v27 = [(PXVideoSession *)self error];
      [v24 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F56568]];

      CMTime v28 = (void *)MEMORY[0x1E4F56658];
      uint64_t v29 = (void *)[v24 copy];
      [v28 sendEvent:@"com.apple.photos.CPAnalytics.videoSessionFailed" withPayload:v29];
    }
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

void *__31__PXVideoSession_setPlayState___block_invoke(void *result)
{
  if (result[7] != *(void *)(result[4] + 200))
  {
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    *(void *)(*(void *)(result[6] + 8) + 24) = *(void *)(result[4] + 200);
    *(void *)(result[4] + 200) = result[7];
  }
  return result;
}

- (int64_t)playState
{
  uint64_t v6 = 0;
  os_signpost_id_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__PXVideoSession_playState__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__PXVideoSession_playState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 200);
  return result;
}

- (void)setIsReadyForSeeking:(BOOL)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v11 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXVideoSession_setIsReadyForSeeking___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v7 = a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v9 + 24)) {
    [(PXVideoSession *)self signalChange:0x2000];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __39__PXVideoSession_setIsReadyForSeeking___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 584))
  {
    *(unsigned char *)(v2 + 584) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    if (*(unsigned char *)(result + 48)) {
      return [*(id *)(*(void *)(result + 32) + 624) unlock];
    }
  }
  return result;
}

- (BOOL)isReadyForSeeking
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PXVideoSession_isReadyForSeeking__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PXVideoSession_isReadyForSeeking__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 584);
  return result;
}

- (void)setBuffering:(BOOL)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PXVideoSession_setBuffering___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v9 = a3;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0xC0) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v7 = [NSString stringWithUTF8String:"-[PXVideoSession setBuffering:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXVideoSession.m", 1908, @"invalidating %lu after it already has been updated", 192);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0xC0uLL;
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __31__PXVideoSession_setBuffering___block_invoke(uint64_t result)
{
  if (*(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(*(void *)(result + 32) + 241))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(result + 32) + 241) = *(unsigned char *)(result + 48);
  }
  return result;
}

- (BOOL)isBuffering
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PXVideoSession_isBuffering__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__PXVideoSession_isBuffering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 241);
  return result;
}

- (void)setStalled:(BOOL)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v11 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PXVideoSession_setStalled___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v7 = a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v9 + 24)) {
    [(PXVideoSession *)self signalChange:2];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __29__PXVideoSession_setStalled___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 401))
  {
    *(unsigned char *)(v2 + 401) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)isStalled
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__PXVideoSession_isStalled__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__PXVideoSession_isStalled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 401);
  return result;
}

- (void)setPlayable:(BOOL)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__PXVideoSession_setPlayable___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v9 = a3;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x40) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v7 = [NSString stringWithUTF8String:"-[PXVideoSession setPlayable:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXVideoSession.m", 1863, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x40uLL;
    [(PXVideoSession *)self signalChange:32];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __30__PXVideoSession_setPlayable___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 400))
  {
    *(unsigned char *)(v2 + 400) = v1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  return [*(id *)(v2 + 616) unlock];
}

- (BOOL)isPlayable
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__PXVideoSession_isPlayable__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__PXVideoSession_isPlayable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 400);
  return result;
}

- (BOOL)isSegmentOfOriginalVideo
{
  [(PXVideoSession *)self segmentTimeRangeOfOriginalVideo];
  if ((v7 & 1) == 0) {
    return 0;
  }
  [(PXVideoSession *)self segmentTimeRangeOfOriginalVideo];
  if ((v6 & 1) == 0) {
    return 0;
  }
  [(PXVideoSession *)self segmentTimeRangeOfOriginalVideo];
  if (v5) {
    return 0;
  }
  [(PXVideoSession *)self segmentTimeRangeOfOriginalVideo];
  return v4 >= 0;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)segmentTimeRangeOfOriginalVideo
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x5010000000;
  uint64_t v12 = &unk_1AB5D584F;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __49__PXVideoSession_segmentTimeRangeOfOriginalVideo__block_invoke;
  v8[3] = &unk_1E5DD0588;
  void v8[4] = self;
  void v8[5] = &v9;
  dispatch_sync(stateQueue, v8);
  uint64_t v5 = v10;
  long long v6 = *((_OWORD *)v10 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v10 + 2);
  *(_OWORD *)&retstr->var0.int64_t var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

__n128 __49__PXVideoSession_segmentTimeRangeOfOriginalVideo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v3 = *(_OWORD *)(*(void *)(a1 + 32) + 368);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 384);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 352);
  *(_OWORD *)(v1 + 48) = v3;
  *(__n128 *)(v1 + 64) = result;
  return result;
}

- (void)setPlayerItem:(id)a3 segmentTimeRangeOfOriginalVideo:(id *)a4 timeRangeMapper:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PXVideoSession_setPlayerItem_segmentTimeRangeOfOriginalVideo_timeRangeMapper___block_invoke;
  block[3] = &unk_1E5DCCCC8;
  id v11 = v8;
  id v17 = v11;
  id v18 = self;
  char v20 = &v24;
  long long v12 = *(_OWORD *)&a4->var0.var3;
  long long v21 = *(_OWORD *)&a4->var0.var0;
  long long v22 = v12;
  long long v23 = *(_OWORD *)&a4->var1.var1;
  id v13 = v9;
  id v19 = v13;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v25 + 24))
  {
    [(PXVideoSession *)self _loadAssetTracksIfNeeded];
    [(PXVideoSession *)self _updateQueue_seekToPlaybackTimeRangeStartIfNeeded];
    [(PXVideoSession *)self signalChange:1];
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x1452) != 0)
    {
      long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v15 = [NSString stringWithUTF8String:"-[PXVideoSession setPlayerItem:segmentTimeRangeOfOriginalVideo:timeRangeMapper:]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXVideoSession.m", 1828, @"invalidating %lu after it already has been updated", 5202);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x1452uLL;
  }

  _Block_object_dispose(&v24, 8);
}

void __80__PXVideoSession_setPlayerItem_segmentTimeRangeOfOriginalVideo_timeRangeMapper___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) != *(void *)(*(void *)(a1 + 40) + 336))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 336), *(id *)(a1 + 32));
    uint64_t v2 = (_OWORD *)(*(void *)(a1 + 40) + 352);
    long long v4 = *(_OWORD *)(a1 + 80);
    long long v3 = *(_OWORD *)(a1 + 96);
    _OWORD *v2 = *(_OWORD *)(a1 + 64);
    v2[1] = v4;
    v2[2] = v3;
    *(void *)(*(void *)(a1 + 40) + 328) = 0;
    uint64_t v5 = *(void **)(a1 + 48);
    long long v6 = (id *)(*(void *)(a1 + 40) + 344);
    objc_storeStrong(v6, v5);
  }
}

- (PFSlowMotionTimeRangeMapper)timeRangeMapper
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__257854;
  uint64_t v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PXVideoSession_timeRangeMapper__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PFSlowMotionTimeRangeMapper *)v3;
}

void __33__PXVideoSession_timeRangeMapper__block_invoke(uint64_t a1)
{
}

- (AVPlayerItem)playerItem
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__257854;
  uint64_t v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__PXVideoSession_playerItem__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVPlayerItem *)v3;
}

void __28__PXVideoSession_playerItem__block_invoke(uint64_t a1)
{
}

- (void)setAudioStatus:(int64_t)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PXVideoSession_setAudioStatus___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v8 + 24)) {
    [(PXVideoSession *)self signalChange:16];
  }
  _Block_object_dispose(&v7, 8);
}

void *__33__PXVideoSession_setAudioStatus___block_invoke(void *result)
{
  uint64_t v1 = result[6];
  uint64_t v2 = result[4];
  if (v1 != *(void *)(v2 + 328))
  {
    *(void *)(v2 + 328) = v1;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

- (int64_t)audioStatus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PXVideoSession_audioStatus__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__PXVideoSession_audioStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 328);
  return result;
}

- (void)setPlayerTimeAdvancing:(BOOL)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXVideoSession_setPlayerTimeAdvancing___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v9 = a3;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x80) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXVideoSession setPlayerTimeAdvancing:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXVideoSession.m", 1769, @"invalidating %lu after it already has been updated", 128);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x80uLL;
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __41__PXVideoSession_setPlayerTimeAdvancing___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 320))
  {
    *(unsigned char *)(v2 + 320) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)isPlayerTimeAdvancing
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PXVideoSession_isPlayerTimeAdvancing__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__PXVideoSession_isPlayerTimeAdvancing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 320);
  return result;
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXVideoSession *)self videoPlayer];
  [v4 setAllowsExternalPlayback:v3];
}

- (void)setSeekToBeginningAtEnd:(BOOL)a3
{
  BOOL v3 = a3;
  stateQueue = self->_stateQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__PXVideoSession_setSeekToBeginningAtEnd___block_invoke;
  v9[3] = &unk_1E5DCFE98;
  void v9[4] = self;
  BOOL v10 = a3;
  dispatch_sync(stateQueue, v9);
  uint64_t v6 = [(PXVideoSession *)self videoPlayer];
  uint64_t v7 = v6;
  if (v3) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [v6 setActionAtItemEnd:v8];
}

uint64_t __42__PXVideoSession_setSeekToBeginningAtEnd___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 481) = *(unsigned char *)(result + 40);
  return result;
}

- (void)seekToPlaybackStartTime
{
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXVideoSession_seekToPlaybackStartTime__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(updateQueue, block);
}

uint64_t __41__PXVideoSession_seekToPlaybackStartTime__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateQueue_seekToPlaybackTimeRangeStartIfNeeded");
}

- (BOOL)seekToBeginningAtEnd
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PXVideoSession_seekToBeginningAtEnd__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__PXVideoSession_seekToBeginningAtEnd__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 481);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  BOOL v10 = &unk_1AB5D584F;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PXVideoSession_playbackStartTime__block_invoke;
  block[3] = &unk_1E5DD0588;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(stateQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __35__PXVideoSession_playbackStartTime__block_invoke(uint64_t a1)
{
  int v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 452);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 468);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)setPlaybackStartTime:(id *)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__PXVideoSession_setPlaybackStartTime___block_invoke;
  v4[3] = &unk_1E5DD01C8;
  void v4[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  dispatch_sync(stateQueue, v4);
}

__n128 __39__PXVideoSession_setPlaybackStartTime___block_invoke(uint64_t a1)
{
  int v1 = (__n128 *)(*(void *)(a1 + 32) + 452);
  unint64_t v2 = *(void *)(a1 + 56);
  __n128 result = *(__n128 *)(a1 + 40);
  __n128 *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

- (void)setPlaybackTimeRange:(id *)a3
{
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXVideoSession_setPlaybackTimeRange___block_invoke;
  block[3] = &unk_1E5DCCC78;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  long long v16 = *(_OWORD *)&a3->var0.var0;
  long long v17 = v6;
  long long v18 = *(_OWORD *)&a3->var1.var1;
  void block[4] = self;
  void block[5] = &v19;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v20 + 24))
  {
    uint64_t v7 = [(PXVideoSession *)self videoPlayer];
    uint64_t v8 = [(PXVideoSession *)self playbackTimeRangeEndBoundaryObserver];
    [v7 removeTimeObserver:v8];

    if ((a3->var0.var2 & 1) != 0
      && (a3->var1.var2 & 1) != 0
      && !a3->var1.var3
      && (a3->var1.var0 & 0x8000000000000000) == 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __39__PXVideoSession_setPlaybackTimeRange___block_invoke_2;
      v10[3] = &unk_1E5DCCCA0;
      v10[4] = self;
      long long v9 = *(_OWORD *)&a3->var0.var3;
      long long v12 = *(_OWORD *)&a3->var0.var0;
      long long v13 = v9;
      long long v14 = *(_OWORD *)&a3->var1.var1;
      id v11 = v7;
      [(PXVideoSession *)self _performChanges:v10];
    }
  }
  _Block_object_dispose(&v19, 8);
}

__n128 __39__PXVideoSession_setPlaybackTimeRange___block_invoke(uint64_t a1)
{
  unint64_t v2 = (long long *)(*(void *)(a1 + 32) + 404);
  long long v3 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&range1.start.value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range1.start.epoch = v3;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)(a1 + 80);
  long long v4 = *v2;
  long long v5 = v2[2];
  *(_OWORD *)&v9.start.epoch = v2[1];
  *(_OWORD *)&v9.duration.timescale = v5;
  *(_OWORD *)&v9.start.value = v4;
  if (!CMTimeRangeEqual(&range1, &v9))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v7 = *(void *)(a1 + 32) + 404;
    __n128 result = *(__n128 *)(a1 + 48);
    long long v8 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v7 + 32) = v8;
    *(__n128 *)uint64_t v7 = result;
  }
  return result;
}

void __39__PXVideoSession_setPlaybackTimeRange___block_invoke_2(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateQueue_seekToPlaybackTimeRangeStartIfNeeded");
  long long v4 = (void *)MEMORY[0x1E4F29238];
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 80);
  CMTimeRangeGetEnd(&v14, &range);
  long long v6 = [v4 valueWithCMTime:&v14];
  objc_initWeak((id *)&range, *(id *)(a1 + 32));
  uint64_t v7 = *(void **)(a1 + 40);
  v15[0] = v6;
  long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 144);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __39__PXVideoSession_setPlaybackTimeRange___block_invoke_3;
  v11[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v12, (id *)&range);
  id v10 = (id)[v7 addBoundaryTimeObserverForTimes:v8 queue:v9 usingBlock:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&range);
}

void __39__PXVideoSession_setPlaybackTimeRange___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidReachPlaybackTimeRangeEnd];
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRange
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x5010000000;
  id v12 = &unk_1AB5D584F;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __35__PXVideoSession_playbackTimeRange__block_invoke;
  v8[3] = &unk_1E5DD0588;
  void v8[4] = self;
  void v8[5] = &v9;
  dispatch_sync(stateQueue, v8);
  long long v5 = v10;
  long long v6 = *((_OWORD *)v10 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v10 + 2);
  *(_OWORD *)&retstr->var0.int64_t var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

__n128 __35__PXVideoSession_playbackTimeRange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v3 = *(_OWORD *)(*(void *)(a1 + 32) + 420);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 436);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 404);
  *(_OWORD *)(v1 + 48) = v3;
  *(__n128 *)(v1 + 64) = result;
  return result;
}

- (void)setLoopingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PXVideoSession_setLoopingEnabled___block_invoke;
  void v7[3] = &unk_1E5DCFE98;
  void v7[4] = self;
  BOOL v8 = a3;
  dispatch_sync(stateQueue, v7);
  long long v6 = [(PXVideoSession *)self videoPlayer];
  [v6 setLoopingEnabled:v3];
}

uint64_t __36__PXVideoSession_setLoopingEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 402) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isLoopingEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PXVideoSession_isLoopingEnabled__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__PXVideoSession_isLoopingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 402);
  return result;
}

- (BOOL)preventsSleepDuringVideoPlayback
{
  unint64_t v2 = [(PXVideoSession *)self videoPlayer];
  char v3 = [v2 preventsSleepDuringVideoPlayback];

  return v3;
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXVideoSession *)self videoPlayer];
  [v4 setPreventsSleepDuringVideoPlayback:v3];
}

- (float)volume
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__PXVideoSession_volume__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __24__PXVideoSession_volume__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 476);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setVolume:(float)a3 withFade:(BOOL)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PXVideoSession_setVolume_withFade___block_invoke;
  block[3] = &unk_1E5DCCC50;
  float v8 = a3;
  BOOL v9 = a4;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__PXVideoSession_setVolume_withFade___block_invoke_348;
    v6[3] = &unk_1E5DD0FA8;
    void v6[4] = self;
    [(PXVideoSession *)self _performChanges:v6];
  }
  _Block_object_dispose(&v10, 8);
}

float __37__PXVideoSession_setVolume_withFade___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  float result = *(float *)(v2 + 476);
  if (result != *(float *)(a1 + 48) || *(unsigned __int8 *)(v2 + 480) != *(unsigned __int8 *)(a1 + 52))
  {
    id v4 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = *(float *)(*(void *)(a1 + 32) + 476);
      double v6 = *(float *)(a1 + 48);
      int v7 = *(unsigned __int8 *)(a1 + 52);
      int v8 = 134218496;
      double v9 = v5;
      __int16 v10 = 2048;
      double v11 = v6;
      __int16 v12 = 1024;
      int v13 = v7;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Beginning volume change from %f to %f. Will fade: %d", (uint8_t *)&v8, 0x1Cu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    float result = *(float *)(a1 + 48);
    *(float *)(*(void *)(a1 + 32) + 476) = result;
    *(unsigned char *)(*(void *)(a1 + 32) + 480) = *(unsigned char *)(a1 + 52);
  }
  return result;
}

void __37__PXVideoSession_setVolume_withFade___block_invoke_348(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 0x40) != 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    double v5 = [NSString stringWithUTF8String:"-[PXVideoSession setVolume:withFade:]_block_invoke"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 1636, @"invalidating %lu after it already has been updated", 0x4000);

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x4000uLL;
}

- (void)setUpdatingAudioSession:(BOOL)a3
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXVideoSession_setUpdatingAudioSession___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v8 = a3;
  void block[4] = self;
  void block[5] = &v9;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v10 + 24) && !a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__PXVideoSession_setUpdatingAudioSession___block_invoke_2;
    v6[3] = &unk_1E5DD0FA8;
    void v6[4] = self;
    [(PXVideoSession *)self _performChanges:v6];
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __42__PXVideoSession_setUpdatingAudioSession___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 240) != v2)
  {
    *(unsigned char *)(v1 + 240) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __42__PXVideoSession_setUpdatingAudioSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 688) & 0x40) != 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    double v5 = [NSString stringWithUTF8String:"-[PXVideoSession setUpdatingAudioSession:]_block_invoke_2"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 1619, @"invalidating %lu after it already has been updated", 64);

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x40uLL;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3810000000;
  __int16 v10 = &unk_1AB5D584F;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PXVideoSession_currentTime__block_invoke;
  block[3] = &unk_1E5DD0588;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(stateQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __29__PXVideoSession_currentTime__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  int v2 = (__n128 *)(*(void *)(a1 + 32) + 588);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 604);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)setCurrentPlayerItem:(id)a3
{
  id v4 = a3;
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  stateQueue = self->_stateQueue;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __39__PXVideoSession_setCurrentPlayerItem___block_invoke;
  uint64_t v12 = &unk_1E5DCCA20;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = self;
  long long v15 = &v16;
  dispatch_sync(stateQueue, &block);
  if (*((unsigned char *)v17 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x400) != 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v8 = [NSString stringWithUTF8String:"-[PXVideoSession setCurrentPlayerItem:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXVideoSession.m", 1597, @"invalidating %lu after it already has been updated", 1024, block, v10, v11, v12);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x400uLL;
  }

  _Block_object_dispose(&v16, 8);
}

void __39__PXVideoSession_setCurrentPlayerItem___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 40) + 312);
  if (*(void **)(a1 + 32) != v1)
  {
    id v3 = v1;
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 312), *(id *)(a1 + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v4 = *(void **)(*(void *)(a1 + 40) + 256);
    if (v4)
    {
      id v5 = v4;
      id v6 = *(NSObject **)(*(void *)(a1 + 40) + 128);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      id v8[2] = __39__PXVideoSession_setCurrentPlayerItem___block_invoke_2;
      v8[3] = &unk_1E5DD32A8;
      id v9 = v3;
      id v10 = v5;
      id v7 = v5;
      dispatch_async(v6, v8);
    }
  }
}

uint64_t __39__PXVideoSession_setCurrentPlayerItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeOutput:*(void *)(a1 + 40)];
}

- (id)currentPlayerItem
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__257854;
  id v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PXVideoSession_currentPlayerItem__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__PXVideoSession_currentPlayerItem__block_invoke(uint64_t a1)
{
}

- (void)setVideoDuration:(id *)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PXVideoSession_setVideoDuration___block_invoke;
  block[3] = &unk_1E5DCCC28;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v9 + 24)) {
    [(PXVideoSession *)self signalChange:64];
  }
  _Block_object_dispose(&v8, 8);
}

__n128 __35__PXVideoSession_setVideoDuration___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 284;
  CMTime time1 = *(CMTime *)(a1 + 48);
  long long v3 = *(_OWORD *)v2;
  v6.epoch = *(void *)(v2 + 16);
  *(_OWORD *)&v6.value = v3;
  if (CMTimeCompare(&time1, &v6))
  {
    id v5 = (__n128 *)(*(void *)(a1 + 32) + 284);
    __n128 result = *(__n128 *)(a1 + 48);
    v5[1].n128_u64[0] = *(void *)(a1 + 64);
    __n128 *v5 = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_1AB5D584F;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PXVideoSession_videoDuration__block_invoke;
  block[3] = &unk_1E5DD0588;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(stateQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __31__PXVideoSession_videoDuration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 284);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 300);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)setIsVideoOutputReady:(BOOL)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PXVideoSession_setIsVideoOutputReady___block_invoke;
  v6[3] = &unk_1E5DCFE98;
  BOOL v7 = a3;
  void v6[4] = self;
  dispatch_sync(stateQueue, v6);
}

uint64_t __40__PXVideoSession_setIsVideoOutputReady___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 280))
  {
    *(unsigned char *)(v2 + 280) = v1;
    if (*(unsigned char *)(result + 40)) {
      return [*(id *)(*(void *)(result + 32) + 632) unlock];
    }
  }
  return result;
}

- (BOOL)isVideoOutputReady
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PXVideoSession_isVideoOutputReady__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__PXVideoSession_isVideoOutputReady__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 280);
  return result;
}

- (void)setVideoOutput:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  if (!v7) {
    [(PXVideoSession *)self _relinquishAny4k60StreamAllowance];
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__PXVideoSession_setVideoOutput_size___block_invoke;
  v10[3] = &unk_1E5DD05B0;
  v10[4] = self;
  id v11 = v7;
  CGFloat v12 = width;
  CGFloat v13 = height;
  id v9 = v7;
  dispatch_sync(stateQueue, v10);
}

void __38__PXVideoSession_setVideoOutput_size___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v1 = *(void **)(*(void *)(a1 + 32) + 256);
  if (v1 != *(void **)(a1 + 40))
  {
    id v3 = v1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 256), *(id *)(a1 + 40));
    *(_OWORD *)(*(void *)(a1 + 32) + 264) = *(_OWORD *)(a1 + 48);
    id v4 = [*(id *)(a1 + 32) log];
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        uint64_t v7 = [*(id *)(a1 + 32) logContext];
        uint64_t v8 = NSStringFromCGSize(*(CGSize *)(a1 + 48));
        *(_DWORD *)CMTimeRange buf = 134218242;
        uint64_t v12 = v7;
        __int16 v13 = 2112;
        uint64_t v14 = v8;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_EVENT, v6, "PXVideoSessionCreatedVideoOutput", "Context=%{signpost.telemetry:string2}lu outputSize=%@", buf, 0x16u);
      }
    }

    if (v3)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __38__PXVideoSession_setVideoOutput_size___block_invoke_345;
      v9[3] = &unk_1E5DD32A8;
      void v9[4] = *(void *)(a1 + 32);
      id v10 = v3;
      dispatch_async(MEMORY[0x1E4F14428], v9);
    }
  }
}

void __38__PXVideoSession_setVideoOutput_size___block_invoke_345(uint64_t a1)
{
  int v1 = *(NSObject **)(*(void *)(a1 + 32) + 128);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PXVideoSession_setVideoOutput_size___block_invoke_2;
  block[3] = &unk_1E5DD36F8;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __38__PXVideoSession_setVideoOutput_size___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) hash];
}

- (CGSize)videoOutputSize
{
  uint64_t v8 = 0;
  id v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  id v11 = &unk_1AB5D584F;
  long long v12 = *MEMORY[0x1E4F1DB30];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__PXVideoSession_videoOutputSize__block_invoke;
  void v7[3] = &unk_1E5DD0588;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

__n128 __33__PXVideoSession_videoOutputSize__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 264);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (AVPlayerItemVideoOutput)videoOutput
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__257854;
  uint64_t v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PXVideoSession_videoOutput__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVPlayerItemVideoOutput *)v3;
}

void __29__PXVideoSession_videoOutput__block_invoke(uint64_t a1)
{
}

- (void)_updateDuration
{
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  id v3 = [(PXVideoSession *)self videoPlayer];
  uint64_t v4 = [v3 currentItemStatus];

  if (v4 == 1)
  {
    double v5 = [(PXVideoSession *)self videoPlayer];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 currentItemDuration];
    }
    else
    {
      long long v9 = 0uLL;
      uint64_t v10 = 0;
    }
    long long v11 = v9;
    uint64_t v12 = v10;
  }
  long long v7 = v11;
  uint64_t v8 = v12;
  [(PXVideoSession *)self setVideoDuration:&v7];
}

- (void)incrementPixelBufferFrameDropsCount
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PXVideoSession_incrementPixelBufferFrameDropsCount__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__PXVideoSession_incrementPixelBufferFrameDropsCount__block_invoke(uint64_t result)
{
  return result;
}

- (int64_t)pixelBufferFrameDropsCount
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PXVideoSession_pixelBufferFrameDropsCount__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__PXVideoSession_pixelBufferFrameDropsCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 576);
  return result;
}

- (void)setCurrentPixelBuffer:(__CVBuffer *)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PXVideoSession_setCurrentPixelBuffer___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v8 + 24)) {
    [(PXVideoSession *)self signalChange:1024];
  }
  _Block_object_dispose(&v7, 8);
}

void __40__PXVideoSession_setCurrentPixelBuffer___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(__CVBuffer **)(a1 + 48);
  int64_t v3 = *(__CVBuffer **)(*(void *)(a1 + 32) + 560);
  if (v2 != v3)
  {
    CVPixelBufferRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 560) = CVPixelBufferRetain(*(CVPixelBufferRef *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v4 + 568))
    {
      *(unsigned char *)(v4 + 568) = 1;
      double v5 = [*(id *)(a1 + 32) log];
      os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          uint64_t v8 = [*(id *)(a1 + 32) logContext];
          int v9 = 134217984;
          uint64_t v10 = v8;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_EVENT, v7, "PXVideoSessionGotFirstPixelBuffer", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v9, 0xCu);
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (__CVBuffer)currentPixelBuffer
{
  uint64_t v6 = 0;
  os_signpost_id_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PXVideoSession_currentPixelBuffer__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = (__CVBuffer *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

__CVBuffer *__36__PXVideoSession_currentPixelBuffer__block_invoke(uint64_t a1)
{
  __n128 result = *(__CVBuffer **)(*(void *)(a1 + 32) + 560);
  if (result)
  {
    CVPixelBufferRef v3 = CVPixelBufferRetain(result);
    __n128 result = (__CVBuffer *)CFAutorelease(v3);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_mainQueue_setDisplayLink:(id)a3
{
  os_signpost_id_t v7 = (PXDisplayLink *)a3;
  p_mainQueue_displayLink = &self->_mainQueue_displayLink;
  uint64_t v6 = self->_mainQueue_displayLink;
  if (v6 != v7)
  {
    if (v6) {
      [(PXDisplayLink *)v6 invalidate];
    }
    objc_storeStrong((id *)p_mainQueue_displayLink, a3);
  }
}

- (void)_mainQueue_setDisplayLinkPaused:(BOOL)a3
{
}

- (void)_updateDisplayLinkState
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  unint64_t v3 = [(PXVideoSession *)self pixelBufferOutputTokenCount];
  BOOL v4 = [(PXVideoSession *)self shouldDisableAutomaticPixelBufferUpdates];
  if (v3) {
    char v5 = v4;
  }
  else {
    char v5 = 1;
  }
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  char v7 = v5;
  px_dispatch_on_main_queue();
}

void __41__PXVideoSession__updateDisplayLinkState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_setDisplayLinkPaused:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_videoWorkQueue_updateCurrentPixelBufferWithVideoOutput:(id)a3 outputTime:(double)a4
{
  id v6 = a3;
  if (![(PXVideoSession *)self shouldDisableAutomaticPixelBufferUpdates])
  {
    if (v6)
    {
      kdebug_trace();
      long long v15 = 0uLL;
      uint64_t v16 = 0;
      [v6 itemTimeForHostTime:a4];
      long long v13 = v15;
      uint64_t v14 = v16;
      if (![v6 hasNewPixelBufferForItemTime:&v13]) {
        goto LABEL_11;
      }
      long long v13 = v15;
      uint64_t v14 = v16;
      char v7 = (__CVBuffer *)[v6 copyPixelBufferForItemTime:&v13 itemTimeForDisplay:0];
      if (v7)
      {
        uint64_t v8 = [(PXPhotosensitivityProcessing *)self->_photoSensitivityProcessing copyAndProcessPixelBuffer:v7 timestamp:a4];
        uint64_t v9 = v7;
        if (v8)
        {
          uint64_t v10 = v8;
          CVPixelBufferRelease(v7);
          uint64_t v9 = v10;
        }
        CVPixelBufferGetWidth(v9);
        CVPixelBufferGetHeight(v9);
      }
      else
      {
        uint64_t v9 = 0;
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __85__PXVideoSession__videoWorkQueue_updateCurrentPixelBufferWithVideoOutput_outputTime___block_invoke;
      v12[3] = &unk_1E5DD09C8;
      v12[4] = self;
      v12[5] = v9;
      [(PXVideoSession *)self _performChanges:v12];
      if (!v7)
      {
LABEL_11:
        if ([(PXVideoSession *)self desiredPlayState] == 1) {
          [(PXVideoSession *)self incrementPixelBufferFrameDropsCount];
        }
      }
      kdebug_trace();
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __85__PXVideoSession__videoWorkQueue_updateCurrentPixelBufferWithVideoOutput_outputTime___block_invoke_2;
      v11[3] = &unk_1E5DD0FA8;
      void v11[4] = self;
      [(PXVideoSession *)self _performChanges:v11];
    }
  }
}

void __85__PXVideoSession__videoWorkQueue_updateCurrentPixelBufferWithVideoOutput_outputTime___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentPixelBuffer:*(void *)(a1 + 40)];
  uint64_t v2 = *(__CVBuffer **)(a1 + 40);
  CVPixelBufferRelease(v2);
}

uint64_t __85__PXVideoSession__videoWorkQueue_updateCurrentPixelBufferWithVideoOutput_outputTime___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentPixelBuffer:0];
}

- (void)_mainQueue_updateCurrentPixelBufferWithVideoOutput:(id)a3
{
  id v4 = a3;
  [(PXDisplayLink *)self->_mainQueue_displayLink targetTimestamp];
  id v6 = v5;
  objc_initWeak(&location, self);
  videoWorkQueue = self->_videoWorkQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__PXVideoSession__mainQueue_updateCurrentPixelBufferWithVideoOutput___block_invoke;
  v9[3] = &unk_1E5DCCBD8;
  objc_copyWeak(v11, &location);
  id v10 = v4;
  v11[1] = v6;
  id v8 = v4;
  dispatch_async(videoWorkQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __69__PXVideoSession__mainQueue_updateCurrentPixelBufferWithVideoOutput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_videoWorkQueue_updateCurrentPixelBufferWithVideoOutput:outputTime:", *(void *)(a1 + 32), *(double *)(a1 + 48));
}

- (void)_updateCurrentPixelBuffer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(PXVideoSession *)self _assertOnUpdateQueue];
  if (![(PXVideoSession *)self shouldDisableAutomaticPixelBufferUpdates])
  {
    if (self->_updateQueue_pendingPlayerItemSeekCount < 1)
    {
      id v8 = [(PXVideoSession *)self videoOutput];
      objc_initWeak((id *)buf, self);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __43__PXVideoSession__updateCurrentPixelBuffer__block_invoke;
      v10[3] = &unk_1E5DD20C8;
      objc_copyWeak(&v12, (id *)buf);
      id v11 = v8;
      id v9 = v8;
      dispatch_async(MEMORY[0x1E4F14428], v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      unint64_t v3 = [(PXVideoSession *)self log];
      os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v5 = v4;
        if (os_signpost_enabled(v3))
        {
          uint64_t v6 = [(PXVideoSession *)self logContext];
          int64_t updateQueue_pendingPlayerItemSeekCount = self->_updateQueue_pendingPlayerItemSeekCount;
          *(_DWORD *)CMTimeRange buf = 134218240;
          uint64_t v14 = v6;
          __int16 v15 = 2048;
          int64_t v16 = updateQueue_pendingPlayerItemSeekCount;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_EVENT, v5, "PXVideoSessionSkippedUpdatingPixelBuffer", "Context=%{signpost.telemetry:string2}lu pendingPlayerItemSeekCount=%ld", buf, 0x16u);
        }
      }
    }
  }
}

void __43__PXVideoSession__updateCurrentPixelBuffer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_mainQueue_updateCurrentPixelBufferWithVideoOutput:", *(void *)(a1 + 32));
}

- (void)_addOutput:(id)a3 toPlayerItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PXVideoSession *)self videoOutput];
  if (v7 == v9)
  {
    id v8 = [(PXVideoSession *)self playerItem];

    if (v8 == v6)
    {
      [v6 addOutput:v9];
      [v9 requestNotificationOfMediaDataChangeWithAdvanceInterval:0.1];
    }
  }
  else
  {
  }
}

- (void)_updateVideoOutput
{
  v45[10] = *MEMORY[0x1E4F143B8];
  [(PXVideoSession *)self _assertOnUpdateQueue];
  unint64_t v3 = [(PXVideoSession *)self playerItem];
  if (v3)
  {
    unint64_t v4 = [(PXVideoSession *)self pixelBufferOutputTokenCount];
    os_signpost_id_t v5 = [(PXVideoSession *)self videoOutput];
    if (v4)
    {
      id v6 = [(PXVideoSession *)self pixelBufferOutputSizes];
      [(PXVideoSession *)self naturalSize];
      double v8 = v7;
      double v10 = v9;
      [(PXVideoSession *)self nominalFrameRate];
      float v12 = v11;
      long long v13 = [v6 firstObject];
      [v13 CGSizeValue];
      double v15 = v14;
      double v17 = v16;

      if ([v6 count])
      {
        [v6 objectAtIndexedSubscript:0];
        [(id)objc_claimAutoreleasedReturnValue() CGSizeValue];
        PXSizeMax();
      }
      double v18 = *MEMORY[0x1E4F1DB30];
      double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      BOOL v20 = v17 == v19 && v15 == *MEMORY[0x1E4F1DB30];
      if (v5)
      {
        [(PXVideoSession *)self videoOutputSize];
        PXSizeApproximatelyEqualOrBiggerThanSize();
      }
      int v21 = MEMORY[0x1AD10BB40](v15, v17, 2000.0, 2000.0);
      if (v20)
      {
        if (v12 == 0.0) {
          char v22 = v21;
        }
        else {
          char v22 = 0;
        }
        if ((v22 & 1) == 0)
        {
          uint64_t v23 = *MEMORY[0x1E4F24D20];
          v44[0] = *MEMORY[0x1E4F24D40];
          v44[1] = v23;
          v45[0] = MEMORY[0x1E4F1CC38];
          v45[1] = MEMORY[0x1E4F1CC08];
          uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
          BOOL v31 = [(PXVideoSession *)self isExpectingVideoView];
          v32 = (void *)MEMORY[0x1E4F24D70];
          if (v31)
          {
            if (_deviceSupportsIOSurfaceCompression_onceToken != -1) {
              dispatch_once(&_deviceSupportsIOSurfaceCompression_onceToken, &__block_literal_global_969);
            }
            if (_deviceSupportsIOSurfaceCompression__supportsIOSurfaceCompression == 1)
            {
              uint64_t v33 = (void *)[v24 mutableCopy];
              [v33 setObject:&unk_1F02D5560 forKeyedSubscript:*v32];
              uint64_t v34 = [v33 copy];

              uint64_t v24 = (void *)v34;
            }
          }
          uint64_t v35 = [v24 objectForKeyedSubscript:*v32];

          if (!v35)
          {
            [v24 mutableCopy];
            PXGSupportedPixelBufferFormats();
          }
          uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F16648]) initWithOutputSettings:v24];
          [v36 setDelegate:self queue:0];
          -[PXVideoSession setVideoOutput:size:](self, "setVideoOutput:size:", v36, v15, v17);
          objc_initWeak(&location, self);
          videoWorkQueue = self->_videoWorkQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __36__PXVideoSession__updateVideoOutput__block_invoke;
          block[3] = &unk_1E5DD2548;
          objc_copyWeak(&v42, &location);
          id v40 = v36;
          id v41 = v3;
          id v38 = v36;
          dispatch_async(videoWorkQueue, block);

          objc_destroyWeak(&v42);
          objc_destroyWeak(&location);
        }
      }
      else if (v8 != v18 || v10 != v19)
      {
        char v26 = v12 == 0.0 ? v21 : 0;
        if ((v26 & 1) == 0)
        {
          BOOL v27 = v12 <= 50.0;
          double v28 = v15;
          double v29 = v17;
          if (!v27)
          {
            double v28 = v15;
            double v29 = v17;
            if ((v21 & MEMORY[0x1AD10BB40](v8, v10, 2000.0, 2000.0)) == 1)
            {
              BOOL v30 = [(PXVideoSession *)self _request4k60StreamAllowance];
              if (v30) {
                double v28 = v15;
              }
              else {
                double v28 = 1920.0;
              }
              if (v30) {
                double v29 = v17;
              }
              else {
                double v29 = 1080.0;
              }
            }
          }
          if (MEMORY[0x1AD10BB40](v8, v10, v28, v29)) {
            PXSizeGetAspectRatio();
          }
          PXSizeRoundToEven();
        }
      }
      px_dispatch_on_main_queue();
    }
  }
  else
  {
    os_signpost_id_t v5 = [(PXVideoSession *)self videoOutput];
  }
  if ([(PXVideoSession *)self playState] != 3)
  {
    [(PXVideoSession *)self _removeAllVideoOutputs];
    -[PXVideoSession setVideoOutput:size:](self, "setVideoOutput:size:", 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [(PXVideoSession *)self setIsVideoOutputReady:0];
    px_dispatch_on_main_queue();
  }
}

void __36__PXVideoSession__updateVideoOutput__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _addOutput:*(void *)(a1 + 32) toPlayerItem:*(void *)(a1 + 40)];
}

void __36__PXVideoSession__updateVideoOutput__block_invoke_2(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 768))
  {
    id v2 = (id)[objc_alloc((Class)off_1E5DA6208) initWithWeakTarget:*(void *)(a1 + 32) selector:sel__handleDisplayLink_];
    [v2 setPaused:1];
    objc_msgSend(*(id *)(a1 + 32), "_mainQueue_setDisplayLink:", v2);
  }
}

uint64_t __36__PXVideoSession__updateVideoOutput__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_setDisplayLink:", 0);
}

- (void)_handleDisplayLink:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__PXVideoSession__handleDisplayLink___block_invoke;
  _OWORD v3[3] = &unk_1E5DD0FA8;
  void v3[4] = self;
  [(PXVideoSession *)self _performChanges:v3];
}

void __37__PXVideoSession__handleDisplayLink___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 8) != 0)
  {
    unint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    os_signpost_id_t v5 = [NSString stringWithUTF8String:"-[PXVideoSession _handleDisplayLink:]_block_invoke"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 1192, @"invalidating %lu after it already has been updated", 2048);

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x800uLL;
}

- (id)_newVideoView
{
  id v3 = objc_alloc_init(PXVideoView);
  unint64_t v4 = [(PXVideoSession *)self videoPlayer];
  if (v4)
  {
    [(PXVideoView *)v3 setPlayer:v4];
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    double v8 = __31__PXVideoSession__newVideoView__block_invoke;
    double v9 = &unk_1E5DD32A8;
    double v10 = v3;
    float v11 = self;
    [(PXVideoSession *)self _performBlockOnUpdateQueue:&v6];
  }
  -[PXVideoView setVideoGravity:](v3, "setVideoGravity:", *MEMORY[0x1E4F15AF8], v6, v7, v8, v9);
  objc_setAssociatedObject(v3, (const void *)VideoViewSessionKey, self, 0);

  return v3;
}

void __31__PXVideoSession__newVideoView__block_invoke(uint64_t a1)
{
}

void __31__PXVideoSession__newVideoView__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) videoPlayer];
  [*(id *)(a1 + 32) setPlayer:v2];
}

- (void)setPlaybackTimeRangeEndBoundaryObserver:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PXVideoSession_setPlaybackTimeRangeEndBoundaryObserver___block_invoke;
  void v7[3] = &unk_1E5DD32A8;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __58__PXVideoSession_setPlaybackTimeRangeEndBoundaryObserver___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  id v2 = (id *)(*(void *)(a1 + 40) + 192);
  if (v1 != *v2) {
    objc_storeStrong(v2, v1);
  }
}

- (id)playbackTimeRangeEndBoundaryObserver
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__257854;
  double v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PXVideoSession_playbackTimeRangeEndBoundaryObserver__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__PXVideoSession_playbackTimeRangeEndBoundaryObserver__block_invoke(uint64_t a1)
{
}

- (void)_didFinishInitializingAudioSession
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PXVideoSession__didFinishInitializingAudioSession__block_invoke;
  _OWORD v3[3] = &unk_1E5DD0FA8;
  void v3[4] = self;
  [(PXVideoSession *)self _performChanges:v3];
}

void __52__PXVideoSession__didFinishInitializingAudioSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 712) = 1;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 0x10) != 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    os_signpost_id_t v5 = [NSString stringWithUTF8String:"-[PXVideoSession _didFinishInitializingAudioSession]_block_invoke"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 1150, @"invalidating %lu after it already has been updated", 4096);

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x1000uLL;
}

- (void)_audioSessionQueue_initializeAudioSession
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  os_signpost_id_t v5 = [MEMORY[0x1E4F8EBC8] auxiliarySession];
  uint64_t v6 = [(PXVideoSession *)self audioSessionCategory];
  uint64_t v7 = [(PXVideoSession *)self audioSessionMode];
  id v17 = 0;
  char v8 = objc_msgSend(v5, "setCategory:mode:routeSharingPolicy:options:error:", v6, v7, -[PXVideoSession audioSessionRouteSharingPolicy](self, "audioSessionRouteSharingPolicy"), -[PXVideoSession audioSessionCategoryOptions](self, "audioSessionCategoryOptions"), &v17);
  id v9 = v17;

  if ((v8 & 1) == 0)
  {
    double v10 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Unable to configure audio session for video playback. Error: %@", buf, 0xCu);
    }
  }
  [(PXVideoSession *)self setAudioSession:v5];
  id v11 = [(PXVideoSession *)self videoPlayer];
  [v11 setWrappedAudioSession:v5];

  double v12 = CFAbsoluteTimeGetCurrent();
  long long v13 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = NSStringFromSelector(a2);
    *(_DWORD *)CMTimeRange buf = 138412546;
    id v19 = v14;
    __int16 v20 = 2048;
    double v21 = v12 - Current;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Configured AVAudioSession in %@ in %f seconds.", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  [v5 registerVolumeObserver:self];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __59__PXVideoSession__audioSessionQueue_initializeAudioSession__block_invoke;
  v15[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v16, (id *)buf);
  [(PXVideoSession *)self _performBlockOnUpdateQueue:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __59__PXVideoSession__audioSessionQueue_initializeAudioSession__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didFinishInitializingAudioSession];
}

- (void)_updateFromCurrentPresentationState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__257854;
  double v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PXVideoSession__updateFromCurrentPresentationState__block_invoke;
  block[3] = &unk_1E5DD0588;
  void block[4] = self;
  void block[5] = &v6;
  dispatch_sync(stateQueue, block);
  if (v7[5])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__PXVideoSession__updateFromCurrentPresentationState__block_invoke_2;
    v4[3] = &unk_1E5DCCC00;
    void v4[4] = self;
    void v4[5] = &v6;
    [(PXVideoSession *)self _performChanges:v4];
  }
  _Block_object_dispose(&v6, 8);
}

void __53__PXVideoSession__updateFromCurrentPresentationState__block_invoke(uint64_t a1)
{
  uint64_t v2 = 1;
  do
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 160);
    id v4 = [NSNumber numberWithInteger:v2];
    os_signpost_id_t v5 = [v3 objectForKeyedSubscript:v4];
    uint64_t v6 = [v5 lastObject];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v2 == 0;
    }
    --v2;
  }
  while (!v9);
}

void __53__PXVideoSession__updateFromCurrentPresentationState__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLoopingEnabled:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "isLoopingEnabled"));
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) volume];
  int v4 = v3;
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) shouldFadeVolumeChange];
  LODWORD(v6) = v4;
  [v2 setVolume:v5 withFade:v6];
  objc_msgSend(*(id *)(a1 + 32), "setPreventsSleepDuringVideoPlayback:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "preventsSleepDuringVideoPlayback"));
  objc_msgSend(*(id *)(a1 + 32), "setSeekToBeginningAtEnd:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "seekToBeginningAtEnd"));
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v7)
  {
    [v7 playbackTimeRange];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
  }
  uint64_t v8 = *(void **)(a1 + 32);
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  [v8 setPlaybackTimeRange:v18];
  BOOL v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v9)
  {
    [v9 playbackStartTime];
  }
  else
  {
    long long v16 = 0uLL;
    uint64_t v17 = 0;
  }
  double v10 = *(void **)(a1 + 32);
  long long v14 = v16;
  uint64_t v15 = v17;
  [v10 setPlaybackStartTime:&v14];
  objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "desiredPlayState"));
  objc_msgSend(*(id *)(a1 + 32), "setAllowsExternalPlayback:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "allowsExternalPlayback"));
  objc_msgSend(*(id *)(a1 + 32), "setShouldDisableAutomaticPixelBufferUpdates:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "shouldDisableAutomaticPixelBufferUpdates"));
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) desiredPlaybackRate];
  objc_msgSend(*(id *)(a1 + 32), "setDesiredPlaybackRate:");
  id v11 = *(void **)(a1 + 32);
  double v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) audioSessionCategory];
  long long v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) audioSessionMode];
  objc_msgSend(v11, "setAudioSessionCategory:mode:routeSharingPolicy:options:", v12, v13, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "audioSessionRouteSharingPolicy"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "audioSessionCategoryOptions"));
}

- (void)_handleContentLoadingResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PXVideoSession__handleContentLoadingResult___block_invoke;
  v6[3] = &unk_1E5DD0328;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(PXVideoSession *)self _performChanges:v6];
}

void __46__PXVideoSession__handleContentLoadingResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) playerItem];

  if (v4)
  {
    [*(id *)(*(void *)(a1 + 40) + 752) reportAVAssetCreated];
    id v5 = *(void **)(*(void *)(a1 + 40) + 752);
    double v6 = [*(id *)(a1 + 32) playerItem];
    [v5 addEndpointWithPlayerItem:v6];
  }
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) playerItem];
  BOOL v9 = *(void **)(a1 + 32);
  if (v9)
  {
    [v9 timeRange];
    BOOL v9 = *(void **)(a1 + 32);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  double v10 = [v9 timeRangeMapper];
  [v7 setPlayerItem:v8 segmentTimeRangeOfOriginalVideo:v13 timeRangeMapper:v10];

  if (*(unsigned char *)(*(void *)(a1 + 40) + 696) && (*(unsigned char *)(*(void *)(a1 + 40) + 688) & 0x40) != 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    double v12 = [NSString stringWithUTF8String:"-[PXVideoSession _handleContentLoadingResult:]_block_invoke"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXVideoSession.m", 1090, @"invalidating %lu after it already has been updated", 64);

    abort();
  }
  *(void *)(*(void *)(a1 + 40) + 680) |= 0x40uLL;
}

- (void)_rebuildAVObjects
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CMTimeRange buf = 138412290;
    double v6 = self;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_ERROR, "Rebuilding AV Objects for %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__PXVideoSession__rebuildAVObjects__block_invoke;
  v4[3] = &unk_1E5DD0FA8;
  void v4[4] = self;
  [(PXVideoSession *)self _performChanges:v4];
}

void __35__PXVideoSession__rebuildAVObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v5[0] = *MEMORY[0x1E4F1FA20];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  [v2 setPlayerItem:0 segmentTimeRangeOfOriginalVideo:v5 timeRangeMapper:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F8EBD0]);
  [*(id *)(a1 + 32) setVideoPlayer:v4];
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  id v4 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Received AV resource reclamation event.", v5, 2u);
  }

  [(PXVideoSession *)self _rebuildAVObjects];
}

- (void)wrappedAudioSession:(id)a3 didChangeVolumeFrom:(float)a4 to:(float)a5
{
  id v10 = [(PXVideoSession *)self delegate];
  *(float *)&double v8 = a4;
  *(float *)&double v9 = a5;
  [v10 videoSessionAudioSessionOutputVolumeDidChange:self fromVolume:v8 toVolume:v9];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)VideoPlayerObservationContext == a5)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __47__PXVideoSession_observable_didChange_context___block_invoke;
    uint64_t v23 = &unk_1E5DD09C8;
    uint64_t v24 = self;
    unint64_t v25 = a4;
    id v10 = &v20;
LABEL_6:
    -[PXVideoSession _performChanges:](self, "_performChanges:", v10, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_7;
  }
  if ((void *)VideoContentProviderObservationContext_257929 != a5)
  {
    if ((void *)VolumeAnimatorObservationContext != a5)
    {
      long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PXVideoSession.m" lineNumber:1056 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __47__PXVideoSession_observable_didChange_context___block_invoke_2;
    uint64_t v17 = &unk_1E5DD09C8;
    double v18 = self;
    unint64_t v19 = a4;
    id v10 = &v14;
    goto LABEL_6;
  }
  if (a4)
  {
    id v11 = [(PXVideoSession *)self contentProvider];
    double v12 = [v11 loadingResult];
    [(PXVideoSession *)self _handleContentLoadingResult:v12];
  }
LABEL_7:
}

void __47__PXVideoSession_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(void *)(*(void *)(a1 + 32) + 688) & 0x10040) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXVideoSession observable:didChange:context:]_block_invoke"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXVideoSession.m", 1030, @"invalidating %lu after it already has been updated", 65600);
      goto LABEL_29;
    }
    *(void *)(*(void *)(a1 + 32) + 680) |= 0x10040uLL;
  }
  if ((v4 & 4) != 0)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(void *)(*(void *)(a1 + 32) + 688) & 0x20060) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXVideoSession observable:didChange:context:]_block_invoke"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXVideoSession.m", 1033, @"invalidating %lu after it already has been updated", 131168);
      goto LABEL_29;
    }
    *(void *)(*(void *)(a1 + 32) + 680) |= 0x20060uLL;
  }
  if ((v4 & 0x4000) != 0)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 688) & 8) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXVideoSession observable:didChange:context:]_block_invoke"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXVideoSession.m", 1036, @"invalidating %lu after it already has been updated", 8);
      goto LABEL_29;
    }
    *(void *)(*(void *)(a1 + 32) + 680) |= 8uLL;
  }
  if ((v4 & 0x10) == 0) {
    goto LABEL_17;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(void *)(*(void *)(a1 + 32) + 688) & 0x10054) != 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[PXVideoSession observable:didChange:context:]_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXVideoSession.m", 1039, @"invalidating %lu after it already has been updated", 65620);
LABEL_29:

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x10054uLL;
LABEL_17:
  if ((v4 & 0x1C0) == 0) {
    goto LABEL_21;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 688) & 0x20) != 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[PXVideoSession observable:didChange:context:]_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXVideoSession.m", 1042, @"invalidating %lu after it already has been updated", 32);
    goto LABEL_29;
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x20uLL;
LABEL_21:
}

void __47__PXVideoSession_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned char *)(a1 + 40) & 2) != 0)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 0x80) != 0)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = [NSString stringWithUTF8String:"-[PXVideoSession observable:didChange:context:]_block_invoke_2"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 1052, @"invalidating %lu after it already has been updated", 0x8000);

      abort();
    }
    *(void *)(*(void *)(a1 + 32) + 680) |= 0x8000uLL;
  }
}

- (void)avPlayer:(id)a3 itemDidPlayToEnd:(id)a4
{
  id v5 = a3;
  id v6 = [(PXVideoSession *)self videoPlayer];

  if (v6 == v5)
  {
    uint64_t v7 = [(PXVideoSession *)self delegate];
    [v7 videoSessionDidPlayToEnd:self];

    [(PXVideoSession *)self playbackTimeRange];
    if ((v17 & 1) == 0
      || ([(PXVideoSession *)self playbackTimeRange], (v16 & 1) == 0)
      || ([(PXVideoSession *)self playbackTimeRange], v15)
      || ([(PXVideoSession *)self playbackTimeRange], v14 < 0))
    {
      if ([(PXVideoSession *)self seekToBeginningAtEnd])
      {
        long long v12 = *MEMORY[0x1E4F1FA48];
        uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        long long v10 = v12;
        uint64_t v11 = v13;
        long long v8 = v12;
        uint64_t v9 = v13;
        [v5 seekToTime:&v12 toleranceBefore:&v10 toleranceAfter:&v8 completionHandler:0];
      }
    }
  }
}

- (void)outputMediaDataWillChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PXVideoSession_outputMediaDataWillChange___block_invoke;
  _OWORD v3[3] = &unk_1E5DD0FA8;
  void v3[4] = self;
  [(PXVideoSession *)self _performChanges:v3];
}

void __44__PXVideoSession_outputMediaDataWillChange___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setIsVideoOutputReady:1];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 0x20) != 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXVideoSession outputMediaDataWillChange:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PXVideoSession.m", 1007, @"invalidating %lu after it already has been updated", 0x2000);

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x2000uLL;
}

- (void)didPerformChanges
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  v60.receiver = self;
  v60.super_class = (Class)PXVideoSession;
  [(PXVideoSession *)&v60 didPerformChanges];
  p_updateQueue_updateFlags = &self->_updateQueue_updateFlags;
  self->_updateQueue_updateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateQueue_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v23 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v22 handleFailureInFunction:v23, @"PXVideoSession.m", 939, @"Invalid parameter not satisfying: %@", @"!_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateQueue_updateFlags->needsUpdate;
    }
    self->_updateQueue_updateFlags.isPerformingUpdate = 1;
    self->_updateQueue_updateFlags.updated = 1;
    if (needsUpdate)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXVideoSession *)self _updatePlayerItem];
      if (!self->_updateQueue_updateFlags.isPerformingUpdate)
      {
        v58 = [MEMORY[0x1E4F28B00] currentHandler];
        v59 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
        [v58 handleFailureInFunction:v59, @"PXVideoSession.m", 944, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXVideoSession *)self _updatePlayability];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v25 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v24 handleFailureInFunction:v25, @"PXVideoSession.m", 947, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXVideoSession *)self _updateDuration];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      char v26 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v27 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v26 handleFailureInFunction:v27, @"PXVideoSession.m", 950, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXVideoSession *)self _updateAudioStatus];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      double v28 = [MEMORY[0x1E4F28B00] currentHandler];
      double v29 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v28 handleFailureInFunction:v29, @"PXVideoSession.m", 953, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXVideoSession *)self _updateTrackGeometry];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      BOOL v30 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v31 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v30 handleFailureInFunction:v31, @"PXVideoSession.m", 956, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x20uLL;
    if ((v9 & 0x20) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXVideoSession *)self _updateBuffering];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v33 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v32 handleFailureInFunction:v33, @"PXVideoSession.m", 959, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v10 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x40uLL;
    if ((v10 & 0x40) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFFBFLL;
      [(PXVideoSession *)self _updatePlayState];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v34 handleFailureInFunction:v35, @"PXVideoSession.m", 962, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v11 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x80uLL;
    if ((v11 & 0x80) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFF7FLL;
      [(PXVideoSession *)self _updateStalled];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v37 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v36 handleFailureInFunction:v37, @"PXVideoSession.m", 965, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v12 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x100uLL;
    if ((v12 & 0x100) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFFEFFLL;
      [(PXVideoSession *)self _updateAtBeginningOrEnd];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      id v38 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v39 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v38 handleFailureInFunction:v39, @"PXVideoSession.m", 968, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v13 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x200uLL;
    if ((v13 & 0x200) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v13 & 0xFFFFFFFFFFFFFDFFLL;
      [(PXVideoSession *)self _updateAVPlayerPlayState];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      id v40 = [MEMORY[0x1E4F28B00] currentHandler];
      id v41 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v40 handleFailureInFunction:v41, @"PXVideoSession.m", 971, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v14 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x20000uLL;
    if ((v14 & 0x20000) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v14 & 0xFFFFFFFFFFFDFFFFLL;
      [(PXVideoSession *)self _updateCurrentPlayerItem];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      id v42 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v43 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v42 handleFailureInFunction:v43, @"PXVideoSession.m", 974, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v15 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x400uLL;
    if ((v15 & 0x400) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v15 & 0xFFFFFFFFFFFFFBFFLL;
      [(PXVideoSession *)self _updateVideoOutput];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      int64_t v44 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v45 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v44 handleFailureInFunction:v45, @"PXVideoSession.m", 977, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v16 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x800uLL;
    if ((v16 & 0x800) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v16 & 0xFFFFFFFFFFFFF7FFLL;
      [(PXVideoSession *)self _updateCurrentPixelBuffer];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v47 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v46 handleFailureInFunction:v47, @"PXVideoSession.m", 980, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v17 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x1000uLL;
    if ((v17 & 0x1000) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v17 & 0xFFFFFFFFFFFFEFFFLL;
      [(PXVideoSession *)self _updatePlayerItemInPlayer];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      v49 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v48 handleFailureInFunction:v49, @"PXVideoSession.m", 983, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v18 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x2000uLL;
    if ((v18 & 0x2000) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v18 & 0xFFFFFFFFFFFFDFFFLL;
      [(PXVideoSession *)self _updateDisplayLinkState];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      v51 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v50 handleFailureInFunction:v51, @"PXVideoSession.m", 986, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v19 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x4000uLL;
    if ((v19 & 0x4000) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v19 & 0xFFFFFFFFFFFFBFFFLL;
      [(PXVideoSession *)self _updateVolumeAnimator];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v52 handleFailureInFunction:v53, @"PXVideoSession.m", 989, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v20 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x8000uLL;
    if ((v20 & 0x8000) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v20 & 0xFFFFFFFFFFFF7FFFLL;
      [(PXVideoSession *)self _updatePlayerVolume];
    }
    if (!self->_updateQueue_updateFlags.isPerformingUpdate)
    {
      v54 = [MEMORY[0x1E4F28B00] currentHandler];
      v55 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      [v54 handleFailureInFunction:v55, @"PXVideoSession.m", 992, @"Invalid parameter not satisfying: %@", @"_updateQueue_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v21 = p_updateQueue_updateFlags->needsUpdate;
    self->_updateQueue_updateFlags.updated |= 0x10000uLL;
    if ((v21 & 0x10000) != 0)
    {
      p_updateQueue_updateFlags->unint64_t needsUpdate = v21 & 0xFFFFFFFFFFFEFFFFLL;
      [(PXVideoSession *)self _updateReadyForSeeking];
      unint64_t v21 = p_updateQueue_updateFlags->needsUpdate;
    }
    self->_updateQueue_updateFlags.isPerformingUpdate = 0;
    if (v21)
    {
      v56 = [MEMORY[0x1E4F28B00] currentHandler];
      v57 = [NSString stringWithUTF8String:"-[PXVideoSession didPerformChanges]"];
      objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, @"PXVideoSession.m", 995, @"still needing to update %lu after update pass", p_updateQueue_updateFlags->needsUpdate);
    }
  }
}

- (void)_performChanges:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PXVideoSession__performChanges___block_invoke;
  v6[3] = &unk_1E5DD3280;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXVideoSession *)self _performBlockOnUpdateQueue:v6];
}

id __34__PXVideoSession__performChanges___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)PXVideoSession;
  return objc_msgSendSuper2(&v3, sel_performChanges_, v1);
}

- (void)performChanges:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = NSStringFromSelector(sel_performChanges_withPresentationContext_presenter_);
  [v6 handleFailureInMethod:a2, self, @"PXVideoSession.m", 926, @"Use %@ instead.", v7 object file lineNumber description];

  abort();
}

- (void)_updateQueue_unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  [(PXVideoSession *)self _assertOnUpdateQueue];
  v7.receiver = self;
  v7.super_class = (Class)PXVideoSession;
  [(PXVideoSession *)&v7 unregisterChangeObserver:v6 context:a4];
}

- (void)_updateQueue_registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  [(PXVideoSession *)self _assertOnUpdateQueue];
  v7.receiver = self;
  v7.super_class = (Class)PXVideoSession;
  [(PXVideoSession *)&v7 registerChangeObserver:v6 context:a4];
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __51__PXVideoSession_unregisterChangeObserver_context___block_invoke;
  v8[3] = &unk_1E5DCCBD8;
  objc_copyWeak(v10, &location);
  id v7 = v6;
  id v9 = v7;
  v10[1] = a4;
  [(PXVideoSession *)self _performBlockOnUpdateQueue:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __51__PXVideoSession_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateQueue_unregisterChangeObserver:context:", *(void *)(a1 + 32), *(void *)(a1 + 48));
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __49__PXVideoSession_registerChangeObserver_context___block_invoke;
  v8[3] = &unk_1E5DCCBD8;
  objc_copyWeak(v10, &location);
  id v7 = v6;
  id v9 = v7;
  v10[1] = a4;
  [(PXVideoSession *)self _performBlockOnUpdateQueue:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __49__PXVideoSession_registerChangeObserver_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateQueue_registerChangeObserver:context:", *(void *)(a1 + 32), *(void *)(a1 + 48));
}

- (void)setDesiredPlaybackRate:(double)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXVideoSession_setDesiredPlaybackRate___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  *(double *)&void block[6] = a3;
  void block[4] = self;
  void block[5] = &v9;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v10 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x200) != 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PXVideoSession setDesiredPlaybackRate:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXVideoSession.m", 895, @"invalidating %lu after it already has been updated", 512);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x200uLL;
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __41__PXVideoSession_setDesiredPlaybackRate___block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 48);
  if (v1 != *(double *)(*(void *)(result + 32) + 672))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(double *)(*(void *)(result + 32) + 672) = v1;
  }
  return result;
}

- (double)desiredPlaybackRate
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__PXVideoSession_desiredPlaybackRate__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __37__PXVideoSession_desiredPlaybackRate__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 672);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_relinquishAny4k60StreamAllowance
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  if (self->_sharedLock_has4k60Allowance)
  {
    self->_sharedLock_has4k60Allowance = 0;
    uint64_t v3 = sharedLock_totalVideoSessionsWith4kStreams--;
    if (v3 <= 0) {
      PXAssertGetLog();
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (BOOL)_request4k60StreamAllowance
{
  if (_request4k60StreamAllowance_onceToken != -1) {
    dispatch_once(&_request4k60StreamAllowance_onceToken, &__block_literal_global_257955);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  if (self->_sharedLock_has4k60Allowance)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v4 = sharedLock_totalVideoSessionsWith4kStreams;
    if (sharedLock_totalVideoSessionsWith4kStreams >= _request4k60StreamAllowance_maxConcurrent4k60Streams)
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v3 = 1;
      self->_sharedLock_has4k60Allowance = 1;
      sharedLock_totalVideoSessionsWith4kStreams = v4 + 1;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
  return v3;
}

void __45__PXVideoSession__request4k60StreamAllowance__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v2 = [v0 objectForKey:@"PXVideoSessionMaxConcurrent4k60Streams"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v1 = [v2 integerValue];
  }
  else {
    uint64_t v1 = 1;
  }
  _request4k60StreamAllowance_maxConcurrent4k60Streams = v1;
}

- (void)setAudioSession:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__PXVideoSession_setAudioSession___block_invoke;
  void v7[3] = &unk_1E5DD32A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __34__PXVideoSession_setAudioSession___block_invoke(uint64_t a1)
{
}

- (id)audioSession
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__257854;
  unint64_t v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__PXVideoSession_audioSession__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__PXVideoSession_audioSession__block_invoke(uint64_t a1)
{
}

- (void)setVideoPlayer:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  [(PXVideoSession *)self _assertOnUpdateQueue];
  stateQueue = self->_stateQueue;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __33__PXVideoSession_setVideoPlayer___block_invoke;
  char v12 = &unk_1E5DCCA20;
  id v6 = v4;
  id v13 = v6;
  unint64_t v14 = self;
  unint64_t v15 = &v16;
  dispatch_sync(stateQueue, &block);
  if (*((unsigned char *)v17 + 24))
  {
    [(PXVideoSession *)self signalChange:0x4000];
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x2924C) != 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXVideoSession setVideoPlayer:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXVideoSession.m", 821, @"invalidating %lu after it already has been updated", 168524, block, v10, v11, v12);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x2924CuLL;
  }

  _Block_object_dispose(&v16, 8);
}

void __33__PXVideoSession_setVideoPlayer___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) != *(void *)(*(void *)(a1 + 40) + 648))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(*(void *)(a1 + 40) + 648) setDelegate:0];
    [*(id *)(*(void *)(a1 + 40) + 648) unregisterChangeObserver:*(void *)(a1 + 40) context:VideoPlayerObservationContext];
    [*(id *)(*(void *)(a1 + 40) + 648) removeTimeObserver:*(void *)(*(void *)(a1 + 40) + 656)];
    [*(id *)(*(void *)(a1 + 40) + 648) replaceCurrentItemWithPlayerItem:0];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 648), *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 648), "setDelegate:");
    [*(id *)(*(void *)(a1 + 40) + 648) registerChangeObserver:*(void *)(a1 + 40) context:VideoPlayerObservationContext];
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v2 = *(void **)(*(void *)(a1 + 40) + 648);
    CMTimeMake(&v10, 1, 30);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 144);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __33__PXVideoSession_setVideoPlayer___block_invoke_2;
    v8[3] = &unk_1E5DCF948;
    objc_copyWeak(&v9, &location);
    uint64_t v4 = [v2 addPeriodicTimeObserverForInterval:&v10 queue:v3 usingBlock:v8];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 656);
    *(void *)(v5 + 656) = v4;

    [*(id *)(*(void *)(a1 + 40) + 648) setLoopingEnabled:*(unsigned __int8 *)(*(void *)(a1 + 40) + 402)];
    uint64_t v7 = *(void *)(a1 + 40);
    if (*(void *)(v7 + 664)) {
      objc_msgSend(*(id *)(v7 + 648), "setWrappedAudioSession:");
    }
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __33__PXVideoSession_setVideoPlayer___block_invoke_2(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  [WeakRetained _avPlayerTimeDidChange:&v4];
}

- (id)videoPlayer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__257854;
  CMTime v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PXVideoSession_videoPlayer__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__PXVideoSession_videoPlayer__block_invoke(uint64_t a1)
{
}

- (id)_disconnectVideoPlayer
{
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x3032000000;
  double v28 = __Block_byref_object_copy__257854;
  double v29 = __Block_byref_object_dispose__257855;
  id v30 = 0;
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__257854;
  uint64_t v23 = __Block_byref_object_dispose__257855;
  id v24 = 0;
  uint64_t v13 = 0;
  unint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__257854;
  unint64_t v17 = __Block_byref_object_dispose__257855;
  id v18 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CMTime v10 = __Block_byref_object_copy__257854;
  id v11 = __Block_byref_object_dispose__257855;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PXVideoSession__disconnectVideoPlayer__block_invoke;
  block[3] = &unk_1E5DCCBB0;
  void block[4] = self;
  void block[5] = &v25;
  void block[6] = &v19;
  void block[7] = &v13;
  void block[8] = &v7;
  dispatch_sync(stateQueue, block);
  [(id)v8[5] setDelegate:0 queue:0];
  [(id)v26[5] removeTimeObserver:v14[5]];
  [(id)v26[5] removeTimeObserver:v20[5]];
  [(id)v26[5] replaceCurrentItemWithPlayerItem:0];
  [(id)v26[5] unregisterChangeObserver:self context:VideoPlayerObservationContext];
  [(id)v26[5] setDelegate:0];
  id v4 = (id)v26[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v4;
}

void __40__PXVideoSession__disconnectVideoPlayer__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 648));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 192));
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 656));
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(a1[4] + 256));
  uint64_t v2 = a1[4];
  id v3 = *(void **)(v2 + 192);
  *(void *)(v2 + 192) = 0;

  uint64_t v4 = a1[4];
  uint64_t v5 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = 0;

  uint64_t v6 = a1[4];
  uint64_t v7 = *(void **)(v6 + 648);
  *(void *)(v6 + 648) = 0;

  uint64_t v8 = a1[4];
  uint64_t v9 = *(void **)(v8 + 256);
  *(void *)(v8 + 256) = 0;
}

- (void)setShouldDisableAutomaticPixelBufferUpdates:(BOOL)a3
{
  [(PXVideoSession *)self _assertOnUpdateQueue];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  stateQueue = self->_stateQueue;
  char v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PXVideoSession_setShouldDisableAutomaticPixelBufferUpdates___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v9 = a3;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    if (self->_updateQueue_updateFlags.isPerformingUpdate && (self->_updateQueue_updateFlags.updated & 0x2000) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXVideoSession setShouldDisableAutomaticPixelBufferUpdates:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXVideoSession.m", 749, @"invalidating %lu after it already has been updated", 0x2000);

      abort();
    }
    self->_updateQueue_updateFlags.needsUpdate |= 0x2000uLL;
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __62__PXVideoSession_setShouldDisableAutomaticPixelBufferUpdates___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 640))
  {
    *(unsigned char *)(v2 + 640) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)shouldDisableAutomaticPixelBufferUpdates
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PXVideoSession_shouldDisableAutomaticPixelBufferUpdates__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__PXVideoSession_shouldDisableAutomaticPixelBufferUpdates__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 640);
  return result;
}

- (void)_videoWorkQueue_updateCurrenPixelBufferAfterSeekingToTime:(id *)a3 completionLock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(PXVideoSession *)self videoOutput];
  CMTime time = *(CMTime *)a3;
  uint64_t v8 = [v7 copyPixelBufferForItemTime:&time itemTimeForDisplay:0];

  if (!v8)
  {
    char v9 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      CMTime time = (CMTime)*a3;
      Float64 Seconds = CMTimeGetSeconds(&time);
      id v11 = [(PXVideoSession *)self videoOutput];
      LODWORD(time.value) = 138412802;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = Seconds;
      HIWORD(time.epoch) = 2112;
      unint64_t v17 = v11;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "%@ got nil pixelBuffer for time %f from videoOutput: %@", (uint8_t *)&time, 0x20u);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PXVideoSession__videoWorkQueue_updateCurrenPixelBufferAfterSeekingToTime_completionLock___block_invoke;
  _OWORD v13[3] = &unk_1E5DCCB60;
  id v14 = v6;
  uint64_t v15 = v8;
  id v12 = v6;
  [(PXVideoSession *)self _performChanges:v13];
}

uint64_t __91__PXVideoSession__videoWorkQueue_updateCurrenPixelBufferAfterSeekingToTime_completionLock___block_invoke(uint64_t a1, void *a2)
{
  [a2 setCurrentPixelBuffer:*(void *)(a1 + 40)];
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  char v3 = *(void **)(a1 + 32);
  return [v3 unlock];
}

- (void)_updateCurrenPixelBufferAfterSeekingToTime:(id *)a3 completionLock:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  videoWorkQueue = self->_videoWorkQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PXVideoSession__updateCurrenPixelBufferAfterSeekingToTime_completionLock___block_invoke;
  v9[3] = &unk_1E5DCCB38;
  objc_copyWeak(&v11, &location);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(videoWorkQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __76__PXVideoSession__updateCurrenPixelBufferAfterSeekingToTime_completionLock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  objc_msgSend(WeakRetained, "_videoWorkQueue_updateCurrenPixelBufferAfterSeekingToTime:completionLock:", &v4, v3);
}

- (void)seekToExactTime:(id *)a3 updatePixelBuffer:(BOOL)a4 waitUntilComplete:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    BOOL v10 = !v5;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (!v5) {
      goto LABEL_8;
    }
LABEL_7:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke;
    aBlock[3] = &unk_1E5DCCAE8;
    aBlock[4] = self;
    id v11 = (void (**)(void *, BOOL *, NSLock **, __CFString *))_Block_copy(aBlock);
    v11[2](v11, &self->_stateQueue_isPlayable, &self->_stateQueue_isPlayableLock, @"isPlayableLock");
    v11[2](v11, &self->_stateQueue_readyForSeeking, &self->_stateQueue_readyForSeekingLock, @"readyForSeekingLock");
    v11[2](v11, &self->_stateQueue_videoOutputIsReady, &self->_stateQueue_videoOutputReadyLock, @"videoOutputReadyLock");

    goto LABEL_8;
  }
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PXVideoSession.m", 660, @"Invalid parameter not satisfying: %@", @"NSThread.isMainThread ? waitUntilComplete == NO : YES" object file lineNumber description];

  if (v5) {
    goto LABEL_7;
  }
LABEL_8:
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = [(PXVideoSession *)self videoPlayer];
  if (v12
    && [(PXVideoSession *)self isPlayable]
    && [(PXVideoSession *)self isReadyForSeeking]
    && [(PXVideoSession *)self isVideoOutputReady])
  {
    if (v5) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    }
    else {
      id v13 = 0;
    }
    [v13 lock];
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke_275;
    v24[3] = &unk_1E5DCCB10;
    BOOL v29 = a4;
    objc_copyWeak(&v26, &location);
    long long v27 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    id v14 = v13;
    uint64_t v25 = v14;
    CMTime time = (CMTime)*a3;
    *(_OWORD *)CMTimeRange buf = *MEMORY[0x1E4F1FA48];
    *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v22 = *(_OWORD *)buf;
    uint64_t v23 = *(void *)&buf[16];
    [v12 seekToTime:&time toleranceBefore:buf toleranceAfter:&v22 completionHandler:v24];
    if (v5)
    {
      unint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
      char v18 = [v14 lockBeforeDate:v17];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = PLVideoPlaybackGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          CMTime time = (CMTime)*a3;
          Float64 Seconds = CMTimeGetSeconds(&time);
          *(_DWORD *)CMTimeRange buf = 138412546;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(Float64 *)&buf[14] = Seconds;
          _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "%@ sync seeking to time %f timed out", buf, 0x16u);
        }
      }
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    id v14 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      CMTime time = (CMTime)*a3;
      Float64 v15 = CMTimeGetSeconds(&time);
      uint64_t v16 = [(PXVideoSession *)self description];
      LODWORD(time.value) = 138543874;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = v15;
      HIWORD(time.epoch) = 2114;
      uint64_t v33 = v16;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "%{public}@ wasn't ready for seeking to time %f: %{public}@", (uint8_t *)&time, 0x20u);
    }
  }
}

void __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v16 = 0;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__257854;
  unint64_t v20 = __Block_byref_object_dispose__257855;
  id v21 = 0;
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 136);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke_2;
  block[3] = &unk_1E5DCCAC0;
  void block[5] = a2;
  void block[6] = a3;
  void block[4] = &v16;
  dispatch_sync(v8, block);
  char v9 = (void *)v17[5];
  if (v9)
  {
    BOOL v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
    char v11 = [v9 lockBeforeDate:v10];

    if ((v11 & 1) == 0)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = PLVideoPlaybackGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = *(void **)(a1 + 32);
        id v14 = [v13 description];
        *(_DWORD *)CMTimeRange buf = 138543874;
        uint64_t v23 = v13;
        __int16 v24 = 2114;
        id v25 = v7;
        __int16 v26 = 2114;
        long long v27 = v14;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "%{public}@ waiting for %{public}@ timed out: %{public}@", buf, 0x20u);
      }
    }
  }
  _Block_object_dispose(&v16, 8);
}

void __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke_275(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 72))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    long long v6 = *(_OWORD *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    [WeakRetained _updateCurrenPixelBufferAfterSeekingToTime:&v6 completionLock:v4];
  }
  else
  {
    BOOL v5 = *(void **)(a1 + 32);
    [v5 unlock];
  }
}

void __70__PXVideoSession_seekToExactTime_updatePixelBuffer_waitUntilComplete___block_invoke_2(uint64_t a1)
{
  if (!**(unsigned char **)(a1 + 40) && !**(void **)(a1 + 48))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lock];
    BOOL v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    long long v6 = *(id **)(a1 + 48);
    objc_storeStrong(v6, v5);
  }
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  id v10 = a6;
  char v11 = [(PXVideoSession *)self videoPlayer];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__PXVideoSession_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
  v16[3] = &unk_1E5DCCA98;
  id v17 = v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a5;
  id v12 = v10;
  [v11 seekToTime:&v15 toleranceBefore:&v14 toleranceAfter:&v13 completionHandler:v16];
}

uint64_t __78__PXVideoSession_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)seekToTime:(id *)a3 completionHandler:(id)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  long long v6 = *MEMORY[0x1E4F1FA48];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v4 = v6;
  uint64_t v5 = v7;
  [(PXVideoSession *)self seekToTime:&v8 toleranceBefore:&v6 toleranceAfter:&v4 completionHandler:a4];
}

- (CGImage)generateSnapshotImage
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  uint64_t v3 = [(PXVideoSession *)self videoPlayer];
  long long v4 = v3;
  memset(&v27, 0, sizeof(v27));
  if (v3) {
    [v3 currentTime];
  }
  uint64_t v5 = [v4 currentItem];
  long long v6 = [v5 asset];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 duration];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = (long long *)MEMORY[0x1E4F1FA48];
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTimeRangeMake(&range, &start, &duration);
    CMTime time = v27;
    CMTimeClampToRange(&start, &time, &range);
    CMTime v27 = start;
    char v9 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v7];
    [v9 setAppliesPreferredTrackTransform:1];
    long long v22 = *v8;
    uint64_t v23 = *((void *)v8 + 2);
    [v9 setRequestedTimeToleranceAfter:&v22];
    long long v20 = *v8;
    uint64_t v21 = *((void *)v8 + 2);
    [v9 setRequestedTimeToleranceBefore:&v20];
    id v10 = [v5 videoComposition];
    [v9 setVideoComposition:v10];

    char v11 = [v9 customVideoCompositor];
    NSClassFromString(&cfstr_Nuvideoplaybac.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = [v9 customVideoCompositor];
      [v13 setLabel:@"PXVideoSession-generateSnapshotImage"];
    }
    id v19 = 0;
    CMTime start = v27;
    uint64_t v14 = [MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v9 atTime:&start actualTime:0 error:&v19];
    id v15 = v19;
    uint64_t v28 = (CGImage *)v14;
    if (!v14)
    {
      uint64_t v16 = PLVideoPlaybackGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(start.value) = 136315650;
        *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)"-[PXVideoSession generateSnapshotImage]";
        LOWORD(start.flags) = 2112;
        *(void *)((char *)&start.flags + 2) = self;
        HIWORD(start.epoch) = 2112;
        id v30 = v15;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "%s Unable to generate snapshot for video session:\n%@\nError:%@", (uint8_t *)&start, 0x20u);
      }
    }
    PFCGImageApplyTemporaryAVAssetImageGeneratorColorSpaceWorkaround();

    id v17 = v28;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)cancelLoading
{
  id v2 = [(PXVideoSession *)self contentProvider];
  [v2 cancelLoading];
}

- (void)loadIfNeededWithPriority:(int64_t)a3
{
  uint64_t v5 = [(PXVideoSession *)self contentProvider];
  [v5 beginLoadingWithPriority:a3];

  playbackReporter = self->_playbackReporter;
  [(PXVideoPlaybackReporter *)playbackReporter reportPlaybackRequestedWithPriority:a3];
}

- (unint64_t)audioSessionRouteSharingPolicy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PXVideoSession_audioSessionRouteSharingPolicy__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__PXVideoSession_audioSessionRouteSharingPolicy__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 232);
  return result;
}

- (NSString)audioSessionMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__257854;
  id v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PXVideoSession_audioSessionMode__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __34__PXVideoSession_audioSessionMode__block_invoke(uint64_t a1)
{
}

- (NSString)audioSessionCategory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__257854;
  id v10 = __Block_byref_object_dispose__257855;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PXVideoSession_audioSessionCategory__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __38__PXVideoSession_audioSessionCategory__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 208) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)audioSessionCategoryOptions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PXVideoSession_audioSessionCategoryOptions__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__PXVideoSession_audioSessionCategoryOptions__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 216);
  return result;
}

- (void)_audioSessionQueue_updateAudioSessionWithCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PXVideoSession *)self audioSession];
  id v16 = 0;
  LOBYTE(a5) = [v12 setCategory:v11 mode:v10 routeSharingPolicy:a5 options:a6 error:&v16];

  id v13 = v16;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __100__PXVideoSession__audioSessionQueue_updateAudioSessionWithCategory_mode_routeSharingPolicy_options___block_invoke;
  v15[3] = &unk_1E5DD0FA8;
  void v15[4] = self;
  [(PXVideoSession *)self _performChanges:v15];
  if ((a5 & 1) == 0)
  {
    uint64_t v14 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 138412546;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Failed to update audio category on video session: %@\n\tError: %@", buf, 0x16u);
    }
  }
}

uint64_t __100__PXVideoSession__audioSessionQueue_updateAudioSessionWithCategory_mode_routeSharingPolicy_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUpdatingAudioSession:0];
}

- (void)setAudioSessionCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (self->_audioSessionQueue)
  {
    uint64_t v28 = 0;
    BOOL v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PXVideoSession_setAudioSessionCategory_mode_routeSharingPolicy_options___block_invoke;
    block[3] = &unk_1E5DCCA48;
    id v13 = v10;
    id v22 = v13;
    uint64_t v23 = self;
    unint64_t v26 = a6;
    id v14 = v11;
    unint64_t v27 = a5;
    id v24 = v14;
    id v25 = &v28;
    dispatch_sync(stateQueue, block);
    if (*((unsigned char *)v29 + 24))
    {
      [(PXVideoSession *)self setUpdatingAudioSession:1];
      objc_initWeak(&location, self);
      audioSessionQueue = self->_audioSessionQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__PXVideoSession_setAudioSessionCategory_mode_routeSharingPolicy_options___block_invoke_2;
      v16[3] = &unk_1E5DCCA70;
      objc_copyWeak(v19, &location);
      id v17 = v13;
      id v18 = v14;
      v19[1] = (id)a5;
      v19[2] = (id)a6;
      dispatch_async(audioSessionQueue, v16);

      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v28, 8);
  }
}

void __74__PXVideoSession_setAudioSessionCategory_mode_routeSharingPolicy_options___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(*(void *)(a1 + 40) + 208);
  if (v2 == v3)
  {
  }
  else
  {
    long long v4 = v3;
    id v5 = v2;
    int v6 = [v5 isEqualToString:v4];

    if (!v6)
    {
LABEL_8:
      uint64_t v8 = [*(id *)(a1 + 32) copy];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 208);
      *(void *)(v9 + 208) = v8;

      *(void *)(*(void *)(a1 + 40) + 216) = *(void *)(a1 + 64);
      *(void *)(*(void *)(a1 + 40) + 232) = *(void *)(a1 + 72);
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 224), *(id *)(a1 + 48));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      return;
    }
  }
  uint64_t v7 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 64) != v7[27] || *(void *)(a1 + 48) != v7[28] || *(void *)(a1 + 72) != v7[29]) {
    goto LABEL_8;
  }
}

void __74__PXVideoSession_setAudioSessionCategory_mode_routeSharingPolicy_options___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_audioSessionQueue_updateAudioSessionWithCategory:mode:routeSharingPolicy:options:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

- (void)cancelPixelBufferOutputWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PXVideoSession_cancelPixelBufferOutputWithRequestIdentifier___block_invoke;
  block[3] = &unk_1E5DCCA20;
  void block[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v12 + 24))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__PXVideoSession_cancelPixelBufferOutputWithRequestIdentifier___block_invoke_2;
    void v7[3] = &unk_1E5DD0FA8;
    void v7[4] = self;
    [(PXVideoSession *)self _performChanges:v7];
  }

  _Block_object_dispose(&v11, 8);
}

uint64_t __63__PXVideoSession_cancelPixelBufferOutputWithRequestIdentifier___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 168) containsObject:a1[5]];
  if (result)
  {
    [*(id *)(a1[4] + 168) removeObject:a1[5]];
    uint64_t result = [*(id *)(a1[4] + 176) setObject:0 forKeyedSubscript:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

void __63__PXVideoSession_cancelPixelBufferOutputWithRequestIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 4) != 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"-[PXVideoSession cancelPixelBufferOutputWithRequestIdentifier:]_block_invoke_2"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 531, @"invalidating %lu after it already has been updated", 1024);
    goto LABEL_10;
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x400uLL;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 0x20) != 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"-[PXVideoSession cancelPixelBufferOutputWithRequestIdentifier:]_block_invoke_2"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 532, @"invalidating %lu after it already has been updated", 0x2000);
LABEL_10:

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x2000uLL;
}

- (void)requestPixelBufferOutputWithRequestIdentifier:(id)a3 maxOutputSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PXVideoSession_requestPixelBufferOutputWithRequestIdentifier_maxOutputSize___block_invoke;
  block[3] = &unk_1E5DCC9F8;
  void block[4] = self;
  id v9 = v7;
  CGFloat v14 = width;
  CGFloat v15 = height;
  id v12 = v9;
  uint64_t v13 = &v16;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v17 + 24))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v10[2] = __78__PXVideoSession_requestPixelBufferOutputWithRequestIdentifier_maxOutputSize___block_invoke_2;
    v10[3] = &unk_1E5DD0FA8;
    void v10[4] = self;
    [(PXVideoSession *)self _performChanges:v10];
  }

  _Block_object_dispose(&v16, 8);
}

void __78__PXVideoSession_requestPixelBufferOutputWithRequestIdentifier_maxOutputSize___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 168) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 168) addObject:*(void *)(a1 + 40)];
    id v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    [*(id *)(*(void *)(a1 + 32) + 176) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __78__PXVideoSession_requestPixelBufferOutputWithRequestIdentifier_maxOutputSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 4) != 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"-[PXVideoSession requestPixelBufferOutputWithRequestIdentifier:maxOutputSize:]_block_invoke_2"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 514, @"invalidating %lu after it already has been updated", 1024);
    goto LABEL_10;
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x400uLL;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 696) && (*(unsigned char *)(*(void *)(a1 + 32) + 689) & 0x20) != 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"-[PXVideoSession requestPixelBufferOutputWithRequestIdentifier:maxOutputSize:]_block_invoke_2"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXVideoSession.m", 515, @"invalidating %lu after it already has been updated", 0x2000);
LABEL_10:

    abort();
  }
  *(void *)(*(void *)(a1 + 32) + 680) |= 0x2000uLL;
}

- (void)recycleVideoView:(id)a3
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

uint64_t __35__PXVideoSession_recycleVideoView___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 40) + 152) insertObject:*(void *)(a1 + 32) atIndex:0];
}

- (id)dequeueVideoView
{
  mainQueue_videoViewQueue = self->_mainQueue_videoViewQueue;
  if (!mainQueue_videoViewQueue)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = self->_mainQueue_videoViewQueue;
    self->_mainQueue_videoViewQueue = v4;

    mainQueue_videoViewQueue = self->_mainQueue_videoViewQueue;
  }
  uint64_t v6 = [(NSMutableArray *)mainQueue_videoViewQueue lastObject];
  if (v6)
  {
    id v7 = (id)v6;
    [(NSMutableArray *)self->_mainQueue_videoViewQueue removeLastObject];
  }
  else
  {
    id v7 = [(PXVideoSession *)self _newVideoView];
  }
  return v7;
}

- (void)_mainQueue_actuallyPrewarmVideoView
{
  if (!self->_mainQueue_videoViewQueue)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mainQueue_videoViewQueue = self->_mainQueue_videoViewQueue;
    self->_mainQueue_videoViewQueue = v3;

    id v5 = self->_mainQueue_videoViewQueue;
    id v6 = [(PXVideoSession *)self dequeueVideoView];
    [(NSMutableArray *)v5 addObject:v6];
  }
}

- (void)prewarmVideoView
{
  self->_isExpectingVideoView = 1;
  objc_initWeak(&location, self);
  id v2 = +[PXPreloadScheduler sharedScheduler];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__PXVideoSession_prewarmVideoView__block_invoke;
  _OWORD v3[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v4, &location);
  [v2 scheduleMainQueueTask:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __34__PXVideoSession_prewarmVideoView__block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = *MEMORY[0x1E4F1C3A0];
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [WeakRetained performSelectorOnMainThread:sel__mainQueue_actuallyPrewarmVideoView withObject:0 waitUntilDone:0 modes:v2];
}

- (void)dealloc
{
  [(PXVideoSession *)self _relinquishAny4k60StreamAllowance];
  CVPixelBufferRelease(self->_stateQueue_currentPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PXVideoSession;
  [(PXVideoSession *)&v3 dealloc];
}

- (id)performFinalCleanup
{
  if ([(PXVideoPlaybackReporter *)self->_playbackReporter state] == 1) {
    [(PXVideoPlaybackReporter *)self->_playbackReporter reportPlaybackAbandoned];
  }
  if (self->_audioSessionQueue)
  {
    objc_super v3 = [(PXVideoSession *)self audioSession];
    audioSessionQueue = self->_audioSessionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PXVideoSession_performFinalCleanup__block_invoke;
    block[3] = &unk_1E5DD36F8;
    id v10 = v3;
    id v5 = v3;
    dispatch_async(audioSessionQueue, block);
  }
  [(NSTimer *)self->_playerTimeAdvancementTimer invalidate];
  playerTimeAdvancementTimer = self->_playerTimeAdvancementTimer;
  self->_playerTimeAdvancementTimer = 0;

  id v7 = [(PXVideoSession *)self _disconnectVideoPlayer];
  return v7;
}

uint64_t __37__PXVideoSession_performFinalCleanup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActive:0 error:0];
}

- (void)performChanges:(id)a3 withPresentationContext:(int64_t)a4 presenter:(void *)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__257854;
  id v22 = __Block_byref_object_dispose__257855;
  id v23 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXVideoSession_performChanges_withPresentationContext_presenter___block_invoke;
  block[3] = &unk_1E5DCC9D0;
  void block[6] = a4;
  void block[7] = a5;
  void block[4] = self;
  void block[5] = &v18;
  dispatch_sync(stateQueue, block);
  if (v19[5])
  {
    updateQueue = self->_updateQueue;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __67__PXVideoSession_performChanges_withPresentationContext_presenter___block_invoke_2;
    CGFloat v14 = &unk_1E5DD35B8;
    id v15 = v8;
    uint64_t v16 = &v18;
    dispatch_async(updateQueue, &v11);
    [(PXVideoSession *)self _updateFromCurrentPresentationState];
  }
  _Block_object_dispose(&v18, 8);
}

void __67__PXVideoSession_performChanges_withPresentationContext_presenter___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 160);
  objc_super v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  id v14 = [v2 objectForKeyedSubscript:v3];

  if ([v14 count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = [v14 objectAtIndexedSubscript:v4];
      if ([v5 presenter] == *(void *)(a1 + 56)) {
        break;
      }

      if (++v4 >= (unint64_t)[v14 count]) {
        goto LABEL_7;
      }
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
LABEL_7:
  id v8 = v14;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (!v14)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v9 = *(void **)(*(void *)(a1 + 32) + 160);
      id v10 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      [v9 setObject:v14 forKeyedSubscript:v10];
    }
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_newPresentationStateFromCurrentWithPresenter:", *(void *)(a1 + 56));
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    [v14 addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    id v8 = v14;
  }
}

uint64_t __67__PXVideoSession_performChanges_withPresentationContext_presenter___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)leavePresentationContext:(int64_t)a3 presenter:(void *)a4
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PXVideoSession_leavePresentationContext_presenter___block_invoke;
  v6[3] = &unk_1E5DCC9D0;
  void v6[6] = a3;
  v6[7] = a4;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  if (*((unsigned char *)v8 + 24)) {
    [(PXVideoSession *)self _updateFromCurrentPresentationState];
  }
  _Block_object_dispose(&v7, 8);
}

void __53__PXVideoSession_leavePresentationContext_presenter___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 160);
  objc_super v3 = [NSNumber numberWithInteger:a1[6]];
  id v7 = [v2 objectForKeyedSubscript:v3];

  [v7 count];
  unint64_t v4 = 0;
  while (1)
  {
    id v5 = [v7 objectAtIndexedSubscript:v4];
    if ([v5 presenter] == a1[7]) {
      break;
    }

    if (v4++ >= [v7 count]) {
      goto LABEL_7;
    }
  }
  [v7 removeObjectAtIndex:v4];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;

LABEL_7:
}

- (void)enterPresentationContext:(int64_t)a3 presenter:(void *)a4
{
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PXVideoSession_enterPresentationContext_presenter___block_invoke;
  v6[3] = &unk_1E5DD01C8;
  void v6[4] = self;
  void v6[5] = a3;
  void v6[6] = a4;
  v6[7] = a2;
  dispatch_sync(stateQueue, v6);
  [(PXVideoSession *)self _updateFromCurrentPresentationState];
}

void __53__PXVideoSession_enterPresentationContext_presenter___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 160);
  objc_super v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    memset(v9, 0, sizeof(v9));
    if ([v4 countByEnumeratingWithState:v9 objects:v10 count:16]
      && [**((id **)&v9[0] + 1) presenter] == *(void *)(a1 + 48))
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"PXVideoSession.m", 377, @"Trying to enter same presentation context %ld with same presenter %p time twice", *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 160);
    id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    [v6 setObject:v4 forKeyedSubscript:v7];
  }
  id v8 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_newPresentationStateFromCurrentWithPresenter:", *(void *)(a1 + 48));
  [v4 addObject:v8];
}

- (id)_stateQueue_newPresentationStateFromCurrentWithPresenter:(void *)a3
{
  id v5 = objc_alloc_init(_PXVideoSessionPresentationState);
  [(_PXVideoSessionPresentationState *)v5 setPresenter:a3];
  [(_PXVideoSessionPresentationState *)v5 setLoopingEnabled:self->_stateQueue_isLoopingEnabled];
  long long v6 = *(_OWORD *)&self->_stateQueue_playbackTimeRange.start.flags;
  v9[0] = *(_OWORD *)(&self->_stateQueue_isLoopingEnabled + 2);
  v9[1] = v6;
  v9[2] = *(_OWORD *)((char *)&self->_stateQueue_playbackTimeRange.duration.value + 4);
  [(_PXVideoSessionPresentationState *)v5 setPlaybackTimeRange:v9];
  LODWORD(v7) = HIDWORD(self->_stateQueue_playbackStartTime.epoch);
  [(_PXVideoSessionPresentationState *)v5 setVolume:LOBYTE(self->_stateQueue_volume) withFade:v7];
  [(_PXVideoSessionPresentationState *)v5 setSeekToBeginningAtEnd:BYTE1(self->_stateQueue_volume)];
  [(_PXVideoSessionPresentationState *)v5 setDesiredPlayState:self->_stateQueue_desiredPlayState];
  [(_PXVideoSessionPresentationState *)v5 setShouldDisableAutomaticPixelBufferUpdates:self->_stateQueue_shouldDisableAutomaticPixelBufferUpdates];
  [(_PXVideoSessionPresentationState *)v5 setDesiredPlaybackRate:self->_stateQueue_desiredPlaybackRate];
  [(_PXVideoSessionPresentationState *)v5 setAudioSessionCategory:self->_stateQueue_audioSessionCategory mode:self->_stateQueue_audioSessionMode routeSharingPolicy:self->_stateQueue_audioSessionRouteSharingPolicy options:self->_stateQueue_audioSessionCategoryOptions];
  return v5;
}

- (PXVideoSession)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoSession.m", 353, @"%s is not available as initializer", "-[PXVideoSession init]");

  abort();
}

- (PXVideoSession)initWithContentProvider:(id)a3 videoPlayer:(id)a4 resourceReclamationController:(id)a5 playerCreationDelay:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v67.receiver = self;
  v67.super_class = (Class)PXVideoSession;
  id v14 = [(PXVideoSession *)&v67 init];
  id v15 = v14;
  if (v14)
  {
    if (!v14->_updateQueue_updateFlags.isPerformingUpdate || (v14->_updateQueue_updateFlags.updated & 0x1000) == 0)
    {
      v14->_updateQueue_updateFlags.needsUpdate |= 0x1000uLL;
      uint64_t v16 = objc_alloc_init(PXPhotosensitivityProcessing);
      photoSensitivityProcessing = v15->_photoSensitivityProcessing;
      v15->_photoSensitivityProcessing = v16;

      uint64_t v18 = [PXVideoPlaybackReporter alloc];
      char v19 = [v11 contentIdentifier];
      uint64_t v20 = [(PXVideoPlaybackReporter *)v18 initWithIdentifier:v19 CPAnalysticsEndpoint:1];
      playbackReporter = v15->_playbackReporter;
      v15->_playbackReporter = (PXVideoPlaybackReporter *)v20;

      id v22 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v23 = dispatch_queue_create("com.apple.PXVideoSession.work", v22);
      videoWorkQueue = v15->_videoWorkQueue;
      v15->_videoWorkQueue = (OS_dispatch_queue *)v23;

      dispatch_queue_t v25 = dispatch_queue_create("com.apple.PXVideoSession.state", v22);
      stateQueue = v15->_stateQueue;
      v15->_stateQueue = (OS_dispatch_queue *)v25;

      dispatch_queue_t v27 = dispatch_queue_create("com.apple.PXVideoSession.update", v22);
      updateQueue = v15->_updateQueue;
      v15->_updateQueue = (OS_dispatch_queue *)v27;

      id v29 = v13;
      if (!v13) {
        id v29 = objc_alloc_init(MEMORY[0x1E4F8EB70]);
      }
      objc_storeStrong((id *)&v15->_resourceReclamationController, v29);
      if (!v13) {

      }
      [(PXAVResourceReclamationController *)v15->_resourceReclamationController registerObserver:v15];
      uint64_t v30 = NSNumber;
      atomic_fetch_add(&initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay__ivarQueueCounter, 1u);
      char v31 = objc_msgSend(v30, "numberWithInt:");
      v15->_updateQueueIdentifier = v31;
      dispatch_queue_set_specific((dispatch_queue_t)v15->_updateQueue, (const void *)QueueIdentifierContext, v31, 0);
      objc_storeStrong((id *)&v15->_contentProvider, a3);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v64 = 0u;
      v32 = [(PXVideoContentProvider *)v15->_contentProvider loadingResult];
      uint64_t v33 = v32;
      if (v32)
      {
        [v32 timeRange];
      }
      else
      {
        long long v65 = 0u;
        long long v66 = 0u;
        long long v64 = 0u;
      }

      uint64_t v34 = v15->_stateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke;
      block[3] = &unk_1E5DCC9A8;
      uint64_t v35 = v15;
      void block[4] = v35;
      long long v61 = v64;
      long long v62 = v65;
      long long v63 = v66;
      dispatch_sync(v34, block);
      [v11 registerChangeObserver:v35 context:VideoContentProviderObservationContext_257929];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_2;
      v59[3] = &unk_1E5DD0510;
      *(double *)&v59[6] = a6;
      uint64_t v36 = v35;
      v59[4] = v36;
      id v37 = v12;
      v59[5] = v37;
      [v36 _performChanges:v59];
      id v38 = [v36 videoPlayer];
      [v38 setActionAtItemEnd:2];

      uint64_t v39 = MEMORY[0x1E4F1DAB8];
      long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)(v36 + 488) = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)(v36 + 504) = v40;
      *(_OWORD *)(v36 + 520) = *(_OWORD *)(v39 + 32);
      [v36 _loadAssetTracksIfNeeded];
      uint64_t v41 = objc_msgSend(MEMORY[0x1E4F1CB00], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", v36, sel__handlePlayerTimeAdvancementTimer_, 0, 1, 0.2);
      id v42 = (void *)*((void *)v36 + 12);
      *((void *)v36 + 12) = v41;

      if ([v11 mayContainAudio])
      {
        __int16 v43 = [v11 audioSession];

        if (v43)
        {
          int64_t v44 = [v11 audioSession];
          [v44 registerVolumeObserver:v36];
          [v37 setWrappedAudioSession:v44];
          v36[712] = 1;
        }
        else
        {
          __int16 v45 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
          dispatch_queue_t v46 = dispatch_queue_create("com.apple.PXVideoSession.audioSession", v45);
          uint64_t v47 = (void *)*((void *)v36 + 15);
          *((void *)v36 + 15) = v46;

          v48 = v15->_stateQueue;
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_3;
          v57[3] = &unk_1E5DD36F8;
          v49 = v36;
          v58 = v49;
          dispatch_sync(v48, v57);
          objc_initWeak(&location, v49);
          v50 = *((void *)v36 + 15);
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_4;
          v54[3] = &unk_1E5DD32D0;
          objc_copyWeak(&v55, &location);
          dispatch_async(v50, v54);
          objc_destroyWeak(&v55);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        v36[712] = 1;
      }
      v36;
      px_dispatch_on_main_queue();
    }
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    v53 = [NSString stringWithUTF8String:"-[PXVideoSession initWithContentProvider:videoPlayer:resourceReclamationController:playerCreationDelay:]"];
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"PXVideoSession.m", 266, @"invalidating %lu after it already has been updated", 4096);

    abort();
  }

  return 0;
}

__n128 __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 160);
  *(void *)(v3 + 160) = v2;

  uint64_t v5 = MEMORY[0x1E4F1F9F8];
  uint64_t v6 = *(void *)(a1 + 32) + 284;
  *(_OWORD *)uint64_t v6 = *MEMORY[0x1E4F1F9F8];
  *(void *)(v6 + 16) = *(void *)(v5 + 16);
  *(unsigned char *)(*(void *)(a1 + 32) + 483) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 400) = 1;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 168);
  *(void *)(v8 + 168) = v7;

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 176);
  *(void *)(v11 + 176) = v10;

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 184);
  *(void *)(v14 + 184) = v13;

  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 792) loadingResult];
  uint64_t v17 = [v16 playerItem];
  uint64_t v18 = *(void *)(a1 + 32);
  char v19 = *(void **)(v18 + 336);
  *(void *)(v18 + 336) = v17;

  uint64_t v20 = *(void *)(a1 + 32) + 352;
  __n128 result = *(__n128 *)(a1 + 72);
  long long v22 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v20 + 16) = v22;
  *(__n128 *)(v20 + 32) = result;
  *(void *)(*(void *)(a1 + 32) + 672) = 0x3FF0000000000000;
  return result;
}

void __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(double *)(a1 + 48) > 0.0) {
    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:");
  }
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setVideoPlayer:");
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F8EBD0]);
    [*(id *)(a1 + 32) setVideoPlayer:v3];
  }
}

void __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 216) = 0;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), (id)*MEMORY[0x1E4F15050]);
  *(void *)(*(void *)(a1 + 32) + 232) = 0;
}

void __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_audioSessionQueue_initializeAudioSession");
}

uint64_t __104__PXVideoSession_initWithContentProvider_videoPlayer_resourceReclamationController_playerCreationDelay___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 760);
  *(void *)(v3 + 760) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 760);
  return objc_msgSend(v5, "registerChangeObserver:context:");
}

- (PXVideoSession)initWithContentProvider:(id)a3 videoPlayer:(id)a4 resourceReclamationController:(id)a5
{
  return [(PXVideoSession *)self initWithContentProvider:a3 videoPlayer:a4 resourceReclamationController:a5 playerCreationDelay:0.0];
}

@end