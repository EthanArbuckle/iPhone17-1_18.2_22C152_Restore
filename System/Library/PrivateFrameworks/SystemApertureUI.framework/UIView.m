@interface UIView
@end

@implementation UIView

uint64_t __53__UIView_SystemApertureUIAdditions___sauiBlurKeyPath__block_invoke()
{
  _sauiBlurKeyPath___sauiBlurKeyPath = [@"filters" stringByAppendingFormat:@".%@", *MEMORY[0x263F15BC8]];
  return MEMORY[0x270F9A758]();
}

void __64__UIView_SystemApertureUIAdditions___sauiBlurInputRadiusKeyPath__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _sauiBlurKeyPath];
  uint64_t v1 = [v3 stringByAppendingFormat:@".%@", *MEMORY[0x263F15C80]];
  v2 = (void *)_sauiBlurInputRadiusKeyPath___sauiBlurInputRadiusKeyPath;
  _sauiBlurInputRadiusKeyPath___sauiBlurInputRadiusKeyPath = v1;
}

@end