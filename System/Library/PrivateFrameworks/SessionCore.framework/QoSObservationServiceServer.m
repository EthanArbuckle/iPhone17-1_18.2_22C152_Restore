@interface QoSObservationServiceServer
- (_TtC11SessionCore27QoSObservationServiceServer)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation QoSObservationServiceServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C7D27754(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore27QoSObservationServiceServer)init
{
  result = (_TtC11SessionCore27QoSObservationServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore27QoSObservationServiceServer_requestProcessingQueue));

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end