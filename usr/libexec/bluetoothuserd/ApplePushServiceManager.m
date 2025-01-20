@interface ApplePushServiceManager
+ (_TtC14bluetoothuserd23ApplePushServiceManager)shared;
- (_TtC14bluetoothuserd23ApplePushServiceManager)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
@end

@implementation ApplePushServiceManager

+ (_TtC14bluetoothuserd23ApplePushServiceManager)shared
{
  if (qword_100091330 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1000949B8;

  return (_TtC14bluetoothuserd23ApplePushServiceManager *)v2;
}

- (_TtC14bluetoothuserd23ApplePushServiceManager)init
{
  return (_TtC14bluetoothuserd23ApplePushServiceManager *)sub_1000080CC();
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
  sub_100009B50((uint64_t)v4, v10);
  sub_10000AB08((uint64_t)v4, v10);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8 = a4;
  if (a4)
  {
    id v10 = a3;
    id v11 = a5;
    id v12 = a6;
    v13 = self;
    id v14 = v8;
    id v8 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v16 = v15;

    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = 0;
    unint64_t v19 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  id v23 = a3;
  id v24 = a5;
  id v25 = a6;
  v26 = self;
  unint64_t v16 = 0xF000000000000000;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  if (a6)
  {
LABEL_4:
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v22 = v21;

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v20 = 0;
  unint64_t v22 = 0;
LABEL_8:
  sub_100009ED4((uint64_t)v8, v16, v17, v19, v20, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000AB08((uint64_t)v8, v16);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10000A354(a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_pushServiceQueue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_subscriptionQueue));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_apsConnection);
}

@end