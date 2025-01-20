@interface PaletteVisualEffectView
- (_TtC12NowPlayingUI23PaletteVisualEffectView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI23PaletteVisualEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PaletteVisualEffectView

- (_TtC12NowPlayingUI23PaletteVisualEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI23PaletteVisualEffectView *)sub_8F870(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI23PaletteVisualEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_91214();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_8FBFC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI23PaletteVisualEffectView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI23PaletteVisualEffectView_contentView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI23PaletteVisualEffectView_separator);
}

@end