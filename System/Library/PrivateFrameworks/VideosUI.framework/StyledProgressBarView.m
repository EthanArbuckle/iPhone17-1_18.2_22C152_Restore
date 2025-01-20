@interface StyledProgressBarView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI21StyledProgressBarView)initWithCoder:(id)a3;
- (_TtC8VideosUI21StyledProgressBarView)initWithFrame:(CGRect)a3;
- (double)accessibilityProgress;
- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
@end

@implementation StyledProgressBarView

- (_TtC8VideosUI21StyledProgressBarView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI21StyledProgressBarView *)sub_1E3813304();
}

- (_TtC8VideosUI21StyledProgressBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3813A40();
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v7 = a5;
  v8 = self;
  sub_1E3813B0C(a3);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  double v7 = sub_1E3813C5C(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (double)accessibilityProgress
{
  v2 = self;
  sub_1E3814E44();
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_progressBarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_shadowImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_progressTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_gradientStartColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_gradientEndColor));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI21StyledProgressBarView_completeTintColor);
}

@end