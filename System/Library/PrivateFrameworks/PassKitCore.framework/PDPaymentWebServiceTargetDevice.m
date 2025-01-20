@interface PDPaymentWebServiceTargetDevice
- (BOOL)_willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3;
- (BOOL)canAddPaymentPass;
- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3;
- (BOOL)isDeviceInRestrictedMode;
- (BOOL)isOrderManagementDisabled;
- (BOOL)isOrderManagementNotificationsDisabled;
- (BOOL)isPaymentHandoffDisabled;
- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4;
- (BOOL)secureElementIsProductionSigned;
- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3;
- (NSString)secureElementIdentifier;
- (PDPaymentWebServiceTargetDevice)initWithDataSource:(id)a3;
- (PKOSVersionRequirement)deviceVersion;
- (PKPaymentDataProviderDelegate)delegate;
- (PKPaymentWebService)paymentWebService;
- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3;
- (id)entitlementsForPassIdentifier:(id)a3;
- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (id)passWithUniqueID:(id)a3;
- (id)passesWithReaderIdentifier:(id)a3;
- (id)paymentPasses;
- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4;
- (id)peerPaymentPassUniqueID;
- (id)upgradeRequestForPass:(id)a3;
- (void)_accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)_addPass:(id)a3 properties:(id)a4 completion:(id)a5;
- (void)_addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5;
- (void)_cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)_canAcceptInvitation:(id)a3 withCompletion:(id)a4;
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
- (void)_performDeviceCheckInWithCompletion:(id)a3;
- (void)_performProductActionRequest:(id)a3 completion:(id)a4;
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
- (void)accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5;
- (void)addPendingProvisionings:(id)a3 completion:(id)a4;
- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6;
- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4;
- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7;
- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3;
- (void)deleteKeyMaterialForSubCredentialId:(id)a3;
- (void)deleteReservation:(id)a3 completion:(id)a4;
- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4;
- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)familyMembersWithCompletion:(id)a3;
- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4;
- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5;
- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4;
- (void)notePasscodeUpgradeFlowDidEnd;
- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3;
- (void)noteProvisioningDidBegin;
- (void)noteProvisioningDidEnd;
- (void)paymentWebService:(id)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)productsWithRequest:(id)a3 completion:(id)a4;
- (void)rejectShareForMailboxAddress:(id)a3;
- (void)removePass:(id)a3;
- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4;
- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4;
- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4;
- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)setDefaultPaymentPassIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOrderManagementDisabled:(BOOL)a3;
- (void)setOrderManagementNotificationsDisabled:(BOOL)a3;
- (void)setPaymentHandoffDisabled:(BOOL)a3;
- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9;
- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4;
- (void)updatedAccountsForProvisioningWithCompletion:(id)a3;
@end

@implementation PDPaymentWebServiceTargetDevice

- (PDPaymentWebServiceTargetDevice)initWithDataSource:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPaymentWebServiceTargetDevice;
  v5 = [(PDPaymentWebServiceTargetDevice *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[PKSecureElement sharedSecureElement];
    secureElement = v5->_secureElement;
    v5->_secureElement = (PKSecureElement *)v6;

    objc_storeWeak((id *)&v5->_dataSource, v4);
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_provisioningAssertionCount = 0;
    v5->_passcodeUpdateAssertionCount = 0;
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    passcodeUpdateCompletions = v5->_passcodeUpdateCompletions;
    v5->_passcodeUpdateCompletions = v8;
  }
  return v5;
}

- (void)_addPass:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = PDDefaultQueue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10036B43C;
  v15[3] = &unk_100730578;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained paymentWebServiceCoordinator];
  [v8 startBackgroundVerificationObserverForPass:v7 verificationMethod:v6];
}

- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    p_dataSource = &self->_dataSource;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    v15 = [WeakRetained upgradeController];

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)p_dataSource);
      id v17 = [v16 upgradeController];
      [v17 requestPassUpgrade:v10 pass:v11 diagnosticReason:@"User upgrade" completion:v12];
    }
  }
}

- (void)_setExpressWithPassConfiguration:(id)a3 credential:(id)a4 handler:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v11 = [WeakRetained expressPassManager];
  sub_1001903B0((uint64_t)v11, v10, v9, v8);
}

- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
  if (a4)
  {
    p_dataSource = &self->_dataSource;
    id v6 = a4;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    id v8 = [WeakRetained expressPassManager];
    sub_10018E9FC((uint64_t)v8, v7, v6);
  }
}

- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  if (a5)
  {
    p_dataSource = &self->_dataSource;
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    id v11 = [WeakRetained expressPassManager];
    sub_10018EECC((uint64_t)v11, v10, v9, v8);
  }
}

- (void)_sanitizeExpressPasses
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v2 = [WeakRetained expressPassManager];
  -[PDExpressPassManager secureElementExpressConfigurationNeedsUpdate]_0((uint64_t)v2);
}

- (id)upgradeRequestForPass:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)PKExpressPassController) initWithPaymentDataProvider:self passLibraryDataProvider:self isForWatch:0];
  id v6 = [v5 expressModeUpgradeRequestForPass:v4];

  return v6;
}

- (void)_removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained expressPassManager];
  sub_100190B0C((uint64_t)v8, v7, v6);
}

- (void)_downloadAllPaymentPasses
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v2 = [WeakRetained paymentWebServiceCoordinator];
  [v2 initiateDevicePassesDownload];
}

- (void)_removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v9 = [WeakRetained databaseManager];
  id v10 = [v9 passWithUniqueIdentifier:v15];

  if (v10)
  {
    if ([v10 passType] == (id)1) {
      uint64_t v11 = 6;
    }
    else {
      uint64_t v11 = 3;
    }
    uint64_t v12 = +[NSString stringWithFormat:@"[WebServiceTargetDevice] %@", v6];

    id v13 = objc_loadWeakRetained((id *)p_dataSource);
    id v14 = [v13 cardFileManager];
    [v14 deleteCardWithUniqueID:v15 forReason:v11 withDiagnosticReason:v12];

    id v6 = (id)v12;
  }
}

- (void)_cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained applyManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10036BD48;
  v8[3] = &unk_100736918;
  id v9 = v4;
  id v7 = v4;
  [v6 applicationsWithCompletion:v8];
}

- (void)_featureApplicationsForProvisioningWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = [WeakRetained applyManager];
  [v5 updateApplicationsWithCompletion:v4];
}

- (void)_accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = [WeakRetained paymentWebServiceCoordinator];
  [v5 accountAttestationAnonymizationSaltWithCompletion:v4];
}

- (void)_setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained paymentWebServiceCoordinator];
  [v8 setAccountAttestationAnonymizationSalt:v7 withCompletion:v6];
}

- (void)_enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = [WeakRetained devicePasscodeManager];
  [v5 enforceUpgradedPasscodePolicyWithCompletion:v4];
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = (void (**)(id, id, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = [WeakRetained devicePasscodeManager];
  id v9 = 0;
  id v7 = [v6 currentPasscodeMeetsUpgradedPasscodePolicy:&v9];
  id v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    unint64_t passcodeUpdateAssertionCount = self->_passcodeUpdateAssertionCount;
    self->_unint64_t passcodeUpdateAssertionCount = passcodeUpdateAssertionCount + 1;
    passcodeUpdateAssertionIdentifier = self->_passcodeUpdateAssertionIdentifier;
    if (passcodeUpdateAssertionCount) {
      BOOL v8 = passcodeUpdateAssertionIdentifier == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      passcodeUpdateCompletions = self->_passcodeUpdateCompletions;
      id v11 = objc_retainBlock(v4);
      [(NSMutableArray *)passcodeUpdateCompletions addObject:v11];

      os_unfair_lock_unlock(p_lock);
    }
    else if (passcodeUpdateAssertionCount)
    {
      BOOL v9 = passcodeUpdateAssertionIdentifier != 0;
      os_unfair_lock_unlock(p_lock);
      (*((void (**)(id, BOOL, void))v4 + 2))(v4, v9, 0);
    }
    else
    {
      uint64_t v12 = self->_passcodeUpdateCompletions;
      id v13 = objc_retainBlock(v4);
      [(NSMutableArray *)v12 addObject:v13];

      os_unfair_lock_unlock(&self->_lock);
      id v14 = +[NSUUID UUID];
      id v15 = [v14 UUIDString];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      id v17 = [WeakRetained assertionManager];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10036C248;
      v19[3] = &unk_100737AC0;
      v19[4] = self;
      id v20 = v15;
      id v18 = v15;
      [v17 acquireAssertionOfType:6 withIdentifier:v18 reason:@"background provisioning" handler:v19];
    }
  }
}

- (void)notePasscodeUpgradeFlowDidEnd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = self->_passcodeUpdateAssertionCount - 1;
  self->_unint64_t passcodeUpdateAssertionCount = v4;
  id v5 = [(NSString *)self->_passcodeUpdateAssertionIdentifier copy];
  id v10 = v5;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (v6)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    passcodeUpdateAssertionIdentifier = self->_passcodeUpdateAssertionIdentifier;
    self->_passcodeUpdateAssertionIdentifier = 0;

    os_unfair_lock_unlock(p_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    BOOL v9 = [WeakRetained assertionManager];
    [v9 invalidateAssertionOfType:6 withIdentifier:v10 handler:0];
  }
}

- (void)_updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v12 = [WeakRetained subcredentialManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10036C5B0;
  v15[3] = &unk_1007332B8;
  id v16 = v8;
  id v17 = v9;
  void v15[4] = self;
  id v13 = v8;
  id v14 = v9;
  [v12 updateMetadataOnPassWithIdentifier:v13 credential:v10 completion:v15];
}

- (void)_addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5
{
  id v14 = a5;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v11 = [WeakRetained subcredentialManager];
  id v12 = [v11 addPassShare:v9 onCredentialWithIdentifier:v8];

  id v13 = v14;
  if (v14)
  {
    (*((void (**)(id, id))v14 + 2))(v14, v12);
    id v13 = v14;
  }
}

- (void)_removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5
{
  id v14 = a5;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v11 = [WeakRetained subcredentialManager];
  id v12 = [v11 removeSharingInvitationReceiptWithIdentifiers:v9 onCredential:v8];

  id v13 = v14;
  if (v14)
  {
    (*((void (**)(id, id))v14 + 2))(v14, v12);
    id v13 = v14;
  }
}

- (void)_declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained subcredentialManager];
  [v8 declineRelatedSharingInvitationsIfNecessary:v7 withCompletion:v6];
}

- (void)_removeSharingInvitation:(id)a3 withCompletion:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = [WeakRetained subcredentialManager];
  id v9 = [v6 identifier];

  id v10 = [v8 removeSharingInvitationWithIdentifier:v9];
  id v11 = v12;
  if (v12)
  {
    (*((void (**)(id, id))v12 + 2))(v12, v10);
    id v11 = v12;
  }
}

- (void)_requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = [WeakRetained subcredentialManager];
  [v8 requestBackgroundRegistrationForCredentialWithIdentifier:v6];

  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
    id v9 = v10;
  }
}

- (void)_canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained subcredentialManager];
  [v8 canAcceptInvitation:v7 withCompletion:v6];
}

- (void)_credentialWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    p_dataSource = &self->_dataSource;
    id v7 = a4;
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    id v9 = [WeakRetained databaseManager];
    id v10 = [v9 appletSubcredentialWithIdentifier:v8];

    (*((void (**)(id, void *))a4 + 2))(v7, v10);
  }
}

- (void)_subcredentialInvitationsWithCompletion:(id)a3
{
  if (a3)
  {
    p_dataSource = &self->_dataSource;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    id v6 = [WeakRetained subcredentialManager];
    id v7 = [v6 invitations];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
}

- (void)_matchingInvitationOnDevice:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id, void))a5;
  if (v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v10 = objc_msgSend(WeakRetained, "subcredentialManager", 0);
    id v11 = [v10 invitations];

    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v7 isSameInvitationAsInvitation:v15])
          {
            id v12 = v15;
            goto LABEL_12;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    v8[2](v8, v12, 0);
  }
}

- (void)_passSharesForCredentialIdentifier:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v7 = (void (**)(void))a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v10 = [WeakRetained databaseManager];
  id v11 = [v10 passUniqueIdentifierWithCredentialIdentifier:v8];

  if (v11) {
    [(PDPaymentWebServiceTargetDevice *)self displayableSharesForPassIdentifier:v11 completion:v7];
  }
  else {
    v7[2](v7);
  }
}

- (id)entitlementsForPassIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = [WeakRetained sharingManager];
  id v7 = [v6 entitlementsForPassIdentifier:v4];

  return v7;
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained sharingManager];
  [v8 displayableSharesForPassIdentifier:v7 completion:v6];
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained sharingManager];
  [v8 displayableEntitlementsForPassIdentifier:v7 completion:v6];
}

- (void)rejectShareForMailboxAddress:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = [WeakRetained sharingManager];
  [v5 rejectShareForMailboxAddress:v4];
}

- (void)_setDefaultPaymentPassUniqueIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = [WeakRetained defaultPassManager];
  [v5 updateDefaultPaymentPassIdentifier:v4];
}

- (void)_performDeviceCheckInWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = [WeakRetained paymentWebServiceCoordinator];
  [v5 performDeviceCheckInWithCompletion:v4];
}

- (void)_storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PDUtilityQueue();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10036D21C;
  v10[3] = &unk_10072E198;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)_passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v9 = [objc_alloc((Class)PKPassOwnershipToken) initWithIdentifier:v7];

    id v8 = [v9 ownershipToken];
    (*((void (**)(id, void *))a4 + 2))(v6, v8);
  }
}

- (void)productsWithRequest:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained paymentWebServiceCoordinator];
  id v9 = [v8 paymentSetupFeaturesCoordinator];
  [v9 productsWithRequest:v7 completion:v6];
}

- (void)_performProductActionRequest:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained paymentWebServiceCoordinator];
  id v9 = [v8 paymentSetupFeaturesCoordinator];
  [v9 performProductActionRequest:v7 completion:v6];
}

- (BOOL)_willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v7 = [WeakRetained defaultPassManager];

  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = objc_loadWeakRetained((id *)p_dataSource);
    id v10 = [v9 defaultPassManager];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10036D648;
    v14[3] = &unk_10074B800;
    long long v16 = &v17;
    id v11 = v8;
    id v15 = v11;
    [v10 willPassWithUniqueIdentifierAutomaticallyBecomeDefault:v4 completion:v14];

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  char v12 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)_consistencyCheck
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v2 = [WeakRetained paymentWebServiceCoordinator];
  [v2 initiateConsistencyCheck];
}

- (void)_initializeSecureElementIfNecessaryWithCompletion:(id)a3
{
}

- (void)_initializeSecureElement:(id)a3
{
  id v4 = a3;
  secureElement = self->_secureElement;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10036D770;
  v7[3] = &unk_100749AD8;
  id v8 = v4;
  id v6 = v4;
  [(PKSecureElement *)secureElement initializeSecureElementQueuingServerConnection:1 withCompletion:v7];
}

- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v12 = [WeakRetained registrationCoordinator];

  [v12 performDeviceRegistrationForReason:v10 brokerURL:v9 action:1 forceApplePayRegister:v9 != 0 forcePeerPaymentRegister:0 completion:v8];
}

- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v7 = [WeakRetained paymentWebServiceCoordinator];
  [v7 paymentHardwareStatusWithType:a3 completion:v6];
}

- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(PDProvisioningSupportDataManager);
  [(PDProvisioningSupportDataManager *)v7 saveWithSupportData:v6 completion:v5];
}

- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  id v5 = objc_alloc_init(PDProvisioningSupportDataManager);
  [(PDProvisioningSupportDataManager *)v5 clearKnownSupportDataOfType:a3];

  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (PKOSVersionRequirement)deviceVersion
{
  return (PKOSVersionRequirement *)+[PKOSVersionRequirement fromDeviceVersion];
}

- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:a3];
}

- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = [WeakRetained databaseManager];
  id v7 = [v6 defaultPaymentApplicationForPassUniqueIdentifier:v4];

  return v7;
}

- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v12 = [WeakRetained databaseManager];
  uint64_t v13 = [v12 setDefaultPaymentApplication:v11 forPassUniqueIdentifier:v10];

  (*((void (**)(id, void *))a5 + 2))(v9, v13);
}

- (void)setPaymentHandoffDisabled:(BOOL)a3
{
}

- (void)setOrderManagementDisabled:(BOOL)a3
{
}

- (void)setOrderManagementNotificationsDisabled:(BOOL)a3
{
}

- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3
{
  return 1;
}

- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v9 = [WeakRetained databaseManager];
  id v10 = [v9 passWithPassTypeID:v7 serialNumber:v6];

  return v10;
}

- (id)passWithUniqueID:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = [WeakRetained databaseManager];
  id v7 = [v6 passWithUniqueIdentifier:v4];

  return v7;
}

- (id)passesWithReaderIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = [WeakRetained databaseManager];
  id v7 = [v6 passesWithPairedReaderIdentifier:v4];

  return v7;
}

- (id)paymentPasses
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = [WeakRetained databaseManager];
  id v4 = [v3 passesOfType:1];
  id v5 = [v4 allObjects];

  return v5;
}

- (id)peerPaymentPassUniqueID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = [WeakRetained databaseManager];
  id v4 = [v3 peerPaymentAccount];

  id v5 = [v4 associatedPassUniqueID];

  return v5;
}

- (void)removePass:(id)a3
{
  id v4 = [a3 uniqueID];
  [(PDPaymentWebServiceTargetDevice *)self _removePassWithUniqueID:v4 diagnosticReason:@"passd target device"];
}

- (BOOL)canAddPaymentPass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = [WeakRetained databaseManager];
  id v5 = [v4 countActiveSecureElementPasses];

  if (PKDisableDynamicSEAllocation())
  {
    unint64_t v6 = PKMaxPaymentCards();
    uint64_t v7 = v6;
    if (v6) {
      BOOL v8 = v6 >= (unint64_t)v5;
    }
    else {
      BOOL v8 = 0;
    }
    int v9 = v8;
  }
  else
  {
    int v9 = 0;
    uint64_t v7 = -1;
  }
  int IsAvailable = PKSecureElementIsAvailable();
  unsigned int v11 = +[PKSecureElement isInFailForward];
  int v12 = PKIsSRD();
  uint64_t v13 = [(PDPaymentWebServiceTargetDevice *)self appleAccountInformation];
  id v14 = [v13 aaAlternateDSID];
  int v15 = PKIsBeneficiaryAccountWithAltDsid();

  if (IsAvailable) {
    int v16 = v12;
  }
  else {
    int v16 = 1;
  }
  int v17 = v16 | v9 | v15 | v11;
  long long v18 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v19 = @"YES";
    int v25 = 138544898;
    if (v17) {
      CFStringRef v20 = @"NO";
    }
    else {
      CFStringRef v20 = @"YES";
    }
    CFStringRef v26 = v20;
    __int16 v27 = 2048;
    uint64_t v28 = v7;
    if (IsAvailable) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    __int16 v29 = 2048;
    if (v11) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    id v30 = v5;
    if (v12) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    __int16 v31 = 2114;
    if (!v15) {
      CFStringRef v19 = @"NO";
    }
    CFStringRef v32 = v21;
    __int16 v33 = 2114;
    CFStringRef v34 = v22;
    __int16 v35 = 2114;
    CFStringRef v36 = v23;
    __int16 v37 = 2114;
    CFStringRef v38 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "canAddPass: %{public}@ with maxCards: %ld, passCount: %ld - seAvailable: %{public}@, isInFailForward: %{public}@ isSRD: %{public}@ isBeneficiaryAccount: %{public}@", (uint8_t *)&v25, 0x48u);
  }

  return v17 ^ 1;
}

- (void)setDefaultPaymentPassIdentifier:(id)a3
{
}

- (BOOL)isDeviceInRestrictedMode
{
  id v2 = objc_alloc_init((Class)PKSecureElement);
  unsigned __int8 v3 = [v2 isInRestrictedMode];

  return v3;
}

- (BOOL)isPaymentHandoffDisabled
{
  return _PKHandoffPaymentsDisabled(self, a2);
}

- (BOOL)isOrderManagementDisabled
{
  return _PKOrderManagementDisabled(self, a2);
}

- (BOOL)isOrderManagementNotificationsDisabled
{
  return _PKOrderManagementNotificationsDisabled(self, a2);
}

- (PKPaymentWebService)paymentWebService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unsigned __int8 v3 = [WeakRetained paymentWebServiceCoordinator];
  id v4 = [v3 sharedWebService];

  return (PKPaymentWebService *)v4;
}

- (NSString)secureElementIdentifier
{
  id v2 = objc_alloc_init((Class)PKSecureElement);
  unsigned __int8 v3 = [v2 primarySecureElementIdentifier];

  return (NSString *)v3;
}

- (BOOL)secureElementIsProductionSigned
{
  id v2 = objc_alloc_init((Class)PKSecureElement);
  unsigned __int8 v3 = [v2 isProductionSigned];

  return v3;
}

- (void)noteProvisioningDidBegin
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t provisioningAssertionCount = self->_provisioningAssertionCount;
  self->_unint64_t provisioningAssertionCount = provisioningAssertionCount + 1;
  os_unfair_lock_unlock(p_lock);
  if (!provisioningAssertionCount)
  {
    id v5 = +[NSUUID UUID];
    unint64_t v6 = [v5 UUIDString];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    BOOL v8 = [WeakRetained assertionManager];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10036E29C;
    v10[3] = &unk_100737AC0;
    void v10[4] = self;
    id v11 = v6;
    id v9 = v6;
    [v8 acquireAssertionOfType:1 withIdentifier:v9 reason:@"background provisioning" handler:v10];
  }
}

- (void)noteProvisioningDidEnd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = self->_provisioningAssertionCount - 1;
  self->_unint64_t provisioningAssertionCount = v4;
  id v5 = [(NSString *)self->_provisioningAssertionIdentifier copy];
  id v10 = v5;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (v6)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    provisioningAssertionIdentifier = self->_provisioningAssertionIdentifier;
    self->_provisioningAssertionIdentifier = 0;

    os_unfair_lock_unlock(p_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v9 = [WeakRetained assertionManager];
    [v9 invalidateAssertionOfType:1 withIdentifier:v10 handler:0];
  }
}

- (void)familyMembersWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = [WeakRetained familyCircleManager];
  [v5 familyMembersWithCachePolicy:1 completion:v4];
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
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  BOOL v8 = [WeakRetained isoManager];
  [v8 generateISOEncryptionCertificateForSubCredentialId:v7 completion:v6];
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v10 = [WeakRetained isoManager];
  [v10 addISO18013Blobs:v9 cardType:a4 completion:v8];
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = [WeakRetained isoManager];
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
  [v6 deleteSubCredentialIdentifiers:v7 cardType:3];

  id v9 = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [v9 subcredentialManager];
  [v8 revokeSubcredentialForIdentifier:v4 withCompletion:0];
}

- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained subcredentialManager];
  [v8 revokeSubcredentialsForReaderIdentifiers:v7 withCompletion:v6];
}

- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10036E830;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained accountManager];
  [v8 triggerCloudStoreZoneCreationForAccount:v7 withCompletion:v6];
}

- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10036EA38;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  CFStringRef v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_100020C2C;
  int v16 = sub_100021108;
  id v17 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = [WeakRetained provisioningRequirementsChecker];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10036EC20;
  v11[3] = &unk_10074B828;
  v11[4] = &v18;
  v11[5] = &v12;
  [v8 meetsWithRequirementsContainer:v6 completion:v11];

  if (a4) {
    *a4 = (id) v13[5];
  }
  char v9 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v9 = [WeakRetained accountManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10036ED20;
  v11[3] = &unk_100741A68;
  id v12 = v6;
  id v10 = v6;
  [v9 accountWithIdentifier:v7 completion:v11];
}

- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v7 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  char v9 = [WeakRetained accountManager];
  [v9 updateAccountWithIdentifier:v8 extended:0 completion:v7];
}

- (void)updatedAccountsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained accountManager];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10036EE9C;
  v9[3] = &unk_10072DFD8;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 updateAccountsWithCompletion:v9];
}

- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained databaseManager];
  id v7 = [v6 passesOfType:a4];
  id v8 = [v7 allObjects];

  return v8;
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v12 = [WeakRetained paymentWebServiceCoordinator];
  id v14 = [v12 sharedWebService];

  id v13 = [objc_alloc((Class)PKProvisioningSEStorageManager) initWithWebService:v14];
  [v13 reserveStorageForAppletTypes:v10 metadata:v9 completion:v8];
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v9 = [WeakRetained paymentWebServiceCoordinator];
  id v11 = [v9 sharedWebService];

  id v10 = [objc_alloc((Class)PKProvisioningSEStorageManager) initWithWebService:v11];
  [v10 deleteReservation:v7 completion:v6];
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v9 = [WeakRetained auxiliaryCapabilityManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10036F1A4;
  v11[3] = &unk_100731F88;
  id v12 = v6;
  id v10 = v6;
  [v9 registerLocalAuxiliaryCapabilities:v7 withPass:0 completion:v11];
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        id v14 = [WeakRetained pendingProvisioningManager];
        [v14 storePendingProvisioning:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  v7[2](v7, 0);
}

- (void)paymentWebService:(id)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5
{
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  uint64_t v10 = [WeakRetained pushProvisioningManager];
  [v10 prepareProvisioningTarget:v9 checkFamilyCircle:v5 completion:v8];
}

- (PKPaymentDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPaymentDataProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeUpdateCompletions, 0);
  objc_storeStrong((id *)&self->_passcodeUpdateAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningAssertionIdentifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_secureElement, 0);
}

@end