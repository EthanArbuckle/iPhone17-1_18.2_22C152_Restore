@interface ActivitySharingFriendDetailCompetitionScoreTableViewCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ActivitySharingFriendDetailCompetitionScoreTableViewCell

- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell *)sub_1002C2E58(a3, (uint64_t)a4, v6);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell_scoreView) sizeThatFits:a3.width, a3.height];
  result.height = v6;
  result.width = v5;
  return result;
}

- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002C3180();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionScoreTableViewCell_scoreView));
}

@end