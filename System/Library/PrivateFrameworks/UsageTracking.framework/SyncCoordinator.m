@interface SyncCoordinator
+ (BOOL)deleteLocalDataAndReturnError:(id *)a3;
+ (NSString)privateEngineDidIdleNotificationName;
+ (void)deleteExpiredDataWithZoneNames:(id)a3;
+ (void)downloadWithCompletionHandler:(id)a3;
+ (void)resetSharingPermissions;
+ (void)startSyncing;
+ (void)uploadLocalDataWithCompletionHandler:(id)a3;
- (_TtC18UsageTrackingAgent15SyncCoordinator)init;
@end

@implementation SyncCoordinator

+ (NSString)privateEngineDidIdleNotificationName
{
  if (qword_1000950F0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1000974E0;
  return (NSString *)v2;
}

+ (void)startSyncing
{
  if (qword_1000950E8 != -1) {
    swift_once();
  }
}

+ (void)resetSharingPermissions
{
  if (qword_1000950E8 != -1) {
    swift_once();
  }
  sub_100038C2C(0, 0);
}

+ (void)uploadLocalDataWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  type metadata accessor for DeviceActivityAuthorization();
  _Block_copy(v3);
  _Block_copy(v3);
  if (static DeviceActivityAuthorization.sharingEnabled.getter())
  {
    if (qword_1000950E8 != -1) {
      swift_once();
    }
    v4 = (NSString *)qword_1000974D8;
    _Block_copy(v3);
    sub_1000550B4(v4, (uint64_t)v3);
    _Block_release(v3);
  }
  else
  {
    (*((void (**)(void *, void))v3 + 2))(v3, 0);
  }
  _Block_release(v3);
  _Block_release(v3);
  _Block_release(v3);
}

+ (BOOL)deleteLocalDataAndReturnError:(id *)a3
{
  if (qword_1000950E8 != -1) {
    swift_once();
  }
  uint64_t v3 = static _SegmentInterval.allCases.getter();
  uint64_t v4 = DeviceActivityDataStore.localZones.getter();
  CKSyncEngine.state.getter();
  swift_bridgeObjectRetain();
  v5 = sub_100047068(v4, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  CKSyncEngine.State.add(pendingDatabaseChanges:)((Swift::OpaquePointer)v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return 1;
}

+ (void)deleteExpiredDataWithZoneNames:(id)a3
{
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (qword_1000950E8 != -1) {
    swift_once();
  }
  sub_10003A2DC(v3);
  swift_bridgeObjectRelease();
}

+ (void)downloadWithCompletionHandler:(id)a3
{
  uint64_t v4 = sub_1000222D4(&qword_100095730);
  __chkstk_darwin(v4 - 8, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  if (qword_1000950E8 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_1000974D8;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v10;
  v12[5] = sub_100053178;
  v12[6] = v9;
  swift_retain();
  swift_retain();
  sub_1000384FC((uint64_t)v7, (uint64_t)&unk_100095DC8, (uint64_t)v12);
  swift_release();
  swift_release();
}

- (_TtC18UsageTrackingAgent15SyncCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SyncCoordinator *)&v3 init];
}

@end