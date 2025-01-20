@interface MRAudioDucker
- (MRAudioDucker)init;
- (double)currentDuckLevel;
- (double)duckInDuration;
- (double)duckInTime;
- (double)duckLevel;
- (double)duckOutDuration;
- (double)duckOutTime;
- (double)duration;
- (double)parentDuration;
- (double)time;
- (int64_t)priority;
- (void)setDuckInDuration:(double)a3;
- (void)setDuckInTime:(double)a3;
- (void)setDuckLevel:(double)a3;
- (void)setDuckOutDuration:(double)a3;
- (void)setDuckOutTime:(double)a3;
- (void)setDuration:(double)a3;
- (void)setParentDuration:(double)a3;
- (void)setPriority:(int64_t)a3;
- (void)setTime:(double)a3;
@end

@implementation MRAudioDucker

- (MRAudioDucker)init
{
  v3.receiver = self;
  v3.super_class = (Class)MRAudioDucker;
  result = [(MRAudioDucker *)&v3 init];
  if (result) {
    *(int64x2_t *)&result->_duckInTime = vdupq_n_s64(0xC08F400000000000);
  }
  return result;
}

- (void)setDuckInTime:(double)a3
{
  self->_duckInTime = a3;
}

- (void)setDuckOutTime:(double)a3
{
  self->_duckOutTime = a3;
}

- (double)currentDuckLevel
{
  double duckInDuration = self->_duckInDuration;
  double duckInTime = self->_duckInTime;
  double time = self->_time;
  if (duckInDuration <= 0.0)
  {
    if (duckInTime >= -10.0) {
      double v7 = time - duckInTime;
    }
    else {
      double v7 = self->_time;
    }
    BOOL v8 = v7 < 0.0;
    double v6 = 0.0;
    if (!v8) {
      double v6 = 1.0;
    }
  }
  else
  {
    if (duckInTime >= -10.0) {
      double v5 = time - duckInTime;
    }
    else {
      double v5 = duckInDuration + time;
    }
    double v6 = v5 / duckInDuration;
  }
  double duckOutDuration = self->_duckOutDuration;
  double duckOutTime = self->_duckOutTime;
  if (duckOutDuration <= 0.0)
  {
    if (duckOutTime >= -10.0) {
      double duckOutDuration = self->_duckOutTime;
    }
    BOOL v8 = time < duckOutDuration;
    double v12 = 0.0;
    if (v8) {
      double v12 = 1.0;
    }
  }
  else
  {
    double parentDuration = self->_parentDuration;
    if (parentDuration >= self->_duration) {
      double parentDuration = self->_duration;
    }
    if (duckOutTime < -10.0) {
      double duckOutTime = parentDuration;
    }
    double v12 = (duckOutDuration + duckOutTime - time) / duckOutDuration;
  }
  double v13 = fmin(v6, 1.0);
  if (v12 >= v13) {
    double v12 = v13;
  }
  if (v12 < 0.0) {
    double v12 = 0.0;
  }
  return 1.0 - (1.0 - self->_duckLevel) * v12;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duckInDuration
{
  return self->_duckInDuration;
}

- (void)setDuckInDuration:(double)a3
{
  self->_double duckInDuration = a3;
}

- (double)duckOutDuration
{
  return self->_duckOutDuration;
}

- (void)setDuckOutDuration:(double)a3
{
  self->_double duckOutDuration = a3;
}

- (double)duckLevel
{
  return self->_duckLevel;
}

- (void)setDuckLevel:(double)a3
{
  self->_duckLevel = a3;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_double time = a3;
}

- (double)parentDuration
{
  return self->_parentDuration;
}

- (void)setParentDuration:(double)a3
{
  self->_double parentDuration = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (double)duckInTime
{
  return self->_duckInTime;
}

- (double)duckOutTime
{
  return self->_duckOutTime;
}

@end