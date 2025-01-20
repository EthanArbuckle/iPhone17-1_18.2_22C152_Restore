@interface MessagingServiceDelegateTrampoline
- (_TtC12searchpartyd34MessagingServiceDelegateTrampoline)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation MessagingServiceDelegateTrampoline

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  v9 = a5;
  if (a5)
  {
    id v12 = a3;
    id v13 = a4;
    id v14 = a6;
    id v15 = a7;
    v16 = self;
    id v17 = v9;
    v9 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;

    if (a6)
    {
LABEL_3:
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v22 = v21;

      goto LABEL_6;
    }
  }
  else
  {
    id v23 = a3;
    id v24 = a4;
    id v25 = a6;
    id v26 = a7;
    v27 = self;
    unint64_t v19 = 0xF000000000000000;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  uint64_t v22 = 0;
LABEL_6:
  sub_100421D68((char *)a3, a4, (uint64_t)v9, v19, v20, v22, a7);
  swift_bridgeObjectRelease();
  sub_100037A24((uint64_t)v9, v19);
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  v28 = self;
  uint64_t v14 = sub_10000588C(&qword_101649E40);
  __chkstk_darwin(v14 - 8);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  if (a6) {
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a7)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a7 = v20;
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v21 = a3;
  id v22 = a4;
  id v23 = a8;
  id v24 = v28;
  id v25 = a8;
  id v26 = v24;
  sub_100422BFC((uint64_t)a3, a4, (uint64_t)v16, (uint64_t)a6, v19, (uint64_t)a7, v25);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001DAB4((uint64_t)v16, &qword_101649E40);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  if (a5)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v14 = 0;
  }
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  uint64_t v18 = self;
  sub_100423C54((uint64_t)a3, a4, v12, v14, v8, (char *)a7);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v8 = a6;
  if (a5)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;
    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v15 = 0;
    if (a7) {
      goto LABEL_4;
    }
LABEL_7:
    memset(v23, 0, sizeof(v23));
    id v20 = a3;
    id v21 = a4;
    id v22 = self;
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  unint64_t v14 = 0;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v16;
  if (!a7) {
    goto LABEL_7;
  }
LABEL_4:
  id v17 = a3;
  id v18 = a4;
  uint64_t v19 = self;
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
LABEL_8:
  sub_100424740((uint64_t)a3, a4, v12, v14, v15, (uint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001DAB4((uint64_t)v23, (uint64_t *)&unk_101644360);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  id v8 = self;
  sub_1004253BC((uint64_t)a3, v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
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
  if (a7)
  {
    id v18 = a7;
    uint64_t v19 = self;
    a7 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v21 = v20;
  }
  else
  {
    id v22 = self;
    unint64_t v21 = 0xF000000000000000;
  }
  sub_100426930(v16, v17, v12, v14, (uint64_t)a7, v21);
  sub_100037A24((uint64_t)a7, v21);

  swift_bridgeObjectRelease();
}

- (_TtC12searchpartyd34MessagingServiceDelegateTrampoline)init
{
  result = (_TtC12searchpartyd34MessagingServiceDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end