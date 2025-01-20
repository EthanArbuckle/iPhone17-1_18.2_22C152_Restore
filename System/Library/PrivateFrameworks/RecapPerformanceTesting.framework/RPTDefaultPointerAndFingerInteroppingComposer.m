@interface RPTDefaultPointerAndFingerInteroppingComposer
+ (id)composerWrapping:(id)a3 withInteractionOptions:(id)a4;
- (BOOL)_usePointer;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGPoint)_currentlySetAbsolutePosition;
- (RCPEventStreamComposer)forwardingTarget;
- (RPTInteractionOptions)interactionOptions;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)initFromWrapping:(id)a3 interactionOptions:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_pointerOrFingerFlickAt:(CGPoint)a3 byDelta:(CGVector)a4 duration:(double)a5;
- (void)_pointerOrFingerScrollAt:(CGPoint)a3 byDelta:(CGVector)a4 duration:(double)a5 touchDownAndLift:(BOOL)a6;
- (void)forwardInvocation:(id)a3;
- (void)overrideInteractionOptions:(id)a3 withEventActionsBlock:(id)a4;
- (void)pointerMoveDelta:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5;
- (void)pointerMoveToPoint:(CGPoint)a3 duration:(double)a4;
- (void)pointerMoveToPointIfApplicable:(CGPoint)a3;
- (void)pointerOrFingerDoubleTap:(CGPoint)a3;
- (void)pointerOrFingerDragWithStartPoint:(CGPoint)a3 mask:(unint64_t)a4 endPoint:(CGPoint)a5 mask:(unint64_t)a6 duration:(double)a7;
- (void)pointerOrFingerMoveToPoint:(CGPoint)a3 duration:(double)a4;
- (void)pointerOrFingerScrollAt:(CGPoint)a3 byDelta:(CGVector)a4 duration:(double)a5;
- (void)pointerOrFingerTap:(CGPoint)a3;
- (void)pointerOrFingerTapDown:(CGPoint)a3;
- (void)pointerOrFingerTapUp:(CGPoint)a3;
- (void)setForwardingTarget:(id)a3;
- (void)set_currentlySetAbsolutePosition:(CGPoint)a3;
@end

@implementation RPTDefaultPointerAndFingerInteroppingComposer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardingTarget, 0);
  objc_storeStrong((id *)&self->_interactionOptions, 0);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_forwardingTarget;
}

+ (id)composerWrapping:(id)a3 withInteractionOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initFromWrapping:v7 interactionOptions:v6];

  return v8;
}

- (void)overrideInteractionOptions:(id)a3 withEventActionsBlock:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() composerWrapping:self->_forwardingTarget withInteractionOptions:v8];

  (*((void (**)(id, id))a4 + 2))(v7, v9);
}

- (id)initFromWrapping:(id)a3 interactionOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_forwardingTarget, a3);
  objc_storeStrong((id *)&self->_interactionOptions, a4);
  int v9 = [v8 prefersPointer];
  self->__usePointer = v9;
  self->__currentlySetAbsolutePosition.x = 0.0;
  self->__currentlySetAbsolutePosition.y = 0.0;
  if (v9)
  {
    [MEMORY[0x1E4F29060] sleepForTimeInterval:1.0];
    -[RCPEventStreamComposer pointerSetAbsolutePosition:](self->_forwardingTarget, "pointerSetAbsolutePosition:", self->__currentlySetAbsolutePosition.x, self->__currentlySetAbsolutePosition.y);
    [MEMORY[0x1E4F29060] sleepForTimeInterval:1.0];
  }

  return self;
}

- (void)pointerOrFingerScrollAt:(CGPoint)a3 byDelta:(CGVector)a4 duration:(double)a5
{
}

- (void)_pointerOrFingerScrollAt:(CGPoint)a3 byDelta:(CGVector)a4 duration:(double)a5 touchDownAndLift:(BOOL)a6
{
  double dy = a4.dy;
  double dx = a4.dx;
  if (self->__usePointer)
  {
    double v10 = a3.x + a4.dx * 0.5;
    double v11 = a3.y + a4.dy * 0.5;
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a6, v10, v11, 0.01);
    -[RCPEventStreamComposer pointerPhasedScroll:duration:frequency:](self->_forwardingTarget, "pointerPhasedScroll:duration:frequency:", [(RPTInteractionOptions *)self->_interactionOptions pointerFrequency], -dx, -dy, a5);
  }
  else
  {
    double v10 = a3.x + a4.dx;
    double v11 = a3.y + a4.dy;
    forwardingTarget = self->_forwardingTarget;
    if (a6) {
      -[RCPEventStreamComposer dragWithStartPoint:endPoint:duration:](forwardingTarget, "dragWithStartPoint:endPoint:duration:");
    }
    else {
      -[RCPEventStreamComposer moveToPoint:duration:](forwardingTarget, "moveToPoint:duration:", a3.x + a4.dx, a3.y + a4.dy, a5);
    }
  }
  self->__currentlySetAbsolutePosition.x = v10;
  self->__currentlySetAbsolutePosition.y = v11;
}

- (void)_pointerOrFingerFlickAt:(CGPoint)a3 byDelta:(CGVector)a4 duration:(double)a5
{
  double dy = a4.dy;
  double dx = a4.dx;
  double y = a3.y;
  double x = a3.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->__usePointer)
  {
    double v11 = a3.x + a4.dx * 0.5;
    double v12 = a3.y + a4.dy * 0.5;
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", v11, v12, 0.01);
    v13 = RPTLogTestRunning();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v32.double x = v11;
      v32.double y = v12;
      v14 = _RPTStringFromCGPoint(v32);
      v33.double x = dx;
      v33.double y = dy;
      v15 = _RPTStringFromCGPoint(v33);
      int v23 = 138543874;
      v24 = v14;
      __int16 v25 = 2114;
      v26 = v15;
      __int16 v27 = 2048;
      double v28 = a5;
      _os_log_impl(&dword_1B626C000, v13, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTDefaultPointerAndFingerInteroppingComposer pointerFlickAt: %{public}@ delta: %{public}@ duration: %f", (uint8_t *)&v23, 0x20u);
    }
    -[RCPEventStreamComposer pointerPhasedFlick:duration:frequency:](self->_forwardingTarget, "pointerPhasedFlick:duration:frequency:", [(RPTInteractionOptions *)self->_interactionOptions pointerFrequency], -dx, -dy, a5);
  }
  else
  {
    double v16 = 0.5 - a5;
    double v11 = a3.x + a4.dx;
    double v12 = a3.y + a4.dy;
    v17 = RPTLogTestRunning();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16 >= 0.0)
    {
      if (v18)
      {
        v36.double x = x;
        v36.double y = y;
        v21 = _RPTStringFromCGPoint(v36);
        v37.double x = x + dx;
        v37.double y = y + dy;
        v22 = _RPTStringFromCGPoint(v37);
        int v23 = 138544130;
        v24 = v21;
        __int16 v25 = 2114;
        v26 = v22;
        __int16 v27 = 2048;
        double v28 = a5;
        __int16 v29 = 2048;
        uint64_t v30 = *(void *)&v16;
        _os_log_impl(&dword_1B626C000, v17, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTDefaultPointerAndFingerInteroppingComposer touchFlickAt: %{public}@ to: %{public}@ duration: %f excessDuration: %f", (uint8_t *)&v23, 0x2Au);
      }
    }
    else
    {
      if (v18)
      {
        v34.double x = x;
        v34.double y = y;
        v19 = _RPTStringFromCGPoint(v34);
        v35.double x = x + dx;
        v35.double y = y + dy;
        v20 = _RPTStringFromCGPoint(v35);
        int v23 = 138544130;
        v24 = v19;
        __int16 v25 = 2114;
        v26 = v20;
        __int16 v27 = 2048;
        double v28 = a5;
        __int16 v29 = 2048;
        uint64_t v30 = 0x3FD3333333333333;
        _os_log_impl(&dword_1B626C000, v17, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTDefaultPointerAndFingerInteroppingComposer touchFlickAt: %{public}@ to: %{public}@ duration: %f excessDuration: %f", (uint8_t *)&v23, 0x2Au);
      }
      double v16 = 0.3;
    }

    -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](self->_forwardingTarget, "sendFlickWithStartPoint:endPoint:duration:", x, y, x + dx, y + dy, a5);
    [(RCPEventStreamComposer *)self->_forwardingTarget advanceTime:v16];
  }
  self->__currentlySetAbsolutePosition.double x = v11;
  self->__currentlySetAbsolutePosition.double y = v12;
}

- (void)pointerMoveToPoint:(CGPoint)a3 duration:(double)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_currentlySetAbsolutePosition = &self->__currentlySetAbsolutePosition;
  double v7 = a3.x - self->__currentlySetAbsolutePosition.x;
  double v8 = a3.y - self->__currentlySetAbsolutePosition.y;
  if (v7 != *MEMORY[0x1E4F1DAD8] || v8 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    -[RCPEventStreamComposer pointerMoveDelta:duration:frequency:](self->_forwardingTarget, "pointerMoveDelta:duration:frequency:", [(RPTInteractionOptions *)self->_interactionOptions pointerFrequency], v7, v8, a4);
    p_currentlySetAbsolutePosition->CGFloat x = x;
    p_currentlySetAbsolutePosition->CGFloat y = y;
  }
}

- (void)pointerMoveDelta:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  uint64_t v6 = *(void *)&a3.x;
  -[RCPEventStreamComposer pointerMoveDelta:duration:frequency:](self->_forwardingTarget, "pointerMoveDelta:duration:frequency:", a5, a3.x, a3.y, a4);
  self->__currentlySetAbsolutePosition = (CGPoint)vaddq_f64((float64x2_t)vdupq_lane_s64(v6, 0), (float64x2_t)self->__currentlySetAbsolutePosition);
}

- (void)pointerMoveToPointIfApplicable:(CGPoint)a3
{
  if (self->__usePointer) {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a3.x, a3.y, 2.0);
  }
}

- (void)pointerOrFingerTapDown:(CGPoint)a3
{
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a3.x, a3.y, 0.8);
    forwardingTarget = self->_forwardingTarget;
    [(RCPEventStreamComposer *)forwardingTarget pointerBeginPressingButton:1];
  }
  else
  {
    v5 = self->_forwardingTarget;
    -[RCPEventStreamComposer touchDown:](v5, "touchDown:", a3.x, a3.y);
  }
}

- (void)pointerOrFingerMoveToPoint:(CGPoint)a3 duration:(double)a4
{
  if (self->__usePointer) {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a3.x, a3.y, a4);
  }
  else {
    -[RPTDefaultPointerAndFingerInteroppingComposer moveToPoint:duration:](self, "moveToPoint:duration:", a3.x, a3.y, a4);
  }
}

- (void)pointerOrFingerTapUp:(CGPoint)a3
{
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a3.x, a3.y, 1.0);
    forwardingTarget = self->_forwardingTarget;
    [(RCPEventStreamComposer *)forwardingTarget pointerEndPressingButton:1];
  }
  else
  {
    v5 = self->_forwardingTarget;
    -[RCPEventStreamComposer liftUp:](v5, "liftUp:", a3.x, a3.y);
  }
}

- (void)pointerOrFingerDragWithStartPoint:(CGPoint)a3 mask:(unint64_t)a4 endPoint:(CGPoint)a5 mask:(unint64_t)a6 duration:(double)a7
{
  double y = a5.y;
  double x = a5.x;
  double v10 = a3.y;
  double v11 = a3.x;
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapDown:](self, "pointerOrFingerTapDown:", a4, a6, a3.x, a3.y);
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", x, y, a7);
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapDown:](self, "pointerOrFingerTapDown:", v11, v10);
  }
  else
  {
    forwardingTarget = self->_forwardingTarget;
    -[RCPEventStreamComposer dragWithStartPoint:mask:endPoint:mask:duration:](forwardingTarget, "dragWithStartPoint:mask:endPoint:mask:duration:", a4, a6);
  }
}

- (void)pointerOrFingerTap:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapDown:](self, "pointerOrFingerTapDown:", a3.x, a3.y);
    [(RCPEventStreamComposer *)self->_forwardingTarget advanceTime:0.5];
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapUp:](self, "pointerOrFingerTapUp:", x, y);
  }
  else
  {
    forwardingTarget = self->_forwardingTarget;
    -[RCPEventStreamComposer tap:](forwardingTarget, "tap:");
  }
}

- (void)pointerOrFingerDoubleTap:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapUp:](self, "pointerOrFingerTapUp:", a3.x, a3.y);
    [(RCPEventStreamComposer *)self->_forwardingTarget advanceTime:0.5];
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapUp:](self, "pointerOrFingerTapUp:", x, y);
  }
  else
  {
    forwardingTarget = self->_forwardingTarget;
    -[RCPEventStreamComposer doubleTap:](forwardingTarget, "doubleTap:");
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  return [(RCPEventStreamComposer *)self->_forwardingTarget conformsToProtocol:a3];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(RCPEventStreamComposer *)self->_forwardingTarget methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
}

- (RPTInteractionOptions)interactionOptions
{
  return self->_interactionOptions;
}

- (CGPoint)_currentlySetAbsolutePosition
{
  double x = self->__currentlySetAbsolutePosition.x;
  double y = self->__currentlySetAbsolutePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_currentlySetAbsolutePosition:(CGPoint)a3
{
  self->__currentlySetAbsolutePosition = a3;
}

- (RCPEventStreamComposer)forwardingTarget
{
  return self->_forwardingTarget;
}

- (void)setForwardingTarget:(id)a3
{
}

- (BOOL)_usePointer
{
  return self->__usePointer;
}

@end