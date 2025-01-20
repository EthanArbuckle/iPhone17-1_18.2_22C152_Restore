@interface SFTraitUsesVibrantAppearance
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation SFTraitUsesVibrantAppearance

+ (int64_t)defaultValue
{
  return 0;
}

+ (NSString)name
{
  return (NSString *)@"usesVibrantAppearance";
}

@end