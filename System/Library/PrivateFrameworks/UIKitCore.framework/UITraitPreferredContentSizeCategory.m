@interface UITraitPreferredContentSizeCategory
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSObject)defaultValue;
+ (NSString)identifier;
+ (NSString)name;
@end

@implementation UITraitPreferredContentSizeCategory

+ (NSObject)defaultValue
{
  return @"_UICTContentSizeCategoryUnspecified";
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"PreferredContentSizeCategory";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitPreferredContentSizeCategory";
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