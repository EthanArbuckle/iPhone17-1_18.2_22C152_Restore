@interface UITraitTypesettingLanguage
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSObject)defaultValue;
+ (NSString)identifier;
+ (NSString)name;
@end

@implementation UITraitTypesettingLanguage

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
  return 0;
}

+ (NSString)name
{
  return (NSString *)@"TypesettingLanguage";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitTypesettingLanguage";
}

@end