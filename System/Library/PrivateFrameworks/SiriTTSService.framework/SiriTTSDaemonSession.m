@interface SiriTTSDaemonSession
- (BOOL)keepActive;
- (SiriTTSDaemonSession)initWithAccessoryId:(id)a3;
- (void)adjustVolume:(float)a3 rampTime:(double)a4 didFinish:(id)a5;
- (void)clearDeviceCache;
- (void)didGenerateAudioWithRequestId:(unint64_t)a3 audio:(id)a4;
- (void)didGenerateWordTimingsWithRequestId:(unint64_t)a3 wordTimingInfo:(id)a4;
- (void)didReportInstrumentWithRequestId:(unint64_t)a3 instrumentationMetrics:(id)a4;
- (void)didStartSpeakingWithRequestId:(unint64_t)a3;
- (void)estimateDurationWithRequest:(id)a3 didFinish:(id)a4;
- (void)getAudioPower:(id)a3;
- (void)getSynthesisVoiceMatching:(id)a3 reply:(id)a4;
- (void)isANEModelCompiledMatching:(id)a3 reply:(id)a4;
- (void)isSpeaking:(id)a3;
- (void)killDaemon;
- (void)pingWithReply:(id)a3;
- (void)prewarmWithRequest:(id)a3 didFinish:(id)a4;
- (void)queryPhaticCapabilityWithVoice:(id)a3 reply:(id)a4;
- (void)speakWithAudioRequest:(id)a3 didFinish:(id)a4;
- (void)speakWithPreviewRequest:(id)a3 didFinish:(id)a4;
- (void)speakWithSpeechRequest:(id)a3 didFinish:(id)a4;
- (void)subscribeWithVoices:(id)a3 reply:(id)a4;
- (void)subscribedVoicesWithClientId:(id)a3 reply:(id)a4;
- (void)subscribedVoicesWithReply:(id)a3;
- (void)synthesizeWithRequest:(id)a3 didFinish:(id)a4;
- (void)textToPhonemeWithRequest:(id)a3 didFinish:(id)a4;
@end

@implementation SiriTTSDaemonSession

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_19CDAE90C((uint64_t)self + OBJC_IVAR___SiriTTSDaemonSession_accessoryId, &qword_1EB534068);
  swift_bridgeObjectRelease();
}

- (BOOL)keepActive
{
  return sub_19CE8DE64() & 1;
}

- (SiriTTSDaemonSession)initWithAccessoryId:(id)a3
{
  uint64_t v3 = sub_19CED4D80();
  MEMORY[0x1F4188790](v3 - 8);
  sub_19CED4D50();
  DaemonSession.init(accessoryId:)();
  return result;
}

- (void)prewarmWithRequest:(id)a3 didFinish:(id)a4
{
}

- (void)synthesizeWithRequest:(id)a3 didFinish:(id)a4
{
}

- (void)speakWithSpeechRequest:(id)a3 didFinish:(id)a4
{
}

- (void)speakWithAudioRequest:(id)a3 didFinish:(id)a4
{
}

- (void)speakWithPreviewRequest:(id)a3 didFinish:(id)a4
{
}

- (void)isSpeaking:(id)a3
{
}

- (void)getAudioPower:(id)a3
{
}

- (void)adjustVolume:(float)a3 rampTime:(double)a4 didFinish:(id)a5
{
  v6 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v6;
  v7 = self;
  sub_19CE95810();

  swift_release();
}

- (void)estimateDurationWithRequest:(id)a3 didFinish:(id)a4
{
}

- (void)textToPhonemeWithRequest:(id)a3 didFinish:(id)a4
{
}

- (void)subscribeWithVoices:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  type metadata accessor for SynthesisVoice();
  uint64_t v6 = sub_19CED5550();
  _Block_copy(v5);
  v7 = self;
  sub_19CE96E30(v6, (uint64_t)v7, (void (**)(void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)subscribedVoicesWithReply:(id)a3
{
}

- (void)subscribedVoicesWithClientId:(id)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = sub_19CED5260();
    a3 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_copy(v6);
  v9 = self;
  sub_19CE97DC4(v7, a3, v9, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)getSynthesisVoiceMatching:(id)a3 reply:(id)a4
{
}

- (void)queryPhaticCapabilityWithVoice:(id)a3 reply:(id)a4
{
}

- (void)killDaemon
{
  v2 = self;
  sub_19CE98C1C();
}

- (void)isANEModelCompiledMatching:(id)a3 reply:(id)a4
{
}

- (void)clearDeviceCache
{
  v2 = self;
  sub_19CE98FF0();
}

- (void)didStartSpeakingWithRequestId:(unint64_t)a3
{
  v4 = self;
  DaemonSession.didStartSpeaking(requestId:)(a3);
}

- (void)didReportInstrumentWithRequestId:(unint64_t)a3 instrumentationMetrics:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  DaemonSession.didReportInstrument(requestId:instrumentationMetrics:)(a3, (uint64_t)v6);
}

- (void)didGenerateAudioWithRequestId:(unint64_t)a3 audio:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  DaemonSession.didGenerateAudio(requestId:audio:)(a3, (uint64_t)v6);
}

- (void)didGenerateWordTimingsWithRequestId:(unint64_t)a3 wordTimingInfo:(id)a4
{
  type metadata accessor for WordTimingInfo();
  uint64_t v6 = sub_19CED5550();
  uint64_t v7 = self;
  DaemonSession.didGenerateWordTimings(requestId:wordTimingInfo:)(a3, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)pingWithReply:(id)a3
{
}

@end