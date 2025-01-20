@interface GKSecureFileLocator
+ (NSString)globalContextID;
- (GKSecureFileLocator)init;
- (GKSecureFileLocator)initWithFileManager:(id)a3;
- (id)cacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5;
- (id)databaseDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5;
- (id)databaseFileWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5 name:(id)a6;
- (id)globalDatabaseFileWithBundleID:(id)a3 language:(id)a4 name:(id)a5;
- (void)removeCacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5;
- (void)removeCaches;
@end

@implementation GKSecureFileLocator

+ (NSString)globalContextID
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (GKSecureFileLocator)initWithFileManager:(id)a3
{
  id v3 = a3;
  sub_1001AC10C();
  return result;
}

- (id)cacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5
{
  return sub_1001AC8B0();
}

- (id)databaseDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5
{
  return sub_1001AC8B0();
}

- (id)databaseFileWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5 name:(id)a6
{
  uint64_t v7 = sub_10000D938(&qword_100327E70);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = self;
  sub_1001AC9E0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = type metadata accessor for URL();
  v14 = 0;
  if (sub_10000DB14((uint64_t)v10, 1, v12) != 1)
  {
    URL._bridgeToObjectiveC()(v13);
    v14 = v15;
    (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v10, v12);
  }

  return v14;
}

- (id)globalDatabaseFileWithBundleID:(id)a3 language:(id)a4 name:(id)a5
{
  uint64_t v6 = sub_10000D938(&qword_100327E70);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  sub_1001ACF84();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = type metadata accessor for URL();
  v13 = 0;
  if (sub_10000DB14((uint64_t)v9, 1, v11) != 1)
  {
    URL._bridgeToObjectiveC()(v12);
    v13 = v14;
    (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v9, v11);
  }

  return v13;
}

- (void)removeCacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = self;
  sub_1001AD120();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)removeCaches
{
  NSString v2 = self;
  sub_1001AD544();
}

- (GKSecureFileLocator)init
{
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___GKSecureFileLocator_rootDirectory;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR___GKSecureFileLocator_parentCachesDirectory;

  v6(v5, v4);
}

@end