@interface RDVASwiftVisionKWSSpotter
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDVASwiftVisionKWSSpotter)init;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDVASwiftVisionKWSSpotter)initWithDelegate:(id)a3;
- (void)addAudioSamplesWithAudio:(id)a3 count:(int64_t)a4;
- (void)startWithUsedKeywords:(id)a3 saveRuntimeAudio:(BOOL)a4;
- (void)stop;
@end

@implementation RDVASwiftVisionKWSSpotter

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDVASwiftVisionKWSSpotter)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDVASwiftVisionKWSSpotter *)sub_10005439C((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)startWithUsedKeywords:(id)a3 saveRuntimeAudio:(BOOL)a4
{
  sub_1000C35D0();
  v5 = self;
  sub_100053B50();

  swift_bridgeObjectRelease();
}

- (void)stop
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x70);
  v3 = self;
  if (v2())
  {
    sub_1000520F0(&qword_1000FE390);
    sub_1000C3690();

    swift_release();
  }
  else
  {
  }
}

- (void)addAudioSamplesWithAudio:(id)a3 count:(int64_t)a4
{
  uint64_t v5 = sub_1000C35D0();
  v6 = *(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xD8);
  v7 = self;
  id v8 = (id)v6(v5);
  mach_absolute_time();
  sub_1000C30A0();

  swift_bridgeObjectRelease();
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDVASwiftVisionKWSSpotter)init
{
  result = (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDVASwiftVisionKWSSpotter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDVASwiftVisionKWSSpotter_spotter));
  swift_release();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDVASwiftVisionKWSSpotter_logger;
  uint64_t v4 = sub_1000C31B0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end