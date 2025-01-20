@interface _SVDMutableDeviceUnit
- (BOOL)isCommunalDevice;
- (NSString)homeKitAccessoryIdentifier;
- (NSString)mediaRouteIdentifier;
- (NSString)name;
- (NSString)roomName;
- (int64_t)proximity;
- (void)setHomeKitAccessoryIdentifier:(id)a3;
- (void)setIsCommunalDevice:(BOOL)a3;
- (void)setMediaRouteIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setProximity:(int64_t)a3;
- (void)setRoomName:(id)a3;
@end

@implementation _SVDMutableDeviceUnit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setHomeKitAccessoryIdentifier:(id)a3
{
}

- (NSString)homeKitAccessoryIdentifier
{
  return self->_homeKitAccessoryIdentifier;
}

- (void)setIsCommunalDevice:(BOOL)a3
{
  self->_isCommunalDevice = a3;
}

- (BOOL)isCommunalDevice
{
  return self->_isCommunalDevice;
}

- (void)setMediaRouteIdentifier:(id)a3
{
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setRoomName:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

@end