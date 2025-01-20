@interface ICQSignpostGetNanoseconds
@end

@implementation ICQSignpostGetNanoseconds

uint64_t ___ICQSignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_ICQSignpostGetNanoseconds_timebase_info);
}

@end