@interface CanvasAssetDeleteView
- (_TtC7Journal21CanvasAssetDeleteView)initWithCoder:(id)a3;
- (_TtC7Journal21CanvasAssetDeleteView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tapAction:(id)a3;
@end

@implementation CanvasAssetDeleteView

- (_TtC7Journal21CanvasAssetDeleteView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal21CanvasAssetDeleteView *)sub_10004AF1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal21CanvasAssetDeleteView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10004CF78();
}

- (void)tapAction:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10004B74C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal21CanvasAssetDeleteView_circularPlatter));

  swift_release();
}

@end