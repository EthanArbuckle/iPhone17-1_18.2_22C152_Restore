@interface _SBMachContinuousStopwatch
- (_SBMachContinuousStopwatch)init;
- (double)activeTime;
- (uint64_t)start;
- (uint64_t)stop;
@end

@implementation _SBMachContinuousStopwatch

- (uint64_t)stop
{
  if (result)
  {
    uint64_t v1 = result;
    result = mach_continuous_time();
    *(unsigned char *)(v1 + 8) = 0;
    *(void *)(v1 + 24) += result - *(void *)(v1 + 16);
  }
  return result;
}

- (uint64_t)start
{
  if (result)
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 8) = 1;
    result = mach_continuous_time();
    *(void *)(v1 + 16) = result;
  }
  return result;
}

- (double)activeTime
{
  if (!a1) {
    return 0.0;
  }
  if (*(unsigned char *)(a1 + 8)) {
    mach_continuous_time();
  }
  BSMonotonicReferencedTimeFromMachTime();
  return result;
}

- (_SBMachContinuousStopwatch)init
{
  v3.receiver = self;
  v3.super_class = (Class)_SBMachContinuousStopwatch;
  double result = [(_SBMachContinuousStopwatch *)&v3 init];
  if (result) {
    result->_active = 0;
  }
  return result;
}

@end