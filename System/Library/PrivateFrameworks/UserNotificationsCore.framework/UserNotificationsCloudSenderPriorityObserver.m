@interface UserNotificationsCloudSenderPriorityObserver
- (_TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver)init;
- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4;
- (void)systemSleepMonitorDidWakeFromSleep:(id)a3;
@end

@implementation UserNotificationsCloudSenderPriorityObserver

- (_TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver)init
{
  result = (_TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_26096BCD8((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver_monitor);
  v3 = (char *)self + OBJC_IVAR____TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver_consumer;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  v6 = (void (**)(void))_Block_copy(a4);
  id v7 = a3;
  v8 = self;
  sub_26096B190("systemSleepMonitorPrepareForSleep(): %s waking = false", 0);
  v6[2](v6);
  _Block_release(v6);
}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_26096B190("systemSleepMonitorDidWakeFromSleep(): %s waking = true", 1);
}

@end