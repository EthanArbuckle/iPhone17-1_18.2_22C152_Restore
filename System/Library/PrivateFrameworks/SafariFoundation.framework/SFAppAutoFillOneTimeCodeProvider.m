@interface SFAppAutoFillOneTimeCodeProvider
- (BOOL)_appWithAppIdentifierIsWebBrowser:(id)a3;
- (BOOL)isOneTimeCodeAutoDeletionEnabled;
- (SFAppAutoFillOneTimeCodeProvider)init;
- (SFAppAutoFillOneTimeCodeProvider)initWithOptions:(unint64_t)a3;
- (SFAppAutoFillOneTimeCodeProviderDelegate)delegate;
- (WBSAutoFillAssociatedDomainsManager)associatedDomainsManager;
- (id)_associatedDomainEntriesForAppWithIdentifier:(id)a3;
- (id)_mostRecentlyReceivedOneTimeCode;
- (id)_savedAccountsWithPasswordsForURL:(id)a3 inContext:(id)a4;
- (id)_secureURLWithDomain:(id)a3;
- (id)_sortedOneTimeCodesFromSavedAccounts:(id)a3 context:(id)a4;
- (id)currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:(id)a3 fieldClassification:(int64_t)a4;
- (id)currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:(id)a3 fieldClassification:(int64_t)a4 inContext:(id)a5;
- (id)currentOneTimeCodesWithAppIdentifier:(id)a3 website:(id)a4 usernameHint:(id)a5 fieldClassification:(int64_t)a6;
- (id)currentOneTimeCodesWithAuditToken:(id *)a3 website:(id)a4 usernameHint:(id)a5 fieldClassification:(int64_t)a6;
- (int64_t)_domainBindingForRecievedOneTimeCode:(id)a3 forAppWithIdentifier:(id)a4 websiteURL:(id)a5 hasDomainBinding:(BOOL *)a6;
- (int64_t)_url:(id)a3 matchesURLFromOriginBoundCode:(id)a4;
- (void)_consumeOneTimeCode:(id)a3;
- (void)_fetchOneTimeCodeAutoDeletionPreference;
- (void)_notifyOneTimeCodeObserver;
- (void)_processOneTimeCodeFromMail:(id)a3 withTimestamp:(id)a4 andMessageID:(int64_t)a5;
- (void)_processOneTimeCodeFromMessages:(id)a3;
- (void)_processReceivedOneTimeCode:(id)a3 fromSource:(int64_t)a4;
- (void)_startGeneratorTimer;
- (void)_stopGeneratorTimer;
- (void)_validateCurrentOneTimeCodes;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 forOneTimeCode:(id)a4;
- (void)consumeCurrentOneTimeCode;
- (void)consumeMessagesOneTimeCodeWithGUID:(id)a3;
- (void)consumeOneTimeCode:(id)a3;
- (void)didFocusOneTimeCodeField;
- (void)removeObserver:(id)a3;
- (void)removeObserverForOneTimeCode:(id)a3;
- (void)setAssociatedDomainsManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsOneTimeCodeAutoDeletionEnabled:(BOOL)a3;
@end

@implementation SFAppAutoFillOneTimeCodeProvider

- (SFAppAutoFillOneTimeCodeProvider)init
{
  return [(SFAppAutoFillOneTimeCodeProvider *)self initWithOptions:0];
}

- (SFAppAutoFillOneTimeCodeProvider)initWithOptions:(unint64_t)a3
{
  char v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFAppAutoFillOneTimeCodeProvider;
  v4 = [(SFAppAutoFillOneTimeCodeProvider *)&v26 init];
  if (v4)
  {
    objc_initWeak(&location, v4);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SafariFoundation.SFAppAutoFillOneTimeCodeProvider.internal", 0);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    currentReceivedOneTimeCodesBySource = v4->_currentReceivedOneTimeCodesBySource;
    v4->_currentReceivedOneTimeCodesBySource = (NSMutableDictionary *)v7;

    if ((v3 & 1) == 0)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2050000000;
      v9 = (void *)getIMOneTimeCodeAcceleratorClass_softClass;
      uint64_t v35 = getIMOneTimeCodeAcceleratorClass_softClass;
      if (!getIMOneTimeCodeAcceleratorClass_softClass)
      {
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __getIMOneTimeCodeAcceleratorClass_block_invoke;
        v30 = &unk_264390A98;
        v31 = &v32;
        __getIMOneTimeCodeAcceleratorClass_block_invoke((uint64_t)&v27);
        v9 = (void *)v33[3];
      }
      v10 = v9;
      _Block_object_dispose(&v32, 8);
      id v11 = [v10 alloc];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke;
      v23[3] = &unk_2643906C8;
      objc_copyWeak(&v24, &location);
      uint64_t v12 = [v11 initWithBlockForUpdates:v23];
      messagesOneTimeCodeAccelerator = v4->_messagesOneTimeCodeAccelerator;
      v4->_messagesOneTimeCodeAccelerator = (IMOneTimeCodeAccelerator *)v12;

      [(SFAppAutoFillOneTimeCodeProvider *)v4 _fetchOneTimeCodeAutoDeletionPreference];
      objc_destroyWeak(&v24);
    }
    if ((v3 & 2) == 0)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2050000000;
      v14 = (void *)getEMOneTimeCodeAcceleratorClass_softClass;
      uint64_t v35 = getEMOneTimeCodeAcceleratorClass_softClass;
      if (!getEMOneTimeCodeAcceleratorClass_softClass)
      {
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __getEMOneTimeCodeAcceleratorClass_block_invoke;
        v30 = &unk_264390A98;
        v31 = &v32;
        __getEMOneTimeCodeAcceleratorClass_block_invoke((uint64_t)&v27);
        v14 = (void *)v33[3];
      }
      v15 = v14;
      _Block_object_dispose(&v32, 8);
      id v16 = [v15 alloc];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_3;
      v21[3] = &unk_264390718;
      objc_copyWeak(&v22, &location);
      uint64_t v17 = [v16 initWithUpdateBlock:v21];
      mailOneTimeCodeAccelerator = v4->_mailOneTimeCodeAccelerator;
      v4->_mailOneTimeCodeAccelerator = (EMOneTimeCodeAccelerator *)v17;

      objc_destroyWeak(&v22);
    }
    v19 = v4;
    objc_destroyWeak(&location);
  }

  return v4;
}

void __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[7];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_2;
    v7[3] = &unk_2643906A0;
    v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) firstObject];
  [v1 _processOneTimeCodeFromMessages:v2];
}

void __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = WeakRetained[7];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_4;
    v12[3] = &unk_2643906F0;
    v13 = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    uint64_t v16 = a4;
    dispatch_async(v11, v12);
  }
}

uint64_t __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processOneTimeCodeFromMail:*(void *)(a1 + 40) withTimestamp:*(void *)(a1 + 48) andMessageID:*(void *)(a1 + 56)];
}

- (void)didFocusOneTimeCodeField
{
}

- (id)currentOneTimeCodesWithAuditToken:(id *)a3 website:(id)a4 usernameHint:(id)a5 fieldClassification:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  $115C4C562B26FF47E01F9F4EA65B5887 v23 = *a3;
  uint64_t v12 = WBSApplicationIdentifierFromAuditToken();
  if (!v12)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SFAppAutoFillOneTimeCodeProvider currentOneTimeCodesWithAuditToken:website:usernameHint:fieldClassification:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  v21 = -[SFAppAutoFillOneTimeCodeProvider currentOneTimeCodesWithAppIdentifier:website:usernameHint:fieldClassification:](self, "currentOneTimeCodesWithAppIdentifier:website:usernameHint:fieldClassification:", v12, v10, v11, a6, *(_OWORD *)v23.var0, *(_OWORD *)&v23.var0[4]);

  return v21;
}

- (id)currentOneTimeCodesWithAppIdentifier:(id)a3 website:(id)a4 usernameHint:(id)a5 fieldClassification:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x263EFF980] array];
  internalQueue = self->_internalQueue;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  $115C4C562B26FF47E01F9F4EA65B5887 v23 = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke;
  id v24 = &unk_2643907B8;
  v25 = self;
  id v26 = v10;
  id v27 = v11;
  id v28 = v13;
  id v29 = v12;
  int64_t v30 = a6;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  dispatch_sync(internalQueue, &v21);
  uint64_t v19 = objc_msgSend(v16, "copy", v21, v22, v23, v24, v25);

  return v19;
}

void __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_2;
  v6[3] = &unk_2643907B8;
  id v2 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  dispatch_queue_t v5 = *(void **)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  id v9 = v3;
  uint64_t v11 = v4;
  id v10 = v5;
  _os_activity_initiate(&dword_218FBF000, "Retrieving Current One-Time Codes for App", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_2(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _validateCurrentOneTimeCodes];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_3;
  v35[3] = &unk_264390740;
  v35[4] = v2;
  id v36 = *(id *)(a1 + 40);
  id v37 = *(id *)(a1 + 48);
  v38 = &v40;
  v39 = &v44;
  uint64_t v4 = objc_msgSend(v3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v35);
  dispatch_queue_t v5 = [v4 objectForKeyedSubscript:&unk_26CA7EDC0];
  v6 = v5;
  if (v5)
  {
    id v7 = *(void **)(a1 + 56);
    id v8 = [v5 first];
    [v7 addObject:v8];
  }
  id v9 = [v4 objectForKeyedSubscript:&unk_26CA7EDD8];

  if (v9)
  {
    id v10 = *(void **)(a1 + 56);
    uint64_t v11 = [v9 first];
    [v10 addObject:v11];
  }
  if (!*((unsigned char *)v41 + 24) || !*((unsigned char *)v45 + 24))
  {
    if ([*(id *)(a1 + 56) count])
    {
      id v12 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FBF000, v12, OS_LOG_TYPE_INFO, "Will return at least the currently available one-time code.", buf, 2u);
      }
    }
    v13 = +[SFAutoFillFeatureManager sharedFeatureManager];
    int v14 = [v13 shouldAutoFillPasswordsFromKeychain];

    if (v14)
    {
      id v15 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v16;
        _os_log_impl(&dword_218FBF000, v15, OS_LOG_TYPE_INFO, "Attempting to return a TOTP generated code. classification:%d", buf, 8u);
      }
      if (*(void *)(a1 + 72) == 2 && [*(id *)(a1 + 40) length])
      {
        if (*(void *)(a1 + 48)
          && [*(id *)(a1 + 32) _appWithAppIdentifierIsWebBrowser:*(void *)(a1 + 40)])
        {
          id v17 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = *(void *)(a1 + 40);
            uint64_t v19 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138412803;
            uint64_t v49 = v18;
            __int16 v50 = 2160;
            uint64_t v51 = 1752392040;
            __int16 v52 = 2117;
            uint64_t v53 = v19;
            _os_log_impl(&dword_218FBF000, v17, OS_LOG_TYPE_DEFAULT, "App %@ has web browser entitlement. Getting passwords for website URL %{sensitive, mask.hash}@.", buf, 0x20u);
          }
          uint64_t v20 = [*(id *)(a1 + 32) _savedAccountsWithPasswordsForURL:*(void *)(a1 + 48) inContext:0];
        }
        else
        {
          uint64_t v21 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 141558275;
            uint64_t v49 = 1752392040;
            __int16 v50 = 2117;
            uint64_t v51 = v22;
            _os_log_impl(&dword_218FBF000, v21, OS_LOG_TYPE_DEFAULT, "Fetching passwords for associated domains for app %{sensitive, mask.hash}@.", buf, 0x16u);
          }
          $115C4C562B26FF47E01F9F4EA65B5887 v23 = [*(id *)(a1 + 32) _associatedDomainEntriesForAppWithIdentifier:*(void *)(a1 + 40)];
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_56;
          v33[3] = &unk_264390790;
          v33[4] = *(void *)(a1 + 32);
          id v34 = *(id *)(a1 + 64);
          id v24 = objc_msgSend(v23, "safari_mapAndFilterObjectsUsingBlock:", v33);
          uint64_t v20 = objc_msgSend(v24, "safari_flattenedArray");
        }
        v25 = *(void **)(a1 + 56);
        id v26 = *(void **)(a1 + 32);
        id v27 = [MEMORY[0x263F66398] defaultContext];
        id v28 = [v26 _sortedOneTimeCodesFromSavedAccounts:v20 context:v27];
        [v25 addObjectsFromArray:v28];

        id v29 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = [*(id *)(a1 + 56) count];
          uint64_t v31 = [*(id *)(a1 + 56) count];
          uint64_t v32 = "s";
          if (v31 == 1) {
            uint64_t v32 = "";
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v49 = v30;
          __int16 v50 = 2080;
          uint64_t v51 = (uint64_t)v32;
          _os_log_impl(&dword_218FBF000, v29, OS_LOG_TYPE_DEFAULT, "Returning %ld available one-time code%s", buf, 0x16u);
        }
      }
    }
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

id __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unsigned __int8 v13 = 0;
  uint64_t v5 = [*(id *)(a1 + 32) _domainBindingForRecievedOneTimeCode:v4 forAppWithIdentifier:*(void *)(a1 + 40) websiteURL:*(void *)(a1 + 48) hasDomainBinding:&v13];
  v6 = (void *)v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56)
                                                                                               + 8)
                                                                                   + 24) | v13) != 0;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  if (v5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = *(unsigned char *)(v7 + 24) == 0;
  }
  char v9 = !v8;
  *(unsigned char *)(v7 + 24) = v9;
  if (v5)
  {
    id v10 = objc_alloc(MEMORY[0x263F662E0]);
    uint64_t v11 = [NSNumber numberWithInteger:v6];
    v6 = (void *)[v10 initWithFirst:v4 second:v11];
  }
  return v6;
}

id __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 domain];
  uint64_t v5 = [v3 _secureURLWithDomain:v4];
  v6 = [v3 _savedAccountsWithPasswordsForURL:v5 inContext:0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_2_57;
  v9[3] = &unk_264390768;
  id v10 = *(id *)(a1 + 40);
  uint64_t v7 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v9);

  return v7;
}

uint64_t __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_2_57(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) length])
  {
    id v4 = [v3 user];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (id)currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:(id)a3 fieldClassification:(int64_t)a4
{
  v6 = (void *)MEMORY[0x263F66398];
  id v7 = a3;
  BOOL v8 = [v6 defaultContext];
  char v9 = [(SFAppAutoFillOneTimeCodeProvider *)self currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:v7 fieldClassification:a4 inContext:v8];

  return v9;
}

- (id)currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:(id)a3 fieldClassification:(int64_t)a4 inContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF980] array];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke;
  block[3] = &unk_264390808;
  block[4] = self;
  id v18 = v8;
  id v20 = v9;
  int64_t v21 = a4;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(internalQueue, block);
  id v15 = (void *)[v13 copy];

  return v15;
}

void __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke_2;
  activity_block[3] = &unk_264390808;
  uint64_t v2 = *(void **)(a1 + 40);
  activity_block[4] = *(void *)(a1 + 32);
  id v7 = v2;
  id v3 = *(id *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v8 = v3;
  uint64_t v10 = v4;
  id v9 = v5;
  _os_activity_initiate(&dword_218FBF000, "Retrieving Current One-Time Codes for Web Browser App", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _validateCurrentOneTimeCodes];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke_3;
  v19[3] = &unk_2643907E0;
  id v20 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v19);
  uint64_t v4 = [v3 objectForKeyedSubscript:&unk_26CA7EDC0];
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 48);
    id v7 = [v4 first];
    [v6 addObject:v7];
  }
  id v8 = [v3 objectForKeyedSubscript:&unk_26CA7EDD8];

  if (v8)
  {
    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = [v8 first];
    [v9 addObject:v10];
  }
  uint64_t v11 = +[SFAutoFillFeatureManager sharedFeatureManager];
  int v12 = [v11 shouldAutoFillPasswordsFromKeychain];

  if (v12)
  {
    if (*(void *)(a1 + 64))
    {
      uint64_t v13 = [*(id *)(a1 + 40) lastObject];
      if (v13)
      {
        id v14 = (void *)v13;
        id v15 = *(void **)(a1 + 32);
        uint64_t v16 = *(void **)(a1 + 48);
        id v17 = [v15 _savedAccountsWithPasswordsForURL:v13 inContext:*(void *)(a1 + 56)];
        id v18 = [v15 _sortedOneTimeCodesFromSavedAccounts:v17 context:*(void *)(a1 + 56)];
        [v16 addObjectsFromArray:v18];
      }
    }
  }
}

id __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[v4 matchBoundDomainsWithFrameURLs:*(void *)(a1 + 32)];
  v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = &stru_26CA7A2D0;
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v5) {
      id v7 = @"NOT ";
    }
    int v12 = 138412547;
    uint64_t v13 = v7;
    __int16 v14 = 2113;
    uint64_t v15 = v8;
    _os_log_impl(&dword_218FBF000, v6, OS_LOG_TYPE_DEFAULT, "Domain-bound verification code is %@valid for frame URLs from web browser: %{private}@", (uint8_t *)&v12, 0x16u);
  }
  if (v5)
  {
    id v9 = objc_alloc(MEMORY[0x263F662E0]);
    uint64_t v10 = [NSNumber numberWithInteger:v5];
    uint64_t v5 = (void *)[v9 initWithFirst:v4 second:v10];
  }
  return v5;
}

- (int64_t)_domainBindingForRecievedOneTimeCode:(id)a3 forAppWithIdentifier:(id)a4 websiteURL:(id)a5 hasDomainBinding:(BOOL *)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [v12 domain];
  uint64_t v14 = [v12 machineReadableCode];

  if (v13 | v14)
  {
    if (a6) {
      *a6 = 1;
    }
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558275;
      uint64_t v40 = 1752392040;
      __int16 v41 = 2117;
      uint64_t v42 = v13;
      _os_log_impl(&dword_218FBF000, v15, OS_LOG_TYPE_DEFAULT, "Current verification code is domain-bound to %{sensitive, mask.hash}@.", buf, 0x16u);
    }
    if ([v10 length])
    {
      uint64_t v16 = [(SFAppAutoFillOneTimeCodeProvider *)self _secureURLWithDomain:v13];
      if (v11
        && [(SFAppAutoFillOneTimeCodeProvider *)self _appWithAppIdentifierIsWebBrowser:v10])
      {
        id v17 = WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412803;
          uint64_t v40 = (uint64_t)v10;
          __int16 v41 = 2160;
          uint64_t v42 = 1752392040;
          __int16 v43 = 2117;
          id v44 = v11;
          _os_log_impl(&dword_218FBF000, v17, OS_LOG_TYPE_INFO, "App %@ has web browser entitlement. Checking domain against website URL %{sensitive, mask.hash}@.", buf, 0x20u);
        }
        int64_t v18 = [(SFAppAutoFillOneTimeCodeProvider *)self _url:v11 matchesURLFromOriginBoundCode:v16];
      }
      else
      {
        id v19 = WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v40 = (uint64_t)v10;
          _os_log_impl(&dword_218FBF000, v19, OS_LOG_TYPE_INFO, "Checking domain against associated domains for app %@.", buf, 0xCu);
        }
        id v20 = [(SFAppAutoFillOneTimeCodeProvider *)self _associatedDomainEntriesForAppWithIdentifier:v10];
        uint64_t v33 = MEMORY[0x263EF8330];
        uint64_t v34 = 3221225472;
        uint64_t v35 = __122__SFAppAutoFillOneTimeCodeProvider__domainBindingForRecievedOneTimeCode_forAppWithIdentifier_websiteURL_hasDomainBinding___block_invoke;
        id v36 = &unk_264390830;
        id v37 = self;
        id v38 = v16;
        int64_t v21 = objc_msgSend(v20, "safari_reduceObjectsWithInitialValue:usingBlock:", &unk_26CA7EDC0, &v33);
        int64_t v18 = objc_msgSend(v21, "integerValue", v33, v34, v35, v36, v37);
      }
      uint64_t v22 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        $115C4C562B26FF47E01F9F4EA65B5887 v23 = &stru_26CA7A2D0;
        if (!v18) {
          $115C4C562B26FF47E01F9F4EA65B5887 v23 = @"NOT ";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = (uint64_t)v23;
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)v10;
        _os_log_impl(&dword_218FBF000, v22, OS_LOG_TYPE_DEFAULT, "Domain-bound verification code is %@valid for app %@.", buf, 0x16u);
      }
    }
    else
    {
      id v24 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SFAppAutoFillOneTimeCodeProvider _domainBindingForRecievedOneTimeCode:forAppWithIdentifier:websiteURL:hasDomainBinding:](v24, v25, v26, v27, v28, v29, v30, v31);
      }
      int64_t v18 = 0;
    }
  }
  else
  {
    if (a6) {
      *a6 = 0;
    }
    int64_t v18 = 2;
  }

  return v18;
}

id __122__SFAppAutoFillOneTimeCodeProvider__domainBindingForRecievedOneTimeCode_forAppWithIdentifier_websiteURL_hasDomainBinding___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  id v7 = [a2 domain];
  uint64_t v8 = [v6 _secureURLWithDomain:v7];
  uint64_t v9 = [v6 _url:v8 matchesURLFromOriginBoundCode:*(void *)(a1 + 40)];

  if (v9 <= [v5 integerValue])
  {
    id v10 = v5;
  }
  else
  {
    id v10 = [NSNumber numberWithInteger:v9];
  }
  id v11 = v10;

  return v11;
}

- (void)consumeCurrentOneTimeCode
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SFAppAutoFillOneTimeCodeProvider_consumeCurrentOneTimeCode__block_invoke;
  block[3] = &unk_264390880;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __61__SFAppAutoFillOneTimeCodeProvider_consumeCurrentOneTimeCode__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SFAppAutoFillOneTimeCodeProvider_consumeCurrentOneTimeCode__block_invoke_2;
  v4[3] = &unk_264390858;
  v4[4] = v1;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __61__SFAppAutoFillOneTimeCodeProvider_consumeCurrentOneTimeCode__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_consumeOneTimeCode:");
}

- (void)consumeMessagesOneTimeCodeWithGUID:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__SFAppAutoFillOneTimeCodeProvider_consumeMessagesOneTimeCodeWithGUID___block_invoke;
  v7[3] = &unk_2643906A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __71__SFAppAutoFillOneTimeCodeProvider_consumeMessagesOneTimeCodeWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:&unk_26CA7EDC0];
  if (v2)
  {
    id v5 = v2;
    id v3 = [v2 GUID];
    int v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

    uint64_t v2 = v5;
    if (v4)
    {
      [*(id *)(a1 + 32) _consumeOneTimeCode:v5];
      uint64_t v2 = v5;
    }
  }
}

- (void)consumeOneTimeCode:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SFAppAutoFillOneTimeCodeProvider_consumeOneTimeCode___block_invoke;
  v7[3] = &unk_2643906A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __55__SFAppAutoFillOneTimeCodeProvider_consumeOneTimeCode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _consumeOneTimeCode:*(void *)(a1 + 40)];
}

- (void)_consumeOneTimeCode:(id)a3
{
  id v11 = a3;
  id v4 = [(NSMutableDictionary *)self->_currentReceivedOneTimeCodesBySource allValues];
  int v5 = [v4 containsObject:v11];

  if (v5)
  {
    uint64_t v6 = [v11 source];
    if (v6 == 1)
    {
      -[EMOneTimeCodeAccelerator didFillOneTimeCode:](self->_mailOneTimeCodeAccelerator, "didFillOneTimeCode:", [v11 messageID]);
      uint64_t v9 = &unk_26CA7EDD8;
      id v10 = [(NSMutableDictionary *)self->_currentReceivedOneTimeCodesBySource objectForKeyedSubscript:&unk_26CA7EDD8];
      if (![v11 isEqual:v10]) {
        goto LABEL_6;
      }
    }
    else
    {
      if (v6) {
        goto LABEL_7;
      }
      messagesOneTimeCodeAccelerator = self->_messagesOneTimeCodeAccelerator;
      id v8 = [v11 GUID];
      [(IMOneTimeCodeAccelerator *)messagesOneTimeCodeAccelerator consumeCodeWithGuid:v8];

      uint64_t v9 = &unk_26CA7EDC0;
      id v10 = [(NSMutableDictionary *)self->_currentReceivedOneTimeCodesBySource objectForKeyedSubscript:&unk_26CA7EDC0];
      if (([v11 isEqual:v10] & 1) == 0) {
        goto LABEL_6;
      }
    }
    [(NSMutableDictionary *)self->_currentReceivedOneTimeCodesBySource setObject:0 forKeyedSubscript:v9];
LABEL_6:
  }
LABEL_7:
  MEMORY[0x270F9A758]();
}

- (id)_mostRecentlyReceivedOneTimeCode
{
  uint64_t v2 = [(NSMutableDictionary *)self->_currentReceivedOneTimeCodesBySource allValues];
  id v3 = objc_msgSend(v2, "safari_reduceObjectsUsingBlock:", &__block_literal_global_0);

  return v3;
}

id __68__SFAppAutoFillOneTimeCodeProvider__mostRecentlyReceivedOneTimeCode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  int v5 = v4;
  if (a3)
  {
    id v6 = a3;
    id v7 = [v5 timestamp];
    id v8 = [v6 timestamp];
    if (objc_msgSend(v7, "safari_isLaterThanDate:", v8)) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SFAppAutoFillOneTimeCodeProvider_addObserver___block_invoke;
  v7[3] = &unk_2643906A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __48__SFAppAutoFillOneTimeCodeProvider_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)addObserver:(id)a3 forOneTimeCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v7 source] == 2)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__SFAppAutoFillOneTimeCodeProvider_addObserver_forOneTimeCode___block_invoke;
    block[3] = &unk_2643908C8;
    block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_async(internalQueue, block);
  }
}

void __63__SFAppAutoFillOneTimeCodeProvider_addObserver_forOneTimeCode___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v2 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;
  }
  id v8 = objc_alloc_init(TOTPGeneratorSnapshot);
  [(TOTPGeneratorSnapshot *)v8 setOneTimeCode:*(void *)(a1 + 40)];
  int v5 = [*(id *)(a1 + 40) totpGenerator];
  id v6 = [MEMORY[0x263EFF910] date];
  id v7 = [v5 startDateOfIntervalContainingDate:v6];
  [(TOTPGeneratorSnapshot *)v8 setStartDateOfInterval:v7];

  [*(id *)(*(void *)(a1 + 32) + 48) setObject:v8 forKey:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _startGeneratorTimer];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SFAppAutoFillOneTimeCodeProvider_removeObserver___block_invoke;
  v7[3] = &unk_2643906A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __51__SFAppAutoFillOneTimeCodeProvider_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)removeObserverForOneTimeCode:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__SFAppAutoFillOneTimeCodeProvider_removeObserverForOneTimeCode___block_invoke;
  v7[3] = &unk_2643906A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __65__SFAppAutoFillOneTimeCodeProvider_removeObserverForOneTimeCode___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) count];
  if (!result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _stopGeneratorTimer];
  }
  return result;
}

- (BOOL)isOneTimeCodeAutoDeletionEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__SFAppAutoFillOneTimeCodeProvider_isOneTimeCodeAutoDeletionEnabled__block_invoke;
  v5[3] = &unk_2643908F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__SFAppAutoFillOneTimeCodeProvider_isOneTimeCodeAutoDeletionEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)setIsOneTimeCodeAutoDeletionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__SFAppAutoFillOneTimeCodeProvider_setIsOneTimeCodeAutoDeletionEnabled___block_invoke;
  v6[3] = &unk_264390918;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(internalQueue, v6);
  [(IMOneTimeCodeAccelerator *)self->_messagesOneTimeCodeAccelerator setAutoDeletionPreference:v3];
}

uint64_t __72__SFAppAutoFillOneTimeCodeProvider_setIsOneTimeCodeAutoDeletionEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_fetchOneTimeCodeAutoDeletionPreference
{
  messagesOneTimeCodeAccelerator = self->_messagesOneTimeCodeAccelerator;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75__SFAppAutoFillOneTimeCodeProvider__fetchOneTimeCodeAutoDeletionPreference__block_invoke;
  v3[3] = &unk_264390940;
  v3[4] = self;
  [(IMOneTimeCodeAccelerator *)messagesOneTimeCodeAccelerator fetchAutoDeletionPreferenceWithCompletionHandler:v3];
}

void __75__SFAppAutoFillOneTimeCodeProvider__fetchOneTimeCodeAutoDeletionPreference__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(NSObject **)(v2 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__SFAppAutoFillOneTimeCodeProvider__fetchOneTimeCodeAutoDeletionPreference__block_invoke_2;
  v4[3] = &unk_264390918;
  v4[4] = v2;
  char v5 = a2;
  dispatch_async(v3, v4);
}

uint64_t __75__SFAppAutoFillOneTimeCodeProvider__fetchOneTimeCodeAutoDeletionPreference__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_notifyOneTimeCodeObserver
{
  BOOL v3 = (void *)[(NSHashTable *)self->_observers copy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SFAppAutoFillOneTimeCodeProvider__notifyOneTimeCodeObserver__block_invoke;
  block[3] = &unk_2643908C8;
  id v8 = v3;
  char v9 = self;
  id v10 = WeakRetained;
  id v5 = WeakRetained;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __62__SFAppAutoFillOneTimeCodeProvider__notifyOneTimeCodeObserver__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v13;
    *(void *)&long long v4 = 138412290;
    long long v11 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          char v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v11;
            id v17 = v8;
            _os_log_impl(&dword_218FBF000, v9, OS_LOG_TYPE_INFO, "Notifying observer %@ of new one-time code", buf, 0xCu);
          }
          objc_msgSend(v8, "oneTimeCodeProviderReceivedCode:", *(void *)(a1 + 40), v11, (void)v12);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }

  return [*(id *)(a1 + 48) appAutoFillOneTimeCodeProviderReceivedOneTimeCode:*(void *)(a1 + 40)];
}

- (void)_processOneTimeCodeFromMessages:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      uint64_t v7 = [0 code];
      int v9 = 141558275;
      uint64_t v10 = 1752392040;
      __int16 v11 = 2117;
      long long v12 = v7;
      _os_log_impl(&dword_218FBF000, v6, OS_LOG_TYPE_DEFAULT, "Received verification code from Messages: %{sensitive, mask.hash}@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [[SFAutoFillOneTimeCode alloc] initWithIMCoreDictionary:v4];
  }
  else
  {
    id v8 = 0;
  }
  [(SFAppAutoFillOneTimeCodeProvider *)self _processReceivedOneTimeCode:v8 fromSource:0];
}

- (void)_processOneTimeCodeFromMail:(id)a3 withTimestamp:(id)a4 andMessageID:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = v10;
      long long v12 = [0 code];
      int v14 = 141558531;
      uint64_t v15 = 1752392040;
      __int16 v16 = 2117;
      id v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = [0 messageID];
      _os_log_impl(&dword_218FBF000, v11, OS_LOG_TYPE_DEFAULT, "Received verification code from Mail: %{sensitive, mask.hash}@ and MessageID: %ld", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v13 = [[SFAutoFillOneTimeCode alloc] initWithMailOneTimeCode:v9 timestamp:v8 messageID:a5];
  }
  else
  {
    uint64_t v13 = 0;
  }
  [(SFAppAutoFillOneTimeCodeProvider *)self _processReceivedOneTimeCode:v13 fromSource:1];
}

- (void)_processReceivedOneTimeCode:(id)a3 fromSource:(int64_t)a4
{
  currentReceivedOneTimeCodesBySource = self->_currentReceivedOneTimeCodesBySource;
  uint64_t v7 = NSNumber;
  id v8 = a3;
  id v9 = [v7 numberWithInteger:a4];
  uint64_t v10 = [(NSMutableDictionary *)currentReceivedOneTimeCodesBySource objectForKeyedSubscript:v9];
  char v11 = WBSIsEqual();

  long long v12 = self->_currentReceivedOneTimeCodesBySource;
  uint64_t v13 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)v12 setObject:v8 forKeyedSubscript:v13];

  if ((v11 & 1) == 0)
  {
    [(SFAppAutoFillOneTimeCodeProvider *)self _notifyOneTimeCodeObserver];
  }
}

- (void)_validateCurrentOneTimeCodes
{
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 dateByAddingTimeInterval:-180.0];

  currentReceivedOneTimeCodesBySource = self->_currentReceivedOneTimeCodesBySource;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__SFAppAutoFillOneTimeCodeProvider__validateCurrentOneTimeCodes__block_invoke;
  v10[3] = &unk_264390968;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSMutableDictionary *)currentReceivedOneTimeCodesBySource safari_mapAndFilterKeysAndObjectsUsingBlock:v10];
  id v8 = (NSMutableDictionary *)[v7 mutableCopy];
  id v9 = self->_currentReceivedOneTimeCodesBySource;
  self->_currentReceivedOneTimeCodesBySource = v8;
}

id __64__SFAppAutoFillOneTimeCodeProvider__validateCurrentOneTimeCodes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 timestamp];
  LODWORD(a1) = objc_msgSend(v5, "safari_isEarlierThanDate:", *(void *)(a1 + 32));

  if (a1)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_218FBF000, v6, OS_LOG_TYPE_INFO, "%@ is expired; removing from cache", (uint8_t *)&v9, 0xCu);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (int64_t)_url:(id)a3 matchesURLFromOriginBoundCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend(v5, "safari_hasSameOriginAsURL:", v6)) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = objc_msgSend(v5, "safari_hasSameSiteAsURL:", v6);
  }

  return v7;
}

- (BOOL)_appWithAppIdentifierIsWebBrowser:(id)a3
{
  id v3 = a3;
  id v11 = 0;
  id v4 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:v3 error:&v11];
  id v5 = v11;
  if (v4)
  {
    id v6 = [v4 entitlements];
    int64_t v7 = [v6 objectForKey:@"com.apple.developer.web-browser" ofClass:objc_opt_class()];
    char v8 = [v7 BOOLValue];
  }
  else
  {
    int v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SFAppAutoFillOneTimeCodeProvider _appWithAppIdentifierIsWebBrowser:]((uint64_t)v3, v9);
    }
    char v8 = 0;
  }

  return v8;
}

- (id)_secureURLWithDomain:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263F08BA0];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    [v5 setScheme:@"https"];
    [v5 setHost:v4];

    id v6 = [v5 URL];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_savedAccountsWithPasswordsForURL:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F663A8]);
  int v9 = [MEMORY[0x263F663C0] queryThatMatchesEverything];
  id v10 = (void *)[v8 initWithURL:v6 options:19 userNameQuery:v9 associatedDomainsManager:self->_associatedDomainsManager webFrameIdentifier:0];

  [v10 setContext:v7];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v11 = [MEMORY[0x263F663B0] sharedStore];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__SFAppAutoFillOneTimeCodeProvider__savedAccountsWithPasswordsForURL_inContext___block_invoke;
  v15[3] = &unk_264390990;
  v15[4] = &v16;
  [v11 getSavedAccountsMatchingCriteria:v10 withSynchronousCompletionHandler:v15];

  long long v12 = [(id)v17[5] matchesForPasswordAutoFill];
  uint64_t v13 = objc_msgSend(v12, "safari_mapObjectsUsingBlock:", &__block_literal_global_97);

  _Block_object_dispose(&v16, 8);
  return v13;
}

void __80__SFAppAutoFillOneTimeCodeProvider__savedAccountsWithPasswordsForURL_inContext___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __80__SFAppAutoFillOneTimeCodeProvider__savedAccountsWithPasswordsForURL_inContext___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 savedAccount];
}

- (id)_sortedOneTimeCodesFromSavedAccounts:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  id v8 = [v6 set];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke;
  v14[3] = &unk_264390A00;
  id v15 = v5;
  id v9 = v5;
  id v10 = objc_msgSend(v7, "safari_reduceObjectsWithInitialValue:usingBlock:", v8, v14);

  id v11 = [v10 allObjects];
  long long v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_104];

  return v12;
}

id __81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFFA08];
  id v8 = [v5 totpGenerators];
  id v9 = [v7 setWithArray:v8];

  id v10 = [v5 lastUsedDateForContext:*(void *)(a1 + 32)];
  id v11 = [v9 allObjects];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke_2;
  uint64_t v19 = &unk_2643909D8;
  id v20 = v5;
  id v21 = v10;
  id v12 = v10;
  id v13 = v5;
  int v14 = objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &v16);
  objc_msgSend(v6, "addObjectsFromArray:", v14, v16, v17, v18, v19);

  return v6;
}

SFAutoFillOneTimeCode *__81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [SFAutoFillOneTimeCode alloc];
  id v5 = [*(id *)(a1 + 32) user];
  id v6 = [*(id *)(a1 + 32) userVisibleDomain];
  id v7 = [(SFAutoFillOneTimeCode *)v4 initWithTOTPGenerator:v3 user:v5 highLevelDomain:v6 lastUsedDateOfAssociatedSavedAccount:*(void *)(a1 + 40)];

  return v7;
}

uint64_t __81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 lastUseDateOfAssociatedSavedAccount];
  uint64_t v7 = [v5 lastUseDateOfAssociatedSavedAccount];
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(id)v6 compare:v7];
    uint64_t v10 = 1;
    if (v9 != -1) {
      uint64_t v10 = -1;
    }
    if (v9) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = -1;
    }
  }
  else
  {
    if (v6) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = 1;
    }
    if (!(v6 | v7))
    {
      id v12 = [v4 domain];
      id v13 = [v5 domain];
      uint64_t v11 = compareStringToString(v12, v13);

      if (!v11)
      {
        int v14 = [v4 user];
        id v15 = [v5 user];
        uint64_t v11 = compareStringToString(v14, v15);

        if (!v11)
        {
          uint64_t v16 = [v4 displayCode];
          uint64_t v17 = [v5 displayCode];
          uint64_t v11 = compareStringToString(v16, v17);
        }
      }
    }
  }

  return v11;
}

- (id)_associatedDomainEntriesForAppWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  $115C4C562B26FF47E01F9F4EA65B5887 v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__SFAppAutoFillOneTimeCodeProvider__associatedDomainEntriesForAppWithIdentifier___block_invoke;
  v17[3] = &unk_264390A48;
  uint64_t v19 = &v20;
  id v5 = v4;
  uint64_t v18 = v5;
  +[SFSafariCredentialStore getApprovedSharedWebCredentialsEntriesForAppWithAppID:v3 completionHandler:v17];
  dispatch_time_t v6 = dispatch_time(0, 5);
  if (dispatch_group_wait(v5, v6))
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SFAppAutoFillOneTimeCodeProvider _associatedDomainEntriesForAppWithIdentifier:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    id v15 = 0;
  }
  else
  {
    id v15 = (id)v21[5];
  }

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __81__SFAppAutoFillOneTimeCodeProvider__associatedDomainEntriesForAppWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_startGeneratorTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (!self->_generatorTimer)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__SFAppAutoFillOneTimeCodeProvider__startGeneratorTimer__block_invoke;
    v6[3] = &unk_264390A70;
    v6[4] = self;
    id v3 = [MEMORY[0x263EFFA20] timerWithTimeInterval:1 repeats:v6 block:1.0];
    generatorTimer = self->_generatorTimer;
    self->_generatorTimer = v3;

    [(NSTimer *)self->_generatorTimer setTolerance:0.25];
    id v5 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v5 addTimer:self->_generatorTimer forMode:*MEMORY[0x263EFF478]];
  }
}

void __56__SFAppAutoFillOneTimeCodeProvider__startGeneratorTimer__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SFAppAutoFillOneTimeCodeProvider__startGeneratorTimer__block_invoke_2;
  block[3] = &unk_264390880;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void __56__SFAppAutoFillOneTimeCodeProvider__startGeneratorTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 48) keyEnumerator];
  uint64_t v1 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v17;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v17 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v16 + 1) + 8 * v4);
        if (objc_opt_respondsToSelector())
        {
          dispatch_time_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:v5];
          uint64_t v7 = [v6 oneTimeCode];
          uint64_t v8 = [v7 totpGenerator];
          uint64_t v9 = [MEMORY[0x263EFF910] date];
          uint64_t v10 = [(id)v8 startDateOfIntervalContainingDate:v9];

          uint64_t v11 = [v6 startDateOfInterval];
          LOBYTE(v8) = [v10 isEqualToDate:v11];

          if ((v8 & 1) == 0)
          {
            [v6 setStartDateOfInterval:v10];
            uint64_t v12 = *(void *)(a1 + 32);
            uint64_t v13 = [v6 oneTimeCode];
            [v5 oneTimeCodeProvider:v12 didUpdateOneTimeCode:v13];
          }
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v2);
  }
}

- (void)_stopGeneratorTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_218FBF000, v3, OS_LOG_TYPE_INFO, "Stopping generator observer timer.", v5, 2u);
  }
  [(NSTimer *)self->_generatorTimer invalidate];
  generatorTimer = self->_generatorTimer;
  self->_generatorTimer = 0;
}

- (SFAppAutoFillOneTimeCodeProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFAppAutoFillOneTimeCodeProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WBSAutoFillAssociatedDomainsManager)associatedDomainsManager
{
  return self->_associatedDomainsManager;
}

- (void)setAssociatedDomainsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDomainsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_generatorTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_generatorObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mailOneTimeCodeAccelerator, 0);
  objc_storeStrong((id *)&self->_currentReceivedOneTimeCodesBySource, 0);
  objc_storeStrong((id *)&self->_messagesOneTimeCodeAccelerator, 0);
}

- (void)currentOneTimeCodesWithAuditToken:(uint64_t)a3 website:(uint64_t)a4 usernameHint:(uint64_t)a5 fieldClassification:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_domainBindingForRecievedOneTimeCode:(uint64_t)a3 forAppWithIdentifier:(uint64_t)a4 websiteURL:(uint64_t)a5 hasDomainBinding:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_appWithAppIdentifierIsWebBrowser:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218FBF000, a2, OS_LOG_TYPE_ERROR, "Could not fetch application record for application identifier: %{private}@.", (uint8_t *)&v2, 0xCu);
}

- (void)_associatedDomainEntriesForAppWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end