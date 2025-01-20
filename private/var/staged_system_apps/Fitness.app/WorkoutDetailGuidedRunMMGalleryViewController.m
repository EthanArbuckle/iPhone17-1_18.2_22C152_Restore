@interface WorkoutDetailGuidedRunMMGalleryViewController
- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithRootViewController:(id)a3;
- (void)doneButtonTapped;
- (void)scrollViewDidEndDecelerating:(id)a3;
@end

@implementation WorkoutDetailGuidedRunMMGalleryViewController

- (void)doneButtonTapped
{
}

- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100640EC8();
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100640C84(v4);
}

- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController_rootViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController_imageScrollView);
}

@end