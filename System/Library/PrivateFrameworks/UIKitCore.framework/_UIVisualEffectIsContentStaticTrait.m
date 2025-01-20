@interface _UIVisualEffectIsContentStaticTrait
+ (BOOL)_isPrivate;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation _UIVisualEffectIsContentStaticTrait

+ (NSString)name
{
  return (NSString *)@"_visualEffectIsContentStatic";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.uikit.visualEffectIsContentStatic";
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