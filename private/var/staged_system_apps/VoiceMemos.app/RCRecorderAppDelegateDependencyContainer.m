@interface RCRecorderAppDelegateDependencyContainer
- (RCRecorderAppDelegateDependencyContainer)init;
- (void)applicationWillTerminateWithApplication:(id)a3;
- (void)defaultSceneDidBecomeActive;
@end

@implementation RCRecorderAppDelegateDependencyContainer

- (RCRecorderAppDelegateDependencyContainer)init
{
  return (RCRecorderAppDelegateDependencyContainer *)sub_10002EA28();
}

- (void)defaultSceneDidBecomeActive
{
  v2 = self;
  sub_100034CB8();
}

- (void)applicationWillTerminateWithApplication:(id)a3
{
  if (*(void *)((*(void **)((char *)&self->super.isa
                               + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_activityManagerStateCoordinator))[2]
                 + 16))
  {
    id v4 = a3;
    v5 = self;
    swift_retain();
    uint64_t v6 = Activity.id.getter();
    sub_10011D994(v6, v7);

    swift_release();
    swift_bridgeObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_10002F48C((uint64_t)self + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_recordingStatePublisher);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_locationManagerStateCoordinator));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end