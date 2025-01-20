@interface VoiceBankingAudioServiceViewModel
- (_TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel)init;
- (void)applicationDidResign;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4;
@end

@implementation VoiceBankingAudioServiceViewModel

- (_TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel)init
{
  return (_TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel *)sub_25F50523C();
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A1E30);
  MEMORY[0x270FA5388](v7 - 8, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25F53DAE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_25F53DAB8();
  v12 = self;
  id v13 = a3;
  uint64_t v14 = sub_25F53DAA8();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v16;
  *(unsigned char *)(v15 + 32) = a4;
  *(void *)(v15 + 40) = v12;
  sub_25F43AEA4((uint64_t)v10, (uint64_t)&unk_26A7A4A98, v15);

  swift_release();
}

- (void)applicationDidResign
{
  v2 = self;
  sub_25F513200();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_voiceBankingSession));
  v3 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__recordingResult;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7A47C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_audioService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_player));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_speechRecognitionDelayTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel____lazy_storage___manualModeTimeoutQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_manualModeTimeoutTimer));
  v5 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__synthesizer;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7A47E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__isRecording;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7A47F0);
  uint64_t v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v10 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__recordingState;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A4808);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__inputSource;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7A4820);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v9((char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__isInputAvailable, v8);
  v9((char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__playingRecording, v8);
  v9((char *)self+ OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__isRecordingRequestInFlight, v8);
  uint64_t v14 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__operationError;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7A4838);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__audioButtonState;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7A4848);
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__recordingMode;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A7A4868);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);

  swift_bridgeObjectRelease();
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_25F5150AC();
}

@end