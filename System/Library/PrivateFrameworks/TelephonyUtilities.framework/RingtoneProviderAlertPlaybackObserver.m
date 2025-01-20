@interface RingtoneProviderAlertPlaybackObserver
- (_TtC13callservicesd37RingtoneProviderAlertPlaybackObserver)init;
- (void)alertDidBeginPlaying:(id)a3;
@end

@implementation RingtoneProviderAlertPlaybackObserver

- (_TtC13callservicesd37RingtoneProviderAlertPlaybackObserver)init
{
  return (_TtC13callservicesd37RingtoneProviderAlertPlaybackObserver *)sub_100298FA0();
}

- (void).cxx_destruct
{
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd37RingtoneProviderAlertPlaybackObserver_didBeginPlaying));
}

- (void)alertDidBeginPlaying:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100299020();
}

@end