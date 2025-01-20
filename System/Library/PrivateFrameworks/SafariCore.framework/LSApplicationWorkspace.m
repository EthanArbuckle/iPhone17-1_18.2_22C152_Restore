@interface LSApplicationWorkspace
@end

@implementation LSApplicationWorkspace

void __133__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultURLHandlerForScheme_toApplicationWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __133__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultURLHandlerForScheme_toApplicationWithBundleIdentifier_completionHandler___block_invoke_cold_1(a1, v7, v5);
    }
    v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
}

void __168__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier_shouldFallBackToSystemHandlerIfNeeded_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (*(unsigned char *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", @"otpauth", @"com.apple.Preferences", *(void *)(a1 + 40));
      goto LABEL_7;
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
LABEL_7:
}

void __177__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier_shouldFallBackToSystemHandlerIfNeeded_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (*(unsigned char *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", @"otpauth-migration", @"com.apple.Preferences", *(void *)(a1 + 40));
      goto LABEL_7;
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
LABEL_7:
}

void __133__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultURLHandlerForScheme_toApplicationWithBundleIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  v7 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v8 = 138412802;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_1B728F000, v6, OS_LOG_TYPE_ERROR, "Failed to set default URL handler for scheme %@ to bundle ID %@; error=%{public}@",
    (uint8_t *)&v8,
    0x20u);
}

@end