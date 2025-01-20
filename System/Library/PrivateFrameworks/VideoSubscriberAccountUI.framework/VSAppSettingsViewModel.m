@interface VSAppSettingsViewModel
+ (id)keyPathsForValuesAffectingAccessGranted;
- (BOOL)canChangePrivacyAccess;
- (BOOL)canRevokeVoucher;
- (BOOL)forceDSIDlessInstall;
- (BOOL)isAccessGranted;
- (BOOL)isDecided;
- (LSApplicationWorkspace)workspace;
- (NSBundle)bundle;
- (NSString)adamID;
- (NSString)artistName;
- (NSString)bundleID;
- (NSString)buyParams;
- (NSString)description;
- (NSString)displayName;
- (NSString)storeName;
- (NSURL)appStoreURL;
- (UIImage)icon;
- (VSAppDescription)appDescription;
- (VSAppSettingsViewModel)init;
- (VSAppSettingsViewModel)initWithAppDescription:(id)a3 privacyVoucher:(id)a4 restrictionsCenter:(id)a5 privacyFacade:(id)a6;
- (VSAppSettingsViewModel)initWithApplicationWorkspace:(id)a3;
- (VSAppSettingsViewModel)initWithBundle:(id)a3 restrictionsCenter:(id)a4 privacyFacade:(id)a5;
- (VSAppSettingsViewModel)initWithBundle:(id)a3 restrictionsCenter:(id)a4 privacyFacade:(id)a5 adamID:(id)a6;
- (VSOptional)voucher;
- (VSPrivacyFacade)privacyFacade;
- (VSRestrictionsCenter)restrictionsCenter;
- (id)appAdamIDs;
- (id)appBundleIDs;
- (id)iconURLForSize:(CGSize)a3;
- (int)registrationToken;
- (int64_t)installSource;
- (int64_t)installState;
- (int64_t)privacyState;
- (void)_denyPrivacyAccess;
- (void)_grantPrivacyAccess;
- (void)_updatePrivacyState;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidFailToUninstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)dealloc;
- (void)installApp;
- (void)launchApp;
- (void)revokeVoucher;
- (void)setAccessGranted:(BOOL)a3;
- (void)setAppDescription:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setBundle:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setForceDSIDlessInstall:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setInstallState:(int64_t)a3;
- (void)setPrivacyFacade:(id)a3;
- (void)setPrivacyState:(int64_t)a3;
- (void)setRegistrationToken:(int)a3;
- (void)setRestrictionsCenter:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setWorkspace:(id)a3;
@end

@implementation VSAppSettingsViewModel

- (VSAppSettingsViewModel)initWithApplicationWorkspace:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VSAppSettingsViewModel;
  v6 = [(VSAppSettingsViewModel *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workspace, a3);
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)&stru_26F361E90;

    bundleID = v7->_bundleID;
    v7->_bundleID = (NSString *)&stru_26F361E90;

    buyParams = v7->_buyParams;
    v7->_buyParams = (NSString *)&stru_26F361E90;

    v11 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    voucher = v7->_voucher;
    v7->_voucher = v11;

    [v5 addObserver:v7];
    objc_initWeak(&location, v7);
    v13 = MEMORY[0x263EF83A0];
    id v14 = MEMORY[0x263EF83A0];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __55__VSAppSettingsViewModel_initWithApplicationWorkspace___block_invoke;
    v18[3] = &unk_265077240;
    objc_copyWeak(&v19, &location);
    uint32_t v15 = notify_register_dispatch("com.apple.tcc.access.changed", &v7->_registrationToken, v13, v18);

    if (v15)
    {
      v16 = VSErrorLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[VSAppSettingsViewModel initWithApplicationWorkspace:](v16);
      }
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __55__VSAppSettingsViewModel_initWithApplicationWorkspace___block_invoke(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "TCC access changed notification received.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePrivacyState];
}

- (VSAppSettingsViewModel)init
{
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v4 = [(VSAppSettingsViewModel *)self initWithApplicationWorkspace:v3];

  return v4;
}

- (VSAppSettingsViewModel)initWithBundle:(id)a3 restrictionsCenter:(id)a4 privacyFacade:(id)a5 adamID:(id)a6
{
  id v11 = a6;
  v12 = [(VSAppSettingsViewModel *)self initWithBundle:a3 restrictionsCenter:a4 privacyFacade:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_adamID, a6);
  }

  return v13;
}

- (VSAppSettingsViewModel)initWithBundle:(id)a3 restrictionsCenter:(id)a4 privacyFacade:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_14:
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The restrictionsCenter parameter must not be nil."];
    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The bundle parameter must not be nil."];
  if (!v10) {
    goto LABEL_14;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_15:
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The privacyFacade parameter must not be nil."];
LABEL_4:
  v12 = [(VSAppSettingsViewModel *)self init];
  if (v12)
  {
    v13 = [v9 bundleIdentifier];

    if (!v13) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [bundle bundleIdentifier] parameter must not be nil."];
    }
    id v14 = [v9 bundleIdentifier];
    commonInit_0(v12, v10, v11, v14);
    objc_storeStrong((id *)&v12->_bundle, a3);
    v12->_installState = 4;
    v12->_decided = 1;
    uint64_t v15 = VSIconForBundleWithIdentifier(v14);
    icon = v12->_icon;
    v12->_icon = (UIImage *)v15;

    v17 = [v11 knownAppBundles];
    int v18 = [v17 containsObject:v9];

    if (v18)
    {
      int v19 = [v11 isAccessGrantedForBundleID:v14];
      uint64_t v20 = 1;
      if (!v19) {
        uint64_t v20 = 2;
      }
      v12->_privacyState = v20;
    }
    objc_super v21 = objc_msgSend(MEMORY[0x263F01878], "vs_applicationRecordWithBundleIdentifier:", v12->_bundleID);
    v22 = [[VSAppInstallMetadata alloc] initWithApplicationRecord:v21];
    v12->_installSource = [(VSAppInstallMetadata *)v22 installSource];
    v23 = [v21 iTunesMetadata];
    uint64_t v24 = [v23 artistName];
    artistName = v12->_artistName;
    v12->_artistName = (NSString *)v24;
  }
  return v12;
}

- (VSAppSettingsViewModel)initWithAppDescription:(id)a3 privacyVoucher:(id)a4 restrictionsCenter:(id)a5 privacyFacade:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_11:
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The restrictionsCenter parameter must not be nil."];
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The appDescription parameter must not be nil."];
  if (!v13) {
    goto LABEL_11;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_12:
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The privacyFacade parameter must not be nil."];
LABEL_4:
  uint64_t v15 = [(VSAppSettingsViewModel *)self init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appDescription, a3);
    uint64_t v17 = [objc_alloc(MEMORY[0x263F1E250]) initWithObject:v12];
    voucher = v16->_voucher;
    v16->_voucher = (VSOptional *)v17;

    uint64_t v19 = [v11 icon];
    icon = v16->_icon;
    v16->_icon = (UIImage *)v19;

    objc_super v21 = [v11 sellerName];
    uint64_t v22 = [v21 copy];
    storeName = v16->_storeName;
    v16->_storeName = (NSString *)v22;

    uint64_t v24 = [v11 shortenedDisplayName];
    uint64_t v25 = [v24 copy];
    displayName = v16->_displayName;
    v16->_displayName = (NSString *)v25;

    v27 = [v11 adamID];
    v28 = [v27 stringValue];
    uint64_t v29 = [v28 copy];
    adamID = v16->_adamID;
    v16->_adamID = (NSString *)v29;

    v31 = [v11 bundleID];
    v32 = v31;
    if (v31 && [v31 length])
    {
      id v33 = v32;
      commonInit_0(v16, v13, v14, v33);
      v34 = [(VSAppSettingsViewModel *)v16 workspace];
      int v35 = [v34 applicationIsInstalled:v33];

      if (v35)
      {
        uint64_t v36 = VSIconForBundleWithIdentifier(v33);
        v37 = v16->_icon;
        v16->_icon = (UIImage *)v36;

        uint64_t v38 = [MEMORY[0x263F086E0] bundleWithIdentifier:v33];
        bundle = v16->_bundle;
        v16->_bundle = (NSBundle *)v38;
        uint64_t v40 = 4;
      }
      else
      {
        v41 = [v11 buyParams];
        bundle = v41;
        if (v41 && [(NSBundle *)v41 length])
        {
          uint64_t v42 = [(NSBundle *)bundle copy];
          buyParams = v16->_buyParams;
          v16->_buyParams = (NSString *)v42;

          uint64_t v40 = 2;
        }
        else
        {
          uint64_t v40 = 1;
        }
      }

      v16->_installState = v40;
    }
    else
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to create an app settings view model from an app description that lacks a bundle identifier."];
    }
  }
  return v16;
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_registrationToken)) {
    notify_cancel(self->_registrationToken);
  }
  [(LSApplicationWorkspace *)self->_workspace removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)VSAppSettingsViewModel;
  [(VSAppSettingsViewModel *)&v3 dealloc];
}

- (void)_updatePrivacyState
{
  id v10 = [(VSAppSettingsViewModel *)self privacyFacade];
  objc_super v3 = [(VSAppSettingsViewModel *)self bundle];
  if (v3)
  {
    v4 = [v10 knownAppBundles];
    int v5 = [v4 containsObject:v3];

    if (v5)
    {
      v6 = [v3 bundleIdentifier];

      if (!v6) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [bundle bundleIdentifier] parameter must not be nil."];
      }
      v7 = [v3 bundleIdentifier];
      int v8 = [v10 isAccessGrantedForBundleID:v7];

      if (v8) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 2;
      }
      [(VSAppSettingsViewModel *)self setPrivacyState:v9];
    }
  }
}

- (NSURL)appStoreURL
{
  v2 = [(VSAppSettingsViewModel *)self appDescription];
  objc_super v3 = [v2 appStoreURL];

  return (NSURL *)v3;
}

- (id)iconURLForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v5 = [(VSAppSettingsViewModel *)self appDescription];
  v6 = objc_msgSend(v5, "iconURLForSize:", width, height);

  return v6;
}

- (BOOL)canRevokeVoucher
{
  v2 = [(VSAppSettingsViewModel *)self voucher];
  objc_super v3 = [v2 object];

  return v3 != 0;
}

- (void)revokeVoucher
{
  objc_super v3 = [(VSAppSettingsViewModel *)self privacyFacade];
  id v6 = [v3 voucherLockbox];

  v4 = [(VSAppSettingsViewModel *)self voucher];
  int v5 = [v4 forceUnwrapObject];
  [v6 redeemVoucher:v5];
}

- (void)installApp
{
  objc_super v3 = [(VSAppSettingsViewModel *)self buyParams];
  if (![v3 length]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to install an app without buy params."];
  }
  unint64_t v4 = [(VSAppSettingsViewModel *)self installState];
  if (v4 <= 5 && ((0x3Bu >> v4) & 1) != 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:off_265077288[v4]];
  }
  [(VSAppSettingsViewModel *)self setInstallState:3];
  int v5 = objc_alloc_init(VSWLKAppInstallationOperation);
  [(VSWLKAppInstallationOperation *)v5 setInstallable:self];
  [(VSAsyncOperation *)v5 start];
  id v6 = v5;
  v7 = VSMainThreadOperationWithBlock();
  [v7 addDependency:v6];
  VSEnqueueCompletionOperation();
}

void __36__VSAppSettingsViewModel_installApp__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) result];
  objc_super v3 = [v2 forceUnwrapObject];
  unint64_t v4 = [v3 object];

  if (!v4)
  {
    int v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    [v5 setInstallState:v6];
  }
}

- (void)launchApp
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "Failed to open application.", v1, 2u);
}

- (BOOL)canChangePrivacyAccess
{
  objc_super v3 = [(VSAppSettingsViewModel *)self restrictionsCenter];
  if ([v3 isAcountModificationAllowed])
  {
    unint64_t v4 = [(VSAppSettingsViewModel *)self bundle];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingAccessGranted
{
  if (keyPathsForValuesAffectingAccessGranted___vs_lazy_init_predicate != -1) {
    dispatch_once(&keyPathsForValuesAffectingAccessGranted___vs_lazy_init_predicate, &__block_literal_global_7);
  }
  v2 = (void *)keyPathsForValuesAffectingAccessGranted___vs_lazy_init_variable;
  return v2;
}

uint64_t __65__VSAppSettingsViewModel_keyPathsForValuesAffectingAccessGranted__block_invoke()
{
  uint64_t v0 = __65__VSAppSettingsViewModel_keyPathsForValuesAffectingAccessGranted__block_invoke_2();
  uint64_t v1 = keyPathsForValuesAffectingAccessGranted___vs_lazy_init_variable;
  keyPathsForValuesAffectingAccessGranted___vs_lazy_init_variable = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id __65__VSAppSettingsViewModel_keyPathsForValuesAffectingAccessGranted__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v0 addObject:@"privacyState"];
  uint64_t v1 = (void *)[v0 copy];

  return v1;
}

- (BOOL)isAccessGranted
{
  return [(VSAppSettingsViewModel *)self privacyState] == 1;
}

- (void)setAccessGranted:(BOOL)a3
{
  if (a3) {
    [(VSAppSettingsViewModel *)self _grantPrivacyAccess];
  }
  else {
    [(VSAppSettingsViewModel *)self _denyPrivacyAccess];
  }
}

- (void)_grantPrivacyAccess
{
  if ([(VSAppSettingsViewModel *)self installState] != 4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to grant privacy access to an app that is not installed."];
  }
  if ([(VSAppSettingsViewModel *)self privacyState] != 2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to grant access to an app that had not been previously denied access."];
  }
  if (![(VSAppSettingsViewModel *)self canChangePrivacyAccess]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to grant access to an app when access cannot be changed."];
  }
  objc_super v3 = [(VSAppSettingsViewModel *)self privacyFacade];
  unint64_t v4 = [(VSAppSettingsViewModel *)self bundle];
  BOOL v5 = [v4 bundleIdentifier];

  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [[self bundle] bundleIdentifier] parameter must not be nil."];
  }
  uint64_t v6 = [(VSAppSettingsViewModel *)self bundle];
  v7 = [v6 bundleIdentifier];

  [v3 setAccessGranted:1 forBundleID:v7];
  [(VSAppSettingsViewModel *)self setPrivacyState:1];
}

- (void)_denyPrivacyAccess
{
  if ([(VSAppSettingsViewModel *)self installState] != 4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to deny privacy access to an app that is not installed."];
  }
  if ([(VSAppSettingsViewModel *)self privacyState] != 1) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to deny access to an app that had not been previously granted access."];
  }
  if (![(VSAppSettingsViewModel *)self canChangePrivacyAccess]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to deny access to an app when access cannot be changed."];
  }
  objc_super v3 = [(VSAppSettingsViewModel *)self privacyFacade];
  unint64_t v4 = [(VSAppSettingsViewModel *)self bundle];
  BOOL v5 = [v4 bundleIdentifier];

  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [[self bundle] bundleIdentifier] parameter must not be nil."];
  }
  uint64_t v6 = [(VSAppSettingsViewModel *)self bundle];
  v7 = [v6 bundleIdentifier];

  [v3 setAccessGranted:0 forBundleID:v7];
  [(VSAppSettingsViewModel *)self setPrivacyState:2];
}

- (void)applicationsWillInstall:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        id v10 = [(VSAppSettingsViewModel *)self bundleID];
        int v11 = [v9 isEqual:v10];

        if (v11) {
          VSPerformBlockOnMainThread();
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __50__VSAppSettingsViewModel_applicationsWillInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstallState:3];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v8), "bundleIdentifier", v12, v13, v14, v15);
        id v10 = [(VSAppSettingsViewModel *)self bundleID];
        int v11 = [v9 isEqual:v10];

        if (v11)
        {
          uint64_t v12 = MEMORY[0x263EF8330];
          uint64_t v13 = 3221225472;
          long long v14 = __49__VSAppSettingsViewModel_applicationsDidInstall___block_invoke;
          long long v15 = &unk_265076FD0;
          id v16 = v9;
          VSPerformBlockOnMainThread();
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

void __49__VSAppSettingsViewModel_applicationsDidInstall___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setBundle:v3];
  v2 = VSIconForBundleWithIdentifier(*(void **)(a1 + 32));
  [*(id *)(a1 + 40) setIcon:v2];
  setDisplayNameIfAvailable(*(void **)(a1 + 40));
  [*(id *)(a1 + 40) setInstallState:4];
}

- (void)applicationsDidFailToInstall:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        id v10 = [(VSAppSettingsViewModel *)self bundleID];
        int v11 = [v9 isEqual:v10];

        if (v11) {
          VSPerformBlockOnMainThread();
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __55__VSAppSettingsViewModel_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstallState:2];
}

- (void)applicationsWillUninstall:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        id v10 = [(VSAppSettingsViewModel *)self bundleID];
        int v11 = [v9 isEqual:v10];

        if (v11) {
          VSPerformBlockOnMainThread();
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __52__VSAppSettingsViewModel_applicationsWillUninstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstallState:5];
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        id v10 = [(VSAppSettingsViewModel *)self bundleID];
        int v11 = [v9 isEqual:v10];

        if (v11) {
          VSPerformBlockOnMainThread();
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __51__VSAppSettingsViewModel_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInstallState:2];
  v2 = *(void **)(a1 + 32);
  return [v2 setBundle:0];
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        id v10 = [(VSAppSettingsViewModel *)self bundleID];
        int v11 = [v9 isEqual:v10];

        if (v11) {
          VSPerformBlockOnMainThread();
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __57__VSAppSettingsViewModel_applicationsDidFailToUninstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstallState:4];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = NSString;
  uint64_t v5 = [(VSAppSettingsViewModel *)self adamID];
  uint64_t v6 = [v4 stringWithFormat:@"%@ = %@", @"adamID", v5];
  [v3 addObject:v6];

  uint64_t v7 = NSString;
  uint64_t v8 = [(VSAppSettingsViewModel *)self bundleID];
  uint64_t v9 = [v7 stringWithFormat:@"%@ = %@", @"bundleID", v8];
  [v3 addObject:v9];

  id v10 = NSString;
  int v11 = [(VSAppSettingsViewModel *)self displayName];
  long long v12 = [v10 stringWithFormat:@"%@ = %@", @"displayName", v11];
  [v3 addObject:v12];

  long long v13 = NSString;
  long long v14 = [(VSAppSettingsViewModel *)self voucher];
  long long v15 = [v13 stringWithFormat:@"%@ = %@", @"voucher", v14];
  [v3 addObject:v15];

  id v16 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)VSAppSettingsViewModel;
  uint64_t v17 = [(VSAppSettingsViewModel *)&v21 description];
  long long v18 = [v3 componentsJoinedByString:@", "];
  long long v19 = [v16 stringWithFormat:@"<%@ %@>", v17, v18];

  return (NSString *)v19;
}

- (id)appBundleIDs
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(VSAppSettingsViewModel *)self bundleID];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)appAdamIDs
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(VSAppSettingsViewModel *)self adamID];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)forceDSIDlessInstall
{
  return self->_forceDSIDlessInstall;
}

- (void)setForceDSIDlessInstall:(BOOL)a3
{
  self->_forceDSIDlessInstall = a3;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)storeName
{
  return self->_storeName;
}

- (int64_t)installState
{
  return self->_installState;
}

- (void)setInstallState:(int64_t)a3
{
  self->_installState = a3;
}

- (int64_t)privacyState
{
  return self->_privacyState;
}

- (void)setPrivacyState:(int64_t)a3
{
  self->_privacyState = a3;
}

- (VSOptional)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
}

- (BOOL)isDecided
{
  return self->_decided;
}

- (VSPrivacyFacade)privacyFacade
{
  return self->_privacyFacade;
}

- (void)setPrivacyFacade:(id)a3
{
}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
}

- (int)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(int)a3
{
  self->_registrationToken = a3;
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (void)setRestrictionsCenter:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (VSAppDescription)appDescription
{
  return self->_appDescription;
}

- (void)setAppDescription:(id)a3
{
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (int64_t)installSource
{
  return self->_installSource;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_appDescription, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_restrictionsCenter, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_privacyFacade, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

- (void)initWithApplicationWorkspace:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "Error registering for TCC notification.", v1, 2u);
}

@end