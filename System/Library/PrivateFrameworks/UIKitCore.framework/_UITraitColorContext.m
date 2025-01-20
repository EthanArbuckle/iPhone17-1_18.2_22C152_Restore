@interface _UITraitColorContext
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation _UITraitColorContext

+ (NSString)name
{
  return (NSString *)@"ColorContext";
}

+ (NSString)identifier
{
  return (NSString *)@"_UITraitColorContext";
}

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

@end