@interface UADiagnosticUtils
+ (unint64_t)absoluteToNSec:(unint64_t)a3;
@end

@implementation UADiagnosticUtils

+ (unint64_t)absoluteToNSec:(unint64_t)a3
{
  unsigned int v4 = dword_1000E66E4;
  if (!dword_1000E66E4)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000E66E0);
    unsigned int v4 = dword_1000E66E4;
  }
  return dword_1000E66E0 * a3 / v4;
}

@end