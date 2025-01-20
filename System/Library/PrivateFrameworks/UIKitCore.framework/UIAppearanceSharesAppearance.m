@interface UIAppearanceSharesAppearance
@end

@implementation UIAppearanceSharesAppearance

uint64_t ___UIAppearanceSharesAppearance_block_invoke()
{
  uint64_t result = [_UIMainBundleIdentifier() isEqualToString:@"com.apple.gamecenter"];
  byte_1EB260D5B = result ^ 1;
  return result;
}

@end