@interface ULHomeSlamMotionChangeTrigger
- (NSDate)date;
- (ULHomeSlamMotionChangeTrigger)initWithdate:(id)a3 andTrigger:(int64_t)a4;
- (int64_t)trigger;
- (void)setDate:(id)a3;
- (void)setTrigger:(int64_t)a3;
@end

@implementation ULHomeSlamMotionChangeTrigger

- (ULHomeSlamMotionChangeTrigger)initWithdate:(id)a3 andTrigger:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULHomeSlamMotionChangeTrigger;
  v7 = [(ULHomeSlamMotionChangeTrigger *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ULHomeSlamMotionChangeTrigger *)v7 setDate:v6];
    [(ULHomeSlamMotionChangeTrigger *)v8 setTrigger:a4];
  }

  return v8;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(int64_t)a3
{
  self->_trigger = a3;
}

- (void).cxx_destruct
{
}

@end