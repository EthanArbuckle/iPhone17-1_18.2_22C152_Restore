@interface UIFont(UIFontSystemFonts)
+ (uint64_t)defaultFontSize;
+ (uint64_t)systemMinimumFontSize;
@end

@implementation UIFont(UIFontSystemFonts)

+ (uint64_t)defaultFontSize
{
  return [off_1E52D39B8 labelFontSize];
}

+ (uint64_t)systemMinimumFontSize
{
  return [off_1E52D39B8 systemFontSize];
}

@end