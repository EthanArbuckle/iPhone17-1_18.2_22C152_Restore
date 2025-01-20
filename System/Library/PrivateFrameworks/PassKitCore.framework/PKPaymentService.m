@interface PKPaymentService
- (BOOL)_hasInterfaceOfType:(unint64_t)a3;
- (BOOL)hasPaymentDeviceFieldProperties;
- (BOOL)hasPendingProvisioningsOfTypes:(id)a3;
- (BOOL)isExpressModeEnabledForPassUniqueIdentifier:(id)a3;
- (BOOL)isExpressModeEnabledForRemotePassUniqueIdentifier:(id)a3;
- (BOOL)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3;
- (NSString)defaultPaymentPassUniqueIdentifier;
- (PKExpressTransactionState)outstandingExpressTransactionState;
- (PKFieldProperties)paymentDeviceFieldProperties;
- (PKPaymentService)init;
- (PKPaymentService)initWithDelegate:(id)a3;
- (PKPaymentServiceDelegate)delegate;
- (PKPaymentWebServiceContext)sharedPaymentWebServiceContext;
- (id)_existingRemoteObjectProxy;
- (id)_extendedRemoteObjectProxy;
- (id)_extendedRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)_extendedRemoteObjectProxyWithFailureHandler:(id)a3;
- (id)_extendedSynchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)allPaymentApplicationUsageSummaries;
- (id)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8;
- (id)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8;
- (id)categoryVisualizationMagnitudesForPassUniqueID:(id)a3;
- (id)defaultExpressFelicaTransitPassIdentifier;
- (id)defaultExpressTransitPassIdentifier;
- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3;
- (id)entitlementsForPassIdentifier:(id)a3;
- (id)expressPassConfigurationWithPassUniqueIdentifier:(id)a3;
- (id)expressPassConfigurations;
- (id)expressPassConfigurationsWithCardType:(int64_t)a3;
- (id)expressPassInformationForMode:(id)a3;
- (id)expressPassesInformation;
- (id)expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3;
- (id)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3;
- (id)paymentOffersCatalog;
- (id)paymentRewardsBalanceWithIdentifier:(id)a3;
- (id)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3;
- (id)paymentRewardsRedemptionForPaymentHash:(id)a3;
- (id)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4;
- (id)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3;
- (id)transactionsForRequest:(id)a3;
- (unint64_t)rangingSuspensionReasonForAppletSubcredential:(id)a3 forPaymentApplicationID:(id)a4;
- (void)_accessDelegate:(id)a3;
- (void)_submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 usingSynchronousProxy:(BOOL)a6 completion:(id)a7;
- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5;
- (void)addPendingProvisioning:(id)a3;
- (void)addPendingProvisionings:(id)a3 completion:(id)a4;
- (void)addPlaceholderPassWithConfiguration:(id)a3 completion:(id)a4;
- (void)ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 completion:(id)a4;
- (void)ambiguousTransactionWithServiceIdentifier:(id)a3 completion:(id)a4;
- (void)applicationMessagesWithCompletion:(id)a3;
- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)archiveMessageWithIdentifier:(id)a3;
- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5;
- (void)balanceReminderThresholdForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4;
- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4;
- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 completion:(id)a5;
- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9;
- (void)categoryVisualizationMagnitudesForPassUniqueID:(id)a3 completion:(id)a4;
- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5;
- (void)checkAllAuxiliaryRegistrationRequirements;
- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4;
- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4;
- (void)clearSafariCardImportNotificationHistoryWithCompletion:(id)a3;
- (void)clearSafariCardImportNotificationsWithCompletion:(id)a3;
- (void)commutePlanReminderForCommputePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4;
- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5;
- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withCompletion:(id)a4;
- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5;
- (void)consistencyCheck;
- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5;
- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5;
- (void)credentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3;
- (void)currentSecureElementSnapshot:(id)a3;
- (void)dealloc;
- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4;
- (void)defaultPaymentPassIngestionSpecificIdentifier:(id)a3;
- (void)deleteAllTransactionsForTransactionSourceIdentifiers:(id)a3;
- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)deleteMessagesForPaymentPassWithUniqueIdentifier:(id)a3;
- (void)deletePaymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3;
- (void)deletePaymentTransactionWithIdentifier:(id)a3;
- (void)deletePaymentTransactionsWithIdentifiers:(id)a3;
- (void)deleteReservation:(id)a3 completion:(id)a4;
- (void)deleteSharingMessage:(id)a3;
- (void)deleteTransactionReceiptWithUniqueID:(id)a3 completion:(id)a4;
- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5;
- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4;
- (void)didReceivePendingProvisioningUpdate:(id)a3;
- (void)didReceiveSharingInvitationRequest:(id)a3 withCompletion:(id)a4;
- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7;
- (void)didRecieveCredentialInvitation:(id)a3;
- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3;
- (void)didUpdateApplicationMessages:(id)a3;
- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4;
- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4;
- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)downloadAllPaymentPasses;
- (void)eligiblePaymentOfferCriteriasForPassUniqueID:(id)a3 completion:(id)a4;
- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)familyMembersIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)familyMembersWithCompletion:(id)a3;
- (void)featureApplicationAdded:(id)a3;
- (void)featureApplicationChanged:(id)a3;
- (void)featureApplicationRemoved:(id)a3;
- (void)featureApplicationWithIdentifier:(id)a3 completion:(id)a4;
- (void)featureApplicationWithReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)featureApplicationsForAccountUserInvitationWithCompletion:(id)a3;
- (void)featureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)featureApplicationsWithCompletion:(id)a3;
- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)finishedKeyExchangeForCredential:(id)a3 withCompletion:(id)a4;
- (void)generateUnderlyingKeyReportWithCompletion:(id)a3;
- (void)handleStandaloneTransaction:(id)a3;
- (void)hasActiveExternallySharedPasses:(id)a3;
- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4;
- (void)initializeSecureElement:(id)a3;
- (void)initializeSecureElementIfNecessaryWithCompletion:(id)a3;
- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4;
- (void)insertOrUpdatePaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 completion:(id)a6;
- (void)insertOrUpdatePaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateValueAddedServiceTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentTransaction:(id)a5 completion:(id)a6;
- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9;
- (void)installmentPlansWithTransactionReferennceIdentifier:(id)a3 completion:(id)a4;
- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)isPassExpressWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)logoImageDataForURL:(id)a3 completion:(id)a4;
- (void)mapsMerchantWithIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4 completion:(id)a5;
- (void)mapsMerchantsWithCompletion:(id)a3;
- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4;
- (void)matchingInvitationOnDevice:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5;
- (void)memberTypeForCurrentUserWithCompletion:(id)a3;
- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5;
- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)notifyForSafariCardImportConsentWithCompletion:(id)a3;
- (void)notifyForSafariCardImportWithCredentials:(id)a3 withCompletion:(id)a4;
- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4;
- (void)passSharesForCredentialIdentifier:(id)a3 completion:(id)a4;
- (void)passUniqueIdentifierForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)passUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)passWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4;
- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5;
- (void)passbookUIServiceDidLaunch;
- (void)paymentDeviceDidEnterFieldWithProperties:(id)a3;
- (void)paymentDeviceDidExitField;
- (void)paymentPassForVirtualCard:(id)a3 completion:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)pendingFamilyMembersIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4;
- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)performDeviceCheckInWithCompletion:(id)a3;
- (void)performProductActionRequest:(id)a3 completion:(id)a4;
- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4;
- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)prepareIdentityProvisioningForTargetDeviceIdentifier:(id)a3 completion:(id)a4;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4;
- (void)processSharingCLICommands:(id)a3 completion:(id)a4;
- (void)processTransitTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7;
- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)productsWithCompletion:(id)a3;
- (void)productsWithRequest:(id)a3 completion:(id)a4;
- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 completion:(id)a5;
- (void)provisionIdentityPassWithPassMetadata:(id)a3 policyIdentifier:(id)a4 targetDeviceIdentifier:(id)a5 credentialIdentifier:(id)a6 attestations:(id)a7 completion:(id)a8;
- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 completion:(id)a7;
- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8;
- (void)pushProvisioningSharingIdentifiers:(id)a3;
- (void)queueIdentityPassProvisioningWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 supplementalData:(id)a6 completion:(id)a7;
- (void)rangingSuspensionReasonForAppletSubcredential:(id)a3 forPaymentApplicationID:(id)a4 completion:(id)a5;
- (void)recomputeCategoryVisualizationMangitudesForPassUniqueID:(id)a3 style:(int64_t)a4;
- (void)recordPaymentApplicationUsageForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4;
- (void)redeemEncryptedProvisioningTarget:(id)a3 completion:(id)a4;
- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4;
- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4;
- (void)regenerateVPANCardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)regionsMatchingName:(id)a3 types:(id)a4 completion:(id)a5;
- (void)regionsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)rejectShareForMailboxAddress:(id)a3;
- (void)relinquishInvitation:(id)a3 completion:(id)a4;
- (void)remoteService:(id)a3 didEstablishConnection:(id)a4;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
- (void)remoteServiceDidSuspend:(id)a3;
- (void)removeApplicationMessageWithKey:(id)a3;
- (void)removeApplicationMessagesWithKeys:(id)a3 completion:(id)a4;
- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)removeExpressPassWithUniqueIdentifierV2:(id)a3 completion:(id)a4;
- (void)removeExpressPassesWithCardType:(int64_t)a3 completion:(id)a4;
- (void)removeMapsDataForTransactionWithIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4 issueReportIdentifier:(id)a5 completion:(id)a6;
- (void)removePaymentOffersCatalog;
- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)removeProductsCache;
- (void)removeSharingInvitation:(id)a3 withCompletion:(id)a4;
- (void)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5;
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
- (void)scheduleSetupReminders;
- (void)sendAllPassTransactions;
- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4;
- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4;
- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setDefaultExpressFelicaTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5;
- (void)setDefaultExpressTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5;
- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5;
- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5;
- (void)setDoubleClickAllowed:(BOOL)a3;
- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 handler:(id)a5;
- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 handler:(id)a5;
- (void)setNFCPayloadState:(unint64_t)a3 forPass:(id)a4;
- (void)setPaymentApplicationRangingSuspensionReason:(unint64_t)a3 forPassUniqueIdentifier:(id)a4;
- (void)setSharedPaymentWebServiceContext:(id)a3;
- (void)sharedPaymentWebServiceContextWithCompletion:(id)a3;
- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3;
- (void)sharingCapabilitiesForPassIdentifier:(id)a3 outHasShares:(BOOL *)a4 outHasShareableEntitlements:(BOOL *)a5;
- (void)sharingInvitationWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5 completion:(id)a6;
- (void)simulateDefaultExpressTransitPassIdentifier:(id)a3 forExpressMode:(id)a4;
- (void)simulateDeviceAccessory;
- (void)simulateEnableBiometricsForPass:(id)a3;
- (void)simulateExpressTransactionForPassUniqueIdentifier:(id)a3;
- (void)simulateNotificationOfType:(unint64_t)a3 userInfo:(id)a4;
- (void)simulatePaymentPush;
- (void)simulatePaymentPushTopic:(id)a3;
- (void)simulateSecureEvent:(id)a3;
- (void)simulateVehicleInitiatedPairingWithTCIs:(id)a3 brandCode:(int64_t)a4;
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
- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5;
- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 completion:(id)a6;
- (void)submitVerificationRequest:(id)a3 completion:(id)a4;
- (void)suggestPaymentSafariCredentialImport:(id)a3 withCompletion:(id)a4;
- (void)tappedApplicationMessageWithKey:(id)a3;
- (void)tilesForPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)tilesForPassWithUniqueIdentifier:(id)a3 context:(int64_t)a4 completion:(id)a5;
- (void)transactionBatch:(id)a3 moreComing:(BOOL)a4 readyForNextBatch:(id)a5;
- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 unit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7;
- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5;
- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)transactionSourceTypeForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4;
- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)transactionWithTransactionIdentifier:(id)a3 completion:(id)a4;
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
- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5;
- (void)unscheduleDeviceCheckIn;
- (void)unscheduleDeviceUpgradeTaskActivity;
- (void)updateAllMapsBrandAndMerchantDataWithCompletion:(id)a3;
- (void)updateCardholderNameFromSafari:(id)a3 forVirtualCard:(id)a4 completion:(id)a5;
- (void)updateDateLastUsedBySafari:(id)a3 forVirtualCard:(id)a4 completion:(id)a5;
- (void)updateFeatureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateFinanceKitApplicationMessages;
- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)updateNotificationForProductIdentifier:(id)a3 configuration:(id)a4 localizedNotificationTitle:(id)a5 localizedNotificationMessage:(id)a6 completion:(id)a7;
- (void)updatePaymentOffersCatalogWithCompletion:(id)a3;
- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4 completion:(id)a5;
- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4 completion:(id)a5;
- (void)valueAddedServiceTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)valueAddedServiceTransactionsForPassWithUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)valueAddedServiceTransactionsForPaymentTransaction:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)virtualCardsWithActiveVPAN:(id)a3;
- (void)vpanCardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 merchantHost:(id)a5 completion:(id)a6;
@end

@implementation PKPaymentService

uint64_t __72__PKPaymentService_PendingProvisioning__hasPendingProvisioningsOfTypes___block_invoke_15(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)paymentDeviceDidEnterFieldWithProperties:(id)a3
{
  id v4 = a3;
  self->_hasPaymentDeviceFieldProperties = v4 != 0;
  atomic_store(1u, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PKPaymentService_paymentDeviceDidEnterFieldWithProperties___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

- (void)_accessDelegate:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = WeakRetained;
  if (self->_forceConnectionOnResume && WeakRetained == 0)
  {
    self->_forceConnectionOnResume = 0;
    [(PKXPCService *)self->_remoteService setForceConnectionOnResume:0];
  }
  if (v7) {
    v7[2](v7, v5);
  }
}

void __61__PKPaymentService_paymentDeviceDidEnterFieldWithProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentDeviceDidEnterFieldWithProperties:*(void *)(a1 + 32)];
  }
}

uint64_t __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (PKPaymentService)initWithDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentService;
  id v5 = [(PKPaymentService *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_forceConnectionOnResume = v4 != 0;
    v6->_pendingInvitationRequestsLock._os_unfair_lock_opaque = 0;
    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingInvitationRequests = v6->_pendingInvitationRequests;
    v6->_pendingInvitationRequests = v7;

    v9 = PDPaymentServiceExtendedInterface();
    v6->_interfaceType = 1;
    v10 = [PKXPCService alloc];
    v11 = PKPaymentServiceInterface();
    uint64_t v12 = [(PKXPCService *)v10 initWithMachServiceName:@"com.apple.passd.payment" remoteObjectInterface:v9 exportedObjectInterface:v11 exportedObject:v6];
    remoteService = v6->_remoteService;
    v6->_remoteService = (PKXPCService *)v12;

    [(PKXPCService *)v6->_remoteService setDelegate:v6];
    [(PKXPCService *)v6->_remoteService setForceConnectionOnResume:v6->_forceConnectionOnResume];
  }
  return v6;
}

void __50__PKPaymentService_sharedPaymentWebServiceContext__block_invoke_252(uint64_t a1, void *a2)
{
}

- (void)familyMembersIgnoringCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke;
  v13[3] = &unk_1E56DC4C0;
  SEL v15 = a2;
  id v8 = v7;
  id v14 = v8;
  v9 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke_295;
  v11[3] = &unk_1E56D89C8;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 familyMembersIgnoringCache:v4 completion:v11];
}

- (id)_extendedRemoteObjectProxyWithFailureHandler:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentService *)self _hasInterfaceOfType:1])
  {
    id v5 = [(PKXPCService *)self->_remoteService remoteObjectProxyWithFailureHandler:v4];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F28790];
    id v8 = [(PKPaymentService *)self description];
    [v6 raise:v7, @"%@ is not backed by an extended interface", v8 format];

    id v5 = 0;
  }

  return v5;
}

- (void)featureApplicationsForAccountUserInvitationWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPaymentService_featureApplicationsForAccountUserInvitationWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v14 = a2;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__PKPaymentService_featureApplicationsForAccountUserInvitationWithCompletion___block_invoke_305;
  v10[3] = &unk_1E56DD728;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 featureApplicationsForAccountUserInvitationWithCompletion:v10];
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v17 = a2;
    id v10 = v8;
    void aBlock[4] = self;
    id v16 = v10;
    id v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke_2;
    v13[3] = &unk_1E56E46E8;
    void v13[4] = self;
    id v14 = v10;
    [v12 conflictingExpressPassIdentifiersForPassConfiguration:v7 withCompletion:v13];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithFailureHandler:a3];
}

- (PKPaymentService)init
{
  return [(PKPaymentService *)self initWithDelegate:0];
}

- (void)dealloc
{
  if (self->_forceConnectionOnResume) {
    [(PKXPCService *)self->_remoteService setForceConnectionOnResume:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentService;
  [(PKPaymentService *)&v3 dealloc];
}

- (id)categoryVisualizationMagnitudesForPassUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__26;
  id v13 = __Block_byref_object_dispose__26;
  id v14 = 0;
  id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID___block_invoke;
  v8[3] = &unk_1E56D8720;
  v8[4] = &v9;
  [v5 categoryVisualizationMagnitudesForPassUniqueID:v4 completion:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (PKPaymentWebServiceContext)sharedPaymentWebServiceContext
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__26;
  uint64_t v11 = __Block_byref_object_dispose__26;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PKPaymentService_sharedPaymentWebServiceContext__block_invoke;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v6[4] = a2;
  v2 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PKPaymentService_sharedPaymentWebServiceContext__block_invoke_252;
  v5[3] = &unk_1E56E49B0;
  v5[4] = &v7;
  [v2 usingSynchronousProxy:1 fetchSharedPaymentWebServiceContextWithCompletion:v5];
  id v3 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (PKPaymentWebServiceContext *)v3;
}

- (BOOL)hasPendingProvisioningsOfTypes:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentService_PendingProvisioning__hasPendingProvisioningsOfTypes___block_invoke;
  aBlock[3] = &unk_1E56DD328;
  void aBlock[4] = self;
  void aBlock[5] = a2;
  id v6 = _Block_copy(aBlock);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (v5 && [v5 count])
  {
    uint64_t v7 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PKPaymentService_PendingProvisioning__hasPendingProvisioningsOfTypes___block_invoke_15;
    v10[3] = &unk_1E56D86D0;
    v10[4] = &v11;
    [v7 usingSynchronousProxy:1 hasPendingProvisioningsOfTypes:v5 completion:v10];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (void)applicationMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PKPaymentService_applicationMessagesWithCompletion___block_invoke;
    v10[3] = &unk_1E56D8388;
    id v6 = v4;
    id v11 = v6;
    uint64_t v7 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PKPaymentService_applicationMessagesWithCompletion___block_invoke_2;
    v8[3] = &unk_1E56D89C8;
    v8[4] = self;
    id v9 = v6;
    [v7 usingSynchronousProxy:0 applicationMessagesWithCompletion:v8];
  }
}

- (id)_extendedRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentService *)self _hasInterfaceOfType:1])
  {
    id v5 = [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F28790];
    char v8 = [(PKPaymentService *)self description];
    [v6 raise:v7, @"%@ is not backed by an extended interface", v8 format];

    id v5 = 0;
  }

  return v5;
}

- (BOOL)_hasInterfaceOfType:(unint64_t)a3
{
  unint64_t interfaceType = self->_interfaceType;
  BOOL v4 = interfaceType == 1;
  BOOL v5 = interfaceType < 2;
  if (a3 == 1) {
    return v4;
  }
  else {
    return v5;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingInvitationRequests, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

- (void)familyMembersWithCompletion:(id)a3
{
}

void __67__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __54__PKPaymentService_applicationMessagesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentService_Sharing__checkInvitationStatusForMailboxAddress_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PKPaymentService_Sharing__checkInvitationStatusForMailboxAddress_completion___block_invoke_11;
  v13[3] = &unk_1E56D8928;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 checkInvitationStatusForMailboxAddress:v9 completion:v13];
}

void __79__PKPaymentService_Sharing__checkInvitationStatusForMailboxAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __79__PKPaymentService_Sharing__checkInvitationStatusForMailboxAddress_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKPaymentService_Sharing__retrieveShareInvitationForMailboxAddress_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PKPaymentService_Sharing__retrieveShareInvitationForMailboxAddress_completion___block_invoke_13;
  v13[3] = &unk_1E56DD288;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 retrieveShareInvitationForMailboxAddress:v9 completion:v13];
}

void __81__PKPaymentService_Sharing__retrieveShareInvitationForMailboxAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __81__PKPaymentService_Sharing__retrieveShareInvitationForMailboxAddress_completion___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)relinquishInvitation:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKPaymentService_Sharing__relinquishInvitation_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PKPaymentService_Sharing__relinquishInvitation_completion___block_invoke_15;
  v13[3] = &unk_1E56D8798;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 relinquishInvitation:v9 completion:v13];
}

void __61__PKPaymentService_Sharing__relinquishInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __61__PKPaymentService_Sharing__relinquishInvitation_completion___block_invoke_15(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentService_Sharing__prewarmCreateShareForPassIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PKPaymentService_Sharing__prewarmCreateShareForPassIdentifier_completion___block_invoke_17;
  v13[3] = &unk_1E56D8798;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 prewarmCreateShareForPassIdentifier:v9 completion:v13];
}

void __76__PKPaymentService_Sharing__prewarmCreateShareForPassIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __76__PKPaymentService_Sharing__prewarmCreateShareForPassIdentifier_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_Sharing__createShareForPartialShareInvitation_authorization_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__PKPaymentService_Sharing__createShareForPartialShareInvitation_authorization_completion___block_invoke_18;
  v16[3] = &unk_1E56DD2B0;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 createShareForPartialShareInvitation:v12 authorization:v11 completion:v16];
}

void __91__PKPaymentService_Sharing__createShareForPartialShareInvitation_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __91__PKPaymentService_Sharing__createShareForPartialShareInvitation_authorization_completion___block_invoke_18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__PKPaymentService_Sharing__createShareInvitationForPartialShareInvitation_existingTransportIdentifier_authorization_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v23 = a2;
  id v12 = v11;
  void aBlock[4] = self;
  id v22 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = _Block_copy(aBlock);
  id v17 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v16];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __129__PKPaymentService_Sharing__createShareInvitationForPartialShareInvitation_existingTransportIdentifier_authorization_completion___block_invoke_20;
  v19[3] = &unk_1E56DD2D8;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 createShareInvitationForPartialShareInvitation:v15 existingTransportIdentifier:v14 authorization:v13 completion:v19];
}

void __129__PKPaymentService_Sharing__createShareInvitationForPartialShareInvitation_existingTransportIdentifier_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void, id))(v6 + 16))(v6, 0, 0, v3);
  }
}

uint64_t __129__PKPaymentService_Sharing__createShareInvitationForPartialShareInvitation_existingTransportIdentifier_authorization_completion___block_invoke_20(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_Sharing__acceptCarKeyShareForMessage_activationCode_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__PKPaymentService_Sharing__acceptCarKeyShareForMessage_activationCode_completion___block_invoke_22;
  v16[3] = &unk_1E56DD300;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 acceptCarKeyShareForMessage:v12 activationCode:v11 completion:v16];
}

void __83__PKPaymentService_Sharing__acceptCarKeyShareForMessage_activationCode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __83__PKPaymentService_Sharing__acceptCarKeyShareForMessage_activationCode_completion___block_invoke_22(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4
{
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __75__PKPaymentService_Sharing__cacheSharingMessageFromMailboxAddress_message___block_invoke;
  id v13 = &unk_1E56DD328;
  id v14 = self;
  SEL v15 = a2;
  id v6 = a4;
  id v7 = a3;
  id v8 = _Block_copy(&v10);
  uint64_t v9 = -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8, v10, v11, v12, v13, v14, v15);
  [v9 cacheSharingMessageFromMailboxAddress:v7 message:v6];
}

void __75__PKPaymentService_Sharing__cacheSharingMessageFromMailboxAddress_message___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    BOOL v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)deleteSharingMessage:(id)a3
{
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __50__PKPaymentService_Sharing__deleteSharingMessage___block_invoke;
  uint64_t v10 = &unk_1E56DD328;
  uint64_t v11 = self;
  SEL v12 = a2;
  id v4 = a3;
  BOOL v5 = _Block_copy(&v7);
  uint64_t v6 = -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v5, v7, v8, v9, v10, v11, v12);
  [v6 deleteSharingMessage:v4];
}

void __50__PKPaymentService_Sharing__deleteSharingMessage___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    BOOL v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKPaymentService_Sharing__createSingleUseShareURLWithMessage_timeToLive_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v19 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v18 = v10;
  id v11 = a3;
  SEL v12 = _Block_copy(aBlock);
  id v13 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__PKPaymentService_Sharing__createSingleUseShareURLWithMessage_timeToLive_completion___block_invoke_24;
  v15[3] = &unk_1E56DD350;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 createSingleUseShareURLWithMessage:v11 timeToLive:a4 completion:v15];
}

void __86__PKPaymentService_Sharing__createSingleUseShareURLWithMessage_timeToLive_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __86__PKPaymentService_Sharing__createSingleUseShareURLWithMessage_timeToLive_completion___block_invoke_24(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentService_Sharing__updateShareForPassIdentifier_share_authorization_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v23 = a2;
  id v12 = v11;
  void aBlock[4] = self;
  id v22 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = _Block_copy(aBlock);
  id v17 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v16];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__PKPaymentService_Sharing__updateShareForPassIdentifier_share_authorization_completion___block_invoke_26;
  v19[3] = &unk_1E56D8928;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 updateShareForPassIdentifier:v15 share:v14 authorization:v13 completion:v19];
}

void __89__PKPaymentService_Sharing__updateShareForPassIdentifier_share_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __89__PKPaymentService_Sharing__updateShareForPassIdentifier_share_authorization_completion___block_invoke_26(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentService_Sharing__revokeShareForPassIdentifier_share_shouldCascade_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v22 = a2;
  id v12 = v11;
  void aBlock[4] = self;
  id v21 = v12;
  id v13 = a4;
  id v14 = a3;
  id v15 = _Block_copy(aBlock);
  id v16 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v15];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__PKPaymentService_Sharing__revokeShareForPassIdentifier_share_shouldCascade_completion___block_invoke_27;
  v18[3] = &unk_1E56D8928;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 revokeShareForPassIdentifier:v14 share:v13 shouldCascade:v6 completion:v18];
}

void __89__PKPaymentService_Sharing__revokeShareForPassIdentifier_share_shouldCascade_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __89__PKPaymentService_Sharing__revokeShareForPassIdentifier_share_shouldCascade_completion___block_invoke_27(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_Sharing__revokeSharesForPassIdentifier_shares_shouldCascade_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v22 = a2;
  id v12 = v11;
  void aBlock[4] = self;
  id v21 = v12;
  id v13 = a4;
  id v14 = a3;
  id v15 = _Block_copy(aBlock);
  id v16 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v15];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__PKPaymentService_Sharing__revokeSharesForPassIdentifier_shares_shouldCascade_completion___block_invoke_28;
  v18[3] = &unk_1E56D8928;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 revokeSharesForPassIdentifier:v14 shares:v13 shouldCascade:v6 completion:v18];
}

void __91__PKPaymentService_Sharing__revokeSharesForPassIdentifier_shares_shouldCascade_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __91__PKPaymentService_Sharing__revokeSharesForPassIdentifier_shares_shouldCascade_completion___block_invoke_28(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)rejectShareForMailboxAddress:(id)a3
{
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __58__PKPaymentService_Sharing__rejectShareForMailboxAddress___block_invoke;
  id v10 = &unk_1E56DD328;
  id v11 = self;
  SEL v12 = a2;
  id v4 = a3;
  BOOL v5 = _Block_copy(&v7);
  uint64_t v6 = -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v5, v7, v8, v9, v10, v11, v12);
  [v6 rejectShareForMailboxAddress:v4];
}

void __58__PKPaymentService_Sharing__rejectShareForMailboxAddress___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    BOOL v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (id)entitlementsForPassIdentifier:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_Sharing__entitlementsForPassIdentifier___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void aBlock[4] = a2;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:v6];
  uint64_t v11 = 0;
  SEL v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__8;
  id v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PKPaymentService_Sharing__entitlementsForPassIdentifier___block_invoke_29;
  v10[3] = &unk_1E56D86F8;
  void v10[4] = &v11;
  [v7 usingSynchronousProxy:1 entitlementsForPassIdentifier:v5 completion:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __59__PKPaymentService_Sharing__entitlementsForPassIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

void __59__PKPaymentService_Sharing__entitlementsForPassIdentifier___block_invoke_29(uint64_t a1, void *a2)
{
}

- (void)hasActiveExternallySharedPasses:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKPaymentService_Sharing__hasActiveExternallySharedPasses___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v14 = a2;
  id v6 = v5;
  void aBlock[4] = self;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PKPaymentService_Sharing__hasActiveExternallySharedPasses___block_invoke_31;
  v10[3] = &unk_1E56D8798;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 hasActiveExternallySharedPasses:v10];
}

void __61__PKPaymentService_Sharing__hasActiveExternallySharedPasses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __61__PKPaymentService_Sharing__hasActiveExternallySharedPasses___block_invoke_31(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_Sharing__displayableSharesForPassIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PKPaymentService_Sharing__displayableSharesForPassIdentifier_completion___block_invoke_32;
  v13[3] = &unk_1E56D89C8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 displayableSharesForPassIdentifier:v9 completion:v13];
}

void __75__PKPaymentService_Sharing__displayableSharesForPassIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __75__PKPaymentService_Sharing__displayableSharesForPassIdentifier_completion___block_invoke_32(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sharingCapabilitiesForPassIdentifier:(id)a3 outHasShares:(BOOL *)a4 outHasShareableEntitlements:(BOOL *)a5
{
  id v9 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__PKPaymentService_Sharing__sharingCapabilitiesForPassIdentifier_outHasShares_outHasShareableEntitlements___block_invoke;
  aBlock[3] = &unk_1E56DD328;
  void aBlock[4] = self;
  void aBlock[5] = a2;
  id v10 = _Block_copy(aBlock);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v11 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__PKPaymentService_Sharing__sharingCapabilitiesForPassIdentifier_outHasShares_outHasShareableEntitlements___block_invoke_33;
  v12[3] = &unk_1E56DD398;
  v12[5] = &v17;
  v12[6] = &v13;
  v12[4] = self;
  [v11 sharingCapabilitiesForPassIdentifier:v9 completion:v12];
  if (a4) {
    *a4 = *((unsigned char *)v18 + 24);
  }
  if (a5) {
    *a5 = *((unsigned char *)v14 + 24);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void __107__PKPaymentService_Sharing__sharingCapabilitiesForPassIdentifier_outHasShares_outHasShareableEntitlements___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

uint64_t __107__PKPaymentService_Sharing__sharingCapabilitiesForPassIdentifier_outHasShares_outHasShareableEntitlements___block_invoke_33(uint64_t result, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) = a3;
  return result;
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKPaymentService_Sharing__displayableEntitlementsForPassIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PKPaymentService_Sharing__displayableEntitlementsForPassIdentifier_completion___block_invoke_35;
  v13[3] = &unk_1E56D89C8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 displayableEntitlementsForPassIdentifier:v9 completion:v13];
}

void __81__PKPaymentService_Sharing__displayableEntitlementsForPassIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __81__PKPaymentService_Sharing__displayableEntitlementsForPassIdentifier_completion___block_invoke_35(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentService_Sharing__sendSharingMessageTo_message_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__PKPaymentService_Sharing__sendSharingMessageTo_message_completion___block_invoke_36;
  v16[3] = &unk_1E56D8928;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 sendSharingMessageTo:v12 message:v11 completion:v16];
}

void __69__PKPaymentService_Sharing__sendSharingMessageTo_message_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __69__PKPaymentService_Sharing__sendSharingMessageTo_message_completion___block_invoke_36(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__PKPaymentService_Sharing__didReceiveActivationCodeFailureForCredentialIdentifier_attemptsRemaining_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v19 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__PKPaymentService_Sharing__didReceiveActivationCodeFailureForCredentialIdentifier_attemptsRemaining_completion___block_invoke_37;
  v15[3] = &unk_1E56D8798;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 didReceiveActivationCodeFailureForCredentialIdentifier:v11 attemptsRemaining:a4 completion:v15];
}

void __113__PKPaymentService_Sharing__didReceiveActivationCodeFailureForCredentialIdentifier_attemptsRemaining_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __113__PKPaymentService_Sharing__didReceiveActivationCodeFailureForCredentialIdentifier_attemptsRemaining_completion___block_invoke_37(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKPaymentService_Sharing__pendingShareActivationForShareIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PKPaymentService_Sharing__pendingShareActivationForShareIdentifier_completion___block_invoke_38;
  v13[3] = &unk_1E56DD3C0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 pendingShareActivationForShareIdentifier:v9 completion:v13];
}

void __81__PKPaymentService_Sharing__pendingShareActivationForShareIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __81__PKPaymentService_Sharing__pendingShareActivationForShareIdentifier_completion___block_invoke_38(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)processSharingCLICommands:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_Sharing__processSharingCLICommands_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PKPaymentService_Sharing__processSharingCLICommands_completion___block_invoke_43;
  v13[3] = &unk_1E56D89A0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 processSharingCLICommands:v9 completion:v13];
}

void __66__PKPaymentService_Sharing__processSharingCLICommands_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, __CFString *))(v6 + 16))(v6, @"XPC Failure");
  }
}

uint64_t __66__PKPaymentService_Sharing__processSharingCLICommands_completion___block_invoke_43(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)paymentOffersCatalog
{
  id v3 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__9;
  id v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PKPaymentService_PaymentOffers__paymentOffersCatalog__block_invoke;
  v6[3] = &unk_1E56DD638;
  void v6[4] = self;
  void v6[5] = &v7;
  [v3 paymentOffersCatalogWithCompletion:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__PKPaymentService_PaymentOffers__paymentOffersCatalog__block_invoke(uint64_t a1, void *a2)
{
}

- (void)updatePaymentOffersCatalogWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentService_PaymentOffers__updatePaymentOffersCatalogWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v14 = a2;
  id v6 = v5;
  void aBlock[4] = self;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentService_PaymentOffers__updatePaymentOffersCatalogWithCompletion___block_invoke_12;
  v10[3] = &unk_1E56DD660;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 updatePaymentOffersCatalogWithCompletion:v10];
}

void __76__PKPaymentService_PaymentOffers__updatePaymentOffersCatalogWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, 0);
  }
}

uint64_t __76__PKPaymentService_PaymentOffers__updatePaymentOffersCatalogWithCompletion___block_invoke_12(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removePaymentOffersCatalog
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PKPaymentService_PaymentOffers__removePaymentOffersCatalog__block_invoke;
  v5[3] = &unk_1E56DD328;
  v5[4] = self;
  void v5[5] = a2;
  id v3 = _Block_copy(v5);
  id v4 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v3];
  [v4 removePaymentOffersCatalog];
}

void __61__PKPaymentService_PaymentOffers__removePaymentOffersCatalog__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)eligiblePaymentOfferCriteriasForPassUniqueID:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E56DD6B0;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  id v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self paymentOffersCatalog];
  id v12 = v11;
  if (v11 && [v11 isFresh])
  {
    id v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Using cached catalog for extracting criteria for pass %@", buf, 0xCu);
    }

    v10[2](v10, v12);
  }
  else
  {
    SEL v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Fetching catalog for extracting criteria for pass %@", buf, 0xCu);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_15;
    v15[3] = &unk_1E56DD700;
    id v16 = v10;
    id v17 = v9;
    [(PKPaymentService *)self updatePaymentOffersCatalogWithCompletion:v15];
  }
}

void __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 catalog];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_2;
  v5[3] = &unk_1E56DD688;
  id v6 = *(id *)(a1 + 32);
  int v4 = objc_msgSend(v3, "pk_objectsPassingTest:", v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 associatedPassUniqueID];
  int v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

void __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_2_16;
  v9[3] = &unk_1E56DD6D8;
  id v10 = v5;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_2_16(void *a1)
{
  if (a1[4]) {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else {
    return (*(uint64_t (**)(void, void, void))(a1[7] + 16))(a1[7], 0, a1[5]);
  }
}

- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForPassUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForPassUniqueID_completion___block_invoke_18;
  v13[3] = &unk_1E56DD728;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 issuerInstallmentTransactionsForPassUniqueID:v9 completion:v13];
}

void __91__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForPassUniqueID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, 0);
  }
}

uint64_t __91__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForPassUniqueID_completion___block_invoke_18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForTransactionSourceIdentifiers_paymentHashes_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __121__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForTransactionSourceIdentifiers_paymentHashes_completion___block_invoke_20;
  v16[3] = &unk_1E56DD728;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 issuerInstallmentTransactionsForTransactionSourceIdentifiers:v12 paymentHashes:v11 completion:v16];
}

void __121__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForTransactionSourceIdentifiers_paymentHashes_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __121__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForTransactionSourceIdentifiers_paymentHashes_completion___block_invoke_20(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PKPaymentService_PaymentOffers__deleteIssuerInstallmentTransactionsForPassUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__PKPaymentService_PaymentOffers__deleteIssuerInstallmentTransactionsForPassUniqueID_completion___block_invoke_21;
  v13[3] = &unk_1E56D8770;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteIssuerInstallmentTransactionsForPassUniqueID:v9 completion:v13];
}

void __97__PKPaymentService_PaymentOffers__deleteIssuerInstallmentTransactionsForPassUniqueID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

uint64_t __97__PKPaymentService_PaymentOffers__deleteIssuerInstallmentTransactionsForPassUniqueID_completion___block_invoke_21(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PKPaymentService_PaymentOffers__paymentRewardsRedemptionsForPassUniqueIdentifier_paymentHashes_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __109__PKPaymentService_PaymentOffers__paymentRewardsRedemptionsForPassUniqueIdentifier_paymentHashes_completion___block_invoke_22;
  v16[3] = &unk_1E56DD728;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 paymentRewardsRedemptionsForPassUniqueIdentifier:v12 paymentHashes:v11 completion:v16];
}

void __109__PKPaymentService_PaymentOffers__paymentRewardsRedemptionsForPassUniqueIdentifier_paymentHashes_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, MEMORY[0x1E4F1CBF0], v3);
  }
}

uint64_t __109__PKPaymentService_PaymentOffers__paymentRewardsRedemptionsForPassUniqueIdentifier_paymentHashes_completion___block_invoke_22(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PKPaymentService_PaymentOffers__updatePaymentRewardsBalancesWithPassUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__PKPaymentService_PaymentOffers__updatePaymentRewardsBalancesWithPassUniqueIdentifier_completion___block_invoke_23;
  v13[3] = &unk_1E56DD728;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updatePaymentRewardsBalancesWithPassUniqueIdentifier:v9 completion:v13];
}

void __99__PKPaymentService_PaymentOffers__updatePaymentRewardsBalancesWithPassUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, MEMORY[0x1E4F1CBF0], 0);
  }
}

uint64_t __99__PKPaymentService_PaymentOffers__updatePaymentRewardsBalancesWithPassUniqueIdentifier_completion___block_invoke_23(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__PKPaymentService_PaymentOffers__updatePaymentRewardsRedemptionsWithPassUniqueIdentifier_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v19 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  id v13 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__PKPaymentService_PaymentOffers__updatePaymentRewardsRedemptionsWithPassUniqueIdentifier_limit_completion___block_invoke_24;
  v15[3] = &unk_1E56DD728;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:v11 limit:a4 completion:v15];
}

void __108__PKPaymentService_PaymentOffers__updatePaymentRewardsRedemptionsWithPassUniqueIdentifier_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __108__PKPaymentService_PaymentOffers__updatePaymentRewardsRedemptionsWithPassUniqueIdentifier_limit_completion___block_invoke_24(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)paymentRewardsBalanceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__9;
  id v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PKPaymentService_PaymentOffers__paymentRewardsBalanceWithIdentifier___block_invoke;
  v8[3] = &unk_1E56DD750;
  v8[4] = self;
  void v8[5] = &v9;
  [v5 paymentRewardsBalanceWithIdentifier:v4 completion:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __71__PKPaymentService_PaymentOffers__paymentRewardsBalanceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (id)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__9;
  id v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__PKPaymentService_PaymentOffers__paymentRewardsBalancesWithPassUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E56DD778;
  v8[4] = self;
  void v8[5] = &v9;
  [v5 paymentRewardsBalancesWithPassUniqueIdentifier:v4 completion:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __82__PKPaymentService_PaymentOffers__paymentRewardsBalancesWithPassUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (id)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__9;
  id v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__PKPaymentService_PaymentOffers__paymentRewardsRedemptionsForPassUniqueIdentifier_limit___block_invoke;
  v10[3] = &unk_1E56DD778;
  void v10[4] = self;
  void v10[5] = &v11;
  [v7 paymentRewardsRedemptionsForPassUniqueIdentifier:v6 limit:a4 completion:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __90__PKPaymentService_PaymentOffers__paymentRewardsRedemptionsForPassUniqueIdentifier_limit___block_invoke(uint64_t a1, void *a2)
{
}

- (id)paymentRewardsRedemptionForPaymentHash:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__9;
  uint64_t v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PKPaymentService_PaymentOffers__paymentRewardsRedemptionForPaymentHash___block_invoke;
  v8[3] = &unk_1E56DD7A0;
  v8[4] = self;
  void v8[5] = &v9;
  [v5 paymentRewardsRedemptionForPaymentHash:v4 completion:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __74__PKPaymentService_PaymentOffers__paymentRewardsRedemptionForPaymentHash___block_invoke(uint64_t a1, void *a2)
{
}

- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__PKPaymentService_PaymentOffers__insertOrUpdatePaymentRewardsRedemption_withPassUniqueIdentifier___block_invoke;
  v9[3] = &unk_1E56D8AE0;
  void v9[4] = self;
  [v8 insertOrUpdatePaymentRewardsRedemption:v7 withPassUniqueIdentifier:v6 completion:v9];
}

- (void)deletePaymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__PKPaymentService_PaymentOffers__deletePaymentRewardsRedemptionsForPassUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E56D8AE0;
  void v6[4] = self;
  [v5 deletePaymentRewardsRedemptionsForPassUniqueIdentifier:v4 completion:v6];
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 policyIdentifier:(id)a4 targetDeviceIdentifier:(id)a5 credentialIdentifier:(id)a6 attestations:(id)a7 completion:(id)a8
{
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 completion:(id)a7
{
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v26 = a2;
  id v14 = v13;
  void aBlock[4] = self;
  id v25 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  SEL v19 = _Block_copy(aBlock);
  SEL v20 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __136__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke_11;
  v22[3] = &unk_1E56E2830;
  v22[4] = self;
  id v23 = v14;
  id v21 = v14;
  [v20 provisionIdentityPassWithPassMetadata:v18 targetDeviceIdentifier:v17 credentialIdentifier:v16 attestations:v15 completion:v22];
}

void __136__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __136__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v15 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __153__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v29 = a2;
  id v16 = v15;
  void aBlock[4] = self;
  id v28 = v16;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = _Block_copy(aBlock);
  id v23 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v22];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __153__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke_13;
  v25[3] = &unk_1E56E2830;
  v25[4] = self;
  id v26 = v16;
  id v24 = v16;
  [v23 provisionIdentityPassWithPassMetadata:v21 targetDeviceIdentifier:v20 credentialIdentifier:v19 attestations:v18 supplementalData:v17 completion:v25];
}

void __153__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __153__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)queueIdentityPassProvisioningWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 supplementalData:(id)a6 completion:(id)a7
{
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __148__PKPaymentService_Identity__queueIdentityPassProvisioningWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_supplementalData_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v26 = a2;
  id v14 = v13;
  void aBlock[4] = self;
  id v25 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = _Block_copy(aBlock);
  id v20 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __148__PKPaymentService_Identity__queueIdentityPassProvisioningWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_supplementalData_completion___block_invoke_14;
  v22[3] = &unk_1E56D8770;
  v22[4] = self;
  id v23 = v14;
  id v21 = v14;
  [v20 queueIdentityPassProvisioningWithPassMetadata:v18 targetDeviceIdentifier:v17 credentialIdentifier:v16 supplementalData:v15 completion:v22];
}

void __148__PKPaymentService_Identity__queueIdentityPassProvisioningWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_supplementalData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __148__PKPaymentService_Identity__queueIdentityPassProvisioningWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_supplementalData_completion___block_invoke_14(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)prepareIdentityProvisioningForTargetDeviceIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPaymentService_Identity__prepareIdentityProvisioningForTargetDeviceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__PKPaymentService_Identity__prepareIdentityProvisioningForTargetDeviceIdentifier_completion___block_invoke_15;
  v13[3] = &unk_1E56D8770;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 prepareIdentityProvisioningForTargetDeviceIdentifier:v9 completion:v13];
}

void __94__PKPaymentService_Identity__prepareIdentityProvisioningForTargetDeviceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __94__PKPaymentService_Identity__prepareIdentityProvisioningForTargetDeviceIdentifier_completion___block_invoke_15(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateNotificationForProductIdentifier:(id)a3 configuration:(id)a4 localizedNotificationTitle:(id)a5 localizedNotificationMessage:(id)a6 completion:(id)a7
{
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__PKPaymentService_Identity__updateNotificationForProductIdentifier_configuration_localizedNotificationTitle_localizedNotificationMessage_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v26 = a2;
  id v14 = v13;
  void aBlock[4] = self;
  id v25 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = _Block_copy(aBlock);
  id v20 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __150__PKPaymentService_Identity__updateNotificationForProductIdentifier_configuration_localizedNotificationTitle_localizedNotificationMessage_completion___block_invoke_16;
  v22[3] = &unk_1E56D8770;
  v22[4] = self;
  id v23 = v14;
  id v21 = v14;
  [v20 updateNotificationForProductIdentifier:v18 configuration:v17 localizedNotificationTitle:v16 localizedNotificationMessage:v15 completion:v22];
}

void __150__PKPaymentService_Identity__updateNotificationForProductIdentifier_configuration_localizedNotificationTitle_localizedNotificationMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __150__PKPaymentService_Identity__updateNotificationForProductIdentifier_configuration_localizedNotificationTitle_localizedNotificationMessage_completion___block_invoke_16(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  atomic_store(0, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentService_remoteService_didEstablishConnection___block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__PKPaymentService_remoteService_didEstablishConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessDelegate:&__block_literal_global_83];
}

void __57__PKPaymentService_remoteService_didEstablishConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 paymentServiceEstablishedConnection];
  }
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  atomic_store(0, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentService_remoteService_didInterruptConnection___block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__PKPaymentService_remoteService_didInterruptConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessDelegate:&__block_literal_global_44];
}

void __57__PKPaymentService_remoteService_didInterruptConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 paymentServiceReceivedInterruption];
  }
}

- (void)remoteServiceDidSuspend:(id)a3
{
}

- (id)_remoteObjectProxy
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxy];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

- (id)_existingRemoteObjectProxy
{
  return [(PKXPCService *)self->_remoteService existingRemoteObjectProxy];
}

- (id)_extendedRemoteObjectProxy
{
  if ([(PKPaymentService *)self _hasInterfaceOfType:1])
  {
    id v3 = [(PKXPCService *)self->_remoteService remoteObjectProxy];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F28790];
    uint64_t v6 = [(PKPaymentService *)self description];
    [v4 raise:v5, @"%@ is not backed by an extended interface", v6 format];

    id v3 = 0;
  }
  return v3;
}

- (id)_extendedSynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentService *)self _hasInterfaceOfType:1])
  {
    uint64_t v5 = [(PKXPCService *)self->_remoteService synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F28790];
    id v8 = [(PKPaymentService *)self description];
    [v6 raise:v7, @"%@ is not backed by an extended interface", v8 format];

    uint64_t v5 = 0;
  }

  return v5;
}

- (void)paymentDeviceDidExitField
{
  self->_hasPaymentDeviceFieldProperties = 0;
  atomic_store(1u, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  [(PKPaymentService *)self _accessDelegate:&__block_literal_global_54];
}

void __45__PKPaymentService_paymentDeviceDidExitField__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 paymentDeviceDidExitField];
  }
}

- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PKPaymentService_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

void __68__PKPaymentService_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateDefaultPaymentPassWithUniqueIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)didUpdateApplicationMessages:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PKPaymentService_didUpdateApplicationMessages___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

void __49__PKPaymentService_didUpdateApplicationMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateApplicationMessages:*(void *)(a1 + 32)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PKPaymentService_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke;
  v10[3] = &unk_1E56E45A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentService *)self _accessDelegate:v10];
}

void __70__PKPaymentService_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didReceiveMessage:*(void *)(a1 + 40)];
  }
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PKPaymentService_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
  v12[3] = &unk_1E56E45D0;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(PKPaymentService *)self _accessDelegate:v12];
}

void __71__PKPaymentService_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 passWithUniqueIdentifier:a1[4] didUpdateTiles:a1[5] forContext:a1[6]];
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PKPaymentService_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v10[3] = &unk_1E56E45A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentService *)self _accessDelegate:v10];
}

void __70__PKPaymentService_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transactionSourceIdentifier:*(void *)(a1 + 32) didReceiveTransaction:*(void *)(a1 + 40)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentService_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v10[3] = &unk_1E56E45A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentService *)self _accessDelegate:v10];
}

void __76__PKPaymentService_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didReceiveBalanceUpdate:*(void *)(a1 + 40)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKPaymentService_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  v10[3] = &unk_1E56E45A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentService *)self _accessDelegate:v10];
}

void __73__PKPaymentService_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didReceivePlanUpdate:*(void *)(a1 + 40)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke;
  v14[3] = &unk_1E56E45F8;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(PKPaymentService *)self _accessDelegate:v14];
}

void __102__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:a1[4] didUpdateBalanceReminder:a1[5] forBalanceWithIdentifier:a1[6]];
  }
}

- (void)didReceivePendingProvisioningUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKPaymentService_didReceivePendingProvisioningUpdate___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

void __56__PKPaymentService_didReceivePendingProvisioningUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didReceivePendingProvisioningUpdate:*(void *)(a1 + 32)];
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__PKPaymentService_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  v10[3] = &unk_1E56E45A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentService *)self _accessDelegate:v10];
}

void __83__PKPaymentService_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transactionSourceIdentifier:*(void *)(a1 + 32) didRemoveTransactionWithIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PKPaymentService_didRemoveTransactionsWithSourceIdentifierMapping___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

void __69__PKPaymentService_didRemoveTransactionsWithSourceIdentifierMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didRemoveTransactionsWithSourceIdentifierMapping:*(void *)(a1 + 32)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PKPaymentService_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke;
  v8[3] = &unk_1E56E4620;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(PKPaymentService *)self _accessDelegate:v8];
}

void __76__PKPaymentService_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didEnableMessageService:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PKPaymentService_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke;
  v8[3] = &unk_1E56E4620;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(PKPaymentService *)self _accessDelegate:v8];
}

void __80__PKPaymentService_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didEnableTransactionService:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)passWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PKPaymentService_passWithUniqueIdentifier_didReceiveValueAddedServiceTransaction___block_invoke;
  v10[3] = &unk_1E56E45A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentService *)self _accessDelegate:v10];
}

void __84__PKPaymentService_passWithUniqueIdentifier_didReceiveValueAddedServiceTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 passWithUniqueIdentifier:*(void *)(a1 + 32) didReceiveValueAddedServiceTransaction:*(void *)(a1 + 40)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  v10[3] = &unk_1E56E45A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentService *)self _accessDelegate:v10];
}

void __87__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didUpdateWithTransitPassProperties:*(void *)(a1 + 40)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateCategoryVisualizationWithStyle___block_invoke;
  v8[3] = &unk_1E56E4648;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(PKPaymentService *)self _accessDelegate:v8];
}

void __92__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateCategoryVisualizationWithStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didUpdateCategoryVisualizationWithStyle:*(void *)(a1 + 40)];
  }
}

- (void)featureApplicationAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PKPaymentService_featureApplicationAdded___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

void __44__PKPaymentService_featureApplicationAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureApplicationAdded:*(void *)(a1 + 32)];
  }
}

- (void)featureApplicationRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PKPaymentService_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

void __46__PKPaymentService_featureApplicationRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureApplicationRemoved:*(void *)(a1 + 32)];
  }
}

- (void)featureApplicationChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PKPaymentService_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

void __46__PKPaymentService_featureApplicationChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureApplicationChanged:*(void *)(a1 + 32)];
  }
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PKPaymentService_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

void __43__PKPaymentService_didUpdateFamilyMembers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateFamilyMembers:*(void *)(a1 + 32)];
  }
}

- (void)transactionBatch:(id)a3 moreComing:(BOOL)a4 readyForNextBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKPaymentService_transactionBatch_moreComing_readyForNextBatch___block_invoke;
  v12[3] = &unk_1E56E4670;
  BOOL v15 = a4;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(PKPaymentService *)self _accessDelegate:v12];
}

void __66__PKPaymentService_transactionBatch_moreComing_readyForNextBatch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transactionBatch:*(void *)(a1 + 32) moreComing:*(unsigned __int8 *)(a1 + 48) readyForNextBatch:*(void *)(a1 + 40)];
  }
}

- (void)didRecieveCredentialInvitation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_pendingInvitationRequestsLock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_pendingInvitationRequests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      id v11 = [v10 invitation];
      char v12 = [v11 isSameInvitationAsInvitation:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_12;
    }
    [(NSMutableArray *)self->_pendingInvitationRequests removeObject:v13];
    os_unfair_lock_unlock(&self->_pendingInvitationRequestsLock);
    [v13 invokeCompletionWithInvitation:v4 error:0];
  }
  else
  {
LABEL_9:

LABEL_12:
    os_unfair_lock_unlock(&self->_pendingInvitationRequestsLock);
    id v13 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__PKPaymentService_didRecieveCredentialInvitation___block_invoke;
  v15[3] = &unk_1E56E4580;
  id v16 = v4;
  id v14 = v4;
  [(PKPaymentService *)self _accessDelegate:v15];
}

void __51__PKPaymentService_didRecieveCredentialInvitation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didRecieveCredentialInvitation:*(void *)(a1 + 32)];
  }
}

- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__PKPaymentService_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke;
  v12[3] = &unk_1E56E45D0;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(PKPaymentService *)self _accessDelegate:v12];
}

void __87__PKPaymentService_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 credential:a1[4] forPaymentApplication:a1[5] didUpdateRangingSuspensionReasons:a1[6]];
  }
}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKPaymentService_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E56E4580;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentService *)self _accessDelegate:v6];
}

void __71__PKPaymentService_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sharesDidUpdateWithPaymentPassWithUniqueIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentService_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke;
  v10[3] = &unk_1E56E45A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentService *)self _accessDelegate:v10];
}

void __76__PKPaymentService_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transactionWithIdentifier:*(void *)(a1 + 32) didDownloadTransactionReceipt:*(void *)(a1 + 40)];
  }
}

- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__PKPaymentService_didReceiveDeviceSharingCapabilities_forHandle___block_invoke;
  v10[3] = &unk_1E56E45A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentService *)self _accessDelegate:v10];
}

void __66__PKPaymentService_didReceiveDeviceSharingCapabilities_forHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didReceiveDeviceSharingCapabilities:*(void *)(a1 + 32) forHandle:*(void *)(a1 + 40)];
  }
}

- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke;
  v14[3] = &unk_1E56D8590;
  SEL v16 = a2;
  id v8 = v7;
  void v14[4] = self;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_2;
  v12[3] = &unk_1E56D8798;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 displayTapToRadarAlertForRequest:v9 completion:v12];
}

void __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_109;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_109(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)setDoubleClickAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v4 setDoubleClickAllowed:v3 completion:&__block_literal_global_112_0];
}

- (id)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__26;
  uint64_t v13 = __Block_byref_object_dispose__26;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PKPaymentService_transactionsAppLaunchTokenForPassWithUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E56DDF30;
  void v8[4] = &v9;
  [v5 transactionsAppLaunchTokenForPassWithUniqueIdentifier:v4 handler:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __74__PKPaymentService_transactionsAppLaunchTokenForPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (id)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__26;
  uint64_t v13 = __Block_byref_object_dispose__26;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PKPaymentService_messagesAppLaunchTokenForPassWithUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E56DDF30;
  void v8[4] = &v9;
  [v5 messagesAppLaunchTokenForPassWithUniqueIdentifier:v4 handler:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __70__PKPaymentService_messagesAppLaunchTokenForPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5
{
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 completion:(id)a6
{
}

- (void)_submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 usingSynchronousProxy:(BOOL)a6 completion:(id)a7
{
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke;
  aBlock[3] = &unk_1E56E4698;
  SEL v26 = a2;
  id v14 = v13;
  id v25 = v14;
  BOOL v27 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  long long v18 = _Block_copy(aBlock);
  if (a6) {
    [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:v18];
  }
  else {
  long long v19 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithErrorHandler:v18];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_2;
  v21[3] = &unk_1E56E46C0;
  BOOL v23 = a6;
  v21[4] = self;
  id v22 = v14;
  id v20 = v14;
  [v19 submitVerificationCode:v17 verificationData:v16 forDPANIdentifier:v15 handler:v21];
}

void __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v6 = *(void (***)(void, void, void))(a1 + 32);
  if (v6)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      v6[2](*(void *)(a1 + 32), 0, 0);
    }
    else
    {
      id v7 = dispatch_get_global_queue(0, 0);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_114;
      v9[3] = &unk_1E56D8360;
      id v10 = v6;
      id v8 = v9;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v12 = __dispatch_async_ar_block_invoke_8;
      id v13 = &unk_1E56D8360;
      id v14 = v8;
      dispatch_async(v7, &buf);
    }
  }
}

uint64_t __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void (***)(void, void, void))(a1 + 40);
  if (v5)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      v5[2](*(void *)(a1 + 40), 0, 0);
    }
    else
    {
      id v6 = dispatch_get_global_queue(0, 0);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_3;
      v8[3] = &unk_1E56D8360;
      uint64_t v9 = v5;
      id v7 = v8;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __dispatch_async_ar_block_invoke_8;
      block[3] = &unk_1E56D8360;
      id v11 = v7;
      dispatch_async(v6, block);
    }
  }
}

uint64_t __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke;
  v20[3] = &unk_1E56D8590;
  SEL v22 = a2;
  id v12 = v11;
  v20[4] = self;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_2;
  v18[3] = &unk_1E56D89C8;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 peerPaymentCounterpartHandlesForTransactionSourceIdentifier:v15 startDate:v14 endDate:v13 completion:v18];
}

void __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_117;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_117(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke;
  v14[3] = &unk_1E56D8590;
  SEL v16 = a2;
  id v8 = v7;
  void v14[4] = self;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_2;
  v12[3] = &unk_1E56D8798;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 hasTransactionsForTransactionSourceIdentifiers:v9 completion:v12];
}

void __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_119;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_119(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)insertOrUpdatePaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke;
  v20[3] = &unk_1E56D8590;
  SEL v22 = a2;
  id v12 = v11;
  v20[4] = self;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  SEL v16 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_2;
  v18[3] = &unk_1E56E4DC0;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 insertOrUpdatePaymentTransaction:v15 forPassUniqueIdentifier:v14 paymentApplication:v13 completion:v18];
}

void __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_120;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_120(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)insertOrUpdatePaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke;
  v17[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  v17[4] = self;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_2;
  v15[3] = &unk_1E56E4DC0;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 insertOrUpdatePaymentTransaction:v12 forTransactionSourceIdentifier:v11 completion:v15];
}

void __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_122;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_122(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)removeMapsDataForTransactionWithIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4 issueReportIdentifier:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke;
  v20[3] = &unk_1E56D8590;
  SEL v22 = a2;
  id v12 = v11;
  v20[4] = self;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_2;
  v18[3] = &unk_1E56E4DC0;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 removeMapsDataForTransactionWithIdentifier:v15 forTransactionSourceIdentifier:v14 issueReportIdentifier:v13 completion:v18];
}

void __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_123;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_123(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v16 = a9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v29 = a2;
  id v17 = v16;
  void aBlock[4] = self;
  id v28 = v17;
  id v18 = a7;
  id v19 = a6;
  id v20 = a3;
  id v21 = _Block_copy(aBlock);
  SEL v22 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v21];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v25[3] = &unk_1E56E46E8;
  v25[4] = self;
  id v26 = v17;
  id v23 = v17;
  [v22 transactionsForTransactionSourceIdentifiers:v20 withTransactionSource:a4 withBackingData:a5 startDate:v19 endDate:v18 limit:a8 completion:v25];
}

void __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_124;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_124(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16 = a10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v30 = a2;
  id v17 = v16;
  void aBlock[4] = self;
  id v29 = v17;
  id v18 = a7;
  id v19 = a6;
  id v20 = a3;
  id v21 = _Block_copy(aBlock);
  SEL v22 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v21];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_2;
  v26[3] = &unk_1E56E46E8;
  v26[4] = self;
  id v27 = v17;
  id v23 = v17;
  [v22 transactionsForTransactionSourceIdentifiers:v20 withTransactionSource:a4 withBackingData:a5 startDate:v19 endDate:v18 orderedByDate:a8 limit:a9 completion:v26];
}

void __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_126;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_126(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7
{
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v23 = a2;
  id v14 = v13;
  void aBlock[4] = self;
  id v22 = v14;
  id v15 = a3;
  id v16 = _Block_copy(aBlock);
  id v17 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v16];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_2;
  v19[3] = &unk_1E56E46E8;
  v19[4] = self;
  id v20 = v14;
  id v18 = v14;
  [v17 transactionsForTransactionSourceIdentifiers:v15 withTransactionSource:a4 withBackingData:a5 limit:a6 completion:v19];
}

void __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_127;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_127(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 unit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v24 = a2;
  id v14 = v13;
  void aBlock[4] = self;
  id v23 = v14;
  id v15 = a4;
  id v16 = a3;
  id v17 = _Block_copy(aBlock);
  id v18 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v17];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_2;
  v20[3] = &unk_1E56D89C8;
  v20[4] = self;
  id v21 = v14;
  id v19 = v14;
  [v18 transactionCountByPeriodForRequest:v16 calendar:v15 unit:a5 includePurchaseTotal:v7 completion:v20];
}

void __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_128;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_128(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  BOOL v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9
{
  id v16 = a9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v30 = a2;
  id v17 = v16;
  void aBlock[4] = self;
  id v29 = v17;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = _Block_copy(aBlock);
  id v23 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v22];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke_2;
  v26[3] = &unk_1E56D89C8;
  v26[4] = self;
  id v27 = v17;
  id v24 = v17;
  [v23 cashbackByPeriodForTransactionSourceIdentifiers:v21 withStartDate:v20 endDate:v19 calendar:v18 calendarUnit:a7 type:a8 completion:v26];
}

void __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke_129;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke_129(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withPeerPaymentCounterpartHandles:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  id v15 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v26 = a2;
  id v16 = v15;
  void aBlock[4] = self;
  id v25 = v16;
  id v17 = a4;
  id v18 = a3;
  id v19 = _Block_copy(aBlock);
  id v20 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_2;
  v22[3] = &unk_1E56E46E8;
  v22[4] = self;
  id v23 = v16;
  id v21 = v16;
  [v20 transactionsForTransactionSourceIdentifiers:v18 withPeerPaymentCounterpartHandles:v17 withTransactionSource:a5 withBackingData:a6 limit:a7 completion:v22];
}

void __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_130;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_130(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  BOOL v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 matchingMerchant:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  id v15 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v26 = a2;
  id v16 = v15;
  void aBlock[4] = self;
  id v25 = v16;
  id v17 = a4;
  id v18 = a3;
  id v19 = _Block_copy(aBlock);
  id v20 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke_2;
  v22[3] = &unk_1E56E46E8;
  v22[4] = self;
  id v23 = v16;
  id v21 = v16;
  [v20 transactionsForTransactionSourceIdentifiers:v18 matchingMerchant:v17 withTransactionSource:a5 withBackingData:a6 limit:a7 completion:v22];
}

void __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke_131;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke_131(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withMerchantCategory:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16 = a10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v30 = a2;
  id v17 = v16;
  void aBlock[4] = self;
  id v29 = v17;
  id v18 = a8;
  id v19 = a7;
  id v20 = a3;
  id v21 = _Block_copy(aBlock);
  id v22 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v21];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v26[3] = &unk_1E56E46E8;
  v26[4] = self;
  id v27 = v17;
  id v23 = v17;
  [v22 transactionsForTransactionSourceIdentifiers:v20 withMerchantCategory:a4 withTransactionSource:a5 withBackingData:a6 startDate:v19 endDate:v18 limit:a9 completion:v26];
}

void __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_132;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_132(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionType:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16 = a10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v30 = a2;
  id v17 = v16;
  void aBlock[4] = self;
  id v29 = v17;
  id v18 = a8;
  id v19 = a7;
  id v20 = a3;
  id v21 = _Block_copy(aBlock);
  id v22 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v21];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v26[3] = &unk_1E56E46E8;
  v26[4] = self;
  id v27 = v17;
  id v23 = v17;
  [v22 transactionsForTransactionSourceIdentifiers:v20 withTransactionType:a4 withTransactionSource:a5 withBackingData:a6 startDate:v19 endDate:v18 limit:a9 completion:v26];
}

void __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_133;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_133(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v16 = a9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v29 = a2;
  id v17 = v16;
  void aBlock[4] = self;
  id v28 = v17;
  id v18 = a7;
  id v19 = a6;
  id v20 = a3;
  id v21 = _Block_copy(aBlock);
  id v22 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v21];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v25[3] = &unk_1E56E46E8;
  v25[4] = self;
  id v26 = v17;
  id v23 = v17;
  [v22 approvedTransactionsForTransactionSourceIdentifiers:v20 withTransactionSource:a4 withBackingData:a5 startDate:v19 endDate:v18 limit:a8 completion:v25];
}

void __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_134;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_134(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__26;
  id v25 = __Block_byref_object_dispose__26;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __134__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit___block_invoke;
  v20[3] = &unk_1E56DE8D0;
  v20[4] = self;
  void v20[5] = &v21;
  [v17 approvedTransactionsForTransactionSourceIdentifiers:v14 withTransactionSource:a4 withBackingData:a5 startDate:v15 endDate:v16 limit:a8 completion:v20];
  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

void __134__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit___block_invoke(uint64_t a1, void *a2)
{
}

- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v17 = a9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v29 = a2;
  id v18 = v17;
  void aBlock[4] = self;
  id v28 = v18;
  id v19 = a7;
  id v20 = a6;
  id v21 = a3;
  id v22 = _Block_copy(aBlock);
  uint64_t v23 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v22];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v25[3] = &unk_1E56E4710;
  id v26 = v18;
  id v24 = v18;
  [v23 pendingTransactionsForTransactionSourceIdentifiers:v21 withTransactionSource:a4 withBackingData:a5 startDate:v20 endDate:v19 limit:a8 completion:v25];
}

void __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_135;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_135(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionsWithTransactionSource:(unint64_t)a3 withBackingData:(unint64_t)a4 limit:(int64_t)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v12 = v11;
  void aBlock[4] = self;
  id v19 = v12;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_2;
  v16[3] = &unk_1E56E46E8;
  v16[4] = self;
  id v17 = v12;
  id v15 = v12;
  [v14 transactionsWithTransactionSource:a3 withBackingData:a4 limit:a5 completion:v16];
}

void __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_136;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_136(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  BOOL v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)transactionWithTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E4DC0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 transactionWithTransactionIdentifier:v9 completion:v13];
}

void __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_137;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_137(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)transactionsWithTransactionIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentService_transactionsWithTransactionIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  id v13 = v7;
  SEL v14 = a2;
  void aBlock[4] = self;
  id v8 = v7;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  [v11 transactionsWithTransactionIdentifiers:v9 completion:v8];
}

void __70__PKPaymentService_transactionsWithTransactionIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPaymentService_transactionsWithTransactionIdentifiers_completion___block_invoke_138;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __70__PKPaymentService_transactionsWithTransactionIdentifiers_completion___block_invoke_138(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)transactionsWithFullPaymentHashes:(id)a3 transactionSourceIdentifiers:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPaymentService_transactionsWithFullPaymentHashes_transactionSourceIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  id v16 = v9;
  SEL v17 = a2;
  void aBlock[4] = self;
  id v10 = v9;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  SEL v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  [v14 transactionsWithFullPaymentHashes:v12 transactionSourceIdentifiers:v11 completion:v10];
}

void __94__PKPaymentService_transactionsWithFullPaymentHashes_transactionSourceIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKPaymentService_transactionsWithFullPaymentHashes_transactionSourceIdentifiers_completion___block_invoke_139;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __94__PKPaymentService_transactionsWithFullPaymentHashes_transactionSourceIdentifiers_completion___block_invoke_139(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)transactionSourceTypeForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56DE048;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 transactionSourceTypeForTransactionSourceIdentifier:v9 completion:v13];
}

void __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_140;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_140(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_3;
  v6[3] = &unk_1E56D8590;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = a2;
  void v6[4] = *(void *)(a1 + 32);
  id v5 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v10 = v5;
  dispatch_async(v4, block);
}

uint64_t __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56E4DC0;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 transactionWithServiceIdentifier:v12 transactionSourceIdentifier:v11 completion:v16];
}

void __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_142;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_142(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E4DC0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 transactionWithReferenceIdentifier:v9 completion:v13];
}

void __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_143;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_143(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E46E8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 installmentTransactionsForInstallmentPlanIdentifier:v9 completion:v13];
}

void __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_144;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_144(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)installmentPlansWithTransactionReferennceIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v17 = a2;
    id v9 = v7;
    void aBlock[4] = self;
    id v16 = v9;
    id v10 = a3;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E56E46E8;
    void v13[4] = self;
    id v14 = v9;
    [v12 installmentPlansWithTransactionReferenceIdentifier:v10 completion:v13];
  }
}

void __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke_145;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9
{
  BOOL v12 = a5;
  id v17 = a9;
  id v18 = v17;
  if (v17)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v31 = a2;
    unint64_t v25 = a6;
    id v19 = v17;
    void aBlock[4] = self;
    id v30 = v19;
    id v20 = a8;
    id v21 = a7;
    id v22 = a4;
    id v23 = a3;
    id v26 = _Block_copy(aBlock);
    id v24 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v26];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke_2;
    v27[3] = &unk_1E56E46E8;
    v27[4] = self;
    id v28 = v19;
    [v24 installmentPlanTransactionsForTransactionSourceIdentifiers:v23 accountIdentifier:v22 redeemed:v12 withRedemptionType:v25 startDate:v21 endDate:v20 completion:v27];
  }
}

void __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke_146;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke_146(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)transactionsForRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__PKPaymentService_transactionsForRequest_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v17 = a2;
    id v9 = v7;
    void aBlock[4] = self;
    id v16 = v9;
    id v10 = a3;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__PKPaymentService_transactionsForRequest_completion___block_invoke_2;
    v13[3] = &unk_1E56D89C8;
    void v13[4] = self;
    id v14 = v9;
    [v12 transactionsForRequest:v10 completion:v13];
  }
}

void __54__PKPaymentService_transactionsForRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PKPaymentService_transactionsForRequest_completion___block_invoke_147;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __54__PKPaymentService_transactionsForRequest_completion___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __54__PKPaymentService_transactionsForRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)transactionsForRequest:(id)a3
{
  id v4 = a3;
  if ((unint64_t)([v4 limit] - 11) > 0xFFFFFFFFFFFFFFF5)
  {
    id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
    *(void *)long long buf = 0;
    id v10 = buf;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__26;
    uint64_t v13 = __Block_byref_object_dispose__26;
    id v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__PKPaymentService_transactionsForRequest___block_invoke;
    v8[3] = &unk_1E56DD778;
    void v8[4] = self;
    void v8[5] = buf;
    [v5 transactionsForRequest:v4 completion:v8];
    id v6 = *((id *)v10 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Synchronous transaction request asking for too many transactions", buf, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

void __43__PKPaymentService_transactionsForRequest___block_invoke(uint64_t a1, void *a2)
{
}

- (void)transactionsTotalAmountForRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v17 = a2;
    id v9 = v7;
    void aBlock[4] = self;
    id v16 = v9;
    id v10 = a3;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke_2;
    v13[3] = &unk_1E56E4738;
    void v13[4] = self;
    id v14 = v9;
    [v12 transactionsTotalAmountForRequest:v10 completion:v13];
  }
}

void __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke_148;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  unint64_t v25 = __Block_byref_object_copy__26;
  id v26 = __Block_byref_object_dispose__26;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __117__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type___block_invoke;
  v21[3] = &unk_1E56DD778;
  v21[4] = self;
  void v21[5] = &v22;
  [v18 cashbackByPeriodForTransactionSourceIdentifiers:v14 withStartDate:v15 endDate:v16 calendar:v17 calendarUnit:a7 type:a8 completion:v21];
  id v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

void __117__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type___block_invoke(uint64_t a1, void *a2)
{
}

- (void)logoImageDataForURL:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKPaymentService_logoImageDataForURL_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v17 = a2;
    id v9 = v7;
    void aBlock[4] = self;
    id v16 = v9;
    id v10 = a3;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__PKPaymentService_logoImageDataForURL_completion___block_invoke_2;
    v13[3] = &unk_1E56DE7B8;
    void v13[4] = self;
    id v14 = v9;
    [v12 logoImageDataForURL:v10 completion:v13];
  }
}

void __51__PKPaymentService_logoImageDataForURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PKPaymentService_logoImageDataForURL_completion___block_invoke_150;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __51__PKPaymentService_logoImageDataForURL_completion___block_invoke_150(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __51__PKPaymentService_logoImageDataForURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)transactionsForPredicate:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v19 = a2;
    id v11 = v9;
    void aBlock[4] = self;
    id v18 = v11;
    id v12 = a3;
    uint64_t v13 = _Block_copy(aBlock);
    id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke_2;
    v15[3] = &unk_1E56D89C8;
    void v15[4] = self;
    id v16 = v11;
    [v14 transactionsForPredicate:v12 limit:a4 completion:v15];
  }
}

void __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke_152;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke_152(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Received transactions: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)passUniqueIdentifierForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D89A0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 passUniqueIdentifierForTransactionWithIdentifier:v9 completion:v13];
}

void __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_153;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_153(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)passUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D89A0;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 passUniqueIdentifierForTransactionWithServiceIdentifier:v12 transactionSourceIdentifier:v11 completion:v16];
}

void __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_154;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_154(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D89A0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:v9 completion:v13];
}

void __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_155;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_155(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)mapsMerchantsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  void aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56E46E8;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 mapsMerchantsWithCompletion:v10];
}

void __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_156;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_156(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __54__PKPaymentService_applicationMessagesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tappedApplicationMessageWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v5 usingSynchronousProxy:1 tappedApplicationMessageWithKey:v4 completion:&__block_literal_global_158];
}

- (void)updateFinanceKitApplicationMessages
{
  id v2 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v2 usingSynchronousProxy:1 updateFinanceKitApplicationMessagesWithCompletion:&__block_literal_global_160];
}

- (void)removeApplicationMessageWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v5 usingSynchronousProxy:1 removeApplicationMessageWithKey:v4 completion:&__block_literal_global_162_1];
}

- (void)removeApplicationMessagesWithKeys:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKPaymentService_removeApplicationMessagesWithKeys_completion___block_invoke;
  v13[3] = &unk_1E56D8388;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PKPaymentService_removeApplicationMessagesWithKeys_completion___block_invoke_2;
  v11[3] = &unk_1E56D8360;
  id v12 = v7;
  id v10 = v7;
  [v9 usingSynchronousProxy:0 removeApplicationMessagesWithKeys:v8 completion:v11];
}

uint64_t __65__PKPaymentService_removeApplicationMessagesWithKeys_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __65__PKPaymentService_removeApplicationMessagesWithKeys_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E46E8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 messagesForPaymentPassWithUniqueIdentifier:v9 handler:v13];
}

void __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_163;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_163(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)tilesForPassWithUniqueIdentifier:(id)a3 context:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v8)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__PKPaymentService_tilesForPassWithUniqueIdentifier_context_completion___block_invoke;
      v15[3] = &unk_1E56D8388;
      id v11 = v9;
      id v16 = v11;
      id v12 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithErrorHandler:v15];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __72__PKPaymentService_tilesForPassWithUniqueIdentifier_context_completion___block_invoke_2;
      v13[3] = &unk_1E56D89C8;
      void v13[4] = self;
      id v14 = v11;
      [v12 usingSynchronousProxy:0 tilesForPassWithUniqueIdentifer:v8 context:a4 completion:v13];
    }
    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

uint64_t __72__PKPaymentService_tilesForPassWithUniqueIdentifier_context_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__PKPaymentService_tilesForPassWithUniqueIdentifier_context_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)tilesForPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E46E8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 balancesForPaymentPassWithUniqueIdentifier:v9 handler:v13];
}

void __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_164;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_164(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D89C8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 plansForPaymentPassWithUniqueIdentifier:v9 handler:v13];
}

void __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_165;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_165(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)balanceReminderThresholdForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v23 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v22 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  id v15 = [v12 identifiers];

  id v16 = [v15 anyObject];
  SEL v17 = [v11 uniqueID];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_2;
  v19[3] = &unk_1E56E4760;
  v19[4] = self;
  id v20 = v10;
  id v18 = v10;
  [v14 balanceReminderThresholdForBalanceIdentifier:v16 withPassUniqueIdentifier:v17 handler:v19];
}

void __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_166;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_166(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v26 = a2;
  id v12 = v11;
  void aBlock[4] = self;
  id v25 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = _Block_copy(aBlock);
  SEL v17 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v16];
  id v18 = [v14 identifiers];

  id v19 = [v18 anyObject];
  id v20 = [v13 uniqueID];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_2;
  v22[3] = &unk_1E56D8798;
  v22[4] = self;
  id v23 = v12;
  id v21 = v12;
  [v17 setBalanceReminder:v15 forBalanceIdentifier:v19 withPassUniqueIdentifier:v20 handler:v22];
}

void __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_168;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_168(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_2;
  v16[3] = &unk_1E56D8798;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 cancelAutoTopUpForPassWithUniqueIdentifier:v12 balanceIdentifiers:v11 handler:v16];
}

void __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_169;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_169(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)commutePlanReminderForCommputePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v22 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v21 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  id v15 = [v12 identifier];

  id v16 = [v11 uniqueID];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_2;
  v18[3] = &unk_1E56E4788;
  v18[4] = self;
  id v19 = v10;
  id v17 = v10;
  [v14 commutePlanReminderForCommutePlanIdentifier:v15 withPassUniqueIdentifier:v16 handler:v18];
}

void __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_170;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_170(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v25 = a2;
  id v12 = v11;
  void aBlock[4] = self;
  id v24 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = _Block_copy(aBlock);
  id v17 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v16];
  id v18 = [v14 identifier];

  id v19 = [v13 uniqueID];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_2;
  v21[3] = &unk_1E56D8798;
  v21[4] = self;
  id v22 = v12;
  id v20 = v12;
  [v17 setCommutePlanReminder:v15 forCommutePlanIdentifier:v18 withPassUniqueIdentifier:v19 handler:v21];
}

void __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_172;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_172(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v5 deletePaymentTransactionWithIdentifier:v4 handler:&__block_literal_global_174];
}

- (void)deletePaymentTransactionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v5 deletePaymentTransactionsWithIdentifiers:v4 handler:&__block_literal_global_176_0];
}

- (void)deleteAllTransactionsForTransactionSourceIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v5 deleteAllTransactionsForTransactionSourceIdentifiers:v4 handler:&__block_literal_global_178];
}

- (void)deleteMessagesForPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v5 deleteAllMessagesForPaymentPassWithUniqueIdentifier:v4 handler:&__block_literal_global_180];
}

- (void)archiveMessageWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v5 archiveMessageWithIdentifier:v4 handler:&__block_literal_global_182_0];
}

- (void)insertOrUpdateValueAddedServiceTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentTransaction:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke;
  v20[3] = &unk_1E56D8590;
  SEL v22 = a2;
  id v12 = v11;
  v20[4] = self;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_2;
  v18[3] = &unk_1E56D83D8;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 insertOrUpdateValueAddedServiceTransaction:v15 forPassUniqueIdentifier:v14 paymentTransaction:v13 handler:v18];
}

void __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_183;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_183(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_2(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_3;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)valueAddedServiceTransactionsForPassWithUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_2;
  v15[3] = &unk_1E56E46E8;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 valueAddedServiceTransactionsForPassWithUniqueIdentifier:v11 limit:a4 handler:v15];
}

void __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_184;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_184(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)valueAddedServiceTransactionsForPaymentTransaction:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v18 = a2;
  id v9 = v8;
  void aBlock[4] = self;
  id v17 = v9;
  id v10 = a3;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_2;
  v14[3] = &unk_1E56E46E8;
  void v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [v12 valueAddedServiceTransactionsForPaymentTransaction:v10 handler:v14];
}

void __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_185;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_185(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)valueAddedServiceTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E47B0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 valueAddedServiceTransactionWithIdentifier:v9 handler:v13];
}

void __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_186;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_186(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56E47D8;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 setDefaultPaymentApplication:v12 forPassUniqueIdentifier:v11 handler:v16];
}

void __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_188;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_188(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__26;
  uint64_t v13 = __Block_byref_object_dispose__26;
  id v14 = 0;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentService_defaultPaymentApplicationForPassUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E56E4800;
  void v8[4] = &v9;
  [v5 defaultPaymentApplicationForPassUniqueIdentifier:v4 handler:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __69__PKPaymentService_defaultPaymentApplicationForPassUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (void)initializeSecureElementIfNecessaryWithCompletion:(id)a3
{
  id v5 = a3;
  if (PKSecureElementIsAvailable())
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v14 = a2;
    id v6 = v5;
    void aBlock[4] = self;
    id v13 = v6;
    id v7 = _Block_copy(aBlock);
    id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56E4850;
    void v10[4] = self;
    id v11 = v6;
    [v8 initializeSecureElementIfNecessaryWithHandler:v10];
  }
  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "This device does not have a secure element", buf, 2u);
    }

    if (v5) {
      (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    }
  }
}

void __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_191;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_191(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, 0);
  }
  return result;
}

void __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_3;
  v14[3] = &unk_1E56E4828;
  id v10 = *(id *)(a1 + 40);
  char v19 = a2;
  id v15 = v7;
  id v16 = v8;
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v10;
  id v11 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v21 = v11;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v9, block);
}

uint64_t __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

- (void)initializeSecureElement:(id)a3
{
  id v5 = a3;
  if (PKSecureElementIsAvailable())
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PKPaymentService_initializeSecureElement___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v14 = a2;
    id v6 = v5;
    void aBlock[4] = self;
    id v13 = v6;
    id v7 = _Block_copy(aBlock);
    id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__PKPaymentService_initializeSecureElement___block_invoke_2;
    v10[3] = &unk_1E56D8798;
    void v10[4] = self;
    id v11 = v6;
    [v8 initializeSecureElement:v10];
  }
  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "This device does not have a secure element", buf, 2u);
    }

    if (v5) {
      (*((void (**)(id, void))v5 + 2))(v5, 0);
    }
  }
}

void __44__PKPaymentService_initializeSecureElement___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PKPaymentService_initializeSecureElement___block_invoke_193;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __44__PKPaymentService_initializeSecureElement___block_invoke_193(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __44__PKPaymentService_initializeSecureElement___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PKPaymentService_initializeSecureElement___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __44__PKPaymentService_initializeSecureElement___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)sanitizeExpressPasses
{
  id v2 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v2 sanitizeExpressPasses];
}

- (id)defaultExpressFelicaTransitPassIdentifier
{
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentService: DEPRECATED METHOD defaultExpressFelicaTransitPassIdentifier NO LONGER IMPLEMENTED.", v4, 2u);
  }

  return 0;
}

- (void)setDefaultExpressFelicaTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  SEL v14 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke_2;
  v16[3] = &unk_1E56E4878;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 setDefaultExpressTransitPassIdentifier:v12 withCredential:v11 completion:v16];
}

void __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke_194;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

void __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke_194(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) defaultExpressTransitPassIdentifier];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

uint64_t __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)defaultExpressTransitPassIdentifier
{
  id v2 = [(PKPaymentService *)self expressPassConfigurationsWithCardType:2];
  id v3 = [v2 anyObject];
  id v4 = [v3 passUniqueIdentifier];

  return v4;
}

- (void)setDefaultExpressTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  SEL v14 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke_2;
  v16[3] = &unk_1E56E4878;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 setDefaultExpressTransitPassIdentifier:v12 withCredential:v11 completion:v16];
}

void __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke_196;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

void __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke_196(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) defaultExpressTransitPassIdentifier];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

uint64_t __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isExpressModeEnabledForRemotePassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[PKPassLibrary sharedInstanceWithRemoteLibrary];
  id v6 = [v5 _remoteLibrary];
  id v7 = [v6 passWithUniqueID:v4];
  id v8 = [v7 secureElementPass];

  if ([v8 isRemotePass])
  {
    uint64_t v13 = 0;
    SEL v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v9 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__PKPaymentService_isExpressModeEnabledForRemotePassUniqueIdentifier___block_invoke;
    v12[3] = &unk_1E56DC988;
    void v12[4] = self;
    void v12[5] = &v13;
    [v9 isExpressModeEnabledForRemotePassUniqueIdentifier:v4 handler:v12];
    BOOL v10 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __70__PKPaymentService_isExpressModeEnabledForRemotePassUniqueIdentifier___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (BOOL)isExpressModeEnabledForPassUniqueIdentifier:(id)a3
{
  id v3 = [(PKPaymentService *)self expressPassConfigurationWithPassUniqueIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)expressPassConfigurationWithPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__26;
  uint64_t v13 = __Block_byref_object_dispose__26;
  id v14 = 0;
  id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentService_expressPassConfigurationWithPassUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E56E48A0;
  void v8[4] = self;
  void v8[5] = &v9;
  [v5 expressPassConfigurationWithPassUniqueIdentifier:v4 handler:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __69__PKPaymentService_expressPassConfigurationWithPassUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (id)expressPassConfigurationsWithCardType:(int64_t)a3
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__26;
  uint64_t v13 = __Block_byref_object_dispose__26;
  id v14 = 0;
  id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PKPaymentService_expressPassConfigurationsWithCardType___block_invoke;
  v8[3] = &unk_1E56DE8D0;
  void v8[4] = self;
  void v8[5] = &v9;
  [v5 expressPassConfigurationsWithCardType:a3 handler:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __58__PKPaymentService_expressPassConfigurationsWithCardType___block_invoke(uint64_t a1, void *a2)
{
}

- (id)expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__26;
  uint64_t v13 = __Block_byref_object_dispose__26;
  id v14 = 0;
  id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PKPaymentService_expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke;
  v8[3] = &unk_1E56DE8D0;
  void v8[4] = self;
  void v8[5] = &v9;
  [v5 expressPassesInformationWithAutomaticSelectionTechnologyType:a3 handler:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __81__PKPaymentService_expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke(uint64_t a1, void *a2)
{
}

- (id)expressPassConfigurations
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__26;
  uint64_t v11 = __Block_byref_object_dispose__26;
  id v12 = 0;
  id v3 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PKPaymentService_expressPassConfigurations__block_invoke;
  v6[3] = &unk_1E56DE8D0;
  void v6[4] = self;
  void v6[5] = &v7;
  [v3 usingSynchronousProxy:1 expressPassConfigurationsWithHandler:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __45__PKPaymentService_expressPassConfigurations__block_invoke(uint64_t a1, void *a2)
{
}

- (id)expressPassesInformation
{
  id v2 = [(PKPaymentService *)self expressPassConfigurations];
  id v3 = objc_msgSend(v2, "pk_setByApplyingBlock:", &__block_literal_global_201);

  return v3;
}

uint64_t __44__PKPaymentService_expressPassesInformation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 passInformation];
}

- (id)expressPassInformationForMode:(id)a3
{
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentService: DEPRECATED METHOD expressPassInformationForMode: NO LONGER IMPLEMENTED.", v5, 2u);
  }

  return 0;
}

void __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke_202;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  BOOL v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke_202(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v17 = a2;
    id v10 = v8;
    void aBlock[4] = self;
    id v16 = v10;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke_2;
    v13[3] = &unk_1E56E46E8;
    void v13[4] = self;
    id v14 = v10;
    [v12 conflictingExpressPassIdentifiersForPassInformation:v7 withCompletion:v13];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke_203;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke_203(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && [v10 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v19 = a2;
    id v12 = v11;
    void aBlock[4] = self;
    id v18 = v12;
    uint64_t v13 = _Block_copy(aBlock);
    id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke_2;
    v15[3] = &unk_1E56E46E8;
    void v15[4] = self;
    id v16 = v12;
    [v14 conflictingExpressPassIdentifiersForPassConfiguration:v9 withReferenceExpressState:v10 completion:v15];
  }
  else
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

void __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke_204;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke_204(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && [v10 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v19 = a2;
    id v12 = v11;
    void aBlock[4] = self;
    id v18 = v12;
    uint64_t v13 = _Block_copy(aBlock);
    id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke_2;
    v15[3] = &unk_1E56E46E8;
    void v15[4] = self;
    id v16 = v12;
    [v14 conflictingExpressPassIdentifiersForPassInformation:v9 withReferenceExpressState:v10 completion:v15];
  }
  else
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

void __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke_205;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke_205(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v20 = a2;
    id v13 = v11;
    void aBlock[4] = self;
    id v19 = v13;
    id v14 = _Block_copy(aBlock);
    uint64_t v15 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v14];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke_2;
    v16[3] = &unk_1E56E48E8;
    v16[4] = self;
    id v17 = v13;
    [v15 setExpressWithPassConfiguration:v9 credential:v10 completion:v16];
  }
  else if (v11)
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
}

void __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke_206;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke_206(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PKPaymentService_setExpressWithPassInformation_credential_completion___block_invoke;
  v10[3] = &unk_1E56E4910;
  id v11 = v8;
  id v9 = v8;
  [(PKPaymentService *)self setExpressWithPassInformation:a3 credential:a4 handler:v10];
}

void __72__PKPaymentService_setExpressWithPassInformation_credential_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = [a3 anyObject];
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v5);
  }
}

- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v20 = a2;
    id v13 = v11;
    void aBlock[4] = self;
    id v19 = v13;
    id v14 = _Block_copy(aBlock);
    uint64_t v15 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v14];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke_2;
    v16[3] = &unk_1E56E48E8;
    v16[4] = self;
    id v17 = v13;
    [v15 setExpressWithPassInformation:v9 credential:v10 completion:v16];
  }
  else if (v11)
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
}

void __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke_208;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke_208(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeExpressPassesWithCardType:(int64_t)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v16 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v15 = v8;
  id v9 = _Block_copy(aBlock);
  id v10 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke_2;
  v12[3] = &unk_1E56E48E8;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 removeExpressPassesWithCardType:a3 completion:v12];
}

void __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke_209;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke_209(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeExpressPassWithUniqueIdentifierV2:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v17 = a2;
    id v10 = v8;
    void aBlock[4] = self;
    id v16 = v10;
    id v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke_2;
    v13[3] = &unk_1E56E48E8;
    void v13[4] = self;
    id v14 = v10;
    [v12 removeExpressPassWithUniqueIdentifier:v7 completion:v13];
  }
  else if (v8)
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

void __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke_210;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke_210(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v17 = a2;
    id v10 = v8;
    void aBlock[4] = self;
    id v16 = v10;
    id v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E56E48E8;
    void v13[4] = self;
    id v14 = v10;
    [v12 removeExpressPassWithUniqueIdentifier:v7 completion:v13];
  }
  else if (v8)
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

void __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_211;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_211(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(a3, "pk_setByApplyingBlock:", &__block_literal_global_213_0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v5);
  }
}

uint64_t __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 passInformation];
}

- (void)isPassExpressWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v16 = a2;
  id v9 = v8;
  void aBlock[4] = self;
  id v15 = v9;
  id v10 = _Block_copy(aBlock);
  if (v9)
  {
    if (v7)
    {
      id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke_2;
      v12[3] = &unk_1E56D8798;
      void v12[4] = self;
      id v13 = v9;
      [v11 isPassExpressWithUniqueIdentifier:v7 completion:v12];
    }
    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

void __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke_214;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke_214(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)processTransitTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7
{
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __149__PKPaymentService_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState___block_invoke;
  SEL v22 = &unk_1E56DE608;
  id v23 = self;
  SEL v24 = a2;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  SEL v17 = _Block_copy(&v19);
  id v18 = -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v17, v19, v20, v21, v22, v23, v24);
  [v18 processTransitTransactionEventWithHistory:v16 transactionDate:v15 forPaymentApplication:v14 withPassUniqueIdentifier:v13 expressTransactionState:v12];
}

void __149__PKPaymentService_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __149__PKPaymentService_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState___block_invoke_215;
  v6[3] = &unk_1E56D8AE0;
  void v6[4] = *(void *)(a1 + 32);
  id v5 = v6;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v8 = __dispatch_async_ar_block_invoke_8;
  id v9 = &unk_1E56D8360;
  id v10 = v5;
  dispatch_async(v4, &buf);
}

- (void)recordPaymentApplicationUsageForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4
{
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __102__PKPaymentService_recordPaymentApplicationUsageForPassUniqueIdentifier_paymentApplicationIdentifier___block_invoke;
  id v13 = &unk_1E56DE608;
  id v14 = self;
  SEL v15 = a2;
  id v6 = a4;
  id v7 = a3;
  id v8 = _Block_copy(&v10);
  id v9 = -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v8, v10, v11, v12, v13, v14, v15);
  [v9 recordPaymentApplicationUsageForPassUniqueIdentifier:v7 paymentApplicationIdentifier:v6];
}

void __102__PKPaymentService_recordPaymentApplicationUsageForPassUniqueIdentifier_paymentApplicationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__PKPaymentService_recordPaymentApplicationUsageForPassUniqueIdentifier_paymentApplicationIdentifier___block_invoke_216;
  v6[3] = &unk_1E56D8AE0;
  void v6[4] = *(void *)(a1 + 32);
  id v5 = v6;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v8 = __dispatch_async_ar_block_invoke_8;
  id v9 = &unk_1E56D8360;
  id v10 = v5;
  dispatch_async(v4, &buf);
}

- (id)allPaymentApplicationUsageSummaries
{
  id v2 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__26;
  id v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PKPaymentService_allPaymentApplicationUsageSummaries__block_invoke;
  v5[3] = &unk_1E56D86F8;
  void v5[4] = &v6;
  [v2 allPaymentApplicationUsageSummariesWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__PKPaymentService_allPaymentApplicationUsageSummaries__block_invoke(uint64_t a1, void *a2)
{
}

- (void)simulateDefaultExpressTransitPassIdentifier:(id)a3 forExpressMode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v8 simulateDefaultExpressTransitPassIdentifier:v7 forExpressMode:v6 handler:&__block_literal_global_218];
}

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_2;
  v16[3] = &unk_1E56E4938;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 transitStateWithPassUniqueIdentifier:v12 paymentApplication:v11 handler:v16];
}

void __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_219;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_219(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)simulatePaymentPush
{
}

- (void)simulateNotificationOfType:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:0];
  [v7 simulateNotificationOfType:a3 userInfo:v6 handler:&__block_literal_global_225];
}

- (void)simulatePaymentPushTopic:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v5 simulatePaymentPushTopic:v4 handler:&__block_literal_global_227_0];
}

- (void)simulateVehicleInitiatedPairingWithTCIs:(id)a3 brandCode:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v7 simulateVehicleInitiatedPairingWithTCIs:v6 brandCode:a4 handler:&__block_literal_global_229];
}

- (void)downloadAllPaymentPasses
{
  id v2 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  [v2 downloadAllPaymentPassesWithHandler:&__block_literal_global_231];
}

- (void)consistencyCheck
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PKPaymentService_consistencyCheck__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  void v5[4] = a2;
  id v3 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PKPaymentService_consistencyCheck__block_invoke_233;
  v4[3] = &unk_1E56D8AE0;
  v4[4] = self;
  [v3 consistencyCheckWithHandler:v4];
}

void __36__PKPaymentService_consistencyCheck__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)scheduleSetupReminders
{
  id v2 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v2 scheduleSetupReminders:&__block_literal_global_235];
}

- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3
{
  id v4 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v4 scheduleDeviceCheckInWithStartTimeOffset:a3];
}

- (void)unscheduleDeviceCheckIn
{
  id v2 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v2 unscheduleDeviceCheckIn];
}

- (void)unscheduleDeviceUpgradeTaskActivity
{
  id v2 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v2 unscheduleDeviceUpgradeTaskActivity];
}

- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v4 scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:v3];
}

- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v9 setDeviceUpgradeTasksContextBuildVersion:v8 upgradeTaskVersion:a4 retryCount:a5];
}

- (void)removeProductsCache
{
  id v2 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v2 removeProductsCache];
}

- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__PKPaymentService_requestNotificationAuthorizationIfNecessaryWithCompletion___block_invoke;
  v11[3] = &unk_1E56D8590;
  SEL v13 = a2;
  id v6 = v5;
  void v11[4] = self;
  id v12 = v6;
  id v7 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PKPaymentService_requestNotificationAuthorizationIfNecessaryWithCompletion___block_invoke_236;
  v9[3] = &unk_1E56D8928;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 requestNotificationAuthorizationIfNecessaryWithCompletion:v9];
}

uint64_t __78__PKPaymentService_requestNotificationAuthorizationIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __78__PKPaymentService_requestNotificationAuthorizationIfNecessaryWithCompletion___block_invoke_236(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__PKPaymentService_requestNotificationAuthorizationWithCompletion___block_invoke;
  v11[3] = &unk_1E56D8590;
  SEL v13 = a2;
  id v6 = v5;
  void v11[4] = self;
  id v12 = v6;
  uint64_t v7 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PKPaymentService_requestNotificationAuthorizationWithCompletion___block_invoke_237;
  v9[3] = &unk_1E56D8928;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 requestNotificationAuthorizationWithCompletion:v9];
}

uint64_t __67__PKPaymentService_requestNotificationAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __67__PKPaymentService_requestNotificationAuthorizationWithCompletion___block_invoke_237(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__PKPaymentService_userNotificationActionPerformed_applicationMessageContentIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56DE608;
  void v15[4] = self;
  void v15[5] = a2;
  id v10 = a4;
  id v11 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__PKPaymentService_userNotificationActionPerformed_applicationMessageContentIdentifier_completion___block_invoke_238;
  v13[3] = &unk_1E56D83D8;
  void v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [v11 userNotificationActionPerformed:a3 applicationMessageContentIdentifier:v10 completion:v13];
}

void __99__PKPaymentService_userNotificationActionPerformed_applicationMessageContentIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

uint64_t __99__PKPaymentService_userNotificationActionPerformed_applicationMessageContentIdentifier_completion___block_invoke_238(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__PKPaymentService_userNotificationActionPerformed_notificationIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56DE608;
  void v15[4] = self;
  void v15[5] = a2;
  id v10 = a4;
  id v11 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__PKPaymentService_userNotificationActionPerformed_notificationIdentifier_completion___block_invoke_239;
  v13[3] = &unk_1E56D83D8;
  void v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [v11 userNotificationActionPerformed:a3 notificationIdentifier:v10 completion:v13];
}

void __86__PKPaymentService_userNotificationActionPerformed_notificationIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

uint64_t __86__PKPaymentService_userNotificationActionPerformed_notificationIdentifier_completion___block_invoke_239(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)passbookUIServiceDidLaunch
{
  id v2 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v2 passbookUIServiceDidLaunch:&__block_literal_global_241];
}

- (void)simulateExpressTransactionForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  [v5 simulateExpressTransactionForPassUniqueIdentifier:v4 withCompletion:&__block_literal_global_243];
}

- (void)handleStandaloneTransaction:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
    [v5 usingSynchronousProxy:1 handleStandaloneTransaction:v4 withCompletion:&__block_literal_global_245_0];
  }
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PKPaymentService_startBackgroundVerificationObserverForPass_verificationMethod___block_invoke;
  v9[3] = &__block_descriptor_40_e5_v8__0l;
  void v9[4] = a2;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v9];
  [v8 startBackgroundVerificationObserverForPass:v7 verificationMethod:v6];
}

void __82__PKPaymentService_startBackgroundVerificationObserverForPass_verificationMethod___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (BOOL)hasPaymentDeviceFieldProperties
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  if ((v3 & 1) == 0) {
    id v4 = [(PKPaymentService *)self paymentDeviceFieldProperties];
  }
  return self->_hasPaymentDeviceFieldProperties;
}

- (PKFieldProperties)paymentDeviceFieldProperties
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__26;
  id v12 = __Block_byref_object_dispose__26;
  id v13 = 0;
  unsigned __int8 v3 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PKPaymentService_paymentDeviceFieldProperties__block_invoke;
  v7[3] = &unk_1E56E4960;
  v7[4] = &v8;
  [v3 paymentDeviceFieldPropertiesWithHandler:v7];
  id v4 = v9;
  self->_hasPaymentDeviceFieldProperties = v9[5] != 0;
  atomic_store(1u, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  id v5 = (id)v4[5];

  _Block_object_dispose(&v8, 8);
  return (PKFieldProperties *)v5;
}

void __48__PKPaymentService_paymentDeviceFieldProperties__block_invoke(uint64_t a1, void *a2)
{
}

- (PKExpressTransactionState)outstandingExpressTransactionState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__26;
  uint64_t v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  id v2 = [(PKPaymentService *)self _extendedSynchronousRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PKPaymentService_outstandingExpressTransactionState__block_invoke;
  v5[3] = &unk_1E56E4988;
  void v5[4] = &v6;
  [v2 outstandingExpressTransactionState:v5];
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return (PKExpressTransactionState *)v3;
}

void __54__PKPaymentService_outstandingExpressTransactionState__block_invoke(uint64_t a1, void *a2)
{
}

- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKPaymentService_setDefaultPaymentPassUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E56D8AE0;
  void v6[4] = self;
  [v5 setDefaultPaymentPassUniqueIdentifier:v4 handler:v6];
}

- (NSString)defaultPaymentPassUniqueIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__26;
  uint64_t v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  id v2 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PKPaymentService_defaultPaymentPassUniqueIdentifier__block_invoke;
  v5[3] = &unk_1E56DDF30;
  void v5[4] = &v6;
  [v2 defaultPaymentPassUniqueIdentifier:v5];
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return (NSString *)v3;
}

void __54__PKPaymentService_defaultPaymentPassUniqueIdentifier__block_invoke(uint64_t a1, void *a2)
{
}

- (void)setSharedPaymentWebServiceContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 deviceID];

    if (!v6)
    {
      id v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v10 = 136315394;
        id v11 = "-[PKPaymentService setSharedPaymentWebServiceContext:]";
        __int16 v12 = 2112;
        id v13 = v8;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "%s archiving context without deviceID: %@", (uint8_t *)&v10, 0x16u);
      }
    }
    id v9 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
    [v9 usingSynchronousProxy:1 setSharedPaymentWebServiceContext:v5 withCompletion:&__block_literal_global_250];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Attempt to set the shared payment web service context to nil. Ignoring.", (uint8_t *)&v10, 2u);
    }
  }
}

void __50__PKPaymentService_sharedPaymentWebServiceContext__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)sharedPaymentWebServiceContextWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke;
    v11[3] = &unk_1E56DE2E8;
    SEL v13 = a2;
    id v7 = v5;
    id v12 = v7;
    uint64_t v8 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke_2;
    v9[3] = &unk_1E56E49D8;
    void v9[4] = self;
    id v10 = v7;
    [v8 usingSynchronousProxy:0 fetchSharedPaymentWebServiceContextWithCompletion:v9];
  }
}

void __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke_254;
  v6[3] = &unk_1E56D8360;
  id v7 = *(id *)(a1 + 32);
  id v5 = v6;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v9 = __dispatch_async_ar_block_invoke_8;
  id v10 = &unk_1E56D8360;
  id v11 = v5;
  dispatch_async(v4, &buf);
}

uint64_t __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke_254(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !self->_forceConnectionOnResume;
  }
  uint64_t v6 = v5;
  if (v5)
  {
    if (!a3 || self->_forceConnectionOnResume) {
      return;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  self->_forceConnectionOnResume = v7;
  remoteService = self->_remoteService;
  [(PKXPCService *)remoteService setForceConnectionOnResume:v6];
}

- (void)updateAllMapsBrandAndMerchantDataWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  void aBlock[4] = self;
  id v13 = v6;
  BOOL v7 = _Block_copy(aBlock);
  uint64_t v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D83D8;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 updateAllMapsBrandAndMerchantDataWithCompletion:v10];
}

void __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke_255;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke_255(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)mapsMerchantWithIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v18 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v17 = v10;
  id v11 = _Block_copy(aBlock);
  id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E56E4A00;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 mapsMerchantWithIdentifier:a3 resultProviderIdentifier:v5 completion:v14];
}

void __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke_256;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke_256(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)rangingSuspensionReasonForAppletSubcredential:(id)a3 forPaymentApplicationID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v8 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID___block_invoke;
  v11[3] = &unk_1E56E4A28;
  void v11[4] = self;
  void v11[5] = &v12;
  [v8 rangingSuspensionReasonForCredential:v6 forPaymentApplicationID:v7 completion:v11];
  unint64_t v9 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __90__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (void)rangingSuspensionReasonForAppletSubcredential:(id)a3 forPaymentApplicationID:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke_2;
  v16[3] = &unk_1E56DE048;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 rangingSuspensionReasonForCredential:v12 forPaymentApplicationID:v11 completion:v16];
}

void __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke_258;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke_258(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setPaymentApplicationRangingSuspensionReason:(unint64_t)a3 forPassUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  [v7 setPaymentApplicationRangingSuspensionReason:a3 forPassUniqueIdentifier:v6 completion:&__block_literal_global_260];
}

- (void)regionsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke;
    v14[3] = &unk_1E56D8590;
    SEL v16 = a2;
    id v9 = v7;
    void v14[4] = self;
    id v15 = v9;
    id v10 = a3;
    id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke_2;
    v12[3] = &unk_1E56D89C8;
    void v12[4] = self;
    id v13 = v9;
    [v11 regionsWithIdentifiers:v10 completion:v12];
  }
}

void __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke_261;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke_261(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, MEMORY[0x1E4F1CBF0]);
  }
  return result;
}

uint64_t __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)regionsMatchingName:(id)a3 types:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke;
    v17[3] = &unk_1E56D8590;
    SEL v19 = a2;
    id v11 = v9;
    v17[4] = self;
    id v18 = v11;
    id v12 = a4;
    id v13 = a3;
    uint64_t v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke_2;
    v15[3] = &unk_1E56D89C8;
    void v15[4] = self;
    id v16 = v11;
    [v14 regionsMatchingName:v13 types:v12 completion:v15];
  }
}

void __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke_262;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke_262(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, MEMORY[0x1E4F1CBF0]);
  }
  return result;
}

uint64_t __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke_2;
  v16[3] = &unk_1E56E4A00;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 merchantForPassUniqueIdentifier:v12 withAuxiliaryPassInformationItem:v11 completion:v16];
}

void __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke_263;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke_263(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)suggestPaymentSafariCredentialImport:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke_2;
  v13[3] = &unk_1E56D8928;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 suggestPaymentSafariCredentialImport:v9 withCompletion:v13];
}

void __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke_264;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke_264(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)notifyForSafariCardImportConsentWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  void aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 notifyForSafariCardImportConsentWithCompletion:v10];
}

void __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke_265;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke_265(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)notifyForSafariCardImportWithCredentials:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke_2;
  v13[3] = &unk_1E56D8928;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 notifyForSafariCardImportWithCredentials:v9 withCompletion:v13];
}

void __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke_266;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke_266(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearSafariCardImportNotificationsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  void aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 clearSafariCardImportNotificationsWithCompletion:v10];
}

void __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke_267;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke_267(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearSafariCardImportNotificationHistoryWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  void aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 clearSafariCardImportNotificationHistoryWithCompletion:v10];
}

void __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke_268;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_8;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke_268(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)generateUnderlyingKeyReportWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPaymentService_generateUnderlyingKeyReportWithCompletion___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = a2;
  id v6 = _Block_copy(aBlock);
  id v7 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PKPaymentService_generateUnderlyingKeyReportWithCompletion___block_invoke_269;
  v9[3] = &unk_1E56E4A50;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 generateUnderlyingKeyReportWithCompletion:v9];
}

void __62__PKPaymentService_generateUnderlyingKeyReportWithCompletion___block_invoke(uint64_t a1)
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

uint64_t __62__PKPaymentService_generateUnderlyingKeyReportWithCompletion___block_invoke_269(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)simulateEnableBiometricsForPass:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPaymentService_simulateEnableBiometricsForPass___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = a2;
  id v4 = a3;
  id v5 = _Block_copy(aBlock);
  uint64_t v6 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v5];
  [v6 simulateEnableBiometricsForPass:v4];
}

void __52__PKPaymentService_simulateEnableBiometricsForPass___block_invoke(uint64_t a1)
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

- (void)simulateDeviceAccessory
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PKPaymentService_simulateDeviceAccessory__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = a2;
  id v3 = _Block_copy(aBlock);
  int v4 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v3];
  [v4 simulateDeviceAccessory];
}

void __43__PKPaymentService_simulateDeviceAccessory__block_invoke(uint64_t a1)
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

- (void)setNFCPayloadState:(unint64_t)a3 forPass:(id)a4
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PKPaymentService_setNFCPayloadState_forPass___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = a2;
  id v6 = a4;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  [v8 setNFCPayloadState:a3 forPass:v6];
}

void __47__PKPaymentService_setNFCPayloadState_forPass___block_invoke(uint64_t a1)
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

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__PKPaymentService_enforceUpgradedPasscodePolicyWithCompletion___block_invoke;
  v11[3] = &unk_1E56DC4C0;
  SEL v13 = a2;
  id v6 = v5;
  id v12 = v6;
  id v7 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PKPaymentService_enforceUpgradedPasscodePolicyWithCompletion___block_invoke_272;
  v9[3] = &unk_1E56D8928;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 enforceUpgradedPasscodePolicyWithCompletion:v9];
}

void __64__PKPaymentService_enforceUpgradedPasscodePolicyWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 1, v5);
  }
}

uint64_t __64__PKPaymentService_enforceUpgradedPasscodePolicyWithCompletion___block_invoke_272(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PKPaymentService_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke;
  v11[3] = &unk_1E56DC4C0;
  SEL v13 = a2;
  id v6 = v5;
  id v12 = v6;
  id v7 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PKPaymentService_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke_273;
  v9[3] = &unk_1E56D8928;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 currentPasscodeMeetsUpgradedPasscodePolicy:v9];
}

void __63__PKPaymentService_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 1, v5);
  }
}

uint64_t __63__PKPaymentService_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke_273(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requiresUpgradedPasscodeWithCompletion:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PKPaymentService_requiresUpgradedPasscodeWithCompletion___block_invoke;
  v11[3] = &unk_1E56DC4C0;
  SEL v13 = a2;
  id v6 = v5;
  id v12 = v6;
  id v7 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PKPaymentService_requiresUpgradedPasscodeWithCompletion___block_invoke_274;
  v9[3] = &unk_1E56D8928;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 requiresUpgradedPasscodeWithCompletion:v9];
}

void __59__PKPaymentService_requiresUpgradedPasscodeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

uint64_t __59__PKPaymentService_requiresUpgradedPasscodeWithCompletion___block_invoke_274(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__PKPaymentService_changePasscodeFrom_toPasscode_completion___block_invoke;
  v17[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  SEL v13 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__PKPaymentService_changePasscodeFrom_toPasscode_completion___block_invoke_275;
  v15[3] = &unk_1E56D8928;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 changePasscodeFrom:v12 toPasscode:v11 completion:v15];
}

void __61__PKPaymentService_changePasscodeFrom_toPasscode_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

uint64_t __61__PKPaymentService_changePasscodeFrom_toPasscode_completion___block_invoke_275(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __107__PKPaymentService_registerAuxiliaryCapabilityForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke;
  v17[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  SEL v13 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __107__PKPaymentService_registerAuxiliaryCapabilityForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_276;
  v15[3] = &unk_1E56D8770;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 registerAuxiliaryCapabilityForPassUniqueIdentifier:v12 sessionExchangeToken:v11 withCompletion:v15];
}

void __107__PKPaymentService_registerAuxiliaryCapabilityForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t __107__PKPaymentService_registerAuxiliaryCapabilityForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_276(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)checkAllAuxiliaryRegistrationRequirements
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__PKPaymentService_checkAllAuxiliaryRegistrationRequirements__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a2;
  id v2 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v3];
  [v2 checkAllAuxiliaryRegistrationRequirements];
}

void __61__PKPaymentService_checkAllAuxiliaryRegistrationRequirements__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__PKPaymentService_invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier_completion___block_invoke;
  v14[3] = &unk_1E56DC4C0;
  SEL v16 = a2;
  id v8 = v7;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PKPaymentService_invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier_completion___block_invoke_277;
  v12[3] = &unk_1E56D83D8;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:v9 completion:v12];
}

uint64_t __96__PKPaymentService_invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __96__PKPaymentService_invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier_completion___block_invoke_277(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__PKPaymentService_fetchBarcodesForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke;
  v17[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__PKPaymentService_fetchBarcodesForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_278;
  v15[3] = &unk_1E56E4A78;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 fetchBarcodesForPassUniqueIdentifier:v12 sessionExchangeToken:v11 withCompletion:v15];
}

void __93__PKPaymentService_fetchBarcodesForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

uint64_t __93__PKPaymentService_fetchBarcodesForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_278(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __107__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_withCompletion___block_invoke;
    v17[3] = &unk_1E56DC4C0;
    SEL v19 = a2;
    id v11 = v9;
    id v18 = v11;
    id v12 = a4;
    id v13 = a3;
    id v14 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __107__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_withCompletion___block_invoke_280;
    v15[3] = &unk_1E56E4AA0;
    void v15[4] = self;
    id v16 = v11;
    [v14 retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:v13 authorization:v12 withCompletion:v15];
  }
}

void __107__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
}

uint64_t __107__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_withCompletion___block_invoke_280(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v11 = a6;
  id v12 = v11;
  if (v11)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __128__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_sessionExchangeToken_withCompletion___block_invoke;
    v20[3] = &unk_1E56DC4C0;
    SEL v22 = a2;
    id v13 = v11;
    id v21 = v13;
    id v14 = a5;
    id v15 = a4;
    id v16 = a3;
    SEL v17 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __128__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_sessionExchangeToken_withCompletion___block_invoke_282;
    v18[3] = &unk_1E56E4AA0;
    v18[4] = self;
    id v19 = v13;
    [v17 retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:v16 authorization:v15 sessionExchangeToken:v14 withCompletion:v18];
  }
}

void __128__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
}

uint64_t __128__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_sessionExchangeToken_withCompletion___block_invoke_282(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_withCompletion___block_invoke;
  v14[3] = &unk_1E56DC4C0;
  SEL v16 = a2;
  id v8 = v7;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_withCompletion___block_invoke_283;
  v12[3] = &unk_1E56D89C8;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 retrievePINEncryptionCertificateForPassUniqueIdentifier:v9 withCompletion:v12];
}

uint64_t __91__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __91__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_withCompletion___block_invoke_283(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke;
  v17[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_284;
  v15[3] = &unk_1E56D89C8;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 retrievePINEncryptionCertificateForPassUniqueIdentifier:v12 sessionExchangeToken:v11 withCompletion:v15];
}

uint64_t __112__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __112__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_284(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__PKPaymentService_processedAuthenticationMechanism_forTransactionIdentifier_completion___block_invoke;
  v16[3] = &unk_1E56DC4C0;
  SEL v18 = a2;
  id v10 = v9;
  id v17 = v10;
  id v11 = a4;
  id v12 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__PKPaymentService_processedAuthenticationMechanism_forTransactionIdentifier_completion___block_invoke_285;
  v14[3] = &unk_1E56D83D8;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 processedAuthenticationMechanism:a3 forTransactionIdentifier:v11 completion:v14];
}

uint64_t __89__PKPaymentService_processedAuthenticationMechanism_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __89__PKPaymentService_processedAuthenticationMechanism_forTransactionIdentifier_completion___block_invoke_285(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__PKPaymentService_markAuthenticationCompleteForTransactionIdentifier_completion___block_invoke;
  v14[3] = &unk_1E56DC4C0;
  SEL v16 = a2;
  id v8 = v7;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PKPaymentService_markAuthenticationCompleteForTransactionIdentifier_completion___block_invoke_286;
  v12[3] = &unk_1E56D83D8;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 markAuthenticationCompleteForTransactionIdentifier:v9 completion:v12];
}

uint64_t __82__PKPaymentService_markAuthenticationCompleteForTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __82__PKPaymentService_markAuthenticationCompleteForTransactionIdentifier_completion___block_invoke_286(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_completion___block_invoke;
  v16[3] = &unk_1E56DC4C0;
  SEL v18 = a2;
  id v10 = v9;
  id v17 = v10;
  id v11 = a4;
  id v12 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_287;
  v14[3] = &unk_1E56E4AC8;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 submitUserConfirmation:v6 forTransactionIdentifier:v11 completion:v14];
}

void __79__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

uint64_t __79__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_287(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v11 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke;
  v19[3] = &unk_1E56DC4C0;
  SEL v21 = a2;
  id v12 = v11;
  id v20 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __100__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke_289;
  v17[3] = &unk_1E56E4AC8;
  void v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  [v15 submitUserConfirmation:v8 forTransactionIdentifier:v14 sessionExchangeToken:v13 completion:v17];
}

void __100__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

uint64_t __100__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke_289(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke;
  v17[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_290;
  v15[3] = &unk_1E56E4AC8;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 submitEncryptedPIN:v12 forTransactionIdentifier:v11 completion:v15];
}

void __75__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

uint64_t __75__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_290(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke;
  v20[3] = &unk_1E56DC4C0;
  SEL v22 = a2;
  id v12 = v11;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke_291;
  v18[3] = &unk_1E56E4AC8;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 submitEncryptedPIN:v15 forTransactionIdentifier:v14 sessionExchangeToken:v13 completion:v18];
}

void __96__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

uint64_t __96__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke_291(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __103__PKPaymentService_submitTransactionSignatureForTransactionIdentifier_sessionExchangeToken_completion___block_invoke;
  v17[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__PKPaymentService_submitTransactionSignatureForTransactionIdentifier_sessionExchangeToken_completion___block_invoke_292;
  v15[3] = &unk_1E56E4AC8;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 submitTransactionSignatureForTransactionIdentifier:v12 sessionExchangeToken:v11 completion:v15];
}

void __103__PKPaymentService_submitTransactionSignatureForTransactionIdentifier_sessionExchangeToken_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

uint64_t __103__PKPaymentService_submitTransactionSignatureForTransactionIdentifier_sessionExchangeToken_completion___block_invoke_292(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_withCompletion___block_invoke;
  v17[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_withCompletion___block_invoke_293;
  v15[3] = &unk_1E56D83D8;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 submitBarcodePaymentEvent:v12 forPassUniqueIdentifier:v11 withCompletion:v15];
}

uint64_t __85__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __85__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_withCompletion___block_invoke_293(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke;
  v20[3] = &unk_1E56DC4C0;
  SEL v22 = a2;
  id v12 = v11;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_294;
  v18[3] = &unk_1E56D83D8;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 submitBarcodePaymentEvent:v15 forPassUniqueIdentifier:v14 sessionExchangeToken:v13 withCompletion:v18];
}

uint64_t __106__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __106__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_294(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke_295(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke_2;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  uint64_t v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

- (void)memberTypeForCurrentUserWithCompletion:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke;
  v11[3] = &unk_1E56DC4C0;
  SEL v13 = a2;
  id v6 = v5;
  id v12 = v6;
  uint64_t v7 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke_296;
  v9[3] = &unk_1E56DE070;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 memberTypeForCurrentUserWithCompletion:v9];
}

uint64_t __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, -1);
  }
  return result;
}

void __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke_296(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke_2;
  v6[3] = &unk_1E56D8590;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = a2;
  void v6[4] = *(void *)(a1 + 32);
  int v5 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v10 = v5;
  dispatch_async(v4, block);
}

uint64_t __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (void)pendingFamilyMembersIgnoringCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke;
  v13[3] = &unk_1E56DC4C0;
  SEL v15 = a2;
  id v8 = v7;
  id v14 = v8;
  id v9 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke_298;
  v11[3] = &unk_1E56D89C8;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 pendingFamilyMembersIgnoringCache:v4 completion:v11];
}

uint64_t __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke_298(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke_2;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  uint64_t v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke;
  v14[3] = &unk_1E56DC4C0;
  SEL v16 = a2;
  id v8 = v7;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke_299;
  v12[3] = &unk_1E56E4A50;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 photosForFamilyMembersWithDSIDs:v9 completion:v12];
}

uint64_t __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke_299(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke_2;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  uint64_t v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)defaultPaymentPassIngestionSpecificIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PKPaymentService_defaultPaymentPassIngestionSpecificIdentifier___block_invoke;
    aBlock[3] = &unk_1E56DC4C0;
    SEL v14 = a2;
    id v7 = v5;
    id v13 = v7;
    id v8 = _Block_copy(aBlock);
    id v9 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:v8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PKPaymentService_defaultPaymentPassIngestionSpecificIdentifier___block_invoke_300;
    v10[3] = &unk_1E56D89A0;
    void v10[4] = self;
    id v11 = v7;
    [v9 defaultPaymentPassIngestionSpecificIdentifier:v10];
  }
}

uint64_t __66__PKPaymentService_defaultPaymentPassIngestionSpecificIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__PKPaymentService_defaultPaymentPassIngestionSpecificIdentifier___block_invoke_300(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPaymentService_featureApplicationsForAccountIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__PKPaymentService_featureApplicationsForAccountIdentifier_completion___block_invoke_301;
  v13[3] = &unk_1E56D89C8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 featureApplicationsForAccountIdentifier:v9 completion:v13];
}

uint64_t __71__PKPaymentService_featureApplicationsForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __71__PKPaymentService_featureApplicationsForAccountIdentifier_completion___block_invoke_301(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateFeatureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPaymentService_updateFeatureApplicationsForAccountIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PKPaymentService_updateFeatureApplicationsForAccountIdentifier_completion___block_invoke_302;
  v13[3] = &unk_1E56DD728;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateFeatureApplicationsForAccountIdentifier:v9 completion:v13];
}

uint64_t __77__PKPaymentService_updateFeatureApplicationsForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __77__PKPaymentService_updateFeatureApplicationsForAccountIdentifier_completion___block_invoke_302(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentService_featureApplicationsForProvisioningWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v14 = a2;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PKPaymentService_featureApplicationsForProvisioningWithCompletion___block_invoke_304;
  v10[3] = &unk_1E56DD728;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 featureApplicationsForProvisioningWithCompletion:v10];
}

uint64_t __69__PKPaymentService_featureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __69__PKPaymentService_featureApplicationsForProvisioningWithCompletion___block_invoke_304(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __78__PKPaymentService_featureApplicationsForAccountUserInvitationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __78__PKPaymentService_featureApplicationsForAccountUserInvitationWithCompletion___block_invoke_305(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)featureApplicationWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PKPaymentService_featureApplicationWithReferenceIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E56DC4C0;
    SEL v17 = a2;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__PKPaymentService_featureApplicationWithReferenceIdentifier_completion___block_invoke_306;
    v13[3] = &unk_1E56E4AF0;
    void v13[4] = self;
    id v14 = v9;
    [v12 featureApplicationWithReferenceIdentifier:v10 completion:v13];
  }
}

uint64_t __73__PKPaymentService_featureApplicationWithReferenceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __73__PKPaymentService_featureApplicationWithReferenceIdentifier_completion___block_invoke_306(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PKPaymentService_augmentedProductForInstallmentConfiguration_experimentDetails_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v20 = a2;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__PKPaymentService_augmentedProductForInstallmentConfiguration_experimentDetails_withCompletion___block_invoke_308;
  v16[3] = &unk_1E56E4B18;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 augmentedProductForInstallmentConfiguration:v12 experimentDetails:v11 withCompletion:v16];
}

uint64_t __97__PKPaymentService_augmentedProductForInstallmentConfiguration_experimentDetails_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __97__PKPaymentService_augmentedProductForInstallmentConfiguration_experimentDetails_withCompletion___block_invoke_308(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)featureApplicationsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKPaymentService_featureApplicationsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v14 = a2;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__PKPaymentService_featureApplicationsWithCompletion___block_invoke_310;
  v10[3] = &unk_1E56D89C8;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 featureApplicationsWithCompletion:v10];
}

uint64_t __54__PKPaymentService_featureApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __54__PKPaymentService_featureApplicationsWithCompletion___block_invoke_310(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)featureApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPaymentService_featureApplicationWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKPaymentService_featureApplicationWithIdentifier_completion___block_invoke_311;
  v13[3] = &unk_1E56E4AF0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 featureApplicationWithIdentifier:v9 completion:v13];
}

uint64_t __64__PKPaymentService_featureApplicationWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __64__PKPaymentService_featureApplicationWithIdentifier_completion___block_invoke_311(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitApplyRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPaymentService_submitApplyRequest_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__PKPaymentService_submitApplyRequest_completion___block_invoke_312;
  v13[3] = &unk_1E56E4B40;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 submitApplyRequest:v9 completion:v13];
}

uint64_t __50__PKPaymentService_submitApplyRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __50__PKPaymentService_submitApplyRequest_completion___block_invoke_312(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitDocumentRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKPaymentService_submitDocumentRequest_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__PKPaymentService_submitDocumentRequest_completion___block_invoke_314;
  v13[3] = &unk_1E56E4B40;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 submitDocumentRequest:v9 completion:v13];
}

uint64_t __53__PKPaymentService_submitDocumentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __53__PKPaymentService_submitDocumentRequest_completion___block_invoke_314(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitVerificationRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PKPaymentService_submitVerificationRequest_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__PKPaymentService_submitVerificationRequest_completion___block_invoke_315;
  v13[3] = &unk_1E56E4B40;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 submitVerificationRequest:v9 completion:v13];
}

uint64_t __57__PKPaymentService_submitVerificationRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __57__PKPaymentService_submitVerificationRequest_completion___block_invoke_315(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitTermsRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPaymentService_submitTermsRequest_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__PKPaymentService_submitTermsRequest_completion___block_invoke_316;
  v13[3] = &unk_1E56E4B40;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 submitTermsRequest:v9 completion:v13];
}

uint64_t __50__PKPaymentService_submitTermsRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __50__PKPaymentService_submitTermsRequest_completion___block_invoke_316(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitDeleteRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentService_submitDeleteRequest_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__PKPaymentService_submitDeleteRequest_completion___block_invoke_317;
  v13[3] = &unk_1E56D8770;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 submitDeleteRequest:v9 completion:v13];
}

uint64_t __51__PKPaymentService_submitDeleteRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __51__PKPaymentService_submitDeleteRequest_completion___block_invoke_317(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitTransactionAnswerForTransaction:(id)a3 questionType:(unint64_t)a4 answer:(id)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentService_submitTransactionAnswerForTransaction_questionType_answer_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v22 = a2;
  id v12 = v11;
  id v21 = v12;
  id v13 = a5;
  id v14 = a3;
  id v15 = _Block_copy(aBlock);
  id v16 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v15];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__PKPaymentService_submitTransactionAnswerForTransaction_questionType_answer_completion___block_invoke_318;
  v18[3] = &unk_1E56D8770;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 submitTransactionAnswerForTransaction:v14 questionType:a4 answer:v13 completion:v18];
}

uint64_t __89__PKPaymentService_submitTransactionAnswerForTransaction_questionType_answer_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __89__PKPaymentService_submitTransactionAnswerForTransaction_questionType_answer_completion___block_invoke_318(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionsRequiringReviewForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_transactionsRequiringReviewForAccountWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PKPaymentService_transactionsRequiringReviewForAccountWithIdentifier_completion___block_invoke_319;
  v13[3] = &unk_1E56E46E8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 transactionsRequiringReviewForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __83__PKPaymentService_transactionsRequiringReviewForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __83__PKPaymentService_transactionsRequiringReviewForAccountWithIdentifier_completion___block_invoke_319(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)categoryVisualizationMagnitudesForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID_completion___block_invoke;
    aBlock[3] = &unk_1E56DC4C0;
    SEL v17 = a2;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = _Block_copy(aBlock);
    id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID_completion___block_invoke_320;
    v13[3] = &unk_1E56E46E8;
    void v13[4] = self;
    id v14 = v9;
    [v12 categoryVisualizationMagnitudesForPassUniqueID:v10 completion:v13];
  }
}

uint64_t __78__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID_completion___block_invoke_320(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)recomputeCategoryVisualizationMangitudesForPassUniqueID:(id)a3 style:(int64_t)a4
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPaymentService_recomputeCategoryVisualizationMangitudesForPassUniqueID_style___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = a2;
  id v6 = a3;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  [v8 recomputeCategoryVisualizationMangitudesForPassUniqueID:v6 style:a4];
}

void __82__PKPaymentService_recomputeCategoryVisualizationMangitudesForPassUniqueID_style___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPaymentService_performDeviceCheckInWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v14 = a2;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PKPaymentService_performDeviceCheckInWithCompletion___block_invoke_321;
  v10[3] = &unk_1E56D8928;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 performDeviceCheckInWithCompletion:v10];
}

uint64_t __55__PKPaymentService_performDeviceCheckInWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __55__PKPaymentService_performDeviceCheckInWithCompletion___block_invoke_321(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPaymentService_setDeviceCheckInContextBuildVersion_outstandingAction_forRegion___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = a2;
  id v8 = a5;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  [v11 setDeviceCheckInContextBuildVersion:v9 outstandingAction:a4 forRegion:v8];
}

void __84__PKPaymentService_setDeviceCheckInContextBuildVersion_outstandingAction_forRegion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)productsWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentService_productsWithRequest_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__PKPaymentService_productsWithRequest_completion___block_invoke_322;
  v13[3] = &unk_1E56E4B68;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 productsWithRequest:v9 completion:v13];
}

uint64_t __51__PKPaymentService_productsWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __51__PKPaymentService_productsWithRequest_completion___block_invoke_322(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)productsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PKPaymentService_productsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v14 = a2;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__PKPaymentService_productsWithCompletion___block_invoke_324;
  v10[3] = &unk_1E56E4B68;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 productsWithCompletion:v10];
}

uint64_t __43__PKPaymentService_productsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __43__PKPaymentService_productsWithCompletion___block_invoke_324(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performProductActionRequest:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_performProductActionRequest_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PKPaymentService_performProductActionRequest_completion___block_invoke_325;
  v13[3] = &unk_1E56E4B68;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 performProductActionRequest:v9 completion:v13];
}

uint64_t __59__PKPaymentService_performProductActionRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __59__PKPaymentService_performProductActionRequest_completion___block_invoke_325(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_storePassOwnershipToken_withIdentifier___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = a2;
  id v6 = a4;
  id v7 = a3;
  id v8 = _Block_copy(aBlock);
  id v9 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v8];
  [v9 storePassOwnershipToken:v7 withIdentifier:v6];
}

void __59__PKPaymentService_storePassOwnershipToken_withIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PKPaymentService_passOwnershipTokenWithIdentifier_completion___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    void aBlock[4] = a2;
    id v8 = a3;
    id v9 = _Block_copy(aBlock);
    id v10 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v9];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__PKPaymentService_passOwnershipTokenWithIdentifier_completion___block_invoke_326;
    v11[3] = &unk_1E56D89A0;
    void v11[4] = self;
    id v12 = v7;
    [v10 passOwnershipTokenWithIdentifier:v8 completion:v11];
  }
}

void __64__PKPaymentService_passOwnershipTokenWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

uint64_t __64__PKPaymentService_passOwnershipTokenWithIdentifier_completion___block_invoke_326(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentService_accountAttestationAnonymizationSaltWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v14 = a2;
  id v6 = v5;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PKPaymentService_accountAttestationAnonymizationSaltWithCompletion___block_invoke_327;
  v10[3] = &unk_1E56E4B90;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 accountAttestationAnonymizationSaltWithCompletion:v10];
}

uint64_t __70__PKPaymentService_accountAttestationAnonymizationSaltWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __70__PKPaymentService_accountAttestationAnonymizationSaltWithCompletion___block_invoke_327(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_setAccountAttestationAnonymizationSalt_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PKPaymentService_setAccountAttestationAnonymizationSalt_withCompletion___block_invoke_329;
  v13[3] = &unk_1E56D9528;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 setAccountAttestationAnonymizationSalt:v9 withCompletion:v13];
}

void __74__PKPaymentService_setAccountAttestationAnonymizationSalt_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t __74__PKPaymentService_setAccountAttestationAnonymizationSalt_withCompletion___block_invoke_329(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addPlaceholderPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaymentService_addPlaceholderPassWithConfiguration_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKPaymentService_addPlaceholderPassWithConfiguration_completion___block_invoke_330;
  v13[3] = &unk_1E56E4BB8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 addPlaceholderPassWithConfiguration:v9 completion:v13];
}

uint64_t __67__PKPaymentService_addPlaceholderPassWithConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __67__PKPaymentService_addPlaceholderPassWithConfiguration_completion___block_invoke_330(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)subcredentialInvitationsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_subcredentialInvitationsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v14 = a2;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PKPaymentService_subcredentialInvitationsWithCompletion___block_invoke_332;
  v10[3] = &unk_1E56D8748;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 subcredentialInvitationsWithCompletion:v10];
}

uint64_t __59__PKPaymentService_subcredentialInvitationsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __59__PKPaymentService_subcredentialInvitationsWithCompletion___block_invoke_332(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPaymentService_updateMetadataOnPassWithIdentifier_credential_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v20 = a2;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  SEL v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__PKPaymentService_updateMetadataOnPassWithIdentifier_credential_completion___block_invoke_333;
  v16[3] = &unk_1E56D86A8;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 updateMetadataOnPassWithIdentifier:v12 credential:v11 completion:v16];
}

uint64_t __77__PKPaymentService_updateMetadataOnPassWithIdentifier_credential_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __77__PKPaymentService_updateMetadataOnPassWithIdentifier_credential_completion___block_invoke_333(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_registerCredentialsWithIdentifiers_completion___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = a2;
  id v8 = a3;
  id v9 = _Block_copy(aBlock);
  id v10 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKPaymentService_registerCredentialsWithIdentifiers_completion___block_invoke_334;
  v12[3] = &unk_1E56E4BE0;
  void v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 registerCredentialsWithIdentifiers:v8 completion:v12];
}

void __66__PKPaymentService_registerCredentialsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

uint64_t __66__PKPaymentService_registerCredentialsWithIdentifiers_completion___block_invoke_334(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPaymentService_revokeCredentialsWithIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKPaymentService_revokeCredentialsWithIdentifiers_completion___block_invoke_336;
  v13[3] = &unk_1E56D86A8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 revokeCredentialsWithIdentifiers:v9 completion:v13];
}

uint64_t __64__PKPaymentService_revokeCredentialsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __64__PKPaymentService_revokeCredentialsWithIdentifiers_completion___block_invoke_336(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentService_revokeCredentialsWithReaderIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PKPaymentService_revokeCredentialsWithReaderIdentifiers_completion___block_invoke_337;
  v13[3] = &unk_1E56D86A8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 revokeCredentialsWithReaderIdentifiers:v9 completion:v13];
}

uint64_t __70__PKPaymentService_revokeCredentialsWithReaderIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __70__PKPaymentService_revokeCredentialsWithReaderIdentifiers_completion___block_invoke_337(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPaymentService_addPassShare_onCredentialWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v20 = a2;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__PKPaymentService_addPassShare_onCredentialWithIdentifier_completion___block_invoke_338;
  v16[3] = &unk_1E56D86A8;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 addPassShare:v12 onCredentialWithIdentifier:v11 withCompletion:v16];
}

uint64_t __71__PKPaymentService_addPassShare_onCredentialWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __71__PKPaymentService_addPassShare_onCredentialWithIdentifier_completion___block_invoke_338(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKPaymentService_removeSharingInvitationReceiptWithIdentifiers_onCredential_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v20 = a2;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__PKPaymentService_removeSharingInvitationReceiptWithIdentifiers_onCredential_completion___block_invoke_339;
  v16[3] = &unk_1E56D86A8;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 removeSharingInvitationReceiptWithIdentifiers:v12 onCredential:v11 completion:v16];
}

uint64_t __90__PKPaymentService_removeSharingInvitationReceiptWithIdentifiers_onCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __90__PKPaymentService_removeSharingInvitationReceiptWithIdentifiers_onCredential_completion___block_invoke_339(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentService_declineRelatedSharingInvitationsIfNecessary_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PKPaymentService_declineRelatedSharingInvitationsIfNecessary_withCompletion___block_invoke_340;
  v13[3] = &unk_1E56D86A8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 declineRelatedSharingInvitationsIfNecessary:v9 withCompletion:v13];
}

uint64_t __79__PKPaymentService_declineRelatedSharingInvitationsIfNecessary_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __79__PKPaymentService_declineRelatedSharingInvitationsIfNecessary_withCompletion___block_invoke_340(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeSharingInvitation:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_removeSharingInvitation_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v18 = a2;
  id v8 = v7;
  id v17 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  id v12 = [v9 identifier];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__PKPaymentService_removeSharingInvitation_withCompletion___block_invoke_341;
  v14[3] = &unk_1E56D86A8;
  void v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v11 removeSharingInvitationWithIdentifier:v12 withCompletion:v14];
}

uint64_t __59__PKPaymentService_removeSharingInvitation_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __59__PKPaymentService_removeSharingInvitation_withCompletion___block_invoke_341(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __88__PKPaymentService_requestBackgroundRegistrationForCredentialWithIdentifier_completion___block_invoke;
  id v15 = &unk_1E56DC4C0;
  id v16 = v7;
  SEL v17 = a2;
  id v8 = v7;
  id v9 = a3;
  id v10 = _Block_copy(&v12);
  id v11 = -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10, v12, v13, v14, v15);
  [v11 requestBackgroundRegistrationForCredentialWithIdentifier:v9 completion:v8];
}

uint64_t __88__PKPaymentService_requestBackgroundRegistrationForCredentialWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)matchingInvitationOnDevice:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if (a4)
    {
      objc_initWeak(location, self);
      id v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      dispatch_time_t v12 = dispatch_time(0, 1000000000 * a4);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke;
      handler[3] = &unk_1E56E15D0;
      uint64_t v13 = v11;
      v36 = v13;
      objc_copyWeak(&v38, location);
      id v14 = v9;
      id v37 = v14;
      dispatch_source_set_event_handler(v13, handler);
      id v15 = [PKPendingInvitationRequest alloc];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_2;
      v32[3] = &unk_1E56E4C08;
      id v16 = v13;
      v33 = v16;
      id v34 = v10;
      SEL v17 = [(PKPendingInvitationRequest *)v15 initWithInvitation:v14 completion:v32];
      os_unfair_lock_lock(&self->_pendingInvitationRequestsLock);
      [(NSMutableArray *)self->_pendingInvitationRequests addObject:v17];
      os_unfair_lock_unlock(&self->_pendingInvitationRequestsLock);
      dispatch_resume(v16);

      objc_destroyWeak(&v38);
      objc_destroyWeak(location);
    }
    else
    {
      SEL v17 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_3;
    aBlock[3] = &unk_1E56E4C30;
    SEL v30 = a2;
    unint64_t v31 = a4;
    id v18 = v10;
    id v29 = v18;
    id v19 = _Block_copy(aBlock);
    SEL v20 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v19];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_344;
    v22[3] = &unk_1E56E4C58;
    id v23 = v9;
    SEL v24 = self;
    unint64_t v27 = a4;
    SEL v25 = v17;
    id v26 = v18;
    id v21 = v17;
    [v20 subcredentialInvitationsWithCompletion:v22];
  }
}

void __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 7);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = *(id *)&v4[8]._os_unfair_lock_opaque;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
LABEL_6:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = objc_msgSend(v10, "invitation", (void)v14);
        dispatch_time_t v12 = *(void **)(a1 + 40);

        if (v11 == v12) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v7) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v13 = v10;

      if (!v13) {
        goto LABEL_15;
      }
      [*(id *)&v4[8]._os_unfair_lock_opaque removeObject:v13];
      os_unfair_lock_unlock(v4 + 7);
      [v13 invokeCompletionWithInvitation:0 error:0];
    }
    else
    {
LABEL_12:

LABEL_15:
      os_unfair_lock_unlock(v4 + 7);
    }
  }
}

void __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  if (v6) {
    dispatch_source_cancel(v6);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
  if (!*(void *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_344(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a2;
  id v4 = (id)[v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) isSameInvitationAsInvitation:v7])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (*(void *)(a1 + 64))
  {
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 28));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = *(id *)(*(void *)(a1 + 40) + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        while (2)
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            if (*(void *)(a1 + 48) == *(void *)(*((void *)&v13 + 1) + 8 * j))
            {

              objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "removeObject:", *(void *)(a1 + 48), (void)v13);
              os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 28));
              [*(id *)(a1 + 48) invokeCompletionWithInvitation:v4 error:0];
              goto LABEL_24;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 28));
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_24:
}

- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPaymentService_canAcceptInvitation_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PKPaymentService_canAcceptInvitation_withCompletion___block_invoke_345;
  v13[3] = &unk_1E56D8388;
  id v14 = v8;
  id v12 = v8;
  [v11 canAcceptInvitation:v9 withCompletion:v13];
}

uint64_t __55__PKPaymentService_canAcceptInvitation_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __55__PKPaymentService_canAcceptInvitation_withCompletion___block_invoke_345(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)credentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPaymentService_credentialWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__PKPaymentService_credentialWithIdentifier_completion___block_invoke_346;
  v13[3] = &unk_1E56E4C80;
  id v14 = v8;
  id v12 = v8;
  [v11 credentialWithIdentifier:v9 completion:v13];
}

uint64_t __56__PKPaymentService_credentialWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __56__PKPaymentService_credentialWithIdentifier_completion___block_invoke_346(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)passSharesForCredentialIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPaymentService_passSharesForCredentialIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKPaymentService_passSharesForCredentialIdentifier_completion___block_invoke_348;
  v13[3] = &unk_1E56D9100;
  id v14 = v8;
  id v12 = v8;
  [v11 passSharesForCredentialIdentifier:v9 completion:v13];
}

uint64_t __65__PKPaymentService_passSharesForCredentialIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __65__PKPaymentService_passSharesForCredentialIdentifier_completion___block_invoke_348(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sharingInvitationWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPaymentService_sharingInvitationWasInvalidated_withCredentialIdentifier_error_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v23 = a2;
  id v12 = v11;
  id v22 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = _Block_copy(aBlock);
  SEL v17 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v16];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__PKPaymentService_sharingInvitationWasInvalidated_withCredentialIdentifier_error_completion___block_invoke_349;
  v19[3] = &unk_1E56D86A8;
  void v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 sharingInvitationWasInvalidated:v15 withCredentialIdentifier:v14 error:v13 completion:v19];
}

uint64_t __94__PKPaymentService_sharingInvitationWasInvalidated_withCredentialIdentifier_error_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __94__PKPaymentService_sharingInvitationWasInvalidated_withCredentialIdentifier_error_completion___block_invoke_349(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)finishedKeyExchangeForCredential:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentService_finishedKeyExchangeForCredential_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PKPaymentService_finishedKeyExchangeForCredential_withCompletion___block_invoke_350;
  v13[3] = &unk_1E56D86A8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 finishedKeyExchangeForCredential:v9 withCompletion:v13];
}

uint64_t __68__PKPaymentService_finishedKeyExchangeForCredential_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __68__PKPaymentService_finishedKeyExchangeForCredential_withCompletion___block_invoke_350(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7
{
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __131__PKPaymentService_didReceiveSharingInvitationWithIdentifier_fromOriginatorIDSHandle_sharingSessionIdentifier_metadata_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v26 = a2;
  id v14 = v13;
  id v25 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  long long v19 = _Block_copy(aBlock);
  id v20 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __131__PKPaymentService_didReceiveSharingInvitationWithIdentifier_fromOriginatorIDSHandle_sharingSessionIdentifier_metadata_completion___block_invoke_351;
  v22[3] = &unk_1E56D86A8;
  void v22[4] = self;
  id v23 = v14;
  id v21 = v14;
  [v20 didReceiveSharingInvitationWithIdentifier:v18 fromOriginatorIDSHandle:v17 sharingSessionIdentifier:v16 metadata:v15 completion:v22];
}

uint64_t __131__PKPaymentService_didReceiveSharingInvitationWithIdentifier_fromOriginatorIDSHandle_sharingSessionIdentifier_metadata_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __131__PKPaymentService_didReceiveSharingInvitationWithIdentifier_fromOriginatorIDSHandle_sharingSessionIdentifier_metadata_completion___block_invoke_351(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didReceiveSharingInvitationRequest:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentService_didReceiveSharingInvitationRequest_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PKPaymentService_didReceiveSharingInvitationRequest_withCompletion___block_invoke_352;
  v13[3] = &unk_1E56D86A8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 didReceiveSharingInvitationRequest:v9 withCompletion:v13];
}

uint64_t __70__PKPaymentService_didReceiveSharingInvitationRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __70__PKPaymentService_didReceiveSharingInvitationRequest_withCompletion___block_invoke_352(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentService_didUpdateSharingInvitationWithIdentifier_reason_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  id v13 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PKPaymentService_didUpdateSharingInvitationWithIdentifier_reason_completion___block_invoke_353;
  v15[3] = &unk_1E56D86A8;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 didUpdateSharingInvitationWithIdentifier:v11 reason:a4 completion:v15];
}

uint64_t __79__PKPaymentService_didUpdateSharingInvitationWithIdentifier_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __79__PKPaymentService_didUpdateSharingInvitationWithIdentifier_reason_completion___block_invoke_353(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pushProvisioningSharingIdentifiers:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPaymentService_pushProvisioningSharingIdentifiers___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v14 = a2;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PKPaymentService_pushProvisioningSharingIdentifiers___block_invoke_354;
  v10[3] = &unk_1E56D90B0;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 pushProvisioningSharingIdentifiers:v10];
}

uint64_t __55__PKPaymentService_pushProvisioningSharingIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __55__PKPaymentService_pushProvisioningSharingIdentifiers___block_invoke_354(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_saveProvisioningSupportData_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PKPaymentService_saveProvisioningSupportData_completion___block_invoke_355;
  v13[3] = &unk_1E56D8770;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 saveProvisioningSupportData:v9 completion:v13];
}

void __59__PKPaymentService_saveProvisioningSupportData_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t __59__PKPaymentService_saveProvisioningSupportData_completion___block_invoke_355(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_clearProvisioningSupportDataOfType_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v16 = a2;
  id v8 = v7;
  id v15 = v8;
  id v9 = _Block_copy(aBlock);
  id v10 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKPaymentService_clearProvisioningSupportDataOfType_completion___block_invoke_356;
  v12[3] = &unk_1E56D83D8;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 clearProvisioningSupportDataOfType:a3 completion:v12];
}

uint64_t __66__PKPaymentService_clearProvisioningSupportDataOfType_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __66__PKPaymentService_clearProvisioningSupportDataOfType_completion___block_invoke_356(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKPaymentService_statusForShareableCredentials_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v9 = v8;
  id v17 = v7;
  id v18 = v9;
  id v10 = v7;
  id v11 = _Block_copy(aBlock);
  id v12 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__PKPaymentService_statusForShareableCredentials_completion___block_invoke_357;
  v14[3] = &unk_1E56E4CA8;
  void v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [v12 statusForShareableCredentials:v10 completion:v14];
}

uint64_t __61__PKPaymentService_statusForShareableCredentials_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, *(void *)(a1 + 32), 0);
  }
  return result;
}

uint64_t __61__PKPaymentService_statusForShareableCredentials_completion___block_invoke_357(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKPaymentService_provideEncryptedPushProvisioningTarget_sharingInstanceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v20 = a2;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__PKPaymentService_provideEncryptedPushProvisioningTarget_sharingInstanceIdentifier_completion___block_invoke_359;
  v16[3] = &unk_1E56D9528;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 provideEncryptedPushProvisioningTarget:v12 sharingInstanceIdentifier:v11 completion:v16];
}

void __96__PKPaymentService_provideEncryptedPushProvisioningTarget_sharingInstanceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t __96__PKPaymentService_provideEncryptedPushProvisioningTarget_sharingInstanceIdentifier_completion___block_invoke_359(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  id v13 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKPaymentService_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke_360;
  v15[3] = &unk_1E56E4CD0;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 prepareProvisioningTarget:v11 checkFamilyCircle:v5 completion:v15];
}

void __75__PKPaymentService_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
  }
}

uint64_t __75__PKPaymentService_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke_360(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)redeemEncryptedProvisioningTarget:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PKPaymentShareableCredential alloc] initWithEncryptedProvisioningTarget:v7 provisioningSharingIdentifier:0 passThumbnailImageData:0];

  [(PKPaymentService *)self redeemPaymentShareableCredential:v8 completion:v6];
}

- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPaymentService_redeemPaymentShareableCredential_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKPaymentService_redeemPaymentShareableCredential_completion___block_invoke_363;
  v13[3] = &unk_1E56E4CF8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 redeemPaymentShareableCredential:v9 completion:v13];
}

void __64__PKPaymentService_redeemPaymentShareableCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void *))(v4 + 16))(v4, 0, 0, 0, v5);
  }
}

uint64_t __64__PKPaymentService_redeemPaymentShareableCredential_completion___block_invoke_363(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaymentService_redeemProvisioningSharingIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKPaymentService_redeemProvisioningSharingIdentifier_completion___block_invoke_365;
  v13[3] = &unk_1E56E4D20;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 redeemProvisioningSharingIdentifier:v9 completion:v13];
}

void __67__PKPaymentService_redeemProvisioningSharingIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
  }
}

uint64_t __67__PKPaymentService_redeemProvisioningSharingIdentifier_completion___block_invoke_365(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)currentSecureElementSnapshot:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKPaymentService_currentSecureElementSnapshot___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v14 = a2;
  id v6 = v5;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PKPaymentService_currentSecureElementSnapshot___block_invoke_367;
  v10[3] = &unk_1E56E4D48;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 currentSecureElementSnapshot:v10];
}

void __49__PKPaymentService_currentSecureElementSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

uint64_t __49__PKPaymentService_currentSecureElementSnapshot___block_invoke_367(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentService_reserveStorageForAppletTypes_metadata_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v20 = a2;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  SEL v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__PKPaymentService_reserveStorageForAppletTypes_metadata_completion___block_invoke_369;
  v16[3] = &unk_1E56E4D70;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 reserveStorageForAppletTypes:v12 metadata:v11 completion:v16];
}

void __69__PKPaymentService_reserveStorageForAppletTypes_metadata_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
  }
}

uint64_t __69__PKPaymentService_reserveStorageForAppletTypes_metadata_completion___block_invoke_369(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKPaymentService_deleteReservation_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__PKPaymentService_deleteReservation_completion___block_invoke_371;
  v13[3] = &unk_1E56D83D8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteReservation:v9 completion:v13];
}

uint64_t __49__PKPaymentService_deleteReservation_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __49__PKPaymentService_deleteReservation_completion___block_invoke_371(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPaymentService_transactionReceiptWithUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__PKPaymentService_transactionReceiptWithUniqueID_completion___block_invoke_372;
  v13[3] = &unk_1E56E4D98;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 transactionReceiptWithUniqueID:v9 completion:v13];
}

uint64_t __62__PKPaymentService_transactionReceiptWithUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __62__PKPaymentService_transactionReceiptWithUniqueID_completion___block_invoke_372(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKPaymentService_transactionReceiptForTransactionWithIdentifier_updateIfNecessary_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v19 = a2;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  id v13 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__PKPaymentService_transactionReceiptForTransactionWithIdentifier_updateIfNecessary_completion___block_invoke_374;
  v15[3] = &unk_1E56E4D98;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 transactionReceiptForTransactionWithIdentifier:v11 updateIfNecessary:v5 completion:v15];
}

uint64_t __96__PKPaymentService_transactionReceiptForTransactionWithIdentifier_updateIfNecessary_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __96__PKPaymentService_transactionReceiptForTransactionWithIdentifier_updateIfNecessary_completion___block_invoke_374(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)storeTransactionReceiptData:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_storeTransactionReceiptData_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PKPaymentService_storeTransactionReceiptData_completion___block_invoke_375;
  v13[3] = &unk_1E56E4D98;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 storeTransactionReceiptData:v9 completion:v13];
}

uint64_t __59__PKPaymentService_storeTransactionReceiptData_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __59__PKPaymentService_storeTransactionReceiptData_completion___block_invoke_375(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteTransactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentService_deleteTransactionReceiptWithUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PKPaymentService_deleteTransactionReceiptWithUniqueID_completion___block_invoke_376;
  v13[3] = &unk_1E56D86A8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteTransactionReceiptWithUniqueID:v9 completion:v13];
}

uint64_t __68__PKPaymentService_deleteTransactionReceiptWithUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __68__PKPaymentService_deleteTransactionReceiptWithUniqueID_completion___block_invoke_376(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_transactionTagsForTransactionWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PKPaymentService_transactionTagsForTransactionWithIdentifier_completion___block_invoke_377;
  v13[3] = &unk_1E56D8748;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 transactionTagsForTransactionWithIdentifier:v9 completion:v13];
}

uint64_t __75__PKPaymentService_transactionTagsForTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __75__PKPaymentService_transactionTagsForTransactionWithIdentifier_completion___block_invoke_377(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  int v5 = [(PKPaymentService *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKPaymentService_willPassWithUniqueIdentifierAutomaticallyBecomeDefault___block_invoke;
  v7[3] = &unk_1E56DC988;
  v7[4] = self;
  void v7[5] = &v8;
  [v5 willPassWithUniqueIdentifierAutomaticallyBecomeDefault:v4 completion:v7];
  LOBYTE(self) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

uint64_t __75__PKPaymentService_willPassWithUniqueIdentifierAutomaticallyBecomeDefault___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (void)sendAllPassTransactions
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PKPaymentService_sendAllPassTransactions__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = a2;
  id v3 = _Block_copy(aBlock);
  id v4 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v3];
  [v4 sendAllPassTransactions];
}

void __43__PKPaymentService_sendAllPassTransactions__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)ambiguousTransactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPaymentService_ambiguousTransactionWithServiceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56DC4C0;
  SEL v17 = a2;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  uint64_t v10 = _Block_copy(aBlock);
  char v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PKPaymentService_ambiguousTransactionWithServiceIdentifier_completion___block_invoke_378;
  v13[3] = &unk_1E56E4DC0;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 ambiguousTransactionWithServiceIdentifier:v9 completion:v13];
}

uint64_t __73__PKPaymentService_ambiguousTransactionWithServiceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __73__PKPaymentService_ambiguousTransactionWithServiceIdentifier_completion___block_invoke_378(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  uint64_t v10 = _Block_copy(aBlock);
  char v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2;
  v13[3] = &unk_1E56E4DE8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 sendDeviceSharingCapabilitiesRequestForHandle:v9 completion:v13];
}

void __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_379;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v10 = __dispatch_async_ar_block_invoke_8;
  char v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_379(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_3;
  v10[3] = &unk_1E56D8950;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v8 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E56D8360;
  id v16 = v8;
  id v9 = v5;
  dispatch_async(v6, block);
}

uint64_t __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[7], a1[4]);
  }
  return result;
}

- (void)simulateSecureEvent:(id)a3
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __40__PKPaymentService_simulateSecureEvent___block_invoke;
  id v9 = &unk_1E56DE608;
  uint64_t v10 = self;
  SEL v11 = a2;
  id v4 = a3;
  id v5 = [(PKPaymentService *)self _extendedRemoteObjectProxyWithFailureHandler:&v6];
  objc_msgSend(v5, "simulateSecureEvent:", v4, v6, v7, v8, v9, v10, v11);
}

void __40__PKPaymentService_simulateSecureEvent___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (PKPaymentServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPaymentServiceDelegate *)WeakRetained;
}

- (void)paymentPassForVirtualCard:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if ([v7 type] == 2)
    {
      id v9 = [v7 identifier];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__PKPaymentService_VPAN__paymentPassForVirtualCard_completion___block_invoke;
      aBlock[3] = &unk_1E56DD260;
      SEL v18 = a2;
      id v10 = v8;
      void aBlock[4] = self;
      id v17 = v10;
      SEL v11 = _Block_copy(aBlock);
      uint64_t v12 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v11];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__PKPaymentService_VPAN__paymentPassForVirtualCard_completion___block_invoke_11;
      v14[3] = &unk_1E56D8B30;
      id v15 = v10;
      [v12 paymentPassForVPANID:v9 andLoadImages:1 completion:v14];
    }
    else
    {
      id v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Only VPAN virtual cards are supported via Payment Service", buf, 2u);
      }

      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
}

void __63__PKPaymentService_VPAN__paymentPassForVirtualCard_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __63__PKPaymentService_VPAN__paymentPassForVirtualCard_completion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)virtualCardsWithActiveVPAN:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__PKPaymentService_VPAN__virtualCardsWithActiveVPAN___block_invoke;
    aBlock[3] = &unk_1E56DD260;
    SEL v14 = a2;
    id v7 = v5;
    void aBlock[4] = self;
    id v13 = v7;
    id v8 = _Block_copy(aBlock);
    uint64_t v9 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__PKPaymentService_VPAN__virtualCardsWithActiveVPAN___block_invoke_13;
    v10[3] = &unk_1E56F37A8;
    void v10[4] = self;
    id v11 = v7;
    [v9 vpanVirtualCards:v10];
  }
}

void __53__PKPaymentService_VPAN__virtualCardsWithActiveVPAN___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __53__PKPaymentService_VPAN__virtualCardsWithActiveVPAN___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)vpanCardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 merchantHost:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    if ([v11 type] == 2)
    {
      id v15 = [v11 identifier];
      if (v15)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __98__PKPaymentService_VPAN__vpanCardCredentialsForVirtualCard_authorization_merchantHost_completion___block_invoke;
        aBlock[3] = &unk_1E56DD260;
        SEL v24 = a2;
        id v16 = v14;
        void aBlock[4] = self;
        id v23 = v16;
        id v17 = _Block_copy(aBlock);
        SEL v18 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v17];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __98__PKPaymentService_VPAN__vpanCardCredentialsForVirtualCard_authorization_merchantHost_completion___block_invoke_15;
        v20[3] = &unk_1E56F37D0;
        void v20[4] = self;
        id v21 = v16;
        [v18 vpanCardCredentialsForVPANID:v15 authorization:v12 merchantHost:v13 completion:v20];

        SEL v19 = v23;
      }
      else
      {
        SEL v19 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          SEL v26 = "-[PKPaymentService(VPAN) vpanCardCredentialsForVirtualCard:authorization:merchantHost:completion:]";
          __int16 v27 = 2112;
          id v28 = v11;
        }
      }
    }
    else
    {
      id v15 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        SEL v26 = "-[PKPaymentService(VPAN) vpanCardCredentialsForVirtualCard:authorization:merchantHost:completion:]";
        __int16 v27 = 2112;
        id v28 = v11;
      }
    }
  }
}

void __98__PKPaymentService_VPAN__vpanCardCredentialsForVirtualCard_authorization_merchantHost_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __98__PKPaymentService_VPAN__vpanCardCredentialsForVirtualCard_authorization_merchantHost_completion___block_invoke_15(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)regenerateVPANCardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if ([v9 type] == 2)
    {
      id v12 = [v9 identifier];
      if (v12)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __95__PKPaymentService_VPAN__regenerateVPANCardCredentialsForVirtualCard_authorization_completion___block_invoke;
        aBlock[3] = &unk_1E56DD260;
        SEL v21 = a2;
        id v13 = v11;
        void aBlock[4] = self;
        SEL v20 = v13;
        id v14 = _Block_copy(aBlock);
        id v15 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v14];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __95__PKPaymentService_VPAN__regenerateVPANCardCredentialsForVirtualCard_authorization_completion___block_invoke_17;
        v17[3] = &unk_1E56F37D0;
        void v17[4] = self;
        SEL v18 = v13;
        [v15 regenerateVPANCardCredentialsForVPANID:v12 authorization:v10 completion:v17];

        id v16 = v20;
      }
      else
      {
        id v16 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          id v23 = "-[PKPaymentService(VPAN) regenerateVPANCardCredentialsForVirtualCard:authorization:completion:]";
          __int16 v24 = 2112;
          id v25 = v9;
        }
      }
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        id v23 = "-[PKPaymentService(VPAN) regenerateVPANCardCredentialsForVirtualCard:authorization:completion:]";
        __int16 v24 = 2112;
        id v25 = v9;
      }
    }
  }
}

void __95__PKPaymentService_VPAN__regenerateVPANCardCredentialsForVirtualCard_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

uint64_t __95__PKPaymentService_VPAN__regenerateVPANCardCredentialsForVirtualCard_authorization_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateDateLastUsedBySafari:(id)a3 forVirtualCard:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 type] == 2)
  {
    id v12 = [v10 identifier];
    if (v12)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__PKPaymentService_VPAN__updateDateLastUsedBySafari_forVirtualCard_completion___block_invoke;
      aBlock[3] = &unk_1E56DD260;
      SEL v21 = a2;
      id v13 = v11;
      void aBlock[4] = self;
      SEL v20 = v13;
      id v14 = _Block_copy(aBlock);
      id v15 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v14];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__PKPaymentService_VPAN__updateDateLastUsedBySafari_forVirtualCard_completion___block_invoke_18;
      v17[3] = &unk_1E56D8770;
      void v17[4] = self;
      SEL v18 = v13;
      [v15 updateDateLastUsedBySafari:v9 forVirtualCardWithIdentifier:v12 completion:v17];

      id v16 = v20;
    }
    else
    {
      id v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        id v23 = "-[PKPaymentService(VPAN) updateDateLastUsedBySafari:forVirtualCard:completion:]";
        __int16 v24 = 2112;
        id v25 = v10;
      }
    }
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v23 = "-[PKPaymentService(VPAN) updateDateLastUsedBySafari:forVirtualCard:completion:]";
      __int16 v24 = 2112;
      id v25 = v10;
    }
  }
}

void __79__PKPaymentService_VPAN__updateDateLastUsedBySafari_forVirtualCard_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __79__PKPaymentService_VPAN__updateDateLastUsedBySafari_forVirtualCard_completion___block_invoke_18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateCardholderNameFromSafari:(id)a3 forVirtualCard:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 type] == 2)
  {
    id v12 = [v10 identifier];
    if (v12)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__PKPaymentService_VPAN__updateCardholderNameFromSafari_forVirtualCard_completion___block_invoke;
      aBlock[3] = &unk_1E56DD260;
      SEL v21 = a2;
      id v13 = v11;
      void aBlock[4] = self;
      SEL v20 = v13;
      id v14 = _Block_copy(aBlock);
      id v15 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v14];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __83__PKPaymentService_VPAN__updateCardholderNameFromSafari_forVirtualCard_completion___block_invoke_19;
      v17[3] = &unk_1E56D8770;
      void v17[4] = self;
      SEL v18 = v13;
      [v15 updateCardholderNameFromSafari:v9 forVirtualCardWithIdentifier:v12 completion:v17];

      id v16 = v20;
    }
    else
    {
      id v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        id v23 = "-[PKPaymentService(VPAN) updateCardholderNameFromSafari:forVirtualCard:completion:]";
        __int16 v24 = 2112;
        id v25 = v10;
      }
    }
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v23 = "-[PKPaymentService(VPAN) updateCardholderNameFromSafari:forVirtualCard:completion:]";
      __int16 v24 = 2112;
      id v25 = v10;
    }
  }
}

void __83__PKPaymentService_VPAN__updateCardholderNameFromSafari_forVirtualCard_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __83__PKPaymentService_VPAN__updateCardholderNameFromSafari_forVirtualCard_completion___block_invoke_19(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addPendingProvisioning:(id)a3
{
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __64__PKPaymentService_PendingProvisioning__addPendingProvisioning___block_invoke;
  id v10 = &unk_1E56DD328;
  id v11 = self;
  SEL v12 = a2;
  id v4 = a3;
  id v5 = _Block_copy(&v7);
  uint64_t v6 = -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v5, v7, v8, v9, v10, v11, v12);
  [v6 addPendingProvisioning:v4];
}

void __64__PKPaymentService_PendingProvisioning__addPendingProvisioning___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 40);
    id v6 = a2;
    uint64_t v7 = NSStringFromSelector(v5);

    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@]: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentService_PendingProvisioning__addPendingProvisionings_completion___block_invoke;
  aBlock[3] = &unk_1E56DD260;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  __int16 v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentService *)self _remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PKPaymentService_PendingProvisioning__addPendingProvisionings_completion___block_invoke_11;
  v13[3] = &unk_1E56D8770;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 addPendingProvisionings:v9 completion:v13];
}

void __76__PKPaymentService_PendingProvisioning__addPendingProvisionings_completion___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@]: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __76__PKPaymentService_PendingProvisioning__addPendingProvisionings_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentService_PendingProvisioning__retrievePendingProvisioningsWithType_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  void aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__PKPaymentService_PendingProvisioning__retrievePendingProvisioningsWithType_completion___block_invoke_13;
  v13[3] = &unk_1E56D89C8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 retrievePendingProvisioningsWithType:v9 completion:v13];
}

uint64_t __89__PKPaymentService_PendingProvisioning__retrievePendingProvisioningsWithType_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __89__PKPaymentService_PendingProvisioning__retrievePendingProvisioningsWithType_completion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__PKPaymentService_PendingProvisioning__hasPendingProvisioningsOfTypes___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__PKPaymentService_PendingProvisioning__retrievePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __107__PKPaymentService_PendingProvisioning__retrievePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke_17;
  v16[3] = &unk_1E56F4BC8;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 retrievePendingProvisioningOfType:v12 withUniqueIdentifier:v11 completion:v16];
}

uint64_t __107__PKPaymentService_PendingProvisioning__retrievePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __107__PKPaymentService_PendingProvisioning__retrievePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__PKPaymentService_PendingProvisioning__removePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  void aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  id v14 = [(PKPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__PKPaymentService_PendingProvisioning__removePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke_19;
  v16[3] = &unk_1E56D8798;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 removePendingProvisioningOfType:v12 withUniqueIdentifier:v11 completion:v16];
}

uint64_t __105__PKPaymentService_PendingProvisioning__removePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __105__PKPaymentService_PendingProvisioning__removePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end