@interface WeakDaemonDelegateWrapper
- (void)didGenerateAudioWithRequestId:(unint64_t)a3 audio:(id)a4;
- (void)didGenerateWordTimingsWithRequestId:(unint64_t)a3 wordTimingInfo:(id)a4;
- (void)didReportInstrumentWithRequestId:(unint64_t)a3 instrumentationMetrics:(id)a4;
- (void)didStartSpeakingWithRequestId:(unint64_t)a3;
- (void)pingWithReply:(id)a3;
@end

@implementation WeakDaemonDelegateWrapper

- (void)didStartSpeakingWithRequestId:(unint64_t)a3
{
  swift_retain();
  sub_19CE87154(a3);
  swift_release();
}

- (void)didReportInstrumentWithRequestId:(unint64_t)a3 instrumentationMetrics:(id)a4
{
}

- (void)didGenerateAudioWithRequestId:(unint64_t)a3 audio:(id)a4
{
}

- (void)didGenerateWordTimingsWithRequestId:(unint64_t)a3 wordTimingInfo:(id)a4
{
  type metadata accessor for WordTimingInfo();
  sub_19CED5550();
  swift_retain();
  sub_19CE8732C(a3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)pingWithReply:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_19CE8743C((uint64_t)sub_19CDDD4F4, v4);
  swift_release();
  swift_release();
}

@end