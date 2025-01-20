@interface THWFreeTransformableRepGestureTargetHandler
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)freeTransformControllerShouldAllowPinchDown:(id)a3;
- (BOOL)freeTransformControllerShouldAllowPinchUp:(id)a3;
- (BOOL)freeTransformControllerShouldBegin:(id)a3;
- (BOOL)freeTransformControllerShouldDelayRecognizeUntilScaleChange:(id)a3;
- (BOOL)freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:(id)a3;
- (BOOL)freeTransformControllerShouldUpdateAngleAfterBegin:(id)a3;
- (BOOL)freeTransformControllerShouldUsedTracedShadowPath:(id)a3;
- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3;
- (BOOL)freeTransformControllerWantsShadow:(id)a3;
- (BOOL)handleGesture:(id)a3;
- (BOOL)interactionEnabled;
- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3;
- (CGSize)curtainSizeForFreeTransformController:(id)a3;
- (THWFreeTransformController)ftc;
- (THWFreeTransformableRep)rep;
- (THWFreeTransformableRepGestureTargetHandler)initWithFreeTransformableRep:(id)a3 handler:(id)a4;
- (THWFreeTransformableRepHandler)handler;
- (id)curtainColorForFreeTransformController:(id)a3;
- (id)freeTransformControllerStyledRep:(id)a3;
- (id)shadowPathForFreeTransformController:(id)a3;
- (id)unmovingParentViewForFreeTransformController:(id)a3;
- (void)freeTransformControllerDidBegin:(id)a3;
- (void)freeTransformControllerDidEnd:(id)a3 passedThreshold:(BOOL)a4;
- (void)freeTransformControllerDidFinishFreeTransforming:(id)a3 passedThreshold:(BOOL)a4 completionBlock:(id)a5;
- (void)freeTransformControllerWillFadeOutCurtain:(id)a3;
- (void)freeTransformControllerWillMoveTargetLayer:(id)a3;
- (void)p_cleanupAfterFreeTransform;
- (void)p_setupFreeTransformControllerWithGesture:(id)a3;
- (void)setHandler:(id)a3;
- (void)setRep:(id)a3;
- (void)willBeginHandlingGesture:(id)a3;
@end

@implementation THWFreeTransformableRepGestureTargetHandler

- (THWFreeTransformableRepGestureTargetHandler)initWithFreeTransformableRep:(id)a3 handler:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THWFreeTransformableRepGestureTargetHandler;
  v6 = [(THWFreeTransformableRepGestureTargetHandler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(THWFreeTransformableRepGestureTargetHandler *)v6 setRep:a3];
    [(THWFreeTransformableRepGestureTargetHandler *)v7 setHandler:a4];
  }
  return v7;
}

- (BOOL)interactionEnabled
{
  [(THWFreeTransformableRepGestureTargetHandler *)self rep];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([[(THWFreeTransformableRepGestureTargetHandler *)self rep] freeTransformInteractionEnabledOverride] & 1) != 0)
  {
    return 1;
  }
  objc_opt_class();
  [[(THWFreeTransformableRepGestureTargetHandler *)self rep] interactiveCanvasController];
  v3 = (void *)TSUDynamicCast();
  if (!v3) {
    return 1;
  }
  v4 = v3;
  if ([v3 isCompactWidth]) {
    return 0;
  }
  else {
    return [v4 isCompactHeight] ^ 1;
  }
}

- (THWFreeTransformController)ftc
{
  v2 = (THWFreeTransformController *)[(THWFreeTransformableRepHandler *)[(THWFreeTransformableRepGestureTargetHandler *)self handler] freeTransformController];
  if (!v2) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler ftc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m") lineNumber:86 description:@"invalid nil value for '%s'", "ftc"];
  }
  return v2;
}

- (void)p_setupFreeTransformControllerWithGesture:(id)a3
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)self ftc] delegate] != (THWFreeTransformControllerDelegate *)self)
  {
    id v5 = [a3 freeTransformDelegate];
    if (v5 != [THWFreeTransformableRepHandler freeTransformController][self handler].freeTransformController) {
    if (objc_msgSend(-[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"), "delegate"))
    }
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler p_setupFreeTransformControllerWithGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m") lineNumber:96 description:@"Free transformer not cleaned up on previous transform"];
    }
    if (objc_msgSend(-[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"), "targetLayer"))
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler p_setupFreeTransformControllerWithGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m") lineNumber:97 description:@"Free transformer not cleaned up on previous transform"];
    }
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)self ftc] setDelegate:self];
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)self ftc] setTransformGR:a3];
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)self ftc] setTargetLayer:[[(THWFreeTransformableRepGestureTargetHandler *)self rep] transformLayer]];
    double v6 = 0.75;
    if (([[(THWFreeTransformableRepGestureTargetHandler *)self rep] isExpanded] & 1) == 0)
    {
      if ([[(THWFreeTransformableRepGestureTargetHandler *)self rep] meetsStageDimensionRequirementForExpanded])double v6 = 1.25; {
      else
      }
        double v6 = INFINITY;
    }
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)self ftc] setScaleThreshold:v6];
    if ([[(THWFreeTransformableRepGestureTargetHandler *)self rep] isExpanded])uint64_t v7 = 0; {
    else
    }
      uint64_t v7 = [[(THWFreeTransformableRepGestureTargetHandler *)self rep] meetsStageDimensionRequirementForExpanded] ^ 1;
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)self ftc] setBounceUpOnly:v7];
    id v8 = [[(THWFreeTransformableRepGestureTargetHandler *)self rep] transformLayer];
    if (v8)
    {
      objc_super v9 = v8;
      id v10 = [(THWFreeTransformableRepHandler *)[(THWFreeTransformableRepGestureTargetHandler *)self handler] hostCanvasLayer];
      [v9 frame];
      objc_msgSend(v10, "convertRect:fromLayer:", objc_msgSend(v9, "superlayer"), v11, v12, v13, v14);
      [a3 recenterOnTargetWithRectInView:];
    }
  }
}

- (void)p_cleanupAfterFreeTransform
{
  [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)self ftc] setDelegate:0];
  [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)self ftc] setTargetLayer:0];
  v3 = [(THWFreeTransformableRepGestureTargetHandler *)self ftc];

  [(THWFreeTransformController *)v3 setTransformGR:0];
}

- (BOOL)freeTransformControllerShouldBegin:(id)a3
{
  return 1;
}

- (void)freeTransformControllerWillFadeOutCurtain:(id)a3
{
  [(THWFreeTransformableRepGestureTargetHandler *)self handler];
  if (objc_opt_respondsToSelector())
  {
    v4 = [(THWFreeTransformableRepGestureTargetHandler *)self handler];
    id v5 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];
    double v6 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];
    [(THWFreeTransformableRepHandler *)v4 freeTransformWillFadeOutCurtain:v5 expandableRep:v6];
  }
}

- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3
{
  v3 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];

  return [(THWFreeTransformableRep *)v3 isExpanded];
}

- (id)curtainColorForFreeTransformController:(id)a3
{
  v3 = [(THWFreeTransformableRepGestureTargetHandler *)self handler];

  return [(THWFreeTransformableRepHandler *)v3 curtainColorForFreeTransform];
}

- (CGSize)curtainSizeForFreeTransformController:(id)a3
{
  CGFloat width = CGSizeZero.width;
  CGFloat height = CGSizeZero.height;
  if (-[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "isExpanded")&& objc_msgSend(-[THWFreeTransformableRepHandler hostCanvasLayer](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "hostCanvasLayer"), "superlayer"))
  {
    [[[self handler] hostCanvasLayer] superlayer].frame
    CGFloat width = v6;
    CGFloat height = v7;
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)freeTransformControllerDidBegin:(id)a3
{
  v4 = [(THWFreeTransformableRepGestureTargetHandler *)self handler];
  id v5 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];
  double v6 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];

  [(THWFreeTransformableRepHandler *)v4 freeTransformDidBeginWithRep:v5 expandableRep:v6];
}

- (BOOL)freeTransformControllerShouldUpdateAngleAfterBegin:(id)a3
{
  v3 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];

  return [(THWFreeTransformableRep *)v3 isExpanded];
}

- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3
{
  v4 = [(THWFreeTransformableRepGestureTargetHandler *)self handler];
  id v5 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];

  [(THWFreeTransformableRepHandler *)v4 rectForCompletionAnimationWithRep:v5];
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)freeTransformControllerDidEnd:(id)a3 passedThreshold:(BOOL)a4
{
  BOOL v4 = a4;
  [[(THWFreeTransformableRepGestureTargetHandler *)self rep] freeTransformDidEnd];
  [(THWFreeTransformableRepGestureTargetHandler *)self rep];
  if (objc_opt_respondsToSelector()) {
    [[(THWFreeTransformableRepGestureTargetHandler *)self rep] freeTransformDidEndPassedThreshold:v4];
  }

  [(THWFreeTransformableRepGestureTargetHandler *)self p_cleanupAfterFreeTransform];
}

- (id)unmovingParentViewForFreeTransformController:(id)a3
{
  id v3 = [[(THWFreeTransformableRepGestureTargetHandler *)self rep] interactiveCanvasController];

  return [v3 canvasView];
}

- (void)freeTransformControllerDidFinishFreeTransforming:(id)a3 passedThreshold:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  double v9 = [(THWFreeTransformableRepGestureTargetHandler *)self handler];
  id v10 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];
  double v11 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];
  if (v6)
  {
    [(THWFreeTransformableRepHandler *)v9 freeTransformDidEndWithRep:v10 expandableRep:v11 completionBlock:a5];
  }
  else
  {
    [(THWFreeTransformableRepHandler *)v9 freeTransformDidCancelWithRep:v10 expandableRep:v11];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    double v14 = sub_18D138;
    v15 = &unk_456E88;
    v16 = self;
    id v17 = a5;
    if (objc_msgSend(objc_msgSend(a3, "transformGR"), "state") == &dword_4)
    {
      v14((uint64_t)v13);
    }
    else
    {
      if (!-[THWFreeTransformableRep animationController](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "animationController")){
      id v12 = [[(THWFreeTransformableRepGestureTargetHandler *)self rep] animationController];
      }
      [v12 setSource:[self rep]];
      [v12 setDestination:[self rep]];
      objc_msgSend(v12, "setHostLayer:", objc_msgSend(objc_msgSend(-[THWFreeTransformableRep interactiveCanvasController](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "interactiveCanvasController"), "layerHost"), "canvasLayer"));
      [v12 presentAnimationWithCompletionBlock:v13 overshoot:[-[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "isExpanded")]];
    }
  }
}

- (BOOL)freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:(id)a3
{
  [(THWFreeTransformableRepGestureTargetHandler *)self rep];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  BOOL v4 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];

  return [(THWFreeTransformableRep *)v4 freeTransformShouldMoveAboveStatusBar];
}

- (id)freeTransformControllerStyledRep:(id)a3
{
  [(THWFreeTransformableRepGestureTargetHandler *)self rep];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  BOOL v4 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];

  return [(THWFreeTransformableRep *)v4 styledRep];
}

- (void)freeTransformControllerWillMoveTargetLayer:(id)a3
{
  [(THWFreeTransformableRepGestureTargetHandler *)self rep];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];
    [(THWFreeTransformableRep *)v5 freeTransformWillMoveTargetLayer:a3];
  }
}

- (id)shadowPathForFreeTransformController:(id)a3
{
  id v3 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];

  return [(THWFreeTransformableRep *)v3 shadowPath];
}

- (BOOL)freeTransformControllerShouldUsedTracedShadowPath:(id)a3
{
  id v3 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];

  return [(THWFreeTransformableRep *)v3 freeTransformUseTracedShadowPath];
}

- (BOOL)freeTransformControllerWantsShadow:(id)a3
{
  [(THWFreeTransformableRepGestureTargetHandler *)self rep];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  BOOL v4 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];

  return [(THWFreeTransformableRep *)v4 freeTransformWantsShadow];
}

- (BOOL)freeTransformControllerShouldDelayRecognizeUntilScaleChange:(id)a3
{
  return 1;
}

- (BOOL)freeTransformControllerShouldAllowPinchDown:(id)a3
{
  id v4 = [(THWFreeTransformableRepHandler *)[(THWFreeTransformableRepGestureTargetHandler *)self handler] hostCanvasLayer];
  unsigned int v5 = [[(THWFreeTransformableRepGestureTargetHandler *)self rep] isExpanded];
  if (v5)
  {
    if ([v4 allowsPinchZoom])
    {
      [v4 viewScale];
      double v7 = v6;
      [v4 minimumPinchViewScale];
      LOBYTE(v5) = vabdd_f64(v7, v8) < 0.00999999978;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)freeTransformControllerShouldAllowPinchUp:(id)a3
{
  return [[(THWFreeTransformableRepGestureTargetHandler *)self rep] isExpanded] ^ 1;
}

- (BOOL)canHandleGesture:(id)a3
{
  unsigned int v5 = [(THWFreeTransformableRepGestureTargetHandler *)self interactionEnabled];
  if (v5)
  {
    id v6 = [a3 gestureKind];
    if (v6 != (id)TSDFreeTransform)
    {
LABEL_3:
      LOBYTE(v5) = 0;
      return v5;
    }
    objc_opt_class();
    double v7 = (void *)TSUDynamicCast();
    if (!v7) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"] lineNumber:328 description:@"invalid nil value for '%s'", "ftgr"];
    }
    if ([v7 freeTransformDelegate])
    {
      double v8 = (THWFreeTransformController *)[v7 freeTransformDelegate];
      if (v8 != [(THWFreeTransformableRepGestureTargetHandler *)self ftc]) {
        goto LABEL_3;
      }
    }
    else
    {
      id v9 = [[-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler") hostCanvasLayer] canvasView];
      [[(THWFreeTransformableRepGestureTargetHandler *)self rep] frameInUnscaledCanvas];
      CGRect v29 = CGRectInset(v28, -14.0, -14.0);
      CGFloat x = v29.origin.x;
      CGFloat y = v29.origin.y;
      CGFloat width = v29.size.width;
      CGFloat height = v29.size.height;
      [(-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "interactiveCanvasController") viewScale];
      objc_msgSend(objc_msgSend(v7, "touch1"), "locationInView:", v9);
      TSDMultiplyPointScalar();
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      objc_msgSend(objc_msgSend(v7, "touch2"), "locationInView:", v9);
      v30.origin.CGFloat x = x;
      v30.origin.CGFloat y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      v26.CGFloat x = v14;
      v26.CGFloat y = v16;
      if (!CGRectContainsPoint(v30, v26)) {
        goto LABEL_3;
      }
      TSDMultiplyPointScalar();
      v27.CGFloat x = v17;
      v27.CGFloat y = v18;
      v31.origin.CGFloat x = x;
      v31.size.CGFloat height = height;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      unsigned int v5 = CGRectContainsPoint(v31, v27);
      if (!v5) {
        return v5;
      }
    }
    if (([[(THWFreeTransformableRepGestureTargetHandler *)self rep] meetsStageDimensionRequirementForExpanded] & 1) == 0&& ([[(THWFreeTransformableRepGestureTargetHandler *)self rep] isExpanded] & 1) == 0)
    {
      objc_opt_class();
      [(id)TSUDynamicCast() scale];
      if (v19 <= 1.0) {
        goto LABEL_3;
      }
    }
    [(THWFreeTransformableRepGestureTargetHandler *)self rep];
    if (objc_opt_respondsToSelector())
    {
      v20 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];
      [a3 naturalLocationForRep:[self rep]];
      id v21 = -[THWFreeTransformableRep hitRep:](v20, "hitRep:");
      v22 = [(THWFreeTransformableRepGestureTargetHandler *)self rep];
      LOBYTE(v5) = [(THWFreeTransformableRep *)v22 freeTransformMayBeginOverRep:v21];
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)handleGesture:(id)a3
{
  BOOL v5 = [(THWFreeTransformableRepGestureTargetHandler *)self interactionEnabled];
  if (v5)
  {
    id v6 = [a3 gestureKind];
    if (v6 == (id)TSDFreeTransform)
    {
      objc_opt_class();
      uint64_t v7 = TSUDynamicCast();
      if (v7)
      {
        uint64_t v8 = v7;
        unsigned int v9 = [a3 gestureState];
        if (v9 == 1)
        {
          [(THWFreeTransformableRepGestureTargetHandler *)self rep];
          if (objc_opt_respondsToSelector()) {
            [[(THWFreeTransformableRepGestureTargetHandler *)self rep] freeTransformWillBegin];
          }
          [(THWFreeTransformableRepGestureTargetHandler *)self p_setupFreeTransformControllerWithGesture:v8];
        }
        [(-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler")) freeTransformController transformGRChanged:v8];
        if (v9 - 3 <= 1)
        {
          objc_msgSend(objc_msgSend(-[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"), "transformGR"), "setFreeTransformDelegate:", 0);
          [self handler].freeTransformController.setTransformGR:0;
        }
      }
      else
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler handleGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m") lineNumber:381 description:@"Unkonwn free transform gesture."];
      }
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v4 = [a3 gestureKind];
  if (v4 == (id)TSDFreeTransform)
  {
    objc_opt_class();
    BOOL v5 = (void *)TSUDynamicCast();
    if (!v5) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"] lineNumber:421 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"ftgr"];
    }
    if ([v5 freeTransformDelegate])
    {
      id v6 = [v5 freeTransformDelegate];
      if (v6 != [THWFreeTransformableRepHandler freeTransformController:[THWFreeTransformableRepGestureTargetHandler handler:self].freeTransformController]) {
    }
      }
    id v7 = [(THWFreeTransformableRepHandler *)[(THWFreeTransformableRepGestureTargetHandler *)self handler] freeTransformController];
    [v5 setFreeTransformDelegate:v7];
  }
}

- (THWFreeTransformableRep)rep
{
  return self->_rep;
}

- (void)setRep:(id)a3
{
  self->_rep = (THWFreeTransformableRep *)a3;
}

- (THWFreeTransformableRepHandler)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  self->_handler = (THWFreeTransformableRepHandler *)a3;
}

@end