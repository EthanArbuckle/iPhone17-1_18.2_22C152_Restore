@interface UIColor(ICQUI)
+ (id)icqui_colorWithHexString:()ICQUI;
@end

@implementation UIColor(ICQUI)

+ (id)icqui_colorWithHexString:()ICQUI
{
  int v3 = 0;
  v0 = objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:");
  [v0 scanHexInt:&v3];

  v1 = [MEMORY[0x263F825C8] colorWithRed:(float)((float)BYTE2(v3) / 255.0) green:(float)((float)BYTE1(v3) / 255.0) blue:(float)((float)v3 / 255.0) alpha:1.0];
  return v1;
}

@end