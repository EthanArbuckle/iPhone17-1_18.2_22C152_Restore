@interface UIApplicationIsStickerPickerService
@end

@implementation UIApplicationIsStickerPickerService

void ___UIApplicationIsStickerPickerService_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4EE = [v0 isEqualToString:@"com.apple.StickerKit.StickerPickerService"];
}

@end