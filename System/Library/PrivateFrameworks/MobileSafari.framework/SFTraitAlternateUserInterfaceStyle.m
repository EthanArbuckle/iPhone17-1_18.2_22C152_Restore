@interface SFTraitAlternateUserInterfaceStyle
+ (BOOL)affectsColorAppearance;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation SFTraitAlternateUserInterfaceStyle

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"alternateUserInterfaceStyle";
}

@end