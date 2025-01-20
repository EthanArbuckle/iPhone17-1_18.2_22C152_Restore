@interface TranslationFeedbackActivity
- (BOOL)canPerformWithTranslationContext:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (int64_t)actionType;
- (void)performActivityWithTranslationContext:(id)a3;
@end

@implementation TranslationFeedbackActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return @"exclamationmark.circle";
}

- (int64_t)actionType
{
  return 15;
}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  return [a3 hasStartedTranslating];
}

- (void)performActivityWithTranslationContext:(id)a3
{
  [a3 requestSendFeedbackWithCompletionHandler:0];
  [(_SFActivity *)self activityDidFinish:1];
}

@end