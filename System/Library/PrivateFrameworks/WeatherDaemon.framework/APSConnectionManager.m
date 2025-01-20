@interface APSConnectionManager
- (_TtC8weatherd20APSConnectionManager)init;
- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation APSConnectionManager

- (_TtC8weatherd20APSConnectionManager)init
{
  return (_TtC8weatherd20APSConnectionManager *)sub_100047678();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8weatherd20APSConnectionManager__connection);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v4 = a4;
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = v4;
    v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    id v11 = a3;
    v12 = self;
    unint64_t v10 = 0xF000000000000000;
  }
  sub_100008D74((uint64_t)v4, v10);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100048D34((uint64_t)v8, a4);
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  unint64_t v4 = (unint64_t)a4;
  if (a4)
  {
    sub_100027A84(0, &qword_100063FF8);
    unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  id v8 = self;
  sub_100049438((uint64_t)v8, v4);

  swift_bridgeObjectRelease();
}

@end