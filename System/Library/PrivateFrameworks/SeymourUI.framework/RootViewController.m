@interface RootViewController
- (_TtC9SeymourUI18RootViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI18RootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)accountButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RootViewController

- (_TtC9SeymourUI18RootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A53D744();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A5358D8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_23A535BF0(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RootViewController();
  v4 = (char *)v7.receiver;
  [(RootViewController *)&v7 viewIsAppearing:v3];
  objc_msgSend(*(id *)(*(void *)(*(void *)&v4[OBJC_IVAR____TtC9SeymourUI18RootViewController_dataProvider] + 48)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_23A532634(v5, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A535EDC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A536288(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  v4 = v5.receiver;
  [(RootViewController *)&v5 viewDidDisappear:v3];
  v4[OBJC_IVAR____TtC9SeymourUI18RootViewController_engagementPresentability] = 2;
  sub_23A53DCE4(&qword_268A1C178, (void (*)(uint64_t))type metadata accessor for RootViewController);
  sub_23A53DCE4((unint64_t *)&unk_268A1C180, (void (*)(uint64_t))type metadata accessor for RootViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RootViewController();
  v2 = (char *)v10.receiver;
  [(RootViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI18RootViewController_dataProvider] + 48);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  objc_super v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  sub_23A536690((uint64_t)a4, width, height);

  swift_unknownObjectRelease();
}

- (void)accountButtonTapped:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_23A5335CC();
}

- (_TtC9SeymourUI18RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI18RootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_avatarSettingsProvider);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_catalogClient);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_engagementPresentationCoordinator);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_marketingMessageViewControllerHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_marketingMetricFieldsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_storefrontLocalizer);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_upNextQueueClient);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_dynamicOfferCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_webUserInterfaceCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_accountButton));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_largeTitleUpNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_upNextQueueButton));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI18RootViewController__lastWorkoutPlanTapToRadarAlertTimestamp;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A14408);
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end