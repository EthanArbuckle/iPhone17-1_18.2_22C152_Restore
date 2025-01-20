@interface UIStatusBarDataConverter
@end

@implementation UIStatusBarDataConverter

uint64_t __59___UIStatusBarDataConverter_convertData_fromReferenceData___block_invoke(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = [*(id *)(a1 + 32) isEnabled];
  if ((result & 1) == 0 && *(unsigned char *)(*(void *)(a1 + 40) + a2))
  {
    if (a3 == 5)
    {
      uint64_t v7 = 0;
    }
    else
    {
      if (a3 != 6) {
        return result;
      }
      uint64_t v7 = 1;
    }
    [*(id *)(a1 + 32) setType:v7];
    v8 = *(void **)(a1 + 32);
    return [v8 setEnabled:1];
  }
  return result;
}

@end