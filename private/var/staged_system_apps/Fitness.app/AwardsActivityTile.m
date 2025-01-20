@interface AwardsActivityTile
- (_TtC10FitnessApp18AwardsActivityTile)initWithCoder:(id)a3;
- (_TtC10FitnessApp18AwardsActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)didTapAchievementWithTapGestureRecognizer:(id)a3;
- (void)prepareForReuse;
@end

@implementation AwardsActivityTile

- (_TtC10FitnessApp18AwardsActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp18AwardsActivityTile *)sub_10038FC0C(a3, (uint64_t)a4, v6);
}

- (void)didTapAchievementWithTapGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100391178(v4);
}

- (void)prepareForReuse
{
  swift_getObjectType();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AwardsActivityTile();
  v3 = self;
  [(AwardsActivityTile *)&v6 prepareForReuse];
  id v4 = *(Class *)((char *)&v3->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_insetContentView);
  id v5 = sub_10049E184();
  [v4 setBackgroundColor:v5];
}

- (_TtC10FitnessApp18AwardsActivityTile)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100391628();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_leftAchievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_middleAchievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_rightAchievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_activeEnergyUnit));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_leftCellContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_middleCellContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_rightCellContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile____lazy_storage___insetContentViewHeightAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile____lazy_storage___leftCellContentViewHeightAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile____lazy_storage___middleCellContentViewHeightAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile____lazy_storage___rightCellContentViewHeightAnchor));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_onDidTapAchievement);

  sub_10005E5F8(v3);
}

@end