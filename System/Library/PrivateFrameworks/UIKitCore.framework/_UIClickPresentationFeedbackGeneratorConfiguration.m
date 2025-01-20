@interface _UIClickPresentationFeedbackGeneratorConfiguration
+ (id)defaultConfiguration;
- (NSString)hidDraggedPatternName;
- (NSString)hidPreviewedPatternName;
- (_UIFeedbackDiscretePlayable)draggedPattern;
- (_UIFeedbackDiscretePlayable)previewedPattern;
- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5;
- (id)feedbackKeyPaths;
- (id)hidFeedbackPatternNameKeyPaths;
- (int64_t)requiredPeripheralSupportLevel;
- (int64_t)requiredSupportLevel;
@end

@implementation _UIClickPresentationFeedbackGeneratorConfiguration

+ (id)defaultConfiguration
{
  return (id)[a1 _configurationWithKey:@"default" preparationBlock:&__block_literal_global_10_11];
}

- (int64_t)requiredSupportLevel
{
  return 1;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

- (_UIFeedbackDiscretePlayable)previewedPattern
{
  if (qword_1EB264808 != -1) {
    dispatch_once(&qword_1EB264808, &__block_literal_global_572);
  }
  v2 = (void *)_MergedGlobals_1268;
  return (_UIFeedbackDiscretePlayable *)v2;
}

- (_UIFeedbackDiscretePlayable)draggedPattern
{
  if (qword_1EB264818 != -1) {
    dispatch_once(&qword_1EB264818, &__block_literal_global_3_10);
  }
  v2 = (void *)qword_1EB264810;
  return (_UIFeedbackDiscretePlayable *)v2;
}

- (NSString)hidPreviewedPatternName
{
  return (NSString *)@"context_menu";
}

- (NSString)hidDraggedPatternName
{
  return (NSString *)@"drag_drop_table_edit";
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8 = a3;
  v9 = [(_UIClickPresentationFeedbackGeneratorConfiguration *)self previewedPattern];
  int v10 = [v8 isEqual:v9];

  if (v10) {
    [(_UIClickPresentationFeedbackGeneratorConfiguration *)self hidPreviewedPatternName];
  }
  else {
  v11 = [(_UIClickPresentationFeedbackGeneratorConfiguration *)self hidDraggedPatternName];
  }
  v12 = +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:v11 deviceType:a4 senderID:a5];

  return v12;
}

- (id)feedbackKeyPaths
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIClickPresentationFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorUserInteractionDrivenConfiguration *)&v9 feedbackKeyPaths];
  v3 = NSStringFromSelector(sel_previewedPattern);
  v10[0] = v3;
  v4 = NSStringFromSelector(sel_poppedPattern);
  v10[1] = v4;
  v5 = NSStringFromSelector(sel_draggedPattern);
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  v7 = [v2 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIClickPresentationFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v9 hidFeedbackPatternNameKeyPaths];
  v3 = NSStringFromSelector(sel_hidPreviewedPatternName);
  v10[0] = v3;
  v4 = NSStringFromSelector(sel_hidPoppedPatternName);
  v10[1] = v4;
  v5 = NSStringFromSelector(sel_hidDraggedPatternName);
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  v7 = [v2 arrayByAddingObjectsFromArray:v6];

  return v7;
}

@end