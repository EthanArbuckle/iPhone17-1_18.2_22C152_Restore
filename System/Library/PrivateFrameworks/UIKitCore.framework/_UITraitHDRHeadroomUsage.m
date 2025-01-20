@interface _UITraitHDRHeadroomUsage
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation _UITraitHDRHeadroomUsage

+ (NSString)name
{
  return (NSString *)@"HDRHeadroomUsage";
}

+ (NSString)identifier
{
  return (NSString *)@"_UITraitHDRHeadroomUsage";
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
  return 0;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end