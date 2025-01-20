@interface CRLSceneCaptureSnapshotLayer.CRLSceneCaptureContentClippingLayer
- (_TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer)init;
- (_TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer)initWithCoder:(id)a3;
- (_TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer)initWithLayer:(id)a3;
@end

@implementation CRLSceneCaptureSnapshotLayer.CRLSceneCaptureContentClippingLayer

- (_TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer)init
{
  v3 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer_clippingRect);
  _OWORD *v3 = 0u;
  v3[1] = 0u;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer_invertClipping) = 0;
  v4 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer_renderRect);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  uint64_t v5 = OBJC_IVAR____TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer_maskLayer;
  id v6 = objc_allocWithZone((Class)CAShapeLayer);
  v7 = self;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)[v6 init];

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for CRLSceneCaptureSnapshotLayer.CRLSceneCaptureContentClippingLayer();
  return [(CRLSceneCaptureSnapshotLayer.CRLSceneCaptureContentClippingLayer *)&v9 init];
}

- (_TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer *)sub_10099C934(v4);
}

- (_TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer)initWithCoder:(id)a3
{
  return (_TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer *)sub_10099CA74(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC8Freeform28CRLSceneCaptureSnapshotLayer35CRLSceneCaptureContentClippingLayer_maskLayer));
}

@end