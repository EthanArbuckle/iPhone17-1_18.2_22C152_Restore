@interface SAHASearchCriteriaFilter
+ (id)searchCriteriaFilter;
- (NSString)accessoryName;
- (NSString)attribute;
- (NSString)entityType;
- (NSString)groupName;
- (NSString)homeName;
- (NSString)roomName;
- (NSString)sceneName;
- (NSString)sceneType;
- (NSString)serviceName;
- (NSString)serviceSubType;
- (NSString)serviceType;
- (NSString)zoneName;
- (NSURL)accessoryIdentifier;
- (NSURL)homeIdentifier;
- (NSURL)roomIdentifier;
- (NSURL)sceneIdentifier;
- (NSURL)serviceGroupIdentifier;
- (NSURL)serviceIdentifier;
- (NSURL)zoneIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setAttribute:(id)a3;
- (void)setEntityType:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setHomeIdentifier:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setRoomIdentifier:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSceneName:(id)a3;
- (void)setSceneType:(id)a3;
- (void)setServiceGroupIdentifier:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceSubType:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)setZoneName:(id)a3;
@end

@implementation SAHASearchCriteriaFilter

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"SearchCriteriaFilter";
}

+ (id)searchCriteriaFilter
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)accessoryIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"accessoryIdentifier");
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSString)accessoryName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"accessoryName"];
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)attribute
{
  return (NSString *)[(AceObject *)self propertyForKey:@"attribute"];
}

- (void)setAttribute:(id)a3
{
}

- (NSString)entityType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"entityType"];
}

- (void)setEntityType:(id)a3
{
}

- (NSString)groupName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupName"];
}

- (void)setGroupName:(id)a3
{
}

- (NSURL)homeIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"homeIdentifier");
}

- (void)setHomeIdentifier:(id)a3
{
}

- (NSString)homeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homeName"];
}

- (void)setHomeName:(id)a3
{
}

- (NSURL)roomIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"roomIdentifier");
}

- (void)setRoomIdentifier:(id)a3
{
}

- (NSString)roomName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"roomName"];
}

- (void)setRoomName:(id)a3
{
}

- (NSURL)sceneIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"sceneIdentifier");
}

- (void)setSceneIdentifier:(id)a3
{
}

- (NSString)sceneName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sceneName"];
}

- (void)setSceneName:(id)a3
{
}

- (NSString)sceneType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sceneType"];
}

- (void)setSceneType:(id)a3
{
}

- (NSURL)serviceGroupIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"serviceGroupIdentifier");
}

- (void)setServiceGroupIdentifier:(id)a3
{
}

- (NSURL)serviceIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"serviceIdentifier");
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSString)serviceName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serviceName"];
}

- (void)setServiceName:(id)a3
{
}

- (NSString)serviceSubType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serviceSubType"];
}

- (void)setServiceSubType:(id)a3
{
}

- (NSString)serviceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serviceType"];
}

- (void)setServiceType:(id)a3
{
}

- (NSURL)zoneIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"zoneIdentifier");
}

- (void)setZoneIdentifier:(id)a3
{
}

- (NSString)zoneName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"zoneName"];
}

- (void)setZoneName:(id)a3
{
}

@end