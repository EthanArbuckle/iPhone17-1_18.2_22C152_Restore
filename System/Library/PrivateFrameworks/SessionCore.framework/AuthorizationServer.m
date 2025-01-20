@interface AuthorizationServer
- (_TtC11SessionCore19AuthorizationServer)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation AuthorizationServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C7D2DAF8(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore19AuthorizationServer)init
{
  result = (_TtC11SessionCore19AuthorizationServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore19AuthorizationServer_requestProcessingQueue));

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end