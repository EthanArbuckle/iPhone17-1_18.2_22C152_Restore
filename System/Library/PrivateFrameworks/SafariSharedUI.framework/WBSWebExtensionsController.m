@interface WBSWebExtensionsController
+ (double)pendingSiteAccessTimeoutInterval;
+ (id)_commandShortcutConflictsForExtension:(id)a3 sortedWebExtensions:(id)a4;
+ (id)_composedIdentifierForStateOfExtensionWithBundleIdentifier:(id)a3 developerIdentifier:(id)a4;
+ (id)_extensionPointIdentifier;
+ (id)_firstConflctForCommand:(id)a3 inSortedWebExtensions:(id)a4;
+ (id)extensionURLScheme;
- (BOOL)_extensionShouldBeAutomaticallyEnabled:(id)a3;
- (BOOL)_extensionShouldBeEnabled:(id)a3;
- (BOOL)_shouldDisableExtensionIfAdditionalPermissionsAreRequired:(id)a3 previousExtensionState:(id)a4;
- (BOOL)anyWebExtensionContentBlockerEnabled;
- (BOOL)commandName:(id)a3 isActionForExtension:(id)a4;
- (BOOL)extensionIsEnabled:(id)a3;
- (BOOL)hasNamedProfiles;
- (BOOL)isTab:(id)a3 visibleToExtension:(id)a4;
- (BOOL)isWindow:(id)a3 visibleToExtension:(id)a4;
- (BOOL)showOptionsForExtension:(id)a3 requestingWebView:(id)a4;
- (BOOL)test_isRunningExtensionTestMode;
- (NSString)profileName;
- (WBSCoreAnalyticsExtensionsStatistics)extensionStatisticsReport;
- (WBSWebExtensionNewTabOverridePreferencesManager)tabOverridePreferencesManager;
- (WBSWebExtensionWindow)lastFocusedWindow;
- (WBSWebExtensionsController)initWithProfileServerID:(id)a3 userContentController:(id)a4;
- (WBTabGroupManager)tabGroupManager;
- (WKWebExtensionController)webKitController;
- (id)_allWindowsForWebExtension:(id)a3;
- (id)_deviceUUIDString;
- (id)_discoverabilityTitleForCommand:(id)a3 webExtension:(id)a4;
- (id)_displayNameForExtension:(id)a3;
- (id)_displayShortNameForExtension:(id)a3;
- (id)_displayVersionForExtension:(id)a3;
- (id)_domainForDefaultSearchProvider;
- (id)_enabledWebExtensionsSortedByDisplayShortName;
- (id)_extensionURLToLoadFromPersistentStateURL:(id)a3;
- (id)_filteredOriginsRemovingAllHostsPatterns:(id)a3 containedAllHostsPattern:(BOOL *)a4;
- (id)_findWindowWithID:(double)a3;
- (id)_persistentStateURLForExtensionURL:(id)a3;
- (id)_safariShortVersion;
- (id)_updatedExtensionStateForCurrentPermissions:(id)a3 previousExtensionState:(id)a4;
- (id)_urlForExtensionSettings;
- (id)_urlForWebKitExtensionsDirectory;
- (id)_versionNumberForExtension:(id)a3;
- (id)_webViewConfiguration;
- (id)canonicalURLForWebExtensionURL:(id)a3;
- (id)commandShortcutConflictsForExtension:(id)a3;
- (id)composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions;
- (id)enabledExtensionsWithPrivateBrowsingEnabled:(BOOL)a3;
- (id)extensionStateKeysToCopy;
- (id)installationDateForExtension:(id)a3;
- (id)lastSeenUniqueIdentiferForWebExtension:(id)a3;
- (id)webExtensionController:(id)a3 focusedWindowForExtensionContext:(id)a4;
- (id)webExtensionController:(id)a3 openWindowsForExtensionContext:(id)a4;
- (id)webExtensionForBaseURIHost:(id)a3;
- (id)webExtensionForBundleIdentifier:(id)a3;
- (id)webExtensionForComposedIdentifier:(id)a3;
- (id)webExtensionForExtension:(id)a3;
- (id)webExtensionForExtensionIdentifier:(id)a3;
- (id)webExtensionForURL:(id)a3;
- (id)webExtensionKeyCommands;
- (unint64_t)toolbarItemIdealPointSize;
- (void)_applyManagedExtensionPermissionsForWebExtension:(id)a3;
- (void)_createNewTabInWindow:(id)a3 tabIndex:(id)a4 url:(id)a5 makeActive:(BOOL)a6 completionHandler:(id)a7;
- (void)_deleteStateForExtensionWithComposedIdentifier:(id)a3;
- (void)_deleteStorageForExtensionWithComposedIdentifier:(id)a3;
- (void)_finishedLoadingExtensions;
- (void)_grantRequestedPermissionsIfNecessaryForExtension:(id)a3;
- (void)_loadEnabledExtension:(id)a3;
- (void)_loadPermissionsFromStorageForWebExtension:(id)a3 completionHandler:(id)a4;
- (void)_permissionsMayHaveBeenChangedExternallyForExtension:(id)a3 previousExtensionState:(id)a4;
- (void)_savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:(id)a3 permissionsWereUpdatedDueToAnExternalChange:(BOOL)a4;
- (void)_savePermissionsToStorageForWebExtension:(id)a3;
- (void)_savePermissionsToStorageIfNecessaryAndPostDidChangeNotificationForWebExtension:(id)a3;
- (void)_showAccessRequestAlertForExtension:(id)a3 domains:(id)a4 callingAPIName:(id)a5 responseBlock:(id)a6;
- (void)_unloadPreviouslyEnabledExtension:(id)a3;
- (void)_updateExtensionNewTabPageIfNecessary;
- (void)_updateExtensionStateIfPermissionsIncreased:(id)a3;
- (void)_updateExtensionStateIfThisVersionOfSafariIsNotSupported:(id)a3;
- (void)_updateManagedPrivateBrowsingStateForAllExtensions;
- (void)_updateManagedWebsiteAccessForAllExtensions;
- (void)_webExtensionDataPermissionsWereGranted:(id)a3;
- (void)_webExtensionDataPermissionsWereRevokedOrRemoved:(id)a3;
- (void)_webExtensionEnabledStateInPrivateBrowsingChanged:(id)a3;
- (void)clearPermissionStateUsedToDetermineIfExtensionShouldBeDisabledOnUpgradeForExtension:(id)a3;
- (void)didActivateWindow:(id)a3;
- (void)didCloseTab:(id)a3 windowIsClosing:(BOOL)a4;
- (void)didMoveTab:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)didMoveTab:(id)a3 fromWindowWithID:(double)a4 indexInOldWindow:(unint64_t)a5;
- (void)didOpenTab:(id)a3;
- (void)didOpenWindow:(id)a3;
- (void)didReplaceTab:(id)a3 newTab:(id)a4;
- (void)didSelectTab:(id)a3 previousTab:(id)a4;
- (void)fireOnUpdatedEventForTab:(id)a3 withChangedProperties:(unint64_t)a4;
- (void)initializeWebKitControllerIfNeededFromSettings:(BOOL)a3;
- (void)loadPermissionsIfNecessaryForExtension:(id)a3;
- (void)loadSuitableDiscoveredExtensions;
- (void)performCommandForKeyCommand:(id)a3;
- (void)removeOldExtensionStateForExtension:(id)a3;
- (void)savePermissionStateUsedToDetermineIfExtensionShouldBeDisabledOnUpgradeForWebExtension:(id)a3;
- (void)saveUniqueIdentifierToStorageForWebExtension:(id)a3;
- (void)sendMessage:(id)a3 toApplicationWithID:(id)a4 fromExtensionWithIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 dueToUserGesture:(BOOL)a5 skipSavingToStorage:(BOOL)a6;
- (void)webExtensionController:(id)a3 connectUsingMessagePort:(id)a4 forExtensionContext:(id)a5 completionHandler:(id)a6;
- (void)webExtensionController:(id)a3 openNewTabUsingConfiguration:(id)a4 forExtensionContext:(id)a5 completionHandler:(id)a6;
- (void)webExtensionController:(id)a3 promptForPermissionMatchPatterns:(id)a4 inTab:(id)a5 forExtensionContext:(id)a6 completionHandler:(id)a7;
- (void)webExtensionController:(id)a3 promptForPermissionToAccessURLs:(id)a4 inTab:(id)a5 forExtensionContext:(id)a6 completionHandler:(id)a7;
- (void)webExtensionController:(id)a3 promptForPermissions:(id)a4 inTab:(id)a5 forExtensionContext:(id)a6 completionHandler:(id)a7;
- (void)webExtensionController:(id)a3 sendMessage:(id)a4 toApplicationWithIdentifier:(id)a5 forExtensionContext:(id)a6 replyHandler:(id)a7;
@end

@implementation WBSWebExtensionsController

- (WBSWebExtensionNewTabOverridePreferencesManager)tabOverridePreferencesManager
{
  return self->_tabOverridePreferencesManager;
}

- (BOOL)extensionIsEnabled:(id)a3
{
  id v4 = a3;
  v5 = [(WBSWebExtensionsController *)self webExtensionForExtension:v4];
  char v6 = [v5 canLoad];

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)WBSWebExtensionsController;
    BOOL v7 = [(WBSExtensionsController *)&v9 extensionIsEnabled:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)webExtensionForComposedIdentifier:(id)a3
{
  id v4 = [(WBSExtensionsController *)self extensionWithComposedIdentifier:a3];
  v5 = [(WBSWebExtensionsController *)self webExtensionForExtension:v4];

  return v5;
}

- (id)webExtensionForExtension:(id)a3
{
  v3 = [(WBSExtensionsController *)self extensionDataForExtension:a3];
  return v3;
}

- (void)didOpenWindow:(id)a3
{
}

- (WKWebExtensionController)webKitController
{
  return self->_webKitController;
}

- (void)didActivateWindow:(id)a3
{
}

- (id)composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions
{
  return (id)[(NSMutableSet *)self->_migratedWebNavigationExtensionIdentifiers allObjects];
}

- (WBSWebExtensionsController)initWithProfileServerID:(id)a3 userContentController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSWebExtensionsController;
  v8 = [(WBSExtensionsController *)&v17 initWithProfileServerID:v6 userContentController:v7];
  if (v8)
  {
    if (-[WBSWebExtensionsController initWithProfileServerID:userContentController:]::once != -1) {
      dispatch_once(&-[WBSWebExtensionsController initWithProfileServerID:userContentController:]::once, &__block_literal_global_65);
    }
    objc_super v9 = [[WBSWebExtensionNewTabOverridePreferencesManager alloc] initWithExtensionsController:v8];
    tabOverridePreferencesManager = v8->_tabOverridePreferencesManager;
    v8->_tabOverridePreferencesManager = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    extensionIdentifierToData = v8->_extensionIdentifierToData;
    v8->_extensionIdentifierToData = (NSMutableDictionary *)v11;

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v8 selector:sel__webExtensionDataPermissionsWereGranted_ name:@"webExtensionPermissionsWereGranted" object:0];
    [v13 addObserver:v8 selector:sel__webExtensionDataPermissionsWereRevokedOrRemoved_ name:@"webExtensionPermissionsWereRevoked" object:0];
    [v13 addObserver:v8 selector:sel__webExtensionDataPermissionsWereRevokedOrRemoved_ name:@"webExtensionGrantedPermissionsWereRemoved" object:0];
    [v13 addObserver:v8 selector:sel__webExtensionDataPermissionsWereRevokedOrRemoved_ name:@"webExtensionRevokedPermissionsWereRemoved" object:0];
    v14 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v14 addObserver:v8 selector:sel__webExtensionEnabledStateInPrivateBrowsingChanged_ name:*MEMORY[0x1E4F98908] object:0];
    v15 = v8;
  }
  return v8;
}

uint64_t __76__WBSWebExtensionsController_initWithProfileServerID_userContentController___block_invoke()
{
  return [MEMORY[0x1E4F466D0] registerCustomURLScheme:*MEMORY[0x1E4F98910]];
}

+ (id)_composedIdentifierForStateOfExtensionWithBundleIdentifier:(id)a3 developerIdentifier:(id)a4
{
  id v4 = @"UNSIGNED";
  if (a4) {
    id v4 = (__CFString *)a4;
  }
  v5 = [NSString stringWithFormat:@"%@ (%@)", a3, v4];
  return v5;
}

- (void)initializeWebKitControllerIfNeededFromSettings:(BOOL)a3
{
  if (!self->_webKitController)
  {
    id v14 = [MEMORY[0x1E4F466C8] defaultConfiguration];
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    id v6 = [(WBSExtensionsController *)self profileServerID];
    id v7 = (void *)[v5 initWithUUIDString:v6];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F466C8] configurationWithIdentifier:v7];

      id v14 = (id)v8;
    }

    if (a3)
    {
      objc_super v9 = [(WBSWebExtensionsController *)self _urlForWebKitExtensionsDirectory];
      v10 = [v9 path];
      [v14 _setStorageDirectoryPath:v10];
    }
    else
    {
      objc_super v9 = [(WBSWebExtensionsController *)self _webViewConfiguration];
      [v14 setWebViewConfiguration:v9];
    }

    uint64_t v11 = (WKWebExtensionController *)[objc_alloc(MEMORY[0x1E4F466C0]) initWithConfiguration:v14];
    webKitController = self->_webKitController;
    self->_webKitController = v11;

    [(WKWebExtensionController *)self->_webKitController setDelegate:self];
    v13 = [(id)objc_opt_class() _extensionDefaults];
    -[WKWebExtensionController _setTestingMode:](self->_webKitController, "_setTestingMode:", [v13 BOOLForKey:*MEMORY[0x1E4F984A0]]);
  }
}

+ (id)_extensionPointIdentifier
{
  return @"com.apple.Safari.web-extension";
}

- (void)fireOnUpdatedEventForTab:(id)a3 withChangedProperties:(unint64_t)a4
{
}

+ (id)extensionURLScheme
{
  return (id)*MEMORY[0x1E4F98910];
}

- (id)extensionStateKeysToCopy
{
  v7[8] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)WBSWebExtensionsController;
  v2 = [(WBSExtensionsController *)&v6 extensionStateKeysToCopy];
  v7[0] = @"AccessibleOrigins";
  v7[1] = @"GrantedPermissions";
  v7[2] = @"Permissions";
  v7[3] = @"RevokedPermissions";
  v7[4] = @"GrantedPermissionOrigins";
  v7[5] = @"LastSeenVersion";
  v7[6] = @"RequestedOptionalAccessToAllHosts";
  v7[7] = @"RevokedPermissionOrigins";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:8];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)_urlForExtensionSettings
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(WBSExtensionsController *)self profileServerID];
  BOOL v5 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v4];

  if (v5
    || ([(WBSExtensionsController *)self profileServerID],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "safari_profileDirectoryURLWithID:createIfNeeded:", v6, 0),
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    settingsFileURL = self->_settingsFileURL;
    if (!settingsFileURL)
    {
      objc_super v9 = objc_msgSend(v3, "safari_webExtensionsSettingsDirectoryURL");
      if (!v5)
      {
        v10 = [(WBSExtensionsController *)self profileServerID];
        uint64_t v11 = objc_msgSend(v3, "safari_profileDirectoryURLWithID:createIfNeeded:", v10, 0);
        uint64_t v12 = [v11 URLByAppendingPathComponent:@"WebExtensions" isDirectory:1];

        if (v12)
        {
          objc_super v9 = (void *)v12;
          id v13 = (id)objc_msgSend(v3, "safari_ensureDirectoryExists:", v12);
        }
        else
        {
          objc_super v9 = 0;
        }
      }
      v16 = [v9 URLByAppendingPathComponent:@"Extensions.plist" isDirectory:0];
      objc_super v17 = self->_settingsFileURL;
      self->_settingsFileURL = v16;

      settingsFileURL = self->_settingsFileURL;
    }
    v15 = settingsFileURL;
  }
  else
  {
    id v14 = self->_settingsFileURL;
    self->_settingsFileURL = 0;

    v15 = 0;
  }

  return v15;
}

- (id)_urlForWebKitExtensionsDirectory
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = [(WBSExtensionsController *)self profile];
  char v4 = [v3 isDefault];

  if (v4)
  {
    BOOL v5 = @"Default";
  }
  else
  {
    BOOL v5 = [(WBSExtensionsController *)self profileServerID];
  }
  objc_super v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = objc_msgSend(v6, "safari_settingsDirectoryURL");

  uint64_t v8 = [v7 URLByDeletingLastPathComponent];
  objc_super v9 = NSString;
  v14[0] = @"WebKit";
  v14[1] = @"WebExtensions";
  v14[2] = v5;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  uint64_t v11 = [v9 pathWithComponents:v10];
  uint64_t v12 = [v8 URLByAppendingPathComponent:v11 isDirectory:1];

  return v12;
}

- (id)_displayNameForExtension:(id)a3
{
  v3 = [(WBSWebExtensionsController *)self webExtensionForExtension:a3];
  char v4 = [v3 displayName];

  return v4;
}

- (id)_displayShortNameForExtension:(id)a3
{
  v3 = [(WBSWebExtensionsController *)self webExtensionForExtension:a3];
  char v4 = [v3 displayShortName];

  return v4;
}

- (id)_displayVersionForExtension:(id)a3
{
  v3 = [(WBSWebExtensionsController *)self webExtensionForExtension:a3];
  char v4 = [v3 displayVersion];

  return v4;
}

- (id)_versionNumberForExtension:(id)a3
{
  v3 = [(WBSWebExtensionsController *)self webExtensionForExtension:a3];
  char v4 = [v3 version];

  return v4;
}

- (void)loadSuitableDiscoveredExtensions
{
  v2.receiver = self;
  v2.super_class = (Class)WBSWebExtensionsController;
  [(WBSExtensionsController *)&v2 loadSuitableDiscoveredExtensions];
}

- (void)_loadEnabledExtension:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSWebExtensionsController *)self webExtensionForExtension:v4];
  [(WBSWebExtensionsController *)self _loadPermissionsFromStorageForWebExtension:v5 completionHandler:&__block_literal_global_118_0];
  [v5 load];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WBSWebExtensionsController__loadEnabledExtension___block_invoke_2;
  v7[3] = &unk_1E5E407D0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __52__WBSWebExtensionsController__loadEnabledExtension___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) composedIdentifier];
  objc_msgSend(v1, "_postExtensionWasEnabledRemotelyNotificationIfNecessary:");
}

- (void)_updateExtensionNewTabPageIfNecessary
{
  id v2 = +[WBSCloudExtensionStateManager sharedManager];
  [v2 updateNewTabPageFromCloudDeviceState];
}

- (void)_unloadPreviouslyEnabledExtension:(id)a3
{
  id v3 = [(WBSWebExtensionsController *)self webExtensionForExtension:a3];
  [v3 unload];
}

- (id)enabledExtensionsWithPrivateBrowsingEnabled:(BOOL)a3
{
  BOOL v5 = [(WBSExtensionsController *)self enabledExtensions];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__WBSWebExtensionsController_enabledExtensionsWithPrivateBrowsingEnabled___block_invoke;
  v8[3] = &unk_1E5E468D0;
  v8[4] = self;
  BOOL v9 = a3;
  id v6 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v8);

  return v6;
}

BOOL __74__WBSWebExtensionsController_enabledExtensionsWithPrivateBrowsingEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) webExtensionForExtension:a2];
  BOOL v4 = ([v3 allowedInPrivateBrowsing] & 1) != 0 || !*(unsigned char *)(a1 + 40);

  return v4;
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 dueToUserGesture:(BOOL)a5 skipSavingToStorage:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  if (v8)
  {
    uint64_t v11 = [(WBSWebExtensionsController *)self webExtensionForExtension:v10];
    if (([v11 canLoad] & 1) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    [(WBSWebExtensionsController *)self clearPermissionStateUsedToDetermineIfExtensionShouldBeDisabledOnUpgradeForExtension:v10];
  }
  v12.receiver = self;
  v12.super_class = (Class)WBSWebExtensionsController;
  [(WBSExtensionsController *)&v12 setExtension:v10 isEnabled:v8 dueToUserGesture:v7 skipSavingToStorage:v6];
LABEL_6:
}

- (void)removeOldExtensionStateForExtension:(id)a3
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(WBSExtensionsController *)self _extensionStateForExtension:v4];
  BOOL v6 = (void *)[v5 mutableCopy];

  if ([v6 count])
  {
    v19[0] = @"LastSeenBaseURI";
    v19[1] = @"LastSeenVersion";
    v19[2] = @"BackgroundPageListeners";
    v19[3] = @"BackgroundPageListenersVersion";
    v19[4] = @"DeclarativeNetRequestRulesetState";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    BOOL v9 = v7;
    if (v8)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          BOOL v13 = v12 == 0;

          if (!v13)
          {

            [v6 removeObjectsForKeys:v7];
            BOOL v9 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v4];
            [(WBSExtensionsController *)self _setExtensionIdentifierToStateMap:v6 forExtensionWithComposedIdentifier:v9];
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      BOOL v9 = v7;
    }
LABEL_12:
  }
}

- (BOOL)_extensionShouldBeEnabled:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSWebExtensionsController *)self webExtensionForExtension:v4];
  char v6 = [v5 canLoad];

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)WBSWebExtensionsController;
    BOOL v7 = [(WBSExtensionsController *)&v9 _extensionShouldBeEnabled:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_extensionShouldBeAutomaticallyEnabled:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v4];
  char v6 = +[WBSCloudExtensionStateManager sharedManager];
  BOOL v7 = [(WBSExtensionsController *)self profileServerID];
  char v8 = [v6 isExtensionEnabledInCloudWithComposedIdentifier:v5 forProfileServerID:v7];

  if (v8)
  {
    objc_super v9 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558275;
      uint64_t v17 = 1752392040;
      __int16 v18 = 2117;
      v19 = v5;
      _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_INFO, "Automatically enabling extension %{sensitive, mask.hash}@ on download since it's on in the cloud", buf, 0x16u);
    }
    uint64_t v10 = *MEMORY[0x1E4F98800];
    v15[0] = MEMORY[0x1E4F1CC38];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "now", v10, *MEMORY[0x1E4F98820]);
    v14[2] = *MEMORY[0x1E4F987F8];
    v15[1] = v11;
    v15[2] = MEMORY[0x1E4F1CC28];
    objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

    [(WBSExtensionsController *)self _setExtensionIdentifierToStateMap:v12 forExtensionWithComposedIdentifier:v5];
  }

  return v8;
}

- (id)_updatedExtensionStateForCurrentPermissions:(id)a3 previousExtensionState:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(WBSWebExtensionsController *)self webExtensionForExtension:a3];
  objc_msgSend(v7, "setRequestedOptionalAccessToAllHosts:", objc_msgSend(v6, "safari_BOOLForKey:", @"RequestedOptionalAccessToAllHosts"));
  char v8 = [v7 extensionStateWithPreviousState:v6];

  return v8;
}

- (void)_updateExtensionStateIfThisVersionOfSafariIsNotSupported:(id)a3
{
  id v14 = a3;
  id v4 = -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:");
  BOOL v5 = [(NSMutableDictionary *)self->super._extensionIdentifierToStateMap objectForKeyedSubscript:v4];
  id v6 = (void *)[v5 mutableCopy];

  if (objc_msgSend(v6, "safari_BOOLForKey:", *MEMORY[0x1E4F98800]))
  {
    BOOL v7 = [(WBSWebExtensionsController *)self webExtensionForExtension:v14];
    switch([v7 extensionSupportsCurrentSafariVersion])
    {
      case 0:
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
        objc_super v9 = NSString;
        uint64_t v10 = _WBSLocalizedString();
        uint64_t v11 = [(WBSWebExtensionsController *)self _displayNameForExtension:v14];
        char v8 = objc_msgSend(v9, "stringWithFormat:", v10, v11);

        goto LABEL_5;
      default:
        char v8 = 0;
LABEL_5:
        [(WBSExtensionsController *)self setExtension:v14 isEnabled:0];
        objc_super v12 = objc_msgSend(v14, "sf_uniqueIdentifier");
        BOOL v13 = [v12 UUIDString];
        [(WBSWebExtensionsController *)self _showPromptForExtensionDisabledBecauseItDoesNotSupportThisVersionOfSafariWithMessage:v8 extensionIdentifier:v13];

        break;
    }
  }
}

- (id)webExtensionForExtensionIdentifier:(id)a3
{
  id v4 = [(WBSExtensionsController *)self extensionWithUUID:a3];
  BOOL v5 = [(WBSWebExtensionsController *)self webExtensionForExtension:v4];

  return v5;
}

- (id)webExtensionForBundleIdentifier:(id)a3
{
  id v4 = [(WBSExtensionsController *)self extensionWithBundleIdentifier:a3];
  BOOL v5 = [(WBSWebExtensionsController *)self webExtensionForExtension:v4];

  return v5;
}

- (id)webExtensionForBaseURIHost:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->super._baseURIHostToExtensionIdentifier objectForKeyedSubscript:v5];
    BOOL v7 = [(WBSWebExtensionsController *)self webExtensionForExtensionIdentifier:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)webExtensionForURL:(id)a3
{
  id v4 = [(WBSWebExtensionsController *)self canonicalURLForWebExtensionURL:a3];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 host];
    BOOL v7 = [(WBSWebExtensionsController *)self webExtensionForBaseURIHost:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)canonicalURLForWebExtensionURL:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "safari_isSafariWebExtensionURL"))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    id v6 = [v4 host];
    BOOL v7 = (void *)[v5 initWithUUIDString:v6];

    if (v7)
    {
      char v8 = [v4 host];
      objc_super v9 = [(WBSWebExtensionsController *)self webExtensionForBaseURIHost:v8];
      if (v9) {
        uint64_t v10 = v4;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = [(WBSWebExtensionsController *)self _extensionURLToLoadFromPersistentStateURL:v4];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)installationDateForExtension:(id)a3
{
  id v3 = [(WBSExtensionsController *)self _extensionStateForExtension:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F98530]];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)test_isRunningExtensionTestMode
{
  return 0;
}

- (void)sendMessage:(id)a3 toApplicationWithID:(id)a4 fromExtensionWithIdentifier:(id)a5 completionHandler:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(WBSWebExtensionsController *)self webExtensionForExtensionIdentifier:v9];
  objc_super v12 = v11;
  if (v11)
  {
    v32 = [v11 composedIdentifier];
    {
      BOOL v13 = (void *)-[WBSWebExtensionsController sendMessage:toApplicationWithID:fromExtensionWithIdentifier:completionHandler:]::nativeMessagingActiveContextTracker;
    }
    else
    {
      BOOL v13 = [MEMORY[0x1E4F1CA60] dictionary];
      -[WBSWebExtensionsController sendMessage:toApplicationWithID:fromExtensionWithIdentifier:completionHandler:]::nativeMessagingActiveContextTracker = (uint64_t)v13;
    }
    id v14 = [v13 objectForKeyedSubscript:v32];
    if (v14)
    {
      long long v15 = [MEMORY[0x1E4F1C9C8] now];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke;
      v49[3] = &unk_1E5E468F8;
      id v50 = v15;
      id v16 = v15;
      objc_msgSend(v14, "safari_removeObjectsPassingTest:", v49);
    }
    else
    {
      id v14 = [MEMORY[0x1E4F1CA48] array];
      objc_msgSend((id)-[WBSWebExtensionsController sendMessage:toApplicationWithID:fromExtensionWithIdentifier:completionHandler:]::nativeMessagingActiveContextTracker, "setObject:forKeyedSubscript:");
    }
    if ((unint64_t)[v14 count] < 0x97)
    {
      v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
      [v14 addObject:v19];

      __int16 v18 = [v12 extension];
      if (!self->_nativeRequestIdentifiersToCompletionHandlers)
      {
        uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
        nativeRequestIdentifiersToCompletionHandlers = self->_nativeRequestIdentifiersToCompletionHandlers;
        self->_nativeRequestIdentifiersToCompletionHandlers = v20;
      }
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v18);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_141;
      v46[3] = &unk_1E5E46920;
      objc_copyWeak(&v47, (id *)buf);
      v22 = (void *)MEMORY[0x1AD115160](v46);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_2;
      v44[3] = &unk_1E5E46948;
      id v23 = v22;
      id v45 = v23;
      [v18 setRequestCancellationBlock:v44];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_4;
      v41[3] = &unk_1E5E46970;
      id v24 = v23;
      id v42 = v24;
      objc_copyWeak(&v43, &location);
      [v18 setRequestInterruptionBlock:v41];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_6;
      v39[3] = &unk_1E5E46998;
      id v25 = v24;
      id v40 = v25;
      [v18 setRequestCompletionBlock:v39];
      id v26 = objc_alloc_init(MEMORY[0x1E4F28C80]);
      uint64_t v27 = [v12 privacyPreservingProfileIdentifier];
      v28 = (void *)v27;
      if (v27)
      {
        v54[0] = @"message";
        v54[1] = @"profile";
        v55[0] = v33;
        v55[1] = v27;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
      }
      else
      {
        v52 = @"message";
        id v53 = v33;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      v29 = };
      [v26 setUserInfo:v29];

      id v51 = v26;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_8;
      v34[3] = &unk_1E5E469E8;
      objc_copyWeak(&v37, (id *)buf);
      objc_copyWeak(&v38, &location);
      id v35 = v10;
      id v31 = v25;
      id v36 = v31;
      [v18 beginExtensionRequestWithInputItems:v30 completion:v34];

      objc_destroyWeak(&v38);
      objc_destroyWeak(&v37);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v17 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v57 = v32;
        _os_log_impl(&dword_1ABB70000, v17, OS_LOG_TYPE_INFO, "Dropping native message from %{private}@ due to too many active native messages", buf, 0xCu);
      }
      __int16 v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFErrorDomain" code:3 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

uint64_t __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_isEarlierThanDate:", *(void *)(a1 + 32));
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_141(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained[28] objectForKeyedSubscript:v12];
    if (v11)
    {
      [v10[28] setObject:0 forKeyedSubscript:v12];
      ((void (**)(void, id, id))v11)[2](v11, v7, v8);
    }
  }
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_1E5E40FC8;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_5;
  id v10 = &unk_1E5E410B8;
  id v12 = *(id *)(a1 + 32);
  id v4 = v3;
  id v11 = v4;
  dispatch_async(MEMORY[0x1E4F14428], &v7);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "cancelExtensionRequestWithIdentifier:", v4, v7, v8, v9, v10);
  }
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_7;
  block[3] = &unk_1E5E40FC8;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) firstObject];
  id v3 = [v5 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"message"];
  (*(void (**)(uint64_t, uint64_t, void *, void))(v2 + 16))(v2, v1, v4, 0);
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_9;
  v10[3] = &unk_1E5E469C0;
  objc_copyWeak(&v15, a1 + 6);
  objc_copyWeak(&v16, a1 + 7);
  id v11 = v5;
  id v7 = a1[4];
  id v12 = v6;
  id v13 = v7;
  id v14 = a1[5];
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_9(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 72));
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      if (*(void *)(a1 + 32))
      {
        id v5 = (void *)MEMORY[0x1AD115160](v4);
        [v6[28] setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];

        if (*(void *)(a1 + 40))
        {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          [v3 cancelExtensionRequestWithIdentifier:*(void *)(a1 + 32)];
        }
      }
      else
      {
        (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, *(void *)(a1 + 40));
      }
    }

    id WeakRetained = v6;
  }
}

- (id)lastSeenUniqueIdentiferForWebExtension:(id)a3
{
  uint64_t v4 = [a3 extension];
  id v5 = [(WBSExtensionsController *)self _extensionStateForExtension:v4];
  id v6 = objc_msgSend(v5, "safari_stringForKey:", @"LastSeenUniqueIdentifier");

  return v6;
}

- (void)saveUniqueIdentifierToStorageForWebExtension:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [v16 extension];
  id v5 = [(WBSExtensionsController *)self _extensionStateForExtension:v4];
  id v6 = (void *)[v5 mutableCopy];

  if (v6)
  {
    id v7 = objc_msgSend(v6, "safari_stringForKey:", @"LastSeenUniqueIdentifier");
    id v8 = [v16 extension];
    id v9 = objc_msgSend(v8, "sf_uniqueIdentifier");
    id v10 = [v9 UUIDString];
    char v11 = [v7 isEqual:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = [v16 extension];
      id v13 = objc_msgSend(v12, "sf_uniqueIdentifier");
      id v14 = [v13 UUIDString];
      [v6 setObject:v14 forKeyedSubscript:@"LastSeenUniqueIdentifier"];

      id v15 = [v16 extension];
      [(WBSExtensionsController *)self _setExtensionState:v6 forExtension:v15];
    }
  }
}

- (void)savePermissionStateUsedToDetermineIfExtensionShouldBeDisabledOnUpgradeForWebExtension:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [v15 extension];
  id v5 = [(WBSExtensionsController *)self _extensionStateForExtension:v4];
  id v6 = (void *)[v5 mutableCopy];

  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F98808];
    int v8 = objc_msgSend(v6, "safari_BOOLForKey:", *MEMORY[0x1E4F98808]);
    int v9 = [v15 hasAbilityToInjectContentIntoWebpages];
    id v10 = (void *)MEMORY[0x1E4F98840];
    if (v8 != v9
      || (int v11 = objc_msgSend(v6, "safari_BOOLForKey:", *MEMORY[0x1E4F98840]),
          v11 != [v15 hasDeclarativeNetRequestHostAccessPermission]))
    {
      id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "hasAbilityToInjectContentIntoWebpages"));
      [v6 setObject:v12 forKeyedSubscript:v7];

      id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "hasDeclarativeNetRequestHostAccessPermission"));
      [v6 setObject:v13 forKeyedSubscript:*v10];

      id v14 = [v15 extension];
      [(WBSExtensionsController *)self _setExtensionState:v6 forExtension:v14];
    }
  }
}

- (void)clearPermissionStateUsedToDetermineIfExtensionShouldBeDisabledOnUpgradeForExtension:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:");
  id v5 = (void *)[v4 mutableCopy];

  if (v5)
  {
    [v5 removeObjectForKey:*MEMORY[0x1E4F98808]];
    [v5 removeObjectForKey:*MEMORY[0x1E4F98840]];
    [(WBSExtensionsController *)self _setExtensionState:v5 forExtension:v6];
  }
}

- (unint64_t)toolbarItemIdealPointSize
{
  return 0;
}

- (void)_deleteStateForExtensionWithComposedIdentifier:(id)a3
{
  id v4 = a3;
  -[WBSWebExtensionsController _deleteStorageForExtensionWithComposedIdentifier:](self, "_deleteStorageForExtensionWithComposedIdentifier:");
  [(WBSWebExtensionsController *)self _clearNewTabPreferenceIfNecessaryForRemovedExtensionWithComposedIdentifier:v4];
}

- (void)_deleteStorageForExtensionWithComposedIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v6 = [v5 BOOLForKey:*MEMORY[0x1E4F984B0]];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v16 = v4;
      _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_INFO, "Deleting storage for removed extension with composed identifier %{private}@", buf, 0xCu);
    }
    int v8 = [(WBSWebExtensionsController *)self _urlForWebKitExtensionsDirectory];
    int v9 = [v8 URLByAppendingPathComponent:v4 isDirectory:1];
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v14 = 0;
    [v10 removeItemAtURL:v9 error:&v14];
    id v11 = v14;

    if (v11)
    {
      id v12 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_msgSend(v11, "safari_privacyPreservingDescription");
        -[WBSWebExtensionsController _deleteStorageForExtensionWithComposedIdentifier:]((uint64_t)v4, v13, buf, v12);
      }
    }
  }
}

- (void)_updateExtensionStateIfPermissionsIncreased:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSWebExtensionsController *)self webExtensionForExtension:v4];
  [(WBSWebExtensionsController *)self loadPermissionsIfNecessaryForExtension:v5];
  v6.receiver = self;
  v6.super_class = (Class)WBSWebExtensionsController;
  [(WBSExtensionsController *)&v6 _updateExtensionStateIfPermissionsIncreased:v4];
}

- (BOOL)_shouldDisableExtensionIfAdditionalPermissionsAreRequired:(id)a3 previousExtensionState:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(WBSWebExtensionsController *)self webExtensionForExtension:a3];
  int v8 = [v7 currentPermissionOrigins];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = objc_msgSend(v6, "safari_numberForKey:", *MEMORY[0x1E4F98808]);
    id v11 = v10;
    LOBYTE(v9) = v10
              && ([v10 BOOLValue] & 1) == 0
              && ([v7 hasAbilityToInjectContentIntoWebpages] & 1) != 0
              || (v11,
                  objc_msgSend(v6, "safari_numberForKey:", *MEMORY[0x1E4F98840]),
                  id v12 = objc_claimAutoreleasedReturnValue(),
                  (id v11 = v12) != 0)
              && ([v12 BOOLValue] & 1) == 0
              && ([v7 hasDeclarativeNetRequestHostAccessPermission] & 1) != 0;
  }
  return v9;
}

- (id)webExtensionController:(id)a3 openWindowsForExtensionContext:(id)a4
{
  id v5 = +[WBSWebExtensionData webExtensionForWebKitExtensionContext:a4];
  id v6 = [(WBSWebExtensionsController *)self _allWindowsForWebExtension:v5];

  return v6;
}

- (id)webExtensionController:(id)a3 focusedWindowForExtensionContext:(id)a4
{
  id v5 = +[WBSWebExtensionData webExtensionForWebKitExtensionContext:a4];
  if (v5)
  {
    uint64_t v6 = [(WBSWebExtensionsController *)self lastFocusedWindow];
    BOOL v7 = [(WBSWebExtensionsController *)self isWindow:v6 visibleToExtension:v5];
    if (v7) {
      int v8 = (void *)v6;
    }
    else {
      int v8 = 0;
    }
    if (v7) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = (void *)v6;
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)webExtensionController:(id)a3 openNewTabUsingConfiguration:(id)a4 forExtensionContext:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = [v8 window];
  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "index"));
  id v12 = [v8 url];
  uint64_t v13 = [v8 shouldBeActive];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__WBSWebExtensionsController_webExtensionController_openNewTabUsingConfiguration_forExtensionContext_completionHandler___block_invoke;
  v16[3] = &unk_1E5E46A10;
  id v14 = v9;
  id v19 = v14;
  id v15 = v8;
  id v17 = v15;
  __int16 v18 = self;
  [(WBSWebExtensionsController *)self _createNewTabInWindow:v10 tabIndex:v11 url:v12 makeActive:v13 completionHandler:v16];
}

void __120__WBSWebExtensionsController_webExtensionController_openNewTabUsingConfiguration_forExtensionContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    if ([*(id *)(a1 + 32) shouldBePinned]) {
      [*(id *)(a1 + 40) _pinTab:v4];
    }
    if ([*(id *)(a1 + 32) shouldBeMuted]) {
      [v4 mute];
    }
    if ([*(id *)(a1 + 32) shouldReaderModeBeActive]
      && ([v4 isInReaderMode] & 1) == 0)
    {
      [v4 toggleReader];
    }
    id v3 = [*(id *)(a1 + 32) parentTab];
    if (v3) {
      [*(id *)(a1 + 40) _relateParentTab:v3 toTab:v4];
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)webExtensionController:(id)a3 sendMessage:(id)a4 toApplicationWithIdentifier:(id)a5 forExtensionContext:(id)a6 replyHandler:(id)a7
{
  id v16 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a7;
  uint64_t v13 = +[WBSWebExtensionData webExtensionForWebKitExtensionContext:a6];
  id v14 = v13;
  if (v13)
  {
    id v15 = [v13 identifier];
    [(WBSWebExtensionsController *)self sendMessage:v16 toApplicationWithID:v11 fromExtensionWithIdentifier:v15 completionHandler:v12];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3586 userInfo:0];
    v12[2](v12, 0, v15);
  }
}

- (void)webExtensionController:(id)a3 connectUsingMessagePort:(id)a4 forExtensionContext:(id)a5 completionHandler:(id)a6
{
  id v12 = a4;
  id v8 = (void (**)(id, void))a6;
  id v9 = +[WBSWebExtensionData webExtensionForWebKitExtensionContext:a5];
  id v10 = v9;
  if (v9)
  {
    [v9 connectUsingMessagePort:v12];
    v8[2](v8, 0);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3586 userInfo:0];
    ((void (**)(id, void *))v8)[2](v8, v11);
  }
}

- (void)webExtensionController:(id)a3 promptForPermissions:(id)a4 inTab:(id)a5 forExtensionContext:(id)a6 completionHandler:(id)a7
{
}

- (void)webExtensionController:(id)a3 promptForPermissionMatchPatterns:(id)a4 inTab:(id)a5 forExtensionContext:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = +[WBSWebExtensionData webExtensionForWebKitExtensionContext:v11];
  if (v13)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __130__WBSWebExtensionsController_webExtensionController_promptForPermissionMatchPatterns_inTab_forExtensionContext_completionHandler___block_invoke;
    v22 = &unk_1E5E46A38;
    id v23 = self;
    id v26 = v12;
    id v14 = v10;
    id v24 = v14;
    id v15 = v13;
    id v25 = v15;
    id v16 = (void *)MEMORY[0x1AD115160](&v19);
    id v17 = objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_158, v19, v20, v21, v22, v23);
    [(WBSWebExtensionsController *)self _showAccessRequestAlertForExtension:v15 domains:v17 callingAPIName:@"permissions.request()" responseBlock:v16];
  }
  else
  {
    __int16 v18 = [MEMORY[0x1E4F1CAD0] set];
    (*((void (**)(id, void *, void))v12 + 2))(v12, v18, 0);
  }
}

void __130__WBSWebExtensionsController_webExtensionController_promptForPermissionMatchPatterns_inTab_forExtensionContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [(id)objc_opt_class() temporarySiteAccessTimeInterval];
    uint64_t v3 = objc_msgSend(v4, "dateWithTimeIntervalSinceNow:");
    goto LABEL_5;
  }
  if (!a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
LABEL_5:
    id v5 = (void *)v3;
    uint64_t v6 = +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:*(void *)(a1 + 40)];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v7 = [*(id *)(a1 + 32) allProfileExtensionsControllers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v12 = [*(id *)(a1 + 48) extension];
          uint64_t v13 = [v11 webExtensionForExtension:v12];

          id v14 = [MEMORY[0x1E4F1CAD0] set];
          [v13 grantPermissions:v14 origins:v6 expirationDate:v5];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return;
  }
  uint64_t v15 = *(void *)(a1 + 56);
  id v16 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t))(v15 + 16))(v15);
}

id __130__WBSWebExtensionsController_webExtensionController_promptForPermissionMatchPatterns_inTab_forExtensionContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 host];
  uint64_t v3 = objc_msgSend(v2, "safari_stringByRemovingWwwAndWildcardDotPrefixes");

  return v3;
}

- (void)webExtensionController:(id)a3 promptForPermissionToAccessURLs:(id)a4 inTab:(id)a5 forExtensionContext:(id)a6 completionHandler:(id)a7
{
  id v15 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void *, void))a7;
  id v12 = +[WBSWebExtensionData webExtensionForWebKitExtensionContext:a6];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 promptForAccessToURLs:v15 inTab:v10 completionHandler:v11];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CAD0] set];
    v11[2](v11, v14, 0);
  }
}

- (id)_safariShortVersion
{
  return 0;
}

- (id)_webViewConfiguration
{
  return 0;
}

- (id)_allWindowsForWebExtension:(id)a3
{
  return 0;
}

- (void)_createNewTabInWindow:(id)a3 tabIndex:(id)a4 url:(id)a5 makeActive:(BOOL)a6 completionHandler:(id)a7
{
}

- (id)_findWindowWithID:(double)a3
{
  return 0;
}

- (WBSWebExtensionWindow)lastFocusedWindow
{
  return 0;
}

- (BOOL)showOptionsForExtension:(id)a3 requestingWebView:(id)a4
{
  return 0;
}

- (id)_deviceUUIDString
{
  return 0;
}

- (NSString)profileName
{
  uint64_t v2 = [(WBSExtensionsController *)self profile];
  uint64_t v3 = [v2 title];

  return (NSString *)v3;
}

- (BOOL)hasNamedProfiles
{
  return 0;
}

- (WBTabGroupManager)tabGroupManager
{
  return 0;
}

- (id)_domainForDefaultSearchProvider
{
  return 0;
}

- (id)_enabledWebExtensionsSortedByDisplayShortName
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__WBSWebExtensionsController__enabledWebExtensionsSortedByDisplayShortName__block_invoke;
  v12[3] = &unk_1E5E46A80;
  v12[4] = self;
  uint64_t v3 = (void *)MEMORY[0x1AD115160](v12, a2);
  if ([(WBSExtensionsController *)self loadEnabledExtensionsWasCalled])
  {
    id v4 = [(WBSExtensionsController *)self enabledExtensions];
  }
  else
  {
    id v5 = [(WBSExtensionsController *)self extensions];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__WBSWebExtensionsController__enabledWebExtensionsSortedByDisplayShortName__block_invoke_2;
    v11[3] = &unk_1E5E41748;
    v11[4] = self;
    id v4 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v11);
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"displayShortName" ascending:1 selector:sel_localizedStandardCompare_];
  BOOL v7 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v3);
  v13[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v9 = [v7 sortedArrayUsingDescriptors:v8];

  return v9;
}

id __75__WBSWebExtensionsController__enabledWebExtensionsSortedByDisplayShortName__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) webExtensionForExtension:a2];
  return v2;
}

uint64_t __75__WBSWebExtensionsController__enabledWebExtensionsSortedByDisplayShortName__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) extensionIsEnabled:a2];
}

- (id)_discoverabilityTitleForCommand:(id)a3 webExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 commandDescription];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v9 = NSString;
    id v10 = [v5 commandDescription];
    id v11 = [v6 displayShortName];
    id v12 = [v9 stringWithFormat:@"%@ — %@", v10, v11];
  }
  else
  {
    id v12 = [v6 displayShortName];
  }

  return v12;
}

- (id)webExtensionKeyCommands
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__WBSWebExtensionsController_webExtensionKeyCommands__block_invoke;
  v8[3] = &unk_1E5E46AD0;
  v8[4] = self;
  uint64_t v3 = (void *)MEMORY[0x1AD115160](v8, a2);
  id v4 = [(WBSWebExtensionsController *)self _enabledWebExtensionsSortedByDisplayShortName];
  id v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v3);
  id v6 = objc_msgSend(v5, "safari_flattenedArray");

  return v6;
}

id __53__WBSWebExtensionsController_webExtensionKeyCommands__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 commands];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__WBSWebExtensionsController_webExtensionKeyCommands__block_invoke_2;
  v8[3] = &unk_1E5E46AA8;
  v8[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v9 = v5;
  id v6 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v8);

  return v6;
}

id __53__WBSWebExtensionsController_webExtensionKeyCommands__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 keyCommand];
  id v5 = [*(id *)(a1 + 32) _discoverabilityTitleForCommand:v3 webExtension:*(void *)(a1 + 40)];
  [v4 setDiscoverabilityTitle:v5];

  return v4;
}

- (id)commandShortcutConflictsForExtension:(id)a3
{
  id v4 = a3;
  if ([v4 hasCommands])
  {
    id v5 = [(WBSWebExtensionsController *)self _enabledWebExtensionsSortedByDisplayShortName];
    id v6 = (void *)[v5 mutableCopy];

    if ([v6 containsObject:v4]) {
      [v6 removeObject:v4];
    }
    BOOL v7 = [(id)objc_opt_class() _commandShortcutConflictsForExtension:v4 sortedWebExtensions:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)performCommandForKeyCommand:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(WBSWebExtensionsController *)self webKitController];
  id v6 = [v5 extensionContexts];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v10 + 1) + 8 * v9) performCommandForKeyCommand:v4]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (id)_firstConflctForCommand:(id)a3 inSortedWebExtensions:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v22 = [v5 shortcut];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v11 = [v10 commands];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __76__WBSWebExtensionsController__firstConflctForCommand_inSortedWebExtensions___block_invoke;
        v23[3] = &unk_1E5E46AF8;
        id v24 = v22;
        long long v12 = objc_msgSend(v11, "safari_firstObjectPassingTest:", v23);

        long long v13 = [v12 shortcut];
        BOOL v14 = [v13 length] == 0;

        if (!v14)
        {
          id v16 = [WBSWebExtensionCommandShortcutConflict alloc];
          long long v17 = [v12 shortcut];
          long long v18 = [v10 displayName];
          long long v19 = [v10 displayShortName];
          uint64_t v15 = [(WBSWebExtensionCommandShortcutConflict *)v16 initWithShortcut:v17 extensionDisplayName:v18 extensionDisplayShortName:v19];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

uint64_t __76__WBSWebExtensionsController__firstConflctForCommand_inSortedWebExtensions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 shortcut];
  uint64_t v4 = objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", v3);

  return v4;
}

+ (id)_commandShortcutConflictsForExtension:(id)a3 sortedWebExtensions:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = objc_msgSend(v6, "commands", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = [a1 _firstConflctForCommand:*(void *)(*((void *)&v16 + 1) + 8 * i) inSortedWebExtensions:v7];
        if (v13) {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  BOOL v14 = (void *)[v8 copy];
  return v14;
}

- (BOOL)commandName:(id)a3 isActionForExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 usesManifestVersion3])
  {
    char v7 = [v5 isEqualToString:@"_execute_action"];
  }
  else
  {
    if ([v5 isEqualToString:@"_execute_browser_action"]) {
      goto LABEL_6;
    }
    char v7 = [v5 isEqualToString:@"_execute_page_action"];
  }
  if ((v7 & 1) == 0)
  {
    BOOL v8 = 0;
    goto LABEL_8;
  }
LABEL_6:
  BOOL v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)anyWebExtensionContentBlockerEnabled
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = self->super._extensions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[WBSWebExtensionsController extensionIsEnabled:](self, "extensionIsEnabled:", v7, (void)v13))
        {
          BOOL v8 = [(WBSWebExtensionsController *)self webExtensionForExtension:v7];
          uint64_t v9 = [v8 webKitContext];
          char v10 = [v9 hasContentModificationRules];

          if (v10)
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (void)loadPermissionsIfNecessaryForExtension:(id)a3
{
  id v4 = a3;
  enabledExtensions = self->super._enabledExtensions;
  id v7 = v4;
  id v6 = [v4 extension];
  LOBYTE(enabledExtensions) = [(NSMutableSet *)enabledExtensions containsObject:v6];

  if ((enabledExtensions & 1) == 0) {
    [(WBSWebExtensionsController *)self _loadPermissionsFromStorageForWebExtension:v7 completionHandler:&__block_literal_global_177];
  }
}

- (void)_applyManagedExtensionPermissionsForWebExtension:(id)a3
{
  id v22 = a3;
  id v3 = [v22 composedIdentifier];
  id v4 = [MEMORY[0x1E4F98348] sharedController];
  int v5 = [v4 allDomainsAreManagedForComposedIdentifier:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = [v22 grantedPermissionOrigins];
    BOOL v8 = [v7 allKeys];
    [v6 addObjectsFromArray:v8];

    uint64_t v9 = [v22 revokedPermissionOrigins];
    char v10 = [v9 allKeys];
    [v6 addObjectsFromArray:v10];

    BOOL v11 = [MEMORY[0x1E4F1CAD0] set];
    [v22 removeGrantedAndRevokedPermissions:v11 origins:v6 exactPatternMatchesOnly:1];
  }
  long long v12 = [MEMORY[0x1E4F1CAD0] set];
  long long v13 = [MEMORY[0x1E4F98348] sharedController];
  long long v14 = [v13 allowedDomainsForComposedIdentifier:v3];
  long long v15 = objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_183_0);
  long long v16 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v22 grantPermissions:v12 origins:v15 expirationDate:v16];

  long long v17 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v18 = [MEMORY[0x1E4F98348] sharedController];
  long long v19 = [v18 deniedDomainsForComposedIdentifier:v3];
  long long v20 = objc_msgSend(v19, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_183_0);
  uint64_t v21 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v22 revokePermissions:v17 origins:v20 expirationDate:v21];
}

id __79__WBSWebExtensionsController__applyManagedExtensionPermissionsForWebExtension___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:@"*"])
  {
    uint64_t v3 = +[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern];
  }
  else
  {
    if ([v2 hasPrefix:@"*"])
    {
      id v4 = [v2 substringFromIndex:1];
      int v5 = +[WBSWebExtensionMatchPattern matchPatternForDomain:v4];

      goto LABEL_7;
    }
    uint64_t v3 = +[WBSWebExtensionMatchPattern matchPatternForDomainWithoutSubdomains:v2];
  }
  int v5 = (void *)v3;
LABEL_7:

  return v5;
}

- (void)_updateManagedWebsiteAccessForAllExtensions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->super._extensions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        if ([v7 hasLoadedPermissionsFromStorage]) {
          [(WBSWebExtensionsController *)self _applyManagedExtensionPermissionsForWebExtension:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_updateManagedPrivateBrowsingStateForAllExtensions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F98348] sharedController];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->super._extensions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", *(void *)(*((void *)&v11 + 1) + 8 * v7), (void)v11);
        long long v9 = [v8 composedIdentifier];
        uint64_t v10 = [v3 managedExtensionPrivateBrowsingStateForComposedIdentifier:v9];

        if (v10) {
          [v8 setAllowedInPrivateBrowsing:v10 == 1];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_loadPermissionsFromStorageForWebExtension:(id)a3 completionHandler:(id)a4
{
  v55[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (!self->super._extensionIdentifierToStateMap)
  {
    long long v8 = [(WBSExtensionsController *)self readExtensionsStateFromStorage];
    long long v9 = (NSMutableDictionary *)[v8 mutableCopy];
    extensionIdentifierToStateMap = self->super._extensionIdentifierToStateMap;
    self->super._extensionIdentifierToStateMap = v9;
  }
  long long v11 = [v6 extension];
  long long v12 = [(WBSExtensionsController *)self _extensionStateForExtension:v11];

  if (v12 && ![v6 hasLoadedPermissionsFromStorage])
  {
    long long v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v15 = [v14 BOOLForKey:*MEMORY[0x1E4F98490]];

    if (v15)
    {
      uint64_t v16 = (void *)[v12 mutableCopy];
      v55[0] = @"GrantedPermissions";
      v55[1] = @"GrantedPermissionOrigins";
      void v55[2] = @"RevokedPermissions";
      v55[3] = @"RevokedPermissionOrigins";
      v55[4] = *MEMORY[0x1E4F98558];
      long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:5];
      [v16 removeObjectsForKeys:v17];

      long long v13 = (void *)[v16 copy];
      uint64_t v18 = self->super._extensionIdentifierToStateMap;
      long long v19 = [v6 extension];
      long long v20 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v19];
      [(NSMutableDictionary *)v18 setObject:v13 forKeyedSubscript:v20];
    }
    else
    {
      long long v13 = v12;
    }
    uint64_t v21 = objc_msgSend(v13, "safari_dictionaryForKey:", @"GrantedPermissions");
    id v22 = (void *)v21;
    id v23 = (void *)MEMORY[0x1E4F1CC08];
    if (v21) {
      id v23 = (void *)v21;
    }
    id v24 = v23;

    long long v25 = [v6 webKitExtension];
    long long v26 = [v25 requestedPermissions];
    long long v27 = objc_msgSend(v26, "safari_dictionaryByMappingObjectsToValuesUsingBlock:", &__block_literal_global_191_0);

    id v45 = objc_msgSend(v27, "safari_dictionaryByMergingWithDictionary:", v24);

    [v6 setGrantedPermissions:v45];
    uint64_t v28 = objc_msgSend(v13, "safari_dictionaryForKey:", @"RevokedPermissions");
    v29 = (void *)v28;
    if (v28) {
      uint64_t v30 = v28;
    }
    else {
      uint64_t v30 = MEMORY[0x1E4F1CC08];
    }
    [v6 setRevokedPermissions:v30];

    char v31 = [v6 requestsAccessToAllHosts];
    v44 = [v6 manifestAccessibleOrigins];
    v32 = [v6 manifestOptionalPermissionOrigins];
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_2;
    v46[3] = &unk_1E5E46B68;
    char v50 = v31;
    id v33 = v44;
    id v47 = v33;
    v49 = &v51;
    id v34 = v32;
    id v48 = v34;
    id v35 = (void *)MEMORY[0x1AD115160](v46);
    id v36 = objc_msgSend(v13, "safari_dictionaryForKey:", @"GrantedPermissionOrigins");
    uint64_t v37 = objc_msgSend(v36, "safari_mapAndFilterKeysUsingBlock:", v35);
    id v38 = (void *)v37;
    if (v37) {
      uint64_t v39 = v37;
    }
    else {
      uint64_t v39 = MEMORY[0x1E4F1CC08];
    }
    [v6 setGrantedPermissionOrigins:v39];

    id v40 = objc_msgSend(v13, "safari_dictionaryForKey:", @"RevokedPermissionOrigins");
    uint64_t v41 = objc_msgSend(v40, "safari_mapAndFilterKeysUsingBlock:", v35);
    id v42 = (void *)v41;
    if (v41) {
      uint64_t v43 = v41;
    }
    else {
      uint64_t v43 = MEMORY[0x1E4F1CC08];
    }
    [v6 setRevokedPermissionOrigins:v43];

    [(WBSWebExtensionsController *)self _applyManagedExtensionPermissionsForWebExtension:v6];
    [v6 setHasLoadedPermissionsFromStorage:1];
    if (*((unsigned char *)v52 + 24)) {
      [(WBSWebExtensionsController *)self _savePermissionsToStorageForWebExtension:v6];
    }
    v7[2](v7);

    _Block_object_dispose(&v51, 8);
  }
  else
  {
    v7[2](v7);
    long long v13 = v12;
  }
}

id __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke()
{
  v0 = [MEMORY[0x1E4F1C9C8] distantFuture];
  return v0;
}

id __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[WBSWebExtensionMatchPattern matchPatternWithString:v3];
  uint64_t v5 = v4;
  if (*(unsigned char *)(a1 + 56))
  {
    id v6 = v4;
  }
  else
  {
    if ([v4 matchesAllHosts])
    {
      uint64_t v7 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138478083;
        id v19 = v5;
        __int16 v20 = 2113;
        uint64_t v21 = v8;
        _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_INFO, "Skipping loading permission: %{private}@ since it doesn't match any manifest accessible patterns (%{private}@)", buf, 0x16u);
      }
      id v6 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      long long v9 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_192;
      v16[3] = &unk_1E5E46B40;
      id v6 = v5;
      id v17 = v6;
      if (objc_msgSend(v9, "safari_containsObjectPassingTest:", v16))
      {
        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v10 = *(void **)(a1 + 40);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_2_194;
        void v14[3] = &unk_1E5E46B40;
        id v6 = v6;
        id v15 = v6;
        if (objc_msgSend(v10, "safari_containsObjectPassingTest:", v14))
        {
          uint64_t v5 = 0;
        }
        else
        {
          long long v11 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138478083;
            id v19 = v6;
            __int16 v20 = 2113;
            uint64_t v21 = v12;
            _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_INFO, "Skipping loading permission: %{private}@ since it doesn't match any manifest accessible patterns (%{private}@)", buf, 0x16u);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          uint64_t v5 = v6;
          id v6 = 0;
        }
      }
    }
  }
  return v6;
}

uint64_t __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_192(uint64_t a1, void *a2)
{
  return [a2 matchesPattern:*(void *)(a1 + 32) options:4];
}

uint64_t __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_2_194(uint64_t a1, void *a2)
{
  return [a2 matchesPattern:*(void *)(a1 + 32) options:4];
}

- (void)_savePermissionsToStorageForWebExtension:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 extension];
  uint64_t v5 = [(WBSExtensionsController *)self _extensionStateForExtension:v4];
  id v6 = (void *)[v5 mutableCopy];

  if (v6)
  {
    uint64_t v7 = [v14 grantedPermissions];
    [v6 setObject:v7 forKeyedSubscript:@"GrantedPermissions"];

    uint64_t v8 = [v14 revokedPermissions];
    [v6 setObject:v8 forKeyedSubscript:@"RevokedPermissions"];

    long long v9 = [v14 grantedPermissionOrigins];
    uint64_t v10 = objc_msgSend(v9, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_198_0);
    [v6 setObject:v10 forKeyedSubscript:@"GrantedPermissionOrigins"];

    long long v11 = [v14 revokedPermissionOrigins];
    uint64_t v12 = objc_msgSend(v11, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_198_0);
    [v6 setObject:v12 forKeyedSubscript:@"RevokedPermissionOrigins"];

    long long v13 = [v14 extension];
    [(WBSExtensionsController *)self _setExtensionState:v6 forExtension:v13];
  }
}

id __71__WBSWebExtensionsController__savePermissionsToStorageForWebExtension___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 description];
  return v2;
}

- (void)_savePermissionsToStorageIfNecessaryAndPostDidChangeNotificationForWebExtension:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 webExtension];
  if (([v4 permissionsWereUpdatedDueToAnExternalChange] & 1) == 0) {
    [(WBSWebExtensionsController *)self _savePermissionsToStorageForWebExtension:v5];
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = [v4 webExtension];
  uint64_t v10 = @"permissionsWereUpdatedDueToAnExternalChange";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "permissionsWereUpdatedDueToAnExternalChange"));
  v11[0] = v8;
  long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v6 postNotificationName:@"webExtensionPermissionDidChange" object:v7 userInfo:v9];
}

- (void)_savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:(id)a3 permissionsWereUpdatedDueToAnExternalChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  {
    -[WBSWebExtensionsController _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:]::selectorToCoalesce = (uint64_t)sel__savePermissionsToStorageIfNecessaryAndPostDidChangeNotificationForWebExtension_;
  }
  id v6 = [[WBSSavePermissionsToStorageInformation alloc] initWithWebExtension:v7 permissionsWereUpdatedDueToAnExternalChange:v4];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:-[WBSWebExtensionsController _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:]::selectorToCoalesce object:v6];
  -[WBSWebExtensionsController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", -[WBSWebExtensionsController _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:]::selectorToCoalesce, v6, 0.01);
}

- (void)_webExtensionDataPermissionsWereGranted:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 object];
  uint64_t v5 = [v4 extensionsController];

  if (v5 == self)
  {
    id v6 = [v8 userInfo];
    uint64_t v7 = objc_msgSend(v6, "safari_BOOLForKey:", @"permissionsWereUpdatedDueToAnExternalChange");

    [(WBSWebExtensionsController *)self _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:v4 permissionsWereUpdatedDueToAnExternalChange:v7];
  }
}

- (void)_webExtensionDataPermissionsWereRevokedOrRemoved:(id)a3
{
  id v13 = a3;
  BOOL v4 = [v13 object];
  uint64_t v5 = [v4 extensionsController];

  if (v5 == self)
  {
    id v6 = [v13 name];
    char v7 = [v6 isEqualToString:@"webExtensionGrantedPermissionsWereRemoved"];

    if ((v7 & 1) == 0)
    {
      id v8 = [v13 name];
      char v9 = [v8 isEqualToString:@"webExtensionPermissionsWereRevoked"];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = [v13 name];
        [v10 isEqualToString:@"webExtensionRevokedPermissionsWereRemoved"];
      }
    }
    long long v11 = [v13 userInfo];
    uint64_t v12 = objc_msgSend(v11, "safari_BOOLForKey:", @"permissionsWereUpdatedDueToAnExternalChange");

    [(WBSWebExtensionsController *)self _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:v4 permissionsWereUpdatedDueToAnExternalChange:v12];
  }
}

- (void)_webExtensionEnabledStateInPrivateBrowsingChanged:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 userInfo];
  uint64_t v5 = objc_msgSend(v4, "safari_stringForKey:", @"WBSWebExtensionComposedIdentifierKey");

  if ([v5 length])
  {
    id v6 = [(WBSWebExtensionsController *)self webExtensionForComposedIdentifier:v5];
    char v7 = [v8 userInfo];
    objc_msgSend(v6, "setAllowedInPrivateBrowsing:", objc_msgSend(v7, "safari_BOOLForKey:", *MEMORY[0x1E4F984C8]));
  }
}

+ (double)pendingSiteAccessTimeoutInterval
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:*MEMORY[0x1E4F98478]];
  double v4 = v3;

  double result = 60.0;
  if (v4 != 0.0) {
    return v4;
  }
  return result;
}

- (id)_filteredOriginsRemovingAllHostsPatterns:(id)a3 containedAllHostsPattern:(BOOL *)a4
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__WBSWebExtensionsController__filteredOriginsRemovingAllHostsPatterns_containedAllHostsPattern___block_invoke;
  v7[3] = &unk_1E5E46BB0;
  v7[4] = &v8;
  uint64_t v5 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v7);
  if (a4) {
    *a4 = *((unsigned char *)v9 + 24);
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __96__WBSWebExtensionsController__filteredOriginsRemovingAllHostsPatterns_containedAllHostsPattern___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 matchesAllHosts])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;

    id v3 = 0;
  }
  return v3;
}

- (void)_showAccessRequestAlertForExtension:(id)a3 domains:(id)a4 callingAPIName:(id)a5 responseBlock:(id)a6
{
}

- (void)_permissionsMayHaveBeenChangedExternallyForExtension:(id)a3 previousExtensionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "safari_dictionaryForKey:", @"GrantedPermissionOrigins");
  uint64_t v9 = objc_msgSend(v8, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_204);
  uint64_t v10 = (void *)v9;
  char v11 = (void *)MEMORY[0x1E4F1CC08];
  if (v9) {
    uint64_t v12 = (void *)v9;
  }
  else {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v13 = v12;

  id v14 = objc_msgSend(v7, "safari_dictionaryForKey:", @"RevokedPermissionOrigins");
  uint64_t v15 = objc_msgSend(v14, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_204);
  uint64_t v16 = (void *)v15;
  if (v15) {
    id v17 = (void *)v15;
  }
  else {
    id v17 = v11;
  }
  id v18 = v17;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__WBSWebExtensionsController__permissionsMayHaveBeenChangedExternallyForExtension_previousExtensionState___block_invoke_2;
  v22[3] = &unk_1E5E40820;
  id v19 = v6;
  id v23 = v19;
  id v20 = v13;
  id v24 = v20;
  id v25 = v18;
  id v21 = v18;
  [(WBSWebExtensionsController *)self _loadPermissionsFromStorageForWebExtension:v19 completionHandler:v22];
}

id __106__WBSWebExtensionsController__permissionsMayHaveBeenChangedExternallyForExtension_previousExtensionState___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[WBSWebExtensionMatchPattern matchPatternWithString:a2];
  return v2;
}

uint64_t __106__WBSWebExtensionsController__permissionsMayHaveBeenChangedExternallyForExtension_previousExtensionState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) previouslyGrantedPermissionOriginsMayHaveBeenChangedExternally:*(void *)(a1 + 40) previouslyRevokedPermissionOrigins:*(void *)(a1 + 48)];
}

- (BOOL)isTab:(id)a3 visibleToExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_6;
  }
  id v7 = [v5 profile];
  uint64_t v8 = [v6 extensionsController];
  uint64_t v9 = [v8 profile];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0) {
    goto LABEL_5;
  }
  if (([v6 allowedInPrivateBrowsing] & 1) != 0 || (objc_msgSend(v5, "isPrivate") & 1) == 0) {
LABEL_6:
  }
    BOOL v11 = 1;
  else {
LABEL_5:
  }
    BOOL v11 = 0;

  return v11;
}

- (void)didOpenTab:(id)a3
{
}

- (void)didCloseTab:(id)a3 windowIsClosing:(BOOL)a4
{
}

- (void)didMoveTab:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v7 = a3;
  webKitController = self->_webKitController;
  id v10 = v7;
  uint64_t v9 = [v7 webExtensionWindow];
  [(WKWebExtensionController *)webKitController didMoveTab:v10 fromIndex:a4 inWindow:v9];
}

- (void)didMoveTab:(id)a3 fromWindowWithID:(double)a4 indexInOldWindow:(unint64_t)a5
{
  id v9 = a3;
  if (a4 == -1.0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(WBSWebExtensionsController *)self _findWindowWithID:a4];
  }
  [(WKWebExtensionController *)self->_webKitController didMoveTab:v9 fromIndex:a5 inWindow:v8];
}

- (void)didReplaceTab:(id)a3 newTab:(id)a4
{
}

- (void)didSelectTab:(id)a3 previousTab:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(WKWebExtensionController *)self->_webKitController didActivateTab:v6 previousActiveTab:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->super._enabledExtensions;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        BOOL v11 = -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        uint64_t v12 = [v11 toolbarItem];
        [v12 didSelectTab:v6];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (BOOL)isWindow:(id)a3 visibleToExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_6;
  }
  id v7 = [v5 profile];
  uint64_t v8 = [v6 extensionsController];
  uint64_t v9 = [v8 profile];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0) {
    goto LABEL_5;
  }
  if (([v6 allowedInPrivateBrowsing] & 1) != 0 || (objc_msgSend(v5, "isPrivate") & 1) == 0) {
LABEL_6:
  }
    BOOL v11 = 1;
  else {
LABEL_5:
  }
    BOOL v11 = 0;

  return v11;
}

- (id)_persistentStateURLForExtensionURL:(id)a3
{
  double v4 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  id v5 = [v4 host];
  id v6 = [(WBSWebExtensionsController *)self webExtensionForBaseURIHost:v5];

  if (v6)
  {
    id v7 = [v6 composedIdentifier];
    uint64_t v8 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
    uint64_t v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];
    [v4 setEncodedHost:v9];

    char v10 = [v4 URL];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_extensionURLToLoadFromPersistentStateURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:0];
    id v6 = objc_msgSend(v4, "safari_composedIdentifierAndProfileIdentifierInSafariWebExtensionURL");
    id v7 = [v6 first];
    uint64_t v8 = [(WBSWebExtensionsController *)self webExtensionForComposedIdentifier:v7];
    uint64_t v9 = v8;
    if (v8)
    {
      char v10 = [v8 baseURIHost];
      BOOL v11 = [v10 UUIDString];
      [v5 setHost:v11];

      uint64_t v12 = [v5 URL];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (WBSCoreAnalyticsExtensionsStatistics)extensionStatisticsReport
{
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke;
  void v14[3] = &unk_1E5E46BF8;
  void v14[4] = self;
  id v3 = (void *)MEMORY[0x1AD115160](v14, a2);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke_2;
  v13[3] = &unk_1E5E46BF8;
  v13[4] = self;
  id v4 = (void *)MEMORY[0x1AD115160](v13);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke_3;
  v12[3] = &unk_1E5E46C20;
  v12[4] = self;
  id v5 = (void *)MEMORY[0x1AD115160](v12);
  id v6 = objc_alloc(MEMORY[0x1E4F982E0]);
  extensions = self->super._extensions;
  uint64_t v8 = [(WBSWebExtensionsController *)self tabOverridePreferencesManager];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v10 = objc_msgSend(v6, "initWithExtensionsList:extractDeveloperIdentifier:extractComposedIdentifier:extensionTelemetryDataPredicate:newTabPageIsOverridden:", extensions, v3, v4, v5, objc_msgSend(v8, "isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:", v9));

  return (WBSCoreAnalyticsExtensionsStatistics *)v10;
}

id __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _developerIdentifierForExtension:a2];
  return v2;
}

id __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) composedIdentifierForExtensionStateForExtension:a2];
  return v2;
}

id __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F98310]);
  id v5 = [*(id *)(a1 + 32) webExtensionForExtension:v3];
  objc_msgSend(v4, "setEnabled:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "containsObject:", v3));
  id v6 = [*(id *)(a1 + 32) composedIdentifierForExtensionStateForExtension:v3];
  [v4 setIdentifier:v6];

  objc_msgSend(v4, "setManifestVersion:", objc_msgSend(v5, "manifestVersion"));
  objc_msgSend(v4, "setAllWebsitesPermissionLevel:", objc_msgSend(v5, "hasPermissionToAccessAllHosts"));
  id v7 = [v5 currentPermissionOrigins];
  objc_msgSend(v4, "setWebsitesGrantedAccessCount:", objc_msgSend(v7, "count"));

  uint64_t v8 = [v5 revokedPermissionOrigins];
  objc_msgSend(v4, "setWebsitesDeniedAccessCount:", objc_msgSend(v8, "count"));

  uint64_t v9 = (void *)[v5 newTabOverridePageURL];
  [v4 setCanOverrideNewTabPage:v9 != 0];

  return v4;
}

- (void)_grantRequestedPermissionsIfNecessaryForExtension:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v5 = [v4 BOOLForKey:@"DidGrantSearchProviderAccessToWebNavigationExtensions"];

  if ((v5 & 1) == 0)
  {
    id v6 = v27;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    char v31 = v8;
    {
      -[WBSWebExtensionsController _grantRequestedPermissionsIfNecessaryForExtension:]::searchProviderComposedIdentifiers = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0342140];
    }
    long long v26 = [v8 composedIdentifier];
    if (objc_msgSend((id)-[WBSWebExtensionsController _grantRequestedPermissionsIfNecessaryForExtension:]::searchProviderComposedIdentifiers, "containsObject:"))
    {
      uint64_t v9 = [v8 grantedPermissionOrigins];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
        migratedWebNavigationExtensionIdentifiers = self->_migratedWebNavigationExtensionIdentifiers;
        if (!migratedWebNavigationExtensionIdentifiers)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
          long long v13 = self->_migratedWebNavigationExtensionIdentifiers;
          self->_migratedWebNavigationExtensionIdentifiers = v12;

          migratedWebNavigationExtensionIdentifiers = self->_migratedWebNavigationExtensionIdentifiers;
        }
        [(NSMutableSet *)migratedWebNavigationExtensionIdentifiers addObject:v26];
        long long v14 = (void *)MEMORY[0x1E4F1CAD0];
        long long v15 = [(WBSWebExtensionsController *)self _domainForDefaultSearchProvider];
        long long v16 = +[WBSWebExtensionMatchPattern matchPatternForDomain:v15];
        v29 = [v14 setWithObject:v16];

        uint64_t v30 = [MEMORY[0x1E4F1CAD0] set];
        id v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v18 = [(WBSExtensionsController *)self allProfileExtensionsControllers];
        id obj = v18;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v38 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              id v23 = [v31 extension];
              id v24 = [v22 webExtensionForExtension:v23];

              v32[0] = MEMORY[0x1E4F143A8];
              v32[1] = 3221225472;
              v32[2] = __80__WBSWebExtensionsController__grantRequestedPermissionsIfNecessaryForExtension___block_invoke;
              v32[3] = &unk_1E5E451F8;
              id v25 = v24;
              id v33 = v25;
              id v34 = v30;
              id v35 = v29;
              id v36 = v17;
              [v22 _loadPermissionsFromStorageForWebExtension:v25 completionHandler:v32];
            }
            uint64_t v18 = obj;
            uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v19);
        }
      }
    }
  }
}

uint64_t __80__WBSWebExtensionsController__grantRequestedPermissionsIfNecessaryForExtension___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) grantPermissions:*(void *)(a1 + 40) origins:*(void *)(a1 + 48) expirationDate:*(void *)(a1 + 56)];
}

- (void)_finishedLoadingExtensions
{
  if ([(WBSExtensionsController *)self loadEnabledExtensionsWasCalled])
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    if (([v3 BOOLForKey:@"DidGrantSearchProviderAccessToWebNavigationExtensions"] & 1) == 0) {
      [v3 setBool:1 forKey:@"DidGrantSearchProviderAccessToWebNavigationExtensions"];
    }
    v4.receiver = self;
    v4.super_class = (Class)WBSWebExtensionsController;
    [(WBSExtensionsController *)&v4 _finishedLoadingExtensions];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabOverridePreferencesManager, 0);
  objc_storeStrong((id *)&self->_webKitController, 0);
  objc_storeStrong((id *)&self->_migratedWebNavigationExtensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_settingsFileURL, 0);
  objc_storeStrong((id *)&self->_nativeRequestIdentifiersToCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_extensionIdentifierToData, 0);
  objc_storeStrong((id *)&self->_extensionsWithWebNavigationListeners, 0);
  objc_storeStrong((id *)&self->_extensionsWithWebRequestListeners, 0);
}

- (void)_deleteStorageForExtensionWithComposedIdentifier:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to delete storage for removed extension with composed identifier %{private}@: %{public}@", buf, 0x16u);
}

@end