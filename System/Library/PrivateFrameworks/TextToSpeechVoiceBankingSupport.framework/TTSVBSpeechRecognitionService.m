@interface TTSVBSpeechRecognitionService
- (_TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService)init;
- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4;
- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4;
@end

@implementation TTSVBSpeechRecognitionService

- (_TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService)init
{
  return (_TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService *)sub_25F386F60();
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_userFinishedSpeakingTimer);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v13[4] = sub_25F38B988;
  v13[5] = v8;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_25F302590;
  v13[3] = &block_descriptor_80;
  v9 = _Block_copy(v13);
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  swift_release();
  objc_msgSend(v7, sel_afterDelay_processBlock_, v9, 1.0);
  _Block_release(v9);
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_25F38A504(v6, v7);
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_25F38ACE0(v6, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_recognitionRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_recognitionTask));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_speechRecognitionQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_userFinishedSpeakingTimer));
  swift_bridgeObjectRelease();
  sub_25F38BA34((uint64_t)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService__cachedRecognizer);
}

@end