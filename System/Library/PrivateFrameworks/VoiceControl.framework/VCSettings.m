@interface VCSettings
- (_TtC12VoiceControl10VCSettings)init;
@end

@implementation VCSettings

- (_TtC12VoiceControl10VCSettings)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VCSettings();
  v2 = [(VCSettings *)&v4 init];
  sub_261513604(0);

  return v2;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon);
}

@end