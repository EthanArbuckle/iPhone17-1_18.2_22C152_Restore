@interface UIColor(SpringBoardFoundation)
+ (id)sbf_siriIntelligenceLightColors;
+ (uint64_t)sbf_siriIntelligenceLightBlueColor;
+ (uint64_t)sbf_siriIntelligenceLightOrangeColor;
+ (uint64_t)sbf_siriIntelligenceLightPurpleColor;
+ (uint64_t)sbf_siriIntelligenceLightRedColor;
@end

@implementation UIColor(SpringBoardFoundation)

+ (id)sbf_siriIntelligenceLightColors
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "sbf_siriIntelligenceLightBlueColor");
  v8[0] = v2;
  v3 = objc_msgSend(a1, "sbf_siriIntelligenceLightPurpleColor");
  v8[1] = v3;
  v4 = objc_msgSend(a1, "sbf_siriIntelligenceLightRedColor");
  v8[2] = v4;
  v5 = objc_msgSend(a1, "sbf_siriIntelligenceLightOrangeColor");
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (uint64_t)sbf_siriIntelligenceLightBlueColor
{
  return [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.392156863 blue:0.666666667 alpha:1.0];
}

+ (uint64_t)sbf_siriIntelligenceLightPurpleColor
{
  return [MEMORY[0x1E4F428B8] colorWithRed:0.488888889 green:0.261437908 blue:0.666666667 alpha:1.0];
}

+ (uint64_t)sbf_siriIntelligenceLightOrangeColor
{
  return [MEMORY[0x1E4F428B8] colorWithRed:0.666666667 green:0.117647059 blue:0.222222222 alpha:1.0];
}

+ (uint64_t)sbf_siriIntelligenceLightRedColor
{
  return [MEMORY[0x1E4F428B8] colorWithRed:0.666666667 green:0.384313725 blue:0.0 alpha:1.0];
}

@end