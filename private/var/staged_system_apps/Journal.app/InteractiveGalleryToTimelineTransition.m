@interface InteractiveGalleryToTimelineTransition
- (_TtC7Journal38InteractiveGalleryToTimelineTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)finishInteractiveTransition;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation InteractiveGalleryToTimelineTransition

- (void)updateInteractiveTransition:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InteractiveGalleryToTimelineTransition();
  id v4 = v5.receiver;
  [(InteractiveGalleryToTimelineTransition *)&v5 updateInteractiveTransition:a3];
  sub_1004E6244(0, a3);
}

- (void)finishInteractiveTransition
{
  v2 = self;
  [(InteractiveGalleryToTimelineTransition *)v2 percentComplete];
  sub_1004E6244(1, v3);
  *((unsigned char *)&v2->super.super.isa
  + OBJC_IVAR____TtC7Journal38InteractiveGalleryToTimelineTransition_hasPerformedPreAnimationActions) = 0;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for InteractiveGalleryToTimelineTransition();
  [(InteractiveGalleryToTimelineTransition *)&v4 finishInteractiveTransition];
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
}

- (_TtC7Journal38InteractiveGalleryToTimelineTransition)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7Journal38InteractiveGalleryToTimelineTransition_animationDuration) = (Class)0x3FE0000000000000;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7Journal38InteractiveGalleryToTimelineTransition_halfDuration) = (Class)0x3FD0000000000000;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7Journal38InteractiveGalleryToTimelineTransition_quarterDuration) = (Class)0x3FC0000000000000;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC7Journal38InteractiveGalleryToTimelineTransition_hasPerformedPreAnimationActions) = 0;
  double v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7Journal38InteractiveGalleryToTimelineTransition_panningFrame);
  objc_super v4 = (objc_class *)type metadata accessor for InteractiveGalleryToTimelineTransition();
  *double v3 = 0u;
  v3[1] = 0u;
  v6.receiver = self;
  v6.super_class = v4;
  return [(InteractiveGalleryToTimelineTransition *)&v6 init];
}

- (void).cxx_destruct
{
}

@end