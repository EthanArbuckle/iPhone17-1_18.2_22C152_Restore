@interface SFTraitBarTintStyleTrait
+ (BOOL)affectsColorAppearance;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation SFTraitBarTintStyleTrait

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
  return (NSString *)@"com.apple.mobilesafari.bar-tint-style";
}

@end