@interface PKPaymentWebServiceTargetDevice
+ (id)localTargetDevice;
- (BOOL)_willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3;
- (BOOL)claimSecureElementForCurrentUser;
- (BOOL)felicaSecureElementIsAvailable;
- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4;
- (BOOL)paymentWebService:(id)a3 canProvisionPaymentPassWithPrimaryAccountIdentifier:(id)a4;
- (BOOL)paymentWebService:(id)a3 hasPassesOfType:(unint64_t)a4;
- (BOOL)paymentWebServiceSupportsAccounts:(id)a3;
- (BOOL)paymentWebServiceSupportsPeerPaymentRegistration:(id)a3;
- (BOOL)secureElementIsAvailable;
- (BOOL)supportsAutomaticPassPresentation;
- (BOOL)supportsCheckingProvisioningRequirements;
- (BOOL)supportsCredentialType:(int64_t)a3;
- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3;
- (BOOL)supportsSharingInAChain;
- (PKPaymentWebServiceTargetDevice)init;
- (id)allPaymentApplicationUsageSummaries;
- (id)appleAccountInformation;
- (id)bridgedClientInfo;
- (id)deviceIDSIdentifier;
- (id)deviceVersion;
- (id)entitlementsForPassIdentifier:(id)a3;
- (id)passesWithReaderIdentifier:(id)a3;
- (id)paymentWebService:(id)a3 filterVerificationChannels:(id)a4;
- (id)paymentWebService:(id)a3 passWithUniqueID:(id)a4;
- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4;
- (id)paymentWebService:(id)a3 supportedRegionFeatureOfType:(int64_t)a4;
- (id)secureElementIdentifiers;
- (id)supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:(id)a3;
- (id)supportedFeatureIdentifiersWithPaymentWebService:(id)a3;
- (id)trustedDeviceEnrollmentInfoForWebService:(id)a3;
- (id)upgradeRequestForPass:(id)a3;
- (unint64_t)paymentSupportedInCurrentRegionForWebService:(id)a3;
- (unint64_t)registrationSupportedInCurrentRegionForWebService:(id)a3;
- (unint64_t)secureElementOwnershipStateForCurrentUser;
- (void)_accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)_addPass:(id)a3 properties:(id)a4 completion:(id)a5;
- (void)_addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5;
- (void)_cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)_canAcceptInvitation:(id)a3 withCompletion:(id)a4;
- (void)_canAddSecureElementPassWithConfiguration:(id)a3 completion:(id)a4;
- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4;
- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5;
- (void)_consistencyCheck;
- (void)_credentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)_declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4;
- (void)_downloadAllPaymentPasses;
- (void)_enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)_featureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)_initializeSecureElement:(id)a3;
- (void)_initializeSecureElementIfNecessaryWithCompletion:(id)a3;
- (void)_matchingInvitationOnDevice:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5;
- (void)_passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4;
- (void)_passSharesForCredentialIdentifier:(id)a3 completion:(id)a4;
- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4;
- (void)_paymentWebService:(id)a3 pass:(id)a4 withExpressConfig:(id)a5 hasDisqualifyingConflicts:(id)a6;
- (void)_performDeviceCheckInWithCompletion:(id)a3;
- (void)_performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5;
- (void)_performProductActionRequest:(id)a3 completion:(id)a4;
- (void)_productsWithRequest:(id)a3 completion:(id)a4;
- (void)_removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)_removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4;
- (void)_removeSharingInvitation:(id)a3 withCompletion:(id)a4;
- (void)_removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5;
- (void)_requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)_sanitizeExpressPasses;
- (void)_setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4;
- (void)_setDefaultPaymentPassUniqueIdentifier:(id)a3;
- (void)_setExpressWithPassConfiguration:(id)a3 credential:(id)a4 handler:(id)a5;
- (void)_startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4;
- (void)_storePassOwnershipToken:(id)a3 withIdentifier:(id)a4;
- (void)_subcredentialInvitationsWithCompletion:(id)a3;
- (void)_updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)_validateCommonPreconditionsWithCompletion:(id)a3;
- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountsWithCompletion:(id)a3;
- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5;
- (void)addPendingProvisionings:(id)a3 completion:(id)a4;
- (void)applePayTrustKeyForIdentifier:(id)a3 completion:(id)a4;
- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3;
- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4;
- (void)cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)carKeyAcceptInvitationWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)carKeyAccountAttestationRequestForCredential:(id)a3 completion:(id)a4;
- (void)carKeyDecryptData:(id)a3 credential:(id)a4 ephemeralPublicKey:(id)a5 completion:(id)a6;
- (void)carKeyGetPretrackRequestForKeyWithInvitationIdentifier:(id)a3 completion:(id)a4;
- (void)carKeyGetProductPlanIdentifierRequestForInvitationWithIdentifier:(id)a3 transportIdentifier:(id)a4 completion:(id)a5;
- (void)carKeyHandleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)carKeyRejectInvitation:(id)a3 completion:(id)a4;
- (void)carKeyRetryActivationCodeWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)carKeyRoutingInformationForInvitationWithIdentifier:(id)a3 transportIdentifier:(id)a4 completion:(id)a5;
- (void)carKeySetAccountAttestation:(id)a3 forCredential:(id)a4 completion:(id)a5;
- (void)carKeySetEncryptedProductPlanIdentifierContainer:(id)a3 invitationIdentifier:(id)a4 completion:(id)a5;
- (void)carKeyStartShareAcceptanceFlow:(id)a3 transportIdentifier:(id)a4 completion:(id)a5;
- (void)carKeyUpdateTrackingAttestation:(id)a3 forCredential:(id)a4 encryptedContainer:(id)a5 completion:(id)a6;
- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6;
- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4;
- (void)claimSecureElementForCurrentUserWithCompletion:(id)a3;
- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4;
- (void)createApplePayTrustKeyWithRequest:(id)a3 completion:(id)a4;
- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7;
- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3;
- (void)currentSecureElementSnapshot:(id)a3;
- (void)dealloc;
- (void)deleteApplePayTrustKeyWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteInvitation:(id)a3 completion:(id)a4;
- (void)deleteKeyMaterialForSubCredentialId:(id)a3;
- (void)deleteReservation:(id)a3 completion:(id)a4;
- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4;
- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)encryptedServiceProviderDataForSecureElementPass:(id)a3 completion:(id)a4;
- (void)endRequiringUpgradedPasscodeIfNecessary;
- (void)familyMembersWithCompletion:(id)a3;
- (void)featureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4;
- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateIdentityProvisioningAttestationsWithISOCredential:(id)a3 pairingID:(id)a4 completion:(id)a5;
- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)hasActiveExternallySharedPasses:(id)a3;
- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5;
- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4;
- (void)noteForegroundVerificationObserverActive:(BOOL)a3;
- (void)notePasscodeUpgradeFlowDidEnd;
- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3;
- (void)noteProvisioningDidBegin;
- (void)noteProvisioningDidEnd;
- (void)noteProvisioningUserInterfaceDidAppear;
- (void)noteProvisioningUserInterfaceDidDisappear;
- (void)paymentWebService:(id)a3 accountAttestationAnonymizationSaltWithCompletion:(id)a4;
- (void)paymentWebService:(id)a3 addPassShare:(id)a4 onCredential:(id)a5 withCompletion:(id)a6;
- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandler:(id)a5;
- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandlerV2:(id)a5;
- (void)paymentWebService:(id)a3 addSecureElementPass:(id)a4 properties:(id)a5 completion:(id)a6;
- (void)paymentWebService:(id)a3 canAcceptInvitation:(id)a4 withCompletionV2:(id)a5;
- (void)paymentWebService:(id)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 configurationDataWithCompletionHandler:(id)a4;
- (void)paymentWebService:(id)a3 credentialWithIdentifier:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 declineRelatedSharingInvitationsIfNecessary:(id)a4 withCompletion:(id)a5;
- (void)paymentWebService:(id)a3 deleteApplicationWithAID:(id)a4;
- (void)paymentWebService:(id)a3 deviceMetadataWithFields:(unint64_t)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 didRegisterWithRegionMap:(id)a4 primaryRegionTopic:(id)a5;
- (void)paymentWebService:(id)a3 generateTransactionKeyWithParameters:(id)a4 withCompletion:(id)a5;
- (void)paymentWebService:(id)a3 handlePotentialExpressPass:(id)a4 withCompletionHandler:(id)a5;
- (void)paymentWebService:(id)a3 isPassExpressWithUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 matchingInvitationOnDevice:(id)a4 withTimeout:(unint64_t)a5 completion:(id)a6;
- (void)paymentWebService:(id)a3 passOwnershipTokenWithIdentifier:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 passSharesForCredentialIdentifier:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 provisioningDataIncludingDeviceMetadata:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)paymentWebService:(id)a3 queueConnectionToTrustedServiceManagerForPushTopic:(id)a4 withCompletion:(id)a5;
- (void)paymentWebService:(id)a3 registrationDataWithAuthToken:(id)a4 completionHandler:(id)a5;
- (void)paymentWebService:(id)a3 registrationDataWithCompletionHandler:(id)a4;
- (void)paymentWebService:(id)a3 removePass:(id)a4 withCompletionHandler:(id)a5;
- (void)paymentWebService:(id)a3 removeSharingInvitation:(id)a4 withCompletion:(id)a5;
- (void)paymentWebService:(id)a3 removeSharingInvitationReceipts:(id)a4 onCredential:(id)a5 withCompletion:(id)a6;
- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)paymentWebService:(id)a3 setAccountAttestationAnonymizationSalt:(id)a4 withCompletion:(id)a5;
- (void)paymentWebService:(id)a3 setDefaultPaymentPassUniqueIdentifier:(id)a4;
- (void)paymentWebService:(id)a3 setNewAuthRandom:(id)a4;
- (void)paymentWebService:(id)a3 setNewAuthRandomIfNecessaryReturningPairingState:(id)a4;
- (void)paymentWebService:(id)a3 signData:(id)a4 signatureEntanglementMode:(unint64_t)a5 withCompletionHandler:(id)a6;
- (void)paymentWebService:(id)a3 storePassOwnershipToken:(id)a4 withIdentifier:(id)a5;
- (void)paymentWebService:(id)a3 subcredentialInvitationsWithCompletion:(id)a4;
- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 updateMetadataOnPass:(id)a4 withCredential:(id)a5 completion:(id)a6;
- (void)paymentWebService:(id)a3 validateAddPreconditionsWithCompletion:(id)a4;
- (void)paymentWebService:(id)a3 validateTransferPreconditionsWithCompletion:(id)a4;
- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4;
- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4;
- (void)rejectShareForMailboxAddress:(id)a3;
- (void)relinquishInvitation:(id)a3 completion:(id)a4;
- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)renewAppleAccountWithCompletionHandler:(id)a3;
- (void)requestBackgroundRegistrationForCredential:(id)a3 withCompletion:(id)a4;
- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4;
- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4;
- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4;
- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4;
- (void)serviceProviderDataForSecureElementPass:(id)a3 encrypted:(BOOL)a4 completion:(id)a5;
- (void)setMaximumPaymentCards:(unint64_t)a3;
- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9;
- (void)signatureForAuthToken:(id)a3 webService:(id)a4 completion:(id)a5;
- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3;
- (void)statusForShareableCredentials:(id)a3 completion:(id)a4;
- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4;
- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)updatedAccountsForProvisioningWithCompletion:(id)a3;
@end

@implementation PKPaymentWebServiceTargetDevice

- (BOOL)paymentWebService:(id)a3 hasPassesOfType:(unint64_t)a4
{
  return [(PKPassLibrary *)self->_passLibrary hasPassesOfType:a4];
}

- (unint64_t)paymentSupportedInCurrentRegionForWebService:(id)a3
{
  return PKPaymentSupportedInCurrentRegionForWebService(a3);
}

- (id)appleAccountInformation
{
  v2 = +[PKAppleAccountManager sharedInstance];
  v3 = [v2 appleAccountInformation];

  return v3;
}

- (id)deviceVersion
{
  return +[PKOSVersionRequirement fromDeviceVersion];
}

void __52__PKPaymentWebServiceTargetDevice_localTargetDevice__block_invoke()
{
  v0 = objc_alloc_init(PKPaymentWebServiceTargetDevice);
  v1 = (void *)_MergedGlobals_191;
  _MergedGlobals_191 = (uint64_t)v0;
}

- (PKPaymentWebServiceTargetDevice)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentWebServiceTargetDevice;
  v2 = [(PKPaymentWebServiceTargetDevice *)&v8 init];
  if (v2 && (PKRunningInPassd() & 1) == 0)
  {
    uint64_t v3 = +[PKPassLibrary sharedInstance];
    passLibrary = v2->_passLibrary;
    v2->_passLibrary = (PKPassLibrary *)v3;

    v5 = objc_alloc_init(PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v5;
  }
  return v2;
}

+ (id)localTargetDevice
{
  if (qword_1EB402A60 != -1) {
    dispatch_once(&qword_1EB402A60, &__block_literal_global_7);
  }
  v2 = (void *)_MergedGlobals_191;
  return v2;
}

- (void)dealloc
{
  [(PKAssertion *)self->_provisioningAssertion invalidate];
  [(PKAssertion *)self->_requiringUpgradedPasscodeAssertion invalidate];
  [(PKAssertion *)self->_activePasscodeUpgradeFlowAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentWebServiceTargetDevice;
  [(PKPaymentWebServiceTargetDevice *)&v3 dealloc];
}

- (id)bridgedClientInfo
{
  return 0;
}

- (BOOL)supportsAutomaticPassPresentation
{
  return PKIsPad() ^ 1;
}

- (void)noteProvisioningDidBegin
{
  objc_super v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Note Provisioning Did Begin.", buf, 2u);
  }

  if (!self->_provisioningAssertionActive)
  {
    self->_provisioningAssertionActive = 1;
    v4 = [MEMORY[0x1E4F28F80] processInfo];
    v5 = [v4 processName];
    int v6 = [v4 processIdentifier];
    v7 = [NSString stringWithFormat:@"%@:%ld", v5, v6];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__PKPaymentWebServiceTargetDevice_noteProvisioningDidBegin__block_invoke;
    v8[3] = &unk_1E56D8E88;
    v8[4] = self;
    +[PKAssertion acquireAssertionOfType:1 withReason:v7 completion:v8];
  }
}

void __59__PKPaymentWebServiceTargetDevice_noteProvisioningDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    objc_storeStrong((id *)(v5 + 24), a2);
    [v4 setInvalidateWhenBackgrounded:0];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__PKPaymentWebServiceTargetDevice_noteProvisioningDidBegin__block_invoke_2;
    v8[3] = &unk_1E56D8AE0;
    v8[4] = v6;
    [v7 setInvalidationHandler:v8];
  }
  else
  {
    *(unsigned char *)(v5 + 32) = 0;
  }
}

void __59__PKPaymentWebServiceTargetDevice_noteProvisioningDidBegin__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void)noteProvisioningDidEnd
{
  objc_super v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Note Provisioning Did End.", v6, 2u);
  }

  provisioningAssertion = self->_provisioningAssertion;
  self->_provisioningAssertion = 0;
  uint64_t v5 = provisioningAssertion;

  [(PKAssertion *)v5 invalidate];
}

- (void)noteProvisioningUserInterfaceDidAppear
{
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Note Provisioning User Interface Did Appear.", v3, 2u);
  }
}

- (void)noteProvisioningUserInterfaceDidDisappear
{
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Note Provisioning User Interface Did Disappear.", v3, 2u);
  }
}

- (void)setMaximumPaymentCards:(unint64_t)a3
{
}

- (id)deviceIDSIdentifier
{
  v2 = (void *)IDSCopyLocalDeviceUniqueID();
  return v2;
}

- (id)allPaymentApplicationUsageSummaries
{
  return [(PKPaymentService *)self->_paymentService allPaymentApplicationUsageSummaries];
}

- (void)noteForegroundVerificationObserverActive:(BOOL)a3
{
  if (a3)
  {
    if (!self->_verificationAssertionActive)
    {
      self->_verificationAssertionActive = 1;
      id v4 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v5 = [v4 processName];
      int v6 = [v4 processIdentifier];
      v7 = [NSString stringWithFormat:@"%@:%ld", v5, v6];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __76__PKPaymentWebServiceTargetDevice_noteForegroundVerificationObserverActive___block_invoke;
      v9[3] = &unk_1E56D8E88;
      v9[4] = self;
      +[PKAssertion acquireAssertionOfType:2 withReason:v7 completion:v9];
    }
  }
  else
  {
    verificationAssertion = self->_verificationAssertion;
    [(PKAssertion *)verificationAssertion invalidate];
  }
}

void __76__PKPaymentWebServiceTargetDevice_noteForegroundVerificationObserverActive___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    objc_storeStrong((id *)(v5 + 40), a2);
    [v4 setInvalidateWhenBackgrounded:1];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__PKPaymentWebServiceTargetDevice_noteForegroundVerificationObserverActive___block_invoke_2;
    v8[3] = &unk_1E56D8AE0;
    v8[4] = v6;
    [v7 setInvalidationHandler:v8];
  }
  else
  {
    *(unsigned char *)(v5 + 48) = 0;
  }
}

void __76__PKPaymentWebServiceTargetDevice_noteForegroundVerificationObserverActive___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (id)secureElementIdentifiers
{
  return +[PKSecureElement secureElementIdentifiers];
}

- (void)paymentWebService:(id)a3 queueConnectionToTrustedServiceManagerForPushTopic:(id)a4 withCompletion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 _paymentDevice];
  char v11 = [v10 hasRegistrationRegionMap];

  v12 = PKLogFacilityTypeGetObject(6uLL);
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "NF appears to be missing its registration region map. Re-setting per <rdar://33865268>", buf, 2u);
    }

    AnalyticsSendEvent();
    v14 = [v7 context];
    v15 = [v14 TSMURLStringByPushTopic];

    v16 = [v7 context];
    v17 = [v16 primaryRegion];
    v18 = [v17 trustedServiceManagerPushTopic];

    v19 = [v7 _paymentDevice];
    [v19 setRegistrationRegionMap:v15 primaryRegionTopic:v18];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v8;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Queueing TSM connection on local SE for %@", buf, 0xCu);
  }

  v20 = [v7 _paymentDevice];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __119__PKPaymentWebServiceTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke;
  v22[3] = &unk_1E56D8B08;
  id v23 = v9;
  id v21 = v9;
  [v20 queueConnectionToTrustedServiceManagerForPushTopic:v8 withCompletion:v22];
}

uint64_t __119__PKPaymentWebServiceTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)encryptedServiceProviderDataForSecureElementPass:(id)a3 completion:(id)a4
{
}

- (void)serviceProviderDataForSecureElementPass:(id)a3 encrypted:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    id v9 = +[PKPassLibrary sharedInstance];
    if (v6)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __96__PKPaymentWebServiceTargetDevice_serviceProviderDataForSecureElementPass_encrypted_completion___block_invoke;
      v13[3] = &unk_1E56D9348;
      v10 = &v14;
      id v14 = v8;
      [v9 encryptedServiceProviderDataForSecureElementPass:v7 completion:v13];
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __96__PKPaymentWebServiceTargetDevice_serviceProviderDataForSecureElementPass_encrypted_completion___block_invoke_41;
      v11[3] = &unk_1E56D8EB0;
      v10 = &v12;
      id v12 = v8;
      [v9 serviceProviderDataForSecureElementPass:v7 completion:v11];
    }
  }
}

void __96__PKPaymentWebServiceTargetDevice_serviceProviderDataForSecureElementPass_encrypted_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 localizedDescription];
      int v10 = 138412290;
      char v11 = v9;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Received nil service provider data with error %@", (uint8_t *)&v10, 0xCu);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

void __96__PKPaymentWebServiceTargetDevice_serviceProviderDataForSecureElementPass_encrypted_completion___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_msgSend(v5, "base64EncodedStringWithOptions:", 0, @"data");
    uint64_t v12 = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Received nil service provider data with error %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)paymentWebService:(id)a3 configurationDataWithCompletionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, void *))a4;
  if (v5)
  {
    id v6 = [a3 _paymentDevice];
    id v7 = [v6 configurationData];

    if (v7)
    {
      id v8 = 0;
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28228];
      v12[0] = @"Failed to obtain device configuration data";
      int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v8 = [v9 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v10];
    }
    v5[2](v5, v7, v8);
  }
}

- (void)paymentWebService:(id)a3 registrationDataWithCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentWebServiceTargetDevice *)self appleAccountInformation];
  id v10 = [v8 authorizationHeader];

  id v9 = [v7 _paymentDevice];

  [v9 registrationDataWithAuthToken:v10 completionHandler:v6];
}

- (void)paymentWebService:(id)a3 registrationDataWithAuthToken:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [a3 _paymentDevice];
  [v9 registrationDataWithAuthToken:v8 completionHandler:v7];
}

- (void)paymentWebService:(id)a3 signData:(id)a4 signatureEntanglementMode:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = [a3 _paymentDevice];
  [v11 signData:v10 signatureEntanglementMode:a5 withCompletionHandler:v9];
}

- (void)paymentWebService:(id)a3 provisioningDataIncludingDeviceMetadata:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [a3 _paymentDevice];
  [v8 provisioningDataIncludingDeviceMetadata:v5 withCompletionHandler:v7];
}

- (id)trustedDeviceEnrollmentInfoForWebService:(id)a3
{
  objc_super v3 = [a3 _paymentDevice];
  id v4 = [v3 trustedDeviceEnrollmentInfo];

  return v4;
}

- (void)signatureForAuthToken:(id)a3 webService:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [a4 _paymentDevice];
  [v9 signatureForAuthToken:v8 completion:v7];
}

- (void)paymentWebService:(id)a3 didRegisterWithRegionMap:(id)a4 primaryRegionTopic:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [a3 _paymentDevice];
  [v9 setRegistrationRegionMap:v8 primaryRegionTopic:v7];
}

- (id)paymentWebService:(id)a3 filterVerificationChannels:(id)a4
{
  id v4 = a4;
  return v4;
}

- (unint64_t)registrationSupportedInCurrentRegionForWebService:(id)a3
{
  return PKRegistrationSupportedInCurrentRegionForWebService(a3);
}

- (void)paymentWebService:(id)a3 deleteApplicationWithAID:(id)a4
{
  id v5 = a4;
  id v6 = [a3 _paymentDevice];
  [v6 deleteApplicationWithAID:v5];
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
}

- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4
{
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  paymentService = self->_paymentService;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PKPaymentWebServiceTargetDevice_addPendingProvisionings_completion___block_invoke;
  v9[3] = &unk_1E56D8388;
  id v10 = v6;
  id v8 = v6;
  [(PKPaymentService *)paymentService addPendingProvisionings:a3 completion:v9];
}

uint64_t __70__PKPaymentWebServiceTargetDevice_addPendingProvisionings_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
}

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[PKAppleAccountManager sharedInstance];
  [v4 renewAppleAccountWithCompletionHandler:v3];
}

- (BOOL)supportsCheckingProvisioningRequirements
{
  return 1;
}

- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4
{
}

- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4
{
  return [(PKPassLibrary *)self->_passLibrary meetsProvisioningRequirements:a3 missingRequirements:a4];
}

- (void)paymentWebService:(id)a3 setNewAuthRandomIfNecessaryReturningPairingState:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke;
  v7[3] = &unk_1E56D8D00;
  id v8 = v5;
  id v6 = v5;
  [(PKPaymentWebServiceTargetDevice *)self _initializeSecureElementIfNecessaryWithCompletion:v7];
}

uint64_t __102__PKPaymentWebServiceTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paymentWebService:(id)a3 setNewAuthRandom:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPaymentWebServiceTargetDevice_paymentWebService_setNewAuthRandom___block_invoke;
  v7[3] = &unk_1E56D8ED8;
  id v8 = v5;
  id v6 = v5;
  [(PKPaymentWebServiceTargetDevice *)self _initializeSecureElement:v7];
}

uint64_t __70__PKPaymentWebServiceTargetDevice_paymentWebService_setNewAuthRandom___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4
{
  return [(PKPassLibrary *)self->_passLibrary passesOfType:a4];
}

- (id)paymentWebService:(id)a3 passWithUniqueID:(id)a4
{
  return [(PKPassLibrary *)self->_passLibrary passWithUniqueID:a4];
}

- (id)passesWithReaderIdentifier:(id)a3
{
  return [(PKPassLibrary *)self->_passLibrary passesWithReaderIdentifier:a3];
}

- (BOOL)paymentWebService:(id)a3 canProvisionPaymentPassWithPrimaryAccountIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int IsAvailable = PKSecureElementIsAvailable();
  BOOL v7 = IsAvailable != 0;
  if (v5 && IsAvailable)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v7 = 1;
    id v8 = -[PKPassLibrary passesOfType:](self->_passLibrary, "passesOfType:", 1, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v14 = [v13 primaryAccountIdentifier];
          int v15 = [v14 isEqualToString:v5];

          if (v15 && (unint64_t)[v13 activationState] < 4)
          {
            BOOL v7 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      BOOL v7 = 1;
    }
LABEL_14:
  }
  return v7;
}

- (void)paymentWebService:(id)a3 validateAddPreconditionsWithCompletion:(id)a4
{
}

- (void)_validateCommonPreconditionsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, NSObject *))a3;
  if (!v4)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "No completion, bailing out", buf, 2u);
    }
    goto LABEL_15;
  }
  if (!PKSecureElementIsAvailable()) {
    goto LABEL_9;
  }
  if (!PKHasVerifiedPrimaryAppleAccount())
  {
    uint64_t v9 = 6;
    goto LABEL_14;
  }
  if (!PKPasscodeEnabled())
  {
    uint64_t v9 = 9;
    goto LABEL_14;
  }
  id v5 = [(PKPaymentWebServiceTargetDevice *)self appleAccountInformation];
  id v6 = [v5 aaAlternateDSID];
  int v7 = PKIsBeneficiaryAccountWithAltDsid(v6);

  if (v7)
  {
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Common precondition validation failed because account is beneficiary account", (uint8_t *)v13, 2u);
    }

LABEL_9:
    uint64_t v9 = 0;
LABEL_14:
    uint64_t v10 = PKDisplayableErrorForCommonType(v9, 0);
    v4[2](v4, 0, v10);
    goto LABEL_15;
  }
  passLibrary = self->_passLibrary;
  if (!passLibrary || [(PKPassLibrary *)passLibrary canAddPassOfType:1])
  {
    v4[2](v4, 1, 0);
    goto LABEL_16;
  }
  if (PKDisableDynamicSEAllocation()) {
    uint64_t v12 = 8;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v10 = PKDisplayableErrorForCommonType(v12, 0);
  v4[2](v4, 0, v10);
LABEL_15:

LABEL_16:
}

- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(PKInAppPaymentService);
  [(PKInAppPaymentService *)v6 paymentHardwareStatusWithType:a3 completion:v5];
}

- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Adding Payment pass to pass library", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PKPaymentWebServiceTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E56D8B30;
  id v12 = v8;
  id v10 = v8;
  [(PKPaymentWebServiceTargetDevice *)self _addPass:v7 properties:0 completion:v11];
}

void __90__PKPaymentWebServiceTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Added pass with result: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandlerV2:(id)a5
{
}

- (void)paymentWebService:(id)a3 addSecureElementPass:(id)a4 properties:(id)a5 completion:(id)a6
{
}

- (void)paymentWebService:(id)a3 handlePotentialExpressPass:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 uniqueID];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E56D8A18;
  aBlock[4] = self;
  id v11 = v9;
  id v56 = v11;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  if ([(PKPaymentWebServiceTargetDevice *)self secureElementSupportsExpressMode])
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_57;
    v52[3] = &unk_1E56D8F78;
    v52[4] = self;
    id v53 = v11;
    v13 = v12;
    id v54 = v13;
    id v14 = _Block_copy(v52);
    id v15 = [[PKExpressPassInformation alloc] initForPaymentPass:v8 withTechologyTest:&__block_literal_global_74];
    if (v15)
    {
      v16 = v13;
      long long v17 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        [v8 uniqueID];
        v19 = id v18 = v15;
        *(_DWORD *)buf = 138412290;
        v58 = v19;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Pass %@ has express info", buf, 0xCu);

        id v15 = v18;
      }

      long long v20 = v15;
      id v21 = [[PKExpressPassConfiguration alloc] initWithPassInformation:v15 forSecureElementPass:v8];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_77;
      v47[3] = &unk_1E56D8FC0;
      id v50 = v14;
      id v48 = v8;
      v49 = v21;
      id v51 = v16;
      uint64_t v22 = v21;
      [(PKPaymentWebServiceTargetDevice *)self _paymentWebService:v37 pass:v48 withExpressConfig:v22 hasDisqualifyingConflicts:v47];
    }
    else
    {
      v36 = v14;
      v24 = [v8 devicePrimaryContactlessPaymentApplication];
      unint64_t v25 = [v24 paymentNetworkIdentifier] - 1;

      if (v25 > 0x62)
      {
        v33 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v10;
          _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, "Pass %@ doesn't support express", buf, 0xCu);
        }

        v13[2](v13);
        long long v20 = 0;
      }
      else
      {
        uint64_t v26 = [(PKPaymentWebServiceTargetDevice *)self upgradeRequestForPass:v8];
        v27 = PKLogFacilityTypeGetObject(6uLL);
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v28)
          {
            v29 = [v8 uniqueID];
            *(_DWORD *)buf = 138412290;
            v58 = v29;
            _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Pass %@ has upgrade request", buf, 0xCu);
          }
          id v30 = [[PKExpressPassInformation alloc] initDummyExpressInfoForAutomaticSelectionCriteriaUpgradeRequest:v26 paymentPass:v8 withTechologyTest:&__block_literal_global_74];
          id v14 = v36;
          if (v30)
          {
            v31 = [PKExpressPassConfiguration alloc];
            [v8 devicePaymentApplications];
            v32 = id v35 = v30;
            v34 = [(PKExpressPassConfiguration *)v31 initWithPassInformation:v35 forPaymentApplications:v32];

            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_78;
            v38[3] = &unk_1E56D9010;
            id v39 = v8;
            v40 = self;
            id v41 = v37;
            id v42 = v26;
            id v44 = &__block_literal_global_74;
            id v45 = v36;
            id v43 = v10;
            v46 = v13;
            id v30 = v35;
            [(PKPaymentWebServiceTargetDevice *)self _paymentWebService:v41 pass:v39 withExpressConfig:v34 hasDisqualifyingConflicts:v38];
          }
          else
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v10;
              _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Invalid upgrade request on pass %@, could not create test express info", buf, 0xCu);
            }

            v13[2](v13);
          }
        }
        else
        {
          if (v28)
          {
            *(_DWORD *)buf = 138412290;
            v58 = v10;
            _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Pass %@ can't be upgraded to express", buf, 0xCu);
          }

          v13[2](v13);
        }
        long long v20 = 0;
      }
    }
  }
  else
  {
    id v23 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v10;
      _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "Skipping potential express enablement of %@ as SE does not support express", buf, 0xCu);
    }

    v12[2](v12);
  }
}

uint64_t __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sanitizeExpressPasses];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 && v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Pass can become express. Setting it now.", buf, 2u);
    }

    id v9 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_58;
    v11[3] = &unk_1E56D8F50;
    id v12 = v6;
    id v13 = *(id *)(a1 + 40);
    [v9 _setExpressWithPassConfiguration:v12 credential:0 handler:v11];
  }
  else
  {
    if (v8)
    {
      id v10 = [v5 uniqueID];
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "No express upgrade for pass %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_58(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    BOOL v8 = [*(id *)(a1 + 32) passUniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    long long v17 = v7;
    __int16 v18 = 2112;
    long long v19 = v8;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Express set success: %@ for passUniqueIdentifier: %@", buf, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    if (a2)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v11 = [*(id *)(a1 + 32) passInformation];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_66;
      v14[3] = &unk_1E56D8F28;
      id v12 = v10;
      id v15 = v12;
      [v11 enumerateCredentialsWithHandler:v14];

      if ([v12 count]) {
        id v13 = (void *)[v12 copy];
      }
      else {
        id v13 = 0;
      }

      uint64_t v9 = *(void *)(a1 + 40);
    }
    else
    {
      id v13 = 0;
    }
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v13);
  }
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E56D8F00;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateObjectsUsingBlock:v4];
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 supportsExpress])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 type];
    [v3 addObject:v4];
  }
}

BOOL __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_71(uint64_t a1, uint64_t a2)
{
  return +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:a2];
}

uint64_t __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_77(uint64_t a1, char a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) uniqueID];
      int v7 = 138412290;
      BOOL v8 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Pass %@ has conflict with pre-existing pass, not enabling express", (uint8_t *)&v7, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v6();
  }
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_78(uint64_t a1, char a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      id v6 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138412290;
      long long v19 = v6;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Pass %@ upgrade request has potential conflicts, not upgrading for express", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    if (v5)
    {
      int v7 = [*(id *)(a1 + 32) uniqueID];
      *(_DWORD *)buf = 138412290;
      long long v19 = v7;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Attempting upgrade of pass %@", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_79;
    v12[3] = &unk_1E56D8FE8;
    id v15 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 80);
    id v14 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 88);
    [v10 paymentWebService:v8 requestPassUpgrade:v9 pass:v11 completion:v12];
  }
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_79(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [[PKExpressPassInformation alloc] initForPaymentPass:v5 withTechologyTest:*(void *)(a1 + 48)];
  int v7 = v6;
  if (!a2 && v5 && v6)
  {
    uint64_t v8 = [PKExpressPassConfiguration alloc];
    uint64_t v9 = [*(id *)(a1 + 32) devicePaymentApplications];
    id v10 = [(PKExpressPassConfiguration *)v8 initWithPassInformation:v7 forPaymentApplications:v9];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Express upgrade of pass %@ failed", (uint8_t *)&v13, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_paymentWebService:(id)a3 pass:(id)a4 withExpressConfig:(id)a5 hasDisqualifyingConflicts:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke;
  aBlock[3] = &unk_1E56D8ED8;
  id v26 = v13;
  id v14 = v13;
  uint64_t v15 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke_2;
  v20[3] = &unk_1E56D9060;
  id v23 = v11;
  id v24 = v15;
  v20[4] = self;
  id v21 = v10;
  id v22 = v12;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  id v19 = v15;
  [(PKPaymentWebServiceTargetDevice *)self _conflictingExpressPassIdentifiersForPassConfiguration:v17 withCompletion:v20];
}

uint64_t __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([a2 count])
  {
    id v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Potential express state conflicts with existing express state, not enabling for express", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    return;
  }
  id v4 = [*(id *)(a1 + 32) paymentWebService:*(void *)(a1 + 40) passesOfType:1];
  if ([v4 count])
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = [*(id *)(a1 + 48) passUniqueIdentifier];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (!v7) {
      goto LABEL_24;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueID", v19);
        id v12 = (PKExpressPassConfiguration *)(id)objc_claimAutoreleasedReturnValue();
        id v13 = v5;
        id v14 = v13;
        if (v12 == v13)
        {

LABEL_17:
          id v16 = [[PKExpressPassInformation alloc] initForPaymentPass:v11 withTechologyTest:0];
          if (v16)
          {
            id v12 = [[PKExpressPassConfiguration alloc] initWithPassInformation:v16 forSecureElementPass:v11];
            [v20 addObject:v12];
            goto LABEL_20;
          }
LABEL_21:

          continue;
        }
        if (!v5 || !v12)
        {

          id v16 = v12;
LABEL_20:

          goto LABEL_21;
        }
        int v15 = [(PKExpressPassConfiguration *)v12 isEqualToString:v13];

        if (v15) {
          goto LABEL_17;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (!v8)
      {
LABEL_24:

        id v17 = *(void **)(a1 + 32);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke_81;
        v21[3] = &unk_1E56D9038;
        uint64_t v18 = *(void *)(a1 + 48);
        id v22 = *(id *)(a1 + 56);
        id v23 = v6;
        id v24 = *(id *)(a1 + 64);
        [v17 _conflictingExpressPassIdentifiersForPassConfiguration:v18 withReferenceExpressState:v20 completion:v21];

        id v4 = v19;
        goto LABEL_26;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_26:
}

void __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![v3 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_28;
  }
  id v4 = PKExpressPassCategoryIdentifier(*(void **)(a1 + 32));
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Comparing category conflicts for new pass of category: %@", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v8) {
    goto LABEL_25;
  }
  oslog = v5;
  uint64_t v19 = a1;
  uint64_t v9 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      id v12 = objc_msgSend(v11, "uniqueID", oslog);
      int v13 = [v3 containsObject:v12];

      if (v13)
      {
        uint64_t v14 = PKExpressPassCategoryIdentifier(v11);
        int v15 = (void *)v14;
        if (v4 && v14)
        {
          if ([v4 isEqual:v14]) {
            goto LABEL_13;
          }
        }
        else if (v4 == (void *)v14)
        {
LABEL_13:
          if (([v11 hasAssociatedPeerPaymentAccount] & 1) == 0)
          {
            id v5 = oslog;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = [v11 uniqueID];
              *(_DWORD *)buf = 138412546;
              id v25 = v15;
              __int16 v26 = 2112;
              long long v27 = v17;
              _os_log_impl(&dword_190E10000, oslog, OS_LOG_TYPE_DEFAULT, "Exiting early, found conflicting category:%@ for pass with unique ID:%@", buf, 0x16u);
            }
            a1 = v19;
            goto LABEL_25;
          }
          goto LABEL_17;
        }
        [v6 addObject:v15];
LABEL_17:

        continue;
      }
    }
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8) {
      continue;
    }
    break;
  }
  id v5 = oslog;
  a1 = v19;
LABEL_25:

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "The following categories were checked and did not conflict:\n%@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_28:
}

- (void)paymentWebService:(id)a3 isPassExpressWithUniqueIdentifier:(id)a4 completion:(id)a5
{
}

- (void)paymentWebService:(id)a3 removePass:(id)a4 withCompletionHandler:(id)a5
{
  id v9 = a5;
  id v7 = [a4 uniqueID];
  [(PKPaymentWebServiceTargetDevice *)self _removePassWithUniqueID:v7 diagnosticReason:@"Target device remove requested"];

  uint64_t v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    uint64_t v8 = v9;
  }
}

- (BOOL)claimSecureElementForCurrentUser
{
  v2 = PKCurrentUserUUID();
  char v3 = PKSetSecureElementOwnerUserUUID(v2, 0);

  return v3;
}

- (void)claimSecureElementForCurrentUserWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (unint64_t)secureElementOwnershipStateForCurrentUser
{
  v2 = PKCurrentUserUUID();
  unint64_t v3 = PKGetSecureElementOwnershipState(v2);

  return v3;
}

- (void)paymentWebService:(id)a3 validateTransferPreconditionsWithCompletion:(id)a4
{
}

- (BOOL)felicaSecureElementIsAvailable
{
  return PKFelicaSecureElementIsAvailable() != 0;
}

- (BOOL)secureElementIsAvailable
{
  int IsAvailable = PKSecureElementIsAvailable();
  if (IsAvailable) {
    LOBYTE(IsAvailable) = !+[PKSecureElement isInFailForward];
  }
  return IsAvailable;
}

- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:a3];
}

- (BOOL)supportsCredentialType:(int64_t)a3
{
  return 1;
}

- (BOOL)paymentWebServiceSupportsPeerPaymentRegistration:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!PKIsManagedAppleID() && (unint64_t)PKCurrentPassbookState() <= 1)
  {
    id v5 = PKPeerPaymentServiceOverrideURL();

    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16[0]) = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Payment web service supports peer payments due to service override URL", (uint8_t *)v16, 2u);
      }
      LOBYTE(v7) = 1;
LABEL_16:

      goto LABEL_9;
    }
    if (([v4 needsRegistration] & 1) == 0)
    {
      id v6 = [v4 context];
      id v9 = [v6 peerPaymentServiceURL];

      int v10 = [v6 hasPeerPaymentAccount];
      id v11 = [v4 context];
      id v12 = [v11 configuration];
      int v13 = [(PKPaymentWebServiceTargetDevice *)self deviceRegion];
      int v14 = [v12 peerPaymentEnabledForRegion:v13];

      if (v9) {
        int v7 = v10 | v14;
      }
      else {
        int v7 = 0;
      }
      int v15 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 67109888;
        v16[1] = v7;
        __int16 v17 = 1024;
        int v18 = v10;
        __int16 v19 = 1024;
        int v20 = v14;
        __int16 v21 = 1024;
        BOOL v22 = v9 != 0;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Payment web service supports peer payments = %d, hasAccount: %d, regionEnabled: %d, hasURL: %d", (uint8_t *)v16, 0x1Au);
      }

      goto LABEL_16;
    }
  }
  LOBYTE(v7) = 0;
LABEL_9:

  return v7;
}

- (id)supportedFeatureIdentifiersWithPaymentWebService:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 context];
  id v5 = [v4 configuration];
  id v6 = [(PKPaymentWebServiceTargetDevice *)self deviceRegion];
  int v7 = [v5 applyServiceEnabledForRegion:v6];
  uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109120;
    LODWORD(v17) = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Payment web service supports apply service: %d", (uint8_t *)&v16, 8u);
  }

  if (v7)
  {
    id v9 = [v4 applyServiceFeaturesForRegionMeetingEnablementThreshold:v6];
    int v10 = PKDeviceSupportedFeatureIdentifiers();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      __int16 v17 = v10;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Device supported feature identifiers: %@", (uint8_t *)&v16, 0xCu);
    }

    id v11 = (void *)MEMORY[0x1E4F1CA80];
    id v12 = [v9 allKeys];
    int v13 = [v11 setWithArray:v12];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      __int16 v17 = v13;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Config supported feature identifiers: %@", (uint8_t *)&v16, 0xCu);
    }

    [v13 intersectSet:v10];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      __int16 v17 = v13;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Final supported feature identifiers: %@", (uint8_t *)&v16, 0xCu);
    }

    int v14 = (void *)[v13 copy];
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

- (id)supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = PKDeviceSupportedFeatureIdentifiers();
  id v4 = PKLogFacilityTypeGetObject(0xDuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Device supported feature identifiers: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (BOOL)paymentWebServiceSupportsAccounts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 needsRegistration])
  {
    char v5 = 0;
  }
  else
  {
    int v6 = [v4 context];
    int v7 = [v6 primaryRegion];
    int v8 = [v7 hasAccounts];

    id v9 = [v6 configuration];
    int v10 = [(PKPaymentWebServiceTargetDevice *)self deviceRegion];
    int v11 = [v9 accountServiceEnabledForRegion:v10];

    char v5 = v8 | v11;
    id v12 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109632;
      v14[1] = v8 | v11;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 1024;
      int v18 = v11;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Payment web service supports accounts = %d, hasAccount: %d, regionEnabled: %d", (uint8_t *)v14, 0x14u);
    }
  }
  return v5;
}

- (void)updatedAccountsForProvisioningWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[PKAccountService sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__PKPaymentWebServiceTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke;
    v6[3] = &unk_1E56D90B0;
    id v7 = v4;
    id v8 = v3;
    id v5 = v4;
    [v5 updateAccountsWithCompletion:v6];
  }
}

void __80__PKPaymentWebServiceTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __80__PKPaymentWebServiceTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_2;
  v2[3] = &unk_1E56D9088;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 accountsForProvisioningWithCompletion:v2];
}

uint64_t __80__PKPaymentWebServiceTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accountsWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[PKAccountService sharedInstance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__PKPaymentWebServiceTargetDevice_accountsWithCompletion___block_invoke;
    v5[3] = &unk_1E56D90D8;
    id v6 = v3;
    [v4 accountsWithCompletion:v5];
  }
}

uint64_t __58__PKPaymentWebServiceTargetDevice_accountsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = +[PKAccountService sharedInstance];
    [v7 accountWithIdentifier:v6 completion:v5];
  }
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = +[PKAccountService sharedInstance];
    [v7 triggerCloudStoreZoneCreationForAccount:v6 withCompletion:v5];
  }
}

- (void)cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__PKPaymentWebServiceTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke;
    v6[3] = &unk_1E56D9100;
    id v7 = v4;
    [(PKPaymentWebServiceTargetDevice *)self _cachedFeatureApplicationsForProvisioningWithCompletion:v6];
  }
}

uint64_t __90__PKPaymentWebServiceTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__PKPaymentWebServiceTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke;
    v6[3] = &unk_1E56D90D8;
    id v7 = v4;
    [(PKPaymentWebServiceTargetDevice *)self _featureApplicationsForProvisioningWithCompletion:v6];
  }
}

uint64_t __84__PKPaymentWebServiceTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)applePayTrustKeyForIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__PKPaymentWebServiceTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke;
    v8[3] = &unk_1E56D9128;
    id v9 = v5;
    id v10 = v6;
    id v7 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:v8];
  }
}

void __76__PKPaymentWebServiceTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 keyWithIdentifier:*(void *)(a1 + 32)];
    [v4 invalidateSession];
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PKPaymentWebServiceTargetDevice applePayTrustKeyForIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v7, 0xCu);
    }

    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createApplePayTrustKeyWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PKPaymentWebServiceTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke;
  v10[3] = &unk_1E56D9128;
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:v10];
}

void __80__PKPaymentWebServiceTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) keyIdentifier];
    [v3 deleteKeyWithIdentifier:v4];

    uint64_t v5 = *(void *)(a1 + 32);
    id v10 = 0;
    id v6 = [v3 createKeyWithRequest:v5 error:&v10];
    id v7 = v10;
    [v3 invalidateSession];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[PKPaymentWebServiceTargetDevice createApplePayTrustKeyWithRequest:completion:]_block_invoke";
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get Apple Pay Trust session for method: %s", buf, 0xCu);
    }

    id v7 = 0;
    id v6 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v6, v7);
  }
}

- (void)deleteApplePayTrustKeyWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__PKPaymentWebServiceTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke;
  v10[3] = &unk_1E56D9128;
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:v10];
}

void __83__PKPaymentWebServiceTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 deleteKeyWithIdentifier:*(void *)(a1 + 32)];
    [v4 invalidateSession];
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[PKPaymentWebServiceTargetDevice deleteApplePayTrustKeyWithIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v5);
  }
}

- (void)paymentWebService:(id)a3 deviceMetadataWithFields:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = [a3 _paymentDevice];
  [v8 paymentDeviceMetadataFields:a4 completion:v7];
}

- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[PKAccountService sharedInstance];
  [v8 updateAccountWithIdentifier:v7 extended:0 completion:v6];
}

- (void)paymentWebService:(id)a3 accountAttestationAnonymizationSaltWithCompletion:(id)a4
{
}

- (void)paymentWebService:(id)a3 setAccountAttestationAnonymizationSalt:(id)a4 withCompletion:(id)a5
{
}

- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void, void))v4;
  if (!self->_activePasscodeUpgradeFlowAssertionActive)
  {
    self->_activePasscodeUpgradeFlowAssertionActive = 1;
    id v7 = [MEMORY[0x1E4F28F80] processInfo];
    id v8 = [v7 processName];
    int v9 = [v7 processIdentifier];
    uint64_t v10 = [NSString stringWithFormat:@"%@:%ld", v8, v9];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__PKPaymentWebServiceTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke;
    v11[3] = &unk_1E56D9178;
    objc_copyWeak(&v13, &location);
    id v12 = v5;
    +[PKAssertion acquireAssertionOfType:7 withReason:v10 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    goto LABEL_5;
  }
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"PasscodeUpgradeFlowActive assertion already exists.";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v8 = [v6 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v7];
    ((void (**)(void, void, void *))v5)[2](v5, 0, v8);
LABEL_5:
  }
}

void __82__PKPaymentWebServiceTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      [v6 setInvalidateWhenBackgrounded:1];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __82__PKPaymentWebServiceTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke_2;
      v11[3] = &unk_1E56D9150;
      objc_copyWeak(&v13, (id *)(a1 + 40));
      id v12 = v6;
      [v12 setInvalidationHandler:v11];
      objc_storeStrong(v9 + 9, a2);

      objc_destroyWeak(&v13);
    }
    else
    {
      *((unsigned char *)WeakRetained + 80) = 0;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, *((unsigned __int8 *)v9 + 80), v7);
    }
  }
}

void __82__PKPaymentWebServiceTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[9];
    if (v3 == *(void **)(a1 + 32))
    {
      *((unsigned char *)WeakRetained + 80) = 0;
      WeakRetained[9] = 0;
      id v4 = WeakRetained;

      WeakRetained = v4;
    }
  }
}

- (void)notePasscodeUpgradeFlowDidEnd
{
  [(PKAssertion *)self->_activePasscodeUpgradeFlowAssertion invalidate];
  activePasscodeUpgradeFlowAssertion = self->_activePasscodeUpgradeFlowAssertion;
  self->_activePasscodeUpgradeFlowAssertion = 0;

  self->_activePasscodeUpgradeFlowAssertionActive = 0;
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
}

- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentService *)self->_paymentService plansForPaymentPassWithUniqueIdentifier:v7 completion:v6];
  }
}

- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  if (!self->_requiringUpgradedPasscodeAssertionActive)
  {
    self->_requiringUpgradedPasscodeAssertionActive = 1;
    id v4 = objc_msgSend(MEMORY[0x1E4F28F80], "processInfo", a3);
    uint64_t v5 = [v4 processName];
    int v6 = [v4 processIdentifier];
    id v7 = [NSString stringWithFormat:@"%@:%ld", v5, v6];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__PKPaymentWebServiceTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke;
    v8[3] = &unk_1E56D91A0;
    objc_copyWeak(&v9, &location);
    +[PKAssertion acquireAssertionOfType:6 withReason:v7 completion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __89__PKPaymentWebServiceTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      [v6 setInvalidateWhenBackgrounded:0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __89__PKPaymentWebServiceTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke_2;
      v11[3] = &unk_1E56D9150;
      objc_copyWeak(&v13, v8);
      id v12 = v6;
      [v12 setInvalidationHandler:v11];
      objc_storeStrong(v10 + 7, a2);

      objc_destroyWeak(&v13);
    }
    else
    {
      *((unsigned char *)WeakRetained + 64) = 0;
    }
  }
}

void __89__PKPaymentWebServiceTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[7];
    if (v3 == *(void **)(a1 + 32))
    {
      *((unsigned char *)WeakRetained + 64) = 0;
      WeakRetained[7] = 0;
      id v4 = WeakRetained;

      WeakRetained = v4;
    }
  }
}

- (void)endRequiringUpgradedPasscodeIfNecessary
{
  [(PKAssertion *)self->_requiringUpgradedPasscodeAssertion invalidate];
  requiringUpgradedPasscodeAssertion = self->_requiringUpgradedPasscodeAssertion;
  self->_requiringUpgradedPasscodeAssertion = 0;

  self->_requiringUpgradedPasscodeAssertionActive = 0;
}

- (void)paymentWebService:(id)a3 updateMetadataOnPass:(id)a4 withCredential:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = [a4 uniqueID];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__PKPaymentWebServiceTargetDevice_paymentWebService_updateMetadataOnPass_withCredential_completion___block_invoke;
  v13[3] = &unk_1E56D8B30;
  id v14 = v9;
  id v12 = v9;
  [(PKPaymentWebServiceTargetDevice *)self _updateMetadataOnPassWithIdentifier:v11 credential:v10 completion:v13];
}

uint64_t __100__PKPaymentWebServiceTargetDevice_paymentWebService_updateMetadataOnPass_withCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paymentWebService:(id)a3 addPassShare:(id)a4 onCredential:(id)a5 withCompletion:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = [a5 identifier];
  [(PKPaymentWebServiceTargetDevice *)self _addPassShare:v10 onCredentialWithIdentifier:v11 completion:v9];
}

- (void)paymentWebService:(id)a3 removeSharingInvitationReceipts:(id)a4 onCredential:(id)a5 withCompletion:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v17), "identifier", (void)v21);
        if (v18) {
          [v12 addObject:v18];
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  uint64_t v19 = (void *)[v12 copy];
  int v20 = [v10 identifier];
  [(PKPaymentWebServiceTargetDevice *)self _removeSharingInvitationReceiptWithIdentifiers:v19 onCredential:v20 completion:v11];
}

- (void)paymentWebService:(id)a3 declineRelatedSharingInvitationsIfNecessary:(id)a4 withCompletion:(id)a5
{
}

- (void)paymentWebService:(id)a3 removeSharingInvitation:(id)a4 withCompletion:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Removing sharing invitation: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __92__PKPaymentWebServiceTargetDevice_paymentWebService_removeSharingInvitation_withCompletion___block_invoke;
  v12[3] = &unk_1E56D86A8;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(PKPaymentWebServiceTargetDevice *)self _removeSharingInvitation:v11 withCompletion:v12];
}

uint64_t __92__PKPaymentWebServiceTargetDevice_paymentWebService_removeSharingInvitation_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "failed";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v5 = "succeeded";
    }
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2080;
    id v11 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Removing sharing invitation (%@) %s", (uint8_t *)&v8, 0x16u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)requestBackgroundRegistrationForCredential:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Requesting to background register credential: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [v6 identifier];
  [(PKPaymentWebServiceTargetDevice *)self _requestBackgroundRegistrationForCredentialWithIdentifier:v9 completion:v7];
}

- (void)paymentWebService:(id)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5
{
}

- (void)paymentWebService:(id)a3 canAcceptInvitation:(id)a4 withCompletionV2:(id)a5
{
}

- (void)paymentWebService:(id)a3 subcredentialInvitationsWithCompletion:(id)a4
{
}

- (void)paymentWebService:(id)a3 matchingInvitationOnDevice:(id)a4 withTimeout:(unint64_t)a5 completion:(id)a6
{
}

- (void)paymentWebService:(id)a3 credentialWithIdentifier:(id)a4 completion:(id)a5
{
}

- (void)paymentWebService:(id)a3 passSharesForCredentialIdentifier:(id)a4 completion:(id)a5
{
}

- (void)hasActiveExternallySharedPasses:(id)a3
{
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
}

- (id)entitlementsForPassIdentifier:(id)a3
{
  return [(PKPaymentService *)self->_paymentService entitlementsForPassIdentifier:a3];
}

- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4
{
}

- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5
{
}

- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6
{
}

- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4
{
}

- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4
{
}

- (void)relinquishInvitation:(id)a3 completion:(id)a4
{
}

- (void)deleteInvitation:(id)a3 completion:(id)a4
{
  id v7 = a4;
  [(PKPaymentService *)self->_paymentService deleteSharingMessage:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    id v6 = v7;
  }
}

- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5
{
}

- (BOOL)supportsSharingInAChain
{
  return 1;
}

- (void)carKeyStartShareAcceptanceFlow:(id)a3 transportIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__PKPaymentWebServiceTargetDevice_carKeyStartShareAcceptanceFlow_transportIdentifier_completion___block_invoke;
  v13[3] = &unk_1E56D8770;
  id v14 = v10;
  id v15 = v7;
  id v11 = v10;
  id v12 = v7;
  [(PKDAManager *)v11 startShareAcceptanceFlowWithInvitation:v9 fromMailboxIdentifier:v8 completion:v13];
}

uint64_t __97__PKPaymentWebServiceTargetDevice_carKeyStartShareAcceptanceFlow_transportIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyRoutingInformationForInvitationWithIdentifier:(id)a3 transportIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118__PKPaymentWebServiceTargetDevice_carKeyRoutingInformationForInvitationWithIdentifier_transportIdentifier_completion___block_invoke;
  v13[3] = &unk_1E56D91C8;
  id v14 = v10;
  id v15 = v7;
  id v11 = v10;
  id v12 = v7;
  [(PKDAManager *)v11 routingInformationForInvitationWithIdentifier:v9 fromMailboxIdentifier:v8 completionHandler:v13];
}

uint64_t __118__PKPaymentWebServiceTargetDevice_carKeyRoutingInformationForInvitationWithIdentifier_transportIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyGetProductPlanIdentifierRequestForInvitationWithIdentifier:(id)a3 transportIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __131__PKPaymentWebServiceTargetDevice_carKeyGetProductPlanIdentifierRequestForInvitationWithIdentifier_transportIdentifier_completion___block_invoke;
  v13[3] = &unk_1E56D91F0;
  id v14 = v10;
  id v15 = v7;
  id v11 = v10;
  id v12 = v7;
  [(PKDAManager *)v11 getProductPlanIdentifierRequestForInvitationWithIdentifier:v9 fromMailboxIdentifier:v8 completion:v13];
}

uint64_t __131__PKPaymentWebServiceTargetDevice_carKeyGetProductPlanIdentifierRequestForInvitationWithIdentifier_transportIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeySetEncryptedProductPlanIdentifierContainer:(id)a3 invitationIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __116__PKPaymentWebServiceTargetDevice_carKeySetEncryptedProductPlanIdentifierContainer_invitationIdentifier_completion___block_invoke;
  v13[3] = &unk_1E56D8770;
  id v14 = v10;
  id v15 = v7;
  id v11 = v10;
  id v12 = v7;
  [(PKDAManager *)v11 setEncryptedProductPlanIdentifierContainer:v9 forInvitationIdentifier:v8 completion:v13];
}

uint64_t __116__PKPaymentWebServiceTargetDevice_carKeySetEncryptedProductPlanIdentifierContainer_invitationIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyAccountAttestationRequestForCredential:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(PKDAManager);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__PKPaymentWebServiceTargetDevice_carKeyAccountAttestationRequestForCredential_completion___block_invoke;
  v10[3] = &unk_1E56D9218;
  id v11 = v7;
  id v12 = v5;
  id v8 = v7;
  id v9 = v5;
  [(PKDAManager *)v8 accountAttestionRequestForCredential:v6 withCompletion:v10];
}

uint64_t __91__PKPaymentWebServiceTargetDevice_carKeyAccountAttestationRequestForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyGetPretrackRequestForKeyWithInvitationIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(PKDAManager);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__PKPaymentWebServiceTargetDevice_carKeyGetPretrackRequestForKeyWithInvitationIdentifier_completion___block_invoke;
  v10[3] = &unk_1E56D91F0;
  id v11 = v7;
  id v12 = v5;
  id v8 = v7;
  id v9 = v5;
  [(PKDAManager *)v8 getPretrackRequestForKeyWithIdentifier:v6 withCompletion:v10];
}

uint64_t __101__PKPaymentWebServiceTargetDevice_carKeyGetPretrackRequestForKeyWithInvitationIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeySetAccountAttestation:(id)a3 forCredential:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__PKPaymentWebServiceTargetDevice_carKeySetAccountAttestation_forCredential_completion___block_invoke;
  v13[3] = &unk_1E56D8770;
  id v14 = v10;
  id v15 = v7;
  id v11 = v10;
  id v12 = v7;
  [(PKDAManager *)v11 setAccountAttestation:v9 forCredential:v8 withCompletion:v13];
}

uint64_t __88__PKPaymentWebServiceTargetDevice_carKeySetAccountAttestation_forCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyUpdateTrackingAttestation:(id)a3 forCredential:(id)a4 encryptedContainer:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(PKDAManager);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __111__PKPaymentWebServiceTargetDevice_carKeyUpdateTrackingAttestation_forCredential_encryptedContainer_completion___block_invoke;
  v16[3] = &unk_1E56D8798;
  uint64_t v17 = v13;
  id v18 = v9;
  id v14 = v13;
  id v15 = v9;
  [(PKDAManager *)v14 updateTrackingAttestation:v12 forCredential:v11 encryptedContainer:v10 completion:v16];
}

uint64_t __111__PKPaymentWebServiceTargetDevice_carKeyUpdateTrackingAttestation_forCredential_encryptedContainer_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyAcceptInvitationWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__PKPaymentWebServiceTargetDevice_carKeyAcceptInvitationWithInvitationIdentifier_activationCode_completion___block_invoke;
  v13[3] = &unk_1E56D9240;
  id v14 = v10;
  id v15 = v7;
  id v11 = v10;
  id v12 = v7;
  [(PKDAManager *)v11 acceptInvitationWithIdentifier:v9 activationCode:v8 completion:v13];
}

uint64_t __108__PKPaymentWebServiceTargetDevice_carKeyAcceptInvitationWithInvitationIdentifier_activationCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyRejectInvitation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(PKDAManager);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PKPaymentWebServiceTargetDevice_carKeyRejectInvitation_completion___block_invoke;
  v10[3] = &unk_1E56D9268;
  id v11 = v7;
  id v12 = v5;
  id v8 = v7;
  id v9 = v5;
  [(PKDAManager *)v8 rejectInvitation:v6 completion:v10];
}

uint64_t __69__PKPaymentWebServiceTargetDevice_carKeyRejectInvitation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyHandleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__PKPaymentWebServiceTargetDevice_carKeyHandleRecipientMessage_forInvitationIdentifier_completion___block_invoke;
  v13[3] = &unk_1E56D9240;
  id v14 = v10;
  id v15 = v7;
  id v11 = v10;
  id v12 = v7;
  [(PKDAManager *)v11 handleRecipientMessage:v9 forInvitationIdentifier:v8 completion:v13];
}

uint64_t __99__PKPaymentWebServiceTargetDevice_carKeyHandleRecipientMessage_forInvitationIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyRetryActivationCodeWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __111__PKPaymentWebServiceTargetDevice_carKeyRetryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke;
  v13[3] = &unk_1E56D9240;
  id v14 = v10;
  id v15 = v7;
  id v11 = v10;
  id v12 = v7;
  [(PKDAManager *)v11 retryActivationCode:v8 forInvitationIdentifier:v9 completion:v13];
}

uint64_t __111__PKPaymentWebServiceTargetDevice_carKeyRetryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)carKeyDecryptData:(id)a3 credential:(id)a4 ephemeralPublicKey:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(id, void *, void))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = objc_alloc_init(PKDAManager);
  id v13 = [(PKDAManager *)v14 decryptData:v12 withCredential:v11 ephemeralPublicKey:v10];

  v9[2](v9, v13, 0);
}

- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4
{
}

- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6
{
}

- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
}

- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
}

- (void)rejectShareForMailboxAddress:(id)a3
{
}

- (void)paymentWebService:(id)a3 generateTransactionKeyWithParameters:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [a3 _paymentDevice];
  [v9 generateTransactionKeyWithParameters:v8 withCompletion:v7];
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
}

- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v8)
  {
    [(PKPaymentService *)self->_paymentService saveProvisioningSupportData:v8 completion:v6];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4
{
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
}

- (id)paymentWebService:(id)a3 supportedRegionFeatureOfType:(int64_t)a4
{
  return (id)[a3 supportedRegionFeatureOfType:a4 didFailOSVersionRequirements:0];
}

- (void)paymentWebService:(id)a3 setDefaultPaymentPassUniqueIdentifier:(id)a4
{
}

- (void)paymentWebService:(id)a3 storePassOwnershipToken:(id)a4 withIdentifier:(id)a5
{
}

- (void)paymentWebService:(id)a3 passOwnershipTokenWithIdentifier:(id)a4 completion:(id)a5
{
}

- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    passUpgradeController = self->_passUpgradeController;
    if (!passUpgradeController)
    {
      id v14 = [[PKPassUpgradeController alloc] initWithWebService:v16];
      id v15 = self->_passUpgradeController;
      self->_passUpgradeController = v14;

      passUpgradeController = self->_passUpgradeController;
    }
    [(PKPassUpgradeControllerBase *)passUpgradeController requestPassUpgrade:v10 pass:v11 diagnosticReason:@"User upgrade" completion:v12];
  }
}

- (void)_addPass:(id)a3 properties:(id)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8)
  {
    id v12 = [[PKPassIngestionPayload alloc] initWithPass:v8];
    [(PKPassIngestionPayload *)v12 setProperties:v9];
    passLibrary = self->_passLibrary;
    v18[0] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__PKPaymentWebServiceTargetDevice__addPass_properties_completion___block_invoke;
    v15[3] = &unk_1E56D9290;
    v15[4] = self;
    id v16 = v8;
    id v17 = v11;
    [(PKPassLibrary *)passLibrary addPassesWithIngestionPayloads:v14 withCompletionHandler:v15];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __66__PKPaymentWebServiceTargetDevice__addPass_properties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = dispatch_get_global_queue(21, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PKPaymentWebServiceTargetDevice__addPass_properties_completion___block_invoke_2;
  v8[3] = &unk_1E56D8A40;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  uint64_t v11 = a2;
  void v8[4] = v5;
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v7 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E56D8360;
  id v13 = v7;
  dispatch_async(v4, block);
}

void __66__PKPaymentWebServiceTargetDevice__addPass_properties_completion___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 56))
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 8);
    id v3 = [*(id *)(a1 + 40) uniqueID];
    id v7 = [v2 passWithUniqueID:v3];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v5 = v7;
    if (isKindOfClass) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = 0;
LABEL_5:
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    id v8 = v5;
    (*(void (**)(void))(v6 + 16))();
    uint64_t v5 = v8;
  }
}

- (void)_startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
}

- (void)_setExpressWithPassConfiguration:(id)a3 credential:(id)a4 handler:(id)a5
{
}

- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
}

- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
}

- (void)_sanitizeExpressPasses
{
}

- (id)upgradeRequestForPass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [PKPaymentDefaultDataProvider alloc];
  paymentService = self->_paymentService;
  id v7 = +[PKSecureElement sharedSecureElement];
  id v8 = [(PKPaymentDefaultDataProvider *)v5 initWithPaymentService:paymentService secureElement:v7];

  id v9 = [[PKPassLibraryDefaultDataProvider alloc] initWithPassLibrary:self->_passLibrary];
  id v10 = [[PKExpressPassController alloc] initWithPaymentDataProvider:v8 passLibraryDataProvider:v9 isForWatch:0];
  uint64_t v11 = [(PKExpressPassController *)v10 expressModeUpgradeRequestForPass:v4];

  return v11;
}

- (void)_removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
}

- (void)_downloadAllPaymentPasses
{
}

- (void)_removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4
{
}

- (void)_cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  paymentService = self->_paymentService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__PKPaymentWebServiceTargetDevice__cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E56D9100;
  id v8 = v4;
  id v6 = v4;
  [(PKPaymentService *)paymentService featureApplicationsWithCompletion:v7];
}

void __91__PKPaymentWebServiceTargetDevice__cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_119);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    id v3 = v5;
  }
}

BOOL __91__PKPaymentWebServiceTargetDevice__cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationType] == 1;
}

- (void)_featureApplicationsForProvisioningWithCompletion:(id)a3
{
}

- (void)_accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
}

- (void)_setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
}

- (void)_enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
}

- (void)_updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  paymentService = self->_paymentService;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__PKPaymentWebServiceTargetDevice__updateMetadataOnPassWithIdentifier_credential_completion___block_invoke;
  v13[3] = &unk_1E56D92D8;
  id v14 = v8;
  id v15 = v9;
  void v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  [(PKPaymentService *)paymentService updateMetadataOnPassWithIdentifier:v11 credential:a4 completion:v13];
}

void __93__PKPaymentWebServiceTargetDevice__updateMetadataOnPassWithIdentifier_credential_completion___block_invoke(void *a1, char a2)
{
  uint64_t v2 = a1[6];
  if (a2)
  {
    id v6 = [*(id *)(a1[4] + 8) passWithUniqueID:a1[5]];
    id v3 = [v6 paymentPass];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v5 = a1[6];
    v4(v5, 0);
  }
}

- (void)_addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5
{
}

- (void)_removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5
{
}

- (void)_declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
}

- (void)_removeSharingInvitation:(id)a3 withCompletion:(id)a4
{
}

- (void)_requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)_canAddSecureElementPassWithConfiguration:(id)a3 completion:(id)a4
{
  if (a4) {
    -[PKPassLibrary canAddSecureElementPassWithConfiguration:completion:](self->_passLibrary, "canAddSecureElementPassWithConfiguration:completion:", a3);
  }
}

- (void)_canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
}

- (void)_credentialWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)_subcredentialInvitationsWithCompletion:(id)a3
{
}

- (void)_passSharesForCredentialIdentifier:(id)a3 completion:(id)a4
{
}

- (void)_matchingInvitationOnDevice:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
}

- (void)_setDefaultPaymentPassUniqueIdentifier:(id)a3
{
}

- (void)_performDeviceCheckInWithCompletion:(id)a3
{
}

- (void)_performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[PKDeviceRegistrationService sharedInstance];
  [v10 performDeviceRegistrationReturningContextForReason:v9 brokerURL:v8 actionType:1 completion:v7];
}

- (void)_storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
}

- (void)_passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)_productsWithRequest:(id)a3 completion:(id)a4
{
}

- (void)_performProductActionRequest:(id)a3 completion:(id)a4
{
}

- (BOOL)_willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3
{
  return [(PKPaymentService *)self->_paymentService willPassWithUniqueIdentifierAutomaticallyBecomeDefault:a3];
}

- (void)_consistencyCheck
{
}

- (void)_initializeSecureElementIfNecessaryWithCompletion:(id)a3
{
}

- (void)_initializeSecureElement:(id)a3
{
}

- (void)familyMembersWithCompletion:(id)a3
{
}

- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4
{
}

- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3
{
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
{
}

- (void)generateIdentityProvisioningAttestationsWithISOCredential:(id)a3 pairingID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = (objc_class *)MEMORY[0x1E4F5C1D0];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __114__PKPaymentWebServiceTargetDevice_generateIdentityProvisioningAttestationsWithISOCredential_pairingID_completion___block_invoke;
  v13[3] = &unk_1E56D9320;
  id v14 = v7;
  id v12 = v7;
  [v11 generateIdentityProvisioningAttestationsWithCredential:v10 pairingID:v9 completion:v13];
}

void __114__PKPaymentWebServiceTargetDevice_generateIdentityProvisioningAttestationsWithISOCredential_pairingID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 transactionKeys];
    id v8 = objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_125);

    id v9 = [PKIdentityProvisioningAttestations alloc];
    id v10 = [v5 authorizationKeyAttestation];
    id v11 = [v5 deviceEncryptionKeyAttestation];
    id v12 = [v5 deviceEncryptionKeyAuthorization];
    id v13 = [v5 progenitorKeyCASDAttestation];
    id v14 = [v5 serverAttestedProvisioningData];
    id v15 = [(PKIdentityProvisioningAttestations *)v9 initWithAuthorizationKeyAttestation:v10 deviceEncryptionKeyAttestation:v11 deviceEncryptionKeyAuthorization:v12 progenitorKeyCASDAttestation:v13 transactionKeys:v8 serverAttestedProvisioningData:v14];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v16 = PKLogFacilityTypeGetObject(0x24uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Failed to generate identity attestations with error: %@", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v17 = *(void *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v6);
      goto LABEL_8;
    }
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v8);
  }

LABEL_8:
}

PKIdentityProvisioningTransactionKey *__114__PKPaymentWebServiceTargetDevice_generateIdentityProvisioningAttestationsWithISOCredential_pairingID_completion___block_invoke_122(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [PKIdentityProvisioningTransactionKey alloc];
  uint64_t v4 = [v2 casdAttestation];
  id v5 = [v2 authorization];

  id v6 = [(PKIdentityProvisioningTransactionKey *)v3 initWithCASDAttestation:v4 authorization:v5];
  return v6;
}

- (void)currentSecureElementSnapshot:(id)a3
{
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUpgradeController, 0);
  objc_storeStrong((id *)&self->_activePasscodeUpgradeFlowAssertion, 0);
  objc_storeStrong((id *)&self->_requiringUpgradedPasscodeAssertion, 0);
  objc_storeStrong((id *)&self->_verificationAssertion, 0);
  objc_storeStrong((id *)&self->_provisioningAssertion, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end