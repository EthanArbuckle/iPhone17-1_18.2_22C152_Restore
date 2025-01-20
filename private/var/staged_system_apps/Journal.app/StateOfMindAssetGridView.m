@interface StateOfMindAssetGridView
- (_TtC7Journal24StateOfMindAssetGridView)initWithCoder:(id)a3;
- (_TtC7Journal24StateOfMindAssetGridView)initWithFrame:(CGRect)a3;
@end

@implementation StateOfMindAssetGridView

- (_TtC7Journal24StateOfMindAssetGridView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Journal24StateOfMindAssetGridView_previousSizeType) = 6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for StateOfMindAssetGridView();
  return -[StateOfMindAssetView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Journal24StateOfMindAssetGridView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Journal24StateOfMindAssetGridView_previousSizeType) = 6;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StateOfMindAssetGridView();
  return [(StateOfMindAssetView *)&v5 initWithCoder:a3];
}

@end