@interface NCNotificationListTouchEaterManager
- (BOOL)_isPointInWindowSpace:(CGPoint)a3 insideView:(id)a4;
- (BOOL)_shouldReceiveTouch:(id)a3 forGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isEnabled;
- (NCNotificationListCoalescingControlsHandler)coalescingControlsHandlerInClearState;
- (NCNotificationListSectionHeaderView)headerViewInClearState;
- (NCTouchEaterGestureRecognizer)touchEater;
- (PLSwipeInteraction)swipeInteractionInRevealedState;
- (id)initForView:(id)a3;
- (void)_handleEatenTouch:(id)a3;
- (void)_handleEatenTouchBeginStateForGestureRecognizer:(id)a3;
- (void)_handleEatenTouchEndStateForGestureRecognizer:(id)a3;
- (void)removeTouchGestureRecognizer;
- (void)setCoalescingControlsHandlerInClearState:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHeaderViewInClearState:(id)a3;
- (void)setSwipeInteractionInRevealedState:(id)a3;
- (void)setTouchEater:(id)a3;
- (void)setTouchEaterEnabled:(BOOL)a3;
@end

@implementation NCNotificationListTouchEaterManager

- (id)initForView:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationListTouchEaterManager;
  v5 = [(NCNotificationListTouchEaterManager *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 window];
    v7 = (void *)v6;
    touchEater = v5->_touchEater;
    if (touchEater) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v6 == 0;
    }
    if (!v9)
    {
      v10 = [[NCTouchEaterGestureRecognizer alloc] initWithTarget:v5 action:sel__handleEatenTouch_];
      v11 = v5->_touchEater;
      v5->_touchEater = v10;

      [(NCTouchEaterGestureRecognizer *)v5->_touchEater setDelegate:v5];
      [(NCTouchEaterGestureRecognizer *)v5->_touchEater setEnabled:0];
      touchEater = v5->_touchEater;
    }
    [v7 addGestureRecognizer:touchEater];
  }
  return v5;
}

- (void)setHeaderViewInClearState:(id)a3
{
  id obj = a3;
  id v4 = [(NCNotificationListTouchEaterManager *)self headerViewInClearState];
  if (v4 != obj)
  {
    [v4 resetClearButtonStateAnimated:1];
    objc_storeWeak((id *)&self->_headerViewInClearState, obj);
  }
  [(NCNotificationListTouchEaterManager *)self setTouchEaterEnabled:obj != 0];
}

- (void)setCoalescingControlsHandlerInClearState:(id)a3
{
  id obj = a3;
  id v4 = [(NCNotificationListTouchEaterManager *)self coalescingControlsHandlerInClearState];
  if (v4 != obj)
  {
    [v4 resetClearButtonStateAnimated:1];
    objc_storeWeak((id *)&self->_coalescingControlsHandlerInClearState, obj);
  }
  [(NCNotificationListTouchEaterManager *)self setTouchEaterEnabled:obj != 0];
}

- (void)setSwipeInteractionInRevealedState:(id)a3
{
  id obj = a3;
  id v4 = [(NCNotificationListTouchEaterManager *)self swipeInteractionInRevealedState];
  id v5 = obj;
  uint64_t v6 = v4;
  if (v4 != obj)
  {
    if (obj) {
      [v4 hideActionsAnimated:1 fastAnimation:0 completion:0];
    }
    objc_storeWeak((id *)&self->_swipeInteractionInRevealedState, obj);
    id v5 = obj;
  }
  [(NCNotificationListTouchEaterManager *)self setTouchEaterEnabled:v5 != 0];
}

- (void)setTouchEaterEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationListTouchEaterManager *)self touchEater];
  [v4 setEnabled:v3];
}

- (void)removeTouchGestureRecognizer
{
  id v3 = [(NCTouchEaterGestureRecognizer *)self->_touchEater view];
  [v3 removeGestureRecognizer:self->_touchEater];
}

- (void)setEnabled:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(NCNotificationListTouchEaterManager *)self swipeInteractionInRevealedState];
    if (v4)
    {
      BOOL v5 = 1;
    }
    else
    {
      v8 = [(NCNotificationListTouchEaterManager *)self headerViewInClearState];
      if (v8)
      {
        BOOL v5 = 1;
      }
      else
      {
        BOOL v9 = [(NCNotificationListTouchEaterManager *)self coalescingControlsHandlerInClearState];
        BOOL v5 = v9 != 0;
      }
    }

    uint64_t v6 = [(NCNotificationListTouchEaterManager *)self touchEater];
    id v10 = v6;
    BOOL v7 = v5;
  }
  else
  {
    uint64_t v6 = [(NCNotificationListTouchEaterManager *)self touchEater];
    id v10 = v6;
    BOOL v7 = 0;
  }
  [v6 setEnabled:v7];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_touchEater != a3
      || [(NCNotificationListTouchEaterManager *)self _shouldReceiveTouch:a4 forGestureRecognizer:a3];
}

- (void)_handleEatenTouch:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3) {
    [(NCNotificationListTouchEaterManager *)self _handleEatenTouchBeginStateForGestureRecognizer:v4];
  }
  [(NCNotificationListTouchEaterManager *)self _handleEatenTouchEndStateForGestureRecognizer:v4];
}

- (BOOL)_isPointInWindowSpace:(CGPoint)a3 insideView:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = a4;
  [v6 bounds];
  objc_msgSend(v6, "convertRect:toView:", 0);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;

  uint64_t v15 = v8;
  uint64_t v16 = v10;
  uint64_t v17 = v12;
  uint64_t v18 = v14;
  CGFloat v19 = x;
  CGFloat v20 = y;

  return CGRectContainsPoint(*(CGRect *)&v15, *(CGPoint *)&v19);
}

- (BOOL)_shouldReceiveTouch:(id)a3 forGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(NCNotificationListTouchEaterManager *)self swipeInteractionInRevealedState];
  if (v6)
  {
    [v5 locationInView:0];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = [v6 view];
    BOOL v12 = -[NCNotificationListTouchEaterManager _isPointInWindowSpace:insideView:](self, "_isPointInWindowSpace:insideView:", v11, v8, v10);

    if (!v12) {
      [v6 hideActionsAnimated:1 fastAnimation:0 completion:0];
    }
  }
  uint64_t v13 = [(NCNotificationListTouchEaterManager *)self coalescingControlsHandlerInClearState];
  [v5 locationInView:0];
  double v16 = v14;
  double v17 = v15;
  if (v13 && (objc_msgSend(v13, "shouldReceiveTouchAtPointInWindowSpace:", v14, v15) & 1) == 0) {
    [v13 resetClearButtonStateAnimated:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerViewInClearState);
  CGFloat v19 = WeakRetained;
  if (WeakRetained)
  {
    CGFloat v20 = [WeakRetained clearButton];
    objc_msgSend(v20, "convertPoint:fromView:", 0, v16, v17);
    if ((objc_msgSend(v20, "pointInside:withEvent:", 0) & 1) == 0) {
      [v19 resetClearButtonStateAnimated:1];
    }
  }
  return 0;
}

- (void)_handleEatenTouchBeginStateForGestureRecognizer:(id)a3
{
  id v4 = [(NCNotificationListTouchEaterManager *)self swipeInteractionInRevealedState];
  [v4 hideActionsAnimated:1 fastAnimation:0 completion:0];

  id v5 = [(NCNotificationListTouchEaterManager *)self headerViewInClearState];
  [v5 resetClearButtonStateAnimated:1];

  id v6 = [(NCNotificationListTouchEaterManager *)self coalescingControlsHandlerInClearState];
  [v6 resetClearButtonStateAnimated:1];
}

- (void)_handleEatenTouchEndStateForGestureRecognizer:(id)a3
{
  [(NCNotificationListTouchEaterManager *)self setSwipeInteractionInRevealedState:0];
  [(NCNotificationListTouchEaterManager *)self setHeaderViewInClearState:0];

  [(NCNotificationListTouchEaterManager *)self setCoalescingControlsHandlerInClearState:0];
}

- (PLSwipeInteraction)swipeInteractionInRevealedState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swipeInteractionInRevealedState);

  return (PLSwipeInteraction *)WeakRetained;
}

- (NCNotificationListSectionHeaderView)headerViewInClearState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerViewInClearState);

  return (NCNotificationListSectionHeaderView *)WeakRetained;
}

- (NCNotificationListCoalescingControlsHandler)coalescingControlsHandlerInClearState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coalescingControlsHandlerInClearState);

  return (NCNotificationListCoalescingControlsHandler *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NCTouchEaterGestureRecognizer)touchEater
{
  return self->_touchEater;
}

- (void)setTouchEater:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchEater, 0);
  objc_destroyWeak((id *)&self->_coalescingControlsHandlerInClearState);
  objc_destroyWeak((id *)&self->_headerViewInClearState);

  objc_destroyWeak((id *)&self->_swipeInteractionInRevealedState);
}

@end