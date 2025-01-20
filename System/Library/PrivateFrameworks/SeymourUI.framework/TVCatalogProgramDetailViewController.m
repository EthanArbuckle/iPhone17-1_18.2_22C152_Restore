@interface TVCatalogProgramDetailViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI36TVCatalogProgramDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI36TVCatalogProgramDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVCatalogProgramDetailViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(void **)((*(void **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_dataProvider))[51]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI36TVCatalogProgramDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239CE9CFC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239CE8534();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_239CE8688();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVCatalogProgramDetailViewController();
  id v4 = v5.receiver;
  [(TVCatalogProgramDetailViewController *)&v5 viewDidDisappear:v3];
  sub_239CEABE0(&qword_268A0F408, (void (*)(uint64_t))type metadata accessor for TVCatalogProgramDetailViewController);
  sub_239CEABE0(&qword_268A0F428, (void (*)(uint64_t))type metadata accessor for TVCatalogProgramDetailViewController);
  sub_23A7FC858();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_239CE8914(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_239CE8C30(a3);
}

- (_TtC9SeymourUI36TVCatalogProgramDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI36TVCatalogProgramDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_storefrontLocalizer);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_dynamicOfferCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_webUserInterfaceCoordinator));
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_lastFocusedIndexPath, &qword_268A0F400);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_timerProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_shroudView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_bottomBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_ellipsisButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_menu));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_gradientMaskLayer);
}

@end