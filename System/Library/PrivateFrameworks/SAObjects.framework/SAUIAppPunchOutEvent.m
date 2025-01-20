@interface SAUIAppPunchOutEvent
+ (id)appPunchOutEvent;
- (BOOL)requiresResponse;
- (NSString)appDisplayName;
- (NSString)bundleId;
- (NSString)originalCommandId;
- (NSString)punchOutName;
- (NSURL)punchOutUri;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppDisplayName:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setOriginalCommandId:(id)a3;
- (void)setPunchOutName:(id)a3;
- (void)setPunchOutUri:(id)a3;
@end

@implementation SAUIAppPunchOutEvent

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AppPunchOutEvent";
}

+ (id)appPunchOutEvent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appDisplayName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appDisplayName"];
}

- (void)setAppDisplayName:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleId"];
}

- (void)setBundleId:(id)a3
{
}

- (NSString)originalCommandId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"originalCommandId"];
}

- (void)setOriginalCommandId:(id)a3
{
}

- (NSString)punchOutName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"punchOutName"];
}

- (void)setPunchOutName:(id)a3
{
}

- (NSURL)punchOutUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"punchOutUri");
}

- (void)setPunchOutUri:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end