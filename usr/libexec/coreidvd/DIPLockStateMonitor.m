@interface DIPLockStateMonitor
- (BOOL)registerForDeviceLockNotificationsWithWatchPairingID:(id)a3 error:(id *)a4;
- (_TtC8coreidvd19DIPLockStateMonitor)init;
- (void)dealloc;
- (void)unregisterFromDeviceLockNotificationsWithWatchPairingID:(id)a3;
@end

@implementation DIPLockStateMonitor

- (_TtC8coreidvd19DIPLockStateMonitor)init
{
  return (_TtC8coreidvd19DIPLockStateMonitor *)sub_1005F6A90();
}

- (BOOL)registerForDeviceLockNotificationsWithWatchPairingID:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  v8 = self;
  sub_1005F6D60(v5, v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (void)unregisterFromDeviceLockNotificationsWithWatchPairingID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  sub_1005F7878(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_1005F7CE4();
}

- (void).cxx_destruct
{
  sub_100025D08((uint64_t)self + OBJC_IVAR____TtC8coreidvd19DIPLockStateMonitor_delegate);

  swift_bridgeObjectRelease();
}

@end