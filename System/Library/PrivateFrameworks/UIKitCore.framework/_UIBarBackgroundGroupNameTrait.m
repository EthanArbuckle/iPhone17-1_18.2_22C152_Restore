@interface _UIBarBackgroundGroupNameTrait
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSObject)defaultValue;
+ (NSString)identifier;
+ (NSString)name;
@end

@implementation _UIBarBackgroundGroupNameTrait

+ (NSString)name
{
  return (NSString *)@"BarBackgroundGroupName";
}

+ (NSString)identifier
{
  return (NSString *)@"_UIBarBackgroundGroupName";
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