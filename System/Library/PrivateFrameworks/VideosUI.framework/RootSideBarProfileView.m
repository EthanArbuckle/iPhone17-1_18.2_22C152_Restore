@interface RootSideBarProfileView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI22RootSideBarProfileView)initWithCoder:(id)a3;
- (_TtC8VideosUI22RootSideBarProfileView)initWithFrame:(CGRect)a3;
- (void)accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)handleTap:(id)a3;
@end

@implementation RootSideBarProfileView

- (_TtC8VideosUI22RootSideBarProfileView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI22RootSideBarProfileView *)sub_1E3023358();
}

- (_TtC8VideosUI22RootSideBarProfileView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3023CEC();
}

- (void)dealloc
{
  v2 = self;
  sub_1E3023D98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22RootSideBarProfileView____lazy_storage___titleLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22RootSideBarProfileView____lazy_storage___subtitleLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22RootSideBarProfileView_imageView));
  swift_release();
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI22RootSideBarProfileView_contentChangeHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  sub_1E3023EB4(a4, width);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E30243C0();
}

- (void)accountStoreDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E3024578();
}

@end