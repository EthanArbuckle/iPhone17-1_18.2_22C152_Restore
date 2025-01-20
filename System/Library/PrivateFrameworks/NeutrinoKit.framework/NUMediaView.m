@interface NUMediaView
+ (UIEdgeInsets)_proposedInsetsForInsets:(UIEdgeInsets)a3 contentSize:(CGSize)a4 inFrame:(CGRect)a5 centerContent:(BOOL)a6;
+ (double)currentEDRHeadroomForScreen:(id)a3;
+ (double)maximumEDRHeadroomForScreen:(id)a3;
- (BOOL)_didReleaseAVObjects;
- (BOOL)alwaysBounceScrollView;
- (BOOL)centerContent;
- (BOOL)isDebugEnabled;
- (BOOL)isHDREnabled;
- (BOOL)isMuted;
- (BOOL)isReady;
- (BOOL)isScrollEnabled;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPlayerVisible;
- (BOOL)loopsVideoPlayback;
- (BOOL)scrollEnabled;
- (BOOL)scrollUpdatesSuppressed;
- (CGPoint)convertPoint:(CGPoint)a3 fromSpace:(id)a4 toView:(id)a5;
- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4 toSpace:(id)a5;
- (CGPoint)convertPoint:(CGPoint)a3 toNormalizedYDownSourceSpaceFromView:(id)a4;
- (CGPoint)convertPointFromImage:(CGPoint)a3;
- (CGPoint)convertPointToImage:(CGPoint)a3;
- (CGRect)convertNormalizedViewRect:(CGRect)a3 fromSpace:(id)a4;
- (CGRect)convertRectFromImage:(CGRect)a3;
- (CGRect)convertRectToImage:(CGRect)a3;
- (CGRect)convertViewRect:(CGRect)a3 fromSpace:(id)a4;
- (CGRect)cropRect;
- (CGRect)imageFrame;
- (CGSize)_imageSize;
- (CGSize)_masterSizeWithoutGeometry;
- (NSArray)pipelineFilters;
- (NSLayoutXAxisAnchor)imageLeftAnchor;
- (NSLayoutXAxisAnchor)imageRightAnchor;
- (NSLayoutYAxisAnchor)imageBottomAnchor;
- (NSLayoutYAxisAnchor)imageTopAnchor;
- (NUComposition)composition;
- (NUMediaPlayer)player;
- (NUMediaView)initWithCoder:(id)a3;
- (NUMediaView)initWithFrame:(CGRect)a3;
- (NUMediaViewDelegate)delegate;
- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 inFrame:(CGRect)a4;
- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 inFrame:(CGRect)a4 alwaysCenterContent:(BOOL)a5;
- (UIEdgeInsets)edgeInsets;
- (double)angle;
- (double)maximumZoomScale;
- (double)minimumZoomScale;
- (double)zoomScale;
- (id)_geometry;
- (id)_imageLayer;
- (id)_layerRecursiveDescription;
- (id)_livePhotoView;
- (id)_renderView;
- (id)_renderer;
- (id)_scrollView;
- (id)_videoPlayerController;
- (id)_videoPlayerView;
- (id)_visibleImageRectOverlayView;
- (id)snapshotImage;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)_beginTransition;
- (void)_endTransition;
- (void)_invalidateDisplayEDRHeadroomMonitor;
- (void)_livephotoPlaybackDidEnd;
- (void)_livephotoPlaybackWillBegin;
- (void)_monitorDisplayEDRHeadroom:(id)a3;
- (void)_releaseAVObjects;
- (void)_rendererDidCreateAVPlayerController:(id)a3;
- (void)_rendererDidFinishPreparingVideo;
- (void)_rendererDidFinishWithStatistics:(id)a3;
- (void)_rendererDidStartPreparingVideo;
- (void)_rendererDidUpdateLivePhoto;
- (void)_scheduleDisplayEDRHeadroomMonitor;
- (void)_setLayerFilters:(id)a3;
- (void)_setPipelineFilters:(id)a3 shouldUpdateContent:(BOOL)a4;
- (void)_setupViews;
- (void)_startVideoPlayback;
- (void)_stopVideoPlayback;
- (void)_transitionToInsets:(UIEdgeInsets)a3 duration:(double)a4 animationCurve:(int64_t)a5 updateRenderContent:(BOOL)a6;
- (void)_updateContentInsets;
- (void)_updateRenderContent;
- (void)_updateScreenSpaceOverlay;
- (void)_updateVideoPlayerAlpha:(BOOL)a3;
- (void)_updateVisibleImageOverlayView;
- (void)_withComposition:(id)a3 visitRenderClient:(id)a4;
- (void)didMoveToWindow;
- (void)installRenderingCompletionBlock:(id)a3;
- (void)layoutSubviews;
- (void)playerController:(id)a3 didUpdateElapsedTime:(double)a4 duration:(double)a5;
- (void)playerControllerDidFinishPlaying:(id)a3 duration:(double)a4;
- (void)playerControllerFailedToPlayToEnd:(id)a3 error:(id)a4;
- (void)playerControllerIsReadyForPlayback:(id)a3;
- (void)playerViewReadyForDisplayDidChange:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setAlwaysBounceScrollView:(BOOL)a3;
- (void)setAngle:(double)a3;
- (void)setCenterContent:(BOOL)a3;
- (void)setComposition:(id)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setDebugEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setHdrEnabled:(BOOL)a3;
- (void)setLoopsVideoPlayback:(BOOL)a3;
- (void)setMaximumZoomScale:(double)a3;
- (void)setMinimumZoomScale:(double)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPipelineFilters:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setScrollUpdatesSuppressed:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setVideoPlayerVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setZoomScale:(double)a3;
- (void)setZoomScale:(double)a3 animated:(BOOL)a4;
- (void)setZoomScaleToFit;
- (void)set_masterSizeWithoutGeometry:(CGSize)a3;
- (void)waitForRender;
- (void)willMoveToWindow:(id)a3;
- (void)zoomToRect:(CGRect)a3 animated:(BOOL)a4;
@end

@implementation NUMediaView

- (CGRect)imageFrame
{
  v3 = [(NUMediaView *)self _geometry];
  [v3 size];

  renderer = self->_renderer;
  NUPixelSizeToCGRect();

  -[NUMediaViewRenderer convertRect:fromImageToView:](renderer, "convertRect:fromImageToView:", self);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)_geometry
{
  return [(NURenderView *)self->_renderView geometry];
}

- (id)_renderView
{
  return self->_renderView;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (![(NUMediaView *)self loopsVideoPlayback]
    && ![(NUMediaView *)self isVideoPlayerVisible]
    && !self->_scrollUpdatesSuppressed)
  {
    [(NUMediaView *)self _updateRenderContent];
  }
  [(NUMediaView *)self _updateScreenSpaceOverlay];
  [(NUMediaView *)self _updateVisibleImageOverlayView];
  if (self->_delegateFlags.hasDidScroll)
  {
    id v4 = [(NUMediaView *)self delegate];
    [v4 mediaViewDidScroll:self];
  }
}

- (BOOL)loopsVideoPlayback
{
  v2 = [(NUMediaView *)self player];
  uint64_t v3 = [v2 playbackMode];

  return v3 == 1;
}

- (NUMediaPlayer)player
{
  return (NUMediaPlayer *)self->_renderer;
}

- (void)_updateRenderContent
{
  if (!self->_transitionCount)
  {
    uint64_t v3 = [(NUMediaView *)self composition];

    if (v3)
    {
      id v4 = [(NUMediaView *)self window];
      if (v4)
      {
      }
      else if (![(NUMediaView *)self loopsVideoPlayback])
      {
        return;
      }
      renderer = self->_renderer;
      id v6 = [(NUMediaView *)self composition];
      [(NUMediaViewRenderer *)renderer updateComposition:v6];
    }
  }
}

- (NUComposition)composition
{
  return [(NUMediaViewRenderer *)self->_renderer composition];
}

- (BOOL)isVideoPlayerVisible
{
  return self->_videoPlayerVisible;
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (void)_rendererDidFinishWithStatistics:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NURenderView *)self->_renderView frame];
  double v6 = v5;
  double v8 = v7;
  v9 = (void *)MEMORY[0x263F586F0];
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
  }
  v10 = (os_log_t *)MEMORY[0x263F58700];
  v11 = (void *)*MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    v26 = v11;
    v37.CGFloat width = v6;
    v37.CGFloat height = v8;
    v27 = NSStringFromCGSize(v37);
    int v32 = 136315394;
    v33 = "-[NUMediaView _rendererDidFinishWithStatistics:]";
    __int16 v34 = 2112;
    v35 = v27;
    _os_log_debug_impl(&dword_217C0A000, v26, OS_LOG_TYPE_DEBUG, "%s - setting scroll view content size: %@", (uint8_t *)&v32, 0x16u);

    if (*v9 != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
    }
  }
  os_log_t v12 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
  {
    CGFloat width = self->_transitionTargetSize.width;
    CGFloat height = self->_transitionTargetSize.height;
    v30 = v12;
    v38.CGFloat width = width;
    v38.CGFloat height = height;
    v31 = NSStringFromCGSize(v38);
    int v32 = 136315394;
    v33 = "-[NUMediaView _rendererDidFinishWithStatistics:]";
    __int16 v34 = 2112;
    v35 = v31;
    _os_log_debug_impl(&dword_217C0A000, v30, OS_LOG_TYPE_DEBUG, "%s - transitionTargetSize:%@", (uint8_t *)&v32, 0x16u);
  }
  double v13 = self->_transitionTargetSize.width;
  double v14 = self->_transitionTargetSize.height;
  v15 = (CGSize *)MEMORY[0x263F001B0];
  BOOL v16 = v13 == *MEMORY[0x263F001B0] && v14 == *(double *)(MEMORY[0x263F001B0] + 8);
  double v17 = vabdd_f64(v6, v13);
  BOOL v18 = v16 || v17 > 2.0;
  double v19 = vabdd_f64(v8, v14);
  if (!v18 && v19 <= 2.0)
  {
    [(NURenderView *)self->_renderView renderFrameReachedTargetSize];
    self->_transitionTargetSize = *v15;
  }
  -[NUScrollView setContentSize:](self->_scrollView, "setContentSize:", v6, v8);
  [(NUMediaView *)self _updateContentInsets];
  v21 = [(NUMediaView *)self delegate];
  v22 = v21;
  if (self->_delegateFlags.hasDidFinishRenderingWithStatistics)
  {
    [v21 mediaViewDidFinishRendering:self withStatistics:v4];
  }
  else if (self->_delegateFlags.hasDidFinishRendering)
  {
    [v21 mediaViewDidFinishRendering:self];
  }
  id renderingCompletionBlock = self->_renderingCompletionBlock;
  if (renderingCompletionBlock)
  {
    v24 = (void (**)(void))[renderingCompletionBlock copy];
    v24[2]();
    id v25 = self->_renderingCompletionBlock;
    self->_id renderingCompletionBlock = 0;
  }
  [(NUMediaView *)self _updateScreenSpaceOverlay];
  [(NUMediaView *)self _updateVisibleImageOverlayView];
}

- (void)_updateContentInsets
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [(NUScrollView *)self->_scrollView frame];
  [(NUScrollView *)self->_scrollView contentSize];
  -[NUMediaView _edgeInsetsForContentSize:inFrame:](self, "_edgeInsetsForContentSize:inFrame:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NUScrollView *)self->_scrollView contentInset];
  BOOL v17 = v14 == v6 && v11 == v4 && v13 == v10 && v12 == v8;
  if (!v17
    && !self->_transitionCount
    && self->_transitionTargetSize.width == *MEMORY[0x263F001B0]
    && self->_transitionTargetSize.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
    }
    double v19 = (void *)*MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      scrollView = self->_scrollView;
      v21 = v19;
      v38.double top = v4;
      v38.double left = v6;
      v38.double bottom = v8;
      v38.double right = v10;
      v22 = NSStringFromUIEdgeInsets(v38);
      [(NUScrollView *)self->_scrollView contentSize];
      v23 = NSStringFromCGSize(v37);
      v24 = NSStringFromUIEdgeInsets(self->_edgeInsets);
      BOOL centerContent = self->_centerContent;
      int v26 = 134219010;
      v27 = scrollView;
      __int16 v28 = 2112;
      v29 = v22;
      __int16 v30 = 2112;
      v31 = v23;
      __int16 v32 = 2112;
      v33 = v24;
      __int16 v34 = 1024;
      BOOL v35 = centerContent;
      _os_log_debug_impl(&dword_217C0A000, v21, OS_LOG_TYPE_DEBUG, "-[NUMediaView _updateContentInsets] on scrollview %p %@, content size = %@; internal edge insets: %@; center content: %d",
        (uint8_t *)&v26,
        0x30u);
    }
    -[NUScrollView setContentInset:](self->_scrollView, "setContentInset:", v4, v6, v8, v10);
  }
}

- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 inFrame:(CGRect)a4 alwaysCenterContent:(BOOL)a5
{
  BOOL v5 = a5 || self->_centerContent;
  objc_msgSend((id)objc_opt_class(), "_proposedInsetsForInsets:contentSize:inFrame:centerContent:", v5, self->_edgeInsets.top, self->_edgeInsets.left, self->_edgeInsets.bottom, self->_edgeInsets.right, a3.width, a3.height, *(void *)&a4.origin.x, *(void *)&a4.origin.y, *(void *)&a4.size.width, *(void *)&a4.size.height);
  result.double right = v9;
  result.double bottom = v8;
  result.double left = v7;
  result.double top = v6;
  return result;
}

+ (UIEdgeInsets)_proposedInsetsForInsets:(UIEdgeInsets)a3 contentSize:(CGSize)a4 inFrame:(CGRect)a5 centerContent:(BOOL)a6
{
  CGFloat right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (CGRectIsEmpty(a5))
  {
    double top = *MEMORY[0x263F1D1C0];
    double left = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double bottom = *(double *)(MEMORY[0x263F1D1C0] + 16);
    CGFloat right = *(double *)(MEMORY[0x263F1D1C0] + 24);
    goto LABEL_28;
  }
  if (a6)
  {
    double v36 = right;
    double MinX = CGRectGetMinX(a5);
    double v34 = MinX + (CGRectGetWidth(a5) - a4.width) * 0.5;
    double MinY = CGRectGetMinY(a5);
    CGFloat Height = CGRectGetHeight(a5);
    double v14 = fmax(v34, 0.0);
    double v15 = fmax(MinY + (Height - a4.height) * 0.5, 0.0);
    double v16 = v15 + v15 - bottom;
    if (bottom > v15) {
      double v17 = bottom;
    }
    else {
      double v17 = v15;
    }
    if (bottom <= v15) {
      double v16 = v15;
    }
    if (top > v15) {
      double v18 = v15 + v15 - top;
    }
    else {
      double v18 = v17;
    }
    if (top > v15) {
      double v19 = top;
    }
    else {
      double v19 = v16;
    }
    CGFloat v33 = v18;
    CGFloat v35 = v19;
    if (left <= v14)
    {
      CGFloat v20 = v36;
      if (v36 <= v14)
      {
        double v32 = v14;
      }
      else
      {
        double v32 = v14 + v14 - v36;
        double v14 = v36;
      }
    }
    else
    {
      double v14 = v14 + v14 - left;
      double v32 = left;
      CGFloat v20 = v36;
    }
    CGFloat v37 = v14;
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
    }
    v24 = (void *)*MEMORY[0x263F58700];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      double top = v35;
      CGFloat right = v37;
      double left = v32;
      double bottom = v33;
      goto LABEL_28;
    }
    v22 = v24;
    v49.double top = top;
    v49.double left = left;
    v49.double bottom = bottom;
    v49.CGFloat right = v20;
    v23 = NSStringFromUIEdgeInsets(v49);
    v29 = NSStringFromCGSize(a4);
    __int16 v30 = NSStringFromCGRect(a5);
    double bottom = v33;
    double top = v35;
    v50.double top = v35;
    double left = v32;
    v50.double left = v32;
    v50.double bottom = v33;
    CGFloat right = v37;
    v50.CGFloat right = v37;
    v31 = NSStringFromUIEdgeInsets(v50);
    *(_DWORD *)buf = 138413058;
    v40 = v23;
    __int16 v41 = 2112;
    v42 = v29;
    __int16 v43 = 2112;
    v44 = v30;
    __int16 v45 = 2112;
    v46 = v31;
    _os_log_debug_impl(&dword_217C0A000, v22, OS_LOG_TYPE_DEBUG, "+[NUMediaView _proposedInsetsForInsets:contentSize:inFrame:centerContent:] - content is centered. input insets: %@  content size: %@ inFrame: %@ result insets: %@", buf, 0x2Au);

LABEL_30:
    goto LABEL_28;
  }
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
  }
  v21 = (void *)*MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    v22 = v21;
    v48.double top = top;
    v48.double left = left;
    v48.double bottom = bottom;
    v48.CGFloat right = right;
    v23 = NSStringFromUIEdgeInsets(v48);
    *(_DWORD *)buf = 138412290;
    v40 = v23;
    _os_log_debug_impl(&dword_217C0A000, v22, OS_LOG_TYPE_DEBUG, "+[NUMediaView _proposedInsetsForInsets:contentSize:inFrame:centerContent:] - content is not centered, so returning input insets: %@", buf, 0xCu);
    goto LABEL_30;
  }
LABEL_28:
  double v25 = top;
  double v26 = left;
  double v27 = bottom;
  double v28 = right;
  result.CGFloat right = v28;
  result.double bottom = v27;
  result.double left = v26;
  result.double top = v25;
  return result;
}

- (id)_livePhotoView
{
  if (!self->_livePhotoView && ([MEMORY[0x263F58620] mediaViewDisableLivePhoto] & 1) == 0)
  {
    double v3 = (UIView *)objc_msgSend(objc_alloc(NSClassFromString(&cfstr_Phlivephotovie.isa)), "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    livePhotoView = self->_livePhotoView;
    self->_livePhotoView = v3;

    if ([MEMORY[0x263F58620] isViewDebugEnabled])
    {
      BOOL v5 = [(UIView *)self->_livePhotoView layer];
      id v6 = [MEMORY[0x263F1C550] redColor];
      objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

      double v7 = [(UIView *)self->_livePhotoView layer];
      [v7 setBorderWidth:8.0];
    }
  }
  double v8 = self->_livePhotoView;

  return v8;
}

- (void)setScrollUpdatesSuppressed:(BOOL)a3
{
  self->_scrollUpdatesSuppressed = a3;
}

- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 inFrame:(CGRect)a4
{
  -[NUMediaView _edgeInsetsForContentSize:inFrame:alwaysCenterContent:](self, "_edgeInsetsForContentSize:inFrame:alwaysCenterContent:", 0, a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.CGFloat right = v7;
  result.double bottom = v6;
  result.double left = v5;
  result.double top = v4;
  return result;
}

- (NUMediaViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUMediaViewDelegate *)WeakRetained;
}

- (void)setComposition:(id)a3
{
  id v7 = a3;
  if ([v7 mediaType] == 2)
  {
    double v4 = [(NUMediaViewRenderer *)self->_renderer composition];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  [(NUMediaViewRenderer *)self->_renderer setComposition:v7];
  double v6 = [(NUMediaView *)self window];

  if (v6)
  {
    if (v5) {
      [(PFCoalescer *)self->_renderCoalescer update];
    }
    else {
      [(NUMediaView *)self _updateRenderContent];
    }
  }
}

- (void)_stopVideoPlayback
{
  id v2 = [(NUMediaView *)self player];
  [v2 pause];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NUMediaView;
  [(NUMediaView *)&v3 layoutSubviews];
  [(NUMediaView *)self frame];
  if (!CGRectIsEmpty(v4)) {
    [(NUMediaView *)self _updateContentInsets];
  }
}

- (void)didMoveToWindow
{
  v14.receiver = self;
  v14.super_class = (Class)NUMediaView;
  [(NUMediaView *)&v14 didMoveToWindow];
  objc_super v3 = [(NUMediaView *)self window];

  if (v3)
  {
    CGRect v4 = [(NUMediaView *)self window];
    BOOL v5 = [v4 screen];

    renderer = self->_renderer;
    [v5 scale];
    -[NUMediaViewRenderer setBackingScale:](renderer, "setBackingScale:");
    id v7 = [MEMORY[0x263F58668] currentPlatform];
    double v8 = [v5 _displayID];
    double v9 = [v7 displayWithIdentifier:v8];

    double v10 = self->_renderer;
    double v11 = [v9 pixelFormat];
    [(NUMediaViewRenderer *)v10 setPixelFormat:v11];

    double v12 = self->_renderer;
    double v13 = [v9 colorSpace];
    [(NUMediaViewRenderer *)v12 setColorSpace:v13];

    if ([(NUMediaView *)self isHDREnabled])
    {
      +[NUMediaView maximumEDRHeadroomForScreen:v5];
      -[NUMediaViewRenderer setDisplayMaximumEDRHeadroom:](self->_renderer, "setDisplayMaximumEDRHeadroom:");
      +[NUMediaView currentEDRHeadroomForScreen:v5];
      -[NUMediaViewRenderer setDisplayCurrentEDRHeadroom:](self->_renderer, "setDisplayCurrentEDRHeadroom:");
      [(NUMediaView *)self _scheduleDisplayEDRHeadroomMonitor];
    }
    [(NUMediaView *)self _updateRenderContent];
  }
}

- (void)_beginTransition
{
}

- (NUMediaView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NUMediaView;
  objc_super v3 = -[NUMediaView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGRect v4 = v3;
  if (v3) {
    [(NUMediaView *)v3 _setupViews];
  }
  return v4;
}

- (void)_setupViews
{
  [MEMORY[0x263F58620] isViewDebugEnabled];
  objc_super v3 = (NURenderView *)objc_opt_new();
  renderView = self->_renderView;
  self->_renderView = v3;

  BOOL v5 = (NUScrollView *)objc_opt_new();
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  self->_BOOL centerContent = 1;
  self->_alwaysBounceScrollView = 1;
  id v7 = [[NUMediaViewRenderer alloc] initWithMediaView:self];
  renderer = self->_renderer;
  self->_renderer = v7;

  [(NUScrollView *)self->_scrollView setAutoresizingMask:18];
  [(NUScrollView *)self->_scrollView setDelegate:self];
  [(NUScrollView *)self->_scrollView setScrollEnabled:1];
  [(NUScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(NUScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(NUScrollView *)self->_scrollView setAlwaysBounceVertical:self->_alwaysBounceScrollView];
  [(NUScrollView *)self->_scrollView setAlwaysBounceHorizontal:self->_alwaysBounceScrollView];
  [(NUScrollView *)self->_scrollView setClipsToBounds:0];
  [(NUScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
  double v9 = self->_scrollView;
  [(NUMediaView *)self bounds];
  -[NUScrollView setFrame:](v9, "setFrame:");
  [(NUScrollView *)self->_scrollView setMinimumZoomScale:1.0];
  [(NUScrollView *)self->_scrollView setZoomScale:1.0];
  if ([MEMORY[0x263F58620] isViewDebugEnabled])
  {
    double v10 = [(NUScrollView *)self->_scrollView layer];
    [v10 setBorderWidth:4.0];

    double v11 = [(NUScrollView *)self->_scrollView layer];
    id v12 = [MEMORY[0x263F1C550] whiteColor];
    objc_msgSend(v11, "setBorderColor:", objc_msgSend(v12, "CGColor"));

    double v13 = [(NUMediaView *)self layer];
    [v13 setBorderWidth:1.0];

    objc_super v14 = [(NUMediaView *)self layer];
    id v15 = [MEMORY[0x263F1C550] greenColor];
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));
  }
  [(NUMediaView *)self addSubview:self->_scrollView];
  [(NUMediaView *)self setNeedsLayout];
  [(NURenderView *)self->_renderView setUserInteractionEnabled:1];
  [(NUScrollView *)self->_scrollView addSubview:self->_renderView];
  double v16 = (_NUMediaScreenSpaceOverlayView *)objc_opt_new();
  screenSpaceOverlayView = self->_screenSpaceOverlayView;
  self->_screenSpaceOverlayView = v16;

  [(NUMediaView *)self addSubview:self->_screenSpaceOverlayView];
  [(_NUMediaScreenSpaceOverlayView *)self->_screenSpaceOverlayView setUserInteractionEnabled:0];
  double v18 = [(_NUMediaScreenSpaceOverlayView *)self->_screenSpaceOverlayView topAnchor];
  imageTopAnchor = self->_imageTopAnchor;
  self->_imageTopAnchor = v18;

  CGFloat v20 = [(_NUMediaScreenSpaceOverlayView *)self->_screenSpaceOverlayView bottomAnchor];
  imageBottomAnchor = self->_imageBottomAnchor;
  self->_imageBottomAnchor = v20;

  v22 = [(_NUMediaScreenSpaceOverlayView *)self->_screenSpaceOverlayView leftAnchor];
  imageLeftAnchor = self->_imageLeftAnchor;
  self->_imageLeftAnchor = v22;

  v24 = [(_NUMediaScreenSpaceOverlayView *)self->_screenSpaceOverlayView rightAnchor];
  imageRightAnchor = self->_imageRightAnchor;
  self->_imageRightAnchor = v24;

  double v26 = (_NUMediaVisibleImageOverlayView *)objc_opt_new();
  visibleImageOverlayView = self->_visibleImageOverlayView;
  self->_visibleImageOverlayView = v26;

  [(NUMediaView *)self addSubview:self->_visibleImageOverlayView];
  [(_NUMediaVisibleImageOverlayView *)self->_visibleImageOverlayView setUserInteractionEnabled:0];
  self->_renderCoalescer = [MEMORY[0x263F5D538] coalescerWithLabel:@"NUMediaViewRenderer._renderCoalescer" target:self queue:MEMORY[0x263EF83A0] action:&__block_literal_global_84];

  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRightAnchor, 0);
  objc_storeStrong((id *)&self->_imageLeftAnchor, 0);
  objc_storeStrong((id *)&self->_imageBottomAnchor, 0);
  objc_storeStrong((id *)&self->_imageTopAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayEDRMonitorLink, 0);
  objc_storeStrong((id *)&self->_displayEDRMonitorTimer, 0);
  objc_storeStrong(&self->_renderingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_renderCoalescer, 0);
  objc_storeStrong((id *)&self->_visibleImageOverlayView, 0);
  objc_storeStrong((id *)&self->_screenSpaceOverlayView, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_nuAVPlayerController, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_renderView, 0);
}

- (BOOL)scrollUpdatesSuppressed
{
  return self->_scrollUpdatesSuppressed;
}

- (void)setHdrEnabled:(BOOL)a3
{
  self->_hdrEnabled = a3;
}

- (BOOL)isHDREnabled
{
  return self->_hdrEnabled;
}

- (void)setDebugEnabled:(BOOL)a3
{
  self->_debugEnabled = a3;
}

- (BOOL)isDebugEnabled
{
  return self->_debugEnabled;
}

- (BOOL)centerContent
{
  return self->_centerContent;
}

- (double)angle
{
  return self->_angle;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_masterSizeWithoutGeometry:(CGSize)a3
{
  self->__masterSizeWithoutGeometrdouble y = a3;
}

- (CGSize)_masterSizeWithoutGeometry
{
  double width = self->__masterSizeWithoutGeometry.width;
  double height = self->__masterSizeWithoutGeometry.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSLayoutXAxisAnchor)imageRightAnchor
{
  return self->_imageRightAnchor;
}

- (NSLayoutXAxisAnchor)imageLeftAnchor
{
  return self->_imageLeftAnchor;
}

- (NSLayoutYAxisAnchor)imageBottomAnchor
{
  return self->_imageBottomAnchor;
}

- (NSLayoutYAxisAnchor)imageTopAnchor
{
  return self->_imageTopAnchor;
}

- (BOOL)isScrollEnabled
{
  return self->_scrollEnabled;
}

- (BOOL)alwaysBounceScrollView
{
  return self->_alwaysBounceScrollView;
}

- (void)playerControllerIsReadyForPlayback:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_delegateFlags.hasIsReadyForVideoPlayback)
  {
    BOOL v5 = [(NUMediaView *)self delegate];
    [v5 mediaViewIsReadyForVideoPlayback:self];
  }
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
  }
  objc_super v6 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134217984;
    id v8 = v4;
    _os_log_debug_impl(&dword_217C0A000, v6, OS_LOG_TYPE_DEBUG, "<controller: %p> ", (uint8_t *)&v7, 0xCu);
  }
}

- (void)playerControllerFailedToPlayToEnd:(id)a3 error:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_delegateFlags.hasFailedToPlayToEnd)
  {
    id v8 = [(NUMediaView *)self delegate];
    [v8 mediaViewFailedToPlayToEnd:self error:v7];
  }
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
  }
  uint64_t v9 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218242;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_debug_impl(&dword_217C0A000, v9, OS_LOG_TYPE_DEBUG, "<controller: %p> failed to play to end: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)playerController:(id)a3 didUpdateElapsedTime:(double)a4 duration:(double)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
  }
  id v8 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218496;
    id v10 = v7;
    __int16 v11 = 2048;
    double v12 = a4;
    __int16 v13 = 2048;
    double v14 = a5;
    _os_log_debug_impl(&dword_217C0A000, v8, OS_LOG_TYPE_DEBUG, "<controller: %p> %g %g", (uint8_t *)&v9, 0x20u);
  }
}

- (void)playerControllerDidFinishPlaying:(id)a3 duration:(double)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_delegateFlags.hasDidPlayToEnd)
  {
    id v7 = [(NUMediaView *)self delegate];
    [v7 mediaViewDidPlayToEnd:self];
  }
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
  }
  id v8 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218240;
    id v10 = v6;
    __int16 v11 = 2048;
    double v12 = a4;
    _os_log_debug_impl(&dword_217C0A000, v8, OS_LOG_TYPE_DEBUG, "<controller: %p> %g", (uint8_t *)&v9, 0x16u);
  }
}

- (void)playerViewReadyForDisplayDidChange:(id)a3
{
}

- (BOOL)_didReleaseAVObjects
{
  return [(NUMediaViewRenderer *)self->_renderer _didReleaseAVObjects];
}

- (void)_releaseAVObjects
{
}

- (id)snapshotImage
{
  id v2 = [(NURenderView *)self->_renderView _backfillLayer];
  objc_super v3 = [v2 snapshotImage];

  return v3;
}

- (id)_layerRecursiveDescription
{
  id v2 = [(NUMediaView *)self layer];
  objc_super v3 = objc_msgSend(v2, "nu_layerRecursiveDescription");

  return v3;
}

- (void)_updateVideoPlayerAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NUMediaView *)self isVideoPlayerVisible];
  if ((v5 & [(NUAVPlayerView *)self->_playerView isReadyForDisplay]) != 0) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  [(NUAVPlayerView *)self->_playerView alpha];
  if (v6 != v7)
  {
    if (v3)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __39__NUMediaView__updateVideoPlayerAlpha___block_invoke;
      v9[3] = &unk_2642C2E80;
      v9[4] = self;
      *(double *)&v9[5] = v6;
      [MEMORY[0x263F1CB60] animateWithDuration:v9 animations:0.5];
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __39__NUMediaView__updateVideoPlayerAlpha___block_invoke_2;
      v8[3] = &unk_2642C2E80;
      v8[4] = self;
      *(double *)&v8[5] = v6;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v8];
    }
  }
}

uint64_t __39__NUMediaView__updateVideoPlayerAlpha___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __39__NUMediaView__updateVideoPlayerAlpha___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:*(double *)(a1 + 40)];
}

- (BOOL)isVideoEnabled
{
  return [(NUMediaViewRenderer *)self->_renderer isVideoEnabled];
}

- (void)setVideoEnabled:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_withComposition:(id)a3 visitRenderClient:(id)a4
{
}

- (void)_setPipelineFilters:(id)a3 shouldUpdateContent:(BOOL)a4
{
  BOOL v4 = a4;
  [(NUMediaViewRenderer *)self->_renderer setPipelineFilters:a3];
  if (v4)
  {
    [(NUMediaView *)self _updateRenderContent];
  }
}

- (NSArray)pipelineFilters
{
  return [(NUMediaViewRenderer *)self->_renderer pipelineFilters];
}

- (void)setPipelineFilters:(id)a3
{
}

- (void)_setLayerFilters:(id)a3
{
  renderView = self->_renderView;
  id v5 = a3;
  double v6 = [(NURenderView *)renderView _backfillLayer];
  [v6 setFilters:v5];

  id v7 = [(NURenderView *)self->_renderView _roiLayer];
  [v7 setFilters:v5];
}

- (id)_renderer
{
  return self->_renderer;
}

- (void)setVideoPlayerVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_videoPlayerVisible != a3)
  {
    self->_videoPlayerVisible = a3;
    self->_lastVideoPlayerVisibilityChangeWasAnimated = a4;
    [(NUMediaView *)self _updateVideoPlayerAlpha:a4];
  }
}

- (void)_startVideoPlayback
{
  id v2 = [(NUMediaView *)self player];
  [v2 play];
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NUMediaView *)self player];
  [v4 setMuted:v3];
}

- (BOOL)isMuted
{
  id v2 = [(NUMediaView *)self player];
  char v3 = [v2 isMuted];

  return v3;
}

- (void)setLoopsVideoPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NUMediaView *)self player];
  [v4 setPlaybackMode:v3];
}

- (void)_livephotoPlaybackDidEnd
{
  if (self->_delegateFlags.hasDidEndLivePhotoPlayback)
  {
    id v3 = [(NUMediaView *)self delegate];
    [v3 mediaViewDidEndLivePhotoPlayback:self];
  }
}

- (void)_livephotoPlaybackWillBegin
{
  if (self->_delegateFlags.hasWillBeginLivePhotoPlayback)
  {
    id v3 = [(NUMediaView *)self delegate];
    [v3 mediaViewWillBeginLivePhotoPlayback:self];
  }
}

- (void)_rendererDidFinishPreparingVideo
{
  if (self->_delegateFlags.hasDidFinishPreparingVideo)
  {
    id v3 = [(NUMediaView *)self delegate];
    [v3 mediaViewDidFinishPreparingVideo:self];
  }
}

- (void)_rendererDidStartPreparingVideo
{
  if (self->_delegateFlags.hasDidStartPreparingVideo)
  {
    id v3 = [(NUMediaView *)self delegate];
    [v3 mediaViewDidStartPreparingVideo:self];
  }
}

- (void)_rendererDidUpdateLivePhoto
{
  if (self->_delegateFlags.hasDidUpdateLivePhoto)
  {
    id v3 = [(NUMediaView *)self delegate];
    [v3 mediaViewDidUpdateLivePhoto:self];
  }
}

- (void)_updateVisibleImageOverlayView
{
  [(NUMediaView *)self imageFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(NUMediaView *)self frame];
  v19.origin.double x = v11;
  v19.origin.double y = v12;
  v19.size.double width = v13;
  v19.size.double height = v14;
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  CGRect v18 = CGRectIntersection(v17, v19);
  visibleImageOverlayView = self->_visibleImageOverlayView;

  -[_NUMediaVisibleImageOverlayView setFrame:](visibleImageOverlayView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)_updateScreenSpaceOverlay
{
  [(NUMediaView *)self imageFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(_NUMediaScreenSpaceOverlayView *)self->_screenSpaceOverlayView frame];
  v18.origin.double x = v11;
  v18.origin.double y = v12;
  v18.size.double width = v13;
  v18.size.double height = v14;
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  if (!CGRectEqualToRect(v17, v18))
  {
    screenSpaceOverlayView = self->_screenSpaceOverlayView;
    [(NUMediaView *)self imageFrame];
    -[_NUMediaScreenSpaceOverlayView setFrame:](screenSpaceOverlayView, "setFrame:");
  }
}

- (void)_rendererDidCreateAVPlayerController:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  playerView = self->_playerView;
  if (v4)
  {
    double v7 = [v4 player];
    [(NUAVPlayerView *)playerView setPlayer:v7];

    [v5 setDelegate:self];
  }
  else
  {
    CGFloat v8 = playerView;
    double v9 = self->_playerView;
    self->_playerView = 0;

    CGFloat v10 = (void *)MEMORY[0x263F1CB60];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__NUMediaView__rendererDidCreateAVPlayerController___block_invoke;
    v14[3] = &unk_2642C2FC0;
    uint64_t v15 = v8;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__NUMediaView__rendererDidCreateAVPlayerController___block_invoke_2;
    v12[3] = &unk_2642C2E58;
    CGFloat v13 = v15;
    CGFloat v11 = v15;
    [v10 animateWithDuration:v14 animations:v12 completion:0.2];
  }
}

uint64_t __52__NUMediaView__rendererDidCreateAVPlayerController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __52__NUMediaView__rendererDidCreateAVPlayerController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (id)_videoPlayerController
{
  id v2 = [(NUMediaView *)self _renderer];
  double v3 = [v2 nuAVPlayerController];

  return v3;
}

- (id)_videoPlayerView
{
  playerView = self->_playerView;
  if (!playerView)
  {
    id v4 = (NUAVPlayerView *)objc_opt_new();
    double v5 = self->_playerView;
    self->_playerView = v4;

    [(NUAVPlayerView *)self->_playerView setAlpha:0.0];
    [(NUAVPlayerView *)self->_playerView setDelegate:self];
    int v6 = [MEMORY[0x263F58620] isViewDebugEnabled];
    playerView = self->_playerView;
    if (v6)
    {
      double v7 = [(NUAVPlayerView *)playerView layer];
      id v8 = [MEMORY[0x263F1C550] cyanColor];
      objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

      double v9 = [(NUAVPlayerView *)self->_playerView layer];
      [v9 setBorderWidth:8.0];

      playerView = self->_playerView;
    }
  }

  return playerView;
}

- (void)_transitionToInsets:(UIEdgeInsets)a3 duration:(double)a4 animationCurve:(int64_t)a5 updateRenderContent:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v98 = *MEMORY[0x263EF8340];
  if (a6) {
    [(NUMediaViewRenderer *)self->_renderer cancelPendingRenders];
  }
  [(NUMediaView *)self _beginTransition];
  self->_scrollUpdatesSuppressed = 1;
  CGFloat v14 = (void *)MEMORY[0x263F586F0];
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
  }
  uint64_t v15 = (os_log_t *)MEMORY[0x263F58700];
  double v16 = (void *)*MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    v66 = v16;
    v107.double top = top;
    v107.double left = left;
    v107.CGFloat bottom = bottom;
    v107.CGFloat right = right;
    v67 = NSStringFromUIEdgeInsets(v107);
    v68 = @"NO";
    *(_DWORD *)buf = 138413058;
    __int16 v92 = 2048;
    v91 = v67;
    if (v6) {
      v68 = @"YES";
    }
    double v93 = a4;
    __int16 v94 = 1024;
    int v95 = a5;
    __int16 v96 = 2112;
    v97 = v68;
    _os_log_debug_impl(&dword_217C0A000, v66, OS_LOG_TYPE_DEBUG, "-[NUMediaView _transitionToInsets:duration:animationCurve:updateRenderContent:] - insets: %@, duration: %f, animationCurve: %d, updateRenderContent: %@", buf, 0x26u);
  }
  if ([(NUMediaViewRenderer *)self->_renderer isZoomedToFit])
  {
    double v84 = a4;
    [(NUMediaView *)self frame];
    double v18 = v17;
    double v80 = v19;
    double v82 = v17;
    double v20 = v19;
    double v21 = bottom;
    double v85 = bottom;
    double v86 = right;
    double v22 = right;
    double v24 = v23;
    double v77 = v25;
    double v78 = v23;
    double v26 = v25;
    [(NURenderView *)self->_renderView frame];
    -[NUMediaView convertRect:fromView:](self, "convertRect:fromView:", self->_scrollView);
    double v31 = v24 - (v22 + left);
    double v32 = v26 - (top + v21);
    double v33 = v31 * 0.5;
    if (v31 > 0.0) {
      double v33 = -0.0;
    }
    double v34 = v18 + left + v33;
    if (v31 <= 0.0) {
      double v35 = 0.0;
    }
    else {
      double v35 = v24 - (v22 + left);
    }
    double v36 = v32 * 0.5;
    if (v32 > 0.0) {
      double v36 = -0.0;
    }
    double v37 = v20 + top + v36;
    if (v32 <= 0.0) {
      double v38 = 0.0;
    }
    else {
      double v38 = v26 - (top + v21);
    }
    CGFloat v39 = v27;
    CGFloat v40 = v28;
    CGFloat v41 = v29;
    CGFloat v76 = v29;
    CGFloat v42 = v30;
    NUFitScaleForImageRectInRect(v27, v28, v29, v30, v34, v37, v35, v38);
    CGAffineTransformMakeScale(&v89, v43, v43);
    v101.origin.double x = v39;
    v101.origin.double y = v40;
    v101.size.double width = v41;
    v101.size.double height = v42;
    CGFloat v44 = v42;
    CGRect v102 = CGRectApplyAffineTransform(v101, &v89);
    double width = v102.size.width;
    double height = v102.size.height;
    uint64_t v47 = objc_opt_class();
    double v75 = v80;
    double v74 = v82;
    double v81 = top;
    double v83 = left;
    double v48 = top;
    double v49 = height;
    double v50 = left;
    double v51 = width;
    objc_msgSend(v47, "_proposedInsetsForInsets:contentSize:inFrame:centerContent:", self->_centerContent, v48, v50, v85, v86, width, height, *(void *)&v74, *(void *)&v75, *(void *)&v78, *(void *)&v77);
    double v53 = v52;
    CGFloat v55 = v54;
    v103.origin.double x = v39;
    v103.origin.double y = v40;
    v103.size.double width = v76;
    v103.size.double height = v44;
    double MidX = CGRectGetMidX(v103);
    v104.origin.double x = v39;
    v104.origin.double y = v40;
    v104.size.double width = v76;
    double v56 = v53;
    v104.size.double height = v44;
    double v57 = v55;
    double MidY = CGRectGetMidY(v104);
    v105.origin.double x = v55;
    v105.origin.double y = v56;
    v105.size.double width = v51;
    v105.size.double height = height;
    double v59 = CGRectGetMidX(v105);
    v106.origin.double x = v55;
    v106.origin.double y = v56;
    v106.size.double width = v51;
    v106.size.double height = v49;
    double v60 = CGRectGetMidY(v106);
    self->_transitionTargetSize.double width = v51;
    self->_transitionTargetSize.double height = v49;
    if (*v14 != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
    }
    double v61 = v59 - MidX;
    double v62 = v60 - MidY;
    os_log_t v63 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
    {
      CGFloat v69 = self->_transitionTargetSize.width;
      CGFloat v70 = self->_transitionTargetSize.height;
      v71 = v63;
      v99.double width = v69;
      v99.double height = v70;
      v72 = NSStringFromCGSize(v99);
      v100.double x = v61;
      v100.double y = v62;
      NSStringFromCGPoint(v100);
      double v73 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412546;
      v91 = v72;
      __int16 v92 = 2112;
      double v93 = v73;
      _os_log_debug_impl(&dword_217C0A000, v71, OS_LOG_TYPE_DEBUG, "-[NUMediaView _transitionToInsets:duration:animationCurve:updateRenderContent:] - size: %@, offset: %@", buf, 0x16u);
    }
    renderView = self->_renderView;
    v65 = NUMediaTimingFunctionForUIAnimationCurve(a5);
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = __79__NUMediaView__transitionToInsets_duration_animationCurve_updateRenderContent___block_invoke;
    v87[3] = &unk_2642C2E30;
    v87[4] = self;
    *(double *)&v87[5] = v81;
    *(double *)&v87[6] = v83;
    *(double *)&v87[7] = v85;
    *(double *)&v87[8] = v86;
    BOOL v88 = v6;
    -[NURenderView transitionToSize:offset:duration:animationCurve:completion:](renderView, "transitionToSize:offset:duration:animationCurve:completion:", v65, v87, v51, v49, v61, v62, v84);

    -[_NUMediaScreenSpaceOverlayView setFrame:](self->_screenSpaceOverlayView, "setFrame:", v57, v56, v51, v49);
    self->_scrollUpdatesSuppressed = 0;
  }
  else
  {
    [(NUMediaView *)self _endTransition];
    self->_edgeInsets.double top = top;
    self->_edgeInsets.double left = left;
    self->_edgeInsets.CGFloat bottom = bottom;
    self->_edgeInsets.CGFloat right = right;
    self->_scrollUpdatesSuppressed = 0;
    if (v6) {
      [(NUMediaView *)self _updateRenderContent];
    }
  }
}

uint64_t __79__NUMediaView__transitionToInsets_duration_animationCurve_updateRenderContent___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
  }
  id v2 = (void *)*MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = *(void **)(*(void *)(a1 + 32) + 408);
    double v7 = v2;
    [v6 frame];
    v14.double width = v8;
    v14.double height = v9;
    CGFloat v10 = NSStringFromCGSize(v14);
    int v11 = 138412290;
    CGFloat v12 = v10;
    _os_log_debug_impl(&dword_217C0A000, v7, OS_LOG_TYPE_DEBUG, "-[NUMediaView _transitionToInsets:duration:animationCurve:updateRenderContent:] - render view content size: %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t result = [*(id *)(a1 + 32) _endTransition];
  id v4 = (_OWORD *)(*(void *)(a1 + 32) + 432);
  long long v5 = *(_OWORD *)(a1 + 56);
  *id v4 = *(_OWORD *)(a1 + 40);
  v4[1] = v5;
  if (*(unsigned char *)(a1 + 72)) {
    return [*(id *)(a1 + 32) _updateRenderContent];
  }
  return result;
}

- (void)_endTransition
{
}

- (void)waitForRender
{
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (![(NUMediaView *)self loopsVideoPlayback]
    && ![(NUMediaView *)self isVideoPlayerVisible])
  {
    [(NUMediaViewRenderer *)self->_renderer endPanning];
    if (!self->_scrollUpdatesSuppressed) {
      [(NUMediaView *)self _updateRenderContent];
    }
  }
  if (self->_delegateFlags.hasDidEndDecelerating)
  {
    id v4 = [(NUMediaView *)self delegate];
    [v4 mediaViewDidEndDecelerating:self];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(NUMediaView *)self loopsVideoPlayback]
    && ![(NUMediaView *)self isVideoPlayerVisible]
    && !v4)
  {
    [(NUMediaViewRenderer *)self->_renderer endPanning];
    if (!self->_scrollUpdatesSuppressed) {
      [(NUMediaView *)self _updateRenderContent];
    }
  }
  if (self->_delegateFlags.hasDidEndDragging)
  {
    id v6 = [(NUMediaView *)self delegate];
    [v6 mediaViewDidEndDragging:self willDecelerate:v4];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(NUMediaViewRenderer *)self->_renderer beginPanning];
  if (self->_delegateFlags.hasWillBeginDragging)
  {
    id v4 = [(NUMediaView *)self delegate];
    [v4 mediaViewWillBeginDragging:self];
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  if (![(NUMediaView *)self loopsVideoPlayback]
    && ![(NUMediaView *)self isVideoPlayerVisible])
  {
    [(NUMediaViewRenderer *)self->_renderer endZooming];
    if (!self->_scrollUpdatesSuppressed) {
      [(NUMediaView *)self _updateRenderContent];
    }
  }
  if (self->_delegateFlags.hasDidEndZooming)
  {
    id v6 = [(NUMediaView *)self delegate];
    [v6 mediaViewDidEndZooming:self];
  }
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  if (![(NUMediaView *)self loopsVideoPlayback]
    && ![(NUMediaView *)self isVideoPlayerVisible])
  {
    [(NUMediaViewRenderer *)self->_renderer beginZooming];
  }
  if (self->_delegateFlags.hasWillBeginZooming)
  {
    id v5 = [(NUMediaView *)self delegate];
    [v5 mediaViewWillBeginZooming:self];
  }
}

- (void)scrollViewDidZoom:(id)a3
{
  id v5 = a3;
  [(NUMediaView *)self _updateContentInsets];
  [(NUMediaView *)self _updateScreenSpaceOverlay];
  [(NUMediaView *)self _updateVisibleImageOverlayView];
  if (self->_delegateFlags.hasDidZoom)
  {
    id v4 = [(NUMediaView *)self delegate];
    [v5 zoomScale];
    objc_msgSend(v4, "mediaView:didZoom:", self);
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_renderView;
}

- (id)_visibleImageRectOverlayView
{
  return self->_visibleImageOverlayView;
}

- (void)setCenterContent:(BOOL)a3
{
  if (self->_centerContent != a3) {
    self->_BOOL centerContent = a3;
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_edgeInsets = &self->_edgeInsets;
  BOOL v10 = self->_edgeInsets.left == a3.left
     && self->_edgeInsets.top == a3.top
     && self->_edgeInsets.right == a3.right
     && self->_edgeInsets.bottom == a3.bottom;
  if (!v10 && !self->_transitionCount)
  {
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
    }
    CGFloat v12 = (void *)*MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = v12;
      v18.CGFloat top = top;
      v18.CGFloat left = left;
      v18.CGFloat bottom = bottom;
      v18.CGFloat right = right;
      CGSize v14 = NSStringFromUIEdgeInsets(v18);
      int v15 = 138412290;
      double v16 = v14;
      _os_log_debug_impl(&dword_217C0A000, v13, OS_LOG_TYPE_DEBUG, "-[NUMediaView setEdgeInsets:] - insets: %@", (uint8_t *)&v15, 0xCu);
    }
    p_edgeInsets->CGFloat top = top;
    p_edgeInsets->CGFloat left = left;
    p_edgeInsets->CGFloat bottom = bottom;
    p_edgeInsets->CGFloat right = right;
    [(NUMediaView *)self _updateContentInsets];
  }
}

void __26__NUMediaView__setupViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x263F58620];
  id v5 = a3;
  id v6 = a2;
  [v4 mediaViewRenderCoalescingInterval];
  objc_msgSend(v5, "delayNextInvocationByTimeInterval:");

  [v6 _updateRenderContent];
}

- (void)installRenderingCompletionBlock:(id)a3
{
  self->_id renderingCompletionBlock = (id)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (CGRect)convertViewRect:(CGRect)a3 fromSpace:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v9 = a4;
  BOOL v10 = [(NUMediaView *)self _geometry];
  if (v10)
  {
    v82.origin.CGFloat x = x;
    v82.origin.CGFloat y = y;
    v82.size.CGFloat width = width;
    v82.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v82);
    v83.origin.CGFloat x = x;
    v83.origin.CGFloat y = y;
    v83.size.CGFloat width = width;
    v83.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v83);
    v84.origin.CGFloat x = x;
    v84.origin.CGFloat y = y;
    v84.size.CGFloat width = width;
    v84.size.CGFloat height = height;
    double v73 = CGRectGetMinX(v84);
    v85.origin.CGFloat x = x;
    v85.origin.CGFloat y = y;
    v85.size.CGFloat width = width;
    v85.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v85);
    v86.origin.CGFloat x = x;
    v86.origin.CGFloat y = y;
    v86.size.CGFloat width = width;
    v86.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v86);
    v87.origin.CGFloat x = x;
    v87.origin.CGFloat y = y;
    v87.size.CGFloat width = width;
    v87.size.CGFloat height = height;
    double v13 = CGRectGetMinY(v87);
    v88.origin.CGFloat x = x;
    v88.origin.CGFloat y = y;
    v88.size.CGFloat width = width;
    v88.size.CGFloat height = height;
    double v14 = CGRectGetMaxX(v88);
    v89.origin.CGFloat x = x;
    v89.origin.CGFloat y = y;
    v89.size.CGFloat width = width;
    v89.size.CGFloat height = height;
    double v15 = CGRectGetMaxY(v89);
    id v76 = 0;
    double v16 = [v10 transformWithSourceSpace:v9 destinationSpace:@"/Image" error:&v76];
    id v17 = v76;
    if (!v16)
    {
      double v60 = NUAssertLogger();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        double v61 = [NSString stringWithFormat:@"Cannot establish a mapping from space %@ to space %@: %@", v9, @"/Image", v17];
        *(_DWORD *)buf = 138543362;
        double v78 = v61;
        _os_log_error_impl(&dword_217C0A000, v60, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      double v62 = (const void **)MEMORY[0x263F585C8];
      specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
      v64 = NUAssertLogger();
      BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v65)
        {
          v68 = dispatch_get_specific(*v62);
          CGFloat v69 = (void *)MEMORY[0x263F08B88];
          id v70 = v68;
          v71 = [v69 callStackSymbols];
          v72 = [v71 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          double v78 = v68;
          __int16 v79 = 2114;
          double v80 = v72;
          _os_log_error_impl(&dword_217C0A000, v64, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v65)
      {
        v66 = [MEMORY[0x263F08B88] callStackSymbols];
        v67 = [v66 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        double v78 = v67;
        _os_log_error_impl(&dword_217C0A000, v64, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
    }
    objc_msgSend(v16, "transformPoint:", MinX, MinY);
    double v19 = v18;
    double v21 = v20;
    objc_msgSend(v16, "transformPoint:", v73, MaxY);
    double v23 = v22;
    double v25 = v24;
    objc_msgSend(v16, "transformPoint:", MaxX, v13);
    double v27 = v26;
    double v29 = v28;
    objc_msgSend(v16, "transformPoint:", v14, v15);
    if (v29 >= v31) {
      double v32 = v31;
    }
    else {
      double v32 = v29;
    }
    if (v29 >= v31) {
      double v31 = v29;
    }
    if (v21 >= v25) {
      double v33 = v25;
    }
    else {
      double v33 = v21;
    }
    if (v21 >= v25) {
      double v34 = v21;
    }
    else {
      double v34 = v25;
    }
    if (v27 >= v30) {
      double v35 = v30;
    }
    else {
      double v35 = v27;
    }
    if (v27 >= v30) {
      double v30 = v27;
    }
    if (v19 >= v23) {
      double v36 = v23;
    }
    else {
      double v36 = v19;
    }
    if (v19 >= v23) {
      double v37 = v19;
    }
    else {
      double v37 = v23;
    }
    if (v36 >= v35) {
      double v38 = v35;
    }
    else {
      double v38 = v36;
    }
    if (v33 >= v32) {
      double v39 = v32;
    }
    else {
      double v39 = v33;
    }
    if (v37 >= v30) {
      double v30 = v37;
    }
    if (v34 >= v31) {
      double v31 = v34;
    }
    double v40 = v30 - v38;
    double v41 = v31 - v39;
    CGFloat v42 = [(NUMediaView *)self _geometry];
    CGFloat v43 = v42;
    if (v42) {
      [v42 extent];
    }
    NUPixelRectToCGRect();
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;

    v90.origin.CGFloat x = v38;
    v90.origin.CGFloat y = v39;
    v90.size.CGFloat width = v40;
    v90.size.CGFloat height = v41;
    v93.origin.CGFloat x = v49;
    v93.origin.CGFloat y = v51;
    v93.size.CGFloat width = v53;
    v93.size.CGFloat height = v55;
    CGRectIntersection(v90, v93);
    NURectFlipYOrigin();
    CGFloat v44 = v91.origin.x;
    CGFloat v45 = v91.origin.y;
    CGFloat v46 = v91.size.width;
    CGFloat v47 = v91.size.height;
    if (CGRectIsNull(v91))
    {
      CGFloat v44 = *MEMORY[0x263F001A8];
      CGFloat v45 = *(double *)(MEMORY[0x263F001A8] + 8);
      CGFloat v46 = *(double *)(MEMORY[0x263F001A8] + 16);
      CGFloat v47 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
  }
  else
  {
    CGFloat v44 = *MEMORY[0x263F001A8];
    CGFloat v45 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v46 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v47 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v56 = v44;
  double v57 = v45;
  double v58 = v46;
  double v59 = v47;
  result.size.CGFloat height = v59;
  result.size.CGFloat width = v58;
  result.origin.CGFloat y = v57;
  result.origin.CGFloat x = v56;
  return result;
}

- (CGRect)convertNormalizedViewRect:(CGRect)a3 fromSpace:(id)a4
{
  id v5 = a4;
  [(NUMediaView *)self _masterSizeWithoutGeometry];
  NURectDenormalize();
  -[NUMediaView convertViewRect:fromSpace:](self, "convertViewRect:fromSpace:", v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toNormalizedYDownSourceSpaceFromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a4;
  [(NUMediaView *)self _masterSizeWithoutGeometry];
  if (v8 <= 0.0 || (double v10 = v9, v9 <= 0.0))
  {
    double v14 = (uint64_t *)MEMORY[0x263F586F0];
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
    }
    double v15 = (os_log_t *)MEMORY[0x263F586E8];
    double v16 = (void *)*MEMORY[0x263F586E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586E8], OS_LOG_TYPE_DEFAULT))
    {
      double v17 = NSString;
      double v18 = v16;
      double v19 = [v17 stringWithFormat:@"Invalid masterSize"];
      int v34 = 138543362;
      double v35 = v19;
      _os_log_impl(&dword_217C0A000, v18, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&v34, 0xCu);

      uint64_t v20 = *v14;
      if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
      {
        if (v20 != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
        }
LABEL_11:
        os_log_t v21 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
          double v23 = (void *)MEMORY[0x263F08B88];
          id v24 = specific;
          double v25 = v21;
          double v26 = [v23 callStackSymbols];
          double v27 = [v26 componentsJoinedByString:@"\n"];
          int v34 = 138543618;
          double v35 = specific;
          __int16 v36 = 2114;
          double v37 = v27;
          _os_log_error_impl(&dword_217C0A000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v34, 0x16u);

LABEL_19:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v20 != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
    {
      goto LABEL_11;
    }
    os_log_t v28 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      double v31 = (void *)MEMORY[0x263F08B88];
      double v25 = v28;
      double v32 = [v31 callStackSymbols];
      double v33 = [v32 componentsJoinedByString:@"\n"];
      int v34 = 138543362;
      double v35 = v33;
      _os_log_error_impl(&dword_217C0A000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v34, 0xCu);

      goto LABEL_19;
    }
LABEL_16:
    _NUAssertContinueHandler();
    goto LABEL_17;
  }
  double v11 = v8;
  [(NUMediaView *)self convertPoint:v7, @"/masterSpace", x, y fromView toSpace];
  double x = v12 / v11;
  double y = 1.0 - v13 / v10;
LABEL_17:

  double v29 = x;
  double v30 = y;
  result.double y = v30;
  result.double x = v29;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromSpace:(id)a4 toView:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  double v11 = [(NUMediaView *)self _geometry];
  double v12 = v11;
  if (!v11)
  {
    uint64_t v20 = (uint64_t *)MEMORY[0x263F586F0];
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
    }
    os_log_t v21 = (os_log_t *)MEMORY[0x263F586E8];
    double v22 = (void *)*MEMORY[0x263F586E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586E8], OS_LOG_TYPE_DEFAULT))
    {
      double v23 = NSString;
      id v24 = v22;
      double v25 = [v23 stringWithFormat:@"Converting point before geometry is valid"];
      *(_DWORD *)buf = 138543362;
      v67 = v25;
      _os_log_impl(&dword_217C0A000, v24, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v26 = *v20;
      if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
      {
        if (v26 != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
        }
LABEL_22:
        os_log_t v36 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
          uint64_t v38 = (void *)MEMORY[0x263F08B88];
          id v39 = specific;
          double v40 = v36;
          double v41 = [v38 callStackSymbols];
          CGFloat v42 = [v41 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v67 = specific;
          __int16 v68 = 2114;
          CGFloat v69 = v42;
          _os_log_error_impl(&dword_217C0A000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_37:
          goto LABEL_27;
        }
        goto LABEL_27;
      }
      if (v26 != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
    {
      goto LABEL_22;
    }
    os_log_t v43 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
    {
      CGFloat v53 = (void *)MEMORY[0x263F08B88];
      double v40 = v43;
      double v54 = [v53 callStackSymbols];
      CGFloat v55 = [v54 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v67 = v55;
      _os_log_error_impl(&dword_217C0A000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_37;
    }
LABEL_27:
    _NUAssertContinueHandler();
    goto LABEL_28;
  }
  id v65 = 0;
  double v13 = [v11 transformWithSourceSpace:v9 destinationSpace:@"/Image" error:&v65];
  id v14 = v65;
  if (!v13)
  {
    if (![v9 isEqualToString:@"/masterSpace"]
      || (id v64 = 0,
          [v12 transformWithSourceSpace:@"/Master/Source" destinationSpace:@"/Image" error:&v64], double v13 = objc_claimAutoreleasedReturnValue(), v27 = v64, v14, v14 = v27, !v13))
    {
      if (![v9 isEqualToString:@"/masterSpace"]
        || (id v63 = 0,
            [v12 transformWithSourceSpace:@"/ShowOriginalSource" destinationSpace:@"/Image" error:&v63], double v13 = objc_claimAutoreleasedReturnValue(), v28 = v63, v14, v14 = v28, !v13))
      {
        double v29 = (uint64_t *)MEMORY[0x263F586F0];
        if (*MEMORY[0x263F586F0] != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
        }
        double v30 = (os_log_t *)MEMORY[0x263F586E8];
        double v31 = (void *)*MEMORY[0x263F586E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586E8], OS_LOG_TYPE_DEFAULT))
        {
          double v32 = NSString;
          double v33 = v31;
          int v34 = [v32 stringWithFormat:@"Cannot establish a mapping from space %@ to space %@: %@", v9, @"/Image", v14];
          *(_DWORD *)buf = 138543362;
          v67 = v34;
          _os_log_impl(&dword_217C0A000, v33, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v35 = *v29;
          if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
          {
            if (v35 != -1) {
              dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
            }
LABEL_30:
            os_log_t v46 = *v30;
            if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
            {
              CGFloat v47 = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
              double v48 = (void *)MEMORY[0x263F08B88];
              id v62 = v47;
              CGFloat v49 = v46;
              double v50 = [v48 callStackSymbols];
              CGFloat v51 = [v50 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543618;
              v67 = v47;
              __int16 v68 = 2114;
              CGFloat v69 = v51;
              _os_log_error_impl(&dword_217C0A000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_39:
              goto LABEL_35;
            }
            goto LABEL_35;
          }
          if (v35 != -1) {
            dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
          }
        }
        else if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
        {
          goto LABEL_30;
        }
        os_log_t v52 = *v30;
        if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
        {
          double v56 = (void *)MEMORY[0x263F08B88];
          CGFloat v49 = v52;
          double v57 = [v56 callStackSymbols];
          double v58 = [v57 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v67 = v58;
          _os_log_error_impl(&dword_217C0A000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          goto LABEL_39;
        }
LABEL_35:
        double v60 = @"/Image";
        id v61 = v14;
        id v59 = v9;
        _NUAssertContinueHandler();
        goto LABEL_4;
      }
    }
  }
  objc_msgSend(v13, "transformPoint:", x, y);
  double x = v15;
  double y = v16;

LABEL_4:
  [(NUMediaView *)self _imageSize];
  -[NUMediaView convertPointFromImage:](self, "convertPointFromImage:", x, v17 - y);
  objc_msgSend(v10, "convertPoint:fromView:", self);
  double x = v18;
  double y = v19;

LABEL_28:
  double v44 = x;
  double v45 = y;
  result.double y = v45;
  result.double x = v44;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4 toSpace:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  double v11 = [(NUMediaView *)self _geometry];
  if (!v11)
  {
    uint64_t v20 = (uint64_t *)MEMORY[0x263F586F0];
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
    }
    os_log_t v21 = (os_log_t *)MEMORY[0x263F586E8];
    double v22 = (void *)*MEMORY[0x263F586E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586E8], OS_LOG_TYPE_DEFAULT))
    {
      double v23 = NSString;
      id v24 = v22;
      double v25 = [v23 stringWithFormat:@"Converting point before geometry is valid"];
      *(_DWORD *)buf = 138543362;
      id v64 = v25;
      _os_log_impl(&dword_217C0A000, v24, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v26 = *v20;
      if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
      {
        if (v26 != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
        }
LABEL_22:
        os_log_t v36 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
          uint64_t v38 = (void *)MEMORY[0x263F08B88];
          id v39 = specific;
          double v40 = v36;
          double v41 = [v38 callStackSymbols];
          CGFloat v42 = [v41 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          id v64 = specific;
          __int16 v65 = 2114;
          v66 = v42;
          _os_log_error_impl(&dword_217C0A000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_37:
          goto LABEL_27;
        }
        goto LABEL_27;
      }
      if (v26 != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
    {
      goto LABEL_22;
    }
    os_log_t v43 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
    {
      double v54 = (void *)MEMORY[0x263F08B88];
      double v40 = v43;
      CGFloat v55 = [v54 callStackSymbols];
      double v56 = [v55 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v64 = v56;
      _os_log_error_impl(&dword_217C0A000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_37;
    }
LABEL_27:
    _NUAssertContinueHandler();
    goto LABEL_28;
  }
  -[NUMediaView convertPoint:fromView:](self, "convertPoint:fromView:", v9, x, y);
  -[NUMediaView convertPointToImage:](self, "convertPointToImage:");
  double x = v12;
  double v14 = v13;
  [(NUMediaView *)self _imageSize];
  double y = v15 - v14;
  id v62 = 0;
  double v16 = [v11 transformWithSourceSpace:@"/Image" destinationSpace:v10 error:&v62];
  id v17 = v62;
  if (!v16)
  {
    if (![v10 isEqualToString:@"/masterSpace"]
      || (id v61 = 0,
          [v11 transformWithSourceSpace:@"/Image" destinationSpace:@"/Master/Source" error:&v61], double v16 = objc_claimAutoreleasedReturnValue(), v27 = v61, v17, v17 = v27, !v16))
    {
      if (![v10 isEqualToString:@"/masterSpace"]
        || (id v60 = 0,
            [v11 transformWithSourceSpace:@"/Image" destinationSpace:@"/ShowOriginalSource" error:&v60], double v16 = objc_claimAutoreleasedReturnValue(), v28 = v60, v17, v17 = v28, !v16))
      {
        double v29 = (uint64_t *)MEMORY[0x263F586F0];
        if (*MEMORY[0x263F586F0] != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
        }
        double v30 = (os_log_t *)MEMORY[0x263F586E8];
        double v31 = (void *)*MEMORY[0x263F586E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F586E8], OS_LOG_TYPE_DEFAULT))
        {
          double v32 = NSString;
          double v33 = v31;
          int v34 = [v32 stringWithFormat:@"Cannot establish a mapping from space %@ to space %@: %@", @"/Image", v10, v17];
          *(_DWORD *)buf = 138543362;
          id v64 = v34;
          _os_log_impl(&dword_217C0A000, v33, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v35 = *v29;
          if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
          {
            if (v35 != -1) {
              dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
            }
LABEL_30:
            os_log_t v46 = *v30;
            if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
            {
              CGFloat v47 = dispatch_get_specific((const void *)*MEMORY[0x263F585C8]);
              double v48 = (void *)MEMORY[0x263F08B88];
              id v49 = v47;
              double v50 = v46;
              CGFloat v51 = [v48 callStackSymbols];
              os_log_t v52 = [v51 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543618;
              id v64 = v47;
              __int16 v65 = 2114;
              v66 = v52;
              _os_log_error_impl(&dword_217C0A000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_39:
              goto LABEL_35;
            }
            goto LABEL_35;
          }
          if (v35 != -1) {
            dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
          }
        }
        else if (dispatch_get_specific((const void *)*MEMORY[0x263F585C8]))
        {
          goto LABEL_30;
        }
        os_log_t v53 = *v30;
        if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
        {
          double v57 = (void *)MEMORY[0x263F08B88];
          double v50 = v53;
          double v58 = [v57 callStackSymbols];
          id v59 = [v58 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          id v64 = v59;
          _os_log_error_impl(&dword_217C0A000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          goto LABEL_39;
        }
LABEL_35:
        _NUAssertContinueHandler();
        goto LABEL_4;
      }
    }
  }
  objc_msgSend(v16, "transformPoint:", x, y);
  double x = v18;
  double y = v19;

LABEL_4:
LABEL_28:

  double v44 = x;
  double v45 = y;
  result.double y = v45;
  result.double x = v44;
  return result;
}

- (CGRect)convertRectFromImage:(CGRect)a3
{
  -[NUMediaViewRenderer convertRect:fromImageToView:](self->_renderer, "convertRect:fromImageToView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)convertRectToImage:(CGRect)a3
{
  -[NUMediaViewRenderer convertRect:toImageFromView:](self->_renderer, "convertRect:toImageFromView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGPoint)convertPointFromImage:(CGPoint)a3
{
  -[NUMediaViewRenderer convertPoint:fromImageToView:](self->_renderer, "convertPoint:fromImageToView:", self, a3.x, a3.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)convertPointToImage:(CGPoint)a3
{
  -[NUMediaViewRenderer convertPoint:toImageFromView:](self->_renderer, "convertPoint:toImageFromView:", self, a3.x, a3.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGSize)_imageSize
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [(NURenderView *)self->_renderView _containerLayer];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;

  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
  }
  id v7 = (void *)*MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    id v10 = v7;
    v15.CGFloat width = v4;
    v15.CGFloat height = v6;
    double v11 = NSStringFromCGSize(v15);
    int v12 = 138412290;
    double v13 = v11;
    _os_log_debug_impl(&dword_217C0A000, v10, OS_LOG_TYPE_DEBUG, "-[NUMediaView _imageSize]: %@", (uint8_t *)&v12, 0xCu);
  }
  double v8 = v4;
  double v9 = v6;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)setAngle:(double)a3
{
  memset(&v6, 0, sizeof(v6));
  CATransform3DMakeRotation(&v6, a3, 0.0, 0.0, 1.0);
  CGFloat v4 = [(NURenderView *)self->_renderView _containerLayer];
  CATransform3D v5 = v6;
  [v4 setTransform:&v5];
}

- (id)_imageLayer
{
  return [(NURenderView *)self->_renderView _backfillLayer];
}

- (BOOL)isReady
{
  return [(NUMediaViewRenderer *)self->_renderer isReady];
}

- (BOOL)scrollEnabled
{
  return [(NUScrollView *)self->_scrollView isScrollEnabled];
}

- (void)setScrollEnabled:(BOOL)a3
{
}

- (void)setAlwaysBounceScrollView:(BOOL)a3
{
  self->_BOOL alwaysBounceScrollView = a3;
  -[NUScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:");
  scrollView = self->_scrollView;
  BOOL alwaysBounceScrollView = self->_alwaysBounceScrollView;

  [(NUScrollView *)scrollView setAlwaysBounceHorizontal:alwaysBounceScrollView];
}

- (void)zoomToRect:(CGRect)a3 animated:(BOOL)a4
{
}

- (void)setZoomScale:(double)a3 animated:(BOOL)a4
{
}

- (double)minimumZoomScale
{
  [(NUScrollView *)self->_scrollView minimumZoomScale];
  return result;
}

- (void)setMinimumZoomScale:(double)a3
{
  [(NUScrollView *)self->_scrollView setMinimumZoomScale:a3];

  [(NUMediaView *)self _updateRenderContent];
}

- (double)maximumZoomScale
{
  [(NUScrollView *)self->_scrollView maximumZoomScale];
  return result;
}

- (void)setMaximumZoomScale:(double)a3
{
  [(NUMediaViewRenderer *)self->_renderer setMaximumZoomScale:a3];

  [(NUMediaView *)self _updateRenderContent];
}

- (double)zoomScale
{
  [(NUScrollView *)self->_scrollView zoomScale];
  return result;
}

- (void)setZoomScaleToFit
{
  double v3 = [(NUMediaView *)self _renderer];
  char v4 = [v3 isZoomedToFit];

  if ((v4 & 1) == 0)
  {
    [(NUMediaView *)self minimumZoomScale];
    -[NUMediaView setZoomScale:](self, "setZoomScale:");
  }
}

- (void)setZoomScale:(double)a3
{
  [(NUScrollView *)self->_scrollView setZoomScale:a3];

  [(NUMediaView *)self _updateRenderContent];
}

- (void)willMoveToWindow:(id)a3
{
  id v8 = a3;
  displayEDRMonitorTimer = self->_displayEDRMonitorTimer;
  if (displayEDRMonitorTimer)
  {
    [(NSTimer *)displayEDRMonitorTimer invalidate];
    CATransform3D v5 = self->_displayEDRMonitorTimer;
    self->_displayEDRMonitorTimer = 0;
  }
  displayEDRMonitorLink = self->_displayEDRMonitorLink;
  if (displayEDRMonitorLink)
  {
    [(CADisplayLink *)displayEDRMonitorLink invalidate];
    id v7 = self->_displayEDRMonitorLink;
    self->_displayEDRMonitorLink = 0;
  }
}

- (void)_invalidateDisplayEDRHeadroomMonitor
{
  displayEDRMonitorLink = self->_displayEDRMonitorLink;
  if (displayEDRMonitorLink)
  {
    [(CADisplayLink *)displayEDRMonitorLink invalidate];
    char v4 = self->_displayEDRMonitorLink;
    self->_displayEDRMonitorLink = 0;
  }
}

- (void)_monitorDisplayEDRHeadroom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v4 = [(NUMediaView *)self window];
  CATransform3D v5 = [v4 screen];

  +[NUMediaView currentEDRHeadroomForScreen:v5];
  double v7 = v6;
  [(NUMediaViewRenderer *)self->_renderer displayCurrentEDRHeadroom];
  double v9 = v8;
  if (vabdd_f64(v7, v8) > 0.01)
  {
    if ([(NUMediaViewRenderer *)self->_renderer canUpdateDisplayHeadroom])
    {
      if (*MEMORY[0x263F586F0] != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
      }
      id v10 = *MEMORY[0x263F58700];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218240;
        double v13 = v9;
        __int16 v14 = 2048;
        double v15 = v7;
        _os_log_impl(&dword_217C0A000, v10, OS_LOG_TYPE_DEFAULT, "EDR headroom change %0.3f -> %0.3f", (uint8_t *)&v12, 0x16u);
      }
      [(NUMediaViewRenderer *)self->_renderer setDisplayCurrentEDRHeadroom:v7];
      [(NUMediaView *)self _updateRenderContent];
    }
    else
    {
      if (*MEMORY[0x263F586F0] != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_411);
      }
      double v11 = *MEMORY[0x263F58700];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218240;
        double v13 = v9;
        __int16 v14 = 2048;
        double v15 = v7;
        _os_log_impl(&dword_217C0A000, v11, OS_LOG_TYPE_DEFAULT, "EDR headroom change %0.3f -> %0.3f - scrubbing in progress, so not changing the headroom yet", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)_scheduleDisplayEDRHeadroomMonitor
{
  if (!self->_displayEDRMonitorLink)
  {
    double v3 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel__monitorDisplayEDRHeadroom_];
    displayEDRMonitorLink = self->_displayEDRMonitorLink;
    self->_displayEDRMonitorLink = v3;

    CAFrameRateRange v8 = CAFrameRateRangeMake(1.0, 60.0, 10.0);
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayEDRMonitorLink, "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
    CATransform3D v5 = self->_displayEDRMonitorLink;
    id v6 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x263EFF588]];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->hasDidFinishRendering = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidFinishRenderingWithStatistics = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidZoom = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasWillBeginZooming = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidEndZooming = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasWillBeginDragging = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidEndDragging = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidEndDecelerating = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidScroll = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidUpdateLivePhoto = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasIsReadyForVideoPlayback = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidStartPreparingVideo = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidFinishPreparingVideo = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidPlayToEnd = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasFailedToPlayToEnd = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasWillBeginLivePhotoPlayback = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidEndLivePhotoPlayback = objc_opt_respondsToSelector() & 1;
  }
}

- (NUMediaView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NUMediaView;
  double v3 = [(NUMediaView *)&v6 initWithCoder:a3];
  char v4 = v3;
  if (v3) {
    [(NUMediaView *)v3 _setupViews];
  }
  return v4;
}

+ (double)currentEDRHeadroomForScreen:(id)a3
{
  [a3 currentEDRHeadroom];
  double v4 = v3;
  [MEMORY[0x263F58620] overrideDisplayHeadroom];
  if (v5 >= 1.0) {
    double v4 = v5;
  }
  [MEMORY[0x263F58620] thresholdDisplayHeadroom];
  if (v4 <= v6) {
    return 1.0;
  }
  else {
    return v4;
  }
}

+ (double)maximumEDRHeadroomForScreen:(id)a3
{
  [a3 potentialEDRHeadroom];
  double v4 = v3;
  [MEMORY[0x263F58620] overrideDisplayHeadroom];
  if (v5 >= 1.0) {
    double v4 = v5;
  }
  [MEMORY[0x263F58620] thresholdDisplayHeadroom];
  if (v4 <= v6) {
    return 1.0;
  }
  else {
    return v4;
  }
}

@end