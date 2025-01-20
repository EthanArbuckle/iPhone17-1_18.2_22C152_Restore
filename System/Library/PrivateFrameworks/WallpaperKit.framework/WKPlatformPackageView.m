@interface WKPlatformPackageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12WallpaperKit21WKPlatformPackageView)initWithCoder:(id)a3;
- (_TtC12WallpaperKit21WKPlatformPackageView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WKPlatformPackageView

- (_TtC12WallpaperKit21WKPlatformPackageView)initWithFrame:(CGRect)a3
{
  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_originalSize);
  void *v3 = 0;
  v3[1] = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_currentScaleEffect) = _Q0;

  result = (_TtC12WallpaperKit21WKPlatformPackageView *)sub_1BE1CF890();
  __break(1u);
  return result;
}

- (_TtC12WallpaperKit21WKPlatformPackageView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_originalSize);
  void *v4 = 0;
  v4[1] = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_currentScaleEffect) = _Q0;
  id v10 = a3;

  result = (_TtC12WallpaperKit21WKPlatformPackageView *)sub_1BE1CF890();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  float64x2_t v3 = vmulq_f64(*(float64x2_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_originalSize), *(float64x2_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_currentScaleEffect));
  double v4 = v3.f64[1];
  result.width = v3.f64[0];
  result.height = v4;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1BE1A0E30(x, y, width, height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BE1A1DAC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_package));
}

@end