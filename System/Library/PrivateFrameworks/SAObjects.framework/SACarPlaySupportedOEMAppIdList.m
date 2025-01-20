@interface SACarPlaySupportedOEMAppIdList
+ (id)carPlaySupportedOEMAppIdList;
- (NSArray)appIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppIds:(id)a3;
@end

@implementation SACarPlaySupportedOEMAppIdList

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CarPlaySupportedOEMAppIdList";
}

+ (id)carPlaySupportedOEMAppIdList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)appIds
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"appIds"];
}

- (void)setAppIds:(id)a3
{
}

@end