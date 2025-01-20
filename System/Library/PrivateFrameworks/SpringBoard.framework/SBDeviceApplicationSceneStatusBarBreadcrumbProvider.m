@interface SBDeviceApplicationSceneStatusBarBreadcrumbProvider
+ (BOOL)_shouldAddBreadcrumbToActivatingSceneEntity:(id)a3 sceneHandle:(id)a4 withTransitionContext:(id)a5;
+ (id)_breadcrumbBundleIdForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4;
+ (id)_breadcrumbSceneIdForAppWithBundleID:(id)a3 activatingSceneEntity:(id)a4 withTransitionContext:(id)a5;
+ (id)_breadcrumbTitleForAppWithBundleID:(id)a3 sceneHandle:(id)a4 activatingSceneEntity:(id)a5 withTransitionContext:(id)a6;
+ (id)_destinationContextsForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4;
- (BOOL)_showTransientOverlayInPlace;
- (BOOL)activateBreadcrumbIfPossible;
- (BOOL)hasBreadcrumb;
- (NSString)breadcrumbTitle;
- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)initWithSceneHandle:(id)a3;
- (id)_breadcrumbNavigationActionContextForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_openStrategyForAppLinkState:(id)a3;
- (void)_activateBreadcrumbApplication:(id)a3 withSceneIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayConfiguration:(id)a6;
- (void)_handleBreadcrumbAction;
- (void)_installedApplicationsDidChange:(id)a3;
- (void)_presentAssistantFromBreadcrumb;
- (void)_presentSpotlightFromBreadcrumbInWindowScene:(id)a3;
- (void)_setCurrentBreadcrumbActionContext:(id)a3;
- (void)addObserver:(id)a3;
- (void)captureContextForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4;
- (void)noteDidUpdateDisplayProperties;
- (void)prepareForReuse;
- (void)removeObserver:(id)a3;
- (void)sceneHandle:(id)a3 didChangeEffectiveForegroundness:(BOOL)a4;
@end

@implementation SBDeviceApplicationSceneStatusBarBreadcrumbProvider

+ (BOOL)_shouldAddBreadcrumbToActivatingSceneEntity:(id)a3 sceneHandle:(id)a4 withTransitionContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v8 applicationSceneEntityForLayoutRole:1];
  v11 = [v10 application];
  v66 = [v11 bundleIdentifier];

  v12 = [v8 previousApplicationSceneEntityForLayoutRole:1];
  v13 = [v12 application];
  v14 = [v13 bundleIdentifier];

  v15 = [v8 previousApplicationSceneEntityForLayoutRole:2];
  v16 = [v15 application];
  v65 = [v16 bundleIdentifier];

  v17 = [v9 application];

  uint64_t v67 = [v17 bundleIdentifier];

  v18 = [v8 request];
  unint64_t v59 = [v18 source];
  v19 = [v18 originatingProcess];
  v20 = [v19 bundleIdentifier];

  v68 = v14;
  uint64_t v60 = [v14 length];
  int v21 = [v7 BOOLForActivationSetting:44];
  int v22 = [v20 isEqualToString:@"com.apple.Spotlight"];
  int v63 = [v7 BOOLForActivationSetting:26];
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = [v8 previousApplicationSceneEntityForLayoutRole:1];
  v25 = [(id)v24 sceneHandle];
  v26 = SBSafeCast(v23, v25);

  char v27 = [v26 forbidsActivationByBreadcrumbAction];
  v28 = [v26 application];
  LOBYTE(v24) = [v28 isSetup];

  if ((v24 & 1) != 0
    || (+[SBDefaults localDefaults],
        v29 = objc_claimAutoreleasedReturnValue(),
        [v29 workspaceDefaults],
        v30 = objc_claimAutoreleasedReturnValue(),
        char v31 = [v30 isBreadcrumbDisabled] | v27,
        v30,
        v29,
        (v31 & 1) != 0))
  {
    LOBYTE(v21) = 0;
LABEL_4:
    v32 = v66;
LABEL_5:
    v33 = v68;
LABEL_6:
    v34 = (void *)v67;
    goto LABEL_7;
  }
  v32 = v66;
  v33 = v68;
  if (([v66 isEqual:v68] & v22 & v63) == 1)
  {
    LOBYTE(v21) = +[SBHomeScreenReturnToSpotlightPolicy areSpotlightBreadcrumbsEnabled];
    goto LABEL_6;
  }
  v34 = (void *)v67;
  if ([v66 isEqual:v67])
  {
    if ((([v68 isEqual:v67] ^ 1 | v21) & 1) == 0) {
      goto LABEL_18;
    }
  }
  else if (!v21)
  {
    goto LABEL_7;
  }
  if (![v18 isMainWorkspaceTransitionRequest])
  {
LABEL_18:
    LOBYTE(v21) = 0;
    goto LABEL_7;
  }
  int v58 = [v7 BOOLForActivationSetting:42];
  int v36 = [v7 BOOLForActivationSetting:40];
  int v37 = [v20 isEqualToString:@"com.apple.camera"];
  if (v60)
  {
    v38 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v68];
    char v39 = [v38 isHidden];

    v32 = v66;
    if (v39)
    {
      LOBYTE(v21) = 0;
      goto LABEL_5;
    }
  }
  if (v21)
  {
    v34 = (void *)v67;
    LOBYTE(v21) = +[SBAssistantController shouldBreadcrumbLaunchedApplicationWithBundleIdentifier:v67];
    v33 = v68;
    goto LABEL_7;
  }
  if (v59 == 45 || (v36 & v37 & 1) != 0)
  {
    LOBYTE(v21) = 1;
    goto LABEL_5;
  }
  int v40 = v58;
  if (v59 == 6) {
    int v40 = 1;
  }
  v33 = v68;
  if (v40 == 1)
  {
    char v41 = v63;
    if (v60) {
      char v41 = 1;
    }
    LOBYTE(v21) = (v36 ^ 1) & v41;
    goto LABEL_6;
  }
  v34 = (void *)v67;
  if ((v59 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    if (v60) {
      LOBYTE(v21) = v36 ^ 1;
    }
    else {
      LOBYTE(v21) = 0;
    }
    goto LABEL_7;
  }
  LOBYTE(v21) = 0;
  if (v59 <= 0x13 && ((1 << v59) & 0x8A004) != 0)
  {
    int v42 = [v7 BOOLForActivationSetting:50];
    LODWORD(v43) = [v7 BOOLForActivationSetting:41];
    v44 = [v7 objectForActivationSetting:5];

    if (v42)
    {
      uint64_t v45 = [v7 objectForActivationSetting:14];
      id v46 = (id)v45;
      if (v60 && v45)
      {
        char v61 = (char)v43;
        v47 = [v8 previousApplicationSceneEntityForBundleID:v45];

        if (v47)
        {
          LOBYTE(v43) = v61;
LABEL_46:
          if (v63)
          {
            char v64 = [v46 isEqual:v67];
            BOOL v49 = +[SBHomeScreenReturnToSpotlightPolicy areSpotlightBreadcrumbsEnabled];
            if (v44) {
              char v50 = 1;
            }
            else {
              char v50 = (char)v43;
            }
            if (!v49 | v42) {
              char v51 = v49;
            }
            else {
              char v51 = v50;
            }
          }
          else
          {
            char v52 = [v68 isEqual:v46];
            char v53 = [v65 isEqual:v46];
            char v64 = [v46 isEqual:v67];
            char v51 = v52 | v53;
          }
          char v62 = v51;
          v54 = +[SBApplicationController sharedInstance];
          v55 = [v54 applicationWithBundleIdentifier:v46];
          v56 = [v55 info];
          char v57 = [v56 shouldLaunchSuspendedAlways];

          LOBYTE(v21) = v62 & ((v64 | v57) ^ 1);
          goto LABEL_4;
        }
        id v43 = v68;

        id v46 = v43;
        LOBYTE(v43) = v61;
      }
      v48 = v68;
      if (v46) {
        goto LABEL_46;
      }
    }
    else
    {
      v48 = v20;
      if (!v43)
      {
        id v46 = 0;
        goto LABEL_46;
      }
    }
    id v46 = v48;
    goto LABEL_46;
  }
LABEL_7:

  return v21;
}

- (BOOL)hasBreadcrumb
{
  currentBreadcrumbActionContext = self->_currentBreadcrumbActionContext;
  return currentBreadcrumbActionContext
      && currentBreadcrumbActionContext->_didCaptureContext
      && currentBreadcrumbActionContext->_breadcrumbAppBundleID != 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v9 = v4;
    if (!observers)
    {
      v6 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    BOOL v8 = [(NSHashTable *)observers containsObject:v9];
    id v4 = v9;
    if (!v8)
    {
      [(NSHashTable *)self->_observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)captureContextForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  BOOL v8 = [WeakRetained sceneIdentifier];
  id v9 = [(id)objc_opt_class() _breadcrumbBundleIdForActivatingSceneEntity:v23 withTransitionContext:v6];
  v10 = [v23 application];
  v11 = [v10 bundleIdentifier];
  int v12 = [v9 isEqualToString:v11];

  uint64_t v13 = [v23 layoutRole];
  if (v13 != 1 && (SBLayoutRoleIsValidForSplitView(v13) & v12) == 1) {
    [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self _setCurrentBreadcrumbActionContext:0];
  }
  if ([(id)objc_opt_class() _shouldAddBreadcrumbToActivatingSceneEntity:v23 sceneHandle:WeakRetained withTransitionContext:v6])
  {
    uint64_t v14 = [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self _breadcrumbNavigationActionContextForActivatingSceneEntity:v23 withTransitionContext:v6];
    uint64_t v15 = [(id)objc_opt_class() _breadcrumbTitleForAppWithBundleID:v9 sceneHandle:WeakRetained activatingSceneEntity:v23 withTransitionContext:v6];
    v16 = *(void **)(v14 + 64);
    *(void *)(v14 + 64) = v15;

    v17 = [v6 request];
    uint64_t v18 = [v17 displayConfiguration];
    v19 = *(void **)(v14 + 72);
    *(void *)(v14 + 72) = v18;

    v20 = [(id)SBApp windowSceneManager];
    int v21 = [*(id *)(v14 + 72) identity];
    int v22 = [v20 windowSceneForDisplayIdentity:v21];
    objc_storeWeak((id *)(v14 + 80), v22);

    if (v8) {
      [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self _setCurrentBreadcrumbActionContext:v14];
    }
  }
}

+ (id)_breadcrumbBundleIdForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = [v6 BOOLForActivationSetting:26];
  int v8 = [v6 BOOLForActivationSetting:44];

  id v9 = [v5 request];
  v10 = [v9 originatingProcess];
  v11 = [v10 bundleIdentifier];

  int v12 = [v11 isEqualToString:@"com.apple.camera"];
  if (v8)
  {
    uint64_t v13 = @"com.apple.Siri";
LABEL_7:
    uint64_t v14 = v13;
    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v14 = @"com.apple.springboard.spotlight-placeholder";
    goto LABEL_8;
  }
  if (v12)
  {
    uint64_t v13 = @"com.apple.camera";
    goto LABEL_7;
  }
  v16 = [v5 previousApplicationSceneEntityForLayoutRole:1];
  v17 = [v16 application];
  uint64_t v14 = [v17 bundleIdentifier];

LABEL_8:
  return v14;
}

- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)initWithSceneHandle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneStatusBarBreadcrumbProvider;
  id v5 = [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sceneHandle, v4);
    [v4 addObserver:v6];
  }

  return v6;
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (NSString)breadcrumbTitle
{
  currentBreadcrumbActionContext = self->_currentBreadcrumbActionContext;
  if (currentBreadcrumbActionContext) {
    return currentBreadcrumbActionContext->_breadcrumbTitle;
  }
  else {
    return (NSString *)0;
  }
}

- (BOOL)activateBreadcrumbIfPossible
{
  [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self _handleBreadcrumbAction];
  return [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self hasBreadcrumb];
}

- (void)prepareForReuse
{
  [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self _setCurrentBreadcrumbActionContext:0];
  [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self noteDidUpdateDisplayProperties];
}

- (void)noteDidUpdateDisplayProperties
{
  v3 = [(NSHashTable *)self->_observers allObjects];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__SBDeviceApplicationSceneStatusBarBreadcrumbProvider_noteDidUpdateDisplayProperties__block_invoke;
  v4[3] = &unk_1E6AFB020;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __85__SBDeviceApplicationSceneStatusBarBreadcrumbProvider_noteDidUpdateDisplayProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 statusBarBreadcrumbProviderDidUpdateDisplayProperties:*(void *)(a1 + 32)];
  }
}

- (id)_breadcrumbNavigationActionContextForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = objc_alloc_init(SBBreadcrumbActionContext);
  v7->_lastSource = SBSpotlightLastPresentationSource();
  uint64_t v8 = [(id)objc_opt_class() _breadcrumbBundleIdForActivatingSceneEntity:v5 withTransitionContext:v6];
  breadcrumbAppBundleID = v7->_breadcrumbAppBundleID;
  v7->_breadcrumbAppBundleID = (NSString *)v8;

  uint64_t v10 = [(id)objc_opt_class() _breadcrumbSceneIdForAppWithBundleID:v7->_breadcrumbAppBundleID activatingSceneEntity:v5 withTransitionContext:v6];
  breadcrumbSceneID = v7->_breadcrumbSceneID;
  v7->_breadcrumbSceneID = (NSString *)v10;

  if ([v5 BOOLForActivationSetting:26]) {
    char v12 = 1;
  }
  else {
    char v12 = [(NSString *)v7->_breadcrumbAppBundleID isEqualToString:@"com.apple.springboard.spotlight-placeholder"];
  }
  v7->_wasFromSpotlight = v12;
  if ([v5 BOOLForActivationSetting:44]) {
    char v13 = 1;
  }
  else {
    char v13 = [(NSString *)v7->_breadcrumbAppBundleID isEqualToString:@"com.apple.Siri"];
  }
  v7->_wasFromAssistant = v13;
  uint64_t v14 = [v6 previousApplicationSceneEntityForLayoutRole:2];
  uint64_t v15 = [v14 application];
  uint64_t v16 = [v15 bundleIdentifier];
  previousSideBundleId = v7->_previousSideBundleId;
  v7->_previousSideBundleId = (NSString *)v16;

  if (v7->_wasFromSpotlight)
  {
    uint64_t v18 = 1;
  }
  else if (v7->_wasFromAssistant)
  {
    uint64_t v18 = 2;
  }
  else if ([(NSString *)v7->_breadcrumbAppBundleID length])
  {
    uint64_t v18 = 3;
  }
  else
  {
    uint64_t v18 = 5;
  }
  v7->_analyticsType = v18;
  uint64_t v25 = *MEMORY[0x1E4FA7600];
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v26[0] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  int v21 = (void *)MEMORY[0x1E4FA5E78];
  id v22 = v20;
  id v23 = [v21 sharedInstance];
  [v23 emitEvent:15 withPayload:v22];

  v7->_didCaptureContext = 1;
  return v7;
}

+ (id)_destinationContextsForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 _breadcrumbBundleIdForActivatingSceneEntity:v7 withTransitionContext:v6];
  id v9 = [a1 _breadcrumbSceneIdForAppWithBundleID:v8 activatingSceneEntity:v7 withTransitionContext:v6];
  uint64_t v10 = [v6 previousApplicationSceneEntityForLayoutRole:1];
  v11 = [v10 sceneHandle];

  char v12 = [a1 _breadcrumbTitleForAppWithBundleID:v8 sceneHandle:v11 activatingSceneEntity:v7 withTransitionContext:v6];

  char v13 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v9) {
    [MEMORY[0x1E4F42E80] systemNavigationActionContextWithTitle:v12 sceneIdentifier:v9];
  }
  else {
  uint64_t v14 = [MEMORY[0x1E4F42E80] systemNavigationActionContextWithTitle:v12 bundleId:v8];
  }
  [v13 setObject:v14 forKeyedSubscript:&unk_1F3349950];

  return v13;
}

+ (id)_breadcrumbTitleForAppWithBundleID:(id)a3 sceneHandle:(id)a4 activatingSceneEntity:(id)a5 withTransitionContext:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  char v12 = +[SBApplicationController sharedInstance];
  char v13 = [v12 applicationWithBundleIdentifier:v9];

  if ([v10 BOOLForActivationSetting:26])
  {
    if (![v10 BOOLForActivationSetting:44]) {
      goto LABEL_7;
    }
LABEL_5:
    uint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v16 = v15;
    v17 = @"SIRI";
LABEL_8:
    uint64_t v18 = [v15 localizedStringForKey:v17 value:&stru_1F3084718 table:@"SpringBoard"];
LABEL_9:

    goto LABEL_10;
  }
  int v14 = [v9 isEqualToString:@"com.apple.springboard.spotlight-placeholder"];
  if ([v10 BOOLForActivationSetting:44]) {
    goto LABEL_5;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v16 = v15;
    v17 = @"SYSTEM_SEARCH_TITLE";
    goto LABEL_8;
  }
  if ([v9 isEqualToString:@"com.apple.webapp"])
  {
    uint64_t v16 = [a1 _breadcrumbSceneIdForAppWithBundleID:v9 activatingSceneEntity:v10 withTransitionContext:v11];
    v20 = +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:v16];
    int v21 = [MEMORY[0x1E4F43048] webClipWithIdentifier:v20];
    uint64_t v18 = [v21 title];

    goto LABEL_9;
  }
  uint64_t v18 = [v13 displayName];
LABEL_10:

  return v18;
}

+ (id)_breadcrumbSceneIdForAppWithBundleID:(id)a3 activatingSceneEntity:(id)a4 withTransitionContext:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  uint64_t v8 = [v6 previousApplicationSceneEntityForLayoutRole:1];
  id v9 = [v8 application];
  id v10 = [v9 bundleIdentifier];

  LODWORD(v8) = [v10 isEqualToString:v7];
  if (v8)
  {
    id v11 = [v6 previousApplicationSceneEntityForLayoutRole:1];
    char v12 = [v11 sceneHandle];
    char v13 = [v12 sceneIdentifier];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)_setCurrentBreadcrumbActionContext:(id)a3
{
  id v5 = (SBBreadcrumbActionContext *)a3;
  currentBreadcrumbActionContext = self->_currentBreadcrumbActionContext;
  if (currentBreadcrumbActionContext != v5)
  {
    id v11 = v5;
    id v7 = currentBreadcrumbActionContext;
    objc_storeStrong((id *)&self->_currentBreadcrumbActionContext, a3);
    uint64_t v8 = self->_currentBreadcrumbActionContext;
    if (v7)
    {
      if (!v8)
      {
        id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v10 = +[SBApplicationController sharedInstance];
        [v9 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:v10];
LABEL_7:
      }
    }
    else if (v8)
    {
      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v10 = +[SBApplicationController sharedInstance];
      [v9 addObserver:self selector:sel__installedApplicationsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:v10];
      goto LABEL_7;
    }

    id v5 = v11;
  }
}

- (void)_installedApplicationsDidChange:(id)a3
{
  id v4 = a3;
  currentBreadcrumbActionContext = self->_currentBreadcrumbActionContext;
  id v10 = v4;
  if (currentBreadcrumbActionContext)
  {
    id v6 = currentBreadcrumbActionContext->_breadcrumbAppBundleID;
    id v7 = v6;
    if (v6 && [(NSString *)v6 length])
    {
      uint64_t v8 = +[SBApplicationController sharedInstance];
      id v9 = [v8 applicationWithBundleIdentifier:v7];

      if (!v9) {
        [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self prepareForReuse];
      }
    }
  }
  else
  {
    id v7 = 0;
  }
}

- (void)_handleBreadcrumbAction
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = self->_currentBreadcrumbActionContext;
  id v4 = v3;
  if (v3 && v3->_didCaptureContext)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v3->_windowScene);
    v14[0] = *MEMORY[0x1E4FA75D0];
    id v6 = [NSNumber numberWithUnsignedInteger:v4->_analyticsType];
    v14[1] = *MEMORY[0x1E4FA7448];
    v15[0] = v6;
    v15[1] = &unk_1F3349968;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v8 = (void *)MEMORY[0x1E4FA5E78];
    id v9 = v7;
    id v10 = [v8 sharedInstance];
    [v10 emitEvent:16 withPayload:v9];

    if (v4->_wasFromAssistant)
    {
      [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self _presentAssistantFromBreadcrumb];
    }
    else if (v4->_wasFromSpotlight)
    {
      [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self _presentSpotlightFromBreadcrumbInWindowScene:WeakRetained];
    }
    else
    {
      id v11 = SBWorkspaceApplicationForIdentifier(v4->_breadcrumbAppBundleID);
      breadcrumbSceneID = v4->_breadcrumbSceneID;
      char v13 = [WeakRetained sceneManager];
      [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self _activateBreadcrumbApplication:v11 withSceneIdentifier:breadcrumbSceneID sceneHandleProvider:v13 displayConfiguration:v4->_displayConfiguration];
    }
  }
}

- (void)_presentAssistantFromBreadcrumb
{
  id v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v4 = [v3 policyAggregator];
  int v5 = [v4 allowsCapability:4];

  if (v5)
  {
    [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self prepareForReuse];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentAssistantFromBreadcrumb__block_invoke;
    v9[3] = &unk_1E6AF4AC0;
    v9[4] = self;
    id v6 = [MEMORY[0x1E4F624D8] eventWithName:@"SiriBreadcrumb" handler:v9];
    id v7 = +[SBWorkspace mainWorkspace];
    uint64_t v8 = [v7 eventQueue];
    [v8 executeOrAppendEvent:v6];
  }
}

uint64_t __86__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentAssistantFromBreadcrumb__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F9F940]);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  return [v2 activate];
}

- (void)_presentSpotlightFromBreadcrumbInWindowScene:(id)a3
{
  id v4 = a3;
  if ([(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self _showTransientOverlayInPlace])
  {
    [(id)SBApp toggleSearchOnWindowScene:v4 fromBreadcrumbSource:1 withWillBeginHandler:0 completionHandler:0];
    [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self prepareForReuse];
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F624D8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentSpotlightFromBreadcrumbInWindowScene___block_invoke;
    v10[3] = &unk_1E6AF4AC0;
    id v11 = v4;
    id v6 = [v5 eventWithName:@"presentSpotlight" handler:v10];
    id v7 = +[SBWorkspace mainWorkspace];
    uint64_t v8 = [v7 eventQueue];
    [v8 executeOrAppendEvent:v6];

    id v9 = +[SBWorkspace mainWorkspace];
    [v9 requestTransitionWithBuilder:&__block_literal_global_59];
  }
}

void __100__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentSpotlightFromBreadcrumbInWindowScene___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) homeScreenController];
  v2 = [v1 iconManager];
  id v3 = v2;
  if (v2)
  {
    id v5 = v2;
  }
  else
  {
    id v4 = +[SBIconController sharedInstance];
    id v5 = [v4 iconManager];
  }
  [v5 presentSpotlightFromSource:5 animated:0 completionHandler:0];
}

void __100__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentSpotlightFromBreadcrumbInWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setEventLabel:@"SpotlightBreadcrumb"];
  [v2 setSource:15];
  [v2 modifyApplicationContext:&__block_literal_global_79];
}

void __100__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentSpotlightFromBreadcrumbInWindowScene___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBWorkspaceEntity entity];
  [v2 setActivatingEntity:v3];
}

- (BOOL)_showTransientOverlayInPlace
{
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (int64_t)_openStrategyForAppLinkState:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4FA6EA8]];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)_activateBreadcrumbApplication:(id)a3 withSceneIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayConfiguration:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  char v13 = +[SBWorkspace mainWorkspace];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __147__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__activateBreadcrumbApplication_withSceneIdentifier_sceneHandleProvider_displayConfiguration___block_invoke;
  v18[3] = &unk_1E6AFB070;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  [v13 requestTransitionWithOptions:0 displayConfiguration:v14 builder:v18];
}

void __147__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__activateBreadcrumbApplication_withSceneIdentifier_sceneHandleProvider_displayConfiguration___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:15];
  id v4 = [a1[4] bundleIdentifier];
  [v3 setEventLabelWithFormat:@"ActivateFromBreadcrumb: %@", v4];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __147__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__activateBreadcrumbApplication_withSceneIdentifier_sceneHandleProvider_displayConfiguration___block_invoke_2;
  v5[3] = &unk_1E6AFB048;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[7];
  [v3 modifyApplicationContext:v5];
}

void __147__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__activateBreadcrumbApplication_withSceneIdentifier_sceneHandleProvider_displayConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [SBDeviceApplicationSceneEntity alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 56) identity];
  id v9 = [(SBDeviceApplicationSceneEntity *)v4 initWithApplication:v5 uniqueIdentifier:v6 sceneHandleProvider:v7 displayIdentity:v8];

  [(SBWorkspaceEntity *)v9 setFlag:1 forActivationSetting:48];
  [v3 setActivatingEntity:v9];
}

- (void)sceneHandle:(id)a3 didChangeEffectiveForegroundness:(BOOL)a4
{
  if (!a4) {
    [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self prepareForReuse];
  }
}

- (id)succinctDescription
{
  id v2 = [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self breadcrumbTitle];
  [v3 appendString:v4 withName:@"breadcrumbTitle" skipIfEmpty:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self succinctDescriptionBuilder];
  uint64_t v5 = self->_currentBreadcrumbActionContext;
  if (v5 && [(SBDeviceApplicationSceneStatusBarBreadcrumbProvider *)self hasBreadcrumb]) {
    uint64_t v6 = v5->_breadcrumbAppBundleID;
  }
  else {
    uint64_t v6 = 0;
  }
  [v4 appendString:v6 withName:@"breadcrumbAppBundleID" skipIfEmpty:1];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_sceneHandle);
  objc_storeStrong((id *)&self->_currentBreadcrumbActionContext, 0);
  objc_storeStrong((id *)&self->_siriSource, 0);
}

@end