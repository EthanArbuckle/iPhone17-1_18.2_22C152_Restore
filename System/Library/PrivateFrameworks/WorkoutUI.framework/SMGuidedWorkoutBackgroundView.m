@interface SMGuidedWorkoutBackgroundView
- (SMGuidedWorkoutBackgroundView)initWithCoder:(id)a3;
- (SMGuidedWorkoutBackgroundView)initWithCornerRadius:(double)a3;
- (SMGuidedWorkoutBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setImage:(id)a3 WithMediaType:(id)a4;
- (void)updateWithActiveAppearance:(int64_t)a3;
@end

@implementation SMGuidedWorkoutBackgroundView

- (SMGuidedWorkoutBackgroundView)initWithCornerRadius:(double)a3
{
  return (SMGuidedWorkoutBackgroundView *)GuidedWorkoutBackgroundView.init(cornerRadius:)(a3);
}

- (SMGuidedWorkoutBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_261B316F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_261B30950();
}

- (void)setImage:(id)a3 WithMediaType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_261B30B90(a3, a4);
}

- (void)updateWithActiveAppearance:(int64_t)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SMGuidedWorkoutBackgroundView_vignetteView);
  if (v3)
  {
    v5 = self;
    id v6 = v3;
    sub_261B1B900(a3);
  }
}

- (SMGuidedWorkoutBackgroundView)initWithFrame:(CGRect)a3
{
  result = (SMGuidedWorkoutBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SMGuidedWorkoutBackgroundView_vignetteView);
}

@end