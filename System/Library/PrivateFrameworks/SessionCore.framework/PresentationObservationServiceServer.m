@interface PresentationObservationServiceServer
- (_TtC11SessionCore36PresentationObservationServiceServer)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PresentationObservationServiceServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C7C6695C(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore36PresentationObservationServiceServer)init
{
  result = (_TtC11SessionCore36PresentationObservationServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore36PresentationObservationServiceServer_requestProcessingQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore36PresentationObservationServiceServer_listener));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end