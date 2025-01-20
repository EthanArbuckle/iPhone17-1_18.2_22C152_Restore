@interface GalleryToTimelineTransition
- (_TtC7Journal27GalleryToTimelineTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation GalleryToTimelineTransition

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1004821A0(a3);
  swift_unknownObjectRelease();
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (_TtC7Journal27GalleryToTimelineTransition)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27GalleryToTimelineTransition_duration) = (Class)0x3FE0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27GalleryToTimelineTransition_halfDuration) = (Class)0x3FD0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27GalleryToTimelineTransition_quarterDuration) = (Class)0x3FC0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27GalleryToTimelineTransition_transitioningContext) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GalleryToTimelineTransition();
  return [(GalleryToTimelineTransition *)&v3 init];
}

- (void).cxx_destruct
{
}

@end