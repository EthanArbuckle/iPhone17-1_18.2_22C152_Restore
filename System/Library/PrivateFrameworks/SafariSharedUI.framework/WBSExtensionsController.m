@interface WBSExtensionsController
+ (BOOL)hasBlockedPromptAppearedForExtensionWithIdentifier:(id)a3;
+ (Class)_extensionDataClass;
+ (double)temporarySiteAccessTimeInterval;
+ (id)_bundleIdentifierFromComposedIdentifier:(id)a3;
+ (id)_composedIdentifierForStateOfExtensionWithBundleIdentifier:(id)a3 developerIdentifier:(id)a4;
+ (id)_extensionDefaults;
+ (id)_extensionFromComposedIdentifier:(id)a3;
+ (id)_extensionPointIdentifier;
+ (id)_skipLoadingEnabledExtensionsAtLaunchPreferenceKey;
+ (id)extensionIdentifierToBaseURIMapBundleParameterKey;
+ (id)extensionURLScheme;
+ (id)extensionsCrashReporterMessageBundleParameterKey;
+ (void)removeExtensionBundleIDFromArrayOfBlocklistedExtensions:(id)a3;
- (BOOL)_extensionShouldBeAutomaticallyEnabled:(id)a3;
- (BOOL)_extensionShouldBeEnabled:(id)a3;
- (BOOL)_isExtensionBlockedByBlocklist:(id)a3 developerIdentifier:(id)a4;
- (BOOL)_shouldDisableExtensionIfAdditionalPermissionsAreRequired:(id)a3 previousExtensionState:(id)a4;
- (BOOL)_supportsCodeSigningChecks;
- (BOOL)_supportsExtensionDiscovery;
- (BOOL)allowUnsignedExtensions;
- (BOOL)extensionIsEnabled:(id)a3;
- (BOOL)extensionsEnabled;
- (BOOL)hasAnyEnabledExtensions;
- (BOOL)hasAnyEnabledExtensionsInStorage;
- (BOOL)hasDiscoveredExtensions;
- (BOOL)hasExtensionWithComposedIdentifier:(id)a3;
- (BOOL)hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce;
- (BOOL)hasShownPerSiteAccessPermissionForExtension:(id)a3;
- (BOOL)loadEnabledExtensionsWasCalled;
- (BOOL)loadingEnabledExtensionsAtStartup;
- (BOOL)validateAndReadResourceWithExtensionURL:(id)a3 inExtension:(id)a4 codeRef:(__SecCode *)a5 outResourceData:(id *)a6;
- (BOOL)validateAndReadResourceWithExtensionURL:(id)a3 inExtension:(id)a4 outResourceData:(id *)a5;
- (BOOL)validateAndReadResourceWithExtensionURL:(id)a3 outResourceData:(id *)a4;
- (NSArray)allDiscoveredExtensions;
- (NSArray)allProfileExtensionsControllers;
- (NSArray)composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions;
- (NSArray)enabledExtensions;
- (NSDictionary)extensionIdentifierToBaseURIMap;
- (NSMutableArray)extensions;
- (NSSet)extensionStateKeysToCopy;
- (NSString)debugDescription;
- (NSString)profileServerID;
- (WBProfile)profile;
- (WBSExtensionsAnalyticsEventCoalescer)analyticsEventCoalescer;
- (WBSExtensionsController)init;
- (WBSExtensionsController)initWithProfileServerID:(id)a3 userContentController:(id)a4;
- (WBSExtensionsController)initWithProfileServerID:(id)a3 userContentController:(id)a4 forceExtensionLoadingAfterDiscovery:(BOOL)a5;
- (WBSExtensionsControllerDelegate)delegate;
- (WKUserContentController)userContentController;
- (WKWebsiteDataStore)websiteDataStore;
- (id)_computeCodeSigningDictionaryOnDiskForExtension:(id)a3 attemptRetryOnFailure:(BOOL)a4;
- (id)_developerIdentifierForExtension:(id)a3;
- (id)_developerIdentifierForExtension:(id)a3 untrustedCodeSigningDictionary:(id)a4;
- (id)_displayNameForExtension:(id)a3;
- (id)_displayShortNameForExtension:(id)a3;
- (id)_displayVersionForExtension:(id)a3;
- (id)_extensionStateForExtension:(id)a3;
- (id)_extensionsControllerForDefaultProfile;
- (id)_generateBaseURIForExtension:(id)a3;
- (id)_updatedExtensionStateForCurrentPermissions:(id)a3 previousExtensionState:(id)a4;
- (id)_urlForExtensionSettings;
- (id)_urlForWebKitExtensionsDirectory;
- (id)_versionNumberForExtension:(id)a3;
- (id)cloudExtensionStateForStateManager:(id)a3;
- (id)composedIdentifierForExtensionStateForExtension:(id)a3;
- (id)extensionDataForExtension:(id)a3;
- (id)extensionWithBaseURIHost:(id)a3;
- (id)extensionWithBundleIdentifier:(id)a3;
- (id)extensionWithComposedIdentifier:(id)a3;
- (id)extensionWithUUID:(id)a3;
- (id)extensionsDataForExport;
- (id)extensionsWithAdamID:(id)a3;
- (id)lastSeenBaseURIForExtension:(id)a3;
- (id)lastSeenBaseURIForExtension:(id)a3 updatingWithCurrentBaseURI:(id)a4;
- (id)profileServerIDForStateManager:(id)a3;
- (id)readExtensionsStateFromStorage;
- (void)_addExtensionToBaseURIMap:(id)a3 withResourceURL:(id)a4;
- (void)_beginExtensionDiscovery;
- (void)_beginMatchingExtensionsWithAttributesCompletedWithMatchingExtensions:(id)a3;
- (void)_deleteStateForExtensionWithComposedIdentifier:(id)a3;
- (void)_deleteStateForRemovedExtensions;
- (void)_deleteStateForRemovedExtensionsAfterDelay:(double)a3;
- (void)_deleteStateForRemovedExtensionsSoon;
- (void)_disableAndBlockExtension:(id)a3;
- (void)_enableExtension:(id)a3 completionHandler:(id)a4;
- (void)_endExtensionDiscovery;
- (void)_extensionDiscoveryHasNewResults:(id)a3;
- (void)_extensionsWereGloballyDisabled;
- (void)_extensionsWereGloballyEnabled;
- (void)_finishedLoadingExtensions;
- (void)_loadExtensions:(id)a3;
- (void)_loadExtensions:(id)a3 skipEqualityCheck:(BOOL)a4;
- (void)_managedExtensionStateDidChange;
- (void)_populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile;
- (void)_postExtensionWasEnabledRemotelyNotificationIfNecessary:(id)a3;
- (void)_removeSafariExtensionDataForExtension:(id)a3;
- (void)_resetExtensionsState;
- (void)_setExtensionIdentifierToStateMap:(id)a3 forExtensionWithComposedIdentifier:(id)a4;
- (void)_setExtensionIdentifierToStateMap:(id)a3 forExtensionWithComposedIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_setExtensionState:(id)a3 forExtension:(id)a4;
- (void)_setExtensionState:(id)a3 forExtension:(id)a4 completionHandler:(id)a5;
- (void)_updateExtensionStateAfterExtensionWasAddedWithComposedIdentifier:(id)a3;
- (void)_updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:(id)a3;
- (void)_updateExtensionStateIfPermissionsIncreased:(id)a3;
- (void)_updateExtensionStateWithPrivacyPreservingProfileIdentifierIfNeeded:(id)a3;
- (void)_validateAndLoadExtensionIfNecessary:(id)a3 attemptRetryOnFailure:(BOOL)a4 isExtensionNewlyInstalled:(BOOL *)a5;
- (void)_writeExtensionsStateToStorage;
- (void)addObserver:(id)a3;
- (void)closeLocalExtensionContentInPrivateTabsForExtension:(id)a3;
- (void)copyEnabledExtensionStateFromExtensionsController:(id)a3;
- (void)dealloc;
- (void)didShowPerSiteAccessPermissionForExtension:(id)a3;
- (void)findExtensions;
- (void)loadEnabledExtensions;
- (void)loadSuitableDiscoveredExtensions;
- (void)moveLocalStorageForExtension:(id)a3 completionHandler:(id)a4;
- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4;
- (void)readExtensionsStateFromStorage;
- (void)reloadExtensionStateFromStorage;
- (void)remotelyEnabledExtensionBannerWasShownForComposedIdentifier:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetExtensionsStateAndReloadExtensions;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3 isEnabled:(BOOL)a4;
- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 dueToUserGesture:(BOOL)a5 skipSavingToStorage:(BOOL)a6;
- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 skipSavingToStorage:(BOOL)a5;
- (void)setExtensionWithComposedIdentifier:(id)a3 isEnabledInCloud:(BOOL)a4;
- (void)setProfileServerID:(id)a3;
- (void)test_enableExtension:(id)a3 withResourceURL:(id)a4;
- (void)unloadAndDeleteStateForAllExtensions;
- (void)unloadExtensionIfNecessary:(id)a3;
- (void)writeExtensionsStateToStorageWithCompletionHandler:(id)a3;
@end

@implementation WBSExtensionsController

- (NSString)profileServerID
{
  return self->_profileServerID;
}

- (id)extensionDataForExtension:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (!self->_extensionUniqueIdentifierToExtensionDataMap)
    {
      v5 = [MEMORY[0x1E4F1CA60] dictionary];
      extensionUniqueIdentifierToExtensionDataMap = self->_extensionUniqueIdentifierToExtensionDataMap;
      self->_extensionUniqueIdentifierToExtensionDataMap = v5;
    }
    v7 = objc_msgSend(v4, "sf_uniqueIdentifier");
    if (v7)
    {
      v8 = [(NSMutableDictionary *)self->_extensionUniqueIdentifierToExtensionDataMap objectForKeyedSubscript:v7];
      if (!v8)
      {
        v8 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_extensionDataClass")), "initWithExtension:extensionsController:", v4, self);
        if (v8)
        {
          [(NSMutableDictionary *)self->_extensionUniqueIdentifierToExtensionDataMap setObject:v8 forKeyedSubscript:v7];
        }
        else
        {
          v10 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v11 = [v4 identifier];
            int v12 = 138412290;
            v13 = v11;
            _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Extension with identifier %@ failed to initialize", (uint8_t *)&v12, 0xCu);
          }
          [(WBSExtensionsController *)self _disableAndBlockExtension:v4];
          v8 = 0;
        }
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)extensionWithComposedIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    allDiscoveredExtensions = self->_allDiscoveredExtensions;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__WBSExtensionsController_extensionWithComposedIdentifier___block_invoke;
    v8[3] = &unk_1E5E418B0;
    v8[4] = self;
    id v9 = v4;
    v6 = [(NSArray *)allDiscoveredExtensions safari_firstObjectPassingTest:v8];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)enabledExtensions
{
  return (NSArray *)[(NSMutableSet *)self->_enabledExtensions allObjects];
}

- (NSMutableArray)extensions
{
  return self->_extensions;
}

- (WKUserContentController)userContentController
{
  return self->_userContentController;
}

- (BOOL)loadEnabledExtensionsWasCalled
{
  return self->_loadEnabledExtensionsWasCalled;
}

- (BOOL)hasDiscoveredExtensions
{
  return self->_hasDiscoveredExtensions;
}

uint64_t __51__WBSExtensionsController__beginExtensionDiscovery__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) resume];
}

- (void)setDelegate:(id)a3
{
}

- (WBSExtensionsController)initWithProfileServerID:(id)a3 userContentController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WBSExtensionsController *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    profileServerID = v8->_profileServerID;
    v8->_profileServerID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_userContentController, a4);
    v11 = v8;
  }

  return v8;
}

- (WBSExtensionsController)init
{
  v23.receiver = self;
  v23.super_class = (Class)WBSExtensionsController;
  v2 = [(WBSExtensionsController *)&v23 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__extensionsWereGloballyEnabled name:*MEMORY[0x1E4F985C8] object:0];
    [v5 addObserver:v2 selector:sel__extensionsWereGloballyDisabled name:*MEMORY[0x1E4F985C0] object:0];
    id v6 = objc_alloc_init(WBSExtensionsAnalyticsEventCoalescer);
    analyticsEventCoalescer = v2->_analyticsEventCoalescer;
    v2->_analyticsEventCoalescer = v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    enabledExtensions = v2->_enabledExtensions;
    v2->_enabledExtensions = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v10;

    [v5 addObserver:v2 selector:sel__managedExtensionStateDidChange name:*MEMORY[0x1E4F98678] object:0];
    id v12 = [NSString stringWithFormat:@"com.apple.Safari.WBSExtensionsController.%@.%p._appBundleValidationQueue", objc_opt_class(), v2];
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
    appBundleValidationQueue = v2->_appBundleValidationQueue;
    v2->_appBundleValidationQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)MEMORY[0x1E4F98300];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __31__WBSExtensionsController_init__block_invoke;
    v21[3] = &unk_1E5E416B8;
    v16 = v2;
    v22 = v16;
    uint64_t v17 = [v15 registeredStateCollectorWithLogLabel:@"Safari Extensions State" payloadProvider:v21];
    diagnosticStateCollector = v16->_diagnosticStateCollector;
    v16->_diagnosticStateCollector = (WBSDiagnosticStateCollector *)v17;

    v19 = v16;
  }

  return v2;
}

- (WKWebsiteDataStore)websiteDataStore
{
  if (self->_profileServerID)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F46710], "safari_dataStoreForProfileWithIdentifier:");
  }
  else
  {
    v2 = 0;
  }

  return (WKWebsiteDataStore *)v2;
}

- (id)composedIdentifierForExtensionStateForExtension:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [v4 identifier];
  id v7 = [(WBSExtensionsController *)self _developerIdentifierForExtension:v4];
  uint64_t v8 = [v5 _composedIdentifierForStateOfExtensionWithBundleIdentifier:v6 developerIdentifier:v7];

  return v8;
}

- (id)_developerIdentifierForExtension:(id)a3
{
  uint64_t v3 = [(WBSExtensionsController *)self _developerIdentifierForExtension:a3 untrustedCodeSigningDictionary:0];

  return v3;
}

- (void)loadEnabledExtensions
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(WBSExtensionsController *)self extensionsEnabled] && !self->_loadEnabledExtensionsWasCalled)
  {
    self->_loadEnabledExtensionsWasCalled = 1;
    if (+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", self->_profileServerID)&& ([(id)objc_opt_class() _extensionDefaults], v3 = objc_claimAutoreleasedReturnValue(), objc_msgSend((id)objc_opt_class(), "_skipLoadingEnabledExtensionsAtLaunchPreferenceKey"), id v4 = objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v3, "BOOLForKey:", v4), v4, v3, v5))
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB70000, v6, OS_LOG_TYPE_INFO, "Skipping loading enabled extensions at launch because there aren't any", buf, 2u);
      }
    }
    else
    {
      id v7 = [(WBSExtensionsController *)self readExtensionsStateFromStorage];
      uint64_t v8 = (NSMutableDictionary *)[v7 mutableCopy];
      extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
      self->_extensionIdentifierToStateMap = v8;

      if (self->_extensionIdentifierToStateMap)
      {
        [(WBSExtensionsController *)self disableUnsignedExtensionsIfNecessary];
        uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
        v11 = [MEMORY[0x1E4F1CA48] array];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v12 = self->_extensionIdentifierToStateMap;
        uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v28 objects:v35 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v17 = [(id)objc_opt_class() _extensionFromComposedIdentifier:v16];
              if (v17) {
                [v11 addObject:v17];
              }
              else {
                [v10 addObject:v16];
              }
            }
            uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v28 objects:v35 count:16];
          }
          while (v13);
        }

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v18 = v10;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v25 != v20) {
                objc_enumerationMutation(v18);
              }
              uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * j);
              objc_super v23 = WBS_LOG_CHANNEL_PREFIXExtensions();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                uint64_t v33 = v22;
                _os_log_impl(&dword_1ABB70000, v23, OS_LOG_TYPE_INFO, "Extension with composed identifier %{private}@ was removed", buf, 0xCu);
              }
              [(WBSExtensionsController *)self _updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:v22];
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v34 count:16];
          }
          while (v19);
        }

        [(WBSExtensionsController *)self _deleteStateForRemovedExtensionsSoon];
        self->_loadingEnabledExtensionsAtStartup = 1;
        [(WBSExtensionsController *)self _loadExtensions:v11];
        self->_loadingEnabledExtensionsAtStartup = 0;
      }
    }
  }
}

- (void)_beginExtensionDiscovery
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!self->_extensionMatchingContext
    && [(WBSExtensionsController *)self _supportsExtensionDiscovery]
    && !self->_extensionKitQueryController)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F25880]);
    id v4 = [(id)objc_opt_class() _extensionPointIdentifier];
    int v5 = (void *)[v3 initWithExtensionPointIdentifier:v4];

    [v5 setExcludeLockedApps:1];
    id v6 = objc_alloc(MEMORY[0x1E4F25888]);
    v12[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v8 = (_EXQueryController *)[v6 initWithQueries:v7 delegate:self];
    extensionKitQueryController = self->_extensionKitQueryController;
    self->_extensionKitQueryController = v8;

    uint64_t v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__WBSExtensionsController__beginExtensionDiscovery__block_invoke;
    block[3] = &unk_1E5E408C0;
    block[4] = self;
    dispatch_async(v10, block);
  }
}

- (void)findExtensions
{
  if ([(WBSExtensionsController *)self extensionsEnabled])
  {
    if ([(WBSExtensionsController *)self _supportsExtensionDiscovery])
    {
      [(WBSExtensionsController *)self _beginExtensionDiscovery];
    }
    else
    {
      [(WBSExtensionsController *)self _populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile];
    }
  }
}

- (BOOL)_supportsExtensionDiscovery
{
  return +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:self->_profileServerID];
}

id __31__WBSExtensionsController_init__block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "safari_arrayByMappingObjectsUsingBlock:", &__block_literal_global_9);
  id v3 = [*v1 profile];
  id v4 = [v3 identifier];

  if (!v4)
  {
    int v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __31__WBSExtensionsController_init__block_invoke_cold_1();
    }
    id v4 = @"Unknown";
  }
  uint64_t v6 = *MEMORY[0x1E4F98540];
  v10[0] = *MEMORY[0x1E4F98548];
  v10[1] = v6;
  id v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    id v7 = v2;
  }
  v11[0] = v4;
  v11[1] = v7;
  v10[2] = *MEMORY[0x1E4F98550];
  v11[2] = @"Extensions";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

id __31__WBSExtensionsController_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];

  return v2;
}

- (WBSExtensionsController)initWithProfileServerID:(id)a3 userContentController:(id)a4 forceExtensionLoadingAfterDiscovery:(BOOL)a5
{
  uint64_t v6 = [(WBSExtensionsController *)self initWithProfileServerID:a3 userContentController:a4];
  id v7 = v6;
  if (v6)
  {
    v6->_forceExtensionLoadingAfterDiscovery = a5;
    uint64_t v8 = v6;
  }

  return v7;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WBSExtensionsController;
  [(WBSExtensionsController *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  -[NSPointerArray addPointer:](self->_observers, "addPointer:");
  [(NSPointerArray *)self->_observers compact];
  if ([(NSPointerArray *)self->_observers count] == 1) {
    [(WBSExtensionsController *)self _beginExtensionDiscovery];
  }
  if (self->_extensions) {
    [v4 extensionsControllerExtensionListDidChange:self];
  }
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  [(NSPointerArray *)self->_observers compact];
  id v4 = [(NSPointerArray *)self->_observers allObjects];
  uint64_t v5 = [v4 indexOfObject:v6];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSPointerArray *)self->_observers removePointerAtIndex:v5];
  }
  [(NSPointerArray *)self->_observers compact];
  if (![(NSPointerArray *)self->_observers count]) {
    [(WBSExtensionsController *)self _endExtensionDiscovery];
  }
}

- (BOOL)_supportsCodeSigningChecks
{
  return +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:self->_profileServerID];
}

- (id)_extensionsControllerForDefaultProfile
{
  v2 = [(WBSExtensionsController *)self allProfileExtensionsControllers];
  id v3 = objc_msgSend(v2, "safari_firstObjectPassingTest:", &__block_literal_global_36);

  return v3;
}

BOOL __65__WBSExtensionsController__extensionsControllerForDefaultProfile__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 profileServerID];
  BOOL v3 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v2];

  return v3;
}

- (void)_populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __102__WBSExtensionsController__populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile__block_invoke;
  v2[3] = &unk_1E5E41700;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __102__WBSExtensionsController__populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[163])
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained _extensionsControllerForDefaultProfile];
    if ([v2 hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce])
    {
      id v3 = [v2 allDiscoveredExtensions];
      [v4 _beginMatchingExtensionsWithAttributesCompletedWithMatchingExtensions:v3];
    }
    WeakRetained = v4;
  }
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  id v5 = a3;
  id v6 = [v5 extensionIdentities];
  id v7 = objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_43);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__WBSExtensionsController_queryControllerDidUpdate_resultDifference___block_invoke_2;
  v9[3] = &unk_1E5E407D0;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

id __69__WBSExtensionsController_queryControllerDidUpdate_resultDifference___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F28C70] extensionWithIdentity:a2 error:0];

  return v2;
}

uint64_t __69__WBSExtensionsController_queryControllerDidUpdate_resultDifference___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _extensionDiscoveryHasNewResults:*(void *)(a1 + 40)];
}

- (void)_extensionDiscoveryHasNewResults:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_INFO, "Discovered these extensions: %@", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = [(WBSExtensionsController *)self allProfileExtensionsControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _beginMatchingExtensionsWithAttributesCompletedWithMatchingExtensions:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_msgSend((id)objc_opt_class(), "_didDiscoverExtensions:", objc_msgSend(v4, "count") != 0);
}

- (void)_beginMatchingExtensionsWithAttributesCompletedWithMatchingExtensions:(id)a3
{
  id v4 = a3;
  self->_hasDiscoveredExtensions = 1;
  id v7 = v4;
  id v5 = (NSArray *)[v4 copy];
  allDiscoveredExtensions = self->_allDiscoveredExtensions;
  self->_allDiscoveredExtensions = v5;

  self->_hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce = 1;
  if (self->_loadEnabledExtensionsWasCalled || self->_forceExtensionLoadingAfterDiscovery) {
    [(WBSExtensionsController *)self loadSuitableDiscoveredExtensions];
  }
}

- (void)_endExtensionDiscovery
{
  extensionKitQueryController = self->_extensionKitQueryController;
  if (extensionKitQueryController)
  {
    [(_EXQueryController *)extensionKitQueryController suspend];
    id v4 = self->_extensionKitQueryController;
    self->_extensionKitQueryController = 0;
  }
}

- (void)loadSuitableDiscoveredExtensions
{
  if ([(WBSExtensionsController *)self extensionsEnabled] && !self->_loadingDiscoveredExtensions)
  {
    self->_loadingDiscoveredExtensions = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke;
    v8[3] = &unk_1E5E408C0;
    v8[4] = self;
    uint64_t v3 = MEMORY[0x1AD115160](v8);
    id v4 = (void *)v3;
    if (self->_extensionIdentifierToStateMap)
    {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }
    else
    {
      id v5 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke_2;
      block[3] = &unk_1E5E41040;
      block[4] = self;
      id v7 = v4;
      dispatch_async(v5, block);
    }
  }
}

void __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadExtensions:*(void *)(*(void *)(a1 + 32) + 176)];
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 112) copy];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "extensionsControllerExtensionListDidChange:", *(void *)(a1 + 32), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) _notifyObserversContentBlockerListDidChange];
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
}

void __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) readExtensionsStateFromStorage];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke_3;
  block[3] = &unk_1E5E41018;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

+ (id)_extensionDefaults
{
  return (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
}

- (id)lastSeenBaseURIForExtension:(id)a3
{
  uint64_t v3 = [(WBSExtensionsController *)self _extensionStateForExtension:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
    id v6 = [v3 objectForKeyedSubscript:@"LastSeenBaseURI"];
    id v7 = [v5 URLWithString:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)lastSeenBaseURIForExtension:(id)a3 updatingWithCurrentBaseURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(WBSExtensionsController *)self _extensionStateForExtension:v6];
  long long v9 = (void *)[v8 mutableCopy];

  if (!v9)
  {
    long long v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  long long v10 = (void *)MEMORY[0x1E4F1CB10];
  long long v11 = [v9 objectForKeyedSubscript:@"LastSeenBaseURI"];
  uint64_t v12 = [v10 URLWithString:v11];

  long long v13 = [v7 absoluteString];
  [v9 setObject:v13 forKeyedSubscript:@"LastSeenBaseURI"];

  uint64_t v14 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v6];
  [(WBSExtensionsController *)self _setExtensionIdentifierToStateMap:v9 forExtensionWithComposedIdentifier:v14];

  return v12;
}

- (void)moveLocalStorageForExtension:(id)a3 completionHandler:(id)a4
{
  id v15 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(WBSExtensionsController *)self extensionDataForExtension:v15];
  long long v8 = [v7 safariExtensionBaseURI];
  long long v9 = [(WBSExtensionsController *)self lastSeenBaseURIForExtension:v15 updatingWithCurrentBaseURI:v8];
  long long v10 = v9;
  if (v9
    && ([v9 host],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        [v8 host],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v11 isEqualToString:v12],
        v12,
        v11,
        !v13))
  {
    {
      -[WBSExtensionsController moveLocalStorageForExtension:completionHandler:]::dataTypes = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F467F0], *MEMORY[0x1E4F467F8], 0);
    }
    uint64_t v14 = [(WBSExtensionsController *)self websiteDataStore];
    [v14 _renameOrigin:v10 to:v8 forDataOfTypes:-[WBSExtensionsController moveLocalStorageForExtension:completionHandler:]::dataTypes completionHandler:v6];
  }
  else
  {
    v6[2](v6);
  }
}

+ (Class)_extensionDataClass
{
  return (Class)objc_opt_class();
}

- (void)_loadExtensions:(id)a3
{
}

- (void)_loadExtensions:(id)a3 skipEqualityCheck:(BOOL)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  if (v54 && (!WBSIsEqual() || a4))
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      long long v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138412547;
      v77 = v8;
      __int16 v78 = 2113;
      id v79 = v54;
      _os_log_impl(&dword_1ABB70000, v6, OS_LOG_TYPE_INFO, "Loading extensions in class %@: %{private}@ ", buf, 0x16u);
    }
    if (!self->_extensionIdentifierToStateMap)
    {
      long long v9 = [(WBSExtensionsController *)self readExtensionsStateFromStorage];
      long long v10 = (NSMutableDictionary *)[v9 mutableCopy];
      extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
      self->_extensionIdentifierToStateMap = v10;
    }
    uint64_t v12 = (NSMutableSet *)[(NSMutableSet *)self->_replacedExtensions mutableCopy];
    blockedExtensions = self->_blockedExtensions;
    self->_blockedExtensions = v12;

    v52 = [MEMORY[0x1E4F1CA80] set];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v14 = self->_extensions;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v68 objects:v75 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v69 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          if (([v54 containsObject:v18] & 1) == 0)
          {
            uint64_t v19 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              uint64_t v20 = [v18 identifier];
              *(_DWORD *)buf = 138412290;
              v77 = v20;
              _os_log_impl(&dword_1ABB70000, v19, OS_LOG_TYPE_INFO, "Extension with identifier %@ was removed", buf, 0xCu);
            }
            [(WBSExtensionsController *)self unloadExtensionIfNecessary:v18];
            v21 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v18];
            [(WBSExtensionsController *)self _updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:v21];

            [(WBSExtensionsController *)self _removeSafariExtensionDataForExtension:v18];
            [v52 addObject:v18];
          }
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v68 objects:v75 count:16];
      }
      while (v15);
    }

    v51 = [MEMORY[0x1E4F1CA80] set];
    v53 = [MEMORY[0x1E4F1CA48] array];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v22 = v54;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v23)
    {
      uint64_t v25 = *(void *)v65;
      *(void *)&long long v24 = 138412290;
      long long v50 = v24;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v65 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          if ((-[NSMutableArray containsObject:](self->_extensions, "containsObject:", v27, v50) & 1) == 0) {
            [v51 addObject:v27];
          }
          long long v28 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            long long v29 = [v27 identifier];
            *(_DWORD *)buf = v50;
            v77 = v29;
            _os_log_impl(&dword_1ABB70000, v28, OS_LOG_TYPE_INFO, "Extension with identifier %@ was added", buf, 0xCu);
          }
          buf[0] = 0;
          [(WBSExtensionsController *)self _validateAndLoadExtensionIfNecessary:v27 attemptRetryOnFailure:1 isExtensionNewlyInstalled:buf];
          if (buf[0]) {
            [v53 addObject:v27];
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v23);
    }

    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __61__WBSExtensionsController__loadExtensions_skipEqualityCheck___block_invoke;
    v63[3] = &unk_1E5E41748;
    v63[4] = self;
    long long v30 = objc_msgSend(v22, "safari_filterObjectsUsingBlock:", v63);
    long long v31 = (NSMutableArray *)[v30 mutableCopy];
    extensions = self->_extensions;
    self->_extensions = v31;

    if (!self->_allDiscoveredExtensions)
    {
      self->_hasDiscoveredExtensions = 1;
      uint64_t v33 = (NSArray *)[(NSMutableArray *)self->_extensions copy];
      allDiscoveredExtensions = self->_allDiscoveredExtensions;
      self->_allDiscoveredExtensions = v33;
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v35 = v51;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v60;
      uint64_t v38 = *MEMORY[0x1E4F98568];
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v60 != v37) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v59 + 1) + 8 * k);
          if (([(NSMutableSet *)self->_blockedExtensions containsObject:v40] & 1) == 0)
          {
            v41 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v40];
            [(WBSExtensionsController *)self _updateExtensionStateAfterExtensionWasAddedWithComposedIdentifier:v41];

            v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v42 postNotificationName:v38 object:v40];
          }
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v59 objects:v73 count:16];
      }
      while (v36);
    }

    if ([v35 count]) {
      [(WBSExtensionsController *)self _updateExtensionNewTabPageIfNecessary];
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v43 = v52;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v55 objects:v72 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v56;
      uint64_t v46 = *MEMORY[0x1E4F98570];
      do
      {
        for (uint64_t m = 0; m != v44; ++m)
        {
          if (*(void *)v56 != v45) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = *(void *)(*((void *)&v55 + 1) + 8 * m);
          v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v49 postNotificationName:v46 object:v48];
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v55 objects:v72 count:16];
      }
      while (v44);
    }

    [(WBSExtensionsController *)self _showNewExtensionBannerIfNecessaryForExtensions:v53];
    [(WBSExtensionsController *)self _finishedLoadingExtensions];
  }
  else
  {
    [(WBSExtensionsController *)self _finishedLoadingExtensions];
  }
}

uint64_t __61__WBSExtensionsController__loadExtensions_skipEqualityCheck___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) containsObject:a2] ^ 1;
}

- (void)_validateAndLoadExtensionIfNecessary:(id)a3 attemptRetryOnFailure:(BOOL)a4 isExtensionNewlyInstalled:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (([(NSMutableSet *)self->_enabledExtensions containsObject:v8] & 1) == 0)
  {
    long long v9 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = [v8 identifier];
      *(_DWORD *)buf = 138477827;
      long long v30 = v10;
      _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_INFO, "Loading extension with identifier: %{private}@", buf, 0xCu);
    }
    long long v11 = [(WBSExtensionsController *)self extensionDataForExtension:v8];
    if (v11)
    {
      uint64_t v12 = [(WBSExtensionsController *)self _extensionsControllerForDefaultProfile];
      int v13 = [v12 _computeCodeSigningDictionaryOnDiskForExtension:v8 attemptRetryOnFailure:v6];

      if (v13)
      {
        uint64_t v14 = [(WBSExtensionsController *)self _developerIdentifierForExtension:v8 untrustedCodeSigningDictionary:v13];
        if (![(WBSExtensionsController *)self _isExtensionBlockedByBlocklist:v8 developerIdentifier:v14])
        {
          uint64_t v15 = [(WBSExtensionsController *)self _extensionsControllerForDefaultProfile];
          [v15 _validateContainingAppOfExtensionIfNecessary:v8 attemptRetryOnFailure:v6];

          [(WBSExtensionsController *)self _replaceExtensionsObsoletedByExtension:v8 developerIdentifier:v14];
          uint64_t v16 = [(WBSExtensionsController *)self _extensionStateForExtension:v8];
          LODWORD(v15) = v16 == 0;

          if (v15)
          {
            uint64_t v17 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              id v18 = [v8 identifier];
              *(_DWORD *)buf = 138412290;
              long long v30 = v18;
              _os_log_impl(&dword_1ABB70000, v17, OS_LOG_TYPE_INFO, "Extension with identifier %@ was installed", buf, 0xCu);
            }
            if (a5) {
              *a5 = 1;
            }
          }
          if (self->_loadEnabledExtensionsWasCalled)
          {
            [(WBSExtensionsController *)self _updateExtensionStateIfThisVersionOfSafariIsNotSupported:v8];
            [(WBSExtensionsController *)self _updateExtensionStateIfPermissionsIncreased:v8];
            [(WBSExtensionsController *)self _updateExtensionStateWithPrivacyPreservingProfileIdentifierIfNeeded:v8];
            if ([(WBSExtensionsController *)self _extensionShouldBeEnabled:v8])
            {
              [(NSMutableSet *)self->_enabledExtensions addObject:v8];
              [(WBSExtensionsController *)self _grantRequestedPermissionsIfNecessaryForExtension:v11];
              uint64_t v19 = [v8 _extensionBundle];
              uint64_t v20 = [v19 resourceURL];
              long long v28 = [v20 absoluteURL];

              id v21 = v11;
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass) {
                uint64_t v23 = v21;
              }
              else {
                uint64_t v23 = 0;
              }
              id v24 = v23;

              if (isKindOfClass)
              {
                uint64_t v25 = [v21 resourcesDirectoryURL];

                long long v28 = (void *)v25;
              }

              [(WBSExtensionsController *)self _addExtensionToBaseURIMap:v8 withResourceURL:v28];
              [(WBSExtensionsController *)self _loadEnabledExtension:v8];
              [(WBSExtensionsController *)self _updateExtensionsCrashReporterMessage];
              [(WBSExtensionsController *)self _connectToExtensionForValidation:v8 untrustedCodeSigningDictionary:v13 attemptRetryOnFailure:v6];
              if (a5) {
                *a5 = 0;
              }
            }
          }
        }
      }
    }
    else
    {
      long long v26 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        long long v27 = [v8 identifier];
        *(_DWORD *)buf = 138412290;
        long long v30 = v27;
        _os_log_impl(&dword_1ABB70000, v26, OS_LOG_TYPE_INFO, "Failed to load data for extension with identifier %@", buf, 0xCu);
      }
      [(WBSExtensionsController *)self _disableAndBlockExtension:v8];
    }
  }
}

- (BOOL)_extensionShouldBeEnabled:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_extensionIdentifierToStateMap)
  {
    uint64_t v5 = [(WBSExtensionsController *)self readExtensionsStateFromStorage];
    BOOL v6 = (NSMutableDictionary *)[v5 mutableCopy];
    extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
    self->_extensionIdentifierToStateMap = v6;
  }
  id v8 = [(WBSExtensionsController *)self _extensionStateForExtension:v4];
  uint64_t v9 = *MEMORY[0x1E4F98800];
  long long v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F98800]];

  if (v10) {
    int v11 = objc_msgSend(v8, "safari_BOOLForKey:", v9);
  }
  else {
    int v11 = [(WBSExtensionsController *)self _extensionShouldBeAutomaticallyEnabled:v4];
  }
  LODWORD(v12) = v11;
  int v13 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v4];
  uint64_t v14 = [MEMORY[0x1E4F98348] sharedController];
  uint64_t v15 = [v14 managedExtensionStateForComposedIdentifier:v13];

  if (v15 == 1) {
    char v16 = (char)v12;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    uint64_t v19 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v21 = 138477827;
      id v22 = v13;
      _os_log_impl(&dword_1ABB70000, v19, OS_LOG_TYPE_INFO, "Enabling extension %{private}@ due to managed extension configuration", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v12 = (void *)[v8 mutableCopy];
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v9];
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F98848]];
    [(WBSExtensionsController *)self _setExtensionState:v12 forExtension:v4];
    goto LABEL_20;
  }
  if (v15 == 2) {
    int v17 = (int)v12;
  }
  else {
    int v17 = 0;
  }
  if (v17 == 1)
  {
    id v18 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v21 = 138477827;
      id v22 = v13;
      _os_log_impl(&dword_1ABB70000, v18, OS_LOG_TYPE_INFO, "Disabling extension %{private}@ due to managed extension configuration", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v12 = (void *)[v8 mutableCopy];
    [v12 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v9];
    [(WBSExtensionsController *)self _setExtensionState:v12 forExtension:v4];
LABEL_20:

    LOBYTE(v12) = v16 ^ 1;
  }

  return (char)v12;
}

- (BOOL)_extensionShouldBeAutomaticallyEnabled:(id)a3
{
  return 0;
}

- (id)_extensionStateForExtension:(id)a3
{
  id v4 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:a3];
  uint64_t v5 = [(NSMutableDictionary *)self->_extensionIdentifierToStateMap safari_dictionaryForKey:v4];

  return v5;
}

- (void)_writeExtensionsStateToStorage
{
}

- (void)writeExtensionsStateToStorageWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_INFO, "writeExtensionsStateToStorageWithCompletionHandler:", buf, 2u);
  }
  BOOL v6 = [(WBSExtensionsController *)self _urlForExtensionSettings];
  if (v6)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke;
    v22[3] = &unk_1E5E41770;
    v22[4] = self;
    id v23 = v4;
    id v7 = (void *)MEMORY[0x1AD115160](v22);
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
    id v21 = 0;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke_55;
    uint64_t v19 = &unk_1E5E41798;
    id v9 = v7;
    id v20 = v9;
    [v8 coordinateWritingItemAtURL:v6 options:8 error:&v21 byAccessor:&v16];
    id v10 = v21;
    if (v10)
    {
      int v11 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "safari_privacyPreservingDescription", v16, v17, v18, v19);
        objc_claimAutoreleasedReturnValue();
        -[WBSExtensionsController writeExtensionsStateToStorageWithCompletionHandler:]();
      }
    }
    if (+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", self->_profileServerID, v16, v17, v18, v19))
    {
      uint64_t v12 = [(id)objc_opt_class() _extensionDefaults];
      BOOL v13 = [(WBSExtensionsController *)self hasAnyEnabledExtensionsInStorage];
      uint64_t v14 = [(id)objc_opt_class() _skipLoadingEnabledExtensionsAtLaunchPreferenceKey];
      [v12 setBool:!v13 forKey:v14];
    }
  }
  else
  {
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WBSExtensionsController writeExtensionsStateToStorageWithCompletionHandler:]();
    }
  }
}

void __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v9[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  v9[0] = 0;
  char v5 = [v4 writeToURL:v3 error:v9];
  id v6 = v9[0];
  if ((v5 & 1) == 0)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

uint64_t __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadExtensionStateFromStorage
{
  id v5 = [(WBSExtensionsController *)self readExtensionsStateFromStorage];
  id v3 = (NSMutableDictionary *)[v5 mutableCopy];
  extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  self->_extensionIdentifierToStateMap = v3;
}

- (id)readExtensionsStateFromStorage
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(WBSExtensionsController *)self _urlForExtensionSettings];
  if (v2)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__3;
    uint64_t v19 = __Block_byref_object_dispose__3;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__WBSExtensionsController_readExtensionsStateFromStorage__block_invoke;
    v14[3] = &unk_1E5E417C0;
    v14[4] = &v15;
    id v3 = (void *)MEMORY[0x1AD115160](v14);
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
    id v13 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__WBSExtensionsController_readExtensionsStateFromStorage__block_invoke_2;
    v11[3] = &unk_1E5E41798;
    id v5 = v3;
    id v12 = v5;
    [v4 coordinateReadingItemAtURL:v2 options:1 error:&v13 byAccessor:v11];
    id v6 = v13;
    if (v6)
    {
      id v7 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSExtensionsController readExtensionsStateFromStorage]();
      }

      id v8 = (id)MEMORY[0x1E4F1CC08];
    }
    else
    {
      id v8 = (id)v16[5];
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WBSExtensionsController writeExtensionsStateToStorageWithCompletionHandler:]();
    }
    id v8 = [MEMORY[0x1E4F1C9E8] dictionary];
  }

  return v8;
}

void __57__WBSExtensionsController_readExtensionsStateFromStorage__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:");
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v4);
  if (!v3) {
}
  }

uint64_t __57__WBSExtensionsController_readExtensionsStateFromStorage__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setExtensionIdentifierToStateMap:(id)a3 forExtensionWithComposedIdentifier:(id)a4
{
}

- (void)_setExtensionIdentifierToStateMap:(id)a3 forExtensionWithComposedIdentifier:(id)a4 completionHandler:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  if (!extensionIdentifierToStateMap)
  {
    int v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = self->_extensionIdentifierToStateMap;
    self->_extensionIdentifierToStateMap = v11;

    extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  }
  id v13 = [(NSMutableDictionary *)extensionIdentifierToStateMap safari_dictionaryForKey:v8];
  char v14 = [v13 isEqualToDictionary:v15];

  if ((v14 & 1) == 0)
  {
    [(NSMutableDictionary *)self->_extensionIdentifierToStateMap setObject:v15 forKeyedSubscript:v8];
    [(WBSExtensionsController *)self writeExtensionsStateToStorageWithCompletionHandler:v9];
  }
}

- (void)_updateExtensionStateAfterExtensionWasAddedWithComposedIdentifier:(id)a3
{
  id v12 = a3;
  id v4 = -[NSMutableDictionary safari_dictionaryForKey:](self->_extensionIdentifierToStateMap, "safari_dictionaryForKey:");
  id v5 = (void *)[v4 mutableCopy];

  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v6 = *MEMORY[0x1E4F98538];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F98538]];
  if (v7)
  {

    uint64_t v8 = *MEMORY[0x1E4F98530];
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F98530];
    int v11 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F98530]];

    if (v11) {
      goto LABEL_9;
    }
  }
  id v9 = [v5 objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F1C9C8] now];
    [v5 setObject:v10 forKeyedSubscript:v8];
  }
  [v5 setObject:0 forKeyedSubscript:v6];
  [(WBSExtensionsController *)self _setExtensionIdentifierToStateMap:v5 forExtensionWithComposedIdentifier:v12];
LABEL_9:
}

- (void)_resetExtensionsState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSMutableDictionary *)self->_extensionIdentifierToStateMap copy];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  self->_extensionIdentifierToStateMap = v4;

  [(WBSExtensionsController *)self _writeExtensionsStateToStorage];
  enabledExtensions = self->_enabledExtensions;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__WBSExtensionsController__resetExtensionsState__block_invoke;
  v15[3] = &unk_1E5E417E8;
  v15[4] = self;
  [(NSMutableSet *)enabledExtensions enumerateObjectsUsingBlock:v15];
  [(NSMutableSet *)self->_enabledExtensions removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[WBSExtensionsController _deleteStorageForExtensionWithComposedIdentifier:](self, "_deleteStorageForExtensionWithComposedIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

void __48__WBSExtensionsController__resetExtensionsState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 identifier];
    int v7 = 138477827;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "Unloading extension with identifier %{private}@ because we are resetting extensions state", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) unloadExtensionIfNecessary:v3];
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:*MEMORY[0x1E4F984D0] object:v3];
}

- (void)resetExtensionsStateAndReloadExtensions
{
  [(WBSExtensionsController *)self _resetExtensionsState];
  id v5 = self->_extensions;
  id v3 = [MEMORY[0x1E4F1CA48] array];
  extensions = self->_extensions;
  self->_extensions = v3;

  [(WBSExtensionsController *)self _loadExtensions:v5];
}

- (BOOL)hasAnyEnabledExtensionsInStorage
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = self->_extensionIdentifierToStateMap;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = *MEMORY[0x1E4F98800];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMutableDictionary safari_dictionaryForKey:](self->_extensionIdentifierToStateMap, "safari_dictionaryForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        char v9 = objc_msgSend(v8, "safari_BOOLForKey:", v6);

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasAnyEnabledExtensions
{
  return [(NSMutableSet *)self->_enabledExtensions count] != 0;
}

- (NSDictionary)extensionIdentifierToBaseURIMap
{
  uint64_t v2 = (void *)[(NSMutableDictionary *)self->_extensionIdentifierToBaseURIMap copy];

  return (NSDictionary *)v2;
}

- (BOOL)extensionIsEnabled:(id)a3
{
  id v4 = a3;
  BOOL v5 = ([(NSMutableSet *)self->_enabledExtensions containsObject:v4] & 1) != 0
    || [(WBSExtensionsController *)self _extensionShouldBeEnabled:v4];

  return v5;
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4
{
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 skipSavingToStorage:(BOOL)a5
{
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 dueToUserGesture:(BOOL)a5 skipSavingToStorage:(BOOL)a6
{
  int v8 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  long long v11 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v10];
  long long v12 = [(NSMutableDictionary *)self->_extensionIdentifierToStateMap objectForKeyedSubscript:v11];
  long long v13 = (void *)[v12 mutableCopy];
  long long v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v16 = v15;

  if (a6 || objc_msgSend(v16, "safari_BOOLForKey:", *MEMORY[0x1E4F98800]) != v8)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke;
    v29[3] = &unk_1E5E41810;
    char v33 = v8;
    BOOL v34 = a5;
    id v30 = v16;
    uint64_t v31 = self;
    id v32 = v11;
    BOOL v35 = a6;
    uint64_t v17 = (void (**)(void))MEMORY[0x1AD115160](v29);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke_2;
    v26[3] = &unk_1E5E407D0;
    id v18 = v10;
    id v27 = v18;
    long long v28 = self;
    uint64_t v19 = (void *)MEMORY[0x1AD115160](v26);
    if (v8)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke_60;
      v23[3] = &unk_1E5E41838;
      id v24 = v17;
      id v25 = v19;
      [(WBSExtensionsController *)self _enableExtension:v18 completionHandler:v23];

      id v20 = v24;
    }
    else
    {
      v17[2](v17);
      uint64_t v21 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = [v18 identifier];
        *(_DWORD *)buf = 138477827;
        uint64_t v37 = v22;
        _os_log_impl(&dword_1ABB70000, v21, OS_LOG_TYPE_INFO, "Extension with identifier %{private}@ was disabled by the user", buf, 0xCu);
      }
      [(WBSExtensionsController *)self unloadExtensionIfNecessary:v18];
      id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 postNotificationName:*MEMORY[0x1E4F984D0] object:v18];
    }

    [(WBSExtensionsController *)self _notifyObserversContentBlockerListDidChange];
  }
}

void __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke(uint64_t a1)
{
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  id v6 = [MEMORY[0x1E4F1C9C8] now];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  if (*(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57))
  {
    int v2 = 1;
    uint64_t v3 = [NSNumber numberWithBool:1];
  }
  else
  {
    int v2 = 0;
    uint64_t v3 = 0;
  }
  id v7 = (id)v3;
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F98848]];
  if (v2) {

  }
  [*(id *)(*(void *)(a1 + 40) + 32) setObject:*(void *)(a1 + 32) forKeyedSubscript:*(void *)(a1 + 48)];
  if (!*(unsigned char *)(a1 + 58)) {
    [*(id *)(a1 + 40) writeExtensionsStateToStorageWithCompletionHandler:0];
  }
  id v8 = +[WBSCloudExtensionStateManager sharedManager];
  [v8 localExtensionStateDidChange];
}

void __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    int v5 = 138477827;
    id v6 = v3;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_INFO, "Extension with identifier %{private}@ was enabled by the user", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 40) _validateAndLoadExtensionIfNecessary:*(void *)(a1 + 32) attemptRetryOnFailure:1 isExtensionNewlyInstalled:0];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x1E4F984D0] object:*(void *)(a1 + 32)];
}

uint64_t __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke_60(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (NSSet)extensionStateKeysToCopy
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F98530];
  v8[0] = *MEMORY[0x1E4F98800];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F987F8];
  v8[2] = *MEMORY[0x1E4F98538];
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E4F98820];
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  id v6 = [v2 setWithArray:v5];

  return (NSSet *)v6;
}

- (void)copyEnabledExtensionStateFromExtensionsController:(id)a3
{
  uint64_t v4 = a3;
  int v5 = [(WBSExtensionsController *)self extensionStateKeysToCopy];
  id v6 = (void *)v4[4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__WBSExtensionsController_copyEnabledExtensionStateFromExtensionsController___block_invoke;
  v11[3] = &unk_1E5E41888;
  id v7 = v5;
  id v12 = v7;
  id v8 = objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v11);
  char v9 = (NSMutableDictionary *)[v8 mutableCopy];
  extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  self->_extensionIdentifierToStateMap = v9;

  [(WBSExtensionsController *)self _writeExtensionsStateToStorage];
}

id __77__WBSExtensionsController_copyEnabledExtensionStateFromExtensionsController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__WBSExtensionsController_copyEnabledExtensionStateFromExtensionsController___block_invoke_2;
  v6[3] = &unk_1E5E41860;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(a3, "safari_mapAndFilterKeysUsingBlock:", v6);

  return v4;
}

id __77__WBSExtensionsController_copyEnabledExtensionStateFromExtensionsController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)unloadAndDeleteStateForAllExtensions
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3_2(&dword_1ABB70000, "Unable to delete profile data for all extensions at %{public}@ with error: %{public}@", v4, v5);
}

- (void)test_enableExtension:(id)a3 withResourceURL:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(NSMutableSet *)self->_enabledExtensions addObject:v10];
  [(NSMutableArray *)self->_extensions addObject:v10];
  allDiscoveredExtensions = self->_allDiscoveredExtensions;
  if (!allDiscoveredExtensions)
  {
    self->_allDiscoveredExtensions = (NSArray *)MEMORY[0x1E4F1CBF0];

    allDiscoveredExtensions = self->_allDiscoveredExtensions;
  }
  id v8 = [(NSArray *)allDiscoveredExtensions arrayByAddingObject:v10];
  char v9 = self->_allDiscoveredExtensions;
  self->_allDiscoveredExtensions = v8;

  [(WBSExtensionsController *)self _addExtensionToBaseURIMap:v10 withResourceURL:v6];
  [(WBSExtensionsController *)self _loadEnabledExtension:v10];
  [(WBSExtensionsController *)self _updateExtensionsCrashReporterMessage];
}

- (void)_updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:(id)a3
{
  id v8 = a3;
  uint64_t v4 = -[NSMutableDictionary safari_dictionaryForKey:](self->_extensionIdentifierToStateMap, "safari_dictionaryForKey:");
  id v5 = (void *)[v4 mutableCopy];

  if (v5)
  {
    id v6 = [v5 objectForKeyedSubscript:@"RemovedDate"];

    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F1C9C8] date];
      [v5 setObject:v7 forKeyedSubscript:@"RemovedDate"];

      [(WBSExtensionsController *)self _setExtensionIdentifierToStateMap:v5 forExtensionWithComposedIdentifier:v8];
      [(WBSExtensionsController *)self _deleteStateForRemovedExtensionsSoon];
    }
  }
}

- (void)_deleteStateForExtensionWithComposedIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_extensionIdentifierToStateMap safari_dictionaryForKey:v4];
  id v6 = v5;
  if (self->_extensionIdentifierToStateMap)
  {
    id v7 = [v5 objectForKeyedSubscript:@"RemovedDate"];

    if (v7)
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138477827;
        id v12 = v4;
        _os_log_impl(&dword_1ABB70000, v8, OS_LOG_TYPE_INFO, "Deleting state for removed extension with composed identifier %{private}@", (uint8_t *)&v11, 0xCu);
      }
      [(NSMutableDictionary *)self->_extensionIdentifierToStateMap setObject:0 forKeyedSubscript:v4];
      char v9 = +[WBSCloudExtensionStateManager sharedManager];
      [v9 localExtensionStateDidChange];

      [(WBSExtensionsController *)self _writeExtensionsStateToStorage];
    }
    else
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138477827;
        id v12 = v4;
        _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Not deleting state for removed extension with composed identifier %{private}@ since it was installed again", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_deleteStateForRemovedExtensions
{
  *(_DWORD *)buf = 134217984;
  *(double *)(buf + 4) = a3;
  _os_log_debug_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_DEBUG, "Scheduling a timer to delete state for removed extensions in %f seconds", buf, 0xCu);
}

- (void)_deleteStateForRemovedExtensionsAfterDelay:(double)a3
{
  [(NSTimer *)self->_deleteStateForRemovedExtensionsTimer invalidate];
  id v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__deleteStateForRemovedExtensionsTimerFired_ selector:0 userInfo:0 repeats:a3];
  deleteStateForRemovedExtensionsTimer = self->_deleteStateForRemovedExtensionsTimer;
  self->_deleteStateForRemovedExtensionsTimer = v5;

  id v7 = self->_deleteStateForRemovedExtensionsTimer;

  [(NSTimer *)v7 setTolerance:1.0];
}

- (void)_deleteStateForRemovedExtensionsSoon
{
}

- (void)_removeSafariExtensionDataForExtension:(id)a3
{
  objc_msgSend(a3, "sf_uniqueIdentifier");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [(NSMutableDictionary *)self->_extensionUniqueIdentifierToExtensionDataMap setObject:0 forKeyedSubscript:v4];
  }
}

- (BOOL)validateAndReadResourceWithExtensionURL:(id)a3 outResourceData:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  id v8 = [v6 host];
  char v9 = [(WBSExtensionsController *)self extensionWithBaseURIHost:v8];

  if (v9) {
    BOOL v10 = [(WBSExtensionsController *)self validateAndReadResourceWithExtensionURL:v7 inExtension:v9 outResourceData:a4];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)validateAndReadResourceWithExtensionURL:(id)a3 inExtension:(id)a4 outResourceData:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  BOOL v10 = [(WBSExtensionsController *)self _extensionsControllerForDefaultProfile];
  int v11 = [v10 extensionDataForExtension:v9];
  uint64_t v12 = [v11 bundleCodeRef];

  BOOL v13 = [(WBSExtensionsController *)self validateAndReadResourceWithExtensionURL:v8 inExtension:v9 codeRef:v12 outResourceData:a5];
  return v13;
}

- (BOOL)validateAndReadResourceWithExtensionURL:(id)a3 inExtension:(id)a4 codeRef:(__SecCode *)a5 outResourceData:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isFileURL])
  {
    id v10 = v8;
  }
  else
  {
    int v11 = (SafariShared::ExtensionURLTranslator *)objc_msgSend(v8, "safari_isSafariExtensionURL");
    if (!v11)
    {
      BOOL v16 = 0;
      goto LABEL_13;
    }
    SafariShared::ExtensionURLTranslator::shared(v11);
    SafariShared::ExtensionURLTranslator::fileURLForExtensionURL();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = v10;
  BOOL v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10];
  long long v14 = v13;
  if (a6) {
    *a6 = v13;
  }
  if (!v14)
  {
    id v15 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v8 path];
      objc_claimAutoreleasedReturnValue();
      [v9 identifier];
      objc_claimAutoreleasedReturnValue();
      -[WBSExtensionsController validateAndReadResourceWithExtensionURL:inExtension:codeRef:outResourceData:]();
    }
  }
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (void)_addExtensionToBaseURIMap:(id)a3 withResourceURL:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [(WBSExtensionsController *)self _generateBaseURIForExtension:v17];
  id v8 = [(WBSExtensionsController *)self extensionDataForExtension:v17];
  SafariShared::ExtensionURLTranslator::shared((SafariShared::ExtensionURLTranslator *)[v8 setSafariExtensionBaseURI:v7]);
  id v9 = [v8 displayName];
  SafariShared::ExtensionURLTranslator::addExtension();

  id v10 = objc_msgSend(v17, "sf_uniqueIdentifier");
  extensionIdentifierToBaseURIMap = self->_extensionIdentifierToBaseURIMap;
  if (extensionIdentifierToBaseURIMap)
  {
    uint64_t v12 = (void *)[(NSMutableDictionary *)extensionIdentifierToBaseURIMap mutableCopy];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  BOOL v13 = v12;
  [v12 setObject:v7 forKeyedSubscript:v10];
  long long v14 = (NSMutableDictionary *)[v13 copy];
  id v15 = self->_extensionIdentifierToBaseURIMap;
  self->_extensionIdentifierToBaseURIMap = v14;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained extensionBaseURIMapChangedForExtensionsController:self];
}

- (id)extensionWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    allDiscoveredExtensions = self->_allDiscoveredExtensions;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__WBSExtensionsController_extensionWithUUID___block_invoke;
    v14[3] = &unk_1E5E418B0;
    id v7 = v4;
    id v15 = v7;
    BOOL v16 = self;
    id v8 = [(NSArray *)allDiscoveredExtensions safari_firstObjectPassingTest:v14];
    if (!v8)
    {
      extensions = self->_extensions;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__WBSExtensionsController_extensionWithUUID___block_invoke_2;
      v11[3] = &unk_1E5E418B0;
      id v12 = v7;
      BOOL v13 = self;
      id v8 = [(NSMutableArray *)extensions safari_firstObjectPassingTest:v11];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __45__WBSExtensionsController_extensionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "sf_uniqueIdentifier");
  if ([v4 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 88) containsObject:v3] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __45__WBSExtensionsController_extensionWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "sf_uniqueIdentifier");
  if ([v4 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 88) containsObject:v3] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __59__WBSExtensionsController_extensionWithComposedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) composedIdentifierForExtensionStateForExtension:v3];
  if ([v4 isEqualToString:*(void *)(a1 + 40)]) {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 88) containsObject:v3] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)extensionWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    allDiscoveredExtensions = self->_allDiscoveredExtensions;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__WBSExtensionsController_extensionWithBundleIdentifier___block_invoke;
    v8[3] = &unk_1E5E418B0;
    id v9 = v4;
    id v10 = self;
    id v6 = [(NSArray *)allDiscoveredExtensions safari_firstObjectPassingTest:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __57__WBSExtensionsController_extensionWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 88) containsObject:v3] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_extensionsWereGloballyEnabled
{
  [(WBSExtensionsController *)self loadEnabledExtensions];

  [(WBSExtensionsController *)self findExtensions];
}

- (void)_extensionsWereGloballyDisabled
{
  [(WBSExtensionsController *)self _endExtensionDiscovery];
  enabledExtensions = self->_enabledExtensions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__WBSExtensionsController__extensionsWereGloballyDisabled__block_invoke;
  v9[3] = &unk_1E5E417E8;
  v9[4] = self;
  [(NSMutableSet *)enabledExtensions enumerateObjectsUsingBlock:v9];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = self->_enabledExtensions;
  self->_enabledExtensions = v4;

  id v6 = [MEMORY[0x1E4F1CA48] array];
  extensions = self->_extensions;
  self->_extensions = v6;

  extensionUniqueIdentifierToExtensionDataMap = self->_extensionUniqueIdentifierToExtensionDataMap;
  self->_extensionUniqueIdentifierToExtensionDataMap = 0;

  self->_hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce = 0;
}

void __58__WBSExtensionsController__extensionsWereGloballyDisabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [v3 identifier];
    int v6 = 138477827;
    id v7 = v5;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "Unloading extension with identifier %{private}@ because extensions were globally disabled", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) unloadExtensionIfNecessary:v3];
}

- (void)_setExtensionState:(id)a3 forExtension:(id)a4
{
}

- (void)_setExtensionState:(id)a3 forExtension:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  id v9 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:a4];
  [(WBSExtensionsController *)self _setExtensionIdentifierToStateMap:v10 forExtensionWithComposedIdentifier:v9 completionHandler:v8];
}

+ (BOOL)hasBlockedPromptAppearedForExtensionWithIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v5 = *MEMORY[0x1E4F98440];
  int v6 = [v4 arrayForKey:*MEMORY[0x1E4F98440]];
  char v7 = [v6 containsObject:v3];
  if ((v7 & 1) == 0)
  {
    if (v6)
    {
      uint64_t v8 = [v6 arrayByAddingObject:v3];

      int v6 = (void *)v8;
    }
    else
    {
      v10[0] = v3;
      int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    [v4 setObject:v6 forKey:v5];
  }

  return v7;
}

+ (void)removeExtensionBundleIDFromArrayOfBlocklistedExtensions:(id)a3
{
  id v7 = a3;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v4 = *MEMORY[0x1E4F98440];
  uint64_t v5 = [v3 arrayForKey:*MEMORY[0x1E4F98440]];
  int v6 = (void *)[v5 mutableCopy];

  if ([v6 containsObject:v7])
  {
    [v6 removeObject:v7];
    [v3 setObject:v6 forKey:v4];
  }
}

- (void)_disableAndBlockExtension:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    [v4 identifier];
    objc_claimAutoreleasedReturnValue();
    -[WBSExtensionsController _disableAndBlockExtension:]();
  }

  [(WBSExtensionsController *)self setExtension:v4 isEnabled:0];
  [(WBSExtensionsController *)self _blockExtension:v4];
}

- (void)unloadExtensionIfNecessary:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  v39 = self;
  id v4 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [v38 identifier];
    *(_DWORD *)buf = 138477827;
    long long v56 = v5;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "Unloading extension with identifier: %{private}@", buf, 0xCu);
  }
  int v6 = v38;
  [v38 _kill:9];
  if ([(NSMutableSet *)v39->_enabledExtensions containsObject:v38])
  {
    [(WBSExtensionsController *)v39 _unloadPreviouslyEnabledExtension:v38];
    uint64_t v37 = [(WBSExtensionsController *)v39 extensionDataForExtension:v38];
    id v7 = [(WBSExtensionsController *)v39 userContentController];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_userContentController");
    BOOL v9 = v7 == v8;

    if (v9)
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_privateBrowsingUserContentController");
    }
    else
    {
      id v10 = 0;
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    int v11 = [v37 injectedStyleSheets];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          [v7 _removeUserStyleSheet:v15];
          [v10 _removeUserStyleSheet:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v12);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    BOOL v16 = [v37 injectedScripts];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * j);
          [v7 _removeUserScript:v20];
          [v10 _removeUserScript:v20];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v17);
    }

    [v37 setInjectedStyleSheets:0];
    [v37 setInjectedScripts:0];
    uint64_t v21 = objc_msgSend(v38, "sf_uniqueIdentifier");
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v39->_baseURIHostToExtensionIdentifier;
    id v23 = (id)[(NSMutableDictionary *)v22 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v41;
      while (2)
      {
        for (uint64_t k = 0; k != v23; uint64_t k = (char *)k + 1)
        {
          if (*(void *)v41 != v24) {
            objc_enumerationMutation(v22);
          }
          long long v26 = *(void **)(*((void *)&v40 + 1) + 8 * (void)k);
          id v27 = [(NSMutableDictionary *)v39->_baseURIHostToExtensionIdentifier objectForKeyedSubscript:v26];
          int v28 = [v27 isEqual:v21];

          if (v28)
          {
            id v23 = v26;
            goto LABEL_31;
          }
        }
        id v23 = (id)[(NSMutableDictionary *)v22 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
LABEL_31:

    [(NSMutableDictionary *)v39->_baseURIHostToExtensionIdentifier removeObjectForKey:v23];
    long long v29 = [(NSMutableDictionary *)v39->_extensionIdentifierToBaseURIMap objectForKeyedSubscript:v21];
    id v30 = (NSURL *)v29;
    if (v29)
    {
      uint64_t v31 = (SafariShared::ExtensionURLTranslator *)SafariShared::ExtensionURLTranslator::shared(v29);
      SafariShared::ExtensionURLTranslator::removeExtension(v31, v30);
      id WeakRetained = objc_loadWeakRetained((id *)&v39->_delegate);
      char v33 = [(WBSExtensionsController *)v39 composedIdentifierForExtensionStateForExtension:v38];
      [WeakRetained extensionsController:v39 closeOpenExtensionTabsWithBaseURI:v30 composedIdentifier:v33];

      BOOL v34 = (void *)[(NSMutableDictionary *)v39->_extensionIdentifierToBaseURIMap mutableCopy];
      [v34 removeObjectForKey:v21];
      uint64_t v35 = [v34 copy];
      extensionIdentifierToBaseURIMap = v39->_extensionIdentifierToBaseURIMap;
      v39->_extensionIdentifierToBaseURIMap = (NSMutableDictionary *)v35;

      [WeakRetained extensionBaseURIMapChangedForExtensionsController:v39];
    }

    [(NSMutableSet *)v39->_enabledExtensions removeObject:v38];
    [(WBSExtensionsController *)v39 _updateExtensionsCrashReporterMessage];

    int v6 = v38;
  }
}

- (void)closeLocalExtensionContentInPrivateTabsForExtension:(id)a3
{
  id v4 = a3;
  if (self->_loadEnabledExtensionsWasCalled)
  {
    id v10 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    extensionIdentifierToBaseURIMap = self->_extensionIdentifierToBaseURIMap;
    id v7 = objc_msgSend(v10, "sf_uniqueIdentifier");
    uint64_t v8 = [(NSMutableDictionary *)extensionIdentifierToBaseURIMap objectForKeyedSubscript:v7];

    if (v8)
    {
      BOOL v9 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v10];
      [WeakRetained extensionsController:self closeOpenExtensionTabsInPrivateBrowsingWithBaseURI:v8 composedIdentifier:v9];
    }
    id v4 = v10;
  }
}

- (void)_postExtensionWasEnabledRemotelyNotificationIfNecessary:(id)a3
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_extensionIdentifierToStateMap objectForKeyedSubscript:v4];
  if (objc_msgSend(v5, "safari_BOOLForKey:", *MEMORY[0x1E4F98848]))
  {
    uint64_t v6 = *MEMORY[0x1E4F987A8];
    v12[0] = v4;
    uint64_t v7 = *MEMORY[0x1E4F987B0];
    v11[0] = v6;
    v11[1] = v7;
    uint64_t v8 = [(WBSExtensionsController *)self profileServerID];
    v12[1] = v8;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:*MEMORY[0x1E4F98850] object:0 userInfo:v9];
  }
}

- (void)remotelyEnabledExtensionBannerWasShownForComposedIdentifier:(id)a3
{
  id v8 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_extensionIdentifierToStateMap, "objectForKeyedSubscript:");
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)[v4 mutableCopy];
    [v6 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F98848]];
    uint64_t v7 = (void *)[v6 copy];
    [(NSMutableDictionary *)self->_extensionIdentifierToStateMap setObject:v7 forKeyedSubscript:v8];

    [(WBSExtensionsController *)self _writeExtensionsStateToStorage];
  }
}

+ (id)_bundleIdentifierFromComposedIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "rangeOfString:", @" (");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v3 substringToIndex:v4];
  }

  return v5;
}

+ (id)_extensionFromComposedIdentifier:(id)a3
{
  uint64_t v4 = [a1 _bundleIdentifierFromComposedIdentifier:a3];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v4 excludingDisabledExtensions:0 error:0];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 extensionPointIdentifier];
      id v8 = [a1 _extensionPointIdentifier];
      if ([v7 isEqualToString:v8]) {
        BOOL v9 = v6;
      }
      else {
        BOOL v9 = 0;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_generateBaseURIForExtension:(id)a3
{
  id v4 = a3;
  if (!self->_baseURIHostToExtensionIdentifier)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    baseURIHostToExtensionIdentifier = self->_baseURIHostToExtensionIdentifier;
    self->_baseURIHostToExtensionIdentifier = v5;
  }
  uint64_t v7 = [(WBSExtensionsController *)self extensionDataForExtension:v4];
  id v8 = [v7 baseURIHost];

  BOOL v9 = objc_msgSend(v4, "sf_uniqueIdentifier");
  [(NSMutableDictionary *)self->_baseURIHostToExtensionIdentifier setObject:v9 forKeyedSubscript:v8];

  id v10 = (void *)MEMORY[0x1E4F1CB10];
  int v11 = NSString;
  uint64_t v12 = [(id)objc_opt_class() extensionURLScheme];
  uint64_t v13 = [v11 stringWithFormat:@"%@://%@/", v12, v8];
  long long v14 = objc_msgSend(v10, "safari_URLWithDataAsString:", v13);

  return v14;
}

- (id)extensionWithBaseURIHost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  uint64_t v6 = [(NSMutableDictionary *)self->_baseURIHostToExtensionIdentifier objectForKeyedSubscript:v5];
  uint64_t v7 = [(WBSExtensionsController *)self extensionWithUUID:v6];

  return v7;
}

+ (double)temporarySiteAccessTimeInterval
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:*MEMORY[0x1E4F98480]];
  double v4 = v3;

  double result = 86400.0;
  if (v4 < 86400.0 && v4 > 0.0) {
    return v4;
  }
  return result;
}

- (void)didShowPerSiteAccessPermissionForExtension:(id)a3
{
  id v7 = a3;
  double v4 = -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:");
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = *MEMORY[0x1E4F98558];
  if ((objc_msgSend(v5, "safari_BOOLForKey:", *MEMORY[0x1E4F98558]) & 1) == 0)
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v6];
    [(WBSExtensionsController *)self _setExtensionState:v5 forExtension:v7];
  }
}

- (BOOL)hasShownPerSiteAccessPermissionForExtension:(id)a3
{
  double v3 = [(WBSExtensionsController *)self _extensionStateForExtension:a3];
  char v4 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x1E4F98558]);

  return v4;
}

- (id)cloudExtensionStateForStateManager:(id)a3
{
  id v4 = a3;
  if (!self->_extensionIdentifierToStateMap)
  {
    uint64_t v5 = [(WBSExtensionsController *)self readExtensionsStateFromStorage];
    uint64_t v6 = (NSMutableDictionary *)[v5 mutableCopy];
    extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
    self->_extensionIdentifierToStateMap = v6;
  }
  id v8 = [(WBSExtensionsController *)self profileServerID];
  BOOL v9 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v8];

  id v10 = self->_extensionIdentifierToStateMap;
  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__WBSExtensionsController_cloudExtensionStateForStateManager___block_invoke;
    v14[3] = &unk_1E5E41888;
    void v14[4] = self;
    int v11 = [(NSMutableDictionary *)v10 safari_mapAndFilterKeysAndObjectsUsingBlock:v14];
  }
  else
  {
    int v11 = v10;
  }
  uint64_t v12 = v11;

  return v12;
}

id __62__WBSExtensionsController_cloudExtensionStateForStateManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) extensionWithComposedIdentifier:v5];
  if (v7)
  {
    id v8 = (void *)[v6 mutableCopy];
    BOOL v9 = objc_msgSend(v7, "safari_containingAppAdamID");
    if (v9 || (objc_msgSend(v7, "safari_containingAppIsTestFlightApp") & 1) != 0)
    {
      id v10 = objc_msgSend(v7, "safari_correspondingMacOSExtensionBundleIdentifier");
      if (v10) {
        [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F98830]];
      }

      int v11 = objc_msgSend(v7, "safari_correspondingMacOSContainingAppBundleIdentifier");
      if (v11) {
        [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F98828]];
      }

      if (v9) {
        [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F987B8]];
      }
      uint64_t v12 = [*(id *)(a1 + 32) extensionDataForExtension:v7];
      uint64_t v13 = [v12 displayName];
      if (v13) {
        [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F987F0]];
      }
    }
    else
    {
      uint64_t v15 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __62__WBSExtensionsController_cloudExtensionStateForStateManager___block_invoke_cold_1((uint64_t)v5, v15);
      }

      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)hasExtensionWithComposedIdentifier:(id)a3
{
  id v4 = a3;
  allDiscoveredExtensions = self->_allDiscoveredExtensions;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__WBSExtensionsController_hasExtensionWithComposedIdentifier___block_invoke;
  v8[3] = &unk_1E5E418B0;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(allDiscoveredExtensions) = [(NSArray *)allDiscoveredExtensions safari_containsObjectPassingTest:v8];

  return (char)allDiscoveredExtensions;
}

uint64_t __62__WBSExtensionsController_hasExtensionWithComposedIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = [*(id *)(a1 + 32) composedIdentifierForExtensionStateForExtension:a2];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  return v4;
}

- (void)setExtensionWithComposedIdentifier:(id)a3 isEnabledInCloud:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  allDiscoveredExtensions = self->_allDiscoveredExtensions;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  BOOL v16 = __79__WBSExtensionsController_setExtensionWithComposedIdentifier_isEnabledInCloud___block_invoke;
  uint64_t v17 = &unk_1E5E418B0;
  uint64_t v18 = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = [(NSArray *)allDiscoveredExtensions safari_firstObjectPassingTest:&v14];
  if (-[WBSExtensionsController extensionIsEnabled:](self, "extensionIsEnabled:", v9, v14, v15, v16, v17, v18) == v4)
  {
    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v21 = v8;
      _os_log_impl(&dword_1ABB70000, v13, OS_LOG_TYPE_INFO, "Skipping changing state of %{private}@ because it is current state", buf, 0xCu);
    }
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = @"OFF";
      if (v4) {
        int v11 = @"ON";
      }
      *(_DWORD *)buf = 138478083;
      id v21 = v8;
      __int16 v22 = 2113;
      id v23 = v11;
      _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Setting extension %{private}@ to %{private}@ from cloud data", buf, 0x16u);
    }
    [(WBSExtensionsController *)self setExtension:v9 isEnabled:v4 dueToUserGesture:0 skipSavingToStorage:0];
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"WBSWebExtensionDisplayListNeedsUpdateNotification" object:0];
  }
}

uint64_t __79__WBSExtensionsController_setExtensionWithComposedIdentifier_isEnabledInCloud___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = [*(id *)(a1 + 32) composedIdentifierForExtensionStateForExtension:a2];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  return v4;
}

- (void)_updateExtensionStateIfPermissionsIncreased:(id)a3
{
  id v4 = a3;
  id v20 = v4;
  if (!self->_extensionIdentifierToStateMap)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
    self->_extensionIdentifierToStateMap = v5;

    id v4 = v20;
  }
  id v7 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v4];
  id v8 = [(NSMutableDictionary *)self->_extensionIdentifierToStateMap objectForKeyedSubscript:v7];
  id v9 = (void *)[v8 copy];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  uint64_t v12 = v11;

  uint64_t v13 = [(WBSExtensionsController *)self _updatedExtensionStateForCurrentPermissions:v20 previousExtensionState:v12];
  [(WBSExtensionsController *)self _setExtensionIdentifierToStateMap:v13 forExtensionWithComposedIdentifier:v7];
  if (objc_msgSend(v13, "safari_BOOLForKey:", *MEMORY[0x1E4F98800]))
  {
    uint64_t v14 = [MEMORY[0x1E4F98348] sharedController];
    uint64_t v15 = [v14 managedExtensionStateForComposedIdentifier:v7];

    if (v15 != 1)
    {
      if ([(WBSExtensionsController *)self _shouldDisableExtensionIfAdditionalPermissionsAreRequired:v20 previousExtensionState:v12])
      {
        [(WBSExtensionsController *)self setExtension:v20 isEnabled:0 dueToUserGesture:0 skipSavingToStorage:0];
        BOOL v16 = [MEMORY[0x1E4F28C40] defaultCenter];
        [v16 postNotificationName:@"com.apple.mobilesafari.MobileSafariChangedExtensionSettings" object:0];

        uint64_t v17 = [(WBSExtensionsController *)self _displayNameForExtension:v20];
        uint64_t v18 = objc_msgSend(v20, "sf_uniqueIdentifier");
        id v19 = [v18 UUIDString];
        [(WBSExtensionsController *)self _showPromptForExtensionDisabledBecauseItHasRequestedAdditionalPermissions:v17 extensionIdentifier:v19];
      }
    }
  }
}

- (id)extensionsWithAdamID:(id)a3
{
  id v4 = a3;
  allDiscoveredExtensions = self->_allDiscoveredExtensions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__WBSExtensionsController_extensionsWithAdamID___block_invoke;
  v9[3] = &unk_1E5E41748;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)allDiscoveredExtensions safari_filterObjectsUsingBlock:v9];

  return v7;
}

uint64_t __48__WBSExtensionsController_extensionsWithAdamID___block_invoke(uint64_t a1, void *a2)
{
  double v3 = objc_msgSend(a2, "safari_containingAppAdamID");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_updateExtensionStateWithPrivacyPreservingProfileIdentifierIfNeeded:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(WBSExtensionsController *)self profile];
  char v5 = [v4 isDefault];

  if ((v5 & 1) == 0)
  {
    id v6 = [(WBSExtensionsController *)self _extensionStateForExtension:v13];
    id v7 = (void *)[v6 mutableCopy];

    if (!v7)
    {
      id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v8 = [(WBSExtensionsController *)self extensionDataForExtension:v13];
    uint64_t v9 = *MEMORY[0x1E4F98560];
    id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F98560]];
    if (v10)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
      [v8 setPrivacyPreservingProfileIdentifier:v11];
    }
    else
    {
      id v10 = [MEMORY[0x1E4F29128] UUID];
      [v8 setPrivacyPreservingProfileIdentifier:v10];
      uint64_t v12 = [v10 UUIDString];
      [v7 setObject:v12 forKeyedSubscript:v9];

      id v11 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v13];
      [(WBSExtensionsController *)self _setExtensionIdentifierToStateMap:v7 forExtensionWithComposedIdentifier:v11];
    }
  }
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; profile server ID = %@>",
                       objc_opt_class(),
                       self,
                       self->_profileServerID);
}

+ (id)_composedIdentifierForStateOfExtensionWithBundleIdentifier:(id)a3 developerIdentifier:(id)a4
{
  return 0;
}

- (id)_developerIdentifierForExtension:(id)a3 untrustedCodeSigningDictionary:(id)a4
{
  return 0;
}

- (id)_displayNameForExtension:(id)a3
{
  return 0;
}

- (id)_displayShortNameForExtension:(id)a3
{
  return 0;
}

- (id)_displayVersionForExtension:(id)a3
{
  return 0;
}

+ (id)extensionIdentifierToBaseURIMapBundleParameterKey
{
  return 0;
}

+ (id)_extensionPointIdentifier
{
  return 0;
}

+ (id)extensionsCrashReporterMessageBundleParameterKey
{
  return 0;
}

+ (id)extensionURLScheme
{
  return 0;
}

+ (id)_skipLoadingEnabledExtensionsAtLaunchPreferenceKey
{
  return 0;
}

- (id)_updatedExtensionStateForCurrentPermissions:(id)a3 previousExtensionState:(id)a4
{
  uint64_t v4 = objc_msgSend(a4, "mutableCopy", a3);

  return v4;
}

- (id)_urlForExtensionSettings
{
  return 0;
}

- (id)_urlForWebKitExtensionsDirectory
{
  return 0;
}

- (NSArray)allProfileExtensionsControllers
{
  return 0;
}

- (WBProfile)profile
{
  return 0;
}

- (id)_versionNumberForExtension:(id)a3
{
  return 0;
}

- (BOOL)_shouldDisableExtensionIfAdditionalPermissionsAreRequired:(id)a3 previousExtensionState:(id)a4
{
  return 1;
}

- (id)_computeCodeSigningDictionaryOnDiskForExtension:(id)a3 attemptRetryOnFailure:(BOOL)a4
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)_enableExtension:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)_isExtensionBlockedByBlocklist:(id)a3 developerIdentifier:(id)a4
{
  return 0;
}

- (BOOL)allowUnsignedExtensions
{
  return 0;
}

- (void)_finishedLoadingExtensions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:self->_profileServerID])
  {
    double v3 = [(id)objc_opt_class() _extensionDefaults];
    uint64_t v4 = [(id)objc_opt_class() _skipLoadingEnabledExtensionsAtLaunchPreferenceKey];
    char v5 = [v3 objectForKey:v4];

    if (!v5)
    {
      id v6 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        BOOL v7 = [(WBSExtensionsController *)self hasAnyEnabledExtensionsInStorage];
        id v8 = @"YES";
        if (v7) {
          id v8 = @"NO";
        }
        int v12 = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_1ABB70000, v6, OS_LOG_TYPE_INFO, "Setting SkipLoadingEnabledExtensionsAtLaunch key to %@", (uint8_t *)&v12, 0xCu);
      }

      uint64_t v9 = [(id)objc_opt_class() _extensionDefaults];
      BOOL v10 = [(WBSExtensionsController *)self hasAnyEnabledExtensionsInStorage];
      id v11 = [(id)objc_opt_class() _skipLoadingEnabledExtensionsAtLaunchPreferenceKey];
      [v9 setBool:!v10 forKey:v11];
    }
  }
}

- (id)profileServerIDForStateManager:(id)a3
{
  double v3 = [(WBSExtensionsController *)self profile];
  uint64_t v4 = [v3 identifierForExtensions];

  return v4;
}

- (void)_managedExtensionStateDidChange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  enabledExtensions = self->_enabledExtensions;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__WBSExtensionsController__managedExtensionStateDidChange__block_invoke;
  v17[3] = &unk_1E5E418D8;
  v17[4] = self;
  [(NSMutableSet *)enabledExtensions safari_mapAndFilterObjectsUsingBlock:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v14;
    *(void *)&long long v6 = 138477827;
    long long v12 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        BOOL v10 = (id)WBS_LOG_CHANNEL_PREFIXManagedExtensions();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v9];
          *(_DWORD *)buf = v12;
          id v19 = v11;
          _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Unloading extension %{private}@ due to managed extension configuration", buf, 0xCu);
        }
        [(WBSExtensionsController *)self unloadExtensionIfNecessary:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }
    while (v5);
  }

  if (self->_loadEnabledExtensionsWasCalled || self->_forceExtensionLoadingAfterDiscovery) {
    -[WBSExtensionsController _loadExtensions:skipEqualityCheck:](self, "_loadExtensions:skipEqualityCheck:", self->_allDiscoveredExtensions, 1, v12, (void)v13);
  }
  [(WBSExtensionsController *)self _updateManagedWebsiteAccessForAllExtensions];
  [(WBSExtensionsController *)self _updateManagedPrivateBrowsingStateForAllExtensions];
}

id __58__WBSExtensionsController__managedExtensionStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _extensionShouldBeEnabled:v3]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (WBSExtensionsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WBSExtensionsControllerDelegate *)WeakRetained;
}

- (BOOL)loadingEnabledExtensionsAtStartup
{
  return self->_loadingEnabledExtensionsAtStartup;
}

- (void)setProfileServerID:(id)a3
{
}

- (NSArray)allDiscoveredExtensions
{
  return self->_allDiscoveredExtensions;
}

- (BOOL)extensionsEnabled
{
  return self->_extensionsEnabled;
}

- (WBSExtensionsAnalyticsEventCoalescer)analyticsEventCoalescer
{
  return self->_analyticsEventCoalescer;
}

- (NSArray)composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions
{
  return self->_composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions;
}

- (BOOL)hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce
{
  return self->_hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions, 0);
  objc_storeStrong((id *)&self->_analyticsEventCoalescer, 0);
  objc_storeStrong((id *)&self->_allDiscoveredExtensions, 0);
  objc_storeStrong((id *)&self->_profileServerID, 0);
  objc_storeStrong((id *)&self->_diagnosticStateCollector, 0);
  objc_storeStrong((id *)&self->_extensionKitQueryController, 0);
  objc_storeStrong((id *)&self->_userContentController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deleteStateForRemovedExtensionsTimer, 0);
  objc_storeStrong((id *)&self->_appBundleValidationQueue, 0);
  objc_storeStrong((id *)&self->_blockedExtensions, 0);
  objc_storeStrong((id *)&self->_replacedExtensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_enabledExtensions, 0);
  objc_storeStrong((id *)&self->_baseURIHostToExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifierToBaseURIMap, 0);
  objc_storeStrong((id *)&self->_extensionIdentifierToStateMap, 0);
  objc_storeStrong((id *)&self->_extensionUniqueIdentifierToExtensionDataMap, 0);
  objc_storeStrong(&self->_extensionMatchingContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)extensionsDataForExport
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v28 = self;
  extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  id v23 = v3;
  if (!extensionIdentifierToStateMap)
  {
    id v5 = [(WBSExtensionsController *)self readExtensionsStateFromStorage];
    uint64_t v6 = [v5 mutableCopy];
    uint64_t v7 = v28->_extensionIdentifierToStateMap;
    v28->_extensionIdentifierToStateMap = (NSMutableDictionary *)v6;

    extensionIdentifierToStateMap = v28->_extensionIdentifierToStateMap;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = extensionIdentifierToStateMap;
  uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v26 = *(void *)v30;
    uint64_t v25 = *MEMORY[0x1E4F98800];
    do
    {
      uint64_t v27 = v8;
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v11 = -[NSMutableDictionary safari_dictionaryForKey:](v28->_extensionIdentifierToStateMap, "safari_dictionaryForKey:", v10, v23);
        char v12 = objc_msgSend(v11, "safari_BOOLForKey:", v25);

        if (v12)
        {
          long long v13 = [(id)objc_opt_class() _extensionFromComposedIdentifier:v10];
          if (v13)
          {
            long long v14 = [(WBSExtensionsController *)v28 extensionDataForExtension:v13];
            if (v14)
            {
              long long v15 = objc_msgSend(v13, "safari_correspondingMacOSExtensionBundleIdentifier");
              long long v16 = objc_msgSend(v13, "safari_correspondingMacOSContainingAppBundleIdentifier");
              uint64_t v17 = [v14 displayName];
              uint64_t v18 = objc_msgSend(v13, "safari_launchServicesDeveloperName");
              id v19 = objc_msgSend(v13, "safari_containingAppAdamID");
              id v20 = +[WBSExtensionsExporter extensionDataWithDisplayName:v17 developerName:v18 composedIdentifier:v10 adamIdentifier:v19 alternatePlatformExtensionBundleIdentifier:v15 alternatePlatformAppBundleIdentifier:v16];

              [v23 addObject:v20];
            }
          }
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  uint64_t v21 = (void *)[v23 copy];

  return v21;
}

void __31__WBSExtensionsController_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Found that self.profile.identifier is nil when collecting extensions state", v2, v3, v4, v5, v6);
}

- (void)writeExtensionsStateToStorageWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Could not get extension settings URL", v2, v3, v4, v5, v6);
}

- (void)writeExtensionsStateToStorageWithCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Failed to coordinate writing extension state %{public}@", v5);
}

void __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Unable to save extension state: %{public}@", v5);
}

- (void)readExtensionsStateFromStorage
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Failed to coordinate reading extension state %{public}@", v5);
}

- (void)validateAndReadResourceWithExtensionURL:inExtension:codeRef:outResourceData:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  *(_DWORD *)uint64_t v3 = 138543619;
  *(void *)(v3 + 4) = v1;
  *(_WORD *)(v3 + 12) = 2113;
  *(void *)(v3 + 14) = v4;
  OUTLINED_FUNCTION_3_2(&dword_1ABB70000, "Couldn't find resource %{public}@ for extension with identifier %{private}@", v5, v6);
}

- (void)_disableAndBlockExtension:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Disabling and blocking extension with identifier: %@", v5);
}

- (void)_blockExtension:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Blocking extension with identifier: %@", v5);
}

void __62__WBSExtensionsController_cloudExtensionStateForStateManager___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Not saving state for extension %{private}@ because we could not compute its containing app's Adam ID and it's not a TestFlight app", (uint8_t *)&v2, 0xCu);
}

@end