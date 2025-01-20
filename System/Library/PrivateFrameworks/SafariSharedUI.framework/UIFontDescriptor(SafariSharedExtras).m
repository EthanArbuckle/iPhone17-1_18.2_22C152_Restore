@interface UIFontDescriptor(SafariSharedExtras)
+ (uint64_t)safari_preferredFontDescriptorWithTextStyle:()SafariSharedExtras;
@end

@implementation UIFontDescriptor(SafariSharedExtras)

+ (uint64_t)safari_preferredFontDescriptorWithTextStyle:()SafariSharedExtras
{
  return objc_msgSend(MEMORY[0x1E4F42A38], "preferredFontDescriptorWithTextStyle:");
}

@end