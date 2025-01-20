@interface PDPaymentService
- (FDWalletMessagingProvider)financeKitMessageProvider;
- (PDAccountManager)accountManager;
- (PDAppletSubcredentialManager)subcredentialManager;
- (PDApplicationMessageManager)applicationMessageManager;
- (PDApplyManager)applyManager;
- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager;
- (PDAuxiliaryPassInformationManager)auxiliaryPassInformationManager;
- (PDBarcodeCredentialManager)barcodeCredentialManager;
- (PDCardFileManager)cardFileManager;
- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator;
- (PDDatabaseManager)databaseManager;
- (PDDefaultPassManager)defaultPassManager;
- (PDDevicePasscodeManager)devicePasscodeManager;
- (PDExpressPassManager)expressPassManager;
- (PDFamilyCircleManager)familyMemberManager;
- (PDISO18013Manager)iso18013Manager;
- (PDIssuerBindingManager)issuerBindingManager;
- (PDMapsBrandAndMerchantUpdater)mapsBrandAndMerchantUpdater;
- (PDNFCInitiatedPairingManager)nfcPairingManager;
- (PDNotificationServiceCoordinator)notificationServiceCoordinator;
- (PDPassTileManager)passTileManager;
- (PDPaymentOffersManager)paymentOffersManager;
- (PDPaymentService)initWithConnection:(id)a3;
- (PDPaymentService)initWithConnection:(id)a3 server:(id)a4;
- (PDPaymentTransactionProcessor)paymentTransactionProcessor;
- (PDPaymentUserCommunicationManager)paymentUserCommunicationManager;
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServicesCoordinator;
- (PDPendingProvisioningManager)pendingProvisioningManager;
- (PDPushNotificationManager)pushNotificationManager;
- (PDPushProvisioningManager)pushProvisioningManager;
- (PDSharingManager)sharingManager;
- (PDTransactionAuthenticationManager)transactionAuthenticationManager;
- (PDTransactionReceiptFileManager)transactionReceiptFileManager;
- (PDTransitStateManager)transitStateManager;
- (PDUserNotificationManager)userNotificationManager;
- (PDXPCEventPublisher)passKitEventPublisher;
- (PKSecureElement)secureElement;
- (PKSharingIDSManager)idsSharingManager;
- (PKTapToRadarDelegate)tapToRadarDelegate;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)_insertPendingTransactionRegistration:(id)a3;
- (void)_requestUpdatesForTransactionSourceIdentifiers:(id)a3;
- (void)_updateApplicationsForType:(int64_t)a3 completion:(id)a4;
- (void)_vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 regenerate:(BOOL)a6 hasRefreshedBAACertificate:(BOOL)a7 completion:(id)a8;
- (void)_vpanVirtualCards:(id)a3;
- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)activated;
- (void)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 withCompletion:(id)a5;
- (void)addPendingProvisioning:(id)a3;
- (void)addPendingProvisionings:(id)a3 completion:(id)a4;
- (void)addPlaceholderPassWithConfiguration:(id)a3 completion:(id)a4;
- (void)allPaymentApplicationUsageSummariesWithCompletion:(id)a3;
- (void)ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 completion:(id)a4;
- (void)ambiguousTransactionWithServiceIdentifier:(id)a3 completion:(id)a4;
- (void)applyManager:(id)a3 didAddApplication:(id)a4;
- (void)applyManager:(id)a3 didRemoveApplication:(id)a4;
- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5;
- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)archiveMessageWithIdentifier:(id)a3 handler:(id)a4;
- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5;
- (void)balanceReminderThresholdForBalanceIdentifier:(id)a3 withPassUniqueIdentifier:(id)a4 handler:(id)a5;
- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4;
- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4;
- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 handler:(id)a5;
- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9;
- (void)categoryVisualizationMagnitudesForPassUniqueID:(id)a3 completion:(id)a4;
- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5;
- (void)checkAllAuxiliaryRegistrationRequirements;
- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4;
- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4;
- (void)clearSafariCardImportNotificationHistoryWithCompletion:(id)a3;
- (void)clearSafariCardImportNotificationsWithCompletion:(id)a3;
- (void)commutePlanReminderForCommutePlanIdentifier:(id)a3 withPassUniqueIdentifier:(id)a4 handler:(id)a5;
- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4;
- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5;
- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withCompletion:(id)a4;
- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5;
- (void)consistencyCheckWithHandler:(id)a3;
- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5;
- (void)credentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3;
- (void)currentSecureElementSnapshot:(id)a3;
- (void)dealloc;
- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4;
- (void)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)defaultPaymentPassIngestionSpecificIdentifier:(id)a3;
- (void)defaultPaymentPassUniqueIdentifier:(id)a3;
- (void)deleteAllMessagesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)deleteAllTransactionsForTransactionSourceIdentifiers:(id)a3 handler:(id)a4;
- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)deletePaymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)deletePaymentTransactionWithIdentifier:(id)a3 handler:(id)a4;
- (void)deletePaymentTransactionsWithIdentifiers:(id)a3 handler:(id)a4;
- (void)deleteReservation:(id)a3 completion:(id)a4;
- (void)deleteSharingMessage:(id)a3;
- (void)deleteTransactionReceiptWithUniqueID:(id)a3 completion:(id)a4;
- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5;
- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4;
- (void)didReceiveSharingInvitationRequest:(id)a3 withCompletion:(id)a4;
- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7;
- (void)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4;
- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4;
- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)downloadAllPaymentPassesWithHandler:(id)a3;
- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)expressPassConfigurationWithPassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)expressPassConfigurationsWithCardType:(int64_t)a3 handler:(id)a4;
- (void)expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3 handler:(id)a4;
- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3;
- (void)familyMembersIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)featureApplicationWithIdentifier:(id)a3 completion:(id)a4;
- (void)featureApplicationWithReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)featureApplicationsForAccountUserInvitationWithCompletion:(id)a3;
- (void)featureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)featureApplicationsWithCompletion:(id)a3;
- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4;
- (void)fieldDetectorManagerDidExitField:(id)a3;
- (void)finishedKeyExchangeForCredential:(id)a3 withCompletion:(id)a4;
- (void)generateUnderlyingKeyReportWithCompletion:(id)a3;
- (void)hasActiveExternallySharedPasses:(id)a3;
- (void)hasSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4;
- (void)initializeSecureElement:(id)a3;
- (void)initializeSecureElementIfNecessaryWithHandler:(id)a3;
- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdatePaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 completion:(id)a6;
- (void)insertOrUpdatePaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateValueAddedServiceTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentTransaction:(id)a5 handler:(id)a6;
- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9;
- (void)installmentPlansWithTransactionReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)isExpressModeEnabledForRemotePassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)isPassExpressWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)logoImageDataForURL:(id)a3 completion:(id)a4;
- (void)mapsMerchantWithIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4 completion:(id)a5;
- (void)mapsMerchantsWithCompletion:(id)a3;
- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4;
- (void)memberTypeForCurrentUserWithCompletion:(id)a3;
- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5;
- (void)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)notifyForSafariCardImportConsentWithCompletion:(id)a3;
- (void)notifyForSafariCardImportWithCredentials:(id)a3 withCompletion:(id)a4;
- (void)outstandingExpressTransactionState:(id)a3;
- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4;
- (void)passSharesForCredentialIdentifier:(id)a3 completion:(id)a4;
- (void)passUniqueIdentifierForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)passUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)passbookUIServiceDidLaunch:(id)a3;
- (void)paymentDeviceFieldPropertiesWithHandler:(id)a3;
- (void)paymentOffersCatalogWithCompletion:(id)a3;
- (void)paymentPassForVPANID:(id)a3 andLoadImages:(BOOL)a4 completion:(id)a5;
- (void)paymentRewardsBalanceWithIdentifier:(id)a3 completion:(id)a4;
- (void)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)paymentRewardsRedemptionForPaymentHash:(id)a3 completion:(id)a4;
- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)paymentWebServiceCoordinator:(id)a3 didDownloadTransactionReceipt:(id)a4 forTransactionWithIdentifier:(id)a5;
- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)pendingFamilyMembersIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4;
- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)performDeviceCheckInWithCompletion:(id)a3;
- (void)performProductActionRequest:(id)a3 completion:(id)a4;
- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4;
- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)prepareIdentityProvisioningForTargetDeviceIdentifier:(id)a3 completion:(id)a4;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4;
- (void)processSharingCLICommands:(id)a3 completion:(id)a4;
- (void)processTransitTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7;
- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)productsWithCompletion:(id)a3;
- (void)productsWithRequest:(id)a3 completion:(id)a4;
- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 completion:(id)a5;
- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 completion:(id)a7;
- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8;
- (void)pushProvisioningSharingIdentifiers:(id)a3;
- (void)queueIdentityPassProvisioningWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 supplementalData:(id)a6 completion:(id)a7;
- (void)rangingSuspensionReasonForCredential:(id)a3 forPaymentApplicationID:(id)a4 completion:(id)a5;
- (void)recomputeCategoryVisualizationMangitudesForPassUniqueID:(id)a3 style:(int64_t)a4;
- (void)recordPaymentApplicationUsageForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4;
- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4;
- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4;
- (void)regenerateVPANCardCredentialsForVPANID:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)regionsMatchingName:(id)a3 types:(id)a4 completion:(id)a5;
- (void)regionsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)rejectShareForMailboxAddress:(id)a3;
- (void)relinquishInvitation:(id)a3 completion:(id)a4;
- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)removeExpressPassesWithCardType:(int64_t)a3 completion:(id)a4;
- (void)removeMapsDataForTransactionWithIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4 issueReportIdentifier:(id)a5 completion:(id)a6;
- (void)removePaymentOffersCatalog;
- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)removeProductsCache;
- (void)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5;
- (void)removeSharingInvitationWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3;
- (void)requestNotificationAuthorizationWithCompletion:(id)a3;
- (void)requiresUpgradedPasscodeWithCompletion:(id)a3;
- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5;
- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4;
- (void)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4;
- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4;
- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4;
- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)sanitizeExpressPasses;
- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4;
- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3;
- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3;
- (void)scheduleSetupReminders:(id)a3;
- (void)sendAllPassTransactions;
- (void)sendCredential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5;
- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4;
- (void)sendDidReceivePendingProvisioningUpdate:(id)a3;
- (void)sendDidRecieveCredentialInvitation:(id)a3;
- (void)sendDidRemoveTransactionsWithSourceIdentifierMapping:(id)a3;
- (void)sendDidUpdateApplicationMessages:(id)a3;
- (void)sendDidUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3;
- (void)sendPassWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4;
- (void)sendPassWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitProperties:(id)a4;
- (void)sendSharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3;
- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)sendTransactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)sendTransactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)serviceResumed;
- (void)serviceSuspended;
- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setApplicationMessageManager:(id)a3;
- (void)setApplyManager:(id)a3;
- (void)setAuxiliaryCapabilityManager:(id)a3;
- (void)setAuxiliaryPassInformationManager:(id)a3;
- (void)setBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 withPassUniqueIdentifier:(id)a5 handler:(id)a6;
- (void)setBarcodeCredentialManager:(id)a3;
- (void)setCardFileManager:(id)a3;
- (void)setCloudStoreNotificationCoordinator:(id)a3;
- (void)setCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 withPassUniqueIdentifier:(id)a5 handler:(id)a6;
- (void)setDatabaseManager:(id)a3;
- (void)setDefaultExpressFelicaTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5;
- (void)setDefaultExpressTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5;
- (void)setDefaultPassManager:(id)a3;
- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 handler:(id)a5;
- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5;
- (void)setDevicePasscodeManager:(id)a3;
- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5;
- (void)setDoubleClickAllowed:(BOOL)a3 completion:(id)a4;
- (void)setExpressPassManager:(id)a3;
- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)setFamilyMemberManager:(id)a3;
- (void)setFinanceKitMessageProvider:(id)a3;
- (void)setIdsSharingManager:(id)a3;
- (void)setIso18013Manager:(id)a3;
- (void)setIssuerBindingManager:(id)a3;
- (void)setMapsBrandAndMerchantUpdater:(id)a3;
- (void)setNFCPairingManager:(id)a3;
- (void)setNFCPayloadState:(unint64_t)a3 forPass:(id)a4;
- (void)setNotificationServiceCoordinator:(id)a3;
- (void)setPassKitEventPublisher:(id)a3;
- (void)setPassTileManager:(id)a3;
- (void)setPaymentApplicationRangingSuspensionReason:(unint64_t)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)setPaymentOffersManager:(id)a3;
- (void)setPaymentTransactionProcessor:(id)a3;
- (void)setPaymentUserCommunicationManager:(id)a3;
- (void)setPaymentWebServiceCoordinator:(id)a3;
- (void)setPeerPaymentWebServicesCoordinator:(id)a3;
- (void)setPendingProvisioningManager:(id)a3;
- (void)setPushNotificationManager:(id)a3;
- (void)setPushProvisioningManager:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setSharingManager:(id)a3;
- (void)setSubcredentialManager:(id)a3;
- (void)setTapToRadarDelegate:(id)a3;
- (void)setTransactionAuthenticationManager:(id)a3;
- (void)setTransactionReceiptFileManager:(id)a3;
- (void)setTransitStateManager:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)sharingCapabilitiesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)sharingInvitationWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5 completion:(id)a6;
- (void)simulateDefaultExpressTransitPassIdentifier:(id)a3 forExpressMode:(id)a4 handler:(id)a5;
- (void)simulateDeviceAccessory;
- (void)simulateEnableBiometricsForPass:(id)a3;
- (void)simulateExpressTransactionForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4;
- (void)simulateNotificationOfType:(unint64_t)a3 userInfo:(id)a4 handler:(id)a5;
- (void)simulatePaymentPushTopic:(id)a3 handler:(id)a4;
- (void)simulateSecureEvent:(id)a3;
- (void)simulateVehicleInitiatedPairingWithTCIs:(id)a3 brandCode:(int64_t)a4 handler:(id)a5;
- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4;
- (void)statusForShareableCredentials:(id)a3 completion:(id)a4;
- (void)storePassOwnershipToken:(id)a3 withIdentifier:(id)a4;
- (void)storeTransactionReceiptData:(id)a3 completion:(id)a4;
- (void)subcredentialInvitationsWithCompletion:(id)a3;
- (void)submitApplyRequest:(id)a3 completion:(id)a4;
- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5;
- (void)submitDeleteRequest:(id)a3 completion:(id)a4;
- (void)submitDocumentRequest:(id)a3 completion:(id)a4;
- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)submitTermsRequest:(id)a3 completion:(id)a4;
- (void)submitTransactionAnswerForTransaction:(id)a3 questionType:(unint64_t)a4 answer:(id)a5 completion:(id)a6;
- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5;
- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 handler:(id)a6;
- (void)submitVerificationRequest:(id)a3 completion:(id)a4;
- (void)suggestPaymentSafariCredentialImport:(id)a3 withCompletion:(id)a4;
- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 unit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7;
- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5;
- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4;
- (void)transactionSourceTypeForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)transactionWithTransactionIdentifier:(id)a3 completion:(id)a4;
- (void)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)transactionsForPredicate:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)transactionsForRequest:(id)a3 completion:(id)a4;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 matchingMerchant:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withMerchantCategory:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withPeerPaymentCounterpartHandles:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionType:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transactionsRequiringReviewForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)transactionsTotalAmountForRequest:(id)a3 completion:(id)a4;
- (void)transactionsWithFullPaymentHashes:(id)a3 transactionSourceIdentifiers:(id)a4 completion:(id)a5;
- (void)transactionsWithTransactionIdentifiers:(id)a3 completion:(id)a4;
- (void)transactionsWithTransactionSource:(unint64_t)a3 withBackingData:(unint64_t)a4 limit:(int64_t)a5 completion:(id)a6;
- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 handler:(id)a5;
- (void)unscheduleDeviceCheckIn;
- (void)unscheduleDeviceUpgradeTaskActivity;
- (void)updateAllMapsBrandAndMerchantDataWithCompletion:(id)a3;
- (void)updateCardholderNameFromSafari:(id)a3 forVirtualCardWithIdentifier:(id)a4 completion:(id)a5;
- (void)updateDateLastUsedBySafari:(id)a3 forVirtualCardWithIdentifier:(id)a4 completion:(id)a5;
- (void)updateFeatureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)updateNotificationForProductIdentifier:(id)a3 configuration:(id)a4 localizedNotificationTitle:(id)a5 localizedNotificationMessage:(id)a6 completion:(id)a7;
- (void)updatePaymentOffersCatalogWithCompletion:(id)a3;
- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4 completion:(id)a5;
- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 applicationMessagesWithCompletion:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 entitlementsForPassIdentifier:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 expressPassConfigurationsWithHandler:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 fetchSharedPaymentWebServiceContextWithCompletion:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 handleStandaloneTransaction:(id)a4 withCompletion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 hasPendingProvisioningsOfTypes:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 removeApplicationMessageWithKey:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 removeApplicationMessagesWithKeys:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 setSharedPaymentWebServiceContext:(id)a4 withCompletion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 tappedApplicationMessageWithKey:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 tilesForPassWithUniqueIdentifer:(id)a4 context:(int64_t)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 updateFinanceKitApplicationMessagesWithCompletion:(id)a4;
- (void)valueAddedServiceTransactionWithIdentifier:(id)a3 handler:(id)a4;
- (void)valueAddedServiceTransactionsForPassWithUniqueIdentifier:(id)a3 limit:(int64_t)a4 handler:(id)a5;
- (void)valueAddedServiceTransactionsForPaymentTransaction:(id)a3 handler:(id)a4;
- (void)vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 completion:(id)a6;
- (void)vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 regenerate:(BOOL)a6 completion:(id)a7;
- (void)vpanVirtualCards:(id)a3;
- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4;
@end

@implementation PDPaymentService

- (void)familyMembersIgnoringCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v7 = (void (**)(id, void))a4;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist passesEntangledAccess])
  {
    [(PDFamilyCircleManager *)self->_familyMemberManager familyMembersWithCachePolicy:v4 completion:v7];
  }
  else if (v7)
  {
    v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    v7[2](v7, 0);
  }
}

- (void)dealloc
{
  sub_10000725C((uint64_t)self->_fieldDetectorManager, self);
  v3.receiver = self;
  v3.super_class = (Class)PDPaymentService;
  [(PDPaymentService *)&v3 dealloc];
}

- (void)featureApplicationsForAccountUserInvitationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    applyManager = self->_applyManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002128C;
    v8[3] = &unk_100736918;
    id v9 = v4;
    [(PDApplyManager *)applyManager applicationsWithCompletion:v8];
    v6 = v9;
LABEL_7:

    goto LABEL_8;
  }
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[PDPaymentService featureApplicationsForAccountUserInvitationWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
  }

  if (v4)
  {
    v6 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)usingSynchronousProxy:(BOOL)a3 fetchSharedPaymentWebServiceContextWithCompletion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      if (v4)
      {
        v8 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebServiceContext];
        v6[2](v6, v8);
      }
      else
      {
        v10 = PDDefaultQueue();
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100325B18;
        v11[3] = &unk_10072E598;
        v11[4] = self;
        v12 = v6;
        dispatch_async(v10, v11);
      }
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[PDPaymentService usingSynchronousProxy:fetchSharedPaymentWebServiceContextWithCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      v6[2](v6, 0);
    }
  }
}

- (void)categoryVisualizationMagnitudesForPassUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      v8 = [(PDDatabaseManager *)self->_databaseManager categoryVisualizationMagnitudesForPassUniqueID:v6];
      v7[2](v7, v8);
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        v11 = "-[PDPaymentService categoryVisualizationMagnitudesForPassUniqueID:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
      }

      v7[2](v7, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 applicationMessagesWithCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0)
    {
      id v7 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      v8 = v7;
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3032000000;
      v18[3] = sub_100020B8C;
      v18[4] = sub_1000210B8;
      id v19 = 0;
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3032000000;
      v16[3] = sub_100020B8C;
      v16[4] = sub_1000210B8;
      id v17 = 0;
      if (!a3) {
        [v7 addOperation:&stru_1007498B0];
      }
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100009974;
      v15[3] = &unk_10073CA58;
      v15[5] = v18;
      v15[6] = v16;
      v15[4] = self;
      [v8 addOperation:v15];
      id v9 = +[NSNull null];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000212FC;
      v11[3] = &unk_100743B58;
      id v12 = v6;
      v13 = v16;
      v14 = v18;
      id v10 = [v8 evaluateWithInput:v9 completion:v11];

      _Block_object_dispose(v16, 8);
      _Block_object_dispose(v18, 8);
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passKitEventPublisher, 0);
  objc_storeStrong((id *)&self->_auxiliaryPassInformationManager, 0);
  objc_storeStrong((id *)&self->_financeKitMessageProvider, 0);
  objc_storeStrong((id *)&self->_paymentUserCommunicationManager, 0);
  objc_storeStrong((id *)&self->_applicationMessageManager, 0);
  objc_storeStrong((id *)&self->_auxiliaryCapabilityManager, 0);
  objc_storeStrong((id *)&self->_pendingProvisioningManager, 0);
  objc_storeStrong((id *)&self->_sharingManager, 0);
  objc_storeStrong((id *)&self->_iso18013Manager, 0);
  objc_storeStrong((id *)&self->_idsSharingManager, 0);
  objc_storeStrong((id *)&self->_transactionReceiptFileManager, 0);
  objc_storeStrong((id *)&self->_paymentOffersManager, 0);
  objc_destroyWeak((id *)&self->_tapToRadarDelegate);
  objc_storeStrong((id *)&self->_transactionAuthenticationManager, 0);
  objc_storeStrong((id *)&self->_barcodeCredentialManager, 0);
  objc_storeStrong((id *)&self->_issuerBindingManager, 0);
  objc_storeStrong((id *)&self->_pushProvisioningManager, 0);
  objc_storeStrong((id *)&self->_mapsBrandAndMerchantUpdater, 0);
  objc_storeStrong((id *)&self->_passTileManager, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_nfcPairingManager, 0);
  objc_storeStrong((id *)&self->_subcredentialManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_applyManager, 0);
  objc_storeStrong((id *)&self->_devicePasscodeManager, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_defaultPassManager, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_transitStateManager, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_paymentTransactionProcessor, 0);
  objc_storeStrong((id *)&self->_familyMemberManager, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServicesCoordinator, 0);
  objc_storeStrong((id *)&self->_cloudStoreNotificationCoordinator, 0);
  objc_storeStrong((id *)&self->_notificationServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_fieldDetectorManager, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

- (void)usingSynchronousProxy:(BOOL)a3 hasPendingProvisioningsOfTypes:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, BOOL))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (v6)
    {
      v9[2](v9, [(PDPendingProvisioningManager *)self->_pendingProvisioningManager hasPendingProvisioningsOfTypes:v8]);
    }
    else
    {
      v11 = PDDefaultQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003410FC;
      block[3] = &unk_100731830;
      v14 = v9;
      block[4] = self;
      id v13 = v8;
      dispatch_async(v11, block);
    }
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[PDPaymentService usingSynchronousProxy:hasPendingProvisioningsOfTypes:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }

    v9[2](v9, 0);
  }
}

- (void)setUserNotificationManager:(id)a3
{
}

- (void)setTransitStateManager:(id)a3
{
}

- (void)setTransactionReceiptFileManager:(id)a3
{
}

- (void)setTransactionAuthenticationManager:(id)a3
{
}

- (void)setTapToRadarDelegate:(id)a3
{
}

- (void)setSubcredentialManager:(id)a3
{
}

- (void)setSharingManager:(id)a3
{
}

- (void)setSecureElement:(id)a3
{
}

- (void)setPushProvisioningManager:(id)a3
{
}

- (void)setPushNotificationManager:(id)a3
{
}

- (void)setPendingProvisioningManager:(id)a3
{
}

- (void)setPeerPaymentWebServicesCoordinator:(id)a3
{
}

- (void)setPaymentWebServiceCoordinator:(id)a3
{
  v5 = (PDPaymentWebServiceCoordinator *)a3;
  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  if (paymentWebServiceCoordinator != v5)
  {
    id v7 = v5;
    if (paymentWebServiceCoordinator) {
      [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator unregisterObserver:self];
    }
    objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, a3);
    paymentWebServiceCoordinator = (PDPaymentWebServiceCoordinator *)[(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator registerObserver:self];
    v5 = v7;
  }
  _objc_release_x1(paymentWebServiceCoordinator, v5);
}

- (void)setPaymentUserCommunicationManager:(id)a3
{
}

- (void)setPaymentTransactionProcessor:(id)a3
{
}

- (void)setPaymentOffersManager:(id)a3
{
}

- (void)setPassTileManager:(id)a3
{
}

- (void)setPassKitEventPublisher:(id)a3
{
}

- (void)setNotificationServiceCoordinator:(id)a3
{
}

- (void)setNFCPairingManager:(id)a3
{
}

- (void)setMapsBrandAndMerchantUpdater:(id)a3
{
}

- (void)setIssuerBindingManager:(id)a3
{
}

- (void)setIso18013Manager:(id)a3
{
}

- (void)setIdsSharingManager:(id)a3
{
  v5 = (PKSharingIDSManager *)a3;
  p_idsSharingManager = &self->_idsSharingManager;
  idsSharingManager = self->_idsSharingManager;
  id v8 = v5;
  if (idsSharingManager != v5)
  {
    if (idsSharingManager) {
      [(PKSharingIDSManager *)idsSharingManager removeDelegate:self];
    }
    objc_storeStrong((id *)&self->_idsSharingManager, a3);
    if (*p_idsSharingManager) {
      [(PKSharingIDSManager *)*p_idsSharingManager addDelegate:self];
    }
  }
}

- (void)setFinanceKitMessageProvider:(id)a3
{
}

- (void)setFamilyMemberManager:(id)a3
{
  v5 = (PDFamilyCircleManager *)a3;
  familyMemberManager = self->_familyMemberManager;
  if (familyMemberManager != v5)
  {
    id v7 = v5;
    if (familyMemberManager) {
      [(PDFamilyCircleManager *)familyMemberManager removeObserver:self];
    }
    objc_storeStrong((id *)&self->_familyMemberManager, a3);
    familyMemberManager = (PDFamilyCircleManager *)[(PDFamilyCircleManager *)self->_familyMemberManager addObserver:self];
    v5 = v7;
  }
  _objc_release_x1(familyMemberManager, v5);
}

- (void)setExpressPassManager:(id)a3
{
}

- (void)setDevicePasscodeManager:(id)a3
{
}

- (void)setDefaultPassManager:(id)a3
{
}

- (void)setDatabaseManager:(id)a3
{
}

- (void)setCloudStoreNotificationCoordinator:(id)a3
{
}

- (void)setCardFileManager:(id)a3
{
}

- (void)setBarcodeCredentialManager:(id)a3
{
}

- (void)setAuxiliaryPassInformationManager:(id)a3
{
}

- (void)setAuxiliaryCapabilityManager:(id)a3
{
}

- (void)setApplyManager:(id)a3
{
  v5 = (PDApplyManager *)a3;
  applyManager = self->_applyManager;
  if (applyManager != v5)
  {
    id v7 = v5;
    if (applyManager) {
      [(PDApplyManager *)applyManager unregisterObserver:self];
    }
    objc_storeStrong((id *)&self->_applyManager, a3);
    applyManager = (PDApplyManager *)[(PDApplyManager *)self->_applyManager registerObserver:self];
    v5 = v7;
  }
  _objc_release_x1(applyManager, v5);
}

- (void)setApplicationMessageManager:(id)a3
{
}

- (void)setAccountManager:(id)a3
{
}

- (PDPaymentService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PDPaymentService;
  id v8 = [(PDPaymentService *)&v19 initWithConnection:v6];
  if (v8)
  {
    id v9 = (PKEntitlementWhitelist *)[objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v6];
    whitelist = v8->_whitelist;
    v8->_whitelist = v9;

    v11 = sub_100011FE8((uint64_t)v7);
    uint64_t v12 = sub_100011FD0((uint64_t)v11);
    remoteInterfacePresenter = v8->_remoteInterfacePresenter;
    v8->_remoteInterfacePresenter = (PDRemoteInterfacePresenter *)v12;

    uint64_t v14 = sub_100011FDC((uint64_t)v11);
    fieldDetectorManager = v8->_fieldDetectorManager;
    v8->_fieldDetectorManager = (PDFieldDetectorManager *)v14;

    v8->_lock._os_unfair_lock_opaque = 0;
    v16 = PKPaymentServiceInterface();
    [v6 setRemoteObjectInterface:v16];

    id v17 = PDPaymentServiceExtendedInterface();
    [v6 setExportedInterface:v17];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (void)activated
{
  sub_10001204C((uint64_t)self->_fieldDetectorManager, self);
  v3.receiver = self;
  v3.super_class = (Class)PDPaymentService;
  [(PDPaymentService *)&v3 activated];
}

- (void)serviceResumed
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_suspendTransactionUpdates = 0;
  os_unfair_lock_unlock(p_lock);
}

- (PDPaymentService)initWithConnection:(id)a3
{
  return 0;
}

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)PDPaymentService;
  v2 = [(PDPaymentService *)&v4 remoteObjectProxy];
  return v2;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPaymentService;
  objc_super v3 = [(PDPaymentService *)&v5 remoteObjectProxyWithErrorHandler:a3];
  return v3;
}

- (void)paymentWebServiceCoordinator:(id)a3 didDownloadTransactionReceipt:(id)a4 forTransactionWithIdentifier:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = [(PDPaymentService *)self remoteObjectProxy];
    [v8 transactionWithIdentifier:v7 didDownloadTransactionReceipt:v9];
  }
}

- (void)applyManager:(id)a3 didAddApplication:(id)a4
{
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    objc_super v5 = [(PDPaymentService *)self remoteObjectProxy];
    [v5 featureApplicationAdded:v6];
  }
}

- (void)applyManager:(id)a3 didRemoveApplication:(id)a4
{
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    objc_super v5 = [(PDPaymentService *)self remoteObjectProxy];
    [v5 featureApplicationRemoved:v6];
  }
}

- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5
{
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v6 = [(PDPaymentService *)self remoteObjectProxy];
    [v6 featureApplicationChanged:v7];
  }
}

- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100323E88;
    v5[3] = &unk_10072FC20;
    v5[4] = self;
    [v4 familyMembersWithCachePolicy:0 completion:v5];
  }
}

- (void)setDoubleClickAllowed:(BOOL)a3 completion:(id)a4
{
  objc_super v5 = (void (**)(void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    PDSetDoubleClickAllowed();
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[PDPaymentService setDoubleClickAllowed:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v7, 0xCu);
  }

  if (v5) {
LABEL_7:
  }
    v5[2](v5);
LABEL_8:
}

- (void)paymentDeviceFieldPropertiesWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1003240F8;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D888;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)defaultPaymentPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10032430C;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D888;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100324540;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D888;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)defaultPaymentPassIngestionSpecificIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100324754;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D888;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)setDefaultExpressTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v8 = a5;
  databaseManager = self->_databaseManager;
  id v10 = a4;
  id v11 = [(PDDatabaseManager *)databaseManager passWithUniqueIdentifier:a3];
  uint64_t v12 = [v11 paymentPass];

  id v13 = [objc_alloc((Class)PKExpressPassInformation) initForPaymentPass:v12 withTechologyTest:&stru_100749800];
  id v14 = [objc_alloc((Class)PKExpressPassConfiguration) initWithPassInformation:v13 forSecureElementPass:v12];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100324A54;
  v17[3] = &unk_100749828;
  id v18 = v13;
  id v19 = v8;
  id v15 = v13;
  id v16 = v8;
  [(PDPaymentService *)self setExpressWithPassConfiguration:v14 credential:v10 completion:v17];
}

- (void)setDefaultExpressFelicaTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5
{
}

- (void)isExpressModeEnabledForRemotePassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
    {
      id v8 = objc_alloc_init(off_100806BC8());
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100324BD8;
      v9[3] = &unk_10072E570;
      id v10 = v7;
      [v8 expressModeEnabledForPassIdentifier:v6 completion:v9];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)expressPassConfigurationWithPassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v8
      && (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
       || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
      && (expressPassManager = self->_expressPassManager) != 0)
    {
      sub_10018DE9C((uint64_t)expressPassManager, v8, v6);
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)expressPassConfigurationsWithCardType:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v8 = v6;
    if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
       || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
      && (expressPassManager = self->_expressPassManager) != 0)
    {
      sub_10018E054((uint64_t)expressPassManager, a3, v8);
    }
    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
    id v6 = v8;
  }
}

- (void)expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v8 = v6;
    if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
       || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
      && (expressPassManager = self->_expressPassManager) != 0)
    {
      sub_10018E324((uint64_t)expressPassManager, a3, v8);
    }
    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
    id v6 = v8;
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 expressPassConfigurationsWithHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    id v9 = v6;
    if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
       || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
      && (expressPassManager = (os_unfair_lock_s *)self->_expressPassManager) != 0)
    {
      if (v4)
      {
        id v8 = sub_10018E8FC(expressPassManager);
        v9[2](v9, v8);
      }
      else
      {
        sub_10018E790((uint64_t)expressPassManager, v9);
      }
    }
    else
    {
      v9[2](v9, 0);
    }
    id v6 = v9;
  }
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
       || ([(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration] & 1) != 0
       || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
      && (expressPassManager = self->_expressPassManager) != 0)
    {
      sub_10018E9FC((uint64_t)expressPassManager, v8, v6);
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withCompletion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
       || ([(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration] & 1) != 0
       || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
      && self->_expressPassManager
      && (databaseManager = self->_databaseManager) != 0)
    {
      id v8 = [v11 passUniqueIdentifier];
      id v9 = [(PDDatabaseManager *)databaseManager paymentApplicationsForPassUniqueIdentifier:v8];

      id v10 = [objc_alloc((Class)PKExpressPassConfiguration) initWithPassInformation:v11 forPaymentApplications:v9];
      sub_10018E9FC((uint64_t)self->_expressPassManager, v10, v6);
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
       || ([(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration] & 1) != 0
       || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
      && (expressPassManager = self->_expressPassManager) != 0)
    {
      sub_10018EECC((uint64_t)expressPassManager, v11, v8, v9);
    }
    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
       || ([(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration] & 1) != 0
       || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
      && self->_expressPassManager
      && (databaseManager = self->_databaseManager) != 0)
    {
      uint64_t v12 = [v8 passUniqueIdentifier];
      id v13 = [(PDDatabaseManager *)databaseManager paymentApplicationsForPassUniqueIdentifier:v12];

      id v14 = [objc_alloc((Class)PKExpressPassConfiguration) initWithPassInformation:v8 forPaymentApplications:v13];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100325314;
      v16[3] = &unk_100749850;
      v16[4] = self;
      id v15 = objc_msgSend(v9, "pk_setBySafelyApplyingBlock:", v16);
      sub_10018EECC((uint64_t)self->_expressPassManager, v14, v15, v10);
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
     || ([(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration] & 1) != 0
     || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
    && (expressPassManager = self->_expressPassManager) != 0)
  {
    sub_1001903B0((uint64_t)expressPassManager, v11, v8, v9);
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
     || ([(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration] & 1) != 0
     || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
    && self->_expressPassManager
    && (databaseManager = self->_databaseManager) != 0)
  {
    uint64_t v12 = [v8 passUniqueIdentifier];
    id v13 = [(PDDatabaseManager *)databaseManager passWithUniqueIdentifier:v12];
    id v14 = [v13 secureElementPass];

    id v15 = objc_alloc((Class)PKExpressPassConfiguration);
    if (v14) {
      id v16 = [v15 initWithPassInformation:v8 forSecureElementPass:v14];
    }
    else {
      id v16 = [v15 initWithPassInformation:v8 isNFCExpressEnabled:1 isUWBExpressEnabled:0];
    }
    id v17 = v16;
    expressPassManager = self->_expressPassManager;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100325644;
    v19[3] = &unk_10073B738;
    id v20 = v10;
    sub_1001903B0((uint64_t)expressPassManager, v17, v9, v19);
  }
  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (void)removeExpressPassesWithCardType:(int64_t)a3 completion:(id)a4
{
  id v8 = a4;
  if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
     || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
    && (expressPassManager = self->_expressPassManager) != 0)
  {
    sub_100190798((uint64_t)expressPassManager, a3, v8);
  }
  else
  {
    id v7 = v8;
    if (!v8) {
      goto LABEL_8;
    }
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
  id v7 = v8;
LABEL_8:
}

- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ((([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
     || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
    && (expressPassManager = self->_expressPassManager) != 0)
  {
    sub_100190B0C((uint64_t)expressPassManager, v8, v6);
  }
  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)isPassExpressWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v8
      && (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
       || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
      && (expressPassManager = self->_expressPassManager) != 0)
    {
      sub_10018DCCC((uint64_t)expressPassManager, v8, v6);
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)simulateDefaultExpressTransitPassIdentifier:(id)a3 forExpressMode:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess]
    && self->_expressPassManager)
  {
    id v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v7];
    id v10 = [v9 paymentPass];

    id v11 = [objc_alloc((Class)PKExpressPassInformation) initForPaymentPass:v10 withTechologyTest:0];
    if (v11 && self->_expressPassManager)
    {
      id v12 = [objc_alloc((Class)PKExpressPassConfiguration) initWithPassInformation:v11 forSecureElementPass:v10];
      expressPassManager = self->_expressPassManager;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100325B00;
      v15[3] = &unk_10073B738;
      id v16 = v8;
      sub_1001903B0((uint64_t)expressPassManager, v12, 0, v15);
    }
    else if (v8)
    {
      v8[2](v8);
    }
  }
  else
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[PDPaymentService simulateDefaultExpressTransitPassIdentifier:forExpressMode:handler:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v8) {
      v8[2](v8);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 setSharedPaymentWebServiceContext:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (v6)
    {
      [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator updateSharedWebServiceContext:v8];
      if (v9) {
        v9[2](v9);
      }
    }
    else
    {
      id v12 = PDDefaultQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100325D48;
      block[3] = &unk_10072E9D8;
      void block[4] = self;
      id v14 = v8;
      id v15 = v9;
      dispatch_async(v12, block);
    }
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[PDPaymentService usingSynchronousProxy:setSharedPaymentWebServiceContext:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100325E7C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100326070;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 tappedApplicationMessageWithKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
    || ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0)
  {
    id v10 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    id v11 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = sub_100020B8C;
    void v19[4] = sub_1000210B8;
    if (!v9) {
      id v11 = (void *)PDOSTransactionCreate("PDPaymentService");
    }
    id v20 = v11;
    if (!a3) {
      [v10 addOperation:&stru_1007498D0];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100326498;
    v17[3] = &unk_100731CB8;
    void v17[4] = self;
    id v18 = v8;
    [v10 addOperation:v17];
    id v12 = +[NSNull null];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100326524;
    v14[3] = &unk_10072E660;
    id v15 = v9;
    id v16 = v19;
    id v13 = [v10 evaluateWithInput:v12 completion:v14];

    _Block_object_dispose(v19, 8);
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 removeApplicationMessageWithKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
    || ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0)
  {
    id v10 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    id v11 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = sub_100020B8C;
    void v19[4] = sub_1000210B8;
    if (!v9) {
      id v11 = (void *)PDOSTransactionCreate("PDPaymentService");
    }
    id v20 = v11;
    if (!a3) {
      [v10 addOperation:&stru_1007498F0];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100326880;
    v17[3] = &unk_100731CB8;
    void v17[4] = self;
    id v18 = v8;
    [v10 addOperation:v17];
    id v12 = +[NSNull null];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10032690C;
    v14[3] = &unk_10072E660;
    id v15 = v9;
    id v16 = v19;
    id v13 = [v10 evaluateWithInput:v12 completion:v14];

    _Block_object_dispose(v19, 8);
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 removeApplicationMessagesWithKeys:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
    || ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0)
  {
    id v10 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    id v11 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = sub_100020B8C;
    void v19[4] = sub_1000210B8;
    if (!v9) {
      id v11 = (void *)PDOSTransactionCreate("PDPaymentService");
    }
    id v20 = v11;
    if (!a3) {
      [v10 addOperation:&stru_100749910];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100326C68;
    v17[3] = &unk_100731CB8;
    void v17[4] = self;
    id v18 = v8;
    [v10 addOperation:v17];
    id v12 = +[NSNull null];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100326CF4;
    v14[3] = &unk_10072E660;
    id v15 = v9;
    id v16 = v19;
    id v13 = [v10 evaluateWithInput:v12 completion:v14];

    _Block_object_dispose(v19, 8);
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 tilesForPassWithUniqueIdentifer:(id)a4 context:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    if (v10
      && (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
       || ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0))
    {
      id v12 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      id v13 = v12;
      if (!a3) {
        [v12 addOperation:&stru_100749930];
      }
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = sub_100020B8C;
      v27[4] = sub_1000210B8;
      id v28 = 0;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3032000000;
      v25[3] = sub_100020B8C;
      v25[4] = sub_1000210B8;
      id v26 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1003270B0;
      v20[3] = &unk_100749958;
      v22 = v27;
      v23 = v25;
      v20[4] = self;
      id v21 = v10;
      int64_t v24 = a5;
      [v13 addOperation:v20];
      id v14 = +[NSNull null];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100327174;
      v16[3] = &unk_100743B58;
      id v17 = v11;
      id v18 = v25;
      id v19 = v27;
      id v15 = [v13 evaluateWithInput:v14 completion:v16];

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(v27, 8);
    }
    else
    {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 updateFinanceKitApplicationMessagesWithCompletion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
    || ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0)
  {
    id v7 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    id v8 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = sub_100020B8C;
    void v15[4] = sub_1000210B8;
    if (!v6) {
      id v8 = (void *)PDOSTransactionCreate("PDPaymentService");
    }
    id v16 = v8;
    if (!a3) {
      [v7 addOperation:&stru_100749978];
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003274E0;
    v14[3] = &unk_10072E5C0;
    void v14[4] = self;
    [v7 addOperation:v14];
    id v9 = +[NSNull null];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100327614;
    v11[3] = &unk_10072E660;
    id v12 = v6;
    id v13 = v15;
    id v10 = [v7 evaluateWithInput:v9 completion:v11];

    _Block_object_dispose(v15, 8);
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100327788;
  block[3] = &unk_100731F38;
  void block[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 unit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v14)
  {
    id v15 = PDDefaultQueue();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100327BEC;
    v16[3] = &unk_100732BC8;
    void v16[4] = self;
    id v17 = v12;
    id v18 = v13;
    unint64_t v20 = a5;
    BOOL v21 = a6;
    id v19 = v14;
    dispatch_async(v15, v16);
  }
}

- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if (v19)
  {
    unint64_t v20 = PDDefaultQueue();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100327E54;
    v21[3] = &unk_1007427A8;
    v21[4] = self;
    id v22 = v15;
    id v23 = v16;
    id v24 = v17;
    id v25 = v18;
    unint64_t v27 = a7;
    unint64_t v28 = a8;
    id v26 = v19;
    dispatch_async(v20, v21);
  }
}

- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100328080;
    block[3] = &unk_100731F38;
    void block[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    dispatch_async(v14, block);
  }
}

- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032825C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  if (v19)
  {
    unint64_t v20 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003284D0;
    block[3] = &unk_1007499C0;
    void block[4] = self;
    id v22 = v16;
    unint64_t v26 = a4;
    unint64_t v27 = a5;
    id v23 = v17;
    id v24 = v18;
    int64_t v28 = a8;
    int64_t v29 = a9;
    id v25 = v19;
    dispatch_async(v20, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withPeerPaymentCounterpartHandles:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (v16)
  {
    id v17 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100328704;
    block[3] = &unk_1007499E8;
    void block[4] = self;
    id v19 = v14;
    id v20 = v15;
    unint64_t v22 = a5;
    unint64_t v23 = a6;
    int64_t v24 = a7;
    id v21 = v16;
    dispatch_async(v17, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 matchingMerchant:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (v16)
  {
    id v17 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100328934;
    block[3] = &unk_1007499E8;
    void block[4] = self;
    id v19 = v14;
    id v20 = v15;
    unint64_t v22 = a5;
    unint64_t v23 = a6;
    int64_t v24 = a7;
    id v21 = v16;
    dispatch_async(v17, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withMerchantCategory:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  if (v19)
  {
    id v20 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100328B94;
    block[3] = &unk_1007499C0;
    void block[4] = self;
    id v22 = v16;
    int64_t v26 = a4;
    unint64_t v27 = a5;
    unint64_t v28 = a6;
    id v23 = v17;
    id v24 = v18;
    int64_t v29 = a9;
    id v25 = v19;
    dispatch_async(v20, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionType:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  if (v19)
  {
    id v20 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100328DF0;
    block[3] = &unk_1007499C0;
    void block[4] = self;
    id v22 = v16;
    int64_t v26 = a4;
    unint64_t v27 = a5;
    unint64_t v28 = a6;
    id v23 = v17;
    id v24 = v18;
    int64_t v29 = a9;
    id v25 = v19;
    dispatch_async(v20, block);
  }
}

- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  if (v18)
  {
    id v19 = PDDefaultQueue();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100329044;
    v20[3] = &unk_100749A10;
    v20[4] = self;
    id v21 = v15;
    unint64_t v25 = a4;
    unint64_t v26 = a5;
    id v22 = v16;
    id v23 = v17;
    int64_t v27 = a8;
    id v24 = v18;
    dispatch_async(v19, v20);
  }
}

- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  if (v18)
  {
    id v19 = PDDefaultQueue();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1003292A4;
    v20[3] = &unk_100749A10;
    v20[4] = self;
    id v21 = v15;
    unint64_t v25 = a4;
    unint64_t v26 = a5;
    id v22 = v16;
    id v23 = v17;
    int64_t v27 = a8;
    id v24 = v18;
    dispatch_async(v19, v20);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (v13)
  {
    id v14 = PDDefaultQueue();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003294BC;
    v15[3] = &unk_100749A38;
    void v15[4] = self;
    id v16 = v12;
    unint64_t v18 = a4;
    unint64_t v19 = a5;
    int64_t v20 = a6;
    id v17 = v13;
    dispatch_async(v14, v15);
  }
}

- (void)transactionsWithTransactionSource:(unint64_t)a3 withBackingData:(unint64_t)a4 limit:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  if (v10)
  {
    id v11 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100329628;
    block[3] = &unk_100749A60;
    void block[4] = self;
    unint64_t v14 = a3;
    unint64_t v15 = a4;
    int64_t v16 = a5;
    id v13 = v10;
    dispatch_async(v11, block);
  }
}

- (void)transactionWithTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100329808;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)transactionsWithTransactionIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003299F0;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)transactionsWithFullPaymentHashes:(id)a3 transactionSourceIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = PDDefaultQueue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100329CC0;
    v12[3] = &unk_100730578;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(v11, v12);
  }
}

- (void)transactionSourceTypeForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100329EAC;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = PDDefaultQueue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10032A0B0;
    v12[3] = &unk_100730578;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(v11, v12);
  }
}

- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032A29C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032A484;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)installmentPlansWithTransactionReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032A65C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (v19)
  {
    int64_t v20 = PDDefaultQueue();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10032A8BC;
    v21[3] = &unk_100749A88;
    v21[4] = self;
    id v22 = v15;
    BOOL v28 = a5;
    id v23 = v16;
    unint64_t v27 = a6;
    id v24 = v17;
    id v25 = v18;
    id v26 = v19;
    dispatch_async(v20, v21);
  }
}

- (void)transactionsForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032AAA4;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)transactionsTotalAmountForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032ACA4;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)logoImageDataForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032AE84;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)transactionsForPredicate:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = PDDefaultQueue();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10032B130;
    v11[3] = &unk_100731AD8;
    void v11[4] = self;
    id v12 = v8;
    int64_t v14 = a4;
    id v13 = v9;
    dispatch_async(v10, v11);
  }
}

- (void)passUniqueIdentifierForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032B30C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032B4F4;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)passUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = PDDefaultQueue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10032B704;
    v12[3] = &unk_100730578;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(v11, v12);
  }
}

- (void)ambiguousTransactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032B8F0;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)mapsMerchantsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = PDDefaultQueue();
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10032BAB8;
    v6[3] = &unk_10072FDC8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)valueAddedServiceTransactionsForPassWithUniqueIdentifier:(id)a3 limit:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = PDDefaultQueue();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10032BCB0;
    v11[3] = &unk_100731AD8;
    void v11[4] = self;
    id v12 = v8;
    int64_t v14 = a4;
    id v13 = v9;
    dispatch_async(v10, v11);
  }
}

- (void)valueAddedServiceTransactionsForPaymentTransaction:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032BE8C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)valueAddedServiceTransactionWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032C064;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032C23C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032C450;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032C664;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)balanceReminderThresholdForBalanceIdentifier:(id)a3 withPassUniqueIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10032C8A0;
  v15[3] = &unk_100730578;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)setBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 withPassUniqueIdentifier:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032CACC;
  block[3] = &unk_100731F38;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10032D064;
  v15[3] = &unk_100730578;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)commutePlanReminderForCommutePlanIdentifier:(id)a3 withPassUniqueIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10032D4B4;
  v15[3] = &unk_100730578;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 withPassUniqueIdentifier:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032D6E0;
  block[3] = &unk_100731F38;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032D8B4;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)deletePaymentTransactionsWithIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032DA7C;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)deleteAllTransactionsForTransactionSourceIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032DC44;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)deleteAllMessagesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032DEE8;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)archiveMessageWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032E0B0;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)insertOrUpdatePaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10032E2A0;
  v15[3] = &unk_100730578;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)insertOrUpdatePaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032E558;
  block[3] = &unk_100731F38;
  void block[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)_insertPendingTransactionRegistration:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()
    && PKDocumentDeliveryEnabled()
    && [v4 transactionSource] == (id)1
    && [v4 technologyType] == (id)2
    && [v4 originatedByDevice])
  {
    objc_super v5 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
    if (+[PKWebServiceDocumentDeliveryFeature isEnabledWithWebService:v5])
    {
      id v6 = objc_alloc_init(off_100806BD0());
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Inserting pending transaction registration", v8, 2u);
      }

      [v6 registerTransaction:v4];
    }
  }
}

- (void)removeMapsDataForTransactionWithIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4 issueReportIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032EA30;
  block[3] = &unk_100731F38;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)sanitizeExpressPasses
{
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    expressPassManager = self->_expressPassManager;
    if (expressPassManager)
    {
      -[PDExpressPassManager secureElementExpressConfigurationNeedsUpdate]_0((uint64_t)expressPassManager);
    }
  }
}

- (void)processTransitTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && self->_transitStateManager)
  {
    id v17 = PKAggDKeyPaymentTransactionOtherCard;
    id v18 = PDDefaultPaymentPassUniqueIdentifier();
    id v19 = v15;
    id v20 = v18;
    if (v20 == v19)
    {
    }
    else
    {
      id v21 = v20;
      if (!v19 || !v20)
      {

        goto LABEL_14;
      }
      unsigned int v23 = [v19 isEqualToString:v20];

      if (!v23) {
        goto LABEL_15;
      }
    }
    id v21 = v17;
    id v17 = PKAggDKeyPaymentTransactionDefaultCard;
LABEL_14:

LABEL_15:
    PKAnalyticsSendEvent();
    [(PDTransitStateManager *)self->_transitStateManager processTransactionEventWithHistory:v12 transactionDate:v13 forPaymentApplication:v14 withPassUniqueIdentifier:v19 expressTransactionState:v16];

    goto LABEL_16;
  }
  id v22 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[PDPaymentService processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUni"
          "queIdentifier:expressTransactionState:]";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
  }

LABEL_16:
}

- (void)recordPaymentApplicationUsageForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) == 0)
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      id v14 = "-[PDPaymentService recordPaymentApplicationUsageForPassUniqueIdentifier:paymentApplicationIdentifier:]";
      id v12 = "Client is not entitled for method: %s";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v6 || !v7)
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      id v14 = "-[PDPaymentService recordPaymentApplicationUsageForPassUniqueIdentifier:paymentApplicationIdentifier:]";
      id v12 = "%s called with nil passUniqueIdentifier or nil paymentApplicationIdentifier";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v8 = objc_alloc((Class)PKPaymentApplicationUsageSummary);
  id v9 = +[NSDate now];
  id v10 = [v8 initWithPassUniqueIdentifier:v6 paymentApplicationIdentifier:v7 lastUsed:v9];

  [(PDDatabaseManager *)self->_databaseManager insertPaymentApplicationUsageSummary:v10];
LABEL_11:
}

- (void)allPaymentApplicationUsageSummariesWithCompletion:(id)a3
{
  whitelist = self->_whitelist;
  objc_super v5 = (void (**)(void))a3;
  if ([(PKEntitlementWhitelist *)whitelist paymentAllAccess])
  {
    id v7 = [(PDDatabaseManager *)self->_databaseManager allPaymentApplicationUsageSummaries];
    v5[2](v5);
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[PDPaymentService allPaymentApplicationUsageSummariesWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    ((void (*)(void (**)(void), void))v5[2])(v5, 0);
  }
}

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 handler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && (transitStateManager = self->_transitStateManager) != 0)
  {
    [(PDTransitStateManager *)transitStateManager transitAppletStateWithPassUniqueIdentifier:v11 paymentApplication:v8 completion:v9];
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
}

- (void)outstandingExpressTransactionState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
      && (expressPassManager = self->_expressPassManager) != 0)
    {
      sub_100193C74((uint64_t)expressPassManager, v6);
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
    id v4 = v6;
  }
}

- (void)insertOrUpdateValueAddedServiceTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentTransaction:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032F314;
  block[3] = &unk_100731F38;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(21, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10032F71C;
  v16[3] = &unk_100730578;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D888;
  block[3] = &unk_10072F788;
  id v21 = v12;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v11, block);
}

- (void)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    whitelist = self->_whitelist;
    id v8 = (void (**)(id, void *))a4;
    if ([(PKEntitlementWhitelist *)whitelist paymentAllAccess])
    {
      id v9 = [(PDDatabaseManager *)self->_databaseManager defaultPaymentApplicationForPassUniqueIdentifier:v6];
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        id v12 = "-[PDPaymentService defaultPaymentApplicationForPassUniqueIdentifier:handler:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v11, 0xCu);
      }

      id v9 = 0;
    }
    v8[2](v8, v9);
  }
}

- (void)initializeSecureElementIfNecessaryWithHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032FA04;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)initializeSecureElement:(id)a3
{
  id v4 = a3;
  objc_super v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032FBF4;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)simulatePaymentPushTopic:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032FE94;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)simulateVehicleInitiatedPairingWithTCIs:(id)a3 brandCode:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = PDDefaultQueue();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100330068;
  v13[3] = &unk_100731AD8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)simulateNotificationOfType:(unint64_t)a3 userInfo:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = PDDefaultQueue();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100330240;
  v13[3] = &unk_100731AD8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)downloadAllPaymentPassesWithHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003319E8;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)consistencyCheckWithHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100331B8C;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)scheduleSetupReminders:(id)a3
{
  id v4 = a3;
  objc_super v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100331D30;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3
{
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator scheduleDeviceCheckInWithStartTimeOffset:a3];
  }
}

- (void)unscheduleDeviceCheckIn
{
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator unscheduleDeviceCheckIn];
  }
}

- (void)removeProductsCache
{
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    objc_super v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Warning: Forcibly removing products cache", v5, 2u);
    }

    id v4 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator paymentSetupFeaturesCoordinator];
    [v4 clearPaymentSetupFeatures];
  }
}

- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDUserNotificationManager *)self->_userNotificationManager requestNotificationAuthorizationIfNecessaryWithCompletion:v4];
  }
  else
  {
    objc_super v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[PDPaymentService requestNotificationAuthorizationIfNecessaryWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDUserNotificationManager *)self->_userNotificationManager requestNotificationAuthorizationWithCompletion:v4];
  }
  else
  {
    objc_super v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[PDPaymentService requestNotificationAuthorizationWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDUserNotificationManager *)self->_userNotificationManager userNotificationActionPerformed:a3 applicationMessageContentIdentifier:v8];
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[PDPaymentService userNotificationActionPerformed:applicationMessageContentIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v11, 0xCu);
  }

  if (v9) {
LABEL_7:
  }
    v9[2](v9);
LABEL_8:
}

- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDSharingManager *)self->_sharingManager userNotificationActionPerformed:a3 notificationIdentifier:v8];
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[PDPaymentService userNotificationActionPerformed:notificationIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v11, 0xCu);
  }

  if (v9) {
LABEL_7:
  }
    v9[2](v9);
LABEL_8:
}

- (void)passbookUIServiceDidLaunch:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    sub_10020D7DC((uint64_t)self->_remoteInterfacePresenter);
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  objc_super v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PDPaymentService passbookUIServiceDidLaunch:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v6, 0xCu);
  }

  if (v4) {
LABEL_7:
  }
    v4[2](v4);
LABEL_8:
}

- (void)simulateExpressTransactionForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  int v6 = (char *)a3;
  id v7 = (void (**)(void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    int has_internal_ui = os_variant_has_internal_ui();
    id v9 = PKLogFacilityTypeGetObject();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (has_internal_ui)
    {
      if (v10)
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PDPassLibrary: simulating express transaction for %@.", (uint8_t *)&v12, 0xCu);
      }

      sub_10018CA98((uint64_t)self->_expressPassManager, v6);
      if (!v7) {
        goto LABEL_11;
      }
LABEL_10:
      v7[2](v7);
      goto LABEL_11;
    }
    if (v10)
    {
      int v12 = 136315138;
      id v13 = "-[PDPaymentService simulateExpressTransactionForPassUniqueIdentifier:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PDPassLibrary (%s): not internal.", (uint8_t *)&v12, 0xCu);
    }

    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
    int v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[PDPaymentService simulateExpressTransactionForPassUniqueIdentifier:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PDPassLibrary (%s): not entitled.", (uint8_t *)&v12, 0xCu);
    }

    if (v7) {
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)usingSynchronousProxy:(BOOL)a3 handleStandaloneTransaction:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (v7) {
      sub_10018CF3C((uint64_t)self->_expressPassManager, v7);
    }
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService usingSynchronousProxy:handleStandaloneTransaction:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PDPaymentService: client is not entitled for method: %s.", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess]) {
    [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator startBackgroundVerificationObserverForPass:v7 verificationMethod:v6];
  }
}

- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager augmentedProductForInstallmentConfiguration:v8 experimentDetails:v9 withCompletion:v10];
  }
  else
  {
    int v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[PDPaymentService augmentedProductForInstallmentConfiguration:experimentDetails:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v12, 0xCu);
    }

    if (v10) {
      v10[2](v10, 0);
    }
  }
}

- (void)featureApplicationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager applicationsWithCompletion:v4];
  }
  else
  {
    objc_super v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[PDPaymentService featureApplicationsWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v6, 0xCu);
    }

    if (v4) {
      v4[2](v4, 0);
    }
  }
}

- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager applicationsForAccountIdentifier:v6 withCompletion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[PDPaymentService featureApplicationsForAccountIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)updateFeatureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager updateApplicationsForAccountWithIdentifier:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[PDPaymentService updateFeatureApplicationsForAccountIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)featureApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager applicationWithIdentifier:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[PDPaymentService featureApplicationWithIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentService *)self _updateApplicationsForType:1 completion:v4];
  }
  else
  {
    objc_super v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[PDPaymentService featureApplicationsForProvisioningWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v6, 0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (void)_updateApplicationsForType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  applyManager = self->_applyManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003330C4;
  v9[3] = &unk_100749B60;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [(PDApplyManager *)applyManager updateApplicationsWithCompletion:v9];
}

- (void)featureApplicationWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager applicationWithReferenceIdentifier:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService featureApplicationWithReferenceIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)submitApplyRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager submitApplyRequest:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService submitApplyRequest:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)submitDocumentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager submitDocumentRequest:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService submitDocumentRequest:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)submitVerificationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager submitVerificationRequest:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService submitVerificationRequest:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)submitTermsRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager submitTermsRequest:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService submitTermsRequest:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)submitDeleteRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDApplyManager *)self->_applyManager submitDeleteRequest:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService submitDeleteRequest:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)submitTransactionAnswerForTransaction:(id)a3 questionType:(unint64_t)a4 answer:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v25 = v10;
    id v13 = [(PDDatabaseManager *)self->_databaseManager transactionWithTransactionIdentifier:v10];
    id v14 = [v13 transactionSourceIdentifier];
    id v15 = [(PDDatabaseManager *)self->_databaseManager accountUserWithTransactionSourceIdentifier:v14];
    unint64_t v16 = [v13 accountIdentifier];
    id v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = PKPaymentTransactionQuestionTypeToString();
      *(_DWORD *)buf = 138413314;
      v35 = (const char *)v13;
      __int16 v36 = 2112;
      id v37 = v25;
      __int16 v38 = 2112;
      v39 = v16;
      __int16 v40 = 2112;
      v41 = v18;
      __int16 v42 = 2112;
      id v43 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Submitting transaction answer for transaction %@, transactionSourceIdentifier %@, accountIdentifier %@, questionType %@, answer %@", buf, 0x34u);
    }
    accountManager = self->_accountManager;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100333B64;
    v26[3] = &unk_100749BD8;
    v26[4] = self;
    unint64_t v33 = a4;
    id v27 = v11;
    id v28 = v13;
    id v29 = v16;
    id v30 = v15;
    id v31 = v14;
    id v32 = v12;
    id v20 = v14;
    id v21 = v15;
    id v22 = v16;
    id v23 = v13;
    [(PDAccountManager *)accountManager accountWithIdentifier:v22 completion:v26];

    id v10 = v25;
  }
  else
  {
    id v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[PDPaymentService submitTransactionAnswerForTransaction:questionType:answer:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

- (void)transactionsRequiringReviewForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v7 = [(PDDatabaseManager *)self->_databaseManager transactionsRequiringReviewForAccountWithIdentifier:v8];
    v6[2](v6, v7);
  }
}

- (void)recomputeCategoryVisualizationMangitudesForPassUniqueID:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDDatabaseManager *)self->_databaseManager recomputeCategoryVisualizationMagnitudesForPassUniqueID:v6 withStyle:a4];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "-[PDPaymentService recomputeCategoryVisualizationMangitudesForPassUniqueID:style:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_requestUpdatesForTransactionSourceIdentifiers:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v7);
        int v9 = [(PDCloudStoreNotificationCoordinator *)self->_cloudStoreNotificationCoordinator applePayContainer];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100334230;
        v11[3] = &unk_100737AC0;
        void v11[4] = self;
        void v11[5] = v8;
        [v9 canSyncTransactionFromCloudKitForTransactionSourceIdentifier:v8 completion:v11];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4
{
  p_tapToRadarDelegate = &self->_tapToRadarDelegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_tapToRadarDelegate);
  [WeakRetained displayTapToRadarAlertForRequest:v7 completion:v6];
}

- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator accountAttestationAnonymizationSaltWithCompletion:v4];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[PDPaymentService accountAttestationAnonymizationSaltWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v6, 0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator setAccountAttestationAnonymizationSalt:v6 withCompletion:v7];
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService setAccountAttestationAnonymizationSalt:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)suggestPaymentSafariCredentialImport:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    uint64_t v8 = PKSafariCredentialProvisioningConsented();
    if (v8 == 1)
    {
      [(PDPaymentService *)self notifyForSafariCardImportWithCredentials:v6 withCompletion:v7];
    }
    else if (v8)
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Explicitly requested to not check credential eligibility", (uint8_t *)&v12, 2u);
      }

      if (v7) {
        v7[2](v7, 1, 0);
      }
    }
    else
    {
      [(PDPaymentService *)self notifyForSafariCardImportConsentWithCompletion:v7];
    }
  }
  else
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      long long v13 = "-[PDPaymentService suggestPaymentSafariCredentialImport:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v12, 0xCu);
    }

    if (v7)
    {
      id v10 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v10);
    }
  }
}

- (void)notifyForSafariCardImportConsentWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentUserCommunicationManager *)self->_paymentUserCommunicationManager sendSafariCredentialImportConsentNotificationWithCompletion:v4];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[PDPaymentService notifyForSafariCardImportConsentWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v7, 0xCu);
    }

    if (v4)
    {
      id v6 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v4[2](v4, 0, v6);
    }
  }
}

- (void)notifyForSafariCardImportWithCredentials:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void, void *))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentUserCommunicationManager *)self->_paymentUserCommunicationManager sendSafariCredentialImportNotificationForCredentials:v6 withCompletion:v7];
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[PDPaymentService notifyForSafariCardImportWithCredentials:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
    }

    if (v7)
    {
      int v9 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v7[2](v7, 0, v9);
    }
  }
}

- (void)clearSafariCardImportNotificationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentUserCommunicationManager *)self->_paymentUserCommunicationManager clearSafariCredentialImportMessages];
    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[PDPaymentService clearSafariCardImportNotificationsWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v7, 0xCu);
    }

    if (v4)
    {
      id v6 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v6);
    }
  }
}

- (void)clearSafariCardImportNotificationHistoryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentUserCommunicationManager *)self->_paymentUserCommunicationManager clearSafariCredentialImportNotifiedIdentifiers];
    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[PDPaymentService clearSafariCardImportNotificationHistoryWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v7, 0xCu);
    }

    if (v4)
    {
      id v6 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v6);
    }
  }
}

- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    uint64_t v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100334DD8;
    v10[3] = &unk_10072E9D8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    int v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D888;
    block[3] = &unk_10072F788;
    id v14 = v9;
    dispatch_async(v8, block);
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)addPlaceholderPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = (char *)a3;
  id v7 = (void (**)(id, void *))a4;
  if (![(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v20 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v25 = "-[PDPaymentService addPlaceholderPassWithConfiguration:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

LABEL_12:
    id v19 = 0;
    if (!v7) {
      goto LABEL_14;
    }
LABEL_13:
    id v21 = (void *)PDOSTransactionCreate("PDPaymentService");
    v7[2](v7, v19);

    goto LABEL_14;
  }
  if (!v6) {
    goto LABEL_12;
  }
  int v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Adding placeholder pass with config: %@", buf, 0xCu);
  }

  int v10 = PKPassKitCoreBundle();
  id v11 = [v10 resourceURL];
  id v12 = [v11 URLByAppendingPathComponent:PKCredentialPlaceholderPassName];

  long long v13 = PKPassFromPlaceholderConfiguration();
  id v14 = [v13 paymentPass];

  if (v14)
  {
    id v23 = 0;
    unsigned int v15 = [(PDCardFileManager *)self->_cardFileManager writeCard:v14 source:1 error:&v23];
    unint64_t v16 = v23;
    if (!v15 || v23)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to add placeholder pass: %@", buf, 0xCu);
      }
      id v19 = 0;
    }
    else
    {
      databaseManager = self->_databaseManager;
      uint64_t v18 = [v14 uniqueID];
      int v9 = [(PDDatabaseManager *)databaseManager passWithUniqueIdentifier:v18];
      id v19 = [v9 paymentPass];

      id v14 = (void *)v18;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to add placeholder pass: unable to generate pass", buf, 2u);
    }

    id v19 = 0;
  }

  if (v7) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)subcredentialInvitationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v5 = [(PDAppletSubcredentialManager *)self->_subcredentialManager invitations];
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[PDPaymentService subcredentialInvitationsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v7, 0xCu);
  }

  id v5 = 0;
  if (v4) {
LABEL_7:
  }
    v4[2](v4, v5);
LABEL_8:
}

- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDAppletSubcredentialManager *)self->_subcredentialManager updateMetadataOnPassWithIdentifier:v8 credential:v9 completion:v10];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      long long v13 = "-[PDPaymentService updateMetadataOnPassWithIdentifier:credential:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v12, 0xCu);
    }

    if (v10) {
      v10[2](v10, 0);
    }
  }
}

- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v13 = a4;
  id v6 = dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100020B8C;
  v30[4] = sub_1000210B8;
  id v31 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "count"));
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100020B8C;
  v28[4] = sub_1000210B8;
  id v29 = objc_alloc_init((Class)NSMutableSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v9);
        dispatch_group_enter(v6);
        subcredentialManager = self->_subcredentialManager;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100335750;
        v20[3] = &unk_100749C28;
        id v22 = v30;
        id v23 = v28;
        id v21 = v6;
        [(PDAppletSubcredentialManager *)subcredentialManager requestRegistrationForCredentialWithIdentifier:v10 completion:v20];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }

  if (v13)
  {
    int v12 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003357E0;
    block[3] = &unk_10073EB00;
    id v17 = v13;
    uint64_t v18 = v30;
    id v19 = v28;
    dispatch_group_notify(v6, v12, block);
  }
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
}

- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  subcredentialManager = self->_subcredentialManager;
  id v6 = a4;
  objc_msgSend(a3, "pk_setByApplyingBlock:", &stru_100749C48);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(PDAppletSubcredentialManager *)subcredentialManager revokeSubcredentials:v7 withCompletion:v6];
}

- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, BOOL))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    BOOL v11 = [(PDAppletSubcredentialManager *)self->_subcredentialManager addPassShare:v8 onCredentialWithIdentifier:v9];
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[PDPaymentService addPassShare:onCredentialWithIdentifier:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v13, 0xCu);
  }

  BOOL v11 = 0;
  if (v10) {
LABEL_7:
  }
    v10[2](v10, v11);
LABEL_8:
}

- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDAppletSubcredentialManager *)self->_subcredentialManager declineRelatedSharingInvitationsIfNecessary:v6 withCompletion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[PDPaymentService declineRelatedSharingInvitationsIfNecessary:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, BOOL))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    BOOL v11 = [(PDAppletSubcredentialManager *)self->_subcredentialManager removeSharingInvitationReceiptWithIdentifiers:v8 onCredential:v9];
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[PDPaymentService removeSharingInvitationReceiptWithIdentifiers:onCredential:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v13, 0xCu);
  }

  BOOL v11 = 0;
  if (v10) {
LABEL_7:
  }
    v10[2](v10, v11);
LABEL_8:
}

- (void)removeSharingInvitationWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    BOOL v8 = [(PDAppletSubcredentialManager *)self->_subcredentialManager removeSharingInvitationWithIdentifier:v6];
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    BOOL v11 = "-[PDPaymentService removeSharingInvitationWithIdentifier:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
  }

  BOOL v8 = 0;
  if (v7) {
LABEL_7:
  }
    v7[2](v7, v8);
LABEL_8:
}

- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = [(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess];
  if (v8)
  {
    [(PDAppletSubcredentialManager *)self->_subcredentialManager requestBackgroundRegistrationForCredentialWithIdentifier:v6];
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    BOOL v11 = "-[PDPaymentService requestBackgroundRegistrationForCredentialWithIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
  }

  if (v7) {
LABEL_7:
  }
    v7[2](v7, v8);
LABEL_8:
}

- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      [(PDAppletSubcredentialManager *)self->_subcredentialManager canAcceptInvitation:v6 withCompletion:v7];
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        BOOL v11 = "-[PDPaymentService canAcceptInvitation:withCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
      }

      id v9 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v7[2](v7, v9);
    }
  }
}

- (void)credentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = [(PDDatabaseManager *)self->_databaseManager appletSubcredentialWithIdentifier:v6];
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    BOOL v11 = "-[PDPaymentService credentialWithIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
  }

  id v8 = 0;
  if (v7) {
LABEL_7:
  }
    v7[2](v7, v8);
LABEL_8:
}

- (void)passSharesForCredentialIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithCredentialIdentifier:v6];
    [(PDSharingManager *)self->_sharingManager sharesForPassIdentifier:v8 completion:v7];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      BOOL v11 = "-[PDPaymentService passSharesForCredentialIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)sharingInvitationWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, BOOL))a6;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist credentialStateAccess])
  {
    BOOL v14 = [(PDAppletSubcredentialManager *)self->_subcredentialManager sharingInvitationReceiptWasInvalidated:v10 withCredentialIdentifier:v11 error:v12];
    if (v13) {
LABEL_4:
    }
      v13[2](v13, v14);
  }
  else
  {
    unsigned int v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      id v17 = "-[PDPaymentService sharingInvitationWasInvalidated:withCredentialIdentifier:error:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v16, 0xCu);
    }

    BOOL v14 = 0;
    if (v13) {
      goto LABEL_4;
    }
  }
}

- (void)finishedKeyExchangeForCredential:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist credentialStateAccess])
  {
    [(PDAppletSubcredentialManager *)self->_subcredentialManager trackSharedCredential:v6 withCompletion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService finishedKeyExchangeForCredential:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = (void (**)(id, BOOL))a7;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist credentialStateAccess])
  {
    BOOL v17 = [(PDAppletSubcredentialManager *)self->_subcredentialManager didReceiveSharingInvitationWithIdentifier:v12 fromOriginatorIDSHandle:v13 sharingSessionIdentifier:v14 metadata:v15];
    if (v16) {
LABEL_4:
    }
      v16[2](v16, v17);
  }
  else
  {
    uint64_t v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      id v20 = "-[PDPaymentService didReceiveSharingInvitationWithIdentifier:fromOriginatorIDSHandle:sharingSessionIdentifie"
            "r:metadata:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v19, 0xCu);
    }

    BOOL v17 = 0;
    if (v16) {
      goto LABEL_4;
    }
  }
}

- (void)didReceiveSharingInvitationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL))a4;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist credentialStateAccess])
  {
    BOOL v8 = [(PDAppletSubcredentialManager *)self->_subcredentialManager handleSharingInvitationRequest:v6];
    if (v7) {
LABEL_4:
    }
      v7[2](v7, v8);
  }
  else
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[PDPaymentService didReceiveSharingInvitationRequest:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
    }

    BOOL v8 = 0;
    if (v7) {
      goto LABEL_4;
    }
  }
}

- (void)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  int v9 = (void (**)(id, BOOL))a5;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist credentialStateAccess])
  {
    BOOL v10 = [(PDAppletSubcredentialManager *)self->_subcredentialManager didUpdateSharingInvitationWithIdentifier:v8 reason:a4];
    if (v9) {
LABEL_4:
    }
      v9[2](v9, v10);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[PDPaymentService didUpdateSharingInvitationWithIdentifier:reason:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v12, 0xCu);
    }

    BOOL v10 = 0;
    if (v9) {
      goto LABEL_4;
    }
  }
}

- (void)rangingSuspensionReasonForCredential:(id)a3 forPaymentApplicationID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, unint64_t))a5;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist credentialStateAccess])
  {
    unint64_t v11 = [(PDDatabaseManager *)self->_databaseManager rangingSuspensionReasonForAppletSubcredential:v8 forPaymentApplicationID:v9];
    if (v10) {
LABEL_4:
    }
      v10[2](v10, v11);
  }
  else
  {
    int v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      id v14 = "-[PDPaymentService rangingSuspensionReasonForCredential:forPaymentApplicationID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v13, 0xCu);
    }

    unint64_t v11 = 0;
    if (v10) {
      goto LABEL_4;
    }
  }
}

- (void)setPaymentApplicationRangingSuspensionReason:(unint64_t)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  databaseManager = self->_databaseManager;
  id v9 = (void (**)(id, uint64_t))a5;
  BOOL v10 = [(PDDatabaseManager *)databaseManager passWithUniqueIdentifier:a4];
  id v16 = [v10 secureElementPass];

  unint64_t v11 = [v16 devicePrimaryPaymentApplication];
  int v12 = [v11 subcredentials];
  int v13 = [v12 anyObject];

  id v14 = self->_databaseManager;
  id v15 = [v11 applicationIdentifier];
  [(PDDatabaseManager *)v14 updateRangingSuspensionReasons:a3 onCredential:v13 forPaymentApplicationID:v15];

  [(PDPaymentService *)self sendCredential:v13 forPaymentApplication:v11 didUpdateRangingSuspensionReasons:a3];
  v9[2](v9, 1);
}

- (void)pushProvisioningSharingIdentifiers:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPushProvisioningManager *)self->_pushProvisioningManager pushProvisioningSharingIdentifiers:v4];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[PDPaymentService pushProvisioningSharingIdentifiers:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v6, 0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = objc_alloc_init(PDProvisioningSupportDataManager);
    [(PDProvisioningSupportDataManager *)v8 saveWithSupportData:v6 completion:v7];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      unint64_t v11 = "-[PDPaymentService saveProvisioningSupportData:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v7 = objc_alloc_init(PDProvisioningSupportDataManager);
    [(PDProvisioningSupportDataManager *)v7 clearKnownSupportDataOfType:a3];

    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[PDPaymentService clearProvisioningSupportDataOfType:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
  }

  if (v6) {
LABEL_7:
  }
    v6[2](v6);
LABEL_8:
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPushProvisioningManager *)self->_pushProvisioningManager statusForShareableCredentials:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[PDPaymentService statusForShareableCredentials:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, id, void))v7 + 2))(v7, 0, v6, 0);
    }
  }
}

- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPushProvisioningManager *)self->_pushProvisioningManager provideEncryptedPushProvisioningTarget:v8 sharingInstanceIdentifier:v9 withCompletion:v10];
  }
  else
  {
    unint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      int v13 = "-[PDPaymentService provideEncryptedPushProvisioningTarget:sharingInstanceIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v12, 0xCu);
    }

    if (v10) {
      v10[2](v10, 0);
    }
  }
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPushProvisioningManager *)self->_pushProvisioningManager prepareProvisioningTarget:v8 checkFamilyCircle:v6 completion:v9];
  }
  else
  {
    int v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      int v12 = "-[PDPaymentService prepareProvisioningTarget:checkFamilyCircle:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v11, 0xCu);
    }

    if (v9) {
      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    }
  }
}

- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPushProvisioningManager *)self->_pushProvisioningManager redeemPaymentShareableCredential:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[PDPaymentService redeemPaymentShareableCredential:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);
    }
  }
}

- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPushProvisioningManager *)self->_pushProvisioningManager redeemProvisioningSharingIdentifier:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[PDPaymentService redeemProvisioningSharingIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
    }
  }
}

- (void)currentSecureElementSnapshot:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10033757C;
    v6[3] = &unk_100749C70;
    id v7 = v4;
    +[PKProvisioningSEStorageSnapshot getCurrentSnapshot:v6];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v9 = "-[PDPaymentService currentSecureElementSnapshot:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    int v11 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
    id v12 = [objc_alloc((Class)PKProvisioningSEStorageManager) initWithWebService:v11];
    [v12 reserveStorageForAppletTypes:v8 metadata:v9 completion:v10];
  }
  else
  {
    int v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      id v15 = "-[PDPaymentService reserveStorageForAppletTypes:metadata:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v14, 0xCu);
    }

    if (v10) {
      (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    }
  }
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
    id v9 = [objc_alloc((Class)PKProvisioningSEStorageManager) initWithWebService:v8];
    [v9 deleteReservation:v6 completion:v7];
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[PDPaymentService deleteReservation:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v11, 0xCu);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator performDeviceCheckInWithCompletion:v4];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[PDPaymentService performDeviceCheckInWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v6, 0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator setDeviceCheckInContextBuildVersion:v8 outstandingAction:a4 forRegion:v9];
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[PDPaymentService setDeviceCheckInContextBuildVersion:outstandingAction:forRegion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)unscheduleDeviceUpgradeTaskActivity
{
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator unscheduleDeviceUpgradeTaskActivity];
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      int v6 = "-[PDPaymentService unscheduleDeviceUpgradeTaskActivity]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:v3];
  }
  else
  {
    int v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PDPaymentService scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5
{
  id v8 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator setDeviceUpgradeTasksContextBuildVersion:v8 upgradeTaskVersion:a4 retryCount:a5];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService setDeviceUpgradeTasksContextBuildVersion:upgradeTaskVersion:retryCount:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = PDUtilityQueue();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100337ED0;
    v10[3] = &unk_10072E198;
    int v11 = v6;
    id v12 = v7;
    dispatch_async(v8, v10);

    id v9 = v11;
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[PDPaymentService storePassOwnershipToken:withIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }
  }
}

- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (v6)
    {
      id v8 = [objc_alloc((Class)PKPassOwnershipToken) initWithIdentifier:v6];
      id v9 = [v8 ownershipToken];

      if (!v7)
      {
LABEL_5:

        goto LABEL_10;
      }
    }
    else
    {
      id v9 = 0;
      if (!v7) {
        goto LABEL_5;
      }
    }
    v7[2](v7, v9);
    goto LABEL_5;
  }
  int v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[PDPaymentService passOwnershipTokenWithIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v11, 0xCu);
  }

  if (v7) {
    v7[2](v7, 0);
  }
LABEL_10:
}

- (void)updateAllMapsBrandAndMerchantDataWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    v34 = v4;
    int v5 = objc_alloc_init((Class)NSMutableSet);
    v35 = self;
    [(PDDatabaseManager *)self->_databaseManager mapsMerchants];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v42;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(obj);
          }
          int v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          int v11 = (const char *)[v10 identifier];
          if (v11)
          {
            id v12 = v11;
            id v13 = [v10 resultProviderIdentifier];
            [v10 locationLatitude];
            CLLocationDegrees v15 = v14;
            [v10 locationLongitude];
            CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v15, v16);
            uint64_t v18 = -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]([PDMapsBrandAndMerchantUpdaterConfiguration alloc], "initWithMUID:resultProviderID:coordinate:", v12, v13, v17.latitude, v17.longitude);
            [v5 addObject:v18];
            int v19 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              v47 = v12;
              __int16 v48 = 2048;
              uint64_t v49 = (int)v13;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating maps merchant mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld ", buf, 0x16u);
            }
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v7);
    }
    id v20 = [(PDDatabaseManager *)v35->_databaseManager mapsBrands];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
          long long v26 = (const char *)[v25 identifier];
          if (v26)
          {
            long long v27 = v26;
            id v28 = [v25 resultProviderIdentifier];
            CLLocationCoordinate2D v29 = CLLocationCoordinate2DMake(0.0, 0.0);
            id v30 = -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]([PDMapsBrandAndMerchantUpdaterConfiguration alloc], "initWithMUID:resultProviderID:coordinate:", v27, v28, v29.latitude, v29.longitude);
            [v5 addObject:v30];
            id v31 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              v47 = v27;
              __int16 v48 = 2048;
              uint64_t v49 = (int)v28;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Updating maps brand mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld ", buf, 0x16u);
            }
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v22);
    }
    if ([v5 count])
    {
      mapsBrandAndMerchantUpdater = v35->_mapsBrandAndMerchantUpdater;
      id v33 = [v5 copy];
      [(PDMapsBrandAndMerchantUpdater *)mapsBrandAndMerchantUpdater updateMapsDataForConfigurations:v33];
    }
    id v4 = v34;
    if (v34) {
      v34[2](v34);
    }
  }
  else
  {
    int v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[PDPaymentService updateAllMapsBrandAndMerchantDataWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }
  }
}

- (void)mapsMerchantWithIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v8 = (void (**)(id, void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v9 = -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]([PDMapsBrandAndMerchantUpdaterConfiguration alloc], "initWithMUID:resultProviderID:coordinate:", a3, v5, kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude);
    int v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218240;
      id v13 = (const char *)a3;
      __int16 v14 = 2048;
      uint64_t v15 = (int)v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating maps merchant mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld ", (uint8_t *)&v12, 0x16u);
    }

    [(PDMapsBrandAndMerchantUpdater *)self->_mapsBrandAndMerchantUpdater updateMapsDataForConfiguration:v9 completion:v8];
  }
  else
  {
    int v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[PDPaymentService mapsMerchantWithIdentifier:resultProviderIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v12, 0xCu);
    }

    if (v8) {
      v8[2](v8, 0);
    }
  }
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    uint64_t v5 = PDDefaultQueue();
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100338818;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else if (v4)
  {
    id v6 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1, v6);
  }
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    uint64_t v5 = PDDefaultQueue();
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1003389EC;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else if (v4)
  {
    id v6 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1, v6);
  }
}

- (void)requiresUpgradedPasscodeWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    uint64_t v5 = PDDefaultQueue();
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100338C70;
    v8[3] = &unk_10072FDC8;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v5, v8);
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v11 = "-[PDPaymentService requiresUpgradedPasscodeWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v4)
    {
      id v7 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
    }
  }
}

- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    int v11 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100338F74;
    v14[3] = &unk_100730578;
    void v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, v14);
  }
  else
  {
    int v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v19 = "-[PDPaymentService changePasscodeFrom:toPasscode:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10)
    {
      id v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }
}

- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      id v8 = PDDefaultQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003391CC;
      block[3] = &unk_10072E9D8;
      void block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async(v8, block);
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v14 = "-[PDPaymentService transactionReceiptWithUniqueID:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)storeTransactionReceiptData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003393D4;
    block[3] = &unk_10072E9D8;
    id v11 = v6;
    id v12 = self;
    id v13 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[PDPaymentService storeTransactionReceiptData:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)deleteTransactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033970C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[PDPaymentService deleteTransactionReceiptWithUniqueID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v10 = PDDefaultQueue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100339908;
    v12[3] = &unk_100730238;
    v12[4] = self;
    id v13 = v8;
    BOOL v15 = a4;
    id v14 = v9;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[PDPaymentService transactionReceiptForTransactionWithIdentifier:updateIfNecessary:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100339C7C;
    block[3] = &unk_100731830;
    id v12 = v7;
    void block[4] = self;
    id v11 = v6;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[PDPaymentService transactionTagsForTransactionWithIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v11 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100339ED8;
    v14[3] = &unk_100730578;
    void v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, v14);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v19 = "-[PDPaymentService registerAuxiliaryCapabilityForPassUniqueIdentifier:sessionExchangeToken:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10)
    {
      id v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)checkAllAuxiliaryRegistrationRequirements
{
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    BOOL v3 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033A0CC;
    block[3] = &unk_10072E1E8;
    void block[4] = self;
    dispatch_async(v3, block);
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = "-[PDPaymentService checkAllAuxiliaryRegistrationRequirements]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }
  }
}

- (void)invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033A264;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[PDPaymentService invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v11 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10033A47C;
    v14[3] = &unk_100730578;
    void v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, v14);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v19 = "-[PDPaymentService fetchBarcodesForPassUniqueIdentifier:sessionExchangeToken:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10)
    {
      id v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v14 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033A750;
    block[3] = &unk_100731F38;
    void block[4] = self;
    id v18 = v10;
    id v19 = v11;
    id v20 = v12;
    id v21 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[PDPaymentService retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:authorization:sessionExchangeTo"
            "ken:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v13)
    {
      id v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v16);
    }
  }
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v11 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10033AA08;
    v14[3] = &unk_100730578;
    void v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, v14);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PDPaymentService retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:authorization:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10)
    {
      id v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v13);
    }
  }
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033AC64;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[PDPaymentService retrievePINEncryptionCertificateForPassUniqueIdentifier:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v11 = PDDefaultQueue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10033AE50;
    v13[3] = &unk_100730578;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v11, v13);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[PDPaymentService retrievePINEncryptionCertificateForPassUniqueIdentifier:sessionExchangeToken:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v10 = PDDefaultQueue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10033B024;
    v12[3] = &unk_100731AD8;
    v12[4] = self;
    unint64_t v15 = a3;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[PDPaymentService processedAuthenticationMechanism:forTransactionIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033B1E4;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[PDPaymentService markAuthenticationCompleteForTransactionIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v10 = PDDefaultQueue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10033B3E4;
    v13[3] = &unk_100730238;
    v13[4] = self;
    BOOL v16 = a3;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v10, v13);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[PDPaymentService submitUserConfirmation:forTransactionIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v9)
    {
      id v12 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
    }
  }
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v13 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033B69C;
    block[3] = &unk_100732C18;
    void block[4] = self;
    BOOL v20 = a3;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[PDPaymentService submitUserConfirmation:forTransactionIdentifier:sessionExchangeToken:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v12)
    {
      id v15 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v15);
    }
  }
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v11 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10033B950;
    v14[3] = &unk_100730578;
    void v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, v14);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PDPaymentService submitEncryptedPIN:forTransactionIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10)
    {
      id v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v14 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033BC20;
    block[3] = &unk_100731F38;
    void block[4] = self;
    id v18 = v10;
    id v19 = v11;
    id v20 = v12;
    id v21 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[PDPaymentService submitEncryptedPIN:forTransactionIdentifier:sessionExchangeToken:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v13)
    {
      id v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v16);
    }
  }
}

- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v11 = PDDefaultQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10033BED0;
    v14[3] = &unk_100730578;
    void v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, v14);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PDPaymentService submitTransactionSignatureForTransactionIdentifier:sessionExchangeToken:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10)
    {
      id v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v11 = PDDefaultQueue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10033C14C;
    v13[3] = &unk_100730578;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v11, v13);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[PDPaymentService submitBarcodePaymentEvent:forPassUniqueIdentifier:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10) {
      v10[2](v10);
    }
  }
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v14 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033C354;
    block[3] = &unk_100731F38;
    void block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[PDPaymentService submitBarcodePaymentEvent:forPassUniqueIdentifier:sessionExchangeToken:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v13) {
      v13[2](v13);
    }
  }
}

- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4
{
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    uint64_t v5 = [(PDPaymentService *)self remoteObjectProxy];
    [v5 paymentDeviceDidEnterFieldWithProperties:v6];
  }
}

- (void)fieldDetectorManagerDidExitField:(id)a3
{
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v4 = [(PDPaymentService *)self remoteObjectProxy];
    [v4 paymentDeviceDidExitField];
  }
}

- (void)memberTypeForCurrentUserWithCompletion:(id)a3
{
  uint64_t v5 = (void (**)(id, uint64_t))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDFamilyCircleManager *)self->_familyMemberManager memberTypeForCurrentUserWithCachePolicy:0 completion:v5];
  }
  else if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    v5[2](v5, -1);
  }
}

- (void)pendingFamilyMembersIgnoringCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDFamilyCircleManager *)self->_familyMemberManager pendingFamilyMembersWithCachePolicy:v4 completion:v7];
  }
  else if (v7)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    v7[2](v7, 0);
  }
}

- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDFamilyCircleManager *)self->_familyMemberManager photosForFamilyMembersWithDSIDs:v7 completion:v8];
  }
  else if (v8)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    v8[2](v8, 0);
  }
}

- (void)prepareIdentityProvisioningForTargetDeviceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (a3)
    {
      id v7 = objc_alloc_init(off_100806BC8());
      id v8 = [v7 watchPaymentWebService];
      uint64_t v9 = [v8 targetDevice];
      if (!v9)
      {
        id v18 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No target device found while preparing for identity provisioning", buf, 2u);
        }

        id v17 = +[NSError errorWithDomain:PKIdentityProvisioningErrorDomain code:5 userInfo:0];
        v6[2](v6, v17);
        id v12 = 0;
        goto LABEL_13;
      }
      id v10 = (void *)v9;
    }
    else
    {
      id v8 = 0;
      id v10 = 0;
    }
    id v7 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10033CA18;
    v25[3] = &unk_100733E60;
    id v13 = v8;
    id v26 = v13;
    id v14 = v10;
    id v27 = v14;
    id v28 = self;
    [v7 addOperation:v25];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10033CD98;
    v21[3] = &unk_100733E60;
    id v12 = v14;
    id v22 = v12;
    id v8 = v13;
    id v23 = v8;
    long long v24 = self;
    [v7 addOperation:v21];
    id v15 = +[NSNull null];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10033D054;
    v19[3] = &unk_100734688;
    id v20 = v6;
    id v16 = [v7 evaluateWithInput:v15 completion:v19];

    id v17 = v26;
LABEL_13:

    goto LABEL_14;
  }
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v30 = "-[PDPaymentService prepareIdentityProvisioningForTargetDeviceIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
  }

  id v12 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
  v6[2](v6, v12);
LABEL_14:
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 completion:(id)a7
{
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = (char *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (v19) {
      id v20 = 0;
    }
    else {
      id v20 = (void *)PDOSTransactionCreate("PDPaymentService");
    }
    id v22 = PKLogFacilityTypeGetObject();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v23)
      {
        *(_DWORD *)buf = 138412290;
        v46 = v15;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Provisioning identity pass for target %@", buf, 0xCu);
      }

      id v24 = objc_alloc_init(off_100806BC8());
      if (objc_opt_respondsToSelector())
      {
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10033D64C;
        v41[3] = &unk_1007446D0;
        id v44 = v19;
        id v24 = v24;
        id v42 = v24;
        id v43 = v16;
        [v24 provisionIdentityPassWithPassMetadata:v14 targetDeviceIdentifier:v15 credentialIdentifier:v43 attestations:v17 supplementalData:v18 completion:v41];

        id v25 = v44;
      }
      else
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v15;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Provisioning method not implemented for target %@", buf, 0xCu);
        }

        id v25 = +[NSError errorWithDomain:PKIdentityProvisioningErrorDomain code:4 userInfo:0];
        (*((void (**)(id, void, id))v19 + 2))(v19, 0, v25);
      }
    }
    else
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Provisioning identity pass to current device", buf, 2u);
      }

      id v35 = v16;
      id v36 = v14;
      id v24 = [objc_alloc((Class)PKPaymentIdentityCredential) initWithShareablePassMetadata:v14 isoCredentialIdentifier:v16];
      [v24 setAttestations:v17];
      if (v18)
      {
        id v26 = +[PKIdentityProvisioningSupplementalData createWithData:v18];
        id v27 = [v26 passTypeIdentifier];
        [v24 setPassTypeIdentifier:v27];

        id v28 = [v26 passSerialNumber];
        [v24 setPassSerialNumber:v28];

        CLLocationCoordinate2D v29 = [v26 accountKeyIdentifier];
        [v24 setAccountKeyIdentifier:v29];
      }
      id v30 = objc_alloc((Class)PKPaymentProvisioningController);
      id v31 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
      id v25 = [v30 initWithWebService:v31 localPaymentService:0];

      [v25 setCloudStoreCoordinator:self->_cloudStoreNotificationCoordinator];
      id v32 = [objc_alloc((Class)PKProvisioningContext) initWithEnvironment:0 provisioningController:v25 groupsController:0];
      [v32 setIsBackground:1];
      id v33 = [objc_alloc((Class)PKProvisioningBackgroundCoordinator) initWithSetupContext:v32 credential:v24 previouslyAcceptedTerms:1];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10033DD38;
      v37[3] = &unk_100749D38;
      id v40 = v19;
      id v38 = v33;
      id v39 = v20;
      id v34 = v33;
      [v34 startWithCompletion:v37];

      id v16 = v35;
      id v14 = v36;
    }
  }
  else
  {
    id v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[PDPaymentService provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentifier:attesta"
            "tions:supplementalData:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    id v20 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v20);
  }
}

- (void)queueIdentityPassProvisioningWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 supplementalData:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v17 = [objc_alloc((Class)PKPendingIdentityCredential) initWithShareableMetadata:v12];
    [v17 setCredentialIdentifier:v14];
    [v17 setShouldAutoProvision:1];
    if (v15)
    {
      id v18 = +[PKIdentityProvisioningSupplementalData createWithData:v15];
      id v19 = [v18 passTypeIdentifier];
      [v17 setPassTypeIdentifier:v19];

      id v20 = [v18 passSerialNumber];
      [v17 setPassSerialNumber:v20];

      id v21 = [v18 accountKeyIdentifier];
      [v17 setAccountKeyIdentifier:v21];
    }
    if (v13)
    {
      id v22 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
      BOOL v23 = [v22 targetDevice];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10033E120;
      v25[3] = &unk_100749D88;
      id v31 = v16;
      void v25[4] = self;
      id v26 = v12;
      id v27 = v13;
      id v28 = v14;
      id v29 = v15;
      id v17 = v17;
      id v30 = v17;
      [v23 generateIdentityProvisioningAttestationsWithISOCredential:v28 pairingID:v27 completion:v25];
    }
    else
    {
      [(PDPendingProvisioningManager *)self->_pendingProvisioningManager storePendingProvisioning:v17];
      (*((void (**)(id, void))v16 + 2))(v16, 0);
    }
  }
  else
  {
    id v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v33 = "-[PDPaymentService queueIdentityPassProvisioningWithPassMetadata:targetDeviceIdentifier:credentialIdentifier"
            ":supplementalData:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    id v17 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    (*((void (**)(id, id))v16 + 2))(v16, v17);
  }
}

- (void)updateNotificationForProductIdentifier:(id)a3 configuration:(id)a4 localizedNotificationTitle:(id)a5 localizedNotificationMessage:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v35 = 0x3032000000;
      id v36 = sub_100020B8C;
      long long v37 = sub_1000210B8;
      id v38 = 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10033E8B8;
      v28[3] = &unk_100749DB0;
      id v29 = v14;
      id v30 = v15;
      id v31 = self;
      id v17 = v16;
      id v32 = v17;
      p_long long buf = &buf;
      id v18 = objc_retainBlock(v28);
      id v19 = v18;
      if (v12)
      {
        ((void (*)(void *, id))v18[2])(v18, v12);
      }
      else
      {
        id v22 = objc_alloc_init((Class)PKPaymentAvailableProductsRequest);
        [v22 addDiagnosticReason:@"Remote Notification Update"];
        BOOL v23 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator paymentSetupFeaturesCoordinator];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10033E9EC;
        v24[3] = &unk_100749DD8;
        id v25 = v13;
        id v26 = v17;
        id v27 = v19;
        [v23 productsWithRequest:v22 completion:v24];
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      id v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[PDPaymentService updateNotificationForProductIdentifier:configuration:localize"
                                        "dNotificationTitle:localizedNotificationMessage:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&buf, 0xCu);
      }

      id v21 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      (*((void (**)(id, void *))v16 + 2))(v16, v21);
    }
  }
}

- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDPaymentService *)self remoteObjectProxy];
  [v8 didReceiveDeviceSharingCapabilities:v7 forHandle:v6];
}

- (void)processSharingCLICommands:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033EF34;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    (*((void (**)(id, const __CFString *))v7 + 2))(v7, @"Client not entitled");
  }
}

- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess] & 1) != 0)
    {
      [(PDSharingManager *)self->_sharingManager checkInvitationStatusForMailboxAddress:v7 completion:v6];
    }
    else
    {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
  }
}

- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess] & 1) != 0)
    {
      [(PDSharingManager *)self->_sharingManager retrieveShareInvitationForMailboxAddress:v7 completion:v6];
    }
    else
    {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
  }
}

- (void)relinquishInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || ([(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess] & 1) != 0)
  {
    [(PDSharingManager *)self->_sharingManager relinquishInvitation:v6 completion:v7];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService relinquishInvitation:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
      [(PDSharingManager *)self->_sharingManager prewarmCreateShareForPassIdentifier:v7 completion:v6];
    }
    else {
      v6[2](v6, 0);
    }
  }
}

- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
      [(PDSharingManager *)self->_sharingManager createShareForPartialShareInvitation:v10 authorization:v8 completion:v9];
    }
    else {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
      [(PDSharingManager *)self->_sharingManager createShareInvitationForPartialShareInvitation:v13 existingTransportIdentifier:v10 authorization:v11 completion:v12];
    }
    else {
      (*((void (**)(id, void, void, void))v12 + 2))(v12, 0, 0, 0);
    }
  }
}

- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess] & 1) != 0)
    {
      [(PDSharingManager *)self->_sharingManager acceptCarKeyShareForMessage:v10 activationCode:v8 completion:v9];
    }
    else
    {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess])
  {
    [(PDSharingManager *)self->_sharingManager cacheSharingMessageFromMailboxAddress:v7 message:v6];
  }
}

- (void)deleteSharingMessage:(id)a3
{
  id v4 = a3;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess])
  {
    [(PDSharingManager *)self->_sharingManager deleteSharingMessage:v4];
  }
}

- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (v8)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess] & 1) != 0)
    {
      [(PDSharingManager *)self->_sharingManager createSingleUseShareURLWithMessage:v9 timeToLive:a4 completion:v8];
    }
    else
    {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
}

- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
      [(PDSharingManager *)self->_sharingManager updateShareForPassIdentifier:v13 share:v10 authorization:v11 completion:v12];
    }
    else {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    }
  }
}

- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
      [(PDSharingManager *)self->_sharingManager revokeShareForPassIdentifier:v12 share:v10 shouldCascade:v7 completion:v11];
    }
    else {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
  }
}

- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
      [(PDSharingManager *)self->_sharingManager revokeSharesForPassIdentifier:v12 shares:v10 shouldCascade:v7 completion:v11];
    }
    else {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
  }
}

- (void)rejectShareForMailboxAddress:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
    [(PDSharingManager *)self->_sharingManager rejectShareForMailboxAddress:v4];
  }
}

- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist credentialStateAccess] & 1) != 0)
    {
      sharingManager = self->_sharingManager;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10033FB0C;
      v13[3] = &unk_10072E570;
      id v14 = v10;
      [(PDSharingManager *)sharingManager sendSharingMessageTo:v8 message:v9 completion:v13];
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        id v16 = "-[PDPaymentService sendSharingMessageTo:message:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  if (v9)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist credentialStateAccess] & 1) != 0)
    {
      [(PDSharingManager *)self->_sharingManager didReceiveActivationCodeFailureForCredentialIdentifier:v8 attemptsRemaining:a4 completion:v9];
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        id v12 = "-[PDPaymentService didReceiveActivationCodeFailureForCredentialIdentifier:attemptsRemaining:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v11, 0xCu);
      }

      v9[2](v9, 0);
    }
  }
}

- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  if (v7)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist credentialStateAccess] & 1) != 0)
    {
      [(PDSharingManager *)self->_sharingManager pendingShareActivationForShareIdentifier:v6 completion:v7];
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        id v10 = "-[PDPaymentService pendingShareActivationForShareIdentifier:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v9, 0xCu);
      }

      v7[2](v7, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 entitlementsForPassIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, NSObject *))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    int v9 = [(PDSharingManager *)self->_sharingManager entitlementsForPassIdentifier:v7];
    v8[2](v8, v9);
  }
  else
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService usingSynchronousProxy:entitlementsForPassIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
      [(PDSharingManager *)self->_sharingManager displayableEntitlementsForPassIdentifier:v7 completion:v6];
    }
    else {
      v6[2](v6, 0);
    }
  }
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
      [(PDSharingManager *)self->_sharingManager displayableSharesForPassIdentifier:v7 completion:v6];
    }
    else {
      v6[2](v6, 0);
    }
  }
}

- (void)hasSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]) {
      BOOL v7 = [(PDSharingManager *)self->_sharingManager hasSharesForPassIdentifier:v8];
    }
    else {
      BOOL v7 = 0;
    }
    v6[2](v6, v7);
  }
}

- (void)sharingCapabilitiesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, BOOL, BOOL))a4;
  if (v6)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist sharingAllAccess] & 1) != 0)
    {
      v6[2](v6, [(PDSharingManager *)self->_sharingManager hasSharesForPassIdentifier:v7], [(PDSharingManager *)self->_sharingManager hasShareableEntitlementsForPassIdentifier:v7]);
    }
    else
    {
      v6[2](v6, 0, 0);
    }
  }
}

- (void)hasActiveExternallySharedPasses:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
      || ([(PKEntitlementWhitelist *)self->_whitelist passesEntangledAccess] & 1) != 0)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v16 = 0x2020000000;
      char v17 = 0;
      id v5 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100340424;
      v14[3] = &unk_10072E610;
      void v14[4] = self;
      void v14[5] = &buf;
      [v5 addOperation:v14];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100340558;
      v13[3] = &unk_100730D50;
      void v13[4] = self;
      void v13[5] = &buf;
      [v5 addOperation:v13];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100340A3C;
      v12[3] = &unk_100730D50;
      v12[4] = self;
      void v12[5] = &buf;
      [v5 addOperation:v12];
      id v6 = +[NSNull null];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100340C5C;
      v9[3] = &unk_10072E660;
      id v10 = v4;
      p_long long buf = &buf;
      id v7 = [v5 evaluateWithInput:v6 completion:v9];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[PDPaymentService hasActiveExternallySharedPasses:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", (uint8_t *)&buf, 0xCu);
      }

      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

- (void)addPendingProvisioning:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPendingProvisioningManager *)self->_pendingProvisioningManager storePendingProvisioning:v4];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[PDPaymentService addPendingProvisioning:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          -[PDPendingProvisioningManager storePendingProvisioning:](self->_pendingProvisioningManager, "storePendingProvisioning:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), (void)v14);
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    v7[2](v7, 0);
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v20 = "-[PDPaymentService addPendingProvisionings:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }
  }
}

- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100341090;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v14 = "-[PDPaymentService retrievePendingProvisioningsWithType:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v11 = PDDefaultQueue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1003412FC;
    v13[3] = &unk_100731F10;
    id v16 = v10;
    void v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v13);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v18 = "-[PDPaymentService retrievePendingProvisioningOfType:withUniqueIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v11 = PDDefaultQueue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100341518;
    v13[3] = &unk_100731F10;
    id v16 = v10;
    void v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v13);
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v18 = "-[PDPaymentService removePendingProvisioningOfType:withUniqueIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)vpanVirtualCards:(id)a3
{
  id v5 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10034168C;
    v8[3] = &unk_100749E20;
    void v8[4] = self;
    id v9 = v5;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator paymentHardwareStatusWithType:1 completion:v8];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v5) {
      (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    }
  }
}

- (void)_vpanVirtualCards:(id)a3
{
  id v32 = (void (**)(id, id, void))a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = [(PDDatabaseManager *)self->_databaseManager passesWithActiveVPAN];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v6)
  {
    id v7 = v6;
    id v34 = v5;
    uint64_t v35 = *(void *)v45;
    id v33 = v4;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v8);
        id v10 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
        [v9 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v10];

        cardFileManager = self->_cardFileManager;
        id v12 = [v9 uniqueID];
        id v13 = [(PDCardFileManager *)cardFileManager dataAccessorForObjectWithUniqueID:v12];
        [v9 setDataAccessor:v13];

        id v14 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
        id v15 = +[PKVirtualCard cardsForPaymentPass:v9 accordingToWebService:v14];

        if (![v15 count] || !objc_msgSend(v9, "hasAssociatedPeerPaymentAccount")) {
          goto LABEL_20;
        }
        id v16 = [(PDDatabaseManager *)self->_databaseManager peerPaymentAccount];
        long long v17 = (char *)[v16 state];
        if (_os_feature_enabled_impl() && (unint64_t)(v17 - 1) <= 1)
        {
          id v18 = +[PKAppProtectionCoordinator shared];
          unsigned __int8 v19 = [v18 isEffectivelyLocked];

          if ((v19 & 1) == 0)
          {
            id v20 = [v16 currentBalance];
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v21 = v15;
            id v22 = [v21 countByEnumeratingWithState:&v40 objects:v49 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v41;
              do
              {
                for (i = 0; i != v23; i = (char *)i + 1)
                {
                  if (*(void *)v41 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  [*(id *)(*((void *)&v40 + 1) + 8 * i) setBalance:v20];
                }
                id v23 = [v21 countByEnumeratingWithState:&v40 objects:v49 count:16];
              }
              while (v23);
            }

            id v5 = v34;
            id v4 = v33;
          }

LABEL_20:
          [v4 unionSet:v15];
          goto LABEL_21;
        }

LABEL_21:
        id v8 = (char *)v8 + 1;
      }
      while (v8 != v7);
      id v26 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
      id v7 = v26;
    }
    while (v26);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v27 = v4;
  id v28 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v37;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(v27);
        }
        [(PDDatabaseManager *)self->_databaseManager updateVirtualCardWithMetadata:*(void *)(*((void *)&v36 + 1) + 8 * (void)j)];
      }
      id v29 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v29);
  }

  v32[2](v32, v27, 0);
}

- (void)regenerateVPANCardCredentialsForVPANID:(id)a3 authorization:(id)a4 completion:(id)a5
{
}

- (void)vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 completion:(id)a6
{
}

- (void)vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 regenerate:(BOOL)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100341D44;
    v19[3] = &unk_100749E48;
    void v19[4] = self;
    id v20 = v13;
    id v21 = v14;
    id v22 = v15;
    BOOL v24 = a6;
    id v23 = v16;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator paymentHardwareStatusWithType:1 completion:v19];
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v16) {
      (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    }
  }
}

- (void)_vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 regenerate:(BOOL)a6 hasRefreshedBAACertificate:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = [(PDDatabaseManager *)self->_databaseManager passWithVPANIdentifier:v14];
  if (v18)
  {
    unsigned __int8 v19 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v20 = [v19 BOOLForKey:@"PKHasEverDoneVPAN"];

    if (v20)
    {
      paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1003422A0;
      v28[3] = &unk_100749F10;
      id v29 = v18;
      id v34 = v17;
      id v30 = v15;
      id v31 = self;
      id v32 = v14;
      id v33 = v16;
      BOOL v35 = a6;
      BOOL v36 = a7;
      [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v28];

      id v22 = v29;
    }
    else
    {
      id v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "First time doing VPAN: Refreshing BAA context", buf, 2u);
      }

      id v26 = dispatch_get_global_queue(0, 0);
      long long v37 = _NSConcreteStackBlock;
      uint64_t v38 = 3221225472;
      long long v39 = sub_100342218;
      long long v40 = &unk_100748158;
      long long v41 = self;
      id v42 = v14;
      id v43 = v15;
      id v44 = v16;
      BOOL v46 = a6;
      BOOL v47 = a7;
      id v45 = v17;
      PKForceRefreshBAACertificateAndKey();

      id v27 = +[NSUserDefaults standardUserDefaults];
      [v27 setBool:1 forKey:@"PKHasEverDoneVPAN"];

      id v22 = v42;
    }
  }
  else
  {
    id v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v49 = v14;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No pass found with VPANID: %@", buf, 0xCu);
    }

    BOOL v24 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v24);
  }
}

- (void)paymentPassForVPANID:(id)a3 andLoadImages:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(id, void *))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (v10)
    {
      id v11 = [(PDDatabaseManager *)self->_databaseManager passWithVPANIdentifier:v9];
      id v12 = [v11 paymentPass];

      if (v12) {
        BOOL v13 = !v6;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
        v10[2](v10, v12);
      }
      else
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100342E48;
        v15[3] = &unk_10072E598;
        id v17 = v10;
        id v16 = v12;
        [v16 loadImageSetAsync:0 preheat:1 withCompletion:v15];
      }
    }
  }
  else
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v10) {
      v10[2](v10, 0);
    }
  }
}

- (void)updateDateLastUsedBySafari:(id)a3 forVirtualCardWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (v11)
    {
      [(PDDatabaseManager *)self->_databaseManager updateDateLastUsedBySafari:v9 forVirtualCardWithIdentifier:v10];
LABEL_7:
      v11[2](v11, 0);
    }
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v11) {
      goto LABEL_7;
    }
  }
}

- (void)updateCardholderNameFromSafari:(id)a3 forVirtualCardWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (v11)
    {
      [(PDDatabaseManager *)self->_databaseManager updateCardholderNameFromSafari:v9 forVirtualCardWithIdentifier:v10];
LABEL_7:
      v11[2](v11, 0);
    }
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v11) {
      goto LABEL_7;
    }
  }
}

- (void)paymentOffersCatalogWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    BOOL v6 = [(PDPaymentOffersManager *)self->_paymentOffersManager paymentOfferCatalog];
    v5[2](v5, v6);
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v5) {
      v5[2](v5, 0);
    }
  }
}

- (void)updatePaymentOffersCatalogWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentOffersManager *)self->_paymentOffersManager updatePaymentOffersCatalogWithCompletion:v5];
  }
  else
  {
    BOOL v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v5)
    {
      id v7 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v5[2](v5, 0, v7);
    }
  }
}

- (void)removePaymentOffersCatalog
{
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    paymentOffersManager = self->_paymentOffersManager;
    [(PDPaymentOffersManager *)paymentOffersManager removePaymentOffersCatalog];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }
  }
}

- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentOffersManager *)self->_paymentOffersManager issuerInstallmentTransactionsForPassUniqueID:v7 completion:v8];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v8)
    {
      id v10 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v8[2](v8, 0, v10);
    }
  }
}

- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentOffersManager *)self->_paymentOffersManager issuerInstallmentTransactionsForTransactionSourceIdentifiers:v9 paymentHashes:v10 completion:v11];
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v11)
    {
      BOOL v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v11[2](v11, 0, v13);
    }
  }
}

- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentOffersManager *)self->_paymentOffersManager deleteIssuerInstallmentTransactionsForPassUniqueID:v7 completion:v8];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v8)
    {
      id v10 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v8[2](v8, v10);
    }
  }
}

- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentOffersManager *)self->_paymentOffersManager paymentRewardsRedemptionsForPassUniqueIdentifier:v9 paymentHashes:v10 completion:v11];
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v11)
    {
      BOOL v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v11[2](v11, 0, v13);
    }
  }
}

- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentOffersManager *)self->_paymentOffersManager updatePaymentRewardsBalancesWithPassUniqueIdentifier:v7 completion:v8];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v8)
    {
      id v10 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v8[2](v8, 0, v10);
    }
  }
}

- (void)paymentRewardsBalanceWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      id v9 = [(PDPaymentOffersManager *)self->_paymentOffersManager paymentRewardsBalanceWithIdentifier:v7];
      v8[2](v8, v9);
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100517200(a2);
      }

      v8[2](v8, 0);
    }
  }
}

- (void)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      id v9 = [(PDPaymentOffersManager *)self->_paymentOffersManager paymentRewardsBalancesWithPassUniqueIdentifier:v7];
      v8[2](v8, v9);
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100517200(a2);
      }

      v8[2](v8, 0);
    }
  }
}

- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(id, void, void *))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDPaymentOffersManager *)self->_paymentOffersManager updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:v9 limit:a4 completion:v10];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v10)
    {
      id v12 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
      v10[2](v10, 0, v12);
    }
  }
}

- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      id v11 = [(PDPaymentOffersManager *)self->_paymentOffersManager paymentRewardsRedemptionsForPassUniqueIdentifier:v9 limit:a4];
      v10[2](v10, v11);
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100517200(a2);
      }

      v10[2](v10, 0);
    }
  }
}

- (void)paymentRewardsRedemptionForPaymentHash:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      id v9 = [(PDDatabaseManager *)self->_databaseManager paymentRewardsRedemptionWithPaymentHash:v7];
      v8[2](v8, v9);
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100517200(a2);
      }

      v8[2](v8, 0);
    }
  }
}

- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a5;
  if (v11)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      [(PDPaymentOffersManager *)self->_paymentOffersManager insertOrUpdatePaymentRewardsRedemption:v9 withPassUniqueIdentifier:v10];
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100517200(a2);
      }
    }
    v11[2](v11);
  }
}

- (void)deletePaymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  if (v8)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
    {
      [(PDDatabaseManager *)self->_databaseManager deletePaymentRewardsRedemptionsForPassUniqueIdentifier:v7];
      [(PDDatabaseManager *)self->_databaseManager deletePassEndpointMetadataForPassUniqueID:v7 type:2];
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100517200(a2);
      }
    }
    v8[2](v8);
  }
}

- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5
{
}

- (void)generateUnderlyingKeyReportWithCompletion:(id)a3
{
  id v5 = (void (**)(id, id))a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    if (v5)
    {
      BOOL v6 = [(PDDatabaseManager *)self->_databaseManager passesOfType:-1];
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v29;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            id v15 = [v14 fidoProfile];
            if (v15)
            {
              id v16 = [v14 uniqueID];
              [v7 setObject:v16 forKey:v15];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v11);
      }

      id v17 = [v7 allKeys];
      secureElement = self->_secureElement;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100344014;
      v24[3] = &unk_100749F38;
      id v25 = v17;
      id v26 = v8;
      id v27 = v7;
      id v19 = v7;
      id v20 = v8;
      id v21 = v17;
      [(PKSecureElement *)secureElement checkMultipleFidoKeyPresenceForFIDOProfiles:v21 completion:v24];
      id v22 = [v20 copy];
      v5[2](v5, v22);
    }
  }
  else
  {
    id v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    if (v5) {
      v5[2](v5, 0);
    }
  }
}

- (void)simulateEnableBiometricsForPass:(id)a3
{
  id v6 = a3;
  uint64_t has_internal_ui = os_variant_has_internal_ui();
  id v5 = v6;
  if (v6 && has_internal_ui)
  {
    sub_100209D68((uint64_t)self->_remoteInterfacePresenter, v6);
    id v5 = v6;
  }
  _objc_release_x1(has_internal_ui, v5);
}

- (void)simulateDeviceAccessory
{
  if (os_variant_has_internal_ui())
  {
    remoteInterfacePresenter = self->_remoteInterfacePresenter;
    sub_1002067CC((uint64_t)remoteInterfacePresenter);
  }
}

- (void)setNFCPayloadState:(unint64_t)a3 forPass:(id)a4
{
  id v8 = a4;
  if (os_variant_has_internal_ui())
  {
    issuerBindingManager = self->_issuerBindingManager;
    id v7 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v8];
    [(PDIssuerBindingManager *)issuerBindingManager updateNFCPayloadState:a3 forPass:v7];
  }
}

- (void)simulateSecureEvent:(id)a3
{
  id v3 = a3;
  int has_internal_ui = os_variant_has_internal_ui();
  if (v3 && has_internal_ui)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10034438C;
    v6[3] = &unk_100749F60;
    id empty = xpc_dictionary_create_empty();
    id v5 = empty;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
    PDNFSecureXPCSimulateSecureEvent(v5);
  }
}

- (void)sendPassWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v7 = [(PDPaymentService *)self remoteObjectProxy];
    [v7 passWithUniqueIdentifier:v8 didReceiveValueAddedServiceTransaction:v6];
  }
}

- (void)sendDidUpdateApplicationMessages:(id)a3
{
  id v5 = a3;
  if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v4 = [(PDPaymentService *)self remoteObjectProxy];
    [v4 didUpdateApplicationMessages:v5];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v7 = [(PDPaymentService *)self remoteObjectProxy];
    [v7 paymentPassWithUniqueIdentifier:v8 didReceiveMessage:v6];
  }
}

- (void)sendPassWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if (([(PKEntitlementWhitelist *)self->_whitelist passesAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v9 = [(PDPaymentService *)self remoteObjectProxy];
    [v9 passWithUniqueIdentifier:v10 didUpdateTiles:v8 forContext:a5];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v7 = [(PDPaymentService *)self remoteObjectProxy];
    [v7 paymentPassWithUniqueIdentifier:v8 didReceiveBalanceUpdate:v6];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v7 = [(PDPaymentService *)self remoteObjectProxy];
    [v7 paymentPassWithUniqueIdentifier:v8 didReceivePlanUpdate:v6];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v10 = [(PDPaymentService *)self remoteObjectProxy];
    [v10 paymentPassWithUniqueIdentifier:v11 didUpdateBalanceReminder:v8 forBalanceWithIdentifier:v9];
  }
}

- (void)sendDidReceivePendingProvisioningUpdate:(id)a3
{
  id v5 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v4 = [(PDPaymentService *)self remoteObjectProxy];
    [v4 didReceivePendingProvisioningUpdate:v5];
  }
}

- (void)sendTransactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v7 = [(PDPaymentService *)self remoteObjectProxy];
    [v7 transactionSourceIdentifier:v8 didRemoveTransactionWithIdentifier:v6];
  }
}

- (void)sendDidRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  id v5 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v4 = [(PDPaymentService *)self remoteObjectProxy];
    [v4 didRemoveTransactionsWithSourceIdentifierMapping:v5];
  }
}

- (void)sendTransactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL suspendTransactionUpdates = self->_suspendTransactionUpdates;
  os_unfair_lock_unlock(&self->_lock);
  if (!suspendTransactionUpdates
    && [(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v8 = [(PDPaymentService *)self remoteObjectProxy];
    [v8 transactionSourceIdentifier:v9 didReceiveTransaction:v6];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
  {
    id v6 = [(PDPaymentService *)self remoteObjectProxy];
    [v6 paymentPassWithUniqueIdentifier:v7 didEnableMessageService:v4];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
  {
    id v6 = [(PDPaymentService *)self remoteObjectProxy];
    [v6 paymentPassWithUniqueIdentifier:v7 didEnableTransactionService:v4];
  }
}

- (void)sendDidUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  id v5 = a3;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist paymentConfiguration])
  {
    BOOL v4 = [(PDPaymentService *)self remoteObjectProxy];
    [v4 didUpdateDefaultPaymentPassWithUniqueIdentifier:v5];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitProperties:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v7 = [(PDPaymentService *)self remoteObjectProxy];
    [v7 paymentPassWithUniqueIdentifier:v8 didUpdateWithTransitPassProperties:v6];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4
{
  id v7 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v6 = [(PDPaymentService *)self remoteObjectProxy];
    [v6 paymentPassWithUniqueIdentifier:v7 didUpdateCategoryVisualizationWithStyle:a4];
  }
}

- (void)sendDidRecieveCredentialInvitation:(id)a3
{
  id v5 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    BOOL v4 = [(PDPaymentService *)self remoteObjectProxy];
    [v4 didRecieveCredentialInvitation:v5];
  }
}

- (void)sendSharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v5 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    BOOL v4 = [(PDPaymentService *)self remoteObjectProxy];
    [v4 sharesDidUpdateWithPaymentPassWithUniqueIdentifier:v5];
  }
}

- (void)sendCredential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v9 = [(PDPaymentService *)self remoteObjectProxy];
    [v9 credential:v10 forPaymentApplication:v8 didUpdateRangingSuspensionReasons:a5];
  }
}

- (void)productsWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v9 = [(PKEntitlementWhitelist *)self->_whitelist applicationID];
    [v7 setSourceApplicationIdentifier:v9];

    id v10 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator paymentSetupFeaturesCoordinator];
    [v10 productsWithRequest:v7 completion:v8];
  }
  else if (v8)
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (void)productsWithCompletion:(id)a3
{
  id v5 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v6 = objc_alloc_init((Class)PKPaymentAvailableProductsRequest);
    id v7 = [(PKEntitlementWhitelist *)self->_whitelist applicationID];
    [v6 setSourceApplicationIdentifier:v7];

    id v8 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator paymentSetupFeaturesCoordinator];
    [v8 productsWithRequest:v6 completion:v5];
  }
  else if (v5)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

- (void)performProductActionRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    id v9 = [(PKEntitlementWhitelist *)self->_whitelist applicationID];
    [v7 setSourceApplicationIdentifier:v9];

    id v10 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator paymentSetupFeaturesCoordinator];
    [v10 performProductActionRequest:v7 completion:v8];
  }
  else if (v8)
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    [(PDDefaultPassManager *)self->_defaultPassManager willPassWithUniqueIdentifierAutomaticallyBecomeDefault:v7 completion:v8];
  }
  else if (v8)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }

    v8[2](v8, 0);
  }
}

- (void)serviceSuspended
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL suspendTransactionUpdates = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)sendAllPassTransactions
{
  if (![(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess])
  {
    BOOL v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100517200(a2);
    }
    goto LABEL_7;
  }
  if (self->_gatheringAllTransactions)
  {
    BOOL v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100517284(v4);
    }
LABEL_7:

    return;
  }
  self->_gatheringAllTransactions = 1;
  databaseManager = self->_databaseManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100345404;
  v6[3] = &unk_100749F88;
  void v6[4] = self;
  [(PDDatabaseManager *)databaseManager allPassTransactionIdentifiersWithBatchHandler:v6];
}

- (void)regionsMatchingName:(id)a3 types:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist searchAllAccess])
    {
      databaseManager = self->_databaseManager;
      id v11 = +[NSLocale currentLocale];
      uint64_t v12 = [v11 localeIdentifier];
      BOOL v13 = [(PDDatabaseManager *)databaseManager regionsMatchingName:v14 types:v8 localeIdentifier:v12];

      v9[2](v9, v13);
    }
    else
    {
      v9[2](v9, &__NSArray0__struct);
    }
  }
}

- (void)regionsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist searchAllAccess])
    {
      id v18 = v7;
      id v21 = objc_alloc_init((Class)NSMutableArray);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v19 = v6;
      id obj = v6;
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          id v11 = 0;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v11);
            databaseManager = self->_databaseManager;
            id v14 = +[NSLocale currentLocale];
            id v15 = [v14 localeIdentifier];
            id v16 = [(PDDatabaseManager *)databaseManager worldRegionWithIdentifier:v12 localeIdentifier:v15];

            if (v16) {
              [v21 addObject:v16];
            }

            id v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v9);
      }

      id v17 = [v21 copy];
      id v7 = v18;
      v18[2](v18, v17);

      id v6 = v19;
    }
    else
    {
      v7[2](v7, &__NSArray0__struct);
    }
  }
}

- (PDNotificationServiceCoordinator)notificationServiceCoordinator
{
  return self->_notificationServiceCoordinator;
}

- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator
{
  return self->_cloudStoreNotificationCoordinator;
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServicesCoordinator
{
  return self->_peerPaymentWebServicesCoordinator;
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (PDFamilyCircleManager)familyMemberManager
{
  return self->_familyMemberManager;
}

- (PDPaymentTransactionProcessor)paymentTransactionProcessor
{
  return self->_paymentTransactionProcessor;
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (PDExpressPassManager)expressPassManager
{
  return self->_expressPassManager;
}

- (PDTransitStateManager)transitStateManager
{
  return self->_transitStateManager;
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (PDDefaultPassManager)defaultPassManager
{
  return self->_defaultPassManager;
}

- (PDPushNotificationManager)pushNotificationManager
{
  return self->_pushNotificationManager;
}

- (PDDevicePasscodeManager)devicePasscodeManager
{
  return self->_devicePasscodeManager;
}

- (PDApplyManager)applyManager
{
  return self->_applyManager;
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (PDAppletSubcredentialManager)subcredentialManager
{
  return self->_subcredentialManager;
}

- (PDNFCInitiatedPairingManager)nfcPairingManager
{
  return self->_nfcPairingManager;
}

- (PDCardFileManager)cardFileManager
{
  return self->_cardFileManager;
}

- (PDPassTileManager)passTileManager
{
  return self->_passTileManager;
}

- (PDMapsBrandAndMerchantUpdater)mapsBrandAndMerchantUpdater
{
  return self->_mapsBrandAndMerchantUpdater;
}

- (PDPushProvisioningManager)pushProvisioningManager
{
  return self->_pushProvisioningManager;
}

- (PDIssuerBindingManager)issuerBindingManager
{
  return self->_issuerBindingManager;
}

- (PDBarcodeCredentialManager)barcodeCredentialManager
{
  return self->_barcodeCredentialManager;
}

- (PDTransactionAuthenticationManager)transactionAuthenticationManager
{
  return self->_transactionAuthenticationManager;
}

- (PKTapToRadarDelegate)tapToRadarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapToRadarDelegate);
  return (PKTapToRadarDelegate *)WeakRetained;
}

- (PDPaymentOffersManager)paymentOffersManager
{
  return self->_paymentOffersManager;
}

- (PDTransactionReceiptFileManager)transactionReceiptFileManager
{
  return self->_transactionReceiptFileManager;
}

- (PKSharingIDSManager)idsSharingManager
{
  return self->_idsSharingManager;
}

- (PDISO18013Manager)iso18013Manager
{
  return self->_iso18013Manager;
}

- (PDSharingManager)sharingManager
{
  return self->_sharingManager;
}

- (PDPendingProvisioningManager)pendingProvisioningManager
{
  return self->_pendingProvisioningManager;
}

- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager
{
  return self->_auxiliaryCapabilityManager;
}

- (PDApplicationMessageManager)applicationMessageManager
{
  return self->_applicationMessageManager;
}

- (PDPaymentUserCommunicationManager)paymentUserCommunicationManager
{
  return self->_paymentUserCommunicationManager;
}

- (FDWalletMessagingProvider)financeKitMessageProvider
{
  return self->_financeKitMessageProvider;
}

- (PDAuxiliaryPassInformationManager)auxiliaryPassInformationManager
{
  return self->_auxiliaryPassInformationManager;
}

- (PDXPCEventPublisher)passKitEventPublisher
{
  return self->_passKitEventPublisher;
}

@end