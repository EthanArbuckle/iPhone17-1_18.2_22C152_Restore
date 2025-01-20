@interface NowPlayingScrollingTipView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12NowPlayingUI26NowPlayingScrollingTipView)init;
- (_TtC12NowPlayingUI26NowPlayingScrollingTipView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI26NowPlayingScrollingTipView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NowPlayingScrollingTipView

- (_TtC12NowPlayingUI26NowPlayingScrollingTipView)init
{
  return (_TtC12NowPlayingUI26NowPlayingScrollingTipView *)sub_A1F4C();
}

- (_TtC12NowPlayingUI26NowPlayingScrollingTipView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_A2EF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_A2858();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  [(NowPlayingScrollingTipView *)v5 safeAreaInsets];
  CGFloat v10 = sub_A1CAC(width, height, v6, v7, v8, v9);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (_TtC12NowPlayingUI26NowPlayingScrollingTipView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC12NowPlayingUI26NowPlayingScrollingTipView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_FB70(*(uint64_t *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_doneButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_visualEffectView));

  swift_release();
}

@end