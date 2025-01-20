@interface SBFApplication
- (BOOL)isSystemOrInternalApplication;
- (NSArray)dynamicApplicationShortcutItems;
- (NSArray)staticApplicationShortcutItems;
- (NSNumber)appStoreItemID;
- (NSString)applicationBundleIdentifier;
- (NSString)applicationShortcutWidgetBundleIdentifier;
- (NSString)displayName;
- (NSURL)bundleURL;
- (SBFApplication)init;
- (SBFApplication)initWithApplicationBundleIdentifier:(id)a3;
- (void)_updateApplicationShortcutServiceFetchResult;
- (void)dealloc;
@end

@implementation SBFApplication

- (SBFApplication)initWithApplicationBundleIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBFApplication.m", 26, @"Invalid parameter not satisfying: %@", @"applicationBundleIdentifier != nil" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)SBFApplication;
  v7 = [(SBFApplication *)&v25 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_applicationBundleIdentifier, a3);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
    v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 localizedName];
      displayName = v8->_displayName;
      v8->_displayName = (NSString *)v11;

      uint64_t v13 = [v10 URL];
      bundleURL = v8->_bundleURL;
      v8->_bundleURL = (NSURL *)v13;

      v15 = [v10 typeForInstallMachinery];
      if (([v15 isEqualToString:@"System"] & 1) != 0
        || [v15 isEqualToString:@"Internal"])
      {
        v8->_systemOrInternalApplication = 1;
      }
      v16 = [v10 iTunesMetadata];
      uint64_t v17 = [v16 storeItemIdentifier];

      if (v17)
      {
        uint64_t v18 = [NSNumber numberWithUnsignedLongLong:v17];
        appStoreItemID = v8->_appStoreItemID;
        v8->_appStoreItemID = (NSNumber *)v18;
      }
      v20 = [v10 infoDictionary];
      uint64_t v21 = [v20 objectForKey:@"UIApplicationShortcutWidget" ofClass:objc_opt_class()];
      applicationShortcutWidgetBundleIdentifier = v8->_applicationShortcutWidgetBundleIdentifier;
      v8->_applicationShortcutWidgetBundleIdentifier = (NSString *)v21;
    }
  }

  return v8;
}

- (SBFApplication)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%s is not a valid initializer. You must call -[%@ initWithApplicationBundleIdentifier:].", "-[SBFApplication init]", v6 format];

  return [(SBFApplication *)self initWithApplicationBundleIdentifier:0];
}

- (void)dealloc
{
  applicationShortcutService = self->_applicationShortcutService;
  if (applicationShortcutService) {
    [(SBSApplicationShortcutService *)applicationShortcutService invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFApplication;
  [(SBFApplication *)&v4 dealloc];
}

- (NSArray)staticApplicationShortcutItems
{
  v3 = self->_applicationShortcutServiceFetchResult;
  objc_sync_enter(v3);
  applicationShortcutServiceFetchResult = self->_applicationShortcutServiceFetchResult;
  if (!applicationShortcutServiceFetchResult)
  {
    [(SBFApplication *)self _updateApplicationShortcutServiceFetchResult];
    applicationShortcutServiceFetchResult = self->_applicationShortcutServiceFetchResult;
  }
  v5 = [(SBSApplicationShortcutServiceFetchResult *)applicationShortcutServiceFetchResult staticApplicationShortcutItems];
  objc_sync_exit(v3);

  return (NSArray *)v5;
}

- (NSArray)dynamicApplicationShortcutItems
{
  v3 = self->_applicationShortcutServiceFetchResult;
  objc_sync_enter(v3);
  [(SBFApplication *)self _updateApplicationShortcutServiceFetchResult];
  objc_super v4 = [(SBSApplicationShortcutServiceFetchResult *)self->_applicationShortcutServiceFetchResult dynamicApplicationShortcutItems];
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (void)_updateApplicationShortcutServiceFetchResult
{
  if (!self->_applicationShortcutService)
  {
    v3 = (SBSApplicationShortcutService *)objc_alloc_init(MEMORY[0x1E4FA69D8]);
    applicationShortcutService = self->_applicationShortcutService;
    self->_applicationShortcutService = v3;
  }
  BSContinuousMachTimeNow();
  if (v5 - self->_applicationShortcutServiceFetchResultExpirationReferenceTime >= 2.0)
  {
    id v6 = self->_applicationShortcutService;
    v7 = [(SBFApplication *)self applicationBundleIdentifier];
    v8 = [(SBSApplicationShortcutService *)v6 applicationShortcutItemsOfTypes:3 forBundleIdentifier:v7];
    applicationShortcutServiceFetchResult = self->_applicationShortcutServiceFetchResult;
    self->_applicationShortcutServiceFetchResult = v8;

    BSContinuousMachTimeNow();
    self->_applicationShortcutServiceFetchResultExpirationReferenceTime = v10;
  }
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (BOOL)isSystemOrInternalApplication
{
  return self->_systemOrInternalApplication;
}

- (NSNumber)appStoreItemID
{
  return self->_appStoreItemID;
}

- (NSString)applicationShortcutWidgetBundleIdentifier
{
  return self->_applicationShortcutWidgetBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationShortcutWidgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appStoreItemID, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationShortcutServiceFetchResult, 0);
  objc_storeStrong((id *)&self->_applicationShortcutService, 0);
}

@end