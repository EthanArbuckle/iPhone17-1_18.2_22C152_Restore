@interface MotionActivityGridView
- (_TtC7Journal22MotionActivityGridView)initWithCoder:(id)a3;
- (_TtC7Journal22MotionActivityGridView)initWithFrame:(CGRect)a3;
@end

@implementation MotionActivityGridView

- (_TtC7Journal22MotionActivityGridView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Journal22MotionActivityGridView_previousSizeType) = 6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MotionActivityGridView();
  return -[MotionActivityAssetView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Journal22MotionActivityGridView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Journal22MotionActivityGridView_previousSizeType) = 6;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MotionActivityGridView();
  return [(MotionActivityAssetView *)&v5 initWithCoder:a3];
}

@end