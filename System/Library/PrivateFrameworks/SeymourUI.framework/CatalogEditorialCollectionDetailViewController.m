@interface CatalogEditorialCollectionDetailViewController
- (_TtC9SeymourUI46CatalogEditorialCollectionDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI46CatalogEditorialCollectionDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)moreOptionsButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CatalogEditorialCollectionDetailViewController

- (_TtC9SeymourUI46CatalogEditorialCollectionDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A398CF8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A3972BC();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_23A7F6C38();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for CatalogEditorialCollectionDetailViewController();
  v15.receiver = self;
  v15.super_class = v9;
  v10 = self;
  [(CatalogEditorialCollectionDetailViewController *)&v15 viewDidAppear:v3];
  uint64_t v11 = *(uint64_t *)((char *)&v10->super.super.super.isa
                   + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_dataProvider);
  sub_23A61C348();
  v14[1] = v11;
  sub_23A61C550((uint64_t)v8);
  type metadata accessor for CatalogEditorialCollectionPageDataProvider();
  sub_23A398C70(&qword_268A1A298, 255, (void (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionPageDataProvider);
  sub_23A7FC148();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_23A398C70(&qword_268A1A280, v12, (void (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionDetailViewController);
  sub_23A398C70(&qword_268A1A290, v13, (void (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionDetailViewController);
  sub_23A7FC848();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogEditorialCollectionDetailViewController();
  id v4 = v7.receiver;
  [(CatalogEditorialCollectionDetailViewController *)&v7 viewDidDisappear:v3];
  sub_23A398C70(&qword_268A1A280, v5, (void (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionDetailViewController);
  sub_23A398C70(&qword_268A1A290, v6, (void (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionDetailViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CatalogEditorialCollectionDetailViewController();
  v2 = (char *)v10.receiver;
  [(CatalogEditorialCollectionDetailViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_dataProvider]
                + 32);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  uint64_t v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_23A3977CC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_23A3979C4(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogEditorialCollectionDetailViewController();
  id v4 = (char *)v7.receiver;
  [(CatalogEditorialCollectionDetailViewController *)&v7 viewIsAppearing:v3];
  objc_msgSend(*(id *)(*(void *)(*(void *)&v4[OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_dataProvider]+ 32)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_23A531F2C(v5, v6);
}

- (void)moreOptionsButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_23A8009F8();
  swift_unknownObjectRelease();
  sub_23A397F90();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC9SeymourUI46CatalogEditorialCollectionDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI46CatalogEditorialCollectionDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_standardNavigationBarTintColor));
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_currentNavigationBarTintColor);
}

@end