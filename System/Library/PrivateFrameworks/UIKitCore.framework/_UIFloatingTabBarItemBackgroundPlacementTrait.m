@interface _UIFloatingTabBarItemBackgroundPlacementTrait
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation _UIFloatingTabBarItemBackgroundPlacementTrait

+ (int64_t)defaultValue
{
  return 0;
}

+ (NSString)name
{
  return (NSString *)@"TabItemBackground.placement";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.UIKit.TabBarItemBackground.placement";
}

@end