@interface Daemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC3tzd6Daemon)init;
- (void)handleAssetDetectedMsg:(id)a3;
- (void)isUpdateWaitingWithReply:(id)a3;
- (void)purgeAllAssetsWithReply:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation Daemon

- (_TtC3tzd6Daemon)init
{
  sub_100012D18();
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_100017CF8(v7);

  return v9;
}

- (void)isUpdateWaitingWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_100018868;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_100014314((uint64_t)v7, v6);
  sub_100018820((uint64_t)v7);
}

- (void)purgeAllAssetsWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = (void (*)(const void *, uint64_t, void))*((void *)v4 + 2);
    id v7 = self;
    v6(v5, 1, 0);
    _Block_release(v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  if (a5)
  {
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
  }
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a8;
  v21 = self;
  sub_100018068(v14, v16, a6, (uint64_t)a7);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (a6)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = self;
  sub_10001826C(a4, a5, v12, v14);

  swift_bridgeObjectRelease();
}

- (void)handleAssetDetectedMsg:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001843C(v4);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3tzd6Daemon_listener);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  os_transaction_create();
  sub_1000162C8(v10, (void (**)(void))v8);
  swift_unknownObjectRelease();
  _Block_release(v8);
}

@end