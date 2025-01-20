@interface CanvasAssetView
- (_TtC7Journal15CanvasAssetView)initWithCoder:(id)a3;
- (_TtC7Journal15CanvasAssetView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CanvasAssetView

- (_TtC7Journal15CanvasAssetView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasAssetView_currentSizeType) = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasAssetView_journalAsset) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasAssetView_journalAssetView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CanvasAssetView();
  v7 = -[CanvasAssetView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  [(CanvasAssetView *)v7 setContentMode:2];
  [(CanvasAssetView *)v7 setClipsToBounds:1];

  return v7;
}

- (_TtC7Journal15CanvasAssetView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasAssetView_currentSizeType) = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasAssetView_journalAsset) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasAssetView_journalAssetView) = 0;
  id v4 = a3;

  result = (_TtC7Journal15CanvasAssetView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100338CEC();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasAssetView_journalAssetView);
}

@end