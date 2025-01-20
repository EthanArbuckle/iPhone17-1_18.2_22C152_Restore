@interface CoreSynthesisVoicePickable
- (_TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable)init;
@end

@implementation CoreSynthesisVoicePickable

- (_TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable)init
{
  result = (_TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable__voice;
  uint64_t v4 = sub_25F53B178();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI26CoreSynthesisVoicePickable___observationRegistrar;
  uint64_t v6 = sub_25F53AE98();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end