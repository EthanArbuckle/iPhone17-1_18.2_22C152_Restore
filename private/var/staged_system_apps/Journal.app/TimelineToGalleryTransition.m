@interface TimelineToGalleryTransition
- (_TtC7Journal27TimelineToGalleryTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation TimelineToGalleryTransition

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10048E554(a3);
  swift_unknownObjectRelease();
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (_TtC7Journal27TimelineToGalleryTransition)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27TimelineToGalleryTransition_duration) = (Class)0x3FE0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27TimelineToGalleryTransition_halfDuration) = (Class)0x3FD0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27TimelineToGalleryTransition_quarterDuration) = (Class)0x3FC0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27TimelineToGalleryTransition_transitioningContext) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27TimelineToGalleryTransition_galleryVC) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7Journal27TimelineToGalleryTransition_hasStartedAnimationAfterLoading) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TimelineToGalleryTransition();
  return [(TimelineToGalleryTransition *)&v3 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27TimelineToGalleryTransition_galleryVC);
}

@end