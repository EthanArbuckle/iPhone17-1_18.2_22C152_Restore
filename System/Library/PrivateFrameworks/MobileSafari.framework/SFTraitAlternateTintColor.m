@interface SFTraitAlternateTintColor
+ (NSObject)defaultValue;
+ (NSString)name;
@end

@implementation SFTraitAlternateTintColor

+ (NSObject)defaultValue
{
  return 0;
}

+ (NSString)name
{
  return (NSString *)@"alternateTintColor";
}

@end