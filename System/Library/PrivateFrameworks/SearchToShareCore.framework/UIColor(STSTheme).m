@interface UIColor(STSTheme)
+ (id)sts_colorFromHexString:()STSTheme alpha:;
+ (uint64_t)sts_defaultBackgroundColor;
+ (uint64_t)sts_defaultCellPlaceholderColor;
+ (uint64_t)sts_detailViewBackgroundColor;
+ (uint64_t)sts_headerViewBackgroundColor;
+ (uint64_t)sts_headerZKWSearchButtonAndSearchTextFieldBackgroundColor;
+ (uint64_t)sts_magnifyingGlassGrayTintColor;
+ (uint64_t)sts_primaryResultTextColor;
+ (uint64_t)sts_providerImageColor;
+ (uint64_t)sts_searchBarBackgroundColor;
+ (uint64_t)sts_searchErrorTextColor;
+ (uint64_t)sts_secondaryResultTextColor;
@end

@implementation UIColor(STSTheme)

+ (uint64_t)sts_primaryResultTextColor
{
  return [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:1.0];
}

+ (uint64_t)sts_secondaryResultTextColor
{
  return [MEMORY[0x263F825C8] colorWithWhite:0.55 alpha:1.0];
}

+ (uint64_t)sts_searchErrorTextColor
{
  return [MEMORY[0x263F825C8] colorWithWhite:0.4 alpha:1.0];
}

+ (uint64_t)sts_magnifyingGlassGrayTintColor
{
  return [MEMORY[0x263F825C8] colorWithRed:0.55 green:0.55 blue:0.57 alpha:1.0];
}

+ (uint64_t)sts_searchBarBackgroundColor
{
  return [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.1];
}

+ (uint64_t)sts_headerViewBackgroundColor
{
  return [MEMORY[0x263F825C8] whiteColor];
}

+ (uint64_t)sts_headerZKWSearchButtonAndSearchTextFieldBackgroundColor
{
  return [MEMORY[0x263F825C8] tertiarySystemFillColor];
}

+ (uint64_t)sts_defaultBackgroundColor
{
  return [MEMORY[0x263F825C8] systemBackgroundColor];
}

+ (uint64_t)sts_defaultCellPlaceholderColor
{
  return [MEMORY[0x263F825C8] colorWithWhite:0.74902 alpha:1.0];
}

+ (uint64_t)sts_detailViewBackgroundColor
{
  return [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.7];
}

+ (id)sts_colorFromHexString:()STSTheme alpha:
{
  if (a4)
  {
    v5 = objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:");
    int v8 = 0;
    if ([v5 scanHexInt:&v8])
    {
      v6 = [MEMORY[0x263F825C8] colorWithRed:(double)BYTE2(v8) / 255.0 green:(double)BYTE1(v8) / 255.0 blue:(double)v8 / 255.0 alpha:a1];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (uint64_t)sts_providerImageColor
{
  return [MEMORY[0x263F825C8] colorWithRed:0.5255 green:0.5608 blue:0.6 alpha:1.0];
}

@end