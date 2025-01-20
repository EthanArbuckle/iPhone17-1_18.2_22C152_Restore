@interface MigratorCache
+ (id)cacheFileNameWithPersonaIdentifier:(id)a3;
+ (id)migratorCacheURLFor:(id)a3;
- (BOOL)isEmpty;
- (BOOL)writeTo:(id)a3 error:(id *)a4;
- (NSSet)bundleIDs;
- (_TtC7backupd13MigratorCache)init;
- (_TtC7backupd13MigratorCache)initWithUrl:(id)a3 error:(id *)a4;
- (void)addBundleID:(id)a3;
- (void)setBundleIDs:(id)a3;
@end

@implementation MigratorCache

+ (id)migratorCacheURLFor:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100044638(v7, v8);
  swift_bridgeObjectRelease();
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v11;
}

- (NSSet)bundleIDs
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)v2.super.isa;
}

- (void)setBundleIDs:(id)a3
{
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7backupd13MigratorCache_bundleIDs);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)isEmpty
{
  NSSet v2 = (char *)self + OBJC_IVAR____TtC7backupd13MigratorCache_bundleIDs;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16) == 0;
}

- (void)addBundleID:(id)a3
{
  Swift::Int v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  Swift::Int v6 = v5;
  uint64_t v7 = self;
  sub_100044A80(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC7backupd13MigratorCache)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC7backupd13MigratorCache_lock;
  type metadata accessor for MBUnfairLock();
  Swift::Int v5 = (objc_class *)swift_allocObject();
  Swift::Int v6 = self;
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *((void *)v5 + 2) = v7;
  *uint64_t v7 = 0;
  *(Class *)((char *)&self->super.isa + v4) = v5;
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC7backupd13MigratorCache_bundleIDs) = (Class)&_swiftEmptySetSingleton;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return [(MigratorCache *)&v9 init];
}

- (BOOL)writeTo:(id)a3 error:(id *)a4
{
  swift_getObjectType();
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  objc_super v9 = self;
  PropertyListEncoder.init()();
  v14[1] = v9;
  sub_100045B54(&qword_10047E068);
  uint64_t v10 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  unint64_t v12 = v11;
  swift_release();
  Data.write(to:options:)();
  sub_10000C6C0(v10, v12);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (_TtC7backupd13MigratorCache)initWithUrl:(id)a3 error:(id *)a4
{
  uint64_t v4 = type metadata accessor for URL();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC7backupd13MigratorCache *)sub_100045494((uint64_t)v6);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

+ (id)cacheFileNameWithPersonaIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3._object = (void *)0x80000001003077B0;
  v3._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v4;
}

@end