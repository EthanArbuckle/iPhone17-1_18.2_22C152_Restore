@interface VoiceBankingSession
- (_TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession)init;
@end

@implementation VoiceBankingSession

- (_TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession)init
{
  return (_TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession *)VoiceBankingSession.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__script;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A3ED8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__configurationStage;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A3EE8);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self
     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__speechRecognitionDownloadProgress;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A3EF0);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  sub_25F4378BC((uint64_t)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession_voiceID, &qword_26A7A4940);
  v9 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession_voiceCreationLocale;
  uint64_t v10 = sub_25F53B888();
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__trainingScriptType;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A3EF8);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v13 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__sample;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A3F08);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession_voiceBankingManager);
}

@end