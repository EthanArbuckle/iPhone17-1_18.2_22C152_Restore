@interface UIColor(SBWallpaper)
+ (id)sb_colorWithRGBHexString:()SBWallpaper;
- (id)sb_RGBHexString;
@end

@implementation UIColor(SBWallpaper)

+ (id)sb_colorWithRGBHexString:()SBWallpaper
{
  v4 = (objc_class *)MEMORY[0x1E4F28FE8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithString:v5];

  v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"#"];
  [v6 setCharactersToBeSkipped:v7];

  int v10 = 0;
  if ([v6 scanHexInt:&v10])
  {
    v8 = [a1 colorWithRed:(double)BYTE2(v10) / 255.0 green:(double)BYTE1(v10) / 255.0 blue:(double)v10 / 255.0 alpha:1.0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sb_RGBHexString
{
  double v4 = 0.0;
  double v5 = 0.0;
  double v3 = 0.0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:0];
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"#%X%X%X", (int)(v5 * 255.0), (int)(v4 * 255.0), (int)(v3 * 255.0));
  return v1;
}

@end