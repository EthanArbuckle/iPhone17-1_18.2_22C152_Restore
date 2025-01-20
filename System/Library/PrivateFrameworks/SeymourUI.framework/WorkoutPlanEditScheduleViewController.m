@interface WorkoutPlanEditScheduleViewController
- (CGSize)preferredContentSize;
- (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)onActionButtonTapped;
- (void)onCancelButtonTapped;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WorkoutPlanEditScheduleViewController

- (CGSize)preferredContentSize
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  uint64_t v5 = sub_23A7FB668();
  if (v5 == sub_23A7FB668())
  {

    uint64_t v6 = 0x4087E00000000000;
    uint64_t v7 = 0x4083800000000000;
  }
  else
  {
    v12.receiver = v4;
    v12.super_class = ObjectType;
    [(WorkoutPlanEditScheduleViewController *)&v12 preferredContentSize];
    uint64_t v7 = v8;
    uint64_t v6 = v9;
  }
  double v10 = *(double *)&v7;
  double v11 = *(double *)&v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  -[WorkoutPlanEditScheduleViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_resignActiveObserver) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_visibility) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_primaryActionButton) = 0;
  id v4 = a3;

  CGSize result = (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  WorkoutPlanEditScheduleViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(WorkoutPlanEditScheduleViewController *)&v7 viewDidAppear:v3];
  type metadata accessor for WorkoutPlanEditSchedulePageDataProvider(0);
  sub_239E4F480(&qword_268A11DD8, 255, (void (*)(uint64_t))type metadata accessor for WorkoutPlanEditSchedulePageDataProvider);
  sub_23A7FC148();
  sub_239E4F480(&qword_268A11DE0, v5, (void (*)(uint64_t))type metadata accessor for WorkoutPlanEditScheduleViewController);
  sub_239E4F480(&qword_268A11DE8, v6, (void (*)(uint64_t))type metadata accessor for WorkoutPlanEditScheduleViewController);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  WorkoutPlanEditScheduleViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(WorkoutPlanEditScheduleViewController *)&v7 viewDidDisappear:v3];
  sub_239E4F480(&qword_268A11DE0, v5, (void (*)(uint64_t))type metadata accessor for WorkoutPlanEditScheduleViewController);
  sub_239E4F480(&qword_268A11DE8, v6, (void (*)(uint64_t))type metadata accessor for WorkoutPlanEditScheduleViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  WorkoutPlanEditScheduleViewController.viewDidLayoutSubviews()();
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(WorkoutPlanEditScheduleViewController *)&v3 viewSafeAreaInsetsDidChange];
  sub_239E25660();
}

- (void)onActionButtonTapped
{
  id v2 = self;
  sub_239E4E0CC();
}

- (void)onCancelButtonTapped
{
  id v2 = self;
  sub_239E4E58C();
}

- (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_magicPocketView));
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_pageNavigator);
  swift_unknownObjectRelease();
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_primaryActionButton);
}

@end