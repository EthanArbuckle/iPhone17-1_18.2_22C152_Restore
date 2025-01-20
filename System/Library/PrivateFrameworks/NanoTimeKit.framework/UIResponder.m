@interface UIResponder
@end

@implementation UIResponder

uint64_t __58__UIResponder__NTKResponderFix___ntk_becomeFirstResponder__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 32) becomeFirstResponder];
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
  }
  return result;
}

@end