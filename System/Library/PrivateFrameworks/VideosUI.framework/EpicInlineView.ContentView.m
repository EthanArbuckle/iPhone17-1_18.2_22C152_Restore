@interface EpicInlineView.ContentView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtCC8VideosUI14EpicInlineView11ContentView)initWithCoder:(id)a3;
- (_TtCC8VideosUI14EpicInlineView11ContentView)initWithFrame:(CGRect)a3;
@end

@implementation EpicInlineView.ContentView

- (_TtCC8VideosUI14EpicInlineView11ContentView)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI14EpicInlineView11ContentView *)sub_1E3816DBC();
}

- (_TtCC8VideosUI14EpicInlineView11ContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E381731C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1E3817490(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_mainGradientColor));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_hostMediaController));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_didHostMediaController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_backgroundMediaController));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_logoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_channelLogoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_epicBannerView));
  swift_weakDestroy();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView____lazy_storage___logoGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView____lazy_storage___gradientContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView____lazy_storage___gradientLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC8VideosUI14EpicInlineView11ContentView_opacityMaskLayer);
}

@end