@interface TVCatalogWorkoutDetailViewController
- (NSArray)preferredFocusEnvironments;
- (UILabel)accessibilitySubtitleLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC9SeymourUI36TVCatalogWorkoutDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI36TVCatalogWorkoutDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVCatalogWorkoutDetailViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(void **)((*(void **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_dataProvider))[51]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI36TVCatalogWorkoutDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239C23E24();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239C22350();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_239C22580();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_239C22734(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_239C22A50(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVCatalogWorkoutDetailViewController();
  id v4 = v5.receiver;
  [(TVCatalogWorkoutDetailViewController *)&v5 viewDidDisappear:v3];
  sub_239C25090(&qword_268A0E268, (void (*)(uint64_t))type metadata accessor for TVCatalogWorkoutDetailViewController);
  sub_239C25090((unint64_t *)&unk_268A0E270, (void (*)(uint64_t))type metadata accessor for TVCatalogWorkoutDetailViewController);
  sub_23A7FC858();
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_titleLabel));
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_subtitleLabel));
}

- (_TtC9SeymourUI36TVCatalogWorkoutDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI36TVCatalogWorkoutDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_marketingMetricFieldsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_storefrontLocalizer);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_dynamicOfferCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_webUserInterfaceCoordinator));
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_lastFocusedIndexPath, &qword_268A0F400);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_timerProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_shroudView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_bottomBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_ellipsisButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI36TVCatalogWorkoutDetailViewController_gradientMaskLayer);
}

@end