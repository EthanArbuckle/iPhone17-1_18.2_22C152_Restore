@interface TVRootViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI20TVRootViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI20TVRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)handleSignInTapped;
- (void)handleSignOutButtonLongPress;
- (void)handleSignOutTapped;
- (void)handleUpNextQueueButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVRootViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(void **)((*(void **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_dataProvider))[6]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI20TVRootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A1B54D8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A1AE72C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVRootViewController();
  v4 = v5.receiver;
  [(TVRootViewController *)&v5 viewWillAppear:v3];
  v4[OBJC_IVAR____TtC9SeymourUI20TVRootViewController_engagementPresentability] = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A1AE908(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A1AF1EC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVRootViewController();
  v4 = v5.receiver;
  [(TVRootViewController *)&v5 viewDidDisappear:v3];
  v4[OBJC_IVAR____TtC9SeymourUI20TVRootViewController_engagementPresentability] = 2;
  sub_23A1B58D8(&qword_268A16B30, (void (*)(uint64_t))type metadata accessor for TVRootViewController);
  sub_23A1B58D8((unint64_t *)&unk_268A16B38, (void (*)(uint64_t))type metadata accessor for TVRootViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TVRootViewController();
  v2 = (char *)v10.receiver;
  [(TVRootViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI20TVRootViewController_dataProvider] + 48);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  objc_super v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_23A1AF5F4((uint64_t)v6, (uint64_t)v7);
}

- (void)handleSignInTapped
{
  v2 = self;
  sub_23A1B1454();
}

- (void)handleSignOutButtonLongPress
{
  v2 = self;
  sub_239F88A04();
}

- (void)handleSignOutTapped
{
  v2 = self;
  sub_23A1B185C();
}

- (void)handleUpNextQueueButton
{
  v2 = self;
  sub_23A1B1D20();
}

- (_TtC9SeymourUI20TVRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI20TVRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_accountProvider);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_contentAvailabilityClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_engagementPresentationCoordinator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_marketingMetricFieldsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_remoteBrowsingSource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_storefrontLocalizer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_timerProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_dynamicOfferCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_webUserInterfaceCoordinator));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_workoutPlanClient);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_lastFocusedIndexPath, &qword_268A0F400);
  swift_unknownObjectRelease();
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_currentPlanIdentifier, &qword_268A0ED70);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_newPlanCellFocusTimer));
  sub_23A1B5800((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_planCompletionTracker, (uint64_t (*)(void))type metadata accessor for PlanCompletionPresentationTracker);
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_menuView);
}

@end