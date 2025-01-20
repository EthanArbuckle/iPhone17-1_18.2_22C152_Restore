@interface UIColor(Weather)
+ (id)wa_colorFromHexString:()Weather;
@end

@implementation UIColor(Weather)

+ (id)wa_colorFromHexString:()Weather
{
  int v3 = 0;
  v0 = objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:");
  [v0 setScanLocation:1];
  [v0 scanHexInt:&v3];
  v1 = [MEMORY[0x263F1C550] colorWithRed:(double)BYTE2(v3) / 255.0 green:(double)BYTE1(v3) / 255.0 blue:(double)v3 / 255.0 alpha:1.0];

  return v1;
}

@end