@interface THWWebRep
+ (BOOL)expandedAllowsFreeTransformForInfo:(id)a3;
+ (void)enumerateSubdomainsOfHost:(id)a3 usingBlock:(id)a4;
- (BOOL)autoplayAllowed;
- (BOOL)autoplayRequested;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)createdWebView;
- (BOOL)deferExposeWebView;
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)expandedHasRoomForPanelsWithHeight:(double)a3 inFrame:(CGRect)a4;
- (BOOL)expandedWantsButtonVisibleWhenNoPanels;
- (BOOL)freeTransformInteractionEnabledOverride;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)isExpanded;
- (BOOL)isExpanding;
- (BOOL)isFreeTransformInProgress;
- (BOOL)isWebContentLoaded;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)ownsWebView;
- (BOOL)p_becameVisibleOnCanvas;
- (BOOL)p_pointIsInRedZone:(CGPoint)a3 onView:(id)a4;
- (BOOL)p_stageAlmostCoversPage;
- (BOOL)panelDescriptionExpanded;
- (BOOL)playButtonPressed;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldForceDisableCrossfadeFromSource:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)stageAlmostCoversPage;
- (BOOL)suspendPosterRendering;
- (BOOL)tracksScore;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (BOOL)webView:(id)a3 handleURL:(id)a4;
- (BOOL)webView:(id)a3 shouldAcceptHitAtPoint:(CGPoint)a4 onView:(id)a5 withEvent:(id)a6;
- (BOOL)webView:(id)a3 shouldStartLoadWithURL:(id)a4 navigationType:(int)a5 deferredResponseHandler:(id)a6;
- (BOOL)widgetInteractionAllowAutoplayForCompact;
- (BOOL)widgetInteractionAllowOnPageForCompact;
- (CALayer)canvasPosterLayer;
- (CALayer)pressableAnimationShadowLayer;
- (CALayer)webViewPosterLayer;
- (CGAffineTransform)freeTransform;
- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (CGRect)deferredStageViewFrame;
- (CGRect)ftcTargetFrame;
- (CGRect)rectForCompletion;
- (PFDURLRequestScope)requestScope;
- (THAnimationController)animationController;
- (THWAutoplayConfig)autoplayConfig;
- (THWExpandedRepController)expandedRepController;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWPlatformWebViewProtocol)webView;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (THWWebBridgeController)bridgeController;
- (THWWebRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSWPassThroughView)stageView;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (id)animationLayer;
- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5;
- (id)expandedChildInfosForPanel:(int)a3;
- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4;
- (id)p_cachedLoadExternalContentApproval;
- (id)p_filteredOutURLSchemes;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)targetLayer;
- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7;
- (int)autoRotationMode;
- (int)expandedAppearance;
- (int)expandedAppearanceForPanel:(int)a3;
- (int)positionForChildView:(id)a3;
- (int)pressableAction;
- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)addChildViewsToArray:(id)a3;
- (void)animationControllerDidPresent:(id)a3;
- (void)autoplayPause;
- (void)autoplayStart;
- (void)autoplayStop;
- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4;
- (void)buttonControlWasPressed:(id)a3;
- (void)contentIsReady;
- (void)dealloc;
- (void)didAddChildView:(id)a3;
- (void)didExitExpanded;
- (void)didPresentExpanded;
- (void)expandableExpandedPresentationDidEnd;
- (void)expandedDidAppearPreAnimation;
- (void)expandedDidPresentWithController:(id)a3;
- (void)expandedDidRotateTransitionToSize:(CGSize)a3;
- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (void)expandedWillPresentWithController:(id)a3;
- (void)handleNotificationVantageDidChange:(id)a3;
- (void)p_autoplayIfDesired;
- (void)p_cacheLoadExternalContentApproval:(BOOL)a3;
- (void)p_exposeWebView;
- (void)p_loadSourceURL;
- (void)p_pauseOnCanvas;
- (void)p_play;
- (void)p_startAutoplay;
- (void)p_startAutoplayOnCanvas;
- (void)p_togglePanelDescriptionExpanded;
- (void)p_updateLayerContents:(id)a3 withImage:(id)a4;
- (void)p_updateStageViewFrame:(CGRect)a3;
- (void)p_webView:(id)a3 shouldStartLoadWithURL:(id)a4 navigationType:(int)a5 syncResponseHandler:(id)a6 asyncResponseHandler:(id)a7;
- (void)reparentAnimationLayerIfBackedByView:(id)a3;
- (void)reparentTargetLayerIfBackedByView:(id)a3;
- (void)replaceContentsFromRep:(id)a3;
- (void)screenScaleDidChange;
- (void)setAutoplayRequested:(BOOL)a3;
- (void)setBridgeController:(id)a3;
- (void)setCanvasPosterLayer:(id)a3;
- (void)setCreatedWebView:(BOOL)a3;
- (void)setDeferExposeWebView:(BOOL)a3;
- (void)setDeferredStageViewFrame:(CGRect)a3;
- (void)setExpandedRepController:(id)a3;
- (void)setExpanding:(BOOL)a3;
- (void)setHandlingPress:(BOOL)a3;
- (void)setIsWebContentLoaded:(BOOL)a3;
- (void)setOwnsWebView:(BOOL)a3;
- (void)setPanelDescriptionExpanded:(BOOL)a3;
- (void)setPlayButtonPressed:(BOOL)a3;
- (void)setPressableHandler:(id)a3;
- (void)setRequestScope:(id)a3;
- (void)setStageAlmostCoversPage:(BOOL)a3;
- (void)setStageView:(id)a3;
- (void)setSuspendPosterRendering:(BOOL)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewPosterLayer:(id)a3;
- (void)viewScaleDidChange;
- (void)webViewDidFinishLoad:(id)a3;
- (void)willBeRemoved;
- (void)willBeginHandlingGesture:(id)a3;
- (void)willRemoveChildView:(id)a3;
- (void)willReplaceContentsFromRep:(id)a3;
@end

@implementation THWWebRep

- (THWWebRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)THWWebRep;
  v4 = [(THWWebRep *)&v20 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4)
  {
    v4->_ownsWebView = 1;
    objc_opt_class();
    v6 = [(THWWebRep *)v5 interactiveCanvasController];
    v7 = TSUDynamicCast();

    v8 = [v7 pressHandlerForPressableReps];
    if (v8)
    {
      v9 = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:v5 pressHandler:v8];
      [(THWWebRep *)v5 setPressableHandler:v9];

      v10 = [(THWWebRep *)v5 pressableHandler];
      [v10 setEnabledOnlyIfWidgetInteractionDisabledOnPage:1];
    }
    v11 = [THWFreeTransformableRepGestureTargetHandler alloc];
    v12 = [(THWWebRep *)v5 hostICC];
    v13 = [v12 widgetHost];
    v14 = [v13 freeTransformRepHandler];
    v15 = [(THWFreeTransformableRepGestureTargetHandler *)v11 initWithFreeTransformableRep:v5 handler:v14];
    freeTransformableHandler = v5->_freeTransformableHandler;
    v5->_freeTransformableHandler = v15;

    v5->_stageAlmostCoversPage = [(THWWebRep *)v5 p_stageAlmostCoversPage];
    CGSize size = CGRectNull.size;
    v5->_deferredStageViewFrame.origin = CGRectNull.origin;
    v5->_deferredStageViewFrame.CGSize size = size;
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v5 selector:"handleNotificationVantageDidChange:" name:@"THVantageDidChangeNotification" object:0];
  }
  return v5;
}

- (void)dealloc
{
  if (self->_ownsWebView) {
    [(THWPlatformWebViewProtocol *)self->_webView setWebViewDelegate:0];
  }
  webView = self->_webView;
  self->_webView = 0;

  bridgeController = self->_bridgeController;
  self->_bridgeController = 0;

  stageView = self->_stageView;
  self->_stageView = 0;

  animationController = self->_animationController;
  self->_animationController = 0;

  freeTransformableHandler = self->_freeTransformableHandler;
  self->_freeTransformableHandler = 0;

  pressableHandler = self->_pressableHandler;
  self->_pressableHandler = 0;

  webViewPosterLayer = self->_webViewPosterLayer;
  self->_webViewPosterLayer = 0;

  canvasPosterLayer = self->_canvasPosterLayer;
  self->_canvasPosterLayer = 0;

  requestScope = self->_requestScope;
  self->_requestScope = 0;

  v12.receiver = self;
  v12.super_class = (Class)THWWebRep;
  [(THWWebRep *)&v12 dealloc];
}

+ (void)enumerateSubdomainsOfHost:(id)a3 usingBlock:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [@"autoplay." stringByAppendingString:v7];
    (*((void (**)(id, void *))a4 + 2))(v6, v8);

    id v9 = [@"manual." stringByAppendingString:v7];

    (*((void (**)(id, id))a4 + 2))(v6, v9);
  }
}

- (PFDURLRequestScope)requestScope
{
  if (!self->_requestScope)
  {
    v3 = [(THWWebRep *)self info];

    if (v3)
    {
      v4 = [(THWWebRep *)self info];
      v5 = [v4 drmContext];
      id v6 = [v4 bookBundleURL];
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x3032000000;
      v19 = sub_1ADB54;
      objc_super v20 = sub_1ADB64;
      id v7 = [v4 bookID];
      v22 = v7;
      v8 = +[NSArray arrayWithObjects:&v22 count:1];
      id v21 = [v8 mutableCopy];

      id v9 = objc_opt_class();
      v10 = [v4 bookID];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1ADB6C;
      v15[3] = &unk_45A818;
      v15[4] = &v16;
      [v9 enumerateSubdomainsOfHost:v10 usingBlock:v15];

      v11 = +[PFDURLRequestScope requestScopeWithHosts:v17[5] bookRootURL:v6 context:v5];
      requestScope = self->_requestScope;
      self->_requestScope = v11;

      _Block_object_dispose(&v16, 8);
    }
  }
  v13 = self->_requestScope;

  return v13;
}

- (void)willBeRemoved
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"THVantageDidChangeNotification" object:0];

  [(CALayer *)self->_webViewPosterLayer setDelegate:0];
  [(CALayer *)self->_canvasPosterLayer setDelegate:0];
  if ([(THWWebRep *)self ownsWebView])
  {
    webView = self->_webView;
    [(THWPlatformWebViewProtocol *)webView setWebViewDelegate:0];
  }
}

- (void)willReplaceContentsFromRep:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  TSUDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v14;
  if (v14)
  {
    if (([v14 ownsWebView] & 1) == 0)
    {
      id v6 = +[TSUAssertionHandler currentHandler];
      id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep willReplaceContentsFromRep:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"];
      [v6 handleFailureInFunction:v7 file:v8 lineNumber:224 description:@"unexpected webView ownership before replacing contents"];
    }
    -[THWWebRep setIsWebContentLoaded:](self, "setIsWebContentLoaded:", [v14 isWebContentLoaded]);
    id v9 = [v14 bridgeController];
    [(THWWebRep *)self setBridgeController:v9];

    v10 = [(THWWebRep *)self bridgeController];
    [v10 setJavascriptHandler:self];

    v11 = [v14 webView];
    [(THWWebRep *)self setWebView:v11];

    objc_super v12 = [(TSWPassThroughView *)self->_stageView layer];
    v13 = [(THWWebRep *)self webViewPosterLayer];
    [v12 addSublayer:v13];

    [(THWWebRep *)self setOwnsWebView:0];
    v5 = v14;
  }
}

- (void)replaceContentsFromRep:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v43 = TSUDynamicCast();

  id v6 = v43;
  if (v43)
  {
    if (![v43 ownsWebView] || -[THWWebRep ownsWebView](self, "ownsWebView"))
    {
      id v7 = +[TSUAssertionHandler currentHandler];
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep replaceContentsFromRep:]");
      id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"];
      [v7 handleFailureInFunction:v8 file:v9 lineNumber:243 description:@"unexpected webView ownership while replacing contents"];
    }
    [v43 setOwnsWebView:0];
    [(THWWebRep *)self setOwnsWebView:1];
    v10 = [(THWWebRep *)self stageView];
    v11 = [(THWWebRep *)self webView];
    [v10 addSubview:v11];

    uint64_t v12 = OBJC_IVAR___TSDRep_mCanvas;
    v13 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
    id v14 = [(THWWebRep *)self layout];
    [v14 webFrameInRoot];
    [v13 convertUnscaledToBoundsRect:];
    [*(id *)&self->super.TSDContainerRep_opaque[v12] contentsScale];
    TSDRoundedRectForScale();
    -[THWWebRep p_updateStageViewFrame:](self, "p_updateStageViewFrame:");

    [(THWPlatformWebViewProtocol *)self->_webView setWebViewDelegate:self];
    if ([(THWWebRep *)self createdWebView] && [(THWWebRep *)self isExpanded]
      || ![v43 isWebContentLoaded]
      || [(THWWebRep *)self deferExposeWebView])
    {
      v15 = [(THWWebRep *)self webView];
      [v15 setAlpha:0.0];

      uint64_t v16 = [(THWWebRep *)self webView];
      v17 = [(THWWebRep *)self stageView];
      [v17 bounds];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      v26 = [(THWWebRep *)self info];
      [v26 idealWebSize];
      [v16 setFrame:v19 naturalSize:v21, v23, v25, v27, v28];
    }
    else
    {
      v29 = [(THWWebRep *)self webView];
      v30 = [(THWWebRep *)self stageView];
      [v30 bounds];
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      v39 = [(THWWebRep *)self info];
      [v39 idealWebSize];
      [v29 setFrame:v32 naturalSize:v34, v36, v38, v40, v41];

      [(CALayer *)self->_webViewPosterLayer removeFromSuperlayer];
    }
    BOOL v5 = [(THWWebRep *)self isExpanded];
    id v6 = v43;
    if (!v5)
    {
      v42 = [(THWWebRep *)self interactiveCanvasController];
      [v42 layoutInvalidated];

      id v6 = v43;
    }
  }

  _objc_release_x1(v5, v6);
}

- (void)viewScaleDidChange
{
  v3 = [(THWWebRep *)self pressableHandler];
  unsigned int v4 = [v3 widgetInteractionDisabledOnPage];

  if (v4)
  {
    [(THWWebRep *)self p_pauseOnCanvas];
  }
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (BOOL)widgetInteractionAllowAutoplayForCompact
{
  return 1;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  id v4 = a3;
  if (!self->_stageView)
  {
    id v34 = v4;
    BOOL v5 = [(THWWebRep *)self info];
    id v6 = [v5 autoplayConfig];
    if (([v6 enabled] & 1) != 0 || -[THWWebRep isExpanded](self, "isExpanded"))
    {
    }
    else
    {
      BOOL playButtonPressed = self->_playButtonPressed;

      if (!playButtonPressed)
      {
        uint64_t v22 = OBJC_IVAR___TSDRep_mCanvas;
        double v23 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
        double v24 = [(THWWebRep *)self layout];
        [v24 stageFrame];
        [v23 convertUnscaledToBoundsRect:];
        [*(id *)&self->super.TSDContainerRep_opaque[v22] contentsScale];
        TSDRoundedRectForScale();
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;

        double v33 = [(THWWebRep *)self canvasPosterLayer];
        [v33 setFrame:v26, v28, v30, v32];

        uint64_t v19 = [(THWWebRep *)self canvasPosterLayer];
        goto LABEL_6;
      }
    }
    uint64_t v7 = OBJC_IVAR___TSDRep_mCanvas;
    v8 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
    id v9 = [(THWWebRep *)self layout];
    [v9 webFrame];
    [v8 convertUnscaledToBoundsRect:];
    [*(id *)&self->super.TSDContainerRep_opaque[v7] contentsScale];
    TSDRoundedRectForScale();
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    double v18 = [(THWWebRep *)self webViewPosterLayer];
    [v18 setFrame:v11, v13, v15, v17];

    uint64_t v19 = [(THWWebRep *)self webViewPosterLayer];
LABEL_6:
    double v20 = (void *)v19;
    [v34 addObject:v19];

    id v4 = v34;
  }
}

- (CALayer)webViewPosterLayer
{
  webViewPosterLayer = self->_webViewPosterLayer;
  if (!webViewPosterLayer)
  {
    id v4 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    BOOL v5 = self->_webViewPosterLayer;
    self->_webViewPosterLayer = v4;

    id v6 = [(THWWebRep *)self interactiveCanvasController];
    [(CALayer *)self->_webViewPosterLayer setDelegate:v6];

    [(CALayer *)self->_webViewPosterLayer setContentsGravity:kCAGravityResize];
    webViewPosterLayer = self->_webViewPosterLayer;
  }
  uint64_t v7 = [(CALayer *)webViewPosterLayer contents];
  if (v7 || !self->_ownsWebView) {
    goto LABEL_4;
  }
  if (!self->_suspendPosterRendering)
  {
    double v10 = self->_webViewPosterLayer;
    uint64_t v7 = [(THWWebRep *)self info];
    double v11 = [v7 defaultImage];
    [(THWWebRep *)self p_updateLayerContents:v10 withImage:v11];

LABEL_4:
  }
  v8 = self->_webViewPosterLayer;

  return v8;
}

- (CALayer)canvasPosterLayer
{
  canvasPosterLayer = self->_canvasPosterLayer;
  if (!canvasPosterLayer)
  {
    id v4 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    BOOL v5 = self->_canvasPosterLayer;
    self->_canvasPosterLayer = v4;

    id v6 = [(THWWebRep *)self interactiveCanvasController];
    [(CALayer *)self->_canvasPosterLayer setDelegate:v6];

    [(CALayer *)self->_canvasPosterLayer setContentsGravity:kCAGravityResize];
    canvasPosterLayer = self->_canvasPosterLayer;
  }
  uint64_t v7 = [(CALayer *)canvasPosterLayer contents];
  if (v7 || !self->_ownsWebView) {
    goto LABEL_4;
  }
  if (!self->_suspendPosterRendering)
  {
    double v10 = self->_canvasPosterLayer;
    uint64_t v7 = [(THWWebRep *)self info];
    double v11 = [v7 placeholderImage];
    [(THWWebRep *)self p_updateLayerContents:v10 withImage:v11];

LABEL_4:
  }
  v8 = self->_canvasPosterLayer;

  return v8;
}

- (void)p_updateLayerContents:(id)a3 withImage:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v11 = a3;
    uint64_t v7 = [(THWWebRep *)self canvas];
    [v7 contentsScale];
    double v9 = v8;

    id v10 = [v6 CGImageForContentsScale:v9];
    [v11 setContents:v10];
    [v11 setContentsScale:v9];
  }
}

- (void)screenScaleDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)THWWebRep;
  [(THWWebRep *)&v9 screenScaleDidChange];
  webViewPosterLayer = self->_webViewPosterLayer;
  id v4 = [(THWWebRep *)self info];
  BOOL v5 = [v4 defaultImage];
  [(THWWebRep *)self p_updateLayerContents:webViewPosterLayer withImage:v5];

  canvasPosterLayer = self->_canvasPosterLayer;
  uint64_t v7 = [(THWWebRep *)self info];
  double v8 = [v7 placeholderImage];
  [(THWWebRep *)self p_updateLayerContents:canvasPosterLayer withImage:v8];
}

- (void)p_updateStageViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(THWWebRep *)self isExpanding])
  {
    double v8 = [(THWWebRep *)self stageView];
    [v8 setFrame:CGRectMake(x, y, width, height)];

    objc_super v9 = [(THWWebRep *)self stageView];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = [(THWWebRep *)self webViewPosterLayer];
    [v18 setFrame:v11, v13, v15, v17];

    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }

  -[THWWebRep setDeferredStageViewFrame:](self, "setDeferredStageViewFrame:", x, y, width, height);
}

- (void)addChildViewsToArray:(id)a3
{
  id v4 = a3;
  if (![(THWWebRep *)self isExpanded])
  {
    BOOL v5 = [(THWWebRep *)self info];
    id v6 = [v5 autoplayConfig];
    if (([v6 enabled] & 1) != 0 || self->_playButtonPressed || self->_isWebContentLoaded)
    {
    }
    else
    {
      unsigned int v24 = [(THWWebRep *)self deferExposeWebView];

      if (!v24) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v7 = OBJC_IVAR___TSDRep_mCanvas;
  double v8 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
  objc_super v9 = [(THWWebRep *)self layout];
  [v9 webFrameInRoot];
  [v8 convertUnscaledToBoundsRect:];
  [*(id *)&self->super.TSDContainerRep_opaque[v7] contentsScale];
  TSDRoundedRectForScale();
  -[THWWebRep p_updateStageViewFrame:](self, "p_updateStageViewFrame:");

  if (self->_ownsWebView)
  {
    webView = self->_webView;
    double v11 = [(THWWebRep *)self stageView];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = [(THWWebRep *)self info];
    [v20 idealWebSize];
    -[THWPlatformWebViewProtocol setFrame:naturalSize:](webView, "setFrame:naturalSize:", v13, v15, v17, v19, v21, v22);

    if ([(THWWebRep *)self deferExposeWebView])
    {
      dispatch_time_t v23 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1AEA7C;
      block[3] = &unk_456D40;
      block[4] = self;
      dispatch_after(v23, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  [v4 addObject:self->_stageView];
LABEL_10:
}

- (int)positionForChildView:(id)a3
{
  return 2;
}

- (TSWPassThroughView)stageView
{
  if (!self->_stageView)
  {
    v3 = -[TSWPassThroughView initWithFrame:]([TSWPassThroughView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    stageView = self->_stageView;
    self->_stageView = v3;

    [(TSWPassThroughView *)self->_stageView setAcceptsHits:0];
    BOOL v5 = [(TSWPassThroughView *)self->_stageView layer];
    id v6 = [(THWWebRep *)self webViewPosterLayer];
    [v5 addSublayer:v6];

    if (!self->_webView)
    {
      [(THWWebRep *)self setCreatedWebView:1];
      uint64_t v7 = [(THWWebRep *)self requestScope];
      double v8 = [THWWebView alloc];
      objc_super v9 = [(THWWebRep *)self p_filteredOutURLSchemes];
      double v10 = [(THWWebView *)v8 initWithfilteredOutURLSchemes:v9 requestScope:v7];
      webView = self->_webView;
      self->_webView = v10;

      [(THWPlatformWebViewProtocol *)self->_webView disableScrolling];
      [(THWPlatformWebViewProtocol *)self->_webView hide];
      [(TSWPassThroughView *)self->_stageView addSubview:self->_webView];
    }
    if (!self->_bridgeController)
    {
      double v12 = [[THWWebBridgeController alloc] initWithView:self->_webView];
      bridgeController = self->_bridgeController;
      self->_bridgeController = v12;

      [(THWWebBridgeController *)self->_bridgeController setJavascriptHandler:self];
    }
  }
  double v14 = self->_stageView;

  return v14;
}

- (void)didAddChildView:(id)a3
{
  uint64_t v7 = (TSWPassThroughView *)a3;
  if (self->_ownsWebView) {
    [(THWPlatformWebViewProtocol *)self->_webView setWebViewDelegate:self];
  }
  if (self->_stageView == v7 && self->_playButtonPressed && self->_ownsWebView
    || ([(THWWebRep *)self webView], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v5 = (void *)v4, unsigned int v6 = [(THWWebRep *)self autoplayRequested], v5, v6))
  {
    [(THWWebRep *)self p_startAutoplay];
    [(THWWebRep *)self setAutoplayRequested:0];
  }
}

- (void)willRemoveChildView:(id)a3
{
  if (self->_ownsWebView)
  {
    id v3 = [(THWWebRep *)self webView];
    [v3 setWebViewDelegate:0];
  }
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  v2 = [(THWWebRep *)self pressableHandler];
  unsigned __int8 v3 = [v2 widgetInteractionDisabledOnPage];

  return v3;
}

- (BOOL)wantsPressAction
{
  if ([(THWWebRep *)self meetsStageDimensionRequirementForExpanded]) {
    return [(THWWebRep *)self pressableAction] != 0;
  }
  uint64_t v4 = [(THWWebRep *)self pressableHandler];
  if ([v4 widgetInteractionDisabledOnPage]) {
    BOOL v3 = [(THWWebRep *)self pressableAction] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  BOOL v3 = [(THWWebRep *)self layout];
  char v4 = [v3 isExpanded] ^ 1;

  return v4;
}

- (int)pressableAction
{
  return 2;
}

- (void)webViewDidFinishLoad:(id)a3
{
  char v4 = [(THWWebRep *)self info];
  unsigned int v5 = [v4 exposurePolicy];

  if (!v5)
  {
    dispatch_time_t v6 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1AEF04;
    block[3] = &unk_456D40;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  id v8 = a5;
  objc_super v9 = [v8 URL];
  double v10 = [v9 scheme];
  unsigned __int8 v11 = [v10 isEqualToString:@"x-ibooks-th"];

  if ((v11 & 1) == 0)
  {
    double v12 = [(THWWebRep *)self info];
    double v13 = [v12 autoplayConfig];
    if ([v13 enabled])
    {
      double v14 = [(THWWebRep *)self info];
      unsigned int v15 = [v14 allowNetworkAccess];

      if (!v15)
      {
        id v16 = 0;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v16 = v8;
LABEL_7:

  return v16;
}

- (void)p_webView:(id)a3 shouldStartLoadWithURL:(id)a4 navigationType:(int)a5 syncResponseHandler:(id)a6 asyncResponseHandler:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  double v14 = v13;
  if (v12) {
    id v13 = v12;
  }
  unsigned int v15 = (void (**)(id, id))objc_retainBlock(v13);
  id v16 = [(THWWebRep *)self p_cachedLoadExternalContentApproval];
  double v17 = [v11 scheme];
  unsigned __int8 v18 = [@"x-ibooks-th" isEqualToString:v17];

  double v19 = [v11 absoluteString];
  unsigned int v20 = [v19 isEqualToString:@"about:blank"];

  if (v20) {
    goto LABEL_4;
  }
  double v21 = [(THWWebRep *)self bridgeController];
  unsigned int v22 = [v21 handleURL:v11];

  if (v22) {
    goto LABEL_20;
  }
  dispatch_time_t v23 = [(THWWebRep *)self info];
  unsigned int v24 = [v23 autoplayConfig];
  if ([v24 enabled])
  {
    if (v18)
    {

      id v25 = &dword_0 + 1;
LABEL_12:
      v15[2](v15, v25);
      goto LABEL_21;
    }
    unsigned __int8 v26 = [v16 BOOLValue];

    if (v26)
    {
LABEL_11:
      id v25 = [v16 BOOLValue];
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ([v11 isFileURL])
  {
LABEL_20:
    v15[2](v15, 0);
    goto LABEL_21;
  }
  if (a5 != 5)
  {
    if (a5) {
      goto LABEL_21;
    }
    double v27 = +[TSKApplicationDelegate sharedDelegate];
    double v28 = [v27 validURLSchemes];
    double v29 = [v11 scheme];
    double v30 = [v29 lowercaseString];
    unsigned int v31 = [v28 containsObject:v30];

    if (!v31) {
      goto LABEL_20;
    }
LABEL_19:
    double v35 = +[TSKApplicationDelegate sharedDelegate];
    [v35 openURL:v11];

    goto LABEL_20;
  }
  double v32 = [v11 scheme];
  double v33 = [v32 lowercaseString];
  unsigned int v34 = [@"mailto" isEqualToString:v33];

  if (v34) {
    goto LABEL_19;
  }
  double v36 = +[THApplicationDelegate sharedDelegate];
  double v37 = [v36 urlSchemesNotRequiringUserPrompt];
  double v38 = [v11 scheme];
  unsigned int v39 = [v37 containsObject:v38];

  if (v39)
  {
LABEL_4:
    v15[2](v15, (char *)&dword_0 + 1);
    goto LABEL_21;
  }
  if (v16) {
    goto LABEL_11;
  }
  v48 = [(THWWebRep *)self layout];
  double v40 = [v48 layoutController];
  double v41 = [v40 canvas];
  v42 = [v41 canvasController];
  v43 = [v42 layerHost];
  v47 = [v43 viewController];

  v44 = +[THApplicationDelegate sharedDelegate];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1AF40C;
  v49[3] = &unk_45A840;
  v49[4] = self;
  id v45 = v14;
  id v50 = v45;
  id v46 = [v44 shouldAuthorizeURLToLoad:v11 loadContext:v47 completion:v49];

  if (v12)
  {
    (*((void (**)(id, id))v12 + 2))(v12, v46);
  }
  else if (v46)
  {
    (*((void (**)(id, uint64_t))v45 + 2))(v45, 1);
  }

LABEL_21:
}

- (BOOL)webView:(id)a3 shouldStartLoadWithURL:(id)a4 navigationType:(int)a5 deferredResponseHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v17 = 0;
  unsigned __int8 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1AF5C0;
  v16[3] = &unk_45A868;
  v16[4] = &v17;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1AF5D0;
  v14[3] = &unk_45A890;
  id v12 = a6;
  id v15 = v12;
  [(THWWebRep *)self p_webView:v10 shouldStartLoadWithURL:v11 navigationType:v7 syncResponseHandler:v16 asyncResponseHandler:v14];
  LOBYTE(v7) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v7;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(THWWebRep *)self pressableHandler];
  unsigned __int8 v6 = [v5 canHandleGesture:v4];

  if (v6)
  {
    unsigned __int8 v7 = 1;
  }
  else if (self->_ownsWebView)
  {
    id v8 = [(THWWebRep *)self freeTransformableHandler];
    unsigned __int8 v7 = [v8 canHandleGesture:v4];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)handleGesture:(id)a3
{
  id v4 = a3;
  if (!self->_ownsWebView)
  {
    unsigned int v5 = +[TSUAssertionHandler currentHandler];
    unsigned __int8 v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep handleGesture:]");
    unsigned __int8 v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:752 description:@"shouldn't be handling gestures when we don't own the webView"];
  }
  id v8 = [(THWWebRep *)self pressableHandler];
  unsigned __int8 v9 = [v8 handleGesture:v4];

  if (v9)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    id v11 = [(THWWebRep *)self freeTransformableHandler];
    unsigned __int8 v10 = [v11 handleGesture:v4];
  }
  return v10;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v7 = a3;
  id v4 = [v7 gestureKind];
  unsigned int v5 = (void *)TSDFreeTransform;

  if (v4 == v5)
  {
    unsigned __int8 v6 = [(THWWebRep *)self freeTransformableHandler];
    [v6 willBeginHandlingGesture:v7];
  }
}

- (BOOL)webView:(id)a3 handleURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(THWWebRep *)self webView];

  if (v8 == v7)
  {
    unsigned __int8 v10 = [v6 scheme];
    id v11 = [v10 lowercaseString];

    if (![v11 isEqualToString:@"ibooks"]
      || ([v6 host], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      id v13 = +[TSKApplicationDelegate sharedDelegate];
      [v13 openURL:v6];
      char v9 = 0;
LABEL_6:

      goto LABEL_7;
    }
    if ([(THWWebRep *)self isExpanded])
    {
      id v15 = [(THWWebRep *)self interactiveCanvasController];
      id v16 = [v15 delegate];
      id v13 = TSUProtocolCast();

      char v9 = v13 != 0;
      if (!v13) {
        goto LABEL_6;
      }
      [v13 handleHyperlinkWithURL:v6];
    }
    else
    {
      objc_opt_class();
      uint64_t v17 = [(THWWebRep *)self interactiveCanvasController];
      id v13 = TSUDynamicCast();

      [v13 performSelectorOnMainThread:"handleHyperlinkWithURL:" withObject:v6 waitUntilDone:0];
    }
    char v9 = 1;
    goto LABEL_6;
  }
  char v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)webView:(id)a3 shouldAcceptHitAtPoint:(CGPoint)a4 onView:(id)a5 withEvent:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  if ([(THWWebRep *)self stageAlmostCoversPage]) {
    unsigned int v10 = !-[THWWebRep p_pointIsInRedZone:onView:](self, "p_pointIsInRedZone:onView:", v9, x, y);
  }
  else {
    unsigned int v10 = 1;
  }
  id v11 = [(THWWebRep *)self pressableHandler];
  unsigned int v12 = [v11 widgetInteractionDisabledOnPage];

  int v13 = v10 & ~v12;
  if ([(THWWebRep *)self isExpanded]) {
    v13 &= ~-[THWWebRep p_pointIsInRedZone:onView:](self, "p_pointIsInRedZone:onView:", v9, x, y);
  }

  return v13;
}

- (void)expandedWillPresentWithController:(id)a3
{
  id v4 = a3;
  [(THWWebRep *)self setExpandedRepController:v4];
  objc_opt_class();
  unsigned int v5 = [v4 expandedRepSourceRep];
  TSUDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v4 expandedRepSourceRep];

  id v7 = TSUProtocolCast();

  if (!v8 && [v7 isFreeTransformInProgress]) {
    self->_suspendPosterRendering = 1;
  }
}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 0;
}

- (THAnimationController)animationController
{
  animationController = self->_animationController;
  if (!animationController)
  {
    id v4 = objc_alloc_init(THAnimationController);
    unsigned int v5 = self->_animationController;
    self->_animationController = v4;

    [(THAnimationController *)self->_animationController setSource:self];
    [(THAnimationController *)self->_animationController addObserver:self];
    animationController = self->_animationController;
  }

  return animationController;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(THWWebRep *)self info];
  unsigned int v5 = [v4 adornmentInfo];
  LOBYTE(v3) = [v5 panelContentProviderHasContentForPanel:v3];

  return v3;
}

- (id)expandedChildInfosForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(THWWebRep *)self info];
  unsigned int v5 = [v4 adornmentInfo];
  id v6 = [v5 panelContentProviderChildInfosForPanel:v3];

  return v6;
}

- (BOOL)expandedHasRoomForPanelsWithHeight:(double)a3 inFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = [(THWWebRep *)self layout];
  [v9 webSizeInStageSize:width height];
  double v11 = v10;

  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  return CGRectGetHeight(v13) - v11 >= a3;
}

- (BOOL)expandedWantsButtonVisibleWhenNoPanels
{
  return 1;
}

- (void)expandedDidAppearPreAnimation
{
}

- (void)expandedDidPresentWithController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 expandableRepContainsHTMLContent:self];
  }
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  id v4 = [(THWWebRep *)self layout];
  [v4 invalidateFrame];
}

- (void)didExitExpanded
{
  id v2 = [(THWWebRep *)self bridgeController];
  [v2 tellBrowserToPauseAudioVisual];
}

- (void)didPresentExpanded
{
  if (!self->_webView)
  {
    uint64_t v3 = +[TSUAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep didPresentExpanded]");
    unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:926 description:@"invalid nil value for '%s'", "_webView"];
  }
  if (!self->_ownsWebView)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep didPresentExpanded]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:927 description:@"we should own the web view after being expanded"];
  }
  [(THWWebRep *)self setExpanding:0];
  [(THWWebRep *)self deferredStageViewFrame];
  if (!CGRectIsNull(v15))
  {
    [(THWWebRep *)self deferredStageViewFrame];
    -[THWWebRep p_updateStageViewFrame:](self, "p_updateStageViewFrame:");
  }
  if (self->_suspendPosterRendering)
  {
    self->_suspendPosterRendering = 0;
    webViewPosterLayer = self->_webViewPosterLayer;
    double v10 = [(THWWebRep *)self info];
    double v11 = [v10 defaultImage];
    [(THWWebRep *)self p_updateLayerContents:webViewPosterLayer withImage:v11];
  }
  unsigned int v12 = [(THWWebRep *)self bridgeController];
  [v12 tellBrowserWillEnterWidgetMode:3];

  CGRect v13 = [(THWWebRep *)self bridgeController];
  [v13 tellBrowserDidEnterWidgetMode:3];

  if (!self->_isWebContentLoaded)
  {
    [(THWWebRep *)self p_loadSourceURL];
  }
}

- (int)autoRotationMode
{
  return 3;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  id v9 = [(THWWebRep *)self layout];
  [v9 webSizeInStageSize:v7, v6];
  double v11 = v10;
  double v13 = v12;

  double v14 = [(THWWebRep *)self layout];
  [v14 webSizeInStageSize:width height];
  double v16 = v15;
  double v18 = v17;

  float v19 = v16 / v11;
  float v20 = v18 / v13;
  return fminf(v19, v20);
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  id v3 = [(THWWebRep *)self layout];
  [v3 invalidateFrame];
}

- (void)expandableExpandedPresentationDidEnd
{
  id v3 = [(THWWebRep *)self pressableHandler];
  unsigned int v4 = [v3 widgetInteractionDisabledOnPage];

  if (v4)
  {
    [(THWWebRep *)self p_pauseOnCanvas];
  }
}

- (void)p_togglePanelDescriptionExpanded
{
  [(THWWebRep *)self setPanelDescriptionExpanded:[(THWWebRep *)self panelDescriptionExpanded] ^ 1];
  [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerAnimatePanel:1 withCrossFadeContent:1 backgroundLayout:0 duration:0.25];
  expandedRepController = self->_expandedRepController;

  [(THWExpandedRepController *)expandedRepController expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:1];
}

- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4
{
  if (a3 == 1)
  {
    v8[7] = v4;
    uint64_t v9 = v5;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1B02F8;
    v8[3] = &unk_456D40;
    v8[4] = self;
    double v6 = [[THWTapGestureAction alloc] initWithAction:v8];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  id v8 = a3;
  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    uint64_t v9 = [(THWWebRep *)self layout];
    double v10 = [v9 layoutController];

    double v11 = "isCompactHeight";
    if (objc_opt_respondsToSelector())
    {
      unsigned int v12 = 2;
    }
    else
    {
      double v11 = "isCompactWidth";
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      unsigned int v12 = 5;
    }
    if ([v10 performSelector:v11]) {
      a5 = v12;
    }
    goto LABEL_9;
  }
LABEL_10:

  return a5;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  if (self->_stageView) {
    return 0;
  }
  uint64_t v4 = [(THWWebRep *)self freeTransformableHandler];
  uint64_t v5 = [v4 ftc];
  unsigned __int8 v6 = [v5 passedThreshold];

  return v6;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  if (self->_stageView) {
    return 0;
  }
  uint64_t v4 = [(THWWebRep *)self freeTransformableHandler];
  uint64_t v5 = [v4 ftc];
  unsigned __int8 v6 = [v5 passedThreshold];

  return v6;
}

- (id)animationLayer
{
  id v3 = [(THWWebRep *)self freeTransformableHandler];
  uint64_t v4 = [v3 ftc];
  unsigned int v5 = [v4 isFreeTransformInProgress];

  if (!v5) {
    goto LABEL_13;
  }
  unsigned __int8 v6 = [(THWWebRep *)self freeTransformableHandler];
  double v7 = [v6 ftc];
  id v8 = [v7 freeTransformLayer];

  if (!v8)
  {
LABEL_13:
    stageView = self->_stageView;
    if (!stageView
      || ([(TSWPassThroughView *)stageView layer], (id v8 = (CALayer *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      canvasPosterLayer = self->_canvasPosterLayer;
      if (!canvasPosterLayer)
      {
        uint64_t v11 = OBJC_IVAR___TSDRep_mCanvas;
        unsigned int v12 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
        double v13 = [(THWWebRep *)self layout];
        [v13 stageFrame];
        [v12 convertUnscaledToBoundsRect:];
        [*(id *)&self->super.TSDContainerRep_opaque[v11] contentsScale];
        TSDRoundedRectForScale();
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;

        unsigned int v22 = [(THWWebRep *)self canvasPosterLayer];
        [v22 setFrame:v15, v17, v19, v21];

        dispatch_time_t v23 = [(THWWebRep *)self canvasPosterLayer];
        unsigned int v24 = [(THWWebRep *)self info];
        id v25 = [v24 placeholderImage];
        [(THWWebRep *)self p_updateLayerContents:v23 withImage:v25];

        canvasPosterLayer = self->_canvasPosterLayer;
      }
      id v8 = canvasPosterLayer;
    }
  }

  return v8;
}

- (id)shadowAnimationLayer
{
  id v3 = [(THWWebRep *)self freeTransformableHandler];
  uint64_t v4 = [v3 ftc];
  unsigned int v5 = [v4 isFreeTransformInProgress];

  if (v5)
  {
    unsigned __int8 v6 = [(THWWebRep *)self freeTransformableHandler];
    double v7 = [v6 ftc];
    id v8 = [v7 shadowLayer];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (CGAffineTransform)freeTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  unsigned __int8 v6 = [(THWWebRep *)self freeTransformableHandler];
  double v7 = [v6 ftc];
  unsigned int v8 = [v7 isFreeTransformInProgress];

  if (v8)
  {
    double v10 = [(THWWebRep *)self freeTransformableHandler];
    uint64_t v11 = [v10 ftc];
    unsigned int v12 = v11;
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
    *(_OWORD *)&retstr->tdouble x = v15;
  }
  return result;
}

- (void)reparentAnimationLayerIfBackedByView:(id)a3
{
  if (self->_stageView)
  {
    uint64_t v4 = [(THWWebRep *)self subviewsController];
    stageView = self->_stageView;
    long long v5 = +[NSArray arrayWithObjects:&stageView count:1];
    [v4 addSubviews:v5];
  }
}

+ (BOOL)expandedAllowsFreeTransformForInfo:(id)a3
{
  return 1;
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  long long v5 = [(THWWebRep *)self freeTransformableHandler];
  unsigned __int8 v6 = [v5 ftc];
  unsigned int v7 = [v6 isFreeTransformInProgress];
  if (v7)
  {
    id v2 = [(THWWebRep *)self freeTransformableHandler];
    id v3 = [v2 ftc];
    if (![v3 passedThreshold])
    {
      unsigned int v8 = 0;
      goto LABEL_6;
    }
  }
  unsigned int v8 = [(THWWebRep *)self animationLayer];
  if (v7)
  {
LABEL_6:
  }

  return v8;
}

- (CGRect)ftcTargetFrame
{
  id v3 = [(THWWebRep *)self freeTransformableHandler];
  uint64_t v4 = [v3 ftc];
  if ([v4 isFreeTransformInProgress])
  {
    long long v5 = [(THWWebRep *)self freeTransformableHandler];
    unsigned __int8 v6 = [v5 ftc];
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
  if (self->_stageView)
  {
    uint64_t v4 = [(THWWebRep *)self subviewsController];
    stageView = self->_stageView;
    long long v5 = +[NSArray arrayWithObjects:&stageView count:1];
    [v4 addSubviews:v5];
  }
}

- (BOOL)shouldForceDisableCrossfadeFromSource:(id)a3
{
  return self->_suspendPosterRendering;
}

- (void)animationControllerDidPresent:(id)a3
{
  self->_animationController = 0;
  _objc_release_x1();
}

- (BOOL)isExpanded
{
  id v2 = [(THWWebRep *)self layout];
  unsigned __int8 v3 = [v2 isExpanded];

  return v3;
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  id v2 = [(THWWebRep *)self layout];
  [v2 stageFrame];
  double v4 = v3;
  double v6 = v5;

  return v6 < 660.0 || v4 < 960.0;
}

- (id)shadowPath
{
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 0;
}

- (BOOL)isFreeTransformInProgress
{
  id v2 = [(THWWebRep *)self freeTransformableHandler];
  double v3 = [v2 ftc];
  unsigned __int8 v4 = [v3 isFreeTransformInProgress];

  return v4;
}

- (CGRect)rectForCompletion
{
  id v2 = [(THWWebRep *)self layout];
  [v2 frameInParent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)freeTransformInteractionEnabledOverride
{
  return 1;
}

- (void)contentIsReady
{
  double v3 = [(THWWebRep *)self info];
  unsigned int v4 = [v3 exposurePolicy];

  if (v4 == 1)
  {
    dispatch_time_t v5 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1B0D1C;
    block[3] = &unk_456D40;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (THWAutoplayConfig)autoplayConfig
{
  id v2 = [(THWWebRep *)self info];
  double v3 = [v2 autoplayConfig];

  return (THWAutoplayConfig *)v3;
}

- (BOOL)autoplayAllowed
{
  id v2 = [(THWWebRep *)self pressableHandler];
  unsigned __int8 v3 = [v2 widgetInteractionAllowAutoplay];

  return v3;
}

- (void)autoplayStart
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1B0E28;
  activity_block[3] = &unk_456D40;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "HTML Autoplay Start", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)autoplayStop
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1B0EB0;
  activity_block[3] = &unk_456D40;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "HTML Autoplay Stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)autoplayPause
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1B0F38;
  activity_block[3] = &unk_456D40;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "HTML Autoplay Pause", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (BOOL)p_becameVisibleOnCanvas
{
  unsigned int v3 = [(THWWebRep *)self isVisibleOnCanvas];
  if (v3) {
    LOBYTE(v3) = ![(THWWebRep *)self isExpanded] && !self->_isWebContentLoaded;
  }
  return v3;
}

- (void)p_autoplayIfDesired
{
  id v4 = [(THWWebRep *)self autoplayConfig];
  if ([v4 enabled])
  {
    unsigned int v3 = [(THWWebRep *)self p_becameVisibleOnCanvas];

    if (v3)
    {
      [(THWWebRep *)self p_startAutoplay];
    }
  }
  else
  {
  }
}

- (void)p_startAutoplay
{
  unsigned int v3 = [(THWWebRep *)self webView];

  if (v3)
  {
    [(THWWebRep *)self p_startAutoplayOnCanvas];
  }
  else
  {
    [(THWWebRep *)self setAutoplayRequested:1];
  }
}

- (void)p_pauseOnCanvas
{
  if (self->_ownsWebView && self->_isWebContentLoaded)
  {
    id v2 = [(THWWebRep *)self bridgeController];
    [v2 tellBrowserToPauseAudioVisual];
  }
}

- (void)p_startAutoplayOnCanvas
{
  if (self->_ownsWebView)
  {
    unsigned int v3 = [(THWWebRep *)self webView];

    if (!v3)
    {
      id v4 = +[TSUAssertionHandler currentHandler];
      dispatch_time_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep p_startAutoplayOnCanvas]");
      double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"];
      [v4 handleFailureInFunction:v5 file:v6 lineNumber:1406 description:@"invalid nil value for '%s'", "self.webView"];
    }
    double v7 = [(THWWebRep *)self bridgeController];
    [v7 tellBrowserWillEnterWidgetMode:1];

    double v8 = [(THWWebRep *)self bridgeController];
    [v8 tellBrowserDidEnterWidgetMode:1];

    if (!self->_isWebContentLoaded)
    {
      [(THWWebRep *)self p_loadSourceURL];
    }
  }
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  if (self->_ownsWebView)
  {
    id v4 = [a3 userInfo];
    id v5 = [v4 objectForKey:@"THVantageChangeReason"];

    if (([v5 isEqualToString:@"THVantageChangeReasonScrolling"] & 1) == 0
      && ![v5 isEqualToString:@"THVantageChangeReasonWindowResize"]
      || ([(THWWebRep *)self isVisibleOnCanvas] & 1) == 0)
    {
      [(THWWebRep *)self p_pauseOnCanvas];
    }
  }
}

- (void)p_loadSourceURL
{
  if (![(THWWebBridgeController *)self->_bridgeController injectedWidgetObject])
  {
    unsigned int v3 = +[TSUAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep p_loadSourceURL]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:1438 description:@"shouldn't load URL before wigdet object has been injected"];
  }
  double v6 = [(THWWebRep *)self info];
  double v7 = [v6 sourceURL];

  if (([v7 isFileURL] & 1) == 0)
  {
    double v8 = +[TSUAssertionHandler currentHandler];
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep p_loadSourceURL]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:1441 description:@"can't handle non-file URLs"];
  }
  if ([v7 isFileURL])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1B14D4;
    v11[3] = &unk_456D90;
    v11[4] = self;
    id v12 = v7;
    _os_activity_initiate(&dword_0, "HTML Widget Load URL", OS_ACTIVITY_FLAG_DEFAULT, v11);
  }
}

- (id)p_filteredOutURLSchemes
{
  unsigned int v3 = [(THWWebRep *)self info];
  if ([v3 allowNetworkAccess])
  {
    id v4 = [(THWWebRep *)self info];
    id v5 = [v4 autoplayConfig];
    unsigned int v6 = [v5 enabled];

    if (!v6)
    {
      double v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v7 = +[NSSet setWithObjects:@"ftp", @"http", @"https", 0];
LABEL_6:

  return v7;
}

- (void)p_exposeWebView
{
  if ([(THWWebRep *)self ownsWebView])
  {
    [(THWWebRep *)self setDeferExposeWebView:0];
    unsigned int v3 = [(THWWebRep *)self webView];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1B1868;
    v4[3] = &unk_456D40;
    v4[4] = self;
    [v3 showAnimated:1 duration:v4 completion:0.150000006];
  }
  else
  {
    [(THWWebRep *)self setDeferExposeWebView:1];
  }
}

- (void)p_play
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1B1934;
  activity_block[3] = &unk_456D40;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)buttonControlWasPressed:(id)a3
{
  id v4 = [(THWWebRep *)self pressableHandler];
  unsigned __int8 v5 = [v4 widgetInteractionDisabledOnPage];

  if (v5)
  {
    id v6 = [(THWWebRep *)self pressableHandler];
    [v6 spoofGesture];
  }
  else
  {
    [(THWWebRep *)self p_play];
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  return 0;
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 setContentsGravity:kCAGravityResizeAspectFill];
  double v7 = [v6 canvas];

  [v7 viewScale];
  TSDMultiplySizeScalar();

  [v5 bounds];
  TSDShrinkSizeToFitInSize();
  double v9 = v8;
  double v11 = v10;
  [v5 bounds];
  double v14 = THScaleNeededToFitSizeInSize(v12, v13, v9, v11);
  CATransform3DMakeScale(&v16, v14, v14, 1.0);
  CATransform3D v15 = v16;
  [v5 setTransform:&v15];
}

- (BOOL)p_pointIsInRedZone:(CGPoint)a3 onView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(THWWebRep *)self isExpanded])
  {
    double v8 = [(THWWebRep *)self interactiveCanvasController];
    double v9 = [v8 delegate];
    double v10 = TSUProtocolCast();

    double v11 = [v10 view];
    [v11 bounds];
    CGFloat v13 = v12;
    double v15 = v14;
    double width = v16;
    double height = v18;

    expandedRepController = self->_expandedRepController;
    if (expandedRepController)
    {
      unsigned int v21 = [(THWExpandedRepController *)expandedRepController expandedRepControllerHasRoomForPanels];
      double v22 = 75.0;
      if (!v21) {
        double v22 = 0.0;
      }
    }
    else
    {
      double v22 = 75.0;
    }
    double v30 = [v10 view:v15 + v22 height:height - v22];
    [v7 convertPoint:v30 toView:x, y];
    double x = v31;
    CGFloat v23 = v32;

    goto LABEL_11;
  }
  CGFloat v23 = y;
  objc_opt_class();
  unsigned int v24 = [(THWWebRep *)self interactiveCanvasController];
  id v25 = [v24 delegate];
  double v10 = TSUDynamicCast();

  if (!v10)
  {
    CGFloat v13 = CGRectZero.origin.x;
    double v15 = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    CGFloat v36 = v15;
    double v37 = height;
LABEL_11:
    double v27 = width;
    CGFloat v29 = v13;
    goto LABEL_12;
  }
  [v10 paginatedPageSize];
  double v27 = floor(v26);
  double height = floor(v28);
  double width = v27 + -150.0;
  double v37 = height + -75.0;
  double v15 = 0.0;
  CGFloat v13 = 75.0;
  CGFloat v36 = 75.0;
  CGFloat v29 = 0.0;
LABEL_12:

  v40.origin.double x = v29;
  v40.origin.double y = v15;
  v40.size.double width = v27;
  v40.size.double height = height;
  v38.double x = x;
  v38.double y = v23;
  BOOL v33 = CGRectContainsPoint(v40, v38);
  v41.origin.double x = v13;
  v41.origin.double y = v36;
  v41.size.double height = v37;
  v41.size.double width = width;
  v39.double x = x;
  v39.double y = v23;
  BOOL v34 = v33 & !CGRectContainsPoint(v41, v39);

  return v34;
}

- (BOOL)p_stageAlmostCoversPage
{
  if ([(THWWebRep *)self isExpanded]) {
    return 0;
  }
  objc_opt_class();
  id v4 = [(THWWebRep *)self interactiveCanvasController];
  id v5 = [v4 delegate];
  id v6 = TSUDynamicCast();

  if (v6)
  {
    [v6 paginatedPageSize];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(THWWebRep *)self layout];
    [v11 stageFrame];
    double v13 = v12;
    double v15 = v14;

    BOOL v3 = v15 > v10 + -75.0 && v13 > v8 + -150.0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)p_cachedLoadExternalContentApproval
{
  BOOL v3 = +[BEDocumentExternalLoadApprovalCache sharedInstance];
  id v4 = [(THWWebRep *)self info];
  id v5 = [v4 bookID];
  id v6 = [v3 cachedApprovalForBookID:v5];

  return v6;
}

- (void)p_cacheLoadExternalContentApproval:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = +[BEDocumentExternalLoadApprovalCache sharedInstance];
  id v5 = [(THWWebRep *)self info];
  id v6 = [v5 bookID];
  [v7 cachedApproval:v3 forBookID:v6];
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

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
}

- (THWPlatformWebViewProtocol)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (THWWebBridgeController)bridgeController
{
  return self->_bridgeController;
}

- (void)setBridgeController:(id)a3
{
}

- (void)setStageView:(id)a3
{
}

- (void)setWebViewPosterLayer:(id)a3
{
}

- (void)setCanvasPosterLayer:(id)a3
{
}

- (BOOL)isWebContentLoaded
{
  return self->_isWebContentLoaded;
}

- (void)setIsWebContentLoaded:(BOOL)a3
{
  self->_isWebContentLoaded = a3;
}

- (BOOL)playButtonPressed
{
  return self->_playButtonPressed;
}

- (void)setPlayButtonPressed:(BOOL)a3
{
  self->_BOOL playButtonPressed = a3;
}

- (BOOL)ownsWebView
{
  return self->_ownsWebView;
}

- (void)setOwnsWebView:(BOOL)a3
{
  self->_ownsWebView = a3;
}

- (BOOL)createdWebView
{
  return self->_createdWebView;
}

- (void)setCreatedWebView:(BOOL)a3
{
  self->_createdWebView = a3;
}

- (BOOL)deferExposeWebView
{
  return self->_deferExposeWebView;
}

- (void)setDeferExposeWebView:(BOOL)a3
{
  self->_deferExposeWebView = a3;
}

- (BOOL)suspendPosterRendering
{
  return self->_suspendPosterRendering;
}

- (void)setSuspendPosterRendering:(BOOL)a3
{
  self->_suspendPosterRendering = a3;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (void)setPressableHandler:(id)a3
{
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (void)setExpandedRepController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (BOOL)panelDescriptionExpanded
{
  return self->_panelDescriptionExpanded;
}

- (void)setPanelDescriptionExpanded:(BOOL)a3
{
  self->_panelDescriptionExpanded = a3;
}

- (BOOL)autoplayRequested
{
  return self->_autoplayRequested;
}

- (void)setAutoplayRequested:(BOOL)a3
{
  self->_autoplayRequested = a3;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (void)setExpanding:(BOOL)a3
{
  self->_expanding = a3;
}

- (CGRect)deferredStageViewFrame
{
  double x = self->_deferredStageViewFrame.origin.x;
  double y = self->_deferredStageViewFrame.origin.y;
  double width = self->_deferredStageViewFrame.size.width;
  double height = self->_deferredStageViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDeferredStageViewFrame:(CGRect)a3
{
  self->_deferredStageViewFrame = a3;
}

- (void)setRequestScope:(id)a3
{
}

- (BOOL)stageAlmostCoversPage
{
  return self->_stageAlmostCoversPage;
}

- (void)setStageAlmostCoversPage:(BOOL)a3
{
  self->_stageAlmostCoversPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestScope, 0);
  objc_storeStrong((id *)&self->_pressableHandler, 0);
  objc_storeStrong((id *)&self->_canvasPosterLayer, 0);
  objc_storeStrong((id *)&self->_webViewPosterLayer, 0);
  objc_storeStrong((id *)&self->_stageView, 0);
  objc_storeStrong((id *)&self->_bridgeController, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_animationController, 0);

  objc_storeStrong((id *)&self->_freeTransformableHandler, 0);
}

@end