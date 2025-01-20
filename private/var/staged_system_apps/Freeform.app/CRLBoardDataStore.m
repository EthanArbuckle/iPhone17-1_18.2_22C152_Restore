@interface CRLBoardDataStore
+ (id)newTransientStoreWithQueue:(id)a3 error:(id *)a4;
- (BOOL)_addUnsupportedZonesToRefetch:(id)a3 error:(id *)a4;
- (BOOL)_addZonesToRefetch:(id)a3 version:(unint64_t)a4 error:(id *)a5;
- (BOOL)ensureOwnershipOfDataAndReturnError:(id *)a3;
- (BOOL)removeAllTombstoneDataAndReturnError:(id *)a3;
- (BOOL)saveAssetEntryWithAssetUUID:(id)a3 fileExtension:(id)a4 error:(id *)a5;
- (BOOL)shouldPerformFetchWithLastSaveChangesTime:(double)a3;
- (BOOL)sync_removeAllAccountDataAndReturnError:(id *)a3;
- (BOOL)sync_resetSyncStateAndRemoveTombstonesAndReturnError:(id *)a3;
- (CRContext)crdtContext;
- (NSBundle)assetBundle;
- (NSSet)recordIDsToOverwrite;
- (NSString)storeName;
- (NSURL)storeURL;
- (OS_dispatch_queue)queue;
- (OS_os_log)logCategory;
- (_TtC8Freeform15CRLAssetManager)assetManager;
- (_TtC8Freeform17CRLBoardDataStore)init;
- (_TtC8Freeform19CRLAssetFileManager)assetFileManager;
- (double)lastFetchResultsTime;
- (id)fetchZonesNeedingRefetchFor:(unint64_t)a3 error:(id *)a4;
- (void)addUnsupportedZonesToRefetch:(NSSet *)a3 completionHandler:(id)a4;
- (void)addZonesToRefetch:(NSSet *)a3 version:(unint64_t)a4 completionHandler:(id)a5;
- (void)beginExclusiveRead;
- (void)closeDatabaseWithCompletion:(id)a3;
- (void)closeDatabaseWithCompletionHandler:(id)a3;
- (void)endExclusiveRead;
- (void)fetchZonesNeedingRefetchFor:(unint64_t)a3 completionHandler:(id)a4;
- (void)openDatabaseWithCompletion:(id)a3;
- (void)openDatabaseWithCompletionHandler:(id)a3;
- (void)removeUnsupportedZoneToRefetch:(CKRecordZoneID *)a3 completionHandler:(id)a4;
- (void)removeZoneToRefetch:(CKRecordZoneID *)a3 completionHandler:(id)a4;
- (void)scheduleCleanupForBoardsPastTTLOnCleanup:(id)a3;
- (void)setLastFetchResultsTime:(double)a3;
- (void)setRecordIDsToOverwrite:(id)a3;
- (void)updateRefetchStatusAfterSuccessfulRefetchFor:(CKRecordZoneID *)a3 completionHandler:(id)a4;
- (void)upgradeForRdar_102994991;
- (void)upgradeForRdar_119152219;
- (void)upgradeSyncMetadataToNewFormat_105187224;
@end

@implementation CRLBoardDataStore

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_queue));
}

- (NSURL)storeURL
{
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_storeURL);

  return (NSURL *)v2;
}

- (OS_os_log)logCategory
{
  return (OS_os_log *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_logCategory));
}

- (NSString)storeName
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (double)lastFetchResultsTime
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_lastFetchResultsTime);
}

- (void)setLastFetchResultsTime:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_lastFetchResultsTime) = a3;
}

- (NSSet)recordIDsToOverwrite
{
  swift_beginAccess();
  sub_10050BF48(0, &qword_10167BED0);
  sub_10062E0F4(&qword_10167BED8, &qword_10167BED0);
  swift_bridgeObjectRetain();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (void)setRecordIDsToOverwrite:(id)a3
{
  sub_10050BF48(0, &qword_10167BED0);
  sub_10062E0F4(&qword_10167BED8, &qword_10167BED0);
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_recordIDsToOverwrite);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC8Freeform15CRLAssetManager)assetManager
{
  NSSet v2 = self;
  id v3 = sub_100C32EEC();

  return (_TtC8Freeform15CRLAssetManager *)v3;
}

- (_TtC8Freeform19CRLAssetFileManager)assetFileManager
{
  NSSet v2 = self;
  id v3 = sub_100C3122C();

  return (_TtC8Freeform19CRLAssetFileManager *)v3;
}

- (CRContext)crdtContext
{
  return (CRContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_crdtContext));
}

- (NSBundle)assetBundle
{
  return (NSBundle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_assetBundle));
}

- (void)openDatabaseWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100C74AEC((uint64_t)sub_1007CFC70, v5, (uint64_t)&OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_writeQueue, (uint64_t)&unk_101529848, (uint64_t)sub_100CE8F30, (uint64_t)&unk_101529860);
  swift_release();
}

- (void)openDatabaseWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1016998C0;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1016998C8;
  v13[5] = v12;
  v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_1016998D0, (uint64_t)v13);
  swift_release();
}

- (void)closeDatabaseWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_100C74AEC((uint64_t)sub_1005E2108, v5, (uint64_t)&OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_writeQueue, (uint64_t)&unk_101529730, (uint64_t)sub_100CE8E1C, (uint64_t)&unk_101529748);
  swift_release();
}

- (void)closeDatabaseWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1016998A0;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1016998A8;
  v13[5] = v12;
  v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_1016998B0, (uint64_t)v13);
  swift_release();
}

- (_TtC8Freeform17CRLBoardDataStore)init
{
  result = (_TtC8Freeform17CRLBoardDataStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_storeURL;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_assetBundle);
}

+ (id)newTransientStoreWithQueue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = sub_100CE3FE0((uint64_t)v4);

  return v5;
}

- (void)beginExclusiveRead
{
  dispatch_suspend(*(dispatch_object_t *)((char *)&self->super.isa
                                        + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_writeQueue));
}

- (void)endExclusiveRead
{
  dispatch_resume(*(dispatch_object_t *)((char *)&self->super.isa
                                       + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_writeQueue));
}

- (BOOL)ensureOwnershipOfDataAndReturnError:(id *)a3
{
  return sub_100CB22B8(self);
}

- (void)upgradeForRdar_102994991
{
  NSSet v2 = self;
  sub_100C44B7C();
}

- (void)upgradeForRdar_119152219
{
  NSSet v2 = self;
  sub_100C44E94();
}

- (void)upgradeSyncMetadataToNewFormat_105187224
{
  NSSet v2 = self;
  sub_100C4560C();
}

- (void)scheduleCleanupForBoardsPastTTLOnCleanup:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_1007CD66C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_100C6D1BC((uint64_t)v7, v6);
  sub_1005174AC((uint64_t)v7);
}

- (BOOL)shouldPerformFetchWithLastSaveChangesTime:(double)a3
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_lastFetchResultsTime) >= a3;
}

- (id)fetchZonesNeedingRefetchFor:(unint64_t)a3 error:(id *)a4
{
  id v4 = self;
  sub_1005057FC(&qword_101672BF8);
  OS_dispatch_queue.sync<A>(execute:)();

  sub_10050BF48(0, (unint64_t *)&qword_101674210);
  sub_10062E0F4((unint64_t *)&qword_101674218, (unint64_t *)&qword_101674210);
  v5.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (void)fetchZonesNeedingRefetchFor:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_101699878;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_101699880;
  v15[5] = v14;
  v16 = self;
  sub_100E6DE90((uint64_t)v10, (uint64_t)&unk_101699888, (uint64_t)v15);
  swift_release();
}

- (void)addZonesToRefetch:(NSSet *)a3 version:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v9 - 8, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_101699850;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_101699858;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_100E6DE90((uint64_t)v12, (uint64_t)&unk_101699860, (uint64_t)v17);
  swift_release();
}

- (BOOL)_addZonesToRefetch:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  sub_10050BF48(0, (unint64_t *)&qword_101674210);
  sub_10062E0F4((unint64_t *)&qword_101674218, (unint64_t *)&qword_101674210);
  unint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_100C8A5E0(v7, a4);
  swift_bridgeObjectRelease();

  return 1;
}

- (void)removeZoneToRefetch:(CKRecordZoneID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_101699830;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_101699838;
  v15[5] = v14;
  v16 = a3;
  uint64_t v17 = self;
  sub_100E6DE90((uint64_t)v10, (uint64_t)&unk_101699840, (uint64_t)v15);
  swift_release();
}

- (void)updateRefetchStatusAfterSuccessfulRefetchFor:(CKRecordZoneID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_101699810;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_101699818;
  v15[5] = v14;
  v16 = a3;
  uint64_t v17 = self;
  sub_100E6DE90((uint64_t)v10, (uint64_t)&unk_101699820, (uint64_t)v15);
  swift_release();
}

- (void)addUnsupportedZonesToRefetch:(NSSet *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1016997F0;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1016997F8;
  v15[5] = v14;
  v16 = a3;
  uint64_t v17 = self;
  sub_100E6DE90((uint64_t)v10, (uint64_t)&unk_101699800, (uint64_t)v15);
  swift_release();
}

- (BOOL)_addUnsupportedZonesToRefetch:(id)a3 error:(id *)a4
{
  sub_10050BF48(0, (unint64_t *)&qword_101674210);
  sub_10062E0F4((unint64_t *)&qword_101674218, (unint64_t *)&qword_101674210);
  unint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = self;
  sub_100C8D630(v5);
  swift_bridgeObjectRelease();

  return 1;
}

- (void)removeUnsupportedZoneToRefetch:(CKRecordZoneID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1016997E0;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10169FAB0;
  v15[5] = v14;
  v16 = a3;
  uint64_t v17 = self;
  sub_100E6DE90((uint64_t)v10, (uint64_t)&unk_10169A060, (uint64_t)v15);
  swift_release();
}

- (BOOL)saveAssetEntryWithAssetUUID:(id)a3 fileExtension:(id)a4 error:(id *)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v12;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  __chkstk_darwin(v13, v12);
  *(void *)&v18[-32] = self;
  *(void *)&v18[-24] = v11;
  *(void *)&v18[-16] = v15;
  *(void *)&v18[-8] = v14;
  v16 = self;
  OS_dispatch_queue.sync<A>(execute:)();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v7);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)removeAllTombstoneDataAndReturnError:(id *)a3
{
  return sub_100CB22B8(self);
}

- (BOOL)sync_resetSyncStateAndRemoveTombstonesAndReturnError:(id *)a3
{
  return sub_100CB22B8(self);
}

- (BOOL)sync_removeAllAccountDataAndReturnError:(id *)a3
{
  return sub_100CB22B8(self);
}

@end