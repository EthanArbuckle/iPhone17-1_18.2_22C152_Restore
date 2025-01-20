@interface WorkoutPlanTemplateDetailViewController
- (CGSize)preferredContentSize;
- (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleDoneButtonTapped;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WorkoutPlanTemplateDetailViewController

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
    [(WorkoutPlanTemplateDetailViewController *)&v12 preferredContentSize];
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
  -[WorkoutPlanTemplateDetailViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_resignActiveObserver) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_currentContentInsetBehavior;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = -4;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_isTransitioningContentInset) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_visibility) = 1;
  id v5 = a3;

  CGSize result = (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  WorkoutPlanTemplateDetailViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(WorkoutPlanTemplateDetailViewController *)&v5 viewDidAppear:v3];
  sub_23A455370();
  sub_23A15D09C();
  sub_23A160D48(&qword_268A162E0);
  sub_23A7FC148();
  sub_23A160D48(&qword_268A162E8);
  sub_23A160D48(&qword_268A162F0);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  WorkoutPlanTemplateDetailViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(WorkoutPlanTemplateDetailViewController *)&v5 viewDidDisappear:v3];
  sub_23A160D48(&qword_268A162E8);
  sub_23A160D48(&qword_268A162F0);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v2 = (char *)v10.receiver;
  [(WorkoutPlanTemplateDetailViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI41WorkoutPlanTemplateDetailPageDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  objc_super v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)handleDoneButtonTapped
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_dataProvider);
  uint64_t v4 = v3 + OBJC_IVAR____TtC9SeymourUI41WorkoutPlanTemplateDetailPageDataProvider_delegate;
  if (MEMORY[0x23ECB8640](v3 + OBJC_IVAR____TtC9SeymourUI41WorkoutPlanTemplateDetailPageDataProvider_delegate, a2))
  {
    uint64_t v5 = *(void *)(v4 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC9SeymourUI41WorkoutPlanTemplateDetailPageDataProvider_page);
    double v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 248);
    double v9 = self;
    v8(v7, ObjectType, v5);

    swift_unknownObjectRelease();
  }
}

- (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_storefrontLocalizer);

  swift_release();
}

@end