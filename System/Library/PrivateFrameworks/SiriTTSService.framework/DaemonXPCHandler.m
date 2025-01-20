@interface DaemonXPCHandler
- (_TtC13SiriTTSDaemon16DaemonXPCHandler)init;
- (void)adjustVolumeWithAccessoryId:(id)a3 volume:(float)a4 rampTime:(double)a5 didFinish:(id)a6;
- (void)cancelWithRequest:(id)a3;
- (void)clearDeviceCacheWithDidFinish:(id)a3;
- (void)downloadedVoicesMatching:(id)a3 reply:(id)a4;
- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4;
- (void)forwardWithStreamObject:(id)a3;
- (void)getAudioPowerWithAccessoryId:(id)a3 reply:(id)a4;
- (void)getSynthesisVoiceMatching:(id)a3 reply:(id)a4;
- (void)isANEModelCompiledMatching:(id)a3 reply:(id)a4;
- (void)isSpeakingWithAccessoryId:(id)a3 reply:(id)a4;
- (void)keepActive:(BOOL)a3 reply:(id)a4;
- (void)killDaemon;
- (void)prewarmWithRequest:(id)a3 reply:(id)a4;
- (void)queryPhaticCapabilityWithVoice:(id)a3 reply:(id)a4;
- (void)signalWithInlineStreaming:(id)a3;
- (void)speakWithAudioRequest:(id)a3 reply:(id)a4;
- (void)speakWithPreviewRequest:(id)a3 reply:(id)a4;
- (void)speakWithSpeechRequest:(id)a3 reply:(id)a4;
- (void)subscribeWithVoices:(id)a3 clientId:(id)a4 accessoryId:(id)a5 reply:(id)a6;
- (void)subscribedVoicesWithClientId:(id)a3 reply:(id)a4;
- (void)synthesizeWithRequest:(id)a3 reply:(id)a4;
- (void)textToPhonemeWithRequest:(id)a3 reply:(id)a4;
@end

@implementation DaemonXPCHandler

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13SiriTTSDaemon16DaemonXPCHandler_entitlements;
  uint64_t v4 = type metadata accessor for Entitlements();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)downloadedVoicesMatching:(id)a3 reply:(id)a4
{
  v6 = (void (**)(void *, Class))_Block_copy(a4);
  id v7 = a3;
  v10 = self;
  dispatch thunk of TrialAssetProvider.listVoices(_:)();
  type metadata accessor for PreinstalledVoiceProvider();
  swift_allocObject();
  PreinstalledVoiceProvider.init()();
  unint64_t v8 = dispatch thunk of PreinstalledVoiceProvider.listVoices(_:)();
  swift_release();
  sub_100004C08(v8);
  type metadata accessor for SynthesisVoice();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v6[2](v6, isa);
  swift_bridgeObjectRelease();

  _Block_release(v6);
}

- (void)keepActive:(BOOL)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = self;
  sub_10001F4D0(a3, (char *)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)prewarmWithRequest:(id)a3 reply:(id)a4
{
}

- (void)speakWithPreviewRequest:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100019F1C(v8, (uint64_t)sub_100029968, v7);

  swift_release();
}

- (void)speakWithAudioRequest:(id)a3 reply:(id)a4
{
}

- (void)speakWithSpeechRequest:(id)a3 reply:(id)a4
{
}

- (void)cancelWithRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100023620(v4);
}

- (void)synthesizeWithRequest:(id)a3 reply:(id)a4
{
}

- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4
{
}

- (void)textToPhonemeWithRequest:(id)a3 reply:(id)a4
{
}

- (void)signalWithInlineStreaming:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100026964(v4, "Received inline streaming signal %@", (void (*)(void))&dispatch thunk of InlineStreamingStorage.add(signal:));
}

- (void)forwardWithStreamObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100026964(v4, "Received inline stream object %@", (void (*)(void))&dispatch thunk of InlineStreamingStorage.enqueue(streamObject:));
}

- (void)subscribeWithVoices:(id)a3 clientId:(id)a4 accessoryId:(id)a5 reply:(id)a6
{
  id v8 = _Block_copy(a6);
  type metadata accessor for SynthesisVoice();
  unint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;
  if (a5)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
  _Block_copy(v8);
  v15 = self;
  sub_100026B98(v9, v10, v12, v13, (unint64_t)a5, (uint64_t)v15, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)subscribedVoicesWithClientId:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  uint64_t v10 = self;
  sub_1000118F4(v7, (uint64_t)a3, (uint64_t)sub_100028C44, v9);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)getSynthesisVoiceMatching:(id)a3 reply:(id)a4
{
}

- (void)queryPhaticCapabilityWithVoice:(id)a3 reply:(id)a4
{
}

- (void)isSpeakingWithAccessoryId:(id)a3 reply:(id)a4
{
}

- (void)getAudioPowerWithAccessoryId:(id)a3 reply:(id)a4
{
}

- (void)adjustVolumeWithAccessoryId:(id)a3 volume:(float)a4 rampTime:(double)a5 didFinish:(id)a6
{
  uint64_t v11 = sub_100006560(&qword_100039BC0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  }
  _Block_copy(v14);
  v17 = self;
  sub_100027C9C((uint64_t)v13, (uint64_t)v14, a4, a5);
  _Block_release(v14);
  _Block_release(v14);

  sub_100013A98((uint64_t)v13, &qword_100039BC0);
}

- (void)isANEModelCompiledMatching:(id)a3 reply:(id)a4
{
}

- (void)clearDeviceCacheWithDidFinish:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000288C4((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC13SiriTTSDaemon16DaemonXPCHandler)init
{
  result = (_TtC13SiriTTSDaemon16DaemonXPCHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)killDaemon
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Receive command to kill daemon.", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  exit(0);
}

@end