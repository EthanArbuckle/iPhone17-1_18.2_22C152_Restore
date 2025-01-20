@interface SFTraitBackgroundBlurEffect
+ (NSObject)defaultValue;
+ (NSString)name;
@end

@implementation SFTraitBackgroundBlurEffect

+ (NSString)name
{
  return (NSString *)@"backgroundBlurEffect";
}

+ (NSObject)defaultValue
{
  return 0;
}

@end