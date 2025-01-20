@interface MXMMachUtils
+ (double)_nanosecondsWithAbsoluteTime:(unint64_t)a3;
+ (double)_nanosecondsWithContinuousTime:(unint64_t)a3;
+ (id)_processNameWithBundleIdentifier:(id)a3;
+ (mach_timebase_info)_timebase;
+ (unint64_t)_absoluteTimeWithNanoseconds:(double)a3;
@end

@implementation MXMMachUtils

+ (mach_timebase_info)_timebase
{
  if (_timebase_onceToken != -1) {
    dispatch_once(&_timebase_onceToken, &__block_literal_global_1);
  }
  return (mach_timebase_info *)&_timebase_localTimebase;
}

uint64_t __25__MXMMachUtils__timebase__block_invoke()
{
  uint64_t result = mach_timebase_info(&_timebase_localTimebase);
  if (result)
  {
    id v1 = [MEMORY[0x263EFF940] exceptionWithName:@"MXMUtils" reason:@"Failed to retrieve local timebase info." userInfo:0];
    objc_exception_throw(v1);
  }
  return result;
}

+ (double)_nanosecondsWithAbsoluteTime:(unint64_t)a3
{
  unsigned int v5 = *(_DWORD *)[a1 _timebase];
  return (double)(v5 / *(_DWORD *)([a1 _timebase] + 4) * a3);
}

+ (double)_nanosecondsWithContinuousTime:(unint64_t)a3
{
  unsigned int v5 = *(_DWORD *)[a1 _timebase];
  return (double)(v5 / *(_DWORD *)([a1 _timebase] + 4) * a3);
}

+ (unint64_t)_absoluteTimeWithNanoseconds:(double)a3
{
  unsigned int v5 = *(_DWORD *)[a1 _timebase];
  return (unint64_t)(a3 / (double)(v5 / *(_DWORD *)([a1 _timebase] + 4)));
}

+ (id)_processNameWithBundleIdentifier:(id)a3
{
  v3 = [MEMORY[0x263F01888] bundleProxyForIdentifier:a3];
  v4 = [v3 bundleExecutable];
  unsigned int v5 = [v4 lastPathComponent];
  v6 = (void *)[v5 copy];

  return v6;
}

@end