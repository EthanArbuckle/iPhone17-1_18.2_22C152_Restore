@interface NSString(PVAdditions)
- (uint64_t)pv_isRightToLeft;
@end

@implementation NSString(PVAdditions)

- (uint64_t)pv_isRightToLeft
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a1];
  uint64_t v2 = objc_msgSend(v1, "pv_isRightToLeft");

  return v2;
}

@end