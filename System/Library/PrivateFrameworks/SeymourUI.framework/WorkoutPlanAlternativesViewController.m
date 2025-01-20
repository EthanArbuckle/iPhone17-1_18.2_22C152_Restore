@interface WorkoutPlanAlternativesViewController
- (CGSize)preferredContentSize;
- (_TtC9SeymourUI37WorkoutPlanAlternativesViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI37WorkoutPlanAlternativesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)onCloseButtonTapped:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WorkoutPlanAlternativesViewController

- (CGSize)preferredContentSize
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  uint64_t v5 = sub_23A7FB668();
  if (v5 == sub_23A7FB668())
  {

    uint64_t v6 = 0x407B800000000000;
    uint64_t v7 = 0x4079000000000000;
  }
  else
  {
    v12.receiver = v4;
    v12.super_class = ObjectType;
    [(WorkoutPlanAlternativesViewController *)&v12 preferredContentSize];
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
  -[WorkoutPlanAlternativesViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI37WorkoutPlanAlternativesViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanAlternativesViewController_resignActiveObserver) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanAlternativesViewController_visibility) = 1;
  id v4 = a3;

  CGSize result = (_TtC9SeymourUI37WorkoutPlanAlternativesViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  WorkoutPlanAlternativesViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_23A7F67C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  double v10 = self;
  [(WorkoutPlanAlternativesViewController *)&v12 viewWillDisappear:v3];
  v11[1] = v10;
  sub_23A7F67B8();
  sub_239E88A20(&qword_268A12518);
  sub_23A7FC748();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v2 = (char *)v10.receiver;
  [(WorkoutPlanAlternativesViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI37WorkoutPlanAlternativesViewController_dataProvider] + 48);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  objc_super v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)onCloseButtonTapped:(id)a3
{
}

- (_TtC9SeymourUI37WorkoutPlanAlternativesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC9SeymourUI37WorkoutPlanAlternativesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanAlternativesViewController_pageNavigator;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end