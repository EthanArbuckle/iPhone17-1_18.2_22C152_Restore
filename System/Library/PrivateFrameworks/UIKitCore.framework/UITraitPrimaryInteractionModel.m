@interface UITraitPrimaryInteractionModel
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (unint64_t)defaultValue;
@end

@implementation UITraitPrimaryInteractionModel

+ (unint64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"PrimaryInteractionModel";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitPrimaryInteractionModel";
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end