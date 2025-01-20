@interface PLVideoView
+ (id)_dequeueOverlayPlayButton;
+ (id)videoViewForVideoFileAtURL:(id)a3;
+ (void)_enqueueOverlayPlayButton:(id)a3;
- (BOOL)_attemptFetchingVideoDerivative;
- (BOOL)_canAccessVideo;
- (BOOL)_canAirPlayCurrentVideo;
- (BOOL)_canAttemptFetchingVideoDerivative;
- (BOOL)_canCreateMetadata;
- (BOOL)_canEditDuration:(double)a3;
- (BOOL)_canHandleAdjustmentData:(id)a3;
- (BOOL)_canPlayCloudSharedStreamedVideoWithLocalVideo;
- (BOOL)_didEditSlalom;
- (BOOL)_didInsertMoviePlayerView;
- (BOOL)_didSetPhotoData;
- (BOOL)_isFetchingVideo;
- (BOOL)_isFlattenedVideoUpToDate;
- (BOOL)_localVideoUnavailable;
- (BOOL)_mediaIsCloudSharedStreamedVideo;
- (BOOL)_mediaIsPlayable;
- (BOOL)_mediaIsVideo;
- (BOOL)_playerIsAirplay;
- (BOOL)_prepareMoviePlayerIfNeeded;
- (BOOL)_scrubberTimeNeedsMapping;
- (BOOL)_shouldPlayFlattenedVideo;
- (BOOL)_shouldShowSlalomEditor;
- (BOOL)_shouldStreamCloudPhotoLibraryVideo;
- (BOOL)_shouldStreamVideo;
- (BOOL)_slalomRegionEditorCreatedForScrubber;
- (BOOL)allowSlalomEditor;
- (BOOL)canEdit;
- (BOOL)isEditing;
- (BOOL)isPlaying;
- (BOOL)loadMediaImmediately;
- (BOOL)moviePlayerControllerShouldAllowExternalPlayback:(id)a3;
- (BOOL)moviePlayerExitRequest:(id)a3 exitReason:(int)a4;
- (BOOL)moviePlayerShouldNotifyOnPreparationError:(id)a3;
- (BOOL)playingToAirTunes;
- (BOOL)playingToVideoOut;
- (BOOL)prepareMoviePlayerForScrubberAutomatically;
- (BOOL)scrubberIsSubview;
- (BOOL)shouldPlayVideoWhenViewAppears;
- (BOOL)showsPlayOverlay;
- (BOOL)showsScrubber;
- (BOOL)slalomRegionEditorRequestForceZoom:(id)a3;
- (NSString)_pathForPrebakedLandscapeScrubberThumbnails;
- (NSString)_pathForPrebakedPortraitScrubberThumbnails;
- (NSString)_pathForVideoPreviewFile;
- (NSString)description;
- (NSString)pathForVideoFile;
- (PFVideoAVObjectBuilder)_videoAVObjectBuilder;
- (PFVideoAdjustments)_adjustmentsToCommit;
- (PLManagedAsset)videoCameraImage;
- (PLPhotoTileViewController)imageTile;
- (PLVideoPosterFrameView)posterFrameView;
- (PLVideoView)initWithFrame:(CGRect)a3 videoCameraImage:(id)a4 orientation:(int64_t)a5;
- (PLVideoViewDelegate)delegate;
- (UIImage)posterFrameImage;
- (UIImageView)previewImageView;
- (UIView)scrubberBackgroundView;
- (double)_movieScrubberDuration;
- (double)_movieTimeFromScrubberTime:(double)a3;
- (double)_scrubberBackgroundHeight;
- (double)_scrubberStartTime;
- (double)_scrubberTimeFromMovieTime:(double)a3;
- (double)_thumbnailTimeFromScrubberTime:(double)a3;
- (double)currentTime;
- (double)duration;
- (double)endTime;
- (double)movieScrubberThumbnailAspectRatio:(id)a3;
- (double)scrubberWidth;
- (double)startTime;
- (id)_assetForVideoPath:(id)a3;
- (id)_assetForVideoURL:(id)a3;
- (id)_filePathForFlattenedVideo;
- (id)_filePathForFlattenedVideoMetadata;
- (id)_initWithFrame:(CGRect)a3 videoCameraImage:(id)a4 orientation:(int64_t)a5;
- (id)_loadThumbnailsIntoDictionary:(id)a3 isLandscape:(BOOL)a4 aspectRatio:(float)a5;
- (id)_metadataForFlattenedVideo;
- (id)_moviePlayer;
- (id)_optionsForAVURLAsset;
- (id)_pathForOriginalFile;
- (id)_readMetadataFromPath:(id)a3;
- (id)_thumbnailSourceAsset;
- (id)_videoSnapshot;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)moviePlayerRequestsPickedAirplayRoute:(id)a3;
- (id)movieScrubber:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6;
- (id)movieScrubber:(id)a3 timestampsStartingAt:(id)a4 endingAt:(id)a5 maxCount:(int)a6;
- (id)newPreviewImageData:(id *)a3;
- (id)videoOverlayPlayButton;
- (int64_t)_expectedNotificationsCount;
- (void)_addThumbnailRequestForTimestamp:(id)a3 isSummaryThumbnail:(BOOL)a4;
- (void)_cancelAirplayExportSession;
- (void)_cancelDelayedCommitPendingAdjustmentsUpdate;
- (void)_clearImageGenerators;
- (void)_commitPendingAdjustmentsUpdate;
- (void)_commitPendingAdjustmentsUpdateAndWait:(BOOL)a3 completionHandler:(id)a4;
- (void)_configureImageGenerator:(id)a3 thumbnailSize:(CGSize)thumbnailSize forSummaryThumbnails:(BOOL)a5;
- (void)_configurePlayerForStreamedVideoIfNecessary;
- (void)_createImageGenerators;
- (void)_createScrubberIfNeeded;
- (void)_deleteFileAtPath:(id)a3;
- (void)_didBeginPlayback;
- (void)_didScrubToValue:(double)a3 withHandle:(int)a4;
- (void)_displayPlaySpinner;
- (void)_enqueueAdjustmentsForCommit;
- (void)_fetchLocalContentEditingInput;
- (void)_fetchNonlocalVideo;
- (void)_flattenVideoWithCompletionHandler:(id)a3;
- (void)_handleScreenConnectionChange:(BOOL)a3;
- (void)_hideTrimMessageView:(BOOL)a3;
- (void)_hideVideoOverlay:(BOOL)a3;
- (void)_insertMoviePlayerViewIfNecessary;
- (void)_invalidateSnapshotImage;
- (void)_networkReachabilityDidChange:(id)a3;
- (void)_playbackFinished;
- (void)_prepareAndResumePlayback;
- (void)_reloadScrubberThumbnailsIfNeeded;
- (void)_removePlaySpinner;
- (void)_removeScrubber;
- (void)_removeScrubberUpdateTimer;
- (void)_requestPreviewPosterFrameForVideoSize:(CGSize)a3;
- (void)_reset;
- (void)_resetScrubberUpdateTimer;
- (void)_saveCachedThumbnailsIfNecessary;
- (void)_savePreviewPosterFrameImage:(CGImage *)a3;
- (void)_screenDidConnect:(id)a3;
- (void)_screenDidDisconnect:(id)a3;
- (void)_scrubToMovieTime:(double)a3;
- (void)_scrubToSlalomRegionEditorStartHandle:(BOOL)a3;
- (void)_serviceImageGenerationRequests;
- (void)_setAttemptFetchingVideoDerivative:(BOOL)a3;
- (void)_setCanAttemptFetchingVideoDerivative:(BOOL)a3;
- (void)_setDidEditSlalom:(BOOL)a3;
- (void)_setDuration:(double)a3;
- (void)_setLocalVideoUnavailable:(BOOL)a3;
- (void)_setMoviePlayerActive:(BOOL)a3;
- (void)_setNeedsReloadScrubberThumbnails:(BOOL)a3;
- (void)_setPlaybackDidBegin:(BOOL)a3;
- (void)_setPlaying:(BOOL)a3;
- (void)_setupMoviePlayerIfNecessary;
- (void)_showVideoOverlay;
- (void)_tearDownMoviePlayer;
- (void)_updatePosterFrameVisibility;
- (void)_updatePosterImageView;
- (void)_updateScaleModeForSize:(CGSize)a3;
- (void)_updateScrubberForSlowMotion;
- (void)_updateScrubberFrame;
- (void)_updateScrubberValue;
- (void)_updateScrubberVisibilityWithDuration:(double)a3;
- (void)_updateSlalomRegionEditorRange;
- (void)_updateSlalomRegionEditorState;
- (void)_updateSnapshotImage;
- (void)_updateVideoAVObjectBuilderFromContentEditingInput:(id)a3;
- (void)_verifyOrRestartPlayback;
- (void)_videoOverlayFadeOutDidFinish;
- (void)_writeMetadata:(id)a3 toPath:(id)a4;
- (void)applicationDidEnterBackground;
- (void)applicationWillResignActive;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)handleDoubleTap;
- (void)hideTrimMessage;
- (void)layoutSubviews;
- (void)moviePlayerBufferingStateDidChange:(id)a3;
- (void)moviePlayerControllerDidBecomeActiveController:(id)a3;
- (void)moviePlayerControllerWillResignAsActiveController:(id)a3;
- (void)moviePlayerDidChangeExternalPlaybackType:(id)a3;
- (void)moviePlayerDurationAvailable:(id)a3;
- (void)moviePlayerEncounteredAuthenticationError:(id)a3;
- (void)moviePlayerHeadsetNextTrackPressed:(id)a3;
- (void)moviePlayerHeadsetPlayPausePressed:(id)a3;
- (void)moviePlayerHeadsetPreviousTrackPressed:(id)a3;
- (void)moviePlayerPlaybackRateDidChange:(id)a3;
- (void)moviePlayerPlaybackStateDidChange:(id)a3 fromPlaybackState:(unint64_t)a4;
- (void)moviePlayerReadyToDisplay:(id)a3;
- (void)moviePlayerReadyToPlay:(id)a3;
- (void)movieScrubber:(id)a3 editingEndValueDidChange:(double)a4;
- (void)movieScrubber:(id)a3 editingStartValueDidChange:(double)a4;
- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4;
- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4 isSummaryThumbnail:(BOOL)a5;
- (void)movieScrubber:(id)a3 valueDidChange:(double)a4;
- (void)movieScrubber:(id)a3 widthDelta:(float)a4 originXDelta:(float)a5;
- (void)movieScrubber:(id)a3 willZoomToMinimumValue:(double)a4 maximumValue:(double)a5;
- (void)movieScrubberDidBeginAnimatingZoom:(id)a3;
- (void)movieScrubberDidBeginEditing:(id)a3;
- (void)movieScrubberDidBeginScrubbing:(id)a3 withHandle:(int)a4;
- (void)movieScrubberDidEndAnimatingZoom:(id)a3;
- (void)movieScrubberDidEndScrubbing:(id)a3 withHandle:(int)a4;
- (void)movieScrubberDidFinishRequestingThumbnails:(id)a3;
- (void)notifyOfChange:(id)a3 shouldReloadBlock:(id)a4;
- (void)notifyRequiredResourcesDownloaded;
- (void)pause;
- (void)play;
- (void)removeVideoOverlay;
- (void)setAllowSlalomEditor:(BOOL)a3;
- (void)setCanEdit:(BOOL)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setImageTile:(id)a3;
- (void)setLoadMediaImmediately:(BOOL)a3;
- (void)setMaximumTrimLength:(double)a3;
- (void)setPosterFrameImage:(id)a3;
- (void)setPrepareMoviePlayerForScrubberAutomatically:(BOOL)a3;
- (void)setScrubberIsSubview:(BOOL)a3;
- (void)setScrubberWidth:(double)a3;
- (void)setShouldPlayVideoWhenViewAppears:(BOOL)a3;
- (void)setShowsPlayOverlay:(BOOL)a3;
- (void)setShowsScrubber:(BOOL)a3;
- (void)setShowsScrubber:(BOOL)a3 duration:(double)a4;
- (void)set_didInsertMoviePlayerView:(BOOL)a3;
- (void)showTrimMessage:(id)a3 withBottomY:(float)a4;
- (void)slalomRegionEditorDidBeginEditing:(id)a3 withStartHandle:(BOOL)a4;
- (void)slalomRegionEditorDidEndEditing:(id)a3;
- (void)slalomRegionEditorEndValueChanged:(id)a3;
- (void)slalomRegionEditorRequestForceUnzoom:(id)a3;
- (void)slalomRegionEditorStartValueChanged:(id)a3;
- (void)stop;
- (void)toggleScaleMode:(float)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateForRotationWithDuration:(double)a3 isLandscape:(BOOL)a4;
- (void)updateScaleMode;
- (void)viewDidAppear;
- (void)viewDidDisappear;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PLVideoView

- (BOOL)_slalomRegionEditorCreatedForScrubber
{
  return self->__slalomRegionEditorCreatedForScrubber;
}

- (void)_setAttemptFetchingVideoDerivative:(BOOL)a3
{
  self->__attemptFetchingVideoDerivative = a3;
}

- (BOOL)_attemptFetchingVideoDerivative
{
  return self->__attemptFetchingVideoDerivative;
}

- (void)_setCanAttemptFetchingVideoDerivative:(BOOL)a3
{
  self->__canAttemptFetchingVideoDerivative = a3;
}

- (BOOL)_canAttemptFetchingVideoDerivative
{
  return self->__canAttemptFetchingVideoDerivative;
}

- (PFVideoAdjustments)_adjustmentsToCommit
{
  return self->__adjustmentsToCommit;
}

- (int64_t)_expectedNotificationsCount
{
  return self->__expectedNotificationsCount;
}

- (BOOL)_localVideoUnavailable
{
  return self->__localVideoUnavailable;
}

- (BOOL)_isFetchingVideo
{
  return self->__isFetchingVideo;
}

- (PFVideoAVObjectBuilder)_videoAVObjectBuilder
{
  return self->__videoAVObjectBuilder;
}

- (void)_setDidEditSlalom:(BOOL)a3
{
  self->__didEditSlalom = a3;
}

- (BOOL)_didEditSlalom
{
  return self->__didEditSlalom;
}

- (void)set_didInsertMoviePlayerView:(BOOL)a3
{
  self->__didInsertMoviePlayerView = a3;
}

- (BOOL)_didInsertMoviePlayerView
{
  return self->__didInsertMoviePlayerView;
}

- (void)setShouldPlayVideoWhenViewAppears:(BOOL)a3
{
  self->_shouldPlayVideoWhenViewAppears = a3;
}

- (BOOL)shouldPlayVideoWhenViewAppears
{
  return self->_shouldPlayVideoWhenViewAppears;
}

- (void)setPrepareMoviePlayerForScrubberAutomatically:(BOOL)a3
{
  self->_prepareMoviePlayerForScrubberAutomatically = a3;
}

- (BOOL)prepareMoviePlayerForScrubberAutomatically
{
  return self->_prepareMoviePlayerForScrubberAutomatically;
}

- (UIView)scrubberBackgroundView
{
  return self->_scrubberBackgroundView;
}

- (void)setAllowSlalomEditor:(BOOL)a3
{
  self->_allowSlalomEditor = a3;
}

- (BOOL)allowSlalomEditor
{
  return self->_allowSlalomEditor;
}

- (PLVideoPosterFrameView)posterFrameView
{
  return self->_posterFrameView;
}

- (void)setScrubberWidth:(double)a3
{
  self->_scrubberWidth = a3;
}

- (void)_cancelAirplayExportSession
{
  self->_airplayExportSession = 0;
}

- (void)_flattenVideoWithCompletionHandler:(id)a3
{
  [(PLVideoView *)self _cancelAirplayExportSession];
  if (self->__videoAVObjectBuilder)
  {
    id v5 = [(PLVideoView *)self _filePathForFlattenedVideo];
    id v6 = [(PLVideoView *)self _filePathForFlattenedVideoMetadata];
    [(PLVideoView *)self _deleteFileAtPath:v5];
    [(PLVideoView *)self _deleteFileAtPath:v6];
    id v7 = [(PLVideoView *)self _metadataForFlattenedVideo];
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    uint64_t v9 = *MEMORY[0x1E4F15758];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E63D28B8;
    v14[4] = self;
    [(PFVideoAVObjectBuilder *)videoAVObjectBuilder requestExportSessionWithExportPreset:v9 resultHandler:v14];
    if (self->_airplayExportSession)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
      [(AVAssetExportSession *)self->_airplayExportSession setOutputFileType:*MEMORY[0x1E4F15AB0]];
      [(AVAssetExportSession *)self->_airplayExportSession setOutputURL:v10];
      airplayExportSession = self->_airplayExportSession;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke_2;
      v13[3] = &unk_1E63D28E0;
      v13[4] = airplayExportSession;
      v13[5] = self;
      v13[6] = v7;
      v13[7] = v6;
      v13[8] = v10;
      v13[9] = a3;
      [(AVAssetExportSession *)airplayExportSession exportAsynchronouslyWithCompletionHandler:v13];
    }
    else if (a3)
    {
      (*((void (**)(id, void))a3 + 2))(a3, 0);
    }
  }
  else if (a3)
  {
    v12 = (void (*)(id, void))*((void *)a3 + 2);
    v12(a3, 0);
  }
}

id __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(a1 + 32) + 640) = result;
  return result;
}

uint64_t __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke_2()
{
  return pl_dispatch_async();
}

uint64_t __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) status];
  if (v2 == 3)
  {
    [*(id *)(a1 + 40) _writeMetadata:*(void *)(a1 + 48) toPath:*(void *)(a1 + 56)];
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", *(void *)(a1 + 64), 0);
    if (v2 == 4) {
      NSLog(&cfstr_VideoExportFai.isa, [*(id *)(a1 + 32) asset], objc_msgSend(*(id *)(a1 + 32), "error"));
    }
  }
  v3 = *(void **)(a1 + 32);
  if (v3 == *(void **)(*(void *)(a1 + 40) + 640))
  {

    *(void *)(*(void *)(a1 + 40) + 640) = 0;
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_deleteFileAtPath:(id)a3
{
  uint64_t v5 = 0;
  v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:a3 isDirectory:0])
  {
    [v4 removeItemAtPath:a3 error:&v5];
    if (v5) {
      NSLog(&cfstr_FailedToDelete.isa, a3, v5);
    }
  }
}

- (id)_filePathForFlattenedVideoMetadata
{
  id v2 = [(PLVideoView *)self _filePathForFlattenedVideo];
  return (id)[v2 stringByAppendingPathExtension:@"MD"];
}

- (id)_filePathForFlattenedVideo
{
  uint64_t v2 = objc_msgSend(-[PLVideoView _pathForOriginalFile](self, "_pathForOriginalFile"), "lastPathComponent");
  v3 = NSTemporaryDirectory();
  return [(NSString *)v3 stringByAppendingPathComponent:v2];
}

- (void)_writeMetadata:(id)a3 toPath:(id)a4
{
  if (a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:", a3, 100, 0, 0), "writeToFile:options:error:", a4, 1073741825, 0);
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", a4) & 1) == 0) {
    NSLog(&cfstr_FailedToWriteM.isa, a4);
  }
}

- (id)_readMetadataFromPath:(id)a3
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:a3];
}

- (id)_metadataForFlattenedVideo
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [(PLManagedAsset *)self->_videoCameraImage duration];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:"), @"duration");
  uint64_t v4 = objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "propertyListDictionary");
  if (v4) {
    [v3 setObject:v4 forKey:@"plist"];
  }
  return v3;
}

- (BOOL)_isFlattenedVideoUpToDate
{
  v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(PLVideoView *)self _filePathForFlattenedVideo];
  id v5 = [(PLVideoView *)self _filePathForFlattenedVideoMetadata];
  if (![v3 fileExistsAtPath:v4]
    || ![v3 fileExistsAtPath:v5])
  {
    return 0;
  }
  id v6 = [(PLVideoView *)self _readMetadataFromPath:v5];
  id v7 = [(PLVideoView *)self _metadataForFlattenedVideo];
  return [v6 isEqual:v7];
}

- (BOOL)_shouldPlayFlattenedVideo
{
  if (self->_isAirPlay) {
    return ![(PLVideoView *)self _canAirPlayCurrentVideo];
  }
  else {
    return 0;
  }
}

- (BOOL)_canAirPlayCurrentVideo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v2 = 1;
  char v9 = 1;
  videoAVObjectBuilder = self->__videoAVObjectBuilder;
  if (videoAVObjectBuilder)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__PLVideoView__canAirPlayCurrentVideo__block_invoke;
    v5[3] = &unk_1E63D2890;
    v5[4] = &v6;
    [(PFVideoAVObjectBuilder *)videoAVObjectBuilder requestAVAssetForExport:0 withResultHandler:v5];
    BOOL v2 = *((unsigned char *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __38__PLVideoView__canAirPlayCurrentVideo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  char v8 = (a3 == 0) & result;
  if (a4) {
    char v8 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  return result;
}

- (void)slalomRegionEditorRequestForceUnzoom:(id)a3
{
}

- (BOOL)slalomRegionEditorRequestForceZoom:(id)a3
{
  return [(UIMovieScrubber *)self->_scrubber forceZoom];
}

- (void)_scrubToSlalomRegionEditorStartHandle:(BOOL)a3
{
  slalomRegionEditor = self->_slalomRegionEditor;
  if (a3) {
    [(PLSlalomRegionEditor *)slalomRegionEditor startValue];
  }
  else {
    [(PLSlalomRegionEditor *)slalomRegionEditor endValue];
  }
  -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
  -[PLVideoView _scrubToMovieTime:](self, "_scrubToMovieTime:");
}

- (void)slalomRegionEditorEndValueChanged:(id)a3
{
}

- (void)slalomRegionEditorStartValueChanged:(id)a3
{
}

- (void)_commitPendingAdjustmentsUpdateAndWait:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v5 = a3;
  [(PLVideoView *)self _cancelDelayedCommitPendingAdjustmentsUpdate];
  adjustmentsToCommit = self->__adjustmentsToCommit;
  if (adjustmentsToCommit)
  {
    char v8 = adjustmentsToCommit;

    self->__adjustmentsToCommit = 0;
    uint64_t v9 = [(PLManagedAsset *)self->_videoCameraImage pl_PHAssetFromPhotoLibrary:pl_appPhotoLibrary()];
    if (v9)
    {
      uint64_t v10 = v9;
      ++self->__expectedNotificationsCount;
      id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F38E98]), "initWithFormatIdentifier:formatVersion:data:", -[PFVideoAdjustments adjustmentFormatIdentifier](v8, "adjustmentFormatIdentifier"), -[PFVideoAdjustments adjustmentFormatVersion](v8, "adjustmentFormatVersion"), -[PFVideoAdjustments adjustmentData](v8, "adjustmentData"));
      v12 = (void *)pl_appPhotoLibrary();
      uint64_t v13 = [v12 photoLibraryURL];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__PLVideoView__commitPendingAdjustmentsUpdateAndWait_completionHandler___block_invoke;
      v18[3] = &unk_1E63D2700;
      v18[4] = v10;
      v18[5] = v13;
      v18[6] = v11;
      if (v5)
      {
        *(void *)buf = 0;
        if (![v12 performChangesAndWait:v18 error:buf] || *(void *)buf) {
          NSLog(&cfstr_FailedToCommit.isa, *(void *)buf);
        }
        if (a4) {
          (*((void (**)(id, void))a4 + 2))(a4, *(void *)buf);
        }
      }
      else
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __72__PLVideoView__commitPendingAdjustmentsUpdateAndWait_completionHandler___block_invoke_2;
        v16[3] = &unk_1E63D2868;
        v16[4] = a4;
        [v12 performChanges:v18 completionHandler:v16];
      }
    }
    else
    {
      Log = PLBackendGetLog();
      if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_ERROR, "No PHAsset for committing pending adjustment changes", buf, 2u);
      }
      if (a4) {
        (*((void (**)(id, void))a4 + 2))(a4, 0);
      }
    }
  }
  else if (a4)
  {
    v14 = (void (*)(id, void))*((void *)a4 + 2);
    v14(a4, 0);
  }
}

uint64_t __72__PLVideoView__commitPendingAdjustmentsUpdateAndWait_completionHandler___block_invoke(void *a1)
{
  BOOL v2 = (void *)[MEMORY[0x1E4F38ED0] changeRequestForAsset:a1[4]];
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F39030]) initWithAdjustmentBaseVersion:0 mediaType:2 appropriateForURL:a1[5]];
  [v3 setAdjustmentData:a1[6]];
  [v3 clearRenderedContentURL];
  return [v2 setContentEditingOutput:v3];
}

uint64_t __72__PLVideoView__commitPendingAdjustmentsUpdateAndWait_completionHandler___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0) {
    NSLog(&cfstr_FailedToCommit.isa, a3);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_cancelDelayedCommitPendingAdjustmentsUpdate
{
  id v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__commitPendingAdjustmentsUpdate object:0];
}

- (void)_commitPendingAdjustmentsUpdate
{
}

- (void)_enqueueAdjustmentsForCommit
{
  uint64_t v3 = [(PFVideoAVObjectBuilder *)self->__videoAVObjectBuilder videoAdjustments];
  adjustmentsToCommit = self->__adjustmentsToCommit;
  if (adjustmentsToCommit != (PFVideoAdjustments *)v3)
  {
    BOOL v5 = (void *)v3;

    self->__adjustmentsToCommit = (PFVideoAdjustments *)v5;
  }
  [(PLVideoView *)self _cancelDelayedCommitPendingAdjustmentsUpdate];
  [(PLVideoView *)self performSelector:sel__commitPendingAdjustmentsUpdate withObject:0 afterDelay:40.0];
}

- (void)slalomRegionEditorDidEndEditing:(id)a3
{
  id v3 = a3;
  [a3 startValue];
  Float64 v6 = v5;
  [v3 endValue];
  Float64 v8 = v7;
  LODWORD(v3) = [MEMORY[0x1E4F8CDA0] preferredTimeScale];
  memset(&v23, 0, sizeof(v23));
  CMTimeMakeWithSeconds(&start, v6, (int32_t)v3);
  CMTimeMakeWithSeconds(&end, v8, (int32_t)v3);
  CMTimeRangeFromTimeToTime(&v23, &start, &end);
  memset(&v20, 0, sizeof(v20));
  uint64_t v9 = (void *)[(PFVideoAVObjectBuilder *)self->__videoAVObjectBuilder videoAdjustments];
  if (v9) {
    [v9 slowMotionTimeRange];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }
  CMTimeRange range1 = v20;
  CMTimeRange range2 = v23;
  if (!CMTimeRangeEqual(&range1, &range2))
  {
    objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "slowMotionRate");
    unsigned int v11 = v10;
    id v12 = objc_alloc(MEMORY[0x1E4F8CE18]);
    CMTimeRange range1 = v23;
    uint64_t v13 = objc_msgSend(v12, "initWithSlowMotionTimeRange:rate:", &range1, COERCE_DOUBLE(__PAIR64__(v23.duration.flags, v11)));
    uint64_t v14 = [(PFVideoAVObjectBuilder *)self->__videoAVObjectBuilder videoAsset];
    v15 = (PFVideoAVObjectBuilder *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v14 videoAdjustments:v13];

    self->__videoAVObjectBuilder = v15;
    [(PLVideoView *)self _updateScrubberForSlowMotion];
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__PLVideoView_slalomRegionEditorDidEndEditing___block_invoke;
    v17[3] = &unk_1E63D2840;
    v17[4] = self;
    [(PFVideoAVObjectBuilder *)videoAVObjectBuilder requestPlayerItemWithResultHandler:v17];
    [(PLVideoView *)self _enqueueAdjustmentsForCommit];
    [(PLVideoView *)self _cancelAirplayExportSession];
    if ([(PLVideoView *)self _shouldPlayFlattenedVideo])
    {
      *((unsigned char *)self + 651) &= ~2u;
      [(PLVideoView *)self _prepareMoviePlayerIfNeeded];
    }
    if (![(PLVideoView *)self _didEditSlalom]) {
      [(PLVideoView *)self _setDidEditSlalom:1];
    }
  }
}

uint64_t __47__PLVideoView_slalomRegionEditorDidEndEditing___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 560) setPlayerItem:a2 startTime:*(double *)(*(void *)(a1 + 32) + 584)];
}

- (void)slalomRegionEditorDidBeginEditing:(id)a3 withStartHandle:(BOOL)a4
{
  BOOL v4 = a4;
  [(PLVideoView *)self pause];
  *((unsigned char *)self + 650) &= ~1u;
  [(PLVideoView *)self _scrubToSlalomRegionEditorStartHandle:v4];
}

- (void)updateForRotationWithDuration:(double)a3 isLandscape:(BOOL)a4
{
  if (self->_useLandscapeCache != a4)
  {
    self->_useLandscapeCache = a4;
    [(PLVideoView *)self _setNeedsReloadScrubberThumbnails:1];
    [(PLVideoView *)self setShowsScrubber:0 duration:0.0];
    if (self->_scaleMode == 2)
    {
      *(float *)&double v6 = a3;
      [(PLVideoView *)self toggleScaleMode:v6];
    }
  }
}

- (void)_updateScrubberValue
{
  if (!self->_scrubberUpdateTimer || self->_duration == 0.0) {
    return;
  }
  [(PLVideoView *)self currentTime];
  -[PLVideoView _scrubberTimeFromMovieTime:](self, "_scrubberTimeFromMovieTime:");
  if ((*((unsigned char *)self + 650) & 0x20) == 0) {
    goto LABEL_13;
  }
  double lastScrubbedValue = self->_lastScrubbedValue;
  double v4 = -1.0;
  if (lastScrubbedValue == -1.0) {
    goto LABEL_13;
  }
  if ((*((unsigned char *)self + 650) & 0x40) == 0)
  {
    double v4 = v3 - lastScrubbedValue;
    if (v3 <= lastScrubbedValue || v4 >= 0.5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v3 >= lastScrubbedValue)
  {
LABEL_12:
    self->_double lastScrubbedValue = -1.0;
LABEL_13:
    double lastScrubbedValue = v3;
  }
LABEL_14:
  -[PLVideoView _scrubberTimeFromMovieTime:](self, "_scrubberTimeFromMovieTime:", self->_duration, v4);
  double v8 = v7;
  if (lastScrubbedValue < v7) {
    double v7 = lastScrubbedValue;
  }
  self->_lastActualValue = fmax(v7, 0.0);
  -[UIMovieScrubber setValue:animated:](self->_scrubber, "setValue:animated:", 1);
  if (lastScrubbedValue >= v8)
  {
    [(PLVideoView *)self _removeScrubberUpdateTimer];
  }
}

- (void)_updateSlalomRegionEditorRange
{
  double Seconds = 0.0;
  double v4 = 0.0;
  if (objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "hasSlowMotionAdjustments"))
  {
    memset(v9, 0, sizeof(v9));
    long long v8 = 0u;
    double v5 = (void *)[(PFVideoAVObjectBuilder *)self->__videoAVObjectBuilder videoAdjustments];
    if (v5)
    {
      [v5 slowMotionTimeRange];
    }
    else
    {
      memset(v9, 0, sizeof(v9));
      long long v8 = 0u;
    }
    *(_OWORD *)&v7.value = v8;
    v7.epoch = *(void *)&v9[0];
    double Seconds = CMTimeGetSeconds(&v7);
    CMTime v7 = *(CMTime *)((char *)v9 + 8);
    double v4 = Seconds + CMTimeGetSeconds(&v7);
  }
  [(PLSlalomRegionEditor *)self->_slalomRegionEditor setMinValue:0.0];
  slalomRegionEditor = self->_slalomRegionEditor;
  [(PLVideoView *)self _movieScrubberDuration];
  -[PLSlalomRegionEditor setMaxValue:](slalomRegionEditor, "setMaxValue:");
  [(PLSlalomRegionEditor *)self->_slalomRegionEditor setStartValue:Seconds];
  [(PLSlalomRegionEditor *)self->_slalomRegionEditor setEndValue:v4];
}

- (void)_setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    [(PLVideoView *)self _updateSlalomRegionEditorRange];
  }
}

- (double)duration
{
  return self->_duration;
}

- (void)_playbackFinished
{
  if ((*((unsigned char *)self + 650) & 4) != 0)
  {
    [(PLVideoView *)self _setPlaying:0];
    if ((*((unsigned char *)self + 650) & 8) != 0) {
      [(UIMovieScrubber *)self->_scrubber setThumbIsVisible:0];
    }
    [(PLVideoView *)self _removeScrubberUpdateTimer];
    self->_double lastScrubbedValue = -1.0;
    *((unsigned char *)self + 650) |= 1u;
    [(PLVideoView *)self _setPlaybackDidBegin:0];
    self->_lastActualValue = 0.0;
    if ([(PLMoviePlayerController *)self->_moviePlayer playbackState])
    {
      double duration = self->_duration;
    }
    else
    {
      double duration = 0.0;
      [(PLVideoView *)self setCurrentTime:0.0];
    }
    [(PLVideoView *)self _scrubberTimeFromMovieTime:duration];
    -[UIMovieScrubber setValue:animated:](self->_scrubber, "setValue:animated:", 0);
    [(PLVideoView *)self _showVideoOverlay];
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    {
      delegate = self->_delegate;
      [(PLVideoViewDelegate *)delegate videoViewDidEndPlayback:self didFinish:1];
    }
  }
}

- (id)_moviePlayer
{
  return self->_moviePlayer;
}

- (void)_handleScreenConnectionChange:(BOOL)a3
{
  if ((*((unsigned char *)self + 652) & 2) != 0)
  {
    [(PLVideoView *)self stop];
    [(PLVideoPosterFrameView *)self->_posterFrameView setHidden:1];
    [(PLMoviePlayerView *)[(PLMoviePlayerController *)self->_moviePlayer view] setDestinationPlaceholderHidden:0];
    [(PLVideoView *)self _showVideoOverlay];
  }
}

- (void)_screenDidDisconnect:(id)a3
{
}

- (void)_screenDidConnect:(id)a3
{
}

- (double)_scrubberTimeFromMovieTime:(double)a3
{
  if ([(PLVideoView *)self _scrubberTimeNeedsMapping])
  {
    memset(&v8, 0, sizeof(v8));
    CMTimeMakeWithSeconds(&v8, a3, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
    memset(&v7[32], 0, 24);
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    if (videoAVObjectBuilder)
    {
      *(CMTime *)CMTime v7 = v8;
      [(PFVideoAVObjectBuilder *)videoAVObjectBuilder convertToOriginalTimeFromScaledTime:v7 forExport:0];
    }
    *(CMTime *)CMTime v7 = *(CMTime *)&v7[32];
    return CMTimeGetSeconds((CMTime *)v7);
  }
  return a3;
}

- (double)_movieTimeFromScrubberTime:(double)a3
{
  if ([(PLVideoView *)self _scrubberTimeNeedsMapping])
  {
    memset(&v8, 0, sizeof(v8));
    CMTimeMakeWithSeconds(&v8, a3, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
    memset(&v7[32], 0, 24);
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    if (videoAVObjectBuilder)
    {
      *(CMTime *)CMTime v7 = v8;
      [(PFVideoAVObjectBuilder *)videoAVObjectBuilder convertToScaledTimeFromOriginalTime:v7 forExport:0];
    }
    *(CMTime *)CMTime v7 = *(CMTime *)&v7[32];
    return CMTimeGetSeconds((CMTime *)v7);
  }
  return a3;
}

- (double)_thumbnailTimeFromScrubberTime:(double)a3
{
  if (![(PLVideoView *)self _scrubberTimeNeedsMapping])
  {
    memset(&v8, 0, sizeof(v8));
    CMTimeMakeWithSeconds(&v8, a3, [MEMORY[0x1E4F8CDA0] preferredTimeScale]);
    memset(&v7[32], 0, 24);
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    if (videoAVObjectBuilder)
    {
      *(CMTime *)CMTime v7 = v8;
      [(PFVideoAVObjectBuilder *)videoAVObjectBuilder convertToOriginalTimeFromScaledTime:v7 forExport:0];
    }
    *(CMTime *)CMTime v7 = *(CMTime *)&v7[32];
    return CMTimeGetSeconds((CMTime *)v7);
  }
  return a3;
}

- (id)_thumbnailSourceAsset
{
  if (objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "hasSlowMotionAdjustments"))
  {
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    return (id)[(PFVideoAVObjectBuilder *)videoAVObjectBuilder videoAsset];
  }
  else
  {
    double v5 = [(AVPlayer *)[(PLMoviePlayerController *)self->_moviePlayer player] currentItem];
    return [(AVPlayerItem *)v5 asset];
  }
}

- (double)_movieScrubberDuration
{
  double duration = self->_duration;
  if ([(PLVideoView *)self _scrubberTimeNeedsMapping])
  {
    double v4 = (void *)[(PFVideoAVObjectBuilder *)self->__videoAVObjectBuilder videoAsset];
    if (v4) {
      [v4 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    return CMTimeGetSeconds(&time);
  }
  return duration;
}

- (BOOL)_scrubberTimeNeedsMapping
{
  int v3 = [(PLVideoView *)self _shouldShowSlalomEditor];
  if (v3)
  {
    double v4 = (void *)[(PFVideoAVObjectBuilder *)self->__videoAVObjectBuilder videoAdjustments];
    LOBYTE(v3) = [v4 hasSlowMotionAdjustments];
  }
  return v3;
}

- (void)notifyOfChange:(id)a3 shouldReloadBlock:(id)a4
{
  if (!objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "isRecognizedFormat"))
  {
LABEL_5:
    uint64_t v10 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "changeDetailsForObject:", -[PLManagedAsset pl_PHAssetFromPhotoLibrary:](self->_videoCameraImage, "pl_PHAssetFromPhotoLibrary:", pl_appPhotoLibrary())), "assetContentChanged"))
  {
    int64_t expectedNotificationsCount = self->__expectedNotificationsCount;
    BOOL v8 = expectedNotificationsCount < 1;
    int64_t v9 = expectedNotificationsCount - 1;
    if (!v8)
    {
      uint64_t v10 = 0;
      self->__int64_t expectedNotificationsCount = v9;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v10 = 0;
LABEL_7:
  unsigned int v11 = (void (*)(id, uint64_t))*((void *)a4 + 2);
  v11(a4, v10);
}

- (void)_scrubToMovieTime:(double)a3
{
  -[PLVideoView _scrubberTimeFromMovieTime:](self, "_scrubberTimeFromMovieTime:");
  double v6 = v5;
  -[UIMovieScrubber setValue:](self->_scrubber, "setValue:");
  [(PLVideoView *)self setCurrentTime:a3];
  self->_double lastScrubbedValue = v6;
}

- (double)currentTime
{
  double result = 0.0;
  if ((*((unsigned char *)self + 651) & 8) != 0) {
    [(PLMoviePlayerController *)self->_moviePlayer currentTime];
  }
  self->_cachedCurrentPlaybackTime = result;
  return result;
}

- (void)setCurrentTime:(double)a3
{
  self->_cachedCurrentPlaybackTime = a3;
  if ((*((unsigned char *)self + 651) & 8) != 0) {
    -[PLMoviePlayerController setCurrentTime:timeSnapOption:](self->_moviePlayer, "setCurrentTime:timeSnapOption:", 2);
  }
}

- (BOOL)loadMediaImmediately
{
  return (*((unsigned __int8 *)self + 649) >> 3) & 1;
}

- (void)setLoadMediaImmediately:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 649) = *((unsigned char *)self + 649) & 0xF7 | v3;
}

- (BOOL)scrubberIsSubview
{
  return (*((unsigned __int8 *)self + 649) >> 4) & 1;
}

- (void)setScrubberIsSubview:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 649) = *((unsigned char *)self + 649) & 0xEF | v3;
}

- (BOOL)_canEditDuration:(double)a3
{
  return fabs(a3 + -1.0) > 0.5;
}

- (BOOL)canEdit
{
  if ((*((unsigned char *)self + 649) & 4) != 0)
  {
    BOOL v2 = [(PLVideoView *)self _canEditDuration:self->_duration];
    if (v2) {
      LOBYTE(v2) = ![(PLVideoView *)self _localVideoUnavailable];
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)_setLocalVideoUnavailable:(BOOL)a3
{
  if (self->__localVideoUnavailable != a3)
  {
    self->__localVideoUnavailable = a3;
    [(PLVideoView *)self _updateScrubberVisibilityWithDuration:0.0];
  }
}

- (void)setCanEdit:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 649);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 649) = v3 & 0xFB | v4;
    [(PLVideoView *)self _updateScrubberVisibilityWithDuration:0.0];
  }
}

- (void)notifyRequiredResourcesDownloaded
{
  if ([(PLVideoView *)self _localVideoUnavailable])
  {
    [(PLVideoView *)self _fetchLocalContentEditingInput];
  }
}

- (BOOL)showsScrubber
{
  return (*((unsigned __int8 *)self + 649) >> 1) & 1;
}

- (void)setShowsScrubber:(BOOL)a3 duration:(double)a4
{
  char v4 = *((unsigned char *)self + 649);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 649) = v4 & 0xFD | v7;
    if (a3 && self->_prepareMoviePlayerForScrubberAutomatically)
    {
      dispatch_time(0, 200000000);
      pl_dispatch_after();
    }
    [(PLVideoView *)self _updateScrubberVisibilityWithDuration:a4];
  }
}

uint64_t __41__PLVideoView_setShowsScrubber_duration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupMoviePlayerIfNecessary];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _prepareMoviePlayerIfNeeded];
}

- (void)setShowsScrubber:(BOOL)a3
{
}

- (BOOL)showsPlayOverlay
{
  return *((unsigned char *)self + 649) & 1;
}

- (void)setShowsPlayOverlay:(BOOL)a3
{
  int v4 = [(PLVideoView *)self _canAccessVideo] && a3;
  char v5 = *((unsigned char *)self + 649);
  if (((v4 ^ ((v5 & 1) == 0)) & 1) == 0)
  {
    *((unsigned char *)self + 649) = v5 & 0xFE | v4;
    if (!v4 || (*((unsigned char *)self + 650) & 4) != 0)
    {
      [(PLVideoView *)self _hideVideoOverlay:0];
    }
    else
    {
      [(PLVideoView *)self _showVideoOverlay];
    }
  }
}

- (void)_updatePosterFrameVisibility
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v3 = [(PLMoviePlayerController *)self->_moviePlayer view];
  [(PLMoviePlayerView *)v3 setScaleMode:self->_scaleMode];
  if ([(PLMoviePlayerView *)v3 destinationPlaceholderStyle]) {
    BOOL v4 = (*((unsigned char *)self + 652) & 2) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = [(PLVideoView *)self _playerIsAirplay];
  if ((*((unsigned char *)self + 651) & 8) == 0) {
    goto LABEL_14;
  }
  if (v5)
  {
    if (v4)
    {
LABEL_14:
      int v8 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    char v6 = (*((unsigned char *)self + 651) & 0x10) == 0 || v4;
    if (v6) {
      goto LABEL_14;
    }
  }
  if ([(PLVideoView *)self _shouldStreamVideo])
  {
    [(PLMoviePlayerController *)self->_moviePlayer playbackRate];
    if (v7 < 1.0) {
      goto LABEL_14;
    }
  }
  int v8 = 0;
LABEL_15:
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) update poster frame visibility to %d", (uint8_t *)v10, 8u);
  }
  [(PLVideoPosterFrameView *)self->_posterFrameView setHidden:v8 ^ 1u];
  [(PLMoviePlayerView *)v3 setDestinationPlaceholderHidden:v4];
}

- (void)_updatePosterImageView
{
  if ([(PLVideoView *)self _mediaIsVideo]
    || [(PLVideoView *)self _mediaIsCloudSharedStreamedVideo])
  {
    snapshotImage = self->_snapshotImage;
    if (!snapshotImage)
    {
      if (!self->_posterFrameImage && [(PLVideoView *)self _didSetPhotoData])
      {
        if (PLGetPhotoLibraryClient() == 1)
        {
          uint64_t v4 = [(PLManagedAsset *)self->_videoCameraImage pathForVideoPreviewFile];
          posterFrameImage = (UIImage *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithContentsOfFile:v4];
          self->_posterFrameImage = posterFrameImage;
        }
        else
        {
          posterFrameImage = self->_posterFrameImage;
        }
        if (!posterFrameImage)
        {
          uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F8B918], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice"), "formatID");
          float v7 = (UIImage *)[MEMORY[0x1E4F8A888] newSynchronousImageForAsset:self->_videoCameraImage withFormat:v6 allowPlaceholder:1 outImageProperties:0 outDeliveredPlaceholder:0];
          self->_posterFrameImage = v7;
          if (!v7)
          {
            [(PLVideoView *)self pathForVideoFile];
            PLPreviewImageAndDurationForVideoAtPath();
            self->_posterFrameImage = (UIImage *)0;
          }
        }
      }
      self->_scaleMode = 1;
      int v8 = self->_posterFrameImage;
      if (v8)
      {
        [(UIImage *)v8 size];
        -[PLVideoView _updateScaleModeForSize:](self, "_updateScaleModeForSize:");
      }
      else if ([(PLVideoView *)self _canCreateMetadata])
      {
        *((unsigned char *)self + 652) |= 0x20u;
      }
      snapshotImage = self->_posterFrameImage;
    }
    [(PLVideoPosterFrameView *)self->_posterFrameView setScaleMode:self->_scaleMode];
    [(PLVideoPosterFrameView *)self->_posterFrameView setImage:snapshotImage];
  }
}

- (void)_invalidateSnapshotImage
{
  self->_snapshotImage = 0;
}

- (void)_updateSnapshotImage
{
  if ((*((unsigned char *)self + 651) & 8) != 0
    && (*((unsigned char *)self + 651) & 0x10) != 0
    && ![(PLMoviePlayerController *)self->_moviePlayer isExternalPlayback])
  {

    self->_snapshotImage = (UIImage *)[(PLVideoView *)self _videoSnapshot];
    [(PLVideoView *)self _updatePosterImageView];
  }
}

- (UIImage)posterFrameImage
{
  return self->_posterFrameImage;
}

- (void)setPosterFrameImage:(id)a3
{
  if (a3)
  {
    posterFrameImage = self->_posterFrameImage;
    if (posterFrameImage != a3)
    {

      self->_posterFrameImage = (UIImage *)a3;
      [(PLVideoView *)self _updatePosterImageView];
    }
  }
}

- (void)didMoveToSuperview
{
  char v3 = (void *)[(PLVideoView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 bounds];
    -[PLVideoView setBounds:](self, "setBounds:");
    UIRectGetCenter();
    -[PLVideoView setCenter:](self, "setCenter:");
    uint64_t v4 = [(PLMoviePlayerController *)self->_moviePlayer view];
    if ((PLVideoView *)[(PLMoviePlayerView *)v4 superview] == self)
    {
      [(PLVideoView *)self bounds];
      -[PLMoviePlayerView setFrame:](v4, "setFrame:");
    }
  }
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3)
  {
    if ((*((unsigned char *)self + 650) & 4) != 0) {
      [(PLVideoView *)self _resetScrubberUpdateTimer];
    }
  }
  else
  {
    [(PLVideoView *)self _removeScrubberUpdateTimer];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PLVideoView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PLVideoView;
  -[PLVideoView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (self->_scrubber)
  {
    v17.origin.double x = v9;
    v17.origin.double y = v11;
    v17.size.double width = v13;
    v17.size.double height = v15;
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    if (!CGRectEqualToRect(v17, v18)) {
      [(PLVideoView *)self _setNeedsReloadScrubberThumbnails:1];
    }
  }
  if ((*((unsigned char *)self + 650) & 2) != 0 && (*((unsigned char *)self + 649) & 0x20) == 0)
  {
    [(UIMovieScrubber *)self->_scrubber setDataSource:0];
    [(UIMovieScrubber *)self->_scrubber setDelegate:0];
  }
}

- (void)applicationDidEnterBackground
{
}

- (void)applicationWillResignActive
{
}

- (void)viewDidDisappear
{
  if ((*((unsigned char *)self + 649) & 0x20) != 0)
  {
    [(PLVideoView *)self _setPlaybackDidBegin:0];
    +[PLVideoView cancelPreviousPerformRequestsWithTarget:self];
    [(PLVideoView *)self setShowsScrubber:0 duration:0.0];
    [(PLVideoView *)self _hideVideoOverlay:0];
    *((unsigned char *)self + 649) &= ~0x20u;
    if ((*((unsigned char *)self + 652) & 4) != 0)
    {
      *((unsigned char *)self + 652) &= ~4u;
      [(PLVideoView *)self _removeScrubber];
    }
    [(PLVideoView *)self stop];
    [(PLMoviePlayerController *)self->_moviePlayer requestToResignAsActiveController];
    [(PLMoviePlayerController *)self->_moviePlayer tearDownTVOutWindow];
  }
  [(PLVideoView *)self _cancelAirplayExportSession];
  [(PLVideoView *)self _commitPendingAdjustmentsUpdateAndWait:0 completionHandler:0];
}

- (void)viewDidAppear
{
  [(PLVideoView *)self _updateScrubberVisibilityWithDuration:0.0];
  if ((*((unsigned char *)self + 650) & 4) == 0
    && (*((unsigned char *)self + 651) & 0x40) == 0
    && ![(PLVideoView *)self shouldPlayVideoWhenViewAppears])
  {
    [(PLVideoView *)self _showVideoOverlay];
  }
  if ([(PLVideoView *)self loadMediaImmediately]) {
    [(PLVideoView *)self _prepareMoviePlayerIfNeeded];
  }
  if ([(PLVideoView *)self shouldPlayVideoWhenViewAppears])
  {
    [(PLVideoView *)self play];
    [(PLVideoView *)self setShouldPlayVideoWhenViewAppears:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  *((unsigned char *)self + 649) |= 0x40u;
  if ((*((unsigned char *)self + 649) & 0x20) == 0)
  {
    *((unsigned char *)self + 649) |= 0x20u;
    [(PLMoviePlayerController *)self->_moviePlayer requestToBecomeActiveController];
    [(PLVideoView *)self _updatePosterImageView];
    [(PLVideoView *)self _updatePosterFrameVisibility];
    if ((*((unsigned char *)self + 650) & 4) != 0
      || [(PLVideoView *)self shouldPlayVideoWhenViewAppears])
    {
      [(PLVideoView *)self _hideVideoOverlay:1];
    }
    else
    {
      [(PLVideoView *)self _showVideoOverlay];
    }
  }
}

- (void)_updateScrubberVisibilityWithDuration:(double)a3
{
  if ((*((unsigned char *)self + 649) & 2) != 0
    && (*((unsigned char *)self + 651) & 8) != 0
    && self->_duration > 0.0
    && [(PLVideoView *)self _canAccessVideo])
  {
    [(PLVideoView *)self _createScrubberIfNeeded];
    [(UIMovieScrubber *)self->_scrubber setEditable:[(PLVideoView *)self canEdit]];
    [(PLVideoView *)self _reloadScrubberThumbnailsIfNeeded];
    int v5 = 1;
  }
  else
  {
    int v5 = 0;
  }
  unsigned int v6 = *((unsigned __int8 *)self + 651);
  if (v5 != v6 >> 7)
  {
    if (v5) {
      char v7 = 0x80;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 651) = v7 & 0x80 | v6 & 0x7F;
    if ((*((unsigned char *)self + 649) & 0x10) != 0) {
      -[UIMovieScrubber setEnabled:](self->_scrubber, "setEnabled:");
    }
    [(PLVideoView *)self _updateSlalomRegionEditorState];
    [(PLVideoView *)self _updateScrubberFrame];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__PLVideoView__updateScrubberVisibilityWithDuration___block_invoke;
    v8[3] = &unk_1E63D2660;
    v8[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:a3];
  }
}

uint64_t __53__PLVideoView__updateScrubberVisibilityWithDuration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 1.0;
  if (*(char *)(v1 + 651) >= 0) {
    double v2 = 0.0;
  }
  return [*(id *)(v1 + 496) setAlpha:v2];
}

- (void)stop
{
  [(PLVideoView *)self _removeScrubberUpdateTimer];
  [(PLVideoView *)self _removePlaySpinner];
  if ((*((unsigned char *)self + 650) & 8) != 0) {
    [(UIMovieScrubber *)self->_scrubber setThumbIsVisible:0];
  }
  char v3 = *((unsigned char *)self + 650);
  if ((v3 & 4) != 0 || (*((unsigned char *)self + 652) & 2) != 0)
  {
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) pause due to stop", v5, 2u);
    }
    [(PLMoviePlayerController *)self->_moviePlayer pause];
    [(PLVideoView *)self _setPlaying:0];
    [(PLVideoView *)self _setPlaybackDidBegin:0];
    self->_double lastScrubbedValue = -1.0;
    if (v3 & 4) != 0 && self->_delegate && (objc_opt_respondsToSelector()) {
      [(PLVideoViewDelegate *)self->_delegate videoViewDidEndPlayback:self didFinish:0];
    }
  }
}

- (void)pause
{
  [(PLVideoView *)self _removeScrubberUpdateTimer];
  [(PLVideoView *)self _removePlaySpinner];
  [(PLVideoView *)self _setPlaying:0];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) pause due to video view pause", v4, 2u);
  }
  [(PLMoviePlayerController *)self->_moviePlayer pause];
  if ((*((unsigned char *)self + 650) & 8) != 0 && (*((unsigned char *)self + 650) & 0x20) == 0)
  {
    self->_double lastScrubbedValue = -1.0;
    [(UIMovieScrubber *)self->_scrubber setThumbIsVisible:0];
  }
  if (*((unsigned char *)self + 650) & 0x20) == 0 && self->_delegate && (objc_opt_respondsToSelector()) {
    [(PLVideoViewDelegate *)self->_delegate videoViewDidEndPlayback:self didFinish:0];
  }
}

- (void)play
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_videoStreamingStartTime = CFAbsoluteTimeGetCurrent();
  [(PLVideoView *)self _insertMoviePlayerViewIfNecessary];
  [(PLVideoView *)self _hideVideoOverlay:1];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = objc_opt_class();
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) play in %@", buf, 0xCu);
  }
  if (![(PLVideoView *)self _mediaIsCloudSharedStreamedVideo]) {
    goto LABEL_8;
  }
  if ([(PLVideoView *)self _canPlayCloudSharedStreamedVideoWithLocalVideo])
  {
    uint64_t v4 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:
      if ([(PLVideoView *)self _shouldStreamVideo]) {
        [(PLVideoView *)self _displayPlaySpinner];
      }
      BOOL v7 = [(PLVideoView *)self _prepareMoviePlayerIfNeeded];
      char v8 = *((unsigned char *)self + 650);
      [(PLVideoView *)self _setPlaying:1];
      if (v7)
      {
        if (*((unsigned char *)self + 650))
        {
          if ((*((unsigned char *)self + 650) & 8) != 0)
          {
            [(PLVideoView *)self _scrubberStartTime];
            -[UIMovieScrubber setValue:animated:](self->_scrubber, "setValue:animated:", 0);
            [(PLVideoView *)self startTime];
            -[PLVideoView setCurrentTime:](self, "setCurrentTime:");
            [(PLVideoView *)self endTime];
            CMTimeMakeWithSeconds(&v20, v13, 1);
            double v14 = [(AVPlayer *)[(PLMoviePlayerController *)self->_moviePlayer player] currentItem];
            CMTime v19 = v20;
            [(AVPlayerItem *)v14 setForwardPlaybackEndTime:&v19];
            [(PLMoviePlayerController *)self->_moviePlayer play];
          }
          else
          {
            [(UIMovieScrubber *)self->_scrubber setValue:0 animated:0.0];
            [(PLMoviePlayerController *)self->_moviePlayer playFromBeginning];
          }
          *((unsigned char *)self + 650) &= ~1u;
        }
        else
        {
          [(PLMoviePlayerController *)self->_moviePlayer play];
        }
        [(PLVideoView *)self _verifyOrRestartPlayback];
        if (v8 & 4) == 0 && self->_delegate && (objc_opt_respondsToSelector()) {
          [(PLVideoViewDelegate *)self->_delegate videoViewDidBeginPlayback:self];
        }
      }
      return;
    }
    pathToOriginalVideo = self->_pathToOriginalVideo;
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = (uint64_t)pathToOriginalVideo;
    unsigned int v6 = "(streamed-video-playback) will play streamed video using original video at path %@";
LABEL_7:
    _os_log_impl(&dword_1BEE94000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    goto LABEL_8;
  }
  uint64_t v9 = [(PLManagedAsset *)self->_videoCameraImage cachedNonPersistedVideoPlaybackURLError];
  if (v9)
  {
    double v10 = (void *)v9;
    uint64_t v11 = PLLocalizedFrameworkString();
    uint64_t v12 = [v10 localizedDescription];
    objc_msgSend((id)-[PLVideoView window](self, "window"), "pl_presentViewController:animated:", objc_msgSend(MEMORY[0x1E4F42728], "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1), 1);
    [(PLManagedAsset *)self->_videoCameraImage setCachedNonPersistedVideoPlaybackURLError:0];
    return;
  }
  [(PLVideoView *)self _displayPlaySpinner];
  if ([(PLManagedAsset *)self->_videoCameraImage cachedNonPersistedVideoPlaybackURL])
  {
    uint64_t v4 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    uint64_t v15 = [(PLManagedAsset *)self->_videoCameraImage cachedNonPersistedVideoPlaybackURL];
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v15;
    unsigned int v6 = "(streamed-video-playback) already have a cachedNonPersistedVideoPlaybackURL %@";
    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F8AAB0] isCellularConnection])
  {
    objc_super v16 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEE94000, v16, OS_LOG_TYPE_DEFAULT, "Playing 360p video for cellular connection.", buf, 2u);
    }
    uint64_t v17 = 6;
  }
  else
  {
    uint64_t v17 = 7;
  }
  videoCameraImage = self->_videoCameraImage;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __19__PLVideoView_play__block_invoke;
  v21[3] = &unk_1E63D2660;
  v21[4] = self;
  [MEMORY[0x1E4F8AAB0] requestVideoPlaybackURLForAsset:videoCameraImage videoType:v17 completion:v21];
}

uint64_t __19__PLVideoView_play__block_invoke()
{
  return pl_dispatch_async();
}

uint64_t __19__PLVideoView_play__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 408) cachedNonPersistedVideoPlaybackURL];
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(streamed-video-playback) will play video for %@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 408) cachedNonPersistedVideoPlaybackURL];
  if (result) {
    return [*(id *)(a1 + 32) play];
  }
  return result;
}

- (void)_removePlaySpinner
{
  self->_spinner = 0;
  self->_shadowSpinner = 0;
}

- (void)_displayPlaySpinner
{
  if (!self->_shadowSpinner)
  {
    uint64_t v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    self->_shadowSpinner = v3;
    [(PLVideoView *)self addSubview:v3];
  }
  if (!self->_spinner)
  {
    self->_spinner = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", [MEMORY[0x1E4F428B8] whiteColor]);
    [(PLVideoView *)self insertSubview:self->_spinner aboveSubview:self->_shadowSpinner];
  }
  [(PLVideoView *)self setNeedsLayout];
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  shadowSpinner = self->_shadowSpinner;
  [(UIActivityIndicatorView *)shadowSpinner startAnimating];
}

- (BOOL)playingToVideoOut
{
  return [(PLMoviePlayerController *)self->_moviePlayer videoOutActive];
}

- (BOOL)playingToAirTunes
{
  return [(PLMoviePlayerController *)self->_moviePlayer isExternalPlayback];
}

- (void)_verifyOrRestartPlayback
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = (*((unsigned __int8 *)self + 650) >> 2) & 1;
    int v5 = (*((unsigned __int8 *)self + 651) >> 5) & 1;
    v10[0] = 67109376;
    v10[1] = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) _verifyOrRestartPlayback playing %u didBuffer %u", (uint8_t *)v10, 0xEu);
  }
  if ((*((unsigned char *)self + 650) & 4) != 0 && (*((unsigned char *)self + 651) & 0x20) != 0)
  {
    [(PLMoviePlayerController *)self->_moviePlayer playbackRate];
    float v7 = v6;
    char v8 = PLPhotoSharingGetLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 <= 0.0)
    {
      if (v9)
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl(&dword_1BEE94000, v8, OS_LOG_TYPE_DEFAULT, "(video-playback) _verifyOrRestartPlayback telling movie player to play", (uint8_t *)v10, 2u);
      }
      [(PLVideoView *)self _removePlaySpinner];
      [(PLMoviePlayerController *)self->_moviePlayer playDueToEnoughData];
    }
    else
    {
      if (v9)
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl(&dword_1BEE94000, v8, OS_LOG_TYPE_DEFAULT, "(video-playback) _verifyOrRestartPlayback rate > 0", (uint8_t *)v10, 2u);
      }
      [(PLVideoView *)self _didBeginPlayback];
    }
    if (self->_videoStreamingStartTime > 0.0) {
      self->_videoStreamingStartTime = 0.0;
    }
    [(PLVideoView *)self _removeScrubberUpdateTimer];
    [(PLVideoView *)self _resetScrubberUpdateTimer];
  }
}

- (void)_didBeginPlayback
{
  [(PLVideoView *)self _removePlaySpinner];
  [(UIMovieScrubber *)self->_scrubber setThumbIsVisible:1];
  if ((*((unsigned char *)self + 652) & 2) == 0)
  {
    [(PLVideoView *)self _setPlaybackDidBegin:1];
    [(PLVideoView *)self _hideVideoOverlay:1];
    [(PLVideoView *)self _hideTrimMessageView:1];
    if (self->_delegate)
    {
      if (objc_opt_respondsToSelector()) {
        [(PLVideoViewDelegate *)self->_delegate videoViewDidBeginPlayback:self];
      }
    }
  }
  [(PLVideoView *)self _updatePosterFrameVisibility];
}

- (BOOL)isPlaying
{
  return (*((unsigned __int8 *)self + 650) >> 2) & 1;
}

- (void)handleDoubleTap
{
  if (![(PLMoviePlayerView *)[(PLMoviePlayerController *)self->_moviePlayer view] destinationPlaceholderStyle])
  {
    LODWORD(v3) = 1045220557;
    [(PLVideoView *)self toggleScaleMode:v3];
  }
}

- (void)toggleScaleMode:(float)a3
{
  int v5 = [(PLMoviePlayerController *)self->_moviePlayer view];
  if (self->_scaleMode == 1) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = 1;
  }
  self->_scaleMode = v6;
  -[PLMoviePlayerView setScaleMode:duration:](v5, "setScaleMode:duration:", a3);
  [(PLVideoView *)self _invalidateSnapshotImage];
  posterFrameView = self->_posterFrameView;
  if (posterFrameView)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__PLVideoView_toggleScaleMode___block_invoke;
    v8[3] = &unk_1E63D2660;
    BOOL v9 = self;
    if (a3 <= 0.0)
    {
      [(PLVideoPosterFrameView *)posterFrameView setScaleMode:self->_scaleMode];
      [(PLVideoPosterFrameView *)v9->_posterFrameView layoutIfNeeded];
    }
    else
    {
      [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:a3];
    }
  }
}

uint64_t __31__PLVideoView_toggleScaleMode___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) setScaleMode:*(void *)(*(void *)(a1 + 32) + 488)];
  double v2 = *(void **)(*(void *)(a1 + 32) + 440);
  return [v2 layoutIfNeeded];
}

- (void)setImageTile:(id)a3
{
  self->_imageTile = (PLPhotoTileViewController *)a3;
}

- (PLPhotoTileViewController)imageTile
{
  return self->_imageTile;
}

- (PLManagedAsset)videoCameraImage
{
  return self->_videoCameraImage;
}

- (UIImageView)previewImageView
{
  return (UIImageView *)[(PLVideoPosterFrameView *)self->_posterFrameView imageView];
}

- (id)_videoSnapshot
{
  double v3 = [(PLMoviePlayerView *)[(PLMoviePlayerController *)self->_moviePlayer view] videoView];
  int v4 = v3;
  if (v3)
  {
    if ((*((unsigned char *)self + 651) & 8) != 0
      && (int v5 = (__IOSurface *)-[UIView _createIOSurfaceWithPadding:](v3, "_createIOSurfaceWithPadding:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24))) != 0)
    {
      int64_t v6 = v5;
      IOSurfaceLock(v5, 1u, 0);
      BaseAddress = IOSurfaceGetBaseAddress(v6);
      size_t BytesPerRow = IOSurfaceGetBytesPerRow(v6);
      size_t Width = IOSurfaceGetWidth(v6);
      unint64_t Height = IOSurfaceGetHeight(v6);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      int v12 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
      CGColorSpaceRelease(DeviceRGB);
      if (v12)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "scale");
        CGFloat v14 = v13;
        CGContextTranslateCTM(v12, 0.0, (double)Height);
        CGContextScaleCTM(v12, v14, -v14);
        CGAffineTransformMakeScale(&v23, v14, -v14);
        CGContextSetBaseCTM();
        CGImageRef Image = CGBitmapContextCreateImage(v12);
        if (!Image) {
          goto LABEL_10;
        }
        objc_super v16 = Image;
        [(UIView *)v4 videoRect];
        v24.origin.double x = v14 * v17;
        v24.origin.double y = v14 * v18;
        v24.size.double width = v14 * v19;
        v24.size.double height = v14 * v20;
        CGImageRef v21 = CGImageCreateWithImageInRect(v16, v24);
        CFRelease(v16);
        if (v21)
        {
          int v4 = (UIView *)[MEMORY[0x1E4F42A80] imageWithCGImage:v21 scale:0 orientation:v14];
          CFRelease(v21);
        }
        else
        {
LABEL_10:
          int v4 = 0;
        }
        CFRelease(v12);
      }
      else
      {
        int v4 = 0;
      }
      IOSurfaceUnlock(v6, 1u, 0);
      CFRelease(v6);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (id)newPreviewImageData:(id *)a3
{
  int v5 = [(AVPlayerItem *)[(AVPlayer *)[(PLMoviePlayerController *)self->_moviePlayer player] currentItem] asset];
  int64_t v6 = (void *)[MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v5];
  if ([v6 count])
  {
    objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "naturalSize");
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  float v9 = v7 / v8;
  double v10 = rint(v9 * 110.0);
  __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:v5];
  [v11 setApertureMode:*MEMORY[0x1E4F15788]];
  objc_msgSend(v11, "setMaximumSize:", v10, 110.0);
  [v11 setAppliesPreferredTrackTransform:1];
  uint64_t v19 = 0;
  int v12 = (void *)MEMORY[0x1E4F8CC38];
  [(PLVideoView *)self startTime];
  CMTimeMakeWithSeconds(&v18, v13, 1);
  CGFloat v14 = (CGImage *)[v12 copyCGImageFromImageGenerator:v11 atTime:&v18 actualTime:0 error:&v19];
  if (!v14)
  {
    [(PLVideoView *)self startTime];
    NSLog(&cfstr_UnableToCopyCg.isa, v15, v19);
  }
  if (a3) {
    *a3 = (id)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v14];
  }
  objc_super v16 = UIImageJPEGRepresentation((UIImage *)[MEMORY[0x1E4F42A80] imageWithCGImage:v14], 0.899999976);
  CGImageRelease(v14);

  return v16;
}

- (double)endTime
{
  [(UIMovieScrubber *)self->_scrubber trimEndValue];
  if (v3 == 0.0) {
    return self->_duration;
  }
  -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
  return result;
}

- (double)startTime
{
  [(PLVideoView *)self _scrubberStartTime];
  -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
  return result;
}

- (double)_scrubberStartTime
{
  [(UIMovieScrubber *)self->_scrubber trimStartValue];
  return result;
}

- (void)_reset
{
  [(PLVideoView *)self _removeScrubberUpdateTimer];
  [MEMORY[0x1E4F39CF8] flush];
  [(PLVideoView *)self _setPlaying:0];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) pause due to reset", v4, 2u);
  }
  [(PLMoviePlayerController *)self->_moviePlayer pause];
  [(PLMoviePlayerController *)self->_moviePlayer setPlayerItem:0 startTime:0.0];
  *((unsigned char *)self + 651) &= ~8u;
  *((unsigned char *)self + 651) &= ~0x10u;
  *((unsigned char *)self + 651) &= ~2u;
  *((unsigned char *)self + 651) &= ~0x20u;
  [(PLVideoView *)self _setPlaybackDidBegin:0];

  self->__videoAVObjectBuilder = 0;
  [(PLVideoView *)self _setDuration:self->_duration];
  self->_cachedCurrentPlaybackTime = 0.0;
  [(UIMovieScrubber *)self->_scrubber setEditing:0];
  [(UIMovieScrubber *)self->_scrubber setValue:0.0];
  [(UIMovieScrubber *)self->_scrubber setDelegate:0];
  if ((*((unsigned char *)self + 650) & 0x10) != 0)
  {
    [(UIMovieScrubber *)self->_scrubber setEditable:0];
    *((unsigned char *)self + 650) &= ~0x10u;
  }

  self->_cachedThumbnails = 0;
  self->_bakedPortraitThumbnails = 0;

  self->_bakedLandscapeThumbnails = 0;
  self->_landscapeSummaryThumbnailTimestamps = 0;

  self->_portraitSummaryThumbnailTimestamps = 0;
  self->_thumbnailSize = (CGSize)*MEMORY[0x1E4F1DB30];
  *((unsigned char *)self + 650) &= ~0x80u;
  [(PLVideoView *)self _updatePosterFrameVisibility];
  [(PLVideoView *)self viewDidAppear];
}

- (void)_setPlaybackDidBegin:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 652) = *((unsigned char *)self + 652) & 0xFD | v3;
  [(PLVideoView *)self _updatePosterFrameVisibility];
}

- (void)_setPlaying:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 650) = *((unsigned char *)self + 650) & 0xFB | v3;
}

- (void)_updateSlalomRegionEditorState
{
  if ((*((unsigned char *)self + 649) & 4) == 0
    || [(PLVideoView *)self _localVideoUnavailable]
    || [(PLVideoView *)self isEditing])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = (*((unsigned char *)self + 649) & 0x10) == 0 || *((char *)self + 651) < 0;
  }
  slalomRegionEditor = self->_slalomRegionEditor;
  [(PLSlalomRegionEditor *)slalomRegionEditor setEnabled:v3];
}

- (BOOL)isEditing
{
  return (*((unsigned __int8 *)self + 650) >> 3) & 1;
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  char v5 = *((unsigned char *)self + 650);
  char v6 = v5 & 8;
  if ((((v5 & 8) == 0) ^ a3))
  {
LABEL_7:
    if (!v6) {
      return;
    }
    goto LABEL_8;
  }
  BOOL v7 = a4;
  if (a3) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  *((unsigned char *)self + 650) = v5 & 0xF7 | v8;
  [(PLVideoView *)self _updateForEditing];
  [(UIMovieScrubber *)self->_scrubber setEditing:(*((unsigned __int8 *)self + 650) >> 3) & 1 animated:v7];
  if ((*((unsigned char *)self + 650) & 8) == 0)
  {
    [(UIMovieScrubber *)self->_scrubber value];
    -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
    -[PLVideoView setCurrentTime:](self, "setCurrentTime:");
    char v6 = *((unsigned char *)self + 650) & 8;
    goto LABEL_7;
  }
LABEL_8:
  *((unsigned char *)self + 650) |= 1u;
  *((unsigned char *)self + 649) &= ~0x80u;
  [(PLVideoView *)self pause];
}

- (void)hideTrimMessage
{
}

- (void)showTrimMessage:(id)a3 withBottomY:(float)a4
{
  if ((*((unsigned char *)self + 650) & 4) == 0)
  {
    trimMessageView = self->_trimMessageView;
    if (!trimMessageView)
    {
      [(PLVideoView *)self bounds];
      CGRect v11 = CGRectInset(v10, 10.0, 0.0);
      char v8 = -[PLVideoEditingOverlayView initWithFrame:]([PLVideoEditingOverlayView alloc], "initWithFrame:", v11.origin.x, (float)(a4 + -90.0), v11.size.width, 90.0);
      self->_trimMessageView = v8;
      [(PLVideoEditingOverlayView *)v8 setTitle:a3];
      [(PLVideoEditingOverlayView *)self->_trimMessageView setBody:PLLocalizedFrameworkString()];
      [(PLVideoEditingOverlayView *)self->_trimMessageView setAutoresizingMask:10];
      [(PLVideoView *)self insertSubview:self->_trimMessageView aboveSubview:self->_posterFrameView];
      trimMessageView = self->_trimMessageView;
    }
    -[PLVideoEditingOverlayView setAlpha:](trimMessageView, "setAlpha:", a3, 1.0);
  }
}

- (void)setMaximumTrimLength:(double)a3
{
  self->_maximumTrimLength = a3;
  -[UIMovieScrubber setMaximumTrimLength:](self->_scrubber, "setMaximumTrimLength:");
}

- (void)_createImageGenerators
{
  id v3 = [(PLVideoView *)self _thumbnailSourceAsset];
  int v4 = [[PLAssetImageGenerator alloc] initWithAsset:v3];
  char v5 = [[PLAssetImageGenerator alloc] initWithAsset:v3];
  self->_imageGenerators = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v4, v5, 0);
}

- (void)_clearImageGenerators
{
  self->_imageGenerators = 0;
}

- (void)_configureImageGenerator:(id)a3 thumbnailSize:(CGSize)thumbnailSize forSummaryThumbnails:(BOOL)a5
{
  if (thumbnailSize.width == *MEMORY[0x1E4F1DB30] && thumbnailSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    thumbnailSize = self->_thumbnailSize;
  }
  objc_msgSend(a3, "setMaximumSize:", thumbnailSize.width, thumbnailSize.height);
  [a3 setApertureMode:*MEMORY[0x1E4F15788]];
  [a3 setAppliesPreferredTrackTransform:1];
  if (!a5 && ([(PLManagedAsset *)self->_videoCameraImage isStreamedVideo] & 1) == 0)
  {
    long long v13 = *MEMORY[0x1E4F1FA48];
    long long v10 = v13;
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    uint64_t v9 = v14;
    [a3 setRequestedTimeToleranceBefore:&v13];
    long long v11 = v10;
    uint64_t v12 = v9;
    [a3 setRequestedTimeToleranceAfter:&v11];
  }
}

- (void)_serviceImageGenerationRequests
{
  objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->_imageGenerators, "firstObject"), "imageGenerator"), "maximumSize");
  if (v4 != self->_thumbnailSize.width || v3 != self->_thumbnailSize.height)
  {
    [(PLVideoView *)self _clearImageGenerators];
    [(PLVideoView *)self _createImageGenerators];
  }
  pl_dispatch_sync();
}

void __46__PLVideoView__serviceImageGenerationRequests__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 616);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (!v2) {
    return;
  }
  uint64_t v3 = *(void *)v31;
  while (2)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if (*(void *)v31 != v3) {
        objc_enumerationMutation(v1);
      }
      CMTime v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if ((objc_msgSend(v18, "inUse", v17) & 1) == 0)
      {
        uint64_t v5 = 656;
        uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 656) count];
        uint64_t v6 = *(void *)(a1 + 32);
        if (!v17)
        {
          uint64_t v5 = 664;
          if (![*(id *)(v6 + 664) count]) {
            continue;
          }
          uint64_t v6 = *(void *)(a1 + 32);
        }
        BOOL v7 = *(void **)(v6 + v5);
        *(void *)(*(void *)(a1 + 32) + v5) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (v7)
        {
          [v18 setInUse:1];
          char v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
          uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v10 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v27 != v11) {
                  objc_enumerationMutation(v7);
                }
                long long v13 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                objc_msgSend(v13, "doubleValue", v17);
                objc_msgSend(*(id *)(a1 + 32), "_thumbnailTimeFromScrubberTime:");
                uint64_t v14 = objc_msgSend(NSNumber, "numberWithDouble:");
                [v9 addObject:v14];
                long long v21 = 0uLL;
                uint64_t v22 = 0;
                if (v14) {
                  [v14 CMTimeValue];
                }
                long long v24 = v21;
                uint64_t v25 = v22;
                objc_msgSend(v8, "setObject:forKey:", v13, objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTime:", &v24));
              }
              uint64_t v10 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v10);
          }
          uint64_t v15 = (void *)[v18 imageGenerator];
          objc_msgSend(*(id *)(a1 + 32), "_configureImageGenerator:thumbnailSize:forSummaryThumbnails:", v15, v17 != 0, *(double *)(*(void *)(a1 + 32) + 528), *(double *)(*(void *)(a1 + 32) + 536));
          *(void *)&long long v21 = 0;
          *((void *)&v21 + 1) = &v21;
          uint64_t v22 = 0x2020000000;
          uint64_t v23 = 0;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __46__PLVideoView__serviceImageGenerationRequests__block_invoke_2;
          v20[3] = &unk_1E63D2818;
          uint64_t v16 = *(void *)(a1 + 32);
          v20[4] = v8;
          v20[5] = v16;
          v20[8] = &v21;
          v20[6] = v7;
          v20[7] = v18;
          [v15 generateCGImagesAsynchronouslyForTimes:v9 completionHandler:v20];

          _Block_object_dispose(&v21, 8);
          return;
        }
      }
    }
    uint64_t v2 = [v1 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v2) {
      continue;
    }
    break;
  }
}

uint64_t __46__PLVideoView__serviceImageGenerationRequests__block_invoke_2(uint64_t a1, int a2, CGImageRef image)
{
  if (image) {
    CGImageRetain(image);
  }
  pl_dispatch_async();
  uint64_t v4 = ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  uint64_t result = [*(id *)(a1 + 48) count];
  if (v4 == result)
  {
    pl_dispatch_sync();
    return pl_dispatch_async();
  }
  return result;
}

void __46__PLVideoView__serviceImageGenerationRequests__block_invoke_3(uint64_t a1)
{
  if (!*(void *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    long long v6 = *(_OWORD *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v3 = objc_msgSend(v2, "objectForKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTime:", &v6));
    if (v3)
    {
      uint64_t v4 = v3;
      [*(id *)(*(void *)(a1 + 40) + 672) setThumbnailImage:*(void *)(a1 + 56) forTimestamp:v3];
      [*(id *)(*(void *)(a1 + 40) + 688) setObject:*(void *)(a1 + 56) forKey:v4];
    }
  }
  uint64_t v5 = *(CGImage **)(a1 + 56);
  if (v5) {
    CGImageRelease(v5);
  }
}

uint64_t __46__PLVideoView__serviceImageGenerationRequests__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInUse:0];
}

uint64_t __46__PLVideoView__serviceImageGenerationRequests__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _serviceImageGenerationRequests];
  uint64_t result = [*(id *)(a1 + 32) _canCreateMetadata];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _saveCachedThumbnailsIfNecessary];
  }
  return result;
}

- (void)_addThumbnailRequestForTimestamp:(id)a3 isSummaryThumbnail:(BOOL)a4
{
}

uint64_t __67__PLVideoView__addThumbnailRequestForTimestamp_isSummaryThumbnail___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = &OBJC_IVAR___PLVideoView__summaryThumbnailRequestTimestamps;
  }
  else {
    uint64_t v1 = &OBJC_IVAR___PLVideoView__detailThumbnailRequestTimestamps;
  }
  return [*(id *)(*(void *)(a1 + 32) + *v1) addObject:*(void *)(a1 + 40)];
}

- (void)movieScrubber:(id)a3 willZoomToMinimumValue:(double)a4 maximumValue:(double)a5
{
}

- (void)movieScrubber:(id)a3 widthDelta:(float)a4 originXDelta:(float)a5
{
  [(UIMovieScrubber *)self->_scrubber frame];
  scrubber = self->_scrubber;
  double v9 = v8 + a5;
  [(UIMovieScrubber *)scrubber setFrame:v9];
}

- (void)movieScrubberDidBeginEditing:(id)a3
{
  *((unsigned char *)self + 650) |= 8u;
  [(PLVideoView *)self _updateForEditing];
}

- (void)movieScrubberDidFinishRequestingThumbnails:(id)a3
{
  if ((*((unsigned char *)self + 651) & 4) != 0) {
    *((unsigned char *)self + 652) &= ~4u;
  }
  [(PLVideoView *)self _serviceImageGenerationRequests];
}

- (void)movieScrubber:(id)a3 editingEndValueDidChange:(double)a4
{
}

- (void)movieScrubber:(id)a3 editingStartValueDidChange:(double)a4
{
}

- (void)movieScrubber:(id)a3 valueDidChange:(double)a4
{
}

- (void)_didScrubToValue:(double)a3 withHandle:(int)a4
{
  [(PLVideoView *)self _hideVideoOverlay:1];
  [(PLVideoView *)self _hideTrimMessageView:1];
  if ((*((unsigned char *)self + 650) & 0x20) != 0)
  {
    *((unsigned char *)self + 650) &= ~1u;
    *((unsigned char *)self + 650) = *((unsigned char *)self + 650) & 0xBF | ((self->_lastScrubbedValue < a3) << 6);
    self->_double lastScrubbedValue = a3;
  }
  if ((a4 - 1) <= 1 && (*((char *)self + 649) & 0x80000000) == 0)
  {
    *((unsigned char *)self + 650) |= 1u;
    self->_double lastScrubbedValue = -1.0;
  }
  [(PLVideoView *)self _movieTimeFromScrubberTime:a3];
  -[PLVideoView setCurrentTime:](self, "setCurrentTime:");
}

- (void)movieScrubberDidEndScrubbing:(id)a3 withHandle:(int)a4
{
  *((unsigned char *)self + 650) &= ~0x20u;
  if (*((char *)self + 649) < 0)
  {
    if ((a4 - 1) <= 1)
    {
      double lastScrubbedValue = self->_lastScrubbedValue;
      if (a4 == 2 && (*((unsigned char *)self + 650) & 0x40) != 0) {
        *((unsigned char *)self + 650) &= ~0x40u;
      }
      if ((*((unsigned char *)self + 650) & 8) != 0)
      {
        [(UIMovieScrubber *)self->_scrubber trimStartValue];
        double v9 = v8;
        [(UIMovieScrubber *)self->_scrubber trimEndValue];
        double v10 = v7;
        double lastActualValue = self->_lastActualValue;
        if (lastActualValue >= v9) {
          double v12 = self->_lastActualValue;
        }
        else {
          double v12 = v9;
        }
        if (v12 <= v7) {
          double v7 = v12;
        }
        if (lastActualValue < v9 || v12 > v10) {
          self->_double lastActualValue = v7;
        }
      }
      else
      {
        double v7 = self->_lastActualValue;
      }
      -[UIMovieScrubber setValue:](self->_scrubber, "setValue:", a3, v7);
      [(PLVideoView *)self _movieTimeFromScrubberTime:self->_lastActualValue];
      -[PLVideoView setCurrentTime:](self, "setCurrentTime:");
      self->_double lastScrubbedValue = self->_lastActualValue;
      if (a4 == 2)
      {
        [(PLVideoView *)self _movieTimeFromScrubberTime:lastScrubbedValue];
        CMTimeMakeWithSeconds(&v17, v14, 1);
        uint64_t v15 = [(AVPlayer *)[(PLMoviePlayerController *)self->_moviePlayer player] currentItem];
        CMTime v16 = v17;
        [(AVPlayerItem *)v15 setForwardPlaybackEndTime:&v16];
      }
    }
    [(PLVideoView *)self play];
  }
  else
  {
    [(PLVideoView *)self _invalidateSnapshotImage];
  }
}

- (void)movieScrubberDidBeginScrubbing:(id)a3 withHandle:(int)a4
{
  [(PLVideoView *)self _removeScrubberUpdateTimer];
  if ([(PLVideoView *)self playingToAirTunes])
  {
    char v6 = (32 * *((unsigned char *)self + 650)) & 0x80;
  }
  else if ([(PLMoviePlayerController *)self->_moviePlayer playbackState] == 1)
  {
    char v6 = 0x80;
  }
  else
  {
    char v6 = 0;
  }
  *((unsigned char *)self + 649) = *((unsigned char *)self + 649) & 0x7F | v6;
  *((unsigned char *)self + 650) |= 0x20u;
  [(UIMovieScrubber *)self->_scrubber value];
  self->_double lastScrubbedValue = v7;
  [(PLVideoView *)self _hideVideoOverlay:1];
  [(PLVideoView *)self _hideTrimMessageView:1];
  if (*((char *)self + 649) < 0)
  {
    [(PLVideoView *)self pause];
    if (a4 == 2)
    {
      CMTimeMakeWithSeconds(&v10, self->_duration, 1);
      double v8 = [(AVPlayer *)[(PLMoviePlayerController *)self->_moviePlayer player] currentItem];
      CMTime v9 = v10;
      [(AVPlayerItem *)v8 setForwardPlaybackEndTime:&v9];
    }
  }
}

- (void)_resetScrubberUpdateTimer
{
  if (!self->_scrubberUpdateTimer) {
    self->_scrubberUpdateTimer = (NSTimer *)(id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__updateScrubberValue selector:0 userInfo:1 repeats:0.25];
  }
}

- (void)_removeScrubberUpdateTimer
{
  self->_scrubberUpdateTimer = 0;
}

- (double)movieScrubberThumbnailAspectRatio:(id)a3
{
  uint64_t v4 = [(AVPlayer *)[(PLMoviePlayerController *)self->_moviePlayer player] currentItem];
  if (v4)
  {
    [(AVPlayerItem *)v4 presentationSize];
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v7 = 1.0;
  if (v5 > 0.0 && v6 > 0.0)
  {
    float v8 = v5 / v6;
    double width = self->_thumbnailSize.width;
    double height = self->_thumbnailSize.height;
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v12 = (void *)[MEMORY[0x1E4F8B918] defaultFormatChooser];
      if (v8 <= 1.0) {
        long long v13 = (void *)[v12 portraitScrubberThumbnailFormat];
      }
      else {
        long long v13 = (void *)[v12 landscapeScrubberThumbnailFormat];
      }
      [v13 size];
      double width = rint(height * v8);
      self->_thumbnailSize.double width = width;
      self->_thumbnailSize.double height = height;
    }
    BOOL useLandscapeCache = self->_useLandscapeCache;
    if (self->_useLandscapeCache) {
      uint64_t v15 = 544;
    }
    else {
      uint64_t v15 = 552;
    }
    if (!*(Class *)((char *)&self->super.super.super.isa + v15))
    {
      cachedThumbnails = self->_cachedThumbnails;
      if (!cachedThumbnails)
      {
        cachedThumbnails = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        self->_cachedThumbnails = cachedThumbnails;
        BOOL useLandscapeCache = self->_useLandscapeCache;
      }
      *(float *)&double width = v8;
      id v17 = -[PLVideoView _loadThumbnailsIntoDictionary:isLandscape:aspectRatio:](self, "_loadThumbnailsIntoDictionary:isLandscape:aspectRatio:", cachedThumbnails, useLandscapeCache, width, height);
      BOOL v18 = self->_useLandscapeCache;
      uint64_t v19 = (objc_class *)v17;
      double v20 = &OBJC_IVAR___PLVideoView__bakedLandscapeThumbnails;
      if (!v18) {
        double v20 = &OBJC_IVAR___PLVideoView__bakedPortraitThumbnails;
      }
      *(Class *)((char *)&self->super.super.super.isa + *v20) = v19;
    }
    return v8;
  }
  return v7;
}

- (id)_loadThumbnailsIntoDictionary:(id)a3 isLandscape:(BOOL)a4 aspectRatio:(float)a5
{
  if (a4) {
    double v7 = [(PLVideoView *)self _pathForPrebakedLandscapeScrubberThumbnails];
  }
  else {
    double v7 = [(PLVideoView *)self _pathForPrebakedPortraitScrubberThumbnails];
  }
  float v8 = v7;
  if (v7)
  {
    CMTime v9 = (void *)[MEMORY[0x1E4F8B918] defaultFormatChooser];
    if (a5 <= 1.0) {
      CMTime v10 = (void *)[v9 portraitScrubberThumbnailFormat];
    }
    else {
      CMTime v10 = (void *)[v9 landscapeScrubberThumbnailFormat];
    }
    uint64_t v11 = [v10 formatID];
    float v8 = (NSString *)[MEMORY[0x1E4F8AA40] thumbnailsWithContentsOfFile:v8 format:v11];
    double v12 = objc_msgSend((id)-[NSString options](v8, "options"), "objectForKey:", @"timestamps");
    uint64_t v13 = [(NSString *)v8 count];
    if (v13 >= 1)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
        objc_msgSend(a3, "setObject:forKey:", -[NSString thumbnailImageAtIndex:](v8, "thumbnailImageAtIndex:", i), objc_msgSend(v12, "objectAtIndex:", i));
    }
  }
  return v8;
}

- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4 isSummaryThumbnail:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [(NSMutableDictionary *)self->_cachedThumbnails objectForKey:a4];
  if (v8)
  {
    uint64_t v9 = v8;
    scrubber = self->_scrubber;
    [(UIMovieScrubber *)scrubber setThumbnailImage:v9 forTimestamp:a4];
  }
  else
  {
    [(PLVideoView *)self _addThumbnailRequestForTimestamp:a4 isSummaryThumbnail:v5];
  }
}

- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4
{
}

- (BOOL)_didSetPhotoData
{
  videoCameraCGImageRef Image = self->_videoCameraImage;
  if (!videoCameraImage) {
    return 1;
  }
  if ([(PLManagedAsset *)videoCameraImage isInFlight]) {
    return 0;
  }
  BOOL v5 = self->_videoCameraImage;
  return [(PLManagedAsset *)v5 complete];
}

- (BOOL)_canPlayCloudSharedStreamedVideoWithLocalVideo
{
  if (!self->_pathToOriginalVideo || ([MEMORY[0x1E4F8AAB0] debugAlwaysStreamSharedVideos] & 1) != 0) {
    return 0;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  pathToOriginalVideo = self->_pathToOriginalVideo;
  return [v4 fileExistsAtPath:pathToOriginalVideo];
}

- (BOOL)_shouldStreamVideo
{
  if ([(PLVideoView *)self _mediaIsCloudSharedStreamedVideo]) {
    return 1;
  }
  return [(PLVideoView *)self _shouldStreamCloudPhotoLibraryVideo];
}

- (BOOL)_shouldStreamCloudPhotoLibraryVideo
{
  videoCameraCGImageRef Image = self->_videoCameraImage;
  if (!videoCameraImage
    || ![(PLManagedAsset *)videoCameraImage cloudPlaceholderKind])
  {
    return 0;
  }
  return [(PLVideoView *)self _localVideoUnavailable];
}

- (BOOL)_mediaIsCloudSharedStreamedVideo
{
  videoCameraCGImageRef Image = self->_videoCameraImage;
  if (videoCameraImage) {
    LOBYTE(videoCameraImage) = [(PLManagedAsset *)videoCameraImage isStreamedVideo];
  }
  return (char)videoCameraImage;
}

- (BOOL)_mediaIsVideo
{
  videoCameraCGImageRef Image = self->_videoCameraImage;
  if (videoCameraImage) {
    return [(PLManagedAsset *)videoCameraImage isVideo];
  }
  else {
    return 1;
  }
}

- (BOOL)_mediaIsPlayable
{
  videoCameraCGImageRef Image = self->_videoCameraImage;
  if (!videoCameraImage
    || ([(PLManagedAsset *)videoCameraImage isVideo] & 1) != 0
    || ([(PLManagedAsset *)self->_videoCameraImage isStreamedVideo] & 1) != 0)
  {
    return 1;
  }
  BOOL v5 = self->_videoCameraImage;
  return [(PLManagedAsset *)v5 isAudio];
}

- (NSString)_pathForPrebakedPortraitScrubberThumbnails
{
  uint64_t result = (NSString *)self->_videoCameraImage;
  if (result) {
    return (NSString *)[(NSString *)result pathForPrebakedPortraitScrubberThumbnails];
  }
  return result;
}

- (NSString)_pathForPrebakedLandscapeScrubberThumbnails
{
  uint64_t result = (NSString *)self->_videoCameraImage;
  if (result) {
    return (NSString *)[(NSString *)result pathForPrebakedLandscapeScrubberThumbnails];
  }
  return result;
}

- (NSString)_pathForVideoPreviewFile
{
  uint64_t result = (NSString *)self->_videoCameraImage;
  if (result) {
    return (NSString *)[(NSString *)result pathForVideoPreviewFile];
  }
  return result;
}

- (id)_pathForOriginalFile
{
  uint64_t v3 = [(NSURL *)self->_videoURL path];
  if ([(PLVideoView *)self _mediaIsCloudSharedStreamedVideo])
  {
    if (!self->_pathToOriginalVideo || ([MEMORY[0x1E4F8AAB0] debugAlwaysStreamSharedVideos] & 1) != 0)
    {
      uint64_t v4 = (void *)[(PLManagedAsset *)self->_videoCameraImage cachedNonPersistedVideoPlaybackURL];
      return (id)[v4 absoluteString];
    }
    return self->_pathToOriginalVideo;
  }
  videoCameraCGImageRef Image = self->_videoCameraImage;
  if (!videoCameraImage) {
    return v3;
  }
  return (id)[(PLManagedAsset *)videoCameraImage pathForOriginalFile];
}

- (NSString)pathForVideoFile
{
  if (self->_videoCameraImage) {
    return (NSString *)[(PLManagedAsset *)self->_videoCameraImage pathForVideoFile];
  }
  else {
    return [(NSURL *)self->_videoURL path];
  }
}

- (void)movieScrubberDidEndAnimatingZoom:(id)a3
{
}

- (void)movieScrubberDidBeginAnimatingZoom:(id)a3
{
}

- (void)_saveCachedThumbnailsIfNecessary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL useLandscapeCache = self->_useLandscapeCache;
  uint64_t v4 = &OBJC_IVAR___PLVideoView__landscapeSummaryThumbnailTimestamps;
  if (!self->_useLandscapeCache) {
    uint64_t v4 = &OBJC_IVAR___PLVideoView__portraitSummaryThumbnailTimestamps;
  }
  BOOL v5 = *(Class *)((char *)&self->super.super.super.isa + *v4);
  double v6 = &OBJC_IVAR___PLVideoView__bakedLandscapeThumbnails;
  if (!self->_useLandscapeCache) {
    double v6 = &OBJC_IVAR___PLVideoView__bakedPortraitThumbnails;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "options"), "objectForKey:", @"timestamps");
  if (v5 && ([v5 isEqualToArray:v7] & 1) == 0)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = [(NSMutableDictionary *)self->_cachedThumbnails objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          if (v13) {
            [v8 addObject:v13];
          }
        }
        uint64_t v10 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }
    uint64_t v14 = [v8 count];
    if (v14 == [v5 count])
    {
      char v15 = *((unsigned char *)self + 652);
      CMTime v16 = (void *)[MEMORY[0x1E4F8B918] defaultFormatChooser];
      if ((v15 & 8) != 0) {
        id v17 = (void *)[v16 landscapeScrubberThumbnailFormat];
      }
      else {
        id v17 = (void *)[v16 portraitScrubberThumbnailFormat];
      }
      uint64_t v18 = [v17 formatID];
      uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"timestamps", 0);
      double v20 = (objc_class *)[objc_alloc(MEMORY[0x1E4F8AA40]) initWithImages:v8 format:v18 options:v19 delegate:0];

      if (useLandscapeCache) {
        long long v21 = [(PLVideoView *)self _pathForPrebakedLandscapeScrubberThumbnails];
      }
      else {
        long long v21 = [(PLVideoView *)self _pathForPrebakedPortraitScrubberThumbnails];
      }
      if (v21 && [(objc_class *)v20 saveToFile:v21])
      {
        if (useLandscapeCache) {
          uint64_t v22 = 544;
        }
        else {
          uint64_t v22 = 552;
        }

        *(Class *)((char *)&self->super.super.super.isa + v22) = v20;
      }
      else
      {
      }
    }
  }
}

- (id)movieScrubber:(id)a3 timestampsStartingAt:(id)a4 endingAt:(id)a5 maxCount:(int)a6
{
  return 0;
}

- (id)movieScrubber:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6
{
  [a5 doubleValue];
  double v11 = v10;
  [a6 doubleValue];
  double v13 = v12;
  [(PLVideoView *)self movieScrubberDuration:a3];
  double v15 = v14;
  if (v13 == 0.0) {
    goto LABEL_8;
  }
  CMTime v16 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  if (a4 >= 1)
  {
    double v18 = (v13 - v11) / (double)(a4 - 1);
    double v19 = v11;
    do
    {
      objc_msgSend(v16, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v19));
      double v19 = v18 + v19;
      if (v19 > v15)
      {
        double v17 = v19 + -0.001;
        BOOL v20 = v19 + -0.001 > v15;
        double v19 = v15;
        if (v20) {
          break;
        }
      }
      --a4;
    }
    while (a4);
  }
  if (!v16) {
LABEL_8:
  }
    CMTime v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  [(PLVideoView *)self _scrubberStartTime];
  if (v11 == v21 && v13 == v15)
  {
    if (self->_useLandscapeCache) {
      uint64_t v22 = 696;
    }
    else {
      uint64_t v22 = 704;
    }
    long long v23 = (Class *)((char *)&self->super.super.super.isa + v22);
    if (!*v23) {
      *long long v23 = v16;
    }
  }
  return v16;
}

- (void)moviePlayerHeadsetPreviousTrackPressed:(id)a3
{
  if ((*((unsigned char *)self + 651) & 4) != 0 && ((*((unsigned char *)self + 650) & 4) != 0 || (*((unsigned char *)self + 652) & 2) != 0)) {
    -[PLVideoView _scrubToMovieTime:](self, "_scrubToMovieTime:", a3, 0.0);
  }
}

- (void)moviePlayerHeadsetNextTrackPressed:(id)a3
{
  if ((*((unsigned char *)self + 651) & 4) != 0 && ((*((unsigned char *)self + 650) & 4) != 0 || (*((unsigned char *)self + 652) & 2) != 0)) {
    -[PLVideoView _scrubToMovieTime:](self, "_scrubToMovieTime:", a3, self->_duration);
  }
}

- (void)moviePlayerHeadsetPlayPausePressed:(id)a3
{
  if ((*((unsigned char *)self + 651) & 4) != 0 && (*((unsigned char *)self + 650) & 0x20) == 0)
  {
    if ([(PLMoviePlayerController *)self->_moviePlayer playbackState])
    {
      if ((*((unsigned char *)self + 650) & 4) != 0)
      {
        [(PLVideoView *)self pause];
        if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
        {
          delegate = self->_delegate;
          [(PLVideoViewDelegate *)delegate videoViewDidPausePlayback:self];
        }
      }
      else
      {
        [(PLVideoView *)self play];
      }
    }
    else
    {
      [(PLVideoView *)self _playbackFinished];
    }
  }
}

- (id)moviePlayerRequestsPickedAirplayRoute:(id)a3
{
  return 0;
}

- (BOOL)_playerIsAirplay
{
  return [(PLMoviePlayerController *)self->_moviePlayer externalPlaybackType] == 1;
}

- (void)moviePlayerDidChangeExternalPlaybackType:(id)a3
{
  BOOL v4 = [(PLVideoView *)self _playerIsAirplay];
  if (self->_isAirPlay != v4)
  {
    self->_isAirPladouble y = v4;
    if (![(PLVideoView *)self _canAirPlayCurrentVideo]) {
      pl_dispatch_async();
    }
  }
}

uint64_t __56__PLVideoView_moviePlayerDidChangeExternalPlaybackType___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(unsigned char *)(v1 + 651) & 2) != 0)
  {
    *(unsigned char *)(v1 + 651) &= ~2u;
    return [*(id *)(result + 32) _prepareAndResumePlayback];
  }
  return result;
}

- (BOOL)moviePlayerControllerShouldAllowExternalPlayback:(id)a3
{
  return 1;
}

- (void)moviePlayerEncounteredAuthenticationError:(id)a3
{
  [(PLManagedAsset *)self->_videoCameraImage setCachedNonPersistedVideoPlaybackURL:0];
  [(PLManagedAsset *)self->_videoCameraImage setCachedNonPersistedVideoPlaybackURLExpiration:0];
  [(PLManagedAsset *)self->_videoCameraImage setCachedNonPersistedVideoPlaybackURLError:0];
  *((unsigned char *)self + 651) &= ~2u;
  [(PLVideoView *)self play];
}

- (BOOL)moviePlayerShouldNotifyOnPreparationError:(id)a3
{
  BOOL v4 = [(PLVideoView *)self _canAttemptFetchingVideoDerivative];
  if (v4)
  {
    [(PLVideoView *)self _setCanAttemptFetchingVideoDerivative:0];
    [(PLMoviePlayerController *)self->_moviePlayer resetPlayer];
    [(PLVideoView *)self _reset];
    [(PLVideoView *)self _fetchNonlocalVideo];
  }
  return !v4;
}

- (void)moviePlayerControllerWillResignAsActiveController:(id)a3
{
  if (!self->_snapshotImage) {
    [(PLVideoView *)self _updateSnapshotImage];
  }
  if ((*((unsigned char *)self + 651) & 2) != 0)
  {
    [a3 currentTime];
    self->_cachedCurrentPlaybackTime = v5;
  }
  [(PLVideoView *)self _setMoviePlayerActive:0];
  [(PLVideoView *)self _setPlaybackDidBegin:0];
  [(PLVideoView *)self setShowsScrubber:0 duration:0.0];
  [(PLVideoView *)self _updatePosterFrameVisibility];
}

- (void)moviePlayerControllerDidBecomeActiveController:(id)a3
{
  if ((*((unsigned char *)self + 651) & 2) == 0) {
    *((unsigned char *)self + 651) |= 1u;
  }
  [(PLVideoView *)self _setPlaybackDidBegin:0];
  self->_double lastScrubbedValue = -1.0;
  self->_double lastActualValue = 0.0;
  *((unsigned char *)self + 650) &= ~0x40u;
}

- (void)_setMoviePlayerActive:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 651) = *((unsigned char *)self + 651) & 0xFB | v3;
  [(PLVideoView *)self _updatePosterFrameVisibility];
}

- (void)_updateScrubberForSlowMotion
{
  [(UIMovieScrubber *)self->_scrubber value];
  -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
  -[PLVideoView _scrubToMovieTime:](self, "_scrubToMovieTime:");
}

- (void)_configurePlayerForStreamedVideoIfNecessary
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if ([(PLVideoView *)self _shouldStreamVideo])
  {
    if (![(PLVideoView *)self _canPlayCloudSharedStreamedVideoWithLocalVideo])
    {
      char v3 = [(PLMoviePlayerController *)self->_moviePlayer player];
      v4[0] = *MEMORY[0x1E4F15AA8];
      -[AVPlayer setExpectedAssetTypes:](v3, "setExpectedAssetTypes:", [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1]);
    }
  }
}

- (id)_assetForVideoURL:(id)a3
{
  id v4 = [(PLVideoView *)self _optionsForAVURLAsset];
  double v5 = (void *)MEMORY[0x1E4F166C8];
  return (id)[v5 URLAssetWithURL:a3 options:v4];
}

- (id)_assetForVideoPath:(id)a3
{
  id v4 = +[PLMoviePlayerController AVAssetURLWithPath:a3];
  id v5 = [(PLVideoView *)self _optionsForAVURLAsset];
  double v6 = (void *)MEMORY[0x1E4F166C8];
  return (id)[v6 URLAssetWithURL:v4 options:v5];
}

- (id)_optionsForAVURLAsset
{
  if (![(PLVideoView *)self _mediaIsCloudSharedStreamedVideo]
    || [(PLVideoView *)self _canPlayCloudSharedStreamedVideoWithLocalVideo])
  {
    return 0;
  }
  char v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [NSNumber numberWithBool:1];
  [v3 setObject:v5 forKey:*MEMORY[0x1E4F16168]];
  uint64_t v6 = [NSNumber numberWithBool:1];
  [v3 setObject:v6 forKey:*MEMORY[0x1E4F16130]];
  uint64_t v7 = [NSNumber numberWithBool:1];
  [v3 setObject:v7 forKey:*MEMORY[0x1E4F16150]];
  if (([MEMORY[0x1E4F8AAB0] debugAlwaysStreamSharedVideos] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F8AAB0] streamdVideoCache];
    [v3 setObject:v8 forKey:*MEMORY[0x1E4F16108]];
  }
  return v3;
}

- (void)_updateVideoAVObjectBuilderFromContentEditingInput:(id)a3
{
  uint64_t v5 = [a3 audiovisualAsset];

  uint64_t v6 = (void *)[a3 adjustmentData];
  if (v6)
  {
    id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F8CE18]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", objc_msgSend(v6, "formatIdentifier"), objc_msgSend(v6, "formatVersion"), objc_msgSend(v6, "data"), 0, 0, 0);
    self->__videoAVObjectBuilder = (PFVideoAVObjectBuilder *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v5 videoAdjustments:v7];
  }
  else
  {
    self->__videoAVObjectBuilder = (PFVideoAVObjectBuilder *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v5 videoAdjustments:0];
  }
}

- (BOOL)_canHandleAdjustmentData:(id)a3
{
  char v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8CE18]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", objc_msgSend(a3, "formatIdentifier"), objc_msgSend(a3, "formatVersion"), objc_msgSend(a3, "data"), 0, 0, 0);
  char v4 = [v3 isRecognizedFormat];

  return v4;
}

- (BOOL)_prepareMoviePlayerIfNeeded
{
  LODWORD(v3) = -[UIView pl_isOnScreen:](self, "pl_isOnScreen:", [MEMORY[0x1E4F42D90] mainScreen]);
  if (v3)
  {
    if (![(PLVideoView *)self _mediaIsCloudSharedStreamedVideo]
      || [(PLVideoView *)self _canPlayCloudSharedStreamedVideoWithLocalVideo]|| (uint64_t v3 = [(PLManagedAsset *)self->_videoCameraImage cachedNonPersistedVideoPlaybackURL]) != 0)
    {
      if ((*((unsigned char *)self + 651) & 2) != 0
        || (*((unsigned char *)self + 651) & 4) == 0
        || !self->_moviePlayer
        || ![(PLVideoView *)self _canAccessVideo])
      {
        if (self->_moviePlayer)
        {
LABEL_17:
          LOBYTE(v3) = 1;
          return v3;
        }
        [(PLVideoView *)self _setupMoviePlayerIfNecessary];
LABEL_19:
        LOBYTE(v3) = 0;
        return v3;
      }
      if (!self->__videoAVObjectBuilder)
      {
        if (self->_videoURL) {
          goto LABEL_11;
        }
        if (![(PLVideoView *)self _mediaIsCloudSharedStreamedVideo])
        {
          if (self->_videoCameraImage)
          {
            if (!self->__isFetchingVideo && ![(PLVideoView *)self _localVideoUnavailable]) {
              [(PLVideoView *)self _fetchLocalContentEditingInput];
            }
            goto LABEL_19;
          }
          goto LABEL_12;
        }
        if (-[PLVideoView _canPlayCloudSharedStreamedVideoWithLocalVideo](self, "_canPlayCloudSharedStreamedVideoWithLocalVideo")? [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_pathToOriginalVideo isDirectory:0]: -[PLManagedAsset cachedNonPersistedVideoPlaybackURL](self->_videoCameraImage, "cachedNonPersistedVideoPlaybackURL"))
        {
LABEL_11:
          id v4 = -[PLVideoView _assetForVideoURL:](self, "_assetForVideoURL:");
          self->__videoAVObjectBuilder = (PFVideoAVObjectBuilder *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v4 videoAdjustments:0];
        }
      }
LABEL_12:
      BOOL v5 = [(PLVideoView *)self _shouldPlayFlattenedVideo];
      BOOL v6 = v5;
      if (!v5 || [(PLVideoView *)self _isFlattenedVideoUpToDate])
      {
        *((unsigned char *)self + 651) |= 2u;
        [(PLVideoView *)self _configurePlayerForStreamedVideoIfNecessary];
        uint64_t v17 = 0;
        double v18 = &v17;
        uint64_t v19 = 0x3052000000;
        BOOL v20 = __Block_byref_object_copy__4168;
        double v21 = __Block_byref_object_dispose__4169;
        uint64_t v22 = 0;
        if (v6)
        {
          id v7 = [(PLVideoView *)self _assetForVideoPath:[(PLVideoView *)self _filePathForFlattenedVideo]];
          uint64_t v8 = [MEMORY[0x1E4F16620] playerItemWithAsset:v7];
          v18[5] = v8;
        }
        else
        {
          videoAVObjectBuilder = self->__videoAVObjectBuilder;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __42__PLVideoView__prepareMoviePlayerIfNeeded__block_invoke_104;
          v16[3] = &unk_1E63D27A0;
          v16[4] = &v17;
          [(PFVideoAVObjectBuilder *)videoAVObjectBuilder requestPlayerItemWithResultHandler:v16];
          id v10 = (id)v18[5];
        }
        if (objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "hasSlowMotionAdjustments"))-[PLVideoView _updateScrubberForSlowMotion](self, "_updateScrubberForSlowMotion"); {
        [(PLMoviePlayerController *)self->_moviePlayer setPlayerItem:v18[5] startTime:self->_cachedCurrentPlaybackTime];
        }
        double v11 = [(PLMoviePlayerController *)self->_moviePlayer view];
        [(PLMoviePlayerView *)v11 setClipsToBounds:1];
        [(PLMoviePlayerView *)v11 setScaleMode:self->_scaleMode];
        *((unsigned char *)self + 651) &= ~1u;
        [(PLVideoView *)self _clearImageGenerators];
        [(PLVideoView *)self _createImageGenerators];
        if (([(PLMoviePlayerController *)self->_moviePlayer bufferingState] & 0xB) != 0) {
          *((unsigned char *)self + 651) |= 0x20u;
        }
        if ([(PLMoviePlayerController *)self->_moviePlayer isPreparedForPlayback]) {
          [(PLVideoView *)self moviePlayerReadyToPlay:self->_moviePlayer];
        }
        _Block_object_dispose(&v17, 8);
        goto LABEL_17;
      }
      if (!self->_airplayExportSession)
      {
        double v12 = [(AVPlayerItem *)[(AVPlayer *)[(PLMoviePlayerController *)self->_moviePlayer player] currentItem] asset];
        if ([(AVAsset *)v12 isMemberOfClass:objc_opt_class()])
        {
          double v13 = (void *)[(AVAsset *)v12 URL];
          if ([v13 isFileURL])
          {
            if (objc_msgSend((id)objc_msgSend(v13, "path"), "isEqualToString:", -[PLVideoView _filePathForFlattenedVideo](self, "_filePathForFlattenedVideo")))
            {
              [(PLVideoView *)self pause];
              [(PLMoviePlayerController *)self->_moviePlayer setPlayerItem:0 startTime:0.0];
            }
          }
        }
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __42__PLVideoView__prepareMoviePlayerIfNeeded__block_invoke;
        v23[3] = &unk_1E63D2688;
        v23[4] = self;
        [(PLVideoView *)self _flattenVideoWithCompletionHandler:v23];
      }
      goto LABEL_19;
    }
  }
  return v3;
}

uint64_t __42__PLVideoView__prepareMoviePlayerIfNeeded__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _prepareAndResumePlayback];
  }
  return result;
}

id __42__PLVideoView__prepareMoviePlayerIfNeeded__block_invoke_104(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)_fetchLocalContentEditingInput
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F39028]);
  [v3 setNetworkAccessAllowed:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PLVideoView__fetchLocalContentEditingInput__block_invoke;
  v6[3] = &unk_1E63D2750;
  v6[4] = self;
  [v3 setCanHandleAdjustmentData:v6];
  self->__isFetchingVideo = 1;
  id v4 = (void *)[(PLManagedAsset *)self->_videoCameraImage pl_PHAssetFromPhotoLibrary:pl_appPhotoLibrary()];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PLVideoView__fetchLocalContentEditingInput__block_invoke_2;
  v5[3] = &unk_1E63D2778;
  v5[4] = self;
  [v4 requestContentEditingInputWithOptions:v3 completionHandler:v5];
}

uint64_t __45__PLVideoView__fetchLocalContentEditingInput__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _canHandleAdjustmentData:a2];
}

uint64_t __45__PLVideoView__fetchLocalContentEditingInput__block_invoke_2()
{
  return pl_dispatch_async();
}

uint64_t __45__PLVideoView__fetchLocalContentEditingInput__block_invoke_3(id *a1)
{
  *((unsigned char *)a1[4] + 757) = 0;
  uint64_t v2 = (void *)[a1[5] audiovisualAsset];
  if ([a1[6] objectForKeyedSubscript:*MEMORY[0x1E4F395F8]]
    || ![v2 isPlayable])
  {
    id v5 = a1[4];
    return [v5 _fetchNonlocalVideo];
  }
  else
  {
    [a1[4] _setCanAttemptFetchingVideoDerivative:1];
    [a1[4] _updateVideoAVObjectBuilderFromContentEditingInput:a1[5]];
    [a1[4] _setLocalVideoUnavailable:0];
    [a1[4] _updateSlalomRegionEditorState];
    *((unsigned char *)a1[4] + 651) &= ~2u;
    id v3 = a1[4];
    return [v3 _prepareAndResumePlayback];
  }
}

- (void)_fetchNonlocalVideo
{
  [(PLVideoView *)self _setLocalVideoUnavailable:1];
  [(PLVideoView *)self _updateSlalomRegionEditorState];
  if ([(PLVideoView *)self isPlaying]) {
    [(PLVideoView *)self _displayPlaySpinner];
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F39348]);
  [v3 setNetworkAccessAllowed:1];
  [v3 setStreamingAllowed:1];
  [v3 setVideoComplementAllowed:1];
  [v3 setVersion:0];
  self->__isFetchingVideo = 1;
  uint64_t v4 = [(PLManagedAsset *)self->_videoCameraImage pl_PHAssetFromPhotoLibrary:pl_appPhotoLibrary()];
  id v5 = (void *)[MEMORY[0x1E4F390D0] defaultManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PLVideoView__fetchNonlocalVideo__block_invoke;
  v6[3] = &unk_1E63D2728;
  v6[4] = self;
  void v6[5] = v4;
  [v5 requestPlayerItemForVideo:v4 options:v3 resultHandler:v6];
}

uint64_t __34__PLVideoView__fetchNonlocalVideo__block_invoke()
{
  return pl_dispatch_async();
}

void __34__PLVideoView__fetchNonlocalVideo__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 757) = 0;
  uint64_t v2 = [*(id *)(a1 + 40) asset];
  if (v2)
  {
    uint64_t v3 = v2;

    *(void *)(*(void *)(a1 + 32) + 768) = [objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v3 videoAdjustments:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 651) &= ~2u;
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _prepareAndResumePlayback];
  }
  else
  {
    Log = PLBackendGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_ERROR, "Failed to fetch playback objects for %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_prepareAndResumePlayback
{
  BOOL v3 = [(PLVideoView *)self isPlaying];
  [(PLVideoView *)self _prepareMoviePlayerIfNeeded];
  if (v3 && ![(PLVideoView *)self isPlaying])
  {
    [(PLVideoView *)self play];
  }
}

- (void)moviePlayerDurationAvailable:(id)a3
{
  [(PLMoviePlayerController *)self->_moviePlayer duration];
  if (self->_duration != v4)
  {
    -[PLVideoView _setDuration:](self, "_setDuration:");
    [(PLVideoView *)self _updateScrubberVisibilityWithDuration:0.0];
  }
}

- (void)moviePlayerReadyToDisplay:(id)a3
{
  [(PLVideoView *)self _insertMoviePlayerViewIfNecessary];
  int v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "view"), "videoView"), "layer"), "isReadyForDisplay");
  char v6 = *((unsigned char *)self + 651);
  if (((v5 ^ ((v6 & 0x10) == 0)) & 1) == 0)
  {
    if (v5) {
      char v7 = 16;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 651) = v6 & 0xEF | v7;
    [(PLVideoView *)self _updatePosterFrameVisibility];
  }
}

- (void)moviePlayerReadyToPlay:(id)a3
{
  [(PLVideoView *)self _insertMoviePlayerViewIfNecessary];
  if ((*((unsigned char *)self + 651) & 8) == 0 && (*((unsigned char *)self + 651) & 1) == 0)
  {
    *((unsigned char *)self + 651) |= 8u;
    [(PLMoviePlayerController *)self->_moviePlayer duration];
    -[PLVideoView _setDuration:](self, "_setDuration:");
    posterFrameView = self->_posterFrameView;
    if (posterFrameView)
    {
      if (![(PLVideoPosterFrameView *)posterFrameView image])
      {
        [(AVPlayerItem *)[(AVPlayer *)[(PLMoviePlayerController *)self->_moviePlayer player] currentItem] presentationSize];
        double v6 = v5;
        double v8 = v7;
        -[PLVideoView _updateScaleModeForSize:](self, "_updateScaleModeForSize:");
        [(PLMoviePlayerView *)[(PLMoviePlayerController *)self->_moviePlayer view] setScaleMode:self->_scaleMode];
        [(PLVideoPosterFrameView *)self->_posterFrameView setScaleMode:self->_scaleMode];
        if ((*((unsigned char *)self + 652) & 0x20) != 0)
        {
          *((unsigned char *)self + 652) &= ~0x20u;
          -[PLVideoView _requestPreviewPosterFrameForVideoSize:](self, "_requestPreviewPosterFrameForVideoSize:", v6, v8);
        }
      }
    }
    [(PLVideoView *)self _setNeedsReloadScrubberThumbnails:1];
    [(PLVideoView *)self _updateScrubberVisibilityWithDuration:0.0];
    [(PLVideoView *)self performSelector:sel__updatePosterFrameVisibility withObject:0 afterDelay:0.1];
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    {
      delegate = self->_delegate;
      [(PLVideoViewDelegate *)delegate videoViewIsReadyToBeginPlayback:self];
    }
  }
}

- (void)_savePreviewPosterFrameImage:(CGImage *)a3
{
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:a3];
  [(PLVideoPosterFrameView *)self->_posterFrameView setImage:v5];

  double v6 = [(PLVideoView *)self _pathForVideoPreviewFile];
  if (v6)
  {
    CFURLRef v7 = (const __CFURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
    double v8 = CGImageDestinationCreateWithURL(v7, (CFStringRef)[(id)*MEMORY[0x1E4F44410] identifier], 1uLL, 0);
    if (v8)
    {
      uint64_t v9 = v8;
      CGImageDestinationAddImage(v8, a3, 0);
      CGImageDestinationFinalize(v9);
      CFRelease(v9);
    }
  }
}

- (void)_requestPreviewPosterFrameForVideoSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v15[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "bounds");
  -[PLVideoView convertRect:fromView:](self, "convertRect:fromView:", 0);
  double v7 = v6;
  float v8 = width / height;
  float v9 = v6 * v8;
  double v10 = rintf(v9);
  id v11 = [(PLVideoView *)self _thumbnailSourceAsset];
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:v11];
  -[PLVideoView _configureImageGenerator:thumbnailSize:forSummaryThumbnails:](self, "_configureImageGenerator:thumbnailSize:forSummaryThumbnails:", v12, 1, v10, v7);
  v15[0] = [NSNumber numberWithDouble:0.0];
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__PLVideoView__requestPreviewPosterFrameForVideoSize___block_invoke;
  v14[3] = &unk_1E63D26D8;
  v14[4] = self;
  void v14[5] = v12;
  [v12 generateCGImagesAsynchronouslyForTimes:v13 completionHandler:v14];
}

void __54__PLVideoView__requestPreviewPosterFrameForVideoSize___block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  pl_dispatch_async();
}

void __54__PLVideoView__requestPreviewPosterFrameForVideoSize___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) _savePreviewPosterFrameImage:*(void *)(a1 + 48)];
  }
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)moviePlayerPlaybackStateDidChange:(id)a3 fromPlaybackState:(unint64_t)a4
{
  unint64_t v5 = [(PLMoviePlayerController *)self->_moviePlayer playbackState];
  if (v5 == 3)
  {
    [(PLVideoView *)self _removePlaySpinner];
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    {
      delegate = self->_delegate;
      [(PLVideoViewDelegate *)delegate videoViewPlaybackDidFail:self];
    }
  }
  else
  {
    if (v5 != 2)
    {
      if (v5 || (*((unsigned char *)self + 650) & 4) == 0) {
        return;
      }
      goto LABEL_14;
    }
    if ((*((unsigned char *)self + 650) & 4) == 0) {
      return;
    }
    [(PLMoviePlayerController *)self->_moviePlayer currentTime];
    double v8 = v7;
    [(PLMoviePlayerController *)self->_moviePlayer duration];
    if (vabdd_f64(v8, v9) < 1.0)
    {
LABEL_14:
      [(PLVideoView *)self _playbackFinished];
      return;
    }
    [(PLVideoView *)self moviePlayerHeadsetPlayPausePressed:0];
  }
}

- (void)moviePlayerPlaybackRateDidChange:(id)a3
{
  [(PLMoviePlayerController *)self->_moviePlayer playbackRate];
  if ((int)v4 == 1)
  {
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) moviePlayerPlaybackRateDidChange to 1", v7, 2u);
    }
    if ((*((unsigned char *)self + 650) & 4) != 0) {
      [(PLVideoView *)self _didBeginPlayback];
    }
  }
  else if (!(int)v4)
  {
    unint64_t v5 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEE94000, v5, OS_LOG_TYPE_DEFAULT, "(video-playback) moviePlayerPlaybackRateDidChange to 0", buf, 2u);
    }
    [(PLVideoView *)self _updateSnapshotImage];
  }
}

- (void)moviePlayerBufferingStateDidChange:(id)a3
{
  unint64_t v4 = [(PLMoviePlayerController *)self->_moviePlayer bufferingState];
  BOOL v5 = [(PLVideoView *)self _shouldStreamVideo];
  uint64_t v6 = 10;
  if (!v5) {
    uint64_t v6 = 1;
  }
  if ((v6 & v4) != 0)
  {
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) play due to buffer state change", buf, 2u);
    }
    *((unsigned char *)self + 651) |= 0x20u;
    [(PLVideoView *)self _verifyOrRestartPlayback];
  }
  else if ([(PLVideoView *)self _shouldStreamVideo] && (v4 & 4) != 0)
  {
    double v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_1BEE94000, v8, OS_LOG_TYPE_DEFAULT, "(video-playback) pauseDueToInsufficientData due to buffer state change", v9, 2u);
    }
    *((unsigned char *)self + 651) &= ~0x20u;
    [(PLVideoView *)self _displayPlaySpinner];
  }
}

- (BOOL)moviePlayerExitRequest:(id)a3 exitReason:(int)a4
{
  return 1;
}

- (void)_reloadScrubberThumbnailsIfNeeded
{
  if ((*((unsigned char *)self + 650) & 2) != 0 && self->_scrubber && (*((unsigned char *)self + 651) & 4) != 0)
  {
    *((unsigned char *)self + 650) &= ~2u;
    [(UIMovieScrubber *)self->_scrubber setDelegate:self];
    [(UIMovieScrubber *)self->_scrubber setDataSource:self];
    scrubber = self->_scrubber;
    [(UIMovieScrubber *)scrubber reloadData];
  }
}

- (void)_setNeedsReloadScrubberThumbnails:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 650) = *((unsigned char *)self + 650) & 0xFD | v3;
}

- (void)layoutSubviews
{
  if (*((char *)self + 651) < 0) {
    [(PLVideoView *)self _updateScrubberFrame];
  }
  [(PLVideoView *)self bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  spinner = self->_spinner;
  double MidX = CGRectGetMidX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  -[UIActivityIndicatorView setCenter:](spinner, "setCenter:", MidX, CGRectGetMidY(v13));
  [(UIActivityIndicatorView *)self->_spinner center];
  -[UIActivityIndicatorView setCenter:](self->_shadowSpinner, "setCenter:", v10 + 1.0, v9 + 1.0);
  [(PLVideoView *)self _reloadScrubberThumbnailsIfNeeded];
}

- (BOOL)_canCreateMetadata
{
  return (*((unsigned __int8 *)self + 652) >> 4) & 1;
}

- (void)_updateScaleModeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = a3.width >= a3.height;
  [(PLVideoView *)self bounds];
  double v8 = v7;
  [(PLVideoView *)self bounds];
  if (v6 != v8 < v9) {
    self->_scaleMode = 2;
  }
  *((unsigned char *)self + 652) = *((unsigned char *)self + 652) & 0xF7 | (8 * (width >= height));
}

- (void)updateScaleMode
{
  if (self->_posterFrameImage)
  {
    self->_int64_t scaleMode = 1;
    [(UIImage *)self->_posterFrameImage size];
    -[PLVideoView _updateScaleModeForSize:](self, "_updateScaleModeForSize:");
    [(PLMoviePlayerView *)[(PLMoviePlayerController *)self->_moviePlayer view] setScaleMode:self->_scaleMode];
    posterFrameView = self->_posterFrameView;
    int64_t scaleMode = self->_scaleMode;
    [(PLVideoPosterFrameView *)posterFrameView setScaleMode:scaleMode];
  }
}

- (void)_hideTrimMessageView:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLVideoEditingOverlayView *)self->_trimMessageView alpha];
  if (v5 == 1.0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__PLVideoView__hideTrimMessageView___block_invoke;
    v11[3] = &unk_1E63D2660;
    v11[4] = self;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    double v8 = __36__PLVideoView__hideTrimMessageView___block_invoke_2;
    double v9 = &unk_1E63D2688;
    double v10 = self;
    if (v3)
    {
      [MEMORY[0x1E4F42FF0] animateWithDuration:v11 animations:&v6 completion:0.25];
    }
    else
    {
      -[PLVideoEditingOverlayView setAlpha:](self->_trimMessageView, "setAlpha:", 0.0, v6, v7);
      ((void (*)(uint64_t *, uint64_t))v8)(&v6, 1);
    }
  }
}

uint64_t __36__PLVideoView__hideTrimMessageView___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
}

uint64_t __36__PLVideoView__hideTrimMessageView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _videoOverlayFadeOutDidFinish];
}

- (void)removeVideoOverlay
{
  self->_videoOverlayPlayButton = 0;
  *((unsigned char *)self + 651) &= ~0x40u;
}

- (void)_hideVideoOverlay:(BOOL)a3
{
  if ((*((unsigned char *)self + 651) & 0x40) != 0)
  {
    *((unsigned char *)self + 651) &= ~0x40u;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__PLVideoView__hideVideoOverlay___block_invoke;
    v8[3] = &unk_1E63D2660;
    void v8[4] = self;
    uint64_t v3 = MEMORY[0x1E4F143A8];
    uint64_t v4 = 3221225472;
    double v5 = __33__PLVideoView__hideVideoOverlay___block_invoke_2;
    uint64_t v6 = &unk_1E63D2688;
    uint64_t v7 = self;
    if (a3)
    {
      [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:&v3 completion:0.25];
    }
    else
    {
      -[PLVideoOverlayButton setAlpha:](self->_videoOverlayPlayButton, "setAlpha:", 0.0, v3, v4);
      ((void (*)(uint64_t *, uint64_t))v5)(&v3, 1);
    }
  }
}

uint64_t __33__PLVideoView__hideVideoOverlay___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 728) setAlpha:0.0];
}

uint64_t __33__PLVideoView__hideVideoOverlay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _videoOverlayFadeOutDidFinish];
}

- (void)_videoOverlayFadeOutDidFinish
{
  self->_trimMessageView = 0;
}

- (void)_showVideoOverlay
{
  if ((*((unsigned char *)self + 649) & 1) != 0
    && (*((unsigned char *)self + 650) & 4) == 0
    && [(PLVideoView *)self _canAccessVideo])
  {
    if (self->_videoOverlayPlayButton) {
      goto LABEL_8;
    }
    if ([(PLVideoView *)self _mediaIsPlayable])
    {
      uint64_t v3 = (PLVideoOverlayButton *)+[PLVideoView _dequeueOverlayPlayButton];
      self->_videoOverlayPlayButton = v3;
      [(PLVideoOverlayButton *)v3 setTarget:self action:sel_playButtonClicked_];
    }
    if (self->_videoOverlayPlayButton)
    {
LABEL_8:
      *((unsigned char *)self + 651) |= 0x40u;
      [(PLVideoOverlayButton *)self->_videoOverlayPlayButton frame];
      double v5 = v4;
      double v7 = v6;
      [(PLVideoView *)self addSubview:self->_videoOverlayPlayButton];
      objc_msgSend((id)-[PLVideoOverlayButton superview](self->_videoOverlayPlayButton, "superview"), "bounds");
      -[PLVideoOverlayButton setFrame:](self->_videoOverlayPlayButton, "setFrame:", rint((v9 - v5) * 0.5), rint((v8 - v7) * 0.5), v5, v7);
      [(PLVideoOverlayButton *)self->_videoOverlayPlayButton setAutoresizingMask:45];
      videoOverlayPlayButton = self->_videoOverlayPlayButton;
      [(PLVideoOverlayButton *)videoOverlayPlayButton setAlpha:1.0];
    }
  }
}

- (id)videoOverlayPlayButton
{
  return self->_videoOverlayPlayButton;
}

- (BOOL)_canAccessVideo
{
  videoCameraCGImageRef Image = self->_videoCameraImage;
  if (videoCameraImage
    && [(PLManagedAsset *)videoCameraImage complete]
    && ![(PLManagedAsset *)self->_videoCameraImage isTimelapsePlaceholder]
    || self->_videoURL)
  {
    return [(PLManagedAsset *)self->_videoCameraImage isPhotoIrisPlaceholder] ^ 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_shouldShowSlalomEditor
{
  if (PLRunningFromPhotosApplication()) {
    char v3 = 0;
  }
  else {
    char v3 = PLIsCamera() ^ 1;
  }
  if (![(PLVideoView *)self allowSlalomEditor]
    || (v3 & 1) != 0
    || ![(PLManagedAsset *)self->_videoCameraImage isMogul])
  {
    return 0;
  }
  double v4 = (void *)[(PFVideoAVObjectBuilder *)self->__videoAVObjectBuilder videoAdjustments];
  return [v4 isRecognizedFormat];
}

- (void)_removeScrubber
{
  self->_scrubberBackgroundView = 0;
  [(UIMovieScrubber *)self->_scrubber setDataSource:0];
  [(UIMovieScrubber *)self->_scrubber setDelegate:0];
  [(UIMovieScrubber *)self->_scrubber removeFromSuperview];

  self->_scrubber = 0;
  [(PLSlalomRegionEditor *)self->_slalomRegionEditor removeFromSuperview];
  [(PLSlalomRegionEditor *)self->_slalomRegionEditor setDelegate:0];

  self->_slalomRegionEditor = 0;
}

- (void)_createScrubberIfNeeded
{
  BOOL v3 = [(PLVideoView *)self _shouldShowSlalomEditor];
  BOOL v4 = [(PLVideoView *)self canEdit];
  scrubber = self->_scrubber;
  if (scrubber
    && (self->__slalomRegionEditorCreatedForScrubber != v3
     || v4 != [(UIMovieScrubber *)scrubber isEditable]))
  {
    [(PLVideoView *)self _removeScrubber];
  }
  if ((*((unsigned char *)self + 649) & 0x10) != 0 && !self->_scrubberBackgroundView)
  {
    [(PLVideoView *)self bounds];
    double Width = CGRectGetWidth(v14);
    [(PLVideoView *)self _scrubberBackgroundHeight];
    double v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, Width, v7);
    self->_scrubberBackgroundView = v8;
    [(UIView *)v8 setAutoresizingMask:34];
    [(UIView *)self->_scrubberBackgroundView setDeliversTouchesForGesturesToSuperview:0];
    -[UIView setBackgroundColor:](self->_scrubberBackgroundView, "setBackgroundColor:", [MEMORY[0x1E4F428B8] colorWithWhite:0.101960786 alpha:0.75]);
    [(PLVideoView *)self addSubview:self->_scrubberBackgroundView];
  }
  [(PLVideoView *)self scrubberWidth];
  if (!self->_scrubber)
  {
    double v10 = (UIMovieScrubber *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42BC0]), "initWithFrame:", 0.0, 1.0, v9, 0.0);
    self->_scrubber = v10;
    [(UIMovieScrubber *)v10 setEditable:v4];
    double v11 = 8.0;
    if (!v4) {
      double v11 = 0.0;
    }
    [(UIMovieScrubber *)self->_scrubber setEdgeInset:v11];
    [(UIMovieScrubber *)self->_scrubber setAutoresizingMask:2];
    [(UIMovieScrubber *)self->_scrubber setZoomDelay:0.5];
    [(UIMovieScrubber *)self->_scrubber setMinimumTrimLength:1.0];
    [(UIView *)self->_scrubberBackgroundView addSubview:self->_scrubber];
    *((unsigned char *)self + 652) |= 4u;
    [(UIMovieScrubber *)self->_scrubber setDelegate:self];
    [(UIMovieScrubber *)self->_scrubber setDataSource:self];
    if (self->_maximumTrimLength != 0.0) {
      -[UIMovieScrubber setMaximumTrimLength:](self->_scrubber, "setMaximumTrimLength:");
    }
    if ((*((unsigned char *)self + 650) & 8) != 0) {
      [(UIMovieScrubber *)self->_scrubber setEditing:1 animated:1];
    }
    if (!self->_slalomRegionEditor && v3)
    {
      [(UIMovieScrubber *)self->_scrubber frame];
      CGRect v12 = -[PLSlalomRegionEditor initWithFrame:]([PLSlalomRegionEditor alloc], "initWithFrame:", v15.origin.x, CGRectGetMaxY(v15), v15.size.width, 30.0);
      self->_slalomRegionEditor = v12;
      [(PLSlalomRegionEditor *)v12 setAutoresizingMask:2];
      [(PLSlalomRegionEditor *)self->_slalomRegionEditor setDelegate:self];
      [(PLVideoView *)self _updateSlalomRegionEditorRange];
      [(PLVideoView *)self _updateSlalomRegionEditorState];
      [(UIView *)self->_scrubberBackgroundView addSubview:self->_slalomRegionEditor];
    }
    self->__slalomRegionEditorCreatedForScrubber = v3;
    [(PLVideoView *)self _updateForEditing];
  }
}

- (double)_scrubberBackgroundHeight
{
  BOOL v2 = [(PLVideoView *)self _shouldShowSlalomEditor];
  double result = 42.0;
  if (v2) {
    return 72.0;
  }
  return result;
}

- (double)scrubberWidth
{
  double result = self->_scrubberWidth;
  if (result == 0.0)
  {
    [(PLVideoView *)self bounds];
    double result = CGRectGetWidth(v4);
    self->_scrubberdouble Width = result;
  }
  return result;
}

- (void)_updateScrubberFrame
{
  scrubberBackgroundView = self->_scrubberBackgroundView;
  if (scrubberBackgroundView && (PLVideoView *)[(UIView *)scrubberBackgroundView superview] == self)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarOrientation");
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(PLVideoViewDelegate *)self->_delegate videoViewScrubberYOrigin:self forOrientation:v4];
      double v6 = v5;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarHeightForOrientation:ignoreHidden:", v4, 1);
      float v8 = v7;
      [MEMORY[0x1E4F42BE8] defaultSizeForOrientation:v4];
      float v10 = v9;
      double v6 = (float)(v8 + v10);
    }
    [(UIView *)self->_scrubberBackgroundView frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(PLVideoView *)self _scrubberBackgroundHeight];
    -[UIView setFrame:](self->_scrubberBackgroundView, "setFrame:", v12, v14, v16, v6 + v17);
    [(UIMovieScrubber *)self->_scrubber frame];
    scrubber = self->_scrubber;
    -[UIMovieScrubber setFrame:](scrubber, "setFrame:");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = [(UIMovieScrubber *)self->_scrubber superview];
  scrubberBackgroundView = self->_scrubberBackgroundView;
  BOOL v10 = (UIView *)v8 != scrubberBackgroundView || scrubberBackgroundView == 0;
  if (v10
    || (scrubber = self->_scrubber,
        -[UIMovieScrubber convertPoint:fromView:](scrubber, "convertPoint:fromView:", self, x, y),
        id result = (id)-[UIMovieScrubber hitTest:withEvent:](scrubber, "hitTest:withEvent:", a4),
        !result
     && ((slalomRegionEditor = self->_slalomRegionEditor) == 0
      || (-[PLSlalomRegionEditor convertPoint:fromView:](self->_slalomRegionEditor, "convertPoint:fromView:", self, x, y), (id result = (id)-[PLSlalomRegionEditor hitTest:withEvent:](slalomRegionEditor, "hitTest:withEvent:", a4)) == 0))))
  {
    if (-[PLVideoView pointInside:withEvent:](self, "pointInside:withEvent:", a4, x, y))
    {
      if ((*((unsigned char *)self + 651) & 0x40) != 0)
      {
        videoOverlayPlayButton = self->_videoOverlayPlayButton;
        -[PLVideoOverlayButton convertPoint:fromView:](videoOverlayPlayButton, "convertPoint:fromView:", [(PLVideoOverlayButton *)videoOverlayPlayButton superview], x, y);
        id result = (id)-[PLVideoOverlayButton hitTest:withEvent:](videoOverlayPlayButton, "hitTest:withEvent:", a4);
      }
      else
      {
        id result = 0;
      }
      if (!result) {
        return self;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PLVideoView;
  [(PLVideoView *)&v5 touchesEnded:a3 withEvent:a4];
  [(PLVideoView *)self _hideTrimMessageView:1];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)PLVideoView;
  return (NSString *)[NSString stringWithFormat:@"<%@ path:%@>", -[PLVideoView description](&v3, sel_description), -[PLVideoView pathForVideoFile](self, "pathForVideoFile")];
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (PLVideoViewDelegate *)a3;
    if (a3)
    {
      if (objc_opt_respondsToSelector())
      {
        if ([(PLVideoViewDelegate *)self->_delegate videoViewCanCreateMetadata:self])char v4 = 16; {
        else
        }
          char v4 = 0;
      }
      else
      {
        char v4 = 0;
      }
      *((unsigned char *)self + 652) = *((unsigned char *)self + 652) & 0xEF | v4;
      scrubber = self->_scrubber;
      a3 = self;
    }
    else
    {
      scrubber = self->_scrubber;
    }
    [(UIMovieScrubber *)scrubber setDelegate:a3];
  }
}

- (PLVideoViewDelegate)delegate
{
  return self->_delegate;
}

- (void)_tearDownMoviePlayer
{
  if ((*((unsigned char *)self + 650) & 4) != 0) {
    [(PLMoviePlayerController *)self->_moviePlayer stop];
  }
  [(PLMoviePlayerView *)[(PLMoviePlayerController *)self->_moviePlayer view] removeFromSuperview];

  self->_moviePlayer = 0;
}

- (void)_insertMoviePlayerViewIfNecessary
{
  [(PLVideoView *)self _setupMoviePlayerIfNecessary];
  if (![(PLVideoView *)self _didInsertMoviePlayerView])
  {
    objc_super v3 = [(PLMoviePlayerController *)self->_moviePlayer view];
    [(PLVideoView *)self bounds];
    -[PLMoviePlayerView setFrame:](v3, "setFrame:");
    [(PLMoviePlayerView *)v3 setAutoresizingMask:18];
    [(PLVideoView *)self insertSubview:v3 belowSubview:self->_posterFrameView];
    self->__didInsertMoviePlayerView = 1;
  }
}

- (void)_setupMoviePlayerIfNecessary
{
  if (!self->_moviePlayer)
  {
    objc_super v3 = objc_alloc_init(PLMoviePlayerController);
    self->_moviePlayer = v3;
    [(PLMoviePlayerController *)v3 setDelegate:self];
    [(PLMoviePlayerController *)self->_moviePlayer requestToBecomeActiveController];
    self->__didInsertMoviePlayerView = 0;
    self->_isAirPladouble y = [(PLVideoView *)self _playerIsAirplay];
  }
}

- (void)dealloc
{
  objc_super v3 = (void **)MEMORY[0x1E4F43630];
  NSClassFromString(&cfstr_Plphotosapplic_0.isa);
  if (objc_opt_isKindOfClass()) {
    char v4 = *v3;
  }
  else {
    char v4 = 0;
  }
  [v4 disableNetworkObservation];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  [(PLVideoView *)self _commitPendingAdjustmentsUpdateAndWait:0 completionHandler:0];

  [(PLVideoView *)self setImageTile:0];
  [(PLVideoView *)self _tearDownMoviePlayer];

  [(PLVideoOverlayButton *)self->_videoOverlayPlayButton removeFromSuperview];
  +[PLVideoView _enqueueOverlayPlayButton:self->_videoOverlayPlayButton];

  self->_videoOverlayPlayButton = 0;
  [(UIMovieScrubber *)self->_scrubber setDelegate:0];
  [(UIMovieScrubber *)self->_scrubber setDataSource:0];

  [(PLSlalomRegionEditor *)self->_slalomRegionEditor setDelegate:0];
  thumbnailReqQueue = self->_thumbnailReqQueue;
  if (thumbnailReqQueue) {
    dispatch_release(thumbnailReqQueue);
  }
  [(PLVideoView *)self _clearImageGenerators];

  [(PLVideoView *)self _cancelAirplayExportSession];
  v6.receiver = self;
  v6.super_class = (Class)PLVideoView;
  [(PLVideoView *)&v6 dealloc];
}

- (void)_networkReachabilityDidChange:(id)a3
{
  videoCameraCGImageRef Image = self->_videoCameraImage;
  if (videoCameraImage
    && [(PLManagedAsset *)videoCameraImage cachedNonPersistedVideoPlaybackURL])
  {
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) network reachability changes. Clears out cached video URL.", v6, 2u);
    }
    [(PLManagedAsset *)self->_videoCameraImage setCachedNonPersistedVideoPlaybackURL:0];
    [(PLManagedAsset *)self->_videoCameraImage setCachedNonPersistedVideoPlaybackURLExpiration:0];
    [(PLManagedAsset *)self->_videoCameraImage setCachedNonPersistedVideoPlaybackURLError:0];
  }
}

- (id)_initWithFrame:(CGRect)a3 videoCameraImage:(id)a4 orientation:(int64_t)a5
{
  v18.receiver = self;
  v18.super_class = (Class)PLVideoView;
  double v7 = -[PLVideoView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_BOOL useLandscapeCache = (unint64_t)(a5 - 3) < 2;
    v7->_videoCameraCGImageRef Image = (PLManagedAsset *)a4;
    v8->_summaryThumbnailRequestTimestamps = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_detailThumbnailRequestTimestamps = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_scrubberdouble Width = 0.0;
    *((unsigned char *)v8 + 649) |= 0x10u;
    v8->_int64_t scaleMode = 1;
    *((unsigned char *)v8 + 649) = *((unsigned char *)v8 + 649) & 0xFE | [(PLVideoView *)v8 _canAccessVideo];
    *((unsigned char *)v8 + 649) &= ~2u;
    if ([(PLManagedAsset *)v8->_videoCameraImage isStreamedVideo]) {
      v8->_pathToOriginalVideo = (NSString *)(id)[(PLManagedAsset *)v8->_videoCameraImage pathToOriginalVideoFile];
    }
    [(PLVideoView *)v8 setAutoresizingMask:18];
    [(PLVideoView *)v8 bounds];
    double v13 = -[PLVideoPosterFrameView initWithFrame:]([PLVideoPosterFrameView alloc], "initWithFrame:", v9, v10, v11, v12);
    v8->_posterFrameView = v13;
    [(PLVideoPosterFrameView *)v13 setScaleMode:v8->_scaleMode];
    [(PLVideoPosterFrameView *)v8->_posterFrameView setAutoresizingMask:18];
    [(PLVideoView *)v8 addSubview:v8->_posterFrameView];
    double v14 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v8 selector:sel__screenDidConnect_ name:*MEMORY[0x1E4F43CC0] object:0];
    [v14 addObserver:v8 selector:sel__screenDidDisconnect_ name:*MEMORY[0x1E4F43CC8] object:0];
    double v15 = (void **)MEMORY[0x1E4F43630];
    NSClassFromString(&cfstr_Plphotosapplic_0.isa);
    if (objc_opt_isKindOfClass()) {
      double v16 = *v15;
    }
    else {
      double v16 = 0;
    }
    [v16 enableNetworkObservation];
    [v14 addObserver:v8 selector:sel__networkReachabilityDidChange_ name:*MEMORY[0x1E4F8AE38] object:0];
    v8->_thumbnailReqQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobileslideshow.videoThumbnails", 0);
    v8->_prepareMoviePlayerForScrubberAutomaticalldouble y = 1;
  }
  return v8;
}

- (PLVideoView)initWithFrame:(CGRect)a3 videoCameraImage:(id)a4 orientation:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (([a4 isVideo] & 1) != 0
    || ([a4 isStreamedVideo] & 1) != 0
    || ([a4 isAudio] & 1) != 0)
  {
    return (PLVideoView *)-[PLVideoView _initWithFrame:videoCameraImage:orientation:](self, "_initWithFrame:videoCameraImage:orientation:", a4, a5, x, y, width, height);
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"videoCameraImage must be either video or audio"];
    return 0;
  }
}

+ (void)_enqueueOverlayPlayButton:(id)a3
{
  if (a3) {
    objc_msgSend((id)_overlayButtonQueue, "addObject:");
  }
}

+ (id)_dequeueOverlayPlayButton
{
  BOOL v2 = (void *)_overlayButtonQueue;
  if (!_overlayButtonQueue)
  {
    BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    _overlayButtonQueue = (uint64_t)v2;
  }
  objc_super v3 = (void *)[v2 firstObject];
  if (v3)
  {
    char v4 = v3;
    id v5 = v3;
    [(id)_overlayButtonQueue removeObjectAtIndex:0];
    return v4;
  }
  else
  {
    double v7 = (void *)MEMORY[0x1E4F42FF0];
    return (id)objc_msgSend(v7, "pl_videoOverlayButtonWithStyle:", 0);
  }
}

+ (id)videoViewForVideoFileAtURL:(id)a3
{
  uint64_t v4 = objc_msgSend(objc_alloc((Class)a1), "_initWithFrame:videoCameraImage:orientation:", 0, 1, 0.0, 0.0, 1.0, 1.0);
  id v5 = (id)v4;
  *(void *)(v4 + 424) = [a3 copy];
  *(unsigned char *)(v4 + 649) = *(unsigned char *)(v4 + 649) & 0xFE | [(id)v4 _canAccessVideo];
  return (id)v4;
}

@end