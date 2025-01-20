@interface EndOfTrackNotificationScheduler
- (_TtC7NewsUI231EndOfTrackNotificationScheduler)init;
- (void)userInfoDidChangeEndOfAudioTrackNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4;
@end

@implementation EndOfTrackNotificationScheduler

- (_TtC7NewsUI231EndOfTrackNotificationScheduler)init
{
  result = (_TtC7NewsUI231EndOfTrackNotificationScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_readingHistory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_currentlyPlayingObservableToken));
  sub_1DFA69A48(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState), *(void *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState], *(void *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState + 8], *(void *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState + 16], *(void *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState + 24], *(void *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState + 32], *(void *)&self->currentlyPlaying[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState], *(void *)&self->readingHistory[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState], self->currentlyPlayingObservableToken[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState]);
}

- (void)userInfoDidChangeEndOfAudioTrackNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1DFA69E18(v5);
}

@end