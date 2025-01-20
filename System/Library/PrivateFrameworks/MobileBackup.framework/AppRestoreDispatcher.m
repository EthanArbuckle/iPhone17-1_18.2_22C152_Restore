@interface AppRestoreDispatcher
+ (_TtC7backupd20AppRestoreDispatcher)shared;
- (_TtC7backupd20AppRestoreDispatcher)init;
- (id)appRestorerForAccount:(id)a3 stateQueue:(id)a4 delegate:(id)a5 error:(id *)a6;
- (void)cancelAndUninstallAllRestorers;
- (void)cancelAndUninstallRestorerForAccount:(id)a3;
- (void)cancelAndUninstallRestorerForPersonaIdentifier:(id)a3;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorShouldBeginRestoringUserData:(id)a3;
- (void)retryAppDataDownloadsForAccount:(id)a3;
@end

@implementation AppRestoreDispatcher

+ (_TtC7backupd20AppRestoreDispatcher)shared
{
  if (qword_10047CB20 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10047F3E8;
  return (_TtC7backupd20AppRestoreDispatcher *)v2;
}

- (_TtC7backupd20AppRestoreDispatcher)init
{
  return (_TtC7backupd20AppRestoreDispatcher *)sub_100041144();
}

- (id)appRestorerForAccount:(id)a3 stateQueue:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = a4;
  swift_unknownObjectRetain();
  v11 = self;
  v12 = (void *)sub_100041560(v9, v10, (uint64_t)a5);

  swift_unknownObjectRelease();
  return v12;
}

- (void).cxx_destruct
{
  sub_1000445B8(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC7backupd20AppRestoreDispatcher____lazy_storage___observer));
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)coordinatorShouldBeginRestoringUserData:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100041E84(v4);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v10 = a4;
  id v9 = self;
  sub_10004236C(v8, (uint64_t)v10, a5);
}

- (void)retryAppDataDownloadsForAccount:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100042888(v4);
}

- (void)cancelAndUninstallAllRestorers
{
  v2 = self;
  sub_100042D70();
}

- (void)cancelAndUninstallRestorerForAccount:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100042FA8(v4);
}

- (void)cancelAndUninstallRestorerForPersonaIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  v7 = self;
  sub_10004307C(v4, v6);

  swift_bridgeObjectRelease();
}

@end