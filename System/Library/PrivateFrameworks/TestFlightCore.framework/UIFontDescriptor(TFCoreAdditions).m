@interface UIFontDescriptor(TFCoreAdditions)
+ (id)tf_systemFontWithTextStyle:()TFCoreAdditions weight:forTraitCollection:;
@end

@implementation UIFontDescriptor(TFCoreAdditions)

+ (id)tf_systemFontWithTextStyle:()TFCoreAdditions weight:forTraitCollection:
{
  v0 = objc_msgSend(MEMORY[0x263F1C660], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:");
  v1 = (void *)MEMORY[0x263F1C658];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:");

  return v2;
}

@end