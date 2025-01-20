@interface LifecycleManager
- (void)applicationDidEnterBackgroundWithNotification:(id)a3;
@end

@implementation LifecycleManager

- (void)applicationDidEnterBackgroundWithNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = qword_1001040A8;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  sub_10009D758();
  if ([self isRunningStoreDemoMode]) {
    sub_1000960A0();
  }
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end