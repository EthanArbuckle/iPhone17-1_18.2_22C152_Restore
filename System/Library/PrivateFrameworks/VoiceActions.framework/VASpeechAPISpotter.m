@interface VASpeechAPISpotter
@end

@implementation VASpeechAPISpotter

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_2613CC6A0((uint64_t)self + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_inputStream, &qword_26A915068);
  sub_2613CC6A0((uint64_t)self + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_inputStreamBuilder, &qword_26A915070);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_analysisContext));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_timingInfo));
  swift_unknownObjectRelease();
  sub_2613CC6A0((uint64_t)self + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_speechDetectorOutputStream, &qword_26A914C48);
  sub_26140FB6C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_runtimeParameters));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_audioDuringSpeech));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_downloadError));
  swift_release();
}

@end