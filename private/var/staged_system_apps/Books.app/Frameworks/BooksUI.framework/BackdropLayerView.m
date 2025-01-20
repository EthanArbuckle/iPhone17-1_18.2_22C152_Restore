@interface BackdropLayerView
+ (Class)layerClass;
- (_TtC7BooksUIP33_F34AF1168BE2E2E994641C4890A808CD17BackdropLayerView)init;
- (_TtC7BooksUIP33_F34AF1168BE2E2E994641C4890A808CD17BackdropLayerView)initWithCoder:(id)a3;
- (_TtC7BooksUIP33_F34AF1168BE2E2E994641C4890A808CD17BackdropLayerView)initWithFrame:(CGRect)a3;
@end

@implementation BackdropLayerView

- (_TtC7BooksUIP33_F34AF1168BE2E2E994641C4890A808CD17BackdropLayerView)init
{
  return -[BackdropLayerView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

+ (Class)layerClass
{
  sub_1263C(0, (unint64_t *)&qword_2EDC10);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC7BooksUIP33_F34AF1168BE2E2E994641C4890A808CD17BackdropLayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BackdropLayerView();
  return -[BackdropLayerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7BooksUIP33_F34AF1168BE2E2E994641C4890A808CD17BackdropLayerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BackdropLayerView();
  return [(BackdropLayerView *)&v5 initWithCoder:a3];
}

@end