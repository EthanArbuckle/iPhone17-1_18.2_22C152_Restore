@interface MTBackgroundTaskManager
- (MTBackgroundTaskManager)init;
- (void)beginBackgroundTask:(id)a3;
- (void)endBackgroundTask;
@end

@implementation MTBackgroundTaskManager

- (MTBackgroundTaskManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTBackgroundTaskManager_task) = (Class)UIBackgroundTaskInvalid;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BackgroundTaskManager();
  return [(MTBackgroundTaskManager *)&v3 init];
}

- (void)endBackgroundTask
{
  v2 = self;
  sub_10002A850();
}

- (void)beginBackgroundTask:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  v7 = self;
  sub_100032540(v4, v6);

  swift_bridgeObjectRelease();
}

@end