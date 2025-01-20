@interface StocksTapDragGestureRecognizer
- (CGRect)touchableBounds;
- (NSSet)touches;
- (StocksTapDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)requiredPressDelay;
- (unint64_t)maximumNumberOfTouches;
- (unint64_t)minimumNumberOfTouches;
- (void)reset;
- (void)setMaximumNumberOfTouches:(unint64_t)a3;
- (void)setMinimumNumberOfTouches:(unint64_t)a3;
- (void)setRequiredPressDelay:(double)a3;
- (void)setTouchableBounds:(CGRect)a3;
- (void)touchDelayTimerFired:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation StocksTapDragGestureRecognizer

- (StocksTapDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)StocksTapDragGestureRecognizer;
  result = [(StocksTapDragGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result)
  {
    result->_minimumNumberOfTouches = 1;
    result->_maximumNumberOfTouches = 1;
  }
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v45 = a4;
  if (CGRectEqualToRect(self->_touchableBounds, *MEMORY[0x263F001A8]))
  {
    v7 = (void *)[v6 mutableCopy];
  }
  else
  {
    v7 = [MEMORY[0x263EFF9C0] set];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v44 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v14 = [(StocksTapDragGestureRecognizer *)self view];
          [v13 locationInView:v14];
          v57.x = v15;
          v57.y = v16;
          BOOL v17 = CGRectContainsPoint(self->_touchableBounds, v57);

          if (v17) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v10);
    }

    id v6 = v44;
  }
  touches = self->_touches;
  if (!touches)
  {
    if ([v7 count] <= self->_maximumNumberOfTouches)
    {
      v33 = v7;
      v28 = self->_touches;
      self->_touches = v33;
    }
    else
    {
      id v26 = v6;
      v27 = (void *)MEMORY[0x263EFF9C0];
      v28 = [v7 allObjects];
      v29 = objc_msgSend(v28, "subarrayWithRange:", 0, self->_maximumNumberOfTouches);
      v30 = v27;
      id v6 = v26;
      v31 = [v30 setWithArray:v29];
      v32 = self->_touches;
      self->_touches = v31;
    }
    if ([(NSMutableSet *)self->_touches count] < self->_minimumNumberOfTouches) {
      goto LABEL_43;
    }
    if ([(NSMutableSet *)self->_touches count] == 1 && self->_requiredPressDelay > 0.0)
    {
      objc_msgSend(MEMORY[0x263EFFA20], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_touchDelayTimerFired_, 0, 0);
      v34 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      touchDelayTimer = self->_touchDelayTimer;
      self->_touchDelayTimer = v34;

      p_startingPosition = &self->_startingPosition;
      v37 = [(NSMutableSet *)self->_touches anyObject];
      v38 = [(StocksTapDragGestureRecognizer *)self view];
      [v37 locationInView:v38];
      p_startingPosition->x = v39;
      p_startingPosition->y = v40;

      goto LABEL_43;
    }
LABEL_41:
    v42 = self;
    uint64_t v43 = 1;
    goto LABEL_42;
  }
  if ([(NSMutableSet *)touches count] >= self->_maximumNumberOfTouches) {
    goto LABEL_43;
  }
  id v44 = v6;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v19 = v7;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    char v22 = 0;
    uint64_t v23 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8 * j);
        if ([(NSMutableSet *)self->_touches count] >= self->_maximumNumberOfTouches)
        {
          [(StocksTapDragGestureRecognizer *)self ignoreTouch:v25 forEvent:v45];
        }
        else
        {
          [(NSMutableSet *)self->_touches addObject:v25];
          char v22 = 1;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v21);
  }
  else
  {
    char v22 = 0;
  }

  v41 = self->_touchDelayTimer;
  if (v41)
  {
    [(NSTimer *)v41 fire];
    id v6 = v44;
    goto LABEL_43;
  }
  id v6 = v44;
  if (![(StocksTapDragGestureRecognizer *)self state]
    && [(NSMutableSet *)self->_touches count] >= self->_minimumNumberOfTouches)
  {
    goto LABEL_41;
  }
  if ((v22 & 1) != 0 && [(StocksTapDragGestureRecognizer *)self state] == 2)
  {
    v42 = self;
    uint64_t v43 = 2;
LABEL_42:
    -[StocksTapDragGestureRecognizer setState:](v42, "setState:", v43, v44);
  }
LABEL_43:
}

- (void)touchDelayTimerFired:(id)a3
{
  [(NSTimer *)self->_touchDelayTimer invalidate];
  touchDelayTimer = self->_touchDelayTimer;
  self->_touchDelayTimer = 0;

  [(StocksTapDragGestureRecognizer *)self setState:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v15 = a3;
  objc_super v5 = [v15 anyObject];
  id v6 = [(StocksTapDragGestureRecognizer *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  touchDelayTimer = self->_touchDelayTimer;
  if (touchDelayTimer)
  {
    double v12 = vabdd_f64(v10, self->_startingPosition.y);
    if (vabdd_f64(v8, self->_startingPosition.x) > 5.0 || v12 > 5.0)
    {
      [(NSTimer *)touchDelayTimer invalidate];
      v14 = self->_touchDelayTimer;
      self->_touchDelayTimer = 0;
    }
  }
  if ([(NSMutableSet *)self->_touches intersectsSet:v15]
    && [(StocksTapDragGestureRecognizer *)self state] == 2)
  {
    [(StocksTapDragGestureRecognizer *)self setState:2];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  if ([(NSMutableSet *)self->_touches intersectsSet:v6])
  {
    [(NSMutableSet *)self->_touches minusSet:v6];
    if ([(NSMutableSet *)self->_touches count] >= self->_minimumNumberOfTouches)
    {
      uint64_t v5 = 2;
    }
    else if (self->_touchDelayTimer)
    {
      uint64_t v5 = 5;
    }
    else
    {
      uint64_t v5 = 3;
    }
    [(StocksTapDragGestureRecognizer *)self setState:v5];
  }

  MEMORY[0x270F9A790]();
}

- (void)reset
{
  touches = self->_touches;
  self->_touches = 0;

  [(NSTimer *)self->_touchDelayTimer invalidate];
  touchDelayTimer = self->_touchDelayTimer;
  self->_touchDelayTimer = 0;

  self->_startingPosition = (CGPoint)*MEMORY[0x263F00148];
}

- (NSSet)touches
{
  return &self->_touches->super;
}

- (double)requiredPressDelay
{
  return self->_requiredPressDelay;
}

- (void)setRequiredPressDelay:(double)a3
{
  self->_requiredPressDelay = a3;
}

- (unint64_t)minimumNumberOfTouches
{
  return self->_minimumNumberOfTouches;
}

- (void)setMinimumNumberOfTouches:(unint64_t)a3
{
  self->_minimumNumberOfTouches = a3;
}

- (unint64_t)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (void)setMaximumNumberOfTouches:(unint64_t)a3
{
  self->_maximumNumberOfTouches = a3;
}

- (CGRect)touchableBounds
{
  double x = self->_touchableBounds.origin.x;
  double y = self->_touchableBounds.origin.y;
  double width = self->_touchableBounds.size.width;
  double height = self->_touchableBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTouchableBounds:(CGRect)a3
{
  self->_touchableBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);

  objc_storeStrong((id *)&self->_touchDelayTimer, 0);
}

@end