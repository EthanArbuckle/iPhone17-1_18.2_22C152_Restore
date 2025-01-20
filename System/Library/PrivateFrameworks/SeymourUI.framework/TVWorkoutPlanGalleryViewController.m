@interface TVWorkoutPlanGalleryViewController
- (_TtC9SeymourUI34TVWorkoutPlanGalleryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI34TVWorkoutPlanGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVWorkoutPlanGalleryViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_23A7B4170();
}

- (_TtC9SeymourUI34TVWorkoutPlanGalleryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A7B4ABC();
}

- (_TtC9SeymourUI34TVWorkoutPlanGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI34TVWorkoutPlanGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34TVWorkoutPlanGalleryViewController_pageNavigator);
  swift_release();
  swift_unknownObjectRelease();
  sub_239C9D7E8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34TVWorkoutPlanGalleryViewController_lastFocusedIndexPath);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34TVWorkoutPlanGalleryViewController_timerProvider);

  swift_bridgeObjectRelease();
}

@end