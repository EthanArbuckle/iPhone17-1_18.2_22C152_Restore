@interface TTSVBAccessManager
- (_TtC31TextToSpeechVoiceBankingSupport18TTSVBAccessManager)init;
- (void)accountCredentialChanged:(id)a3;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)dealloc;
@end

@implementation TTSVBAccessManager

- (_TtC31TextToSpeechVoiceBankingSupport18TTSVBAccessManager)init
{
  return (_TtC31TextToSpeechVoiceBankingSupport18TTSVBAccessManager *)TTSVBAccessManager.init()();
}

- (void)dealloc
{
  v3 = (int *)((char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport18TTSVBAccessManager_tccNotifyToken);
  swift_beginAccess();
  int v4 = *v3;
  v5 = self;
  if (v4)
  {
    notify_cancel(v4);
    int *v3 = 0;
  }
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for TTSVBAccessManager();
  [(TTSVBAccessManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_25F34788C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport18TTSVBAccessManager_eventHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport18TTSVBAccessManager_calloutQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport18TTSVBAccessManager_operationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport18TTSVBAccessManager____lazy_storage___accountStore));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport18TTSVBAccessManager_currentChallengeContext);
}

- (void)accountWasAdded:(id)a3
{
  id v4 = a3;
  v5 = self;
  TTSVBAccessManager.accountWasAdded(_:)((ACAccount)v4);
}

- (void)accountWasModified:(id)a3
{
  id v4 = a3;
  v5 = self;
  TTSVBAccessManager.accountWasModified(_:)((ACAccount)v4);
}

- (void)accountWasRemoved:(id)a3
{
  id v4 = a3;
  v5 = self;
  TTSVBAccessManager.accountWasRemoved(_:)((ACAccount)v4);
}

- (void)accountCredentialChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  TTSVBAccessManager.accountCredentialChanged(_:)((ACAccount)v4);
}

@end