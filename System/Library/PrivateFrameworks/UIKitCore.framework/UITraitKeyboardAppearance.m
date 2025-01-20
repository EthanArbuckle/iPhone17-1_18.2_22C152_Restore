@interface UITraitKeyboardAppearance
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation UITraitKeyboardAppearance

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 0;
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitKeyboardAppearance";
}

+ (NSString)name
{
  return (NSString *)@"KeyboardAppearance";
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end