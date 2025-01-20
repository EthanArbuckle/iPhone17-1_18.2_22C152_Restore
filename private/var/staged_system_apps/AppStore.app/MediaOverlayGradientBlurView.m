@interface MediaOverlayGradientBlurView
- (_TtC8AppStore28MediaOverlayGradientBlurView)initWithCoder:(id)a3;
- (_TtC8AppStore28MediaOverlayGradientBlurView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation MediaOverlayGradientBlurView

- (_TtC8AppStore28MediaOverlayGradientBlurView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002B6E38();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002B5D68();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  sub_1002B621C();
}

- (_TtC8AppStore28MediaOverlayGradientBlurView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore28MediaOverlayGradientBlurView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_blurGradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_colorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_secondaryColorGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_todayCardStyleColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore28MediaOverlayGradientBlurView_secondaryColor);
}

@end