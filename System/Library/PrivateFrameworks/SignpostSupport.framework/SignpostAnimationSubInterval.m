@interface SignpostAnimationSubInterval
- (BOOL)isEqual:(id)a3;
- (SignpostAnimationSubInterval)initWithInterval:(id)a3;
- (SignpostAnimationSubInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (float)durationSeconds;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)hash;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
@end

@implementation SignpostAnimationSubInterval

- (SignpostAnimationSubInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5
{
  v5 = self;
  if (a3 <= a4)
  {
    v20.receiver = self;
    v20.super_class = (Class)SignpostAnimationSubInterval;
    v18 = [(SignpostAnimationSubInterval *)&v20 init];
    if (v18)
    {
      v18->_startMachContinuousTime = a3;
      v18->_endMachContinuousTime = a4;
      v18->_timebaseRatio = a5;
    }
    v5 = v18;
    v14 = v5;
  }
  else
  {
    v6 = _signpost_debug_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v14 = 0;
  }

  return v14;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (SignpostAnimationSubInterval)initWithInterval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 startMachContinuousTime];
  uint64_t v6 = [v4 endMachContinuousTime];
  [v4 timebaseRatio];
  double v8 = v7;

  return [(SignpostAnimationSubInterval *)self initWithStartMCT:v5 endMCT:v6 timebaseRatio:v8];
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SignpostAnimationSubInterval *)self endMachContinuousTime];
  return v3 - [(SignpostAnimationSubInterval *)self startMachContinuousTime];
}

- (double)startSeconds
{
  return (double)[(SignpostAnimationSubInterval *)self startNanoseconds] / 1000000000.0;
}

- (double)endSeconds
{
  return (double)[(SignpostAnimationSubInterval *)self endNanoseconds] / 1000000000.0;
}

- (float)durationSeconds
{
  return (double)[(SignpostAnimationSubInterval *)self durationNanoseconds] / 1000000000.0;
}

- (unint64_t)durationNanoseconds
{
  double v3 = (double)[(SignpostAnimationSubInterval *)self durationMachContinuousTime];
  [(SignpostAnimationSubInterval *)self timebaseRatio];
  return (unint64_t)(v4 * v3);
}

- (unint64_t)endNanoseconds
{
  double v3 = (double)[(SignpostAnimationSubInterval *)self endMachContinuousTime];
  [(SignpostAnimationSubInterval *)self timebaseRatio];
  return (unint64_t)(v4 * v3);
}

- (unint64_t)startNanoseconds
{
  double v3 = (double)[(SignpostAnimationSubInterval *)self startMachContinuousTime];
  [(SignpostAnimationSubInterval *)self timebaseRatio];
  return (unint64_t)(v4 * v3);
}

- (double)startMs
{
  return (double)[(SignpostAnimationSubInterval *)self startNanoseconds] / 1000000.0;
}

- (double)endMs
{
  return (double)[(SignpostAnimationSubInterval *)self endNanoseconds] / 1000000.0;
}

- (double)durationMs
{
  return (double)[(SignpostAnimationSubInterval *)self durationNanoseconds] / 1000000.0;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SignpostAnimationSubInterval *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(SignpostAnimationSubInterval *)v5 startMachContinuousTime];
      if (v6 == [(SignpostAnimationSubInterval *)self startMachContinuousTime])
      {
        uint64_t v7 = [(SignpostAnimationSubInterval *)v5 durationMachContinuousTime];
        BOOL v8 = v7 == [(SignpostAnimationSubInterval *)self durationMachContinuousTime];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SignpostAnimationSubInterval *)self durationMachContinuousTime];
  unint64_t v4 = [(SignpostAnimationSubInterval *)self startMachContinuousTime];
  if (v3) {
    v4 ^= [(SignpostAnimationSubInterval *)self endMachContinuousTime];
  }
  return v4;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void)initWithStartMCT:(uint64_t)a3 endMCT:(uint64_t)a4 timebaseRatio:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end