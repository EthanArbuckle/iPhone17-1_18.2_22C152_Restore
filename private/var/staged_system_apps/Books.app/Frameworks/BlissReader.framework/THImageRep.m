@interface THImageRep
+ (BOOL)expandableUseContainerForAnimations:(id)a3;
+ (BOOL)expandedAllowsPresentationInExpandedForInfo:(id)a3 isReflowablePresentation:(BOOL)a4;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)createdPressableHandler;
- (BOOL)expandedAspectFillOnPresentIfClose;
- (BOOL)expandedContentAllowDoubleTapZoom;
- (BOOL)expandedContentAllowPinchZoom;
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)freeTransformWantsShadow;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)isExpanded;
- (BOOL)isFreeTransformInProgress;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)p_hasHyperlink;
- (BOOL)p_imageIsMostlyBlack;
- (BOOL)p_isInBodyRep;
- (BOOL)p_shouldHitTest;
- (BOOL)panelDescriptionExpanded;
- (BOOL)pressableMoveToHitTestFront;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (CALayer)pressableAnimationLayer;
- (CGAffineTransform)freeTransform;
- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (CGRect)ftcTargetFrame;
- (CGRect)rectForCompletion;
- (THAnimationController)animationController;
- (THImageRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWExpandedRepController)expandedRepController;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (id)animationLayer;
- (id)expandedChildInfosForPanel:(int)a3;
- (id)expandedContentDrawableToPresent;
- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4;
- (id)hitRep:(CGPoint)a3;
- (id)p_hyperlink;
- (id)p_setupContainerLayer;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)targetLayer;
- (int)autoRotationMode;
- (int)expandedAppearance;
- (int)expandedAppearanceForPanel:(int)a3;
- (int)pressableAction;
- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5;
- (void)animationControllerDidPresent:(id)a3;
- (void)dealloc;
- (void)didPresentExpanded;
- (void)didUpdateLayer:(id)a3;
- (void)expandedDidRotateTransitionToSize:(CGSize)a3;
- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (void)expandedWillPresentWithController:(id)a3;
- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (void)freeTransformWillBegin;
- (void)p_togglePanelDescriptionExpanded;
- (void)setCreatedPressableHandler:(BOOL)a3;
- (void)setHandlingPress:(BOOL)a3;
- (void)setPanelDescriptionExpanded:(BOOL)a3;
- (void)setPressableHandler:(id)a3;
- (void)willBeginHandlingGesture:(id)a3;
@end

@implementation THImageRep

- (THImageRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THImageRep;
  v4 = [(THImageRep *)&v6 initWithLayout:a3 canvas:a4];
  if (v4) {
    v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THImageRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
  }
  return v4;
}

- (void)dealloc
{
  self->_pressableHandler = 0;
  self->_freeTransformableHandler = 0;

  self->_animationController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THImageRep;
  [(THImageRep *)&v3 dealloc];
}

- (void)didUpdateLayer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THImageRep;
  -[THImageRep didUpdateLayer:](&v6, "didUpdateLayer:");
  if (objc_msgSend(-[THImageRep layout](self, "layout"), "hasAlpha")
    && (objc_opt_class(),
        objc_msgSend(-[THImageRep canvas](self, "canvas"), "documentRoot"),
        objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "themeProvider"), "shouldInvertContent")))
  {
    id v5 = +[TSUColor whiteColor];
  }
  else
  {
    id v5 = 0;
  }
  objc_msgSend(a3, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));
  if (!UIAccessibilityIsInvertColorsEnabled()) {
    [a3 th_accessibilityUndoInvertColorsIfNecessary];
  }
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  if (![(THImageRep *)self createdPressableHandler])
  {
    [(THImageRep *)self setCreatedPressableHandler:1];
    if ([(THImageRep *)self wantsPressAction])
    {
      objc_opt_class();
      [(THImageRep *)self interactiveCanvasController];
      id v3 = [(id)TSUDynamicCast() pressHandlerForPressableReps];
      if (v3) {
        self->_pressableHandler = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:self pressHandler:v3];
      }
    }
  }
  return self->_pressableHandler;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  BOOL v6 = [(THImageRep *)self p_shouldHitTest];
  if (v6)
  {
    [(THImageRep *)self naturalBounds];
    CGFloat v11 = x;
    CGFloat v12 = y;
    LOBYTE(v6) = CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v11);
  }
  return v6;
}

- (id)p_setupContainerLayer
{
  id v3 = [[self interactiveCanvasController] layerForRep:self];
  id v4 = [[self interactiveCanvasController] containerLayerForRep:self];
  [v4 setAnchorPoint:0.5, 0.5];
  [v3 frame];
  TSDCenterOfRect();
  [v4 setPosition:];
  [v3 frame];
  double v6 = v5;
  [v3 frame];
  [v4 setBounds:0.0, 0.0, v6];
  [v3 frame];
  CGFloat v8 = -v7;
  [v3 frame];
  CATransform3DMakeTranslation(&v12, v8, -v9, 0.0);
  CATransform3D v11 = v12;
  [v4 setSublayerTransform:&v11];
  return v4;
}

- (CALayer)pressableAnimationLayer
{
  if (objc_msgSend(-[THImageRep layout](self, "layout"), "isCompactFlowPresentation")
    && objc_msgSend(-[THImageRep layout](self, "layout"), "isReflowablePresentation"))
  {
    id v3 = [(THImageRep *)self interactiveCanvasController];
    return (CALayer *)[v3 layerForRep:self];
  }
  else
  {
    return (CALayer *)[(THImageRep *)self p_setupContainerLayer];
  }
}

- (BOOL)wantsPressAnimation
{
  return ![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THImageRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]&& [(THImageRep *)self pressableAction] != 0;
}

- (BOOL)wantsPressAction
{
  return [(THImageRep *)self pressableAction] != 0;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return 1;
}

- (BOOL)p_isInBodyRep
{
  objc_opt_class();
  [(THImageRep *)self parentRep];
  uint64_t v3 = TSUDynamicCast();
  objc_opt_class();
  [(THImageRep *)self parentRep];
  return (v3 | TSUDynamicCast()) != 0;
}

- (int)pressableAction
{
  if ([(THImageRep *)self popUpInfo])
  {
    objc_opt_class();
    [(THImageRep *)self interactiveCanvasController];
    uint64_t v3 = (void *)TSUDynamicCast();
    if ([v3 isCompactWidth])
    {
      return 2;
    }
    else if ([v3 isCompactHeight])
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else if ([(THImageRep *)self p_hasHyperlink])
  {
    return 3;
  }
  else
  {
    int result = [(THImageRep *)self p_isInBodyRep];
    if (result)
    {
      if (objc_msgSend(-[THImageRep layout](self, "layout"), "isReflowablePresentation")) {
        return 2;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (id)hitRep:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v7.receiver = self;
  v7.super_class = (Class)THImageRep;
  id result = -[THImageRep hitRep:](&v7, "hitRep:");
  if (!result)
  {
    if ([(THImageRep *)self p_hasHyperlink])
    {
      [(THImageRep *)self naturalBounds];
      v8.CGFloat x = x;
      v8.CGFloat y = y;
      if (CGRectContainsPoint(v9, v8)) {
        return self;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)pressableMoveToHitTestFront
{
  char v3 = TSUPhoneUI();
  if ([(THImageRep *)self pressableAction] == 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (BOOL)canHandleGesture:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)[(THImageRep *)self pressableHandler] canHandleGesture:a3])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    if (!objc_msgSend(-[THImageRep layout](self, "layout"), "isReflowablePresentation")
      || ![(THImageRep *)self p_isInBodyRep])
    {
      unsigned int v5 = [self layout].isExpanded;
      if (!v5) {
        return v5;
      }
      if ([(THImageRep *)self parentRep])
      {
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    double v6 = [(THImageRep *)self freeTransformableHandler];
    LOBYTE(v5) = [(THWFreeTransformableRepGestureTargetHandler *)v6 canHandleGesture:a3];
  }
  return v5;
}

- (BOOL)handleGesture:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)[(THImageRep *)self pressableHandler] handleGesture:a3])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    if (!objc_msgSend(-[THImageRep layout](self, "layout"), "isReflowablePresentation")
      || ![(THImageRep *)self p_isInBodyRep])
    {
      unsigned int v5 = [self layout].isExpanded;
      if (!v5) {
        return v5;
      }
      if ([(THImageRep *)self parentRep])
      {
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    double v6 = [(THImageRep *)self freeTransformableHandler];
    LOBYTE(v5) = [(THWFreeTransformableRepGestureTargetHandler *)v6 handleGesture:a3];
  }
  return v5;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSDFreeTransform)
  {
    double v6 = [(THImageRep *)self freeTransformableHandler];
    [(THWFreeTransformableRepGestureTargetHandler *)v6 willBeginHandlingGesture:a3];
  }
}

- (BOOL)p_shouldHitTest
{
  objc_opt_class();
  [(THImageRep *)self parentRep];
  char v3 = (void *)TSUDynamicCast();
  objc_opt_class();
  [(THImageRep *)self parentRep];
  uint64_t v4 = TSUDynamicCast();
  objc_opt_class();
  [(THImageRep *)self parentRep];
  uint64_t v5 = TSUDynamicCast();
  if (objc_msgSend(-[THImageRep info](self, "info"), "popUpInfo")
    || ([v3 shouldHitTestChildImageRep:self] & 1) != 0)
  {
    return 1;
  }
  if (!(v4 | v5)) {
    return 0;
  }
  id v7 = [(THImageRep *)self layout];

  return [v7 isReflowablePresentation];
}

- (id)p_hyperlink
{
  objc_opt_class();
  [(THImageRep *)self info];
  char v3 = (void *)TSUDynamicCast();

  return [v3 hyperlinkURL];
}

- (BOOL)p_hasHyperlink
{
  return [(THImageRep *)self p_hyperlink] != 0;
}

- (BOOL)isExpanded
{
  id v2 = [(THImageRep *)self layout];

  return [v2 isExpanded];
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  objc_msgSend(objc_msgSend(-[THImageRep layout](self, "layout"), "geometry"), "size");
  return v3 < 660.0 || v2 < 960.0;
}

- (id)shadowPath
{
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 0;
}

- (BOOL)freeTransformWantsShadow
{
  return 0;
}

- (BOOL)isFreeTransformInProgress
{
  double v2 = [(THWFreeTransformableRepGestureTargetHandler *)[(THImageRep *)self freeTransformableHandler] ftc];

  return [(THWFreeTransformController *)v2 isFreeTransformInProgress];
}

- (void)freeTransformWillBegin
{
  double v2 = [(THImageRep *)self pressableAnimationLayer];

  [(CALayer *)v2 removeAllAnimations];
}

- (CGRect)rectForCompletion
{
  id v2 = [(THImageRep *)self layout];

  [v2 frameInParent];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (id)expandedContentDrawableToPresent
{
  if (![(THImageRep *)self popUpInfo]
    || ([(THImageRep *)self popUpInfo], (id result = (id)TSUProtocolCast()) == 0))
  {
    return [(THImageRep *)self info];
  }
  return result;
}

- (THAnimationController)animationController
{
  id result = self->_animationController;
  if (!result)
  {
    double v4 = objc_alloc_init(THAnimationController);
    self->_animationController = v4;
    [(THAnimationController *)v4 addObserver:self];
    [(THAnimationController *)self->_animationController setSource:self];
    return self->_animationController;
  }
  return result;
}

+ (BOOL)expandedAllowsPresentationInExpandedForInfo:(id)a3 isReflowablePresentation:(BOOL)a4
{
  return a4;
}

+ (BOOL)expandableUseContainerForAnimations:(id)a3
{
  return 1;
}

- (void)p_togglePanelDescriptionExpanded
{
  [(THImageRep *)self setPanelDescriptionExpanded:[(THImageRep *)self panelDescriptionExpanded] ^ 1];
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
  v7[2] = sub_78248;
  v7[3] = &unk_456DE0;
  v7[4] = self;
  return [[THWTapGestureAction alloc] initWithAction:v7];
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    id v6 = [self layout:a3 layoutController];
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
  id v9 = [(THImageRep *)self layout];
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

- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  id v4 = [(THImageRep *)self interactiveCanvasController];

  [v4 setViewScale:1.0];
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  if (![(THImageRep *)self isFreeTransformInProgress])
  {
    [self layout].invalidateFrame;
    id v4 = [(THImageRep *)self layout];
    [v4 invalidateChildren];
  }
}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  id v4 = [(THImageRep *)self interactiveCanvasController];

  [v4 setViewScale:1.0];
}

- (void)animationControllerDidPresent:(id)a3
{
  self->_animationController = 0;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [[-[THImageRep info](self, "info")] panelContentProvider];

  return [v4 panelContentProviderHasContentForPanel:v3];
}

- (id)expandedChildInfosForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [[self info] panelContentProvider];

  return [v4 panelContentProviderChildInfosForPanel:v3];
}

- (BOOL)expandedAspectFillOnPresentIfClose
{
  id v2 = [(THImageRep *)self layout];

  return [v2 isIntroMedia];
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  id v4 = [(THImageRep *)self layout];

  [v4 invalidateFrame];
}

- (int)expandedAppearance
{
  return [(THImageRep *)self p_imageIsMostlyBlack];
}

- (BOOL)p_imageIsMostlyBlack
{
  id v2 = (CGImage *)[(THImageRep *)self imageRef];
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(v2);
  if (AlphaInfo)
  {
    v12.double width = 1.0;
    v12.double height = 1.0;
    UIGraphicsBeginImageContext(v12);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationMedium);
    -[UIImage drawInRect:blendMode:alpha:](+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v2), "drawInRect:blendMode:alpha:", 17, 0.0, 0.0, 1.0, 1.0, 1.0);
    Data = CGBitmapContextGetData(CurrentContext);
    LOBYTE(v6) = *Data;
    LOBYTE(v7) = Data[1];
    *(double *)&unint64_t v8 = (double)v7 * 0.7152;
    double v9 = *(double *)&v8 + (double)v6 * 0.2126;
    LOBYTE(v8) = Data[2];
    double v10 = v9 + (double)v8 * 0.0722;
    UIGraphicsEndImageContext();
    LOBYTE(AlphaInfo) = v10 < 0.05;
  }
  return AlphaInfo;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 0;
}

- (void)didPresentExpanded
{
  id v2 = [(THImageRep *)self layout];

  [v2 invalidate];
}

- (BOOL)expandedContentAllowPinchZoom
{
  return 1;
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 1;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  if (![(THImageRep *)self isFreeTransformInProgress]
    || (id result = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THImageRep *)self freeTransformableHandler] ftc] freeTransformLayer]) == 0)
  {
    return [(THImageRep *)self pressableAnimationLayer];
  }
  return result;
}

- (id)shadowAnimationLayer
{
  if (![(THImageRep *)self isFreeTransformInProgress]
    || (id result = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THImageRep *)self freeTransformableHandler] ftc] shadowLayer]) == 0)
  {
    return [(THImageRep *)self pressableAnimationShadowLayer];
  }
  return result;
}

- (CGAffineTransform)freeTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id result = (CGAffineTransform *)[(THImageRep *)self isFreeTransformInProgress];
  if (result)
  {
    id result = [(THWFreeTransformableRepGestureTargetHandler *)[(THImageRep *)self freeTransformableHandler] ftc];
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
    *(_OWORD *)&retstr->tdouble x = v10;
  }
  return result;
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 1;
}

- (id)targetLayer
{
  if ([(THImageRep *)self isFreeTransformInProgress]
    && ![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THImageRep *)self freeTransformableHandler] ftc] passedThreshold])
  {
    return 0;
  }

  return [(THImageRep *)self pressableAnimationLayer];
}

- (CGRect)ftcTargetFrame
{
  if ([(THImageRep *)self isFreeTransformInProgress])
  {
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THImageRep *)self freeTransformableHandler] ftc] completionTargetRect];
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

- (void)setPressableHandler:(id)a3
{
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (BOOL)createdPressableHandler
{
  return self->_createdPressableHandler;
}

- (void)setCreatedPressableHandler:(BOOL)a3
{
  self->_createdPressableHandler = a3;
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