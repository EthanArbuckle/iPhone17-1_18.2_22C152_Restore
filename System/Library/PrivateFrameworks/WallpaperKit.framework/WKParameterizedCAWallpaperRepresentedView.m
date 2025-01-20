@interface WKParameterizedCAWallpaperRepresentedView
- (_TtC12WallpaperKit41WKParameterizedCAWallpaperRepresentedView)initWithCoder:(id)a3;
- (_TtC12WallpaperKit41WKParameterizedCAWallpaperRepresentedView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WKParameterizedCAWallpaperRepresentedView

- (_TtC12WallpaperKit41WKParameterizedCAWallpaperRepresentedView)initWithFrame:(CGRect)a3
{
}

- (_TtC12WallpaperKit41WKParameterizedCAWallpaperRepresentedView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BE164448();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BE1638E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12WallpaperKit41WKParameterizedCAWallpaperRepresentedView_hostingLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12WallpaperKit41WKParameterizedCAWallpaperRepresentedView_background));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12WallpaperKit41WKParameterizedCAWallpaperRepresentedView_floating));
  swift_bridgeObjectRelease();
}

@end