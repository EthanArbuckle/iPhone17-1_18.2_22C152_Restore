@interface TTSVBAudioService
- (_TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TTSVBAudioService

- (_TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService)init
{
  return (_TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService *)TTSVBAudioService.init()();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_25F3F6130();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v16, 0, sizeof(v16));
    id v14 = a5;
    v15 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  uint64_t v9 = 0;
  uint64_t v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  sub_25F3F6730();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_25F3EAD60(&qword_26A78DC50, type metadata accessor for NSKeyValueChangeKey);
    sub_25F3F6040();
  }
LABEL_7:
  _s31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyj6ChangeL0aypGSgSvSgtF_0(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F307B78((uint64_t)v16, (uint64_t *)&unk_26A78D2B0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioIOQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService));

  swift_bridgeObjectRelease();
}

@end