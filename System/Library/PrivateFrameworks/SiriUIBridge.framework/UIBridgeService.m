@interface UIBridgeService
- (_TtC12SiriUIBridge15UIBridgeService)init;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)preheat;
- (void)siriDismissed;
- (void)siriPrompted;
- (void)siriWillPrompt;
- (void)startAttending;
- (void)startAttendingWithReason:(unint64_t)a3 deviceId:(id)a4;
- (void)stopAttendingForReason:(unint64_t)a3;
- (void)stopAttendingWithReason:(unint64_t)a3;
@end

@implementation UIBridgeService

- (void)preheat
{
  v2 = self;
  sub_25DD9C24C();
}

- (void)siriDismissed
{
  v2 = self;
  sub_25DD9C294();
}

- (void)siriPrompted
{
  v2 = self;
  sub_25DD9C42C();
}

- (void)stopAttendingWithReason:(unint64_t)a3
{
  v3 = self;
  sub_25DD9C838();
}

- (void)stopAttendingForReason:(unint64_t)a3
{
  v3 = self;
  sub_25DD9C8B4();
}

- (void)siriWillPrompt
{
  v2 = self;
  sub_25DD9CDF8();
}

- (void)startAttending
{
  v2 = self;
  sub_25DD9CF14();
}

- (void)startAttendingWithReason:(unint64_t)a3 deviceId:(id)a4
{
  if (a4) {
    sub_25DDACA70();
  }
  v5 = self;
  sub_25DD9CF6C();

  swift_bridgeObjectRelease();
}

- (void)connectionInterrupted
{
  v2 = self;
  sub_25DDA1434();
}

- (void)connectionInvalidated
{
  v2 = self;
  sub_25DDA1488();
}

- (_TtC12SiriUIBridge15UIBridgeService)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_messagePublisher);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
}

@end