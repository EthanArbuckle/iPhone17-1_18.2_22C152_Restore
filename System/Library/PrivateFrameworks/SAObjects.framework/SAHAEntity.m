@interface SAHAEntity
+ (id)entity;
- (NSArray)attributes;
- (NSArray)relatedEntityIdentifiers;
- (NSArray)sceneActions;
- (NSArray)serviceGroupIdentifiers;
- (NSArray)status;
- (NSArray)targetAttributes;
- (NSArray)zoneIdentifiers;
- (NSNumber)currentDevice;
- (NSString)accessory;
- (NSString)entityType;
- (NSString)groupType;
- (NSString)hashedRouteUID;
- (NSString)home;
- (NSString)name;
- (NSString)room;
- (NSString)sceneType;
- (NSString)serviceGroup;
- (NSString)serviceSubType;
- (NSString)serviceType;
- (NSString)zone;
- (NSURL)accessoryIdentifier;
- (NSURL)homeIdentifier;
- (NSURL)primaryServiceIdentifier;
- (NSURL)roomIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccessory:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setCurrentDevice:(id)a3;
- (void)setEntityType:(id)a3;
- (void)setGroupType:(id)a3;
- (void)setHashedRouteUID:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPrimaryServiceIdentifier:(id)a3;
- (void)setRelatedEntityIdentifiers:(id)a3;
- (void)setRoom:(id)a3;
- (void)setRoomIdentifier:(id)a3;
- (void)setSceneActions:(id)a3;
- (void)setSceneType:(id)a3;
- (void)setServiceGroup:(id)a3;
- (void)setServiceGroupIdentifiers:(id)a3;
- (void)setServiceSubType:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTargetAttributes:(id)a3;
- (void)setZone:(id)a3;
- (void)setZoneIdentifiers:(id)a3;
@end

@implementation SAHAEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"Entity";
}

+ (id)entity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)accessory
{
  return (NSString *)[(AceObject *)self propertyForKey:@"accessory"];
}

- (void)setAccessory:(id)a3
{
}

- (NSURL)accessoryIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"accessoryIdentifier");
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSArray)attributes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"attributes"];
}

- (void)setAttributes:(id)a3
{
}

- (NSNumber)currentDevice
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"currentDevice"];
}

- (void)setCurrentDevice:(id)a3
{
}

- (NSString)entityType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"entityType"];
}

- (void)setEntityType:(id)a3
{
}

- (NSString)groupType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupType"];
}

- (void)setGroupType:(id)a3
{
}

- (NSString)hashedRouteUID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hashedRouteUID"];
}

- (void)setHashedRouteUID:(id)a3
{
}

- (NSString)home
{
  return (NSString *)[(AceObject *)self propertyForKey:@"home"];
}

- (void)setHome:(id)a3
{
}

- (NSURL)homeIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"homeIdentifier");
}

- (void)setHomeIdentifier:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSURL)primaryServiceIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"primaryServiceIdentifier");
}

- (void)setPrimaryServiceIdentifier:(id)a3
{
}

- (NSArray)relatedEntityIdentifiers
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"relatedEntityIdentifiers");
}

- (void)setRelatedEntityIdentifiers:(id)a3
{
}

- (NSString)room
{
  return (NSString *)[(AceObject *)self propertyForKey:@"room"];
}

- (void)setRoom:(id)a3
{
}

- (NSURL)roomIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"roomIdentifier");
}

- (void)setRoomIdentifier:(id)a3
{
}

- (NSArray)sceneActions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"sceneActions", v3);
}

- (void)setSceneActions:(id)a3
{
}

- (NSString)sceneType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sceneType"];
}

- (void)setSceneType:(id)a3
{
}

- (NSString)serviceGroup
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serviceGroup"];
}

- (void)setServiceGroup:(id)a3
{
}

- (NSArray)serviceGroupIdentifiers
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"serviceGroupIdentifiers");
}

- (void)setServiceGroupIdentifiers:(id)a3
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

- (NSArray)status
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"status"];
}

- (void)setStatus:(id)a3
{
}

- (NSArray)targetAttributes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"targetAttributes"];
}

- (void)setTargetAttributes:(id)a3
{
}

- (NSString)zone
{
  return (NSString *)[(AceObject *)self propertyForKey:@"zone"];
}

- (void)setZone:(id)a3
{
}

- (NSArray)zoneIdentifiers
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"zoneIdentifiers");
}

- (void)setZoneIdentifiers:(id)a3
{
}

@end