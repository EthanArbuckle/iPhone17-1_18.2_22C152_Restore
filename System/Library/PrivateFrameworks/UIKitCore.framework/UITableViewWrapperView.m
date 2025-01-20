@interface UITableViewWrapperView
- (BOOL)_forwardsToParentScroller;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSArray)stuckToBackViews;
- (UITableViewWrapperView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)_focusPrimaryScrollableAxis;
- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5;
- (void)_stickViewToBack:(id)a3;
- (void)_unstickView:(id)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)dealloc;
- (void)sendSubviewToBack:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)willRemoveSubview:(id)a3;
@end

@implementation UITableViewWrapperView

- (NSArray)stuckToBackViews
{
  return &self->_stuckToBackViews->super;
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v8 = a5;
  v9 = _UITableViewSubviewToMoveForView(a3);
  v10.receiver = self;
  v10.super_class = (Class)UITableViewWrapperView;
  [(UIView *)&v10 _addSubview:v9 positioned:a4 relativeTo:v8];
}

- (void)_unstickView:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (v4)
  {
    [(NSMutableArray *)self->_stuckToBackViews removeObject:v4];
    id v4 = v10;
  }
  v5 = [v4 superview];
  if (v5 == self)
  {
    v6 = [(UIView *)self subviews];
    unint64_t v7 = [v6 indexOfObject:v10];
    unint64_t v8 = [(NSMutableArray *)self->_stuckToBackViews count];

    v9 = v10;
    if (v7 >= v8) {
      goto LABEL_8;
    }
    [(UITableViewWrapperView *)self bringSubviewToFront:v10];
  }
  else
  {
  }
  v9 = v10;
LABEL_8:
}

- (UITableViewWrapperView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITableViewWrapperView;
  v3 = -[UIScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(UIScrollView *)v3 _setZoomFeedbackGenerator:0];
  }
  return v4;
}

- (void)dealloc
{
  stuckToBackViews = self->_stuckToBackViews;
  self->_stuckToBackViews = 0;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewWrapperView;
  [(UIScrollView *)&v4 dealloc];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  unint64_t v8 = [(UIView *)self superview];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  LOBYTE(self) = objc_msgSend(v8, "pointInside:withEvent:", v7);

  return (char)self;
}

- (void)_stickViewToBack:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    stuckToBackViews = self->_stuckToBackViews;
    id v9 = v4;
    if (!stuckToBackViews)
    {
      objc_super v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v7 = self->_stuckToBackViews;
      self->_stuckToBackViews = v6;

      stuckToBackViews = self->_stuckToBackViews;
    }
    char v8 = [(NSMutableArray *)stuckToBackViews containsObject:v9];
    id v4 = v9;
    if ((v8 & 1) == 0)
    {
      [(UIView *)self insertSubview:v9 atIndex:[(NSMutableArray *)self->_stuckToBackViews count]];
      [(NSMutableArray *)self->_stuckToBackViews addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)willRemoveSubview:(id)a3
{
}

- (void)bringSubviewToFront:(id)a3
{
  id v4 = _UITableViewSubviewToMoveForView(a3);
  v5.receiver = self;
  v5.super_class = (Class)UITableViewWrapperView;
  [(UIView *)&v5 bringSubviewToFront:v4];
}

- (void)sendSubviewToBack:(id)a3
{
  id v4 = _UITableViewSubviewToMoveForView(a3);
  v5.receiver = self;
  v5.super_class = (Class)UITableViewWrapperView;
  [(UIView *)&v5 sendSubviewToBack:v4];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  char v8 = self;
  id v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(UITableViewWrapperView *, SEL, id, id))Implementation)(v8, a2, v12, v7);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  char v8 = self;
  id v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(UITableViewWrapperView *, SEL, id, id))Implementation)(v8, a2, v12, v7);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  char v8 = self;
  id v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(UITableViewWrapperView *, SEL, id, id))Implementation)(v8, a2, v12, v7);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  char v8 = self;
  id v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(UITableViewWrapperView *, SEL, id, id))Implementation)(v8, a2, v12, v7);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIScrollView *)self contentOffset];
  double v9 = v8;
  double v11 = v10;
  id v12 = [(UIView *)self superview];
  int v13 = [v12 _manuallyManagesSwipeUI];
  int v14 = *((_DWORD *)&self->super.super._viewFlags + 4);
  if ((v13 & 1) == 0)
  {
    if ((v14 & 0x80000) != 0)
    {
      if (x > 0.0) {
        double x = 0.0;
      }
    }
    else
    {
      double x = fmax(x, 0.0);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)UITableViewWrapperView;
  -[UIScrollView setBounds:](&v22, sel_setBounds_, x, y, width, height);
  [(UIScrollView *)self contentOffset];
  BOOL v16 = v9 == v15;
  if (v11 != v17) {
    BOOL v16 = 0;
  }
  if (((v13 | v16) & 1) == 0)
  {
    v23.origin.double x = x;
    v23.origin.double y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    double MinX = CGRectGetMinX(v23);
    if ((v14 & 0x80000) != 0)
    {
      if (MinX >= -30.0 && ![(UIScrollView *)self _isHorizontalBouncing])
      {
        [(UIScrollView *)self _horizontalVelocity];
        BOOL v20 = v21 < 0.0;
        goto LABEL_16;
      }
    }
    else if (MinX <= 30.0 && ![(UIScrollView *)self _isHorizontalBouncing])
    {
      [(UIScrollView *)self _horizontalVelocity];
      BOOL v20 = v19 > 0.0;
LABEL_16:
      [(UIScrollView *)self setBounces:v20];
      goto LABEL_17;
    }
    BOOL v20 = 1;
    goto LABEL_16;
  }
LABEL_17:
}

- (BOOL)_forwardsToParentScroller
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UITableViewWrapperView;
  -[UIScrollView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_super v5 = (UITableViewWrapperView *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  if (v5 == self) {
    objc_super v5 = 0;
  }
  id v7 = v5;

  return v7;
}

- (unint64_t)_focusPrimaryScrollableAxis
{
  return 2;
}

- (void).cxx_destruct
{
}

@end