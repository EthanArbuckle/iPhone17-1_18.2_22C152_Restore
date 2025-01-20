@interface IDSInboundMessaging
- (_TtC21UserNotificationsCore19IDSInboundMessaging)init;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
@end

@implementation IDSInboundMessaging

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = sub_260A84FA0();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  v8 = self;
  sub_260A3F42C(v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a6;
  if (a5)
  {
    uint64_t v12 = sub_260A84B30();
    if (v8)
    {
LABEL_3:
      uint64_t v13 = sub_260A84BC0();
      id v8 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v18 = self;
  sub_260A3F58C(v12, v13, (unint64_t)v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC21UserNotificationsCore19IDSInboundMessaging)init
{
  result = (_TtC21UserNotificationsCore19IDSInboundMessaging *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_26094056C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore19IDSInboundMessaging_payloadConsumer);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21UserNotificationsCore19IDSInboundMessaging_queue);
}

@end