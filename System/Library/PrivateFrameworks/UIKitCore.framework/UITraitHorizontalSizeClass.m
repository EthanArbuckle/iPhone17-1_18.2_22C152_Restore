@interface UITraitHorizontalSizeClass
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation UITraitHorizontalSizeClass

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
  return (NSString *)@"HorizontalSizeClass";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitHorizontalSizeClass";
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