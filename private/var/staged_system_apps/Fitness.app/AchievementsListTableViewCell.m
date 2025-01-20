@interface AchievementsListTableViewCell
- (_TtC10FitnessApp29AchievementsListTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp29AchievementsListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation AchievementsListTableViewCell

- (_TtC10FitnessApp29AchievementsListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp29AchievementsListTableViewCell *)sub_10022257C(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp29AchievementsListTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100224994();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AchievementsListTableViewCell();
  v2 = (char *)v4.receiver;
  [(AchievementsListTableViewCell *)&v4 prepareForReuse];
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC10FitnessApp29AchievementsListTableViewCell_achievementCellContentView];
  [*(id *)(v3 + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_titleLabel) setText:0 v4.receiver, v4.super_class];
  [*(id *)(v3 + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_detailLabel) setText:0];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29AchievementsListTableViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29AchievementsListTableViewCell_achievementCellContentView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp29AchievementsListTableViewCell_achievementBadgeView);
}

@end