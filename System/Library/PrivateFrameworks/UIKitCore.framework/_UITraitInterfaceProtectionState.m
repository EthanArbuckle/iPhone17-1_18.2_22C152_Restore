@interface _UITraitInterfaceProtectionState
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation _UITraitInterfaceProtectionState

+ (NSString)name
{
  return (NSString *)@"InterfaceProtectionState";
}

+ (NSString)identifier
{
  return (NSString *)@"_UIInterfaceProtectionState";
}

+ (int64_t)defaultValue
{
  return -1;
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