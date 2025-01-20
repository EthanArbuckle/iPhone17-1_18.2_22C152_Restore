@interface SSMLVoiceTagger
- (_TtC12TextToSpeech15SSMLVoiceTagger)init;
- (id)tagSSML:(id)a3;
@end

@implementation SSMLVoiceTagger

- (_TtC12TextToSpeech15SSMLVoiceTagger)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15SSMLVoiceTagger_currentVoiceName);
  void *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15SSMLVoiceTagger_currentLanguage);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15SSMLVoiceTagger_leafPiles) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15SSMLVoiceTagger_voiceTagRanges) = v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SSMLVoiceTagger();
  return [(SSMLVoiceTagger *)&v6 init];
}

- (id)tagSSML:(id)a3
{
  v4 = (void *)sub_1A6892000();
  unint64_t v6 = v5;
  v7 = self;
  v8 = sub_1A676EB84(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end