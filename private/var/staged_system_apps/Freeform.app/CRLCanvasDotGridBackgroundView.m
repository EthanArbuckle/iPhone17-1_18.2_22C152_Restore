@interface CRLCanvasDotGridBackgroundView
+ (Class)layerClass;
- (_TtC8Freeform30CRLCanvasDotGridBackgroundView)initWithCoder:(id)a3;
- (_TtC8Freeform30CRLCanvasDotGridBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation CRLCanvasDotGridBackgroundView

+ (Class)layerClass
{
  type metadata accessor for CRLCanvasDotGridLayer();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8Freeform30CRLCanvasDotGridBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLCanvasDotGridBackgroundView();
  return -[CRLCanvasBackgroundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform30CRLCanvasDotGridBackgroundView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLCanvasDotGridBackgroundView();
  return [(CRLCanvasBackgroundView *)&v5 initWithCoder:a3];
}

@end