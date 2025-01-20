@interface SearchUILaunchAppHandler
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
+ (void)openApplicationWithBundleIdentifier:(id)a3 environment:(id)a4;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUILaunchAppHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4 = a3;
  v5 = [v4 identifyingResult];
  v6 = [v5 applicationBundleIdentifier];
  v7 = [v4 results];

  if ([v7 count] == 1 && (objc_msgSend(v5, "isLocalApplicationResult") & 1) != 0)
  {
    v8 = +[SearchUIUtilities bundleIdentifierForApp:0];
    char v9 = [v6 isEqualToString:v8];

    v10 = 0;
    if ((v9 & 1) == 0)
    {
      v10 = objc_opt_new();
      [v10 setApplicationBundleIdentifier:v6];
    }
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  v8 = objc_opt_class();
  id v9 = [v7 applicationBundleIdentifier];

  [v8 openApplicationWithBundleIdentifier:v9 environment:v6];
}

+ (void)openApplicationWithBundleIdentifier:(id)a3 environment:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (!+[SearchUIUtilities downloadDemotedAppIfNecessaryForBundleIdentifier:v11 presentingViewControllerForExplanationAlert:0])
  {
    if (openApplicationWithBundleIdentifier_environment__onceToken != -1) {
      dispatch_once(&openApplicationWithBundleIdentifier_environment__onceToken, &__block_literal_global_22);
    }
    id v6 = (void *)MEMORY[0x1E4F1CA60];
    id v7 = +[SearchUIUtilities openApplicationOptions];
    v8 = [v6 dictionaryWithDictionary:v7];

    if (([v5 modifierFlags] & 0x20000) != 0)
    {
      id v9 = [NSNumber numberWithBool:1];
      [v8 setObject:v9 forKey:*MEMORY[0x1E4FA70F0]];
    }
    v10 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v8];
    [(id)openApplicationWithBundleIdentifier_environment__openApplicationService openApplication:v11 withOptions:v10 completion:&__block_literal_global_16];
  }
}

uint64_t __76__SearchUILaunchAppHandler_openApplicationWithBundleIdentifier_environment___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  uint64_t v1 = openApplicationWithBundleIdentifier_environment__openApplicationService;
  openApplicationWithBundleIdentifier_environment__openApplicationService = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __76__SearchUILaunchAppHandler_openApplicationWithBundleIdentifier_environment___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = SearchUIGeneralLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__SearchUILaunchAppHandler_openApplicationWithBundleIdentifier_environment___block_invoke_2_cold_1((uint64_t)v3, v4);
    }
  }
}

void __76__SearchUILaunchAppHandler_openApplicationWithBundleIdentifier_environment___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Failed to open application with error %@", (uint8_t *)&v2, 0xCu);
}

@end