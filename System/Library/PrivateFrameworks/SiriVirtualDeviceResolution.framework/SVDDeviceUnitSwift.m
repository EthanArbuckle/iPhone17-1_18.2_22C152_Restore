@interface SVDDeviceUnitSwift
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isCommunalDevice;
- (BOOL)isEqual:(id)a3;
- (NSString)assistantId;
- (NSString)description;
- (NSString)homeKitAccessoryIdentifier;
- (NSString)identifier;
- (NSString)mediaRouteIdentifier;
- (NSString)name;
- (NSString)roomName;
- (SVDDeviceUnitSwift)init;
- (SVDDeviceUnitSwift)initWithCoder:(id)a3;
- (SVDDeviceUnitSwift)initWithIdentifier:(id)a3 assistantId:(id)a4 builder:(id)a5;
- (int64_t)hash;
- (int64_t)proximity;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDDeviceUnitSwift

+ (BOOL)supportsSecureCoding
{
  return static DeviceUnit.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (NSString)identifier
{
  return (NSString *)sub_1C9DE46D8((uint64_t)self, (uint64_t)a2, (void (*)(void))DeviceUnit.identifier.getter);
}

- (NSString)assistantId
{
  return (NSString *)sub_1C9DE46D8((uint64_t)self, (uint64_t)a2, (void (*)(void))DeviceUnit.assistantId.getter);
}

- (NSString)name
{
  return (NSString *)sub_1C9DE4790((uint64_t)self, (uint64_t)a2, (void (*)(void))DeviceUnit.name.getter);
}

- (NSString)roomName
{
  return (NSString *)sub_1C9DE4790((uint64_t)self, (uint64_t)a2, (void (*)(void))DeviceUnit.roomName.getter);
}

- (int64_t)proximity
{
  return DeviceUnit.proximity.getter();
}

- (NSString)mediaRouteIdentifier
{
  return (NSString *)sub_1C9DE4790((uint64_t)self, (uint64_t)a2, (void (*)(void))DeviceUnit.mediaRouteIdentifier.getter);
}

- (BOOL)isCommunalDevice
{
  return DeviceUnit.isCommunalDevice.getter() & 1;
}

- (NSString)homeKitAccessoryIdentifier
{
  return (NSString *)sub_1C9DE4790((uint64_t)self, (uint64_t)a2, (void (*)(void))DeviceUnit.homeKitAccessoryIdentifier.getter);
}

- (SVDDeviceUnitSwift)initWithIdentifier:(id)a3 assistantId:(id)a4 builder:(id)a5
{
  v5 = _Block_copy(a5);
  uint64_t v6 = sub_1C9E0D120();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1C9E0D120();
  uint64_t v11 = v10;
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v12 = sub_1C9DE8A14;
  }
  else
  {
    v12 = 0;
  }
  return (SVDDeviceUnitSwift *)DeviceUnit.init(identifier:assistantId:builder:)(v6, v8, v9, v11, (void (*)(uint64_t))v12);
}

- (SVDDeviceUnitSwift)initWithCoder:(id)a3
{
  return (SVDDeviceUnitSwift *)DeviceUnit.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C9DE5388(v4);
}

- (NSString)description
{
  v2 = self;
  sub_1C9DE5684();

  v3 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1C9DE75A4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1C9DE5944);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1C9DE5A54();

  return v3;
}

- (SVDDeviceUnitSwift)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_27();
  swift_bridgeObjectRelease();
}

@end