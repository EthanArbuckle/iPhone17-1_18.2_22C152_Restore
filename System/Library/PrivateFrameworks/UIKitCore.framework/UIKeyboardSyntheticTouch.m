@interface UIKeyboardSyntheticTouch
+ (id)syntheticTouchWithPoint:(CGPoint)a3 timestamp:(double)a4 window:(id)a5;
- (CGPoint)getLocationInWindow;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)locationInWindow;
- (CGPoint)previousLocationInView:(id)a3;
- (UIKeyboardSyntheticTouch)initWithPoint:(CGPoint)a3 timestamp:(double)a4 window:(id)a5;
- (UIWindow)window;
- (double)timestamp;
- (float)_pathMajorRadius;
- (int64_t)phase;
- (unint64_t)tapCount;
- (unsigned)_pathIdentity;
- (unsigned)_pathIndex;
- (void)setLocationInWindow:(CGPoint)a3;
- (void)setPhase:(int64_t)a3;
- (void)setTapCount:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setWindow:(id)a3;
- (void)set_pathMajorRadius:(float)a3;
@end

@implementation UIKeyboardSyntheticTouch

+ (id)syntheticTouchWithPoint:(CGPoint)a3 timestamp:(double)a4 window:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a5;
  v9 = -[UIKeyboardSyntheticTouch initWithPoint:timestamp:window:]([UIKeyboardSyntheticTouch alloc], "initWithPoint:timestamp:window:", v8, x, y, a4);

  return v9;
}

- (UIKeyboardSyntheticTouch)initWithPoint:(CGPoint)a3 timestamp:(double)a4 window:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardSyntheticTouch;
  v11 = [(UIKeyboardSyntheticTouch *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->timestamp = a4;
    objc_storeStrong((id *)&v11->window, a5);
    v12->locationInWindow.CGFloat x = x;
    v12->locationInWindow.CGFloat y = y;
    *(_OWORD *)&v12->phase = xmmword_186B8FCC0;
  }

  return v12;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  v5 = [(UIKeyboardSyntheticTouch *)self window];
  objc_msgSend(v4, "convertPoint:fromView:", v5, self->locationInWindow.x, self->locationInWindow.y);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGPoint)previousLocationInView:(id)a3
{
  id v4 = a3;
  v5 = [(UIKeyboardSyntheticTouch *)self window];
  objc_msgSend(v4, "convertPoint:fromView:", v5, self->locationInWindow.x, self->locationInWindow.y);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGPoint)getLocationInWindow
{
  double x = self->locationInWindow.x;
  double y = self->locationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocationInWindow:(CGPoint)a3
{
  self->locationInWindow = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (int64_t)phase
{
  return self->phase;
}

- (void)setPhase:(int64_t)a3
{
  self->phase = a3;
}

- (unint64_t)tapCount
{
  return self->tapCount;
}

- (void)setTapCount:(unint64_t)a3
{
  self->tapCount = a3;
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
}

- (CGPoint)locationInWindow
{
  double x = self->locationInWindow.x;
  double y = self->locationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unsigned)_pathIndex
{
  return self->_pathIndex;
}

- (unsigned)_pathIdentity
{
  return self->_pathIdentity;
}

- (float)_pathMajorRadius
{
  return self->_pathMajorRadius;
}

- (void)set_pathMajorRadius:(float)a3
{
  self->_pathMajorRadius = a3;
}

- (void).cxx_destruct
{
}

@end