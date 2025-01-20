@interface VCUIBadgeViewShim
+ (id)downBadgeSizeForDigits;
+ (id)downBadgeViewForText;
+ (id)rightBadgeSizeForDigits;
+ (id)rightBadgeViewForText;
+ (void)setDownBadgeSizeForDigits:(id)a3;
+ (void)setDownBadgeViewForText:(id)a3;
+ (void)setRightBadgeSizeForDigits:(id)a3;
+ (void)setRightBadgeViewForText:(id)a3;
@end

@implementation VCUIBadgeViewShim

+ (void)setRightBadgeViewForText:(id)a3
{
  __rightBadgeViewForText = MEMORY[0x263E39270](a3, a2);
  MEMORY[0x270F9A758]();
}

+ (void)setRightBadgeSizeForDigits:(id)a3
{
  __rightBadgeSizeForDigits = MEMORY[0x263E39270](a3, a2);
  MEMORY[0x270F9A758]();
}

+ (id)rightBadgeViewForText
{
  v2 = (void *)MEMORY[0x263E39270](__rightBadgeViewForText, a2);
  return v2;
}

+ (id)rightBadgeSizeForDigits
{
  v2 = (void *)MEMORY[0x263E39270](__rightBadgeSizeForDigits, a2);
  return v2;
}

+ (void)setDownBadgeViewForText:(id)a3
{
  __downBadgeViewForText = MEMORY[0x263E39270](a3, a2);
  MEMORY[0x270F9A758]();
}

+ (void)setDownBadgeSizeForDigits:(id)a3
{
  __downBadgeSizeForDigits = MEMORY[0x263E39270](a3, a2);
  MEMORY[0x270F9A758]();
}

+ (id)downBadgeViewForText
{
  v2 = (void *)MEMORY[0x263E39270](__downBadgeViewForText, a2);
  return v2;
}

+ (id)downBadgeSizeForDigits
{
  v2 = (void *)MEMORY[0x263E39270](__downBadgeSizeForDigits, a2);
  return v2;
}

@end