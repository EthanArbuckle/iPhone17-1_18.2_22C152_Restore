@interface StateCaptureServiceServer
- (_TtC11SessionCore25StateCaptureServiceServer)init;
- (id)stateForIdentifier:(id)a3 error:(id *)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation StateCaptureServiceServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C7C6A010(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore25StateCaptureServiceServer)init
{
  result = (_TtC11SessionCore25StateCaptureServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore25StateCaptureServiceServer_requestProcessingQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore25StateCaptureServiceServer_stateCaptureManager);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SessionCore25StateCaptureServiceServer_listener);
}

- (id)stateForIdentifier:(id)a3 error:(id *)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1C7D32CE0();
    id v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    id v7 = 0;
  }
  id v8 = self;
  sub_1C7C69958(v5, v7);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_1C7D32C40();
  swift_bridgeObjectRelease();
  return v9;
}

@end