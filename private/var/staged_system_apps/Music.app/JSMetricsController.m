@interface JSMetricsController
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
@end

@implementation JSMetricsController

- (void)sessionDidConnect:(id)a3
{
  if ((*((unsigned char *)&self->super.super.isa
        + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_carPlayMetricsRecordingState) & 1) == 0)
    *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_carPlayMetricsRecordingState) = 1;
}

- (void)sessionDidDisconnect:(id)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_carPlayMetricsRecordingState) = 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_carSessionStatus));
  swift_release();

  swift_release();
}

@end