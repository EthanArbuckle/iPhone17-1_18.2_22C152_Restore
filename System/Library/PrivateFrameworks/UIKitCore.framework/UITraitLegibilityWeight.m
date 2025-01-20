@interface UITraitLegibilityWeight
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation UITraitLegibilityWeight

+ (int64_t)defaultValue
{
  return -1;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"LegibilityWeight";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitLegibilityWeight";
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 0;
}

@end