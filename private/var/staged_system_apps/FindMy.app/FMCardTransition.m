@interface FMCardTransition
- (_TtC6FindMy16FMCardTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation FMCardTransition

- (double)transitionDuration:(id)a3
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_duration);
}

- (void)animateTransition:(id)a3
{
}

- (_TtC6FindMy16FMCardTransition)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_duration) = (Class)0x3FE0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_delay) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_springDamping) = (Class)0x3FECCCCCCCCCCCCDLL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_initialSpringVelocity) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_animationOptions) = (Class)0x20000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardTransition();
  return [(FMCardTransition *)&v3 init];
}

@end