@interface OverlayProtectionView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI21OverlayProtectionView)init;
- (_TtC8VideosUI21OverlayProtectionView)initWithCoder:(id)a3;
- (_TtC8VideosUI21OverlayProtectionView)initWithFrame:(CGRect)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation OverlayProtectionView

- (_TtC8VideosUI21OverlayProtectionView)init
{
  return (_TtC8VideosUI21OverlayProtectionView *)sub_1E36EC41C();
}

- (_TtC8VideosUI21OverlayProtectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E36EC58C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E36EC648(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  uint64_t v6 = sub_1E387C928();
  uint64_t v8 = v7;
  id v9 = a3;
  double v10 = self;
  id v11 = sub_1E36EC854(v9, v6, v8);

  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC8VideosUI21OverlayProtectionView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_legibilityGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_legibilityBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_legibilityBlurMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_cornerBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_cornerBlurMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView____lazy_storage___legibilityGradientLayerDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView____lazy_storage___legibilityBlurMaskLayerDelegate));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView____lazy_storage___cornerBlurMaskLayerDelegate);
}

@end