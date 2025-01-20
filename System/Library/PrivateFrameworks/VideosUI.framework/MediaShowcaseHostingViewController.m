@interface MediaShowcaseHostingViewController
- (_TtC8VideosUI34MediaShowcaseHostingViewController)init;
- (_TtC8VideosUI34MediaShowcaseHostingViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI34MediaShowcaseHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)vui_loadView;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewWillDisappear:(BOOL)a3;
@end

@implementation MediaShowcaseHostingViewController

- (_TtC8VideosUI34MediaShowcaseHostingViewController)init
{
  sub_1E30A3028();
  return result;
}

- (_TtC8VideosUI34MediaShowcaseHostingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E30A321C();
}

- (void)vui_loadView
{
  v2 = self;
  sub_1E30A33BC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E30A3544();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E30A3DD0();
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E30A4A64(v4);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E30A4B78(v4);
}

- (_TtC8VideosUI34MediaShowcaseHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E30A4EF8();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1E2BEA418((uint64_t)self + OBJC_IVAR____TtC8VideosUI34MediaShowcaseHostingViewController_collectionImpressioner, &qword_1EBF8B120);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34MediaShowcaseHostingViewController____lazy_storage___paginatedMediaController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34MediaShowcaseHostingViewController____lazy_storage___toolBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34MediaShowcaseHostingViewController_hideMuteButtonTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34MediaShowcaseHostingViewController____lazy_storage___mediaShowcaseConfig));
  swift_release();
}

@end