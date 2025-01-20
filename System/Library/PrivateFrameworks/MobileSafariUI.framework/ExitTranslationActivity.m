@interface ExitTranslationActivity
- (BOOL)canPerformWithTranslationContext:(id)a3;
- (id)activityTitle;
- (int64_t)actionType;
- (void)performActivityWithTranslationContext:(id)a3;
@end

@implementation ExitTranslationActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (int64_t)actionType
{
  return 14;
}

- (void)performActivityWithTranslationContext:(id)a3
{
  [a3 reloadPageInOriginalLanguage];
  [(_SFActivity *)self activityDidFinish:1];
}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  return [a3 hasStartedTranslating];
}

@end