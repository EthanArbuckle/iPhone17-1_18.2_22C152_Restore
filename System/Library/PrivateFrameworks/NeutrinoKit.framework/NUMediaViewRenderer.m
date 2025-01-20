@interface NUMediaViewRenderer
+ (BOOL)_forceUpdateForNewVideoComposition:(id)a3 previousComposition:(id)a4 newAsset:(id)a5 previousAsset:(id)a6 isPlaying:(BOOL)a7;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentSeekTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mediaDuration;
- (BOOL)_didReleaseAVObjects;
- (BOOL)_isVideoEnabled;
- (BOOL)canRenderVideoLive;
- (BOOL)canUpdateDisplayHeadroom;
- (BOOL)isMuted;
- (BOOL)isReady;
- (BOOL)isZoomedToFit;
- (BOOL)livePhotoViewIsScrubbing;
- (BOOL)pipelineFilersHaveChanged;
- (CGPoint)convertPoint:(CGPoint)a3 fromImageToView:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toImageFromView:(id)a4;
- (CGRect)_scrollBounds;
- (CGRect)_zoomTargetRect;
- (CGRect)convertRect:(CGRect)a3 fromImageToView:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toImageFromView:(id)a4;
- (CGSize)overrideZoomToFitSize;
- (CGSize)targetSize;
- (NSArray)loadedTimeRanges;
- (NSArray)pipelineFilters;
- (NSArray)previousPipelineFilters;
- (NUAVPlayerController)nuAVPlayerController;
- (NUColorSpace)colorSpace;
- (NUComposition)composition;
- (NUMediaView)mediaView;
- (NUMediaViewRenderer)init;
- (NUMediaViewRenderer)initWithMediaView:(id)a3;
- (NUPixelFormat)pixelFormat;
- (double)_lastRenderDuration;
- (double)_targetZoomScale;
- (double)backingScale;
- (double)displayCurrentEDRHeadroom;
- (double)displayMaximumEDRHeadroom;
- (double)maximumZoomScale;
- (double)overrideZoomScale;
- (double)playbackRate;
- (id)_backfillRenderRequestForComposition:(id)a3;
- (id)_backfillRenderResponseHandler;
- (id)_livePhotoFromResponse:(id)a3;
- (id)_regionPolicyForZoomTargetRect:(CGRect)a3;
- (id)_scalePolicyForVideoCompositionRender;
- (id)_updateImageLayer:(id)a3 withRenderResponse:(id)a4;
- (id)_videoFrameImageRenderResponseHandler;
- (id)_zoomRenderRequestForComposition:(id)a3;
- (id)_zoomRenderResponseHandler;
- (id)addExternalPlaybackObserver:(id)a3;
- (id)addPlaybackStateObserver:(id)a3;
- (id)addPlaybackTimeObserver:(id)a3;
- (id)cacheVideoRenderFilter;
- (id)newRenderRequestForComposition:(id)a3 scalePolicy:(id)a4 regionPolicy:(id)a5;
- (id)renderClient;
- (int64_t)_playbackStateFromPlayerStatus:(int64_t)a3 rate:(float)a4;
- (int64_t)playbackMode;
- (int64_t)playbackState;
- (unint64_t)computedDisplayType;
- (unint64_t)displayType;
- (void)_addFullExtentConstraintsForView:(id)a3;
- (void)_beginAnimating;
- (void)_coalesceBackfillRenderForComposition:(id)a3;
- (void)_coalesceUpdateLivePhotoComposition:(id)a3;
- (void)_coalesceUpdateVideoComposition:(id)a3;
- (void)_endAnimating;
- (void)_notifyExternalPlaybackChange:(BOOL)a3;
- (void)_notifyPlaybackStateChange:(int64_t)a3;
- (void)_notifyPlaybackTimeChange:(id *)a3;
- (void)_playerStatusDidChange:(int64_t)a3;
- (void)_releaseAVObjects;
- (void)_renderFinishedWithGeometry:(id)a3 layer:(id)a4;
- (void)_setDisplayType:(unint64_t)a3;
- (void)_setVideoEnabled:(BOOL)a3;
- (void)_setupAVPlayerController;
- (void)_tearDownAVPlayerController;
- (void)_updateBackfillLayerWithLatestRenderResponse;
- (void)_updateBackfillLayerWithRenderResponse:(id)a3;
- (void)_updateCoalescedBackfillRenderWithComposition:(id)a3;
- (void)_updateDisplayForMediaType:(int64_t)a3;
- (void)_updateImageRenderForComposition:(id)a3;
- (void)_updateLivePhotoComposition:(id)a3;
- (void)_updateLivePhotoWithResponse:(id)a3;
- (void)_updateROILayerWithLatestRenderResponse;
- (void)_updateROILayerWithRenderResponse:(id)a3;
- (void)_updateVideoComposition:(id)a3;
- (void)_updateVideoViewLayoutWithGeometry:(id)a3;
- (void)_updateVideoWithResult:(id)a3 sourceChanged:(BOOL)a4;
- (void)_withComposition:(id)a3 visitRenderClient:(id)a4;
- (void)beginPanning;
- (void)beginZooming;
- (void)cancelPendingRenders;
- (void)endPanning;
- (void)endZooming;
- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4;
- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4;
- (void)livePhotoViewDidBeginScrubbing:(id)a3;
- (void)livePhotoViewDidEndScrubbing:(id)a3;
- (void)pause;
- (void)play;
- (void)removeObserver:(id)a3;
- (void)seekToTime:(id *)a3;
- (void)seekToTime:(id *)a3 exact:(BOOL)a4;
- (void)seekToTime:(id *)a3 exact:(BOOL)a4 forceSeek:(BOOL)a5;
- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5;
- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 forceSeek:(BOOL)a6;
- (void)setBackingScale:(double)a3;
- (void)setColorSpace:(id)a3;
- (void)setComposition:(id)a3;
- (void)setDisplayCurrentEDRHeadroom:(double)a3;
- (void)setDisplayMaximumEDRHeadroom:(double)a3;
- (void)setDisplayType:(unint64_t)a3;
- (void)setLivePhotoViewIsScrubbing:(BOOL)a3;
- (void)setMaximumZoomScale:(double)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOverrideZoomScale:(double)a3;
- (void)setOverrideZoomToFitSize:(CGSize)a3;
- (void)setPipelineFilters:(id)a3;
- (void)setPixelFormat:(id)a3;
- (void)setPlaybackMode:(int64_t)a3;
- (void)setPlaybackRate:(double)a3;
- (void)setVideoEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)stepByCount:(int64_t)a3;
- (void)updateComposition:(id)a3;
- (void)wait;
@end

@implementation NUMediaViewRenderer

- (CGRect)convertRect:(CGRect)a3 fromImageToView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_mediaView = &self->_mediaView;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_mediaView);
  v11 = [WeakRetained _renderView];

  v12 = [v11 _containerLayer];
  v13 = [v9 layer];

  objc_msgSend(v12, "convertRect:toLayer:", v13, x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

uint64_t __56__NUMediaViewRenderer__updateImageRenderForComposition___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 112));
  [MEMORY[0x263F58688] begin];
  uint64_t v2 = [*(id *)(a1 + 40) mediaType];
  v3 = *(void **)(a1 + 32);
  if (v2 == 2)
  {
    v4 = [v3 _backfillRenderRequestForComposition:*(void *)(a1 + 40)];
    v5 = *(void **)(a1 + 32);
    v6 = (void *)v5[2];
    uint64_t v7 = [v5 _videoFrameImageRenderResponseHandler];
  }
  else
  {
    char v8 = [v3 isZoomedToFit];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    if ((v8 & 1) == 0)
    {
      v4 = [v9 _zoomRenderRequestForComposition:v10];
      [v4 setName:@"NUMediaViewRenderer-roi"];
      double v15 = *(void **)(a1 + 32);
      double v16 = (void *)v15[1];
      double v17 = [v15 _zoomRenderResponseHandler];
      [v16 submitGenericRequest:v4 completion:v17];

      [*(id *)(a1 + 32) _coalesceBackfillRenderForComposition:*(void *)(a1 + 40)];
      goto LABEL_7;
    }
    v4 = [v9 _backfillRenderRequestForComposition:v10];
    [v4 setName:@"NUMediaViewRenderer-zoomedToFit"];
    v11 = *(void **)(*(void *)(a1 + 32) + 16);
    v12 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:1];
    [v11 setPriority:v12];

    v13 = *(void **)(a1 + 32);
    v6 = (void *)v13[2];
    uint64_t v7 = [v13 _backfillRenderResponseHandler];
  }
  double v14 = (void *)v7;
  [v6 submitGenericRequest:v4 completion:v7];

LABEL_7:
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(v18 + 120);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__NUMediaViewRenderer__updateImageRenderForComposition___block_invoke_2;
  v21[3] = &unk_2642C2FC0;
  v21[4] = v18;
  return [MEMORY[0x263F58688] commitAndNotifyOnQueue:v19 withBlock:v21];
}

- (id)_backfillRenderRequestForComposition:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F58608];
  id v5 = a3;
  id v6 = [v4 alloc];
  [(NUMediaViewRenderer *)self targetSize];
  uint64_t v7 = objc_msgSend(v6, "initWithTargetSize:");
  char v8 = objc_opt_new();
  id v9 = [(NUMediaViewRenderer *)self newRenderRequestForComposition:v5 scalePolicy:v7 regionPolicy:v8];

  return v9;
}

- (CGSize)targetSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  v4 = [WeakRetained _scrollView];
  if (v4)
  {
    [(NUMediaViewRenderer *)self _scrollBounds];
    double v6 = v5;
    double v8 = v7;
    [WeakRetained edgeInsets];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [WeakRetained _renderView];
    uint64_t v18 = [v17 _roiLayer];
    objc_msgSend(v18, "nu_contentsAreFlipped");
    if (v6 - (v16 + v12) > 0.0) {
      double v19 = v6 - (v16 + v12);
    }
    else {
      double v19 = 0.0;
    }
    if (v8 - (v10 + v14) > 0.0) {
      double v20 = v8 - (v10 + v14);
    }
    else {
      double v20 = 0.0;
    }

    CGAffineTransformMakeScale(&v28, self->_backingScale, self->_backingScale);
    double v21 = v20 * v28.c + v28.a * v19;
    double v22 = v20 * v28.d + v28.b * v19;
  }
  else
  {
    double v21 = *MEMORY[0x263F001B0];
    double v22 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  BOOL v23 = v21 < 1.0;
  if (v22 < 1.0) {
    BOOL v23 = 1;
  }
  if (v23) {
    double v24 = 768.0;
  }
  else {
    double v24 = v22;
  }
  if (v23) {
    double v25 = 1024.0;
  }
  else {
    double v25 = v21;
  }

  double v26 = v25;
  double v27 = v24;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (id)newRenderRequestForComposition:(id)a3 scalePolicy:(id)a4 regionPolicy:(id)a5
{
  double v8 = (objc_class *)MEMORY[0x263F58698];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  double v12 = (void *)[[v8 alloc] initWithComposition:v11];

  [v12 setScalePolicy:v10];
  [v12 setRegionPolicy:v9];

  double v13 = [(NUMediaViewRenderer *)self colorSpace];

  if (v13)
  {
    double v14 = [(NUMediaViewRenderer *)self colorSpace];
    [v12 setColorSpace:v14];
  }
  double v15 = [(NUMediaViewRenderer *)self pixelFormat];

  if (v15)
  {
    double v16 = [(NUMediaViewRenderer *)self pixelFormat];
    [v12 setPixelFormat:v16];
  }
  [(NUMediaViewRenderer *)self displayMaximumEDRHeadroom];
  if (v17 > 1.0)
  {
    [(NUMediaViewRenderer *)self displayMaximumEDRHeadroom];
    objc_msgSend(v12, "setMaxEDRHeadroom:");
    [(NUMediaViewRenderer *)self displayCurrentEDRHeadroom];
    objc_msgSend(v12, "setCurrentEDRHeadroom:");
  }
  uint64_t v18 = [(NUMediaViewRenderer *)self pipelineFilters];
  [v12 setPipelineFilters:v18];

  long long v24 = 0uLL;
  uint64_t v25 = 0;
  double v19 = [(NUAVPlayerController *)self->_nuAVPlayerController player];
  double v20 = v19;
  if (v19)
  {
    [v19 currentTime];
  }
  else
  {
    long long v24 = 0uLL;
    uint64_t v25 = 0;
  }

  if (BYTE12(v24))
  {
    long long v22 = v24;
    uint64_t v23 = v25;
    [v12 setTime:&v22];
  }
  return v12;
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (CGRect)_scrollBounds
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  v3 = [WeakRetained _scrollView];

  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (NSArray)pipelineFilters
{
  return self->_pipelineFilters;
}

- (id)_backfillRenderResponseHandler
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__NUMediaViewRenderer__backfillRenderResponseHandler__block_invoke;
  v4[3] = &unk_2642C3038;
  v4[4] = self;
  uint64_t v2 = (void *)MEMORY[0x21D4593E0](v4, a2);

  return v2;
}

- (int64_t)playbackMode
{
  return self->_playbackMode;
}

- (void)updateComposition:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v21 = a3;
  double v4 = [(NUMediaViewRenderer *)self mediaView];
  if (self->_displayType == 2
    || [v21 mediaType] == 3
    && [v4 loopsVideoPlayback]
    && [v4 isVideoEnabled])
  {
    [v21 setMediaType:2];
  }
  uint64_t v5 = [v21 mediaType];
  if (!self->_displayType) {
    [(NUMediaViewRenderer *)self _updateDisplayForMediaType:v5];
  }
  switch(v5)
  {
    case 0:
      double v6 = NUAssertLogger_418();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        double v7 = [NSString stringWithFormat:@"Unknown mediaType for composition: %@", v21];
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v7;
        _os_log_error_impl(&dword_217C0A000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      double v8 = (const void **)MEMORY[0x263F585C8];
      specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
      double v10 = NUAssertLogger_418();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v11)
        {
          double v14 = dispatch_get_specific(*v8);
          double v15 = (void *)MEMORY[0x263F08B88];
          id v16 = v14;
          double v17 = [v15 callStackSymbols];
          uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v23 = v14;
          __int16 v24 = 2114;
          uint64_t v25 = v18;
          _os_log_error_impl(&dword_217C0A000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v11)
      {
        double v12 = [MEMORY[0x263F08B88] callStackSymbols];
        double v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v13;
        _os_log_error_impl(&dword_217C0A000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      double v19 = (NUMediaViewRenderer *)_NUAssertFailHandler();
      [(NUMediaViewRenderer *)v19 composition];
      return;
    case 1:
      [(NUMediaViewRenderer *)self _updateImageRenderForComposition:v21];
      goto LABEL_14;
    case 2:
      if ([(NUMediaViewRenderer *)self canRenderVideoLive])
      {
        [(NUMediaViewRenderer *)self _updateVideoComposition:v21];
      }
      else
      {
        [(NUAVPlayerController *)self->_nuAVPlayerController pause];
        [(NUMediaViewRenderer *)self _updateImageRenderForComposition:v21];
        [(NUMediaViewRenderer *)self _coalesceUpdateVideoComposition:v21];
      }
      goto LABEL_14;
    case 3:
      [(NUMediaViewRenderer *)self _updateImageRenderForComposition:v21];
      [(NUMediaViewRenderer *)self _coalesceUpdateLivePhotoComposition:v21];
      goto LABEL_14;
    default:
LABEL_14:

      return;
  }
}

- (NUComposition)composition
{
  return self->_composition;
}

- (NUMediaView)mediaView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);

  return (NUMediaView *)WeakRetained;
}

- (void)_updateImageRenderForComposition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_217C0A000, "Update Composition", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__NUMediaViewRenderer__updateImageRenderForComposition___block_invoke;
  v7[3] = &unk_2642C2FE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

- (void)_updateDisplayForMediaType:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 1) >= 3)
  {
    v3 = NUAssertLogger_418();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"We must have a known display type"];
      int v19 = 138543362;
      SEL v20 = v4;
      _os_log_error_impl(&dword_217C0A000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v5 = (const void **)MEMORY[0x263F585C8];
    specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    double v7 = NUAssertLogger_418();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        BOOL v11 = dispatch_get_specific(*v5);
        double v12 = (void *)MEMORY[0x263F08B88];
        id v13 = v11;
        double v14 = [v12 callStackSymbols];
        double v15 = [v14 componentsJoinedByString:@"\n"];
        int v19 = 138543618;
        SEL v20 = v11;
        __int16 v21 = 2114;
        long long v22 = v15;
        _os_log_error_impl(&dword_217C0A000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v19, 0x16u);
      }
    }
    else if (v8)
    {
      double v9 = [MEMORY[0x263F08B88] callStackSymbols];
      double v10 = [v9 componentsJoinedByString:@"\n"];
      int v19 = 138543362;
      SEL v20 = v10;
      _os_log_error_impl(&dword_217C0A000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v19, 0xCu);
    }
    id v16 = (NUMediaViewRenderer *)_NUAssertFailHandler();
    [(NUMediaViewRenderer *)v16 _setDisplayType:v18];
  }
  else
  {
    -[NUMediaViewRenderer _setDisplayType:](self, "_setDisplayType:");
  }
}

- (void)_setDisplayType:(unint64_t)a3
{
  if (self->_computedDisplayType != a3)
  {
    uint64_t v5 = [(NUMediaViewRenderer *)self mediaView];
    id v6 = self->_livePhotoView;
    if (a3 != 3)
    {
      if (a3 == 2)
      {
        id v13 = [v5 _renderView];
        [v13 setHidden:0];

        double v14 = [v5 _videoPlayerView];
        double v15 = [v5 _renderView];
        [v15 addSubview:v14];

        [(NUMediaViewRenderer *)self _addFullExtentConstraintsForView:v14];
        [(NUMediaViewRenderer *)self _setupAVPlayerController];
        if (v6) {
          [(UIView *)v6 setHidden:1];
        }
        [(NULivePhotoRenderClient *)self->_livePhotoClient cancel];
        livePhotoClient = self->_livePhotoClient;
        self->_livePhotoClient = 0;
      }
      else if (a3 == 1)
      {
        double v7 = [v5 _renderView];
        [v7 setHidden:0];

        [(NUMediaViewRenderer *)self _tearDownAVPlayerController];
        [v5 _rendererDidCreateAVPlayerController:0];
        if (v6) {
          [(UIView *)v6 setHidden:1];
        }
        [(NULivePhotoRenderClient *)self->_livePhotoClient cancel];
        BOOL v8 = self->_livePhotoClient;
        self->_livePhotoClient = 0;

        [(NUVideoRenderClient *)self->_videoClient cancel];
        videoClient = self->_videoClient;
        self->_videoClient = 0;
      }
LABEL_18:
      self->_computedDisplayType = a3;

      return;
    }
    double v10 = [v5 _renderView];
    [v10 setHidden:0];

    [(NUMediaViewRenderer *)self _tearDownAVPlayerController];
    [v5 _rendererDidCreateAVPlayerController:0];
    if (v6)
    {
      livePhotoView = v6;
      uint64_t v12 = 0;
    }
    else
    {
      id v6 = [v5 _livePhotoView];
      if (!v6) {
        goto LABEL_16;
      }
      SEL v17 = [v5 _renderView];
      [v17 addSubview:v6];

      [(NUMediaViewRenderer *)self _addFullExtentConstraintsForView:v6];
      objc_storeStrong((id *)&self->_livePhotoView, v6);
      [(UIView *)self->_livePhotoView performSelector:sel_setDelegate_ withObject:self];
      livePhotoView = self->_livePhotoView;
      uint64_t v12 = 1;
    }
    [(UIView *)livePhotoView setHidden:v12];
LABEL_16:
    [(NUVideoRenderClient *)self->_videoClient cancel];
    unint64_t v18 = self->_videoClient;
    self->_videoClient = 0;

    if (!self->_livePhotoClient)
    {
      id v19 = objc_alloc(MEMORY[0x263F58640]);
      SEL v20 = (NULivePhotoRenderClient *)[v19 initWithName:@"NUMediaViewRenderer-LivePhotoClient" responseQueue:MEMORY[0x263EF83A0]];
      __int16 v21 = self->_livePhotoClient;
      self->_livePhotoClient = v20;

      objc_initWeak(&location, self);
      long long v22 = self->_livePhotoClient;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __39__NUMediaViewRenderer__setDisplayType___block_invoke;
      v23[3] = &unk_2642C3088;
      objc_copyWeak(&v24, &location);
      [(NULivePhotoRenderClient *)v22 setCompletionBlock:v23];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    goto LABEL_18;
  }
}

- (void)_updateBackfillLayerWithLatestRenderResponse
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__477;
  double v9 = __Block_byref_object_dispose__478;
  id v10 = 0;
  renderQueue = self->_renderQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__NUMediaViewRenderer__updateBackfillLayerWithLatestRenderResponse__block_invoke;
  v4[3] = &unk_2642C3060;
  v4[4] = self;
  void v4[5] = &v5;
  dispatch_sync(renderQueue, v4);
  if (v6[5]) {
    -[NUMediaViewRenderer _updateBackfillLayerWithRenderResponse:](self, "_updateBackfillLayerWithRenderResponse:");
  }
  _Block_object_dispose(&v5, 8);
}

- (void)_updateBackfillLayerWithRenderResponse:(id)a3
{
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  uint64_t v5 = [WeakRetained _renderView];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 _backfillLayer];
    BOOL v8 = [(NUMediaViewRenderer *)self _updateImageLayer:v7 withRenderResponse:v12];
    lastBackfillRenderStatictics = self->_lastBackfillRenderStatictics;
    self->_lastBackfillRenderStatictics = v8;

    id v10 = [WeakRetained _livePhotoView];
    [v10 setHidden:1];

    BOOL v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 postNotificationName:@"NUMediaViewSnapshotAvailable" object:WeakRetained];
  }
}

- (id)_updateImageLayer:(id)a3 withRenderResponse:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v7 = a3;
  id specific = a4;
  id WeakRetained = (void *)0x263F08000;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    SEL v17 = NUAssertLogger_418();
    id v10 = &off_217C25000;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unint64_t v18 = [NSString stringWithFormat:@"This code must be running on the main thread"];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v18;
      _os_log_error_impl(&dword_217C0A000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v11 = (const void **)MEMORY[0x263F585C8];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    uint64_t v7 = NUAssertLogger_418();
    BOOL v19 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        id specific = dispatch_get_specific(*v11);
        SEL v20 = (void *)MEMORY[0x263F08B88];
        id v10 = (uint64_t (*__ptr32 *)())specific;
        id WeakRetained = [v20 callStackSymbols];
        BOOL v11 = [WeakRetained componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = (const void **)specific;
        __int16 v24 = 2114;
        uint64_t v25 = v11;
        _os_log_error_impl(&dword_217C0A000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      id specific = [MEMORY[0x263F08B88] callStackSymbols];
      id WeakRetained = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = (const void **)WeakRetained;
      _os_log_error_impl(&dword_217C0A000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_19:
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
    goto LABEL_5;
  }
  unint64_t v4 = 0x263F15000uLL;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  id v21 = 0;
  id v10 = [specific result:&v21];
  BOOL v11 = (const void **)v21;
  if (v10)
  {
    id v12 = [v10 geometry];
    id v13 = [v10 image];
    [v7 setImage:v13];

    [(NUMediaViewRenderer *)self _renderFinishedWithGeometry:v12 layer:v7];
    double v14 = [v10 statistics];

    goto LABEL_8;
  }
  if (*MEMORY[0x263F586F0] != -1) {
    goto LABEL_19;
  }
LABEL_5:
  double v15 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v11;
    _os_log_error_impl(&dword_217C0A000, v15, OS_LOG_TYPE_ERROR, "Error: %{public}@", buf, 0xCu);
  }
  [v7 setImage:0];
  double v14 = 0;
LABEL_8:
  [WeakRetained _rendererDidFinishWithStatistics:v14];
  [*(id *)(v4 + 2296) commit];

  return v14;
}

- (void)_renderFinishedWithGeometry:(id)a3 layer:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v7 = a3;
  id specific = a4;
  double v9 = [(NUMediaViewRenderer *)self mediaView];
  id v10 = [v9 _renderView];
  BOOL v11 = [v9 _scrollView];
  id v12 = [v10 _backfillLayer];

  [v7 scaledSize];
  if ([(NUMediaViewRenderer *)self isZoomedToFit] && v12 == specific)
  {
    [v7 renderScale];
    if ((NUScaleCompare() & 0x8000000000000000) == 0)
    {
      [(NUMediaViewRenderer *)self targetSize];
      NUPixelSizeFromCGSize();
      NUScaleToFitSizeInSize();
    }
    NUScaleToDouble();
    double v4 = v13;
    [v9 setScrollUpdatesSuppressed:1];
    [v11 minimumZoomScale];
    if (vabdd_f64(v14, v4) > 0.00000011920929
      || ([v11 zoomScale], vabdd_f64(v15, v4) > 0.00000011920929)
      || ([v11 maximumZoomScale], vabdd_f64(v37, v4) > 0.00000011920929)
      && ([v11 maximumZoomScale], vabdd_f64(v38, self->_maximumZoomScale) > 0.00000011920929))
    {
      [v11 setMinimumZoomScale:1.17549435e-38];
      [v11 setMaximumZoomScale:3.40282347e38];
      [v11 setMinimumZoomScale:v4];
      double maximumZoomScale = self->_maximumZoomScale;
      if (v4 >= maximumZoomScale) {
        double maximumZoomScale = v4;
      }
      [v11 setMaximumZoomScale:maximumZoomScale];
      [v11 setZoomScale:v4];
      if (*MEMORY[0x263F586F0] == -1) {
        goto LABEL_10;
      }
      goto LABEL_32;
    }
  }
  while (1)
  {
    [v10 setGeometry:v7];
    if (specific) {
      break;
    }
    v43 = NUAssertLogger_418();
    id v10 = &off_217C25000;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = [NSString stringWithFormat:@"nil render layer"];
      *(_DWORD *)buf = 138543362;
      double v48 = *(double *)&v44;
      _os_log_error_impl(&dword_217C0A000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v9 = (const void **)MEMORY[0x263F585C8];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    uint64_t v7 = NUAssertLogger_418();
    BOOL v45 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v45)
      {
        id specific = dispatch_get_specific(*v9);
        v46 = (void *)MEMORY[0x263F08B88];
        id v10 = (uint64_t (*__ptr32 *)())specific;
        double v9 = [v46 callStackSymbols];
        self = [v9 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v48 = *(double *)&specific;
        __int16 v49 = 2114;
        v50 = self;
        _os_log_error_impl(&dword_217C0A000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v45)
    {
      id specific = [MEMORY[0x263F08B88] callStackSymbols];
      double v9 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v48 = *(double *)&v9;
      _os_log_error_impl(&dword_217C0A000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_32:
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
LABEL_10:
    SEL v17 = (void *)*MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      v39 = v17;
      [v11 minimumZoomScale];
      v41 = v40;
      [v11 maximumZoomScale];
      *(_DWORD *)buf = 134218496;
      double v48 = v4;
      __int16 v49 = 2048;
      v50 = v41;
      __int16 v51 = 2048;
      uint64_t v52 = v42;
      _os_log_debug_impl(&dword_217C0A000, v39, OS_LOG_TYPE_DEBUG, "renderedScale = %g, minimumScale = %g, maximumScale = %g", buf, 0x20u);
    }
  }
  double v18 = *MEMORY[0x263F00148];
  double v19 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(specific, "setAnchorPoint:", *MEMORY[0x263F00148], v19);
  [specific setGeometry:v7];
  NUPixelSizeToCGRect();
  if (v12 == specific)
  {
    double v28 = v20;
    double v29 = v21;
    double v30 = v22;
    double v31 = v23;
    [specific bounds];
    if (vabdd_f64(v32, v28) > 0.00000011920929
      || ([specific bounds], vabdd_f64(v33, v29) > 0.00000011920929)
      || ([specific bounds], vabdd_f64(v34, v30) > 0.00000011920929)
      || ([specific bounds], vabdd_f64(v35, v31) > 0.00000011920929))
    {
      objc_msgSend(specific, "setBounds:", v28, v29, v30, v31);
      objc_msgSend(specific, "setPosition:", v18, v19);
    }
  }
  else
  {
    [(NUMediaViewRenderer *)self _scrollBounds];
    double v25 = v24;
    double v27 = v26;
    objc_msgSend(v10, "convertRect:fromView:", v11);
    objc_msgSend(v10, "convertRectToImage:");
    objc_msgSend(specific, "setPosition:");
    objc_msgSend(specific, "setBounds:", 0.0, 0.0, v25 * self->_backingScale, v27 * self->_backingScale);
  }
  v36 = [v10 _roiLayer];
  objc_msgSend(v36, "setHidden:", -[NUMediaViewRenderer isZoomedToFit](self, "isZoomedToFit"));

  [v9 setScrollUpdatesSuppressed:0];
}

- (BOOL)isZoomedToFit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  v3 = [WeakRetained _scrollView];

  [v3 zoomScale];
  double v5 = v4;
  [v3 minimumZoomScale];
  LOBYTE(WeakRetained) = v5 == v6;

  return (char)WeakRetained;
}

- (void)setComposition:(id)a3
{
}

- (void)setPlaybackRate:(double)a3
{
  double v4 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  if (v4)
  {
    id v11 = v4;
    double v5 = [v4 player];
    [v5 rate];
    double v7 = v6;

    double v4 = v11;
    if (v7 != a3)
    {
      double v9 = [v11 player];
      float v8 = a3;
      *(float *)&double v10 = v8;
      [v9 setRate:v10];

      double v4 = v11;
    }
  }
}

- (void)pause
{
}

- (NUAVPlayerController)nuAVPlayerController
{
  return self->_nuAVPlayerController;
}

- (void)setPixelFormat:(id)a3
{
}

- (void)setBackingScale:(double)a3
{
  self->_backingScale = a3;
}

- (NUMediaViewRenderer)initWithMediaView:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)NUMediaViewRenderer;
  id v3 = a3;
  double v4 = [(NUMediaViewRenderer *)&v29 init];
  dispatch_group_t v5 = dispatch_group_create();
  renderGroup = v4->_renderGroup;
  v4->_renderGroup = (OS_dispatch_group *)v5;

  double v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create("View Controller Image Response", v7);
  renderQueue = v4->_renderQueue;
  v4->_renderQueue = (OS_dispatch_queue *)v8;

  id v10 = objc_alloc(MEMORY[0x263F58690]);
  uint64_t v11 = objc_msgSend(v10, "initWithName:responseQueue:", @"NUMediaViewRenderer-roi", v4->_renderQueue, v29.receiver, v29.super_class);
  zoomClient = v4->_zoomClient;
  v4->_zoomClient = (NUSurfaceRenderClient *)v11;

  [(NUSurfaceRenderClient *)v4->_zoomClient setShouldCoalesceUpdates:1];
  double v13 = v4->_zoomClient;
  double v14 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:0];
  [(NUSurfaceRenderClient *)v13 setPriority:v14];

  uint64_t v15 = [objc_alloc(MEMORY[0x263F58690]) initWithName:@"NUMediaViewRenderer-zoomedToFit" responseQueue:v4->_renderQueue];
  backfillClient = v4->_backfillClient;
  v4->_backfillClient = (NUSurfaceRenderClient *)v15;

  [(NUSurfaceRenderClient *)v4->_backfillClient setShouldCoalesceUpdates:1];
  SEL v17 = v4->_backfillClient;
  double v18 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:1];
  [(NUSurfaceRenderClient *)v17 setPriority:v18];

  v4->_backingScale = 1.0;
  v4->_double maximumZoomScale = 1.0;
  objc_storeWeak((id *)&v4->_mediaView, v3);

  uint64_t v19 = [objc_alloc(MEMORY[0x263F585F8]) initWithDelay:0.25];
  livePhotoUpdateCoalescer = v4->_livePhotoUpdateCoalescer;
  v4->_livePhotoUpdateCoalescer = (NUCoalescer *)v19;

  uint64_t v21 = [objc_alloc(MEMORY[0x263F585F8]) initWithDelay:0.5];
  videoUpdateCoalescer = v4->_videoUpdateCoalescer;
  v4->_videoUpdateCoalescer = (NUCoalescer *)v21;

  uint64_t v23 = [objc_alloc(MEMORY[0x263F585F8]) initWithDelay:0.1];
  backfillUpdateCoalescer = v4->_backfillUpdateCoalescer;
  v4->_backfillUpdateCoalescer = (NUCoalescer *)v23;

  double v25 = [MEMORY[0x263F58668] currentPlatform];
  v4->_canRenderLoopingVideoLive = [v25 supportsLiveVideoRendering];

  double v26 = (NUObservatory *)objc_alloc_init(MEMORY[0x263F58658]);
  observatordouble y = v4->_observatory;
  v4->_observatordouble y = v26;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPipelineFilters, 0);
  objc_storeStrong((id *)&self->_nuAVPlayerController, 0);
  objc_storeStrong((id *)&self->_pipelineFilters, 0);
  objc_destroyWeak((id *)&self->_mediaView);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_lastBackfillRenderStatictics, 0);
  objc_storeStrong((id *)&self->_lastZoomRenderStatistics, 0);
  objc_storeStrong((id *)&self->_backfillRenderResponse, 0);
  objc_storeStrong((id *)&self->_zoomRenderResponse, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_renderGroup, 0);
  objc_storeStrong((id *)&self->_observatory, 0);
  objc_storeStrong((id *)&self->_backfillUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_videoUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_livePhotoUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_currentVideoSourceAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_videoClient, 0);
  objc_storeStrong((id *)&self->_livePhotoClient, 0);
  objc_storeStrong((id *)&self->_backfillClient, 0);

  objc_storeStrong((id *)&self->_zoomClient, 0);
}

- (NSArray)previousPipelineFilters
{
  return self->_previousPipelineFilters;
}

- (void)setLivePhotoViewIsScrubbing:(BOOL)a3
{
  self->_livePhotoViewIsScrubbing = a3;
}

- (BOOL)livePhotoViewIsScrubbing
{
  return self->_livePhotoViewIsScrubbing;
}

- (void)_setVideoEnabled:(BOOL)a3
{
  self->__videoEnabled = a3;
}

- (BOOL)_isVideoEnabled
{
  return self->__videoEnabled;
}

- (void)setOverrideZoomScale:(double)a3
{
  self->_overrideZoomScale = a3;
}

- (double)overrideZoomScale
{
  return self->_overrideZoomScale;
}

- (void)setOverrideZoomToFitSize:(CGSize)a3
{
  self->_overrideZoomToFitSize = a3;
}

- (CGSize)overrideZoomToFitSize
{
  double width = self->_overrideZoomToFitSize.width;
  double height = self->_overrideZoomToFitSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)computedDisplayType
{
  return self->_computedDisplayType;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void)setMaximumZoomScale:(double)a3
{
  self->_double maximumZoomScale = a3;
}

- (double)maximumZoomScale
{
  return self->_maximumZoomScale;
}

- (void)setDisplayCurrentEDRHeadroom:(double)a3
{
  self->_displayCurrentEDRHeadroom = a3;
}

- (double)displayCurrentEDRHeadroom
{
  return self->_displayCurrentEDRHeadroom;
}

- (void)setDisplayMaximumEDRHeadroom:(double)a3
{
  self->_displayMaximumEDRHeadroom = a3;
}

- (double)displayMaximumEDRHeadroom
{
  return self->_displayMaximumEDRHeadroom;
}

- (double)backingScale
{
  return self->_backingScale;
}

- (void)setColorSpace:(id)a3
{
}

- (void)livePhotoViewDidEndScrubbing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  dispatch_group_t v5 = [WeakRetained _livePhotoView];
  [v5 setHidden:1];

  [(NUMediaViewRenderer *)self setLivePhotoViewIsScrubbing:0];
}

- (void)livePhotoViewDidBeginScrubbing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  dispatch_group_t v5 = [WeakRetained _livePhotoView];
  [v5 setHidden:0];

  [(NUMediaViewRenderer *)self setLivePhotoViewIsScrubbing:1];
}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  double v4 = [WeakRetained _livePhotoView];
  [v4 setHidden:1];

  [WeakRetained _livephotoPlaybackDidEnd];
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  double v4 = [WeakRetained _livePhotoView];
  [v4 setHidden:0];

  [WeakRetained _livephotoPlaybackWillBegin];
}

- (void)removeObserver:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    dispatch_group_t v5 = NUAssertLogger_418();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      float v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "observer != nil");
      *(_DWORD *)buf = 138543362;
      double v20 = v6;
      _os_log_error_impl(&dword_217C0A000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v7 = (const void **)MEMORY[0x263F585C8];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    double v9 = NUAssertLogger_418();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        double v13 = dispatch_get_specific(*v7);
        double v14 = (void *)MEMORY[0x263F08B88];
        id v15 = v13;
        id v16 = [v14 callStackSymbols];
        SEL v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v20 = v13;
        __int16 v21 = 2114;
        double v22 = v17;
        _os_log_error_impl(&dword_217C0A000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F08B88] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v20 = v12;
      _os_log_error_impl(&dword_217C0A000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v18 = v4;
  [(NUObservatory *)self->_observatory removeObserver:v4];
}

- (void)_notifyPlaybackTimeChange:(id *)a3
{
  observatordouble y = self->_observatory;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__NUMediaViewRenderer__notifyPlaybackTimeChange___block_invoke;
  v4[3] = &unk_2642C3210;
  v4[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(NUObservatory *)observatory notifyAllObserversForKey:1 withBlock:v4];
}

uint64_t __49__NUMediaViewRenderer__notifyPlaybackTimeChange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, long long *))(a2 + 16);
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  return v4(a2, v3, &v6);
}

- (id)addPlaybackTimeObserver:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    dispatch_queue_t v8 = NUAssertLogger_418();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      double v22 = v9;
      _os_log_error_impl(&dword_217C0A000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v10 = (const void **)MEMORY[0x263F585C8];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    id v12 = NUAssertLogger_418();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        id v16 = dispatch_get_specific(*v10);
        SEL v17 = (void *)MEMORY[0x263F08B88];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        double v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v22 = v16;
        __int16 v23 = 2114;
        double v24 = v20;
        _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      double v14 = [MEMORY[0x263F08B88] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v22 = v15;
      _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v4;
  long long v6 = [(NUObservatory *)self->_observatory addObserverForKey:1 queue:0 block:v4];

  return v6;
}

- (void)_notifyExternalPlaybackChange:(BOOL)a3
{
  observatordouble y = self->_observatory;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__NUMediaViewRenderer__notifyExternalPlaybackChange___block_invoke;
  v4[3] = &unk_2642C31E8;
  v4[4] = self;
  BOOL v5 = a3;
  [(NUObservatory *)observatory notifyAllObserversForKey:2 withBlock:v4];
}

uint64_t __53__NUMediaViewRenderer__notifyExternalPlaybackChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)addExternalPlaybackObserver:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    dispatch_queue_t v8 = NUAssertLogger_418();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      double v22 = v9;
      _os_log_error_impl(&dword_217C0A000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v10 = (const void **)MEMORY[0x263F585C8];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    id v12 = NUAssertLogger_418();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        id v16 = dispatch_get_specific(*v10);
        SEL v17 = (void *)MEMORY[0x263F08B88];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        double v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v22 = v16;
        __int16 v23 = 2114;
        double v24 = v20;
        _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      double v14 = [MEMORY[0x263F08B88] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v22 = v15;
      _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  BOOL v5 = v4;
  long long v6 = [(NUObservatory *)self->_observatory addObserverForKey:2 queue:0 block:v4];

  return v6;
}

- (void)_notifyPlaybackStateChange:(int64_t)a3
{
  observatordouble y = self->_observatory;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__NUMediaViewRenderer__notifyPlaybackStateChange___block_invoke;
  v4[3] = &unk_2642C31C0;
  v4[4] = self;
  void v4[5] = a3;
  [(NUObservatory *)observatory notifyAllObserversForKey:0 withBlock:v4];
}

uint64_t __50__NUMediaViewRenderer__notifyPlaybackStateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)addPlaybackStateObserver:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    dispatch_queue_t v8 = NUAssertLogger_418();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      double v22 = v9;
      _os_log_error_impl(&dword_217C0A000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v10 = (const void **)MEMORY[0x263F585C8];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
    id v12 = NUAssertLogger_418();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        id v16 = dispatch_get_specific(*v10);
        SEL v17 = (void *)MEMORY[0x263F08B88];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        double v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v22 = v16;
        __int16 v23 = 2114;
        double v24 = v20;
        _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      double v14 = [MEMORY[0x263F08B88] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v22 = v15;
      _os_log_error_impl(&dword_217C0A000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  BOOL v5 = v4;
  long long v6 = [(NUObservatory *)self->_observatory addObserverForKey:0 queue:0 block:v4];

  return v6;
}

- (void)setMuted:(BOOL)a3
{
  if (self->_muted != a3)
  {
    BOOL v3 = a3;
    id v8 = [(NUMediaViewRenderer *)self nuAVPlayerController];
    if (v8) {
      [v8 setMuted:v3];
    }
    BOOL v5 = [(NUMediaViewRenderer *)self mediaView];
    long long v6 = [v5 _livePhotoView];
    uint64_t v7 = [NSNumber numberWithBool:v3];
    [v6 setValue:v7 forKey:@"muted"];

    self->_muted = v3;
  }
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setPlaybackMode:(int64_t)a3
{
  if (self->_playbackMode == a3) {
    return;
  }
  BOOL v5 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  if (v5)
  {
    if (!a3)
    {
      uint64_t v6 = 0;
      goto LABEL_7;
    }
    if (a3 == 1)
    {
      uint64_t v6 = 1;
LABEL_7:
      id v7 = v5;
      [v5 setLoopsVideo:v6];
      BOOL v5 = v7;
    }
  }
  self->_playbackMode = a3;
}

- (double)playbackRate
{
  uint64_t v2 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 player];
    [v4 rate];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)play
{
  [(NUMediaViewRenderer *)self currentTime];
  [(NUMediaViewRenderer *)self mediaDuration];
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    [(NUMediaViewRenderer *)self setPlaybackRate:1.0];
  }
  else
  {
    objc_initWeak(&location, self);
    BOOL v3 = [(NUMediaViewRenderer *)self nuAVPlayerController];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __27__NUMediaViewRenderer_play__block_invoke;
    v10[3] = &unk_2642C3128;
    objc_copyWeak(&v11, &location);
    long long v8 = *MEMORY[0x263F010E0];
    uint64_t v9 = *(void *)(MEMORY[0x263F010E0] + 16);
    long long v6 = v8;
    uint64_t v7 = v9;
    long long v4 = v8;
    uint64_t v5 = v9;
    [v3 seek:&v8 toleranceBefore:&v6 toleranceAfter:&v4 forceSeek:1 completionHandler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __27__NUMediaViewRenderer_play__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPlaybackRate:1.0];
}

- (void)stepByCount:(int64_t)a3
{
  long long v4 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  if (v4)
  {
    id v5 = v4;
    [v4 step:a3];
    long long v4 = v5;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentSeekTime
{
  long long v4 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  if (v4)
  {
    long long v6 = v4;
    [v4 currentSeekTime];
    long long v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 forceSeek:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v10 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  id v11 = v10;
  if (v10)
  {
    long long v16 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    long long v14 = *(_OWORD *)&a4->var0;
    int64_t v15 = a4->var3;
    long long v12 = *(_OWORD *)&a5->var0;
    int64_t v13 = a5->var3;
    [v10 seek:&v16 toleranceBefore:&v14 toleranceAfter:&v12 forceSeek:v6];
  }
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a5;
  [(NUMediaViewRenderer *)self seekToTime:&v7 toleranceBefore:&v6 toleranceAfter:&v5 forceSeek:0];
}

- (void)seekToTime:(id *)a3 exact:(BOOL)a4 forceSeek:(BOOL)a5
{
  BOOL v5 = a5;
  memset(&v12, 0, sizeof(v12));
  if (a4) {
    CMTime v12 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  }
  else {
    CMTimeMake(&v12, 5, 30);
  }
  long long v10 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  CMTime v9 = v12;
  CMTime v8 = v12;
  [(NUMediaViewRenderer *)self seekToTime:&v10 toleranceBefore:&v9 toleranceAfter:&v8 forceSeek:v5];
}

- (void)seekToTime:(id *)a3 exact:(BOOL)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(NUMediaViewRenderer *)self seekToTime:&v4 exact:a4 forceSeek:0];
}

- (NSArray)loadedTimeRanges
{
  uint64_t v2 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  BOOL v3 = [v2 player];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [v3 currentItem];

  BOOL v5 = [v4 loadedTimeRanges];

  return (NSArray *)v5;
}

- (void)seekToTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = *a3;
  [(NUMediaViewRenderer *)self seekToTime:&v3 exact:1];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  if (v4)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = v4;
    [v4 currentTime];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = v7;
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F01090];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x263F01090];
    retstr->int64_t var3 = *(void *)(v5 + 16);
  }

  return result;
}

- (int64_t)_playbackStateFromPlayerStatus:(int64_t)a3 rate:(float)a4
{
  int64_t v4 = 1;
  int64_t v5 = 2;
  if (a4 != 0.0) {
    int64_t v5 = 3;
  }
  if (a3 == 2) {
    int64_t v4 = 4;
  }
  if (a3 == 1) {
    return v5;
  }
  else {
    return v4;
  }
}

- (int64_t)playbackState
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  int64_t v4 = v3;
  if (v3 && ([v3 videoAsset], int64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v4 player];
    uint64_t v7 = [v6 status];
    [v6 rate];
    int64_t v8 = -[NUMediaViewRenderer _playbackStateFromPlayerStatus:rate:](self, "_playbackStateFromPlayerStatus:rate:", v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mediaDuration
{
  id v8 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  int64_t v4 = [v8 videoAsset];
  int64_t v5 = v4;
  if (v4)
  {
    [v4 duration];
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F01090];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x263F01090];
    retstr->int64_t var3 = *(void *)(v6 + 16);
  }

  return result;
}

- (void)cancelPendingRenders
{
  [(NUSurfaceRenderClient *)self->_backfillClient cancel];
  [(NUSurfaceRenderClient *)self->_zoomClient cancel];
  [(NUVideoRenderClient *)self->_videoClient cancel];
  livePhotoClient = self->_livePhotoClient;

  [(NULivePhotoRenderClient *)livePhotoClient cancel];
}

- (void)setVideoEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  [WeakRetained setVideoPlayerVisible:v5 animated:v4];

  [(NUMediaViewRenderer *)self _setVideoEnabled:v5];
}

- (void)_addFullExtentConstraintsForView:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v4 = (void *)MEMORY[0x263F08938];
  CMTime v12 = @"v";
  v13[0] = v3;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v6 = [v4 constraintsWithVisualFormat:@"H:|[v]|" options:0 metrics:0 views:v5];
  [v4 activateConstraints:v6];

  uint64_t v7 = (void *)MEMORY[0x263F08938];
  long long v10 = @"v";
  id v11 = v3;
  id v8 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  CMTime v9 = [v7 constraintsWithVisualFormat:@"V:|[v]|" options:0 metrics:0 views:v8];
  [v7 activateConstraints:v9];
}

- (double)_lastRenderDuration
{
  lastZoomRenderStatistics = self->_lastZoomRenderStatistics;
  if (!lastZoomRenderStatistics) {
    lastZoomRenderStatistics = self->_lastBackfillRenderStatictics;
  }
  [(NURenderStatistics *)lastZoomRenderStatistics totalDuration];
  return result;
}

- (CGRect)_zoomTargetRect
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  [(NUMediaViewRenderer *)self _scrollBounds];
  double v7 = v3;
  double v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if (self->_isPanning && !self->_isZooming)
  {
    [(NUMediaViewRenderer *)self _lastRenderDuration];
    double v12 = v11;
    double v13 = v7 - self->_lastZoomRect.origin.x;
    double v14 = v8 - self->_lastZoomRect.origin.y;
    NUAbsoluteTime();
    double v16 = v15 - self->_lastZoomRenderTime;
    double v25 = v13;
    double v26 = v14;
    double v17 = v12 * v13 / v16;
    double v18 = v12 * v14 / v16;
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
    }
    double v19 = v7 + v17;
    double v20 = v8 + v18;
    __int16 v21 = (void *)*MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      double v22 = v21;
      v40.origin.double x = v19;
      v40.origin.double y = v20;
      v40.size.double width = v9;
      v40.size.double height = v10;
      __int16 v23 = NSStringFromCGRect(v40);
      v41.origin.double x = v7;
      v41.origin.double y = v8;
      v41.size.double width = v9;
      v41.size.double height = v10;
      double v24 = NSStringFromCGRect(v41);
      *(_DWORD *)buf = 138413570;
      double v28 = v23;
      __int16 v29 = 2112;
      double v30 = v24;
      __int16 v31 = 2048;
      double v32 = v25;
      __int16 v33 = 2048;
      double v34 = v26;
      __int16 v35 = 2048;
      double v36 = v12;
      __int16 v37 = 2048;
      double v38 = v16;
      _os_log_debug_impl(&dword_217C0A000, v22, OS_LOG_TYPE_DEBUG, "targetRect: %@, clipRect: %@, dx = %f, ddouble y = %f, dr = %f, dt= %f", buf, 0x3Eu);
    }
    NUAlignRectToPixelGrid();
    NUPixelRectToCGRect();
  }
  self->_lastZoomRect.origin.double x = v7;
  self->_lastZoomRect.origin.double y = v8;
  self->_lastZoomRect.size.double width = v9;
  self->_lastZoomRect.size.double height = v10;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)_targetZoomScale
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  double v3 = [WeakRetained _scrollView];

  [v3 zoomScale];
  double v5 = v4;
  [v3 minimumZoomScale];
  double v7 = v6;
  [v3 maximumZoomScale];
  double v9 = fmax(v7, fmin(v5, v8));

  return v9;
}

- (id)_zoomRenderRequestForComposition:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x263F586D0];
  id v5 = a3;
  id v6 = [v4 alloc];
  [(NUMediaViewRenderer *)self _targetZoomScale];
  double v7 = objc_msgSend(v6, "initWithZoomFactor:");
  [(NUMediaViewRenderer *)self _zoomTargetRect];
  double v8 = -[NUMediaViewRenderer _regionPolicyForZoomTargetRect:](self, "_regionPolicyForZoomTargetRect:");
  id v9 = [(NUMediaViewRenderer *)self newRenderRequestForComposition:v5 scalePolicy:v7 regionPolicy:v8];

  NUAbsoluteTime();
  self->_lastZoomRenderTime = v10;

  return v9;
}

- (void)_updateLivePhotoWithResponse:(id)a3
{
  id v22 = a3;
  if ([(NUMediaViewRenderer *)self computedDisplayType] == 3)
  {
    double v4 = [(NUMediaViewRenderer *)self _livePhotoFromResponse:v22];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
    id v6 = [WeakRetained _livePhotoView];
    double v7 = [v6 valueForKey:@"livePhoto"];

    if (v7)
    {
      uint64_t v21 = [v22 video];
      uint64_t v8 = [v7 valueForKey:@"videoAsset"];
      id v9 = [v7 valueForKey:@"videoComposition"];
      double v10 = [v22 videoComposition];
      [(NUMediaViewRenderer *)self mediaView];
      v12 = double v11 = v4;
      double v13 = [v12 player];
      BOOL v14 = [v13 playbackState] == 3;

      double v4 = v11;
      double v15 = (void *)v8;
      double v16 = (void *)v21;
      if ([(id)objc_opt_class() _forceUpdateForNewVideoComposition:v10 previousComposition:v9 newAsset:v21 previousAsset:v15 isPlaying:v14])
      {
        double v17 = [WeakRetained _livePhotoView];
        [v17 performSelector:NSSelectorFromString(&cfstr_Setlivephoto.isa) withObject:v4];
      }
      double v18 = [WeakRetained _livePhotoView];
      NSSelectorFromString(&cfstr_Setoverridepho.isa);
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        double v20 = [WeakRetained _livePhotoView];
        objc_msgSend(v20, "performSelector:withObject:", NSSelectorFromString(&cfstr_Setoverridepho.isa), objc_msgSend(v22, "photo"));
      }
    }
    else
    {
      double v16 = [WeakRetained _livePhotoView];
      [v16 performSelector:NSSelectorFromString(&cfstr_Setlivephoto.isa) withObject:v4];
    }

    [WeakRetained _rendererDidUpdateLivePhoto];
  }

  MEMORY[0x270F9A790]();
}

- (id)_livePhotoFromResponse:(id)a3
{
  id v3 = a3;
  double v4 = [v3 video];
  id v5 = [v3 videoComposition];
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  if (v3) {
    [v3 photoTime];
  }
  id v6 = objc_alloc(NSClassFromString(&cfstr_Phlivephoto.isa));
  uint64_t v7 = [v3 photo];
  long long v10 = v12;
  uint64_t v11 = v13;
  uint64_t v8 = (void *)[v6 initWithImage:v7 uiOrientation:0 videoAsset:v4 photoTime:&v10 asset:0 options:1 videoComposition:v5];

  return v8;
}

- (void)_updateLivePhotoComposition:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x263F58648];
  id v5 = a3;
  id v10 = (id)[[v4 alloc] initWithComposition:v5];

  [v10 setName:@"NUMediaViewRenderer"];
  [v10 setPipelineFilters:self->_pipelineFilters];
  id v6 = objc_alloc(MEMORY[0x263F58608]);
  [(NUMediaViewRenderer *)self targetSize];
  uint64_t v7 = objc_msgSend(v6, "initWithTargetSize:");
  [v10 setScalePolicy:v7];
  uint64_t v8 = [(NUMediaViewRenderer *)self colorSpace];

  if (v8)
  {
    id v9 = [(NUMediaViewRenderer *)self colorSpace];
    [v10 setColorSpace:v9];
  }
  [v10 setIsOneShot:1];
  [(NULivePhotoRenderClient *)self->_livePhotoClient submitRequest:v10];
}

- (void)_coalesceUpdateLivePhotoComposition:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  livePhotoUpdateCoalescer = self->_livePhotoUpdateCoalescer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__NUMediaViewRenderer__coalesceUpdateLivePhotoComposition___block_invoke;
  v7[3] = &unk_2642C3010;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(NUCoalescer *)livePhotoUpdateCoalescer coalesceBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__NUMediaViewRenderer__coalesceUpdateLivePhotoComposition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateLivePhotoComposition:*(void *)(a1 + 32)];
}

- (void)_coalesceUpdateVideoComposition:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  videoUpdateCoalescer = self->_videoUpdateCoalescer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__NUMediaViewRenderer__coalesceUpdateVideoComposition___block_invoke;
  v7[3] = &unk_2642C3010;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(NUCoalescer *)videoUpdateCoalescer coalesceBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__NUMediaViewRenderer__coalesceUpdateVideoComposition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateVideoComposition:*(void *)(a1 + 32)];
}

- (void)_updateVideoViewLayoutWithGeometry:(id)a3
{
  id v4 = a3;
  if (v4 && [(NUMediaViewRenderer *)self isZoomedToFit])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
    id v6 = [WeakRetained _renderView];
    uint64_t v7 = [WeakRetained _scrollView];
    [(NUMediaViewRenderer *)self _scrollBounds];
    double v9 = v8;
    double v11 = v10;
    [WeakRetained edgeInsets];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = [v6 _roiLayer];
    objc_msgSend(v20, "nu_contentsAreFlipped");
    double v21 = v11 - (v13 + v17);
    if (v9 - (v19 + v15) > 0.0) {
      double v22 = v9 - (v19 + v15);
    }
    else {
      double v22 = 0.0;
    }
    if (v21 > 0.0) {
      double v23 = v21;
    }
    else {
      double v23 = 0.0;
    }

    [v4 size];
    NUPixelSizeToCGSize();
    double v25 = v24;
    double v27 = v26;
    CGAffineTransformMakeScale(&v30, self->_backingScale, self->_backingScale);
    if ((v23 * v30.c + v30.a * v22) / v25 >= (v23 * v30.d + v30.b * v22) / v27) {
      double v28 = (v23 * v30.d + v30.b * v22) / v27;
    }
    else {
      double v28 = (v23 * v30.c + v30.a * v22) / v25;
    }
    [v7 setMinimumZoomScale:1.17549435e-38];
    [v7 setMaximumZoomScale:3.40282347e38];
    [v7 setMinimumZoomScale:v28];
    [v7 setZoomScale:v28];
    double maximumZoomScale = self->_maximumZoomScale;
    if (maximumZoomScale < v28) {
      double maximumZoomScale = v28;
    }
    [v7 setMaximumZoomScale:maximumZoomScale];
    [v6 setGeometry:v4];
  }
}

- (void)_updateVideoComposition:(id)a3
{
  id v4 = a3;
  if (!self->_didReleaseAVObjects)
  {
    atomic_fetch_add(&self->_videoRenderInFlightCount, 1u);
    if (!self->_videoClient)
    {
      id v5 = (NUVideoRenderClient *)[objc_alloc(MEMORY[0x263F586B8]) initWithName:@"NUMediaViewRenderer-NUVideoRenderRequest"];
      videoClient = self->_videoClient;
      self->_videoClient = v5;
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"source"];
    double v8 = [v7 assetIdentifier];

    if ((v8 != 0) == (self->_currentVideoSourceAssetIdentifier == 0)) {
      char v9 = 1;
    }
    else {
      char v9 = objc_msgSend(v8, "isEqualToString:") ^ 1;
    }
    objc_storeStrong((id *)&self->_currentVideoSourceAssetIdentifier, v8);
    double v10 = [(NUMediaViewRenderer *)self mediaView];
    double v11 = self->_nuAVPlayerController;
    BOOL v12 = [(NUMediaViewRenderer *)self canRenderVideoLive];
    double v13 = [(NUMediaViewRenderer *)self pipelineFilters];
    if (!v12)
    {
      double v14 = [(NUMediaViewRenderer *)self cacheVideoRenderFilter];
      uint64_t v15 = [v13 arrayByAddingObject:v14];

      [v10 _rendererDidStartPreparingVideo];
      double v13 = (void *)v15;
    }
    double v16 = [(NUMediaViewRenderer *)self _scalePolicyForVideoCompositionRender];
    [(NUVideoRenderClient *)self->_videoClient setPipelineFilters:v13];
    [(NUVideoRenderClient *)self->_videoClient setScalePolicy:v16];
    [(NUVideoRenderClient *)self->_videoClient setSampleMode:2];
    double v17 = self->_videoClient;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __47__NUMediaViewRenderer__updateVideoComposition___block_invoke;
    v20[3] = &unk_2642C3198;
    char v23 = v9;
    BOOL v24 = v12;
    v20[4] = self;
    id v21 = v10;
    double v22 = v11;
    double v18 = v11;
    id v19 = v10;
    [(NUVideoRenderClient *)v17 submitRequestForComposition:v4 completion:v20];
  }
}

void __47__NUMediaViewRenderer__updateVideoComposition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 108), 0xFFFFFFFF);
  id v15 = 0;
  id v4 = [a2 result:&v15];
  id v5 = v15;
  if (!v4)
  {
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
    }
    id v6 = *MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v5;
      _os_log_impl(&dword_217C0A000, v6, OS_LOG_TYPE_DEFAULT, "Failed to update video composition: %{public}@", buf, 0xCu);
    }
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__NUMediaViewRenderer__updateVideoComposition___block_invoke_80;
  v9[3] = &unk_2642C3170;
  uint64_t v7 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v4;
  __int16 v14 = *(_WORD *)(a1 + 56);
  unsigned int v13 = add - 1;
  id v11 = v7;
  id v12 = *(id *)(a1 + 48);
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __47__NUMediaViewRenderer__updateVideoComposition___block_invoke_80(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isVideoEnabled] & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) displayType], result == 2))
  {
    uint64_t result = [*(id *)(a1 + 32) _updateVideoWithResult:*(void *)(a1 + 40) sourceChanged:*(unsigned __int8 *)(a1 + 68)];
    if (!*(_DWORD *)(a1 + 64) && !*(unsigned char *)(a1 + 69))
    {
      [*(id *)(a1 + 48) _rendererDidFinishPreparingVideo];
      [*(id *)(a1 + 48) setVideoPlayerVisible:1 animated:1];
      uint64_t result = [*(id *)(a1 + 32) playbackMode];
      if (result == 1)
      {
        id v3 = *(void **)(a1 + 56);
        return [v3 play];
      }
    }
  }
  return result;
}

- (id)_scalePolicyForVideoCompositionRender
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(NUMediaViewRenderer *)self overrideZoomToFitSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  [(NUMediaViewRenderer *)self overrideZoomScale];
  if (v4 != v7 || v6 != v8)
  {
    [(NUMediaViewRenderer *)self overrideZoomToFitSize];
    goto LABEL_6;
  }
  if (v9 == 0.0 && [(NUMediaViewRenderer *)self isZoomedToFit])
  {
    [(NUMediaViewRenderer *)self targetSize];
LABEL_6:
    int v13 = (int)v11;
    double v14 = (double)(int)v11;
    int v15 = (int)v12;
    double v16 = (double)(int)v12;
    if (v13 >= 0) {
      int v17 = v13 & 1;
    }
    else {
      int v17 = -(v13 & 1);
    }
    double v18 = (double)(2 - v17);
    if (!v17) {
      double v18 = -0.0;
    }
    int v19 = v15 & 1;
    if (v15 < 0) {
      int v19 = -v19;
    }
    double v20 = v18 + v14;
    if (v19) {
      double v21 = (double)(2 - v19);
    }
    else {
      double v21 = -0.0;
    }
    double v22 = v21 + v16;
    char v23 = objc_msgSend(objc_alloc(MEMORY[0x263F58608]), "initWithTargetSize:", v20, v21 + v16);
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
    }
    BOOL v24 = *MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      int v33 = 134218240;
      double v34 = v20;
      __int16 v35 = 2048;
      double v36 = v22;
      double v25 = "VideoCompositorScalePolicy: FIT scale policy fit to %f x %f";
      double v26 = v24;
      uint32_t v27 = 22;
LABEL_33:
      _os_log_debug_impl(&dword_217C0A000, v26, OS_LOG_TYPE_DEBUG, v25, (uint8_t *)&v33, v27);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  [(NUMediaViewRenderer *)self overrideZoomScale];
  if (v28 == 0.0) {
    [(NUMediaViewRenderer *)self _targetZoomScale];
  }
  else {
    [(NUMediaViewRenderer *)self overrideZoomScale];
  }
  double v30 = v29;
  char v23 = (void *)[objc_alloc(MEMORY[0x263F586D0]) initWithZoomFactor:v29];
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
  }
  __int16 v31 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    int v33 = 134217984;
    double v34 = v30;
    double v25 = "VideoCompositorScalePolicy: ZOOM scale policy zoomed to %f";
    double v26 = v31;
    uint32_t v27 = 12;
    goto LABEL_33;
  }
LABEL_29:

  return v23;
}

- (void)_updateVideoWithResult:(id)a3 sourceChanged:(BOOL)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(NUMediaViewRenderer *)self computedDisplayType] == 2 && !self->_didReleaseAVObjects)
  {
    double v7 = self->_nuAVPlayerController;
    double v8 = [(NUAVPlayerController *)v7 videoAsset];
    double v9 = [(NUAVPlayerController *)v7 videoComposition];
    id v10 = [v6 avAsset];
    if (v10)
    {
      v55 = v7;
      [v6 videoComposition];
      v12 = double v11 = v10;
      v57 = [v6 audioMix];
      int v13 = [(NUMediaViewRenderer *)self mediaView];
      [v13 player];
      double v14 = v58 = v9;
      uint64_t v15 = [v14 playbackState];

      double v16 = objc_opt_class();
      v56 = (void *)v12;
      uint64_t v17 = v12;
      id v10 = v11;
      int v18 = [v16 _forceUpdateForNewVideoComposition:v17 previousComposition:v9 newAsset:v11 previousAsset:v8 isPlaying:v15 == 3];
      int v19 = 0;
      if ((v18 & 1) == 0 && v15 == 3) {
        int v19 = [MEMORY[0x263F586C0] compositionInstructions:v56 areEqualToCompositionInstructions:v9] ^ 1;
      }
      int v54 = v19;
      double v7 = v55;
      if (v8 != v10)
      {
        uint64_t v53 = v8;
        id v20 = objc_alloc(MEMORY[0x263F58638]);
        double v21 = [(NUMediaViewRenderer *)self composition];
        double v22 = (void *)[v20 initWithComposition:v21];

        [v22 setName:@"PXSubjectTrackingView-getUnadjustedImageSize"];
        uint64_t v61 = 0;
        char v23 = [v22 submitSynchronous:&v61];
        uint64_t v24 = v61;
        double v25 = [v23 properties];

        if (!v24)
        {
          [v25 size];
          NUPixelSizeToCGSize();
          double v27 = v26;
          double v29 = v28;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
          objc_msgSend(WeakRetained, "set_masterSizeWithoutGeometry:", v27, v29);
        }
        double v8 = v53;
      }
      BOOL v31 = [(NUMediaViewRenderer *)self pipelineFilersHaveChanged];
      int v32 = v18 | v31;
      id v33 = objc_loadWeakRetained((id *)&self->_mediaView);
      double v34 = [v6 geometry];
      [(NUMediaViewRenderer *)self _updateVideoViewLayoutWithGeometry:v34];
      if (v32 == 1)
      {
        if (!v55)
        {
          CGRect v40 = NUAssertLogger_418();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            CGRect v41 = [NSString stringWithFormat:@"We should have an initialized AV player controller"];
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v41;
            _os_log_error_impl(&dword_217C0A000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
          }
          uint64_t v42 = (const void **)MEMORY[0x263F585C8];
          id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
          v44 = NUAssertLogger_418();
          BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
          if (specific)
          {
            if (v45)
            {
              double v48 = dispatch_get_specific(*v42);
              __int16 v49 = (void *)MEMORY[0x263F08B88];
              id v50 = v48;
              __int16 v51 = [v49 callStackSymbols];
              uint64_t v52 = [v51 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v48;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v52;
              _os_log_error_impl(&dword_217C0A000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
            }
          }
          else if (v45)
          {
            v46 = [MEMORY[0x263F08B88] callStackSymbols];
            v47 = [v46 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v47;
            _os_log_error_impl(&dword_217C0A000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
          _NUAssertFailHandler();
        }
        if (v8 == v10 && ![v33 isHidden])
        {
          double v36 = v56;
          [(NUAVPlayerController *)v55 updateVideoComposition:v56];
          [(NUAVPlayerController *)v55 updateAudioMix:v57];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F01090];
          *(void *)&buf[16] = *(void *)(MEMORY[0x263F01090] + 16);
          if (!a4)
          {
            if ([(NUAVPlayerController *)v55 currentlySeeking]) {
              [(NUAVPlayerController *)v55 currentSeekTime];
            }
            else {
              [(NUAVPlayerController *)v55 currentTime];
            }
          }
          BOOL v38 = self->_playbackMode == 1;
          long long v59 = *(_OWORD *)buf;
          uint64_t v60 = *(void *)&buf[16];
          double v36 = v56;
          if ([(NUAVPlayerController *)v55 prepareWithAVAsset:v10 videoComposition:v56 audioMix:v57 loopsVideo:v38 seekToTime:&v59])
          {
            [v33 _rendererDidCreateAVPlayerController:v55];
            [(NUMediaViewRenderer *)self _notifyPlaybackStateChange:1];
          }
        }
      }
      else
      {
        [(NUAVPlayerController *)v55 updateAudioMix:v57];
        double v36 = v56;
        if (v56) {
          int v37 = v54;
        }
        else {
          int v37 = 0;
        }
        if (v37 == 1) {
          [(NUAVPlayerController *)v55 updateWithVideoPrepareNodeFromVideoComposition:v56];
        }
      }
      if (v31) {
        [(NUMediaViewRenderer *)self setPipelineFilters:self->_pipelineFilters];
      }
      uint64_t v39 = [v6 statistics];
      [v33 _rendererDidFinishWithStatistics:v39];

      double v9 = v58;
    }
    else
    {
      if (*MEMORY[0x263F586F0] != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
      }
      __int16 v35 = *MEMORY[0x263F58700];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_217C0A000, v35, OS_LOG_TYPE_ERROR, "Nil video asset received", buf, 2u);
      }
    }
  }
}

- (id)cacheVideoRenderFilter
{
  if (cacheVideoRenderFilter_onceToken != -1) {
    dispatch_once(&cacheVideoRenderFilter_onceToken, &__block_literal_global_451);
  }
  uint64_t v2 = (void *)cacheVideoRenderFilter_filter;

  return v2;
}

uint64_t __45__NUMediaViewRenderer_cacheVideoRenderFilter__block_invoke()
{
  cacheVideoRenderFilter_filter = [objc_alloc(MEMORY[0x263F58680]) initWithBlock:&__block_literal_global_59];

  return MEMORY[0x270F9A758]();
}

id __45__NUMediaViewRenderer_cacheVideoRenderFilter__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a4;
  uint64_t v10 = [v8 mediaTypeForComposition:a3];
  double v11 = v9;
  if (v10 == 2)
  {
    double v11 = [v8 cacheNode:v9 type:@"Video" settings:MEMORY[0x263EFFA78] error:a5];
  }

  return v11;
}

- (void)_tearDownAVPlayerController
{
  nuAVPlayerController = self->_nuAVPlayerController;
  if (nuAVPlayerController)
  {
    [(NUAVPlayerController *)nuAVPlayerController removeObserver:self];
    double v4 = self->_nuAVPlayerController;
    self->_nuAVPlayerController = 0;

    [(NUMediaViewRenderer *)self _notifyPlaybackStateChange:0];
  }
}

- (void)_playerStatusDidChange:(int64_t)a3
{
  id v9 = [(NUMediaViewRenderer *)self nuAVPlayerController];
  double v5 = [v9 player];
  [v5 rate];
  int v7 = v6;

  LODWORD(v8) = v7;
  [(NUMediaViewRenderer *)self _notifyPlaybackStateChange:[(NUMediaViewRenderer *)self _playbackStateFromPlayerStatus:a3 rate:v8]];
}

- (void)_setupAVPlayerController
{
  if (!self->_nuAVPlayerController)
  {
    double v3 = objc_alloc_init(NUAVPlayerController);
    nuAVPlayerController = self->_nuAVPlayerController;
    self->_nuAVPlayerController = v3;

    [(NUAVPlayerController *)self->_nuAVPlayerController setLoopsVideo:self->_playbackMode == 1];
    [(NUAVPlayerController *)self->_nuAVPlayerController setMuted:self->_muted];
    objc_initWeak(&location, self);
    double v5 = self->_nuAVPlayerController;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke;
    v15[3] = &unk_2642C30B0;
    objc_copyWeak(&v16, &location);
    [(NUAVPlayerController *)v5 addPlaybackTimeObserver:self block:v15];
    int v6 = self->_nuAVPlayerController;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_2;
    v13[3] = &unk_2642C30D8;
    objc_copyWeak(&v14, &location);
    [(NUAVPlayerController *)v6 addPlayerStatusObserver:self block:v13];
    int v7 = self->_nuAVPlayerController;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_3;
    v11[3] = &unk_2642C3100;
    objc_copyWeak(&v12, &location);
    [(NUAVPlayerController *)v7 addPlaybackRateObserver:self block:v11];
    double v8 = self->_nuAVPlayerController;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_4;
    v9[3] = &unk_2642C3128;
    objc_copyWeak(&v10, &location);
    [(NUAVPlayerController *)v8 addExternalPlaybackObserver:self block:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  [WeakRetained _notifyPlaybackTimeChange:&v4];
}

void __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playerStatusDidChange:a2];
}

void __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_3(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a2 == 0.0) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  [WeakRetained _notifyPlaybackStateChange:v4];
}

void __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyExternalPlaybackChange:a2];
}

void __39__NUMediaViewRenderer__setDisplayType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = 0;
  double v3 = [a2 result:&v7];
  id v4 = v7;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _updateLivePhotoWithResponse:v3];
  }
  else
  {
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
    }
    int v6 = *MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v4;
      _os_log_error_impl(&dword_217C0A000, v6, OS_LOG_TYPE_ERROR, "Error loading LivePhoto: %{public}@", buf, 0xCu);
    }
  }
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (id)renderClient
{
  return self->_backfillClient;
}

- (void)_updateROILayerWithRenderResponse:(id)a3
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  id v5 = [WeakRetained _renderView];
  int v6 = v5;
  if (v5)
  {
    id v7 = [v5 _roiLayer];
    double v8 = [(NUMediaViewRenderer *)self _updateImageLayer:v7 withRenderResponse:v10];
    lastZoomRenderStatistics = self->_lastZoomRenderStatistics;
    self->_lastZoomRenderStatistics = v8;
  }
}

void __67__NUMediaViewRenderer__updateBackfillLayerWithLatestRenderResponse__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 136));
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;
}

- (void)_updateROILayerWithLatestRenderResponse
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  double v8 = __Block_byref_object_copy__477;
  id v9 = __Block_byref_object_dispose__478;
  id v10 = 0;
  renderQueue = self->_renderQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__NUMediaViewRenderer__updateROILayerWithLatestRenderResponse__block_invoke;
  v4[3] = &unk_2642C3060;
  v4[4] = self;
  void v4[5] = &v5;
  dispatch_sync(renderQueue, v4);
  if (v6[5]) {
    -[NUMediaViewRenderer _updateROILayerWithRenderResponse:](self, "_updateROILayerWithRenderResponse:");
  }
  _Block_object_dispose(&v5, 8);
}

void __62__NUMediaViewRenderer__updateROILayerWithLatestRenderResponse__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 128));
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0;
}

- (id)_videoFrameImageRenderResponseHandler
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__NUMediaViewRenderer__videoFrameImageRenderResponseHandler__block_invoke;
  v4[3] = &unk_2642C3038;
  v4[4] = self;
  uint64_t v2 = (void *)MEMORY[0x21D4593E0](v4, a2);

  return v2;
}

void __60__NUMediaViewRenderer__videoFrameImageRenderResponseHandler__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), a2);
  id v4 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__NUMediaViewRenderer__videoFrameImageRenderResponseHandler__block_invoke_2;
  block[3] = &unk_2642C2FC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__NUMediaViewRenderer__videoFrameImageRenderResponseHandler__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBackfillLayerWithLatestRenderResponse];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  [WeakRetained setVideoPlayerVisible:0 animated:1];
}

void __53__NUMediaViewRenderer__backfillRenderResponseHandler__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), a2);
  id v4 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NUMediaViewRenderer__backfillRenderResponseHandler__block_invoke_2;
  block[3] = &unk_2642C2FC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__NUMediaViewRenderer__backfillRenderResponseHandler__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackfillLayerWithLatestRenderResponse];
}

- (id)_zoomRenderResponseHandler
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__NUMediaViewRenderer__zoomRenderResponseHandler__block_invoke;
  v4[3] = &unk_2642C3038;
  v4[4] = self;
  uint64_t v2 = (void *)MEMORY[0x21D4593E0](v4, a2);

  return v2;
}

void __49__NUMediaViewRenderer__zoomRenderResponseHandler__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), a2);
  id v4 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NUMediaViewRenderer__zoomRenderResponseHandler__block_invoke_2;
  block[3] = &unk_2642C2FC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__NUMediaViewRenderer__zoomRenderResponseHandler__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateROILayerWithLatestRenderResponse];
}

- (void)_updateCoalescedBackfillRenderWithComposition:(id)a3
{
  id v4 = [(NUMediaViewRenderer *)self composition];
  id v9 = [(NUMediaViewRenderer *)self _backfillRenderRequestForComposition:v4];

  [v9 setName:@"NUMediaViewRenderer-backfill"];
  backfillClient = self->_backfillClient;
  int v6 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:2];
  [(NUSurfaceRenderClient *)backfillClient setPriority:v6];

  [v9 setIsOneShot:1];
  uint64_t v7 = self->_backfillClient;
  double v8 = [(NUMediaViewRenderer *)self _backfillRenderResponseHandler];
  [(NUSurfaceRenderClient *)v7 submitGenericRequest:v9 completion:v8];
}

- (void)_coalesceBackfillRenderForComposition:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  backfillUpdateCoalescer = self->_backfillUpdateCoalescer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__NUMediaViewRenderer__coalesceBackfillRenderForComposition___block_invoke;
  v7[3] = &unk_2642C3010;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(NUCoalescer *)backfillUpdateCoalescer coalesceBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__NUMediaViewRenderer__coalesceBackfillRenderForComposition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateCoalescedBackfillRenderWithComposition:*(void *)(a1 + 32)];
}

void __56__NUMediaViewRenderer__updateImageRenderForComposition___block_invoke_2(uint64_t a1)
{
}

- (id)_regionPolicyForZoomTargetRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(NUMediaViewRenderer *)self mediaView];
  id v9 = [v8 _renderView];
  id v10 = [v8 _scrollView];
  double v11 = -[NUViewport initWithSize:backingScaleFactor:]([NUViewport alloc], "initWithSize:backingScaleFactor:", width, height, self->_backingScale);
  -[NUViewport setPosition:](v11, "setPosition:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  objc_msgSend(v9, "convertRect:fromView:", v10, x, y, width, height);
  [v9 bounds];
  id v12 = [v9 _roiLayer];
  objc_msgSend(v12, "nu_contentsAreFlipped");
  NUCGRectConvertFromRectToRect();
  double v14 = v13;
  double v16 = v15;

  -[NUViewport setAnchorPoint:](v11, "setAnchorPoint:", v14, v16, 0, 0, 0x3FF0000000000000, 0x3FF0000000000000);
  uint64_t v17 = [[NUViewportRegionPolicy alloc] initWithViewport:v11];

  return v17;
}

- (BOOL)canUpdateDisplayHeadroom
{
  return ![(NUMediaViewRenderer *)self livePhotoViewIsScrubbing];
}

- (CGRect)convertRect:(CGRect)a3 toImageFromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_mediaView = &self->_mediaView;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_mediaView);
  double v11 = [WeakRetained _renderView];

  id v12 = [v11 _containerLayer];
  double v13 = [v9 layer];

  objc_msgSend(v12, "convertRect:fromLayer:", v13, x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromImageToView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  p_mediaView = &self->_mediaView;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_mediaView);
  id v9 = [WeakRetained _renderView];

  id v10 = [v9 _containerLayer];
  double v11 = [v7 layer];

  objc_msgSend(v10, "convertPoint:toLayer:", v11, x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toImageFromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  p_mediaView = &self->_mediaView;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_mediaView);
  id v9 = [WeakRetained _renderView];

  id v10 = [v9 _containerLayer];
  double v11 = [v7 layer];

  objc_msgSend(v10, "convertPoint:fromLayer:", v11, x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (BOOL)canRenderVideoLive
{
  int64_t v3 = [(NUMediaViewRenderer *)self playbackMode];
  BOOL v4 = !self->_canRenderLoopingVideoLive && v3 == 1;
  return !v4;
}

- (BOOL)isReady
{
  uint64_t v2 = [(NUMediaViewRenderer *)self mediaView];
  int64_t v3 = [v2 _renderView];
  BOOL v4 = [v3 _backfillLayer];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)pipelineFilersHaveChanged
{
  pipelineFilters = self->_pipelineFilters;
  if (pipelineFilters == self->_previousPipelineFilters) {
    return 0;
  }
  else {
    return !-[NSArray isEqualToArray:](pipelineFilters, "isEqualToArray:");
  }
}

- (void)setPipelineFilters:(id)a3
{
  pipelineFilters = self->_pipelineFilters;
  id v5 = a3;
  id v6 = (NSArray *)[(NSArray *)pipelineFilters copy];
  previousPipelineFilters = self->_previousPipelineFilters;
  self->_previousPipelineFilters = v6;

  id v8 = (NSArray *)[v5 copy];
  id v9 = self->_pipelineFilters;
  self->_pipelineFilters = v8;
}

- (void)wait
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  NUAbsoluteTime();
  double v4 = v3;
  renderGroup = self->_renderGroup;
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_group_wait(renderGroup, v6);
  NUAbsoluteTime();
  double v8 = v7;
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
  }
  id v9 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    double v11 = (v8 - v4) * 1000.0;
    _os_log_debug_impl(&dword_217C0A000, v9, OS_LOG_TYPE_DEBUG, "Waited for %0.1f ms", (uint8_t *)&v10, 0xCu);
  }
  [(NUMediaViewRenderer *)self _updateBackfillLayerWithLatestRenderResponse];
  [(NUMediaViewRenderer *)self _updateROILayerWithLatestRenderResponse];
}

- (void)_endAnimating
{
  self->_lastZoomRenderTime = 0.0;
  zoomClient = self->_zoomClient;
  double v4 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:0];
  [(NUSurfaceRenderClient *)zoomClient setPriority:v4];

  backfillClient = self->_backfillClient;
  id v6 = (id)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:1];
  [(NUSurfaceRenderClient *)backfillClient setPriority:v6];
}

- (void)_beginAnimating
{
  zoomClient = self->_zoomClient;
  double v4 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:2];
  [(NUSurfaceRenderClient *)zoomClient setPriority:v4];

  backfillClient = self->_backfillClient;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:3];
  [(NUSurfaceRenderClient *)backfillClient setPriority:v6];

  NUAbsoluteTime();
  self->_lastZoomRenderTime = v7;
}

- (void)endZooming
{
  self->_isZooming = 0;
  self->_lastZoomScale = 0.0;
}

- (void)beginZooming
{
  self->_isZooming = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  double v4 = [WeakRetained _scrollView];
  [v4 zoomScale];
  self->_lastZoomScale = v5;

  [(NUMediaViewRenderer *)self _beginAnimating];
}

- (void)endPanning
{
  self->_isPanning = 0;
}

- (void)beginPanning
{
  self->_isPanning = 1;
  [(NUMediaViewRenderer *)self _beginAnimating];
}

- (NUMediaViewRenderer)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  double v3 = (uint64_t *)MEMORY[0x263F586F0];
  if (*MEMORY[0x263F586F0] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    double v4 = (os_log_t *)MEMORY[0x263F586E8];
    double v5 = (void *)*MEMORY[0x263F586E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586E8], OS_LOG_TYPE_ERROR))
    {
      id v6 = NSString;
      double v7 = v5;
      double v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v10 = NSStringFromSelector(a2);
      double v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      double v26 = v11;
      _os_log_error_impl(&dword_217C0A000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_459);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          double v14 = (void *)MEMORY[0x263F08B88];
          double v15 = v13;
          double v16 = [v14 callStackSymbols];
          double v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          double v26 = v17;
          _os_log_error_impl(&dword_217C0A000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_459);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
      double v20 = (void *)MEMORY[0x263F08B88];
      id v21 = specific;
      double v15 = v18;
      double v22 = [v20 callStackSymbols];
      double v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v26 = specific;
      __int16 v27 = 2114;
      double v28 = v23;
      _os_log_error_impl(&dword_217C0A000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    double v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_459);
  }
}

+ (BOOL)_forceUpdateForNewVideoComposition:(id)a3 previousComposition:(id)a4 newAsset:(id)a5 previousAsset:(id)a6 isPlaying:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13 != v14 || !v11 && v12 || v11 && !v12)
  {
    LOBYTE(v15) = 1;
    goto LABEL_7;
  }
  if (!v11 || !v12)
  {
    if (a7)
    {
      LOBYTE(v15) = 0;
      goto LABEL_7;
    }
LABEL_18:
    int v15 = [MEMORY[0x263F586C0] compositionInstructions:v11 areEqualToCompositionInstructions:v12] ^ 1;
    goto LABEL_7;
  }
  [v11 renderSize];
  double v18 = v17;
  double v20 = v19;
  [v12 renderSize];
  LOBYTE(v15) = v20 != v22 || v18 != v21;
  if ((v15 & 1) == 0 && !a7) {
    goto LABEL_18;
  }
LABEL_7:

  return v15;
}

- (BOOL)_didReleaseAVObjects
{
  return self->_didReleaseAVObjects;
}

- (void)_releaseAVObjects
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(NUMediaViewRenderer *)self computedDisplayType] != 2)
  {
    double v7 = (uint64_t *)MEMORY[0x263F586F0];
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_459);
    }
    double v8 = (os_log_t *)MEMORY[0x263F586E8];
    id v9 = (void *)*MEMORY[0x263F586E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586E8], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = NSString;
      id v11 = v9;
      id v12 = [v10 stringWithFormat:@"_releaseAVObjects should only be called when displaying video"];
      int v27 = 138543362;
      double v28 = v12;
      _os_log_impl(&dword_217C0A000, v11, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&v27, 0xCu);

      uint64_t v13 = *v7;
      if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
      {
        if (v13 != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_459);
        }
LABEL_12:
        os_log_t v14 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          id specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
          double v16 = (void *)MEMORY[0x263F08B88];
          id v17 = specific;
          double v18 = v14;
          double v19 = [v16 callStackSymbols];
          double v20 = [v19 componentsJoinedByString:@"\n"];
          int v27 = 138543618;
          double v28 = specific;
          __int16 v29 = 2114;
          double v30 = v20;
          _os_log_error_impl(&dword_217C0A000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v27, 0x16u);

LABEL_25:
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      if (v13 != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_459);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
    {
      goto LABEL_12;
    }
    os_log_t v21 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      double v24 = (void *)MEMORY[0x263F08B88];
      double v18 = v21;
      double v25 = [v24 callStackSymbols];
      double v26 = [v25 componentsJoinedByString:@"\n"];
      int v27 = 138543362;
      double v28 = v26;
      _os_log_error_impl(&dword_217C0A000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v27, 0xCu);

      goto LABEL_25;
    }
LABEL_17:
    _NUAssertContinueHandler();
    return;
  }
  if (!self->_didReleaseAVObjects)
  {
    self->_didReleaseAVObjects = 1;
    double v3 = [(NUMediaViewRenderer *)self mediaView];
    double v4 = [v3 _videoPlayerView];
    double v5 = [v4 snapshotViewAfterScreenUpdates:0];
    if (v5)
    {
      id v6 = [v3 _renderView];
      [v6 addSubview:v5];

      [(NUMediaViewRenderer *)self _addFullExtentConstraintsForView:v5];
    }
    else
    {
      if (*MEMORY[0x263F586F0] != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_461);
      }
      double v22 = *MEMORY[0x263F58700];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        _os_log_error_impl(&dword_217C0A000, v22, OS_LOG_TYPE_ERROR, "NUMediaViewRenderer: failed to create snapshot for videoView", (uint8_t *)&v27, 2u);
      }
    }
    [(NUMediaViewRenderer *)self _tearDownAVPlayerController];
    [v3 _rendererDidCreateAVPlayerController:0];
    [(NUVideoRenderClient *)self->_videoClient cancel];
    videoClient = self->_videoClient;
    self->_videoClient = 0;
  }
}

- (void)_withComposition:(id)a3 visitRenderClient:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, NUSurfaceRenderClient *, void *, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  double v8 = [WeakRetained _renderView];
  if (v8)
  {
    if ([(NUMediaViewRenderer *)self isZoomedToFit])
    {
      id v9 = [(NUMediaViewRenderer *)self _backfillRenderRequestForComposition:v12];
      backfillClient = self->_backfillClient;
      [(NUMediaViewRenderer *)self _backfillRenderResponseHandler];
    }
    else
    {
      id v9 = [(NUMediaViewRenderer *)self _zoomRenderRequestForComposition:v12];
      backfillClient = self->_zoomClient;
      [(NUMediaViewRenderer *)self _zoomRenderResponseHandler];
    id v11 = };
    v6[2](v6, backfillClient, v9, v11);
  }
}

@end