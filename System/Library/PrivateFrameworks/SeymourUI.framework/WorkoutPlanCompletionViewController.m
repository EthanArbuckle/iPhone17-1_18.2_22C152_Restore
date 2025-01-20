@interface WorkoutPlanCompletionViewController
- (CGSize)preferredContentSize;
- (_TtC9SeymourUI35WorkoutPlanCompletionViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI35WorkoutPlanCompletionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doneButtonPressed;
- (void)repeatButtonPressed;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WorkoutPlanCompletionViewController

- (CGSize)preferredContentSize
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  uint64_t v5 = sub_23A7FB668();
  if (v5 == sub_23A7FB668())
  {

    uint64_t v6 = 0x4081300000000000;
    uint64_t v7 = 0x407F400000000000;
  }
  else
  {
    v12.receiver = v4;
    v12.super_class = ObjectType;
    [(WorkoutPlanCompletionViewController *)&v12 preferredContentSize];
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
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = self;
  uint64_t v7 = sub_23A7FB668();
  if (v7 == sub_23A7FB668())
  {
  }
  else
  {
    v9.receiver = v8;
    v9.super_class = ObjectType;
    -[WorkoutPlanCompletionViewController setPreferredContentSize:](&v9, sel_setPreferredContentSize_, width, height);
  }
}

- (_TtC9SeymourUI35WorkoutPlanCompletionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A7B3A0C();
}

- (void)repeatButtonPressed
{
  v2 = self;
  sub_23A7B1138();
}

- (void)doneButtonPressed
{
  v2 = self;
  sub_23A7B1894();
}

- (void)viewDidLoad
{
  v2 = self;
  WorkoutPlanCompletionViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  WorkoutPlanCompletionViewController.viewDidAppear(_:)(a3);
}

- (_TtC9SeymourUI35WorkoutPlanCompletionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC9SeymourUI35WorkoutPlanCompletionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController_metricPage;
  uint64_t v4 = sub_23A7F6C38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController_medalContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___metricsContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___mainStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___scrollingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___medalStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___buttonContentContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___textStackContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___textStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___repeatButton));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___buttonStack);
}

@end