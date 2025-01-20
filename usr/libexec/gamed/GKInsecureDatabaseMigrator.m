@interface GKInsecureDatabaseMigrator
- (GKInsecureDatabaseMigrator)init;
- (GKInsecureDatabaseMigrator)initWithInsecureDatabaseURL:(id)a3 secureDatabaseURL:(id)a4 persistentStoreCoordinator:(id)a5 options:(id)a6 fileManager:(id)a7 bundleID:(id)a8;
- (void)migrate;
@end

@implementation GKInsecureDatabaseMigrator

- (GKInsecureDatabaseMigrator)initWithInsecureDatabaseURL:(id)a3 secureDatabaseURL:(id)a4 persistentStoreCoordinator:(id)a5 options:(id)a6 fileManager:(id)a7 bundleID:(id)a8
{
  uint64_t v12 = sub_10000D938(&qword_100327E70);
  uint64_t v13 = *(void *)(*(void *)(v12 - 8) + 64);
  __chkstk_darwin(v12 - 8, v14);
  v15 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v16 = type metadata accessor for URL();
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v16 = type metadata accessor for URL();
    uint64_t v17 = 1;
  }
  uint64_t v18 = 1;
  uint64_t v19 = sub_10000D97C((uint64_t)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v17, 1, v16);
  __chkstk_darwin(v19, v20);
  v21 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = 0;
  }
  uint64_t v22 = type metadata accessor for URL();
  sub_10000D97C((uint64_t)v21, v18, 1, v22);
  uint64_t v23 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (GKInsecureDatabaseMigrator *)sub_1001A9F08((uint64_t)v15, (uint64_t)v21, (uint64_t)a5, v23, (uint64_t)a7, v24, v25);
}

- (void)migrate
{
  v2 = self;
  InsecureDatabaseMigrator.migrate()();
}

- (GKInsecureDatabaseMigrator)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___GKInsecureDatabaseMigrator_insecureDatabaseURL;
  uint64_t v4 = type metadata accessor for URL();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___GKInsecureDatabaseMigrator_secureDatabaseURL, v4);

  sub_100016C38((uint64_t)self + OBJC_IVAR___GKInsecureDatabaseMigrator_persistentStoreCoordinator);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end