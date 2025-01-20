@interface THWPressableRepGestureTargetHandler
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4;
- (BOOL)enabledOnlyIfWidgetInteractionDisabledOnPage;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlePressOnDoubleTap;
- (BOOL)isPressableAtPoint;
- (BOOL)isPressed;
- (BOOL)p_gestureIsHandleable:(id)a3;
- (BOOL)p_isGestureWithinPressableBounds:(id)a3;
- (BOOL)p_isPageInteractionMode;
- (BOOL)widgetInteractionAllowAutoplay;
- (BOOL)widgetInteractionDisabledOnPage;
- (BOOL)widgetInteractionEnabled;
- (CGPoint)pressPoint;
- (CGPoint)shadowPressPoint;
- (THWPressableRep)pressableRep;
- (THWPressableRepGestureTargetHandler)initWithPressableRep:(id)a3 pressHandler:(id)a4;
- (THWPressableRepPressHandler)pressHandler;
- (void)dealloc;
- (void)p_invokeAction;
- (void)p_pressInAnimationWithCompletionBlock:(id)a3;
- (void)p_recoilAnimationWithCompletionBlock:(id)a3;
- (void)p_relaxAnimationWithCompletionBlock:(id)a3;
- (void)p_updateAnimation:(id)a3;
- (void)setEnabledOnlyIfWidgetInteractionDisabledOnPage:(BOOL)a3;
- (void)setHandlePressOnDoubleTap:(BOOL)a3;
- (void)setIsPressableAtPoint:(BOOL)a3;
- (void)setPressHandler:(id)a3;
- (void)setPressPoint:(CGPoint)a3;
- (void)setPressableRep:(id)a3;
- (void)setShadowPressPoint:(CGPoint)a3;
- (void)spoofGesture;
@end

@implementation THWPressableRepGestureTargetHandler

- (THWPressableRepGestureTargetHandler)initWithPressableRep:(id)a3 pressHandler:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THWPressableRepGestureTargetHandler;
  v6 = [(THWPressableRepGestureTargetHandler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(THWPressableRepGestureTargetHandler *)v6 setPressableRep:a3];
    [(THWPressableRepGestureTargetHandler *)v7 setPressHandler:a4];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWPressableRepGestureTargetHandler;
  [(THWPressableRepGestureTargetHandler *)&v3 dealloc];
}

- (BOOL)widgetInteractionDisabledOnPage
{
  id v3 = [[-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep") interactiveCanvasController] widgetHost];
  if (v3) {
    LOBYTE(v3) = [v3 widgetHostingAllowInteractionOnPageForRep:[self pressableRep]] ^ 1;
  }
  return (char)v3;
}

- (BOOL)widgetInteractionAllowAutoplay
{
  id v3 = [(-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "interactiveCanvasController") widgetHost];
  if (!v3) {
    return 1;
  }
  v4 = v3;
  v5 = [(THWPressableRepGestureTargetHandler *)self pressableRep];

  return [v4 widgetHostingAllowAutoplayForRep:v5];
}

- (void)p_pressInAnimationWithCompletionBlock:(id)a3
{
  if ([[(THWPressableRepGestureTargetHandler *)self pressableRep] wantsPressAnimation])
  {
    id v5 = [[(THWPressableRepGestureTargetHandler *)self pressableRep] pressableAnimationLayer];
    id v6 = [[(THWPressableRepGestureTargetHandler *)self pressableRep] pressableAnimationShadowLayer];
    id v7 = [v5 superlayer];
    [v5 bounds];
    TSDCenterOfRect();
    [v7 convertPoint:v5 fromLayer:];
    -[THWPressableRepGestureTargetHandler setPressPoint:](self, "setPressPoint:");
    id v8 = [v6 superlayer];
    [v6 bounds];
    TSDCenterOfRect();
    [v8 convertPoint:v6 fromLayer:];
    -[THWPressableRepGestureTargetHandler setShadowPressPoint:](self, "setShadowPressPoint:");
    +[CATransaction begin];
    +[CATransaction setCompletionBlock:a3];
    [(THWPressableRepGestureTargetHandler *)self pressPoint];
    [v5 addPressAnimationFromPoint:scale:];
    [(THWPressableRepGestureTargetHandler *)self shadowPressPoint];
    [v6 addPressAnimationFromPoint:scale:];
    +[CATransaction commit];
  }
  else if (a3)
  {
    objc_super v9 = (void (*)(id))*((void *)a3 + 2);
    v9(a3);
  }
}

- (void)p_recoilAnimationWithCompletionBlock:(id)a3
{
  if ([[(THWPressableRepGestureTargetHandler *)self pressableRep] wantsPressAnimation])
  {
    +[CATransaction begin];
    +[CATransaction setCompletionBlock:a3];
    id v5 = [[(THWPressableRepGestureTargetHandler *)self pressableRep] pressableAnimationLayer];
    [(THWPressableRepGestureTargetHandler *)self pressPoint];
    [v5 addRecoilAnimationFromPoint:0];
    id v6 = [[(THWPressableRepGestureTargetHandler *)self pressableRep] pressableAnimationShadowLayer];
    [(THWPressableRepGestureTargetHandler *)self shadowPressPoint];
    [v6 addRecoilAnimationFromPoint:0];
    +[CATransaction commit];
  }
  else if (a3)
  {
    id v7 = (void (*)(id))*((void *)a3 + 2);
    v7(a3);
  }
}

- (void)p_invokeAction
{
  if ([[(THWPressableRepGestureTargetHandler *)self pressableRep] wantsPressAction])
  {
    id v3 = [(THWPressableRepGestureTargetHandler *)self pressHandler];
    v4 = [(THWPressableRepGestureTargetHandler *)self pressableRep];
    [(THWPressableRepGestureTargetHandler *)self pressPoint];
    -[THWPressableRepPressHandler pressableRepWasPressed:atPoint:](v3, "pressableRepWasPressed:atPoint:", v4);
  }
}

- (void)p_relaxAnimationWithCompletionBlock:(id)a3
{
  if ([[(THWPressableRepGestureTargetHandler *)self pressableRep] wantsPressAnimation])
  {
    +[CATransaction begin];
    if (a3) {
      +[CATransaction setCompletionBlock:a3];
    }
    id v5 = [[(THWPressableRepGestureTargetHandler *)self pressableRep] pressableAnimationLayer];
    [(THWPressableRepGestureTargetHandler *)self pressPoint];
    [v5 addRelaxAnimationFromPoint:];
    id v6 = [[(THWPressableRepGestureTargetHandler *)self pressableRep] pressableAnimationShadowLayer];
    [(THWPressableRepGestureTargetHandler *)self shadowPressPoint];
    [v6 addRelaxAnimationFromPoint:];
    +[CATransaction commit];
  }
  else if (a3)
  {
    id v7 = (void (*)(id))*((void *)a3 + 2);
    v7(a3);
  }
}

- (void)p_updateAnimation:(id)a3
{
  unsigned int v4 = [(THWPressableRepGestureTargetHandler *)self p_isGestureWithinPressableBounds:a3];
  uint64_t v5 = ![(THWPressableRepGestureTargetHandler *)self isPressableAtPoint] | v4;
  if (v5)
  {
    if ([(THWPressableRepGestureTargetHandler *)self isPressableAtPoint] || ((v4 ^ 1) & 1) != 0) {
      return;
    }
    [(THWPressableRepGestureTargetHandler *)self p_pressInAnimationWithCompletionBlock:&stru_459F98];
  }
  else
  {
    [(THWPressableRepGestureTargetHandler *)self p_relaxAnimationWithCompletionBlock:0];
  }

  [(THWPressableRepGestureTargetHandler *)self setIsPressableAtPoint:v5];
}

- (BOOL)p_isPageInteractionMode
{
  return [[(THWPressableRepGestureTargetHandler *)self pressableRep] widgetInteractionMode] == 0;
}

- (BOOL)widgetInteractionEnabled
{
  if ([(THWPressableRepGestureTargetHandler *)self p_isPageInteractionMode]) {
    return ![(THWPressableRepGestureTargetHandler *)self widgetInteractionDisabledOnPage];
  }
  else {
    return 1;
  }
}

- (BOOL)p_isGestureWithinPressableBounds:(id)a3
{
  p_pressableRep = &self->_pressableRep;
  objc_loadWeak((id *)&self->_pressableRep);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  [objc_loadWeak((id *)p_pressableRep) pressableNaturalBounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [a3 naturalLocationForRep:objc_loadWeak((id *)p_pressableRep)];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v17 = v6;
  uint64_t v18 = v8;
  uint64_t v19 = v10;
  uint64_t v20 = v12;

  return CGRectContainsPoint(*(CGRect *)&v17, *(CGPoint *)&v14);
}

- (BOOL)p_gestureIsHandleable:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)self handlePressOnDoubleTap])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [a3 gestureKind];
    BOOL v5 = v6 == (id)TSWPImmediatePress;
  }
  if ([(THWPressableRepGestureTargetHandler *)self handlePressOnDoubleTap])
  {
    id v7 = [a3 gestureKind];
    BOOL v8 = v7 == (id)TSWPImmediateDoubleTap;
  }
  else
  {
    BOOL v8 = 0;
  }
  return v5 || v8;
}

- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4
{
  if (!-[THWPressableRepGestureTargetHandler p_gestureIsHandleable:](self, "p_gestureIsHandleable:")
    || ![(THWPressableRepGestureTargetHandler *)self p_isGestureWithinPressableBounds:a3])
  {
    return 0;
  }
  id v7 = [(THWPressableRepGestureTargetHandler *)self pressableRep];

  return [(THWPressableRep *)v7 shouldRecognizePressOnRep:a4];
}

- (BOOL)canHandleGesture:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)self p_isPageInteractionMode]
    && [(THWPressableRepGestureTargetHandler *)self enabledOnlyIfWidgetInteractionDisabledOnPage]&& ![(THWPressableRepGestureTargetHandler *)self widgetInteractionDisabledOnPage])
  {
    return 0;
  }
  if (![(THWPressableRepGestureTargetHandler *)self p_gestureIsHandleable:a3]) {
    return 0;
  }
  if (![(THWPressableRepGestureTargetHandler *)self p_isGestureWithinPressableBounds:a3])return 0; {
  if (![[(THWPressableRepGestureTargetHandler *)self pressableRep] wantsPressAction])return 0;
  }
  [a3 naturalLocationForRep:[self pressableRep]];
  id v7 = -[THWPressableRep hitRep:]([(THWPressableRepGestureTargetHandler *)self pressableRep], "hitRep:", v5, v6);
  if (!v7) {
    return 0;
  }
  id v8 = v7;
  uint64_t v9 = [(THWPressableRepGestureTargetHandler *)self pressableRep];

  return [(THWPressableRep *)v9 shouldRecognizePressOnRep:v8];
}

- (BOOL)handleGesture:(id)a3
{
  BOOL v5 = -[THWPressableRepGestureTargetHandler p_gestureIsHandleable:](self, "p_gestureIsHandleable:");
  if (v5)
  {
    objc_opt_class();
    double v6 = (void *)TSUDynamicCast();
    if (objc_msgSend(objc_msgSend(v6, "view"), "isAncestorScrollViewDragging")) {
      [v6 cancel];
    }
    switch([a3 gestureState])
    {
      case 1u:
        self->_isPressed = 1;
        [(THWPressableRepGestureTargetHandler *)self setIsPressableAtPoint:1];
        [[(THWPressableRepGestureTargetHandler *)self pressableRep] setHandlingPress:1];
        [(THWPressableRepGestureTargetHandler *)self p_pressInAnimationWithCompletionBlock:&stru_459FB8];
        break;
      case 2u:
        [(THWPressableRepGestureTargetHandler *)self p_updateAnimation:a3];
        break;
      case 3u:
        if (([(THWPressableRepGestureTargetHandler *)self handlePressOnDoubleTap]
           || ![(THWPressableRepGestureTargetHandler *)self isPressableAtPoint])
          && ![(THWPressableRepGestureTargetHandler *)self handlePressOnDoubleTap])
        {
          goto LABEL_5;
        }
        [(THWPressableRepGestureTargetHandler *)self pressableRep];
        if ((objc_opt_respondsToSelector() & 1) != 0
          && [[(THWPressableRepGestureTargetHandler *)self pressableRep] wantsRecoilAnimation])
        {
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1651C8;
          v15[3] = &unk_456DE0;
          v15[4] = self;
          [(THWPressableRepGestureTargetHandler *)self p_recoilAnimationWithCompletionBlock:v15];
          goto LABEL_7;
        }
        uint64_t v10 = _NSConcreteStackBlock;
        uint64_t v11 = 3221225472;
        uint64_t v12 = sub_165218;
        uint64_t v13 = &unk_456DE0;
        uint64_t v14 = self;
        id v8 = &v10;
        id v7 = self;
        goto LABEL_6;
      case 4u:
      case 5u:
LABEL_5:
        [[(THWPressableRepGestureTargetHandler *)self pressableRep] setHandlingPress:0];
        id v7 = self;
        id v8 = 0;
LABEL_6:
        -[THWPressableRepGestureTargetHandler p_relaxAnimationWithCompletionBlock:](v7, "p_relaxAnimationWithCompletionBlock:", v8, v10, v11, v12, v13, v14);
LABEL_7:
        self->_isPressed = 0;
        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (void)spoofGesture
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1652D4;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  [(THWPressableRepGestureTargetHandler *)self p_pressInAnimationWithCompletionBlock:v2];
}

- (BOOL)handlePressOnDoubleTap
{
  return self->_handlePressOnDoubleTap;
}

- (void)setHandlePressOnDoubleTap:(BOOL)a3
{
  self->_handlePressOnDoubleTap = a3;
}

- (BOOL)isPressed
{
  return self->_isPressed;
}

- (BOOL)isPressableAtPoint
{
  return self->_isPressableAtPoint;
}

- (void)setIsPressableAtPoint:(BOOL)a3
{
  self->_isPressableAtPoint = a3;
}

- (BOOL)enabledOnlyIfWidgetInteractionDisabledOnPage
{
  return self->_enabledOnlyIfWidgetInteractionDisabledOnPage;
}

- (void)setEnabledOnlyIfWidgetInteractionDisabledOnPage:(BOOL)a3
{
  self->_enabledOnlyIfWidgetInteractionDisabledOnPage = a3;
}

- (THWPressableRep)pressableRep
{
  return (THWPressableRep *)objc_loadWeak((id *)&self->_pressableRep);
}

- (void)setPressableRep:(id)a3
{
}

- (THWPressableRepPressHandler)pressHandler
{
  return self->_pressHandler;
}

- (void)setPressHandler:(id)a3
{
}

- (CGPoint)pressPoint
{
  double x = self->_pressPoint.x;
  double y = self->_pressPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPressPoint:(CGPoint)a3
{
  self->_pressPoint = a3;
}

- (CGPoint)shadowPressPoint
{
  double x = self->_shadowPressPoint.x;
  double y = self->_shadowPressPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setShadowPressPoint:(CGPoint)a3
{
  self->_shadowPressPoint = a3;
}

- (void).cxx_destruct
{
}

@end