@interface NSString
@end

@implementation NSString

uint64_t __42__NSString_RCAdditions__rc_reversedString__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

@end