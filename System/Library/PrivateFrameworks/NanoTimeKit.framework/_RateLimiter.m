@interface _RateLimiter
- (_RateLimiter)initWithRate:(unint64_t)a3;
- (unint64_t)_now_micro_seconds;
- (unint64_t)rate;
- (unint64_t)totalBytes;
- (void)_doWait:(unint64_t)a3;
- (void)addBytes:(unint64_t)a3;
- (void)wait;
@end

@implementation _RateLimiter

- (_RateLimiter)initWithRate:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_RateLimiter;
  v4 = [(_RateLimiter *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_rate = a3;
    v4->_totalBytes = 0;
    v4->_startTime = [(_RateLimiter *)v4 _now_micro_seconds];
  }
  return v5;
}

- (void)addBytes:(unint64_t)a3
{
  self->_totalBytes += a3;
}

- (void)wait
{
  unint64_t v3 = [(_RateLimiter *)self _now_micro_seconds];
  unint64_t v4 = 1000000 * self->_totalBytes / self->_rate + self->_startTime;
  unint64_t v5 = v4 - v3;
  if (v4 > v3)
  {
    v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      unint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Sync session waiting for %llu microseconds", (uint8_t *)&v7, 0xCu);
    }

    [(_RateLimiter *)self _doWait:v5];
  }
}

- (unint64_t)_now_micro_seconds
{
  v4.tv_sec = 0;
  *(void *)&v4.tv_usec = 0;
  uint64_t v3 = 0;
  gettimeofday(&v4, &v3);
  return v4.tv_usec + 1000000 * v4.tv_sec;
}

- (void)_doWait:(unint64_t)a3
{
  __rqtp.tv_sec = (uint64_t)a3 / 1000000;
  __rqtp.tv_nsec = 1000 * (a3 % 0xF4240);
  for (timespec i = (timespec)0; nanosleep(&__rqtp, &i) == -1 && *__error() == 4; __rqtp = i)
    ;
}

- (unint64_t)rate
{
  return self->_rate;
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

@end