@interface UIScrollViewPinchGestureRecognizer
- (BOOL)_analyticsIsGestureHandled;
- (BOOL)_isGestureType:(int64_t)a3;
- (UIScrollView)scrollView;
- (UIScrollViewPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (unsigned)_updateHysteresis;
- (void)_transformChangedWithEvent:(id)a3;
- (void)removeTarget:(id)a3 action:(SEL)a4;
- (void)setDelegate:(id)a3;
- (void)setScrollView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIScrollViewPinchGestureRecognizer

- (void)setScrollView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scrollView, obj);
    -[UIScrollViewPinchGestureRecognizer _updateHysteresis]((unsigned __int8 *)self);
    v5 = obj;
  }
}

- (UIScrollViewPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  v5 = -[UIGestureRecognizer initWithTarget:action:](&v10, sel_initWithTarget_action_, a3);
  v6 = v5;
  if (v5)
  {
    if (a4) {
      SEL v7 = a4;
    }
    else {
      SEL v7 = 0;
    }
    v5->_scrollViewAction = v7;
    v8 = v5;
  }

  return v6;
}

- (unsigned)_updateHysteresis
{
  if (!result) {
    return result;
  }
  v1 = result;
  v2 = [result scrollView];
  v3 = [v2 _parentScrollView];
  if (!v3)
  {

    goto LABEL_8;
  }
  int v4 = v1[297];

  if (v4)
  {
LABEL_8:
    v5.receiver = v1;
    v5.super_class = (Class)UIScrollViewPinchGestureRecognizer;
    objc_msgSendSuper2(&v5, sel__hysteresis);
    return (unsigned __int8 *)objc_msgSend(v1, "_setHysteresis:");
  }
  return (unsigned __int8 *)[v1 _setHysteresis:0.0];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIScrollViewPinchGestureRecognizer *)self scrollView];
  v6 = (void *)v5;
  if (v5 && (id)v5 != v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"UIScrollView's built-in pinch gesture recognizer must have its scroll view as its delegate."];
  }
  v7.receiver = self;
  v7.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  [(UIGestureRecognizer *)&v7 setDelegate:v4];
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = [(UIScrollViewPinchGestureRecognizer *)self scrollView];
  if (v7 == v6)
  {
    if (self->_scrollViewAction) {
      scrollViewAction = self->_scrollViewAction;
    }
    else {
      scrollViewAction = 0;
    }

    if (scrollViewAction == a4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"You can't remove a scroll view's target/action pair from its built-in pinch gesture recognizer."];
    }
  }
  else
  {
  }
  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  [(UIGestureRecognizer *)&v9 removeTarget:v6 action:a4];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UIGestureRecognizer *)self _activeTouchesForEvent:v7];
  uint64_t v9 = [v8 count];

  if (v9 == 2)
  {
    objc_super v10 = [(UIScrollViewPinchGestureRecognizer *)self scrollView];
    [v10 zoomScale];
    CGFloat v12 = v11;

    CGAffineTransformMakeScale(&v15, v12, v12);
    CGAffineTransform v14 = v15;
    [(UIPinchGestureRecognizer *)self setTransform:&v14];
  }
  v13.receiver = self;
  v13.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  [(UIGestureRecognizer *)&v13 touchesBegan:v6 withEvent:v7];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  [(UIGestureRecognizer *)&v10 touchesMoved:a3 withEvent:v6];
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan)
  {
    id v7 = [(UIScrollViewPinchGestureRecognizer *)self scrollView];
    v8 = [v6 touchesForGestureRecognizer:self];
    char v9 = [v7 _canCancelContentTouches:v8];

    if ((v9 & 1) == 0) {
      [(UIGestureRecognizer *)self setState:5];
    }
  }
}

- (BOOL)_analyticsIsGestureHandled
{
  return 1;
}

- (void)_transformChangedWithEvent:(id)a3
{
  if ([a3 phase] == 1)
  {
    id v4 = [(UIScrollViewPinchGestureRecognizer *)self scrollView];
    [v4 zoomScale];
    CGFloat v6 = v5;

    CGAffineTransformMakeScale(&v8, v6, v6);
    CGAffineTransform v7 = v8;
    [(UIPinchGestureRecognizer *)self setTransform:&v7];
  }
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 18;
}

- (void).cxx_destruct
{
}

@end