@interface CatalogProgramDetailViewController
- (_TtC9SeymourUI34CatalogProgramDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI34CatalogProgramDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)moreOptionsButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CatalogProgramDetailViewController

- (_TtC9SeymourUI34CatalogProgramDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A7075DC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A705914();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_23A705AB8(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogProgramDetailViewController();
  v4 = (char *)v7.receiver;
  [(CatalogProgramDetailViewController *)&v7 viewIsAppearing:v3];
  objc_msgSend(*(id *)(*(void *)(*(void *)&v4[OBJC_IVAR____TtC9SeymourUI34CatalogProgramDetailViewController_dataProvider]+ OBJC_IVAR____TtC9SeymourUI30CatalogProgramPageDataProvider_page)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_23A532D68(v5, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A705D4C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A70606C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogProgramDetailViewController();
  id v4 = v7.receiver;
  [(CatalogProgramDetailViewController *)&v7 viewDidDisappear:v3];
  sub_23A707B9C(&qword_268A1E780, v5, (void (*)(uint64_t))type metadata accessor for CatalogProgramDetailViewController);
  sub_23A707B9C(&qword_268A1E788, v6, (void (*)(uint64_t))type metadata accessor for CatalogProgramDetailViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CatalogProgramDetailViewController();
  v2 = (char *)v10.receiver;
  [(CatalogProgramDetailViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI34CatalogProgramDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI30CatalogProgramPageDataProvider_page);
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
  sub_23A706748();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC9SeymourUI34CatalogProgramDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI34CatalogProgramDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogProgramDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogProgramDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34CatalogProgramDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34CatalogProgramDetailViewController_upNextQueueButton));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34CatalogProgramDetailViewController_standardNavigationBarTintColor));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI34CatalogProgramDetailViewController_currentNavigationBarTintColor);
}

@end