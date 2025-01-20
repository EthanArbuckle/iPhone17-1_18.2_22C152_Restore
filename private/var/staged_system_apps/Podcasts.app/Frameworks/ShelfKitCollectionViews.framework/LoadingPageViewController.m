@interface LoadingPageViewController
- (_TtC23ShelfKitCollectionViews25LoadingPageViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation LoadingPageViewController

- (_TtC23ShelfKitCollectionViews25LoadingPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2F6E20();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2F5068();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_2F51C8();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(LoadingPageViewController *)v2 traitCollection];
  v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (_TtC23ShelfKitCollectionViews25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews25LoadingPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25LoadingPageViewController_contentViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews25LoadingPageViewController_overlayViewController);
}

@end