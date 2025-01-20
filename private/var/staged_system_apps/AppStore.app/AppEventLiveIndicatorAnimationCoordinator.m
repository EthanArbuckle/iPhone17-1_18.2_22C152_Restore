@interface AppEventLiveIndicatorAnimationCoordinator
- (_TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator)init;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
@end

@implementation AppEventLiveIndicatorAnimationCoordinator

- (_TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator)init
{
  return (_TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator *)sub_100019368();
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_100097BC4();
}

- (void)appExitedWhileAppeared
{
  v2 = self;
  sub_10000A88C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator_sleepTimer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator_currentAnimator);
}

@end