@interface IDSMessagingService
- (_TtC14NanoPhotosSync19IDSMessagingService)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation IDSMessagingService

- (_TtC14NanoPhotosSync19IDSMessagingService)init
{
  swift_defaultActor_initialize();
  result = (_TtC14NanoPhotosSync19IDSMessagingService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v14 = sub_100006290(&qword_1000A15B0);
  __chkstk_darwin(v14 - 8);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  swift_retain();
  sub_100033774(a3, (uint64_t)v16, (uint64_t)a6, v19, (uint64_t)a7, a8);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000BD30((uint64_t)v16, &qword_1000A15B0);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (a6) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  swift_retain();
  sub_100033D00(a5, a7);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  if (a5)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v13 = 0;
  }
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  swift_retain();
  sub_1000340A0(v11, v13, v8, (uint64_t)a7);

  swift_release();

  swift_bridgeObjectRelease();
}

@end