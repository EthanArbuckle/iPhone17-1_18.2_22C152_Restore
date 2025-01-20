@interface CRLMovieRep
+ (id)CRLMovieButtonFillColor;
+ (void)initialize;
- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)directlyManagesVisibilityOfKnob:(id)a3;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)isPlayable;
- (BOOL)isPlaying;
- (BOOL)manuallyControlsMiniFormatter;
- (BOOL)noKnobTogglePlayAndMiniFormatter;
- (BOOL)p_cornerRadiusValueIsSignificant;
- (BOOL)p_isLoopingSticker;
- (BOOL)p_isMiniFormatterShowing;
- (BOOL)p_isMovieKnob:(id)a3;
- (BOOL)p_isPresentingMiniFormatterOrPlayButtonVisible;
- (BOOL)p_miniFormatterIsPresentingSecondLayer;
- (BOOL)p_needsTilingForStroke:(id)a3;
- (BOOL)p_playButtonFitsInFrame;
- (BOOL)p_shouldAllowPlaybackWhenEditingDisabled;
- (BOOL)p_shouldPlayerControllerExistThroughoutSelection;
- (BOOL)p_shouldStopPlayingWhenDeselected;
- (BOOL)shouldDisplayAsSpatial;
- (BOOL)shouldShowLoadingUI;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsToHandleDoubleTapsWhenLocked;
- (BOOL)wantsToHandleTapsWhenLocked;
- (CGPoint)positionOfPlayKnobForBounds:(CGRect)a3 viewScale:(double)a4;
- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4;
- (CGRect)p_strokeFrameForRenderableFrame:(CGRect)a3;
- (CRLMediaPlayerController)playerControllerForcingCreationIfNotPreExisting;
- (CRLMovieRep)initWithLayout:(id)a3 canvas:(id)a4;
- (_TtC8Freeform12CRLMovieItem)movieItem;
- (double)absoluteCurrentTime;
- (double)visibleTime;
- (float)volume;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)additionalRenderablesOverRenderable;
- (id)dynamicResizeDidBegin;
- (id)movieLayout;
- (id)newTrackerForKnob:(id)a3;
- (id)nowPlayingImageProviderWithPlaybackController:(id)a3;
- (id)nowPlayingTitleWithPlaybackController:(id)a3;
- (id)p_pathForRoundedCornerMaskWithBounds:(CGRect)a3;
- (id)p_playButtonKnob;
- (id)p_playerStrokeRenderable;
- (id)p_posterImageProvider;
- (id)p_selectionPath;
- (id)p_shapeRenderableForPlayerStroke;
- (id)pauseButtonImage;
- (id)playButtonImage;
- (id)resizedGeometryForTransform:(CGAffineTransform *)a3;
- (id)visuallySignificantDataSet;
- (unint64_t)enabledKnobMask;
- (void)addKnobsToArray:(id)a3;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)dealloc;
- (void)didBeginPencilKitStroke;
- (void)didEndZooming;
- (void)didFinishPencilKitStroke;
- (void)didUpdateRenderable:(id)a3;
- (void)documentEditabilityDidChange;
- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3;
- (void)dynamicFreeTransformDidEndWithTracker:(id)a3;
- (void)dynamicResizeDidEndWithTracker:(id)a3;
- (void)dynamicVisibleTimeChangeDidBegin;
- (void)dynamicVisibleTimeChangeDidEnd;
- (void)dynamicVisibleTimeUpdateToValue:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5;
- (void)dynamicVolumeChangeDidBegin;
- (void)dynamicVolumeChangeDidEnd;
- (void)dynamicVolumeUpdateToValue:(float)a3;
- (void)enterPreviewMode;
- (void)handleFadeInForZoom;
- (void)handleFadeOutForZoom;
- (void)i_hidePlayButtonIndependently;
- (void)i_togglePlayPauseTriggeredFromKnob;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_addPlayButtonToKnobs:(id)a3;
- (void)p_applyBasicStroke:(id)a3 toRenderable:(id)a4 bounds:(CGRect)a5;
- (void)p_applyRoundedCornersTo:(id)a3;
- (void)p_arrangeRenderableVisibility:(id)a3;
- (void)p_cancelUpdatingUIStateForMoviePlayability;
- (void)p_checkAndSyncTilingState:(BOOL)a3;
- (void)p_commonDrawStrokeInContext:(CGContext *)a3;
- (void)p_disposeStrokeRenderable;
- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(double)a6 forShadowOrHitTest:(BOOL)a7;
- (void)p_drawPlayButtonForNonInteractiveCanvasInContext:(CGContext *)a3;
- (void)p_drawPosterImageInContext:(CGContext *)a3 forShadowOrHitTest:(BOOL)a4;
- (void)p_drawStrokeInContext:(CGContext *)a3;
- (void)p_handleAssetPreparationCompletionForAsset:(id)a3;
- (void)p_hideControls;
- (void)p_hideControlsWithDelay:(double)a3;
- (void)p_hideMiniFormatter;
- (void)p_hidePlayPauseButtonKnob;
- (void)p_invalidateHideControlsTimeoutTimer;
- (void)p_listenForAssetChangesIfAppropriate;
- (void)p_pauseTriggeredFromKnob;
- (void)p_playTriggeredFromKnob;
- (void)p_positionPauseButtonImage;
- (void)p_positionPlayButtonImage;
- (void)p_removeRoundedCornersFrom:(id)a3;
- (void)p_setNeedsTeardownPlayerControllerOnUpdateRenderable;
- (void)p_setPositionAndBoundsIfDifferent:(id)a3 position:(CGPoint)a4 bounds:(CGRect)a5;
- (void)p_setupPlayerControllerIfNecessary;
- (void)p_setupPlayerLayerIfNecessary;
- (void)p_setupPlayerStrokeRenderables:(BOOL)a3;
- (void)p_setupShapePlayerStrokeRenderable;
- (void)p_setupStrokeRenderables:(BOOL)a3;
- (void)p_setupTilingPlayerStrokeRenderable;
- (void)p_showControls;
- (void)p_showMiniFormatter;
- (void)p_startOrStopLoopingStickerIfNecessary;
- (void)p_stopPlaybackForPencilKitIfNeeded;
- (void)p_stopUpdatingUIStateForMoviePlayability;
- (void)p_teardownPlayerController;
- (void)p_teardownPlayerControllerIfNeeded;
- (void)p_togglePlaying;
- (void)p_updateEndTime;
- (void)p_updateLoopingSettingForMoviePlaybackIfNeeded;
- (void)p_updatePlayButtonVisibility;
- (void)p_updateRoundedCornersForPlayerRenderableIfNeeded;
- (void)p_updateStartTime;
- (void)p_updateStrokeRenderablesForStroke:(id)a3 repRenderable:(id)a4;
- (void)p_updateUIStateForMoviePlayability;
- (void)p_updateUsePlayPauseButtonToMatchIsPlaying:(BOOL)a3;
- (void)p_updateVolume;
- (void)p_usePauseButtonKnobImage;
- (void)p_usePlayButtonKnobImage;
- (void)pausePlaybackIfNeeded;
- (void)playbackDidStopForPlayerController:(id)a3;
- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4;
- (void)prepareForPencilKitSnapshotting;
- (void)prepareForPreview;
- (void)processChangedProperty:(unint64_t)a3;
- (void)screenScaleDidChange;
- (void)setNeedsDisplay;
- (void)stopPlaybackIfNeeded;
- (void)toggleMiniFormatter;
- (void)toggleShowingControls;
- (void)updateFromLayout;
- (void)updateRenderableGeometryFromLayout:(id)a3;
- (void)updateUI_toMatchPlayer;
- (void)willBeRemoved;
- (void)willBeginEyedropperMode;
- (void)willUpdateRenderable:(id)a3;
@end

@implementation CRLMovieRep

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[CRLWidthLimitedQueue alloc] initWithLimit:10];
    v3 = (void *)qword_1016A9058;
    qword_1016A9058 = (uint64_t)v2;
  }
}

- (CRLMovieRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLMovieRep;
  v7 = [(CRLCanvasRep *)&v13 initWithLayout:a3 canvas:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(CRLMovieRep *)v7 movieItem];

    if (v9)
    {
      v10 = (NSUUID *)objc_alloc_init((Class)NSUUID);
      downloadObserverIdentifier = v8->_downloadObserverIdentifier;
      v8->_downloadObserverIdentifier = v10;

      if ([v6 isCanvasInteractive])
      {
        [(CRLMovieRep *)v8 p_listenForAssetChangesIfAppropriate];
        [(CRLMovieRep *)v8 p_startOrStopLoopingStickerIfNecessary];
      }
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (_TtC8Freeform12CRLMovieItem)movieItem
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self info];
  v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform12CRLMovieItem *)v5;
}

- (id)movieLayout
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self layout];
  v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (void)dealloc
{
  if (self->_hideControlsTimeoutTimer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3870);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101074FA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3890);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 218, 0, "expected nil value for '%{public}s'", "_hideControlsTimeoutTimer");
  }
  [(CRLCanvasRenderable *)self->_playerStrokeRenderable setDelegate:0];
  [(CRLCanvasRenderable *)self->_playerRenderable setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v6 dealloc];
}

- (void)updateFromLayout
{
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v3 updateFromLayout];
  [(CRLMovieRep *)self p_updatePlayButtonVisibility];
}

- (id)p_posterImageProvider
{
  objc_super v3 = +[CRLImageProviderPool sharedPool];
  v4 = [(CRLMovieRep *)self movieItem];
  v5 = [v4 posterImageAssetPayload];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = [v3 providerForAsset:v5 shouldValidate:1];
    v8 = sub_1002469D0(v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)p_drawPosterImageInContext:(CGContext *)a3 forShadowOrHitTest:(BOOL)a4
{
  BOOL v4 = a4;
  CGContextSaveGState(a3);
  v7 = [(CRLMediaRep *)self mediaLayout];
  [v7 boundsForStandardKnobs];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  memset(&v45, 0, sizeof(v45));
  v16 = [(CRLMediaRep *)self mediaLayout];
  v17 = [v16 geometryInRoot];
  v18 = v17;
  if (v17) {
    [v17 transform];
  }
  else {
    memset(&v45, 0, sizeof(v45));
  }

  CGAffineTransform v44 = v45;
  if (sub_10007F964(&v44.a))
  {
    CGAffineTransform v44 = v45;
    v46.origin.double x = v9;
    v46.origin.CGFloat y = v11;
    v46.size.CGFloat width = v13;
    v46.size.CGFloat height = v15;
    CGRect v47 = CGRectApplyAffineTransform(v46, &v44);
    double x = v47.origin.x;
    CGFloat y = v47.origin.y;
    CGFloat width = v47.size.width;
    CGFloat height = v47.size.height;
    double v23 = sub_100458664((uint64_t)a3);
    v24 = [(CRLCanvasRep *)self canvas];
    [v24 viewScale];
    double v26 = v23 * v25;

    double v27 = sub_100067584(x, y, width, height, v26);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGAffineTransform v44 = v45;
    CGAffineTransformInvert(&v43, &v44);
    v48.origin.double x = v27;
    v48.origin.CGFloat y = v29;
    v48.size.CGFloat width = v31;
    v48.size.CGFloat height = v33;
    CGRect v49 = CGRectApplyAffineTransform(v48, &v43);
    double v9 = v49.origin.x;
    double v11 = v49.origin.y;
    double v13 = v49.size.width;
    double v15 = v49.size.height;
  }
  v34 = [(CRLMovieRep *)self p_posterImageProvider];
  if (v34)
  {
    CGContextSaveGState(a3);
    v35 = -[CRLMovieRep p_pathForRoundedCornerMaskWithBounds:](self, "p_pathForRoundedCornerMaskWithBounds:", v9, v11, v13, v15);
    v36 = v35;
    if (v35)
    {
      CGContextAddPath(a3, (CGPathRef)[v35 CGPath]);
      CGContextClip(a3);
    }
    if (v4 && [v34 isOpaque])
    {
      v37 = +[CRLColor blackColor];
      CGContextSetFillColorWithColor(a3, (CGColorRef)[v37 CGColor]);

      v50.origin.double x = v9;
      v50.origin.CGFloat y = v11;
      v50.size.CGFloat width = v13;
      v50.size.CGFloat height = v15;
      CGContextFillRect(a3, v50);
    }
    else
    {
      [v34 drawImageInContext:a3 rect:v9, v11, v13, v15];
    }
    CGContextRestoreGState(a3);
  }
  else if ([(CRLMovieRep *)self shouldShowLoadingUI])
  {
    v38 = [_TtC8Freeform33CRLUndownloadedAssetDrawingHelper alloc];
    v39 = [(CRLMovieRep *)self movieItem];
    v40 = [v39 posterImageAssetPayload];
    v41 = [(CRLUndownloadedAssetDrawingHelper *)v38 initWithRep:self asset:v40];

    [(CRLUndownloadedAssetDrawingHelper *)v41 drawInContext:a3];
  }
  else if (v4)
  {
    v42 = +[CRLColor blackColor];
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v42 CGColor]);

    v51.origin.double x = v9;
    v51.origin.CGFloat y = v11;
    v51.size.CGFloat width = v13;
    v51.size.CGFloat height = v15;
    CGContextFillRect(a3, v51);
  }
  CGContextRestoreGState(a3);
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(double)a6 forShadowOrHitTest:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  double v13 = [(CRLStyledRep *)self styledLayout];
  unsigned __int8 v14 = [v13 isInvisible];

  if (v14) {
    return;
  }
  double v15 = [(CRLCanvasRep *)self layout];
  id v33 = [v15 stroke];

  if (v33)
  {
    if (![v33 shouldRender])
    {
      id v18 = 0;
      goto LABEL_8;
    }
    v16 = [(CRLCanvasRep *)self canvas];
    unsigned int v17 = [v16 shouldSuppressBackgrounds];

    if (v17)
    {
      id v18 = [v33 mutableCopy];

      id v33 = +[CRLColor blackColor];
      [v18 setColor:];
LABEL_8:

      id v33 = v18;
    }
  }
  else
  {
    id v33 = 0;
  }
  BOOL v19 = a6 < 1.0 && v9;
  int v20 = v19 && v10;
  if (v19 && v10 && (CGContextSaveGState(a3), CGContextSetAlpha(a3, a6), v33))
  {
    CGContextBeginTransparencyLayer(a3, 0);
    int v21 = 1;
  }
  else
  {
    int v21 = 0;
  }
  CGContextSaveGState(a3);
  v22 = [(CRLMediaRep *)self mediaLayout];
  [v22 boundsForStandardKnobs];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  if (v10) {
    [(CRLMovieRep *)self p_drawPosterImageInContext:a3 forShadowOrHitTest:v7];
  }
  CGContextRestoreGState(a3);
  if (v9 && v33)
  {
    CGContextSaveGState(a3);
    [v33 paintRect:a3 inContext:v24, v26, v28, v30];
    CGContextRestoreGState(a3);
  }
  if (!v7)
  {
    CGFloat v31 = [(CRLCanvasRep *)self canvas];
    if ([v31 isCanvasInteractive])
    {
    }
    else
    {
      unsigned int v32 = [(CRLMovieRep *)self p_playButtonFitsInFrame];

      if (v32)
      {
        CGContextSaveGState(a3);
        [(CRLMovieRep *)self p_drawPlayButtonForNonInteractiveCanvasInContext:a3];
        CGContextRestoreGState(a3);
      }
    }
  }
  if (v21) {
    CGContextEndTransparencyLayer(a3);
  }
  if (v20) {
    CGContextRestoreGState(a3);
  }
}

- (void)p_drawPlayButtonForNonInteractiveCanvasInContext:(CGContext *)a3
{
  v5 = [(CRLMediaRep *)self mediaLayout];
  [v5 boundsForStandardKnobs];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[CRLMovieRep positionOfPlayKnobForBounds:viewScale:](self, "positionOfPlayKnobForBounds:viewScale:", v7, v9, v11, v13, 1.0);
  double v16 = sub_10006402C(v14, v15, 48.0);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  double v23 = +[CRLMovieRep CRLMovieButtonFillColor];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v23 CGColor]);

  v44.origin.double x = v16;
  v44.origin.CGFloat y = v18;
  v44.size.CGFloat width = v20;
  v44.size.CGFloat height = v22;
  CGContextFillEllipseInRect(a3, v44);
  double v24 = sub_100065738(v16, v18, v20, v22);
  double v26 = v25;
  double v27 = v24 + 2.88;
  double v28 = +[CRLImage imageWithSystemImageNamed:@"play.fill" pointSize:22.0];
  [v28 size];
  double v30 = v29;
  double v32 = v31;
  double v33 = sub_10006402C(v27, v26, v29);
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  v40 = +[CRLColor whiteColor];
  id v42 = [v28 compositedImageWithColor:v40 alpha:20 blendMode:1.0];

  v41 = [v42 CGImageForSize:a3 inContext:0 orContentsScaleProvider:v30 contentsScaleProvider:v32];
  v45.origin.double x = v33;
  v45.origin.CGFloat y = v35;
  v45.size.CGFloat width = v37;
  v45.size.CGFloat height = v39;
  CGContextDrawImage(a3, v45, v41);
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9
{
  BOOL v9 = a7;
  char v10 = a5;
  BOOL v11 = a4;
  double v14 = 1.0;
  if (a6) {
    [(CRLStyledRep *)self opacity];
  }

  -[CRLMovieRep p_drawInContext:withContent:withStroke:withOpacity:forShadowOrHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:forShadowOrHitTest:", a3, v11, v10 & 1, v9, a7, a8, v14);
}

- (void)willBeRemoved
{
  v15.receiver = self;
  v15.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v15 willBeRemoved];
  [(CRLMovieRep *)self p_cancelUpdatingUIStateForMoviePlayability];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  double v12 = sub_1000CAC10;
  double v13 = &unk_1014CBBB0;
  double v14 = self;
  if (+[NSThread isMainThread]) {
    v12((uint64_t)block);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  [(CRLMovieRep *)self p_invalidateHideControlsTimeoutTimer];
  objc_super v3 = [(CRLCanvasKnob *)self->_playButtonKnob renderable];
  [v3 setDelegate:0];

  playButtonKnob = self->_playButtonKnob;
  self->_playButtonKnob = 0;

  if (!self->_downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D38B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107503C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D38D0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep willBeRemoved]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 422, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");
  }
  double v8 = [(CRLMovieRep *)self movieItem];
  BOOL v9 = [v8 store];
  char v10 = [v9 assetManager];
  [v10 removeAllDownloadObserversWithIdentifier:self->_downloadObserverIdentifier];
}

- (BOOL)directlyManagesLayerContent
{
  unsigned int v3 = [(CRLMovieRep *)self shouldShowLoadingUI];
  char v4 = v3 ^ 1;
  if (self->_directlyManagesLayerContent != (v3 ^ 1))
  {
    self->_directlyManagesLayerContent = v4;
    if (v3)
    {
      [(CRLMovieRep *)self setNeedsDisplay];
    }
    else
    {
      v5 = [(CRLCanvasRep *)self canvas];
      unsigned int v6 = [v5 isCanvasInteractive];

      if (v6)
      {
        double v7 = [(CRLCanvasRep *)self interactiveCanvasController];
        double v8 = [v7 renderableForRep:self];

        [v8 setContents:0];
      }
    }
  }
  return v4;
}

- (void)p_disposeStrokeRenderable
{
  playerStrokeRenderable = self->_playerStrokeRenderable;
  if (playerStrokeRenderable)
  {
    [(CRLCanvasRenderable *)playerStrokeRenderable setDelegate:0];
    char v4 = self->_playerStrokeRenderable;
    self->_playerStrokeRenderable = 0;
  }
}

- (void)p_setupPlayerLayerIfNecessary
{
  if (!self->_playerRenderable)
  {
    unsigned int v3 = (CRLCanvasRenderable *)[(CRLCanvasRenderableMediaPlayerController *)self->_playerController newRenderable];
    playerRenderable = self->_playerRenderable;
    self->_playerRenderable = v3;

    [(CRLCanvasRenderable *)self->_playerRenderable setDelegate:self];
    [(CRLCanvasRenderable *)self->_playerRenderable setHidden:1];
    uint64_t v5 = objc_opt_class();
    unsigned int v6 = sub_1002469D0(v5, self->_playerRenderable);
    double v7 = v6;
    if (v6)
    {
      self->_playerLayerShouldBeDisplayed = 0;
      [v6 addReadyToDisplayObserver:self options:5 context:off_10166B708];
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 0;
      self->_playerLayerShouldBeDisplayed = 1;
    }
    self->_currentlyObservingPlayerLayer = v8;
    BOOL v9 = [(CRLCanvasRep *)self info];
    char v10 = [v9 geometry];
    BOOL v11 = v10;
    if (v10)
    {
      [v10 transformBasedOnPoint:CGPointZero.x, CGPointZero.y centeredAtPoint:CGPointZero.x, CGPointZero.y];
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v27 = 0u;
    }
    double v12 = self->_playerRenderable;
    v26[0] = v27;
    v26[1] = v28;
    v26[2] = v29;
    [(CRLCanvasRenderable *)v12 setAffineTransform:v26];

    double v13 = [(CRLCanvasRep *)self canvas];
    double v14 = [(CRLCanvasRep *)self layout];
    objc_super v15 = [v14 geometry];
    [v15 size];
    [v13 convertUnscaledToBoundsRect:sub_100064070()];
    -[CRLCanvasRenderable setBounds:](self->_playerRenderable, "setBounds:");

    double v16 = [(CRLCanvasRep *)self canvas];
    double v17 = [(CRLCanvasRep *)self layout];
    CGFloat v18 = [v17 geometry];
    [v18 frame];
    [v16 convertUnscaledToBoundsPoint:sub_100065738(v19, v20, v21, v22)];
    -[CRLCanvasRenderable setPosition:](self->_playerRenderable, "setPosition:");

    [(CRLStyledRep *)self opacity];
    *(float *)&double v23 = v23;
    [(CRLCanvasRenderable *)self->_playerRenderable setOpacity:v23];
    double v24 = [(CRLCanvasRenderable *)self->_playerRenderable layer];
    [(CRLMovieRep *)self p_applyRoundedCornersTo:v24];

    double v25 = [(CRLCanvasRep *)self canvas];
    [v25 invalidateContentLayersForRep:self];
  }
}

- (BOOL)p_cornerRadiusValueIsSignificant
{
  v2 = [(CRLMovieRep *)self movieItem];
  [v2 cornerRadius];
  BOOL v4 = v3 >= 0.001;

  return v4;
}

- (void)p_updateRoundedCornersForPlayerRenderableIfNeeded
{
  if (self->_playerRenderable)
  {
    float v3 = [(CRLMovieRep *)self movieItem];
    unsigned int v4 = [v3 hasRoundedCorners];

    id v5 = [(CRLCanvasRenderable *)self->_playerRenderable layer];
    if (v4) {
      [(CRLMovieRep *)self p_applyRoundedCornersTo:v5];
    }
    else {
      [(CRLMovieRep *)self p_removeRoundedCornersFrom:v5];
    }
  }
}

- (void)p_applyRoundedCornersTo:(id)a3
{
  id v9 = a3;
  if ([(CRLMovieRep *)self p_cornerRadiusValueIsSignificant])
  {
    unsigned int v4 = [(CRLMovieRep *)self movieItem];
    [v4 cornerRadius];
    double v6 = v5;
    double v7 = [(CRLCanvasRep *)self canvas];
    [v7 viewScale];
    [v9 setCornerRadius:v8 * v6];

    [v9 setMasksToBounds:1];
    [v9 setCornerCurve:kCACornerCurveContinuous];
  }
}

- (void)p_removeRoundedCornersFrom:(id)a3
{
  id v3 = a3;
  [v3 setCornerRadius:0.0];
  [v3 setMasksToBounds:0];
}

- (id)p_pathForRoundedCornerMaskWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(CRLMovieRep *)self p_cornerRadiusValueIsSignificant])
  {
    double v8 = [(CRLMovieRep *)self movieItem];
    [v8 cornerRadius];
    char v10 = +[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", x, y, width, height, v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v6 = a3;
  id v7 = [(CRLCanvasRenderable *)self->_playerStrokeRenderable layer];

  if (v7 == v6)
  {
    [(CRLMovieRep *)self p_drawStrokeInContext:a4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLMovieRep;
    [(CRLMovieRep *)&v8 drawLayer:v6 inContext:a4];
  }
}

- (id)p_shapeRenderableForPlayerStroke
{
  uint64_t v3 = objc_opt_class();
  playerStrokeRenderable = self->_playerStrokeRenderable;

  return sub_1002469D0(v3, playerStrokeRenderable);
}

- (id)p_playerStrokeRenderable
{
  return self->_playerStrokeRenderable;
}

- (void)p_setupTilingPlayerStrokeRenderable
{
  if (!self->_playerStrokeRenderable)
  {
    uint64_t v3 = +[CRLTilingRenderable renderable];
    playerStrokeRenderable = self->_playerStrokeRenderable;
    self->_playerStrokeRenderable = v3;
    float v5 = v3;

    [(CRLCanvasRenderable *)v5 setDelegate:self];
    [(CRLCanvasRenderable *)v5 setNeedsDisplay];
  }
}

- (void)p_setupShapePlayerStrokeRenderable
{
  if (!self->_playerStrokeRenderable)
  {
    uint64_t v3 = +[CRLCanvasShapeRenderable renderable];
    playerStrokeRenderable = self->_playerStrokeRenderable;
    self->_playerStrokeRenderable = v3;
    float v5 = v3;

    [(CRLCanvasRenderable *)v5 setDelegate:self];
    [(CRLCanvasRenderable *)v5 setFillColor:0];
  }
}

- (BOOL)p_needsTilingForStroke:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasRep *)self isBeingResized])
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)p_setupPlayerStrokeRenderables:(BOOL)a3
{
  if (a3) {
    [(CRLMovieRep *)self p_setupTilingPlayerStrokeRenderable];
  }
  else {
    [(CRLMovieRep *)self p_setupShapePlayerStrokeRenderable];
  }
}

- (void)p_checkAndSyncTilingState:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != v3)
  {
    [(CRLMovieRep *)self p_disposeStrokeRenderable];
  }
}

- (void)p_setupStrokeRenderables:(BOOL)a3
{
  BOOL v3 = a3;
  -[CRLMovieRep p_checkAndSyncTilingState:](self, "p_checkAndSyncTilingState:");

  [(CRLMovieRep *)self p_setupPlayerStrokeRenderables:v3];
}

- (void)p_commonDrawStrokeInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  float v5 = [(CRLCanvasRep *)self canvas];
  [v5 viewScale];
  CGFloat v7 = v6;

  CGContextScaleCTM(a3, v7, v7);
  [(CRLMovieRep *)self p_drawInContext:a3 withContent:0 withStroke:1 withOpacity:0 forShadowOrHitTest:0.0];

  CGContextRestoreGState(a3);
}

- (void)p_drawStrokeInContext:(CGContext *)a3
{
}

- (CGRect)p_strokeFrameForRenderableFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_super v8 = [(CRLCanvasRep *)self layout];
  float v9 = [v8 stroke];

  char v10 = [(CRLCanvasRep *)self canvas];
  [v10 viewScale];
  double v12 = v11;

  [v9 renderedWidth];
  CGFloat v14 = v12 * (v13 * -0.5);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRectInset(v26, v14, v14);
  double v15 = sub_100064070();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)p_arrangeRenderableVisibility:(id)a3
{
  double v6 = (CRLCanvasRenderable *)a3;
  if (self->_playerLayerShouldBeDisplayed && !self->_needsTeardownPlayerController)
  {
    [(CRLCanvasRenderable *)self->_playerRenderable setHidden:0];
    [(CRLCanvasRenderable *)v6 setHidden:1];
    playerRenderable = self->_playerRenderable;
  }
  else
  {
    [(CRLCanvasRenderable *)v6 setHidden:0];
    [(CRLCanvasRenderable *)self->_playerRenderable setHidden:1];
    playerRenderable = v6;
  }
  float v5 = playerRenderable;
  if (![(CRLCanvasRenderable *)v5 isEqual:self->_renderableToStroke])
  {
    [(CRLMovieRep *)self p_disposeStrokeRenderable];
    objc_storeStrong((id *)&self->_renderableToStroke, playerRenderable);
  }
}

- (void)willUpdateRenderable:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLMovieRep;
  id v4 = a3;
  [(CRLCanvasRep *)&v7 willUpdateRenderable:v4];
  float v5 = [(CRLCanvasRep *)self layout];
  double v6 = [v5 stroke];

  [(CRLMovieRep *)self p_arrangeRenderableVisibility:v4];
  if ([(CRLMediaRep *)self i_shouldRenderStroke:v6]) {
    [(CRLMovieRep *)self p_setupStrokeRenderables:[(CRLMovieRep *)self p_needsTilingForStroke:v6]];
  }
  else {
    [(CRLMovieRep *)self p_disposeStrokeRenderable];
  }
}

- (void)didUpdateRenderable:(id)a3
{
  id v4 = (CRLCanvasRenderable *)a3;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000CBCA0;
  v38[3] = &unk_1014CBBB0;
  v38[4] = self;
  float v5 = objc_retainBlock(v38);
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  +[CATransaction setCompletionBlock:v5];
  v37.receiver = self;
  v37.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v37 didUpdateRenderable:v4];
  [(CRLCanvasRenderable *)v4 crl_ignoreAccessibilityInvertColorsIfNeeded];
  [(CRLStyledRep *)self opacity];
  double v7 = v6;
  if ([(CRLMovieRep *)self shouldShowLoadingUI]
    && ![(CRLMovieRep *)self directlyManagesLayerContent])
  {
    double v7 = 1.0;
  }
  [(CRLCanvasRenderable *)v4 opacity];
  double v9 = v8;
  if (v7 != v9)
  {
    *(float *)&double v9 = v7;
    [(CRLCanvasRenderable *)v4 setOpacity:v9];
  }
  playerRenderable = self->_playerRenderable;
  if (playerRenderable)
  {
    [(CRLCanvasRenderable *)playerRenderable opacity];
    double v12 = v11;
    if (v7 != v12)
    {
      *(float *)&double v12 = v7;
      [(CRLCanvasRenderable *)self->_playerRenderable setOpacity:v12];
    }
  }
  double v13 = [(CRLCanvasRep *)self layout];
  CGFloat v14 = [v13 stroke];

  if ([(CRLMediaRep *)self i_shouldRenderStroke:v14])
  {
    double v15 = v4;
    if (self->_playerLayerShouldBeDisplayed) {
      double v15 = self->_playerRenderable;
    }
    [(CRLMovieRep *)self p_updateStrokeRenderablesForStroke:v14 repRenderable:v15];
  }
  [(CRLMediaRep *)self updateSpatialLabel];
  if ([(CRLMovieRep *)self directlyManagesLayerContent])
  {
    double v16 = [(CRLMovieRep *)self p_posterImageProvider];
    if (v16)
    {
      uint64_t v31 = 0;
      double v32 = (double *)&v31;
      uint64_t v33 = 0x3010000000;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      double v34 = "";
      double v17 = [(CRLCanvasRep *)self canvas];
      double v18 = [(CRLCanvasRep *)self layout];
      double v19 = [v18 geometry];
      [v19 size];
      [v17 convertUnscaledToBoundsSize:];
      uint64_t v35 = v20;
      uint64_t v36 = v21;

      id v22 = [v16 cachedCGImageOfNearestSizeOrNULLPreferringSize:v4 withContentsScaleProvider:v32[4], v32[5]];
      if (v22) {
        [(CRLCanvasRenderable *)v4 setContents:v22];
      }
      double v23 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_1000CBCA8;
      block[3] = &unk_1014D3920;
      id v27 = v16;
      double v30 = &v31;
      double v24 = v4;
      long long v28 = v24;
      long long v29 = self;
      dispatch_async(v23, block);

      double v25 = [(CRLCanvasRenderable *)v24 layer];
      [(CRLMovieRep *)self p_applyRoundedCornersTo:v25];

      _Block_object_dispose(&v31, 8);
    }
  }
  +[CATransaction commit];
}

- (BOOL)shouldDisplayAsSpatial
{
  BOOL v3 = [(CRLMovieRep *)self movieItem];
  if ([v3 isSpatial]) {
    unsigned int v4 = ![(CRLMovieRep *)self isPlaying];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)p_setPositionAndBoundsIfDifferent:(id)a3 position:(CGPoint)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v18 = a3;
  [v18 position];
  if (v12 != v10 || v11 != v9) {
    [v18 setPosition:v10, v9];
  }
  [v18 bounds];
  v21.origin.double x = v14;
  v21.origin.double y = v15;
  v21.size.double width = v16;
  v21.size.double height = v17;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (!CGRectEqualToRect(v20, v21)) {
    [v18 setBounds:x, y, width, height];
  }
}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v4 = a3;
  if ([(CRLMovieRep *)self directlyManagesLayerContent])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    float v5 = [(CRLMovieRep *)self movieLayout];
    double v6 = [v5 pureGeometry];
    [(CRLCanvasRep *)self computeDirectLayerFrame:&v14 andTransform:&v11 basedOnLayoutGeometry:v6];
    -[CRLCanvasRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v11, v14, v15);
    long long v8 = v11;
    long long v9 = v12;
    long long v10 = v13;
    [v4 setIfDifferentFrame:&v8 orTransform:v14, v15];
    if (self->_playerRenderable)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      playerRenderable = self->_playerRenderable;
      long long v8 = v11;
      long long v9 = v12;
      long long v10 = v13;
      -[CRLCanvasRenderable setIfDifferentFrame:orTransform:](playerRenderable, "setIfDifferentFrame:orTransform:", &v8, v14, v15);
      +[CATransaction commit];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLMovieRep;
    [(CRLCanvasRep *)&v16 updateRenderableGeometryFromLayout:v4];
  }
}

- (void)p_applyBasicStroke:(id)a3 toRenderable:(id)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  long long v13 = [(CRLCanvasRep *)self canvas];
  [v13 viewScale];
  double v15 = v14;

  [v11 setBounds:x, y, width, height];
  [v12 applyToShapeRenderable:v11 withScale:v15];

  Mutable = CGPathCreateMutable();
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  CGPathAddRect(Mutable, 0, v18);
  [v11 setHidden:0];
  [v11 setPath:Mutable];

  CGPathRelease(Mutable);
}

- (void)p_updateStrokeRenderablesForStroke:(id)a3 repRenderable:(id)a4
{
  id v5 = a3;
  double v6 = [(CRLMovieRep *)self p_playerStrokeRenderable];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  unsigned __int8 v7 = [(CRLMovieRep *)self p_needsTilingForStroke:v5];
  long long v36 = 0u;
  memset(&v37, 0, sizeof(v37));
  long long v35 = 0u;
  long long v8 = [(CRLCanvasRep *)self layout];
  long long v9 = [v8 pureGeometry];
  [(CRLCanvasRep *)self computeDirectLayerFrame:&v35 andTransform:&v37 basedOnLayoutGeometry:v9];

  long long v10 = v36;
  double v11 = sub_100064070();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = sub_100065738(*(CGFloat *)&v35, *((CGFloat *)&v35 + 1), *(CGFloat *)&v10, *((CGFloat *)&v10 + 1));
  double v20 = v19;
  [v6 position];
  if (v22 == v18 && v21 == v20)
  {
    if (v6)
    {
LABEL_4:
      [v6 affineTransform];
      goto LABEL_7;
    }
  }
  else
  {
    [v6 setPosition:v18, v20];
    if (v6) {
      goto LABEL_4;
    }
  }
  memset(&t1, 0, sizeof(t1));
LABEL_7:
  CGAffineTransform t2 = v37;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    CGAffineTransform v32 = v37;
    [v6 setAffineTransform:&v32];
  }
  [(CRLStyledRep *)self opacity];
  double v24 = v23;
  [v6 opacity];
  double v26 = v25;
  if (v24 != v26)
  {
    *(float *)&double v26 = v24;
    [v6 setOpacity:v26];
  }
  -[CRLMovieRep p_strokeFrameForRenderableFrame:](self, "p_strokeFrameForRenderableFrame:", v11, v13, v15, v17);
  -[CRLMovieRep p_setPositionAndBoundsIfDifferent:position:bounds:](self, "p_setPositionAndBoundsIfDifferent:position:bounds:", v6, v18, v20, v27, v28, v29, v30);
  if ((v7 & 1) == 0)
  {
    uint64_t v31 = [(CRLMovieRep *)self p_shapeRenderableForPlayerStroke];
    -[CRLMovieRep p_applyBasicStroke:toRenderable:bounds:](self, "p_applyBasicStroke:toRenderable:bounds:", v5, v31, v11, v13, v15, v17);
  }
  +[CATransaction commit];
}

- (void)drawInLayerContext:(CGContext *)a3
{
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

- (void)processChangedProperty:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLMovieRep;
  -[CRLStyledRep processChangedProperty:](&v8, "processChangedProperty:");
  if ((uint64_t)a3 > 39)
  {
    switch(a3)
    {
      case '(':
        [(CRLMovieRep *)self setNeedsDisplay];
        id v5 = [(CRLCanvasRep *)self canvas];
        [v5 invalidateContentLayersForRep:self];

        [(CRLMovieRep *)self p_updatePlayButtonVisibility];
        [(CRLMovieRep *)self p_listenForAssetChangesIfAppropriate];
        break;
      case ')':
        [(CRLMovieRep *)self p_updateStartTime];
        break;
      case '*':
        [(CRLMovieRep *)self p_updateEndTime];
        break;
      case ',':
        [(CRLMovieRep *)self p_updateVolume];
        break;
      case '-':
        [(CRLMovieRep *)self p_updateRoundedCornersForPlayerRenderableIfNeeded];
        unsigned __int8 v7 = [(CRLCanvasRep *)self canvas];
        [v7 invalidateContentLayersForRep:self];

        goto LABEL_14;
      case '4':
        [(CRLMovieRep *)self p_startOrStopLoopingStickerIfNecessary];
        [(CRLMovieRep *)self p_updateLoopingSettingForMoviePlaybackIfNeeded];
        break;
      default:
        return;
    }
    return;
  }
  switch(a3)
  {
    case 0xFuLL:
      [(CRLMovieRep *)self p_disposeStrokeRenderable];
      goto LABEL_14;
    case 0x10uLL:
LABEL_14:
      [(CRLMovieRep *)self setNeedsDisplay];
      return;
    case 0x12uLL:
      [(CRLMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateRenderable];
      double v6 = [(CRLCanvasRep *)self canvas];
      [v6 invalidateContentLayersForRep:self];

      [(CRLMovieRep *)self p_listenForAssetChangesIfAppropriate];
      [(CRLMovieRep *)self p_stopUpdatingUIStateForMoviePlayability];
      [(CRLMovieRep *)self p_updateUIStateForMoviePlayability];
      [(CRLMovieRep *)self p_updatePlayButtonVisibility];
      break;
  }
}

- (BOOL)p_shouldStopPlayingWhenDeselected
{
  return ![(CRLMovieRep *)self p_isLoopingSticker];
}

- (void)becameSelected
{
  v7.receiver = self;
  v7.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v7 becameSelected];
  if ([(CRLMovieRep *)self p_shouldPlayerControllerExistThroughoutSelection])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    id v4 = sub_1000CC6D0;
    id v5 = &unk_1014CBBB0;
    double v6 = self;
    if (+[NSThread isMainThread]) {
      v4((uint64_t)block);
    }
    else {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    [(CRLMovieRep *)self p_updatePlayButtonVisibility];
  }
}

- (void)becameNotSelected
{
  if ([(CRLMovieRep *)self p_shouldStopPlayingWhenDeselected])
  {
    [(CRLMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateRenderable];
    [(CRLMovieRep *)self p_updatePlayButtonVisibility];
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v3 becameNotSelected];
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (void)screenScaleDidChange
{
  playButtonKnob = self->_playButtonKnob;
  self->_playButtonKnob = 0;

  v4.receiver = self;
  v4.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v4 screenScaleDidChange];
}

- (BOOL)manuallyControlsMiniFormatter
{
  if (!self->_isPlayable || ![(CRLMovieRep *)self p_playButtonFitsInFrame]) {
    return 0;
  }

  return [(CRLMovieRep *)self isPlaying];
}

- (id)p_selectionPath
{
  unsigned int v3 = [(CRLCanvasRep *)self isSelected];
  objc_super v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v5 = v4;
  if (v3)
  {
    double v6 = [v4 editorController];
    objc_super v7 = [v6 selectionPath];
  }
  else
  {
    double v6 = [v4 canvasEditor];
    objc_super v8 = [(CRLMovieRep *)self movieItem];
    objc_super v7 = [v6 selectionPathWithInfo:v8];
  }

  return v7;
}

- (void)toggleMiniFormatter
{
  unsigned int v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  objc_super v4 = [v3 layerHost];
  id v5 = [v4 miniFormatterPresenter];
  unsigned int v6 = [v5 isPresentingMiniFormatter];

  if (v6)
  {
    [(CRLMovieRep *)self p_hideMiniFormatter];
  }
  else
  {
    [(CRLMovieRep *)self p_showMiniFormatter];
  }
}

- (void)p_showMiniFormatter
{
  id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  if (([v6 documentIsSharedReadOnly] & 1) == 0)
  {
    unsigned int v3 = [v6 layerHost];
    objc_super v4 = [v3 miniFormatterPresenter];
    id v5 = [(CRLMovieRep *)self p_selectionPath];
    [v4 presentMiniFormatterForSelectionPath:v5];
  }
}

- (void)p_hideMiniFormatter
{
  id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned int v3 = [v5 layerHost];
  objc_super v4 = [v3 miniFormatterPresenter];
  [v4 dismissMiniFormatterForRep:self];
}

- (BOOL)p_isMiniFormatterShowing
{
  v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned int v3 = [v2 layerHost];
  objc_super v4 = [v3 miniFormatterPresenter];
  unsigned __int8 v5 = [v4 isPresentingMiniFormatter];

  return v5;
}

- (BOOL)p_miniFormatterIsPresentingSecondLayer
{
  v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned int v3 = [v2 layerHost];
  objc_super v4 = [v3 miniFormatterPresenter];
  unsigned __int8 v5 = [v4 isPresentingSecondLayerPopover];

  return v5;
}

- (BOOL)noKnobTogglePlayAndMiniFormatter
{
  if (!self->_isPlayable || [(CRLMovieRep *)self p_playButtonFitsInFrame]) {
    return 0;
  }
  if ([(CRLCanvasRep *)self isSelected]) {
    [(CRLMovieRep *)self i_togglePlayPauseTriggeredFromKnob];
  }
  return 1;
}

- (id)pauseButtonImage
{
  unsigned int v3 = +[CRLImage imageWithSystemImageNamed:@"pause.fill" pointSize:22.0];
  objc_super v4 = +[CRLColor whiteColor];
  unsigned __int8 v5 = [v3 compositedImageWithColor:v4 alpha:20 blendMode:1.0];

  [(CRLMovieRep *)self p_positionPauseButtonImage];

  return v5;
}

- (void)p_addPlayButtonToKnobs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLMovieRep *)self p_playButtonKnob];
  [v4 crl_addObjects:v5];

  [(CRLMovieRep *)self p_updateUIStateForMoviePlayability];
  [(CRLMovieRep *)self p_updatePlayButtonVisibility];
}

- (void)addKnobsToArray:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  id v4 = a3;
  [(CRLCanvasRep *)&v5 addKnobsToArray:v4];
  -[CRLMovieRep p_addPlayButtonToKnobs:](self, "p_addPlayButtonToKnobs:", v4, v5.receiver, v5.super_class);
}

- (unint64_t)enabledKnobMask
{
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  unint64_t v3 = [(CRLCanvasRep *)&v5 enabledKnobMask];
  if ([(CRLCanvasRep *)self shouldCreateKnobs]
    && [(CRLCanvasRep *)self isSelected]
    && ![(CRLMovieRep *)self p_playButtonFitsInFrame])
  {
    return v3 & 0x28A;
  }
  return v3;
}

- (id)newTrackerForKnob:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [[CRLCanvasButtonKnobTracker alloc] initWithRep:self knob:v4];
    [(CRLCanvasButtonKnobTracker *)v5 setTarget:self];
    id v6 = [(CRLMovieRep *)self p_playButtonKnob];

    if (v6 == v4) {
      [(CRLCanvasButtonKnobTracker *)v5 setAction:"i_togglePlayPauseTriggeredFromKnob"];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLMovieRep;
    objc_super v5 = [(CRLCanvasRep *)&v8 newTrackerForKnob:v4];
  }

  return v5;
}

- (void)p_showControls
{
  unint64_t v3 = [(CRLMovieRep *)self movieItem];
  id v4 = [v3 posterImageAssetPayload];
  unsigned __int8 v5 = [v4 needsDownload];

  if ([(CRLMovieRep *)self p_playButtonFitsInFrame]
    && (v5 & 1) == 0
    && ![(CRLMovieRep *)self p_isLoopingSticker])
  {
    id v6 = [(CRLMovieRep *)self p_playButtonKnob];
    [v6 setHidden:0];

    objc_super v7 = [(CRLMovieRep *)self p_playButtonKnob];
    objc_super v8 = [v7 renderable];
    [v8 removeAnimationForKey:@"hidden"];

    id v14 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    long long v9 = +[NSNumber numberWithFloat:0.0];
    [v14 setFromValue:v9];

    LODWORD(v10) = 1.0;
    double v11 = +[NSNumber numberWithFloat:v10];
    [v14 setToValue:v11];

    [v14 setDuration:0.2];
    double v12 = [(CRLMovieRep *)self p_playButtonKnob];
    double v13 = [v12 renderable];
    [v13 addAnimation:v14 forKey:@"hidden"];
  }
}

- (void)i_hidePlayButtonIndependently
{
  unint64_t v3 = [(CRLMovieRep *)self p_playButtonKnob];
  [v3 setHidden:1];

  id v4 = [(CRLMovieRep *)self p_playButtonKnob];
  unsigned __int8 v5 = [v4 renderable];
  [v5 removeAnimationForKey:@"hidden"];

  id v11 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  LODWORD(v6) = 1.0;
  objc_super v7 = +[NSNumber numberWithFloat:v6];
  [v11 setFromValue:v7];

  objc_super v8 = +[NSNumber numberWithFloat:0.0];
  [v11 setToValue:v8];

  [v11 setDuration:0.2];
  long long v9 = [(CRLMovieRep *)self p_playButtonKnob];
  double v10 = [v9 renderable];
  [v10 addAnimation:v11 forKey:@"hidden"];
}

- (void)p_hideControls
{
  [(CRLMovieRep *)self i_hidePlayButtonIndependently];
  if (![(CRLMovieRep *)self p_miniFormatterIsPresentingSecondLayer]
    && [(CRLMovieRep *)self manuallyControlsMiniFormatter])
  {
    [(CRLMovieRep *)self p_hideMiniFormatter];
  }
}

- (void)toggleShowingControls
{
  if ([(CRLMovieRep *)self p_isPresentingMiniFormatterOrPlayButtonVisible])
  {
    [(CRLMovieRep *)self p_hideControls];
  }
  else
  {
    id v7 = [(CRLCanvasRep *)self interactiveCanvasController];
    unint64_t v3 = [v7 canvasEditor];
    id v4 = [(CRLMovieRep *)self movieItem];
    unsigned __int8 v5 = [v3 selectionPathWithInfo:v4];
    double v6 = [v7 editorController];
    [v6 setSelectionPath:v5];

    [(CRLMovieRep *)self p_invalidateHideControlsTimeoutTimer];
    [(CRLMovieRep *)self p_showControls];
    [(CRLMovieRep *)self p_showMiniFormatter];
  }
}

- (void)p_invalidateHideControlsTimeoutTimer
{
  [(NSTimer *)self->_hideControlsTimeoutTimer invalidate];
  hideControlsTimeoutTimer = self->_hideControlsTimeoutTimer;
  self->_hideControlsTimeoutTimer = 0;
}

- (void)p_hideControlsWithDelay:(double)a3
{
  unsigned __int8 v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v6 = [v5 freehandDrawingToolkit];
  unsigned __int8 v7 = [v6 isLassoSelectionForMixedTypeEnabledInDrawingMode];

  if (!self->_hideControlsTimeoutTimer && (v7 & 1) == 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000CD39C;
    v10[3] = &unk_1014D3968;
    v10[4] = self;
    objc_super v8 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v10 block:a3];
    hideControlsTimeoutTimer = self->_hideControlsTimeoutTimer;
    self->_hideControlsTimeoutTimer = v8;
  }
}

- (BOOL)p_isPresentingMiniFormatterOrPlayButtonVisible
{
  v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  unint64_t v3 = [v2 layerHost];
  id v4 = [v3 miniFormatterPresenter];
  unsigned __int8 v5 = [v4 isPresentingMiniFormatter];

  return v5;
}

- (BOOL)p_isMovieKnob:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v4 = a3;
  if ([(CRLMovieRep *)self p_isMovieKnob:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLMovieRep;
    BOOL v5 = [(CRLCanvasRep *)&v7 directlyManagesVisibilityOfKnob:v4];
  }

  return v5;
}

- (void)handleFadeOutForZoom
{
  [(CRLMovieRep *)self i_hidePlayButtonIndependently];
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  [(CRLMediaRep *)&v3 handleFadeOutForZoom];
}

- (void)handleFadeInForZoom
{
  [(CRLMovieRep *)self p_updatePlayButtonVisibility];
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  [(CRLMediaRep *)&v3 handleFadeInForZoom];
}

- (void)didEndZooming
{
  id v3 = [(CRLCanvasRenderable *)self->_playerRenderable layer];
  [(CRLMovieRep *)self p_applyRoundedCornersTo:v3];
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  id v4 = a3;
  if ([(CRLMovieRep *)self p_isMovieKnob:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLMovieRep;
    BOOL v5 = [(CRLCanvasRep *)&v7 canUseSpecializedHitRegionForKnob:v4];
  }

  return v5;
}

- (CGPoint)positionOfPlayKnobForBounds:(CGRect)a3 viewScale:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v12 = CGRectGetMaxY(v20);
  int v13 = sub_1003E86EC();
  double v14 = MaxX - 36.0 / a4;
  if (v13) {
    double v15 = MaxY;
  }
  else {
    double v15 = v12;
  }
  if (v13) {
    double v14 = 36.0 / a4 + MinX;
  }
  double v16 = v15 - 36.0 / a4;
  result.CGFloat y = v16;
  result.CGFloat x = v14;
  return result;
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)CRLMovieRep;
  id v9 = a3;
  -[CRLCanvasRep positionOfStandardKnob:forBounds:](&v21, "positionOfStandardKnob:forBounds:", v9, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  id v14 = [(CRLMovieRep *)self p_playButtonKnob];

  if (v14 == v9)
  {
    if (![(CRLMovieRep *)self p_playButtonFitsInFrame]) {
      [(CRLMovieRep *)self p_updatePlayButtonVisibility];
    }
    double v15 = [(CRLCanvasRep *)self canvas];
    [v15 viewScale];
    -[CRLMovieRep positionOfPlayKnobForBounds:viewScale:](self, "positionOfPlayKnobForBounds:viewScale:", x, y, width, height, v16);
    double v11 = v17;
    double v13 = v18;
  }
  double v19 = v11;
  double v20 = v13;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (void)documentEditabilityDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v5 documentEditabilityDidChange];
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned int v4 = [v3 editingDisabled];

  if (v4) {
    [(CRLMovieRep *)self p_teardownPlayerController];
  }
  [(CRLMovieRep *)self p_updatePlayButtonVisibility];
}

- (id)playButtonImage
{
  id v3 = +[CRLImage imageWithSystemImageNamed:@"play.fill" pointSize:22.0];
  unsigned int v4 = +[CRLColor whiteColor];
  objc_super v5 = [v3 compositedImageWithColor:v4 alpha:20 blendMode:1.0];

  [(CRLMovieRep *)self p_positionPlayButtonImage];

  return v5;
}

- (id)p_playButtonKnob
{
  playButtonKnob = self->_playButtonKnob;
  if (!playButtonKnob)
  {
    unsigned int v4 = [CRLMovieKnob alloc];
    objc_super v5 = [(CRLMovieRep *)self playButtonImage];
    double v6 = +[CRLMovieRep CRLMovieButtonFillColor];
    objc_super v7 = [(CRLMovieKnob *)v4 initWithImage:v5 radius:v6 backgroundColor:self onRep:24.0];
    objc_super v8 = self->_playButtonKnob;
    self->_playButtonKnob = v7;

    if (!self->_isPlayable) {
      [(CRLCanvasButtonKnob *)self->_playButtonKnob setEnabled:0];
    }
    [(CRLMovieRep *)self p_positionPlayButtonImage];
    [(CRLMovieKnob *)self->_playButtonKnob setHidden:0];
    playButtonKnob = self->_playButtonKnob;
  }

  return playButtonKnob;
}

- (void)p_usePauseButtonKnobImage
{
  if (!self->_playButtonShowingPause)
  {
    self->_playButtonShowingPause = 1;
    id v4 = [(CRLMovieRep *)self pauseButtonImage];
    id v3 = [(CRLMovieRep *)self p_playButtonKnob];
    [v3 setImage:v4];
  }
}

- (void)p_usePlayButtonKnobImage
{
  if (self->_playButtonShowingPause)
  {
    self->_playButtonShowingPause = 0;
    id v4 = [(CRLMovieRep *)self playButtonImage];
    id v3 = [(CRLMovieRep *)self p_playButtonKnob];
    [v3 setImage:v4];
  }
}

- (void)p_hidePlayPauseButtonKnob
{
  id v2 = [(CRLMovieRep *)self p_playButtonKnob];
  [v2 setHidden:1];
}

- (void)p_updateUsePlayPauseButtonToMatchIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CRLMovieRep *)self p_isLoopingSticker])
  {
    [(CRLMovieRep *)self p_hidePlayPauseButtonKnob];
  }
  else if (v3)
  {
    [(CRLMovieRep *)self p_usePauseButtonKnobImage];
  }
  else
  {
    [(CRLMovieRep *)self p_usePlayButtonKnobImage];
  }
}

- (void)p_positionPlayButtonImage
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  BOOL v3 = [(CRLCanvasKnob *)self->_playButtonKnob renderable];
  [v3 bounds];
  double v8 = sub_100065738(v4, v5, v6, v7);
  double v10 = v9;

  double v11 = [(CRLCanvasButtonKnob *)self->_playButtonKnob imageRenderable];
  [v11 setPosition:v8 + 2.88, v10];

  +[CATransaction commit];
}

- (void)p_positionPauseButtonImage
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  BOOL v3 = [(CRLCanvasKnob *)self->_playButtonKnob renderable];
  [v3 bounds];
  double v8 = sub_100065738(v4, v5, v6, v7);
  double v10 = v9;
  double v11 = [(CRLCanvasButtonKnob *)self->_playButtonKnob imageRenderable];
  [v11 setPosition:v8 v10];

  +[CATransaction commit];
}

- (void)p_updateUIStateForMoviePlayability
{
  if (!self->_didCheckPlayability)
  {
    p_assetForPlayabilitdouble y = &self->_assetForPlayability;
    if (!self->_assetForPlayability)
    {
      CGFloat v4 = [(CRLMovieRep *)self movieItem];
      CGFloat v5 = [v4 movieAssetPayload];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000CE0CC;
      v16[3] = &unk_1014CBBB0;
      v16[4] = self;
      CGFloat v6 = objc_retainBlock(v16);
      if (v5)
      {
        if ([v5 needsDownload])
        {
          self->_isPlayable = 0;
          self->_didCheckPlayabilitdouble y = 1;
        }
        else
        {
          CGFloat v7 = [v5 type];
          double v8 = [v7 identifier];
          unsigned int v9 = +[CRLAnimatedGIFController canInitWithDataType:v8];

          if (!v9)
          {
            double v10 = [v5 AVAssetAndReturnError:0];
            self->_didCheckPlayabilitdouble y = 1;
            objc_storeStrong((id *)p_assetForPlayability, v10);
            self->_isPlayable = 0;
            double v11 = (void *)qword_1016A9058;
            v13[0] = _NSConcreteStackBlock;
            v13[1] = 3221225472;
            v13[2] = sub_1000CE21C;
            v13[3] = &unk_1014D3990;
            v13[4] = self;
            id v14 = v10;
            double v15 = v6;
            id v12 = v10;
            [v11 performAsync:v13];

            goto LABEL_10;
          }
          self->_didCheckPlayabilitdouble y = 1;
          self->_isPlayable = [v5 needsDownload] ^ 1;
        }
        ((void (*)(void *))v6[2])(v6);
      }
LABEL_10:
    }
  }
}

- (void)p_stopUpdatingUIStateForMoviePlayability
{
  [(AVAsset *)self->_assetForPlayability cancelLoading];
  assetForPlayabilitdouble y = self->_assetForPlayability;
  self->_assetForPlayabilitdouble y = 0;

  self->_didCheckPlayabilitdouble y = 0;
}

- (void)p_cancelUpdatingUIStateForMoviePlayability
{
  self->_didCancelUpdatingPlayButtonVisibilitdouble y = 1;
}

- (BOOL)p_shouldAllowPlaybackWhenEditingDisabled
{
  return [(CRLCanvasRep *)self everAllowedToBeSelectedAsADrawable];
}

- (BOOL)p_playButtonFitsInFrame
{
  BOOL v3 = [(CRLCanvasRep *)self canvas];
  if ([v3 isCanvasInteractive])
  {
    CGFloat v4 = [(CRLCanvasRep *)self canvas];
    [(CRLCanvasRep *)self naturalBounds];
    [v4 convertUnscaledToBoundsSize:v5, v6];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    [(CRLCanvasRep *)self naturalBounds];
    double v8 = v11;
    double v10 = v12;
  }

  return v10 >= 72.0 && v8 >= 72.0;
}

- (void)p_updatePlayButtonVisibility
{
  id v36 = [(CRLCanvasRep *)self canvas];
  if ([v36 isCanvasInteractive])
  {
    didCancelUpdatingPlayButtonVisibilitdouble y = self->_didCancelUpdatingPlayButtonVisibility;

    if (didCancelUpdatingPlayButtonVisibility) {
      return;
    }
    id v36 = [(CRLCanvasRep *)self interactiveCanvasController];
    CGFloat v4 = [v36 editorController];
    double v5 = [v4 selectionPath];
    double v6 = [v36 modelsForSelectionPath:v5];

    double v7 = [(CRLMovieRep *)self movieItem];
    if ([v6 count] == (id)1)
    {
      double v34 = [v6 anyObject];
    }
    else
    {
      double v34 = 0;
    }
    unsigned int v33 = [(CRLMovieRep *)self p_playButtonFitsInFrame];
    if ([(CRLMovieRep *)self p_isLoopingSticker])
    {
      if ([v36 editingDisabled]) {
        unsigned int v8 = ![(CRLMovieRep *)self p_shouldAllowPlaybackWhenEditingDisabled];
      }
      else {
        unsigned int v8 = 1;
      }
    }
    else
    {
      unsigned int v8 = 0;
    }
    double v9 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v10 = [v9 layerHost];
    double v11 = [v10 asiOSCVC];
    unsigned int v35 = [v11 isCurrentlyInQuickSelectMode];

    uint64_t v12 = objc_opt_class();
    double v13 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v14 = [v13 layerHost];
    double v15 = sub_1002469D0(v12, v14);

    double v16 = [v15 delegate];
    if (objc_opt_respondsToSelector()) {
      char v17 = [v16 allowsMoviePlayButton] ^ 1;
    }
    else {
      char v17 = 0;
    }
    double v18 = [v36 editingCoordinator];
    double v19 = [v18 followCoordinator];
    unsigned int v20 = [v19 isFollowing];

    int v21 = 0;
    if ((v8 | v35) & 1) != 0 || (v17) {
      goto LABEL_21;
    }
    if (!self->_didCheckPlayability) {
      goto LABEL_20;
    }
    int v21 = 0;
    if ([(CRLMovieRep *)self isPlaying] || ((v33 ^ 1) & 1) != 0) {
      goto LABEL_21;
    }
    if (!self->_isChangingDynamicVisibleTimeCount)
    {
      uint64_t v31 = [(CRLCanvasRep *)self repForSelecting];
      if (v31 == self)
      {
        int v21 = 1;
      }
      else
      {
        CGAffineTransform v32 = [(CRLCanvasRep *)self repForSelecting];
        if (v32) {
          int v21 = 0;
        }
        else {
          int v21 = v20;
        }
      }
    }
    else
    {
LABEL_20:
      int v21 = 0;
    }
LABEL_21:
    double v22 = [(CRLMovieRep *)self p_playButtonKnob];
    unsigned int v23 = [v22 isHidden];

    if (v21 == v23)
    {
      [(CRLMovieRep *)self p_updateUsePlayPauseButtonToMatchIsPlaying:[(CRLMovieRep *)self isPlaying]];
      [(CRLMovieRep *)self p_invalidateHideControlsTimeoutTimer];
      double v24 = v34;
      if (v21)
      {
        [(CRLMovieRep *)self p_showControls];
        float v25 = [(CRLCanvasRep *)self canvas];
        [v25 invalidateContentLayersForRep:self];
      }
      else
      {
        if (v34 == v7) {
          unsigned __int8 v26 = 0;
        }
        else {
          unsigned __int8 v26 = objc_msgSend(objc_msgSend(v34, "repClass"), "isSubclassOfClass:", objc_opt_class());
        }
        if (!v33 || (v26 & 1) != 0 || !self->_didCheckPlayability) {
          goto LABEL_37;
        }
        double v27 = [(CRLMovieRep *)self p_playButtonKnob];
        double v28 = [v27 renderable];
        double v29 = [v28 superlayer];

        char v30 = v29 ? v35 : 1;
        if ((v30 & 1) == 0) {
          [(CRLMovieRep *)self p_hideControlsWithDelay:3.25];
        }
        else {
LABEL_37:
        }
          [(CRLMovieRep *)self p_hideControls];
      }
    }
    else
    {
      double v24 = v34;
      if (v21 && self->_hideControlsTimeoutTimer)
      {
        [(CRLMovieRep *)self p_invalidateHideControlsTimeoutTimer];
        [(CRLMovieRep *)self p_updateUsePlayPauseButtonToMatchIsPlaying:[(CRLMovieRep *)self isPlaying]];
      }
    }
    [(CRLMediaRep *)self updateSpatialLabel];
  }
}

- (CRLMediaPlayerController)playerControllerForcingCreationIfNotPreExisting
{
  [(CRLMovieRep *)self p_setupPlayerControllerIfNecessary];
  playerController = self->_playerController;

  return playerController;
}

- (void)pausePlaybackIfNeeded
{
  if ([(CRLMovieRep *)self isPlaying])
  {
    [(CRLMovieRep *)self p_togglePlaying];
  }
}

- (void)stopPlaybackIfNeeded
{
  if (![(CRLMovieRep *)self p_isLoopingSticker])
  {
    if (self->_playerController)
    {
      [(CRLMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateRenderable];
      BOOL v3 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v3 invalidateContentLayersForRep:self];
    }
    [(CRLMovieRep *)self p_invalidateHideControlsTimeoutTimer];
  }
}

- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4
{
  double v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  double v9 = sub_1000CEC0C;
  double v10 = &unk_1014CBE78;
  double v11 = self;
  id v12 = a4;
  id v5 = v12;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, &v7);
  CFRunLoopWakeUp(Main);
  -[CRLMovieRep p_updateUsePlayPauseButtonToMatchIsPlaying:](self, "p_updateUsePlayPauseButtonToMatchIsPlaying:", 0, v7, v8, v9, v10, v11);
  [(CRLMovieRep *)self p_invalidateHideControlsTimeoutTimer];
}

- (void)playbackDidStopForPlayerController:(id)a3
{
  [(CRLMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateRenderable];
  id v4 = [(CRLCanvasRep *)self canvas];
  [v4 invalidateContentLayersForRep:self];
}

- (id)nowPlayingTitleWithPlaybackController:(id)a3
{
  if (self->_playerController == a3)
  {
    id v4 = [(CRLMovieRep *)self movieItem];
    BOOL v3 = [v4 title];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)nowPlayingImageProviderWithPlaybackController:(id)a3
{
  if (self->_playerController == a3)
  {
    BOOL v3 = [(CRLMovieRep *)self p_posterImageProvider];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isPlaying
{
  playerController = self->_playerController;
  if (playerController) {
    LOBYTE(playerController) = [(CRLCanvasRenderableMediaPlayerController *)playerController isPlaying];
  }
  return (char)playerController;
}

- (void)p_playTriggeredFromKnob
{
  if ([(CRLMovieRep *)self isPlayable])
  {
    BOOL v3 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
    [v3 setPlaying:1];

    [(CRLMovieRep *)self p_updateUsePlayPauseButtonToMatchIsPlaying:1];
    [(CRLMovieRep *)self p_updateLoopingSettingForMoviePlaybackIfNeeded];
  }
}

- (void)p_pauseTriggeredFromKnob
{
}

- (void)i_togglePlayPauseTriggeredFromKnob
{
  if (![(CRLCanvasRep *)self isSelected])
  {
    BOOL v3 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v4 = [v3 canvasEditor];
    id v5 = [(CRLMovieRep *)self movieItem];
    double v6 = [v4 selectionPathWithInfo:v5];
    double v7 = [v3 editorController];
    [v7 setSelectionPath:v6];
  }
  if ([(CRLMovieRep *)self isPlaying]) {
    [(CRLMovieRep *)self p_pauseTriggeredFromKnob];
  }
  else {
    [(CRLMovieRep *)self p_playTriggeredFromKnob];
  }
  id v11 = [(CRLCanvasRep *)self interactiveCanvasController];
  uint64_t v8 = [v11 freehandDrawingToolkit];
  unsigned int v9 = [v8 isLassoSelectionForMixedTypeEnabledInDrawingMode];

  if (v9)
  {
    double v10 = [v11 canvasEditor];
    [v10 hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected];
  }
}

- (void)p_togglePlaying
{
  if ([(CRLMovieRep *)self isPlayable])
  {
    BOOL v3 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
    uint64_t v4 = [v3 isPlaying] ^ 1;

    id v5 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
    [v5 setPlaying:v4];

    [(CRLMovieRep *)self p_updateUsePlayPauseButtonToMatchIsPlaying:v4];
    [(CRLMovieRep *)self p_invalidateHideControlsTimeoutTimer];
  }
}

- (void)updateUI_toMatchPlayer
{
  BOOL v3 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
  [v3 updatePlayingToMatchPlayer];

  BOOL v4 = [(CRLMovieRep *)self isPlaying];
  self->_playerLayerShouldBeDisplayed = v4;
  [(CRLMovieRep *)self p_updateUsePlayPauseButtonToMatchIsPlaying:v4];
  [(CRLMovieRep *)self p_updatePlayButtonVisibility];
  id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v5 invalidateContentLayersForRep:self];
}

- (BOOL)p_shouldPlayerControllerExistThroughoutSelection
{
  return 0;
}

- (void)p_setupPlayerControllerIfNecessary
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D39D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101075274();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D39F8);
    }
    BOOL v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_setupPlayerControllerIfNecessary]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1752 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (!self->_playerController)
  {
    if (!self->_isPlayable)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3A18);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010751EC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3A38);
      }
      double v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_setupPlayerControllerIfNecessary]");
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:1754 isFatal:0 description:"Setting up player controller when movie isn't playable!"];
    }
    unsigned int v9 = [(CRLMovieRep *)self movieItem];
    double v10 = [v9 movieAssetPayload];

    if ([v10 needsDownload])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3A58);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101075164();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3A78);
      }
      id v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_setupPlayerControllerIfNecessary]");
      double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1756 isFatal:0 description:"Setting up player controller for data that needs to be downloaded!"];
    }
    id v14 = [v10 type];
    double v15 = [v14 identifier];
    unsigned int v16 = +[CRLAnimatedGIFController canInitWithDataType:v15];

    if (v16)
    {
      [(CRLMovieRep *)self willChangeValueForKey:@"playerController"];
      char v17 = [[CRLAnimatedGIFController alloc] initWithData:v10 delegate:self];
      playerController = self->_playerController;
      self->_playerController = (CRLCanvasRenderableMediaPlayerController *)v17;

      [(CRLMovieRep *)self didChangeValueForKey:@"playerController"];
    }
    else
    {
      double v19 = [(CRLMovieRep *)self movieItem];
      unsigned int v20 = [v19 makeAVAssetAndReturnError:0];

      if (v20)
      {
        int v21 = +[AVPlayerItem playerItemWithAsset:v20];
        [(CRLMovieRep *)self willChangeValueForKey:@"playerController"];
        double v22 = [[CRLAVPlayerController alloc] initWithPlayerItem:v21 delegate:self];
        unsigned int v23 = self->_playerController;
        self->_playerController = (CRLCanvasRenderableMediaPlayerController *)v22;

        [(CRLMovieRep *)self didChangeValueForKey:@"playerController"];
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D3A98);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010750D0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D3AB8);
        }
        double v24 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v24);
        }
        int v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_setupPlayerControllerIfNecessary]");
        float v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v25, 1763, 0, "invalid nil value for '%{public}s'", "asset");
      }
    }
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014D3AD8);
    }
    unsigned __int8 v26 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      double v27 = self->_playerController;
      *(_DWORD *)buf = 134218240;
      id v42 = self;
      __int16 v43 = 2048;
      CGRect v44 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "movie rep %p creating player controller %p", buf, 0x16u);
    }
    [(CRLMovieRep *)self p_updateStartTime];
    double v28 = [(CRLMovieRep *)self movieItem];
    [v28 endTime];
    double v30 = v29;

    if (v30 != 0.0) {
      [(CRLMovieRep *)self p_updateEndTime];
    }
    [(CRLMovieRep *)self p_updateVolume];
    uint64_t v31 = [(CRLCanvasRenderableMediaPlayerController *)self->_playerController crl_addObserver:self forKeyPath:@"playing" options:4 context:off_10166B710];
    observationTokenForPlayingStatus = self->_observationTokenForPlayingStatus;
    self->_observationTokenForPlayingStatus = v31;

    [(CRLCanvasRenderableMediaPlayerController *)self->_playerController addObservationToken:self->_observationTokenForPlayingStatus];
    [(CRLMovieRep *)self p_setupPlayerLayerIfNecessary];
    CFStringRef v39 = @"CRLInteractiveCanvasControllerMediaRepKey";
    v40 = self;
    unsigned int v33 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v34 = [v33 mutableCopy];
    unsigned int v35 = v34;
    id v36 = self->_playerController;
    if (v36) {
      [v34 setObject:v36 forKeyedSubscript:@"CRLInteractiveCanvasControllerPlayerControllerKey"];
    }
    CGAffineTransform v37 = +[NSNotificationCenter defaultCenter];
    double v38 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v37 postNotificationName:@"CRLInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification" object:v38 userInfo:v35];
  }
}

- (void)p_teardownPlayerController
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3AF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010752FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3B18);
    }
    BOOL v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_teardownPlayerController]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1801 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateRenderable];
  [(CRLMovieRep *)self p_teardownPlayerControllerIfNeeded];
}

- (void)p_setNeedsTeardownPlayerControllerOnUpdateRenderable
{
  self->_needsTeardownPlayerController = 1;
}

- (void)p_teardownPlayerControllerIfNeeded
{
  unint64_t isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  if (isChangingDynamicVisibleTimeCount && self->_needsTeardownPlayerController)
  {
    LOBYTE(isChangingDynamicVisibleTimeCount) = 1;
    BOOL v4 = &OBJC_IVAR___CRLMovieRep__delayTearingDownPlayerController;
LABEL_33:
    *((unsigned char *)&self->super.super.super.super.isa + *v4) = isChangingDynamicVisibleTimeCount;
    goto LABEL_34;
  }
  playerController = self->_playerController;
  if (playerController && self->_needsTeardownPlayerController)
  {
    if (self->_delayTearingDownPlayerController)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3B38);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101075384();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3B58);
      }
      double v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_teardownPlayerControllerIfNeeded]");
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:1815 isFatal:0 description:"Attempting to tear down the player controller with inconsistent flag/dynamic time state"];

      playerController = self->_playerController;
    }
    unsigned int v9 = [(CRLCanvasRenderableMediaPlayerController *)playerController isPlaying];
    double v10 = self->_playerController;
    if (v9)
    {
      [(CRLCanvasRenderableMediaPlayerController *)v10 setPlaying:0];
    }
    else
    {
      unsigned int v11 = [(CRLCanvasRenderableMediaPlayerController *)v10 isFastReversing];
      id v12 = self->_playerController;
      if (v11)
      {
        [(CRLCanvasRenderableMediaPlayerController *)v12 setFastReversing:0];
      }
      else if ([(CRLCanvasRenderableMediaPlayerController *)v12 isFastForwarding])
      {
        [(CRLCanvasRenderableMediaPlayerController *)self->_playerController setFastForwarding:0];
      }
    }
    [(CRLCanvasRenderableMediaPlayerController *)self->_playerController crl_removeObserverForToken:self->_observationTokenForPlayingStatus];
    [(CRLCanvasRenderableMediaPlayerController *)self->_playerController removeObservationToken:self->_observationTokenForPlayingStatus];
    observationTokenForPlayingStatus = self->_observationTokenForPlayingStatus;
    self->_observationTokenForPlayingStatus = 0;

    if (self->_currentlyObservingPlayerLayer)
    {
      id v14 = (objc_class *)objc_opt_class();
      double v15 = sub_10024715C(v14, self->_playerRenderable);
      [v15 removeReadyToDisplayObserver:self context:off_10166B708];
    }
    [(CRLMovieRep *)self willChangeValueForKey:@"playerController"];
    [(CRLCanvasRenderableMediaPlayerController *)self->_playerController teardown];
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014D3B78);
    }
    unsigned int v16 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      char v17 = self->_playerController;
      *(_DWORD *)buf = 134218240;
      double v27 = self;
      __int16 v28 = 2048;
      double v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "movie rep %p clearing player controller %p in p_teardownPlayerController", buf, 0x16u);
    }
    double v18 = self->_playerController;
    self->_playerController = 0;

    [(CRLMovieRep *)self didChangeValueForKey:@"playerController"];
    self->_playerLayerShouldBeDisplayed = 0;
    if ([(CRLCanvasRenderable *)self->_renderableToStroke isEqual:self->_playerRenderable])
    {
      renderableToStroke = self->_renderableToStroke;
      self->_renderableToStroke = 0;
    }
    [(CRLMovieRep *)self p_invalidateHideControlsTimeoutTimer];
    [(CRLMovieRep *)self p_updateUsePlayPauseButtonToMatchIsPlaying:0];
    [(CRLCanvasRenderable *)self->_playerRenderable setDelegate:0];
    playerRenderable = self->_playerRenderable;
    self->_playerRenderable = 0;

    int v21 = +[NSNotificationCenter defaultCenter];
    double v22 = [(CRLCanvasRep *)self interactiveCanvasController];
    CFStringRef v24 = @"CRLInteractiveCanvasControllerMediaRepKey";
    float v25 = self;
    unsigned int v23 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v21 postNotificationName:@"CRLInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification" object:v22 userInfo:v23];

    unint64_t isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  }
  if (!isChangingDynamicVisibleTimeCount)
  {
    BOOL v4 = &OBJC_IVAR___CRLMovieRep__needsTeardownPlayerController;
    goto LABEL_33;
  }
LABEL_34:
  [(CRLMediaRep *)self updateSpatialLabel];
}

- (void)p_updateVolume
{
  if (self->_playerController)
  {
    [(CRLMovieRep *)self volume];
    int v4 = v3;
    id v6 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
    LODWORD(v5) = v4;
    [v6 setVolume:v5];
  }
}

- (void)p_updateStartTime
{
  if (self->_playerController)
  {
    int v3 = [(CRLMovieRep *)self movieItem];
    [v3 startTime];
    double v5 = v4;

    id v6 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
    [v6 setStartTime:v5];
  }
}

- (void)p_updateEndTime
{
  if (self->_playerController)
  {
    int v3 = [(CRLMovieRep *)self movieItem];
    [v3 endTime];
    double v5 = v4;

    id v6 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
    [v6 setEndTime:v5];
  }
}

- (void)p_startOrStopLoopingStickerIfNecessary
{
  id v16 = [(CRLCanvasRep *)self canvas];
  if ([v16 isCanvasInteractive])
  {
    int v3 = [(CRLMovieRep *)self movieItem];
    unsigned int v4 = [v3 isAnimatedImage];

    if (v4)
    {
      if (self->_isPlayable)
      {
        if (!+[NSThread isMainThread])
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D3B98);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10107540C();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D3BB8);
          }
          double v5 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v5);
          }
          id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_startOrStopLoopingStickerIfNecessary]");
          double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
          +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1903 isFatal:0 description:"This operation must only be performed on the main thread."];
        }
        if (self->_currentlyDrawingPencilKitStroke)
        {
          unsigned int v8 = 0;
        }
        else
        {
          unsigned int v9 = [(CRLMovieRep *)self movieItem];
          unsigned int v8 = [v9 isLooping];
        }
        unsigned int v10 = [(CRLMovieRep *)self isPlaying];
        playerController = self->_playerController;
        if (playerController) {
          BOOL v12 = [(CRLCanvasRenderableMediaPlayerController *)playerController repeatMode] != (id)1;
        }
        else {
          BOOL v12 = 1;
        }
        int v13 = v10 ^ 1 | v12;
        if (v8)
        {
          if (v13)
          {
            [(CRLMovieRep *)self p_setupPlayerControllerIfNecessary];
            [(CRLCanvasRenderableMediaPlayerController *)self->_playerController setRepeatMode:1];
            [(CRLCanvasRenderableMediaPlayerController *)self->_playerController setPlaying:1];
            self->_playerLayerShouldBeDisplayed = 1;
            id v14 = [(CRLCanvasRep *)self interactiveCanvasController];
            double v15 = [v14 renderableForRep:self];
            [(CRLMovieRep *)self p_arrangeRenderableVisibility:v15];
          }
        }
        else if ((v13 & 1) == 0)
        {
          [(CRLMovieRep *)self stopPlaybackIfNeeded];
          [(CRLMovieRep *)self p_showControls];
        }
      }
      else
      {
        [(CRLMovieRep *)self p_updateUIStateForMoviePlayability];
      }
    }
  }
  else
  {
  }
}

- (void)p_updateLoopingSettingForMoviePlaybackIfNeeded
{
  if (self->_playerController)
  {
    int v3 = [(CRLMovieRep *)self movieItem];
    unsigned __int8 v4 = [v3 isAnimatedImage];

    if ((v4 & 1) == 0)
    {
      double v5 = [(CRLMovieRep *)self movieItem];
      unsigned int v6 = [v5 isLooping];

      playerController = self->_playerController;
      [(CRLCanvasRenderableMediaPlayerController *)playerController setRepeatMode:v6];
    }
  }
}

- (BOOL)p_isLoopingSticker
{
  int v3 = [(CRLMovieRep *)self movieItem];
  if ([v3 isAnimatedImage])
  {
    unsigned __int8 v4 = [(CRLMovieRep *)self movieItem];
    unsigned __int8 v5 = [v4 isLooping];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)additionalRenderablesOverRenderable
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [(CRLMovieRep *)self p_startOrStopLoopingStickerIfNecessary];
  if (self->_playerRenderable) {
    [v3 addObject:];
  }
  unsigned __int8 v4 = [(CRLMovieRep *)self p_playerStrokeRenderable];
  if (v4) {
    [v3 addObject:v4];
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLMovieRep;
  unsigned __int8 v5 = [(CRLMediaRep *)&v7 additionalRenderablesOverRenderable];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  [(CRLStyledRep *)&v3 setNeedsDisplay];
  [(CRLMovieRep *)self p_disposeStrokeRenderable];
}

- (void)p_listenForAssetChangesIfAppropriate
{
  downloadObserverIdentifier = self->_downloadObserverIdentifier;
  if (!downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3BD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101075494();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3BF8);
    }
    unsigned __int8 v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    unsigned __int8 v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_listenForAssetChangesIfAppropriate]");
    unsigned int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1977, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");

    downloadObserverIdentifier = self->_downloadObserverIdentifier;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D0BD4;
  v13[3] = &unk_1014D3C48;
  v13[4] = self;
  void v13[5] = downloadObserverIdentifier;
  objc_super v7 = downloadObserverIdentifier;
  unsigned int v8 = objc_retainBlock(v13);
  unsigned int v9 = [(CRLMovieRep *)self movieItem];
  unsigned int v10 = [v9 movieAssetPayload];
  ((void (*)(void *, void *))v8[2])(v8, v10);

  unsigned int v11 = [(CRLMovieRep *)self movieItem];
  BOOL v12 = [v11 posterImageAssetPayload];
  ((void (*)(void *, void *))v8[2])(v8, v12);
}

- (void)p_handleAssetPreparationCompletionForAsset:(id)a3
{
  id v4 = a3;
  if (![(CRLCanvasRep *)self hasBeenRemoved])
  {
    [(CRLMovieRep *)self setNeedsDisplay];
    unsigned __int8 v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v5 invalidateContentLayersForRep:self];

    unsigned int v6 = [(CRLMovieRep *)self movieItem];
    id v7 = [v6 movieAssetPayload];

    if (v7 == v4)
    {
      [(CRLMovieRep *)self p_stopUpdatingUIStateForMoviePlayability];
      [(CRLMovieRep *)self p_updateUIStateForMoviePlayability];
      unsigned int v10 = +[NSNotificationCenter defaultCenter];
      unsigned int v11 = [(CRLCanvasRep *)self interactiveCanvasController];
      CFStringRef v13 = @"CRLInteractiveCanvasControllerMediaRepKey";
      id v14 = self;
      BOOL v12 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      [v10 postNotificationName:@"CRLInteractiveCanvasControllerDidLoadAssetForMediaRepNotification" object:v11 userInfo:v12];
    }
    else
    {
      unsigned int v8 = [(CRLMovieRep *)self movieItem];
      id v9 = [v8 posterImageAssetPayload];

      if (v9 == v4) {
        [(CRLMovieRep *)self p_showControls];
      }
    }
    [(CRLMovieRep *)self p_updatePlayButtonVisibility];
  }
}

- (id)visuallySignificantDataSet
{
  objc_super v3 = [(CRLMovieRep *)self movieItem];
  id v4 = [v3 posterImageAssetPayload];

  unsigned __int8 v5 = [(CRLMovieRep *)self movieItem];
  unsigned int v6 = [v5 movieAssetPayload];

  id v7 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
  unsigned int v8 = v7;
  if (v4) {
    [v7 addObject:v4];
  }
  if (v6) {
    [v8 addObject:v6];
  }
  if ([v8 count])
  {
    id v9 = v8;
  }
  else
  {
    id v9 = +[NSSet set];
  }
  unsigned int v10 = v9;

  return v10;
}

- (BOOL)shouldShowLoadingUI
{
  objc_super v3 = [(CRLMovieRep *)self movieItem];
  id v4 = [v3 posterImageAssetPayload];
  if ([v4 needsDownload]) {
    BOOL v5 = !self->_playerLayerShouldBeDisplayed;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)dynamicResizeDidBegin
{
  [(CRLMovieRep *)self p_disposeStrokeRenderable];
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  objc_super v3 = [(CRLCanvasRep *)&v5 dynamicResizeDidBegin];

  return v3;
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4 = a3;
  [(CRLMovieRep *)self p_disposeStrokeRenderable];
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v5 dynamicResizeDidEndWithTracker:v4];
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  memset(&v12, 0, sizeof(v12));
  id v4 = [(CRLCanvasRep *)self layout];
  objc_super v5 = [v4 originalPureGeometry];
  unsigned int v6 = v5;
  if (v5) {
    [v5 fullTransform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v12, &t1, &v10);

  CGAffineTransform v10 = v12;
  unsigned int v8 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v10];

  return v8;
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  [(CRLMovieRep *)self p_disposeStrokeRenderable];
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  id v4 = [(CRLCanvasRep *)&v5 dynamicResizeDidBegin];
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  id v4 = a3;
  [(CRLMovieRep *)self p_disposeStrokeRenderable];
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v5 dynamicFreeTransformDidEndWithTracker:v4];
}

- (double)visibleTime
{
  if (self->_isChangingDynamicVisibleTimeCount)
  {
    id v2 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
    [v2 absoluteCurrentTime];
  }
  else
  {
    id v2 = [(CRLMovieRep *)self movieItem];
    [v2 posterTime];
  }
  double v4 = v3;

  return v4;
}

- (double)absoluteCurrentTime
{
  id v2 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
  [v2 absoluteCurrentTime];
  double v4 = v3;

  return v4;
}

- (void)dynamicVisibleTimeChangeDidBegin
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3C68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101075528();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3C88);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeChangeDidBegin]");
    objc_super v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:2087 isFatal:0 description:"Dynamic poster time changes can only be made on the main thread"];
  }
  unint64_t isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  self->_unint64_t isChangingDynamicVisibleTimeCount = isChangingDynamicVisibleTimeCount + 1;
  if (!isChangingDynamicVisibleTimeCount)
  {
    [(CRLMovieRep *)self p_updatePlayButtonVisibility];
    long long v7 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
    [v7 beginScrubbing];
  }
}

- (void)dynamicVisibleTimeUpdateToValue:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3CA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101075638();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3CC8);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    CGAffineTransform v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeUpdateToValue:withTolerance:completionHandler:]");
    unsigned int v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:2097 isFatal:0 description:"Dynamic poster time changes can only be made on the main thread"];
  }
  if (!self->_isChangingDynamicVisibleTimeCount)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3CE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010755B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3D08);
    }
    CGAffineTransform v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    CFStringRef v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeUpdateToValue:withTolerance:completionHandler:]");
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:2098 isFatal:0 description:"A dynamic poster time change must be in progress"];
  }
  double v15 = [(CRLMovieRep *)self playerControllerForcingCreationIfNotPreExisting];
  [v15 scrubToTime:v8 withTolerance:a3 completionHandler:a4];
}

- (void)dynamicVisibleTimeChangeDidEnd
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3D28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101075748();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3D48);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeChangeDidEnd]");
    objc_super v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:2104 isFatal:0 description:"Dynamic poster time changes can only be made on the main thread"];
  }
  unint64_t isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  if (!isChangingDynamicVisibleTimeCount)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3D68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010756C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3D88);
    }
    long long v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeChangeDidEnd]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:2105 isFatal:0 description:"Mismatch between starting and ending dynamic visible poster time changes"];

    unint64_t isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  }
  unint64_t v10 = isChangingDynamicVisibleTimeCount - 1;
  self->_unint64_t isChangingDynamicVisibleTimeCount = v10;
  if (!v10)
  {
    [(CRLCanvasRenderableMediaPlayerController *)self->_playerController cancelPendingSeeks];
    [(CRLCanvasRenderableMediaPlayerController *)self->_playerController endScrubbing];
    [(CRLMovieRep *)self p_updatePlayButtonVisibility];
    if (self->_delayTearingDownPlayerController)
    {
      self->_delayTearingDownPlayerController = 0;
      [(CRLMovieRep *)self p_teardownPlayerController];
    }
  }
}

- (float)volume
{
  if (self->_isChangingDynamicVolume) {
    return self->_dynamicVolume;
  }
  double v3 = [(CRLMovieRep *)self movieItem];
  [v3 volume];
  float v5 = v4;

  return v5;
}

- (void)dynamicVolumeChangeDidBegin
{
  [(CRLMovieRep *)self volume];
  self->_dynamicVolume = v3;
  self->_isChangingDynamicVolume = 1;
}

- (void)dynamicVolumeUpdateToValue:(float)a3
{
  self->_dynamicVolume = a3;
  [(CRLMovieRep *)self p_updateVolume];
}

- (void)dynamicVolumeChangeDidEnd
{
  self->_isChangingDynamicVolume = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  CFStringRef v13 = v12;
  if (off_10166B710 == a6)
  {
    [(CRLMovieRep *)self p_updatePlayButtonVisibility];
    [(CRLCanvasRep *)self invalidateKnobs];
  }
  else if (off_10166B708 == a6)
  {
    id v14 = [v12 objectForKey:NSKeyValueChangeNewKey];
    unsigned int v15 = [v14 BOOLValue];

    if (v15)
    {
      id v16 = (objc_class *)objc_opt_class();
      char v17 = sub_10024715C(v16, self->_playerRenderable);
      [v17 removeReadyToDisplayObserver:self context:off_10166B708];
      self->_currentlyObservingPlayerLayer = 0;
      self->_playerLayerShouldBeDisplayed = 1;
      double v18 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v18 invalidateContentLayersForRep:self];
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CRLMovieRep;
    [(CRLMovieRep *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

+ (id)CRLMovieButtonFillColor
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000D203C;
  id v10 = sub_1000D204C;
  id v11 = 0;
  id v2 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D2054;
  v5[3] = &unk_1014D3DB0;
  v5[4] = &v6;
  +[UITraitCollection crl_withTraitCollectionAsCurrent:v2 performBlock:v5];
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  if ([(CRLMovieRep *)self noKnobTogglePlayAndMiniFormatter])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v5 = [(CRLMovieRep *)self isPlaying];
    if (v5)
    {
      [(CRLMovieRep *)self toggleShowingControls];
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 1;
}

- (void)willBeginEyedropperMode
{
  if ([(CRLMovieRep *)self isPlaying])
  {
    [(CRLMovieRep *)self p_togglePlaying];
    [(CRLMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateRenderable];
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  [(CRLCanvasRep *)&v3 willBeginEyedropperMode];
}

- (void)prepareForPencilKitSnapshotting
{
}

- (void)didBeginPencilKitStroke
{
  self->_currentlyDrawingPencilKitStroke = 1;
  [(CRLMovieRep *)self p_stopPlaybackForPencilKitIfNeeded];
}

- (void)p_stopPlaybackForPencilKitIfNeeded
{
  if ([(CRLMovieRep *)self isPlaying]) {
    [(CRLMovieRep *)self p_togglePlaying];
  }
  id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  objc_super v3 = [v4 renderableForRep:self];
  self->_playerLayerShouldBeDisplayed = 0;
  [(CRLMovieRep *)self p_arrangeRenderableVisibility:v3];
  [(CRLMovieRep *)self p_teardownPlayerController];
}

- (void)didFinishPencilKitStroke
{
  self->_currentlyDrawingPencilKitStroke = 0;
  if ([(CRLMovieRep *)self p_isLoopingSticker])
  {
    self->_playerLayerShouldBeDisplayed = 1;
    id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    objc_super v3 = [v4 renderableForRep:self];
    [(CRLMovieRep *)self p_arrangeRenderableVisibility:v3];
    [(CRLMovieRep *)self p_startOrStopLoopingStickerIfNecessary];
  }
}

- (BOOL)isPlayable
{
  return self->_isPlayable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadObserverIdentifier, 0);
  objc_storeStrong((id *)&self->_hideControlsTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_playButtonKnob, 0);
  objc_storeStrong((id *)&self->_observationTokenForPlayingStatus, 0);
  objc_storeStrong((id *)&self->_assetForPlayability, 0);
  objc_storeStrong((id *)&self->_playerStrokeRenderable, 0);
  objc_storeStrong((id *)&self->_renderableToStroke, 0);
  objc_storeStrong((id *)&self->_playerRenderable, 0);

  objc_storeStrong((id *)&self->_playerController, 0);
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)prepareForPreview
{
  id v2 = self;
  if ([(CRLMovieRep *)v2 isPlaying]) {
    [(CRLMovieRep *)v2 pausePlaybackIfNeeded];
  }
}

- (void)enterPreviewMode
{
  id v2 = self;
  [(CRLMovieRep *)v2 prepareForPreview];
  sub_100FA5194();
}

@end