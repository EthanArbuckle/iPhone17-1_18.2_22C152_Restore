@interface SUUIFocusedTouchGestureRecognizer
- (SUUIFocusedTouchGestureRecognizer)initWithFocusedView:(id)a3 touchAllowance:(UIEdgeInsets)a4;
- (UIEdgeInsets)touchAllowance;
- (UIView)focusedView;
- (void)reset;
- (void)setTouchAllowance:(UIEdgeInsets)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SUUIFocusedTouchGestureRecognizer

- (SUUIFocusedTouchGestureRecognizer)initWithFocusedView:(id)a3 touchAllowance:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v11 = a3;
  if (v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)SUUIFocusedTouchGestureRecognizer;
    v12 = [(SUUIFocusedTouchGestureRecognizer *)&v17 initWithTarget:0 action:0];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_focusedView, a3);
      v13->_touchAllowance.CGFloat top = top;
      v13->_touchAllowance.CGFloat left = left;
      v13->_touchAllowance.CGFloat bottom = bottom;
      v13->_touchAllowance.CGFloat right = right;
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SUUIFocusedTouchGestureRecognizer.m" lineNumber:20 description:@"A focused view is required."];

    v14 = 0;
  }

  return v14;
}

- (void)reset
{
  activeTouches = self->_activeTouches;
  self->_activeTouches = 0;

  self->_didTouchOutside = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUIFocusedTouchGestureRecognizer;
  [(SUUIFocusedTouchGestureRecognizer *)&v4 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (self->_didTouchOutside) {
    goto LABEL_27;
  }
  id v32 = v7;
  obuint64_t j = v6;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        [v14 locationInView:self->_focusedView];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        [(UIView *)self->_focusedView bounds];
        double left = self->_touchAllowance.left;
        v46.origin.x = v20 + left;
        v46.origin.y = v21 + self->_touchAllowance.top;
        v46.size.width = v22 - (left + self->_touchAllowance.right);
        v46.size.height = v23 - (self->_touchAllowance.top + self->_touchAllowance.bottom);
        v45.x = v16;
        v45.y = v18;
        if (CGRectContainsPoint(v46, v45))
        {
          if (!v11) {
            id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          }
          [v11 addObject:v14];
        }
        else
        {
          self->_didTouchOutside = 1;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }
  if (self->_didTouchOutside)
  {
    [(SUUIFocusedTouchGestureRecognizer *)self setState:1];
    v8 = v32;
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v24 = v11;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
    v8 = v32;
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          [(SUUIFocusedTouchGestureRecognizer *)self ignoreTouch:*(void *)(*((void *)&v34 + 1) + 8 * j) forEvent:v32];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v26);
    }
  }
  id v6 = obj;
  if (self->_didTouchOutside)
  {
LABEL_27:
    activeTouches = self->_activeTouches;
    if (activeTouches)
    {
      [(NSMutableSet *)activeTouches unionSet:v6];
    }
    else
    {
      v30 = (NSMutableSet *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v6];
      v31 = self->_activeTouches;
      self->_activeTouches = v30;
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", a3, a4);
  if (![(NSMutableSet *)self->_activeTouches count])
  {
    if (self->_didTouchOutside) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 5;
    }
    [(SUUIFocusedTouchGestureRecognizer *)self setState:v5];
    activeTouches = self->_activeTouches;
    self->_activeTouches = 0;
  }
}

- (UIView)focusedView
{
  return self->_focusedView;
}

- (UIEdgeInsets)touchAllowance
{
  double top = self->_touchAllowance.top;
  double left = self->_touchAllowance.left;
  double bottom = self->_touchAllowance.bottom;
  double right = self->_touchAllowance.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchAllowance:(UIEdgeInsets)a3
{
  self->_touchAllowance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedView, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

@end