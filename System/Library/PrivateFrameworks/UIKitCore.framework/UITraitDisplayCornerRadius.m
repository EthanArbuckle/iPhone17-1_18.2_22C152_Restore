@interface UITraitDisplayCornerRadius
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (double)defaultValue;
@end

@implementation UITraitDisplayCornerRadius

+ (double)defaultValue
{
  return -1.0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"DisplayCornerRadius";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitDisplayCornerRadius";
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end