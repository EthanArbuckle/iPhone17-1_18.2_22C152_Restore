@interface MetricPlaybackTracker
- (void)handleAppBackground;
- (void)handlePlaybackInterrupted;
@end

@implementation MetricPlaybackTracker

- (void)handleAppBackground
{
  swift_retain();
  if (sub_226298550() != 2) {
    *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12SeymourMedia21MetricPlaybackTracker_expectedWorkoutPlaybackPause) = 2;
  }

  swift_release();
}

- (void)handlePlaybackInterrupted
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12SeymourMedia21MetricPlaybackTracker_expectedWorkoutPlaybackPause) = 4;
}

@end