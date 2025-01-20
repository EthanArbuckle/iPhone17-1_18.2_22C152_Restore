@interface PKPaymentWebServiceLocalProxyTargetDevice
- (BOOL)areUnifiedAccessPassesSupported;
- (BOOL)claimSecureElementForCurrentUser;
- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4;
- (BOOL)paymentWebService:(id)a3 canProvisionPaymentPassWithPrimaryAccountIdentifier:(id)a4;
- (BOOL)paymentWebService:(id)a3 hasPassesOfType:(unint64_t)a4;
- (BOOL)paymentWebServiceSupportsAccounts:(id)a3;
- (BOOL)paymentWebServiceSupportsPeerPaymentRegistration:(id)a3;
- (BOOL)secureElementIsAvailable;
- (BOOL)supportsAutomaticPassPresentation;
- (BOOL)supportsCheckingProvisioningRequirements;
- (BOOL)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3;
- (NSXPCConnection)connection;
- (PKPaymentWebServiceLocalProxyTargetDevice)initWithConnection:(id)a3;
- (id)_proxy;
- (id)_proxyWithErrorHandler:(id)a3;
- (id)_synchronousProxy;
- (id)_synchronousProxyWithErrorHandler:(id)a3;
- (id)allPaymentApplicationUsageSummaries;
- (id)appleAccountInformation;
- (id)bridgedClientInfo;
- (id)context;
- (id)deviceVersion;
- (id)passesWithReaderIdentifier:(id)a3;
- (id)paymentWebService:(id)a3 filterVerificationChannels:(id)a4;
- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4;
- (id)secureElementIdentifiers;
- (id)supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:(id)a3;
- (id)supportedFeatureIdentifiersWithPaymentWebService:(id)a3;
- (unint64_t)maximumPaymentCards;
- (unint64_t)paymentSupportedInCurrentRegionForWebService:(id)a3;
- (unint64_t)registrationSupportedInCurrentRegionForWebService:(id)a3;
- (unint64_t)secureElementOwnershipStateForCurrentUser;
- (void)_invalidateConnection;
- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5;
- (void)addPendingProvisionings:(id)a3 completion:(id)a4;
- (void)applePayTrustKeyForIdentifier:(id)a3 completion:(id)a4;
- (void)archiveBackgroundContext:(id)a3;
- (void)archiveContext:(id)a3;
- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3;
- (void)cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6;
- (void)claimSecureElementForCurrentUserWithCompletion:(id)a3;
- (void)contextWithCompletion:(id)a3;
- (void)createApplePayTrustKeyWithRequest:(id)a3 completion:(id)a4;
- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7;
- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3;
- (void)currentSecureElementSnapshot:(id)a3;
- (void)dealloc;
- (void)deleteApplePayTrustKeyWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteKeyMaterialForSubCredentialId:(id)a3;
- (void)deleteReservation:(id)a3 completion:(id)a4;
- (void)downloadAllPaymentPassesForPaymentWebService:(id)a3;
- (void)encryptedServiceProviderDataForSecureElementPass:(id)a3 completion:(id)a4;
- (void)endRequiringUpgradedPasscodeIfNecessary;
- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)familyMembersWithCompletion:(id)a3;
- (void)featureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4;
- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5;
- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4;
- (void)notePasscodeUpgradeFlowDidEnd;
- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3;
- (void)noteProvisioningDidBegin;
- (void)noteProvisioningDidEnd;
- (void)noteProvisioningUserInterfaceDidAppear;
- (void)noteProvisioningUserInterfaceDidDisappear;
- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandler:(id)a5;
- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandlerV2:(id)a5;
- (void)paymentWebService:(id)a3 configurationDataWithCompletionHandler:(id)a4;
- (void)paymentWebService:(id)a3 deleteApplicationWithAID:(id)a4;
- (void)paymentWebService:(id)a3 deviceMetadataWithFields:(unint64_t)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 didRegisterWithRegionMap:(id)a4 primaryRegionTopic:(id)a5;
- (void)paymentWebService:(id)a3 generateTransactionKeyWithParameters:(id)a4 withCompletion:(id)a5;
- (void)paymentWebService:(id)a3 handlePotentialExpressPass:(id)a4 withCompletionHandler:(id)a5;
- (void)paymentWebService:(id)a3 passOwnershipTokenWithIdentifier:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 provisioningDataIncludingDeviceMetadata:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)paymentWebService:(id)a3 queueConnectionToTrustedServiceManagerForPushTopic:(id)a4 withCompletion:(id)a5;
- (void)paymentWebService:(id)a3 registrationDataWithCompletionHandler:(id)a4;
- (void)paymentWebService:(id)a3 removePass:(id)a4 withCompletionHandler:(id)a5;
- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)paymentWebService:(id)a3 setDefaultPaymentPassUniqueIdentifier:(id)a4;
- (void)paymentWebService:(id)a3 setNewAuthRandom:(id)a4;
- (void)paymentWebService:(id)a3 setNewAuthRandomIfNecessaryReturningPairingState:(id)a4;
- (void)paymentWebService:(id)a3 signData:(id)a4 signatureEntanglementMode:(unint64_t)a5 withCompletionHandler:(id)a6;
- (void)paymentWebService:(id)a3 storePassOwnershipToken:(id)a4 withIdentifier:(id)a5;
- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 validateAddPreconditionsWithCompletion:(id)a4;
- (void)paymentWebService:(id)a3 validateTransferPreconditionsWithCompletion:(id)a4;
- (void)performDeviceCheckInWithCompletion:(id)a3;
- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4;
- (void)renewAppleAccountWithCompletionHandler:(id)a3;
- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9;
- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3;
- (void)statusForShareableCredentials:(id)a3 completion:(id)a4;
- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4;
- (void)updatedAccountsForProvisioningWithCompletion:(id)a3;
@end

@implementation PKPaymentWebServiceLocalProxyTargetDevice

- (PKPaymentWebServiceLocalProxyTargetDevice)initWithConnection:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentWebServiceLocalProxyTargetDevice;
  v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)&v27 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.passkit.localTargetDeviceHandlerQueue", MEMORY[0x1E4F14430]);
    handlerQueue = v6->_handlerQueue;
    v6->_handlerQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_connection, a3);
    connection = v6->_connection;
    v10 = PKPaymentWebServiceProxyObjectInterface();
    [(NSXPCConnection *)connection setRemoteObjectInterface:v10];

    v11 = [(NSXPCConnection *)v6->_connection invalidationHandler];
    v12 = v6->_connection;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __64__PKPaymentWebServiceLocalProxyTargetDevice_initWithConnection___block_invoke;
    v25[3] = &unk_1E56D8360;
    id v13 = v11;
    id v26 = v13;
    [(NSXPCConnection *)v12 setInvalidationHandler:v25];
    v14 = [(NSXPCConnection *)v6->_connection interruptionHandler];
    v15 = v6->_connection;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __64__PKPaymentWebServiceLocalProxyTargetDevice_initWithConnection___block_invoke_259;
    v23 = &unk_1E56D8360;
    id v16 = v14;
    id v24 = v16;
    [(NSXPCConnection *)v15 setInterruptionHandler:&v20];
    [(NSXPCConnection *)v6->_connection resume];
    v17 = PKLogFacilityTypeGetObject(4uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v6->_connection;
      *(_DWORD *)buf = 138412290;
      v29 = v18;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_INFO, "PKPaymentWebServiceLocalProxyTargetDevice initialized with XPC Connection: %@.", buf, 0xCu);
    }
  }
  return v6;
}

void __64__PKPaymentWebServiceLocalProxyTargetDevice_initWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  v2 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_INFO, "PKPaymentWebServiceLocalProxyTargetDevice connection invalidated.", v3, 2u);
  }
}

void __64__PKPaymentWebServiceLocalProxyTargetDevice_initWithConnection___block_invoke_259(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  v2 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_INFO, "PKPaymentWebServiceLocalProxyTargetDevice connection interrupted.", v3, 2u);
  }
}

- (void)dealloc
{
  [(PKPaymentWebServiceLocalProxyTargetDevice *)self _invalidateConnection];
  v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceLocalProxyTargetDevice dealloc'd.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentWebServiceLocalProxyTargetDevice;
  [(PKPaymentWebServiceLocalProxyTargetDevice *)&v4 dealloc];
}

- (void)_invalidateConnection
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v3 invalidateRemoteProxyTargetDevice];

  [(NSXPCConnection *)self->_connection invalidate];
  objc_super v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v7 = 138412290;
    v8 = connection;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceLocalProxyTargetDevice invalidated XPC Connection: %@.", (uint8_t *)&v7, 0xCu);
  }

  v6 = self->_connection;
  self->_connection = 0;
}

- (id)_proxy
{
  return [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:0];
}

- (id)_proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PKPaymentWebServiceLocalProxyTargetDevice__proxyWithErrorHandler___block_invoke;
  v11[3] = &unk_1E56D8388;
  id v6 = v4;
  id v12 = v6;
  int v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  if (!v7)
  {
    v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceLocalProxyTargetDevice failed to create a remote proxy object.", v10, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKPaymentWebServiceLocalProxyTargetDevice failed to create a remote proxy object."];
  }

  return v7;
}

void __68__PKPaymentWebServiceLocalProxyTargetDevice__proxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "PKPaymentWebServiceLocalProxyTargetDevice XPC Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (id)_synchronousProxy
{
  return [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxyWithErrorHandler:0];
}

- (id)_synchronousProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__PKPaymentWebServiceLocalProxyTargetDevice__synchronousProxyWithErrorHandler___block_invoke;
  v11[3] = &unk_1E56D8388;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  if (!v7)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceLocalProxyTargetDevice failed to create a synchronous remote proxy object.", v10, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKPaymentWebServiceLocalProxyTargetDevice failed to create a synchronous remote proxy object."];
  }

  return v7;
}

void __79__PKPaymentWebServiceLocalProxyTargetDevice__synchronousProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "PKPaymentWebServiceLocalProxyTargetDevice synchronous XPC Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (id)context
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PKPaymentWebServiceLocalProxyTargetDevice_context__block_invoke;
  v7[3] = &unk_1E56D83B0;
  uint64_t v9 = &v10;
  id v4 = v3;
  uint64_t v8 = v4;
  [(PKPaymentWebServiceLocalProxyTargetDevice *)self contextWithCompletion:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __52__PKPaymentWebServiceLocalProxyTargetDevice_context__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)contextWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v5 = v4;
  id v11 = v5;
  int v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke_2;
  v8[3] = &unk_1E56D8400;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 getContextWithCompletion:v8];
}

uint64_t __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke_3;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)encryptedServiceProviderDataForSecureElementPass:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke;
  v13[3] = &unk_1E56D8388;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke_2;
  v11[3] = &unk_1E56D8450;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 getEncryptedServiceProviderDataForSecureElementPass:v8 completion:v11];
}

uint64_t __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke_3;
  block[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)paymentWebService:(id)a3 queueConnectionToTrustedServiceManagerForPushTopic:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke;
  v14[3] = &unk_1E56D8388;
  id v8 = v7;
  id v15 = v8;
  id v9 = a4;
  id v10 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_2;
  v12[3] = &unk_1E56D84A0;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 queueConnectionToTrustedServiceManagerForPushTopic:v9 withCompletion:v12];
}

uint64_t __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_3;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)paymentWebService:(id)a3 configurationDataWithCompletionHandler:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E56D8388;
  id v6 = v5;
  id v12 = v6;
  id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E56D84C8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 getConfigurationDataWithCompletion:v9];
}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)paymentWebService:(id)a3 registrationDataWithCompletionHandler:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_registrationDataWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E56D8388;
  id v6 = v5;
  id v12 = v6;
  id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_registrationDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E56D84F0;
  id v10 = v6;
  id v8 = v6;
  [v7 getRegistrationDataWithCompletion:v9];
}

uint64_t __101__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_registrationDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __101__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_registrationDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paymentWebService:(id)a3 signData:(id)a4 signatureEntanglementMode:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v9 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E56D8388;
  id v10 = v9;
  id v17 = v10;
  id v11 = a4;
  id v12 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E56D8540;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 signData:v11 signatureEntanglementMode:a5 withCompletion:v14];
}

uint64_t __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E56D8518;
  id v11 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v10, v15);
}

uint64_t __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)paymentWebService:(id)a3 provisioningDataIncludingDeviceMetadata:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E56D8388;
  id v8 = v7;
  id v14 = v8;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E56D8568;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 getProvisioningDataIncludingDeviceMetadata:v5 withCompletion:v11];
}

uint64_t __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)paymentWebService:(id)a3 deleteApplicationWithAID:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v6 deleteApplicationWithAID:v5];
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v5 deleteKeyMaterialForSubCredentialId:v4];
}

- (void)paymentWebService:(id)a3 didRegisterWithRegionMap:(id)a4 primaryRegionTopic:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v9 didRegisterWithRegionMap:v8 primaryRegionTopic:v7];
}

- (id)paymentWebService:(id)a3 filterVerificationChannels:(id)a4
{
  id v4 = a4;
  return v4;
}

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E56D85B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 renewAppleAccountWithCompletionHandler:v8];
}

uint64_t __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 2, 0);
  }
  return result;
}

void __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E56D8590;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[6], a1[4]);
  }
  return result;
}

- (id)appleAccountInformation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKPaymentWebServiceLocalProxyTargetDevice_appleAccountInformation__block_invoke;
  v5[3] = &unk_1E56D85E0;
  v5[4] = &v6;
  [v2 appleAccountInformationWithCompletion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __68__PKPaymentWebServiceLocalProxyTargetDevice_appleAccountInformation__block_invoke(uint64_t a1, void *a2)
{
}

- (unint64_t)paymentSupportedInCurrentRegionForWebService:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_paymentSupportedInCurrentRegionForWebService___block_invoke;
  v8[3] = &unk_1E56D8608;
  v8[4] = &v9;
  [v5 paymentSupportedInCurrentRegion:v8];

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_paymentSupportedInCurrentRegionForWebService___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)registrationSupportedInCurrentRegionForWebService:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__PKPaymentWebServiceLocalProxyTargetDevice_registrationSupportedInCurrentRegionForWebService___block_invoke;
  v8[3] = &unk_1E56D8608;
  v8[4] = &v9;
  [v5 registrationSupportedInCurrentRegionWithCompletion:v8];

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __95__PKPaymentWebServiceLocalProxyTargetDevice_registrationSupportedInCurrentRegionForWebService___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)bridgedClientInfo
{
  return 0;
}

- (id)deviceVersion
{
  return +[PKOSVersionRequirement fromDeviceVersion];
}

- (BOOL)supportsAutomaticPassPresentation
{
  return PKIsPad() ^ 1;
}

- (void)noteProvisioningUserInterfaceDidAppear
{
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v2 noteProvisioningUserInterfaceDidAppear];
}

- (void)noteProvisioningUserInterfaceDidDisappear
{
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v2 noteProvisioningUserInterfaceDidDisappear];
}

- (void)noteProvisioningDidBegin
{
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v2 noteProvisioningDidBegin];
}

- (void)noteProvisioningDidEnd
{
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v2 noteProvisioningDidEnd];
}

- (id)secureElementIdentifiers
{
  return +[PKSecureElement secureElementIdentifiers];
}

- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8388;
  id v8 = v4;
  id v5 = v4;
  unint64_t v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v7];
  [v6 notePasscodeUpgradeFlowWillBeginWithCompletion:v5];
}

uint64_t __92__PKPaymentWebServiceLocalProxyTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)notePasscodeUpgradeFlowDidEnd
{
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v2 notePasscodeUpgradeFlowDidEnd];
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKPaymentWebServiceLocalProxyTargetDevice_enforceUpgradedPasscodePolicyWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8388;
  id v8 = v4;
  id v5 = v4;
  unint64_t v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v7];
  [v6 enforceUpgradedPasscodePolicyWithCompletion:v5];
}

uint64_t __89__PKPaymentWebServiceLocalProxyTargetDevice_enforceUpgradedPasscodePolicyWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__PKPaymentWebServiceLocalProxyTargetDevice_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke;
  v7[3] = &unk_1E56D8388;
  id v8 = v4;
  id v5 = v4;
  unint64_t v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v7];
  [v6 currentPasscodeMeetsUpgradedPasscodePolicy:v5];
}

uint64_t __88__PKPaymentWebServiceLocalProxyTargetDevice_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v4 startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:v3];
}

- (void)endRequiringUpgradedPasscodeIfNecessary
{
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v2 endRequiringUpgradedPasscodeIfNecessary];
}

- (void)paymentWebService:(id)a3 setNewAuthRandomIfNecessaryReturningPairingState:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke;
  v11[3] = &unk_1E56D8388;
  id v6 = v5;
  id v12 = v6;
  id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke_2;
  v9[3] = &unk_1E56D8658;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 setNewAuthRandomIfNecessaryReturningPairingState:v9];
}

uint64_t __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, 0);
  }
  return result;
}

void __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke_3;
  v13[3] = &unk_1E56D8630;
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v17 = a2;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

- (void)paymentWebService:(id)a3 setNewAuthRandom:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke;
  v11[3] = &unk_1E56D8388;
  id v6 = v5;
  id v12 = v6;
  id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke_2;
  v9[3] = &unk_1E56D86A8;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 setNewAuthRandom:v9];
}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke_2(uint64_t a1, char a2)
{
  BOOL v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke_3;
  v4[3] = &unk_1E56D8680;
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (BOOL)paymentWebService:(id)a3 hasPassesOfType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_hasPassesOfType___block_invoke;
  v9[3] = &unk_1E56D86D0;
  void v9[4] = &v10;
  [v7 hasPassesOfType:a4 completion:v9];

  LOBYTE(a4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return a4;
}

uint64_t __79__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_hasPassesOfType___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passesOfType___block_invoke;
  v10[3] = &unk_1E56D86F8;
  void v10[4] = &v11;
  [v7 passesOfType:a4 completion:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __76__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passesOfType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[PKPassLibrary sharedInstance];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = [PKRemoteDataAccessor alloc];
        uint64_t v12 = objc_msgSend(v10, "uniqueID", (void)v16);
        uint64_t v13 = [(PKRemoteDataAccessor *)v11 initWithLibrary:v4 objectUniqueID:v12];

        [v10 setDataAccessor:v13];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v5;
}

- (id)passesWithReaderIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PKPaymentWebServiceLocalProxyTargetDevice_passesWithReaderIdentifier___block_invoke;
  v8[3] = &unk_1E56D8720;
  v8[4] = &v9;
  [v5 passesWithReaderIdentifier:v4 completion:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __72__PKPaymentWebServiceLocalProxyTargetDevice_passesWithReaderIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[PKPassLibrary sharedInstance];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = [PKRemoteDataAccessor alloc];
        uint64_t v12 = objc_msgSend(v10, "uniqueID", (void)v16);
        uint64_t v13 = [(PKRemoteDataAccessor *)v11 initWithLibrary:v4 objectUniqueID:v12];

        [v10 setDataAccessor:v13];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v5;
}

- (BOOL)paymentWebService:(id)a3 canProvisionPaymentPassWithPrimaryAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v8 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __115__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_canProvisionPaymentPassWithPrimaryAccountIdentifier___block_invoke;
  v10[3] = &unk_1E56D86D0;
  void v10[4] = &v11;
  [v8 canProvisionPaymentPassWithPrimaryAccountIdentifier:v7 completion:v10];

  LOBYTE(v8) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v8;
}

uint64_t __115__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_canProvisionPaymentPassWithPrimaryAccountIdentifier___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)paymentWebService:(id)a3 validateAddPreconditionsWithCompletion:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke;
  v11[3] = &unk_1E56D8388;
  id v6 = v5;
  id v12 = v6;
  id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke_2;
  v9[3] = &unk_1E56D84A0;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 validateAddPreconditionsWithCompletion:v9];
}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    PKDisplayableErrorForCommonType(0, 0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke_3;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)paymentWebService:(id)a3 handlePotentialExpressPass:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E56D8388;
  id v8 = v7;
  id v15 = v8;
  id v9 = a4;
  id v10 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E56D8748;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 handlePotentialExpressPass:v9 withCompletion:v12];
}

uint64_t __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x192FDC630]();
  char v12 = [v9 archiveData];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v13 = v10;
  id v19 = v13;
  char v14 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E56D84A0;
  void v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 addPassData:v12 completion:v16];
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E56D8360;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)downloadAllPaymentPassesForPaymentWebService:(id)a3
{
  id v3 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v3 downloadAllPaymentPasses];
}

- (BOOL)claimSecureElementForCurrentUser
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUser__block_invoke;
  v4[3] = &unk_1E56D86D0;
  void v4[4] = &v5;
  [v2 claimSecureElementForCurrentUserWithCompletion:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __77__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUser__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)claimSecureElementForCurrentUserWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke;
  v10[3] = &unk_1E56D8770;
  id v5 = v4;
  void v10[4] = self;
  id v11 = v5;
  id v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_3;
  v8[3] = &unk_1E56D8798;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 claimSecureElementForCurrentUserWithCompletion:v8];
}

void __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    id v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_2;
    block[3] = &unk_1E56D8360;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_4;
    v5[3] = &unk_1E56D8680;
    id v6 = v2;
    char v7 = a2;
    dispatch_async(v4, v5);
  }
}

uint64_t __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (unint64_t)secureElementOwnershipStateForCurrentUser
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_secureElementOwnershipStateForCurrentUser__block_invoke;
  v5[3] = &unk_1E56D8608;
  void v5[4] = &v6;
  [v2 secureElementOwnershipStateForCurrentUserWithCompletion:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_secureElementOwnershipStateForCurrentUser__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)paymentWebService:(id)a3 validateTransferPreconditionsWithCompletion:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke;
  v11[3] = &unk_1E56D8388;
  id v6 = v5;
  id v12 = v6;
  char v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke_2;
  v9[3] = &unk_1E56D84A0;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 validateTransferPreconditionsWithCompletion:v9];
}

void __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    PKDisplayableErrorForCommonType(0, 0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke_3;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandlerV2:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x192FDC630]();
  char v12 = [v9 archiveData];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke;
  v20[3] = &unk_1E56D8388;
  id v13 = v10;
  id v21 = v13;
  char v14 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke_2;
  v17[3] = &unk_1E56D87C0;
  id v18 = v9;
  id v19 = v13;
  v17[4] = self;
  id v15 = v9;
  id v16 = v13;
  [v14 addPassData:v12 completion:v17];
}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke_3;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 48);
  char v8 = a2;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v3 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)paymentWebService:(id)a3 removePass:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E56D8388;
  id v8 = v7;
  id v15 = v8;
  id v9 = a4;
  id v10 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E56D84A0;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 removePass:v9 completion:v12];
}

uint64_t __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)paymentWebServiceSupportsPeerPaymentRegistration:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebServiceSupportsPeerPaymentRegistration___block_invoke;
  v7[3] = &unk_1E56D86D0;
  void v7[4] = &v8;
  [v5 supportsPeerPaymentRegistrationWithCompletion:v7];

  LOBYTE(v5) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

uint64_t __94__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebServiceSupportsPeerPaymentRegistration___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)paymentWebServiceSupportsAccounts:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebServiceSupportsAccounts___block_invoke;
  v7[3] = &unk_1E56D86D0;
  void v7[4] = &v8;
  [v5 supportsAccountsWithCompletion:v7];

  LOBYTE(v5) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

uint64_t __79__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebServiceSupportsAccounts___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)supportedFeatureIdentifiersWithPaymentWebService:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = [MEMORY[0x1E4F1CAD0] set];
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_supportedFeatureIdentifiersWithPaymentWebService___block_invoke;
  v8[3] = &unk_1E56D8720;
  v8[4] = &v9;
  [v5 supportedFeatureIdentifiersWithCompletion:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __94__PKPaymentWebServiceLocalProxyTargetDevice_supportedFeatureIdentifiersWithPaymentWebService___block_invoke(uint64_t a1, void *a2)
{
}

- (id)supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = [MEMORY[0x1E4F1CAD0] set];
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __116__PKPaymentWebServiceLocalProxyTargetDevice_supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService___block_invoke;
  v8[3] = &unk_1E56D8720;
  v8[4] = &v9;
  [v5 supportedFeatureIdentifiersForAccountProvisioningWithCompletion:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __116__PKPaymentWebServiceLocalProxyTargetDevice_supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService___block_invoke(uint64_t a1, void *a2)
{
}

- (void)updatedAccountsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke;
    v10[3] = &unk_1E56D8388;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_2;
    v8[3] = &unk_1E56D87E8;
    v8[4] = self;
    id v9 = v6;
    [v7 updatedAccountsForProvisioningWithCompletion:v8];
  }
}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_3;
  block[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke;
    v13[3] = &unk_1E56D8388;
    id v8 = v6;
    id v14 = v8;
    id v9 = a3;
    id v10 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_2;
    v11[3] = &unk_1E56D86A8;
    void v11[4] = self;
    id v12 = v8;
    [v10 triggerCloudStoreZoneCreationForAccount:v9 withCompletion:v11];
  }
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_3;
  v4[3] = &unk_1E56D8680;
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke;
    v10[3] = &unk_1E56D8388;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_2;
    v8[3] = &unk_1E56D8810;
    v8[4] = self;
    id v9 = v6;
    [v7 cachedFeatureApplicationsForProvisioningWithCompletion:v8];
  }
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_3;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke;
    v10[3] = &unk_1E56D8388;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke_2;
    v8[3] = &unk_1E56D8810;
    v8[4] = self;
    id v9 = v6;
    [v7 featureApplicationsForProvisioningWithCompletion:v8];
  }
}

uint64_t __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke_3;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)paymentWebService:(id)a3 deviceMetadataWithFields:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke;
    v13[3] = &unk_1E56D8388;
    id v9 = v7;
    id v14 = v9;
    id v10 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke_2;
    v11[3] = &unk_1E56D8838;
    void v11[4] = self;
    id v12 = v9;
    [v10 deviceMetadataWithFields:a4 completion:v11];
  }
}

uint64_t __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke_3;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke;
    v14[3] = &unk_1E56D8388;
    id v9 = v7;
    id v15 = v9;
    id v10 = a4;
    id v11 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke_2;
    v12[3] = &unk_1E56D8860;
    v12[4] = self;
    id v13 = v9;
    [v11 updateAccountWithIdentifier:v10 completion:v12];
  }
}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)applePayTrustKeyForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke;
    v13[3] = &unk_1E56D8388;
    id v8 = v6;
    id v14 = v8;
    id v9 = a3;
    id v10 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke_2;
    v11[3] = &unk_1E56D8888;
    void v11[4] = self;
    id v12 = v8;
    [v10 applePayTrustKeyForIdentifier:v9 completion:v11];
  }
}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)createApplePayTrustKeyWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke;
  v13[3] = &unk_1E56D8388;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke_2;
  v11[3] = &unk_1E56D88B0;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 createApplePayTrustKeyWithRequest:v8 completion:v11];
}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke_3;
    block[3] = &unk_1E56D8428;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deleteApplePayTrustKeyWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke;
  v13[3] = &unk_1E56D8388;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E56D8798;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 deleteApplePayTrustKeyWithIdentifier:v8 completion:v11];
}

uint64_t __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke_3;
    v5[3] = &unk_1E56D8680;
    id v6 = v2;
    char v7 = a2;
    dispatch_async(v4, v5);
  }
}

uint64_t __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)supportsCheckingProvisioningRequirements
{
  return 1;
}

- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke;
  v14[3] = &unk_1E56D8770;
  id v8 = v7;
  id v15 = v6;
  id v16 = v8;
  id v9 = v6;
  id v10 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke_2;
  v12[3] = &unk_1E56D88D8;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 usingSynchronousProxy:0 meetsProvisioningRequirements:v9 completion:v12];
}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke_3;
  block[3] = &unk_1E56D8478;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v7 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_missingRequirements___block_invoke;
  v10[3] = &unk_1E56D8900;
  void v10[4] = &v17;
  void v10[5] = &v11;
  [v7 usingSynchronousProxy:1 meetsProvisioningRequirements:v6 completion:v10];

  if (a4) {
    *a4 = (id) v12[5];
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __95__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_missingRequirements___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)currentSecureElementSnapshot:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKPaymentWebServiceLocalProxyTargetDevice_currentSecureElementSnapshot___block_invoke;
  v7[3] = &unk_1E56D8388;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v7];
  [v6 currentSecureElementSnapshot:v5];
}

uint64_t __74__PKPaymentWebServiceLocalProxyTargetDevice_currentSecureElementSnapshot___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_reserveStorageForAppletTypes_metadata_completion___block_invoke;
  v13[3] = &unk_1E56D8388;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  char v12 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v13];
  [v12 reserveStorageForAppletTypes:v11 metadata:v10 completion:v9];
}

uint64_t __94__PKPaymentWebServiceLocalProxyTargetDevice_reserveStorageForAppletTypes_metadata_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PKPaymentWebServiceLocalProxyTargetDevice_deleteReservation_completion___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  [v9 deleteReservation:v8 completion:v7];
}

uint64_t __74__PKPaymentWebServiceLocalProxyTargetDevice_deleteReservation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)maximumPaymentCards
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PKPaymentWebServiceLocalProxyTargetDevice_maximumPaymentCards__block_invoke;
  v5[3] = &unk_1E56D8608;
  void v5[4] = &v6;
  [v2 maximumPaymentCardsWithCompletion:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__PKPaymentWebServiceLocalProxyTargetDevice_maximumPaymentCards__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)allPaymentApplicationUsageSummaries
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_allPaymentApplicationUsageSummaries__block_invoke;
  v5[3] = &unk_1E56D86F8;
  void v5[4] = &v6;
  [v2 allPaymentApplicationUsageSummariesWithCompletion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __80__PKPaymentWebServiceLocalProxyTargetDevice_allPaymentApplicationUsageSummaries__block_invoke(uint64_t a1, void *a2)
{
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_addPendingProvisionings_completion___block_invoke;
  v13[3] = &unk_1E56D8388;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  uint64_t v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_addPendingProvisionings_completion___block_invoke_2;
  v11[3] = &unk_1E56D8388;
  id v12 = v7;
  id v10 = v7;
  [v9 addPendingProvisionings:v8 completion:v11];
}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_addPendingProvisionings_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_addPendingProvisionings_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)secureElementIsAvailable
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PKPaymentWebServiceLocalProxyTargetDevice_secureElementIsAvailable__block_invoke;
  v4[3] = &unk_1E56D86D0;
  void v4[4] = &v5;
  [v2 secureElementIsAvailableWithCompletion:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __69__PKPaymentWebServiceLocalProxyTargetDevice_secureElementIsAvailable__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_willPassWithUniqueIdentifierAutomaticallyBecomeDefault___block_invoke;
  v7[3] = &unk_1E56D86D0;
  void v7[4] = &v8;
  [v5 willPassWithUniqueIdentifierAutomaticallyBecomeDefault:v4 completion:v7];

  LOBYTE(v5) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_willPassWithUniqueIdentifierAutomaticallyBecomeDefault___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)paymentWebService:(id)a3 setDefaultPaymentPassUniqueIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v6 setDefaultPaymentPassUniqueIdentifier:v5];
}

- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6
{
  if (a6) {
    (*((void (**)(id, void, id))a6 + 2))(a6, 0, a5);
  }
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke_2;
  v8[3] = &unk_1E56D8928;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performDeviceCheckInWithCompletion:v8];
}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke_3;
    block[3] = &unk_1E56D8478;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke;
  v16[3] = &unk_1E56D8388;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke_2;
  v14[3] = &unk_1E56D8978;
  void v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [v12 performDeviceRegistrationReturningContextForReason:v11 brokerURL:v10 completion:v14];
}

uint64_t __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, 0);
  }
  return result;
}

void __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke_3;
    v11[3] = &unk_1E56D8950;
    id v14 = v9;
    uint64_t v15 = a2;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(v10, v11);
  }
}

uint64_t __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[7], a1[4], a1[5]);
}

- (void)paymentWebService:(id)a3 storePassOwnershipToken:(id)a4 withIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v9 storePassOwnershipToken:v8 withIdentifier:v7];
}

- (void)paymentWebService:(id)a3 passOwnershipTokenWithIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke;
  v14[3] = &unk_1E56D8388;
  id v8 = v7;
  id v15 = v8;
  id v9 = a4;
  id v10 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E56D89A0;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 passOwnershipTokenWithIdentifier:v9 completion:v12];
}

uint64_t __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke_3;
    v6[3] = &unk_1E56D83D8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)familyMembersWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke_2;
  v8[3] = &unk_1E56D89C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 familyMembersWithCompletion:v8];
}

uint64_t __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke_3;
    v6[3] = &unk_1E56D83D8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)paymentWebService:(id)a3 generateTransactionKeyWithParameters:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_generateTransactionKeyWithParameters_withCompletion___block_invoke;
  v11[3] = &unk_1E56D8388;
  id v12 = v7;
  id v8 = v7;
  id v9 = a4;
  id v10 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v11];
  [v10 generateTransactionKeyWithParameters:v9 withCompletion:v8];
}

uint64_t __115__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_generateTransactionKeyWithParameters_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, uint64_t))(result + 16))(result, 0, 0, 0, a2);
  }
  return result;
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_statusForShareableCredentials_completion___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  [v9 statusForShareableCredentials:v8 completion:v7];
}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_statusForShareableCredentials_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v12];
  [v11 prepareProvisioningTarget:v10 checkFamilyCircle:v5 completion:v9];
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  [v9 provisionHomeKeyPassForSerialNumbers:v8 completionHandler:v7];
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKPaymentWebServiceLocalProxyTargetDevice_availableHomeKeyPassesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E56D8388;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v7];
  [v6 availableHomeKeyPassesWithCompletionHandler:v5];
}

uint64_t __89__PKPaymentWebServiceLocalProxyTargetDevice_availableHomeKeyPassesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
  id v12 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __136__PKPaymentWebServiceLocalProxyTargetDevice_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke;
  v19[3] = &unk_1E56D8388;
  id v20 = v12;
  id v13 = v12;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v19];
  [v18 createFidoKeyForRelyingParty:v17 relyingPartyAccountHash:v16 challenge:v15 externalizedAuth:v14 completion:v13];
}

uint64_t __136__PKPaymentWebServiceLocalProxyTargetDevice_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __128__PKPaymentWebServiceLocalProxyTargetDevice_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke;
  v16[3] = &unk_1E56D8388;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v16];
  [v15 checkFidoKeyPresenceForRelyingParty:v14 relyingPartyAccountHash:v13 fidoKeyHash:v12 completion:v11];
}

uint64_t __128__PKPaymentWebServiceLocalProxyTargetDevice_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
  id v16 = a9;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  objc_super v27 = __170__PKPaymentWebServiceLocalProxyTargetDevice_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke;
  v28 = &unk_1E56D8388;
  id v29 = v16;
  id v17 = v16;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:&v25];
  objc_msgSend(v24, "signWithFidoKeyForRelyingParty:relyingPartyAccountHash:fidoKeyHash:challenge:publicKeyIdentifier:externalizedAuth:completion:", v23, v22, v21, v20, v19, v18, v17, v25, v26, v27, v28);
}

uint64_t __170__PKPaymentWebServiceLocalProxyTargetDevice_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __106__PKPaymentWebServiceLocalProxyTargetDevice_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  [v9 generateSEEncryptionCertificateForSubCredentialId:v8 completion:v7];
}

uint64_t __106__PKPaymentWebServiceLocalProxyTargetDevice_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  [v9 generateISOEncryptionCertificateForSubCredentialId:v8 completion:v7];
}

uint64_t __107__PKPaymentWebServiceLocalProxyTargetDevice_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)areUnifiedAccessPassesSupported
{
  id v2 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _synchronousProxy];
  char v3 = [v2 areUnifiedAccessPassesSupported];

  return v3;
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PKPaymentWebServiceLocalProxyTargetDevice_addISO18013Blobs_cardType_completion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v12];
  [v11 addISO18013Blobs:v10 cardType:a4 completion:v9];
}

uint64_t __82__PKPaymentWebServiceLocalProxyTargetDevice_addISO18013Blobs_cardType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __117__PKPaymentWebServiceLocalProxyTargetDevice_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v12];
  [v11 longTermPrivacyKeyForCredentialGroupIdentifier:v10 reuseExisting:v5 completion:v9];
}

uint64_t __117__PKPaymentWebServiceLocalProxyTargetDevice_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__PKPaymentWebServiceLocalProxyTargetDevice_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxyWithErrorHandler:v10];
  [v9 generateAuxiliaryCapabilitiesForRequirements:v8 completion:v7];
}

uint64_t __101__PKPaymentWebServiceLocalProxyTargetDevice_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)archiveContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v5 archiveContext:v4];
}

- (void)archiveBackgroundContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentWebServiceLocalProxyTargetDevice *)self _proxy];
  [v5 archiveBackgroundContext:v4];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end