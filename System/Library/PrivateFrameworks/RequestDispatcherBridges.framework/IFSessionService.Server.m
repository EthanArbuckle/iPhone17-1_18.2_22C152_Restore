@interface IFSessionService.Server
- (_TtCO24RequestDispatcherBridges16IFSessionService6Server)init;
- (void)dealloc;
- (void)getCurrentSessionIdentifierWithReply:(id)a3;
- (void)sendWithMessageData:(id)a3 with:(id)a4;
@end

@implementation IFSessionService.Server

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_1EBC83360;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  sub_1C91E122C((uint64_t)v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(IFSessionService.Server *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtCO24RequestDispatcherBridges16IFSessionService6Server_logger;
  uint64_t v4 = sub_1C930ADF8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (_TtCO24RequestDispatcherBridges16IFSessionService6Server)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtCO24RequestDispatcherBridges16IFSessionService6Server_jsonDecoder;
  sub_1C9306A38();
  swift_allocObject();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_1C9306A28();
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtCO24RequestDispatcherBridges16IFSessionService6Server_clientProxy) = 0;
  uint64_t v6 = OBJC_IVAR____TtCO24RequestDispatcherBridges16IFSessionService6Server_logger;
  if (qword_1EBC83618 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1C930ADF8();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1EBC83BA8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))((char *)v5 + v6, v8, v7);

  v10.receiver = v5;
  v10.super_class = ObjectType;
  return [(IFSessionService.Server *)&v10 init];
}

- (void)sendWithMessageData:(id)a3 with:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  v11 = self;
  uint64_t v8 = sub_1C9306DA8();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_1C91E80F0(v8, v10, (uint64_t)v11, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_1C91E7EE4(v8, v10);
}

- (void)getCurrentSessionIdentifierWithReply:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1C91E84DC((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

@end