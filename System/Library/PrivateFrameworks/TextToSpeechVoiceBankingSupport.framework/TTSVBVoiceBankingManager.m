@interface TTSVBVoiceBankingManager
- (_TtC31TextToSpeechVoiceBankingSupport24TTSVBVoiceBankingManager)init;
@end

@implementation TTSVBVoiceBankingManager

- (_TtC31TextToSpeechVoiceBankingSupport24TTSVBVoiceBankingManager)init
{
  return (_TtC31TextToSpeechVoiceBankingSupport24TTSVBVoiceBankingManager *)TTSVBVoiceBankingManager.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport24TTSVBVoiceBankingManager_calloutQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport24TTSVBVoiceBankingManager_operationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport24TTSVBVoiceBankingManager_dataStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport24TTSVBVoiceBankingManager____lazy_storage___trainerSession));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport24TTSVBVoiceBankingManager____lazy_storage___audioService);
}

@end