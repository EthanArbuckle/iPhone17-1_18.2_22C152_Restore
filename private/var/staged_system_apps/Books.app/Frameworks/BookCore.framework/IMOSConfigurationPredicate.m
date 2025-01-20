@interface IMOSConfigurationPredicate
+ (id)OSXPredicate;
+ (id)iOSPredicate;
@end

@implementation IMOSConfigurationPredicate

+ (id)iOSPredicate
{
  return +[IMBoolValueConfigurationPredicate predicateWithValue:1];
}

+ (id)OSXPredicate
{
  return +[IMBoolValueConfigurationPredicate predicateWithValue:0];
}

@end