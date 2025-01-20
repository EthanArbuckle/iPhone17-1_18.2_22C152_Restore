@interface MBVolumeIdentifier
- (NSDate)creationDate;
- (NSString)description;
- (NSUUID)apfsVolumeUUID;
- (NSUUID)backupVolumeUUID;
- (_TtC7backupd18MBVolumeIdentifier)init;
@end

@implementation MBVolumeIdentifier

- (NSUUID)backupVolumeUUID
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  return (NSUUID *)v2.super.isa;
}

- (NSUUID)apfsVolumeUUID
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  return (NSUUID *)v2.super.isa;
}

- (NSDate)creationDate
{
  v2.super.isa = Date._bridgeToObjectiveC()().super.isa;
  return (NSDate *)v2.super.isa;
}

- (NSString)description
{
  NSDate v2 = self;
  sub_100005E1C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC7backupd18MBVolumeIdentifier)init
{
  result = (_TtC7backupd18MBVolumeIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC7backupd18MBVolumeIdentifier_backupVolumeUUID;
  uint64_t v4 = type metadata accessor for UUID();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC7backupd18MBVolumeIdentifier_apfsVolumeUUID, v4);
  v6 = (char *)self + OBJC_IVAR____TtC7backupd18MBVolumeIdentifier_creationDate;
  uint64_t v7 = type metadata accessor for Date();
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
}

@end