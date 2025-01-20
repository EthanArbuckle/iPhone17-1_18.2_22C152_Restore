@interface _UIFloatingTabBarItemBackgroundScaleTrait
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation _UIFloatingTabBarItemBackgroundScaleTrait

+ (int64_t)defaultValue
{
  return 0;
}

+ (NSString)name
{
  return (NSString *)@"TabItemBackground.scale";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.UIKit.TabBarItemBackground.scale";
}

@end