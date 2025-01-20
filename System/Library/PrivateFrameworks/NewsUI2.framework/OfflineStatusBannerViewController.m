@interface OfflineStatusBannerViewController
- (_TtC7NewsUI233OfflineStatusBannerViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI233OfflineStatusBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)alertForSetUpOfflineMode;
- (void)triggerForceReloadFeeds;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation OfflineStatusBannerViewController

- (_TtC7NewsUI233OfflineStatusBannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF69F278();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF69E5FC();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1DF69E8C4();
}

- (void)triggerForceReloadFeeds
{
  v2 = self;
  sub_1DF69EC90();
}

- (void)alertForSetUpOfflineMode
{
  v2 = self;
  sub_1DF69EEF0();
}

- (_TtC7NewsUI233OfflineStatusBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI233OfflineStatusBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController_styler);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController_connectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController____lazy_storage___forceReloadButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController____lazy_storage___setupOfflineModeButton);
}

@end