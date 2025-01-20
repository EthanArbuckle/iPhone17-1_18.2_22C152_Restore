@interface WBSAppLink
+ (void)clearSavedSettings;
- (BOOL)_isApplicationProxyAppleNews:(id)a3;
- (BOOL)isAppleNewsLink;
- (LSApplicationProxy)synchronousTargetApplicationProxy;
- (NSURL)url;
- (WBSAppLink)initWithURL:(id)a3;
- (id)_synchronouslyFetchAppLinkWithError:(id *)a3;
- (int64_t)_openStrategyForAppLink:(id)a3;
- (int64_t)synchronouslyDecideOpenStrategy;
- (void)_appLink:(id)a3 getAppLinkLabel:(id *)a4 name:(id *)a5 bundleIdentifier:(id *)a6 icon:(id *)a7;
- (void)_getAppLinkForBanner:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)decideOpenStrategyWithCompletionHandler:(id)a3;
- (void)disable;
- (void)disableWithCompletionHandler:(id)a3;
- (void)getAppLinkAttributesWithCompletionHandler:(id)a3;
- (void)getAppLinkLabel:(id *)a3 name:(id *)a4 bundleIdentifier:(id *)a5 icon:(id *)a6;
- (void)getAppLinkTargetApplicationBundleIdentifierWithCompletionHandler:(id)a3;
- (void)openExternally;
- (void)openExternallyWithWebBrowserState:(id)a3 referrerURL:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSAppLink

- (WBSAppLink)initWithURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSAppLink;
  v6 = [(WBSAppLink *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_ivarLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = v7;
  }

  return v7;
}

- (LSApplicationProxy)synchronousTargetApplicationProxy
{
  v2 = [(WBSAppLink *)self _synchronouslyFetchAppLinkWithError:0];
  v3 = [v2 targetApplicationProxy];

  return (LSApplicationProxy *)v3;
}

- (BOOL)isAppleNewsLink
{
  v2 = self;
  v3 = [(WBSAppLink *)self _synchronouslyFetchAppLinkWithError:0];
  v4 = [v3 targetApplicationProxy];
  LOBYTE(v2) = [(WBSAppLink *)v2 _isApplicationProxyAppleNews:v4];

  return (char)v2;
}

+ (void)clearSavedSettings
{
}

- (void)decideOpenStrategyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__WBSAppLink_decideOpenStrategyWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5E40B98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSAppLink *)self _getAppLinkForBanner:0 withCompletionHandler:v6];
}

uint64_t __54__WBSAppLink_decideOpenStrategyWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _openStrategyForAppLink:a2];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)getAppLinkTargetApplicationBundleIdentifierWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__WBSAppLink_getAppLinkTargetApplicationBundleIdentifierWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5E40BC0;
  id v7 = v4;
  id v5 = v4;
  [(WBSAppLink *)self _getAppLinkForBanner:0 withCompletionHandler:v6];
}

void __79__WBSAppLink_getAppLinkTargetApplicationBundleIdentifierWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 targetApplicationProxy];
  uint64_t v3 = [v4 bundleIdentifier];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (int64_t)synchronouslyDecideOpenStrategy
{
  uint64_t v3 = [(WBSAppLink *)self _synchronouslyFetchAppLinkWithError:0];
  int64_t v4 = [(WBSAppLink *)self _openStrategyForAppLink:v3];

  return v4;
}

- (void)getAppLinkAttributesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__WBSAppLink_getAppLinkAttributesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5E40BE8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSAppLink *)self _getAppLinkForBanner:0 withCompletionHandler:v6];
}

void __56__WBSAppLink_getAppLinkAttributesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v10 = 0;
  id v11 = 0;
  id v8 = 0;
  id v9 = 0;
  [v3 _appLink:a2 getAppLinkLabel:&v11 name:&v10 bundleIdentifier:&v9 icon:&v8];
  id v4 = v11;
  id v5 = v10;
  id v6 = v9;
  id v7 = v8;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getAppLinkLabel:(id *)a3 name:(id *)a4 bundleIdentifier:(id *)a5 icon:(id *)a6
{
  id v11 = [(WBSAppLink *)self _synchronouslyFetchAppLinkWithError:0];
  [(WBSAppLink *)self _appLink:v11 getAppLinkLabel:a3 name:a4 bundleIdentifier:a5 icon:a6];
}

- (void)openExternallyWithWebBrowserState:(id)a3 referrerURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    id v10 = a5;
  }
  else {
    id v10 = &__block_literal_global_2;
  }
  id v11 = (void *)MEMORY[0x1AD115160](v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5E40C58;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v11;
  [(WBSAppLink *)self _getAppLinkForBanner:0 withCompletionHandler:v15];
}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v16 = 0;
    char v7 = [v5 setEnabled:1 error:&v16];
    id v8 = v16;
    if ((v7 & 1) == 0)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_2(a1, v9);
      }
    }
    if (*(void *)(a1 + 40) || *(void *)(a1 + 48))
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F224A0]);
      [v10 setReferrerURL:*(void *)(a1 + 48)];
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11)
      {
        uint64_t v17 = *MEMORY[0x1E4F62610];
        v18[0] = v11;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
        [v10 setFrontBoardOptions:v12];
      }
    }
    else
    {
      id v10 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_4;
    v14[3] = &unk_1E5E40C30;
    v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 56);
    [v5 openWithConfiguration:v10 completionHandler:v14];
  }
  else
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_1(a1, v13);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
  char v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24);
      int v9 = 138739971;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_INFO, "Opened App Link externally for URL %{sensitive}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_4_cold_1(a1, v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)openExternally
{
}

- (void)disable
{
}

- (void)disableWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__WBSAppLink_disableWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5E40BE8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSAppLink *)self _getAppLinkForBanner:0 withCompletionHandler:v6];
}

void __43__WBSAppLink_disableWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v10 = 0;
    char v6 = [a2 setEnabled:0 error:&v10];
    id v7 = v10;
    if ((v6 & 1) == 0)
    {
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_2(a1, v8);
      }
    }
    (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7 == 0);
  }
  else
  {
    int v9 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __43__WBSAppLink_disableWithCompletionHandler___block_invoke_cold_1(a1, v9);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_getAppLinkForBanner:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v5 = (void (**)(id, LSAppLink *, void))a4;
  os_unfair_lock_lock(&self->_ivarLock);
  char v6 = self->_cachedAppLink;
  BOOL didResolveAppLink = self->_didResolveAppLink;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (didResolveAppLink)
  {
    v5[2](v5, v6, 0);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F22398];
    url = self->_url;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__WBSAppLink__getAppLinkForBanner_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E5E40BE8;
    v10[4] = self;
    uint64_t v11 = v5;
    [v8 getAppLinkWithURL:url completionHandler:v10];
  }
}

void __57__WBSAppLink__getAppLinkForBanner_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24);
      int v9 = v7;
      id v10 = objc_msgSend(v6, "safari_privacyPreservingDescription");
      int v14 = 138740227;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_INFO, "Failed to resolve App Link for URL %{sensitive}@ with error %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 12) = 1;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 16);
  *(void *)(v11 + 16) = v5;
  id v13 = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_synchronouslyFetchAppLinkWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  id v6 = self->_cachedAppLink;
  BOOL didResolveAppLink = self->_didResolveAppLink;
  os_unfair_lock_unlock(p_ivarLock);
  if (didResolveAppLink)
  {
    uint64_t v8 = v6;
  }
  else
  {
    int v9 = [MEMORY[0x1E4F22398] appLinksWithURL:self->_url limit:1 error:a3];
    uint64_t v8 = [v9 firstObject];

    if (!v8)
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        url = self->_url;
        id v12 = v10;
        id v13 = objc_msgSend(0, "safari_privacyPreservingDescription");
        int v15 = 138740227;
        __int16 v16 = url;
        __int16 v17 = 2114;
        uint64_t v18 = v13;
        _os_log_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_INFO, "Failed to synchronously resolve App Link for URL %{sensitive}@ with error %{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
    os_unfair_lock_lock(p_ivarLock);
    self->_BOOL didResolveAppLink = 1;
    objc_storeStrong((id *)&self->_cachedAppLink, v8);
    os_unfair_lock_unlock(p_ivarLock);
    if (a3) {
      *a3 = 0;
    }
  }

  return v8;
}

- (int64_t)_openStrategyForAppLink:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 isEnabled]) {
    return 3;
  }
  return 1;
}

- (void)_appLink:(id)a3 getAppLinkLabel:(id *)a4 name:(id *)a5 bundleIdentifier:(id *)a6 icon:(id *)a7
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v12 = [a3 targetApplicationProxy];
  id v13 = [v12 bundleIdentifier];
  if (objc_msgSend(MEMORY[0x1E4F28B50], "safari_isICloudAppWithBundleIdentifier:", v13))
  {
    uint64_t v14 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:*MEMORY[0x1E4F98918]];

    id v12 = (void *)v14;
  }
  if (!((unint64_t)a4 | (unint64_t)a5))
  {
    int v15 = 0;
    __int16 v16 = 0;
LABEL_11:
    if (!a7) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  int v15 = [v12 localizedName];
  if (v15)
  {
    __int16 v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15];
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  __int16 v16 = 0;
  if (a5) {
LABEL_6:
  }
    *a5 = v15;
LABEL_7:
  if (!a4) {
    goto LABEL_11;
  }
  __int16 v17 = [v12 itemName];
  if (v17)
  {
    id v18 = (id) [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v17];
    *a4 = v18;
  }
  else
  {
    *a4 = v16;
  }

  if (a7)
  {
LABEL_12:
    *a7 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v12 format:0];
  }
LABEL_13:
  if (a6) {
    *a6 = v13;
  }
  if (a4 && [(WBSAppLink *)self _isApplicationProxyAppleNews:v12])
  {
    if (shouldShowAlternateNewsUniversalLinksFormatting_onceToken != -1) {
      dispatch_once(&shouldShowAlternateNewsUniversalLinksFormatting_onceToken, &__block_literal_global_65);
    }
    if (shouldShowAlternateNewsUniversalLinksFormatting_shouldShowAlternateNewsUniversalLinksFormatting)
    {
      v35 = _WBSLocalizedString();
      v38 = _WBSLocalizedString();
      v39 = objc_msgSend(MEMORY[0x1E4F42A38], "safari_preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F438C8]);
      v36 = [v39 fontDescriptorWithSymbolicTraits:2];
      uint64_t v44 = *MEMORY[0x1E4F24498];
      v45[0] = *MEMORY[0x1E4F244C0];
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      v37 = [v39 fontDescriptorByAddingAttributes:v19];

      v20 = (void *)MEMORY[0x1E4F42A30];
      [MEMORY[0x1E4F42A30] systemFontSize];
      v34 = objc_msgSend(v20, "fontWithDescriptor:size:", v37);
      v21 = (void *)MEMORY[0x1E4F42A30];
      [MEMORY[0x1E4F42A30] systemFontSize];
      v22 = objc_msgSend(v21, "fontWithDescriptor:size:", v36);
      id v23 = objc_alloc(MEMORY[0x1E4F28E48]);
      uint64_t v42 = *MEMORY[0x1E4F42508];
      uint64_t v24 = v42;
      v43 = v22;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      v33 = (void *)[v23 initWithString:v35 attributes:v25];

      id v26 = objc_alloc(MEMORY[0x1E4F28E48]);
      uint64_t v40 = v24;
      v41 = v34;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v28 = (void *)[v26 initWithString:v38 attributes:v27];

      uint64_t v29 = [v38 rangeOfString:@"+"];
      objc_msgSend(v28, "addAttribute:value:range:", v24, v22, v29, v30);
      uint64_t v31 = [v35 rangeOfString:@"{apple-news-plus-placeholder}"];
      objc_msgSend(v33, "replaceCharactersInRange:withAttributedString:", v31, v32, v28);

      *a4 = v33;
    }
  }
}

- (BOOL)_isApplicationProxyAppleNews:(id)a3
{
  uint64_t v3 = [a3 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.news"];

  return v4;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_cachedAppLink, 0);
}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  int v3 = 138739971;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Unable to externally open App Link for URL %{sensitive}@ due to resolution failure", (uint8_t *)&v3, 0xCu);
}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1ABB70000, v4, v5, "Unable to set App Link policy for URL %{sensitive}@ with error %{public}@", v6, v7, v8, v9, v10);
}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_4_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1ABB70000, v4, v5, "Unable to externally open App Link for URL %{sensitive}@ with error %{public}@", v6, v7, v8, v9, v10);
}

void __43__WBSAppLink_disableWithCompletionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1ABB70000, v4, v5, "Unable to open URL '%{sensitive}@' in Safari because no LSAppLink was found: %{public}@", v6, v7, v8, v9, v10);
}

@end