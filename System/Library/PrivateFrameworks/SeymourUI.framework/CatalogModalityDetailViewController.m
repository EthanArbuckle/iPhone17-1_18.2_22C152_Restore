@interface CatalogModalityDetailViewController
- (_TtC9SeymourUI35CatalogModalityDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI35CatalogModalityDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)moreOptionsButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CatalogModalityDetailViewController

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_currentStatusBarStyle);
}

- (_TtC9SeymourUI35CatalogModalityDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A655E44();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A6539AC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_23A653AB4(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogModalityDetailViewController();
  v4 = (char *)v7.receiver;
  [(CatalogModalityDetailViewController *)&v7 viewIsAppearing:v3];
  objc_msgSend(*(id *)(*(void *)(*(void *)&v4[OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_dataProvider]+ OBJC_IVAR____TtC9SeymourUI31CatalogModalityPageDataProvider_page)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_23A532D30(v5, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A653D48(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A654064(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogModalityDetailViewController();
  id v4 = v7.receiver;
  [(CatalogModalityDetailViewController *)&v7 viewDidDisappear:v3];
  sub_23A65511C(&qword_268A1D960, v5, (void (*)(uint64_t))type metadata accessor for CatalogModalityDetailViewController);
  sub_23A65511C(&qword_268A1D968, v6, (void (*)(uint64_t))type metadata accessor for CatalogModalityDetailViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CatalogModalityDetailViewController();
  v2 = (char *)v10.receiver;
  [(CatalogModalityDetailViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI31CatalogModalityPageDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  uint64_t v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)moreOptionsButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_23A8009F8();
  swift_unknownObjectRelease();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_23A650D5C((void (*)(uint64_t))sub_23A655E30, v5);

  swift_release_n();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (_TtC9SeymourUI35CatalogModalityDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI35CatalogModalityDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_marketingMessageViewControllerHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_pageNavigator);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_serviceSubscriptionCache);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_standardNavigationBarTintColor));
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_currentNavigationBarTintColor);
}

@end