@interface RDStagedLightweightCoreDataMigrationCoordinator
+ (id)createCoordinatorForMigratingReminderDataWithClientNamesOfREMCDChangeTrackingStateWhichShouldNotBeResetUponPersistentHistoryTruncation:(id)a3;
+ (id)stagedMigrationsInfoForPersistentStoreAt:(id)a3;
- (BOOL)cloneStoreAtSourceStoreURL:(id)a3 destinationStoreURL:(id)a4 error:(id *)a5;
- (BOOL)performStagedLightweightMigrationForStoreAtStoreURL:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4 postMigrationDataUpdatesTransactionAuthor:(id)a5 error:(id *)a6;
- (BOOL)shouldPerformStagedLightweightMigrationForStoreAtStoreURL:(id)a3;
- (_TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator)init;
@end

@implementation RDStagedLightweightCoreDataMigrationCoordinator

- (BOOL)shouldPerformStagedLightweightMigrationForStoreAtStoreURL:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  char v9 = sub_10037D784((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (BOOL)performStagedLightweightMigrationForStoreAtStoreURL:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4 postMigrationDataUpdatesTransactionAuthor:(id)a5 error:(id *)a6
{
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = ((char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    sub_1000963CC(0, (unint64_t *)&qword_10090C120);
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a5)
  {
    a5 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  v15 = self;
  sub_10037DDF4(v12, (uint64_t)a4, a5, v14);
  (*(void (**)(NSObject *, uint64_t))(v10 + 8))(v12, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)cloneStoreAtSourceStoreURL:(id)a3 destinationStoreURL:(id)a4 error:(id *)a5
{
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  uint64_t v11 = &v14[-v10];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10038223C((uint64_t)v11, (uint64_t)v8);
  v12 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v12(v8, v5);
  v12(v11, v5);
  return 1;
}

+ (id)stagedMigrationsInfoForPersistentStoreAt:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = sub_100382DBC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v7)
  {
    sub_100094134((uint64_t *)&unk_100917670);
    v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8.super.isa = 0;
  }

  return v8.super.isa;
}

- (_TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator)init
{
  result = (_TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator_bundle));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (id)createCoordinatorForMigratingReminderDataWithClientNamesOfREMCDChangeTrackingStateWhichShouldNotBeResetUponPersistentHistoryTruncation:(id)a3
{
  if (a3) {
    uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = sub_1005EAAB8(v3);
  swift_bridgeObjectRelease();

  return v4;
}

@end