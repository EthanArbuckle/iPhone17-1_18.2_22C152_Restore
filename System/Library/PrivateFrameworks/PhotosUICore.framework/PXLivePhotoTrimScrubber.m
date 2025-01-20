@interface PXLivePhotoTrimScrubber
+ (UIImage)trimEndHighlightedImage;
+ (UIImage)trimEndHighlightedImageMini;
+ (UIImage)trimEndImage;
+ (UIImage)trimEndImageMini;
+ (UIImage)trimStartHighlightedImage;
+ (UIImage)trimStartHighlightedImageMini;
+ (UIImage)trimStartImage;
+ (UIImage)trimStartImageMini;
+ (id)_createSnappingControllersForKeytimes:(id)a3;
+ (id)createSnappingControllerWithSnappingTarget:(double)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampTimeToViewportIfZoomed:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeAtLocation:(SEL)a3 forElement:(CGPoint)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTrimLength;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)suggestedKeyTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtPoint:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForElement:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)untrimmedDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)viewportMaxTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)viewportMinTime;
- (AVAsset)asset;
- (AVVideoComposition)videoComposition;
- (BOOL)allowZoom;
- (BOOL)isAssetDurationLoaded;
- (BOOL)isDisabled;
- (BOOL)isValidKeyTime:(id *)a3;
- (BOOL)showVideoScrubberDebugOverlay;
- (BOOL)tryZoomAtTime:(id *)a3;
- (BOOL)useMiniScrubber;
- (CGRect)_disabledOverlayFrame;
- (CGRect)_keyHandleRect;
- (CGRect)loupeRect;
- (Class)filmStripViewClass;
- (NSArray)focusEventTimes;
- (NSArray)snapKeyTimes;
- (NSArray)snapTrimEndTimes;
- (NSArray)snapTrimStartTimes;
- (PXLivePhotoTrimScrubber)initWithFilmStripViewClass:(Class)a3 spec:(id)a4 traitCollection:(id)a5;
- (PXLivePhotoTrimScrubberDelegate)delegate;
- (PXLivePhotoTrimScrubberSpec)spec;
- (PXTrimScrubberLayoutHelper)layoutHelper;
- (UIImage)placeholderImage;
- (UIImageView)trimEndHandle;
- (UIImageView)trimStartHandle;
- (UIView)_postTrimOverlayView;
- (UIView)_preTrimOverlayView;
- (UIView)loupePlayerView;
- (UIView)photoLoupe;
- (double)_contentAspectRatio;
- (double)_offsetForTime:(id *)a3;
- (double)horizontalInset;
- (double)horizontalOffsetForTime:(id *)a3;
- (double)offsetForTime:(id *)a3;
- (id)_snapTimesForElement:(int64_t)a3;
- (id)_snappingControllersForElement:(int64_t)a3;
- (int64_t)_trackingElement;
- (int64_t)state;
- (int64_t)trimStatus;
- (unint64_t)playheadStyle;
- (void)_PXLivePhotoTrimScrubber_commonInit;
- (void)_animateChanges:(id)a3;
- (void)_assetDidLoadValues;
- (void)_newScrubberLayoutSubviews;
- (void)_presentControlsIfNeeded;
- (void)_releaseAVObjects;
- (void)_setContentAspectRatio:(double)a3;
- (void)_setKeyTime:(id *)a3 canHaveImpact:(BOOL)a4 forElement:(int64_t)a5;
- (void)_setPhotoLoupeHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_setTrackingElement:(int64_t)a3;
- (void)_setTrimControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_setUntrimmedDuration:(id *)a3;
- (void)_setupZoom;
- (void)_updateContentAspectRatio;
- (void)_updateEndTimeSnappingControllers;
- (void)_updateFocusEventSnappingControllers;
- (void)_updateKeyTimeSnappingControllers;
- (void)_updateSpecDependentUI;
- (void)_updateStartTimeSnappingControllers;
- (void)_updateTrimHandles;
- (void)_updateZoomState:(BOOL)a3;
- (void)_zoomAtTime:(id *)a3;
- (void)_zoomAtTrackedElement;
- (void)_zoomDelayed;
- (void)handleBeginTrackingAtLocation:(CGPoint)a3;
- (void)handleChangeTrackingAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4;
- (void)handleEndTracking:(BOOL)a3;
- (void)handleLongPressWithElement:(int64_t)a3;
- (void)handleSetKeyTime:(id *)a3;
- (void)handleTapWithElement:(int64_t)a3;
- (void)layoutSubviews;
- (void)performAnimatedChanges:(id)a3;
- (void)setAllowZoom:(BOOL)a3;
- (void)setAsset:(id)a3 videoComposition:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setFocusEventTimes:(id)a3;
- (void)setHorizontalInset:(double)a3;
- (void)setKeyTime:(id *)a3;
- (void)setLayoutHelper:(id)a3;
- (void)setLoupePlayerView:(id)a3;
- (void)setMinimumTrimLength:(id *)a3;
- (void)setOriginalEndTime:(id *)a3;
- (void)setOriginalStartTime:(id *)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlayheadStyle:(unint64_t)a3;
- (void)setPlayheadStyle:(unint64_t)a3 animate:(BOOL)a4;
- (void)setShowVideoScrubberDebugOverlay:(BOOL)a3;
- (void)setSnapKeyTimes:(id)a3;
- (void)setSnapTrimEndTimes:(id)a3;
- (void)setSnapTrimStartTimes:(id)a3;
- (void)setSpec:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSuggestedKeyTime:(id *)a3;
- (void)setTrimEndTime:(id *)a3;
- (void)setTrimStartTime:(id *)a3;
- (void)setUseMiniScrubber:(BOOL)a3;
- (void)unzoom;
- (void)updateTraitCollection:(id)a3;
@end

@implementation PXLivePhotoTrimScrubber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trimEndHandle, 0);
  objc_storeStrong((id *)&self->_trimStartHandle, 0);
  objc_storeStrong((id *)&self->_layoutHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusEventTimes, 0);
  objc_storeStrong((id *)&self->_snapTrimEndTimes, 0);
  objc_storeStrong((id *)&self->_snapTrimStartTimes, 0);
  objc_storeStrong((id *)&self->_snapKeyTimes, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_filmStripViewClass, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_postTrimOverlayView, 0);
  objc_storeStrong((id *)&self->_preTrimOverlayView, 0);
  objc_storeStrong((id *)&self->_debugEndTimeView, 0);
  objc_storeStrong((id *)&self->_debugLoupeTimeView, 0);
  objc_storeStrong((id *)&self->_debugStartTimeView, 0);
  objc_storeStrong((id *)&self->_trimControlHiddenHelper, 0);
  objc_storeStrong((id *)&self->_loupeHiddenHelper, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_focusEventSnappingControllers, 0);
  objc_storeStrong((id *)&self->_endTimeSnappingControllers, 0);
  objc_storeStrong((id *)&self->_startTimeSnappingControllers, 0);
  objc_storeStrong((id *)&self->_keyTimeSnappingControllers, 0);
  objc_storeStrong((id *)&self->_disabledOverlayView, 0);
  objc_storeStrong((id *)&self->_filmstripView, 0);
  objc_storeStrong((id *)&self->_filmstripContainerView, 0);
  objc_storeStrong((id *)&self->_photoLoupe, 0);
}

- (void)setMinimumTrimLength:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_minimumTrimLength.value = *(_OWORD *)&a3->var0;
  self->_minimumTrimLength.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTrimLength
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[38];
  return self;
}

- (BOOL)showVideoScrubberDebugOverlay
{
  return self->_showVideoScrubberDebugOverlay;
}

- (UIImageView)trimEndHandle
{
  return self->_trimEndHandle;
}

- (UIImageView)trimStartHandle
{
  return self->_trimStartHandle;
}

- (void)setLayoutHelper:(id)a3
{
}

- (PXTrimScrubberLayoutHelper)layoutHelper
{
  return self->_layoutHelper;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)_trackingElement
{
  return self->__trackingElement;
}

- (double)_contentAspectRatio
{
  return self->__contentAspectRatio;
}

- (void)setAllowZoom:(BOOL)a3
{
  self->_allowZoom = a3;
}

- (BOOL)allowZoom
{
  return self->_allowZoom;
}

- (BOOL)useMiniScrubber
{
  return self->_useMiniScrubber;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (PXLivePhotoTrimScrubberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXLivePhotoTrimScrubberDelegate *)WeakRetained;
}

- (void)setOriginalEndTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_originalEndTime.value = *(_OWORD *)&a3->var0;
  self->_originalEndTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[37];
  return self;
}

- (void)setOriginalStartTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_originalStartTime.value = *(_OWORD *)&a3->var0;
  self->_originalStartTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[36];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[35];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[34];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)suggestedKeyTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[33];
  return self;
}

- (NSArray)focusEventTimes
{
  return self->_focusEventTimes;
}

- (NSArray)snapTrimEndTimes
{
  return self->_snapTrimEndTimes;
}

- (NSArray)snapTrimStartTimes
{
  return self->_snapTrimStartTimes;
}

- (NSArray)snapKeyTimes
{
  return self->_snapKeyTimes;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[32];
  return self;
}

- (unint64_t)playheadStyle
{
  return self->_playheadStyle;
}

- (void)setHorizontalInset:(double)a3
{
  self->_horizontalInset = a3;
}

- (double)horizontalInset
{
  return self->_horizontalInset;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)untrimmedDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[31];
  return self;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (Class)filmStripViewClass
{
  return self->_filmStripViewClass;
}

- (void)setSpec:(id)a3
{
}

- (PXLivePhotoTrimScrubberSpec)spec
{
  return self->_spec;
}

- (UIView)_postTrimOverlayView
{
  return self->_postTrimOverlayView;
}

- (UIView)_preTrimOverlayView
{
  return self->_preTrimOverlayView;
}

- (UIView)photoLoupe
{
  return &self->_photoLoupe->super;
}

- (void)_releaseAVObjects
{
  if (objc_opt_respondsToSelector()) {
    [(PXLivePhotoTrimScrubberFilmStripView *)self->_filmstripView _releaseAVObjects];
  }
  [(PXLivePhotoTrimScrubber *)self setLoupePlayerView:0];
}

- (CGRect)_disabledOverlayFrame
{
  v3 = [(PXLivePhotoTrimScrubber *)self trimStartHandle];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UIView *)self->_filmstripContainerView frame];
  v39.origin.CGFloat x = v12;
  v39.origin.CGFloat y = v13;
  v39.size.CGFloat width = v14;
  v39.size.CGFloat height = v15;
  v34.origin.CGFloat x = v5;
  v34.origin.CGFloat y = v7;
  v34.size.CGFloat width = v9;
  v34.size.CGFloat height = v11;
  CGRect v35 = CGRectUnion(v34, v39);
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  CGFloat width = v35.size.width;
  CGFloat height = v35.size.height;

  v20 = [(PXLivePhotoTrimScrubber *)self trimEndHandle];
  [v20 frame];
  v40.origin.CGFloat x = v21;
  v40.origin.CGFloat y = v22;
  v40.size.CGFloat width = v23;
  v40.size.CGFloat height = v24;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGRect v37 = CGRectUnion(v36, v40);
  double v25 = v37.origin.x;
  double v26 = v37.origin.y;
  double v27 = v37.size.width;
  double v28 = v37.size.height;

  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v25, v26, v27, v28);
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (void)_presentControlsIfNeeded
{
  if (!self->_hasPresentedControls)
  {
    [(PXLivePhotoTrimScrubber *)self untrimmedDuration];
    if (v4)
    {
      [(PXLivePhotoTrimScrubber *)self keyTime];
      if (v3)
      {
        self->_hasPresentedControls = 1;
        [(PXLivePhotoTrimScrubber *)self layoutIfNeeded];
        if ([(PXLivePhotoTrimScrubber *)self playheadStyle]) {
          [(PXLivePhotoTrimScrubber *)self _setPhotoLoupeHidden:0 animated:1];
        }
      }
    }
  }
}

- (void)_setTrimControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_setPhotoLoupeHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (id)_snapTimesForElement:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) < 2)
  {
    CGFloat v5 = objc_opt_new();
    double v6 = [(PXLivePhotoTrimScrubber *)self snapKeyTimes];
    [v5 addObjectsFromArray:v6];

    [(PXLivePhotoTrimScrubber *)self suggestedKeyTime];
    if (v10[36])
    {
      CGFloat v7 = (void *)MEMORY[0x1E4F29238];
      [(PXLivePhotoTrimScrubber *)self suggestedKeyTime];
      double v8 = [v7 valueWithCMTime:v10];
      [v5 addObject:v8];
    }
    [v5 addObjectsFromArray:self->_focusEventTimes];
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v4 = [(PXLivePhotoTrimScrubber *)self snapTrimStartTimes];
      goto LABEL_9;
    }
    if (a3 == 2)
    {
      uint64_t v4 = [(PXLivePhotoTrimScrubber *)self snapTrimEndTimes];
LABEL_9:
      CGFloat v5 = (void *)v4;
      goto LABEL_11;
    }
    CGFloat v5 = 0;
  }
LABEL_11:
  return v5;
}

- (id)_snappingControllersForElement:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) < 2)
  {
    id v5 = (id)objc_opt_new();
    [v5 addObjectsFromArray:self->_keyTimeSnappingControllers];
    [v5 addObjectsFromArray:self->_focusEventSnappingControllers];
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    uint64_t v4 = 464;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    uint64_t v4 = 472;
LABEL_7:
    id v5 = *(id *)((char *)&self->super.super.super.isa + v4);
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_9:
  return v5;
}

- (void)_updateFocusEventSnappingControllers
{
  id v5 = self->_focusEventTimes;
  char v3 = [(id)objc_opt_class() _createSnappingControllersForKeytimes:v5];
  focusEventSnappingControllers = self->_focusEventSnappingControllers;
  self->_focusEventSnappingControllers = v3;
}

- (void)_updateEndTimeSnappingControllers
{
  id v5 = [(PXLivePhotoTrimScrubber *)self snapTrimEndTimes];
  char v3 = [(id)objc_opt_class() _createSnappingControllersForKeytimes:v5];
  endTimeSnappingControllers = self->_endTimeSnappingControllers;
  self->_endTimeSnappingControllers = v3;
}

- (void)_updateStartTimeSnappingControllers
{
  id v5 = [(PXLivePhotoTrimScrubber *)self snapTrimStartTimes];
  char v3 = [(id)objc_opt_class() _createSnappingControllersForKeytimes:v5];
  startTimeSnappingControllers = self->_startTimeSnappingControllers;
  self->_startTimeSnappingControllers = v3;
}

- (void)_updateKeyTimeSnappingControllers
{
  char v3 = [(PXLivePhotoTrimScrubber *)self snapKeyTimes];
  [(PXLivePhotoTrimScrubber *)self suggestedKeyTime];
  if (v9[36])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F29238];
    [(PXLivePhotoTrimScrubber *)self suggestedKeyTime];
    id v5 = [v4 valueWithCMTime:v9];
    uint64_t v6 = [v3 arrayByAddingObject:v5];

    char v3 = (void *)v6;
  }
  CGFloat v7 = [(id)objc_opt_class() _createSnappingControllersForKeytimes:v3];
  keyTimeSnappingControllers = self->_keyTimeSnappingControllers;
  self->_keyTimeSnappingControllers = v7;
}

- (void)_setContentAspectRatio:(double)a3
{
  if (self->__contentAspectRatio != a3
    || ([(PXLivePhotoTrimScrubberLoupeView *)self->_photoLoupe aspectRatio], v5 != a3))
  {
    self->__contentAspectRatio = a3;
    [(PXLivePhotoTrimScrubberLoupeView *)self->_photoLoupe setAspectRatio:a3];
    [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
  }
}

- (void)_updateContentAspectRatio
{
  char v3 = [(PXLivePhotoTrimScrubber *)self videoComposition];
  uint64_t v4 = [(PXLivePhotoTrimScrubber *)self asset];
  double v5 = v4;
  if (v3)
  {
    [v3 renderSize];
    double v8 = v6 / v7;
    BOOL v9 = v7 == 0.0;
LABEL_3:
    if (v9) {
      double v10 = 1.0;
    }
    else {
      double v10 = v8;
    }
    goto LABEL_17;
  }
  CGFloat v11 = [v4 tracks];

  if (!v11)
  {
    v18 = [(PXLivePhotoTrimScrubber *)self placeholderImage];

    if (!v18)
    {
      double v10 = 1.0;
      goto LABEL_17;
    }
    v19 = [(PXLivePhotoTrimScrubber *)self placeholderImage];
    [v19 size];
    double v21 = v20;
    double v23 = v22;

    double v8 = v21 / v23;
    BOOL v9 = v23 == 0.0;
    goto LABEL_3;
  }
  CGFloat v12 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v5];
  CGFloat v13 = [v12 firstObject];

  if (v13)
  {
    [v13 naturalSize];
    double v15 = v14;
    double v17 = v16;
    memset(v25, 0, sizeof(v25));
    [v13 preferredTransform];
    v26.size.CGFloat width = v17 * 0.0 + 0.0 * v15;
    v26.size.CGFloat height = v26.size.width;
    v26.origin.CGFloat x = 0.0;
    v26.origin.CGFloat y = 0.0;
    CGRect v27 = CGRectStandardize(v26);
    if (v27.size.height == 0.0) {
      double v10 = 1.0;
    }
    else {
      double v10 = v27.size.width / v27.size.height;
    }
  }
  else
  {
    CGFloat v24 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_DEFAULT, "Did not find a video track falling back to 1.0 aspectRatio", (uint8_t *)v25, 2u);
    }

    double v10 = 1.0;
  }

LABEL_17:
  [(PXLivePhotoTrimScrubber *)self _setContentAspectRatio:v10];
}

- (void)_setUntrimmedDuration:(id *)a3
{
  p_untrimmedDuration = &self->_untrimmedDuration;
  CMTime time1 = *(CMTime *)a3;
  CMTime time2 = (CMTime)self->_untrimmedDuration;
  if (CMTimeCompare(&time1, &time2))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_untrimmedDuration->epoch = a3->var3;
    *(_OWORD *)&p_untrimmedDuration->value = v6;
    long long v11 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    double v7 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
    long long v9 = v11;
    int64_t v10 = var3;
    [v7 setDuration:&v9];

    if ((a3->var2 & 1) == 0)
    {
      [(PXLivePhotoTrimScrubber *)self _setPhotoLoupeHidden:1 animated:0];
      [(PXLivePhotoTrimScrubber *)self _setTrimControlsHidden:1 animated:0];
      self->_hasPresentedControls = 0;
    }
    [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
    if (self->_delegateFlags.respondsToAssetDurationDidChange)
    {
      double v8 = [(PXLivePhotoTrimScrubber *)self delegate];
      [v8 trimScrubberAssetDurationDidChange:self];
    }
    [(PXLivePhotoTrimScrubber *)self _presentControlsIfNeeded];
  }
}

- (void)_assetDidLoadValues
{
  char v3 = [(PXLivePhotoTrimScrubber *)self asset];
  uint64_t v4 = v3;
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  if (v3) {
    [v3 duration];
  }
  long long v5 = v7;
  uint64_t v6 = v8;
  [(PXLivePhotoTrimScrubber *)self _setUntrimmedDuration:&v5];
  [(PXLivePhotoTrimScrubber *)self _updateContentAspectRatio];
}

- (void)handleEndTracking:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(PXLivePhotoTrimScrubber *)self _trackingElement];
  [(PXLivePhotoTrimScrubber *)self _setTrackingElement:0];
  if (v5)
  {
    if (v5 == 3)
    {
      photoLoupe = self->_photoLoupe;
      [(PXLivePhotoTrimScrubber *)self keyTime];
      [(PXLivePhotoTrimScrubberLoupeView *)photoLoupe setShowLoupeThumbnailWithFrameTime:v17 animate:1];
    }
    if (self->_delegateFlags.respondsToDidEndInteractivelyEditingElement)
    {
      long long v7 = [(PXLivePhotoTrimScrubber *)self delegate];
      [v7 trimScrubber:self didEndInteractivelyEditingElement:v5 successful:v3];
    }
  }
  uint64_t v8 = [(PXLivePhotoTrimScrubber *)self _snappingControllersForElement:v5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) interactionEnded];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
  [(PXLivePhotoTrimScrubber *)self _updateZoomState:0];
  if ([(PXLivePhotoTrimScrubber *)self playheadStyle]) {
    [(PXLivePhotoTrimScrubber *)self _setPhotoLoupeHidden:0 animated:1];
  }
}

- (void)handleChangeTrackingAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  CGFloat x = a4.x;
  double y = a3.y;
  double v6 = a3.x;
  int64_t v8 = [(PXLivePhotoTrimScrubber *)self _trackingElement];
  memset(&v27, 0, sizeof(v27));
  -[PXLivePhotoTrimScrubber _timeAtLocation:forElement:](self, "_timeAtLocation:forElement:", v8, v6, y);
  uint64_t v9 = [(PXLivePhotoTrimScrubber *)self _snappingControllersForElement:v8];
  uint64_t v10 = [(PXLivePhotoTrimScrubber *)self _snapTimesForElement:v8];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  Float64 Seconds = 0.0;
  CMTime time = v27;
  Float64 Seconds = CMTimeGetSeconds(&time);
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  double v23 = &unk_1AB5D584F;
  CMTime v24 = v27;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PXLivePhotoTrimScrubber_handleChangeTrackingAtLocation_withVelocity___block_invoke;
  v17[3] = &unk_1E5DCD8B0;
  uint64_t v19 = v25;
  CGFloat v21 = x;
  id v11 = v10;
  id v18 = v11;
  p_CMTime time = &time;
  [v9 enumerateObjectsUsingBlock:v17];
  long long v13 = *(_OWORD *)(*(void *)&time.timescale + 32);
  uint64_t v14 = *(void *)(*(void *)&time.timescale + 48);
  [(PXLivePhotoTrimScrubber *)self _clampTimeToViewportIfZoomed:&v13];
  uint64_t v12 = *(void *)&time.timescale;
  *(_OWORD *)(*(void *)&time.timescale + 32) = v15;
  *(void *)(v12 + 48) = v16;
  switch(v8)
  {
    case 1:
      long long v13 = v15;
      uint64_t v14 = v16;
      [(PXLivePhotoTrimScrubber *)self setTrimStartTime:&v13];
      break;
    case 2:
      long long v13 = v15;
      uint64_t v14 = v16;
      [(PXLivePhotoTrimScrubber *)self setTrimEndTime:&v13];
      break;
    case 3:
      long long v13 = v15;
      uint64_t v14 = v16;
      [(PXLivePhotoTrimScrubber *)self _setKeyTime:&v13 canHaveImpact:1 forElement:3];
      break;
    case 4:
      long long v13 = v15;
      uint64_t v14 = v16;
      [(PXLivePhotoTrimScrubber *)self _setKeyTime:&v13 canHaveImpact:1 forElement:4];
      break;
    default:
      break;
  }

  _Block_object_dispose(&time, 8);
  _Block_object_dispose(v25, 8);
}

void __71__PXLivePhotoTrimScrubber_handleChangeTrackingAtLocation_withVelocity___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  char v10 = 0;
  [a2 updateOffset:*(void *)(*(void *)(a1 + 40) + 8) + 24 withVelocity:&v10 shouldSnap:0 shouldBreak:*(double *)(a1 + 56)];
  if (v10)
  {
    long long v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    int64_t v8 = v7;
    if (v7) {
      [v7 CMTimeValue];
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    *(_OWORD *)(v9 + 32) = 0uLL;
    *(void *)(v9 + 48) = 0;
    *a4 = 1;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampTimeToViewportIfZoomed:(SEL)a3
{
  *retstr = *a4;
  CGRect result = [(PXLivePhotoTrimScrubber *)self state];
  if (result == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)2)
  {
    memset(&v14, 0, sizeof(v14));
    [(PXLivePhotoTrimScrubber *)self viewportMinTime];
    [(PXLivePhotoTrimScrubber *)self viewportMaxTime];
    CMTimeRangeFromTimeToTime(&v14, &start, &end);
    long long v8 = *(_OWORD *)&a4->var0;
    time.epoch = a4->var3;
    CMTimeRange v9 = v14;
    *(_OWORD *)&time.value = v8;
    CGRect result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeClampToRange(&v11, &time, &v9);
    *(CMTime *)retstr = v11;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)viewportMaxTime
{
  id v8 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  int64_t v5 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  [v5 viewportFrame];
  double MaxX = CGRectGetMaxX(v10);
  if (v8)
  {
    [v8 timeForOffsetInScrubberSpace:MaxX];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->int64_t var3 = 0;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)viewportMinTime
{
  id v8 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  int64_t v5 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  [v5 viewportFrame];
  double MinX = CGRectGetMinX(v10);
  if (v8)
  {
    [v8 timeForOffsetInScrubberSpace:MinX];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->int64_t var3 = 0;
  }

  return result;
}

- (void)handleBeginTrackingAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  double v6 = [(PXLivePhotoTrimScrubber *)self spec];
  [v6 handleWidth];
  double v8 = v7;
  [v6 handleAnchorX];
  double v10 = v8 * v9;
  [v6 handleTouchDistance];
  double v12 = v11;
  [(PXLivePhotoTrimScrubberLoupeView *)self->_photoLoupe center];
  double v14 = vabdd_f64(x, v13);
  [(UIImageView *)self->_trimStartHandle frame];
  double v15 = vabdd_f64(x, v10 + CGRectGetMinX(v45));
  [(UIImageView *)self->_trimEndHandle frame];
  double v16 = vabdd_f64(x, CGRectGetMaxX(v46) - v10);
  if ([(PXLivePhotoTrimScrubber *)self playheadStyle] == 2 && v14 < v12) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 0;
  }
  BOOL v24 = [(PXLivePhotoTrimScrubber *)self playheadStyle] != 1 || v14 >= v12;
  uint64_t v18 = 4;
  if (v24) {
    uint64_t v18 = v17;
  }
  BOOL v19 = v16 < v12;
  if (v16 >= v15) {
    BOOL v19 = 0;
  }
  BOOL v20 = v16 < v14;
  if (v15 < v12 && v15 < v14) {
    uint64_t v18 = 1;
  }
  if (v19 && v20) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = v18;
  }
  [(PXLivePhotoTrimScrubber *)self _setPhotoLoupeHidden:(v19 && v20) | (v15 < v12 && v15 < v14) animated:1];
  int v22 = 0;
  if ([(PXLivePhotoTrimScrubber *)self playheadStyle] == 2 && !v21)
  {
    int v22 = [v6 fallbackToKeyTimeTracking];
    if (v22) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = 0;
    }
  }
  unint64_t v23 = [(PXLivePhotoTrimScrubber *)self playheadStyle];
  if (v21) {
    BOOL v24 = 0;
  }
  else {
    BOOL v24 = v23 == 1;
  }
  if (v24)
  {
    int v25 = [v6 fallbackToPlayheadTracking];
    if (v25) {
      uint64_t v21 = 4;
    }
    else {
      uint64_t v21 = 0;
    }
  }
  else
  {
    int v25 = 0;
  }
  if (!self->_delegateFlags.respondsToCanBeginInteractivelyEditingElement
    || ([(PXLivePhotoTrimScrubber *)self delegate],
        CGRect v26 = objc_claimAutoreleasedReturnValue(),
        int v27 = [v26 trimScrubber:self canBeginInteractivelyEditingElement:v21],
        v26,
        v27))
  {
    [(PXLivePhotoTrimScrubber *)self _setTrackingElement:v21];
    double v28 = [(PXLivePhotoTrimScrubber *)self _snappingControllersForElement:v21];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * i) interactionBegan];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v30);
    }
    if ((v22 | v25) == 1)
    {
      long long v37 = 0uLL;
      uint64_t v38 = 0;
      -[PXLivePhotoTrimScrubber _timeAtLocation:forElement:](self, "_timeAtLocation:forElement:", v21, x, y);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __57__PXLivePhotoTrimScrubber_handleBeginTrackingAtLocation___block_invoke;
      v34[3] = &unk_1E5DD3630;
      long long v35 = v37;
      uint64_t v36 = v38;
      v34[4] = self;
      v34[5] = v21;
      [(PXLivePhotoTrimScrubber *)self _animateChanges:v34];
    }
    if (v21 && self->_delegateFlags.respondsToDidBeginInteractivelyEditingElement)
    {
      v33 = [(PXLivePhotoTrimScrubber *)self delegate];
      [v33 trimScrubber:self didBeginInteractivelyEditingElement:v21];
    }
    [(PXLivePhotoTrimScrubber *)self _setupZoom];
    [(PXLivePhotoTrimScrubber *)self prepareForImpact];
  }
}

uint64_t __57__PXLivePhotoTrimScrubber_handleBeginTrackingAtLocation___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  [v2 _setKeyTime:&v6 canHaveImpact:1 forElement:v3];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 408);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v4 setFrameTime:&v6];
}

- (void)_setTrackingElement:(int64_t)a3
{
  if (self->__trackingElement != a3)
  {
    self->__trackingElement = a3;
    if (a3 == 3) {
      [(PXLivePhotoTrimScrubberLoupeView *)self->_photoLoupe setShowLoupePlayerAnimate:0];
    }
  }
}

- (void)handleLongPressWithElement:(int64_t)a3
{
  BOOL v5 = [(PXLivePhotoTrimScrubber *)self allowZoom];
  if (a3 == 4 && v5)
  {
    if (self->_delegateFlags.respondsToPausePlayer)
    {
      long long v6 = [(PXLivePhotoTrimScrubber *)self delegate];
      [v6 trimScrubberPausePlayer:self];
    }
    [(PXLivePhotoTrimScrubber *)self keyTime];
    [(PXLivePhotoTrimScrubber *)self _zoomAtTime:v7];
  }
}

- (void)handleTapWithElement:(int64_t)a3
{
  if (self->_delegateFlags.respondsToDidBeginInteractivelyEditingElement)
  {
    id v5 = [(PXLivePhotoTrimScrubber *)self delegate];
    [v5 trimScrubber:self didTapElement:a3];
  }
}

- (void)handleSetKeyTime:(id *)a3
{
  if ([(PXLivePhotoTrimScrubber *)self playheadStyle] == 2)
  {
    if (self->_delegateFlags.respondsToDidBeginInteractivelyEditingElement)
    {
      id v5 = [(PXLivePhotoTrimScrubber *)self delegate];
      [v5 trimScrubber:self didBeginInteractivelyEditingElement:3];
    }
    [(PXLivePhotoTrimScrubber *)self _setTrackingElement:3];
    CMTime time1 = (CMTime)self->_trimStartTime;
    CMTime time2 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMTime time1 = (CMTime)self->_trimEndTime;
      CMTime time2 = (CMTime)*a3;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __44__PXLivePhotoTrimScrubber_handleSetKeyTime___block_invoke;
        v7[3] = &unk_1E5DD01C8;
        v7[4] = self;
        long long v8 = *(_OWORD *)&a3->var0;
        int64_t var3 = a3->var3;
        [(PXLivePhotoTrimScrubber *)self performAnimatedChanges:v7];
      }
    }
    [(PXLivePhotoTrimScrubber *)self _setTrackingElement:0];
    if (self->_delegateFlags.respondsToDidEndInteractivelyEditingElement)
    {
      long long v6 = [(PXLivePhotoTrimScrubber *)self delegate];
      [v6 trimScrubber:self didEndInteractivelyEditingElement:3 successful:1];
    }
  }
}

uint64_t __44__PXLivePhotoTrimScrubber_handleSetKeyTime___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  return [*(id *)(a1 + 32) setKeyTime:&v2];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeAtLocation:(SEL)a3 forElement:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v16 = [(PXLivePhotoTrimScrubber *)self spec];
  [v16 handleWidth];
  double v11 = v10;
  [v16 handleAnchorX];
  double v13 = v11 * (1.0 - v12);
  if (a5 == 2)
  {
    double v14 = -v13;
  }
  else
  {
    double v14 = 0.0;
    if (a5 == 1) {
      double v14 = v13;
    }
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  -[PXLivePhotoTrimScrubber timeAtPoint:](self, "timeAtPoint:", x + v14, y);

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtPoint:(SEL)a3
{
  double x = a4.x;
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  long long v6 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  if (v6)
  {
    long long v8 = v6;
    [v6 timeForOffsetInScrubberSpace:x];
    long long v6 = v8;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->int64_t var3 = 0;
  }

  return result;
}

- (double)offsetForTime:(id *)a3
{
  uint64_t v4 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  [v4 offsetInScrubberSpaceForTime:&v8];
  double v6 = v5;

  return v6;
}

- (double)_offsetForTime:(id *)a3
{
  memset(&v20, 0, sizeof(v20));
  [(PXLivePhotoTrimScrubber *)self untrimmedDuration];
  double v5 = 0.0;
  if ((unsigned __int128)0 >> 96 == 1 && (a3->var2 & 0x1D) == 1)
  {
    CMTime time1 = v20;
    double v6 = (CMTime *)MEMORY[0x1E4F1FA48];
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      CMTime time2 = (CMTime)*a3;
      CMTime v17 = v20;
      CMTimeMinimum(&time1, &time2, &v17);
      CMTimeEpoch epoch = time1.epoch;
      *(CMTime *)a3 = time1;
      *(_OWORD *)&time2.value = *(_OWORD *)&a3->var0;
      time2.CMTimeEpoch epoch = epoch;
      CMTime v17 = *v6;
      CMTimeMaximum(&time1, &time2, &v17);
      *(CMTime *)a3 = time1;
      [(PXLivePhotoTrimScrubber *)self bounds];
      double Width = CGRectGetWidth(v21);
      [(PXLivePhotoTrimScrubber *)self horizontalInset];
      double v10 = v9;
      double v11 = [(PXLivePhotoTrimScrubber *)self spec];
      [v11 handleWidth];
      double v13 = v10 + v12;
      double v14 = Width + v13 * -2.0;
      CMTime time1 = (CMTime)*a3;
      double Seconds = CMTimeGetSeconds(&time1);
      CMTime time1 = v20;
      double v5 = v13 + Seconds / CMTimeGetSeconds(&time1) * v14;
    }
  }
  return v5;
}

- (void)setShowVideoScrubberDebugOverlay:(BOOL)a3
{
  if (self->_showVideoScrubberDebugOverlay != a3)
  {
    self->_showVideoScrubberDebugOverladouble y = a3;
    if (a3)
    {
      uint64_t v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      debugStartTimeView = self->_debugStartTimeView;
      self->_debugStartTimeView = v4;

      [(UIView *)self->_debugStartTimeView setUserInteractionEnabled:0];
      double v6 = [MEMORY[0x1E4FB1618] redColor];
      [(UIView *)self->_debugStartTimeView setBackgroundColor:v6];

      [(PXLivePhotoTrimScrubber *)self addSubview:self->_debugStartTimeView];
      uint64_t v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      debugLoupeTimeView = self->_debugLoupeTimeView;
      self->_debugLoupeTimeView = v7;

      [(UIView *)self->_debugLoupeTimeView setUserInteractionEnabled:0];
      double v9 = [MEMORY[0x1E4FB1618] greenColor];
      [(UIView *)self->_debugLoupeTimeView setBackgroundColor:v9];

      [(PXLivePhotoTrimScrubber *)self addSubview:self->_debugLoupeTimeView];
      double v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      debugEndTimeView = self->_debugEndTimeView;
      self->_debugEndTimeView = v10;

      [(UIView *)self->_debugEndTimeView setUserInteractionEnabled:0];
      double v12 = [MEMORY[0x1E4FB1618] blueColor];
      [(UIView *)self->_debugEndTimeView setBackgroundColor:v12];

      double v13 = self->_debugEndTimeView;
      [(PXLivePhotoTrimScrubber *)self addSubview:v13];
    }
    else
    {
      [(UIView *)self->_debugStartTimeView removeFromSuperview];
      double v14 = self->_debugStartTimeView;
      self->_debugStartTimeView = 0;

      [(UIView *)self->_debugLoupeTimeView removeFromSuperview];
      double v15 = self->_debugLoupeTimeView;
      self->_debugLoupeTimeView = 0;

      [(UIView *)self->_debugEndTimeView removeFromSuperview];
      id v16 = self->_debugEndTimeView;
      self->_debugEndTimeView = 0;
    }
  }
}

- (void)_updateSpecDependentUI
{
  [(PXLivePhotoTrimScrubber *)self invalidateIntrinsicContentSize];
  [(PXLivePhotoTrimScrubberSpec *)self->_spec filmstripCornerRadius];
  double v4 = v3;
  double v5 = [(UIView *)self->_filmstripContainerView layer];
  [v5 setCornerRadius:v4];

  [(PXLivePhotoTrimScrubberSpec *)self->_spec loupeOuterCornerRadius];
  -[PXLivePhotoTrimScrubberLoupeView setOuterCornerRadius:](self->_photoLoupe, "setOuterCornerRadius:");
  [(PXLivePhotoTrimScrubberSpec *)self->_spec loupeInnerCornerRadius];
  -[PXLivePhotoTrimScrubberLoupeView setInnerCornerRadius:](self->_photoLoupe, "setInnerCornerRadius:");
  [(PXLivePhotoTrimScrubberSpec *)self->_spec loupeVerticalInset];
  -[PXLivePhotoTrimScrubberLoupeView setVerticalInset:](self->_photoLoupe, "setVerticalInset:");
  double v6 = [(PXLivePhotoTrimScrubberSpec *)self->_spec filmstripBorderColor];

  if (v6)
  {
    id v7 = [(PXLivePhotoTrimScrubberSpec *)self->_spec filmstripBorderColor];
    uint64_t v8 = [v7 CGColor];
    double v9 = [(UIView *)self->_filmstripContainerView layer];
    [v9 setBorderColor:v8];

    id v10 = [(UIView *)self->_filmstripContainerView layer];
    [v10 setBorderWidth:1.0];
  }
}

- (void)_PXLivePhotoTrimScrubber_commonInit
{
  [(PXLivePhotoTrimScrubber *)self setClipsToBounds:1];
  double v3 = [MEMORY[0x1E4FB1618] clearColor];
  [(PXLivePhotoTrimScrubber *)self setBackgroundColor:v3];

  self->_state = 0;
  self->__contentAspectRatio = 1.0;
  CMTimeMake(&v42, 1, 2);
  self->_minimumTrimLength = ($95D729B680665BEAEFA1D6FCA8238556)v42;
  CMTimeMake(&v42, 1, 240);
  *(CMTime *)(&self->_hasPresentedControls + 4) = v42;
  uint64_t v4 = MEMORY[0x1E4F1F9F8];
  long long v5 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_keyTime.value = *MEMORY[0x1E4F1F9F8];
  int64_t v6 = *(void *)(v4 + 16);
  self->_keyTime.CMTimeEpoch epoch = v6;
  *(_OWORD *)&self->_trimStartTime.value = v5;
  self->_trimStartTime.CMTimeEpoch epoch = v6;
  *(_OWORD *)&self->_trimEndTime.value = v5;
  self->_trimEndTime.CMTimeEpoch epoch = v6;
  self->_playheadStyle = 2;
  id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v12 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
  filmstripContainerView = self->_filmstripContainerView;
  self->_filmstripContainerView = v12;

  [(PXLivePhotoTrimScrubber *)self addSubview:self->_filmstripContainerView];
  double v14 = (PXLivePhotoTrimScrubberFilmStripView *)objc_msgSend(objc_alloc(-[PXLivePhotoTrimScrubber filmStripViewClass](self, "filmStripViewClass")), "initWithFrame:", v8, v9, v10, v11);
  filmstripView = self->_filmstripView;
  self->_filmstripView = v14;

  if (objc_opt_respondsToSelector()) {
    [(PXLivePhotoTrimScrubberFilmStripView *)self->_filmstripView setUseContentAspectRatio:1];
  }
  if (objc_opt_respondsToSelector()) {
    [(PXLivePhotoTrimScrubberFilmStripView *)self->_filmstripView setUserInteractionEnabled:0];
  }
  if (objc_opt_respondsToSelector()) {
    [(PXLivePhotoTrimScrubberFilmStripView *)self->_filmstripView setPreserveThumbnailsDuringReload:1];
  }
  if (objc_opt_respondsToSelector()) {
    [(PXLivePhotoTrimScrubberFilmStripView *)self->_filmstripView setGeneratesPlaceholderImage:1];
  }
  [(UIView *)self->_filmstripContainerView addSubview:self->_filmstripView];
  id v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v8, v9, v10, v11);
  preTrimOverlayView = self->_preTrimOverlayView;
  self->_preTrimOverlayView = v16;

  uint64_t v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  [(UIView *)self->_preTrimOverlayView setBackgroundColor:v18];

  [(UIView *)self->_filmstripContainerView addSubview:self->_preTrimOverlayView];
  BOOL v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v8, v9, v10, v11);
  postTrimOverlayView = self->_postTrimOverlayView;
  self->_postTrimOverlayView = v19;

  CGRect v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  [(UIView *)self->_postTrimOverlayView setBackgroundColor:v21];

  [(UIView *)self->_filmstripContainerView addSubview:self->_postTrimOverlayView];
  int v22 = [(id)objc_opt_class() trimStartImage];
  unint64_t v23 = [(id)objc_opt_class() trimStartHighlightedImage];
  BOOL v24 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v22 highlightedImage:v23];
  trimStartHandle = self->_trimStartHandle;
  self->_trimStartHandle = v24;

  [(UIImageView *)self->_trimStartHandle setContentMode:0];
  [(PXLivePhotoTrimScrubber *)self addSubview:self->_trimStartHandle];
  CGRect v26 = [(id)objc_opt_class() trimEndImage];
  int v27 = [(id)objc_opt_class() trimEndHighlightedImage];
  double v28 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v26 highlightedImage:v27];
  trimEndHandle = self->_trimEndHandle;
  self->_trimEndHandle = v28;

  [(UIImageView *)self->_trimEndHandle setContentMode:0];
  [(PXLivePhotoTrimScrubber *)self addSubview:self->_trimEndHandle];
  uint64_t v30 = -[PXLivePhotoTrimScrubberLoupeView initWithFrame:forceDarkUserInterfaceStyle:]([PXLivePhotoTrimScrubberLoupeView alloc], "initWithFrame:forceDarkUserInterfaceStyle:", self->_traitCollection == 0, v8, v9, v10, v11);
  photoLoupe = self->_photoLoupe;
  self->_photoLoupe = v30;

  [(PXLivePhotoTrimScrubber *)self addSubview:self->_photoLoupe];
  [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
  objc_initWeak((id *)&v42, self);
  double v32 = [PXLivePhotoTrimScrubberHiddenAnimationHelper alloc];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __62__PXLivePhotoTrimScrubber__PXLivePhotoTrimScrubber_commonInit__block_invoke;
  v40[3] = &unk_1E5DCE660;
  objc_copyWeak(&v41, (id *)&v42);
  v33 = [(PXLivePhotoTrimScrubberHiddenAnimationHelper *)v32 initWithAnimationBlock:v40];
  loupeHiddenHelper = self->_loupeHiddenHelper;
  self->_loupeHiddenHelper = v33;

  long long v35 = [PXLivePhotoTrimScrubberHiddenAnimationHelper alloc];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __62__PXLivePhotoTrimScrubber__PXLivePhotoTrimScrubber_commonInit__block_invoke_2;
  v38[3] = &unk_1E5DCE660;
  objc_copyWeak(&v39, (id *)&v42);
  uint64_t v36 = [(PXLivePhotoTrimScrubberHiddenAnimationHelper *)v35 initWithAnimationBlock:v38];
  trimControlHiddenHelper = self->_trimControlHiddenHelper;
  self->_trimControlHiddenHelper = v36;

  [(PXLivePhotoTrimScrubber *)self _updateSpecDependentUI];
  [(PXLivePhotoTrimScrubber *)self _setPhotoLoupeHidden:1 animated:0];
  [(PXLivePhotoTrimScrubber *)self _setTrimControlsHidden:1 animated:0];
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)&v42);
}

void __62__PXLivePhotoTrimScrubber__PXLivePhotoTrimScrubber_commonInit__block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    double v2 = 0.0;
  }
  else {
    double v2 = 1.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained photoLoupe];
  [v3 setAlpha:v2];
}

void __62__PXLivePhotoTrimScrubber__PXLivePhotoTrimScrubber_commonInit__block_invoke_2(uint64_t a1, int a2)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  if (a2) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  id v4 = objc_loadWeakRetained(&to);
  long long v5 = [v4 trimEndHandle];
  [v5 setAlpha:v3];

  id v6 = objc_loadWeakRetained(&to);
  id v7 = [v6 trimStartHandle];
  [v7 setAlpha:v3];

  id v8 = objc_loadWeakRetained(&to);
  double v9 = [v8 _preTrimOverlayView];
  [v9 setAlpha:v3];

  id v10 = objc_loadWeakRetained(&to);
  double v11 = [v10 _postTrimOverlayView];
  [v11 setAlpha:v3];

  objc_destroyWeak(&to);
}

- (void)_zoomAtTime:(id *)a3
{
  [(PXLivePhotoTrimScrubber *)self setState:2];
  long long v5 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  [v5 setFilmstripScale:5.0];

  CMTime time = *(CMTime *)a3;
  double Seconds = CMTimeGetSeconds(&time);
  id v7 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  id v8 = v7;
  if (v7) {
    [v7 duration];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  double v9 = Seconds / CMTimeGetSeconds(&v12);
  id v10 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  [v10 setPivotAnchor:v9];

  [(PXLivePhotoTrimScrubber *)self impactOccured];
  [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__PXLivePhotoTrimScrubber__zoomAtTime___block_invoke;
  v11[3] = &unk_1E5DD36F8;
  v11[4] = self;
  [(PXLivePhotoTrimScrubber *)self _animateChanges:v11];
}

void __39__PXLivePhotoTrimScrubber__zoomAtTime___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 447))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 688));
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      [*(id *)(a1 + 32) viewportMinTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      [v6 viewportMaxTime];
    }
    else {
      memset(&v7, 0, sizeof(v7));
    }
    [WeakRetained trimScrubber:v4 didZoomToMinimumValue:Seconds maximumValue:CMTimeGetSeconds(&v7)];
  }
}

- (void)_zoomAtTrackedElement
{
  int64_t v3 = [(PXLivePhotoTrimScrubber *)self _trackingElement];
  if (v3)
  {
    long long v6 = 0uLL;
    uint64_t v7 = 0;
    [(PXLivePhotoTrimScrubber *)self timeForElement:v3];
    long long v4 = v6;
    uint64_t v5 = v7;
    [(PXLivePhotoTrimScrubber *)self _zoomAtTime:&v4];
  }
}

- (void)_zoomDelayed
{
  if ([(PXLivePhotoTrimScrubber *)self allowZoom] && [(PXLivePhotoTrimScrubber *)self state] == 1)
  {
    [(PXLivePhotoTrimScrubber *)self _zoomAtTrackedElement];
  }
}

- (void)_updateZoomState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXLivePhotoTrimScrubber *)self allowZoom])
  {
    int64_t v5 = [(PXLivePhotoTrimScrubber *)self state];
    if (v3)
    {
      if (v5 == 1)
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__zoomDelayed object:0];
        [(PXLivePhotoTrimScrubber *)self performSelector:sel__zoomDelayed withObject:0 afterDelay:0.5];
      }
    }
    else if (v5 == 1 || [(PXLivePhotoTrimScrubber *)self state] == 2)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__zoomDelayed object:0];
      [(PXLivePhotoTrimScrubber *)self unzoom];
    }
  }
}

- (void)_setupZoom
{
  if ([(PXLivePhotoTrimScrubber *)self allowZoom] && ![(PXLivePhotoTrimScrubber *)self state])
  {
    [(PXLivePhotoTrimScrubber *)self performSelector:sel__zoomDelayed withObject:0 afterDelay:0.5];
    [(PXLivePhotoTrimScrubber *)self setState:1];
  }
}

- (void)updateTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
  [(PXLivePhotoTrimScrubber *)self _updateTrimHandles];
}

- (void)unzoom
{
  int64_t v3 = [(PXLivePhotoTrimScrubber *)self state];
  [(PXLivePhotoTrimScrubber *)self setState:0];
  if (v3 == 2)
  {
    long long v4 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
    [v4 setFilmstripScale:1.0];

    int64_t v5 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
    [v5 setPivotAnchor:0.5];

    [(PXLivePhotoTrimScrubber *)self impactOccured];
    [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__PXLivePhotoTrimScrubber_unzoom__block_invoke;
    v6[3] = &unk_1E5DD36F8;
    v6[4] = self;
    [(PXLivePhotoTrimScrubber *)self _animateChanges:v6];
  }
}

void __33__PXLivePhotoTrimScrubber_unzoom__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 448))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 688));
    [WeakRetained trimScrubberDidUnzoom:*(void *)(a1 + 32)];
  }
}

- (BOOL)tryZoomAtTime:(id *)a3
{
  BOOL v5 = [(PXLivePhotoTrimScrubber *)self allowZoom];
  if (v5)
  {
    if ([(PXLivePhotoTrimScrubber *)self state] == 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      long long v7 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      [(PXLivePhotoTrimScrubber *)self _zoomAtTime:&v7];
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    BOOL v4 = !a3;
    [(PXLivePhotoTrimScrubber *)self setUserInteractionEnabled:!a3];
    if (v4)
    {
      disabledOverlayView = self->_disabledOverlayView;
      if (!disabledOverlayView) {
        return;
      }
      CMTime v20 = disabledOverlayView;
      CGRect v21 = self->_disabledOverlayView;
      self->_disabledOverlayView = 0;

      int v22 = (void *)MEMORY[0x1E4FB1EB0];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke_2;
      void v25[3] = &unk_1E5DD36F8;
      CGRect v26 = v20;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke_3;
      v23[3] = &unk_1E5DD2188;
      BOOL v24 = v26;
      BOOL v5 = v26;
      [v22 animateWithDuration:v25 animations:v23 completion:0.25];

      uint64_t v18 = v26;
    }
    else
    {
      BOOL v5 = [(PXLivePhotoTrimScrubber *)self spec];
      [(PXLivePhotoTrimScrubber *)self _disabledOverlayFrame];
      id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
      double v11 = [(UIView *)v5 disabledOverlayColor];
      [v10 setBackgroundColor:v11];

      [v10 setAlpha:0.0];
      [(UIView *)v5 filmstripCornerRadius];
      double v13 = v12;
      double v14 = [v10 layer];
      [v14 setCornerRadius:v13];

      [(PXLivePhotoTrimScrubber *)self addSubview:v10];
      double v15 = (void *)MEMORY[0x1E4FB1EB0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke;
      v27[3] = &unk_1E5DD36F8;
      id v16 = v10;
      double v28 = v16;
      [v15 animateWithDuration:v27 animations:0.25];
      CMTime v17 = self->_disabledOverlayView;
      self->_disabledOverlayView = v16;
      uint64_t v18 = v16;
    }
  }
}

uint64_t __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __39__PXLivePhotoTrimScrubber_setDisabled___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (CGRect)loupeRect
{
  [(PXLivePhotoTrimScrubberLoupeView *)self->_photoLoupe frame];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)isAssetDurationLoaded
{
  return (self->_untrimmedDuration.flags & 0x1D) == 1;
}

- (double)horizontalOffsetForTime:(id *)a3
{
  double v4 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  [v4 offsetInScrubberSpaceForTime:&v8];
  double v6 = v5;

  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForElement:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  switch(a4)
  {
    case 1:
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self trimStartTime];
      goto LABEL_5;
    case 2:
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self trimEndTime];
      goto LABEL_5;
    case 3:
    case 4:
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self keyTime];
LABEL_5:
      *(_OWORD *)&retstr->var0 = v5;
      retstr->int64_t var3 = v6;
      break;
    default:
      return self;
  }
  return self;
}

- (int64_t)trimStatus
{
  return 0;
}

- (void)performAnimatedChanges:(id)a3
{
  ++self->_changeDepth;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  int64_t v4 = self->_changeDepth - 1;
  self->_changeDepth = v4;
  if (!v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__PXLivePhotoTrimScrubber_performAnimatedChanges___block_invoke;
    v5[3] = &unk_1E5DD36F8;
    v5[4] = self;
    [(PXLivePhotoTrimScrubber *)self _animateChanges:v5];
  }
}

uint64_t __50__PXLivePhotoTrimScrubber_performAnimatedChanges___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_animateChanges:(id)a3
{
  if (a3) {
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:a3 completion:0];
  }
}

- (void)_updateTrimHandles
{
  BOOL v3 = [(PXLivePhotoTrimScrubber *)self useMiniScrubber];
  int64_t v4 = [(PXLivePhotoTrimScrubber *)self spec];
  [v4 setUseMiniScrubberHeight:v3];

  if (self->_trimStartHandle && self->_trimEndHandle)
  {
    BOOL v5 = [(PXLivePhotoTrimScrubber *)self useMiniScrubber];
    int64_t v6 = objc_opt_class();
    if (v5) {
      [v6 trimStartImageMini];
    }
    else {
    double v7 = [v6 trimStartImage];
    }
    BOOL v8 = [(PXLivePhotoTrimScrubber *)self useMiniScrubber];
    double v9 = objc_opt_class();
    if (v8) {
      [v9 trimStartHighlightedImageMini];
    }
    else {
    id v10 = [v9 trimStartHighlightedImage];
    }
    [(UIImageView *)self->_trimStartHandle setImage:v7];
    [(UIImageView *)self->_trimStartHandle setHighlightedImage:v10];
    BOOL v11 = [(PXLivePhotoTrimScrubber *)self useMiniScrubber];
    double v12 = objc_opt_class();
    if (v11) {
      [v12 trimEndImageMini];
    }
    else {
    double v13 = [v12 trimEndImage];
    }
    BOOL v14 = [(PXLivePhotoTrimScrubber *)self useMiniScrubber];
    double v15 = objc_opt_class();
    if (v14) {
      [v15 trimEndHighlightedImageMini];
    }
    else {
    id v16 = [v15 trimEndHighlightedImage];
    }
    [(UIImageView *)self->_trimEndHandle setImage:v13];
    [(UIImageView *)self->_trimEndHandle setHighlightedImage:v16];
  }
  [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
}

- (void)setUseMiniScrubber:(BOOL)a3
{
  if (self->_useMiniScrubber != a3)
  {
    self->_useMiniScrubber = a3;
    [(PXLivePhotoTrimScrubber *)self _updateTrimHandles];
    [(PXLivePhotoTrimScrubber *)self _updateSpecDependentUI];
  }
}

- (void)setPlayheadStyle:(unint64_t)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(PXLivePhotoTrimScrubber *)self currentlyInteractingElement]
    && self->_playheadStyle != a3)
  {
    self->_playheadStyle = a3;
    switch(a3)
    {
      case 2uLL:
        [(PXLivePhotoTrimScrubber *)self _setPhotoLoupeHidden:0 animated:v4];
        photoLoupe = self->_photoLoupe;
        [(PXLivePhotoTrimScrubber *)self keyTime];
        [(PXLivePhotoTrimScrubberLoupeView *)photoLoupe setShowLoupeThumbnailWithFrameTime:v19 animate:v4];
        break;
      case 1uLL:
        [(PXLivePhotoTrimScrubber *)self _setPhotoLoupeHidden:0 animated:v4];
        BOOL v8 = self->_photoLoupe;
        double v9 = [(PXLivePhotoTrimScrubber *)self spec];
        [v9 playheadWidth];
        -[PXLivePhotoTrimScrubberLoupeView setShowNeedleWithWidth:animate:](v8, "setShowNeedleWithWidth:animate:", v4);

        break;
      case 0uLL:
        [(PXLivePhotoTrimScrubber *)self _setPhotoLoupeHidden:1 animated:v4];
        break;
    }
    [(PXLivePhotoTrimScrubber *)self _keyHandleRect];
    double v14 = v10;
    double v15 = v11;
    double v16 = v12;
    double v17 = v13;
    if (v4)
    {
      [MEMORY[0x1E4F39CF8] animationDuration];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __52__PXLivePhotoTrimScrubber_setPlayheadStyle_animate___block_invoke;
      v18[3] = &unk_1E5DD3630;
      v18[4] = self;
      *(double *)&v18[5] = v14;
      *(double *)&v18[6] = v15;
      *(double *)&v18[7] = v16;
      *(double *)&v18[8] = v17;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:completion:", v18, 0);
    }
    else
    {
      -[PXLivePhotoTrimScrubberLoupeView setFrame:](self->_photoLoupe, "setFrame:", v10, v11, v12, v13);
      [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
    }
  }
}

uint64_t __52__PXLivePhotoTrimScrubber_setPlayheadStyle_animate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(void **)(a1 + 32);
  return [v2 setNeedsLayout];
}

- (void)setPlayheadStyle:(unint64_t)a3
{
}

- (CGRect)_keyHandleRect
{
  BOOL v3 = [(PXLivePhotoTrimScrubber *)self spec];
  [v3 handleHeight];
  double v5 = v4;

  int64_t v6 = [(PXLivePhotoTrimScrubber *)self spec];
  [v6 playheadWidth];
  CGFloat v8 = v7;

  [(PXLivePhotoTrimScrubber *)self _contentAspectRatio];
  double v10 = v9;
  double v11 = [(PXLivePhotoTrimScrubber *)self spec];
  [v11 handleHeight];
  double v13 = v10 * v12;

  if ([(PXLivePhotoTrimScrubber *)self playheadStyle] != 1) {
    CGFloat v8 = v13;
  }
  [(PXLivePhotoTrimScrubber *)self bounds];
  v41.origin.CGFloat y = (CGRectGetHeight(v40) - v5) * 0.5;
  v41.origin.CGFloat x = 0.0;
  v41.size.CGFloat width = v8;
  v41.size.CGFloat height = v5;
  CGRect v42 = CGRectIntegral(v41);
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  CGFloat width = v42.size.width;
  CGFloat height = v42.size.height;
  long long v38 = 0uLL;
  uint64_t v39 = 0;
  [(PXLivePhotoTrimScrubber *)self keyTime];
  long long v36 = 0uLL;
  uint64_t v37 = 0;
  [(PXLivePhotoTrimScrubber *)self trimStartTime];
  long long v34 = 0uLL;
  uint64_t v35 = 0;
  [(PXLivePhotoTrimScrubber *)self trimEndTime];
  uint64_t v18 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  long long v32 = v36;
  uint64_t v33 = v37;
  [v18 offsetInScrubberSpaceForTime:&v32 fallbackAnchor:0.0];
  double v20 = v19;

  CGRect v21 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  long long v32 = v34;
  uint64_t v33 = v35;
  [v21 offsetInScrubberSpaceForTime:&v32 fallbackAnchor:1.0];
  double v23 = v22;

  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double v24 = CGRectGetWidth(v43);
  unint64_t v25 = [(PXLivePhotoTrimScrubber *)self playheadStyle];
  if (v24 > v23 - v20)
  {
    unint64_t v26 = v25;
    if ([(PXLivePhotoTrimScrubber *)self _trackingElement] == 2 && v26 == 2)
    {
LABEL_10:
      uint64_t v29 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
      long long v32 = *MEMORY[0x1E4F1FA48];
      uint64_t v33 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [v29 offsetInScrubberSpaceForTime:&v32 fallbackAnchor:0.0];
      uint64_t v30 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
      [(PXLivePhotoTrimScrubber *)self untrimmedDuration];
      [v30 offsetInScrubberSpaceForTime:v31 fallbackAnchor:1.0];
      v47.origin.CGFloat x = x;
      v47.origin.CGFloat y = y;
      v47.size.CGFloat width = width;
      v47.size.CGFloat height = height;
      CGRectGetWidth(v47);
      PXClamp();
    }
    if ([(PXLivePhotoTrimScrubber *)self _trackingElement] == 1
      && [(PXLivePhotoTrimScrubber *)self playheadStyle] == 2)
    {
      v44.origin.CGFloat x = x;
      v44.origin.CGFloat y = y;
      v44.size.CGFloat width = width;
      v44.size.CGFloat height = height;
      double v27 = CGRectGetWidth(v44);
      goto LABEL_10;
    }
  }
  double v28 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  long long v32 = v38;
  uint64_t v33 = v39;
  [v28 offsetInScrubberSpaceForTime:&v32 fallbackAnchor:0.5];

  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  CGRectGetWidth(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double v27 = v23 - CGRectGetWidth(v46);
  goto LABEL_10;
}

- (void)setTrimEndTime:(id *)a3
{
  memset(&v13, 0, sizeof(v13));
  p_trimStartTime = (CMTime *)&self->_trimStartTime;
  p_minimumTrimLength = (CMTime *)&self->_minimumTrimLength;
  [(PXLivePhotoTrimScrubber *)self untrimmedDuration];
  CMTime time1 = *p_minimumTrimLength;
  CMTimeMinimum(&rhs, &time1, &time2);
  CMTime time1 = *p_trimStartTime;
  CMTimeAdd(&v13, &time1, &rhs);
  CMTime time1 = *(CMTime *)a3;
  CMTime trimEndTime = v13;
  if (CMTimeCompare(&time1, &trimEndTime) < 0)
  {
    CMTime time1 = (CMTime)self->_trimEndTime;
    CMTime trimEndTime = v13;
    if (CMTimeCompare(&time1, &trimEndTime) >= 1) {
      [(PXLivePhotoTrimScrubber *)self _trimHandleDidReachBounds];
    }
    *(CMTime *)a3 = v13;
  }
  CMTime time1 = (CMTime)*a3;
  CMTime trimEndTime = (CMTime)self->_trimEndTime;
  if (CMTimeCompare(&time1, &trimEndTime))
  {
    long long v7 = *(_OWORD *)&a3->var0;
    self->_trimEndTime.CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&self->_trimEndTime.value = v7;
    if (self->_delegateFlags.respondsToDidChangeTimeForElement)
    {
      CGFloat v8 = [(PXLivePhotoTrimScrubber *)self delegate];
      [v8 trimScrubber:self didChangeTimeForElement:2];

      [(PXLivePhotoTrimScrubber *)self _updateZoomState:1];
    }
    [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
  }
}

- (void)setTrimStartTime:(id *)a3
{
  memset(&v13, 0, sizeof(v13));
  p_CMTime trimEndTime = (CMTime *)&self->_trimEndTime;
  p_minimumTrimLength = (CMTime *)&self->_minimumTrimLength;
  [(PXLivePhotoTrimScrubber *)self untrimmedDuration];
  CMTime time1 = *p_minimumTrimLength;
  CMTimeMinimum(&rhs, &time1, &time2);
  CMTime time1 = *p_trimEndTime;
  CMTimeSubtract(&v13, &time1, &rhs);
  CMTime time1 = *(CMTime *)a3;
  CMTime trimStartTime = v13;
  if (CMTimeCompare(&time1, &trimStartTime) >= 1)
  {
    CMTime time1 = (CMTime)self->_trimStartTime;
    CMTime trimStartTime = v13;
    if (CMTimeCompare(&time1, &trimStartTime) < 0) {
      [(PXLivePhotoTrimScrubber *)self _trimHandleDidReachBounds];
    }
    *(CMTime *)a3 = v13;
  }
  CMTime time1 = (CMTime)*a3;
  CMTime trimStartTime = (CMTime)self->_trimStartTime;
  if (CMTimeCompare(&time1, &trimStartTime))
  {
    long long v7 = *(_OWORD *)&a3->var0;
    self->_trimStartTime.CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&self->_trimStartTime.value = v7;
    if (self->_delegateFlags.respondsToDidChangeTimeForElement)
    {
      CGFloat v8 = [(PXLivePhotoTrimScrubber *)self delegate];
      [v8 trimScrubber:self didChangeTimeForElement:1];

      [(PXLivePhotoTrimScrubber *)self _updateZoomState:1];
    }
    [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
  }
}

- (void)setFocusEventTimes:(id)a3
{
  CGFloat v8 = (NSArray *)a3;
  double v4 = self->_focusEventTimes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      int64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      focusEventTimes = self->_focusEventTimes;
      self->_focusEventTimes = v6;

      [(PXLivePhotoTrimScrubber *)self _updateFocusEventSnappingControllers];
    }
  }
}

- (void)setSnapTrimEndTimes:(id)a3
{
  CGFloat v8 = (NSArray *)a3;
  double v4 = self->_snapTrimEndTimes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      int64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      snapTrimEndTimes = self->_snapTrimEndTimes;
      self->_snapTrimEndTimes = v6;

      [(PXLivePhotoTrimScrubber *)self _updateEndTimeSnappingControllers];
    }
  }
}

- (void)setSnapTrimStartTimes:(id)a3
{
  CGFloat v8 = (NSArray *)a3;
  double v4 = self->_snapTrimStartTimes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      int64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      snapTrimStartTimes = self->_snapTrimStartTimes;
      self->_snapTrimStartTimes = v6;

      [(PXLivePhotoTrimScrubber *)self _updateStartTimeSnappingControllers];
    }
  }
}

- (void)setSuggestedKeyTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 suggestedKeyTime = &self->_suggestedKeyTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 suggestedKeyTime = self->_suggestedKeyTime;
  if (CMTimeCompare(&time1, (CMTime *)&suggestedKeyTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_suggestedKeyTime->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_suggestedKeyTime->value = v6;
    [(PXLivePhotoTrimScrubber *)self _updateKeyTimeSnappingControllers];
  }
}

- (void)setSnapKeyTimes:(id)a3
{
  CGFloat v8 = (NSArray *)a3;
  double v4 = self->_snapKeyTimes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      long long v6 = (NSArray *)[(NSArray *)v8 copy];
      snapKeyTimes = self->_snapKeyTimes;
      self->_snapKeyTimes = v6;

      [(PXLivePhotoTrimScrubber *)self _updateKeyTimeSnappingControllers];
    }
  }
}

- (BOOL)isValidKeyTime:(id *)a3
{
  long long v11 = 0uLL;
  CMTimeEpoch v12 = 0;
  [(PXLivePhotoTrimScrubber *)self trimStartTime];
  memset(&v10, 0, sizeof(v10));
  [(PXLivePhotoTrimScrubber *)self trimEndTime];
  if ((a3->var2 & 1) == 0) {
    return 0;
  }
  memset(&v9, 0, sizeof(v9));
  *(_OWORD *)&v7.start.value = v11;
  v7.start.CMTimeEpoch epoch = v12;
  CMTime end = v10;
  CMTimeRangeFromTimeToTime(&v9, &v7.start, &end);
  *(_OWORD *)&v7.start.value = *(_OWORD *)&v9.start.value;
  *(_OWORD *)&v7.start.CMTimeEpoch epoch = *(_OWORD *)&v9.start.epoch;
  long long v6 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v7.duration.timescale = *(_OWORD *)&v9.duration.timescale;
  *(_OWORD *)&end.value = v6;
  end.CMTimeEpoch epoch = a3->var3;
  if (CMTimeRangeContainsTime(&v7, &end)) {
    return 1;
  }
  *(_OWORD *)&v7.start.value = v11;
  v7.start.CMTimeEpoch epoch = v12;
  CMTime end = (CMTime)*a3;
  if (!CMTimeCompare(&v7.start, &end)) {
    return 1;
  }
  v7.CMTime start = v10;
  CMTime end = (CMTime)*a3;
  return CMTimeCompare(&v7.start, &end) == 0;
}

- (void)_setKeyTime:(id *)a3 canHaveImpact:(BOOL)a4 forElement:(int64_t)a5
{
  BOOL v6 = a4;
  if ((a3->var2 & 0x1D) == 1
    && (p_CMTime trimEndTime = &self->_trimEndTime,
        CMTime time1 = *(CMTime *)a3,
        CMTime trimEndTime = (CMTime)self->_trimEndTime,
        CMTimeCompare(&time1, &trimEndTime) >= 1)
    && (self->_trimEndTime.flags & 1) != 0)
  {
    long long v16 = *(_OWORD *)&p_trimEndTime->value;
    a3->int64_t var3 = self->_trimEndTime.epoch;
    *(_OWORD *)&a3->var0 = v16;
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
  }
  if ((a3->var2 & 0x1D) == 1)
  {
    CMTime time1 = (CMTime)*a3;
    CMTime trimEndTime = (CMTime)self->_trimStartTime;
    if (CMTimeCompare(&time1, &trimEndTime) < 0 && (self->_trimStartTime.flags & 1) != 0)
    {
      long long v11 = *(_OWORD *)&self->_trimStartTime.value;
      a3->int64_t var3 = self->_trimStartTime.epoch;
      *(_OWORD *)&a3->var0 = v11;
      int v10 = 1;
    }
  }
  CMTime time1 = (CMTime)self->_keyTime;
  CMTime trimEndTime = (CMTime)*a3;
  if (CMTimeCompare(&time1, &trimEndTime))
  {
    long long v12 = *(_OWORD *)&a3->var0;
    self->_keyTime.CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&self->_keyTime.value = v12;
    unint64_t v13 = [(PXLivePhotoTrimScrubber *)self playheadStyle];
    if ((v10 & v6) == 1 && (a3->var2 & 0x1D) == 1 && v13) {
      [(PXLivePhotoTrimScrubber *)self _trimHandleDidReachBounds];
    }
    if (self->_delegateFlags.respondsToDidChangeTimeForElement)
    {
      double v14 = [(PXLivePhotoTrimScrubber *)self delegate];
      [v14 trimScrubber:self didChangeTimeForElement:a5];

      [(PXLivePhotoTrimScrubber *)self _updateZoomState:1];
    }
    [(PXLivePhotoTrimScrubber *)self setNeedsLayout];
    photoLoupe = self->_photoLoupe;
    CMTime time1 = (CMTime)*a3;
    [(PXLivePhotoTrimScrubberLoupeView *)photoLoupe setFrameTime:&time1];
    [(PXLivePhotoTrimScrubber *)self _presentControlsIfNeeded];
  }
}

- (void)setKeyTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = *a3;
  [(PXLivePhotoTrimScrubber *)self _setKeyTime:&v3 canHaveImpact:0 forElement:3];
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
  id v5 = a3;
  [(PXLivePhotoTrimScrubberFilmStripView *)self->_filmstripView setLivePhotoTrimScrubberThumbnail:v5];

  [(PXLivePhotoTrimScrubber *)self _updateContentAspectRatio];
}

- (UIView)loupePlayerView
{
  return [(PXLivePhotoTrimScrubberLoupeView *)self->_photoLoupe playerView];
}

- (void)setLoupePlayerView:(id)a3
{
}

- (void)setAsset:(id)a3 videoComposition:(id)a4
{
  CMTimeRange v7 = (AVAsset *)a3;
  CGFloat v8 = (AVVideoComposition *)a4;
  p_asset = &self->_asset;
  if (self->_asset == v7) {
    int v10 = 0;
  }
  else {
    int v10 = -[AVAsset isEqual:](v7, "isEqual:") ^ 1;
  }
  if (self->_videoComposition == v8) {
    int v11 = 0;
  }
  else {
    int v11 = -[AVVideoComposition isEqual:](v8, "isEqual:") ^ 1;
  }
  if ((v10 | v11) == 1)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    objc_storeStrong((id *)&self->_videoComposition, a4);
    [(PXLivePhotoTrimScrubberFilmStripView *)self->_filmstripView setAsset:*p_asset videoComposition:v8];
    long long v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    unint64_t v13 = [v12 dictionaryForKey:@"IPXRootSettings"];

    double v14 = [v13 objectForKeyedSubscript:@"PXSettingsArchiveKey"];
    double v15 = [v14 objectForKeyedSubscript:@"editSettings"];
    long long v16 = [v15 objectForKeyedSubscript:@"disableScrubberLoupe"];
    char v17 = [v16 BOOLValue];

    if ((v17 & 1) == 0) {
      [(PXLivePhotoTrimScrubberLoupeView *)self->_photoLoupe setAsset:*p_asset videoComposition:v8];
    }
    [(PXLivePhotoTrimScrubber *)self _updateContentAspectRatio];
    if (v7)
    {
      [(AVAsset *)v7 duration];
    }
    else
    {
      long long v24 = 0uLL;
      uint64_t v25 = 0;
    }
    long long v22 = v24;
    uint64_t v23 = v25;
    [(PXLivePhotoTrimScrubber *)self _setUntrimmedDuration:&v22];
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    if ([(AVAsset *)v7 statusOfValueForKey:@"duration" error:0] != 2) {
      [v18 addObject:@"duration"];
    }
    if ([(AVAsset *)v7 statusOfValueForKey:@"tracks" error:0] != 2) {
      [v18 addObject:@"tracks"];
    }
    if ([v18 count])
    {
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __53__PXLivePhotoTrimScrubber_setAsset_videoComposition___block_invoke;
      v19[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v20, &location);
      [(AVAsset *)v7 loadValuesAsynchronouslyForKeys:v18 completionHandler:v19];
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
}

void __53__PXLivePhotoTrimScrubber_setAsset_videoComposition___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PXLivePhotoTrimScrubber_setAsset_videoComposition___block_invoke_2;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __53__PXLivePhotoTrimScrubber_setAsset_videoComposition___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _assetDidLoadValues];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToAssetDurationDidChange = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidTapElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToCanBeginInteractivelyEditingElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidBeginInteractivelyEditingElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEndInteractivelyEditingElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidChangeTimeForElement = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidChangeLoupeRect = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidZoomToMinimumValueMaximumValue = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidUnzoom = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPausePlayer = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidLayoutSubviews = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDebugStartRect = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDebugEndRect = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDebugStartOffset = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDebugEndOffset = objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      [(PXLivePhotoTrimScrubberFilmStripView *)self->_filmstripView setThumbnailUpdatingDelegate:obj];
    }
  }
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)PXLivePhotoTrimScrubber;
  [(PXLivePhotoTrimScrubber *)&v29 layoutSubviews];
  [(PXLivePhotoTrimScrubber *)self _updateSpecDependentUI];
  [(PXLivePhotoTrimScrubber *)self _newScrubberLayoutSubviews];
  if ([(PXLivePhotoTrimScrubber *)self showVideoScrubberDebugOverlay])
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXLivePhotoTrimScrubber *)self spec];
    [v3 scrubberHeight];
    double v5 = v4;

    BOOL v6 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
    [(PXLivePhotoTrimScrubber *)self trimStartTime];
    [v6 offsetInScrubberSpaceForTime:v28];
    double v8 = v7;

    CMTimeRange v9 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
    [(PXLivePhotoTrimScrubber *)self keyTime];
    [v9 offsetInScrubberSpaceForTime:v27];
    double v11 = v10;

    long long v12 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
    [(PXLivePhotoTrimScrubber *)self trimEndTime];
    [v12 offsetInScrubberSpaceForTime:v26];
    double v14 = v13;

    -[UIView setFrame:](self->_debugStartTimeView, "setFrame:", v8, 0.0, 1.0, v5);
    -[UIView setFrame:](self->_debugLoupeTimeView, "setFrame:", v11, 0.0, 1.0, v5);
    -[UIView setFrame:](self->_debugEndTimeView, "setFrame:", v14, 0.0, 1.0, v5);
    if (self->_delegateFlags.respondsToDebugStartOffset)
    {
      [(UIView *)self->_debugStartTimeView frame];
      double x = v30.origin.x;
      double width = v30.size.width;
      double height = v30.size.height;
      CGFloat v18 = v30.origin.y - CGRectGetHeight(v30);
      double v19 = [(PXLivePhotoTrimScrubber *)self delegate];
      objc_msgSend(v19, "trimScrubber:debugStartOffset:", self, x, v18, width, height);
    }
    if (self->_delegateFlags.respondsToDebugEndOffset)
    {
      [(UIView *)self->_debugEndTimeView frame];
      double v20 = v31.origin.x;
      double v21 = v31.size.width;
      double v22 = v31.size.height;
      CGFloat v23 = v31.origin.y - CGRectGetHeight(v31);
      long long v24 = [(PXLivePhotoTrimScrubber *)self delegate];
      objc_msgSend(v24, "trimScrubber:debugEndOffset:", self, v20, v23, v21, v22);
    }
  }
  if (self->_delegateFlags.respondsToDidLayoutSubviews)
  {
    uint64_t v25 = [(PXLivePhotoTrimScrubber *)self delegate];
    [v25 trimScrubberDidLayoutSubviews:self];
  }
}

- (void)_newScrubberLayoutSubviews
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXLivePhotoTrimScrubber *)self spec];
  [v3 scrubberHeight];
  double v5 = v4;
  [(PXLivePhotoTrimScrubber *)self horizontalInset];
  double v7 = v6;
  [v3 handleWidth];
  double v75 = v8;
  [v3 handleHeight];
  uint64_t rect = v9;
  [(PXLivePhotoTrimScrubber *)self bounds];
  CGFloat v10 = (CGRectGetHeight(v96) - v5) * 0.5;
  [v3 filmstripViewInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v84 = v7 + v13;
  double v76 = v13;
  [(PXLivePhotoTrimScrubber *)self bounds];
  double v73 = v7;
  double v83 = v5;
  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v84, v10 + v12, CGRectGetWidth(v97) + v7 * -2.0 - v14 - v18, v5 - v12 - v16);
  -[UIView setFrame:](self->_filmstripContainerView, "setFrame:");
  [(UIView *)self->_filmstripContainerView frame];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v27 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  objc_msgSend(v27, "setViewportFrame:", v20, v22, v24, v26);

  double v28 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  [v28 filmstripFrameInScrubberSpace];
  CGFloat v81 = v30;
  CGFloat v82 = v29;
  CGFloat v79 = v32;
  CGFloat v80 = v31;

  [(PXLivePhotoTrimScrubber *)self _keyHandleRect];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  memset(&v95, 0, sizeof(v95));
  [(PXLivePhotoTrimScrubber *)self trimEndTime];
  [(PXLivePhotoTrimScrubber *)self trimStartTime];
  CMTimeSubtract(&v95, &lhs, &rhs);
  memset(&v92, 0, sizeof(v92));
  [(PXLivePhotoTrimScrubber *)self trimStartTime];
  CMTime time = v95;
  CMTimeMultiplyByRatio(&v90, &time, 1, 2);
  CMTimeAdd(&v92, &v91, &v90);
  CGRect v41 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  CMTime time = v92;
  [v41 offsetInScrubberSpaceForTime:&time fallbackAnchor:0.5];
  double v43 = v42;

  double v85 = floor(v43);
  double v74 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  unint64_t v44 = [(PXLivePhotoTrimScrubber *)self playheadStyle];
  memset(&time, 0, sizeof(time));
  [(PXLivePhotoTrimScrubber *)self trimStartTime];
  CGRect v45 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  CMTime v88 = time;
  [v45 offsetInScrubberSpaceForTime:&v88 fallbackAnchor:0.0];
  double v47 = v46;

  memset(&v88, 0, sizeof(v88));
  [(PXLivePhotoTrimScrubber *)self trimEndTime];
  v48 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  CMTime v87 = v88;
  [v48 offsetInScrubberSpaceForTime:&v87 fallbackAnchor:1.0];
  double v50 = v49;

  v98.origin.double x = v34;
  v98.origin.CGFloat y = v36;
  v98.size.double width = v38;
  v98.size.double height = v40;
  double Width = CGRectGetWidth(v98);
  v99.origin.CGFloat y = v81;
  v99.origin.double x = v82;
  v99.size.double height = v79;
  v99.size.double width = v80;
  CGFloat MinX = CGRectGetMinX(v99);
  double v53 = v76;
  BOOL v54 = Width <= v50 - v47;
  double v55 = MinX - v76;
  BOOL v56 = !v54 && v44 == 2;
  char v57 = !v56;
  CGFloat v77 = v34;
  if (v56)
  {
    v100.origin.double x = v34;
    v100.origin.CGFloat y = v36;
    v100.size.double width = v38;
    v100.size.double height = v40;
    double v58 = CGRectGetMinX(v100);
    double v53 = v76;
  }
  else
  {
    double v58 = v73 + v47;
  }
  uint64_t v59 = rect;
  double v60 = v58 - v53;
  if (v55 >= v60) {
    double v61 = v55;
  }
  else {
    double v61 = v60;
  }
  if (v75 >= v85 - v61) {
    double v62 = v75;
  }
  else {
    double v62 = v85 - v61;
  }
  double v63 = v61;
  double v64 = v74;
  double v65 = CGRectGetMinX(*(CGRect *)(&v59 - 3));
  memset(&v87, 0, sizeof(v87));
  v66 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  v67 = v66;
  if (v66) {
    [v66 timeForOffsetInScrubberSpace:v75 * 0.5 + v65];
  }
  else {
    memset(&v87, 0, sizeof(v87));
  }

  v68 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  CMTime v86 = v87;
  [v68 offsetInViewportSpaceForTime:&v86];
  double v70 = v69;

  v71 = [(PXLivePhotoTrimScrubber *)self layoutHelper];
  [v71 filmstripFrame];
  double v72 = CGRectGetMinX(v101);

  -[PXLivePhotoTrimScrubber backingAlignedRectForRect:](self, "backingAlignedRectForRect:", v72, v74, v70 - v72, v83);
  -[UIView setFrame:](self->_preTrimOverlayView, "setFrame:");
  v102.origin.CGFloat y = v81;
  v102.origin.double x = v82;
  v102.size.double height = v79;
  v102.size.double width = v80;
  CGRectGetMaxX(v102);
  if ((v57 & 1) == 0)
  {
    v103.size.double width = v38;
    v103.origin.double x = v77;
    v103.size.double height = v40;
    v103.origin.CGFloat y = v36;
    CGRectGetMaxX(v103);
  }
  PXClamp();
}

void __53__PXLivePhotoTrimScrubber__newScrubberLayoutSubviews__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layoutHelper];
  [v2 filmstripFrame];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setFrame:");

  id v3 = [*(id *)(a1 + 32) layoutHelper];
  [v3 visibleFrameInFilmstripSpace];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setVisibleRect:");
}

- (PXLivePhotoTrimScrubber)initWithFilmStripViewClass:(Class)a3 spec:(id)a4 traitCollection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXLivePhotoTrimScrubber;
  CGFloat v10 = -[PXLivePhotoTrimScrubber initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_filmStripViewClass, a3);
    double v12 = v8;
    if (!v8) {
      double v12 = objc_opt_new();
    }
    objc_storeStrong((id *)&v11->_spec, v12);
    if (!v8) {

    }
    objc_storeStrong((id *)&v11->_traitCollection, a5);
    double v13 = objc_alloc_init(PXTrimScrubberLayoutHelper);
    layoutHelper = v11->_layoutHelper;
    v11->_layoutHelper = v13;

    [(PXLivePhotoTrimScrubber *)v11 _PXLivePhotoTrimScrubber_commonInit];
  }

  return v11;
}

+ (UIImage)trimEndHighlightedImageMini
{
  return 0;
}

+ (UIImage)trimEndImageMini
{
  return 0;
}

+ (UIImage)trimStartHighlightedImageMini
{
  return 0;
}

+ (UIImage)trimStartImageMini
{
  return 0;
}

+ (UIImage)trimEndHighlightedImage
{
  return 0;
}

+ (UIImage)trimStartHighlightedImage
{
  return 0;
}

+ (UIImage)trimEndImage
{
  return 0;
}

+ (UIImage)trimStartImage
{
  return 0;
}

+ (id)createSnappingControllerWithSnappingTarget:(double)a3
{
  id v3 = [[PXSnappingController alloc] initWithSnappingTarget:a3];
  return v3;
}

+ (id)_createSnappingControllersForKeytimes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        CGFloat v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        memset(&v14[1], 0, sizeof(CMTime));
        if (v10) {
          [v10 CMTimeValue];
        }
        v14[0] = v14[1];
        double Seconds = CMTimeGetSeconds(v14);
        double v12 = [(id)objc_opt_class() createSnappingControllerWithSnappingTarget:Seconds];
        [v12 setAttractionOffsetThreshold:0.05];
        [v12 setRetentionOffsetThreshold:0.1];
        [v12 setAttractionVelocityThreshold:100.0];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

@end