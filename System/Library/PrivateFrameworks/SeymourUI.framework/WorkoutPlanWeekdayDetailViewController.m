@interface WorkoutPlanWeekdayDetailViewController
- (_TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WorkoutPlanWeekdayDetailViewController

- (_TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A073AD8();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(WorkoutPlanWeekdayDetailViewController *)&v3 viewDidLoad];
  sub_239E205B8(0);
  sub_239E22CBC();
  objc_msgSend(*(id *)(*(void *)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_dataProvider]+ 256)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_setAlwaysBounceVertical_, 0, v3.receiver, v3.super_class);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(WorkoutPlanWeekdayDetailViewController *)&v5 viewDidAppear:v3];
  sub_239C179A0();
  sub_23A073A44(&qword_268A15188);
  sub_23A073A44(&qword_268A15190);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_23A7F67C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = self;
  [(WorkoutPlanWeekdayDetailViewController *)&v12 viewWillDisappear:v3];
  v11[1] = v10;
  sub_23A7F67B8();
  sub_23A073A44(&qword_268A15188);
  sub_23A7FC748();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(WorkoutPlanWeekdayDetailViewController *)&v5 viewDidDisappear:v3];
  sub_23A073A44(&qword_268A15188);
  sub_23A073A44(&qword_268A15190);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v2 = (char *)v10.receiver;
  [(WorkoutPlanWeekdayDetailViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_dataProvider] + 256);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  objc_super v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (_TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_dynamicOfferCoordinator));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_pageNavigator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_purchaseHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_webUserInterfaceCoordinator));
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end