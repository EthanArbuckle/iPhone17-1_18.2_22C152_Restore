@interface VoiceTaggedSSMLSnippet
- (NSString)language;
- (NSString)ssml;
- (NSString)voiceName;
- (_TtC12TextToSpeech22VoiceTaggedSSMLSnippet)init;
- (void)setLanguage:(id)a3;
- (void)setSsml:(id)a3;
- (void)setVoiceName:(id)a3;
@end

@implementation VoiceTaggedSSMLSnippet

- (NSString)ssml
{
  return (NSString *)sub_1A676E410();
}

- (void)setSsml:(id)a3
{
}

- (NSString)voiceName
{
  return (NSString *)sub_1A676DD00((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12TextToSpeech22VoiceTaggedSSMLSnippet_voiceName);
}

- (void)setVoiceName:(id)a3
{
}

- (NSString)language
{
  return (NSString *)sub_1A676DD00((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12TextToSpeech22VoiceTaggedSSMLSnippet_language);
}

- (void)setLanguage:(id)a3
{
}

- (_TtC12TextToSpeech22VoiceTaggedSSMLSnippet)init
{
  result = (_TtC12TextToSpeech22VoiceTaggedSSMLSnippet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end