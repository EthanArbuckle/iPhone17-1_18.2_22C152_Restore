@interface SAGlance
+ (id)glance;
- (NSDictionary)localizedGlanceDisplayNameMap;
- (NSString)appId;
- (NSString)glanceDisplayName;
- (NSString)glanceId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppId:(id)a3;
- (void)setGlanceDisplayName:(id)a3;
- (void)setGlanceId:(id)a3;
- (void)setLocalizedGlanceDisplayNameMap:(id)a3;
@end

@implementation SAGlance

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Glance";
}

+ (id)glance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appId"];
}

- (void)setAppId:(id)a3
{
}

- (NSString)glanceDisplayName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"glanceDisplayName"];
}

- (void)setGlanceDisplayName:(id)a3
{
}

- (NSString)glanceId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"glanceId"];
}

- (void)setGlanceId:(id)a3
{
}

- (NSDictionary)localizedGlanceDisplayNameMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"localizedGlanceDisplayNameMap"];
}

- (void)setLocalizedGlanceDisplayNameMap:(id)a3
{
}

@end