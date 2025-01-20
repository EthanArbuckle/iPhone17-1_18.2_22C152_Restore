@interface SBHSimpleApplication
+ (id)homeScreenService;
- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3;
- (BOOL)icon:(id)a3 canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (BOOL)iconCompleteUninstall:(id)a3;
- (BOOL)isBadgeValueValid;
- (BOOL)isBeta;
- (BOOL)isBlockedForScreenTimeExpiration;
- (BOOL)isInternalApplication;
- (BOOL)isPlaceholder;
- (BOOL)isProgressPaused;
- (BOOL)isSystemApplication;
- (NSArray)tags;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSURL)bundleURL;
- (SBHIconModelApplicationDataSource)iconModelApplicationDataSource;
- (SBHSimpleApplication)initWithApplicationInfo:(id)a3;
- (SBHSimpleApplication)initWithApplicationProxy:(id)a3;
- (SBHSimpleApplication)initWithApplicationRecord:(id)a3;
- (SBHSimpleApplication)initWithBundleIdentifier:(id)a3;
- (SBHSimpleApplication)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4;
- (SBHSimpleApplication)initWithBundleIdentifier:(id)a3 forcePlaceholder:(BOOL)a4;
- (double)progressPercent;
- (id)badgeNumberOrStringForIcon:(id)a3;
- (id)badgeValue;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (id)icon:(id)a3 layerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)supportedGridSizeClassesForIcon:(id)a3;
- (int64_t)labelAccessoryTypeForIcon:(id)a3;
- (int64_t)progressState;
- (unint64_t)installType;
- (unint64_t)priorityForIcon:(id)a3;
- (void)dealloc;
- (void)icon:(id)a3 prepareToMakeLayerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (void)remoteBadgeValueDidChange;
- (void)setBadgeValue:(id)a3;
- (void)setBadgeValueValid:(BOOL)a3;
- (void)setIconModelApplicationDataSource:(id)a3;
- (void)setProgressPaused:(BOOL)a3;
- (void)setProgressPercent:(double)a3;
- (void)setProgressState:(int64_t)a3;
- (void)updateDeviceManagementPolicy:(int64_t)a3;
- (void)updateProgressState:(int64_t)a3 progressPercent:(double)a4 progressPaused:(BOOL)a5;
@end

@implementation SBHSimpleApplication

- (SBHSimpleApplication)initWithBundleIdentifier:(id)a3
{
  return [(SBHSimpleApplication *)self initWithBundleIdentifier:a3 allowPlaceholder:0];
}

- (SBHSimpleApplication)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:v4 error:&v12];
  id v8 = v12;
  if (v7)
  {
    self = [(SBHSimpleApplication *)self initWithApplicationRecord:v7];
    v9 = self;
  }
  else
  {
    v10 = SBLogIcon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Error creating SBHSimpleApplication with '%@': %@", buf, 0x16u);
    }

    v9 = 0;
  }

  return v9;
}

- (SBHSimpleApplication)initWithBundleIdentifier:(id)a3 forcePlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  result = [(SBHSimpleApplication *)self initWithBundleIdentifier:a3 allowPlaceholder:1];
  if (result)
  {
    if (v4) {
      result->_placeholder = 1;
    }
  }
  return result;
}

- (SBHSimpleApplication)initWithApplicationInfo:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBHSimpleApplication;
  v5 = [(SBHSimpleApplication *)&v21 init];
  if (v5)
  {
    id v6 = [v4 bundleIdentifier];
    uint64_t v7 = [v6 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v9 = [v4 bundleURL];
    uint64_t v10 = [v9 copy];
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v10;

    id v12 = [v4 displayName];
    uint64_t v13 = [v12 copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    __int16 v15 = [v4 tags];
    uint64_t v16 = [v15 copy];
    tags = v5->_tags;
    v5->_tags = (NSArray *)v16;

    v5->_beta = [v4 isBeta];
    v5->_blockedForScreenTimeExpiration = [v4 isBlockedForScreenTimeExpiration];
    unint64_t v18 = [v4 type];
    v5->_systemApplication = v18 < 2;
    v5->_internalApplication = v18 == 0;
    v19 = +[SBHSimpleApplicationPolicyMonitor sharedInstance];
    [v19 registerApplication:v5];
  }
  return v5;
}

- (SBHSimpleApplication)initWithApplicationProxy:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SBHSimpleApplication;
  v5 = [(SBHSimpleApplication *)&v24 init];
  if (v5)
  {
    id v6 = [v4 bundleIdentifier];
    uint64_t v7 = [v6 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v9 = [v4 bundleURL];
    uint64_t v10 = [v9 copy];
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v10;

    id v12 = [v4 localizedName];
    uint64_t v13 = [v12 copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    uint64_t v15 = [v4 appTags];
    tags = v5->_tags;
    v5->_tags = (NSArray *)v15;

    v5->_beta = [v4 isBetaApp];
    uint64_t v17 = [v4 appState];
    v5->_placeholder = [v17 isPlaceholder];

    v5->_installType = [v4 installType];
    unint64_t v18 = [v4 applicationType];
    char v19 = [v18 isEqualToString:*MEMORY[0x1E4F22380]];
    uint64_t v20 = *MEMORY[0x1E4F22350];
    if (v19) {
      char v21 = 1;
    }
    else {
      char v21 = [v18 isEqualToString:*MEMORY[0x1E4F22350]];
    }
    v5->_systemApplication = v21;
    v5->_internalApplication = [v18 isEqualToString:v20];
    v22 = +[SBHSimpleApplicationPolicyMonitor sharedInstance];
    [v22 registerApplication:v5];
  }
  return v5;
}

- (SBHSimpleApplication)initWithApplicationRecord:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBHSimpleApplication;
  v5 = [(SBHSimpleApplication *)&v21 init];
  if (v5)
  {
    id v6 = [v4 bundleIdentifier];
    uint64_t v7 = [v6 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v9 = [v4 URL];
    uint64_t v10 = [v9 copy];
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v10;

    id v12 = [v4 localizedName];
    uint64_t v13 = [v12 copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    uint64_t v15 = [v4 appTags];
    tags = v5->_tags;
    v5->_tags = (NSArray *)v15;

    v5->_beta = [v4 isBeta];
    v5->_placeholder = [v4 isPlaceholder];
    v5->_installType = [v4 installType];
    uint64_t v17 = [v4 typeForInstallMachinery];
    v5->_internalApplication = [v17 isEqualToString:*MEMORY[0x1E4F22350]];
    BOOL v18 = ([v17 isEqualToString:*MEMORY[0x1E4F22380]] & 1) != 0 || v5->_internalApplication;
    v5->_systemApplication = v18;
    char v19 = +[SBHSimpleApplicationPolicyMonitor sharedInstance];
    [v19 registerApplication:v5];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[SBHSimpleApplicationPolicyMonitor sharedInstance];
  [v3 unregisterApplication:self];

  v4.receiver = self;
  v4.super_class = (Class)SBHSimpleApplication;
  [(SBHSimpleApplication *)&v4 dealloc];
}

- (void)updateDeviceManagementPolicy:(int64_t)a3
{
  BOOL v3 = a3 != 0;
  if (self->_blockedForScreenTimeExpiration != v3)
  {
    self->_blockedForScreenTimeExpiration = v3;
    objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 postNotificationName:@"SBLeafIconDataSourceDidChangeNotification" object:self];
  }
}

- (void)updateProgressState:(int64_t)a3 progressPercent:(double)a4 progressPaused:(BOOL)a5
{
  BOOL v5 = a5;
  [(SBHSimpleApplication *)self setProgressState:a3];
  [(SBHSimpleApplication *)self setProgressPercent:a4];
  [(SBHSimpleApplication *)self setProgressPaused:v5];
  objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 postNotificationName:@"SBLeafIconDataSourceDidChangeNotification" object:self];
}

- (unint64_t)priorityForIcon:(id)a3
{
  if ([(SBHSimpleApplication *)self isPlaceholder]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  uint64_t v10 = [(SBHSimpleApplication *)self bundleIdentifier];
  v11 = SBHGetApplicationIconImage(v10, 0, v9, v8, v7);

  return v11;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  uint64_t v10 = [(SBHSimpleApplication *)self bundleIdentifier];
  v11 = SBHGetApplicationIconImage(v10, 1, v9, v8, v7);

  return v11;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  int v9 = (int)a5;
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  id v14 = a4;
  LOBYTE(v9) = SBHIconServicesOptionsForImageOptions(v9);
  uint64_t v15 = [(SBHSimpleApplication *)self bundleIdentifier];
  uint64_t v16 = SBHGetApplicationIconImageWithTraitCollection(v15, (uint64_t)v14, v9, v12, v11, v10);

  return v16;
}

- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3
{
  return 1;
}

- (BOOL)icon:(id)a3 canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  char v9 = (char)a5;
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [(SBHSimpleApplication *)self bundleIdentifier];
  char v14 = SBHIconServicesCacheOptionsForImageOptions(v9);
  v18[0] = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  char v16 = SBHHasCachedIconImagesForApplications(v15, v14, v12, v11, v10);

  return v16;
}

- (void)icon:(id)a3 prepareToMakeLayerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  double v9 = v8;
  double v10 = v7;
  double v11 = v6;
  v14[1] = *MEMORY[0x1E4F143B8];
  double v12 = [(SBHSimpleApplication *)self bundleIdentifier];
  v14[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  SBHCacheIconImagesForApplications(v13, 3, v11, v10, v9);
}

- (id)icon:(id)a3 layerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  int v10 = (int)a5;
  double v11 = v9;
  double v12 = v8;
  double v13 = v7;
  double v14 = v6;
  char v16 = a4;
  uint64_t v17 = [(SBHSimpleApplication *)self bundleIdentifier];
  char v18 = SBHIconServicesOptionsForImageOptions(v10);
  char v19 = SBHGetApplicationIconLayerWithTraitCollection(v17, (uint64_t)v16, v18, v14, v13, v12, v11);

  return v19;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  return +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
}

- (int64_t)labelAccessoryTypeForIcon:(id)a3
{
  if ([(SBHSimpleApplication *)self isBlockedForScreenTimeExpiration]) {
    return 4;
  }
  if ([(SBHSimpleApplication *)self isBeta]) {
    return 2;
  }
  if ([(SBHSimpleApplication *)self isPlaceholder])
  {
    [(SBHSimpleApplication *)self installType];
    if (FBSInstallTypeIsCloudDemoted()) {
      return 3;
    }
  }
  return 0;
}

- (BOOL)iconCompleteUninstall:(id)a3
{
  double v4 = [(SBHSimpleApplication *)self iconModelApplicationDataSource];
  double v5 = [(SBHSimpleApplication *)self bundleIdentifier];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 uninstallApplicationWithBundleIdentifier:v5 completion:0];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)badgeNumberOrStringForIcon:(id)a3
{
  if (![(SBHSimpleApplication *)self isBadgeValueValid])
  {
    double v4 = [MEMORY[0x1E4F4F7F8] processHandle];
    int v5 = [v4 hasEntitlement:@"com.apple.springboard.iconBadgeValue"];

    if (v5)
    {
      BOOL v6 = [(SBHSimpleApplication *)self bundleIdentifier];
      double v7 = [(id)objc_opt_class() homeScreenService];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__SBHSimpleApplication_badgeNumberOrStringForIcon___block_invoke;
      v10[3] = &unk_1E6AAE7D8;
      v10[4] = self;
      [v7 badgeValueForIconWithApplicationBundleIdentifier:v6 completionHandler:v10];
    }
  }
  double v8 = [(SBHSimpleApplication *)self badgeValue];
  return v8;
}

void __51__SBHSimpleApplication_badgeNumberOrStringForIcon___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) setBadgeValueValid:1];
  BOOL v3 = [*(id *)(a1 + 32) badgeValue];
  char v4 = BSEqualObjects();

  if ((v4 & 1) == 0)
  {
    [*(id *)(a1 + 32) setBadgeValue:v6];
    int v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    [v5 postNotificationName:@"SBLeafIconDataSourceDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

- (void)remoteBadgeValueDidChange
{
  [(SBHSimpleApplication *)self setBadgeValueValid:0];
  objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:@"SBLeafIconDataSourceDidChangeNotification" object:self];
}

+ (id)homeScreenService
{
  if (homeScreenService_onceToken != -1) {
    dispatch_once(&homeScreenService_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)homeScreenService__homeScreenService;
  return v2;
}

void __41__SBHSimpleApplication_homeScreenService__block_invoke()
{
  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4FA6AC8]);
    v1 = (void *)homeScreenService__homeScreenService;
    homeScreenService__homeScreenService = (uint64_t)v0;
  }
}

- (NSString)description
{
  return (NSString *)[(SBHSimpleApplication *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBHSimpleApplication *)self descriptionBuilderWithMultilinePrefix:a3];
  char v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  int v5 = [(SBHSimpleApplication *)self bundleIdentifier];
  id v6 = (id)[v4 appendObject:v5 withName:@"bundleIdentifier"];

  double v7 = [(SBHSimpleApplication *)self displayName];
  id v8 = (id)[v4 appendObject:v7 withName:@"displayName"];

  id v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHSimpleApplication isPlaceholder](self, "isPlaceholder"), @"isPlaceholder", 1);
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBHSimpleApplication *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)tags
{
  return self->_tags;
}

- (BOOL)isSystemApplication
{
  return self->_systemApplication;
}

- (BOOL)isInternalApplication
{
  return self->_internalApplication;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (id)badgeValue
{
  return self->_badgeValue;
}

- (void)setBadgeValue:(id)a3
{
}

- (SBHIconModelApplicationDataSource)iconModelApplicationDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconModelApplicationDataSource);
  return (SBHIconModelApplicationDataSource *)WeakRetained;
}

- (void)setIconModelApplicationDataSource:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (unint64_t)installType
{
  return self->_installType;
}

- (BOOL)isBlockedForScreenTimeExpiration
{
  return self->_blockedForScreenTimeExpiration;
}

- (int64_t)progressState
{
  return self->_progressState;
}

- (void)setProgressState:(int64_t)a3
{
  self->_progressState = a3;
}

- (double)progressPercent
{
  return self->_progressPercent;
}

- (void)setProgressPercent:(double)a3
{
  self->_progressPercent = a3;
}

- (BOOL)isProgressPaused
{
  return self->_progressPaused;
}

- (void)setProgressPaused:(BOOL)a3
{
  self->_progressPaused = a3;
}

- (BOOL)isBadgeValueValid
{
  return self->_badgeValueValid;
}

- (void)setBadgeValueValid:(BOOL)a3
{
  self->_badgeValueValid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconModelApplicationDataSource);
  objc_storeStrong(&self->_badgeValue, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end