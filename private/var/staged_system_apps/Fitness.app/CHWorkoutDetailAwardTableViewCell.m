@interface CHWorkoutDetailAwardTableViewCell
+ (double)preferredHeightForWorkout:(id)a3;
- (CGRect)badgeRect;
- (CHWorkoutDetailAwardTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailAwardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)achievementBadgeView;
- (UIView)insetView;
- (_TtC10FitnessApp26AchievementCellContentView)achievementCellContentView;
- (void)configureForAchievement:(id)a3 badgeImageFactory:(id)a4 localizationProvider:(id)a5;
- (void)setImageHidden:(BOOL)a3;
@end

@implementation CHWorkoutDetailAwardTableViewCell

- (UIImageView)achievementBadgeView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementBadgeView));
}

- (_TtC10FitnessApp26AchievementCellContentView)achievementCellContentView
{
  return (_TtC10FitnessApp26AchievementCellContentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                 + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementCellContentView));
}

- (UIView)insetView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_insetView));
}

- (CHWorkoutDetailAwardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutDetailAwardTableViewCell *)sub_100673214(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailAwardTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100673D58();
}

+ (double)preferredHeightForWorkout:(id)a3
{
  return 90.0;
}

- (void)configureForAchievement:(id)a3 badgeImageFactory:(id)a4 localizationProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10067392C(v8, v9, v10);
}

- (void)setImageHidden:(BOOL)a3
{
}

- (CGRect)badgeRect
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementBadgeView);
  id v3 = self;
  [v2 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  UIEdgeInsets.init(uniform:)();
  double v13 = v12;
  double v15 = v14;

  double v16 = sub_1002E8388(v5, v7, v9, v11, v13, v15);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementBadgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_achievementCellContentView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailAwardTableViewCell_insetView);
}

@end