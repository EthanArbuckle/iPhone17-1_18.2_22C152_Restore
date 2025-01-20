@interface UIFont(ScreenTime)
+ (id)st_fontWithStyle:()ScreenTime traits:;
@end

@implementation UIFont(ScreenTime)

+ (id)st_fontWithStyle:()ScreenTime traits:
{
  v4 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:a4 options:1];
  v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];

  return v5;
}

@end