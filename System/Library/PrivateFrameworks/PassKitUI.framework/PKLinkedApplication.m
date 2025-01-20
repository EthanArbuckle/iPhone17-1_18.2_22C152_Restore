@interface PKLinkedApplication
+ (id)_openOptionsWithURL:(id)a3;
- (BOOL)_useLibraryItem;
- (BOOL)isInstalled;
- (BOOL)shouldApplyBorder;
- (BOOL)shouldApplyMask;
- (BOOL)useSmallIcon;
- (CGSize)expectedIconSize;
- (NSArray)applicationIdentifiers;
- (NSArray)storeIDs;
- (NSArray)systemAppBundleIdentifiers;
- (NSNumber)storeIdentifier;
- (NSString)customProductPageIdentifier;
- (NSString)displayName;
- (NSURL)defaultLaunchURL;
- (PKAMSLookupItem)foundStoreItem;
- (PKLinkedApplication)init;
- (PKLinkedApplication)initWithApplicationIdentifiers:(id)a3 storeIDs:(id)a4 defaultLaunchURL:(id)a5;
- (PKLinkedApplication)initWithPass:(id)a3;
- (PKLinkedApplication)initWithStoreIDs:(id)a3 defaultLaunchURL:(id)a4;
- (PKLinkedApplication)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5;
- (PKLinkedApplication)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5 applicationIdentifiers:(id)a6;
- (UIImage)iconImage;
- (id)_foundStoreItemProductPageURL;
- (id)_iconImageDescriptorForScale:(double)a3;
- (int64_t)state;
- (void)_notifyObserversOfStateChange;
- (void)_reloadApplicationStateWithCompletion:(id)a3;
- (void)_unloadApplicationState;
- (void)_updateApplicationStateWithCompletion:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)installedApplicationsDidChangeNotification:(id)a3;
- (void)openApplication:(id)a3;
- (void)openApplication:(id)a3 withLaunchOptions:(unint64_t)a4;
- (void)openApplication:(id)a3 withLaunchOptions:(unint64_t)a4 launchURL:(id)a5;
- (void)productViewControllerDidFinish:(id)a3;
- (void)reloadApplicationStateIfNecessary;
- (void)reloadApplicationStateIfNecessaryWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setApplicationIdentifiers:(id)a3;
- (void)setCustomProductPageIdentifier:(id)a3;
- (void)setDefaultLaunchURL:(id)a3;
- (void)setShouldApplyBorder:(BOOL)a3;
- (void)setShouldApplyMask:(BOOL)a3;
- (void)setStoreIDs:(id)a3;
- (void)setSystemAppBundleIdentifiers:(id)a3;
- (void)setUseSmallIcon:(BOOL)a3;
@end

@implementation PKLinkedApplication

+ (id)_openOptionsWithURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F62688]];
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F62678]];
  }
  v5 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v4];

  return v5;
}

- (PKLinkedApplication)init
{
  return [(PKLinkedApplication *)self initWithStoreIDs:0 systemAppBundleIdentifiers:0 defaultLaunchURL:0 applicationIdentifiers:0];
}

- (PKLinkedApplication)initWithPass:(id)a3
{
  id v4 = a3;
  v5 = [v4 storeIdentifiers];
  v6 = [v4 systemAppBundleIdentifiers];
  v7 = [v4 appLaunchURL];

  v8 = [(PKLinkedApplication *)self initWithStoreIDs:v5 systemAppBundleIdentifiers:v6 defaultLaunchURL:v7 applicationIdentifiers:0];
  return v8;
}

- (PKLinkedApplication)initWithStoreIDs:(id)a3 defaultLaunchURL:(id)a4
{
  return [(PKLinkedApplication *)self initWithStoreIDs:a3 systemAppBundleIdentifiers:0 defaultLaunchURL:a4 applicationIdentifiers:0];
}

- (PKLinkedApplication)initWithApplicationIdentifiers:(id)a3 storeIDs:(id)a4 defaultLaunchURL:(id)a5
{
  return [(PKLinkedApplication *)self initWithStoreIDs:a4 systemAppBundleIdentifiers:0 defaultLaunchURL:a5 applicationIdentifiers:a3];
}

- (PKLinkedApplication)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5
{
  return [(PKLinkedApplication *)self initWithStoreIDs:a3 systemAppBundleIdentifiers:a4 defaultLaunchURL:a5 applicationIdentifiers:0];
}

- (PKLinkedApplication)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5 applicationIdentifiers:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)PKLinkedApplication;
  v14 = [(PKLinkedApplication *)&v34 init];
  v15 = v14;
  if (v14)
  {
    v14->_pendingLock._os_unfair_lock_opaque = 0;
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v15->_observers;
    v15->_observers = (NSHashTable *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v15->_completionHandlers;
    v15->_completionHandlers = v18;

    uint64_t v20 = [v10 copy];
    storeIDs = v15->_storeIDs;
    v15->_storeIDs = (NSArray *)v20;

    uint64_t v22 = [v11 copy];
    systemAppBundleIdentifiers = v15->_systemAppBundleIdentifiers;
    v15->_systemAppBundleIdentifiers = (NSArray *)v22;

    uint64_t v24 = [v12 copy];
    defaultLaunchURL = v15->_defaultLaunchURL;
    v15->_defaultLaunchURL = (NSURL *)v24;

    uint64_t v26 = [v13 copy];
    applicationIdentifiers = v15->_applicationIdentifiers;
    v15->_applicationIdentifiers = (NSArray *)v26;

    v28 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v28 addObserver:v15 selector:sel_installedApplicationsDidChangeNotification_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v28 addObserver:v15 selector:sel_installedApplicationsDidChangeNotification_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
    *(_WORD *)&v15->_shouldApplyMask = 257;
    v29 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v30 = dispatch_queue_attr_make_with_autorelease_frequency(v29, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v31 = dispatch_queue_create("com.apple.passkitui.system.app.lookup", v30);
    appLookupQueue = v15->_appLookupQueue;
    v15->_appLookupQueue = (OS_dispatch_queue *)v31;
  }
  return v15;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  [(PKCancelable *)self->_pendingUpdate cancel];

  v4.receiver = self;
  v4.super_class = (Class)PKLinkedApplication;
  [(PKLinkedApplication *)&v4 dealloc];
}

- (void)_reloadApplicationStateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    completionHandlers = self->_completionHandlers;
    v7 = _Block_copy(v4);
    [(NSMutableArray *)completionHandlers addObject:v7];
  }
  if (!self->_loading)
  {
    self->_loading = 1;
    [(PKLinkedApplication *)self _notifyObserversOfStateChange];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__PKLinkedApplication__reloadApplicationStateWithCompletion___block_invoke;
    v8[3] = &unk_1E59CB100;
    objc_copyWeak(&v9, &location);
    [(PKLinkedApplication *)self _updateApplicationStateWithCompletion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __61__PKLinkedApplication__reloadApplicationStateWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      *((_WORD *)WeakRetained + 16) = 1;
      [WeakRetained _notifyObserversOfStateChange];
    }
    v5 = (void *)[v4[6] copy];
    [v4[6] removeAllObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
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
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)reloadApplicationStateIfNecessary
{
}

- (void)reloadApplicationStateIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!self->_loaded
    || ((v5 = v4, (foundLibraryItem = self->_foundLibraryItem) == 0)
     || (int v7 = [(SSSoftwareLibraryItem *)foundLibraryItem isPlaceholder], v5 = v8, v7))
    && !self->_foundStoreItem)
  {
    [(PKLinkedApplication *)self _reloadApplicationStateWithCompletion:v8];
    v5 = v8;
  }
}

- (void)openApplication:(id)a3
{
}

- (void)openApplication:(id)a3 withLaunchOptions:(unint64_t)a4
{
}

- (void)openApplication:(id)a3 withLaunchOptions:(unint64_t)a4 launchURL:(id)a5
{
  char v6 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v8 = (NSURL *)a5;
  presentedViewController = self->_presentedViewController;
  if (presentedViewController)
  {
    uint64_t v10 = [(SKStoreProductViewController *)presentedViewController presentingViewController];

    if (!v10)
    {
      v18 = self->_presentedViewController;
      self->_presentedViewController = 0;

      if (v8) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  if (!v8) {
LABEL_4:
  }
    id v8 = self->_defaultLaunchURL;
LABEL_5:
  long long v11 = [(PKAMSLookupItem *)self->_foundStoreItem distributionIdentifier];
  if (!v11 || [(PKLinkedApplication *)self isInstalled])
  {
    if (PKRunningInViewService())
    {
      id v12 = v42;
      if (v12)
      {
        long long v13 = v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v14 = 1;
        }
        else
        {
          while (1)
          {
            uint64_t v15 = [v13 parentViewController];
            if (!v15)
            {
              uint64_t v15 = [v13 presentingViewController];
              if (!v15) {
                break;
              }
            }

            objc_opt_class();
            long long v13 = (void *)v15;
            if (objc_opt_isKindOfClass())
            {
              int v14 = 1;
              long long v13 = (void *)v15;
              goto LABEL_31;
            }
          }
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id obj = [v13 childViewControllers];
          uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v48;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v48 != v20) {
                  objc_enumerationMutation(obj);
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v14 = 1;
                  goto LABEL_30;
                }
              }
              uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
          int v14 = 0;
LABEL_30:

          long long v13 = 0;
        }
LABEL_31:
      }
      else
      {
        int v14 = 0;
      }
      BOOL v16 = v14 != 0;
    }
    else
    {
      BOOL v16 = 0;
    }
    uint64_t v22 = [(PKLinkedApplication *)self storeIdentifier];
    if ((v16 | PKRunningInLockScreenPlugin()) == 1)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([(PKLinkedApplication *)self isInstalled])
      {
        foundLibraryItem = self->_foundLibraryItem;
        if (foundLibraryItem) {
          [(SSSoftwareLibraryItem *)foundLibraryItem valueForProperty:*MEMORY[0x1E4FA8928]];
        }
        else {
        v33 = [(LSApplicationRecord *)self->_foundSystemAppRecord bundleIdentifier];
        }
        if (v33)
        {
          [v23 setObject:v33 forKeyedSubscript:@"bundleID"];
          dispatch_queue_t v31 = v8;
        }
        else
        {
          dispatch_queue_t v31 = 0;
        }
      }
      else
      {
        v30 = [(PKLinkedApplication *)self _foundStoreItemProductPageURL];
        dispatch_queue_t v31 = v30;
        if (v30)
        {
          v32 = v30;
          v33 = @"com.apple.AppStore";
        }
        else
        {
          v33 = 0;
        }
      }
      v37 = [v42 viewIfLoaded];
      v38 = [v37 window];

      if (v33 && v38)
      {
        v39 = [(id)objc_opt_class() _openOptionsWithURL:v31];
        PKPostOpenApplicationNotification(v38, v33, v39);
      }
      goto LABEL_67;
    }
    if ([(PKLinkedApplication *)self isInstalled])
    {
      v25 = self->_foundLibraryItem;
      if (v25) {
        [(SSSoftwareLibraryItem *)v25 valueForProperty:*MEMORY[0x1E4FA8928]];
      }
      else {
      v35 = [(LSApplicationRecord *)self->_foundSystemAppRecord bundleIdentifier];
      }
      if (v35)
      {
        v36 = [(id)objc_opt_class() _openOptionsWithURL:v8];
        PKOpenApplication(v35, v36);
      }
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C68], 0);

      goto LABEL_67;
    }
    if (v6)
    {
      v28 = [(PKLinkedApplication *)self _foundStoreItemProductPageURL];
      if (v28)
      {
        objc_super v34 = [(id)objc_opt_class() _openOptionsWithURL:v28];
        PKOpenApplication(@"com.apple.AppStore", v34);
      }
    }
    else
    {
      if (v42)
      {
        if (!self->_presentedViewController)
        {
          if (v22)
          {
            uint64_t v26 = [v42 presentedViewController];
            BOOL v27 = v26 == 0;

            if (v27)
            {
              objc_initWeak(&location, self);
              v40 = [[PKStoreProductViewPresenter alloc] initWithProductDelegate:self];
              [(PKStoreProductViewPresenter *)v40 loadProductForItemIdentifier:v22 customProductPageIdentifier:self->_customProductPageIdentifier];
              v43[0] = MEMORY[0x1E4F143A8];
              v43[1] = 3221225472;
              v43[2] = __67__PKLinkedApplication_openApplication_withLaunchOptions_launchURL___block_invoke;
              v43[3] = &unk_1E59CE268;
              objc_copyWeak(&v45, &location);
              id v44 = v42;
              [(PKStoreProductViewPresenter *)v40 presentStoreViewWithBlock:v43];

              objc_destroyWeak(&v45);
              objc_destroyWeak(&location);
              goto LABEL_67;
            }
          }
        }
      }
      v28 = [(PKLinkedApplication *)self _foundStoreItemProductPageURL];
      if (v28)
      {
        v29 = [(id)objc_opt_class() _openOptionsWithURL:v28];
        PKOpenApplication(@"com.apple.AppStore", v29);
      }
    }

LABEL_67:
    goto LABEL_68;
  }
  v17 = [(PKAMSLookupItem *)self->_foundStoreItem appStoreIdentifier];
  +[_PKDistributedAppLauncher launchAppWithDistributorBundleID:itemID:completion:](_TtC9PassKitUI25_PKDistributedAppLauncher, "launchAppWithDistributorBundleID:itemID:completion:", v11, [v17 integerValue], 0);

LABEL_68:
}

void __67__PKLinkedApplication_openApplication_withLaunchOptions_launchURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 7, a2);
  }
  [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:v6];
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C70], 0);
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_observers, "addObject:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)_unloadApplicationState
{
  p_pendingLock = &self->_pendingLock;
  os_unfair_lock_lock(&self->_pendingLock);
  pendingUpdate = self->_pendingUpdate;
  if (pendingUpdate)
  {
    [(PKCancelable *)pendingUpdate cancel];
    v5 = self->_pendingUpdate;
    self->_pendingUpdate = 0;
  }
  os_unfair_lock_unlock(p_pendingLock);
  *(_WORD *)&self->_loaded = 0;
  foundSystemAppRecord = self->_foundSystemAppRecord;
  self->_foundSystemAppRecord = 0;

  foundLibraryItem = self->_foundLibraryItem;
  self->_foundLibraryItem = 0;

  foundStoreItem = self->_foundStoreItem;
  self->_foundStoreItem = 0;

  iconImage = self->_iconImage;
  self->_iconImage = 0;

  [(PKLinkedApplication *)self _notifyObserversOfStateChange];
}

- (void)_updateApplicationStateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self->_storeIDs;
  v18 = self->_systemAppBundleIdentifiers;
  id v6 = self->_applicationIdentifiers;
  if ([(NSArray *)v5 count] || [(NSArray *)v18 count] || [(NSArray *)v6 count])
  {
    from[0] = 0;
    from[1] = from;
    from[2] = (id)0x3032000000;
    from[3] = __Block_byref_object_copy__6;
    from[4] = __Block_byref_object_dispose__6;
    id v60 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x3032000000;
    v57[3] = __Block_byref_object_copy__6;
    v57[4] = __Block_byref_object_dispose__6;
    id v58 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = __Block_byref_object_copy__6;
    v55[4] = __Block_byref_object_dispose__6;
    id v56 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = __Block_byref_object_copy__6;
    v53[4] = __Block_byref_object_dispose__6;
    id v54 = 0;
    int v7 = [(PKLinkedApplication *)self _iconImageDescriptorForScale:PKUIScreenScale()];
    id v8 = objc_alloc_init(MEMORY[0x1E4F84518]);
    if ([(NSArray *)self->_systemAppBundleIdentifiers count])
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke;
      v47[3] = &unk_1E59CE2B8;
      long long v48 = v18;
      id v49 = v7;
      long long v50 = self;
      v51 = from;
      uint64_t v52 = v53;
      [v8 addOperation:v47];
    }
    if ([(NSArray *)v6 count])
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_3;
      v41[3] = &unk_1E59CE2B8;
      id v45 = v53;
      id v42 = v6;
      id v43 = v7;
      id v44 = self;
      v46 = from;
      [v8 addOperation:v41];
    }
    if ([(NSArray *)v5 count])
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_5;
      v36[3] = &unk_1E59CE308;
      v39 = v53;
      id v9 = v5;
      v37 = v9;
      id v10 = v7;
      id v38 = v10;
      v40 = v57;
      [v8 addOperation:v36];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_7;
      v30[3] = &unk_1E59CE358;
      v33 = v53;
      objc_super v34 = v57;
      dispatch_queue_t v31 = v9;
      id v32 = v10;
      v35 = v55;
      [v8 addOperation:v30];
    }
    os_unfair_lock_lock(&self->_pendingLock);
    pendingUpdate = self->_pendingUpdate;
    if (pendingUpdate)
    {
      [(PKCancelable *)pendingUpdate cancel];
      id v12 = self->_pendingUpdate;
      self->_pendingUpdate = 0;
    }
    objc_initWeak(&location, self);
    long long v13 = [MEMORY[0x1E4F1CA98] null];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_9;
    v22[3] = &unk_1E59CE3A8;
    objc_copyWeak(&v28, &location);
    uint64_t v24 = from;
    v25 = v57;
    uint64_t v26 = v55;
    BOOL v27 = v53;
    id v23 = v4;
    int v14 = [v8 evaluateWithInput:v13 completion:v22];
    uint64_t v15 = self->_pendingUpdate;
    self->_pendingUpdate = v14;

    os_unfair_lock_unlock(&self->_pendingLock);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v55, 8);

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(from, 8);
  }
  else
  {
    os_unfair_lock_lock(&self->_pendingLock);
    BOOL v16 = self->_pendingUpdate;
    if (v16)
    {
      [(PKCancelable *)v16 cancel];
      v17 = self->_pendingUpdate;
      self->_pendingUpdate = 0;
    }
    os_unfair_lock_unlock(&self->_pendingLock);
    objc_initWeak(from, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_11;
    block[3] = &unk_1E59CB128;
    objc_copyWeak(&v21, from);
    id v20 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v21);
    objc_destroyWeak(from);
  }
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v10 = *(NSObject **)(*(void *)(a1 + 48) + 80);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_2;
  v18[3] = &unk_1E59CE290;
  long long v21 = *(_OWORD *)(a1 + 56);
  id v19 = v6;
  id v20 = v7;
  id v11 = v8;
  id v12 = v9;
  long long v13 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LookupSystemApplications_block_invoke;
  block[3] = &unk_1E59CE110;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v14 = v12;
  id v15 = v11;
  id v16 = v6;
  id v17 = v7;
  dispatch_async(v10, block);
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[5] + 16))();
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_3(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v9 = a1[7];
  if (*(void *)(*(void *)(v9 + 8) + 40))
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
  else
  {
    id v10 = (void *)a1[4];
    id v11 = (void *)a1[5];
    id v12 = *(NSObject **)(a1[6] + 80);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_4;
    v18[3] = &unk_1E59CE290;
    uint64_t v21 = a1[8];
    uint64_t v22 = v9;
    id v20 = v7;
    id v19 = v6;
    id v13 = v10;
    id v14 = v11;
    id v15 = v18;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __LookupApplications_block_invoke;
    block[3] = &unk_1E59CE110;
    id v24 = v13;
    id v25 = v14;
    id v26 = v15;
    id v16 = v14;
    id v17 = v13;
    dispatch_async(v12, block);
  }
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  uint64_t v7 = a1[5];
  if (v7) {
    (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, a1[4], 0);
  }
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_5(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  uint64_t v11 = a1[6];
  if (*(void *)(*(void *)(v11 + 8) + 40))
  {
    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
  else
  {
    id v12 = (void *)a1[4];
    id v13 = (void *)a1[5];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_6;
    v36[3] = &unk_1E59CE2E0;
    uint64_t v39 = a1[7];
    uint64_t v40 = v11;
    id v38 = v9;
    id v37 = v8;
    id v14 = v12;
    id v15 = v7;
    id v16 = v13;
    id v17 = v36;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__6;
    v56[4] = __Block_byref_object_dispose__6;
    id v57 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v34 = v7;
    v35 = v15;
    id v19 = objc_alloc_init(MEMORY[0x1E4F84518]);
    id v20 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F872A0]];
    int v21 = [v14 containsObject:v20];

    if (v21) {
      id v22 = (id)*MEMORY[0x1E4F87298];
    }
    else {
      id v22 = 0;
    }
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __LookupInstalledApplications_block_invoke;
    v53[3] = &unk_1E59CE5A0;
    v55 = v56;
    id v23 = v18;
    id v54 = v23;
    [v19 addOperation:v53];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __LookupInstalledApplications_block_invoke_3;
    v49[3] = &unk_1E59CE5C8;
    uint64_t v52 = v56;
    id v24 = v14;
    id v50 = v24;
    id v25 = v23;
    id v51 = v25;
    [v19 addOperation:v49];
    id v26 = [MEMORY[0x1E4F1CA98] null];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __LookupInstalledApplications_block_invoke_5;
    v42[3] = &unk_1E59CE5F0;
    id v27 = v24;
    id v43 = v27;
    id v28 = v25;
    id v44 = v28;
    id v29 = v22;
    id v45 = v29;
    id v30 = v16;
    id v46 = v30;
    id v31 = v35;
    id v47 = v31;
    id v32 = v17;
    id v48 = v32;
    id v33 = (id)[v19 evaluateWithInput:v26 completion:v42];

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __LookupInstalledApplications_block_invoke_7;
    v41[3] = &unk_1E59CB4B0;
    void v41[4] = v56;
    [v31 addCancelAction:v41];

    _Block_object_dispose(v56, 8);
    id v7 = v34;
  }
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_6(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[5] + 16))();
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_7(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a1[6];
  if (!*(void *)(*(void *)(v10 + 8) + 40)) {
    goto LABEL_5;
  }
  id v11 = [*(id *)(*(void *)(a1[7] + 8) + 40) valueForProperty:*MEMORY[0x1E4FA8958]];
  uint64_t v12 = [v11 length];

  if (!v12)
  {
    uint64_t v10 = a1[6];
LABEL_5:
    id v13 = (void *)a1[4];
    id v14 = (void *)a1[5];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_8;
    v23[3] = &unk_1E59CE330;
    uint64_t v26 = a1[8];
    uint64_t v27 = v10;
    id v25 = v9;
    id v24 = v8;
    id v15 = v13;
    id v16 = v7;
    id v17 = v14;
    id v18 = v23;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __LookupStoreApplications_block_invoke;
    v30[3] = &unk_1E59CE668;
    id v31 = v15;
    id v32 = v16;
    id v33 = v17;
    id v34 = v18;
    id v19 = v17;
    id v20 = v15;
    int v21 = PKLookupAppStoreApplications(v20, v30);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __LookupStoreApplications_block_invoke_377;
    v28[3] = &unk_1E59CA7D0;
    id v29 = v21;
    id v22 = v21;
    [v16 addCancelAction:v28];

    goto LABEL_6;
  }
  (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
LABEL_6:
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_8(void *a1, void *a2)
{
  id v7 = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v4 = [v7 iconImage];
    uint64_t v5 = *(void *)(a1[7] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  (*(void (**)(void))(a1[5] + 16))();
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_10;
  block[3] = &unk_1E59CE380;
  objc_copyWeak(&v14, (id *)(a1 + 72));
  id v10 = v5;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 64);
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_10(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 80));
  id v7 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained + 4;
  os_unfair_lock_lock(WeakRetained + 4);
  uint64_t v4 = *(void **)&v7[6]._os_unfair_lock_opaque;
  if (v4 == *(void **)(a1 + 32))
  {
    *(void *)&v7[6]._os_unfair_lock_opaque = 0;
  }
  os_unfair_lock_unlock(v3);
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    objc_storeStrong((id *)&v7[18], *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    objc_storeStrong((id *)&v7[16], *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    objc_storeStrong((id *)&v7[2], *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
    objc_storeStrong((id *)&v7[34], *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    uint64_t v5 = 0;
  }
  else
  {
LABEL_5:
    uint64_t v5 = 1;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v5);
  }
}

void __61__PKLinkedApplication__updateApplicationStateWithCompletion___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  long long v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 9);
    *((void *)WeakRetained + 9) = 0;

    uint64_t v5 = (void *)v8[8];
    v8[8] = 0;

    uint64_t v6 = (void *)v8[1];
    v8[1] = 0;

    id v3 = v8;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == 0);
    id v3 = v8;
  }
}

- (id)_iconImageDescriptorForScale:(double)a3
{
  if (PKUserInterfaceIdiomSupportsLargeLayouts())
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F6F258];
    uint64_t v6 = @"com.apple.IconServices.ImageDescriptor.LargeHomeScreen";
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F6F258];
    if (self->_useSmallIcon)
    {
      uint64_t v7 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2A8]];
      [v7 setDrawBorder:1];
      goto LABEL_7;
    }
    uint64_t v6 = (__CFString *)*MEMORY[0x1E4F6F298];
  }
  uint64_t v7 = [v5 imageDescriptorNamed:v6];
LABEL_7:
  [v7 setScale:a3];
  [v7 setDrawBorder:self->_shouldApplyBorder];
  [v7 setShouldApplyMask:self->_shouldApplyMask];

  return v7;
}

- (void)_notifyObserversOfStateChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSHashTable *)self->_observers copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "linkedApplicationDidChangeState:", self, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)installedApplicationsDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKLinkedApplication_installedApplicationsDidChangeNotification___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__PKLinkedApplication_installedApplicationsDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadApplicationStateWithCompletion:0];
}

- (void)setStoreIDs:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    id v4 = (NSArray *)[v6 copy];
    storeIDs = self->_storeIDs;
    self->_storeIDs = v4;

    [(PKLinkedApplication *)self _unloadApplicationState];
  }
}

- (int64_t)state
{
  foundLibraryItem = self->_foundLibraryItem;
  if (foundLibraryItem && ![(SSSoftwareLibraryItem *)foundLibraryItem isPlaceholder]
    || self->_foundStoreItem
    || self->_foundSystemAppRecord)
  {
    return 1;
  }
  if (self->_loaded) {
    return 2 * !self->_loading;
  }
  return 0;
}

- (void)setUseSmallIcon:(BOOL)a3
{
  if (((!self->_useSmallIcon ^ a3) & 1) == 0)
  {
    self->_useSmallIcon = a3;
    [(PKLinkedApplication *)self _unloadApplicationState];
  }
}

- (BOOL)isInstalled
{
  foundLibraryItem = self->_foundLibraryItem;
  return foundLibraryItem && ![(SSSoftwareLibraryItem *)foundLibraryItem isPlaceholder]
      || self->_foundSystemAppRecord != 0;
}

- (BOOL)_useLibraryItem
{
  if (self->_foundStoreItem) {
    return [(SSSoftwareLibraryItem *)self->_foundLibraryItem isPlaceholder];
  }
  else {
    return 1;
  }
}

- (CGSize)expectedIconSize
{
  v2 = [(PKLinkedApplication *)self _iconImageDescriptorForScale:PKUIScreenScale()];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSNumber)storeIdentifier
{
  if ([(PKLinkedApplication *)self _useLibraryItem]) {
    [(SSSoftwareLibraryItem *)self->_foundLibraryItem valueForProperty:*MEMORY[0x1E4FA8948]];
  }
  else {
  double v3 = [(PKAMSLookupItem *)self->_foundStoreItem appStoreIdentifier];
  }

  return (NSNumber *)v3;
}

- (NSString)displayName
{
  foundSystemAppRecord = self->_foundSystemAppRecord;
  if (foundSystemAppRecord)
  {
    double v4 = [(LSApplicationRecord *)foundSystemAppRecord localizedName];
  }
  else
  {
    if ([(PKLinkedApplication *)self _useLibraryItem]) {
      [(SSSoftwareLibraryItem *)self->_foundLibraryItem valueForProperty:*MEMORY[0x1E4FA8958]];
    }
    else {
    double v4 = [(PKAMSLookupItem *)self->_foundStoreItem displayName];
    }
  }

  return (NSString *)v4;
}

- (id)_foundStoreItemProductPageURL
{
  v12[1] = *MEMORY[0x1E4F143B8];
  foundStoreItem = self->_foundStoreItem;
  if (foundStoreItem)
  {
    double v4 = NSString;
    double v5 = [(PKAMSLookupItem *)foundStoreItem appStoreIdentifier];
    double v6 = [v4 stringWithFormat:@"itms-appss://apps.apple.com/app/id%@", v5];

    double v7 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v6];
    if (self->_customProductPageIdentifier)
    {
      double v8 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ppid" value:self->_customProductPageIdentifier];
      v12[0] = v8;
      long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v7 setQueryItems:v9];
    }
    long long v10 = [v7 URL];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (void)productViewControllerDidFinish:(id)a3
{
  double v5 = (SKStoreProductViewController *)a3;
  [(SKStoreProductViewController *)v5 dismissViewControllerAnimated:1 completion:0];
  double v4 = v5;
  if (self->_presentedViewController == v5)
  {
    self->_presentedViewController = 0;

    double v4 = v5;
  }
}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (NSArray)systemAppBundleIdentifiers
{
  return self->_systemAppBundleIdentifiers;
}

- (void)setSystemAppBundleIdentifiers:(id)a3
{
}

- (NSArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (void)setApplicationIdentifiers:(id)a3
{
}

- (NSURL)defaultLaunchURL
{
  return self->_defaultLaunchURL;
}

- (void)setDefaultLaunchURL:(id)a3
{
}

- (NSString)customProductPageIdentifier
{
  return self->_customProductPageIdentifier;
}

- (void)setCustomProductPageIdentifier:(id)a3
{
}

- (BOOL)useSmallIcon
{
  return self->_useSmallIcon;
}

- (BOOL)shouldApplyMask
{
  return self->_shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->_shouldApplyMask = a3;
}

- (BOOL)shouldApplyBorder
{
  return self->_shouldApplyBorder;
}

- (void)setShouldApplyBorder:(BOOL)a3
{
  self->_shouldApplyBorder = a3;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (PKAMSLookupItem)foundStoreItem
{
  return self->_foundStoreItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_customProductPageIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultLaunchURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_systemAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeIDs, 0);
  objc_storeStrong((id *)&self->_appLookupQueue, 0);
  objc_storeStrong((id *)&self->_foundSystemAppRecord, 0);
  objc_storeStrong((id *)&self->_foundLibraryItem, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingUpdate, 0);

  objc_storeStrong((id *)&self->_foundStoreItem, 0);
}

@end