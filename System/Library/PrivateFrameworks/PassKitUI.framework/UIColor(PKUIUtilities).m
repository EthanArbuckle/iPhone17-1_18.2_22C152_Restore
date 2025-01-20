@interface UIColor(PKUIUtilities)
+ (id)pkui_blendFromColor:()PKUIUtilities toColor:withProgress:;
+ (id)pkui_colorWithHexString:()PKUIUtilities;
+ (id)pkui_colorWithPKColor:()PKUIUtilities;
+ (uint64_t)pkui_osloErrorColor;
- (id)pkui_extendedLinearColor;
- (id)pkui_linearColor;
@end

@implementation UIColor(PKUIUtilities)

+ (id)pkui_colorWithPKColor:()PKUIUtilities
{
  if (a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithCGColor:", objc_msgSend(a3, "CGColor"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (uint64_t)pkui_osloErrorColor
{
  return [MEMORY[0x1E4FB1618] systemRedColor];
}

+ (id)pkui_blendFromColor:()PKUIUtilities toColor:withProgress:
{
  id v5 = a4;
  v6 = objc_msgSend(a3, "pkui_extendedLinearColor");
  v7 = objc_msgSend(v5, "pkui_extendedLinearColor");

  v8 = 0;
  if (v6 && v7)
  {
    [v6 CGColor];
    [v7 CGColor];
    uint64_t BlendedLinearColor = PKColorCreateBlendedLinearColor();
    if (BlendedLinearColor)
    {
      v10 = (const void *)BlendedLinearColor;
      v8 = [MEMORY[0x1E4FB1618] colorWithCGColor:BlendedLinearColor];
      CFRelease(v10);
      if (v8) {
        objc_setAssociatedObject(v8, &PKUIExtendedLinearColorKey, v8, 0);
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)pkui_linearColor
{
  v2 = objc_getAssociatedObject(a1, &pkui_linearColor_PKUILinearColorKey);
  if (!v2)
  {
    [a1 CGColor];
    uint64_t CopyByMatchingLinearSRGB = PKColorCreateCopyByMatchingLinearSRGB();
    if (CopyByMatchingLinearSRGB)
    {
      v6 = (const void *)CopyByMatchingLinearSRGB;
      v2 = [MEMORY[0x1E4FB1618] colorWithCGColor:CopyByMatchingLinearSRGB];
      CFRelease(v6);
      if (v2) {
        objc_setAssociatedObject(v2, &pkui_linearColor_PKUILinearColorKey, v2, 0);
      }
    }
    else
    {
      v2 = 0;
    }
  }
  id v3 = v2;

  return v3;
}

- (id)pkui_extendedLinearColor
{
  v2 = objc_getAssociatedObject(a1, &PKUIExtendedLinearColorKey);
  if (!v2)
  {
    [a1 CGColor];
    uint64_t CopyByMatchingExtendedLinearSRGB = PKColorCreateCopyByMatchingExtendedLinearSRGB();
    if (CopyByMatchingExtendedLinearSRGB)
    {
      v6 = (const void *)CopyByMatchingExtendedLinearSRGB;
      v2 = [MEMORY[0x1E4FB1618] colorWithCGColor:CopyByMatchingExtendedLinearSRGB];
      CFRelease(v6);
      if (v2) {
        objc_setAssociatedObject(v2, &PKUIExtendedLinearColorKey, v2, 0);
      }
    }
    else
    {
      v2 = 0;
    }
  }
  id v3 = v2;

  return v3;
}

+ (id)pkui_colorWithHexString:()PKUIUtilities
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 whitespaceCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  v7 = [v6 stringByReplacingOccurrencesOfString:@"#" withString:&stru_1EF1B5B50];

  if ([v7 length] == 6)
  {
    int v11 = 0;
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v7];
    [v8 scanHexInt:&v11];
    v9 = [MEMORY[0x1E4FB1618] colorWithRed:(double)BYTE2(v11) / 255.0 green:(double)BYTE1(v11) / 255.0 blue:(double)v11 / 255.0 alpha:1.0];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end