@interface SBHTrialClientManager
- (BOOL)widgetDiscoverabilityGoSwitchEnabled;
- (NSString)homeScreenNamespace;
- (SBHTrialClientManager)init;
- (TRIClient)trialClient;
- (void)immediatelyFetchSpringBoardHomeNamespace;
- (void)setHomeScreenNamespace:(id)a3;
- (void)setTrialClient:(id)a3;
@end

@implementation SBHTrialClientManager

- (SBHTrialClientManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBHTrialClientManager;
  v2 = [(SBHTrialClientManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB0098] clientWithIdentifier:271];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;

    uint64_t v5 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:962];
    homeScreenNamespace = v2->_homeScreenNamespace;
    v2->_homeScreenNamespace = (NSString *)v5;
  }
  return v2;
}

- (void)immediatelyFetchSpringBoardHomeNamespace
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(SBHTrialClientManager *)self homeScreenNamespace];
  v15[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v6 = [v3 setWithArray:v5];

  v7 = [(SBHTrialClientManager *)self trialClient];
  id v12 = 0;
  char v8 = [v7 immediateDownloadForNamespaceNames:v6 allowExpensiveNetworking:1 error:&v12];
  id v9 = v12;

  if (v9)
  {
    v10 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Immediate download onboarding factor error: %@", buf, 0xCu);
    }
  }
  if ((v8 & 1) == 0)
  {
    v11 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Immediate download onboarding factor failed.", buf, 2u);
    }
  }
}

- (BOOL)widgetDiscoverabilityGoSwitchEnabled
{
  uint64_t v3 = [(SBHTrialClientManager *)self trialClient];
  v4 = [(SBHTrialClientManager *)self homeScreenNamespace];
  uint64_t v5 = [v3 levelForFactor:@"goSwitch" withNamespaceName:v4];

  LOBYTE(v4) = [v5 BOOLeanValue];
  return (char)v4;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSString)homeScreenNamespace
{
  return self->_homeScreenNamespace;
}

- (void)setHomeScreenNamespace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenNamespace, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end