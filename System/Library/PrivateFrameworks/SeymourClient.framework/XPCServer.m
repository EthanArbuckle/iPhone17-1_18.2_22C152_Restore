@interface XPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13SeymourClient9XPCServer)init;
- (void)receiveEvent:(int64_t)a3 data:(id)a4;
- (void)receiveRequest:(int64_t)a3 data:(id)a4 completion:(id)a5;
@end

@implementation XPCServer

- (_TtC13SeymourClient9XPCServer)init
{
  result = (_TtC13SeymourClient9XPCServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1D5A8F6C0(v7);

  return v9 & 1;
}

- (void)receiveRequest:(int64_t)a3 data:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  v8 = self;
  if (a4)
  {
    id v9 = a4;
    a4 = (id)sub_1D5AB1C20();
    unint64_t v11 = v10;
  }
  else
  {
    unint64_t v11 = 0xF000000000000000;
  }
  v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SeymourClient9XPCServer_dispatchService);
  _Block_copy(v7);
  sub_1D5AB05B0(a3, (uint64_t)a4, v11, v12, (void (**)(void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
  sub_1D5956DE4((uint64_t)a4, v11);
}

- (void)receiveEvent:(int64_t)a3 data:(id)a4
{
  if (a4)
  {
    id v6 = self;
    id v7 = a4;
    uint64_t v8 = sub_1D5AB1C20();
    unint64_t v10 = v9;
  }
  else
  {
    unint64_t v11 = self;
    uint64_t v8 = 0;
    unint64_t v10 = 0xF000000000000000;
  }
  TransportDispatchService.dispatchEvent(_:data:)(a3, v8, v10);
  sub_1D5956DE4(v8, (unint64_t)v10);
}

@end