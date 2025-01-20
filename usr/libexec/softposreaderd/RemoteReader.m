@interface RemoteReader
- (_TtC14softposreaderd12RemoteReader)init;
- (void)cancelReadWithCallback:(id)a3 reply:(id)a4;
- (void)cancelReadWithReply:(id)a3;
- (void)generateSecureReaderBlobWithTrxBlob:(id)a3 pinBlob:(id)a4 reply:(id)a5;
- (void)getCardReaderBlobWithTxnBlob:(id)a3 reply:(id)a4;
- (void)getStoreAndForwardResultsBlobWithTrxHashes:(id)a3 sessionId:(id)a4 activationId:(id)a5 mid:(id)a6 partnerId:(id)a7 virtualTerminalId:(id)a8 reply:(id)aBlock;
- (void)readCardWithParameter:(id)a3 delegate:(id)a4 reply:(id)a5;
- (void)validateStoreAndForwardResultsToken:(id)a3 sessionId:(id)a4 activationId:(id)a5 trxCount:(int64_t)a6 reply:(id)a7;
- (void)validateWithReadParameters:(id)a3 reply:(id)a4;
@end

@implementation RemoteReader

- (void)validateWithReadParameters:(id)a3 reply:(id)a4
{
  v6 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v7 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  uint64_t v8 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v7);
  v9 = *(void (**)(id, uint64_t, uint64_t))(v8 + 8);
  id v11 = a3;
  v10 = self;
  v9(v11, v7, v8);
  v6[2](v6, 0);
  _Block_release(v6);
}

- (void)readCardWithParameter:(id)a3 delegate:(id)a4 reply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  uint64_t v11 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v10);
  v12 = *(void (**)(id, id, void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v11 + 16);
  id v13 = a3;
  swift_unknownObjectRetain();
  v14 = self;
  v12(a3, a4, sub_100008E5C, v9, v10, v11);

  swift_unknownObjectRelease();

  swift_release();
}

- (void)cancelReadWithReply:(id)a3
{
  v4 = (void (**)(void *, void))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  uint64_t v6 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v5);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 24);
  uint64_t v8 = self;
  v7(v5, v6);
  v4[2](v4, 0);
  _Block_release(v4);
}

- (void)generateSecureReaderBlobWithTrxBlob:(id)a3 pinBlob:(id)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(void *, NSString, void))_Block_copy(a5);
  id v9 = a3;
  v20 = self;
  id v10 = a4;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  if (v10)
  {
    uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    unint64_t v16 = 0xF000000000000000;
  }
  uint64_t v17 = *(void *)&v20->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  uint64_t v18 = *(void *)&v20->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100006788((Class *)((char *)&v20->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v17);
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v18 + 32))(v11, v13, v14, v16, v17, v18);
  NSString v19 = String._bridgeToObjectiveC()();
  v8[2](v8, v19, 0);
  swift_bridgeObjectRelease();

  _Block_release(v8);
  sub_10000BF70(v14, v16);
  sub_100006628(v11, v13);
}

- (void)getStoreAndForwardResultsBlobWithTrxHashes:(id)a3 sessionId:(id)a4 activationId:(id)a5 mid:(id)a6 partnerId:(id)a7 virtualTerminalId:(id)a8 reply:(id)aBlock
{
  unint64_t v16 = (void (**)(void *, NSString, void))_Block_copy(aBlock);
  sub_10000BF30();
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16]);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v10 + 40);
  unint64_t v15 = self;
  v11(v14, v13);
  NSString v12 = String._bridgeToObjectiveC()();
  v16[2](v16, v12, 0);
  swift_bridgeObjectRelease();

  _Block_release(v16);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)validateStoreAndForwardResultsToken:(id)a3 sessionId:(id)a4 activationId:(id)a5 trxCount:(int64_t)a6 reply:(id)a7
{
  v23 = (void (**)(void *, void))_Block_copy(a7);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = v9;
  uint64_t v21 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v17 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  uint64_t v16 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v17);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int64_t, uint64_t, uint64_t))(v16 + 48);
  NSString v19 = self;
  v18(v21, v20, v10, v12, v13, v15, a6, v17, v16);
  v23[2](v23, 0);
  _Block_release(v23);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)cancelReadWithCallback:(id)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v7 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  uint64_t v8 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v7);
  uint64_t v9 = *(void (**)(id, uint64_t, uint64_t))(v8 + 64);
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  v9(a3, v7, v8);
  v6[2](v6, 0);
  _Block_release(v6);

  swift_unknownObjectRelease();
}

- (void)getCardReaderBlobWithTxnBlob:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(void *, NSString))_Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  uint64_t v10 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v9);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v12 = self;
  v11(v6, v8, v9, v10);
  NSString v13 = String._bridgeToObjectiveC()();
  v5[2](v5, v13);
  swift_bridgeObjectRelease();

  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (_TtC14softposreaderd12RemoteReader)init
{
  result = (_TtC14softposreaderd12RemoteReader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end