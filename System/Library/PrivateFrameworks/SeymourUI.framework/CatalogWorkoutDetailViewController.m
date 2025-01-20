@interface CatalogWorkoutDetailViewController
- (_TtC9SeymourUI34CatalogWorkoutDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI34CatalogWorkoutDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)moreOptionsButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CatalogWorkoutDetailViewController

- (_TtC9SeymourUI34CatalogWorkoutDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A5B8D54();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A5B6574();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_23A5B6818(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogWorkoutDetailViewController();
  v4 = (char *)v7.receiver;
  [(CatalogWorkoutDetailViewController *)&v7 viewIsAppearing:v3];
  objc_msgSend(*(id *)(*(void *)(*(void *)&v4[OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_dataProvider]+ OBJC_IVAR____TtC9SeymourUI30CatalogWorkoutPageDataProvider_page)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_23A532CF8(v5, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A5B6AAC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogWorkoutDetailViewController();
  id v4 = v7.receiver;
  [(CatalogWorkoutDetailViewController *)&v7 viewDidDisappear:v3];
  sub_23A5B8D04((unint64_t *)&unk_268A1CB28, v5, (void (*)(uint64_t))type metadata accessor for CatalogWorkoutDetailViewController);
  sub_23A5B8D04((unint64_t *)&unk_268A1CB40, v6, (void (*)(uint64_t))type metadata accessor for CatalogWorkoutDetailViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CatalogWorkoutDetailViewController();
  v2 = (char *)v10.receiver;
  [(CatalogWorkoutDetailViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI30CatalogWorkoutPageDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  uint64_t v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_23A5B6F60(a3);
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
  sub_23A650AE4((void (*)(uint64_t))sub_23A5B8CFC, v5);

  swift_release_n();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (_TtC9SeymourUI34CatalogWorkoutDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI34CatalogWorkoutDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_accountProvider);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_dynamicOfferCoordinator));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_marketingMessageViewControllerHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_marketingMetricFieldsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_marketingSubscriptionStatusProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_networkEvaluator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_pageNavigator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_purchaseHandler));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_webUserInterfaceCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_standardNavigationBarTintColor));
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI34CatalogWorkoutDetailViewController_currentNavigationBarTintColor);
}

@end