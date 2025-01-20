@interface UISwipeGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
+ (BOOL)supportsSecureCoding;
- (BOOL)_isGestureType:(int64_t)a3;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4;
- (NSUInteger)numberOfTouchesRequired;
- (UISwipeGestureRecognizer)initWithCoder:(id)a3;
- (UISwipeGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UISwipeGestureRecognizerDirection)direction;
- (double)maximumDuration;
- (double)startPoint;
- (unint64_t)numberOfTouches;
- (void)_appendSubclassDescription:(id)a3;
- (void)_resetGestureRecognizer;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDirection:(UISwipeGestureRecognizerDirection)direction;
- (void)setMaximumDuration:(double)a3;
- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UISwipeGestureRecognizer

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (void)setDirection:(UISwipeGestureRecognizerDirection)direction
{
  self->_direction = direction;
}

- (UISwipeGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UISwipeGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    _UISwipeGestureRecognizerCommonInit(v4);
    v6 = v5;
  }

  return v5;
}

- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired
{
  if (self->_numberOfTouchesRequired != numberOfTouchesRequired)
  {
    self->_numberOfTouchesRequired = numberOfTouchesRequired;
    startLocations = self->_startLocations;
    size_t v5 = 16 * numberOfTouchesRequired;
    if (startLocations) {
      v6 = (CGPoint *)malloc_type_realloc(startLocations, 16 * numberOfTouchesRequired, 0x1000040451B5BE8uLL);
    }
    else {
      v6 = (CGPoint *)malloc_type_malloc(16 * numberOfTouchesRequired, 0x1000040451B5BE8uLL);
    }
    self->_startLocations = v6;
    previousLocations = self->_previousLocations;
    if (previousLocations) {
      objc_super v8 = (CGPoint *)malloc_type_realloc(previousLocations, v5, 0x1000040451B5BE8uLL);
    }
    else {
      objc_super v8 = (CGPoint *)malloc_type_malloc(v5, 0x1000040451B5BE8uLL);
    }
    self->_previousLocations = v8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISwipeGestureRecognizer)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UISwipeGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithCoder:](&v8, sel_initWithCoder_);
  size_t v5 = v4;
  if (v4)
  {
    _UISwipeGestureRecognizerCommonInit(v4);
    if ([a3 containsValueForKey:@"UISwipeGestureRecognizer.numberOfTouchesRequired"])v5->_numberOfTouchesRequired = objc_msgSend(a3, "decodeIntegerForKey:", @"UISwipeGestureRecognizer.numberOfTouchesRequired"); {
    if ([a3 containsValueForKey:@"UISwipeGestureRecognizer.direction"])
    }
      v5->_direction = [a3 decodeIntegerForKey:@"UISwipeGestureRecognizer.direction"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UISwipeGestureRecognizer;
  -[UIGestureRecognizer encodeWithCoder:](&v7, sel_encodeWithCoder_);
  unint64_t numberOfTouchesRequired = self->_numberOfTouchesRequired;
  if (numberOfTouchesRequired != 1) {
    [a3 encodeInteger:numberOfTouchesRequired forKey:@"UISwipeGestureRecognizer.numberOfTouchesRequired"];
  }
  unint64_t direction = self->_direction;
  if (direction != 1) {
    [a3 encodeInteger:direction forKey:@"UISwipeGestureRecognizer.direction"];
  }
}

- (void)dealloc
{
  startLocations = self->_startLocations;
  if (startLocations) {
    free(startLocations);
  }
  previousLocations = self->_previousLocations;
  if (previousLocations) {
    free(previousLocations);
  }
  v5.receiver = self;
  v5.super_class = (Class)UISwipeGestureRecognizer;
  [(UIGestureRecognizer *)&v5 dealloc];
}

- (double)startPoint
{
  if (!a1) {
    return 0.0;
  }
  v2 = [a1 view];
  v3 = [v2 window];
  objc_msgSend(v3, "_convertPointFromSceneReferenceSpace:", a1[46], a1[47]);
  objc_msgSend(v2, "convertPoint:fromView:", 0);
  double v5 = v4;

  return v5;
}

- (void)_resetGestureRecognizer
{
  self->_startLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_failed = 0;
  [(NSMutableArray *)self->_touches removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)UISwipeGestureRecognizer;
  [(UIGestureRecognizer *)&v3 _resetGestureRecognizer];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_failed
    || (uint64_t v6 = [(NSMutableArray *)self->_touches count],
        [a3 count] + v6 > self->_numberOfTouchesRequired))
  {
    self->_failed = 1;
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = a3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          startLocations = self->_startLocations;
          p_x = (void *)&startLocations[[(NSMutableArray *)self->_touches count]].x;
          v15 = [v12 window];
          [v12 locationInView:0];
          objc_msgSend(v15, "_convertPointToSceneReferenceSpace:");
          void *p_x = v16;
          p_x[1] = v17;

          previousLocations = self->_previousLocations;
          v19 = (void *)&previousLocations[[(NSMutableArray *)self->_touches count]].x;
          v20 = [v12 window];
          [v12 locationInView:0];
          objc_msgSend(v20, "_convertPointToSceneReferenceSpace:");
          void *v19 = v21;
          v19[1] = v22;

          [(NSMutableArray *)self->_touches addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }

    [(UIGestureRecognizer *)self _centroidOfTouches:self->_touches excludingEnded:1];
    self->_startLocation.x = v23;
    self->_startLocation.y = v24;
    double v25 = _TimestampForTouches(self->_touches);
    self->_startTime = v25;
    self->_previousTime = v25;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  double v5 = _TimestampForTouches(self->_touches);
  if (v5 - self->_startTime > self->_maximumDuration
    && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    goto LABEL_63;
  }
  if (!self->_failed)
  {
    int v6 = [(NSMutableArray *)self->_touches count] == self->_numberOfTouchesRequired;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obj = self->_touches;
    uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (!v7) {
      goto LABEL_60;
    }
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v64;
    double v61 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v62 = *MEMORY[0x1E4F1DAD8];
    while (1)
    {
      uint64_t v11 = 0;
      unint64_t v59 = v9;
      unint64_t v12 = v9;
      do
      {
        if (*(void *)v64 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v63 + 1) + 8 * v11);
        v14 = [v13 window];
        [v13 locationInView:0];
        objc_msgSend(v14, "_convertPointToSceneReferenceSpace:");
        double v16 = v15;
        double v18 = v17;

        v19 = &self->_startLocations[v12];
        double v20 = v16 - v19->x;
        double v21 = v18 - v19->y;
        uint64_t v22 = [(UIGestureRecognizer *)self view];
        CGFloat v23 = [v22 _window];
        CGFloat v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "_convertPointFromSceneReferenceSpace:", v20, v21);
          objc_msgSend(v22, "convertPoint:fromView:", 0);
          double v26 = v25;
          double v28 = v27;
          objc_msgSend(v24, "_convertPointFromSceneReferenceSpace:", v62, v61);
          objc_msgSend(v22, "convertPoint:fromView:", 0);
          double v20 = v26 - v29;
          double v21 = v28 - v30;
        }
        previousLocations = self->_previousLocations;
        double minimumPrimaryMovement = self->_minimumPrimaryMovement;
        double v33 = fmin(v5 - self->_startTime, 0.5);
        double v34 = 1.0 - v33 * (1.0 - self->_rateOfMinimumMovementDecay);
        double v35 = minimumPrimaryMovement * v34;
        BOOL v36 = minimumPrimaryMovement == 3.40282347e38;
        double maximumPrimaryMovement = self->_maximumPrimaryMovement;
        if (v36) {
          double v35 = 3.40282347e38;
        }
        double v38 = 1.0 - v33 * (1.0 - self->_rateOfMaximumMovementDecay);
        if (maximumPrimaryMovement == 3.40282347e38) {
          double v39 = 3.40282347e38;
        }
        else {
          double v39 = maximumPrimaryMovement * v38;
        }
        double minimumSecondaryMovement = self->_minimumSecondaryMovement;
        double v41 = v34 * minimumSecondaryMovement;
        if (minimumSecondaryMovement == 3.40282347e38) {
          double v41 = 3.40282347e38;
        }
        double maximumSecondaryMovement = self->_maximumSecondaryMovement;
        double v43 = v38 * maximumSecondaryMovement;
        if (maximumSecondaryMovement == 3.40282347e38) {
          double v43 = 3.40282347e38;
        }
        unint64_t direction = self->_direction;
        unint64_t v45 = direction & 3;
        if (v45 == 2)
        {
          if (v20 > self->_maximumOppositeMovement) {
            goto LABEL_35;
          }
        }
        else if (v45 == 1 && v20 < -self->_maximumOppositeMovement)
        {
LABEL_35:
          LODWORD(v45) = 0;
LABEL_36:
          self->_failed = 1;
          goto LABEL_37;
        }
        unint64_t v46 = direction & 0xC;
        if (v46 == 8)
        {
          if (v21 < -self->_maximumOppositeMovement) {
            goto LABEL_35;
          }
        }
        else if (v46 == 4 && v21 > self->_maximumOppositeMovement)
        {
          goto LABEL_35;
        }
        double v47 = v5 - self->_previousTime;
        if (v47 < 0.01) {
          double v47 = 0.01;
        }
        if (v45)
        {
          double v48 = fabs(v20);
          if (v48 > v39) {
            goto LABEL_35;
          }
          double v49 = fabs(v21);
          if (v49 > v43) {
            goto LABEL_35;
          }
          BOOL v51 = v48 < v35 || v49 < v41;
          if (!v51 && fabs((v16 - previousLocations[v12].x) / v47) >= self->_minimumPrimaryMovementRate)
          {
            LODWORD(v45) = 1;
            if (!v46) {
              goto LABEL_37;
            }
            goto LABEL_46;
          }
          LODWORD(v45) = 0;
        }
        if (!v46) {
          goto LABEL_37;
        }
LABEL_46:
        double v52 = fabs(v21);
        BOOL v51 = v52 <= v39;
        double v53 = fabs(v20);
        if (!v51 || v53 > v43) {
          goto LABEL_36;
        }
        BOOL v55 = v52 < v35 || v53 < v41;
        if (!v55 && fabs((v18 - previousLocations[v12].y) / v47) >= self->_minimumPrimaryMovementRate) {
          LODWORD(v45) = 1;
        }
LABEL_37:
        v6 &= v45;
        p_x = &previousLocations[v12].x;
        double *p_x = v16;
        p_x[1] = v18;

        ++v11;
        ++v12;
      }
      while (v8 != v11);
      uint64_t v56 = [(NSMutableArray *)obj countByEnumeratingWithState:&v63 objects:v67 count:16];
      uint64_t v8 = v56;
      unint64_t v9 = v59 + v11;
      if (!v56)
      {
LABEL_60:

        if (v6)
        {
          v57 = self;
          uint64_t v58 = 3;
          goto LABEL_64;
        }
        if (self->_failed)
        {
LABEL_63:
          v57 = self;
          uint64_t v58 = 5;
LABEL_64:
          [(UIGestureRecognizer *)v57 setState:v58];
        }
        break;
      }
    }
  }
  self->_previousTime = v5;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableArray removeObject:](self->_touches, "removeObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ([(NSMutableArray *)self->_touches count]) {
    self->_failed = 1;
  }
  else {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableArray removeObject:](self->_touches, "removeObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ([(NSMutableArray *)self->_touches count]) {
    self->_failed = 1;
  }
  else {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (CGPoint)locationInView:(id)a3
{
  id v5 = [a3 window];
  objc_msgSend(v5, "_convertPointFromSceneReferenceSpace:", self->_startLocation.x, self->_startLocation.y);
  objc_msgSend(a3, "convertPoint:fromView:", 0);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (unint64_t)numberOfTouches
{
  return [(NSMutableArray *)self->_touches count];
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  double v7 = [a4 window];
  objc_msgSend(v7, "_convertPointFromSceneReferenceSpace:", self->_startLocations[a3].x, self->_startLocations[a3].y);
  objc_msgSend(a4, "convertPoint:fromView:", 0);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)_appendSubclassDescription:(id)a3
{
  if (self->_numberOfTouchesRequired != 1) {
    objc_msgSend(a3, "appendFormat:", @"; unint64_t numberOfTouchesRequired = %lu", self->_numberOfTouchesRequired);
  }
  if (self->_direction)
  {
    [a3 appendString:@"; unint64_t direction = "];
    unint64_t direction = self->_direction;
    if (direction)
    {
      [a3 appendString:@"right"];
      unint64_t v6 = self->_direction;
      if ((v6 & 2) == 0)
      {
        if ((v6 & 4) != 0)
        {
LABEL_15:
          [a3 appendString:@","];
LABEL_16:
          [a3 appendString:@"up"];
          if ((self->_direction & 8) == 0) {
            return;
          }
          goto LABEL_17;
        }
LABEL_11:
        if ((v6 & 8) == 0) {
          return;
        }
LABEL_17:
        [a3 appendString:@","];
LABEL_18:
        [a3 appendString:@"down"];
        return;
      }
      [a3 appendString:@","];
    }
    else if ((direction & 2) == 0)
    {
      if ((direction & 4) == 0)
      {
        if ((direction & 8) == 0) {
          return;
        }
        goto LABEL_18;
      }
      goto LABEL_16;
    }
    [a3 appendString:@"left"];
    unint64_t v6 = self->_direction;
    if ((v6 & 4) != 0) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 10;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (void)setMaximumDuration:(double)a3
{
  self->_maximumDuration = a3;
}

- (NSUInteger)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (UISwipeGestureRecognizerDirection)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
}

@end