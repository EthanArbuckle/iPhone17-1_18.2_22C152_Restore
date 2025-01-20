@interface SBHClockHandsImageSet
- (UIImage)hourMinuteDot;
- (UIImage)hours;
- (UIImage)minutes;
- (UIImage)secondDot;
- (UIImage)seconds;
- (void)getMetrics:(SBHClockApplicationIconImageMetrics *)a3;
- (void)setHourMinuteDot:(id)a3;
- (void)setHours:(id)a3;
- (void)setMetrics:(const SBHClockApplicationIconImageMetrics *)a3;
- (void)setMinutes:(id)a3;
- (void)setSecondDot:(id)a3;
- (void)setSeconds:(id)a3;
@end

@implementation SBHClockHandsImageSet

- (UIImage)seconds
{
  return self->_seconds;
}

- (UIImage)minutes
{
  return self->_minutes;
}

- (UIImage)hours
{
  return self->_hours;
}

- (void)getMetrics:(SBHClockApplicationIconImageMetrics *)a3
{
}

- (UIImage)secondDot
{
  return self->_secondDot;
}

- (UIImage)hourMinuteDot
{
  return self->_hourMinuteDot;
}

- (void)setMetrics:(const SBHClockApplicationIconImageMetrics *)a3
{
}

- (void)setSeconds:(id)a3
{
}

- (void)setMinutes:(id)a3
{
}

- (void)setHours:(id)a3
{
}

- (void)setHourMinuteDot:(id)a3
{
}

- (void)setSecondDot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondDot, 0);
  objc_storeStrong((id *)&self->_hourMinuteDot, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_minutes, 0);
  objc_storeStrong((id *)&self->_seconds, 0);
}

@end