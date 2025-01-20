@interface RDXPCSyncInterfacePerformer
- (_TtC7remindd27RDXPCSyncInterfacePerformer)init;
- (void)debugDownloadMigrationCacheWithAccountID:(id)a3 completion:(id)a4;
- (void)deleteApplicationDataFromCloudKitWithAccountID:(id)a3 completion:(id)a4;
- (void)fetchServerRecordFor:(id)a3 completion:(id)a4;
- (void)fetchUserRecordWithAccountID:(id)a3 completion:(id)a4;
- (void)migrateICloudCalDavToCloudKitWithAccountID:(id)a3 disableCache:(BOOL)a4 userInitiated:(BOOL)a5 completion:(id)a6;
- (void)observeCloudKitNetworkActivityChanges;
- (void)restartCloudKitSyncWithReason:(id)a3 bypassThrottler:(BOOL)a4 completion:(id)a5;
- (void)setMigrationStateToDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 createZoneAccountIfFinishMigration:(BOOL)a5 accountID:(id)a6 completion:(id)a7;
- (void)syncCloudKitWithReason:(id)a3 discretionary:(BOOL)a4 bypassThrottler:(BOOL)a5 completion:(id)a6;
- (void)syncDataAccessAccountsWithAccountIDs:(id)a3 bypassThrottler:(BOOL)a4 completion:(id)a5;
@end

@implementation RDXPCSyncInterfacePerformer

- (void)syncCloudKitWithReason:(id)a3 discretionary:(BOOL)a4 bypassThrottler:(BOOL)a5 completion:(id)a6
{
}

- (void)restartCloudKitSyncWithReason:(id)a3 bypassThrottler:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  v11 = self;
  sub_10013FBEC(v10, a4, (uint64_t)sub_10011FBC8, v9);

  swift_release();
}

- (void)syncDataAccessAccountsWithAccountIDs:(id)a3 bypassThrottler:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v7 = _Block_copy(a5);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = self;
  sub_100140CD0(v8, v5, (uint64_t)sub_10011FBC8, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)deleteApplicationDataFromCloudKitWithAccountID:(id)a3 completion:(id)a4
{
}

- (void)migrateICloudCalDavToCloudKitWithAccountID:(id)a3 disableCache:(BOOL)a4 userInitiated:(BOOL)a5 completion:(id)a6
{
}

- (void)debugDownloadMigrationCacheWithAccountID:(id)a3 completion:(id)a4
{
}

- (void)fetchUserRecordWithAccountID:(id)a3 completion:(id)a4
{
}

- (void)setMigrationStateToDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 createZoneAccountIfFinishMigration:(BOOL)a5 accountID:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  v12 = _Block_copy(a7);
  if (a6)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  v16 = self;
  sub_100146CC8(v10, v9, a5, v13, (uint64_t)a6, (uint64_t)sub_10011C2EC, v15);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)fetchServerRecordFor:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  BOOL v9 = self;
  sub_1001480CC(v8, (uint64_t)sub_100149A20, v7);

  swift_release();
}

- (void)observeCloudKitNetworkActivityChanges
{
  v2 = self;
  sub_100148934();
}

- (_TtC7remindd27RDXPCSyncInterfacePerformer)init
{
  result = (_TtC7remindd27RDXPCSyncInterfacePerformer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10012227C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity), *(void *)&self->queue[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity], *(void *)&self->storeController[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity], *(void *)&self->cloudKitThrottler[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity], *(void *)&self->discretionaryCloudKitThrottler[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity], *(unsigned int *)&self->dataAccessThrottler[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity] | ((unint64_t)*(unsigned __int16 *)&self->dataAccessThrottler[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity + 4] << 32));

  swift_unknownObjectWeakDestroy();
}

@end