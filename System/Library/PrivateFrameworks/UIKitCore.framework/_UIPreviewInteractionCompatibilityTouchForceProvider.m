@interface _UIPreviewInteractionCompatibilityTouchForceProvider
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isActive;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (UIView)view;
- (_UIPreviewInteractionCompatibilityTouchForceProvider)initWithView:(id)a3;
- (double)touchForce;
- (void)_handleTouchObservingGestureRecognizer:(id)a3;
- (void)cancelInteraction;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
@end

@implementation _UIPreviewInteractionCompatibilityTouchForceProvider

- (_UIPreviewInteractionCompatibilityTouchForceProvider)initWithView:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UIPreviewInteractionCompatibilityTouchForceProvider.m", 37, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIPreviewInteractionCompatibilityTouchForceProvider;
  v6 = [(_UIPreviewInteractionCompatibilityTouchForceProvider *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_view, v5);
    v8 = +[UIDevice currentDevice];
    int v9 = [v8 _supportsForceTouch];

    if (v9)
    {
      v10 = objc_alloc_init(_UITouchesObservingGestureRecognizer);
      [(UIGestureRecognizer *)v10 setAllowedTouchTypes:&unk_1ED3F0CB8];
      [(UIGestureRecognizer *)v10 setCancelsTouchesInView:0];
      [(UIGestureRecognizer *)v10 setDelegate:v7];
      [(UIGestureRecognizer *)v10 addTarget:v7 action:sel__handleTouchObservingGestureRecognizer_];
      [v5 addGestureRecognizer:v10];
      gestureRecognizer = v7->_gestureRecognizer;
      v7->_gestureRecognizer = v10;
    }
    v12 = v7;
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(UIGestureRecognizer *)self->_gestureRecognizer view];
  [v3 removeGestureRecognizer:self->_gestureRecognizer];

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionCompatibilityTouchForceProvider;
  [(_UIPreviewInteractionCompatibilityTouchForceProvider *)&v4 dealloc];
}

- (double)touchForce
{
  return -[UITouch _unclampedForce](&self->_currentTouch->super.isa);
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  currentTouch = self->_currentTouch;
  if (currentTouch)
  {
    p_view = &self->_view;
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    [(UITouch *)currentTouch locationInView:WeakRetained];
    double v9 = v8;
    double v11 = v10;

    if (v4)
    {
      id v12 = objc_loadWeakRetained((id *)p_view);

      if (v12 != v4)
      {
        id v13 = objc_loadWeakRetained((id *)p_view);
        objc_msgSend(v13, "convertPoint:toCoordinateSpace:", v4, v9, v11);
        double v9 = v14;
        double v11 = v15;
      }
    }
  }
  else
  {
    double v11 = 1.79769313e308;
    double v9 = 1.79769313e308;
  }

  double v16 = v9;
  double v17 = v11;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)cancelInteraction
{
  [(UIGestureRecognizer *)self->_gestureRecognizer setEnabled:0];
  gestureRecognizer = self->_gestureRecognizer;
  [(UIGestureRecognizer *)gestureRecognizer setEnabled:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = (UITouch *)a4;
  if (-[UITouch _mightBeConsideredForForceSystemGesture](v5))
  {
    BOOL v6 = 0;
  }
  else
  {
    currentTouch = self->_currentTouch;
    if (currentTouch) {
      BOOL v8 = currentTouch == v5;
    }
    else {
      BOOL v8 = 1;
    }
    BOOL v6 = v8;
  }

  return v6;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v3 = [a3 view];
  char v4 = _UIPreviewInteractionAllowedToBeginForView(v3);

  return v4;
}

- (void)_handleTouchObservingGestureRecognizer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 1 || objc_msgSend(v4, "state") == 2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_msgSend(v4, "touches", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          if (-[UITouch _mightBeConsideredForForceSystemGesture](*(void **)(*((void *)&v13 + 1) + 8 * v9)))
          {
            [(_UIPreviewInteractionCompatibilityTouchForceProvider *)self cancelInteraction];
            goto LABEL_19;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  if ([v4 state] == 1)
  {
    double v10 = [v4 touches];
    double v11 = [v10 anyObject];
    currentTouch = self->_currentTouch;
    self->_currentTouch = v11;

    [(_UIPreviewInteractionCompatibilityTouchForceProvider *)self setActive:1];
  }
  if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
    [(_UIPreviewInteractionCompatibilityTouchForceProvider *)self setActive:0];
    id v5 = self->_currentTouch;
    self->_currentTouch = 0;
LABEL_19:
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouch, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end