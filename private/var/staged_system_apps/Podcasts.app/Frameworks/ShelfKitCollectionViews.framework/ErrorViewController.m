@interface ErrorViewController
- (_TtC23ShelfKitCollectionViews19ErrorViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
@end

@implementation ErrorViewController

- (_TtC23ShelfKitCollectionViews19ErrorViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19ErrorViewController_previouslySelectedTab;
  *(void *)v4 = 0;
  v4[8] = 1;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews19ErrorViewController *)sub_385890();
  __break(1u);
  return result;
}

- (void)loadView
{
  v4 = self;
  if ([(ErrorViewController *)v4 isViewLoaded])
  {
    v2 = v4;
  }
  else
  {
    v3 = [_TtC23ShelfKitCollectionViews19ErrorViewController alloc] initWithFrame:0.0, 0.0, 0.0, 0.0];
    [(ErrorViewController *)v4 setView:v3];

    v2 = v3;
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(ErrorViewController *)v2 traitCollection];
  v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (_TtC23ShelfKitCollectionViews19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews19ErrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19ErrorViewController_reachabilityType;
  uint64_t v3 = sub_380A70();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end