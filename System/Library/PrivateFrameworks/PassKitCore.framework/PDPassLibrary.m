@interface PDPassLibrary
- (BOOL)_entitledForObject:(id)a3 forActions:(unint64_t)a4;
- (BOOL)_entitledForPassType:(unint64_t)a3 uniqueIdentifier:(id)a4 actions:(unint64_t)a5;
- (BOOL)_entitledForUniqueID:(id)a3 forActions:(unint64_t)a4;
- (BOOL)_hasPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 paymentApplicationStates:(id)a5;
- (BOOL)_isConfigurationValid:(id)a3;
- (BOOL)_isWatchIssuerAppProvisioningSupported;
- (BOOL)_writePass:(id)a3 error:(id *)a4;
- (BOOL)_writePass:(id)a3 withSettings:(unint64_t)a4 error:(id *)a5;
- (BOOL)willSanitizePasses;
- (PDAccountManager)accountManager;
- (PDAppletSubcredentialManager)subcredentialManager;
- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager;
- (PDCarKeyRequirementsChecker)carKeyRequirementsChecker;
- (PDCardFileManager)cardFileManager;
- (PDDatabaseManager)databaseManager;
- (PDDefaultPassManager)defaultPassManager;
- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator;
- (PDExpressPassManager)expressPassManager;
- (PDExpressTransitUpgradeController)expressUpgradeController;
- (PDISO18013Manager)isoManager;
- (PDIssuerBindingManager)issuerBindingManager;
- (PDPassDynamicStateManager)dynamicStateManager;
- (PDPassLibrary)initWithConnection:(id)a3;
- (PDPassLibrary)initWithConnection:(id)a3 server:(id)a4;
- (PDPassLibraryDelegate)delegate;
- (PDPassLiveRenderManager)passLiveRenderManager;
- (PDPaymentWebServiceCoordinator)paymentWebServicesCoordinator;
- (PDProvisioningRequirementsChecker)provisioningRequirementsChecker;
- (PDPushProvisioningManager)pushProvisioningManager;
- (PDRelevantPassProvider)relevantPassProvider;
- (PDSpotlightIndexer)spotlightIndexer;
- (PDUserNotificationManager)userNotificationManager;
- (PDWebServicesCoordinator)webServicesCoordinator;
- (PKIDSManager)idsManager;
- (PKSecureElement)secureElement;
- (PKUsageNotificationServer)usageNotificationServer;
- (id)_entitlementFilteredPasses:(id)a3;
- (id)_filteredPasses:(id)a3 forApplicationIdentifier:(id)a4;
- (id)_filteredPasses:(id)a3 forWebDomain:(id)a4;
- (id)_inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 paymentApplicationStates:(id)a5 isMultiTokensRequest:(BOOL)a6;
- (id)_inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 paymentApplicationStates:(id)a5 isMultiTokensRequest:(BOOL)a6;
- (id)_sanitizePassIfNeeded:(id)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)_addPassesWithEnumerator:(id)a3;
- (void)_addPasses:(id)a3 withCompletion:(id)a4;
- (void)_getEncryptedServiceProviderDataForSecureElementPass:(id)a3 publicKey:(id)a4 scheme:(id)a5 completion:(id)a6;
- (void)_getPassWithUniqueID:(id)a3 handler:(id)a4;
- (void)_getServiceProviderDataForPass:(id)a3 completion:(id)a4;
- (void)_hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 handler:(id)a10;
- (void)_passesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 handler:(id)a10;
- (void)_paymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webPayment:(BOOL)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 withHandler:(id)a10;
- (void)_queue_replacePass:(id)a3 handler:(id)a4;
- (void)_sanitizePasses:(id)a3;
- (void)_setBackupDefaultPaymentPassState:(id)a3;
- (void)_setBackupPassbookDeletedState:(id)a3;
- (void)_usingSynchronousProxy:(BOOL)a3 addPassesWithEnumerator:(id)a4 estimatedNumberOfPasses:(unint64_t)a5 osTransaction:(id)a6 completionHandler:(id)a7;
- (void)activated;
- (void)addPassesWithData:(id)a3 handler:(id)a4;
- (void)backupMetadataWithHandler:(id)a3;
- (void)badgeCountItemsWithCompletion:(id)a3;
- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4;
- (void)canAddClassicApplePayCredentialWithConfiguration:(id)a3 completion:(id)a4;
- (void)canAddFelicaPassWithHandler:(id)a3;
- (void)canAddHomeKeyWithConfiguration:(id)a3 completion:(id)a4;
- (void)canAddPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)canAddPushablePassWithConfiguration:(id)a3 completion:(id)a4;
- (void)canPresentPaymentRequest:(id)a3 completion:(id)a4;
- (void)checkForTransitNotification;
- (void)clearConnectionReference;
- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3;
- (void)contactlessInterfaceDidPresentFromSource:(int64_t)a3;
- (void)countPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)dealloc;
- (void)defaultPaymentPassWithHandler:(id)a3;
- (void)deleteKeyMaterialForSubCredentialId:(id)a3;
- (void)enabledValueAddedServicePassesWithHandler:(id)a3;
- (void)expressTransitPassWithHandler:(id)a3;
- (void)fetchCurrentRelevantPassInfo:(id)a3;
- (void)fetchHasCandidatePasses:(id)a3;
- (void)forceImmediateRevocationCheck;
- (void)getArchivedObjectWithUniqueID:(id)a3 handler:(id)a4;
- (void)getContentForUniqueID:(id)a3 handler:(id)a4;
- (void)getDataForBundleResourceNamed:(id)a3 withExtension:(id)a4 objectUniqueIdentifier:(id)a5 handler:(id)a6;
- (void)getDataForBundleResources:(id)a3 objectUniqueIdentifier:(id)a4 handler:(id)a5;
- (void)getDiffForPassUpdateUserNotificationWithIdentifier:(id)a3 handler:(id)a4;
- (void)getGroupsControllerSnapshotWithOptions:(id)a3 handler:(id)a4;
- (void)getImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 handler:(id)a7;
- (void)getManifestHashAndSettingsForPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5;
- (void)getMetadataForFieldWithProperties:(id)a3 handler:(id)a4;
- (void)getPassUniqueIDsForAssociatedApplicationIdentifier:(id)a3 handler:(id)a4;
- (void)getPassWithPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5;
- (void)getPassWithUniqueID:(id)a3 handler:(id)a4;
- (void)getPassesAndCatalogOfPassTypes:(unint64_t)a3 limitResults:(BOOL)a4 withHandler:(id)a5;
- (void)getPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)getPassesWithHandler:(id)a3;
- (void)getPassesWithReaderIdentifier:(id)a3 handler:(id)a4;
- (void)getPassesWithSearchableTransactions:(id)a3;
- (void)getPassesWithUniqueIdentifiers:(id)a3 handler:(id)a4;
- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8;
- (void)hasInAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)hasInAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)hasPassesInExpiredSectionWithHandler:(id)a3;
- (void)hasPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentRequestType:(id)a7 isMultiTokensRequest:(BOOL)a8 completion:(id)a9;
- (void)hasRemoteLibraryWithHandler:(id)a3;
- (void)hasSecureElementPassesOfType:(int64_t)a3 handler:(id)a4;
- (void)iPadSupportsPasses:(id)a3;
- (void)inAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8;
- (void)inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)introduceDatabaseIntegrityProblem;
- (void)invalidateVehicleConnectionSessionIdentifier:(id)a3;
- (void)isPassbookVisibleWithHandler:(id)a3;
- (void)isPaymentPassActivationAvailableWithHandler:(id)a3;
- (void)isRemovingPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)isWatchIssuerAppProvisioningSupportedWithHandler:(id)a3;
- (void)issueWalletUserNotificationWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 customActionRoute:(id)a6;
- (void)issuerBindingFlowAuthenticationPerformed;
- (void)migrateDataWithHandler:(id)a3 didRestoreFromBackup:(BOOL)a4;
- (void)noteACAccountChanged:(id)a3 handler:(id)a4;
- (void)noteAppleAccountChanged:(id)a3 handler:(id)a4;
- (void)noteObjectSharedWithUniqueID:(id)a3;
- (void)notifyPassUsedWithIdentifier:(id)a3 fromSource:(int64_t)a4;
- (void)openPaymentUIWithCompletion:(id)a3;
- (void)openWalletUIWithRelevantPass:(id)a3;
- (void)passWithDPANIdentifier:(id)a3 handler:(id)a4;
- (void)passWithFPANIdentifier:(id)a3 handler:(id)a4;
- (void)passbookHasBeenDeletedWithHandler:(id)a3;
- (void)paymentPassWithAssociatedAccountIdentifier:(id)a3 completion:(id)a4;
- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4;
- (void)peerPaymentPassUniqueIDWithHandler:(id)a3;
- (void)pendingUserNotificationsWithIdentifier:(id)a3 completion:(id)a4;
- (void)personalizePassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8;
- (void)postUpgradedPassNotificationForMarket:(id)a3 passUniqueID:(id)a4;
- (void)prepareForBackupRestoreWithExistingPreferencesData:(id)a3 handler:(id)a4;
- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5;
- (void)presentContactlessInterfaceForDefaultPassFromSource:(int64_t)a3 handler:(id)a4;
- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 handler:(id)a5;
- (void)presentIssuerBindingFlowForIssuerData:(id)a3 signature:(id)a4 orientation:(id)a5;
- (void)presentPaymentSetupRequest:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4;
- (void)recomputeRelevantPassesWithSearchMode:(int64_t)a3;
- (void)recoverPassWithUniqueID:(id)a3 handler:(id)a4;
- (void)removeAllScheduledActivities;
- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4 handler:(id)a5;
- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4 handler:(id)a5;
- (void)removePassesWithUniqueIDs:(id)a3 diagnosticReason:(id)a4 handler:(id)a5;
- (void)replacePassWithPassData:(id)a3 handler:(id)a4;
- (void)rescheduleCommutePlanRenewalReminderForPassWithUniqueID:(id)a3;
- (void)resetApplePayWithDiagnosticReason:(id)a3 handler:(id)a4;
- (void)sendCatalogChanged:(id)a3;
- (void)sendDynamicStatesUpdated:(id)a3 catalog:(id)a4;
- (void)sendPassAdded:(id)a3 state:(id)a4 catalog:(id)a5;
- (void)sendPassRecovered:(id)a3 state:(id)a4 catalog:(id)a5;
- (void)sendPassRemoved:(id)a3 catalog:(id)a4;
- (void)sendPassUpdated:(id)a3 state:(id)a4 catalog:(id)a5;
- (void)sendRKEPassThroughMessage:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5;
- (void)sendUserEditedCatalog:(id)a3;
- (void)sessionDidChangeConnectionStatus:(int64_t)a3;
- (void)sessionDidReceiveData:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setAuxiliaryCapabilityManager:(id)a3;
- (void)setBackupMetadata:(id)a3 handler:(id)a4;
- (void)setCarKeyRequirementsChecker:(id)a3;
- (void)setCardFileManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDefaultPassManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceRegistrationServiceCoordinator:(id)a3;
- (void)setDynamicStateManager:(id)a3;
- (void)setExpressPassManager:(id)a3;
- (void)setExpressUpgradeController:(id)a3;
- (void)setIdsManager:(id)a3;
- (void)setIsoManager:(id)a3;
- (void)setIssuerBindingManager:(id)a3;
- (void)setPassLiveRenderManager:(id)a3;
- (void)setPaymentWebServicesCoordinator:(id)a3;
- (void)setProvisioningRequirementsChecker:(id)a3;
- (void)setPushProvisioningManager:(id)a3;
- (void)setRelevantPassProvider:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setSortingState:(int64_t)a3 forObjectWithUniqueID:(id)a4 withCompletion:(id)a5;
- (void)setSpotlightIndexer:(id)a3;
- (void)setSubcredentialManager:(id)a3;
- (void)setUsageNotificationServer:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)setWebServicesCoordinator:(id)a3;
- (void)shuffleGroups:(int)a3;
- (void)signData:(id)a3 forPassUniqueID:(id)a4 completion:(id)a5;
- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)sortedTransitPassesForAppletDataFormat:(id)a3 handler:(id)a4;
- (void)sortedTransitPassesForTransitNetworkIdentifiers:(id)a3;
- (void)spotlightReindexAllContentWithAcknowledgement:(id)a3;
- (void)spotlightReindexContentWithIdentifiers:(id)a3 acknowledgement:(id)a4;
- (void)spotlightResetWithCompletion:(id)a3;
- (void)spotlightStatusWithCompletion:(id)a3;
- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPassWithUniqueID:(id)a5 handler:(id)a6;
- (void)supportsSearchForPassUniqueID:(id)a3 completion:(id)a4;
- (void)unexpiredPassesOrderedByGroup:(id)a3;
- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4;
- (void)updateIngestedDate:(id)a3 forPassWithUniqueID:(id)a4;
- (void)updateObjectWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)updateSettings:(unint64_t)a3 forObjectWithUniqueID:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 addISO18013Blobs:(id)a4 cardType:(int64_t)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 addPassIngestionPayloads:(id)a4 withCompletionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 addPassesContainer:(id)a4 withCompletionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 addUnsignedPassesWithDataFileDescriptors:(id)a4 completionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 availableHomeKeyPassesWithCompletionHandler:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 canAddCarKeyPassWithConfiguration:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 checkFidoKeyPresenceForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 completion:(id)a7;
- (void)usingSynchronousProxy:(BOOL)a3 configureHomeAuxiliaryCapabilitiesForSerialNumber:(id)a4 homeIdentifier:(id)a5 fromUnifiedAccessDescriptor:(id)a6 andAliroDescriptor:(id)a7 completion:(id)a8;
- (void)usingSynchronousProxy:(BOOL)a3 configurePushProvisioningConfiguration:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 configurePushProvisioningConfigurationV2:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 containsPassWithPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 createFidoKeyForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 challenge:(id)a6 externalizedAuth:(id)a7 completion:(id)a8;
- (void)usingSynchronousProxy:(BOOL)a3 dynamicStateForPassUniqueID:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 enableExpressForPassWithPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 fetchAppletSubCredentialForPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 generateAuxiliaryCapabilitiesForRequirements:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 generateISOEncryptionCertificateForSubCredentialId:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 generateSEEncryptionCertificateForSubCredentialId:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 generateTransactionKeyWithReaderIdentifier:(id)a4 readerPublicKey:(id)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 getCachedImageSetContainerForUniqueID:(id)a4 type:(int64_t)a5 withDisplayProfile:(id)a6 displayTraits:(id)a7 handler:(id)a8;
- (void)usingSynchronousProxy:(BOOL)a3 getContentForUniqueID:(id)a4 withHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getEncryptedServiceProviderDataForUniqueID:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getGroupsControllerSnapshotWithOptions:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getImageSetContainerForUniqueID:(id)a4 type:(int64_t)a5 withDisplayProfile:(id)a6 suffix:(id)a7 handler:(id)a8;
- (void)usingSynchronousProxy:(BOOL)a3 getManifestHashForPassWithUniqueID:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getPassForProvisioningCredentialHash:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getPassesAndCatalogOfPassTypes:(unint64_t)a4 limitResults:(BOOL)a5 withHandler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 getPassesOfStyles:(unint64_t)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getPaymentPassesPendingActivationWithHandler:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 getServiceProviderDataForUniqueID:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 longTermPrivacyKeyForCredentialGroupIdentifier:(id)a4 reuseExisting:(BOOL)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 meetsProvisioningRequirements:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 passLocalizedStringForKey:(id)a4 uniqueID:(id)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 postUpgradesAvailableNotificationForMarket:(id)a4 passUniqueID:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 provisionHomeKeyPassForSerialNumbers:(id)a4 completionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 replaceUnsignedPassWithDataFileDescriptor:(id)a4 completionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 requestIssuerBoundPassesWithBindingWithData:(id)a4 automaticallyProvision:(BOOL)a5 withCompletion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 setLiveRenderingEnabled:(BOOL)a4 forPassUniqueID:(id)a5 handler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 signWithFidoKeyForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 challenge:(id)a7 publicKeyIdentifier:(id)a8 externalizedAuth:(id)a9 completion:(id)a10;
@end

@implementation PDPassLibrary

- (void)setSecureElement:(id)a3
{
  v5 = (PKSecureElement *)a3;
  p_secureElement = &self->_secureElement;
  if (self->_secureElement != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_secureElement, a3);
    v5 = v7;
  }
  _objc_release_x1(p_secureElement, v5);
}

- (void)setSubcredentialManager:(id)a3
{
  v5 = (PDAppletSubcredentialManager *)a3;
  subcredentialManager = self->_subcredentialManager;
  if (subcredentialManager != v5)
  {
    v7 = v5;
    [(PDAppletSubcredentialManager *)subcredentialManager unregisterObserver:self];
    objc_storeStrong((id *)&self->_subcredentialManager, a3);
    subcredentialManager = (PDAppletSubcredentialManager *)[(PDAppletSubcredentialManager *)self->_subcredentialManager registerObserver:self];
    v5 = v7;
  }
  _objc_release_x1(subcredentialManager, v5);
}

- (void)activated
{
  sub_1000072CC((uint64_t)self->_remoteInterfacePresenter, self);
  [(PDCardFileManager *)self->_cardFileManager startUbiquity];
  v3.receiver = self;
  v3.super_class = (Class)PDPassLibrary;
  [(PDPassLibrary *)&v3 activated];
}

- (void)setIssuerBindingManager:(id)a3
{
  v5 = (PDIssuerBindingManager *)a3;
  issuerBindingManager = self->_issuerBindingManager;
  if (issuerBindingManager != v5)
  {
    v7 = v5;
    [(PDIssuerBindingManager *)issuerBindingManager unregisterObserver:self];
    objc_storeStrong((id *)&self->_issuerBindingManager, a3);
    issuerBindingManager = (PDIssuerBindingManager *)[(PDIssuerBindingManager *)self->_issuerBindingManager registerObserver:self];
    v5 = v7;
  }
  _objc_release_x1(issuerBindingManager, v5);
}

- (void)usingSynchronousProxy:(BOOL)a3 getPaymentPassesPendingActivationWithHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      if (v4)
      {
        v8 = [(PDDatabaseManager *)self->_databaseManager paymentPassesPendingActivation];
        v9 = [(PDPassLibrary *)self _entitlementFilteredPasses:v8];
        v6[2](v6, v9);
      }
      else
      {
        v11 = PDDefaultQueue();
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10006D4A4;
        v12[3] = &unk_10072E598;
        v12[4] = self;
        v13 = v6;
        dispatch_async(v11, v12);
      }
    }
    else
    {
      v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[PDPassLibrary usingSynchronousProxy:getPaymentPassesPendingActivationWithHandler:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      v6[2](v6, 0);
    }
  }
}

- (void)getPassesOfType:(unint64_t)a3 handler:(id)a4
{
  v10 = (void (**)(id, void *))a4;
  if (v10)
  {
    v6 = (void *)PDOSTransactionCreate("PDPassLibrary");
    v8 = [(PDDatabaseManager *)self->_databaseManager passesOfType:a3];
    v9 = [(PDPassLibrary *)self _entitlementFilteredPasses:v8];
    v10[2](v10, v9);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getGroupsControllerSnapshotWithOptions:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000D08C;
      v16[3] = &unk_10072E9D8;
      v16[4] = self;
      id v17 = v8;
      id v18 = v9;
      v10 = objc_retainBlock(v16);
      v11 = v10;
      if (v6)
      {
        ((void (*)(void *))v10[2])(v10);
      }
      else
      {
        v13 = PDDefaultQueue();
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10006D494;
        v14[3] = &unk_10072F788;
        id v15 = v11;
        dispatch_async(v13, v14);
      }
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[PDPassLibrary usingSynchronousProxy:getGroupsControllerSnapshotWithOptions:handler:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (PDPassLibrary)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PDPassLibrary;
  id v8 = [(PDPassLibrary *)&v19 initWithConnection:v6];
  if (v8)
  {
    id v9 = (PKEntitlementWhitelist *)[objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v6];
    whitelist = v8->_whitelist;
    v8->_whitelist = v9;

    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_server, a4);
    v11 = sub_100011FE8((uint64_t)v7);
    uint64_t v12 = sub_100011FD0((uint64_t)v11);
    remoteInterfacePresenter = v8->_remoteInterfacePresenter;
    v8->_remoteInterfacePresenter = (PDRemoteInterfacePresenter *)v12;

    uint64_t v14 = sub_1000215A0((uint64_t)v11);
    assertionManager = v8->_assertionManager;
    v8->_assertionManager = (PDAssertionManager *)v14;

    v16 = PKPassLibraryInterface();
    [v6 setRemoteObjectInterface:v16];

    id v17 = PDPassLibraryExtendedInterface();
    [v6 setExportedInterface:v17];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (id)_entitlementFilteredPasses:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    [(PDPassLibrary *)self _sanitizePasses:v4];
    id v5 = v4;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000817AC;
    v8[3] = &unk_1007322F8;
    v8[4] = self;
    id v5 = [v4 objectsPassingTest:v8];
  }
  id v6 = v5;

  return v6;
}

- (void)_sanitizePasses:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(PDPassLibrary *)self _sanitizePassIfNeeded:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)_sanitizePassIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(PDPassLibrary *)self willSanitizePasses])
  {
    id v5 = [v4 paymentPass];
    [v5 sanitizePaymentApplications];
  }
  return v4;
}

- (BOOL)willSanitizePasses
{
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess]) {
    return 0;
  }
  else {
    return [(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] ^ 1;
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getContentForUniqueID:(id)a4 withHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if ([(PDPassLibrary *)self _entitledForUniqueID:v8 forActions:2])
    {
      if (v6)
      {
        long long v10 = (void *)PDOSTransactionCreate("PDPassLibrary");
        long long v12 = [(PDCardFileManager *)self->_cardFileManager contentForUniqueID:v8];
        v9[2](v9, v12);

        goto LABEL_8;
      }
      cardFileManager = self->_cardFileManager;
      if (cardFileManager)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100075740;
        v14[3] = &unk_100731A88;
        id v15 = v9;
        [(PDCardFileManager *)cardFileManager fetchContentForUniqueID:v8 withCompletion:v14];

        goto LABEL_8;
      }
    }
    v9[2](v9, 0);
  }
LABEL_8:
}

- (void)usingSynchronousProxy:(BOOL)a3 getImageSetContainerForUniqueID:(id)a4 type:(int64_t)a5 withDisplayProfile:(id)a6 suffix:(id)a7 handler:(id)a8
{
  BOOL v12 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void (**)(id, void *))a8;
  if (v17)
  {
    if ([(PDPassLibrary *)self _entitledForUniqueID:v14 forActions:2])
    {
      if (v12)
      {
        id v18 = (void *)PDOSTransactionCreate("PDPassLibrary");
        v20 = [(PDCardFileManager *)self->_cardFileManager imageSetContainerForUniqueID:v14 ofType:a5 withDisplayProfile:v15 suffix:v16];
        v17[2](v17, v20);

        goto LABEL_8;
      }
      cardFileManager = self->_cardFileManager;
      if (cardFileManager)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100075A90;
        v22[3] = &unk_100731AB0;
        v23 = v17;
        [(PDCardFileManager *)cardFileManager fetchImageSetContainerForUniqueID:v14 ofType:a5 withDisplayProfile:v15 suffix:v16 completion:v22];

        goto LABEL_8;
      }
    }
    v17[2](v17, 0);
  }
LABEL_8:
}

- (BOOL)_entitledForUniqueID:(id)a3 forActions:(unint64_t)a4
{
  return [(PDPassLibrary *)self _entitledForPassType:-1 uniqueIdentifier:a3 actions:a4];
}

- (BOOL)_entitledForPassType:(unint64_t)a3 uniqueIdentifier:(id)a4 actions:(unint64_t)a5
{
  id v8 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    databaseManager = self->_databaseManager;
    id v19 = 0;
    id v20 = 0;
    id v17 = 0;
    id v18 = 0;
    unsigned int v11 = [(PDDatabaseManager *)databaseManager getPassTypeID:&v20 teamID:&v19 associatedPassTypeIdentifiers:&v18 associatedApplicationIdentifiers:&v17 forUniqueID:v8];
    id v12 = v20;
    id v13 = v19;
    id v14 = v18;
    id v15 = v17;
    if (v11 && (a3 == -1 || PKPassTypeForPassTypeIdentifier() == a3)) {
      unsigned __int8 v9 = [(PKEntitlementWhitelist *)self->_whitelist entitledToPerformPassAction:a5 passTypeID:v12 teamID:v13 associatedPassTypeIdentifiers:v14 associatedApplicationIdentifiers:v15];
    }
    else {
      unsigned __int8 v9 = 0;
    }
  }
  return v9;
}

- (void)setWebServicesCoordinator:(id)a3
{
}

- (void)setUserNotificationManager:(id)a3
{
}

- (void)setUsageNotificationServer:(id)a3
{
}

- (void)setSpotlightIndexer:(id)a3
{
}

- (void)setRelevantPassProvider:(id)a3
{
}

- (void)setPushProvisioningManager:(id)a3
{
}

- (void)setProvisioningRequirementsChecker:(id)a3
{
}

- (void)setPaymentWebServicesCoordinator:(id)a3
{
}

- (void)setPassLiveRenderManager:(id)a3
{
}

- (void)setIsoManager:(id)a3
{
}

- (void)setIdsManager:(id)a3
{
}

- (void)setExpressUpgradeController:(id)a3
{
}

- (void)setExpressPassManager:(id)a3
{
}

- (void)setDynamicStateManager:(id)a3
{
}

- (void)setDeviceRegistrationServiceCoordinator:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setDefaultPassManager:(id)a3
{
}

- (void)setDatabaseManager:(id)a3
{
}

- (void)setCardFileManager:(id)a3
{
}

- (void)setCarKeyRequirementsChecker:(id)a3
{
}

- (void)setAuxiliaryCapabilityManager:(id)a3
{
}

- (void)setAccountManager:(id)a3
{
}

- (PDPassLibrary)initWithConnection:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PDPassLibrary;
  [(PDPassLibrary *)&v2 dealloc];
}

- (void)clearConnectionReference
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_userNotifications) {
    id v4 = [objc_alloc((Class)NSArray) initWithArray:self->_userNotifications];
  }
  else {
    id v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        CFUserNotificationCancel((CFUserNotificationRef)[*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) pointerValue]);
        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)PDPassLibrary;
  [(PDPassLibrary *)&v10 clearConnectionReference];
}

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)PDPassLibrary;
  objc_super v2 = [(PDPassLibrary *)&v4 remoteObjectProxy];
  return v2;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassLibrary;
  objc_super v3 = [(PDPassLibrary *)&v5 remoteObjectProxyWithErrorHandler:a3];
  return v3;
}

- (void)sendPassAdded:(id)a3 state:(id)a4 catalog:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = [(PDPassLibrary *)self _sanitizePassIfNeeded:a3];
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v10, 0);
    if (v8)
    {
      long long v12 = [v10 uniqueID];
      id v16 = v12;
      id v17 = v8;
      long long v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    }
    else
    {
      long long v13 = &__NSDictionary0__struct;
    }
    long long v14 = [(PDPassLibrary *)self remoteObjectProxy];
    [v14 catalogChanged:v9 withNewPasses:v11 states:v13];
  }
  if ([(PDPassLibrary *)self _entitledForObject:v10 forActions:2])
  {
    id v15 = [(PDPassLibrary *)self remoteObjectProxy];
    [v15 passAdded:v10];
  }
}

- (void)sendPassUpdated:(id)a3 state:(id)a4 catalog:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = [(PDPassLibrary *)self _sanitizePassIfNeeded:a3];
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v10, 0);
    if (v8)
    {
      long long v12 = [v10 uniqueID];
      id v16 = v12;
      id v17 = v8;
      long long v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    }
    else
    {
      long long v13 = &__NSDictionary0__struct;
    }
    long long v14 = [(PDPassLibrary *)self remoteObjectProxy];
    [v14 catalogChanged:v9 withNewPasses:v11 states:v13];
  }
  if ([(PDPassLibrary *)self _entitledForObject:v10 forActions:2])
  {
    id v15 = [(PDPassLibrary *)self remoteObjectProxy];
    [v15 passUpdated:v10];
  }
}

- (void)sendDynamicStatesUpdated:(id)a3 catalog:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v7 = [(PDPassLibrary *)self remoteObjectProxy];
    [v7 catalogChanged:v6 withNewPasses:0 states:v8];
  }
}

- (void)sendPassRemoved:(id)a3 catalog:(id)a4
{
  id v6 = a4;
  id v9 = [(PDPassLibrary *)self _sanitizePassIfNeeded:a3];
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v7 = [(PDPassLibrary *)self remoteObjectProxy];
    [v7 catalogChanged:v6 withNewPasses:0 states:0];
  }
  if ([(PDPassLibrary *)self _entitledForObject:v9 forActions:2])
  {
    id v8 = [(PDPassLibrary *)self remoteObjectProxy];
    [v8 passRemoved:v9];
  }
}

- (void)sendPassRecovered:(id)a3 state:(id)a4 catalog:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = [(PDPassLibrary *)self _sanitizePassIfNeeded:a3];
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v10, 0);
    if (v8)
    {
      long long v12 = [v10 uniqueID];
      id v16 = v12;
      id v17 = v8;
      long long v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    }
    else
    {
      long long v13 = &__NSDictionary0__struct;
    }
    long long v14 = [(PDPassLibrary *)self remoteObjectProxy];
    [v14 catalogChanged:v9 withNewPasses:v11 states:v13];
  }
  if ([(PDPassLibrary *)self _entitledForObject:v10 forActions:2])
  {
    id v15 = [(PDPassLibrary *)self remoteObjectProxy];
    [v15 passRecovered:v10];
  }
}

- (void)sendCatalogChanged:(id)a3
{
  id v5 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    objc_super v4 = [(PDPassLibrary *)self remoteObjectProxy];
    [v4 catalogChanged:v5 withNewPasses:0 states:0];
  }
}

- (void)getPassesWithHandler:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  if (v8)
  {
    objc_super v4 = (void *)PDOSTransactionCreate("PDPassLibrary");
    id v6 = [(PDDatabaseManager *)self->_databaseManager passes];
    id v7 = [(PDPassLibrary *)self _entitlementFilteredPasses:v6];
    v8[2](v8, v7);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getPassesOfStyles:(unint64_t)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = (void (**)(id, void *))a5;
  if (v8)
  {
    if (v6)
    {
      id v9 = (void *)PDOSTransactionCreate("PDPassLibrary");
      id v11 = [(PDDatabaseManager *)self->_databaseManager passesOfStyles:a4];
      long long v12 = [(PDPassLibrary *)self _entitlementFilteredPasses:v11];
      v8[2](v8, v12);
    }
    else
    {
      long long v13 = PDDefaultQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006ACC4;
      block[3] = &unk_10072FFE8;
      block[4] = self;
      unint64_t v16 = a4;
      id v15 = v8;
      dispatch_async(v13, block);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getPassForProvisioningCredentialHash:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if (v6)
    {
      objc_super v10 = (void *)PDOSTransactionCreate("PDPassLibrary");
      long long v12 = [(PDDatabaseManager *)self->_databaseManager passWithProvisioningCredentialHash:v8];
      long long v13 = [(PDPassLibrary *)self _sanitizePassIfNeeded:v12];
      v9[2](v9, v13);
    }
    else
    {
      long long v14 = PDDefaultQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006AED0;
      block[3] = &unk_10072E9D8;
      block[4] = self;
      id v16 = v8;
      id v17 = v9;
      dispatch_async(v14, block);
    }
  }
}

- (void)canAddFelicaPassWithHandler:(id)a3
{
  objc_super v3 = (void (**)(id, void))a3;
  if (v3)
  {
    id v5 = v3;
    if (PKFelicaSecureElementIsAvailable()) {
      uint64_t v4 = PKIsPad() ^ 1;
    }
    else {
      uint64_t v4 = 0;
    }
    v5[2](v5, v4);
    objc_super v3 = v5;
  }
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPassWithUniqueID:(id)a5 handler:(id)a6
{
  databaseManager = self->_databaseManager;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v16 = [(PDDatabaseManager *)databaseManager passWithUniqueIdentifier:a5];
  paymentWebServicesCoordinator = self->_paymentWebServicesCoordinator;
  id v15 = [v16 paymentPass];
  [(PDPaymentWebServiceCoordinator *)paymentWebServicesCoordinator submitVerificationCode:v13 verificationData:v12 forPass:v15 handler:v11];
}

- (void)openWalletUIWithRelevantPass:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess];
  char v7 = v6;
  if (!v5 || !v6)
  {
    id v8 = PKLogFacilityTypeGetObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v9) {
        goto LABEL_14;
      }
      objc_super v10 = NSStringFromSelector(a2);
      int v14 = 138412290;
      id v15 = v10;
      id v11 = "%@: Relevant unique ID not passed in";
    }
    else
    {
      if (!v9) {
        goto LABEL_14;
      }
      objc_super v10 = NSStringFromSelector(a2);
      int v14 = 138412290;
      id v15 = v10;
      id v11 = "%@: Not entitled to perform";
    }
    id v12 = v8;
    uint32_t v13 = 12;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);

    goto LABEL_14;
  }
  if (![(PDDatabaseManager *)self->_databaseManager passExistsWithUniqueID:v5])
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = NSStringFromSelector(a2);
      int v14 = 138412546;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v5;
      id v11 = "%@: Relevant unique ID does not exist: %@";
      id v12 = v8;
      uint32_t v13 = 22;
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  PDOpenWalletUI();
LABEL_15:
}

- (void)badgeCountItemsWithCompletion:(id)a3
{
  whitelist = self->_whitelist;
  unsigned int v6 = (void (**)(void))a3;
  if ([(PKEntitlementWhitelist *)whitelist badgeCountItemsAccess])
  {
    id v9 = [(PDUserNotificationManager *)self->_userNotificationManager badgeCountItems];
    v6[2](v6);
  }
  else
  {
    char v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Not entitled to perform", buf, 0xCu);
    }
    ((void (*)(void (**)(void), void *))v6[2])(v6, &__NSArray0__struct);
  }
}

- (void)openPaymentUIWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if ((PKStoreDemoModeEnabled() & 1) != 0 || !PKSecureElementIsAvailable())
  {
    if (PKIsHandoffClient()
      && [(PKIDSManager *)self->_idsManager hasRemoteDevices])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      char v7 = [(PKIDSManager *)self->_idsManager remoteDevices];
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          id v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [(PKIDSManager *)self->_idsManager sendSetupRequest:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11) appDisplayName:0 completion:0];
            id v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
        }
        while (v9);
      }

      if (v4) {
        v4[2](v4, 1);
      }
    }
    else if (v4)
    {
      v4[2](v4, 0);
    }
  }
  else
  {
    id v5 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServicesCoordinator sharedWebService];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006B614;
    v17[3] = &unk_100731538;
    unsigned int v6 = v4;
    v17[4] = self;
    id v18 = v6;
    +[PKPaymentRegistrationUtilities configureWebServiceIfNecessary:v5 completion:v17];

    if (v6) {
      v6[2](v6, 1);
    }
  }
}

- (BOOL)_isConfigurationValid:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist featuresAllAccess]
    && ((PKIsMac() & 1) != 0
     || (PKIsPhone() & 1) != 0
     || (PKIsPad() & 1) != 0
     || (PKIsWatch() & 1) != 0
     || PKIsVision()))
  {
    id v5 = [v4 signedFields];
    if (v5 || ([v4 signature], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      uint64_t v10 = [v4 originatingURL];

      if (!v10)
      {
        BOOL v7 = 1;
        goto LABEL_14;
      }
    }
    unsigned int v6 = PKValidatePaymentSetupConfiguration();
    BOOL v7 = v6 == 0;
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupConfiguration cannot be processed", v11, 2u);
    }

    BOOL v7 = 0;
  }
LABEL_14:

  return v7;
}

- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDPassLibrary requesting payment setup features", buf, 2u);
  }

  if (!v7) {
    goto LABEL_49;
  }
  if (![(PDPassLibrary *)self _isConfigurationValid:v6]
    || +[PKWalletVisibility isWalletRestricted])
  {
LABEL_48:
    v7[2](v7, 0);
    goto LABEL_49;
  }
  if (PKSecureElementIsAvailable())
  {
    id v9 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServicesCoordinator paymentSetupFeaturesCoordinator];
    unsigned int v10 = [v6 usePaymentSetupFeaturesFromCDN];
    id v11 = [(PKEntitlementWhitelist *)self->_whitelist applicationID];
    if (v10) {
      [v9 staticPaymentSetupFeaturesForSourceApplicationID:v11 blockServerFetch:0 completion:v7];
    }
    else {
      [v9 paymentSetupFeaturesForSourceApplicationID:v11 completion:v7];
    }

    goto LABEL_49;
  }
  if (!PKIsHandoffClient()
    || ![(PKIDSManager *)self->_idsManager hasRemoteDevices])
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not able to return payment setup features", buf, 2u);
    }

    goto LABEL_48;
  }
  os_log_t oslog = v8;
  v31 = v7;
  id v32 = v6;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [(PKIDSManager *)self->_idsManager remoteDevices];
  id v35 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v41;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v15 = objc_msgSend(v14, "supportedSetupFeatures", oslog);
        id v16 = [v15 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v37;
          do
          {
            id v19 = 0;
            do
            {
              if (*(void *)v37 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v19);
              v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v20 type]);
              id v22 = [v12 objectForKey:v21];
              if (!v22)
              {
                id v22 = v20;
                [v12 setObject:v22 forKey:v21];
              }
              unint64_t v23 = (unint64_t)[v20 state];
              id v24 = [v22 state];
              if (v24 == (id)2)
              {
                if (v23 == 3) {
                  goto LABEL_29;
                }
              }
              else
              {
                if (v24 == (id)1)
                {
                  if ((v23 & 0xFFFFFFFFFFFFFFFELL) != 2) {
                    goto LABEL_30;
                  }
LABEL_29:
                  [v22 setState:v23];
                  goto LABEL_30;
                }
                if (!v24 && v23 - 1 < 3) {
                  goto LABEL_29;
                }
              }
LABEL_30:

              id v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v25 = [v15 countByEnumeratingWithState:&v36 objects:v46 count:16];
            id v17 = v25;
          }
          while (v25);
        }
      }
      id v35 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v35);
  }

  v26 = [v12 objectForKey:&off_10078A9F8];
  v27 = v26;
  if (v26 && [v26 state] == (id)1) {
    [v27 setState:0];
  }
  v28 = objc_msgSend(v12, "allValues", oslog);
  BOOL v7 = v31;
  id v6 = v32;
  if (os_log_type_enabled(osloga, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v28;
    _os_log_impl((void *)&_mh_execute_header, osloga, OS_LOG_TYPE_DEFAULT, "Returning payment setup features from remote devices :%@", buf, 0xCu);
  }

  ((void (**)(id, void *))v31)[2](v31, v28);
LABEL_49:
}

- (void)presentPaymentSetupRequest:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 configuration];
  if ([(PDPassLibrary *)self _isConfigurationValid:v11])
  {
    id v12 = [v8 paymentSetupFeatures];
    id v13 = [v12 count];

    if (v13)
    {
      if (PKIsMac())
      {
        [(PDPassLibrary *)self openPaymentUIWithCompletion:v10];
      }
      else if (PKPassbookIsCurrentlyDeletedByUser())
      {
        long long v15 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Prompting user to install Wallet", buf, 2u);
        }

        id v16 = v10;
        PKShowAlertForWalletUninstalled();
      }
      else
      {
        sub_10020CF7C((uint64_t)self->_remoteInterfacePresenter, v8, 0, v9, v10);
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  long long v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not able to present payment setup features", buf, 2u);
  }

  (*((void (**)(id, void))v10 + 2))(v10, 0);
LABEL_9:
}

- (void)paymentPassWithAssociatedAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006C078;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7A4;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)presentContactlessInterfaceForDefaultPassFromSource:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  PDDefaultPaymentPassUniqueIdentifier();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(PDPassLibrary *)self presentContactlessInterfaceForPassWithUniqueIdentifier:v7 fromSource:a3 handler:v6];
}

- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
    goto LABEL_6;
  }
  unsigned int v10 = [(PKEntitlementWhitelist *)self->_whitelist paymentPresentation];
  if (v8 && a4 == 4 && !v10)
  {
    if ([(PDPassLibrary *)self _entitledForPassType:1 uniqueIdentifier:v8 actions:2])
    {
LABEL_6:
      remoteInterfacePresenter = self->_remoteInterfacePresenter;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10006C428;
      v13[3] = &unk_1007304D8;
      id v14 = v9;
      sub_100205C84((uint64_t)remoteInterfacePresenter, v8, a4, v13);

      goto LABEL_7;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[PDPassLibrary presentContactlessInterfaceForPassWithUniqueIdentifier:fromSource:handler:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
  }

  if (v9) {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
LABEL_7:
}

- (void)canPresentPaymentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006C578;
    v10[3] = &unk_1007315D8;
    v10[4] = self;
    id v12 = v7;
    id v11 = v6;
    id v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v14 = v9;
    dispatch_async(v8, block);
  }
}

- (void)isPaymentPassActivationAvailableWithHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    BOOL v4 = PKSecureElementIsAvailable() != 0;
    (*((void (**)(id, BOOL))a3 + 2))(v5, v4);
  }
}

- (void)getPassesAndCatalogOfPassTypes:(unint64_t)a3 limitResults:(BOOL)a4 withHandler:(id)a5
{
}

- (void)usingSynchronousProxy:(BOOL)a3 getPassesAndCatalogOfPassTypes:(unint64_t)a4 limitResults:(BOOL)a5 withHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  if (v10)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10006D3C4;
      v17[3] = &unk_100731600;
      v17[4] = self;
      unint64_t v19 = a4;
      BOOL v20 = a5;
      id v18 = v10;
      id v11 = objc_retainBlock(v17);
      id v12 = v11;
      if (v8)
      {
        ((void (*)(void *))v11[2])(v11);
      }
      else
      {
        id v14 = PDDefaultQueue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10006D474;
        block[3] = &unk_10072F788;
        id v16 = v12;
        dispatch_async(v14, block);
      }
    }
    else
    {
      id v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[PDPassLibrary usingSynchronousProxy:getPassesAndCatalogOfPassTypes:limitResults:withHandler:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)getGroupsControllerSnapshotWithOptions:(id)a3 handler:(id)a4
{
}

- (void)sendUserEditedCatalog:(id)a3
{
  id v4 = a3;
  id v5 = (void *)PDOSTransactionCreate("PDPassLibrary");
  id v6 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D5FC;
  block[3] = &unk_10072E238;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)notifyPassUsedWithIdentifier:(id)a3 fromSource:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006D6D0;
  v4[3] = &unk_100731628;
  v4[4] = self;
  v4[5] = a4;
  [(PDPassLibrary *)self _getPassWithUniqueID:a3 handler:v4];
}

- (void)getPassWithUniqueID:(id)a3 handler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    id v11 = v6;
    id v7 = a3;
    id v8 = (void *)PDOSTransactionCreate("PDPassLibrary");
    id v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v7];

    if ([(PDPassLibrary *)self _entitledForObject:v9 forActions:2])
    {
      id v10 = [(PDPassLibrary *)self _sanitizePassIfNeeded:v9];
      v11[2](v11, v10);
    }
    else
    {
      v11[2](v11, 0);
    }

    id v6 = v11;
  }
}

- (void)getPassesWithReaderIdentifier:(id)a3 handler:(id)a4
{
  if (a4)
  {
    id v6 = (void (**)(id, void *))a4;
    id v7 = a3;
    id v8 = (void *)PDOSTransactionCreate("PDPassLibrary");
    id v9 = [(PDDatabaseManager *)self->_databaseManager passesWithPairedReaderIdentifier:v7];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006D8E0;
    v11[3] = &unk_100731650;
    v11[4] = self;
    id v10 = objc_msgSend(v9, "pk_setBySafelyApplyingBlock:", v11);

    v6[2](v6, v10);
  }
}

- (void)hasRemoteLibraryWithHandler:(id)a3
{
  objc_super v3 = (void (**)(id, void))a3;
  if (v3)
  {
    id v6 = v3;
    id v4 = PKPairedOrPairingDevice();
    if (v4) {
      uint64_t v5 = PKNRDeviceHasAltAccount() ^ 1;
    }
    else {
      uint64_t v5 = 0;
    }
    v6[2](v6, v5);

    objc_super v3 = v6;
  }
}

- (void)inAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v17)
  {
    id v18 = dispatch_get_global_queue(21, 0);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10006DB7C;
    v20[3] = &unk_1007316A0;
    v20[4] = self;
    id v21 = v14;
    unint64_t v25 = a4;
    id v22 = v15;
    id v23 = v16;
    BOOL v26 = a7;
    id v24 = v17;
    unint64_t v19 = v20;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v28 = v19;
    dispatch_async(v18, block);
  }
}

- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v17)
  {
    id v18 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006DDE0;
    block[3] = &unk_1007316A0;
    void block[4] = self;
    id v20 = v14;
    unint64_t v24 = a4;
    id v21 = v15;
    id v22 = v16;
    BOOL v25 = a7;
    id v23 = v17;
    dispatch_async(v18, block);
  }
}

- (void)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentRequestType:(id)a7 isMultiTokensRequest:(BOOL)a8 completion:(id)a9
{
  if (a9)
  {
    LOBYTE(v9) = a8;
    [(PDPassLibrary *)self _hasPassesWithSupportedNetworks:a3 merchantCapabilities:a4 webDomain:a5 issuerCountryCodes:a6 paymentApplicationStates:0 paymentRequestType:a7 isMultiTokensRequest:v9 handler:a9];
  }
}

- (void)_hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 handler:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  accountManager = self->_accountManager;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10006E1A0;
  v29[3] = &unk_1007316F0;
  id v30 = v17;
  id v31 = v18;
  id v32 = self;
  id v33 = v16;
  id v36 = v21;
  unint64_t v37 = a4;
  id v34 = v19;
  id v35 = v20;
  BOOL v38 = a9;
  id v23 = v20;
  id v24 = v19;
  id v25 = v16;
  id v26 = v21;
  id v27 = v18;
  id v28 = v17;
  [(PDAccountManager *)accountManager accountsWithCompletion:v29];
}

- (BOOL)_hasPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 paymentApplicationStates:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist inAppPayments]) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = [(PKEntitlementWhitelist *)self->_whitelist supportsWebPayments];
  }
  if ([(PKEntitlementWhitelist *)self->_whitelist inAppPaymentsPrivate])
  {
    databaseManager = self->_databaseManager;
  }
  else
  {
    unsigned int v14 = [(PKEntitlementWhitelist *)self->_whitelist passesAllAccess];
    if ((v10 | v14) != 1)
    {
      unsigned __int8 v13 = 0;
      goto LABEL_12;
    }
    unsigned int v15 = v14;
    databaseManager = self->_databaseManager;
    if (!v15)
    {
      id v12 = 0;
      goto LABEL_7;
    }
  }
  id v12 = v9;
LABEL_7:
  unsigned __int8 v13 = [(PDDatabaseManager *)databaseManager passExistsForNonWebInAppPaymentOnNetworks:v8 withCapabilities:a4 paymentApplicationStates:v12];
LABEL_12:

  return v13;
}

- (void)_passesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 handler:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10006E570;
  v25[3] = &unk_100731718;
  BOOL v17 = v16 != 0;
  id v26 = v15;
  id v27 = v16;
  id v28 = self;
  id v29 = a6;
  BOOL v32 = a9;
  id v30 = a7;
  id v31 = a10;
  id v18 = v31;
  id v19 = v30;
  id v20 = v29;
  id v21 = v16;
  id v22 = v15;
  LOBYTE(v23) = a9;
  [(PDPassLibrary *)self _paymentPassesForNetworks:v22 capabilities:a4 issuerCountryCodes:v20 webPayment:v17 paymentApplicationStates:v19 paymentRequestType:a8 isMultiTokensRequest:v23 withHandler:v25];
}

- (void)_paymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webPayment:(BOOL)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 withHandler:(id)a10
{
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v34 = a8;
  id v19 = a10;
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3032000000;
  long long v41 = sub_1000207AC;
  long long v42 = sub_100020EC8;
  id v43 = 0;
  if ([(PKEntitlementWhitelist *)self->_whitelist inAppPayments]) {
    unsigned int v20 = 1;
  }
  else {
    unsigned int v20 = [(PKEntitlementWhitelist *)self->_whitelist supportsWebPayments];
  }
  if ([(PKEntitlementWhitelist *)self->_whitelist inAppPaymentsPrivate])
  {
    unsigned int v21 = 1;
  }
  else
  {
    unsigned int v21 = [(PKEntitlementWhitelist *)self->_whitelist passesAllAccess];
    if ((v20 | v21) != 1) {
      goto LABEL_23;
    }
  }
  databaseManager = self->_databaseManager;
  paymentWebServicesCoordinator = self->_paymentWebServicesCoordinator;
  if (v12)
  {
    id v24 = [(PDPaymentWebServiceCoordinator *)paymentWebServicesCoordinator sharedWebService];
    if (v21) {
      id v25 = v17;
    }
    else {
      id v25 = 0;
    }
    if (v21) {
      id v26 = v18;
    }
    else {
      id v26 = 0;
    }
    uint64_t v27 = [(PDDatabaseManager *)databaseManager passesForWebPaymentOnNetworks:v16 withCapabilities:a4 webService:v24 issuerCountryCodes:v25 paymentApplicationStates:v26 isMultiTokensRequest:a9];
  }
  else
  {
    uint64_t v28 = [(PDPaymentWebServiceCoordinator *)paymentWebServicesCoordinator sharedWebService];
    id v24 = (void *)v28;
    if (v21) {
      id v29 = v18;
    }
    else {
      id v29 = 0;
    }
    if (v21) {
      id v30 = v17;
    }
    else {
      id v30 = 0;
    }
    uint64_t v27 = [(PDDatabaseManager *)databaseManager passesForNonWebInAppPaymentOnNetworks:v16 withCapabilities:a4 issuerCountryCodes:v30 paymentApplicationStates:v29 paymentRequestType:v34 isMultiTokensRequest:a9 webService:v28];
  }
  id v31 = (void *)v39[5];
  v39[5] = v27;

LABEL_23:
  accountManager = self->_accountManager;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10006E8A8;
  v35[3] = &unk_100731768;
  unint64_t v37 = &v38;
  id v33 = v19;
  id v36 = v33;
  [(PDAccountManager *)accountManager accountsWithCompletion:v35];

  _Block_object_dispose(&v38, 8);
}

- (id)_inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 paymentApplicationStates:(id)a5 isMultiTokensRequest:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    id v11 = [(PDPassLibrary *)self remoteProcessApplicationIdentifier];
    if (!v11)
    {
      unsigned int v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = NSStringFromSelector(a2);
        int v27 = 138412546;
        uint64_t v28 = v15;
        __int16 v29 = 1024;
        unsigned int v30 = [(PDPassLibrary *)self remoteProcessIdentifier];
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Warning: %@ failed to determine remote application identifier for remote process with pid: %i", (uint8_t *)&v27, 0x12u);
      }
      id v11 = 0;
    }
  }
  if ([(PKEntitlementWhitelist *)self->_whitelist inAppPayments]) {
    unsigned int v16 = 1;
  }
  else {
    unsigned int v16 = [(PKEntitlementWhitelist *)self->_whitelist supportsWebPayments];
  }
  if ([(PKEntitlementWhitelist *)self->_whitelist inAppPaymentsPrivate])
  {
    unsigned int v17 = 1;
LABEL_12:
    databaseManager = self->_databaseManager;
    id v19 = +[NSSet setWithObject:PKPaymentNetworkPrivateLabel];
    BOOL v20 = v17 == 0;
    if (v17) {
      id v21 = v12;
    }
    else {
      id v21 = 0;
    }
    if (v20) {
      id v22 = 0;
    }
    else {
      id v22 = v13;
    }
    uint64_t v23 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServicesCoordinator sharedWebService];
    id v24 = [(PDDatabaseManager *)databaseManager passesForInAppPaymentOnNetworks:v19 issuerCountryCodes:v21 paymentApplicationStates:v22 paymentRequestType:0 isMultiTokensRequest:v6 webService:v23];

    id v25 = [(PDPassLibrary *)self _filteredPasses:v24 forApplicationIdentifier:v11];

    goto LABEL_20;
  }
  unsigned int v17 = [(PKEntitlementWhitelist *)self->_whitelist passesAllAccess];
  if ((v16 | v17) == 1) {
    goto LABEL_12;
  }
  id v25 = 0;
LABEL_20:

  return v25;
}

- (id)_inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 paymentApplicationStates:(id)a5 isMultiTokensRequest:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist inAppPayments]) {
    unsigned int v13 = 1;
  }
  else {
    unsigned int v13 = [(PKEntitlementWhitelist *)self->_whitelist supportsWebPayments];
  }
  if ([(PKEntitlementWhitelist *)self->_whitelist inAppPaymentsPrivate])
  {
    unsigned int v14 = 1;
LABEL_7:
    databaseManager = self->_databaseManager;
    unsigned int v16 = +[NSSet setWithObject:PKPaymentNetworkPrivateLabel];
    BOOL v17 = v14 == 0;
    if (v14) {
      id v18 = v11;
    }
    else {
      id v18 = 0;
    }
    if (v17) {
      id v19 = 0;
    }
    else {
      id v19 = v12;
    }
    BOOL v20 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServicesCoordinator sharedWebService];
    id v21 = [(PDDatabaseManager *)databaseManager passesForInAppPaymentOnNetworks:v16 issuerCountryCodes:v18 paymentApplicationStates:v19 paymentRequestType:0 isMultiTokensRequest:v6 webService:v20];

    id v22 = [(PDPassLibrary *)self _filteredPasses:v21 forWebDomain:v10];

    goto LABEL_15;
  }
  unsigned int v14 = [(PKEntitlementWhitelist *)self->_whitelist passesAllAccess];
  if ((v13 | v14) == 1) {
    goto LABEL_7;
  }
  id v22 = 0;
LABEL_15:

  return v22;
}

- (void)inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    unsigned int v13 = dispatch_get_global_queue(21, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006F000;
    v15[3] = &unk_100731790;
    id v18 = v12;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    BOOL v19 = a5;
    unsigned int v14 = v15;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v21 = v14;
    dispatch_async(v13, block);
  }
}

- (void)inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unsigned int v13 = dispatch_get_global_queue(21, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10006F1CC;
  v18[3] = &unk_100731790;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  BOOL v22 = a5;
  unsigned int v14 = v18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7A4;
  block[3] = &unk_10072F788;
  id v24 = v14;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  dispatch_async(v13, block);
}

- (void)hasInAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    unsigned int v13 = dispatch_get_global_queue(21, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006F3A0;
    v15[3] = &unk_100731790;
    id v18 = v12;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    BOOL v19 = a5;
    unsigned int v14 = v15;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v21 = v14;
    dispatch_async(v13, block);
  }
}

- (void)hasInAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    unsigned int v13 = dispatch_get_global_queue(21, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006F57C;
    v15[3] = &unk_100731790;
    id v18 = v12;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    BOOL v19 = a5;
    unsigned int v14 = v15;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v21 = v14;
    dispatch_async(v13, block);
  }
}

- (void)getPassesWithUniqueIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006F724;
    v10[3] = &unk_10072E9D8;
    id v11 = v6;
    id v12 = self;
    id v13 = v7;
    id v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v15 = v9;
    dispatch_async(v8, block);
  }
}

- (void)unexpiredPassesOrderedByGroup:(id)a3
{
  if (a3)
  {
    databaseManager = self->_databaseManager;
    id v4 = (void (**)(id, id))a3;
    id v5 = [(PDDatabaseManager *)databaseManager unexpiredPassesOrderedByGroup];
    v4[2](v4, v5);
  }
}

- (void)getPassesWithSearchableTransactions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableSet);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006FA78;
    v13[3] = &unk_1007317E0;
    dispatch_group_t v14 = dispatch_group_create();
    id v15 = self;
    id v6 = v5;
    id v16 = v6;
    id v7 = v14;
    [(PDPassLibrary *)self getPassesOfType:1 handler:v13];
    id v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006FC58;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v4;
    id v9 = v6;
    dispatch_group_notify(v7, v8, v10);
  }
}

- (void)getPassUniqueIDsForAssociatedApplicationIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      id v8 = dispatch_get_global_queue(21, 0);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10006FEAC;
      v11[3] = &unk_10072E9D8;
      v11[4] = self;
      id v12 = v6;
      id v13 = v7;
      id v9 = v11;
      *(void *)&long long block = _NSConcreteStackBlock;
      *((void *)&block + 1) = 3221225472;
      id v15 = sub_10000D7A4;
      id v16 = &unk_10072F788;
      id v17 = v9;
      dispatch_async(v8, &block);
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(block) = 136315138;
        *(void *)((char *)&block + 4) = "-[PDPassLibrary getPassUniqueIDsForAssociatedApplicationIdentifier:handler:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&block, 0xCu);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)getMetadataForFieldWithProperties:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = dispatch_get_global_queue(25, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000702F4;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    id v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v14 = v9;
    dispatch_async(v8, block);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getManifestHashForPassWithUniqueID:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      if (v6)
      {
        id v11 = [(PDCardFileManager *)self->_cardFileManager objectWithUniqueID:v8];
        id v12 = [v11 dataAccessor];
        id v13 = [v12 manifestHash];
        v9[2](v9, v13);
      }
      else
      {
        id v15 = PDDefaultQueue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000705B8;
        block[3] = &unk_100731830;
        id v18 = v9;
        void block[4] = self;
        id v17 = v8;
        dispatch_async(v15, block);
      }
    }
    else
    {
      id v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v20 = "-[PDPassLibrary usingSynchronousProxy:getManifestHashForPassWithUniqueID:handler:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      v9[2](v9, 0);
    }
  }
}

- (void)enabledValueAddedServicePassesWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007075C;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    BOOL v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (id)_filteredPasses:(id)a3 forWebDomain:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000708D4;
  v8[3] = &unk_100731858;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  BOOL v6 = [a3 objectsPassingTest:v8];

  return v6;
}

- (id)_filteredPasses:(id)a3 forApplicationIdentifier:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100070A20;
  v8[3] = &unk_100731858;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  BOOL v6 = [a3 objectsPassingTest:v8];

  return v6;
}

- (void)hasPassesOfType:(unint64_t)a3 handler:(id)a4
{
  if (a4)
  {
    databaseManager = self->_databaseManager;
    BOOL v6 = (void (**)(id, id))a4;
    v6[2](v6, (id)[(PDDatabaseManager *)databaseManager passExistsWithPassType:a3]);
  }
}

- (void)hasPassesInExpiredSectionWithHandler:(id)a3
{
  id v4 = (uint64_t (**)(id, BOOL))a3;
  id v5 = v4;
  if (v4)
  {
    id v10 = v4;
    unsigned int v6 = [(PKEntitlementWhitelist *)self->_whitelist passesAllAccess];
    id v7 = v10;
    if (v6)
    {
      BOOL v8 = [(PDDatabaseManager *)self->_databaseManager hasPassesInExpiredSection];
      id v7 = v10;
      BOOL v9 = v8;
    }
    else
    {
      BOOL v9 = 0;
    }
    id v4 = (uint64_t (**)(id, BOOL))v7[2](v7, v9);
    id v5 = v10;
  }
  _objc_release_x1(v4, v5);
}

- (void)canAddPassesOfType:(unint64_t)a3 handler:(id)a4
{
  unsigned int v6 = (void (**)(id, void))a4;
  if (PKStoreDemoModeEnabled())
  {
    if (v6) {
      v6[2](v6, 0);
    }
  }
  else if (a3 == 1)
  {
    unint64_t v8 = [(PDDatabaseManager *)self->_databaseManager countActiveSecureElementPasses];
    if (PKDisableDynamicSEAllocation())
    {
      uint64_t v9 = PKMaxPaymentCards();
      BOOL v10 = v9 - 1 < v8;
    }
    else
    {
      BOOL v10 = 0;
      uint64_t v9 = -1;
    }
    int IsAvailable = PKSecureElementIsAvailable();
    unsigned int v12 = +[PKSecureElement isInFailForward];
    int v13 = PKIsSRD();
    int v14 = PKIsBeneficiaryAccount();
    int v15 = v14;
    if (IsAvailable) {
      int v16 = v13;
    }
    else {
      int v16 = 1;
    }
    int v17 = v16 | v10 | v14 | v12;
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = @"YES";
      int v24 = 138544898;
      if (v17) {
        CFStringRef v20 = @"NO";
      }
      else {
        CFStringRef v20 = @"YES";
      }
      CFStringRef v25 = v20;
      __int16 v26 = 2050;
      uint64_t v27 = v9;
      if (IsAvailable) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      __int16 v28 = 2048;
      if (v12) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      unint64_t v29 = v8;
      __int16 v30 = 2114;
      if (v13) {
        CFStringRef v23 = @"YES";
      }
      else {
        CFStringRef v23 = @"NO";
      }
      CFStringRef v31 = v21;
      if (!v15) {
        CFStringRef v19 = @"NO";
      }
      __int16 v32 = 2114;
      CFStringRef v33 = v22;
      __int16 v34 = 2114;
      CFStringRef v35 = v23;
      __int16 v36 = 2114;
      CFStringRef v37 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "canAddPass: %{public}@ with maxCards: %{public}ld, passCount: %ld - seAvailable: %{public}@, isInFailForward: %{public}@ isSRD: %{public}@ isBeneficiaryAccount: %{public}@", (uint8_t *)&v24, 0x48u);
    }

    if (v6) {
      v6[2](v6, v17 ^ 1u);
    }
  }
  else if (a3)
  {
    if (v6) {
      v6[2](v6, 1);
    }
  }
  else if (v6)
  {
    BOOL v7 = (+[PKWalletVisibility isWalletVisible] & 1) != 0
      || PKPassbookIsCurrentlyDeletedByUser() != 0;
    v6[2](v6, v7);
  }
}

- (void)countPassesOfType:(unint64_t)a3 handler:(id)a4
{
  BOOL v7 = (void (**)(id, unint64_t))a4;
  if (v7)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist passesOverviewAccess] & 1) != 0
      || [(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      v7[2](v7, [(PDDatabaseManager *)self->_databaseManager countPassesOfType:a3]);
    }
    else
    {
      unint64_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = NSStringFromSelector(a2);
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: not entitled for %@", (uint8_t *)&v10, 0xCu);
      }
      v7[2](v7, 0);
    }
  }
}

- (void)defaultPaymentPassWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007107C;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    unsigned int v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)peerPaymentPassUniqueIDWithHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      id v5 = [(PDDatabaseManager *)self->_databaseManager peerPaymentAccount];
      unsigned int v6 = [v5 associatedPassUniqueID];
      v4[2](v4, v6);
    }
    else
    {
      BOOL v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100514D08();
      }

      v4[2](v4, 0);
    }
  }
}

- (void)expressTransitPassWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100071344;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    unsigned int v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)sortedTransitPassesForTransitNetworkIdentifiers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000715E0;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    unsigned int v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)sortedTransitPassesForAppletDataFormat:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100072068;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    uint64_t v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v14 = v9;
    dispatch_async(v8, block);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getEncryptedServiceProviderDataForUniqueID:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    if (v7
      && [v7 length]
      && [(PDPassLibrary *)self _entitledForUniqueID:v7 forActions:2])
    {
      if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
      {
LABEL_6:
        uint64_t v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v7];
        if ([v9 passType] == (id)1)
        {
          id v10 = [v9 secureElementPass];
          id v11 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v41 = 0x3032000000;
          long long v42 = sub_1000207AC;
          id v43 = sub_100020EC8;
          id v44 = 0;
          v38[0] = 0;
          v38[1] = v38;
          v38[2] = 0x3032000000;
          v38[3] = sub_1000207AC;
          v38[4] = sub_100020EC8;
          id v39 = 0;
          v36[0] = 0;
          v36[1] = v36;
          v36[2] = 0x3032000000;
          v36[3] = sub_1000207AC;
          v36[4] = sub_100020EC8;
          id v37 = 0;
          v34[0] = 0;
          v34[1] = v34;
          v34[2] = 0x3032000000;
          v34[3] = sub_1000207AC;
          v34[4] = sub_100020EC8;
          id v35 = 0;
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_100072DC8;
          v29[3] = &unk_100731970;
          void v29[4] = self;
          __int16 v30 = v9;
          p_long long buf = &buf;
          __int16 v32 = v36;
          CFStringRef v33 = v38;
          [v11 addOperation:v29];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_100073464;
          v23[3] = &unk_1007319C0;
          v23[4] = self;
          id v12 = v10;
          id v24 = v12;
          CFStringRef v25 = v36;
          __int16 v26 = v38;
          uint64_t v27 = v34;
          __int16 v28 = &buf;
          [v11 addOperation:v23];
          int v13 = +[NSNull null];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_1000736D8;
          v19[3] = &unk_1007319E8;
          CFStringRef v21 = &buf;
          id v20 = v8;
          CFStringRef v22 = v34;
          id v14 = [v11 evaluateWithInput:v13 completion:v19];

          _Block_object_dispose(v34, 8);
          _Block_object_dispose(v36, 8);

          _Block_object_dispose(v38, 8);
          _Block_object_dispose(&buf, 8);
        }
        else
        {
          id v18 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Pass for unique ID %@ wasn't a secure element pass", (uint8_t *)&buf, 0xCu);
          }

          id v12 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:0];
          (*((void (**)(id, void, id))v8 + 2))(v8, 0, v12);
        }

        goto LABEL_23;
      }
      uint64_t v9 = [(PDPassLibrary *)self remoteProcessApplicationInfo];
      if ([v9 isRunning]
        && ([v9 isVisible] & 1) != 0)
      {

        goto LABEL_6;
      }
      int v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[PDPassLibrary usingSynchronousProxy:getEncryptedServiceProviderDataForUniqueID:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s requires the client to be running in the foreground", (uint8_t *)&buf, 0xCu);
      }

      int v17 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:0];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v17);
    }
    else
    {
      int v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[PDPassLibrary usingSynchronousProxy:getEncryptedServiceProviderDataForUniqueID:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v9 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, NSObject *))v8 + 2))(v8, 0, v9);
    }
  }
  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[PDPassLibrary usingSynchronousProxy:getEncryptedServiceProviderDataForUniqueID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s requires a completion", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_23:
}

- (void)usingSynchronousProxy:(BOOL)a3 getServiceProviderDataForUniqueID:(id)a4 completion:(id)a5
{
  id v7 = (char *)a4;
  id v8 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    if (v7
      && [v7 length]
      && [(PDPassLibrary *)self _entitledForUniqueID:v7 forActions:2])
    {
      if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) == 0)
      {
        uint64_t v9 = [(PDPassLibrary *)self remoteProcessApplicationInfo];
        if (![v9 isRunning]
          || ([v9 isVisible] & 1) == 0)
        {
          id v11 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136315138;
            int v15 = "-[PDPassLibrary usingSynchronousProxy:getServiceProviderDataForUniqueID:completion:]";
            id v12 = "%s requires the client to be running in the foreground";
LABEL_20:
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
          }
LABEL_21:

          int v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:0];
          v8[2](v8, 0, v13);

          goto LABEL_22;
        }
      }
      uint64_t v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v7];
      if ([v9 passType] == (id)1)
      {
        [(PDPassLibrary *)self _getServiceProviderDataForPass:v9 completion:v8];
        goto LABEL_22;
      }
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        int v15 = v7;
        id v12 = "Couldn't get service provider data: Pass for unique ID %@ wasn't a secure element pass";
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      int v15 = "-[PDPassLibrary usingSynchronousProxy:getServiceProviderDataForUniqueID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v9 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    v8[2](v8, 0, v9);
  }
  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      int v15 = "-[PDPassLibrary usingSynchronousProxy:getServiceProviderDataForUniqueID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s requires a completion", (uint8_t *)&v14, 0xCu);
    }
  }
LABEL_22:
}

- (void)_getEncryptedServiceProviderDataForSecureElementPass:(id)a3 publicKey:(id)a4 scheme:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    int v14 = [v10 devicePrimaryPaymentApplication];
    int v15 = [v14 applicationIdentifier];
    secureElement = self->_secureElement;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100073CB0;
    v18[3] = &unk_100731A10;
    id v19 = v15;
    id v20 = v11;
    id v21 = v12;
    id v22 = v13;
    id v17 = v15;
    [(PKSecureElement *)secureElement accessSecureElementManagerSessionWithHandler:v18];
  }
  else
  {
    int v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v24 = "-[PDPassLibrary _getEncryptedServiceProviderDataForSecureElementPass:publicKey:scheme:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s requires a completion", buf, 0xCu);
    }
  }
}

- (void)_getServiceProviderDataForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 devicePrimaryPaymentApplication];
    uint64_t v9 = [v8 applicationIdentifier];
    secureElement = self->_secureElement;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100073FA4;
    v12[3] = &unk_100731A38;
    id v13 = v9;
    id v14 = v7;
    id v11 = v9;
    [(PKSecureElement *)secureElement accessSecureElementManagerSessionWithHandler:v12];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      int v16 = "-[PDPassLibrary _getServiceProviderDataForPass:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s requires a completion", buf, 0xCu);
    }
  }
}

- (void)checkForTransitNotification
{
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    objc_super v3 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074250;
    block[3] = &unk_10072E1E8;
    void block[4] = self;
    dispatch_async(v3, block);
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100514D3C();
    }
  }
}

- (void)postUpgradedPassNotificationForMarket:(id)a3 passUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000743A4;
    v9[3] = &unk_100731A60;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(PDPassLibrary *)self _getPassWithUniqueID:v11 handler:v9];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100514D70();
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 postUpgradesAvailableNotificationForMarket:(id)a4 passUniqueID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6)
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "postUpgradesAvailableNotificationForMarket:passUniqueID: does not currently support sync", buf, 2u);
    }
LABEL_8:

    goto LABEL_9;
  }
  if (![(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100514DA4();
    }
    goto LABEL_8;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000746B0;
  v11[3] = &unk_100731A60;
  v11[4] = self;
  id v12 = v8;
  id v13 = v9;
  [(PDPassLibrary *)self _getPassWithUniqueID:v13 handler:v11];

LABEL_9:
}

- (void)passWithFPANIdentifier:(id)a3 handler:(id)a4
{
  id v9 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      id v7 = [(PDDatabaseManager *)self->_databaseManager passWithPrimaryAccountIdentifier:v9];
      id v8 = [v7 paymentPass];

      v6[2](v6, v8);
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

- (void)passWithDPANIdentifier:(id)a3 handler:(id)a4
{
  id v10 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      id v7 = [(PDDatabaseManager *)self->_databaseManager paymentApplicationWithDPANIdentifier:v10];
      if (v7)
      {
        id v8 = [(PDDatabaseManager *)self->_databaseManager passWithPaymentApplication:v7];
        id v9 = [v8 paymentPass];
      }
      else
      {
        id v9 = 0;
      }
      v6[2](v6, v9);
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

- (void)isRemovingPassesOfType:(unint64_t)a3 handler:(id)a4
{
  BOOL v6 = (void (**)(id, id))a4;
  if (v6)
  {
    id v9 = v6;
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess]) {
      BOOL v7 = a3 == 1;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7) {
      id v8 = [(PKSecureElement *)self->_secureElement isDeletingAllApplets];
    }
    else {
      id v8 = 0;
    }
    v9[2](v9, v8);
    BOOL v6 = v9;
  }
}

- (void)hasSecureElementPassesOfType:(int64_t)a3 handler:(id)a4
{
  BOOL v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    id v8 = v6;
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess]) {
      BOOL v7 = [(PDDatabaseManager *)self->_databaseManager hasSecureElementPassesOfType:a3];
    }
    else {
      BOOL v7 = 0;
    }
    v8[2](v8, v7);
    BOOL v6 = v8;
  }
}

- (void)isPassbookVisibleWithHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    (*((void (**)(id, id))a3 + 2))(v4, +[PKWalletVisibility isWalletVisible]);
  }
}

- (void)passbookHasBeenDeletedWithHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    BOOL v4 = PKPassbookIsCurrentlyDeletedByUser() != 0;
    (*((void (**)(id, BOOL))a3 + 2))(v5, v4);
  }
}

- (void)iPadSupportsPasses:(id)a3
{
  if (a3)
  {
    paymentWebServicesCoordinator = self->_paymentWebServicesCoordinator;
    BOOL v4 = (void (**)(id, id))a3;
    id v5 = [(PDPaymentWebServiceCoordinator *)paymentWebServicesCoordinator sharedWebService];
    id v6 = [v5 _appleAccountInformation];

    v4[2](v4, [v6 aidaAccountAvailable]);
  }
}

- (void)getArchivedObjectWithUniqueID:(id)a3 handler:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    BOOL v7 = (void *)PDOSTransactionCreate("PDPassLibrary");
    id v9 = [(PDCardFileManager *)self->_cardFileManager objectWithUniqueID:v11];
    if ([(PDPassLibrary *)self _entitledForObject:v9 forActions:2])
    {
      id v10 = [v9 archiveData];
      v6[2](v6, v10);
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

- (void)getDataForBundleResourceNamed:(id)a3 withExtension:(id)a4 objectUniqueIdentifier:(id)a5 handler:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  if (v12)
  {
    if ([(PDPassLibrary *)self _entitledForUniqueID:v11 forActions:2])
    {
      id v14 = (void *)PDOSTransactionCreate("PDPassLibrary");
      int v15 = [(PDCardFileManager *)self->_cardFileManager dataAccessorForObjectWithUniqueID:v11];
      int v16 = [v15 dataForBundleResourceNamed:v17 withExtension:v10];
      v12[2](v12, v16);
    }
    else
    {
      v12[2](v12, 0);
    }
  }
}

- (void)getDataForBundleResources:(id)a3 objectUniqueIdentifier:(id)a4 handler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if ([(PDPassLibrary *)self _entitledForUniqueID:v8 forActions:2])
    {
      id v11 = (void *)PDOSTransactionCreate("PDPassLibrary");
      id v12 = [(PDCardFileManager *)self->_cardFileManager dataAccessorForObjectWithUniqueID:v8];
      id v13 = [v12 dataForBundleResources:v14];
      v9[2](v9, v13);
    }
    else
    {
      v9[2](v9, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 passLocalizedStringForKey:(id)a4 uniqueID:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  if (v12)
  {
    if (!a3)
    {
      id v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "passLocalizedStringForKey does not currently support async", (uint8_t *)v16, 2u);
      }
    }
    if ([(PDPassLibrary *)self _entitledForUniqueID:v11 forActions:2])
    {
      id v14 = [(PDCardFileManager *)self->_cardFileManager dataAccessorForObjectWithUniqueID:v11];
      int v15 = [v14 passLocalizedStringForKey:v10];
      v12[2](v12, v15);
    }
    else
    {
      v12[2](v12, 0);
    }
  }
}

- (void)getPassWithPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = v8;
  if (v8)
  {
    id v12 = v8;
    id v10 = [(PDDatabaseManager *)self->_databaseManager passWithPassTypeID:a3 serialNumber:a4];
    if ([(PDPassLibrary *)self _entitledForObject:v10 forActions:2])
    {
      id v11 = [(PDPassLibrary *)self _sanitizePassIfNeeded:v10];
      v12[2](v12, v11);
    }
    else
    {
      v12[2](v12, 0);
    }

    id v9 = v12;
  }
  _objc_release_x1(v8, v9);
}

- (void)getManifestHashAndSettingsForPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = dispatch_get_global_queue(21, 0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100075344;
    v13[3] = &unk_100730578;
    void v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    id v12 = v13;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v18 = v12;
    dispatch_async(v11, block);
  }
}

- (void)replacePassWithPassData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007559C;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_queue_replacePass:(id)a3 handler:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  id v7 = PDDefaultQueue();
  dispatch_assert_queue_V2(v7);

  if (v12 && [(PDPassLibrary *)self _entitledForObject:v12 forActions:4])
  {
    id v9 = [v12 passTypeIdentifier];
    id v10 = [v12 serialNumber];
    if ([(PDDatabaseManager *)self->_databaseManager passExistsWithPassTypeID:v9 serialNumber:v10])
    {
      BOOL v11 = [(PDCardFileManager *)self->_cardFileManager writeCard:v12 source:4 error:0];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  if (v6) {
    v6[2](v6, v11);
  }
}

- (void)getContentForUniqueID:(id)a3 handler:(id)a4
{
}

- (void)usingSynchronousProxy:(BOOL)a3 getCachedImageSetContainerForUniqueID:(id)a4 type:(int64_t)a5 withDisplayProfile:(id)a6 displayTraits:(id)a7 handler:(id)a8
{
  BOOL v12 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void (**)(id, void *))a8;
  if (v17)
  {
    if (v16 && [(PDPassLibrary *)self _entitledForUniqueID:v14 forActions:2])
    {
      if (v12)
      {
        id v18 = (void *)PDOSTransactionCreate("PDPassLibrary");
        id v20 = [(PDCardFileManager *)self->_cardFileManager cachedImageSetContainerForUniqueID:v14 type:a5 withDisplayProfile:v15 displayTraits:v16];
        v17[2](v17, v20);
      }
      else
      {
        cardFileManager = self->_cardFileManager;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000758F0;
        v22[3] = &unk_100731AB0;
        CFStringRef v23 = v17;
        [(PDCardFileManager *)cardFileManager fetchCachedImageSetContainerForUniqueID:v14 type:a5 withDisplayProfile:v15 displayTraits:v16 completion:v22];
      }
    }
    else
    {
      v17[2](v17, 0);
    }
  }
}

- (void)getImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = v12;
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100075A24;
    v14[3] = &unk_100731AB0;
    id v15 = v12;
    [(PDPassLibrary *)self usingSynchronousProxy:0 getImageSetContainerForUniqueID:a3 type:a4 withDisplayProfile:a5 suffix:a6 handler:v14];
  }
}

- (void)updateSettings:(unint64_t)a3 forObjectWithUniqueID:(id)a4
{
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v7 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075BF4;
    block[3] = &unk_10072F7D0;
    void block[4] = self;
    unint64_t v11 = a3;
    id v10 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100514DD8();
    }
  }
}

- (void)setSortingState:(int64_t)a3 forObjectWithUniqueID:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v10 = PDDefaultQueue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100075D4C;
    v12[3] = &unk_100731AD8;
    void v12[4] = self;
    id v13 = v8;
    int64_t v15 = a3;
    id v14 = v9;
    dispatch_async(v10, v12);
  }
  else
  {
    unint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100514E0C();
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 setLiveRenderingEnabled:(BOOL)a4 forPassUniqueID:(id)a5 handler:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, unint64_t))a6;
  if (v10)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      if (v9) {
        v10[2](v10, [(PDPassLiveRenderManager *)self->_passLiveRenderManager updateLiveRenderingEnabled:v7 forPassUniqueID:v9]);
      }
      else {
        v10[2](v10, 1uLL);
      }
    }
    else
    {
      unint64_t v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "passd was asked to change live rendering by an unentitled process. Refusing.", (uint8_t *)v12, 2u);
      }

      v10[2](v10, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 dynamicStateForPassUniqueID:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  if (v8)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      if (v7)
      {
        id v9 = [(PDPassDynamicStateManager *)self->_dynamicStateManager passDynamicStateForUniqueIdentifier:v7];
        v8[2](v8, v9);

        goto LABEL_9;
      }
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "passd was asked to get dynamic state by an unentitled process. Refusing.", (uint8_t *)v11, 2u);
      }
    }
    v8[2](v8, 0);
  }
LABEL_9:
}

- (void)rescheduleCommutePlanRenewalReminderForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v5 = PDDefaultQueue();
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000760AC;
    v7[3] = &unk_10072E198;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100514E40();
    }
  }
}

- (void)noteObjectSharedWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100076228;
  v8[3] = &unk_10072E198;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7A4;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)addPassesWithData:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v21 = a4;
  CFStringRef v23 = (void *)PDOSTransactionCreate("PDPassLibrary");
  id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v11);
        id v30 = 0;
        id v14 = +[PKPass createWithData:v12 warnings:0 error:&v30];
        id v15 = v30;
        if (v14)
        {
          [v6 addObject:v14];
        }
        else
        {
          id v16 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100514E74(&buf, v29, v16);
          }
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v9);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100076568;
  v26[3] = &unk_100731B28;
  id v27 = v6;
  id v17 = v6;
  id v18 = objc_retainBlock(v26);
  id v19 = [v17 count];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100076628;
  v24[3] = &unk_100731B50;
  id v25 = v21;
  id v20 = v21;
  [(PDPassLibrary *)self _usingSynchronousProxy:0 addPassesWithEnumerator:v18 estimatedNumberOfPasses:v19 osTransaction:v23 completionHandler:v24];
}

- (void)usingSynchronousProxy:(BOOL)a3 addPassesContainer:(id)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)PDOSTransactionCreate("PDPassLibrary");
  if (v8 && ![v8 unarchivePassesWithOptions:0 usingBlock:0])
  {
    uint64_t v13 = v11;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100076848;
    v19[3] = &unk_100731B28;
    id v14 = v8;
    id v20 = v14;
    id v15 = objc_retainBlock(v19);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100076908;
    v16[3] = &unk_100731BA0;
    id v17 = v14;
    id v18 = v9;
    [(PDPassLibrary *)self _usingSynchronousProxy:v6 addPassesWithEnumerator:v15 estimatedNumberOfPasses:v13 osTransaction:v10 completionHandler:v16];
  }
  else
  {
    uint64_t v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 134217984;
      id v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDPassLibrary (%p): could not extract passes from container for addPassesContainer:.", buf, 0xCu);
    }

    (*((void (**)(id, uint64_t))v9 + 2))(v9, 2);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 addPassIngestionPayloads:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)PDOSTransactionCreate("PDPassLibrary");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100076AA4;
  v16[3] = &unk_100731B28;
  id v17 = v7;
  id v10 = v7;
  uint64_t v11 = objc_retainBlock(v16);
  id v12 = [v10 count];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100076C08;
  v14[3] = &unk_100731B50;
  id v15 = v8;
  id v13 = v8;
  [(PDPassLibrary *)self _usingSynchronousProxy:0 addPassesWithEnumerator:v11 estimatedNumberOfPasses:v12 osTransaction:v9 completionHandler:v14];
}

- (void)_usingSynchronousProxy:(BOOL)a3 addPassesWithEnumerator:(id)a4 estimatedNumberOfPasses:(unint64_t)a5 osTransaction:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, uint64_t))a7;
  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    PKShowAlertForWalletUninstalled();
    v13[2](v13, 2);
  }
  else if ([(PKEntitlementWhitelist *)self->_whitelist passesAddSilently])
  {
    id v14 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100076FB4;
    block[3] = &unk_100731BC8;
    void block[4] = self;
    id v33 = v11;
    long long v34 = v13;
    id v32 = v12;
    dispatch_async(v14, block);
  }
  else
  {
    [(PDPassLibrary *)self remoteProcessIdentifier];
    id v15 = PDLocalizedAppNameForPID();
    v35[0] = kCFUserNotificationAlternateButtonTitleKey;
    if (a5 == 1) {
      id v16 = @"INGESTION_ADD";
    }
    else {
      id v16 = @"INGESTION_ADD_N";
    }
    id v17 = PKLocalizedString(&v16->isa);
    v36[0] = v17;
    v35[1] = kCFUserNotificationOtherButtonTitleKey;
    id v18 = PKLocalizedString(@"REVIEW_BUTTON_TITLE");
    v36[1] = v18;
    v35[2] = kCFUserNotificationDefaultButtonTitleKey;
    id v19 = PKLocalizedString(@"INGESTION_CANCEL");
    v36[2] = v19;
    v35[3] = kCFUserNotificationAlertHeaderKey;
    id v20 = PKLocalizedString(@"ADD_PASSES_TITLE", @"%@%lu", v15, a5);
    v36[3] = v20;
    v36[4] = &__kCFBooleanTrue;
    void v35[4] = PKUserNotificationDontDismissOnUnlock;
    v35[5] = PKUserNotificationAllowMenuButtonDismissal;
    void v36[5] = &__kCFBooleanTrue;
    id v21 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:6];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100077000;
    v28[3] = &unk_100731C18;
    v28[4] = self;
    unint64_t v29 = v13;
    id v30 = v11;
    id v22 = +[PKUserNotificationAgent presentNotificationWithParameters:v21 responseHandler:v28];
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    userNotifications = self->_userNotifications;
    if (!userNotifications)
    {
      id v25 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      __int16 v26 = self->_userNotifications;
      self->_userNotifications = v25;

      userNotifications = self->_userNotifications;
    }
    id v27 = +[NSValue valueWithPointer:v22];
    [(NSMutableArray *)userNotifications addObject:v27];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 addUnsignedPassesWithDataFileDescriptors:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAddUnsigned])
  {
    id v9 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000773D8;
    block[3] = &unk_1007315D8;
    id v17 = v7;
    id v18 = self;
    id v19 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to add unsigned passes, but missing proper entitlement.", buf, 2u);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) invalidate];
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v13);
    }

    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 2);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 provisionHomeKeyPassForSerialNumbers:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v9 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100077B54;
    block[3] = &unk_1007315D8;
    id v13 = v7;
    uint64_t v14 = self;
    id v15 = v8;
    dispatch_async(v9, block);

    id v10 = v13;
LABEL_7:

    goto LABEL_8;
  }
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to provision HomeKeys for serialNumbers, but missing proper entitlement.", buf, 2u);
  }

  if (v8)
  {
    id v10 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v10);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)usingSynchronousProxy:(BOOL)a3 availableHomeKeyPassesWithCompletionHandler:(id)a4
{
  id v5 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    BOOL v6 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100078DA8;
    block[3] = &unk_10072F788;
    id v10 = v5;
    dispatch_async(v6, block);

    id v7 = v10;
LABEL_7:

    goto LABEL_8;
  }
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to fetch available HomeKeys, but missing proper entitlement.", buf, 2u);
  }

  if (v5)
  {
    id v7 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v7);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)usingSynchronousProxy:(BOOL)a3 replaceUnsignedPassWithDataFileDescriptor:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAddUnsigned])
  {
    id v9 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100079544;
    block[3] = &unk_1007315D8;
    id v12 = v7;
    id v13 = self;
    id v14 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to replace unsigned passes, but missing proper entitlement.", buf, 2u);
    }

    [v7 invalidate];
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 containsPassWithPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v12 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000798F0;
    v14[3] = &unk_100730578;
    void v14[4] = self;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    dispatch_async(v12, v14);
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to call containsPassWithPassTypeIdentifier, but missing proper entitlement.", buf, 2u);
    }

    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 enableExpressForPassWithPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess]
    && ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0)
  {
    id v12 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100079AC4;
    v14[3] = &unk_100730578;
    void v14[4] = self;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    dispatch_async(v12, v14);
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to call enableExpressForPassWithPassTypeIdentifier, but missing proper entitlements.", buf, 2u);
    }

    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
}

- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100079EEC;
  v15[3] = &unk_100730578;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)removePassesWithUniqueIDs:(id)a3 diagnosticReason:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007A098;
  v15[3] = &unk_100730578;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)recoverPassWithUniqueID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A2F4;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = PDDefaultQueue();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007A44C;
  v13[3] = &unk_100731AD8;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)resetApplePayWithDiagnosticReason:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A5AC;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)updateObjectWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007A744;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)personalizePassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v18 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007A8D4;
    block[3] = &unk_100731E98;
    void block[4] = self;
    id v20 = v14;
    id v21 = v15;
    id v22 = v16;
    unint64_t v24 = a6;
    unint64_t v25 = a7;
    id v23 = v17;
    dispatch_async(v18, block);
  }
  else if (v17)
  {
    (*((void (**)(id, void))v17 + 2))(v17, 0);
  }
}

- (void)recomputeRelevantPassesWithSearchMode:(int64_t)a3
{
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10007A9C0;
    v6[3] = &unk_10072F840;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(v5, v6);
  }
}

- (void)fetchHasCandidatePasses:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007AB08;
    v7[3] = &unk_10072E598;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D7A4;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)fetchCurrentRelevantPassInfo:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10007AC38;
    v6[3] = &unk_10072E598;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)migrateDataWithHandler:(id)a3 didRestoreFromBackup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, uint64_t))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dataMigrationRequestedWithPassLibrary:self didRestoreFromBackup:v4];

    v6[2](v6, 1);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100514EB4();
    }

    v6[2](v6, 0);
  }
}

- (void)signData:(id)a3 forPassUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007AEC8;
  v15[3] = &unk_100731F10;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)usingSynchronousProxy:(BOOL)a3 createFidoKeyForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 challenge:(id)a6 externalizedAuth:(id)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v18 = PDDefaultQueue();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10007B700;
    v21[3] = &unk_10072FEA8;
    v21[4] = self;
    id v22 = v13;
    id v23 = v14;
    id v24 = v15;
    id v25 = v16;
    id v26 = v17;
    dispatch_async(v18, v21);
  }
  else
  {
    id v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Attempting to create FIDO key, but missing proper entitlement.", buf, 2u);
    }

    if (v17)
    {
      id v20 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void, void, void *))v17 + 2))(v17, 0, 0, 0, v20);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 checkFidoKeyPresenceForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v15 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007B8B0;
    block[3] = &unk_100731F38;
    void block[4] = self;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    dispatch_async(v15, block);
  }
  else
  {
    id v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Attempting to check for FIDO key, but missing proper entitlement.", buf, 2u);
    }

    if (v14) {
      (*((void (**)(id, void))v14 + 2))(v14, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 signWithFidoKeyForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 challenge:(id)a7 publicKeyIdentifier:(id)a8 externalizedAuth:(id)a9 completion:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v22 = PDDefaultQueue();
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10007BAFC;
    v25[3] = &unk_100731F60;
    void v25[4] = self;
    id v26 = v15;
    id v27 = v16;
    id v28 = v17;
    id v29 = v18;
    id v30 = v19;
    id v31 = v20;
    id v32 = v21;
    dispatch_async(v22, v25);
  }
  else
  {
    id v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Attempting to sign FIDO challenge, but missing proper entitlement.", buf, 2u);
    }

    if (v21)
    {
      id v24 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v21 + 2))(v21, 0, v24);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 generateSEEncryptionCertificateForSubCredentialId:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v9 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007BCB8;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to generate SE encryption cert, but missing proper entitlement.", buf, 2u);
    }

    if (v8)
    {
      id v11 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v11);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 generateISOEncryptionCertificateForSubCredentialId:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v9 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007BE50;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to generateISO encryption cert, but missing proper entitlement.", buf, 2u);
    }

    if (v8)
    {
      id v11 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v11);
    }
  }
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting key material for subcredential id: %@", buf, 0xCu);
    }

    id v6 = PDDefaultQueue();
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007BFFC;
    v8[3] = &unk_10072E198;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v6, v8);
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempting to delete sub credential key material, but missing proper entitlement.", buf, 2u);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 addISO18013Blobs:(id)a4 cardType:(int64_t)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v11 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007C214;
    v14[3] = &unk_100731AD8;
    void v14[4] = self;
    id v15 = v9;
    int64_t v17 = a5;
    id v16 = v10;
    dispatch_async(v11, v14);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting to addISO18013Blobs, but missing proper entitlement.", buf, 2u);
    }

    if (v10)
    {
      id v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 longTermPrivacyKeyForCredentialGroupIdentifier:(id)a4 reuseExisting:(BOOL)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v11 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007C3B8;
    v14[3] = &unk_100730238;
    void v14[4] = self;
    id v15 = v9;
    BOOL v17 = a5;
    id v16 = v10;
    dispatch_async(v11, v14);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting to generateLongTermPrivacyKeyForCredentialGroupIdentifier, but missing proper entitlement.", buf, 2u);
    }

    if (v10)
    {
      id v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 generateAuxiliaryCapabilitiesForRequirements:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GenerateAuxiliaryCapabilitiesForRequirements starting...", buf, 2u);
    }

    id v10 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007C598;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v14 = v7;
    id v15 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to generateLongTermPrivacyKeyForCredentialGroupIdentifier, but missing proper entitlement.", buf, 2u);
    }

    if (v8)
    {
      id v12 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v12);
    }
  }
}

- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
    || ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0)
  {
    id v10 = PDDefaultQueue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007C8B0;
    v12[3] = &unk_100731AD8;
    void v12[4] = self;
    id v13 = v8;
    unint64_t v15 = a4;
    id v14 = v9;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call to signData:signatureEntanglementMode:withCompletionHandler: missing proper entitlements", buf, 2u);
    }

    if (v9) {
      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    }
  }
}

- (void)isWatchIssuerAppProvisioningSupportedWithHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    (*((void (**)(id, BOOL))a3 + 2))(v5, [(PDPassLibrary *)self _isWatchIssuerAppProvisioningSupported]);
  }
}

- (BOOL)_isWatchIssuerAppProvisioningSupported
{
  int v2 = PKIsPairedWithWatch();
  if (v2)
  {
    id v3 = objc_alloc_init(off_100805148());
    unsigned __int8 v4 = [v3 isIssuerAppProvisioningSupported];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)backupMetadataWithHandler:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void *))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preparing backup metadata", buf, 2u);
    }

    id v6 = [(PDDefaultPassManager *)self->_defaultPassManager defaultPaymentPassIdentifier];
    id v7 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v6];
    id v8 = [v7 paymentPass];

    id v9 = [v8 serialNumber];
    int IsCurrentlyDeletedByUser = PKPassbookIsCurrentlyDeletedByUser();
    if (v9) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = IsCurrentlyDeletedByUser == 0;
    }
    if (v11)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Backup skipping - no data to backup was present to backup", buf, 2u);
      }
      id v18 = 0;
      id v13 = v5;
      goto LABEL_28;
    }
    int v12 = IsCurrentlyDeletedByUser;
    id v13 = +[NSNumber numberWithUnsignedInteger:2];
    id v14 = +[NSMutableDictionary dictionaryWithObject:v13 forKey:@"backupDataVersionNumberKey"];
    unint64_t v15 = v14;
    if (v9)
    {
      [v14 setObject:v9 forKeyedSubscript:@"backupDataDefaultPaymentPassSerialNumberKey"];
      if (v12)
      {
LABEL_10:
        id v16 = +[NSNumber numberWithBool:1];
        [v15 setObject:v16 forKeyedSubscript:@"backupDataPassbookDeletedKey"];
LABEL_23:

        id v20 = 0;
        id v18 = +[NSKeyedArchiver archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v20];
        id v19 = v20;
        if (v19)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138412546;
            id v22 = v18;
            __int16 v23 = 2112;
            id v24 = v19;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error: unable to encode backup data (%@) with error: %@", buf, 0x16u);
          }
        }
LABEL_28:

        if (v4)
        {
          v4[2](v4, v18);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint8_t buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Backup metadata completed", buf, 2u);
          }
        }
        goto LABEL_33;
      }
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Backup skipping default payment pass serial number - none found", buf, 2u);
      }

      if (v12) {
        goto LABEL_10;
      }
    }
    id v16 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Backup skipping passbook deleted - Passbook has not been deleted", buf, 2u);
      id v16 = v5;
    }
    goto LABEL_23;
  }
  BOOL v17 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100514EE8();
  }

  if (v4) {
    v4[2](v4, 0);
  }
LABEL_33:
}

- (void)setBackupMetadata:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    if (v6 && [v6 length])
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(), 0);
      id v19 = 0;
      BOOL v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v10 fromData:v6 error:&v19];
      id v12 = v19;

      if (!v12 && v11 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v13 = v11;
        id v14 = [v13 objectForKey:@"backupDataVersionNumberKey"];
        id v15 = [v14 integerValue];
        if (v15 == (id)1)
        {
          [(PDPassLibrary *)self _setBackupDefaultPaymentPassState:v13];
        }
        else if (v15 == (id)2)
        {
          [(PDPassLibrary *)self _setBackupDefaultPaymentPassState:v13];
          [(PDPassLibrary *)self _setBackupPassbookDeletedState:v13];
        }
        else
        {
          id v18 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            id v21 = v14;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Error: Not able to decode metadata contents as client does not know about version number: %@", buf, 0xCu);
          }
        }
        if (v7) {
          v7[2](v7);
        }
      }
      else
      {
        BOOL v17 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint8_t buf = 138412290;
          id v21 = v12;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error: unable to decode backup data with error: %@", buf, 0xCu);
        }

        if (v7) {
          v7[2](v7);
        }
      }

      goto LABEL_28;
    }
    id v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error: No data returned in backup metadata call", buf, 2u);
    }
  }
  else
  {
    id v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100514F1C();
    }
  }

  if (v7) {
    v7[2](v7);
  }
LABEL_28:
}

- (void)prepareForBackupRestoreWithExistingPreferencesData:(id)a3 handler:(id)a4
{
  id v5 = (void (**)(void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    PDWritePassdPreferencesToSafeHaven();
    if (v5) {
LABEL_3:
    }
      v5[2](v5);
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "passd was asked to prepare for Buddy safe-haven by an unentitled process. Refusing.", v7, 2u);
    }

    if (v5) {
      goto LABEL_3;
    }
  }
}

- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained prepareForBackupRestoreWithRequiredFileURLs:v8 destinationFileHandles:v9 handler:v10];
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "passd was asked to prepare for Buddy safe-haven by an unentitled process. Refusing.", v13, 2u);
    }

    if (v10) {
      v10[2](v10);
    }
  }
}

- (void)_setBackupDefaultPaymentPassState:(id)a3
{
  id v3 = [a3 PKStringForKey:@"backupDataDefaultPaymentPassSerialNumberKey"];
  if (v3)
  {
    PKSetLastBackedUpDefaultPaymentPassSerialNumber();
    unsigned __int8 v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      id v5 = "Backup matadata contained defaultPaymentPassSerialNumber: %@";
      id v6 = v4;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else
  {
    unsigned __int8 v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      id v5 = "Backup matadata did not contain defaultPaymentPassSerialNumber";
      id v6 = v4;
      uint32_t v7 = 2;
      goto LABEL_6;
    }
  }
}

- (void)_setBackupPassbookDeletedState:(id)a3
{
  id v3 = [a3 PKNumberForKey:@"backupDataPassbookDeletedKey"];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    [v3 BOOLValue];
    PKSetLastBackupPassbookWasDeleted();
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      id v6 = "Backup matadata contained passbook deleted: %@";
      uint32_t v7 = v5;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      id v6 = "Backup matadata did not contain passbook deleted";
      uint32_t v7 = v5;
      uint32_t v8 = 2;
      goto LABEL_6;
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_retainBlock(v9);
    *(_DWORD *)uint8_t buf = 138412546;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "canAddSecureElementPassWithConfiguration: called with configuration: %@ completion: %@", buf, 0x16u);
  }
  if (v9)
  {
    if (v8)
    {
      [v8 updateAllowManagedAppleIDWithEntitlements:self->_whitelist];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10007D724;
      v18[3] = &unk_100732000;
      id v19 = v8;
      id v20 = self;
      id v21 = v9;
      BOOL v22 = v6;
      id v12 = objc_retainBlock(v18);
      id v13 = v12;
      if (v6)
      {
        ((void (*)(void *))v12[2])(v12);
      }
      else
      {
        id v15 = PDDefaultQueue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10007DAB4;
        block[3] = &unk_10072F788;
        id v17 = v13;
        dispatch_async(v15, block);
      }
      id v14 = v19;
    }
    else
    {
      id v14 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:0];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v14);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 canAddCarKeyPassWithConfiguration:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (v6)
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "canAddCarKeyPassWithConfiguration: synchronous not supported.", buf, 2u);
      }
    }
    else
    {
      id v11 = PDDefaultQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007DBEC;
      block[3] = &unk_10072E9D8;
      void block[4] = self;
      id v13 = v8;
      id v14 = v9;
      dispatch_async(v11, block);
    }
  }
}

- (void)canAddPushablePassWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint32_t v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || [(PKEntitlementWhitelist *)self->_whitelist shareableCredentialProvisioning])
    {
      [(PDPushProvisioningManager *)self->_pushProvisioningManager isPushProvisioningSupportedForConfiguration:v6 completion:v7];
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is missing entitlement to support sharing secure element passes.", v10, 2u);
      }

      id v9 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v7[2](v7, 0, v9);
    }
  }
}

- (void)canAddClassicApplePayCredentialWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = objc_alloc_init((Class)PKProvisioningRequirementOracle);
    id v9 = [v8 requirementsForAddSecureElementPassConfiguration:v7];

    id v10 = [v8 recoverableRequirements];
    id v11 = [v9 requirementsByRemovingRequirements:v10];

    provisioningRequirementsChecker = self->_provisioningRequirementsChecker;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007DE34;
    v13[3] = &unk_100732028;
    void v13[4] = self;
    id v14 = v6;
    [(PDProvisioningRequirementsChecker *)provisioningRequirementsChecker meetsWithRequirementsContainer:v11 completion:v13];
  }
}

- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 allowManagedAppleID] != (id)1)
    {
      id v8 = +[PKAppleAccountManager sharedInstance];
      id v9 = [v8 appleAccountInformation];
      unsigned int v10 = [v9 isManagedAppleAccount];

      if (v10)
      {
        id v11 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = 0;
          id v12 = "Apple account is MAID and app is missing MAID entitlment";
          id v13 = (uint8_t *)&v16;
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) == 0
      && ![(PKEntitlementWhitelist *)self->_whitelist secureElementPassProvisioning])
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = 0;
        id v12 = "Client is missing entitlement to add a car key";
        id v13 = (uint8_t *)&v15;
        goto LABEL_11;
      }
LABEL_12:

      id v14 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);

      goto LABEL_13;
    }
    [(PDCarKeyRequirementsChecker *)self->_carKeyRequirementsChecker canAddCarKeyPassWithConfiguration:v6 completion:v7];
  }
LABEL_13:
}

- (void)canAddHomeKeyWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10007E460;
    v24[3] = &unk_100732050;
    id v9 = v7;
    id v25 = v9;
    unsigned int v10 = objc_retainBlock(v24);
    id v11 = +[PKAppleAccountManager sharedInstance];
    id v12 = [v11 appleAccountInformation];
    if ([v12 isManagedAppleAccount])
    {
      unsigned __int8 v13 = [(PKEntitlementWhitelist *)self->_whitelist secureElementPassProvisioningForMAIDs];

      if ((v13 & 1) == 0)
      {
        id v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint8_t buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Apple account is MAID and app is missing MAID entitlment", buf, 2u);
        }

        __int16 v15 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
        ((void (*)(void *, void, const __CFString *, void *))v10[2])(v10, 0, @"missing proper entitlement", v15);

        goto LABEL_24;
      }
    }
    else
    {
    }
    if (([(PKEntitlementWhitelist *)self->_whitelist passesAddUnsigned] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0)
    {
      if (PKIsPhone() & 1) != 0 || (PKIsWatch())
      {
        if (PKNearFieldSupportsSimultaneousRequestRouting())
        {
          if (+[PKWalletVisibility isWalletRestricted])
          {
            ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])(v10, 4, @"wallet is restricted", 0);
          }
          else if (PKIsBeneficiaryAccount())
          {
            ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])(v10, 6, @"is beneficiary account", 0);
          }
          else if (PKPasscodeEnabled())
          {
            __int16 v16 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServicesCoordinator sharedWebService];
            id v17 = [v16 _appleAccountInformation];

            if ([v17 aidaAccountAvailable])
            {
              id v18 = PDDefaultQueue();
              v19[0] = _NSConcreteStackBlock;
              v19[1] = 3221225472;
              v19[2] = sub_10007E5D8;
              v19[3] = &unk_100732118;
              void v19[4] = self;
              id v21 = v10;
              id v20 = v6;
              id v22 = v9;
              dispatch_async(v18, v19);
            }
            else
            {
              ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])(v10, 8, @"no icloud", 0);
            }
          }
          else
          {
            ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])(v10, 7, @"passcode not set", 0);
          }
        }
        else
        {
          ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])(v10, 2, @"unsupported device", 0);
        }
      }
      else
      {
        ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])(v10, 1, @"unsupported device family", 0);
      }
    }
    else
    {
      ((void (*)(void *, void, const __CFString *, void))v10[2])(v10, 0, @"missing proper entitlement", 0);
    }
LABEL_24:
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 meetsProvisioningRequirements:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
    || ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0)
  {
    provisioningRequirementsChecker = self->_provisioningRequirementsChecker;
    if (provisioningRequirementsChecker)
    {
      if (v6)
      {
        [(PDProvisioningRequirementsChecker *)provisioningRequirementsChecker meetsWithRequirementsContainer:v8 completion:v9];
      }
      else
      {
        unsigned __int8 v13 = PDDefaultQueue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10007EDC8;
        block[3] = &unk_10072E9D8;
        void block[4] = self;
        id v15 = v8;
        id v16 = v9;
        dispatch_async(v13, block);
      }
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
      }

      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    }
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting to call meetsProvisioningRequirements, but missing proper entitlement.", buf, 2u);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 generateTransactionKeyWithReaderIdentifier:(id)a4 readerPublicKey:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  unsigned __int8 v12 = [(PKEntitlementWhitelist *)self->_whitelist passesAddUnsigned];
  unsigned __int8 v13 = PKLogFacilityTypeGetObject();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "GenerateTransactionKeyWithReaderIdentifier starting...", buf, 2u);
    }

    id v15 = PDDefaultQueue();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10007EF98;
    v16[3] = &unk_100730578;
    void v16[4] = self;
    id v17 = v9;
    id v18 = v10;
    id v19 = v11;
    dispatch_async(v15, v16);
  }
  else
  {
    if (v14)
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to call generateTransactionKeyWithReaderIdentifier, but missing proper entitlement.", buf, 2u);
    }

    if (v11) {
      (*((void (**)(id, void, void, void, void, void))v11 + 2))(v11, 0, 0, 0, 0, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 configureHomeAuxiliaryCapabilitiesForSerialNumber:(id)a4 homeIdentifier:(id)a5 fromUnifiedAccessDescriptor:(id)a6 andAliroDescriptor:(id)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  unsigned __int8 v18 = [(PKEntitlementWhitelist *)self->_whitelist passesAddUnsigned];
  id v19 = PKLogFacilityTypeGetObject();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ConfigureHomeAuxiliaryCapabilitiesForSerialNumber starting...", buf, 2u);
    }

    id v21 = PDDefaultQueue();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10007F480;
    v22[3] = &unk_10072FEA8;
    void v22[4] = self;
    id v23 = v13;
    id v24 = v15;
    id v25 = v16;
    id v26 = v14;
    id v27 = v17;
    dispatch_async(v21, v22);
  }
  else
  {
    if (v20)
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Attempting to call configureHomeAuxiliaryCapabilitiesForSerialNumber, but missing proper entitlement.", buf, 2u);
    }

    if (v17) {
      (*((void (**)(id, void, void, void, void))v17 + 2))(v17, 0, 0, 0, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 fetchAppletSubCredentialForPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      unsigned __int8 v12 = PDDefaultQueue();
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10008002C;
      v14[3] = &unk_100730578;
      void v14[4] = self;
      id v15 = v9;
      id v16 = v10;
      id v17 = v11;
      dispatch_async(v12, v14);
    }
    else
    {
      id v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to call fetchTransactionKeyForPassTypeIdentifier, but missing proper entitlement.", buf, 2u);
      }

      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
  }
}

- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist shareableCredentialProvisioning])
  {
    deviceRegistrationServiceCoordinator = self->_deviceRegistrationServiceCoordinator;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000808F0;
    v11[3] = &unk_100732258;
    v11[4] = self;
    unint64_t v13 = a3;
    id v12 = v6;
    [(PDDeviceRegistrationServiceCoordinator *)deviceRegistrationServiceCoordinator performDeviceRegistrationForReason:@"push provisioning nonces" brokerURL:0 action:1 forceApplePayRegister:0 forcePeerPaymentRegister:0 completion:v11];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 136315138;
      id v17 = "-[PDPassLibrary pushProvisioningNoncesWithCredentialCount:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v6)
    {
      NSErrorUserInfoKey v14 = NSDebugDescriptionErrorKey;
      CFStringRef v15 = @"client is not entitled";
      id v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      id v10 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:v9];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 configurePushProvisioningConfiguration:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100080AA0;
  v9[3] = &unk_100732280;
  id v10 = a5;
  id v8 = v10;
  [(PDPassLibrary *)self usingSynchronousProxy:v6 configurePushProvisioningConfigurationV2:a4 completion:v9];
}

- (void)usingSynchronousProxy:(BOOL)a3 configurePushProvisioningConfigurationV2:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist shareableCredentialProvisioning] & 1) != 0|| ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      id v9 = [v7 secureElementPassConfiguration];
      [v9 updateAllowManagedAppleIDWithEntitlements:self->_whitelist];

      [(PDPushProvisioningManager *)self->_pushProvisioningManager configurePushProvisioningConfiguration:v7 completion:v8];
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint8_t buf = 136315138;
        id v16 = "-[PDPassLibrary usingSynchronousProxy:configurePushProvisioningConfigurationV2:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is missing shareable entitled for method: %s", buf, 0xCu);
      }

      NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
      CFStringRef v14 = @"client is not entitled";
      id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v12 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:v11];
      v8[2](v8, 0, v12);
    }
  }
}

- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (v7)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist carKeyPassThroughAccess])
    {
      [(PDAppletSubcredentialManager *)self->_subcredentialManager startVehicleConnectionSessionWithPassUniqueIdentifier:v6 completion:v7];
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        id v10 = "-[PDPassLibrary startVehicleConnectionSessionWithPassUniqueIdentifier:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is missing shareable entitled for method: %s", (uint8_t *)&v9, 0xCu);
      }

      v7[2](v7, 0);
    }
  }
}

- (void)sendRKEPassThroughMessage:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist carKeyPassThroughAccess])
  {
    [(PDAppletSubcredentialManager *)self->_subcredentialManager sendRKEPassThroughData:v8 forSessionIdentifier:v9 withCompletion:v10];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 136315138;
      id v17 = "-[PDPassLibrary sendRKEPassThroughMessage:forSessionIdentifier:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is missing shareable entitled for method: %s", buf, 0xCu);
    }

    NSErrorUserInfoKey v14 = NSDebugDescriptionErrorKey;
    CFStringRef v15 = @"client is not entitled";
    id v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    NSErrorUserInfoKey v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:v12];
    v10[2](v10, 0, v13);
  }
}

- (void)invalidateVehicleConnectionSessionIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist carKeyPassThroughAccess])
    {
      [(PDAppletSubcredentialManager *)self->_subcredentialManager invalidateVehicleConnectionSessionForIdentifier:v4];
    }
    else
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        id v7 = "-[PDPassLibrary invalidateVehicleConnectionSessionIdentifier:]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is missing shareable entitled for method: %s", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 requestIssuerBoundPassesWithBindingWithData:(id)a4 automaticallyProvision:(BOOL)a5 withCompletion:(id)a6
{
  id v9 = a6;
  id v10 = v9;
  if (v9)
  {
    issuerBindingManager = self->_issuerBindingManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100081154;
    v12[3] = &unk_1007322D0;
    BOOL v14 = a5;
    void v12[4] = self;
    id v13 = v9;
    [(PDIssuerBindingManager *)issuerBindingManager requestIssuerBoundPassesWithBindingWithData:a4 withCompletion:v12];
  }
}

- (void)presentIssuerBindingFlowForIssuerData:(id)a3 signature:(id)a4 orientation:(id)a5
{
  if (a3)
  {
    if (a4) {
      sub_100207E80((uint64_t)self->_remoteInterfacePresenter, a3, a4, a5, 0);
    }
  }
}

- (void)supportsSearchForPassUniqueID:(id)a3 completion:(id)a4
{
  id v25 = a3;
  int v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    if (![(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
    {
      BOOL v11 = 0;
LABEL_26:
      v6[2](v6, v11);
      goto LABEL_27;
    }
    id v7 = [(PDDatabaseManager *)self->_databaseManager associatedAccountIdentifierForPassWithUniqueIdentifier:v25];
    databaseManager = self->_databaseManager;
    if (v7)
    {
      id v9 = [(PDDatabaseManager *)databaseManager dbAccountWithIdentifier:v7];
      if ([v9 feature] != (id)3 && objc_msgSend(v9, "feature") != (id)4)
      {
        BOOL v10 = (char *)[v9 state] - 1 < (char *)2;
LABEL_22:

        if (v10)
        {
          id v24 = [(PDDatabaseManager *)self->_databaseManager primaryPaymentApplicationForPassUniqueIdentifier:v25];
          BOOL v11 = (char *)[v24 state] - 9 < (char *)0xFFFFFFFFFFFFFFFELL;
        }
        else
        {
          BOOL v11 = 0;
        }

        goto LABEL_26;
      }
LABEL_12:
      BOOL v10 = 0;
      goto LABEL_22;
    }
    id v9 = [(PDDatabaseManager *)databaseManager dbPeerPaymentAccount];
    id v12 = [v9 associatedPassUniqueID];
    id v13 = v25;
    id v14 = v12;
    if (v14 == v13)
    {
    }
    else
    {
      CFStringRef v15 = v14;
      if (!v13 || !v14)
      {

        BOOL v10 = 0;
LABEL_21:

        goto LABEL_22;
      }
      unsigned int v16 = [v13 isEqualToString:v14];

      if (!v16) {
        goto LABEL_12;
      }
    }
    id v17 = (char *)[v9 state] - 1;
    unsigned __int8 v18 = self->_databaseManager;
    id v19 = [v9 associatedPassUniqueID];
    BOOL v20 = [(PDDatabaseManager *)v18 passWithUniqueIdentifier:v19];
    CFStringRef v15 = [v20 paymentPass];

    id v21 = [v9 peerPaymentAccount];
    uint64_t v22 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();

    BOOL v10 = v22 != 1 && (unint64_t)v17 < 2;
    goto LABEL_21;
  }
LABEL_27:
}

- (void)contactlessInterfaceDidPresentFromSource:(int64_t)a3
{
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist paymentPresentation])
  {
    id v5 = [(PDPassLibrary *)self remoteObjectProxy];
    [v5 contactlessInterfaceDidPresentFromSource:a3];
  }
}

- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3
{
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist paymentPresentation])
  {
    id v5 = [(PDPassLibrary *)self remoteObjectProxy];
    [v5 contactlessInterfaceDidDismissFromSource:a3];
  }
}

- (void)sessionDidChangeConnectionStatus:(int64_t)a3
{
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist carKeyPassThroughAccess])
  {
    id v5 = [(PDPassLibrary *)self remoteObjectProxy];
    [v5 vehicleConnectionDidUpdateConnectionState:a3];
  }
}

- (void)sessionDidReceiveData:(id)a3
{
  id v5 = a3;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist carKeyPassThroughAccess])
  {
    id v4 = [(PDPassLibrary *)self remoteObjectProxy];
    [v4 vehicleConnectionDidRecievePassthroughData:v5];
  }
}

- (void)issuerBindingFlowAuthenticationPerformed
{
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v3 = [(PDPassLibrary *)self remoteObjectProxy];
    [v3 issuerBindingAuthenticationOccured];
  }
}

- (BOOL)_entitledForObject:(id)a3 forActions:(unint64_t)a4
{
  id v6 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      id v9 = [v8 passTypeIdentifier];
      BOOL v10 = [v8 teamID];
      BOOL v11 = [v8 associatedPassTypeIdentifiers];
      if ([v8 passType] == (id)1)
      {
        id v12 = [v8 associatedApplicationIdentifiers];
      }
      else
      {
        id v12 = 0;
      }
      unsigned __int8 v7 = [(PKEntitlementWhitelist *)self->_whitelist entitledToPerformPassAction:a4 passTypeID:v9 teamID:v10 associatedPassTypeIdentifiers:v11 associatedApplicationIdentifiers:v12];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (void)_getPassWithUniqueID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000819F4;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)_addPasses:(id)a3 withCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100081AC4;
  v8[3] = &unk_100731B28;
  id v9 = a3;
  id v6 = v9;
  id v7 = (void (**)(id, void))a4;
  [(PDPassLibrary *)self _addPassesWithEnumerator:v8];
  v7[2](v7, 0);
}

- (unint64_t)_addPassesWithEnumerator:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100081CEC;
  v10[3] = &unk_100732320;
  void v10[4] = self;
  void v10[5] = &v11;
  v10[6] = &v15;
  v4[2](v4, v10);
  if (*((unsigned char *)v12 + 24))
  {
    id v6 = objc_alloc((Class)PKTPSDiscoverabilitySignal);
    id v7 = [v6 initWithIdentifier:PKTPSDiscoverabilitySignalIdentifierPass bundleIdentifier:PKServiceBundleIdentifier context:PKTPSDiscoverabilitySignalContextPassAdded];
    [v7 donateSignalWithCompletion:&stru_100732340];
  }
  unint64_t v8 = v16[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

- (BOOL)_writePass:(id)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v5 = a3;
  uint64_t v13 = v5;
  char v14 = a4;
  PKTimeToPerformBlock();
  if (*((unsigned char *)v16 + 24))
  {
    uint64_t v7 = v6;
    unint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(v5, "uniqueID", _NSConcreteStackBlock, 3221225472, sub_100082168, &unk_100732368, self, v5, &v15, v14);
      *(_DWORD *)uint8_t buf = 138543618;
      BOOL v20 = v9;
      __int16 v21 = 2050;
      uint64_t v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDPassLibrary: wrote pass %{public}@ in %{public}f seconds", buf, 0x16u);
    }
    BOOL v10 = *((unsigned char *)v16 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)_writePass:(id)a3 withSettings:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [(PDPassLibrary *)self _writePass:v8 error:a5];
  if (v9)
  {
    databaseManager = self->_databaseManager;
    uint64_t v11 = [v8 uniqueID];
    [(PDDatabaseManager *)databaseManager updateSettings:a4 forPassWithUniqueIdentifier:v11];
  }
  return v9;
}

- (void)getDiffForPassUpdateUserNotificationWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    userNotificationManager = self->_userNotificationManager;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100082354;
    v10[3] = &unk_100732390;
    id v11 = v7;
    [(PDUserNotificationManager *)userNotificationManager userNotificationWithIdentifier:v6 completion:v10];
  }
  else
  {
    BOOL v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100515004();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)introduceDatabaseIntegrityProblem
{
  id v3 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008243C;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)updateIngestedDate:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082590;
  block[3] = &unk_10072E238;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)noteAppleAccountChanged:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008276C;
  v12[3] = &unk_10072E9D8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7A4;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)noteACAccountChanged:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100082D3C;
  v12[3] = &unk_10072E9D8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7A4;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)shuffleGroups:(int)a3
{
  id v5 = PDDefaultQueue();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100082EB8;
  v6[3] = &unk_1007323B8;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

- (void)issueWalletUserNotificationWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 customActionRoute:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v14 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100083054;
    block[3] = &unk_10072FF48;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    BOOL v20 = self;
    dispatch_async(v14, block);
  }
}

- (void)pendingUserNotificationsWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000831C0;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100083314;
    block[3] = &unk_10072E238;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)removeAllScheduledActivities
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v2 = PDScheduledActivityClients();
  id v3 = (char *)[v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v7 = PDScheduledActivitiesForClient();
        id v8 = (char *)[v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v13;
          do
          {
            id v11 = 0;
            do
            {
              if (*(void *)v13 != v10) {
                objc_enumerationMutation(v7);
              }
              PDScheduledActivityRemove();
              ++v11;
            }
            while (v9 != v11);
            id v9 = (char *)[v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v4);
      id v4 = (char *)[v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }
}

- (void)forceImmediateRevocationCheck
{
  id v3 = dispatch_get_global_queue(21, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000835A4;
  v5[3] = &unk_10072E1E8;
  v5[4] = self;
  id v4 = v5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7A4;
  block[3] = &unk_10072F788;
  id v7 = v4;
  dispatch_async(v3, block);
}

- (void)spotlightReindexAllContentWithAcknowledgement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100083668;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)spotlightReindexContentWithIdentifiers:(id)a3 acknowledgement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000837F4;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)spotlightResetWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008395C;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)spotlightStatusWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100083BB8;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (PDPaymentWebServiceCoordinator)paymentWebServicesCoordinator
{
  return self->_paymentWebServicesCoordinator;
}

- (PDWebServicesCoordinator)webServicesCoordinator
{
  return self->_webServicesCoordinator;
}

- (PDCardFileManager)cardFileManager
{
  return self->_cardFileManager;
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (PDExpressPassManager)expressPassManager
{
  return self->_expressPassManager;
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (PDRelevantPassProvider)relevantPassProvider
{
  return self->_relevantPassProvider;
}

- (PKUsageNotificationServer)usageNotificationServer
{
  return self->_usageNotificationServer;
}

- (PKIDSManager)idsManager
{
  return self->_idsManager;
}

- (PDSpotlightIndexer)spotlightIndexer
{
  return self->_spotlightIndexer;
}

- (PDExpressTransitUpgradeController)expressUpgradeController
{
  return self->_expressUpgradeController;
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (PDAppletSubcredentialManager)subcredentialManager
{
  return self->_subcredentialManager;
}

- (PDCarKeyRequirementsChecker)carKeyRequirementsChecker
{
  return self->_carKeyRequirementsChecker;
}

- (PDPushProvisioningManager)pushProvisioningManager
{
  return self->_pushProvisioningManager;
}

- (PDDefaultPassManager)defaultPassManager
{
  return self->_defaultPassManager;
}

- (PDPassDynamicStateManager)dynamicStateManager
{
  return self->_dynamicStateManager;
}

- (PDPassLiveRenderManager)passLiveRenderManager
{
  return self->_passLiveRenderManager;
}

- (PDISO18013Manager)isoManager
{
  return self->_isoManager;
}

- (PDIssuerBindingManager)issuerBindingManager
{
  return self->_issuerBindingManager;
}

- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager
{
  return self->_auxiliaryCapabilityManager;
}

- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator
{
  return self->_deviceRegistrationServiceCoordinator;
}

- (PDProvisioningRequirementsChecker)provisioningRequirementsChecker
{
  return self->_provisioningRequirementsChecker;
}

- (PDPassLibraryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDPassLibraryDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provisioningRequirementsChecker, 0);
  objc_storeStrong((id *)&self->_deviceRegistrationServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_auxiliaryCapabilityManager, 0);
  objc_storeStrong((id *)&self->_issuerBindingManager, 0);
  objc_storeStrong((id *)&self->_isoManager, 0);
  objc_storeStrong((id *)&self->_passLiveRenderManager, 0);
  objc_storeStrong((id *)&self->_dynamicStateManager, 0);
  objc_storeStrong((id *)&self->_defaultPassManager, 0);
  objc_storeStrong((id *)&self->_pushProvisioningManager, 0);
  objc_storeStrong((id *)&self->_carKeyRequirementsChecker, 0);
  objc_storeStrong((id *)&self->_subcredentialManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_expressUpgradeController, 0);
  objc_storeStrong((id *)&self->_spotlightIndexer, 0);
  objc_storeStrong((id *)&self->_idsManager, 0);
  objc_storeStrong((id *)&self->_usageNotificationServer, 0);
  objc_storeStrong((id *)&self->_relevantPassProvider, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_webServicesCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentWebServicesCoordinator, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_userNotifications, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end