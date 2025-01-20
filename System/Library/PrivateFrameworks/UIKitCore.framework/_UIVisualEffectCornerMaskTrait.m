@interface _UIVisualEffectCornerMaskTrait
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation _UIVisualEffectCornerMaskTrait

+ (NSString)name
{
  return (NSString *)@"_visualEffectCornerMask";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.uikit.visualEffectCornerMask";
}

+ (int64_t)defaultValue
{
  return 0x7FFFFFFFFFFFFFFFLL;
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