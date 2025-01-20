@interface NSExtension(SafariFoundationExtras)
- (BOOL)_sf_credentialProviderExtensionNeedsToDeclarePasswordSupport;
- (id)sf_bundleIdentifierForContainingApp;
- (void)_sf_addHandlerForRequestIdentifier:()SafariFoundationExtras withBlock:;
- (void)_sf_credentialProviderExtensionNeedsToDeclarePasswordSupport;
@end

@implementation NSExtension(SafariFoundationExtras)

- (id)sf_bundleIdentifierForContainingApp
{
  v1 = [a1 _plugIn];
  v2 = [v1 containingUrl];

  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithURL:v2 allowPlaceholder:0 error:0];
    v4 = [v3 bundleIdentifier];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_sf_addHandlerForRequestIdentifier:()SafariFoundationExtras withBlock:
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&registrationLock);
    char v18 = 0;
    v9 = getFinishHandlersForExtension(a1, &v18);
    v10 = (void *)MEMORY[0x21D47DB00](v8);
    [v9 setObject:v10 forKeyedSubscript:v6];

    if (v18)
    {
      objc_initWeak(&location, a1);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __84__NSExtension_SafariFoundationExtras___sf_addHandlerForRequestIdentifier_withBlock___block_invoke;
      v15[3] = &unk_264390F88;
      objc_copyWeak(&v16, &location);
      [a1 setRequestCompletionBlock:v15];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __84__NSExtension_SafariFoundationExtras___sf_addHandlerForRequestIdentifier_withBlock___block_invoke_2;
      v13[3] = &unk_264390FB0;
      objc_copyWeak(&v14, &location);
      [a1 setRequestCancellationBlock:v13];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __84__NSExtension_SafariFoundationExtras___sf_addHandlerForRequestIdentifier_withBlock___block_invoke_3;
      v11[3] = &unk_264390FD8;
      objc_copyWeak(&v12, &location);
      [a1 setRequestInterruptionBlock:v11];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&registrationLock);
  }
}

- (BOOL)_sf_credentialProviderExtensionNeedsToDeclarePasswordSupport
{
  id v2 = objc_alloc(MEMORY[0x263F01858]);
  v3 = [a1 identifier];
  id v14 = 0;
  v4 = (void *)[v2 initWithBundleIdentifier:v3 error:&v14];
  id v5 = v14;

  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(NSExtension(SafariFoundationExtras) *)(uint64_t)v5 _sf_credentialProviderExtensionNeedsToDeclarePasswordSupport];
    }
    goto LABEL_6;
  }
  unsigned int v7 = [v4 platform] - 1;
  if (v7 > 0xB || ((0xC63u >> v7) & 1) == 0)
  {
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = qword_218FE64B8[v7];
  v11 = [v4 SDKVersion];
  id v12 = [v11 componentsSeparatedByString:@"."];
  v13 = [v12 firstObject];

  if ([v13 length]) {
    BOOL v8 = v10 <= (int)[v13 intValue];
  }
  else {
    BOOL v8 = 0;
  }

LABEL_7:
  return v8;
}

- (void)_sf_credentialProviderExtensionNeedsToDeclarePasswordSupport
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218FBF000, a2, OS_LOG_TYPE_ERROR, "Failed to get application extension record: %@", (uint8_t *)&v2, 0xCu);
}

@end