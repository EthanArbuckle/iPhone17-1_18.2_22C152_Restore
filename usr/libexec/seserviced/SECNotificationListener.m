@interface SECNotificationListener
+ (void)kickOff;
- (_TtC10seserviced23SECNotificationListener)init;
- (void)onDarwinNotification:(id)a3;
- (void)onEvent:(id)a3 eventPayload:(id)a4;
@end

@implementation SECNotificationListener

+ (void)kickOff
{
  if (qword_100453700 != -1) {
    swift_once();
  }
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = String._bridgeToObjectiveC()();
}

- (_TtC10seserviced23SECNotificationListener)init
{
  return (_TtC10seserviced23SECNotificationListener *)sub_100171B74();
}

- (void)onDarwinNotification:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  v7 = self;
  sub_10017297C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)onEvent:(id)a3 eventPayload:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  sub_10017539C(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_10008E734((uint64_t)self + OBJC_IVAR____TtC10seserviced23SECNotificationListener_delegate, (uint64_t *)&unk_100456740);

  swift_release();
}

@end