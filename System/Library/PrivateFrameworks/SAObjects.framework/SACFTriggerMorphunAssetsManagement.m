@interface SACFTriggerMorphunAssetsManagement
+ (id)triggerMorphunAssetsManagement;
- (BOOL)requiresResponse;
- (NSString)language;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLanguage:(id)a3;
@end

@implementation SACFTriggerMorphunAssetsManagement

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"TriggerMorphunAssetsManagement";
}

+ (id)triggerMorphunAssetsManagement
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end