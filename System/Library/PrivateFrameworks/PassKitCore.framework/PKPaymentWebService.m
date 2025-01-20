@interface PKPaymentWebService
+ (BOOL)supportsSecureCoding;
+ (id)remoteDeviceWebService;
+ (id)sharedService;
- (BOOL)_canRegisterForPeerPayment;
- (BOOL)_hasConfiguration;
- (BOOL)_isSandboxAccount;
- (BOOL)_isValidResponse:(id)a3 error:(id)a4;
- (BOOL)_needsRegistrationForBrokerURL:(id)a3 shouldCheckSecureElementOwnership:(BOOL)a4;
- (BOOL)_needsRegistrationShouldCheckSecureElementOwnership:(BOOL)a3;
- (BOOL)_supportsAccounts;
- (BOOL)canBypassTrustValidation;
- (BOOL)isChinaRegionIdentifier:(id)a3;
- (BOOL)needsConfiguration;
- (BOOL)needsConfigurationWithSupportedRegionTimeInterval:(double)a3 unsupportedRegionTimeInterval:(double)a4;
- (BOOL)needsRegistration;
- (BOOL)needsRegistrationForBrokerURL:(id)a3;
- (BOOL)registrationSetupSupportedInRegion;
- (BOOL)sharedService;
- (NSArray)delegates;
- (NSURL)primaryBrokerURL;
- (PKPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5;
- (PKPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5 tapToRadarDelegate:(id)a6;
- (PKPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 tapToRadarDelegate:(id)a5;
- (PKPaymentWebService)initWithTapToRadarDelegate:(id)a3;
- (PKPaymentWebServiceArchiver)archiver;
- (PKPaymentWebServiceBackgroundContext)backgroundContext;
- (PKPaymentWebServiceBackgroundDelegate)backgroundDelegate;
- (PKPaymentWebServiceContext)context;
- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice;
- (id)_appleAccountInformation;
- (id)_brokerUrlForRegion:(id)a3 regionOut:(id *)a4;
- (id)_downloadCacheLocation;
- (id)_downloadPassesWithURLs:(id)a3;
- (id)_errorWithResult:(unint64_t)a3 data:(id)a4;
- (id)_errorWithResult:(unint64_t)a3 response:(id)a4 data:(id)a5;
- (id)_fakeVerificationChannelsWithRealChannels:(id)a3;
- (id)_movePassToDownloadCache:(id)a3;
- (id)_passWithFileURL:(id)a3;
- (id)_paymentDevice;
- (id)forbiddenErrorWithResponse:(id)a3;
- (id)removeRedundantChannelsFromChannels:(id)a3;
- (id)supportedRegionFeatureOfType:(int64_t)a3 didFailOSVersionRequirements:(BOOL *)a4;
- (id)verificationRecordForPass:(id)a3;
- (int64_t)logFacilityType;
- (unint64_t)_augmentSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5;
- (unint64_t)_auxiliaryCapabilityRegisterResultForResponse:(id)a3 error:(id)a4 successHandler:(id)a5;
- (unint64_t)_downloadPassAtURL:(id)a3 completion:(id)a4;
- (unint64_t)_nonceWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5;
- (unint64_t)_passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup:(id)a3 forPass:(id)a4 forDeviceIdentifier:(id)a5 completion:(id)a6;
- (unint64_t)_passActionGroupWithRemoteContentPassActionGroup:(id)a3 forPass:(id)a4 forDeviceIdentifier:(id)a5 completion:(id)a6;
- (unint64_t)_passActionIncludingAppletDataWithRemoteContentPassAction:(id)a3 pass:(id)a4 completion:(id)a5;
- (unint64_t)_passActionWithRemoteContentPassAction:(id)a3 pass:(id)a4 completion:(id)a5;
- (unint64_t)_passActionWithRemoteContentPassAction:(id)a3 serviceProviderData:(id)a4 pass:(id)a5 completion:(id)a6;
- (unint64_t)_performAccountApplePayTrustProtocolRequest:(id)a3 originalRequest:(id)a4 taskID:(unint64_t)a5 completion:(id)a6;
- (unint64_t)_performAccountRequest:(id)a3 account:(id)a4 request:(id)a5 taskID:(unint64_t)a6 responseClass:(Class)a7 completion:(id)a8;
- (unint64_t)_performAccountRequest:(id)a3 account:(id)a4 responseClass:(Class)a5 completion:(id)a6;
- (unint64_t)_performAccountRequest:(id)a3 request:(id)a4 responseClass:(Class)a5 completion:(id)a6;
- (unint64_t)_performAccountRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5;
- (unint64_t)_performAccountRequest:(id)a3 taskID:(unint64_t)a4 responseClass:(Class)a5 completion:(id)a6;
- (unint64_t)_performApplePayTrustRegistrationWithURL:(id)a3 pushToken:(id)a4 completion:(id)a5;
- (unint64_t)_performApplyRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5;
- (unint64_t)_performOptionalAccountApplePayTrustProtocolRequest:(id)a3 originalRequest:(id)a4 taskID:(unint64_t)a5 completion:(id)a6;
- (unint64_t)_performPaymentOfferRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5;
- (unint64_t)_performRewrapRequest:(id)a3 serviceURL:(id)a4 responseHandler:(id)a5 completion:(id)a6;
- (unint64_t)_resultForResponse:(id)a3 error:(id)a4 successHandler:(id)a5;
- (unint64_t)_resultForUnexpectedStatusCode:(int64_t)a3;
- (unint64_t)_updateContextWithRegistrationType:(int64_t)a3 response:(id)a4;
- (unint64_t)accountActionWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountBalanceHistoryWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountBankLookupWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountDeleteBeneficiaryWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountDocumentActionWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountFinancingOptionsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountFinancingPlanNonceWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountFinancingPlanPaymentIntentWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountFinancingPlansWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountPassDetailsRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountPayLaterChangeAutoPaymentWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountPayLaterContentWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountPayLaterDisputeSendEmailWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountPayLaterFinancingOptionCancellationWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountPayLaterFinancingPlanCancellationWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountReportFraudEventWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountSendReportWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountServiceCertificatesWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountStatementsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountTaxFormsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountTermsDataWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountTermsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountTransactionAnswerWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountUpdateUserInfoWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountUserInfoWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountUsersWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)accountsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)addFundingSourceWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)applePayTrustSignatureRequestWithRequest:(id)a3 account:(id)a4 completion:(id)a5;
- (unint64_t)applePayTrustSignatureRequestWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)applicationsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)applyWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)augmentSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5;
- (unint64_t)augmentedProductWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)auxiliaryCapabilityKeyCreationMetadataWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)availableCommonProductsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)availableDevicesWithCompletion:(id)a3;
- (unint64_t)availableProductsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)browseableBankAppsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)cancelPaymentOfferSessionWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)cancelPaymentWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)cardInfoForMerchantIdentifier:(id)a3 completion:(id)a4;
- (unint64_t)checkAuxiliaryCapabilityRegistrationStateWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)checkMerchantStatus:(id)a3 forDomain:(id)a4 withCompletion:(id)a5;
- (unint64_t)completeSession:(id)a3 wrappedPayment:(id)a4 pass:(id)a5 applicationData:(id)a6 completion:(id)a7;
- (unint64_t)completeSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5;
- (unint64_t)configurePaymentServiceWithCompletion:(id)a3;
- (unint64_t)contactInformationWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)createVirtualCardWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)createWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)createdZoneWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)credentialAccountAttesationWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)creditRecoveryPaymentPlansWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)customizePhysicalCardWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)dailyCashEligibilityWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)deleteAccountUserWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)deleteAccountWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)deleteApplicationWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)deleteForRequest:(id)a3 completion:(id)a4;
- (unint64_t)deleteFundingSourceWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)deleteMerchantTokenWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)deprovisionForRequest:(id)a3 completion:(id)a4;
- (unint64_t)deviceCheckInDeviceCheckInForRegion:(id)a3 completion:(id)a4;
- (unint64_t)devicePassesSinceLastUpdatedTag:(BOOL)a3 withCompletion:(id)a4;
- (unint64_t)discoveryBundleForURL:(id)a3 completion:(id)a4;
- (unint64_t)discoveryManifestWithCompletion:(id)a3;
- (unint64_t)eligibilityForRequest:(id)a3 completion:(id)a4;
- (unint64_t)enhancedMerchantsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)exportTransactionDataWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)featureTermsDataWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)fetchBarcodesWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)fundingSourcesWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)generateTopUpTokenWithRequest:(id)a3 forAccount:(id)a4 completion:(id)a5;
- (unint64_t)inAppPaymentNonceForPass:(id)a3 completion:(id)a4;
- (unint64_t)inAppPaymentNonceWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5;
- (unint64_t)initiateExternalProvisioningForRequest:(id)a3 completion:(id)a4;
- (unint64_t)issuerProvisioningCertificatesForRequest:(id)a3 withCompletion:(id)a4;
- (unint64_t)moreInfoItemAtURL:(id)a3 withMetadata:(id)a4 completion:(id)a5;
- (unint64_t)networkManifestWithCompletion:(id)a3;
- (unint64_t)notifyIssuerAppletStateDirtyWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)passActionGroupWithRemoteContentPassActionGroup:(id)a3 forPass:(id)a4 completion:(id)a5;
- (unint64_t)passActionWithRemoteContentPassAction:(id)a3 forDeviceIdentifier:(id)a4 passTypeIdentifier:(id)a5 passSerialNumber:(id)a6 completion:(id)a7;
- (unint64_t)passActionWithRemoteContentPassAction:(id)a3 forPass:(id)a4 completion:(id)a5;
- (unint64_t)passActionWithRemoteContentPassAction:(id)a3 serviceProviderData:(id)a4 pass:(id)a5 completion:(id)a6;
- (unint64_t)passAtURL:(id)a3 completion:(id)a4;
- (unint64_t)passUpgradeWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completion:(id)a5;
- (unint64_t)passesWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)paymentOfferCatalogWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)paymentOffersDynamicContentWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)paymentOffersWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)paymentProvisioningNonceOfType:(unint64_t)a3 completion:(id)a4;
- (unint64_t)paymentRewardsBalancesWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)paymentRewardsRedemptionsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)paymentSetupSupportedInRegion;
- (unint64_t)paymentsWithRequest:(id)a3 account:(id)a4 completion:(id)a5;
- (unint64_t)performAction:(id)a3 onServiceProviderPurchase:(id)a4 completion:(id)a5;
- (unint64_t)performApplePayTrustRegistrationWithCompletion:(id)a3;
- (unint64_t)performInstallmentAuthorizationWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)performInstallmentBindWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)performNotificationActionRequest:(id)a3 completion:(id)a4;
- (unint64_t)performProductActionRequest:(id)a3 completion:(id)a4;
- (unint64_t)performServiceProviderPayment:(id)a3 completion:(id)a4;
- (unint64_t)physicalCardActionWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)physicalCardsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)prepareToProvisionForRequest:(id)a3 completion:(id)a4;
- (unint64_t)prepareTransactionDetailsForMerchantSession:(id)a3 secureElementIdentifier:(id)a4 amount:(id)a5 currencyCode:(id)a6 completion:(id)a7;
- (unint64_t)promotionsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)provideEncryptedPushProvisioningTargetWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)provisionPassesWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)provisionPrecursorPassForRequest:(id)a3 completion:(id)a4;
- (unint64_t)provisioningMethodWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)pushProvisioningSharingIdentifiersWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)pushProvisioningSharingStatusRequest:(id)a3 completion:(id)a4;
- (unint64_t)regeneratePaymentCredentialsForPaymentPass:(id)a3 vpanIdentifier:(id)a4 nonce:(id)a5 encryptionFields:(id)a6 completion:(id)a7;
- (unint64_t)registerAuxiliaryCapabilityWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)registerCredentialWithRequest:(id)a3 withCompletion:(id)a4;
- (unint64_t)registerDeviceAtBrokerURL:(id)a3 consistencyCheckResults:(id)a4 completion:(id)a5;
- (unint64_t)registerDeviceAtBrokerURL:(id)a3 withConsistencyCheckResults:(id)a4 retries:(unint64_t)a5 completion:(id)a6;
- (unint64_t)registerDeviceWithCompletion:(id)a3;
- (unint64_t)remotePaymentCredentialsForRequest:(id)a3 completion:(id)a4;
- (unint64_t)remotePaymentCredentialsUpdateForRequest:(id)a3 completion:(id)a4;
- (unint64_t)repopulateZonesWithCloudStoreZoneNames:(id)a3 completion:(id)a4;
- (unint64_t)requestPhysicalCardWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)requestVerificationCodeForPass:(id)a3 usingChannel:(id)a4 completion:(id)a5;
- (unint64_t)requirementsForRequest:(id)a3 completion:(id)a4;
- (unint64_t)resendVerificationRequest:(id)a3 completion:(id)a4;
- (unint64_t)resolveStorefrontCountryMismatchWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)retrieveMerchantTokensWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)retrievePrivacyDeviceAssessmentStateWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)revokeSharedCredentialWithRequest:(id)a3 withCompletion:(id)a4;
- (unint64_t)rewrapInAppPayment:(id)a3 merchantIdentifier:(id)a4 hostApplicationIdentifier:(id)a5 applicationData:(id)a6 pass:(id)a7 completion:(id)a8;
- (unint64_t)rewrapInAppPayment:(id)a3 merchantIdentifier:(id)a4 merchantSession:(id)a5 hostApplicationIdentifier:(id)a6 applicationData:(id)a7 pass:(id)a8 paymentApplication:(id)a9 completion:(id)a10;
- (unint64_t)rewrapInAppPaymentWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5;
- (unint64_t)savingsAccountStatementsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)savingsAccountUserInfoWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)schedulePaymentWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)scheduleTransferWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)sendOwnershipTokensForReason:(unint64_t)a3 completion:(id)a4;
- (unint64_t)sendPrivacyDeviceAssessmentStateWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)serviceProviderAugmentSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5;
- (unint64_t)serviceProviderNonceWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5;
- (unint64_t)serviceProviderPurchaseWithIdentifier:(id)a3 completion:(id)a4;
- (unint64_t)serviceProviderPurchasesWithRequest:(id)a3 inRegion:(id)a4 completion:(id)a5;
- (unint64_t)sharedAccountCloudStoreWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)shownTermsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)submitDocumentsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)submitTermsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)submitVerificationCode:(id)a3 verificationData:(id)a4 forPass:(id)a5 completion:(id)a6;
- (unint64_t)submitVerificationWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)supportTopicsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)tapToProvisionConfigurationForRequest:(id)a3 completion:(id)a4;
- (unint64_t)termsDataWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)transactionReceiptAuthorizationWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)transactionReceiptWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)transferEligibilityWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)transfersWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)unregisterDeviceWithCompanionSerialNumber:(id)a3 completion:(id)a4;
- (unint64_t)unregisterDeviceWithCompletion:(id)a3;
- (unint64_t)updateAccountUserPreferencesWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)updateRegistrationDataAtBrokerURL:(id)a3 completion:(id)a4;
- (unint64_t)updateVerification:(id)a3 completion:(id)a4;
- (unint64_t)vehicleManufacturerWithRequest:(id)a3 withCompletion:(id)a4;
- (unint64_t)verificationChannelsForPass:(id)a3 completion:(id)a4;
- (unint64_t)verificationOptionsForRequest:(id)a3 completion:(id)a4;
- (unint64_t)virtualCardActionWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)virtualCardLegacyCredentialsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)virtualCardListWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)virtualCardPaymentSessionWithCompletion:(id)a3;
- (unint64_t)virtualCardSecurityCodeActivity:(id)a3 completion:(id)a4;
- (unint64_t)vpanNonceForPaymentPass:(id)a3 completion:(id)a4;
- (unint64_t)vpanPaymentCredentialsForPaymentPass:(id)a3 vpanIdentifier:(id)a4 nonce:(id)a5 encryptionFields:(id)a6 merchantHost:(id)a7 completion:(id)a8;
- (unint64_t)vpanPaymentCredentialsForPaymentPass:(id)a3 vpanIdentifier:(id)a4 nonce:(id)a5 encryptionFields:(id)a6 merchantHost:(id)a7 regenerate:(BOOL)a8 completion:(id)a9;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_applePayTrustPublicKeyHashWithCompletion:(id)a3;
- (void)_archiveBackgroundContext;
- (void)_archiveContext;
- (void)_auxiliaryRegistrationServiceURLForRequest:(id)a3 completion:(id)a4;
- (void)_backgroundDownloadCloudStoreAssetsforItem:(id)a3 cloudStoreCoordinatorDelegate:(id)a4;
- (void)_canRegisterForPeerPaymentWithCompletion:(id)a3;
- (void)_cleanupPassDownloadCache;
- (void)_createApplePayTrustKeyWithCompletion:(id)a3;
- (void)_deviceConfigurationDataWithCompletion:(id)a3;
- (void)_deviceDataIncludingMetadataFields:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)_deviceProvisioningDataIncludingDeviceMetadata:(BOOL)a3 withCompletion:(id)a4;
- (void)_deviceRegistrationDataWithCompletion:(id)a3;
- (void)_handleDeviceCheckInTask:(id)a3 downloadRecord:(id)a4 data:(id)a5;
- (void)_handlePassDownloadTask:(id)a3 data:(id)a4;
- (void)_handlePassListDownloadTask:(id)a3 data:(id)a4;
- (void)_handleRemoteAssetDownloadForManifestItem:(id)a3 taskPassURL:(id)a4 data:(id)a5 shouldWriteData:(BOOL)a6;
- (void)_handleRemoteCloudStoreAssetForRecordName:(id)a3 taskRecord:(id)a4 data:(id)a5 shouldWriteData:(BOOL)a6;
- (void)_handleRemoteURLAssetDownloadTask:(id)a3 data:(id)a4;
- (void)_handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest:(id)a3 completionHandler:(id)a4;
- (void)_handleRetryAfterRegisterWithRequest:(id)a3 response:(id)a4 completionHandler:(id)a5;
- (void)_handleRetryAfterTSMSyncForPushTopic:(id)a3 withRequest:(id)a4 taskIdentifier:(unint64_t)a5 completionHandler:(id)a6;
- (void)_passOwnershipTokenForPaymentCredential:(id)a3 completion:(id)a4;
- (void)_passWithData:(id)a3 response:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_performVerificationRequest:(id)a3 selectedChannel:(id)a4 paymentPass:(id)a5 taskID:(unint64_t)a6 completion:(id)a7;
- (void)_recentConfiguration:(id)a3;
- (void)_regionChanged;
- (void)_registerIfNeededWithResponse:(id)a3 task:(id)a4 isRedirect:(BOOL)a5 completion:(id)a6;
- (void)_renewAppleAccountWithCompletionHandler:(id)a3;
- (void)_resetSupportInRegionCache;
- (void)_shouldPerformApplePayTrustRegistrationWithCompletion:(id)a3;
- (void)_startBackgroundURLSessionWithIdentifier:(id)a3 context:(id)a4 backgroundDelegate:(id)a5 completion:(id)a6;
- (void)_storePassOwnershipToken:(id)a3 withIdentifier:(id)a4;
- (void)_updateRequestWithCurrentTargetDevice:(id)a3;
- (void)_updateSharedServiceWithContext:(id)a3;
- (void)addDelegate:(id)a3;
- (void)backgroundDownloadPassAtURL:(id)a3;
- (void)backgroundDownloadPassesForPushTopic:(id)a3 sinceLastUpdatedTag:(BOOL)a4;
- (void)backgroundDownloadPassesSinceLastUpdatedTag:(BOOL)a3;
- (void)backgroundDownloadRemotePassAssets:(id)a3;
- (void)backgroundDownloadRemotePassAssets:(id)a3 cloudStoreCoordinatorDelegate:(id)a4;
- (void)backgroundDownloadRemotePassAssets:(id)a3 forSuffixesAndScreenScales:(id)a4;
- (void)backgroundDownloadRemotePassAssets:(id)a3 forSuffixesAndScreenScales:(id)a4 cloudStoreCoordinatorDelegate:(id)a5;
- (void)backgroundDownloadWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (void)backgroundPerformDeviceCheckInForRegion:(id)a3 identifier:(id)a4;
- (void)backgroundRegisterCredentialWithRequest:(id)a3;
- (void)dealloc;
- (void)getHasBackgroundDownloadTaskPassesForPushTopic:(id)a3 completion:(id)a4;
- (void)handleResponse:(id)a3 withError:(id)a4 data:(id)a5 task:(id)a6 completionHandler:(id)a7;
- (void)handleWillPerformHTTPRedirectionWithResponse:(id)a3 originalRequest:(id)a4 redirectHandler:(id)a5;
- (void)invalidateBackgroundSession;
- (void)processRetryRequest:(id)a3 responseData:(id)a4 orginalRequest:(id)a5 completion:(id)a6;
- (void)removeDelegate:(id)a3;
- (void)removeVerificationRequestRecord:(id)a3;
- (void)setArchiver:(id)a3;
- (void)setBackgroundContext:(id)a3;
- (void)setBackgroundDelegate:(id)a3;
- (void)setContext:(id)a3;
- (void)setSharedService:(BOOL)a3;
- (void)sharedPaymentServiceChanged:(id)a3;
- (void)signNonce:(id)a3 withCompletion:(id)a4;
- (void)startBackgroundURLSessionWithIdentifier:(id)a3 context:(id)a4 backgroundDelegate:(id)a5;
- (void)startBackgroundURLSessionWithIdentifier:(id)a3 context:(id)a4 backgroundDelegate:(id)a5 completion:(id)a6;
- (void)updateContextAndNotifyIfNeeded:(id)a3;
- (void)updateVerificationRecord:(id)a3;
@end

@implementation PKPaymentWebService

- (BOOL)needsConfiguration
{
  return [(PKPaymentWebService *)self needsConfigurationWithSupportedRegionTimeInterval:3600.0 unsupportedRegionTimeInterval:3600.0];
}

- (id)supportedRegionFeatureOfType:(int64_t)a3 didFailOSVersionRequirements:(BOOL *)a4
{
  if (a4) {
    *a4 = 0;
  }
  v7 = [(PKPaymentWebService *)self context];
  v8 = [v7 configuration];

  if (v8)
  {
    v9 = [(PKPaymentWebService *)self targetDevice];
    v10 = [v9 deviceRegion];
    v11 = [v9 deviceClass];
    v12 = [v9 deviceVersion];
    v13 = [v8 supportedFeatureOfType:a3 inRegion:v10 osVersion:v12 deviceClass:v11 didFailOSVersionRequirements:a4];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  return self->_targetDevice;
}

- (BOOL)needsConfigurationWithSupportedRegionTimeInterval:(double)a3 unsupportedRegionTimeInterval:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v7 = [(PKPaymentWebService *)self context];
  v8 = [v7 configurationDate];
  if (v8)
  {
    v9 = [v7 configuration];
    if (!v9)
    {
      v10 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Configuration parameters not set - Configuration needs update", (uint8_t *)&v26, 2u);
      }
      LOBYTE(v18) = 1;
      goto LABEL_34;
    }
    v10 = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice deviceRegion];
    uint64_t v11 = [v9 heroImageManifestURLForRegion:v10];
    if (v11)
    {
      v12 = (void *)v11;
      BOOL v13 = +[PKPaymentHeroImageManifest manifestFileExistsForRegion:v10];

      if (!v13)
      {
        v16 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          v17 = "Hero image manifest file does not exist - Configuration needs update";
          goto LABEL_21;
        }
LABEL_22:
        LOBYTE(v18) = 1;
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
    }
    v14 = [v9 configurationURL];
    int v15 = PKStockholmForceConfigUpdate(v14, [v7 devSigned], -[PKPaymentWebService _isSandboxAccount](self, "_isSandboxAccount"));

    if (v15)
    {
      v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        v17 = "Forcing config update - Configuration needs update";
LABEL_21:
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v26, 2u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    v16 = [MEMORY[0x1E4F1C9C8] date];
    unint64_t v19 = [(PKPaymentWebService *)self paymentSetupSupportedInRegion];
    if (v19)
    {
      if (v19 == 1)
      {
        v20 = [v8 dateByAddingTimeInterval:a3];
        v21 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138412546;
          v27 = v20;
          __int16 v28 = 2050;
          unint64_t v29 = (unint64_t)a3;
          v22 = "Region supported, next date for region configuration check: %@ used refresh interval: %{public}lu";
          goto LABEL_25;
        }
LABEL_26:

        [v16 timeIntervalSinceDate:v20];
        BOOL v18 = v23 > 0.0;

LABEL_28:
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v24 = @"NO";
          if (v18) {
            v24 = @"YES";
          }
          int v26 = 138543362;
          v27 = v24;
          _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Needs updating? %{public}@", (uint8_t *)&v26, 0xCu);
        }

        goto LABEL_33;
      }
      if (v19 != 2)
      {
        v21 = PKLogFacilityTypeGetObject(6uLL);
        BOOL v18 = 0;
        goto LABEL_28;
      }
    }
    v20 = [v8 dateByAddingTimeInterval:a4];
    v21 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412546;
      v27 = v20;
      __int16 v28 = 2050;
      unint64_t v29 = (unint64_t)a4;
      v22 = "Region unsupported, next date for region configuration check: %@ used refresh value in the configuration: %{public}lu";
LABEL_25:
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v26, 0x16u);
      goto LABEL_26;
    }
    goto LABEL_26;
  }
  v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Web service never configured - Configuration needs update", (uint8_t *)&v26, 2u);
  }
  LOBYTE(v18) = 1;
LABEL_35:

  return v18;
}

- (unint64_t)paymentSetupSupportedInRegion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t paymentSupportInRegion = self->_paymentSupportInRegion;
  if (!paymentSupportInRegion || !self->_sharedService)
  {
    uint64_t paymentSupportInRegion = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice paymentSupportedInCurrentRegionForWebService:self];
    self->_uint64_t paymentSupportInRegion = paymentSupportInRegion;
  }
  os_unfair_lock_unlock(p_lock);
  if (paymentSupportInRegion == 1)
  {
    v5 = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice deviceRegion];
    v6 = [(PKPaymentWebService *)self context];
    char v7 = [v6 contextMeetsProvisioningEnablementPercentageThresholdForRegion:v5];

    if (v7)
    {
      uint64_t paymentSupportInRegion = 1;
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Payment setup is supported in region, however region has a provisioning enablement percentage specified and our current context does not meet it. Forcing paymentSetupSupportedInRegion to PKPaymentSupportInRegionNotSupported.", v10, 2u);
      }

      uint64_t paymentSupportInRegion = 2;
    }
  }
  return paymentSupportInRegion;
}

- (PKPaymentWebServiceContext)context
{
  p_contextLock = &self->_contextLock;
  os_unfair_lock_lock(&self->_contextLock);
  v4 = self->_context;
  os_unfair_lock_unlock(p_contextLock);
  return v4;
}

- (BOOL)_isSandboxAccount
{
  v2 = [(PKPaymentWebService *)self _appleAccountInformation];
  char v3 = [v2 isSandboxAccount];

  return v3;
}

- (id)_appleAccountInformation
{
  return (id)[(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice appleAccountInformation];
}

+ (id)sharedService
{
  v2 = (void *)qword_1E92C3190;
  if (!qword_1E92C3190)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_33);
    if (!qword_1E92C3190)
    {
      char v3 = objc_alloc_init(PKPaymentService);
      v4 = [(PKPaymentService *)v3 sharedPaymentWebServiceContext];
      if (v4)
      {
        v5 = [PKPaymentWebService alloc];
        v6 = +[PKPaymentWebServiceTargetDevice localTargetDevice];
        char v7 = +[PKSharedPaymentWebServiceArchiver sharedPaymentWebServiceArchiver];
        uint64_t v8 = [(PKPaymentWebService *)v5 initWithContext:v4 targetDevice:v6 archiver:v7 tapToRadarDelegate:v3];
        v9 = (void *)qword_1E92C3190;
        qword_1E92C3190 = v8;

        [(id)qword_1E92C3190 setSharedService:1];
      }
      else
      {
        v10 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_190E10000, v10, OS_LOG_TYPE_ERROR, "Error: Failed to get the shared payment web service context.", buf, 2u);
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_33);
    v2 = (void *)qword_1E92C3190;
    if (!qword_1E92C3190)
    {
      uint64_t v11 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v13 = 0;
        _os_log_error_impl(&dword_190E10000, v11, OS_LOG_TYPE_ERROR, "Error: Failed to get the shared payment web service, therefore +[PKPaymentWebService sharedService] is not available. This is likely an entitlements issue or passd hasn't initialized yet.", v13, 2u);
      }

      v2 = (void *)qword_1E92C3190;
    }
  }
  return v2;
}

- (void)setSharedService:(BOOL)a3
{
  self->_sharedService = a3;
  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 addObserver:self selector:sel_sharedPaymentServiceChanged_ name:@"PDSharedPaymentWebServiceDidChangeNotification" object:0 suspensionBehavior:2];
}

- (PKPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5 tapToRadarDelegate:(id)a6
{
  id v11 = a5;
  v12 = [(PKPaymentWebService *)self initWithContext:a3 targetDevice:a4 tapToRadarDelegate:a6];
  BOOL v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_archiver, a5);
  }

  return v13;
}

- (PKPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 tapToRadarDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentWebService;
  id v11 = [(PKWebService *)&v26 initWithTapToRadarDelegate:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    objc_storeStrong((id *)&v12->_targetDevice, a4);
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_delegateLock._os_unfair_lock_opaque = 0;
    v12->_contextLock._os_unfair_lock_opaque = 0;
    BOOL v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    passesByLocalURL = v12->_passesByLocalURL;
    v12->_passesByLocalURL = v13;

    dispatch_queue_t v15 = dispatch_queue_create("background download session queue", 0);
    backgroundDownloadQueue = v12->_backgroundDownloadQueue;
    v12->_backgroundDownloadQueue = (OS_dispatch_queue *)v15;

    v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    backgroundSessionDelegateQueue = v12->_backgroundSessionDelegateQueue;
    v12->_backgroundSessionDelegateQueue = v17;

    [(NSOperationQueue *)v12->_backgroundSessionDelegateQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v12->_backgroundSessionDelegateQueue setUnderlyingQueue:v12->_backgroundDownloadQueue];
    unint64_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passkit.paymentwebservice.background", v19);
    backgroundQueue = v12->_backgroundQueue;
    v12->_backgroundQueue = (OS_dispatch_queue *)v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeRegistrationTasks = v12->_activeRegistrationTasks;
    v12->_activeRegistrationTasks = v22;

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v12 selector:sel__regionChanged name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v12;
}

- (int64_t)logFacilityType
{
  return 6;
}

- (unint64_t)registerAuxiliaryCapabilityWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];
  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    objc_initWeak(location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke;
    v14[3] = &unk_1E56DCB40;
    objc_copyWeak(v18, location);
    id v17 = v7;
    id v15 = v6;
    id v16 = v10;
    v18[1] = v8;
    [(PKPaymentWebService *)self _auxiliaryRegistrationServiceURLForRequest:v15 completion:v14];

    objc_destroyWeak(v18);
    objc_destroyWeak(location);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject(0x1CuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Missing deviceID", (uint8_t *)location, 2u);
    }

    if (v7)
    {
      v12 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v12);
    }
  }

  return (unint64_t)v8;
}

void __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (!v14) {
      goto LABEL_9;
    }
    id v15 = *(void (**)(void))(v14 + 16);
LABEL_8:
    v15();
    goto LABEL_9;
  }
  if (!v5)
  {
    uint64_t v16 = *(void *)(a1 + 48);
    if (!v16) {
      goto LABEL_9;
    }
    id v15 = *(void (**)(void))(v16 + 16);
    goto LABEL_8;
  }
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = [WeakRetained _appleAccountInformation];
  v12 = [v9 _urlRequestWithServiceURL:v5 deviceIdentifier:v10 appleAccountInformation:v11];

  uint64_t v13 = *(void *)(a1 + 64);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke_2;
  v17[3] = &unk_1E56DCB18;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  id v18 = *(id *)(a1 + 48);
  [v8 performRequest:v12 taskIdentifier:v13 completionHandler:v17];

  objc_destroyWeak(&v19);
LABEL_9:
}

void __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v22 = 0;
    double v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__5;
    objc_super v26 = __Block_byref_object_dispose__5;
    id v27 = 0;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke_10;
    id v19 = &unk_1E56DCAF0;
    v21 = &v22;
    id v11 = v7;
    id v20 = v11;
    uint64_t v12 = [WeakRetained _auxiliaryCapabilityRegisterResultForResponse:v8 error:v9 successHandler:&v16];
    uint64_t v13 = v12;
    if (!v9 && v12 != 1)
    {
      objc_msgSend(WeakRetained, "_errorWithResult:data:", v12, v11, v16, v17, v18, v19);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v14 + 16))(v14, v13, v23[5], v9);
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, void, void, void))(v15 + 16))(v15, 0, 0, 0);
    }
  }
}

BOOL __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke_10(uint64_t a1)
{
  v2 = [[PKAuxiliaryCapabilityRegisterResponse alloc] initWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)_auxiliaryCapabilityRegisterResultForResponse:(id)a3 error:(id)a4 successHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (uint64_t (**)(void))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v8)
    {
      id v11 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v7 URL];
        uint64_t v13 = [v12 absoluteString];
        int v15 = 138412546;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ error: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    goto LABEL_8;
  }
  if ((unint64_t)([v7 statusCode] - 200) > 0x63)
  {
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_9;
  }
  unint64_t v10 = v9[2](v9);
LABEL_9:

  return v10;
}

- (unint64_t)checkAuxiliaryCapabilityRegistrationStateWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(PKWebService *)self nextTaskID];
    id v9 = [(PKPaymentWebService *)self context];
    unint64_t v10 = [v9 deviceID];
    if (v10)
    {
      [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
      objc_initWeak(location, self);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke;
      v14[3] = &unk_1E56DCB40;
      objc_copyWeak(v18, location);
      id v17 = v7;
      id v15 = v6;
      id v16 = v10;
      v18[1] = v8;
      [(PKPaymentWebService *)self _auxiliaryRegistrationServiceURLForRequest:v15 completion:v14];

      objc_destroyWeak(v18);
      objc_destroyWeak(location);
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject(0x1CuLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Missing deviceID", (uint8_t *)location, 2u);
      }

      uint64_t v12 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v12);
    }
  }
  else
  {
    id v8 = 0;
  }

  return (unint64_t)v8;
}

void __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (!v14) {
      goto LABEL_9;
    }
    id v15 = *(void (**)(void))(v14 + 16);
LABEL_8:
    v15();
    goto LABEL_9;
  }
  if (!v5)
  {
    uint64_t v16 = *(void *)(a1 + 48);
    if (!v16) {
      goto LABEL_9;
    }
    id v15 = *(void (**)(void))(v16 + 16);
    goto LABEL_8;
  }
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = [WeakRetained _appleAccountInformation];
  uint64_t v12 = [v9 _urlRequestWithServiceURL:v5 deviceIdentifier:v10 appleAccountInformation:v11];

  uint64_t v13 = *(void *)(a1 + 64);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke_2;
  v17[3] = &unk_1E56DCB18;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  id v18 = *(id *)(a1 + 48);
  [v8 performRequest:v12 taskIdentifier:v13 completionHandler:v17];

  objc_destroyWeak(&v19);
LABEL_9:
}

void __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__5;
    v19[4] = __Block_byref_object_dispose__5;
    id v20 = 0;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke_3;
    uint64_t v16 = &unk_1E56DCAF0;
    id v18 = v19;
    id v11 = v7;
    id v17 = v11;
    uint64_t v12 = [WeakRetained _resultForResponse:v8 error:v9 successHandler:&v13];
    if (!v9 && v12 != 1)
    {
      objc_msgSend(WeakRetained, "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    _Block_object_dispose(v19, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

BOOL __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke_3(uint64_t a1)
{
  v2 = [[PKAuxiliaryCapabilityRegistrationStateResponse alloc] initWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)auxiliaryCapabilityKeyCreationMetadataWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(PKWebService *)self nextTaskID];
    id v9 = [(PKPaymentWebService *)self context];
    uint64_t v10 = [v9 deviceID];
    if (v10)
    {
      [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
      objc_initWeak(location, self);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke;
      v14[3] = &unk_1E56DCB40;
      objc_copyWeak(v18, location);
      id v17 = v7;
      id v15 = v6;
      id v16 = v10;
      v18[1] = v8;
      [(PKPaymentWebService *)self _auxiliaryRegistrationServiceURLForRequest:v15 completion:v14];

      objc_destroyWeak(v18);
      objc_destroyWeak(location);
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject(0x1CuLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Missing deviceID", (uint8_t *)location, 2u);
      }

      uint64_t v12 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);

      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (unint64_t)v8;
}

void __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (!v14) {
      goto LABEL_9;
    }
    id v15 = *(void (**)(void))(v14 + 16);
LABEL_8:
    v15();
    goto LABEL_9;
  }
  if (!v5)
  {
    uint64_t v16 = *(void *)(a1 + 48);
    if (!v16) {
      goto LABEL_9;
    }
    id v15 = *(void (**)(void))(v16 + 16);
    goto LABEL_8;
  }
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = [WeakRetained _appleAccountInformation];
  uint64_t v12 = [v9 _urlRequestWithServiceURL:v5 deviceIdentifier:v10 appleAccountInformation:v11];

  uint64_t v13 = *(void *)(a1 + 64);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke_2;
  v17[3] = &unk_1E56DCB18;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  id v18 = *(id *)(a1 + 48);
  [v8 performRequest:v12 taskIdentifier:v13 completionHandler:v17];

  objc_destroyWeak(&v19);
LABEL_9:
}

void __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__5;
    v19[4] = __Block_byref_object_dispose__5;
    id v20 = 0;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke_3;
    uint64_t v16 = &unk_1E56DCAF0;
    id v18 = v19;
    id v11 = v7;
    id v17 = v11;
    uint64_t v12 = [WeakRetained _resultForResponse:v8 error:v9 successHandler:&v13];
    if (!v9 && v12 != 1)
    {
      objc_msgSend(WeakRetained, "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    _Block_object_dispose(v19, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

BOOL __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke_3(uint64_t a1)
{
  v2 = [[PKAuxiliaryCapabilityKeyCreationMetadataResponse alloc] initWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)fetchBarcodesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];
  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    objc_initWeak(&location, self);
    id v11 = [v6 pass];
    uint64_t v12 = [v11 passTypeIdentifier];
    uint64_t v13 = [v9 regionForIdentifier:v12];
    uint64_t v14 = [v13 partnerServiceURL];

    id v15 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v16 = [v6 _urlRequestWithServiceURL:v14 deviceIdentifier:v10 appleAccountInformation:v15];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __92__PKPaymentWebService_PKAuxiliaryCapabilityWebService__fetchBarcodesWithRequest_completion___block_invoke;
    v19[3] = &unk_1E56DCB18;
    objc_copyWeak(&v21, &location);
    id v20 = v7;
    [(PKWebService *)self performRequest:v16 taskIdentifier:v8 completionHandler:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    id v17 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v17);
  }
  return v8;
}

void __92__PKPaymentWebService_PKAuxiliaryCapabilityWebService__fetchBarcodesWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v22 = 0;
    double v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__5;
    objc_super v26 = __Block_byref_object_dispose__5;
    id v27 = 0;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __92__PKPaymentWebService_PKAuxiliaryCapabilityWebService__fetchBarcodesWithRequest_completion___block_invoke_2;
    id v19 = &unk_1E56DCAF0;
    id v21 = &v22;
    id v11 = v7;
    id v20 = v11;
    uint64_t v12 = [WeakRetained _resultForResponse:v8 error:v9 successHandler:&v16];
    uint64_t v13 = v12;
    if (!v9 && v12 != 1)
    {
      objc_msgSend(WeakRetained, "_errorWithResult:data:", v12, v11, v16, v17, v18, v19);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v14 + 16))(v14, v13, v23[5], v9);
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, void, void, void))(v15 + 16))(v15, 0, 0, 0);
    }
  }
}

BOOL __92__PKPaymentWebService_PKAuxiliaryCapabilityWebService__fetchBarcodesWithRequest_completion___block_invoke_2(uint64_t a1)
{
  v2 = [[PKAuxiliaryCapabilityFetchBarcodeResponse alloc] initWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)_auxiliaryRegistrationServiceURLForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v6 pass];
  uint64_t v10 = [v9 passTypeIdentifier];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v8 primaryRegionIdentifier];
  }
  uint64_t v13 = v12;

  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  objc_super v26 = __Block_byref_object_copy__5;
  id v27 = __Block_byref_object_dispose__5;
  uint64_t v14 = [v8 regionForIdentifier:v13];
  id v28 = [v14 partnerServiceURL];

  uint64_t v15 = v24[5];
  if (v15)
  {
    v7[2](v7, v15, 0);
  }
  else
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(0x1CuLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Context missing partnerServiceURL, reregistering", buf, 2u);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __110__PKPaymentWebService_PKAuxiliaryCapabilityWebService___auxiliaryRegistrationServiceURLForRequest_completion___block_invoke;
    v17[3] = &unk_1E56DCB68;
    id v21 = &v23;
    id v18 = v8;
    id v19 = v13;
    id v20 = v7;
    [(PKPaymentWebService *)self registerDeviceWithCompletion:v17];
  }
  _Block_object_dispose(&v23, 8);
}

void __110__PKPaymentWebService_PKAuxiliaryCapabilityWebService___auxiliaryRegistrationServiceURLForRequest_completion___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) regionForIdentifier:*(void *)(a1 + 40)];
  id v4 = [v3 partnerServiceURL];
  id v5 = v4;
  if (!v4)
  {
    v1 = [*(id *)(a1 + 32) primaryRegion];
    id v5 = [v1 partnerServiceURL];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
  if (!v4)
  {
  }
  uint64_t v7 = a1 + 48;
  uint64_t v6 = *(void *)(a1 + 48);
  if (*(void *)(*(void *)(*(void *)(v7 + 8) + 8) + 40))
  {
    id v8 = *(void (**)(uint64_t))(v6 + 16);
    v8(v6);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"partnerServiceURL was nil";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v11 = [v9 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v10];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v11);
  }
}

- (unint64_t)_performPaymentOfferRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  unint64_t v10 = [(PKWebService *)self nextTaskID];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __91__PKPaymentWebService_PaymentOffers___performPaymentOfferRequest_responseClass_completion___block_invoke;
  v13[3] = &unk_1E56DCBE8;
  id v14 = v8;
  Class v15 = a4;
  v13[4] = self;
  id v11 = v8;
  [(PKWebService *)self performRequest:v9 taskIdentifier:v10 completionHandler:v13];

  return v10;
}

void __91__PKPaymentWebService_PaymentOffers___performPaymentOfferRequest_responseClass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__6;
  uint64_t v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  unint64_t v10 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__PKPaymentWebService_PaymentOffers___performPaymentOfferRequest_responseClass_completion___block_invoke_10;
  v15[3] = &unk_1E56DCBC0;
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v17 = &v19;
  uint64_t v18 = v11;
  id v12 = v7;
  id v16 = v12;
  uint64_t v13 = [v10 _resultForResponse:v8 error:v9 successHandler:v15];
  if (!v9 && v13 != 1)
  {
    id v9 = [*(id *)(a1 + 32) _errorWithResult:v13 data:v12];
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v20[5], v9);
  }

  _Block_object_dispose(&v19, 8);
}

BOOL __91__PKPaymentWebService_PaymentOffers___performPaymentOfferRequest_responseClass_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 48) responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)paymentOfferCatalogWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performPaymentOfferRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)paymentOffersDynamicContentWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performPaymentOfferRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)paymentOffersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performPaymentOfferRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)cancelPaymentOfferSessionWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performPaymentOfferRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)paymentRewardsBalancesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performPaymentOfferRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)paymentRewardsRedemptionsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performPaymentOfferRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)transferEligibilityWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)scheduleTransferWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PKPaymentWebService_Savings__scheduleTransferWithRequest_completion___block_invoke;
  v12[3] = &unk_1E56DEF20;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  unint64_t v16 = v8;
  id v9 = v7;
  id v10 = v6;
  [(PKPaymentWebService *)self _applePayTrustPublicKeyHashWithCompletion:v12];

  return v8;
}

void __71__PKPaymentWebService_Savings__scheduleTransferWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPublicKeyHash:a2];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _appleAccountInformation];
  id v5 = [v3 _urlRequestWithAppleAccountInformation:v4];

  [*(id *)(a1 + 40) _performAccountApplePayTrustProtocolRequest:v5 originalRequest:*(void *)(a1 + 32) taskID:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (unint64_t)transfersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountBalanceHistoryWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)dailyCashEligibilityWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)savingsAccountStatementsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountTaxFormsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)savingsAccountUserInfoWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountReportFraudEventWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)discoveryManifestWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  id v6 = [(PKPaymentWebService *)self context];
  id v7 = [v6 configuration];
  unint64_t v8 = PKCurrentRegion();
  id v9 = [v7 discoveryManifestURLForRegion:v8];

  if (v9)
  {
    unint64_t v10 = objc_alloc_init(PKPaymentConfigurationRequest);
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
    uint64_t v11 = [(PKPaymentConfigurationRequest *)v10 _requestWithServiceURL:v9];
    id v12 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v9;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Fetching Discovery Manifest at URL: %@...", buf, 0xCu);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__PKPaymentWebService_PKDiscoveryWebService__discoveryManifestWithCompletion___block_invoke;
    v15[3] = &unk_1E56DF250;
    id v16 = v4;
    [(PKWebService *)self performRequest:v11 taskIdentifier:v5 completionHandler:v15];
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Discovery Manifest URL is nil. Not updating.", buf, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }

  return v5;
}

void __78__PKPaymentWebService_PKDiscoveryWebService__discoveryManifestWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a2;
  id v9 = [[PKDiscoveryManifestResponse alloc] initWithData:v8];

  if (a3)
  {
    unint64_t v10 = [(PKDiscoveryManifestResponse *)v9 manifest];
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 version];
      id v13 = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134217984;
        uint64_t v15 = v12;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Discovery Manifest version is %ld", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)discoveryBundleForURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = objc_alloc_init(PKPaymentConfigurationRequest);
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v9];
  unint64_t v10 = [(PKPaymentConfigurationRequest *)v9 _requestWithServiceURL:v7];

  [(PKWebService *)self performRequest:v10 taskIdentifier:v8 completionHandler:v6];
  return v8;
}

- (unint64_t)vpanNonceForPaymentPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 deviceID];

  unint64_t v10 = [(PKPaymentWebService *)self _appleAccountInformation];
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  if (v7)
  {
    if (v6)
    {
      uint64_t v12 = PKLogFacilityTypeGetObject(6uLL);
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Getting nonce for VPAN", buf, 2u);
        }

        int v14 = [(PKPaymentWebService *)self context];
        uint64_t v15 = [v14 primaryRegion];
        uint64_t v16 = [v15 paymentServicesURL];

        uint64_t v17 = [[PKPaymentCredentialNonceRequest alloc] initWithPaymentPass:v6 deviceIdentifier:v9];
        uint64_t v18 = [(PKPaymentCredentialNonceRequest *)v17 _urlRequestWithServiceURL:v16 appleAccountInformation:v10];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __64__PKPaymentWebService_VPAN__vpanNonceForPaymentPass_completion___block_invoke;
        v21[3] = &unk_1E56DF250;
        id v22 = v7;
        [(PKWebService *)self performRequest:v18 taskIdentifier:v11 completionHandler:v21];

        goto LABEL_16;
      }
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Can't retrieve VPAN nonce without a deviceID", buf, 2u);
      }
    }
    else
    {
      uint64_t v19 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Can't retrieve VPAN nonce without a pass", buf, 2u);
      }
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v16);
    goto LABEL_16;
  }
  uint64_t v16 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Can't retrieve VPAN nonce without a completion", buf, 2u);
  }
LABEL_16:

  return v11;
}

void __64__PKPaymentWebService_VPAN__vpanNonceForPaymentPass_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  unint64_t v10 = [[PKVPANNonceResponse alloc] initWithData:v7];

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [(PKVPANNonceResponse *)v10 nonce];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v6);
}

- (unint64_t)vpanPaymentCredentialsForPaymentPass:(id)a3 vpanIdentifier:(id)a4 nonce:(id)a5 encryptionFields:(id)a6 merchantHost:(id)a7 regenerate:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v44 = a5;
  id v17 = a6;
  id v18 = a7;
  id v43 = a9;
  uint64_t v19 = [(PKPaymentWebService *)self context];
  id v20 = [v19 deviceID];

  uint64_t v21 = [(PKPaymentWebService *)self _appleAccountInformation];
  unint64_t v22 = [(PKWebService *)self nextTaskID];
  unint64_t v23 = v22;
  if (v20)
  {
    v40 = v20;
    unint64_t v41 = v22;
    id v42 = v17;
    id v24 = [(PKPaymentWebService *)self context];
    uint64_t v25 = [v24 primaryRegion];
    objc_super v26 = [v25 paymentServicesURL];

    if (v9)
    {
      id v27 = (objc_class *)objc_opt_class();

      id v28 = 0;
      unint64_t v29 = v44;
      id v30 = v42;
    }
    else
    {
      id v27 = (objc_class *)objc_opt_class();
      unint64_t v29 = v44;
      id v30 = v42;
      id v28 = v18;
    }
    id v39 = v15;
    v34 = (void *)[[v27 alloc] initWithPaymentPass:v15 vpanIdentifier:v16 deviceIdentifier:v40 nonce:v29 encryptionFields:v30 merchantHost:v28];
    v35 = [(PKPaymentWebService *)self _paymentDevice];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke;
    v45[3] = &unk_1E56E94E8;
    id v46 = v34;
    id v47 = v26;
    id v48 = v21;
    v49 = self;
    v36 = v28;
    unint64_t v23 = v41;
    unint64_t v51 = v41;
    v33 = v43;
    id v50 = v43;
    id v37 = v26;
    id v32 = v34;
    [v35 rewrapDataWithCompletionHandler:v45];

    id v17 = v42;
    id v20 = v40;
    id v18 = v36;
    id v15 = v39;
  }
  else
  {
    v31 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Error: Trying to get VPAN credentials without a deviceID. Device registration is necessary.", buf, 2u);
    }

    id v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    v33 = v43;
    (*((void (**)(id, void, id))v43 + 2))(v43, 0, v32);
    unint64_t v29 = v44;
  }

  return v23;
}

void __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke_2;
  v9[3] = &unk_1E56E5200;
  uint64_t v8 = (void *)a1[8];
  uint64_t v7 = a1[9];
  v9[4] = v6;
  uint64_t v11 = v7;
  id v10 = v8;
  [v3 _urlRequestWithServiceURL:v4 rewrapData:a2 appleAccountInformation:v5 webService:v6 completion:v9];
}

void __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke_3;
  v5[3] = &unk_1E56DF250;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 performRequest:a2 taskIdentifier:v3 completionHandler:v5];
}

void __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    if (v9 && v11 && !v8 && [v9 statusCode] == 200)
    {
      id v10 = [[PKVPANPaymentCredentialResponse alloc] initWithData:v11];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      goto LABEL_9;
    }
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

- (unint64_t)vpanPaymentCredentialsForPaymentPass:(id)a3 vpanIdentifier:(id)a4 nonce:(id)a5 encryptionFields:(id)a6 merchantHost:(id)a7 completion:(id)a8
{
  return [(PKPaymentWebService *)self vpanPaymentCredentialsForPaymentPass:a3 vpanIdentifier:a4 nonce:a5 encryptionFields:a6 merchantHost:a7 regenerate:0 completion:a8];
}

- (unint64_t)regeneratePaymentCredentialsForPaymentPass:(id)a3 vpanIdentifier:(id)a4 nonce:(id)a5 encryptionFields:(id)a6 completion:(id)a7
{
  return [(PKPaymentWebService *)self vpanPaymentCredentialsForPaymentPass:a3 vpanIdentifier:a4 nonce:a5 encryptionFields:a6 merchantHost:0 regenerate:1 completion:a7];
}

- (unint64_t)virtualCardPaymentSessionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentWebService *)self context];
  id v6 = [v5 deviceID];

  id v7 = [(PKPaymentWebService *)self _appleAccountInformation];
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 primaryRegion];
  id v11 = [v10 paymentServicesURL];

  if (v6)
  {
    uint64_t v12 = [[PKVPANPaymentSessionRequest alloc] initWithDeviceIdentifier:v6];
    BOOL v13 = [(PKVPANPaymentSessionRequest *)v12 _urlRequestWithServiceURL:v11 appleAccountInformation:v7];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__PKPaymentWebService_VPAN__virtualCardPaymentSessionWithCompletion___block_invoke;
    v16[3] = &unk_1E56DF250;
    id v17 = v4;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];
  }
  else
  {
    int v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error: Trying to start a VPAN session without a deviceID. Device registration is necessary.", buf, 2u);
    }

    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, void, PKVPANPaymentSessionRequest *))v4 + 2))(v4, 0, v12);
  }

  return v8;
}

void __69__PKPaymentWebService_VPAN__virtualCardPaymentSessionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    id v16 = 0;
    id v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v16];
    id v11 = v16;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [[PKPaymentMerchantSession alloc] initWithDictionary:v10];
        uint64_t v13 = *(void *)(a1 + 32);
        if (v12)
        {
          (*(void (**)(uint64_t, PKPaymentMerchantSession *, void))(v13 + 16))(v13, v12, 0);
        }
        else
        {
          id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2005 userInfo:0];
          (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v15);
        }
      }
      else
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2005 userInfo:0];
        (*(void (**)(uint64_t, void, PKPaymentMerchantSession *))(v14 + 16))(v14, 0, v12);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (unint64_t)accountsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [v7 accountServicesURL];
  id v9 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v10 = [v7 _urlRequestWithServiceURL:v8 AppleAccountInformation:v9];

  uint64_t v11 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKPaymentWebService_PKAccountWebService__accountsWithRequest_completion___block_invoke;
  v15[3] = &unk_1E56ED8F8;
  id v16 = v6;
  id v12 = v6;
  unint64_t v13 = [(PKPaymentWebService *)self _performAccountRequest:v10 responseClass:v11 completion:v15];

  return v13;
}

uint64_t __75__PKPaymentWebService_PKAccountWebService__accountsWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)accountWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)deleteAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountActionWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountTermsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountTermsDataWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountPassDetailsRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [(PKPaymentWebService *)self context];
  unint64_t v10 = [v9 deviceID];
  uint64_t v11 = [v7 _urlRequestWithAppleAccountInformation:v8 deviceIdentifier:v10];

  unint64_t v12 = [(PKPaymentWebService *)self _performAccountRequest:v11 responseClass:objc_opt_class() completion:v6];
  return v12;
}

- (unint64_t)accountBankLookupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountStatementsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountDocumentActionWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)schedulePaymentWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PKPaymentWebService_PKAccountWebService__schedulePaymentWithRequest_completion___block_invoke;
  v12[3] = &unk_1E56DEF20;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  unint64_t v16 = v8;
  id v9 = v7;
  id v10 = v6;
  [(PKPaymentWebService *)self _applePayTrustPublicKeyHashWithCompletion:v12];

  return v8;
}

void __82__PKPaymentWebService_PKAccountWebService__schedulePaymentWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPublicKeyHash:a2];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _appleAccountInformation];
  id v5 = [v3 _urlRequestWithAppleAccountInformation:v4];

  [*(id *)(a1 + 40) _performAccountApplePayTrustProtocolRequest:v5 originalRequest:*(void *)(a1 + 32) taskID:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (unint64_t)paymentsWithRequest:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
  uint64_t v11 = [(PKPaymentWebService *)self _appleAccountInformation];
  unint64_t v12 = [v10 _urlRequestWithAppleAccountInformation:v11];

  unint64_t v13 = [(PKPaymentWebService *)self _performAccountRequest:v12 account:v9 responseClass:objc_opt_class() completion:v8];
  return v13;
}

- (unint64_t)cancelPaymentWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)fundingSourcesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)addFundingSourceWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)deleteFundingSourceWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountServiceCertificatesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)customizePhysicalCardWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)requestPhysicalCardWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__PKPaymentWebService_PKAccountWebService__requestPhysicalCardWithRequest_completion___block_invoke;
  v12[3] = &unk_1E56DEF20;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  unint64_t v16 = v8;
  id v9 = v7;
  id v10 = v6;
  [(PKPaymentWebService *)self _applePayTrustPublicKeyHashWithCompletion:v12];

  return v8;
}

void __86__PKPaymentWebService_PKAccountWebService__requestPhysicalCardWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPublicKeyHash:a2];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _appleAccountInformation];
  id v5 = [v3 _urlRequestWithAppleAccountInformation:v4];

  [*(id *)(a1 + 40) _performOptionalAccountApplePayTrustProtocolRequest:v5 originalRequest:*(void *)(a1 + 32) taskID:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (unint64_t)physicalCardActionWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PKPaymentWebService_PKAccountWebService__physicalCardActionWithRequest_completion___block_invoke;
  v12[3] = &unk_1E56DEF20;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  unint64_t v16 = v8;
  id v9 = v7;
  id v10 = v6;
  [(PKPaymentWebService *)self _applePayTrustPublicKeyHashWithCompletion:v12];

  return v8;
}

void __85__PKPaymentWebService_PKAccountWebService__physicalCardActionWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPublicKeyHash:a2];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _appleAccountInformation];
  id v5 = [v3 _urlRequestWithAppleAccountInformation:v4];

  [*(id *)(a1 + 40) _performOptionalAccountApplePayTrustProtocolRequest:v5 originalRequest:*(void *)(a1 + 32) taskID:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (unint64_t)physicalCardsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountUserInfoWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountUpdateUserInfoWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountDeleteBeneficiaryWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)createVirtualCardWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)virtualCardActionWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)virtualCardListWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)virtualCardLegacyCredentialsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)virtualCardSecurityCodeActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountTransactionAnswerWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)applePayTrustSignatureRequestWithRequest:(id)a3 completion:(id)a4
{
  return [(PKPaymentWebService *)self applePayTrustSignatureRequestWithRequest:a3 account:0 completion:a4];
}

- (unint64_t)applePayTrustSignatureRequestWithRequest:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
  uint64_t v11 = [(PKPaymentWebService *)self _appleAccountInformation];
  unint64_t v12 = [v10 _urlRequestWithAppleAccountInformation:v11];

  uint64_t v13 = [v10 responseClass];
  unint64_t v14 = [(PKPaymentWebService *)self _performAccountRequest:v12 account:v9 responseClass:v13 completion:v8];

  return v14;
}

- (unint64_t)performInstallmentBindWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)performInstallmentAuthorizationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__PKPaymentWebService_PKAccountWebService__performInstallmentAuthorizationWithRequest_completion___block_invoke;
  v12[3] = &unk_1E56DEF20;
  id v13 = v6;
  unint64_t v14 = self;
  id v15 = v7;
  unint64_t v16 = v8;
  id v9 = v7;
  id v10 = v6;
  [(PKPaymentWebService *)self _applePayTrustPublicKeyHashWithCompletion:v12];

  return v8;
}

void __98__PKPaymentWebService_PKAccountWebService__performInstallmentAuthorizationWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPublicKeyHash:a2];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _appleAccountInformation];
  id v5 = [v3 _urlRequestWithAppleAccountInformation:v4];

  [*(id *)(a1 + 40) _performAccountApplePayTrustProtocolRequest:v5 originalRequest:*(void *)(a1 + 32) taskID:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (unint64_t)exportTransactionDataWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 request:v7 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountUsersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)deleteAccountUserWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)updateAccountUserPreferencesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)sharedAccountCloudStoreWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)createdZoneWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)promotionsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)enhancedMerchantsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountSendReportWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)supportTopicsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)creditRecoveryPaymentPlansWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (void)handleResponse:(id)a3 withError:(id)a4 data:(id)a5 task:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v33 = a4;
  id v34 = a5;
  objc_initWeak(location, a6);
  id v13 = a7;
  id WeakRetained = objc_loadWeakRetained(location);
  id v15 = [WeakRetained currentRequest];

  uint64_t v16 = [v12 statusCode];
  if (v16 != 301)
  {
    if (v16 == 412)
    {
      uint64_t v21 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Received Status Code 412.", buf, 2u);
      }

      id v17 = objc_msgSend(v12, "pk_valueForHTTPHeaderField:", @"X-Pod-Region");
      unint64_t v22 = [(PKPaymentWebService *)self context];
      unint64_t v23 = [v22 regionForIdentifier:v17];
      id v24 = v23;
      if (!v23
        || ([v23 trustedServiceManagerPushTopic],
            (uint64_t v25 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_super v26 = objc_msgSend(v22, "primaryRegion", v33);
        uint64_t v25 = [v26 trustedServiceManagerPushTopic];
      }
      id v27 = objc_msgSend(v15, "mutableCopy", v33);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __76__PKPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke;
      v43[3] = &unk_1E56EDF58;
      v43[4] = self;
      id v28 = v25;
      id v44 = v28;
      objc_copyWeak(&v46, location);
      id v45 = v13;
      [(PKPaymentWebService *)self processRetryRequest:v27 responseData:v34 orginalRequest:v15 completion:v43];

      objc_destroyWeak(&v46);
    }
    else if (v16 == 452)
    {
      if (self->_handlingApplePayTrustReRegister)
      {
        id v17 = objc_loadWeakRetained(location);
        v42.receiver = self;
        v42.super_class = (Class)PKPaymentWebService;
        [(PKWebService *)&v42 handleResponse:v12 withError:v33 data:v34 task:v17 completionHandler:v13];
      }
      else
      {
        self->_handlingApplePayTrustReRegister = 1;
        id v30 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "Received Status Code 452.", buf, 2u);
        }

        v31 = PKLogFacilityTypeGetObject(0xFuLL);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Submitting Apple Pay Trust enrollment data because of HTTP 452.", buf, 2u);
        }

        id v17 = objc_loadWeakRetained(location);
        id v32 = [v17 originalRequest];
        [(PKPaymentWebService *)self _handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest:v32 completionHandler:v13];
      }
    }
    else
    {
      id v29 = objc_loadWeakRetained(location);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __76__PKPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke_98;
      v35[3] = &unk_1E56EDF80;
      id v40 = v13;
      id v36 = v12;
      id v37 = v33;
      id v38 = v34;
      objc_copyWeak(&v41, location);
      id v39 = self;
      [(PKPaymentWebService *)self _registerIfNeededWithResponse:v36 task:v29 isRedirect:0 completion:v35];

      objc_destroyWeak(&v41);
      id v17 = v40;
    }
LABEL_22:

    goto LABEL_23;
  }
  id v18 = objc_msgSend(v12, "pk_valueForHTTPHeaderField:", @"Location");

  uint64_t v19 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Server requested redirect which was handled early. Not Reregistering.", buf, 2u);
    }

    id v17 = objc_loadWeakRetained(location);
    v47.receiver = self;
    v47.super_class = (Class)PKPaymentWebService;
    [(PKWebService *)&v47 handleResponse:v12 withError:v33 data:v34 task:v17 completionHandler:v13];
    goto LABEL_22;
  }
  if (v20)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Received Status Code 301.", buf, 2u);
  }

  [(PKPaymentWebService *)self _handleRetryAfterRegisterWithRequest:v15 response:v12 completionHandler:v13];
LABEL_23:

  objc_destroyWeak(location);
}

void __76__PKPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = (id *)(a1 + 7);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v3, "_handleRetryAfterTSMSyncForPushTopic:withRequest:taskIdentifier:completionHandler:", v4, v6, objc_msgSend(WeakRetained, "taskIdentifier"), a1[6]);
}

void __76__PKPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke_98(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4) {
      (*(void (**)(uint64_t, void, void, id))(v4 + 16))(v4, 0, 0, v3);
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    unint64_t v8 = *(void **)(a1 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v10 = *(void *)(a1 + 64);
    v11.receiver = v8;
    v11.super_class = (Class)PKPaymentWebService;
    objc_msgSendSuper2(&v11, sel_handleResponse_withError_data_task_completionHandler_, v5, v6, v7, WeakRetained, v10);
  }
}

- (BOOL)canBypassTrustValidation
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentWebService;
  if ([(PKWebService *)&v8 canBypassTrustValidation]) {
    return 1;
  }
  id v3 = [(PKPaymentWebService *)self context];
  int v4 = [v3 devSigned];

  if (v4)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Allowing bypass of extended trust validation by dev-signed SE", v7, 2u);
    }

    return 1;
  }
  return 0;
}

+ (id)remoteDeviceWebService
{
  uint64_t v2 = +[PKPassLibrary sharedInstanceWithRemoteLibrary];
  if ([v2 _hasRemoteLibrary])
  {
    id v3 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_3[0]());
    int v4 = [v3 watchPaymentWebService];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (PKPaymentWebService)initWithTapToRadarDelegate:(id)a3
{
  return [(PKPaymentWebService *)self initWithContext:0 targetDevice:0 tapToRadarDelegate:a3];
}

- (PKPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5
{
  return [(PKPaymentWebService *)self initWithContext:a3 targetDevice:a4 archiver:a5 tapToRadarDelegate:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (self->_sharedService)
  {
    int v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 removeObserver:self name:@"PDSharedPaymentWebServiceDidChangeNotification" object:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentWebService;
  [(PKPaymentWebService *)&v5 dealloc];
}

- (void)setContext:(id)a3
{
  int v4 = (PKPaymentWebServiceContext *)a3;
  os_unfair_lock_lock(&self->_contextLock);
  context = self->_context;
  self->_context = v4;

  self->_uint64_t paymentSupportInRegion = 0;
  self->_registrationSupportInRegion = 0;
  os_unfair_lock_unlock(&self->_contextLock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_lock_lock(&self->_delegateLock);
    delegates = self->_delegates;
    if (!delegates)
    {
      objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
      uint64_t v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = self->_delegates;
      self->_delegates = v6;

      delegates = self->_delegates;
    }
    [(NSHashTable *)delegates addObject:v8];
    os_unfair_lock_unlock(&self->_delegateLock);
    id v4 = v8;
  }
}

- (void)removeDelegate:(id)a3
{
  if (a3)
  {
    p_delegateLock = &self->_delegateLock;
    id v5 = a3;
    os_unfair_lock_lock(p_delegateLock);
    [(NSHashTable *)self->_delegates removeObject:v5];

    os_unfair_lock_unlock(p_delegateLock);
  }
}

- (void)sharedPaymentServiceChanged:(id)a3
{
  if (self->_sharedService)
  {
    id v4 = objc_alloc_init(PKPaymentService);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PKPaymentWebService_sharedPaymentServiceChanged___block_invoke;
    v6[3] = &unk_1E56EDFA8;
    uint64_t v7 = v4;
    id v8 = self;
    id v5 = v4;
    [(PKPaymentService *)v5 sharedPaymentWebServiceContextWithCompletion:v6];
  }
}

uint64_t __51__PKPaymentWebService_sharedPaymentServiceChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _updateSharedServiceWithContext:a2];
}

- (void)updateContextAndNotifyIfNeeded:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (self->_sharedService) {
      [(PKPaymentWebService *)self _updateSharedServiceWithContext:v4];
    }
    else {
      [(PKPaymentWebService *)self setContext:v4];
    }
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[PKPaymentWebService updateContextAndNotifyIfNeeded:]";
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "%s called without a context. Ignoring.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_updateSharedServiceWithContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL sharedService = self->_sharedService;
  if (v4 && self->_sharedService)
  {
    int v6 = [(PKPaymentWebService *)self context];
    uint64_t v7 = [v6 archivedDate];
    if (v7
      && ([v4 archivedDate],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqualToDate:v8],
          v8,
          v9))
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        PKW3CDateStringFromDate(v7);
        objc_super v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v17 = 136315394;
        id v18 = "-[PKPaymentWebService _updateSharedServiceWithContext:]";
        __int16 v19 = 2112;
        BOOL v20 = v11;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "%s called, however the archivedDates matched with a value of %@. Ignoring.", (uint8_t *)&v17, 0x16u);
      }
    }
    else
    {
      [(PKPaymentWebService *)self setContext:v4];
      id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"PKSharedPaymentWebServiceDidChangeNotification" object:0];

      unint64_t v14 = [v6 configuration];
      id v15 = [v4 configuration];
      char v16 = [v14 isEqual:v15];

      if (v16)
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"PKSharedPaymentWebServiceRegionConfigurationChangedNotification" object:0];
    }

    goto LABEL_14;
  }
  int v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = @"on non-shared service";
    if (sharedService) {
      id v12 = @"without a context";
    }
    int v17 = 136315394;
    id v18 = "-[PKPaymentWebService _updateSharedServiceWithContext:]";
    __int16 v19 = 2112;
    BOOL v20 = v12;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%s called %@. Ignoring.", (uint8_t *)&v17, 0x16u);
  }
LABEL_15:
}

- (void)_regionChanged
{
  id v3 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Device region changed - removing region cache", v4, 2u);
  }

  [(PKPaymentWebService *)self _resetSupportInRegionCache];
}

- (void)_resetSupportInRegionCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_uint64_t paymentSupportInRegion = 0;
  self->_registrationSupportInRegion = 0;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)registrationSetupSupportedInRegion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t registrationSupportInRegion = self->_registrationSupportInRegion;
  if (!registrationSupportInRegion || !self->_sharedService)
  {
    uint64_t registrationSupportInRegion = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice registrationSupportedInCurrentRegionForWebService:self];
    self->_uint64_t registrationSupportInRegion = registrationSupportInRegion;
  }
  os_unfair_lock_unlock(p_lock);
  return registrationSupportInRegion == 1;
}

- (BOOL)needsRegistration
{
  return [(PKPaymentWebService *)self _needsRegistrationShouldCheckSecureElementOwnership:1];
}

- (BOOL)_needsRegistrationShouldCheckSecureElementOwnership:(BOOL)a3
{
  return [(PKPaymentWebService *)self _needsRegistrationForBrokerURL:0 shouldCheckSecureElementOwnership:a3];
}

- (BOOL)needsRegistrationForBrokerURL:(id)a3
{
  return [(PKPaymentWebService *)self _needsRegistrationForBrokerURL:a3 shouldCheckSecureElementOwnership:1];
}

- (BOOL)_needsRegistrationForBrokerURL:(id)a3 shouldCheckSecureElementOwnership:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PKPaymentWebService *)self context];
  uint64_t v8 = [v7 registrationType];
  if (v8 == 3)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v11 = "PKPaymentWebService: needs registration - registration type unknown.";
      goto LABEL_7;
    }
LABEL_8:
    char v12 = 1;
    goto LABEL_45;
  }
  unint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v11 = "PKPaymentWebService: needs registration - never registered.";
LABEL_7:
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v10 addObject:@"Has Previously Registered: YES"];
  unint64_t v51 = v9;
  v52 = v7;
  v49 = self;
  BOOL v50 = v4;
  if (v6)
  {
    id v13 = [v7 regions];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v13);
          }
          __int16 v19 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v53 + 1) + 8 * i)];
          uint64_t v20 = [v19 brokerURL];
          if (v20)
          {
            uint64_t v21 = (void *)v20;
            char v22 = [v6 isEqual:v20];

            if (v22)
            {
              unint64_t v23 = [v19 certificates];
              BOOL v24 = [v23 count] != 0;

              v16 |= v24;
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v15);
    }
    else
    {
      char v16 = 0;
    }
    id v32 = [NSString alloc];
    if (v16) {
      id v33 = @"YES";
    }
    else {
      id v33 = @"NO";
    }
    id v34 = (void *)[v32 initWithFormat:@"Has Certificates: %@", v33];
    [v10 addObject:v34];

    char v29 = v16 ^ 1;
  }
  else
  {
    uint64_t v25 = [v7 primaryRegion];
    objc_super v26 = [v25 certificates];
    uint64_t v27 = [v26 count];

    id v28 = [NSString alloc];
    char v29 = v27 == 0;
    if (v27) {
      id v30 = @"YES";
    }
    else {
      id v30 = @"NO";
    }
    v31 = (void *)[v28 initWithFormat:@"Has Certificates: %@", v30];
    [v10 addObject:v31];
  }
  if (v50)
  {
    v35 = [(PKPaymentWebService *)v49 targetDevice];
    uint64_t v36 = [v35 secureElementOwnershipStateForCurrentUser];

    id v37 = [NSString alloc];
    if ((v36 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      id v38 = @"YES";
    }
    else {
      id v38 = @"NO";
    }
    id v39 = (void *)[v37 initWithFormat:@"User Owns Secure Element: %@", v38];
    [v10 addObject:v39];

    v29 |= (v36 & 0xFFFFFFFFFFFFFFFELL) != 2;
  }
  else
  {
    [v10 addObject:@"Secure Element Ownership Check Skipped"];
  }
  if ((unint64_t)PKCurrentPassbookState() < 2) {
    unint64_t v40 = 1;
  }
  else {
    unint64_t v40 = 2;
  }
  id v41 = [NSString alloc];
  objc_super v42 = PKPaymentWebServiceRegistrationTypeToString(v51);
  id v43 = PKPaymentWebServiceRegistrationTypeToString(v40);
  id v44 = (void *)[v41 initWithFormat:@"Registration Type: %@ -> %@", v42, v43];
  [v10 addObject:v44];

  char v12 = (v51 != v40) | v29;
  id v45 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    if (v12) {
      id v46 = @"YES";
    }
    else {
      id v46 = @"NO";
    }
    objc_super v47 = [v10 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543618;
    v58 = v46;
    __int16 v59 = 2114;
    v60 = v47;
    _os_log_impl(&dword_190E10000, v45, OS_LOG_TYPE_DEFAULT, "Needs Registration: %{public}@ (%{public}@)", buf, 0x16u);
  }
  uint64_t v7 = v52;
LABEL_45:

  return v12 & 1;
}

- (NSURL)primaryBrokerURL
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentWebService *)self context];
  BOOL v4 = PKStockholmBrokerURL();
  if (v4)
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Overriding broker url %@", (uint8_t *)&v12, 0xCu);
    }

    id v6 = v4;
    goto LABEL_5;
  }
  uint64_t v8 = [v3 primaryRegion];
  uint64_t v7 = [v8 brokerURL];

  if (!v7)
  {
    unint64_t v9 = [v3 configuration];
    uint64_t v10 = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice deviceRegion];
    uint64_t v7 = [v9 brokerURLForRegion:v10];

    if (!v7)
    {
      PKLocalBrokerURL([v3 devSigned]);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
      uint64_t v7 = v6;
    }
  }

  return (NSURL *)v7;
}

- (id)_brokerUrlForRegion:(id)a3 regionOut:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PKPaymentWebService *)self context];
  uint64_t v8 = v7;
  if (!v6)
  {
LABEL_7:
    unint64_t v9 = [v8 primaryRegion];
    objc_super v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    goto LABEL_8;
  }
  unint64_t v9 = [v7 regionForIdentifier:v6];
  uint64_t v10 = [v9 brokerURL];
  objc_super v11 = (void *)v10;
  if (!v9 || !v10)
  {
    int v12 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: error: region identifier %@ provided but not registered for region.", (uint8_t *)&v14, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:
  if (a4) {
    objc_storeStrong(a4, v9);
  }

  return v11;
}

- (BOOL)_supportsAccounts
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  targetDevice = self->_targetDevice;
  return [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice paymentWebServiceSupportsAccounts:self];
}

- (BOOL)_canRegisterForPeerPayment
{
  return [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice paymentWebServiceSupportsPeerPaymentRegistration:self];
}

- (void)_canRegisterForPeerPaymentWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    if ([(PKPaymentWebService *)self _canRegisterForPeerPayment])
    {
      v4[2](v4, 1);
    }
    else if ([(PKPaymentWebService *)self needsRegistration])
    {
      v4[2](v4, 0);
    }
    else
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __64__PKPaymentWebService__canRegisterForPeerPaymentWithCompletion___block_invoke;
      v5[3] = &unk_1E56EDFD0;
      void v5[4] = self;
      id v6 = v4;
      [(PKPaymentWebService *)self _recentConfiguration:v5];
    }
  }
}

void __64__PKPaymentWebService__canRegisterForPeerPaymentWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) targetDevice];
    uint64_t v7 = [v6 deviceRegion];

    id v34 = v5;
    int v31 = [v5 peerPaymentEnabledForRegion:v7];
    uint64_t v32 = a1;
    [*(id *)(a1 + 32) context];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v33 = v40 = 0u;
    uint64_t v8 = [v33 regions];
    unint64_t v9 = [v8 allValues];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      char v12 = 0;
      uint64_t v13 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v9);
          }
          id v15 = [*(id *)(*((void *)&v37 + 1) + 8 * i) regionCode];
          uint64_t v16 = v15;
          if (v15)
          {
            uint64_t v17 = [v15 uppercaseString];
            id v18 = [v7 uppercaseString];
            char v19 = [v17 isEqualToString:v18];
          }
          else
          {
            char v19 = 0;
          }
          v12 |= v19;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v11);
    }
    else
    {
      char v12 = 0;
    }

    if (!v31)
    {
      uint64_t v25 = PKLogFacilityTypeGetObject(0xBuLL);
      uint64_t v20 = v33;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v26 = @"NO";
        if (v12) {
          objc_super v26 = @"YES";
        }
        *(_DWORD *)buf = 138543618;
        objc_super v42 = v26;
        __int16 v43 = 2114;
        id v44 = @"YES";
        _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Skipping registration update. hasMatchingRegisteredRegion: %{public}@ hasMissingRegisteredRegionCode: %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(v32 + 40) + 16))();
      id v5 = v34;
      goto LABEL_31;
    }
    uint64_t v20 = v33;
    uint64_t v21 = [v33 registrationDate];
    if (v21)
    {
      char v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
      uint64_t v23 = [(__CFString *)v21 compare:v22];

      id v5 = v34;
      if (v23 != -1)
      {
        BOOL v24 = PKLogFacilityTypeGetObject(0xBuLL);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          objc_super v42 = v21;
          _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Skipping registration update as data is not stale. Date: %{public}@", buf, 0xCu);
        }

        (*(void (**)(void, uint64_t))(*(void *)(v32 + 40) + 16))(*(void *)(v32 + 40), [*(id *)(v32 + 32) _canRegisterForPeerPayment]);
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v27 = PKLogFacilityTypeGetObject(0xBuLL);
      id v5 = v34;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "No previous registration date. Performing update", buf, 2u);
      }
    }
    id v28 = *(void **)(v32 + 32);
    char v29 = [v28 primaryBrokerURL];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __64__PKPaymentWebService__canRegisterForPeerPaymentWithCompletion___block_invoke_159;
    v35[3] = &unk_1E56E4A78;
    id v30 = *(id *)(v32 + 40);
    void v35[4] = *(void *)(v32 + 32);
    id v36 = v30;
    [v28 updateRegistrationDataAtBrokerURL:v29 completion:v35];

LABEL_30:
LABEL_31:

    goto LABEL_32;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_32:
}

uint64_t __64__PKPaymentWebService__canRegisterForPeerPaymentWithCompletion___block_invoke_159(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) _canRegisterForPeerPayment];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)_recentConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(PKPaymentWebService *)self needsConfiguration])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __44__PKPaymentWebService__recentConfiguration___block_invoke;
      v7[3] = &unk_1E56E4A78;
      v7[4] = self;
      id v8 = v4;
      [(PKPaymentWebService *)self configurePaymentServiceWithCompletion:v7];
    }
    else
    {
      id v5 = [(PKPaymentWebService *)self context];
      id v6 = [v5 configuration];
      (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1, v6);
    }
  }
}

void __44__PKPaymentWebService__recentConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v4 = a2 == 1 && a3 == 0;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) context];
  id v6 = [v7 configuration];
  (*(void (**)(uint64_t, BOOL, void *))(v5 + 16))(v5, v4, v6);
}

- (void)startBackgroundURLSessionWithIdentifier:(id)a3 context:(id)a4 backgroundDelegate:(id)a5
{
}

- (void)startBackgroundURLSessionWithIdentifier:(id)a3 context:(id)a4 backgroundDelegate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke;
  block[3] = &unk_1E56D8C20;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_sync(backgroundDownloadQueue, block);
}

void __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[15])
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      BOOL v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    int v5 = [v2 _hasConfiguration];
    id v6 = *(void **)(a1 + 32);
    if (v5)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke_2;
      v12[3] = &unk_1E56EDFF8;
      void v12[4] = v6;
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      id v16 = *(id *)(a1 + 64);
      [v6 _deviceConfigurationDataWithCompletion:v12];
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 64);
      id v11 = *(void **)(a1 + 32);
      [v11 _startBackgroundURLSessionWithIdentifier:v7 context:v8 backgroundDelegate:v9 completion:v10];
    }
  }
}

void __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v12 = (void (**)(void))a1[8];
    if (v12) {
      v12[2]();
    }
  }
  else
  {
    uint64_t v8 = [a1[4] context];
    objc_msgSend(v8, "setDevSigned:", objc_msgSend(v5, "devSigned"));

    id v9 = a1[4];
    uint64_t v10 = *((void *)v9 + 22);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke_3;
    v13[3] = &unk_1E56D8C20;
    v13[4] = v9;
    id v14 = a1[5];
    id v15 = a1[6];
    id v16 = a1[7];
    id v17 = a1[8];
    id v11 = v13;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E56D8360;
    id v19 = v11;
    dispatch_async(v10, block);
  }
}

uint64_t __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startBackgroundURLSessionWithIdentifier:*(void *)(a1 + 40) context:*(void *)(a1 + 48) backgroundDelegate:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (void)invalidateBackgroundSession
{
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PKPaymentWebService_invalidateBackgroundSession__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_sync(backgroundDownloadQueue, block);
}

uint64_t __50__PKPaymentWebService_invalidateBackgroundSession__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) invalidateAndCancel];
}

- (NSArray)delegates
{
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  BOOL v4 = [(NSHashTable *)self->_delegates allObjects];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_delegateLock);
  return (NSArray *)v5;
}

- (id)forbiddenErrorWithResponse:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentWebService;
  id v5 = [(PKWebService *)&v22 forbiddenErrorWithResponse:v4];
  id v6 = [v4 errorCode];
  uint64_t v7 = [v6 integerValue];

  uint64_t v8 = 0;
  if (v7 <= 40420)
  {
    if (v7 <= 40101)
    {
      if (v7 > 40013)
      {
        if (v7 == 40014)
        {
          id v9 = PKLocalizedPaymentString(&cfstr_InvalidNameTit.isa, 0);
          uint64_t v8 = PKLocalizedPaymentString(&cfstr_InvalidNameMes.isa, 0);
        }
        else
        {
          id v9 = 0;
          if (v7 != 40016) {
            goto LABEL_51;
          }
          id v9 = PKLocalizedPaymentString(&cfstr_SecureElementL.isa, 0);
          uint64_t v8 = PKLocalizedPaymentString(&cfstr_SecureElementL_0.isa, 0);
        }
      }
      else if (v7 == 40001)
      {
        id v9 = PKLocalizedPaymentString(&cfstr_InvalidPanTitl.isa, 0);
        uint64_t v8 = PKLocalizedPaymentString(&cfstr_InvalidPanMess.isa, 0);
      }
      else
      {
        id v9 = 0;
        if (v7 != 40013) {
          goto LABEL_51;
        }
        id v9 = PKLocalizedPaymentString(&cfstr_InvalidExpirat.isa, 0);
        uint64_t v8 = PKLocalizedPaymentString(&cfstr_InvalidExpirat_0.isa, 0);
      }
      goto LABEL_50;
    }
    if (v7 <= 40300)
    {
      id v9 = 0;
      switch(v7)
      {
        case 40102:
          id v9 = PKLocalizedPaymentString(&cfstr_ProvisioningCo_2.isa, 0);
          uint64_t v8 = PKLocalizedPaymentString(&cfstr_ProvisioningCo_3.isa, 0);
          goto LABEL_50;
        case 40106:
          id v9 = PKLocalizedPaymentString(&cfstr_InvalidCscTitl.isa, 0);
          uint64_t v8 = PKLocalizedPaymentString(&cfstr_InvalidCscMess.isa, 0);
          goto LABEL_50;
        case 40107:
          id v9 = PKLocalizedPaymentString(&cfstr_ReaderModeErro.isa, 0);
          id v11 = @"READER_MODE_ERROR_INCORRECT_CARD_DETAILS_MESSAGE";
          goto LABEL_37;
        case 40110:
          id v9 = PKLocalizedPaymentString(&cfstr_ReaderModeAcco.isa, 0);
          id v11 = @"READER_MODE_ACCOUNT_NAME_MISMATCH_MESSAGE";
LABEL_37:
          uint64_t v10 = PKLocalizedPaymentString(&v11->isa, 0);
          goto LABEL_38;
        default:
          goto LABEL_51;
      }
    }
    if (v7 != 40301)
    {
      if (v7 != 40307)
      {
        id v9 = 0;
        if (v7 != 40403) {
          goto LABEL_51;
        }
        id v9 = PKLocalizedPaymentString(&cfstr_ProvisioningRe.isa, 0);
        uint64_t v8 = PKLocalizedPaymentString(&cfstr_ProvisioningRe_0.isa, 0);
        goto LABEL_50;
      }
LABEL_46:
      AnalyticsSendEvent();
      uint64_t v8 = 0;
      id v9 = 0;
      goto LABEL_51;
    }
    id v9 = PKLocalizedPaymentString(&cfstr_IneligibleAcco.isa, 0);
LABEL_45:
    AnalyticsSendEvent();
    uint64_t v8 = 0;
    goto LABEL_51;
  }
  if (v7 <= 40500)
  {
    if (v7 <= 40453)
    {
      if (v7 == 40421)
      {
        id v9 = PKLocalizedPaymentString(&cfstr_VerificationPe.isa, 0);
        uint64_t v8 = PKLocalizedPaymentString(&cfstr_VerificationPe_0.isa, 0);
      }
      else
      {
        id v9 = 0;
        if (v7 != 40423) {
          goto LABEL_51;
        }
        id v9 = PKLocalizedPaymentString(&cfstr_VerificationRe.isa, 0);
        uint64_t v8 = PKLocalizedPaymentString(&cfstr_VerificationRe_0.isa, 0);
      }
      goto LABEL_50;
    }
    if (v7 == 40454)
    {
      id v9 = PKLocalizedPaymentString(&cfstr_VerificationAt.isa, 0);
      goto LABEL_45;
    }
    if (v7 == 40456)
    {
      id v9 = PKLocalizedPaymentString(&cfstr_InvalidVerific.isa, 0);
      uint64_t v8 = PKLocalizedPaymentString(&cfstr_InvalidVerific_0.isa, 0);
    }
    else
    {
      id v9 = 0;
      if (v7 != 40457) {
        goto LABEL_51;
      }
      id v9 = PKLocalizedPaymentString(&cfstr_ExpiredVerific.isa, 0);
      uint64_t v8 = PKLocalizedPaymentString(&cfstr_ExpiredVerific_0.isa, 0);
    }
LABEL_50:
    AnalyticsSendEvent();
    goto LABEL_51;
  }
  if (v7 <= 60009)
  {
    if (v7 != 40501)
    {
      id v9 = 0;
      if (v7 != 60009) {
        goto LABEL_51;
      }
      goto LABEL_46;
    }
    id v9 = PKLocalizedPaymentString(&cfstr_HsaRequiredTit.isa, 0);
    uint64_t v8 = PKLocalizedPaymentString(&cfstr_HsaRequiredMes.isa, 0);
    goto LABEL_50;
  }
  if (v7 == 60010 || v7 == 60011) {
    goto LABEL_46;
  }
  id v9 = 0;
  if (v7 == 60104)
  {
    id v9 = PKLocalizedString(&cfstr_PassErrorManag.isa, 0);
    uint64_t v10 = PKLocalizedString(&cfstr_PassErrorManag_0.isa, 0);
LABEL_38:
    uint64_t v8 = (void *)v10;
  }
LABEL_51:
  id v12 = [v4 localizedTitle];
  if (v12)
  {
  }
  else
  {
    id v13 = [v4 localizedDescription];

    if (!v13) {
      goto LABEL_55;
    }
  }
  uint64_t v14 = [v4 localizedTitle];

  uint64_t v15 = [v4 localizedDescription];

  uint64_t v8 = (void *)v15;
  id v9 = (void *)v14;
LABEL_55:
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  [v16 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  [v16 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
  id v17 = [NSString stringWithFormat:@"%@ - %@", v9, v8];
  [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  [v16 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  id v18 = (void *)MEMORY[0x1E4F28C58];
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v16];
  id v20 = [v18 errorWithDomain:@"PKPaymentWebServiceErrorDomain" code:v7 userInfo:v19];

  return v20;
}

- (void)signNonce:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA58];
    id v8 = a3;
    id v9 = objc_alloc_init(v7);
    [v9 appendData:v8];

    uint64_t v10 = [(PKPaymentWebService *)self _appleAccountInformation];
    id v11 = [v10 primaryAppleAccountHash];
    [v9 appendData:v11];

    targetDevice = self->_targetDevice;
    id v13 = [v9 SHA256Hash];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__PKPaymentWebService_signNonce_withCompletion___block_invoke;
    v14[3] = &unk_1E56EE020;
    id v15 = v6;
    [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice paymentWebService:self signData:v13 signatureEntanglementMode:0 withCompletionHandler:v14];
  }
}

uint64_t __48__PKPaymentWebService_signNonce_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_renewAppleAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  targetDevice = self->_targetDevice;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKPaymentWebService__renewAppleAccountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E56D85B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice renewAppleAccountWithCompletionHandler:v7];
}

void __63__PKPaymentWebService__renewAppleAccountWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id v5 = PKWebServiceAccountCredentialRenewalSucceededNotification;
  if (a2) {
    id v5 = &PKWebServiceAccountCredentialRenewalFailedNotification;
  }
  id v6 = (void *)MEMORY[0x1E4F28EB8];
  uint64_t v7 = *v5;
  id v8 = [v6 defaultCenter];
  [v8 postNotificationName:v7 object:*(void *)(a1 + 32)];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v10);
  }
}

- (void)processRetryRequest:(id)a3 responseData:(id)a4 orginalRequest:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F18DA0] propertyForKey:@"overlayRequest" inRequest:a5];
  uint64_t v14 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v15 = objc_opt_class();
  id v16 = [v13 data];
  id v17 = [v14 unarchivedObjectOfClass:v15 fromData:v16 error:0];

  if (v17 && [v17 requiresConfigurationForRetry])
  {
    if (v10 && v11)
    {
      id v29 = 0;
      id v18 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v29];
      id v19 = v29;
      if (v19)
      {
        id v20 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v19;
          id v21 = "Error: Retry response JSON is invalid with error :%@";
          objc_super v22 = v20;
          uint32_t v23 = 12;
LABEL_8:
          _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __82__PKPaymentWebService_processRetryRequest_responseData_orginalRequest_completion___block_invoke;
          v27[3] = &unk_1E56EDD70;
          id v28 = v12;
          [v17 _updateRequestForRetry:v10 retryFields:v18 webService:self withCompletion:v27];
          BOOL v24 = v28;
          goto LABEL_19;
        }
        if (v18)
        {
LABEL_10:
          if (!v12)
          {
LABEL_20:

            goto LABEL_21;
          }
          BOOL v24 = (void *)[v10 copy];
          (*((void (**)(id, void *))v12 + 2))(v12, v24);
LABEL_19:

          goto LABEL_20;
        }
        id v20 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v21 = "Error: No retry response json";
          objc_super v22 = v20;
          uint32_t v23 = 2;
          goto LABEL_8;
        }
      }

      goto LABEL_10;
    }
    uint64_t v25 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "No requests or response data to use", buf, 2u);
    }
  }
  if (v12)
  {
    objc_super v26 = (void *)[v10 copy];
    (*((void (**)(id, void *))v12 + 2))(v12, v26);
  }
LABEL_21:
}

void __82__PKPaymentWebService_processRetryRequest_responseData_orginalRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (id)[a2 copy];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)handleWillPerformHTTPRedirectionWithResponse:(id)a3 originalRequest:(id)a4 redirectHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__PKPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke;
  v9[3] = &unk_1E56D8388;
  id v10 = v7;
  id v8 = v7;
  [(PKPaymentWebService *)self _registerIfNeededWithResponse:a3 task:0 isRedirect:1 completion:v9];
}

uint64_t __100__PKPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (BOOL)isChinaRegionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentWebService *)self context];
  id v6 = [v5 regionForIdentifier:v4];

  if (v6)
  {
    id v7 = [v6 regionCode];
    BOOL v8 = [v7 caseInsensitiveCompare:@"CN"] == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)configurePaymentServiceWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke;
  v8[3] = &unk_1E56EE0C0;
  v8[4] = self;
  id v9 = v4;
  unint64_t v10 = v5;
  id v6 = v4;
  [(PKPaymentWebService *)self _deviceConfigurationDataWithCompletion:v8];

  return v5;
}

void __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v20 = *(void *)(a1 + 40);
    if (!v20) {
      goto LABEL_17;
    }
    id v21 = *(void (**)(void))(v20 + 16);
LABEL_16:
    v21();
    goto LABEL_17;
  }
  uint64_t v7 = [v5 devSigned];
  if (!os_variant_has_internal_ui()
    || !v7
    || (PKStockholmEnvironmentName(),
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsString:@"QA"],
        v8,
        (v9 & 1) != 0))
  {
    unint64_t v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v29 = v7;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: set devSigned=%i from device data during configuration", buf, 8u);
    }

    id v11 = [*(id *)(a1 + 32) context];
    id v12 = [v5 secureElementIdentifier];
    if (v12) {
      [v11 setSecureElementID:v12];
    }
    [v11 setDevSigned:v7];
    [v11 setConfigurationDate:0];
    id v13 = PKStockholmConfigURL(v7, [*(id *)(a1 + 32) _isSandboxAccount]);
    uint64_t v14 = objc_alloc_init(PKPaymentConfigurationRequest);
    [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:v14];
    uint64_t v15 = [(PKPaymentConfigurationRequest *)v14 _requestWithServiceURL:v13];
    id v16 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_285;
    v24[3] = &unk_1E56EE098;
    v24[4] = v16;
    id v25 = v13;
    id v26 = v11;
    uint64_t v17 = *(void *)(a1 + 48);
    id v27 = *(id *)(a1 + 40);
    id v18 = v11;
    id v19 = v13;
    [v16 performRequest:v15 taskIdentifier:v17 completionHandler:v24];

    goto LABEL_17;
  }
  objc_super v22 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_190E10000, v22, OS_LOG_TYPE_ERROR, "******** ERROR: Using DevSE with non QA Enviroment - refusing to update configuration **********", buf, 2u);
  }

  uint64_t v23 = *(void *)(a1 + 40);
  if (v23)
  {
    id v21 = *(void (**)(void))(v23 + 16);
    goto LABEL_16;
  }
LABEL_17:
}

void __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_285(id *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = a1[4];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_2;
  v28[3] = &unk_1E56EE048;
  id v10 = v7;
  id v29 = v10;
  id v11 = a1[5];
  id v12 = a1[4];
  id v30 = v11;
  id v31 = v12;
  id v32 = a1[6];
  uint64_t v13 = [v9 _resultForResponse:a3 error:v8 successHandler:v28];
  [a1[4] _archiveContext];
  if (v13 == 1)
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Updated server config data successfully", buf, 2u);
    }

    uint64_t v15 = [*((id *)a1[4] + 32) deviceRegion];
    +[PKPaymentHeroImageManifest removeManifestFileForRegion:v15];
    id v16 = [a1[6] configuration];
    uint64_t v17 = [v16 heroImageManifestURLForRegion:v15];

    if (v17)
    {
      id v18 = +[PKObjectDownloader sharedImageAssetDownloader];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_290;
      v23[3] = &unk_1E56EE070;
      id v24 = v18;
      id v26 = a1[7];
      uint64_t v27 = 1;
      id v25 = v8;
      id v19 = v18;
      +[PKPaymentHeroImageManifest downloadManifestForRegion:v15 url:v17 fileDownloader:v19 completion:v23];
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Hero manifest URL is nil - skipping download.", buf, 2u);
      }

      objc_super v22 = (void (**)(id, uint64_t, id))a1[7];
      if (v22) {
        v22[2](v22, 1, v8);
      }
    }
  }
  else
  {
    if (!v8)
    {
      id v8 = [a1[4] _errorWithResult:v13 data:v10];
    }
    uint64_t v20 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v8;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Failed to update server config data with error %@", buf, 0xCu);
    }

    id v21 = (void (**)(id, uint64_t, id))a1[7];
    if (v21) {
      v21[2](v21, v13, v8);
    }
  }
}

uint64_t __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 version];
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      uint64_t v15 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Version is %@", (uint8_t *)&v14, 0xCu);
    }

    id v6 = [PKPaymentWebServiceConfiguration alloc];
    id v7 = [v3 JSONObject];
    id v8 = [(PKPaymentWebServiceConfiguration *)v6 initWithConfiguration:v7 url:*(void *)(a1 + 40)];

    if (v8)
    {
      [*(id *)(a1 + 48) _resetSupportInRegionCache];
      [*(id *)(a1 + 56) setConfiguration:v8];
      id v9 = *(void **)(a1 + 56);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v9 setConfigurationDate:v10];

      if (*(unsigned char *)(*(void *)(a1 + 48) + 225))
      {
        id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v11 postNotificationName:@"PKSharedPaymentWebServiceRegionConfigurationChangedNotification" object:0];
      }
      uint64_t v12 = 1;
      PKSetNFRemoteAdminV2Enabled(1);
      objc_msgSend(*(id *)(*(void *)(a1 + 48) + 256), "paymentWebServiceDidUpdateConfiguration:");
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_290(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = PKScreenScale();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = objc_msgSend(v6, "images", 0);
    id v9 = [v8 allValues];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (([v14 hasCachedImageWithScale:v7] & 1) == 0) {
            [v14 downloadImageWithScale:a1[4] fileDownloader:0 completion:v7];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  uint64_t v15 = a1[6];
  if (v15)
  {
    if (a1[5]) {
      id v16 = (id)a1[5];
    }
    else {
      id v16 = v5;
    }
    (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, a1[7], v16);
  }
}

- (unint64_t)registerDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentWebService *)self primaryBrokerURL];
  unint64_t v6 = [(PKPaymentWebService *)self registerDeviceAtBrokerURL:v5 consistencyCheckResults:0 completion:v4];

  return v6;
}

- (unint64_t)registerDeviceAtBrokerURL:(id)a3 consistencyCheckResults:(id)a4 completion:(id)a5
{
  return [(PKPaymentWebService *)self registerDeviceAtBrokerURL:a3 withConsistencyCheckResults:a4 retries:2 completion:a5];
}

- (unint64_t)registerDeviceAtBrokerURL:(id)a3 withConsistencyCheckResults:(id)a4 retries:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unint64_t v13 = [(PKWebService *)self nextTaskID];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke;
  v18[3] = &unk_1E56EE188;
  v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  unint64_t v22 = v13;
  unint64_t v23 = a5;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  [(PKPaymentWebService *)self _deviceRegistrationDataWithCompletion:v18];

  return v13;
}

void __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v34 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_20:
    v34();
    goto LABEL_21;
  }
  uint64_t v7 = [v5 devSigned];
  if (!os_variant_has_internal_ui()
    || !v7
    || (PKStockholmEnvironmentName(),
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsString:@"QA"],
        v8,
        (v9 & 1) != 0))
  {
    id v10 = [*(id *)(a1 + 32) context];
    id v11 = [v5 secureElementIdentifier];
    [v10 setSecureElementID:v11];

    [v10 setDevSigned:v7];
    id v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v52 = v7;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: set devSigned=%i from device data during registration", buf, 8u);
    }
    id v40 = v6;

    unint64_t v13 = objc_alloc_init(PKPaymentRegistrationRequest);
    [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:v13];
    uint64_t v14 = [v10 pushToken];
    uint64_t v15 = [v10 nextPushToken];
    id v16 = (void *)v15;
    if (v15) {
      long long v17 = (void *)v15;
    }
    else {
      long long v17 = (void *)v14;
    }
    id v18 = v17;
    id v19 = v10;
    if (!v18)
    {
      uint64_t v20 = v14;
      id v21 = v19;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "*** WARNING ***: Push token is missing!", buf, 2u);
      }

      AnalyticsSendEvent();
      id v19 = v21;
      uint64_t v14 = v20;
    }
    long long v38 = (void *)v14;
    long long v39 = v19;
    unint64_t v22 = [*(id *)(a1 + 40) summary];
    uint64_t v23 = *(void *)(a1 + 48);
    id v24 = [*(id *)(a1 + 32) _appleAccountInformation];
    id v25 = [(PKPaymentRegistrationRequest *)v13 _requestWithServiceURL:v23 deviceData:v5 pushToken:v18 consistencyData:v22 appleAccountInformation:v24];

    long long v37 = v13;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 168));
    id v26 = *(void **)(*(void *)(a1 + 32) + 160);
    uint64_t v27 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    [v26 addObject:v27];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 168));
    id v28 = *(void **)(a1 + 32);
    uint64_t v30 = *(void *)(a1 + 64);
    uint64_t v29 = *(void *)(a1 + 72);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_295;
    v41[3] = &unk_1E56EE160;
    v41[4] = v28;
    uint64_t v48 = v30;
    BOOL v50 = v22 != 0;
    id v42 = v5;
    id v43 = v16;
    uint64_t v31 = *(void *)(a1 + 72);
    id v44 = v18;
    uint64_t v49 = v31;
    id v45 = *(id *)(a1 + 48);
    id v46 = *(id *)(a1 + 40);
    id v47 = *(id *)(a1 + 56);
    id v32 = v18;
    id v33 = v16;
    [v28 performRequest:v25 taskIdentifier:v30 retries:v29 authHandling:0 completionHandler:v41];

    id v6 = v40;
    goto LABEL_21;
  }
  uint64_t v35 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_190E10000, v35, OS_LOG_TYPE_ERROR, "******** ERROR: Using DevSE with non QA Enviroment - refusing to register **********", buf, 2u);
  }

  uint64_t v36 = *(void *)(a1 + 56);
  if (v36)
  {
    id v34 = *(void (**)(void))(v36 + 16);
    goto LABEL_20;
  }
LABEL_21:
}

void __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_295(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 168));
  id v10 = *(void **)(*(void *)(a1 + 32) + 160);
  id v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
  [v10 removeObject:v11];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 168));
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  id v12 = *(void **)(a1 + 32);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_2;
  v50[3] = &unk_1E56EE0E8;
  id v13 = v7;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(a1 + 40);
  id v51 = v13;
  uint64_t v52 = v14;
  char v57 = *(unsigned char *)(a1 + 104);
  id v53 = v15;
  long long v56 = v58;
  id v54 = *(id *)(a1 + 48);
  id v55 = *(id *)(a1 + 56);
  uint64_t v16 = [v12 _resultForResponse:v8 error:v9 successHandler:v50];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 statusCode] == 401)
  {
    if (*(void *)(a1 + 96))
    {
      long long v17 = *(void **)(a1 + 32);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_3;
      v42[3] = &unk_1E56EE110;
      v42[4] = v17;
      id v43 = *(id *)(a1 + 64);
      id v18 = *(id *)(a1 + 72);
      uint64_t v19 = *(void *)(a1 + 96);
      id v44 = v18;
      uint64_t v48 = v19;
      id v20 = *(id *)(a1 + 80);
      uint64_t v49 = v16;
      id v46 = v20;
      id v47 = v58;
      id v9 = v9;
      id v45 = v9;
      [v17 handleAuthenticationFailureWithCompletionHandler:v42];

      id v21 = v43;
LABEL_5:

      goto LABEL_24;
    }
    uint64_t v29 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Exceeded maximum retries (giving up).", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    goto LABEL_24;
  }
  if (v16 == 1)
  {
    AnalyticsSendEvent();
    [*(id *)(a1 + 32) performApplePayTrustRegistrationWithCompletion:0];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    goto LABEL_24;
  }
  if (v16)
  {
    if (!v9)
    {
      id v9 = [*(id *)(a1 + 32) _errorWithResult:v16 data:v13];
    }
    goto LABEL_17;
  }
  AnalyticsSendEvent();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v22 = v8, uint64_t v23 = [v22 statusCode], v22, v23 != 428))
  {
    if (!v9)
    {
      id v9 = [*(id *)(a1 + 32) _errorWithResult:0 data:v13];
    }
LABEL_17:
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    goto LABEL_24;
  }
  id v24 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Received Secure Element Reinitialization Response Code (428)...", buf, 2u);
  }

  if (*(void *)(a1 + 96))
  {
    id v25 = [*(id *)(a1 + 32) targetDevice];
    uint64_t v26 = *(void *)(a1 + 32);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_302;
    v32[3] = &unk_1E56EE138;
    v32[4] = v26;
    id v33 = *(id *)(a1 + 64);
    id v27 = *(id *)(a1 + 72);
    uint64_t v28 = *(void *)(a1 + 96);
    id v34 = v27;
    uint64_t v39 = v28;
    id v37 = *(id *)(a1 + 80);
    id v9 = v9;
    id v35 = v9;
    uint64_t v40 = 0;
    id v36 = v13;
    long long v38 = v58;
    [v25 paymentWebService:v26 setNewAuthRandom:v32];

    id v21 = v33;
    goto LABEL_5;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Exceeded maximum retries (giving up).", buf, 2u);
  }

  if (v9)
  {
    id v30 = v9;
  }
  else
  {
    id v30 = [*(id *)(a1 + 32) _errorWithResult:0 data:v13];
  }
  uint64_t v31 = v30;
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

LABEL_24:
  _Block_object_dispose(v58, 8);
}

uint64_t __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) context];
    id v4 = v3;
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v5 = [v3 registrationType];
    }
    else if ([*(id *)(a1 + 48) walletDeleted])
    {
      uint64_t v5 = 2;
    }
    else
    {
      uint64_t v5 = 1;
    }
    id v7 = [v2 cardsOnFile];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v7 unsignedIntegerValue];

    uint64_t v6 = [*(id *)(a1 + 40) _updateContextWithRegistrationType:v5 response:v2];
    if (v6 == 1)
    {
      id v8 = [v4 nextPushToken];
      id v9 = v8;
      if (*(void *)(a1 + 56) && v8 && objc_msgSend(v8, "isEqual:"))
      {
        [v4 setPushToken:*(void *)(a1 + 64)];
        [v4 setNextPushToken:0];
      }
      id v10 = [*(id *)(a1 + 48) companionSerialNumber];
      [v4 setCompanionSerialNumber:v10];
    }
    [*(id *)(a1 + 40) _archiveContext];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v12 = 0;
    id v8 = "Credential Renewal Failed.";
    id v9 = (uint8_t *)&v12;
LABEL_13:
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_14;
  }
  if (a2 == 1)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v11 = 0;
    id v8 = "Credential Renewal Rejected by User.";
    id v9 = (uint8_t *)&v11;
    goto LABEL_13;
  }
  if (a2)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v8 = "Credential Renewal: Unknown result.";
      id v9 = (uint8_t *)&v10;
      goto LABEL_13;
    }
LABEL_14:

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
    goto LABEL_15;
  }
  uint64_t v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Credential Renewal succeeded, retrying request.", buf, 2u);
  }

  [*(id *)(a1 + 32) registerDeviceAtBrokerURL:*(void *)(a1 + 40) withConsistencyCheckResults:*(void *)(a1 + 48) retries:*(void *)(a1 + 80) - 1 completion:*(void *)(a1 + 64)];
LABEL_15:
}

void __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_302(uint64_t a1, int a2)
{
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Secure Element reinitialized, retrying request.", buf, 2u);
    }

    [*(id *)(a1 + 32) registerDeviceAtBrokerURL:*(void *)(a1 + 40) withConsistencyCheckResults:*(void *)(a1 + 48) retries:*(void *)(a1 + 88) - 1 completion:*(void *)(a1 + 72)];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to reinitialize Secure Element.", v9, 2u);
    }

    uint64_t v6 = *(void **)(a1 + 56);
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) _errorWithResult:*(void *)(a1 + 96) data:*(void *)(a1 + 64)];
    }
    id v8 = v7;
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

- (void)_shouldPerformApplePayTrustRegistrationWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (unint64_t)PKCurrentPassbookState() <= 1 && (objc_opt_respondsToSelector())
    {
      targetDevice = self->_targetDevice;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __77__PKPaymentWebService__shouldPerformApplePayTrustRegistrationWithCompletion___block_invoke;
      v6[3] = &unk_1E56EE1B0;
      id v7 = v4;
      [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice applePayTrustKeyForIdentifier:@"com.apple.wallet.applepaytrust" completion:v6];
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

uint64_t __77__PKPaymentWebService__shouldPerformApplePayTrustRegistrationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_createApplePayTrustKeyWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    if (objc_opt_respondsToSelector())
    {
      BOOL v5 = [(PKPaymentWebService *)self _appleAccountInformation];
      uint64_t v6 = [v5 aidaAlternateDSID];
      id v7 = [v6 dataUsingEncoding:4];

      id v8 = [PKApplePayTrustKeyRequest alloc];
      id v9 = [v7 SHA256Hash];
      __int16 v10 = [(PKApplePayTrustKeyRequest *)v8 initWithKeyIdentifier:@"com.apple.wallet.applepaytrust" subjectIdentifier:v9];

      [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice createApplePayTrustKeyWithRequest:v10 completion:v11];
    }
    else
    {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
    id v4 = v11;
  }
}

- (unint64_t)performApplePayTrustRegistrationWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPaymentWebService *)self primaryBrokerURL];
  uint64_t v6 = [(PKPaymentWebService *)self context];
  id v7 = [v6 pushToken];
  unint64_t v8 = [(PKPaymentWebService *)self _performApplePayTrustRegistrationWithURL:v5 pushToken:v7 completion:v4];

  return v8;
}

- (unint64_t)_performApplePayTrustRegistrationWithURL:(id)a3 pushToken:(id)a4 completion:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = (void (**)(id, void, void *))a5;
  unint64_t v9 = [(PKWebService *)self nextTaskID];
  __int16 v10 = [(PKPaymentWebService *)self context];
  id v11 = [v10 deviceID];

  if (!v11)
  {
    if (!v8) {
      goto LABEL_13;
    }
    __int16 v12 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Error: Asked to register for Apple Pay Trust with nil service deviceID. Perform device registration first.", v18, 2u);
    }

    id v13 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
LABEL_11:
    v8[2](v8, 0, v13);
LABEL_12:

    goto LABEL_13;
  }
  if (!v7)
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error: Asked to register for Apple Pay Trust with nil service URL.", v18, 2u);
    }

    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"Error: Asked to register for Apple Pay Trust with nil service URL.";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v13 = [v15 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v16];

    if (!v8) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke;
  v19[3] = &unk_1E56EE1D8;
  void v19[4] = self;
  id v20 = v7;
  id v21 = v11;
  unint64_t v23 = v9;
  id v22 = v8;
  [(PKPaymentWebService *)self _createApplePayTrustKeyWithCompletion:v19];

LABEL_13:
  return v9;
}

void __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init(PKApplePayTrustRegistrationRequest);
    [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:v7];
    [(PKApplePayTrustRegistrationRequest *)v7 setApplePayTrustKey:v5];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    __int16 v10 = [*(id *)(a1 + 32) _appleAccountInformation];
    id v11 = [(PKApplePayTrustRegistrationRequest *)v7 _urlRequestWithServiceURL:v9 deviceIdentifier:v8 appleAccountInformation:v10];

    __int16 v12 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke_2;
    v16[3] = &unk_1E56E51B0;
    void v16[4] = v12;
    uint64_t v13 = *(void *)(a1 + 64);
    id v18 = *(id *)(a1 + 56);
    id v17 = v5;
    [v12 performRequest:v11 taskIdentifier:v13 completionHandler:v16];
  }
  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error: Failed to get enrollment data for Apple Pay Trust registration with error: %@", buf, 0xCu);
    }

    uint64_t v15 = *(void *)(a1 + 56);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v6);
    }
  }
}

void __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 || ![a1[4] _isValidResponse:v8 error:0])
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust registration request failed with error: %@", buf, 0xCu);
    }

    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = (void *)*((void *)a1[4] + 32);
      uint64_t v15 = [a1[5] identifier];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke_318;
      v17[3] = &unk_1E56D8798;
      id v19 = a1[6];
      id v18 = v9;
      [v14 deleteApplePayTrustKeyWithIdentifier:v15 completion:v17];
    }
    else
    {
      id v16 = a1[6];
      if (v16)
      {
        __int16 v12 = (void (*)(void))*((void *)v16 + 2);
        goto LABEL_13;
      }
    }
  }
  else
  {
    __int16 v10 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust registration succeeded.", buf, 2u);
    }

    id v11 = a1[6];
    if (v11)
    {
      __int16 v12 = (void (*)(void))*((void *)v11 + 2);
LABEL_13:
      v12();
    }
  }
}

uint64_t __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke_318(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)_isValidResponse:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = v5;
    uint64_t v8 = [v7 statusCode];
    BOOL v9 = v8 == 200;
    if (v8 != 200)
    {
      uint64_t v10 = v8;
      id v11 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [v7 URL];
        uint64_t v13 = [v12 absoluteString];
        int v17 = 138412802;
        id v18 = v13;
        __int16 v19 = 2048;
        uint64_t v20 = v10;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Error executing request: %@; statusCode: %ld; error: %@",
          (uint8_t *)&v17,
          0x20u);
      }
    }
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v6 localizedDescription];
      uint64_t v15 = [(id)objc_opt_class() description];
      int v17 = 138412546;
      id v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = (uint64_t)v15;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Invalid response with error: %@; Expected 'NSHTTPURLResponse' but got '%@'",
        (uint8_t *)&v17,
        0x16u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)_updateContextWithRegistrationType:(int64_t)a3 response:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 deviceIdentifier];

  if (!v7)
  {
    id v11 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    uint64_t v31 = "*** ERROR ***: No Device ID";
LABEL_26:
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    goto LABEL_27;
  }
  uint64_t v8 = [v6 primaryRegion];

  if (!v8)
  {
    id v11 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    uint64_t v31 = "*** ERROR ***: No Primary Region";
    goto LABEL_26;
  }
  BOOL v9 = [v6 regions];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    id v11 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v31 = "*** ERROR ***: Empty Regions Dictionary";
      goto LABEL_26;
    }
LABEL_27:
    unint64_t v33 = 0;
    goto LABEL_37;
  }
  id v43 = self;
  id v11 = [(PKPaymentWebService *)self context];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  __int16 v12 = [v6 regions];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v18 = [v6 regions];
        id v19 = [v18 objectForKeyedSubscript:v17];

        uint64_t v20 = [v19 certificates];
        if ((PKPaymentCreateAndValidateTrustWithCerts(v20, 0, [v11 devSigned]) & 1) == 0)
        {
          id v32 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v51 = v17;
            _os_log_impl(&dword_190E10000, v32, OS_LOG_TYPE_DEFAULT, "*** ERROR ***: Invalid Certificate Chain for %@", buf, 0xCu);
          }

          unint64_t v33 = 0;
          goto LABEL_36;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  [(PKPaymentWebService *)v43 _resetSupportInRegionCache];
  __int16 v21 = [v6 regions];
  [v11 setRegions:v21];

  id v22 = [v6 deviceIdentifier];
  [v11 setDeviceID:v22];

  __int16 v12 = [v6 primaryRegion];
  if (!v12)
  {
    uint64_t v23 = [v6 regions];
    uint64_t v24 = [v23 allKeys];
    __int16 v12 = [v24 lastObject];
  }
  [v11 setPrimaryRegionIdentifier:v12];
  [v11 setRegistrationType:a3];
  id v25 = [MEMORY[0x1E4F1C9C8] date];
  [v11 setRegistrationDate:v25];

  uint64_t v26 = PKDeviceBuildVersion();
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __67__PKPaymentWebService__updateContextWithRegistrationType_response___block_invoke;
  v44[3] = &unk_1E56EE200;
  id v19 = v26;
  id v45 = v19;
  [v11 atomicallyUpdateEveryRegion:v44];
  id v27 = [v6 maxCards];
  uint64_t v28 = v27;
  if (v27)
  {
    uint64_t v29 = v27;
    uint64_t v30 = [v27 unsignedIntegerValue];
    if (objc_opt_respondsToSelector()) {
      [(PKPaymentWebServiceTargetDeviceProtocol *)v43->_targetDevice setMaximumPaymentCards:v30];
    }
    else {
      PKSetMaxPaymentCards(v30);
    }
    uint64_t v28 = v29;
  }
  id v34 = [v6 environmentName];
  id v42 = PKStockholmEnvironmentDisplayName();
  if ((objc_msgSend(v34, "isEqualToString:") & 1) == 0)
  {
    if ([v34 length]) {
      id v35 = v34;
    }
    else {
      id v35 = 0;
    }
    PKSetStockholmEnvironmentDisplayName(v35);
    id v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 postNotificationName:@"PKSharedPaymentWebServiceRegionConfigurationChangedNotification" object:0];
  }
  targetDevice = v43->_targetDevice;
  long long v38 = [v11 TSMURLStringByPushTopic];
  uint64_t v39 = [v11 primaryRegion];
  uint64_t v40 = [v39 trustedServiceManagerPushTopic];
  [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice paymentWebService:v43 didRegisterWithRegionMap:v38 primaryRegionTopic:v40];

  unint64_t v33 = 1;
  uint64_t v20 = v45;
LABEL_36:

LABEL_37:
  return v33;
}

uint64_t __67__PKPaymentWebService__updateContextWithRegistrationType_response___block_invoke(uint64_t a1, void *a2)
{
  return [a2 regionBySettingLastDeviceCheckInBuildVersion:*(void *)(a1 + 32)];
}

- (unint64_t)deviceCheckInDeviceCheckInForRegion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  BOOL v9 = objc_alloc_init(PKPaymentDeviceCheckinRequest);
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v9];
  uint64_t v10 = [(PKPaymentWebService *)self context];
  id v11 = [v10 deviceID];
  if (v11)
  {
    __int16 v12 = [v10 regionForIdentifier:v6];
    uint64_t v13 = [v12 brokerURL];

    uint64_t v14 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v15 = [(PKPaymentDeviceCheckinRequest *)v9 _urlRequestWithServiceURL:v13 deviceIdentifier:v11 appleAccountInformation:v14];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __70__PKPaymentWebService_deviceCheckInDeviceCheckInForRegion_completion___block_invoke;
    v18[3] = &unk_1E56E0EC8;
    v18[4] = self;
    id v19 = v7;
    [(PKWebService *)self performRequest:v15 taskIdentifier:v8 completionHandler:v18];
  }
  else if (v7)
  {
    id v16 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
  }
  return v8;
}

void __70__PKPaymentWebService_deviceCheckInDeviceCheckInForRegion_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__54;
  uint64_t v24 = __Block_byref_object_dispose__54;
  id v25 = 0;
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __70__PKPaymentWebService_deviceCheckInDeviceCheckInForRegion_completion___block_invoke_327;
  uint64_t v17 = &unk_1E56DCAF0;
  id v19 = &v20;
  id v11 = v7;
  id v18 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v14];
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v14, v15, v16, v17);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v21[5], v9);
  }

  _Block_object_dispose(&v20, 8);
}

BOOL __70__PKPaymentWebService_deviceCheckInDeviceCheckInForRegion_completion___block_invoke_327(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)sendOwnershipTokensForReason:(unint64_t)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = [(PKWebService *)self nextTaskID];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__54;
  void v27[4] = __Block_byref_object_dispose__54;
  id v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  void v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__54;
  v25[4] = __Block_byref_object_dispose__54;
  id v26 = 0;
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 deviceID];
  if (v9)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = PKPaymentSendOwnershipTokensRequestReasonToString(a3);
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v11;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Sending ownership tokens with reason %@", buf, 0xCu);
    }
    uint64_t v12 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke;
    v24[3] = &unk_1E56EA630;
    v24[4] = v27;
    [(PKAsyncUnaryOperationComposer *)v12 addOperation:v24];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_333;
    v23[3] = &unk_1E56E0F18;
    void v23[4] = self;
    v23[5] = v25;
    [(PKAsyncUnaryOperationComposer *)v12 addOperation:v23];
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_3;
    v16[3] = &unk_1E56EE298;
    unint64_t v21 = a3;
    id v19 = v27;
    void v16[4] = self;
    id v17 = v9;
    uint64_t v20 = v25;
    unint64_t v22 = v7;
    id v18 = v6;
    id v14 = [(PKAsyncUnaryOperationComposer *)v12 evaluateWithInput:v13 completion:v16];

    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v12 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, PKAsyncUnaryOperationComposer *))v6 + 2))(v6, 0, v12);
LABEL_7:
  }
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
  return v7;
}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_2;
  v11[3] = &unk_1E56EE228;
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v7;
  uint64_t v14 = v8;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  +[PKPassOwnershipToken queryKeychainForOwnershipTokens:v11];
}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Error getting pass ownership tokens %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_333(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_2_334;
  v12[3] = &unk_1E56EE250;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 _deviceDataIncludingMetadataFields:498 withCompletionHandler:v12];
}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_2_334(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(PKPaymentSendOwnershipTokensRequest);
  [(PKPaymentSendOwnershipTokensRequest *)v2 setPassOwnershipTokens:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [(PKPaymentSendOwnershipTokensRequest *)v2 setReason:*(void *)(a1 + 72)];
  [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:v2];
  uint64_t v3 = [*(id *)(a1 + 32) primaryBrokerURL];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) _appleAccountInformation];
  id v7 = [(PKPaymentSendOwnershipTokensRequest *)v2 _urlRequestWithServiceURL:v3 deviceIdentifier:v5 deviceMetadata:v4 appleAccountInformation:v6];

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 80);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_4;
  v10[3] = &unk_1E56E0EC8;
  v10[4] = v8;
  id v11 = *(id *)(a1 + 48);
  [v8 performRequest:v7 taskIdentifier:v9 completionHandler:v10];
}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) _resultForResponse:a3 error:v7 successHandler:&__block_literal_global_156];
  if (!v7 && v8 != 1)
  {
    id v7 = [*(id *)(a1 + 32) _errorWithResult:v8 data:v10];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, 1, v7);
  }
}

uint64_t __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_5()
{
  return 1;
}

- (unint64_t)repopulateZonesWithCloudStoreZoneNames:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];
  id v11 = (void *)v10;
  if (v6 && v10 && [v6 count])
  {
    id v12 = [[PKPaymentRepopulateZonesRequest alloc] initWithCloudStoreZoneNames:v6];
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v12];
    id v13 = [(PKPaymentWebService *)self primaryBrokerURL];
    id v14 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v15 = [(PKPaymentRepopulateZonesRequest *)v12 _urlRequestWithServiceURL:v13 deviceIdentifier:v11 appleAccountInformation:v14];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __73__PKPaymentWebService_repopulateZonesWithCloudStoreZoneNames_completion___block_invoke;
    v18[3] = &unk_1E56E0EC8;
    v18[4] = self;
    id v19 = v7;
    [(PKWebService *)self performRequest:v15 taskIdentifier:v8 completionHandler:v18];
  }
  else if (v7)
  {
    id v16 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
  }
  return v8;
}

void __73__PKPaymentWebService_repopulateZonesWithCloudStoreZoneNames_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) _resultForResponse:a3 error:v7 successHandler:&__block_literal_global_341];
  if (!v7 && v8 != 1)
  {
    id v7 = [*(id *)(a1 + 32) _errorWithResult:v8 data:v10];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, 1, v7);
  }
}

uint64_t __73__PKPaymentWebService_repopulateZonesWithCloudStoreZoneNames_completion___block_invoke_2()
{
  return 1;
}

- (void)backgroundPerformDeviceCheckInForRegion:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PKPaymentWebService_backgroundPerformDeviceCheckInForRegion_identifier___block_invoke;
  v12[3] = &unk_1E56D8AB8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E56D8360;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(backgroundDownloadQueue, block);
}

void __74__PKPaymentWebService_backgroundPerformDeviceCheckInForRegion_identifier___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_alloc_init(PKPaymentDeviceCheckinRequest);
  [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:v2];
  uint64_t v3 = [*(id *)(a1 + 32) context];
  uint64_t v4 = [v3 deviceID];
  if (v4)
  {
    uint64_t v5 = [v3 regionForIdentifier:*(void *)(a1 + 40)];
    id v6 = [v5 brokerURL];

    id v7 = [*(id *)(a1 + 32) _appleAccountInformation];
    uint64_t v8 = [(PKPaymentDeviceCheckinRequest *)v2 _urlRequestWithServiceURL:v6 deviceIdentifier:v4 appleAccountInformation:v7];

    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 120) downloadTaskWithRequest:v8];
    id v10 = +[PKPaymentBackgroundDownloadRecord taskWithType:4];
    [v10 setRegion:*(void *)(a1 + 40)];
    [v10 setIdentifier:*(void *)(a1 + 48)];
    id v11 = [*(id *)(a1 + 32) backgroundContext];
    objc_msgSend(v11, "addBackgroundDownloadRecord:forTaskIdentifier:", v10, objc_msgSend(v9, "taskIdentifier"));

    id v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v4;
      uint64_t v14 = [v9 taskIdentifier];
      [v8 URL];
      uint64_t v15 = v24 = v6;
      [v15 absoluteString];
      id v25 = v3;
      v17 = id v16 = v2;
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v14;
      uint64_t v4 = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu for %@:", buf, 0x16u);

      id v6 = v24;
      uint64_t v2 = v16;
      uint64_t v3 = v25;
    }

    [*(id *)(a1 + 32) logRequest:v8];
    [*(id *)(a1 + 32) _archiveBackgroundContext];
    [v9 resume];
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Device check in failed - no device ID present", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
    uint64_t v20 = dispatch_get_global_queue(21, 0);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __74__PKPaymentWebService_backgroundPerformDeviceCheckInForRegion_identifier___block_invoke_343;
    v26[3] = &unk_1E56DB988;
    uint64_t v21 = *(void *)(a1 + 32);
    unint64_t v22 = *(void **)(a1 + 40);
    id v27 = WeakRetained;
    uint64_t v28 = v21;
    id v29 = v22;
    id v30 = *(id *)(a1 + 48);
    uint64_t v23 = v26;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __dispatch_async_ar_block_invoke_14;
    id v32 = &unk_1E56D8360;
    id v33 = v23;
    id v6 = WeakRetained;
    dispatch_async(v20, buf);

    uint64_t v8 = v27;
  }
}

uint64_t __74__PKPaymentWebService_backgroundPerformDeviceCheckInForRegion_identifier___block_invoke_343(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentWebService:*(void *)(a1 + 40) deviceCheckInReturnedAction:0 success:0 region:*(void *)(a1 + 48) identifier:*(void *)(a1 + 56)];
}

- (unint64_t)updateRegistrationDataAtBrokerURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = objc_alloc_init(PKPaymentUpdateRegistrationDataRequest);
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v9];
  id v10 = [(PKPaymentWebService *)self context];
  id v11 = [v10 deviceID];

  if (v11)
  {
    id v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    id v13 = [(PKPaymentUpdateRegistrationDataRequest *)v9 _urlRequestWithServiceURL:v6 deviceIdentifier:v11 appleAccountInformation:v12];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__PKPaymentWebService_updateRegistrationDataAtBrokerURL_completion___block_invoke;
    v16[3] = &unk_1E56E0EC8;
    void v16[4] = self;
    id v17 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];
  }
  else if (v7)
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
  return v8;
}

void __68__PKPaymentWebService_updateRegistrationDataAtBrokerURL_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __68__PKPaymentWebService_updateRegistrationDataAtBrokerURL_completion___block_invoke_2;
  id v18 = &unk_1E56EE2C0;
  id v10 = v7;
  uint64_t v11 = *(void *)(a1 + 32);
  id v19 = v10;
  uint64_t v20 = v11;
  uint64_t v12 = [v9 _resultForResponse:a3 error:v8 successHandler:&v15];
  uint64_t v13 = v12;
  if (!v8 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v10, v15, v16, v17, v18);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v13, v8);
  }
}

uint64_t __68__PKPaymentWebService_updateRegistrationDataAtBrokerURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) context];
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "_updateContextWithRegistrationType:response:", objc_msgSend(v3, "registrationType"), v2);
    if (v4 == 1) {
      [*(id *)(a1 + 40) _archiveContext];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)unregisterDeviceWithCompletion:(id)a3
{
  return [(PKPaymentWebService *)self unregisterDeviceWithCompanionSerialNumber:0 completion:a3];
}

- (unint64_t)unregisterDeviceWithCompanionSerialNumber:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  if (v10)
  {
    uint64_t v11 = objc_alloc_init(PKPaymentUnregisterRequest);
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v11];
    uint64_t v12 = [(PKPaymentWebService *)self primaryBrokerURL];
    uint64_t v13 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v14 = [(PKPaymentUnregisterRequest *)v11 _urlRequestWithServiceURL:v12 deviceIdentifier:v10 companionSerialNumber:v6 appleAccountInformation:v13];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__PKPaymentWebService_unregisterDeviceWithCompanionSerialNumber_completion___block_invoke;
    v17[3] = &unk_1E56E0EC8;
    void v17[4] = self;
    id v18 = v7;
    [(PKWebService *)self performRequest:v14 taskIdentifier:v8 completionHandler:v17];
  }
  else
  {
    AnalyticsSendEvent();
    if (v7)
    {
      uint64_t v15 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
    }
  }

  return v8;
}

void __76__PKPaymentWebService_unregisterDeviceWithCompanionSerialNumber_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) _resultForResponse:a3 error:v7 successHandler:&__block_literal_global_347];
  if (v8 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 256) paymentWebService:*(void *)(a1 + 32) didRegisterWithRegionMap:0 primaryRegionTopic:0];
  }
  else
  {
    AnalyticsSendEvent();
    uint64_t v9 = [*(id *)(a1 + 32) _errorWithResult:v8 data:v11];

    id v7 = (id)v9;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, v8, v7);
  }
}

uint64_t __76__PKPaymentWebService_unregisterDeviceWithCompanionSerialNumber_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)issuerProvisioningCertificatesForRequest:(id)a3 withCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];
  id v11 = (void *)v10;
  if (!v7 || !v6 || !v10)
  {
    if (!v7) {
      goto LABEL_15;
    }
    if (v10)
    {
      if (v6)
      {
LABEL_14:
        (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
        goto LABEL_15;
      }
      uint64_t v15 = PKLogFacilityTypeGetObject(0x27uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "Failed to fetch certificates because of nil request.";
        id v17 = v15;
        uint32_t v18 = 2;
LABEL_12:
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(0x27uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = self;
        __int16 v25 = 2112;
        id v26 = v9;
        uint64_t v16 = "Failed to fetch certificates because of nil deviceID. \nWebService: %@ \nContext: %@";
        id v17 = v15;
        uint32_t v18 = 22;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
  uint64_t v12 = [(PKPaymentWebService *)self primaryBrokerURL];
  uint64_t v13 = [(PKPaymentWebService *)self _appleAccountInformation];
  uint64_t v14 = [v6 _urlRequestWithServiceURL:v12 deviceIdentifier:v11 appleAccountInformation:v13];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke;
  v20[3] = &unk_1E56E50E8;
  v20[4] = self;
  id v21 = v9;
  id v22 = v7;
  [(PKWebService *)self performRequest:v14 taskIdentifier:v8 completionHandler:v20];

LABEL_15:
  return v8;
}

void __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__54;
  id v29 = __Block_byref_object_dispose__54;
  id v30 = 0;
  id v10 = a1[4];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke_2;
  v22[3] = &unk_1E56DCAF0;
  id v24 = &v25;
  id v11 = v7;
  id v23 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:v22];
  if (v26[5])
  {
    if ([a1[5] devSigned])
    {
      values = PKCreateQARootCACertificate();
      if (values) {
        CFArrayRef v13 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, 0);
      }
      else {
        CFArrayRef v13 = 0;
      }
      BasicX509 = SecPolicyCreateBasicX509();
    }
    else
    {
      values = 0;
      BasicX509 = (const void *)SecPolicyCreateApplePayIssuerEncryption();
      CFArrayRef v13 = 0;
    }
    id v15 = (id)v26[5];
    uint64_t v16 = [v15 certificates];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke_3;
    v18[3] = &unk_1E56EE2E8;
    id v17 = v15;
    id v19 = v17;
    id v20 = a1[6];
    PKCreateTrustAndValidateAsync(v16, BasicX509, v13, v18);

    if (BasicX509) {
      CFRelease(BasicX509);
    }
    if (v13) {
      CFRelease(v13);
    }
    if (values) {
      CFRelease(values);
    }
  }
  else
  {
    if (!v9)
    {
      id v9 = [a1[4] _errorWithResult:v12 data:v11];
    }
    (*((void (**)(void))a1[6] + 2))();
  }

  _Block_object_dispose(&v25, 8);
}

BOOL __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [[PKPaymentIssuerProvisioningCertificatesResponse alloc] initWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

uint64_t __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke_3(uint64_t a1, int a2, SecTrustRef trust)
{
  if (trust)
  {
    if (a2)
    {
      if (SecTrustGetCertificateCount(trust) >= 1)
      {
        if (PKSecTrustGetCertificateAtIndex(trust, 0))
        {
          uint64_t v5 = SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
          if (v5)
          {
            id v6 = (const void *)v5;
            [*(id *)(a1 + 32) setPublicKeyHash:v5];
            CFRelease(v6);
          }
        }
      }
    }
  }
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v7();
}

- (unint64_t)remotePaymentCredentialsForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    CFArrayRef v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__PKPaymentWebService_remotePaymentCredentialsForRequest_completion___block_invoke;
    v16[3] = &unk_1E56E0EC8;
    void v16[4] = self;
    id v17 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];
  }
  else
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
  }
  return v8;
}

void __69__PKPaymentWebService_remotePaymentCredentialsForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[PKWebServiceResponse responseWithData:v7];
  id v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PKPaymentWebService_remotePaymentCredentialsForRequest_completion___block_invoke_2;
  v14[3] = &unk_1E56EE310;
  id v12 = v10;
  id v15 = v12;
  uint64_t v13 = [v11 _resultForResponse:v9 error:v8 successHandler:v14];

  if (!v8 && v13 != 1)
  {
    id v8 = [*(id *)(a1 + 32) _errorWithResult:v13 data:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL __69__PKPaymentWebService_remotePaymentCredentialsForRequest_completion___block_invoke_2(uint64_t a1)
{
  BOOL v1 = *(void *)(a1 + 32) != 0;
  AnalyticsSendEvent();
  return v1;
}

- (unint64_t)remotePaymentCredentialsUpdateForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    id v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__PKPaymentWebService_remotePaymentCredentialsUpdateForRequest_completion___block_invoke;
    v16[3] = &unk_1E56E0EC8;
    void v16[4] = self;
    id v17 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];
  }
  else
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
  }
  return v8;
}

void __75__PKPaymentWebService_remotePaymentCredentialsUpdateForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[PKWebServiceResponse responseWithData:v7];
  id v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PKPaymentWebService_remotePaymentCredentialsUpdateForRequest_completion___block_invoke_2;
  v14[3] = &unk_1E56EE310;
  id v12 = v10;
  id v15 = v12;
  uint64_t v13 = [v11 _resultForResponse:v9 error:v8 successHandler:v14];

  if (!v8 && v13 != 1)
  {
    id v8 = [*(id *)(a1 + 32) _errorWithResult:v13 data:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL __75__PKPaymentWebService_remotePaymentCredentialsUpdateForRequest_completion___block_invoke_2(uint64_t a1)
{
  BOOL v1 = *(void *)(a1 + 32) != 0;
  AnalyticsSendEvent();
  return v1;
}

- (unint64_t)requirementsForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];
  id v26 = 0;
  id v11 = [v6 region];
  id v12 = [(PKPaymentWebService *)self _brokerUrlForRegion:v11 regionOut:&v26];

  if (v10 && v26)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    uint64_t v13 = [v6 paymentCredential];
    int v14 = [v13 couldSupportSuperEasyProvisioning];

    if (v14) {
      uint64_t v15 = 499;
    }
    else {
      uint64_t v15 = 257;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke;
    v18[3] = &unk_1E56E5110;
    void v18[4] = self;
    id v19 = v6;
    id v20 = v12;
    id v21 = v10;
    id v22 = v26;
    id v23 = v9;
    unint64_t v25 = v8;
    id v24 = v7;
    [(PKPaymentWebService *)self _deviceDataIncludingMetadataFields:v15 withCompletionHandler:v18];
  }
  else if (v7)
  {
    uint64_t v16 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v16);
  }
  return v8;
}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) paymentCredential];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_2;
  v12[3] = &unk_1E56EE360;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = v3;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v10 = *(void **)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  id v19 = v8;
  uint64_t v21 = v9;
  id v20 = v10;
  id v11 = v3;
  [v4 _passOwnershipTokenForPaymentCredential:v5 completion:v12];
}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPassOwnershipToken:a2];
  if (+[PKDeviceScorer deviceScoringSupported])
  {
    id v3 = [*(id *)(a1 + 32) paymentCredential];
    int v4 = [v3 couldSupportSuperEasyProvisioning];

    if (v4)
    {
      uint64_t v5 = objc_alloc_init(PKDSPContext);
      id v6 = [*(id *)(a1 + 40) _paymentDevice];
      uint64_t v7 = [v6 primarySecureElementIdentifier];

      [(PKDSPContext *)v5 setSecureElementID:v7];
      [(PKDSPContext *)v5 setServerEndpointIdentifier:@"enable"];
      id v8 = [*(id *)(a1 + 48) phoneNumber];
      [(PKDSPContext *)v5 setPhoneNumber:v8];

      uint64_t v9 = [*(id *)(a1 + 40) _appleAccountInformation];
      [(PKDSPContext *)v5 setPrimaryAppleAccount:v9];

      id v10 = [*(id *)(a1 + 32) cardholderName];
      [(PKDSPContext *)v5 setCardholderName:v10];

      [*(id *)(a1 + 32) setContext:v5];
    }
  }
  id v11 = *(NSObject **)(*(void *)(a1 + 40) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_3;
  block[3] = &unk_1E56EE338;
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 40);
  id v20 = v12;
  uint64_t v21 = v13;
  id v22 = *(id *)(a1 + 72);
  id v23 = *(id *)(a1 + 80);
  id v14 = *(id *)(a1 + 48);
  id v16 = *(void **)(a1 + 88);
  uint64_t v15 = *(void *)(a1 + 96);
  id v24 = v14;
  uint64_t v26 = v15;
  id v25 = v16;
  dispatch_async(v11, block);
}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 56) _appleAccountInformation];
  id v6 = [*(id *)(a1 + 64) certificates];
  uint64_t v7 = [*(id *)(a1 + 72) devSigned];
  uint64_t v9 = *(void *)(a1 + 80);
  id v8 = *(void **)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_4;
  v12[3] = &unk_1E56E5200;
  uint64_t v11 = *(void *)(a1 + 96);
  void v12[4] = v10;
  uint64_t v14 = v11;
  id v13 = v8;
  [v2 _urlRequestWithServiceURL:v3 deviceIdentifier:v4 appleAccountInformation:v5 certChain:v6 devSigned:v7 deviceData:v9 webService:v10 completion:v12];
}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_5;
  v5[3] = &unk_1E56E0EC8;
  void v5[4] = v3;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 performRequest:a2 taskIdentifier:v4 cacheResponse:0 completionHandler:v5];
}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v18[0] = 0;
  v18[1] = v18;
  id v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__54;
  void v18[4] = __Block_byref_object_dispose__54;
  id v19 = 0;
  uint64_t v10 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_6;
  v14[3] = &unk_1E56EE7C0;
  id v11 = v8;
  id v15 = v11;
  id v17 = v18;
  id v12 = v7;
  id v16 = v12;
  uint64_t v13 = [v10 _resultForResponse:v11 error:v9 successHandler:v14];
  if (!v9 && v13 != 1)
  {
    id v9 = [*(id *)(a1 + 32) _errorWithResult:v13 response:v11 data:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  _Block_object_dispose(v18, 8);
}

BOOL __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_6(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [*(id *)(a1 + 32) allHeaderFields];
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 40) headers:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  BOOL v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v6;
}

- (unint64_t)eligibilityForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];
  if (v10)
  {
    id v24 = 0;
    id v11 = [v6 region];
    id v12 = [(PKPaymentWebService *)self _brokerUrlForRegion:v11 regionOut:&v24];

    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke;
    v16[3] = &unk_1E56EE388;
    void v16[4] = self;
    id v17 = v6;
    id v18 = v12;
    id v19 = v10;
    id v20 = v24;
    id v21 = v9;
    unint64_t v23 = v8;
    id v22 = v7;
    id v13 = v12;
    [(PKPaymentWebService *)self _deviceConfigurationDataWithCompletion:v16];
  }
  else if (v7)
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
  }
  return v8;
}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) paymentCredential];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_2;
  v10[3] = &unk_1E56EE360;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  id v17 = v3;
  unint64_t v8 = *(void **)(a1 + 80);
  uint64_t v19 = *(void *)(a1 + 88);
  id v18 = v8;
  id v9 = v3;
  [v4 _passOwnershipTokenForPaymentCredential:v5 completion:v10];
}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPassOwnershipToken:a2];
  id v3 = *(NSObject **)(*(void *)(a1 + 40) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_3;
  block[3] = &unk_1E56EE338;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  id v12 = v4;
  uint64_t v13 = v5;
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  id v6 = *(id *)(a1 + 80);
  unint64_t v8 = *(void **)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 96);
  id v16 = v6;
  uint64_t v18 = v7;
  id v17 = v8;
  dispatch_async(v3, block);
}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 56) _appleAccountInformation];
  id v6 = [*(id *)(a1 + 64) certificates];
  uint64_t v7 = [*(id *)(a1 + 72) devSigned];
  uint64_t v9 = *(void *)(a1 + 80);
  unint64_t v8 = *(void **)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_4;
  v12[3] = &unk_1E56E5200;
  uint64_t v11 = *(void *)(a1 + 96);
  void v12[4] = v10;
  uint64_t v14 = v11;
  id v13 = v8;
  [v2 _urlRequestWithServiceURL:v3 deviceIdentifier:v4 appleAccountInformation:v5 certChain:v6 devSigned:v7 deviceData:v9 webService:v10 completion:v12];
}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_5;
  v5[3] = &unk_1E56E0EC8;
  void v5[4] = v3;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 performRequest:a2 taskIdentifier:v4 cacheResponse:0 completionHandler:v5];
}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy__54;
  id v24 = __Block_byref_object_dispose__54;
  id v25 = 0;
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_6;
  id v17 = &unk_1E56DCAF0;
  uint64_t v19 = &v20;
  id v11 = v7;
  id v18 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v14];
  if (v12 != 1 && !v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v12, v8, v11, v14, v15, v16, v17);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  AnalyticsSendEvent();
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v13 + 16))(v13, v12, v21[5], v9);
  }

  _Block_object_dispose(&v20, 8);
}

BOOL __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)provisionPassesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  targetDevice = self->_targetDevice;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke;
  v13[3] = &unk_1E56EE428;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v7;
  unint64_t v17 = v8;
  id v10 = v7;
  id v11 = v6;
  [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice paymentWebService:self setNewAuthRandomIfNecessaryReturningPairingState:v13];

  return v8;
}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    if ([*(id *)(a1 + 32) isDeviceProvisioningDataExpected]) {
      uint64_t v9 = 498;
    }
    else {
      uint64_t v9 = 256;
    }
    if ([*(id *)(a1 + 32) sendReducedDeviceData]) {
      v9 &= ~0x80uLL;
    }
    id v10 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_2;
    v16[3] = &unk_1E56EE400;
    void v16[4] = v10;
    id v17 = *(id *)(a1 + 32);
    id v18 = v7;
    id v11 = v8;
    uint64_t v13 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    id v19 = v11;
    uint64_t v21 = v12;
    id v20 = v13;
    [v10 _deviceDataIncludingMetadataFields:v9 withCompletionHandler:v16];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      uint64_t v15 = [*(id *)(a1 + 40) _errorWithResult:0 data:0];
      (*(void (**)(uint64_t, void, void, void *))(v14 + 16))(v14, 0, 0, v15);
    }
  }
}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (+[PKDeviceScorer deviceScoringSupported])
    {
      uint64_t v4 = objc_alloc_init(PKDSPContext);
      uint64_t v5 = [*(id *)(a1 + 32) _paymentDevice];
      id v6 = [v5 primarySecureElementIdentifier];

      [(PKDSPContext *)v4 setSecureElementID:v6];
      [(PKDSPContext *)v4 setServerEndpointIdentifier:@"enable"];
      id v7 = [*(id *)(*(void *)(a1 + 32) + 256) secureElementIdentifiers];
      int v8 = [v7 containsObject:v6];

      if (v8)
      {
        [*(id *)(a1 + 40) setCryptogram:*(void *)(a1 + 48)];
        [*(id *)(a1 + 40) setChallengeResponse:*(void *)(a1 + 56)];
      }
      uint64_t v9 = [v3 phoneNumber];
      [(PKDSPContext *)v4 setPhoneNumber:v9];

      id v10 = [*(id *)(a1 + 32) _appleAccountInformation];
      [(PKDSPContext *)v4 setPrimaryAppleAccount:v10];

      id v11 = [*(id *)(a1 + 40) cardholderName];
      [(PKDSPContext *)v4 setCardholderName:v11];

      [*(id *)(a1 + 40) setContext:v4];
    }
    uint64_t v12 = [*(id *)(a1 + 32) context];
    uint64_t v13 = [v12 deviceID];
    if (!v13)
    {
      uint64_t v21 = *(void *)(a1 + 64);
      if (v21) {
        (*(void (**)(uint64_t, void, void, void))(v21 + 16))(v21, 0, 0, 0);
      }
      AnalyticsSendEvent();
      goto LABEL_22;
    }
    uint64_t v14 = [*(id *)(a1 + 40) eligibilityResponse];
    uint64_t v15 = [v14 region];

    id v16 = [v12 regionForIdentifier:v15];
    id v17 = v16;
    if (!v15 || v16)
    {
      if (v16)
      {
        uint64_t v22 = [v16 brokerURL];
LABEL_21:
        unint64_t v23 = (void *)v22;
        [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:*(void *)(a1 + 40)];
        id v24 = *(NSObject **)(*(void *)(a1 + 32) + 216);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_393;
        block[3] = &unk_1E56EE338;
        id v33 = *(id *)(a1 + 40);
        id v34 = v23;
        id v25 = v13;
        uint64_t v26 = *(void *)(a1 + 32);
        id v35 = v25;
        uint64_t v36 = v26;
        id v37 = v17;
        id v38 = v12;
        id v27 = v3;
        id v29 = *(void **)(a1 + 64);
        uint64_t v28 = *(void *)(a1 + 72);
        id v39 = v27;
        uint64_t v41 = v28;
        id v40 = v29;
        id v30 = v17;
        id v31 = v23;
        dispatch_async(v24, block);

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      id v18 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v15;
        _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: error: eligibility region %@ provided but not registered for region.", buf, 0xCu);
      }
    }
    uint64_t v22 = [*(id *)(a1 + 32) primaryBrokerURL];
    goto LABEL_21;
  }
  uint64_t v19 = *(void *)(a1 + 64);
  if (v19)
  {
    id v20 = [*(id *)(a1 + 32) _errorWithResult:0 data:0];
    (*(void (**)(uint64_t, void, void, void *))(v19 + 16))(v19, 0, 0, v20);
  }
  AnalyticsSendEvent();
LABEL_23:
}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_393(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 56) _appleAccountInformation];
  id v6 = [*(id *)(a1 + 64) certificates];
  uint64_t v7 = [*(id *)(a1 + 72) devSigned];
  uint64_t v9 = *(void *)(a1 + 80);
  int v8 = *(void **)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_2_394;
  v12[3] = &unk_1E56E5200;
  uint64_t v11 = *(void *)(a1 + 96);
  void v12[4] = v10;
  uint64_t v14 = v11;
  id v13 = v8;
  [v2 _urlRequestWithServiceURL:v3 deviceIdentifier:v4 appleAccountInformation:v5 certChain:v6 devSigned:v7 deviceData:v9 webService:v10 completion:v12];
}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_2_394(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_3;
  v5[3] = &unk_1E56E0EC8;
  void v5[4] = v3;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 performRequest:a2 taskIdentifier:v4 cacheResponse:0 completionHandler:v5];
}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__54;
  long long v56 = __Block_byref_object_dispose__54;
  id v57 = 0;
  uint64_t v10 = *(void **)(a1 + 32);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_4;
  v49[3] = &unk_1E56EE3B0;
  uint64_t v26 = v8;
  id v27 = v7;
  id v50 = v27;
  uint64_t v51 = &v52;
  uint64_t v11 = [v10 _resultForResponse:v8 error:v9 successHandler:v49];
  uint64_t v28 = [(id)v53[5] downloadablePasses];
  uint64_t v43 = 0;
  uint64_t v44 = (id *)&v43;
  uint64_t v45 = 0x3032000000;
  long long v46 = __Block_byref_object_copy__54;
  long long v47 = __Block_byref_object_dispose__54;
  id v48 = 0;
  id v29 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  if (v11 == 1)
  {
    if ([v28 count])
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v12 = v28;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v58 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v40 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v17 = *(void **)(a1 + 32);
            id v18 = [v16 ownershipToken];
            uint64_t v19 = [v16 ownershipTokenIdentifier];
            [v17 _storePassOwnershipToken:v18 withIdentifier:v19];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v58 count:16];
        }
        while (v13);
      }
LABEL_17:

      goto LABEL_18;
    }
    id v20 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: Error - Provisioning succeeded but returned no downloadable passes", buf, 2u);
    }
  }
  id v12 = v9;
  if (!v9)
  {
    id v12 = [*(id *)(a1 + 32) _errorWithResult:v11 response:v26 data:v27];
  }
  objc_storeStrong(v44 + 5, v12);
  if (!v9) {
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_396;
  v30[3] = &unk_1E56EE3D8;
  id v35 = &v43;
  id v22 = v28;
  uint64_t v23 = *(void *)(a1 + 32);
  id v31 = v22;
  uint64_t v32 = v23;
  uint64_t v37 = v11;
  id v24 = v27;
  id v33 = v24;
  id v34 = *(id *)(a1 + 40);
  uint64_t v36 = &v52;
  id v25 = [(PKAsyncUnaryOperationComposer *)v29 evaluateWithInput:v21 completion:v30];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v52, 8);
}

uint64_t __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_396(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!v8) {

  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, void, void, void))(v9 + 16))(v9, *(void *)(a1 + 80), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  id v12 = @"success";
  uint64_t v10 = [NSNumber numberWithBool:v8 == 0];
  v13[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  AnalyticsSendEvent();
}

- (unint64_t)initiateExternalProvisioningForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    uint64_t v11 = [v6 region];
    id v12 = [(PKPaymentWebService *)self _brokerUrlForRegion:v11 regionOut:0];

    uint64_t v13 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v14 = [v6 _urlRequestWithServiceURL:v12 deviceIdentifier:v10 appleAccountInformation:v13];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__PKPaymentWebService_initiateExternalProvisioningForRequest_completion___block_invoke;
    v16[3] = &unk_1E56E0EC8;
    void v16[4] = self;
    id v17 = v7;
    [(PKWebService *)self performRequest:v14 taskIdentifier:v8 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }

  return v8;
}

void __73__PKPaymentWebService_initiateExternalProvisioningForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) _resultForResponse:v7 error:v8 successHandler:&__block_literal_global_407_0];
  uint64_t v10 = v9;
  if (!v8 && v9 != 1)
  {
    id v8 = [*(id *)(a1 + 32) _errorWithResult:v9 response:v7 data:v12];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v10, v8);
  }
}

uint64_t __73__PKPaymentWebService_initiateExternalProvisioningForRequest_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)deprovisionForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    uint64_t v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    id v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__PKPaymentWebService_deprovisionForRequest_completion___block_invoke;
    v15[3] = &unk_1E56E0EC8;
    void v15[4] = self;
    id v16 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v15];
  }
  return v8;
}

void __56__PKPaymentWebService_deprovisionForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) _resultForResponse:v7 error:v8 successHandler:&__block_literal_global_409_0];
  uint64_t v10 = v9;
  if (!v8 && v9 != 1)
  {
    id v8 = [*(id *)(a1 + 32) _errorWithResult:v9 response:v7 data:v12];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v10, v8);
  }
}

uint64_t __56__PKPaymentWebService_deprovisionForRequest_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)deleteForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    uint64_t v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    id v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [v6 _urlRequestWithServiceURL:v11 appleAccountInformation:v12];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__PKPaymentWebService_deleteForRequest_completion___block_invoke;
    v15[3] = &unk_1E56E0EC8;
    void v15[4] = self;
    id v16 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v15];
  }
  return v8;
}

void __51__PKPaymentWebService_deleteForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) _resultForResponse:v7 error:v8 successHandler:&__block_literal_global_411];
  uint64_t v10 = v9;
  if (!v8 && v9 != 1)
  {
    id v8 = [*(id *)(a1 + 32) _errorWithResult:v9 response:v7 data:v12];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v10, v8);
  }
}

uint64_t __51__PKPaymentWebService_deleteForRequest_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)prepareToProvisionForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    uint64_t v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    id v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    if (v13)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __63__PKPaymentWebService_prepareToProvisionForRequest_completion___block_invoke;
      v15[3] = &unk_1E56E0EC8;
      void v15[4] = self;
      id v16 = v7;
      [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v15];
    }
    else if (v7)
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }

  return v8;
}

void __63__PKPaymentWebService_prepareToProvisionForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) _resultForResponse:v7 error:v8 successHandler:&__block_literal_global_413];
  uint64_t v10 = v9;
  if (!v8 && v9 != 1)
  {
    id v8 = [*(id *)(a1 + 32) _errorWithResult:v9 response:v7 data:v12];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v10, v8);
  }
}

uint64_t __63__PKPaymentWebService_prepareToProvisionForRequest_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)provisionPrecursorPassForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    uint64_t v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    id v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__PKPaymentWebService_provisionPrecursorPassForRequest_completion___block_invoke;
    v15[3] = &unk_1E56E0EC8;
    void v15[4] = self;
    id v16 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v15];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }

  return v8;
}

void __67__PKPaymentWebService_provisionPrecursorPassForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__54;
  id v24 = __Block_byref_object_dispose__54;
  id v25 = 0;
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __67__PKPaymentWebService_provisionPrecursorPassForRequest_completion___block_invoke_2;
  id v17 = &unk_1E56DCAF0;
  uint64_t v19 = &v20;
  id v11 = v7;
  id v18 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v14];
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v12, v8, v11, v14, v15, v16, v17);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v21[5], v9);
  }

  _Block_object_dispose(&v20, 8);
}

BOOL __67__PKPaymentWebService_provisionPrecursorPassForRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)tapToProvisionConfigurationForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__PKPaymentWebService_tapToProvisionConfigurationForRequest_completion___block_invoke;
    v15[3] = &unk_1E56E0EC8;
    void v15[4] = self;
    id v16 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v15];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }

  return v8;
}

void __72__PKPaymentWebService_tapToProvisionConfigurationForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__54;
  id v24 = __Block_byref_object_dispose__54;
  id v25 = 0;
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __72__PKPaymentWebService_tapToProvisionConfigurationForRequest_completion___block_invoke_2;
  id v17 = &unk_1E56DCAF0;
  uint64_t v19 = &v20;
  id v11 = v7;
  id v18 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v14];
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v12, v8, v11, v14, v15, v16, v17);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v21[5], v9);
  }

  _Block_object_dispose(&v20, 8);
}

BOOL __72__PKPaymentWebService_tapToProvisionConfigurationForRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)verificationOptionsForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];
  if (v10)
  {
    id v11 = [v6 pass];
    uint64_t v12 = [v11 passTypeIdentifier];
    uint64_t v13 = [v9 regionForIdentifier:v12];

    if (v13) {
      [v13 brokerURL];
    }
    else {
    uint64_t v15 = [(PKPaymentWebService *)self primaryBrokerURL];
    }
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v16 = [(PKPaymentWebService *)self _appleAccountInformation];
    id v17 = [v6 _urlRequestWithServiceURL:v15 deviceIdentifier:v10 appleAccountInformation:v16];

    if (v17)
    {
      id v18 = [v6 pass];
      [(PKPaymentWebService *)self _performVerificationRequest:v17 selectedChannel:0 paymentPass:v18 taskID:v8 completion:v7];
    }
    else
    {
      if (v7)
      {
        uint64_t v19 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v19);
      }
      AnalyticsSendEvent();
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
    }
    AnalyticsSendEvent();
  }

  return v8;
}

- (unint64_t)updateVerification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *, void))a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [v6 pass];
  uint64_t v10 = [(PKPaymentWebService *)self verificationRecordForPass:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[PKVerificationRequestRecord verificationRequestRecordForPass:v9];
  }
  uint64_t v13 = v12;

  uint64_t v14 = [v6 channel];
  uint64_t v15 = v14;
  if (v14 && ([v14 needsServerRequest] & 1) == 0)
  {
    [v13 setChannel:v15];
    [v13 setVerificationStatus:4000];
    [(PKPaymentWebService *)self updateVerificationRecord:v13];
    if (v7) {
      v7[2](v7, 1, v13, 0);
    }
  }
  else
  {
    id v16 = [(PKPaymentWebService *)self context];
    id v17 = [v16 deviceID];
    if (v17)
    {
      unint64_t v26 = v8;
      id v18 = [v9 passTypeIdentifier];
      uint64_t v19 = [v16 regionForIdentifier:v18];

      if (v19) {
        [v19 brokerURL];
      }
      else {
      uint64_t v21 = [(PKPaymentWebService *)self primaryBrokerURL];
      }
      -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6, v13);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __53__PKPaymentWebService_updateVerification_completion___block_invoke;
      v27[3] = &unk_1E56EE478;
      id v28 = v6;
      id v29 = v21;
      id v30 = v17;
      id v31 = self;
      id v32 = v19;
      id v33 = v16;
      id v34 = v15;
      id v35 = v9;
      unint64_t v37 = v26;
      uint64_t v36 = v7;
      id v22 = v19;
      id v23 = v21;
      [(PKPaymentWebService *)self _deviceConfigurationDataWithCompletion:v27];

      unint64_t v8 = v26;
      uint64_t v13 = v25;
    }
    else
    {
      if (v7)
      {
        uint64_t v20 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
        ((void (**)(id, uint64_t, void *, void *))v7)[2](v7, 0, 0, v20);
      }
      AnalyticsSendEvent();
    }
  }
  return v8;
}

void __53__PKPaymentWebService_updateVerification_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  id v7 = a2;
  unint64_t v8 = [v5 _appleAccountInformation];
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = [*(id *)(a1 + 64) certificates];
  char v11 = [*(id *)(a1 + 72) devSigned];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__PKPaymentWebService_updateVerification_completion___block_invoke_2;
  v16[3] = &unk_1E56EE450;
  void v16[4] = *(void *)(a1 + 56);
  id v17 = *(id *)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  uint64_t v14 = *(void **)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 104);
  id v18 = v12;
  uint64_t v20 = v13;
  id v19 = v14;
  LOBYTE(v15) = v11;
  [v3 _urlRequestWithServiceURL:v4 deviceIdentifier:v6 appleAccountInformation:v8 deviceData:v7 webService:v9 certChain:v10 devSigned:v15 completion:v16];
}

void __53__PKPaymentWebService_updateVerification_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    [*(id *)(a1 + 32) _performVerificationRequest:v5 selectedChannel:*(void *)(a1 + 40) paymentPass:*(void *)(a1 + 48) taskID:*(void *)(a1 + 64) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) _errorWithResult:0 data:0];
      (*(void (**)(uint64_t, void, void, void *))(v3 + 16))(v3, 0, 0, v4);
    }
    AnalyticsSendEvent();
  }
}

- (void)_performVerificationRequest:(id)a3 selectedChannel:(id)a4 paymentPass:(id)a5 taskID:(unint64_t)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke;
  v18[3] = &unk_1E56EE098;
  void v18[4] = self;
  id v19 = v13;
  id v20 = v12;
  id v21 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v13;
  [(PKWebService *)self performRequest:a3 taskIdentifier:a6 completionHandler:v18];
}

void __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__54;
  uint64_t v36 = __Block_byref_object_dispose__54;
  id v37 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v10 = a1[4];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke_2;
  v21[3] = &unk_1E56EE4A0;
  id v11 = v7;
  id v22 = v11;
  id v12 = a1[5];
  id v13 = a1[4];
  id v23 = v12;
  id v24 = v13;
  unint64_t v26 = &v32;
  id v27 = &v28;
  id v25 = a1[6];
  uint64_t v14 = [v10 _resultForResponse:v8 error:v9 successHandler:v21];
  if (v14 != 1)
  {
    if (!v9)
    {
      id v9 = [a1[4] _errorWithResult:v14 response:v8 data:v11];
    }
    AnalyticsSendEvent();
    goto LABEL_8;
  }
  AnalyticsSendEvent();
  if ((unint64_t)v29[3] > 1 || [(id)v33[5] verificationStatus] != 3)
  {
LABEL_8:
    (*((void (**)(void))a1[7] + 2))();
    goto LABEL_9;
  }
  id v15 = a1[4];
  id v16 = [a1[5] passTypeIdentifier];
  id v17 = [a1[5] serialNumber];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke_442;
  v18[3] = &unk_1E56EE4C8;
  id v19 = a1[7];
  id v20 = &v32;
  [v15 passWithPassTypeIdentifier:v16 serialNumber:v17 completion:v18];

LABEL_9:
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

uint64_t __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKPaymentActivationResponse responseWithData:*(void *)(a1 + 32) forPass:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v12 = PKLogFacilityTypeGetObject(0);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    __int16 v22 = 0;
    id v13 = "no activation response";
    uint64_t v14 = (uint8_t *)&v22;
LABEL_26:
    _os_log_error_impl(&dword_190E10000, v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
    goto LABEL_18;
  }
  uint64_t v3 = [*(id *)(a1 + 48) verificationRecordForPass:*(void *)(a1 + 40)];
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v4 = +[PKVerificationRequestRecord verificationRequestRecordForPass:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v4);
  if (!v3) {

  }
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v6 = [v2 previousStepIdentifier];
  [v5 setPreviousStepIdentifier:v6];

  id v7 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v8 = [v2 stepIdentifier];
  [v7 setCurrentStepIdentifier:v8];

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) verificationStatus];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "setVerificationStatus:", objc_msgSend(v2, "verificationStatus"));
  uint64_t v9 = [v2 verificationStatus];
  switch(v9)
  {
    case 3:
      if (*(void *)(a1 + 56)) {
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "setChannel:");
      }
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setRequiredFieldData:0];
      goto LABEL_23;
    case 2:
      id v15 = [v2 verificationChannels];
      if (PKShowFakeVerificationChannels())
      {
        id v16 = [*(id *)(a1 + 48) _fakeVerificationChannelsWithRealChannels:v15];
      }
      else
      {
        uint64_t v18 = [*(id *)(*(void *)(a1 + 48) + 256) paymentWebService:*(void *)(a1 + 48) filterVerificationChannels:v15];

        id v16 = [*(id *)(a1 + 48) removeRedundantChannelsFromChannels:v18];
        id v15 = (void *)v18;
      }

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setAllChannels:v16];
      id v19 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) channel];
      uint64_t v20 = [v19 type];

      if (v20 == 7) {
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setChannel:0];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setRequiredFieldData:0];

      goto LABEL_23;
    case 1:
      id v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v11 = [v2 requiredVerificationFieldData];
      [v10 setRequiredFieldData:v11];

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setChannel:0];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setAllChannels:0];
LABEL_23:
      [*(id *)(a1 + 48) updateVerificationRecord:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      uint64_t v17 = 1;
      goto LABEL_24;
  }
  id v12 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v13 = "Unknown state";
    uint64_t v14 = buf;
    goto LABEL_26;
  }
LABEL_18:

  uint64_t v17 = 0;
LABEL_24:

  return v17;
}

uint64_t __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke_442(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (id)removeRedundantChannelsFromChannels:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v4)
  {
    id v7 = 0;
    uint64_t v6 = 0;
LABEL_16:
    id v15 = v3;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  id v7 = 0;
  uint64_t v8 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if ([v10 type] == 5)
      {
        id v11 = v7;
        id v12 = v6;
        id v7 = v10;
      }
      else
      {
        id v11 = v6;
        id v12 = v10;
        if ([v10 type] != 8) {
          continue;
        }
      }
      id v13 = v10;

      uint64_t v6 = v12;
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v5);
  if (!v7 || !v6) {
    goto LABEL_16;
  }
  uint64_t v14 = (void *)[v3 mutableCopy];
  [v14 removeObjectIdenticalTo:v7];
  id v15 = (void *)[v14 copy];

LABEL_17:
  id v16 = v15;

  return v16;
}

- (id)_fakeVerificationChannelsWithRealChannels:(id)a3
{
  v53[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = [a3 mutableCopy];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  }
  uint64_t v4 = (void *)v3;
  v53[0] = @"fake_email";
  v52[0] = @"identifier";
  v52[1] = @"type";
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:1];
  v53[1] = v5;
  v53[2] = MEMORY[0x1E4F1CC28];
  v52[2] = @"requiresUserInteraction";
  v52[3] = @"contactPoint";
  v52[4] = @"sourceAddress";
  v53[3] = @"fakebank@apple.com";
  v53[4] = @"fakebank@apple.com";
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:5];
  id v7 = +[PKVerificationChannel verificationChannelWithDictionary:v6 andOrganizationName:@"Fake Bank"];
  [v4 addObject:v7];

  v51[0] = @"fake_sms";
  v50[0] = @"identifier";
  v50[1] = @"type";
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:2];
  v51[1] = v8;
  v50[2] = @"requiresUserInteraction";
  v50[3] = @"contactPoint";
  void v50[4] = @"sourceAddress";
  v51[2] = MEMORY[0x1E4F1CC28];
  v51[3] = @"123-456";
  v51[4] = @"123-456";
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:5];
  id v10 = +[PKVerificationChannel verificationChannelWithDictionary:v9 andOrganizationName:@"Fake Bank"];
  [v4 addObject:v10];

  v49[0] = @"fake_inbound_call";
  v48[0] = @"identifier";
  v48[1] = @"type";
  id v11 = [NSNumber numberWithUnsignedInteger:3];
  uint64_t v12 = MEMORY[0x1E4F1CC38];
  v49[1] = v11;
  v49[2] = MEMORY[0x1E4F1CC38];
  v48[2] = @"requiresUserInteraction";
  v48[3] = @"contactPoint";
  v48[4] = @"sourceAddress";
  v49[3] = @"123-456";
  void v49[4] = @"123-456";
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:5];
  uint64_t v14 = +[PKVerificationChannel verificationChannelWithDictionary:v13 andOrganizationName:@"Fake Bank"];
  [v4 addObject:v14];

  v47[0] = @"fake_outbound_call";
  v46[0] = @"identifier";
  v46[1] = @"type";
  id v15 = [NSNumber numberWithUnsignedInteger:4];
  v47[1] = v15;
  v47[2] = v12;
  v46[2] = @"requiresUserInteraction";
  v46[3] = @"contactPoint";
  v46[4] = @"sourceAddress";
  v47[3] = @"(408) 300 2752";
  v47[4] = @"Bank";
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:5];
  uint64_t v17 = +[PKVerificationChannel verificationChannelWithDictionary:v16 andOrganizationName:@"Fake Bank"];
  [v4 addObject:v17];

  v45[0] = @"fake_outbound_call_no_number";
  v44[0] = @"identifier";
  v44[1] = @"type";
  long long v18 = [NSNumber numberWithUnsignedInteger:4];
  v45[1] = v18;
  v45[2] = v12;
  v44[2] = @"requiresUserInteraction";
  v44[3] = @"sourceAddress";
  v45[3] = @"Bank";
  long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:4];
  long long v20 = +[PKVerificationChannel verificationChannelWithDictionary:v19 andOrganizationName:@"Fake Bank"];
  [v4 addObject:v20];

  v43[0] = @"fake_bank_app";
  v42[0] = @"identifier";
  v42[1] = @"type";
  long long v21 = [NSNumber numberWithUnsignedInteger:5];
  v43[1] = v21;
  v43[2] = v12;
  v42[2] = @"requiresUserInteraction";
  v42[3] = @"contactPoint";
  v42[4] = @"sourceAddress";
  v43[3] = @"Our Bank App";
  v43[4] = @"Bank";
  __int16 v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:5];
  uint64_t v23 = +[PKVerificationChannel verificationChannelWithDictionary:v22 andOrganizationName:@"Fake Bank"];
  [v4 addObject:v23];

  v41[0] = @"fake_url";
  v40[0] = @"identifier";
  v40[1] = @"type";
  id v24 = [NSNumber numberWithUnsignedInteger:8];
  v41[1] = v24;
  v41[2] = @"Other";
  v40[2] = @"typeDescription";
  v40[3] = @"requiresUserInteraction";
  uint64_t v25 = MEMORY[0x1E4F1CC38];
  v41[3] = MEMORY[0x1E4F1CC38];
  v41[4] = @"Chase App Clip or Web Page";
  v40[4] = @"contactPoint";
  v40[5] = @"sourceAddress";
  void v41[5] = @"https://www.fakebank.com";
  unint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:6];
  id v27 = +[PKVerificationChannel verificationChannelWithDictionary:v26 andOrganizationName:@"JP Morgan Chase"];
  [v4 addObject:v27];

  v39[0] = @"fake_statement";
  v38[0] = @"identifier";
  v38[1] = @"type";
  uint64_t v28 = [NSNumber numberWithUnsignedInteger:6];
  v39[1] = v28;
  v39[2] = v25;
  v38[2] = @"requiresUserInteraction";
  v38[3] = @"contactPoint";
  v38[4] = @"sourceAddress";
  v39[3] = @"Bank Statement";
  v39[4] = @"Bank Statement";
  id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:5];
  uint64_t v30 = +[PKVerificationChannel verificationChannelWithDictionary:v29 andOrganizationName:@"Fake Bank"];
  [v4 addObject:v30];

  v37[0] = @"fake_other";
  uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 7, @"identifier", @"type");
  v37[1] = v31;
  v37[2] = @"Other";
  v36[2] = @"typeDescription";
  v36[3] = @"requiresUserInteraction";
  v37[3] = MEMORY[0x1E4F1CC38];
  v37[4] = @"Some other method...";
  v36[4] = @"contactPoint";
  v36[5] = @"sourceAddress";
  v37[5] = @"Other";
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:6];
  id v33 = +[PKVerificationChannel verificationChannelWithDictionary:v32 andOrganizationName:@"Fake Bank"];
  [v4 addObject:v33];

  uint64_t v34 = (void *)[v4 copy];
  return v34;
}

- (id)verificationRecordForPass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentWebService *)self context];
  uint64_t v6 = [v4 uniqueID];

  id v7 = [v5 verificationRequestRecordForUniqueID:v6];

  return v7;
}

- (void)updateVerificationRecord:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PKPaymentWebService *)self context];
    uint64_t v6 = [v4 passUniqueID];
    [v5 addVerificationRequestRecord:v4 forUniqueID:v6];

    [(PKPaymentWebService *)self _archiveContext];
  }
  if ([v4 verificationStatus] == 2)
  {
    id v7 = [v4 channel];
    uint64_t v8 = [v7 typeDescriptionUnlocalized];

    if (v8)
    {
      id v10 = @"type";
      v11[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      AnalyticsSendEvent();
    }
  }
}

- (void)removeVerificationRequestRecord:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(PKPaymentWebService *)self context];
    uint64_t v6 = [v4 passUniqueID];

    [v5 removeVerificationRequestRecordForUniqueID:v6];
    [(PKPaymentWebService *)self _archiveContext];
  }
}

- (unint64_t)submitVerificationCode:(id)a3 verificationData:(id)a4 forPass:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = [(PKWebService *)self nextTaskID];
  id v15 = [(PKPaymentWebService *)self context];
  id v16 = [v15 deviceID];
  if (v16)
  {
    unint64_t v26 = v14;
    uint64_t v17 = objc_alloc_init(PKPaymentSubmitActivationCodeRequest);
    [(PKPaymentSubmitActivationCodeRequest *)v17 setPass:v12];
    [(PKPaymentSubmitActivationCodeRequest *)v17 setVerificationCode:v10];
    id v27 = v11;
    [(PKPaymentSubmitActivationCodeRequest *)v17 setVerificationData:v11];
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v17];
    long long v18 = [v12 passTypeIdentifier];
    long long v19 = [v15 regionForIdentifier:v18];

    id v28 = v10;
    if (v19) {
      [v19 brokerURL];
    }
    else {
    long long v21 = [(PKPaymentWebService *)self primaryBrokerURL];
    }
    __int16 v22 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v23 = [(PKPaymentSubmitActivationCodeRequest *)v17 _urlRequestWithServiceURL:v21 deviceIdentifier:v16 appleAccountInformation:v22];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __82__PKPaymentWebService_submitVerificationCode_verificationData_forPass_completion___block_invoke;
    v29[3] = &unk_1E56EE098;
    v29[4] = self;
    uint64_t v30 = v17;
    id v31 = v12;
    id v32 = v13;
    id v24 = v17;
    unint64_t v14 = v26;
    [(PKWebService *)self performRequest:v23 taskIdentifier:v26 cacheResponse:0 completionHandler:v29];

    id v11 = v27;
    id v10 = v28;
  }
  else
  {
    long long v20 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v20);
  }
  return v14;
}

void __82__PKPaymentWebService_submitVerificationCode_verificationData_forPass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v20 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) _resultForResponse:v7 error:v8 successHandler:&__block_literal_global_528];
  if (v9 == 1)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) pass];
    id v12 = [v10 verificationRecordForPass:v11];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = +[PKVerificationRequestRecord verificationRequestRecordForPass:*(void *)(a1 + 48)];
    }
    id v16 = v14;

    [v16 setVerificationStatus:3];
    [*(id *)(a1 + 32) updateVerificationRecord:v16];
    uint64_t v17 = *(void **)(a1 + 32);
    long long v18 = [*(id *)(a1 + 48) passTypeIdentifier];
    long long v19 = [*(id *)(a1 + 48) serialNumber];
    [v17 passWithPassTypeIdentifier:v18 serialNumber:v19 completion:*(void *)(a1 + 56)];

    AnalyticsSendEvent();
  }
  else
  {
    uint64_t v15 = v9;
    if (!v8)
    {
      id v8 = [*(id *)(a1 + 32) _errorWithResult:v9 response:v7 data:v20];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (!v15) {
      AnalyticsSendEvent();
    }
  }
}

uint64_t __82__PKPaymentWebService_submitVerificationCode_verificationData_forPass_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)verificationChannelsForPass:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[PKPaymentVerificationOptionsRequest requestWithPass:a3];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __62__PKPaymentWebService_verificationChannelsForPass_completion___block_invoke;
  v11[3] = &unk_1E56EE4F0;
  id v12 = v6;
  id v8 = v6;
  unint64_t v9 = [(PKPaymentWebService *)self verificationOptionsForRequest:v7 completion:v11];

  return v9;
}

void __62__PKPaymentWebService_verificationChannelsForPass_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = [a3 allChannels];
  (*(void (**)(uint64_t, uint64_t, id, id))(v6 + 16))(v6, a2, v8, v7);
}

- (unint64_t)requestVerificationCodeForPass:(id)a3 usingChannel:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(PKPaymentVerificationUpdateRequest);
  [(PKPaymentVerificationUpdateRequest *)v11 setPass:v10];

  [(PKPaymentVerificationUpdateRequest *)v11 setChannel:v9];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v11];
  unint64_t v12 = [(PKPaymentWebService *)self updateVerification:v11 completion:v8];

  return v12;
}

- (unint64_t)devicePassesSinceLastUpdatedTag:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v18 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v20 = [(PKWebService *)self nextTaskID];
  uint64_t v6 = [(PKPaymentWebService *)self context];
  long long v19 = [v6 deviceID];
  if (v19)
  {
    [v6 regions];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v21)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v9 = [obj objectForKeyedSubscript:v8];
          id v10 = objc_alloc_init(PKPaymentDevicePassesRequest);
          if (v18)
          {
            id v11 = [v9 lastUpdatedTag];
            [(PKPaymentDevicePassesRequest *)v10 setUpdatedSince:v11];
          }
          [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
          unint64_t v12 = [v9 brokerURL];
          id v13 = [(PKPaymentWebService *)self _appleAccountInformation];
          id v14 = [(PKPaymentDevicePassesRequest *)v10 _urlRequestWithServiceURL:v12 deviceIdentifier:v19 appleAccountInformation:v13];

          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke;
          v23[3] = &unk_1E56EE098;
          void v23[4] = self;
          id v24 = v6;
          uint64_t v25 = v8;
          id v26 = v5;
          [(PKWebService *)self performRequest:v14 taskIdentifier:v20 completionHandler:v23];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v21);
    }
  }
  else
  {
    uint64_t v15 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v15);
  }
  return v20;
}

void __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__54;
  id v37 = __Block_byref_object_dispose__54;
  id v38 = 0;
  id v10 = *(void **)(a1 + 32);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_2;
  v29[3] = &unk_1E56EE7C0;
  uint64_t v32 = &v33;
  id v11 = v7;
  id v30 = v11;
  id v12 = v8;
  id v31 = v12;
  uint64_t v13 = [v10 _resultForResponse:v12 error:v9 successHandler:v29];
  if (v13 == 1
    && ([(id)v34[5] passURLs],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 count],
        v14,
        v15))
  {
    id v16 = dispatch_queue_create("passDownloadQueue", 0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_3;
    v22[3] = &unk_1E56EE518;
    uint64_t v17 = *(void **)(a1 + 40);
    void v22[4] = *(void *)(a1 + 32);
    long long v27 = &v33;
    id v18 = v17;
    uint64_t v19 = *(void *)(a1 + 48);
    unint64_t v20 = *(void **)(a1 + 56);
    id v23 = v18;
    uint64_t v24 = v19;
    id v26 = v20;
    uint64_t v28 = 1;
    id v9 = v9;
    id v25 = v9;
    uint64_t v21 = v22;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E56D8360;
    id v40 = v21;
    dispatch_async(v16, block);
  }
  else
  {
    if (!v9)
    {
      id v9 = [*(id *)(a1 + 32) _errorWithResult:v13 data:v11];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

  _Block_object_dispose(&v33, 8);
}

BOOL __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:a1[4]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return a1[5] != 0;
}

void __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) passURLs];
  id v4 = [v2 _downloadPassesWithURLs:v3];

  uint64_t v5 = [v4 count];
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) passURLs];
  uint64_t v7 = [v6 count];

  if (v5 == v7)
  {
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) lastUpdatedTag];
    id v9 = v8;
    if (v8)
    {
      id v10 = *(void **)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_4;
      v12[3] = &unk_1E56EE200;
      id v13 = v8;
      [v10 atomicallyUpdateRegionWithIdentifier:v11 updateBlock:v12];
      [*(id *)(a1 + 32) _archiveContext];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 regionBySettingLastUpdatedTag:*(void *)(a1 + 32)];
}

- (unint64_t)passesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 primaryRegion];

  uint64_t v11 = [v10 brokerURL];
  id v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v13 = [v7 _urlRequestWithServiceURL:v11 appleAccountInformation:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__PKPaymentWebService_passesWithRequest_completion___block_invoke;
  v16[3] = &unk_1E56E0EC8;
  void v16[4] = self;
  id v17 = v6;
  id v14 = v6;
  [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];

  return v8;
}

void __52__PKPaymentWebService_passesWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__54;
  uint64_t v32 = __Block_byref_object_dispose__54;
  id v33 = 0;
  id v10 = *(void **)(a1 + 32);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__PKPaymentWebService_passesWithRequest_completion___block_invoke_2;
  v24[3] = &unk_1E56EE7C0;
  long long v27 = &v28;
  id v11 = v7;
  id v25 = v11;
  id v12 = v8;
  id v26 = v12;
  uint64_t v13 = [v10 _resultForResponse:v12 error:v9 successHandler:v24];
  if (v13 == 1
    && ([(id)v29[5] passURLs],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 count],
        v14,
        v15))
  {
    id v16 = dispatch_queue_create("passDownloadQueue", 0);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__PKPaymentWebService_passesWithRequest_completion___block_invoke_3;
    v19[3] = &unk_1E56EE540;
    id v17 = *(void **)(a1 + 40);
    void v19[4] = *(void *)(a1 + 32);
    __int16 v22 = &v28;
    id v21 = v17;
    uint64_t v23 = 1;
    id v9 = v9;
    id v20 = v9;
    id v18 = v19;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E56D8360;
    id v35 = v18;
    dispatch_async(v16, block);
  }
  else
  {
    if (!v9)
    {
      id v9 = [*(id *)(a1 + 32) _errorWithResult:v13 data:v11];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  _Block_object_dispose(&v28, 8);
}

BOOL __52__PKPaymentWebService_passesWithRequest_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:a1[4]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return a1[5] != 0;
}

void __52__PKPaymentWebService_passesWithRequest_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = [*(id *)(*(void *)(a1[7] + 8) + 40) passURLs];
  id v4 = [v2 _downloadPassesWithURLs:v3];

  (*(void (**)(void))(a1[6] + 16))();
}

- (unint64_t)notifyIssuerAppletStateDirtyWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 primaryRegion];

  id v11 = [(PKPaymentWebService *)self context];
  id v12 = [v11 deviceID];

  if (v12)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    uint64_t v13 = [v10 brokerURL];
    id v14 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v15 = [v6 _urlRequestWithServiceURL:v13 deviceIdentifier:v12 appleAccountInformation:v14];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__PKPaymentWebService_notifyIssuerAppletStateDirtyWithRequest_completion___block_invoke;
    v17[3] = &unk_1E56DF250;
    id v18 = v7;
    [(PKWebService *)self performRequest:v15 taskIdentifier:v8 retries:3 authHandling:1 completionHandler:v17];
  }
  return v8;
}

uint64_t __74__PKPaymentWebService_notifyIssuerAppletStateDirtyWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 statusCode];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (unint64_t)performNotificationActionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    id v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__PKPaymentWebService_performNotificationActionRequest_completion___block_invoke;
    v16[3] = &unk_1E56E0EC8;
    void v16[4] = self;
    id v17 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];
  }
  else
  {
    id v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
  }
  return v8;
}

void __67__PKPaymentWebService_performNotificationActionRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__54;
  uint64_t v23 = __Block_byref_object_dispose__54;
  id v24 = 0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __67__PKPaymentWebService_performNotificationActionRequest_completion___block_invoke_2;
  id v16 = &unk_1E56DCAF0;
  id v18 = &v19;
  id v11 = v7;
  id v17 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v13];
  if (v12 == 1)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, v20[5], 0);
  }
  else
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  _Block_object_dispose(&v19, 8);
}

BOOL __67__PKPaymentWebService_performNotificationActionRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [[PKPaymentNotificationActionResponse alloc] initWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)backgroundDownloadPassesSinceLastUpdatedTag:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(PKPaymentWebService *)self context];
  id v6 = [v5 regions];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(PKPaymentWebService *)self backgroundDownloadPassesForPushTopic:*(void *)(*((void *)&v11 + 1) + 8 * v10++) sinceLastUpdatedTag:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)backgroundDownloadPassesForPushTopic:(id)a3 sinceLastUpdatedTag:(BOOL)a4
{
  id v6 = a3;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PKPaymentWebService_backgroundDownloadPassesForPushTopic_sinceLastUpdatedTag___block_invoke;
  v10[3] = &unk_1E56DD128;
  void v10[4] = self;
  id v11 = v6;
  BOOL v12 = a4;
  uint64_t v8 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E56D8360;
  id v14 = v8;
  id v9 = v6;
  dispatch_async(backgroundDownloadQueue, block);
}

void __80__PKPaymentWebService_backgroundDownloadPassesForPushTopic_sinceLastUpdatedTag___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) context];
  BOOL v3 = [v2 deviceID];
  if (v3)
  {
    id v4 = [v2 regionForIdentifier:*(void *)(a1 + 40)];
    uint64_t v5 = objc_alloc_init(PKPaymentDevicePassesRequest);
    if (*(unsigned char *)(a1 + 48))
    {
      id v6 = [v4 lastUpdatedTag];
      [(PKPaymentDevicePassesRequest *)v5 setUpdatedSince:v6];
    }
    [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:v5];
    uint64_t v7 = [v4 brokerURL];
    uint64_t v8 = [*(id *)(a1 + 32) _appleAccountInformation];
    id v9 = [(PKPaymentDevicePassesRequest *)v5 _urlRequestWithServiceURL:v7 deviceIdentifier:v3 appleAccountInformation:v8];
    uint64_t v10 = (void *)[v9 mutableCopy];

    [MEMORY[0x1E4F18DA0] setProperty:*(void *)(a1 + 40) forKey:@"regionPushTopic" inRequest:v10];
    id v11 = (void *)MEMORY[0x1E4F18DA0];
    BOOL v12 = [MEMORY[0x1E4F1C9C8] date];
    [v11 setProperty:v12 forKey:@"requestDate" inRequest:v10];

    long long v13 = [*(id *)(*(void *)(a1 + 32) + 120) downloadTaskWithRequest:v10];
    id v14 = +[PKPaymentBackgroundDownloadRecord taskWithType:1];
    uint64_t v15 = [*(id *)(a1 + 32) backgroundContext];
    objc_msgSend(v15, "addBackgroundDownloadRecord:forTaskIdentifier:", v14, objc_msgSend(v13, "taskIdentifier"));

    uint64_t v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      uint64_t v18 = [v13 taskIdentifier];
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu:", (uint8_t *)&v17, 0xCu);
    }

    [*(id *)(a1 + 32) logRequest:v10];
    [v13 resume];
    [*(id *)(a1 + 32) _archiveBackgroundContext];
  }
}

- (void)getHasBackgroundDownloadTaskPassesForPushTopic:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(backgroundDownloadQueue, block);
}

void __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 120);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke_2;
  v4[3] = &unk_1E56EE568;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 getTasksWithCompletionHandler:v4];
}

void __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 176);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke_3;
  v9[3] = &unk_1E56D8BA8;
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v24 = v1;
  uint64_t v25 = [v2 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v25)
  {

LABEL_24:
    (*(void (**)(void))(*(void *)(v24 + 56) + 16))();
    return;
  }
  uint64_t v3 = *(void *)v27;
  __int16 v22 = 0;
  uint64_t v23 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v27 != v3) {
        objc_enumerationMutation(v2);
      }
      id v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      uint64_t v6 = objc_msgSend(v5, "taskIdentifier", v22);
      id v7 = [*(id *)(v1 + 40) backgroundContext];
      id v8 = [v7 backgroundDownloadRecordForTaskIdentifier:v6];

      if ([v8 taskType] == 1)
      {
        id v9 = v2;
        id v10 = (void *)MEMORY[0x1E4F18DA0];
        uint64_t v11 = [v5 originalRequest];
        id v12 = [v10 propertyForKey:@"regionPushTopic" inRequest:v11];

        if ([v12 isEqualToString:*(void *)(v1 + 48)])
        {
          id v13 = (void *)MEMORY[0x1E4F18DA0];
          id v14 = [v5 originalRequest];
          uint64_t v15 = [v13 propertyForKey:@"requestDate" inRequest:v14];
          uint64_t v16 = v15;
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
          }
          uint64_t v18 = v17;

          if (!v22 || [v22 compare:v18] == -1)
          {
            id v19 = v18;

            __int16 v22 = v19;
          }
          id v2 = v9;
        }
        else
        {
          id v2 = v9;
        }
        uint64_t v3 = v23;
        uint64_t v1 = v24;
      }
    }
    uint64_t v25 = [v2 countByEnumeratingWithState:&v26 objects:v34 count:16];
  }
  while (v25);

  if (!v22) {
    goto LABEL_24;
  }
  id v20 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(v24 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = v21;
    __int16 v32 = 2112;
    id v33 = v22;
    _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Found existing background download passes request with push topic: %@; request date: %@",
      buf,
      0x16u);
  }

  (*(void (**)(void))(*(void *)(v24 + 56) + 16))();
}

- (unint64_t)passAtURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__PKPaymentWebService_passAtURL_completion___block_invoke;
  v10[3] = &unk_1E56EE590;
  id v11 = v6;
  id v7 = v6;
  unint64_t v8 = [(PKPaymentWebService *)self _downloadPassAtURL:a3 completion:v10];

  return v8;
}

uint64_t __44__PKPaymentWebService_passAtURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)backgroundDownloadPassAtURL:(id)a3
{
  id v4 = a3;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PKPaymentWebService_backgroundDownloadPassAtURL___block_invoke;
  v8[3] = &unk_1E56D8A90;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(backgroundDownloadQueue, block);
}

void __51__PKPaymentWebService_backgroundDownloadPassAtURL___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(PKPaymentWebServiceRequest);
  [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:v2];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) _appleAccountInformation];
  id v5 = [(PKWebServiceRequest *)v2 _murlRequestWithURL:v3 appleAccountInformation:v4];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 120) downloadTaskWithRequest:v5];
  id v7 = +[PKPaymentBackgroundDownloadRecord taskWithType:2];
  unint64_t v8 = [*(id *)(a1 + 32) backgroundContext];
  objc_msgSend(v8, "addBackgroundDownloadRecord:forTaskIdentifier:", v7, objc_msgSend(v6, "taskIdentifier"));

  id v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 taskIdentifier];
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 134218242;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu for %@:", (uint8_t *)&v12, 0x16u);
  }

  [*(id *)(a1 + 32) logRequest:v5];
  [v6 resume];
  [*(id *)(a1 + 32) _archiveBackgroundContext];
}

- (void)backgroundDownloadRemotePassAssets:(id)a3
{
}

- (void)backgroundDownloadRemotePassAssets:(id)a3 cloudStoreCoordinatorDelegate:(id)a4
{
}

- (void)backgroundDownloadRemotePassAssets:(id)a3 forSuffixesAndScreenScales:(id)a4
{
}

- (void)backgroundDownloadRemotePassAssets:(id)a3 forSuffixesAndScreenScales:(id)a4 cloudStoreCoordinatorDelegate:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v24 = &stru_1EE0F5368;
    uint64_t v11 = [NSNumber numberWithDouble:PKScreenScale()];
    v25[0] = v11;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  }
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke;
  v17[3] = &unk_1E56DB988;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  id v21 = v10;
  uint64_t v13 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E56D8360;
  id v23 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(backgroundDownloadQueue, block);
}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) organizationName];
    id v4 = [*(id *)(a1 + 32) serialNumber];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Downloading Remote Pass Assets for %@:%@", buf, 0x16u);
  }
  id v5 = [*(id *)(a1 + 40) _movePassToDownloadCache:*(void *)(a1 + 32)];
  id v31 = v5;
  if (v5)
  {
    id v6 = [v5 dataAccessor];
    id v7 = [*(id *)(*(void *)(a1 + 40) + 256) secureElementIdentifiers];
    uint64_t v35 = [v6 remoteAssetManagerForSEIDs:v7];

    uint64_t v30 = [v35 remoteAssetManifests];
    if ([v30 count])
    {
      id v33 = +[PKPaymentBackgroundDownloadRecord taskWithType:3];
      id v8 = [v31 dataAccessor];
      id v9 = [v8 fileURL];
      [v33 setPassURL:v9];

      uint64_t v55 = 0;
      long long v56 = &v55;
      uint64_t v57 = 0x2020000000;
      char v58 = 1;
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v10 = v30;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v52 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            id v15 = *(void **)(a1 + 48);
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_558;
            v44[3] = &unk_1E56EE5B8;
            void v44[4] = v14;
            id v45 = v32;
            id v16 = v35;
            id v50 = &v55;
            uint64_t v17 = *(void *)(a1 + 40);
            id v46 = v16;
            uint64_t v47 = v17;
            id v48 = v33;
            id v49 = *(id *)(a1 + 56);
            [v15 enumerateKeysAndObjectsUsingBlock:v44];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v59 count:16];
        }
        while (v11);
      }

      if (*((unsigned char *)v56 + 24))
      {
        id v18 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v31 organizationName];
          id v20 = [*(id *)(a1 + 32) serialNumber];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v20;
          _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "No background download tasks -- delivering pass immediately: %@:%@", buf, 0x16u);
        }
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 248));
        __int16 v22 = dispatch_get_global_queue(21, 0);
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_563;
        v40[3] = &unk_1E56D8AB8;
        uint64_t v23 = *(void *)(a1 + 40);
        id v41 = WeakRetained;
        uint64_t v42 = v23;
        id v43 = v31;
        uint64_t v24 = v40;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __dispatch_async_ar_block_invoke_14;
        v61 = &unk_1E56D8360;
        id v62 = v24;
        id v25 = WeakRetained;
        dispatch_async(v22, buf);
      }
      [*(id *)(a1 + 40) _archiveBackgroundContext];

      _Block_object_dispose(&v55, 8);
    }
    else
    {
      id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 248));
      long long v27 = dispatch_get_global_queue(21, 0);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_565;
      v36[3] = &unk_1E56DB988;
      id v37 = v26;
      int8x16_t v34 = *(int8x16_t *)(a1 + 32);
      id v28 = (id)v34.i64[0];
      int8x16_t v38 = vextq_s8(v34, v34, 8uLL);
      id v39 = v31;
      long long v29 = v36;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __dispatch_async_ar_block_invoke_14;
      v61 = &unk_1E56D8360;
      id v62 = v29;
      id v33 = v26;
      dispatch_async(v27, buf);
    }
    id v5 = v31;
  }
}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_558(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (![v5 length])
  {

    id v5 = 0;
  }
  [v6 floatValue];
  id v8 = [*(id *)(a1 + 32) deviceSpecificAssetForScreenScale:v5 suffix:v7];
  id v9 = [v8 remoteURL];
  if (!v8)
  {
    id v10 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    uint64_t v11 = [*(id *)(a1 + 32) fileURL];
    uint64_t v12 = [v11 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    uint64_t v39 = (uint64_t)v12;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "**** ERROR **** : Could not find device specific asset for manifest: %@", buf, 0xCu);

LABEL_31:
    goto LABEL_32;
  }
  if (![*(id *)(a1 + 40) containsObject:v9])
  {
    id v10 = [v8 localURL];
    uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v14 = [v10 path];
    int v15 = [v13 fileExistsAtPath:v14];

    if (v15)
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v10];
      id v16 = [v12 SHA1Hash];
      uint64_t v17 = [v16 hexEncoding];

      id v18 = [v8 sha1Hex];
      int v19 = [v18 isEqualToString:v17];

      if (v19)
      {
        id v20 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v39 = (uint64_t)v9;
          _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Not downloading: %@ since the asset already exists in the pass directory", buf, 0xCu);
        }

        [*(id *)(a1 + 48) addRemoteAssetData:v12 shouldWriteData:0 forManifestItem:v8 error:0];
      }

      goto LABEL_31;
    }
    id v21 = [v8 sha1Hex];
    uint64_t v12 = PKCachedFileForSHA1(v21);

    if (v12)
    {
      __int16 v22 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        PKPassAssetDownloadCachePath();
        os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v8 sha1Hex];
        uint64_t v24 = [loga stringByAppendingPathComponent:v23];
        *(_DWORD *)buf = 138412546;
        uint64_t v39 = (uint64_t)v9;
        __int16 v40 = 2112;
        id v41 = v24;
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Using cached copy of %@ at %@", buf, 0x16u);
      }
      [*(id *)(a1 + 48) addRemoteAssetData:v12 forManifestItem:v8 error:0];
      goto LABEL_31;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    uint64_t v25 = [v8 itemType];
    if (v25 == 1)
    {
      id v27 = v8;
      id v26 = [v27 recordName];
      id v33 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v39 = (uint64_t)v26;
        _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, "Background downloading from the cloud store: \"%@\"", buf, 0xCu);
      }

      [*(id *)(a1 + 64) setRemoteCloudStoreAsset:v27 forRecordName:v26];
      int8x16_t v34 = [*(id *)(a1 + 56) backgroundContext];
      [v34 addBackgroundDownloadRecord:*(void *)(a1 + 64) forRecordName:v26];

      [*(id *)(a1 + 56) _backgroundDownloadCloudStoreAssetsforItem:v27 cloudStoreCoordinatorDelegate:*(void *)(a1 + 72)];
    }
    else
    {
      if (v25)
      {
LABEL_30:
        [*(id *)(a1 + 40) addObject:v9];
        uint64_t v12 = 0;
        goto LABEL_31;
      }
      log = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v39 = (uint64_t)v9;
        _os_log_impl(&dword_190E10000, log, OS_LOG_TYPE_DEFAULT, "Background downloading: %@", buf, 0xCu);
      }

      id v26 = [MEMORY[0x1E4F18DA8] requestWithURL:v9];
      id v27 = [*(id *)(*(void *)(a1 + 56) + 120) downloadTaskWithRequest:v26];
      id v28 = *(void **)(a1 + 64);
      long long v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "taskIdentifier"));
      [v28 setRemoteURLAsset:v8 forTaskIdentifier:v29];

      uint64_t v30 = [*(id *)(a1 + 56) backgroundContext];
      objc_msgSend(v30, "addBackgroundDownloadRecord:forTaskIdentifier:", *(void *)(a1 + 64), objc_msgSend(v27, "taskIdentifier"));

      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = [v27 taskIdentifier];
        id v31 = [v8 localURL];
        id v32 = [v31 lastPathComponent];
        *(_DWORD *)buf = 134218242;
        uint64_t v39 = v35;
        __int16 v40 = 2112;
        id v41 = v32;
        _os_log_impl(&dword_190E10000, log, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu for %@", buf, 0x16u);
      }
      [*(id *)(a1 + 56) logRequest:v26];
      [v27 resume];
    }

    goto LABEL_30;
  }
  id v10 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v39 = (uint64_t)v9;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Download already requested for %@", buf, 0xCu);
  }
LABEL_32:
}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_563(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = (void *)a1[6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_2;
  v4[3] = &unk_1E56D8AE0;
  id v5 = v3;
  [v1 paymentWebService:v2 didDownloadPassRemoteAssets:v5 completion:v4];
}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) dataAccessor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [*(id *)(a1 + 32) dataAccessor];
    id v5 = [v4 fileURL];

    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up download cache copy of pass: %@", (uint8_t *)&v8, 0xCu);
    }

    float v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v7 removeItemAtURL:v5 error:0];
  }
}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_565(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_2_566;
  v4[3] = &unk_1E56D8AE0;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 paymentWebService:v2 didDownloadPassRemoteAssets:v3 completion:v4];
}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_2_566(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) dataAccessor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [*(id *)(a1 + 32) dataAccessor];
    id v5 = [v4 fileURL];

    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up download cache copy of pass: %@", (uint8_t *)&v8, 0xCu);
    }

    float v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v7 removeItemAtURL:v5 error:0];
  }
}

- (unint64_t)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  uint64_t v12 = [(PKPaymentWebService *)self context];
  uint64_t v13 = [v12 regionForIdentifier:v8];

  if (v13) {
    [v13 brokerURL];
  }
  else {
  uint64_t v14 = [(PKPaymentWebService *)self primaryBrokerURL];
  }
  int v15 = [[PKPaymentPassRequest alloc] initWithPassTypeID:v8 serialNumber:v10];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v15];
  id v16 = [(PKPaymentWebService *)self _appleAccountInformation];
  uint64_t v17 = [(PKPaymentPassRequest *)v15 _urlRequestWithServiceURL:v14 appleAccountInformation:v16];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__PKPaymentWebService_passWithPassTypeIdentifier_serialNumber_completion___block_invoke;
  v20[3] = &unk_1E56E0EC8;
  v20[4] = self;
  id v21 = v9;
  id v18 = v9;
  [(PKWebService *)self performRequest:v17 taskIdentifier:v11 completionHandler:v20];

  return v11;
}

uint64_t __74__PKPaymentWebService_passWithPassTypeIdentifier_serialNumber_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _passWithData:a2 response:a3 error:a4 completion:*(void *)(a1 + 40)];
}

- (void)backgroundDownloadWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PKPaymentWebService_backgroundDownloadWithPassTypeIdentifier_serialNumber___block_invoke;
  v12[3] = &unk_1E56D8AB8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E56D8360;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(backgroundDownloadQueue, block);
}

void __77__PKPaymentWebService_backgroundDownloadWithPassTypeIdentifier_serialNumber___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = [v2 regionForIdentifier:*(void *)(a1 + 40)];

  if (v3) {
    [v3 brokerURL];
  }
  else {
  id v4 = [*(id *)(a1 + 32) primaryBrokerURL];
  }
  id v5 = [[PKPaymentPassRequest alloc] initWithPassTypeID:*(void *)(a1 + 40) serialNumber:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:v5];
  id v6 = [*(id *)(a1 + 32) _appleAccountInformation];
  id v7 = [(PKPaymentPassRequest *)v5 _urlRequestWithServiceURL:v4 appleAccountInformation:v6];

  [*(id *)(a1 + 32) logRequest:v7];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 120) downloadTaskWithRequest:v7];
  id v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 taskIdentifier];
    id v11 = [v7 URL];
    int v14 = 134218242;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu: %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v12 = +[PKPaymentBackgroundDownloadRecord taskWithType:2];
  id v13 = [*(id *)(a1 + 32) backgroundContext];
  objc_msgSend(v13, "addBackgroundDownloadRecord:forTaskIdentifier:", v12, objc_msgSend(v8, "taskIdentifier"));

  [*(id *)(a1 + 32) _archiveBackgroundContext];
  [v8 resume];
}

- (void)backgroundRegisterCredentialWithRequest:(id)a3
{
  id v4 = a3;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PKPaymentWebService_backgroundRegisterCredentialWithRequest___block_invoke;
  v8[3] = &unk_1E56D8A90;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(backgroundDownloadQueue, block);
}

void __63__PKPaymentWebService_backgroundRegisterCredentialWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = [v2 deviceID];

  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) primaryBrokerURL];
  id v6 = [*(id *)(a1 + 32) _appleAccountInformation];
  id v7 = [v4 _urlRequestWithServiceURL:v5 deviceIdentifier:v3 appleAccountInformation:v6];

  [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logRequest:v7];
  id v8 = [*(id *)(a1 + 40) credential];
  id v9 = [v8 identifier];

  uint64_t v10 = [[PKPaymentBackgroundRegisterCredentialRecord alloc] initWithCredentialIdentifier:v9];
  id v11 = [*(id *)(*(void *)(a1 + 32) + 120) dataTaskWithRequest:v7];
  uint64_t v12 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      int v15 = 134218242;
      uint64_t v16 = [v11 taskIdentifier];
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Creating background credential registration task (%lu) for credential: %@", (uint8_t *)&v15, 0x16u);
    }

    int v14 = [*(id *)(a1 + 32) backgroundContext];
    objc_msgSend(v14, "addBackgroundDownloadRecord:forTaskIdentifier:", v10, objc_msgSend(v11, "taskIdentifier"));

    [*(id *)(a1 + 32) _archiveBackgroundContext];
    [v11 resume];
  }
  else
  {
    if (v13)
    {
      int v15 = 138412290;
      uint64_t v16 = (uint64_t)v9;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create background credential registration task for credential: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (unint64_t)pushProvisioningSharingIdentifiersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 deviceID];

  unint64_t v10 = [(PKWebService *)self nextTaskID];
  id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  BOOL v13 = [v7 _urlRequestWithServiceURL:v11 deviceIdentifier:v9 appleAccountInformation:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__PKPaymentWebService_pushProvisioningSharingIdentifiersWithRequest_completion___block_invoke;
  v16[3] = &unk_1E56DF250;
  id v17 = v6;
  id v14 = v6;
  [(PKWebService *)self performRequest:v13 taskIdentifier:v10 completionHandler:v16];

  return v10;
}

void __80__PKPaymentWebService_pushProvisioningSharingIdentifiersWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = [[PKPaymentPushProvisioningSharingIdentifiersResponse alloc] initWithData:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)pushProvisioningSharingStatusRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 deviceID];

  unint64_t v10 = [(PKWebService *)self nextTaskID];
  id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  BOOL v13 = [v7 _urlRequestWithServiceURL:v11 deviceIdentifier:v9 appleAccountInformation:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__PKPaymentWebService_pushProvisioningSharingStatusRequest_completion___block_invoke;
  v16[3] = &unk_1E56DF250;
  id v17 = v6;
  id v14 = v6;
  [(PKWebService *)self performRequest:v13 taskIdentifier:v10 completionHandler:v16];

  return v10;
}

void __71__PKPaymentWebService_pushProvisioningSharingStatusRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = [[PKPaymentPushProvisioningSharingStatusResponse alloc] initWithData:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)provideEncryptedPushProvisioningTargetWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 deviceID];

  unint64_t v10 = [(PKWebService *)self nextTaskID];
  id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  BOOL v13 = [v7 _urlRequestWithServiceURL:v11 deviceIdentifier:v9 appleAccountInformation:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PKPaymentWebService_provideEncryptedPushProvisioningTargetWithRequest_completion___block_invoke;
  v16[3] = &unk_1E56DF250;
  id v17 = v6;
  id v14 = v6;
  [(PKWebService *)self performRequest:v13 taskIdentifier:v10 completionHandler:v16];

  return v10;
}

uint64_t __84__PKPaymentWebService_provideEncryptedPushProvisioningTargetWithRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)contactInformationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 deviceID];

  unint64_t v10 = [(PKWebService *)self nextTaskID];
  id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  BOOL v13 = [v7 _urlRequestWithServiceURL:v11 deviceIdentifier:v9 appleAccountInformation:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__PKPaymentWebService_contactInformationWithRequest_completion___block_invoke;
  v16[3] = &unk_1E56E0EC8;
  void v16[4] = self;
  id v17 = v6;
  id v14 = v6;
  [(PKWebService *)self performRequest:v13 taskIdentifier:v10 completionHandler:v16];

  return v10;
}

void __64__PKPaymentWebService_contactInformationWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__54;
  id v26 = __Block_byref_object_dispose__54;
  id v27 = 0;
  unint64_t v10 = *(void **)(a1 + 32);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __64__PKPaymentWebService_contactInformationWithRequest_completion___block_invoke_2;
  uint64_t v19 = &unk_1E56DCAF0;
  id v21 = &v22;
  id v11 = v7;
  id v20 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v16];
  if (!v9)
  {
    uint64_t v13 = v12;
    if (v12 != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v16, v17, v18, v19);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14)
  {
    int v15 = objc_msgSend((id)v23[5], "contactInformation", v13);
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v9);
  }
  _Block_object_dispose(&v22, 8);
}

BOOL __64__PKPaymentWebService_contactInformationWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [[PKContactInformationResponse alloc] initWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)availableProductsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  unint64_t v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v11 = PKProductsURL();
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(PKPaymentWebService *)self primaryBrokerURL];
    }
    int v15 = v13;

    uint64_t v16 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v17 = [v6 _urlRequestWithServiceURL:v15 deviceIdentifier:v10 appleAccountInformation:v16];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__PKPaymentWebService_availableProductsWithRequest_completion___block_invoke;
    v19[3] = &unk_1E56E0EC8;
    void v19[4] = self;
    id v20 = v7;
    [(PKWebService *)self performRequest:v17 taskIdentifier:v8 completionHandler:v19];
  }
  else if (v7)
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
  }
  return v8;
}

void __63__PKPaymentWebService_availableProductsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__54;
  id v28 = __Block_byref_object_dispose__54;
  id v29 = 0;
  unint64_t v10 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__PKPaymentWebService_availableProductsWithRequest_completion___block_invoke_2;
  v20[3] = &unk_1E56EE7C0;
  id v11 = v8;
  id v21 = v11;
  uint64_t v23 = &v24;
  id v12 = v7;
  id v22 = v12;
  uint64_t v13 = [v10 _resultForResponse:v11 error:v9 successHandler:v20];
  uint64_t v14 = PKGetPaymentSetupProductState();
  uint64_t v15 = PKPaymentSetupProductStateFromString(v14);

  if (!v15 || v13)
  {
    if (!v9 && v13 != 1)
    {
      id v9 = [*(id *)(a1 + 32) _errorWithResult:v13 data:v12];
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:&unk_1EE22DF50 options:0 error:0];
    uint64_t v17 = +[PKWebServiceResponse responseWithData:v16];
    uint64_t v18 = (void *)v25[5];
    void v25[5] = v17;

    uint64_t v13 = 1;
  }
  uint64_t v19 = *(void *)(a1 + 40);
  if (v19) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v19 + 16))(v19, v13, v25[5], v9);
  }

  _Block_object_dispose(&v24, 8);
}

BOOL __63__PKPaymentWebService_availableProductsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [*(id *)(a1 + 32) allHeaderFields];
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 40) headers:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  BOOL v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v6;
}

- (unint64_t)availableCommonProductsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v9 = [v7 _urlRequest];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKPaymentWebService_availableCommonProductsWithRequest_completion___block_invoke;
  v12[3] = &unk_1E56E0EC8;
  void v12[4] = self;
  id v13 = v6;
  id v10 = v6;
  [(PKWebService *)self performRequest:v9 taskIdentifier:v8 completionHandler:v12];

  return v8;
}

void __69__PKPaymentWebService_availableCommonProductsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__54;
  uint64_t v24 = __Block_byref_object_dispose__54;
  id v25 = 0;
  id v10 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__PKPaymentWebService_availableCommonProductsWithRequest_completion___block_invoke_2;
  v16[3] = &unk_1E56EE7C0;
  id v11 = v8;
  id v17 = v11;
  uint64_t v19 = &v20;
  id v12 = v7;
  id v18 = v12;
  uint64_t v13 = [v10 _resultForResponse:v11 error:v9 successHandler:v16];
  uint64_t v14 = v13;
  if (!v9 && v13 != 1)
  {
    id v9 = [*(id *)(a1 + 32) _errorWithResult:v13 response:v11 data:v12];
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v15 + 16))(v15, v14, v21[5], v9);
  }

  _Block_object_dispose(&v20, 8);
}

BOOL __69__PKPaymentWebService_availableCommonProductsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [*(id *)(a1 + 32) allHeaderFields];
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 40) headers:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  BOOL v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v6;
}

- (unint64_t)performProductActionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v11 = PKProductsURL();
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(PKPaymentWebService *)self primaryBrokerURL];
    }
    uint64_t v15 = v13;

    uint64_t v16 = [(PKPaymentWebService *)self _appleAccountInformation];
    id v17 = [v6 _urlRequestWithServiceURL:v15 deviceIdentifier:v10 appleAccountInformation:v16];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__PKPaymentWebService_performProductActionRequest_completion___block_invoke;
    v19[3] = &unk_1E56E0EC8;
    void v19[4] = self;
    id v20 = v7;
    [(PKWebService *)self performRequest:v17 taskIdentifier:v8 completionHandler:v19];
  }
  else if (v7)
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
  }
  return v8;
}

void __62__PKPaymentWebService_performProductActionRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__54;
  id v29 = __Block_byref_object_dispose__54;
  id v30 = 0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __62__PKPaymentWebService_performProductActionRequest_completion___block_invoke_2;
  uint64_t v22 = &unk_1E56DCAF0;
  uint64_t v24 = &v25;
  id v11 = v7;
  id v23 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v19];
  id v13 = PKGetPaymentSetupProductState();
  uint64_t v14 = PKPaymentSetupProductStateFromString(v13);

  if (!v14 || v12)
  {
    if (!v9 && v12 != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v19, v20, v21, v22);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28D90], "dataWithJSONObject:options:error:", &unk_1EE22DF78, 0, 0, v19, v20, v21, v22);
    uint64_t v16 = +[PKWebServiceResponse responseWithData:v15];
    id v17 = (void *)v26[5];
    v26[5] = v16;

    uint64_t v12 = 1;
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v18 + 16))(v18, v12, v26[5], v9);
  }

  _Block_object_dispose(&v25, 8);
}

BOOL __62__PKPaymentWebService_performProductActionRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)browseableBankAppsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    id v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__PKPaymentWebService_browseableBankAppsWithRequest_completion___block_invoke;
    v16[3] = &unk_1E56E0EC8;
    void v16[4] = self;
    id v17 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];
  }
  else if (v7)
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
  }
  return v8;
}

void __64__PKPaymentWebService_browseableBankAppsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__54;
  uint64_t v26 = __Block_byref_object_dispose__54;
  id v27 = 0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __64__PKPaymentWebService_browseableBankAppsWithRequest_completion___block_invoke_2;
  uint64_t v19 = &unk_1E56DCAF0;
  id v21 = &v22;
  id v11 = v7;
  id v20 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v16];
  uint64_t v13 = v12;
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v16, v17, v18, v19);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v9;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error retreiving partner banks: %@", buf, 0xCu);
    }
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v15 + 16))(v15, v13, v23[5], v9);
  }

  _Block_object_dispose(&v22, 8);
}

BOOL __64__PKPaymentWebService_browseableBankAppsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)provisioningMethodWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__PKPaymentWebService_provisioningMethodWithRequest_completion___block_invoke;
    v16[3] = &unk_1E56E0EC8;
    void v16[4] = self;
    id v17 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];
  }
  else if (v7)
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
  }
  return v8;
}

void __64__PKPaymentWebService_provisioningMethodWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__54;
  uint64_t v25 = __Block_byref_object_dispose__54;
  id v26 = 0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __64__PKPaymentWebService_provisioningMethodWithRequest_completion___block_invoke_2;
  uint64_t v18 = &unk_1E56DCAF0;
  id v20 = &v21;
  id v11 = v7;
  id v19 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v15];
  uint64_t v13 = v12;
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v15, v16, v17, v18);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v14 + 16))(v14, v13, v22[5], v9);
  }

  _Block_object_dispose(&v21, 8);
}

BOOL __64__PKPaymentWebService_provisioningMethodWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)passUpgradeWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  if (v10)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
    uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [v6 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__PKPaymentWebService_passUpgradeWithRequest_completion___block_invoke;
    v16[3] = &unk_1E56E0EC8;
    void v16[4] = self;
    id v17 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];
  }
  else if (v7)
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v14, 0);
  }
  return v8;
}

void __57__PKPaymentWebService_passUpgradeWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__54;
  uint64_t v25 = __Block_byref_object_dispose__54;
  id v26 = 0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __57__PKPaymentWebService_passUpgradeWithRequest_completion___block_invoke_2;
  uint64_t v18 = &unk_1E56DCAF0;
  id v20 = &v21;
  id v11 = v7;
  id v19 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v15];
  if (v12 != 1)
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v15, v16, v17, v18);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Pass update request action failed with error %@", buf, 0xCu);
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id, uint64_t))(v14 + 16))(v14, v9, v22[5]);
  }

  _Block_object_dispose(&v21, 8);
}

BOOL __57__PKPaymentWebService_passUpgradeWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)paymentProvisioningNonceOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(PKWebService *)self nextTaskID];
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 deviceID];

  if (v9)
  {
    id v10 = [(PKPaymentWebService *)self primaryBrokerURL];
    id v11 = [[PKPaymentProvisioningNonceRequest alloc] initWithNonceType:a3];
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v11];
    uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v13 = [(PKPaymentProvisioningNonceRequest *)v11 _urlRequestWithServiceURL:v10 deviceIdentifier:v9 appleAccountInformation:v12];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__PKPaymentWebService_paymentProvisioningNonceOfType_completion___block_invoke;
    v16[3] = &unk_1E56E0EC8;
    void v16[4] = self;
    id v17 = v6;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v7 completionHandler:v16];
  }
  else
  {
    uint64_t v14 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v14);
  }
  return v7;
}

void __65__PKPaymentWebService_paymentProvisioningNonceOfType_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__54;
  void v19[4] = __Block_byref_object_dispose__54;
  id v20 = 0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __65__PKPaymentWebService_paymentProvisioningNonceOfType_completion___block_invoke_2;
  uint64_t v16 = &unk_1E56DCAF0;
  uint64_t v18 = v19;
  id v11 = v7;
  id v17 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v13];
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  _Block_object_dispose(v19, 8);
}

BOOL __65__PKPaymentWebService_paymentProvisioningNonceOfType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)passActionWithRemoteContentPassAction:(id)a3 forPass:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 remoteContentConfiguration];
  int v12 = [v11 requiresAppletData];

  if (v12) {
    unint64_t v13 = [(PKPaymentWebService *)self _passActionIncludingAppletDataWithRemoteContentPassAction:v10 pass:v9 completion:v8];
  }
  else {
    unint64_t v13 = [(PKPaymentWebService *)self _passActionWithRemoteContentPassAction:v10 pass:v9 completion:v8];
  }
  unint64_t v14 = v13;

  return v14;
}

- (unint64_t)_passActionIncludingAppletDataWithRemoteContentPassAction:(id)a3 pass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  int v12 = [(PKPaymentWebService *)self context];
  unint64_t v13 = [v12 deviceID];

  if (v13)
  {
    targetDevice = self->_targetDevice;
    uint64_t v15 = [v9 secureElementPass];
    uint64_t v16 = [v8 remoteContentConfiguration];
    uint64_t v17 = [v16 appletDataRequiresEncryption];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__PKPaymentWebService__passActionIncludingAppletDataWithRemoteContentPassAction_pass_completion___block_invoke;
    v21[3] = &unk_1E56EE5E0;
    id v24 = v10;
    void v21[4] = self;
    id v22 = v8;
    id v23 = v9;
    [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice serviceProviderDataForSecureElementPass:v15 encrypted:v17 completion:v21];

    uint64_t v18 = v24;
  }
  else
  {
    id v19 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "No device identifier present - exiting early", buf, 2u);
    }

    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
  }

  return v11;
}

void __97__PKPaymentWebService__passActionIncludingAppletDataWithRemoteContentPassAction_pass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _passActionWithRemoteContentPassAction:*(void *)(a1 + 40) serviceProviderData:v5 pass:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 localizedDescription];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Received nil service provider data with error %@", (uint8_t *)&v9, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (unint64_t)passActionWithRemoteContentPassAction:(id)a3 forDeviceIdentifier:(id)a4 passTypeIdentifier:(id)a5 passSerialNumber:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = [(PKWebService *)self nextTaskID];
  if (v13)
  {
    uint64_t v18 = objc_alloc_init(PKPaymentRemoteContentPassActionRequest);
    [(PKPaymentRemoteContentPassActionRequest *)v18 setAction:v12];
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v18];
    id v19 = [(PKPaymentWebService *)self primaryBrokerURL];
    [(PKPaymentWebService *)self _appleAccountInformation];
    id v20 = v12;
    id v22 = v21 = v17;
    [(PKPaymentRemoteContentPassActionRequest *)v18 _urlRequestWithServiceURL:v19 deviceIdentifier:v13 passTypeIdentifier:v14 passSerialNumber:v15 appleAccountInformation:v22];
    id v23 = v26 = v14;

    unint64_t v17 = v21;
    id v12 = v20;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __128__PKPaymentWebService_passActionWithRemoteContentPassAction_forDeviceIdentifier_passTypeIdentifier_passSerialNumber_completion___block_invoke;
    v28[3] = &unk_1E56E0EC8;
    id v29 = v20;
    id v30 = v16;
    [(PKWebService *)self performRequest:v23 taskIdentifier:v17 completionHandler:v28];

    id v14 = v26;
  }
  else
  {
    id v24 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action, deviceID is nil", buf, 2u);
    }

    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
  }

  return v17;
}

void __128__PKPaymentWebService_passActionWithRemoteContentPassAction_forDeviceIdentifier_passTypeIdentifier_passSerialNumber_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    id v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action failed with error %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [[PKPaymentRemoteContentPassActionResponse alloc] initWithExistingAction:*(void *)(a1 + 32) pass:0 data:v7];
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    id v14 = [(PKPaymentRemoteContentPassActionResponse *)v11 updatedAction];
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v10);
  }
}

- (unint64_t)_passActionWithRemoteContentPassAction:(id)a3 pass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  id v12 = [(PKPaymentWebService *)self context];
  uint64_t v13 = [v12 deviceID];

  uint64_t v14 = [v9 passTypeIdentifier];
  int v15 = [v9 serialNumber];
  if (v13)
  {
    id v27 = v15;
    id v16 = objc_alloc_init(PKPaymentRemoteContentPassActionRequest);
    [(PKPaymentRemoteContentPassActionRequest *)v16 setAction:v8];
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v16];
    uint64_t v17 = [(PKPaymentWebService *)self primaryBrokerURL];
    [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v18 = v10;
    unint64_t v19 = v11;
    v21 = id v20 = v8;
    [(PKPaymentRemoteContentPassActionRequest *)v16 _urlRequestWithServiceURL:v17 deviceIdentifier:v13 passTypeIdentifier:v14 passSerialNumber:v27 appleAccountInformation:v21];
    v22 = id v26 = (void *)v14;

    id v8 = v20;
    unint64_t v11 = v19;
    id v10 = v18;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __78__PKPaymentWebService__passActionWithRemoteContentPassAction_pass_completion___block_invoke;
    v29[3] = &unk_1E56E50E8;
    id v30 = v8;
    id v31 = v9;
    id v32 = v18;
    [(PKWebService *)self performRequest:v22 taskIdentifier:v11 completionHandler:v29];

    id v23 = v26;
    int v15 = v27;
  }
  else
  {
    id v23 = (void *)v14;
    id v24 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action, deviceID is nil", buf, 2u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }

  return v11;
}

void __78__PKPaymentWebService__passActionWithRemoteContentPassAction_pass_completion___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    id v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action failed with error %@", (uint8_t *)&v15, 0xCu);
    }

    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = [[PKPaymentRemoteContentPassActionResponse alloc] initWithExistingAction:a1[4] pass:a1[5] data:v7];
  }
  uint64_t v13 = a1[6];
  if (v13)
  {
    uint64_t v14 = [(PKPaymentRemoteContentPassActionResponse *)v11 updatedAction];
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v10);
  }
}

- (unint64_t)passActionWithRemoteContentPassAction:(id)a3 serviceProviderData:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  uint64_t v14 = [v13 remoteContentConfiguration];
  int v15 = [v14 requiresAppletData];

  if (v15) {
    unint64_t v16 = [(PKPaymentWebService *)self _passActionWithRemoteContentPassAction:v13 serviceProviderData:v10 pass:v12 completion:v11];
  }
  else {
    unint64_t v16 = [(PKPaymentWebService *)self _passActionWithRemoteContentPassAction:v13 pass:v12 completion:v11];
  }
  unint64_t v17 = v16;

  return v17;
}

- (unint64_t)_passActionWithRemoteContentPassAction:(id)a3 serviceProviderData:(id)a4 pass:(id)a5 completion:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = [(PKWebService *)self nextTaskID];
  if (v11)
  {
    [v10 setAppletData:v11];
    [(PKPaymentWebService *)self _passActionWithRemoteContentPassAction:v10 pass:v12 completion:v13];
    int v15 = v13;
  }
  else
  {
    unint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Error: Found nil encrypted service provider data.";
    unint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    int v15 = [v16 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v17];

    uint64_t v18 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v19 = [v15 localizedDescription];
      int v21 = 138412290;
      id v22 = v19;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Found nil service provider data; returning error: %@",
        (uint8_t *)&v21,
        0xCu);
    }
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v15);
  }
  return v14;
}

- (unint64_t)passActionGroupWithRemoteContentPassActionGroup:(id)a3 forPass:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKPaymentWebService *)self context];
  id v12 = [v11 deviceID];

  id v13 = [v10 remoteContentConfiguration];
  int v14 = [v13 requiresAppletData];

  if (v14) {
    unint64_t v15 = [(PKPaymentWebService *)self _passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup:v10 forPass:v9 forDeviceIdentifier:v12 completion:v8];
  }
  else {
    unint64_t v15 = [(PKPaymentWebService *)self _passActionGroupWithRemoteContentPassActionGroup:v10 forPass:v9 forDeviceIdentifier:v12 completion:v8];
  }
  unint64_t v16 = v15;

  return v16;
}

- (unint64_t)_passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup:(id)a3 forPass:(id)a4 forDeviceIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  unint64_t v14 = [(PKWebService *)self nextTaskID];
  unint64_t v15 = [v11 passTypeIdentifier];
  unint64_t v16 = [v11 serialNumber];
  if (!v12)
  {
    unint64_t v17 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "No device identifier present - exiting early", buf, 2u);
    }

    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    v13[2](v13, 0, v18);
  }
  targetDevice = self->_targetDevice;
  [v11 secureElementPass];
  unint64_t v19 = v32 = v14;
  id v20 = [v10 remoteContentConfiguration];
  uint64_t v21 = [v20 appletDataRequiresEncryption];
  id v22 = self;
  uint64_t v23 = v21;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __130__PKPaymentWebService__passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke;
  v33[3] = &unk_1E56EE608;
  id v34 = v10;
  uint64_t v35 = v22;
  id v36 = v12;
  id v37 = v15;
  id v40 = v13;
  unint64_t v41 = v14;
  id v38 = v16;
  id v39 = v11;
  id v31 = v11;
  id v24 = v16;
  id v25 = v15;
  id v26 = v12;
  id v27 = v10;
  id v28 = v13;
  [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice serviceProviderDataForSecureElementPass:v19 encrypted:v23 completion:v33];

  return v32;
}

void __130__PKPaymentWebService__passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) setAppletData:v5];
    id v7 = [*(id *)(a1 + 40) primaryBrokerURL];
    id v8 = objc_alloc_init(PKPaymentRemoteContentPassActionGroupRequest);
    [(PKPaymentRemoteContentPassActionGroupRequest *)v8 setActionGroup:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _updateRequestWithCurrentTargetDevice:v8];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = [*(id *)(a1 + 40) _appleAccountInformation];
    id v13 = [(PKPaymentRemoteContentPassActionGroupRequest *)v8 _urlRequestWithServiceURL:v7 deviceIdentifier:v11 passTypeIdentifier:v9 passSerialNumber:v10 appleAccountInformation:v12];

    uint64_t v14 = *(void *)(a1 + 88);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __130__PKPaymentWebService__passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke_599;
    v18[3] = &unk_1E56E50E8;
    unint64_t v15 = *(void **)(a1 + 40);
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 72);
    id v21 = *(id *)(a1 + 80);
    [v15 performRequest:v13 taskIdentifier:v14 completionHandler:v18];
  }
  else
  {
    unint64_t v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v17 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v17;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Received nil service provider data with error %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __130__PKPaymentWebService__passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke_599(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v7 || v9)
  {
    unint64_t v15 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Get pass action group with group identifier failed with error %@", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v11 = [PKPaymentRemoteContentPassActionGroupResponse alloc];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [*(id *)(a1 + 40) secureElementPass];
    uint64_t v14 = [(PKPaymentRemoteContentPassActionGroupResponse *)v11 initWithExistingActionGroup:v12 data:v7 pass:v13];
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16)
  {
    unint64_t v17 = [(PKPaymentRemoteContentPassActionGroupResponse *)v14 updatedActionGroup];
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v10);
  }
}

- (unint64_t)_passActionGroupWithRemoteContentPassActionGroup:(id)a3 forPass:(id)a4 forDeviceIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = [(PKWebService *)self nextTaskID];
  uint64_t v15 = [v11 passTypeIdentifier];
  uint64_t v16 = [v11 serialNumber];
  unint64_t v17 = [(PKPaymentWebService *)self primaryBrokerURL];
  int v18 = objc_alloc_init(PKPaymentRemoteContentPassActionGroupRequest);
  [(PKPaymentRemoteContentPassActionGroupRequest *)v18 setActionGroup:v10];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v18];
  id v32 = v12;
  if (v12)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v18];
    [(PKPaymentWebService *)self _appleAccountInformation];
    id v30 = v13;
    id v19 = v11;
    v21 = unint64_t v20 = v14;
    [(PKPaymentRemoteContentPassActionGroupRequest *)v18 _urlRequestWithServiceURL:v17 deviceIdentifier:v12 passTypeIdentifier:v15 passSerialNumber:v16 appleAccountInformation:v21];
    id v22 = (void *)v16;
    v24 = uint64_t v23 = (void *)v15;

    unint64_t v14 = v20;
    id v25 = v10;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __111__PKPaymentWebService__passActionGroupWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke;
    v34[3] = &unk_1E56E50E8;
    id v35 = v10;
    id v26 = v19;
    id v36 = v19;
    id v13 = v30;
    id v37 = v30;
    [(PKWebService *)self performRequest:v24 taskIdentifier:v14 completionHandler:v34];

    id v27 = v32;
  }
  else
  {
    id v31 = v11;
    id v22 = (void *)v16;
    uint64_t v23 = (void *)v15;
    id v28 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action, deviceID is nil", buf, 2u);
    }

    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
    id v25 = v10;
    id v26 = v31;
    id v27 = 0;
  }

  return v14;
}

void __111__PKPaymentWebService__passActionGroupWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    uint64_t v15 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Get pass action group with group identifier failed with error %@", (uint8_t *)&v18, 0xCu);
    }

    unint64_t v14 = 0;
  }
  else
  {
    id v11 = [PKPaymentRemoteContentPassActionGroupResponse alloc];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [*(id *)(a1 + 40) secureElementPass];
    unint64_t v14 = [(PKPaymentRemoteContentPassActionGroupResponse *)v11 initWithExistingActionGroup:v12 data:v7 pass:v13];
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16)
  {
    unint64_t v17 = [(PKPaymentRemoteContentPassActionGroupResponse *)v14 updatedActionGroup];
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v10);
  }
}

- (unint64_t)moreInfoItemAtURL:(id)a3 withMetadata:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  uint64_t v12 = objc_alloc_init(PKPaymentWebServiceRequest);
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v12];
  id v13 = PKURLByAppendingQueryParams(v10, v9);

  unint64_t v14 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v13;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Downloading More Info Item with URL: '%@'.", buf, 0xCu);
  }

  uint64_t v15 = [(PKPaymentWebService *)self _appleAccountInformation];
  uint64_t v16 = [(PKWebServiceRequest *)v12 _murlRequestWithURL:v13 appleAccountInformation:v15];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PKPaymentWebService_moreInfoItemAtURL_withMetadata_completion___block_invoke;
  v19[3] = &unk_1E56E0EC8;
  void v19[4] = self;
  id v20 = v8;
  id v17 = v8;
  [(PKWebService *)self performRequest:v16 taskIdentifier:v11 completionHandler:v19];

  return v11;
}

void __65__PKPaymentWebService_moreInfoItemAtURL_withMetadata_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    id v25 = v9;
    id v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v25];
    id v11 = v25;

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v12 = [[PKPaymentSetupMoreInfoItem alloc] initWithMoreInfoDictionary:v10];
      id v13 = [(PKPaymentSetupMoreInfoItem *)v12 imageURL];

      if (v13)
      {
        unint64_t v14 = (void *)MEMORY[0x1E4F18DA8];
        uint64_t v15 = [(PKPaymentSetupMoreInfoItem *)v12 imageURL];
        uint64_t v16 = [v14 requestWithURL:v15];

        id v17 = *(void **)(a1 + 32);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __65__PKPaymentWebService_moreInfoItemAtURL_withMetadata_completion___block_invoke_2;
        v22[3] = &unk_1E56E0EC8;
        uint64_t v12 = v12;
        uint64_t v23 = v12;
        id v24 = *(id *)(a1 + 40);
        int v18 = [v17 dataTaskWithRequest:v16 completionHandler:v22];
        [v18 resume];
      }
      else
      {
        uint64_t v21 = *(void *)(a1 + 40);
        if (v21) {
          (*(void (**)(uint64_t, PKPaymentSetupMoreInfoItem *, void))(v21 + 16))(v21, v12, 0);
        }
      }
    }
    else
    {
      uint64_t v19 = *(void *)(a1 + 40);
      if (v19) {
        (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v11);
      }
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20) {
      (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v9);
    }
    id v11 = v9;
  }
}

void __65__PKPaymentWebService_moreInfoItemAtURL_withMetadata_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v10) {
    [*(id *)(a1 + 32) setImageData:v10];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, *(void *)(a1 + 32), 0);
  }
}

- (unint64_t)cardInfoForMerchantIdentifier:(id)a3 completion:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  if (v6 && v10)
  {
    id v34 = v7;
    id v11 = [[PKAMPCardInfoForMerchantRequest alloc] initWithMerchantIdentifier:v6];
    uint64_t v12 = [(PKPaymentWebService *)self primaryBrokerURL];
    id v13 = [(PKPaymentWebService *)self _appleAccountInformation];
    id v33 = v10;
    unint64_t v14 = [(PKAMPCardInfoForMerchantRequest *)v11 _urlRequestWithServiceURL:v12 deviceIdentifier:v10 appleAccountInformation:v13];

    uint64_t v15 = [MEMORY[0x1E4F18D78] sharedURLCache];
    uint64_t v16 = [v15 cachedResponseForRequest:v14];
    id v17 = PDLastPaymentPassInsertionOrRemovalDate();
    if (v17 && v16)
    {
      id v31 = v15;
      unint64_t v32 = v8;
      int v18 = [v16 response];
      uint64_t v19 = [v18 allHeaderFields];

      uint64_t v20 = [v19 objectForKeyedSubscript:@"Date"];
      id v21 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v21 setDateFormat:@"EEEE, dd LLL yyyy HH:mm:ss zzz"];
      id v22 = [v21 dateFromString:v20];
      if (!v22)
      {

        uint64_t v15 = v31;
        unint64_t v8 = v32;
        goto LABEL_15;
      }
      uint64_t v23 = v22;
      uint64_t v30 = [v22 compare:v17];

      uint64_t v15 = v31;
      unint64_t v8 = v32;
      if (v30 != 1)
      {
LABEL_16:
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __64__PKPaymentWebService_cardInfoForMerchantIdentifier_completion___block_invoke;
        v36[3] = &unk_1E56DF250;
        id v7 = v34;
        id v37 = v34;
        [(PKWebService *)self performRequest:v14 taskIdentifier:v8 completionHandler:v36];

        id v10 = v33;
        goto LABEL_17;
      }
    }
    uint64_t v19 = (void *)[v14 mutableCopy];
    [v19 setCachePolicy:0];
    uint64_t v20 = v14;
    unint64_t v14 = (void *)[v19 copy];
LABEL_15:

    goto LABEL_16;
  }
  if (v6)
  {
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    id v39 = @"Device not registered; cannot retrieve merchant info";
    id v25 = (void *)MEMORY[0x1E4F1C9E8];
    id v26 = &v39;
    id v27 = &v38;
  }
  else
  {
    id v28 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "AMP Card Enrollment was attempted without a merchant identifier!", buf, 2u);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41[0] = @"Cannot perform enrollment without a merchant identifier";
    id v25 = (void *)MEMORY[0x1E4F1C9E8];
    id v26 = (__CFString **)v41;
    id v27 = &v40;
  }
  id v11 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
  unint64_t v14 = [v24 errorWithDomain:@"PKPaymentErrorDomain" code:1 userInfo:v11];
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
LABEL_17:

  return v8;
}

uint64_t __64__PKPaymentWebService_cardInfoForMerchantIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)retrievePrivacyDeviceAssessmentStateWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKPaymentWebService *)self context];
  uint64_t v9 = [v8 deviceID];

  unint64_t v10 = [(PKWebService *)self nextTaskID];
  id v11 = [(PKPaymentWebService *)self context];
  uint64_t v12 = [v11 primaryRegion];
  id v13 = [v12 paymentServicesURL];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v14 = [(PKPaymentWebService *)self _appleAccountInformation];
  uint64_t v15 = [v7 _urlRequestWithServiceURL:v13 deviceIdentifier:v9 appleAccountInformation:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __82__PKPaymentWebService_retrievePrivacyDeviceAssessmentStateWithRequest_completion___block_invoke;
  v18[3] = &unk_1E56DF250;
  id v19 = v6;
  id v16 = v6;
  [(PKWebService *)self performRequest:v15 taskIdentifier:v10 completionHandler:v18];

  return v10;
}

void __82__PKPaymentWebService_retrievePrivacyDeviceAssessmentStateWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  id v6 = a2;
  id v7 = [[PKPrivacyDeviceAssessmentRetrieveStateResponse alloc] initWithData:v6];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, PKPrivacyDeviceAssessmentRetrieveStateResponse *, id))(v8 + 16))(v8, v7, v9);
  }
}

- (unint64_t)sendPrivacyDeviceAssessmentStateWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 deviceID];

  unint64_t v10 = [(PKWebService *)self nextTaskID];
  id v11 = [(PKPaymentWebService *)self context];
  uint64_t v12 = [v11 primaryRegion];
  id v13 = [v12 paymentServicesURL];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v14 = [(PKPaymentWebService *)self _appleAccountInformation];
  uint64_t v15 = [v7 _urlRequestWithServiceURL:v13 deviceIdentifier:v9 appleAccountInformation:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __78__PKPaymentWebService_sendPrivacyDeviceAssessmentStateWithRequest_completion___block_invoke;
  v18[3] = &unk_1E56DF250;
  id v19 = v6;
  id v16 = v6;
  [(PKWebService *)self performRequest:v15 taskIdentifier:v10 completionHandler:v18];

  return v10;
}

void __78__PKPaymentWebService_sendPrivacyDeviceAssessmentStateWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    uint64_t v9 = [v8 statusCode];
    if (v9 == 200)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v11 = *(void (**)(void))(v10 + 16);
    }
    else
    {
      uint64_t v16 = v9;
      id v17 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = [v8 URL];
        id v19 = [v18 absoluteString];
        int v21 = 138412802;
        id v22 = v19;
        __int16 v23 = 2048;
        uint64_t v24 = v16;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ status code: %lu error: %@", (uint8_t *)&v21, 0x20u);
      }
      uint64_t v20 = *(void *)(a1 + 32);
      if (!v20) {
        goto LABEL_15;
      }
      id v11 = *(void (**)(void))(v20 + 16);
    }
    v11();
    goto LABEL_15;
  }
  if (v7)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 URL];
      unint64_t v14 = [v13 absoluteString];
      int v21 = 138412546;
      id v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v7;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ error: %@", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v7);
    }
  }
LABEL_16:
}

- (unint64_t)retrieveMerchantTokensWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentWebService *)self context];
  uint64_t v9 = [v8 deviceID];

  unint64_t v10 = [(PKWebService *)self nextTaskID];
  if (PKMerchantTokensDemoModeEnabled())
  {
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PKPaymentWebService_retrieveMerchantTokensWithRequest_completion___block_invoke;
    block[3] = &unk_1E56D83D8;
    id v23 = v7;
    id v22 = v6;
    id v12 = v7;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);

    id v13 = v23;
  }
  else
  {
    unint64_t v14 = [(PKPaymentWebService *)self context];
    uint64_t v15 = [v14 primaryRegion];
    id v12 = [v15 paymentServicesURL];

    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    uint64_t v16 = [(PKPaymentWebService *)self _appleAccountInformation];
    id v13 = [v6 _urlRequestWithServiceURL:v12 deviceIdentifier:v9 appleAccountInformation:v16];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__PKPaymentWebService_retrieveMerchantTokensWithRequest_completion___block_invoke_620;
    v19[3] = &unk_1E56DF250;
    id v20 = v7;
    id v17 = v7;
    [(PKWebService *)self performRequest:v13 taskIdentifier:v10 completionHandler:v19];
  }
  return v10;
}

void __68__PKPaymentWebService_retrieveMerchantTokensWithRequest_completion___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 40)) {
    return;
  }
  uint64_t v2 = [*(id *)(a1 + 32) merchantTokenId];
  uint64_t v3 = [v2 length];

  if (!v3)
  {
    if (PKMerchantTokensPagedDemoEnabled())
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = [*(id *)(a1 + 32) pageNumber];
      id v13 = (id)v6;
      if (v6) {
        id v7 = (void *)v6;
      }
      else {
        id v7 = &unk_1EE22C278;
      }
      id v8 = +[PKMerchantTokenDemoData responseForPageNumber:v7];
      (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v8, 0);

      goto LABEL_17;
    }
    int v12 = PKMerchantTokensCashDemoEnabled();
    uint64_t v10 = *(void *)(a1 + 40);
    if (!v12)
    {
      uint64_t v11 = +[PKMerchantTokenDemoData responseForSinglePage];
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (!PKMerchantTokensAMPTransactionDemoEnabled())
  {
    int v9 = PKMerchantTokensCashDemoEnabled();
    uint64_t v10 = *(void *)(a1 + 40);
    if (!v9)
    {
      uint64_t v11 = +[PKMerchantTokenDemoData responseForSingleMerchantToken];
LABEL_16:
      id v13 = (id)v11;
      (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, v11, 0);
      goto LABEL_17;
    }
LABEL_14:
    uint64_t v11 = +[PKMerchantTokenDemoData responseForSingleCashMerchantToken];
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v13 = +[PKMerchantTokenDemoData responseForSingleAMPMerchantToken];
  (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v13, 0);
LABEL_17:
}

void __68__PKPaymentWebService_retrieveMerchantTokensWithRequest_completion___block_invoke_620(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  id v6 = a2;
  id v7 = [[PKRetrieveMerchantTokensResponse alloc] initWithData:v6];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, PKRetrieveMerchantTokensResponse *, id))(v8 + 16))(v8, v7, v9);
  }
}

- (unint64_t)deleteMerchantTokenWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  if (PKMerchantTokensDemoModeEnabled())
  {
    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PKPaymentWebService_deleteMerchantTokenWithRequest_completion___block_invoke;
    block[3] = &unk_1E56D8360;
    id v20 = v7;
    id v10 = v7;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
    uint64_t v11 = v20;
  }
  else
  {
    int v12 = [(PKPaymentWebService *)self context];
    id v13 = [v12 primaryRegion];
    id v10 = [v13 paymentServicesURL];

    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    unint64_t v14 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v11 = [v6 _urlRequestWithServiceURL:v10 appleAccountInformation:v14];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__PKPaymentWebService_deleteMerchantTokenWithRequest_completion___block_invoke_2;
    v17[3] = &unk_1E56DF250;
    id v18 = v7;
    id v15 = v7;
    [(PKWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v17];
  }
  return v8;
}

uint64_t __65__PKPaymentWebService_deleteMerchantTokenWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

void __65__PKPaymentWebService_deleteMerchantTokenWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(void *)(a1 + 32))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
      uint64_t v11 = [v10 statusCode];
      if (v11 == 200)
      {
        int v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      }
      else
      {
        uint64_t v16 = v11;
        id v17 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v10 URL];
          id v19 = [v18 absoluteString];
          int v20 = 138412802;
          int v21 = v19;
          __int16 v22 = 2048;
          uint64_t v23 = v16;
          __int16 v24 = 2112;
          id v25 = v9;
          _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ status code: %lu error: %@", (uint8_t *)&v20, 0x20u);
        }
        int v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      }
      v12();
    }
    else if (v9)
    {
      id v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v14 = [v8 URL];
        id v15 = [v14 absoluteString];
        int v20 = 138412546;
        int v21 = v15;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v9;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ error: %@", (uint8_t *)&v20, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (unint64_t)transactionReceiptAuthorizationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self primaryBrokerURL];
  id v10 = [(PKPaymentWebService *)self _appleAccountInformation];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __77__PKPaymentWebService_transactionReceiptAuthorizationWithRequest_completion___block_invoke;
  v13[3] = &unk_1E56E5200;
  id v14 = v6;
  unint64_t v15 = v8;
  void v13[4] = self;
  id v11 = v6;
  [v7 _urlRequestWithServiceURL:v9 appleAccountInformation:v10 webService:self completion:v13];

  return v8;
}

void __77__PKPaymentWebService_transactionReceiptAuthorizationWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKPaymentWebService_transactionReceiptAuthorizationWithRequest_completion___block_invoke_2;
  v5[3] = &unk_1E56DF250;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 performRequest:a2 taskIdentifier:v3 completionHandler:v5];
}

void __77__PKPaymentWebService_transactionReceiptAuthorizationWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = 0;
  if (v13)
  {
    if (!v8)
    {
      id v9 = [[PKTransactionReceiptAuthorizationResponse alloc] initWithData:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v7 allHeaderFields];
        id v11 = [v10 PKStringForKey:@"x-conversation-id"];

        [(PKTransactionReceiptAuthorizationResponse *)v9 setConversationIdentifier:v11];
      }
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, PKTransactionReceiptAuthorizationResponse *, id))(v12 + 16))(v12, v9, v8);
  }
}

- (unint64_t)transactionReceiptWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [v7 _urlRequest];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PKPaymentWebService_transactionReceiptWithRequest_completion___block_invoke;
  v12[3] = &unk_1E56DF250;
  id v13 = v6;
  id v10 = v6;
  [(PKWebService *)self performRequest:v9 taskIdentifier:v8 completionHandler:v12];

  return v8;
}

void __64__PKPaymentWebService_transactionReceiptWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v13 || v8)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v8);
    }
  }
  else
  {
    PKTemporaryItemURLWithExtension(@"pkreceipt", 1);
    id v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    PKTemporaryItemPrepareDirectory();
    if (PKUnarchiverZip(v13, v9)) {
      id v10 = [[PKTransactionReceipt alloc] initWithFileURL:v9];
    }
    else {
      id v10 = 0;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, PKTransactionReceipt *, void))(v12 + 16))(v12, v10, 0);
    }
  }
}

- (unint64_t)vehicleManufacturerWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  uint64_t v11 = [(PKPaymentWebService *)self primaryBrokerURL];
  uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v13 = [v7 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__PKPaymentWebService_vehicleManufacturerWithRequest_withCompletion___block_invoke;
  v16[3] = &unk_1E56DF250;
  id v17 = v6;
  id v14 = v6;
  [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];

  return v8;
}

void __69__PKPaymentWebService_vehicleManufacturerWithRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(void *)(a1 + 32))
  {
    if (PKSharingForceEmptyVehicleManufacturerResponse())
    {
      id v10 = PKLogFacilityTypeGetObject(0x21uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKSharingForceEmptyVehicleManufacturerResponse enabled", v13, 2u);
      }

      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 statusCode] == 204)
    {
LABEL_8:
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      goto LABEL_13;
    }
    uint64_t v11 = [[PKPaymentVehicleManufacturerResponse alloc] initWithData:v7];
    if (v9) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v11;
    }
    (*(void (**)(void, PKPaymentVehicleManufacturerResponse *, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v12, v9);
  }
LABEL_13:
}

- (unint64_t)registerCredentialWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  id v10 = [v9 deviceID];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  uint64_t v11 = [(PKPaymentWebService *)self primaryBrokerURL];
  uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v13 = [v7 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__PKPaymentWebService_registerCredentialWithRequest_withCompletion___block_invoke;
  v16[3] = &unk_1E56E1400;
  void v16[4] = self;
  id v17 = v6;
  id v14 = v6;
  [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];

  return v8;
}

void __68__PKPaymentWebService_registerCredentialWithRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = [[PKPaymentRegisterCredentialResponse alloc] initWithData:v13];
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    if (v9)
    {
      (*(void (**)(uint64_t, PKPaymentRegisterCredentialResponse *, void))(v10 + 16))(v10, v9, 0);
    }
    else
    {
      if (v8)
      {
        id v11 = v8;
      }
      else
      {
        id v11 = [*(id *)(a1 + 32) _errorWithResult:0 response:v7 data:v13];
      }
      uint64_t v12 = v11;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (unint64_t)revokeSharedCredentialWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
  uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v13 = [v7 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__PKPaymentWebService_revokeSharedCredentialWithRequest_withCompletion___block_invoke;
  v16[3] = &unk_1E56DF250;
  id v17 = v6;
  id v14 = v6;
  [(PKWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];

  return v8;
}

void __72__PKPaymentWebService_revokeSharedCredentialWithRequest_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  if (v9)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = a2;
    unint64_t v8 = [[PKPaymentRevokeSharedCredentialResponse alloc] initWithData:v7];

    id v6 = [(PKPaymentRevokeSharedCredentialResponse *)v8 passURL];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)credentialAccountAttesationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self context];
  uint64_t v10 = [v9 deviceID];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v11 = [(PKPaymentWebService *)self primaryBrokerURL];
  uint64_t v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PKPaymentWebService_credentialAccountAttesationWithRequest_completion___block_invoke;
  v15[3] = &unk_1E56E5200;
  id v16 = v6;
  unint64_t v17 = v8;
  void v15[4] = self;
  id v13 = v6;
  [v7 _urlRequestWithServiceURL:v11 deviceIdentifier:v10 appleAccountInformation:v12 webService:self completion:v15];

  return v8;
}

void __73__PKPaymentWebService_credentialAccountAttesationWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__PKPaymentWebService_credentialAccountAttesationWithRequest_completion___block_invoke_2;
  v5[3] = &unk_1E56DF250;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 performRequest:a2 taskIdentifier:v3 completionHandler:v5];
}

void __73__PKPaymentWebService_credentialAccountAttesationWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  if (v9)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = a2;
    unint64_t v8 = [[PKPaymentAccountAttesationResponse alloc] initWithData:v7];

    id v6 = [(PKPaymentAccountAttesationResponse *)v8 attestation];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)inAppPaymentNonceForPass:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = objc_alloc_init(PKPaymentNonceRequest);
  [(PKPaymentAugmentBaseRequest *)v8 setPass:v7];

  [(PKPaymentNonceRequest *)v8 setUseLegacyGetAPI:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PKPaymentWebService_inAppPaymentNonceForPass_completion___block_invoke;
  v12[3] = &unk_1E56EE630;
  id v13 = v6;
  id v9 = v6;
  unint64_t v10 = [(PKPaymentWebService *)self inAppPaymentNonceWithRequest:v8 serviceURL:0 completion:v12];

  return v10;
}

void __59__PKPaymentWebService_inAppPaymentNonceForPass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 nonceData];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);
}

- (unint64_t)inAppPaymentNonceWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v11 = [(PKPaymentWebService *)self context];
    uint64_t v12 = [v8 pass];
    id v13 = [v12 passTypeIdentifier];
    id v14 = [v11 regionForIdentifier:v13];

    id v9 = [v14 inAppPaymentServicesURL];
    if (!v9)
    {
      PKOverrideInAppPaymentServicesURL();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  unint64_t v15 = [(PKPaymentWebService *)self _nonceWithRequest:v8 serviceURL:v9 completion:v10];

  return v15;
}

- (unint64_t)_nonceWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__54;
  id v34 = __Block_byref_object_dispose__54;
  uint64_t v12 = [(PKPaymentWebService *)self context];
  id v35 = [v12 deviceID];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke;
  aBlock[3] = &unk_1E56EE658;
  aBlock[4] = self;
  id v13 = v8;
  id v25 = v13;
  id v14 = v9;
  id v26 = v14;
  id v28 = &v30;
  unint64_t v29 = v11;
  id v15 = v10;
  id v27 = v15;
  id v16 = (void (**)(void))_Block_copy(aBlock);
  if ([(id)v31[5] length])
  {
    v16[2](v16);
  }
  else
  {
    unint64_t v17 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Context missing deviceID, registering", buf, 2u);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_631;
    v19[3] = &unk_1E56EE680;
    __int16 v22 = &v30;
    void v19[4] = self;
    int v20 = v16;
    id v21 = v15;
    [(PKPaymentWebService *)self registerDeviceWithCompletion:v19];
  }
  _Block_object_dispose(&v30, 8);

  return v11;
}

void __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:*(void *)(a1 + 40)];
  int v2 = [*(id *)(a1 + 40) useLegacyGetAPI];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v6 = [*(id *)(a1 + 32) _appleAccountInformation];
  if (v2) {
    [v4 _legacyGetURLRequestWithServiceURL:v3 deviceIdentifier:v5 appleAccountInformation:v6];
  }
  else {
  id v7 = [v4 _urlRequestWithServiceURL:v3 deviceIdentifier:v5 appleAccountInformation:v6];
  }

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_2;
  v10[3] = &unk_1E56E0EC8;
  void v10[4] = v8;
  id v11 = *(id *)(a1 + 56);
  [v8 performRequest:v7 taskIdentifier:v9 completionHandler:v10];
}

void __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__54;
  void v19[4] = __Block_byref_object_dispose__54;
  id v20 = 0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_3;
  id v16 = &unk_1E56DCAF0;
  id v18 = v19;
  id v11 = v7;
  id v17 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v13];
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  _Block_object_dispose(v19, 8);
}

BOOL __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_631(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 32) context];
    uint64_t v4 = [v3 deviceID];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 32) _errorWithResult:0 data:0];
    (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v9, 0);
  }
}

- (unint64_t)augmentSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v11 = [(PKPaymentWebService *)self context];
    uint64_t v12 = [v8 pass];
    uint64_t v13 = [v12 passTypeIdentifier];
    uint64_t v14 = [v11 regionForIdentifier:v13];

    id v9 = [v14 inAppPaymentServicesURL];
    if (!v9)
    {
      PKOverrideInAppPaymentServicesURL();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  unint64_t v15 = [(PKPaymentWebService *)self _augmentSessionWithRequest:v8 serviceURL:v9 completion:v10];

  return v15;
}

- (unint64_t)_augmentSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  uint64_t v12 = [(PKPaymentWebService *)self context];
  uint64_t v13 = [v12 deviceID];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
  uint64_t v14 = [(PKPaymentWebService *)self _appleAccountInformation];
  unint64_t v15 = [v10 _urlRequestWithServiceURL:v9 deviceIdentifier:v13 appleAccountInformation:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __72__PKPaymentWebService__augmentSessionWithRequest_serviceURL_completion___block_invoke;
  v18[3] = &unk_1E56E0EC8;
  void v18[4] = self;
  id v19 = v8;
  id v16 = v8;
  [(PKWebService *)self performRequest:v15 taskIdentifier:v11 completionHandler:v18];

  return v11;
}

void __72__PKPaymentWebService__augmentSessionWithRequest_serviceURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__54;
  void v19[4] = __Block_byref_object_dispose__54;
  id v20 = 0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  unint64_t v15 = __72__PKPaymentWebService__augmentSessionWithRequest_serviceURL_completion___block_invoke_2;
  id v16 = &unk_1E56DCAF0;
  id v18 = v19;
  id v11 = v7;
  id v17 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v13];
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  _Block_object_dispose(v19, 8);
}

BOOL __72__PKPaymentWebService__augmentSessionWithRequest_serviceURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)rewrapInAppPayment:(id)a3 merchantIdentifier:(id)a4 merchantSession:(id)a5 hostApplicationIdentifier:(id)a6 applicationData:(id)a7 pass:(id)a8 paymentApplication:(id)a9 completion:(id)a10
{
  return [(PKPaymentWebService *)self rewrapInAppPayment:a3 merchantIdentifier:a4 hostApplicationIdentifier:a6 applicationData:a7 pass:a8 completion:a10];
}

- (unint64_t)rewrapInAppPayment:(id)a3 merchantIdentifier:(id)a4 hostApplicationIdentifier:(id)a5 applicationData:(id)a6 pass:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(PKPaymentRewrapRequest);
  [(PKPaymentRewrapRequestBase *)v20 setWrappedPayment:v19];

  id v21 = [v15 devicePrimaryInAppPaymentApplication];
  [(PKPaymentRewrapRequestBase *)v20 setPaymentApplication:v21];

  [(PKPaymentRewrapRequest *)v20 setMerchantIdentifier:v18];
  [(PKPaymentRewrapRequest *)v20 setHostApplicationIdentifier:v17];

  [(PKPaymentRewrapRequestBase *)v20 setApplicationData:v16];
  [(PKPaymentRewrapRequestBase *)v20 setPass:v15];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __119__PKPaymentWebService_rewrapInAppPayment_merchantIdentifier_hostApplicationIdentifier_applicationData_pass_completion___block_invoke;
  v25[3] = &unk_1E56E1D68;
  id v26 = v14;
  id v22 = v14;
  unint64_t v23 = [(PKPaymentWebService *)self rewrapInAppPaymentWithRequest:v20 serviceURL:0 completion:v25];

  return v23;
}

uint64_t __119__PKPaymentWebService_rewrapInAppPayment_merchantIdentifier_hostApplicationIdentifier_applicationData_pass_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)rewrapInAppPaymentWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __75__PKPaymentWebService_rewrapInAppPaymentWithRequest_serviceURL_completion___block_invoke;
  v18[3] = &unk_1E56EE6A8;
  id v19 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKPaymentWebService_rewrapInAppPaymentWithRequest_serviceURL_completion___block_invoke_2;
  v15[3] = &unk_1E56E1D18;
  id v16 = v19;
  id v17 = v9;
  id v11 = v9;
  id v12 = v19;
  unint64_t v13 = [(PKPaymentWebService *)self _performRewrapRequest:v12 serviceURL:v10 responseHandler:v18 completion:v15];

  return v13;
}

id __75__PKPaymentWebService_rewrapInAppPaymentWithRequest_serviceURL_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 type];
  uint64_t v5 = off_1E56D6F98;
  if (v4 != 2) {
    uint64_t v5 = off_1E56D6028;
  }
  id v6 = [(__objc2_class *)*v5 responseWithData:v3];

  return v6;
}

void __75__PKPaymentWebService_rewrapInAppPaymentWithRequest_serviceURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v17 = a2;
  id v8 = a3;
  id v9 = a5;
  id v10 = [*(id *)(a1 + 32) pass];
  id v11 = [v10 associatedApplicationIdentifiers];
  id v12 = [*(id *)(a1 + 32) hostApplicationIdentifier];
  int v13 = [v11 containsObject:v12];

  if (v13)
  {
    id v14 = [*(id *)(a1 + 32) pass];
    id v15 = (void *)[v14 copy];

    [v15 sanitizePaymentApplications];
    id v16 = [v8 paymentMethod];
    [v16 setPaymentPass:v15];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)completeSession:(id)a3 wrappedPayment:(id)a4 pass:(id)a5 applicationData:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(PKPaymentCompleteSessionRequest);
  [(PKPaymentRewrapRequestBase *)v17 setWrappedPayment:v15];

  [(PKPaymentRewrapRequestBase *)v17 setPass:v14];
  id v18 = [v14 devicePrimaryInAppPaymentApplication];

  [(PKPaymentRewrapRequestBase *)v17 setPaymentApplication:v18];
  [(PKPaymentCompleteSessionRequest *)v17 setMerchantSession:v16];

  [(PKPaymentRewrapRequestBase *)v17 setApplicationData:v13];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__PKPaymentWebService_completeSession_wrappedPayment_pass_applicationData_completion___block_invoke;
  v22[3] = &unk_1E56EE6D0;
  id v23 = v12;
  id v19 = v12;
  unint64_t v20 = [(PKPaymentWebService *)self completeSessionWithRequest:v17 serviceURL:0 completion:v22];

  return v20;
}

uint64_t __86__PKPaymentWebService_completeSession_wrappedPayment_pass_applicationData_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)completeSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __72__PKPaymentWebService_completeSessionWithRequest_serviceURL_completion___block_invoke;
  v18[3] = &unk_1E56EE6A8;
  id v19 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PKPaymentWebService_completeSessionWithRequest_serviceURL_completion___block_invoke_2;
  v15[3] = &unk_1E56E1D18;
  id v16 = v19;
  id v17 = v9;
  id v11 = v9;
  id v12 = v19;
  unint64_t v13 = [(PKPaymentWebService *)self _performRewrapRequest:v12 serviceURL:v10 responseHandler:v18 completion:v15];

  return v13;
}

id __72__PKPaymentWebService_completeSessionWithRequest_serviceURL_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 type];
  uint64_t v5 = off_1E56D6F98;
  if (v4 != 2) {
    uint64_t v5 = off_1E56D5A80;
  }
  id v6 = [(__objc2_class *)*v5 responseWithData:v3];

  return v6;
}

void __72__PKPaymentWebService_completeSessionWithRequest_serviceURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v20 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [*(id *)(a1 + 32) pass];
  unint64_t v13 = [v12 associatedWebDomains];
  id v14 = [*(id *)(a1 + 32) merchantSession];
  id v15 = [v14 domain];
  int v16 = [v13 containsObject:v15];

  if (v16)
  {
    id v17 = [*(id *)(a1 + 32) pass];
    id v18 = (void *)[v17 copy];

    [v18 sanitizePaymentApplications];
    id v19 = [v9 paymentMethod];
    [v19 setPaymentPass:v18];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)_performRewrapRequest:(id)a3 serviceURL:(id)a4 responseHandler:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = [(PKWebService *)self nextTaskID];
  id v15 = [(PKPaymentWebService *)self context];
  int v16 = [v15 deviceID];
  if (!v11)
  {
    id v17 = [v10 pass];
    id v18 = [v17 passTypeIdentifier];
    id v19 = [v15 regionForIdentifier:v18];

    id v11 = [v19 inAppPaymentServicesURL];
    if (!v11)
    {
      PKOverrideInAppPaymentServicesURL();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke;
  aBlock[3] = &unk_1E56EE770;
  aBlock[4] = self;
  id v20 = v10;
  id v33 = v20;
  id v21 = v11;
  id v34 = v21;
  id v22 = v16;
  id v35 = v22;
  unint64_t v38 = v14;
  id v23 = v12;
  id v36 = v23;
  id v24 = v13;
  id v37 = v24;
  id v25 = (void (**)(void))_Block_copy(aBlock);
  if ([v22 length])
  {
    v25[2](v25);
  }
  else
  {
    id v26 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Context missing deviceID, registering", buf, 2u);
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_656;
    v28[3] = &unk_1E56EE798;
    unint64_t v29 = v25;
    id v30 = v24;
    void v28[4] = self;
    [(PKPaymentWebService *)self registerDeviceWithCompletion:v28];
  }
  return v14;
}

void __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _paymentDevice];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_2;
  v5[3] = &unk_1E56EE748;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  uint64_t v12 = *(void *)(a1 + 80);
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  [v2 rewrapDataWithCompletionHandler:v5];
}

void __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v7 = a2;
  id v8 = [v6 _appleAccountInformation];
  uint64_t v9 = [v3 _urlRequestWithServiceURL:v4 deviceIdentifier:v5 rewrapData:v7 appleAccountInformation:v8];

  id v10 = *(void **)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 80);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_3;
  v12[3] = &unk_1E56EE720;
  void v12[4] = v10;
  id v14 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 72);
  [v10 performRequest:v9 taskIdentifier:v11 completionHandler:v12];
}

void __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__54;
  id v34 = __Block_byref_object_dispose__54;
  id v35 = 0;
  id v10 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_4;
  v26[3] = &unk_1E56EE6F8;
  unint64_t v29 = &v30;
  id v28 = *(id *)(a1 + 48);
  id v11 = v7;
  id v27 = v11;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = objc_msgSend(v8, "pk_valueForHTTPHeaderField:", @"X-Apple-Retry-Nonce");
  }
  else
  {
    id v13 = 0;
  }
  if (v12 == 1)
  {
    id v25 = [*(id *)(a1 + 40) pass];
    id v14 = [*(id *)(a1 + 40) paymentApplication];
    if ([*(id *)(a1 + 40) type] == 1)
    {
      id v15 = [PKPaymentMethod alloc];
      int v16 = [*(id *)(a1 + 40) account];
      id v17 = [(id)v31[5] primaryAccountNumberSuffix];
      id v18 = [(PKPaymentMethod *)v15 initWithPayLaterAccount:v16 primaryAccountNumberSuffix:v17 obfuscateNetworks:0];
    }
    else
    {
      id v18 = [[PKPaymentMethod alloc] initWithPaymentPass:v25 paymentApplication:v14 obfuscateNetworks:0];
    }
    id v19 = objc_alloc_init(PKPaymentToken);
    id v20 = [(id)v31[5] transactionIdentifier];
    if (!v20)
    {
      id v21 = [*(id *)(a1 + 40) wrappedPayment];
      id v20 = [v21 transactionIdentifier];
    }
    [(PKPaymentToken *)v19 setTransactionIdentifier:v20];
    id v22 = [(PKPaymentMethod *)v18 displayName];
    [(PKPaymentToken *)v19 setPaymentInstrumentName:v22];

    id v23 = [(PKPaymentMethod *)v18 network];
    [(PKPaymentToken *)v19 setPaymentNetwork:v23];

    id v24 = [(id)v31[5] rewrappedPaymentData];
    [(PKPaymentToken *)v19 setPaymentData:v24];

    [(PKPaymentToken *)v19 setPaymentMethod:v18];
    AnalyticsSendEvent();
  }
  else
  {
    if (!v9)
    {
      id v9 = [*(id *)(a1 + 32) _errorWithResult:v12 data:v11];
    }
    AnalyticsSendEvent();
    id v19 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  _Block_object_dispose(&v30, 8);
}

BOOL __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

void __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_656(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = [*(id *)(a1 + 32) _errorWithResult:0 data:0];
    (*(void (**)(uint64_t, id, void, void, void))(v3 + 16))(v3, v4, 0, 0, 0);
  }
}

- (unint64_t)availableDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  id v6 = [(PKPaymentWebService *)self context];
  id v7 = [v6 primaryRegion];

  id v8 = objc_alloc_init(PKPaymentAvailableDevicesRequest);
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v8];
  id v9 = [v7 brokerURL];
  id v10 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v11 = [(PKPaymentAvailableDevicesRequest *)v8 _urlRequestWithServiceURL:v9 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__PKPaymentWebService_availableDevicesWithCompletion___block_invoke;
  v14[3] = &unk_1E56DF250;
  id v15 = v4;
  id v12 = v4;
  [(PKWebService *)self performRequest:v11 taskIdentifier:v5 completionHandler:v14];

  return v5;
}

void __54__PKPaymentWebService_availableDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v14 || v8)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v8);
    }
  }
  else
  {
    id v9 = +[PKWebServiceResponse responseWithData:v14];
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      id v12 = [v9 devices];
      (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v12, 0);
    }
  }
}

- (unint64_t)checkMerchantStatus:(id)a3 forDomain:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  id v12 = [(PKPaymentWebService *)self context];
  uint64_t v13 = [v12 primaryRegion];

  id v14 = [[PKPaymentCheckMerchantRequest alloc] initWithMerchantIdentifier:v10 domainName:v9];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v14];
  id v15 = [v13 inAppPaymentServicesURL];
  int v16 = [(PKPaymentCheckMerchantRequest *)v14 _urlRequestWithServiceURL:v15];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__PKPaymentWebService_checkMerchantStatus_forDomain_withCompletion___block_invoke;
  v19[3] = &unk_1E56DF250;
  id v20 = v8;
  id v17 = v8;
  [(PKWebService *)self performRequest:v16 taskIdentifier:v11 completionHandler:v19];

  return v11;
}

void __68__PKPaymentWebService_checkMerchantStatus_forDomain_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v13 || v8)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v8);
    }
  }
  else
  {
    id v9 = +[PKWebServiceResponse responseWithData:v13];
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, uint64_t, void))(v11 + 16))(v11, [v9 isRegistered], 0);
    }
  }
}

- (unint64_t)prepareTransactionDetailsForMerchantSession:(id)a3 secureElementIdentifier:(id)a4 amount:(id)a5 currencyCode:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[PKPaymentPrepareTransactionDetailsRequest alloc] initWithMerchantSession:v16 secureElementIdentifier:v15 amount:v14 currencyCode:v13];

  unint64_t v18 = [(PKWebService *)self nextTaskID];
  id v19 = [(PKPaymentWebService *)self context];
  id v20 = [v19 primaryRegion];

  id v21 = [v20 inAppPaymentServicesURL];
  id v22 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v23 = [(PKPaymentPrepareTransactionDetailsRequest *)v17 _urlRequestWithServiceURL:v21 appleAccountInformation:v22];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __122__PKPaymentWebService_prepareTransactionDetailsForMerchantSession_secureElementIdentifier_amount_currencyCode_completion___block_invoke;
  v26[3] = &unk_1E56E0EC8;
  void v26[4] = self;
  id v27 = v12;
  id v24 = v12;
  [(PKWebService *)self performRequest:v23 taskIdentifier:v18 completionHandler:v26];

  return v18;
}

void __122__PKPaymentWebService_prepareTransactionDetailsForMerchantSession_secureElementIdentifier_amount_currencyCode_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__54;
  id v26 = __Block_byref_object_dispose__54;
  id v27 = 0;
  id v10 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __122__PKPaymentWebService_prepareTransactionDetailsForMerchantSession_secureElementIdentifier_amount_currencyCode_completion___block_invoke_2;
  v18[3] = &unk_1E56EE7C0;
  id v11 = v7;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  id v21 = &v22;
  uint64_t v13 = [v10 _resultForResponse:v8 error:v12 successHandler:v18];
  if (v13 == 1)
  {
    id v14 = [PKPaymentInstructions alloc];
    id v15 = [(id)v23[5] instructionsDictionary];
    id v16 = [(PKPaymentInstructions *)v14 initWithDictionary:v15];
  }
  else
  {
    [*(id *)(a1 + 32) _errorWithResult:v13 data:v11];
    id v16 = 0;
    id v15 = v12;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, id, PKPaymentInstructions *))(v17 + 16))(v17, v12, v16);
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __122__PKPaymentWebService_prepareTransactionDetailsForMerchantSession_secureElementIdentifier_amount_currencyCode_completion___block_invoke_2(void *a1)
{
  if (a1[4] && !a1[5])
  {
    uint64_t v3 = +[PKWebServiceResponse responseWithData:](PKPaymentPrepareTransactionDetailsResponse, "responseWithData:");
    uint64_t v4 = *(void *)(a1[6] + 8);
    unint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 0;
  }
  AnalyticsSendEvent();
  return v2;
}

- (unint64_t)serviceProviderNonceWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v11 = [(PKPaymentWebService *)self context];
    id v12 = [v8 pass];
    uint64_t v13 = [v12 passTypeIdentifier];
    id v14 = [v11 regionForIdentifier:v13];

    id v9 = [v14 paymentServicesURL];
  }
  unint64_t v15 = [(PKPaymentWebService *)self _nonceWithRequest:v8 serviceURL:v9 completion:v10];

  return v15;
}

- (unint64_t)serviceProviderAugmentSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v11 = [(PKPaymentWebService *)self context];
    id v12 = [v8 pass];
    uint64_t v13 = [v12 passTypeIdentifier];
    id v14 = [v11 regionForIdentifier:v13];

    id v9 = [v14 paymentServicesURL];
  }
  unint64_t v15 = [(PKPaymentWebService *)self _augmentSessionWithRequest:v8 serviceURL:v9 completion:v10];

  return v15;
}

- (unint64_t)performServiceProviderPayment:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 deviceID];
  id v10 = [v6 pass];
  id v11 = [v10 passTypeIdentifier];
  id v12 = [v8 regionForIdentifier:v11];

  unint64_t v13 = [(PKWebService *)self nextTaskID];
  if (v9)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
    id v14 = [v12 paymentServicesURL];
    unint64_t v15 = [(PKPaymentWebService *)self _appleAccountInformation];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke;
    v19[3] = &unk_1E56E5200;
    void v19[4] = self;
    unint64_t v21 = v13;
    id v20 = v7;
    [v6 _urlRequestWithServiceURL:v14 deviceIdentifier:v9 appleAccountInformation:v15 webService:self completion:v19];
  }
  else
  {
    id v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v18 = 0;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Perform Payment, deviceID is nil", v18, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }

  return v13;
}

void __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke_2;
  v5[3] = &unk_1E56E0EC8;
  void v5[4] = v3;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 performRequest:a2 taskIdentifier:v4 completionHandler:v5];
}

void __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__54;
  uint64_t v24 = __Block_byref_object_dispose__54;
  id v25 = 0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke_3;
  uint64_t v17 = &unk_1E56EE3B0;
  id v11 = v7;
  id v18 = v11;
  id v19 = &v20;
  uint64_t v12 = [v10 _resultForResponse:v8 error:v9 successHandler:&v14];
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v14, v15, v16, v17);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v21[5], v9);
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = v2;
  if (v2 && ([v2 purchase], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    uint64_t v5 = [v3 purchase];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)serviceProviderPurchasesWithRequest:(id)a3 inRegion:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  uint64_t v12 = [(PKPaymentWebService *)self context];
  uint64_t v13 = v12;
  if (!v9)
  {
    id v9 = [v12 primaryRegionIdentifier];
  }
  uint64_t v14 = [v13 regionForIdentifier:v9];
  uint64_t v15 = [v13 deviceID];
  id v16 = (void *)v15;
  if (v14 && v15)
  {
    [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v8];
    uint64_t v17 = [v14 paymentServicesURL];
    [(PKPaymentWebService *)self _appleAccountInformation];
    id v28 = self;
    id v18 = v9;
    id v19 = v14;
    uint64_t v20 = v13;
    id v21 = v10;
    id v23 = v22 = v11;
    uint64_t v24 = [v8 _urlRequestWithServiceURL:v17 deviceIdentifier:v16 appleAccountInformation:v23];

    unint64_t v11 = v22;
    id v10 = v21;
    uint64_t v13 = v20;
    uint64_t v14 = v19;
    id v9 = v18;

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __79__PKPaymentWebService_serviceProviderPurchasesWithRequest_inRegion_completion___block_invoke;
    v29[3] = &unk_1E56E0EC8;
    id v30 = v18;
    id v31 = v10;
    [(PKWebService *)v28 performRequest:v24 taskIdentifier:v11 completionHandler:v29];

LABEL_17:
    goto LABEL_18;
  }
  if (v14)
  {
    if (v15) {
      goto LABEL_8;
    }
  }
  else
  {
    id v25 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v9;
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Can't ask for purchases, region %{public}@ unknown", buf, 0xCu);
    }

    if (v16)
    {
LABEL_8:
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
  }
  id v26 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Can't ask for purchases, no deviceID", buf, 2u);
  }

  if (v10)
  {
LABEL_16:
    uint64_t v24 = [(PKPaymentWebService *)self _errorWithResult:0 data:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], v24);
    goto LABEL_17;
  }
LABEL_18:

  return v11;
}

void __79__PKPaymentWebService_serviceProviderPurchasesWithRequest_inRegion_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v10;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Purchases request failed with error %@", buf, 0xCu);
    }
    uint64_t v17 = 0;
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = +[PKWebServiceResponse responseWithData:v7];
    [v11 purchases];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "setRegionIdentifier:", *(void *)(a1 + 32), (void)v19);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v14);
    }
    uint64_t v17 = v12;
  }

  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, NSObject *, void *))(v18 + 16))(v18, v17, v10);
  }
}

- (unint64_t)serviceProviderPurchaseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPaymentWebService *)self primaryBrokerURL];
  id v10 = [[PKPaymentServiceProviderPurchaseRequest alloc] initWithPurchaseIdentifier:v7];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
  unint64_t v11 = [(PKPaymentWebService *)self _appleAccountInformation];
  uint64_t v12 = [(PKPaymentServiceProviderPurchaseRequest *)v10 _urlRequestWithServiceURL:v9 appleAccountInformation:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PKPaymentWebService_serviceProviderPurchaseWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56DF250;
  id v16 = v6;
  id v13 = v6;
  [(PKWebService *)self performRequest:v12 taskIdentifier:v8 completionHandler:v15];

  return v8;
}

void __72__PKPaymentWebService_serviceProviderPurchaseWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = v10;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Purchase request failed with error %@", (uint8_t *)&v16, 0xCu);
    }

    id v13 = 0;
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = +[PKWebServiceResponse responseWithData:v7];
    uint64_t v12 = [v11 purchases];
    id v13 = [v12 firstObject];
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v13, v10);
  }
}

- (unint64_t)performAction:(id)a3 onServiceProviderPurchase:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  uint64_t v12 = [(PKPaymentWebService *)self primaryBrokerURL];
  id v13 = [[PKPaymentServiceProviderPerformActionRequest alloc] initWithAction:v10 purchase:v9];

  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v13];
  uint64_t v14 = [(PKPaymentWebService *)self _appleAccountInformation];
  uint64_t v15 = [(PKPaymentServiceProviderPerformActionRequest *)v13 _urlRequestWithServiceURL:v12 appleAccountInformation:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __74__PKPaymentWebService_performAction_onServiceProviderPurchase_completion___block_invoke;
  v18[3] = &unk_1E56DF250;
  id v19 = v8;
  id v16 = v8;
  [(PKWebService *)self performRequest:v15 taskIdentifier:v11 completionHandler:v18];

  return v11;
}

void __74__PKPaymentWebService_performAction_onServiceProviderPurchase_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    id v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Perform action request failed with error %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v12 = 0;
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = +[PKWebServiceResponse responseWithData:v7];
    uint64_t v12 = [v11 updatedPurchase];
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v12, v10);
  }
}

- (unint64_t)networkManifestWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentWebService *)self context];
  id v6 = [v5 configuration];
  id v7 = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice deviceRegion];
  id v8 = [v6 heroImageManifestURLForRegion:v7];

  unint64_t v9 = [(PKWebService *)self nextTaskID];
  if (v8)
  {
    id v10 = objc_alloc_init(PKPaymentNetworkCardImagesManifestRequest);
    unint64_t v11 = [(PKPaymentWebService *)self _appleAccountInformation];
    uint64_t v12 = [(PKPaymentNetworkCardImagesManifestRequest *)v10 _urlRequestWithServiceURL:v8 appleAccountInformation:v11];

    [(PKWebService *)self performRequest:v12 taskIdentifier:v9 completionHandler:v4];
  }
  else
  {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
  }

  return v9;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = (NSURLSession *)a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = (uint64_t)v9;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Task finish download: %@", buf, 0xCu);
  }

  if (self->_backgroundSession == v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10];
    uint64_t v13 = [v9 taskIdentifier];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v9 originalRequest];
      int v15 = [v14 URL];
      *(_DWORD *)buf = 134218242;
      uint64_t v35 = v13;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Finished downloading task %lu: %@", buf, 0x16u);
    }
    id v16 = (void *)MEMORY[0x192FDC630]();
    uint64_t v17 = [(PKPaymentWebService *)self backgroundContext];
    uint64_t v18 = [v17 backgroundDownloadRecordForTaskIdentifier:v13];

    if (v18)
    {
      switch([v18 taskType])
      {
        case 1:
          id v19 = [v9 response];
          [(PKWebService *)self logResponse:v19 withData:v12];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = [v9 taskIdentifier];
            *(_DWORD *)buf = 134217984;
            uint64_t v35 = v20;
            _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Handling passes query task %lu", buf, 0xCu);
          }

          [(PKPaymentWebService *)self _handlePassListDownloadTask:v9 data:v12];
          break;
        case 2:
          id v23 = [v9 response];
          [(PKWebService *)self logResponse:v23 withData:v12];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [v9 taskIdentifier];
            *(_DWORD *)buf = 134217984;
            uint64_t v35 = v24;
            _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Handling pass download task %lu", buf, 0xCu);
          }

          [(PKPaymentWebService *)self _handlePassDownloadTask:v9 data:v12];
          break;
        case 3:
          id v33 = v16;
          id v25 = [v9 response];
          uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"<omitted>: %lu bytes", objc_msgSend(v12, "length"));
          id v27 = [v26 dataUsingEncoding:4];
          [(PKWebService *)self logResponse:v25 withData:v27];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = [v9 taskIdentifier];
            *(_DWORD *)buf = 134217984;
            uint64_t v35 = v28;
            _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Handling remote asset task %lu", buf, 0xCu);
          }

          [(PKPaymentWebService *)self _handleRemoteURLAssetDownloadTask:v9 data:v12];
          id v16 = v33;
          break;
        case 4:
          unint64_t v29 = [v9 response];
          [(PKWebService *)self logResponse:v29 withData:v12];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = [v9 taskIdentifier];
            *(_DWORD *)buf = 134217984;
            uint64_t v35 = v30;
            _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Handling Device check in task %lu", buf, 0xCu);
          }

          [(PKPaymentWebService *)self _handleDeviceCheckInTask:v9 downloadRecord:v18 data:v12];
          break;
        default:
          id v31 = [v9 response];
          [(PKWebService *)self logResponse:v31 withData:v12];

          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_25;
          }
          uint64_t v32 = [v9 taskIdentifier];
          *(_DWORD *)buf = 134217984;
          uint64_t v35 = v32;
          long long v22 = "Unknown task type for task %lu";
          goto LABEL_24;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v9 taskIdentifier];
        *(_DWORD *)buf = 134217984;
        uint64_t v35 = v21;
        long long v22 = "***** No match found for task %lu *****: FILE A BUG!";
LABEL_24:
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      }
LABEL_25:
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = (NSURLSession *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_backgroundSession == v8)
  {
    unint64_t v11 = (void *)MEMORY[0x192FDC630]();
    uint64_t v12 = [(PKPaymentWebService *)self backgroundContext];
    uint64_t v13 = objc_msgSend(v12, "backgroundDownloadRecordForTaskIdentifier:", objc_msgSend(v9, "taskIdentifier"));

    if ([v13 taskType] == 5)
    {
      id v14 = v13;
      int v15 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v14 credentialIdentifier];
        *(_DWORD *)buf = 138412546;
        id v23 = v16;
        __int16 v24 = 2048;
        uint64_t v25 = [v9 taskIdentifier];
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Receiving response data for background credential registration task: %@ (%lu)", buf, 0x16u);
      }
      uint64_t v17 = [v14 responseData];
      uint64_t v18 = v17;
      if (v17)
      {
        id v19 = (void *)[v17 mutableCopy];
        [v19 appendData:v10];
        uint64_t v20 = (void *)[v19 copy];
        [v14 setResponseData:v20];
      }
      else
      {
        [v14 setResponseData:v10];
      }
      [(PKPaymentWebService *)self _archiveContext];
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PKPaymentWebService;
    [(PKWebService *)&v21 URLSession:v8 dataTask:v9 didReceiveData:v10];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  v111[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = (NSURLSession *)a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Task Completed: %@", buf, 0xCu);
  }

  if (self->_backgroundSession != v8)
  {
    v87.receiver = self;
    v87.super_class = (Class)PKPaymentWebService;
    [(PKWebService *)&v87 URLSession:v8 task:v9 didCompleteWithError:v10];
    goto LABEL_54;
  }
  uint64_t v12 = (void *)MEMORY[0x192FDC630]();
  uint64_t v13 = [v9 response];
  v84 = [v9 originalRequest];
  id v14 = [(PKPaymentWebService *)self backgroundContext];
  int v15 = objc_msgSend(v14, "backgroundDownloadRecordForTaskIdentifier:", objc_msgSend(v9, "taskIdentifier"));
  objc_opt_class();
  v85 = v14;
  v86 = v15;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v13 statusCode];
    BOOL v17 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v16 == 401)
    {
      if (v17)
      {
        uint64_t v18 = [v9 taskIdentifier];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Task %lu Received Status Code 401.", buf, 0xCu);
      }

      int v15 = v86;
      if (v86 && [v86 retryCount] <= 1)
      {
        v105[0] = MEMORY[0x1E4F143A8];
        v105[1] = 3221225472;
        v105[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke;
        v105[3] = &unk_1E56EE810;
        v105[4] = self;
        id v106 = v84;
        id v107 = v86;
        id v108 = v14;
        [(PKPaymentWebService *)self handleAuthenticationFailureWithCompletionHandler:v105];
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [v86 retryCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v21;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Request failed after %lu retries. Aborting.", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v17)
      {
        uint64_t v19 = [v9 taskIdentifier];
        uint64_t v20 = [v9 originalRequest];
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Task %lu completed: %@", buf, 0x16u);

        id v14 = v85;
      }

      int v15 = v86;
    }
  }
  v83 = self;
  uint64_t v22 = [v15 taskType];
  uint64_t v23 = v22;
  if (!v10)
  {
    if (v22 == 3) {
      goto LABEL_23;
    }
LABEL_28:
    uint64_t v42 = v86;
    if ([v86 taskType] != 4)
    {
      BOOL v51 = v23 == 5;
      id v31 = v83;
      if (!v51) {
        goto LABEL_51;
      }
      v77 = v13;
      id v52 = v86;
      long long v53 = [v52 credentialIdentifier];
      long long v54 = [PKPaymentRegisterCredentialResponse alloc];
      uint64_t v55 = [v52 responseData];
      long long v56 = [(PKPaymentRegisterCredentialResponse *)v54 initWithData:v55];

      uint64_t v57 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v58 = [v9 taskIdentifier];
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v58;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2112;
        v110 = v56;
        LOWORD(v111[0]) = 2112;
        *(id *)((char *)v111 + 2) = v10;
        _os_log_impl(&dword_190E10000, v57, OS_LOG_TYPE_DEFAULT, "Background credential registration task (%lu) for credential %@ completed with response %@, error %@", buf, 0x2Au);
      }
      oslog = v57;

      id WeakRetained = objc_loadWeakRetained((id *)&v83->_backgroundDelegate);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_692;
      aBlock[3] = &unk_1E56DB960;
      id v60 = WeakRetained;
      id v89 = v60;
      v90 = v83;
      unint64_t v41 = v53;
      v91 = v41;
      uint64_t v40 = v56;
      v92 = v40;
      id v93 = v10;
      v73 = _Block_copy(aBlock);
      queue = dispatch_get_global_queue(21, 0);
      v75 = v60;
      if (PKSharingDelayAttestation())
      {
        v81 = v12;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, oslog, OS_LOG_TYPE_DEFAULT, "Delay attestation is enabled", buf, 2u);
        }

        dispatch_time_t v61 = dispatch_time(0, 20000000000);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __dispatch_after_ar_block_invoke;
        v110 = (PKPaymentRegisterCredentialResponse *)&unk_1E56D8360;
        v111[0] = v73;
        id v62 = v73;
        dispatch_time_t v63 = v61;
        v64 = queue;
        dispatch_after(v63, queue, buf);

        uint64_t v12 = v81;
      }
      else
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __dispatch_async_ar_block_invoke_14;
        v110 = (PKPaymentRegisterCredentialResponse *)&unk_1E56D8360;
        v111[0] = v73;
        id v82 = v73;
        v64 = queue;
        dispatch_async(queue, buf);
      }
LABEL_45:
      id v14 = v85;
LABEL_49:

      uint64_t v13 = v77;
      goto LABEL_50;
    }
    v77 = v13;
    v80 = v12;
    id v43 = v86;
    uint64_t v44 = v83;
    id v45 = (PKPaymentRegisterCredentialResponse *)objc_loadWeakRetained((id *)&v83->_backgroundDelegate);
    if (v10)
    {
      char v46 = 0;
      uint64_t v47 = 0;
      id v48 = v86;
    }
    else
    {
      v65 = [v43 responseData];
      v66 = +[PKWebServiceResponse responseWithData:v65];

      if (v66)
      {
        uint64_t v47 = [v66 action];

        char v46 = 1;
      }
      else
      {
        char v46 = 0;
        uint64_t v47 = 0;
      }
      id v48 = v86;
      uint64_t v44 = v83;
    }
LABEL_48:
    v67 = dispatch_get_global_queue(21, 0);
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_691;
    v94[3] = &unk_1E56EE858;
    v95 = v45;
    v96 = v44;
    char v99 = v46;
    id v97 = v48;
    uint64_t v98 = v47;
    v68 = v94;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __dispatch_async_ar_block_invoke_14;
    v110 = (PKPaymentRegisterCredentialResponse *)&unk_1E56D8360;
    v111[0] = v68;
    unint64_t v41 = v45;
    id v69 = v48;
    dispatch_async(v67, buf);

    uint64_t v40 = v95;
    uint64_t v12 = v80;
    id v14 = v85;
    id v31 = v44;
    goto LABEL_49;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [v9 taskIdentifier];
    [v9 originalRequest];
    uint64_t v26 = v25 = v13;
    [v26 URL];
    v76 = v8;
    id v27 = v78 = v12;
    uint64_t v28 = [v10 localizedDescription];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v24;
    id v14 = v85;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2112;
    v110 = v28;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Error performing background download task %lu: %@. %@", buf, 0x20u);

    uint64_t v13 = v25;
    id v8 = v76;
    uint64_t v12 = v78;
  }

  if (v23 != 2)
  {
    if (v23 == 3)
    {
LABEL_23:
      id v29 = v86;
      uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
      [v29 removeRemoteURLAssetForTaskIdentifier:v30];

      id v14 = v85;
      id v31 = v83;
      if ([v29 hasOutstandingRemoteAssetTasks])
      {
LABEL_50:
        uint64_t v42 = v86;

        goto LABEL_51;
      }
      v77 = v13;
      v79 = v12;
      uint64_t v32 = [v29 passURL];
      id v33 = [(PKPaymentWebService *)v83 _passWithFileURL:v32];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [v33 organizationName];
        uint64_t v35 = [v33 serialNumber];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v35;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Asset downloads complete for %@:%@ -- delivering pass", buf, 0x16u);
      }
      id v36 = objc_loadWeakRetained((id *)&v83->_backgroundDelegate);
      id v37 = dispatch_get_global_queue(21, 0);
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_689;
      v100[3] = &unk_1E56DB988;
      id v101 = v36;
      v102 = v83;
      id v103 = v33;
      id v104 = v32;
      uint64_t v38 = v100;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __dispatch_async_ar_block_invoke_14;
      v110 = (PKPaymentRegisterCredentialResponse *)&unk_1E56D8360;
      v111[0] = v38;
      id v39 = v36;
      uint64_t v40 = v33;
      unint64_t v41 = v32;
      dispatch_async(v37, buf);

      uint64_t v12 = v79;
      goto LABEL_45;
    }
    goto LABEL_28;
  }
  id v31 = v83;
  id v49 = [(PKPaymentWebService *)v83 context];
  [v49 atomicallyUpdatePrimaryRegion:&__block_literal_global_688];

  [(PKPaymentWebService *)v83 _archiveContext];
  uint64_t v42 = v86;
  if ([v86 taskType] == 4)
  {
    v77 = v13;
    v80 = v12;
    id v50 = v86;
    uint64_t v44 = v83;
    id v48 = v86;
    id v45 = (PKPaymentRegisterCredentialResponse *)objc_loadWeakRetained((id *)&v83->_backgroundDelegate);
    char v46 = 0;
    uint64_t v47 = 0;
    goto LABEL_48;
  }
LABEL_51:
  objc_msgSend(v14, "removeBackgroundDownloadRecordForTaskIdentifier:", objc_msgSend(v9, "taskIdentifier", oslog));
  [(PKPaymentWebService *)v31 _archiveBackgroundContext];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v70 = [(PKPaymentWebService *)v31 backgroundContext];
    v71 = [v70 remainingTasks];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v71;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Remaining background tasks: %@", buf, 0xCu);

    uint64_t v42 = v86;
  }

LABEL_54:
}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 176);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_2;
  v9[3] = &unk_1E56EE7E8;
  uint64_t v15 = a2;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E56D8360;
  id v17 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 72);
  if (v1 == 2)
  {
    id v4 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v11) = 0;
    id v10 = "Credential Renewal Failed.";
LABEL_13:
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 2u);
    goto LABEL_14;
  }
  if (v1 == 1)
  {
    id v4 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v11) = 0;
    id v10 = "Credential Renewal Rejected by User.";
    goto LABEL_13;
  }
  if (v1) {
    return;
  }
  uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Credentials renewed. Retrying request.", (uint8_t *)&v11, 2u);
  }

  id v4 = [*(id *)(a1 + 32) mutableCopy];
  id v5 = [*(id *)(a1 + 40) authorizationHeader];
  [v4 setValue:v5 forHTTPHeaderField:@"Authorization"];

  [*(id *)(a1 + 48) logRequest:v4];
  id v6 = [*(id *)(*(void *)(a1 + 48) + 120) downloadTaskWithRequest:v4];
  id v7 = +[PKPaymentBackgroundDownloadRecord taskWithType:](PKPaymentBackgroundDownloadRecord, "taskWithType:", [*(id *)(a1 + 56) taskType]);
  objc_msgSend(v7, "setRetryCount:", objc_msgSend(*(id *)(a1 + 56), "retryCount") + 1);
  objc_msgSend(*(id *)(a1 + 64), "addBackgroundDownloadRecord:forTaskIdentifier:", v7, objc_msgSend(v6, "taskIdentifier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 taskIdentifier];
    id v9 = [v4 URL];
    int v11 = 134218242;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu: %@", (uint8_t *)&v11, 0x16u);
  }
  [v6 resume];

LABEL_14:
}

uint64_t __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_686(uint64_t a1, void *a2)
{
  return [a2 regionBySettingLastUpdatedTag:0];
}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_689(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_2_690;
  v4[3] = &unk_1E56D8AE0;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 paymentWebService:v2 didDownloadPassRemoteAssets:v3 completion:v4];
}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_2_690(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up download cache copy of pass: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_691(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = [*(id *)(a1 + 48) region];
  uint64_t v6 = [*(id *)(a1 + 48) identifier];
  [v2 paymentWebService:v3 deviceCheckInReturnedAction:v5 success:v4 region:v7 identifier:v6];
}

uint64_t __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_692(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentWebService:*(void *)(a1 + 40) didRegisterCredentialWithIdentifier:*(void *)(a1 + 48) response:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentWebService;
  uint64_t v6 = (NSURLSession *)a3;
  [(PKWebService *)&v11 URLSession:v6 didBecomeInvalidWithError:a4];
  backgroundSession = self->_backgroundSession;

  if (backgroundSession == v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundDelegate);

    if (WeakRetained)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_backgroundDelegate);
      objc_msgSend(v9, "paymentWebServiceBackgroundSessionDidBecomeInvalid:", self, v11.receiver, v11.super_class);
    }
    id v10 = self->_backgroundSession;
    self->_backgroundSession = 0;
  }
}

- (void)_startBackgroundURLSessionWithIdentifier:(id)a3 context:(id)a4 backgroundDelegate:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = (void (**)(void))a6;
  if (!self->_backgroundSession)
  {
    id v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Starting background URL session…", buf, 2u);
    }

    objc_storeStrong((id *)&self->_backgroundContext, a4);
    BOOL v15 = [(PKPaymentWebService *)self canBypassTrustValidation];
    if (v15)
    {
      id v16 = [v10 stringByAppendingString:@"-nonEV"];
    }
    else
    {
      id v16 = v10;
    }
    id v17 = v16;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F18DD0], "backgroundSessionConfigurationWithIdentifier:", v16, v11);
    objc_msgSend(v18, "set_overridesBackgroundSessionAutoRedirect:", 1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = @"YES";
      if (v15) {
        uint64_t v19 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      id v29 = v17;
      __int16 v30 = 2114;
      id v31 = v19;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Initializing background URL session: %@ with extended validation: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v18, "set_performsEVCertCheck:", !v15);
    uint64_t v20 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v21 = [v20 bundleIdentifier];

    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:v21];
    objc_msgSend(v18, "set_appleIDContext:", v22);
    if (objc_opt_respondsToSelector()) {
      [v12 paymentWebService:self willCreateSessionWithConfiguration:v18];
    }
    uint64_t v23 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v18 delegate:self delegateQueue:self->_backgroundSessionDelegateQueue];
    backgroundSession = self->_backgroundSession;
    self->_backgroundSession = v23;

    objc_storeWeak((id *)&self->_backgroundDelegate, v12);
    uint64_t v25 = self->_backgroundSession;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __102__PKPaymentWebService__startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke;
    v27[3] = &unk_1E56EE880;
    void v27[4] = self;
    [(NSURLSession *)v25 getTasksWithCompletionHandler:v27];

    id v11 = v26;
  }
  if (v13) {
    v13[2](v13);
  }
}

uint64_t __102__PKPaymentWebService__startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = [a4 count];
  if (!result)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "No pending background download tasks, cleaning up download cache", v7, 2u);
    }

    return [*(id *)(a1 + 32) _cleanupPassDownloadCache];
  }
  return result;
}

- (BOOL)_hasConfiguration
{
  uint64_t v2 = [(PKPaymentWebService *)self context];
  uint64_t v3 = [v2 configurationDate];

  if (v3)
  {
    uint64_t v4 = [v2 configuration];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_updateRequestWithCurrentTargetDevice:(id)a3
{
}

- (id)_passWithFileURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_passesByLocalURL objectForKey:v4];
  if (!v5)
  {
    id v6 = +[PKObject createWithFileURL:v4 warnings:0 error:0];
    if ([v6 passType] == 1 && (id v7 = v6) != 0)
    {
      BOOL v5 = v7;
      uint64_t v8 = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice secureElementIdentifiers];
      [v5 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v8];

      [(NSMutableDictionary *)self->_passesByLocalURL setObject:v5 forKey:v4];
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "*** ERROR ***: Couldn't find local pass %@ for downloaded asset.", (uint8_t *)&v11, 0xCu);
      }

      BOOL v5 = 0;
    }
  }
  return v5;
}

- (void)_backgroundDownloadCloudStoreAssetsforItem:(id)a3 cloudStoreCoordinatorDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke;
  v12[3] = &unk_1E56D8AB8;
  id v13 = v6;
  id v14 = v7;
  BOOL v15 = self;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(backgroundDownloadQueue, block);
}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_2;
  v3[3] = &unk_1E56EE8D0;
  v3[4] = a1[6];
  id v4 = v1;
  [v4 downloadAssetWithCloudStoreCoordinatorDelegate:v2 completion:v3];
}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 176);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_3;
  v15[3] = &unk_1E56EE8A8;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v10;
  uint64_t v17 = v11;
  id v18 = v8;
  id v19 = v7;
  char v20 = a3;
  id v12 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E56D8360;
  id v22 = v12;
  id v13 = v7;
  id v14 = v8;
  dispatch_async(v9, block);
}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_3(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) recordName];
  uint64_t v3 = [*(id *)(a1 + 40) backgroundContext];
  id v4 = [v3 backgroundDownloadRecordForRecordName:v2];

  BOOL v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v2;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    id v27 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Finished downloading task with recordName \"%@\", taskRecord:%@, error: %@,", buf, 0x20u);
  }

  if (v4)
  {
    if (*(void *)(a1 + 56) && !*(void *)(a1 + 48)) {
      objc_msgSend(*(id *)(a1 + 40), "_handleRemoteCloudStoreAssetForRecordName:taskRecord:data:shouldWriteData:", v2, v4);
    }
    [v4 removeRemoteCloudStoreAssetForRecordName:v2];
    if (([v4 hasOutstandingRemoteAssetTasks] & 1) == 0)
    {
      id v7 = [v4 passURL];
      id v8 = [*(id *)(a1 + 40) _passWithFileURL:v7];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v8 organizationName];
        id v10 = [v8 serialNumber];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Asset downloads complete for %@:%@ -- delivering pass", buf, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 248));
      id v12 = dispatch_get_global_queue(21, 0);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_707;
      v21[3] = &unk_1E56DB988;
      uint64_t v13 = *(void *)(a1 + 40);
      id v22 = WeakRetained;
      uint64_t v23 = v13;
      id v24 = v8;
      id v25 = v7;
      id v14 = v21;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __dispatch_async_ar_block_invoke_14;
      id v27 = &unk_1E56D8360;
      id v28 = v14;
      id v15 = v7;
      id v16 = v8;
      id v17 = WeakRetained;
      dispatch_async(v12, buf);
    }
  }
  id v18 = [*(id *)(a1 + 40) backgroundContext];
  [v18 removeBackgroundDownloadRecordForRecordName:v2];

  [*(id *)(a1 + 40) _archiveBackgroundContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [*(id *)(a1 + 40) backgroundContext];
    char v20 = [v19 remainingTasks];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v20;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Remaining background tasks: %@", buf, 0xCu);
  }
}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_707(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_2_708;
  v4[3] = &unk_1E56D8AE0;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 paymentWebService:v2 didDownloadPassRemoteAssets:v3 completion:v4];
}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_2_708(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up download cache copy of pass: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

- (void)_handleRemoteAssetDownloadForManifestItem:(id)a3 taskPassURL:(id)a4 data:(id)a5 shouldWriteData:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    id v12 = [(PKPaymentWebService *)self _passWithFileURL:a4];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = [v12 dataAccessor];
      id v15 = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice secureElementIdentifiers];
      id v16 = [v14 remoteAssetManagerForSEIDs:v15];

      id v27 = 0;
      char v17 = [v16 addRemoteAssetData:v11 shouldWriteData:v6 forManifestItem:v10 error:&v27];
      id v18 = v27;
      id v19 = [v11 SHA1Hash];
      char v20 = [v19 hexEncoding];

      if ((PKCachedFileForSHA1Exists(v20) & 1) == 0) {
        PKCacheFile(v11, v20);
      }
      if ((v17 & 1) == 0)
      {
        uint64_t v21 = PKLogFacilityTypeGetObject(6uLL);
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

        if (v22)
        {
          uint64_t v23 = [v18 userInfo];
          id v24 = [v23 objectForKey:*MEMORY[0x1E4F28A50]];

          if (v24) {
            id v25 = v24;
          }
          else {
            id v25 = v18;
          }
          uint64_t v26 = [v25 localizedDescription];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = v26;
            _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "*** ERROR ***: Could not add asset to pass: %@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (void)_handleRemoteURLAssetDownloadTask:(id)a3 data:(id)a4
{
  BOOL v6 = NSNumber;
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "taskIdentifier"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [(PKPaymentWebService *)self backgroundContext];
  uint64_t v10 = [v8 taskIdentifier];

  id v11 = [v9 backgroundDownloadRecordForTaskIdentifier:v10];

  id v12 = [v11 remoteAssetsByTaskIdentifier];
  uint64_t v13 = [v12 objectForKey:v15];

  id v14 = [v11 passURL];
  [(PKPaymentWebService *)self _handleRemoteAssetDownloadForManifestItem:v13 taskPassURL:v14 data:v7 shouldWriteData:1];
}

- (void)_handleRemoteCloudStoreAssetForRecordName:(id)a3 taskRecord:(id)a4 data:(id)a5 shouldWriteData:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v11 remoteAssetsByRecordName];
  id v15 = [v13 objectForKey:v12];

  id v14 = [v11 passURL];

  [(PKPaymentWebService *)self _handleRemoteAssetDownloadForManifestItem:v15 taskPassURL:v14 data:v10 shouldWriteData:v6];
}

- (void)_handlePassListDownloadTask:(id)a3 data:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__54;
  id v48 = __Block_byref_object_dispose__54;
  id v49 = 0;
  id v8 = [v6 response];
  id v9 = [v6 error];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  void v41[2] = __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke;
  v41[3] = &unk_1E56DCAF0;
  id v43 = &v44;
  id v10 = v7;
  id v42 = v10;
  [(PKPaymentWebService *)self _resultForResponse:v8 error:v9 successHandler:v41];

  id v11 = [v6 originalRequest];
  id v12 = [MEMORY[0x1E4F18DA0] propertyForKey:@"regionPushTopic" inRequest:v11];
  uint64_t v13 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Region push topic: %@", (uint8_t *)&buf, 0xCu);
  }

  id v14 = [(id)v45[5] devicePassSerialNumbers];
  if (v14)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundDelegate);
    id v16 = dispatch_get_global_queue(21, 0);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke_710;
    v36[3] = &unk_1E56DB988;
    id v37 = WeakRetained;
    uint64_t v38 = self;
    id v39 = v14;
    id v40 = v12;
    char v17 = v36;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v52 = __dispatch_async_ar_block_invoke_14;
    long long v53 = &unk_1E56D8360;
    id v54 = v17;
    id v18 = WeakRetained;
    dispatch_async(v16, &buf);
  }
  id v19 = [(id)v45[5] passURLs];
  if ([v19 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v13 = v19;
    uint64_t v20 = [v13 countByEnumeratingWithState:&v32 objects:v50 count:16];
    if (v20)
    {
      uint64_t v29 = v14;
      id v21 = v6;
      BOOL v22 = v12;
      uint64_t v23 = v11;
      id v24 = v10;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v13);
          }
          -[PKPaymentWebService backgroundDownloadPassAtURL:](self, "backgroundDownloadPassAtURL:", *(void *)(*((void *)&v32 + 1) + 8 * i), v29);
        }
        uint64_t v20 = [v13 countByEnumeratingWithState:&v32 objects:v50 count:16];
      }
      while (v20);
      id v10 = v24;
      id v11 = v23;
      id v12 = v22;
      id v6 = v21;
      id v14 = v29;
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "*** WARNING ***: No results returned for pass list", (uint8_t *)&buf, 2u);
  }

  id v27 = [(id)v45[5] lastUpdatedTag];
  if (v27)
  {
    id v28 = [(PKPaymentWebService *)self context];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke_711;
    v30[3] = &unk_1E56EE200;
    id v31 = v27;
    [v28 atomicallyUpdatePrimaryRegion:v30];

    [(PKPaymentWebService *)self _archiveContext];
  }

  _Block_object_dispose(&v44, 8);
}

BOOL __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

uint64_t __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke_710(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentWebService:*(void *)(a1 + 40) didDownloadSerialNumbersForInstalledPasses:*(void *)(a1 + 48) inRegion:*(void *)(a1 + 56)];
}

uint64_t __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke_711(uint64_t a1, void *a2)
{
  return [a2 regionBySettingLastUpdatedTag:*(void *)(a1 + 32)];
}

- (void)_handlePassDownloadTask:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 response];
  id v9 = [v7 error];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke;
  v10[3] = &unk_1E56EE8F8;
  void v10[4] = self;
  [(PKPaymentWebService *)self _passWithData:v6 response:v8 error:v9 completion:v10];
}

void __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(id **)(a1 + 32);
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained(v6 + 31);
    id v8 = dispatch_get_global_queue(21, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke_2;
    v13[3] = &unk_1E56D8AB8;
    uint64_t v9 = *(void *)(a1 + 32);
    id v14 = WeakRetained;
    uint64_t v15 = v9;
    id v16 = v5;
    id v10 = v13;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E56D8360;
    id v18 = v10;
    id v11 = WeakRetained;
    dispatch_async(v8, block);
  }
  else
  {
    id v12 = [v6 context];
    [v12 atomicallyUpdatePrimaryRegion:&__block_literal_global_713];

    [*(id *)(a1 + 32) _archiveContext];
  }
}

uint64_t __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentWebService:*(void *)(a1 + 40) didDownloadPass:*(void *)(a1 + 48)];
}

uint64_t __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 regionBySettingLastUpdatedTag:0];
}

- (void)_handleDeviceCheckInTask:(id)a3 downloadRecord:(id)a4 data:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    backgroundDownloadQueue = self->_backgroundDownloadQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __68__PKPaymentWebService__handleDeviceCheckInTask_downloadRecord_data___block_invoke;
    v11[3] = &unk_1E56D8AB8;
    id v12 = v7;
    id v13 = v8;
    id v14 = self;
    id v10 = v11;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E56D8360;
    id v16 = v10;
    dispatch_async(backgroundDownloadQueue, block);
  }
}

uint64_t __68__PKPaymentWebService__handleDeviceCheckInTask_downloadRecord_data___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setResponseData:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 _archiveBackgroundContext];
}

- (void)_handleRetryAfterTSMSyncForPushTopic:(id)a3 withRequest:(id)a4 taskIdentifier:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unint64_t v13 = [(PKWebService *)self webServiceTaskIdentifierForTaskIdentifier:a5];
  id v14 = (void *)MEMORY[0x192FDC630]();
  os_unfair_lock_lock(&self->_delegateLock);
  uint64_t v15 = [(NSHashTable *)self->_delegates allObjects];
  id v16 = (void *)[v15 copy];

  os_unfair_lock_unlock(&self->_delegateLock);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v21++) paymentWebService:self didQueueTSMConnectionForTaskID:v13];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v19);
  }

  targetDevice = self->_targetDevice;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __105__PKPaymentWebService__handleRetryAfterTSMSyncForPushTopic_withRequest_taskIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E56E7118;
  void v25[4] = self;
  id v26 = v11;
  id v27 = v12;
  unint64_t v28 = v13;
  id v23 = v12;
  id v24 = v11;
  [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice paymentWebService:self queueConnectionToTrustedServiceManagerForPushTopic:v10 withCompletion:v25];
}

void __105__PKPaymentWebService__handleRetryAfterTSMSyncForPushTopic_withRequest_taskIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  AnalyticsSendEvent();
  id v5 = [*(id *)(a1 + 32) urlRequestTaggedWithUniqueRequestIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logRequest:v5];
  id v6 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__PKPaymentWebService__handleRetryAfterTSMSyncForPushTopic_withRequest_taskIdentifier_completionHandler___block_invoke_2;
  v20[3] = &unk_1E56E0EC8;
  void v20[4] = v6;
  id v21 = *(id *)(a1 + 48);
  id v7 = [v6 dataTaskWithRequest:v5 completionHandler:v20];
  [v7 resume];

  id v8 = (void *)MEMORY[0x192FDC630]();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 172));
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 192) allObjects];
  id v10 = (void *)[v9 copy];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 172));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "paymentWebService:didCompleteTSMConnectionForTaskID:", *(void *)(a1 + 32), *(void *)(a1 + 56), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v13);
  }
}

void __105__PKPaymentWebService__handleRetryAfterTSMSyncForPushTopic_withRequest_taskIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) logResponse:v8 withData:v7];
    uint64_t v10 = *(void *)(a1 + 40);
    v11.receiver = *(id *)(a1 + 32);
    v11.super_class = (Class)PKPaymentWebService;
    objc_msgSendSuper2(&v11, sel_handleResponse_withError_data_task_completionHandler_, v8, v9, v7, 0, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_handleRetryAfterRegisterWithRequest:(id)a3 response:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Registering device, and then retrying same request", buf, 2u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__PKPaymentWebService__handleRetryAfterRegisterWithRequest_response_completionHandler___block_invoke;
  v14[3] = &unk_1E56EE920;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v12 = v10;
  id v13 = v8;
  [(PKPaymentWebService *)self _registerIfNeededWithResponse:v9 task:0 isRedirect:1 completion:v14];
}

void __87__PKPaymentWebService__handleRetryAfterRegisterWithRequest_response_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)long long buf = 138412290;
      id v16 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Registration failed with error %@. Aborting original request.", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Registration succeeded, retrying original request", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 32) urlRequestTaggedWithUniqueRequestIdentifier:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) logRequest:v6];
    id v7 = *(void **)(a1 + 32);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    objc_super v11 = __87__PKPaymentWebService__handleRetryAfterRegisterWithRequest_response_completionHandler___block_invoke_723;
    id v12 = &unk_1E56E0EC8;
    id v13 = v7;
    id v14 = *(id *)(a1 + 48);
    id v8 = [v7 dataTaskWithRequest:v6 completionHandler:&v9];
    objc_msgSend(v8, "resume", v9, v10, v11, v12, v13);
  }
}

void __87__PKPaymentWebService__handleRetryAfterRegisterWithRequest_response_completionHandler___block_invoke_723(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) logResponse:v7 withData:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject(0xFuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Enrolling Apple Pay Trust Key", buf, 2u);
  }

  id v9 = [v6 HTTPBody];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __101__PKPaymentWebService__handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E56EE948;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [(PKPaymentWebService *)self performApplePayTrustRegistrationWithCompletion:v13];
}

void __101__PKPaymentWebService__handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v8 = [*(id *)(a1 + 32) urlRequestTaggedWithUniqueRequestIdentifier:*(void *)(a1 + 40)];
    id v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = *(void *)(a1 + 48);
    if (!v10)
    {
      uint64_t v20 = PKLogFacilityTypeGetObject(0xFuLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust registration succeded, but no request body to modify for retry", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
      goto LABEL_21;
    }
    id v25 = 0;
    id v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:0 error:&v25];
    id v12 = v25;
    if (v12 || !v11)
    {
      if (!v11)
      {
        id v13 = @"nil";
        goto LABEL_17;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = (__CFString *)[v11 mutableCopy];
        id v14 = [v5 publicKeyHash];
        id v15 = [v14 hexEncoding];
        [(__CFString *)v13 setObject:v15 forKeyedSubscript:@"publicKeyHash"];

        id v16 = +[PKWebServiceRequest _HTTPBodyWithDictionary:v13];
        [v9 setHTTPBody:v16];

        [*(id *)(a1 + 32) logRequest:v9];
        uint64_t v17 = *(void **)(a1 + 32);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __101__PKPaymentWebService__handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest_completionHandler___block_invoke_2;
        v23[3] = &unk_1E56E0EC8;
        void v23[4] = v17;
        id v24 = *(id *)(a1 + 56);
        long long v18 = [v17 dataTaskWithRequest:v9 completionHandler:v23];
        [v18 resume];

LABEL_20:
LABEL_21:

        goto LABEL_22;
      }
    }
    id v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    BOOL v22 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust registration succeded, but could not retry request after Apple Pay Trust registration. Expected dictionary and received %@ with JSON error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
    goto LABEL_20;
  }
  long long v19 = PKLogFacilityTypeGetObject(0xFuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v27 = v7;
    _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust enrollment failed with error: %@\n", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
LABEL_22:
}

void __101__PKPaymentWebService__handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) logResponse:v7 withData:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
}

- (void)_registerIfNeededWithResponse:(id)a3 task:(id)a4 isRedirect:(BOOL)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  objc_initWeak(&location, a4);
  id v11 = a6;
  os_unfair_lock_lock(&self->_lock);
  activeRegistrationTasks = objc_loadWeakRetained(&location);

  if (activeRegistrationTasks)
  {
    id v13 = objc_loadWeakRetained(&location);
    unint64_t v14 = -[PKWebService webServiceTaskIdentifierForTaskIdentifier:](self, "webServiceTaskIdentifierForTaskIdentifier:", [v13 taskIdentifier]);

    activeRegistrationTasks = self->_activeRegistrationTasks;
    id v15 = [NSNumber numberWithUnsignedInteger:v14];
    LOBYTE(activeRegistrationTasks) = [activeRegistrationTasks containsObject:v15];
  }
  os_unfair_lock_unlock(&self->_lock);
  id v16 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v17 = objc_msgSend(v10, "pk_valueForHTTPHeaderField:", @"BrokerURL");
  long long v18 = [v16 URLWithString:v17];

  if (activeRegistrationTasks) {
    goto LABEL_4;
  }
  if (v18 && a5)
  {
    BOOL v19 = 0;
    uint64_t v20 = @"Server requested registration during HTTP Redirect";
  }
  else
  {
    id v21 = (void *)MEMORY[0x1E4F1CB10];
    BOOL v22 = objc_msgSend(v10, "pk_valueForHTTPHeaderField:", @"regionbrokerurl");
    uint64_t v23 = [v21 URLWithString:v22];

    id v24 = objc_msgSend(v10, "pk_valueForHTTPHeaderField:", @"x-pod-region");
    id v25 = [(PKPaymentWebService *)self context];
    id v26 = [v25 regionForIdentifier:v24];
    BOOL v19 = v26 != 0;

    uint64_t v20 = @"Wallet noticed missing registration during HTTP response";
    long long v18 = (void *)v23;
    if (!v23) {
      goto LABEL_4;
    }
  }
  if (!v19)
  {
    id v27 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v37 = v20;
      _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Request device registration because: %@", buf, 0xCu);
    }

    __int16 v28 = [(PKPaymentWebService *)self targetDevice];
    if (objc_opt_respondsToSelector())
    {
      id v29 = v34;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke;
      v34[3] = &unk_1E56DC9D8;
      void v34[4] = v11;
      [v28 performDeviceRegistrationForReason:v20 brokerURL:v18 completion:v34];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke_753;
        v31[3] = &unk_1E56EE970;
        id v32 = v11;
        [(PKPaymentWebService *)self registerDeviceAtBrokerURL:v18 consistencyCheckResults:0 completion:v31];
        uint64_t v30 = &v32;
        goto LABEL_18;
      }
      id v29 = v33;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke_751;
      v33[3] = &unk_1E56E9660;
      void v33[4] = v11;
      [v28 performDeviceRegistrationReturningContextForReason:v20 brokerURL:v18 completion:v33];
    }
    uint64_t v30 = (id *)(v29 + 4);
LABEL_18:

    goto LABEL_19;
  }
LABEL_4:
  (*((void (**)(id, void))v11 + 2))(v11, 0);
LABEL_19:

  objc_destroyWeak(&location);
}

void __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 0x10) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Registration failed with error %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = PKDisplayableErrorForCommonType(0, v5);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke_751(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 0x10) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    int v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Registration failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = PKDisplayableErrorForCommonType(0, v8);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
}

void __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke_753(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a2 == 1)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Registration failed with error %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = PKDisplayableErrorForCommonType(0, v6);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

- (void)_applePayTrustPublicKeyHashWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Fetching Apple Pay Trust key from NearField", buf, 2u);
    }

    id v6 = [(PKPaymentWebService *)self targetDevice];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__PKPaymentWebService__applePayTrustPublicKeyHashWithCompletion___block_invoke;
    v7[3] = &unk_1E56D8888;
    v7[4] = self;
    id v8 = v4;
    [v6 applePayTrustKeyForIdentifier:@"com.apple.wallet.applepaytrust" completion:v7];
  }
}

void __65__PKPaymentWebService__applePayTrustPublicKeyHashWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a2 publicKeyHash];
  if (v4)
  {
    id v5 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Fetched Apple Pay Trust key from with publicKeyHash: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (!a2)
    {
      id v6 = PKLogFacilityTypeGetObject(0xFuLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust Key does not exist.", buf, 2u);
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__PKPaymentWebService__applePayTrustPublicKeyHashWithCompletion___block_invoke_754;
    v8[3] = &unk_1E56EE998;
    id v7 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v7 performApplePayTrustRegistrationWithCompletion:v8];
  }
}

void __65__PKPaymentWebService__applePayTrustPublicKeyHashWithCompletion___block_invoke_754(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a2 publicKeyHash];
  id v5 = PKLogFacilityTypeGetObject(0xFuLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      int v10 = 138412290;
      id v11 = v4;
      id v7 = "Created Apple Pay Trust key with publicKeyHash: %@";
      id v8 = v5;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v10) = 0;
    id v7 = "Failed to create Apple Pay Trust Key.";
    id v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v4);
}

- (id)_downloadPassesWithURLs:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_queue_create("passQueue", 0);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = dispatch_group_create();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        dispatch_group_enter(v7);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __47__PKPaymentWebService__downloadPassesWithURLs___block_invoke;
        v15[3] = &unk_1E56EE9C0;
        id v16 = v5;
        id v17 = v6;
        long long v18 = v7;
        [(PKPaymentWebService *)self passAtURL:v12 completion:v15];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  return v6;
}

void __47__PKPaymentWebService__downloadPassesWithURLs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__PKPaymentWebService__downloadPassesWithURLs___block_invoke_2;
    v8[3] = &unk_1E56D8AB8;
    id v6 = *(NSObject **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    id v7 = v8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E56D8360;
    id v13 = v7;
    dispatch_async(v6, block);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __47__PKPaymentWebService__downloadPassesWithURLs___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

- (void)_deviceConfigurationDataWithCompletion:(id)a3
{
}

- (void)_deviceRegistrationDataWithCompletion:(id)a3
{
}

- (void)_deviceProvisioningDataIncludingDeviceMetadata:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67240192;
    v8[1] = v4;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Requesting device provisioning data including metadata: %{public}d", (uint8_t *)v8, 8u);
  }

  [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice paymentWebService:self provisioningDataIncludingDeviceMetadata:v4 withCompletionHandler:v6];
}

- (void)_deviceDataIncludingMetadataFields:(unint64_t)a3 withCompletionHandler:(id)a4
{
}

- (unint64_t)_downloadPassAtURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = objc_alloc_init(PKPaymentWebServiceRequest);
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v9];
  id v10 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v11 = [(PKWebServiceRequest *)v9 _murlRequestWithURL:v7 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__PKPaymentWebService__downloadPassAtURL_completion___block_invoke;
  v14[3] = &unk_1E56E0EC8;
  void v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  [(PKWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v14];

  return v8;
}

uint64_t __53__PKPaymentWebService__downloadPassAtURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _passWithData:a2 response:a3 error:a4 completion:*(void *)(a1 + 40)];
}

- (void)_passWithData:(id)a3 response:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, unint64_t, void, id))a6;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__54;
  __int16 v28 = __Block_byref_object_dispose__54;
  id v29 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__PKPaymentWebService__passWithData_response_error_completion___block_invoke;
  v20[3] = &unk_1E56EE7C0;
  id v14 = v10;
  long long v22 = self;
  uint64_t v23 = &v24;
  id v21 = v14;
  unint64_t v15 = [(PKPaymentWebService *)self _resultForResponse:v11 error:v12 successHandler:v20];
  if (v15 != 1)
  {
    if (!v12) {
      goto LABEL_7;
    }
    id v16 = [v12 domain];
    if ([v16 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
LABEL_8:

      goto LABEL_9;
    }
    id v17 = [v12 domain];
    if ([v17 isEqualToString:@"PKWebServiceErrorDomain"])
    {

      goto LABEL_8;
    }
    long long v18 = [v12 domain];
    char v19 = [v18 isEqualToString:@"PKPaymentWebServiceErrorDomain"];

    if ((v19 & 1) == 0)
    {
LABEL_7:
      [(PKPaymentWebService *)self _errorWithResult:v15 data:v14];
      id v16 = v12;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
LABEL_9:
  v13[2](v13, v15, v25[5], v12);

  _Block_object_dispose(&v24, 8);
}

uint64_t __63__PKPaymentWebService__passWithData_response_error_completion___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v11 = 0;
  id v3 = +[PKObject createWithData:v2 warnings:0 error:&v11];
  id v4 = v11;
  if ([v3 passType] == 1) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v3);
  }
  id v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v6 = [*(id *)(a1[5] + 256) secureElementIdentifiers];
  [v5 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v6];

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v7 = 1;
  }
  else
  {
    unint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v4 localizedDescription];
      *(_DWORD *)long long buf = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Unable to initialize pass with downloaded data: %@", buf, 0xCu);
    }
    uint64_t v7 = 3;
  }

  return v7;
}

- (void)_passOwnershipTokenForPaymentCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (!v7) {
    goto LABEL_14;
  }
  if ([v6 isRemoteCredential])
  {
    unint64_t v8 = [v6 remoteCredential];
  }
  else if ([v6 isAccountCredential])
  {
    unint64_t v8 = [v6 accountCredential];
  }
  else
  {
    if (![v6 isPeerPaymentCredential])
    {
LABEL_12:
      v7[2](v7, 0);
      goto LABEL_14;
    }
    unint64_t v8 = [v6 peerPaymentCredential];
  }
  uint64_t v9 = v8;
  id v10 = [v8 ownershipTokenIdentifier];

  if (!v10) {
    goto LABEL_12;
  }
  id v11 = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice deviceName];
  int v12 = [v11 isEqualToString:@"Apple Watch"];

  if (v12 && (PKRunningInPassd() & 1) == 0)
  {
    uint64_t v14 = objc_alloc_init(PKPaymentService);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke;
    v18[3] = &unk_1E56EE9E8;
    id v19 = v10;
    long long v20 = v7;
    void v18[4] = self;
    id v15 = v10;
    [(PKPaymentService *)v14 passOwnershipTokenWithIdentifier:v15 completion:v18];
  }
  else
  {
    targetDevice = self->_targetDevice;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke_3;
    v16[3] = &unk_1E56D8D50;
    id v17 = v7;
    [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice paymentWebService:self passOwnershipTokenWithIdentifier:v10 completion:v16];
  }
LABEL_14:
}

void __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v3 + 256);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke_2;
    v6[3] = &unk_1E56D8D50;
    id v7 = *(id *)(a1 + 48);
    [v5 paymentWebService:v3 passOwnershipTokenWithIdentifier:v4 completion:v6];
  }
}

uint64_t __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    if (objc_opt_respondsToSelector())
    {
      [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice paymentWebService:self storePassOwnershipToken:v8 withIdentifier:v6];
    }
    else
    {
      id v7 = objc_alloc_init(PKPaymentService);
      [(PKPaymentService *)v7 storePassOwnershipToken:v8 withIdentifier:v6];
    }
  }
}

- (unint64_t)_resultForResponse:(id)a3 error:(id)a4 successHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (uint64_t (**)(void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v8 statusCode];
    if (v11 == 207 || v11 == 200) {
      uint64_t v12 = v10[2](v10);
    }
    else {
      uint64_t v12 = [(PKPaymentWebService *)self _resultForUnexpectedStatusCode:v11];
    }
    unint64_t v14 = v12;
  }
  else
  {
    if (v9)
    {
      id v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v16 = [v8 URL];
        id v17 = [v16 absoluteString];
        int v18 = 138412546;
        id v19 = v17;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_error_impl(&dword_190E10000, v13, OS_LOG_TYPE_ERROR, "Error executing request: %@ error: %@", (uint8_t *)&v18, 0x16u);
      }
    }
    unint64_t v14 = 0;
  }

  return v14;
}

- (unint64_t)_resultForUnexpectedStatusCode:(int64_t)a3
{
  return 2 * (a3 == 417);
}

- (id)_errorWithResult:(unint64_t)a3 data:(id)a4
{
  return [(PKPaymentWebService *)self _errorWithResult:a3 response:0 data:a4];
}

- (id)_errorWithResult:(unint64_t)a3 response:(id)a4 data:(id)a5
{
  id v6 = a4;
  id v7 = 0;
  if (a3 <= 3 && a3 != 1)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = PKLocalizedPaymentString(&cfstr_UnexpectedErro.isa, 0);
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "statusCode"));
        [v8 setObject:v10 forKeyedSubscript:@"PKErrorHTTPResponseStatusCodeKey"];
      }
    }
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPaymentWebServiceErrorDomain" code:a3 userInfo:v8];
  }
  return v7;
}

- (id)_paymentDevice
{
  paymentDevice = self->_paymentDevice;
  if (!paymentDevice)
  {
    uint64_t v4 = objc_alloc_init(PKPaymentDevice);
    id v5 = self->_paymentDevice;
    self->_paymentDevice = v4;

    paymentDevice = self->_paymentDevice;
  }
  return paymentDevice;
}

- (id)_movePassToDownloadCache:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 serializedFileWrapper];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithSerializedRepresentation:v4];
  id v6 = [(PKPaymentWebService *)self _downloadCacheLocation];
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v23 = 0;
    char v12 = [v11 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v10 = v23;

    if ((v12 & 1) == 0 && v10)
    {
      id v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v25 = v6;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Could not create download cache at %@", buf, 0xCu);
      }
    }
  }
  CFUUIDRef v14 = CFUUIDCreate(0);
  CFStringRef v15 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14);
  id v16 = [v6 URLByAppendingPathComponent:v15];
  id v17 = [v16 URLByAppendingPathExtension:@"pkpass"];

  CFRelease(v15);
  CFRelease(v14);
  [v5 writeToURL:v17 options:1 originalContentsURL:0 error:0];
  id v18 = +[PKObject createWithFileURL:v17 warnings:0 error:0];
  if ([v18 passType] == 1) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;
  id v21 = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice secureElementIdentifiers];
  [v20 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v21];

  return v20;
}

- (id)_downloadCacheLocation
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = PKCacheDirectoryPath();
  uint64_t v4 = [v2 fileURLWithPath:v3];

  id v5 = [v4 URLByAppendingPathComponent:@"PassDownloadCache"];

  return v5;
}

- (void)_cleanupPassDownloadCache
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(PKPaymentWebService *)self _downloadCacheLocation];
  id v5 = [v4 path];
  id v6 = [v3 enumeratorAtPath:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        id v13 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", (void)v14);
        [v13 removeItemAtPath:v12 error:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_archiveContext
{
  id v4 = [(PKPaymentWebService *)self context];
  if (v4)
  {
    uint64_t v3 = [(PKPaymentWebService *)self archiver];
    [v3 archiveContext:v4];
  }
}

- (void)_archiveBackgroundContext
{
  id v4 = [(PKPaymentWebService *)self archiver];
  uint64_t v3 = [(PKPaymentWebService *)self backgroundContext];
  [v4 archiveBackgroundContext:v3];
}

- (PKPaymentWebServiceBackgroundContext)backgroundContext
{
  return (PKPaymentWebServiceBackgroundContext *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBackgroundContext:(id)a3
{
}

- (PKPaymentWebServiceArchiver)archiver
{
  return (PKPaymentWebServiceArchiver *)objc_getProperty(self, a2, 240, 1);
}

- (void)setArchiver:(id)a3
{
}

- (PKPaymentWebServiceBackgroundDelegate)backgroundDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundDelegate);
  return (PKPaymentWebServiceBackgroundDelegate *)WeakRetained;
}

- (void)setBackgroundDelegate:(id)a3
{
}

- (BOOL)sharedService
{
  return self->_sharedService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_destroyWeak((id *)&self->_backgroundDelegate);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_backgroundContext, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_backgroundSessionDelegateQueue, 0);
  objc_storeStrong((id *)&self->_backgroundDownloadQueue, 0);
  objc_storeStrong((id *)&self->_activeRegistrationTasks, 0);
  objc_storeStrong((id *)&self->_passesByLocalURL, 0);
  objc_storeStrong((id *)&self->_paymentDevice, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
}

- (unint64_t)_performAccountApplePayTrustProtocolRequest:(id)a3 originalRequest:(id)a4 taskID:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __112__PKPaymentWebService_PKAccount___performAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke;
  v18[3] = &unk_1E56F0718;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  unint64_t v16 = [(PKPaymentWebService *)self _performAccountRequest:v12 taskID:a5 responseClass:v13 completion:v18];

  return v16;
}

void __112__PKPaymentWebService_PKAccount___performAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v8 && !v5) {
    objc_msgSend(*(id *)(a1 + 32), "setHashResponse:");
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v8, v6);
  }
}

- (unint64_t)_performOptionalAccountApplePayTrustProtocolRequest:(id)a3 originalRequest:(id)a4 taskID:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!a5) {
    a5 = [(PKWebService *)self nextTaskID];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__PKPaymentWebService_PKAccount___performOptionalAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke;
  v16[3] = &unk_1E56E50E8;
  void v16[4] = self;
  id v17 = v11;
  id v18 = v12;
  id v13 = v12;
  id v14 = v11;
  [(PKWebService *)self performRequest:v10 taskIdentifier:a5 completionHandler:v16];

  return a5;
}

void __120__PKPaymentWebService_PKAccount___performOptionalAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  BOOL v11 = 1;
  if (v7 && !v9)
  {
    id v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = [v12 objectForKey:@"referenceIdentifier"];
        BOOL v11 = v13 != 0;
      }
    }
  }
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__61;
  uint64_t v34 = __Block_byref_object_dispose__61;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__61;
  __int16 v28 = __Block_byref_object_dispose__61;
  id v29 = 0;
  id v14 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __120__PKPaymentWebService_PKAccount___performOptionalAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke_16;
  v18[3] = &unk_1E56F0740;
  BOOL v23 = v11;
  id v21 = &v30;
  id v15 = v7;
  id v19 = v15;
  id v20 = *(id *)(a1 + 40);
  uint64_t v22 = &v24;
  uint64_t v16 = [v14 _resultForResponse:v8 error:v10 successHandler:v18];
  if (!v10 && v16 != 1)
  {
    id v10 = [*(id *)(a1 + 32) _errorWithResult:v16 data:v15];
  }
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v17 + 16))(v17, v31[5], v25[5], v10);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

BOOL __120__PKPaymentWebService_PKAccount___performOptionalAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke_16(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = +[PKWebServiceResponse responseWithData:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    [*(id *)(a1 + 40) setHashResponse:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  else
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "signatureResponseClass"), "responseWithData:", *(void *)(a1 + 32));
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
      || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
}

- (unint64_t)_performAccountRequest:(id)a3 taskID:(unint64_t)a4 responseClass:(Class)a5 completion:(id)a6
{
  return [(PKPaymentWebService *)self _performAccountRequest:a3 account:0 request:0 taskID:a4 responseClass:a5 completion:a6];
}

- (unint64_t)_performAccountRequest:(id)a3 account:(id)a4 request:(id)a5 taskID:(unint64_t)a6 responseClass:(Class)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (!a6) {
    a6 = [(PKWebService *)self nextTaskID];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __105__PKPaymentWebService_PKAccount___performAccountRequest_account_request_taskID_responseClass_completion___block_invoke;
  v22[3] = &unk_1E56F0790;
  void v22[4] = self;
  id v23 = v15;
  id v25 = v17;
  Class v26 = a7;
  id v24 = v16;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  [(PKWebService *)self performRequest:v14 taskIdentifier:a6 completionHandler:v22];

  return a6;
}

void __105__PKPaymentWebService_PKAccount___performAccountRequest_account_request_taskID_responseClass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__61;
  id v25 = __Block_byref_object_dispose__61;
  id v26 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__PKPaymentWebService_PKAccount___performAccountRequest_account_request_taskID_responseClass_completion___block_invoke_2;
  v15[3] = &unk_1E56F0768;
  id v10 = *(void **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v19 = &v21;
  uint64_t v20 = v11;
  id v12 = v7;
  id v18 = v12;
  uint64_t v13 = [v10 _resultForResponse:v8 error:v9 successHandler:v15];
  if (!v9 && v13 != 1)
  {
    id v9 = [*(id *)(a1 + 32) _errorWithResult:v13 data:v12];
  }
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v22[5], v9);
  }

  _Block_object_dispose(&v21, 8);
}

BOOL __105__PKPaymentWebService_PKAccount___performAccountRequest_account_request_taskID_responseClass_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[8];
  uint64_t v5 = a1[6];
  if (v2 | v3) {
    objc_msgSend(v4, "responseWithData:account:request:", v5);
  }
  else {
  uint64_t v6 = [v4 responseWithData:v5];
  }
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(a1[7] + 8) + 40) != 0;
}

- (unint64_t)_performAccountRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 taskID:[(PKWebService *)self nextTaskID] responseClass:a4 completion:v8];

  return v10;
}

- (unint64_t)_performAccountRequest:(id)a3 account:(id)a4 responseClass:(Class)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  unint64_t v13 = [(PKPaymentWebService *)self _performAccountRequest:v12 account:v11 request:0 taskID:[(PKWebService *)self nextTaskID] responseClass:a5 completion:v10];

  return v13;
}

- (unint64_t)_performAccountRequest:(id)a3 request:(id)a4 responseClass:(Class)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  unint64_t v13 = [(PKPaymentWebService *)self _performAccountRequest:v12 account:0 request:v11 taskID:[(PKWebService *)self nextTaskID] responseClass:a5 completion:v10];

  return v13;
}

- (unint64_t)generateTopUpTokenWithRequest:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
  id v11 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v12 = [v10 _urlRequestWithAppleAccountInformation:v11];

  unint64_t v13 = [(PKPaymentWebService *)self _performAccountRequest:v12 account:v9 responseClass:objc_opt_class() completion:v8];
  return v13;
}

- (unint64_t)resolveStorefrontCountryMismatchWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)_performApplyRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  unint64_t v10 = [(PKWebService *)self nextTaskID];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __88__PKPaymentWebService_PKApplyWebService___performApplyRequest_responseClass_completion___block_invoke;
  v13[3] = &unk_1E56DCBE8;
  id v14 = v8;
  Class v15 = a4;
  void v13[4] = self;
  id v11 = v8;
  [(PKWebService *)self performRequest:v9 taskIdentifier:v10 completionHandler:v13];

  return v10;
}

void __88__PKPaymentWebService_PKApplyWebService___performApplyRequest_responseClass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__82;
  __int16 v28 = __Block_byref_object_dispose__82;
  id v29 = 0;
  unint64_t v10 = *(void **)(a1 + 32);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __88__PKPaymentWebService_PKApplyWebService___performApplyRequest_responseClass_completion___block_invoke_10;
  id v19 = &unk_1E56F4D58;
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v22 = &v24;
  uint64_t v23 = v11;
  id v12 = v7;
  id v20 = v12;
  id v13 = v8;
  id v21 = v13;
  uint64_t v14 = [v10 _resultForResponse:v13 error:v9 successHandler:&v16];
  if (!v9 && v14 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v14, v12, v16, v17, v18, v19, v20);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, v25[5], v9);
  }

  _Block_object_dispose(&v24, 8);
}

BOOL __88__PKPaymentWebService_PKApplyWebService___performApplyRequest_responseClass_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 56) responseWithData:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [*(id *)(a1 + 40) allHeaderFields];
    id v6 = [v5 PKStringForKey:@"x-conversation-id"];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setConversationIdentifier:v6];
  }
  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

- (unint64_t)applicationsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [v7 applyServiceURL];
  id v9 = [(PKPaymentWebService *)self _appleAccountInformation];
  unint64_t v10 = [v7 _urlRequestWithServiceURL:v8 appleAccountInformation:v9];

  uint64_t v11 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__PKPaymentWebService_PKApplyWebService__applicationsWithRequest_completion___block_invoke;
  v15[3] = &unk_1E56F4D80;
  id v16 = v6;
  id v12 = v6;
  unint64_t v13 = [(PKPaymentWebService *)self _performApplyRequest:v10 responseClass:v11 completion:v15];

  return v13;
}

uint64_t __77__PKPaymentWebService_PKApplyWebService__applicationsWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)deleteApplicationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performApplyRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)createWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [v7 applyServiceURL];
  id v9 = [(PKPaymentWebService *)self _appleAccountInformation];
  unint64_t v10 = [v7 _urlRequestWithServiceURL:v8 appleAccountInformation:v9];

  unint64_t v11 = [(PKPaymentWebService *)self _performApplyRequest:v10 responseClass:objc_opt_class() completion:v6];
  return v11;
}

- (unint64_t)applyWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performApplyRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)submitDocumentsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performApplyRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)submitVerificationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performApplyRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)resendVerificationRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performApplyRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)termsDataWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v6];
  id v8 = [v6 baseURL];

  if (!v8)
  {
    id v9 = [(PKPaymentWebService *)self context];
    unint64_t v10 = [v9 primaryRegion];
    unint64_t v11 = [v10 applyServiceURL];
    [v6 setBaseURL:v11];
  }
  id v12 = [(PKPaymentWebService *)self _appleAccountInformation];
  unint64_t v13 = [v6 _urlRequestWithAppleAccountInformation:v12];

  unint64_t v14 = [(PKPaymentWebService *)self _performApplyRequest:v13 responseClass:objc_opt_class() completion:v7];
  return v14;
}

- (unint64_t)featureTermsDataWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 primaryRegion];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v10 = [v9 applyServiceURL];
  unint64_t v11 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v12 = [v7 _urlRequestWithServiceURL:v10 appleAccountInformation:v11];

  unint64_t v13 = [(PKPaymentWebService *)self _performApplyRequest:v12 responseClass:objc_opt_class() completion:v6];
  return v13;
}

- (unint64_t)shownTermsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performApplyRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)submitTermsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performApplyRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)augmentedProductWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentWebService *)self context];
  id v9 = [v8 primaryRegion];
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v10 = [v9 applyServiceURL];
  unint64_t v11 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v12 = [v7 _urlRequestWithServiceURL:v10 appleAccountInformation:v11];

  unint64_t v13 = [(PKPaymentWebService *)self _performApplyRequest:v12 responseClass:objc_opt_class() completion:v6];
  return v13;
}

- (unint64_t)accountFinancingOptionsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountFinancingPlansWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountFinancingPlanPaymentIntentWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountFinancingPlanNonceWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountPayLaterChangeAutoPaymentWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountPayLaterDisputeSendEmailWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountPayLaterContentWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountPayLaterFinancingOptionCancellationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

- (unint64_t)accountPayLaterFinancingPlanCancellationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPaymentWebService *)self _appleAccountInformation];
  id v9 = [v7 _urlRequestWithAppleAccountInformation:v8];

  unint64_t v10 = [(PKPaymentWebService *)self _performAccountRequest:v9 responseClass:objc_opt_class() completion:v6];
  return v10;
}

@end