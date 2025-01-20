@interface SADeviceSetupContext
+ (id)setupContext;
- (NSString)setupSceneId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSetupSceneId:(id)a3;
@end

@implementation SADeviceSetupContext

- (id)groupIdentifier
{
  return @"com.apple.ace.device";
}

- (id)encodedClassName
{
  return @"SetupContext";
}

+ (id)setupContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)setupSceneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"setupSceneId"];
}

- (void)setSetupSceneId:(id)a3
{
}

@end