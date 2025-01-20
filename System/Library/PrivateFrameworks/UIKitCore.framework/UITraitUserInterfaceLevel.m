@interface UITraitUserInterfaceLevel
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation UITraitUserInterfaceLevel

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
  return (NSString *)@"UserInterfaceLevel";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitUserInterfaceLevel";
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (BOOL)_isPrivate
{
  return 0;
}

@end