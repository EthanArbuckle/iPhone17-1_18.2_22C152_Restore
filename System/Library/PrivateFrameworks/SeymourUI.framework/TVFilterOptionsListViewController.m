@interface TVFilterOptionsListViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI33TVFilterOptionsListViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI33TVFilterOptionsListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleActionButtonTapped;
- (void)menuButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVFilterOptionsListViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(void **)((*(void **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_dataProvider))[5]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI33TVFilterOptionsListViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239C9D19C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239C9BEFC();
}

- (void)menuButtonTapped
{
  v2 = self;
  sub_239C9C64C();
}

- (void)handleActionButtonTapped
{
  v2 = self;
  sub_23A424F7C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVFilterOptionsListViewController();
  id v4 = v5.receiver;
  [(TVFilterOptionsListViewController *)&v5 viewDidAppear:v3];
  sub_23A481650();
}

- (_TtC9SeymourUI33TVFilterOptionsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI33TVFilterOptionsListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_239C9D7E8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_lastFocusedIndexPath);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_timerProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_optionsActionsHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_optionsActionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_titleLabel));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_pageNavigator);
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_metricPublishingDelegate;

  sub_239C1AE10((uint64_t)v3);
}

@end