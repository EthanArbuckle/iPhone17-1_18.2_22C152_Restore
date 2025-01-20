@interface THWDrawablesWidgetRep
- (BOOL)animationContainerProvidesShadowForAnimation;
- (BOOL)canExpand;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4;
- (BOOL)expandedContentAllowDoubleTapZoom;
- (BOOL)expandedContentAllowPinchZoom;
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)freeTransformMayBeginOverRep:(id)a3;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)freeTransformWantsShadow;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)isFreeTransformInProgress;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)pIsChildInfo:(id)a3 inContainerInfo:(id)a4;
- (BOOL)p_expandedStageDrawableWantsFreeTransform;
- (BOOL)p_isExpanded;
- (BOOL)p_isExpanding;
- (BOOL)p_isFreeTransformInProgressOnSourceRep;
- (BOOL)p_shouldSuppressRenderingDuringExpansion;
- (BOOL)panelDescriptionExpanded;
- (BOOL)shouldClickDragToPanWhenZoomed;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldHitTestChildImageRep:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)shouldUseContainerForAnimation;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (CALayer)pressableAnimationLayer;
- (CALayer)pressableAnimationShadowLayer;
- (CGAffineTransform)freeTransform;
- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (CGRect)expandedFrameInUnscaledCanvasSize;
- (CGRect)ftcTargetFrame;
- (CGRect)pressableNaturalBounds;
- (CGRect)rectForCompletion;
- (THAnimationController)animationController;
- (THWDrawablesWidgetRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWExpandedRepController)expandedRepController;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (id)animationLayer;
- (id)expandedChildInfosForPanel:(int)a3;
- (id)expandedContentDrawableToPresent;
- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)p_animationLayer;
- (id)p_repToAnimate;
- (id)p_setupContainerLayer;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)sourceReflectionLayer;
- (id)sourceShadowLayer;
- (id)styledRep;
- (id)targetLayer;
- (id)targetReflectionLayer;
- (id)targetShadowLayer;
- (int)autoRotationMode;
- (int)expandedAppearance;
- (int)expandedAppearanceForPanel:(int)a3;
- (int)pressableAction;
- (unint64_t)hitTestOptions;
- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5;
- (void)animationControllerDidPresent:(id)a3;
- (void)dealloc;
- (void)didPresentExpanded;
- (void)expandedDidRotateTransitionToSize:(CGSize)a3;
- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (void)expandedWillPresentWithController:(id)a3;
- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (void)freeTransformWillBegin;
- (void)p_addChildRepsToArray:(id)a3 inContainer:(id)a4;
- (void)p_suppressRendering:(BOOL)a3;
- (void)p_togglePanelDescriptionExpanded;
- (void)setAnimationContainerProvidesShadowForAnimation:(BOOL)a3;
- (void)setExpandedRepController:(id)a3;
- (void)setHandlingPress:(BOOL)a3;
- (void)setPanelDescriptionExpanded:(BOOL)a3;
- (void)setPressableHandler:(id)a3;
- (void)setShouldUseContainerForAnimation:(BOOL)a3;
- (void)willBeginHandlingGesture:(id)a3;
@end

@implementation THWDrawablesWidgetRep

- (THWDrawablesWidgetRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)THWDrawablesWidgetRep;
  v4 = [(THWDrawablesWidgetRep *)&v10 initWithLayout:a3 canvas:a4];
  if (v4)
  {
    objc_opt_class();
    [(THWDrawablesWidgetRep *)v4 interactiveCanvasController];
    id v5 = [(id)TSUDynamicCast() pressHandlerForPressableReps];
    if (v5) {
      [(THWDrawablesWidgetRep *)v4 setPressableHandler:[[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:v4 pressHandler:v5]];
    }
    id v6 = [(THWDrawablesWidgetRep *)v4 info];
    if ((objc_msgSend(-[THWDrawablesWidgetRep layout](v4, "layout"), "isExpanded") & 1) != 0
      || ![v6 isExpandedOnly]
      || [(THWDrawablesWidgetRep *)v4 p_expandedStageDrawableWantsFreeTransform])
    {
      v4->mFreeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
    }
    id v7 = [v4 layout].actualStageDrawable;
    id v8 = [v7 repClass];
    if (objc_opt_respondsToSelector())
    {
      -[THWDrawablesWidgetRep setShouldUseContainerForAnimation:](v4, "setShouldUseContainerForAnimation:", [v8 expandableUseContainerForAnimations:v7]);
      if ([(THWDrawablesWidgetRep *)v4 shouldUseContainerForAnimation])
      {
        objc_opt_class();
        -[THWDrawablesWidgetRep setAnimationContainerProvidesShadowForAnimation:](v4, "setAnimationContainerProvidesShadowForAnimation:", objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "shadow"), "isEnabled"));
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  self->mStageChildReps = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWDrawablesWidgetRep;
  [(THWDrawablesWidgetRep *)&v3 dealloc];
}

- (BOOL)p_isExpanded
{
  id v2 = [(THWDrawablesWidgetRep *)self layout];

  return [v2 isExpanded];
}

- (BOOL)p_isFreeTransformInProgressOnSourceRep
{
  objc_opt_class();
  [(THWExpandedRepController *)self->_expandedRepController expandedRepSourceRep];
  id v3 = objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "freeTransformableHandler"), "ftc");

  return [v3 isFreeTransformInProgress];
}

- (BOOL)p_shouldSuppressRenderingDuringExpansion
{
  if ([(THWDrawablesWidgetRep *)self shouldUseContainerForAnimation])
  {
    objc_opt_class();
    [self layout].actualStageDrawable
    id v3 = (void *)TSUDynamicCast();
    if ([v3 stroke])
    {
      if ((objc_msgSend(objc_msgSend(v3, "stroke"), "isFrame") & 1) == 0)
      {
        objc_msgSend(objc_msgSend(v3, "stroke"), "width");
        if (v4 > 1.0) {
          return 0;
        }
      }
    }
  }
  if (![(THWDrawablesWidgetRep *)self p_isExpanding]) {
    return 0;
  }

  return [(THWDrawablesWidgetRep *)self p_isFreeTransformInProgressOnSourceRep];
}

- (BOOL)p_isExpanding
{
  expandedRepController = self->_expandedRepController;
  if (expandedRepController) {
    LOBYTE(expandedRepController) = [(THWExpandedRepController *)expandedRepController expandedRepControllerState] == 1;
  }
  return (char)expandedRepController;
}

- (void)p_suppressRendering:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(THWDrawablesWidgetRep *)self interactiveCanvasController];

  [v4 setShouldSuppressRendering:v3 animated:0];
}

- (id)p_repToAnimate
{
  if (!objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")
    || (id result = objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable"))) == 0)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWDrawablesWidgetRep p_repToAnimate]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWDrawablesWidgetRep.m") lineNumber:180 description:@"invalid nil value for '%s'", "repToAnimate"];
    return self;
  }
  return result;
}

- (BOOL)p_expandedStageDrawableWantsFreeTransform
{
  if (!objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable")) {
    return 0;
  }
  id v3 = objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable"), "repClass");
  if (![v3 conformsToProtocol:&OBJC_PROTOCOL___THWExpandedRep]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }
  id v4 = [[self info] expandedStageDrawable];

  return [v3 expandedAllowsFreeTransformForInfo:v4];
}

- (BOOL)shouldHitTestChildImageRep:(id)a3
{
  return 1;
}

- (unint64_t)hitTestOptions
{
  return 4;
}

- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4
{
  id v7 = [a3 gestureKind];
  if (v7 == (id)TSDFreeTransform) {
    return 1;
  }
  id v8 = [(THWDrawablesWidgetRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v8 canHandleGesture:a3 forChildRep:a4];
}

- (id)p_setupContainerLayer
{
  id v3 = [(THWDrawablesWidgetRep *)self p_repToAnimate];
  id v4 = [[self interactiveCanvasController] layerForRep:v3];
  id v5 = [[self interactiveCanvasController] containerLayerForRep:v3];
  [v5 setAnchorPoint:0.5, 0.5];
  [v4 frame];
  TSDCenterOfRect();
  [v5 setPosition:];
  [v4 frame];
  double v7 = v6;
  [v4 frame];
  [v5 setBounds:0.0, 0.0, v7];
  [v4 frame];
  CGFloat v9 = -v8;
  [v4 frame];
  CATransform3DMakeTranslation(&v13, v9, -v10, 0.0);
  CATransform3D v12 = v13;
  [v5 setSublayerTransform:&v12];
  return v5;
}

- (CALayer)pressableAnimationLayer
{
  if ([(THWDrawablesWidgetRep *)self shouldUseContainerForAnimation])
  {
    return (CALayer *)[(THWDrawablesWidgetRep *)self p_setupContainerLayer];
  }
  else
  {
    id v3 = [(THWDrawablesWidgetRep *)self interactiveCanvasController];
    id v4 = [(THWDrawablesWidgetRep *)self p_repToAnimate];
    return (CALayer *)[v3 layerForRep:v4];
  }
}

- (CALayer)pressableAnimationShadowLayer
{
  if ([(THWDrawablesWidgetRep *)self shouldUseContainerForAnimation]) {
    return 0;
  }

  return (CALayer *)[(THWDrawablesWidgetRep *)self sourceShadowLayer];
}

- (int)pressableAction
{
  v3.receiver = self;
  v3.super_class = (Class)THWDrawablesWidgetRep;
  return [(THWDrawablesWidgetRep *)&v3 pressableAction];
}

- (BOOL)wantsPressAnimation
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]|| ![(THWDrawablesWidgetRep *)self meetsStageDimensionRequirementForExpanded])
  {
    return 0;
  }
  id v3 = objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable"));
  uint64_t v4 = [(THWDrawablesWidgetRep *)self pressableAction];

  return [v3 allowsAction:v4];
}

- (BOOL)wantsPressAction
{
  unsigned int v3 = [(THWDrawablesWidgetRep *)self meetsStageDimensionRequirementForExpanded];
  if (v3)
  {
    id v4 = objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable"));
    uint64_t v5 = [(THWDrawablesWidgetRep *)self pressableAction];
    LOBYTE(v3) = [v4 allowsAction:v5];
  }
  return v3;
}

- (BOOL)pIsChildInfo:(id)a3 inContainerInfo:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  do
  {
    BOOL v6 = v5 == a4;
    id v7 = [v5 parentInfo];
    if (!v7) {
      break;
    }
    BOOL v8 = v5 == a4;
    id v5 = v7;
  }
  while (!v8);
  return v6;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  id v5 = [a3 info];
  if (v5 == objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "adornmentInfo"), "background"))
  {
    objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "geometry"), "size");
    double v7 = v6;
    double v9 = v8;
    objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "adornmentInfo"), "background"), "geometry"), "size");
    if (v7 == v11 && v9 == v10)
    {
      objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "adornmentInfo"), "background"), "geometry"), "position");
      BOOL v15 = v14 == CGPointZero.x && v13 == CGPointZero.y;
      if (v15
        && (objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")), "allowsAction:", -[THWDrawablesWidgetRep pressableAction](self, "pressableAction")) & 1) != 0)
      {
        return 1;
      }
    }
  }
  id v16 = [a3 info];
  if (v16 == objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")) {
    return 1;
  }
  id v17 = [a3 info];
  [self layout].actualStageDrawable
  uint64_t v18 = TSUProtocolCast();

  return [(THWDrawablesWidgetRep *)self pIsChildInfo:v17 inContainerInfo:v18];
}

- (CGRect)pressableNaturalBounds
{
  id v2 = [(THWDrawablesWidgetRep *)self layout];

  [v2 stageFrame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)p_animationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]|| (id result = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] freeTransformLayer]) == 0)
  {
    return [(THWDrawablesWidgetRep *)self pressableAnimationLayer];
  }
  return result;
}

- (id)shadowAnimationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])return 0; {
  double v3 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc];
  }

  return [(THWFreeTransformController *)v3 shadowLayer];
}

- (id)sourceShadowLayer
{
  if ([(THWDrawablesWidgetRep *)self shouldUseContainerForAnimation]) {
    return 0;
  }
  id v4 = [(THWDrawablesWidgetRep *)self styledRep];

  return [v4 shadowLayer];
}

- (id)sourceReflectionLayer
{
  if ([(THWDrawablesWidgetRep *)self shouldUseContainerForAnimation]) {
    return 0;
  }
  id v4 = [(THWDrawablesWidgetRep *)self styledRep];

  return [v4 reflectionLayer];
}

- (id)animationLayer
{
  return [(THWDrawablesWidgetRep *)self p_animationLayer];
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  objc_opt_class();
  double v5 = (void *)TSUDynamicCast();
  if (-[THWDrawablesWidgetRep p_shouldSuppressRenderingDuringExpansion](self, "p_shouldSuppressRenderingDuringExpansion")|| (objc_msgSend(v5, "p_shouldSuppressRenderingDuringExpansion") & 1) != 0|| -[THWDrawablesWidgetRep p_isExpanded](self, "p_isExpanded"))
  {
    goto LABEL_4;
  }
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]|| (BOOL v6 = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] passedThreshold]))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([a3 shouldForceDisableCrossfadeFromSource:self] & 1) != 0)
    {
LABEL_4:
      LOBYTE(v6) = 0;
      return v6;
    }
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (CGAffineTransform)freeTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id result = (CGAffineTransform *)[(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress];
  if (result)
  {
    id result = [(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc];
    if (result)
    {
      id result = (CGAffineTransform *)[(CGAffineTransform *)result currentTransform];
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

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return ![(THWDrawablesWidgetRep *)self p_shouldSuppressRenderingDuringExpansion];
}

- (id)targetLayer
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]&& ![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] passedThreshold])
  {
    return 0;
  }

  return [(THWDrawablesWidgetRep *)self p_animationLayer];
}

- (CGRect)ftcTargetFrame
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])
  {
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] completionTargetRect];
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

- (id)targetShadowLayer
{
  if ([(THWDrawablesWidgetRep *)self shouldUseContainerForAnimation]) {
    return 0;
  }
  id v4 = [(THWDrawablesWidgetRep *)self styledRep];

  return [v4 shadowLayer];
}

- (id)targetReflectionLayer
{
  if ([(THWDrawablesWidgetRep *)self shouldUseContainerForAnimation]) {
    return 0;
  }
  id v4 = [(THWDrawablesWidgetRep *)self styledRep];

  return [v4 reflectionLayer];
}

- (BOOL)shouldClickDragToPanWhenZoomed
{
  return 1;
}

- (id)expandedContentDrawableToPresent
{
  id v3 = [self info].expandedStageDrawable;
  id v4 = [(THWDrawablesWidgetRep *)self info];
  if (v3) {
    id v5 = [v4 expandedStageDrawable];
  }
  else {
    id v5 = [v4 stageDrawable];
  }
  id v6 = [v5 repClass];
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___THWExpandedRep]
    && ((objc_opt_respondsToSelector() & 1) == 0
     || objc_msgSend(v6, "expandedAllowsPresentationInExpandedForInfo:isReflowablePresentation:", objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable"), objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "isReflowablePresentation"))))
  {
    id v7 = [[self info] expandedStageDrawable];
    id v8 = [(THWDrawablesWidgetRep *)self info];
    if (v7)
    {
      return [v8 expandedStageDrawable];
    }
    else
    {
      return [v8 stageDrawable];
    }
  }
  else
  {
    return [(THWDrawablesWidgetRep *)self info];
  }
}

- (void)didPresentExpanded
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(THWDrawablesWidgetRep *)self childReps];
  id v4 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)TSUProtocolCast();
        if (objc_opt_respondsToSelector()) {
          [v8 didPresentExpanded];
        }
        ++v7;
      }
      while (v5 != v7);
      id v5 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [self layout].invalidateChildren;
  [(THWDrawablesWidgetRep *)self p_suppressRendering:0];
  [self interactiveCanvasController].layoutIfNeeded;
}

- (THAnimationController)animationController
{
  CGRect result = self->mAnimationController;
  if (!result)
  {
    id v4 = objc_alloc_init(THAnimationController);
    self->mAnimationController = v4;
    [(THAnimationController *)v4 addObserver:self];
    [(THAnimationController *)self->mAnimationController setSource:self];
    return self->mAnimationController;
  }
  return result;
}

- (BOOL)canExpand
{
  id v2 = [[-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController") repForInfo:[-[THWDrawablesWidgetRep layout](self, "layout") actualStageDrawable]];

  return [v2 canExpand];
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
  if ([(THWDrawablesWidgetRep *)self p_shouldSuppressRenderingDuringExpansion])
  {
    [(THWDrawablesWidgetRep *)self p_suppressRendering:1];
  }
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  [self layout:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height];
  id v5 = [(THWDrawablesWidgetRep *)self layout];

  [v5 invalidateChildren];
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [self info].adornmentInfo;

  return [v4 panelContentProviderHasContentForPanel:v3];
}

- (id)expandedChildInfosForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [self info].adornmentInfo;

  return [v4 panelContentProviderChildInfosForPanel:v3];
}

- (BOOL)expandedContentAllowPinchZoom
{
  return 1;
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 1;
}

- (int)expandedAppearance
{
  if (!objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable")) {
    [self info].stageDrawable;
  }
  objc_opt_class();
  [self interactiveCanvasController:&OBJC_PROTOCOL___TSDInfo] repForInfo:BUClassAndProtocolCast()];
  uint64_t v3 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [v3 expandedAppearance];
}

- (int)expandedAppearanceForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable")) {
    [self info].stageDrawable;
  }
  objc_opt_class();
  [self interactiveCanvasController:&OBJC_PROTOCOL___TSDInfo] repForInfo:BUClassAndProtocolCast();
  id v5 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [v5 expandedAppearanceForPanel:v3];
}

- (void)p_addChildRepsToArray:(id)a3 inContainer:(id)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a4 childReps];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [a3 addObject:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10)];
        uint64_t v11 = TSUProtocolCast();
        if (v11) {
          [(THWDrawablesWidgetRep *)self p_addChildRepsToArray:a3 inContainer:v11];
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (CGRect)expandedFrameInUnscaledCanvasSize
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:[-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController") repForInfo:[-[THWDrawablesWidgetRep layout](self, "layout") actualStageDrawable]]];
  uint64_t v4 = TSUProtocolCast();
  if (v4) {
    [(THWDrawablesWidgetRep *)self p_addChildRepsToArray:v3 inContainer:v4];
  }
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    CGFloat v11 = height;
    CGFloat v12 = width;
    CGFloat v13 = y;
    CGFloat x = CGRectZero.origin.x;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v3);
        }
        id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v35.origin.CGFloat x = CGRectZero.origin.x;
        v35.origin.CGFloat y = y;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        v38.origin.CGFloat x = x;
        v38.origin.CGFloat y = v13;
        v38.size.CGFloat width = v12;
        v38.size.CGFloat height = v11;
        BOOL v17 = CGRectEqualToRect(v35, v38);
        [v16 frameInUnscaledCanvas];
        CGFloat v22 = v18;
        double v23 = v19;
        double v24 = v20;
        double v25 = v21;
        if (!v17)
        {
          v36.origin.CGFloat x = x;
          v36.origin.CGFloat y = v13;
          v36.size.CGFloat width = v12;
          v36.size.CGFloat height = v11;
          *(CGRect *)&CGFloat v18 = CGRectUnion(v36, *(CGRect *)&v22);
        }
        CGFloat x = v18;
        CGFloat v13 = v19;
        CGFloat v12 = v20;
        CGFloat v11 = v21;
      }
      id v9 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }
  else
  {
    CGFloat v11 = height;
    CGFloat v12 = width;
    CGFloat v13 = y;
    CGFloat x = CGRectZero.origin.x;
  }

  double v26 = x;
  double v27 = v13;
  double v28 = v12;
  double v29 = v11;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (void)p_togglePanelDescriptionExpanded
{
  [(THWDrawablesWidgetRep *)self setPanelDescriptionExpanded:[(THWDrawablesWidgetRep *)self panelDescriptionExpanded] ^ 1];
  [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerAnimatePanel:1 withCrossFadeContent:1 backgroundLayout:0 duration:0.25];
  expandedRepController = self->_expandedRepController;

  [(THWExpandedRepController *)expandedRepController expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:1];
}

- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4
{
  if (a3 != 1) {
    return 0;
  }
  v7[7] = v4;
  v7[8] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1467D4;
  v7[3] = &unk_456DE0;
  v7[4] = self;
  return [[THWTapGestureAction alloc] initWithAction:v7];
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    id v6 = [[-[THWDrawablesWidgetRep layout](self, "layout", a3) layoutController];
    if ([v6 isCompactHeight])
    {
      return 2;
    }
    else if ([v6 isCompactWidth])
    {
      return 5;
    }
  }
  return a5;
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable"), "geometry"), "boundsBeforeRotation");
  double v4 = v3;
  double v6 = v5;
  if (objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable")) {
    return 1;
  }
  if (v6 < 660.0) {
    return v4 < 960.0;
  }
  return 0;
}

- (id)shadowPath
{
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 1;
}

- (BOOL)isFreeTransformInProgress
{
  id v2 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc];

  return [(THWFreeTransformController *)v2 isFreeTransformInProgress];
}

- (void)freeTransformWillBegin
{
  id v2 = [(THWDrawablesWidgetRep *)self pressableAnimationLayer];

  [(CALayer *)v2 removeAllAnimations];
}

- (BOOL)freeTransformMayBeginOverRep:(id)a3
{
  if ([(THWDrawablesWidgetRep *)self p_isExpanded]) {
    return 1;
  }

  return [(THWDrawablesWidgetRep *)self shouldRecognizePressOnRep:a3];
}

- (id)styledRep
{
  objc_opt_class();
  [(THWDrawablesWidgetRep *)self p_repToAnimate];

  return (id)TSUDynamicCast();
}

- (BOOL)freeTransformWantsShadow
{
  if ([(THWDrawablesWidgetRep *)self shouldUseContainerForAnimation]) {
    return ![(THWDrawablesWidgetRep *)self animationContainerProvidesShadowForAnimation];
  }
  else {
    return 1;
  }
}

- (CGRect)rectForCompletion
{
  id v2 = [[-[THWDrawablesWidgetRep styledRep](self, "styledRep")] layout];

  [v2 frameInParent];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
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
  id v9 = [(THWDrawablesWidgetRep *)self layout];
  [self interactiveCanvasController].viewScale;

  [v9 scaleForCenteredAutoRotateFromSize:v7 toSize:v6 scale:width, height, v10];
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

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])
  {
    [self layout].invalidateFrame;
    id v4 = [(THWDrawablesWidgetRep *)self layout];
    [v4 invalidateChildren];
  }
}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  id v4 = [(THWDrawablesWidgetRep *)self interactiveCanvasController];

  [v4 setViewScale:1.0];
}

- (BOOL)canHandleGesture:(id)a3
{
  if (-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3)&& (objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")), "allowsAction:", 2) & 1) != 0)
  {
    return 1;
  }
  double v6 = [(THWDrawablesWidgetRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v6 canHandleGesture:a3];
}

- (BOOL)handleGesture:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self pressableHandler] handleGesture:a3]|| [(THWFreeTransformableRepGestureTargetHandler *)[(THWDrawablesWidgetRep *)self freeTransformableHandler] handleGesture:a3])
  {
    return 1;
  }
  [a3 gestureKind];
  return 0;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSDFreeTransform)
  {
    double v6 = [(THWDrawablesWidgetRep *)self freeTransformableHandler];
    [(THWFreeTransformableRepGestureTargetHandler *)v6 willBeginHandlingGesture:a3];
  }
}

- (void)animationControllerDidPresent:(id)a3
{
  self->mAnimationController = 0;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)THWDrawablesWidgetRep;
  id result = -[THWDrawablesWidgetRep hitRep:withGesture:passingTest:](&v12, "hitRep:withGesture:passingTest:");
  if (!result)
  {
    id v11 = [a4 gestureKind];
    if (v11 == (id)TSDFreeTransform
      && ([(THWDrawablesWidgetRep *)self p_isExpanded]
       || ([(THWDrawablesWidgetRep *)self naturalBounds],
           v13.CGFloat x = x,
           v13.CGFloat y = y,
           CGRectContainsPoint(v14, v13)))
      && (!a5 || (*((unsigned int (**)(id, THWDrawablesWidgetRep *))a5 + 2))(a5, self)))
    {
      return self;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->mPressableHandler;
}

- (void)setPressableHandler:(id)a3
{
}

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->mFreeTransformableHandler;
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (void)setExpandedRepController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (BOOL)shouldUseContainerForAnimation
{
  return self->_shouldUseContainerForAnimation;
}

- (void)setShouldUseContainerForAnimation:(BOOL)a3
{
  self->_shouldUseContainerForAnimation = a3;
}

- (BOOL)animationContainerProvidesShadowForAnimation
{
  return self->_animationContainerProvidesShadowForAnimation;
}

- (void)setAnimationContainerProvidesShadowForAnimation:(BOOL)a3
{
  self->_animationContainerProvidesShadowForAnimation = a3;
}

- (BOOL)panelDescriptionExpanded
{
  return self->_panelDescriptionExpanded;
}

- (void)setPanelDescriptionExpanded:(BOOL)a3
{
  self->_panelDescriptionExpanded = a3;
}

@end