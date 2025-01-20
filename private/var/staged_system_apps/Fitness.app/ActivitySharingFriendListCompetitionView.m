@interface ActivitySharingFriendListCompetitionView
- (CGSize)intrinsicContentSize;
- (_TtC10FitnessApp40ActivitySharingFriendListCompetitionView)initWithCoder:(id)a3;
- (_TtC10FitnessApp40ActivitySharingFriendListCompetitionView)initWithFrame:(CGRect)a3;
@end

@implementation ActivitySharingFriendListCompetitionView

- (_TtC10FitnessApp40ActivitySharingFriendListCompetitionView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp40ActivitySharingFriendListCompetitionView *)sub_1002E85A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_1002E8EC4();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC10FitnessApp40ActivitySharingFriendListCompetitionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002E9080();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_competitionScoreViewConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_competitionScoreView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_competitionStageLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp40ActivitySharingFriendListCompetitionView_friend);
}

@end