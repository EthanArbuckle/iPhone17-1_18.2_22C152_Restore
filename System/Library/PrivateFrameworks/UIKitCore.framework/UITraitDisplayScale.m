@interface UITraitDisplayScale
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (double)defaultValue;
@end

@implementation UITraitDisplayScale

+ (double)defaultValue
{
  return 0.0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"DisplayScale";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitDisplayScale";
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 0;
}

@end