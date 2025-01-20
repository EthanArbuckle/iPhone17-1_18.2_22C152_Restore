@interface TranslationToChosenLocaleActivity
- (BOOL)canPerformWithTranslationContext:(id)a3;
- (BOOL)translationAlertControllerShouldDismissAfterSelection:(id)a3;
- (id)activityTitle;
- (id)activityViewController;
- (int64_t)actionType;
- (void)prepareWithTranslationContext:(id)a3;
- (void)translationAlertController:(id)a3 didSelectLocale:(id)a4;
- (void)translationAlertController:(id)a3 validateTargetLocale:(id)a4 completionHandler:(id)a5;
@end

@implementation TranslationToChosenLocaleActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (int64_t)actionType
{
  return 11;
}

- (void)prepareWithTranslationContext:(id)a3
{
  if (!self->_activityViewController)
  {
    v4 = (void *)MEMORY[0x1E4F3B098];
    v5 = [a3 allowedTargetLocaleIdentifiers];
    v6 = [v4 translationAlertControllerWithDelegate:self localeIdentifiers:v5];

    v7 = [(_SFActivity *)self delegate];
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [v7 provenanceForSafariActivity:self];
    }
    else {
      uint64_t v8 = 0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__TranslationToChosenLocaleActivity_prepareWithTranslationContext___block_invoke;
    v10[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
    v10[4] = v8;
    [(UIViewController *)v6 setAnalyticsHandler:v10];
    activityViewController = self->_activityViewController;
    self->_activityViewController = v6;
  }
}

void __67__TranslationToChosenLocaleActivity_prepareWithTranslationContext___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 12;
  }
  else {
    uint64_t v3 = 13;
  }
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v4, "_sf_didPerformFormatMenuAction:provenance:", v3, *(void *)(a1 + 32));
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
    BOOL v4 = (unint64_t)[v5 count] > 1;
  }
  return v4;
}

- (void)translationAlertController:(id)a3 didSelectLocale:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    v7 = [(TranslationActivity *)self translationContext];
    [v7 requestTranslatingWebpageToLocale:v6 completionHandler:0];
  }
  [(_SFActivity *)self activityDidFinish:a4 != 0];
}

- (void)translationAlertController:(id)a3 validateTargetLocale:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(TranslationActivity *)self translationContext];
  [v9 validateTargetLocale:v8 completionHandler:v7];
}

- (BOOL)translationAlertControllerShouldDismissAfterSelection:(id)a3
{
  return 0;
}

- (id)activityViewController
{
  return self->_activityViewController;
}

- (void).cxx_destruct
{
}

@end