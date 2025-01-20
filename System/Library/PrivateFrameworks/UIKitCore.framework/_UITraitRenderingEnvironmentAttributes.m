@interface _UITraitRenderingEnvironmentAttributes
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSObject)defaultValue;
+ (NSString)identifier;
+ (NSString)name;
@end

@implementation _UITraitRenderingEnvironmentAttributes

+ (NSString)name
{
  return (NSString *)@"RenderingEnvironmentAttributes";
}

+ (NSString)identifier
{
  return (NSString *)@"_UITraitRenderingEnvironmentAttributes";
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