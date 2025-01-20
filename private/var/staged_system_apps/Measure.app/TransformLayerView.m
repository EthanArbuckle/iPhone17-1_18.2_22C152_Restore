@interface TransformLayerView
+ (Class)layerClass;
- (_TtC7Measure18TransformLayerView)initWithCoder:(id)a3;
- (_TtC7Measure18TransformLayerView)initWithFrame:(CGRect)a3;
@end

@implementation TransformLayerView

+ (Class)layerClass
{
  sub_1001FB6D4();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC7Measure18TransformLayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TransformLayerView();
  return -[TransformLayerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure18TransformLayerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TransformLayerView();
  return [(TransformLayerView *)&v5 initWithCoder:a3];
}

@end