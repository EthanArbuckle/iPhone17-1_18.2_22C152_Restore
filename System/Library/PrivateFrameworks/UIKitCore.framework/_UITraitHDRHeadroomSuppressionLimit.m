@interface _UITraitHDRHeadroomSuppressionLimit
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (double)defaultValue;
@end

@implementation _UITraitHDRHeadroomSuppressionLimit

+ (NSString)name
{
  return (NSString *)@"HDRHeadroomSuppressionLimit";
}

+ (NSString)identifier
{
  return (NSString *)@"_UITraitHDRHeadroomSuppressionLimit";
}

+ (double)defaultValue
{
  return 0.0;
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