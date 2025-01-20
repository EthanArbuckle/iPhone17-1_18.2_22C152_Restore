@interface TrendsOnBoardingActivityTile
- (_TtC10FitnessApp28TrendsOnBoardingActivityTile)initWithCoder:(id)a3;
- (_TtC10FitnessApp28TrendsOnBoardingActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)dealloc;
- (void)didTapGetStartedButton;
- (void)prepareForReuse;
@end

@implementation TrendsOnBoardingActivityTile

- (_TtC10FitnessApp28TrendsOnBoardingActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC10FitnessApp28TrendsOnBoardingActivityTile *)sub_100317070(a3, (uint64_t)a4, v6);
}

- (void)dealloc
{
  v2 = self;
  sub_1003172CC();
}

- (void).cxx_destruct
{
  sub_1002D5734(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_insetContentView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_videoView));

  swift_bridgeObjectRelease();
}

- (void)didTapGetStartedButton
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_configuration);
  if ((unint64_t)v2 - 1 >= 2)
  {
    if (v2)
    {
      v4 = self;
      uint64_t v3 = sub_1003192E0((uint64_t)v2);
      v2(v3);
      sub_1002D5734((uint64_t)v2);
    }
    else
    {
      sub_10008A670(0);
    }
  }
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100318D4C();
}

- (_TtC10FitnessApp28TrendsOnBoardingActivityTile)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003192F4();
}

@end