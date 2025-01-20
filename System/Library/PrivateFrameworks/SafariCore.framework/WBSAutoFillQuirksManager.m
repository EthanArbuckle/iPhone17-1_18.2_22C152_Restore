@interface WBSAutoFillQuirksManager
- (BOOL)_isURL:(id)a3 containedInQuirks:(id)a4;
- (BOOL)arePasskeysDisallowedForRelyingParty:(id)a3;
- (BOOL)isAutomaticLoginDisallowedOnURL:(id)a3;
- (BOOL)isDomainKnownToAskForCredentialsForOtherServicesWhenEmbeddedAsThirdParty:(id)a3;
- (BOOL)isDomainKnownToDoSameDocumentNavigationInTextEditingCallback:(id)a3;
- (BOOL)isStreamlinedLoginDisallowedOnURL:(id)a3;
- (BOOL)shouldAttemptToDownloadConfiguration;
- (BOOL)shouldUseFallbackUIForRelyingParty:(id)a3;
- (WBSAppIDsToDomainsAssociationManager)appToWebsiteAssociationManager;
- (WBSAutoFillAssociatedDomainsManager)associatedDomainsManager;
- (WBSAutoFillQuirksManager)init;
- (WBSAutoFillQuirksManager)initWithBuiltInQuirksURL:(id)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8;
- (WBSChangePasswordURLManager)changePasswordURLManager;
- (WBSPair)knownWebBrowsersAndExtensionStorefronts;
- (WBSPasswordAuditingEligibleDomainsManager)passwordAuditingEligibleDomainsManager;
- (WBSPasswordGenerationManager)passwordGenerationManager;
- (id)_appIDsToDomainsAssociationsFromCurrentSnapshot;
- (id)_changePasswordURLStringsFromCurrentSnapshot;
- (id)_domainsIneligibleForPasswordAuditingFromCurrentSnapshot;
- (id)_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot;
- (id)_domainsToConsiderIdenticalFromCurrentSnapshot;
- (id)_domainsWithAssociatedCredentialsFromCurrentSnapshot;
- (id)_passwordRequirementsByDomainFromCurrentSnapshot;
- (id)_urlFromRelyingParty:(id)a3;
- (id)domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
- (void)_sendDidDownloadNewDataNotification;
- (void)beginLoadingQuirksFromDisk;
- (void)didDownloadDataForRemotelyUpdatableDataController:(id)a3;
- (void)prepareForTermination;
- (void)setShouldAttemptToDownloadConfiguration:(BOOL)a3;
@end

@implementation WBSAutoFillQuirksManager

- (WBSAutoFillQuirksManager)initWithBuiltInQuirksURL:(id)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)WBSAutoFillQuirksManager;
  v19 = [(WBSAutoFillQuirksManager *)&v26 init];
  if (v19)
  {
    v20 = [WBSRemotelyUpdatableDataController alloc];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = [(WBSRemotelyUpdatableDataController *)v20 initWithDataFormat:0 builtInListURL:v14 downloadsDirectoryURL:v15 resourceName:v16 resourceVersion:v17 updateDateDefaultsKey:v18 updateInterval:a8 snapshotClass:v21 snapshotTransformerClass:objc_opt_class()];
    remotelyUpdatableDataController = v19->_remotelyUpdatableDataController;
    v19->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v22;

    [(WBSRemotelyUpdatableDataController *)v19->_remotelyUpdatableDataController setShouldKeepBuiltInSnapshotLoaded:1];
    [(WBSRemotelyUpdatableDataController *)v19->_remotelyUpdatableDataController setDelegate:v19];
    if (a8 != 0.0) {
      [(WBSRemotelyUpdatableDataController *)v19->_remotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:1];
    }
    [(WBSRemotelyUpdatableDataController *)v19->_remotelyUpdatableDataController setDataIsUsedByMultipleProcesses:1];
    v24 = v19;
  }

  return v19;
}

- (void)beginLoadingQuirksFromDisk
{
}

- (WBSAutoFillQuirksManager)init
{
  return 0;
}

- (void)setShouldAttemptToDownloadConfiguration:(BOOL)a3
{
  self->_shouldAttemptToDownloadConfiguration = a3;
  -[WBSRemotelyUpdatableDataController setShouldAttemptToDownloadConfiguration:](self->_remotelyUpdatableDataController, "setShouldAttemptToDownloadConfiguration:");
}

- (void)prepareForTermination
{
}

- (WBSPasswordGenerationManager)passwordGenerationManager
{
  passwordGenerationManager = self->_passwordGenerationManager;
  if (!passwordGenerationManager)
  {
    v4 = [WBSPasswordGenerationManager alloc];
    v5 = [(WBSAutoFillQuirksManager *)self _passwordRequirementsByDomainFromCurrentSnapshot];
    v6 = [(WBSPasswordGenerationManager *)v4 initWithPasswordRequirementsByDomain:v5];
    v7 = self->_passwordGenerationManager;
    self->_passwordGenerationManager = v6;

    passwordGenerationManager = self->_passwordGenerationManager;
  }
  v8 = passwordGenerationManager;
  return v8;
}

- (WBSAutoFillAssociatedDomainsManager)associatedDomainsManager
{
  associatedDomainsManager = self->_associatedDomainsManager;
  if (!associatedDomainsManager)
  {
    v4 = [WBSAutoFillAssociatedDomainsManager alloc];
    v5 = [(WBSAutoFillQuirksManager *)self _domainsWithAssociatedCredentialsFromCurrentSnapshot];
    v6 = [(WBSAutoFillQuirksManager *)self _domainsToConsiderIdenticalFromCurrentSnapshot];
    v7 = [(WBSAutoFillAssociatedDomainsManager *)v4 initWithDomainsWithAssociatedCredentials:v5 domainsToConsiderIdentical:v6];
    v8 = self->_associatedDomainsManager;
    self->_associatedDomainsManager = v7;

    associatedDomainsManager = self->_associatedDomainsManager;
  }
  v9 = associatedDomainsManager;
  return v9;
}

- (WBSPasswordAuditingEligibleDomainsManager)passwordAuditingEligibleDomainsManager
{
  passwordAuditingEligibleDomainsManager = self->_passwordAuditingEligibleDomainsManager;
  if (!passwordAuditingEligibleDomainsManager)
  {
    v4 = [WBSPasswordAuditingEligibleDomainsManager alloc];
    v5 = [(WBSAutoFillQuirksManager *)self _domainsIneligibleForPasswordAuditingFromCurrentSnapshot];
    v6 = [(WBSPasswordAuditingEligibleDomainsManager *)v4 initWithDomainsIneligibleForPasswordAuditing:v5];
    v7 = self->_passwordAuditingEligibleDomainsManager;
    self->_passwordAuditingEligibleDomainsManager = v6;

    passwordAuditingEligibleDomainsManager = self->_passwordAuditingEligibleDomainsManager;
  }
  v8 = passwordAuditingEligibleDomainsManager;
  return v8;
}

- (WBSChangePasswordURLManager)changePasswordURLManager
{
  changePasswordURLManager = self->_changePasswordURLManager;
  if (!changePasswordURLManager)
  {
    v4 = [WBSChangePasswordURLManager alloc];
    v5 = [(WBSAutoFillQuirksManager *)self _changePasswordURLStringsFromCurrentSnapshot];
    v6 = [(WBSChangePasswordURLManager *)v4 initWithChangePasswordURLStrings:v5];
    v7 = self->_changePasswordURLManager;
    self->_changePasswordURLManager = v6;

    changePasswordURLManager = self->_changePasswordURLManager;
  }
  v8 = changePasswordURLManager;
  return v8;
}

- (WBSAppIDsToDomainsAssociationManager)appToWebsiteAssociationManager
{
  appToWebsiteAssociationManager = self->_appToWebsiteAssociationManager;
  if (!appToWebsiteAssociationManager)
  {
    v4 = [WBSAppIDsToDomainsAssociationManager alloc];
    v5 = [(WBSAutoFillQuirksManager *)self _appIDsToDomainsAssociationsFromCurrentSnapshot];
    v6 = [(WBSAppIDsToDomainsAssociationManager *)v4 initWithAppIDsToDomains:v5];
    v7 = self->_appToWebsiteAssociationManager;
    self->_appToWebsiteAssociationManager = v6;

    appToWebsiteAssociationManager = self->_appToWebsiteAssociationManager;
  }
  v8 = appToWebsiteAssociationManager;
  return v8;
}

- (WBSPair)knownWebBrowsersAndExtensionStorefronts
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = (id)MEMORY[0x1E4F1CBF0];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = (id)MEMORY[0x1E4F1CBF0];
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__WBSAutoFillQuirksManager_knownWebBrowsersAndExtensionStorefronts__block_invoke;
  v6[3] = &unk_1E615A740;
  v6[4] = &v13;
  v6[5] = &v7;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessBuiltInAndRemotelyLoadedSnapshots:v6];
  v3 = [WBSPair alloc];
  v4 = [(WBSPair *)v3 initWithFirst:v14[5] second:v8[5]];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __67__WBSAutoFillQuirksManager_knownWebBrowsersAndExtensionStorefronts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 knownWebBrowsers];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [v5 knownExtensionStorefronts],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    uint64_t v9 = [v5 knownWebBrowsers];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = v5;
  }
  else
  {
    uint64_t v13 = [v19 knownWebBrowsers];
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v12 = v19;
  }
  uint64_t v16 = [v12 knownExtensionStorefronts];
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

- (id)domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices
{
  domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
  if (!domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices)
  {
    v4 = [(WBSAutoFillQuirksManager *)self _domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot];
    id v5 = self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
    self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = v4;

    domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
  }
  uint64_t v6 = domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
  return v6;
}

- (void)didDownloadDataForRemotelyUpdatableDataController:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSAutoFillQuirksManager_didDownloadDataForRemotelyUpdatableDataController___block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__WBSAutoFillQuirksManager_didDownloadDataForRemotelyUpdatableDataController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _passwordRequirementsByDomainFromCurrentSnapshot];
  [*(id *)(*(void *)(a1 + 32) + 8) setPasswordRequirementsByDomain:v2];

  v3 = [*(id *)(a1 + 32) _domainsWithAssociatedCredentialsFromCurrentSnapshot];
  [*(id *)(*(void *)(a1 + 32) + 16) setDomainsWithAssociatedCredentials:v3];

  v4 = [*(id *)(a1 + 32) _domainsToConsiderIdenticalFromCurrentSnapshot];
  [*(id *)(*(void *)(a1 + 32) + 16) setDomainsToConsiderIdentical:v4];

  id v5 = [*(id *)(a1 + 32) _domainsIneligibleForPasswordAuditingFromCurrentSnapshot];
  [*(id *)(*(void *)(a1 + 32) + 32) setDomainsIneligibleForPasswordAuditing:v5];

  uint64_t v6 = [*(id *)(a1 + 32) _changePasswordURLStringsFromCurrentSnapshot];
  [*(id *)(*(void *)(a1 + 32) + 48) setChangePasswordURLStrings:v6];

  uint64_t v7 = [*(id *)(a1 + 32) _appIDsToDomainsAssociationsFromCurrentSnapshot];
  [*(id *)(*(void *)(a1 + 32) + 40) setAppIDsToDomains:v7];

  uint64_t v8 = [*(id *)(a1 + 32) _domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 56);
  *(void *)(v9 + 56) = v8;

  v11 = *(void **)(a1 + 32);
  return [v11 _sendDidDownloadNewDataNotification];
}

- (void)_sendDidDownloadNewDataNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"WBSAutoFillQuirksManagerDidDownloadNewQuirks" object:self];
}

- (id)_passwordRequirementsByDomainFromCurrentSnapshot
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__WBSAutoFillQuirksManager__passwordRequirementsByDomainFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E615A790;
  v5[4] = &v6;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessCurrentSnapshot:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __76__WBSAutoFillQuirksManager__passwordRequirementsByDomainFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 passwordRequirementsByDomain];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_domainsWithAssociatedCredentialsFromCurrentSnapshot
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__WBSAutoFillQuirksManager__domainsWithAssociatedCredentialsFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E615A790;
  v5[4] = &v6;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessCurrentSnapshot:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __80__WBSAutoFillQuirksManager__domainsWithAssociatedCredentialsFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 domainsWithAssociatedCredentials];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_domainsToConsiderIdenticalFromCurrentSnapshot
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__WBSAutoFillQuirksManager__domainsToConsiderIdenticalFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E615A790;
  v5[4] = &v6;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessCurrentSnapshot:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __74__WBSAutoFillQuirksManager__domainsToConsiderIdenticalFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 domainsToConsiderIdentical];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_domainsIneligibleForPasswordAuditingFromCurrentSnapshot
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__WBSAutoFillQuirksManager__domainsIneligibleForPasswordAuditingFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E615A790;
  v5[4] = &v6;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessCurrentSnapshot:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __84__WBSAutoFillQuirksManager__domainsIneligibleForPasswordAuditingFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [a2 domainsIneligibleForPasswordAuditing];
  uint64_t v4 = [v3 setWithArray:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_changePasswordURLStringsFromCurrentSnapshot
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__WBSAutoFillQuirksManager__changePasswordURLStringsFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E615A790;
  v5[4] = &v6;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessCurrentSnapshot:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __72__WBSAutoFillQuirksManager__changePasswordURLStringsFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 changePasswordURLsByDomain];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_appIDsToDomainsAssociationsFromCurrentSnapshot
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__WBSAutoFillQuirksManager__appIDsToDomainsAssociationsFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E615A7B8;
  v5[4] = &v6;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessBuiltInAndRemotelyLoadedSnapshots:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __75__WBSAutoFillQuirksManager__appIDsToDomainsAssociationsFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  uint64_t v5 = [a3 appIDsToDomainsAssociations];
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = [v7 appIDsToDomainsAssociations];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
  if (!v5) {
}
  }

- (id)_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__WBSAutoFillQuirksManager__domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E615A7B8;
  v5[4] = &v6;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessBuiltInAndRemotelyLoadedSnapshots:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __114__WBSAutoFillQuirksManager__domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  uint64_t v5 = [a3 domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices];
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = [v7 domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
  if (!v5) {
}
  }

- (BOOL)isAutomaticLoginDisallowedOnURL:(id)a3
{
  return [(WBSAutoFillQuirksManager *)self _isURL:a3 containedInQuirks:&__block_literal_global_16];
}

uint64_t __60__WBSAutoFillQuirksManager_isAutomaticLoginDisallowedOnURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 domainsIneligibleForAutomaticLogin];
}

- (BOOL)isStreamlinedLoginDisallowedOnURL:(id)a3
{
  return [(WBSAutoFillQuirksManager *)self _isURL:a3 containedInQuirks:&__block_literal_global_18];
}

uint64_t __62__WBSAutoFillQuirksManager_isStreamlinedLoginDisallowedOnURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 domainsIneligibleForStreamlinedLogin];
}

- (BOOL)arePasskeysDisallowedForRelyingParty:(id)a3
{
  uint64_t v4 = [(WBSAutoFillQuirksManager *)self _urlFromRelyingParty:a3];
  if (v4) {
    BOOL v5 = [(WBSAutoFillQuirksManager *)self _isURL:v4 containedInQuirks:&__block_literal_global_20];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __65__WBSAutoFillQuirksManager_arePasskeysDisallowedForRelyingParty___block_invoke(uint64_t a1, void *a2)
{
  return [a2 domainsIneligibleForPasskeys];
}

- (BOOL)shouldUseFallbackUIForRelyingParty:(id)a3
{
  uint64_t v4 = [(WBSAutoFillQuirksManager *)self _urlFromRelyingParty:a3];
  if (v4) {
    BOOL v5 = [(WBSAutoFillQuirksManager *)self _isURL:v4 containedInQuirks:&__block_literal_global_22];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __63__WBSAutoFillQuirksManager_shouldUseFallbackUIForRelyingParty___block_invoke(uint64_t a1, void *a2)
{
  return [a2 domainsForPasskeyFallbackUI];
}

- (BOOL)isDomainKnownToAskForCredentialsForOtherServicesWhenEmbeddedAsThirdParty:(id)a3
{
  uint64_t v4 = [(WBSAutoFillQuirksManager *)self _urlFromRelyingParty:a3];
  if (v4) {
    BOOL v5 = [(WBSAutoFillQuirksManager *)self _isURL:v4 containedInQuirks:&__block_literal_global_24];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __101__WBSAutoFillQuirksManager_isDomainKnownToAskForCredentialsForOtherServicesWhenEmbeddedAsThirdParty___block_invoke(uint64_t a1, void *a2)
{
  return [a2 domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices];
}

- (BOOL)isDomainKnownToDoSameDocumentNavigationInTextEditingCallback:(id)a3
{
  uint64_t v4 = [(WBSAutoFillQuirksManager *)self _urlFromRelyingParty:a3];
  if (v4) {
    BOOL v5 = [(WBSAutoFillQuirksManager *)self _isURL:v4 containedInQuirks:&__block_literal_global_26];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __89__WBSAutoFillQuirksManager_isDomainKnownToDoSameDocumentNavigationInTextEditingCallback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 domainsKnownToDoSameDocumentNavigationInTextEditingCallback];
}

- (BOOL)_isURL:(id)a3 containedInQuirks:(id)a4
{
  id v6 = a3;
  id v7 = [(WBSRemotelyUpdatableDataController *)self->_remotelyUpdatableDataController fetchDataFromRemotelyLoadedSnapshotFallingBackToBuiltInSnapshot:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__WBSAutoFillQuirksManager__isURL_containedInQuirks___block_invoke;
  v10[3] = &unk_1E615A800;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(v6) = objc_msgSend(v7, "safari_containsObjectPassingTest:", v10);

  return (char)v6;
}

uint64_t __53__WBSAutoFillQuirksManager__isURL_containedInQuirks___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_isSubdomainOfDomain:", a2);
}

- (id)_urlFromRelyingParty:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setHost:v4];

  [v5 setScheme:@"https"];
  id v6 = [v5 URL];

  return v6;
}

- (BOOL)shouldAttemptToDownloadConfiguration
{
  return self->_shouldAttemptToDownloadConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices, 0);
  objc_storeStrong((id *)&self->_changePasswordURLManager, 0);
  objc_storeStrong((id *)&self->_appToWebsiteAssociationManager, 0);
  objc_storeStrong((id *)&self->_passwordAuditingEligibleDomainsManager, 0);
  objc_storeStrong((id *)&self->_remotelyUpdatableDataController, 0);
  objc_storeStrong((id *)&self->_associatedDomainsManager, 0);
  objc_storeStrong((id *)&self->_passwordGenerationManager, 0);
}

@end