@interface TVUpNextQueueListViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI31TVUpNextQueueListViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI31TVUpNextQueueListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleBackButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TVUpNextQueueListViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_dataProvider);
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v5 = *(void **)(*(void *)(v4 + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_page)
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(void *)(v3 + 32) = v5;
  sub_23A7FFC98();
  id v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v7 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v7;
}

- (_TtC9SeymourUI31TVUpNextQueueListViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A07A7D8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A079480();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVUpNextQueueListViewController();
  id v4 = v5.receiver;
  [(TVUpNextQueueListViewController *)&v5 viewDidAppear:v3];
  sub_23A07A794(&qword_268A152B0);
  sub_23A7FC148();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_23A7F67C8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  QueueListViewController = (objc_class *)type metadata accessor for TVUpNextQueueListViewController();
  v12.receiver = self;
  v12.super_class = QueueListViewController;
  v10 = self;
  [(TVUpNextQueueListViewController *)&v12 viewWillDisappear:v3];
  v11[1] = v10;
  sub_23A7F67B8();
  sub_23A07A794(&qword_268A152A8);
  sub_23A7FC748();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVUpNextQueueListViewController();
  id v2 = v3.receiver;
  [(TVUpNextQueueListViewController *)&v3 viewWillLayoutSubviews];
  sub_239E2192C(0);
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TVUpNextQueueListViewController();
  id v2 = (char *)v10.receiver;
  [(TVUpNextQueueListViewController *)&v10 viewDidLayoutSubviews];
  objc_super v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  uint64_t v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)handleBackButtonPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_239EC6E58();
}

- (_TtC9SeymourUI31TVUpNextQueueListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI31TVUpNextQueueListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_dataProvider));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_pageNavigator);
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_dynamicOfferCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_webUserInterfaceCoordinator));
  swift_unknownObjectRelease();
  sub_239C9D7E8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_lastFocusedIndexPath);
  swift_unknownObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_timerProvider;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end