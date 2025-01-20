@interface UITraitVibrancy
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation UITraitVibrancy

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
  return (NSString *)@"Vibrancy";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitVibrancy";
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