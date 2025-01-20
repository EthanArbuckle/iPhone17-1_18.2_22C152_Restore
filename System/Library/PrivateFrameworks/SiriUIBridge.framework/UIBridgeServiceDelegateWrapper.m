@interface UIBridgeServiceDelegateWrapper
- (_TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper)init;
- (void)uiBridgeServiceDetectedSiriDirectedSpeech;
- (void)uiBridgeServiceDetectedSpeechStart;
- (void)uiBridgeServiceDetectedSpeechStart:(BOOL)a3;
- (void)uiBridgeServiceDidDetectLanguageMismatch:(id)a3;
- (void)uiBridgeServiceDidReceiveTasks:(id)a3;
- (void)uiBridgeServiceDidStartAttending;
- (void)uiBridgeServiceDidStartAttendingWithRootRequestId:(id)a3;
- (void)uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:(unint64_t)a3;
- (void)uiBridgeServiceReceivedRequestProgress:(id)a3;
- (void)uiBridgeServiceReceivedShowAssetsDownloadPrompt;
- (void)uiBridgeServiceReceivedSiriResponse:(id)a3;
- (void)uiBridgeServiceReceivedSpeechMitigationResult:(unint64_t)a3;
- (void)uiBridgeServiceTaskDidCancel:(id)a3;
- (void)uiBridgeServiceTaskDidEnd:(id)a3;
- (void)uiBridgeServiceWillStartAttending;
@end

@implementation UIBridgeServiceDelegateWrapper

- (void)uiBridgeServiceWillStartAttending
{
  v2 = self;
  sub_25DDA3C94();
}

- (void)uiBridgeServiceDidStartAttending
{
  v2 = self;
  sub_25DDA3CF4();
}

- (void)uiBridgeServiceDidStartAttendingWithRootRequestId:(id)a3
{
  if (a3) {
    sub_25DDACA70();
  }
  v4 = self;
  sub_25DDA3D54();

  swift_bridgeObjectRelease();
}

- (void)uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:(unint64_t)a3
{
  v4 = self;
  sub_25DDA3EF4(a3);
}

- (void)uiBridgeServiceDetectedSpeechStart
{
  v2 = self;
  sub_25DDA3F60();
}

- (void)uiBridgeServiceDetectedSpeechStart:(BOOL)a3
{
  v4 = self;
  sub_25DDA3FC0(a3);
}

- (void)uiBridgeServiceDetectedSiriDirectedSpeech
{
  v2 = self;
  sub_25DDA4114();
}

- (void)uiBridgeServiceReceivedSpeechMitigationResult:(unint64_t)a3
{
  v4 = self;
  sub_25DDA4174(a3);
}

- (void)uiBridgeServiceReceivedShowAssetsDownloadPrompt
{
  v2 = self;
  sub_25DDA424C();
}

- (void)uiBridgeServiceReceivedRequestProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25DDA43A8(v4);
}

- (void)uiBridgeServiceDidReceiveTasks:(id)a3
{
  sub_25DDA81D8();
  uint64_t v4 = sub_25DDACAC0();
  v5 = self;
  sub_25DDA4428(v4);

  swift_bridgeObjectRelease();
}

- (void)uiBridgeServiceTaskDidEnd:(id)a3
{
}

- (void)uiBridgeServiceTaskDidCancel:(id)a3
{
}

- (void)uiBridgeServiceReceivedSiriResponse:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25DDA49F4(v4);
}

- (void)uiBridgeServiceDidDetectLanguageMismatch:(id)a3
{
  sub_25DDACA70();
  id v4 = self;
  sub_25DDA4B8C();

  swift_bridgeObjectRelease();
}

- (_TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper)init
{
}

- (void).cxx_destruct
{
  sub_25DDA8438((uint64_t)self + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
}

@end