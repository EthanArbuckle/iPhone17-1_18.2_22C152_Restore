@interface CanvasPhotosMemoriesBanner
- (_TtC7Journal26CanvasPhotosMemoriesBanner)initWithCoder:(id)a3;
- (_TtC7Journal26CanvasPhotosMemoriesBanner)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CanvasPhotosMemoriesBanner

- (_TtC7Journal26CanvasPhotosMemoriesBanner)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal26CanvasPhotosMemoriesBanner *)sub_1005D3874(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal26CanvasPhotosMemoriesBanner)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005D4C94();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005D3AA0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26CanvasPhotosMemoriesBanner_xPlatterView));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal26CanvasPhotosMemoriesBanner_bannerIcon);
}

@end