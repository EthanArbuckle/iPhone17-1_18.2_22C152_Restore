@interface IndexOfFirstPreferenceWithClass
@end

@implementation IndexOfFirstPreferenceWithClass

uint64_t ___IndexOfFirstPreferenceWithClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

@end