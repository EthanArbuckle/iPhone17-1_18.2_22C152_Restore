@interface CHWorkoutCellImageLabelView
- (CHWorkoutCellImageLabelView)initWithCoder:(id)a3;
- (CHWorkoutCellImageLabelView)initWithFrame:(CGRect)a3;
- (double)preferredHeightForWidth:(double)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)setWorkout:(id)a3 fitnessAppContext:(id)a4 formattingManager:(id)a5 achievementCount:(int64_t)a6 completion:(id)a7;
@end

@implementation CHWorkoutCellImageLabelView

- (CHWorkoutCellImageLabelView)initWithFrame:(CGRect)a3
{
  return (CHWorkoutCellImageLabelView *)sub_10071678C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setWorkout:(id)a3 fitnessAppContext:(id)a4 formattingManager:(id)a5 achievementCount:(int64_t)a6 completion:(id)a7
{
  v12 = _Block_copy(a7);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    v12 = sub_100719A80;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  sub_100717ADC(v14, v15, v16, a6, 1, (uint64_t)v12, v13);
  sub_10005E5F8((uint64_t)v12);
}

- (void)setShowsSeparator:(BOOL)a3
{
}

- (double)preferredHeightForWidth:(double)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[CHWorkoutCellImageLabelView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 1.79769313e308, v3, v4);
  return v5;
}

- (CHWorkoutCellImageLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1007196D4();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHWorkoutCellImageLabelView_separatorView);
}

@end