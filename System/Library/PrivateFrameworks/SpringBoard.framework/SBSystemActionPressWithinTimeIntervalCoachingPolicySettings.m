@interface SBSystemActionPressWithinTimeIntervalCoachingPolicySettings
+ (id)settingsControllerModule;
- (double)timeInterval;
- (unint64_t)presentationThresholdForActionsWithStatefulPreviews;
- (unint64_t)presentationThresholdForActionsWithStatelessPreviews;
- (void)setDefaultValues;
- (void)setPresentationThresholdForActionsWithStatefulPreviews:(unint64_t)a3;
- (void)setPresentationThresholdForActionsWithStatelessPreviews:(unint64_t)a3;
- (void)setTimeInterval:(double)a3;
@end

@implementation SBSystemActionPressWithinTimeIntervalCoachingPolicySettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionPressWithinTimeIntervalCoachingPolicySettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBSystemActionPressWithinTimeIntervalCoachingPolicySettings *)self setPresentationThresholdForActionsWithStatefulPreviews:2];
  [(SBSystemActionPressWithinTimeIntervalCoachingPolicySettings *)self setPresentationThresholdForActionsWithStatelessPreviews:1];
  [(SBSystemActionPressWithinTimeIntervalCoachingPolicySettings *)self setTimeInterval:5.0];
}

+ (id)settingsControllerModule
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  objc_super v3 = [MEMORY[0x1E4F94110] rowWithTitle:@"Actions With Stateful Previews" valueKeyPath:@"presentationThresholdForActionsWithStatefulPreviews"];
  v4 = [v3 possibleValues:&unk_1F3347598 titles:&unk_1F33475B0];
  v20[0] = v4;
  v5 = [MEMORY[0x1E4F94110] rowWithTitle:@"Actions With Stateless Previews" valueKeyPath:@"presentationThresholdForActionsWithStatelessPreviews"];
  v6 = [v5 possibleValues:&unk_1F3347598 titles:&unk_1F33475B0];
  v20[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v8 = [v2 sectionWithRows:v7 title:@"Number of Presses to Present Coaching"];

  v9 = (void *)MEMORY[0x1E4F94168];
  v10 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Time Interval" valueKeyPath:@"timeInterval"];
  v11 = [v10 minValue:1.0 maxValue:10.0];
  v19 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v13 = [v9 sectionWithRows:v12 title:@"Timing"];

  v14 = (void *)MEMORY[0x1E4F94168];
  v18[0] = v8;
  v18[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = [v14 moduleWithTitle:@"Track Previews Policy" contents:v15];

  return v16;
}

- (unint64_t)presentationThresholdForActionsWithStatefulPreviews
{
  return self->_presentationThresholdForActionsWithStatefulPreviews;
}

- (void)setPresentationThresholdForActionsWithStatefulPreviews:(unint64_t)a3
{
  self->_presentationThresholdForActionsWithStatefulPreviews = a3;
}

- (unint64_t)presentationThresholdForActionsWithStatelessPreviews
{
  return self->_presentationThresholdForActionsWithStatelessPreviews;
}

- (void)setPresentationThresholdForActionsWithStatelessPreviews:(unint64_t)a3
{
  self->_presentationThresholdForActionsWithStatelessPreviews = a3;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

@end