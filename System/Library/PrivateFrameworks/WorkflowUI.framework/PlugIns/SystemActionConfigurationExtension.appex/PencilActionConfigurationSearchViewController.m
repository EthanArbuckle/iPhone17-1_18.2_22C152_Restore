@interface PencilActionConfigurationSearchViewController
- (_TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController)initWithCoder:(id)a3;
- (_TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PencilActionConfigurationSearchViewController

- (_TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000D4D0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000D5CC();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10000D910(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10000D9C0();
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  sub_100015080();
  id v6 = a3;
  v7 = self;
  sub_10000DD9C();

  swift_bridgeObjectRelease();
}

- (_TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_100015080();
  }
  id v5 = a4;
  sub_10000DE7C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_searchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_navigationBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewBottomConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewWidthConstraint);
}

@end