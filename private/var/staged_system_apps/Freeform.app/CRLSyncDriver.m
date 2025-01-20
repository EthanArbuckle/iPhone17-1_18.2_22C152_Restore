@interface CRLSyncDriver
- (void)handleDataStoreDidSaveSyncableData:(id)a3;
@end

@implementation CRLSyncDriver

- (void)handleDataStoreDidSaveSyncableData:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_100CED7FC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end