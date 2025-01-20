@interface RPRSDDeviceInfo_Internal
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSUUID)uuid;
- (RPRSDDeviceInfo_Internal)init;
- (int64_t)hash;
@end

@implementation RPRSDDeviceInfo_Internal

- (NSString)name
{
  RSDDeviceInfo.name.getter();
  v2 = (void *)sub_1D7660AE0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSUUID)uuid
{
  uint64_t v2 = sub_1D765FFD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  RSDDeviceInfo.uuid.getter((uint64_t)v5);
  v6 = (void *)sub_1D765FFA0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSUUID *)v6;
}

- (int64_t)hash
{
  uint64_t v2 = self;
  int64_t v3 = sub_1D75B2840();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1D7661070();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1D75B28F8((uint64_t)v8);

  sub_1D758DEC0((uint64_t)v8);
  return v6 & 1;
}

- (RPRSDDeviceInfo_Internal)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  int64_t v3 = (char *)self + OBJC_IVAR___RPRSDDeviceInfo_Internal_uuid;
  uint64_t v4 = sub_1D765FFD0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end