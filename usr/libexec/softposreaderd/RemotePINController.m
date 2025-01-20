@interface RemotePINController
- (_TtC14softposreaderd19RemotePINController)init;
- (void)addDigitWithCipher:(id)a3 reply:(id)a4;
- (void)cancelPINCaptureWithReply:(id)a3;
- (void)capturePINWithParameters:(id)a3 reply:(id)a4;
- (void)generatePINBlockWithReply:(id)a3;
- (void)removeLastDigitWithReply:(id)a3;
- (void)updateParameters:(id)a3 reply:(id)a4;
- (void)verifyWithPINToken:(id)a3 reply:(id)a4;
@end

@implementation RemotePINController

- (void)capturePINWithParameters:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100009A9C((uint64_t)v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)addDigitWithCipher:(id)a3 reply:(id)a4
{
  v6 = (void (**)(void *, void))_Block_copy(a4);
  id v7 = a3;
  v13 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  uint64_t v11 = *(void *)&v13->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  uint64_t v12 = *(void *)&v13->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100006788((Class *)((char *)&v13->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v11);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v12 + 16))(v8, v10, v11, v12);
  v6[2](v6, 0);
  _Block_release(v6);
  sub_100006628(v8, v10);
}

- (void)removeLastDigitWithReply:(id)a3
{
  v4 = (void (**)(void *, void))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  uint64_t v6 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v5);
  id v7 = *(void (**)(uint64_t, uint64_t))(v6 + 24);
  uint64_t v8 = self;
  v7(v5, v6);
  v4[2](v4, 0);
  _Block_release(v4);
}

- (void)generatePINBlockWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100009C94((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)updateParameters:(id)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v7 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  uint64_t v8 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v7);
  unint64_t v9 = *(void (**)(id, uint64_t, uint64_t))(v8 + 48);
  id v11 = a3;
  unint64_t v10 = self;
  v9(v11, v7, v8);
  v6[2](v6, 0);
  _Block_release(v6);
}

- (void)cancelPINCaptureWithReply:(id)a3
{
  v4 = (void (**)(void))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  uint64_t v6 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v5);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 40);
  uint64_t v8 = self;
  v7(v5, v6);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_captureInProgress) = 0;
  swift_unknownObjectRelease();
  v4[2](v4);
  _Block_release(v4);
}

- (void)verifyWithPINToken:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  uint64_t v10 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v9);
  id v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v12 = self;
  v11(v6, v8, v9, v10);
  v5[2](v5, 0);
  _Block_release(v5);
  swift_bridgeObjectRelease();
}

- (_TtC14softposreaderd19RemotePINController)init
{
  result = (_TtC14softposreaderd19RemotePINController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100006520((uint64_t)self + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance);

  swift_unknownObjectRelease();
}

@end