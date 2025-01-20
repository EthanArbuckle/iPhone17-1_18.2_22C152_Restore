@interface CRLCanvasDotGridLayer
+ (double)kCRLUnscaledSpacingBetweenDotCenters;
- (_TtC8Freeform21CRLCanvasDotGridLayer)init;
- (_TtC8Freeform21CRLCanvasDotGridLayer)initWithCanvasBackgroundDelegate:(id)a3 viewScale:(double)a4;
- (_TtC8Freeform21CRLCanvasDotGridLayer)initWithCoder:(id)a3;
- (_TtC8Freeform21CRLCanvasDotGridLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation CRLCanvasDotGridLayer

+ (double)kCRLUnscaledSpacingBetweenDotCenters
{
  return 25.0;
}

- (void)layoutSublayers
{
  v2 = self;
  sub_100E8DB9C();
}

- (_TtC8Freeform21CRLCanvasDotGridLayer)initWithCanvasBackgroundDelegate:(id)a3 viewScale:(double)a4
{
  swift_unknownObjectRetain();
  v5 = (_TtC8Freeform21CRLCanvasDotGridLayer *)sub_100E8E9B0(a4);
  swift_unknownObjectRelease();
  return v5;
}

- (_TtC8Freeform21CRLCanvasDotGridLayer)init
{
  return (_TtC8Freeform21CRLCanvasDotGridLayer *)sub_100E8E318();
}

- (_TtC8Freeform21CRLCanvasDotGridLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC8Freeform21CRLCanvasDotGridLayer *)sub_100E8E410(v4);
}

- (_TtC8Freeform21CRLCanvasDotGridLayer)initWithCoder:(id)a3
{
  return (_TtC8Freeform21CRLCanvasDotGridLayer *)sub_100E8E57C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLCanvasDotGridLayer_outerReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLCanvasDotGridLayer_innerReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLCanvasDotGridLayer_imageTileLayer));
  v3 = *(void **)&self->super.viewScale[OBJC_IVAR____TtC8Freeform21CRLCanvasDotGridLayer_dotGridImageStorageCache];
}

@end