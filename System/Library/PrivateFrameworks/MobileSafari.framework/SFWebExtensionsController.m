@interface SFWebExtensionsController
+ (Class)_extensionDataClass;
+ (id)_extensionDefaults;
+ (id)_skipLoadingEnabledExtensionsAtLaunchPreferenceKey;
+ (void)_didDiscoverExtensions:(BOOL)a3;
- (BOOL)_isExtensionBlockedByBlocklist:(id)a3 completionHandler:(id)a4;
- (BOOL)_isExtensionBlockedByBlocklist:(id)a3 developerIdentifier:(id)a4;
- (BOOL)extensionsEnabled;
- (BOOL)hasNamedProfiles;
- (BOOL)hasUpdatedToolbarItemBadgeTextInTab:(id)a3;
- (BOOL)parentalControlsAreEnabledForExtensions;
- (NSArray)allContentBlockerManagers;
- (NSArray)allWebExtensionControllers;
- (NSMutableDictionary)tabIDToTabPositionForTabsInTransit;
- (NSString)applicationNameForUserAgent;
- (NSURL)extensionOverriddenStartPageURL;
- (SFWebExtension)currentExtensionForPermissionBanner;
- (SFWebExtensionControllerProfileDelegate)profileDelegate;
- (UIViewController)viewControllerToPresentDialogsFrom;
- (WKContentRuleListStore)contentBlockerStore;
- (WKProcessPool)processPool;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (id)_allWindowsForWebExtension:(id)a3;
- (id)_commandShortcutConflictAlertForExtension:(id)a3 conflict:(id)a4 okAction:(id)a5;
- (id)_developerIdentifierForExtension:(id)a3 untrustedCodeSigningDictionary:(id)a4;
- (id)_deviceUUIDString;
- (id)_domainForDefaultSearchProvider;
- (id)_findTabInAnyWindowWithID:(double)a3;
- (id)_findWindowWithID:(double)a3;
- (id)_safariShortVersion;
- (id)_webViewConfiguration;
- (id)allProfileExtensionsControllers;
- (id)contentBlockerManagerForProfileServerID:(id)a3;
- (id)lastFocusedWindow;
- (id)profile;
- (id)tabGroupManager;
- (id)webExtensionsControllerForProfileServerID:(id)a3;
- (unint64_t)recentlyInstalledExtensionCount;
- (unint64_t)toolbarItemIdealPointSize;
- (void)_clearNewTabPreferenceIfNecessaryForRemovedExtensionWithComposedIdentifier:(id)a3;
- (void)_createNewTabInWindow:(id)a3 tabIndex:(id)a4 url:(id)a5 makeActive:(BOOL)a6 completionHandler:(id)a7;
- (void)_extensionWithComposedIdentifier:(id)a3 wasEnabledOrDisabledByExtensionSettings:(BOOL)a4;
- (void)_relateParentTab:(id)a3 toTab:(id)a4;
- (void)_reportCommandShortcutConflictsForExtension:(id)a3 conflicts:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6;
- (void)_showAccessRequestAlertForExtension:(id)a3 domains:(id)a4 callingAPIName:(id)a5 responseBlock:(id)a6;
- (void)_updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally:(id)a3 shouldUpdateExtensionPermissionsAndEnabledState:(BOOL)a4;
- (void)didDeactivateWindow;
- (void)didViewToolbarItemBadgesInTab:(id)a3;
- (void)extensionSettingsWereUpdatedExternallyFromSettingsApp:(BOOL)a3;
- (void)fireAppropriateTabMovementEventForTabState:(id)a3;
- (void)fireAttachmentEventsForTabsWithPreviousTabPositions:(id)a3;
- (void)fireOnMovedEventForTabsWithPreviousTabPositions:(id)a3 currentTabsPositions:(id)a4;
- (void)hidePermissionBannerForExtension:(id)a3;
- (void)reportCommandShortcutConflictsIfNecessaryForExtension:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
- (void)setApplicationNameForUserAgent:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)setProcessPool:(id)a3;
- (void)setProfileDelegate:(id)a3;
- (void)setTabIDToTabPositionForTabsInTransit:(id)a3;
- (void)setViewControllerToPresentDialogsFrom:(id)a3;
- (void)showPermissionBannerForExtension:(id)a3;
- (void)webExtensionController:(id)a3 presentPopupForAction:(id)a4 forExtensionContext:(id)a5 completionHandler:(id)a6;
@end

@implementation SFWebExtensionsController

- (BOOL)extensionsEnabled
{
  return 1;
}

- (void)setProcessPool:(id)a3
{
  v5 = (WKProcessPool *)a3;
  p_processPool = &self->_processPool;
  processPool = self->_processPool;
  if (v5)
  {
    if (processPool != v5)
    {
      objc_storeStrong((id *)p_processPool, a3);
      objc_initWeak(&location, self);
      v8 = [(id)objc_opt_class() _extensionDefaults];
      uint64_t v9 = *MEMORY[0x1E4F984A0];
      uint64_t v10 = MEMORY[0x1E4F14428];
      id v11 = MEMORY[0x1E4F14428];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __44__SFWebExtensionsController_setProcessPool___block_invoke;
      v15[3] = &unk_1E54EB320;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v8, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v9, v10, 1, v15);
      v12 = (WBSUserDefaultObservation *)objc_claimAutoreleasedReturnValue();
      stubUnsupportedAPIsUserDefaultObserver = self->_stubUnsupportedAPIsUserDefaultObserver;
      self->_stubUnsupportedAPIsUserDefaultObserver = v12;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    *p_processPool = 0;

    v14 = self->_stubUnsupportedAPIsUserDefaultObserver;
    self->_stubUnsupportedAPIsUserDefaultObserver = 0;
  }
}

+ (id)_extensionDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
}

- (NSURL)extensionOverriddenStartPageURL
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  v4 = [(WBSWebExtensionsController *)self tabOverridePreferencesManager];
  if ([v4 isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:v3])
  {
    v5 = [v4 extensionComposedIdentifierForNewTabPreferenceInDefaults:v3];
    v6 = [(WBSWebExtensionsController *)self webExtensionForComposedIdentifier:v5];
    v7 = (void *)[v6 newTabOverridePageURL];
  }
  else
  {
    v7 = 0;
  }

  return (NSURL *)v7;
}

+ (id)_skipLoadingEnabledExtensionsAtLaunchPreferenceKey
{
  return @"SkipLoadingEnabledExtensionsAtLaunch";
}

- (NSMutableDictionary)tabIDToTabPositionForTabsInTransit
{
  return self->_tabIDToTabPositionForTabsInTransit;
}

- (void)setProfileDelegate:(id)a3
{
}

- (void)setNavigationIntentHandler:(id)a3
{
}

- (void)setApplicationNameForUserAgent:(id)a3
{
}

- (id)_developerIdentifierForExtension:(id)a3 untrustedCodeSigningDictionary:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_getAssociatedObject(v4, &developerIdentifierRepresentedObjectKey);
  if (v5)
  {
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    v8 = v7;

    goto LABEL_22;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F223A0]);
  uint64_t v10 = [v4 _plugIn];
  id v11 = [v10 uuid];
  id v23 = 0;
  v12 = (void *)[v9 initWithUUID:v11 error:&v23];
  id v13 = v23;

  if (!v12)
  {
    id v16 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = [v4 identifier];
      v18 = objc_msgSend(v13, "safari_privacyPreservingDescription");
      [(SFWebExtensionsController *)v17 _developerIdentifierForExtension:buf untrustedCodeSigningDictionary:v16];
    }

    v14 = [MEMORY[0x1E4F1CA98] null];
    objc_setAssociatedObject(v4, &developerIdentifierRepresentedObjectKey, v14, (void *)1);
    v8 = 0;
    goto LABEL_21;
  }
  v14 = [v12 containingBundleRecord];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [v4 identifier];
      -[SFWebExtensionsController _developerIdentifierForExtension:untrustedCodeSigningDictionary:](v20, buf, v19);
    }

    v21 = [MEMORY[0x1E4F1CA98] null];
    objc_setAssociatedObject(v4, &developerIdentifierRepresentedObjectKey, v21, (void *)1);
    v8 = 0;
    goto LABEL_20;
  }
  v8 = [v14 teamIdentifier];
  if ([(__CFString *)v8 isEqualToString:@"0000000000"])
  {

    char v15 = 0;
    v8 = @"UNSIGNED";
LABEL_18:
    v21 = v8;
    goto LABEL_19;
  }
  if (v8)
  {
    char v15 = 0;
    goto LABEL_18;
  }
  v21 = [MEMORY[0x1E4F1CA98] null];
  char v15 = 1;
LABEL_19:
  objc_setAssociatedObject(v4, &developerIdentifierRepresentedObjectKey, v21, (void *)1);
  if (v15) {
LABEL_20:
  }

LABEL_21:
LABEL_22:

  return v8;
}

- (id)_webViewConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  id v4 = [(SFWebExtensionsController *)self applicationNameForUserAgent];
  [v3 setApplicationNameForUserAgent:v4];

  v5 = [(SFWebExtensionsController *)self processPool];
  [v3 setProcessPool:v5];

  id v6 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_webExtensionUserContentController");
  [v3 setUserContentController:v6];

  [v3 _setCrossOriginAccessControlCheckEnabled:0];
  [v3 _setGroupIdentifier:*MEMORY[0x1E4F99780]];
  [v3 _setShouldRelaxThirdPartyCookieBlocking:1];
  v7 = [v3 defaultWebpagePreferences];
  [v7 _setAutoplayPolicy:1];

  v8 = [(WBSExtensionsController *)self websiteDataStore];
  [v3 setWebsiteDataStore:v8];

  uint64_t v9 = _SFDeviceSupportsDesktopSitesByDefault();
  uint64_t v10 = [v3 defaultWebpagePreferences];
  id v11 = v10;
  if (v9) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 0;
  }
  [v10 setPreferredContentMode:v12];

  id v13 = _SFApplicationNameForDesktopUserAgent();
  v14 = [v3 defaultWebpagePreferences];
  [v14 _setApplicationNameForUserAgentWithModernCompatibility:v13];

  char v15 = [v3 preferences];
  [v15 _setShouldIgnoreMetaViewport:v9];

  return v3;
}

- (WKProcessPool)processPool
{
  return self->_processPool;
}

- (NSString)applicationNameForUserAgent
{
  return self->_applicationNameForUserAgent;
}

- (BOOL)hasUpdatedToolbarItemBadgeTextInTab:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(WBSExtensionsController *)self enabledExtensions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [(WBSWebExtensionsController *)self webExtensionForExtension:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        uint64_t v10 = [v9 toolbarItem];
        char v11 = [v10 hasUpdatedBadgeTextInTab:v4];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)setViewControllerToPresentDialogsFrom:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerToPresentDialogsFrom, a3);

  [(SFWebExtensionsController *)self cancelPresentedDialogIfNecessaryAndUnqueuePendingWebExtensionDialogs];
}

void __44__SFWebExtensionsController_setProcessPool___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (void *)*((void *)WeakRetained + 39);
    uint64_t v7 = *MEMORY[0x1E4F984A0];
    v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "BOOLForKey:", *MEMORY[0x1E4F984A0]));
    [v6 _setObject:v8 forBundleParameter:v7];
  }
}

- (BOOL)_isExtensionBlockedByBlocklist:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v6, "sf_bundleIdentifierForContainingApp");
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:0 error:0];
  if (v9)
  {
    blocklistQueue = self->_blocklistQueue;
    if (!blocklistQueue)
    {
      char v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      BOOL v12 = (OS_dispatch_queue *)dispatch_queue_create("Web Extension Blocklist Queue", v11);
      id v13 = self->_blocklistQueue;
      self->_blocklistQueue = v12;

      blocklistQueue = self->_blocklistQueue;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__SFWebExtensionsController__isExtensionBlockedByBlocklist_completionHandler___block_invoke;
    block[3] = &unk_1E54EB140;
    id v16 = v9;
    id v17 = v8;
    id v18 = v7;
    dispatch_async(blocklistQueue, block);
  }
  return 0;
}

void __78__SFWebExtensionsController__isExtensionBlockedByBlocklist_completionHandler___block_invoke(uint64_t a1)
{
  void v15[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FBA7C0];
  v14[0] = *MEMORY[0x1E4FBA7A8];
  v14[1] = v2;
  v15[0] = MEMORY[0x1E4F1CC38];
  v15[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4FBA788];
  v14[2] = *MEMORY[0x1E4FBA798];
  v14[3] = v3;
  v15[2] = MEMORY[0x1E4F1CC38];
  v15[3] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v5 = [*(id *)(a1 + 32) URL];
  id v6 = [v5 path];
  int v7 = MISValidateSignature();

  if (v7)
  {
    v8 = (void *)MISCopyErrorStringForErrorCode();
    id v9 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __78__SFWebExtensionsController__isExtensionBlockedByBlocklist_completionHandler___block_invoke_cold_1(a1, (uint64_t)v8, v9);
    }
  }
  else
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138477827;
      uint64_t v13 = v11;
      _os_log_impl(&dword_18C354000, v10, OS_LOG_TYPE_INFO, "Parent app for web extension with identifier %{private}@ is a trusted app", (uint8_t *)&v12, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)_isExtensionBlockedByBlocklist:(id)a3 developerIdentifier:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SFWebExtensionsController__isExtensionBlockedByBlocklist_developerIdentifier___block_invoke;
  v8[3] = &unk_1E54EB190;
  v8[4] = self;
  id v6 = v5;
  id v9 = v6;
  objc_copyWeak(&v10, &location);
  LOBYTE(self) = [(SFWebExtensionsController *)self _isExtensionBlockedByBlocklist:v6 completionHandler:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return (char)self;
}

void __80__SFWebExtensionsController__isExtensionBlockedByBlocklist_developerIdentifier___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__SFWebExtensionsController__isExtensionBlockedByBlocklist_developerIdentifier___block_invoke_2;
    block[3] = &unk_1E54EB168;
    objc_copyWeak(&v8, (id *)(a1 + 48));
    id v7 = *(id *)(a1 + 40);
    int v9 = a2;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v8);
  }
  else
  {
    id v4 = objc_opt_class();
    id v5 = [*(id *)(a1 + 40) identifier];
    objc_msgSend(v4, "removeExtensionBundleIDFromArrayOfBlocklistedExtensions:");
  }
}

void __80__SFWebExtensionsController__isExtensionBlockedByBlocklist_developerIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    [WeakRetained _disableAndBlockExtension:*(void *)(a1 + 32)];
    uint64_t v3 = objc_opt_class();
    id v4 = [*(id *)(a1 + 32) identifier];
    LOBYTE(v3) = [(id)v3 hasBlockedPromptAppearedForExtensionWithIdentifier:v4];

    id WeakRetained = v8;
    if ((v3 & 1) == 0)
    {
      id v5 = [v8 _displayNameForExtension:*(void *)(a1 + 32)];
      uint64_t v6 = *(void *)(a1 + 32);
      if (*(_DWORD *)(a1 + 48) == -402620387)
      {
        [v8 showPromptForBlocklistedExtension:v6 extensionName:v5];
      }
      else
      {
        id v7 = [v8 webExtensionForExtension:v6];
        [v8 showPromptForExpiredExtension:v7 extensionName:v5];
      }
      id WeakRetained = v8;
    }
  }
}

- (void)extensionSettingsWereUpdatedExternallyFromSettingsApp:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFWebExtensionsController *)self extensionsEnabled])
  {
    uint64_t v5 = (int)*MEMORY[0x1E4F98FF0];
    id v9 = *(id *)((char *)&self->super.super.super.isa + v5);
    uint64_t v6 = [(WBSExtensionsController *)self readExtensionsStateFromStorage];
    id v7 = (objc_class *)[v6 mutableCopy];
    id v8 = *(Class *)((char *)&self->super.super.super.isa + v5);
    *(Class *)((char *)&self->super.super.super.isa + v5) = v7;

    if (*(Class *)((char *)&self->super.super.super.isa + v5)) {
      [(SFWebExtensionsController *)self _updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally:v9 shouldUpdateExtensionPermissionsAndEnabledState:v3];
    }
  }
}

- (void)_updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally:(id)a3 shouldUpdateExtensionPermissionsAndEnabledState:(BOOL)a4
{
  id v6 = a3;
  id v7 = *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FF0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __143__SFWebExtensionsController__updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally_shouldUpdateExtensionPermissionsAndEnabledState___block_invoke;
  v9[3] = &unk_1E54EB1B8;
  id v10 = v6;
  uint64_t v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __143__SFWebExtensionsController__updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally_shouldUpdateExtensionPermissionsAndEnabledState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  id v7 = [*(id *)(a1 + 40) webExtensionForComposedIdentifier:v12];
  id v8 = v7;
  if (v7)
  {
    [v7 setHasLoadedPermissionsFromStorage:0];
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v9 = *MEMORY[0x1E4F98800];
      uint64_t v10 = objc_msgSend(v5, "safari_BOOLForKey:", *MEMORY[0x1E4F98800]);
      int v11 = objc_msgSend(v6, "safari_BOOLForKey:", v9);
      if (v10 == v11)
      {
        if (v11) {
          [*(id *)(a1 + 40) _permissionsMayHaveBeenChangedExternallyForExtension:v8 previousExtensionState:v6];
        }
      }
      else
      {
        [*(id *)(a1 + 40) _extensionWithComposedIdentifier:v12 wasEnabledOrDisabledByExtensionSettings:v10];
      }
    }
  }
}

- (void)_extensionWithComposedIdentifier:(id)a3 wasEnabledOrDisabledByExtensionSettings:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(WBSExtensionsController *)self extensionWithComposedIdentifier:v6];
  if (v7)
  {
    if ([*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE8]) containsObject:v7] == v4)
    {
      id v12 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = [v7 identifier];
        [(SFWebExtensionsController *)v13 _extensionWithComposedIdentifier:(uint8_t *)&v14 wasEnabledOrDisabledByExtensionSettings:v12];
      }
    }
    else
    {
      id v8 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [v7 identifier];
        uint64_t v10 = (void *)v9;
        int v11 = @"disabled";
        if (v4) {
          int v11 = @"enabled";
        }
        int v14 = 138478083;
        uint64_t v15 = v9;
        __int16 v16 = 2114;
        id v17 = v11;
        _os_log_impl(&dword_18C354000, v8, OS_LOG_TYPE_INFO, "Extension with identifier %{private}@ was %{public}@ by Settings", (uint8_t *)&v14, 0x16u);
      }
      [(WBSExtensionsController *)self setExtension:v7 isEnabled:v4 skipSavingToStorage:1];
    }
  }
}

- (void)showPermissionBannerForExtension:(id)a3
{
  id v4 = a3;
  queueOfExtensionsToShowInPermissionBanner = self->_queueOfExtensionsToShowInPermissionBanner;
  id v9 = v4;
  if (!queueOfExtensionsToShowInPermissionBanner)
  {
    id v6 = [MEMORY[0x1E4F1CA70] orderedSet];
    id v7 = self->_queueOfExtensionsToShowInPermissionBanner;
    self->_queueOfExtensionsToShowInPermissionBanner = v6;

    queueOfExtensionsToShowInPermissionBanner = self->_queueOfExtensionsToShowInPermissionBanner;
    id v4 = v9;
  }
  if (([(NSMutableOrderedSet *)queueOfExtensionsToShowInPermissionBanner containsObject:v4] & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->_queueOfExtensionsToShowInPermissionBanner addObject:v9];
    if ([(NSMutableOrderedSet *)self->_queueOfExtensionsToShowInPermissionBanner count] == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]));
      [WeakRetained sfWebExtensionsControllerDidChangeExtensionForPermissionBanner:self];
    }
  }
}

- (void)hidePermissionBannerForExtension:(id)a3
{
  id v6 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_queueOfExtensionsToShowInPermissionBanner, "containsObject:"))
  {
    id v4 = [(SFWebExtensionsController *)self currentExtensionForPermissionBanner];

    [(NSMutableOrderedSet *)self->_queueOfExtensionsToShowInPermissionBanner removeObject:v6];
    if (v4 == v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]));
      [WeakRetained sfWebExtensionsControllerDidChangeExtensionForPermissionBanner:self];
    }
  }
}

- (SFWebExtension)currentExtensionForPermissionBanner
{
  return (SFWebExtension *)[(NSMutableOrderedSet *)self->_queueOfExtensionsToShowInPermissionBanner firstObject];
}

- (void)didViewToolbarItemBadgesInTab:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(WBSExtensionsController *)self enabledExtensions];
  id v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v6;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v6 = [(WBSWebExtensionsController *)self webExtensionForExtension:*(void *)(*((void *)&v12 + 1) + 8 * v9)];

        int v11 = [v6 toolbarItem];
        [v11 didViewBadgeInTab:v4];

        ++v9;
        uint64_t v10 = v6;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v6 _validateToolbarItemInAllWindows];
}

- (void)reportCommandShortcutConflictsIfNecessaryForExtension:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  uint64_t v10 = [(WBSWebExtensionsController *)self commandShortcutConflictsForExtension:v13];
  int v11 = v10;
  if (v10)
  {
    long long v12 = (void *)[v10 mutableCopy];
    [(SFWebExtensionsController *)self _reportCommandShortcutConflictsForExtension:v13 conflicts:v12 presentingViewController:v8 completionHandler:v9];
  }
  else
  {
    v9[2](v9);
  }
}

- (void)_reportCommandShortcutConflictsForExtension:(id)a3 conflicts:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  long long v14 = [v11 firstObject];
  if (v14)
  {
    [v11 removeObjectAtIndex:0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __126__SFWebExtensionsController__reportCommandShortcutConflictsForExtension_conflicts_presentingViewController_completionHandler___block_invoke;
    v17[3] = &unk_1E54EB1E0;
    v17[4] = self;
    id v18 = v10;
    id v19 = v11;
    id v15 = v12;
    id v20 = v15;
    v21 = v13;
    __int16 v16 = [(SFWebExtensionsController *)self _commandShortcutConflictAlertForExtension:v18 conflict:v14 okAction:v17];
    [v15 presentViewController:v16 animated:1 completion:0];
  }
  else
  {
    v13[2](v13);
  }
}

uint64_t __126__SFWebExtensionsController__reportCommandShortcutConflictsForExtension_conflicts_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportCommandShortcutConflictsForExtension:*(void *)(a1 + 40) conflicts:*(void *)(a1 + 48) presentingViewController:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (id)_commandShortcutConflictAlertForExtension:(id)a3 conflict:(id)a4 okAction:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _WBSLocalizedString();
  id v11 = [v7 displayShortName];
  id v12 = [v8 extensionDisplayShortName];
  if ([v11 compare:v12] == 1) {
    [v8 extensionDisplayName];
  }
  else {
  id v13 = [v7 displayName];
  }

  long long v14 = NSString;
  id v15 = _WBSLocalizedString();
  __int16 v16 = [v8 extensionDisplayName];
  uint64_t v17 = [v8 shortcut];
  id v18 = objc_msgSend(v14, "stringWithFormat:", v15, v16, v17, v13);

  id v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v18 preferredStyle:1];
  id v20 = (void *)MEMORY[0x1E4FB1410];
  v21 = _WBSLocalizedString();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__SFWebExtensionsController__commandShortcutConflictAlertForExtension_conflict_okAction___block_invoke;
  v25[3] = &unk_1E54EB208;
  id v22 = v9;
  id v26 = v22;
  id v23 = [v20 actionWithTitle:v21 style:0 handler:v25];
  [v19 addAction:v23];

  return v19;
}

uint64_t __89__SFWebExtensionsController__commandShortcutConflictAlertForExtension_conflict_okAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)recentlyInstalledExtensionCount
{
  BOOL v3 = [(WBSExtensionsController *)self extensions];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = objc_msgSend(v4, "safari_dateForKey:", *MEMORY[0x1E4F98670]);

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __60__SFWebExtensionsController_recentlyInstalledExtensionCount__block_invoke;
  id v13 = &unk_1E54EB230;
  long long v14 = self;
  id v6 = v5;
  id v15 = v6;
  id v7 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", &v10);
  unint64_t v8 = objc_msgSend(v7, "count", v10, v11, v12, v13, v14);

  return v8;
}

BOOL __60__SFWebExtensionsController_recentlyInstalledExtensionCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) extensionIsEnabled:v3])
  {
    BOOL v4 = 0;
  }
  else if (*(void *)(a1 + 40))
  {
    id v5 = [*(id *)(a1 + 32) installationDateForExtension:v3];
    BOOL v4 = [*(id *)(a1 + 40) compare:v5] == -1;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)webExtensionController:(id)a3 presentPopupForAction:(id)a4 forExtensionContext:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [MEMORY[0x1E4F98F98] webExtensionForWebKitExtensionContext:a5];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      id v12 = [v11 toolbarItem];
      id v13 = [v12 popupWebViewInspectionNameForAction:v9];
      [v9 setInspectionName:v13];
    }
    long long v14 = [v9 associatedTab];
    id v15 = [v14 webExtensionWindow];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __112__SFWebExtensionsController_webExtensionController_presentPopupForAction_forExtensionContext_completionHandler___block_invoke;
    v17[3] = &unk_1E54EB258;
    id v18 = v10;
    [WeakRetained sfWebExtensionsController:self showPopupOrPerSitePermissionsForExtension:v11 inWindow:v15 completionHandler:v17];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __112__SFWebExtensionsController_webExtensionController_presentPopupForAction_forExtensionContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (Class)_extensionDataClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)toolbarItemIdealPointSize
{
  return 24;
}

- (void)_createNewTabInWindow:(id)a3 tabIndex:(id)a4 url:(id)a5 makeActive:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v12 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]);
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id WeakRetained = objc_loadWeakRetained(v12);
  [WeakRetained sfWebExtensionsController:self createNewTabInWindow:v16 tabIndex:v15 url:v14 makeActive:v7 completionHandler:v13];
}

- (void)_relateParentTab:(id)a3 toTab:(id)a4
{
  id v6 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]);
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained sfWebExtensionsController:self relateParentTab:v8 toTab:v7];
}

- (id)_findTabInAnyWindowWithID:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]));
  id v6 = [WeakRetained sfWebExtensionsController:self tabWithID:a3];

  return v6;
}

- (void)fireAppropriateTabMovementEventForTabState:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__SFWebExtensionsController_fireAppropriateTabMovementEventForTabState___block_invoke;
  v5[3] = &unk_1E54EB280;
  v5[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
  tabIDToTabPositionForTabsInTransit = self->_tabIDToTabPositionForTabsInTransit;
  self->_tabIDToTabPositionForTabsInTransit = 0;
}

void __72__SFWebExtensionsController_fireAppropriateTabMovementEventForTabState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 336) objectForKeyedSubscript:v16];
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    [v16 doubleValue];
    id v8 = objc_msgSend(v7, "_findTabInAnyWindowWithID:");
    if (v8)
    {
      [v5 windowID];
      double v10 = v9;
      [v6 windowID];
      double v12 = v11;
      uint64_t v13 = [v5 index];
      uint64_t v14 = [v6 index];
      id v15 = *(void **)(a1 + 32);
      if (v10 == v12) {
        [v15 didMoveTab:v8 fromIndex:v14 toIndex:v13];
      }
      else {
        [v15 didMoveTab:v8 fromWindowWithID:v14 indexInOldWindow:v12];
      }
    }
  }
}

- (void)fireOnMovedEventForTabsWithPreviousTabPositions:(id)a3 currentTabsPositions:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__SFWebExtensionsController_fireOnMovedEventForTabsWithPreviousTabPositions_currentTabsPositions___block_invoke;
  v8[3] = &unk_1E54EB2A8;
  id v9 = v6;
  double v10 = self;
  id v7 = v6;
  [a4 enumerateKeysAndObjectsUsingBlock:v8];
}

void __98__SFWebExtensionsController_fireOnMovedEventForTabsWithPreviousTabPositions_currentTabsPositions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  id v7 = *(void **)(a1 + 40);
  [v9 doubleValue];
  id v8 = objc_msgSend(v7, "_findTabInAnyWindowWithID:");
  objc_msgSend(*(id *)(a1 + 40), "didMoveTab:fromIndex:toIndex:", v8, objc_msgSend(v6, "index"), objc_msgSend(v5, "index"));
}

- (void)fireAttachmentEventsForTabsWithPreviousTabPositions:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__SFWebExtensionsController_fireAttachmentEventsForTabsWithPreviousTabPositions___block_invoke;
  v3[3] = &unk_1E54EB280;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __81__SFWebExtensionsController_fireAttachmentEventsForTabsWithPreviousTabPositions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  [v10 doubleValue];
  id v7 = objc_msgSend(v6, "_findTabInAnyWindowWithID:");
  id v8 = *(void **)(a1 + 32);
  [v5 windowID];
  objc_msgSend(v8, "didMoveTab:fromWindowWithID:indexInOldWindow:", v7, objc_msgSend(v5, "index"), v9);
}

- (id)_findWindowWithID:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]));
  id v6 = [WeakRetained sfWebExtensionsController:self windowWithID:a3];

  return v6;
}

- (id)_allWindowsForWebExtension:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]));
  id v6 = [WeakRetained sfWebExtensionsControllerAllWindows:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SFWebExtensionsController__allWindowsForWebExtension___block_invoke;
  v10[3] = &unk_1E54EB2D0;
  id v7 = v4;
  id v11 = v7;
  id v8 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v10);

  return v8;
}

uint64_t __56__SFWebExtensionsController__allWindowsForWebExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPrivate]
    && ([*(id *)(a1 + 32) allowedInPrivateBrowsing] & 1) == 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v4 = [v3 profile];
    id v5 = [*(id *)(a1 + 32) extensionsController];
    id v6 = [v5 profile];
    uint64_t v7 = [v4 isEqual:v6];
  }
  return v7;
}

- (id)lastFocusedWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]));
  id v4 = [WeakRetained sfWebExtensionsControllerLastFocusedWindow:self];

  return v4;
}

- (void)didDeactivateWindow
{
}

- (void)_clearNewTabPreferenceIfNecessaryForRemovedExtensionWithComposedIdentifier:(id)a3
{
  id v9 = a3;
  id v4 = [(id)objc_opt_class() _extensionDefaults];
  id v5 = [(WBSWebExtensionsController *)self tabOverridePreferencesManager];
  id v6 = [v5 extensionComposedIdentifierForNewTabPreferenceInDefaults:v4];
  int v7 = [v6 isEqualToString:v9];

  if (v7)
  {
    id v8 = [(WBSWebExtensionsController *)self tabOverridePreferencesManager];
    [v8 clearNewTabBehaviorInDefaults:v4 fromUserGesture:0];
  }
}

- (void)_showAccessRequestAlertForExtension:(id)a3 domains:(id)a4 callingAPIName:(id)a5 responseBlock:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__SFWebExtensionsController__showAccessRequestAlertForExtension_domains_callingAPIName_responseBlock___block_invoke;
  v12[3] = &unk_1E54EB2F8;
  id v13 = v10;
  id v11 = v10;
  [(SFWebExtensionsController *)self showAccessRequestDialogForExtension:a3 domains:a4 callingAPIName:a5 showMoreOptionsForAlwaysAllow:0 includeDenyButton:1 responseBlock:v12];
}

uint64_t __102__SFWebExtensionsController__showAccessRequestAlertForExtension_domains_callingAPIName_responseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_safariShortVersion
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = objc_msgSend(v2, "safari_shortVersion");

  return v3;
}

- (UIViewController)viewControllerToPresentDialogsFrom
{
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v4 = [v3 keyWindow];
  id WeakRetained = [v4 rootViewController];

  if (WeakRetained)
  {
    while (1)
    {
      id v6 = [WeakRetained presentedViewController];
      if (!v6) {
        break;
      }
      int v7 = [WeakRetained presentedViewController];
      char v8 = [v7 isBeingDismissed];

      if (v8) {
        break;
      }
      uint64_t v9 = [WeakRetained presentedViewController];

      id WeakRetained = (void *)v9;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerToPresentDialogsFrom);
  }

  return (UIViewController *)WeakRetained;
}

- (BOOL)parentalControlsAreEnabledForExtensions
{
  uint64_t v2 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
  if ([v2 isWebFilterEnabled]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 usesAllowedSitesOnly];
  }

  return v3;
}

+ (void)_didDiscoverExtensions:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F98608]];
}

- (id)_deviceUUIDString
{
  uint64_t v2 = +[SFDeviceUtilities deviceUUID];
  BOOL v3 = [v2 UUIDString];

  return v3;
}

- (id)tabGroupManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [WeakRetained sfWebExtensionsControllerTabGroupManager:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)profile
{
  BOOL v3 = [(WBSExtensionsController *)self profileServerID];
  id v4 = [(SFWebExtensionsController *)self tabGroupManager];
  id v5 = [v4 profiles];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__SFWebExtensionsController_profile__block_invoke;
  v9[3] = &unk_1E54EB348;
  id v6 = v3;
  id v10 = v6;
  int v7 = objc_msgSend(v5, "safari_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __36__SFWebExtensionsController_profile__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 identifierForExtensions];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)hasNamedProfiles
{
  uint64_t v2 = [(SFWebExtensionsController *)self tabGroupManager];
  BOOL v3 = [v2 namedProfiles];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)allProfileExtensionsControllers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [WeakRetained sfWebExtensionsControllerAllProfileExtensionsControllers:self];
  }
  else
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)webExtensionsControllerForProfileServerID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [WeakRetained sfWebExtensionsController:self forProfileServerID:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)contentBlockerManagerForProfileServerID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [WeakRetained sfWebExtensionsControllerContentBlockerManager:self forProfileServerID:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSArray)allWebExtensionControllers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  id v4 = [WeakRetained sfWebExtensionsControllersForAllProfiles:self];

  return (NSArray *)v4;
}

- (NSArray)allContentBlockerManagers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  id v4 = [WeakRetained sfWebExtensionsControllersContentBlockerManagersForAllProfiles:self];

  return (NSArray *)v4;
}

- (id)_domainForDefaultSearchProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F98FE0]));
  id v4 = [WeakRetained sfWebExtensionsControllerDomainForDefaultSearchProvider:self];

  return v4;
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);

  return (_SFNavigationIntentHandling *)WeakRetained;
}

- (void)setTabIDToTabPositionForTabsInTransit:(id)a3
{
}

- (WKContentRuleListStore)contentBlockerStore
{
  return self->_contentBlockerStore;
}

- (SFWebExtensionControllerProfileDelegate)profileDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);

  return (SFWebExtensionControllerProfileDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profileDelegate);
  objc_storeStrong((id *)&self->_tabIDToTabPositionForTabsInTransit, 0);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_storeStrong((id *)&self->_applicationNameForUserAgent, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_contentBlockerStore, 0);
  objc_destroyWeak((id *)&self->_viewControllerToPresentDialogsFrom);
  objc_storeStrong((id *)&self->_blocklistQueue, 0);
  objc_storeStrong((id *)&self->_stubUnsupportedAPIsUserDefaultObserver, 0);
  objc_storeStrong((id *)&self->_queueOfExtensionsToShowInPermissionBanner, 0);

  objc_storeStrong((id *)&self->_dialogController, 0);
}

void __78__SFWebExtensionsController__isExtensionBlockedByBlocklist_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138478083;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Parent app for web extension with identifier %{private}@ is not a trusted app. %@", (uint8_t *)&v4, 0x16u);
}

- (void)_extensionWithComposedIdentifier:(uint8_t *)buf wasEnabledOrDisabledByExtensionSettings:(os_log_t)log .cold.1(void *a1, char a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = @"disabled";
  if (a2) {
    uint64_t v5 = @"enabled";
  }
  *(_DWORD *)buf = 138478083;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_18C354000, log, OS_LOG_TYPE_DEBUG, "Extension with identifier %{private}@ was %{public}@ by Settings, but is already in that state", buf, 0x16u);
}

- (void)_developerIdentifierForExtension:(uint8_t *)buf untrustedCodeSigningDictionary:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Developer identifier for extension with identifier %{private}@ couldn't be determined because LSApplicationExtensionRecord couldn't be allocated: error %{public}@", buf, 0x16u);
}

- (void)_developerIdentifierForExtension:(os_log_t)log untrustedCodeSigningDictionary:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Developer identifier for extension with identifier %{private}@ couldn't be determined because extension isn't in an app bundle", buf, 0xCu);
}

@end