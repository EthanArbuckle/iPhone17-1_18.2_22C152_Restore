@interface ActivitySharingFriendDetailCompetitionGraphTableViewCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ActivitySharingFriendDetailCompetitionGraphTableViewCell

- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell *)sub_1003EFFB8(a3, (uint64_t)a4, v6);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat width = a3.width;
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell_graphView) preferredHeight:a3.width, a3.height];
  double v7 = v6;
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  double v7 = (objc_class *)[v5 companionGraph];
  if (!v7) {
    __break(1u);
  }
  uint64_t v8 = OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell_graphView;
  v9 = v7;
  [(objc_class *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = v9;

  CGSize result = (_TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp56ActivitySharingFriendDetailCompetitionGraphTableViewCell_graphView));
}

@end