@interface ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell

- (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell *)sub_100446BBC(a3, (uint64_t)a4, v6);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell_totalWinsView) sizeThatFits:a3.width, a3.height];
  double v7 = v6 + 0.0;
  result.height = v7;
  result.width = v5;
  return result;
}

- (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell_totalWinsView;
  id v6 = objc_allocWithZone((Class)ASCompetitionScoreView);
  id v7 = a3;
  id v8 = [v6 init];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)v8;

  CGSize result = (_TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp60ActivitySharingFriendDetailCompetitionTotalWinsTableViewCell_totalWinsView));
}

@end