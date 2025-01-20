@interface UITraitColorVariant
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation UITraitColorVariant

+ (NSString)name
{
  return (NSString *)@"ColorVariant";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitColorVariant";
}

+ (int64_t)defaultValue
{
  return -1;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end