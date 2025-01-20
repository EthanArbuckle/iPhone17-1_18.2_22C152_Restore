@interface UIStringFromFocusHeading
@end

@implementation UIStringFromFocusHeading

uint64_t ___UIStringFromFocusHeading_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    v4 = @" & ";
  }
  else {
    v4 = &stru_1ED0E84C0;
  }
  uint64_t result = [v3 appendFormat:@"%@%@", v4, a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end