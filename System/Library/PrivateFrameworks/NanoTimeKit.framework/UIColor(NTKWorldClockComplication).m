@interface UIColor(NTKWorldClockComplication)
+ (id)ntk_wc_defaultSolarGradientColors;
+ (uint64_t)ntk_wc_sunYellowColor;
@end

@implementation UIColor(NTKWorldClockComplication)

+ (id)ntk_wc_defaultSolarGradientColors
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.192156863 green:0.415686275 blue:0.831372549 alpha:1.0];
  v1 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.215686275, 0.623529412, 0.878431373, 1.0, v0);
  v5[1] = v1;
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.31372549 green:0.678431373 blue:0.823529412 alpha:1.0];
  v5[2] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];

  return v3;
}

+ (uint64_t)ntk_wc_sunYellowColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.917647059 blue:0.2 alpha:1.0];
}

@end