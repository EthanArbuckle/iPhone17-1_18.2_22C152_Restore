@interface WorkoutPlanScheduleViewController
- (_TtC9SeymourUI33WorkoutPlanScheduleViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI33WorkoutPlanScheduleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)backButtonPressed;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WorkoutPlanScheduleViewController

- (_TtC9SeymourUI33WorkoutPlanScheduleViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A2E3330();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(WorkoutPlanScheduleViewController *)&v4 viewDidLoad];
  sub_23A2DFE40();
  sub_23A357A58();
  sub_23A2E01D4();
  self;
  id v3 = (void *)swift_dynamicCastObjCClass();
  if (v3) {
    objc_msgSend(v3, sel_setAlwaysBounceVertical_, 0, v4.receiver, v4.super_class);
  }
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v2 = (char *)v9.receiver;
  [(WorkoutPlanScheduleViewController *)&v9 viewDidLayoutSubviews];
  uint64_t v3 = *(void *)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI33WorkoutPlanScheduleViewController_dataProvider]
                 + OBJC_IVAR____TtC9SeymourUI36WorkoutPlanSchedulePageDataProviderX_page);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_impressionsTracker), *(void *)(v3 + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_impressionsTracker + 24));
  objc_super v4 = *(void **)(v3 + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_collectionView);
  swift_unknownObjectRetain();
  objc_msgSend(v4, sel_bounds, v9.receiver, v9.super_class);
  sub_23A05CD58(v5, v6, v7, v8);

  swift_unknownObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(WorkoutPlanScheduleViewController *)&v5 viewWillAppear:v3];
  sub_23A2E01D4();
  sub_23A0318B8();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  WorkoutPlanScheduleViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  WorkoutPlanScheduleViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)backButtonPressed
{
  double v6 = self;
  id v2 = (_TtC9SeymourUI33WorkoutPlanScheduleViewController *)[(WorkoutPlanScheduleViewController *)v6 navigationController];
  if (v2)
  {
    BOOL v3 = v2;
    id v4 = [(WorkoutPlanScheduleViewController *)v2 popViewControllerAnimated:1];

    objc_super v5 = v3;
  }
  else
  {
    objc_super v5 = v6;
  }
}

- (_TtC9SeymourUI33WorkoutPlanScheduleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI33WorkoutPlanScheduleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanScheduleViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanScheduleViewController_storefrontLocalizer);
  swift_release();
  swift_release();
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanScheduleViewController_navigationTitleView);
}

@end