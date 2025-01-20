@interface TVWorkoutPlanDetailViewController
- (NSArray)preferredFocusEnvironments;
- (UILabel)accessibilityTitleLabel;
- (_TtC9SeymourUI33TVWorkoutPlanDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI33TVWorkoutPlanDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVWorkoutPlanDetailViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(void **)((*(void **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_dataProvider))[63]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI33TVWorkoutPlanDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A46204C();
}

- (void)viewDidLoad
{
  v2 = self;
  TVWorkoutPlanDetailViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  TVWorkoutPlanDetailViewController.viewDidLayoutSubviews()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_23A7F6C38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = self;
  [(TVWorkoutPlanDetailViewController *)&v12 viewDidAppear:v3];
  v11[1] = *(Class *)((char *)&v10->super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_dataProvider);
  sub_23A4B222C((uint64_t)v9);
  type metadata accessor for TVWorkoutPlanDetailPageDataProvider();
  sub_23A461EE0(&qword_268A1B098, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailPageDataProvider);
  sub_23A7FC148();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_23A461EE0(&qword_268A1B0A0, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailViewController);
  sub_23A461EE0((unint64_t *)&unk_268A1B0A8, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailViewController);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  TVWorkoutPlanDetailViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TVWorkoutPlanDetailViewController *)&v5 viewDidDisappear:v3];
  sub_23A461EE0(&qword_268A1B0A0, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailViewController);
  sub_23A461EE0((unint64_t *)&unk_268A1B0A8, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailViewController);
  sub_23A7FC858();
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_titleLabel));
}

- (_TtC9SeymourUI33TVWorkoutPlanDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI33TVWorkoutPlanDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_pageNavigator);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_storefrontLocalizer);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_lastFocusedIndexPath, &qword_268A0F400);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_timerProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_titleLabel);
}

@end