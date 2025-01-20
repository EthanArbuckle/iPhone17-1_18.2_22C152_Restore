@interface UITraitForceTouchCapability
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation UITraitForceTouchCapability

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"ForceTouchCapability";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitForceTouchCapability";
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