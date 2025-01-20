@interface THWViewportRep
- (BOOL)allowSelectionPopover;
- (BOOL)canExpand;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canSelectChildRep:(id)a3;
- (BOOL)centeredInScrollViewForScrollableCanvasController:(id)a3;
- (BOOL)deferViewCreationForScrollableCanvasController:(id)a3;
- (BOOL)expandedContentAllowDoubleTapZoom;
- (BOOL)expandedContentAllowPinchZoom;
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)expandedShouldDismissOnChangeFromSizeClassPairWithController:(id)a3 flowMode:(BOOL)a4;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)infosChangeForViewportChangeInScrollableCanvasController:(id)a3;
- (BOOL)isExpanded;
- (BOOL)isFreeTransformInProgress;
- (BOOL)isRelatedCanvasScrollingForscrollableCanvasController:(id)a3;
- (BOOL)maintainScrollOffsetInFrameChangeForScrollableCanvasController:(id)a3;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)scrollableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)scrollableCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5;
- (BOOL)scrollableCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)scrollableCanvasControllerShouldShowScaleFeedback:(id)a3;
- (BOOL)scrollableCanvasControllerUseOverlayScrollerOnly:(id)a3;
- (BOOL)shouldAnimateToFit;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)tracksScore;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (CALayer)pressableAnimationLayer;
- (CALayer)pressableAnimationShadowLayer;
- (CGAffineTransform)freeTransform;
- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (CGRect)ftcTargetFrame;
- (CGRect)rectForCompletion;
- (CGSize)sizeOfCanvasForScrollableCanvasController:(id)a3;
- (NSArray)childReps;
- (THAnimationController)animationController;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (THWScrollableCanvasController)scrollableCanvasController;
- (THWViewportRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSDContainerInfo)containerInfo;
- (UIEdgeInsets)contentInsetsForScrollableCanvasController:(id)a3;
- (double)contentsScaleForScrollableCanvasController:(id)a3;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (double)scrollableCanvasController:(id)a3 allowsPinchZoomForFrameSize:(CGSize)a4;
- (double)scrollableCanvasController:(id)a3 maxViewScaleForFrameSize:(CGSize)a4;
- (double)scrollableCanvasController:(id)a3 minViewScaleForFrameSize:(CGSize)a4;
- (double)scrollableCanvasController:(id)a3 viewScaleForFrameSize:(CGSize)a4 withScale:(double)a5;
- (id)animationLayer;
- (id)bookNavigatorForScrollableCanvasController:(id)a3;
- (id)documentNavigatorForScrollableCanvasController:(id)a3;
- (id)expandedBackgroundColor;
- (id)expandedChildInfosForPanel:(int)a3;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)maskLayerForScrollableCanvasController:(id)a3;
- (id)p_innerMaskLayerWithBounds:(CGRect)a3 path:(CGPath *)a4 fadeSizes:(UIEdgeInsets)a5 maskGroupVerticalInset:(double)a6;
- (id)p_outerMaskLayerWithFrame:(CGRect)a3 path:(CGPath *)a4;
- (id)scrollableCanvasController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6;
- (id)scrollableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4;
- (id)scrollableCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)scrollableCanvasHost;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)strokeLayerForScrollableCanvasController:(id)a3;
- (id)targetLayer;
- (int)autoRotationMode;
- (int)expandedAppearanceForPanel:(int)a3;
- (int)pressableAction;
- (void)animationControllerDidPresent:(id)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)dealloc;
- (void)expandedDidTransitionToSize:(CGSize)a3;
- (void)expandedViewControllerWillPresent:(id)a3;
- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5;
- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (void)freeTransformDidEnd;
- (void)freeTransformWillBegin;
- (void)scrollableCanvasController:(id)a3 customizeLayerHost:(id)a4;
- (void)setChildReps:(id)a3;
- (void)setHandlingPress:(BOOL)a3;
- (void)setPressableHandler:(id)a3;
- (void)setScrollableCanvasController:(id)a3;
- (void)updateChildrenFromLayout;
- (void)viewScrollWillChange;
- (void)viewScrollingEnded;
- (void)willBeginHandlingGesture:(id)a3;
@end

@implementation THWViewportRep

- (THWViewportRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THWViewportRep;
  v4 = [(THWViewportRep *)&v7 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4 && objc_msgSend(-[THWViewportRep layout](v4, "layout"), "isExpanded")) {
    v5->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v5, objc_msgSend(objc_msgSend(-[THWViewportRep hostICC](v5, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
  }
  return v5;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(THWViewportRep *)self childReps];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setParentRep:0];
        objc_super v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(THWViewportRep *)self setChildReps:0];
  [(THWViewportRep *)self setScrollableCanvasController:0];

  self->_pressableHandler = 0;
  self->_freeTransformableHandler = 0;

  self->_animationController = 0;
  v8.receiver = self;
  v8.super_class = (Class)THWViewportRep;
  [(THWViewportRep *)&v8 dealloc];
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  if (!self->_pressableHandler)
  {
    objc_opt_class();
    [(THWViewportRep *)self interactiveCanvasController];
    id v3 = [(id)TSUDynamicCast() pressHandlerForPressableReps];
    if (v3)
    {
      id v4 = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:self pressHandler:v3];
      self->_pressableHandler = v4;
      [(THWPressableRepGestureTargetHandler *)v4 setEnabledOnlyIfWidgetInteractionDisabledOnPage:1];
    }
  }
  return self->_pressableHandler;
}

- (void)viewScrollWillChange
{
}

- (void)viewScrollingEnded
{
}

- (void)expandedViewControllerWillPresent:(id)a3
{
  id v3 = [(THWScrollableCanvasController *)[(THWViewportRep *)self scrollableCanvasController] interactiveCanvasController];

  [(THInteractiveCanvasController *)v3 endEditing];
}

- (void)updateChildrenFromLayout
{
  id v3 = +[TSDContainerRep childrenFromLayoutInContainerRep:self];

  [(THWViewportRep *)self setChildReps:v3];
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  return +[TSDContainerRep containerRep:hitRep:withGesture:passingTest:](TSDContainerRep, "containerRep:hitRep:withGesture:passingTest:", self, a4, a5, a3.x, a3.y);
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  self->_scrollableCanvasController = 0;
  objc_opt_class();
  id v5 = (THWScrollableCanvasController *)[(id)TSUDynamicCast() scrollableCanvasController];
  self->_scrollableCanvasController = v5;
  [(THWScrollableCanvasController *)v5 setDelegate:self];
  scrollableCanvasController = self->_scrollableCanvasController;

  [(THWScrollableCanvasController *)scrollableCanvasController setUpdateCanvasSizeOnLayout:1];
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  self->_scrollableCanvasController = 0;
}

- (CALayer)pressableAnimationLayer
{
  v2 = [(THWScrollableCanvasController *)[(THWViewportRep *)self scrollableCanvasController] scrollView];

  return (CALayer *)[(TSKScrollView *)v2 layer];
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  v2 = [(THWViewportRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v2 widgetInteractionDisabledOnPage];
}

- (BOOL)wantsPressAction
{
  if ([(THWViewportRep *)self meetsStageDimensionRequirementForExpanded]
    || (BOOL v3 = [(THWPressableRepGestureTargetHandler *)[(THWViewportRep *)self pressableHandler] widgetInteractionDisabledOnPage]))
  {
    LOBYTE(v3) = [(THWViewportRep *)self pressableAction] != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return [self layout:@"layout" a3].isExpanded ^ 1;
}

- (int)pressableAction
{
  return 2;
}

- (BOOL)canHandleGesture:(id)a3
{
  if ([(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] canHandleGesture:a3])
  {
    return 1;
  }
  uint64_t v6 = [(THWViewportRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v6 canHandleGesture:a3];
}

- (BOOL)handleGesture:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)[(THWViewportRep *)self pressableHandler] canHandleGesture:a3]&& [(THWPressableRepGestureTargetHandler *)[(THWViewportRep *)self pressableHandler] handleGesture:a3])
  {
    return 1;
  }
  uint64_t v6 = [(THWViewportRep *)self freeTransformableHandler];

  return [(THWFreeTransformableRepGestureTargetHandler *)v6 handleGesture:a3];
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSDFreeTransform)
  {
    uint64_t v6 = [(THWViewportRep *)self freeTransformableHandler];
    [(THWFreeTransformableRepGestureTargetHandler *)v6 willBeginHandlingGesture:a3];
  }
}

- (BOOL)isExpanded
{
  id v2 = [(THWViewportRep *)self layout];

  return [v2 isExpanded];
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  return 1;
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
  id v2 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc];

  return [(THWFreeTransformController *)v2 isFreeTransformInProgress];
}

- (void)freeTransformWillBegin
{
  [(CALayer *)[(THWViewportRep *)self pressableAnimationLayer] removeAllAnimations];
  [-[THWViewportRep scrollableCanvasController](-[THWViewportRep scrollableCanvasController](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "scrollableCanvasController"), "
  BOOL v3 = [(THWScrollableCanvasController *)[(THWViewportRep *)self scrollableCanvasController] scrollView];

  [(TSKScrollView *)v3 setClipsToBounds:1];
}

- (void)freeTransformDidEnd
{
  [-[THWViewportRep scrollableCanvasController](-[THWScrollableCanvasController scrollView](-[TSKScrollView layer](self, "layer"), "layer"), "setBackgroundColor":[+[TSUColor clearColor](TSUColor, "clearColor") CGColor]];
  BOOL v3 = [(THWScrollableCanvasController *)[(THWViewportRep *)self scrollableCanvasController] scrollView];

  [(TSKScrollView *)v3 setClipsToBounds:0];
}

- (CGRect)rectForCompletion
{
  id v2 = [(THWViewportRep *)self layout];

  [v2 frameInParent];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)shadowAnimationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])return 0; {
  double v3 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc];
  }

  return [(THWFreeTransformController *)v3 shadowLayer];
}

- (id)animationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]|| (id result = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc] freeTransformLayer]) == 0)
  {
    double v4 = [(THWScrollableCanvasController *)[(THWViewportRep *)self scrollableCanvasController] scrollView];
    return [(TSKScrollView *)v4 layer];
  }
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
  id result = (CGAffineTransform *)[(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress];
  if (result)
  {
    id result = [(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc];
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
  return 1;
}

- (id)targetLayer
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]&& ![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc] passedThreshold])
  {
    return 0;
  }

  return [(THWViewportRep *)self animationLayer];
}

- (CGRect)ftcTargetFrame
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])
  {
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWViewportRep *)self freeTransformableHandler] ftc] completionTargetRect];
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

- (BOOL)shouldAnimateToFit
{
  id v2 = [(THWViewportRep *)self layout];

  return [v2 isExpanded];
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
    return self->_animationController;
  }
  return result;
}

- (void)animationControllerDidPresent:(id)a3
{
  self->_animationController = 0;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  return 0;
}

- (id)expandedChildInfosForPanel:(int)a3
{
  return 0;
}

- (BOOL)expandedContentAllowPinchZoom
{
  return 0;
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 2;
}

- (id)expandedBackgroundColor
{
  id v3 = objc_msgSend(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "themeProvider");
  if (v3 && [v3 forceThemeColors])
  {
    id v4 = [[[self interactiveCanvasController] documentRoot] themeProvider] backgroundColor];
    return +[TSUColor colorWithCGColor:v4];
  }
  else
  {
    objc_opt_class();
    objc_msgSend(objc_msgSend(objc_msgSend(-[THWViewportRep info](self, "info"), "backgroundShape"), "style"), "valueForProperty:", 516);
    double v6 = (void *)TSUDynamicCast();
    if (!v6) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWViewportRep expandedBackgroundColor]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Viewport/THWViewportRep.m") lineNumber:493 description:@"viewport widget must have a background color"];
    }
    return [v6 color];
  }
}

- (int)autoRotationMode
{
  return 0;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double width = a4.width;
  objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout", a3.width, a3.height, a4.width, a4.height), "info"), "canvasSize");
  double v7 = v6;
  [self info].contentPadding
  double v9 = v8;
  [(THInteractiveCanvasController *)[(THWScrollableCanvasController *)[(THWViewportRep *)self scrollableCanvasController] interactiveCanvasController] viewScale];
  double v11 = v7 * v10;
  double v12 = width + v9 * -2.0;
  if (v12 >= v7) {
    double v12 = v7;
  }
  return v12 / v11;
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5
{
  [self layout:a3.width, a3.height, a4.width, a4.height, a5];
  [self layout].invalidateChildren;
  id v6 = [(THWViewportRep *)self interactiveCanvasController];

  [v6 layoutIfNeeded];
}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  id v4 = [(THWViewportRep *)self interactiveCanvasController];

  [v4 setViewScale:1.0];
}

- (void)expandedDidTransitionToSize:(CGSize)a3
{
  [self layout:a3.width height:a3.height];
[self invalidateFrame];
  id v4 = [(THWViewportRep *)self layout];

  [v4 invalidateChildren];
}

- (CGSize)sizeOfCanvasForScrollableCanvasController:(id)a3
{
  id v3 = [(-[THWViewportRep layout](self, "layout", a3)) info];

  [v3 canvasSize];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (BOOL)infosChangeForViewportChangeInScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4
{
  id v4 = [(THWViewportRep *)self info];

  return [v4 canvasInfos];
}

- (UIEdgeInsets)contentInsetsForScrollableCanvasController:(id)a3
{
  [self info:a3 contentPadding];
  double v5 = v4;
  [self canvas].viewScale
  double v7 = v5 * v6;
  unsigned int v8 = [(THWViewportRep *)self isExpanded];
  double v9 = fmax(v7, 20.0);
  if (v8) {
    double v10 = v9;
  }
  else {
    double v10 = v7;
  }
  double v11 = v7;
  double v12 = v7;
  double v13 = v10;
  result.right = v13;
  result.bottom = v12;
  result.left = v10;
  result.top = v11;
  return result;
}

- (id)scrollableCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  [self interactiveCanvasController:a3 delegate];
  id v6 = (id)TSUProtocolCast();
  [self interactiveCanvasController].delegate
  double v7 = (void *)TSUProtocolCast();
  if (([v6 canHandleGesture:a4] & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_5;
    }
    id v6 = [v7 interactiveCanvasController:primaryTargetForGesture:[self interactiveCanvasController] a4];
  }
  if (v6) {
    return v6;
  }
LABEL_5:
  if (![(THWPressableRepGestureTargetHandler *)[(THWViewportRep *)self pressableHandler] canHandleGesture:a4])return 0; {

  }
  return [(THWViewportRep *)self pressableHandler];
}

- (id)scrollableCanvasHost
{
  id v2 = [(THWViewportRep *)self interactiveCanvasController];

  return [v2 scrollableCanvasHost];
}

- (id)strokeLayerForScrollableCanvasController:(id)a3
{
  id v4 = [self info:a3 stroke];
  if (![v4 shouldRender]
    || (objc_msgSend(-[THWViewportRep layout](self, "layout"), "isExpanded") & 1) != 0)
  {
    return 0;
  }
  id v6 = [[[[[[[self layout] info] backgroundShape] pathSource] bezierPath] copy];
  [self canvas].viewScale;
  CGFloat v8 = v7;
  [self canvas].viewScale;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v24.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v24.c = v9;
  *(_OWORD *)&v24.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformScale(&v25, &v24, v8, v10);
  [v6 transformUsingAffineTransform:&v25];
  [self canvas].viewScale
  *(float *)&CGFloat v8 = v11;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "info"), "stroke"), "width");
  *(float *)&double v13 = v12;
  LODWORD(v12) = LODWORD(v8);
  id v14 = [v6 aliasedPathWithViewScale:v12 effectiveStrokeWidth:v13];
  id v5 = objc_alloc_init((Class)CAShapeLayer);
  [v5 setPath:[v14 CGPath]];
  [v5 setFillColor:0];
  [v5 setDelegate:[THNoAnimationLayerDelegate sharedInstance]];
  id v15 = objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "info"), "geometry");
  if (v15)
  {
    [v15 transformBasedOnPoint:CGPointZero.x, CGPointZero.y, CGPointZero.x, CGPointZero.y];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
  }
  v20[0] = v21;
  v20[1] = v22;
  v20[2] = v23;
  [v5 setAffineTransform:v20];
  id v16 = [(THWViewportRep *)self canvas];
  objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "geometry"), "size");
  TSDRectWithSize();
  [v16 convertUnscaledToBoundsRect:];
  TSDRoundedRectForMainScreen();
  [v5 setBounds:];
  id v17 = [(THWViewportRep *)self canvas];
  objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "geometry"), "size");
  TSDRectWithSize();
  TSDCenterOfRect();
  [v17 convertUnscaledToBoundsPoint:];
  [v5 setPosition:];
  if (([v4 canApplyToShapeRenderable] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWViewportRep strokeLayerForScrollableCanvasController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Viewport/THWViewportRep.m") lineNumber:660 description:@"don't know how to handle a stroke that can't be applied to a layer"];
  }
  id v18 = +[TSDRenderable renderableFromLayer:v5];
  [self canvas].viewScale;
  [v4 applyToRepRenderable:v18];

  return v5;
}

- (id)maskLayerForScrollableCanvasController:(id)a3
{
  if (objc_msgSend(-[THWViewportRep layout](self, "layout", a3), "isExpanded")) {
    return 0;
  }
  id v5 = [[[[[[self info] backgroundShape] pathSource] bezierPath] copy];
  [self canvas].viewScale
  CGFloat v7 = v6;
  [self canvas].viewScale;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v17.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v17.c = v8;
  *(_OWORD *)&v17.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformScale(&v18, &v17, v7, v9);
  [v5 transformUsingAffineTransform:&v18];
  id v10 = [v5 CGPath];
  [self canvas].viewScale;
  id v11 = [(THWViewportRep *)self canvas];
  objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "geometry"), "size");
  [v11 convertUnscaledToBoundsSize];
  TSDRectWithSize();
  [self info].contentPadding
  double v13 = v12;
  [self canvas].viewScale;
  double v15 = v13 * v14;
  TSDRoundedRectForMainScreen();
  id v4 = -[THWViewportRep p_innerMaskLayerWithBounds:path:fadeSizes:maskGroupVerticalInset:](self, "p_innerMaskLayerWithBounds:path:fadeSizes:maskGroupVerticalInset:", v10, fmax(v15, 0.0));

  return v4;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  [self interactiveCanvasController:a3, a4 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  id v5 = [[self interactiveCanvasController] delegate];
  id v6 = [(THWViewportRep *)self interactiveCanvasController];

  return [v5 interactiveCanvasController:v6 allowsEditMenuForRep:self];
}

- (BOOL)scrollableCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  [self interactiveCanvasController:a3 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  [self interactiveCanvasController].delegate
  long long v8 = (void *)TSUProtocolCast();
  id v9 = [(THWViewportRep *)self interactiveCanvasController];

  return [v8 interactiveCanvasController:v9 shouldBeginEditingTHWPRep:a4 withGesture:a5];
}

- (BOOL)scrollableCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  id v8 = [a4 gestureKind:a3];
  [self interactiveCanvasController].delegate
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v8 == (id)TSWPImmediateSingleTap;
  }
  id v9 = [[self interactiveCanvasController] delegate];
  id v10 = [(THWViewportRep *)self interactiveCanvasController];

  return [v9 interactiveCanvasController:v10 allowsHyperlinkWithGesture:a4 forRep:a5];
}

- (BOOL)allowSelectionPopover
{
  [self interactiveCanvasController].delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  id v3 = [[self interactiveCanvasController] delegate];
  id v4 = [(THWViewportRep *)self interactiveCanvasController];

  return [v3 allowSelectionPopoverForInteractiveCanvasController:v4];
}

- (id)scrollableCanvasController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  [self interactiveCanvasController:a3 delegate];
  id v9 = (void *)TSUProtocolCast();

  return [v9 actionForHyperlink:a4 inRep:a5 gesture:a6];
}

- (id)bookNavigatorForScrollableCanvasController:(id)a3
{
  objc_opt_class();
  [(THWViewportRep *)self interactiveCanvasController];
  id v4 = (void *)TSUDynamicCast();

  return [v4 bookNavigator];
}

- (id)documentNavigatorForScrollableCanvasController:(id)a3
{
  objc_opt_class();
  [(THWViewportRep *)self interactiveCanvasController];
  id v4 = (void *)TSUDynamicCast();

  return [v4 documentNavigator];
}

- (BOOL)isRelatedCanvasScrollingForscrollableCanvasController:(id)a3
{
  id v3 = [(THWViewportRep *)self interactiveCanvasController];

  return [v3 currentlyScrolling];
}

- (void)scrollableCanvasController:(id)a3 customizeLayerHost:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  id v6 = sub_1A06B0;
  CGFloat v7 = &unk_456E38;
  id v8 = a3;
  id v9 = self;
  if (+[NSThread isMainThread])
  {
    v6((uint64_t)v5);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1A0708;
    block[3] = &unk_457868;
    block[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)deferViewCreationForScrollableCanvasController:(id)a3
{
  id v3 = [(THWViewportRep *)self interactiveCanvasController];

  return [v3 currentlyScrolling];
}

- (double)contentsScaleForScrollableCanvasController:(id)a3
{
  id v3 = [self interactiveCanvasController:a3].canvas;

  [v3 contentsScale];
  return result;
}

- (BOOL)scrollableCanvasControllerUseOverlayScrollerOnly:(id)a3
{
  return 1;
}

- (BOOL)centeredInScrollViewForScrollableCanvasController:(id)a3
{
  id v3 = [(THWViewportRep *)self layout];

  return [v3 isExpanded];
}

- (BOOL)maintainScrollOffsetInFrameChangeForScrollableCanvasController:(id)a3
{
  return [[self layout:a3] isExpanded] ^ 1;
}

- (double)scrollableCanvasController:(id)a3 allowsPinchZoomForFrameSize:(CGSize)a4
{
  return [(double)[self layout:a3 width:a4.width height:a4.height] isExpanded];
}

- (BOOL)scrollableCanvasControllerShouldShowScaleFeedback:(id)a3
{
  return 0;
}

- (double)scrollableCanvasController:(id)a3 viewScaleForFrameSize:(CGSize)a4 withScale:(double)a5
{
  double width = a4.width;
  if (objc_msgSend(-[THWViewportRep layout](self, "layout", a3, a4.width, a4.height), "isExpanded"))
  {
    objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "info"), "canvasSize");
    if (width != 0.0 && v8 != 0.0)
    {
      double v9 = width / v8;
      if (v9 <= 1.0) {
        return v9;
      }
      else {
        return 1.0;
      }
    }
  }
  return a5;
}

- (double)scrollableCanvasController:(id)a3 minViewScaleForFrameSize:(CGSize)a4
{
  -[THWViewportRep scrollableCanvasController:viewScaleForFrameSize:withScale:](self, "scrollableCanvasController:viewScaleForFrameSize:withScale:", a3, a4.width, a4.height, 1.0);
  return result;
}

- (double)scrollableCanvasController:(id)a3 maxViewScaleForFrameSize:(CGSize)a4
{
  unsigned int v4 = [self layout:a3 width:a4.width height:a4.height].isExpanded;
  double result = 1.0;
  if (v4) {
    return 2.0;
  }
  return result;
}

- (BOOL)canExpand
{
  return 0;
}

- (BOOL)expandedShouldDismissOnChangeFromSizeClassPairWithController:(id)a3 flowMode:(BOOL)a4
{
  objc_opt_class();
  unsigned int v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    id v5 = v4;
    id v6 = (char *)objc_msgSend(objc_msgSend(v4, "traitCollection"), "horizontalSizeClass");
    CGFloat v7 = [(char *)[v5 traitCollection] verticalSizeClass];
    LOBYTE(v4) = v6 != (unsigned char *)&dword_0 + 1 && v7 != (unsigned char *)&dword_0 + 1;
  }
  return (char)v4;
}

- (id)p_innerMaskLayerWithBounds:(CGRect)a3 path:(CGPath *)a4 fadeSizes:(UIEdgeInsets)a5 maskGroupVerticalInset:(double)a6
{
  double rect_8 = a5.bottom;
  double rect_16 = a3.size.width;
  double top = a5.top;
  double rect_24 = a3.size.height;
  double x = a3.origin.x;
  double y = a3.origin.y;
  CGPathGetBoundingBox(a4);
  TSDRoundedRectForMainScreen();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  id v16 = (CGContext *)TSUCreateRGBABitmapContext();
  CGAffineTransform v17 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.0) CGColor], [+[TSUColor colorWithWhite:0.0 alpha:1.0] CGColor], 0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v19 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v17, 0);
  CGContextAddPath(v16, a4);
  CGContextClip(v16);
  v38.origin.double x = v9;
  v38.origin.double y = v11;
  v38.size.double width = v13;
  v38.size.double height = v15;
  CGFloat MinY = CGRectGetMinY(v38);
  v39.origin.double x = v9;
  v39.origin.double y = v11;
  v39.size.double width = v13;
  v39.size.double height = v15;
  v36.double y = top + CGRectGetMinY(v39);
  v34.double x = 0.0;
  v36.double x = 0.0;
  v34.double y = MinY;
  CGContextDrawLinearGradient(v16, v19, v34, v36, 0);
  v40.origin.double x = v9;
  v40.origin.double y = v11;
  v40.size.double width = v13;
  v40.size.double height = v15;
  CGFloat MaxY = CGRectGetMaxY(v40);
  v41.origin.double x = v9;
  v41.origin.double y = v11;
  v41.size.double width = v13;
  v41.size.double height = v15;
  v37.double y = CGRectGetMaxY(v41) - rect_8;
  v35.double x = 0.0;
  v37.double x = 0.0;
  v35.double y = MaxY;
  CGContextDrawLinearGradient(v16, v19, v35, v37, 0);
  CGContextSetRGBFillColor(v16, 0.0, 0.0, 0.0, 1.0);
  v42.origin.double x = v9;
  v42.origin.double y = v11;
  v42.size.double width = v13;
  v42.size.double height = v15;
  CGFloat rect = CGRectGetMinX(v42);
  v43.origin.double x = v9;
  v43.origin.double y = v11;
  v43.size.double width = v13;
  v43.size.double height = v15;
  CGFloat v22 = top + CGRectGetMinY(v43);
  v44.origin.double x = v9;
  v44.origin.double y = v11;
  v44.size.double width = v13;
  v44.size.double height = v15;
  CGFloat Width = CGRectGetWidth(v44);
  v45.origin.double x = v9;
  v45.origin.double y = v11;
  v45.size.double width = v13;
  v45.size.double height = v15;
  v46.size.double height = CGRectGetHeight(v45) - top - rect_8;
  v46.origin.double x = rect;
  v46.origin.double y = v22;
  v46.size.double width = Width;
  CGContextFillRect(v16, v46);
  CGGradientRelease(v19);
  CGColorSpaceRelease(DeviceRGB);
  Image = CGBitmapContextCreateImage(v16);
  CGContextRelease(v16);
  id v25 = objc_alloc_init((Class)CALayer);
  [v25 setFrame:x, y, rect_16, rect_24];
  [v25 setContents:Image];
  CGImageRelease(Image);

  return v25;
}

- (id)p_outerMaskLayerWithFrame:(CGRect)a3 path:(CGPath *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = objc_alloc_init((Class)CAShapeLayer);
  [v9 setFrame:x, y, width, height];
  [v9 setPath:a4];

  return v9;
}

- (NSArray)childReps
{
  return self->childReps;
}

- (void)setChildReps:(id)a3
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

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
}

- (THWScrollableCanvasController)scrollableCanvasController
{
  return self->_scrollableCanvasController;
}

- (void)setScrollableCanvasController:(id)a3
{
}

- (void)setPressableHandler:(id)a3
{
}

@end