@interface UITraitAlwaysOnUpdateFidelity
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation UITraitAlwaysOnUpdateFidelity

+ (NSString)name
{
  return (NSString *)@"AlwaysOnUpdateFidelity";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitAlwaysOnUpdateFidelity";
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