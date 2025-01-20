@interface HoldMusicProvider
- (_TtC13callservicesd17HoldMusicProvider)init;
- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4;
@end

@implementation HoldMusicProvider

- (_TtC13callservicesd17HoldMusicProvider)init
{
  return (_TtC13callservicesd17HoldMusicProvider *)sub_1002EA530();
}

- (void).cxx_destruct
{
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd17HoldMusicProvider_speechSynthesizerEventHandler));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13callservicesd17HoldMusicProvider_audioPlayer);
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = self;
  sub_1002EB424((uint64_t)v9, v8, (uint64_t)"started speech synthesizer utterance", 36, 0);
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1002EB274();
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = self;
  sub_1002EB424((uint64_t)v9, v8, (uint64_t)"canceled speech synthesizer utterance", 37, 1);
}

@end