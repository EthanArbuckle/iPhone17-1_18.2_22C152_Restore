@interface LSApplicationWorkspace(SafariCoreExtras)
- (uint64_t)safari_setAppleOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:;
- (uint64_t)safari_setAppleOTPAuthURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:;
- (uint64_t)safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:;
- (uint64_t)safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:;
- (void)safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras shouldFallBackToSystemHandlerIfNeeded:completionHandler:;
- (void)safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras shouldFallBackToSystemHandlerIfNeeded:completionHandler:;
- (void)safari_setDefaultURLHandlerForScheme:()SafariCoreExtras toApplicationWithBundleIdentifier:completionHandler:;
@end

@implementation LSApplicationWorkspace(SafariCoreExtras)

- (void)safari_setDefaultURLHandlerForScheme:()SafariCoreExtras toApplicationWithBundleIdentifier:completionHandler:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXOther();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1B728F000, v11, OS_LOG_TYPE_INFO, "Attempting to set default URL handler for scheme %@ to bundle ID %@", buf, 0x16u);
  }
  id v19 = 0;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:&v19];
  id v13 = v19;
  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __133__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultURLHandlerForScheme_toApplicationWithBundleIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E615B220;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    [a1 setDefaultURLHandlerForScheme:v16 to:v12 completion:v15];
  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace(SafariCoreExtras) safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:]((uint64_t)v9, v14, v13);
    }
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
  }
}

- (void)safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras shouldFallBackToSystemHandlerIfNeeded:completionHandler:
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __168__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier_shouldFallBackToSystemHandlerIfNeeded_completionHandler___block_invoke;
  v10[3] = &unk_1E615B248;
  char v12 = a4;
  v10[4] = a1;
  id v11 = v8;
  id v9 = v8;
  objc_msgSend(a1, "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", @"otpauth", a3, v10);
}

- (uint64_t)safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:
{
  return objc_msgSend(a1, "safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier:shouldFallBackToSystemHandlerIfNeeded:completionHandler:", a3, 1, a4);
}

- (uint64_t)safari_setAppleOTPAuthURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:
{
  return objc_msgSend(a1, "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", @"apple-otpauth", a3, a4);
}

- (void)safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras shouldFallBackToSystemHandlerIfNeeded:completionHandler:
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __177__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier_shouldFallBackToSystemHandlerIfNeeded_completionHandler___block_invoke;
  v10[3] = &unk_1E615B248;
  char v12 = a4;
  v10[4] = a1;
  id v11 = v8;
  id v9 = v8;
  objc_msgSend(a1, "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", @"otpauth-migration", a3, v10);
}

- (uint64_t)safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:
{
  return objc_msgSend(a1, "safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:shouldFallBackToSystemHandlerIfNeeded:completionHandler:", a3, 1, a4);
}

- (uint64_t)safari_setAppleOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:
{
  return objc_msgSend(a1, "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", @"apple-otpauth-migration", a3, a4);
}

- (void)safari_setDefaultURLHandlerForScheme:()SafariCoreExtras toApplicationWithBundleIdentifier:completionHandler:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1B728F000, v5, OS_LOG_TYPE_ERROR, "Failed to load application record for bundle ID %@; error=%{public}@",
    (uint8_t *)&v7,
    0x16u);
}

@end