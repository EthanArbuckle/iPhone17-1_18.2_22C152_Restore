@interface NPKPaymentProvisioningFlowController
+ (BOOL)_isHSA2Enabled;
+ (BOOL)_localCredentials:(id)a3 containProduct:(id)a4;
+ (BOOL)_readerModeEntryAllowedForProduct:(id)a3;
+ (id)_authContext;
+ (id)_displayableCouldNotAddCardErrorWithUnderlyingError:(id)a3;
+ (id)_displayableErrorWithIneligibilityReason:(int64_t)a3 learnMoreURL:(id)a4;
+ (id)_displayableErrorWithUnderlyingVerificationError:(id)a3;
+ (id)_filterAssociatedCredentials:(id)a3 forProduct:(id)a4;
+ (id)_filteredPaymentSetupProducts:(id)a3 localCredentials:(id)a4 setupContext:(int64_t)a5 webService:(id)a6 mobileCarrierRegion:(id)a7 readerModeSupported:(BOOL)a8 digitalIssuanceSupported:(BOOL)a9;
+ (id)_flowPickerSectionsWithContext:(int64_t)a3 provisioningController:(id)a4 readerModeSupported:(BOOL)a5 digitalIssuanceSupported:(BOOL)a6;
+ (id)_physicalCardURLFromMetadata:(id)a3 forScale:(double)a4;
+ (id)_productsArrayFromPickerSection:(id)a3;
+ (id)_readerModeResources;
+ (void)_addAppleBalanceToSections:(id)a3 fromModel:(id)a4;
+ (void)_addCreditDebitItemToSection:(id)a3 webService:(id)a4;
+ (void)_addGroupedItemsToSections:(id)a3 fromModel:(id)a4 webService:(id)a5 paymentSection:(id)a6;
- (BOOL)_fieldRequiresLocalEntry:(id)a3;
- (BOOL)_fieldsModelCompleteExceptForLocalFields:(id)a3;
- (BOOL)_isPasscodeUpgradeRequired;
- (BOOL)_isResolveLocalEligibilityRequired;
- (BOOL)_isValidateSecurityRequirementsRequired;
- (BOOL)hasCredentialsAssociatedWithProduct:(id)a3;
- (BOOL)isDigitalIssuanceSupported;
- (BOOL)isReaderModeProvisioningSupported;
- (BOOL)isSeparateLocalDeviceEntryRequired;
- (BOOL)termsAcceptedOutOfBand;
- (NPKFidoAuthCoordinator)fidoAuthCoordinator;
- (NPKPaymentProvisioningFlowController)initWithProvisioningController:(id)a3 setupContext:(int64_t)a4;
- (NPKPaymentProvisioningFlowControllerDelegate)delegate;
- (NPKPaymentProvisioningFlowControllerPreconditionsStepContext)preconditionsRequestContext;
- (NPKPaymentProvisioningFlowControllerRequestContext)digitalIssuanceAmountRequestContext;
- (NPKPaymentProvisioningFlowControllerRequestContext)digitalIssuancePaymentRequestContext;
- (NPKPaymentProvisioningFlowControllerRequestContext)provisioningProgressRequestContext;
- (NPKPaymentProvisioningFlowControllerRequestContext)readerModeRequestContext;
- (NSData)inAppProvisioningNonce;
- (NSData)inAppProvisioningPublicKeyHash;
- (NSDecimalNumber)digitalIssuanceAmount;
- (NSObject)progressNotificationToken;
- (NSString)chooseCredentialsStepIdentifier;
- (NSString)immediatelyBeforeTermsStepIdentifier;
- (NSString)ingestionCardSessionToken;
- (OS_dispatch_source)inAppProvisioningGetRequestTimer;
- (OS_dispatch_source)ingestionCardNotFoundTimer;
- (PKAddPaymentPassRequest)inAppProvisioningRequest;
- (PKAddPaymentPassRequestConfiguration)inAppProvisioningRequestConfiguration;
- (PKAppleBalanceCredential)currentAppleBalanceCredential;
- (PKContactlessCardIngester)cardIngester;
- (PKContactlessCardIngester)unitTestingCardIngester;
- (PKPaymentAuthorizationController)authorizationController;
- (PKPaymentAuthorizationController)unitTestingAuthorizationController;
- (PKPaymentCredential)currentCredential;
- (PKPaymentPass)issuerVerificationPass;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentProvisioningMethodMetadata)ingestionMethodMetadata;
- (PKPaymentRequest)digitalIssuancePaymentRequest;
- (PKPaymentSetupFieldsModel)fieldsModel;
- (PKPaymentSetupProduct)currentProduct;
- (PKPaymentWebService)webService;
- (PKServiceProviderPurchase)digitalIssuancePurchase;
- (double)ingestionProgress;
- (id)_addCardErrorForPaymentRequest:(id)a3;
- (id)_credentialReadonlyFieldIdentifiers;
- (id)_curatedDefaultPaymentSetupProvisioningFields;
- (id)_filteredPaymentSetupFields:(id)a3 forLocalDeviceEntry:(BOOL)a4;
- (id)_localRequiredFieldsFromRequirementsResponse;
- (id)_newPaymentEligibilityRequest;
- (id)_newPaymentProvisioningRequest;
- (id)_newPaymentRequirementsRequest;
- (id)_paymentRequestForAmount:(id)a3;
- (id)_paymentRequestForAmount:(id)a3 serviceProviderProduct:(id)a4 productItem:(id)a5;
- (id)_requiredFieldsFromRequirementsResponse;
- (id)_requiredFieldsFromRequirementsResponseExcludingLocalFields;
- (id)_secondaryFilteredFields:(id)a3 forCredential:(id)a4;
- (id)_subtitleForState:(unint64_t)a3;
- (id)_titleForState:(unint64_t)a3;
- (int)currentStep;
- (int64_t)setupContext;
- (unint64_t)flowIngestionState;
- (unint64_t)ingestionStateOnRetry;
- (unint64_t)internalIngestionState;
- (unint64_t)termsReason;
- (void)_canMakeDigitalIssuancePaymentsForTransitProducts:(id)a3 withCompletion:(id)a4;
- (void)_canMakeDigitalIssuancePaymentsForTransitProductsWithCompletion:(id)a3;
- (void)_cardNotFoundTimerFired;
- (void)_cardsOnFileForProduct:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5;
- (void)_checkSpaceAvailableForAppletTypes:(id)a3 triedCleanup:(BOOL)a4 completion:(id)a5;
- (void)_chooseProductFromFlowPickerSection:(id)a3 requestContext:(id)a4 transitioningToStep:(int)a5;
- (void)_configureWebServiceIfNecessary:(id)a3 completion:(id)a4;
- (void)_downloadAndAddUpdatedPassForPaymentPass:(id)a3 completion:(id)a4;
- (void)_downloadRemoteAssetsAndAddPaymentPass:(id)a3 completion:(id)a4;
- (void)_endProvisioningFlowWithError:(id)a3 requestContext:(id)a4;
- (void)_endProvisioningFlowWithSuccessForPass:(id)a3 requestContext:(id)a4;
- (void)_ensureMetadataForCredentials:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5;
- (void)_fetchAddRequestWithCertificatesResponse:(id)a3 requestContext:(id)a4;
- (void)_fetchInAppProvisioningCertificates:(id)a3;
- (void)_handleAppleBalanceAccountDetailsAcknowledgedWithProduct:(id)a3 requestContext:(id)a4;
- (void)_handleAppleBalanceProductChosen:(id)a3 requestContext:(id)a4;
- (void)_handleDigitalIssuanceTermsAccepted:(id)a3;
- (void)_handleEligibiltySuccessWithContext:(id)a3;
- (void)_handleEndOfProvisioningFlowForCurrentPass:(id)a3 requestContext:(id)a4;
- (void)_handleFinished:(id)a3;
- (void)_handlePasscodeUpgradeCompleteWithSuccess:(BOOL)a3 error:(id)a4 requestContext:(id)a5;
- (void)_handlePreconditionsVerified:(id)a3;
- (void)_handleProceedWithCredentials:(id)a3 chosenByUser:(BOOL)a4 requestContext:(id)a5;
- (void)_handleProductChosen:(id)a3 includeCardsOnFile:(BOOL)a4 requestContext:(id)a5;
- (void)_handleProvisioningFlowStarted:(id)a3;
- (void)_handleReaderModeTermsAccepted:(id)a3;
- (void)_handleVerificationCode:(id)a3 forPass:(id)a4 context:(id)a5;
- (void)_handleVerificationFieldsForPass:(id)a3 context:(id)a4;
- (void)_handleVerificationResponseForPass:(id)a3 context:(id)a4;
- (void)_invalidateCardNotFoundTimer;
- (void)_noteProvisioningStateChangeForReaderMode:(int64_t)a3;
- (void)_performEligibility:(id)a3;
- (void)_performNextActionForProvisioningState:(id)a3;
- (void)_performNextStepForProvisionedPass:(id)a3 moreInfoAcknowledged:(BOOL)a4 requestContext:(id)a5;
- (void)_performNextStepForProvisionedPass:(id)a3 requestContext:(id)a4;
- (void)_performPasscodeUpgrade:(id)a3;
- (void)_performProvision:(id)a3;
- (void)_performProvisionWithRequest:(id)a3 requestContext:(id)a4 assertion:(id)a5;
- (void)_performProvisioningEligibility:(id)a3;
- (void)_performRequirementsOrEligibilityForInAppProvisioning:(id)a3;
- (void)_performResolveLocalEligibilityARequirements:(id)a3 completion:(id)a4;
- (void)_performSEStorageCheck:(id)a3;
- (void)_performTerms:(id)a3;
- (void)_performTransitionToStep:(int)a3 withContext:(id)a4;
- (void)_performValidateSecurityRequirements:(id)a3 completion:(id)a4;
- (void)_provisioningLocalizedProgressDescriptionDidChange:(id)a3;
- (void)_removePassIfNecessary;
- (void)_requestPassDetailsForAccountCredential:(id)a3 withCompletionHandler:(id)a4;
- (void)_requestRequirements:(id)a3;
- (void)_requestVerificationOptionsForPass:(id)a3 context:(id)a4;
- (void)_resetReaderModeProvisioningState;
- (void)_sendDidEncounterError:(id)a3 requestContext:(id)a4;
- (void)_sendDidTransitionFromStep:(int)a3 toStep:(int)a4 withContext:(id)a5;
- (void)_setupCardIngester;
- (void)_startCardNotFoundTimer;
- (void)_startDigitalIssuancePaymentWithAmount:(id)a3 requestContext:(id)a4;
- (void)_startDigitalIssuancePaymentWithAmount:(id)a3 requestContext:(id)a4 serviceProviderProduct:(id)a5 productItem:(id)a6;
- (void)_startIngestion;
- (void)_startProvisioningForCredential:(id)a3 requestContext:(id)a4;
- (void)_startReaderModeIngestion:(id)a3;
- (void)_startReadingCard;
- (void)_startTransferringCard;
- (void)_tearDownCardIngester;
- (void)_transitionBasedOnCredentials:(id)a3 product:(id)a4 requestContext:(id)a5;
- (void)_transitionBasedOnTermsForReason:(unint64_t)a3 URL:(id)a4 requestContext:(id)a5;
- (void)_transitionToAppleBalanceAccountDetailsWithProduct:(id)a3 requestContext:(id)a4;
- (void)_transitionToChooseCredentials:(id)a3 product:(id)a4 requestContext:(id)a5;
- (void)_transitionToChooseFlowWithSections:(id)a3 requestContext:(id)a4;
- (void)_transitionToChooseProductWithProducts:(id)a3 requestContext:(id)a4;
- (void)_transitionToDigitalIssuanceForProduct:(id)a3 requestContext:(id)a4;
- (void)_transitionToFlowIngestionState:(unint64_t)a3;
- (void)_transitionToFlowIngestionState:(unint64_t)a3 progress:(double)a4;
- (void)_transitionToIngestionProgress:(double)a3;
- (void)_transitionToManualEntry:(id)a3;
- (void)_transitionToMoreInformationWithItems:(id)a3 pass:(id)a4 requestContext:(id)a5;
- (void)_transitionToProductDisambiguationWithProducts:(id)a3 requestContext:(id)a4;
- (void)_transitionToProvisioningForCredential:(id)a3 product:(id)a4 requestContext:(id)a5;
- (void)_transitionToProvisioningProgressWithRequestContext:(id)a3;
- (void)_transitionToReaderModeForProduct:(id)a3 requestContext:(id)a4;
- (void)_transitionToSecondaryManualEntryWithFields:(id)a3 credential:(id)a4 requestContext:(id)a5;
- (void)_transitionToVerificationChannelsWithPaymentPass:(id)a3 channels:(id)a4 requestContext:(id)a5;
- (void)_transitionToVerificationCodeWithPaymentPass:(id)a3 channel:(id)a4 requestContext:(id)a5;
- (void)_transitionToVerificationFieldsWithPaymentPass:(id)a3 fields:(id)a4 requestContext:(id)a5;
- (void)_updateVerificationForPass:(id)a3 channel:(id)a4 context:(id)a5;
- (void)_verifyPasscodeStateIfNecessaryWithCompletion:(id)a3;
- (void)acceptTerms:(id)a3;
- (void)acknowledgeAppleBalanceAccountDetailsWithProduct:(id)a3 requestContext:(id)a4;
- (void)acknowledgeMoreInformation:(id)a3;
- (void)acknowledgeWelcome:(id)a3;
- (void)chooseCardsOnFileFlowForProduct:(id)a3 requestContext:(id)a4 preloadMetadata:(BOOL)a5;
- (void)chooseCredentials:(id)a3 requestContext:(id)a4;
- (void)chooseEMoneyProductFromFlowPickerSection:(id)a3 requestContext:(id)a4;
- (void)chooseFlowForPickerItem:(id)a3 requestContext:(id)a4;
- (void)chooseManualEntry:(id)a3;
- (void)chooseProduct:(id)a3 includeCardsOnFile:(BOOL)a4 requestContext:(id)a5;
- (void)chooseProduct:(id)a3 requestContext:(id)a4;
- (void)chooseProductAndCredentialsFlowForProduct:(id)a3 credentials:(id)a4 requestContext:(id)a5;
- (void)chooseReaderMode:(id)a3;
- (void)chooseTransitProductFromFlowPickerSection:(id)a3 requestContext:(id)a4;
- (void)contactlessCardIngester:(id)a3 didFailToIngestCardWithError:(id)a4 resetProvisioning:(BOOL)a5 isRecoverable:(BOOL)a6;
- (void)contactlessCardIngester:(id)a3 didUpdateCardIngestionStatus:(unint64_t)a4;
- (void)dealloc;
- (void)ensureMetadataForCredentials:(id)a3 requestContext:(id)a4 updateHandler:(id)a5 completionHandler:(id)a6;
- (void)handleDigitalIssuanceAmount:(id)a3 requestContext:(id)a4;
- (void)handleDigitalIssuanceAmount:(id)a3 serviceProviderProduct:(id)a4 item:(id)a5 requestContext:(id)a6;
- (void)handleIssuerApplicationAddRequest:(id)a3 requestContext:(id)a4;
- (void)handleIssuerVerificationChannel:(id)a3 requestContext:(id)a4;
- (void)handleIssuerVerificationCode:(id)a3 requestContext:(id)a4;
- (void)handleIssuerVerificationFields:(id)a3 requestContext:(id)a4;
- (void)handleManualEntryFields:(id)a3 credential:(id)a4 requestContext:(id)a5;
- (void)handlePasscodeUpgradeCompleteWithSuccess:(BOOL)a3 error:(id)a4 requestContext:(id)a5;
- (void)handleProductSelection:(id)a3 requestContext:(id)a4;
- (void)handleReaderModeFields:(id)a3 requestContext:(id)a4;
- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
- (void)prefetchCredentialsForProduct:(id)a3 requestContext:(id)a4 completionHandler:(id)a5;
- (void)presentTransitServiceProviderProductsWithRequestContext:(id)a3;
- (void)reset;
- (void)setAuthorizationController:(id)a3;
- (void)setCardIngester:(id)a3;
- (void)setChooseCredentialsStepIdentifier:(id)a3;
- (void)setCurrentAppleBalanceCredential:(id)a3;
- (void)setCurrentCredential:(id)a3;
- (void)setCurrentProduct:(id)a3;
- (void)setCurrentStep:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDigitalIssuanceAmount:(id)a3;
- (void)setDigitalIssuanceAmountRequestContext:(id)a3;
- (void)setDigitalIssuancePaymentRequest:(id)a3;
- (void)setDigitalIssuancePaymentRequestContext:(id)a3;
- (void)setDigitalIssuancePurchase:(id)a3;
- (void)setDigitalIssuanceSupported:(BOOL)a3;
- (void)setFidoAuthCoordinator:(id)a3;
- (void)setFieldsModel:(id)a3;
- (void)setFlowIngestionState:(unint64_t)a3;
- (void)setImmediatelyBeforeTermsStepIdentifier:(id)a3;
- (void)setInAppProvisioningGetRequestTimer:(id)a3;
- (void)setInAppProvisioningNonce:(id)a3;
- (void)setInAppProvisioningPublicKeyHash:(id)a3;
- (void)setInAppProvisioningRequest:(id)a3;
- (void)setInAppProvisioningRequestConfiguration:(id)a3;
- (void)setIngestionCardNotFoundTimer:(id)a3;
- (void)setIngestionCardSessionToken:(id)a3;
- (void)setIngestionMethodMetadata:(id)a3;
- (void)setIngestionProgress:(double)a3;
- (void)setIngestionStateOnRetry:(unint64_t)a3;
- (void)setInternalIngestionState:(unint64_t)a3;
- (void)setIssuerVerificationPass:(id)a3;
- (void)setPreconditionsRequestContext:(id)a3;
- (void)setProgressNotificationToken:(id)a3;
- (void)setProvisioningProgressRequestContext:(id)a3;
- (void)setReaderModeProvisioningSupported:(BOOL)a3;
- (void)setReaderModeRequestContext:(id)a3;
- (void)setSeparateLocalDeviceEntryRequired:(BOOL)a3;
- (void)setTermsAcceptedOutOfBand:(BOOL)a3;
- (void)setTermsReason:(unint64_t)a3;
- (void)setUnitTestingAuthorizationController:(id)a3;
- (void)setUnitTestingCardIngester:(id)a3;
- (void)setWebService:(id)a3;
- (void)skipIssuerVerification:(id)a3;
- (void)skipProvisioning:(id)a3;
- (void)startInAppProvisioningFlowWithConfiguration:(id)a3 requestContext:(id)a4;
- (void)startIssuerVerificationFlowForPaymentPass:(id)a3 requestContext:(id)a4;
- (void)startProvisioningFlow:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowController

- (NPKPaymentProvisioningFlowController)initWithProvisioningController:(id)a3 setupContext:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NPKPaymentProvisioningFlowController;
  v8 = [(NPKPaymentProvisioningFlowController *)&v29 init];
  if (v8)
  {
    uint64_t v9 = [v7 webService];
    webService = v8->_webService;
    v8->_webService = (PKPaymentWebService *)v9;

    v11 = pk_Payment_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(PKPaymentWebService *)v8->_webService debugDescription];
        uint64_t v15 = [v14 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v31 = v15;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: checking webService %s: ", buf, 0xCu);
      }
    }
    v8->_currentStep = 100;
    p_provisioningController = (id *)&v8->_provisioningController;
    objc_storeStrong((id *)&v8->_provisioningController, a3);
    v8->_setupContext = a4;
    v17 = pk_Payment_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      v19 = pk_Payment_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [*p_provisioningController debugDescription];
        uint64_t v21 = [v20 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v31 = v21;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: checking controller initialization %s: ", buf, 0xCu);
      }
    }
    objc_initWeak((id *)buf, v8);
    v22 = [MEMORY[0x263F08A00] defaultCenter];
    id v23 = *p_provisioningController;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __84__NPKPaymentProvisioningFlowController_initWithProvisioningController_setupContext___block_invoke;
    v27[3] = &unk_2644D39A0;
    objc_copyWeak(&v28, (id *)buf);
    uint64_t v24 = [v22 addObserverForName:*MEMORY[0x263F5C730] object:v23 queue:0 usingBlock:v27];
    progressNotificationToken = v8->_progressNotificationToken;
    v8->_progressNotificationToken = v24;

    [MEMORY[0x263F5BD40] beginSubjectReporting:@"provisioning"];
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

void __84__NPKPaymentProvisioningFlowController_initWithProvisioningController_setupContext___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _provisioningLocalizedProgressDescriptionDidChange:v5];
  }
}

- (void)dealloc
{
  if (self->_progressNotificationToken)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_progressNotificationToken];
  }
  [MEMORY[0x263F5BD40] endSubjectReporting:@"provisioning"];
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowController;
  [(NPKPaymentProvisioningFlowController *)&v4 dealloc];
}

- (void)reset
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F5BD40];
  objc_super v4 = NPKAnalyticsEventForProvisioningFlowClientInput(@"reset", 0);
  [v3 subject:@"provisioning" sendEvent:v4];

  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(PKPaymentWebService *)self->_webService debugDescription];
      int v14 = 136315138;
      uint64_t v15 = [v8 UTF8String];
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: checking webService %s: ", (uint8_t *)&v14, 0xCu);
    }
  }
  [(PKPaymentProvisioningController *)self->_provisioningController reset];
  currentCredential = self->_currentCredential;
  self->_currentCredential = 0;

  currentAppleBalanceCredential = self->_currentAppleBalanceCredential;
  self->_currentAppleBalanceCredential = 0;

  currentProduct = self->_currentProduct;
  self->_currentProduct = 0;

  self->_termsAcceptedOutOfBand = 0;
  self->_currentStep = 100;
  chooseCredentialsStepIdentifier = self->_chooseCredentialsStepIdentifier;
  self->_chooseCredentialsStepIdentifier = 0;

  inAppProvisioningRequestConfiguration = self->_inAppProvisioningRequestConfiguration;
  self->_inAppProvisioningRequestConfiguration = 0;
}

- (void)startProvisioningFlow:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F5BD40];
  BOOL v6 = NPKAnalyticsEventForProvisioningFlowClientInput(@"startProvisioningFlow", 0);
  [v5 subject:@"provisioning" sendEvent:v6];

  int currentStep = self->_currentStep;
  id v8 = pk_Payment_log();
  uint64_t v9 = v8;
  if (currentStep == 100)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: starting provisioning flow", buf, 2u);
      }
    }
    [(NPKPaymentProvisioningFlowController *)self _handleProvisioningFlowStarted:v4];
  }
  else
  {
    BOOL v12 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: Past initialization step; cannot start provisioning flow!",
          v14,
          2u);
      }
    }
  }
}

- (void)acknowledgeWelcome:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F5BD40];
  BOOL v6 = NPKAnalyticsEventForProvisioningFlowClientInput(@"acknowledgeWelcome", 0);
  [v5 subject:@"provisioning" sendEvent:v6];

  if (self->_inAppProvisioningRequestConfiguration)
  {
    [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v4];
  }
  else
  {
    id v7 = [(id)objc_opt_class() _flowPickerSectionsWithContext:self->_setupContext provisioningController:self->_provisioningController readerModeSupported:self->_readerModeProvisioningSupported digitalIssuanceSupported:self->_digitalIssuanceSupported];
    id v8 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
    uint64_t v9 = [v8 webService];
    uint64_t v10 = [v9 paymentSetupSupportedInRegion];

    int IsTinker = NPKPairedOrPairingDeviceIsTinker();
    if (IsTinker) {
      BOOL v12 = [(PKPaymentProvisioningController *)self->_provisioningController isCurrentUserUnder13] == 1;
    }
    else {
      BOOL v12 = 0;
    }
    if (v10 == 1) {
      int v13 = IsTinker;
    }
    else {
      int v13 = 1;
    }
    if (v10 != 1) {
      BOOL v12 = 1;
    }
    BOOL v14 = !v12;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke;
    v24[3] = &unk_2644D39E8;
    id v15 = v7;
    id v25 = v15;
    uint64_t v16 = (void (**)(void, void, void, void))MEMORY[0x223C37380](v24);
    v17 = v16;
    if (IsTinker & v14)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke_3;
      v19[3] = &unk_2644D3A10;
      v19[4] = self;
      v22 = v16;
      id v20 = v15;
      char v23 = v13;
      id v21 = v4;
      [(NPKPaymentProvisioningFlowController *)self _canMakeDigitalIssuancePaymentsForTransitProductsWithCompletion:v19];
    }
    else
    {
      BOOL v18 = ((void (**)(void, id, void, BOOL))v16)[2](v16, v15, v13 ^ 1u, v14);
      [(NPKPaymentProvisioningFlowController *)self _transitionToChooseFlowWithSections:v18 requestContext:v4];
    }
  }
}

id __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke(uint64_t a1, void *a2, int a3, char a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a3 && (a4 & 1) != 0)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke_2;
    v13[3] = &__block_descriptor_34_e56_B32__0__NPKPaymentProvisioningFlowPickerSection_8Q16_B24l;
    char v14 = a3;
    char v15 = a4;
    objc_msgSend(v10, "pk_objectsPassingTest:", v13);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  return v11;
}

BOOL __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPaymentSection])
  {
    int v4 = *(unsigned __int8 *)(a1 + 32);
  }
  else
  {
    if (![v3 isTransitSection])
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
    int v4 = *(unsigned __int8 *)(a1 + 33);
  }
  BOOL v5 = v4 != 0;
LABEL_7:

  return v5;
}

void __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  (*(void (**)(void, void, BOOL, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 40), *(unsigned char *)(a1 + 64) == 0, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 _transitionToChooseFlowWithSections:v4 requestContext:*(void *)(a1 + 48)];
}

- (void)chooseFlowForPickerItem:(id)a3 requestContext:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];

  if (v8)
  {
    char v14 = @"flowItem";
    id v9 = [v6 identifier];
    v15[0] = v9;
    id v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  uint64_t v10 = (void *)MEMORY[0x263F5BD40];
  v11 = NPKAnalyticsEventForProvisioningFlowClientInput(@"chooseFlow", v8);
  [v10 subject:@"provisioning" sendEvent:v11];

  BOOL v12 = [v6 products];
  if ((unint64_t)[v12 count] < 2)
  {
    int v13 = [v12 firstObject];
    [(NPKPaymentProvisioningFlowController *)self _handleProductChosen:v13 includeCardsOnFile:1 requestContext:v7];
  }
  else
  {
    [(NPKPaymentProvisioningFlowController *)self _transitionToChooseProductWithProducts:v12 requestContext:v7];
  }
}

+ (id)_filterAssociatedCredentials:(id)a3 forProduct:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 paymentOptions];
  id v8 = [v7 firstObject];

  if (v8) {
    uint64_t v9 = [v8 cardType];
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [v6 productIdentifier];
  v11 = v10;
  if (v9 && v10 && [v10 length])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__NPKPaymentProvisioningFlowController__filterAssociatedCredentials_forProduct___block_invoke;
    v18[3] = &unk_2644D3A38;
    uint64_t v20 = v9;
    v19 = v11;
    BOOL v12 = objc_msgSend(v5, "pk_objectsPassingTest:", v18);
    int v13 = v19;
LABEL_12:

    goto LABEL_14;
  }
  char v14 = pk_General_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

  if (v15)
  {
    int v13 = pk_General_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v6 displayName];
      *(_DWORD *)buf = 138412802;
      v22 = v16;
      __int16 v23 = 1024;
      int v24 = v9;
      __int16 v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: Failed collecting associated credentials for product = '%@', cardType = %u, productIdentifier = %@", buf, 0x1Cu);
    }
    BOOL v12 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_12;
  }
  BOOL v12 = (void *)MEMORY[0x263EFFA68];
LABEL_14:

  return v12;
}

uint64_t __80__NPKPaymentProvisioningFlowController__filterAssociatedCredentials_forProduct___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 credentialType] == *(void *)(a1 + 40)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 productIdentifier];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasCredentialsAssociatedWithProduct:(id)a3
{
  provisioningController = self->_provisioningController;
  id v4 = a3;
  uint64_t v5 = [(PKPaymentProvisioningController *)provisioningController associatedCredentials];
  id v6 = [(id)objc_opt_class() _filterAssociatedCredentials:v5 forProduct:v4];

  LOBYTE(v4) = [v6 count] != 0;
  return (char)v4;
}

- (void)_ensureMetadataForCredentials:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v41 = (void (**)(id, uint64_t, void, id))a4;
  id v36 = a5;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  char v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__4;
  v63[4] = __Block_byref_object_dispose__4;
  id v64 = 0;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v40 = self->_provisioningController;
  v37 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v60;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v59 + 1) + 8 * v12);
        uint64_t v14 = [v13 credentialType];
        if (!v14) {
          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        id v15 = v13;
        if (![v15 requiresMetadata])
        {

LABEL_12:
          [v9 addObject:v13];
          goto LABEL_13;
        }
        uint64_t v16 = [v15 productIdentifier];
        if (v16) {
          [NSString stringWithFormat:@"%u,%@", v14, v16];
        }
        else {
        v17 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v14);
        }
        BOOL v18 = [v37 objectForKey:v17];
        v19 = v18;
        if (v18)
        {
          uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") + 1);
        }
        else
        {
          uint64_t v20 = [NSNumber numberWithUnsignedInteger:1];
        }
        [v37 setObject:v20 forKeyedSubscript:v17];

LABEL_13:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v21 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      uint64_t v10 = v21;
    }
    while (v21);
  }

  if ([v37 count])
  {
    if (v41 && [v9 count]) {
      v41[2](v41, 1, 0, v9);
    }
    v22 = [v37 keysSortedByValueUsingComparator:&__block_literal_global_5];
    id v23 = objc_alloc_init(MEMORY[0x263F5BD90]);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v38 = v22;
    uint64_t v24 = [v38 countByEnumeratingWithState:&v55 objects:v67 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v56 != v25) {
            objc_enumerationMutation(v38);
          }
          uint64_t v27 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          uint64_t v28 = [v27 rangeOfString:@","];
          uint64_t v29 = v28;
          if (v28 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v30 = [v27 integerValue];
            uint64_t v31 = 0;
          }
          else
          {
            uint64_t v31 = [v27 substringFromIndex:v28 + 1];
            uint64_t v32 = [v27 substringToIndex:v29];
            uint64_t v30 = [v32 integerValue];
          }
          v47[0] = MEMORY[0x263EF8330];
          v47[1] = 3221225472;
          v47[2] = __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_2;
          v47[3] = &unk_2644D3AA8;
          uint64_t v54 = v30;
          id v33 = v31;
          id v48 = v33;
          v49 = v40;
          v52 = v63;
          id v50 = v9;
          v53 = v65;
          v51 = v41;
          [v23 addOperation:v47];
        }
        uint64_t v24 = [v38 countByEnumeratingWithState:&v55 objects:v67 count:16];
      }
      while (v24);
    }

    v34 = [MEMORY[0x263EFF9D0] null];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_76;
    v42[3] = &unk_2644D3AD0;
    id v44 = v36;
    v45 = v65;
    v46 = v63;
    id v43 = v9;
    id v35 = (id)[v23 evaluateWithInput:v34 completion:v42];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, id))v36 + 2))(v36, 1, 0, v9);
  }

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);
}

uint64_t __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  uint64_t v9 = v8;
  id v10 = objc_alloc_init(MEMORY[0x263F5C068]);
  [v10 setIncludeMetadata:1];
  [v10 setCredentialType:*(void *)(a1 + 80)];
  [v10 setProductIdentifier:*(void *)(a1 + 32)];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_3;
  v18[3] = &unk_2644D3A80;
  uint64_t v26 = v9;
  uint64_t v27 = *(void *)(a1 + 80);
  uint64_t v11 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 64);
  id v19 = v12;
  uint64_t v24 = v13;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 72);
  id v20 = v14;
  uint64_t v25 = v15;
  id v22 = *(id *)(a1 + 56);
  id v23 = v7;
  id v21 = v6;
  id v16 = v6;
  id v17 = v7;
  [v11 updateRemoteCredentials:v10 withCompletionHandler:v18];
}

void __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v11 = v10;
  double v12 = *(double *)(a1 + 88);
  uint64_t v13 = pk_General_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    uint64_t v15 = pk_General_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 96);
      id v17 = *(void **)(a1 + 32);
      int v27 = 67109634;
      int v28 = v16;
      __int16 v29 = 2112;
      id v30 = v17;
      __int16 v31 = 2048;
      double v32 = v11 - v12;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: updateRemoteCredentials [%u, %@] completed in %f seconds", (uint8_t *)&v27, 0x1Cu);
    }
  }
  if (!v9 || ![v9 count])
  {
    BOOL v18 = pk_General_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      id v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 96);
        int v27 = 67109120;
        int v28 = v21;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Warning: User had matching associated credentials (type=%d) but when fetching metadata no credentials were returned", (uint8_t *)&v27, 8u);
      }
    }
  }
  if (v8)
  {
    id v22 = pk_General_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

    if (v23)
    {
      uint64_t v24 = pk_General_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(a1 + 96);
        int v27 = 67109378;
        int v28 = v25;
        __int16 v29 = 2112;
        id v30 = v8;
        _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_ERROR, "Error: Failed collecting metadata for associated credentials (type=%d), error = %@", (uint8_t *)&v27, 0x12u);
      }
    }
  }
  if (a2 && v9 && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    [*(id *)(a1 + 40) addObjectsFromArray:v9];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= a2;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
  uint64_t v26 = *(void *)(a1 + 56);
  if (v26) {
    (*(void (**)(uint64_t, uint64_t, id, void))(v26 + 16))(v26, a2, v8, *(void *)(a1 + 40));
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_76(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_cardsOnFileForProduct:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v16 = a3;
  if (v16)
  {
    id v8 = a5;
    id v9 = a4;
    double v10 = objc_opt_class();
    double v11 = [(PKPaymentProvisioningController *)self->_provisioningController associatedCredentials];
    double v12 = [v10 _filterAssociatedCredentials:v11 forProduct:v16];
  }
  else
  {
    provisioningController = self->_provisioningController;
    id v14 = a5;
    id v15 = a4;
    double v12 = [(PKPaymentProvisioningController *)provisioningController associatedCredentials];
  }
  [(NPKPaymentProvisioningFlowController *)self _ensureMetadataForCredentials:v12 updateHandler:a4 completionHandler:a5];
}

- (void)ensureMetadataForCredentials:(id)a3 requestContext:(id)a4 updateHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __116__NPKPaymentProvisioningFlowController_ensureMetadataForCredentials_requestContext_updateHandler_completionHandler___block_invoke;
  v19[3] = &unk_2644D3AF8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __116__NPKPaymentProvisioningFlowController_ensureMetadataForCredentials_requestContext_updateHandler_completionHandler___block_invoke_78;
  v16[3] = &unk_2644D3AF8;
  v16[4] = self;
  id v17 = v20;
  id v18 = v12;
  id v13 = v12;
  id v14 = v20;
  id v15 = v11;
  [(NPKPaymentProvisioningFlowController *)self _ensureMetadataForCredentials:a3 updateHandler:v19 completionHandler:v16];
}

void __116__NPKPaymentProvisioningFlowController_ensureMetadataForCredentials_requestContext_updateHandler_completionHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when setting up product for provisioning: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    [*(id *)(a1 + 32) _sendDidEncounterError:v7 requestContext:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __116__NPKPaymentProvisioningFlowController_ensureMetadataForCredentials_requestContext_updateHandler_completionHandler___block_invoke_78(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when setting up product for provisioning: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    [*(id *)(a1 + 32) _sendDidEncounterError:v7 requestContext:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)chooseCardsOnFileFlowForProduct:(id)a3 requestContext:(id)a4 preloadMetadata:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  if (v5)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __103__NPKPaymentProvisioningFlowController_chooseCardsOnFileFlowForProduct_requestContext_preloadMetadata___block_invoke;
    v13[3] = &unk_2644D3B20;
    void v13[4] = self;
    id v14 = v9;
    id v15 = v10;
    [(NPKPaymentProvisioningFlowController *)self _cardsOnFileForProduct:v14 updateHandler:0 completionHandler:v13];
  }
  else
  {
    id v11 = self->_provisioningController;
    int v12 = [(PKPaymentProvisioningController *)v11 associatedCredentials];
    objc_storeStrong((id *)&self->_currentProduct, a3);
    [(NPKPaymentProvisioningFlowController *)self _transitionBasedOnCredentials:v12 product:v9 requestContext:v10];
  }
}

void __103__NPKPaymentProvisioningFlowController_chooseCardsOnFileFlowForProduct_requestContext_preloadMetadata___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(a1 + 40));
    [*(id *)(a1 + 32) _transitionBasedOnCredentials:v8 product:*(void *)(a1 + 40) requestContext:*(void *)(a1 + 48)];
  }
  else
  {
    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when setting up product for provisioning: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    [*(id *)(a1 + 32) _sendDidEncounterError:v7 requestContext:*(void *)(a1 + 48)];
  }
}

+ (id)_productsArrayFromPickerSection:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = objc_msgSend(v3, "items", 0);
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
        BOOL v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) products];
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

- (void)_chooseProductFromFlowPickerSection:(id)a3 requestContext:(id)a4 transitioningToStep:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = [(id)objc_opt_class() _productsArrayFromPickerSection:v9];

  BOOL v10 = [[NPKPaymentProvisioningFlowControllerChooseProductStepContext alloc] initWithRequestContext:v8];
  [(NPKPaymentProvisioningFlowControllerChooseProductStepContext *)v10 setProducts:v11];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:v5 withContext:v10];
}

- (void)chooseTransitProductFromFlowPickerSection:(id)a3 requestContext:(id)a4
{
}

- (void)chooseEMoneyProductFromFlowPickerSection:(id)a3 requestContext:(id)a4
{
}

- (void)prefetchCredentialsForProduct:(id)a3 requestContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = !NPKPaymentProvisioningSetupContextIsSetupAssistant(self->_setupContext);
  provisioningController = self->_provisioningController;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __103__NPKPaymentProvisioningFlowController_prefetchCredentialsForProduct_requestContext_completionHandler___block_invoke;
  v16[3] = &unk_2644D3B48;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [(PKPaymentProvisioningController *)provisioningController setupProductForProvisioning:v14 includePurchases:v11 withCompletionHandler:v16];
}

void __103__NPKPaymentProvisioningFlowController_prefetchCredentialsForProduct_requestContext_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v6 = pk_Payment_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [*(id *)(a1 + 32) displayName];
        int v10 = 138412546;
        BOOL v11 = v9;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when collecting associated purchases for product %@, error: %@", (uint8_t *)&v10, 0x16u);
      }
    }
    [*(id *)(a1 + 40) _sendDidEncounterError:v5 requestContext:*(void *)(a1 + 48)];
  }
}

- (void)chooseProductAndCredentialsFlowForProduct:(id)a3 credentials:(id)a4 requestContext:(id)a5
{
}

- (void)chooseProduct:(id)a3 includeCardsOnFile:(BOOL)a4 requestContext:(id)a5
{
  BOOL v6 = a4;
  v15[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = [v8 productIdentifier];

  if (v10)
  {
    uint64_t v14 = @"productIdentifier";
    BOOL v11 = [v8 productIdentifier];
    v15[0] = v11;
    int v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  __int16 v12 = (void *)MEMORY[0x263F5BD40];
  id v13 = NPKAnalyticsEventForProvisioningFlowClientInput(@"chooseProduct", v10);
  [v12 subject:@"provisioning" sendEvent:v13];

  if ([v8 isAppleBalanceProduct]) {
    [(NPKPaymentProvisioningFlowController *)self _handleAppleBalanceProductChosen:v8 requestContext:v9];
  }
  else {
    [(NPKPaymentProvisioningFlowController *)self _handleProductChosen:v8 includeCardsOnFile:v6 requestContext:v9];
  }
}

- (void)chooseProduct:(id)a3 requestContext:(id)a4
{
}

- (void)handleDigitalIssuanceAmount:(id)a3 requestContext:(id)a4
{
  BOOL v6 = (NSDecimalNumber *)a3;
  BOOL v7 = (void *)MEMORY[0x263F5BD40];
  id v11 = a4;
  id v8 = NPKAnalyticsEventForProvisioningFlowClientInput(@"digitalIssuanceAmount", 0);
  [v7 subject:@"provisioning" sendEvent:v8];

  digitalIssuanceAmount = self->_digitalIssuanceAmount;
  self->_digitalIssuanceAmount = v6;
  int v10 = v6;

  [(NPKPaymentProvisioningFlowController *)self _startDigitalIssuancePaymentWithAmount:v10 requestContext:v11];
}

- (void)handleDigitalIssuanceAmount:(id)a3 serviceProviderProduct:(id)a4 item:(id)a5 requestContext:(id)a6
{
  int v10 = (NSDecimalNumber *)a3;
  id v11 = (void *)MEMORY[0x263F5BD40];
  id v12 = a6;
  id v13 = a5;
  id v17 = a4;
  uint64_t v14 = NPKAnalyticsEventForProvisioningFlowClientInput(@"digitalIssuanceAmount", 0);
  [v11 subject:@"provisioning" sendEvent:v14];

  digitalIssuanceAmount = self->_digitalIssuanceAmount;
  self->_digitalIssuanceAmount = v10;
  long long v16 = v10;

  [(NPKPaymentProvisioningFlowController *)self _startDigitalIssuancePaymentWithAmount:v16 requestContext:v12 serviceProviderProduct:v17 productItem:v13];
}

- (void)chooseReaderMode:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5BD40];
  id v6 = a3;
  id v5 = NPKAnalyticsEventForProvisioningFlowClientInput(@"chooseReaderMode", 0);
  [v4 subject:@"provisioning" sendEvent:v5];

  [(NPKPaymentProvisioningFlowController *)self _transitionToReaderModeForProduct:self->_currentProduct requestContext:v6];
}

- (void)handleReaderModeFields:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  NPKAnalyticsEventEntriesForPaymentSetupFields(a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v7 = (void *)MEMORY[0x263F5BD40];
  id v8 = NPKAnalyticsEventForProvisioningFlowClientInput(@"readerModeFields", v10);
  [v7 subject:@"provisioning" sendEvent:v8];

  id v9 = [(PKPaymentSetupProduct *)self->_currentProduct termsURL];
  [(NPKPaymentProvisioningFlowController *)self _transitionBasedOnTermsForReason:2 URL:v9 requestContext:v6];
}

- (void)chooseCredentials:(id)a3 requestContext:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = NPKAnalyticsEventEntriesForCredentials(v6);
  id v9 = (void *)MEMORY[0x263F5BD40];
  id v10 = NPKAnalyticsEventForProvisioningFlowClientInput(@"chooseCredentials", v8);
  [v9 subject:@"provisioning" sendEvent:v10];

  id v11 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_83];
  id v12 = [v6 filteredArrayUsingPredicate:v11];

  if ([v12 count])
  {
    [(NPKPaymentProvisioningFlowController *)self _handleProceedWithCredentials:v12 chosenByUser:1 requestContext:v7];
  }
  else
  {
    id v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      id v15 = pk_General_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_ERROR, "Error: Error: No valid provisioning methods exist for credentials [%@]", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

BOOL __73__NPKPaymentProvisioningFlowController_chooseCredentials_requestContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 remoteCredential];
  id v3 = v2;
  if (v2) {
    BOOL v4 = (unint64_t)([v2 status] - 1) < 2;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)chooseManualEntry:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F5BD40];
  id v6 = a3;
  id v5 = NPKAnalyticsEventForProvisioningFlowClientInput(@"chooseManualEntry", 0);
  [v4 subject:@"provisioning" sendEvent:v5];

  [(NPKPaymentProvisioningFlowController *)self _transitionBasedOnCredentials:0 product:self->_currentProduct requestContext:v6];
}

- (void)handleManualEntryFields:(id)a3 credential:(id)a4 requestContext:(id)a5
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NPKAnalyticsEventEntriesForPaymentSetupFields(v8);
  id v12 = (void *)MEMORY[0x263F5BD40];
  long long v62 = v11;
  id v13 = NPKAnalyticsEventForProvisioningFlowClientInput(@"manualEntryFields", v11);
  [v12 subject:@"provisioning" sendEvent:v13];

  if ([(PKPaymentProvisioningController *)self->_provisioningController state] == 3) {
    [(PKPaymentProvisioningController *)self->_provisioningController declineTerms];
  }
  if (self->_currentStep == 192)
  {
    BOOL v14 = [[NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext alloc] initWithRequestContext:v10];
    [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:193 withContext:v14];
  }
  id v63 = v10;
  if ([(PKPaymentProvisioningController *)self->_provisioningController state] == 1)
  {
    if (v9)
    {
      if (PKEqualObjects()) {
        goto LABEL_39;
      }
      id v15 = pk_General_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        id v17 = pk_General_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          currentCredential = self->_currentCredential;
          *(_DWORD *)buf = 138412546;
          id v81 = v9;
          __int16 v82 = 2112;
          v83 = currentCredential;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Provided credential %@ does not match current credential %@; going back to requirements",
            buf,
            0x16u);
        }
      }
      id v19 = [v9 requirementsResponse];
      uint64_t v20 = [v19 requiredPaymentSetupFields];
    }
    else
    {
      id v19 = [MEMORY[0x263EFF9C0] set];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v21 = v8;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v73 objects:v79 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v74 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = [*(id *)(*((void *)&v73 + 1) + 8 * i) identifier];
            [v19 addObject:v26];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v73 objects:v79 count:16];
        }
        while (v23);
      }

      fieldsModel = [MEMORY[0x263EFF9C0] set];
      if ((self->_currentStep & 0xFFFFFFFE) == 0xC0) {
        [(NPKPaymentProvisioningFlowController *)self _localRequiredFieldsFromRequirementsResponse];
      }
      else {
        [(NPKPaymentProvisioningFlowController *)self _requiredFieldsFromRequirementsResponseExcludingLocalFields];
      }
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = [v28 countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v70;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v70 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = [*(id *)(*((void *)&v69 + 1) + 8 * j) identifier];
            [fieldsModel addObject:v33];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v69 objects:v78 count:16];
        }
        while (v30);
      }

      if ([fieldsModel isSubsetOfSet:v19])
      {

LABEL_38:
        goto LABEL_39;
      }
      v34 = pk_General_log();
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

      if (v35)
      {
        id v36 = pk_General_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v81 = v19;
          __int16 v82 = 2112;
          v83 = (PKPaymentCredential *)fieldsModel;
          _os_log_impl(&dword_21E92F000, v36, OS_LOG_TYPE_DEFAULT, "Notice: Manual entry fields %@ do not contain all required fields %@; going back to requirements",
            buf,
            0x16u);
        }
      }
      uint64_t v20 = [(NPKPaymentProvisioningFlowController *)self _curatedDefaultPaymentSetupProvisioningFields];
    }
    [(PKPaymentProvisioningController *)self->_provisioningController resetForNewProvisioning];
    v37 = [(PKPaymentProvisioningController *)self->_provisioningController credentialProvisioningQueue];
    [v37 setCurrentCredential:v9];

    id v38 = (PKPaymentSetupFieldsModel *)[objc_alloc(MEMORY[0x263F5C0C8]) initWithPaymentSetupFields:v20];
    fieldsModel = self->_fieldsModel;
    self->_fieldsModel = v38;
    id v19 = (void *)v20;
    goto LABEL_38;
  }
LABEL_39:
  v39 = pk_Payment_log();
  BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

  if (v40)
  {
    v41 = pk_Payment_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFields];
      *(_DWORD *)buf = 138412546;
      id v81 = v8;
      __int16 v82 = 2112;
      v83 = v42;
      _os_log_impl(&dword_21E92F000, v41, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling manual entry fields: %@ with fields model fields: %@", buf, 0x16u);
    }
  }
  id v64 = v9;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v43 = v8;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v66;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v66 != v46) {
          objc_enumerationMutation(v43);
        }
        id v48 = *(void **)(*((void *)&v65 + 1) + 8 * k);
        v49 = self->_fieldsModel;
        id v50 = [v48 identifier];
        v51 = [(PKPaymentSetupFieldsModel *)v49 paymentSetupFieldWithIdentifier:v50];

        v52 = pk_Payment_log();
        BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);

        if (v51)
        {
          if (!v53) {
            goto LABEL_56;
          }
          uint64_t v54 = pk_Payment_log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v81 = v51;
            _os_log_impl(&dword_21E92F000, v54, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Updating %@", buf, 0xCu);
          }
        }
        else
        {
          if (!v53) {
            goto LABEL_56;
          }
          uint64_t v54 = pk_Payment_log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            long long v55 = [v48 identifier];
            *(_DWORD *)buf = 138412290;
            id v81 = v55;
            _os_log_impl(&dword_21E92F000, v54, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: no model field with identifier %@ to update!", buf, 0xCu);
          }
        }

LABEL_56:
        long long v56 = [v48 currentValue];
        [v51 setCurrentValue:v56];

        objc_msgSend(v51, "setSource:", objc_msgSend(v48, "source") == 1);
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v45);
  }

  if ([(NPKPaymentProvisioningFlowController *)self _fieldsModelCompleteExceptForLocalFields:self->_fieldsModel])
  {
    long long v57 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFields];
    long long v58 = self;
    long long v60 = v63;
    long long v59 = v64;
    [(NPKPaymentProvisioningFlowController *)v58 _transitionToSecondaryManualEntryWithFields:v57 credential:v64 requestContext:v63];
  }
  else
  {
    long long v61 = self;
    long long v60 = v63;
    [(NPKPaymentProvisioningFlowController *)v61 _performNextActionForProvisioningState:v63];
    long long v59 = v64;
  }
}

- (void)handleProductSelection:(id)a3 requestContext:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = NPKAnalyticsEventEntriesForProduct(v6);
  id v9 = (void *)MEMORY[0x263F5BD40];
  id v10 = NPKAnalyticsEventForProvisioningFlowClientInput(@"productSelection", v8);
  [v9 subject:@"provisioning" sendEvent:v10];

  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [v6 rawDictionary];
      int v31 = 138412546;
      uint64_t v32 = (uint64_t)v6;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling product selection: %@ (%@)", (uint8_t *)&v31, 0x16u);
    }
  }
  if (self->_currentStep == 195)
  {
    if (v6)
    {
      id v15 = pk_Payment_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        id v17 = pk_Payment_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v6 productIdentifier];
          uint64_t v19 = [(PKPaymentProvisioningController *)self->_provisioningController state];
          uint64_t v20 = [(PKPaymentProvisioningController *)self->_provisioningController requirementsResponse];
          uint64_t v21 = [v20 status];
          int v31 = 138412802;
          uint64_t v32 = (uint64_t)v18;
          __int16 v33 = 2048;
          uint64_t v34 = v19;
          __int16 v35 = 2048;
          uint64_t v36 = v21;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: id %@ state %lu response status %lu", (uint8_t *)&v31, 0x20u);
        }
      }
      provisioningController = self->_provisioningController;
      uint64_t v23 = [v6 productIdentifier];
      [(PKPaymentProvisioningController *)provisioningController resolveAmbiguousRequirementsWithProductIdentifier:v23];
    }
    uint64_t v24 = [(NPKPaymentProvisioningFlowController *)self _requiredFieldsFromRequirementsResponseExcludingLocalFields];
    uint64_t v25 = pk_Payment_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      int v27 = pk_Payment_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = [v24 count];
        int v31 = 134217984;
        uint64_t v32 = v28;
        _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Start secondary manual entry with %lu fields following product disambiguation.", (uint8_t *)&v31, 0xCu);
      }
    }
    [(NPKPaymentProvisioningFlowController *)self _transitionToSecondaryManualEntryWithFields:v24 credential:0 requestContext:v7];
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v29 = pk_Payment_log();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

  if (v30)
  {
    uint64_t v24 = pk_Payment_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_ERROR, "Error: Not on product disambiguation step; cannot choose product!",
        (uint8_t *)&v31,
        2u);
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)handlePasscodeUpgradeCompleteWithSuccess:(BOOL)a3 error:(id)a4 requestContext:(id)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x263F5BD40];
  id v11 = NPKAnalyticsEventForProvisioningFlowClientInput(@"passcodeUpgradeComplete", 0);
  [v10 subject:@"provisioning" sendEvent:v11];

  BOOL v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    BOOL v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109378;
      v15[1] = v6;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling passcode upgrade complete with success: %d error: %@", (uint8_t *)v15, 0x12u);
    }
  }
  [(NPKPaymentProvisioningFlowController *)self _handlePasscodeUpgradeCompleteWithSuccess:v6 error:v8 requestContext:v9];
}

- (void)acknowledgeAppleBalanceAccountDetailsWithProduct:(id)a3 requestContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F5BD40];
  id v9 = NPKAnalyticsEventForProvisioningFlowClientInput(@"acknowledgeAppleBalanceAccountDetails", 0);
  [v8 subject:@"provisioning" sendEvent:v9];

  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling Apple Balance Account Details Acknowledged with product: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  [(NPKPaymentProvisioningFlowController *)self _handleAppleBalanceAccountDetailsAcknowledgedWithProduct:v6 requestContext:v7];
}

- (void)acceptTerms:(id)a3
{
  id v8 = a3;
  BOOL v4 = (void *)MEMORY[0x263F5BD40];
  id v5 = NPKAnalyticsEventForProvisioningFlowClientInput(@"acceptTerms", 0);
  [v4 subject:@"provisioning" sendEvent:v5];

  unint64_t termsReason = self->_termsReason;
  if (termsReason == 2)
  {
    [(NPKPaymentProvisioningFlowController *)self _handleReaderModeTermsAccepted:v8];
  }
  else if (termsReason == 1)
  {
    [(NPKPaymentProvisioningFlowController *)self _handleDigitalIssuanceTermsAccepted:v8];
  }
  else
  {
    id v7 = v8;
    if (termsReason) {
      goto LABEL_8;
    }
    [(PKPaymentProvisioningController *)self->_provisioningController acceptTerms];
    [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v8];
  }
  id v7 = v8;
LABEL_8:
}

- (void)skipProvisioning:(id)a3
{
  id v7 = a3;
  BOOL v4 = (void *)MEMORY[0x263F5BD40];
  id v5 = NPKAnalyticsEventForProvisioningFlowClientInput(@"skipProvisioning", 0);
  [v4 subject:@"provisioning" sendEvent:v5];

  if ((self->_currentStep - 180) <= 0x14 && ((1 << (LOBYTE(self->_currentStep) + 76)) & 0x103401) != 0) {
    [(NPKPaymentProvisioningFlowController *)self _handleEndOfProvisioningFlowForCurrentPass:0 requestContext:v7];
  }
}

- (void)acknowledgeMoreInformation:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F5BD40];
  id v5 = a3;
  id v6 = NPKAnalyticsEventForProvisioningFlowClientInput(@"acknowledgeMoreInformation", 0);
  [v4 subject:@"provisioning" sendEvent:v6];

  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v11 = 0;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: More information acknowledged", v11, 2u);
    }
  }
  id v10 = [(PKPaymentProvisioningController *)self->_provisioningController provisionedPass];
  [(NPKPaymentProvisioningFlowController *)self _performNextStepForProvisionedPass:v10 moreInfoAcknowledged:1 requestContext:v5];
}

- (void)presentTransitServiceProviderProductsWithRequestContext:(id)a3
{
}

- (void)startIssuerVerificationFlowForPaymentPass:(id)a3 requestContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x263F5BD40];
  id v10 = NPKAnalyticsEventForProvisioningFlowClientInput(@"startIssuerVerificationFlow", 0);
  [v9 subject:@"provisioning" sendEvent:v10];

  int currentStep = self->_currentStep;
  BOOL v12 = pk_Payment_log();
  int v13 = v12;
  if (currentStep == 100)
  {
    BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      uint64_t v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = [v7 uniqueID];
        int v19 = 138412290;
        uint64_t v20 = v16;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: starting issuer verification flow for pass %@", (uint8_t *)&v19, 0xCu);
      }
    }
    objc_storeStrong((id *)&self->_issuerVerificationPass, a3);
    [(NPKPaymentProvisioningFlowController *)self _requestVerificationOptionsForPass:v7 context:v8];
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      uint64_t v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_ERROR, "Error: Past initialization step; cannot start issuer verification flow!",
          (uint8_t *)&v19,
          2u);
      }
    }
  }
}

- (void)handleIssuerVerificationChannel:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  NPKAnalyticsEventEntriesForVerificationChannel(v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)MEMORY[0x263F5BD40];
  id v9 = NPKAnalyticsEventForProvisioningFlowClientInput(@"chooseIssuerVerificationChannel", v10);
  [v8 subject:@"provisioning" sendEvent:v9];

  [(NPKPaymentProvisioningFlowController *)self _updateVerificationForPass:self->_issuerVerificationPass channel:v7 context:v6];
}

- (void)handleIssuerVerificationFields:(id)a3 requestContext:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F5BD40];
  id v9 = NPKAnalyticsEventForProvisioningFlowClientInput(@"issuerVerificationFields", 0);
  [v8 subject:@"provisioning" sendEvent:v9];

  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFields];
      *(_DWORD *)buf = 138412546;
      id v30 = v6;
      __int16 v31 = 2112;
      uint64_t v32 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling issuer verification fields: %@ with fields model fields: %@", buf, 0x16u);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        int v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        fieldsModel = self->_fieldsModel;
        uint64_t v21 = objc_msgSend(v19, "identifier", (void)v24);
        uint64_t v22 = [(PKPaymentSetupFieldsModel *)fieldsModel paymentSetupFieldWithIdentifier:v21];

        uint64_t v23 = [v19 currentValue];
        [v22 setCurrentValue:v23];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  [(NPKPaymentProvisioningFlowController *)self _handleVerificationFieldsForPass:self->_issuerVerificationPass context:v7];
}

- (void)handleIssuerVerificationCode:(id)a3 requestContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F5BD40];
  id v9 = NPKAnalyticsEventForProvisioningFlowClientInput(@"issuerVerificationCode", 0);
  [v8 subject:@"provisioning" sendEvent:v9];

  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      uint64_t v14 = [v6 length];
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling issuer verification code of length %lu", (uint8_t *)&v13, 0xCu);
    }
  }
  [(NPKPaymentProvisioningFlowController *)self _handleVerificationCode:v6 forPass:self->_issuerVerificationPass context:v7];
}

- (void)skipIssuerVerification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F5BD40];
  id v6 = NPKAnalyticsEventForProvisioningFlowClientInput(@"skipIssuerVerification", 0);
  [v5 subject:@"provisioning" sendEvent:v6];

  if ((self->_currentStep - 230) > 0x14 || ((1 << (LOBYTE(self->_currentStep) + 26)) & 0x100401) == 0)
  {
    id v8 = pk_Payment_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v11 = 0;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: Not on an issuer verification step; cannot skip issuer verification!",
          v11,
          2u);
      }
    }
  }
  else
  {
    [(NPKPaymentProvisioningFlowController *)self _handleEndOfProvisioningFlowForCurrentPass:self->_issuerVerificationPass requestContext:v4];
  }
}

- (void)startInAppProvisioningFlowWithConfiguration:(id)a3 requestContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = (void *)MEMORY[0x263F5BD40];
  id v10 = NPKAnalyticsEventForProvisioningFlowClientInput(@"startInAppProvisioningFlow", 0);
  [v9 subject:@"provisioning" sendEvent:v10];

  int currentStep = self->_currentStep;
  BOOL v12 = pk_Payment_log();
  int v13 = v12;
  if (currentStep == 100)
  {
    BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      uint64_t v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v7;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: starting in-app provisioning flow with configuration %@", (uint8_t *)&v18, 0xCu);
      }
    }
    objc_storeStrong((id *)&self->_inAppProvisioningRequestConfiguration, a3);
    [(NPKPaymentProvisioningFlowController *)self _handleProvisioningFlowStarted:v8];
  }
  else
  {
    BOOL v16 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      uint64_t v17 = pk_Payment_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_ERROR, "Error: Past initialization step; cannot start issuer verification flow!",
          (uint8_t *)&v18,
          2u);
      }
    }
  }
}

- (void)handleIssuerApplicationAddRequest:(id)a3 requestContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = (void *)MEMORY[0x263F5BD40];
  id v10 = NPKAnalyticsEventForProvisioningFlowClientInput(@"issuerApplicationAddRequest", 0);
  [v9 subject:@"provisioning" sendEvent:v10];

  BOOL v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    int v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling issuer add request %@", (uint8_t *)&v20, 0xCu);
    }
  }
  if (self->_currentStep == 300)
  {
    if (v7)
    {
      inAppProvisioningGetRequestTimer = self->_inAppProvisioningGetRequestTimer;
      if (inAppProvisioningGetRequestTimer)
      {
        dispatch_source_cancel(inAppProvisioningGetRequestTimer);
        uint64_t v15 = self->_inAppProvisioningGetRequestTimer;
        self->_inAppProvisioningGetRequestTimer = 0;
      }
      objc_storeStrong((id *)&self->_inAppProvisioningRequest, a3);
      [v7 setPublicKeyHash:self->_inAppProvisioningPublicKeyHash];
      [v7 setNonce:self->_inAppProvisioningNonce];
      [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v8];
    }
    else
    {
      id v19 = PKDisplayableErrorForCommonType();
      [(NPKPaymentProvisioningFlowController *)self _endProvisioningFlowWithError:v19 requestContext:v8];
    }
  }
  else
  {
    BOOL v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      int v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_ERROR, "Error: Not on get issuer add request step; cannot handle request!",
          (uint8_t *)&v20,
          2u);
      }
    }
  }
}

- (void)_performRequirementsOrEligibilityForInAppProvisioning:(id)a3
{
  if (self->_inAppProvisioningRequest) {
    [(NPKPaymentProvisioningFlowController *)self _performEligibility:a3];
  }
  else {
    [(NPKPaymentProvisioningFlowController *)self _fetchInAppProvisioningCertificates:a3];
  }
}

- (void)_fetchInAppProvisioningCertificates:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F5C030]);
  id v6 = [(PKAddPaymentPassRequestConfiguration *)self->_inAppProvisioningRequestConfiguration encryptionScheme];
  id v7 = (void *)[v5 initWithEncryptionScheme:v6];

  webService = self->_webService;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke;
  v10[3] = &unk_2644D3C08;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(PKPaymentWebService *)webService issuerProvisioningCertificatesForRequest:v7 withCompletion:v10];
}

void __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_2;
  v11[3] = &unk_2644D3BE0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    id v4 = *(void **)(v3 + 104);
    id v5 = [v2 nonce];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_3;
    v16[3] = &unk_2644D3BB8;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v17 = v6;
    uint64_t v18 = v7;
    id v19 = v8;
    id v20 = *(id *)(a1 + 56);
    [v4 signNonce:v5 withCompletion:v16];

    id v9 = v17;
  }
  else
  {
    id v10 = [*(id *)(v3 + 24) displayableErrorForProvisioningError:*(void *)(a1 + 56)];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v12;

    uint64_t v13 = pk_Payment_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      id v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v9;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response from issuer provisioning certificates endpoint: %@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 40) _sendDidEncounterError:v9 requestContext:*(void *)(a1 + 48)];
  }
}

void __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_4;
  block[3] = &unk_2644D3B90;
  id v9 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setNonceSignature:");
    uint64_t v3 = *(void *)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    [v2 _fetchAddRequestWithCertificatesResponse:v3 requestContext:v4];
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 48) + 24) displayableErrorForProvisioningError:*(void *)(a1 + 64)];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = v7;

    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      uint64_t v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response from issuer provisioning certificates endpoint: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    [*(id *)(a1 + 48) _sendDidEncounterError:v8 requestContext:*(void *)(a1 + 56)];
  }
}

- (void)_fetchAddRequestWithCertificatesResponse:(id)a3 requestContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  inAppProvisioningGetRequestTimer = self->_inAppProvisioningGetRequestTimer;
  if (inAppProvisioningGetRequestTimer)
  {
    dispatch_source_cancel(inAppProvisioningGetRequestTimer);
    id v9 = self->_inAppProvisioningGetRequestTimer;
    self->_inAppProvisioningGetRequestTimer = 0;
  }
  BOOL v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  uint64_t v11 = self->_inAppProvisioningGetRequestTimer;
  self->_inAppProvisioningGetRequestTimer = v10;

  int v12 = self->_inAppProvisioningGetRequestTimer;
  dispatch_time_t v13 = dispatch_time(0, 20000000000);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  uint64_t v14 = self->_inAppProvisioningGetRequestTimer;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  long long v26 = __96__NPKPaymentProvisioningFlowController__fetchAddRequestWithCertificatesResponse_requestContext___block_invoke;
  long long v27 = &unk_2644D2E08;
  uint64_t v28 = self;
  id v29 = v7;
  id v15 = v7;
  dispatch_source_set_event_handler(v14, &v24);
  dispatch_resume((dispatch_object_t)self->_inAppProvisioningGetRequestTimer);
  objc_msgSend(v6, "publicKeyHash", v24, v25, v26, v27, v28);
  BOOL v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  inAppProvisioningPublicKeyHash = self->_inAppProvisioningPublicKeyHash;
  self->_inAppProvisioningPublicKeyHash = v16;

  uint64_t v18 = [v6 nonce];
  inAppProvisioningNonce = self->_inAppProvisioningNonce;
  self->_inAppProvisioningNonce = v18;

  id v20 = [[NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext alloc] initWithRequestContext:v15];
  id v21 = [v6 certificates];
  [(NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext *)v20 setCertificates:v21];

  uint64_t v22 = [v6 nonce];
  [(NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext *)v20 setNonce:v22];

  uint64_t v23 = [v6 nonceSignature];
  [(NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext *)v20 setNonceSignature:v23];

  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:300 withContext:v20];
}

uint64_t __96__NPKPaymentProvisioningFlowController__fetchAddRequestWithCertificatesResponse_requestContext___block_invoke(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    uint64_t v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: In-app provisioning timed out waiting for response from client", v8, 2u);
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = PKDisplayableErrorForCommonType();
  [v5 _endProvisioningFlowWithError:v6 requestContext:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 32) reset];
}

- (void)_handleProvisioningFlowStarted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[NPKPaymentProvisioningFlowControllerPreconditionsStepContext alloc] initWithRequestContext:v4];
  objc_storeStrong((id *)&self->_preconditionsRequestContext, v5);
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:110 withContext:v5];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  webService = self->_webService;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke;
  v10[3] = &unk_2644D3CD0;
  v10[4] = self;
  id v11 = v4;
  int v12 = v5;
  uint64_t v13 = v7;
  id v8 = v5;
  id v9 = v4;
  [(NPKPaymentProvisioningFlowController *)self _configureWebServiceIfNecessary:webService completion:v10];
}

void __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_2;
    v24[3] = &unk_2644D3C30;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    long long v27 = v28;
    void v24[4] = v6;
    id v25 = v7;
    id v26 = *(id *)(a1 + 48);
    id v8 = (void *)MEMORY[0x223C37380](v24);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_3;
    v20[3] = &unk_2644D3C58;
    uint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = *(void **)(a1 + 40);
    uint64_t v23 = v28;
    v20[4] = v9;
    id v21 = v10;
    id v22 = *(id *)(a1 + 48);
    id v11 = (void *)MEMORY[0x223C37380](v20);
    int v12 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_4;
    v16[3] = &unk_2644D3CA8;
    void v16[4] = v12;
    id v13 = v8;
    id v17 = v13;
    uint64_t v19 = *(void *)(a1 + 56);
    id v14 = v11;
    id v18 = v14;
    [v12 _verifyPasscodeStateIfNecessaryWithCompletion:v16];

    _Block_object_dispose(v28, 8);
  }
  else
  {
    id v15 = PKDisplayableErrorForCommonType();
    [*(id *)(a1 + 32) _endProvisioningFlowWithError:v15 requestContext:*(void *)(a1 + 40)];
  }
}

void __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      [*(id *)(a1 + 32) _handlePreconditionsVerified:*(void *)(a1 + 40)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    [*(id *)(a1 + 48) setPreconditionsState:2];
    [*(id *)(a1 + 32) _performTransitionToStep:110 withContext:*(void *)(a1 + 48)];
  }
  else
  {
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v7 = v6;
    [*(id *)(a1 + 32) _endProvisioningFlowWithError:v6 requestContext:*(void *)(a1 + 40)];
  }
}

uint64_t __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [*(id *)(a1 + 32) _handlePreconditionsVerified:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  [*(id *)(a1 + 48) setPreconditionsState:1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _performTransitionToStep:110 withContext:v3];
}

void __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 24);
    if (*(void *)(v6 + 56))
    {
      [*(id *)(v6 + 24) validatePreconditionsAndRegister:*(void *)(a1 + 40)];
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_5;
      v8[3] = &unk_2644D3C80;
      v8[4] = v6;
      id v9 = *(id *)(a1 + 40);
      uint64_t v11 = 45;
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = 13;
      id v10 = *(id *)(a1 + 48);
      [v7 preflightWithRequirements:45 update:v8];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v5)
  {
    if ([v5 code] != 5
      || ([*(id *)(*(void *)(a1 + 32) + 24) webService],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 paymentSetupSupportedInRegion],
          v6,
          v7 != 1))
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_11:
      v8();
      goto LABEL_12;
    }
LABEL_10:
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_11;
  }
  if ((*(void *)(a1 + 56) & ~a2) == 0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v10 = v9;
    double v11 = *(double *)(a1 + 64);
    uint64_t v12 = pk_Payment_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      id v14 = pk_Payment_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315394;
        id v22 = "-[NPKPaymentProvisioningFlowController _handleProvisioningFlowStarted:]_block_invoke_5";
        __int16 v23 = 2048;
        double v24 = v10 - v11;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: %s: time taken to all requirements = %fs", (uint8_t *)&v21, 0x16u);
      }
    }
    goto LABEL_10;
  }
  if ((*(void *)(a1 + 72) & ~a2) == 0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v16 = v15;
    double v17 = *(double *)(a1 + 64);
    id v18 = pk_Payment_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      id v20 = pk_Payment_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315394;
        id v22 = "-[NPKPaymentProvisioningFlowController _handleProvisioningFlowStarted:]_block_invoke";
        __int16 v23 = 2048;
        double v24 = v16 - v17;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: %s: time taken to min requirements = %fs", (uint8_t *)&v21, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_12:
}

- (void)_handlePreconditionsVerified:(id)a3
{
  id v4 = a3;
  id v5 = [[NPKPaymentProvisioningFlowControllerWelcomeStepContext alloc] initWithRequestContext:v4];

  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:120 withContext:v5];
}

- (void)_handleProductChosen:(id)a3 includeCardsOnFile:(BOOL)a4 requestContext:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  double v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Product chosen: %@", buf, 0xCu);
    }
  }
  BOOL v13 = !NPKPaymentProvisioningSetupContextIsSetupAssistant(self->_setupContext);
  provisioningController = self->_provisioningController;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __95__NPKPaymentProvisioningFlowController__handleProductChosen_includeCardsOnFile_requestContext___block_invoke;
  v17[3] = &unk_2644D3CF8;
  v17[4] = self;
  id v18 = v8;
  BOOL v20 = a4;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [(PKPaymentProvisioningController *)provisioningController setupProductForProvisioning:v16 includePurchases:v13 withCompletionHandler:v17];
}

void __95__NPKPaymentProvisioningFlowController__handleProductChosen_includeCardsOnFile_requestContext___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(a1 + 40));
    if (*(unsigned char *)(a1 + 56)) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    [*(id *)(a1 + 32) _transitionBasedOnCredentials:v9 product:*(void *)(a1 + 40) requestContext:*(void *)(a1 + 48)];
  }
  else
  {
    double v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      uint64_t v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v7;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when setting up product for provisioning: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    [*(id *)(a1 + 32) _sendDidEncounterError:v7 requestContext:*(void *)(a1 + 48)];
  }
}

- (void)_handleAppleBalanceProductChosen:(id)a3 requestContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    BOOL v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Apple Balance product chosen. Requesting resolve local eligibility with product: %@", buf, 0xCu);
    }
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F5BD58]) initWithProduct:v7 eligibilitySource:1];
  [(NPKPaymentProvisioningFlowController *)self setCurrentAppleBalanceCredential:v12];

  objc_storeStrong((id *)&self->_currentProduct, a3);
  int v13 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
  id v14 = [(NPKPaymentProvisioningFlowController *)self currentAppleBalanceCredential];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke;
  v17[3] = &unk_2644D3D20;
  v17[4] = self;
  id v18 = v8;
  id v19 = v7;
  id v15 = v7;
  id v16 = v8;
  [v13 resolveLocalEligibilityRequirementsForAppleBalanceCredential:v14 withCompletion:v17];
}

void __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    uint64_t v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEBUG, "Debug: Standalone: Apple Balance. Local eligibility resolved. Error: %@", buf, 0xCu);
    }
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_97;
  v18[3] = &unk_2644D3D20;
  id v7 = *(void **)(a1 + 40);
  void v18[4] = *(void *)(a1 + 32);
  id v19 = v7;
  id v20 = *(id *)(a1 + 48);
  uint64_t v8 = MEMORY[0x223C37380](v18);
  id v9 = (void *)v8;
  if (v3)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
  else
  {
    BOOL v10 = (void *)[*(id *)(a1 + 32) _newPaymentEligibilityRequest];
    BOOL v11 = pk_Payment_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      int v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Apple Balance. Requesting eligibility", buf, 2u);
      }
    }
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 24);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_99;
    v16[3] = &unk_2644D3D48;
    void v16[4] = v14;
    id v17 = v9;
    [v15 requestEligibility:v10 withCompletionHandler:v16];
  }
}

void __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_97(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_2;
  v7[3] = &unk_2644D3BE0;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  NPKGuaranteeMainThread(v7);
}

uint64_t __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3) {
    return [v2 _sendDidEncounterError:v3 requestContext:a1[6]];
  }
  else {
    return [v2 _transitionToAppleBalanceAccountDetailsWithProduct:a1[7] requestContext:a1[6]];
  }
}

void __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Apple Balance. Eligibility resolved. Error: %@", buf, 0xCu);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 176) setEligibilityResponse:v6];
  [v6 eligibilityStatus];

  id v10 = PKProvisioningErrorForAppleBalanceEligibilityStatus();
  if (v10)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v11 = [MEMORY[0x263F5BCE8] sharedInstance];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_101;
    v12[3] = &unk_2644D28C0;
    id v13 = *(id *)(a1 + 40);
    [v11 validateAppleBalanceSecurityRequirementsWithCompletion:v12];
  }
}

void __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_101(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v7 = pk_Payment_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      uint64_t v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: Standalone: Apple Balance security requirements not met. Could not verify/setup Apple Pay cloud store container. Error: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    id v10 = PKLocalizedPaymentString(&cfstr_CouldNotSetUpT.isa);
    id v11 = PKLocalizedPaymentString(&cfstr_CouldNotSetUpM.isa);
    id v6 = PKDisplayableErrorCustom();
  }
  else
  {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleAppleBalanceAccountDetailsAcknowledgedWithProduct:(id)a3 requestContext:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Apple Balance. Acknowledged account details with product: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v7];
}

- (void)_handleProceedWithCredentials:(id)a3 chosenByUser:(BOOL)a4 requestContext:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Credentials chosen: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  if (v6)
  {
    uint64_t v13 = [(PKPaymentProvisioningController *)self->_provisioningController credentialProvisioningQueue];
    [v13 setCredentialsToProvision:v8];
    uint64_t v14 = [v13 nextCredentialToProvision];
  }
  else
  {
    if ((unint64_t)[v8 count] >= 2)
    {
      id v15 = pk_Payment_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        id v17 = pk_Payment_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_ERROR, "Error: >1 credentials when not chosen by user!", (uint8_t *)&v18, 2u);
        }
      }
    }
    uint64_t v14 = [v8 firstObject];
  }
  [(NPKPaymentProvisioningFlowController *)self _startProvisioningForCredential:v14 requestContext:v9];
}

- (void)_startProvisioningForCredential:(id)a3 requestContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_currentCredential, a3);
  id v9 = objc_alloc(MEMORY[0x263F5C0C8]);
  id v10 = (PKPaymentSetupFieldsModel *)[v9 initWithPaymentSetupFields:MEMORY[0x263EFFA68]];
  fieldsModel = self->_fieldsModel;
  self->_fieldsModel = v10;

  if ([v7 isAccountCredential])
  {
    id v12 = [v7 accountCredential];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __87__NPKPaymentProvisioningFlowController__startProvisioningForCredential_requestContext___block_invoke;
    v14[3] = &unk_2644D3D70;
    id v15 = v12;
    BOOL v16 = self;
    id v17 = v8;
    id v13 = v12;
    [(NPKPaymentProvisioningFlowController *)self _requestPassDetailsForAccountCredential:v13 withCompletionHandler:v14];
  }
  else
  {
    [(NPKPaymentProvisioningFlowController *)self _requestRequirements:v8];
  }
}

void __87__NPKPaymentProvisioningFlowController__startProvisioningForCredential_requestContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "_sendDidEncounterError:requestContext:");
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) passDetailsResponse];
    uint64_t v6 = [v5 status];

    if (v6 == 1)
    {
      id v7 = [*(id *)(a1 + 32) account];
      id v9 = [v7 creditDetails];

      if (v9 && ([v9 termsAcceptanceRequired] & 1) == 0) {
        [*(id *)(a1 + 40) setTermsAcceptedOutOfBand:1];
      }
      [*(id *)(a1 + 40) _requestRequirements:*(void *)(a1 + 48)];
    }
    else
    {
      id v8 = *(void **)(a1 + 40);
      PKDisplayableErrorForCommonType();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      [v8 _sendDidEncounterError:v9 requestContext:*(void *)(a1 + 48)];
    }
  }
}

- (void)_performNextActionForProvisioningState:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PKPaymentProvisioningController *)self->_provisioningController state];
  uint64_t v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      uint64_t v19 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: current State is %ld", (uint8_t *)&v18, 0xCu);
    }
  }
  [(NPKPaymentProvisioningFlowController *)self _noteProvisioningStateChangeForReaderMode:v5];
  switch(v5)
  {
    case 0:
      if (self->_inAppProvisioningRequestConfiguration) {
        goto LABEL_13;
      }
      [(NPKPaymentProvisioningFlowController *)self _requestRequirements:v4];
      break;
    case 1:
      if (self->_inAppProvisioningRequestConfiguration) {
LABEL_13:
      }
        [(NPKPaymentProvisioningFlowController *)self _performRequirementsOrEligibilityForInAppProvisioning:v4];
      else {
        [(NPKPaymentProvisioningFlowController *)self _performEligibility:v4];
      }
      break;
    case 2:
      if ([(NPKPaymentProvisioningFlowController *)self _isPasscodeUpgradeRequired])
      {
        [(NPKPaymentProvisioningFlowController *)self _performPasscodeUpgrade:v4];
      }
      else
      {
        id v15 = pk_Payment_log();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

        if (v16)
        {
          id v17 = pk_Payment_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Skipping passcode upgrade", (uint8_t *)&v18, 2u);
          }
        }
        [(NPKPaymentProvisioningFlowController *)self _handlePasscodeUpgradeCompleteWithSuccess:1 error:0 requestContext:v4];
      }
      break;
    case 3:
      [(NPKPaymentProvisioningFlowController *)self _performTerms:v4];
      break;
    case 4:
      [(NPKPaymentProvisioningFlowController *)self _performProvision:v4];
      break;
    case 5:
      [(NPKPaymentProvisioningFlowController *)self _handleFinished:v4];
      break;
    default:
      id v9 = pk_Payment_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        BOOL v11 = pk_Payment_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = (objc_class *)objc_opt_class();
          id v13 = NSStringFromClass(v12);
          uint64_t v14 = PKPaymentProvisioningControllerStateToString();
          int v18 = 138543618;
          uint64_t v19 = (uint64_t)v13;
          __int16 v20 = 2114;
          id v21 = v14;
          _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: Error: %{public}@ does not know how to handle provisioning state : %{public}@.", (uint8_t *)&v18, 0x16u);
        }
      }
      break;
  }
}

- (id)_newPaymentRequirementsRequest
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_currentCredential)
  {
    uint64_t v3 = pk_Payment_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      uint64_t v5 = pk_Payment_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        currentCredential = self->_currentCredential;
        int v22 = 138412290;
        uint64_t v23 = currentCredential;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment requirements request from current credential %@", (uint8_t *)&v22, 0xCu);
      }
    }
    id v7 = objc_alloc(MEMORY[0x263F5C0A0]);
    id v8 = self->_currentCredential;
    return (id)[v7 initWithPaymentCredential:v8];
  }
  currentAppleBalanceCredential = self->_currentAppleBalanceCredential;
  BOOL v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (currentAppleBalanceCredential)
  {
    if (v11)
    {
      id v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = self->_currentAppleBalanceCredential;
        int v22 = 138412290;
        uint64_t v23 = v13;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment requirements request from current Apple Balance credential %@", (uint8_t *)&v22, 0xCu);
      }
    }
    id v7 = objc_alloc(MEMORY[0x263F5C0A0]);
    id v8 = self->_currentAppleBalanceCredential;
    return (id)[v7 initWithPaymentCredential:v8];
  }
  if (v11)
  {
    BOOL v16 = pk_Payment_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment requirements request from fields model", (uint8_t *)&v22, 2u);
    }
  }
  id v17 = objc_alloc(MEMORY[0x263F5C0A0]);
  int v18 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:*MEMORY[0x263F5C798]];
  uint64_t v19 = [v18 submissionString];
  __int16 v20 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:*MEMORY[0x263F5C7A0]];
  id v21 = [v20 submissionString];
  uint64_t v14 = (void *)[v17 initWithCardholderName:v19 primaryAccountNumber:v21];

  return v14;
}

- (id)_newPaymentEligibilityRequest
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (self->_inAppProvisioningRequest)
  {
    uint64_t v3 = pk_Payment_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      uint64_t v5 = pk_Payment_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        inAppProvisioningRequest = self->_inAppProvisioningRequest;
        int v47 = 138412290;
        id v48 = inAppProvisioningRequest;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment eligibility request from in-app provisioning request %@", (uint8_t *)&v47, 0xCu);
      }
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x263F5C010]) initWithSource:2];
    id v8 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest encryptionVersion];
    [v7 setEncryptionVersion:v8];

    id v9 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest encryptedPassData];
    [v7 setEncryptedCardData:v9];

    BOOL v10 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest publicKeyHash];
    [v7 setPublicKeyHash:v10];

    BOOL v11 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest ephemeralPublicKey];
    [v7 setEphemeralPublicKey:v11];

    id v12 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest wrappedKey];
    [v7 setWrappedKey:v12];

    id v13 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest issuerIdentifier];
    [v7 setIssuerIdentifier:v13];

    uint64_t v14 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest hostApplicationIdentifier];
    [v7 setHostApplicationIdentifier:v14];

    id v15 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest hostApplicationVersion];
    [v7 setHostApplicationVersion:v15];

    BOOL v16 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest FPInfo];
    [v7 setFPInfo:v16];

    id v17 = [(PKAddPaymentPassRequest *)self->_inAppProvisioningRequest nonce];
    int v18 = [v17 hexEncoding];
    [v7 setNonce:v18];

    return v7;
  }
  if (self->_currentCredential)
  {
    uint64_t v19 = pk_Payment_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      id v21 = pk_Payment_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        currentCredential = self->_currentCredential;
        int v47 = 138412290;
        id v48 = currentCredential;
        _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment eligibility request from current credential %@", (uint8_t *)&v47, 0xCu);
      }
    }
    id v23 = objc_alloc(MEMORY[0x263F5C010]);
    uint64_t v24 = self->_currentCredential;
    return (id)[v23 initWithPaymentCredential:v24];
  }
  currentAppleBalanceCredential = self->_currentAppleBalanceCredential;
  id v26 = pk_Payment_log();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

  if (currentAppleBalanceCredential)
  {
    if (v27)
    {
      uint64_t v28 = pk_Payment_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        char v29 = self->_currentAppleBalanceCredential;
        int v47 = 138412290;
        id v48 = v29;
        _os_log_impl(&dword_21E92F000, v28, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment eligibility request from current Apple Balance credential %@", (uint8_t *)&v47, 0xCu);
      }
    }
    id v23 = objc_alloc(MEMORY[0x263F5C010]);
    uint64_t v24 = self->_currentAppleBalanceCredential;
    return (id)[v23 initWithPaymentCredential:v24];
  }
  if (v27)
  {
    __int16 v31 = pk_Payment_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_21E92F000, v31, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment eligibility request from fields model", (uint8_t *)&v47, 2u);
    }
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F5C010]) initWithSource:1];
  uint64_t v32 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:*MEMORY[0x263F5C798]];
  uint64_t v33 = [v32 submissionString];
  [v7 setCardholderName:v33];

  if ([v32 source] == 1) {
    uint64_t v34 = 2;
  }
  else {
    uint64_t v34 = 1;
  }
  [v7 setCardholderNameInputMethod:v34];
  __int16 v35 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:*MEMORY[0x263F5C7A0]];
  uint64_t v36 = [v35 submissionString];
  [v7 setPrimaryAccountNumber:v36];

  if ([v35 source] == 1) {
    uint64_t v37 = 2;
  }
  else {
    uint64_t v37 = 1;
  }
  [v7 setPrimaryAccountNumberInputMethod:v37];
  id v38 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:*MEMORY[0x263F5C780]];
  v39 = [v38 submissionString];
  [v7 setExpiration:v39];

  if ([v38 source] == 1) {
    uint64_t v40 = 2;
  }
  else {
    uint64_t v40 = 1;
  }
  [v7 setExpirationInputMethod:v40];
  v41 = [(PKPaymentProvisioningController *)self->_provisioningController productIdentifier];
  [v7 setProductIdentifier:v41];

  v42 = [(NPKPaymentProvisioningFlowController *)self fieldsModel];
  uint64_t v43 = *MEMORY[0x263F5C7B0];
  uint64_t v44 = [v42 submissionValuesForDestination:*MEMORY[0x263F5C7B0]];

  [v7 setOverlayParameters:v44];
  uint64_t v45 = [(NPKPaymentProvisioningFlowController *)self fieldsModel];
  uint64_t v46 = [v45 secureSubmissionValuesForDestination:v43];

  [v7 setSecureOverlayParameters:v46];
  return v7;
}

- (id)_newPaymentProvisioningRequest
{
  id v3 = objc_alloc(MEMORY[0x263F5C050]);
  BOOL v4 = [(PKPaymentProvisioningController *)self->_provisioningController eligibilityResponse];
  uint64_t v5 = (void *)[v3 initWithEligibilityResponse:v4];

  inAppProvisioningRequest = self->_inAppProvisioningRequest;
  if (inAppProvisioningRequest)
  {
    id v7 = [(PKAddPaymentPassRequest *)inAppProvisioningRequest activationData];
    [v5 setActivationData:v7];

    if ([(PKAddPaymentPassRequestConfiguration *)self->_inAppProvisioningRequestConfiguration style] == PKAddPaymentPassStyleAccess) {
      [v5 setStyle:1];
    }
  }
  else
  {
    id v8 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
    id v9 = [v8 eligibilityResponse];
    [v5 setEligibilityResponse:v9];

    BOOL v10 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:*MEMORY[0x263F5C790]];
    BOOL v11 = [v10 submissionString];
    [v5 setCardSecurityCode:v11];

    id v12 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFieldWithIdentifier:*MEMORY[0x263F5C798]];
    id v13 = [v12 submissionString];
    [v5 setCardholderName:v13];

    uint64_t v14 = [(NPKPaymentProvisioningFlowController *)self fieldsModel];
    uint64_t v15 = *MEMORY[0x263F5C7B8];
    BOOL v16 = [v14 submissionValuesForDestination:*MEMORY[0x263F5C7B8]];

    [v5 setOverlayParameters:v16];
    id v17 = [(NPKPaymentProvisioningFlowController *)self fieldsModel];
    int v18 = [v17 secureSubmissionValuesForDestination:v15];

    [v5 setSecureOverlayParameters:v18];
  }
  return v5;
}

- (void)_requestRequirements:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PKPaymentProvisioningController *)self->_provisioningController resetForNewProvisioning];
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: performing requirements", buf, 2u);
    }
  }
  currentCredential = self->_currentCredential;
  if (currentCredential
    && [(PKPaymentCredential *)currentCredential isPurchasedProductCredential])
  {
    id v9 = [(PKPaymentCredential *)self->_currentCredential purchasedProductCredential];
    BOOL v10 = self->_provisioningController;
    BOOL v11 = [v9 product];
    id v12 = [v11 provisioningMethodMetadataForType:*MEMORY[0x263F5C738]];
    [(PKPaymentProvisioningController *)v10 resolveRequirementsUsingProvisioningMethodMetadata:v12];

    id v13 = [(PKPaymentProvisioningController *)v10 requirementsResponse];
    [v9 setRequirementsResponse:v13];

    [(NPKPaymentProvisioningFlowController *)self setTermsAcceptedOutOfBand:1];
    uint64_t v14 = pk_Payment_log();
    LODWORD(v12) = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      uint64_t v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = [v9 product];
        id v17 = [v16 displayName];
        int v18 = [v9 summaryMetadataDescription];
        *(_DWORD *)buf = 138412546;
        id v23 = v17;
        __int16 v24 = 2112;
        uint64_t v25 = v18;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Moving directly to next provisioning step for purchased product %@ (%@).", buf, 0x16u);
      }
    }
    [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v4];
  }
  else
  {
    id v9 = [(NPKPaymentProvisioningFlowController *)self _newPaymentRequirementsRequest];
    provisioningController = self->_provisioningController;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__NPKPaymentProvisioningFlowController__requestRequirements___block_invoke;
    v20[3] = &unk_2644D3D98;
    v20[4] = self;
    id v21 = v4;
    [(PKPaymentProvisioningController *)provisioningController requestRequirements:v9 withCompletionHandler:v20];
  }
}

void __61__NPKPaymentProvisioningFlowController__requestRequirements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v12 = pk_Payment_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      if (v13)
      {
        uint64_t v14 = pk_Payment_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 138412290;
          uint64_t v38 = (uint64_t)v6;
          _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when sending requirements request: %@", (uint8_t *)&v37, 0xCu);
        }
      }
      uint64_t v15 = *(id **)(a1 + 32);
      uint64_t v16 = [v15[3] displayableErrorForProvisioningError:v6];
    }
    else
    {
      if (v13)
      {
        uint64_t v25 = pk_Payment_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v37) = 0;
          _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response or error from requirements!", (uint8_t *)&v37, 2u);
        }
      }
      uint64_t v15 = *(id **)(a1 + 32);
      uint64_t v16 = PKDisplayableErrorForCommonType();
    }
    BOOL v11 = (void *)v16;
    [v15 _sendDidEncounterError:v16 requestContext:*(void *)(a1 + 40)];
    goto LABEL_28;
  }
  if ([v5 status] == 2 || PKForcePrivateLabelSetupDisambiguation())
  {
    id v7 = pk_Payment_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      id v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: PKPaymentRequirementsStatusRequirementsAmbiguous is responded by server", (uint8_t *)&v37, 2u);
      }
    }
    BOOL v10 = [*(id *)(*(void *)(a1 + 32) + 24) requirementsResponse];
    BOOL v11 = [v10 possibleProducts];

    [*(id *)(a1 + 32) _transitionToProductDisambiguationWithProducts:v11 requestContext:*(void *)(a1 + 40)];
LABEL_28:

    goto LABEL_29;
  }
  if ([v5 status] == 1)
  {
    id v17 = *(void **)(*(void *)(a1 + 32) + 136);
    int v18 = [v5 requiredPaymentSetupFields];
    [v17 updateWithPaymentSetupFields:v18];

    if ([*(id *)(*(void *)(a1 + 32) + 136) hasIncompletePaymentSetupFields])
    {
      uint64_t v19 = [v5 requiredPaymentSetupFields];
      uint64_t v20 = [v19 count];

      id v21 = pk_Payment_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        id v23 = pk_Payment_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 134217984;
          uint64_t v38 = v20;
          _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Start secondary manual entry with %lu fields.", (uint8_t *)&v37, 0xCu);
        }
      }
      __int16 v24 = *(void **)(a1 + 32);
      BOOL v11 = [v5 requiredPaymentSetupFields];
      [v24 _transitionToSecondaryManualEntryWithFields:v11 credential:*(void *)(*(void *)(a1 + 32) + 168) requestContext:*(void *)(a1 + 40)];
      goto LABEL_28;
    }
    uint64_t v33 = pk_Payment_log();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

    if (v34)
    {
      __int16 v35 = pk_Payment_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = [*(id *)(*(void *)(a1 + 32) + 136) paymentSetupFields];
        int v37 = 138412290;
        uint64_t v38 = (uint64_t)v36;
        _os_log_impl(&dword_21E92F000, v35, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Moving directly to next provisioning step since all fields are complete (%@).", (uint8_t *)&v37, 0xCu);
      }
    }
    [*(id *)(a1 + 32) _performNextActionForProvisioningState:*(void *)(a1 + 40)];
  }
  else if (![v5 status] || objc_msgSend(v5, "status") == 3)
  {
    uint64_t v26 = pk_Payment_log();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

    if (v27)
    {
      uint64_t v28 = pk_Payment_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_21E92F000, v28, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: PKPaymentRequirementsStatusUnknownRequirements or PKPaymentRequirementsStatusCardNotSupported is responded by server", (uint8_t *)&v37, 2u);
      }
    }
    char v29 = objc_opt_class();
    BOOL v30 = NPKPaymentCardIneligibleReasonForRequirementsStatus([v5 status]);
    __int16 v31 = [v5 learnMoreURL];
    uint64_t v32 = [v29 _displayableErrorWithIneligibilityReason:v30 learnMoreURL:v31];

    [*(id *)(a1 + 32) _sendDidEncounterError:v32 requestContext:*(void *)(a1 + 40)];
  }
LABEL_29:
}

- (void)_performEligibility:(id)a3
{
  id v4 = a3;
  if ([(NPKPaymentProvisioningFlowController *)self _isResolveLocalEligibilityRequired])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__NPKPaymentProvisioningFlowController__performEligibility___block_invoke;
    v5[3] = &unk_2644D3DC0;
    v5[4] = self;
    id v6 = v4;
    [(NPKPaymentProvisioningFlowController *)self _performResolveLocalEligibilityARequirements:v6 completion:v5];
  }
  else
  {
    [(NPKPaymentProvisioningFlowController *)self _performProvisioningEligibility:v4];
  }
}

void __60__NPKPaymentProvisioningFlowController__performEligibility___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__NPKPaymentProvisioningFlowController__performEligibility___block_invoke_2;
  v7[3] = &unk_2644D31B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  NPKGuaranteeMainThread(v7);
}

uint64_t __60__NPKPaymentProvisioningFlowController__performEligibility___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3) {
    return [v2 _sendDidEncounterError:v3 requestContext:a1[6]];
  }
  else {
    return [v2 _performProvisioningEligibility:a1[6]];
  }
}

- (void)_performProvisioningEligibility:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: performing provisioning eligibility", buf, 2u);
    }
  }
  id v8 = [(NPKPaymentProvisioningFlowController *)self _newPaymentEligibilityRequest];
  provisioningController = self->_provisioningController;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke;
  v11[3] = &unk_2644D3DE8;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(PKPaymentProvisioningController *)provisioningController requestEligibility:v8 withCompletionHandler:v11];
}

void __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_2;
  v11[3] = &unk_2644D3BE0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  NPKGuaranteeMainThread(v11);
}

void __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v2 eligibilityStatus] == 1)
    {
      int v3 = [*(id *)(a1 + 40) _isValidateSecurityRequirementsRequired];
      id v5 = *(void **)(a1 + 40);
      id v4 = *(void **)(a1 + 48);
      if (v3)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_3;
        v22[3] = &unk_2644D3DC0;
        v22[4] = v5;
        id v23 = v4;
        [v5 _performValidateSecurityRequirements:v23 completion:v22];
      }
      else
      {
        uint64_t v16 = *(void **)(a1 + 40);
        [v16 _handleEligibiltySuccessWithContext:v4];
      }
    }
    else
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = NPKPaymentCardIneligibleReasonForEligibilityStatus([*(id *)(a1 + 32) eligibilityStatus]);
      id v15 = [*(id *)(a1 + 32) learnMoreURL];
      id v21 = [v13 _displayableErrorWithIneligibilityReason:v14 learnMoreURL:v15];

      [*(id *)(a1 + 40) _sendDidEncounterError:v21 requestContext:*(void *)(a1 + 48)];
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = pk_Payment_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      if (v8)
      {
        id v9 = pk_Payment_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v10;
          _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when sending eligibility request: %@", buf, 0xCu);
        }
      }
      BOOL v11 = *(id **)(a1 + 40);
      uint64_t v12 = [v11[3] displayableErrorForProvisioningError:*(void *)(a1 + 56)];
    }
    else
    {
      if (v8)
      {
        id v17 = pk_Payment_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response or error from requirements!", buf, 2u);
        }
      }
      BOOL v11 = *(id **)(a1 + 40);
      uint64_t v12 = PKDisplayableErrorForCommonType();
    }
    int v18 = (void *)v12;
    [v11 _sendDidEncounterError:v12 requestContext:*(void *)(a1 + 48)];

    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void **)(v19 + 64);
    *(void *)(v19 + 64) = 0;
  }
}

void __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_4;
  v7[3] = &unk_2644D31B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  NPKGuaranteeMainThread(v7);
}

uint64_t __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_4(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3) {
    return [v2 _sendDidEncounterError:v3 requestContext:a1[6]];
  }
  else {
    return [v2 _handleEligibiltySuccessWithContext:a1[6]];
  }
}

- (void)_handleEligibiltySuccessWithContext:(id)a3
{
  id v4 = a3;
  if (PKEnableDynamicSEAllocation())
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__NPKPaymentProvisioningFlowController__handleEligibiltySuccessWithContext___block_invoke;
    v5[3] = &unk_2644D3E38;
    v5[4] = self;
    id v6 = v4;
    [(NPKPaymentProvisioningFlowController *)self _performSEStorageCheck:v5];
  }
  else
  {
    [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v4];
  }
}

void __76__NPKPaymentProvisioningFlowController__handleEligibiltySuccessWithContext___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __76__NPKPaymentProvisioningFlowController__handleEligibiltySuccessWithContext___block_invoke_2;
  v3[3] = &unk_2644D3E10;
  char v5 = a2;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  NPKGuaranteeMainThread(v3);
}

void __76__NPKPaymentProvisioningFlowController__handleEligibiltySuccessWithContext___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 _performNextActionForProvisioningState:v3];
  }
  else
  {
    PKDisplayableErrorForCommonType();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) _sendDidEncounterError:v4 requestContext:*(void *)(a1 + 40)];
  }
}

- (BOOL)_isResolveLocalEligibilityRequired
{
  currentCredential = self->_currentCredential;
  return currentCredential && [(PKPaymentCredential *)currentCredential credentialType] == 135
      || self->_currentAppleBalanceCredential != 0;
}

- (void)_performResolveLocalEligibilityARequirements:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Resolving local eligibility requirements", buf, 2u);
    }
  }
  currentCredential = self->_currentCredential;
  if (!currentCredential) {
    currentCredential = self->_currentAppleBalanceCredential;
  }
  provisioningController = self->_provisioningController;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __96__NPKPaymentProvisioningFlowController__performResolveLocalEligibilityARequirements_completion___block_invoke;
  v13[3] = &unk_2644D2B90;
  id v14 = v5;
  id v11 = v5;
  uint64_t v12 = currentCredential;
  [(PKPaymentProvisioningController *)provisioningController resolveLocalEligibilityRequirementsForAppleBalanceCredential:v12 withCompletion:v13];
}

void __96__NPKPaymentProvisioningFlowController__performResolveLocalEligibilityARequirements_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Local eligibility resolved. Error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (BOOL)_isValidateSecurityRequirementsRequired
{
  currentCredential = self->_currentCredential;
  return currentCredential && [(PKPaymentCredential *)currentCredential credentialType] == 135
      || self->_currentAppleBalanceCredential != 0;
}

- (void)_performValidateSecurityRequirements:(id)a3 completion:(id)a4
{
  id v4 = a4;
  BOOL v5 = [MEMORY[0x263F5BCE8] sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__NPKPaymentProvisioningFlowController__performValidateSecurityRequirements_completion___block_invoke;
  v7[3] = &unk_2644D28C0;
  id v8 = v4;
  id v6 = v4;
  [v5 validateAppleBalanceSecurityRequirementsWithCompletion:v7];
}

void __88__NPKPaymentProvisioningFlowController__performValidateSecurityRequirements_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    uint64_t v7 = pk_Payment_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: Standalone: Apple Balance security requirements not met. Could not verify/setup Apple Pay cloud store container. Error: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v10 = PKLocalizedPaymentString(&cfstr_CouldNotSetUpT.isa);
    id v11 = PKLocalizedPaymentString(&cfstr_CouldNotSetUpM.isa);
    id v6 = PKDisplayableErrorCustom();
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v6);
  }
}

- (void)_performSEStorageCheck:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Performing SE storage check.", buf, 2u);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(PKPaymentProvisioningController *)self->_provisioningController eligibilityResponse];
  uint64_t v10 = [v9 paymentApplications];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v16 + 1) + 8 * v14) appletTypeIdentifier];
        [v8 npkSafelyAddObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v12);
  }

  [(NPKPaymentProvisioningFlowController *)self _checkSpaceAvailableForAppletTypes:v8 triedCleanup:0 completion:v4];
}

- (void)_checkSpaceAvailableForAppletTypes:(id)a3 triedCleanup:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x263F5C1E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __99__NPKPaymentProvisioningFlowController__checkSpaceAvailableForAppletTypes_triedCleanup_completion___block_invoke;
  v13[3] = &unk_2644D3E60;
  BOOL v17 = a4;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 getCurrentSnapshot:v13];
}

void __99__NPKPaymentProvisioningFlowController__checkSpaceAvailableForAppletTypes_triedCleanup_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_16:
    v15();
    goto LABEL_17;
  }
  char v5 = [v3 canFitAppletTypes:*(void *)(a1 + 32)];
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromBOOL();
      *(_DWORD *)buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: SE storage check returned can fit applets on SE: %@ from snapshot %@", buf, 0x16u);
    }
  }
  if (PKDynamicSEAllocationFakeFullSE())
  {
    uint64_t v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    char v5 = 0;
    if (v11)
    {
      id v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Overriding canFit to NO b/c fake full se", buf, 2u);
      }

      char v5 = 0;
    }
  }
  if (*(unsigned char *)(a1 + 56) || (v5 & 1) != 0)
  {
    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F5C1D8]) initWithWebService:*(void *)(*(void *)(a1 + 40) + 104)];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __99__NPKPaymentProvisioningFlowController__checkSpaceAvailableForAppletTypes_triedCleanup_completion___block_invoke_117;
  v17[3] = &unk_2644D3388;
  int8x16_t v16 = *(int8x16_t *)(a1 + 32);
  id v14 = (id)v16.i64[0];
  int8x16_t v18 = vextq_s8(v16, v16, 8uLL);
  id v19 = *(id *)(a1 + 48);
  [v13 debugPerformSECleanup:v17];

LABEL_17:
}

uint64_t __99__NPKPaymentProvisioningFlowController__checkSpaceAvailableForAppletTypes_triedCleanup_completion___block_invoke_117(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkSpaceAvailableForAppletTypes:*(void *)(a1 + 40) triedCleanup:1 completion:*(void *)(a1 + 48)];
}

- (void)_handlePasscodeUpgradeCompleteWithSuccess:(BOOL)a3 error:(id)a4 requestContext:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  [(PKPaymentProvisioningController *)self->_provisioningController passcodeUpgradeCompleted:v5];
  if (v5) {
    [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v7];
  }
}

- (BOOL)_isPasscodeUpgradeRequired
{
  return [(PKPaymentProvisioningController *)self->_provisioningController isPasscodeUpgradeRequired];
}

- (void)_performPasscodeUpgrade:(id)a3
{
  id v4 = a3;
  provisioningController = self->_provisioningController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__NPKPaymentProvisioningFlowController__performPasscodeUpgrade___block_invoke;
  v7[3] = &unk_2644D3EB0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKPaymentProvisioningController *)provisioningController preflightPasscodeUpgradeWithCompletion:v7];
}

void __64__NPKPaymentProvisioningFlowController__performPasscodeUpgrade___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__NPKPaymentProvisioningFlowController__performPasscodeUpgrade___block_invoke_2;
  v11[3] = &unk_2644D3E88;
  char v15 = a2;
  char v16 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v9;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __64__NPKPaymentProvisioningFlowController__performPasscodeUpgrade___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 56);
      int v6 = *(unsigned __int8 *)(a1 + 57);
      uint64_t v7 = *(void *)(a1 + 32);
      v11[0] = 67109634;
      v11[1] = v5;
      __int16 v12 = 1024;
      int v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Preflighted passcode upgrade with success %d, meets policy %d, error %@", (uint8_t *)v11, 0x18u);
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(unsigned char *)(a1 + 57))
    {
      [*(id *)(a1 + 40) _handlePasscodeUpgradeCompleteWithSuccess:1 error:0 requestContext:*(void *)(a1 + 48)];
    }
    else
    {
      id v10 = [[NPKPaymentProvisioningFlowControllerPasscodeUpgradeStepContext alloc] initWithRequestContext:*(void *)(a1 + 48)];
      [*(id *)(a1 + 40) _performTransitionToStep:197 withContext:v10];
    }
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = PKDisplayableErrorForCommonType();
    [v8 _sendDidEncounterError:v9 requestContext:*(void *)(a1 + 48)];
  }
}

- (void)_performTerms:(id)a3
{
  provisioningController = self->_provisioningController;
  id v5 = a3;
  id v7 = [(PKPaymentProvisioningController *)provisioningController eligibilityResponse];
  int v6 = [v7 termsURL];
  [(NPKPaymentProvisioningFlowController *)self _transitionBasedOnTermsForReason:0 URL:v6 requestContext:v5];
}

- (void)_performProvision:(id)a3
{
  id v4 = a3;
  [(NPKPaymentProvisioningFlowController *)self _transitionToProvisioningProgressWithRequestContext:v4];
  id v5 = [(NPKPaymentProvisioningFlowController *)self _newPaymentProvisioningRequest];
  int v6 = (void *)MEMORY[0x263F00A48];
  id v7 = PKPassKitCoreBundle();
  uint64_t v8 = (void *)[v6 newAssertionForBundle:v7 withReason:@"User-requested Wallet pass provisioning"];

  id v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    BOOL v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Requesting externalized auth...", buf, 2u);
    }
  }
  __int16 v12 = [(NPKPaymentProvisioningFlowController *)self fidoAuthCoordinator];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__NPKPaymentProvisioningFlowController__performProvision___block_invoke;
  v16[3] = &unk_2644D3F00;
  void v16[4] = self;
  id v17 = v5;
  id v18 = v4;
  id v19 = v8;
  id v13 = v8;
  id v14 = v4;
  id v15 = v5;
  [v12 requestAuthorizationWithCompletion:v16];
}

void __58__NPKPaymentProvisioningFlowController__performProvision___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NPKPaymentProvisioningFlowController__performProvision___block_invoke_2;
  block[3] = &unk_2644D3ED8;
  char v20 = a2;
  id v14 = v8;
  id v15 = v9;
  BOOL v10 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = v10;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v11 = v9;
  id v12 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__NPKPaymentProvisioningFlowController__performProvision___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 80);
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v17 = 138412802;
      uint64_t v18 = v6;
      __int16 v19 = 1024;
      int v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Created context %@ with success %i and error %@", (uint8_t *)&v17, 0x1Cu);
    }
  }
  if (*(unsigned char *)(a1 + 80))
  {
    id v8 = [*(id *)(a1 + 48) fidoAuthCoordinator];
    id v9 = [v8 context];
    BOOL v10 = [v9 externalizedContext];

    [*(id *)(*(void *)(a1 + 48) + 24) storeExternalizedAuth:v10];
    [*(id *)(a1 + 48) _performProvisionWithRequest:*(void *)(a1 + 56) requestContext:*(void *)(a1 + 64) assertion:*(void *)(a1 + 72)];
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      return;
    }
    id v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      id v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        int v17 = 138412290;
        uint64_t v18 = v14;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: Standalone: Error: Unable to request and store externalized auth! %@", (uint8_t *)&v17, 0xCu);
      }
    }
    id v15 = [*(id *)(a1 + 48) fidoAuthCoordinator];
    [v15 clearContext];

    uint64_t v16 = *(id **)(a1 + 48);
    BOOL v10 = [v16[3] displayableErrorForProvisioningError:*(void *)(a1 + 40)];
    [v16 _sendDidEncounterError:v10 requestContext:*(void *)(a1 + 64)];
  }
}

- (void)_performProvisionWithRequest:(id)a3 requestContext:(id)a4 assertion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  provisioningController = self->_provisioningController;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __94__NPKPaymentProvisioningFlowController__performProvisionWithRequest_requestContext_assertion___block_invoke;
  v13[3] = &unk_2644D3F28;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  [(PKPaymentProvisioningController *)provisioningController requestProvisioning:a3 withCompletion:v13];
}

void __94__NPKPaymentProvisioningFlowController__performProvisionWithRequest_requestContext_assertion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [*(id *)(a1 + 32) invalidate];
  if (a2)
  {
    [*(id *)(a1 + 40) _performNextActionForProvisioningState:*(void *)(a1 + 48)];
    uint64_t v7 = [*(id *)(a1 + 40) fidoAuthCoordinator];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 40) fidoAuthCoordinator];
      [v8 clearContext];
    }
  }
  else
  {
    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      if (v10)
      {
        id v11 = pk_Payment_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          id v19 = v6;
          _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when sending provision request: %@", (uint8_t *)&v18, 0xCu);
        }
      }
      id v12 = *(id **)(a1 + 40);
      uint64_t v13 = [v12[3] displayableErrorForProvisioningError:v6];
    }
    else
    {
      if (v10)
      {
        id v14 = pk_Payment_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response or error from provision!", (uint8_t *)&v18, 2u);
        }
      }
      id v12 = *(id **)(a1 + 40);
      uint64_t v13 = PKDisplayableErrorForCommonType();
    }
    id v15 = (void *)v13;
    [v12 _sendDidEncounterError:v13 requestContext:*(void *)(a1 + 48)];

    uint64_t v16 = *(void *)(a1 + 40);
    int v17 = *(void **)(v16 + 64);
    *(void *)(v16 + 64) = 0;
  }
}

- (void)_handleFinished:(id)a3
{
  id v4 = a3;
  int v5 = [(PKPaymentProvisioningController *)self->_provisioningController provisionedPass];
  if ([(NPKPaymentProvisioningFlowController *)self internalIngestionState] == 7)
  {
    id v6 = pk_Payment_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Provisioning is complete, but waiting for reader mode second tap", v9, 2u);
      }
    }
  }
  else
  {
    [(NPKPaymentProvisioningFlowController *)self _performNextStepForProvisionedPass:v5 requestContext:v4];
  }
}

- (void)_performNextStepForProvisionedPass:(id)a3 requestContext:(id)a4
{
}

- (void)_performNextStepForProvisionedPass:(id)a3 moreInfoAcknowledged:(BOOL)a4 requestContext:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
  id v12 = [v11 targetDevice];
  uint64_t v13 = [v12 secureElementIdentifiers];
  [v9 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v13];

  id v14 = [v9 devicePrimaryPaymentApplication];
  uint64_t v15 = [v14 state];

  uint64_t v16 = [(PKPaymentProvisioningController *)self->_provisioningController moreInfoItems];
  int v17 = v16;
  if (a4 || ![v16 count])
  {
    if ((unint64_t)(v15 - 3) > 1)
    {
      [(NPKPaymentProvisioningFlowController *)self _handleEndOfProvisioningFlowForCurrentPass:v9 requestContext:v10];
    }
    else
    {
      int v18 = pk_Payment_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        uint64_t v20 = pk_Payment_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v21 = 0;
          _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Verification is necessary", v21, 2u);
        }
      }
      objc_storeStrong((id *)&self->_issuerVerificationPass, a3);
      [(NPKPaymentProvisioningFlowController *)self _requestVerificationOptionsForPass:v9 context:v10];
    }
  }
  else
  {
    [(NPKPaymentProvisioningFlowController *)self _transitionToMoreInformationWithItems:v17 pass:v9 requestContext:v10];
  }
}

- (void)_handleVerificationResponseForPass:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentWebService *)self->_webService verificationRecordForPass:v6];
  uint64_t v9 = [v8 verificationStatus];
  switch(v9)
  {
    case 3:
      uint64_t v15 = [v8 channel];
      id v14 = v15;
      if (v15 && ([v15 type] == 2 || objc_msgSend(v14, "type") == 1))
      {
        [(NPKPaymentProvisioningFlowController *)self _transitionToVerificationCodeWithPaymentPass:v6 channel:v14 requestContext:v7];
      }
      else
      {
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __83__NPKPaymentProvisioningFlowController__handleVerificationResponseForPass_context___block_invoke;
        v20[3] = &unk_2644D3F50;
        v20[4] = self;
        id v21 = v7;
        [(NPKPaymentProvisioningFlowController *)self _downloadAndAddUpdatedPassForPaymentPass:v6 completion:v20];
      }
      break;
    case 2:
      id v14 = [v8 allChannels];
      [(NPKPaymentProvisioningFlowController *)self _transitionToVerificationChannelsWithPaymentPass:v6 channels:v14 requestContext:v7];
      break;
    case 1:
      id v10 = objc_alloc(MEMORY[0x263F5C0C8]);
      id v11 = [v8 requiredVerificationFields];
      id v12 = (PKPaymentSetupFieldsModel *)[v10 initWithPaymentSetupFields:v11];
      fieldsModel = self->_fieldsModel;
      self->_fieldsModel = v12;

      id v14 = [v8 requiredVerificationFields];
      [(NPKPaymentProvisioningFlowController *)self _transitionToVerificationFieldsWithPaymentPass:v6 fields:v14 requestContext:v7];
      break;
    default:
      uint64_t v16 = pk_Payment_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        int v18 = pk_Payment_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v19 = 0;
          _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Warning: Standalone verification status: unknown, showing error.", v19, 2u);
        }
      }
      id v14 = PKDisplayableErrorForCommonType();
      [(NPKPaymentProvisioningFlowController *)self _sendDidEncounterError:v14 requestContext:v7];
      break;
  }
}

uint64_t __83__NPKPaymentProvisioningFlowController__handleVerificationResponseForPass_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEndOfProvisioningFlowForCurrentPass:a2 requestContext:*(void *)(a1 + 40)];
}

- (void)_requestVerificationOptionsForPass:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F5C118] requestWithPass:v6];
  webService = self->_webService;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__NPKPaymentProvisioningFlowController__requestVerificationOptionsForPass_context___block_invoke;
  v12[3] = &unk_2644D3F78;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(PKPaymentWebService *)webService verificationOptionsForRequest:v8 completion:v12];
}

void __83__NPKPaymentProvisioningFlowController__requestVerificationOptionsForPass_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__NPKPaymentProvisioningFlowController__requestVerificationOptionsForPass_context___block_invoke_2;
  block[3] = &unk_2644D2DE0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = a2;
  void block[4] = v7;
  id v11 = v8;
  id v12 = *(id *)(a1 + 48);
  id v13 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __83__NPKPaymentProvisioningFlowController__requestVerificationOptionsForPass_context___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1[8] == 1)
  {
    v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    [v2 _handleVerificationResponseForPass:v3 context:v4];
  }
  else
  {
    int v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      uint64_t v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = a1[7];
        uint64_t v8 = a1[8];
        int v12 = 134218242;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: requesting verification options failed (result %lu). Showing error: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    id v10 = (void *)a1[4];
    id v11 = [(id)objc_opt_class() _displayableErrorWithUnderlyingVerificationError:a1[7]];
    [v10 _sendDidEncounterError:v11 requestContext:a1[6]];
  }
}

- (void)_updateVerificationForPass:(id)a3 channel:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  webService = self->_webService;
  id v11 = a4;
  int v12 = [(PKPaymentWebService *)webService verificationRecordForPass:v8];
  id v13 = objc_alloc_init(MEMORY[0x263F5C120]);
  __int16 v14 = [v12 currentStepIdentifier];
  [v13 setStepIdentifier:v14];

  [v13 setPass:v8];
  [v13 setChannel:v11];

  uint64_t v15 = self->_webService;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__NPKPaymentProvisioningFlowController__updateVerificationForPass_channel_context___block_invoke;
  v18[3] = &unk_2644D3F78;
  void v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  [(PKPaymentWebService *)v15 updateVerification:v13 completion:v18];
}

void __83__NPKPaymentProvisioningFlowController__updateVerificationForPass_channel_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__NPKPaymentProvisioningFlowController__updateVerificationForPass_channel_context___block_invoke_2;
  block[3] = &unk_2644D2DE0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = a2;
  void block[4] = v7;
  id v11 = v8;
  id v12 = *(id *)(a1 + 48);
  id v13 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __83__NPKPaymentProvisioningFlowController__updateVerificationForPass_channel_context___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1[8] == 1)
  {
    v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    [v2 _handleVerificationResponseForPass:v3 context:v4];
  }
  else
  {
    int v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      uint64_t v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = a1[7];
        uint64_t v8 = a1[8];
        int v12 = 134218242;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: requesting verification fields failed (result %lu). Showing error: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    id v10 = (void *)a1[4];
    id v11 = [(id)objc_opt_class() _displayableErrorWithUnderlyingVerificationError:a1[7]];
    [v10 _sendDidEncounterError:v11 requestContext:a1[6]];
  }
}

- (void)_handleVerificationFieldsForPass:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKPaymentWebService *)self->_webService verificationRecordForPass:v6];
  id v9 = objc_alloc_init(MEMORY[0x263F5C120]);
  id v10 = [v8 currentStepIdentifier];
  [v9 setStepIdentifier:v10];

  [v9 setPass:v6];
  id v11 = [v8 channel];
  [v9 setChannel:v11];

  int v12 = [(NPKPaymentProvisioningFlowController *)self fieldsModel];
  uint64_t v13 = *MEMORY[0x263F5C7A8];
  __int16 v14 = [v12 submissionValuesForDestination:*MEMORY[0x263F5C7A8]];

  [v9 setOverlayParameters:v14];
  uint64_t v15 = [(NPKPaymentProvisioningFlowController *)self fieldsModel];
  uint64_t v16 = [v15 secureSubmissionValuesForDestination:v13];

  [v9 setSecureOverlayParameters:v16];
  webService = self->_webService;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __81__NPKPaymentProvisioningFlowController__handleVerificationFieldsForPass_context___block_invoke;
  v20[3] = &unk_2644D3F78;
  v20[4] = self;
  id v21 = v6;
  id v22 = v7;
  id v18 = v7;
  id v19 = v6;
  [(PKPaymentWebService *)webService updateVerification:v9 completion:v20];
}

void __81__NPKPaymentProvisioningFlowController__handleVerificationFieldsForPass_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__NPKPaymentProvisioningFlowController__handleVerificationFieldsForPass_context___block_invoke_2;
  block[3] = &unk_2644D2DE0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v14 = a2;
  void block[4] = v7;
  id v11 = v8;
  id v12 = *(id *)(a1 + 48);
  id v13 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __81__NPKPaymentProvisioningFlowController__handleVerificationFieldsForPass_context___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1[8] == 1)
  {
    v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    [v2 _handleVerificationResponseForPass:v3 context:v4];
  }
  else
  {
    int v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      uint64_t v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = a1[7];
        uint64_t v8 = a1[8];
        int v12 = 134218242;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: requesting verification fields failed (result %lu). Showing error: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    id v10 = (void *)a1[4];
    id v11 = [(id)objc_opt_class() _displayableErrorWithUnderlyingVerificationError:a1[7]];
    [v10 _sendDidEncounterError:v11 requestContext:a1[6]];
  }
}

- (void)_handleVerificationCode:(id)a3 forPass:(id)a4 context:(id)a5
{
  id v8 = a5;
  webService = self->_webService;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke;
  v11[3] = &unk_2644D3FA0;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(PKPaymentWebService *)webService submitVerificationCode:a3 verificationData:0 forPass:a4 completion:v11];
}

void __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke_2;
  block[3] = &unk_2644D2DE0;
  uint64_t v16 = a2;
  uint64_t v9 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 64) == 1)
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke_3;
    v11[3] = &unk_2644D3F50;
    void v11[4] = v2;
    id v12 = *(id *)(a1 + 48);
    [v2 _downloadRemoteAssetsAndAddPaymentPass:v3 completion:v11];
  }
  else
  {
    uint64_t v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v7 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 134218242;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        uint64_t v16 = v8;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: submitting verification code failed (result %lu). Showing error: %@", buf, 0x16u);
      }
    }
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [(id)objc_opt_class() _displayableErrorWithUnderlyingVerificationError:*(void *)(a1 + 56)];
    [v9 _sendDidEncounterError:v10 requestContext:*(void *)(a1 + 48)];
  }
}

uint64_t __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEndOfProvisioningFlowForCurrentPass:a2 requestContext:*(void *)(a1 + 40)];
}

- (void)_downloadAndAddUpdatedPassForPaymentPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webService = self->_webService;
  uint64_t v9 = [v6 passTypeIdentifier];
  id v10 = [v6 serialNumber];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __92__NPKPaymentProvisioningFlowController__downloadAndAddUpdatedPassForPaymentPass_completion___block_invoke;
  v13[3] = &unk_2644D3FC8;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(PKPaymentWebService *)webService passWithPassTypeIdentifier:v9 serialNumber:v10 completion:v13];
}

uint64_t __92__NPKPaymentProvisioningFlowController__downloadAndAddUpdatedPassForPaymentPass_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadRemoteAssetsAndAddPaymentPass:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_downloadRemoteAssetsAndAddPaymentPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 dataAccessor];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __90__NPKPaymentProvisioningFlowController__downloadRemoteAssetsAndAddPaymentPass_completion___block_invoke;
  v11[3] = &unk_2644D4018;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:0 completion:v11];
}

void __90__NPKPaymentProvisioningFlowController__downloadRemoteAssetsAndAddPaymentPass_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 104) targetDevice];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 104);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __90__NPKPaymentProvisioningFlowController__downloadRemoteAssetsAndAddPaymentPass_completion___block_invoke_2;
    v6[3] = &unk_2644D3FF0;
    id v8 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 40);
    [v3 paymentWebService:v5 addPaymentPass:v4 withCompletionHandler:v6];
  }
}

uint64_t __90__NPKPaymentProvisioningFlowController__downloadRemoteAssetsAndAddPaymentPass_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_provisioningLocalizedProgressDescriptionDidChange:(id)a3
{
  if (self->_currentStep == 210)
  {
    id v6 = [[NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext alloc] initWithRequestContext:self->_provisioningProgressRequestContext];
    uint64_t v4 = [(PKPaymentProvisioningController *)self->_provisioningController localizedProgressDescription];
    [(NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext *)v6 setLocalizedProgressDescription:v4];

    uint64_t v5 = [(NPKPaymentProvisioningFlowController *)self currentProduct];
    [(NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext *)v6 setProduct:v5];

    [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:210 withContext:v6];
  }
}

- (void)_transitionToChooseFlowWithSections:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[NPKPaymentProvisioningFlowControllerChooseFlowStepContext alloc] initWithRequestContext:v6];

  [(NPKPaymentProvisioningFlowControllerChooseFlowStepContext *)v8 setSections:v7];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:130 withContext:v8];
}

- (void)_transitionToChooseProductWithProducts:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[NPKPaymentProvisioningFlowControllerChooseProductStepContext alloc] initWithRequestContext:v6];

  [(NPKPaymentProvisioningFlowControllerChooseProductStepContext *)v8 setProducts:v7];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:135 withContext:v8];
}

- (void)_transitionBasedOnTermsForReason:(unint64_t)a3 URL:(id)a4 requestContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  self->_unint64_t termsReason = a3;
  id v9 = a5;
  id v10 = [[NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext alloc] initWithRequestContext:v9];

  id v11 = [(NPKPaymentProvisioningFlowController *)self currentProduct];
  [(NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext *)v10 setProduct:v11];

  [(NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext *)v10 setTermsURL:v8];
  id v12 = [(PKPaymentWebService *)self->_webService context];
  -[NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext setAllowNonSecureHTTP:](v10, "setAllowNonSecureHTTP:", [v12 devSigned]);

  if (v8 && !self->_termsAcceptedOutOfBand)
  {
    [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:200 withContext:v10];
  }
  else
  {
    id v13 = pk_Payment_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      id v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL termsAcceptedOutOfBand = self->_termsAcceptedOutOfBand;
        int v18 = 138412546;
        id v19 = v8;
        __int16 v20 = 1024;
        BOOL v21 = termsAcceptedOutOfBand;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Not showing terms (termsURL %@, accepted out of band %d)", (uint8_t *)&v18, 0x12u);
      }
    }
    self->_BOOL termsAcceptedOutOfBand = 0;
    uint64_t v17 = [(NPKPaymentProvisioningFlowStepContext *)v10 requestContext];
    [(NPKPaymentProvisioningFlowController *)self acceptTerms:v17];
  }
}

- (void)_transitionToProvisioningProgressWithRequestContext:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_provisioningProgressRequestContext, a3);
  int currentStep = self->_currentStep;
  if (currentStep != 165 && currentStep != 210)
  {
    id v6 = [[NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext alloc] initWithRequestContext:self->_provisioningProgressRequestContext];
    [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:210 withContext:v6];
  }
}

- (void)_transitionToProvisioningForCredential:(id)a3 product:(id)a4 requestContext:(id)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isRemoteCredential]
    && ([v8 remoteCredential],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 status],
        v11,
        v12 != 1))
  {
    uint64_t v17 = pk_General_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (!v18) {
      goto LABEL_9;
    }
    uint64_t v16 = pk_General_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v9 displayName];
      __int16 v20 = [v8 longDescription];
      int v21 = 138412546;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      uint64_t v24 = v20;
      _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_ERROR, "Error: Error: No valid provisioning methods exist for product[%@] credential [%@]", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    id v13 = pk_Payment_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      id v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Single remote credential", (uint8_t *)&v21, 2u);
      }
    }
    v25[0] = v8;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    [(NPKPaymentProvisioningFlowController *)self _handleProceedWithCredentials:v16 chosenByUser:0 requestContext:v10];
  }

LABEL_9:
}

- (void)_transitionBasedOnCredentials:(id)a3 product:(id)a4 requestContext:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 count])
  {
    BOOL v14 = pk_Payment_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      if (v15)
      {
        uint64_t v16 = pk_Payment_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v9 productIdentifier];
          BOOL v18 = [v9 provisioningMethodTypes];
          int v26 = 138412546;
          BOOL v27 = v17;
          __int16 v28 = 2112;
          char v29 = v18;
          _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Have product with identifier %@ provisioning method types %@", (uint8_t *)&v26, 0x16u);
        }
      }
      if (!NPKPaymentProvisioningSetupContextIsSetupAssistant(self->_setupContext))
      {
        id v19 = [v9 provisioningMethodMetadataForType:*MEMORY[0x263F5C738]];

        if (v19)
        {
          [(NPKPaymentProvisioningFlowController *)self _transitionToDigitalIssuanceForProduct:v9 requestContext:v10];
          goto LABEL_27;
        }
      }
      __int16 v20 = [v9 provisioningMethodMetadataForType:*MEMORY[0x263F5C750]];

      if (v20)
      {
        [(NPKPaymentProvisioningFlowController *)self _transitionToReaderModeForProduct:v9 requestContext:v10];
        goto LABEL_27;
      }
      uint64_t v22 = pk_General_log();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
        uint64_t v24 = pk_General_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_ERROR, "Error: Error: No valid provisioning methods exist for product; transitioning to manual entry",
            (uint8_t *)&v26,
            2u);
        }
      }
      currentProduct = self->_currentProduct;
      self->_currentProduct = 0;
    }
    else if (v15)
    {
      int v21 = pk_Payment_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Enter Manual Entry, no credentials found", (uint8_t *)&v26, 2u);
      }
    }
    [(NPKPaymentProvisioningFlowController *)self _transitionToManualEntry:v10];
    goto LABEL_27;
  }
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: TransitionToRemoteCredentials Step", (uint8_t *)&v26, 2u);
    }
  }
  [(NPKPaymentProvisioningFlowController *)self _transitionToChooseCredentials:v8 product:v9 requestContext:v10];
LABEL_27:
}

- (void)_transitionToChooseCredentials:(id)a3 product:(id)a4 requestContext:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v23 = a4;
  id v22 = a5;
  __int16 v20 = [[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext alloc] initWithRequestContext:v22];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  id v9 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        BOOL v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        BOOL v15 = [v14 remoteCredential];
        uint64_t v16 = [v15 identifier];
        uint64_t v17 = v16;
        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          id v19 = [MEMORY[0x263F08C38] UUID];
          id v18 = [v19 UUIDString];
        }
        [v9 addObject:v18];
        [v8 setObject:v14 forKey:v18];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)v20 setFlowIdentifiers:v9];
  [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)v20 setFlowIdentifierToCredential:v8];
  [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)v20 setAllowsManualEntry:1];
  [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)v20 setProduct:v23];
  [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)v20 setCredentials:obj];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:140 withContext:v20];
}

- (void)_transitionToAppleBalanceAccountDetailsWithProduct:(id)a3 requestContext:(id)a4
{
  id v5 = a4;
  __int16 v20 = [[NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext alloc] initWithRequestContext:v5];

  id v6 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
  id v7 = [v6 webService];
  id v8 = [v7 targetDevice];
  id v9 = [v8 appleAccountInformation];
  uint64_t v10 = [v9 appleID];

  [(NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext *)v20 setAppleID:v10];
  uint64_t v11 = [(NPKPaymentProvisioningFlowController *)self currentAppleBalanceCredential];
  uint64_t v12 = [v11 eligibilityResponse];
  id v13 = [v12 supplementaryData];
  BOOL v14 = [v13 lightweightAccount];

  BOOL v15 = [v14 appleBalanceDetails];
  uint64_t v16 = [v15 accountSummary];
  uint64_t v17 = [v16 currentBalance];
  id v18 = [v15 currencyCode];
  id v19 = PKCurrencyAmountMake();
  [(NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext *)v20 setBalance:v19];

  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:260 withContext:v20];
}

- (id)_curatedDefaultPaymentSetupProvisioningFields
{
  uint64_t v3 = [MEMORY[0x263F5C0C8] defaultPaymentSetupProvisioningFields];
  if ([(PKPaymentProvisioningController *)self->_provisioningController suppressDefaultCardholderNameField])
  {
    uint64_t v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_142);

    uint64_t v3 = (void *)v4;
  }
  return v3;
}

uint64_t __85__NPKPaymentProvisioningFlowController__curatedDefaultPaymentSetupProvisioningFields__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F5C798]] ^ 1;

  return v3;
}

- (void)_transitionToManualEntry:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v30 = a3;
  currentCredential = self->_currentCredential;
  self->_currentCredential = 0;

  id v5 = objc_alloc(MEMORY[0x263F5C0C8]);
  id v6 = [(NPKPaymentProvisioningFlowController *)self _curatedDefaultPaymentSetupProvisioningFields];
  id v7 = (PKPaymentSetupFieldsModel *)[v5 initWithPaymentSetupFields:v6];
  fieldsModel = self->_fieldsModel;
  self->_fieldsModel = v7;

  [(PKPaymentProvisioningController *)self->_provisioningController resetForNewProvisioning];
  id v9 = [(PKPaymentWebService *)self->_webService context];
  uint64_t v10 = [v9 configuration];

  uint64_t v11 = [(PKPaymentWebService *)self->_webService targetDevice];
  uint64_t v12 = [v11 deviceRegion];

  unsigned int v29 = [v10 cameraFirstProvisioningEnabledForRegion:v12];
  id v13 = [(NPKPaymentProvisioningFlowController *)self _curatedDefaultPaymentSetupProvisioningFields];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v19 = [v18 defaultValue];

        if (!v19)
        {
          __int16 v20 = self->_fieldsModel;
          int v21 = [v18 identifier];
          id v22 = [(PKPaymentSetupFieldsModel *)v20 paymentSetupFieldWithIdentifier:v21];

          if (v22)
          {
            id v23 = [v22 defaultValue];
            [v18 setDefaultValue:v23];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v15);
  }
  uint64_t v24 = [v13 count];
  long long v25 = pk_Payment_log();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if (v26)
  {
    long long v27 = pk_Payment_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = v24;
      _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: There are %lu fields required in the Manual Entry", buf, 0xCu);
    }
  }
  long long v28 = [[NPKPaymentProvisioningFlowControllerManualEntryStepContext alloc] initWithRequestContext:v30];
  [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)v28 setCameraFirstProvisioningEnabled:v29];
  [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)v28 setSetupFields:v13];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:180 withContext:v28];
}

- (id)_credentialReadonlyFieldIdentifiers
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F5C788];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)_secondaryFilteredFields:(id)a3 forCredential:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __79__NPKPaymentProvisioningFlowController__secondaryFilteredFields_forCredential___block_invoke;
    v11[3] = &unk_2644D4060;
    void v11[4] = self;
    objc_msgSend(v6, "pk_objectsPassingTest:", v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

uint64_t __79__NPKPaymentProvisioningFlowController__secondaryFilteredFields_forCredential___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [*(id *)(a1 + 32) _credentialReadonlyFieldIdentifiers];
  uint64_t v5 = [v4 containsObject:v3] ^ 1;

  return v5;
}

- (void)_transitionToSecondaryManualEntryWithFields:(id)a3 credential:(id)a4 requestContext:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  fieldsModel = self->_fieldsModel;
  id v10 = a5;
  [(PKPaymentSetupFieldsModel *)fieldsModel updateWithPaymentSetupFields:a3];
  BOOL v11 = [(NPKPaymentProvisioningFlowController *)self _fieldsModelCompleteExceptForLocalFields:self->_fieldsModel];
  if (v11)
  {
    uint64_t v12 = [[NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryStepContext alloc] initWithRequestContext:v10];

    id v13 = pk_Payment_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      uint64_t v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel incompletePaymentSetupFields];
        int v27 = 138412546;
        id v28 = v8;
        __int16 v29 = 2048;
        uint64_t v30 = [v16 count];
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered Local Device Manual Entry for credential %@. There are %lu incomplete fields.", (uint8_t *)&v27, 0x16u);
      }
      uint64_t v17 = 192;
LABEL_10:

      goto LABEL_13;
    }
    uint64_t v17 = 192;
  }
  else
  {
    uint64_t v12 = [[NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext alloc] initWithRequestContext:v10];

    id v18 = pk_Payment_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      uint64_t v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel incompletePaymentSetupFields];
        int v27 = 138412546;
        id v28 = v8;
        __int16 v29 = 2048;
        uint64_t v30 = [v20 count];
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered Secondary Manual Entry for credential %@. There are %lu incomplete fields.", (uint8_t *)&v27, 0x16u);
      }
      uint64_t v17 = 190;
      goto LABEL_10;
    }
    uint64_t v17 = 190;
  }
LABEL_13:
  int v21 = [(PKPaymentSetupFieldsModel *)self->_fieldsModel paymentSetupFields];
  id v22 = [(NPKPaymentProvisioningFlowController *)self _filteredPaymentSetupFields:v21 forLocalDeviceEntry:v11];

  id v23 = [(NPKPaymentProvisioningFlowController *)self _secondaryFilteredFields:v22 forCredential:v8];
  [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)v12 setSetupFields:v23];
  [(NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext *)v12 setCredential:v8];
  uint64_t v24 = [(PKPaymentProvisioningController *)self->_provisioningController credentialProvisioningQueue];
  uint64_t v25 = [v24 count];

  if (v25) {
    BOOL v26 = 0;
  }
  else {
    BOOL v26 = v8 != 0;
  }
  [(NPKPaymentProvisioningFlowStepContext *)v12 setAllowsAddLater:v25 != 0];
  [(NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext *)v12 setAllowsAddingDifferentCard:v26];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:v17 withContext:v12];
}

- (void)_transitionToProductDisambiguationWithProducts:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext alloc] initWithRequestContext:v6];

  [(NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext *)v8 setProducts:v7];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:195 withContext:v8];
}

- (void)_transitionToMoreInformationWithItems:(id)a3 pass:(id)a4 requestContext:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  BOOL v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      uint64_t v16 = [v8 count];
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered more information step. There are %lu more info items", (uint8_t *)&v15, 0xCu);
    }
  }
  BOOL v14 = [[NPKPaymentProvisioningFlowControllerMoreInformationStepContext alloc] initWithRequestContext:v9];

  [(NPKPaymentProvisioningFlowControllerMoreInformationStepContext *)v14 setPaymentPass:v10];
  [(NPKPaymentProvisioningFlowControllerMoreInformationStepContext *)v14 setMoreInfoItems:v8];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:157 withContext:v14];
}

- (void)_transitionToVerificationChannelsWithPaymentPass:(id)a3 channels:(id)a4 requestContext:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  BOOL v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      uint64_t v16 = [v8 count];
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered verification options step. There are %lu channels", (uint8_t *)&v15, 0xCu);
    }
  }
  BOOL v14 = [[NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext alloc] initWithRequestContext:v9];

  [(NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext *)v14 setPaymentPass:v10];
  [(NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext *)v14 setVerificationChannels:v8];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:230 withContext:v14];
}

- (void)_transitionToVerificationFieldsWithPaymentPass:(id)a3 fields:(id)a4 requestContext:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v9 count];
  BOOL v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    BOOL v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      uint64_t v17 = v11;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered verification fields step. There are %lu fields required", (uint8_t *)&v16, 0xCu);
    }
  }
  int v15 = [[NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext alloc] initWithRequestContext:v8];

  [(NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext *)v15 setPaymentPass:v10];
  [(NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext *)v15 setVerificationFields:v9];

  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:240 withContext:v15];
}

- (void)_transitionToVerificationCodeWithPaymentPass:(id)a3 channel:(id)a4 requestContext:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    BOOL v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 description];
      int v16 = 136315138;
      uint64_t v17 = [v14 UTF8String];
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered verification code step with channel %s", (uint8_t *)&v16, 0xCu);
    }
  }
  int v15 = [[NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext alloc] initWithRequestContext:v9];

  [(NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext *)v15 setPaymentPass:v10];
  [(NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext *)v15 setVerificationChannel:v8];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:250 withContext:v15];
}

- (void)_handleEndOfProvisioningFlowForCurrentPass:(id)a3 requestContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: End of provisioning flow for current card", (uint8_t *)v17, 2u);
    }
  }
  self->_BOOL termsAcceptedOutOfBand = 0;
  uint64_t v11 = [(PKPaymentProvisioningController *)self->_provisioningController credentialProvisioningQueue];
  int v12 = [v11 remaining];
  BOOL v13 = [v11 nextCredentialToProvision];
  if (v13)
  {
    id v14 = pk_Payment_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      int v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 67109378;
        v17[1] = v12;
        __int16 v18 = 2112;
        BOOL v19 = v13;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: %d credentials remaining; moving to credential: %@",
          (uint8_t *)v17,
          0x12u);
      }
    }
    [(NPKPaymentProvisioningFlowController *)self _startProvisioningForCredential:v13 requestContext:v7];
  }
  else
  {
    [(NPKPaymentProvisioningFlowController *)self _endProvisioningFlowWithSuccessForPass:v6 requestContext:v7];
  }
}

- (void)_endProvisioningFlowWithSuccessForPass:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext alloc] initWithRequestContext:v6];

  [(NPKPaymentProvisioningFlowControllerProvisioningResultStepContext *)v8 setCardAdded:1];
  [(NPKPaymentProvisioningFlowControllerProvisioningResultStepContext *)v8 setProvisionedPass:v7];

  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:220 withContext:v8];
}

- (void)_endProvisioningFlowWithError:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext alloc] initWithRequestContext:v6];

  [(NPKPaymentProvisioningFlowControllerProvisioningResultStepContext *)v8 setCardAdded:0];
  [(NPKPaymentProvisioningFlowControllerProvisioningResultStepContext *)v8 setError:v7];

  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:220 withContext:v8];
}

- (void)_performTransitionToStep:(int)a3 withContext:(id)a4
{
  id v21 = a4;
  if (([v21 allowsAddLater] & 1) == 0
    && NPKPaymentProvisioningSetupContextIsSetupAssistant(self->_setupContext))
  {
    [v21 setAllowsAddLater:1];
  }
  if (((a3 - 100) > 0x39 || ((1 << (a3 - 100)) & 0x200000000100401) == 0)
    && a3 != 220)
  {
    if (a3 == 210 && (chooseCredentialsStepIdentifier = self->_immediatelyBeforeTermsStepIdentifier) != 0)
    {
      id v10 = v21;
    }
    else
    {
      BOOL v13 = v21;
      if (a3 != 190 || !self->_chooseCredentialsStepIdentifier)
      {
        if (a3 != 150 || (digitalIssuanceAmountRequestContext = self->_digitalIssuanceAmountRequestContext) == 0)
        {
LABEL_24:
          int v16 = [v13 backStepIdentifier];

          if (!v16)
          {
            uint64_t v17 = [v21 requestContext];
            __int16 v18 = [v17 currentStepIdentifier];
            [v21 setBackStepIdentifier:v18];
          }
          goto LABEL_6;
        }
        uint64_t v20 = [(NPKPaymentProvisioningFlowControllerRequestContext *)digitalIssuanceAmountRequestContext currentStepIdentifier];
        [v21 setBackStepIdentifier:v20];

LABEL_23:
        BOOL v13 = v21;
        goto LABEL_24;
      }
      id v14 = [v21 secondaryManualEntryStepContext];
      BOOL v15 = [v14 credential];

      BOOL v13 = v21;
      if (!v15) {
        goto LABEL_24;
      }
      chooseCredentialsStepIdentifier = self->_chooseCredentialsStepIdentifier;
      id v10 = v21;
    }
    [v10 setBackStepIdentifier:chooseCredentialsStepIdentifier];
    goto LABEL_23;
  }
LABEL_6:
  uint64_t currentStep = self->_currentStep;
  self->_uint64_t currentStep = a3;
  if (a3 == 200)
  {
    id v8 = [v21 requestContext];
    uint64_t v11 = [v8 currentStepIdentifier];
    immediatelyBeforeTermsStepIdentifier = self->_immediatelyBeforeTermsStepIdentifier;
    self->_immediatelyBeforeTermsStepIdentifier = v11;
  }
  else
  {
    if (a3 != 140) {
      goto LABEL_15;
    }
    id v7 = [v21 stepIdentifier];
    id v8 = self->_chooseCredentialsStepIdentifier;
    self->_chooseCredentialsStepIdentifier = v7;
  }

LABEL_15:
  [(NPKPaymentProvisioningFlowController *)self _sendDidTransitionFromStep:currentStep toStep:self->_currentStep withContext:v21];
}

- (void)_sendDidTransitionFromStep:(int)a3 toStep:(int)a4 withContext:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = (__CFString *)a5;
  BOOL v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    uint64_t v11 = pk_Payment_log();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_118:

      goto LABEL_119;
    }
    if ((int)v6 > 179)
    {
      if ((int)v6 <= 209)
      {
        switch((int)v6)
        {
          case 190:
            int v12 = @"SecondaryManualEntry";
            break;
          case 191:
          case 194:
          case 196:
          case 198:
          case 199:
            goto LABEL_58;
          case 192:
            int v12 = @"LocalDeviceManualEntry";
            break;
          case 193:
            int v12 = @"LocalDeviceManualEntryProgress";
            break;
          case 195:
            int v12 = @"ProductDisambiguation";
            break;
          case 197:
            int v12 = @"PasscodeUpgrade";
            break;
          case 200:
            int v12 = @"TermsAndConditions";
            break;
          default:
            if (v6 != 180) {
              goto LABEL_58;
            }
            int v12 = @"ManualEntry";
            break;
        }
LABEL_59:
        BOOL v13 = v12;
        if ((int)v5 > 179)
        {
          if ((int)v5 <= 209)
          {
            switch((int)v5)
            {
              case 190:
                id v14 = @"SecondaryManualEntry";
                break;
              case 191:
              case 194:
              case 196:
              case 198:
              case 199:
                goto LABEL_114;
              case 192:
                id v14 = @"LocalDeviceManualEntry";
                break;
              case 193:
                id v14 = @"LocalDeviceManualEntryProgress";
                break;
              case 195:
                id v14 = @"ProductDisambiguation";
                break;
              case 197:
                id v14 = @"PasscodeUpgrade";
                break;
              case 200:
                id v14 = @"TermsAndConditions";
                break;
              default:
                if (v5 != 180) {
                  goto LABEL_114;
                }
                id v14 = @"ManualEntry";
                break;
            }
            goto LABEL_115;
          }
          if ((int)v5 <= 239)
          {
            switch(v5)
            {
              case 0xD2:
                id v14 = @"ProvisioningProgress";
                goto LABEL_115;
              case 0xDC:
                id v14 = @"ProvisioningResult";
                goto LABEL_115;
              case 0xE6:
                id v14 = @"IssuerVerificationChannels";
                goto LABEL_115;
            }
            goto LABEL_114;
          }
          if ((int)v5 > 259)
          {
            if (v5 == 260)
            {
              id v14 = @"AppleBalanceAccountDetails";
              goto LABEL_115;
            }
            if (v5 == 300)
            {
              id v14 = @"GetIssuerApplicationAddRequest";
              goto LABEL_115;
            }
            goto LABEL_114;
          }
          if (v5 == 240)
          {
            id v14 = @"IssuerVerificationFields";
            goto LABEL_115;
          }
          if (v5 != 250) {
            goto LABEL_114;
          }
          id v14 = @"IssuerVerificationCode";
        }
        else
        {
          if ((int)v5 > 134)
          {
            if ((int)v5 <= 154)
            {
              switch((int)v5)
              {
                case 135:
                  id v14 = @"ChooseProduct";
                  break;
                case 137:
                  id v14 = @"ChooseTransitProduct";
                  break;
                case 138:
                  id v14 = @"ChooseEMoneyProduct";
                  break;
                case 140:
                  id v14 = @"ChooseCredentials";
                  break;
                case 144:
                  id v14 = @"ChooseTransitProductType";
                  break;
                case 145:
                  id v14 = @"ChooseServiceProviderProducts";
                  break;
                case 150:
                  id v14 = @"DigitalIssuanceAmount";
                  break;
                default:
                  goto LABEL_114;
              }
              goto LABEL_115;
            }
            if ((int)v5 > 159)
            {
              if (v5 == 160)
              {
                id v14 = @"ReaderModeEntry";
                goto LABEL_115;
              }
              if (v5 == 165)
              {
                id v14 = @"ReaderModeIngestion";
                goto LABEL_115;
              }
            }
            else
            {
              if (v5 == 155)
              {
                id v14 = @"DigitalIssuancePayment";
                goto LABEL_115;
              }
              if (v5 == 157)
              {
                id v14 = @"MoreInformation";
                goto LABEL_115;
              }
            }
LABEL_114:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
            id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_115;
          }
          if ((int)v5 > 119)
          {
            if (v5 == 120)
            {
              id v14 = @"Welcome";
              goto LABEL_115;
            }
            if (v5 == 130)
            {
              id v14 = @"ChooseFlow";
              goto LABEL_115;
            }
            goto LABEL_114;
          }
          if (v5 == 100)
          {
            id v14 = @"Initialized";
            goto LABEL_115;
          }
          if (v5 != 110) {
            goto LABEL_114;
          }
          id v14 = @"Preconditions";
        }
LABEL_115:
        BOOL v15 = @"<none>";
        *(_DWORD *)buf = 138412802;
        if (v8) {
          BOOL v15 = v8;
        }
        BOOL v19 = v13;
        __int16 v20 = 2112;
        id v21 = v14;
        __int16 v22 = 2112;
        id v23 = v15;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Flow controller change step from %@ to %@ with context: %@", buf, 0x20u);

        goto LABEL_118;
      }
      if ((int)v6 <= 239)
      {
        switch(v6)
        {
          case 0xD2:
            int v12 = @"ProvisioningProgress";
            goto LABEL_59;
          case 0xDC:
            int v12 = @"ProvisioningResult";
            goto LABEL_59;
          case 0xE6:
            int v12 = @"IssuerVerificationChannels";
            goto LABEL_59;
        }
      }
      else if ((int)v6 > 259)
      {
        if (v6 == 260)
        {
          int v12 = @"AppleBalanceAccountDetails";
          goto LABEL_59;
        }
        if (v6 == 300)
        {
          int v12 = @"GetIssuerApplicationAddRequest";
          goto LABEL_59;
        }
      }
      else
      {
        if (v6 == 240)
        {
          int v12 = @"IssuerVerificationFields";
          goto LABEL_59;
        }
        if (v6 == 250)
        {
          int v12 = @"IssuerVerificationCode";
          goto LABEL_59;
        }
      }
    }
    else if ((int)v6 <= 134)
    {
      if ((int)v6 > 119)
      {
        if (v6 == 120)
        {
          int v12 = @"Welcome";
          goto LABEL_59;
        }
        if (v6 == 130)
        {
          int v12 = @"ChooseFlow";
          goto LABEL_59;
        }
      }
      else
      {
        if (v6 == 100)
        {
          int v12 = @"Initialized";
          goto LABEL_59;
        }
        if (v6 == 110)
        {
          int v12 = @"Preconditions";
          goto LABEL_59;
        }
      }
    }
    else
    {
      if ((int)v6 <= 154)
      {
        switch((int)v6)
        {
          case 135:
            int v12 = @"ChooseProduct";
            break;
          case 137:
            int v12 = @"ChooseTransitProduct";
            break;
          case 138:
            int v12 = @"ChooseEMoneyProduct";
            break;
          case 140:
            int v12 = @"ChooseCredentials";
            break;
          case 144:
            int v12 = @"ChooseTransitProductType";
            break;
          case 145:
            int v12 = @"ChooseServiceProviderProducts";
            break;
          case 150:
            int v12 = @"DigitalIssuanceAmount";
            break;
          default:
            goto LABEL_58;
        }
        goto LABEL_59;
      }
      if ((int)v6 > 159)
      {
        if (v6 == 160)
        {
          int v12 = @"ReaderModeEntry";
          goto LABEL_59;
        }
        if (v6 == 165)
        {
          int v12 = @"ReaderModeIngestion";
          goto LABEL_59;
        }
      }
      else
      {
        if (v6 == 155)
        {
          int v12 = @"DigitalIssuancePayment";
          goto LABEL_59;
        }
        if (v6 == 157)
        {
          int v12 = @"MoreInformation";
          goto LABEL_59;
        }
      }
    }
LABEL_58:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
LABEL_119:
  int v16 = NPKAnalyticsEventForProvisioningFlowStepTransition(v6, v5, v8);
  [MEMORY[0x263F5BD40] subject:@"provisioning" sendEvent:v16];
  uint64_t v17 = [(NPKPaymentProvisioningFlowController *)self delegate];
  [v17 paymentProvisioningFlowController:self didTransitionFromStep:v6 toStep:v5 withContext:v8];
}

- (void)_sendDidEncounterError:(id)a3 requestContext:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Flow controller encountered error: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  if (v6)
  {
    uint64_t v11 = (void *)MEMORY[0x263F5BD40];
    int v12 = NPKAnalyticsEventForError(@"nonFatalError", v6);
    [v11 subject:@"provisioning" sendEvent:v12];
  }
  BOOL v13 = [(NPKPaymentProvisioningFlowController *)self delegate];
  [v13 paymentProvisioningFlowController:self didEncounterError:v6 requestContext:v7];
}

- (id)_requiredFieldsFromRequirementsResponseExcludingLocalFields
{
  uint64_t v3 = [(NPKPaymentProvisioningFlowController *)self _requiredFieldsFromRequirementsResponse];
  uint64_t v4 = v3;
  if (self->_separateLocalDeviceEntryRequired)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __99__NPKPaymentProvisioningFlowController__requiredFieldsFromRequirementsResponseExcludingLocalFields__block_invoke;
    v11[3] = &unk_2644D4060;
    void v11[4] = self;
    uint64_t v5 = objc_msgSend(v3, "pk_objectsPassingTest:", v11);
    if ((PKEqualObjects() & 1) == 0)
    {
      id v6 = pk_Payment_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        id v8 = pk_Payment_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v10 = 0;
          _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Filtered required fields based on local device entry requirement", v10, 2u);
        }
      }
    }

    uint64_t v4 = (void *)v5;
  }
  return v4;
}

uint64_t __99__NPKPaymentProvisioningFlowController__requiredFieldsFromRequirementsResponseExcludingLocalFields__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fieldRequiresLocalEntry:a2] ^ 1;
}

- (id)_localRequiredFieldsFromRequirementsResponse
{
  if (self->_separateLocalDeviceEntryRequired)
  {
    uint64_t v3 = [(NPKPaymentProvisioningFlowController *)self _requiredFieldsFromRequirementsResponse];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __84__NPKPaymentProvisioningFlowController__localRequiredFieldsFromRequirementsResponse__block_invoke;
    v6[3] = &unk_2644D4060;
    void v6[4] = self;
    uint64_t v4 = objc_msgSend(v3, "pk_objectsPassingTest:", v6);
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }
  return v4;
}

uint64_t __84__NPKPaymentProvisioningFlowController__localRequiredFieldsFromRequirementsResponse__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fieldRequiresLocalEntry:a2];
}

- (BOOL)_fieldsModelCompleteExceptForLocalFields:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_separateLocalDeviceEntryRequired)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = v4;
    uint64_t v5 = [v4 paymentSetupFields];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      char v8 = 0;
      char v9 = 0;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v5);
          }
          int v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (([v12 submissionStringMeetsAllRequirements] & 1) == 0)
          {
            BOOL v13 = pk_Payment_log();
            BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

            if (v14)
            {
              id v15 = pk_Payment_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v16 = [v12 identifier];
                BOOL v17 = [(NPKPaymentProvisioningFlowController *)self _fieldRequiresLocalEntry:v12];
                *(_DWORD *)buf = 138412546;
                *(void *)uint64_t v30 = v16;
                *(_WORD *)&v30[8] = 1024;
                v31[0] = v17;
                _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Field %@ is incomplete requires local entry %d", buf, 0x12u);
              }
            }
            BOOL v18 = [(NPKPaymentProvisioningFlowController *)self _fieldRequiresLocalEntry:v12];
            v8 |= !v18;
            v9 |= v18;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v7);
    }
    else
    {
      char v8 = 0;
      char v9 = 0;
    }

    char v19 = v9 & (v8 ^ 1);
    __int16 v20 = pk_Payment_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      __int16 v22 = pk_Payment_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)uint64_t v30 = v19 & 1;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = v9 & 1;
        LOWORD(v31[0]) = 1024;
        *(_DWORD *)((char *)v31 + 2) = v8 & 1;
        _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Complete except for local fields %d local %d non local %d", buf, 0x14u);
      }
    }
    id v4 = v24;
  }
  else
  {
    char v19 = 0;
  }

  return v19 & 1;
}

- (BOOL)_fieldRequiresLocalEntry:(id)a3
{
  uint64_t v3 = [a3 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F5C790]];

  return v4;
}

- (id)_filteredPaymentSetupFields:(id)a3 forLocalDeviceEntry:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_separateLocalDeviceEntryRequired)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __88__NPKPaymentProvisioningFlowController__filteredPaymentSetupFields_forLocalDeviceEntry___block_invoke;
    v11[3] = &unk_2644D4088;
    void v11[4] = self;
    BOOL v12 = a4;
    objc_msgSend(v6, "pk_objectsPassingTest:", v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v6;
  }
  char v9 = v8;

  return v9;
}

BOOL __88__NPKPaymentProvisioningFlowController__filteredPaymentSetupFields_forLocalDeviceEntry___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a1 + 40) == [*(id *)(a1 + 32) _fieldRequiresLocalEntry:a2];
}

- (id)_requiredFieldsFromRequirementsResponse
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PKPaymentProvisioningController *)self->_provisioningController requirementsResponse];
  char v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v3 status];
      id v8 = [(PKPaymentProvisioningController *)self->_provisioningController productIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v26 = v7;
      __int16 v27 = 2112;
      long long v28 = v8;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Determining required fields for response status %ld and product identifier %@", buf, 0x16u);
    }
  }
  if ([v3 status] == 1)
  {
    char v9 = [v3 requiredPaymentSetupFields];
  }
  else if ([v3 status] == 2 {
         && ([(PKPaymentProvisioningController *)self->_provisioningController productIdentifier],
  }
             uint64_t v10 = objc_claimAutoreleasedReturnValue(),
             v10,
             v10))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = objc_msgSend(v3, "possibleProducts", 0);
    id v12 = (id)[v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v16 = [v15 productIdentifier];
          BOOL v17 = [(PKPaymentProvisioningController *)self->_provisioningController productIdentifier];
          int v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            id v12 = v15;
            goto LABEL_20;
          }
        }
        id v12 = (id)[v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    char v9 = [v12 requiredFields];
  }
  else
  {
    char v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

- (void)_configureWebServiceIfNecessary:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 needsConfiguration])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke;
    v12[3] = &unk_2644D40D8;
    uint64_t v7 = &v13;
    id v13 = v6;
    id v8 = v6;
    [v5 configurePaymentServiceWithCompletion:v12];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke_3;
    v10[3] = &unk_2644D2B10;
    uint64_t v7 = &v11;
    id v11 = v6;
    id v9 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke_2;
  block[3] = &unk_2644D40B0;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_verifyPasscodeStateIfNecessaryWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

- (void)_requestPassDetailsForAccountCredential:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  id v8 = [v6 passDetailsResponse];

  if (v8)
  {
    if (v7)
    {
      id v9 = [v6 passDetailsResponse];
      v7[2](v7, v9, 0);
    }
  }
  else
  {
    provisioningController = self->_provisioningController;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __102__NPKPaymentProvisioningFlowController__requestPassDetailsForAccountCredential_withCompletionHandler___block_invoke;
    v11[3] = &unk_2644D4128;
    id v13 = v7;
    id v12 = v6;
    [(PKPaymentProvisioningController *)provisioningController setupAccountCredentialForProvisioning:v12 completion:v11];
  }
}

void __102__NPKPaymentProvisioningFlowController__requestPassDetailsForAccountCredential_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__NPKPaymentProvisioningFlowController__requestPassDetailsForAccountCredential_withCompletionHandler___block_invoke_2;
  block[3] = &unk_2644D4100;
  id v9 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v8 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __102__NPKPaymentProvisioningFlowController__requestPassDetailsForAccountCredential_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) passDetailsResponse];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v3, *(void *)(a1 + 40));
  }
}

- (NPKFidoAuthCoordinator)fidoAuthCoordinator
{
  fidoAuthCoordinator = self->_fidoAuthCoordinator;
  if (!fidoAuthCoordinator)
  {
    id v4 = objc_alloc_init(NPKFidoAuthCoordinator);
    id v5 = self->_fidoAuthCoordinator;
    self->_fidoAuthCoordinator = v4;

    fidoAuthCoordinator = self->_fidoAuthCoordinator;
  }
  return fidoAuthCoordinator;
}

- (NPKPaymentProvisioningFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKPaymentProvisioningFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (int64_t)setupContext
{
  return self->_setupContext;
}

- (BOOL)isReaderModeProvisioningSupported
{
  return self->_readerModeProvisioningSupported;
}

- (void)setReaderModeProvisioningSupported:(BOOL)a3
{
  self->_readerModeProvisioningSupported = a3;
}

- (BOOL)isDigitalIssuanceSupported
{
  return self->_digitalIssuanceSupported;
}

- (void)setDigitalIssuanceSupported:(BOOL)a3
{
  self->_digitalIssuanceSupported = a3;
}

- (BOOL)isSeparateLocalDeviceEntryRequired
{
  return self->_separateLocalDeviceEntryRequired;
}

- (void)setSeparateLocalDeviceEntryRequired:(BOOL)a3
{
  self->_separateLocalDeviceEntryRequired = a3;
}

- (PKPaymentAuthorizationController)unitTestingAuthorizationController
{
  return self->_unitTestingAuthorizationController;
}

- (void)setUnitTestingAuthorizationController:(id)a3
{
}

- (PKContactlessCardIngester)unitTestingCardIngester
{
  return self->_unitTestingCardIngester;
}

- (void)setUnitTestingCardIngester:(id)a3
{
}

- (PKAddPaymentPassRequestConfiguration)inAppProvisioningRequestConfiguration
{
  return self->_inAppProvisioningRequestConfiguration;
}

- (void)setInAppProvisioningRequestConfiguration:(id)a3
{
}

- (PKAddPaymentPassRequest)inAppProvisioningRequest
{
  return self->_inAppProvisioningRequest;
}

- (void)setInAppProvisioningRequest:(id)a3
{
}

- (NSData)inAppProvisioningPublicKeyHash
{
  return self->_inAppProvisioningPublicKeyHash;
}

- (void)setInAppProvisioningPublicKeyHash:(id)a3
{
}

- (NSData)inAppProvisioningNonce
{
  return self->_inAppProvisioningNonce;
}

- (void)setInAppProvisioningNonce:(id)a3
{
}

- (OS_dispatch_source)inAppProvisioningGetRequestTimer
{
  return self->_inAppProvisioningGetRequestTimer;
}

- (void)setInAppProvisioningGetRequestTimer:(id)a3
{
}

- (void)setFidoAuthCoordinator:(id)a3
{
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
}

- (int)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(int)a3
{
  self->_uint64_t currentStep = a3;
}

- (NPKPaymentProvisioningFlowControllerPreconditionsStepContext)preconditionsRequestContext
{
  return self->_preconditionsRequestContext;
}

- (void)setPreconditionsRequestContext:(id)a3
{
}

- (NSString)chooseCredentialsStepIdentifier
{
  return self->_chooseCredentialsStepIdentifier;
}

- (void)setChooseCredentialsStepIdentifier:(id)a3
{
}

- (NSString)immediatelyBeforeTermsStepIdentifier
{
  return self->_immediatelyBeforeTermsStepIdentifier;
}

- (void)setImmediatelyBeforeTermsStepIdentifier:(id)a3
{
}

- (PKPaymentSetupFieldsModel)fieldsModel
{
  return self->_fieldsModel;
}

- (void)setFieldsModel:(id)a3
{
}

- (NSObject)progressNotificationToken
{
  return self->_progressNotificationToken;
}

- (void)setProgressNotificationToken:(id)a3
{
}

- (NPKPaymentProvisioningFlowControllerRequestContext)provisioningProgressRequestContext
{
  return self->_provisioningProgressRequestContext;
}

- (void)setProvisioningProgressRequestContext:(id)a3
{
}

- (PKPaymentPass)issuerVerificationPass
{
  return self->_issuerVerificationPass;
}

- (void)setIssuerVerificationPass:(id)a3
{
}

- (PKPaymentCredential)currentCredential
{
  return self->_currentCredential;
}

- (void)setCurrentCredential:(id)a3
{
}

- (PKAppleBalanceCredential)currentAppleBalanceCredential
{
  return self->_currentAppleBalanceCredential;
}

- (void)setCurrentAppleBalanceCredential:(id)a3
{
}

- (PKPaymentSetupProduct)currentProduct
{
  return self->_currentProduct;
}

- (void)setCurrentProduct:(id)a3
{
}

- (unint64_t)termsReason
{
  return self->_termsReason;
}

- (void)setTermsReason:(unint64_t)a3
{
  self->_unint64_t termsReason = a3;
}

- (BOOL)termsAcceptedOutOfBand
{
  return self->_termsAcceptedOutOfBand;
}

- (void)setTermsAcceptedOutOfBand:(BOOL)a3
{
  self->_BOOL termsAcceptedOutOfBand = a3;
}

- (PKPaymentRequest)digitalIssuancePaymentRequest
{
  return self->_digitalIssuancePaymentRequest;
}

- (void)setDigitalIssuancePaymentRequest:(id)a3
{
}

- (NSDecimalNumber)digitalIssuanceAmount
{
  return self->_digitalIssuanceAmount;
}

- (void)setDigitalIssuanceAmount:(id)a3
{
}

- (PKServiceProviderPurchase)digitalIssuancePurchase
{
  return self->_digitalIssuancePurchase;
}

- (void)setDigitalIssuancePurchase:(id)a3
{
}

- (NPKPaymentProvisioningFlowControllerRequestContext)digitalIssuanceAmountRequestContext
{
  return self->_digitalIssuanceAmountRequestContext;
}

- (void)setDigitalIssuanceAmountRequestContext:(id)a3
{
}

- (NPKPaymentProvisioningFlowControllerRequestContext)digitalIssuancePaymentRequestContext
{
  return self->_digitalIssuancePaymentRequestContext;
}

- (void)setDigitalIssuancePaymentRequestContext:(id)a3
{
}

- (PKPaymentAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (void)setAuthorizationController:(id)a3
{
}

- (PKContactlessCardIngester)cardIngester
{
  return self->_cardIngester;
}

- (void)setCardIngester:(id)a3
{
}

- (unint64_t)internalIngestionState
{
  return self->_internalIngestionState;
}

- (void)setInternalIngestionState:(unint64_t)a3
{
  self->_internalIngestionState = a3;
}

- (unint64_t)flowIngestionState
{
  return self->_flowIngestionState;
}

- (void)setFlowIngestionState:(unint64_t)a3
{
  self->_flowIngestionState = a3;
}

- (double)ingestionProgress
{
  return self->_ingestionProgress;
}

- (void)setIngestionProgress:(double)a3
{
  self->_ingestionProgress = a3;
}

- (unint64_t)ingestionStateOnRetry
{
  return self->_ingestionStateOnRetry;
}

- (void)setIngestionStateOnRetry:(unint64_t)a3
{
  self->_ingestionStateOnRetry = a3;
}

- (NSString)ingestionCardSessionToken
{
  return self->_ingestionCardSessionToken;
}

- (void)setIngestionCardSessionToken:(id)a3
{
}

- (OS_dispatch_source)ingestionCardNotFoundTimer
{
  return self->_ingestionCardNotFoundTimer;
}

- (void)setIngestionCardNotFoundTimer:(id)a3
{
}

- (PKPaymentProvisioningMethodMetadata)ingestionMethodMetadata
{
  return self->_ingestionMethodMetadata;
}

- (void)setIngestionMethodMetadata:(id)a3
{
}

- (NPKPaymentProvisioningFlowControllerRequestContext)readerModeRequestContext
{
  return self->_readerModeRequestContext;
}

- (void)setReaderModeRequestContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerModeRequestContext, 0);
  objc_storeStrong((id *)&self->_ingestionMethodMetadata, 0);
  objc_storeStrong((id *)&self->_ingestionCardNotFoundTimer, 0);
  objc_storeStrong((id *)&self->_ingestionCardSessionToken, 0);
  objc_storeStrong((id *)&self->_cardIngester, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
  objc_storeStrong((id *)&self->_digitalIssuancePaymentRequestContext, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceAmountRequestContext, 0);
  objc_storeStrong((id *)&self->_digitalIssuancePurchase, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceAmount, 0);
  objc_storeStrong((id *)&self->_digitalIssuancePaymentRequest, 0);
  objc_storeStrong((id *)&self->_currentProduct, 0);
  objc_storeStrong((id *)&self->_currentAppleBalanceCredential, 0);
  objc_storeStrong((id *)&self->_currentCredential, 0);
  objc_storeStrong((id *)&self->_issuerVerificationPass, 0);
  objc_storeStrong((id *)&self->_provisioningProgressRequestContext, 0);
  objc_storeStrong((id *)&self->_progressNotificationToken, 0);
  objc_storeStrong((id *)&self->_fieldsModel, 0);
  objc_storeStrong((id *)&self->_immediatelyBeforeTermsStepIdentifier, 0);
  objc_storeStrong((id *)&self->_chooseCredentialsStepIdentifier, 0);
  objc_storeStrong((id *)&self->_preconditionsRequestContext, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_fidoAuthCoordinator, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningGetRequestTimer, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningNonce, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningPublicKeyHash, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningRequest, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_unitTestingCardIngester, 0);
  objc_storeStrong((id *)&self->_unitTestingAuthorizationController, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)_flowPickerSectionsWithContext:(int64_t)a3 provisioningController:(id)a4 readerModeSupported:(BOOL)a5 digitalIssuanceSupported:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = [v10 webService];
  id v12 = PKCurrentMobileCarrierRegion();
  id v13 = [v10 paymentSetupProductModel];
  LOBYTE(v22) = a6;
  BOOL v14 = [a1 _filteredPaymentSetupProducts:v13 localCredentials:0 setupContext:a3 webService:v11 mobileCarrierRegion:v12 readerModeSupported:v7 digitalIssuanceSupported:v22];

  id v15 = [MEMORY[0x263EFF980] array];
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__7;
  uint64_t v30 = __Block_byref_object_dispose__7;
  id v31 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __154__NPKPaymentProvisioningFlowController_FlowSelection___flowPickerSectionsWithContext_provisioningController_readerModeSupported_digitalIssuanceSupported___block_invoke;
  v23[3] = &unk_2644D45D0;
  long long v25 = &v26;
  id v16 = v15;
  id v24 = v16;
  BOOL v17 = (void *)MEMORY[0x223C37380](v23);
  [(id)objc_opt_class() _addGroupedItemsToSections:v16 fromModel:v14 webService:v11 paymentSection:v17];
  [(id)objc_opt_class() _addAppleBalanceToSections:v16 fromModel:v14];
  if ([v16 count]) {
    [(id)objc_opt_class() _addCreditDebitItemToSection:v17 webService:v11];
  }
  if (v27[5])
  {
    int v18 = [v16 firstObject];
    char v19 = (void *)v27[5];

    if (v18 != v19)
    {
      [v16 removeObject:v27[5]];
      [v16 insertObject:v27[5] atIndex:0];
    }
  }
  id v20 = v16;

  _Block_object_dispose(&v26, 8);
  return v20;
}

id __154__NPKPaymentProvisioningFlowController_FlowSelection___flowPickerSectionsWithContext_provisioningController_readerModeSupported_digitalIssuanceSupported___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    id v3 = PKLocalizedPaymentString(&cfstr_CardTypePaymen.isa);
    uint64_t v4 = +[NPKPaymentProvisioningFlowPickerSection sectionWithTitle:v3 productType:&unk_26D043868];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    BOOL v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) title];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Added products section with title: %@", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return v2;
}

+ (id)_filteredPaymentSetupProducts:(id)a3 localCredentials:(id)a4 setupContext:(int64_t)a5 webService:(id)a6 mobileCarrierRegion:(id)a7 readerModeSupported:(BOOL)a8 digitalIssuanceSupported:(BOOL)a9
{
  LODWORD(v18) = a8;
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v60 = a4;
  id v14 = a6;
  id v15 = a7;
  long long v66 = [MEMORY[0x263EFF980] array];
  id v16 = PKOSVersion();
  long long v73 = PKDeviceClass();
  long long v59 = v14;
  BOOL v17 = [v14 targetDevice];
  long long v71 = [v17 deviceRegion];
  uint64_t v18 = v18;
  int64_t v67 = a5;
  if (a9 && !NPKPaymentProvisioningSetupContextIsSetupAssistant(a5)) {
    uint64_t v18 = v18 | 2;
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v61 = v13;
  id obj = [v13 allSetupProducts];
  uint64_t v19 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v79;
    long long v68 = v16;
    id v69 = v15;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v79 != v21) {
          objc_enumerationMutation(obj);
        }
        long long v23 = *(void **)(*((void *)&v78 + 1) + 8 * v22);
        if (([v23 supportsOSVersion:v16 deviceClass:v73] & 1) == 0)
        {
          __int16 v27 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = [v23 displayName];
            *(_DWORD *)buf = 138412290;
            uint64_t v84 = v28;
            uint64_t v29 = v27;
            uint64_t v30 = "Product: %@ is not supported due to device OS version";
            uint32_t v31 = 12;
            goto LABEL_14;
          }
LABEL_15:
          int v26 = 0;
LABEL_16:

          goto LABEL_17;
        }
        id v24 = [v23 configuration];
        uint64_t v25 = [v24 type];

        if (v25 != 3)
        {
          if (v71)
          {
            __int16 v27 = [v23 regions];
            if ([v27 containsObject:v71])
            {
              int v26 = 1;
              long long v70 = v27;
              goto LABEL_16;
            }
            if (!v15)
            {

              long long v70 = v27;
LABEL_70:
              __int16 v27 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v28 = [v23 displayName];
                *(_DWORD *)buf = 138412802;
                uint64_t v84 = v28;
                __int16 v85 = 2112;
                uint64_t v86 = (uint64_t)v71;
                __int16 v87 = 2112;
                uint64_t v88 = (uint64_t)v15;
                uint64_t v29 = v27;
                uint64_t v30 = "Product: %@ is not supported in neither this device region: %@, nor mobile carrier region: %@";
                uint32_t v31 = 32;
LABEL_14:
                _os_log_impl(&dword_21E92F000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, v31);
              }
              goto LABEL_15;
            }
            long long v70 = v27;
          }
          else if (!v15)
          {
            goto LABEL_70;
          }
          int v47 = [v23 regions];
          char v48 = [v47 containsObject:v15];

          if (v71) {
          if ((v48 & 1) == 0)
          }
            goto LABEL_70;
        }
        int v26 = 1;
LABEL_17:
        uint64_t v32 = [v23 supportedProvisioningMethods];
        if (v26 && (v32 & v18) == 0)
        {
          uint64_t v33 = PKLogFacilityTypeGetObject();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_58;
          }
          long long v34 = [v23 displayName];
          uint64_t v35 = [v23 supportedProvisioningMethods];
          *(_DWORD *)buf = 138412802;
          uint64_t v84 = v34;
          __int16 v85 = 2048;
          uint64_t v86 = v18;
          __int16 v87 = 2048;
          uint64_t v88 = v35;
          uint64_t v36 = v33;
          int v37 = "Product: %@ is not supported due to no matching provisioning methods (local supported methods %lu, produ"
                "ct supported methods %lu)";
          uint32_t v38 = 32;
          goto LABEL_57;
        }
        if ((v26 & 1) == 0)
        {
          uint64_t v33 = PKLogFacilityTypeGetObject();
          goto LABEL_59;
        }
        if (([v23 allSupportedProtocols] & 4) != 0)
        {
          int IsAvailable = PKFelicaSecureElementIsAvailable();
          uint64_t v33 = PKLogFacilityTypeGetObject();
          BOOL v40 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
          if (!IsAvailable)
          {
            if (!v40) {
              goto LABEL_58;
            }
            long long v34 = [v23 displayName];
            *(_DWORD *)buf = 138412290;
            uint64_t v84 = v34;
            uint64_t v36 = v33;
            int v37 = "Product: %@ is not supported due to lack of Type F support";
            goto LABEL_56;
          }
          if (v40)
          {
            v41 = [v23 displayName];
            *(_DWORD *)buf = 138412290;
            uint64_t v84 = v41;
            _os_log_impl(&dword_21E92F000, v33, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to available Type F support", buf, 0xCu);
          }
        }
        if (!PKSecureElementIsAvailable())
        {
          uint64_t v33 = PKLogFacilityTypeGetObject();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_58;
          }
          long long v34 = [v23 displayName];
          *(_DWORD *)buf = 138412290;
          uint64_t v84 = v34;
          uint64_t v36 = v33;
          int v37 = "Product: %@ is not supported due to lack of SE";
LABEL_56:
          uint32_t v38 = 12;
LABEL_57:
          _os_log_impl(&dword_21E92F000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, v38);

          goto LABEL_58;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_38;
        }
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v42 = [v23 paymentOptions];
        uint64_t v43 = [v42 countByEnumeratingWithState:&v74 objects:v82 count:16];
        if (!v43)
        {
LABEL_37:

          id v16 = v68;
          id v15 = v69;
LABEL_38:
          uint64_t v33 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            long long v34 = [v23 displayName];
            *(_DWORD *)buf = 138412290;
            uint64_t v84 = v34;
            uint64_t v36 = v33;
            int v37 = "Product: %@ is not supported on device";
            goto LABEL_56;
          }
LABEL_58:

LABEL_59:
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v49 = [v23 displayName];
            *(_DWORD *)buf = 138412290;
            uint64_t v84 = v49;
            _os_log_impl(&dword_21E92F000, v33, OS_LOG_TYPE_DEFAULT, "Product: %@ is unsupported and will not be shown in the flow picker", buf, 0xCu);
          }
          goto LABEL_61;
        }
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v75;
LABEL_31:
        uint64_t v46 = 0;
        while (1)
        {
          if (*(void *)v75 != v45) {
            objc_enumerationMutation(v42);
          }
          if (objc_msgSend(v17, "supportsCredentialType:", objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * v46), "cardType")))break; {
          if (v44 == ++v46)
          }
          {
            uint64_t v44 = [v42 countByEnumeratingWithState:&v74 objects:v82 count:16];
            if (v44) {
              goto LABEL_31;
            }
            goto LABEL_37;
          }
        }

        if (v67 == 1 && [v23 hsa2Requirement] == 2 && (objc_msgSend(a1, "_isHSA2Enabled") & 1) == 0)
        {
          uint64_t v33 = PKLogFacilityTypeGetObject();
          id v16 = v68;
          id v15 = v69;
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_58;
          }
          long long v34 = [v23 displayName];
          *(_DWORD *)buf = 138412290;
          uint64_t v84 = v34;
          uint64_t v36 = v33;
          int v37 = "Product: %@ is not supported in setup context due to HSA requirement";
          goto LABEL_56;
        }
        id v50 = [v23 configuration];
        uint64_t v51 = [v50 state];

        id v16 = v68;
        id v15 = v69;
        if (v51 == 2)
        {
          uint64_t v33 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v63 = [v23 displayName];
            id v64 = [v23 configuration];
            [v64 state];
            v52 = PKPaymentSetupProductStateToString();
            *(_DWORD *)buf = 138412546;
            uint64_t v84 = v63;
            __int16 v85 = 2112;
            uint64_t v86 = (uint64_t)v52;
            _os_log_impl(&dword_21E92F000, v33, OS_LOG_TYPE_DEFAULT, "Product: %@ not supported. Product state is: %@. Previously provisioned to device?", buf, 0x16u);
          }
          goto LABEL_58;
        }
        uint64_t v33 = v23;
        BOOL v53 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          long long v65 = [v33 displayName];
          uint64_t v54 = [v33 productIdentifier];
          long long v55 = [v33 provisioningMethodTypes];
          *(_DWORD *)buf = 138412802;
          uint64_t v84 = v65;
          __int16 v85 = 2112;
          uint64_t v86 = (uint64_t)v54;
          __int16 v87 = 2112;
          uint64_t v88 = (uint64_t)v55;
          _os_log_impl(&dword_21E92F000, v53, OS_LOG_TYPE_DEFAULT, "Product: %@ (%@) is supported with provisioning types %@", buf, 0x20u);

          id v15 = v69;
        }

        [v66 addObject:v33];
LABEL_61:

        ++v22;
      }
      while (v22 != v20);
      uint64_t v56 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
      uint64_t v20 = v56;
    }
    while (v56);
  }

  id v57 = objc_alloc_init(MEMORY[0x263F5C0D8]);
  [v57 setPaymentSetupProducts:v66];

  return v57;
}

+ (void)_addGroupedItemsToSections:(id)a3 fromModel:(id)a4 webService:(id)a5 paymentSection:(id)a6
{
  v38[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v37[0] = &unk_26D043880;
  id v13 = PKLocalizedPaymentString(&cfstr_CardTypeTransi.isa);
  v38[0] = v13;
  v37[1] = &unk_26D043898;
  id v14 = PKLocalizedPaymentString(&cfstr_CardTypeEmoney.isa);
  v38[1] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

  v35[0] = &unk_26D043880;
  id v16 = PKLocalizedPaymentString(&cfstr_CardTypeTransi_0.isa);
  v35[1] = &unk_26D043898;
  v36[0] = v16;
  BOOL v17 = PKLocalizedPaymentString(&cfstr_PaymentSetupEm.isa);
  v36[1] = v17;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

  uint64_t v19 = [v11 targetDevice];
  uint64_t v20 = [v19 deviceRegion];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __118__NPKPaymentProvisioningFlowController_FlowSelection___addGroupedItemsToSections_fromModel_webService_paymentSection___block_invoke;
  v27[3] = &unk_2644D45F8;
  id v28 = v10;
  id v29 = v18;
  id v30 = v11;
  id v31 = v20;
  id v32 = &unk_26D043880;
  id v33 = v9;
  id v34 = v12;
  id v21 = v12;
  id v22 = v9;
  id v23 = v20;
  id v24 = v11;
  id v25 = v18;
  id v26 = v10;
  [v15 enumerateKeysAndObjectsUsingBlock:v27];
}

void __118__NPKPaymentProvisioningFlowController_FlowSelection___addGroupedItemsToSections_fromModel_webService_paymentSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = objc_msgSend(*(id *)(a1 + 32), "setupProductsOfType:", objc_msgSend(v5, "unsignedIntegerValue"));
  if (![v7 count])
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v5 unsignedIntegerValue];
      id v12 = PKPaymentSetupProductTypeToString();
      *(_DWORD *)buf = 138412290;
      BOOL v53 = v12;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Skipped products of type: %@. Not available setup products.", buf, 0xCu);
    }
    goto LABEL_29;
  }
  if ([v7 count] == 1)
  {
    id v8 = [v7 firstObject];
    id v9 = [v8 displayName];

    if ([v9 length])
    {
      id v10 = v9;

      id v6 = v10;
    }
    else
    {
      id v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [v5 unsignedIntegerValue];
        id v14 = PKPaymentSetupProductTypeToString();
        *(_DWORD *)buf = 138412290;
        BOOL v53 = v14;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Only one available product of type: %@ but no name for display. Using default for product type instead.", buf, 0xCu);
      }
    }
  }
  id v11 = [*(id *)(a1 + 40) objectForKey:v5];
  if (!v11)
  {
    [v5 unsignedIntegerValue];
    id v15 = PKPaymentSetupProductTypeToString();
    uint32_t v38 = +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:v15 title:v6 products:v7];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v20 items];
    [v36 addObject:v38];
    goto LABEL_28;
  }
  id v41 = v6;
  uint64_t v39 = v11;
  uint64_t v44 = v5;
  id v15 = +[NPKPaymentProvisioningFlowPickerSection sectionWithTitle:v11 productType:v5];
  id v16 = [*(id *)(a1 + 48) context];
  uint64_t v43 = a1;
  v42 = [v16 betaPaymentNetworksForRegion:*(void *)(a1 + 56)];

  BOOL v17 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"displayName" ascending:1];
  uint64_t v51 = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
  BOOL v40 = v7;
  uint64_t v19 = [v7 sortedArrayUsingDescriptors:v18];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (!v21) {
    goto LABEL_24;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v46;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v46 != v23) {
        objc_enumerationMutation(v20);
      }
      id v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      id v26 = [v25 productIdentifier];
      uint64_t v49 = v25;
      __int16 v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
      id v28 = +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:v26 products:v27];

      id v29 = [v15 footer];
      if (!v29 && [v44 isEqualToNumber:*(void *)(v43 + 64)])
      {
        id v30 = NSNumber;
        id v31 = [v25 paymentOptions];
        id v32 = [v31 firstObject];
        id v33 = objc_msgSend(v30, "numberWithInteger:", objc_msgSend(v32, "cardType"));
        int v34 = [v42 containsObject:v33];

        if (!v34) {
          goto LABEL_22;
        }
        id v29 = PKLocalizedPaymentString(&cfstr_CardTypeTransi_1.isa);
        [v15 setFooter:v29];
      }

LABEL_22:
      uint64_t v35 = [v15 items];
      [v35 addObject:v28];
    }
    uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v50 count:16];
  }
  while (v22);
LABEL_24:

  [*(id *)(v43 + 72) addObject:v15];
  uint64_t v36 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = [v15 title];
    *(_DWORD *)buf = 138412290;
    BOOL v53 = v37;
    _os_log_impl(&dword_21E92F000, v36, OS_LOG_TYPE_DEFAULT, "Added products section with title: %@", buf, 0xCu);
  }
  id v5 = v44;
  BOOL v7 = v40;
  id v6 = v41;
  id v11 = v39;
  uint32_t v38 = v42;
LABEL_28:

LABEL_29:
}

+ (void)_addAppleBalanceToSections:(id)a3 fromModel:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 productsForFeatureIdentifier:4];
  if ([v6 count])
  {
    BOOL v7 = [v6 firstObject];
    id v8 = [v7 displayName];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      PKLocalizedLynxString(&cfstr_AppleAccountTi.isa);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v11 = v10;

    id v12 = [v7 productIdentifier];
    v18[0] = v7;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v14 = +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:v12 products:v13];

    BOOL v17 = v14;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    id v16 = +[NPKPaymentProvisioningFlowPickerSection sectionWithTitle:v11 productType:&unk_26D0438B0 items:v15];

    [v5 addObject:v16];
  }
}

+ (void)_addCreditDebitItemToSection:(id)a3 webService:(id)a4
{
  uint64_t v4 = (void (**)(void))a3;
  if (PKDeviceSupportsFelicaDebitWithWebService()) {
    id v5 = @"CARD_TYPE_CREDIT_DEBIT";
  }
  else {
    id v5 = @"CARD_TYPE_CREDIT_PREPAID";
  }
  PKLocalizedPaymentString(&v5->isa);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:@"regularPaymentCardProvisioning" title:v9 products:0];
  BOOL v7 = v4[2](v4);

  id v8 = [v7 items];
  [v8 insertObject:v6 atIndex:0];
}

+ (id)_authContext
{
  id v2 = objc_alloc_init(MEMORY[0x263EFB210]);
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  uint64_t v4 = [MEMORY[0x263F290F0] sharedInstance];
  id v5 = [v4 altDSIDForAccount:v3];

  id v6 = objc_alloc_init(MEMORY[0x263F29110]);
  [v6 setAltDSID:v5];
  [v6 setSecurityUpgradeContext:*MEMORY[0x263F29088]];

  return v6;
}

+ (BOOL)_isHSA2Enabled
{
  id v3 = [MEMORY[0x263F290F0] sharedInstance];
  uint64_t v4 = [a1 _authContext];
  id v5 = [v4 altDSID];
  id v6 = [v3 authKitAccountWithAltDSID:v5];

  LOBYTE(v4) = (unint64_t)[v3 securityLevelForAccount:v6] > 3;
  return (char)v4;
}

+ (BOOL)_localCredentials:(id)a3 containProduct:(id)a4
{
  id v5 = a3;
  id v6 = [a4 paymentOptions];
  BOOL v7 = [v6 firstObject];

  uint64_t v8 = [v7 cardType];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__NPKPaymentProvisioningFlowController_FlowSelection___localCredentials_containProduct___block_invoke;
  v10[3] = &__block_descriptor_40_e29_B16__0__PKPaymentCredential_8l;
  void v10[4] = v8;
  LOBYTE(v6) = objc_msgSend(v5, "pk_containsObjectPassingTest:", v10);

  return (char)v6;
}

BOOL __88__NPKPaymentProvisioningFlowController_FlowSelection___localCredentials_containProduct___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return v2 == [a2 credentialType];
}

- (void)_transitionToDigitalIssuanceForProduct:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NPKPaymentProvisioningFlowController *)self setDigitalIssuanceAmountRequestContext:v6];
  id v15 = [[NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext alloc] initWithRequestContext:v6];

  [(NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext *)v15 setProduct:v7];
  -[NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext setAllowsReaderModeEntry:](v15, "setAllowsReaderModeEntry:", [(id)objc_opt_class() _readerModeEntryAllowedForProduct:v7]);
  uint64_t v8 = [v7 provisioningMethodMetadataForType:*MEMORY[0x263F5C738]];

  id v9 = [v8 digitalIssuanceMetadata];
  id v10 = [v9 serviceProviderProducts];
  id v11 = v10;
  if (!v10 || ![v10 count])
  {
LABEL_6:
    uint64_t v14 = 150;
    goto LABEL_7;
  }
  id v12 = [v9 balanceIdentifier];

  if (v12)
  {
    id v13 = [v9 balanceIdentifier];

    if (v13)
    {
      uint64_t v14 = 144;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v14 = 145;
LABEL_7:
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:v14 withContext:v15];
}

- (void)_handleDigitalIssuanceTermsAccepted:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Digital issuance terms accepted", buf, 2u);
    }
  }
  [(NPKPaymentProvisioningFlowController *)self setDigitalIssuancePaymentRequestContext:v4];
  [(NPKPaymentProvisioningFlowController *)self setTermsAcceptedOutOfBand:1];
  uint64_t v8 = [(NPKPaymentProvisioningFlowController *)self unitTestingAuthorizationController];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2050000000;
    id v11 = (void *)getPKPaymentAuthorizationControllerClass_softClass;
    uint64_t v27 = getPKPaymentAuthorizationControllerClass_softClass;
    if (!getPKPaymentAuthorizationControllerClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      uint64_t v21 = __getPKPaymentAuthorizationControllerClass_block_invoke;
      uint64_t v22 = &unk_2644D30F8;
      uint64_t v23 = &v24;
      __getPKPaymentAuthorizationControllerClass_block_invoke((uint64_t)buf);
      id v11 = (void *)v25[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v24, 8);
    id v13 = [v12 alloc];
    uint64_t v14 = [(NPKPaymentProvisioningFlowController *)self digitalIssuancePaymentRequest];
    id v10 = (id)[v13 initWithPaymentRequest:v14];
  }
  [(NPKPaymentProvisioningFlowController *)self setAuthorizationController:v10];
  [v10 setDelegate:self];
  [v10 setPrivateDelegate:self];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __93__NPKPaymentProvisioningFlowController_DigitalIssuance___handleDigitalIssuanceTermsAccepted___block_invoke;
  v16[3] = &unk_2644D3E38;
  id v17 = v4;
  uint64_t v18 = self;
  id v15 = v4;
  [v10 presentWithCompletion:v16];
}

void __93__NPKPaymentProvisioningFlowController_DigitalIssuance___handleDigitalIssuanceTermsAccepted___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__NPKPaymentProvisioningFlowController_DigitalIssuance___handleDigitalIssuanceTermsAccepted___block_invoke_2;
  block[3] = &unk_2644D3E10;
  char v8 = a2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __93__NPKPaymentProvisioningFlowController_DigitalIssuance___handleDigitalIssuanceTermsAccepted___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = [[NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext alloc] initWithRequestContext:*(void *)(a1 + 32)];
    uint64_t v2 = [*(id *)(a1 + 40) currentProduct];
    [(NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext *)v4 setProduct:v2];

    [*(id *)(a1 + 40) _performTransitionToStep:155 withContext:v4];
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    PKDisplayableErrorForCommonType();
    uint64_t v4 = (NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendDidEncounterError:requestContext:");
  }
}

- (void)_canMakeDigitalIssuancePaymentsForTransitProducts:(id)a3 withCompletion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v18 = a4;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;
  uint64_t v21 = [(NPKPaymentProvisioningFlowController *)self webService];
  char v8 = [v21 targetDevice];
  uint64_t v20 = [v8 deviceRegion];

  id v9 = [v19 sortedArrayUsingFunction:_compareProductByRegionCodes context:v20];
  uint64_t v23 = [MEMORY[0x263F5BF80] sharedInstance];
  id v10 = objc_alloc_init(MEMORY[0x263F5BD90]);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  void v37[2] = 0x2020000000;
  int v38 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v34;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * v13);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke;
        v29[3] = &unk_2644D4ED0;
        v29[4] = self;
        v29[5] = v14;
        id v30 = v23;
        id v31 = v39;
        id v32 = v37;
        [v10 addOperation:v29];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v11);
  }

  id v15 = [MEMORY[0x263EFF9D0] null];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke_3;
  v24[3] = &unk_2644D4EF8;
  uint64_t v28 = v7;
  uint64_t v26 = v37;
  uint64_t v27 = v39;
  id v16 = v18;
  id v25 = v16;
  id v17 = (id)[v10 evaluateWithInput:v15 completion:v24];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
}

void __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [*(id *)(a1 + 32) provisioningController];
  uint64_t v9 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke_2;
  v13[3] = &unk_2644D4EA8;
  void v13[4] = v9;
  id v10 = *(id *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 56);
  id v15 = v6;
  id v16 = v7;
  id v14 = v10;
  id v11 = v6;
  id v12 = v7;
  [v8 requestProvisioningMethodMetadataForProduct:v9 completionHandler:v13];
}

void __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke_2(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) provisioningMethodMetadataForType:*MEMORY[0x263F5C738]];
  if (v10)
  {
    uint64_t v2 = [v10 digitalIssuanceMetadata];
    id v3 = [v2 serviceProviderAcceptedNetworks];
    uint64_t v4 = [v2 serviceProviderCountryCode];
    id v5 = *(void **)(a1 + 40);
    id v6 = [MEMORY[0x263EFFA08] setWithArray:v3];
    id v7 = [v2 serviceProviderCapabilities];
    uint64_t v8 = PKMerchantCapabilityFromStrings();
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithObject:v4];
    LOBYTE(v5) = [v5 hasPassesWithSupportedNetworks:v6 merchantCapabilities:v8 issuerCountryCodes:v9 webDomain:0];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= v5;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v3 = v2;
  double v4 = *(double *)(a1 + 56);
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        uint64_t v9 = @"YES";
      }
      else {
        uint64_t v9 = @"NO";
      }
      int v11 = 136315906;
      id v12 = "-[NPKPaymentProvisioningFlowController(DigitalIssuance) _canMakeDigitalIssuancePaymentsForTransitProducts:wi"
            "thCompletion:]_block_invoke_3";
      __int16 v13 = 2048;
      double v14 = v3 - v4;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %s: completed in %f seconds, after %u products, hasCompatiblePass = %@", (uint8_t *)&v11, 0x26u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_canMakeDigitalIssuancePaymentsForTransitProductsWithCompletion:(id)a3
{
  double v3 = (void (**)(id, uint64_t, void))a3;
  PKInAppSupportedPaymentNetworks();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [MEMORY[0x263F5BF80] sharedInstance];
  id v5 = [MEMORY[0x263EFFA08] setWithArray:v7];
  uint64_t v6 = [v4 hasPassesWithSupportedNetworks:v5 merchantCapabilities:159 issuerCountryCodes:0 webDomain:0];

  v3[2](v3, v6, 0);
}

- (void)_startDigitalIssuancePaymentWithAmount:(id)a3 requestContext:(id)a4
{
}

- (void)_startDigitalIssuancePaymentWithAmount:(id)a3 requestContext:(id)a4 serviceProviderProduct:(id)a5 productItem:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v33 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = [(NPKPaymentProvisioningFlowController *)self currentProduct];
  double v14 = [v13 provisioningMethodMetadataForType:*MEMORY[0x263F5C738]];
  __int16 v15 = [v14 minLoadedBalance];
  int v16 = [v14 maxLoadedBalance];
  if (v15 && [v10 compare:v15] == -1)
  {
    id v32 = v12;
    id v29 = pk_Payment_log();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      uint64_t v19 = pk_Payment_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v10;
        __int16 v39 = 2112;
        char v40 = v15;
        uint64_t v20 = "Warning: Provided digital issuance amount %@ which is less than the minimum %@";
        goto LABEL_16;
      }
LABEL_17:
    }
LABEL_18:
    uint64_t v21 = v11;
    uint64_t v26 = PKDisplayableErrorForCommonType();
    id v31 = self;
    uint64_t v27 = v33;
    [(NPKPaymentProvisioningFlowController *)v31 _sendDidEncounterError:v26 requestContext:v33];
    uint64_t v23 = v32;
    goto LABEL_19;
  }
  if (v16 && [v10 compare:v16] == 1)
  {
    id v32 = v12;
    __int16 v17 = pk_Payment_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      uint64_t v19 = pk_Payment_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v10;
        __int16 v39 = 2112;
        char v40 = v16;
        uint64_t v20 = "Warning: Provided digital issuance amount %@ which is more than the maximum %@";
LABEL_16:
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v11 && v12)
  {
    uint64_t v21 = v11;
    id v22 = v11;
    uint64_t v23 = v12;
    uint64_t v24 = [(NPKPaymentProvisioningFlowController *)self _paymentRequestForAmount:v10 serviceProviderProduct:v22 productItem:v12];
  }
  else
  {
    uint64_t v21 = v11;
    uint64_t v23 = v12;
    uint64_t v24 = [(NPKPaymentProvisioningFlowController *)self _paymentRequestForAmount:v10];
  }
  id v25 = (void *)v24;
  [(NPKPaymentProvisioningFlowController *)self setDigitalIssuancePaymentRequest:v24];
  uint64_t v26 = [MEMORY[0x263F5BF80] sharedInstance];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __146__NPKPaymentProvisioningFlowController_DigitalIssuance___startDigitalIssuancePaymentWithAmount_requestContext_serviceProviderProduct_productItem___block_invoke;
  v34[3] = &unk_2644D4F20;
  v34[4] = self;
  id v35 = v25;
  uint64_t v27 = v33;
  id v36 = v33;
  id v28 = v25;
  [v26 canPresentPaymentRequest:v28 completion:v34];

LABEL_19:
}

void __146__NPKPaymentProvisioningFlowController_DigitalIssuance___startDigitalIssuancePaymentWithAmount_requestContext_serviceProviderProduct_productItem___block_invoke(uint64_t a1, uint64_t a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __146__NPKPaymentProvisioningFlowController_DigitalIssuance___startDigitalIssuancePaymentWithAmount_requestContext_serviceProviderProduct_productItem___block_invoke_2;
  v5[3] = &unk_2644D38A8;
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(a1 + 40);
  uint64_t v8 = a2;
  v5[4] = v3;
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __146__NPKPaymentProvisioningFlowController_DigitalIssuance___startDigitalIssuancePaymentWithAmount_requestContext_serviceProviderProduct_productItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 5 || v2 == 2)
  {
    double v4 = *(void **)(a1 + 32);
    id v7 = [v4 _addCardErrorForPaymentRequest:*(void *)(a1 + 40)];
    objc_msgSend(v4, "_sendDidEncounterError:requestContext:");
  }
  else
  {
    [*(id *)(a1 + 32) setDigitalIssuancePaymentRequestContext:*(void *)(a1 + 48)];
    id v5 = *(void **)(a1 + 32);
    id v7 = [v5 currentProduct];
    id v6 = [v7 termsURL];
    [v5 _transitionBasedOnTermsForReason:1 URL:v6 requestContext:*(void *)(a1 + 48)];
  }
}

- (id)_paymentRequestForAmount:(id)a3
{
  return [(NPKPaymentProvisioningFlowController *)self _paymentRequestForAmount:a3 serviceProviderProduct:0 productItem:0];
}

- (id)_paymentRequestForAmount:(id)a3 serviceProviderProduct:(id)a4 productItem:(id)a5
{
  v70[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v66 = v10;
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  __int16 v13 = [(NPKPaymentProvisioningFlowController *)self currentProduct];
  double v14 = [v13 provisioningMethodMetadataForType:*MEMORY[0x263F5C738]];
  id v15 = v8;
  int64_t v67 = v14;
  int v16 = [v14 depositAmount];
  uint64_t v17 = (uint64_t)v15;
  if (v16)
  {
    BOOL v18 = [MEMORY[0x263F087B0] zero];
    uint64_t v19 = [v18 compare:v16];

    uint64_t v17 = (uint64_t)v15;
    if (v19 == -1)
    {
      uint64_t v17 = [v15 decimalNumberByAdding:v16];
    }
  }
  uint64_t v20 = [v67 digitalIssuanceMetadata];
  id v21 = objc_alloc_init(MEMORY[0x263F5BF48]);
  id v22 = [v20 action];
  [v21 setItemDescription:v22];

  id v23 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v24 = [v20 serviceProviderDict];
  id v25 = (void *)[v23 initWithDictionary:v24];

  long long v62 = (void *)v17;
  [v25 setObject:v17 forKey:*MEMORY[0x263F5C800]];
  long long v65 = v25;
  if (v12)
  {
    v69[0] = @"identifier";
    uint64_t v26 = [v66 identifier];
    v69[1] = @"amount";
    v70[0] = v26;
    v70[1] = v15;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];

    long long v68 = v27;
    id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v68 count:1];
    [v65 setObject:v28 forKey:*MEMORY[0x263F5C808]];

    id v25 = v65;
  }
  [v21 setServiceProviderData:v25];
  id v29 = [v20 serviceProviderIdentifier];
  [v21 setServiceProviderIdentifier:v29];

  BOOL v30 = (void *)[objc_alloc(MEMORY[0x263F5C228]) initWithServiceProviderOrder:v21];
  id v31 = [v20 serviceProviderAcceptedNetworks];
  [v30 setSupportedNetworks:v31];

  id v32 = [v20 serviceProviderSupportedCountries];
  [v30 setSupportedCountries:v32];

  id v33 = [v20 serviceProviderCapabilities];
  [v30 setMerchantCapabilities:PKMerchantCapabilityFromStrings()];

  long long v34 = [v20 serviceProviderCountryCode];
  [v30 setCountryCode:v34];

  id v35 = [v67 currency];
  [v30 setCurrencyCode:v35];

  id v36 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  id v63 = v15;
  id v64 = v9;
  if (v12)
  {
    id v37 = objc_alloc_init(NSString);
    uint64_t v38 = [v9 localizedDisplayName];
    if (v38
      && (__int16 v39 = (void *)v38,
          [v66 localizedDisplayName],
          char v40 = objc_claimAutoreleasedReturnValue(),
          v40,
          v39,
          v40))
    {
      uint64_t v41 = NSString;
      uint64_t v42 = [v64 localizedDisplayName];
      uint64_t v43 = [v66 localizedDisplayName];
      uint64_t v44 = [v41 stringWithFormat:@"%@ - %@", v42, v43];

      id v37 = (id)v42;
    }
    else
    {
      uint64_t v49 = [v64 localizedDisplayName];

      if (!v49)
      {
LABEL_20:
        id v48 = v63;
        long long v46 = (void *)MEMORY[0x263F5C0E8];
        id v47 = v37;
        goto LABEL_21;
      }
      uint64_t v44 = [v64 localizedDisplayName];
    }

    id v37 = (id)v44;
    goto LABEL_20;
  }
  long long v45 = (void *)MEMORY[0x263F5C0E8];
  PKLocalizedPaymentString(&cfstr_SetupPurchaseT.isa);
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  long long v46 = v45;
  id v47 = v37;
  id v48 = v15;
LABEL_21:
  id v50 = [v46 summaryItemWithLabel:v47 amount:v48];

  [v36 addObject:v50];
  if (v16)
  {
    uint64_t v51 = [MEMORY[0x263F087B0] zero];
    uint64_t v52 = [v51 compare:v16];

    if (v52 == -1)
    {
      BOOL v53 = (void *)MEMORY[0x263F5C0E8];
      uint64_t v54 = PKLocalizedPaymentString(&cfstr_SetupPurchaseN.isa);
      long long v55 = [v53 summaryItemWithLabel:v54 amount:v16];

      [v36 addObject:v55];
    }
  }
  uint64_t v56 = [v20 serviceProviderLocalizedDisplayName];
  id v57 = v56;
  if (v56)
  {
    id v58 = v56;
  }
  else
  {
    id v58 = [v13 displayName];
  }
  long long v59 = v58;

  id v60 = [MEMORY[0x263F5C0E8] summaryItemWithLabel:v59 amount:v62];
  [v36 addObject:v60];
  [v30 setPaymentSummaryItems:v36];

  return v30;
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v5 = (objc_class *)MEMORY[0x263F5BFA0];
  id v6 = (void (**)(id, id))a5;
  id v7 = (id)[[v5 alloc] initWithStatus:0 errors:0];
  v6[2](v6, v7);
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __97__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationControllerDidFinish___block_invoke;
  v3[3] = &unk_2644D2910;
  v3[4] = self;
  [a3 dismissWithCompletion:v3];
}

void __97__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationControllerDidFinish___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationControllerDidFinish___block_invoke_2;
  block[3] = &unk_2644D2910;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __97__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationControllerDidFinish___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAuthorizationController:0];
  uint64_t v2 = [*(id *)(a1 + 32) currentProduct];
  uint64_t v3 = [*(id *)(a1 + 32) digitalIssuancePurchase];
  if (v3)
  {
    double v4 = [v2 provisioningMethodMetadataForType:*MEMORY[0x263F5C738]];
    id v5 = objc_alloc(MEMORY[0x263F5BE30]);
    id v6 = [*(id *)(a1 + 32) digitalIssuanceAmount];
    id v7 = [v4 currency];
    id v8 = (void *)[v5 initWithAmount:v6 currency:v7 exponent:0];

    id v9 = (void *)[objc_alloc(MEMORY[0x263F5C008]) initWithPaymentSetupProduct:v2 purchase:v3 balance:v8];
    [*(id *)(a1 + 32) setDigitalIssuancePurchase:0];
    id v10 = [*(id *)(a1 + 32) provisioningController];
    [v10 resolveRequirementsUsingProvisioningMethodMetadata:v4];

    BOOL v11 = [*(id *)(a1 + 32) provisioningController];
    int v12 = [v11 requirementsResponse];
    [v9 setRequirementsResponse:v12];

    __int16 v13 = *(void **)(a1 + 32);
    double v14 = [v13 digitalIssuancePaymentRequestContext];
    [v13 _transitionToProvisioningProgressWithRequestContext:v14];

    id v15 = *(void **)(a1 + 32);
    int v16 = [v15 digitalIssuancePaymentRequestContext];
    [v15 _transitionToProvisioningForCredential:v9 product:v2 requestContext:v16];
  }
  else
  {
    uint64_t v17 = pk_Payment_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      uint64_t v19 = pk_Payment_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v21 = 0;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: No digital issuance purchase; going back",
          v21,
          2u);
      }
    }
    [*(id *)(a1 + 32) setTermsAcceptedOutOfBand:0];
    uint64_t v20 = *(void **)(a1 + 32);
    double v4 = [v20 digitalIssuanceAmountRequestContext];
    [v20 _transitionToDigitalIssuanceForProduct:v2 requestContext:v4];
  }
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationController_didAuthorizePurchase_completion___block_invoke;
  block[3] = &unk_2644D3388;
  id v12 = v7;
  __int16 v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __120__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationController_didAuthorizePurchase_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setDigitalIssuancePurchase:");
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (id)_addCardErrorForPaymentRequest:(id)a3
{
  id v3 = a3;
  double v4 = [v3 supportedNetworks];
  char v5 = [v3 merchantCapabilities];

  uint64_t v6 = [v4 count];
  uint64_t v7 = v5 & 0xC;
  id v8 = PKLocalizedPaymentString(&cfstr_SetupPurchaseP.isa);
  if (v6 == 1)
  {
    id v9 = [v4 objectAtIndexedSubscript:0];
    PKPaymentCredentialTypeForPaymentNetworkName();

    id v10 = PKDisplayablePaymentNetworkNameForPaymentCredentialType();
    if (NPKPairedOrPairingDeviceIsTinker())
    {
      BOOL v11 = @"PROVISIONING_SETUP_PURCHASE_ADD_SPECIFIC_CARD_ALERT_MESSAGE_FAMILY_SETUP";
      if (v7 == 8) {
        BOOL v11 = @"PROVISIONING_SETUP_PURCHASE_ADD_SPECIFIC_DEBIT_CARD_ALERT_MESSAGE_FAMILY_SETUP";
      }
      id v12 = v11;
      uint64_t v13 = NPKLocalizedStringWithTableSuffix(v12, &cfstr_Paymentprovisi.isa, &stru_26CFEED98.isa, v10);
    }
    else
    {
      int v16 = @"SETUP_PURCHASE_ADD_SPECIFIC_CARD_ALERT_MESSAGE";
      if (v7 == 8) {
        int v16 = @"SETUP_PURCHASE_ADD_SPECIFIC_DEBIT_CARD_ALERT_MESSAGE";
      }
      id v12 = v16;
      uint64_t v13 = PKLocalizedPaymentString(v12, &stru_26CFEED98.isa, v10);
    }
    uint64_t v17 = (void *)v13;
  }
  else
  {
    if (NPKPairedOrPairingDeviceIsTinker())
    {
      if (v7 == 8) {
        id v14 = @"PROVISIONING_SETUP_PURCHASE_ADD_DEBIT_PAYMENT_METHOD_ALERT_MESSAGE_FAMILY_SETUP";
      }
      else {
        id v14 = @"PROVISIONING_SETUP_PURCHASE_ADD_PAYMENT_METHOD_ALERT_MESSAGE_FAMILY_SETUP";
      }
      uint64_t v15 = NPKLocalizedStringWithTableSuffix(&v14->isa, &cfstr_Paymentprovisi.isa);
    }
    else
    {
      if (v7 == 8) {
        BOOL v18 = @"SETUP_PURCHASE_ADD_DEBIT_PAYMENT_METHOD_ALERT_MESSAGE";
      }
      else {
        BOOL v18 = @"SETUP_PURCHASE_ADD_PAYMENT_METHOD_ALERT_MESSAGE";
      }
      uint64_t v15 = PKLocalizedPaymentString(&v18->isa);
    }
    uint64_t v17 = (void *)v15;
  }
  uint64_t v19 = PKDisplayableErrorCustom();

  return v19;
}

+ (id)_displayableErrorWithIneligibilityReason:(int64_t)a3 learnMoreURL:(id)a4
{
  v29[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = v5;
  BOOL v8 = a3 == 5 || v5 == 0;
  id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"PKPaymentCardEligibilityErrorDomain" code:a3 userInfo:0];
  switch(a3)
  {
    case 1:
      id v10 = PKLocalizedPaymentString(&cfstr_EligibilityUnk.isa);
      if (v8)
      {
        BOOL v11 = @"ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_MESSAGE_NO_URL";
        goto LABEL_17;
      }
      id v21 = @"ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_MESSAGE";
      goto LABEL_25;
    case 2:
      NPKTrackPaymentProvisioningWebServicesCheck();
      id v10 = PKLocalizedPaymentString(&cfstr_EligibilityIne.isa);
      if (v8)
      {
        BOOL v11 = @"ELIGIBILITY_INELIGIBLE_ERROR_MESSAGE_NO_URL";
LABEL_17:
        uint64_t v13 = PKLocalizedPaymentString(&v11->isa);
LABEL_22:
        uint64_t v20 = 0;
      }
      else
      {
        id v21 = @"ELIGIBILITY_INELIGIBLE_ERROR_MESSAGE";
LABEL_25:
        uint64_t v13 = PKLocalizedPaymentString(&v21->isa);
LABEL_26:
        v25[0] = *MEMORY[0x263F08340];
        id v14 = PKLocalizedPaymentString(&cfstr_EligibilityLea.isa);
        uint64_t v24 = v14;
        uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
        v25[1] = *MEMORY[0x263F5C588];
        v26[0] = v15;
        v26[1] = v6;
        int v16 = NSDictionary;
        uint64_t v17 = v26;
        BOOL v18 = v25;
LABEL_27:
        uint64_t v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:2];
      }
      id v22 = PKDisplayableErrorCustom();

      return v22;
    case 3:
      NPKTrackPaymentProvisioningWebServicesCheck();
      id v10 = PKLocalizedPaymentString(&cfstr_EligibilityUna.isa);
      id v12 = @"ELIGIBILITY_UNAVAILABLE_ERROR_MESSAGE";
      goto LABEL_19;
    case 4:
      NPKTrackPaymentProvisioningWebServicesCheck();
      id v10 = PKLocalizedPaymentString(&cfstr_EligibilityAlr.isa);
      uint64_t v13 = 0;
      if (!v8) {
        goto LABEL_26;
      }
      goto LABEL_22;
    case 5:
      NPKTrackPaymentProvisioningWebServicesCheck();
      id v10 = PKLocalizedPaymentString(&cfstr_EligibilityNew.isa);
      uint64_t v13 = PKLocalizedPaymentString(&cfstr_EligibilityNew_0.isa);
      v28[0] = *MEMORY[0x263F08340];
      id v14 = PKLocalizedPaymentString(&cfstr_EligibilitySof.isa);
      uint64_t v27 = v14;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
      v28[1] = *MEMORY[0x263F5C588];
      v29[0] = v15;
      v29[1] = @"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK";
      int v16 = NSDictionary;
      uint64_t v17 = v29;
      BOOL v18 = v28;
      goto LABEL_27;
    case 6:
      id v10 = PKLocalizedPaymentString(&cfstr_EligibilityHar.isa);
      id v12 = @"ELIGIBILITY_HARDWARE_NOT_SUPPORTED_ERROR_MESSAGE_WATCH";
      goto LABEL_19;
    case 7:
      id v10 = PKLocalizedLynxString(&cfstr_EligibilityErr.isa);
      uint64_t v19 = PKLocalizedLynxString(&cfstr_EligibilityErr_0.isa);
      goto LABEL_21;
    default:
      id v10 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar.isa);
      id v12 = @"COULD_NOT_ADD_CARD_MESSAGE";
LABEL_19:
      uint64_t v19 = PKLocalizedPaymentString(&v12->isa);
LABEL_21:
      uint64_t v13 = (void *)v19;
      if (v8) {
        goto LABEL_22;
      }
      goto LABEL_26;
  }
}

+ (id)_displayableErrorWithUnderlyingVerificationError:(id)a3
{
  id v3 = a3;
  double v4 = PKLocalizedPaymentString(&cfstr_ActivationNotA.isa);
  id v5 = PKLocalizedPaymentString(&cfstr_ActivationNotA_0.isa);
  uint64_t v6 = [v3 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F08570]];

  if (v7)
  {
    uint64_t v8 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);

    uint64_t v9 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
LABEL_10:
    uint64_t v13 = v5;
    double v4 = (void *)v8;
    id v5 = (void *)v9;
    goto LABEL_11;
  }
  id v10 = [v3 domain];
  int v11 = [v10 isEqualToString:*MEMORY[0x263F5C940]];

  if (!v11)
  {
    uint64_t v13 = [v3 domain];
    if (![v13 isEqualToString:*MEMORY[0x263F5C7C0]])
    {
LABEL_11:

      goto LABEL_12;
    }
    id v14 = [v3 localizedFailureReason];

    if (!v14) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if ((unint64_t)[v3 code] <= 5)
  {
    id v12 = [v3 localizedFailureReason];

    if (v12)
    {
LABEL_9:
      uint64_t v8 = [v3 localizedFailureReason];

      uint64_t v9 = [v3 localizedRecoverySuggestion];
      goto LABEL_10;
    }
  }
LABEL_12:
  uint64_t v15 = PKDisplayableErrorCustom();

  return v15;
}

+ (id)_displayableCouldNotAddCardErrorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  double v4 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar.isa);
  id v5 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar_0.isa);
  uint64_t v6 = PKDisplayableErrorCustom();

  return v6;
}

+ (BOOL)_readerModeEntryAllowedForProduct:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (!v3) {
    goto LABEL_18;
  }
  if ([v3 supportedProvisioningMethods])
  {
    if (([v4 allSupportedProtocols] & 4) != 0 && !PKFelicaSecureElementIsAvailable())
    {
      uint64_t v13 = pk_Payment_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      BOOL v7 = 0;
      if (v14)
      {
        uint64_t v8 = pk_Payment_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v9 = "Notice: Reader mode entry is disabled for typeF product as a local Felica secure element is not available";
          id v10 = buf;
          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    else if (PKSecureElementIsAvailable())
    {
      BOOL v7 = 1;
    }
    else
    {
      int v11 = pk_Payment_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      BOOL v7 = 0;
      if (v12)
      {
        uint64_t v8 = pk_Payment_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = 0;
          uint64_t v9 = "Notice: Reader mode entry is disabled because secure element is not available";
          id v10 = (uint8_t *)&v16;
          goto LABEL_16;
        }
LABEL_17:

LABEL_18:
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    id v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    BOOL v7 = 0;
    if (v6)
    {
      uint64_t v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = 0;
        uint64_t v9 = "Notice: Reader mode entry is disabled because transit product lacks reader mode provisioning method";
        id v10 = (uint8_t *)&v18;
LABEL_16:
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }

  return v7;
}

- (void)_transitionToReaderModeForProduct:(id)a3 requestContext:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  BOOL v7 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
  [v7 resolveRequirementsUsingProduct:v17];

  uint64_t v8 = [v17 provisioningMethodMetadataForType:*MEMORY[0x263F5C750]];
  [(NPKPaymentProvisioningFlowController *)self setIngestionMethodMetadata:v8];
  if (v8)
  {
    uint64_t v9 = [v8 requiredFields];
    id v10 = [v8 readerModeResources];
    int v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F5C760]];
    BOOL v12 = [v11 objectForKeyedSubscript:@"welcome"];

    uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F5C748]];
    BOOL v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F5C740]];
  }
  else
  {
    uint64_t v9 = [v17 requiredFields];
    BOOL v14 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F5C0C8]) initWithPaymentSetupFields:v9];
  [(NPKPaymentProvisioningFlowController *)self setFieldsModel:v15];

  __int16 v16 = [[NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext alloc] initWithRequestContext:v6];
  [(NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext *)v16 setProduct:v17];
  [(NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext *)v16 setTitle:v13];
  [(NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext *)v16 setSubtitle:v14];
  [(NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext *)v16 setSetupFields:v9];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:160 withContext:v16];
}

- (void)_handleReaderModeTermsAccepted:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Reader mode terms accepted", v8, 2u);
    }
  }
  [(NPKPaymentProvisioningFlowController *)self setTermsAcceptedOutOfBand:1];
  [(NPKPaymentProvisioningFlowController *)self _startReaderModeIngestion:v4];
}

- (void)_startReaderModeIngestion:(id)a3
{
  [(NPKPaymentProvisioningFlowController *)self setReaderModeRequestContext:a3];
  [(NPKPaymentProvisioningFlowController *)self setInternalIngestionState:0];
  [(NPKPaymentProvisioningFlowController *)self setFlowIngestionState:0];
  [(NPKPaymentProvisioningFlowController *)self _startIngestion];
}

- (void)_noteProvisioningStateChangeForReaderMode:(int64_t)a3
{
  unint64_t v5 = [(NPKPaymentProvisioningFlowController *)self internalIngestionState];
  if (a3 == 1 && v5 == 3)
  {
    [(NPKPaymentProvisioningFlowController *)self setInternalIngestionState:4];
    double v6 = 0.537313433;
LABEL_7:
    [(NPKPaymentProvisioningFlowController *)self _transitionToIngestionProgress:v6];
    return;
  }
  unint64_t v7 = [(NPKPaymentProvisioningFlowController *)self internalIngestionState];
  if (a3 == 4 && v7 == 4)
  {
    [(NPKPaymentProvisioningFlowController *)self setInternalIngestionState:5];
    double v6 = 0.776119403;
    goto LABEL_7;
  }
  unint64_t v8 = [(NPKPaymentProvisioningFlowController *)self internalIngestionState];
  if (a3 == 5 && v8 == 5)
  {
    [(NPKPaymentProvisioningFlowController *)self setInternalIngestionState:6];
    [(NPKPaymentProvisioningFlowController *)self _transitionToIngestionProgress:0.98];
    [(NPKPaymentProvisioningFlowController *)self _startTransferringCard];
  }
}

- (void)_setupCardIngester
{
  id v3 = [(NPKPaymentProvisioningFlowController *)self cardIngester];

  if (!v3)
  {
    id v4 = [(NPKPaymentProvisioningFlowController *)self unitTestingCardIngester];
    unint64_t v5 = v4;
    if (v4)
    {
      id v8 = v4;
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x263F5BE10]);
      unint64_t v7 = [(NPKPaymentProvisioningFlowController *)self currentProduct];
      id v8 = (id)[v6 initWithPaymentSetupProduct:v7 delegate:self];
    }
    [(NPKPaymentProvisioningFlowController *)self setCardIngester:v8];
  }
}

- (void)_tearDownCardIngester
{
  id v3 = [(NPKPaymentProvisioningFlowController *)self cardIngester];
  [v3 invalidate];

  [(NPKPaymentProvisioningFlowController *)self setCardIngester:0];
  [(NPKPaymentProvisioningFlowController *)self setIngestionCardSessionToken:0];
  [(NPKPaymentProvisioningFlowController *)self _invalidateCardNotFoundTimer];
}

- (void)contactlessCardIngester:(id)a3 didUpdateCardIngestionStatus:(unint64_t)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __105__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke;
  v5[3] = &unk_2644D3160;
  v5[4] = self;
  void v5[5] = a4;
  id v4 = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke;
  block[3] = &unk_2644D2B10;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __105__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 2)
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke_2;
    block[3] = &unk_2644D2910;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x263EF83A0], block);
    [*(id *)(a1 + 32) _invalidateCardNotFoundTimer];
    uint64_t v4 = [*(id *)(a1 + 32) internalIngestionState];
    if (v4 == 2)
    {
      double v5 = 0.179104478;
    }
    else
    {
      if (v4 != 7) {
        goto LABEL_9;
      }
      double v5 = 0.98;
    }
    [*(id *)(a1 + 32) _transitionToIngestionProgress:v5];
  }
  else if (v2 == 10)
  {
    [*(id *)(a1 + 32) _startCardNotFoundTimer];
  }
LABEL_9:
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Card ingestion status: %lu", buf, 0xCu);
    }
  }
}

unint64_t __105__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke_2(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) internalIngestionState];
  if (result <= 7 && ((1 << result) & 0x9C) != 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 _transitionToFlowIngestionState:3];
  }
  return result;
}

- (void)_transitionToFlowIngestionState:(unint64_t)a3 progress:(double)a4
{
  if ([(NPKPaymentProvisioningFlowController *)self flowIngestionState] != a3
    || ([(NPKPaymentProvisioningFlowController *)self ingestionProgress], v7 != a4))
  {
    [(NPKPaymentProvisioningFlowController *)self setFlowIngestionState:a3];
    [(NPKPaymentProvisioningFlowController *)self setIngestionProgress:a4];
    id v8 = [NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext alloc];
    uint64_t v9 = [(NPKPaymentProvisioningFlowController *)self readerModeRequestContext];
    uint64_t v15 = [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)v8 initWithRequestContext:v9];

    [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)v15 setIngestionState:a3];
    [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)v15 setIngestionProgress:a4];
    id v10 = [(NPKPaymentProvisioningFlowController *)self _titleForState:a3];
    [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)v15 setTitle:v10];

    int v11 = [(NPKPaymentProvisioningFlowController *)self _subtitleForState:a3];
    [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)v15 setSubtitle:v11];

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [(NPKPaymentProvisioningFlowController *)self ingestionMethodMetadata];
    PKScreenScale();
    BOOL v14 = objc_msgSend(v12, "_physicalCardURLFromMetadata:forScale:", v13);
    [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)v15 setPhysicalCardImageURL:v14];

    [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:165 withContext:v15];
  }
}

- (void)contactlessCardIngester:(id)a3 didFailToIngestCardWithError:(id)a4 resetProvisioning:(BOOL)a5 isRecoverable:(BOOL)a6
{
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __137__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didFailToIngestCardWithError_resetProvisioning_isRecoverable___block_invoke;
  v12[3] = &unk_2644D6C58;
  BOOL v14 = a5;
  void v12[4] = self;
  id v13 = v9;
  BOOL v15 = a6;
  id v10 = v12;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke;
  block[3] = &unk_2644D2B10;
  id v17 = v10;
  id v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __137__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didFailToIngestCardWithError_resetProvisioning_isRecoverable___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _invalidateCardNotFoundTimer];
  [*(id *)(a1 + 32) setIngestionStateOnRetry:0];
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    [v2 _resetReaderModeProvisioningState];
  }
  else
  {
    uint64_t v3 = [v2 internalIngestionState];
    double v4 = 0.0;
    if (v3 == 7)
    {
      objc_msgSend(*(id *)(a1 + 32), "setIngestionStateOnRetry:", 6, 0.0);
      double v4 = 0.776119403;
    }
    [*(id *)(a1 + 32) _transitionToFlowIngestionState:0 progress:v4];
  }
  double v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    double v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = *(unsigned __int8 *)(a1 + 48);
      int v10 = *(unsigned __int8 *)(a1 + 49);
      int v15 = 136315906;
      __int16 v16 = "-[NPKPaymentProvisioningFlowController(ReaderMode) contactlessCardIngester:didFailToIngestCardWithError:rese"
            "tProvisioning:isRecoverable:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 1024;
      int v22 = v10;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %s:%@ (resetProvisioning: %d, isRecoverable: %d)", (uint8_t *)&v15, 0x22u);
    }
  }
  int v11 = *(unsigned __int8 *)(a1 + 49);
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  BOOL v14 = [v12 readerModeRequestContext];
  if (v11) {
    [v12 _sendDidEncounterError:v13 requestContext:v14];
  }
  else {
    [v12 _endProvisioningFlowWithError:v13 requestContext:v14];
  }
}

- (void)_startIngestion
{
  if (![(NPKPaymentProvisioningFlowController *)self internalIngestionState]
    || [(NPKPaymentProvisioningFlowController *)self internalIngestionState] == 6)
  {
    [(NPKPaymentProvisioningFlowController *)self _setupCardIngester];
    [(NPKPaymentProvisioningFlowController *)self _transitionToFlowIngestionState:2];
    if ([(NPKPaymentProvisioningFlowController *)self internalIngestionState])
    {
      if ([(NPKPaymentProvisioningFlowController *)self internalIngestionState] == 6)
      {
        [(NPKPaymentProvisioningFlowController *)self _startTransferringCard];
      }
    }
    else
    {
      [(NPKPaymentProvisioningFlowController *)self _startReadingCard];
    }
  }
}

- (void)_startReadingCard
{
  if ([(NPKPaymentProvisioningFlowController *)self internalIngestionState])
  {
    uint64_t v3 = pk_Payment_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      double v5 = pk_Payment_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Warning: Warning! Attempted to ingestCard: while currently ingesting", v8, 2u);
      }
    }
    BOOL v6 = [(id)objc_opt_class() _displayableCouldNotAddCardErrorWithUnderlyingError:0];
    double v7 = [(NPKPaymentProvisioningFlowController *)self readerModeRequestContext];
    [(NPKPaymentProvisioningFlowController *)self _sendDidEncounterError:v6 requestContext:v7];
  }
  else
  {
    [(NPKPaymentProvisioningFlowController *)self setInternalIngestionState:2];
    BOOL v6 = [(NPKPaymentProvisioningFlowController *)self cardIngester];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__NPKPaymentProvisioningFlowController_ReaderMode___startReadingCard__block_invoke;
    v9[3] = &unk_2644D6C80;
    v9[4] = self;
    [v6 ingestCardWithSuccessHandler:v9];
  }
}

void __69__NPKPaymentProvisioningFlowController_ReaderMode___startReadingCard__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__NPKPaymentProvisioningFlowController_ReaderMode___startReadingCard__block_invoke_2;
  v5[3] = &unk_2644D2E08;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __69__NPKPaymentProvisioningFlowController_ReaderMode___startReadingCard__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateCardNotFoundTimer];
  [*(id *)(a1 + 32) setIngestionCardSessionToken:*(void *)(a1 + 40)];
  id v2 = objc_alloc(MEMORY[0x263F5BFD0]);
  id v3 = [*(id *)(a1 + 32) currentProduct];
  id v7 = (id)[v2 initWithPaymentSetupProduct:v3 cardSessionToken:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setInternalIngestionState:3];
  id v4 = *(void **)(a1 + 32);
  double v5 = [v4 currentProduct];
  id v6 = [*(id *)(a1 + 32) readerModeRequestContext];
  [v4 _transitionToProvisioningForCredential:v7 product:v5 requestContext:v6];
}

- (void)_startTransferringCard
{
  if ([(NPKPaymentProvisioningFlowController *)self internalIngestionState] == 6)
  {
    [(NPKPaymentProvisioningFlowController *)self setInternalIngestionState:7];
    id v3 = [(NPKPaymentProvisioningFlowController *)self cardIngester];
    id v4 = [(NPKPaymentProvisioningFlowController *)self ingestionCardSessionToken];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __74__NPKPaymentProvisioningFlowController_ReaderMode___startTransferringCard__block_invoke;
    v9[3] = &unk_2644D2910;
    v9[4] = self;
    [v3 ingestCardWithCardSessionToken:v4 successHandler:v9];
  }
  else
  {
    double v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Warning! attempting to ingestCardWithCardSessionToken: while currently ingesting", v8, 2u);
      }
    }
    id v3 = [(id)objc_opt_class() _displayableCouldNotAddCardErrorWithUnderlyingError:0];
    id v4 = [(NPKPaymentProvisioningFlowController *)self readerModeRequestContext];
    [(NPKPaymentProvisioningFlowController *)self _sendDidEncounterError:v3 requestContext:v4];
  }
}

void __74__NPKPaymentProvisioningFlowController_ReaderMode___startTransferringCard__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __74__NPKPaymentProvisioningFlowController_ReaderMode___startTransferringCard__block_invoke_2;
  v2[3] = &unk_2644D2910;
  v2[4] = *(void *)(a1 + 32);
  uint64_t v1 = v2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke;
  block[3] = &unk_2644D2B10;
  id v4 = v1;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__NPKPaymentProvisioningFlowController_ReaderMode___startTransferringCard__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setInternalIngestionState:8];
  id v2 = [*(id *)(a1 + 32) provisioningController];
  id v3 = [v2 provisionedPass];
  id v4 = [v3 fieldForKey:*MEMORY[0x263F5C728]];
  if (v4) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 4;
  }

  [*(id *)(a1 + 32) _transitionToFlowIngestionState:v5 progress:1.0];
  [*(id *)(a1 + 32) _tearDownCardIngester];
  BOOL v6 = *(void **)(a1 + 32);
  id v9 = [v6 provisioningController];
  id v7 = [v9 provisionedPass];
  uint64_t v8 = [*(id *)(a1 + 32) readerModeRequestContext];
  [v6 _performNextStepForProvisionedPass:v7 requestContext:v8];
}

- (void)_resetReaderModeProvisioningState
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __85__NPKPaymentProvisioningFlowController_ReaderMode___resetReaderModeProvisioningState__block_invoke;
  v3[3] = &unk_2644D2910;
  v3[4] = self;
  id v2 = v3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke;
  block[3] = &unk_2644D2B10;
  id v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __85__NPKPaymentProvisioningFlowController_ReaderMode___resetReaderModeProvisioningState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removePassIfNecessary];
  id v2 = [*(id *)(a1 + 32) provisioningController];
  [v2 resetForNewProvisioning];

  id v3 = [*(id *)(a1 + 32) provisioningController];
  id v4 = [*(id *)(a1 + 32) currentProduct];
  [v3 resolveRequirementsUsingProduct:v4];

  id v5 = *(void **)(a1 + 32);
  return [v5 _transitionToFlowIngestionState:0 progress:0.0];
}

- (void)_removePassIfNecessary
{
  if ([(NPKPaymentProvisioningFlowController *)self internalIngestionState] != 8)
  {
    id v3 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
    int v4 = [v3 hasPaymentPass];

    if (v4)
    {
      id v5 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
      [v5 removeProvisionedPass];
    }
  }
}

- (void)_transitionToFlowIngestionState:(unint64_t)a3
{
  [(NPKPaymentProvisioningFlowController *)self ingestionProgress];
  -[NPKPaymentProvisioningFlowController _transitionToFlowIngestionState:progress:](self, "_transitionToFlowIngestionState:progress:", a3);
}

- (void)_transitionToIngestionProgress:(double)a3
{
  unint64_t v5 = [(NPKPaymentProvisioningFlowController *)self flowIngestionState];
  [(NPKPaymentProvisioningFlowController *)self _transitionToFlowIngestionState:v5 progress:a3];
}

- (void)_cardNotFoundTimerFired
{
}

- (void)_startCardNotFoundTimer
{
  [(NPKPaymentProvisioningFlowController *)self _invalidateCardNotFoundTimer];
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  [(NPKPaymentProvisioningFlowController *)self setIngestionCardNotFoundTimer:v3];

  objc_initWeak(&location, self);
  int v4 = [(NPKPaymentProvisioningFlowController *)self ingestionCardNotFoundTimer];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  int v10 = __75__NPKPaymentProvisioningFlowController_ReaderMode___startCardNotFoundTimer__block_invoke;
  int v11 = &unk_2644D29A8;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v4, &v8);

  unint64_t v5 = [(NPKPaymentProvisioningFlowController *)self ingestionCardNotFoundTimer];
  dispatch_time_t v6 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);

  id v7 = [(NPKPaymentProvisioningFlowController *)self ingestionCardNotFoundTimer];
  dispatch_resume(v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __75__NPKPaymentProvisioningFlowController_ReaderMode___startCardNotFoundTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cardNotFoundTimerFired];
}

- (void)_invalidateCardNotFoundTimer
{
  dispatch_source_t v3 = [(NPKPaymentProvisioningFlowController *)self ingestionCardNotFoundTimer];

  if (v3)
  {
    int v4 = [(NPKPaymentProvisioningFlowController *)self ingestionCardNotFoundTimer];
    dispatch_source_cancel(v4);

    [(NPKPaymentProvisioningFlowController *)self setIngestionCardNotFoundTimer:0];
  }
}

+ (id)_readerModeResources
{
  if (_readerModeResources_onceToken != -1) {
    dispatch_once(&_readerModeResources_onceToken, &__block_literal_global_25);
  }
  id v2 = (void *)_readerModeResources_resourceKeys;
  return v2;
}

void __72__NPKPaymentProvisioningFlowController_ReaderMode___readerModeResources__block_invoke()
{
  v2[6] = *MEMORY[0x263EF8340];
  v2[0] = @"transferValue";
  v2[1] = @"notFound";
  v2[2] = @"transferValue";
  v2[3] = @"transferring";
  v2[4] = @"cardAdded";
  void v2[5] = @"commuteCardAdded";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];
  uint64_t v1 = (void *)_readerModeResources_resourceKeys;
  _readerModeResources_resourceKeys = v0;
}

+ (id)_physicalCardURLFromMetadata:(id)a3 forScale:(double)a4
{
  unint64_t v5 = @"2x";
  if (a4 > 2.0) {
    unint64_t v5 = @"3x";
  }
  dispatch_time_t v6 = v5;
  id v7 = [a3 readerModeResources];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F5C758]];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"plasticCardImages"];

  if (v9 && [v9 count])
  {
    int v10 = NSURL;
    int v11 = [v9 objectAtIndexedSubscript:0];
    id v12 = [v11 objectForKeyedSubscript:v6];
    uint64_t v13 = [v10 URLWithString:v12];
  }
  else
  {
    BOOL v14 = pk_Payment_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      __int16 v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Malformed reader mode resources - missing card image urls", v18, 2u);
      }
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_titleForState:(unint64_t)a3
{
  unint64_t v5 = [(id)objc_opt_class() _readerModeResources];
  dispatch_time_t v6 = [v5 objectAtIndexedSubscript:a3];

  id v7 = [(NPKPaymentProvisioningFlowController *)self ingestionMethodMetadata];
  uint64_t v8 = [v7 readerModeResources];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5C760]];
  int v10 = [v9 objectForKeyedSubscript:v6];
  int v11 = [v10 objectForKeyedSubscript:@"localizedTitle"];

  if (!v11)
  {
    if (a3 > 5)
    {
      int v11 = 0;
    }
    else
    {
      int v11 = PKLocalizedPaymentString(&off_2644D6CB8[a3]->isa);
    }
  }

  return v11;
}

- (id)_subtitleForState:(unint64_t)a3
{
  unint64_t v5 = [(id)objc_opt_class() _readerModeResources];
  dispatch_time_t v6 = [v5 objectAtIndexedSubscript:a3];

  id v7 = [(NPKPaymentProvisioningFlowController *)self ingestionMethodMetadata];
  uint64_t v8 = [v7 readerModeResources];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5C760]];
  int v10 = [v9 objectForKeyedSubscript:v6];
  int v11 = [v10 objectForKeyedSubscript:@"localizedDescription"];

  if (!v11)
  {
    switch(a3)
    {
      case 0uLL:
      case 2uLL:
        id v12 = [(NPKPaymentProvisioningFlowController *)self currentProduct];
        uint64_t v13 = [v12 displayName];
        PKLocalizedPaymentString(&cfstr_ReaderModeProv_3.isa, &stru_26CFEED98.isa, v13);
        goto LABEL_10;
      case 1uLL:
        BOOL v14 = @"READER_MODE_PROVISIONING_CARD_NOT_FOUND_SUBTITLE";
        goto LABEL_7;
      case 3uLL:
        BOOL v14 = @"READER_MODE_PROVISIONING_TRANSFERRING_SUBTITLE";
LABEL_7:
        int v11 = PKLocalizedPaymentString(&v14->isa);
        break;
      case 4uLL:
        id v12 = [(NPKPaymentProvisioningFlowController *)self currentProduct];
        uint64_t v13 = [v12 displayName];
        PKLocalizedPaymentString(&cfstr_ReaderModeProv_6.isa, &stru_26CFEED98.isa, v13);
        goto LABEL_10;
      case 5uLL:
        id v12 = [(NPKPaymentProvisioningFlowController *)self currentProduct];
        uint64_t v13 = [v12 displayName];
        PKLocalizedPaymentString(&cfstr_ReaderModeProv_7.isa, &stru_26CFEED98.isa, v13);
        int v11 = LABEL_10:;

        break;
      default:
        int v11 = 0;
        break;
    }
  }

  return v11;
}

@end