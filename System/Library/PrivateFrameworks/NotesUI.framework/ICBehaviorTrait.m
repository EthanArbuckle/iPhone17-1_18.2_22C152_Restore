@interface ICBehaviorTrait
+ (BOOL)affectsColorAppearance;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation ICBehaviorTrait

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"Behavior";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.mobilenotes.behavior";
}

@end