@interface FMR1Transition
- (_TtC6FindMy14FMR1Transition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation FMR1Transition

- (double)transitionDuration:(id)a3
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_duration);
}

- (void)animateTransition:(id)a3
{
}

- (_TtC6FindMy14FMR1Transition)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_duration) = (Class)0x3FE0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_delay) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_springDamping) = (Class)0x407F400000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_initialSpringVelocity) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_animationOptions) = (Class)0x20000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_mass) = (Class)0x4008000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_stiffness) = (Class)0x408F400000000000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMR1Transition();
  return [(FMR1Transition *)&v3 init];
}

@end