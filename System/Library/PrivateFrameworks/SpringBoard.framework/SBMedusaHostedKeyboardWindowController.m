@interface SBMedusaHostedKeyboardWindowController
- (BOOL)isKeyboardVisibleForSpringBoard;
- (BOOL)isUsingMedusaHostedKeyboardWindow;
- (BOOL)shouldKeyboardBeWindowSizedForHostWithIdentity:(id)a3;
- (SBMedusaHostedKeyboardWindowController)initWithWindowScene:(id)a3;
- (UIWindow)medusaHostedKeyboardWindow;
- (id)_keyboardLayersClientSettingsDiffInspector;
- (id)newMedusaHostedKeyboardWindowLevelAssertionWithPriority:(unint64_t)a3 windowLevel:(double)a4;
- (void)_doObserverCalloutWithBlock:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)updateMedusaHostedKeyboardWindow;
- (void)updateMedusaHostedKeyboardWindowForScene:(id)a3 isForeground:(BOOL *)a4;
@end

@implementation SBMedusaHostedKeyboardWindowController

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v6 = a3;
  if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) == 0)
  {
    v7 = [v6 identifier];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F71DE8]];

    if (v8)
    {
      v9 = [v6 settings];
      char v10 = [v9 isForeground];

      char v11 = v10;
      [(SBMedusaHostedKeyboardWindowController *)self updateMedusaHostedKeyboardWindowForScene:v6 isForeground:&v11];
    }
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) == 0)
  {
    v13 = [v17 settings];
    int v14 = [v13 isForeground];

    if (v14)
    {
      v15 = objc_alloc_init(SBKeyboardClientSettingObserverContext);
      -[SBKeyboardClientSettingObserverContext setScene:]((uint64_t)v15, v17);
      -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v15, v11);
      -[SBCameraHardwareButton setDispatchingRuleAssertion:]((uint64_t)v15, v12);
      v16 = [(SBMedusaHostedKeyboardWindowController *)self _keyboardLayersClientSettingsDiffInspector];
      [v10 evaluateWithInspector:v16 context:v15];
    }
  }
}

- (id)_keyboardLayersClientSettingsDiffInspector
{
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    v3 = 0;
  }
  else
  {
    keyboardLayersClientSettingsDiffInspector = self->_keyboardLayersClientSettingsDiffInspector;
    if (!keyboardLayersClientSettingsDiffInspector)
    {
      v5 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F62A40]);
      id v6 = self->_keyboardLayersClientSettingsDiffInspector;
      self->_keyboardLayersClientSettingsDiffInspector = v5;

      v7 = self->_keyboardLayersClientSettingsDiffInspector;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_4;
      v13[3] = &unk_1E6B01BB0;
      v13[4] = self;
      id v14 = &__block_literal_global_7_3;
      v9 = __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke(v8, v13);
      [(FBSSceneClientSettingsDiffInspector *)v7 observeLayersWithBlock:v9];

      id v10 = self->_keyboardLayersClientSettingsDiffInspector;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_6;
      v12[3] = &unk_1E6B01BD8;
      v12[4] = self;
      [(FBSSceneClientSettingsDiffInspector *)v10 observePreferredSceneHostIdentityWithBlock:v12];

      keyboardLayersClientSettingsDiffInspector = self->_keyboardLayersClientSettingsDiffInspector;
    }
    v3 = keyboardLayersClientSettingsDiffInspector;
  }
  return v3;
}

uint64_t __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_4(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3) {
    uint64_t v4 = v3[2];
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v3) {
    v7 = (void *)v3[1];
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  v9 = [v8 clientSettings];
  id v10 = (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v9);

  if ((BSEqualObjects() & 1) == 0)
  {
    id v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_5;
    v12[3] = &unk_1E6B01B88;
    v13 = v3;
    [v11 _doObserverCalloutWithBlock:v12];
    [*(id *)(a1 + 32) updateMedusaHostedKeyboardWindow];
  }
}

id __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(v2, "layers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 isKeyboardLayer] & 1) != 0 || objc_msgSend(v9, "isKeyboardProxyLayer"))
        {
          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
          }
          [v6 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)updateMedusaHostedKeyboardWindow
{
  if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F62490] sharedInstance];
    id v5 = [v3 sceneWithIdentifier:*MEMORY[0x1E4F71DE8]];

    uint64_t v4 = v5;
    if (v5)
    {
      [(SBMedusaHostedKeyboardWindowController *)self updateMedusaHostedKeyboardWindowForScene:v5 isForeground:0];
      uint64_t v4 = v5;
    }
  }
}

- (void)updateMedusaHostedKeyboardWindowForScene:(id)a3 isForeground:(BOOL *)a4
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    id v8 = [v6 settings];
    v9 = objc_msgSend(v8, "sb_displayIdentityForSceneManagers");

    id v10 = [WeakRetained _fbsDisplayIdentity];
    int v11 = [v9 isEqual:v10];

    if (!v11)
    {
LABEL_93:

      goto LABEL_94;
    }
    long long v12 = [v6 settings];
    char v101 = [v12 isForeground];

    long long v13 = [v6 clientSettings];
    long long v14 = [v13 preferredSceneHostIdentifier];

    v15 = [v6 clientSettings];
    uint64_t v16 = [v15 preferredSceneHostIdentity];

    id v17 = +[SBSceneManagerCoordinator sharedInstance];
    v18 = [v17 sceneManagerForDisplayIdentity:v9];

    v95 = a4;
    v96 = v18;
    v100 = v9;
    v97 = v14;
    if (v16)
    {
      v19 = [MEMORY[0x1E4F62490] sharedInstance];
      v20 = [v19 sceneFromIdentityToken:v16];

      if (v20) {
        goto LABEL_30;
      }
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      v21 = [v18 externalForegroundApplicationSceneHandles];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v106 objects:v115 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v107;
        uint64_t v89 = *(void *)v107;
        id v90 = WeakRetained;
        v93 = v21;
        do
        {
          uint64_t v25 = 0;
          uint64_t v91 = v23;
          do
          {
            if (*(void *)v107 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = [*(id *)(*((void *)&v106 + 1) + 8 * v25) sceneIfExists];
            if (v26)
            {
              long long v104 = 0u;
              long long v105 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              v98 = v26;
              v27 = [v26 clientSettings];
              v28 = [v27 layers];

              uint64_t v29 = [v28 countByEnumeratingWithState:&v102 objects:v114 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v103;
                while (2)
                {
                  for (uint64_t i = 0; i != v30; ++i)
                  {
                    if (*(void *)v103 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    v33 = *(void **)(*((void *)&v102 + 1) + 8 * i);
                    if ([v33 isKeyboardProxyLayer])
                    {
                      v34 = [v33 keyboardOwner];
                      char v35 = BSEqualObjects();

                      if (v35)
                      {

                        id WeakRetained = v90;
                        v20 = v98;
                        v9 = v100;
                        v18 = v96;
                        v21 = v93;
                        goto LABEL_29;
                      }
                    }
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v102 objects:v114 count:16];
                  if (v30) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v24 = v89;
              id WeakRetained = v90;
              v9 = v100;
              v18 = v96;
              uint64_t v23 = v91;
              v21 = v93;
            }
            ++v25;
          }
          while (v25 != v23);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v106 objects:v115 count:16];
          v20 = 0;
        }
        while (v23);
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      if (![v14 length])
      {
        v99 = 0;
        LODWORD(v20) = 0;
        goto LABEL_62;
      }
      v21 = [MEMORY[0x1E4F62490] sharedInstance];
      v20 = [v21 sceneWithIdentifier:v14];
    }
LABEL_29:

    if (v20)
    {
LABEL_30:
      v36 = [v18 existingSceneHandleForScene:v20];
      v37 = [v18 externalForegroundApplicationSceneHandles];
      char v38 = [v37 containsObject:v36];

      v92 = v36;
      if (v38)
      {
        int v39 = 1;
      }
      else
      {
        v40 = [v36 sceneIfExists];
        v41 = [v40 workspaceIdentifier];

        if (v41)
        {
          v42 = [v36 scene];
          v43 = [v42 settings];
          int v39 = [v43 isForeground];
        }
        else
        {
          int v39 = 0;
        }
      }
      v44 = [v20 clientProcess];
      if ([v44 isApplicationProcess])
      {
        v45 = +[SBApplicationController sharedInstance];
        v46 = [v44 bundleIdentifier];
        v94 = [v45 applicationWithBundleIdentifier:v46];
      }
      else
      {
        v94 = 0;
      }
      v47 = [v20 uiPresentationManager];
      v48 = [v47 defaultPresentationContext];
      uint64_t v49 = [v48 presentedLayerTypes];

      if ((v49 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
        int v50 = 0;
      }
      else {
        int v50 = v39;
      }
      v99 = v20;
      if (v50 == 1)
      {
        v51 = SBLogMedusaKeyboard();
        LODWORD(v20) = 1;
        v9 = v100;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = _SBFLoggingMethodProem();
          *(_DWORD *)buf = 138543362;
          uint64_t v111 = (uint64_t)v52;
          _os_log_impl(&dword_1D85BA000, v51, OS_LOG_TYPE_INFO, "%{public}@ keyboardIsForMedusa is YES because the scene is foreground and can't present the keyboard itself", buf, 0xCu);
        }
        char v101 = 1;
        goto LABEL_61;
      }
      v53 = FBSystemAppBundleID();
      int v54 = [v97 isEqualToString:v53];

      v9 = v100;
      if (v54)
      {
        v51 = SBLogMedusaKeyboard();
        char v101 = 1;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v55 = _SBFLoggingMethodProem();
          *(_DWORD *)buf = 138543362;
          uint64_t v111 = (uint64_t)v55;
          _os_log_impl(&dword_1D85BA000, v51, OS_LOG_TYPE_INFO, "%{public}@ preferredHostIdentifier is SpringBoard so keyboardIsForMedusa is NO", buf, 0xCu);
        }
        LODWORD(v20) = 0;
        goto LABEL_61;
      }
      v56 = [WeakRetained switcherController];
      if ([v56 isChamoisWindowingUIEnabled])
      {
        v57 = [v20 uiSettings];
        if ([v57 enhancedWindowingEnabled])
        {
          int v58 = [v94 supportsChamoisSceneResizing];

          if (v58)
          {
            v51 = SBLogMedusaKeyboard();
            LODWORD(v20) = 1;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              v59 = _SBFLoggingMethodProem();
              *(_DWORD *)buf = 138543362;
              uint64_t v111 = (uint64_t)v59;
              _os_log_impl(&dword_1D85BA000, v51, OS_LOG_TYPE_INFO, "%{public}@ Chamois window UI is enabled so keyboardIsForMedusa is YES", buf, 0xCu);
            }
LABEL_60:
            v9 = v100;
LABEL_61:

            goto LABEL_62;
          }
LABEL_57:
          v51 = SBLogMedusaKeyboard();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            v60 = _SBFLoggingMethodProem();
            *(_DWORD *)buf = 138543362;
            uint64_t v111 = (uint64_t)v60;
            _os_log_impl(&dword_1D85BA000, v51, OS_LOG_TYPE_INFO, "%{public}@ preferredHostIdentifier's scene can host keyboard itself so keyboardIsForMedusa is NO", buf, 0xCu);
          }
          LODWORD(v20) = 0;
          char v101 = 0;
          goto LABEL_60;
        }
      }
      goto LABEL_57;
    }
    v99 = 0;
LABEL_62:
    v61 = +[SBWorkspace mainWorkspace];
    v62 = [v61 pipCoordinator];
    int v63 = [v62 isPresentingPictureInPictureRequiringMedusaKeyboard];

    if (v63)
    {
      v64 = SBLogMedusaKeyboard();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        v65 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543362;
        uint64_t v111 = (uint64_t)v65;
        _os_log_impl(&dword_1D85BA000, v64, OS_LOG_TYPE_INFO, "%{public}@ pipRequiresMedusaKeyboard is YES so keyboardIsForMedusa is YES", buf, 0xCu);
      }
      LODWORD(v20) = 1;
      char v101 = 1;
    }
    if (v16)
    {
      v66 = [(id)SBApp systemUIScenesCoordinator];
      v67 = [v66 overlayUISceneController];
      v68 = [v67 sceneFromIdentityToken:v16];

      if (v68)
      {
        v69 = SBLogMedusaKeyboard();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          v70 = _SBFLoggingMethodProem();
          *(_DWORD *)buf = 138543362;
          uint64_t v111 = (uint64_t)v70;
          _os_log_impl(&dword_1D85BA000, v69, OS_LOG_TYPE_INFO, "%{public}@ host is OverlayUI scene so keyboardIsForMedusa is YES", buf, 0xCu);
        }
        LODWORD(v20) = 1;
        char v101 = 1;
      }
    }
    v71 = [(id)SBApp windowSceneManager];
    v72 = [v71 windowSceneForDisplayIdentity:v9];

    v73 = [WeakRetained switcherController];
    v74 = [v16 stringRepresentation];
    if ([v73 windowManagementStyle])
    {
      if (v74)
      {
        v75 = [(id)SBApp remoteTransientOverlaySessionManager];
        int v76 = [v75 hasActiveSessionWithSceneIdentityTokenString:v74 options:0];

        if (v76)
        {
          v77 = [v72 transientOverlayPresenter];
          char v78 = [v77 isTopmostPresentationFromSceneWithIdentityTokenString:v74];

          if ((v78 & 1) == 0 && [v73 unlockedEnvironmentMode] == 3)
          {
            v79 = SBLogMedusaKeyboard();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
            {
              v80 = _SBFLoggingMethodProem();
              *(_DWORD *)buf = 138543362;
              uint64_t v111 = (uint64_t)v80;
              _os_log_impl(&dword_1D85BA000, v79, OS_LOG_TYPE_INFO, "%{public}@ host is embedded remote transient overlay scene so keyboardIsForMedusa is YES", buf, 0xCu);
            }
            LODWORD(v20) = 1;
            char v101 = 1;
          }
        }
      }
    }
    if (!self->_medusaHostedKeyboardWindow)
    {
      v81 = [[SBMedusaHostedKeyboardWindow alloc] initWithWindowScene:v72 keyboardScene:v6];
      medusaHostedKeyboardWindow = self->_medusaHostedKeyboardWindow;
      self->_medusaHostedKeyboardWindow = &v81->super.super.super;
    }
    v83 = SBLogMedusaKeyboard();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      uint64_t v84 = _SBFLoggingMethodProem();
      v85 = (void *)v84;
      v86 = "HIDING";
      if (v20) {
        v86 = "SHOWING";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v111 = v84;
      __int16 v112 = 2082;
      v113 = v86;
      _os_log_impl(&dword_1D85BA000, v83, OS_LOG_TYPE_INFO, "%{public}@ %{public}s the medusa keyboard window", buf, 0x16u);
    }
    [(UIWindow *)self->_medusaHostedKeyboardWindow setHidden:v20 ^ 1];
    v87 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    v88 = v87;
    if ((v20 ^ 1)) {
      [v87 noteKeyboardIsNotForMedusa];
    }
    else {
      [v87 noteKeyboardIsForMedusaWithOwningScene:v99];
    }

    if (self->_isUsingMedusaHostedKeyboardWindow != v20)
    {
      self->_isUsingMedusaHostedKeyboardWindow = (char)v20;
      [(SBMedusaHostedKeyboardWindowController *)self _doObserverCalloutWithBlock:&__block_literal_global_22];
    }
    if (v95) {
      BOOL *v95 = v101;
    }

    v9 = v100;
    goto LABEL_93;
  }
LABEL_94:
}

- (BOOL)isUsingMedusaHostedKeyboardWindow
{
  return self->_isUsingMedusaHostedKeyboardWindow;
}

- (SBMedusaHostedKeyboardWindowController)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBMedusaHostedKeyboardWindowController;
  id v5 = [(SBMedusaHostedKeyboardWindowController *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_windowScene, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(SBMedusaHostedKeyboardWindowController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBMedusaHostedKeyboardWindowController;
  [(SBMedusaHostedKeyboardWindowController *)&v3 dealloc];
}

- (void)invalidate
{
  [(UIWindow *)self->_medusaHostedKeyboardWindow invalidate];
  medusaHostedKeyboardWindow = self->_medusaHostedKeyboardWindow;
  self->_medusaHostedKeyboardWindow = 0;

  keyboardLayersClientSettingsDiffInspector = self->_keyboardLayersClientSettingsDiffInspector;
  [(FBSSceneClientSettingsDiffInspector *)keyboardLayersClientSettingsDiffInspector removeAllObservers];
}

id __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E6AF4D60;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)[v6 copy];

  return v4;
}

void __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void *)(v3 + 8);
    }
    else {
      uint64_t v4 = 0;
    }
    [v5 keyboardLayersDidChange:v4];
  }
}

uint64_t __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateMedusaHostedKeyboardWindow];
}

- (id)newMedusaHostedKeyboardWindowLevelAssertionWithPriority:(unint64_t)a3 windowLevel:(double)a4
{
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI]) {
    return 0;
  }
  medusaHostedKeyboardWindow = self->_medusaHostedKeyboardWindow;
  return (id)[(UIWindow *)medusaHostedKeyboardWindow newWindowLevelAssertionWithPriority:a3 windowLevel:a4];
}

- (BOOL)isKeyboardVisibleForSpringBoard
{
  if (![MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    id v2 = [MEMORY[0x1E4F62490] sharedInstance];
    uint64_t v3 = [v2 sceneWithIdentifier:*MEMORY[0x1E4F71DE8]];
    id v6 = [v3 clientSettings];
    id v7 = [v6 preferredSceneHostIdentifier];

    objc_super v8 = [v3 clientSettings];
    v9 = [v8 preferredSceneHostIdentity];

    if (v9)
    {
      uint64_t v10 = [v2 sceneFromIdentityToken:v9];
    }
    else
    {
      if (![v7 length])
      {
        uint64_t v4 = 0;
        goto LABEL_8;
      }
      uint64_t v10 = [v2 sceneWithIdentifier:v7];
    }
    uint64_t v4 = (void *)v10;
LABEL_8:
    int v11 = [v4 clientProcess];
    char v5 = [v11 isCurrentProcess];

    goto LABEL_9;
  }
  id v2 = +[SBWorkspace mainWorkspace];
  uint64_t v3 = [v2 keyboardFocusController];
  uint64_t v4 = [v3 inputUISceneController];
  char v5 = [v4 isVisibleForSpringBoard];
LABEL_9:

  return v5;
}

- (BOOL)shouldKeyboardBeWindowSizedForHostWithIdentity:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F62490] sharedInstance];
    char v5 = [v4 sceneFromIdentityToken:v3];

    if (v5)
    {
      id v6 = [v5 clientProcess];
      if ([v6 isApplicationProcess])
      {
        id v7 = +[SBApplicationController sharedInstance];
        objc_super v8 = [v6 bundleIdentifier];
        v9 = [v7 applicationWithBundleIdentifier:v8];

        uint64_t v10 = [v5 uiSettings];
        if ([v10 enhancedWindowingEnabled])
        {
          char v11 = [v9 supportsChamoisSceneResizing];

          char v12 = v11 - 1;
        }
        else
        {

          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12 & 1;
}

void __96__SBMedusaHostedKeyboardWindowController_updateMedusaHostedKeyboardWindowForScene_isForeground___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 usingMedusaHostedKeyboardWindowDidChange];
  }
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v4 = v8;
  if (v8)
  {
    observers = self->_observers;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    uint64_t v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v4 = v5;
  if (v5)
  {
    [(NSHashTable *)self->_observers removeObject:v5];
    uint64_t v4 = v5;
  }
}

- (void)_doObserverCalloutWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (UIWindow)medusaHostedKeyboardWindow
{
  return self->_medusaHostedKeyboardWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindow, 0);
  objc_storeStrong((id *)&self->_keyboardLayersClientSettingsDiffInspector, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end