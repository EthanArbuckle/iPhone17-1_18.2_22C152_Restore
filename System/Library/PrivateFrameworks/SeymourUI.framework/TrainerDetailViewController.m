@interface TrainerDetailViewController
- (_TtC9SeymourUI27TrainerDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI27TrainerDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

@implementation TrainerDetailViewController

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_currentStatusBarStyle);
}

- (_TtC9SeymourUI27TrainerDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F4CD6C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239F4AEC0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_239F4B064(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TrainerDetailViewController();
  v4 = (char *)v7.receiver;
  [(TrainerDetailViewController *)&v7 viewIsAppearing:v3];
  objc_msgSend(*(id *)(*(void *)(*(void *)&v4[OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_dataProvider]+ OBJC_IVAR____TtC9SeymourUI23TrainerPageDataProvider_page)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_23A531E84(v5, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_239F4B2F8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_239F4B614(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TrainerDetailViewController();
  id v4 = v7.receiver;
  [(TrainerDetailViewController *)&v7 viewDidDisappear:v3];
  sub_239F4CE64(&qword_268A13788, v5, (void (*)(uint64_t))type metadata accessor for TrainerDetailViewController);
  sub_239F4CE64(&qword_268A13790, v6, (void (*)(uint64_t))type metadata accessor for TrainerDetailViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TrainerDetailViewController();
  v2 = (char *)v10.receiver;
  [(TrainerDetailViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI23TrainerPageDataProvider_page);
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
  sub_239F4BCF0();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC9SeymourUI27TrainerDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI27TrainerDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_pageNavigator);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_standardNavigationBarTintColor));
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_currentNavigationBarTintColor);
}

@end