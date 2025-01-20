@interface SwipeActionAnimationDelegate
- (_TtC5TeaUI28SwipeActionAnimationDelegate)init;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation SwipeActionAnimationDelegate

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1B5F158E4((uint64_t)v7, a4);
}

- (_TtC5TeaUI28SwipeActionAnimationDelegate)init
{
}

- (void).cxx_destruct
{
  sub_1B5F15B7C((uint64_t)self + OBJC_IVAR____TtC5TeaUI28SwipeActionAnimationDelegate_swipeState);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5TeaUI28SwipeActionAnimationDelegate_completion);
  sub_1B5E3799C(v3);
}

@end