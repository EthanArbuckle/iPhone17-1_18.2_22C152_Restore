@interface TRINamespaceOptionalParams
- (BOOL)availableToRootUser;
- (BOOL)enableFetchDuringSetupAssistant;
- (BOOL)expensiveNetworkingAllowed;
- (NSSet)upgradeNCVs;
- (NSString)resourceAttributionIdentifier;
- (NSURL)factorsURL;
- (TRIAppContainer)appContainer;
- (TRINamespaceOptionalParams)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)cloudKitContainerId;
- (int)purgeabilityLevel;
- (void)setAppContainer:(id)a3;
- (void)setAvailableToRootUser:(BOOL)a3;
- (void)setCloudKitContainerId:(int)a3;
- (void)setEnableFetchDuringSetupAssistant:(BOOL)a3;
- (void)setExpensiveNetworkingAllowed:(BOOL)a3;
- (void)setFactorsURL:(id)a3;
- (void)setPurgeabilityLevel:(int)a3;
- (void)setResourceAttributionIdentifier:(id)a3;
- (void)setUpgradeNCVs:(id)a3;
@end

@implementation TRINamespaceOptionalParams

- (void)setUpgradeNCVs:(id)a3
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
    id v5 = a3;
    v6 = (NSSet *)[[v4 alloc] initWithSet:v5 copyItems:1];

    upgradeNCVs = self->_upgradeNCVs;
    self->_upgradeNCVs = v6;
  }
}

- (void)setResourceAttributionIdentifier:(id)a3
{
}

- (void)setFactorsURL:(id)a3
{
}

- (void)setCloudKitContainerId:(int)a3
{
  self->_cloudKitContainerId = a3;
}

- (void)setAppContainer:(id)a3
{
}

- (TRINamespaceOptionalParams)init
{
  v3.receiver = self;
  v3.super_class = (Class)TRINamespaceOptionalParams;
  result = [(TRINamespaceOptionalParams *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_expensiveNetworkingAllowed = 0;
    *(void *)&result->_cloudKitContainerId = 0x300000001;
    result->_availableToRootUser = 0;
  }
  return result;
}

- (NSSet)upgradeNCVs
{
  return self->_upgradeNCVs;
}

- (NSString)resourceAttributionIdentifier
{
  return self->_resourceAttributionIdentifier;
}

- (int)purgeabilityLevel
{
  return self->_purgeabilityLevel;
}

- (NSURL)factorsURL
{
  return self->_factorsURL;
}

- (BOOL)expensiveNetworkingAllowed
{
  return self->_expensiveNetworkingAllowed;
}

- (BOOL)enableFetchDuringSetupAssistant
{
  return self->_enableFetchDuringSetupAssistant;
}

- (int)cloudKitContainerId
{
  return self->_cloudKitContainerId;
}

- (BOOL)availableToRootUser
{
  return self->_availableToRootUser;
}

- (TRIAppContainer)appContainer
{
  return self->_appContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceAttributionIdentifier, 0);
  objc_storeStrong((id *)&self->_upgradeNCVs, 0);
  objc_storeStrong((id *)&self->_appContainer, 0);
  objc_storeStrong((id *)&self->_factorsURL, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  [v4 setFactorsURL:self->_factorsURL];
  [v4 setAppContainer:self->_appContainer];
  [v4 setUpgradeNCVs:self->_upgradeNCVs];
  [v4 setCloudKitContainerId:self->_cloudKitContainerId];
  [v4 setResourceAttributionIdentifier:self->_resourceAttributionIdentifier];
  [v4 setExpensiveNetworkingAllowed:self->_expensiveNetworkingAllowed];
  [v4 setEnableFetchDuringSetupAssistant:self->_enableFetchDuringSetupAssistant];
  [v4 setPurgeabilityLevel:self->_purgeabilityLevel];
  [v4 setAvailableToRootUser:self->_availableToRootUser];
  return v4;
}

- (void)setExpensiveNetworkingAllowed:(BOOL)a3
{
  self->_expensiveNetworkingAllowed = a3;
}

- (void)setEnableFetchDuringSetupAssistant:(BOOL)a3
{
  self->_enableFetchDuringSetupAssistant = a3;
}

- (void)setPurgeabilityLevel:(int)a3
{
  self->_purgeabilityLevel = a3;
}

- (void)setAvailableToRootUser:(BOOL)a3
{
  self->_availableToRootUser = a3;
}

@end