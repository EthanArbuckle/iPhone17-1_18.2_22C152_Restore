@interface SketchSurface
- (_TtC7Measure13SketchSurface)initWithCoder:(id)a3;
- (_TtC7Measure13SketchSurface)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SketchSurface

- (void)layoutSubviews
{
  v2 = self;
  sub_100050868();
}

- (_TtC7Measure13SketchSurface)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC7Measure13SketchSurface_surfaceView;
  id v9 = objc_allocWithZone((Class)UIView);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 init];
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Measure13SketchSurface_rectSublayer) = 0;
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Measure13SketchSurface_horizontalLineSublayer) = 0;
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Measure13SketchSurface_verticalLineSublayer) = 0;
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Measure13SketchSurface_dotLayers) = (Class)_swiftEmptyArrayStorage;

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for SketchSurface();
  return -[SketchSurface initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure13SketchSurface)initWithCoder:(id)a3
{
  return (_TtC7Measure13SketchSurface *)sub_100050F88(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure13SketchSurface_horizontalLineSublayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure13SketchSurface_verticalLineSublayer));

  swift_bridgeObjectRelease();
}

@end