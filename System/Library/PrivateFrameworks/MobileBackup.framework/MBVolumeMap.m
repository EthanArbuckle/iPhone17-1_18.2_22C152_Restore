@interface MBVolumeMap
+ (id)createOrLoadForPersona:(id)a3 outLoadType:(int64_t *)a4 error:(id *)a5;
+ (id)createOrLoadFromPlistPath:(id)a3 volumesToBackUp:(id)a4 outLoadType:(int64_t *)a5 error:(id *)a6;
+ (id)loadTypeToStringWithLoadType:(int64_t)a3;
- (_TtC7backupd11MBVolumeMap)init;
- (id)volumeIdentifierForVolumeUUID:(id)a3;
@end

@implementation MBVolumeMap

- (_TtC7backupd11MBVolumeMap)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7backupd11MBVolumeMap__volumeIdentifiersByAPFSVolumeUUID) = (Class)sub_100048F44((uint64_t)&_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return [(MBVolumeMap *)&v6 init];
}

- (id)volumeIdentifierForVolumeUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  v9 = sub_100009A70((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

+ (id)createOrLoadForPersona:(id)a3 outLoadType:(int64_t *)a4 error:(id *)a5
{
  id v6 = a3;
  sub_10000C7C8(v6, a4);
  v8 = v7;

  return v8;
}

+ (id)createOrLoadFromPlistPath:(id)a3 volumesToBackUp:(id)a4 outLoadType:(int64_t *)a5 error:(id *)a6
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = sub_10000C170(v7, v9, v10, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

+ (id)loadTypeToStringWithLoadType:(int64_t)a3
{
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v3;
}

- (void).cxx_destruct
{
}

@end