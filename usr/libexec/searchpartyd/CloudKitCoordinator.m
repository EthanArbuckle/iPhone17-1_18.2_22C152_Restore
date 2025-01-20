@interface CloudKitCoordinator
- (void)accountDidChange:(id)a3;
@end

@implementation CloudKitCoordinator

- (void)accountDidChange:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  static os_log_type_t.default.getter();
  if (qword_101637268 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  type metadata accessor for Transaction();
  static Transaction.named<A>(_:with:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end