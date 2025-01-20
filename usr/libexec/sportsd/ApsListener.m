@interface ApsListener
- (_TtC7sportsd11ApsListener)init;
- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation ApsListener

- (_TtC7sportsd11ApsListener)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100006178((uint64_t)self + OBJC_IVAR____TtC7sportsd11ApsListener_messageProcessing);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  sub_10000E36C(v11, v8, v10);
  sub_10000835C(v8, v10);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10000E5EC();
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  if (a4)
  {
    sub_10001C1C0(0, &qword_1000FC930);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  id v7 = self;
  sub_100014E24();

  swift_bridgeObjectRelease();
}

@end