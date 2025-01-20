@interface UIImage(TipsUI)
+ (id)tipsAppHomeScreenIcon;
@end

@implementation UIImage(TipsUI)

+ (id)tipsAppHomeScreenIcon
{
  v0 = (void *)MEMORY[0x263F827E8];
  v1 = [MEMORY[0x263F7F5C8] clientBundleIdentifier];
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  v3 = objc_msgSend(v0, "_applicationIconImageForBundleIdentifier:format:scale:", v1, 2);

  return v3;
}

@end