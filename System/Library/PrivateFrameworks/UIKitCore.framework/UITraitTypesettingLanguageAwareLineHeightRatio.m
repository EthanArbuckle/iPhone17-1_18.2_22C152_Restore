@interface UITraitTypesettingLanguageAwareLineHeightRatio
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (double)defaultValue;
@end

@implementation UITraitTypesettingLanguageAwareLineHeightRatio

+ (double)defaultValue
{
  return -1.0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"TypesettingLanguageAwareLineHeightRatio";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitTypesettingLanguageAwareLineHeightRatio";
}

@end