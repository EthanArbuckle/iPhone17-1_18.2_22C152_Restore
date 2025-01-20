@interface RootSplitViewController
- (_TtC23ShelfKitCollectionViews23RootSplitViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23RootSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC23ShelfKitCollectionViews23RootSplitViewController)initWithStyle:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation RootSplitViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1ADEC4();
}

- (_TtC23ShelfKitCollectionViews23RootSplitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B8A8C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF370(a3);
}

- (_TtC23ShelfKitCollectionViews23RootSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews23RootSplitViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews23RootSplitViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC23ShelfKitCollectionViews23RootSplitViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_menuController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_rootTabBarController));
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_searchSuggestionsController, &qword_479D30);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController_flowController, &qword_473850);
  id v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController__interfaceMode;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_479D00);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews23RootSplitViewController____lazy_storage___loadingViewController);
}

@end