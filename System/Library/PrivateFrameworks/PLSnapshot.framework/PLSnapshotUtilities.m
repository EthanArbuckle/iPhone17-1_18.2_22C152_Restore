@interface PLSnapshotUtilities
+ (double)secondsFromMachTime:(unint64_t)a3;
@end

@implementation PLSnapshotUtilities

+ (double)secondsFromMachTime:(unint64_t)a3
{
  if (secondsFromMachTime__once != -1) {
    dispatch_once(&secondsFromMachTime__once, &__block_literal_global);
  }
  return *(double *)&secondsFromMachTime__ratio * (double)a3 / 1000000000.0;
}

uint64_t __43__PLSnapshotUtilities_secondsFromMachTime___block_invoke()
{
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  if (result)
  {
    uint64_t result = _os_assumes_log();
    double v1 = 1.0;
  }
  else
  {
    double v1 = (double)(info.numer / info.denom);
  }
  secondsFromMachTime__ratio = *(void *)&v1;
  return result;
}

@end