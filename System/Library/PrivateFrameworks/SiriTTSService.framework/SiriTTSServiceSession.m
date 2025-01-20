@interface SiriTTSServiceSession
- (SiriTTSServiceSession)init;
- (SiriTTSServiceSession)initWithAccessoryId:(id)a3;
- (void)cancelWithRequest:(id)a3;
- (void)dealloc;
- (void)didGenerateWordTimingsWithRequestId:(unint64_t)a3 wordTimingInfo:(id)a4;
- (void)didStartSpeakingWithRequestId:(unint64_t)a3;
- (void)getAudioPower:(id)a3;
- (void)speakWithAudioHintRequest:(id)a3 didFinish:(id)a4;
- (void)speakWithPreviewRequest:(id)a3 didFinish:(id)a4;
@end

@implementation SiriTTSServiceSession

- (SiriTTSServiceSession)init
{
  return (SiriTTSServiceSession *)ServiceSession.init()();
}

- (SiriTTSServiceSession)initWithAccessoryId:(id)a3
{
  uint64_t v3 = sub_19CED4D80();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CED4D50();
  return (SiriTTSServiceSession *)ServiceSession.init(accessoryId:)((uint64_t)v5);
}

- (void)dealloc
{
  v2 = self;
  ServiceSession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_19CDB0FC0((uint64_t)self + OBJC_IVAR___SiriTTSServiceSession_accessoryId, &qword_1EB534068);

  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSServiceSession_queue);
}

- (void)speakWithPreviewRequest:(id)a3 didFinish:(id)a4
{
}

- (void)speakWithAudioHintRequest:(id)a3 didFinish:(id)a4
{
}

- (void)cancelWithRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CE65904(v4);
}

- (void)getAudioPower:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_19CE65B4C((uint64_t)v5, (void (**)(void, float, float))v4);
  _Block_release(v4);
}

- (void)didStartSpeakingWithRequestId:(unint64_t)a3
{
  id v4 = self;
  ServiceSession.didStartSpeaking(requestId:)(a3);
}

- (void)didGenerateWordTimingsWithRequestId:(unint64_t)a3 wordTimingInfo:(id)a4
{
  type metadata accessor for WordTimingInfo();
  sub_19CED5550();
  swift_bridgeObjectRelease();
}

@end