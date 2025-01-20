@interface BYSignpostGetNanoseconds
@end

@implementation BYSignpostGetNanoseconds

uint64_t ___BYSignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_BYSignpostGetNanoseconds_timebase_info);
}

@end