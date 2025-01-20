@interface PXContentPrivacyController
+ (id)privacyControllerForCollection:(id)a3;
+ (unint64_t)automaticAuthenticationBehaviorFromInternalSettings;
+ (void)tearDownPrivacyControllersIfNeeded;
- (BOOL)_isContentPrivacyPrefEnabled;
- (BOOL)authenticationAttemptDidFailOrWasCancelled;
- (BOOL)hasPerformedAuthenticationInStack;
- (BOOL)isContentPrivacyEnabled;
- (BOOL)isDelayedLockScheduled;
- (BOOL)isLocked;
- (BOOL)isPerformingAuthentication;
- (BOOL)shouldLockAfterDelayWhenLeavingViewHierarchy;
- (BOOL)shouldOnlyPerformAutomaticAuthenticationOnceInStack;
- (BOOL)shouldPerformAuthenticationUponAppearing;
- (BOOL)willPerformAuthenticationAutomatically;
- (LAContext)currentAuthenticationContext;
- (NSMutableArray)authenticationStack;
- (NSMutableSet)observers;
- (NSNumber)contentPrivacyEnabledNumberForTesting;
- (NSNumber)testingOverride_authenticationType;
- (NSNumber)testingOverride_autolockTimeout;
- (NSNumber)testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy;
- (NSNumber)testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce;
- (NSNumber)testingOverride_shouldPerformAuthenticationOnAppearing;
- (NSString)logIdentifier;
- (NSTimer)autolockTimer;
- (PXContentPrivacyController)initWithAssetCollectionToObserve:(id)a3 logIdentifier:(id)a4;
- (PXContentPrivacyController)initWithContentPrivacyEnabledForTesting:(id)a3 availableAuthenticationTypeForTesting:(id)a4 assetCollectionToObserveForTesting:(id)a5 automaticAuthenticationBehaviorForTesting:(unint64_t)a6;
- (PXContentPrivacyController)initWithLogIdentifier:(id)a3;
- (PXDisplayCollection)assetCollectionToObserve;
- (PXSystemAuthenticationTypeObserver)authenticationTypeObserver;
- (double)autolockTimeout;
- (id)authChallengeHandlerForTesting;
- (int64_t)_calculateAuthenticationTypeWithForcedUpdate:(BOOL)a3;
- (int64_t)authenticationType;
- (unint64_t)autolockReason;
- (unint64_t)automaticAuthenticationBehavior;
- (unint64_t)cachedAuthenticationStackCount;
- (void)_beginObservingApplicationStateChangesAndSystemEvents;
- (void)_beginObservingAssetCollectionChanges;
- (void)_beginObservingContentPrivacyPrefs;
- (void)_cancelAuthentication;
- (void)_cancelDelayedLockIfNeededWithReason:(id)a3;
- (void)_finishAuthenticationChallengeWithCompletionHandler:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_lockOrCancelAuthenticationIfNeeded;
- (void)_lockWithReasonForLogging:(id)a3;
- (void)_logCurrentAuthenticationStack;
- (void)_performDelayedAuthenticationTypeUpdate;
- (void)_performUserAuthenticationIfNeededAfterForegrounding;
- (void)_performUserAuthenticationWithTitle:(id)a3 passcodeTitle:(id)a4 passcodeSubtitle:(id)a5 reason:(id)a6 completion:(id)a7;
- (void)_startAutolockTimerForReason:(unint64_t)a3 resetIfActive:(BOOL)a4;
- (void)_stopAutolockTimer;
- (void)_stopObservingApplicationStateChanges;
- (void)_stopObservingAssetCollectionChanges;
- (void)_stopObservingContentPrivacyPrefs;
- (void)_updateAuthenticationType;
- (void)_updateCachedAuthenticationStackCount;
- (void)_updateContentPrivacyEnabled;
- (void)_updateWillPerformAuthenticationAutomatically;
- (void)addContextToStack:(id)a3;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)cancelAuthentication;
- (void)cancelDelayedLockIfNeeded;
- (void)clearAuthenticationStack;
- (void)commonInitWithLogIdentifier:(id)a3 automaticAuthenticationBehavior:(unint64_t)a4;
- (void)dealloc;
- (void)hostApplicationDidBecomeActiveFromNotification:(id)a3;
- (void)hostApplicationWillResignActiveFromNotification:(id)a3;
- (void)lockImmediately;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performUserAuthenticationIfNeededFromContext:(id)a3;
- (void)performUserAuthenticationIfNeededWithLocalizedReason:(id)a3 completion:(id)a4;
- (void)performUserAuthenticationIfNeededWithTitle:(id)a3 passcodeTitle:(id)a4 passcodeSubtitle:(id)a5 completion:(id)a6;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)removeContextFromStack:(id)a3;
- (void)resetHasPerformedAuthenticationInStack;
- (void)scheduleAuthenticationStackCountUpdate;
- (void)scheduleDelayedLock;
- (void)setAssetCollectionToObserve:(id)a3;
- (void)setAssetCollectionToObserveForTesting:(id)a3;
- (void)setAuthChallengeHandlerForTesting:(id)a3;
- (void)setAuthenticationAttemptDidFailOrWasCancelled:(BOOL)a3;
- (void)setAuthenticationType:(int64_t)a3;
- (void)setAutolockReason:(unint64_t)a3;
- (void)setAutolockTimer:(id)a3;
- (void)setAutomaticAuthenticationBehavior:(unint64_t)a3;
- (void)setCachedAuthenticationStackCount:(unint64_t)a3;
- (void)setContentPrivacyEnabled:(BOOL)a3;
- (void)setContentPrivacyEnabledNumberForTesting:(id)a3;
- (void)setCurrentAuthenticationContext:(id)a3;
- (void)setHasPerformedAuthenticationInStack:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setTestingOverride_authenticationType:(id)a3;
- (void)setTestingOverride_autolockTimeout:(id)a3;
- (void)setTestingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy:(id)a3;
- (void)setTestingOverride_shouldOnlyPerformAutomaticAuthenticationOnce:(id)a3;
- (void)setTestingOverride_shouldPerformAuthenticationOnAppearing:(id)a3;
- (void)setWillPerformAuthenticationAutomatically:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)unlock;
- (void)updateAuthenticationTypeImmediately;
- (void)viewDidAppearForAuthenticationContext:(id)a3;
- (void)viewDidDisappearForAuthenticationContext:(id)a3 withNavigationState:(unint64_t)a4;
@end

@implementation PXContentPrivacyController

- (PXContentPrivacyController)initWithLogIdentifier:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXContentPrivacyController;
  v5 = [(PXContentPrivacyController *)&v7 init];
  if (v5) {
    -[PXContentPrivacyController commonInitWithLogIdentifier:automaticAuthenticationBehavior:](v5, "commonInitWithLogIdentifier:automaticAuthenticationBehavior:", v4, [(id)objc_opt_class() automaticAuthenticationBehaviorFromInternalSettings]);
  }

  return v5;
}

+ (unint64_t)automaticAuthenticationBehaviorFromInternalSettings
{
  v2 = +[PXContentPrivacySettings sharedInstance];
  uint64_t v3 = [v2 authenticationBehaviorUponAppearing];

  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (PXContentPrivacyController)initWithAssetCollectionToObserve:(id)a3 logIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = [(PXContentPrivacyController *)self initWithLogIdentifier:a4];
  v8 = v7;
  if (v7)
  {
    [(PXContentPrivacyController *)v7 setAssetCollectionToObserve:v6];
    int v9 = objc_msgSend(v6, "px_isUserSmartAlbum");
    if ([(PXDisplayCollection *)v8->_assetCollectionToObserve px_isUserSmartAlbum]) {
      [(PXContentPrivacyController *)v8 _beginObservingAssetCollectionChanges];
    }
    if (v8->_contentPrivacyEnabled) {
      int v10 = v9;
    }
    else {
      int v10 = 0;
    }
    if (v10 == 1 && (objc_msgSend(v6, "px_isPrivacySensitiveAlbum") & 1) == 0)
    {
      v11 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [(PXContentPrivacyController *)v8 logIdentifier];
        int v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_INFO, "PrivacyController [%{public}@]: Initializing with contentPrivacyEnabled/locked = NO, since this smart album is not currently privacy sensitive", (uint8_t *)&v14, 0xCu);
      }
      v8->_contentPrivacyEnabled = 0;
      v8->_locked = 0;
    }
  }

  return v8;
}

+ (id)privacyControllerForCollection:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v5, "px_isPrivacySensitiveAlbum") & 1) == 0
    && !objc_msgSend(v5, "px_isUserSmartAlbum"))
  {
    v12 = 0;
    goto LABEL_19;
  }
  if (!_privacyControllersByKey)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_super v7 = (void *)_privacyControllersByKey;
    _privacyControllersByKey = (uint64_t)v6;
  }
  id v8 = v5;
  if (!v8)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    [v24 handleFailureInMethod:a2, a1, @"PXContentPrivacyController.m", 158, @"%@ should be an instance inheriting from %@, but it is nil", @"collection", v26 object file lineNumber description];
LABEL_24:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v27);
    v28 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v24 handleFailureInMethod:a2, a1, @"PXContentPrivacyController.m", 158, @"%@ should be an instance inheriting from %@, but it is %@", @"collection", v26, v28 object file lineNumber description];

    goto LABEL_24;
  }
LABEL_8:
  uint64_t v9 = [v8 assetCollectionSubtype];
  int v10 = [v8 localIdentifier];
  v11 = [NSString stringWithFormat:@"%ld_%@", v9, v10];
  v12 = [(id)_privacyControllersByKey objectForKeyedSubscript:v11];
  if (!v12)
  {
    v13 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v11;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_INFO, "PrivacyController: Creating instance of privacy controller, tracked by key: %@ for asset collection: %@", buf, 0x16u);
    }

    int v14 = [v8 localizedTitle];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v8 title];
    }
    v17 = v16;

    v18 = [v17 lowercaseString];
    v19 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v20 = [v18 stringByTrimmingCharactersInSet:v19];
    v21 = [v20 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F00B0030];

    if (![v21 length])
    {
      id v22 = v11;

      v21 = v22;
    }
    v12 = [[PXContentPrivacyController alloc] initWithAssetCollectionToObserve:v8 logIdentifier:v21];
    [(id)_privacyControllersByKey setObject:v12 forKeyedSubscript:v11];
  }
LABEL_19:

  return v12;
}

- (void)setAssetCollectionToObserve:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = (PXDisplayCollection *)a3;
  p_assetCollectionToObserve = &self->_assetCollectionToObserve;
  assetCollectionToObserve = self->_assetCollectionToObserve;
  if (assetCollectionToObserve != v5)
  {
    int v8 = [(PXDisplayCollection *)assetCollectionToObserve px_isPrivacySensitiveAlbum];
    objc_storeStrong((id *)&self->_assetCollectionToObserve, a3);
    int v9 = [(PXDisplayCollection *)*p_assetCollectionToObserve px_isPrivacySensitiveAlbum];
    if (v8 != v9)
    {
      int v10 = v9;
      v11 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(PXContentPrivacyController *)self logIdentifier];
        v13 = [(PXDisplayCollection *)*p_assetCollectionToObserve localizedTitle];
        int v14 = @"NO";
        if (v10) {
          int v14 = @"YES";
        }
        v15 = v14;
        int v16 = 138543874;
        v17 = v12;
        __int16 v18 = 2112;
        v19 = v13;
        __int16 v20 = 2114;
        v21 = v15;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Smart album '%@' just changed privacy sensitivity to %{public}@", (uint8_t *)&v16, 0x20u);
      }
      [(PXContentPrivacyController *)self _updateContentPrivacyEnabled];
    }
  }
}

- (void)_updateContentPrivacyEnabled
{
}

void __58__PXContentPrivacyController__updateContentPrivacyEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) isContentPrivacyEnabled];
  if ([*(id *)(a1 + 32) _isContentPrivacyPrefEnabled])
  {
    id v5 = [*(id *)(a1 + 32) assetCollectionToObserve];
    char v6 = objc_msgSend(v5, "px_isUserSmartAlbum");

    if (v6)
    {
      objc_super v7 = [*(id *)(a1 + 32) assetCollectionToObserve];
      uint64_t v8 = objc_msgSend(v7, "px_isPrivacySensitiveAlbum");

      if (v4 == v8) {
        goto LABEL_18;
      }
    }
    else
    {
      if (v4) {
        goto LABEL_18;
      }
      uint64_t v8 = 1;
    }
  }
  else
  {
    if ((v4 & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v8 = 0;
  }
  [v3 setContentPrivacyEnabled:v8];
  [v3 setLocked:v8];
  int v9 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [*(id *)(a1 + 32) logIdentifier];
    if (v8) {
      v11 = @"YES";
    }
    else {
      v11 = @"NO";
    }
    v12 = v11;
    v13 = v12;
    if ([v3 isLocked]) {
      int v14 = @"YES";
    }
    else {
      int v14 = @"NO";
    }
    v15 = v14;
    int v16 = 138543874;
    v17 = v10;
    __int16 v18 = 2114;
    v19 = v12;
    __int16 v20 = 2114;
    v21 = v15;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Content privacy 'enabled' just changed to %{public}@. Setting locked to %{public}@", (uint8_t *)&v16, 0x20u);
  }
LABEL_18:
}

- (BOOL)isContentPrivacyEnabled
{
  return self->_contentPrivacyEnabled;
}

- (void)commonInitWithLogIdentifier:(id)a3 automaticAuthenticationBehavior:(unint64_t)a4
{
  char v6 = (NSString *)[a3 copy];
  logIdentifier = self->_logIdentifier;
  self->_logIdentifier = v6;

  if (![(NSString *)self->_logIdentifier length])
  {
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    int v9 = [v8 UUIDString];
    int v10 = self->_logIdentifier;
    self->_logIdentifier = v9;
  }
  v11 = +[PXSystemAuthenticationTypeObserver sharedObserver];
  authenticationTypeObserver = self->_authenticationTypeObserver;
  self->_authenticationTypeObserver = v11;

  self->_authenticationType = [(PXSystemAuthenticationTypeObserver *)self->_authenticationTypeObserver authenticationType];
  [(PXSystemAuthenticationTypeObserver *)self->_authenticationTypeObserver registerChangeObserver:self context:PXSystemAuthenticationTypeObserverContext];
  BOOL v13 = [(PXContentPrivacyController *)self _isContentPrivacyPrefEnabled];
  self->_contentPrivacyEnabled = v13;
  self->_locked = v13;
  switch(a4)
  {
    case 2uLL:
      self->_willPerformAuthenticationAutomatically = 1;
      break;
    case 1uLL:
      self->_willPerformAuthenticationAutomatically = (unint64_t)(self->_authenticationType - 3) < 3;
      break;
    case 0uLL:
      self->_willPerformAuthenticationAutomatically = 0;
      break;
  }
  int v14 = [MEMORY[0x1E4F1CA80] set];
  observers = self->_observers;
  self->_observers = v14;

  int v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  authenticationStack = self->_authenticationStack;
  self->_authenticationStack = v16;

  [(PXContentPrivacyController *)self _beginObservingApplicationStateChangesAndSystemEvents];
  [(PXContentPrivacyController *)self _beginObservingContentPrivacyPrefs];
  id v18 = +[PXContentPrivacySettings sharedInstance];
  [v18 addDeferredKeyObserver:self];
}

- (BOOL)_isContentPrivacyPrefEnabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (PFProcessIsLaunchedToExecuteTests())
  {
    id v3 = [(PXContentPrivacyController *)self contentPrivacyEnabledNumberForTesting];

    if (v3)
    {
      int v4 = [(PXContentPrivacyController *)self contentPrivacyEnabledNumberForTesting];
      char v5 = [v4 BOOLValue];

      return v5;
    }
  }
  objc_super v7 = +[PXContentPrivacySettings sharedInstance];
  uint64_t v8 = [v7 simulationMode];
  if (v8 == 1)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    if (!v8)
    {
      int v9 = PLIsContentPrivacyEnabled();
      int64_t v10 = [(PXContentPrivacyController *)self authenticationType];
      if (!v9 || v10 != 1) {
        goto LABEL_13;
      }
      v11 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(PXContentPrivacyController *)self logIdentifier];
        int v13 = 138543362;
        int v14 = v12;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Even though the content privacy pref is enabled, there is no configured authentication method. Treating content privacy as if it were DISABLED.", (uint8_t *)&v13, 0xCu);
      }
    }
    LOBYTE(v9) = 0;
  }
LABEL_13:

  return v9;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (int64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)_beginObservingContentPrivacyPrefs
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_preferencesDidChange, @"com.apple.mobileslideshow.PreferenceChanged", 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_beginObservingApplicationStateChangesAndSystemEvents
{
  objc_initWeak(location, self);
  if ([(PXContentPrivacyController *)self isRunningInExtension])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v4 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v5 = *MEMORY[0x1E4FB2738];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_3;
    v51[3] = &unk_1E5DCFD58;
    objc_copyWeak(&v52, location);
    char v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v51];

    objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v9 = *MEMORY[0x1E4FB2628];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_4;
    v49[3] = &unk_1E5DCFD58;
    objc_copyWeak(&v50, location);
    int64_t v10 = [v7 addObserverForName:v9 object:0 queue:v8 usingBlock:v49];

    v11 = [(PXContentPrivacyController *)self observers];
    [v11 addObject:v6];

    v12 = [(PXContentPrivacyController *)self observers];
    [v12 addObject:v10];

    int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v14 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v15 = *MEMORY[0x1E4F28288];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_5;
    v47[3] = &unk_1E5DCFD58;
    objc_copyWeak(&v48, location);
    v40 = [v13 addObserverForName:v15 object:0 queue:v14 usingBlock:v47];

    int v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v17 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v18 = *MEMORY[0x1E4F28270];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_6;
    v45[3] = &unk_1E5DCFD58;
    objc_copyWeak(&v46, location);
    v19 = [v16 addObserverForName:v18 object:0 queue:v17 usingBlock:v45];

    __int16 v20 = [(PXContentPrivacyController *)self observers];
    [v20 addObject:v40];

    v21 = [(PXContentPrivacyController *)self observers];
    [v21 addObject:v19];

    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v23 = [MEMORY[0x1E4F28F08] mainQueue];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_7;
    v43[3] = &unk_1E5DCFD58;
    objc_copyWeak(&v44, location);
    v24 = [v22 addObserverForName:@"_UIViewServiceHostWillResignActiveNotification" object:0 queue:v23 usingBlock:v43];

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v26 = [MEMORY[0x1E4F28F08] mainQueue];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_8;
    v41[3] = &unk_1E5DCFD58;
    objc_copyWeak(&v42, location);
    v27 = [v25 addObserverForName:@"_UIViewServiceHostDidBecomeActiveNotification" object:0 queue:v26 usingBlock:v41];

    v28 = [(PXContentPrivacyController *)self observers];
    [v28 addObject:v24];

    v29 = [(PXContentPrivacyController *)self observers];
    [v29 addObject:v27];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    v30 = &v50;
    __int16 v31 = &v52;
  }
  else
  {
    id v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v33 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v34 = *MEMORY[0x1E4FB2640];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke;
    v55[3] = &unk_1E5DCFD58;
    __int16 v31 = &v56;
    objc_copyWeak(&v56, location);
    char v6 = [v32 addObserverForName:v34 object:0 queue:v33 usingBlock:v55];

    v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v36 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v37 = *MEMORY[0x1E4FB2EB0];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_2;
    v53[3] = &unk_1E5DCFD58;
    v30 = &v54;
    objc_copyWeak(&v54, location);
    int64_t v10 = [v35 addObserverForName:v37 object:0 queue:v36 usingBlock:v53];

    v38 = [(PXContentPrivacyController *)self observers];
    [v38 addObject:v6];

    v39 = [(PXContentPrivacyController *)self observers];
    [v39 addObject:v10];
  }
  objc_destroyWeak(v30);

  objc_destroyWeak(v31);
  objc_destroyWeak(location);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

uint64_t __58__PXContentPrivacyController__updateContentPrivacyEnabled__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PXContentPrivacyController__updateContentPrivacyEnabled__block_invoke_2;
  v3[3] = &unk_1E5DCDA18;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __75__PXContentPrivacyController__updateWillPerformAuthenticationAutomatically__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWillPerformAuthenticationAutomatically:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __55__PXContentPrivacyController__updateAuthenticationType__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAuthenticationType:*(void *)(a1 + 32)];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXSystemAuthenticationTypeObserverContext == a5)
  {
    [(PXContentPrivacyController *)self _updateAuthenticationType];
    [(PXContentPrivacyController *)self _updateContentPrivacyEnabled];
    [(PXContentPrivacyController *)self _updateWillPerformAuthenticationAutomatically];
  }
}

- (void)_updateWillPerformAuthenticationAutomatically
{
  BOOL v3 = [(PXContentPrivacyController *)self shouldPerformAuthenticationUponAppearing];
  BOOL v4 = [(PXContentPrivacyController *)self authenticationAttemptDidFailOrWasCancelled];
  BOOL v5 = [(PXContentPrivacyController *)self shouldOnlyPerformAutomaticAuthenticationOnceInStack];
  if (v5) {
    LOBYTE(v5) = [(PXContentPrivacyController *)self hasPerformedAuthenticationInStack];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PXContentPrivacyController__updateWillPerformAuthenticationAutomatically__block_invoke;
  v6[3] = &__block_descriptor_33_e71_v16__0__PXContentPrivacyController_PXMutableContentPrivacyController__8l;
  char v7 = v3 ^ (v3 && (v4 || v5));
  [(PXContentPrivacyController *)self performChanges:v6];
}

- (void)_updateAuthenticationType
{
  int64_t v3 = [(PXContentPrivacyController *)self _calculateAuthenticationTypeWithForcedUpdate:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__PXContentPrivacyController__updateAuthenticationType__block_invoke;
  v4[3] = &__block_descriptor_40_e71_v16__0__PXContentPrivacyController_PXMutableContentPrivacyController__8l;
  v4[4] = v3;
  [(PXContentPrivacyController *)self performChanges:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authChallengeHandlerForTesting, 0);
  objc_storeStrong((id *)&self->_testingOverride_autolockTimeout, 0);
  objc_storeStrong((id *)&self->_testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy, 0);
  objc_storeStrong((id *)&self->_testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce, 0);
  objc_storeStrong((id *)&self->_testingOverride_shouldPerformAuthenticationOnAppearing, 0);
  objc_storeStrong((id *)&self->_testingOverride_authenticationType, 0);
  objc_storeStrong((id *)&self->_contentPrivacyEnabledNumberForTesting, 0);
  objc_storeStrong((id *)&self->_authenticationStack, 0);
  objc_storeStrong((id *)&self->_assetCollectionToObserve, 0);
  objc_storeStrong((id *)&self->_autolockTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_authenticationTypeObserver, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setAuthChallengeHandlerForTesting:(id)a3
{
}

- (id)authChallengeHandlerForTesting
{
  return self->_authChallengeHandlerForTesting;
}

- (void)setTestingOverride_autolockTimeout:(id)a3
{
}

- (NSNumber)testingOverride_autolockTimeout
{
  return self->_testingOverride_autolockTimeout;
}

- (void)setTestingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy:(id)a3
{
}

- (NSNumber)testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy
{
  return self->_testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy;
}

- (void)setTestingOverride_shouldOnlyPerformAutomaticAuthenticationOnce:(id)a3
{
}

- (NSNumber)testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce
{
  return self->_testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce;
}

- (void)setTestingOverride_shouldPerformAuthenticationOnAppearing:(id)a3
{
}

- (NSNumber)testingOverride_shouldPerformAuthenticationOnAppearing
{
  return self->_testingOverride_shouldPerformAuthenticationOnAppearing;
}

- (NSNumber)testingOverride_authenticationType
{
  return self->_testingOverride_authenticationType;
}

- (void)setContentPrivacyEnabledNumberForTesting:(id)a3
{
}

- (NSNumber)contentPrivacyEnabledNumberForTesting
{
  return self->_contentPrivacyEnabledNumberForTesting;
}

- (BOOL)authenticationAttemptDidFailOrWasCancelled
{
  return self->_authenticationAttemptDidFailOrWasCancelled;
}

- (void)setHasPerformedAuthenticationInStack:(BOOL)a3
{
  self->_hasPerformedAuthenticationInStack = a3;
}

- (BOOL)hasPerformedAuthenticationInStack
{
  return self->_hasPerformedAuthenticationInStack;
}

- (void)setCachedAuthenticationStackCount:(unint64_t)a3
{
  self->_cachedAuthenticationStackCount = a3;
}

- (unint64_t)cachedAuthenticationStackCount
{
  return self->_cachedAuthenticationStackCount;
}

- (NSMutableArray)authenticationStack
{
  return self->_authenticationStack;
}

- (PXDisplayCollection)assetCollectionToObserve
{
  return self->_assetCollectionToObserve;
}

- (void)setAutolockReason:(unint64_t)a3
{
  self->_autolockReason = a3;
}

- (unint64_t)autolockReason
{
  return self->_autolockReason;
}

- (void)setAutolockTimer:(id)a3
{
}

- (NSTimer)autolockTimer
{
  return self->_autolockTimer;
}

- (void)setObservers:(id)a3
{
}

- (void)setCurrentAuthenticationContext:(id)a3
{
}

- (LAContext)currentAuthenticationContext
{
  return self->_currentAuthenticationContext;
}

- (PXSystemAuthenticationTypeObserver)authenticationTypeObserver
{
  return self->_authenticationTypeObserver;
}

- (BOOL)willPerformAuthenticationAutomatically
{
  return self->_willPerformAuthenticationAutomatically;
}

- (unint64_t)automaticAuthenticationBehavior
{
  return self->_automaticAuthenticationBehavior;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = NSStringFromSelector(sel_simulationMode);
  if ([v5 isEqualToString:v6])
  {
  }
  else
  {
    char v7 = NSStringFromSelector(sel_simulatedAuthenticationType);
    int v8 = [v5 isEqualToString:v7];

    if (!v8) {
      goto LABEL_7;
    }
  }
  uint64_t v9 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v10 = [(PXContentPrivacyController *)self logIdentifier];
    int v11 = 138543618;
    v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Internal settings key '%@' changed. Updating content privacy enabled state.", (uint8_t *)&v11, 0x16u);
  }
  [(PXContentPrivacyController *)self _updateAuthenticationType];
  [(PXContentPrivacyController *)self _updateContentPrivacyEnabled];
  [(PXContentPrivacyController *)self _updateWillPerformAuthenticationAutomatically];
LABEL_7:
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [(PXContentPrivacyController *)self assetCollectionToObserve];
  int v7 = objc_msgSend(v6, "px_isUserSmartAlbum");

  if (!v7) {
    goto LABEL_13;
  }
  int v8 = [(PXContentPrivacyController *)self assetCollectionToObserve];
  if (!v8)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"PXContentPrivacyController.m", 1416, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollectionToObserve", v22 object file lineNumber description];
LABEL_16:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v23);
    v24 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:a2, self, @"PXContentPrivacyController.m", 1416, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollectionToObserve", v22, v24 object file lineNumber description];

    goto LABEL_16;
  }
LABEL_4:
  uint64_t v9 = [v5 changeDetailsForObject:v8];
  int64_t v10 = v9;
  if (v9)
  {
    int v11 = [v9 objectAfterChanges];
    int v12 = objc_msgSend(v8, "px_isPrivacySensitiveAlbum");
    int v13 = objc_msgSend(v11, "px_isPrivacySensitiveAlbum");
    if (v12 != v13)
    {
      int v14 = v13;
      uint64_t v15 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [(PXContentPrivacyController *)self logIdentifier];
        v17 = [v11 title];
        uint64_t v18 = @"NO";
        if (v14) {
          uint64_t v18 = @"YES";
        }
        v19 = v18;
        *(_DWORD *)buf = 138543874;
        v26 = v16;
        __int16 v27 = 2112;
        v28 = v17;
        __int16 v29 = 2114;
        v30 = v19;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Smart album '%@' just changed privacy sensitivity to %{public}@", buf, 0x20u);
      }
    }
    [(PXContentPrivacyController *)self setAssetCollectionToObserve:v11];
  }
LABEL_13:
}

- (void)_stopObservingAssetCollectionChanges
{
  int64_t v3 = [(PXContentPrivacyController *)self assetCollectionToObserve];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v3;

    BOOL v4 = v5;
    if (!v5) {
      goto LABEL_7;
    }
    int64_t v3 = [v5 photoLibrary];
    objc_msgSend(v3, "px_unregisterChangeObserver:", self);
  }
  else
  {
    id v5 = 0;
  }

  BOOL v4 = v5;
LABEL_7:
}

- (void)_beginObservingAssetCollectionChanges
{
  int64_t v3 = [(PXContentPrivacyController *)self assetCollectionToObserve];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v3;

    BOOL v4 = v5;
    if (!v5) {
      goto LABEL_7;
    }
    int64_t v3 = [v5 photoLibrary];
    objc_msgSend(v3, "px_registerChangeObserver:", self);
  }
  else
  {
    id v5 = 0;
  }

  BOOL v4 = v5;
LABEL_7:
}

- (void)_stopObservingContentPrivacyPrefs
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobileslideshow.PreferenceChanged", 0);
}

- (void)setContentPrivacyEnabled:(BOOL)a3
{
  if (self->_contentPrivacyEnabled != a3)
  {
    self->_contentPrivacyEnabled = a3;
    [(PXContentPrivacyController *)self signalChange:2];
  }
}

- (void)setAssetCollectionToObserveForTesting:(id)a3
{
  id v4 = a3;
  if (PFProcessIsLaunchedToExecuteTests()) {
    [(PXContentPrivacyController *)self setAssetCollectionToObserve:v4];
  }
}

- (double)autolockTimeout
{
  if (!PFProcessIsLaunchedToExecuteTests()) {
    return 0.0;
  }
  int64_t v3 = [(PXContentPrivacyController *)self testingOverride_autolockTimeout];

  if (!v3) {
    return 0.0;
  }
  id v4 = [(PXContentPrivacyController *)self testingOverride_autolockTimeout];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (BOOL)shouldLockAfterDelayWhenLeavingViewHierarchy
{
  if (!PFProcessIsLaunchedToExecuteTests()) {
    return 0;
  }
  int64_t v3 = [(PXContentPrivacyController *)self testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy];

  if (!v3) {
    return 0;
  }
  id v4 = [(PXContentPrivacyController *)self testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)shouldOnlyPerformAutomaticAuthenticationOnceInStack
{
  if (PFProcessIsLaunchedToExecuteTests()
    && ([(PXContentPrivacyController *)self testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce], int64_t v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    id v4 = [(PXContentPrivacyController *)self testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce];
    char v5 = [v4 BOOLValue];

    return v5;
  }
  else
  {
    return [(PXContentPrivacyController *)self isRunningInExtension];
  }
}

- (BOOL)shouldPerformAuthenticationUponAppearing
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (PFProcessIsLaunchedToExecuteTests()
    && ([(PXContentPrivacyController *)self testingOverride_shouldPerformAuthenticationOnAppearing], int64_t v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    id v4 = [(PXContentPrivacyController *)self testingOverride_shouldPerformAuthenticationOnAppearing];
    char v5 = [v4 BOOLValue];

    BOOL v6 = [(PXContentPrivacyController *)self shouldOnlyPerformAutomaticAuthenticationOnceInStack];
    if ((v5 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    unint64_t v7 = [(PXContentPrivacyController *)self automaticAuthenticationBehavior];
    if (!v7)
    {
      [(PXContentPrivacyController *)self shouldOnlyPerformAutomaticAuthenticationOnceInStack];
      return 0;
    }
    if (v7 == 1)
    {
      unint64_t v8 = [(PXContentPrivacyController *)self authenticationType];
      unint64_t v9 = v8 - 3;
      int64_t v10 = PXDebugDescriptionFromSystemAuthenticationType(v8);
      int v11 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = [(PXContentPrivacyController *)self logIdentifier];
        int v13 = @"NO";
        if (v9 < 3) {
          int v13 = @"YES";
        }
        int v14 = v13;
        int v20 = 138543874;
        v21 = v12;
        __int16 v22 = 2114;
        v23 = v14;
        __int16 v24 = 2114;
        v25 = v10;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Should perform authentication upon appearing: %{public}@ (authentication type: %{public}@)", (uint8_t *)&v20, 0x20u);
      }
      BOOL v6 = [(PXContentPrivacyController *)self shouldOnlyPerformAutomaticAuthenticationOnceInStack];
      if (v9 > 2) {
        return 0;
      }
    }
    else
    {
      BOOL v6 = [(PXContentPrivacyController *)self shouldOnlyPerformAutomaticAuthenticationOnceInStack];
    }
  }
  BOOL v15 = v6;
  BOOL v16 = [(PXContentPrivacyController *)self hasPerformedAuthenticationInStack];
  BOOL result = 1;
  if (v16 && v15)
  {
    uint64_t v18 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(PXContentPrivacyController *)self logIdentifier];
      int v20 = 138543362;
      v21 = v19;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Skipping automatic authentication because we've already perform authentication once while in this stack", (uint8_t *)&v20, 0xCu);
    }
    return 0;
  }
  return result;
}

- (void)_performUserAuthenticationWithTitle:(id)a3 passcodeTitle:(id)a4 passcodeSubtitle:(id)a5 reason:(id)a6 completion:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [(PXContentPrivacyController *)self logIdentifier];
    *(_DWORD *)buf = 138543362;
    id v42 = v18;
    _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Got a request to perform authentication.", buf, 0xCu);
  }
  [(PXContentPrivacyController *)self _cancelDelayedLockIfNeededWithReason:@"performing user authentication requested"];
  if ([(PXContentPrivacyController *)self isLocked])
  {
    objc_initWeak(&location, self);
    if (PFProcessIsLaunchedToExecuteTests())
    {
      v19 = [(PXContentPrivacyController *)self authChallengeHandlerForTesting];
      BOOL v20 = v19 == 0;

      if (!v20)
      {
        v21 = [(PXContentPrivacyController *)self authChallengeHandlerForTesting];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __115__PXContentPrivacyController__performUserAuthenticationWithTitle_passcodeTitle_passcodeSubtitle_reason_completion___block_invoke;
        v37[3] = &unk_1E5DCD9C8;
        objc_copyWeak(&v39, &location);
        id v38 = v16;
        ((void (**)(void, void *))v21)[2](v21, v37);

        objc_destroyWeak(&v39);
LABEL_14:
        objc_destroyWeak(&location);
        goto LABEL_31;
      }
    }
    if ([(PXContentPrivacyController *)self isPerformingAuthentication])
    {
      __int16 v24 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = [(PXContentPrivacyController *)self logIdentifier];
        *(_DWORD *)buf = 138543362;
        id v42 = v25;
        _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_ERROR, "PrivacyController [%{public}@]: Got a request to perform authentication while already performing authentication. Ignoring.", buf, 0xCu);
      }
      goto LABEL_14;
    }
    if ([(PXContentPrivacyController *)self authenticationType] == 1)
    {
      uint64_t v26 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = [(PXContentPrivacyController *)self logIdentifier];
        *(_DWORD *)buf = 138543362;
        id v42 = v27;
        _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: LocalAuthentication not possible because the device has no biometrics or passcode/password set at all.", buf, 0xCu);
      }
      [(PXContentPrivacyController *)self _finishAuthenticationChallengeWithCompletionHandler:v16 success:1 error:0];
    }
    else
    {
      v28 = PXDebugDescriptionFromSystemAuthenticationType([(PXContentPrivacyController *)self authenticationType]);
      __int16 v29 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [(PXContentPrivacyController *)self logIdentifier];
        *(_DWORD *)buf = 138543618;
        id v42 = v30;
        __int16 v43 = 2114;
        id v44 = v28;
        _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Performing user authentication challenge. Expected authentication type: %{public}@", buf, 0x16u);
      }
      id v31 = objc_alloc_init(MEMORY[0x1E4F30B50]);
      id v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
      uint64_t v33 = v32;
      if (v12) {
        [v32 setObject:v12 forKeyedSubscript:&unk_1F02D9DF0];
      }
      if (v13) {
        [v33 setObject:v13 forKeyedSubscript:&unk_1F02D9E08];
      }
      if (v14) {
        [v33 setObject:v14 forKeyedSubscript:&unk_1F02D9E20];
      }
      if (v15) {
        [v33 setObject:v15 forKeyedSubscript:&unk_1F02D9E38];
      }
      [(PXContentPrivacyController *)self setCurrentAuthenticationContext:v31];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __115__PXContentPrivacyController__performUserAuthenticationWithTitle_passcodeTitle_passcodeSubtitle_reason_completion___block_invoke_314;
      v34[3] = &unk_1E5DCD9F0;
      v34[4] = self;
      objc_copyWeak(&v36, &location);
      id v35 = v16;
      [v31 evaluatePolicy:2 options:v33 reply:v34];

      objc_destroyWeak(&v36);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v22 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(PXContentPrivacyController *)self logIdentifier];
      *(_DWORD *)buf = 138543362;
      id v42 = v23;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Tried to perform a user authentication, but was already unlocked.", buf, 0xCu);
    }
    [(PXContentPrivacyController *)self _finishAuthenticationChallengeWithCompletionHandler:v16 success:1 error:0];
  }
LABEL_31:
}

void __115__PXContentPrivacyController__performUserAuthenticationWithTitle_passcodeTitle_passcodeSubtitle_reason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _finishAuthenticationChallengeWithCompletionHandler:*(void *)(a1 + 32) success:a2 error:v6];
}

void __115__PXContentPrivacyController__performUserAuthenticationWithTitle_passcodeTitle_passcodeSubtitle_reason_completion___block_invoke_314(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(__CFString *)v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F30B38]]) {
    BOOL v6 = [(__CFString *)v4 code] == -2 || [(__CFString *)v4 code] == -9;
  }
  else {
    BOOL v6 = 0;
  }

  unint64_t v7 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = [*(id *)(a1 + 32) logIdentifier];
    unint64_t v9 = @"NO";
    if (!v4) {
      unint64_t v9 = @"YES";
    }
    int64_t v10 = v9;
    int v18 = 138543618;
    v19 = v8;
    __int16 v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: LocalAuthentication returned with success: %{public}@.", (uint8_t *)&v18, 0x16u);
  }
  if (v4)
  {
    int v11 = PLContentPrivacyUIGetLog();
    id v12 = v11;
    if (v6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [*(id *)(a1 + 32) logIdentifier];
        int v18 = 138543618;
        v19 = v13;
        __int16 v20 = 2112;
        v21 = v4;
        id v14 = "PrivacyController [%{public}@]: LocalAuthentication cancellation: %@.";
        id v15 = v12;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
        _os_log_impl(&dword_1A9AE7000, v15, v16, v14, (uint8_t *)&v18, 0x16u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = [*(id *)(a1 + 32) logIdentifier];
      int v18 = 138543618;
      v19 = v13;
      __int16 v20 = 2112;
      v21 = v4;
      id v14 = "PrivacyController [%{public}@]: LocalAuthentication error: %@.";
      id v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishAuthenticationChallengeWithCompletionHandler:*(void *)(a1 + 40) success:v4 == 0 error:v4];
}

- (void)performUserAuthenticationIfNeededWithLocalizedReason:(id)a3 completion:(id)a4
{
}

- (void)performUserAuthenticationIfNeededWithTitle:(id)a3 passcodeTitle:(id)a4 passcodeSubtitle:(id)a5 completion:(id)a6
{
}

- (void)_finishAuthenticationChallengeWithCompletionHandler:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = v6;
  px_dispatch_on_main_queue();
}

uint64_t __96__PXContentPrivacyController__finishAuthenticationChallengeWithCompletionHandler_success_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentAuthenticationContext:0];
  [*(id *)(a1 + 32) setHasPerformedAuthenticationInStack:1];
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__PXContentPrivacyController__finishAuthenticationChallengeWithCompletionHandler_success_error___block_invoke_2;
  v5[3] = &__block_descriptor_33_e71_v16__0__PXContentPrivacyController_PXMutableContentPrivacyController__8l;
  char v6 = *(unsigned char *)(a1 + 56);
  [v2 performChanges:v5];
  [*(id *)(a1 + 32) _updateWillPerformAuthenticationAutomatically];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
  }
  return [*(id *)(a1 + 32) setAuthenticationAttemptDidFailOrWasCancelled:*(unsigned char *)(a1 + 56) == 0];
}

uint64_t __96__PXContentPrivacyController__finishAuthenticationChallengeWithCompletionHandler_success_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setLocked:*(unsigned char *)(a1 + 32) == 0];
}

- (void)unlock
{
}

uint64_t __36__PXContentPrivacyController_unlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:&__block_literal_global_301_263244];
}

uint64_t __36__PXContentPrivacyController_unlock__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setLocked:0];
}

- (BOOL)isDelayedLockScheduled
{
  v2 = [(PXContentPrivacyController *)self autolockTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_cancelDelayedLockIfNeededWithReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(PXContentPrivacyController *)self autolockTimer];

  if (v5)
  {
    char v6 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(PXContentPrivacyController *)self logIdentifier];
      int v8 = 138543618;
      unint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Cancelling scheduled auto-lock with reason: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [(PXContentPrivacyController *)self _stopAutolockTimer];
  }
}

- (void)cancelDelayedLockIfNeeded
{
}

- (void)scheduleDelayedLock
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(PXContentPrivacyController *)self isPerformingAuthentication])
  {
    BOOL v3 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(PXContentPrivacyController *)self logIdentifier];
      int v7 = 138543362;
      int v8 = v4;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Scheduled lock requested. But we are locked and in the middle of authentication. Cancelling active user authentication.", (uint8_t *)&v7, 0xCu);
    }
    [(PXContentPrivacyController *)self _cancelAuthentication];
  }
  else if (![(PXContentPrivacyController *)self isLocked])
  {
    char v5 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = [(PXContentPrivacyController *)self logIdentifier];
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Scheduled lock requested. Resetting any ongoing auto-lock timer.", (uint8_t *)&v7, 0xCu);
    }
    [(PXContentPrivacyController *)self _startAutolockTimerForReason:0 resetIfActive:1];
  }
}

- (void)lockImmediately
{
}

void __45__PXContentPrivacyController_lockImmediately__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isContentPrivacyEnabled])
  {
    if ([*(id *)(a1 + 32) isPerformingAuthentication])
    {
      v2 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v3 = [*(id *)(a1 + 32) logIdentifier];
        int v7 = 138543362;
        int v8 = v3;
        _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Lock immediately requested, cancelling active user authentication.", (uint8_t *)&v7, 0xCu);
      }
      [*(id *)(a1 + 32) _cancelAuthentication];
    }
    else if (([*(id *)(a1 + 32) isLocked] & 1) == 0)
    {
      [*(id *)(a1 + 32) _cancelDelayedLockIfNeededWithReason:@"locking immediately requested"];
      char v6 = *(void **)(a1 + 32);
      [v6 performChanges:&__block_literal_global_296_263255];
    }
  }
  else
  {
    id v4 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = [*(id *)(a1 + 32) logIdentifier];
      int v7 = 138543362;
      int v8 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Ignoring request to lock immediately, as the content privacy pref is disabled.", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __45__PXContentPrivacyController_lockImmediately__block_invoke_294(uint64_t a1, void *a2)
{
  return [a2 setLocked:1];
}

- (void)_lockOrCancelAuthenticationIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXContentPrivacyController *)self shouldLockAfterDelayWhenLeavingViewHierarchy];
  id v4 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(PXContentPrivacyController *)self logIdentifier];
    char v6 = (void *)v5;
    int v7 = @"immediately";
    if (v3) {
      int v7 = @"after delay";
    }
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: View Controller leaving view hierarchy, locking privacy controller %{public}@, if unlocked, or cancelling authentication.", (uint8_t *)&v8, 0x16u);
  }
  if (v3) {
    [(PXContentPrivacyController *)self scheduleDelayedLock];
  }
  else {
    [(PXContentPrivacyController *)self lockImmediately];
  }
}

- (void)setLocked:(BOOL)a3
{
  if (self->_locked != a3)
  {
    self->_locked = a3;
    [(PXContentPrivacyController *)self signalChange:1];
  }
}

- (void)_cancelAuthentication
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXContentPrivacyController *)self currentAuthenticationContext];

  id v4 = PLContentPrivacyUIGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      char v6 = [(PXContentPrivacyController *)self logIdentifier];
      int v7 = [(PXContentPrivacyController *)self currentAuthenticationContext];
      int v9 = 138543618;
      __int16 v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Cancelling current authentication request: %@", (uint8_t *)&v9, 0x16u);
    }
    id v4 = [(PXContentPrivacyController *)self currentAuthenticationContext];
    [v4 invalidate];
  }
  else if (v5)
  {
    int v8 = [(PXContentPrivacyController *)self logIdentifier];
    int v9 = 138543362;
    __int16 v10 = v8;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Received request to cancel authentication, but there wasn't an active authentication request.", (uint8_t *)&v9, 0xCu);
  }
}

- (void)cancelAuthentication
{
}

uint64_t __50__PXContentPrivacyController_cancelAuthentication__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelAuthentication];
}

- (BOOL)isPerformingAuthentication
{
  v2 = [(PXContentPrivacyController *)self currentAuthenticationContext];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setAuthenticationAttemptDidFailOrWasCancelled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_authenticationAttemptDidFailOrWasCancelled != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = [(PXContentPrivacyController *)self logIdentifier];
      int v7 = @"NO";
      if (v3) {
        int v7 = @"YES";
      }
      int v8 = v7;
      int v9 = 138543618;
      __int16 v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Setting 'authentication did fail or cancelled' flag to %@", (uint8_t *)&v9, 0x16u);
    }
    self->_authenticationAttemptDidFailOrWasCancelled = v3;
    [(PXContentPrivacyController *)self _updateWillPerformAuthenticationAutomatically];
  }
}

- (void)setWillPerformAuthenticationAutomatically:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL willPerformAuthenticationAutomatically = self->_willPerformAuthenticationAutomatically;
  if (willPerformAuthenticationAutomatically != a3)
  {
    BOOL v4 = a3;
    self->_BOOL willPerformAuthenticationAutomatically = a3;
    [(PXContentPrivacyController *)self signalChange:8];
    char v6 = [(PXContentPrivacyController *)self authenticationStack];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      BOOL v8 = [(PXContentPrivacyController *)self hasPerformedAuthenticationInStack];
      if (!willPerformAuthenticationAutomatically && !v8 && v4)
      {
        int v9 = PLContentPrivacyUIGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v10 = [(PXContentPrivacyController *)self logIdentifier];
          int v11 = 138543362;
          uint64_t v12 = v10;
          _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: While in privacy sensitive area, we changed authentication type to one that should automatically attempt authentication. Authenticating...", (uint8_t *)&v11, 0xCu);
        }
        [(PXContentPrivacyController *)self _performUserAuthenticationIfNeededAfterForegrounding];
      }
    }
  }
}

- (void)setAutomaticAuthenticationBehavior:(unint64_t)a3
{
  if (self->_automaticAuthenticationBehavior != a3)
  {
    self->_automaticAuthenticationBehavior = a3;
    [(PXContentPrivacyController *)self _updateWillPerformAuthenticationAutomatically];
  }
}

- (void)setTestingOverride_authenticationType:(id)a3
{
  BOOL v8 = (NSNumber *)a3;
  BOOL v5 = self->_testingOverride_authenticationType;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = v5;
    char v7 = [(NSNumber *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_testingOverride_authenticationType, a3);
      [(PXContentPrivacyController *)self _updateAuthenticationType];
      [(PXContentPrivacyController *)self _updateContentPrivacyEnabled];
      [(PXContentPrivacyController *)self _updateWillPerformAuthenticationAutomatically];
    }
  }
}

- (void)_performDelayedAuthenticationTypeUpdate
{
  [(PXContentPrivacyController *)self _updateAuthenticationType];
  [(PXContentPrivacyController *)self _updateContentPrivacyEnabled];
  [(PXContentPrivacyController *)self _updateWillPerformAuthenticationAutomatically];
}

- (void)setAuthenticationType:(int64_t)a3
{
  if (self->_authenticationType != a3)
  {
    self->_authenticationType = a3;
    [(PXContentPrivacyController *)self signalChange:4];
  }
}

- (void)updateAuthenticationTypeImmediately
{
  int64_t v3 = [(PXContentPrivacyController *)self _calculateAuthenticationTypeWithForcedUpdate:1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__PXContentPrivacyController_updateAuthenticationTypeImmediately__block_invoke;
  v4[3] = &__block_descriptor_40_e71_v16__0__PXContentPrivacyController_PXMutableContentPrivacyController__8l;
  v4[4] = v3;
  [(PXContentPrivacyController *)self performChanges:v4];
}

uint64_t __65__PXContentPrivacyController_updateAuthenticationTypeImmediately__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAuthenticationType:*(void *)(a1 + 32)];
}

- (int64_t)_calculateAuthenticationTypeWithForcedUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (PFProcessIsLaunchedToExecuteTests()
    && ([(PXContentPrivacyController *)self testingOverride_authenticationType],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    char v6 = [(PXContentPrivacyController *)self testingOverride_authenticationType];
    uint64_t v7 = [v6 unsignedLongValue];
LABEL_15:
    int64_t v16 = v7;

    return v16;
  }
  else
  {
    BOOL v8 = +[PXContentPrivacySettings sharedInstance];
    uint64_t v9 = [v8 simulatedAuthenticationType];

    uint64_t v10 = 1;
    switch(v9)
    {
      case 0:
        if (v3)
        {
          id v15 = [(PXContentPrivacyController *)self authenticationTypeObserver];
          [v15 updateAuthenticationTypeImmediately];
        }
        char v6 = [(PXContentPrivacyController *)self authenticationTypeObserver];
        uint64_t v7 = [v6 authenticationType];
        goto LABEL_15;
      case 2:
      case 3:
      case 4:
        uint64_t v10 = v9;
        break;
      default:
        break;
    }
    if (v9 == 5) {
      int64_t v11 = 6;
    }
    else {
      int64_t v11 = v10;
    }
    uint64_t v12 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(PXContentPrivacyController *)self logIdentifier];
      int v17 = 138543618;
      int v18 = v13;
      __int16 v19 = 2048;
      int64_t v20 = v11;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Return SIMULATED authentication type: %ti", (uint8_t *)&v17, 0x16u);
    }
    return v11;
  }
}

- (void)performUserAuthenticationIfNeededFromContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXContentPrivacyController.m" lineNumber:791 description:@"Provided context for user authentication must not be nil"];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v5 canPerformAuthentication])
  {
    char v6 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(PXContentPrivacyController *)self logIdentifier];
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context reported that it cannot perform authentication. Skipping.", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    char v6 = [v5 authenticationTitle];
    uint64_t v7 = PXLocalizedStringFromTable(@"PXContentPrivacyAuthenticationPasscodeTitle", @"PhotosUICore");
    BOOL v8 = [v5 passcodeAuthenticationReason];
    [(PXContentPrivacyController *)self performUserAuthenticationIfNeededWithTitle:v6 passcodeTitle:v7 passcodeSubtitle:v8 completion:0];
  }
}

- (void)_performUserAuthenticationIfNeededAfterForegrounding
{
  BOOL v3 = [(PXContentPrivacyController *)self authenticationStack];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(PXContentPrivacyController *)self shouldPerformAuthenticationUponAppearing];
    if ([(PXContentPrivacyController *)self shouldLockAfterDelayWhenLeavingViewHierarchy])
    {
      [(PXContentPrivacyController *)self cancelDelayedLockIfNeeded];
    }
    if (v5)
    {
      [(PXContentPrivacyController *)self setAuthenticationAttemptDidFailOrWasCancelled:0];
      char v6 = [(PXContentPrivacyController *)self authenticationStack];
      id v7 = [v6 lastObject];

      [(PXContentPrivacyController *)self performUserAuthenticationIfNeededFromContext:v7];
    }
  }
}

- (void)viewDidDisappearForAuthenticationContext:(id)a3 withNavigationState:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(PXContentPrivacyController *)self _updateCachedAuthenticationStackCount];
  id v7 = PXContentPrivacyDescriptionFromAuthenticationContext(v6);
  unint64_t v8 = [(PXContentPrivacyController *)self cachedAuthenticationStackCount];
  uint64_t v9 = PLContentPrivacyUIGetLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4 == 2)
  {
    if (v10)
    {
      int v11 = [(PXContentPrivacyController *)self logIdentifier];
      *(_DWORD *)int64_t v20 = 138543618;
      *(void *)&v20[4] = v11;
      *(_WORD *)&v20[12] = 2114;
      *(void *)&v20[14] = v7;
      uint64_t v12 = "PrivacyController [%{public}@]: Context %{public}@ did disappear, but is still top of navigation hierarchy. "
            "Likely a tab switch of app hide. Removing context from top anyway.";
LABEL_7:
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, v12, v20, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    if (v10)
    {
      int v11 = [(PXContentPrivacyController *)self logIdentifier];
      *(_DWORD *)int64_t v20 = 138543618;
      *(void *)&v20[4] = v11;
      *(_WORD *)&v20[12] = 2114;
      *(void *)&v20[14] = v7;
      uint64_t v12 = "PrivacyController [%{public}@]: Context %{public}@ did disappear, but is still within navigation hierarchy. "
            "Likely pushing into navigation hierarchy.";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if (v10)
  {
    uint64_t v13 = [(PXContentPrivacyController *)self logIdentifier];
    *(_DWORD *)int64_t v20 = 138543618;
    *(void *)&v20[4] = v13;
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v7;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context did disappear from navigation hierarchy: %@", v20, 0x16u);
  }
  [(PXContentPrivacyController *)self removeContextFromStack:v6];
LABEL_12:
  id v14 = [(PXContentPrivacyController *)self authenticationStack];
  uint64_t v15 = [v14 count];

  if (a4 != 1)
  {
    BOOL v16 = v15 || v8 == 0;
    BOOL v17 = !v16;
    if (a4 == 2 || v17)
    {
      int v18 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = [(PXContentPrivacyController *)self logIdentifier];
        *(_DWORD *)int64_t v20 = 138543362;
        *(void *)&v20[4] = v19;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: View Controller leaving view hierarchy, locking privacy controller, if unlocked, or cancelling authentication.", v20, 0xCu);
      }
      [(PXContentPrivacyController *)self _lockOrCancelAuthenticationIfNeeded];
    }
  }
  [(PXContentPrivacyController *)self scheduleAuthenticationStackCountUpdate];
}

- (void)viewDidAppearForAuthenticationContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PXContentPrivacyController *)self cachedAuthenticationStackCount];
  id v6 = PXContentPrivacyDescriptionFromAuthenticationContext(v4);
  id v7 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = [(PXContentPrivacyController *)self logIdentifier];
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2112;
    BOOL v16 = v6;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context did appear: %@", (uint8_t *)&v13, 0x16u);
  }
  [(PXContentPrivacyController *)self addContextToStack:v4];
  uint64_t v9 = [(PXContentPrivacyController *)self authenticationStack];
  unint64_t v10 = [v9 count];

  BOOL v11 = [(PXContentPrivacyController *)self shouldPerformAuthenticationUponAppearing];
  if ([(PXContentPrivacyController *)self shouldLockAfterDelayWhenLeavingViewHierarchy])
  {
    [(PXContentPrivacyController *)self cancelDelayedLockIfNeeded];
  }
  if (v10 >= v5 && v11) {
    [(PXContentPrivacyController *)self performUserAuthenticationIfNeededFromContext:v4];
  }
  [(PXContentPrivacyController *)self scheduleAuthenticationStackCountUpdate];
}

- (void)scheduleAuthenticationStackCountUpdate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PXContentPrivacyController_scheduleAuthenticationStackCountUpdate__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __68__PXContentPrivacyController_scheduleAuthenticationStackCountUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCachedAuthenticationStackCount];
}

- (void)_updateCachedAuthenticationStackCount
{
  id v3 = [(PXContentPrivacyController *)self authenticationStack];
  -[PXContentPrivacyController setCachedAuthenticationStackCount:](self, "setCachedAuthenticationStackCount:", [v3 count]);
}

- (void)resetHasPerformedAuthenticationInStack
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PXContentPrivacyController *)self logIdentifier];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Resetting 'has performed authentication in stack' flag", (uint8_t *)&v5, 0xCu);
  }
  [(PXContentPrivacyController *)self setHasPerformedAuthenticationInStack:0];
  [(PXContentPrivacyController *)self _updateWillPerformAuthenticationAutomatically];
}

- (void)clearAuthenticationStack
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  [(PXContentPrivacyController *)self authenticationStack];
  objc_claimAutoreleasedReturnValue();
  PXContentPrivacyDescriptionFromAuthenticationContextStack();
}

- (void)removeContextFromStack:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PXContentPrivacyDescriptionFromAuthenticationContext(v4);
  id v6 = [(PXContentPrivacyController *)self authenticationStack];
  uint64_t v7 = [v6 indexOfObject:v4];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(PXContentPrivacyController *)self logIdentifier];
      unint64_t v10 = [(PXContentPrivacyController *)self authenticationStack];
      int v27 = 138543874;
      v28 = v9;
      __int16 v29 = 2112;
      v30 = v5;
      __int16 v31 = 2048;
      uint64_t v32 = [v10 count];
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Tried to remove context %@ that doesn't exist in stack. Total: %tu", (uint8_t *)&v27, 0x20u);
    }
  }
  else
  {
    BOOL v11 = [(PXContentPrivacyController *)self authenticationStack];
    id v12 = [v11 lastObject];

    int v13 = [(PXContentPrivacyController *)self authenticationStack];
    id v14 = v13;
    if (v12 == v4)
    {
      [v13 removeLastObject];

      int64_t v20 = [(PXContentPrivacyController *)self authenticationStack];
      uint64_t v17 = [v20 lastObject];

      uint64_t v21 = PXContentPrivacyDescriptionFromAuthenticationContext(v17);
      uint64_t v22 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [(PXContentPrivacyController *)self logIdentifier];
        __int16 v24 = [(PXContentPrivacyController *)self authenticationStack];
        int v27 = 138544130;
        v28 = v23;
        __int16 v29 = 2114;
        v30 = v5;
        __int16 v31 = 2114;
        uint64_t v32 = (uint64_t)v21;
        __int16 v33 = 2048;
        uint64_t v34 = [v24 count];
        _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context was popped: %{public}@. Context became current: %{public}@. Total: %tu", (uint8_t *)&v27, 0x2Au);
      }
    }
    else
    {
      uint64_t v15 = [v13 count] - v7;

      BOOL v16 = [(PXContentPrivacyController *)self authenticationStack];
      objc_msgSend(v16, "removeObjectsInRange:", v7, v15);

      uint64_t v17 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = [(PXContentPrivacyController *)self logIdentifier];
        __int16 v19 = [(PXContentPrivacyController *)self authenticationStack];
        int v27 = 138544130;
        v28 = v18;
        __int16 v29 = 2114;
        v30 = v5;
        __int16 v31 = 2048;
        uint64_t v32 = v15;
        __int16 v33 = 2048;
        uint64_t v34 = [v19 count];
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context disappeared but was not at the top: %{public}@, popped %tu contexts until it was removed. Total: %tu", (uint8_t *)&v27, 0x2Au);
      }
    }

    v25 = [(PXContentPrivacyController *)self authenticationStack];
    uint64_t v26 = [v25 count];

    if (!v26)
    {
      [(PXContentPrivacyController *)self resetHasPerformedAuthenticationInStack];
      [(PXContentPrivacyController *)self setAuthenticationAttemptDidFailOrWasCancelled:0];
    }
    [(PXContentPrivacyController *)self _logCurrentAuthenticationStack];
  }
}

- (void)addContextToStack:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PXContentPrivacyDescriptionFromAuthenticationContext(v4);
  id v6 = [(PXContentPrivacyController *)self authenticationStack];
  uint64_t v7 = [v6 indexOfObject:v4];

  unint64_t v8 = [(PXContentPrivacyController *)self authenticationStack];
  uint64_t v9 = v8;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v8 addObject:v4];

    unint64_t v10 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(PXContentPrivacyController *)self logIdentifier];
      id v12 = [(PXContentPrivacyController *)self authenticationStack];
      int v21 = 138543874;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      __int16 v24 = v5;
      __int16 v25 = 2048;
      uint64_t v26 = [v12 count];
      int v13 = "PrivacyController [%{public}@]: Adding new context: %@. Total: %tu";
LABEL_7:
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    uint64_t v14 = [v8 count] - 1;

    if (v7 == v14)
    {
      unint64_t v10 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = [(PXContentPrivacyController *)self logIdentifier];
        id v12 = [(PXContentPrivacyController *)self authenticationStack];
        int v21 = 138543874;
        uint64_t v22 = v11;
        __int16 v23 = 2112;
        __int16 v24 = v5;
        __int16 v25 = 2048;
        uint64_t v26 = [v12 count];
        int v13 = "PrivacyController [%{public}@]: Context is already at top of stock: %@. Total: %tu";
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v15 = [(PXContentPrivacyController *)self authenticationStack];
      uint64_t v16 = v7 + 1;
      uint64_t v17 = [v15 count] - v16;

      int v18 = [(PXContentPrivacyController *)self authenticationStack];
      objc_msgSend(v18, "removeObjectsInRange:", v16, v17);

      unint64_t v10 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = [(PXContentPrivacyController *)self logIdentifier];
        int64_t v20 = [(PXContentPrivacyController *)self authenticationStack];
        int v21 = 138544130;
        uint64_t v22 = v19;
        __int16 v23 = 2112;
        __int16 v24 = v5;
        __int16 v25 = 2048;
        uint64_t v26 = v17;
        __int16 v27 = 2048;
        uint64_t v28 = [v20 count];
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context became current: %@, popped %tu contexts. Total: %tu", (uint8_t *)&v21, 0x2Au);
      }
    }
  }

  [(PXContentPrivacyController *)self _logCurrentAuthenticationStack];
}

- (void)_logCurrentAuthenticationStack
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  [(PXContentPrivacyController *)self authenticationStack];
  objc_claimAutoreleasedReturnValue();
  PXContentPrivacyDescriptionFromAuthenticationContextStack();
}

- (void)_stopAutolockTimer
{
  id v3 = [(PXContentPrivacyController *)self autolockTimer];

  if (v3)
  {
    id v4 = [(PXContentPrivacyController *)self autolockTimer];
    [v4 invalidate];

    [(PXContentPrivacyController *)self setAutolockTimer:0];
  }
}

- (void)_startAutolockTimerForReason:(unint64_t)a3 resetIfActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(PXContentPrivacyController *)self autolockTimer];

  if (!v7)
  {
LABEL_6:
    BOOL v11 = @"Explicit";
    if (a3 == 1) {
      BOOL v11 = @"Window Backgrounding";
    }
    if (a3 == 2) {
      BOOL v11 = @"Window Minimizing";
    }
    unint64_t v8 = v11;
    [(PXContentPrivacyController *)self autolockTimeout];
    double v13 = v12;
    uint64_t v14 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(PXContentPrivacyController *)self logIdentifier];
      *(_DWORD *)buf = 138543874;
      __int16 v23 = v15;
      __int16 v24 = 2048;
      double v25 = v13;
      __int16 v26 = 2114;
      __int16 v27 = v8;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Starting auto-lock timer for %.1fs (reason = %{public}@)", buf, 0x20u);
    }
    [(PXContentPrivacyController *)self setAutolockReason:a3];
    objc_initWeak((id *)buf, self);
    uint64_t v16 = (void *)MEMORY[0x1E4F1CB00];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__PXContentPrivacyController__startAutolockTimerForReason_resetIfActive___block_invoke;
    v20[3] = &unk_1E5DCD920;
    objc_copyWeak(&v21, (id *)buf);
    uint64_t v17 = [v16 scheduledTimerWithTimeInterval:0 repeats:v20 block:v13];
    [(PXContentPrivacyController *)self setAutolockTimer:v17];

    int v18 = [(PXContentPrivacyController *)self autolockTimer];
    [v18 setTolerance:1.0];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
    goto LABEL_13;
  }
  unint64_t v8 = PLContentPrivacyUIGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      unint64_t v10 = [(PXContentPrivacyController *)self logIdentifier];
      *(_DWORD *)buf = 138543362;
      __int16 v23 = v10;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Resetting auto-lock timer", buf, 0xCu);
    }
    [(PXContentPrivacyController *)self _stopAutolockTimer];
    goto LABEL_6;
  }
  if (v9)
  {
    __int16 v19 = [(PXContentPrivacyController *)self logIdentifier];
    *(_DWORD *)buf = 138543362;
    __int16 v23 = v19;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Auto-lock timer already running, so not resetting it.", buf, 0xCu);
  }
LABEL_13:
}

void __73__PXContentPrivacyController__startAutolockTimerForReason_resetIfActive___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopAutolockTimer];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _lockWithReasonForLogging:@"Auto locking timer fired."];
}

- (void)_stopObservingApplicationStateChanges
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(PXContentPrivacyController *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        BOOL v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v9 removeObserver:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  unint64_t v10 = [(PXContentPrivacyController *)self observers];
  [v10 removeAllObjects];
}

- (void)_lockWithReasonForLogging:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PXContentPrivacyController *)self isContentPrivacyEnabled])
  {
    uint64_t v5 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(PXContentPrivacyController *)self logIdentifier];
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Setting privacy controller to LOCKED, because: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  [(PXContentPrivacyController *)self lockImmediately];
}

- (void)hostApplicationDidBecomeActiveFromNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PXContentPrivacyController *)self isContentPrivacyEnabled])
  {
    uint64_t v5 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(PXContentPrivacyController *)self logIdentifier];
      int v7 = [v4 name];
      int v8 = 138543618;
      __int16 v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Host application did become active from notification: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [(PXContentPrivacyController *)self _performUserAuthenticationIfNeededAfterForegrounding];
  }
}

- (void)hostApplicationWillResignActiveFromNotification:(id)a3
{
  id v10 = a3;
  if ([(PXContentPrivacyController *)self isContentPrivacyEnabled]
    && ![(PXContentPrivacyController *)self isPerformingAuthentication])
  {
    id v4 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v5 = [v4 beginActivityWithOptions:0xFFFFFFLL reason:@"Photos Lock Privacy-Sensitive Album"];

    uint64_t v6 = NSString;
    int v7 = [v10 name];
    int v8 = [v6 stringWithFormat:@"Host application resigned active from notification: %@", v7];

    [(PXContentPrivacyController *)self _lockWithReasonForLogging:v8];
    __int16 v9 = [MEMORY[0x1E4F28F80] processInfo];
    [v9 endActivity:v5];
  }
}

- (void)applicationWillEnterForeground
{
  if ([(PXContentPrivacyController *)self isContentPrivacyEnabled])
  {
    [(PXContentPrivacyController *)self _performUserAuthenticationIfNeededAfterForegrounding];
  }
}

- (void)applicationDidEnterBackground
{
  if ([(PXContentPrivacyController *)self isContentPrivacyEnabled])
  {
    [(PXContentPrivacyController *)self _lockWithReasonForLogging:@"Application entered background"];
  }
}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained applicationDidEnterBackground];
}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained applicationWillEnterForeground];
}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained hostApplicationWillResignActiveFromNotification:v3];
}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained hostApplicationDidBecomeActiveFromNotification:v3];
}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained hostApplicationWillResignActiveFromNotification:v3];
}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained hostApplicationDidBecomeActiveFromNotification:v3];
}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained hostApplicationWillResignActiveFromNotification:v3];
}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained hostApplicationDidBecomeActiveFromNotification:v3];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PXContentPrivacyController *)self logIdentifier];
    *(_DWORD *)buf = 138543362;
    int v8 = v4;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: dealloc", buf, 0xCu);
  }
  [(PXContentPrivacyController *)self _stopObservingApplicationStateChanges];
  [(PXContentPrivacyController *)self _stopObservingContentPrivacyPrefs];
  if ([(PXDisplayCollection *)self->_assetCollectionToObserve px_isUserSmartAlbum]) {
    [(PXContentPrivacyController *)self _stopObservingAssetCollectionChanges];
  }
  uint64_t v5 = +[PXContentPrivacySettings sharedInstance];
  [v5 removeKeyObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)PXContentPrivacyController;
  [(PXContentPrivacyController *)&v6 dealloc];
}

- (PXContentPrivacyController)initWithContentPrivacyEnabledForTesting:(id)a3 availableAuthenticationTypeForTesting:(id)a4 assetCollectionToObserveForTesting:(id)a5 automaticAuthenticationBehaviorForTesting:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (PFProcessIsLaunchedToExecuteTests())
  {
    v18.receiver = self;
    v18.super_class = (Class)PXContentPrivacyController;
    long long v14 = [(PXContentPrivacyController *)&v18 init];
    uint64_t v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_contentPrivacyEnabledNumberForTesting, a3);
      objc_storeStrong((id *)&v15->_testingOverride_authenticationType, a4);
      [(PXContentPrivacyController *)v15 commonInitWithLogIdentifier:@"test" automaticAuthenticationBehavior:a6];
      objc_storeStrong((id *)&v15->_assetCollectionToObserve, a5);
      v15->_automaticAuthenticationBehavior = a6;
      [(PXContentPrivacyController *)v15 _updateAuthenticationType];
      [(PXContentPrivacyController *)v15 _updateContentPrivacyEnabled];
      [(PXContentPrivacyController *)v15 _updateWillPerformAuthenticationAutomatically];
    }
    self = v15;
    uint64_t v16 = self;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (void)tearDownPrivacyControllersIfNeeded
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ([(id)_privacyControllersByKey count])
  {
    [(id)_privacyControllersByKey allValues];
    objc_claimAutoreleasedReturnValue();
    PXMap();
  }
  objc_msgSend((id)_privacyControllersByKey, "removeAllObjects", (void)v3);
  uint64_t v2 = (void *)_privacyControllersByKey;
  _privacyControllersByKey = 0;
}

uint64_t __64__PXContentPrivacyController_tearDownPrivacyControllersIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 logIdentifier];
}

@end