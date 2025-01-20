@interface RTStateTransitionOneTimeTrans
+ (BOOL)supportsSecureCoding;
- (RTStateTransitionOneTimeTrans)initWithCoder:(id)a3;
- (RTStateTransitionOneTimeTrans)initWithStart:(double)a3 stop:(double)a4 motionActivityType:(unint64_t)a5;
- (double)start_s;
- (double)stop_s;
- (unint64_t)motionActivityType;
- (void)encodeWithCoder:(id)a3;
- (void)setMotionActivityType:(unint64_t)a3;
- (void)setStart_s:(double)a3;
- (void)setStop_s:(double)a3;
@end

@implementation RTStateTransitionOneTimeTrans

- (RTStateTransitionOneTimeTrans)initWithStart:(double)a3 stop:(double)a4 motionActivityType:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)RTStateTransitionOneTimeTrans;
  result = [(RTStateTransitionOneTimeTrans *)&v9 init];
  if (result)
  {
    result->_start_s = a3;
    result->_stop_s = a4;
    result->_motionActivityType = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double start_s = self->_start_s;
  id v5 = a3;
  [v5 encodeDouble:@"start_s" forKey:start_s];
  [v5 encodeDouble:@"stop_s" forKey:self->_stop_s];
  [v5 encodeInteger:self->_motionActivityType forKey:@"motionActivityType"];
}

- (RTStateTransitionOneTimeTrans)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTStateTransitionOneTimeTrans;
  id v5 = [(RTStateTransitionOneTimeTrans *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"start_s"];
    v5->_double start_s = v6;
    [v4 decodeDoubleForKey:@"stop_s"];
    v5->_stop_s = v7;
    if ([v4 containsValueForKey:@"motionActivityType"]) {
      uint64_t v8 = [v4 decodeIntegerForKey:@"motionActivityType"];
    }
    else {
      uint64_t v8 = 0;
    }
    v5->_motionActivityType = v8;
  }

  return v5;
}

- (double)start_s
{
  return self->_start_s;
}

- (void)setStart_s:(double)a3
{
  self->_double start_s = a3;
}

- (double)stop_s
{
  return self->_stop_s;
}

- (void)setStop_s:(double)a3
{
  self->_stop_s = a3;
}

- (unint64_t)motionActivityType
{
  return self->_motionActivityType;
}

- (void)setMotionActivityType:(unint64_t)a3
{
  self->_motionActivityType = a3;
}

@end