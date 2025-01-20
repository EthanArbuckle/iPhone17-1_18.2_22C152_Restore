@interface FMDeviceAnnotation
- (NSString)debugDescription;
@end

@implementation FMDeviceAnnotation

- (NSString)debugDescription
{
  v2 = self;
  sub_1003E9058();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC6FindMy18FMDeviceAnnotation_device;
  uint64_t v4 = type metadata accessor for FMIPDevice();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy18FMDeviceAnnotation_part, (uint64_t *)&unk_1006AFE30);

  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy18FMDeviceAnnotation_updateQueue);
}

@end