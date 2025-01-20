@interface WorkoutPlanPreferencesViewController
- (CGSize)preferredContentSize;
- (_TtC9SeymourUI36WorkoutPlanPreferencesViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI36WorkoutPlanPreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)onCancelButtonTapped:(id)a3;
- (void)onUpdateButtonTapped:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WorkoutPlanPreferencesViewController

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
    [(WorkoutPlanPreferencesViewController *)&v12 preferredContentSize];
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
  -[WorkoutPlanPreferencesViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI36WorkoutPlanPreferencesViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI36WorkoutPlanPreferencesViewController_resignActiveObserver) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI36WorkoutPlanPreferencesViewController_primaryActionButton) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI36WorkoutPlanPreferencesViewController_visibility) = 1;
  id v4 = a3;

  CGSize result = (_TtC9SeymourUI36WorkoutPlanPreferencesViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  WorkoutPlanPreferencesViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(WorkoutPlanPreferencesViewController *)&v7 viewDidAppear:v3];
  type metadata accessor for WorkoutPlanPreferencesPageDataProvider();
  sub_23A151558(&qword_268A160C0, 255, (void (*)(uint64_t))type metadata accessor for WorkoutPlanPreferencesPageDataProvider);
  sub_23A7FC148();
  sub_23A151558(&qword_268A160C8, v5, (void (*)(uint64_t))type metadata accessor for WorkoutPlanPreferencesViewController);
  sub_23A151558(&qword_268A160D0, v6, (void (*)(uint64_t))type metadata accessor for WorkoutPlanPreferencesViewController);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  WorkoutPlanPreferencesViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(WorkoutPlanPreferencesViewController *)&v7 viewDidDisappear:v3];
  sub_23A151558(&qword_268A160C8, v5, (void (*)(uint64_t))type metadata accessor for WorkoutPlanPreferencesViewController);
  sub_23A151558(&qword_268A160D0, v6, (void (*)(uint64_t))type metadata accessor for WorkoutPlanPreferencesViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v2 = (char *)v10.receiver;
  [(WorkoutPlanPreferencesViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI36WorkoutPlanPreferencesViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanPreferencesPageDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  uint64_t v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)onCancelButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23A150F3C();
}

- (void)onUpdateButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23A151240();
}

- (_TtC9SeymourUI36WorkoutPlanPreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC9SeymourUI36WorkoutPlanPreferencesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36WorkoutPlanPreferencesViewController_primaryActionButton));
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36WorkoutPlanPreferencesViewController_pageNavigator);

  swift_release();
}

@end