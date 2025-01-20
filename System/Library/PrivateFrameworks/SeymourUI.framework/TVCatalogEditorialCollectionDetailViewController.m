@interface TVCatalogEditorialCollectionDetailViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVCatalogEditorialCollectionDetailViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(void **)((*(void **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_dataProvider))[6]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A001720();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239FFF63C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_239FFF85C();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVCatalogEditorialCollectionDetailViewController();
  id v4 = v5.receiver;
  [(TVCatalogEditorialCollectionDetailViewController *)&v5 viewDidDisappear:v3];
  sub_23A001CAC(&qword_268A14580, (void (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailViewController);
  sub_23A001CAC(&qword_268A14588, (void (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailViewController);
  sub_23A7FC858();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_23A7F6C38();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TVCatalogEditorialCollectionDetailViewController();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = self;
  [(TVCatalogEditorialCollectionDetailViewController *)&v12 viewDidAppear:v3];
  v11[1] = *(Class *)((char *)&v10->super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_dataProvider);
  sub_23A2C4B48((uint64_t)v8);
  type metadata accessor for TVCatalogEditorialCollectionDetailPageDataProvider();
  sub_23A001CAC((unint64_t *)&unk_268A14590, (void (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailPageDataProvider);
  sub_23A7FC148();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_23A001CAC(&qword_268A14580, (void (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailViewController);
  sub_23A001CAC(&qword_268A14588, (void (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailViewController);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_239FFFCD0(a3);
}

- (_TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_pageNavigator);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_lastFocusedIndexPath, &qword_268A0F400);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_gradientMaskLayer));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_storefrontLocalizer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_timerProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_bottomBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_shroudView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_ellipsisButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_menu);
}

@end