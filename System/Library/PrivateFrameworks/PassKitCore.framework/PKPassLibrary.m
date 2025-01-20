@interface PKPassLibrary
+ (BOOL)contactlessInterfaceCanBePresentedFromSource:(int64_t)a3;
+ (BOOL)contactlessInterfaceCanBePresentedFromSource:(int64_t)a3 deviceUILocked:(BOOL)a4;
+ (BOOL)isPassLibraryAvailable;
+ (BOOL)isSecureElementPassActivationAvailable;
+ (BOOL)isSuppressingAutomaticPassPresentation;
+ (PKPassLibrary)sharedInstance;
+ (PKSuppressionRequestToken)requestAutomaticPassPresentationSuppressionWithResponseHandler:(void *)responseHandler;
+ (id)sharedInstanceWithRemoteLibrary;
+ (void)endAutomaticPassPresentationSuppressionWithRequestToken:(PKSuppressionRequestToken)requestToken;
- (BOOL)_hasInterfaceOfType:(unint64_t)a3;
- (BOOL)_hasRemoteLibrary;
- (BOOL)_setSetting:(unint64_t)a3 enabled:(BOOL)a4 forPass:(id)a5;
- (BOOL)canAddFelicaPass;
- (BOOL)canAddPassOfType:(unint64_t)a3;
- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3;
- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3 outError:(id *)a4;
- (BOOL)canAddSecureElementPassWithPrimaryAccountIdentifier:(NSString *)primaryAccountIdentifier;
- (BOOL)containsPass:(PKPass *)pass;
- (BOOL)hasPassesInExpiredSection;
- (BOOL)hasPassesOfType:(unint64_t)a3;
- (BOOL)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webDomain:(id)a6;
- (BOOL)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webDomain:(id)a6 paymentRequestType:(id)a7 isMultiTokensRequest:(BOOL)a8;
- (BOOL)hasSecureElementPassesOfType:(int64_t)a3;
- (BOOL)iPadSupportsPasses;
- (BOOL)isPassbookVisible;
- (BOOL)isPaymentPassActivationAvailable;
- (BOOL)isRemovingPassesOfType:(unint64_t)a3;
- (BOOL)isWatchIssuerAppProvisioningSupported;
- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4;
- (BOOL)migrateDataWithDidRestoreFromBackup:(BOOL)a3;
- (BOOL)passbookHasBeenDeleted;
- (BOOL)replacePassWithPass:(PKPass *)pass;
- (BOOL)resetApplePayWithDiagnosticReason:(id)a3;
- (BOOL)resetSettingsForPass:(id)a3;
- (BOOL)sendRKEPassThroughMessage:(id)a3 forSessionIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setAutomaticPresentationEnabled:(BOOL)a3 forPass:(id)a4;
- (BOOL)setAutomaticUpdatesEnabled:(BOOL)a3 forPass:(id)a4;
- (BOOL)setNotificationServiceUpdatesEnabled:(BOOL)a3 forPass:(id)a4;
- (BOOL)setShowInLockScreenEnabled:(BOOL)a3 forPass:(id)a4;
- (BOOL)setSuppressNotificationsEnabled:(BOOL)a3 forPass:(id)a4;
- (BOOL)setSuppressPromotionsEnabled:(BOOL)a3 forPass:(id)a4;
- (BOOL)supportsSearchForPassUniqueID:(id)a3;
- (NSArray)passes;
- (NSArray)passesOfType:(PKPassType)passType;
- (NSArray)remotePaymentPasses;
- (NSArray)remoteSecureElementPasses;
- (PKPass)passWithPassTypeIdentifier:(NSString *)identifier serialNumber:(NSString *)serialNumber;
- (PKPassLibrary)init;
- (PKPassLibrary)initWithMachServiceName:(id)a3 resumeNotificationName:(id)a4 interfaceType:(unint64_t)a5;
- (PKPassLibraryDelegate)delegate;
- (id)_copyPassesOfStyles:(unint64_t)a3 withRetries:(unint64_t)a4;
- (id)_copyPassesOfType:(unint64_t)a3 withRetries:(unint64_t)a4;
- (id)_copyPassesWithRetries:(unint64_t)a3;
- (id)_defaultPaymentPassForPaymentRequest:(id)a3;
- (id)_extendedRemoteObjectProxy;
- (id)_extendedRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)_extendedRemoteObjectProxyWithFailureHandler:(id)a3;
- (id)_filterPeerPaymentPass:(id)a3 request:(id)a4;
- (id)_inAppRemoteObjectProxy;
- (id)_inAppRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)_inAppRemoteObjectProxyWithFailureHandler:(id)a3;
- (id)_initWithRemote:(id)a3;
- (id)_remoteLibrary;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (id)_sortedPaymentPassesForPaymentRequest:(id)a3;
- (id)_sortedPaymentPassesForPaymentRequest:(id)a3 additionalPaymentPasses:(id)a4;
- (id)_synchronousExtendedRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)_synchronousInAppRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)archiveForObjectWithUniqueID:(id)a3;
- (id)backupMetadata;
- (id)cachedImageSetForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6;
- (id)contentForUniqueID:(id)a3;
- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4 objectUniqueIdentifier:(id)a5;
- (id)dataForBundleResources:(id)a3 objectUniqueIdentifier:(id)a4;
- (id)defaultPaymentPassesWithRemotePasses:(BOOL)a3;
- (id)delegates;
- (id)diffForPassUpdateUserNotificationWithIdentifier:(id)a3;
- (id)dynamicStateForPassUniqueID:(id)a3;
- (id)expressFelicaTransitPasses;
- (id)imageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6;
- (id)inAppPaymentPassesForPaymentRequest:(id)a3;
- (id)inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5;
- (id)inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5;
- (id)manifestHashForPassWithUniqueID:(id)a3;
- (id)passForProvisioningCredentialHash:(id)a3;
- (id)passLocalizedStringForKey:(id)a3 uniqueID:(id)a4;
- (id)passUniqueIDsForAssociatedApplicationIdentifier:(id)a3;
- (id)passWithDPANIdentifier:(id)a3;
- (id)passWithFPANIdentifier:(id)a3;
- (id)passWithUniqueID:(id)a3;
- (id)passesOfStyles:(unint64_t)a3;
- (id)passesPendingActivation;
- (id)passesWithReaderIdentifier:(id)a3;
- (id)paymentPassesWithLocallyStoredValue;
- (id)peerPaymentPassUniqueID;
- (int64_t)_currentNotificationCountForIdentifier:(id)a3;
- (unint64_t)countOfPasses;
- (unint64_t)countPassesOfType:(unint64_t)a3;
- (unint64_t)estimatedTimeToResetApplePay;
- (unint64_t)setLiveRenderingEnabled:(BOOL)a3 forPassUniqueID:(id)a4;
- (void)_activateSecureElementPass:(id)a3 withActivationCode:(id)a4 activationData:(id)a5 completion:(id)a6;
- (void)_applyDataAccessorToObject:(id)a3;
- (void)_applyDataAccessorToObjects:(id)a3;
- (void)_fetchContentForUniqueID:(id)a3 usingSynchronousProxy:(BOOL)a4 withCompletion:(id)a5;
- (void)_fetchImageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 usingSynchronousProxy:(BOOL)a7 withCompletion:(id)a8;
- (void)_fetchImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 usingSynchronousProxy:(BOOL)a7 withCompletion:(id)a8;
- (void)_getGroupsControllerSnapshotWithOptions:(id)a3 synchronously:(BOOL)a4 retries:(unint64_t)a5 handler:(id)a6;
- (void)_getPassesAndCatalogOfPassTypes:(unint64_t)a3 synchronously:(BOOL)a4 limitResults:(BOOL)a5 withRetries:(unint64_t)a6 handler:(id)a7;
- (void)_postLibraryChangeWithUserInfo:(id)a3;
- (void)activatePaymentPass:(PKPaymentPass *)paymentPass withActivationCode:(NSString *)activationCode completion:(void *)completion;
- (void)activateSecureElementPass:(PKSecureElementPass *)secureElementPass withActivationData:(NSData *)activationData completion:(void *)completion;
- (void)addDelegate:(id)a3;
- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5;
- (void)addPasses:(NSArray *)passes withCompletionHandler:(void *)completion;
- (void)addPassesContainer:(id)a3 withCompletionHandler:(id)a4;
- (void)addPassesWithData:(id)a3 withCompletionHandler:(id)a4;
- (void)addPassesWithIngestionPayloads:(id)a3 withCompletionHandler:(id)a4;
- (void)addUnsignedPassesAtURLs:(id)a3 withCompletionHandler:(id)a4;
- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3;
- (void)badgeCountItemsWithCompletion:(id)a3;
- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4;
- (void)canAddSecureElementPassWithConfiguration:(id)a3 completion:(id)a4;
- (void)canPresentPaymentRequest:(id)a3 completion:(id)a4;
- (void)catalogChanged:(id)a3 withNewPasses:(id)a4;
- (void)catalogChanged:(id)a3 withNewPasses:(id)a4 states:(id)a5;
- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6;
- (void)checkForTransitNotification;
- (void)configureHomeAuxiliaryCapabilitiesForSerialNumber:(id)a3 homeIdentifier:(id)a4 fromUnifiedAccessDescriptor:(id)a5 andAliroDescriptor:(id)a6 completion:(id)a7;
- (void)configurePushProvisioningConfiguration:(id)a3 completion:(id)a4;
- (void)configurePushProvisioningConfigurationV2:(id)a3 completion:(id)a4;
- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3;
- (void)contactlessInterfaceDidPresentFromSource:(int64_t)a3;
- (void)containsPassWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5;
- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7;
- (void)dealloc;
- (void)deleteKeyMaterialForSubCredentialId:(id)a3;
- (void)enableExpressForPassWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5;
- (void)enabledValueAddedServicePassesWithCompletion:(id)a3;
- (void)encryptedServiceProviderDataForSecureElementPass:(PKSecureElementPass *)secureElementPass completion:(void *)completion;
- (void)fetchAppletSubCredentialForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5;
- (void)fetchContentForUniqueID:(id)a3 withCompletion:(id)a4;
- (void)fetchCurrentRelevantPassInfo:(id)a3;
- (void)fetchHasCandidatePasses:(id)a3;
- (void)fetchImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 withCompletion:(id)a7;
- (void)fetchTransactionKeyForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5;
- (void)forceImmediateRevocationCheck;
- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4;
- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateTransactionKeyWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 completion:(id)a5;
- (void)getContainmentStatusAndSettingsForPass:(id)a3 withHandler:(id)a4;
- (void)getGroupsControllerSnapshotWithOptions:(id)a3 synchronously:(BOOL)a4 handler:(id)a5;
- (void)getMetadataForFieldWithProperties:(id)a3 withHandler:(id)a4;
- (void)getPassesAndCatalog:(BOOL)a3 synchronously:(BOOL)a4 withHandler:(id)a5;
- (void)getPassesAndCatalog:(BOOL)a3 withHandler:(id)a4;
- (void)getPassesAndCatalogOfPassTypes:(unint64_t)a3 synchronously:(BOOL)a4 withHandler:(id)a5;
- (void)getPassesWithUniqueIdentifiers:(id)a3 handler:(id)a4;
- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 isMultiTokensRequest:(BOOL)a6 withHandler:(id)a7;
- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8;
- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 withHandler:(id)a6;
- (void)hasInAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)hasInAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)introduceDatabaseIntegrityProblem;
- (void)invalidateVehicleConnectionSessionIdentifier:(id)a3;
- (void)issueWalletUserNotificationWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 customActionRoute:(id)a6;
- (void)issuerBindingAuthenticationOccured;
- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5;
- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4;
- (void)noteACAccountChanged:(id)a3;
- (void)noteAppleAccountChanged:(id)a3;
- (void)noteObjectSharedWithUniqueID:(id)a3;
- (void)notifyPassUsedWithIdentifier:(id)a3 fromSource:(int64_t)a4;
- (void)openPaymentSetup;
- (void)openPaymentSetupForMerchantIdentifier:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)passAdded:(id)a3;
- (void)passRecovered:(id)a3;
- (void)passRemoved:(id)a3;
- (void)passUpdated:(id)a3;
- (void)passesWithSearchableTransactions:(id)a3;
- (void)paymentPassWithAssociatedAccountIdentifier:(id)a3 completion:(id)a4;
- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4;
- (void)pendingUserNotificationsWithIdentifier:(id)a3 completion:(id)a4;
- (void)postUpgradedPassNotificationForMarket:(id)a3 passUniqueID:(id)a4;
- (void)postUpgradesAvailableNotificationForMarket:(id)a3 passUniqueID:(id)a4;
- (void)prepareForBackupRestoreWithExistingPreferencesData:(id)a3;
- (void)prepareForBackupRestoreWithSafeHavenPath:(id)a3;
- (void)presentContactlessInterfaceForDefaultPassFromSource:(int64_t)a3 completion:(id)a4;
- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 completion:(id)a5;
- (void)presentIssuerBindingFlowForIssuerData:(id)a3 signature:(id)a4 orientation:(id)a5;
- (void)presentPaymentSetupRequest:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)presentSecureElementPass:(PKSecureElementPass *)pass;
- (void)presentWalletWithRelevantPassUniqueID:(id)a3;
- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4;
- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4;
- (void)recomputeRelevantPassesWithSearchMode:(int64_t)a3;
- (void)recoverPassWithUniqueID:(id)a3;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
- (void)removeAllScheduledActivities;
- (void)removeDelegate:(id)a3;
- (void)removePass:(PKPass *)pass;
- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4;
- (void)removePasses:(id)a3;
- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4;
- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4 completion:(id)a5;
- (void)removePassesWithUniqueIDs:(id)a3 diagnosticReason:(id)a4;
- (void)replaceUnsignedPassAtURL:(id)a3 withCompletionHandler:(id)a4;
- (void)requestIssuerBoundPassesWithBindingWithData:(id)a3 automaticallyProvision:(BOOL)a4 withCompletion:(id)a5;
- (void)requestPersonalizationOfPassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8;
- (void)requestUpdateOfObjectWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)rescheduleCommutePlanRenewalReminderForPassWithUniqueID:(id)a3;
- (void)resetApplePayWithDiagnosticReason:(id)a3 completion:(id)a4;
- (void)sendUserEditedCatalog:(id)a3;
- (void)serviceProviderDataForSecureElementPass:(PKSecureElementPass *)secureElementPass completion:(void *)completion;
- (void)setBackupMetadata:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSortingState:(int64_t)a3 forObjectWithUniqueID:(id)a4 withCompletion:(id)a5;
- (void)shuffleGroups:(int)a3;
- (void)signData:(NSData *)signData withSecureElementPass:(PKSecureElementPass *)secureElementPass completion:(void *)completion;
- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9;
- (void)sortedTransitPassesForAppletDataFormat:(id)a3 completion:(id)a4;
- (void)sortedTransitPassesForTransitNetworkIdentifiersWithCompletion:(id)a3;
- (void)spotlightReindexAllContentWithAcknowledgement:(id)a3;
- (void)spotlightReindexContentWithIdentifiers:(id)a3 acknowledgement:(id)a4;
- (void)spotlightResetWithCompletion:(id)a3;
- (void)spotlightStatusWithCompletion:(id)a3;
- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)unexpiredPassesOrderedByGroup:(id)a3;
- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4;
- (void)updateIngestedDate:(id)a3 forPassWithUniqueID:(id)a4;
- (void)updateSettings:(unint64_t)a3 forObjectWithUniqueID:(id)a4;
- (void)vehicleConnectionDidRecievePassthroughData:(id)a3;
- (void)vehicleConnectionDidUpdateConnectionState:(int64_t)a3;
@end

@implementation PKPassLibrary

uint64_t __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke_199(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __36__PKPassLibrary_contentForUniqueID___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 invalidate];
}

void __66__PKPassLibrary_imageSetForUniqueID_ofType_displayProfile_suffix___block_invoke(uint64_t a1, void *a2)
{
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_8;
  aBlock[3] = &unk_1E56DE4F0;
  uint64_t v23 = *(void *)(a1 + 64);
  id v4 = v3;
  aBlock[4] = *(void *)(a1 + 32);
  id v22 = v4;
  v5 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_9;
  v19[3] = &unk_1E56D8388;
  id v6 = v5;
  id v20 = v6;
  v7 = _Block_copy(v19);
  v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 72)) {
    [v8 _synchronousExtendedRemoteObjectProxyWithErrorHandler:v7];
  }
  else {
  v9 = [v8 _extendedRemoteObjectProxyWithErrorHandler:v7];
  }
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_10;
  v16[3] = &unk_1E56DE518;
  char v18 = v10;
  v16[4] = *(void *)(a1 + 32);
  id v17 = v6;
  id v15 = v6;
  [v9 usingSynchronousProxy:v10 getImageSetContainerForUniqueID:v11 type:v13 withDisplayProfile:v12 suffix:v14 handler:v16];
}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)contentForUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__11;
  uint64_t v12 = __Block_byref_object_dispose__11;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PKPassLibrary_contentForUniqueID___block_invoke;
  v7[3] = &unk_1E56DE3D8;
  v7[4] = &v8;
  [(PKPassLibrary *)self _fetchContentForUniqueID:v4 usingSynchronousProxy:1 withCompletion:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)imageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  id v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__PKPassLibrary_imageSetForUniqueID_ofType_displayProfile_suffix___block_invoke;
  v15[3] = &unk_1E56DE4A0;
  v15[4] = &v16;
  [(PKPassLibrary *)self _fetchImageSetContainerForUniqueID:v10 ofType:a4 displayProfile:v11 suffix:v12 usingSynchronousProxy:1 withCompletion:v15];
  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (void)_fetchContentForUniqueID:(id)a3 usingSynchronousProxy:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v9 && v10)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke;
    aBlock[3] = &unk_1E56DD260;
    SEL v22 = a2;
    id v12 = v10;
    aBlock[4] = self;
    id v21 = v12;
    id v13 = _Block_copy(aBlock);
    if ([(PKPassLibrary *)self _hasInterfaceOfType:2])
    {
      if (v6) {
        [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v13];
      }
      else {
      uint64_t v14 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v13];
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke_199;
      v18[3] = &unk_1E56DE400;
      id v15 = &v19;
      v18[4] = self;
      id v19 = v12;
      [v14 usingSynchronousProxy:v6 getContentForUniqueID:v9 withHandler:v18];
    }
    else
    {
      if (v6) {
        [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v13];
      }
      else {
      uint64_t v14 = [(PKPassLibrary *)self _remoteObjectProxyWithErrorHandler:v13];
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke_2;
      v16[3] = &unk_1E56DE400;
      id v15 = &v17;
      v16[4] = self;
      id v17 = v12;
      [v14 getContentForUniqueID:v9 handler:v16];
    }
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)_fetchImageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 usingSynchronousProxy:(BOOL)a7 withCompletion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v17)
  {
    if ([(PKPassLibrary *)self _hasInterfaceOfType:2])
    {
      if (+[PKImageSet shouldCacheForDisplayProfile:v15 imageSetType:a4])
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke;
        aBlock[3] = &unk_1E56DE4F0;
        int64_t v41 = a4;
        aBlock[4] = self;
        id v40 = v17;
        uint64_t v18 = _Block_copy(aBlock);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_4;
        v37[3] = &unk_1E56D8388;
        id v19 = v18;
        id v38 = v19;
        id v20 = _Block_copy(v37);
        if (v9) {
          [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v20];
        }
        else {
        v24 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v20];
        }
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_5;
        v34[3] = &unk_1E56DE518;
        BOOL v36 = v9;
        v34[4] = self;
        id v35 = v19;
        id v25 = v19;
        [v24 usingSynchronousProxy:v9 getImageSetContainerForUniqueID:v14 type:a4 withDisplayProfile:v15 suffix:v16 handler:v34];
      }
      else
      {
        id v21 = GenerateKeyImageSetCacheKey(a4, v15);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_7;
        v28[3] = &unk_1E56DE540;
        int64_t v32 = a4;
        v28[4] = self;
        BOOL v33 = v9;
        id v29 = v14;
        id v30 = v15;
        id v31 = v16;
        SEL v22 = _Block_copy(v28);
        uint64_t v23 = PKPassLibraryImageSetCache();
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_12;
        v26[3] = &unk_1E56DE568;
        id v27 = v17;
        [v23 retrieveItemForKey:v21 synchronous:v9 retrievalBlock:v22 deliveryBlock:v26];
      }
    }
    else
    {
      [(PKPassLibrary *)self _fetchImageSetForUniqueID:v14 ofType:a4 displayProfile:v15 suffix:v16 usingSynchronousProxy:v9 withCompletion:v17];
    }
  }
}

- (id)_synchronousExtendedRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if ([(PKPassLibrary *)self _hasInterfaceOfType:2])
  {
    id v5 = [(PKXPCService *)self->_remoteService synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F28790];
    uint64_t v8 = [(PKPassLibrary *)self description];
    [v6 raise:v7, @"%@ is not backed by an extended interface", v8 format];

    id v5 = 0;
  }

  return v5;
}

- (BOOL)_hasInterfaceOfType:(unint64_t)a3
{
  if (a3 == 1)
  {
    BOOL v4 = self->_interfaceType - 1 >= 2;
  }
  else
  {
    if (a3 == 2) {
      return self->_interfaceType == 2;
    }
    BOOL v4 = self->_interfaceType >= 3;
  }
  return !v4;
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v4 = (void *)MEMORY[0x192FDC630]();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_6;
    v7[3] = &unk_1E56D83D8;
    id v9 = *(id *)(a1 + 40);
    id v8 = v3;
    BOOL v6 = v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_3;
    block[3] = &unk_1E56D8360;
    id v11 = v6;
    dispatch_async(v5, block);
  }
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = PKPassLibraryImageSetCache();
    id v5 = [v3 imageSetHash];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_2;
    v11[3] = &unk_1E56DE428;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 48);
    id v12 = v6;
    uint64_t v13 = v7;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_3;
    v8[3] = &unk_1E56DE4C8;
    id v10 = *(id *)(a1 + 40);
    id v9 = v6;
    [v4 retrieveItemForKey:v5 synchronous:1 retrievalBlock:v11 deliveryBlock:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __69__PKPassLibrary_canAddSecureElementPassWithConfiguration_completion___block_invoke_193(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__PKPassLibrary_passWithPassTypeIdentifier_serialNumber___block_invoke(uint64_t a1, void *a2)
{
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v4 = (void *)MEMORY[0x192FDC630]();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_11;
    v7[3] = &unk_1E56D83D8;
    id v9 = *(id *)(a1 + 40);
    id v8 = v3;
    id v6 = v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_3;
    block[3] = &unk_1E56D8360;
    id v11 = v6;
    dispatch_async(v5, block);
  }
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = (id)[v3 consumeImageSet];
  [v3 invalidate];

  if (v5)
  {
    if ([(id)objc_opt_class() imageSetType] == *(void *)(a1 + 48))
    {
      id v4 = v5;
      goto LABEL_6;
    }
  }
  id v4 = 0;
LABEL_6:
  id v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)[*(id *)(a1 + 32) consumeImageSet];
  [*(id *)(a1 + 32) invalidate];
  if (v3 && [(id)objc_opt_class() imageSetType] != *(void *)(a1 + 40))
  {

    id v3 = 0;
  }
  v4[2](v4, v3);
}

+ (BOOL)isPassLibraryAvailable
{
  if (dyld_program_sdk_at_least()) {
    int IsAvailable = PKDaemonIsAvailable();
  }
  else {
    int IsAvailable = PKPassbookIsSupported();
  }
  return IsAvailable != 0;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_lock_lock(&self->_delegatesLock);
    delegates = self->_delegates;
    if (!delegates)
    {
      objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
      id v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = self->_delegates;
      self->_delegates = v6;

      delegates = self->_delegates;
    }
    [(NSHashTable *)delegates addObject:v8];
    os_unfair_lock_unlock(&self->_delegatesLock);
    id v4 = v8;
  }
}

void __31__PKPassLibrary_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _initWithRemote:0];
  uint64_t v2 = (void *)qword_1EB402BC8;
  qword_1EB402BC8 = v1;
}

- (PKPassLibrary)init
{
  id v3 = [[PKPassLibrary alloc] initWithMachServiceName:@"com.apple.NPKCompanionAgent.library" resumeNotificationName:@"com.apple.NPKCompanionAgent.listener.resumed" interfaceType:0];
  id v4 = [(PKPassLibrary *)self _initWithRemote:v3];

  return v4;
}

- (id)_initWithRemote:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  if (PKDaemonIsAvailable())
  {
    id v6 = [(PKPassLibrary *)self initWithMachServiceName:@"com.apple.passd.library" resumeNotificationName:@"com.apple.passd.listener.resumed" interfaceType:2];
    uint64_t v7 = v6;
    if (v6)
    {
      if (v5)
      {
        objc_storeStrong((id *)&v6->_remoteLibrary, a3);
        objc_initWeak(&location, v7);
        id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
        remoteLibrary = v7->_remoteLibrary;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __33__PKPassLibrary__initWithRemote___block_invoke;
        v13[3] = &unk_1E56DDE90;
        objc_copyWeak(&v14, &location);
        uint64_t v10 = [v8 addObserverForName:@"PKPassLibraryDidChangeNotification" object:remoteLibrary queue:0 usingBlock:v13];
        remoteLibraryObserver = v7->_remoteLibraryObserver;
        v7->_remoteLibraryObserver = v10;

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      kdebug_trace();
    }
  }
  else
  {

    uint64_t v7 = 0;
  }

  return v7;
}

- (PKPassLibrary)initWithMachServiceName:(id)a3 resumeNotificationName:(id)a4 interfaceType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPassLibrary;
  uint64_t v10 = [(PKPassLibrary *)&v20 init];
  if (v10)
  {
    if (a5 == 1)
    {
      uint64_t v11 = PDPassLibraryInAppInterface();
    }
    else
    {
      if (a5 == 2) {
        PDPassLibraryExtendedInterface();
      }
      else {
      uint64_t v11 = PDPassLibraryInterface();
      }
    }
    id v12 = (void *)v11;
    v10->_delegatesLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.passkit.asynchronousImage", 0);
    asynchronousImageQueue = v10->_asynchronousImageQueue;
    v10->_asynchronousImageQueue = (OS_dispatch_queue *)v13;

    v10->_interfaceType = a5;
    id v15 = [PKXPCService alloc];
    id v16 = PKPassLibraryInterface();
    uint64_t v17 = [(PKXPCService *)v15 initWithMachServiceName:v8 remoteObjectInterface:v12 exportedObjectInterface:v16 exportedObject:v10 serviceResumedNotificationName:v9];
    remoteService = v10->_remoteService;
    v10->_remoteService = (PKXPCService *)v17;

    [(PKXPCService *)v10->_remoteService setDelegate:v10];
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asynchronousImageQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_remoteLibraryObserver, 0);
  objc_storeStrong((id *)&self->_remoteLibrary, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

- (void)dealloc
{
  if (self->_remoteLibraryObserver)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_remoteLibraryObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPassLibrary;
  [(PKPassLibrary *)&v4 dealloc];
}

void __40__PKPassLibrary_passesPendingActivation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allObjects];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __47__PKPassLibrary__copyPassesOfType_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allObjects];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v6 _applyDataAccessorToObjects:v7];
}

void __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke_294(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v5 passes];
  [v3 _applyDataAccessorToObjects:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)defaultPaymentPassesWithRemotePasses:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = 0;
  int64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__11;
  id v35 = __Block_byref_object_dispose__11;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  id v29 = __Block_byref_object_dispose__11;
  id v30 = 0;
  dispatch_group_t v6 = dispatch_group_create();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke;
  aBlock[3] = &unk_1E56DE608;
  SEL v24 = a2;
  uint64_t v7 = v6;
  uint64_t v23 = v7;
  id v8 = _Block_copy(aBlock);
  id v9 = [(PKPassLibrary *)self _remoteObjectProxyWithFailureHandler:v8];
  dispatch_group_enter(v7);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke_205;
  v19[3] = &unk_1E56DE630;
  void v19[4] = self;
  id v21 = &v31;
  uint64_t v10 = v7;
  objc_super v20 = v10;
  [v9 defaultPaymentPassWithHandler:v19];
  if (v3 && [(PKPassLibrary *)self _hasRemoteLibrary])
  {
    uint64_t v11 = [(PKPassLibrary *)self->_remoteLibrary _remoteObjectProxyWithFailureHandler:v8];
    dispatch_group_enter(v10);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke_2;
    v16[3] = &unk_1E56DE658;
    uint64_t v18 = &v25;
    uint64_t v17 = v10;
    [v11 defaultPaymentPassWithHandler:v16];
  }
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_queue_t v13 = v12;
  if (v32[5]) {
    objc_msgSend(v12, "addObject:");
  }
  if (v26[5]) {
    objc_msgSend(v13, "addObject:");
  }
  if (![v13 count])
  {

    dispatch_queue_t v13 = 0;
  }
  id v14 = (void *)[v13 copy];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithFailureHandler:a3];
}

- (BOOL)_hasRemoteLibrary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  remoteLibrary = self->_remoteLibrary;
  BOOL v13 = remoteLibrary != 0;
  if (remoteLibrary)
  {
    uint64_t v4 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "PKPassLibrary: checking remote library...", buf, 2u);
    }

    id v5 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __34__PKPassLibrary__hasRemoteLibrary__block_invoke;
    v9[3] = &unk_1E56D86D0;
    v9[4] = &v10;
    [v5 hasRemoteLibraryWithHandler:v9];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if (*((unsigned char *)v11 + 24)) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "PKPassLibrary: has remote library: %{public}@.", buf, 0xCu);
    }

    BOOL v6 = *((unsigned char *)v11 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v6;
}

+ (PKPassLibrary)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PKPassLibrary_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (qword_1EB402BC0 != -1) {
    dispatch_once(&qword_1EB402BC0, block);
  }
  uint64_t v2 = (void *)qword_1EB402BC8;
  return (PKPassLibrary *)v2;
}

- (BOOL)hasPassesOfType:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PKPassLibrary_hasPassesOfType___block_invoke;
  v6[3] = &unk_1E56D86D0;
  v6[4] = &v7;
  [v4 hasPassesOfType:a3 handler:v6];
  LOBYTE(a3) = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return a3;
}

- (PKPass)passWithPassTypeIdentifier:(NSString *)identifier serialNumber:(NSString *)serialNumber
{
  BOOL v6 = identifier;
  uint64_t v7 = serialNumber;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__11;
  uint64_t v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  id v8 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PKPassLibrary_passWithPassTypeIdentifier_serialNumber___block_invoke;
  v11[3] = &unk_1E56DDF08;
  void v11[4] = &v12;
  [v8 getPassWithPassTypeID:v6 serialNumber:v7 handler:v11];
  [(PKPassLibrary *)self _applyDataAccessorToObject:v13[5]];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (PKPass *)v9;
}

- (NSArray)passesOfType:(PKPassType)passType
{
  id v3 = [(PKPassLibrary *)self _copyPassesOfType:passType withRetries:2];
  return (NSArray *)v3;
}

- (id)_copyPassesOfType:(unint64_t)a3 withRetries:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__11;
  int64_t v32 = __Block_byref_object_dispose__11;
  id v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__11;
  SEL v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__PKPassLibrary__copyPassesOfType_withRetries___block_invoke;
  v17[3] = &unk_1E56DE388;
  v17[4] = &v24;
  v17[5] = &v18;
  uint64_t v7 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__PKPassLibrary__copyPassesOfType_withRetries___block_invoke_2;
  v16[3] = &unk_1E56DE8D0;
  void v16[4] = self;
  void v16[5] = &v28;
  [v7 getPassesOfType:a3 handler:v16];
  if (*((unsigned char *)v25 + 24))
  {
    id v8 = PKLogFacilityTypeGetObject(0);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v9)
      {
        uint64_t v14 = [(id)v19[5] localizedDescription];
        *(_DWORD *)buf = 134218242;
        unint64_t v35 = a4;
        __int16 v36 = 2114;
        v37 = v14;
        _os_log_error_impl(&dword_190E10000, v8, OS_LOG_TYPE_ERROR, "Error retrieving passes (%lu retries remaining): %{public}@", buf, 0x16u);
      }
      id v10 = [(PKPassLibrary *)self _copyPassesOfType:a3 withRetries:a4 - 1];
      id v8 = v29[5];
      v29[5] = (uint64_t)v10;
    }
    else if (v9)
    {
      id v15 = [(id)v19[5] localizedDescription];
      *(_DWORD *)buf = 138543362;
      unint64_t v35 = (unint64_t)v15;
      _os_log_error_impl(&dword_190E10000, v8, OS_LOG_TYPE_ERROR, "Error retrieving passes (giving up): %{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = (void *)v29[5];
  if (!v11) {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService synchronousRemoteObjectProxyWithErrorHandler:a3];
}

void __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke_205(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _applyDataAccessorToObject:v3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_applyDataAccessorToObjects:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        [(PKPassLibrary *)self _applyDataAccessorToObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_applyDataAccessorToObject:(id)a3
{
  id v4 = a3;
  id v6 = [v4 uniqueID];
  uint64_t v5 = [[PKRemoteDataAccessor alloc] initWithLibrary:self objectUniqueID:v6];
  [v4 setDataAccessor:v5];
}

uint64_t __34__PKPassLibrary__hasRemoteLibrary__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __33__PKPassLibrary_hasPassesOfType___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)canAddSecureElementPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKPassLibrary_canAddSecureElementPassWithConfiguration_completion___block_invoke;
    aBlock[3] = &unk_1E56DE2E8;
    SEL v17 = a2;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    long long v11 = _Block_copy(aBlock);
    long long v12 = [(PKPassLibrary *)self _remoteObjectProxyWithErrorHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__PKPassLibrary_canAddSecureElementPassWithConfiguration_completion___block_invoke_193;
    v13[3] = &unk_1E56D8928;
    void v13[4] = self;
    id v14 = v9;
    [v12 usingSynchronousProxy:0 canAddSecureElementPassWithConfiguration:v10 completion:v13];
  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

- (void)getGroupsControllerSnapshotWithOptions:(id)a3 synchronously:(BOOL)a4 handler:(id)a5
{
}

- (void)_getGroupsControllerSnapshotWithOptions:(id)a3 synchronously:(BOOL)a4 retries:(unint64_t)a5 handler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke;
    aBlock[3] = &unk_1E56DE998;
    unint64_t v22 = a5;
    void aBlock[4] = self;
    id v12 = v10;
    id v20 = v12;
    BOOL v23 = v8;
    id v13 = v11;
    id v21 = v13;
    id v14 = _Block_copy(aBlock);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke_294;
    v17[3] = &unk_1E56DE9C0;
    v17[4] = self;
    id v18 = v13;
    id v15 = _Block_copy(v17);
    if ([(PKPassLibrary *)self _hasInterfaceOfType:2])
    {
      if (v8) {
        [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v14];
      }
      else {
      id v16 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v14];
      }
      [v16 usingSynchronousProxy:v8 getGroupsControllerSnapshotWithOptions:v12 handler:v15];
    }
    else
    {
      if (v8) {
        [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v14];
      }
      else {
      id v16 = [(PKPassLibrary *)self _remoteObjectProxyWithErrorHandler:v14];
      }
      [v16 getGroupsControllerSnapshotWithOptions:v12 handler:v15];
    }
  }
}

- (id)passesPendingActivation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__11;
  id v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  uint64_t v2 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PKPassLibrary_passesPendingActivation__block_invoke;
  v5[3] = &unk_1E56D8720;
  v5[4] = &v6;
  [v2 usingSynchronousProxy:1 getPaymentPassesPendingActivationWithHandler:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (BOOL)isSecureElementPassActivationAvailable
{
  uint64_t v2 = +[PKPassLibrary sharedInstanceWithRemoteLibrary];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isPaymentPassActivationAvailable];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (PKSuppressionRequestToken)requestAutomaticPassPresentationSuppressionWithResponseHandler:(void *)responseHandler
{
  id v3 = responseHandler;
  if (PKApplicationIsInBackground())
  {
    char v4 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "+[PKPassLibrary requestAutomaticPassPresentationSuppressionWithResponseHandler:] must not be called while the application is in the background.", buf, 2u);
    }

    if (v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__PKPassLibrary_requestAutomaticPassPresentationSuppressionWithResponseHandler___block_invoke;
      block[3] = &unk_1E56D8360;
      id v9 = v3;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    PKSuppressionRequestToken v5 = 0;
  }
  else
  {
    uint64_t v6 = +[PKAutomaticPassPresentationSuppressor sharedInstance];
    PKSuppressionRequestToken v5 = [v6 requestSuppressionWithResponseHandler:v3];
  }
  return v5;
}

uint64_t __80__PKPassLibrary_requestAutomaticPassPresentationSuppressionWithResponseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)endAutomaticPassPresentationSuppressionWithRequestToken:(PKSuppressionRequestToken)requestToken
{
  id v4 = +[PKAutomaticPassPresentationSuppressor sharedInstance];
  [v4 endSuppressionWithRequestToken:requestToken];
}

+ (BOOL)isSuppressingAutomaticPassPresentation
{
  uint64_t v2 = +[PKAutomaticPassPresentationSuppressor sharedInstance];
  char v3 = [v2 isSuppressing];

  return v3;
}

+ (id)sharedInstanceWithRemoteLibrary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PKPassLibrary_sharedInstanceWithRemoteLibrary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_MergedGlobals_201 != -1) {
    dispatch_once(&_MergedGlobals_201, block);
  }
  uint64_t v2 = (void *)qword_1EB402BB8;
  return v2;
}

void __48__PKPassLibrary_sharedInstanceWithRemoteLibrary__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_1EB402BB8;
  qword_1EB402BB8 = (uint64_t)v1;
}

void __33__PKPassLibrary__initWithRemote___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    PKSuppressionRequestToken v5 = [v6 userInfo];
    [v4 postNotificationName:@"PKPassLibraryRemotePaymentPassesDidChange" object:WeakRetained userInfo:v5];
  }
}

- (id)_remoteObjectProxy
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxy];
}

- (id)_extendedRemoteObjectProxy
{
  if ([(PKPassLibrary *)self _hasInterfaceOfType:2])
  {
    char v3 = [(PKXPCService *)self->_remoteService remoteObjectProxy];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F28790];
    id v6 = [(PKPassLibrary *)self description];
    [v4 raise:v5, @"%@ is not backed by an extended interface", v6 format];

    char v3 = 0;
  }
  return v3;
}

- (id)_extendedRemoteObjectProxyWithFailureHandler:(id)a3
{
  id v4 = a3;
  if ([(PKPassLibrary *)self _hasInterfaceOfType:2])
  {
    uint64_t v5 = [(PKXPCService *)self->_remoteService remoteObjectProxyWithFailureHandler:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F28790];
    uint64_t v8 = [(PKPassLibrary *)self description];
    [v6 raise:v7, @"%@ is not backed by an extended interface", v8 format];

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_extendedRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if ([(PKPassLibrary *)self _hasInterfaceOfType:2])
  {
    uint64_t v5 = [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F28790];
    uint64_t v8 = [(PKPassLibrary *)self description];
    [v6 raise:v7, @"%@ is not backed by an extended interface", v8 format];

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_inAppRemoteObjectProxy
{
  if ([(PKPassLibrary *)self _hasInterfaceOfType:1])
  {
    char v3 = [(PKXPCService *)self->_remoteService remoteObjectProxy];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F28790];
    id v6 = [(PKPassLibrary *)self description];
    [v4 raise:v5, @"%@ is not backed by an in-app interface", v6 format];

    char v3 = 0;
  }
  return v3;
}

- (id)_inAppRemoteObjectProxyWithFailureHandler:(id)a3
{
  id v4 = a3;
  if ([(PKPassLibrary *)self _hasInterfaceOfType:1])
  {
    uint64_t v5 = [(PKXPCService *)self->_remoteService remoteObjectProxyWithFailureHandler:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F28790];
    uint64_t v8 = [(PKPassLibrary *)self description];
    [v6 raise:v7, @"%@ is not backed by an in-app interface", v8 format];

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_inAppRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if ([(PKPassLibrary *)self _hasInterfaceOfType:1])
  {
    uint64_t v5 = [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F28790];
    uint64_t v8 = [(PKPassLibrary *)self description];
    [v6 raise:v7, @"%@ is not backed by an in-app interface", v8 format];

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_synchronousInAppRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if ([(PKPassLibrary *)self _hasInterfaceOfType:1])
  {
    uint64_t v5 = [(PKXPCService *)self->_remoteService synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F28790];
    uint64_t v8 = [(PKPassLibrary *)self description];
    [v6 raise:v7, @"%@ is not backed by an in-app interface", v8 format];

    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  os_unfair_lock_lock(&self->_delegatesLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [(NSHashTable *)self->_delegates removeObject:WeakRetained];
    }
    uint64_t v5 = obj;
    if (obj)
    {
      delegates = self->_delegates;
      if (!delegates)
      {
        objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
        uint64_t v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = self->_delegates;
        self->_delegates = v7;

        delegates = self->_delegates;
      }
      -[NSHashTable addObject:](delegates, "addObject:");
      uint64_t v5 = obj;
    }
    objc_storeWeak((id *)&self->_delegate, v5);
  }
  os_unfair_lock_unlock(&self->_delegatesLock);
}

- (void)removeDelegate:(id)a3
{
  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    id v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    [(NSHashTable *)self->_delegates removeObject:v5];

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

- (id)delegates
{
  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  id v4 = [(NSHashTable *)self->_delegates allObjects];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_delegatesLock);
  return v5;
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PKPassLibrary_remoteService_didInterruptConnection___block_invoke;
  v4[3] = &unk_1E56DD818;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__PKPassLibrary_remoteService_didInterruptConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(WeakRetained, "delegates", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 passLibraryReceivedInterruption];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (NSArray)passes
{
  id v2 = [(PKPassLibrary *)self _copyPassesWithRetries:2];
  return (NSArray *)v2;
}

- (void)badgeCountItemsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PKPassLibrary_badgeCountItemsWithCompletion___block_invoke;
  v7[3] = &unk_1E56D9100;
  id v8 = v4;
  id v6 = v4;
  [v5 badgeCountItemsWithCompletion:v7];
}

uint64_t __47__PKPassLibrary_badgeCountItemsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)passesOfStyles:(unint64_t)a3
{
  id v3 = [(PKPassLibrary *)self _copyPassesOfStyles:a3 withRetries:2];
  return v3;
}

- (id)passWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__11;
  uint64_t v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  uint64_t v5 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__PKPassLibrary_passWithUniqueID___block_invoke;
  v8[3] = &unk_1E56DE3B0;
  void v8[4] = self;
  v8[5] = &v9;
  [v5 getPassWithUniqueID:v4 handler:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __34__PKPassLibrary_passWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _applyDataAccessorToObject:v3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)passWithFPANIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__11;
  uint64_t v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  if ([v4 length])
  {
    uint64_t v5 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__PKPassLibrary_passWithFPANIdentifier___block_invoke;
    v8[3] = &unk_1E56DE658;
    void v8[4] = self;
    v8[5] = &v9;
    [v5 passWithFPANIdentifier:v4 handler:v8];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __40__PKPassLibrary_passWithFPANIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _applyDataAccessorToObject:v3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)passWithDPANIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__11;
  uint64_t v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  if ([v4 length])
  {
    uint64_t v5 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__PKPassLibrary_passWithDPANIdentifier___block_invoke;
    v8[3] = &unk_1E56DE658;
    void v8[4] = self;
    v8[5] = &v9;
    [v5 passWithDPANIdentifier:v4 handler:v8];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __40__PKPassLibrary_passWithDPANIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _applyDataAccessorToObject:v3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)getPassesWithUniqueIdentifiers:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if ([v7 count])
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__PKPassLibrary_getPassesWithUniqueIdentifiers_handler___block_invoke;
      v13[3] = &unk_1E56D8590;
      SEL v15 = a2;
      id v9 = v8;
      void v13[4] = self;
      id v14 = v9;
      long long v10 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__PKPassLibrary_getPassesWithUniqueIdentifiers_handler___block_invoke_115;
      v11[3] = &unk_1E56D8810;
      void v11[4] = self;
      id v12 = v9;
      [v10 getPassesWithUniqueIdentifiers:v7 handler:v11];
    }
    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0]);
    }
  }
}

uint64_t __56__PKPassLibrary_getPassesWithUniqueIdentifiers_handler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__PKPassLibrary_getPassesWithUniqueIdentifiers_handler___block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) _applyDataAccessorToObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)passesWithSearchableTransactions:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__PKPassLibrary_passesWithSearchableTransactions___block_invoke;
    v11[3] = &unk_1E56D8590;
    SEL v13 = a2;
    id v7 = v5;
    void v11[4] = self;
    id v12 = v7;
    long long v8 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__PKPassLibrary_passesWithSearchableTransactions___block_invoke_117;
    v9[3] = &unk_1E56D8748;
    v9[4] = self;
    id v10 = v7;
    [v8 getPassesWithSearchableTransactions:v9];
  }
}

void __50__PKPassLibrary_passesWithSearchableTransactions___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void __50__PKPassLibrary_passesWithSearchableTransactions___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) _applyDataAccessorToObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)passUniqueIDsForAssociatedApplicationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__11;
  uint64_t v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  if ([v4 length])
  {
    uint64_t v5 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__PKPassLibrary_passUniqueIDsForAssociatedApplicationIdentifier___block_invoke;
    v8[3] = &unk_1E56D8720;
    void v8[4] = &v9;
    [v5 getPassUniqueIDsForAssociatedApplicationIdentifier:v4 handler:v8];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __65__PKPassLibrary_passUniqueIDsForAssociatedApplicationIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (void)getMetadataForFieldWithProperties:(id)a3 withHandler:(id)a4
{
  id v7 = a4;
  long long v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__PKPassLibrary_getMetadataForFieldWithProperties_withHandler___block_invoke;
    v14[3] = &unk_1E56D8590;
    SEL v16 = a2;
    id v9 = v7;
    v14[4] = self;
    id v15 = v9;
    id v10 = a3;
    uint64_t v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__PKPassLibrary_getMetadataForFieldWithProperties_withHandler___block_invoke_119;
    v12[3] = &unk_1E56DDEB8;
    v12[4] = self;
    id v13 = v9;
    [v11 getMetadataForFieldWithProperties:v10 handler:v12];
  }
}

uint64_t __63__PKPassLibrary_getMetadataForFieldWithProperties_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __63__PKPassLibrary_getMetadataForFieldWithProperties_withHandler___block_invoke_119(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)manifestHashForPassWithUniqueID:(id)a3
{
  id v5 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__11;
  id v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PKPassLibrary_manifestHashForPassWithUniqueID___block_invoke;
  v10[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v10[4] = a2;
  id v6 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PKPassLibrary_manifestHashForPassWithUniqueID___block_invoke_123;
  v9[3] = &unk_1E56DDEE0;
  v9[4] = &v11;
  [v6 usingSynchronousProxy:1 getManifestHashForPassWithUniqueID:v5 handler:v9];
  id v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __49__PKPassLibrary_manifestHashForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);
  }
}

void __49__PKPassLibrary_manifestHashForPassWithUniqueID___block_invoke_123(uint64_t a1, void *a2)
{
}

- (id)passesWithReaderIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__11;
  id v21 = __Block_byref_object_dispose__11;
  id v22 = 0;
  id v5 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__PKPassLibrary_passesWithReaderIdentifier___block_invoke;
  v16[3] = &unk_1E56D8720;
  void v16[4] = &v17;
  [v5 getPassesWithReaderIdentifier:v4 handler:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = (id)v18[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        -[PKPassLibrary _applyDataAccessorToObject:](self, "_applyDataAccessorToObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v23 count:16];
    }
    while (v7);
  }

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __44__PKPassLibrary_passesWithReaderIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (NSArray)remotePaymentPasses
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(PKPassLibrary *)self _hasRemoteLibrary])
  {
    id v3 = [(PKPassLibrary *)self->_remoteLibrary passesOfType:1];
  }
  else
  {
    id v3 = 0;
  }
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "paymentPass", (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v4 copy];
  return (NSArray *)v11;
}

- (NSArray)remoteSecureElementPasses
{
  if ([(PKPassLibrary *)self _hasRemoteLibrary])
  {
    id v3 = [(PKPassLibrary *)self->_remoteLibrary passesOfType:1];
  }
  else
  {
    id v3 = 0;
  }
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v4;

  return v5;
}

- (BOOL)hasPassesInExpiredSection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PKPassLibrary_hasPassesInExpiredSection__block_invoke;
  v5[3] = &unk_1E56D86D0;
  v5[4] = &v6;
  [v2 hasPassesInExpiredSectionWithHandler:v5];
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__PKPassLibrary_hasPassesInExpiredSection__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)paymentPassesWithLocallyStoredValue
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(PKPassLibrary *)self hasPassesOfType:1])
  {
    id v4 = [(PKPassLibrary *)self passesOfType:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([v9 isStoredValuePass] & 1) == 0)
          {
            id v10 = [v9 devicePrimaryPaymentApplication];
            int v11 = [v10 supportsTransitHistory];

            if (!v11) {
              continue;
            }
          }
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  long long v12 = (void *)[v3 copy];

  return v12;
}

- (id)peerPaymentPassUniqueID
{
  if ((PKUseMockSURFServer() & 1) != 0 || PKStoreDemoModeEnabled())
  {
    char v3 = PKMockPeerPaymentPassPassTypeID();
    id v4 = PKMockPeerPaymentPassSerialNumber();
    PKGeneratePassUniqueID(v3, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    long long v12 = __Block_byref_object_copy__11;
    long long v13 = __Block_byref_object_dispose__11;
    id v14 = 0;
    uint64_t v6 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__PKPassLibrary_peerPaymentPassUniqueID__block_invoke;
    v8[3] = &unk_1E56DDF30;
    void v8[4] = &v9;
    [v6 peerPaymentPassUniqueIDWithHandler:v8];
    id v5 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }
  return v5;
}

void __40__PKPassLibrary_peerPaymentPassUniqueID__block_invoke(uint64_t a1, void *a2)
{
}

- (unint64_t)countOfPasses
{
  return [(PKPassLibrary *)self countPassesOfType:-1];
}

- (unint64_t)countPassesOfType:(unint64_t)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__PKPassLibrary_countPassesOfType___block_invoke;
  v7[3] = &unk_1E56D8608;
  void v7[4] = &v8;
  [v4 countPassesOfType:a3 handler:v7];
  unint64_t v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __35__PKPassLibrary_countPassesOfType___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)canAddPassOfType:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PKPassLibrary_canAddPassOfType___block_invoke;
  v6[3] = &unk_1E56D86D0;
  v6[4] = &v7;
  [v4 canAddPassesOfType:a3 handler:v6];
  LOBYTE(a3) = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __34__PKPassLibrary_canAddPassOfType___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)canAddSecureElementPassWithPrimaryAccountIdentifier:(NSString *)primaryAccountIdentifier
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = primaryAccountIdentifier;
  if (v4)
  {
    unint64_t v5 = [[PKAddSecureElementPassConfiguration alloc] initWithType:5];
    if ([(PKPassLibrary *)self canAddSecureElementPassWithConfiguration:v5])
    {
      if (PKSecureElementIsAvailable())
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        BOOL v6 = 1;
        uint64_t v7 = [(PKPassLibrary *)self passesOfType:1];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v28;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v28 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              long long v13 = [v12 primaryAccountIdentifier];
              int v14 = [v13 isEqualToString:v4];

              if (v14 && (unint64_t)[v12 activationState] <= 3)
              {

                goto LABEL_16;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
            if (v9) {
              continue;
            }
            break;
          }
          BOOL v6 = 1;
        }
        goto LABEL_30;
      }
LABEL_16:
      if ([(PKPassLibrary *)self _hasRemoteLibrary]
        && [(PKPassLibrary *)self isWatchIssuerAppProvisioningSupported])
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        BOOL v6 = 1;
        uint64_t v7 = -[PKPassLibrary passesOfType:](self->_remoteLibrary, "passesOfType:", 1, 0);
        uint64_t v15 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v7);
              }
              uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              id v20 = [v19 primaryAccountIdentifier];
              int v21 = [v20 isEqualToString:v4];

              if (v21 && (unint64_t)[v19 activationState] < 4)
              {
                BOOL v6 = 0;
                goto LABEL_30;
              }
            }
            uint64_t v16 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
            BOOL v6 = 1;
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    BOOL v6 = 0;
LABEL_31:

    goto LABEL_32;
  }
  BOOL v6 = 0;
LABEL_32:

  return v6;
}

- (BOOL)canAddFelicaPass
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  char v3 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PKPassLibrary_canAddFelicaPass__block_invoke;
  v6[3] = &unk_1E56D86D0;
  v6[4] = &v7;
  [v3 canAddFelicaPassWithHandler:v6];
  if (*((unsigned char *)v8 + 24))
  {
    BOOL v4 = 1;
  }
  else
  {
    if ([(PKPassLibrary *)self _hasRemoteLibrary]) {
      BOOL v4 = [(PKPassLibrary *)self->_remoteLibrary canAddFelicaPass];
    }
    else {
      BOOL v4 = 0;
    }
    *((unsigned char *)v8 + 24) = v4;
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__PKPassLibrary_canAddFelicaPass__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isRemovingPassesOfType:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  BOOL v4 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PKPassLibrary_isRemovingPassesOfType___block_invoke;
  v6[3] = &unk_1E56D86D0;
  v6[4] = &v7;
  [v4 isRemovingPassesOfType:a3 handler:v6];
  LOBYTE(a3) = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __40__PKPassLibrary_isRemovingPassesOfType___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)hasSecureElementPassesOfType:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  BOOL v4 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PKPassLibrary_hasSecureElementPassesOfType___block_invoke;
  v6[3] = &unk_1E56D86D0;
  v6[4] = &v7;
  [v4 hasSecureElementPassesOfType:a3 handler:v6];
  LOBYTE(a3) = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __46__PKPassLibrary_hasSecureElementPassesOfType___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isPassbookVisible
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PKPassLibrary_isPassbookVisible__block_invoke;
  v5[3] = &unk_1E56D86D0;
  v5[4] = &v6;
  [v2 isPassbookVisibleWithHandler:v5];
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__PKPassLibrary_isPassbookVisible__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)passbookHasBeenDeleted
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PKPassLibrary_passbookHasBeenDeleted__block_invoke;
  v5[3] = &unk_1E56D86D0;
  v5[4] = &v6;
  [v2 passbookHasBeenDeletedWithHandler:v5];
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__PKPassLibrary_passbookHasBeenDeleted__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)iPadSupportsPasses
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PKPassLibrary_iPadSupportsPasses__block_invoke;
  v5[3] = &unk_1E56D86D0;
  v5[4] = &v6;
  [v2 iPadSupportsPasses:v5];
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PKPassLibrary_iPadSupportsPasses__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)inAppPaymentPassesForPaymentRequest:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [v5 supportedNetworks];
  uint64_t v8 = [v6 setWithArray:v7];

  uint64_t v9 = [v5 merchantCapabilities];
  char v10 = [v5 supportedCountries];
  uint64_t v11 = [v5 isMultiTokenRequest];
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__11;
  long long v24 = __Block_byref_object_dispose__11;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__PKPassLibrary_inAppPaymentPassesForPaymentRequest___block_invoke;
  v19[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v19[4] = a2;
  long long v12 = [(PKPassLibrary *)self _synchronousInAppRemoteObjectProxyWithErrorHandler:v19];
  long long v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "requestType"));
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__PKPassLibrary_inAppPaymentPassesForPaymentRequest___block_invoke_131;
  v18[3] = &unk_1E56DDF58;
  v18[4] = self;
  void v18[5] = &v20;
  [v12 inAppPaymentPassesForNetworks:v8 capabilities:v9 issuerCountryCodes:v10 paymentRequestType:v13 isMultiTokensRequest:v11 withHandler:v18];

  uint64_t v14 = [(PKPassLibrary *)self _filterPeerPaymentPass:v21[5] request:v5];
  uint64_t v15 = (void *)v21[5];
  v21[5] = v14;

  id v16 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v16;
}

void __53__PKPassLibrary_inAppPaymentPassesForPaymentRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 32);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

void __53__PKPassLibrary_inAppPaymentPassesForPaymentRequest___block_invoke_131(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _applyDataAccessorToObjects:v3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_filterPeerPaymentPass:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(PKPassLibrary *)self peerPaymentPassUniqueID];
  char v9 = [v6 isPeerPaymentRequest];
  char v10 = [v6 supportsInstantFundsIn];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__PKPassLibrary__filterPeerPaymentPass_request___block_invoke;
  v14[3] = &unk_1E56DDF80;
  char v16 = v10;
  char v17 = v9;
  id v15 = v8;
  id v11 = v8;
  uint64_t v12 = [v7 objectsPassingTest:v14];

  return v12;
}

uint64_t __48__PKPassLibrary__filterPeerPaymentPass_request___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 40)
    && ([v3 devicePrimaryPaymentApplication],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 supportsInstantFundsIn],
        v5,
        !v6))
  {
    uint64_t v9 = 0;
  }
  else if (*(unsigned char *)(a1 + 41))
  {
    id v7 = [v4 uniqueID];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    uint64_t v9 = v8 ^ 1u;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 withHandler:(id)a6
{
}

- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 isMultiTokensRequest:(BOOL)a6 withHandler:(id)a7
{
}

- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8
{
  BOOL v8 = a7;
  id v15 = a8;
  char v16 = v15;
  if (v15)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __134__PKPassLibrary_hasInAppPaymentPassesForNetworks_capabilities_issuerCountryCodes_paymentRequestType_isMultiTokensRequest_withHandler___block_invoke;
    v24[3] = &unk_1E56D8590;
    SEL v26 = a2;
    id v17 = v15;
    v24[4] = self;
    id v25 = v17;
    id v18 = a6;
    id v19 = a5;
    id v20 = a3;
    int v21 = [(PKPassLibrary *)self _inAppRemoteObjectProxyWithFailureHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __134__PKPassLibrary_hasInAppPaymentPassesForNetworks_capabilities_issuerCountryCodes_paymentRequestType_isMultiTokensRequest_withHandler___block_invoke_133;
    v22[3] = &unk_1E56D8798;
    v22[4] = self;
    id v23 = v17;
    [v21 hasInAppPaymentPassesForNetworks:v20 capabilities:a4 issuerCountryCodes:v19 paymentRequestType:v18 isMultiTokensRequest:v8 withHandler:v22];
  }
}

uint64_t __134__PKPassLibrary_hasInAppPaymentPassesForNetworks_capabilities_issuerCountryCodes_paymentRequestType_isMultiTokensRequest_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __134__PKPassLibrary_hasInAppPaymentPassesForNetworks_capabilities_issuerCountryCodes_paymentRequestType_isMultiTokensRequest_withHandler___block_invoke_133(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__11;
  id v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__PKPassLibrary_inAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest___block_invoke;
  v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v15[4] = a2;
  id v11 = [(PKPassLibrary *)self _synchronousInAppRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __112__PKPassLibrary_inAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest___block_invoke_134;
  v14[3] = &unk_1E56DDF58;
  void v14[4] = self;
  void v14[5] = &v16;
  [v11 inAppPrivateLabelPaymentPassesForApplicationIdentifier:v9 issuerCountryCodes:v10 isMultiTokensRequest:v5 withHandler:v14];
  id v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __112__PKPassLibrary_inAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(const char **)(a1 + 32);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

void __112__PKPassLibrary_inAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest___block_invoke_134(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _applyDataAccessorToObjects:v3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)hasInAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  if (v11)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __127__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke;
    v19[3] = &unk_1E56D8590;
    SEL v21 = a2;
    id v13 = v11;
    void v19[4] = self;
    id v20 = v13;
    id v14 = a4;
    id v15 = a3;
    uint64_t v16 = [(PKPassLibrary *)self _inAppRemoteObjectProxyWithFailureHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __127__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke_135;
    v17[3] = &unk_1E56D8798;
    v17[4] = self;
    id v18 = v13;
    [v16 hasInAppPrivateLabelPaymentPassesForApplicationIdentifier:v15 issuerCountryCodes:v14 isMultiTokensRequest:v6 withHandler:v17];
  }
}

uint64_t __127__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    BOOL v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __127__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__11;
  id v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__PKPassLibrary_inAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest___block_invoke;
  v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v15[4] = a2;
  id v11 = [(PKPassLibrary *)self _synchronousInAppRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__PKPassLibrary_inAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest___block_invoke_136;
  v14[3] = &unk_1E56DDF58;
  void v14[4] = self;
  void v14[5] = &v16;
  [v11 inAppPrivateLabelPaymentPassesForWebDomain:v9 issuerCountryCodes:v10 isMultiTokensRequest:v5 withHandler:v14];
  id v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __100__PKPassLibrary_inAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(const char **)(a1 + 32);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

void __100__PKPassLibrary_inAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest___block_invoke_136(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _applyDataAccessorToObjects:v3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)hasInAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  if (v11)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __115__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke;
    v19[3] = &unk_1E56D8590;
    SEL v21 = a2;
    id v13 = v11;
    void v19[4] = self;
    id v20 = v13;
    id v14 = a4;
    id v15 = a3;
    uint64_t v16 = [(PKPassLibrary *)self _inAppRemoteObjectProxyWithFailureHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __115__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke_137;
    v17[3] = &unk_1E56D8798;
    v17[4] = self;
    id v18 = v13;
    [v16 hasInAppPrivateLabelPaymentPassesForWebDomain:v15 issuerCountryCodes:v14 isMultiTokensRequest:v6 withHandler:v17];
  }
}

uint64_t __115__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    BOOL v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __115__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enabledValueAddedServicePassesWithCompletion:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PKPassLibrary_enabledValueAddedServicePassesWithCompletion___block_invoke;
    v11[3] = &unk_1E56D8590;
    SEL v13 = a2;
    id v7 = v5;
    void v11[4] = self;
    id v12 = v7;
    int v8 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__PKPassLibrary_enabledValueAddedServicePassesWithCompletion___block_invoke_138;
    v9[3] = &unk_1E56D8810;
    v9[4] = self;
    id v10 = v7;
    [v8 enabledValueAddedServicePassesWithHandler:v9];
  }
}

uint64_t __62__PKPassLibrary_enabledValueAddedServicePassesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    BOOL v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__PKPassLibrary_enabledValueAddedServicePassesWithCompletion___block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) _applyDataAccessorToObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getPassesAndCatalog:(BOOL)a3 withHandler:(id)a4
{
}

- (void)getPassesAndCatalog:(BOOL)a3 synchronously:(BOOL)a4 withHandler:(id)a5
{
}

- (void)getPassesAndCatalogOfPassTypes:(unint64_t)a3 synchronously:(BOOL)a4 withHandler:(id)a5
{
}

- (void)unexpiredPassesOrderedByGroup:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__PKPassLibrary_unexpiredPassesOrderedByGroup___block_invoke;
    v11[3] = &unk_1E56D8590;
    SEL v13 = a2;
    id v7 = v5;
    void v11[4] = self;
    id v12 = v7;
    long long v8 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__PKPassLibrary_unexpiredPassesOrderedByGroup___block_invoke_139;
    v9[3] = &unk_1E56D8810;
    v9[4] = self;
    id v10 = v7;
    [v8 unexpiredPassesOrderedByGroup:v9];
  }
}

uint64_t __47__PKPassLibrary_unexpiredPassesOrderedByGroup___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __47__PKPassLibrary_unexpiredPassesOrderedByGroup___block_invoke_139(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _applyDataAccessorToObjects:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)containsPass:(PKPass *)pass
{
  id v4 = pass;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__PKPassLibrary_containsPass___block_invoke;
  v8[3] = &unk_1E56DDFA8;
  id v10 = &v11;
  uint64_t v6 = v5;
  long long v9 = v6;
  [(PKPassLibrary *)self getContainmentStatusAndSettingsForPass:v4 withHandler:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

intptr_t __30__PKPassLibrary_containsPass___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)containsPassWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  char v14 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_141;
  v16[3] = &unk_1E56D8798;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 usingSynchronousProxy:0 containsPassWithPassTypeIdentifier:v12 serialNumber:v11 completionHandler:v16];
}

uint64_t __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_141(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_2;
  block[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v8 = a2;
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v4, block);
}

uint64_t __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (BOOL)replacePassWithPass:(PKPass *)pass
{
  id v4 = pass;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)MEMORY[0x192FDC630]();
    uint64_t v6 = [(PKObject *)v4 archiveData];
    if (v6)
    {
      uint64_t v11 = 0;
      id v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      id v7 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __37__PKPassLibrary_replacePassWithPass___block_invoke;
      v10[3] = &unk_1E56D86D0;
      v10[4] = &v11;
      [v7 replacePassWithPassData:v6 handler:v10];
      BOOL v8 = *((unsigned char *)v12 + 24) != 0;

      _Block_object_dispose(&v11, 8);
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __37__PKPassLibrary_replacePassWithPass___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)archiveForObjectWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__11;
  uint64_t v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  id v5 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PKPassLibrary_archiveForObjectWithUniqueID___block_invoke;
  v8[3] = &unk_1E56DDEE0;
  void v8[4] = &v9;
  [v5 getArchivedObjectWithUniqueID:v4 handler:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __46__PKPassLibrary_archiveForObjectWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4 objectUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__11;
  id v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  uint64_t v11 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PKPassLibrary_dataForBundleResourceNamed_withExtension_objectUniqueIdentifier___block_invoke;
  v14[3] = &unk_1E56DDEE0;
  void v14[4] = &v15;
  [v11 getDataForBundleResourceNamed:v8 withExtension:v9 objectUniqueIdentifier:v10 handler:v14];
  kdebug_trace();
  id v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __81__PKPassLibrary_dataForBundleResourceNamed_withExtension_objectUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (id)dataForBundleResources:(id)a3 objectUniqueIdentifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  LODWORD(a4) = [(PKPassLibrary *)self _hasInterfaceOfType:2];
  kdebug_trace();
  uint64_t v17 = v6;
  if (a4)
  {
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__11;
    int64_t v32 = __Block_byref_object_dispose__11;
    id v33 = 0;
    id v7 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__PKPassLibrary_dataForBundleResources_objectUniqueIdentifier___block_invoke;
    v27[3] = &unk_1E56DDFD0;
    v27[4] = &v28;
    [v7 getDataForBundleResources:v6 objectUniqueIdentifier:v19 handler:v27];
    kdebug_trace();
    id v8 = (id)v29[5];

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
    id v9 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v14 = [v13 name];
          uint64_t v15 = [v13 extension];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __63__PKPassLibrary_dataForBundleResources_objectUniqueIdentifier___block_invoke_2;
          v20[3] = &unk_1E56DDFF8;
          id v21 = v8;
          uint64_t v22 = v13;
          [v9 getDataForBundleResourceNamed:v14 withExtension:v15 objectUniqueIdentifier:v19 handler:v20];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v34 count:16];
      }
      while (v10);
    }

    kdebug_trace();
  }

  return v8;
}

void __63__PKPassLibrary_dataForBundleResources_objectUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __63__PKPassLibrary_dataForBundleResources_objectUniqueIdentifier___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setObject:a2 forKeyedSubscript:*(void *)(result + 40)];
  }
  return result;
}

- (id)passLocalizedStringForKey:(id)a3 uniqueID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__11;
  uint64_t v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__PKPassLibrary_passLocalizedStringForKey_uniqueID___block_invoke;
  v14[3] = &unk_1E56DE020;
  uint64_t v16 = &v18;
  SEL v17 = a2;
  id v9 = v7;
  id v15 = v9;
  uint64_t v10 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__PKPassLibrary_passLocalizedStringForKey_uniqueID___block_invoke_145;
  v13[3] = &unk_1E56DDF30;
  void v13[4] = &v18;
  [v10 usingSynchronousProxy:1 passLocalizedStringForKey:v9 uniqueID:v8 completion:v13];
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __52__PKPassLibrary_passLocalizedStringForKey_uniqueID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@] Error: %@;",
      (uint8_t *)&v6,
      0x16u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
}

void __52__PKPassLibrary_passLocalizedStringForKey_uniqueID___block_invoke_145(uint64_t a1, void *a2)
{
}

- (void)addPasses:(NSArray *)passes withCompletionHandler:(void *)completion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = passes;
  id v7 = completion;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = (void *)MEMORY[0x192FDC630](v10);
        uint64_t v16 = objc_msgSend(v14, "archiveData", (void)v17);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v11 = v10;
    }
    while (v10);
  }

  [(PKPassLibrary *)self addPassesWithData:v8 withCompletionHandler:v7];
}

- (void)addPassesWithData:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v16 = a2;
    id v9 = v8;
    void aBlock[4] = self;
    id v15 = v9;
    uint64_t v10 = _Block_copy(aBlock);
    uint64_t v11 = [(PKPassLibrary *)self _remoteObjectProxyWithFailureHandler:v10];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke_147;
    v12[3] = &unk_1E56DE048;
    v12[4] = self;
    id v13 = v9;
    [v11 addPassesWithData:v7 handler:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

void __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke_147(uint64_t a1, uint64_t a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E56DC4C0;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)addPassesWithIngestionPayloads:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v16 = a2;
    id v9 = v8;
    void aBlock[4] = self;
    id v15 = v9;
    uint64_t v10 = _Block_copy(aBlock);
    uint64_t v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v10];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke_148;
    v12[3] = &unk_1E56DE070;
    v12[4] = self;
    id v13 = v9;
    [v11 usingSynchronousProxy:0 addPassIngestionPayloads:v7 withCompletionHandler:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

void __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke_148(uint64_t a1, uint64_t a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E56DC4C0;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)addPassesContainer:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PKPassLibrary_addPassesContainer_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v17 = a2;
    id v10 = v8;
    void aBlock[4] = self;
    id v16 = v10;
    uint64_t v11 = _Block_copy(aBlock);
    uint64_t v12 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__PKPassLibrary_addPassesContainer_withCompletionHandler___block_invoke_150;
    v13[3] = &unk_1E56DE070;
    void v13[4] = self;
    id v14 = v10;
    [v12 usingSynchronousProxy:0 addPassesContainer:v7 withCompletionHandler:v13];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __58__PKPassLibrary_addPassesContainer_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

uint64_t __58__PKPassLibrary_addPassesContainer_withCompletionHandler___block_invoke_150(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addUnsignedPassesAtURLs:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [[PKFileDescriptorXPCContainer alloc] initWithFileURL:*(void *)(*((void *)&v33 + 1) + 8 * v14)];
        [v9 safelyAddObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [v9 count];
  if (v16 == [v10 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E56DE098;
    id v17 = v9;
    id v30 = v17;
    id v31 = v8;
    long long v18 = _Block_copy(aBlock);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_2;
    v26[3] = &unk_1E56D8590;
    SEL v28 = a2;
    id v19 = v18;
    void v26[4] = self;
    id v27 = v19;
    long long v20 = _Block_copy(v26);
    id v21 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v20];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_152;
    v24[3] = &unk_1E56DE070;
    v24[4] = self;
    id v25 = v19;
    id v22 = v19;
    [v21 usingSynchronousProxy:0 addUnsignedPassesWithDataFileDescriptors:v17 completionHandler:v24];
  }
  else
  {
    id v23 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "Attempting to add unsigned passed, but failed to convert all .pkpass urls to fds", buf, 2u);
    }

    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 2);
    }
  }
}

uint64_t __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "invalidate", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_152(uint64_t a1, uint64_t a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_2_153;
  block[3] = &unk_1E56D8590;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = a2;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

uint64_t __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_2_153(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v7;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Provisioning HomeKey passes: %@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PKPassLibrary_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke;
  v15[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v10 = v8;
  v15[4] = self;
  id v16 = v10;
  long long v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKPassLibrary_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke_154;
  v13[3] = &unk_1E56D90B0;
  void v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 usingSynchronousProxy:0 provisionHomeKeyPassForSerialNumbers:v7 completionHandler:v13];
}

void __72__PKPassLibrary_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

void __72__PKPassLibrary_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _applyDataAccessorToObjects:v7];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Fetching available HomeKey passes", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__PKPassLibrary_availableHomeKeyPassesWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E56DD260;
  SEL v14 = a2;
  id v7 = v5;
  v12[4] = self;
  id v13 = v7;
  id v8 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PKPassLibrary_availableHomeKeyPassesWithCompletionHandler___block_invoke_156;
  v10[3] = &unk_1E56DD728;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 usingSynchronousProxy:0 availableHomeKeyPassesWithCompletionHandler:v10];
}

void __61__PKPassLibrary_availableHomeKeyPassesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

void __61__PKPassLibrary_availableHomeKeyPassesWithCompletionHandler___block_invoke_156(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v6)
  {
    uint64_t v18 = a1;
    id v8 = objc_alloc_init(PKSecureElement);
    __int16 v9 = [(PKSecureElement *)v8 secureElementIdentifiers];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v5;
    uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(obj);
          }
          SEL v14 = [[PKSerializedDataAccessor alloc] initWithData:*(void *)(*((void *)&v20 + 1) + 8 * i) error:0];
          id v15 = +[PKObject createWithFileDataAccessor:v14 validationOptions:2 warnings:0 error:0];
          id v16 = [v15 paymentPass];

          [v16 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v9];
          [v7 safelyAddObject:v16];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    id v6 = 0;
    a1 = v18;
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v7, v6);
  }
}

- (void)replaceUnsignedPassAtURL:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  __int16 v9 = [[PKFileDescriptorXPCContainer alloc] initWithFileURL:v8];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E56D86A8;
  long long v23 = v9;
  id v24 = v7;
  id v10 = v7;
  uint64_t v11 = v9;
  uint64_t v12 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E56D8590;
  SEL v21 = a2;
  id v13 = v12;
  void v19[4] = self;
  id v20 = v13;
  SEL v14 = _Block_copy(v19);
  id v15 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_159;
  v17[3] = &unk_1E56D8798;
  v17[4] = self;
  id v18 = v13;
  id v16 = v13;
  [v15 usingSynchronousProxy:0 replaceUnsignedPassWithDataFileDescriptor:v11 completionHandler:v17];
}

uint64_t __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_159(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_2_160;
  block[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v8 = a2;
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v4, block);
}

uint64_t __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_2_160(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)generateTransactionKeyWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke;
  v17[3] = &unk_1E56DD260;
  SEL v19 = a2;
  id v10 = v9;
  v17[4] = self;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke_161;
  v15[3] = &unk_1E56DE0E8;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 usingSynchronousProxy:0 generateTransactionKeyWithReaderIdentifier:v12 readerPublicKey:v11 completion:v15];
}

void __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    char v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void, void, void, id))(v6 + 16))(v6, 0, 0, 0, 0, v3);
  }
}

void __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke_161(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke_2;
  block[3] = &unk_1E56DE0C0;
  id v17 = *(id *)(a1 + 40);
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  uint64_t v18 = *(void *)(a1 + 32);
  id v29 = v15;
  uint64_t v30 = v18;
  id v31 = v17;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  id v23 = v11;
  dispatch_async(v16, block);
}

uint64_t __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[10];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6], a1[7], a1[8]);
  }
  return result;
}

- (void)configureHomeAuxiliaryCapabilitiesForSerialNumber:(id)a3 homeIdentifier:(id)a4 fromUnifiedAccessDescriptor:(id)a5 andAliroDescriptor:(id)a6 completion:(id)a7
{
  id v13 = a7;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke;
  v23[3] = &unk_1E56DD260;
  SEL v25 = a2;
  id v14 = v13;
  v23[4] = self;
  id v24 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke_163;
  v21[3] = &unk_1E56DE138;
  v21[4] = self;
  id v22 = v14;
  id v20 = v14;
  [v19 usingSynchronousProxy:0 configureHomeAuxiliaryCapabilitiesForSerialNumber:v18 homeIdentifier:v17 fromUnifiedAccessDescriptor:v16 andAliroDescriptor:v15 completion:v21];
}

void __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    char v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void, void, id))(v6 + 16))(v6, 0, 0, 0, v3);
  }
}

void __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke_163(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = dispatch_get_global_queue(0, 0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke_2;
  v19[3] = &unk_1E56DE110;
  id v14 = *(id *)(a1 + 40);
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = v14;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  dispatch_async(v13, v19);
}

void *__140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke_2(void *result)
{
  uint64_t v1 = result[9];
  if (v1) {
    return (void *)(*(uint64_t (**)(void, void, void, void, void))(v1 + 16))(result[9], result[4], result[5], result[6], result[7]);
  }
  return result;
}

- (void)fetchTransactionKeyForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__PKPassLibrary_fetchTransactionKeyForPassTypeIdentifier_serialNumber_completionHandler___block_invoke;
  v10[3] = &unk_1E56DE160;
  id v11 = v8;
  id v9 = v8;
  [(PKPassLibrary *)self fetchAppletSubCredentialForPassTypeIdentifier:a3 serialNumber:a4 completionHandler:v10];
}

void __89__PKPassLibrary_fetchTransactionKeyForPassTypeIdentifier_serialNumber_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = [a2 transactionKey];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (void)fetchAppletSubCredentialForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__PKPassLibrary_fetchAppletSubCredentialForPassTypeIdentifier_serialNumber_completionHandler___block_invoke;
  v17[3] = &unk_1E56DD260;
  SEL v19 = a2;
  id v10 = v9;
  v17[4] = self;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__PKPassLibrary_fetchAppletSubCredentialForPassTypeIdentifier_serialNumber_completionHandler___block_invoke_166;
  v15[3] = &unk_1E56DE188;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 usingSynchronousProxy:0 fetchAppletSubCredentialForPassTypeIdentifier:v12 serialNumber:v11 completionHandler:v15];
}

void __94__PKPassLibrary_fetchAppletSubCredentialForPassTypeIdentifier_serialNumber_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __94__PKPassLibrary_fetchAppletSubCredentialForPassTypeIdentifier_serialNumber_completionHandler___block_invoke_166(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)enableExpressForPassWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke;
  v17[3] = &unk_1E56DD260;
  SEL v19 = a2;
  id v10 = v9;
  v17[4] = self;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_167;
  v15[3] = &unk_1E56D8798;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 usingSynchronousProxy:0 enableExpressForPassWithPassTypeIdentifier:v12 serialNumber:v11 completionHandler:v15];
}

void __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

void __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_167(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_2;
  block[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v8 = a2;
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v4, block);
}

uint64_t __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)openPaymentSetup
{
  id v2 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  [v2 openPaymentUIWithCompletion:&__block_literal_global_30];
}

- (void)openPaymentSetupForMerchantIdentifier:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Requesting merchant registration status for openPaymentSetup...", buf, 2u);
  }

  id v12 = objc_alloc_init(PKInAppPaymentService);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PKPassLibrary_openPaymentSetupForMerchantIdentifier_domain_completion___block_invoke;
  v14[3] = &unk_1E56D84A0;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [(PKInAppPaymentService *)v12 merchantStatusCheck:v8 merchantDomain:v9 sourceApplicationSecondaryIdentifier:0 completion:v14];
}

void __73__PKPassLibrary_openPaymentSetupForMerchantIdentifier_domain_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Merchant registered, opening payment setup", (uint8_t *)&v9, 2u);
    }

    [*(id *)(a1 + 32) openPaymentSetup];
  }
  else
  {
    if (v7)
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Could not validate merchant for payment setup: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
  }
}

- (void)presentPaymentSetupRequest:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke_170;
  v16[3] = &unk_1E56D8798;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 presentPaymentSetupRequest:v12 orientation:v11 completion:v16];
}

uint64_t __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke_170(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke_2;
  block[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v8 = a2;
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v4, block);
}

uint64_t __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v18 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPassLibrary requesting payment setup features", buf, 2u);
  }

  id v12 = [(PKPassLibrary *)self _remoteObjectProxyWithFailureHandler:v10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke_171;
  v14[3] = &unk_1E56D89C8;
  void v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v12 paymentSetupFeaturesForConfiguration:v9 completion:v14];
}

uint64_t __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke_171(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)paymentPassWithAssociatedAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke_172;
  v13[3] = &unk_1E56DE1D0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 paymentPassWithAssociatedAccountIdentifier:v9 completion:v13];
}

uint64_t __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke_172(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)presentSecureElementPass:(PKSecureElementPass *)pass
{
  id v4 = pass;
  if (v4)
  {
    id v8 = v4;
    id v5 = [(PKObject *)v4 uniqueID];
    id v4 = v8;
    if (v5)
    {
      uint64_t v6 = [(PKPass *)v8 passType];

      id v4 = v8;
      if (v6 == 1)
      {
        id v7 = [(PKObject *)v8 uniqueID];
        [(PKPassLibrary *)self presentContactlessInterfaceForPassWithUniqueIdentifier:v7 fromSource:4 completion:0];

        id v4 = v8;
      }
    }
  }
}

- (void)presentWalletWithRelevantPassUniqueID:(id)a3
{
  if (a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__PKPassLibrary_presentWalletWithRelevantPassUniqueID___block_invoke;
    v6[3] = &__block_descriptor_40_e5_v8__0l;
    v6[4] = a2;
    id v4 = a3;
    id v5 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v6];
    [v5 openWalletUIWithRelevantPass:v4];
  }
}

void __55__PKPassLibrary_presentWalletWithRelevantPassUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);
  }
}

- (void)canPresentPaymentRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__PKPassLibrary_canPresentPaymentRequest_completion___block_invoke;
    v14[3] = &unk_1E56D8590;
    SEL v16 = a2;
    id v9 = v7;
    void v14[4] = self;
    id v15 = v9;
    id v10 = a3;
    id v11 = [(PKPassLibrary *)self _inAppRemoteObjectProxyWithFailureHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__PKPassLibrary_canPresentPaymentRequest_completion___block_invoke_173;
    v12[3] = &unk_1E56DE1F8;
    v12[4] = self;
    id v13 = v9;
    [v11 canPresentPaymentRequest:v10 completion:v12];
  }
}

uint64_t __53__PKPassLibrary_canPresentPaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __53__PKPassLibrary_canPresentPaymentRequest_completion___block_invoke_173(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webDomain:(id)a6
{
  return [(PKPassLibrary *)self hasPassesWithSupportedNetworks:a3 merchantCapabilities:a4 issuerCountryCodes:a5 webDomain:a6 paymentRequestType:0 isMultiTokensRequest:0];
}

- (BOOL)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webDomain:(id)a6 paymentRequestType:(id)a7 isMultiTokensRequest:(BOOL)a8
{
  uint64_t v8 = a8;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v18 = [(PKPassLibrary *)self _synchronousInAppRemoteObjectProxyWithErrorHandler:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __138__PKPassLibrary_hasPassesWithSupportedNetworks_merchantCapabilities_issuerCountryCodes_webDomain_paymentRequestType_isMultiTokensRequest___block_invoke;
  v20[3] = &unk_1E56D86D0;
  void v20[4] = &v21;
  [v18 hasPassesWithSupportedNetworks:v14 merchantCapabilities:a4 webDomain:v16 issuerCountryCodes:v15 paymentRequestType:v17 isMultiTokensRequest:v8 completion:v20];
  LOBYTE(v8) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v8;
}

uint64_t __138__PKPassLibrary_hasPassesWithSupportedNetworks_merchantCapabilities_issuerCountryCodes_webDomain_paymentRequestType_isMultiTokensRequest___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)presentContactlessInterfaceForDefaultPassFromSource:(int64_t)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v16 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v15 = v8;
  id v9 = _Block_copy(aBlock);
  id v10 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_2;
  v12[3] = &unk_1E56D8798;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 presentContactlessInterfaceForDefaultPassFromSource:a3 handler:v12];
}

void __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_175;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_3;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_175(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_2(uint64_t a1, char a2)
{
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_2;
  v15[3] = &unk_1E56D8798;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 presentContactlessInterfaceForPassWithUniqueIdentifier:v11 fromSource:a4 handler:v15];
}

void __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_176;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_3;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_176(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_2(uint64_t a1, char a2)
{
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)activatePaymentPass:(PKPaymentPass *)paymentPass withActivationCode:(NSString *)activationCode completion:(void *)completion
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = paymentPass;
  char v9 = activationCode;
  id v10 = completion;
  if ([(NSString *)v9 length])
  {
    [(PKPassLibrary *)self _activateSecureElementPass:v8 withActivationCode:v9 activationData:0 completion:v10];
  }
  else
  {
    id v11 = PKLocalizedPaymentString(&cfstr_InvalidActivat_0.isa, 0);
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v14 = [v12 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v13];

    if (v10) {
      v10[2](v10, 0, v14);
    }
  }
}

- (void)activateSecureElementPass:(PKSecureElementPass *)secureElementPass withActivationData:(NSData *)activationData completion:(void *)completion
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = secureElementPass;
  char v9 = activationData;
  id v10 = completion;
  if ([(NSData *)v9 length])
  {
    [(PKPassLibrary *)self _activateSecureElementPass:v8 withActivationCode:0 activationData:v9 completion:v10];
  }
  else
  {
    id v11 = PKLocalizedPaymentString(&cfstr_InvalidActivat_1.isa, 0);
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v14 = [v12 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v13];

    if (v10) {
      v10[2](v10, 0, v14);
    }
  }
}

- (void)_activateSecureElementPass:(id)a3 withActivationCode:(id)a4 activationData:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [v11 dataAccessor];
  id v16 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [v15 library];
    id v18 = v17;
    if (!v17 || v17 == v16) {
      goto LABEL_10;
    }
    id v18 = v17;
    uint64_t v19 = (uint64_t)v18;
LABEL_9:

    id v16 = (PKPassLibrary *)v19;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v20 = [v11 passLibraryMachServiceName];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    int64_t v32 = a2;
    id v22 = [(PKXPCService *)v16->_remoteService machServiceName];
    uint64_t v23 = [v11 passLibraryMachServiceName];
    char v24 = [v22 isEqualToString:v23];

    if ((v24 & 1) == 0)
    {
      id v25 = [PKPassLibrary alloc];
      id v18 = [v11 passLibraryMachServiceName];
      uint64_t v19 = [(PKPassLibrary *)v25 initWithMachServiceName:v18 resumeNotificationName:0 interfaceType:0];
      a2 = v32;
      goto LABEL_9;
    }
    a2 = v32;
  }
LABEL_11:
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __89__PKPassLibrary__activateSecureElementPass_withActivationCode_activationData_completion___block_invoke;
  v36[3] = &unk_1E56D8590;
  SEL v39 = a2;
  id v26 = v12;
  id v38 = v26;
  id v27 = v16;
  v37 = v27;
  id v28 = [(PKPassLibrary *)v27 _remoteObjectProxyWithFailureHandler:v36];
  id v29 = [v11 uniqueID];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __89__PKPassLibrary__activateSecureElementPass_withActivationCode_activationData_completion___block_invoke_186;
  v33[3] = &unk_1E56D8928;
  long long v34 = v27;
  id v35 = v26;
  uint64_t v30 = v27;
  id v31 = v26;
  [v28 submitVerificationCode:v14 verificationData:v13 forPassWithUniqueID:v29 handler:v33];
}

uint64_t __89__PKPassLibrary__activateSecureElementPass_withActivationCode_activationData_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKPassLibrary %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "Error on PKPassLibrary connection.", (uint8_t *)&v5, 2u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __89__PKPassLibrary__activateSecureElementPass_withActivationCode_activationData_completion___block_invoke_186(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestUpdateOfObjectWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPassLibrary_requestUpdateOfObjectWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PKPassLibrary_requestUpdateOfObjectWithUniqueIdentifier_completion___block_invoke_187;
  v13[3] = &unk_1E56D8798;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateObjectWithUniqueIdentifier:v9 handler:v13];
}

uint64_t __70__PKPassLibrary_requestUpdateOfObjectWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __70__PKPassLibrary_requestUpdateOfObjectWithUniqueIdentifier_completion___block_invoke_187(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestPersonalizationOfPassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8
{
  id v15 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __155__PKPassLibrary_requestPersonalizationOfPassWithUniqueIdentifier_contact_personalizationToken_requiredPersonalizationFields_personalizationSource_handler___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v27 = a2;
  id v16 = v15;
  void aBlock[4] = self;
  id v26 = v16;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = _Block_copy(aBlock);
  uint64_t v21 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v20];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __155__PKPassLibrary_requestPersonalizationOfPassWithUniqueIdentifier_contact_personalizationToken_requiredPersonalizationFields_personalizationSource_handler___block_invoke_188;
  v23[3] = &unk_1E56D8798;
  v23[4] = self;
  id v24 = v16;
  id v22 = v16;
  [v21 personalizePassWithUniqueIdentifier:v19 contact:v18 personalizationToken:v17 requiredPersonalizationFields:a6 personalizationSource:a7 handler:v23];
}

uint64_t __155__PKPassLibrary_requestPersonalizationOfPassWithUniqueIdentifier_contact_personalizationToken_requiredPersonalizationFields_personalizationSource_handler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __155__PKPassLibrary_requestPersonalizationOfPassWithUniqueIdentifier_contact_personalizationToken_requiredPersonalizationFields_personalizationSource_handler___block_invoke_188(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removePass:(PKPass *)pass
{
  if (pass)
  {
    id v4 = [(PKObject *)pass uniqueID];
    [(PKPassLibrary *)self removePassWithUniqueID:v4 diagnosticReason:0];
  }
}

- (void)removePasses:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "uniqueID", (void)v14);
        id v12 = v11;
        if (v11 && [v11 length]) {
          [v5 addObject:v12];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v13 = (void *)[v5 copy];
  [(PKPassLibrary *)self removePassesWithUniqueIDs:v13 diagnosticReason:0];
}

- (void)getContainmentStatusAndSettingsForPass:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPassLibrary_getContainmentStatusAndSettingsForPass_withHandler___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v26 = a2;
  id v9 = v8;
  void aBlock[4] = self;
  id v25 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  id v11 = [(PKPassLibrary *)self _remoteObjectProxyWithFailureHandler:v10];
  id v12 = [v7 passTypeIdentifier];
  id v13 = [v7 serialNumber];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __68__PKPassLibrary_getContainmentStatusAndSettingsForPass_withHandler___block_invoke_189;
  v16[3] = &unk_1E56DE220;
  id v14 = v7;
  id v17 = v14;
  uint64_t v20 = v23;
  uint64_t v21 = v22;
  id v15 = v9;
  id v18 = self;
  id v19 = v15;
  [v11 getManifestHashAndSettingsForPassTypeID:v12 serialNumber:v13 handler:v16];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
}

uint64_t __68__PKPassLibrary_getContainmentStatusAndSettingsForPass_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __68__PKPassLibrary_getContainmentStatusAndSettingsForPass_withHandler___block_invoke_189(void *a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    int v5 = (void *)a1[4];
    id v6 = a2;
    uint64_t v7 = [v5 manifestHash];
    int v8 = [v6 isEqualToData:v7];

    uint64_t v9 = 1;
    if (!v8) {
      uint64_t v9 = 2;
    }
    *(void *)(*(void *)(a1[7] + 8) + 24) = v9;
    *(void *)(*(void *)(a1[8] + 8) + 24) = a3;
  }
  uint64_t v10 = *(uint64_t (**)(void))(a1[6] + 16);
  return v10();
}

- (void)updateIngestedDate:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v8 updateIngestedDate:v7 forPassWithUniqueID:v6];
}

- (void)noteObjectSharedWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v5 noteObjectSharedWithUniqueID:v4];
}

- (void)updateSettings:(unint64_t)a3 forObjectWithUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v7 updateSettings:a3 forObjectWithUniqueID:v6];
}

- (void)setSortingState:(int64_t)a3 forObjectWithUniqueID:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v10 setSortingState:a3 forObjectWithUniqueID:v9 withCompletion:v8];
}

- (unint64_t)setLiveRenderingEnabled:(BOOL)a3 forPassUniqueID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PKPassLibrary_setLiveRenderingEnabled_forPassUniqueID___block_invoke;
  v11[3] = &unk_1E56DE248;
  void v11[4] = &v12;
  id v7 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PKPassLibrary_setLiveRenderingEnabled_forPassUniqueID___block_invoke_2;
  v10[3] = &unk_1E56D8608;
  void v10[4] = &v12;
  [v7 usingSynchronousProxy:1 setLiveRenderingEnabled:v4 forPassUniqueID:v6 handler:v10];
  unint64_t v8 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __57__PKPassLibrary_setLiveRenderingEnabled_forPassUniqueID___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __57__PKPassLibrary_setLiveRenderingEnabled_forPassUniqueID___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)dynamicStateForPassUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__11;
  uint64_t v14 = __Block_byref_object_dispose__11;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PKPassLibrary_dynamicStateForPassUniqueID___block_invoke;
  v9[3] = &unk_1E56DE248;
  v9[4] = &v10;
  id v5 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PKPassLibrary_dynamicStateForPassUniqueID___block_invoke_2;
  v8[3] = &unk_1E56DE270;
  void v8[4] = &v10;
  [v5 usingSynchronousProxy:1 dynamicStateForPassUniqueID:v4 handler:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __45__PKPassLibrary_dynamicStateForPassUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __45__PKPassLibrary_dynamicStateForPassUniqueID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)rescheduleCommutePlanRenewalReminderForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v5 rescheduleCommutePlanRenewalReminderForPassWithUniqueID:v4];
}

- (void)checkForTransitNotification
{
  id v2 = [(PKPassLibrary *)self _remoteObjectProxy];
  [v2 checkForTransitNotification];
}

- (void)postUpgradedPassNotificationForMarket:(id)a3 passUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPassLibrary *)self _remoteObjectProxy];
  [v8 postUpgradedPassNotificationForMarket:v7 passUniqueID:v6];
}

- (void)postUpgradesAvailableNotificationForMarket:(id)a3 passUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPassLibrary *)self _remoteObjectProxy];
  [v8 usingSynchronousProxy:0 postUpgradesAvailableNotificationForMarket:v7 passUniqueID:v6];
}

- (void)signData:(NSData *)signData withSecureElementPass:(PKSecureElementPass *)secureElementPass completion:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = signData;
  uint64_t v10 = secureElementPass;
  id v11 = completion;
  if (v11)
  {
    if (v9 && v10)
    {
      remoteLibrary = self;
      if ([(PKPass *)v10 isRemotePass]) {
        remoteLibrary = self->_remoteLibrary;
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __59__PKPassLibrary_signData_withSecureElementPass_completion___block_invoke;
      v20[3] = &unk_1E56DD260;
      SEL v22 = a2;
      id v13 = v11;
      void v20[4] = self;
      uint64_t v21 = v13;
      uint64_t v14 = [(PKPassLibrary *)remoteLibrary _remoteObjectProxyWithErrorHandler:v20];
      id v15 = [(PKObject *)v10 uniqueID];
      [v14 signData:v9 forPassUniqueID:v15 completion:v13];

      long long v16 = v21;
    }
    else
    {
      id v18 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412802;
        id v24 = v19;
        __int16 v25 = 2112;
        SEL v26 = v9;
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] requires all input values -> signData: %@ secureElementPass: %@", buf, 0x20u);
      }
      long long v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
      (*((void (**)(void *, void, void, NSObject *))v11 + 2))(v11, 0, 0, v16);
    }
  }
  else
  {
    long long v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412290;
      id v24 = v17;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] had no completion", buf, 0xCu);
    }
  }
}

void __59__PKPassLibrary_signData_withSecureElementPass_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@] error: %@;",
      (uint8_t *)&v7,
      0x16u);
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)encryptedServiceProviderDataForSecureElementPass:(PKSecureElementPass *)secureElementPass completion:(void *)completion
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v7 = secureElementPass;
  id v8 = completion;
  if (v8)
  {
    if (v7)
    {
      remoteLibrary = self;
      if ([(PKPass *)v7 isRemotePass]) {
        remoteLibrary = self->_remoteLibrary;
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __77__PKPassLibrary_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke;
      v17[3] = &unk_1E56DD260;
      SEL v19 = a2;
      id v10 = v8;
      v17[4] = self;
      id v18 = v10;
      uint64_t v11 = [(PKPassLibrary *)remoteLibrary _remoteObjectProxyWithErrorHandler:v17];
      uint64_t v12 = [(PKObject *)v7 uniqueID];
      [v11 usingSynchronousProxy:0 getEncryptedServiceProviderDataForUniqueID:v12 completion:v10];

      id v13 = v18;
    }
    else
    {
      id v15 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        uint64_t v23 = 0;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] requires all input values -> secureElementPass: %@", buf, 0x16u);
      }
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
      (*((void (**)(void *, void, NSObject *))v8 + 2))(v8, 0, v13);
    }
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = v14;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] had no completion", buf, 0xCu);
    }
  }
}

void __77__PKPassLibrary_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@] error: %@;",
      (uint8_t *)&v7,
      0x16u);
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)serviceProviderDataForSecureElementPass:(PKSecureElementPass *)secureElementPass completion:(void *)completion
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v7 = secureElementPass;
  id v8 = completion;
  if (v8)
  {
    if (v7)
    {
      remoteLibrary = self;
      if ([(PKPass *)v7 isRemotePass]) {
        remoteLibrary = self->_remoteLibrary;
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __68__PKPassLibrary_serviceProviderDataForSecureElementPass_completion___block_invoke;
      v17[3] = &unk_1E56DD260;
      SEL v19 = a2;
      id v10 = v8;
      v17[4] = self;
      id v18 = v10;
      uint64_t v11 = [(PKPassLibrary *)remoteLibrary _remoteObjectProxyWithErrorHandler:v17];
      uint64_t v12 = [(PKObject *)v7 uniqueID];
      [v11 usingSynchronousProxy:0 getServiceProviderDataForUniqueID:v12 completion:v10];

      id v13 = v18;
    }
    else
    {
      id v15 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        uint64_t v23 = 0;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] requires all input values -> secureElementPass: %@", buf, 0x16u);
      }
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
      (*((void (**)(void *, void, NSObject *))v8 + 2))(v8, 0, v13);
    }
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = v14;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] had no completion", buf, 0xCu);
    }
  }
}

void __68__PKPassLibrary_serviceProviderDataForSecureElementPass_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@] error: %@;",
      (uint8_t *)&v7,
      0x16u);
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3
{
  return [(PKPassLibrary *)self canAddSecureElementPassWithConfiguration:a3 outError:0];
}

- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__11;
  id v18 = __Block_byref_object_dispose__11;
  id v19 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPassLibrary_canAddSecureElementPassWithConfiguration_outError___block_invoke;
  aBlock[3] = &unk_1E56DE298;
  void aBlock[4] = &v14;
  void aBlock[5] = a2;
  id v8 = _Block_copy(aBlock);
  __int16 v9 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PKPassLibrary_canAddSecureElementPassWithConfiguration_outError___block_invoke_192;
  v12[3] = &unk_1E56DE2C0;
  v12[4] = &v20;
  void v12[5] = &v14;
  [v9 usingSynchronousProxy:1 canAddSecureElementPassWithConfiguration:v7 completion:v12];
  if (a4) {
    *a4 = (id) v15[5];
  }
  char v10 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __67__PKPassLibrary_canAddSecureElementPassWithConfiguration_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412546;
    char v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]: %@;",
      (uint8_t *)&v9,
      0x16u);
  }
  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __67__PKPassLibrary_canAddSecureElementPassWithConfiguration_outError___block_invoke_192(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __69__PKPassLibrary_canAddSecureElementPassWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412546;
    int v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]: %@;",
      (uint8_t *)&v8,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PKPassLibrary_canAddCarKeyPassWithConfiguration_completion___block_invoke;
    aBlock[3] = &unk_1E56DE2E8;
    SEL v17 = a2;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = _Block_copy(aBlock);
    uint64_t v12 = [(PKPassLibrary *)self _remoteObjectProxyWithErrorHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__PKPassLibrary_canAddCarKeyPassWithConfiguration_completion___block_invoke_194;
    v13[3] = &unk_1E56DE310;
    void v13[4] = self;
    id v14 = v9;
    [v12 usingSynchronousProxy:0 canAddCarKeyPassWithConfiguration:v10 completion:v13];
  }
}

void __62__PKPassLibrary_canAddCarKeyPassWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]: %@;",
      (uint8_t *)&v8,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v7);
}

uint64_t __62__PKPassLibrary_canAddCarKeyPassWithConfiguration_completion___block_invoke_194(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4
{
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PKPassLibrary_meetsProvisioningRequirements_completion___block_invoke;
    aBlock[3] = &unk_1E56DE2E8;
    SEL v17 = a2;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = _Block_copy(aBlock);
    uint64_t v12 = [(PKPassLibrary *)self _remoteObjectProxyWithErrorHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__PKPassLibrary_meetsProvisioningRequirements_completion___block_invoke_196;
    v13[3] = &unk_1E56DE338;
    void v13[4] = self;
    id v14 = v9;
    [v12 usingSynchronousProxy:0 meetsProvisioningRequirements:v10 completion:v13];
  }
}

void __58__PKPassLibrary_meetsProvisioningRequirements_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]: %@;",
      (uint8_t *)&v6,
      0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__PKPassLibrary_meetsProvisioningRequirements_completion___block_invoke_196(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__11;
  id v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  id v7 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PKPassLibrary_meetsProvisioningRequirements_missingRequirements___block_invoke;
  v10[3] = &unk_1E56DE360;
  void v10[5] = &v17;
  v10[6] = &v11;
  void v10[4] = self;
  [v7 usingSynchronousProxy:1 meetsProvisioningRequirements:v6 completion:v10];
  if (a4) {
    *a4 = (id) v12[5];
  }
  char v8 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __67__PKPassLibrary_meetsProvisioningRequirements_missingRequirements___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
}

- (id)passForProvisioningCredentialHash:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__11;
  id v18 = __Block_byref_object_dispose__11;
  id v19 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__11;
  void v10[4] = __Block_byref_object_dispose__11;
  id v11 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PKPassLibrary_passForProvisioningCredentialHash___block_invoke;
  v9[3] = &unk_1E56DE388;
  v9[4] = v12;
  void v9[5] = v10;
  id v5 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PKPassLibrary_passForProvisioningCredentialHash___block_invoke_2;
  v8[3] = &unk_1E56DE3B0;
  void v8[4] = self;
  void v8[5] = &v14;
  [v5 usingSynchronousProxy:1 getPassForProvisioningCredentialHash:v4 handler:v8];
  id v6 = (id)v15[5];

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __51__PKPassLibrary_passForProvisioningCredentialHash___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void __51__PKPassLibrary_passForProvisioningCredentialHash___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) _applyDataAccessorToObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)fetchContentForUniqueID:(id)a3 withCompletion:(id)a4
{
}

uint64_t __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)cachedImageSetForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(PKPassLibrary *)self _hasInterfaceOfType:2]
    && +[PKImageSet shouldCacheForDisplayProfile:v11 imageSetType:a4])
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    char v20 = __Block_byref_object_copy__11;
    uint64_t v21 = __Block_byref_object_dispose__11;
    id v22 = 0;
    char v13 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke;
    v16[3] = &unk_1E56DE478;
    void v16[4] = &v17;
    void v16[5] = a4;
    [v13 usingSynchronousProxy:1 getCachedImageSetContainerForUniqueID:v10 type:a4 withDisplayProfile:v11 displayTraits:v12 handler:v16];
    id v14 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PKPassLibraryImageSetCache();
    int v5 = [v3 imageSetHash];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke_2;
    v11[3] = &unk_1E56DE428;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 40);
    id v12 = v6;
    uint64_t v13 = v7;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke_3;
    v8[3] = &unk_1E56DE450;
    uint64_t v10 = *(void *)(a1 + 32);
    id v9 = v6;
    [v4 retrieveItemForKey:v5 synchronous:1 retrievalBlock:v11 deliveryBlock:v8];
  }
}

void __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)[*(id *)(a1 + 32) consumeImageSet];
  [*(id *)(a1 + 32) invalidate];
  if (v3 && [(id)objc_opt_class() imageSetType] != *(void *)(a1 + 40))
  {

    id v3 = 0;
  }
  v4[2](v4, v3);
}

void __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) invalidate];
}

- (void)fetchImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 withCompletion:(id)a7
{
}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_fetchImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 usingSynchronousProxy:(BOOL)a7 withCompletion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v17)
  {
    id v18 = GenerateKeyImageSetCacheKey(a4, v15);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke;
    aBlock[3] = &unk_1E56DE540;
    int64_t v27 = a4;
    void aBlock[4] = self;
    BOOL v28 = v9;
    id v24 = v14;
    id v25 = v15;
    id v26 = v16;
    uint64_t v19 = _Block_copy(aBlock);
    char v20 = PKPassLibraryImageSetCache();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_6;
    v21[3] = &unk_1E56DE568;
    id v22 = v17;
    [v20 retrieveItemForKey:v18 synchronous:v9 retrievalBlock:v19 deliveryBlock:v21];
  }
}

void __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_2;
  aBlock[3] = &unk_1E56DE590;
  uint64_t v22 = *(void *)(a1 + 64);
  id v4 = v3;
  void aBlock[4] = *(void *)(a1 + 32);
  id v21 = v4;
  int v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_3;
  v18[3] = &unk_1E56D8388;
  id v6 = v5;
  id v19 = v6;
  uint64_t v7 = _Block_copy(v18);
  char v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 72)) {
    [v8 _synchronousRemoteObjectProxyWithErrorHandler:v7];
  }
  else {
  BOOL v9 = [v8 _remoteObjectProxyWithErrorHandler:v7];
  }
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_4;
  v15[3] = &unk_1E56DE5B8;
  char v17 = *(unsigned char *)(a1 + 72);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v6;
  id v14 = v6;
  [v9 getImageSetForUniqueID:v10 ofType:v12 displayProfile:v11 suffix:v13 handler:v15];
}

void __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    if ([(id)objc_opt_class() imageSetType] == *(void *)(a1 + 48))
    {
      id v4 = v5;
      goto LABEL_6;
    }
  }
  id v4 = 0;
LABEL_6:
  id v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_5;
    v5[3] = &unk_1E56D83D8;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_setSetting:(unint64_t)a3 enabled:(BOOL)a4 forPass:(id)a5
{
  id v8 = a5;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__PKPassLibrary__setSetting_enabled_forPass___block_invoke;
  v13[3] = &unk_1E56DE5E0;
  BOOL v18 = a4;
  void v13[4] = self;
  unint64_t v17 = a3;
  id v10 = v8;
  id v14 = v10;
  id v16 = &v19;
  uint64_t v11 = v9;
  id v15 = v11;
  [(PKPassLibrary *)self getContainmentStatusAndSettingsForPass:v10 withHandler:v13];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

intptr_t __45__PKPassLibrary__setSetting_enabled_forPass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = v5 | a3;
  uint64_t v7 = a3 & ~v5;
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v7;
  }
  dispatch_semaphore_t v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) uniqueID];
  [v9 updateSettings:v8 forObjectWithUniqueID:v10];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2 != 0;
  uint64_t v11 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v11);
}

- (BOOL)setShowInLockScreenEnabled:(BOOL)a3 forPass:(id)a4
{
  return [(PKPassLibrary *)self _setSetting:1 enabled:a3 forPass:a4];
}

- (BOOL)setAutomaticUpdatesEnabled:(BOOL)a3 forPass:(id)a4
{
  return [(PKPassLibrary *)self _setSetting:2 enabled:a3 forPass:a4];
}

- (BOOL)setNotificationServiceUpdatesEnabled:(BOOL)a3 forPass:(id)a4
{
  return [(PKPassLibrary *)self _setSetting:8 enabled:a3 forPass:a4];
}

- (BOOL)setAutomaticPresentationEnabled:(BOOL)a3 forPass:(id)a4
{
  return [(PKPassLibrary *)self _setSetting:16 enabled:a3 forPass:a4];
}

- (BOOL)setSuppressNotificationsEnabled:(BOOL)a3 forPass:(id)a4
{
  return [(PKPassLibrary *)self _setSetting:128 enabled:a3 forPass:a4];
}

- (BOOL)setSuppressPromotionsEnabled:(BOOL)a3 forPass:(id)a4
{
  return [(PKPassLibrary *)self _setSetting:256 enabled:a3 forPass:a4];
}

- (BOOL)resetSettingsForPass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() defaultSettings];
  uint64_t v6 = [v4 uniqueID];

  [(PKPassLibrary *)self updateSettings:v5 forObjectWithUniqueID:v6];
  return 1;
}

void __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)expressFelicaTransitPasses
{
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__11;
  long long v36 = __Block_byref_object_dispose__11;
  id v37 = 0;
  uint64_t v26 = 0;
  int64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__11;
  uint64_t v30 = __Block_byref_object_dispose__11;
  id v31 = 0;
  dispatch_group_t v4 = dispatch_group_create();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke;
  aBlock[3] = &unk_1E56DE608;
  SEL v25 = a2;
  uint64_t v5 = v4;
  id v24 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = [(PKPassLibrary *)self _remoteObjectProxyWithFailureHandler:v6];
  uint64_t v8 = [(PKPassLibrary *)self->_remoteLibrary _remoteObjectProxyWithFailureHandler:v6];
  dispatch_group_enter(v5);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke_206;
  v20[3] = &unk_1E56DE3B0;
  char v22 = &v32;
  dispatch_semaphore_t v9 = v5;
  uint64_t v21 = v9;
  [v7 expressTransitPassWithHandler:v20];
  if ([(PKPassLibrary *)self _hasRemoteLibrary])
  {
    dispatch_group_enter(v9);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke_2;
    unint64_t v17 = &unk_1E56DE3B0;
    uint64_t v19 = &v26;
    BOOL v18 = v9;
    [v8 expressTransitPassWithHandler:&v14];
  }
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = v10;
  if (v33[5]) {
    objc_msgSend(v10, "addObject:");
  }
  if (v27[5]) {
    objc_msgSend(v11, "addObject:");
  }
  if (!objc_msgSend(v11, "count", v14, v15, v16, v17))
  {

    uint64_t v11 = 0;
  }
  uint64_t v12 = (void *)[v11 copy];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v12;
}

void __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke_206(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)sortedTransitPassesForTransitNetworkIdentifiersWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__PKPassLibrary_sortedTransitPassesForTransitNetworkIdentifiersWithCompletion___block_invoke;
    aBlock[3] = &unk_1E56DC4C0;
    SEL v14 = a2;
    id v7 = v5;
    id v13 = v7;
    uint64_t v8 = _Block_copy(aBlock);
    dispatch_semaphore_t v9 = [(PKPassLibrary *)self _remoteObjectProxyWithFailureHandler:v8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__PKPassLibrary_sortedTransitPassesForTransitNetworkIdentifiersWithCompletion___block_invoke_207;
    v10[3] = &unk_1E56DE680;
    void v10[4] = self;
    id v11 = v7;
    [v9 sortedTransitPassesForTransitNetworkIdentifiers:v10];
  }
}

uint64_t __79__PKPassLibrary_sortedTransitPassesForTransitNetworkIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__PKPassLibrary_sortedTransitPassesForTransitNetworkIdentifiersWithCompletion___block_invoke_207(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(v3, "allValues", 0);
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
        [*(id *)(a1 + 32) _applyDataAccessorToObjects:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sortedTransitPassesForAppletDataFormat:(id)a3 completion:(id)a4
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKPassLibrary_sortedTransitPassesForAppletDataFormat_completion___block_invoke;
    aBlock[3] = &unk_1E56DC4C0;
    SEL v17 = a2;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    long long v11 = _Block_copy(aBlock);
    long long v12 = [(PKPassLibrary *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__PKPassLibrary_sortedTransitPassesForAppletDataFormat_completion___block_invoke_208;
    v13[3] = &unk_1E56D8810;
    void v13[4] = self;
    id v14 = v9;
    [v12 sortedTransitPassesForAppletDataFormat:v10 handler:v13];
  }
}

uint64_t __67__PKPassLibrary_sortedTransitPassesForAppletDataFormat_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__PKPassLibrary_sortedTransitPassesForAppletDataFormat_completion___block_invoke_208(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _applyDataAccessorToObjects:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_sortedPaymentPassesForPaymentRequest:(id)a3
{
  return [(PKPassLibrary *)self _sortedPaymentPassesForPaymentRequest:a3 additionalPaymentPasses:0];
}

- (id)_sortedPaymentPassesForPaymentRequest:(id)a3 additionalPaymentPasses:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v35 = [v6 isPeerPaymentRequest];
  long long v36 = v6;
  uint64_t v8 = [(PKPassLibrary *)self inAppPaymentPassesForPaymentRequest:v6];
  id v9 = [v8 allObjects];
  id v10 = (void *)[v9 mutableCopy];

  long long v11 = objc_msgSend(v10, "pk_createSetByApplyingBlock:", &__block_literal_global_211_0);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        SEL v17 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        BOOL v18 = [v17 uniqueID];
        char v19 = [v11 containsObject:v18];

        if ((v19 & 1) == 0) {
          [v10 safelyAddObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v14);
  }

  if ((unint64_t)[v10 count] <= 1)
  {
    char v20 = (void *)[v10 copy];
    uint64_t v21 = v36;
    goto LABEL_22;
  }
  char v22 = [(PKPassLibrary *)self defaultPaymentPassesWithRemotePasses:0];
  if ([v22 count]
    && ([v22 objectAtIndexedSubscript:0],
        char v23 = objc_claimAutoreleasedReturnValue(),
        [v23 uniqueID],
        id v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        v23,
        v24))
  {
    SEL v25 = [v22 objectAtIndexedSubscript:0];
    uint64_t v26 = [v25 uniqueID];

    int64_t v27 = 0;
    uint64_t v21 = v36;
    char v28 = v35;
    if (!v35) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v21 = v36;
    char v28 = v35;
    if ((v35 & 1) == 0)
    {
      uint64_t v30 = [v36 countryCode];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_2;
      v41[3] = &unk_1E56DE6C8;
      id v42 = v30;
      id v29 = v30;
      id v31 = objc_msgSend(v10, "pk_firstObjectPassingTest:", v41);
      uint64_t v26 = [v31 uniqueID];

      int64_t v27 = 0;
      goto LABEL_20;
    }
    uint64_t v26 = 0;
  }
  id v29 = +[PKPeerPaymentService sharedInstance];
  int64_t v27 = [v29 lastUsedAlternateFundingSourcePassUniqueIdentifier];
LABEL_20:

LABEL_21:
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_4;
  v37[3] = &unk_1E56DE6F0;
  char v40 = v28;
  id v38 = v27;
  id v39 = v26;
  id v32 = v26;
  id v33 = v27;
  char v20 = [v10 sortedArrayUsingComparator:v37];

LABEL_22:
  return v20;
}

uint64_t __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueID];
}

uint64_t __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 deviceInAppPaymentApplications];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_3;
  v6[3] = &unk_1E56DBA28;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "pk_hasObjectPassingTest:", v6);

  return v4;
}

uint64_t __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isRequiredForMerchantInCountry:*(void *)(a1 + 32)];
}

uint64_t __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 48))
  {
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      uint64_t v8 = [v5 uniqueID];
      int v9 = [v7 isEqualToString:v8];

      id v10 = *(void **)(a1 + 32);
      long long v11 = [v6 uniqueID];
      int v12 = [v10 isEqualToString:v11];

      if (v9 && !v12) {
        goto LABEL_12;
      }
      if ((v9 | v12 ^ 1) != 1) {
        goto LABEL_15;
      }
    }
    uint64_t v13 = [v5 devicePrimaryInAppPaymentApplication];
    uint64_t v14 = [v13 paymentType];

    uint64_t v15 = [v6 devicePrimaryInAppPaymentApplication];
    uint64_t v16 = [v15 paymentType];

    if (v14 == 1 && v16 != 1) {
      goto LABEL_12;
    }
    if (v14 != 1 && v16 == 1)
    {
LABEL_15:
      uint64_t v23 = 1;
      goto LABEL_16;
    }
  }
  SEL v17 = *(void **)(a1 + 40);
  BOOL v18 = [v5 uniqueID];
  int v19 = [v17 isEqualToString:v18];

  char v20 = *(void **)(a1 + 40);
  uint64_t v21 = [v6 uniqueID];
  int v22 = [v20 isEqualToString:v21];

  if (!v19 || v22)
  {
    if ((v19 | v22 ^ 1) == 1)
    {
      id v24 = [v5 ingestedDate];
      SEL v25 = [v6 ingestedDate];
      uint64_t v23 = [v24 compare:v25];

      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v23 = -1;
LABEL_16:

  return v23;
}

- (id)_defaultPaymentPassForPaymentRequest:(id)a3
{
  id v3 = [(PKPassLibrary *)self _sortedPaymentPassesForPaymentRequest:a3];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (BOOL)supportsSearchForPassUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PKPassLibrary_supportsSearchForPassUniqueID___block_invoke;
  v8[3] = &unk_1E56D86D0;
  void v8[4] = &v9;
  [v5 supportsSearchForPassUniqueID:v4 completion:v8];
  char v6 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __47__PKPassLibrary_supportsSearchForPassUniqueID___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PKPassLibrary_pushProvisioningNoncesWithCredentialCount_completion___block_invoke;
  v13[3] = &unk_1E56DD260;
  SEL v15 = a2;
  id v8 = v7;
  void v13[4] = self;
  id v14 = v8;
  uint64_t v9 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PKPassLibrary_pushProvisioningNoncesWithCredentialCount_completion___block_invoke_216;
  v11[3] = &unk_1E56DD728;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 pushProvisioningNoncesWithCredentialCount:a3 completion:v11];
}

void __70__PKPassLibrary_pushProvisioningNoncesWithCredentialCount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
  char v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v6);
  }
}

uint64_t __70__PKPassLibrary_pushProvisioningNoncesWithCredentialCount_completion___block_invoke_216(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)configurePushProvisioningConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__PKPassLibrary_configurePushProvisioningConfiguration_completion___block_invoke;
  v8[3] = &unk_1E56DE718;
  id v9 = v6;
  id v7 = v6;
  [(PKPassLibrary *)self configurePushProvisioningConfigurationV2:a3 completion:v8];
}

void __67__PKPassLibrary_configurePushProvisioningConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 shareablePassConfiguration];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)configurePushProvisioningConfigurationV2:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke;
    v23[3] = &unk_1E56DD260;
    SEL v25 = a2;
    id v10 = v8;
    void v23[4] = self;
    id v24 = v10;
    id v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v23];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v7;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;
    if (objc_opt_respondsToSelector())
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke_221;
      v21[3] = &unk_1E56DE740;
      void v21[4] = self;
      id v22 = v10;
      [v11 usingSynchronousProxy:0 configurePushProvisioningConfigurationV2:v7 completion:v21];
      id v14 = v22;
    }
    else
    {
      SEL v15 = PKLogFacilityTypeGetObject(0);
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v16)
        {
          SEL v17 = NSStringFromSelector(a2);
          *(_DWORD *)long long buf = 138412290;
          int64_t v27 = v17;
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "-[PKPassLibrary %@] falling back to usingSynchronousProxy:configurePushProvisioningConfiguration:completion: as v2 is not supported", buf, 0xCu);
        }
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke_222;
        v19[3] = &unk_1E56DE768;
        void v19[4] = self;
        id v20 = v10;
        [v11 usingSynchronousProxy:0 configurePushProvisioningConfiguration:v13 completion:v19];
        id v14 = v20;
      }
      else
      {
        if (v16)
        {
          BOOL v18 = NSStringFromSelector(a2);
          *(_DWORD *)long long buf = 138412546;
          int64_t v27 = v18;
          __int16 v28 = 2112;
          id v29 = v7;
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Non PKAddShareablePassConfiguration used with proxy that does not yet su"
            "pport usingSynchronousProxy:configurePushProvisioningConfigurationV2:completion: - %@",
            buf,
            0x16u);
        }
        id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
      }
    }
  }
}

void __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v6);
  }
}

uint64_t __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke_221(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke_222(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke;
    v14[3] = &unk_1E56DD260;
    SEL v16 = a2;
    id v9 = v7;
    void v14[4] = self;
    id v15 = v9;
    id v10 = a3;
    id v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke_224;
    void v12[3] = &unk_1E56D8D50;
    id v13 = v9;
    [v11 startVehicleConnectionSessionWithPassUniqueIdentifier:v10 completion:v12];
  }
}

void __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

void __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke_224(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke_2;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)sendRKEPassThroughMessage:(id)a3 forSessionIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  BOOL v12 = 0;
  if (v9 && v10)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    uint64_t v17 = 0;
    BOOL v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__11;
    uint64_t v21 = __Block_byref_object_dispose__11;
    id v22 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __70__PKPassLibrary_sendRKEPassThroughMessage_forSessionIdentifier_error___block_invoke;
    v16[3] = &unk_1E56DD328;
    void v16[4] = self;
    void v16[5] = a2;
    id v13 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v16];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__PKPassLibrary_sendRKEPassThroughMessage_forSessionIdentifier_error___block_invoke_225;
    v15[3] = &unk_1E56DE2C0;
    v15[4] = &v23;
    void v15[5] = &v17;
    [v13 sendRKEPassThroughMessage:v9 forSessionIdentifier:v11 withCompletion:v15];
    if (a5) {
      *a5 = (id) v18[5];
    }
    BOOL v12 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }

  return v12;
}

void __70__PKPassLibrary_sendRKEPassThroughMessage_forSessionIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 40);
    id v6 = a2;
    id v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

void __70__PKPassLibrary_sendRKEPassThroughMessage_forSessionIdentifier_error___block_invoke_225(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)invalidateVehicleConnectionSessionIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    int v8 = __62__PKPassLibrary_invalidateVehicleConnectionSessionIdentifier___block_invoke;
    id v9 = &unk_1E56DD328;
    __int16 v10 = self;
    SEL v11 = a2;
    id v4 = a3;
    id v5 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:&v6];
    objc_msgSend(v5, "invalidateVehicleConnectionSessionIdentifier:", v4, v6, v7, v8, v9, v10, v11);
  }
}

void __62__PKPassLibrary_invalidateVehicleConnectionSessionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 40);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (id)backupMetadata
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__11;
  id v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__PKPassLibrary_backupMetadata__block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void aBlock[4] = a2;
  id v3 = _Block_copy(aBlock);
  id v4 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__PKPassLibrary_backupMetadata__block_invoke_226;
  v7[3] = &unk_1E56DDEE0;
  void v7[4] = &v9;
  [v4 backupMetadataWithHandler:v7];
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __31__PKPassLibrary_backupMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 32);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

void __31__PKPassLibrary_backupMetadata__block_invoke_226(uint64_t a1, void *a2)
{
}

- (void)setBackupMetadata:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PKPassLibrary_setBackupMetadata___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void aBlock[4] = a2;
  id v4 = a3;
  id v5 = _Block_copy(aBlock);
  id v6 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__PKPassLibrary_setBackupMetadata___block_invoke_227;
  v7[3] = &unk_1E56D8AE0;
  void v7[4] = self;
  [v6 setBackupMetadata:v4 handler:v7];
}

void __35__PKPassLibrary_setBackupMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 32);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (void)prepareForBackupRestoreWithExistingPreferencesData:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKPassLibrary_prepareForBackupRestoreWithExistingPreferencesData___block_invoke;
    aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    void aBlock[4] = a2;
    id v6 = _Block_copy(aBlock);
    uint64_t v7 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v6];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PKPassLibrary_prepareForBackupRestoreWithExistingPreferencesData___block_invoke_228;
    v8[3] = &unk_1E56D8AE0;
    void v8[4] = self;
    [v7 prepareForBackupRestoreWithExistingPreferencesData:v5 handler:v8];
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "prepareForBackupRestoreWithExistingPreferencesData - Error: No plist data passed in.", buf, 2u);
    }
  }
}

void __68__PKPassLibrary_prepareForBackupRestoreWithExistingPreferencesData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 32);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (void)prepareForBackupRestoreWithSafeHavenPath:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v46 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "prepareForBackupRestoreWithSafeHavenPath - Starting prepare for backup restore with safe haven path: %@", buf, 0xCu);
  }

  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "prepareForBackupRestoreWithSafeHavenPath - Error: No path passed in.", buf, 2u);
    }
    uint64_t v7 = v6;
    goto LABEL_30;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PKPassLibrary_prepareForBackupRestoreWithSafeHavenPath___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void aBlock[4] = a2;
  uint64_t v7 = _Block_copy(aBlock);
  int v8 = PKRequiredPaymentSetupFileURLs();
  long long v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (!v9) {
    goto LABEL_27;
  }
  uint64_t v10 = v9;
  uint64_t v35 = *(void *)v40;
  unint64_t v11 = 0x1E4F28000uLL;
  oslog = v6;
  id v32 = v7;
  id v33 = self;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v40 != v35) {
        objc_enumerationMutation(obj);
      }
      id v13 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "path", oslog);
      id v14 = v5;
      id v15 = [v5 stringByAppendingPathComponent:v13];
      SEL v16 = [*(id *)(v11 + 3256) defaultManager];
      uint64_t v17 = [v15 stringByDeletingLastPathComponent];
      id v38 = 0;
      int v18 = [v16 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v38];
      id v19 = v38;

      if (!v18)
      {
        id v6 = oslog;
        BOOL v25 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        char v26 = oslog;
        id v5 = v14;
        if (v25)
        {
          int64_t v27 = [v19 description];
          *(_DWORD *)long long buf = 138543362;
          id v46 = v27;
          __int16 v28 = "Unable to create parent directories within safe haven: %{public}@";
LABEL_22:
          _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);

          char v26 = v6;
        }
LABEL_26:

        uint64_t v7 = v32;
        self = v33;
        goto LABEL_27;
      }
      unint64_t v20 = v11;
      uint64_t v21 = [*(id *)(v11 + 3256) defaultManager];
      int v22 = [v21 createFileAtPath:v15 contents:0 attributes:0];

      if (!v22)
      {
        id v6 = oslog;
        BOOL v29 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        char v26 = oslog;
        id v5 = v14;
        if (v29)
        {
          int64_t v27 = [v19 description];
          *(_DWORD *)long long buf = 138543362;
          id v46 = v27;
          __int16 v28 = "Failed to create file in safe haven: %{public}@";
          goto LABEL_22;
        }
        goto LABEL_26;
      }
      uint64_t v23 = [MEMORY[0x1E4F28CB0] fileHandleForUpdatingAtPath:v15];
      id v5 = v14;
      if (!v23)
      {
        id v6 = oslog;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v46 = v15;
          _os_log_impl(&dword_190E10000, oslog, OS_LOG_TYPE_DEFAULT, "Failed to create file handle for path: %{public}@", buf, 0xCu);
        }

        char v26 = 0;
        goto LABEL_26;
      }
      id v24 = (void *)v23;
      [v36 addObject:v23];

      unint64_t v11 = v20;
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    id v6 = oslog;
    uint64_t v7 = v32;
    self = v33;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_27:

  uint64_t v30 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v7];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __58__PKPassLibrary_prepareForBackupRestoreWithSafeHavenPath___block_invoke_231;
  v37[3] = &unk_1E56D8AE0;
  void v37[4] = self;
  [v30 prepareForBackupRestoreWithRequiredFileURLs:obj destinationFileHandles:v36 handler:v37];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "prepareForBackupRestoreWithSafeHavenPath - Finished preparation for backup restore.", buf, 2u);
  }

LABEL_30:
}

void __58__PKPassLibrary_prepareForBackupRestoreWithSafeHavenPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 32);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (int64_t)_currentNotificationCountForIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  id v5 = (__CFString *)a3;
  CFPreferencesSynchronize(@"com.apple.PassKit.mapsNotifications", v3, v4);
  id v6 = (void *)CFPreferencesCopyValue(v5, @"com.apple.PassKit.mapsNotifications", v3, v4);

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  int v18 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "PKPassLibrary creating FIDO key", buf, 2u);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __108__PKPassLibrary_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke;
  v24[3] = &unk_1E56DD260;
  SEL v26 = a2;
  id v19 = v17;
  v24[4] = self;
  id v25 = v19;
  unint64_t v20 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __108__PKPassLibrary_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke_232;
  v22[3] = &unk_1E56DE790;
  void v22[4] = self;
  id v23 = v19;
  id v21 = v19;
  [v20 usingSynchronousProxy:0 createFidoKeyForRelyingParty:v13 relyingPartyAccountHash:v14 challenge:v15 externalizedAuth:v16 completion:v22];
}

void __108__PKPassLibrary_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFStringRef v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void, void, id))(v6 + 16))(v6, 0, 0, 0, v3);
  }
}

uint64_t __108__PKPassLibrary_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke_232(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__PKPassLibrary_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke;
  v20[3] = &unk_1E56DD260;
  SEL v22 = a2;
  id v12 = v11;
  void v20[4] = self;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__PKPassLibrary_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke_234;
  v18[3] = &unk_1E56D8798;
  void v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 usingSynchronousProxy:0 checkFidoKeyPresenceForRelyingParty:v15 relyingPartyAccountHash:v14 fidoKeyHash:v13 completion:v18];
}

void __100__PKPassLibrary_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFStringRef v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __100__PKPassLibrary_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke_234(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
  id v17 = a9;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __142__PKPassLibrary_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke;
  v29[3] = &unk_1E56DD260;
  SEL v31 = a2;
  id v18 = v17;
  v29[4] = self;
  id v30 = v18;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __142__PKPassLibrary_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke_235;
  v27[3] = &unk_1E56DE7B8;
  v27[4] = self;
  id v28 = v18;
  id v26 = v18;
  [v25 usingSynchronousProxy:0 signWithFidoKeyForRelyingParty:v24 relyingPartyAccountHash:v23 fidoKeyHash:v22 challenge:v21 publicKeyIdentifier:v20 externalizedAuth:v19 completion:v27];
}

void __142__PKPassLibrary_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFStringRef v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __142__PKPassLibrary_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke_235(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__PKPassLibrary_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v14[3] = &unk_1E56DD260;
  SEL v16 = a2;
  id v8 = v7;
  void v14[4] = self;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__PKPassLibrary_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke_237;
  void v12[3] = &unk_1E56DE7B8;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 usingSynchronousProxy:0 generateSEEncryptionCertificateForSubCredentialId:v9 completion:v12];
}

void __78__PKPassLibrary_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFStringRef v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __78__PKPassLibrary_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke_237(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PKPassLibrary_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v14[3] = &unk_1E56DD260;
  SEL v16 = a2;
  id v8 = v7;
  void v14[4] = self;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PKPassLibrary_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke_238;
  void v12[3] = &unk_1E56DE7E0;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 usingSynchronousProxy:0 generateISOEncryptionCertificateForSubCredentialId:v9 completion:v12];
}

void __79__PKPassLibrary_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFStringRef v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void, id))(v6 + 16))(v6, 0, 0, v3);
  }
}

uint64_t __79__PKPassLibrary_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke_238(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __53__PKPassLibrary_deleteKeyMaterialForSubCredentialId___block_invoke;
  __int16 v9 = &unk_1E56DD328;
  id v10 = self;
  SEL v11 = a2;
  id v4 = a3;
  id v5 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:&v6];
  objc_msgSend(v5, "deleteKeyMaterialForSubCredentialId:", v4, v6, v7, v8, v9, v10, v11);
}

void __53__PKPassLibrary_deleteKeyMaterialForSubCredentialId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 40);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    __int16 v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __54__PKPassLibrary_addISO18013Blobs_cardType_completion___block_invoke;
  v16[3] = &unk_1E56DD260;
  SEL v18 = a2;
  id v10 = v9;
  void v16[4] = self;
  id v17 = v10;
  id v11 = a3;
  uint64_t v12 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__PKPassLibrary_addISO18013Blobs_cardType_completion___block_invoke_240;
  v14[3] = &unk_1E56D8770;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 usingSynchronousProxy:0 addISO18013Blobs:v11 cardType:a4 completion:v14];
}

void __54__PKPassLibrary_addISO18013Blobs_cardType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __54__PKPassLibrary_addISO18013Blobs_cardType_completion___block_invoke_240(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __89__PKPassLibrary_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke;
  v16[3] = &unk_1E56DD260;
  SEL v18 = a2;
  id v10 = v9;
  void v16[4] = self;
  id v17 = v10;
  id v11 = a3;
  uint64_t v12 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__PKPassLibrary_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke_241;
  v14[3] = &unk_1E56DE7B8;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 usingSynchronousProxy:0 longTermPrivacyKeyForCredentialGroupIdentifier:v11 reuseExisting:v5 completion:v14];
}

void __89__PKPassLibrary_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __89__PKPassLibrary_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke_241(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PKPassLibrary_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke;
  v14[3] = &unk_1E56DD260;
  SEL v16 = a2;
  id v8 = v7;
  void v14[4] = self;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PKPassLibrary_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke_242;
  void v12[3] = &unk_1E56DE808;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 usingSynchronousProxy:0 generateAuxiliaryCapabilitiesForRequirements:v9 completion:v12];
}

void __73__PKPassLibrary_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __73__PKPassLibrary_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke_242(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentIssuerBindingFlowForIssuerData:(id)a3 signature:(id)a4 orientation:(id)a5
{
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __77__PKPassLibrary_presentIssuerBindingFlowForIssuerData_signature_orientation___block_invoke;
  id v15 = &unk_1E56DD328;
  SEL v16 = self;
  SEL v17 = a2;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:&v12];
  objc_msgSend(v11, "presentIssuerBindingFlowForIssuerData:signature:orientation:", v10, v9, v8, v12, v13, v14, v15, v16, v17);
}

void __77__PKPassLibrary_presentIssuerBindingFlowForIssuerData_signature_orientation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(const char **)(a1 + 40);
    id v6 = a2;
    int v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (void)requestIssuerBoundPassesWithBindingWithData:(id)a3 automaticallyProvision:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __99__PKPassLibrary_requestIssuerBoundPassesWithBindingWithData_automaticallyProvision_withCompletion___block_invoke;
  v16[3] = &unk_1E56DD260;
  SEL v18 = a2;
  id v10 = v9;
  void v16[4] = self;
  id v17 = v10;
  id v11 = a3;
  uint64_t v12 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__PKPassLibrary_requestIssuerBoundPassesWithBindingWithData_automaticallyProvision_withCompletion___block_invoke_244;
  v14[3] = &unk_1E56DD728;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 usingSynchronousProxy:0 requestIssuerBoundPassesWithBindingWithData:v11 automaticallyProvision:v5 withCompletion:v14];
}

void __99__PKPassLibrary_requestIssuerBoundPassesWithBindingWithData_automaticallyProvision_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __99__PKPassLibrary_requestIssuerBoundPassesWithBindingWithData_automaticallyProvision_withCompletion___block_invoke_244(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __74__PKPassLibrary_signData_signatureEntanglementMode_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E56DD260;
  SEL v18 = a2;
  id v10 = v9;
  void v16[4] = self;
  id v17 = v10;
  id v11 = a3;
  uint64_t v12 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__PKPassLibrary_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_245;
  v14[3] = &unk_1E56DE830;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 signData:v11 signatureEntanglementMode:a4 withCompletionHandler:v14];
}

void __74__PKPassLibrary_signData_signatureEntanglementMode_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void, id))(v6 + 16))(v6, 0, 0, v3);
  }
}

uint64_t __74__PKPassLibrary_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_245(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isPaymentPassActivationAvailable
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v3 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PKPassLibrary_isPaymentPassActivationAvailable__block_invoke;
  v6[3] = &unk_1E56D86D0;
  void v6[4] = &v7;
  [v3 isPaymentPassActivationAvailableWithHandler:v6];
  if (*((unsigned char *)v8 + 24))
  {
    BOOL v4 = 1;
  }
  else if ([(PKPassLibrary *)self _hasRemoteLibrary])
  {
    BOOL v4 = [(PKPassLibrary *)self->_remoteLibrary isPaymentPassActivationAvailable];
  }
  else
  {
    BOOL v4 = 0;
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __49__PKPassLibrary_isPaymentPassActivationAvailable__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)_remoteLibrary
{
  if ([(PKPassLibrary *)self _hasRemoteLibrary]) {
    remoteLibrary = self->_remoteLibrary;
  }
  else {
    remoteLibrary = 0;
  }
  return remoteLibrary;
}

- (BOOL)migrateDataWithDidRestoreFromBackup:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  BOOL v5 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = @"NO";
    if (v3) {
      uint64_t v9 = @"YES";
    }
    *(_DWORD *)long long buf = 138412290;
    id v17 = v9;
    _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "PKPassLibrary: requesting passd data migration (didRestoreFromBackup: %@)...", buf, 0xCu);
  }

  uint64_t v6 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PKPassLibrary_migrateDataWithDidRestoreFromBackup___block_invoke;
  v11[3] = &unk_1E56D86D0;
  void v11[4] = &v12;
  [v6 migrateDataWithHandler:v11 didRestoreFromBackup:v3];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (*((unsigned char *)v13 + 24)) {
      char v10 = @"success";
    }
    else {
      char v10 = @"failure";
    }
    *(_DWORD *)long long buf = 138543362;
    id v17 = v10;
    _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "PKPassLibrary: passd migration state: %{public}@.", buf, 0xCu);
  }

  BOOL v7 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __53__PKPassLibrary_migrateDataWithDidRestoreFromBackup___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)sendUserEditedCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassLibrary *)self _remoteObjectProxy];
  [v5 sendUserEditedCatalog:v4];
}

- (void)notifyPassUsedWithIdentifier:(id)a3 fromSource:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v7 notifyPassUsedWithIdentifier:v6 fromSource:a4];
}

- (void)issueWalletUserNotificationWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 customActionRoute:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v14 issueWalletUserNotificationWithTitle:v13 message:v12 forPassUniqueIdentifier:v11 customActionRoute:v10];
}

- (void)pendingUserNotificationsWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E56D83D8;
    id v8 = v6;
    void aBlock[4] = self;
    id v15 = v8;
    id v9 = a3;
    id v10 = _Block_copy(aBlock);
    id v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v10];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_3;
    void v12[3] = &unk_1E56D89C8;
    void v12[4] = self;
    id v13 = v8;
    [v11 pendingUserNotificationsWithIdentifier:v9 completion:v12];
  }
}

void __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_2;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_4;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v8 updateDate:v7 forPendingNotificationWithIdentifier:v6];
}

- (void)removeAllScheduledActivities
{
  id v2 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v2 removeAllScheduledActivities];
}

- (void)introduceDatabaseIntegrityProblem
{
  id v2 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v2 introduceDatabaseIntegrityProblem];
}

- (void)forceImmediateRevocationCheck
{
  id v2 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v2 forceImmediateRevocationCheck];
}

- (void)spotlightReindexAllContentWithAcknowledgement:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke;
  aBlock[3] = &unk_1E56D83D8;
  id v5 = v4;
  void aBlock[4] = self;
  id v12 = v5;
  id v6 = _Block_copy(aBlock);
  id v7 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_3;
  v9[3] = &unk_1E56D83D8;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 spotlightReindexAllContentWithAcknowledgement:v9];
}

void __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_2;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_3(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_4;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)spotlightReindexContentWithIdentifiers:(id)a3 acknowledgement:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke;
  aBlock[3] = &unk_1E56D83D8;
  id v7 = v6;
  void aBlock[4] = self;
  id v15 = v7;
  id v8 = a3;
  id v9 = _Block_copy(aBlock);
  id v10 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_3;
  void v12[3] = &unk_1E56D83D8;
  void v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 spotlightReindexContentWithIdentifiers:v8 acknowledgement:v12];
}

void __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_2;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_3(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_4;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)spotlightResetWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D83D8;
  id v5 = v4;
  void aBlock[4] = self;
  id v12 = v5;
  id v6 = _Block_copy(aBlock);
  id v7 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D83D8;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 spotlightResetWithCompletion:v9];
}

void __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_2;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_4;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)spotlightStatusWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D83D8;
  id v5 = v4;
  void aBlock[4] = self;
  id v12 = v5;
  id v6 = _Block_copy(aBlock);
  id v7 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D89A0;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 spotlightStatusWithCompletion:v9];
}

void __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_2;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_4;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && [v7 length])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__PKPassLibrary_removePassWithUniqueID_diagnosticReason___block_invoke;
    v14[3] = &unk_1E56DD328;
    void v14[4] = self;
    void v14[5] = a2;
    id v9 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v14];
    if (!v8)
    {
      id v10 = NSString;
      int v11 = PKGetMyPid();
      id v12 = PKProcessNameForPid(v11);
      id v8 = [v10 stringWithFormat:@"Call from %@", v12];
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PKPassLibrary_removePassWithUniqueID_diagnosticReason___block_invoke_263;
    v13[3] = &unk_1E56D8AE0;
    void v13[4] = self;
    [v9 removePassWithUniqueID:v7 diagnosticReason:v8 handler:v13];
  }
}

void __57__PKPassLibrary_removePassWithUniqueID_diagnosticReason___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);
  }
}

- (void)removePassesWithUniqueIDs:(id)a3 diagnosticReason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && [v7 count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__PKPassLibrary_removePassesWithUniqueIDs_diagnosticReason___block_invoke;
    v14[3] = &unk_1E56DD328;
    void v14[4] = self;
    void v14[5] = a2;
    id v9 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v14];
    if (!v8)
    {
      id v10 = NSString;
      int v11 = PKGetMyPid();
      id v12 = PKProcessNameForPid(v11);
      id v8 = [v10 stringWithFormat:@"Call from %@", v12];
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__PKPassLibrary_removePassesWithUniqueIDs_diagnosticReason___block_invoke_264;
    v13[3] = &unk_1E56D8AE0;
    void v13[4] = self;
    [v9 removePassesWithUniqueIDs:v7 diagnosticReason:v8 handler:v13];
  }
}

void __60__PKPassLibrary_removePassesWithUniqueIDs_diagnosticReason___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);
  }
}

- (void)recoverPassWithUniqueID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && [v5 length])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__PKPassLibrary_recoverPassWithUniqueID___block_invoke;
    v9[3] = &unk_1E56DD328;
    void v9[4] = self;
    void v9[5] = a2;
    id v7 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__PKPassLibrary_recoverPassWithUniqueID___block_invoke_265;
    v8[3] = &unk_1E56D8AE0;
    void v8[4] = self;
    [v7 recoverPassWithUniqueID:v6 handler:v8];
  }
}

void __41__PKPassLibrary_recoverPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);
  }
}

- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4
{
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__PKPassLibrary_removePassesOfType_withDiagnosticReason___block_invoke;
  v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v13[4] = a2;
  id v8 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v13];
  if (!v7)
  {
    id v9 = NSString;
    int v10 = PKGetMyPid();
    int v11 = PKProcessNameForPid(v10);
    id v7 = [v9 stringWithFormat:@"Call from %@", v11];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PKPassLibrary_removePassesOfType_withDiagnosticReason___block_invoke_266;
  void v12[3] = &unk_1E56D8AE0;
  void v12[4] = self;
  [v8 removePassesOfType:a3 withDiagnosticReason:v7 handler:v12];
}

void __57__PKPassLibrary_removePassesOfType_withDiagnosticReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 32);
    id v6 = a2;
    id v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__PKPassLibrary_removePassesOfType_withDiagnosticReason_completion___block_invoke;
  v19[3] = &unk_1E56DD260;
  SEL v21 = a2;
  id v11 = v10;
  void v19[4] = self;
  id v20 = v11;
  uint64_t v12 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v19];
  if (!v9)
  {
    id v13 = NSString;
    int v14 = PKGetMyPid();
    id v15 = PKProcessNameForPid(v14);
    id v9 = [v13 stringWithFormat:@"Call from %@", v15];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__PKPassLibrary_removePassesOfType_withDiagnosticReason_completion___block_invoke_267;
  v17[3] = &unk_1E56D83D8;
  v17[4] = self;
  id v18 = v11;
  id v16 = v11;
  [v12 removePassesOfType:a3 withDiagnosticReason:v9 handler:v17];
}

void __68__PKPassLibrary_removePassesOfType_withDiagnosticReason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __68__PKPassLibrary_removePassesOfType_withDiagnosticReason_completion___block_invoke_267(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (unint64_t)estimatedTimeToResetApplePay
{
  return 60 * [(PKPassLibrary *)self countPassesOfType:1];
}

- (void)resetApplePayWithDiagnosticReason:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412290;
    SEL v21 = v10;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "XPC about to start in -[PKPassLibrary %@];", buf, 0xCu);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__PKPassLibrary_resetApplePayWithDiagnosticReason_completion___block_invoke;
  v19[3] = &unk_1E56DD328;
  void v19[4] = self;
  void v19[5] = a2;
  uint64_t v11 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v19];
  if (!v7)
  {
    uint64_t v12 = NSString;
    int v13 = PKGetMyPid();
    int v14 = PKProcessNameForPid(v13);
    id v7 = [v12 stringWithFormat:@"Call from %@", v14];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __62__PKPassLibrary_resetApplePayWithDiagnosticReason_completion___block_invoke_268;
  v16[3] = &unk_1E56DE858;
  id v17 = v8;
  SEL v18 = a2;
  void v16[4] = self;
  id v15 = v8;
  [v11 resetApplePayWithDiagnosticReason:v7 handler:v16];
}

void __62__PKPassLibrary_resetApplePayWithDiagnosticReason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 40);
    id v6 = a2;
    id v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    __int16 v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

uint64_t __62__PKPassLibrary_resetApplePayWithDiagnosticReason_completion___block_invoke_268(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC finished in -[PKPassLibrary %@]; successful:%d",
      (uint8_t *)&v7,
      0x12u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (BOOL)resetApplePayWithDiagnosticReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v6 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412290;
    SEL v21 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "XPC about to start in -[PKPassLibrary %@];", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__PKPassLibrary_resetApplePayWithDiagnosticReason___block_invoke;
  v15[3] = &unk_1E56DD328;
  v15[4] = self;
  void v15[5] = a2;
  int v8 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v15];
  if (!v5)
  {
    __int16 v9 = NSString;
    int v10 = PKGetMyPid();
    uint64_t v11 = PKProcessNameForPid(v10);
    id v5 = [v9 stringWithFormat:@"Call from %@", v11];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__PKPassLibrary_resetApplePayWithDiagnosticReason___block_invoke_269;
  v14[3] = &unk_1E56DE880;
  void v14[5] = &v16;
  void v14[6] = a2;
  void v14[4] = self;
  [v8 resetApplePayWithDiagnosticReason:v5 handler:v14];
  BOOL v12 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __51__PKPassLibrary_resetApplePayWithDiagnosticReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 40);
    id v6 = a2;
    int v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    __int16 v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

void __51__PKPassLibrary_resetApplePayWithDiagnosticReason___block_invoke_269(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v6 = 138412546;
    int v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC finished in -[PKPassLibrary %@]; successful:%d",
      (uint8_t *)&v6,
      0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)shuffleGroups:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v4 shuffleGroups:v3];
}

- (void)noteAppleAccountChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  [v5 noteAppleAccountChanged:v4 handler:&__block_literal_global_271];
}

- (void)noteACAccountChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  [v5 noteACAccountChanged:v4 handler:&__block_literal_global_273];
}

- (id)diffForPassUpdateUserNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__11;
  int v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  id v5 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PKPassLibrary_diffForPassUpdateUserNotificationWithIdentifier___block_invoke;
  v8[3] = &unk_1E56DE8A8;
  void v8[4] = &v9;
  [v5 getDiffForPassUpdateUserNotificationWithIdentifier:v4 handler:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __65__PKPassLibrary_diffForPassUpdateUserNotificationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)isWatchIssuerAppProvisioningSupported
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PKPassLibrary_isWatchIssuerAppProvisioningSupported__block_invoke;
  v5[3] = &unk_1E56D86D0;
  void v5[4] = &v6;
  [v2 isWatchIssuerAppProvisioningSupportedWithHandler:v5];
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__PKPassLibrary_isWatchIssuerAppProvisioningSupported__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)catalogChanged:(id)a3 withNewPasses:(id)a4
{
}

- (void)catalogChanged:(id)a3 withNewPasses:(id)a4 states:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v16 = a5;
  [(PKPassLibrary *)self _applyDataAccessorToObjects:v9];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(PKPassLibrary *)self delegates];
  uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          id v15 = (void *)[v8 copy];
          [v14 passLibrary:self receivedUpdatedCatalog:v15 passes:v9 states:v16];
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_11;
          }
          id v15 = (void *)[v8 copy];
          [v14 passLibrary:self receivedUpdatedCatalog:v15 passes:v9];
        }

LABEL_11:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)passAdded:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPassLibrary *)self _applyDataAccessorToObject:v4];
  id v7 = v4;
  id v8 = @"PKPassLibraryAddedPassesUserInfo";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(PKPassLibrary *)self _postLibraryChangeWithUserInfo:v6];
}

- (void)passUpdated:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPassLibrary *)self _applyDataAccessorToObject:v4];
  id v7 = v4;
  id v8 = @"PKPassLibraryReplacementPassesUserInfo";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(PKPassLibrary *)self _postLibraryChangeWithUserInfo:v6];
}

- (void)passRecovered:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPassLibrary *)self _applyDataAccessorToObject:v4];
  id v7 = v4;
  id v8 = @"PKPassLibraryRecoveredPassesUserInfoKey";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(PKPassLibrary *)self _postLibraryChangeWithUserInfo:v6];
}

- (void)passRemoved:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"PKPassLibraryPassTypeIdentifierUserInfo";
  id v4 = a3;
  id v5 = [v4 passTypeIdentifier];
  v13[1] = @"PKPassLibrarySerialNumberUserInfo";
  v14[0] = v5;
  uint64_t v6 = [v4 serialNumber];

  v14[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  uint64_t v10 = v7;
  uint64_t v11 = @"PKPassLibraryRemovedPassInfosUserInfo";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  uint64_t v12 = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [(PKPassLibrary *)self _postLibraryChangeWithUserInfo:v9];
}

- (void)contactlessInterfaceDidPresentFromSource:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(PKPassLibrary *)self delegates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 contactlessInterfaceDidPresentFromSource:a3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(PKPassLibrary *)self delegates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 contactlessInterfaceDidDismissFromSource:a3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)vehicleConnectionDidUpdateConnectionState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(PKPassLibrary *)self delegates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 vehicleConnectionDidUpdateConnectionState:a3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)vehicleConnectionDidRecievePassthroughData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(PKPassLibrary *)self delegates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 vehicleConnectionDidRecievePassthroughData:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)issuerBindingAuthenticationOccured
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(PKPassLibrary *)self delegates];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 issuerBindingAuthenticationOccured];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_postLibraryChangeWithUserInfo:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 postNotificationName:@"PKPassLibraryDidChangeNotification" object:self userInfo:v5];
}

- (id)_copyPassesWithRetries:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  int64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  BOOL v29 = __Block_byref_object_copy__11;
  id v30 = __Block_byref_object_dispose__11;
  id v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__11;
  long long v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__PKPassLibrary__copyPassesWithRetries___block_invoke;
  v15[3] = &unk_1E56DE388;
  v15[4] = &v22;
  void v15[5] = &v16;
  id v5 = [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__PKPassLibrary__copyPassesWithRetries___block_invoke_2;
  void v14[3] = &unk_1E56DE8D0;
  void v14[4] = self;
  void v14[5] = &v26;
  [v5 getPassesWithHandler:v14];
  if (*((unsigned char *)v23 + 24))
  {
    id v6 = PKLogFacilityTypeGetObject(0);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (a3)
    {
      if (v7)
      {
        long long v12 = [(id)v17[5] localizedDescription];
        *(_DWORD *)long long buf = 134218242;
        unint64_t v33 = a3;
        __int16 v34 = 2114;
        uint64_t v35 = v12;
        _os_log_error_impl(&dword_190E10000, v6, OS_LOG_TYPE_ERROR, "Error retrieving passes (%lu retries remaining): %{public}@", buf, 0x16u);
      }
      id v8 = [(PKPassLibrary *)self _copyPassesWithRetries:a3 - 1];
      id v6 = v27[5];
      void v27[5] = (uint64_t)v8;
    }
    else if (v7)
    {
      uint64_t v13 = [(id)v17[5] localizedDescription];
      *(_DWORD *)long long buf = 138543362;
      unint64_t v33 = (unint64_t)v13;
      _os_log_error_impl(&dword_190E10000, v6, OS_LOG_TYPE_ERROR, "Error retrieving passes (giving up): %{public}@", buf, 0xCu);
    }
  }
  long long v9 = (void *)v27[5];
  if (!v9) {
    long long v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

void __40__PKPassLibrary__copyPassesWithRetries___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

uint64_t __40__PKPassLibrary__copyPassesWithRetries___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allObjects];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v6 _applyDataAccessorToObjects:v7];
}

void __47__PKPassLibrary__copyPassesOfType_withRetries___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

- (id)_copyPassesOfStyles:(unint64_t)a3 withRetries:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__11;
  id v32 = __Block_byref_object_dispose__11;
  id v33 = 0;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__11;
  uint64_t v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__PKPassLibrary__copyPassesOfStyles_withRetries___block_invoke;
  v17[3] = &unk_1E56DE388;
  v17[4] = &v24;
  void v17[5] = &v18;
  uint64_t v7 = [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __49__PKPassLibrary__copyPassesOfStyles_withRetries___block_invoke_2;
  v16[3] = &unk_1E56DE8D0;
  void v16[4] = self;
  void v16[5] = &v28;
  [v7 usingSynchronousProxy:1 getPassesOfStyles:a3 handler:v16];
  if (*((unsigned char *)v25 + 24))
  {
    id v8 = PKLogFacilityTypeGetObject(0);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v9)
      {
        long long v14 = [(id)v19[5] localizedDescription];
        *(_DWORD *)long long buf = 134218242;
        unint64_t v35 = a4;
        __int16 v36 = 2114;
        id v37 = v14;
        _os_log_error_impl(&dword_190E10000, v8, OS_LOG_TYPE_ERROR, "Error retrieving passes (%lu retries remaining): %{public}@", buf, 0x16u);
      }
      id v10 = [(PKPassLibrary *)self _copyPassesOfStyles:a3 withRetries:a4 - 1];
      id v8 = v29[5];
      void v29[5] = (uint64_t)v10;
    }
    else if (v9)
    {
      uint64_t v15 = [(id)v19[5] localizedDescription];
      *(_DWORD *)long long buf = 138543362;
      unint64_t v35 = (unint64_t)v15;
      _os_log_error_impl(&dword_190E10000, v8, OS_LOG_TYPE_ERROR, "Error retrieving passes (giving up): %{public}@", buf, 0xCu);
    }
  }
  long long v11 = (void *)v29[5];
  if (!v11) {
    long long v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __49__PKPassLibrary__copyPassesOfStyles_withRetries___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

uint64_t __49__PKPassLibrary__copyPassesOfStyles_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allObjects];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v6 _applyDataAccessorToObjects:v7];
}

- (void)_getPassesAndCatalogOfPassTypes:(unint64_t)a3 synchronously:(BOOL)a4 limitResults:(BOOL)a5 withRetries:(unint64_t)a6 handler:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  uint64_t v13 = v12;
  if (v12)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke;
    aBlock[3] = &unk_1E56DE920;
    unint64_t v22 = a6;
    unint64_t v23 = a3;
    void aBlock[4] = self;
    BOOL v24 = v9;
    BOOL v25 = v8;
    id v14 = v12;
    id v21 = v14;
    uint64_t v15 = _Block_copy(aBlock);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke_291;
    v18[3] = &unk_1E56DE948;
    void v18[4] = self;
    id v19 = v14;
    uint64_t v16 = _Block_copy(v18);
    if ([(PKPassLibrary *)self _hasInterfaceOfType:2])
    {
      if (v9) {
        [(PKPassLibrary *)self _synchronousExtendedRemoteObjectProxyWithErrorHandler:v15];
      }
      else {
      id v17 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithErrorHandler:v15];
      }
      [v17 usingSynchronousProxy:v9 getPassesAndCatalogOfPassTypes:a3 limitResults:v8 withHandler:v16];
    }
    else
    {
      if (v9) {
        [(PKPassLibrary *)self _synchronousRemoteObjectProxyWithErrorHandler:v15];
      }
      else {
      id v17 = [(PKPassLibrary *)self _remoteObjectProxyWithErrorHandler:v15];
      }
      [v17 getPassesAndCatalogOfPassTypes:a3 limitResults:v8 withHandler:v16];
    }
  }
}

void __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke(int8x16_t *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[3].i64[0];
  id v5 = PKLogFacilityTypeGetObject(0);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      id v12 = [v3 localizedDescription];
      *(_DWORD *)block = 134218242;
      *(void *)&void block[4] = v4;
      *(_WORD *)&block[12] = 2114;
      *(void *)&block[14] = v12;
      _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "Error retrieving passes and catalog (%lu retries remaining): %{public}@", block, 0x16u);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke_290;
    aBlock[3] = &unk_1E56DE8F8;
    uint64_t v7 = (void *)a1[2].i64[1];
    void aBlock[4] = a1[2].i64[0];
    __int16 v17 = a1[4].i16[0];
    int8x16_t v16 = vextq_s8(a1[3], a1[3], 8uLL);
    id v15 = v7;
    BOOL v8 = _Block_copy(aBlock);
    BOOL v9 = v8;
    if (a1[4].i8[0])
    {
      (*((void (**)(void *))v8 + 2))(v8);
    }
    else
    {
      id v10 = dispatch_get_global_queue(0, 0);
      id v11 = v9;
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __dispatch_async_ar_block_invoke_3;
      id v19 = &unk_1E56D8360;
      id v20 = v11;
      dispatch_async(v10, block);
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v13 = [v3 localizedDescription];
      *(_DWORD *)block = 138543362;
      *(void *)&void block[4] = v13;
      _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "Error retrieving passes and catalog (giving up): %{public}@", block, 0xCu);
    }
    (*(void (**)(void))(a1[2].i64[1] + 16))();
  }
}

uint64_t __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke_290(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPassesAndCatalogOfPassTypes:*(void *)(a1 + 48) synchronously:*(unsigned __int8 *)(a1 + 64) limitResults:*(unsigned __int8 *)(a1 + 65) withRetries:*(void *)(a1 + 56) - 1 handler:*(void *)(a1 + 40)];
}

void __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke_291(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 _applyDataAccessorToObjects:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = PKLogFacilityTypeGetObject(0);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      id v15 = [v3 localizedDescription];
      *(_DWORD *)block = 134218242;
      *(void *)&void block[4] = v4;
      *(_WORD *)&block[12] = 2114;
      *(void *)&block[14] = v15;
      _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "Error retrieving passes with annotations and catalog (%lu retries remaining): %{public}@", block, 0x16u);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke_293;
    aBlock[3] = &unk_1E56DE970;
    id v7 = *(void **)(a1 + 40);
    void aBlock[4] = *(void *)(a1 + 32);
    id v8 = v7;
    char v21 = *(unsigned char *)(a1 + 64);
    id v10 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v18 = v8;
    uint64_t v20 = v9;
    id v19 = v10;
    id v11 = _Block_copy(aBlock);
    id v12 = v11;
    if (*(unsigned char *)(a1 + 64))
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }
    else
    {
      uint64_t v13 = dispatch_get_global_queue(0, 0);
      id v14 = v12;
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __dispatch_async_ar_block_invoke_3;
      unint64_t v23 = &unk_1E56D8360;
      id v24 = v14;
      dispatch_async(v13, block);
    }
  }
  else
  {
    if (v6)
    {
      int8x16_t v16 = [v3 localizedDescription];
      *(_DWORD *)block = 138543362;
      *(void *)&void block[4] = v16;
      _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "Error retrieving passes with annotations and catalog (giving up): %{public}@", block, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke_293(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getGroupsControllerSnapshotWithOptions:*(void *)(a1 + 40) synchronously:*(unsigned __int8 *)(a1 + 64) retries:*(void *)(a1 + 56) - 1 handler:*(void *)(a1 + 48)];
}

- (void)recomputeRelevantPassesWithSearchMode:(int64_t)a3
{
  id v4 = [(PKPassLibrary *)self _extendedRemoteObjectProxy];
  [v4 recomputeRelevantPassesWithSearchMode:a3];
}

- (void)fetchHasCandidatePasses:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__PKPassLibrary_fetchHasCandidatePasses___block_invoke;
    v8[3] = &unk_1E56D8360;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v8];
    [v7 fetchHasCandidatePasses:v6];
  }
}

uint64_t __41__PKPassLibrary_fetchHasCandidatePasses___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCurrentRelevantPassInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__PKPassLibrary_fetchCurrentRelevantPassInfo___block_invoke;
    v8[3] = &unk_1E56D8360;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(PKPassLibrary *)self _extendedRemoteObjectProxyWithFailureHandler:v8];
    [v7 fetchCurrentRelevantPassInfo:v6];
  }
}

uint64_t __46__PKPassLibrary_fetchCurrentRelevantPassInfo___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (BOOL)contactlessInterfaceCanBePresentedFromSource:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (PKNearFieldRadioIsAvailable())
  {
    uint64_t BoolForKey = PKSharedCacheGetBoolForKey(@"ContactlessPassesAvailable");
    BOOL v5 = BoolForKey;
    if (!a3 && BoolForKey)
    {
      BOOL v6 = 1;
      BOOL v5 = PKDoubleClickAllowed();
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  if (a3 == 2)
  {
    int v7 = _os_feature_enabled_impl();
    int v8 = PKDeviceUILocked();
    if (v7)
    {
      BOOL v6 = v8 != 0;
    }
    else if (v8)
    {
      id v9 = [MEMORY[0x1E4F74230] sharedConnection];
      BOOL v6 = [v9 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F88]] == 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }
LABEL_13:
  id v10 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [NSNumber numberWithBool:v5];
    id v12 = [NSNumber numberWithBool:v6];
    int v14 = 138412546;
    id v15 = v11;
    __int16 v16 = 2112;
    __int16 v17 = v12;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPassLibrary contactlessInterfaceCanBePresentedFromSource: canBePresented: %@ shouldBePresented: %@", (uint8_t *)&v14, 0x16u);
  }
  return v5 && v6;
}

+ (BOOL)contactlessInterfaceCanBePresentedFromSource:(int64_t)a3 deviceUILocked:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (PKNearFieldRadioIsAvailable())
  {
    uint64_t BoolForKey = PKSharedCacheGetBoolForKey(@"ContactlessPassesAvailable");
    BOOL v7 = BoolForKey;
    if (!a3 && BoolForKey)
    {
      uint64_t v8 = 1;
      BOOL v7 = PKDoubleClickAllowed();
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  if (a3 == 2)
  {
    int v9 = _os_feature_enabled_impl();
    uint64_t v8 = v9 & v4;
    if ((v9 & 1) == 0 && v4)
    {
      id v10 = [MEMORY[0x1E4F74230] sharedConnection];
      uint64_t v8 = [v10 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F88]] == 1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
LABEL_11:
  id v11 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [NSNumber numberWithBool:v7];
    uint64_t v13 = [NSNumber numberWithBool:v8];
    int v15 = 138412546;
    __int16 v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPassLibrary contactlessInterfaceCanBePresentedFromSource: canBePresented: %@ shouldBeShouldBePresented: %@", (uint8_t *)&v15, 0x16u);
  }
  return v7 & v8;
}

- (PKPassLibraryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPassLibraryDelegate *)WeakRetained;
}

@end