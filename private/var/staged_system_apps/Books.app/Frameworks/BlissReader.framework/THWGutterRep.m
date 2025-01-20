@interface THWGutterRep
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldHitTestChildImageRep:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (CALayer)pressableAnimationLayer;
- (CALayer)pressableAnimationShadowLayer;
- (CGAffineTransform)freeTransform;
- (CGRect)frameForPopupInUnscaledCanvas;
- (THAnimationController)animationController;
- (THWGutterRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (id)expandedContentDrawableToPresent;
- (id)infoForPressable;
- (id)shadowAnimationLayer;
- (int)pressableAction;
- (void)animationControllerDidPresent:(id)a3;
- (void)dealloc;
- (void)setHandlingPress:(BOOL)a3;
- (void)setPressableHandler:(id)a3;
@end

@implementation THWGutterRep

- (THWGutterRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THWGutterRep;
  v4 = [(THWGutterRep *)&v6 initWithLayout:a3 canvas:a4];
  if (v4)
  {
    objc_opt_class();
    [(THWGutterRep *)v4 interactiveCanvasController];
    -[THWGutterRep setPressableHandler:](v4, "setPressableHandler:", -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", v4, [(id)TSUDynamicCast() pressHandlerForPressableReps]));
  }
  return v4;
}

- (void)dealloc
{
  self->mAnimationController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWGutterRep;
  [(THWGutterRep *)&v3 dealloc];
}

- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4
{
  objc_super v6 = [(THWGutterRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v6 canHandleGesture:a3 forChildRep:a4];
}

- (CALayer)pressableAnimationLayer
{
  id v3 = [(THWGutterRep *)self interactiveCanvasController];
  id v4 = objc_msgSend(-[THWGutterRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWGutterRep info](self, "info"), "stageInfo"));

  return (CALayer *)[v3 layerForRep:v4];
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (id)infoForPressable
{
  id v2 = [(THWGutterRep *)self info];

  return [v2 associatedInfo];
}

- (int)pressableAction
{
  v3.receiver = self;
  v3.super_class = (Class)THWGutterRep;
  return [(THWGutterRep *)&v3 pressableAction];
}

- (BOOL)wantsPressAnimation
{
  if (objc_msgSend(objc_msgSend(-[THWGutterRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWGutterRep info](self, "info"), "stageInfo")), "allowsAction:", -[THWGutterRep pressableAction](self, "pressableAction")))return 1; {
  if ([(THWGutterRep *)self pressableAction] != 1)
  }
    return 0;
  [(THWGutterRep *)self infoForPressable];
  return [(id)TSUProtocolCast() popUpInfo] != 0;
}

- (BOOL)wantsPressAction
{
  if (objc_msgSend(objc_msgSend(-[THWGutterRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWGutterRep info](self, "info"), "stageInfo")), "allowsAction:", -[THWGutterRep pressableAction](self, "pressableAction")))return 1; {
  if ([(THWGutterRep *)self pressableAction] != 1)
  }
    return 0;
  [(THWGutterRep *)self infoForPressable];
  return [(id)TSUProtocolCast() popUpInfo] != 0;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  id v5 = [a3 info];
  if (v5 == objc_msgSend(-[THWGutterRep info](self, "info"), "stageInfo")) {
    return 1;
  }
  id v6 = [a3 info];
  return v6 == [self info].backgroundShape;
}

- (BOOL)shouldHitTestChildImageRep:(id)a3
{
  return 1;
}

- (CGRect)frameForPopupInUnscaledCanvas
{
  id v2 = [[self interactiveCanvasController] layoutForInfo:[self info].stageInfo];

  [v2 frameInRoot];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return [a3 targetLayer] != 0;
}

- (id)shadowAnimationLayer
{
  return 0;
}

- (CGAffineTransform)freeTransform
{
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return [a3 targetLayer] != 0;
}

- (id)expandedContentDrawableToPresent
{
  id v2 = [self info].expandedDrawableToPresent;
  objc_opt_class();
  long long v3 = (void *)TSUDynamicCast();
  if (!v3)
  {
    double v6 = (void *)TSUProtocolCast();
    if (!v6) {
      return v2;
    }
    goto LABEL_5;
  }
  double v4 = v3;
  [v3 stageDrawable];
  double v5 = (void *)TSUProtocolCast();
  if ([v5 popUpInfo])
  {
    double v6 = v5;
LABEL_5:
    if ([v6 popUpInfo])
    {
      return (id)TSUProtocolCast();
    }
    return v2;
  }
  if ([v4 expandedStageDrawable]) {
    id v8 = [v4 expandedStageDrawable];
  }
  else {
    id v8 = [v4 stageDrawable];
  }
  id v9 = [v8 repClass];
  if (![v9 conformsToProtocol:&OBJC_PROTOCOL___THWExpandedRep]
    || (objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v9, "expandedAllowsPresentationInExpandedForInfo:isReflowablePresentation:", objc_msgSend(v4, "expandedStageDrawable"), 0))
  {
    return v4;
  }
  if ([v4 expandedStageDrawable])
  {
    return [v4 expandedStageDrawable];
  }
  else
  {
    return [v4 stageDrawable];
  }
}

- (BOOL)canHandleGesture:(id)a3
{
  double v4 = [(THWGutterRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v4 canHandleGesture:a3];
}

- (BOOL)handleGesture:(id)a3
{
  double v4 = [(THWGutterRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v4 handleGesture:a3];
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 1;
}

- (THAnimationController)animationController
{
  CGRect result = self->mAnimationController;
  if (!result)
  {
    double v4 = objc_alloc_init(THAnimationController);
    self->mAnimationController = v4;
    [(THAnimationController *)v4 addObserver:self];
    [(THAnimationController *)self->mAnimationController setSource:self];
    return self->mAnimationController;
  }
  return result;
}

- (void)animationControllerDidPresent:(id)a3
{
  self->mAnimationController = 0;
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (void)setPressableHandler:(id)a3
{
}

@end