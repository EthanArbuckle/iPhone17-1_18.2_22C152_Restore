@interface FrozenSnapshotView
- (CGSize)intrinsicContentSize;
- (_TtC5Books18FrozenSnapshotView)initWithCoder:(id)a3;
- (_TtC5Books18FrozenSnapshotView)initWithFrame:(CGRect)a3;
@end

@implementation FrozenSnapshotView

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18FrozenSnapshotView_childView);
  if (v2)
  {
    [v2 frame];
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    double v6 = 480.0;
    double v4 = 320.0;
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (_TtC5Books18FrozenSnapshotView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18FrozenSnapshotView_childView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FrozenSnapshotView();
  return -[FrozenSnapshotView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books18FrozenSnapshotView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18FrozenSnapshotView_childView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FrozenSnapshotView();
  return [(FrozenSnapshotView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end