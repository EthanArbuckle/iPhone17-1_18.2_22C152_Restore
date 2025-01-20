@interface DriverKitDaemonXPCRequestDelegate
- (void)dumpStateWithReplyBlock:(id)a3;
- (void)enqueueApprovalStateUpdateWithEntry:(id)a3 replyBlock:(id)a4;
- (void)getApprovalStateForSettingsWithReplyBlock:(id)a3;
- (void)launchDriverWithBundleID:(id)a3 userServerName:(id)a4 tag:(id)a5 replyBlock:(id)a6;
@end

@implementation DriverKitDaemonXPCRequestDelegate

- (void)dumpStateWithReplyBlock:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_100092334((uint64_t)sub_100096CF8, v4);
  swift_release();

  swift_release();
}

- (void)getApprovalStateForSettingsWithReplyBlock:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  sub_100095350(v4, (uint64_t)v3);
  _Block_release(v3);
  _Block_release(v3);

  swift_release();
}

- (void)enqueueApprovalStateUpdateWithEntry:(id)a3 replyBlock:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  swift_retain();
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_100095868(v8, v10, (uint64_t)self, v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_100012A10(v8, v10);

  swift_release();
}

- (void)launchDriverWithBundleID:(id)a3 userServerName:(id)a4 tag:(id)a5 replyBlock:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (a5)
  {
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  _Block_copy(v8);
  swift_retain();
  sub_100095BF4(v9, v11, v12, v14, v15, (unint64_t)a5, (uint64_t)self, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end