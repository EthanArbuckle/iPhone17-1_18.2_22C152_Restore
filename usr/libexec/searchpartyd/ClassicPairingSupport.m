@interface ClassicPairingSupport
- (void)pairedDeviceNameChanged:(id)a3;
@end

@implementation ClassicPairingSupport

- (void)pairedDeviceNameChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v8[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for Transaction();
  v9 = self;
  v10 = v7;
  swift_retain();
  static Transaction.named<A>(_:with:)();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

@end