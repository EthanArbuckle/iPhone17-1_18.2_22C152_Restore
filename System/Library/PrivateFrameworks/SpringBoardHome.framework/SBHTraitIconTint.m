@interface SBHTraitIconTint
+ (BOOL)affectsColorAppearance;
+ (NSObject)defaultValue;
+ (NSString)identifier;
+ (NSString)name;
@end

@implementation SBHTraitIconTint

+ (NSString)identifier
{
  return (NSString *)@"com.apple.SpringBoardHome.icon-tint";
}

+ (NSString)name
{
  return (NSString *)@"IconTintColor";
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (NSObject)defaultValue
{
  return 0;
}

@end