@interface WorkoutPlanSurveyViewController
- (CGSize)preferredContentSize;
- (_TtC9SeymourUI31WorkoutPlanSurveyViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI31WorkoutPlanSurveyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)onCancelButtonTapped:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WorkoutPlanSurveyViewController

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
    [(WorkoutPlanSurveyViewController *)&v12 preferredContentSize];
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
  -[WorkoutPlanSurveyViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI31WorkoutPlanSurveyViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanSurveyViewController_currentContentInsetBehavior;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = -4;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanSurveyViewController_isTransitioningContentInset) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanSurveyViewController_visibility) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanSurveyViewController_resignActiveObserver) = 0;
  id v5 = a3;

  CGSize result = (_TtC9SeymourUI31WorkoutPlanSurveyViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  WorkoutPlanSurveyViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(WorkoutPlanSurveyViewController *)&v7 viewDidAppear:v3];
  type metadata accessor for WorkoutPlanSurveyPageDataProvider(0);
  sub_23A73D9B8(&qword_268A1ED68, 255, (void (*)(uint64_t))type metadata accessor for WorkoutPlanSurveyPageDataProvider);
  sub_23A7FC148();
  sub_23A73D9B8(&qword_268A1ED70, v5, (void (*)(uint64_t))type metadata accessor for WorkoutPlanSurveyViewController);
  sub_23A73D9B8(&qword_268A1ED78, v6, (void (*)(uint64_t))type metadata accessor for WorkoutPlanSurveyViewController);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  WorkoutPlanSurveyViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(WorkoutPlanSurveyViewController *)&v7 viewDidDisappear:v3];
  sub_23A73D9B8(&qword_268A1ED70, v5, (void (*)(uint64_t))type metadata accessor for WorkoutPlanSurveyViewController);
  sub_23A73D9B8(&qword_268A1ED78, v6, (void (*)(uint64_t))type metadata accessor for WorkoutPlanSurveyViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  WorkoutPlanSurveyViewController.viewDidLayoutSubviews()();
}

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  WorkoutPlanSurveyViewController.viewSafeAreaInsetsDidChange()();
}

- (void)onCancelButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23A73D5C4();
}

- (_TtC9SeymourUI31WorkoutPlanSurveyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC9SeymourUI31WorkoutPlanSurveyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanSurveyViewController_magicPocketView));
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanSurveyViewController_pageNavigator);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end