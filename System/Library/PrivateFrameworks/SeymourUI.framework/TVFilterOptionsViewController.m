@interface TVFilterOptionsViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI29TVFilterOptionsViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI29TVFilterOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)menuButtonTapped;
- (void)viewDidLoad;
@end

@implementation TVFilterOptionsViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = self;
  swift_retain();
  v5 = (char *)sub_23A71E95C();
  swift_release();
  id v6 = *(id *)&v5[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];

  *(void *)(v3 + 32) = v6;
  sub_23A7FFC98();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v7 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v7;
}

- (_TtC9SeymourUI29TVFilterOptionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A3BE7AC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A3BD280();
}

- (void)menuButtonTapped
{
  v2 = self;
  sub_23A3BD60C();
}

- (_TtC9SeymourUI29TVFilterOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI29TVFilterOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_pageNavigator);
  swift_release();
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_lastFocusedIndexPath, &qword_268A0F400);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_timerProvider);
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_metricPublishingDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_titleLabel);
}

@end