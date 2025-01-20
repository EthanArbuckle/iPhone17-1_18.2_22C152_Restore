@interface WorkoutPlanCalendarViewController
- (_TtC9SeymourUI33WorkoutPlanCalendarViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI33WorkoutPlanCalendarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WorkoutPlanCalendarViewController

- (_TtC9SeymourUI33WorkoutPlanCalendarViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_dataSource) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_isApplyingSnapshot) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_isTappingScrollView) = 0;
  id v4 = a3;

  result = (_TtC9SeymourUI33WorkoutPlanCalendarViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239EABB70();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_239EAC720(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC9SeymourUI33WorkoutPlanCalendarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI33WorkoutPlanCalendarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_collectionView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_layoutProvider);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_dataSource);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23A7F6B08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v10 = a3;
  v11 = self;
  sub_239EADA48();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_239EACE18(a3, a4, a5);

  swift_unknownObjectRelease();
}

@end