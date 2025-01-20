@interface SFSafariCredentialStore
+ (BOOL)_appIsEntitledWebBrowser:(id)a3;
+ (BOOL)_savedAccount:(id)a3 isRelatedToEntryHighLevelDomains:(id)a4 andWebsiteURL:(id)a5;
+ (BOOL)_shouldUseQuirks;
+ (BOOL)isAppAutoFillAvailable;
+ (id)_bestDomainFromApprovedDomainsForWebCredentials:(id)a3 appLinks:(id)a4 otherServices:(id)a5 appID:(id)a6 appNames:(id)a7 allDomains:(id *)a8;
+ (id)_credentialProviderExtensionHelperProxy;
+ (id)_credentialsForAppID:(id)a3 matchingSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 savedAccounts:(id)a6;
+ (id)_credentialsForWebBrowserWithWebsiteURL:(id)a3 webFrameIdentifier:(id)a4;
+ (id)_highLevelDomainsFromDatabaseEntries:(id)a3;
+ (id)appNamesForAppID:(id)a3;
+ (id)bestDomainForAutoFillFromDomains:(id)a3 appID:(id)a4;
+ (id)textSuggestionHeaderForExternalCredential:(id)a3;
+ (id)titleForCredentialIdentity:(id)a3 formURL:(id)a4;
+ (int64_t)_scoreForDomain:(id)a3 domainsApprovedForWebCredentials:(id)a4 domainsApprovedForAppLinks:(id)a5 domainsApprovedForOtherServices:(id)a6 appNames:(id)a7;
+ (void)_approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:(id)a3 completionHandler:(id)a4;
+ (void)_approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID:(id)a3 completionHandler:(id)a4;
+ (void)_fetchKeychainCredentialsIfRequiredForAppID:(id)a3 withSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 webFrameIdentifier:(id)a6 isEntitledWebBrowser:(BOOL)a7 completion:(id)a8;
+ (void)_getAllowedActionForAppCredentialsWithAppID:(id)a3 websiteURL:(id)a4 user:(id)a5 password:(id)a6 shouldAnalyzeExistingCredentials:(BOOL)a7 completionHandler:(id)a8;
+ (void)_getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:(id)a3 maximumNumberOfEntriesToReturn:(unint64_t)a4 completionHandler:(id)a5;
+ (void)_getBundleIDForEnabledCredentialProvidersWithCompletionHandler:(id)a3;
+ (void)_getCredentialsForAppWithAppID:(id)a3 approvedAndValidSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 isEntitledWebBrowser:(BOOL)a6 hasPasskeyRequest:(BOOL)a7 completionHandler:(id)a8;
+ (void)_getCredentialsForAppWithAppID:(id)a3 approvedAndValidSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 webFrameIdentifier:(id)a6 isEntitledWebBrowser:(BOOL)a7 hasPasskeyRequest:(BOOL)a8 completionHandler:(id)a9;
+ (void)_getDomainsApprovedForWebCredentials:(id *)a3 domainsApprovedForAppLinks:(id *)a4 domainsApprovedForOtherServices:(id *)a5 fromDatabaseEntries:(id)a6;
+ (void)_getExternalCredentialsForAppID:(id)a3 matchingSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 isEntitledWebBrowser:(BOOL)a6 hasPasskeyRequest:(BOOL)a7 completion:(id)a8;
+ (void)_sharedWebCredentialsDatabaseEntriesForAppWithAppID:(id)a3 completionHandler:(id)a4;
+ (void)_sortCredentials:(id)a3 appID:(id)a4 usingApprovedSharedWebCredentialsDatabaseEntries:(id)a5;
+ (void)bestDomainForAppID:(id)a3 completionHandler:(id)a4;
+ (void)fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:(id)a3;
+ (void)getAllApprovedSharedWebCredentialsEntries:(id)a3;
+ (void)getAllApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:(id)a3 completionHandler:(id)a4;
+ (void)getAllCredentialsWithCompletionHandler:(id)a3;
+ (void)getAllExternalPasskeyCredentialIdentitiesWithCompletionHandler:(id)a3;
+ (void)getAllowedActionForAppCredentialsWithAppID:(id)a3 websiteURL:(id)a4 user:(id)a5 password:(id)a6 completionHandler:(id)a7;
+ (void)getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:(id)a3 completionHandler:(id)a4;
+ (void)getCanSaveCredentialsWithAppID:(id)a3 websiteURL:(id)a4 completionHandler:(id)a5;
+ (void)getCredentialsForAppWithAppID:(id)a3 completionHandler:(id)a4;
+ (void)getCredentialsForAppWithAppID:(id)a3 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a4 completionHandler:(id)a5;
+ (void)getCredentialsForAppWithAppID:(id)a3 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a4 websiteURL:(id)a5 completionHandler:(id)a6;
+ (void)getCredentialsForAppWithAppID:(id)a3 frameIdentifier:(id)a4 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a5 websiteURL:(id)a6 completionHandler:(id)a7;
+ (void)getCredentialsForAppWithAppID:(id)a3 websiteURL:(id)a4 completionHandler:(id)a5;
+ (void)getExternalPasskeyCredentialIdentitiesForDomains:(id)a3 completionHandler:(id)a4;
+ (void)getOneTimeCodeCredentialsForAppWithAppID:(id)a3 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a4 websiteURL:(id)a5 completionHandler:(id)a6;
@end

@implementation SFSafariCredentialStore

+ (void)getAllApprovedSharedWebCredentialsEntries:(id)a3
{
}

+ (BOOL)isAppAutoFillAvailable
{
  v2 = +[SFAutoFillFeatureManager sharedFeatureManager];
  if ([v2 shouldAutoFillPasswords])
  {
    v3 = +[SFCredentialProviderExtensionManager sharedManager];
    v4 = [v3 getEnabledExtensionsSynchronously];
    uint64_t v5 = [v4 count];

    if (v5) {
      char v6 = 1;
    }
    else {
      char v6 = [v2 shouldAutoFillPasswordsFromKeychain];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (void)getCredentialsForAppWithAppID:(id)a3 completionHandler:(id)a4
{
}

+ (void)getCredentialsForAppWithAppID:(id)a3 websiteURL:(id)a4 completionHandler:(id)a5
{
}

+ (void)getCredentialsForAppWithAppID:(id)a3 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a4 completionHandler:(id)a5
{
}

+ (void)getCredentialsForAppWithAppID:(id)a3 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a4 websiteURL:(id)a5 completionHandler:(id)a6
{
}

+ (void)getCredentialsForAppWithAppID:(id)a3 frameIdentifier:(id)a4 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a5 websiteURL:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke;
  v46[3] = &unk_264391000;
  id v17 = v12;
  id v47 = v17;
  v18 = objc_msgSend(v14, "safari_mapObjectsUsingBlock:", v46);
  id v19 = objc_alloc_init(MEMORY[0x263F66268]);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  v20 = dispatch_group_create();
  dispatch_group_enter(v20);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_2;
  v39[3] = &unk_264391028;
  v41 = &v42;
  v21 = v20;
  v40 = v21;
  [v19 getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:v13 orApplicationIdentifier:v17 completionHandler:v39];
  dispatch_time_t v22 = dispatch_time(0, 1500000000);
  if (dispatch_group_wait(v21, v22))
  {
    v23 = WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[SFSafariCredentialStore getCredentialsForAppWithAppID:frameIdentifier:externallyVerifiedAndApprovedSharedWebCredentialDomains:websiteURL:completionHandler:](v23);
    }
    *((unsigned char *)v43 + 24) = 0;
  }
  char v24 = [a1 _appIsEntitledWebBrowser:v17];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_6;
  v30[3] = &unk_264391070;
  id v25 = v18;
  id v31 = v25;
  id v26 = v17;
  id v32 = v26;
  id v37 = a1;
  id v27 = v15;
  id v33 = v27;
  id v28 = v13;
  char v38 = v24;
  id v34 = v28;
  v36 = &v42;
  id v29 = v16;
  id v35 = v29;
  [a1 _approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:v26 completionHandler:v30];

  _Block_object_dispose(&v42, 8);
}

id __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SFSharedWebCredentialsDatabaseEntry alloc] _initWithDomain:v3 appID:*(void *)(a1 + 32) service:0 isApproved:1];

  return v4;
}

void __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count] && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    id v4 = (void *)[v3 mutableCopy];
    uint64_t v5 = [MEMORY[0x263EFFA08] setWithArray:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (([v5 containsObject:v11] & 1) == 0) {
            [v4 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    if ([v3 count]) {
      id v12 = v3;
    }
    else {
      id v12 = *(id *)(a1 + 32);
    }
    id v4 = v12;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"com.apple.Preferences"])
  {
    uint64_t v13 = MEMORY[0x263EFFA68];
LABEL_21:

    id v4 = (void *)v13;
    goto LABEL_22;
  }
  if ([*(id *)(a1 + 40) hasPrefix:@"com.apple."])
  {
    uint64_t v13 = objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_7);
    goto LABEL_21;
  }
LABEL_22:
  [*(id *)(a1 + 80) _getCredentialsForAppWithAppID:*(void *)(a1 + 40) approvedAndValidSharedWebCredentialsDatabaseEntries:v4 websiteURL:*(void *)(a1 + 48) webFrameIdentifier:*(void *)(a1 + 56) isEntitledWebBrowser:*(unsigned __int8 *)(a1 + 88) hasPasskeyRequest:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) completionHandler:*(void *)(a1 + 64)];
}

BOOL __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_2_14(uint64_t a1, void *a2)
{
  return [a2 service] == 7;
}

+ (void)getAllCredentialsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SFSafariCredentialStore_getAllCredentialsWithCompletionHandler___block_invoke;
  block[3] = &unk_264390C80;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __66__SFSafariCredentialStore_getAllCredentialsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F663B0] sharedStore];
  id v3 = [v2 savedAccountsWithPasswords];
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_20);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

SFSafariCredential *__66__SFSafariCredentialStore_getAllCredentialsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 userIsNeverSaveMarker])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [v2 sites];
    if ([v4 count])
    {
      id v5 = [v2 userVisibleDomain];
      id v6 = objc_msgSend(v5, "safari_simplifiedSiteNameForCredentialLookup");

      id v7 = [SFSafariCredential alloc];
      uint64_t v8 = [v2 user];
      uint64_t v9 = [v2 password];
      v10 = [v2 lastModifiedDate];
      uint64_t v11 = [v2 customTitle];
      id v12 = [v2 sharedGroupName];
      id v3 = [(SFSafariCredential *)v7 initWithUser:v8 password:v9 site:v6 creationDate:v10 customTitle:v11 groupName:v12];
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

+ (void)_getCredentialsForAppWithAppID:(id)a3 approvedAndValidSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 isEntitledWebBrowser:(BOOL)a6 hasPasskeyRequest:(BOOL)a7 completionHandler:(id)a8
{
}

+ (void)_getCredentialsForAppWithAppID:(id)a3 approvedAndValidSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 webFrameIdentifier:(id)a6 isEntitledWebBrowser:(BOOL)a7 hasPasskeyRequest:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  v20 = dispatch_group_create();
  dispatch_group_enter(v20);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__1;
  v31[4] = __Block_byref_object_dispose__1;
  id v32 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __197__SFSafariCredentialStore__getCredentialsForAppWithAppID_approvedAndValidSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_hasPasskeyRequest_completionHandler___block_invoke;
  v28[3] = &unk_264390A48;
  v30 = v31;
  v21 = v20;
  id v29 = v21;
  [a1 _getExternalCredentialsForAppID:v15 matchingSharedWebCredentialsDatabaseEntries:v16 websiteURL:v17 isEntitledWebBrowser:v10 hasPasskeyRequest:v9 completion:v28];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __197__SFSafariCredentialStore__getCredentialsForAppWithAppID_approvedAndValidSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_hasPasskeyRequest_completionHandler___block_invoke_2;
  v24[3] = &unk_2643910B8;
  dispatch_time_t v22 = v21;
  id v25 = v22;
  id v27 = v31;
  id v23 = v19;
  id v26 = v23;
  [a1 _fetchKeychainCredentialsIfRequiredForAppID:v15 withSharedWebCredentialsDatabaseEntries:v16 websiteURL:v17 webFrameIdentifier:v18 isEntitledWebBrowser:v10 completion:v24];

  _Block_object_dispose(v31, 8);
}

void __197__SFSafariCredentialStore__getCredentialsForAppWithAppID_approvedAndValidSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_hasPasskeyRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __197__SFSafariCredentialStore__getCredentialsForAppWithAppID_approvedAndValidSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_hasPasskeyRequest_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v7 = a2;
  id v3 = a1[4];
  dispatch_time_t v4 = dispatch_time(0, 1500000000);
  dispatch_group_wait(v3, v4);
  if ([*(id *)(*(void *)(a1[6] + 8) + 40) count])
  {
    id v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) arrayByAddingObjectsFromArray:v7];
  }
  else
  {
    id v5 = v7;
  }
  id v6 = v5;
  (*(void (**)(void))(a1[5] + 16))();
}

+ (id)_highLevelDomainsFromDatabaseEntries:(id)a3
{
  return (id)objc_msgSend(a3, "safari_setByApplyingBlock:", &__block_literal_global_25);
}

id __64__SFSafariCredentialStore__highLevelDomainsFromDatabaseEntries___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 domain];
  id v3 = objc_msgSend(v2, "safari_highLevelDomainForPasswordManager");

  return v3;
}

+ (void)_fetchKeychainCredentialsIfRequiredForAppID:(id)a3 withSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 webFrameIdentifier:(id)a6 isEntitledWebBrowser:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = +[SFAutoFillFeatureManager sharedFeatureManager];
  char v20 = [v19 shouldAutoFillPasswordsFromKeychain];

  if (v20)
  {
    v21 = [MEMORY[0x263F663B0] sharedStore];
    dispatch_time_t v22 = dispatch_get_global_queue(21, 0);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __173__SFSafariCredentialStore__fetchKeychainCredentialsIfRequiredForAppID_withSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_completion___block_invoke;
    v23[3] = &unk_264391100;
    BOOL v30 = a7;
    id v24 = v16;
    id v28 = v18;
    id v29 = a1;
    id v25 = v17;
    id v26 = v14;
    id v27 = v15;
    [v21 performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:v22 task:v23];
  }
  else
  {
    (*((void (**)(id, void))v18 + 2))(v18, MEMORY[0x263EFFA68]);
  }
}

void __173__SFSafariCredentialStore__fetchKeychainCredentialsIfRequiredForAppID_withSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 80) && v1)
  {
    uint64_t v2 = *(void *)(a1 + 64);
    id v9 = [*(id *)(a1 + 72) _credentialsForWebBrowserWithWebsiteURL:v1 webFrameIdentifier:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v9);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 64);
    dispatch_time_t v4 = *(void **)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    id v9 = [MEMORY[0x263F663B0] sharedStore];
    id v7 = [v9 savedAccountsWithPasswords];
    uint64_t v8 = [v4 _credentialsForAppID:v5 matchingSharedWebCredentialsDatabaseEntries:v6 websiteURL:v1 savedAccounts:v7];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v8);
  }
}

+ (id)_credentialsForWebBrowserWithWebsiteURL:(id)a3 webFrameIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 19;
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__1;
  id v19 = __Block_byref_object_dispose__1;
  id v20 = (id)MEMORY[0x263EFFA68];
  id v8 = objc_alloc(MEMORY[0x263F663A8]);
  id v9 = [MEMORY[0x263F663C0] queryThatMatchesEverything];
  BOOL v10 = (void *)[v8 initWithURL:v5 options:v7 userNameQuery:v9 associatedDomainsManager:0 webFrameIdentifier:v6];

  uint64_t v11 = [MEMORY[0x263F663B0] sharedStore];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __86__SFSafariCredentialStore__credentialsForWebBrowserWithWebsiteURL_webFrameIdentifier___block_invoke;
  v14[3] = &unk_264390990;
  v14[4] = &v15;
  [v11 getSavedAccountsMatchingCriteria:v10 withSynchronousCompletionHandler:v14];

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __86__SFSafariCredentialStore__credentialsForWebBrowserWithWebsiteURL_webFrameIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 matchesForPasswordAutoFill];
  uint64_t v3 = objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_30_0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

SFSafariCredential *__86__SFSafariCredentialStore__credentialsForWebBrowserWithWebsiteURL_webFrameIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 savedAccount];
  if ([v2 userIsNeverSaveMarker])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = [v2 userVisibleDomain];
    id v5 = objc_msgSend(v4, "safari_simplifiedSiteNameForCredentialLookup");

    id v6 = [SFSafariCredential alloc];
    uint64_t v7 = [v2 user];
    id v8 = [v2 password];
    id v9 = [v2 lastModifiedDate];
    BOOL v10 = [v2 customTitle];
    uint64_t v11 = [v2 sharedGroupName];
    uint64_t v3 = [(SFSafariCredential *)v6 initWithUser:v7 password:v8 site:v5 creationDate:v9 customTitle:v10 groupName:v11];
  }
  return v3;
}

+ (id)_credentialsForAppID:(id)a3 matchingSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 savedAccounts:(id)a6
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v60 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  v68 = [MEMORY[0x263F08760] set];
  id v67 = objc_alloc_init(MEMORY[0x263F08968]);
  v59 = v10;
  id v14 = [a1 _highLevelDomainsFromDatabaseEntries:v10];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v75 objects:v80 count:16];
  v65 = v14;
  v66 = v13;
  id v63 = a1;
  v64 = v11;
  v62 = v15;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v76;
    uint64_t v61 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v76 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        if (([v20 userIsNeverSaveMarker] & 1) == 0
          && [a1 _savedAccount:v20 isRelatedToEntryHighLevelDomains:v14 andWebsiteURL:v11])
        {
          v21 = [v20 userVisibleDomain];
          uint64_t v22 = objc_msgSend(v21, "safari_simplifiedSiteNameForCredentialLookup");

          id v23 = [SFSafariCredential alloc];
          id v24 = [v20 user];
          id v25 = [v20 password];
          id v26 = [v20 lastModifiedDate];
          id v27 = [v20 customTitle];
          id v28 = [v20 sharedGroupName];
          v69 = (void *)v22;
          id v29 = [(SFSafariCredential *)v23 initWithUser:v24 password:v25 site:v22 creationDate:v26 customTitle:v27 groupName:v28];

          id v14 = v65;
          BOOL v30 = [MEMORY[0x263F66398] defaultContext];
          id v31 = [v20 lastUsedDateForContext:v30];
          [(SFSafariCredential *)v29 setLastUsedDate:v31];

          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v32 = v65;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v71 objects:v79 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v72;
            while (2)
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v72 != v35) {
                  objc_enumerationMutation(v32);
                }
                if ([v20 isDefaultCredentialForFullyQualifiedHostname:*(void *)(*((void *)&v71 + 1) + 8 * j)])
                {
                  [(SFSafariCredential *)v29 setIsDefaultForAnAssociatedDomain:1];
                  goto LABEL_18;
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v71 objects:v79 count:16];
              if (v34) {
                continue;
              }
              break;
            }
          }
LABEL_18:

          id v13 = v66;
          [v66 addObject:v29];
          id v37 = usernameAndWebsiteStringFromCredential(v29);
          [v68 addObject:v37];

          [v67 setObject:v20 forKey:v29];
          a1 = v63;
          id v11 = v64;
          uint64_t v18 = v61;
          id v15 = v62;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v17);
  }

  uint64_t v38 = [v13 count];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = 0;
    uint64_t v70 = v38;
    do
    {
      v41 = [v13 objectAtIndexedSubscript:v40];
      uint64_t v42 = usernameAndWebsiteStringFromCredential(v41);
      uint64_t v43 = [v68 countForObject:v42];

      if (v43 != 1)
      {
        uint64_t v44 = [v67 objectForKey:v41];
        char v45 = [v44 sites];
        v46 = [v45 firstObject];
        uint64_t v47 = objc_msgSend(v46, "safari_simplifiedSiteNameForCredentialLookup");

        v48 = [SFSafariCredential alloc];
        v49 = [v41 user];
        v50 = [v41 password];
        v51 = [v44 lastModifiedDate];
        v52 = [v44 customTitle];
        v53 = [v44 sharedGroupName];
        v54 = v48;
        v55 = (void *)v47;
        v56 = [(SFSafariCredential *)v54 initWithUser:v49 password:v50 site:v47 creationDate:v51 customTitle:v52 groupName:v53];

        id v14 = v65;
        uint64_t v39 = v70;

        id v13 = v66;
        v57 = [v41 lastUsedDate];
        [(SFSafariCredential *)v56 setLastUsedDate:v57];

        -[SFSafariCredential setIsDefaultForAnAssociatedDomain:](v56, "setIsDefaultForAnAssociatedDomain:", [v41 isDefaultForAnAssociatedDomain]);
        [v66 replaceObjectAtIndex:v40 withObject:v56];
      }
      ++v40;
    }
    while (v39 != v40);
  }
  [v63 _sortCredentials:v13 appID:v60 usingApprovedSharedWebCredentialsDatabaseEntries:v59];

  return v13;
}

+ (void)getCanSaveCredentialsWithAppID:(id)a3 websiteURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__SFSafariCredentialStore_getCanSaveCredentialsWithAppID_websiteURL_completionHandler___block_invoke;
  v10[3] = &unk_264391148;
  id v11 = v8;
  id v9 = v8;
  [a1 _getAllowedActionForAppCredentialsWithAppID:a3 websiteURL:a4 user:0 password:0 shouldAnalyzeExistingCredentials:0 completionHandler:v10];
}

uint64_t __87__SFSafariCredentialStore_getCanSaveCredentialsWithAppID_websiteURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0, a4);
}

+ (void)getAllowedActionForAppCredentialsWithAppID:(id)a3 websiteURL:(id)a4 user:(id)a5 password:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __113__SFSafariCredentialStore_getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_completionHandler___block_invoke;
  v14[3] = &unk_264391148;
  id v15 = v12;
  id v13 = v12;
  [a1 _getAllowedActionForAppCredentialsWithAppID:a3 websiteURL:a4 user:a5 password:a6 shouldAnalyzeExistingCredentials:1 completionHandler:v14];
}

uint64_t __113__SFSafariCredentialStore_getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_getAllowedActionForAppCredentialsWithAppID:(id)a3 websiteURL:(id)a4 user:(id)a5 password:(id)a6 shouldAnalyzeExistingCredentials:(BOOL)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ([v14 isEqualToString:@"com.apple.Preferences"]
    || (+[SFAutoFillFeatureManager sharedFeatureManager],
        id v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v19 shouldAutoFillPasswordsFromKeychain],
        v19,
        (v20 & 1) == 0))
  {
LABEL_10:
    (*((void (**)(id, void, void, void, void, void))v18 + 2))(v18, 0, 0, 0, 0, 0);
    goto LABEL_11;
  }
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v25 = WBS_LOG_CHANNEL_PREFIXCredentials();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[SFSafariCredentialStore _getAllowedActionForAppCredentialsWithAppID:websiteURL:user:password:shouldAnalyzeExistingCredentials:completionHandler:](v25);
      }
      goto LABEL_10;
    }
  }
  v21 = dispatch_group_create();
  uint64_t v22 = v21;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  if (v14)
  {
    dispatch_group_enter(v21);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke;
    v41[3] = &unk_264391170;
    uint64_t v42 = v22;
    id v43 = v14;
    uint64_t v44 = v45;
    [a1 _getBundleIDForEnabledCredentialProvidersWithCompletionHandler:v41];
  }
  dispatch_group_enter(v22);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__1;
  void v39[4] = __Block_byref_object_dispose__1;
  id v40 = 0;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke_2;
  v36[3] = &unk_264390A48;
  uint64_t v38 = v39;
  id v23 = v22;
  id v37 = v23;
  [a1 _approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:v14 completionHandler:v36];
  id v24 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke_3;
  block[3] = &unk_264391198;
  id v32 = v45;
  id v31 = v18;
  uint64_t v33 = v39;
  BOOL v35 = a7;
  id v27 = v15;
  id v34 = a1;
  id v28 = v16;
  id v29 = v17;
  id v30 = v14;
  dispatch_group_notify(v23, v24, block);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v45, 8);

LABEL_11:
}

void __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count]
    && (uint64_t v4 = [*(id *)(a1 + 40) rangeOfString:@"."], v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v5 = [*(id *)(a1 + 40) substringFromIndex:v4 + 1];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(v5, "isEqualToString:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    id v43 = [MEMORY[0x263EFF980] array];
    uint64_t v47 = [MEMORY[0x263EFF9C0] set];
    char v45 = [MEMORY[0x263EFF9C0] set];
    char v46 = [MEMORY[0x263EFF9C0] set];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      v48 = 0;
      uint64_t v6 = *(void *)v55;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v55 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v54 + 1) + 8 * v7);
          uint64_t v9 = [v8 domain];
          if (v9)
          {
            uint64_t v10 = [v8 service] - 1;
            long long v11 = v47;
            switch(v10)
            {
              case 0:
              case 1:
              case 2:
              case 3:
              case 5:
                long long v11 = v46;
                goto LABEL_13;
              case 4:
                long long v11 = v45;
                goto LABEL_13;
              case 6:
LABEL_13:
                [v11 addObject:v9];
                break;
              default:
                break;
            }
            long long v12 = objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");
            long long v13 = [*(id *)(a1 + 32) host];
            long long v14 = objc_msgSend(v13, "safari_highLevelDomainForPasswordManager");
            int v15 = [v12 isEqualToString:v14];

            if (v15)
            {
              id v16 = v9;

              v48 = v16;
            }
          }

          ++v7;
        }
        while (v5 != v7);
        uint64_t v17 = [v3 countByEnumeratingWithState:&v54 objects:v59 count:16];
        uint64_t v5 = v17;
      }
      while (v17);
    }
    else
    {
      v48 = 0;
    }

    if (*(unsigned char *)(a1 + 96))
    {
      id v18 = [MEMORY[0x263F663B0] sharedStore];
      id v19 = [v18 savedAccountsWithPasswords];

      char v20 = [*(id *)(a1 + 88) _highLevelDomainsFromDatabaseEntries:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v21 = v19;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v51 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if ([*(id *)(a1 + 88) _savedAccount:v26 isRelatedToEntryHighLevelDomains:v20 andWebsiteURL:*(void *)(a1 + 32)])
            {
              id v27 = [v26 user];
              if ([v27 isEqualToString:*(void *)(a1 + 40)])
              {
                id v28 = [v26 protectionSpaces];
                [v43 addObjectsFromArray:v28];
              }
              id v29 = [v26 user];
              if ([v29 isEqualToString:*(void *)(a1 + 40)])
              {
                [v26 password];
                uint64_t v44 = v27;
                uint64_t v30 = v23;
                uint64_t v31 = v24;
                id v32 = v20;
                v34 = id v33 = v21;
                int v35 = [v34 isEqualToString:*(void *)(a1 + 48)];

                id v21 = v33;
                char v20 = v32;
                uint64_t v24 = v31;
                uint64_t v23 = v30;
                id v27 = v44;

                if (v35)
                {
                  v36 = v43;
                  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

                  goto LABEL_41;
                }
              }
              else
              {
              }
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v23);
      }
    }
    v36 = v43;
    if ([v43 count])
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_41:
      id v37 = v48;
    }
    else
    {
      id v37 = v48;
      if (*(void *)(a1 + 32))
      {
        id v38 = v48;
        id v39 = 0;
      }
      else
      {
        id v40 = *(void **)(a1 + 88);
        uint64_t v41 = *(void *)(a1 + 56);
        uint64_t v42 = [v40 appNamesForAppID:v41];
        id v49 = 0;
        id v38 = [v40 _bestDomainFromApprovedDomainsForWebCredentials:v47 appLinks:v45 otherServices:v46 appID:v41 appNames:v42 allDomains:&v49];
        id v39 = v49;
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

+ (id)appNamesForAppID:(id)a3
{
  if (a3)
  {
    id v3 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:a3 error:0];
    uint64_t v4 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v5 = [v4 arrayByAddingObject:@"en"];

    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __44__SFSafariCredentialStore_appNamesForAppID___block_invoke;
    v12[3] = &unk_2643911C0;
    id v13 = v3;
    id v7 = v3;
    uint64_t v8 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v12);
    uint64_t v9 = [v6 setWithArray:v8];
    uint64_t v10 = [v9 allObjects];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

id __44__SFSafariCredentialStore_appNamesForAppID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v8 = a2;
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:&v8 count:1];
  uint64_t v6 = objc_msgSend(v2, "localizedNameWithPreferredLocalizations:", v5, v8, v9);

  return v6;
}

+ (void)fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F66260]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__SFSafariCredentialStore_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke;
  v7[3] = &unk_2643911E8;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  [v6 fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:v7];
}

uint64_t __86__SFSafariCredentialStore_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_bestDomainFromApprovedDomainsForWebCredentials:(id)a3 appLinks:(id)a4 otherServices:(id)a5 appID:(id)a6 appNames:(id)a7 allDomains:(id *)a8
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v84 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v12 count] || objc_msgSend(v84, "count") || objc_msgSend(v13, "count"))
  {
    uint64_t v16 = [v14 rangeOfString:@"."];
    id v75 = v15;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = [v14 substringFromIndex:v16 + 1];

      id v14 = (id)v17;
    }
    long long v76 = [v14 lowercaseString];

    uint64_t v81 = [MEMORY[0x263EFF9B0] orderedSet];
    id v18 = [v12 allObjects];
    id v19 = [v84 allObjects];
    char v20 = [v18 arrayByAddingObjectsFromArray:v19];
    id v21 = [v13 allObjects];
    uint64_t v22 = [v20 arrayByAddingObjectsFromArray:v21];

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = v22;
    uint64_t v85 = [obj countByEnumeratingWithState:&v88 objects:v92 count:16];
    if (!v85)
    {
      v82 = 0;
      id v15 = v75;
      goto LABEL_58;
    }
    uint64_t v23 = -1;
    v82 = 0;
    uint64_t v83 = *(void *)v89;
    unint64_t v24 = 0x264390000uLL;
    id v15 = v75;
    id v26 = a8;
    id v25 = a1;
    id v68 = v12;
    id v69 = v13;
    while (1)
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v89 != v83) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(void **)(*((void *)&v88 + 1) + 8 * v27);
        uint64_t v29 = objc_msgSend(v25, "_scoreForDomain:domainsApprovedForWebCredentials:domainsApprovedForAppLinks:domainsApprovedForOtherServices:appNames:", v28, v12, v84, v13, v15, v66);
        uint64_t v30 = v29;
        if (v29 <= v23)
        {
          if (v29 != v23) {
            goto LABEL_43;
          }
          id v31 = v28;
          id v32 = v82;
          id v79 = v76;
          if (([v32 hasSuffix:v31] & 1) == 0)
          {
            if ([v31 hasSuffix:v32]) {
              goto LABEL_42;
            }
            uint64_t v74 = v23;
            id v34 = v32;
            id v35 = v31;
            unsigned int v36 = [v35 hasPrefix:@"www."];
            unsigned int v37 = [v34 hasPrefix:@"www."];
            unint64_t v72 = v37;
            int v38 = [v35 hasSuffix:@".com"];
            uint64_t v70 = v35;

            uint64_t v39 = 1;
            if (v36) {
              uint64_t v39 = 2;
            }
            BOOL v40 = v38 == 0;
            unint64_t v24 = 0x264390000;
            if (v40) {
              unint64_t v41 = v36;
            }
            else {
              unint64_t v41 = v39;
            }
            int v42 = [v34 hasSuffix:@".com"];
            long long v71 = v34;

            uint64_t v23 = v74;
            unint64_t v43 = 1;
            if (v37) {
              unint64_t v43 = 2;
            }
            BOOL v40 = v42 == 0;
            id v12 = v68;
            id v13 = v69;
            if (v40) {
              unint64_t v43 = v72;
            }
            BOOL v44 = v41 >= v43;
            BOOL v45 = v41 > v43;
            id v25 = a1;
            if (v44) {
              uint64_t v46 = 0;
            }
            else {
              uint64_t v46 = -1;
            }
            if (v45) {
              uint64_t v46 = 1;
            }
            if (v46 == -1) {
              goto LABEL_42;
            }
            if (v46 != 1)
            {
              unint64_t v47 = objc_msgSend(v70, "safari_countOfString:", @".");
              unint64_t v48 = objc_msgSend(v71, "safari_countOfString:", @".");
              BOOL v44 = v47 >= v48;
              BOOL v49 = v47 > v48;
              id v13 = v69;
              if (v44)
              {
                if (v49) {
                  goto LABEL_42;
                }
                long long v50 = [v70 componentsSeparatedByString:@"."];
                long long v51 = [v50 reverseObjectEnumerator];
                long long v52 = [v51 allObjects];
                long long v73 = [v52 componentsJoinedByString:@"."];

                long long v53 = [v71 componentsSeparatedByString:@"."];
                long long v54 = [v53 reverseObjectEnumerator];
                long long v55 = [v54 allObjects];
                id v67 = [v55 componentsJoinedByString:@"."];

                unint64_t v24 = 0x264390000uLL;
                id v12 = v68;

                unint64_t v66 = lengthOfLongestCommonSubstring(v79, v73);
                long long v56 = v67;
                unint64_t v57 = lengthOfLongestCommonSubstring(v79, v67);
                if (v66 <= v57)
                {
                  if (v66 < v57) {
                    goto LABEL_41;
                  }
                  unint64_t v58 = [v70 length];
                  BOOL v45 = v58 > [v71 length];
                  long long v56 = v67;
                  if (!v45)
                  {
                    unint64_t v59 = [v70 length];
                    BOOL v44 = v59 >= [v71 length];
                    long long v56 = v67;
                    if (!v44)
                    {
LABEL_41:

                      id v13 = v69;
LABEL_42:

                      id v15 = v75;
                      id v26 = a8;
                      goto LABEL_43;
                    }
                    unint64_t v66 = [v70 compare:v71];

                    id v13 = v69;
                    id v15 = v75;
                    id v26 = a8;
                    if (v66 != -1) {
                      goto LABEL_43;
                    }
                    goto LABEL_15;
                  }
                }

                id v13 = v69;
              }
            }
          }

          id v15 = v75;
          id v26 = a8;
        }
LABEL_15:
        if ((objc_msgSend(*(id *)(v24 + 856), "domainIsProhibitedForSavingCredentials:", v28, v66) & 1) == 0)
        {
          id v33 = v28;

          [v81 insertObject:v33 atIndex:0];
          uint64_t v23 = v30;
          v82 = v33;
          id v25 = a1;
          goto LABEL_46;
        }
LABEL_43:
        if (v26 && ([*(id *)(v24 + 856) domainIsProhibitedForSavingCredentials:v28] & 1) == 0) {
          [v81 addObject:v28];
        }
LABEL_46:
        ++v27;
      }
      while (v85 != v27);
      uint64_t v60 = [obj countByEnumeratingWithState:&v88 objects:v92 count:16];
      uint64_t v85 = v60;
      if (!v60)
      {
LABEL_58:

        uint64_t v61 = v82;
        if (([v12 containsObject:v82] & 1) == 0)
        {
          uint64_t v62 = objc_msgSend(v82, "safari_highLevelDomainForPasswordManager");

          uint64_t v61 = (void *)v62;
        }
        id v14 = v76;
        if (a8)
        {
          id v63 = [v81 array];
          v86[0] = MEMORY[0x263EF8330];
          v86[1] = 3221225472;
          v86[2] = __124__SFSafariCredentialStore__bestDomainFromApprovedDomainsForWebCredentials_appLinks_otherServices_appID_appNames_allDomains___block_invoke;
          v86[3] = &unk_2643911C0;
          id v87 = v12;
          objc_msgSend(v63, "safari_mapObjectsUsingBlock:", v86);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        v64 = objc_msgSend(v61, "safari_simplifiedSiteNameForCredentialLookup", v66);

        goto LABEL_63;
      }
    }
  }
  v64 = 0;
  if (a8) {
    *a8 = 0;
  }
LABEL_63:

  return v64;
}

id __124__SFSafariCredentialStore__bestDomainFromApprovedDomainsForWebCredentials_appLinks_otherServices_appID_appNames_allDomains___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v3, "safari_highLevelDomainForPasswordManager");
    id v6 = (void *)v5;
    if (v5) {
      id v7 = (void *)v5;
    }
    else {
      id v7 = v3;
    }
    id v4 = v7;
  }
  return v4;
}

+ (void)_getDomainsApprovedForWebCredentials:(id *)a3 domainsApprovedForAppLinks:(id *)a4 domainsApprovedForOtherServices:(id *)a5 fromDatabaseEntries:(id)a6
{
  id v21 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a6;
  id v8 = [MEMORY[0x263EFF9C0] set];
  id v9 = [MEMORY[0x263EFF9C0] set];
  uint64_t v10 = [MEMORY[0x263EFF9C0] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend(v16, "domain", v21);
        if (v17)
        {
          uint64_t v18 = [v16 service] - 1;
          id v19 = v8;
          switch(v18)
          {
            case 0:
            case 1:
            case 2:
            case 3:
            case 5:
              id v19 = v10;
              goto LABEL_9;
            case 4:
              id v19 = v9;
              goto LABEL_9;
            case 6:
LABEL_9:
              [v19 addObject:v17];
              break;
            default:
              break;
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v20 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v13 = v20;
    }
    while (v20);
  }

  *a3 = (id)[v8 copy];
  id *v21 = (id)[v9 copy];
  *a5 = (id)[v10 copy];
}

+ (void)bestDomainForAppID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __64__SFSafariCredentialStore_bestDomainForAppID_completionHandler___block_invoke;
      v9[3] = &unk_264391210;
      id v12 = a1;
      id v11 = v7;
      id v10 = v6;
      [a1 _approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:v10 completionHandler:v9];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __64__SFSafariCredentialStore_bestDomainForAppID_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[6];
  id v13 = 0;
  id v14 = 0;
  id v12 = 0;
  [v3 _getDomainsApprovedForWebCredentials:&v14 domainsApprovedForAppLinks:&v13 domainsApprovedForOtherServices:&v12 fromDatabaseEntries:a2];
  id v4 = v14;
  id v5 = v13;
  id v6 = v12;
  uint64_t v8 = a1[5];
  id v7 = (void *)a1[6];
  uint64_t v9 = a1[4];
  id v10 = [v7 appNamesForAppID:v9];
  id v11 = [v7 _bestDomainFromApprovedDomainsForWebCredentials:v4 appLinks:v5 otherServices:v6 appID:v9 appNames:v10 allDomains:0];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
}

+ (id)bestDomainForAutoFillFromDomains:(id)a3 appID:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFFA08];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithArray:v8];

  id v10 = [a1 appNamesForAppID:v7];
  id v11 = [a1 _bestDomainFromApprovedDomainsForWebCredentials:v9 appLinks:0 otherServices:0 appID:v7 appNames:v10 allDomains:0];

  return v11;
}

+ (BOOL)_savedAccount:(id)a3 isRelatedToEntryHighLevelDomains:(id)a4 andWebsiteURL:(id)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v29 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 highLevelDomain];
  v35[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];

  uint64_t v27 = v7;
  id v11 = [v7 additionalSites];
  id v12 = objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_54);
  id v13 = [v10 arrayByAddingObjectsFromArray:v12];

  char v14 = v8 == 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    char v17 = 0;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        char v21 = [v29 containsObject:v20];
        if (v8)
        {
          uint64_t v22 = [v8 host];
          long long v23 = objc_msgSend(v22, "safari_highLevelDomainForPasswordManager");
          char v24 = [v20 isEqualToString:v23];
        }
        else
        {
          char v24 = 0;
        }
        v17 |= v21;
        v14 |= v24;
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v16);
    char v25 = v17 & v14;
  }
  else
  {
    char v25 = 0;
  }

  return v25 & 1;
}

uint64_t __88__SFSafariCredentialStore__savedAccount_isRelatedToEntryHighLevelDomains_andWebsiteURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_highLevelDomainForPasswordManager");
}

+ (void)_sortCredentials:(id)a3 appID:(id)a4 usingApprovedSharedWebCredentialsDatabaseEntries:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "service", v27);
        if (v19 == 5)
        {
          uint64_t v20 = [v18 domain];
          char v21 = v11;
        }
        else if (v19 == 7)
        {
          uint64_t v20 = [v18 domain];
          char v21 = v10;
        }
        else
        {
          uint64_t v20 = [v18 domain];
          char v21 = v12;
        }
        [v21 addObject:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  uint64_t v22 = [a1 appNamesForAppID:v8];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __99__SFSafariCredentialStore__sortCredentials_appID_usingApprovedSharedWebCredentialsDatabaseEntries___block_invoke;
  v28[3] = &unk_264391258;
  id v32 = v22;
  id v33 = a1;
  id v29 = v10;
  id v30 = v11;
  id v31 = v12;
  id v23 = v22;
  id v24 = v12;
  id v25 = v11;
  id v26 = v10;
  [v27 sortWithOptions:16 usingComparator:v28];
}

uint64_t __99__SFSafariCredentialStore__sortCredentials_appID_usingApprovedSharedWebCredentialsDatabaseEntries___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)a1[8];
  id v8 = [v5 site];
  uint64_t v9 = [v7 _scoreForDomain:v8 domainsApprovedForWebCredentials:a1[4] domainsApprovedForAppLinks:a1[5] domainsApprovedForOtherServices:a1[6] appNames:a1[7]];

  id v10 = (void *)a1[8];
  id v11 = [v6 site];
  uint64_t v12 = [v10 _scoreForDomain:v11 domainsApprovedForWebCredentials:a1[4] domainsApprovedForAppLinks:a1[5] domainsApprovedForOtherServices:a1[6] appNames:a1[7]];

  if (v9 >= v12)
  {
    if (v9 <= v12)
    {
      uint64_t v14 = [v5 lastUsedDate];
      uint64_t v15 = [v6 lastUsedDate];
      uint64_t v16 = (void *)v15;
      if (v14 && v15)
      {
        if ([(id)v14 compare:v15] == -1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = -1;
        }
      }
      else
      {
        if (v14) {
          uint64_t v13 = -1;
        }
        else {
          uint64_t v13 = 1;
        }
        if (!(v14 | v15))
        {
          int v17 = [v5 isDefaultForAnAssociatedDomain];
          int v18 = [v6 isDefaultForAnAssociatedDomain];
          if ((v17 & 1) != 0 || !v18)
          {
            if ((v17 ^ 1 | v18) == 1)
            {
              id v27 = [v5 site];
              uint64_t v19 = [v6 site];
              uint64_t v20 = objc_msgSend(v27, "safari_simplifiedSiteNameForCredentialLookup");
              char v21 = objc_msgSend(v19, "safari_simplifiedSiteNameForCredentialLookup");
              uint64_t v28 = v20;
              uint64_t v22 = numberOfDotsInString(v20);
              uint64_t v23 = numberOfDotsInString(v21);
              id v24 = [NSNumber numberWithUnsignedInteger:v22];
              id v25 = [NSNumber numberWithUnsignedInteger:v23];
              uint64_t v13 = [v24 compare:v25];

              if (!v13) {
                uint64_t v13 = [v27 caseInsensitiveCompare:v19];
              }
            }
            else
            {
              uint64_t v13 = -1;
            }
          }
          else
          {
            uint64_t v13 = 1;
          }
        }
      }
    }
    else
    {
      uint64_t v13 = -1;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

+ (int64_t)_scoreForDomain:(id)a3 domainsApprovedForWebCredentials:(id)a4 domainsApprovedForAppLinks:(id)a5 domainsApprovedForOtherServices:(id)a6 appNames:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ([a4 containsObject:v11]) {
    uint64_t v15 = 6;
  }
  else {
    uint64_t v15 = 0;
  }
  if ([v12 containsObject:v11]) {
    v15 += 2;
  }
  int64_t v16 = v15 | [v13 containsObject:v11];
  int v17 = objc_msgSend(v11, "safari_stringByRemovingTopLevelDomainFromHost");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        if (objc_msgSend(v17, "safari_isCaseInsensitiveEqualToString:", *(void *)(*((void *)&v33 + 1) + 8 * i)))
        {
          v16 += 3;
          goto LABEL_25;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v23 = v18;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v30;
    while (2)
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v23);
        }
        if (objc_msgSend(v17, "safari_hasCaseInsensitiveSuffix:", *(void *)(*((void *)&v29 + 1) + 8 * j), (void)v29))
        {
          v16 += 2;
          goto LABEL_25;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  return v16;
}

+ (void)getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:(id)a3 completionHandler:(id)a4
{
}

+ (void)getAllApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:(id)a3 completionHandler:(id)a4
{
}

+ (void)_getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:(id)a3 maximumNumberOfEntriesToReturn:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke;
  v12[3] = &unk_2643912F8;
  id v15 = a1;
  unint64_t v16 = a4;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a1 getApprovedSharedWebCredentialsEntriesForAppWithAppID:v11 completionHandler:v12];
}

void __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 48);
  id v38 = 0;
  v39[0] = 0;
  id v37 = 0;
  id v4 = a2;
  [v3 _getDomainsApprovedForWebCredentials:v39 domainsApprovedForAppLinks:&v38 domainsApprovedForOtherServices:&v37 fromDatabaseEntries:v4];
  id v5 = v39[0];
  id v6 = v38;
  id v7 = v37;
  id v8 = [*(id *)(a1 + 48) appNamesForAppID:*(void *)(a1 + 32)];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_2;
  v30[3] = &unk_264391280;
  id v10 = v9;
  uint64_t v11 = *(void *)(a1 + 48);
  id v31 = v10;
  uint64_t v36 = v11;
  id v12 = v5;
  id v32 = v12;
  id v13 = v6;
  id v33 = v13;
  id v14 = v7;
  id v34 = v14;
  id v15 = v8;
  id v35 = v15;
  unint64_t v16 = (void *)MEMORY[0x21D47DB00](v30);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_3;
  v28[3] = &unk_2643912A8;
  id v17 = v16;
  id v29 = v17;
  id v18 = [v4 sortedArrayUsingComparator:v28];

  uint64_t v19 = [MEMORY[0x263EFF9C0] set];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_4;
  uint64_t v26 = &unk_2643912D0;
  id v27 = v19;
  id v20 = v19;
  uint64_t v21 = objc_msgSend(v18, "safari_mapAndFilterObjectsUsingBlock:", &v23);

  if ((unint64_t)objc_msgSend(v21, "count", v23, v24, v25, v26) > *(void *)(a1 + 56))
  {
    uint64_t v22 = [v21 subarrayWithRange:0];

    uint64_t v21 = (void *)v22;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 integerValue];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 72) _scoreForDomain:v3 domainsApprovedForWebCredentials:*(void *)(a1 + 40) domainsApprovedForAppLinks:*(void *)(a1 + 48) domainsApprovedForOtherServices:*(void *)(a1 + 56) appNames:*(void *)(a1 + 64)];
    id v7 = [NSNumber numberWithInteger:v6];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v3];
  }
  return v6;
}

uint64_t __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v5 service];
  unint64_t v8 = [v6 service];
  if (v7 == v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [v6 domain];
    uint64_t v11 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [v5 domain];
    uint64_t v14 = v11 - (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
  else if (v7 > v8)
  {
    uint64_t v14 = -1;
  }
  else
  {
    uint64_t v14 = 1;
  }

  return v14;
}

id __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  if ([*(id *)(a1 + 32) containsObject:v4])
  {
    id v5 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v4];
    id v5 = v3;
  }

  return v5;
}

+ (void)_approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, void))a4;
  if ([v7 length]) {
    [a1 _approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID:v7 completionHandler:v6];
  }
  else {
    v6[2](v6, MEMORY[0x263EFFA68]);
  }
}

+ (void)_approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!quirksManager)
  {
    id v8 = objc_alloc(MEMORY[0x263F66278]);
    uint64_t v9 = objc_msgSend(MEMORY[0x263F086E0], "safari_safariCoreBundle");
    id v10 = [v9 URLForResource:@"WBSAutoFillQuirks" withExtension:@"plist"];
    uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v12 = objc_msgSend(v11, "safari_autoFillQuirksDownloadDirectoryURL");
    uint64_t v13 = [v8 initWithBuiltInQuirksURL:v10 downloadsDirectoryURL:v12 resourceName:@"AutoFillQuirks" resourceVersion:@"1" updateDateDefaultsKey:*MEMORY[0x263F66508] updateInterval:0.0];
    uint64_t v14 = (void *)quirksManager;
    quirksManager = v13;

    [(id)quirksManager setShouldAttemptToDownloadConfiguration:0];
    [(id)quirksManager beginLoadingQuirksFromDisk];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __105__SFSafariCredentialStore__approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID_completionHandler___block_invoke;
  v17[3] = &unk_264391320;
  id v19 = v7;
  id v20 = a1;
  id v18 = v6;
  id v15 = v7;
  id v16 = v6;
  [a1 _sharedWebCredentialsDatabaseEntriesForAppWithAppID:v16 completionHandler:v17];
}

void __105__SFSafariCredentialStore__approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_77);
  id v4 = (void *)[v3 mutableCopy];
  if ([*(id *)(a1 + 48) _shouldUseQuirks])
  {
    uint64_t v25 = v3;
    id v5 = [(id)quirksManager appToWebsiteAssociationManager];
    id v6 = [v5 domainsWithAssociatedCredentialsForAppID:*(void *)(a1 + 32)];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [[SFSharedWebCredentialsDatabaseEntry alloc] _initWithDomain:*(void *)(*((void *)&v39 + 1) + 8 * i) appID:*(void *)(a1 + 32) service:7 isApproved:1];
          [v4 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v9);
    }
    uint64_t v24 = v7;

    uint64_t v28 = [(id)quirksManager associatedDomainsManager];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = (id)[v4 copy];
    uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v29)
    {
      uint64_t v27 = *(void *)v36;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = v13;
          uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
          id v15 = [v14 domain];
          id v16 = [v28 domainsWithAssociatedCredentialsForDomain:v15];
          id v17 = [v16 allObjects];

          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v32;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v32 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = -[SFSharedWebCredentialsDatabaseEntry _initWithDomain:appID:service:isApproved:]([SFSharedWebCredentialsDatabaseEntry alloc], "_initWithDomain:appID:service:isApproved:", *(void *)(*((void *)&v31 + 1) + 8 * j), *(void *)(a1 + 32), [v14 service], 1);
                [v4 addObject:v23];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
            }
            while (v20);
          }

          uint64_t v13 = v30 + 1;
        }
        while (v30 + 1 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v29);
    }

    id v3 = v25;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __105__SFSafariCredentialStore__approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isApproved];
}

+ (BOOL)_shouldUseQuirks
{
  return [MEMORY[0x263F6BD70] isDeveloperModeEnabled] ^ 1;
}

+ (void)_sharedWebCredentialsDatabaseEntriesForAppWithAppID:(id)a3 completionHandler:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F6BD78];
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithServiceType:0 applicationIdentifier:v7 domain:0];

  id v13 = 0;
  uint64_t v9 = [MEMORY[0x263F6BD70] serviceDetailsWithServiceSpecifier:v8 error:&v13];
  id v10 = v13;
  if (v10)
  {
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SFSafariCredentialStore _sharedWebCredentialsDatabaseEntriesForAppWithAppID:completionHandler:](v11, v10);
    }
    v6[2](v6, MEMORY[0x263EFFA68]);
  }
  else
  {
    uint64_t v12 = objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_82);
    v6[2](v6, v12);

    id v6 = (void (**)(id, void))v12;
  }
}

SFSharedWebCredentialsDatabaseEntry *__97__SFSafariCredentialStore__sharedWebCredentialsDatabaseEntriesForAppWithAppID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SFSharedWebCredentialsDatabaseEntry alloc] initWithServiceDetails:v2];

  return v3;
}

+ (BOOL)_appIsEntitledWebBrowser:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:a3 error:0];
  id v4 = [v3 entitlements];
  id v5 = self;
  id v6 = [v4 objectForKey:@"com.apple.developer.web-browser" ofClass:v5];

  LOBYTE(v4) = [v6 BOOLValue];
  return (char)v4;
}

+ (id)_credentialProviderExtensionHelperProxy
{
  id v2 = objc_alloc_init(SFCredentialProviderExtensionHelperProxy);
  return v2;
}

+ (void)_getExternalCredentialsForAppID:(id)a3 matchingSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 isEntitledWebBrowser:(BOOL)a6 hasPasskeyRequest:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v32[2] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (v16 && v10)
  {
    id v18 = [v16 host];
    uint64_t v19 = v18;
    if (v18)
    {
      v32[0] = v18;
      uint64_t v20 = objc_msgSend(v18, "safari_highLevelDomainForPasswordManager");
      v32[1] = v20;
      uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = objc_msgSend(v15, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_85);
  }
  if ([v21 count])
  {
    uint64_t v22 = [a1 _credentialProviderExtensionHelperProxy];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_2;
    v25[3] = &unk_2643913B0;
    id v26 = v16;
    id v31 = a1;
    id v27 = v14;
    id v28 = v15;
    id v30 = v17;
    id v23 = v22;
    id v29 = v23;
    uint64_t v24 = (void *)MEMORY[0x21D47DB00](v25);
    if (v9) {
      [v23 fetchAllCredentialIdentitiesMatchingDomains:v21 completion:v24];
    }
    else {
      [v23 fetchPasswordCredentialIdentitiesMatchingDomains:v21 completion:v24];
    }
  }
  else
  {
    (*((void (**)(id, void))v17 + 2))(v17, MEMORY[0x263EFFA68]);
  }
}

uint64_t __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 domain];
}

void __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 sortedArrayUsingComparator:&__block_literal_global_88];
  id v4 = [*(id *)(a1 + 32) host];
  id v5 = objc_msgSend(v4, "safari_highLevelDomainForPasswordManager");

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_4;
  v11[3] = &unk_264391388;
  id v12 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", v11);
  uint64_t v8 = (void *)[v7 mutableCopy];

  [*(id *)(a1 + 72) _sortCredentials:v8 appID:*(void *)(a1 + 40) usingApprovedSharedWebCredentialsDatabaseEntries:*(void *)(a1 + 48)];
  BOOL v9 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v8];
  BOOL v10 = [v9 array];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 56) invalidate];
}

uint64_t __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

SFSafariCredential *__164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = *(void **)(a1 + 32);
  if (v5
    && ([v3 site],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "safari_highLevelDomainForPasswordManager"),
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = objc_msgSend(v5, "safari_isCaseInsensitiveEqualToString:", v7),
        v7,
        v6,
        !v8))
  {
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = [[SFSafariCredential alloc] initWithExternalCredential:v4];
  }

  return v9;
}

+ (id)textSuggestionHeaderForExternalCredential:(id)a3
{
  id v4 = [a3 externalCredential];
  id v5 = [a1 titleForCredentialIdentity:v4 formURL:0];

  return v5;
}

+ (id)titleForCredentialIdentity:(id)a3 formURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SFAutoFillFeatureManager sharedFeatureManager];
  if ([v7 shouldAutoFillPasswordsFromKeychain])
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v9 = +[SFCredentialProviderExtensionManager sharedManager];
    BOOL v10 = [v9 getEnabledExtensionsSynchronously];
    BOOL v8 = (unint64_t)[v10 count] > 1;
  }
  uint64_t v11 = [v5 site];
  id v12 = [v6 host];

  int v13 = objc_msgSend(v12, "safari_isCaseInsensitiveEqualToString:", v11);
  if (v13)
  {
    id v14 = &stru_26CA7A2D0;
    switch([v5 type])
    {
      case 0:
        goto LABEL_27;
      case 1:
        if (!v8) {
          goto LABEL_26;
        }
        id v15 = NSString;
        goto LABEL_22;
      case 2:
        if (!v8) {
          goto LABEL_26;
        }
        id v15 = NSString;
        goto LABEL_22;
      case 4:
        if (!v8)
        {
LABEL_26:
          _WBSLocalizedString();
          id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        id v15 = NSString;
LABEL_22:
        id v18 = _WBSLocalizedString();
        uint64_t v19 = [v5 owningExtensionState];
        uint64_t v20 = [v19 localizedDisplayName];
        objc_msgSend(v15, "stringWithFormat:", v18, v20, v22);
        break;
      default:
        goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_8:
  uint64_t v16 = [v5 type];
  switch(v16)
  {
    case 4:
      id v17 = NSString;
      if (!v8) {
        goto LABEL_24;
      }
      break;
    case 2:
      id v17 = NSString;
      if (!v8) {
        goto LABEL_24;
      }
      break;
    case 1:
      id v17 = NSString;
      if (v8) {
        break;
      }
LABEL_24:
      id v18 = _WBSLocalizedString();
      objc_msgSend(v17, "stringWithFormat:", v18, v11);
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    default:
      id v14 = &stru_26CA7A2D0;
      goto LABEL_27;
  }
  id v18 = _WBSLocalizedString();
  uint64_t v19 = [v5 owningExtensionState];
  uint64_t v20 = [v19 localizedDisplayName];
  objc_msgSend(v17, "stringWithFormat:", v18, v11, v20);
LABEL_23:
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_25:
LABEL_27:

  return v14;
}

+ (void)_getBundleIDForEnabledCredentialProvidersWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[SFCredentialProviderExtensionManager sharedManager];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __90__SFSafariCredentialStore__getBundleIDForEnabledCredentialProvidersWithCompletionHandler___block_invoke;
  v6[3] = &unk_2643913F8;
  id v7 = v3;
  id v5 = v3;
  [v4 getEnabledExtensionsWithCompletion:v6];
}

void __90__SFSafariCredentialStore__getBundleIDForEnabledCredentialProvidersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_150);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __90__SFSafariCredentialStore__getBundleIDForEnabledCredentialProvidersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_bundleIdentifierForContainingApp");
}

+ (void)getExternalPasskeyCredentialIdentitiesForDomains:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [a1 _credentialProviderExtensionHelperProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__SFSafariCredentialStore_getExternalPasskeyCredentialIdentitiesForDomains_completionHandler___block_invoke;
  v10[3] = &unk_2643913F8;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchPasskeyCredentialIdentitiesMatchingDomains:v7 completion:v10];
}

void __94__SFSafariCredentialStore_getExternalPasskeyCredentialIdentitiesForDomains_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sortedArrayUsingComparator:&__block_literal_global_152];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__SFSafariCredentialStore_getExternalPasskeyCredentialIdentitiesForDomains_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

+ (void)getAllExternalPasskeyCredentialIdentitiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _credentialProviderExtensionHelperProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__SFSafariCredentialStore_getAllExternalPasskeyCredentialIdentitiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_2643913F8;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAllPaskeyCredentialIdentitiesWithCompletion:v7];
}

void __90__SFSafariCredentialStore_getAllExternalPasskeyCredentialIdentitiesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sortedArrayUsingComparator:&__block_literal_global_154];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SFSafariCredentialStore_getAllExternalPasskeyCredentialIdentitiesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

+ (void)getOneTimeCodeCredentialsForAppWithAppID:(id)a3 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a4 websiteURL:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  char v14 = [a1 _appIsEntitledWebBrowser:v13];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke;
  v18[3] = &unk_264391468;
  id v19 = v10;
  id v20 = v11;
  char v23 = v14;
  id v21 = v12;
  id v22 = a1;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [a1 _approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:v13 completionHandler:v18];
}

void __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_156);
  id v4 = (void *)[v3 mutableCopy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_3;
        v15[3] = &unk_264391420;
        v15[4] = v10;
        if ((objc_msgSend(v4, "safari_containsObjectPassingTest:", v15) & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if (![v4 count])
  {
    id v11 = [*(id *)(a1 + 40) host];
    id v12 = objc_msgSend(v11, "safari_highLevelDomainForPasswordManager");

    if (!*(unsigned char *)(a1 + 64) || !v12)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_15;
    }
    [v4 addObject:v12];
  }
  id v12 = [*(id *)(a1 + 56) _credentialProviderExtensionHelperProxy];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_4;
  v13[3] = &unk_2643913F8;
  id v14 = *(id *)(a1 + 48);
  [v12 fetchOneTimeCodeCredentialIdentitiesMatchingDomains:v4 completion:v13];

LABEL_15:
}

uint64_t __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 domain];
}

uint64_t __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

void __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = [a2 sortedArrayUsingComparator:&__block_literal_global_159];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_161);
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

uint64_t __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

SFSafariCredential *__153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[SFSafariCredential alloc] initWithExternalCredential:v2];

  return v3;
}

+ (void)getCredentialsForAppWithAppID:(os_log_t)log frameIdentifier:externallyVerifiedAndApprovedSharedWebCredentialDomains:websiteURL:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218FBF000, log, OS_LOG_TYPE_ERROR, "Timed out while querying for passkey request", v1, 2u);
}

+ (void)_getAllowedActionForAppCredentialsWithAppID:(void *)a1 websiteURL:user:password:shouldAnalyzeExistingCredentials:completionHandler:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_0(&dword_218FBF000, v3, v4, "Attempted to submit credential with user name that is not a string, got type: %@", v5, v6, v7, v8, 2u);
}

+ (void)_sharedWebCredentialsDatabaseEntriesForAppWithAppID:(void *)a1 completionHandler:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_218FBF000, v5, v6, "%{public}@", v7, v8, v9, v10, 2u);
}

@end