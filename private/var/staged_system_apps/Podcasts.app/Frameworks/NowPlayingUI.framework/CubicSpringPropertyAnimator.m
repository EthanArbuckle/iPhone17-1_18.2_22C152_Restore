@interface CubicSpringPropertyAnimator
- (_TtC12NowPlayingUI27CubicSpringPropertyAnimator)initWithDuration:(double)a3 timingParameters:(id)a4;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
@end

@implementation CubicSpringPropertyAnimator

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_1299F0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  id v11 = sub_DF8E4((uint64_t)a3, v6, v8);

  swift_bridgeObjectRelease();

  return v11;
}

- (_TtC12NowPlayingUI27CubicSpringPropertyAnimator)initWithDuration:(double)a3 timingParameters:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CubicSpringPropertyAnimator();
  return [(CubicSpringPropertyAnimator *)&v7 initWithDuration:a4 timingParameters:a3];
}

@end