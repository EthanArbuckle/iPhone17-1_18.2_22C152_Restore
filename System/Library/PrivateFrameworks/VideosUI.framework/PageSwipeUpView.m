@interface PageSwipeUpView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI15PageSwipeUpView)initWithCoder:(id)a3;
- (_TtC8VideosUI15PageSwipeUpView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PageSwipeUpView

- (_TtC8VideosUI15PageSwipeUpView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E378EC04();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1E378ED44(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E378EFF8();
}

- (_TtC8VideosUI15PageSwipeUpView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15PageSwipeUpView____lazy_storage___gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15PageSwipeUpView____lazy_storage___swipeUpLabel));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI15PageSwipeUpView____lazy_storage___chevronView);
}

@end