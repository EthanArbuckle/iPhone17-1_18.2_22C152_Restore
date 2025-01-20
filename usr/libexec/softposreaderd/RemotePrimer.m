@interface RemotePrimer
- (_TtC14softposreaderd12RemotePrimer)init;
- (void)copyConfigurationWithReply:(id)a3;
- (void)dealloc;
- (void)providerProxyWithReply:(id)a3;
- (void)secureChannelProxyWithReply:(id)a3;
@end

@implementation RemotePrimer

- (void)dealloc
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemotePrimer_instance);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_100006788(v3, v4);
  uint64_t v6 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemotePrimer_isPOS);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
  v8 = self;
  v7(v6, v4, v5);
  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for RemotePrimer();
  [(RemotePrimer *)&v9 dealloc];
}

- (void).cxx_destruct
{
}

- (void)copyConfigurationWithReply:(id)a3
{
}

- (void)providerProxyWithReply:(id)a3
{
  void (*v7)(void *__return_ptr, uint64_t, uint64_t);
  _TtC14softposreaderd12RemotePrimer *v8;
  objc_class *v9;
  id v10;
  _TtC14softposreaderd12RemotePrimer *v11;
  objc_super v12;
  void v13[5];

  uint64_t v4 = (void (**)(void *, _TtC14softposreaderd12RemotePrimer *))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemotePrimer_instance + 16];
  uint64_t v6 = *(void *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemotePrimer_instance + 24];
  sub_100006788((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemotePrimer_instance), v5);
  v7 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v6 + 40);
  v8 = self;
  v7(v13, v5, v6);
  objc_super v9 = (objc_class *)type metadata accessor for RemoteProvider();
  v10 = objc_allocWithZone(v9);
  sub_100009300((uint64_t)v13, (uint64_t)v10 + OBJC_IVAR____TtC14softposreaderd14RemoteProvider_instance);
  v12.receiver = v10;
  v12.super_class = v9;
  v11 = [(RemotePrimer *)&v12 init];
  sub_100006520((uint64_t)v13);
  v4[2](v4, v11);

  _Block_release(v4);
}

- (void)secureChannelProxyWithReply:(id)a3
{
}

- (_TtC14softposreaderd12RemotePrimer)init
{
  result = (_TtC14softposreaderd12RemotePrimer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end