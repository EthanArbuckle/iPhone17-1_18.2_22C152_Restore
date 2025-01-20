@interface UITextFieldImageBackgroundProvider
@end

@implementation UITextFieldImageBackgroundProvider

uint64_t __64___UITextFieldImageBackgroundProvider_enabledDidChangeAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyCorrectImage];
}

@end