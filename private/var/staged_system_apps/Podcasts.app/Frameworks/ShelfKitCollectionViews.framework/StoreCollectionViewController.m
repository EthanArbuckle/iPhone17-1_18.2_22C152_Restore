@interface StoreCollectionViewController
- (_TtC23ShelfKitCollectionViews29StoreCollectionViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews29StoreCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC23ShelfKitCollectionViews29StoreCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)applicationDidBecomeActive:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation StoreCollectionViewController

- (_TtC23ShelfKitCollectionViews29StoreCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  return (_TtC23ShelfKitCollectionViews29StoreCollectionViewController *)sub_154968(a3);
}

- (_TtC23ShelfKitCollectionViews29StoreCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_155CB4();
}

- (void)loadView
{
  v2 = self;
  sub_154A98();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_154D88();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_155444(a3, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_154F9C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1551B8(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_155444(a3, (SEL *)&selRef_viewDidDisappear_);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_15555C();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(StoreCollectionViewController *)v2 traitCollection];
  v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_15580C();
}

- (void)appExitedWhileAppeared
{
  v2 = self;
  sub_15585C();
}

- (void)applicationDidBecomeActive:(id)a3
{
  v4 = (_TtC23ShelfKitCollectionViews29StoreCollectionViewController *)a3;
  v7 = self;
  v5 = (_TtC23ShelfKitCollectionViews29StoreCollectionViewController *)[(StoreCollectionViewController *)v7 collectionView];
  if (v5)
  {
    v6 = v5;
    [(StoreCollectionViewController *)v5 selectItemAtIndexPath:0 animated:1 scrollPosition:0];

    v4 = v7;
    v7 = v6;
  }
}

- (_TtC23ShelfKitCollectionViews29StoreCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_155C54((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews29StoreCollectionViewController_lifecycleObserver);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29StoreCollectionViewController_statusBarBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29StoreCollectionViewController_overlayViewController));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end