@interface BannerViewCellController
- (_TtC8VideosUI24BannerViewCellController)init;
- (_TtC8VideosUI24BannerViewCellController)initWithCoder:(id)a3;
- (_TtC8VideosUI24BannerViewCellController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)vui_loadView;
- (void)vui_viewWillAppear:(BOOL)a3;
@end

@implementation BannerViewCellController

- (_TtC8VideosUI24BannerViewCellController)init
{
  return (_TtC8VideosUI24BannerViewCellController *)sub_1E30F1254();
}

- (void)vui_loadView
{
  v2 = self;
  sub_1E30F12E0();
}

- (_TtC8VideosUI24BannerViewCellController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E30F13B0();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1E30F1454(a3);
}

- (_TtC8VideosUI24BannerViewCellController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E30F14F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24BannerViewCellController_bannerViewCell));
  swift_release();
}

@end