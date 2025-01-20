@interface BKSwipeGestureRecognizer
- (BKSwipeGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (BOOL)_checkForSwipeWithDelta:(CGPoint)a3 time:(double)a4;
- (CGPoint)centroidOfTouches:(id)a3 excludingEnded:(BOOL)a4;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4;
- (CGPoint)startPoint;
- (double)maximumDuration;
- (double)maximumPrimaryMovement;
- (double)maximumSecondaryMovement;
- (double)minimumPrimaryMovement;
- (double)minimumSecondaryMovement;
- (double)rateOfMaximumMovementDecay;
- (double)rateOfMinimumMovementDecay;
- (unint64_t)direction;
- (unint64_t)numberOfTouches;
- (unint64_t)numberOfTouchesRequired;
- (void)_appendSubclassDescription:(id)a3;
- (void)reset;
- (void)setDirection:(unint64_t)a3;
- (void)setMaximumDuration:(double)a3;
- (void)setMaximumPrimaryMovement:(double)a3;
- (void)setMaximumSecondaryMovement:(double)a3;
- (void)setMinimumPrimaryMovement:(double)a3;
- (void)setMinimumSecondaryMovement:(double)a3;
- (void)setNumberOfTouchesRequired:(unint64_t)a3;
- (void)setRateOfMaximumMovementDecay:(double)a3;
- (void)setRateOfMinimumMovementDecay:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation BKSwipeGestureRecognizer

- (CGPoint)centroidOfTouches:(id)a3 excludingEnded:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (!v4 || (uint64_t)[*(id *)(*((void *)&v23 + 1) + 8 * i) phase] <= 2)
        {
          v14 = [v13 window];
          [v13 locationInView:0];
          [v14 convertPoint:0 toWindow:];
          double v16 = v15;
          double v18 = v17;

          double v9 = v9 + v16;
          double v10 = v10 + v18;
          double v11 = v11 + 1.0;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
    double v19 = 0.0;
    double v20 = 0.0;
    if (v11 > 0.0)
    {
      double v19 = v9 / v11;
      double v20 = v10 / v11;
    }
  }
  else
  {
    double v19 = 0.0;
    double v20 = 0.0;
  }

  double v21 = v19;
  double v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (BKSwipeGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BKSwipeGestureRecognizer;
  BOOL v4 = [(BKSwipeGestureRecognizer *)&v9 initWithTarget:a3 action:a4];
  id v5 = v4;
  if (v4)
  {
    v4->_maximumDuration = 0.5;
    v4->_minimumPrimaryMovement = 50.0;
    v4->_maximumPrimaryMovement = 3.40282347e38;
    v4->_minimumSecondaryMovement = 0.0;
    v4->_maximumSecondaryMovement = 200.0;
    v4->_rateOfMinimumMovementDecay = 0.06;
    v4->_rateOfMaximumMovementDecay = 0.02;
    v4->_direction = 1;
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    touches = v5->_touches;
    v5->_touches = v6;

    [(BKSwipeGestureRecognizer *)v5 setNumberOfTouchesRequired:1];
  }
  return v5;
}

- (CGPoint)startPoint
{
  v3 = [(BKSwipeGestureRecognizer *)self view];
  BOOL v4 = [(BKSwipeGestureRecognizer *)self view];
  id v5 = [v4 window];
  [v5 convertPoint:0 fromWindow:self->_startLocation.x, self->_startLocation.y];
  [v3 convertPoint:0 fromView:];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)reset
{
  self->_startLocation = CGPointZero;
  *((unsigned char *)self + 120) &= ~1u;
  [(NSMutableArray *)self->_touches removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)BKSwipeGestureRecognizer;
  [(BKSwipeGestureRecognizer *)&v3 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = v5;
  if ((*((unsigned char *)self + 120) & 1) == 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v12 = objc_getAssociatedObject(v11, &unk_32AAA0);

          if (!v12)
          {
            v13 = [v11 window];
            [v11 locationInView:0];
            [v13 convertPoint:0 toWindow:];
            double v15 = v14;
            double v17 = v16;

            double v18 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v15, v17);
            objc_setAssociatedObject(v11, &unk_32AAA0, v18, (char *)&def_7BFC0 + 1);
          }
          double v19 = objc_getAssociatedObject(v11, &unk_32AAA1);

          if (!v19)
          {
            double v20 = +[NSNumber numberWithDouble:CACurrentMediaTime()];
            objc_setAssociatedObject(v11, &unk_32AAA1, v20, (char *)&def_7BFC0 + 1);
          }
          [(NSMutableArray *)self->_touches addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }
    [(BKSwipeGestureRecognizer *)self centroidOfTouches:self->_touches excludingEnded:1];
    self->_startLocation.x = v21;
    self->_startLocation.y = v22;
  }
}

- (BOOL)_checkForSwipeWithDelta:(CGPoint)a3 time:(double)a4
{
  double minimumPrimaryMovement = self->_minimumPrimaryMovement;
  double v5 = fmin(a4, 0.5);
  double v6 = 1.0 - v5 * (1.0 - self->_rateOfMinimumMovementDecay);
  double v7 = minimumPrimaryMovement * v6;
  BOOL v8 = minimumPrimaryMovement == 3.40282347e38;
  double maximumPrimaryMovement = self->_maximumPrimaryMovement;
  if (v8) {
    double v7 = 3.40282347e38;
  }
  double v10 = 1.0 - v5 * (1.0 - self->_rateOfMaximumMovementDecay);
  if (maximumPrimaryMovement == 3.40282347e38) {
    double v11 = 3.40282347e38;
  }
  else {
    double v11 = maximumPrimaryMovement * v10;
  }
  double minimumSecondaryMovement = self->_minimumSecondaryMovement;
  double v13 = v6 * minimumSecondaryMovement;
  if (minimumSecondaryMovement == 3.40282347e38) {
    double v14 = 3.40282347e38;
  }
  else {
    double v14 = v13;
  }
  double maximumSecondaryMovement = self->_maximumSecondaryMovement;
  double v16 = v10 * maximumSecondaryMovement;
  if (maximumSecondaryMovement == 3.40282347e38) {
    double v17 = 3.40282347e38;
  }
  else {
    double v17 = v16;
  }
  unint64_t direction = self->_direction;
  unint64_t v19 = direction & 3;
  if (v19 == 1 && a3.x < 0.0) {
    goto LABEL_23;
  }
  if (v19 == 2 && a3.x > 0.0) {
    goto LABEL_23;
  }
  unint64_t v20 = direction & 0xC;
  if (v20 == 4 && a3.y > 0.0) {
    goto LABEL_23;
  }
  if (v20 == 8 && a3.y < 0.0) {
    goto LABEL_23;
  }
  if (v19)
  {
    double v21 = fabs(a3.x);
    if (v21 > v11 || (double v22 = fabs(a3.y), v22 > v17))
    {
LABEL_23:
      LOBYTE(v19) = 0;
LABEL_24:
      *((unsigned char *)self + 120) |= 1u;
      return v19;
    }
    LOBYTE(v19) = v22 >= v14 && v21 >= v7;
  }
  if (!v20) {
    return v19;
  }
  double v24 = fabs(a3.y);
  double v25 = fabs(a3.x);
  if (v24 > v11 || v25 > v17) {
    goto LABEL_24;
  }
  BOOL v27 = v24 >= v7;
  if (v25 < v14) {
    BOOL v27 = 0;
  }
  LOBYTE(v19) = v27 | v19;
  return v19;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5 = CACurrentMediaTime();
  if ((unint64_t)[(NSMutableArray *)self->_touches count] >= self->_numberOfTouchesRequired)
  {
    if (*((unsigned char *)self + 120)) {
      return;
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    double v6 = self->_touches;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v7)
    {
      id v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v42;
      double y = CGPointZero.y;
      do
      {
        v12 = v6;
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v12);
          }
          double v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          double v15 = [v14 window];
          [v14 locationInView:0];
          [v15 convertPoint:0 toWindow:];
          double v17 = v16;
          double v19 = v18;

          unint64_t v20 = objc_getAssociatedObject(v14, &unk_32AAA0);
          [v20 CGPointValue];
          double v22 = v17 - v21;
          double v24 = v19 - v23;
          double v25 = [(BKSwipeGestureRecognizer *)self view];
          long long v26 = [v25 window];

          if (v26)
          {
            BOOL v27 = [(BKSwipeGestureRecognizer *)self view];
            [v26 convertPoint:0 fromWindow:v22];
            [v27 convertPoint:0 fromView:];
            double v29 = v28;
            double v31 = v30;

            v32 = [(BKSwipeGestureRecognizer *)self view];
            [v26 convertPoint:0 fromWindow:CGPointZero.x, y];
            [v32 convertPoint:0 fromView:];
            double v34 = v33;
            double v36 = v35;

            double v22 = v29 - v34;
            double v24 = v31 - v36;
          }
          if (sqrt(v24 * v24 + v22 * v22) > 10.0)
          {
            v37 = objc_getAssociatedObject(v14, &unk_32AAA1);
            [v37 doubleValue];
            v9 |= -[BKSwipeGestureRecognizer _checkForSwipeWithDelta:time:](self, "_checkForSwipeWithDelta:time:", v22, v24, v5 - v38);
          }
        }
        double v6 = v12;
        id v8 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v8);

      if (v9)
      {
        v39 = self;
        uint64_t v40 = 3;
LABEL_22:
        [(BKSwipeGestureRecognizer *)v39 setState:v40];
        return;
      }
    }
    else
    {
    }
    if ((*((unsigned char *)self + 120) & 1) == 0) {
      return;
    }
    v39 = self;
    uint64_t v40 = 5;
    goto LABEL_22;
  }

  [(BKSwipeGestureRecognizer *)self setState:5];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_setAssociatedObject(v10, &unk_32AAA0, 0, (char *)&def_7BFC0 + 1);
        objc_setAssociatedObject(v10, &unk_32AAA1, 0, (char *)&def_7BFC0 + 1);
        [(NSMutableArray *)self->_touches removeObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  if ([(NSMutableArray *)self->_touches count]) {
    *((unsigned char *)self + 120) |= 1u;
  }
  else {
    [(BKSwipeGestureRecognizer *)self setState:5];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_setAssociatedObject(v10, &unk_32AAA0, 0, (char *)&def_7BFC0 + 1);
        objc_setAssociatedObject(v10, &unk_32AAA1, 0, (char *)&def_7BFC0 + 1);
        [(NSMutableArray *)self->_touches removeObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  if ([(NSMutableArray *)self->_touches count]) {
    *((unsigned char *)self + 120) |= 1u;
  }
  else {
    [(BKSwipeGestureRecognizer *)self setState:5];
  }
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 window];
  [v5 convertPoint:0 fromWindow:self->_startLocation.x, self->_startLocation.y];
  [v4 convertPoint:0 fromView:];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.x = v10;
  return result;
}

- (unint64_t)numberOfTouches
{
  return (unint64_t)[(NSMutableArray *)self->_touches count];
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  touches = self->_touches;
  id v6 = a4;
  double v7 = [(NSMutableArray *)touches objectAtIndex:a3];
  double v8 = objc_getAssociatedObject(v7, &unk_32AAA0);

  [v8 CGPointValue];
  double v10 = v9;
  double v12 = v11;
  long long v13 = [v6 window];
  [v13 convertPoint:0 fromWindow:v10];
  [v6 convertPoint:0 fromView:];
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.x = v18;
  return result;
}

- (void)_appendSubclassDescription:(id)a3
{
  id v4 = a3;
  unint64_t numberOfTouchesRequired = self->_numberOfTouchesRequired;
  id v9 = v4;
  if (numberOfTouchesRequired != 1)
  {
    [v4 appendFormat:@"; unint64_t numberOfTouchesRequired = %lu" numberOfTouchesRequired];
    id v4 = v9;
  }
  if (self->_direction)
  {
    [v4 appendString:@"; unint64_t direction = "];
    unint64_t direction = self->_direction;
    if (direction)
    {
      [v9 appendString:@"right"];
      unint64_t v8 = self->_direction;
      if ((v8 & 2) == 0)
      {
        if ((v8 & 4) == 0) {
          goto LABEL_16;
        }
        goto LABEL_11;
      }
      [v9 appendString:@","];
    }
    else if ((direction & 2) == 0)
    {
      id v4 = v9;
      if ((direction & 4) == 0)
      {
        int v7 = 0;
        if ((direction & 8) == 0) {
          goto LABEL_20;
        }
        goto LABEL_17;
      }
LABEL_12:
      [v9 appendString:@"up"];
      id v4 = v9;
      int v7 = 1;
      if ((self->_direction & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    [v9 appendString:@"left"];
    unint64_t v8 = self->_direction;
    if ((v8 & 4) == 0)
    {
LABEL_16:
      int v7 = 1;
      id v4 = v9;
      if ((v8 & 8) == 0) {
        goto LABEL_20;
      }
LABEL_17:
      if (v7) {
        [v9 appendString:@","];
      }
      [v9 appendString:@"down"];
      id v4 = v9;
      goto LABEL_20;
    }
LABEL_11:
    [v9 appendString:@","];
    goto LABEL_12;
  }
LABEL_20:
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (void)setMaximumDuration:(double)a3
{
  self->_maximumDuration = a3;
}

- (double)minimumPrimaryMovement
{
  return self->_minimumPrimaryMovement;
}

- (void)setMinimumPrimaryMovement:(double)a3
{
  self->_double minimumPrimaryMovement = a3;
}

- (double)maximumPrimaryMovement
{
  return self->_maximumPrimaryMovement;
}

- (void)setMaximumPrimaryMovement:(double)a3
{
  self->_double maximumPrimaryMovement = a3;
}

- (double)minimumSecondaryMovement
{
  return self->_minimumSecondaryMovement;
}

- (void)setMinimumSecondaryMovement:(double)a3
{
  self->_double minimumSecondaryMovement = a3;
}

- (double)maximumSecondaryMovement
{
  return self->_maximumSecondaryMovement;
}

- (void)setMaximumSecondaryMovement:(double)a3
{
  self->_double maximumSecondaryMovement = a3;
}

- (double)rateOfMinimumMovementDecay
{
  return self->_rateOfMinimumMovementDecay;
}

- (void)setRateOfMinimumMovementDecay:(double)a3
{
  self->_rateOfMinimumMovementDecadouble y = a3;
}

- (double)rateOfMaximumMovementDecay
{
  return self->_rateOfMaximumMovementDecay;
}

- (void)setRateOfMaximumMovementDecay:(double)a3
{
  self->_rateOfMaximumMovementDecadouble y = a3;
}

- (unint64_t)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
  self->_unint64_t numberOfTouchesRequired = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_unint64_t direction = a3;
}

- (void).cxx_destruct
{
}

@end