@interface SessionIntroSequencePresenter
- (_TtC9SeymourUI29SessionIntroSequencePresenter)init;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
@end

@implementation SessionIntroSequencePresenter

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioSessionCategory))
  {
    if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioSessionMode))
    {
      v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioPlayer);
      *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioPlayer) = 0;
    }
  }
}

- (_TtC9SeymourUI29SessionIntroSequencePresenter)init
{
  result = (_TtC9SeymourUI29SessionIntroSequencePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_display);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_sessionCountdownCoordinator);

  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_onStartCountdown));
  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_onCountdownSequenceStarted));
  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_onCountdownSequenceCompleted));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_timerProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_sessionRouteMonitor);
  swift_release();
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_timer, (uint64_t *)&unk_268A121F0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioSessionCategory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_audioSessionMode));
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_workoutDeviceConnection, (uint64_t *)&unk_268A12200);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI29SessionIntroSequencePresenter_catalogWorkout;
  uint64_t v4 = sub_23A7F7D18();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end