@interface SBLongPressGestureRecognizer
- (SBLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)minimumPressDuration;
- (id)gestureStateInfoForUnbalancedPressBeganCount:(int64_t)a3 previousCount:(int64_t)a4;
- (void)reset;
- (void)setMinimumPressDuration:(double)a3;
@end

@implementation SBLongPressGestureRecognizer

- (SBLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBLongPressGestureRecognizer;
  v4 = [(SBClickGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_minimumPressDuration = 0.5;
    [(SBClickGestureRecognizer *)v4 setNumberOfClicksRequired:0];
    v5->_firstEventAfterClicksWasReceived = 0;
  }
  return v5;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBLongPressGestureRecognizer;
  [(SBClickGestureRecognizer *)&v3 reset];
  self->_firstEventAfterClicksWasReceived = 0;
}

- (id)gestureStateInfoForUnbalancedPressBeganCount:(int64_t)a3 previousCount:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBLongPressGestureRecognizer;
  objc_super v7 = -[SBClickGestureRecognizer gestureStateInfoForUnbalancedPressBeganCount:previousCount:](&v13, sel_gestureStateInfoForUnbalancedPressBeganCount_previousCount_);
  if ([v7 state] == 3)
  {
    if ([(SBPressGestureRecognizer *)self requiredPressTypesCount] < 2
      || self->_firstEventAfterClicksWasReceived)
    {
      if (a4 >= a3)
      {
        if (a4 > a3)
        {
          if ([(SBLongPressGestureRecognizer *)self state] < 1)
          {
            v8 = v7;
            uint64_t v9 = 5;
            goto LABEL_17;
          }
          if ([(SBClickGestureRecognizer *)self didReceiveRequiredPressEndedCount])
          {
            v8 = v7;
            uint64_t v9 = 3;
            goto LABEL_17;
          }
LABEL_6:
          v8 = v7;
          uint64_t v9 = 2;
LABEL_17:
          [v8 setState:v9];
          goto LABEL_18;
        }
      }
      else
      {
        if ([(SBLongPressGestureRecognizer *)self state] >= 1) {
          goto LABEL_6;
        }
        if ([(SBClickGestureRecognizer *)self didReceiveRequiredPressBeganCount])
        {
          [v7 setState:0];
          [(SBLongPressGestureRecognizer *)self minimumPressDuration];
          objc_msgSend(v7, "setExpirationTime:");
          v10 = v7;
          uint64_t v11 = 1;
          goto LABEL_14;
        }
      }
      [v7 setIsCoalescing:1];
      uint64_t v9 = [(SBLongPressGestureRecognizer *)self state];
      v8 = v7;
      goto LABEL_17;
    }
    self->_firstEventAfterClicksWasReceived = 1;
    [v7 setState:0];
    [(SBClickGestureRecognizer *)self maximumClickFormationDuration];
    objc_msgSend(v7, "setExpirationTime:");
    v10 = v7;
    uint64_t v11 = 5;
LABEL_14:
    [v10 setStateUponExpiration:v11];
  }
LABEL_18:
  return v7;
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

@end