@interface SketchSurfaceHistory
- (_TtC7Measure20SketchSurfaceHistory)initWithCoder:(id)a3;
- (_TtC7Measure20SketchSurfaceHistory)initWithFrame:(CGRect)a3;
@end

@implementation SketchSurfaceHistory

- (_TtC7Measure20SketchSurfaceHistory)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC7Measure20SketchSurfaceHistory_surfaceView;
  id v9 = objc_allocWithZone((Class)UIView);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 initWithFrame:0.0, 0.0, 0.0, 0.0];

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for SketchSurfaceHistory();
  return -[SketchSurfaceHistory initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure20SketchSurfaceHistory)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Measure20SketchSurfaceHistory_surfaceView;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SketchSurfaceHistory();
  id v9 = [(SketchSurfaceHistory *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
}

@end