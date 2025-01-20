@interface _UIViewAnimationFrame
- (double)duration;
- (double)startTime;
- (id)description;
- (id)value;
- (int64_t)compareStartTimes:(id)a3;
- (void)setDuration:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setValue:(id)a3;
@end

@implementation _UIViewAnimationFrame

- (void).cxx_destruct
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)compareStartTimes:(id)a3
{
  double startTime = self->_startTime;
  double v4 = *((double *)a3 + 2);
  if (startTime < v4) {
    return -1;
  }
  else {
    return startTime > v4;
  }
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_UIViewAnimationFrame;
  double v4 = [(_UIViewAnimationFrame *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ value=%@ startTime=%f duration=%f", v4, self->_value, *(void *)&self->_startTime, *(void *)&self->_duration];

  return v5;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

@end