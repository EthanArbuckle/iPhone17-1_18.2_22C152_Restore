@interface SubscriptionDaemon
- (void)onExitTimerRun;
@end

@implementation SubscriptionDaemon

- (void)onExitTimerRun
{
  v2 = *(void (**)(uint64_t))(**(void **)self->mainLoop + 128);
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
}

@end