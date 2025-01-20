@interface _UIPlatterMenuPanningTransformer
+ (_UIPlatterMenuPanningTransformer)transformerWithAxisTransitionZonePosition:(CGPoint)a3 axisTransitionZoneSize:(CGSize)a4;
- (CGPoint)lastDirectionChangeTouchPosition;
- (CGPoint)lastTouchPosition;
- (CGPoint)lastTransformedPoint;
- (CGPoint)panBeginTouchPosition;
- (CGPoint)transitionZonePosition;
- (CGRect)transitionZoneRect;
- (CGSize)transitionZoneSize;
- (CGVector)lastOffset;
- (CGVector)offset;
- (CGVector)velocity;
- (NSDate)panBeginTime;
- (NSDate)timeForLastDirectionalChange;
- (_UIPlatterMenuPanningTransformer)initWithAxisTransitionZonePosition:(CGPoint)a3 axisTransitionZoneSize:(CGSize)a4;
- (_UIPlatterMenuPanningTransformerDelegate)delegate;
- (_UIVelocityIntegrator)velocityIntegrator;
- (double)lastAxisLockTime;
- (double)minimumXVelocityForAxisLock;
- (double)timeIntervalSinceLastDirectionChange;
- (unint64_t)axisLock;
- (unint64_t)overrideLockAxis;
- (void)_enterYLockedState;
- (void)didBeginPanningWithTouchPosition:(CGPoint)a3 currentTransformedPosition:(CGPoint)a4;
- (void)didEndPanningWithTouchPosition:(CGPoint)a3 currentTransformedPosition:(CGPoint)a4;
- (void)didPanWithTouchPosition:(CGPoint)a3 currentTransformedPosition:(CGPoint)a4;
- (void)lockIntoYAxis;
- (void)setAxisLock:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLastAxisLockTime:(double)a3;
- (void)setLastDirectionChangeTouchPosition:(CGPoint)a3;
- (void)setLastOffset:(CGVector)a3;
- (void)setLastTouchPosition:(CGPoint)a3;
- (void)setLastTransformedPoint:(CGPoint)a3;
- (void)setMinimumXVelocityForAxisLock:(double)a3;
- (void)setOverrideLockAxis:(unint64_t)a3;
- (void)setPanBeginTime:(id)a3;
- (void)setPanBeginTouchPosition:(CGPoint)a3;
- (void)setTimeForLastDirectionalChange:(id)a3;
- (void)setTransitionZonePosition:(CGPoint)a3;
- (void)setTransitionZoneRect:(CGRect)a3;
- (void)setTransitionZoneSize:(CGSize)a3;
- (void)setVelocityIntegrator:(id)a3;
@end

@implementation _UIPlatterMenuPanningTransformer

- (_UIPlatterMenuPanningTransformer)initWithAxisTransitionZonePosition:(CGPoint)a3 axisTransitionZoneSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)_UIPlatterMenuPanningTransformer;
  v8 = [(_UIPlatterMenuPanningTransformer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_overrideLockAxis = 0;
    v8->_transitionZonePosition.double x = x;
    v8->_transitionZonePosition.double y = y;
    v8->_transitionZoneSize.double width = width;
    v8->_transitionZoneSize.double height = height;
    v8->_transitionZoneRect.origin.double x = round(x - width * 0.5);
    v8->_transitionZoneRect.origin.double y = round(y - (height + height) * 0.5);
    v8->_transitionZoneRect.size.double width = width;
    v8->_transitionZoneRect.size.double height = height + height;
    v10 = objc_alloc_init(_UIVelocityIntegrator);
    velocityIntegrator = v9->_velocityIntegrator;
    v9->_velocityIntegrator = v10;
  }
  return v9;
}

+ (_UIPlatterMenuPanningTransformer)transformerWithAxisTransitionZonePosition:(CGPoint)a3 axisTransitionZoneSize:(CGSize)a4
{
  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithAxisTransitionZonePosition:axisTransitionZoneSize:", a3.x, a3.y, a4.width, a4.height);
  return (_UIPlatterMenuPanningTransformer *)v4;
}

- (double)timeIntervalSinceLastDirectionChange
{
  v3 = [(_UIPlatterMenuPanningTransformer *)self timeForLastDirectionalChange];

  if (!v3) {
    return 0.0;
  }
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(_UIPlatterMenuPanningTransformer *)self timeForLastDirectionalChange];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (void)lockIntoYAxis
{
}

- (void)_enterYLockedState
{
}

- (CGVector)offset
{
  [(_UIPlatterMenuPanningTransformer *)self transitionZonePosition];
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v6 = 0.0;
  BOOL v8 = v7 == *MEMORY[0x1E4F1DAD8] && v3 == v5;
  double v9 = 0.0;
  if (!v8)
  {
    [(_UIPlatterMenuPanningTransformer *)self lastTransformedPoint];
    BOOL v12 = v11 == v4 && v10 == v5;
    double v9 = 0.0;
    if (!v12)
    {
      [(_UIPlatterMenuPanningTransformer *)self transitionZonePosition];
      double v14 = v13;
      [(_UIPlatterMenuPanningTransformer *)self lastTransformedPoint];
      double v6 = v14 - v15;
      [(_UIPlatterMenuPanningTransformer *)self transitionZonePosition];
      double v17 = v16;
      [(_UIPlatterMenuPanningTransformer *)self lastTransformedPoint];
      double v9 = v17 - v18;
    }
  }
  double v19 = v6;
  result.ddouble y = v9;
  result.ddouble x = v19;
  return result;
}

- (CGVector)velocity
{
  v2 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
  [v2 velocity];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.ddouble y = v8;
  result.ddouble x = v7;
  return result;
}

- (void)didBeginPanningWithTouchPosition:(CGPoint)a3 currentTransformedPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  -[_UIPlatterMenuPanningTransformer setLastDirectionChangeTouchPosition:](self, "setLastDirectionChangeTouchPosition:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  -[_UIPlatterMenuPanningTransformer setPanBeginTouchPosition:](self, "setPanBeginTouchPosition:", v7, v6);
  double v9 = [MEMORY[0x1E4F1C9C8] date];
  [(_UIPlatterMenuPanningTransformer *)self setPanBeginTime:v9];

  if ([(_UIPlatterMenuPanningTransformer *)self overrideLockAxis]) {
    [(_UIPlatterMenuPanningTransformer *)self setAxisLock:[(_UIPlatterMenuPanningTransformer *)self overrideLockAxis]];
  }
  double v10 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
  [v10 reset];

  double v11 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
  objc_msgSend(v11, "addSample:", v7, v6);

  [(_UIPlatterMenuPanningTransformer *)self setTimeForLastDirectionalChange:0];
  -[_UIPlatterMenuPanningTransformer setLastTransformedPoint:](self, "setLastTransformedPoint:", x, y);
  -[_UIPlatterMenuPanningTransformer setLastTouchPosition:](self, "setLastTouchPosition:", v7, v6);
  -[_UIPlatterMenuPanningTransformer setLastOffset:](self, "setLastOffset:", 0.0, 0.0);
  id v12 = [(_UIPlatterMenuPanningTransformer *)self delegate];
  objc_msgSend(v12, "panningTransformer:didBeginPanToTransformedPosition:", self, x, y);
}

- (void)didPanWithTouchPosition:(CGPoint)a3 currentTransformedPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  [(_UIPlatterMenuPanningTransformer *)self lastTouchPosition];
  double v10 = v9;
  [(_UIPlatterMenuPanningTransformer *)self lastTouchPosition];
  double v12 = v11;
  if ([(_UIPlatterMenuPanningTransformer *)self overrideLockAxis]) {
    [(_UIPlatterMenuPanningTransformer *)self setAxisLock:[(_UIPlatterMenuPanningTransformer *)self overrideLockAxis]];
  }
  double v13 = v6 - v12;
  unint64_t v14 = [(_UIPlatterMenuPanningTransformer *)self axisLock];
  if ([(_UIPlatterMenuPanningTransformer *)self overrideLockAxis]) {
    goto LABEL_4;
  }
  [(_UIPlatterMenuPanningTransformer *)self transitionZoneRect];
  v67.double x = x;
  v67.double y = y;
  if (!CGRectContainsPoint(v68, v67))
  {
    if ([(_UIPlatterMenuPanningTransformer *)self axisLock]) {
      goto LABEL_4;
    }
  }
  [(_UIPlatterMenuPanningTransformer *)self panBeginTouchPosition];
  double v29 = v28;
  double v31 = v30;
  [(_UIPlatterMenuPanningTransformer *)self lastDirectionChangeTouchPosition];
  if (v33 != *MEMORY[0x1E4F1DAD8] || v32 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    [(_UIPlatterMenuPanningTransformer *)self lastDirectionChangeTouchPosition];
    double v29 = v35;
    double v31 = v36;
  }
  double v37 = v7 - v29 >= 0.0 ? v7 - v29 : -(v7 - v29);
  double v38 = v6 - v31 >= 0.0 ? v6 - v31 : -(v6 - v31);
  if (v37 <= 3.0 && v38 <= 3.0) {
    goto LABEL_4;
  }
  if (v37 >= 2.22044605e-16)
  {
    if (v38 >= 2.22044605e-16)
    {
      double v54 = atan(v38 / v37) / 0.0174532925;
      if (v37 <= v38)
      {
        if (v54 > 45.0) {
          goto LABEL_42;
        }
      }
      else if (v54 <= 45.0)
      {
        uint64_t v41 = 1;
        int v40 = 1;
        goto LABEL_69;
      }
    }
    else if (v37 > v38)
    {
      int v40 = 1;
      uint64_t v41 = 1;
      goto LABEL_69;
    }
LABEL_82:
    [(_UIPlatterMenuPanningTransformer *)self axisLock];
    goto LABEL_4;
  }
  if (v37 > v38) {
    goto LABEL_82;
  }
LABEL_42:
  int v40 = 0;
  uint64_t v41 = 2;
LABEL_69:
  if ([(_UIPlatterMenuPanningTransformer *)self axisLock] == v41) {
    goto LABEL_4;
  }
  double v55 = CACurrentMediaTime();
  [(_UIPlatterMenuPanningTransformer *)self lastAxisLockTime];
  double v57 = v55 - v56;
  [(_UIPlatterMenuPanningTransformer *)self lastAxisLockTime];
  BOOL v59 = v57 >= 0.35 || v58 <= 0.0;
  if ((v40 & v59) != 1
    || ([(_UIPlatterMenuPanningTransformer *)self minimumXVelocityForAxisLock], v60 <= 0.0))
  {
    if (!v59) {
      goto LABEL_4;
    }
    goto LABEL_80;
  }
  v61 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
  [v61 velocity];
  double v63 = v62;

  if (v63 < 0.0) {
    double v63 = -v63;
  }
  [(_UIPlatterMenuPanningTransformer *)self minimumXVelocityForAxisLock];
  if (v63 >= v64)
  {
LABEL_80:
    [(_UIPlatterMenuPanningTransformer *)self setAxisLock:v41];
    [(_UIPlatterMenuPanningTransformer *)self setLastAxisLockTime:CACurrentMediaTime()];
  }
LABEL_4:
  double v15 = y + v13;
  if ([(_UIPlatterMenuPanningTransformer *)self axisLock] == 2)
  {
    [(_UIPlatterMenuPanningTransformer *)self transitionZonePosition];
    double v17 = v16;
    double v18 = 0.0;
  }
  else
  {
    double v18 = v7 - v10;
    double v17 = x + v18;
    if ([(_UIPlatterMenuPanningTransformer *)self axisLock] == 1)
    {
      [(_UIPlatterMenuPanningTransformer *)self transitionZonePosition];
      double v15 = v19;
      double v13 = 0.0;
    }
  }
  -[_UIPlatterMenuPanningTransformer setLastTouchPosition:](self, "setLastTouchPosition:", v7, v6);
  if ([(_UIPlatterMenuPanningTransformer *)self axisLock])
  {
    v20 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
    [v20 velocity];
    double v22 = v21;
    double v24 = v23;

    if ([(_UIPlatterMenuPanningTransformer *)self axisLock] == 1)
    {
      double v25 = -v22;
      if (v22 >= 0.0) {
        double v25 = v22;
      }
      if (v25 <= 2.22044605e-16) {
        goto LABEL_57;
      }
      double v26 = -v18;
      if (v18 >= 0.0) {
        double v26 = v18;
      }
      BOOL v27 = v22 < 0.0 && v18 < 0.0;
      if (v26 <= 2.22044605e-16 || v27 || v22 > 0.0 && v18 > 0.0) {
        goto LABEL_57;
      }
    }
    else
    {
      if ([(_UIPlatterMenuPanningTransformer *)self axisLock] != 2) {
        goto LABEL_57;
      }
      double v42 = -v24;
      if (v24 >= 0.0) {
        double v42 = v24;
      }
      if (v42 <= 2.22044605e-16) {
        goto LABEL_57;
      }
      double v43 = -v13;
      if (v13 >= 0.0) {
        double v43 = v13;
      }
      BOOL v44 = v24 < 0.0 && v13 < 0.0;
      if (v43 <= 2.22044605e-16 || v44 || v24 > 0.0 && v13 > 0.0) {
        goto LABEL_57;
      }
    }
    -[_UIPlatterMenuPanningTransformer setLastDirectionChangeTouchPosition:](self, "setLastDirectionChangeTouchPosition:", v7, v6);
    v45 = [MEMORY[0x1E4F1C9C8] date];
    [(_UIPlatterMenuPanningTransformer *)self setTimeForLastDirectionalChange:v45];

    v46 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
    [v46 reset];

LABEL_57:
    -[_UIPlatterMenuPanningTransformer setLastOffset:](self, "setLastOffset:", v18, v13);
    -[_UIPlatterMenuPanningTransformer setLastTransformedPoint:](self, "setLastTransformedPoint:", v17, v15);
    unint64_t v47 = [(_UIPlatterMenuPanningTransformer *)self axisLock];
    if (v47 != v14)
    {
      -[_UIPlatterMenuPanningTransformer setLastDirectionChangeTouchPosition:](self, "setLastDirectionChangeTouchPosition:", v7, v6);
      v48 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
      [v48 reset];
    }
    BOOL v49 = v47 != v14;
    v50 = [(_UIPlatterMenuPanningTransformer *)self delegate];
    v51 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
    [v51 velocity];
    objc_msgSend(v50, "panningTransformer:didPanToTransformedPosition:offsetFromPrevious:touchPosition:velocity:didChangeAxis:axisLock:", self, v49, -[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock"), v17, v15, v18, v13, v7, v6, v52, v53);
  }
  id v65 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
  objc_msgSend(v65, "addSample:", v7, v6);
}

- (void)didEndPanningWithTouchPosition:(CGPoint)a3 currentTransformedPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  double v9 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
  objc_msgSend(v9, "addSample:", v7, v6);

  id v17 = [(_UIPlatterMenuPanningTransformer *)self delegate];
  [(_UIPlatterMenuPanningTransformer *)self lastOffset];
  double v11 = v10;
  double v13 = v12;
  unint64_t v14 = [(_UIPlatterMenuPanningTransformer *)self velocityIntegrator];
  [v14 velocity];
  objc_msgSend(v17, "panningTransformer:didEndPanToTransformedPosition:offsetFromPrevious:velocity:", self, x, y, v11, v13, v15, v16);
}

- (_UIPlatterMenuPanningTransformerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIPlatterMenuPanningTransformerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)minimumXVelocityForAxisLock
{
  return self->_minimumXVelocityForAxisLock;
}

- (void)setMinimumXVelocityForAxisLock:(double)a3
{
  self->_minimumXVelocityForAxisLock = a3;
}

- (CGPoint)transitionZonePosition
{
  double x = self->_transitionZonePosition.x;
  double y = self->_transitionZonePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTransitionZonePosition:(CGPoint)a3
{
  self->_transitionZonePosition = a3;
}

- (CGSize)transitionZoneSize
{
  double width = self->_transitionZoneSize.width;
  double height = self->_transitionZoneSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTransitionZoneSize:(CGSize)a3
{
  self->_transitionZoneSize = a3;
}

- (CGPoint)lastTouchPosition
{
  double x = self->_lastTouchPosition.x;
  double y = self->_lastTouchPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastTouchPosition:(CGPoint)a3
{
  self->_lastTouchPosition = a3;
}

- (CGRect)transitionZoneRect
{
  double x = self->_transitionZoneRect.origin.x;
  double y = self->_transitionZoneRect.origin.y;
  double width = self->_transitionZoneRect.size.width;
  double height = self->_transitionZoneRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTransitionZoneRect:(CGRect)a3
{
  self->_transitionZoneRect = a3;
}

- (unint64_t)axisLock
{
  return self->_axisLock;
}

- (void)setAxisLock:(unint64_t)a3
{
  self->_axisLock = a3;
}

- (unint64_t)overrideLockAxis
{
  return self->_overrideLockAxis;
}

- (void)setOverrideLockAxis:(unint64_t)a3
{
  self->_overrideLockAxis = a3;
}

- (double)lastAxisLockTime
{
  return self->_lastAxisLockTime;
}

- (void)setLastAxisLockTime:(double)a3
{
  self->_lastAxisLockTime = a3;
}

- (CGVector)lastOffset
{
  ddouble x = self->_lastOffset.dx;
  ddouble y = self->_lastOffset.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (void)setLastOffset:(CGVector)a3
{
  self->_lastOffset = a3;
}

- (NSDate)timeForLastDirectionalChange
{
  return self->_timeForLastDirectionalChange;
}

- (void)setTimeForLastDirectionalChange:(id)a3
{
}

- (CGPoint)lastTransformedPoint
{
  double x = self->_lastTransformedPoint.x;
  double y = self->_lastTransformedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastTransformedPoint:(CGPoint)a3
{
  self->_lastTransformedPoint = a3;
}

- (CGPoint)panBeginTouchPosition
{
  double x = self->_panBeginTouchPosition.x;
  double y = self->_panBeginTouchPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPanBeginTouchPosition:(CGPoint)a3
{
  self->_panBeginTouchPosition = a3;
}

- (CGPoint)lastDirectionChangeTouchPosition
{
  double x = self->_lastDirectionChangeTouchPosition.x;
  double y = self->_lastDirectionChangeTouchPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastDirectionChangeTouchPosition:(CGPoint)a3
{
  self->_lastDirectionChangeTouchPosition = a3;
}

- (NSDate)panBeginTime
{
  return self->_panBeginTime;
}

- (void)setPanBeginTime:(id)a3
{
}

- (_UIVelocityIntegrator)velocityIntegrator
{
  return self->_velocityIntegrator;
}

- (void)setVelocityIntegrator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_storeStrong((id *)&self->_panBeginTime, 0);
  objc_storeStrong((id *)&self->_timeForLastDirectionalChange, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end