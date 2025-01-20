@interface PencilActionConfigurationViewController
- (CGSize)preferredContentSize;
- (_TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController)initWithCoder:(id)a3;
- (_TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PencilActionConfigurationViewController

- (_TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000031CC();
}

- (void)loadView
{
  v2 = self;
  sub_100003310();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000403C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100004458();
}

- (CGSize)preferredContentSize
{
  v2 = self;
  double v3 = sub_1000045A4();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_100015080();
  }
  id v5 = a4;
  sub_100004A1C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_searchViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_sidebarViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_galleryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_contentUnavailableView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___galleryWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___sidebarWidthConstraint));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___searchBarHeightConstraint);
}

@end