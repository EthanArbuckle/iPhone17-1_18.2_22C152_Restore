@interface RPTActivationInteraction
- (CGPoint)actionPoint;
- (UIWindow)window;
- (id)initForAction:(unint64_t)a3 window:(id)a4;
- (id)reversedInteraction;
- (unint64_t)action;
- (void)invokeWithComposer:(id)a3 duration:(double)a4;
- (void)setAction:(unint64_t)a3;
- (void)setWindow:(id)a3;
@end

@implementation RPTActivationInteraction

- (id)initForAction:(unint64_t)a3 window:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RPTActivationInteraction;
  v8 = [(RPTActivationInteraction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_action = a3;
    objc_storeStrong((id *)&v8->_window, a4);
  }

  return v9;
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  id v5 = a3;
  [(RPTActivationInteraction *)self actionPoint];
  objc_msgSend(v5, "pointerOrFingerTap:");
}

- (id)reversedInteraction
{
  id v2 = [[RPTActivationInteraction alloc] initForAction:[(RPTActivationInteraction *)self action] == 0 window:self->_window];
  return v2;
}

- (CGPoint)actionPoint
{
  unint64_t v3 = [(RPTActivationInteraction *)self action];
  v4 = [(RPTActivationInteraction *)self window];
  id v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "_rpt_safeVisibleFrameOfScreen");
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v14 = [(RPTActivationInteraction *)self window];
    [v14 frame];
    CGRect v28 = CGRectInset(v27, -10.0, -10.0);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;

    v29.origin.CGFloat x = v7;
    v29.origin.CGFloat y = v9;
    v29.size.CGFloat width = v11;
    v29.size.CGFloat height = v13;
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    CGRect v30 = CGRectIntersection(v29, v33);
    CGFloat MaxX = v30.origin.x;
    CGFloat MinY = v30.origin.y;
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    v26.CGFloat x = MaxX;
    v26.CGFloat y = MinY;
    if (CGRectContainsPoint(v30, v26))
    {
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      CGFloat MaxX = CGRectGetMaxX(v31);
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v32);
    }
  }
  else
  {
    objc_msgSend(v4, "rpt_accessibilityActivationPointAttribute");
    CGFloat MaxX = v21;
    CGFloat MinY = v22;
  }
  double v23 = MaxX;
  double v24 = MinY;
  result.CGFloat y = v24;
  result.CGFloat x = v23;
  return result;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end