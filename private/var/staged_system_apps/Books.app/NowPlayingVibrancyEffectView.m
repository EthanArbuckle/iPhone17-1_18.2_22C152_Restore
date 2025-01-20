@interface NowPlayingVibrancyEffectView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5Books28NowPlayingVibrancyEffectView)initWithCoder:(id)a3;
- (_TtC5Books28NowPlayingVibrancyEffectView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation NowPlayingVibrancyEffectView

- (_TtC5Books28NowPlayingVibrancyEffectView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_vibrancyState) = 1;
  id v4 = a3;

  result = (_TtC5Books28NowPlayingVibrancyEffectView *)sub_1007FF260();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_contentItemView) sizeThatFits:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_contentItemView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NowPlayingVibrancyEffectView();
  double v2 = (char *)v4.receiver;
  [(NowPlayingVibrancyEffectView *)&v4 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_contentItemView];
  [v2 bounds];
  [v3 setFrame:];
}

- (_TtC5Books28NowPlayingVibrancyEffectView)initWithEffect:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC5Books28NowPlayingVibrancyEffectView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books28NowPlayingVibrancyEffectView_contentItemView));
}

@end