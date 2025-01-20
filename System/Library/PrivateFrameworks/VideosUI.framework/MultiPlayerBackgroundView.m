@interface MultiPlayerBackgroundView
- (_TtC8VideosUI25MultiPlayerBackgroundView)initWithCoder:(id)a3;
- (_TtC8VideosUI25MultiPlayerBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MultiPlayerBackgroundView

- (_TtC8VideosUI25MultiPlayerBackgroundView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E342D11C();
}

- (_TtC8VideosUI25MultiPlayerBackgroundView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerBackgroundView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerBackgroundView____lazy_storage___blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerBackgroundView____lazy_storage___dimmingView));
  swift_release();
}

@end