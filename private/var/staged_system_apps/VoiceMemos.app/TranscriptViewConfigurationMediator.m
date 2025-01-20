@interface TranscriptViewConfigurationMediator
- (_TtC10VoiceMemos35TranscriptViewConfigurationMediator)init;
- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4;
- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5;
@end

@implementation TranscriptViewConfigurationMediator

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1000F8564();
  swift_unknownObjectRelease();
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_1000F8564();
  swift_unknownObjectRelease();
}

- (_TtC10VoiceMemos35TranscriptViewConfigurationMediator)init
{
  result = (_TtC10VoiceMemos35TranscriptViewConfigurationMediator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002F48C((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos35TranscriptViewConfigurationMediator_configurationManager);
  sub_10002F48C((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos35TranscriptViewConfigurationMediator_contextProvider);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos35TranscriptViewConfigurationMediator_autoScrollTimer));

  swift_unknownObjectRelease();
}

@end