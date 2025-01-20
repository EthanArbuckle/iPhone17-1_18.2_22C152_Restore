@interface TVWorkoutPlanAlternativesViewController
- (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVWorkoutPlanAlternativesViewController

- (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_visibility) = 1;
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_lastFocusedIndexPath;
  uint64_t v6 = sub_23A7F6B08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_settlingTimer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_resignActiveObserver) = 0;
  id v7 = a3;

  result = (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  TVWorkoutPlanAlternativesViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  TVWorkoutPlanAlternativesViewController.viewDidLayoutSubviews()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TVWorkoutPlanAlternativesViewController *)&v5 viewDidAppear:v3];
  type metadata accessor for TVWorkoutPlanAlternativesPageDataProvider();
  sub_239E8AF1C(&qword_268A12558, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesPageDataProvider);
  sub_23A7FC148();
  sub_239E8AF1C(&qword_268A12560, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesViewController);
  sub_239E8AF1C((unint64_t *)&unk_268A12568, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesViewController);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  TVWorkoutPlanAlternativesViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TVWorkoutPlanAlternativesViewController *)&v5 viewDidDisappear:v3];
  sub_239E8AF1C(&qword_268A12560, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesViewController);
  sub_239E8AF1C((unint64_t *)&unk_268A12568, (void (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesViewController);
  sub_23A7FC858();
}

- (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_pageNavigator);
  swift_release();
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_lastFocusedIndexPath, &qword_268A0F400);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_timerProvider);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end