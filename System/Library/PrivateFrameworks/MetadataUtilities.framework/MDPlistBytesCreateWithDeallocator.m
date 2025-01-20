@interface MDPlistBytesCreateWithDeallocator
@end

@implementation MDPlistBytesCreateWithDeallocator

_MDPlistBytes *____MDPlistBytesCreateWithDeallocator_block_invoke()
{
  result = objc_alloc_init(_MDPlistBytes);
  qword_1E95CA398 = (uint64_t)result;
  *((unsigned char *)result + 34) |= 4u;
  return result;
}

@end