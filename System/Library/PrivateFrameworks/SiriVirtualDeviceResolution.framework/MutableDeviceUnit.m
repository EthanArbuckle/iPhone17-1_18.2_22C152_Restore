@interface MutableDeviceUnit
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

@implementation MutableDeviceUnit

- (NSString)name
{
  if (*(void *)&self->name[8])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1C9E0D120();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *(void *)self->name = v4;
  *(void *)&self->name[8] = v5;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (NSString)roomName
{
  if (*(void *)&self->roomName[8])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setRoomName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1C9E0D120();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *(void *)self->roomName = v4;
  *(void *)&self->roomName[8] = v5;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (int64_t)proximity
{
  return *(void *)self->proximity;
}

- (void)setProximity:(int64_t)a3
{
  *(void *)self->proximity = a3;
}

- (NSString)mediaRouteIdentifier
{
  if (*(void *)&self->mediaRouteIdentifier[8])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setMediaRouteIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1C9E0D120();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *(void *)self->mediaRouteIdentifier = v4;
  *(void *)&self->mediaRouteIdentifier[8] = v5;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)isCommunalDevice
{
  return self->isCommunalDevice[0];
}

- (void)setIsCommunalDevice:(BOOL)a3
{
  self->isCommunalDevice[0] = a3;
}

- (NSString)homeKitAccessoryIdentifier
{
  if (*(void *)&self->homeKitAccessoryIdentifier[15])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setHomeKitAccessoryIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1C9E0D120();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *(void *)&self->homeKitAccessoryIdentifier[7] = v4;
  *(void *)&self->homeKitAccessoryIdentifier[15] = v5;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

@end