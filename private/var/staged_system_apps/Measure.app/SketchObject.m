@interface SketchObject
- (_TtC7Measure12SketchObject)initWithCoder:(id)a3;
- (_TtC7Measure12SketchObject)initWithFrame:(CGRect)a3;
@end

@implementation SketchObject

- (_TtC7Measure12SketchObject)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_topSurface) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_longSideSurface) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_shortSideSurface) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_backgroundLines) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_foregroundLines) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SketchObject();
  return -[SketchObject initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure12SketchObject)initWithCoder:(id)a3
{
  return (_TtC7Measure12SketchObject *)sub_10020BD54(a3);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12SketchObject_foregroundLines);
}

@end