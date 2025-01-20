@interface SBApplicationShortcutService
+ (id)sharedInstance;
- (SBApplicationShortcutService)init;
- (id)_sanitizeApplicationShortcutItems:(id)a3 withEntitlements:(unint64_t)a4;
- (void)_authenticateClient:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)_checkEntitlementsForClient:(id)a3 withCompletionHandler:(id)a4;
- (void)applicationServer:(id)a3 client:(id)a4 fetchApplicationShortcutItemsOfTypes:(unint64_t)a5 forBundleIdentifier:(id)a6 withCompletion:(id)a7;
- (void)applicationServer:(id)a3 client:(id)a4 setDynamicApplicationShortcutItems:(id)a5 forBundleIdentifier:(id)a6;
@end

@implementation SBApplicationShortcutService

uint64_t __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 32) && (objc_msgSend(MEMORY[0x1E4FA6278], "sbh_isShortcutItemDeleteOrRemove:", v5) & 1) != 0) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FA6278], "sbh_isShortcutItemSpringBoardOnly:", v5) ^ 1;
  }

  return v7;
}

- (void)applicationServer:(id)a3 client:(id)a4 setDynamicApplicationShortcutItems:(id)a5 forBundleIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __112__SBApplicationShortcutService_applicationServer_client_setDynamicApplicationShortcutItems_forBundleIdentifier___block_invoke;
  v13[3] = &unk_1E6AFECF8;
  v13[4] = self;
  id v14 = v10;
  id v15 = v9;
  id v11 = v9;
  id v12 = v10;
  [(SBApplicationShortcutService *)self _authenticateClient:v11 forBundleIdentifier:a6 withCompletionHandler:v13];
}

- (void)applicationServer:(id)a3 client:(id)a4 fetchApplicationShortcutItemsOfTypes:(unint64_t)a5 forBundleIdentifier:(id)a6 withCompletion:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if (v13)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke;
    v14[3] = &unk_1E6AFECD0;
    unint64_t v19 = a5;
    id v15 = v12;
    id v18 = v13;
    v16 = self;
    id v17 = v11;
    [(SBApplicationShortcutService *)self _authenticateClient:v17 forBundleIdentifier:v15 withCompletionHandler:v14];
  }
}

- (void)_authenticateClient:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __94__SBApplicationShortcutService__authenticateClient_forBundleIdentifier_withCompletionHandler___block_invoke;
      v12[3] = &unk_1E6AFEC38;
      id v13 = v8;
      id v14 = v9;
      id v15 = v11;
      [(SBApplicationShortcutService *)self _checkEntitlementsForClient:v13 withCompletionHandler:v12];
    }
    else
    {
      (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    }
  }
}

- (void)_checkEntitlementsForClient:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(void))a4;
  if (v6)
  {
    if (v7)
    {
      [(FBServiceClientAuthenticator *)self->_serviceClientFullAccessEntitlementAuthenticator authenticateClient:v7];
      [(FBServiceClientAuthenticator *)self->_serviceClientCustomImageEntitlementAuthenticator authenticateClient:v7];
    }
    v6[2](v6);
  }
}

void __94__SBApplicationShortcutService__authenticateClient_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) processHandle];
  id v4 = [v2 bundleIdentifier];

  if (*(void *)(a1 + 40) && (objc_msgSend(v4, "isEqualToString:") & 1) == 0) {
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else {
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v3();
}

void __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v6];
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 64);
  if ((v9 & 0x1000002) != 0)
  {
    int v10 = [v7 isLocked] ^ 1;
    uint64_t v11 = *(void *)(a1 + 64);
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    int v10 = 0;
    uint64_t v11 = *(void *)(a1 + 64);
    if (a2)
    {
LABEL_3:
      v41 = v8;
      char v42 = v11;
      unint64_t v43 = v11 & 8;
      id v12 = +[SBApplicationController sharedInstance];
      id v13 = [v12 applicationWithBundleIdentifier:v6];

      uint64_t v89 = 0;
      v90 = &v89;
      uint64_t v91 = 0x2020000000;
      uint64_t v92 = 0;
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      char v88 = 0;
      uint64_t v81 = 0;
      v82 = &v81;
      uint64_t v83 = 0x2020000000;
      char v84 = 0;
      uint64_t v77 = 0;
      v78 = &v77;
      uint64_t v79 = 0x2020000000;
      char v80 = 0;
      uint64_t v73 = 0;
      v74 = &v73;
      uint64_t v75 = 0x2020000000;
      char v76 = 0;
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__33;
      v71 = __Block_byref_object_dispose__33;
      id v72 = 0;
      if ((v9 & 0x1000000) != 0)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_16;
        block[3] = &unk_1E6AFEC60;
        v61 = &v89;
        id v59 = v6;
        v62 = &v85;
        v63 = &v81;
        v64 = &v77;
        v65 = &v73;
        v66 = &v67;
        id v60 = *(id *)(a1 + 32);
        dispatch_sync(MEMORY[0x1E4F14428], block);
      }
      if (v43)
      {
        id v15 = v13;
        if (*((unsigned char *)v78 + 24))
        {
          if (*((unsigned char *)v86 + 24)) {
            uint64_t v14 = 0;
          }
          else {
            uint64_t v14 = 3;
          }
          if (!v13)
          {
LABEL_29:
            v22 = 0;
            if ((v9 & 0x1000000) != 0)
            {
              id v29 = 0;
              v20 = 0;
              if (v68[5])
              {
                uint64_t v52 = 0;
                v53 = &v52;
                uint64_t v54 = 0x3032000000;
                v55 = __Block_byref_object_copy__33;
                v56 = __Block_byref_object_dispose__33;
                id v57 = 0;
                v46[0] = MEMORY[0x1E4F143A8];
                v46[1] = 3221225472;
                v46[2] = __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_2;
                v46[3] = &unk_1E6AFEC88;
                v48 = &v67;
                v49 = &v52;
                id v47 = v6;
                v50 = &v81;
                uint64_t v51 = v14;
                dispatch_sync(MEMORY[0x1E4F14428], v46);
                id v29 = (id)v53[5];

                _Block_object_dispose(&v52, 8);
                v22 = 0;
                v20 = 0;
              }
            }
            else
            {
              id v29 = 0;
              v20 = 0;
            }
            goto LABEL_33;
          }
        }
        else
        {
          uint64_t v14 = 0;
          if (!v13) {
            goto LABEL_29;
          }
        }
      }
      else
      {
        uint64_t v14 = 0;
        id v15 = v13;
        if (!v13) {
          goto LABEL_29;
        }
      }
      id v17 = [v15 info];
      int v18 = [v17 isBlockedForScreenTimeExpiration];

      if ((v9 & 0x1000001) != 0) {
        char v19 = v18;
      }
      else {
        char v19 = 1;
      }
      if (v19)
      {
        v20 = 0;
        id v15 = v13;
      }
      else
      {
        id v15 = v13;
        v21 = [v13 info];
        v20 = [v21 staticApplicationShortcutItems];
      }
      if ((v10 & ~v18) != 0)
      {
        v22 = [v15 dynamicApplicationShortcutItems];
        if ((v9 & 0x1000000) != 0)
        {
LABEL_25:
          uint64_t v39 = v14;
          v23 = [v15 info];
          v38 = (void *)MEMORY[0x1E4FA6278];
          v40 = [v15 displayName];
          v24 = [v23 itemID];
          uint64_t v37 = [v24 unsignedIntegerValue];
          uint64_t v36 = v90[3];
          char v25 = [v23 supportsMultiwindow];
          char v26 = [v15 isSystemApplication];
          char v27 = [v15 isInternalApplication];
          char v28 = [v23 isBeta];
          BYTE5(v35) = *((unsigned char *)v82 + 24);
          BYTE4(v35) = *((unsigned char *)v74 + 24);
          BYTE3(v35) = v28;
          BYTE2(v35) = v27;
          BYTE1(v35) = v26;
          LOBYTE(v35) = v25;
          objc_msgSend(v38, "composedShortcutsForApplicationWithBundleIdentifier:iconDisplayName:staticItems:dynamicItems:applicationItemID:numberOfDisplayItemsInSwitcher:supportsMultipleWindows:isSystemApplication:isInternalApplication:isApplicationInBeta:isApplicationHidden:iconManagerAllowsEditing:removeStyle:", v6, v40, v20, v22, v37, v36, v35, v39);
          id v29 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
          if ((v42 & 4) == 0)
          {
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_3;
            v44[3] = &__block_descriptor_33_e53_B24__0__SBSApplicationShortcutItem_8__NSDictionary_16l;
            char v45 = v43 >> 3;
            v30 = [MEMORY[0x1E4F28F60] predicateWithBlock:v44];
            uint64_t v31 = [v29 filteredArrayUsingPredicate:v30];

            uint64_t v32 = [v22 filteredArrayUsingPredicate:v30];

            v22 = (void *)v32;
            id v29 = (id)v31;
          }
          uint64_t v33 = *(void *)(a1 + 56);
          v34 = (void *)[objc_alloc(MEMORY[0x1E4FA69E0]) initWithStaticApplicationShortcutItems:v20 dynamicApplicationShortcutItems:v22 composedApplicationShortcutItems:v29];
          (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v34);

          _Block_object_dispose(&v67, 8);
          _Block_object_dispose(&v73, 8);
          _Block_object_dispose(&v77, 8);
          _Block_object_dispose(&v81, 8);
          _Block_object_dispose(&v85, 8);
          _Block_object_dispose(&v89, 8);

          id v8 = v41;
          goto LABEL_36;
        }
      }
      else
      {
        v22 = 0;
        if ((v9 & 0x1000000) != 0) {
          goto LABEL_25;
        }
      }
      id v29 = 0;
      goto LABEL_33;
    }
  }
  v16 = SBLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_36:
}

void __112__SBApplicationShortcutService_applicationServer_client_setDynamicApplicationShortcutItems_forBundleIdentifier___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    id v8 = [*(id *)(a1 + 32) _sanitizeApplicationShortcutItems:*(void *)(a1 + 40) withEntitlements:a3];
    uint64_t v9 = +[SBApplicationController sharedInstance];
    int v10 = [v9 applicationWithBundleIdentifier:v7];
    [v10 setDynamicApplicationShortcutItems:v8];
  }
  else
  {
    uint64_t v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __112__SBApplicationShortcutService_applicationServer_client_setDynamicApplicationShortcutItems_forBundleIdentifier___block_invoke_cold_1(a1);
    }
  }
}

- (id)_sanitizeApplicationShortcutItems:(id)a3 withEntitlements:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    v21 = &v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v11), "copy", v21);
        id v13 = v12;
        if ((v4 & 2) == 0)
        {
          uint64_t v14 = [v12 bundleIdentifierToLaunch];

          if (v14)
          {
            id v15 = SBLogCommon();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[SBApplicationShortcutService _sanitizeApplicationShortcutItems:withEntitlements:]();
            }

            [v13 setBundleIdentifierToLaunch:0];
          }
        }
        v16 = [v13 icon];
        if ((v4 & 3) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = SBLogCommon();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[SBApplicationShortcutService _sanitizeApplicationShortcutItems:withEntitlements:]();
            }

            [v13 setIcon:0];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v18 = [v16 imageData];

            if (v18)
            {
              char v19 = SBLogCommon();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                -[SBApplicationShortcutService _sanitizeApplicationShortcutItems:withEntitlements:]();
              }

              [v13 setIcon:0];
            }
          }
        }
        if (v13) {
          [v6 addObject:v13];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1) {
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_111);
  }
  v2 = (void *)sharedInstance___sharedInstance_8;
  return v2;
}

void __46__SBApplicationShortcutService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBApplicationShortcutService);
  v1 = (void *)sharedInstance___sharedInstance_8;
  sharedInstance___sharedInstance_8 = (uint64_t)v0;
}

- (SBApplicationShortcutService)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBApplicationShortcutService;
  v2 = [(SBApplicationShortcutService *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v4 = [v3 initWithEntitlement:*MEMORY[0x1E4FA6ED0]];
    serviceClientFullAccessEntitlementAuthenticator = v2->_serviceClientFullAccessEntitlementAuthenticator;
    v2->_serviceClientFullAccessEntitlementAuthenticator = (FBServiceClientAuthenticator *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v7 = [v6 initWithEntitlement:*MEMORY[0x1E4FA6EC8]];
    serviceClientCustomImageEntitlementAuthenticator = v2->_serviceClientCustomImageEntitlementAuthenticator;
    v2->_serviceClientCustomImageEntitlementAuthenticator = (FBServiceClientAuthenticator *)v7;

    uint64_t v9 = +[SBApplicationServer sharedInstance];
    [v9 setShortcutDelegate:v2];
  }
  return v2;
}

void __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_16(void *a1)
{
  v2 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  id v3 = [v2 _recentAppLayoutsController];
  uint64_t v4 = [v3 recentDisplayItemsForBundleIdentifier:a1[4] includingHiddenAppLayouts:0];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v4 count];

  id v5 = +[SBLockStateAggregator sharedInstance];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v5 hasAnyLockState];

  id v15 = +[SBIconController sharedInstance];
  id v6 = [v15 iconManager];
  char v7 = 0;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    char v7 = [v6 isEditingAllowed];
  }
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v7;
  uint64_t v8 = [v15 model];
  uint64_t v9 = [v8 applicationIconForBundleIdentifier:a1[4]];

  if (v9)
  {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = [v15 isUninstallSupportedForIcon:v9];
    if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
      char v10 = 0;
    }
    else {
      char v10 = [v6 isIconIgnored:v9];
    }
  }
  else
  {
    char v10 = 0;
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 0;
  }
  *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = v10;
  objc_super v11 = +[SBApplicationPlaceholderController sharedInstance];
  uint64_t v12 = [v11 placeholderForDisplayID:a1[5]];
  uint64_t v13 = *(void *)(a1[11] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_2(void *a1)
{
  id v12 = +[SBApplicationPlaceholderController sharedInstance];
  v2 = [v12 placeholdersByDisplayID];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  uint64_t v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) applicationItemID];
  uint64_t v5 = [v4 unsignedIntegerValue];

  id v6 = [*(id *)(*(void *)(a1[5] + 8) + 40) applicationDisplayName];
  LOBYTE(v11) = [*(id *)(*(void *)(a1[5] + 8) + 40) canBeShared];
  LOBYTE(v10) = *(unsigned char *)(*(void *)(a1[7] + 8) + 24);
  uint64_t v7 = [MEMORY[0x1E4FA6278] composedShortcutsForDownloadingApplicationWithBundleIdentifier:a1[4] iconDisplayName:v6 applicationItemID:v5 canModifyDownloadState:0 prioritizationIsAvailable:v3 downloadingInformationAgent:*(void *)(*(void *)(a1[5] + 8) + 40) iconManagerAllowsEditing:v10 removeStyle:a1[8] canShare:v11];
  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClientCustomImageEntitlementAuthenticator, 0);
  objc_storeStrong((id *)&self->_serviceClientFullAccessEntitlementAuthenticator, 0);
}

- (void)_sanitizeApplicationShortcutItems:withEntitlements:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_1_11();
  BOOL v3 = NSStringFromClass(v2);
  _DWORD *v1 = 138543362;
  void *v0 = v3;
  OUTLINED_FUNCTION_0_11(&dword_1D85BA000, v4, v5, "[%{public}@] Client is not entitled to set a contact icon with custom image data. Ignoring.");
}

- (void)_sanitizeApplicationShortcutItems:withEntitlements:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_1_11();
  BOOL v3 = NSStringFromClass(v2);
  _DWORD *v1 = 138543362;
  void *v0 = v3;
  OUTLINED_FUNCTION_0_11(&dword_1D85BA000, v4, v5, "[%{public}@] Client is not entitled to set an icon using a custom (dynamic, non-masked) image. Ignoring.");
}

- (void)_sanitizeApplicationShortcutItems:withEntitlements:.cold.3()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_1_11();
  BOOL v3 = NSStringFromClass(v2);
  _DWORD *v1 = 138543362;
  void *v0 = v3;
  OUTLINED_FUNCTION_0_11(&dword_1D85BA000, v4, v5, "[%{public}@] Client is not entitled to set bundleIdentifierToLaunch. Ignoring.");
}

void __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_cold_1(uint64_t a1)
{
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  uint64_t v10 = [*(id *)(a1 + 48) processHandle];
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v4, v5, "[%{public}@] Client process [%@] is not entitled to request application shortcut items on behalf of another process. Ignoring request.", v6, v7, v8, v9, 2u);
}

void __112__SBApplicationShortcutService_applicationServer_client_setDynamicApplicationShortcutItems_forBundleIdentifier___block_invoke_cold_1(uint64_t a1)
{
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  uint64_t v10 = [*(id *)(a1 + 48) processHandle];
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v4, v5, "[%{public}@] Client process [%@] is not entitled to change dynamic application shortcut items on behalf of another process. Ignoring request.", v6, v7, v8, v9, 2u);
}

@end