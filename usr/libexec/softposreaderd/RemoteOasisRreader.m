@interface RemoteOasisRreader
- (_TtC14softposreaderd18RemoteOasisRreader)init;
- (void)cancelProvisionWithReply:(id)a3;
- (void)checkStatusWithReply:(id)a3;
- (void)provisionCardWithParameters:(id)a3 delegate:(id)a4 reply:(id)a5;
@end

@implementation RemoteOasisRreader

- (void)provisionCardWithParameters:(id)a3 delegate:(id)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 16];
  uint64_t v11 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance), v10);
  v12 = *(void (**)(id, id, void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v11 + 8);
  id v13 = a3;
  swift_unknownObjectRetain();
  v14 = self;
  v12(v13, a4, sub_100007004, v9, v10, v11);

  swift_unknownObjectRelease();

  swift_release();
}

- (void)cancelProvisionWithReply:(id)a3
{
  v4 = (void (**)(void *, void))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 16];
  uint64_t v6 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance), v5);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  v8 = self;
  v7(v5, v6);
  v4[2](v4, 0);
  _Block_release(v4);
}

- (void)checkStatusWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 16];
  uint64_t v7 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance), v6);
  v8 = *(void (**)(void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v7 + 24);
  uint64_t v9 = self;
  v8(sub_100007020, v5, v6, v7);

  swift_release();
}

- (_TtC14softposreaderd18RemoteOasisRreader)init
{
  result = (_TtC14softposreaderd18RemoteOasisRreader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end