@interface VoiceBankingDaemon
- (_TtC13voicebankingd18VoiceBankingDaemon)init;
@end

@implementation VoiceBankingDaemon

- (_TtC13voicebankingd18VoiceBankingDaemon)init
{
  return (_TtC13voicebankingd18VoiceBankingDaemon *)VoiceBankingDaemon.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___xpcServer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___liveSpeechSyncController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager));
  swift_release();
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___accessManager));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___assetsService);
}

@end