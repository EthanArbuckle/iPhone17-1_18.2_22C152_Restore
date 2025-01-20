@interface CRLCanvasBackgroundView
+ (Class)layerClass;
- (_TtC8Freeform23CRLCanvasBackgroundView)initWithCoder:(id)a3;
- (_TtC8Freeform23CRLCanvasBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation CRLCanvasBackgroundView

- (_TtC8Freeform23CRLCanvasBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLCanvasBackgroundView();
  return -[CRLCanvasBackgroundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform23CRLCanvasBackgroundView)initWithCoder:(id)a3
{
  result = (_TtC8Freeform23CRLCanvasBackgroundView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  type metadata accessor for CRLCanvasBackgroundLayer();

  return (Class)swift_getObjCClassFromMetadata();
}

@end