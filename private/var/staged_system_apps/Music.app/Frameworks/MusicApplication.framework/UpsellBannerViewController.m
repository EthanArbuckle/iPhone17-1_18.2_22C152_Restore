@interface UpsellBannerViewController
- (_TtC16MusicApplication26UpsellBannerViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication26UpsellBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation UpsellBannerViewController

- (_TtC16MusicApplication26UpsellBannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2000DC();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1FD53C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  v5 = (char *)v10.receiver;
  [(UpsellBannerViewController *)&v10 traitCollectionDidChange:v4];
  uint64_t v6 = *(void *)&v5[OBJC_IVAR____TtC16MusicApplication26UpsellBannerViewController_textDrawingCache];
  id v7 = [v5 traitCollection];
  [v7 displayScale];
  uint64_t v9 = v8;

  swift_beginAccess();
  *(void *)(v6 + 16) = v9;
  sub_11F438();
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1FD78C((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (_TtC16MusicApplication26UpsellBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication26UpsellBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26UpsellBannerViewController_bannerView));
  swift_release();

  swift_unknownObjectWeakDestroy();
}

@end