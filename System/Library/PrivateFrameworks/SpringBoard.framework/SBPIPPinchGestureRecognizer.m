@interface SBPIPPinchGestureRecognizer
- (BOOL)failsPastHysteresis;
- (SBPIPPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (SBPIPSystemGestureRecognizerDelegate)delegate;
- (unint64_t)maximumNumberOfTouches;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setFailsPastHysteresis:(BOOL)a3;
- (void)setMaximumNumberOfTouches:(unint64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBPIPPinchGestureRecognizer

- (SBPIPPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBPIPPinchGestureRecognizer;
  v4 = [(SBPIPPinchGestureRecognizer *)&v10 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_maximumAbsoluteAccumulatedMovement.x = SBMagicHysteresisValue();
    v5->_maximumAbsoluteAccumulatedMovement.y = v6;
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    touches = v5->_touches;
    v5->_touches = v7;

    v5->_accumulatedMovement = (CGPoint)*MEMORY[0x1E4F1DAD8];
    v5->_achievedMaximumAbsoluteAccumulatedMovement = 0;
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBPIPPinchGestureRecognizer;
  [(SBPIPPinchGestureRecognizer *)&v3 setDelegate:a3];
}

- (SBPIPSystemGestureRecognizerDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)SBPIPPinchGestureRecognizer;
  v2 = [(SBPIPPinchGestureRecognizer *)&v4 delegate];
  return (SBPIPSystemGestureRecognizerDelegate *)v2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBPIPPinchGestureRecognizer;
  [(SBPIPPinchGestureRecognizer *)&v17 touchesBegan:v6 withEvent:a4];
  if (self->_maximumNumberOfTouches)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if ([(NSMutableSet *)self->_touches count] >= self->_maximumNumberOfTouches)
          {

            [(SBPIPPinchGestureRecognizer *)self setState:5];
            goto LABEL_12;
          }
          [(NSMutableSet *)self->_touches addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
LABEL_12:
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBPIPPinchGestureRecognizer;
  [(SBPIPPinchGestureRecognizer *)&v16 touchesCancelled:v6 withEvent:a4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSMutableSet removeObject:](self->_touches, "removeObject:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBPIPPinchGestureRecognizer;
  [(SBPIPPinchGestureRecognizer *)&v16 touchesEnded:v6 withEvent:a4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSMutableSet removeObject:](self->_touches, "removeObject:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBPIPPinchGestureRecognizer;
  [(SBPIPPinchGestureRecognizer *)&v18 touchesMoved:v6 withEvent:a4];
  if (self->_failsPastHysteresis)
  {
    uint64_t v7 = [(SBPIPPinchGestureRecognizer *)self state];
    if (!self->_achievedMaximumAbsoluteAccumulatedMovement)
    {
      double v8 = SBTotalMovementForMovedTouches(self, v6) + self->_accumulatedMovement.x;
      double v10 = v9 + self->_accumulatedMovement.y;
      self->_accumulatedMovement.double x = v8;
      self->_accumulatedMovement.double y = v10;
      if (!v7)
      {
        double x = self->_maximumAbsoluteAccumulatedMovement.x;
        BOOL v12 = x <= 0.0 || v8 < x;
        if (!v12 || ((y = self->_maximumAbsoluteAccumulatedMovement.y, y > 0.0) ? (BOOL v14 = v10 < y) : (BOOL v14 = 1), !v14))
        {
          if (!self->_achievedMaximumAbsoluteAccumulatedMovement) {
            self->_achievedMaximumAbsoluteAccumulatedMovement = 1;
          }
        }
      }
    }
    long long v15 = [(SBPIPPinchGestureRecognizer *)self delegate];
    objc_super v16 = v15;
    BOOL v17 = self->_achievedMaximumAbsoluteAccumulatedMovement && v7 == 0;
    if (v17 && [v15 gestureRecognizerShouldFailForMovementPastHysteresis:self]) {
      [(SBPIPPinchGestureRecognizer *)self setState:5];
    }
  }
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)SBPIPPinchGestureRecognizer;
  [(SBPIPPinchGestureRecognizer *)&v5 reset];
  objc_super v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  touches = self->_touches;
  self->_touches = v3;

  self->_accumulatedMovement = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_achievedMaximumAbsoluteAccumulatedMovement = 0;
}

- (unint64_t)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (void)setMaximumNumberOfTouches:(unint64_t)a3
{
  self->_maximumNumberOfTouches = a3;
}

- (BOOL)failsPastHysteresis
{
  return self->_failsPastHysteresis;
}

- (void)setFailsPastHysteresis:(BOOL)a3
{
  self->_failsPastHysteresis = a3;
}

- (void).cxx_destruct
{
}

@end