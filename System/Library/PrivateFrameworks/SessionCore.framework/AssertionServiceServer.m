@interface AssertionServiceServer
- (_TtC11SessionCore22AssertionServiceServer)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation AssertionServiceServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C7D23A70(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore22AssertionServiceServer)init
{
  result = (_TtC11SessionCore22AssertionServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore22AssertionServiceServer_requestProcessingQueue));

  v3 = (char *)self + OBJC_IVAR____TtC11SessionCore22AssertionServiceServer_assertionManager;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end