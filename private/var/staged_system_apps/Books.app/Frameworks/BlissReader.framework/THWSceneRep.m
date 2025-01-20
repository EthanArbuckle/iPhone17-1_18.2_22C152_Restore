@interface THWSceneRep
- (BOOL)animating;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canSelectChildRep:(id)a3;
- (BOOL)containerManagesChildView;
- (BOOL)expandedContentAllowDoubleTapZoom;
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)expandedPanelStartsVisible;
- (BOOL)freeTransformInteractionEnabledOverride;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)isCurrentlyScrolling;
- (BOOL)isExpanded;
- (BOOL)isFreeTransformInProgress;
- (BOOL)loanedSceneController;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)sceneControllerShouldAllowCrossfade:(id)a3;
- (BOOL)sceneControllerShouldAllowIdleAnimation:(id)a3;
- (BOOL)sceneControllerShouldAllowPinchZoom:(id)a3;
- (BOOL)sceneDidReceiveRotationLayoutDuringFreeTransform;
- (BOOL)sceneTransferHappened;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)tracksScore;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (BOOL)widgetInteractionAllowOnPageForCompact;
- (CALayer)pressableAnimationShadowLayer;
- (CGAffineTransform)freeTransform;
- (CGAffineTransform)shadowAnimationLayerDestinationTransform:(SEL)a3 uniformTargetScale:(id)a4;
- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (CGRect)ftcTargetFrame;
- (CGRect)p_contentsRectForDestination:(CGSize)a3 shouldFill:(BOOL)a4;
- (CGRect)p_scaledViewFrameOnCanvas;
- (CGRect)rectForCompletion;
- (CGRect)targetFrameForSource:(id)a3;
- (CGSize)p_targetExpandedSize;
- (NSArray)childReps;
- (THAnimationController)animationController;
- (THWExpandedRepController)expandedRepController;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWImageCropAnimationController)imageCropAnimationController;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (THWSceneController)sceneController;
- (THWSceneRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSDContainerInfo)containerInfo;
- (double)expandedContentMinimumZoomScale;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (double)screenScaleForSceneController:(id)a3;
- (id)animationLayer;
- (id)backgroundColorForSceneController:(id)a3;
- (id)documentRootForSceneController:(id)a3;
- (id)expandedChildInfosForPanel:(int)a3;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)p_sceneContentLayer;
- (id)placeholderLayerForSceneController:(id)a3;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)targetLayer;
- (int)autoRotationMode;
- (int)expandedAppearance;
- (int)expandedAppearanceForPanel:(int)a3;
- (int)pressableAction;
- (void)addChildViewsToArray:(id)a3;
- (void)animationControllerDidAddContentAnimations:(id)a3 uniformTargetScale:(double)a4;
- (void)animationControllerDidPresent:(id)a3;
- (void)animationControllerSetupTarget:(id)a3;
- (void)animationControllerTeardownTarget:(id)a3;
- (void)animationControllerWillPresent:(id)a3;
- (void)canvasDidBeginFreeTransform;
- (void)canvasDidEndFreeTransform;
- (void)dealloc;
- (void)didAddChildView:(id)a3;
- (void)didPresentExpanded;
- (void)expandableExpandedPresentationDidEnd;
- (void)expandedDidAppearPreAnimation;
- (void)expandedDidRotateTransitionToSize:(CGSize)a3;
- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (void)freeTransformDidEnd;
- (void)freeTransformWillBegin;
- (void)handleNotificationVantageDidChange:(id)a3;
- (void)handleSingleTapInSceneForSceneController:(id)a3;
- (void)p_reparentSceneView;
- (void)p_setupImageCropAnimationControllerWithDestinationRep:(id)a3;
- (void)p_setupSceneControllerIfNecessary:(BOOL)a3;
- (void)p_updateInteractiveMode;
- (void)reparentAnimationLayerIfBackedByView:(id)a3;
- (void)reparentTargetLayerIfBackedByView:(id)a3;
- (void)replaceContentsFromRep:(id)a3;
- (void)sceneDidLoadForSceneController:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setChildReps:(id)a3;
- (void)setExpandedRepController:(id)a3;
- (void)setHandlingPress:(BOOL)a3;
- (void)setImageCropAnimationController:(id)a3;
- (void)setLoanedSceneController:(BOOL)a3;
- (void)setPressableHandler:(id)a3;
- (void)setSceneController:(id)a3;
- (void)setSceneDidReceiveRotationLayoutDuringFreeTransform:(BOOL)a3;
- (void)setSceneTransferHappened:(BOOL)a3;
- (void)updateChildrenFromLayout;
- (void)viewScaleDidChange;
- (void)viewScrollWillChange;
- (void)viewScrollingEnded;
- (void)willAddChildView:(id)a3 toView:(id)a4;
- (void)willBeRemoved;
- (void)willBeginHandlingGesture:(id)a3;
- (void)willRemoveChildView:(id)a3;
@end

@implementation THWSceneRep

- (THWSceneRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THWSceneRep;
  v4 = [(THWSceneRep *)&v8 initWithLayout:a3 canvas:a4];
  if (v4)
  {
    objc_opt_class();
    [(THWSceneRep *)v4 interactiveCanvasController];
    id v5 = [(id)TSUDynamicCast() pressHandlerForPressableReps];
    if (v5) {
      v4->_pressableHandler = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:v4 pressHandler:v5];
    }
    v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWSceneRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
    [+[NSNotificationCenter defaultCenter] addObserver:v4 selector:"handleNotificationVantageWillChange:" name:@"THVantageWillChangeNotification" object:0];
    [+[NSNotificationCenter defaultCenter] addObserver:v4 selector:"handleNotificationVantageDidChange:" name:@"THVantageDidChangeNotification" object:0];
    -[THWSceneRep setLoanedSceneController:](v4, "setLoanedSceneController:", objc_msgSend(objc_msgSend(-[THWSceneRep interactiveCanvasController](v4, "interactiveCanvasController"), "widgetHost"), "repIsPresentedExpanded:", v4));
    id v6 = objc_msgSend(objc_msgSend(-[THWSceneRep hostICC](v4, "hostICC"), "widgetHost"), "inFlowMode");
    if ([(THWSceneRep *)v4 loanedSceneController])
    {
      if (!v6) {
        return v4;
      }
      goto LABEL_8;
    }
    if ((objc_msgSend(-[THWSceneRep layout](v4, "layout"), "isExpanded") ^ 1 | v6))
    {
LABEL_8:
      v4->_isCurrentlyScrolling = [v4 interactiveCanvasController].currentlyScrolling;
      [(THWSceneRep *)v4 p_setupSceneControllerIfNecessary:v6];
    }
  }
  return v4;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  [(THWImageCropAnimationController *)self->_imageCropAnimationController teardownWrapperLayer];

  self->_imageCropAnimationController = 0;
  self->_childReps = 0;

  self->_freeTransformableHandler = 0;
  self->_sceneController = 0;

  self->_pressableHandler = 0;
  self->_animationController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  [(THWSceneRep *)&v3 dealloc];
}

- (CGRect)p_scaledViewFrameOnCanvas
{
  [self layout].frameInRoot
  [self canvas].convertUnscaledToBoundsRect:v3, v4, v5, v6;

  TSDRoundedRectForMainScreen();
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)p_setupSceneControllerIfNecessary:(BOOL)a3
{
  if (self->_sceneController) {
    return;
  }
  double v5 = [THWSceneController alloc];
  id v6 = [(THWSceneRep *)self info];
  [(THWSceneRep *)self p_scaledViewFrameOnCanvas];
  sceneController = -[THWSceneController initWithSceneInfo:frame:delegate:](v5, "initWithSceneInfo:frame:delegate:", v6, self);
  self->_sceneController = sceneController;
  if (a3) {
    goto LABEL_3;
  }
  if ([(THWSceneRep *)self isExpanded]
    && ![(THWSceneRep *)self isCurrentlyScrolling])
  {
    sceneController = self->_sceneController;
LABEL_3:
    [(THWSceneController *)sceneController loadScene];
    return;
  }
  double v8 = self->_sceneController;

  [(THWSceneController *)v8 loadSceneDeferred];
}

- (void)viewScrollWillChange
{
  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  [(THWSceneRep *)&v3 viewScrollWillChange];
  self->_isCurrentlyScrolling = 1;
  if ([(THWSceneRep *)self isVisibleOnCanvas]) {
    [(THWSceneController *)[(THWSceneRep *)self sceneController] pauseIdleAnimation];
  }
}

- (void)viewScrollingEnded
{
  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  [(THWSceneRep *)&v3 viewScrollingEnded];
  self->_isCurrentlyScrolling = 0;
  if ([(THWSceneRep *)self isVisibleOnCanvas])
  {
    if ([(THWSceneRep *)self sceneController])
    {
      if (![(THWSceneController *)[(THWSceneRep *)self sceneController] view]) {
        [self.interactiveCanvasController invalidateReps];
      }
      [(THWSceneController *)[(THWSceneRep *)self sceneController] resumeIdleAnimationIfNecessary];
    }
    else
    {
      [self.interactiveCanvasController invalidateLayers];
    }
  }
}

- (void)canvasDidBeginFreeTransform
{
  v2 = [(THWSceneRep *)self sceneController];

  [(THWSceneController *)v2 pauseIdleAnimation];
}

- (void)canvasDidEndFreeTransform
{
  if ([(THWSceneRep *)self isVisibleOnCanvas])
  {
    objc_super v3 = [(THWSceneRep *)self sceneController];
    [(THWSceneController *)v3 resumeIdleAnimationIfNecessary];
  }
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", @"THVantageChangeReason");
  if (([v4 isEqualToString:@"THVantageChangeReasonTransitionToGlossary"] & 1) != 0
    || [v4 isEqualToString:@"THVantageChangeReasonTransitionToNotesVC"])
  {
    double v5 = [(THWSceneRep *)self sceneController];
    [(THWSceneController *)v5 pauseIdleAnimation];
  }
}

- (id)documentRootForSceneController:(id)a3
{
  id v3 = [(THWSceneRep *)self interactiveCanvasController];

  return [v3 documentRoot];
}

- (id)backgroundColorForSceneController:(id)a3
{
  id v3 = [(THWSceneRep *)self info];

  return [v3 stageColor];
}

- (id)placeholderLayerForSceneController:(id)a3
{
  id v4 = [(THWSceneRep *)self interactiveCanvasController];
  id v5 = [self interactiveCanvasController].repForInfo:[self info].placeholderImage];

  return [v4 layerForRep:v5];
}

- (double)screenScaleForSceneController:(id)a3
{
  id v3 = +[UIScreen mainScreen];

  [(UIScreen *)v3 scale];
  return result;
}

- (void)handleSingleTapInSceneForSceneController:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)[(THWSceneRep *)self pressableHandler] widgetInteractionDisabledOnPage])
  {
    goto LABEL_2;
  }
  if ([(THWSceneRep *)self animating]) {
    return;
  }
  if (![(THWSceneRep *)self isExpanded]
    && [(THWSceneRep *)self meetsStageDimensionRequirementForExpanded])
  {
LABEL_2:
    id v4 = [(THWSceneRep *)self pressableHandler];
    [(THWPressableRepGestureTargetHandler *)v4 spoofGesture];
  }
  else
  {
    [self.interactiveCanvasController delegate];
    id v5 = (void *)TSUProtocolCast();
    [v5 handleSingleTap];
  }
}

- (void)sceneDidLoadForSceneController:(id)a3
{
  if (![(THWSceneRep *)self isCurrentlyScrolling])
  {
    id v4 = [(THWSceneRep *)self interactiveCanvasController];
    [v4 invalidateReps];
  }
}

- (BOOL)sceneControllerShouldAllowPinchZoom:(id)a3
{
  return 0;
}

- (BOOL)sceneControllerShouldAllowCrossfade:(id)a3
{
  return ![(THWSceneRep *)self sceneTransferHappened];
}

- (BOOL)sceneControllerShouldAllowIdleAnimation:(id)a3
{
  return ![(THWPressableRepGestureTargetHandler *)[(THWSceneRep *)self pressableHandler] widgetInteractionDisabledOnPage];
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)setChildReps:(id)a3
{
  childReps = self->_childReps;
  if (childReps != a3)
  {
    [(NSArray *)childReps makeObjectsPerformSelector:"setParentRep:" withObject:0];

    id v6 = (NSArray *)a3;
    self->_childReps = v6;
    [(NSArray *)v6 makeObjectsPerformSelector:"setParentRep:" withObject:self];
  }
}

- (void)addChildViewsToArray:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWSceneRep addChildViewsToArray:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m"] lineNumber:443 description:@"This operation must only be performed on the main thread."];
  }
  unsigned int v5 = [(THWSceneRep *)self isVisibleOnCanvas];
  id v6 = [(THWSceneRep *)self sceneController];
  if (!v5)
  {
    id v9 = [(THWSceneController *)v6 view];
    if (!v9) {
      goto LABEL_13;
    }
    id v7 = v9;
    double v10 = [(THWSceneRep *)self sceneController];
    [(THWSceneRep *)self p_scaledViewFrameOnCanvas];
    -[THWSceneController setFrame:](v10, "setFrame:");
    goto LABEL_12;
  }
  if (v6)
  {
    if (![(THWSceneRep *)self isCurrentlyScrolling]
      && ![(THWSceneController *)[(THWSceneRep *)self sceneController] view])
    {
      [(THWSceneController *)[(THWSceneRep *)self sceneController] setupSceneView];
    }
    id v7 = [(THWSceneController *)[(THWSceneRep *)self sceneController] view];
    double v8 = [(THWSceneRep *)self sceneController];
    [(THWSceneRep *)self p_scaledViewFrameOnCanvas];
    -[THWSceneController setFrame:](v8, "setFrame:");
    if (v7) {
LABEL_12:
    }
      [a3 addObject:v7];
  }
LABEL_13:

  [(THWSceneRep *)self p_updateInteractiveMode];
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  [(THWSceneRep *)&v3 willBeRemoved];
  if (self->_sceneController)
  {
    [(THWSceneController *)[(THWSceneRep *)self sceneController] stopAnimation];
    [(THWSceneController *)[(THWSceneRep *)self sceneController] setDelegate:0];
  }
}

- (void)willAddChildView:(id)a3 toView:(id)a4
{
}

- (void)didAddChildView:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneRep didAddChildView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m") lineNumber:515 description:@"This operation must only be performed on the main thread."];
  }
  if (a3 && [(THWSceneController *)[(THWSceneRep *)self sceneController] view] == a3)
  {
    unsigned int v5 = [(THWSceneRep *)self sceneController];
    [(THWSceneController *)v5 didAddSceneView];
  }
}

- (void)willRemoveChildView:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneRep willRemoveChildView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m") lineNumber:524 description:@"This operation must only be performed on the main thread."];
  }
  if (a3
    && ![(THWSceneRep *)self loanedSceneController]
    && self->_sceneController
    && [(THWSceneController *)[(THWSceneRep *)self sceneController] view] == a3)
  {
    [(THWSceneController *)self->_sceneController stopAnimation];
    [a3 removeFromSuperview];
  }
}

- (BOOL)containerManagesChildView
{
  return 1;
}

- (void)p_updateInteractiveMode
{
  [(THWSceneController *)[(THWSceneRep *)self sceneController] setUserInteractionEnabled:1];
  unsigned int v3 = [(THWPressableRepGestureTargetHandler *)[(THWSceneRep *)self pressableHandler] widgetInteractionDisabledOnPage];
  id v4 = [(THWSceneRep *)self sceneController];
  if (v3)
  {
    [(THWSceneController *)v4 pauseIdleAnimationForRotation];
  }
  else
  {
    [(THWSceneController *)v4 resumeIdleAnimationIfNecessary];
  }
}

- (void)updateChildrenFromLayout
{
  id v3 = +[TSDContainerRep childrenFromLayoutInContainerRep:self];

  [(THWSceneRep *)self setChildReps:v3];
}

- (void)viewScaleDidChange
{
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  return +[TSDContainerRep containerRep:hitRep:withGesture:passingTest:](TSDContainerRep, "containerRep:hitRep:withGesture:passingTest:", self, a4, a5, a3.x, a3.y);
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  return [(THWSceneRep *)self pressableAction] != 0;
}

- (BOOL)wantsPressAction
{
  if ([(THWSceneRep *)self meetsStageDimensionRequirementForExpanded]
    || (BOOL v3 = [(THWPressableRepGestureTargetHandler *)[(THWSceneRep *)self pressableHandler] widgetInteractionDisabledOnPage]))
  {
    LOBYTE(v3) = [(THWSceneRep *)self pressableAction] != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return a3 == self;
}

- (int)pressableAction
{
  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  return [(THWSceneRep *)&v3 pressableAction];
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (BOOL)canHandleGesture:(id)a3
{
  if (![(THWSceneRep *)self animating]
    && [(THWPressableRepGestureTargetHandler *)[(THWSceneRep *)self pressableHandler] canHandleGesture:a3])
  {
    return 1;
  }
  id v6 = [(THWSceneRep *)self freeTransformableHandler];

  return [(THWFreeTransformableRepGestureTargetHandler *)v6 canHandleGesture:a3];
}

- (BOOL)handleGesture:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)[(THWSceneRep *)self pressableHandler] handleGesture:a3])
  {
    return 1;
  }
  id v6 = [(THWSceneRep *)self freeTransformableHandler];

  return [(THWFreeTransformableRepGestureTargetHandler *)v6 handleGesture:a3];
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSDFreeTransform)
  {
    id v6 = [(THWSceneRep *)self freeTransformableHandler];
    [(THWFreeTransformableRepGestureTargetHandler *)v6 willBeginHandlingGesture:a3];
  }
}

- (BOOL)isExpanded
{
  id v2 = [(THWSceneRep *)self layout];

  return [v2 isExpanded];
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  objc_msgSend(objc_msgSend(-[THWSceneRep layout](self, "layout"), "geometry"), "size");
  return v3 < 660.0 || v2 < 960.0;
}

- (id)shadowPath
{
  if (!objc_msgSend(objc_msgSend(-[THWSceneRep info](self, "info"), "stageColor"), "isOpaque")) {
    return 0;
  }
  imageCropAnimationController = self->_imageCropAnimationController;

  return [(THWImageCropAnimationController *)imageCropAnimationController sourceShadowPath];
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 0;
}

- (BOOL)isFreeTransformInProgress
{
  double v2 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWSceneRep *)self freeTransformableHandler] ftc];

  return [(THWFreeTransformController *)v2 isFreeTransformInProgress];
}

- (void)freeTransformWillBegin
{
  objc_opt_class();
  [(THWExpandedRepController *)[(THWSceneRep *)self expandedRepController] expandedRepSourceRep];
  uint64_t v3 = TSUDynamicCast();

  [(THWSceneRep *)self p_setupImageCropAnimationControllerWithDestinationRep:v3];
}

- (void)freeTransformDidEnd
{
  [(THWImageCropAnimationController *)self->_imageCropAnimationController teardownWrapperLayer];

  self->_imageCropAnimationController = 0;
  objc_opt_class();
  [(THAnimationController *)self->_animationController destination];
  uint64_t v3 = (void *)TSUDynamicCast();
  [v3 p_reparentSceneView];
  if ([(THWSceneRep *)self sceneDidReceiveRotationLayoutDuringFreeTransform])
  {
    [(THWSceneRep *)self setSceneDidReceiveRotationLayoutDuringFreeTransform:0];
    objc_msgSend(objc_msgSend(v3, "sceneController"), "setDisableFrameUpdate:", 0);
    id v4 = [v3 layout];
    [v4 invalidateFrame];
  }
}

- (CGRect)rectForCompletion
{
  id v2 = [(THWSceneRep *)self layout];

  [v2 frameInParent];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)freeTransformInteractionEnabledOverride
{
  return 1;
}

- (BOOL)expandedPanelStartsVisible
{
  return 1;
}

- (THAnimationController)animationController
{
  CGRect result = self->_animationController;
  if (!result)
  {
    double v4 = objc_alloc_init(THAnimationController);
    self->_animationController = v4;
    [(THAnimationController *)v4 addObserver:self];
    [(THAnimationController *)self->_animationController setSource:self];
    [(THAnimationController *)self->_animationController setShadowFadeOutDurationScale:1.0];
    [(THAnimationController *)self->_animationController setShadowTransformDurationScale:0.5];
    return self->_animationController;
  }
  return result;
}

- (void)expandableExpandedPresentationDidEnd
{
}

- (void)expandedDidAppearPreAnimation
{
  id v2 = [(THWSceneRep *)self sceneController];
  if (v2)
  {
    double v3 = v2;
    if (![(THWSceneController *)v2 hasRendered])
    {
      id v4 = [(THWSceneController *)v3 view];
      [v4 setNeedsDisplay];
    }
  }
}

- (void)didPresentExpanded
{
  id v2 = [(THWSceneRep *)self sceneController];

  [(THWSceneController *)v2 setUserInteractionEnabled:1];
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [self info].panelContentProvider;

  return [v4 panelContentProviderHasContentForPanel:v3];
}

- (id)expandedChildInfosForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [self info].panelContentProvider;

  return [v4 panelContentProviderChildInfosForPanel:v3];
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  id v4 = [(THWSceneRep *)self layout];

  [v4 invalidateFrame];
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 0;
}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 0;
}

- (double)expandedContentMinimumZoomScale
{
  if (!objc_msgSend(-[THWSceneRep layout](self, "layout"), "delegate")) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWSceneRep expandedContentMinimumZoomScale]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m"] lineNumber:871 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "self.layout.delegate"];
  }
  [(THWSceneRep *)self frameInUnscaledCanvas];
  double v4 = v3;
  double v6 = v5;
  objc_msgSend(objc_msgSend(-[THWSceneRep layout](self, "layout"), "delegate"), "widgetLayoutBounds");
  double v9 = 1.0;
  if (v4 <= 0.0) {
    double v10 = 1.0;
  }
  else {
    double v10 = v4;
  }
  if (v6 > 0.0) {
    double v9 = v6;
  }

  return THScaleNeededToFitSizeInSize(v10, v9, v7, v8);
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  if (![(THWSceneRep *)self isFreeTransformInProgress]
    || (id result = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWSceneRep *)self freeTransformableHandler] ftc] freeTransformLayer]) == 0)
  {
    double v4 = [(THWSceneRep *)self imageCropAnimationController];
    return [(THWImageCropAnimationController *)v4 wrapperLayer];
  }
  return result;
}

- (id)p_sceneContentLayer
{
  id result = [(THWSceneController *)[(THWSceneRep *)self sceneController] sceneLayer];
  if (!result)
  {
    id v4 = [(THWSceneRep *)self interactiveCanvasController];
    return [v4 layerForRep:self];
  }
  return result;
}

- (CGRect)p_contentsRectForDestination:(CGSize)a3 shouldFill:(BOOL)a4
{
  if (a4)
  {
    double v4 = 1.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 1.0;
  }
  else
  {
    [(THWSceneRep *)self layerFrameInScaledCanvas];
    TSDRectWithSize();
    TSDFitOrFillSizeInRect();
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    double v13 = v12;
    double v15 = v14;
    TSDCenterOfRect();
    TSDRectWithCenterAndSize();
    v22.origin.x = v9;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    CGRectIntersection(v20, v22);
    TSDSubtractPoints();
    TSDRectWithOriginAndSize();
    double v5 = v16 / v13;
    double v6 = v17 / v15;
    double v4 = v18 / v13;
    double v7 = v19 / v15;
  }
  result.size.height = v7;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)shadowAnimationLayer
{
  if (![(THWSceneRep *)self isFreeTransformInProgress]) {
    return 0;
  }
  double v3 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWSceneRep *)self freeTransformableHandler] ftc];

  return [(THWFreeTransformController *)v3 shadowLayer];
}

- (CGAffineTransform)shadowAnimationLayerDestinationTransform:(SEL)a3 uniformTargetScale:(id)a4
{
  long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if ([(THWSceneRep *)self imageCropAnimationController])
  {
    [(THWImageCropAnimationController *)[(THWSceneRep *)self imageCropAnimationController] sourceContentsRect];
    [(THWImageCropAnimationController *)[(THWSceneRep *)self imageCropAnimationController] targetContentsRect];
    [self shadowAnimationLayer].bounds;
    TSDMultiplyRectBySize();
    uint64_t v30 = v9;
    uint64_t v31 = v8;
    double v34 = v11;
    double v35 = v10;
    TSDMultiplyRectBySize();
    double v32 = v13;
    double v33 = v12;
    TSDCenterOfRect();
    TSDCenterOfRect();
    TSDRectWithSize();
    TSDCenterOfRect();
    TSDSubtractPoints();
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    TSDSubtractPoints();
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGAffineTransformMakeTranslation(retstr, v15, v17);
    CGAffineTransformMakeScale(&t2, v33 / v35, v32 / v34);
    long long v22 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v22;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v40, &t1, &t2);
    long long v23 = *(_OWORD *)&v40.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v40.a;
    *(_OWORD *)&retstr->c = v23;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v40.tx;
    CGAffineTransformMakeTranslation(&v37, v19, v21);
    long long v24 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v24;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v40, &t1, &v37);
    long long v25 = *(_OWORD *)&v40.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v40.a;
    *(_OWORD *)&retstr->c = v25;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v40.tx;
  }
  v26 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWSceneRep *)self freeTransformableHandler] ftc];
  if (v26) {
    [(THWFreeTransformController *)v26 originalShadowTransform];
  }
  else {
    memset(&v36, 0, sizeof(v36));
  }
  long long v27 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v27;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformConcat(&v40, &t1, &v36);
  long long v29 = *(_OWORD *)&v40.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v40.a;
  *(_OWORD *)&retstr->c = v29;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v40.tx;
  return result;
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
  CGRect result = (CGAffineTransform *)[(THWSceneRep *)self isFreeTransformInProgress];
  if (result)
  {
    CGRect result = [(THWFreeTransformableRepGestureTargetHandler *)[(THWSceneRep *)self freeTransformableHandler] ftc];
    if (result)
    {
      CGRect result = (CGAffineTransform *)[(CGAffineTransform *)result currentTransform];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    long long v7 = v9;
    *(_OWORD *)&retstr->a = v8;
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = v10;
  }
  return result;
}

- (void)reparentAnimationLayerIfBackedByView:(id)a3
{
  if (![(THWSceneRep *)self isFreeTransformInProgress])
  {
    [(THWSceneRep *)self p_reparentSceneView];
  }
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  if ([(THWSceneRep *)self isFreeTransformInProgress]
    && ![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWSceneRep *)self freeTransformableHandler] ftc] passedThreshold])
  {
    return 0;
  }

  return [(THWSceneRep *)self p_sceneContentLayer];
}

- (CGRect)ftcTargetFrame
{
  if ([(THWSceneRep *)self isFreeTransformInProgress])
  {
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWSceneRep *)self freeTransformableHandler] ftc] completionTargetRect];
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)targetFrameForSource:(id)a3
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  objc_opt_class();
  long long v8 = (void *)TSUDynamicCast();
  id v9 = [v8 sceneController];
  if (v9)
  {
    long long v10 = v9;
    objc_msgSend(objc_msgSend(objc_msgSend(v8, "interactiveCanvasController"), "layerForRep:", v8), "frame");
    double v12 = v11;
    double v14 = v13;
    objc_msgSend(objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self), "frame");
    if ([v10 shouldFillSize:v12 withinSize:v14])
    {
      TSDFitOrFillSizeInRect();
      CGFloat x = v15;
      CGFloat y = v16;
      CGFloat width = v17;
      CGFloat height = v18;
    }
  }
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)p_reparentSceneView
{
  id v3 = [(THWSceneController *)[(THWSceneRep *)self sceneController] view];
  if (v3)
  {
    double v4 = v3;
    if (![(THWSceneRep *)self imageCropAnimationController])
    {
      long long v7 = v4;
      [self subviewsController].addSubviews:[NSArray arrayWithObjects:count:&v7, 1]];
      long long v5 = [(THWSceneRep *)self sceneController];
      [(THWSceneRep *)self p_scaledViewFrameOnCanvas];
      -[THWSceneController setFrame:](v5, "setFrame:");
      objc_msgSend(objc_msgSend(v4, "layer"), "setMasksToBounds:", 1);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1B9ACC;
      v6[3] = &unk_456DE0;
      v6[4] = v4;
      [self.interactiveCanvasController performBlockNextFrame:v6];
    }
  }
}

- (void)reparentTargetLayerIfBackedByView:(id)a3
{
  objc_opt_class();
  [a3 source];
  if (([(id)TSUDynamicCast() isFreeTransformInProgress] & 1) == 0)
  {
    [(THWSceneRep *)self p_reparentSceneView];
  }
}

- (void)animationControllerWillPresent:(id)a3
{
}

- (void)animationControllerDidPresent:(id)a3
{
  self->_animationController = 0;

  [(THWSceneRep *)self setAnimating:0];
}

- (void)animationControllerSetupTarget:(id)a3
{
  objc_opt_class();
  [a3 destination];
  uint64_t v5 = TSUDynamicCast();

  [(THWSceneRep *)self p_setupImageCropAnimationControllerWithDestinationRep:v5];
}

- (void)animationControllerTeardownTarget:(id)a3
{
  if (![(THWSceneRep *)self isFreeTransformInProgress])
  {
    [(THWImageCropAnimationController *)[(THWSceneRep *)self imageCropAnimationController] teardownWrapperLayer];

    self->_imageCropAnimationController = 0;
    [(THWSceneRep *)self p_reparentSceneView];
  }
}

- (void)animationControllerDidAddContentAnimations:(id)a3 uniformTargetScale:(double)a4
{
  uint64_t v5 = [(THWSceneRep *)self imageCropAnimationController];
  [a3 animationDuration];

  -[THWImageCropAnimationController addAnimationWithDuration:targetScale:](v5, "addAnimationWithDuration:targetScale:");
}

- (void)replaceContentsFromRep:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWSceneRep;
  -[THWSceneRep replaceContentsFromRep:](&v7, "replaceContentsFromRep:");
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  if (v5)
  {
    double v6 = (void *)v5;
    if (self->_sceneController) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneRep replaceContentsFromRep:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m") lineNumber:1195 description:@"expected nil value for '%s'", "_sceneController"];
    }
    -[THWSceneRep setSceneController:](self, "setSceneController:", [v6 sceneController]);
    [(THWSceneController *)[(THWSceneRep *)self sceneController] setDelegate:self];
    [(THWSceneRep *)self setLoanedSceneController:0];
    [(THWSceneRep *)self setSceneTransferHappened:1];
    [v6 setSceneController:0];
    [v6 setLoanedSceneController:1];
    objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "invalidateLayers");
    [self interactiveCanvasController].invalidateLayers;
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
  unsigned __int8 v8 = [(THWSceneController *)[(THWSceneRep *)self sceneController] yFovFixed];
  double result = height / v6;
  if ((v8 & 1) == 0) {
    return width / v7;
  }
  return result;
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  [(THWSceneController *)[(THWSceneRep *)self sceneController] setDisableFrameUpdate:1];
  [(THWSceneController *)[(THWSceneRep *)self sceneController] frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[THWSceneRep scaleForCenteredAutoRotateFromSize:toSize:](self, "scaleForCenteredAutoRotateFromSize:toSize:", v7, v6, width, height);
  if ([(THWSceneController *)[(THWSceneRep *)self sceneController] yFovFixed])
  {
    if (v7 >= width) {
      goto LABEL_6;
    }
  }
  else if (v6 >= height)
  {
    goto LABEL_6;
  }
  TSDCenterOfRect();
  TSDRectWithCenterAndSize();
  double v10 = v17;
  double v12 = v18;
  double v14 = v19;
  double v16 = v20;
LABEL_6:
  double v21 = [(THWSceneRep *)self sceneController];

  -[THWSceneController setFrame:overrideDisabled:](v21, "setFrame:overrideDisabled:", 1, v10, v12, v14, v16);
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  if ([(THWSceneRep *)self isFreeTransformInProgress])
  {
    [(THWSceneRep *)self setSceneDidReceiveRotationLayoutDuringFreeTransform:1];
  }
  else
  {
    [(THWSceneController *)[(THWSceneRep *)self sceneController] setDisableFrameUpdate:0];
    id v4 = [(THWSceneRep *)self layout];
    [v4 invalidateFrame];
  }
}

- (CGSize)p_targetExpandedSize
{
  id v2 = [self hostICC].widgetHost;
  if (v2)
  {
    [v2 widgetHostExpandedSize];
  }
  else
  {
    double v3 = 100.0;
    double v4 = 100.0;
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)p_setupImageCropAnimationControllerWithDestinationRep:(id)a3
{
  id v5 = [(THWSceneRep *)self p_sceneContentLayer];
  objc_msgSend(objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self), "frame");
  double v7 = v6;
  double v9 = v8;
  if (a3)
  {
    [a3 layerFrameInScaledCanvas];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    [(THWSceneRep *)self p_targetExpandedSize];
    double v11 = v14;
    double v13 = v15;
  }
  BOOL v16 = -[THWSceneController shouldFillSize:withinSize:]([(THWSceneRep *)self sceneController], "shouldFillSize:withinSize:", v7, v9, v11, v13);
  if ([(THWSceneRep *)self imageCropAnimationController])
  {
    if (a3) {
      BOOL v17 = a3 == self;
    }
    else {
      BOOL v17 = 1;
    }
    char v18 = v17 || v16;
    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
  else if (!v16)
  {
LABEL_12:
    [(-[THWSceneController view](-[THWSceneRep sceneController](self, "sceneController"), "view")) frame];
    TSDSizeExpandedToMatchAspectRatio();
    TSDCenterOfRect();
    TSDRectWithCenterAndSize();
    TSDRoundedRectForMainScreen();
    double v7 = v19;
    double v9 = v20;
    -[THWSceneController setFrame:]([(THWSceneRep *)self sceneController], "setFrame:", v21, v22, v19, v20);
  }
  if ([(THWSceneRep *)self imageCropAnimationController])
  {
    if (a3)
    {
      if (a3 == self)
      {
        objc_msgSend(objc_msgSend(a3, "imageCropAnimationController"), "sourceContentsRect");
        objc_msgSend(objc_msgSend(a3, "imageCropAnimationController"), "setTargetContentsRect:", v57, v58, v59, v60);
        objc_msgSend(objc_msgSend(a3, "imageCropAnimationController"), "sourceCornerRadius");
        double v62 = v61;
        v39 = (THWImageCropAnimationController *)[a3 imageCropAnimationController];
        double v40 = v62;
      }
      else
      {
        -[THWSceneRep p_contentsRectForDestination:shouldFill:](self, "p_contentsRectForDestination:shouldFill:", v16, v11, v13);
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        [a3 p_contentsRectForDestination:v16 ^ 1 shouldFill:v7, v9];
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        -[THWImageCropAnimationController setSourceContentsRect:]([(THWSceneRep *)self imageCropAnimationController], "setSourceContentsRect:", v24, v26, v28, v30);
        -[THWImageCropAnimationController setTargetContentsRect:]([(THWSceneRep *)self imageCropAnimationController], "setTargetContentsRect:", v32, v34, v36, v38);
        v39 = [(THWSceneRep *)self imageCropAnimationController];
        double v40 = 0.0;
      }
      [(THWImageCropAnimationController *)v39 setTargetCornerRadius:v40];
    }
  }
  else
  {
    -[THWSceneRep p_contentsRectForDestination:shouldFill:](self, "p_contentsRectForDestination:shouldFill:", v16, v11, v13);
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    if (a3)
    {
      [a3 p_contentsRectForDestination:v16 ^ 1 shouldFill:v7, v9];
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;
    }
    else
    {
      double v54 = 1.0;
      double v50 = 0.0;
      double v52 = 0.0;
      double v56 = 1.0;
    }
    self->_imageCropAnimationController = [[THWImageCropAnimationController alloc] initWithImageContentLayer:v5];
    -[THWImageCropAnimationController setSourceContentsRect:]([(THWSceneRep *)self imageCropAnimationController], "setSourceContentsRect:", v42, v44, v46, v48);
    [(THWImageCropAnimationController *)[(THWSceneRep *)self imageCropAnimationController] setSourceCornerRadius:0.0];
    -[THWImageCropAnimationController setTargetContentsRect:]([(THWSceneRep *)self imageCropAnimationController], "setTargetContentsRect:", v50, v52, v54, v56);
    [(THWImageCropAnimationController *)[(THWSceneRep *)self imageCropAnimationController] setTargetCornerRadius:0.0];
    [(THWImageCropAnimationController *)[(THWSceneRep *)self imageCropAnimationController] setCropDurationScale:0.5];
    [(THWImageCropAnimationController *)[(THWSceneRep *)self imageCropAnimationController] setCornerRadiusDurationScale:0.5];
    v63 = [(THWSceneRep *)self imageCropAnimationController];
    [(THWImageCropAnimationController *)v63 setupWrapperLayer];
  }
}

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
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

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)loanedSceneController
{
  return self->_loanedSceneController;
}

- (void)setLoanedSceneController:(BOOL)a3
{
  self->_loanedSceneController = a3;
}

- (BOOL)sceneTransferHappened
{
  return self->_sceneTransferHappened;
}

- (void)setSceneTransferHappened:(BOOL)a3
{
  self->_sceneTransferHappened = a3;
}

- (BOOL)sceneDidReceiveRotationLayoutDuringFreeTransform
{
  return self->_sceneDidReceiveRotationLayoutDuringFreeTransform;
}

- (void)setSceneDidReceiveRotationLayoutDuringFreeTransform:(BOOL)a3
{
  self->_sceneDidReceiveRotationLayoutDuringFreeTransform = a3;
}

- (THWSceneController)sceneController
{
  return self->_sceneController;
}

- (void)setSceneController:(id)a3
{
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (void)setPressableHandler:(id)a3
{
}

- (BOOL)isCurrentlyScrolling
{
  return self->_isCurrentlyScrolling;
}

- (THWImageCropAnimationController)imageCropAnimationController
{
  return self->_imageCropAnimationController;
}

- (void)setImageCropAnimationController:(id)a3
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

@end