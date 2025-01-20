@interface _UIVisualEffectCornerRadiusTrait
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (double)defaultValue;
@end

@implementation _UIVisualEffectCornerRadiusTrait

+ (NSString)name
{
  return (NSString *)@"_visualEffectCornerRadius";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.uikit.visualEffectCornerRadius";
}

+ (double)defaultValue
{
  return 1.79769313e308;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end