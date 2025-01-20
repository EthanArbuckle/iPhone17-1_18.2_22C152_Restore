@interface MBRestoreDepot
+ (BOOL)disposeAllDepotsForPersona:(id)a3 error:(id *)a4;
+ (id)restoreDepotWithPersona:(id)a3 destination:(id)a4 restoreDepotOverridePath:(id)a5 error:(id *)a6;
- (BOOL)containsAsset:(id)a3 alreadyPresentOut:(BOOL *)a4 error:(id *)a5;
- (BOOL)depositWithAsset:(id)a3 decrypter:(id)a4 assetPath:(id)a5 error:(id *)a6;
- (BOOL)disposeWithShouldDelete:(BOOL)a3 error:(id *)a4;
- (NSString)description;
- (_TtC7backupd14MBRestoreDepot)init;
- (id)stagingTemporaryDirectoryWithIdentifier:(id)a3 error:(id *)a4;
@end

@implementation MBRestoreDepot

+ (id)restoreDepotWithPersona:(id)a3 destination:(id)a4 restoreDepotOverridePath:(id)a5 error:(id *)a6
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (a5)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v13 = a3;
  v14 = sub_100033A38(v13, v8, v10, v11, a5);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v14;
}

- (BOOL)disposeWithShouldDelete:(BOOL)a3 error:(id *)a4
{
  v5 = self;
  sub_10002DD60(a3);

  return 1;
}

+ (BOOL)disposeAllDepotsForPersona:(id)a3 error:(id *)a4
{
  swift_getObjCClassMetadata();
  id v5 = a3;
  sub_10002ED9C(v5);

  return 1;
}

- (NSString)description
{
  v2 = self;
  sub_10002F59C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)stagingTemporaryDirectoryWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  uint64_t v8 = self;
  id v9 = sub_10002FD1C(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (BOOL)containsAsset:(id)a3 alreadyPresentOut:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  sub_10002DE24((uint64_t)v7, a4);

  return 1;
}

- (BOOL)depositWithAsset:(id)a3 decrypter:(id)a4 assetPath:(id)a5 error:(id *)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_10002DF30(v9, a4);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return 1;
}

- (_TtC7backupd14MBRestoreDepot)init
{
  result = (_TtC7backupd14MBRestoreDepot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001BFE4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBRestoreDepot___depotRootPath));
  swift_release();
}

@end