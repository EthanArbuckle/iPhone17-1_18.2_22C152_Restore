@interface _UIVisualEffectCornerCurveTrait
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSObject)defaultValue;
+ (NSString)identifier;
+ (NSString)name;
@end

@implementation _UIVisualEffectCornerCurveTrait

+ (NSString)name
{
  return (NSString *)@"_visualEffectCornerCurve";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.uikit.visualEffectCornerCurve";
}

+ (NSObject)defaultValue
{
  return 0;
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