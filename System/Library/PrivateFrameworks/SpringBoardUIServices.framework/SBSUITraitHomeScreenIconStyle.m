@interface SBSUITraitHomeScreenIconStyle
+ (BOOL)affectsColorAppearance;
+ (NSObject)defaultValue;
+ (NSString)identifier;
+ (NSString)name;
@end

@implementation SBSUITraitHomeScreenIconStyle

+ (NSString)identifier
{
  return (NSString *)@"com.apple.SpringBoardUIServices.home-screen-icon-style";
}

+ (NSString)name
{
  return (NSString *)@"HomeScreenIconStyle";
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