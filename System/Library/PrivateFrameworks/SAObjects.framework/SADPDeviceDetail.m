@interface SADPDeviceDetail
+ (id)deviceDetail;
- (BOOL)canPlaySound;
- (BOOL)foundNearby;
- (BOOL)thisDevice;
- (NSArray)productTypes;
- (NSString)deviceClass;
- (NSString)deviceId;
- (NSString)deviceLocality;
- (NSString)deviceName;
- (NSString)emoji;
- (NSString)productName;
- (SAPerson)owner;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCanPlaySound:(BOOL)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setDeviceLocality:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEmoji:(id)a3;
- (void)setFoundNearby:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductTypes:(id)a3;
- (void)setThisDevice:(BOOL)a3;
@end

@implementation SADPDeviceDetail

- (id)groupIdentifier
{
  return @"com.apple.ace.devicePlaySound";
}

- (id)encodedClassName
{
  return @"DeviceDetail";
}

+ (id)deviceDetail
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)canPlaySound
{
  return AceObjectBoolForProperty(self, @"canPlaySound");
}

- (void)setCanPlaySound:(BOOL)a3
{
}

- (NSString)deviceClass
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceClass"];
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)deviceId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceId"];
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)deviceLocality
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceLocality"];
}

- (void)setDeviceLocality:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceName"];
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)emoji
{
  return (NSString *)[(AceObject *)self propertyForKey:@"emoji"];
}

- (void)setEmoji:(id)a3
{
}

- (BOOL)foundNearby
{
  return AceObjectBoolForProperty(self, @"foundNearby");
}

- (void)setFoundNearby:(BOOL)a3
{
}

- (SAPerson)owner
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, @"owner");
}

- (void)setOwner:(id)a3
{
}

- (NSString)productName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"productName"];
}

- (void)setProductName:(id)a3
{
}

- (NSArray)productTypes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"productTypes"];
}

- (void)setProductTypes:(id)a3
{
}

- (BOOL)thisDevice
{
  return AceObjectBoolForProperty(self, @"thisDevice");
}

- (void)setThisDevice:(BOOL)a3
{
}

@end