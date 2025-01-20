@interface SBSystemActionTrackPreviewsCoachingPolicySettings
+ (id)settingsControllerModule;
- (unint64_t)presentationThresholdForActionsWithStatefulPreviews;
- (unint64_t)presentationThresholdForActionsWithStatelessPreviews;
- (void)setDefaultValues;
- (void)setPresentationThresholdForActionsWithStatefulPreviews:(unint64_t)a3;
- (void)setPresentationThresholdForActionsWithStatelessPreviews:(unint64_t)a3;
@end

@implementation SBSystemActionTrackPreviewsCoachingPolicySettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionTrackPreviewsCoachingPolicySettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBSystemActionTrackPreviewsCoachingPolicySettings *)self setPresentationThresholdForActionsWithStatefulPreviews:2];
  [(SBSystemActionTrackPreviewsCoachingPolicySettings *)self setPresentationThresholdForActionsWithStatelessPreviews:1];
}

+ (id)settingsControllerModule
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  objc_super v3 = [MEMORY[0x1E4F94110] rowWithTitle:@"Actions With Stateful Previews" valueKeyPath:@"presentationThresholdForActionsWithStatefulPreviews"];
  v4 = [v3 possibleValues:&unk_1F3348000 titles:&unk_1F3348018];
  v14[0] = v4;
  v5 = [MEMORY[0x1E4F94110] rowWithTitle:@"Actions With Stateless Previews" valueKeyPath:@"presentationThresholdForActionsWithStatelessPreviews"];
  v6 = [v5 possibleValues:&unk_1F3348000 titles:&unk_1F3348018];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v8 = [v2 sectionWithRows:v7 title:@"Number of Presses to Present Coaching"];

  v9 = (void *)MEMORY[0x1E4F94168];
  v13 = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11 = [v9 moduleWithTitle:@"Track Previews Policy" contents:v10];

  return v11;
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

@end