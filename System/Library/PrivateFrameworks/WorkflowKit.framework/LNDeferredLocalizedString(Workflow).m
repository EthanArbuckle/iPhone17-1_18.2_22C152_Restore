@interface LNDeferredLocalizedString(Workflow)
- (void)wf_getLocalizedStringWithCompletionHandler:()Workflow;
@end

@implementation LNDeferredLocalizedString(Workflow)

- (void)wf_getLocalizedStringWithCompletionHandler:()Workflow
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F72B68]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = [v6 localeIdentifier];
  v8 = (void *)[v5 initWithPrintedString:a1 spokenString:0 localeIdentifier:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__LNDeferredLocalizedString_Workflow__wf_getLocalizedStringWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6554028;
  id v11 = v4;
  id v9 = v4;
  [v8 getResultWithCompletionHandler:v10];
}

@end