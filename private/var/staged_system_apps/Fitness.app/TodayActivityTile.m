@interface TodayActivityTile
- (_TtC10FitnessApp17TodayActivityTile)initWithCoder:(id)a3;
- (_TtC10FitnessApp17TodayActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TodayActivityTile

- (_TtC10FitnessApp17TodayActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp17TodayActivityTile *)sub_1001FCBDC(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp17TodayActivityTile)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100200610();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_moveLabelPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_exerciseLabelPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_standLabelPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_stepsLabelPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_distanceLabelPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_ringsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_firstPairSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_secondPairSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_thirdPairSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp17TodayActivityTile_bottomSeparatorView));

  swift_bridgeObjectRelease();
}

@end