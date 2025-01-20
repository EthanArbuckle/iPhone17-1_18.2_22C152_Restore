@interface APSPushConnection
- (_TtC24SessionPushNotifications17APSPushConnection)init;
- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5;
@end

@implementation APSPushConnection

- (_TtC24SessionPushNotifications17APSPushConnection)init
{
  result = (_TtC24SessionPushNotifications17APSPushConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24SessionPushNotifications17APSPushConnection_connection));
  v3 = (char *)self + OBJC_IVAR____TtC24SessionPushNotifications17APSPushConnection_delegate;
  sub_1C7BBFC64((uint64_t)v3);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    uint64_t v9 = sub_1C7BD9FA0();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    v13 = self;
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  sub_1C7BBE988(v9, v11);
  sub_1C7BBFB0C(v9, v11);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1C7BBEC54(a4);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
  if (a4)
  {
    id v8 = a3;
    id v9 = a5;
    unint64_t v10 = self;
    id v11 = a4;
    id v12 = sub_1C7BD9FA0();
    unint64_t v14 = v13;
  }
  else
  {
    id v15 = a3;
    id v16 = a5;
    v17 = self;
    id v12 = 0;
    unint64_t v14 = 0xF000000000000000;
  }
  sub_1C7BBEFF0(v12, v14, a5);
  sub_1C7BBFB0C((uint64_t)v12, v14);
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  unint64_t v4 = (unint64_t)a4;
  if (a4)
  {
    sub_1C7BBFC24();
    unint64_t v4 = sub_1C7BDA630();
  }
  id v7 = a3;
  id v8 = self;
  sub_1C7BBF50C(v4);

  swift_bridgeObjectRelease();
}

@end