@interface SUIBUIBridgeClient
- (SUIBUIBridgeClient)init;
- (SUIBUIBridgeClient)initWithDelegate:(id)a3;
- (SUIBUIBridgeClient)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (void)dealloc;
- (void)preheat;
- (void)siriDismissed;
- (void)siriPrompted;
- (void)siriWillPrompt;
- (void)startAttending;
- (void)startAttendingWithReason:(unint64_t)a3 deviceId:(id)a4;
- (void)stopAttendingForReason:(unint64_t)a3;
@end

@implementation SUIBUIBridgeClient

- (SUIBUIBridgeClient)initWithDelegate:(id)a3
{
  return (SUIBUIBridgeClient *)SUIBUIBridgeClient.init(delegate:)((uint64_t)a3);
}

- (SUIBUIBridgeClient)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  return (SUIBUIBridgeClient *)SUIBUIBridgeClient.init(delegate:delegateQueue:)((uint64_t)a3, a4);
}

- (void)dealloc
{
  v2 = self;
  sub_25DD98E88();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (void)preheat
{
  v2 = self;
  SUIBUIBridgeClient.preheat()();
}

- (void)siriDismissed
{
  v2 = self;
  SUIBUIBridgeClient.siriDismissed()();
}

- (void)siriPrompted
{
  v2 = self;
  SUIBUIBridgeClient.siriPrompted()();
}

- (void)stopAttendingForReason:(unint64_t)a3
{
  v4 = self;
  SUIBUIBridgeClient.stopAttending(for:)(a3);
}

- (void)siriWillPrompt
{
  v2 = self;
  SUIBUIBridgeClient.siriWillPrompt()();
}

- (void)startAttending
{
  v2 = self;
  SUIBUIBridgeClient.startAttending()();
}

- (void)startAttendingWithReason:(unint64_t)a3 deviceId:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_25DDACA70();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  v9 = self;
  SUIBUIBridgeClient.startAttending(with:deviceId:)(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (SUIBUIBridgeClient)init
{
}

@end