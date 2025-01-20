@interface WFAppInstalledResource
+ (BOOL)mustBeAvailableForDisplay;
+ (BOOL)refreshesAvailabilityOnApplicationResume;
- (BOOL)appDescriptorOrAccompanyingExtensionIsInstalled:(id)a3;
- (BOOL)descriptorIsIntentDescriptor;
- (BOOL)intentIsEligibleForRemoteExecution;
- (BOOL)intentIsLocallyAvailable;
- (BOOL)intentIsSynced;
- (BOOL)requiresAppToBeInstalled;
- (BOOL)skipLookup;
- (INAppDescriptor)descriptor;
- (NSMutableArray)pendingAppLookupCompletions;
- (NSString)appName;
- (OS_dispatch_queue)stateQueue;
- (WFAppInstalledResource)initWithAppDescriptor:(id)a3 requiresAppToBeInstalled:(BOOL)a4;
- (WFAppInstalledResource)initWithIntentDescriptor:(id)a3 isSyncedFromOtherDevice:(BOOL)a4;
- (WFAppInstalledResourceDelegate)delegate;
- (WFiTunesSessionManager)currentAppNameLookupSessionManager;
- (id)_initWithDescriptor:(id)a3 requiresAppToBeInstalled:(BOOL)a4 isSyncedFromOtherDevice:(BOOL)a5;
- (id)appNeedsUpdateErrorWithAppName:(id)a3;
- (id)appNotInstalledError;
- (id)appNotResolvedError;
- (id)bundleIdentifier;
- (id)eventDictionary;
- (id)intentDescriptor;
- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 userInterface:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)fetchiTunesStoreObjectForAppWithCompletionBlock:(id)a3;
- (void)notifyDelegateWithUpdatedDescriptor:(id)a3;
- (void)refreshAvailability;
- (void)setAppName:(id)a3;
- (void)setCurrentAppNameLookupSessionManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setIntentIsSynced:(BOOL)a3;
- (void)setPendingAppLookupCompletions:(id)a3;
- (void)setRequiresAppToBeInstalled:(BOOL)a3;
- (void)setSkipLookup:(BOOL)a3;
- (void)updateDescriptorsWithSelectedApp:(id)a3;
@end

@implementation WFAppInstalledResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_pendingAppLookupCompletions, 0);
  objc_storeStrong((id *)&self->_currentAppNameLookupSessionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDescriptor:(id)a3
{
}

- (INAppDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setIntentIsSynced:(BOOL)a3
{
  self->_intentIsSynced = a3;
}

- (BOOL)intentIsSynced
{
  return self->_intentIsSynced;
}

- (void)setRequiresAppToBeInstalled:(BOOL)a3
{
  self->_requiresAppToBeInstalled = a3;
}

- (BOOL)requiresAppToBeInstalled
{
  return self->_requiresAppToBeInstalled;
}

- (void)setSkipLookup:(BOOL)a3
{
  self->_skipLookup = a3;
}

- (BOOL)skipLookup
{
  return self->_skipLookup;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setPendingAppLookupCompletions:(id)a3
{
}

- (NSMutableArray)pendingAppLookupCompletions
{
  return self->_pendingAppLookupCompletions;
}

- (void)setCurrentAppNameLookupSessionManager:(id)a3
{
}

- (WFiTunesSessionManager)currentAppNameLookupSessionManager
{
  return self->_currentAppNameLookupSessionManager;
}

- (void)setDelegate:(id)a3
{
}

- (WFAppInstalledResourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFAppInstalledResourceDelegate *)WeakRetained;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 userInterface:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ([a3 code])
  {
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke;
    v11[3] = &unk_1E6551D48;
    id v13 = v10;
    id v12 = v9;
    [(WFAppInstalledResource *)self fetchiTunesStoreObjectForAppWithCompletionBlock:v11];
  }
}

void __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_2;
    block[3] = &unk_1E6557D28;
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F5A7A0] sharedContext];
  id v3 = [*(id *)(a1 + 32) viewURL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_3;
  v5[3] = &unk_1E6558110;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 openURL:v3 userInterface:v4 completionHandler:v5];
}

uint64_t __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)appNeedsUpdateErrorWithAppName:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = NSString;
    id v6 = WFLocalizedString(@"This action requires an updated version of %@.");
    id v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);

    id v8 = NSString;
    id v9 = WFLocalizedString(@"This shortcut requires an updated version of %@.");
    id v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v4);
  }
  else
  {
    id v7 = WFLocalizedString(@"This action cannot be run because a required app is missing");
    id v10 = WFLocalizedString(@"This shortcut cannot be imported because a required app is missing");
  }
  v17[0] = *MEMORY[0x1E4F28588];
  v17[1] = @"WFResourceErrorImportErrorReason";
  v18[0] = v7;
  v18[1] = v10;
  v17[2] = *MEMORY[0x1E4F28590];
  v11 = WFLocalizedString(@"View in App Store");
  v16 = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v17[3] = *MEMORY[0x1E4F5ABC0];
  v18[2] = v12;
  v18[3] = self;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ResourceErrorDomain" code:0 userInfo:v13];

  return v14;
}

- (id)appNotResolvedError
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(WFAppInstalledResource *)self appName];
  if ([v3 length])
  {
    id v4 = NSString;
    v5 = WFLocalizedString(@"This action requires %@ but it may not be installed.");
    id v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);

    id v7 = NSString;
    id v8 = WFLocalizedString(@"This shortcut requires %@ but it may not be installed.");
    id v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v3);
  }
  else
  {
    id v6 = WFLocalizedString(@"This action requires an app but it may not be installed.");
    id v9 = WFLocalizedString(@"This shortcut requires an app but it may not be installed.");
  }
  id v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28588];
  v19[0] = *MEMORY[0x1E4F5ABC0];
  v19[1] = v11;
  v20[0] = self;
  v20[1] = v6;
  v20[2] = v9;
  uint64_t v12 = *MEMORY[0x1E4F28590];
  v19[2] = @"WFResourceErrorImportErrorReason";
  v19[3] = v12;
  id v13 = WFLocalizedString(@"Select App");
  v18 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v20[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  v16 = [v10 errorWithDomain:@"ResourceErrorDomain" code:1 userInfo:v15];

  return v16;
}

- (id)appNotInstalledError
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(WFAppInstalledResource *)self appName];
  if ([v3 length])
  {
    id v4 = NSString;
    v5 = WFLocalizedString(@"This action requires %@ to be installed.");
    id v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);

    id v7 = NSString;
    id v8 = WFLocalizedString(@"This shortcut requires %@ to be installed.");
    id v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v3);
  }
  else
  {
    id v6 = WFLocalizedString(@"This action requires an app to be installed.");
    id v9 = WFLocalizedString(@"This shortcut requires an app to be installed.");
  }
  id v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28588];
  v19[0] = *MEMORY[0x1E4F5ABC0];
  v19[1] = v11;
  v20[0] = self;
  v20[1] = v6;
  v20[2] = v9;
  uint64_t v12 = *MEMORY[0x1E4F28590];
  v19[2] = @"WFResourceErrorImportErrorReason";
  v19[3] = v12;
  id v13 = WFLocalizedString(@"View in App Store");
  v18 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v20[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  v16 = [v10 errorWithDomain:@"ResourceErrorDomain" code:0 userInfo:v15];

  return v16;
}

- (BOOL)intentIsLocallyAvailable
{
  if ([(WFAppInstalledResource *)self intentIsEligibleForRemoteExecution])
  {
    id v3 = [(WFAppInstalledResource *)self descriptor];
    int v4 = [v3 isInstalled];

    if (!v4) {
      return 0;
    }
    if (![(WFAppInstalledResource *)self descriptorIsIntentDescriptor]) {
      return 1;
    }
    v5 = [(WFAppInstalledResource *)self intentDescriptor];
    char v6 = [v5 canRunOnLocalDevice];

    return v6;
  }
  else
  {
    return [(WFResource *)self isAvailable];
  }
}

- (BOOL)intentIsEligibleForRemoteExecution
{
  BOOL v3 = [(WFAppInstalledResource *)self descriptorIsIntentDescriptor];
  if (v3)
  {
    LOBYTE(v3) = [(WFAppInstalledResource *)self intentIsSynced];
  }
  return v3;
}

- (id)intentDescriptor
{
  v2 = [(WFAppInstalledResource *)self descriptor];
  BOOL v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v2 = v3;
    }
    else {
      v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (BOOL)descriptorIsIntentDescriptor
{
  v2 = [(WFAppInstalledResource *)self descriptor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)fetchiTunesStoreObjectForAppWithCompletionBlock:(id)a3
{
  id v5 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke;
  block[3] = &unk_1E6552860;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(stateQueue, block);
}

void __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentAppNameLookupSessionManager];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) pendingAppLookupCompletions];

    if (!v3)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"WFAppInstalledResource.m" lineNumber:185 description:@"Pending app lookup completions unexpectedly nil"];
    }
    id v14 = [*(id *)(a1 + 32) pendingAppLookupCompletions];
    id v4 = (void *)[*(id *)(a1 + 40) copy];
    id v5 = _Block_copy(v4);
    [v14 addObject:v5];
  }
  else
  {
    char v6 = objc_alloc_init(WFiTunesSessionManager);
    [*(id *)(a1 + 32) setCurrentAppNameLookupSessionManager:v6];
    id v7 = (void *)MEMORY[0x1E4F1CA48];
    id v8 = (void *)[*(id *)(a1 + 40) copy];
    id v9 = [v7 arrayWithObject:v8];
    [*(id *)(a1 + 32) setPendingAppLookupCompletions:v9];

    objc_initWeak(&location, *(id *)(a1 + 32));
    SEL v10 = [*(id *)(a1 + 32) bundleIdentifier];
    uint64_t v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v12 = [v11 countryCode];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke_2;
    v15[3] = &unk_1E6551D20;
    objc_copyWeak(&v16, &location);
    v15[4] = *(void *)(a1 + 32);
    [(WFiTunesSessionManager *)v6 lookupMediaWithBundleIdentifier:v10 countryCode:v12 completion:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained stateQueue];
  dispatch_assert_queue_not_V2(v8);

  id v9 = [v5 firstObject];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      SEL v10 = v9;
    }
    else {
      SEL v10 = 0;
    }
  }
  else
  {
    SEL v10 = 0;
  }
  id v11 = v10;

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__34355;
  v26 = __Block_byref_object_dispose__34356;
  id v27 = 0;
  uint64_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke_185;
  block[3] = &unk_1E6558960;
  void block[4] = WeakRetained;
  void block[5] = &v22;
  dispatch_sync(v12, block);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = (id)v23[5];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * i));
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v28 count:16];
    }
    while (v14);
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke_185(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingAppLookupCompletions];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) setPendingAppLookupCompletions:0];
  id v5 = *(void **)(a1 + 32);
  return [v5 setCurrentAppNameLookupSessionManager:0];
}

- (void)notifyDelegateWithUpdatedDescriptor:(id)a3
{
  id v6 = a3;
  id v4 = [(WFAppInstalledResource *)self delegate];

  if (v4)
  {
    id v5 = [(WFAppInstalledResource *)self delegate];
    [v5 appInstalledResource:self didUpdateAppDescriptor:v6];
  }
}

- (void)updateDescriptorsWithSelectedApp:(id)a3
{
  id v20 = a3;
  if ([(WFAppInstalledResource *)self descriptorIsIntentDescriptor])
  {
    id v4 = [(WFAppInstalledResource *)self descriptor];
    id v16 = objc_alloc(MEMORY[0x1E4F304E0]);
    long long v17 = v4;
    long long v19 = [v4 intentClassName];
    long long v18 = [v20 localizedName];
    id v5 = [v20 bundleIdentifier];
    id v6 = [v20 bundleIdentifier];
    id v7 = [v20 extensionBundleIdentifier];
    uint64_t v15 = [v4 uiExtensionBundleIdentifier];
    uint64_t v14 = [v20 counterpartIdentifiers];
    id v8 = [v20 teamIdentifier];
    uint64_t v9 = [v4 preferredCallProvider];
    SEL v10 = [v20 supportedIntents];
    id v11 = [v20 bundleURL];
    uint64_t v12 = [v20 documentTypes];
    id v13 = (void *)[v16 initWithIntentClassName:v19 localizedName:v18 bundleIdentifier:v5 displayableBundleIdentifier:v6 extensionBundleIdentifier:v7 uiExtensionBundleIdentifier:v15 counterpartIdentifiers:v14 teamIdentifier:v8 preferredCallProvider:v9 supportedIntents:v10 bundleURL:v11 documentTypes:v12];
    [(WFAppInstalledResource *)self setDescriptor:v13];
  }
  else
  {
    [(WFAppInstalledResource *)self setDescriptor:v20];
  }
}

- (void)refreshAvailability
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v3 = [(WFAppInstalledResource *)self descriptor];
  uint64_t v4 = [v3 bundleIdentifier];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = (void *)MEMORY[0x1E4F4B7E0];
    id v7 = [(WFAppInstalledResource *)self descriptor];
    id v8 = [v7 bundleIdentifier];
    uint64_t v9 = [v6 applicationWithBundleIdentifier:v8];
    int v10 = [v9 isHidden];

    if (v10)
    {
      id v19 = [(WFAppInstalledResource *)self appNotInstalledError];
      [(WFResource *)self updateAvailability:0 withError:v19];

      return;
    }
  }
  else
  {
  }
  if (![(WFAppInstalledResource *)self intentIsEligibleForRemoteExecution])
  {
    id v11 = [(WFAppInstalledResource *)self descriptor];
    if ([v11 requiresUserConfirmation])
    {
      uint64_t v12 = [(WFAppInstalledResource *)self appNotResolvedError];
      [(WFResource *)self updateAvailability:0 withError:v12];
    }
    else
    {
      if (![(WFAppInstalledResource *)self requiresAppToBeInstalled]
        || [(WFAppInstalledResource *)self appDescriptorOrAccompanyingExtensionIsInstalled:v11])
      {
        [(WFResource *)self updateAvailability:1 withError:0];
        goto LABEL_21;
      }
      if (![(WFAppInstalledResource *)self descriptorIsIntentDescriptor]
        || [(WFAppInstalledResource *)self intentIsSynced]
        || ([(WFAppInstalledResource *)self intentDescriptor],
            id v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v13 canRunOnLocalDevice],
            v13,
            (v14 & 1) != 0))
      {
        stateQueue = self->_stateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__WFAppInstalledResource_refreshAvailability__block_invoke;
        block[3] = &unk_1E6558938;
        id v21 = v11;
        uint64_t v22 = self;
        dispatch_sync(stateQueue, block);
        id v16 = [(WFAppInstalledResource *)self appNotInstalledError];
        [(WFResource *)self updateAvailability:0 withError:v16];

        goto LABEL_21;
      }
      uint64_t v12 = [(WFAppInstalledResource *)self descriptor];
      long long v17 = [v12 localizedName];
      long long v18 = [(WFAppInstalledResource *)self appNeedsUpdateErrorWithAppName:v17];
      [(WFResource *)self updateAvailability:0 withError:v18];
    }
LABEL_21:

    return;
  }
  [(WFResource *)self updateAvailability:1 withError:0];
}

void __45__WFAppInstalledResource_refreshAvailability__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localizedName];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) localizedName];
    [*(id *)(a1 + 40) setAppName:v7];
LABEL_6:

    return;
  }
  id v7 = [*(id *)(a1 + 40) appName];
  if ([v7 length]) {
    goto LABEL_6;
  }
  uint64_t v4 = [*(id *)(a1 + 40) currentAppNameLookupSessionManager];
  if (v4)
  {

    goto LABEL_6;
  }
  char v5 = [*(id *)(a1 + 40) skipLookup];

  if ((v5 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__WFAppInstalledResource_refreshAvailability__block_invoke_2;
    v8[3] = &unk_1E6551CF8;
    v8[4] = v6;
    [v6 fetchiTunesStoreObjectForAppWithCompletionBlock:v8];
  }
}

void __45__WFAppInstalledResource_refreshAvailability__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(NSObject **)(v4 + 72);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__WFAppInstalledResource_refreshAvailability__block_invoke_3;
  v7[3] = &unk_1E6558938;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __45__WFAppInstalledResource_refreshAvailability__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 name];
    [*(id *)(a1 + 40) setAppName:v3];

    uint64_t v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__WFAppInstalledResource_refreshAvailability__block_invoke_4;
    block[3] = &unk_1E6558B28;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(v4, block);
  }
  else
  {
    char v5 = *(void **)(a1 + 40);
    [v5 setSkipLookup:1];
  }
}

uint64_t __45__WFAppInstalledResource_refreshAvailability__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshAvailabilityWithNotification];
}

- (BOOL)appDescriptorOrAccompanyingExtensionIsInstalled:(id)a3
{
  id v3 = a3;
  if ([v3 isInstalled]) {
    goto LABEL_4;
  }
  uint64_t v4 = [v3 extensionBundleIdentifier];
  uint64_t v5 = [v4 length];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v7 = [v3 extensionBundleIdentifier];
  id v8 = (void *)[v6 initWithBundleIdentifier:v7 error:0];

  if (v8) {
LABEL_4:
  }
    BOOL v9 = 1;
  else {
LABEL_5:
  }
    BOOL v9 = 0;

  return v9;
}

- (id)eventDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)WFAppInstalledResource;
  id v3 = [(WFResource *)&v7 eventDictionary];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(WFAppInstalledResource *)self bundleIdentifier];
  [v4 setValue:v5 forKey:@"resource_app"];

  return v4;
}

- (id)bundleIdentifier
{
  uint64_t v2 = [(WFAppInstalledResource *)self descriptor];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)dealloc
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(WFAppInstalledResource *)self descriptor];
  uint64_t v4 = [v3 bundleIdentifier];

  if (v4 && [(WFAppInstalledResource *)self requiresAppToBeInstalled])
  {
    uint64_t v5 = +[ICAppRegistry sharedRegistry];
    v8[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v5 removeInstallStatusObserver:self forAppIdentifiers:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)WFAppInstalledResource;
  [(WFResource *)&v7 dealloc];
}

- (id)_initWithDescriptor:(id)a3 requiresAppToBeInstalled:(BOOL)a4 isSyncedFromOtherDevice:(BOOL)a5
{
  BOOL v6 = a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFAppInstalledResource;
  int v10 = [(WFResource *)&v24 initWithDefinition:MEMORY[0x1E4F1CC08]];
  id v11 = v10;
  if (v10)
  {
    p_descriptor = (id *)&v10->_descriptor;
    objc_storeStrong((id *)&v10->_descriptor, a3);
    uint64_t v13 = [v9 localizedName];
    appName = v11->_appName;
    v11->_appName = (NSString *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("WFAppInstalledResource-state", 0);
    stateQueue = v11->_stateQueue;
    v11->_stateQueue = (OS_dispatch_queue *)v15;

    v11->_skipLookup = 0;
    v11->_requiresAppToBeInstalled = v6;
    v11->_intentIsSynced = a5;
    long long v17 = [*p_descriptor bundleIdentifier];

    if (v17) {
      BOOL v18 = !v6;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18)
    {
      id v19 = +[ICAppRegistry sharedRegistry];
      id v20 = [*p_descriptor bundleIdentifier];
      v25[0] = v20;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      [v19 addInstallStatusObserver:v11 forAppIdentifiers:v21];
    }
    uint64_t v22 = v11;
  }

  return v11;
}

- (WFAppInstalledResource)initWithIntentDescriptor:(id)a3 isSyncedFromOtherDevice:(BOOL)a4
{
  return (WFAppInstalledResource *)[(WFAppInstalledResource *)self _initWithDescriptor:a3 requiresAppToBeInstalled:1 isSyncedFromOtherDevice:a4];
}

- (WFAppInstalledResource)initWithAppDescriptor:(id)a3 requiresAppToBeInstalled:(BOOL)a4
{
  return (WFAppInstalledResource *)[(WFAppInstalledResource *)self _initWithDescriptor:a3 requiresAppToBeInstalled:a4 isSyncedFromOtherDevice:0];
}

+ (BOOL)refreshesAvailabilityOnApplicationResume
{
  return 1;
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

@end