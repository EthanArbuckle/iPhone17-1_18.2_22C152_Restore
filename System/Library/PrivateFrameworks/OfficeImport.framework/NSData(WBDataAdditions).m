@interface NSData(WBDataAdditions)
+ (uint64_t)tc_nsDataWithOcBinaryData:()WBDataAdditions;
@end

@implementation NSData(WBDataAdditions)

+ (uint64_t)tc_nsDataWithOcBinaryData:()WBDataAdditions
{
  return [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a3 + 24) + *(unsigned int *)(a3 + 8) length:*(unsigned int *)(a3 + 16)];
}

@end