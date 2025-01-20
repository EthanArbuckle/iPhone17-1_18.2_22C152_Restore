@interface WBSPasswordWarningTopFraudTargetsManager
- (WBSPasswordWarningTopFraudTargetsManager)init;
- (id)_initWithBuiltinListURL:(id)a3 shouldAttemptToUpdateConfiguration:(BOOL)a4;
- (void)dealloc;
- (void)getTopFraudTargetsWithCompletionHandler:(id)a3;
@end

@implementation WBSPasswordWarningTopFraudTargetsManager

- (WBSPasswordWarningTopFraudTargetsManager)init
{
  v3 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariCoreBundle");
  v4 = [v3 URLForResource:@"WBSPasswordWarningTopFraudTargets" withExtension:@"plist"];

  v5 = [(WBSPasswordWarningTopFraudTargetsManager *)self _initWithBuiltinListURL:v4 shouldAttemptToUpdateConfiguration:1];
  return v5;
}

- (id)_initWithBuiltinListURL:(id)a3 shouldAttemptToUpdateConfiguration:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSPasswordWarningTopFraudTargetsManager;
  v7 = [(WBSPasswordWarningTopFraudTargetsManager *)&v17 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    v9 = objc_msgSend(v8, "safari_settingsDirectoryURL");

    v10 = [WBSRemotelyUpdatableDataController alloc];
    if (v4) {
      v11 = v9;
    }
    else {
      v11 = 0;
    }
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [(WBSRemotelyUpdatableDataController *)v10 initWithDataFormat:0 builtInListURL:v6 downloadsDirectoryURL:v11 resourceName:@"PasswordBreachAwarenessTopFraudTargets" resourceVersion:@"1" updateDateDefaultsKey:@"WBSPasswordWarningTopFraudTargetsLastUpdate" updateInterval:86400.0 snapshotClass:v12 snapshotTransformerClass:objc_opt_class()];
    remotelyUpdatableDataController = v7->_remotelyUpdatableDataController;
    v7->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v13;

    [(WBSRemotelyUpdatableDataController *)v7->_remotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:v4];
    v15 = v7;
  }
  return v7;
}

- (void)dealloc
{
  [(WBSRemotelyUpdatableDataController *)self->_remotelyUpdatableDataController prepareForTermination];
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordWarningTopFraudTargetsManager;
  [(WBSPasswordWarningTopFraudTargetsManager *)&v3 dealloc];
}

- (void)getTopFraudTargetsWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end