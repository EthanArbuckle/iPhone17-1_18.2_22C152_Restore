@interface UIColor(NWKUIHexColor)
+ (id)nwkui_colorFromHexString:()NWKUIHexColor;
- (id)nwkui_hexString;
@end

@implementation UIColor(NWKUIHexColor)

+ (id)nwkui_colorFromHexString:()NWKUIHexColor
{
  id v3 = a3;
  if ([v3 length] == 7)
  {
    v4 = [v3 substringToIndex:1];
    if ([v4 containsString:@"#"])
    {
      int v8 = 0;
      v5 = [MEMORY[0x263F08B08] scannerWithString:v3];
      [v5 setScanLocation:1];
      [v5 scanHexInt:&v8];
      v6 = [MEMORY[0x263F825C8] colorWithRed:(double)BYTE2(v8) / 255.0 green:(double)BYTE1(v8) / 255.0 blue:(double)v8 / 255.0 alpha:1.0];
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

- (id)nwkui_hexString
{
  double v5 = 0.0;
  double v6 = 0.0;
  double v4 = 0.0;
  uint64_t v3 = 0;
  [a1 getRed:&v6 green:&v5 blue:&v4 alpha:&v3];
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"%#02x%02x%02x", (int)(v6 * 255.0), (int)(v5 * 255.0), (int)(v4 * 255.0));
  return v1;
}

@end