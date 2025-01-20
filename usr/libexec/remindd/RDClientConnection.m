@interface RDClientConnection
- (NSString)description;
- (_TtC7remindd18RDClientConnection)init;
- (void)changeTrackingPerformerWithStoreContainerToken:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)cloudKitNetworkActivityDidUpdate:(id)a3;
- (void)dealloc;
- (void)debugPerformerWithStoreContainerToken:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)indexingPerformerWithReason:(id)a3 completion:(id)a4;
- (void)storePerformerWithProcessName:(id)a3 storeContainerToken:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)syncInterfacePerformerWithReason:(id)a3 completion:(id)a4;
@end

@implementation RDClientConnection

- (void)dealloc
{
  v2 = self;
  sub_10049CAB0();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for RDClientConnection();
  [(RDClientConnection *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_1000F3DB4((uint64_t)self + OBJC_IVAR____TtC7remindd18RDClientConnection_delegate);
  sub_10012227C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity), *(void *)&self->delegate[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity], *(void *)&self->delegate[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity + 8], *(void *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity], *(void *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity + 8], *(unsigned int *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity + 16] | ((unint64_t)*(unsigned __int16 *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity + 20] << 32));
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd18RDClientConnection_notificationSubscriptionQueue));
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  sub_10049C468();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC7remindd18RDClientConnection)init
{
  result = (_TtC7remindd18RDClientConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)changeTrackingPerformerWithStoreContainerToken:(id)a3 reason:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  *(void *)(swift_allocObject() + 16) = v7;
  id v11 = a3;
  v12 = self;
  sub_10049D204((uint64_t)a3, v8, v10);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)debugPerformerWithStoreContainerToken:(id)a3 reason:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  *(void *)(swift_allocObject() + 16) = v7;
  uint64_t v11 = qword_100907360;
  id v12 = a3;
  v13 = self;
  if (v11 != -1) {
    swift_once();
  }
  sub_10010B4E8((uint64_t)v13 + OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity, (uint64_t)v18);
  v14._countAndFlagsBits = v8;
  v14._object = v10;
  String.append(_:)(v14);
  sub_10036ED54((uint64_t)v18, 0x2E6775626564, 0xE600000000000000);
  uint64_t v15 = swift_bridgeObjectRelease();
  __chkstk_darwin(v15);
  __chkstk_darwin(v16);
  sub_1004A0824((void (*)(uint64_t *, id))sub_1004A0984, v17, (void (*)(uint64_t *__return_ptr))sub_1004A09B0);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)storePerformerWithProcessName:(id)a3 storeContainerToken:(id)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v13 = sub_100149A20;
  uint64_t v14 = v9;
  id v10 = a4;
  uint64_t v11 = self;
  sub_1004A0824((void (*)(uint64_t *, id))sub_1004A0B50, (uint64_t)v12, (void (*)(uint64_t *__return_ptr))sub_1004A0960);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)syncInterfacePerformerWithReason:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  *(void *)(swift_allocObject() + 16) = v5;
  uint64_t v9 = qword_100907360;
  id v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  sub_10010B4E8((uint64_t)v10 + OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity, (uint64_t)v15);
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  String.append(_:)(v11);
  sub_10036ED54((uint64_t)v15, 0x2E636E7973, 0xE500000000000000);
  uint64_t v12 = swift_bridgeObjectRelease();
  __chkstk_darwin(v12);
  __chkstk_darwin(v13);
  sub_1004A0824((void (*)(uint64_t *, id))sub_1004A0B50, v14, (void (*)(uint64_t *__return_ptr))sub_1004A0944);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)indexingPerformerWithReason:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  *(void *)(swift_allocObject() + 16) = v5;
  uint64_t v9 = qword_100907360;
  id v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  sub_10010B4E8((uint64_t)v10 + OBJC_IVAR____TtC7remindd18RDClientConnection_clientIdentity, (uint64_t)v15);
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  String.append(_:)(v11);
  sub_10036ED54((uint64_t)v15, 0x676E697865646E69, 0xE90000000000002ELL);
  uint64_t v12 = swift_bridgeObjectRelease();
  __chkstk_darwin(v12);
  __chkstk_darwin(v13);
  sub_1004A0824((void (*)(uint64_t *, id))sub_1004A0B50, v14, (void (*)(uint64_t *__return_ptr))sub_10049F888);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)cloudKitNetworkActivityDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10049E580((uint64_t)v4);
}

@end