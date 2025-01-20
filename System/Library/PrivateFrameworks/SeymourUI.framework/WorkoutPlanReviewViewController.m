@interface WorkoutPlanReviewViewController
- (_TtC9SeymourUI31WorkoutPlanReviewViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI31WorkoutPlanReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WorkoutPlanReviewViewController

- (_TtC9SeymourUI31WorkoutPlanReviewViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanReviewViewController_visibility) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanReviewViewController_resignActiveObserver) = 0;
  id v4 = a3;

  result = (_TtC9SeymourUI31WorkoutPlanReviewViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  WorkoutPlanReviewViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(WorkoutPlanReviewViewController *)&v7 viewDidAppear:v3];
  type metadata accessor for WorkoutPlanReviewPageDataProvider(0);
  sub_239E27DA8(&qword_268A116D8, 255, (void (*)(uint64_t))type metadata accessor for WorkoutPlanReviewPageDataProvider);
  sub_23A7FC148();
  sub_239E27DA8(&qword_268A116E0, v5, (void (*)(uint64_t))type metadata accessor for WorkoutPlanReviewViewController);
  sub_239E27DA8(&qword_268A116E8, v6, (void (*)(uint64_t))type metadata accessor for WorkoutPlanReviewViewController);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  WorkoutPlanReviewViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(WorkoutPlanReviewViewController *)&v7 viewDidDisappear:v3];
  sub_239E27DA8(&qword_268A116E0, v5, (void (*)(uint64_t))type metadata accessor for WorkoutPlanReviewViewController);
  sub_239E27DA8(&qword_268A116E8, v6, (void (*)(uint64_t))type metadata accessor for WorkoutPlanReviewViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  WorkoutPlanReviewViewController.viewDidLayoutSubviews()();
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(WorkoutPlanReviewViewController *)&v3 viewSafeAreaInsetsDidChange];
  sub_239E25508();
}

- (_TtC9SeymourUI31WorkoutPlanReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI31WorkoutPlanReviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanReviewViewController_magicPocketView));
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanReviewViewController_pageNavigator);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

@end