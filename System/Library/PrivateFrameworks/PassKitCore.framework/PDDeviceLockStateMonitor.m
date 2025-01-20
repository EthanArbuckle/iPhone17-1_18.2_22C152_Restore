@interface PDDeviceLockStateMonitor
- (PDDeviceLockStateMonitor)init;
- (id)createCurrentNotificationRegistrationState;
- (void)dealloc;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
@end

@implementation PDDeviceLockStateMonitor

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDDeviceLockStateMonitor_notificationStreamManager);
  v3 = self;
  [v2 unregisterConsumer:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DeviceLockStateMonitor();
  [(PDDeviceLockStateMonitor *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

- (PDDeviceLockStateMonitor)init
{
  result = (PDDeviceLockStateMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)createCurrentNotificationRegistrationState
{
  id v2 = sub_100513E3C();
  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v6 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___PDDeviceLockStateMonitor_lock) + 16);
  swift_unknownObjectRetain();
  v7 = self;
  os_unfair_lock_lock(v6);
  char v8 = PDGetDeviceLockState();
  *((unsigned char *)&v7->super.isa + OBJC_IVAR___PDDeviceLockStateMonitor_currentLockState) = sub_1005113EC(v8) ^ 1;
  os_unfair_lock_unlock(v6);
  sub_100510CCC(0, 0, 0);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end