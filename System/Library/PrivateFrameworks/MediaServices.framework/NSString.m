@interface NSString
@end

@implementation NSString

uint64_t __55__NSString_MSVAdditions__msv_stringByResolvingRealPath__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"/%@", a2];
  return MEMORY[0x1F41817F8]();
}

@end