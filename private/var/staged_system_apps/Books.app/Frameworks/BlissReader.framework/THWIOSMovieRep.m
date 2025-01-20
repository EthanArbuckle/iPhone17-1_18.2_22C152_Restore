@interface THWIOSMovieRep
- (AVPlayerItem)playerItem;
- (AVPlayerViewController)moviePlayerViewController;
- (BCProgressTrackingRepTracker)progressTracker;
- (BOOL)animatedFromFullscreen;
- (BOOL)animating;
- (BOOL)autoplayAllowed;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canSelectChildRep:(id)a3;
- (BOOL)containerManagesChildView;
- (BOOL)directlyManagesLayerContent;
- (BOOL)enforceAnimationLayer;
- (BOOL)expandedPanelStartsVisible;
- (BOOL)freeTransformInteractionEnabledOverride;
- (BOOL)freeTransformShouldMoveAboveStatusBar;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)inFreeTransform;
- (BOOL)isExpanded;
- (BOOL)isInFullscreen;
- (BOOL)isPlaying;
- (BOOL)isVisibleOnCanvas;
- (BOOL)layerUpdatesPaused;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)moviePlayerControllerIsLoaded;
- (BOOL)p_hasValidViewForFreeTransform;
- (BOOL)p_shouldShowPosterImage;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)shouldShowMediaReplaceUI;
- (BOOL)tracksScore;
- (BOOL)wantsFullscreenOnlyDisplay;
- (BOOL)wantsPressAction;
- (BOOL)wantsToHandleTapsWhenLocked;
- (BOOL)widgetInteractionAllowAutoplayForCompact;
- (BOOL)widgetInteractionAllowOnPageForCompact;
- (CALayer)pressableAnimationLayer;
- (CALayer)pressableAnimationShadowLayer;
- (CGAffineTransform)freeTransform;
- (CGRect)ftcTargetFrame;
- (CGRect)rectForCompletion;
- (NSArray)childReps;
- (THAnimationController)animationController;
- (THWAutoplayConfig)autoplayConfig;
- (THWButtonControlRep)buttonControlRep;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWIOSMovieRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWMovieInfo)movieInfo;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (TSDContainerInfo)containerInfo;
- (UIView)reparentingView;
- (double)p_percentElapsed;
- (id)animationLayer;
- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)movieLayout;
- (id)removePosterLayer;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)targetLayer;
- (int)pressableAction;
- (int64_t)expandedWhitePointAdaptivityStyle;
- (void)addChildViewsToArray:(id)a3;
- (void)animationControllerDidPresent:(id)a3;
- (void)animationControllerWillPresent:(id)a3;
- (void)autoplayPause;
- (void)autoplayStart;
- (void)autoplayStop;
- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4;
- (void)buttonControlWasPressed:(id)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)drawInContextWithoutEffects:(CGContext *)a3 withOpacity:(BOOL)a4 forAlphaOnly:(BOOL)a5 drawChildren:(BOOL)a6;
- (void)expandableExpandedPresentationDidEnd;
- (void)expandableWillPresentExpanded;
- (void)freeTransformDidEndPassedThreshold:(BOOL)a3;
- (void)freeTransformWillBegin;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_moviePlayerNowPlayingWillChange:(id)a3;
- (void)p_moviePlayerPlaybackDidFinish:(id)a3;
- (void)p_pause;
- (void)p_play;
- (void)p_reportProgress;
- (void)p_setMoviePlayerBackgroundColor:(id)a3 animated:(BOOL)a4;
- (void)p_stop;
- (void)p_stopAndInvalidate;
- (void)p_teardownPlayerIsTransferringToExpanded:(BOOL)a3;
- (void)p_vantageDidChange:(id)a3;
- (void)pause;
- (void)play;
- (void)reparentTargetLayerIfBackedByView:(id)a3;
- (void)setAnimatedFromFullscreen:(BOOL)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setButtonControlRep:(id)a3;
- (void)setChildReps:(id)a3;
- (void)setHandlingPress:(BOOL)a3;
- (void)setInFreeTransform:(BOOL)a3;
- (void)setIsInFullscreen:(BOOL)a3;
- (void)setMoviePlayerControllerIsLoaded:(BOOL)a3;
- (void)setMoviePlayerViewController:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setPressableHandler:(id)a3;
- (void)setRemovePosterLayer:(id)a3;
- (void)setReparentingView:(id)a3;
- (void)stop;
- (void)updateChildrenFromLayout;
- (void)updateLayerGeometryFromLayout:(id)a3;
- (void)willAddChildView:(id)a3 toView:(id)a4;
- (void)willBeRemoved;
- (void)willBeginHandlingGesture:(id)a3;
- (void)willRemoveChildView:(id)a3;
@end

@implementation THWIOSMovieRep

- (THWIOSMovieRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)THWIOSMovieRep;
  v4 = [(THWIOSMovieRep *)&v17 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (!v4)
  {
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  v6 = [(THWIOSMovieRep *)v4 movieInfo];

  if (v6)
  {
    v7 = [THWFreeTransformableRepGestureTargetHandler alloc];
    v8 = [(THWIOSMovieRep *)v5 hostICC];
    v9 = [v8 widgetHost];
    v10 = [v9 freeTransformRepHandler];
    v11 = [(THWFreeTransformableRepGestureTargetHandler *)v7 initWithFreeTransformableRep:v5 handler:v10];
    freeTransformableHandler = v5->_freeTransformableHandler;
    v5->_freeTransformableHandler = v11;

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v5 selector:"p_moviePlayerNowPlayingWillChange:" name:@"THWMPMoviePlayerNowPlayingMovieWillChangeNotification" object:0];

    if ([(THWIOSMovieRep *)v5 isExpanded])
    {
      v14 = [(THWIOSMovieRep *)v5 hostICC];
      v15 = [v14 delegate];
      v5->_progressTracker = (BCProgressTrackingRepTracker *)(id)TSUProtocolCast();
    }
    else
    {
      v14 = [(THWIOSMovieRep *)v5 interactiveCanvasController];
      v5->_progressTracker = (BCProgressTrackingRepTracker *)(id)TSUProtocolCast();
    }

    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(THWIOSMovieRep *)self stop];
  moviePlayerViewController = self->_moviePlayerViewController;
  self->_moviePlayerViewController = 0;

  [(THWIOSMovieRep *)self setChildReps:0];
  v5 = [(THWIOSMovieRep *)self buttonControlRep];
  [v5 setDelegate:0];

  pressableHandler = self->_pressableHandler;
  self->_pressableHandler = 0;

  childReps = self->_childReps;
  self->_childReps = 0;

  freeTransformableHandler = self->_freeTransformableHandler;
  self->_freeTransformableHandler = 0;

  v9.receiver = self;
  v9.super_class = (Class)THWIOSMovieRep;
  [(THWIOSMovieRep *)&v9 dealloc];
}

- (BOOL)isPlaying
{
  v2 = [(THWIOSMovieRep *)self moviePlayerViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)play
{
  [(THWIOSMovieRep *)self p_play];
  objc_opt_class();
  BOOL v3 = [(THWIOSMovieRep *)self layout];
  v4 = [v3 mediaListener];
  TSUDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = +[THWAVController sharedController];
  [v5 transportControllerDidStartPlaying:v6];
}

- (void)pause
{
  [(THWIOSMovieRep *)self p_reportProgress];
  BOOL v3 = [(THWIOSMovieRep *)self moviePlayerViewController];
  v4 = [v3 player];
  [v4 pause];

  objc_opt_class();
  v5 = [(THWIOSMovieRep *)self layout];
  id v6 = [v5 mediaListener];
  TSUDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = +[THWAVController sharedController];
  [v7 transportControllerDidPausePlaying:v8];
}

- (void)stop
{
  [(THWIOSMovieRep *)self p_stop];
  objc_opt_class();
  BOOL v3 = [(THWIOSMovieRep *)self layout];
  v4 = [v3 mediaListener];
  TSUDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = +[THWAVController sharedController];
  [v5 transportControllerDidStopPlaying:v6];
}

- (THWMovieInfo)movieInfo
{
  objc_opt_class();
  BOOL v3 = [(THWIOSMovieRep *)self info];
  v4 = TSUDynamicCast();

  return (THWMovieInfo *)v4;
}

- (void)setMoviePlayerViewController:(id)a3
{
  id v12 = a3;
  if (self->_moviePlayerViewController) {
    [(THWIOSMovieRep *)self p_teardownPlayerIsTransferringToExpanded:1];
  }
  if (v12)
  {
    objc_storeStrong((id *)&self->_moviePlayerViewController, a3);
    v5 = +[NSNotificationCenter defaultCenter];
    id v6 = [(AVPlayerViewController *)self->_moviePlayerViewController player];
    v7 = [v6 currentItem];
    [v5 addObserver:self selector:"p_moviePlayerPlaybackDidFinish:" name:AVPlayerItemDidPlayToEndTimeNotification object:v7];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"p_vantageDidChange:" name:@"THVantageDidChangeNotification" object:0];

    objc_super v9 = [(THWIOSMovieRep *)self moviePlayerViewController];
    v10 = [v9 player];
    [v10 addObserver:self forKeyPath:@"status" options:1 context:off_568A40];

    [(THWIOSMovieRep *)self setMoviePlayerControllerIsLoaded:1];
  }
  v11 = [(THWIOSMovieRep *)self layout];
  [v11 invalidate];
}

- (void)willBeRemoved
{
  [(THWIOSMovieRep *)self setReparentingView:0];
  [(THWIOSMovieRep *)self setRemovePosterLayer:0];
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"THVantageDidChangeNotification" object:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_51B0;
  block[3] = &unk_456D40;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  pressableHandler = self->_pressableHandler;
  if (!pressableHandler)
  {
    objc_opt_class();
    v4 = [(THWIOSMovieRep *)self interactiveCanvasController];
    v5 = TSUDynamicCast();

    id v6 = [v5 pressHandlerForPressableReps];
    if (v6)
    {
      v7 = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:self pressHandler:v6];
      id v8 = self->_pressableHandler;
      self->_pressableHandler = v7;

      [(THWPressableRepGestureTargetHandler *)self->_pressableHandler setEnabledOnlyIfWidgetInteractionDisabledOnPage:1];
    }

    pressableHandler = self->_pressableHandler;
  }

  return pressableHandler;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (BOOL)p_shouldShowPosterImage
{
  BOOL v3 = [(THWIOSMovieRep *)self interactiveCanvasController];
  v4 = [v3 widgetHost];
  unsigned __int8 v5 = [v4 repIsPresentedExpanded:self];

  if ([(THWIOSMovieRep *)self isPlaying] || [(THWIOSMovieRep *)self isInFullscreen]) {
    unsigned int v6 = ![(THWIOSMovieRep *)self moviePlayerControllerIsLoaded];
  }
  else {
    LOBYTE(v6) = 1;
  }
  return v6 & (v5 ^ 1);
}

- (void)didUpdateLayer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)THWIOSMovieRep;
  [(THWIOSMovieRep *)&v12 didUpdateLayer:v4];
  if ([(THWIOSMovieRep *)self p_shouldShowPosterImage])
  {
    unsigned __int8 v5 = [(THWIOSMovieRep *)self movieInfo];
    unsigned int v6 = [v5 posterImageData];
    v7 = [v4 contents];

    if (!v7 && v6) {
      [v4 setContents:[TSDBitmapImageProvider CGImageForImageData:v6]];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_54D0;
    v8[3] = &unk_456D68;
    id v9 = v4;
    objc_copyWeak(&v10, &location);
    [(THWIOSMovieRep *)self setRemovePosterLayer:v8];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  if (!UIAccessibilityIsInvertColorsEnabled()) {
    [v4 th_accessibilityUndoInvertColorsIfNecessary];
  }
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withOpacity:(BOOL)a4 forAlphaOnly:(BOOL)a5 drawChildren:(BOOL)a6
{
}

- (void)drawInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  unsigned __int8 v5 = [(THWIOSMovieRep *)self layout];
  unsigned int v6 = [v5 geometry];
  [v6 size];
  TSDRectWithSize();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  id v19 = +[TSDImageProviderPool sharedPool];
  v15 = [(THWIOSMovieRep *)self movieInfo];
  v16 = [v15 posterImageData];
  if (v16)
  {
    objc_opt_class();
    objc_super v17 = [v19 providerForData:v16 shouldValidate:1];
    v18 = TSUDynamicCast();

    if (v18)
    {
      [v18 drawImageInContext:a3 rect:v8, v10, v12, v14];
    }
  }
  CGContextRestoreGState(a3);
}

- (BOOL)layerUpdatesPaused
{
  if ([(THWIOSMovieRep *)self inFreeTransform]) {
    return 1;
  }

  return [(THWIOSMovieRep *)self animating];
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  id v4 = a3;
  unsigned __int8 v5 = [(THWIOSMovieRep *)self layout];
  unsigned int v6 = [v5 geometry];
  [(THWIOSMovieRep *)self computeDirectLayerFrame:&v13 andTransform:&v10 basedOnLayoutGeometry:v6];

  long long v7 = v10;
  long long v8 = v11;
  long long v9 = v12;
  [(THWIOSMovieRep *)self antiAliasDefeatLayerFrame:&v13 forTransform:&v7];
  long long v7 = v10;
  long long v8 = v11;
  long long v9 = v12;
  [v4 setIfDifferentFrame:&v7 orTransform:v13, v14];
}

- (BOOL)wantsFullscreenOnlyDisplay
{
  BOOL v3 = [(THWIOSMovieRep *)self movieLayout];
  id v4 = [v3 info];
  unsigned __int8 v5 = [v4 geometry];
  [v5 size];
  if (v6 < 150.0)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    long long v7 = [(THWIOSMovieRep *)self pressableHandler];
    unsigned __int8 v8 = [v7 widgetInteractionDisabledOnPage];
  }
  return v8;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (id)movieLayout
{
  objc_opt_class();
  BOOL v3 = [(THWIOSMovieRep *)self layout];
  id v4 = TSUDynamicCast();

  return v4;
}

- (void)setChildReps:(id)a3
{
  unsigned __int8 v5 = (NSArray *)a3;
  p_childReps = &self->_childReps;
  if (self->_childReps != v5 && !-[NSArray isEqualToArray:](v5, "isEqualToArray:"))
  {
    [(NSArray *)*p_childReps makeObjectsPerformSelector:"setParentRep:" withObject:0];
    objc_storeStrong((id *)&self->_childReps, a3);
    [(NSArray *)*p_childReps makeObjectsPerformSelector:"setParentRep:" withObject:self];
  }

  _objc_release_x1();
}

- (BOOL)isVisibleOnCanvas
{
  BOOL v3 = [(THWIOSMovieRep *)self interactiveCanvasController];

  if (v3)
  {
    id v4 = [(THWIOSMovieRep *)self interactiveCanvasController];
    [v4 visibleUnscaledRect];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    CGFloat v12 = v11;

    [(THWIOSMovieRep *)self frameInUnscaledCanvas];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    double v18 = v17;
    CGFloat v20 = v19;
    v31.origin.x = v6;
    v31.origin.y = v8;
    v31.size.width = v10;
    v31.size.height = v12;
    v34.origin.x = v14;
    v34.origin.y = v16;
    v34.size.width = v18;
    v34.size.height = v20;
    BOOL v21 = CGRectIntersectsRect(v31, v34);
    if (v21 && v18 > v10)
    {
      v32.origin.x = v14;
      v32.origin.y = v16;
      v32.size.width = v18;
      v32.size.height = v20;
      CGFloat point = CGRectGetMidX(v32);
      v33.origin.x = v14;
      v33.origin.y = v16;
      v33.size.width = v18;
      v33.size.height = v20;
      CGFloat MidY = CGRectGetMidY(v33);
      CGFloat v23 = v6;
      CGFloat v24 = v8;
      double v25 = v10;
      CGFloat v26 = v12;
      CGFloat v27 = point;
      LOBYTE(v21) = CGRectContainsPoint(*(CGRect *)&v23, *(CGPoint *)&v27);
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }
  return v21;
}

- (BOOL)canHandleGesture:(id)a3
{
  return 0;
}

- (BOOL)handleGesture:(id)a3
{
  id v4 = a3;
  double v5 = [(THWIOSMovieRep *)self pressableHandler];
  unsigned int v6 = [v5 canHandleGesture:v4];

  if (!v6)
  {
    CGFloat v8 = [v4 gestureKind];
    double v9 = (void *)TSWPImmediatePress;

    if (v8 != v9)
    {
      double v7 = [(THWIOSMovieRep *)self freeTransformableHandler];
      goto LABEL_5;
    }
    objc_opt_class();
    double v10 = TSUDynamicCast();
    double v13 = [v10 view];
    unsigned int v14 = [v13 isAncestorScrollViewDragging];

    if (v14) {
      [v10 cancel];
    }
    if ([v4 gestureState] == 3)
    {
      double v15 = [(THWIOSMovieRep *)self autoplayConfig];
      unsigned int v16 = [v15 enabled];

      if (v16)
      {
        double v17 = [(THWIOSMovieRep *)self moviePlayerViewController];
        double v18 = [v17 player];
        [v18 rate];
        float v20 = v19;

        if (v20 != 0.0)
        {
          [(THWIOSMovieRep *)self pause];
          goto LABEL_15;
        }
      }
      else if ([(THWIOSMovieRep *)self isPlaying])
      {
        goto LABEL_15;
      }
      [(THWIOSMovieRep *)self play];
    }
LABEL_15:
    unsigned __int8 v11 = 1;
    goto LABEL_6;
  }
  double v7 = [(THWIOSMovieRep *)self pressableHandler];
LABEL_5:
  double v10 = v7;
  unsigned __int8 v11 = [v7 handleGesture:v4];
LABEL_6:

  return v11;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(THWIOSMovieRep *)self freeTransformableHandler];
  [v5 willBeginHandlingGesture:v4];
}

- (BOOL)isExpanded
{
  v2 = [(THWIOSMovieRep *)self layout];
  unsigned __int8 v3 = [v2 isExpanded];

  return v3;
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  v2 = [(THWIOSMovieRep *)self layout];
  unsigned __int8 v3 = [v2 geometry];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  return v7 < 660.0 || v5 < 960.0;
}

- (id)shadowPath
{
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 1;
}

- (void)freeTransformWillBegin
{
  unsigned __int8 v3 = [(THWIOSMovieRep *)self moviePlayerViewController];
  [v3 setShowsPlaybackControls:0];

  [(THWIOSMovieRep *)self setInFreeTransform:1];
  double v4 = [(THWIOSMovieRep *)self interactiveCanvasController];
  double v5 = [(THWIOSMovieRep *)self buttonControlRep];
  double v6 = [v4 layerForRep:v5];

  if (v6)
  {
    +[CATransaction begin];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_5E80;
    v8[3] = &unk_456D40;
    id v7 = v6;
    id v9 = v7;
    +[CATransaction setCompletionBlock:v8];
    [v7 addCABasicOpacityAnimationToValue:1 duration:0.0 removedOnCompletion:0.25];
    +[CATransaction commit];
  }
}

- (void)freeTransformDidEndPassedThreshold:(BOOL)a3
{
  [(THWIOSMovieRep *)self setInFreeTransform:0];
  double v5 = [(THWIOSMovieRep *)self interactiveCanvasController];
  double v6 = [(THWIOSMovieRep *)self buttonControlRep];
  id v7 = [v5 layerForRep:v6];

  if (v7)
  {
    +[CATransaction begin];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_5FE4;
    v12[3] = &unk_456D40;
    id v8 = v7;
    id v13 = v8;
    +[CATransaction setCompletionBlock:v12];
    [v8 addCABasicOpacityAnimationToValue:1 duration:1.0 removedOnCompletion:0.25];
    +[CATransaction commit];
  }
  if (!a3)
  {
    id v9 = [(THWIOSMovieRep *)self autoplayConfig];
    uint64_t v10 = [v9 enabled] ^ 1;
    unsigned __int8 v11 = [(THWIOSMovieRep *)self moviePlayerViewController];
    [v11 setShowsPlaybackControls:v10];
  }
}

- (CGRect)rectForCompletion
{
  if ([(THWIOSMovieRep *)self p_hasValidViewForFreeTransform])
  {
    unsigned __int8 v3 = [(THWIOSMovieRep *)self moviePlayerViewController];
    double v4 = [v3 view];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    unsigned __int8 v3 = [(THWIOSMovieRep *)self layout];
    [v3 frameInParent];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }

  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)freeTransformShouldMoveAboveStatusBar
{
  return 1;
}

- (BOOL)freeTransformInteractionEnabledOverride
{
  return 1;
}

- (BOOL)expandedPanelStartsVisible
{
  return 0;
}

- (THAnimationController)animationController
{
  animationController = self->_animationController;
  if (!animationController)
  {
    double v4 = objc_alloc_init(THAnimationController);
    double v5 = self->_animationController;
    self->_animationController = v4;

    [(THAnimationController *)self->_animationController addObserver:self];
    [(THAnimationController *)self->_animationController setSource:self];
    animationController = self->_animationController;
  }

  return animationController;
}

- (void)expandableWillPresentExpanded
{
  BOOL v3 = UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
  double v4 = [(THWIOSMovieRep *)self moviePlayerViewController];
  [v4 setShowsPlaybackControls:v3];

  double v5 = [(THWIOSMovieRep *)self moviePlayerViewController];
  double v6 = [v5 view];
  [v6 setAccessibilityViewIsModal:1];

  double v7 = [(THWIOSMovieRep *)self moviePlayerViewController];
  double v8 = [v7 view];
  [v8 setShouldGroupAccessibilityChildren:1];

  id v10 = [(THWIOSMovieRep *)self interactiveCanvasController];
  double v9 = [v10 canvasView];
  [v9 setAccessibilityElementsHidden:1];
}

- (void)expandableExpandedPresentationDidEnd
{
  BOOL v3 = [(THWIOSMovieRep *)self autoplayConfig];
  uint64_t v4 = [v3 enabled] ^ 1;
  double v5 = [(THWIOSMovieRep *)self moviePlayerViewController];
  [v5 setShowsPlaybackControls:v4];

  double v6 = [(THWIOSMovieRep *)self layout];
  [v6 invalidate];

  double v7 = [(THWIOSMovieRep *)self moviePlayerViewController];
  double v8 = [v7 view];
  [v8 setAccessibilityViewIsModal:0];

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
  id v10 = [(THWIOSMovieRep *)self interactiveCanvasController];
  double v9 = [v10 canvasView];
  [v9 setAccessibilityElementsHidden:0];
}

- (int64_t)expandedWhitePointAdaptivityStyle
{
  return 3;
}

- (BOOL)p_hasValidViewForFreeTransform
{
  BOOL v3 = [(THWIOSMovieRep *)self moviePlayerViewController];
  uint64_t v4 = [v3 view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(THWIOSMovieRep *)self moviePlayerViewController];
  if (v9)
  {
    id v10 = [(THWIOSMovieRep *)self moviePlayerViewController];
    double v11 = [v10 view];
    BOOL v13 = v6 > 0.0 && v11 != 0;
    BOOL v14 = v8 > 0.0 && v13;
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  BOOL v3 = [(THWIOSMovieRep *)self freeTransformableHandler];
  uint64_t v4 = [v3 ftc];
  unsigned int v5 = [v4 isFreeTransformInProgress];

  if (!v5) {
    goto LABEL_11;
  }
  double v6 = [(THWIOSMovieRep *)self freeTransformableHandler];
  double v7 = [v6 ftc];
  double v8 = [v7 freeTransformLayer];

  if (!v8)
  {
LABEL_11:
    if (![(THWIOSMovieRep *)self p_hasValidViewForFreeTransform]) {
      goto LABEL_5;
    }
    double v9 = [(THWIOSMovieRep *)self moviePlayerViewController];
    id v10 = [v9 view];
    double v8 = [v10 layer];

    if (!v8)
    {
LABEL_5:
      double v11 = [(THWIOSMovieRep *)self interactiveCanvasController];
      double v8 = [v11 layerForRep:self];
    }
  }

  return v8;
}

- (id)shadowAnimationLayer
{
  BOOL v3 = [(THWIOSMovieRep *)self freeTransformableHandler];
  uint64_t v4 = [v3 ftc];
  unsigned int v5 = [v4 isFreeTransformInProgress];

  if (v5)
  {
    double v6 = [(THWIOSMovieRep *)self freeTransformableHandler];
    double v7 = [v6 ftc];
    double v8 = [v7 shadowLayer];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (CGAffineTransform)freeTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  double v6 = [(THWIOSMovieRep *)self freeTransformableHandler];
  double v7 = [v6 ftc];
  unsigned int v8 = [v7 isFreeTransformInProgress];

  if (v8)
  {
    id v10 = [(THWIOSMovieRep *)self freeTransformableHandler];
    double v11 = [v10 ftc];
    double v12 = v11;
    if (v11)
    {
      [v11 currentTransform];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
    }
    *(_OWORD *)&retstr->a = v13;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = v15;
  }
  return result;
}

- (BOOL)enforceAnimationLayer
{
  return 1;
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  long long v5 = [(THWIOSMovieRep *)self freeTransformableHandler];
  double v6 = [v5 ftc];
  unsigned int v7 = [v6 isFreeTransformInProgress];
  if (v7)
  {
    v2 = [(THWIOSMovieRep *)self freeTransformableHandler];
    BOOL v3 = [v2 ftc];
    if (![v3 passedThreshold])
    {
      unsigned int v8 = 0;
      goto LABEL_6;
    }
  }
  unsigned int v8 = [(THWIOSMovieRep *)self animationLayer];
  if (v7)
  {
LABEL_6:
  }

  return v8;
}

- (CGRect)ftcTargetFrame
{
  BOOL v3 = [(THWIOSMovieRep *)self freeTransformableHandler];
  uint64_t v4 = [v3 ftc];
  if ([v4 isFreeTransformInProgress])
  {
    long long v5 = [(THWIOSMovieRep *)self freeTransformableHandler];
    double v6 = [v5 ftc];
    [v6 completionTargetRect];
    CGFloat x = v7;
    CGFloat y = v9;
    CGFloat width = v11;
    CGFloat height = v13;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)reparentTargetLayerIfBackedByView:(id)a3
{
  id v6 = [(THWIOSMovieRep *)self reparentingView];
  uint64_t v4 = [(THWIOSMovieRep *)self moviePlayerViewController];
  long long v5 = [v4 view];
  [v6 addSubview:v5];
}

- (void)animationControllerWillPresent:(id)a3
{
}

- (void)animationControllerDidPresent:(id)a3
{
  animationController = self->_animationController;
  self->_animationController = 0;

  [(THWIOSMovieRep *)self setAnimating:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6904;
  block[3] = &unk_456D40;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addChildViewsToArray:(id)a3
{
  id v29 = a3;
  uint64_t v4 = [(THWIOSMovieRep *)self moviePlayerViewController];
  uint64_t v5 = [v4 view];
  if (v5)
  {
    id v6 = (void *)v5;
    unsigned int v7 = [(THWIOSMovieRep *)self moviePlayerControllerIsLoaded];

    if (!v7) {
      goto LABEL_5;
    }
    [(THWIOSMovieRep *)self frameInUnscaledCanvas];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(THWIOSMovieRep *)self interactiveCanvasController];
    [v16 convertUnscaledToBoundsRect:v9, v11, v13, v15];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    double v25 = [(THWIOSMovieRep *)self moviePlayerViewController];
    CGFloat v26 = [v25 view];
    [v26 setFrame:v18, v20, v22, v24];

    CGFloat v27 = [(THWIOSMovieRep *)self moviePlayerViewController];
    v28 = [v27 view];
    [v29 addObject:v28];

    uint64_t v4 = +[UIColor clearColor];
    [(THWIOSMovieRep *)self p_setMoviePlayerBackgroundColor:v4 animated:0];
  }

LABEL_5:
}

- (BOOL)containerManagesChildView
{
  return 1;
}

- (void)willAddChildView:(id)a3 toView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 addSubview:v7];
  [(THWIOSMovieRep *)self setReparentingView:v6];

  double v8 = [(THWIOSMovieRep *)self moviePlayerViewController];
  id v9 = [v8 view];

  if (v9 == v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6C20;
    block[3] = &unk_456D40;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)willRemoveChildView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = [(THWIOSMovieRep *)self moviePlayerViewController];
    id v6 = [v5 view];

    id v4 = v7;
    if (v6 == v7)
    {
      [v7 removeFromSuperview];
      id v4 = v7;
    }
  }
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)updateChildrenFromLayout
{
  if ([(THWIOSMovieRep *)self p_shouldShowPosterImage])
  {
    id v3 = +[TSDContainerRep childrenFromLayoutInContainerRep:self];
    [(THWIOSMovieRep *)self setChildReps:v3];
  }
  else
  {
    [(THWIOSMovieRep *)self setChildReps:0];
  }
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  return +[TSDContainerRep containerRep:hitRep:withGesture:passingTest:](TSDContainerRep, "containerRep:hitRep:withGesture:passingTest:", self, a4, a5, a3.x, a3.y);
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v6 = TSUDynamicCast();

  [(THWIOSMovieRep *)self setButtonControlRep:v6];
  id v7 = [(THWIOSMovieRep *)self buttonControlRep];
  [v7 setDelegate:self];
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  id v5 = a4;
  id v6 = [(THWIOSMovieRep *)self buttonControlRep];

  if (v6 == v5)
  {
    id v7 = [(THWIOSMovieRep *)self buttonControlRep];
    [v7 setDelegate:0];

    [(THWIOSMovieRep *)self setButtonControlRep:0];
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = THBundle();
  CFStringRef v8 = @"ib_media_btn_small_pause-N";
  if (v5) {
    CFStringRef v8 = @"ib_media_btn_small_pause-P";
  }
  CFStringRef v9 = @"ib_media_movie_play-P";
  if (!v5) {
    CFStringRef v9 = @"ib_media_movie_play-N";
  }
  if (a4) {
    CFStringRef v10 = v8;
  }
  else {
    CFStringRef v10 = v9;
  }
  double v11 = +[TSUImage imageNamed:v10 inBundle:v7];

  return v11;
}

- (void)buttonControlWasPressed:(id)a3
{
  if ([(THWIOSMovieRep *)self wantsFullscreenOnlyDisplay])
  {
    id v4 = [(THWIOSMovieRep *)self interactiveCanvasController];
    BOOL v5 = [(THWIOSMovieRep *)self buttonControlRep];
    id v7 = [v4 layerForRep:v5];

    [v7 setOpacity:0.0];
    id v6 = [(THWIOSMovieRep *)self pressableHandler];
    [v6 spoofGesture];
  }
  else
  {
    [(THWIOSMovieRep *)self play];
  }
}

- (void)p_stopAndInvalidate
{
  [(THWIOSMovieRep *)self p_reportProgress];
  id v3 = [(THWIOSMovieRep *)self moviePlayerViewController];
  id v4 = [v3 player];
  [v4 pause];

  objc_opt_class();
  BOOL v5 = [(THWIOSMovieRep *)self layout];
  id v6 = [v5 mediaListener];
  TSUDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = +[THWAVController sharedController];
  [v7 transportControllerDidBecomeInvalid:v8];
}

- (void)p_stop
{
  [(THWIOSMovieRep *)self p_reportProgress];
  id v4 = [(THWIOSMovieRep *)self moviePlayerViewController];
  id v3 = [v4 player];
  [v3 pause];
}

- (void)p_pause
{
  [(THWIOSMovieRep *)self p_reportProgress];
  id v4 = [(THWIOSMovieRep *)self moviePlayerViewController];
  id v3 = [v4 player];
  [v3 pause];
}

- (void)p_setMoviePlayerBackgroundColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  CFStringRef v10 = sub_72EC;
  double v11 = &unk_456D90;
  double v12 = self;
  id v5 = a3;
  id v13 = v5;
  id v6 = objc_retainBlock(&v8);
  id v7 = v6;
  if (v4) {
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.25, v8, v9, v10, v11, v12);
  }
  else {
    ((void (*)(void ***))v6[2])(v6);
  }
}

- (void)p_play
{
  if (self->_moviePlayerViewController)
  {
    id v25 = [(THWIOSMovieRep *)self moviePlayerViewController];
    id v3 = [v25 player];
    [v3 play];
  }
  else
  {
    BOOL v4 = [(THWIOSMovieRep *)self movieInfo];
    id v5 = [v4 movieRemoteURL];
    id v6 = +[AVPlayerItem playerItemWithURL:v5];
    [(THWIOSMovieRep *)self setPlayerItem:v6];

    id v7 = +[NSNotificationCenter defaultCenter];
    id v8 = [(THWIOSMovieRep *)self playerItem];
    [v7 addObserver:self selector:"p_moviePlayerPlaybackDidFinish:" name:AVPlayerItemDidPlayToEndTimeNotification object:v8];

    id v9 = objc_alloc((Class)AVPlayer);
    CFStringRef v10 = [(THWIOSMovieRep *)self playerItem];
    id v25 = [v9 initWithPlayerItem:v10];

    double v11 = [(THWIOSMovieRep *)self movieInfo];
    double v12 = [v11 drmContext];
    [v25 setAllowsExternalPlayback:[v12 kiUanAfQBD5qIUraolUj] ^ 1];

    id v13 = [(THWIOSMovieRep *)self info];
    id v3 = [v13 drmContext];

    if ([v3 kiUanAfQBD5qIUraolUj])
    {
      double v14 = [(THWIOSMovieRep *)self playerItem];
      [v3 authorizeAVPlayerItemForPlayback:v14];
    }
    double v15 = (AVPlayerViewController *)objc_alloc_init((Class)AVPlayerViewController);
    moviePlayerViewController = self->_moviePlayerViewController;
    self->_moviePlayerViewController = v15;

    [(AVPlayerViewController *)self->_moviePlayerViewController setAllowsPictureInPicturePlayback:0];
    [(AVPlayerViewController *)self->_moviePlayerViewController setPlayer:v25];
    double v17 = [(THWIOSMovieRep *)self autoplayConfig];
    uint64_t v18 = [v17 enabled] ^ 1;
    double v19 = [(THWIOSMovieRep *)self moviePlayerViewController];
    [v19 setShowsPlaybackControls:v18];

    [(THWIOSMovieRep *)self setMoviePlayerControllerIsLoaded:0];
    double v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:self selector:"p_vantageDidChange:" name:@"THVantageDidChangeNotification" object:0];

    double v21 = +[NSNotificationCenter defaultCenter];
    double v22 = [(THWIOSMovieRep *)self moviePlayerViewController];
    [v21 postNotificationName:@"THWMPMoviePlayerNowPlayingMovieWillChangeNotification" object:v22];

    double v23 = [(THWIOSMovieRep *)self moviePlayerViewController];
    double v24 = [v23 player];
    [v24 addObserver:self forKeyPath:@"status" options:1 context:off_568A40];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_568A40 == a6 && [v10 isEqualToString:@"status"])
  {
    id v13 = [(THWIOSMovieRep *)self moviePlayerViewController];
    double v14 = [v13 player];
    double v15 = (char *)[v14 status];

    if (v15 == (unsigned char *)&dword_0 + 1)
    {
      double v16 = [(THWIOSMovieRep *)self moviePlayerViewController];
      double v17 = [v16 player];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_78AC;
      v19[3] = &unk_456DB8;
      v19[4] = self;
      [v17 prerollAtRate:v19 completionHandler:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0))];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)THWIOSMovieRep;
    [(THWIOSMovieRep *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)p_teardownPlayerIsTransferringToExpanded:(BOOL)a3
{
  id v5 = [(THWIOSMovieRep *)self moviePlayerViewController];

  if (v5)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:0 object:self->_moviePlayerViewController];

    id v7 = +[NSNotificationCenter defaultCenter];
    id v8 = [(THWIOSMovieRep *)self playerItem];
    [v7 removeObserver:self name:0 object:v8];

    id v9 = [(AVPlayerViewController *)self->_moviePlayerViewController player];
    [v9 removeObserver:self forKeyPath:@"status"];

    if (!a3)
    {
      id v10 = [(AVPlayerViewController *)self->_moviePlayerViewController player];
      [v10 pause];
    }
    id v11 = [(AVPlayerViewController *)self->_moviePlayerViewController view];
    [v11 removeFromSuperview];

    moviePlayerViewController = self->_moviePlayerViewController;
    self->_moviePlayerViewController = 0;

    [(THWIOSMovieRep *)self setMoviePlayerControllerIsLoaded:0];
  }
  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 removeObserver:self name:@"THVantageDidChangeNotification" object:0];
}

- (void)p_vantageDidChange:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v7 = [v4 valueForKey:@"THVantageChangeReason"];

  unsigned int v5 = [v7 isEqualToString:@"THVantageChangeReasonRotation"];
  if (([v7 isEqualToString:@"THVantageChangeReasonScrolling"] & 1) != 0
    || (unsigned int v6 = [v7 isEqualToString:@"THVantageChangeReasonPresentationMode"]) != 0)
  {
    unsigned int v6 = [(THWIOSMovieRep *)self isVisibleOnCanvas];
  }
  if (((v5 | v6) & 1) == 0) {
    [(THWIOSMovieRep *)self p_pause];
  }
}

- (void)p_moviePlayerNowPlayingWillChange:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(THWIOSMovieRep *)self moviePlayerViewController];
  if (v4)
  {
    unsigned int v5 = (void *)v4;
    unsigned int v6 = [v9 object];
    id v7 = [(THWIOSMovieRep *)self moviePlayerViewController];

    if (v6 != v7)
    {
      [(THWIOSMovieRep *)self p_teardownPlayerIsTransferringToExpanded:0];
      id v8 = [(THWIOSMovieRep *)self layout];
      [v8 invalidate];
    }
  }
}

- (void)p_moviePlayerPlaybackDidFinish:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AVPlayerViewController *)self->_moviePlayerViewController player];
  uint64_t v6 = [v5 currentItem];
  if (!v6) {
    goto LABEL_11;
  }
  id v7 = (void *)v6;
  id v8 = [v4 object];
  id v9 = [(AVPlayerViewController *)self->_moviePlayerViewController player];
  id v10 = [v9 currentItem];

  if (v8 == v10)
  {
    [(THWIOSMovieRep *)self p_reportProgress];
    unsigned int v5 = [(THWIOSMovieRep *)self movieInfo];
    if ([v5 loopOption])
    {
      if ([v5 loopOption] != (char *)&dword_0 + 1)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v11 = [(THWIOSMovieRep *)self moviePlayerViewController];
      id v12 = [v11 player];
      long long v17 = *(_OWORD *)&kCMTimeZero.value;
      CMTimeEpoch epoch = kCMTimeZero.epoch;
      [v12 seekToTime:&v17];

      id v13 = [(THWIOSMovieRep *)self moviePlayerViewController];
      double v14 = [v13 player];
      [v14 play];
    }
    else
    {
      double v15 = [(THWIOSMovieRep *)self moviePlayerViewController];
      double v16 = [v15 player];
      long long v17 = *(_OWORD *)&kCMTimeZero.value;
      CMTimeEpoch epoch = kCMTimeZero.epoch;
      [v16 seekToTime:&v17];

      if ([(THWIOSMovieRep *)self isInFullscreen]
        && ![(THWIOSMovieRep *)self animatedFromFullscreen]
        || [(THWIOSMovieRep *)self inFreeTransform])
      {
        goto LABEL_11;
      }
      [(THWIOSMovieRep *)self setAnimatedFromFullscreen:0];
      [(THWIOSMovieRep *)self p_teardownPlayerIsTransferringToExpanded:0];
      id v13 = [(THWIOSMovieRep *)self layout];
      [v13 invalidate];
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  id v4 = a4;
  [v4 setMinificationFilter:kCAFilterTrilinear];
  [v4 setMagnificationFilter:kCAFilterTrilinear];
}

- (CALayer)pressableAnimationLayer
{
  id v3 = [(THWIOSMovieRep *)self interactiveCanvasController];
  id v4 = [v3 layerForRep:self];

  return (CALayer *)v4;
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAction
{
  if ([(THWIOSMovieRep *)self meetsStageDimensionRequirementForExpanded]
    || (BOOL v3 = [(THWIOSMovieRep *)self wantsFullscreenOnlyDisplay]))
  {
    LOBYTE(v3) = [(THWIOSMovieRep *)self pressableAction] != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  BOOL v3 = [(THWIOSMovieRep *)self layout];
  char v4 = [v3 isExpanded] ^ 1;

  return v4;
}

- (int)pressableAction
{
  v2 = [(THWIOSMovieRep *)self autoplayConfig];
  if ([v2 enabled]) {
    int v3 = 0;
  }
  else {
    int v3 = 2;
  }

  return v3;
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (BOOL)widgetInteractionAllowAutoplayForCompact
{
  return 1;
}

- (double)p_percentElapsed
{
  int v3 = [(THWIOSMovieRep *)self moviePlayerViewController];
  char v4 = [v3 player];

  if (v4)
  {
    unsigned int v5 = [(THWIOSMovieRep *)self movieInfo];
    [v5 endTime];
    double v7 = v6;
    [v5 startTime];
    double v9 = v7 - v8;
    id v10 = [(THWIOSMovieRep *)self moviePlayerViewController];
    id v11 = [v10 player];
    id v12 = v11;
    if (v11) {
      [v11 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);

    [v5 startTime];
    if (v9 == 0.0) {
      double v13 = 0.0;
    }
    else {
      double v13 = (Seconds - v15) / v9;
    }
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (void)p_reportProgress
{
  [(THWIOSMovieRep *)self p_percentElapsed];
  if (v3 != 0.0)
  {
    progressTracker = self->_progressTracker;
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(BCProgressTrackingRepTracker *)progressTracker progressDidChangeForRep:self percent:v5];
  }
}

- (THWAutoplayConfig)autoplayConfig
{
  v2 = [(THWIOSMovieRep *)self info];
  double v3 = [v2 autoplayConfig];

  return (THWAutoplayConfig *)v3;
}

- (BOOL)autoplayAllowed
{
  v2 = [(THWIOSMovieRep *)self pressableHandler];
  unsigned __int8 v3 = [v2 widgetInteractionAllowAutoplay];

  return v3;
}

- (void)autoplayStart
{
  uint64_t v3 = [(THWIOSMovieRep *)self moviePlayerViewController];
  if (!v3) {
    goto LABEL_3;
  }
  char v4 = (void *)v3;
  id v5 = [(THWIOSMovieRep *)self moviePlayerViewController];
  double v6 = [v5 player];
  [v6 rate];
  float v8 = v7;

  if (v8 == 0.0)
  {
LABEL_3:
    double v9 = [(THWIOSMovieRep *)self moviePlayerViewController];
    id v10 = [v9 player];
    long long v15 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    [v10 seekToTime:&v15];

    [(THWIOSMovieRep *)self p_play];
    objc_opt_class();
    id v11 = [(THWIOSMovieRep *)self layout];
    id v12 = [v11 mediaListener];
    double v13 = TSUDynamicCast();

    double v14 = +[THWAVController sharedController];
    [v14 transportControllerDidStartAutoplaying:v13];
  }
}

- (void)autoplayStop
{
  if ([(THWIOSMovieRep *)self isPlaying])
  {
    [(THWIOSMovieRep *)self p_pause];
    uint64_t v3 = [(THWIOSMovieRep *)self moviePlayerViewController];
    char v4 = [v3 player];
    long long v9 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    [v4 seekToTime:&v9];

    objc_opt_class();
    id v5 = [(THWIOSMovieRep *)self layout];
    double v6 = [v5 mediaListener];
    float v7 = TSUDynamicCast();

    float v8 = +[THWAVController sharedController];
    [v8 transportControllerDidStopAutoplaying:v7];
  }
}

- (void)autoplayPause
{
  if ([(THWIOSMovieRep *)self isPlaying])
  {
    [(THWIOSMovieRep *)self p_pause];
  }
}

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
}

- (AVPlayerViewController)moviePlayerViewController
{
  return self->_moviePlayerViewController;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (BOOL)tracksScore
{
  return self->_tracksScore;
}

- (NSArray)childReps
{
  return self->_childReps;
}

- (THWButtonControlRep)buttonControlRep
{
  return self->_buttonControlRep;
}

- (void)setButtonControlRep:(id)a3
{
  self->_buttonControlRep = (THWButtonControlRep *)a3;
}

- (void)setPressableHandler:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)inFreeTransform
{
  return self->_inFreeTransform;
}

- (void)setInFreeTransform:(BOOL)a3
{
  self->_inFreeTransform = a3;
}

- (UIView)reparentingView
{
  return self->_reparentingView;
}

- (void)setReparentingView:(id)a3
{
  self->_reparentingView = (UIView *)a3;
}

- (BOOL)isInFullscreen
{
  return self->_isInFullscreen;
}

- (void)setIsInFullscreen:(BOOL)a3
{
  self->_isInFullscreen = a3;
}

- (BOOL)animatedFromFullscreen
{
  return self->_animatedFromFullscreen;
}

- (void)setAnimatedFromFullscreen:(BOOL)a3
{
  self->_animatedFromFullscreen = a3;
}

- (BOOL)moviePlayerControllerIsLoaded
{
  return self->_moviePlayerControllerIsLoaded;
}

- (void)setMoviePlayerControllerIsLoaded:(BOOL)a3
{
  self->_moviePlayerControllerIsLoaded = a3;
}

- (id)removePosterLayer
{
  return self->_removePosterLayer;
}

- (void)setRemovePosterLayer:(id)a3
{
}

- (BCProgressTrackingRepTracker)progressTracker
{
  return self->_progressTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_removePosterLayer, 0);
  objc_storeStrong((id *)&self->_pressableHandler, 0);
  objc_storeStrong((id *)&self->_childReps, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_moviePlayerViewController, 0);
  objc_storeStrong((id *)&self->_freeTransformableHandler, 0);

  objc_storeStrong((id *)&self->_animationController, 0);
}

@end