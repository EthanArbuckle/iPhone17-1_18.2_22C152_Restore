@interface FMFenceMapTransientRecord
- (NSString)description;
- (_TtC6FindMy25FMFenceMapTransientRecord)init;
@end

@implementation FMFenceMapTransientRecord

- (NSString)description
{
  v2 = self;
  sub_1002E94C4();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC6FindMy25FMFenceMapTransientRecord)init
{
  result = (_TtC6FindMy25FMFenceMapTransientRecord *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_location, (uint64_t *)&unk_1006AF710);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_labelledLocation, &qword_1006B9D68);

  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_addressType, (uint64_t *)&unk_1006BF070);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_fmfPlacemark, &qword_1006AF730);
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_completedGeoWorkGroup);
}

@end