@interface IMDMessagesSyncCoordinatorInternal
+ (BOOL)configureWith:(id)a3 error:(id *)a4;
+ (BOOL)isSyncing;
+ (BOOL)scheduleAttachmentAssetDownloadSyncWithDelegate:(id)a3 error:(id *)a4;
+ (BOOL)scheduleBackfillSyncWithDelegate:(id)a3 error:(id *)a4;
+ (BOOL)scheduleBackupSyncWithDelegate:(id)a3 error:(id *)a4;
+ (BOOL)schedulePeriodicSyncWithDelegate:(id)a3 error:(id *)a4;
+ (BOOL)scheduleTelemetrySyncWithDelegate:(id)a3 error:(id *)a4;
+ (BOOL)startInitialSyncWithDelegate:(id)a3 error:(id *)a4;
+ (BOOL)startUserInitiatedSyncWithDelegate:(id)a3 error:(id *)a4;
+ (id)initiateSyncFor:(id)a3 delegate:(id)a4 forceRunNow:(BOOL)a5 error:(id *)a6;
+ (id)readServerCountsFromDefaults;
+ (int64_t)currentTelemetrySyncVersion;
+ (void)clearLocalCountsWhenSafe;
+ (void)clearSyncStoreWhenSafeWithCompletionHandler:(id)a3;
+ (void)fetchSyncStoreCountsWithCompletion:(id)a3;
+ (void)registerWithBackupController:(id)a3;
+ (void)registerWithErrorAnalyzer:(id)a3;
+ (void)registerWithNotifier:(id)a3;
+ (void)registerWithPreReqsVerifier:(id)a3;
+ (void)registerWithStore:(id)a3 asType:(int64_t)a4;
+ (void)registerWithSyncStateManager:(id)a3;
+ (void)registerWithSyncTokenStore:(id)a3;
- (IMDMessagesSyncCoordinatorInternal)init;
@end

@implementation IMDMessagesSyncCoordinatorInternal

+ (BOOL)isSyncing
{
  return static SyncCoordinator.isSyncing()() & 1;
}

+ (void)clearSyncStoreWhenSafeWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_22331E640(&qword_26AD5E1C8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_22342C5D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267FA3378;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267FA3380;
  v12[5] = v11;
  sub_22341E488((uint64_t)v7, (uint64_t)&unk_267FA3388, (uint64_t)v12);
  swift_release();
}

+ (void)clearLocalCountsWhenSafe
{
}

+ (BOOL)configureWith:(id)a3 error:(id *)a4
{
  return sub_2233CA798((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_2233D0748);
}

+ (void)registerWithStore:(id)a3 asType:(int64_t)a4
{
  uint64_t v6 = qword_26AD5F000;
  swift_unknownObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26AD63208, sel_registerRecordStoreWithType_store_, a4, a3);
  swift_unknownObjectRelease();
}

+ (void)registerWithErrorAnalyzer:(id)a3
{
}

+ (void)registerWithSyncTokenStore:(id)a3
{
}

+ (void)registerWithSyncStateManager:(id)a3
{
}

+ (void)registerWithBackupController:(id)a3
{
}

+ (void)registerWithPreReqsVerifier:(id)a3
{
}

+ (void)registerWithNotifier:(id)a3
{
  uint64_t v3 = qword_26AD5EE78;
  swift_unknownObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = swift_unknownObjectRetain();
  MEMORY[0x223CB4D20](v4);
  if (*(void *)((qword_26AD63178 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((qword_26AD63178 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_22342C4F0();
  sub_22342C530();
  sub_22342C4D0();
  swift_endAccess();
  swift_unknownObjectRelease();
}

+ (BOOL)startInitialSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2233CAA9C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.startInitialSync(delegate:));
}

+ (BOOL)scheduleBackfillSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2233CAA9C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.scheduleBackfillSync(delegate:));
}

+ (BOOL)schedulePeriodicSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2233CAA9C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.schedulePeriodicSync(delegate:));
}

+ (BOOL)scheduleBackupSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2233CAA9C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.scheduleBackupSync(delegate:));
}

+ (BOOL)scheduleAttachmentAssetDownloadSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2233CAA9C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.scheduleAttachmentAssetDownloadSync(delegate:));
}

+ (BOOL)scheduleTelemetrySyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2233CA798((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_2233D3DC0);
}

+ (BOOL)startUserInitiatedSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2233CAA9C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.startUserInitiatedSync(delegate:));
}

+ (id)initiateSyncFor:(id)a3 delegate:(id)a4 forceRunNow:(BOOL)a5 error:(id *)a6
{
  uint64_t v8 = sub_22342C300();
  uint64_t v10 = v9;
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  static SyncCoordinator.initiateSync(for:delegate:forceRunNow:)(v8, v10, (uint64_t)a4, a5);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_22342C260();
  swift_bridgeObjectRelease();
  return v11;
}

+ (id)readServerCountsFromDefaults
{
  if (qword_26AD5F100 != -1) {
    swift_once();
  }
  id v2 = (id)qword_26AD63240;
  sub_2233D0544(MEMORY[0x263F8EE80], (uint64_t)&unk_26D66BDD8);

  sub_22331E640(&qword_267FA3368);
  uint64_t v3 = (void *)sub_22342C260();
  swift_bridgeObjectRelease();
  return v3;
}

+ (void)fetchSyncStoreCountsWithCompletion:(id)a3
{
  uint64_t v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_getObjCClassMetadata();
  static SyncCoordinator.fetchSyncStoreCounts(_:)((uint64_t)sub_2233D4374, v4);
  swift_release();
}

+ (int64_t)currentTelemetrySyncVersion
{
  return 1;
}

- (IMDMessagesSyncCoordinatorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncCoordinator();
  return [(IMDMessagesSyncCoordinatorInternal *)&v3 init];
}

@end