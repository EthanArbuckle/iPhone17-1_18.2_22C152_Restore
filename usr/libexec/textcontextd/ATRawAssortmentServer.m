@interface ATRawAssortmentServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC12textcontextd21ATRawAssortmentServer)init;
- (void)dealloc;
@end

@implementation ATRawAssortmentServer

- (_TtC12textcontextd21ATRawAssortmentServer)init
{
  return (_TtC12textcontextd21ATRawAssortmentServer *)sub_1000058B0();
}

- (void)dealloc
{
  uint64_t v3 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener);
  v5 = self;
  [v4 setDelegate:0];
  [*(id *)((char *)&self->super.isa + v3) invalidate];
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for ATRawAssortmentServer();
  [(ATRawAssortmentServer *)&v6 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100005DFC(v7);

  return v9 & 1;
}

@end