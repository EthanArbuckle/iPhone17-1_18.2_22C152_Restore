@interface RemoteConfigurator
- (_TtC14softposreaderd18RemoteConfigurator)init;
- (void)installWithToken:(id)a3 force:(BOOL)a4 delegate:(id)a5 reply:(id)a6;
- (void)prepareAndWarnWithToken:(id)a3 force:(BOOL)a4 enableStoreAndForward:(BOOL)a5 reply:(id)a6;
- (void)statusWithToken:(id)a3 options:(int64_t)a4 reply:(id)a5;
@end

@implementation RemoteConfigurator

- (void)prepareAndWarnWithToken:(id)a3 force:(BOOL)a4 enableStoreAndForward:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v10 = _Block_copy(a6);
  if (a3)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  _Block_copy(v10);
  v13 = self;
  sub_100008E64(v11, (uint64_t)a3, v7, v6, (uint64_t)v13, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (void)installWithToken:(id)a3 force:(BOOL)a4 delegate:(id)a5 reply:(id)a6
{
  BOOL v17 = a4;
  v8 = _Block_copy(a6);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v8;
  uint64_t v13 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance + 16];
  uint64_t v14 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance), v13);
  v15 = *(void (**)(uint64_t, uint64_t, BOOL, id, void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v14 + 16);
  swift_unknownObjectRetain();
  v16 = self;
  v15(v9, v11, v17, a5, sub_100008E5C, v12, v13, v14);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)statusWithToken:(id)a3 options:(int64_t)a4 reply:(id)a5
{
  BOOL v7 = (void (**)(void *, Class, void))_Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance + 16];
  uint64_t v12 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance), v11);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, int64_t, uint64_t, uint64_t))(v12 + 24);
  v15 = self;
  v13(v8, v10, a4, v11, v12);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v7[2](v7, isa, 0);
  swift_bridgeObjectRelease();

  _Block_release(v7);
  swift_bridgeObjectRelease();
}

- (_TtC14softposreaderd18RemoteConfigurator)init
{
  result = (_TtC14softposreaderd18RemoteConfigurator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end