@interface MKTime
- (MKTime)init;
- (double)elapsedTimeInSeconds;
@end

@implementation MKTime

- (MKTime)init
{
  v4.receiver = self;
  v4.super_class = (Class)MKTime;
  v2 = [(MKTime *)&v4 init];
  if (v2) {
    v2->_start = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  }
  return v2;
}

- (double)elapsedTimeInSeconds
{
  return (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC) - self->_start) / 1000000.0 / 1000.0;
}

@end