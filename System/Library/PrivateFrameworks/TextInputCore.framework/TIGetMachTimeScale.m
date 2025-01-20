@interface TIGetMachTimeScale
@end

@implementation TIGetMachTimeScale

double ___TIGetMachTimeScale_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  _TIGetMachTimeScale_scale = *(void *)&result;
  return result;
}

@end