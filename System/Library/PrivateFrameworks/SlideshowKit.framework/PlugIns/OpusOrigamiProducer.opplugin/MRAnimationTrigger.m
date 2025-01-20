@interface MRAnimationTrigger
- (BOOL)isArmed;
- (MRAction)action;
- (MRAnimationTrigger)initWithAction:(id)a3;
- (NSDictionary)animationAttributes;
- (double)lastValue;
- (double)rearmIfNeededWithDefaultValue:(double)a3;
- (double)startValue;
- (void)dealloc;
- (void)disarm;
- (void)setAction:(id)a3;
- (void)setLastValue:(double)a3;
- (void)setStartValue:(double)a3;
@end

@implementation MRAnimationTrigger

- (MRAnimationTrigger)initWithAction:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRAnimationTrigger;
  v4 = [(MRAnimationTrigger *)&v6 init];
  if (v4)
  {
    v4->_action = (MRAction *)a3;
    *(int64x2_t *)&v4->_startValue = vdupq_n_s64(0xC76DB51CC0000000);
  }
  return v4;
}

- (void)dealloc
{
  self->_action = 0;
  self->_animationAttributes = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRAnimationTrigger;
  [(MRAnimationTrigger *)&v3 dealloc];
}

- (void)setAction:(id)a3
{
  action = self->_action;
  if (action)
  {

    animationAttributes = self->_animationAttributes;
    if (animationAttributes) {
  }
    }
  self->_action = (MRAction *)a3;
  v7 = (NSDictionary *)objc_msgSend(objc_msgSend(a3, "mcAction"), "animationAttributes");
  self->_animationAttributes = v7;
  if (v7)
  {
    v8 = v7;
  }
}

- (BOOL)isArmed
{
  return self->_startValue != -1.23400002e36;
}

- (void)disarm
{
  self->_startValue = -1.23400002e36;
}

- (double)rearmIfNeededWithDefaultValue:(double)a3
{
  double startValue = self->_startValue;
  if (startValue == -1.23400002e36)
  {
    double startValue = self->_lastValue;
    if (startValue == -1.23400002e36) {
      double startValue = a3;
    }
    self->_double startValue = startValue;
  }
  return startValue;
}

- (MRAction)action
{
  return self->_action;
}

- (double)startValue
{
  return self->_startValue;
}

- (void)setStartValue:(double)a3
{
  self->_double startValue = a3;
}

- (double)lastValue
{
  return self->_lastValue;
}

- (void)setLastValue:(double)a3
{
  self->_lastValue = a3;
}

- (NSDictionary)animationAttributes
{
  return self->_animationAttributes;
}

@end