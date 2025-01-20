@interface UIHeldAction
- (BOOL)isHolding;
- (void)cancel;
- (void)hold;
- (void)resume;
- (void)touchWithDelay:(double)a3;
- (void)unschedule;
@end

@implementation UIHeldAction

- (void).cxx_destruct
{
}

- (void)touchWithDelay:(double)a3
{
  self->_holding = 0;
  holdBegan = self->_holdBegan;
  self->_holdBegan = 0;

  self->_baseDelay = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIHeldAction;
  [(UIDelayedAction *)&v6 touchWithDelay:a3];
}

- (void)cancel
{
  self->_timeBalance = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UIHeldAction;
  [(UIDelayedAction *)&v2 cancel];
}

- (void)unschedule
{
  self->_holding = 0;
  holdBegan = self->_holdBegan;
  self->_holdBegan = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIHeldAction;
  [(UIDelayedAction *)&v4 unschedule];
}

- (void)hold
{
  if ([(UIDelayedAction *)self scheduled])
  {
    if (!self->_holding)
    {
      [(UIHeldAction *)self unschedule];
      self->_holding = 1;
      v3 = [MEMORY[0x1E4F1C9C8] date];
      holdBegan = self->_holdBegan;
      self->_holdBegan = v3;

      v5 = self->_holdBegan;
      objc_super v6 = [(UIDelayedAction *)self _startDate];
      [(NSDate *)v5 timeIntervalSinceDate:v6];
      self->_timeBalance = v7 + self->_timeBalance;

      self->_timeBalance = fmin(self->_timeBalance, self->_baseDelay);
    }
  }
}

- (void)resume
{
  if (self->_holding && ![(UIDelayedAction *)self _canceled])
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:self->_holdBegan];
    self->_timeBalance = self->_timeBalance - v4;

    double v5 = fmax(self->_timeBalance, 0.0);
    self->_timeBalance = v5;
    double baseDelay = self->_baseDelay;
    [(UIHeldAction *)self touchWithDelay:fmin(baseDelay - v5, baseDelay)];
    self->_double baseDelay = baseDelay;
  }
}

- (BOOL)isHolding
{
  return self->_holding;
}

@end