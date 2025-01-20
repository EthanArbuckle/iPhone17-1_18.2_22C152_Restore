@interface CRLSceneCaptureSnapshotLayer
- (_TtC8Freeform28CRLSceneCaptureSnapshotLayer)init;
- (_TtC8Freeform28CRLSceneCaptureSnapshotLayer)initWithCoder:(id)a3;
- (_TtC8Freeform28CRLSceneCaptureSnapshotLayer)initWithLayer:(id)a3;
@end

@implementation CRLSceneCaptureSnapshotLayer

- (_TtC8Freeform28CRLSceneCaptureSnapshotLayer)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Freeform28CRLSceneCaptureSnapshotLayer_chromeClippingLayer;
  id v6 = objc_allocWithZone((Class)CALayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC8Freeform28CRLSceneCaptureSnapshotLayer_coordinateSpaceLayer;
  *(Class *)((char *)&self->super.super.isa + v8) = (Class)[objc_allocWithZone((Class)type metadata accessor for CRLSceneCaptureSnapshotLayer.CRLSceneCaptureContentClippingLayer()) init];

  result = (_TtC8Freeform28CRLSceneCaptureSnapshotLayer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8Freeform28CRLSceneCaptureSnapshotLayer)init
{
  result = (_TtC8Freeform28CRLSceneCaptureSnapshotLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Freeform28CRLSceneCaptureSnapshotLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  result = (_TtC8Freeform28CRLSceneCaptureSnapshotLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLSceneCaptureSnapshotLayer_renderLayer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLSceneCaptureSnapshotLayer_chromeClippingLayer));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform28CRLSceneCaptureSnapshotLayer_coordinateSpaceLayer);
}

@end