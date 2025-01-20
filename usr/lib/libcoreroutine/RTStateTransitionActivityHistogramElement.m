@interface RTStateTransitionActivityHistogramElement
- (CMMotionActivity)activity;
- (RTStateTransitionActivityHistogramElement)initWithActivity:(id)a3;
- (double)interval;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setActivity:(id)a3;
- (void)setInterval:(double)a3;
@end

@implementation RTStateTransitionActivityHistogramElement

- (RTStateTransitionActivityHistogramElement)initWithActivity:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTStateTransitionActivityHistogramElement;
  v5 = [(RTStateTransitionActivityHistogramElement *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    activity = v5->_activity;
    v5->_activity = (CMMotionActivity *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(RTStateTransitionActivityHistogramElement *)self activity];
  uint64_t v6 = (void *)[v4 initWithActivity:v5];

  [(RTStateTransitionActivityHistogramElement *)self interval];
  [v6 setInterval:];
  return v6;
}

- (CMMotionActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void).cxx_destruct
{
}

@end