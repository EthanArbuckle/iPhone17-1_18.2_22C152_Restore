@interface TranslationToAutoLocaleActivity
- (BOOL)canPerformWithTranslationContext:(id)a3;
- (id)activityTitleWithTranslationContext:(id)a3;
- (int64_t)actionType;
- (void)performActivityWithTranslationContext:(id)a3;
@end

@implementation TranslationToAutoLocaleActivity

- (id)activityTitleWithTranslationContext:(id)a3
{
  v3 = [a3 availableTargetLocaleIdentifiers];
  v4 = [v3 firstObject];

  v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "safari_displayNameForLocaleIdentifier:", v4);
  v6 = NSString;
  v7 = _WBSLocalizedString();
  v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5);

  return v8;
}

- (int64_t)actionType
{
  return 12;
}

- (void)performActivityWithTranslationContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 availableTargetLocaleIdentifiers];
  id v6 = [v5 firstObject];

  [v4 requestTranslatingWebpageToLocale:v6 completionHandler:0];
  [(_SFActivity *)self activityDidFinish:1];
}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  id v3 = a3;
  if ([v3 hasStartedTranslating])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [v3 availableTargetLocaleIdentifiers];
    BOOL v4 = [v5 count] == 1;
  }
  return v4;
}

@end