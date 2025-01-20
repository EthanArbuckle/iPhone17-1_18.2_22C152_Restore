@interface TVGetUpTimeMicros
@end

@implementation TVGetUpTimeMicros

double ___TVGetUpTimeMicros_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 * 0.001 / (double)v1;
  _TVGetUpTimeMicros_sTimerToMicrosMultiplier = *(void *)&result;
  return result;
}

@end