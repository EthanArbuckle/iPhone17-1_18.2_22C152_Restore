@interface TranslationRadarActivity
- (BOOL)canPerformWithTranslationContext:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (int64_t)actionType;
- (void)performActivityWithTranslationContext:(id)a3;
@end

@implementation TranslationRadarActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return @"ant";
}

- (int64_t)actionType
{
  return 16;
}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  id v3 = a3;
  if (showInternalTranslationActions()) {
    char v4 = [v3 hasStartedTranslating];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)performActivityWithTranslationContext:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__TranslationRadarActivity_performActivityWithTranslationContext___block_invoke;
  v4[3] = &unk_1E6D79030;
  v4[4] = self;
  [a3 generateDiagnosticDataForPurpose:1 completionHandler:v4];
  [(_SFActivity *)self activityDidFinish:1];
}

void __66__TranslationRadarActivity_performActivityWithTranslationContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 saveDiagnosticDataAsTemporaryFiles];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__TranslationRadarActivity_performActivityWithTranslationContext___block_invoke_2;
  v6[3] = &unk_1E6D77D90;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __66__TranslationRadarActivity_performActivityWithTranslationContext___block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F98BD0]);
  id v3 = [MEMORY[0x1E4F98BD8] safariIOS];
  uint64_t v4 = (void *)[v2 initWithComponent:v3 title:@"Webpage Translation Issue: " descriptionTemplate:@"Translation debug info that includes the URL and all text from the webpage has been attached to this radar. Please describe the issue you're seeing in detail and the steps taken leading up to this issue."];

  [v4 setAttachmentPaths:*(void *)(a1 + 32)];
  v11[0] = @"1225093";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v4 setKeywords:v5];

  v6 = [*(id *)(a1 + 40) tabDocument];
  id v7 = [v6 activeWebView];
  uint64_t v8 = [v7 window];
  v9 = [v8 windowScene];
  v10 = [v4 continueInTapToRadarURL];
  [v9 openURL:v10 options:0 completionHandler:0];
}

@end