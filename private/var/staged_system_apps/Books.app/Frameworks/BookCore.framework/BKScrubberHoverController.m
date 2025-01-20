@interface BKScrubberHoverController
- (BKScrubberControl)scrubber;
- (BKScrubberHoverController)initWithScrubber:(id)a3;
- (UIHoverGestureRecognizer)gesture;
- (int64_t)gestureHoverState;
- (void)onHover:(id)a3;
- (void)setGesture:(id)a3;
- (void)setScrubber:(id)a3;
@end

@implementation BKScrubberHoverController

- (BKScrubberHoverController)initWithScrubber:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKScrubberHoverController;
  v5 = [(BKScrubberHoverController *)&v10 init];
  if (v5)
  {
    v6 = (UIHoverGestureRecognizer *)[objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:v5 action:"onHover:"];
    gesture = v5->_gesture;
    v5->_gesture = v6;

    v8 = [v4 window];
    [v8 addGestureRecognizer:v5->_gesture];

    objc_storeWeak((id *)&v5->_scrubber, v4);
  }

  return v5;
}

- (void)onHover:(id)a3
{
  id v4 = a3;
  id v5 = [(BKScrubberHoverController *)self gesture];

  if (v5 == v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubber);
    [WeakRetained updateHoverState];
  }
}

- (int64_t)gestureHoverState
{
  v3 = [(BKScrubberHoverController *)self gesture];
  if ((char *)[v3 state] - 1 > (unsigned char *)&def_7D91C + 1)
  {
    int64_t v7 = 0;
  }
  else
  {
    id v4 = [v3 view];
    if (v4
      && ([v3 locationInView:v4], double v6 = v5,
                                                   [v4 bounds],
                                                   v6 >= CGRectGetMaxY(v24) + -100.0))
    {
      p_scrubber = &self->_scrubber;
      id WeakRetained = objc_loadWeakRetained((id *)p_scrubber);
      [WeakRetained bounds];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      id v18 = objc_loadWeakRetained((id *)p_scrubber);
      [v3 locationInView:v18];
      v23.x = v19;
      v23.y = v20;
      v25.origin.x = v11;
      v25.origin.y = v13;
      v25.size.width = v15;
      v25.size.height = v17;
      BOOL v21 = CGRectContainsPoint(v25, v23);

      if (v21) {
        int64_t v7 = 2;
      }
      else {
        int64_t v7 = 1;
      }
    }
    else
    {
      int64_t v7 = 0;
    }
  }
  return v7;
}

- (UIHoverGestureRecognizer)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
}

- (BKScrubberControl)scrubber
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubber);

  return (BKScrubberControl *)WeakRetained;
}

- (void)setScrubber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrubber);

  objc_storeStrong((id *)&self->_gesture, 0);
}

@end