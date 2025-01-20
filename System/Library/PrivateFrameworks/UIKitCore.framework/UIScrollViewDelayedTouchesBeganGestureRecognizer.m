@interface UIScrollViewDelayedTouchesBeganGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
- (BOOL)_shouldMakeTimerForDelayedContentTouches:(id)a3;
- (id)_clientView;
- (void)_resetGestureRecognizer;
- (void)clearTimer;
- (void)dealloc;
- (void)sendDelayedTouches;
- (void)sendTouchesShouldBeginForDelayedTouches:(id)a3;
- (void)sendTouchesShouldBeginForTouches:(id)a3 withEvent:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIScrollViewDelayedTouchesBeganGestureRecognizer

- (void)_resetGestureRecognizer
{
  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self clearTimer];
  v3.receiver = self;
  v3.super_class = (Class)UIScrollViewDelayedTouchesBeganGestureRecognizer;
  [(UIGestureRecognizer *)&v3 _resetGestureRecognizer];
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (void)clearTimer
{
  [(UIDelayedAction *)self->_touchDelay unschedule];
  touchDelay = self->_touchDelay;
  self->_touchDelay = 0;
}

- (void)dealloc
{
  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self clearTimer];
  v3.receiver = self;
  v3.super_class = (Class)UIScrollViewDelayedTouchesBeganGestureRecognizer;
  [(UIGestureRecognizer *)&v3 dealloc];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v16 = a4;
  id v6 = a3;
  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self clearTimer];
  v7 = [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self _clientView];
  int v8 = [v7 delaysContentTouches];

  if (v8)
  {
    BOOL v9 = [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self _shouldMakeTimerForDelayedContentTouches:v6];

    if (v9)
    {
      v10 = [UIDelayedAction alloc];
      v11 = [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self _clientView];
      [v11 _touchDelayForScrollDetection];
      v12 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v10, "initWithTarget:action:userInfo:delay:mode:", self, sel_sendDelayedTouches, 0, *MEMORY[0x1E4F1C4B0]);
      touchDelay = self->_touchDelay;
      self->_touchDelay = v12;
    }
    id v6 = [(UIGestureRecognizer *)self _activeTouchesForEvent:v16];
    [(UIGestureRecognizer *)self _centroidOfTouches:v6 excludingEnded:0];
    self->_startSceneReferenceLocation.x = v14;
    self->_startSceneReferenceLocation.y = v15;
  }
  else
  {
    [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self sendTouchesShouldBeginForTouches:v6 withEvent:v16];
  }
}

- (void)sendTouchesShouldBeginForTouches:(id)a3 withEvent:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self clearTimer];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    uint64_t v20 = 5;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        CGFloat v14 = [v13 view];
        CGFloat v15 = [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self _clientView];
        int ShouldBegin = _UIViewTouchShouldBegin((uint64_t)v13, v7, v14, v15);

        if (ShouldBegin)
        {
          v17 = (void *)UIApp;
          v18 = [v13 window];
          id v19 = (id)[v17 _touchesEventForWindow:v18];

          [(UIGestureRecognizer *)self ignoreTouch:v13 forEvent:v19];
        }
        else
        {
          uint64_t v20 = 3;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v20 = 5;
  }

  [(UIGestureRecognizer *)self setState:v20];
}

- (id)_clientView
{
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  if (!WeakRetained)
  {
    id v5 = [(UIGestureRecognizer *)self view];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id WeakRetained = v5;
        objc_storeWeak((id *)p_client, WeakRetained);
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
    }
    id WeakRetained = 0;
    goto LABEL_11;
  }
LABEL_12:
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_touchDelay, 0);
}

- (void)sendTouchesShouldBeginForDelayedTouches:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self clearTimer];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v22 = *(void *)v24;
    uint64_t v20 = 5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * v7);
        if (v8)
        {
          id v9 = *(id *)(v8 + 24);
          id v10 = *(id *)(v8 + 48);
          uint64_t v11 = *(void **)(v8 + 32);
        }
        else
        {
          id v10 = 0;
          id v9 = 0;
          uint64_t v11 = 0;
        }
        id v12 = v11;
        v13 = [v12 view];
        CGFloat v14 = [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self _clientView];
        int ShouldBegin = _UIViewTouchShouldBegin((uint64_t)v9, v10, v13, v14);

        if (ShouldBegin)
        {
          if (v8)
          {
            id v16 = *(id *)(v8 + 24);
            v17 = *(void **)(v8 + 48);
          }
          else
          {
            id v16 = 0;
            v17 = 0;
          }
          id v18 = v17;
          [(UIGestureRecognizer *)self ignoreTouch:v16 forEvent:v18];
        }
        else
        {
          uint64_t v20 = 3;
        }
        ++v7;
      }
      while (v6 != v7);
      uint64_t v19 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v6 = v19;
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 5;
  }

  [(UIGestureRecognizer *)self setState:v20];
}

- (BOOL)_shouldMakeTimerForDelayedContentTouches:(id)a3
{
  return 1;
}

- (void)sendDelayedTouches
{
  if (self) {
    uint64_t v3 = [(NSMutableArray *)self->super._delayedTouches copy];
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self sendTouchesShouldBeginForDelayedTouches:v3];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  id v10 = v8;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v8);
        }
        CGFloat v14 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "view", (void)v34);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {

          id v10 = [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self _clientView];
          [v10 _scrollHysteresis];
          double v17 = v16;
          char v18 = [v10 _canScrollX];
          char v19 = [v10 _canScrollY];
          uint64_t v20 = [(UIGestureRecognizer *)self _activeTouchesForEvent:v7];
          [(UIGestureRecognizer *)self _centroidOfTouches:v20 excludingEnded:0];
          double v22 = v21;
          double v24 = v23;

          double v25 = v22 - self->_startSceneReferenceLocation.x;
          double v26 = v24 - self->_startSceneReferenceLocation.y;
          v27 = [(UIGestureRecognizer *)self view];
          uint64_t v28 = [v27 window];
          if (v28)
          {
            v29 = [v27 window];
            objc_msgSend(v29, "_convertOffsetFromSceneReferenceSpace:", v25, v26);
            double v25 = [(UIView *)v27 _convertOffset:v30 fromView:v31];
            double v26 = v32;
          }
          float v33 = v17;
          if ((v18 & 1) == 0 && fabs(v25) > v33 || (v19 & 1) == 0 && fabs(v26) > v33) {
            [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self sendDelayedTouches];
          }

          goto LABEL_18;
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    id v10 = v8;
  }
LABEL_18:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan)
  {
    uint64_t v5 = self;
    uint64_t v6 = 3;
LABEL_8:
    [(UIGestureRecognizer *)v5 setState:v6];
    return;
  }
  if (!self->_touchDelay)
  {
    uint64_t v5 = self;
    uint64_t v6 = 5;
    goto LABEL_8;
  }
  id v7 = (id)[(NSMutableArray *)self->super._delayedTouches copy];
  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self sendTouchesShouldBeginForDelayedTouches:v7];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self clearTimer];
  [(UIGestureRecognizer *)self setState:5];
}

@end