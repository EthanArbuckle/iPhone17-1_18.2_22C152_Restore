@interface WBSPasswordBreachConfigurationBagLoader
+ (WBSPasswordBreachConfigurationBagLoader)sharedLoader;
- (WBSPasswordBreachConfigurationBagLoader)init;
- (void)dealloc;
- (void)getConfigurationBagWithCompletionHandler:(id)a3;
@end

@implementation WBSPasswordBreachConfigurationBagLoader

- (WBSPasswordBreachConfigurationBagLoader)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBSPasswordBreachConfigurationBagLoader;
  v2 = [(WBSPasswordBreachConfigurationBagLoader *)&v13 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariSharedBundle");
    v4 = [v3 URLForResource:@"WBSPasswordBreachConfigurationBag" withExtension:@"plist"];

    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    v6 = objc_msgSend(v5, "safari_settingsDirectoryURL");

    id v7 = objc_alloc(MEMORY[0x1E4F97F90]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v7 initWithDataFormat:0 builtInListURL:v4 downloadsDirectoryURL:v6 resourceName:@"PasswordBreachAwarenessConfigurationBag" resourceVersion:@"1" updateDateDefaultsKey:@"WBSPasswordBreachConfigurationBagLastUpdate" updateInterval:86400.0 snapshotClass:v8 snapshotTransformerClass:objc_opt_class()];
    remotelyUpdatableDataController = v2->_remotelyUpdatableDataController;
    v2->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v9;

    [(WBSRemotelyUpdatableDataController *)v2->_remotelyUpdatableDataController setDelegate:v2];
    [(WBSRemotelyUpdatableDataController *)v2->_remotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:1];
    v11 = v2;
  }
  return v2;
}

- (void)dealloc
{
  [(WBSRemotelyUpdatableDataController *)self->_remotelyUpdatableDataController prepareForTermination];
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordBreachConfigurationBagLoader;
  [(WBSPasswordBreachConfigurationBagLoader *)&v3 dealloc];
}

+ (WBSPasswordBreachConfigurationBagLoader)sharedLoader
{
  if (sharedLoader_onceToken != -1) {
    dispatch_once(&sharedLoader_onceToken, &__block_literal_global_86);
  }
  v2 = (void *)sharedLoader_loader;
  return (WBSPasswordBreachConfigurationBagLoader *)v2;
}

void __55__WBSPasswordBreachConfigurationBagLoader_sharedLoader__block_invoke()
{
  v0 = objc_alloc_init(WBSPasswordBreachConfigurationBagLoader);
  v1 = (void *)sharedLoader_loader;
  sharedLoader_loader = (uint64_t)v0;
}

- (void)getConfigurationBagWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end