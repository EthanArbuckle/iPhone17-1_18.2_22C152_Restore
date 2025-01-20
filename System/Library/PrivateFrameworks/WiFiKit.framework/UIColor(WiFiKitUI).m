@interface UIColor(WiFiKitUI)
+ (uint64_t)altTextColor;
+ (uint64_t)defaultBgColor;
+ (uint64_t)defaultButtonColor;
+ (uint64_t)defaultHyperLinkColor;
+ (uint64_t)defaultTextColor;
+ (uint64_t)listPlatterBgColor;
@end

@implementation UIColor(WiFiKitUI)

+ (uint64_t)defaultTextColor
{
  return [MEMORY[0x263F1C550] labelColor];
}

+ (uint64_t)altTextColor
{
  return [MEMORY[0x263F1C550] secondaryLabelColor];
}

+ (uint64_t)defaultBgColor
{
  return [MEMORY[0x263F1C550] systemBackgroundColor];
}

+ (uint64_t)listPlatterBgColor
{
  return [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
}

+ (uint64_t)defaultButtonColor
{
  return [MEMORY[0x263F1C550] systemBlueColor];
}

+ (uint64_t)defaultHyperLinkColor
{
  return [MEMORY[0x263F1C550] systemBlueColor];
}

@end