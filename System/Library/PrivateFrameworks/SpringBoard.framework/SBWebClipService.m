@interface SBWebClipService
+ (id)bestWebClipForTargetContentIdentifier:(id)a3 fromWebClips:(id)a4;
- (BOOL)_addActivationActionToSceneEntity:(id)a3 forWebClip:(id)a4;
- (SBWebClipService)initWithWorkspace:(id)a3 sceneManager:(id)a4 placeholderController:(id)a5 applicationController:(id)a6 lockScreenManager:(id)a7;
- (double)pendingLaunchTimeout;
- (id)initForTestingWithPlaceholderController:(id)a3 applicationController:(id)a4;
- (id)targetApplicationBundleIdentifierForWebClip:(id)a3;
- (void)_applicationsDidChange:(id)a3;
- (void)_beginWaitingForBundleIdentifier:(id)a3 webClipIdentifier:(id)a4 launchOrigin:(id)a5;
- (void)_clearPendingLaunch;
- (void)_generateUserActivityDataFromUserActivity:(id)a3 completion:(id)a4;
- (void)_performActionIfContinuitySessionActive:(id)a3;
- (void)_placeholdersDidChange:(id)a3;
- (void)_queue_addConnection:(id)a3;
- (void)_queue_removeConnection:(id)a3;
- (void)buildLaunchActionsForAppClipWithWebClipIdentifier:(id)a3 completion:(id)a4;
- (void)launchWebClipWithIdentifier:(id)a3 origin:(id)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)prepareToLaunchWebClipWithIdentifier:(id)a3 handler:(id)a4;
- (void)setPendingLaunchTimeout:(double)a3;
- (void)updateWebClipPropertiesWithIdentifier:(id)a3;
@end

@implementation SBWebClipService

- (SBWebClipService)initWithWorkspace:(id)a3 sceneManager:(id)a4 placeholderController:(id)a5 applicationController:(id)a6 lockScreenManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)SBWebClipService;
  v17 = [(SBWebClipService *)&v34 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_workspace, v12);
    objc_storeWeak((id *)&v18->_sceneManager, v13);
    objc_storeStrong((id *)&v18->_placeholderController, a5);
    objc_storeStrong((id *)&v18->_applicationController, a6);
    objc_storeStrong((id *)&v18->_lockScreenManager, a7);
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    connections = v18->_connections;
    v18->_connections = v19;

    v18->_pendingLaunchTimeout = 5.0;
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.dimSumService"];
    legacyClientAuthenticator = v18->_legacyClientAuthenticator;
    v18->_legacyClientAuthenticator = (FBServiceClientAuthenticator *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.webClipService"];
    clientAuthenticator = v18->_clientAuthenticator;
    v18->_clientAuthenticator = (FBServiceClientAuthenticator *)v23;

    uint64_t v25 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v18->_serviceQueue;
    v18->_serviceQueue = (OS_dispatch_queue *)v25;

    v27 = (void *)MEMORY[0x1E4F628A0];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __113__SBWebClipService_initWithWorkspace_sceneManager_placeholderController_applicationController_lockScreenManager___block_invoke;
    v32[3] = &unk_1E6AF58F0;
    v28 = v18;
    v33 = v28;
    uint64_t v29 = [v27 listenerWithConfigurator:v32];
    id v30 = v28[8];
    v28[8] = (id)v29;

    [v28[8] activate];
  }

  return v18;
}

void __113__SBWebClipService_initWithWorkspace_sceneManager_placeholderController_applicationController_lockScreenManager___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6CC0] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (id)initForTestingWithPlaceholderController:(id)a3 applicationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(SBWebClipService *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeholderController, a3);
    objc_storeStrong((id *)&v10->_applicationController, a4);
    v10->_pendingLaunchTimeout = 5.0;
  }

  return v10;
}

- (void)prepareToLaunchWebClipWithIdentifier:(id)a3 handler:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v57 = (void (**)(void))a4;
  v59 = v6;
  id v7 = [MEMORY[0x1E4F43048] webClipWithIdentifier:v6];
  if (!v7)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2 object:self file:@"SBWebClipService.m" lineNumber:150 description:@"No web clip for the given identifier"];
  }
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__98;
  v71 = __Block_byref_object_dispose__98;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __65__SBWebClipService_prepareToLaunchWebClipWithIdentifier_handler___block_invoke;
  v66[3] = &unk_1E6B0B118;
  v66[4] = &v67;
  [(SBWebClipService *)self _performActionIfContinuitySessionActive:v66];
  if (![v7 isAppClip])
  {
    v18 = +[SBUIController sharedInstance];
    v19 = [v18 iconController];
    v10 = [v19 model];

    v58 = [v10 bookmarkIconForWebClipIdentifier:v6];
    if (![v58 isBookmarkIcon])
    {
      v27 = 0;
LABEL_38:
      v9 = v27;
      v57[2]();
      goto LABEL_39;
    }
    id v20 = v58;
    uint64_t v21 = [v20 applicationToLaunch];
    if (v21)
    {
      if (![v20 representsWebApp])
      {
        v43 = [SBDeviceApplicationSceneEntity alloc];
        int v44 = __sb__runningInSpringBoard();
        char v45 = v44;
        if (v44)
        {
          BOOL v46 = SBFEffectiveDeviceClass() == 2;
        }
        else
        {
          a2 = [MEMORY[0x1E4F42948] currentDevice];
          BOOL v46 = [(id)a2 userInterfaceIdiom] == 1;
        }
        v47 = (void *)v68[5];
        v48 = [v47 displayIdentity];
        v26 = [(SBDeviceApplicationSceneEntity *)v43 initWithApplication:v21 generatingNewPrimarySceneIfRequired:v46 sceneHandleProvider:v47 displayIdentity:v48];

        if ((v45 & 1) == 0) {
        int v39 = ![(SBWebClipService *)self _addActivationActionToSceneEntity:v26 forWebClip:v7];
        }
        if (_os_feature_enabled_impl())
        {
          if (objc_opt_respondsToSelector())
          {
            v49 = [v21 bundleIdentifier];
            int v50 = [v7 addTrustedClientBundleIdentifier:v49];

            if (v50) {
              [v7 updateOnDisk];
            }
          }
        }
        goto LABEL_35;
      }
      v22 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v59];
      uint64_t v23 = [SBDeviceApplicationSceneEntity alloc];
      v24 = (void *)v68[5];
      uint64_t v25 = [v24 displayIdentity];
      v26 = [(SBDeviceApplicationSceneEntity *)v23 initWithApplication:v21 uniqueIdentifier:v22 sceneHandleProvider:v24 displayIdentity:v25];
    }
    else
    {
      v26 = 0;
    }
    int v39 = 1;
LABEL_35:
    v40 = objc_alloc_init(SBActivationSettings);
    if (v39)
    {
      v41 = [v20 bookmark];
      v42 = [v41 launchURL];
      [(SBActivationSettings *)v40 setObject:v42 forActivationSetting:5];
    }
    [(SBWorkspaceEntity *)v26 applyActivationSettings:v40];

    v27 = v26;
    goto LABEL_38;
  }
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 applicationBundleIdentifier];
  if (!v10)
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"SBWebClipService.m", 164, @"%@ Expects a target bundle identifier to be laid down for web clip with identifier %@.", v9, v59 object file lineNumber description];
  }
  v11 = +[SBUIController sharedInstance];
  id v12 = [v11 iconController];
  v58 = [v12 model];

  id v13 = [v58 bookmarkIconForWebClipIdentifier:v59];
  LODWORD(v11) = v13 == 0;

  if (v11) {
    id v14 = (id)[v58 addBookmarkIconForWebClip:v7];
  }
  id v15 = (void *)[(id)v68[5] newSceneIdentifierForBundleIdentifier:v10 supportsMultiwindow:0];
  v55 = [MEMORY[0x1E4F628D8] storeForApplication:v10];
  id v16 = [v55 sceneStoreForIdentifier:v15 creatingIfNecessary:1];
  [v16 setObject:v59 forKey:@"appClipIdentifier"];
  v54 = v16;
  if (v10)
  {
    v17 = [(SBApplicationController *)self->_applicationController applicationWithBundleIdentifier:v10];
  }
  else
  {
    v17 = 0;
  }
  v28 = [(SBApplicationPlaceholderController *)self->_placeholderController placeholderForDisplayID:v10];
  uint64_t v29 = [v17 bundleIdentifier];
  BOOL v30 = +[SBAppClipPlaceholderWorkspaceEntity isAppClipUpdateAvailableForBundleIdentifier:v29];

  if (v17) {
    BOOL v31 = v28 == 0;
  }
  else {
    BOOL v31 = 0;
  }
  char v32 = !v31 || v30;
  if (v32)
  {
    if (v28) {
      char v33 = 1;
    }
    else {
      char v33 = v30;
    }
    if ((v33 & 1) == 0)
    {
      v53 = [MEMORY[0x1E4F28B00] currentHandler];
      [v53 handleFailureInMethod:a2, self, @"SBWebClipService.m", 198, @"%@ Expects a placeholder application to be laid down for web clip with target bundle identifier %@.", v9, v10, v54 object file lineNumber description];
    }
    objc_super v34 = [[SBAppClipPlaceholderWorkspaceEntity alloc] initWithBundleIdentifier:v10 futureSceneIdentifier:v15 needsUpdate:v30];
    v35 = SBLogWebClip();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v74 = v9;
      __int16 v75 = 2114;
      v76 = v34;
      _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Will launch app clip placeholder with workspace entity: %{public}@", buf, 0x16u);
    }

    ((void (*)(void (**)(void), SBAppClipPlaceholderWorkspaceEntity *))v57[2])(v57, v34);
  }
  else
  {
    v36 = (void *)v68[5];
    v37 = [v36 displayIdentity];
    v38 = +[SBDeviceApplicationSceneEntity defaultEntityWithApplication:v17 sceneHandleProvider:v36 displayIdentity:v37];

    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __65__SBWebClipService_prepareToLaunchWebClipWithIdentifier_handler___block_invoke_2;
    v60[3] = &unk_1E6B0B140;
    objc_super v34 = v38;
    v61 = v34;
    id v62 = v9;
    id v63 = v17;
    id v64 = v59;
    v65 = v57;
    [(SBWebClipService *)self buildLaunchActionsForAppClipWithWebClipIdentifier:v64 completion:v60];
  }
LABEL_39:

  _Block_object_dispose(&v67, 8);
}

void __65__SBWebClipService_prepareToLaunchWebClipWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 mainWindowScene];
  uint64_t v3 = [v6 sceneManager];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __65__SBWebClipService_prepareToLaunchWebClipWithIdentifier_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addActions:a2];
  uint64_t v3 = SBLogWebClip();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v8 = 138543874;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Backing application exists for: %{public}@. Launching %{public}@.", (uint8_t *)&v8, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (BOOL)_addActivationActionToSceneEntity:(id)a3 forWebClip:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 application];
  int v8 = [v7 info];
  int v9 = [v8 supportsYttrium];

  if (v9
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v6 alternativeFullScreen]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    __int16 v10 = [v6 uuid];
    if (v10)
    {
      if (__loadBrowserSupportKitIfNecessary_onceToken != -1) {
        dispatch_once(&__loadBrowserSupportKitIfNecessary_onceToken, &__block_literal_global_218_0);
      }
      if (__loadBrowserSupportKitIfNecessary_browserSupportKit) {
        goto LABEL_23;
      }
      if (__loadBrowserKitIfNecessary_onceToken != -1) {
        dispatch_once(&__loadBrowserKitIfNecessary_onceToken, &__block_literal_global_221_0);
      }
      if (__loadBrowserKitIfNecessary_browserKit)
      {
LABEL_23:
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4F4F668], "browserSupportKit_activationActionForWebClipWithUUID:", v10);
          if (v11) {
            goto LABEL_16;
          }
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4F4F668], "browserKit_activationActionForWebClipWithUUID:", v10);
          if (!v11)
          {
LABEL_20:

            goto LABEL_18;
          }
LABEL_16:
          __int16 v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
          [v5 addActions:v12];

          LOBYTE(v11) = 1;
          goto LABEL_20;
        }
      }
    }
    LOBYTE(v11) = 0;
    goto LABEL_20;
  }
  LOBYTE(v11) = 0;
LABEL_18:

  return (char)v11;
}

+ (id)bestWebClipForTargetContentIdentifier:(id)a3 fromWebClips:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  if (!v5)
  {
    if (v7 != 1) {
      goto LABEL_19;
    }
LABEL_18:
    id v18 = [v6 firstObject];
    goto LABEL_20;
  }
  uint64_t v9 = [v5 length];
  if (v8 == 1 && !v9) {
    goto LABEL_18;
  }
  if (![v5 length])
  {
LABEL_19:
    id v18 = 0;
    goto LABEL_20;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v54;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v16 = [v15 identifier];
        v17 = v16;
        if (v16 && [v16 length] && (objc_msgSend(v17, "isEqualToString:", v5) & 1) != 0)
        {
          id v18 = v15;

          if (v18) {
            goto LABEL_20;
          }
          goto LABEL_24;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

LABEL_24:
  id v20 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  if (!v20)
  {
    id v18 = 0;
    goto LABEL_56;
  }
  unint64_t v21 = 0x1E4F29000uLL;
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v20 resolvingAgainstBaseURL:0];
  v43 = [v22 host];
  if (!v43)
  {
    id v18 = 0;
    goto LABEL_55;
  }
  v38 = v22;
  int v39 = v20;
  id v40 = v6;
  id v41 = v5;
  uint64_t v23 = [v20 pathComponents];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v10;
  uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (!v48)
  {
    id v42 = 0;
    goto LABEL_54;
  }
  unint64_t v44 = 0;
  id v42 = 0;
  uint64_t v47 = *(void *)v50;
  do
  {
    for (uint64_t j = 0; j != v48; ++j)
    {
      if (*(void *)v50 != v47) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void **)(*((void *)&v49 + 1) + 8 * j);
      v26 = [v25 pageURL];
      v27 = (void *)[objc_alloc(*(Class *)(v21 + 136)) initWithURL:v26 resolvingAgainstBaseURL:0];
      v28 = [v27 host];
      uint64_t v29 = [v26 pathComponents];
      if (v28)
      {
        BOOL v46 = v25;
        BOOL v30 = [v26 absoluteString];
        if (![v30 length]) {
          goto LABEL_46;
        }
        int v31 = BSEqualStrings();

        if (v31)
        {
          unint64_t v32 = [v23 count];
          if (v32 >= [v29 count])
          {
            unint64_t v33 = 0;
            if ([v23 count])
            {
              while (1)
              {
                objc_super v34 = [v23 objectAtIndex:v33];
                if (v33 >= [v29 count])
                {
                  int v37 = 1;
                  goto LABEL_42;
                }
                v35 = [v29 objectAtIndex:v33];
                char v36 = BSEqualStrings();

                if ((v36 & 1) == 0) {
                  break;
                }
                ++v33;

                if (v33 >= [v23 count]) {
                  goto LABEL_39;
                }
              }
              int v37 = 0;
LABEL_42:
            }
            else
            {
LABEL_39:
              int v37 = 1;
            }
            if (v37 && v33 >= v44)
            {
              BOOL v30 = v42;
              id v42 = v46;
              unint64_t v44 = v33;
              unint64_t v21 = 0x1E4F29000;
LABEL_46:

              goto LABEL_48;
            }
          }
        }
        unint64_t v21 = 0x1E4F29000;
      }
LABEL_48:
    }
    uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  }
  while (v48);
LABEL_54:

  id v6 = v40;
  id v5 = v41;
  v22 = v38;
  id v20 = v39;
  id v18 = v42;
LABEL_55:

LABEL_56:
LABEL_20:

  return v18;
}

- (id)targetApplicationBundleIdentifierForWebClip:(id)a3
{
  uint64_t v3 = [a3 identifier];
  if (v3)
  {
    uint64_t v4 = +[SBUIController sharedInstance];
    id v5 = [v4 iconController];
    id v6 = [v5 model];

    uint64_t v7 = [v6 bookmarkIconForWebClipIdentifier:v3];
    if ([v7 isBookmarkIcon])
    {
      uint64_t v8 = [v7 applicationToLaunch];
      uint64_t v9 = [v8 bundleIdentifier];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)launchWebClipWithIdentifier:(id)a3 origin:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [(SBWebClipService *)self _clearPendingLaunch];
  uint64_t v9 = [v8 unsignedIntegerValue];
  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  uint64_t v12 = SBLogWebClip();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = SBSStringFromWebClipServiceLaunchOrigin();
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v11;
    __int16 v26 = 2114;
    id v27 = v7;
    __int16 v28 = 2114;
    uint64_t v29 = v13;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request to launch web clip with identifier: %{public}@ origin: %{public}@", buf, 0x20u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke;
  v17[3] = &unk_1E6B0B208;
  id v18 = v7;
  v19 = self;
  SEL v22 = a2;
  uint64_t v23 = v9;
  id v20 = v11;
  id v21 = v8;
  id v14 = v8;
  id v15 = v11;
  id v16 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke(uint64_t a1)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F43048] webClipWithIdentifier:*(void *)(a1 + 32)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 applicationBundleIdentifier];
    if ([v3 isAppClip]) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"SBWebClipService.m", 376, @"%@ Expects a target bundle identifier to be laid down for app clip with identifier %@.", *(void *)(a1 + 48), *(void *)(a1 + 32) object file lineNumber description];
    }
    else if (v4)
    {
      uint64_t v30 = [*(id *)(*(void *)(a1 + 40) + 24) placeholderForDisplayID:v4];
      uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 32) applicationWithBundleIdentifier:v4];
      if (!(v6 | v30))
      {
        id v7 = SBLogWebClip();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(a1 + 48);
          uint64_t v9 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          unint64_t v44 = (uint64_t (*)(uint64_t, uint64_t))v4;
          _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Can't launch web clip with identifier:%{public}@ because a placeholder or application for:%{public}@ could not be found. Will wait for placeholder or application to be installed.", buf, 0x20u);
        }

        [*(id *)(a1 + 40) _beginWaitingForBundleIdentifier:v4 webClipIdentifier:*(void *)(a1 + 32) launchOrigin:*(void *)(a1 + 56)];
        objc_initWeak((id *)buf, *(id *)(a1 + 40));
        id v10 = *(void **)(*(void *)(a1 + 40) + 88);
        dispatch_time_t v11 = dispatch_time(0, (uint64_t)(*(double *)(*(void *)(a1 + 40) + 120) * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_82;
        block[3] = &unk_1E6B0B1E0;
        objc_copyWeak(v34, (id *)buf);
        v34[1] = v10;
        id v32 = *(id *)(a1 + 48);
        uint64_t v4 = v4;
        unint64_t v33 = v4;
        dispatch_after(v11, MEMORY[0x1E4F14428], block);

        objc_destroyWeak(v34);
        objc_destroyWeak((id *)buf);
        goto LABEL_21;
      }
      goto LABEL_15;
    }
    uint64_t v30 = 0;
    uint64_t v6 = 0;
LABEL_15:
    uint64_t v13 = &stru_1F3084718;
    if (v4) {
      uint64_t v13 = (__CFString *)v4;
    }
    id v14 = v13;
    id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v47 = @"SBWebClipServiceWillLaunchWebClipBundleIdentifierKey";
    v48[0] = v14;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    [v15 postNotificationName:@"SBWebClipServiceWillLaunchWebClipNotificationName" object:v16 userInfo:v17];

    unint64_t v18 = *(void *)(a1 + 72) - 1;
    if (v18 > 2)
    {
      uint64_t v19 = 29;
      uint64_t v20 = 43;
    }
    else
    {
      uint64_t v19 = dword_1D8FD2FF0[v18];
      uint64_t v20 = qword_1D8FD3000[v18];
    }
    id v21 = objc_alloc_init(SBLockScreenUnlockRequest);
    [(SBLockScreenUnlockRequest *)v21 setSource:v19];
    [(SBLockScreenUnlockRequest *)v21 setIntent:3];
    SEL v22 = NSString;
    uint64_t v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    uint64_t v25 = [v22 stringWithFormat:@"%@: Open web clip: %@", v24, *(void *)(a1 + 32)];
    [(SBLockScreenUnlockRequest *)v21 setName:v25];

    [(SBLockScreenUnlockRequest *)v21 setWantsBiometricPresentation:1];
    [(SBLockScreenUnlockRequest *)v21 setConfirmedNotInPocket:1];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    unint64_t v44 = __Block_byref_object_copy__98;
    char v45 = __Block_byref_object_dispose__98;
    id v46 = 0;
    __int16 v26 = *(void **)(a1 + 40);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_2;
    v40[3] = &unk_1E6B0B168;
    id v42 = buf;
    id v27 = v21;
    id v41 = v27;
    [v26 _performActionIfContinuitySessionActive:v40];
    uint64_t v28 = *(void *)(a1 + 40);
    uint64_t v29 = *(void **)(v28 + 40);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_3;
    v35[3] = &unk_1E6B0B1B8;
    v35[4] = v28;
    id v36 = *(id *)(a1 + 32);
    v38 = buf;
    uint64_t v39 = v20;
    id v37 = *(id *)(a1 + 48);
    [v29 unlockWithRequest:v27 completion:v35];

    _Block_object_dispose(buf, 8);
    goto LABEL_21;
  }
  uint64_t v4 = SBLogWebClip();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_cold_1();
  }
LABEL_21:
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = [a2 mainWindowScene];
  uint64_t v3 = [v6 _sbDisplayConfiguration];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [*(id *)(a1 + 32) setWindowScene:v6];
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_3(void *a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_4;
    v9[3] = &unk_1E6B0B190;
    BOOL v5 = (void *)a1[6];
    uint64_t v6 = a1[7];
    v9[4] = v3;
    uint64_t v7 = a1[8];
    uint64_t v12 = v6;
    uint64_t v13 = v7;
    id v10 = v5;
    id v11 = (id)a1[5];
    [v3 prepareToLaunchWebClipWithIdentifier:v4 handler:v9];
  }
  else
  {
    uint64_t v8 = SBLogWebClip();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_3_cold_1();
    }
  }
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_5;
    v7[3] = &unk_1E6B02178;
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v8 = v3;
    id v9 = *(id *)(a1 + 40);
    [WeakRetained requestTransitionWithOptions:0 displayConfiguration:v5 builder:v7 validator:&__block_literal_global_345];

    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = SBLogWebClip();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_4_cold_1();
    }
  }
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventLabel:@"ActivateWebClipFromSBS"];
  [v3 setSource:*(void *)(a1 + 48)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_6;
  v8[3] = &unk_1E6AF57C0;
  id v9 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_7;
  v5[3] = &unk_1E6AF4A98;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v4 = (id)[v3 addCompletionHandler:v5];
}

uint64_t __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setActivatingEntity:*(void *)(a1 + 32)];
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_7(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = SBLogWebClip();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Did launch web clip with workspace entity: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

uint64_t __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_79()
{
  return 1;
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_82(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && WeakRetained[11] == *(void *)(a1 + 56))
  {
    [WeakRetained _clearPendingLaunch];
    uint64_t v4 = SBLogWebClip();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_82_cold_1(a1, v4);
    }
  }
}

- (void)_beginWaitingForBundleIdentifier:(id)a3 webClipIdentifier:(id)a4 launchOrigin:(id)a5
{
  uint64_t v8 = (NSNumber *)a5;
  id v9 = a4;
  id v10 = a3;
  [(SBWebClipService *)self _clearPendingLaunch];
  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 addObserver:self selector:sel__placeholdersDidChange_ name:@"SBApplicationPlaceholdersDidChangeNotification" object:self->_placeholderController];
  [v16 addObserver:self selector:sel__applicationsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:self->_applicationController];
  id v11 = (NSString *)[v10 copy];

  pendingBundleIdentifier = self->_pendingBundleIdentifier;
  self->_pendingBundleIdentifier = v11;

  uint64_t v13 = (NSString *)[v9 copy];
  pendingWebClipIdentifier = self->_pendingWebClipIdentifier;
  self->_pendingWebClipIdentifier = v13;

  pendingLaunchOrigin = self->_pendingLaunchOrigin;
  self->_pendingLaunchOrigin = v8;
}

- (void)_clearPendingLaunch
{
  if (self->_pendingBundleIdentifier)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"SBApplicationPlaceholdersDidChangeNotification" object:self->_placeholderController];
    [v6 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:self->_applicationController];
    pendingBundleIdentifier = self->_pendingBundleIdentifier;
    self->_pendingBundleIdentifier = 0;

    pendingWebClipIdentifier = self->_pendingWebClipIdentifier;
    self->_pendingWebClipIdentifier = 0;

    pendingLaunchOrigin = self->_pendingLaunchOrigin;
    self->_pendingLaunchOrigin = 0;

    ++self->_pendingLaunchGenerationCount;
  }
}

- (void)_placeholdersDidChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_pendingBundleIdentifier)
  {
    uint64_t v4 = [a3 userInfo];
    int v5 = [v4 objectForKey:@"__placeholdersAdded"];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "applicationBundleID", (void)v18);
          int v12 = [v11 isEqualToString:self->_pendingBundleIdentifier];

          if (v12)
          {
            uint64_t v13 = SBLogWebClip();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = (objc_class *)objc_opt_class();
              id v15 = NSStringFromClass(v14);
              pendingBundleIdentifier = self->_pendingBundleIdentifier;
              pendingWebClipIdentifier = self->_pendingWebClipIdentifier;
              *(_DWORD *)buf = 138543874;
              uint64_t v23 = v15;
              __int16 v24 = 2114;
              uint64_t v25 = pendingWebClipIdentifier;
              __int16 v26 = 2114;
              id v27 = pendingBundleIdentifier;
              _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Placeholder added. Retrying web clip launch with identifier:%{public}@ for:%{public}@.", buf, 0x20u);
            }
            [(SBWebClipService *)self launchWebClipWithIdentifier:self->_pendingWebClipIdentifier origin:self->_pendingLaunchOrigin];
            [(SBWebClipService *)self _clearPendingLaunch];
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (void)_applicationsDidChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_pendingBundleIdentifier)
  {
    uint64_t v4 = [a3 userInfo];
    int v5 = [v4 objectForKey:@"SBInstalledApplicationsAddedBundleIDs"];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "isEqualToString:", self->_pendingBundleIdentifier, (void)v16))
          {
            id v11 = SBLogWebClip();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              int v12 = (objc_class *)objc_opt_class();
              uint64_t v13 = NSStringFromClass(v12);
              pendingBundleIdentifier = self->_pendingBundleIdentifier;
              pendingWebClipIdentifier = self->_pendingWebClipIdentifier;
              *(_DWORD *)buf = 138543874;
              long long v21 = v13;
              __int16 v22 = 2114;
              uint64_t v23 = pendingWebClipIdentifier;
              __int16 v24 = 2114;
              uint64_t v25 = pendingBundleIdentifier;
              _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Application added. Retrying web clip launch with identifier:%{public}@ for:%{public}@.", buf, 0x20u);
            }
            [(SBWebClipService *)self launchWebClipWithIdentifier:self->_pendingWebClipIdentifier origin:self->_pendingLaunchOrigin];
            [(SBWebClipService *)self _clearPendingLaunch];
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (void)updateWebClipPropertiesWithIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  id v6 = SBLogWebClip();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request to update app clip properties with identifier: %{public}@", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SBWebClipService_updateWebClipPropertiesWithIdentifier___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v10 = v3;
  id v11 = v5;
  id v7 = v5;
  id v8 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __58__SBWebClipService_updateWebClipPropertiesWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F43048] webClipWithIdentifier:*(void *)(a1 + 32)];
  if (v2)
  {
    id v3 = +[SBUIController sharedInstance];
    uint64_t v4 = [v3 iconController];
    int v5 = [v4 model];

    id v6 = [v5 bookmarkIconForWebClipIdentifier:*(void *)(a1 + 32)];
    if (v6)
    {
      [v5 updateExistingBookmarkIcon:v6 forUpdatedWebClip:v2];
    }
    else
    {
      uint64_t v9 = SBLogWebClip();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        int v12 = [v2 applicationBundleIdentifier];
        int v13 = 138543874;
        uint64_t v14 = v10;
        __int16 v15 = 2114;
        uint64_t v16 = v11;
        __int16 v17 = 2114;
        long long v18 = v12;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Didn't find an icon for webClip identifier %{public}@ and application bundle identifier %{public}@.", (uint8_t *)&v13, 0x20u);
      }
    }
  }
  else
  {
    int v5 = SBLogWebClip();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Didn't find a web clip with identifier %{public}@.", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = SBLogWebClip();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138412546;
    __int16 v26 = v9;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%@ Received connection: %{public}@", buf, 0x16u);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke;
  v24[3] = &unk_1E6AF7470;
  v24[4] = self;
  [v6 configureConnection:v24];
  clientAuthenticator = self->_clientAuthenticator;
  uint64_t v11 = [v6 remoteProcess];
  int v12 = [v11 auditToken];
  if ([(FBServiceClientAuthenticator *)clientAuthenticator authenticateAuditToken:v12])
  {

LABEL_6:
    uint64_t v16 = SBLogWebClip();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = (objc_class *)objc_opt_class();
      long long v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412546;
      __int16 v26 = v18;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "%@ Client authenticated, will add connection: %{public}@", buf, 0x16u);
    }
    serviceQueue = self->_serviceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke_90;
    block[3] = &unk_1E6AF5290;
    void block[4] = self;
    id v20 = v6;
    id v23 = v20;
    dispatch_async(serviceQueue, block);
    [v20 activate];

    goto LABEL_12;
  }
  legacyClientAuthenticator = self->_legacyClientAuthenticator;
  uint64_t v14 = [v6 remoteProcess];
  __int16 v15 = [v14 auditToken];
  LODWORD(legacyClientAuthenticator) = [(FBServiceClientAuthenticator *)legacyClientAuthenticator authenticateAuditToken:v15];

  if (legacyClientAuthenticator) {
    goto LABEL_6;
  }
  long long v21 = SBLogWebClip();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[SBWebClipService listener:didReceiveConnection:withContext:]((uint64_t)self, (uint64_t)v6, v21);
  }

  [v6 invalidate];
LABEL_12:
}

void __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4FA6CC0] serviceQuality];
  [v3 setServiceQuality:v4];

  int v5 = [MEMORY[0x1E4FA6CC0] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke_2;
  uint64_t v9 = &unk_1E6AF7420;
  objc_copyWeak(&v10, &location);
  [v3 setInvalidationHandler:&v6];
  objc_msgSend(v3, "setTargetQueue:", *(void *)(*(void *)(a1 + 32) + 72), v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v5 = SBLogWebClip();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%@ Connection invalidated: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    objc_msgSend(WeakRetained, "_queue_removeConnection:", v3);
  }
}

uint64_t __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke_90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(void *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogWebClip();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%@ Adding Connection: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  [(NSMutableArray *)self->_connections addObject:v4];
}

- (void)_queue_removeConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogWebClip();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%@ Removing Connection: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  [(NSMutableArray *)self->_connections removeObject:v4];
}

- (void)_performActionIfContinuitySessionActive:(id)a3
{
  int v5 = (void (**)(id, void *))a3;
  if (+[SBContinuitySessionManager areContinuitySessionsAllowed])
  {
    id v3 = +[SBContinuitySessionManager sharedInstance];
    id v4 = [v3 currentSession];

    if ([v4 state] == 10) {
      v5[2](v5, v4);
    }
  }
}

- (void)buildLaunchActionsForAppClipWithWebClipIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F43048] webClipWithIdentifier:a3];
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBWebClipService.m" lineNumber:604 description:@"We expect to have a non-nil UIWebClip"];
  }
  uint64_t v9 = [v8 appClipUserActivity];
  __int16 v10 = v9;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__SBWebClipService_buildLaunchActionsForAppClipWithWebClipIdentifier_completion___block_invoke;
    v12[3] = &unk_1E6B0B230;
    id v13 = v9;
    id v14 = v7;
    [(SBWebClipService *)self _generateUserActivityDataFromUserActivity:v13 completion:v12];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __81__SBWebClipService_buildLaunchActionsForAppClipWithWebClipIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v12 = [v3 dictionaryWithCapacity:4];
  [v12 setObject:v4 forKeyedSubscript:&unk_1F334B240];

  int v5 = [*(id *)(a1 + 32) activityType];
  [v12 setObject:v5 forKeyedSubscript:&unk_1F334B258];

  uint64_t v6 = [*(id *)(a1 + 32) activityType];
  [v12 setObject:v6 forKeyedSubscript:&unk_1F334B270];

  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v12 setObject:v7 forKeyedSubscript:&unk_1F334B288];

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4F42700]) initWithSettings:v12];
  id v11 = [v9 setWithObject:v10];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
}

- (void)_generateUserActivityDataFromUserActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke;
  v8[3] = &unk_1E6B0B258;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 _createUserActivityDataWithOptions:MEMORY[0x1E4F1CC08] completionHandler:v8];
}

void __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke_2;
  v11[3] = &unk_1E6AF77C0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke_2(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke_2_cold_1(a1, v2, v3);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (double)pendingLaunchTimeout
{
  return self->_pendingLaunchTimeout;
}

- (void)setPendingLaunchTimeout:(double)a3
{
  self->_pendingLaunchTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingLaunchOrigin, 0);
  objc_storeStrong((id *)&self->_pendingWebClipIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_legacyClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_placeholderController, 0);
  objc_destroyWeak((id *)&self->_sceneManager);
  objc_destroyWeak((id *)&self->_workspace);
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, v0, (uint64_t)v0, "%{public}@ Can't launch web clip with identifier:%{public}@ because we couldn't find the underlying UIWebClip.", v1);
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_3_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, v0, v1, "%{public}@ Can't launch web clip with identifier:%{public}@ because unlock failed.", v2);
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_4_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, v0, v1, "%{public}@ Can't launch web clip with identifier:%{public}@ because workspace entity is nil.", v2);
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_82_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_fault_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_FAULT, "%{public}@ Timed out waiting for a placeholder or application to be installed for %@.", (uint8_t *)&v4, 0x16u);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(uint64_t)a2 withContext:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  __int16 v6 = NSStringFromClass(v5);
  int v8 = 138412546;
  id v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, a3, v7, "%@ Client authentication failed for connection: %{public}@", (uint8_t *)&v8);
}

void __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = *a2;
  int v9 = 138543618;
  __int16 v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, a3, v8, "%{public}@ Failed to create user activity with error %{public}@", (uint8_t *)&v9);
}

@end