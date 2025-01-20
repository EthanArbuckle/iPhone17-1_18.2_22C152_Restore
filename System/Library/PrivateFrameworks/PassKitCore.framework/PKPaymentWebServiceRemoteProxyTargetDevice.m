@interface PKPaymentWebServiceRemoteProxyTargetDevice
- (NSXPCConnection)connection;
- (PKPaymentWebServiceRemoteProxyTargetDevice)init;
- (PKPaymentWebServiceRemoteProxyTargetDevice)initWithWebService:(id)a3 connection:(id)a4;
- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5;
- (void)addPassData:(id)a3 completion:(id)a4;
- (void)addPendingProvisionings:(id)a3 completion:(id)a4;
- (void)allPaymentApplicationUsageSummariesWithCompletion:(id)a3;
- (void)appleAccountInformationWithCompletion:(id)a3;
- (void)applePayTrustKeyForIdentifier:(id)a3 completion:(id)a4;
- (void)archiveContext:(id)a3;
- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3;
- (void)cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)canProvisionPaymentPassWithPrimaryAccountIdentifier:(id)a3 completion:(id)a4;
- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6;
- (void)claimSecureElementForCurrentUserWithCompletion:(id)a3;
- (void)createApplePayTrustKeyWithRequest:(id)a3 completion:(id)a4;
- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7;
- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3;
- (void)currentSecureElementSnapshot:(id)a3;
- (void)dealloc;
- (void)deleteApplePayTrustKeyWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteApplicationWithAID:(id)a3;
- (void)deleteKeyMaterialForSubCredentialId:(id)a3;
- (void)deleteReservation:(id)a3 completion:(id)a4;
- (void)deviceMetadataWithFields:(unint64_t)a3 completion:(id)a4;
- (void)didRegisterWithRegionMap:(id)a3 primaryRegionTopic:(id)a4;
- (void)downloadAllPaymentPasses;
- (void)endRequiringUpgradedPasscodeIfNecessary;
- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)familyMembersWithCompletion:(id)a3;
- (void)featureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4;
- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4;
- (void)getConfigurationDataWithCompletion:(id)a3;
- (void)getContextWithCompletion:(id)a3;
- (void)getEncryptedServiceProviderDataForSecureElementPass:(id)a3 completion:(id)a4;
- (void)getProvisioningDataIncludingDeviceMetadata:(BOOL)a3 withCompletion:(id)a4;
- (void)getRegistrationDataWithCompletion:(id)a3;
- (void)getTrustedDeviceEnrollmentInfoWithCompletion:(id)a3;
- (void)handlePotentialExpressPass:(id)a3 withCompletion:(id)a4;
- (void)hasPassesOfType:(unint64_t)a3 completion:(id)a4;
- (void)invalidateRemoteProxyTargetDevice;
- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5;
- (void)maximumPaymentCardsWithCompletion:(id)a3;
- (void)notePasscodeUpgradeFlowDidEnd;
- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3;
- (void)noteProvisioningDidBegin;
- (void)noteProvisioningDidEnd;
- (void)noteProvisioningUserInterfaceDidAppear;
- (void)noteProvisioningUserInterfaceDidDisappear;
- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4;
- (void)passesOfType:(unint64_t)a3 completion:(id)a4;
- (void)passesWithReaderIdentifier:(id)a3 completion:(id)a4;
- (void)paymentSupportedInCurrentRegion:(id)a3;
- (void)performDeviceCheckInWithCompletion:(id)a3;
- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4;
- (void)queueConnectionToTrustedServiceManagerForPushTopic:(id)a3 withCompletion:(id)a4;
- (void)registrationSupportedInCurrentRegionWithCompletion:(id)a3;
- (void)removePass:(id)a3 completion:(id)a4;
- (void)renewAppleAccountWithCompletionHandler:(id)a3;
- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)secureElementIsAvailableWithCompletion:(id)a3;
- (void)secureElementOwnershipStateForCurrentUserWithCompletion:(id)a3;
- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3;
- (void)setNewAuthRandom:(id)a3;
- (void)setNewAuthRandomIfNecessaryReturningPairingState:(id)a3;
- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletion:(id)a5;
- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9;
- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3;
- (void)statusForShareableCredentials:(id)a3 completion:(id)a4;
- (void)storePassOwnershipToken:(id)a3 withIdentifier:(id)a4;
- (void)supportedFeatureIdentifiersForAccountProvisioningWithCompletion:(id)a3;
- (void)supportedFeatureIdentifiersWithCompletion:(id)a3;
- (void)supportsAccountsWithCompletion:(id)a3;
- (void)supportsPeerPaymentRegistrationWithCompletion:(id)a3;
- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4;
- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updatedAccountsForProvisioningWithCompletion:(id)a3;
- (void)usingSynchronousProxy:(BOOL)a3 meetsProvisioningRequirements:(id)a4 completion:(id)a5;
- (void)validateAddPreconditionsWithCompletion:(id)a3;
- (void)validateTransferPreconditionsWithCompletion:(id)a3;
- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentWebServiceRemoteProxyTargetDevice

- (PKPaymentWebServiceRemoteProxyTargetDevice)init
{
  return [(PKPaymentWebServiceRemoteProxyTargetDevice *)self initWithWebService:0 connection:0];
}

- (PKPaymentWebServiceRemoteProxyTargetDevice)initWithWebService:(id)a3 connection:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (char *)a4;
  v40.receiver = self;
  v40.super_class = (Class)PKPaymentWebServiceRemoteProxyTargetDevice;
  v9 = [(PKPaymentWebServiceRemoteProxyTargetDevice *)&v40 init];
  if (!v9)
  {
LABEL_15:
    v30 = v9;
    goto LABEL_16;
  }
  v10 = [[PKEntitlementWhitelist alloc] initWithConnection:v8];
  if ([(PKEntitlementWhitelist *)v10 paymentAllAccess]
    || [(PKEntitlementWhitelist *)v10 peerPaymentAllAccess])
  {
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.passkit.remoteTargetDeviceHandlerQueue", MEMORY[0x1E4F14430]);
    handlerQueue = v9->_handlerQueue;
    v9->_handlerQueue = (OS_dispatch_queue *)v11;

    p_webService = (void **)&v9->_webService;
    objc_storeStrong((id *)&v9->_webService, a3);
    if (!v9->_webService)
    {
      uint64_t v14 = +[PKPaymentWebService sharedService];
      v15 = *p_webService;
      *p_webService = (void *)v14;

      v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (const char *)*p_webService;
        *(_DWORD *)buf = 138412546;
        v42 = v17;
        __int16 v43 = 2080;
        v44 = "-[PKPaymentWebServiceRemoteProxyTargetDevice initWithWebService:connection:]";
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Shared webService (%@) used as one was not provided to %s.", buf, 0x16u);
      }
    }
    uint64_t v18 = [v7 targetDevice];
    targetDevice = v9->_targetDevice;
    v9->_targetDevice = (PKPaymentWebServiceTargetDeviceProtocol *)v18;

    objc_storeStrong((id *)&v9->_connection, a4);
    connection = v9->_connection;
    if (!connection)
    {
      v21 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[PKPaymentWebServiceRemoteProxyTargetDevice initWithWebService:connection:]";
        _os_log_error_impl(&dword_190E10000, v21, OS_LOG_TYPE_ERROR, "No connection provided to %s", buf, 0xCu);
      }

      connection = v9->_connection;
    }
    v22 = PKPaymentWebServiceProxyObjectInterface();
    [(NSXPCConnection *)connection setExportedInterface:v22];

    [(NSXPCConnection *)v9->_connection setExportedObject:v9];
    v23 = [(NSXPCConnection *)v9->_connection invalidationHandler];
    v24 = v9->_connection;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __76__PKPaymentWebServiceRemoteProxyTargetDevice_initWithWebService_connection___block_invoke;
    v38[3] = &unk_1E56D8360;
    id v25 = v23;
    id v39 = v25;
    [(NSXPCConnection *)v24 setInvalidationHandler:v38];
    v26 = [(NSXPCConnection *)v9->_connection interruptionHandler];
    v27 = v9->_connection;
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __76__PKPaymentWebServiceRemoteProxyTargetDevice_initWithWebService_connection___block_invoke_579;
    v36 = &unk_1E56D8360;
    id v28 = v26;
    id v37 = v28;
    [(NSXPCConnection *)v27 setInterruptionHandler:&v33];
    [(NSXPCConnection *)v9->_connection resume];
    v29 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = (const char *)v7;
      __int16 v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceRemoteProxyTargetDevice initialized with Web Service: %@ for XPC Connection: %@.", buf, 0x16u);
    }

    goto LABEL_15;
  }
  v32 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v42 = (const char *)v9;
    _os_log_impl(&dword_190E10000, v32, OS_LOG_TYPE_DEFAULT, "Client is not entitled for PKPaymentWebServiceRemoteProxyTargetDevice (%p)", buf, 0xCu);
  }

  v30 = 0;
LABEL_16:

  return v30;
}

void __76__PKPaymentWebServiceRemoteProxyTargetDevice_initWithWebService_connection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  v2 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_INFO, "PKPaymentWebServiceRemoteProxyTargetDevice connection invalidated.", v3, 2u);
  }
}

uint64_t __76__PKPaymentWebServiceRemoteProxyTargetDevice_initWithWebService_connection___block_invoke_579(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  v2 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_INFO, "PKPaymentWebServiceRemoteProxyTargetDevice connection interrupted.", v4, 2u);
  }

  return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unexpected interruption on PKPaymentWebServiceRemoteProxyTargetDevice connection."];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection invalidate];
  }
  v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    webService = self->_webService;
    *(_DWORD *)buf = 138412290;
    v8 = webService;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceRemoteProxyTargetDevice with Web Service: %@ dealloc'd.", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentWebServiceRemoteProxyTargetDevice;
  [(PKPaymentWebServiceRemoteProxyTargetDevice *)&v6 dealloc];
}

- (void)getContextWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentWebServiceRemoteProxyTargetDevice_getContextWithCompletion___block_invoke;
  v7[3] = &unk_1E56D83D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

void __71__PKPaymentWebServiceRemoteProxyTargetDevice_getContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 16) context];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)queueConnectionToTrustedServiceManagerForPushTopic:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PKPaymentWebServiceRemoteProxyTargetDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke;
  block[3] = &unk_1E56D89F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __112__PKPaymentWebServiceRemoteProxyTargetDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) queueConnectionToTrustedServiceManagerForPushTopic:a1[5] withCompletion:a1[6]];
}

- (void)getEncryptedServiceProviderDataForSecureElementPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__PKPaymentWebServiceRemoteProxyTargetDevice_getEncryptedServiceProviderDataForSecureElementPass_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __109__PKPaymentWebServiceRemoteProxyTargetDevice_getEncryptedServiceProviderDataForSecureElementPass_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) encryptedServiceProviderDataForSecureElementPass:a1[5] completion:a1[6]];
}

- (void)getConfigurationDataWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PKPaymentWebServiceRemoteProxyTargetDevice_getConfigurationDataWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __81__PKPaymentWebServiceRemoteProxyTargetDevice_getConfigurationDataWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) paymentWebService:*(void *)(*(void *)(a1 + 32) + 16) configurationDataWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)getRegistrationDataWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKPaymentWebServiceRemoteProxyTargetDevice_getRegistrationDataWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __80__PKPaymentWebServiceRemoteProxyTargetDevice_getRegistrationDataWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) paymentWebService:*(void *)(*(void *)(a1 + 32) + 16) registrationDataWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)getTrustedDeviceEnrollmentInfoWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__PKPaymentWebServiceRemoteProxyTargetDevice_getTrustedDeviceEnrollmentInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E56D83D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

void __91__PKPaymentWebServiceRemoteProxyTargetDevice_getTrustedDeviceEnrollmentInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 24) trustedDeviceEnrollmentInfoForWebService:*(void *)(*(void *)(a1 + 32) + 16)];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  handlerQueue = self->_handlerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__PKPaymentWebServiceRemoteProxyTargetDevice_signData_signatureEntanglementMode_withCompletion___block_invoke;
  v13[3] = &unk_1E56D8A40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(handlerQueue, v13);
}

uint64_t __96__PKPaymentWebServiceRemoteProxyTargetDevice_signData_signatureEntanglementMode_withCompletion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) signData:a1[5] signatureEntanglementMode:a1[7] withCompletionHandler:a1[6]];
}

- (void)getProvisioningDataIncludingDeviceMetadata:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKPaymentWebServiceRemoteProxyTargetDevice_getProvisioningDataIncludingDeviceMetadata_withCompletion___block_invoke;
  block[3] = &unk_1E56D8A68;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __104__PKPaymentWebServiceRemoteProxyTargetDevice_getProvisioningDataIncludingDeviceMetadata_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) paymentWebService:*(void *)(*(void *)(a1 + 32) + 16) provisioningDataIncludingDeviceMetadata:*(unsigned __int8 *)(a1 + 48) withCompletionHandler:*(void *)(a1 + 40)];
}

- (void)deleteApplicationWithAID:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentWebServiceRemoteProxyTargetDevice_deleteApplicationWithAID___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __71__PKPaymentWebServiceRemoteProxyTargetDevice_deleteApplicationWithAID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) paymentWebService:*(void *)(*(void *)(a1 + 32) + 16) deleteApplicationWithAID:*(void *)(a1 + 40)];
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PKPaymentWebServiceRemoteProxyTargetDevice_deleteKeyMaterialForSubCredentialId___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __82__PKPaymentWebServiceRemoteProxyTargetDevice_deleteKeyMaterialForSubCredentialId___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) deleteKeyMaterialForSubCredentialId:*(void *)(a1 + 40)];
}

- (void)didRegisterWithRegionMap:(id)a3 primaryRegionTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_didRegisterWithRegionMap_primaryRegionTopic___block_invoke;
  block[3] = &unk_1E56D8AB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_didRegisterWithRegionMap_primaryRegionTopic___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) didRegisterWithRegionMap:a1[5] primaryRegionTopic:a1[6]];
}

- (void)paymentSupportedInCurrentRegion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PKPaymentWebServiceRemoteProxyTargetDevice_paymentSupportedInCurrentRegion___block_invoke;
  v7[3] = &unk_1E56D83D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __78__PKPaymentWebServiceRemoteProxyTargetDevice_paymentSupportedInCurrentRegion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(*(void *)(result + 32) + 24) paymentSupportedInCurrentRegionForWebService:*(void *)(*(void *)(result + 32) + 16)];
    v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return v3(v1, v2);
  }
  return result;
}

- (void)registrationSupportedInCurrentRegionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    handlerQueue = self->_handlerQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __97__PKPaymentWebServiceRemoteProxyTargetDevice_registrationSupportedInCurrentRegionWithCompletion___block_invoke;
    v7[3] = &unk_1E56D83D8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(handlerQueue, v7);
  }
}

uint64_t __97__PKPaymentWebServiceRemoteProxyTargetDevice_registrationSupportedInCurrentRegionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) registrationSupportedInCurrentRegionForWebService:*(void *)(*(void *)(a1 + 32) + 16)];
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)noteProvisioningUserInterfaceDidAppear
{
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningUserInterfaceDidAppear__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __84__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningUserInterfaceDidAppear__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) noteProvisioningUserInterfaceDidAppear];
}

- (void)noteProvisioningUserInterfaceDidDisappear
{
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningUserInterfaceDidDisappear__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __87__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningUserInterfaceDidDisappear__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) noteProvisioningUserInterfaceDidDisappear];
}

- (void)noteProvisioningDidBegin
{
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningDidBegin__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __70__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningDidBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) noteProvisioningDidBegin];
}

- (void)noteProvisioningDidEnd
{
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningDidEnd__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __68__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningDidEnd__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) noteProvisioningDidEnd];
}

- (void)setNewAuthRandomIfNecessaryReturningPairingState:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PKPaymentWebServiceRemoteProxyTargetDevice_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __95__PKPaymentWebServiceRemoteProxyTargetDevice_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) paymentWebService:*(void *)(*(void *)(a1 + 32) + 16) setNewAuthRandomIfNecessaryReturningPairingState:*(void *)(a1 + 40)];
}

- (void)setNewAuthRandom:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKPaymentWebServiceRemoteProxyTargetDevice_setNewAuthRandom___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __63__PKPaymentWebServiceRemoteProxyTargetDevice_setNewAuthRandom___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) paymentWebService:*(void *)(*(void *)(a1 + 32) + 16) setNewAuthRandom:*(void *)(a1 + 40)];
}

- (void)hasPassesOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPaymentWebServiceRemoteProxyTargetDevice_hasPassesOfType_completion___block_invoke;
  block[3] = &unk_1E56D8590;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(handlerQueue, block);
}

void *__73__PKPaymentWebServiceRemoteProxyTargetDevice_hasPassesOfType_completion___block_invoke(void *result)
{
  uint64_t v1 = result[5];
  if (v1)
  {
    uint64_t v2 = [*(id *)(result[4] + 24) paymentWebService:*(void *)(result[4] + 16) hasPassesOfType:result[6]];
    v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return (void *)v3(v1, v2);
  }
  return result;
}

- (void)passesOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    handlerQueue = self->_handlerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PKPaymentWebServiceRemoteProxyTargetDevice_passesOfType_completion___block_invoke;
    block[3] = &unk_1E56D8590;
    block[4] = self;
    id v10 = v6;
    unint64_t v11 = a3;
    dispatch_async(handlerQueue, block);
  }
}

void __70__PKPaymentWebServiceRemoteProxyTargetDevice_passesOfType_completion___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  id v2 = [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) passesOfType:a1[6]];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)passesWithReaderIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    handlerQueue = self->_handlerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__PKPaymentWebServiceRemoteProxyTargetDevice_passesWithReaderIdentifier_completion___block_invoke;
    block[3] = &unk_1E56D8428;
    id v12 = v7;
    block[4] = self;
    id v11 = v6;
    dispatch_async(handlerQueue, block);
  }
}

void __84__PKPaymentWebServiceRemoteProxyTargetDevice_passesWithReaderIdentifier_completion___block_invoke(void *a1)
{
  uint64_t v1 = a1[6];
  id v2 = [*(id *)(a1[4] + 24) passesWithReaderIdentifier:a1[5]];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)canProvisionPaymentPassWithPrimaryAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__PKPaymentWebServiceRemoteProxyTargetDevice_canProvisionPaymentPassWithPrimaryAccountIdentifier_completion___block_invoke;
  block[3] = &unk_1E56D8428;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(handlerQueue, block);
}

void *__109__PKPaymentWebServiceRemoteProxyTargetDevice_canProvisionPaymentPassWithPrimaryAccountIdentifier_completion___block_invoke(void *result)
{
  uint64_t v1 = result[6];
  if (v1)
  {
    uint64_t v2 = [*(id *)(result[4] + 24) paymentWebService:*(void *)(result[4] + 16) canProvisionPaymentPassWithPrimaryAccountIdentifier:result[5]];
    v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return (void *)v3(v1, v2);
  }
  return result;
}

- (void)validateAddPreconditionsWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_validateAddPreconditionsWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

void __85__PKPaymentWebServiceRemoteProxyTargetDevice_validateAddPreconditionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_validateAddPreconditionsWithCompletion___block_invoke_2;
  v4[3] = &unk_1E56D8B08;
  id v5 = *(id *)(a1 + 40);
  [v2 paymentWebService:v3 validateAddPreconditionsWithCompletion:v4];
}

uint64_t __85__PKPaymentWebServiceRemoteProxyTargetDevice_validateAddPreconditionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)downloadAllPaymentPasses
{
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentWebServiceRemoteProxyTargetDevice_downloadAllPaymentPasses__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __70__PKPaymentWebServiceRemoteProxyTargetDevice_downloadAllPaymentPasses__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) downloadAllPaymentPassesForPaymentWebService:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)claimSecureElementForCurrentUserWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__PKPaymentWebServiceRemoteProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __93__PKPaymentWebServiceRemoteProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) claimSecureElementForCurrentUserWithCompletion:*(void *)(a1 + 40)];
}

- (void)secureElementOwnershipStateForCurrentUserWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__PKPaymentWebServiceRemoteProxyTargetDevice_secureElementOwnershipStateForCurrentUserWithCompletion___block_invoke;
  v7[3] = &unk_1E56D83D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __102__PKPaymentWebServiceRemoteProxyTargetDevice_secureElementOwnershipStateForCurrentUserWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(*(void *)(result + 32) + 24) secureElementOwnershipStateForCurrentUser];
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return v3(v1, v2);
  }
  return result;
}

- (void)validateTransferPreconditionsWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_validateTransferPreconditionsWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

void __90__PKPaymentWebServiceRemoteProxyTargetDevice_validateTransferPreconditionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_validateTransferPreconditionsWithCompletion___block_invoke_2;
  v4[3] = &unk_1E56D8B08;
  id v5 = *(id *)(a1 + 40);
  [v2 paymentWebService:v3 validateTransferPreconditionsWithCompletion:v4];
}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_validateTransferPreconditionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)handlePotentialExpressPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKPaymentWebServiceRemoteProxyTargetDevice_handlePotentialExpressPass_withCompletion___block_invoke;
  block[3] = &unk_1E56D89F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __88__PKPaymentWebServiceRemoteProxyTargetDevice_handlePotentialExpressPass_withCompletion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) handlePotentialExpressPass:a1[5] withCompletionHandler:a1[6]];
}

- (void)addPassData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentWebServiceRemoteProxyTargetDevice_addPassData_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

void __69__PKPaymentWebServiceRemoteProxyTargetDevice_addPassData_completion___block_invoke(uint64_t a1)
{
  id v2 = +[PKObject createWithData:*(void *)(a1 + 32) warnings:0 error:0];
  if ([v2 passType] == 1) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(v5 + 16);
    id v6 = *(void **)(v5 + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__PKPaymentWebServiceRemoteProxyTargetDevice_addPassData_completion___block_invoke_2;
    v9[3] = &unk_1E56D8B30;
    id v10 = *(id *)(a1 + 48);
    [v6 paymentWebService:v7 addPaymentPass:v4 withCompletionHandlerV2:v9];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
    }
  }
}

uint64_t __69__PKPaymentWebServiceRemoteProxyTargetDevice_addPassData_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, void))(result + 16))(result, a2 != 0, 0);
  }
  return result;
}

- (void)removePass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentWebServiceRemoteProxyTargetDevice_removePass_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __68__PKPaymentWebServiceRemoteProxyTargetDevice_removePass_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) removePass:a1[5] withCompletionHandler:a1[6]];
}

- (void)supportsPeerPaymentRegistrationWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__PKPaymentWebServiceRemoteProxyTargetDevice_supportsPeerPaymentRegistrationWithCompletion___block_invoke;
  v7[3] = &unk_1E56D83D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __92__PKPaymentWebServiceRemoteProxyTargetDevice_supportsPeerPaymentRegistrationWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(*(void *)(result + 32) + 24) paymentWebServiceSupportsPeerPaymentRegistration:*(void *)(*(void *)(result + 32) + 16)];
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return v3(v1, v2);
  }
  return result;
}

- (void)supportsAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PKPaymentWebServiceRemoteProxyTargetDevice_supportsAccountsWithCompletion___block_invoke;
  v7[3] = &unk_1E56D83D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __77__PKPaymentWebServiceRemoteProxyTargetDevice_supportsAccountsWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(*(void *)(result + 32) + 24) paymentWebServiceSupportsAccounts:*(void *)(*(void *)(result + 32) + 16)];
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    return v3(v1, v2);
  }
  return result;
}

- (void)supportedFeatureIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__PKPaymentWebServiceRemoteProxyTargetDevice_supportedFeatureIdentifiersWithCompletion___block_invoke;
  v7[3] = &unk_1E56D83D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

void __88__PKPaymentWebServiceRemoteProxyTargetDevice_supportedFeatureIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 24) supportedFeatureIdentifiersWithPaymentWebService:*(void *)(*(void *)(a1 + 32) + 16)];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)supportedFeatureIdentifiersForAccountProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __110__PKPaymentWebServiceRemoteProxyTargetDevice_supportedFeatureIdentifiersForAccountProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E56D83D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

void __110__PKPaymentWebServiceRemoteProxyTargetDevice_supportedFeatureIdentifiersForAccountProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 24) supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:*(void *)(*(void *)(a1 + 32) + 16)];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)updatedAccountsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__PKPaymentWebServiceRemoteProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __91__PKPaymentWebServiceRemoteProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) updatedAccountsForProvisioningWithCompletion:*(void *)(a1 + 40)];
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PKPaymentWebServiceRemoteProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __101__PKPaymentWebServiceRemoteProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) triggerCloudStoreZoneCreationForAccount:a1[5] withCompletion:a1[6]];
}

- (void)cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__PKPaymentWebServiceRemoteProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __101__PKPaymentWebServiceRemoteProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) cachedFeatureApplicationsForProvisioningWithCompletion:*(void *)(a1 + 40)];
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PKPaymentWebServiceRemoteProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __95__PKPaymentWebServiceRemoteProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) featureApplicationsForProvisioningWithCompletion:*(void *)(a1 + 40)];
}

- (void)deviceMetadataWithFields:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPaymentWebServiceRemoteProxyTargetDevice_deviceMetadataWithFields_completion___block_invoke;
  block[3] = &unk_1E56D8B58;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __82__PKPaymentWebServiceRemoteProxyTargetDevice_deviceMetadataWithFields_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) deviceMetadataWithFields:a1[6] completion:a1[5]];
}

- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PKPaymentWebServiceRemoteProxyTargetDevice_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke;
  block[3] = &unk_1E56D8428;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(handlerQueue, block);
}

uint64_t __112__PKPaymentWebServiceRemoteProxyTargetDevice_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke(void *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = [*(id *)(a1[4] + 24) willPassWithUniqueIdentifierAutomaticallyBecomeDefault:a1[5]];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PKPaymentWebServiceRemoteProxyTargetDevice_setDefaultPaymentPassUniqueIdentifier___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __84__PKPaymentWebServiceRemoteProxyTargetDevice_setDefaultPaymentPassUniqueIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) paymentWebService:*(void *)(*(void *)(a1 + 32) + 16) setDefaultPaymentPassUniqueIdentifier:*(void *)(a1 + 40)];
}

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __85__PKPaymentWebServiceRemoteProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) renewAppleAccountWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)appleAccountInformationWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PKPaymentWebServiceRemoteProxyTargetDevice_appleAccountInformationWithCompletion___block_invoke;
  v7[3] = &unk_1E56D83D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

void __84__PKPaymentWebServiceRemoteProxyTargetDevice_appleAccountInformationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) appleAccountInformation];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__PKPaymentWebServiceRemoteProxyTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __93__PKPaymentWebServiceRemoteProxyTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) notePasscodeUpgradeFlowWillBeginWithCompletion:*(void *)(a1 + 40)];
}

- (void)notePasscodeUpgradeFlowDidEnd
{
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKPaymentWebServiceRemoteProxyTargetDevice_notePasscodeUpgradeFlowDidEnd__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __75__PKPaymentWebServiceRemoteProxyTargetDevice_notePasscodeUpgradeFlowDidEnd__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) notePasscodeUpgradeFlowDidEnd];
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_enforceUpgradedPasscodePolicyWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_enforceUpgradedPasscodePolicyWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) enforceUpgradedPasscodePolicyWithCompletion:*(void *)(a1 + 40)];
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKPaymentWebServiceRemoteProxyTargetDevice_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __89__PKPaymentWebServiceRemoteProxyTargetDevice_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) currentPasscodeMeetsUpgradedPasscodePolicy:*(void *)(a1 + 40)];
}

- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  handlerQueue = self->_handlerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __100__PKPaymentWebServiceRemoteProxyTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke;
  v4[3] = &unk_1E56D8B80;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(handlerQueue, v4);
}

uint64_t __100__PKPaymentWebServiceRemoteProxyTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:*(unsigned __int8 *)(a1 + 40)];
}

- (void)endRequiringUpgradedPasscodeIfNecessary
{
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_endRequiringUpgradedPasscodeIfNecessary__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __85__PKPaymentWebServiceRemoteProxyTargetDevice_endRequiringUpgradedPasscodeIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) endRequiringUpgradedPasscodeIfNecessary];
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PKPaymentWebServiceRemoteProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __81__PKPaymentWebServiceRemoteProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) performDeviceCheckInWithCompletion:*(void *)(a1 + 40)];
}

- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  handlerQueue = self->_handlerQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __118__PKPaymentWebServiceRemoteProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke;
  v15[3] = &unk_1E56D8BA8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(handlerQueue, v15);
}

uint64_t __118__PKPaymentWebServiceRemoteProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) performDeviceRegistrationReturningContextForReason:a1[5] brokerURL:a1[6] completion:a1[7]];
}

- (void)storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_storePassOwnershipToken_withIdentifier___block_invoke;
  block[3] = &unk_1E56D8AB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __85__PKPaymentWebServiceRemoteProxyTargetDevice_storePassOwnershipToken_withIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) storePassOwnershipToken:a1[5] withIdentifier:a1[6]];
}

- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_passOwnershipTokenWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_passOwnershipTokenWithIdentifier_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) passOwnershipTokenWithIdentifier:a1[5] completion:a1[6]];
}

- (void)familyMembersWithCompletion:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKPaymentWebServiceRemoteProxyTargetDevice_familyMembersWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __74__PKPaymentWebServiceRemoteProxyTargetDevice_familyMembersWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) familyMembersWithCompletion:*(void *)(a1 + 40)];
}

- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKPaymentWebServiceRemoteProxyTargetDevice_generateTransactionKeyWithParameters_withCompletion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __98__PKPaymentWebServiceRemoteProxyTargetDevice_generateTransactionKeyWithParameters_withCompletion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) paymentWebService:*(void *)(a1[4] + 16) generateTransactionKeyWithParameters:a1[5] withCompletion:a1[6]];
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentWebServiceRemoteProxyTargetDevice_statusForShareableCredentials_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __87__PKPaymentWebServiceRemoteProxyTargetDevice_statusForShareableCredentials_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) statusForShareableCredentials:a1[5] completion:a1[6]];
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  handlerQueue = self->_handlerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__PKPaymentWebServiceRemoteProxyTargetDevice_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke;
  v13[3] = &unk_1E56D8BD0;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(handlerQueue, v13);
}

uint64_t __101__PKPaymentWebServiceRemoteProxyTargetDevice_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) prepareProvisioningTarget:*(void *)(a1 + 40) checkFamilyCircle:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PKPaymentWebServiceRemoteProxyTargetDevice_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __101__PKPaymentWebServiceRemoteProxyTargetDevice_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) provisionHomeKeyPassForSerialNumbers:a1[5] completionHandler:a1[6]];
}

- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_availableHomeKeyPassesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, v7);
}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_availableHomeKeyPassesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) availableHomeKeyPassesWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  handlerQueue = self->_handlerQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __137__PKPaymentWebServiceRemoteProxyTargetDevice_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke;
  v23[3] = &unk_1E56D8BF8;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(handlerQueue, v23);
}

uint64_t __137__PKPaymentWebServiceRemoteProxyTargetDevice_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) createFidoKeyForRelyingParty:a1[5] relyingPartyAccountHash:a1[6] challenge:a1[7] externalizedAuth:a1[8] completion:a1[9]];
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__PKPaymentWebServiceRemoteProxyTargetDevice_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke;
  block[3] = &unk_1E56D8C20;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(handlerQueue, block);
}

uint64_t __129__PKPaymentWebServiceRemoteProxyTargetDevice_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) checkFidoKeyPresenceForRelyingParty:a1[5] relyingPartyAccountHash:a1[6] fidoKeyHash:a1[7] completion:a1[8]];
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  handlerQueue = self->_handlerQueue;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __171__PKPaymentWebServiceRemoteProxyTargetDevice_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke;
  v30[3] = &unk_1E56D8C48;
  v30[4] = self;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v35 = v19;
  id v36 = v20;
  id v37 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  dispatch_async(handlerQueue, v30);
}

uint64_t __171__PKPaymentWebServiceRemoteProxyTargetDevice_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) signWithFidoKeyForRelyingParty:a1[5] relyingPartyAccountHash:a1[6] fidoKeyHash:a1[7] challenge:a1[8] publicKeyIdentifier:a1[9] externalizedAuth:a1[10] completion:a1[11]];
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__PKPaymentWebServiceRemoteProxyTargetDevice_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __107__PKPaymentWebServiceRemoteProxyTargetDevice_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) generateSEEncryptionCertificateForSubCredentialId:a1[5] completion:a1[6]];
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__PKPaymentWebServiceRemoteProxyTargetDevice_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __108__PKPaymentWebServiceRemoteProxyTargetDevice_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) generateISOEncryptionCertificateForSubCredentialId:a1[5] completion:a1[6]];
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  handlerQueue = self->_handlerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PKPaymentWebServiceRemoteProxyTargetDevice_addISO18013Blobs_cardType_completion___block_invoke;
  v13[3] = &unk_1E56D8A40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(handlerQueue, v13);
}

uint64_t __83__PKPaymentWebServiceRemoteProxyTargetDevice_addISO18013Blobs_cardType_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) addISO18013Blobs:a1[5] cardType:a1[7] completion:a1[6]];
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  handlerQueue = self->_handlerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118__PKPaymentWebServiceRemoteProxyTargetDevice_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke;
  v13[3] = &unk_1E56D8BD0;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(handlerQueue, v13);
}

uint64_t __118__PKPaymentWebServiceRemoteProxyTargetDevice_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) longTermPrivacyKeyForCredentialGroupIdentifier:*(void *)(a1 + 40) reuseExisting:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceRemoteProxyTargetDevice_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

uint64_t __102__PKPaymentWebServiceRemoteProxyTargetDevice_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) generateAuxiliaryCapabilitiesForRequirements:a1[5] completion:a1[6]];
}

- (void)usingSynchronousProxy:(BOOL)a3 meetsProvisioningRequirements:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a5;
  id v8 = a4;
  id v9 = +[PKPassLibrary sharedInstance];
  id v12 = v9;
  if (v6)
  {
    id v13 = 0;
    uint64_t v10 = [v9 meetsProvisioningRequirements:v8 missingRequirements:&v13];

    id v11 = v13;
    v7[2](v7, v10, v11);
  }
  else
  {
    [v9 meetsProvisioningRequirements:v8 completion:v7];
  }
}

- (void)currentSecureElementSnapshot:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKPaymentService);
  [(PKPaymentService *)v4 currentSecureElementSnapshot:v3];
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(PKPaymentService);
  [(PKPaymentService *)v10 reserveStorageForAppletTypes:v9 metadata:v8 completion:v7];
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(PKPaymentService);
  [(PKPaymentService *)v7 deleteReservation:v6 completion:v5];
}

- (void)archiveContext:(id)a3
{
  id v4 = a3;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentWebServiceRemoteProxyTargetDevice_archiveContext___block_invoke;
  block[3] = &unk_1E56D8AE0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(handlerQueue, block);
}

void __61__PKPaymentWebServiceRemoteProxyTargetDevice_archiveContext___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(PKPaymentService);
  [(PKPaymentService *)v2 setSharedPaymentWebServiceContext:*(void *)(a1 + 32)];
}

- (void)invalidateRemoteProxyTargetDevice
{
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentWebServiceRemoteProxyTargetDevice_invalidateRemoteProxyTargetDevice__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(handlerQueue, block);
}

void __79__PKPaymentWebServiceRemoteProxyTargetDevice_invalidateRemoteProxyTargetDevice__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 32) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceRemoteProxyTargetDevice with Web Service: %@ invalidated.", (uint8_t *)&v6, 0xCu);
  }
}

- (void)applePayTrustKeyForIdentifier:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)createApplePayTrustKeyWithRequest:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (void)deleteApplePayTrustKeyWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)maximumPaymentCardsWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v4 = PKMaxPaymentCards();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (void)allPaymentApplicationUsageSummariesWithCompletion:(id)a3
{
  targetDevice = self->_targetDevice;
  id v5 = a3;
  id v6 = [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice allPaymentApplicationUsageSummaries];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)secureElementIsAvailableWithCompletion:(id)a3
{
  id v5 = a3;
  BOOL v4 = PKSecureElementIsAvailable() != 0;
  (*((void (**)(id, BOOL))a3 + 2))(v5, v4);
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  targetDevice = self->_targetDevice;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PKPaymentWebServiceRemoteProxyTargetDevice_addPendingProvisionings_completion___block_invoke;
  v9[3] = &unk_1E56D8388;
  id v10 = v6;
  id v8 = v6;
  [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice addPendingProvisionings:a3 completion:v9];
}

uint64_t __81__PKPaymentWebServiceRemoteProxyTargetDevice_addPendingProvisionings_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end