@interface NHOIntentConstants
+ (NSString)appContainerBundleIdentifier;
+ (NSString)widgetBundleIdentifier;
- (NHOIntentConstants)init;
@end

@implementation NHOIntentConstants

+ (NSString)appContainerBundleIdentifier
{
  v2 = (void *)sub_2573217E8();

  return (NSString *)v2;
}

+ (NSString)widgetBundleIdentifier
{
  v2 = (void *)sub_2573217E8();

  return (NSString *)v2;
}

- (NHOIntentConstants)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(NHOIntentConstants *)&v3 init];
}

@end