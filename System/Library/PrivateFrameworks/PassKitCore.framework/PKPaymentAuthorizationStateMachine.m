@interface PKPaymentAuthorizationStateMachine
- (BOOL)_canUpdateWithAutomaticReloadPaymentRequest:(id)a3 error:(id *)a4;
- (BOOL)_canUpdateWithBillingAgreement:(id)a3 oldAgreement:(id)a4 error:(id *)a5;
- (BOOL)_canUpdateWithDeferredPaymentRequest:(id)a3 error:(id *)a4;
- (BOOL)_canUpdateWithMultiTokenContexts:(id)a3 error:(id *)a4;
- (BOOL)_canUpdateWithRecurringPaymentRequest:(id)a3 error:(id *)a4;
- (BOOL)_isDeviceTransactionAssessmentEnabled;
- (BOOL)_isMerchantTokensSupported;
- (BOOL)_isMultiTokenContextsSupported;
- (BOOL)_isRequestUsedForTransactionAssessment;
- (BOOL)_isServiceProviderAssessmentEnabled;
- (BOOL)_purchaseSupportsFinancingOptions;
- (BOOL)_purchaseSupportsPaymentOffers;
- (BOOL)_shouldSignPurpleTrustData;
- (BOOL)awaitingClientCallbackReply;
- (BOOL)awaitingWebServiceResponse;
- (BOOL)canSelectPaymentOptions;
- (BOOL)detectedBluetoothOn;
- (BOOL)hasPendingCallbacks;
- (BOOL)hasReceivedRemoteDeviceUpdate;
- (BOOL)isErrorAboutPostalAddressField:(id)a3;
- (BOOL)odiAssessmentInFlight;
- (BOOL)showingExternalPasswordEntry;
- (BOOL)useSecureElement;
- (NSArray)remoteDevicesToUpdate;
- (NSMutableArray)callbackQueue;
- (NSString)description;
- (NSString)instanceIdentifier;
- (NSUUID)enhancedMerchantsFetcherUpdateToken;
- (OS_dispatch_group)delayAuthorizedStateGroup;
- (OS_dispatch_source)clientCallbackTimer;
- (PKAccount)appleCardAccount;
- (PKAccountEnhancedMerchantsFetcher)enhancedMerchantsFetcher;
- (PKAccountService)accountService;
- (PKAggregateDictionaryProtocol)aggregateDictionary;
- (PKBluetoothMonitorer)bluetoothMonitor;
- (PKContinuityPaymentCoordinator)continuityPaymentCoordinator;
- (PKContinuityPaymentService)continuityPaymentService;
- (PKInAppPaymentSession)inAppPaymentSession;
- (PKODIServiceProviderAssessment)odiServiceProviderAssessment;
- (PKODITransactionAssessment)odiTransactionAssessment;
- (PKPayLaterFinancingController)financingController;
- (PKPaymentAuthorizationClientCallbackStateParam)mostRecentClientCallback;
- (PKPaymentAuthorizationDataModel)model;
- (PKPaymentAuthorizationStateMachine)init;
- (PKPaymentAuthorizationStateMachineDelegate)delegate;
- (PKPaymentOffersController)paymentOffersController;
- (PKPaymentService)paymentService;
- (PKPaymentSheetExperiment)paymentSheetExperiment;
- (PKPaymentWebService)paymentWebService;
- (PKPeerPaymentService)peerPaymentService;
- (PKPeerPaymentSession)peerPaymentSession;
- (PKSecureElement)secureElement;
- (double)updatePaymentDeviceTimeout;
- (id)_activeODIAssessment;
- (id)_additionalPayLaterServiceProviderData;
- (id)_additionalRelevantAnalyticsDictionary;
- (id)_billingInformationFromPaymentRequest:(id)a3;
- (id)_createNewRemotePaymentRequest;
- (id)_dequeuePendingCallbackParam;
- (id)_inAppSessionAuthorizationRequest;
- (id)_odiServiceProviderAssessmentIdentifier;
- (id)_paymentRequestPurpleTrustData;
- (id)_pendingTransactionOnAlternateFundingSourceForAutorizedPeerPaymentQuote:(id)a3;
- (id)_pendingTransactionOnPeerPaymentPassForAuthorizedPeerPaymentQuote:(id)a3;
- (id)_relevantAnalyticsSubject;
- (id)_rewrapCompleteSessionRequestWithParam:(id)a3 serviceURL:(id *)a4;
- (id)_transactionWithPaymentToken:(id)a3;
- (id)_transactionWithPurchase:(id)a3 paymentHash:(id)a4;
- (id)_updateRewrapBaseRequest:(id)a3 param:(id)a4;
- (id)sanitizeClientErrors:(id)a3;
- (int64_t)cancelReason;
- (int64_t)statusFromPaymentError:(id)a3;
- (unint64_t)_adamIdentifier;
- (unint64_t)failureStatusCount;
- (unint64_t)hostApplicationState;
- (unint64_t)prepareTransactionDetailsCounter;
- (unint64_t)state;
- (void)__setState:(unint64_t)a3 param:(id)a4;
- (void)_advanceToNextState;
- (void)_advanceToNextStateFromResolveError:(BOOL)a3;
- (void)_applyBillingInformationToAuthorizedQuote:(id)a3;
- (void)_applyBillingInformationToPayment:(id)a3;
- (void)_applyShippingInformationToPayment:(id)a3;
- (void)_applyShippingMethodToPayment:(id)a3;
- (void)_applyWebServiceConfigurationIfNeeded;
- (void)_augmentBaseRequestWithCompletion:(id)a3;
- (void)_augmentSessionResponseWithCompletion:(id)a3;
- (void)_cancelClientCallbackTimer;
- (void)_clientCallbackTimedOut;
- (void)_computeAssessmentIfNecessary;
- (void)_configureAdditionalPaymentMethodsIfNeeeded;
- (void)_configurePayLaterOptionsIfNeeded;
- (void)_configurePaymentOffersIfNeeded;
- (void)_deviceUpdateDidFailWithNoEiligbleRemoteDevices:(id)a3;
- (void)_dispatchNextCallbackParam;
- (void)_emitSignpostEvent:(unint64_t)a3;
- (void)_enqeueDidAuthorizePurchaseWithParam:(id)a3;
- (void)_enqueueCallbackOfKind:(int64_t)a3 withObject:(id)a4;
- (void)_enqueueDidAuthorizeAccountServicePaymentRequestWithApplePayTrustSignature:(id)a3;
- (void)_enqueueDidAuthorizeContext;
- (void)_enqueueDidAuthorizePaymentWithByPassPayment:(id)a3 rewrapResponse:(id)a4;
- (void)_enqueueDidAuthorizePaymentWithInstallmentAuthorizationToken:(id)a3 rewrapResponse:(id)a4;
- (void)_enqueueDidAuthorizePaymentWithPayment:(id)a3 rewrapResponse:(id)a4;
- (void)_enqueueDidAuthorizePaymentWithRemotePayment:(id)a3 rewrapResponse:(id)a4;
- (void)_enqueueDidAuthorizePaymentWithToken:(id)a3 rewrapResponse:(id)a4;
- (void)_enqueueDidAuthorizePeerPaymentQuoteWithAuthorizedQuote:(id)a3;
- (void)_enqueueDidRequestMerchantSession;
- (void)_enqueueDidSelectBankAccount:(id)a3;
- (void)_enqueueDidSelectPayLaterFinancingWithAccount:(id)a3;
- (void)_enqueueDidSelectPaymentMethodWithBindToken:(id)a3;
- (void)_enqueueDidSelectPaymentMethodWithQuote:(id)a3;
- (void)_enqueueDidSelectPaymentPass:(id)a3;
- (void)_enqueueDidSelectPaymentPass:(id)a3 paymentApplication:(id)a4;
- (void)_enqueueDidSelectRemotePaymentInstrument:(id)a3;
- (void)_enqueueDidSelectRemotePaymentInstrument:(id)a3 paymentApplication:(id)a4;
- (void)_enqueueDidSelectShippingContact:(id)a3;
- (void)_enqueueDidUpdateAccountServicePaymentMethod:(id)a3;
- (void)_enqueueInitialCallbacks;
- (void)_enrichPaymentRewardsRedemptionWithPaymentTransaction:(id)a3 usingPass:(id)a4;
- (void)_fetchAdditionalPaymentMethodDataIfNeeded;
- (void)_fetchFinancingOptionsIfNeeded;
- (void)_fetchPaymentOffersIfNeeded;
- (void)_handleStateMachineWillStartNotification:(id)a3;
- (void)_insertPendingOrderDetails:(BOOL *)a3;
- (void)_insertPendingPaymentTransactionsWithParam:(id)a3;
- (void)_insertPendingTransactionRegistration;
- (void)_nonceResponseWithCompletion:(id)a3;
- (void)_performAuthorizationWithParam:(id)a3;
- (void)_performCancelRemotePaymentRequest;
- (void)_performDataProcessingWithParam:(id)a3;
- (void)_performDidAuthorizeCallbackWithParam:(id)a3;
- (void)_performInstallmentBind;
- (void)_performNonceRequestWithParam:(id)a3;
- (void)_performPassRewardsUpdateForCooldownLevel:(unint64_t)a3 ignoreErrorBackoff:(BOOL)a4 merchantIdentifier:(id)a5;
- (void)_performPrepareTransactionDetailsRequestWithParam:(id)a3;
- (void)_performRewrapRequestImplWithParam:(id)a3;
- (void)_performRewrapRequestWithParam:(id)a3;
- (void)_performSendClientUpdateWithShippingMethods:(id)a3 paymentSummaryItems:(id)a4 multiTokenContexts:(id)a5 recurringPaymentRequest:(id)a6 automaticReloadPaymentRequest:(id)a7 deferredPaymentRequest:(id)a8 paymentApplication:(id)a9 status:(int64_t)a10;
- (void)_performSendPaymentResult:(id)a3;
- (void)_performSendRemotePaymentRequest;
- (void)_performUpdatePaymentDevices;
- (void)_postStateMachineWillStartNotification;
- (void)_processBluetoothState:(int64_t)a3;
- (void)_processErrorsForDataType:(int64_t)a3;
- (void)_processPaymentRewardsRedemption:(id)a3;
- (void)_promptTapToRadar;
- (void)_purchaseMerchantIdentifier:(id *)a3 originURL:(id *)a4 webMerchantIdentifier:(id *)a5 webMerchantName:(id *)a6 adamIdentifier:(id *)a7 isMerchantTokenRequest:(BOOL *)a8 isMultiTokenRequest:(BOOL *)a9;
- (void)_registerForNotifications;
- (void)_removeWebServiceConfigurationIfNeeded;
- (void)_reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:(id)a3 eventType:(id)a4;
- (void)_reportToAutoBugCapture:(id)a3;
- (void)_retrieveVPANPaymentSession;
- (void)_sendDidTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4 withParam:(id)a5;
- (void)_setState:(unint64_t)a3;
- (void)_setState:(unint64_t)a3 param:(id)a4;
- (void)_simulatePayment;
- (void)_start;
- (void)_startAssessmentIfNecessary;
- (void)_startClientCallbackTimer;
- (void)_startHandoff;
- (void)_startPayment;
- (void)_startRemoteDeviceUpdate;
- (void)_trackCouponCodeOutcomeWithError:(id)a3;
- (void)_unregisterForNotifications;
- (void)_updateAssessmentAttributes;
- (void)_updateFinancingAssessmentsWithCollection:(id)a3;
- (void)_updateModelBillingAddressIfNeededForPass:(id)a3;
- (void)_updateModelCanAddPasses;
- (void)_updateModelWithPaymentSummaryItems:(id)a3;
- (void)_updateModelWithRemoteDevices:(id)a3;
- (void)_updateModelWithShippingMethods:(id)a3 paymentSummaryItems:(id)a4 multiTokenContexts:(id)a5 recurringPaymentRequest:(id)a6 automaticReloadPaymentRequest:(id)a7 deferredPaymentRequest:(id)a8 contentItems:(id)a9;
- (void)_updatePassRewardsInfo;
- (void)_updatePayLaterFundingSourceActionRequest:(id)a3 param:(id)a4;
- (void)_updatePaymentRequestBillingAddressWithPaymentMethod:(id)a3;
- (void)_updatePostPurchasePayLaterFinancingPlan:(id)a3 account:(id)a4 completion:(id)a5;
- (void)_updateRewrapRequest:(id)a3 param:(id)a4 serviceURL:(id *)a5;
- (void)beginDelayingAuthorizedState;
- (void)continuityPaymentCoordinator:(id)a3 didReceivePayment:(id)a4;
- (void)continuityPaymentCoordinator:(id)a3 didReceiveUpdatedPaymentDevices:(id)a4;
- (void)continuityPaymentCoordinator:(id)a3 didTimeoutTotalWithPaymentDevices:(id)a4;
- (void)continuityPaymentCoordinatorDidReceiveCancellation:(id)a3;
- (void)continuityPaymentCoordinatorDidTimeoutUpdatePaymentDevices:(id)a3;
- (void)dealloc;
- (void)delayAuthorizedStateByDuration:(double)a3;
- (void)didAuthenticateWithAuthenticatorEvaluationResponse:(id)a3;
- (void)didAuthenticateWithCredential:(id)a3;
- (void)didBecomeActive:(BOOL)a3;
- (void)didBecomeArmable:(BOOL)a3;
- (void)didBecomeOccluded:(BOOL)a3;
- (void)didCancel;
- (void)didChangeCouponCode:(id)a3;
- (void)didChangeFundingMode:(int64_t)a3;
- (void)didChangePeerPaymentUsage:(BOOL)a3;
- (void)didEncounterError:(id)a3;
- (void)didEncounterFatalError:(id)a3;
- (void)didEncounterShippingEmailError:(id)a3;
- (void)didReceiveCouponCodeCompleteWithUpdate:(id)a3;
- (void)didReceiveMerchantSessionCompleteWithSession:(id)a3 error:(id)a4;
- (void)didReceiveMerchantSessionCompleteWithUpdate:(id)a3;
- (void)didReceivePaymentAuthorizationResult:(id)a3;
- (void)didReceivePaymentAuthorizationStatus:(int64_t)a3;
- (void)didReceivePaymentMethodCompleteWithSummaryItems:(id)a3;
- (void)didReceivePaymentMethodCompleteWithUpdate:(id)a3;
- (void)didReceiveShippingContactCompleteWithStatus:(int64_t)a3 shippingMethods:(id)a4 paymentSummaryItems:(id)a5;
- (void)didReceiveShippingContactCompleteWithUpdate:(id)a3;
- (void)didReceiveShippingMethodCompleteWithStatus:(int64_t)a3 paymentSummaryItems:(id)a4;
- (void)didReceiveShippingMethodCompleteWithUpdate:(id)a3;
- (void)didReceiveUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4;
- (void)didRequestRefreshPaymentMethods;
- (void)didResignActive:(BOOL)a3;
- (void)didResolveError;
- (void)didResolveLoadingState;
- (void)didSelectBankAccount:(id)a3;
- (void)didSelectBillingAddress:(id)a3;
- (void)didSelectFinancingOption:(id)a3;
- (void)didSelectPaymentOffer:(id)a3;
- (void)didSelectPaymentOffer:(id)a3 updateReason:(unint64_t)a4;
- (void)didSelectPaymentPass:(id)a3 paymentApplication:(id)a4;
- (void)didSelectRemotePaymentInstrument:(id)a3;
- (void)didSelectRemotePaymentInstrument:(id)a3 paymentApplication:(id)a4;
- (void)didSelectShippingContact:(id)a3;
- (void)didSelectShippingEmail:(id)a3;
- (void)didSelectShippingMethod:(id)a3;
- (void)didSelectShippingName:(id)a3;
- (void)didSelectShippingPhoneNumber:(id)a3;
- (void)endDelayingAuthorizedState;
- (void)invalidate;
- (void)payLaterAvailableFundingSourcesDidChange:(id)a3;
- (void)payLaterFinancingAssessmentCollectionDidUpdate:(id)a3;
- (void)payLaterFinancingController:(id)a3 financingOptionCancelled:(id)a4;
- (void)paymentOfferActionsChanged:(id)a3;
- (void)paymentOfferCatalogChanged:(id)a3;
- (void)paymentOfferDynamicContentChanged:(id)a3;
- (void)paymentOffersChanged:(id)a3 forPassUniqueIdentifier:(id)a4;
- (void)selectedPaymentOfferChanged:(id)a3 forPassUniqueIdentifier:(id)a4;
- (void)setAccountService:(id)a3;
- (void)setAggregateDictionary:(id)a3;
- (void)setAppleCardAccount:(id)a3;
- (void)setAwaitingClientCallbackReply:(BOOL)a3;
- (void)setAwaitingWebServiceResponse:(BOOL)a3;
- (void)setBluetoothMonitor:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCancelReason:(int64_t)a3;
- (void)setClientCallbackTimer:(id)a3;
- (void)setContinuityPaymentCoordinator:(id)a3;
- (void)setContinuityPaymentService:(id)a3;
- (void)setDelayAuthorizedStateGroup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetectedBluetoothOn:(BOOL)a3;
- (void)setEnhancedMerchantsFetcher:(id)a3;
- (void)setEnhancedMerchantsFetcherUpdateToken:(id)a3;
- (void)setFailureStatusCount:(unint64_t)a3;
- (void)setFinancingController:(id)a3;
- (void)setHasReceivedRemoteDeviceUpdate:(BOOL)a3;
- (void)setHostApplicationState:(unint64_t)a3;
- (void)setInAppPaymentSession:(id)a3;
- (void)setInstanceIdentifier:(id)a3;
- (void)setModel:(id)a3;
- (void)setMostRecentClientCallback:(id)a3;
- (void)setOdiAssessmentInFlight:(BOOL)a3;
- (void)setOdiServiceProviderAssessment:(id)a3;
- (void)setOdiTransactionAssessment:(id)a3;
- (void)setPaymentOffersController:(id)a3;
- (void)setPaymentService:(id)a3;
- (void)setPaymentSheetExperiment:(id)a3;
- (void)setPaymentWebService:(id)a3;
- (void)setPeerPaymentService:(id)a3;
- (void)setPeerPaymentSession:(id)a3;
- (void)setPrepareTransactionDetailsCounter:(unint64_t)a3;
- (void)setRemoteDevicesToUpdate:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setShowingExternalPasswordEntry:(BOOL)a3;
- (void)setUpdatePaymentDeviceTimeout:(double)a3;
- (void)start;
@end

@implementation PKPaymentAuthorizationStateMachine

- (PKPaymentAuthorizationStateMachine)init
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationStateMachine;
  v2 = [(PKPaymentAuthorizationStateMachine *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    v2->_updatePaymentDeviceTimeout = 10.0;
    v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
    instanceIdentifier = v3->_instanceIdentifier;
    v3->_instanceIdentifier = (NSString *)v5;

    dispatch_group_t v7 = dispatch_group_create();
    delayAuthorizedStateGroup = v3->_delayAuthorizedStateGroup;
    v3->_delayAuthorizedStateGroup = (OS_dispatch_group *)v7;

    v9 = objc_alloc_init(PKSecureElement);
    secureElement = v3->_secureElement;
    v3->_secureElement = v9;
  }
  return v3;
}

- (void)dealloc
{
  [(PKPaymentAuthorizationStateMachine *)self invalidate];
  [(PKPaymentAuthorizationStateMachine *)self _clientCallbackTimedOut];
  [(PKPaymentAuthorizationStateMachine *)self _unregisterForNotifications];
  if (self->_enhancedMerchantsFetcherUpdateToken) {
    -[PKAccountEnhancedMerchantsFetcher removeUpdateHandler:](self->_enhancedMerchantsFetcher, "removeUpdateHandler:");
  }
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationStateMachine;
  [(PKPaymentAuthorizationStateMachine *)&v3 dealloc];
}

- (void)_setState:(unint64_t)a3
{
}

- (void)_setState:(unint64_t)a3 param:(id)a4
{
  id v6 = a4;
  if (a3 == 12)
  {
    objc_initWeak(&location, self);
    delayAuthorizedStateGroup = self->_delayAuthorizedStateGroup;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PKPaymentAuthorizationStateMachine__setState_param___block_invoke;
    v8[3] = &unk_1E56E1978;
    objc_copyWeak(v10, &location);
    v10[1] = (id)12;
    id v9 = v6;
    dispatch_group_notify(delayAuthorizedStateGroup, MEMORY[0x1E4F14428], v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKPaymentAuthorizationStateMachine *)self __setState:a3 param:v6];
  }
}

void __54__PKPaymentAuthorizationStateMachine__setState_param___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "__setState:param:", *(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)__setState:(unint64_t)a3 param:(id)a4
{
  v75[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t state = self->_state;
  self->_unint64_t state = a3;
  [(PKPaymentAuthorizationStateMachine *)self _sendDidTransitionFromState:state toState:a3 withParam:v6];
  if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 1)
  {
    v8 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
    id v9 = [v8 identifier];
  }
  else
  {
    id v9 = 0;
  }
  v10 = 0;
  switch(a3)
  {
    case 3uLL:
      v10 = [v6 error];
      -[PKPaymentAuthorizationDataModel setStatus:forItemWithType:](self->_model, "setStatus:forItemWithType:", [v6 status], objc_msgSend(v6, "dataType"));
      if (v10) {
        goto LABEL_8;
      }
      goto LABEL_22;
    case 5uLL:
      financingController = self->_financingController;
      int64_t cancelReason = self->_cancelReason;
      uint64_t v13 = 5;
      goto LABEL_19;
    case 8uLL:
      [(PKPaymentAuthorizationStateMachine *)self _performPrepareTransactionDetailsRequestWithParam:v6];
      goto LABEL_21;
    case 9uLL:
      [(PKPaymentAuthorizationStateMachine *)self _performNonceRequestWithParam:v6];
      goto LABEL_21;
    case 0xAuLL:
      [(PKPaymentAuthorizationStateMachine *)self _performAuthorizationWithParam:v6];
      goto LABEL_21;
    case 0xBuLL:
      [(PKPaymentAuthorizationStateMachine *)self _performRewrapRequestWithParam:v6];
      goto LABEL_21;
    case 0xCuLL:
      [(PKPaymentAuthorizationStateMachine *)self _performDidAuthorizeCallbackWithParam:v6];
      goto LABEL_21;
    case 0xDuLL:
      financingController = self->_financingController;
      int64_t cancelReason = self->_cancelReason;
      uint64_t v13 = 2;
      goto LABEL_19;
    case 0xEuLL:
    case 0xFuLL:
      v10 = [v6 error];
      if (v10) {
LABEL_8:
      }
        [(PKPayLaterFinancingController *)self->_financingController stateMachineUpdatedAuthenticationState:3 selectedOptionIdentifier:v9 error:v10 cancelReason:self->_cancelReason];
      goto LABEL_22;
    case 0x10uLL:
      [(PKPaymentAuthorizationStateMachine *)self _removeWebServiceConfigurationIfNeeded];
      [(PKPaymentAuthorizationStateMachine *)self _insertPendingPaymentTransactionsWithParam:v6];
      char v68 = 0;
      [(PKPaymentAuthorizationStateMachine *)self _insertPendingOrderDetails:&v68];
      if (!v68) {
        [(PKPaymentAuthorizationStateMachine *)self _insertPendingTransactionRegistration];
      }
      financingController = self->_financingController;
      int64_t cancelReason = self->_cancelReason;
      uint64_t v13 = 1;
LABEL_19:
      [(PKPayLaterFinancingController *)financingController stateMachineUpdatedAuthenticationState:v13 selectedOptionIdentifier:v9 error:0 cancelReason:cancelReason];
      goto LABEL_21;
    case 0x11uLL:
    case 0x13uLL:
      goto LABEL_22;
    case 0x12uLL:
      [(PKPaymentAuthorizationStateMachine *)self _performDataProcessingWithParam:v6];
      goto LABEL_21;
    default:
LABEL_21:
      v10 = 0;
LABEL_22:
      v14 = [v10 domain];
      int v15 = [v14 isEqualToString:@"PKPassKitErrorDomain"];

      if (!v15) {
        goto LABEL_78;
      }
      id obj = (id)a3;
      v59 = v9;
      v60 = v6;
      v16 = [v10 domain];
      uint64_t v17 = [v10 code];
      v18 = [v10 userInfo];
      int v19 = [v18 PKBoolForKey:@"PKPaymentErrorIsFieldEmpty"];

      has_internal_uuint64_t i = os_variant_has_internal_ui();
      if (has_internal_ui)
      {
        [v10 localizedFailureReason];
        v20 = v10;
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v21 = [v20 localizedDescription];
        }
      }
      else
      {
        v20 = v10;
        v21 = 0;
      }
      v22 = [v20 userInfo];
      v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      v24 = [v23 domain];
      int v25 = [v24 isEqualToString:@"PKPassKitErrorDomain"];

      v57 = v23;
      v58 = v20;
      if (!v25)
      {
        int v28 = v19;
LABEL_33:
        id v30 = obj;
        goto LABEL_34;
      }
      uint64_t v26 = [v23 domain];

      uint64_t v17 = [v23 code];
      v27 = [v20 userInfo];
      int v28 = [v27 PKBoolForKey:@"PKPaymentErrorIsFieldEmpty"];

      if (!has_internal_ui)
      {
        v16 = (__CFString *)v26;
        goto LABEL_33;
      }
      uint64_t v29 = [v23 localizedFailureReason];

      id v30 = obj;
      if (v29)
      {
        v16 = (__CFString *)v26;
        v21 = (__CFString *)v29;
      }
      else
      {
        v21 = [v23 localizedDescription];
        v16 = (__CFString *)v26;
      }
LABEL_34:
      v74[0] = @"authorizationError";
      if (v17 > -2017)
      {
        switch(v17)
        {
          case -2016:
            v31 = @"provisioningError";
            break;
          case -2015:
            v31 = @"bluetoothUnavailable";
            break;
          case -2014:
          case -2013:
          case -2007:
          case -2006:
          case -2005:
          case -2004:
            v31 = @"serverError";
            break;
          case -2012:
            v31 = @"authenticatorError";
            break;
          case -2011:
            v31 = @"continuityPaymentError";
            break;
          case -2010:
            v31 = @"continuitySendError";
            break;
          case -2009:
            v31 = @"continuityDeviceDisappeared";
            break;
          case -2008:
            v31 = @"continuityTimeout";
            break;
          case -2003:
            v31 = @"callbackSequenceError";
            break;
          case -2002:
            v31 = @"unexpectedReply";
            break;
          case -2001:
            v31 = @"callbackStatusError";
            break;
          case -2000:
            v31 = @"unknownError";
            break;
          default:
            if (v17 == -1001)
            {
              v31 = @"extensionNotFound";
            }
            else
            {
              if (v17 != -1002) {
                goto LABEL_91;
              }
              v31 = @"errorInstantiatingExtension";
            }
            break;
        }
      }
      else if (v17 > -3018)
      {
        switch(v17)
        {
          case -3017:
            v31 = @"verificationRequiredError";
            break;
          case -3016:
            v31 = @"minimumAmountError";
            break;
          case -3015:
            v31 = @"maximumAmountError";
            break;
          case -3014:
            v31 = @"missingFinancingOption";
            break;
          case -3013:
            v31 = @"cardUnsupported";
            break;
          case -3012:
            v31 = @"cardEmpty";
            break;
          case -3011:
            v31 = @"cardPINIncorrect";
            break;
          case -3010:
            v31 = @"invalidShippingContact";
            break;
          case -3009:
            v31 = @"cardInsufficientBalance";
            break;
          case -3008:
            v31 = @"paymentInstructionsError";
            break;
          case -3007:
            v31 = @"shippingPhoneticNameError";
            break;
          case -3006:
            v31 = @"shippingNameError";
            break;
          case -3005:
            v31 = @"shippingEmailError";
            break;
          case -3004:
            v31 = @"shippingPhoneError";
            break;
          case -3003:
            v31 = @"shippingAddressError";
            break;
          case -3002:
            v31 = @"billingAddressError";
            break;
          case -3001:
            v31 = @"cardLockedOut";
            break;
          case -3000:
            v31 = @"invalidPaymentCard";
            break;
          default:
            goto LABEL_91;
        }
      }
      else if (v17 <= -5001)
      {
        switch(v17)
        {
          case -6000:
            v31 = @"signatureCheckUnreachableError";
            break;
          case -5002:
            v31 = @"cloudStoreNotEntitledForMethodError";
            break;
          case -5001:
            v31 = @"cloudStoreCannotInitalizeContainerError";
            break;
          default:
LABEL_91:
            v31 = @"unknown";
            break;
        }
      }
      else
      {
        switch(v17)
        {
          case -4013:
            v31 = @"cloudStoreQueryCancelled";
            break;
          case -4012:
            v31 = @"cloudStoreCreateZoneFailed";
            break;
          case -4011:
            v31 = @"cloudStoreCopyDataFailed";
            break;
          case -4010:
            v31 = @"cloudStoreNoRecordNameForItem";
            break;
          case -4009:
            v31 = @"cloudStoreNoAssociatedContainer";
            break;
          case -4008:
            v31 = @"cloudStoreInvalidAccountState";
            break;
          case -4007:
            v31 = @"cloudStoreInitializationTimeOut";
            break;
          case -4006:
            v31 = @"cloudStoreInvalidCloudStoreState";
            break;
          case -4005:
            v31 = @"cloudStoreNotManateeCapable";
            break;
          case -4004:
            v31 = @"cloudStoreCannotPerformAction";
            break;
          case -4003:
            v31 = @"cloudStoreArgumentMismatch";
            break;
          case -4002:
            v31 = @"cloudStoreNoRecordTypeForItem";
            break;
          case -4001:
            v31 = @"cloudStoreNoZoneForItem";
            break;
          case -4000:
            v31 = @"cloudStoreUnknownError";
            break;
          default:
            if (v17 != -5000) {
              goto LABEL_91;
            }
            v31 = @"cloudStoreNotInitalizedError";
            break;
        }
      }
      if (v16) {
        v32 = v16;
      }
      else {
        v32 = &stru_1EE0F5368;
      }
      v75[0] = v31;
      v75[1] = v32;
      v74[1] = @"errorDomain";
      v74[2] = @"errorCode";
      uint64_t v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", v17);
      v34 = (void *)v33;
      v74[3] = @"errorText";
      if (v21) {
        v35 = v21;
      }
      else {
        v35 = &stru_1EE0F5368;
      }
      v75[2] = v33;
      v75[3] = v35;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:4];
      [(PKPaymentAuthorizationStateMachine *)self _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:v36 eventType:@"transactionAuthorizationError"];

      if (v28)
      {
        v73[0] = @"fieldEmpty";
        v72[0] = @"eventType";
        v72[1] = @"errorType";
        if ((unint64_t)(v17 + 3007) > 5) {
          v37 = @"unknown";
        }
        else {
          v37 = off_1E56E20B8[v17 + 3007];
        }
        v73[1] = v37;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
        +[PKAnalyticsReporter subject:@"inApp" sendEvent:v38];
      }
      if (v30 == (id)3)
      {
        v56 = v16;
        [v60 clientErrors];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id obja = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v39 = [obja countByEnumeratingWithState:&v64 objects:v71 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v65 != v41) {
                objc_enumerationMutation(obja);
              }
              v43 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              v44 = [v43 domain];
              int v45 = [v44 isEqualToString:@"PKPaymentErrorDomain"];

              if (v45)
              {
                uint64_t v46 = [v43 code];
                if (has_internal_ui)
                {
                  uint64_t v47 = [v43 localizedFailureReason];

                  v21 = (__CFString *)v47;
                  if (!v47)
                  {
                    v21 = [v43 localizedDescription];
                  }
                }
                else
                {

                  v21 = 0;
                }
                v70[0] = @"transactionAuthorizationClientError";
                v69[0] = @"eventType";
                v69[1] = @"authorizationError";
                v48 = @"unknown";
                if ((unint64_t)(v46 - 1) <= 2) {
                  v48 = off_1E56E20E8[v46 - 1];
                }
                v70[1] = v48;
                v69[2] = @"errorDomain";
                uint64_t v49 = [v43 domain];
                v50 = (void *)v49;
                if (v49) {
                  v51 = (__CFString *)v49;
                }
                else {
                  v51 = &stru_1EE0F5368;
                }
                v70[2] = v51;
                v69[3] = @"errorCode";
                uint64_t v52 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", v46);
                v53 = (void *)v52;
                v69[4] = @"errorText";
                if (v21) {
                  v54 = v21;
                }
                else {
                  v54 = &stru_1EE0F5368;
                }
                v70[3] = v52;
                v70[4] = v54;
                v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:5];
                +[PKAnalyticsReporter subject:@"inApp" sendEvent:v55];
              }
            }
            uint64_t v40 = [obja countByEnumeratingWithState:&v64 objects:v71 count:16];
          }
          while (v40);
        }

        v16 = v56;
      }

      id v9 = v59;
      id v6 = v60;
      v10 = v58;
LABEL_78:

      return;
  }
}

- (PKPaymentSheetExperiment)paymentSheetExperiment
{
  paymentSheetExperiment = self->_paymentSheetExperiment;
  if (!paymentSheetExperiment)
  {
    v4 = objc_alloc_init(PKPaymentSheetExperiment);
    uint64_t v5 = self->_paymentSheetExperiment;
    self->_paymentSheetExperiment = v4;

    paymentSheetExperiment = self->_paymentSheetExperiment;
  }
  return paymentSheetExperiment;
}

- (PKBluetoothMonitorer)bluetoothMonitor
{
  bluetoothMonitor = self->_bluetoothMonitor;
  if (!bluetoothMonitor)
  {
    v4 = [[PKBluetoothMonitorer alloc] initWithManagerOptions:0];
    uint64_t v5 = self->_bluetoothMonitor;
    self->_bluetoothMonitor = v4;

    [(PKBluetoothMonitorer *)self->_bluetoothMonitor setDelegate:self];
    bluetoothMonitor = self->_bluetoothMonitor;
  }
  return bluetoothMonitor;
}

- (void)setBluetoothMonitor:(id)a3
{
  v4 = (PKBluetoothMonitorer *)a3;
  [(PKBluetoothMonitorer *)self->_bluetoothMonitor setDelegate:0];
  [(PKBluetoothMonitorer *)v4 setDelegate:self];
  bluetoothMonitor = self->_bluetoothMonitor;
  self->_bluetoothMonitor = v4;
}

- (void)setPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentService, a3);
  [(PKPaymentAuthorizationStateMachine *)self _configureAdditionalPaymentMethodsIfNeeeded];
}

- (void)setPaymentWebService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentWebService, a3);
  [(PKPaymentAuthorizationStateMachine *)self _applyWebServiceConfigurationIfNeeded];
  [(PKPaymentAuthorizationStateMachine *)self _configureAdditionalPaymentMethodsIfNeeeded];
}

- (void)setAccountService:(id)a3
{
  objc_storeStrong((id *)&self->_accountService, a3);
  [(PKPaymentAuthorizationStateMachine *)self _configureAdditionalPaymentMethodsIfNeeeded];
}

- (void)setPeerPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentService, a3);
  [(PKPaymentAuthorizationStateMachine *)self _configureAdditionalPaymentMethodsIfNeeeded];
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
  [(PKPaymentAuthorizationStateMachine *)self _configureAdditionalPaymentMethodsIfNeeeded];
}

- (void)setUpdatePaymentDeviceTimeout:(double)a3
{
  self->_updatePaymentDeviceTimeout = a3;
  [(PKContinuityPaymentCoordinator *)self->_continuityPaymentCoordinator setUpdatePaymentDeviceTimeout:"setUpdatePaymentDeviceTimeout:"];
}

- (void)_applyWebServiceConfigurationIfNeeded
{
  objc_super v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  paymentWebService = self->_paymentWebService;
  if (paymentWebService) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = [(PKWebService *)paymentWebService sessionConfiguration];
    dispatch_group_t v7 = [v3 sourceApplicationBundleIdentifier];

    BOOL v8 = v7 != 0;
    if (v7)
    {
      id v9 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request has source application bundle, applying network configuration", buf, 2u);
      }

      v10 = [v3 sourceApplicationBundleIdentifier];
      objc_msgSend(v6, "set_sourceApplicationBundleIdentifier:", v10);
    }
    v11 = [v3 sourceApplicationSecondaryIdentifier];

    if (v11)
    {
      objc_super v12 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Request has secondary application identifier, applying network configuration", v16, 2u);
      }

      uint64_t v13 = [v3 sourceApplicationSecondaryIdentifier];
      objc_msgSend(v6, "set_sourceApplicationSecondaryIdentifier:", v13);

      BOOL v8 = 1;
    }
    v14 = [v3 CTDataConnectionServiceType];

    if (v14)
    {
      int v15 = [v3 CTDataConnectionServiceType];
      objc_msgSend(v6, "set_CTDataConnectionServiceType:", v15);
    }
    else if (!v8)
    {
LABEL_17:

      goto LABEL_18;
    }
    [(PKWebService *)self->_paymentWebService refreshSessionWithConfiguration:v6];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)_configureAdditionalPaymentMethodsIfNeeeded
{
  [(PKPaymentAuthorizationStateMachine *)self _configurePayLaterOptionsIfNeeded];
  [(PKPaymentAuthorizationStateMachine *)self _configurePaymentOffersIfNeeded];
}

- (void)_fetchAdditionalPaymentMethodDataIfNeeded
{
  [(PKPaymentAuthorizationStateMachine *)self _fetchFinancingOptionsIfNeeded];
  [(PKPaymentAuthorizationStateMachine *)self _fetchPaymentOffersIfNeeded];
}

- (void)_purchaseMerchantIdentifier:(id *)a3 originURL:(id *)a4 webMerchantIdentifier:(id *)a5 webMerchantName:(id *)a6 adamIdentifier:(id *)a7 isMerchantTokenRequest:(BOOL *)a8 isMultiTokenRequest:(BOOL *)a9
{
  id v31 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  v14 = [v31 merchantSession];
  int v15 = [v31 originatingURL];
  v16 = [v15 host];

  uint64_t v17 = [v31 merchantIdentifier];
  if ([(PKPaymentAuthorizationStateMachine *)self _adamIdentifier])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PKPaymentAuthorizationStateMachine _adamIdentifier](self, "_adamIdentifier"));
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = 0;
  }
  uint64_t v29 = a6;
  v27 = a4;
  if (v16)
  {
    uint64_t v18 = [v14 merchantIdentifier];

    id v30 = [v14 domain];
    int v19 = [v14 merchantIdentifier];
    v20 = [v14 displayName];
    uint64_t v17 = (void *)v18;
  }
  else
  {
    v20 = 0;
    int v19 = 0;
    id v30 = 0;
  }
  uint64_t v21 = [v31 recurringPaymentRequest];
  uint64_t v22 = [v31 automaticReloadPaymentRequest];
  if (v21 | v22) {
    BOOL v24 = [(PKPaymentAuthorizationStateMachine *)self _isMerchantTokensSupported];
  }
  else {
    BOOL v24 = 0;
  }
  if ([v31 isMultiTokenRequest]) {
    BOOL v23 = [(PKPaymentAuthorizationStateMachine *)self _isMultiTokenContextsSupported];
  }
  else {
    BOOL v23 = 0;
  }
  if (a3) {
    *a3 = v17;
  }
  if (v27) {
    id *v27 = v30;
  }
  if (a5) {
    *a5 = v19;
  }
  if (v29) {
    *uint64_t v29 = v20;
  }
  if (a7) {
    *a7 = v28;
  }
  if (a8) {
    *a8 = v24;
  }
  if (a9) {
    *a9 = v23;
  }
}

- (void)_configurePayLaterOptionsIfNeeded
{
  if ([(PKPaymentAuthorizationStateMachine *)self _purchaseSupportsFinancingOptions])
  {
    objc_super v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    v4 = [v3 originatingURL];
    BOOL v5 = [v4 host];

    v51[0] = 0;
    id v49 = 0;
    id v50 = 0;
    id v47 = 0;
    id v48 = 0;
    id v46 = 0;
    [(PKPaymentAuthorizationStateMachine *)self _purchaseMerchantIdentifier:&v50 originURL:&v49 webMerchantIdentifier:&v48 webMerchantName:&v47 adamIdentifier:&v46 isMerchantTokenRequest:(char *)v51 + 1 isMultiTokenRequest:v51];
    id v6 = v50;
    id v7 = v49;
    id v8 = v48;
    id v9 = v47;
    id v10 = v46;
    v11 = [(PKPayLaterFinancingController *)self->_financingController configuration];
    int v45 = v3;
    if (v11)
    {
      objc_super v12 = v11;
      [(PKPayLaterFinancingControllerConfiguration *)v11 updateMerchantIdentifier:v6 originURL:v7 webMerchantIdentifier:v8 webMerchantName:v9];
    }
    else
    {
      uint64_t v41 = [PKPayLaterFinancingControllerConfiguration alloc];
      uint64_t v39 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
      v38 = [(PKPaymentAuthorizationDataModel *)self->_model currencyCode];
      v37 = [v3 countryCode];
      uint64_t v13 = [(PKPaymentAuthorizationDataModel *)self->_model merchantName];
      id v43 = v6;
      char v36 = HIBYTE(v51[0]);
      id v14 = v9;
      id v15 = v8;
      id v16 = v7;
      char v17 = v51[0];
      id v18 = v10;
      if (v5) {
        uint64_t v19 = 2;
      }
      else {
        uint64_t v19 = 1;
      }
      v35 = [v3 supportedNetworks];
      uint64_t v34 = v19;
      id v10 = v18;
      BYTE1(v33) = v17;
      id v7 = v16;
      id v8 = v15;
      id v9 = v14;
      LOBYTE(v33) = v36;
      id v6 = v43;
      objc_super v12 = -[PKPayLaterFinancingControllerConfiguration initWithTransactionAmount:currencyCode:merchantCountryCode:merchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:merchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:channel:channelType:supportedNetworks:suppressionMode:](v41, "initWithTransactionAmount:currencyCode:merchantCountryCode:merchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:merchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:channel:channelType:supportedNetworks:suppressionMode:", v39, v38, v37, v43, v7, v8, v14, v13, v10, v33, 1, v34, v35, [v3 applePayLaterAvailability]);
    }
    if (!self->_financingController)
    {
      v20 = [PKPayLaterFinancingController alloc];
      id v40 = v9;
      accountService = self->_accountService;
      peerPaymentService = self->_peerPaymentService;
      id v23 = v10;
      id v44 = v6;
      paymentService = self->_paymentService;
      paymentWebService = self->_paymentWebService;
      [(PKPaymentAuthorizationDataModel *)self->_model library];
      id v42 = v8;
      v27 = id v26 = v7;
      id v28 = accountService;
      id v9 = v40;
      uint64_t v29 = paymentService;
      id v10 = v23;
      id v30 = paymentWebService;
      id v6 = v44;
      id v31 = [(PKPayLaterFinancingController *)v20 initWithAccountService:v28 paymentService:v29 peerPaymentService:peerPaymentService paymentWebService:v30 passLibrary:v27 payLaterAccount:0 configuration:v12];
      financingController = self->_financingController;
      self->_financingController = v31;

      id v7 = v26;
      id v8 = v42;
      [(PKPayLaterFinancingController *)self->_financingController registerObserver:self];
      [(PKPaymentAuthorizationDataModel *)self->_model setFinancingController:self->_financingController];
    }
  }
}

- (BOOL)_purchaseSupportsFinancingOptions
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if (self->_paymentWebService)
    {
      if (self->_accountService)
      {
        model = self->_model;
        if (model)
        {
          if (self->_paymentService && self->_peerPaymentService)
          {
            BOOL v5 = [(PKPaymentAuthorizationDataModel *)model paymentRequest];
            if ([v5 requestType] || -[PKPaymentAuthorizationDataModel mode](self->_model, "mode") != 1)
            {
            }
            else
            {
              id v6 = [(PKPaymentAuthorizationDataModel *)self->_model remoteDevice];

              if (!v6)
              {
                LOBYTE(v3) = 1;
                return v3;
              }
            }
          }
        }
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_fetchFinancingOptionsIfNeeded
{
  if (self->_financingController && [(PKPaymentAuthorizationDataModel *)self->_model mode] == 1)
  {
    int v3 = [(PKPayLaterFinancingController *)self->_financingController configuration];
    v4 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
    [v3 updateTransactionAmount:v4];

    id v6 = 0;
    [(PKPaymentAuthorizationStateMachine *)self _purchaseMerchantIdentifier:&v6 originURL:0 webMerchantIdentifier:0 webMerchantName:0 adamIdentifier:0 isMerchantTokenRequest:0 isMultiTokenRequest:0];
    id v5 = v6;
    if (v5) {
      [(PKPayLaterFinancingController *)self->_financingController updateFinancingOptionsWithCompletion:0];
    }
  }
}

- (void)payLaterFinancingAssessmentCollectionDidUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__PKPaymentAuthorizationStateMachine_payLaterFinancingAssessmentCollectionDidUpdate___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __85__PKPaymentAuthorizationStateMachine_payLaterFinancingAssessmentCollectionDidUpdate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  if (v2 == (void *)v3[17])
  {
    unint64_t v4 = v3[14];
    BOOL v5 = v4 > 0x10;
    uint64_t v6 = (1 << v4) & 0x1A000;
    if (v5 || v6 == 0)
    {
      id v8 = [v2 assessmentCollection];
      [v3 _updateFinancingAssessmentsWithCollection:v8];
    }
  }
}

- (void)payLaterAvailableFundingSourcesDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PKPaymentAuthorizationStateMachine_payLaterAvailableFundingSourcesDidChange___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __79__PKPaymentAuthorizationStateMachine_payLaterAvailableFundingSourcesDidChange___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 136)) {
    return [*(id *)(v1 + 56) refreshPaymentMethodsAndNotifyFinancingController:0];
  }
  return result;
}

- (void)payLaterFinancingController:(id)a3 financingOptionCancelled:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PKPaymentAuthorizationStateMachine_payLaterFinancingController_financingOptionCancelled___block_invoke;
  block[3] = &unk_1E56D8AB8;
  id v11 = v6;
  objc_super v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __91__PKPaymentAuthorizationStateMachine_payLaterFinancingController_financingOptionCancelled___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  if (a1[4] != *(void *)(v1 + 136)) {
    return;
  }
  int v3 = [*(id *)(v1 + 56) previouslySelectedFinancingOption];
  if (v3)
  {
    id v11 = v3;
    id v4 = [v3 identifier];
    id v5 = (void *)a1[6];
    id v6 = v4;
    id v7 = v5;
    if (v6 == v7)
    {

      goto LABEL_12;
    }
    id v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {

LABEL_13:
      int v3 = v11;
      goto LABEL_14;
    }
    int v10 = [v6 isEqualToString:v7];

    int v3 = v11;
    if (v10)
    {
LABEL_12:
      [*(id *)(a1[5] + 56) beginUpdates];
      [*(id *)(a1[5] + 56) setPreviouslySelectedFinancingOption:0];
      [*(id *)(a1[5] + 56) refreshPaymentMethodsAndNotifyFinancingController:0];
      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)_updateFinancingAssessmentsWithCollection:(id)a3
{
  id v10 = a3;
  [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
  id v4 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
  id v5 = [(PKPaymentAuthorizationDataModel *)self->_model previouslySelectedFinancingOption];
  id v6 = v5;
  if (v4)
  {
    id v7 = [v4 selectionIdentifier];
    id v8 = objc_msgSend(v10, "financingOptionWithSelectionIdentifier:productType:", v7, objc_msgSend(v4, "productType"));

LABEL_3:
    [(PKPaymentAuthorizationDataModel *)self->_model setSelectedFinancingOption:v8];
LABEL_4:

    goto LABEL_5;
  }
  if (v5)
  {
    BOOL v9 = [v5 selectionIdentifier];
    id v8 = objc_msgSend(v10, "financingOptionWithSelectionIdentifier:productType:", v9, objc_msgSend(v6, "productType"));

    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
LABEL_5:
  [(PKPaymentAuthorizationDataModel *)self->_model setAssessmentCollection:v10];
  [(PKPaymentAuthorizationStateMachine *)self _startAssessmentIfNecessary];
  [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
  [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
}

- (void)_removeWebServiceConfigurationIfNeeded
{
  id v5 = [(PKWebService *)self->_paymentWebService sessionConfiguration];
  int v3 = [v5 _sourceApplicationBundleIdentifier];
  if (v3
    || ([v5 _sourceApplicationSecondaryIdentifier],
        (int v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", 0);
    objc_msgSend(v5, "set_sourceApplicationSecondaryIdentifier:", 0);
    objc_msgSend(v5, "set_CTDataConnectionServiceType:", 0);
    [(PKWebService *)self->_paymentWebService refreshSessionWithConfiguration:v5];
    goto LABEL_5;
  }
  id v4 = [v5 _CTDataConnectionServiceType];

  if (v4) {
    goto LABEL_4;
  }
LABEL_5:
}

- (BOOL)useSecureElement
{
  return [(PKPaymentAuthorizationDataModel *)self->_model mode] == 1;
}

- (NSString)description
{
  int v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  unint64_t state = self->_state;
  if (state > 0x14) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_1E56E2208[state];
  }
  id v7 = [v3 stringWithFormat:@"<%@: %p; state: %@", v4, self, v6];
  if ([(NSMutableArray *)self->_callbackQueue count])
  {
    [v7 appendString:@"; callbackQueue:\n"];
    callbackQueue = self->_callbackQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__PKPaymentAuthorizationStateMachine_description__block_invoke;
    v11[3] = &unk_1E56E19A0;
    id v12 = v7;
    id v13 = self;
    [(NSMutableArray *)callbackQueue enumerateObjectsUsingBlock:v11];
  }
  [v7 appendString:@">"];
  BOOL v9 = (void *)[v7 copy];

  return (NSString *)v9;
}

unint64_t __49__PKPaymentAuthorizationStateMachine_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 144), "objectAtIndex:");
  [v5 appendFormat:@"    %@", v6];

  unint64_t result = [*(id *)(*(void *)(a1 + 40) + 144) count];
  if (a3 + 1 < result)
  {
    id v8 = *(void **)(a1 + 32);
    return [v8 appendString:@",\n"];
  }
  return result;
}

- (void)_configurePaymentOffersIfNeeded
{
  if ([(PKPaymentAuthorizationStateMachine *)self _purchaseSupportsPaymentOffers])
  {
    uint64_t v34 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    v35 = [(PKPaymentAuthorizationDataModel *)self->_model totalSummaryItem];
    id v36 = 0;
    *(_WORD *)uint64_t v41 = 0;
    id v39 = 0;
    id v40 = 0;
    id v37 = 0;
    id v38 = 0;
    [(PKPaymentAuthorizationStateMachine *)self _purchaseMerchantIdentifier:&v40 originURL:&v39 webMerchantIdentifier:&v38 webMerchantName:&v37 adamIdentifier:&v36 isMerchantTokenRequest:&v41[1] isMultiTokenRequest:v41];
    id v3 = v40;
    id v4 = v39;
    id v5 = v38;
    id v6 = v37;
    id v7 = v36;
    id v8 = [(PKPaymentOffersController *)self->_paymentOffersController configuration];
    if (v8)
    {
      BOOL v9 = v8;
      [(PKPaymentOffersControllerConfiguration *)v8 updateMerchantIdentifier:v3 originURL:v4 webMerchantIdentifier:v5 webMerchantName:v6];
    }
    else
    {
      id v32 = v3;
      uint64_t v10 = v41[0] | (2 * v41[1]);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 |= 4uLL;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v12 = v10 | 8;
      if ((isKindOfClass & 1) == 0) {
        uint64_t v12 = v10;
      }
      uint64_t v31 = v12;
      id v30 = [PKPaymentOffersControllerConfiguration alloc];
      v27 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
      uint64_t v29 = [(PKPaymentAuthorizationDataModel *)self->_model currencyCode];
      id v28 = [v34 countryCode];
      id v13 = [(PKPaymentAuthorizationDataModel *)self->_model merchantName];
      id v14 = [v34 supportedNetworks];
      BOOL v9 = -[PKPaymentOffersControllerConfiguration initWithTransactionAmount:currencyCode:merchantCountryCode:merchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:merchantName:adamIdentifier:supportedNetworks:merchantCapabilities:payLaterSuppressionMode:options:](v30, "initWithTransactionAmount:currencyCode:merchantCountryCode:merchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:merchantName:adamIdentifier:supportedNetworks:merchantCapabilities:payLaterSuppressionMode:options:", v27, v29, v28, v32, v4, v5, v6, v13, v7, v14, [v34 merchantCapabilities], objc_msgSend(v34, "applePayLaterAvailability"), v31);

      id v3 = v32;
    }
    if (!self->_paymentOffersController)
    {
      id v33 = v6;
      id v15 = v5;
      id v16 = v4;
      id v17 = v3;
      id v18 = [PKPaymentOffersController alloc];
      id v19 = v7;
      paymentService = self->_paymentService;
      paymentWebService = self->_paymentWebService;
      uint64_t v22 = [(PKPaymentAuthorizationDataModel *)self->_model library];
      id v23 = v18;
      id v3 = v17;
      id v4 = v16;
      id v5 = v15;
      id v6 = v33;
      BOOL v24 = paymentService;
      id v7 = v19;
      int v25 = [(PKPaymentOffersController *)v23 initWithPaymentService:v24 paymentWebService:paymentWebService passLibrary:v22 configuration:v9];
      paymentOffersController = self->_paymentOffersController;
      self->_paymentOffersController = v25;

      [(PKPaymentOffersController *)self->_paymentOffersController registerObserver:self];
      [(PKPaymentAuthorizationDataModel *)self->_model setPaymentOffersController:self->_paymentOffersController];
    }
  }
}

- (void)_fetchPaymentOffersIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_paymentOffersController && [(PKPaymentAuthorizationDataModel *)self->_model mode] == 1)
  {
    id v3 = [(PKPaymentOffersController *)self->_paymentOffersController configuration];
    id v4 = [v3 transactionAmount];

    uint64_t v5 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
    id v6 = (void *)v5;
    if (v4 && v5) {
      char v7 = [v4 isEqual:v5];
    }
    else {
      char v7 = v4 == (void *)v5;
    }
    id v8 = [(PKPaymentOffersController *)self->_paymentOffersController configuration];
    [v8 updateTransactionAmount:v6];

    if ((v7 & 1) == 0) {
      [(PKPaymentAuthorizationDataModel *)self->_model recomputeHasAnyPayLaterOptions];
    }
    id v20 = 0;
    [(PKPaymentAuthorizationStateMachine *)self _purchaseMerchantIdentifier:&v20 originURL:0 webMerchantIdentifier:0 webMerchantName:0 adamIdentifier:0 isMerchantTokenRequest:0 isMultiTokenRequest:0];
    id v9 = v20;
    if (v9)
    {
      if (![(PKPaymentOffersController *)self->_paymentOffersController hasFetchedCatalogFromServer])[(PKPaymentOffersController *)self->_paymentOffersController updatePaymentOfferCatalogWithCompletion:0]; {
      uint64_t v10 = [(PKPaymentAuthorizationDataModel *)self->_model selectedPaymentOffer];
      }
      unint64_t v11 = [(PKPaymentAuthorizationDataModel *)self->_model fundingMode];
      if (v11 >= 2)
      {
        if (v11 == 2)
        {
          char v12 = v10 ? v7 : 1;
          if ((v12 & 1) == 0)
          {
            if ([v10 type] == 1)
            {
              id v13 = PKLogFacilityTypeGetObject(7uLL);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v22 = v4;
                __int16 v23 = 2112;
                BOOL v24 = v6;
                _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Payment sheet total amount has changed from %@ to %@. Updating payment offers now.", buf, 0x16u);
              }

              [(PKPaymentAuthorizationStateMachine *)self _setState:19 param:0];
              paymentOffersController = self->_paymentOffersController;
              id v15 = [v10 criteriaIdentifier];
              id v16 = [v10 paymentPass];
              [(PKPaymentOffersController *)paymentOffersController updatePaymentOffersForCriteriaIdentifier:v15 paymentPass:v16 reason:5 completion:0];
            }
            if ([v10 type] == 2)
            {
              id v17 = [v10 rewardsRedemptionIntent];
              id v18 = [v17 monetaryValue];
              id v19 = [v18 amount];

              if (v17 && [v6 compare:v19] == -1)
              {
                [(PKPaymentOffersController *)self->_paymentOffersController clearCurrentSelectedPaymentOfferDetails];
                [(PKPaymentAuthorizationStateMachine *)self didChangeFundingMode:0];
              }
            }
          }
        }
      }
      else if ((v7 & 1) == 0)
      {
        [(PKPaymentOffersController *)self->_paymentOffersController removeCachedPaymentOffers];
      }
    }
  }
}

- (BOOL)_purchaseSupportsPaymentOffers
{
  id v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  id v4 = v3;
  if (self->_paymentWebService
    && self->_model
    && self->_paymentService
    && ![v3 requestType]
    && ([v4 _isAMPPayment] & 1) == 0
    && [(PKPaymentAuthorizationDataModel *)self->_model mode] == 1)
  {
    uint64_t v5 = [(PKPaymentAuthorizationDataModel *)self->_model remoteDevice];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)paymentOfferCatalogChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKPaymentAuthorizationStateMachine_paymentOfferCatalogChanged___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __65__PKPaymentAuthorizationStateMachine_paymentOfferCatalogChanged___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 272))
  {
    unint64_t v2 = *(void *)(v1 + 112);
    BOOL v3 = v2 > 0x10;
    uint64_t v4 = (1 << v2) & 0x1A000;
    if (v3 || v4 == 0)
    {
      uint64_t v6 = result;
      [*(id *)(v1 + 56) beginUpdates];
      [*(id *)(*(void *)(v6 + 40) + 56) paymentOffersDidUpdate];
      [*(id *)(*(void *)(v6 + 40) + 56) endUpdates];
      id v7 = *(void **)(v6 + 40);
      return [v7 _advanceToNextState];
    }
  }
  return result;
}

- (void)paymentOffersChanged:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKPaymentAuthorizationStateMachine_paymentOffersChanged_forPassUniqueIdentifier___block_invoke;
  v7[3] = &unk_1E56D8A90;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __83__PKPaymentAuthorizationStateMachine_paymentOffersChanged_forPassUniqueIdentifier___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 272))
  {
    unint64_t v2 = *(void *)(v1 + 112);
    BOOL v3 = v2 > 0x10;
    uint64_t v4 = (1 << v2) & 0x1A000;
    if (v3 || v4 == 0)
    {
      uint64_t v6 = result;
      [*(id *)(v1 + 56) beginUpdates];
      [*(id *)(*(void *)(v6 + 40) + 56) paymentOffersDidUpdate];
      [*(id *)(*(void *)(v6 + 40) + 56) endUpdates];
      id v7 = *(void **)(v6 + 40);
      return [v7 _advanceToNextState];
    }
  }
  return result;
}

- (void)paymentOfferActionsChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKPaymentAuthorizationStateMachine_paymentOfferActionsChanged___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __65__PKPaymentAuthorizationStateMachine_paymentOfferActionsChanged___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 272))
  {
    unint64_t v2 = *(void *)(v1 + 112);
    BOOL v3 = v2 > 0x10;
    uint64_t v4 = (1 << v2) & 0x1A000;
    if (v3 || v4 == 0)
    {
      uint64_t v6 = result;
      [*(id *)(v1 + 56) beginUpdates];
      [*(id *)(*(void *)(v6 + 40) + 56) paymentOffersDidUpdate];
      [*(id *)(*(void *)(v6 + 40) + 56) endUpdates];
      id v7 = *(void **)(v6 + 40);
      return [v7 _advanceToNextState];
    }
  }
  return result;
}

- (void)selectedPaymentOfferChanged:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentAuthorizationStateMachine_selectedPaymentOfferChanged_forPassUniqueIdentifier___block_invoke;
  block[3] = &unk_1E56D8AB8;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __90__PKPaymentAuthorizationStateMachine_selectedPaymentOfferChanged_forPassUniqueIdentifier___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*((id *)a1[4] + 7) pass];
  BOOL v3 = [v2 uniqueID];

  id v4 = a1[5];
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {

LABEL_10:
    [*((id *)a1[4] + 7) beginUpdates];
    id v9 = [a1[6] selectedOfferDetails];
    id v10 = a1[4];
    id v11 = [v9 selectedPaymentOffer];
    [v10 didSelectPaymentOffer:v11 updateReason:2];

    [*((id *)a1[4] + 7) endUpdates];
    [a1[4] _advanceToNextState];
    goto LABEL_13;
  }
  if (v5) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
  }
  else
  {
    char v8 = [v4 isEqualToString:v5];

    if (v8) {
      goto LABEL_10;
    }
  }
  id v9 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = a1[5];
    int v13 = 138412546;
    id v14 = v12;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error: Payment Offers Controller updated the selected offer for pass %@, but the selected pass is %@", (uint8_t *)&v13, 0x16u);
  }
LABEL_13:
}

- (void)paymentOfferDynamicContentChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKPaymentAuthorizationStateMachine_paymentOfferDynamicContentChanged___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__PKPaymentAuthorizationStateMachine_paymentOfferDynamicContentChanged___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) beginUpdates];
  [*(id *)(*(void *)(a1 + 32) + 56) paymentOffersDidUpdate];
  [*(id *)(*(void *)(a1 + 32) + 56) endUpdates];
  unint64_t v2 = *(void **)(a1 + 32);
  return [v2 _advanceToNextState];
}

- (void)start
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = PKPaymentAuthorizationModeDescriptions[[(PKPaymentAuthorizationDataModel *)self->_model mode]];
    *(_DWORD *)buf = 138412290;
    id v49 = v4;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "State machine starting for mode: %@", buf, 0xCu);
  }

  self->_hostApplicationState = 0;
  [(PKPaymentAuthorizationStateMachine *)self _postStateMachineWillStartNotification];
  [(PKPaymentAuthorizationStateMachine *)self _registerForNotifications];
  if (self->_state) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Invalid state"];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v5 = [&unk_1EE22AD48 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v42;
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(&unk_1EE22AD48);
        }
        uint64_t v10 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        id v11 = [(PKPaymentAuthorizationStateMachine *)self valueForKey:v10];

        if (!v11) {
          [MEMORY[0x1E4F1CA00] raise:v8, @"Missing required property '%@'", v10 format];
        }
      }
      uint64_t v6 = [&unk_1EE22AD48 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v6);
  }
  int64_t v12 = [(PKPaymentAuthorizationDataModel *)self->_model mode];
  if (v12 != 1 && v12 != 3)
  {
    if (v12 == 2)
    {
      if (self->_continuityPaymentService)
      {
        int v13 = [[PKContinuityPaymentCoordinator alloc] initWithContinuityPaymentService:self->_continuityPaymentService];
        continuityPaymentCoordinator = self->_continuityPaymentCoordinator;
        self->_continuityPaymentCoordinator = v13;

        [(PKContinuityPaymentCoordinator *)self->_continuityPaymentCoordinator setUpdatePaymentDeviceTimeout:self->_updatePaymentDeviceTimeout];
        [(PKContinuityPaymentCoordinator *)self->_continuityPaymentCoordinator setDelegate:self];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Missing required property 'continuityPaymentService'", v39);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Invalid mode: %d", -[PKPaymentAuthorizationDataModel mode](self->_model, "mode"));
    }
  }
  __int16 v15 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  id v16 = +[PKPaymentRequestValidator validatorWithObject:v15];
  id v40 = 0;
  char v17 = [v16 isValidWithError:&v40];
  id v18 = (__CFString *)v40;

  if (v17)
  {
    if ([v15 _isAMPPayment])
    {
      id v19 = PKAggDKeyPaymentiTunesPurchasePresented;
    }
    else
    {
      if ([v15 requestType])
      {
LABEL_30:
        [(PKPaymentAuthorizationStateMachine *)self _start];
        goto LABEL_31;
      }
      id v19 = PKAggDKeyPaymentInAppPaymentPresent;
    }
    uint64_t v22 = *v19;
    AnalyticsSendEvent();
    [(PKAggregateDictionaryProtocol *)self->_aggregateDictionary addValueForScalarKey:v22 value:1];
    goto LABEL_30;
  }
  id v20 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v49 = v18;
    _os_log_error_impl(&dword_190E10000, v20, OS_LOG_TYPE_ERROR, "Payment is invalid: %{public}@", buf, 0xCu);
  }

  uint64_t v21 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v18];
  [(PKPaymentAuthorizationStateMachine *)self _setState:15 param:v21];

LABEL_31:
  [(PKPaymentAuthorizationStateMachine *)self _startAssessmentIfNecessary];
  __int16 v23 = [v15 multiTokenContexts];
  if ([v23 count]
    && ![(PKPaymentAuthorizationStateMachine *)self _isMultiTokenContextsSupported])
  {
    [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
    [(PKPaymentAuthorizationDataModel *)self->_model setMultiTokenContexts:MEMORY[0x1E4F1CBF0]];
    [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
  }
  BOOL v24 = [v15 recurringPaymentRequest];
  uint64_t v25 = [v15 automaticReloadPaymentRequest];
  id v26 = [v15 deferredPaymentRequest];

  if ((v24 || v25 || v26)
    && ![(PKPaymentAuthorizationStateMachine *)self _isMerchantTokensSupported])
  {
    [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
    [(PKPaymentAuthorizationDataModel *)self->_model setRecurringPaymentRequest:0];
    [(PKPaymentAuthorizationDataModel *)self->_model setAutomaticReloadPaymentRequest:0];
    [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
  }
  v27 = [v15 thumbnailURLs];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    AnalyticsSendEvent();
    [(PKAggregateDictionaryProtocol *)self->_aggregateDictionary addValueForScalarKey:@"com.apple.passbook.payment.in-app.thumbnail" value:1];
  }
  if (![v15 requestType])
  {
    uint64_t v29 = [v15 merchantSession];
    if (v29)
    {

      id v30 = PKAggDKeyPaymentInAppUsesMerchantSession;
    }
    else
    {
      int v31 = [v15 shouldUseMerchantSession];
      id v30 = PKAggDKeyPaymentInAppUsesMerchantIdentifier;
      if (v31) {
        id v30 = PKAggDKeyPaymentInAppUsesMerchantSession;
      }
    }
    id v32 = *v30;
    AnalyticsSendEvent();
    [(PKAggregateDictionaryProtocol *)self->_aggregateDictionary addValueForScalarKey:v32 value:1];
  }
  aggregateDictionary = self->_aggregateDictionary;
  uint64_t v34 = NSString;
  v35 = PKAggDKeyForPaymentRequestAPIType([v15 APIType]);
  id v36 = [v34 stringWithFormat:@"%@.%@", @"com.apple.passbook.payment.api", v35];
  [(PKAggregateDictionaryProtocol *)aggregateDictionary addValueForScalarKey:v36 value:1];

  int v45 = @"api";
  id v37 = PKAggDKeyForPaymentRequestAPIType([v15 APIType]);
  id v46 = v37;
  id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  AnalyticsSendEvent();

  [(PKPaymentAuthorizationStateMachine *)self _applyWebServiceConfigurationIfNeeded];
  [(PKPaymentAuthorizationStateMachine *)self _fetchAdditionalPaymentMethodDataIfNeeded];
  [(PKPaymentAuthorizationStateMachine *)self _updateModelCanAddPasses];
}

- (void)invalidate
{
  [(PKPayLaterFinancingController *)self->_financingController unregisterObserver:self];
  [(PKPayLaterFinancingController *)self->_financingController invalidate];
  financingController = self->_financingController;
  self->_financingController = 0;

  [(PKPaymentOffersController *)self->_paymentOffersController unregisterObserver:self];
  [(PKPaymentOffersController *)self->_paymentOffersController invalidate];
  paymentOffersController = self->_paymentOffersController;
  self->_paymentOffersController = 0;
}

- (void)_startAssessmentIfNecessary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 1)
  {
    if (!self->_odiTransactionAssessment
      && [(PKPaymentAuthorizationStateMachine *)self _isDeviceTransactionAssessmentEnabled])
    {
      if (_os_feature_enabled_impl()
        && ([(PKPaymentAuthorizationDataModel *)self->_model paymentRequest],
            BOOL v3 = objc_claimAutoreleasedReturnValue(),
            int v4 = [v3 isServiceProviderPaymentRequest],
            v3,
            v4))
      {
        uint64_t v5 = [[PKODITransactionAssessment alloc] initWithAssessmentType:1];
      }
      else
      {
        uint64_t v5 = objc_alloc_init(PKODITransactionAssessment);
      }
      odiTransactionAssessment = self->_odiTransactionAssessment;
      self->_odiTransactionAssessment = v5;

      uint64_t v7 = self->_odiTransactionAssessment;
      if (v7)
      {
        uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          char v17 = v7;
          _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Starting CoreODI assessment %@", (uint8_t *)&v16, 0xCu);
        }

        id v9 = self->_odiTransactionAssessment;
        uint64_t v10 = [(PKPaymentAuthorizationDataModel *)self->_model bundleIdentifier];
        [(PKODIAssessment *)v9 startAssessmentWithHostBundleIdentifier:v10];
      }
    }
    if (!self->_odiServiceProviderAssessment
      && [(PKPaymentAuthorizationStateMachine *)self _isServiceProviderAssessmentEnabled])
    {
      id v11 = [(PKPaymentAuthorizationStateMachine *)self _odiServiceProviderAssessmentIdentifier];
      int64_t v12 = [[PKODIServiceProviderAssessment alloc] initWithServiceProviderIdentifier:v11 locationBundle:0];
      odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
      self->_odiServiceProviderAssessment = v12;

      id v14 = self->_odiServiceProviderAssessment;
      if (v14)
      {
        __int16 v15 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          char v17 = v14;
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Starting CoreODI assessment %@", (uint8_t *)&v16, 0xCu);
        }

        [(PKODIAssessment *)self->_odiServiceProviderAssessment startAssessment];
      }
    }
  }
}

- (id)_activeODIAssessment
{
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  if ([v3 isPayLaterPaymentRequest])
  {

    uint64_t v4 = 224;
  }
  else
  {
    int64_t v5 = [(PKPaymentAuthorizationDataModel *)self->_model fundingMode];

    uint64_t v4 = 216;
    if (v5 == 1) {
      uint64_t v4 = 224;
    }
  }
  uint64_t v6 = *(Class *)((char *)&self->super.isa + v4);
  return v6;
}

- (BOOL)canSelectPaymentOptions
{
  unint64_t state = self->_state;
  if (state > 8) {
    return 0;
  }
  if (((1 << state) & 0x17A) == 0)
  {
    if (state == 7) {
      return [(PKPaymentAuthorizationClientCallbackStateParam *)self->_mostRecentClientCallback kind] != 5;
    }
    return 0;
  }
  return 1;
}

- (void)didResignActive:(BOOL)a3
{
  uint64_t v3 = 1;
  if (!a3) {
    uint64_t v3 = 2;
  }
  self->_hostApplicationState |= v3;
  if (self->_state == 5) {
    [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
  }
}

- (void)didBecomeActive:(BOOL)a3
{
  uint64_t v3 = -4;
  if (!a3) {
    uint64_t v3 = -3;
  }
  self->_hostApplicationState &= v3;
  unint64_t state = self->_state;
  BOOL v5 = state > 0x10;
  uint64_t v6 = (1 << state) & 0x1A008;
  if (v5 || v6 == 0) {
    [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
  }
}

- (void)didBecomeOccluded:(BOOL)a3
{
  unint64_t hostApplicationState = self->_hostApplicationState;
  if (a3)
  {
    self->_unint64_t hostApplicationState = hostApplicationState | 4;
  }
  else
  {
    self->_unint64_t hostApplicationState = hostApplicationState & 0xFFFFFFFFFFFFFFFBLL;
    if ((hostApplicationState & 4) == 0) {
      return;
    }
  }
  unint64_t state = self->_state;
  BOOL v5 = state > 0x10;
  uint64_t v6 = (1 << state) & 0x1A008;
  if (v5 || v6 == 0) {
    [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
  }
}

- (void)didBecomeArmable:(BOOL)a3
{
  unint64_t hostApplicationState = self->_hostApplicationState;
  if (a3)
  {
    self->_unint64_t hostApplicationState = hostApplicationState & 0xFFFFFFFFFFFFFFF7;
    if ((hostApplicationState & 8) == 0) {
      return;
    }
  }
  else
  {
    self->_unint64_t hostApplicationState = hostApplicationState | 8;
  }
  unint64_t state = self->_state;
  BOOL v5 = state > 0x10;
  uint64_t v6 = (1 << state) & 0x1A008;
  if (v5 || v6 == 0) {
    [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
  }
}

- (void)setCancelReason:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v5 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = PKPaymentAuthorizationStateMachineCancelReasonToString(a3);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Setting state machine cancel reason to \"%@\"", (uint8_t *)&v7, 0xCu);
  }
  self->_int64_t cancelReason = a3;
}

- (void)didCancel
{
  uint64_t v3 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Received cancel", v14, 2u);
  }

  unint64_t state = self->_state;
  BOOL v5 = state > 0x10;
  uint64_t v6 = (1 << state) & 0x1A000;
  if (v5 || v6 == 0)
  {
    [(PKPaymentAuthorizationStateMachine *)self _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:0 eventType:@"transactionAuthorizationCanceled"];
    uint64_t v8 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    uint64_t v9 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    char v10 = [v9 _isAMPPayment];

    if (v10)
    {
      id v11 = PKAggDKeyPaymentiTunesPurchaseCancel;
    }
    else
    {
      if ([v8 requestType])
      {
LABEL_13:
        int v13 = [(PKContinuityPaymentCoordinator *)self->_continuityPaymentCoordinator currentRemotePaymentRequest];

        if (v13) {
          [(PKPaymentAuthorizationStateMachine *)self _performCancelRemotePaymentRequest];
        }
        if (self->_odiAssessmentInFlight)
        {
          [(PKODIAssessment *)self->_odiTransactionAssessment provideSessionFeedback:1];
          [(PKODIAssessment *)self->_odiServiceProviderAssessment provideSessionFeedback:1];
          self->_odiAssessmentInFlight = 0;
        }
        [(PKPaymentAuthorizationStateMachine *)self _setState:13 param:0];

        return;
      }
      id v11 = PKAggDKeyPaymentInAppPaymentCancel;
    }
    int64_t v12 = *v11;
    AnalyticsSendEvent();
    [(PKAggregateDictionaryProtocol *)self->_aggregateDictionary addValueForScalarKey:v12 value:1];
    goto LABEL_13;
  }
}

- (void)didEncounterError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "Received error from client: %@", (uint8_t *)&v11, 0xCu);
  }

  unint64_t state = self->_state;
  BOOL v7 = state > 0x10;
  uint64_t v8 = (1 << state) & 0x1A000;
  if (v7 || v8 == 0)
  {
    char v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v4];
    [(PKPaymentAuthorizationStateMachine *)self _setState:14 param:v10];
  }
}

- (void)didEncounterFatalError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "Received fatal error from client: %@", (uint8_t *)&v11, 0xCu);
  }

  unint64_t state = self->_state;
  BOOL v7 = state > 0x10;
  uint64_t v8 = (1 << state) & 0x1A000;
  if (v7 || v8 == 0)
  {
    char v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v4];
    [(PKPaymentAuthorizationStateMachine *)self _setState:15 param:v10];
  }
}

- (void)didResolveError
{
  unint64_t state = self->_state;
  BOOL v3 = state > 0xE;
  uint64_t v4 = (1 << state) & 0x4028;
  if (v3 || v4 == 0)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Called didResolveError but not in error or authenticate state", v7, 2u);
    }
  }
  else
  {
    [(PKPaymentAuthorizationStateMachine *)self _advanceToNextStateFromResolveError:1];
  }
}

- (void)didResolveLoadingState
{
  unint64_t state = self->_state;
  BOOL v3 = state > 7;
  uint64_t v4 = (1 << state) & 0xC8;
  if (!v3 && v4 != 0) {
    [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
  }
}

- (void)didReceiveMerchantSessionCompleteWithSession:(id)a3 error:(id)a4
{
  if (a3) {
    BOOL v5 = a4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  uint64_t v6 = !v5;
  id v7 = a3;
  uint64_t v8 = [[PKPaymentRequestMerchantSessionUpdate alloc] initWithStatus:v6 merchantSession:v7];

  [(PKPaymentAuthorizationStateMachine *)self didReceiveMerchantSessionCompleteWithUpdate:v8];
}

- (void)didReceiveMerchantSessionCompleteWithUpdate:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 status];
    id v7 = @"PKPaymentAuthorizationStatusSuccess";
    switch(v6)
    {
      case 0:
        break;
      case 1:
        id v7 = @"PKPaymentAuthorizationStatusFailure";
        break;
      case 2:
        id v7 = @"PKPaymentAuthorizationStatusInvalidBillingPostalAddress";
        break;
      case 3:
        id v7 = @"PKPaymentAuthorizationStatusInvalidShippingPostalAddress";
        break;
      case 4:
        id v7 = @"PKPaymentAuthorizationStatusInvalidShippingContact";
        break;
      case 5:
        id v7 = @"PKPaymentAuthorizationStatusPINRequired";
        break;
      case 6:
        id v7 = @"PKPaymentAuthorizationStatusPINIncorrect";
        break;
      case 7:
        id v7 = @"PKPaymentAuthorizationStatusPINLockout";
        break;
      default:
        if (v6 == 1000) {
          id v7 = @"PKPaymentAuthorizationStatusTryAgain";
        }
        else {
          id v7 = @"unknown";
        }
        break;
    }
    uint64_t v8 = [v4 session];
    *(_DWORD *)buf = 138412546;
    long long v42 = v7;
    __int16 v43 = 2112;
    long long v44 = v8;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Received merchant session update with status:%@ session:%@", buf, 0x16u);
  }
  unint64_t state = self->_state;
  BOOL v10 = state > 0x10;
  uint64_t v11 = (1 << state) & 0x1A000;
  if (v10 || v11 == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    [(PKPaymentAuthorizationStateMachine *)self _cancelClientCallbackTimer];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__PKPaymentAuthorizationStateMachine_didReceiveMerchantSessionCompleteWithUpdate___block_invoke;
    aBlock[3] = &unk_1E56D8AE0;
    aBlock[4] = self;
    uint64_t v13 = (void (**)(void))_Block_copy(aBlock);
    if ([v4 status]
      || ([v4 session], id v14 = objc_claimAutoreleasedReturnValue(), v14, !v14))
    {
      v13[2](v13);
    }
    else
    {
      __int16 v15 = [v4 session];
      if (PKBypassCertValidation())
      {
        BOOL v16 = 0;
      }
      else
      {
        char v17 = PKValidatePaymentMerchantSession(v15);
        BOOL v16 = v17 != 0;
      }
      uint64_t v18 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      uint64_t v19 = [v18 APIType];

      if ((unint64_t)(v19 - 1) > 1)
      {
        int v22 = 0;
      }
      else
      {
        uint64_t v20 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
        uint64_t v21 = [(id)v20 originatingURL];

        LODWORD(v20) = [v15 supportsURL:v21];
        int v22 = v20 ^ 1;
      }
      if ((v16 | v22))
      {
        v13[2](v13);
      }
      else
      {
        [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
        __int16 v23 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
        [v23 setMerchantSession:v15];

        [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
        uint64_t v24 = [v15 merchantIdentifier];
        uint64_t v25 = (void *)v24;
        if (v24)
        {
          v39[0] = @"eventType";
          v39[1] = @"merchantIdentifier";
          v40[0] = @"stateChange";
          v40[1] = v24;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
          v27 = id v26 = v25;
          +[PKAnalyticsReporter subject:@"inApp" sendEvent:v27];

          uint64_t v25 = v26;
        }
        uint64_t v28 = [v15 operationalAnalyticsIdentifier];
        if (v28)
        {
          id v36 = v25;
          id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v29 setObject:@"stateChange" forKeyedSubscript:@"eventType"];
          [v29 setObject:v28 forKeyedSubscript:@"analyticsIdentifier"];
          id v30 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
          int v31 = [v30 originatingURL];

          if (v31)
          {
            id v32 = [v31 host];
            [v29 setObject:v32 forKeyedSubscript:@"merchantDomain"];
          }
          id v33 = objc_msgSend(v29, "copy", v36);
          +[PKAnalyticsReporter subject:@"inApp" sendEvent:v33];

          uint64_t v25 = v37;
        }
        uint64_t v34 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
        uint64_t v35 = [v34 requestType];

        if (v35 == 5) {
          [(PKPaymentAuthorizationStateMachine *)self _performInstallmentBind];
        }
        else {
          [(PKPaymentAuthorizationStateMachine *)self _enqueueInitialCallbacks];
        }
        [(PKPaymentAuthorizationStateMachine *)self _configureAdditionalPaymentMethodsIfNeeeded];
        [(PKPaymentAuthorizationStateMachine *)self _fetchAdditionalPaymentMethodDataIfNeeded];
        [(PKPaymentAuthorizationStateMachine *)self _updatePassRewardsInfo];
      }
    }
  }
}

void __82__PKPaymentAuthorizationStateMachine_didReceiveMerchantSessionCompleteWithUpdate___block_invoke(uint64_t a1)
{
  unint64_t v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_error_impl(&dword_190E10000, v2, OS_LOG_TYPE_ERROR, "Application failed to provide a valid merchant session. We can't proceed to authorize the transaction.", v6, 2u);
  }

  BOOL v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:0];
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v3];
  [v4 _setState:15 param:v5];
}

- (void)didChangeCouponCode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPaymentAuthorizationDataModel *)self->_model couponCode];
  id v8 = v4;
  id v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
    [(PKPaymentAuthorizationDataModel *)self->_model setNumberOfOutstandingCouponCodeUpdates:[(PKPaymentAuthorizationDataModel *)self->_model numberOfOutstandingCouponCodeUpdates]+ 1];
    [(PKPaymentAuthorizationDataModel *)self->_model setCouponCode:v8];
    [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
    [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:10 withObject:v8];
  }
LABEL_9:
}

- (void)didReceiveCouponCodeCompleteWithUpdate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 status];
  char v7 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = (void *)v8;
    BOOL v10 = @"PKPaymentAuthorizationStatusSuccess";
    switch(v6)
    {
      case 0:
        break;
      case 1:
        BOOL v10 = @"PKPaymentAuthorizationStatusFailure";
        break;
      case 2:
        BOOL v10 = @"PKPaymentAuthorizationStatusInvalidBillingPostalAddress";
        break;
      case 3:
        BOOL v10 = @"PKPaymentAuthorizationStatusInvalidShippingPostalAddress";
        break;
      case 4:
        BOOL v10 = @"PKPaymentAuthorizationStatusInvalidShippingContact";
        break;
      case 5:
        BOOL v10 = @"PKPaymentAuthorizationStatusPINRequired";
        break;
      case 6:
        BOOL v10 = @"PKPaymentAuthorizationStatusPINIncorrect";
        break;
      case 7:
        BOOL v10 = @"PKPaymentAuthorizationStatusPINLockout";
        break;
      default:
        if (v6 == 1000) {
          BOOL v10 = @"PKPaymentAuthorizationStatusTryAgain";
        }
        else {
          BOOL v10 = @"unknown";
        }
        break;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    uint64_t v24 = v10;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ status: %{public}@", buf, 0x16u);
  }
  [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
  [(PKPaymentAuthorizationDataModel *)self->_model setNumberOfOutstandingCouponCodeUpdates:[(PKPaymentAuthorizationDataModel *)self->_model numberOfOutstandingCouponCodeUpdates]- 1];
  uint64_t v11 = [v5 errors];
  [(PKPaymentAuthorizationDataModel *)self->_model setCouponCodeErrors:v11];
  [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
  if (![(PKPaymentAuthorizationDataModel *)self->_model numberOfOutstandingCouponCodeUpdates])
  {
    id v12 = [v11 firstObject];
    [(PKPaymentAuthorizationStateMachine *)self _trackCouponCodeOutcomeWithError:v12];
  }
  unint64_t state = self->_state;
  if (state > 0x10 || ((1 << state) & 0x1A000) == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    [(PKPaymentAuthorizationStateMachine *)self _cancelClientCallbackTimer];
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190E10000, v7, OS_LOG_TYPE_ERROR, "Application failed to process coupon code change. This means that the coupon code and summary items are out of sync. We can't proceed to authorize the transaction.", buf, 2u);
      }

      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:0];
      __int16 v15 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v14];
      [(PKPaymentAuthorizationStateMachine *)self _setState:15 param:v15];
    }
    else
    {
      id v14 = [v5 availableShippingMethods];
      __int16 v15 = [v5 paymentSummaryItems];
      BOOL v16 = [v5 multiTokenContexts];
      char v17 = [v5 recurringPaymentRequest];
      uint64_t v18 = [v5 automaticReloadPaymentRequest];
      uint64_t v19 = [v5 deferredPaymentRequest];
      uint64_t v20 = [v5 contentItems];
      [(PKPaymentAuthorizationStateMachine *)self _updateModelWithShippingMethods:v14 paymentSummaryItems:v15 multiTokenContexts:v16 recurringPaymentRequest:v17 automaticReloadPaymentRequest:v18 deferredPaymentRequest:v19 contentItems:v20];
    }
  }
}

- (void)didEncounterShippingEmailError:(id)a3
{
  [(PKPaymentAuthorizationDataModel *)self->_model setShippingEmailError:a3];
  [(PKPaymentAuthorizationStateMachine *)self _processErrorsForDataType:7];
}

- (void)didSelectShippingEmail:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPaymentAuthorizationDataModel *)self->_model shippingEmail];

  id v5 = v6;
  if (v4 != v6)
  {
    [(PKPaymentAuthorizationDataModel *)self->_model setShippingEmail:v6];
    [(PKPaymentAuthorizationStateMachine *)self _processErrorsForDataType:7];
    [(PKPaymentAuthorizationStateMachine *)self _updateAssessmentAttributes];
    id v5 = v6;
  }
}

- (void)didSelectShippingPhoneNumber:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPaymentAuthorizationDataModel *)self->_model shippingPhone];

  id v5 = v6;
  if (v4 != v6)
  {
    [(PKPaymentAuthorizationDataModel *)self->_model setShippingPhone:v6];
    [(PKPaymentAuthorizationStateMachine *)self _processErrorsForDataType:7];
    [(PKPaymentAuthorizationStateMachine *)self _updateAssessmentAttributes];
    id v5 = v6;
  }
}

- (void)didSelectShippingName:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPaymentAuthorizationDataModel *)self->_model shippingName];

  id v5 = v6;
  if (v4 != v6)
  {
    [(PKPaymentAuthorizationDataModel *)self->_model setShippingName:v6];
    [(PKPaymentAuthorizationStateMachine *)self _processErrorsForDataType:7];
    [(PKPaymentAuthorizationStateMachine *)self _updateAssessmentAttributes];
    id v5 = v6;
  }
}

- (void)didSelectBillingAddress:(id)a3
{
  id v16 = a3;
  id v4 = [(PKPaymentAuthorizationDataModel *)self->_model billingAddress];

  id v5 = v16;
  if (v4 != v16)
  {
    -[PKPaymentAuthorizationDataModel setBillingAddress:](self->_model, "setBillingAddress:");
    if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 2) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 3;
    }
    [(PKPaymentAuthorizationStateMachine *)self _processErrorsForDataType:v6];
    char v7 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    uint64_t v8 = [v7 requiredShippingContactFields];
    char v9 = [v8 containsObject:@"post"];

    if (v9) {
      goto LABEL_18;
    }
    int64_t v10 = [(PKPaymentAuthorizationDataModel *)self->_model fundingMode];
    if (v10 != 2)
    {
      if (v10 == 1)
      {
        __int16 v15 = [(PKPaymentAuthorizationDataModel *)self->_model financingController];
        id v12 = [v15 payLaterAccount];

        if (v12) {
          [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectPayLaterFinancingWithAccount:v12];
        }
LABEL_17:

        goto LABEL_18;
      }
      if (v10)
      {
LABEL_18:
        [(PKPaymentAuthorizationStateMachine *)self _updateAssessmentAttributes];
        id v5 = v16;
        goto LABEL_19;
      }
    }
    if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 2
      && ([(PKPaymentAuthorizationDataModel *)self->_model remotePaymentInstrument],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      id v12 = [(PKPaymentAuthorizationDataModel *)self->_model remotePaymentInstrument];
      [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectRemotePaymentInstrument:v12];
    }
    else
    {
      if ([(PKPaymentAuthorizationDataModel *)self->_model mode] != 1) {
        goto LABEL_18;
      }
      uint64_t v13 = [(PKPaymentAuthorizationDataModel *)self->_model pass];

      if (!v13) {
        goto LABEL_18;
      }
      id v12 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
      id v14 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
      [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectPaymentPass:v12 paymentApplication:v14];
    }
    goto LABEL_17;
  }
LABEL_19:
}

- (void)didSelectFinancingOption:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "didSelectFinancingOption called with option %@", (uint8_t *)&v8, 0xCu);
  }

  [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
  [(PKPaymentAuthorizationDataModel *)self->_model setSelectedFinancingOption:v4];
  if (v4)
  {
    uint64_t v6 = [(PKPaymentAuthorizationDataModel *)self->_model financingController];
    char v7 = [v6 payLaterAccount];

    [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectPayLaterFinancingWithAccount:v7];
    if (_os_feature_enabled_impl()) {
      [(PKPaymentAuthorizationStateMachine *)self didChangeFundingMode:1];
    }
  }
  [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
}

- (void)didSelectPaymentOffer:(id)a3
{
}

- (void)didSelectPaymentOffer:(id)a3 updateReason:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(PKPaymentOffersController *)self->_paymentOffersController selectedOfferDetails];
  id v8 = [(PKPaymentAuthorizationDataModel *)self->_model selectedPaymentOffer];
  id v9 = v8;
  if (v6 && v8)
  {
    if ([v8 isEqual:v6]) {
      goto LABEL_4;
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v8 != v6) {
    goto LABEL_7;
  }
LABEL_4:
  char v10 = [v7 requiresUserAction];

  if ((v10 & 1) == 0) {
    goto LABEL_34;
  }
LABEL_8:
  uint64_t v11 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "didSelectPaymentOffer called with offer %@", (uint8_t *)&v19, 0xCu);
  }

  id v12 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
  uint64_t v13 = [v12 uniqueID];

  if (v6)
  {
    id v14 = [v6 passUniqueID];
    id v15 = v13;
    id v16 = v15;
    if (v14 == v15)
    {
    }
    else
    {
      if (!v15 || !v14)
      {

LABEL_26:
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          id v20 = v16;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Error: The selected payment offer passUniqueID doesnt match the selected passUniqueID: %@", (uint8_t *)&v19, 0xCu);
        }

        goto LABEL_33;
      }
      char v17 = [v14 isEqualToString:v15];

      if ((v17 & 1) == 0) {
        goto LABEL_26;
      }
    }
  }
  if (a4 != 2) {
    [(PKPaymentOffersController *)self->_paymentOffersController updateCurrentSelectedPaymentOffer:v6 updateReason:a4];
  }
  [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
  [(PKPaymentAuthorizationDataModel *)self->_model setSelectedPaymentOffer:v6];
  if (_os_feature_enabled_impl())
  {
    if (a4 == 1) {
      [(PKPaymentOffersController *)self->_paymentOffersController clearCurrentSelectedPaymentOfferDetails];
    }
    if (([v7 requiresUserAction] & 1) == 0)
    {
      if (v6)
      {
        uint64_t v18 = 2;
LABEL_31:
        [(PKPaymentAuthorizationStateMachine *)self didChangeFundingMode:v18];
        goto LABEL_32;
      }
      if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 2)
      {
        [(PKPaymentOffersController *)self->_paymentOffersController clearCurrentSelectedPaymentOfferDetails];
        uint64_t v18 = 0;
        goto LABEL_31;
      }
    }
  }
LABEL_32:
  [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
LABEL_33:

LABEL_34:
}

- (void)_processErrorsForDataType:(int64_t)a3
{
  v20[5] = *MEMORY[0x1E4F143B8];
  if (self->_state == 3)
  {
    id v5 = -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = 0;
      char v6 = [v5 isValidWithError:&v18];
      id v7 = v18;
      if ((v6 & 1) == 0)
      {
        id v8 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
        id v9 = +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:a3 status:1 error:v7 clientErrors:v8];

        char v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", objc_msgSend(v7, "code"));
        if (os_variant_has_internal_ui())
        {
          uint64_t v11 = [v7 localizedFailureReason];
          if (!v11)
          {
            uint64_t v11 = [v7 localizedDescription];
          }
        }
        else
        {
          uint64_t v11 = 0;
        }
        v20[0] = @"preferenceError";
        v19[0] = @"eventType";
        v19[1] = @"preferenceType";
        if ((unint64_t)a3 > 0x13) {
          id v12 = @"unknown";
        }
        else {
          id v12 = off_1E56E2128[a3];
        }
        v20[1] = v12;
        v19[2] = @"errorDomain";
        uint64_t v13 = [v7 domain];
        id v14 = (void *)v13;
        id v15 = &stru_1EE0F5368;
        if (v13) {
          id v16 = (__CFString *)v13;
        }
        else {
          id v16 = &stru_1EE0F5368;
        }
        v20[2] = v16;
        v20[3] = v10;
        v19[3] = @"errorCode";
        v19[4] = @"errorText";
        if (v11) {
          id v15 = v11;
        }
        v20[4] = v15;
        char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];
        +[PKAnalyticsReporter subject:@"inApp" sendEvent:v17];

        [(PKPaymentAuthorizationStateMachine *)self _setState:3 param:v9];
        goto LABEL_19;
      }
    }
    else
    {
      id v7 = 0;
    }
    [(PKPaymentAuthorizationStateMachine *)self _setState:5 param:0];
LABEL_19:
  }
}

- (void)didSelectShippingContact:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  model = self->_model;
  if (v4)
  {
    [(PKPaymentAuthorizationDataModel *)model setShippingAddress:v4];
    char v6 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:5];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 isValidWithError:0])
    {
      [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectShippingContact:v4];
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Selected contact is not valid (either same contact, or doesn't possess required fields) - bypassing callback, moving straight to invalid state", buf, 2u);
      }

      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28588];
      id v9 = NSString;
      char v10 = [(PKPaymentAuthorizationStateMachine *)self model];
      uint64_t v11 = [v10 shippingType];
      id v12 = [v9 stringWithFormat:@"IN_APP_PAYMENT_%@_ADDRESS_INCOMPLETE_REASON", v11];
      uint64_t v13 = PKLocalizedPaymentString(v12, 0);
      v20[0] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v15 = [v8 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v14];

      id v16 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
      char v17 = +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:5 status:1 error:v15 clientErrors:v16];

      [(PKPaymentAuthorizationStateMachine *)self _setState:3 param:v17];
    }
  }
  else
  {
    [(PKPaymentAuthorizationDataModel *)model setShippingAddress:0];
  }
}

- (void)didChangePeerPaymentUsage:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
  model = self->_model;
  if (v3)
  {
    char v6 = [(PKPaymentAuthorizationDataModel *)model peerPaymentAccount];
    id v7 = [v6 currentBalance];

    [(PKPaymentAuthorizationDataModel *)self->_model setPeerPaymentBalanceForAccountPayment:v7];
    id v8 = self->_model;
    id v9 = [(PKPaymentAuthorizationDataModel *)v8 itemForType:2];
    [(PKPaymentAuthorizationDataModel *)v8 setUsePeerPaymentBalance:v9 != 0];
  }
  else
  {
    [(PKPaymentAuthorizationDataModel *)model setPeerPaymentBalanceForAccountPayment:0];
    [(PKPaymentAuthorizationDataModel *)self->_model setUsePeerPaymentBalance:0];
    id v7 = 0;
  }
  [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
  char v10 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 isValidWithError:0])
  {
    uint64_t v11 = [v10 pass];
    [v11 setPeerPaymentBalance:v7];

    if (v3)
    {
      id v12 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      uint64_t v13 = [v12 accountServiceTransferRequest];
      int v14 = [v13 supportsSplitPayment];

      if (v14)
      {
        id v15 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
        id v16 = [v15 paymentSummaryItems];
        char v17 = [v16 lastObject];
        id v18 = [v17 amount];

        uint64_t v19 = [v7 amount];
        uint64_t v20 = [v18 compare:v19];

        if (v20 == 1) {
          uint64_t v21 = 3;
        }
        else {
          uint64_t v21 = 2;
        }
      }
      else
      {
        uint64_t v21 = 2;
      }
    }
    else
    {
      uint64_t v21 = 1;
    }
    __int16 v23 = [PKAccountServicePaymentMethod alloc];
    uint64_t v24 = [(PKPaymentAuthorizationDataModel *)self->_model bankAccount];
    uint64_t v25 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    id v26 = -[PKAccountServicePaymentMethod initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:](v23, "initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:", v24, v7, [v25 deviceSupportsPeerPaymentAccountPayment], v21);

    [(PKPaymentAuthorizationStateMachine *)self _enqueueDidUpdateAccountServicePaymentMethod:v26];
  }
  else
  {
    uint64_t v22 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Selected peer payment usage is not valid - bypassing callback", v27, 2u);
    }
  }
}

- (void)didSelectBankAccount:(id)a3
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationStateMachine *)self model];
  [v5 setBankAccount:v4];
  char v6 = [v4 identifier];
  PKSharedCacheSetObjectForKey(v6, @"LastBankAccountIdentifier");

  id v7 = [v5 itemForType:9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v8 = [v7 isValidWithError:0];
  }
  else {
    char v8 = 0;
  }
  id v9 = [v5 paymentRequest];
  char v10 = [v9 accountServiceTransferRequest];

  uint64_t v11 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  id v12 = [v11 accountServiceTransferRequest];
  int v13 = [v12 supportsSplitPayment];

  if (v10)
  {
    int v14 = [v10 account];
    id v15 = [v14 accountIdentifier];
    id v16 = [v4 identifier];
    PKSetLastBankAccountIdentifierForAccountTransfer((uint64_t)v15, v16);
  }
  uint64_t v17 = [v5 itemForType:2];
  id v18 = (void *)v17;
  if (v8)
  {
    uint64_t v19 = 3;
    if (!v13) {
      uint64_t v19 = 1;
    }
    if (v17) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 1;
    }
    goto LABEL_26;
  }
  uint64_t v21 = [v5 peerPaymentBalanceForAccountPayment];
  uint64_t v22 = [v21 amount];

  if (v18 && v22)
  {
    if (v10) {
      char v23 = v13;
    }
    else {
      char v23 = 1;
    }
    if ((v23 & 1) == 0)
    {

LABEL_25:
      uint64_t v20 = 2;
LABEL_26:
      id v37 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      if ([v37 deviceSupportsPeerPaymentAccountPayment]
        && [v37 accountPaymentUsePeerPaymentBalance])
      {
        uint64_t v39 = [(PKPaymentAuthorizationDataModel *)self->_model peerPaymentBalanceForAccountPayment];
      }
      else
      {
        uint64_t v39 = 0;
      }
      if (v10) {
        BOOL v40 = v18 == 0;
      }
      else {
        BOOL v40 = 1;
      }
      if (v40) {
        int v41 = 1;
      }
      else {
        int v41 = v13;
      }
      if (v41 == 1)
      {
        long long v42 = v7;
        __int16 v43 = -[PKAccountServicePaymentMethod initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:]([PKAccountServicePaymentMethod alloc], "initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:", v4, v39, [v37 deviceSupportsPeerPaymentAccountPayment], v20);
        [(PKPaymentAuthorizationStateMachine *)self _enqueueDidUpdateAccountServicePaymentMethod:v43];

        id v7 = v42;
      }
      else
      {
        long long v44 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v44, OS_LOG_TYPE_DEFAULT, "Selected bank account is not used - bypassing callback", buf, 2u);
        }
      }
      goto LABEL_41;
    }
    uint64_t v45 = [v5 paymentRequest];
    uint64_t v24 = [v45 paymentSummaryItems];
    [v24 lastObject];
    uint64_t v25 = v46 = v7;
    id v26 = [v25 amount];

    uint64_t v27 = [v26 compare:v22];
    BOOL v40 = v27 == 1;
    id v7 = v46;
    if (!v40) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  id v47 = v7;
  uint64_t v28 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Selected bank account is not valid - bypassing callback, moving straight to invalid state", buf, 2u);
  }

  id v29 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v49 = *MEMORY[0x1E4F28588];
  uint64_t v35 = PKLocalizedFeatureString(@"IN_APP_PAYMENT_BANK_ACCOUNT_INCOMPLETE_REASON", 2, 0, v30, v31, v32, v33, v34, (uint64_t)v45);
  v50[0] = v35;
  id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  id v37 = [v29 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v36];

  id v38 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
  uint64_t v39 = +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:9 status:1 error:v37 clientErrors:v38];

  [(PKPaymentAuthorizationStateMachine *)self _setState:3 param:v39];
  id v7 = v47;
LABEL_41:
}

- (void)didReceiveShippingContactCompleteWithUpdate:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 status];
  id v7 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    id v9 = (void *)v8;
    char v10 = @"PKPaymentAuthorizationStatusSuccess";
    switch(v6)
    {
      case 0:
        break;
      case 1:
        char v10 = @"PKPaymentAuthorizationStatusFailure";
        break;
      case 2:
        char v10 = @"PKPaymentAuthorizationStatusInvalidBillingPostalAddress";
        break;
      case 3:
        char v10 = @"PKPaymentAuthorizationStatusInvalidShippingPostalAddress";
        break;
      case 4:
        char v10 = @"PKPaymentAuthorizationStatusInvalidShippingContact";
        break;
      case 5:
        char v10 = @"PKPaymentAuthorizationStatusPINRequired";
        break;
      case 6:
        char v10 = @"PKPaymentAuthorizationStatusPINIncorrect";
        break;
      case 7:
        char v10 = @"PKPaymentAuthorizationStatusPINLockout";
        break;
      default:
        if (v6 == 1000) {
          char v10 = @"PKPaymentAuthorizationStatusTryAgain";
        }
        else {
          char v10 = @"unknown";
        }
        break;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v39 = v8;
    __int16 v40 = 2114;
    int v41 = v10;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ status: %{public}@", buf, 0x16u);
  }
  uint64_t v11 = [v5 errors];
  id v12 = [(PKPaymentAuthorizationStateMachine *)self sanitizeClientErrors:v11];

  if (![v12 count] && v6 == 3)
  {
    int v13 = [(PKPaymentAuthorizationStateMachine *)self model];
    uint64_t v14 = [v13 paymentErrorsFromLegacyStatus:3];

    id v12 = (void *)v14;
  }
  uint64_t v15 = [v12 count];
  id v16 = (void *)MEMORY[0x1E4F1C978];
  id v37 = @"post";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  id v18 = objc_msgSend(v16, "pk_FilteredShippingErrorsForContactFields:errors:contactFieldOptional:", v17, v12, 1);

  if (v15 != [v18 count])
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Some errors provided were stripped out (not address related).", buf, 2u);
    }
  }
  [(PKPaymentAuthorizationDataModel *)self->_model setShippingAddressErrors:v18];
  unint64_t state = self->_state;
  if (state > 0x10 || ((1 << state) & 0x1A000) == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    [(PKPaymentAuthorizationStateMachine *)self _cancelClientCallbackTimer];
    if (v6)
    {
      if (v6 == 3)
      {
LABEL_28:
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28588];
        uint64_t v21 = NSString;
        uint64_t v22 = [(PKPaymentAuthorizationStateMachine *)self model];
        char v23 = [v22 shippingType];
        uint64_t v24 = [v21 stringWithFormat:@"IN_APP_PAYMENT_%@_ADDRESS_INCOMPLETE_REASON", v23];
        uint64_t v25 = PKLocalizedPaymentString(v24, 0);
        id v36 = v25;
        id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        uint64_t v27 = [v20 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v26];

        uint64_t v28 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
        id v29 = +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:5 status:1 error:v27 clientErrors:v28];

        [(PKPaymentAuthorizationStateMachine *)self _setState:3 param:v29];
        [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
LABEL_33:

        goto LABEL_34;
      }
    }
    else if (![v18 count])
    {
      uint64_t v27 = [v5 availableShippingMethods];
      id v29 = [v5 paymentSummaryItems];
      uint64_t v30 = [v5 multiTokenContexts];
      uint64_t v31 = [v5 recurringPaymentRequest];
      uint64_t v32 = [v5 automaticReloadPaymentRequest];
      uint64_t v33 = [v5 deferredPaymentRequest];
      uint64_t v34 = [v5 contentItems];
      [(PKPaymentAuthorizationStateMachine *)self _updateModelWithShippingMethods:v27 paymentSummaryItems:v29 multiTokenContexts:v30 recurringPaymentRequest:v31 automaticReloadPaymentRequest:v32 deferredPaymentRequest:v33 contentItems:v34];

      goto LABEL_33;
    }
    if (![v18 count])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Application failed to process shipping address change. This means that the user's shipping address selection and summary items are out of sync, or inappropriate errors have been provided. We can't proceed to authorize the transaction.", buf, 2u);
      }

      uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:0];
      id v29 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v27];
      [(PKPaymentAuthorizationStateMachine *)self _setState:15 param:v29];
      goto LABEL_33;
    }
    goto LABEL_28;
  }
LABEL_34:
}

- (void)didReceiveShippingContactCompleteWithStatus:(int64_t)a3 shippingMethods:(id)a4 paymentSummaryItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  char v10 = [(PKPaymentAuthorizationStateMachine *)self model];
  id v12 = [v10 paymentErrorsFromLegacyStatus:a3];

  uint64_t v11 = [[PKPaymentRequestShippingContactUpdate alloc] initWithErrors:v12 paymentSummaryItems:v8 shippingMethods:v9];
  [(PKPaymentRequestUpdate *)v11 setStatus:a3];
  [(PKPaymentAuthorizationStateMachine *)self didReceiveShippingContactCompleteWithUpdate:v11];
}

- (void)didSelectShippingMethod:(id)a3
{
}

- (void)didReceiveShippingMethodCompleteWithUpdate:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 status];
  id v7 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    id v9 = (void *)v8;
    char v10 = @"PKPaymentAuthorizationStatusSuccess";
    switch(v6)
    {
      case 0:
        break;
      case 1:
        char v10 = @"PKPaymentAuthorizationStatusFailure";
        break;
      case 2:
        char v10 = @"PKPaymentAuthorizationStatusInvalidBillingPostalAddress";
        break;
      case 3:
        char v10 = @"PKPaymentAuthorizationStatusInvalidShippingPostalAddress";
        break;
      case 4:
        char v10 = @"PKPaymentAuthorizationStatusInvalidShippingContact";
        break;
      case 5:
        char v10 = @"PKPaymentAuthorizationStatusPINRequired";
        break;
      case 6:
        char v10 = @"PKPaymentAuthorizationStatusPINIncorrect";
        break;
      case 7:
        char v10 = @"PKPaymentAuthorizationStatusPINLockout";
        break;
      default:
        if (v6 == 1000) {
          char v10 = @"PKPaymentAuthorizationStatusTryAgain";
        }
        else {
          char v10 = @"unknown";
        }
        break;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = v8;
    __int16 v24 = 2114;
    uint64_t v25 = v10;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ status: %{public}@", buf, 0x16u);
  }
  unint64_t state = self->_state;
  BOOL v12 = state > 0x10;
  uint64_t v13 = (1 << state) & 0x1A000;
  if (v12 || v13 == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    [(PKPaymentAuthorizationStateMachine *)self _cancelClientCallbackTimer];
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Application failed to process shipping method change. This means that the user's shipping method selection and summary items are out of sync. We can't proceed to authorize the transaction.", buf, 2u);
      }

      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:0];
      id v16 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v15];
      [(PKPaymentAuthorizationStateMachine *)self _setState:15 param:v16];
    }
    else
    {
      uint64_t v15 = [v5 availableShippingMethods];
      id v16 = [v5 paymentSummaryItems];
      uint64_t v17 = [v5 multiTokenContexts];
      id v18 = [v5 recurringPaymentRequest];
      uint64_t v19 = [v5 automaticReloadPaymentRequest];
      uint64_t v20 = [v5 deferredPaymentRequest];
      uint64_t v21 = [v5 contentItems];
      [(PKPaymentAuthorizationStateMachine *)self _updateModelWithShippingMethods:v15 paymentSummaryItems:v16 multiTokenContexts:v17 recurringPaymentRequest:v18 automaticReloadPaymentRequest:v19 deferredPaymentRequest:v20 contentItems:v21];
    }
  }
}

- (void)didReceiveUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
  id v8 = a4;
  uint64_t v6 = [a3 paymentSummaryItems];
  [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
  [(PKPaymentAuthorizationStateMachine *)self _updateModelWithPaymentSummaryItems:v6];
  if (v8)
  {
    id v7 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    [v7 setApplePayTrustSignatureRequest:v8];
  }
  [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
  self->_awaitingClientCallbackReply = 0;
  [(PKPaymentAuthorizationStateMachine *)self _cancelClientCallbackTimer];
  [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
}

- (void)didReceiveShippingMethodCompleteWithStatus:(int64_t)a3 paymentSummaryItems:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(PKPaymentRequestShippingMethodUpdate);
  [(PKPaymentRequestUpdate *)v7 setStatus:a3];
  [(PKPaymentRequestUpdate *)v7 setPaymentSummaryItems:v6];

  [(PKPaymentAuthorizationStateMachine *)self didReceiveShippingMethodCompleteWithUpdate:v7];
}

- (void)didSelectPaymentPass:(id)a3 paymentApplication:(id)a4
{
  [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectPaymentPass:a3 paymentApplication:a4];
  if (a3 && _os_feature_enabled_impl())
  {
    [(PKPaymentAuthorizationStateMachine *)self didChangeFundingMode:0];
  }
}

- (void)didSelectRemotePaymentInstrument:(id)a3
{
  id v4 = a3;
  id v5 = [v4 primaryPaymentApplication];
  [(PKPaymentAuthorizationStateMachine *)self didSelectRemotePaymentInstrument:v4 paymentApplication:v5];
}

- (void)didSelectRemotePaymentInstrument:(id)a3 paymentApplication:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    char v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = v10;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "State machine %@: %@", buf, 0x16u);
  }
  if (self->_hasReceivedRemoteDeviceUpdate)
  {
    uint64_t v11 = [(PKPaymentAuthorizationStateMachine *)self continuityPaymentCoordinator];
    BOOL v12 = [v11 currentRemotePaymentRequest];

    uint64_t v13 = [v12 device];
    uint64_t v14 = [(PKPaymentAuthorizationStateMachine *)self model];
    uint64_t v15 = [v14 remoteDevice];
    char v16 = [v13 isEqual:v15];

    if (v16)
    {
      id v29 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      uint64_t v25 = [v29 availableShippingMethods];
      [(PKPaymentAuthorizationDataModel *)self->_model paymentSummaryItems];
      uint64_t v17 = v28 = v7;
      uint64_t v27 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      id v18 = [v27 multiTokenContexts];
      uint64_t v26 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      uint64_t v19 = [v26 recurringPaymentRequest];
      uint64_t v20 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      uint64_t v21 = [v20 automaticReloadPaymentRequest];
      uint64_t v22 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      uint64_t v23 = [v22 deferredPaymentRequest];
      [(PKPaymentAuthorizationStateMachine *)self _performSendClientUpdateWithShippingMethods:v25 paymentSummaryItems:v17 multiTokenContexts:v18 recurringPaymentRequest:v19 automaticReloadPaymentRequest:v21 deferredPaymentRequest:v23 paymentApplication:v8 status:0];

      id v7 = v28;
    }
    else
    {
      __int16 v24 = [(PKContinuityPaymentCoordinator *)self->_continuityPaymentCoordinator currentRemotePaymentRequest];

      if (v24) {
        [(PKPaymentAuthorizationStateMachine *)self _performCancelRemotePaymentRequest];
      }
      [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
    }
    [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectRemotePaymentInstrument:v7 paymentApplication:v8];
  }
}

- (void)didReceivePaymentMethodCompleteWithUpdate:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 status];
  id v6 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"PKPaymentAuthorizationStatusSuccess";
    switch(v5)
    {
      case 0:
        break;
      case 1:
        id v7 = @"PKPaymentAuthorizationStatusFailure";
        break;
      case 2:
        id v7 = @"PKPaymentAuthorizationStatusInvalidBillingPostalAddress";
        break;
      case 3:
        id v7 = @"PKPaymentAuthorizationStatusInvalidShippingPostalAddress";
        break;
      case 4:
        id v7 = @"PKPaymentAuthorizationStatusInvalidShippingContact";
        break;
      case 5:
        id v7 = @"PKPaymentAuthorizationStatusPINRequired";
        break;
      case 6:
        id v7 = @"PKPaymentAuthorizationStatusPINIncorrect";
        break;
      case 7:
        id v7 = @"PKPaymentAuthorizationStatusPINLockout";
        break;
      default:
        if (v5 == 1000) {
          id v7 = @"PKPaymentAuthorizationStatusTryAgain";
        }
        else {
          id v7 = @"unknown";
        }
        break;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v45 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Received didReceivePaymentMethodCompleteWithUpdate: %{public}@", buf, 0xCu);
  }

  unint64_t state = self->_state;
  BOOL v9 = state > 0x10;
  uint64_t v10 = (1 << state) & 0x1A000;
  if (v9 || v10 == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    [(PKPaymentAuthorizationStateMachine *)self _cancelClientCallbackTimer];
    if (v5
      || ([v4 errors],
          BOOL v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 count],
          v12,
          v13))
    {
      uint64_t v14 = [v4 errors];
      uint64_t v15 = [v14 count];

      BOOL v16 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v16)
        {
          uint64_t v17 = [v4 errors];
          *(_DWORD *)buf = 138543362;
          uint64_t v45 = v17;
          _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Application failed to process billing address with errors: %{public}@", buf, 0xCu);
        }
        id v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v42 = *MEMORY[0x1E4F28588];
        uint64_t v19 = [NSString stringWithFormat:@"IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE_REASON"];
        uint64_t v20 = PKLocalizedPaymentString(v19, 0);
        __int16 v43 = v20;
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        uint64_t v22 = [v18 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v21];

        uint64_t v23 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
        __int16 v24 = +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:3 status:1 error:v22 clientErrors:v23];

        [(PKPaymentAuthorizationStateMachine *)self _setState:3 param:v24];
        [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
      }
      else
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "The app returned PKPaymentAuthorizationStatusFailure from the payment method update callback.", buf, 2u);
        }

        uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        uint64_t v26 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_8.isa, 0);
        int v41 = v26;
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        uint64_t v22 = [v25 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v27];

        __int16 v24 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v22];
        [(PKPaymentAuthorizationStateMachine *)self _setState:15 param:v24];
      }
      goto LABEL_36;
    }
    id v28 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    if ([v28 isPeerPaymentRequest])
    {
      id v29 = [v4 peerPaymentQuote];

      if (v29)
      {
        model = self->_model;
        uint64_t v31 = [v4 peerPaymentQuote];
        [(PKPaymentAuthorizationDataModel *)model setPeerPaymentQuote:v31];
        goto LABEL_34;
      }
    }
    else
    {
    }
    __int16 v32 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    uint64_t v33 = [v32 requestType];

    if (v33 != 5)
    {
LABEL_35:
      uint64_t v22 = [v4 availableShippingMethods];
      __int16 v24 = [v4 paymentSummaryItems];
      uint64_t v35 = [v4 multiTokenContexts];
      id v36 = [v4 recurringPaymentRequest];
      id v37 = [v4 automaticReloadPaymentRequest];
      id v38 = [v4 deferredPaymentRequest];
      uint64_t v39 = [v4 contentItems];
      [(PKPaymentAuthorizationStateMachine *)self _updateModelWithShippingMethods:v22 paymentSummaryItems:v24 multiTokenContexts:v35 recurringPaymentRequest:v36 automaticReloadPaymentRequest:v37 deferredPaymentRequest:v38 contentItems:v39];

LABEL_36:
      goto LABEL_37;
    }
    uint64_t v34 = self->_model;
    uint64_t v31 = [v4 installmentGroupIdentifier];
    [(PKPaymentAuthorizationDataModel *)v34 setInstallmentGroupIdentifier:v31];
LABEL_34:

    goto LABEL_35;
  }
LABEL_37:
}

- (void)didReceivePaymentMethodCompleteWithSummaryItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  [(PKPaymentRequestUpdate *)v5 setPaymentSummaryItems:v4];

  [(PKPaymentAuthorizationStateMachine *)self didReceivePaymentMethodCompleteWithUpdate:v5];
}

- (void)didRequestRefreshPaymentMethods
{
  v10[4] = *MEMORY[0x1E4F143B8];
  [(PKPaymentAuthorizationDataModel *)self->_model refreshPaymentMethods];
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model pass];

  if (!v3)
  {
    id v4 = [(PKPaymentAuthorizationDataModel *)self->_model acceptedPasses];
    uint64_t v5 = [v4 firstObject];

    if (v5)
    {
      id v6 = [(PKPaymentAuthorizationDataModel *)self->_model defaultSelectedPaymentApplicationForPass:v5];
      [(PKPaymentAuthorizationDataModel *)self->_model setPass:v5];
      [(PKPaymentAuthorizationDataModel *)self->_model setPaymentApplication:v6];
      [(PKPaymentAuthorizationStateMachine *)self didSelectPaymentPass:v5 paymentApplication:v6];
      v9[0] = @"eventType";
      v9[1] = @"pageTag";
      v10[0] = @"stateChange";
      v10[1] = @"paymentPreferences";
      v9[2] = @"valueSupplied";
      id v7 = PKAnalyticsReportSwitchToggleResultValue(1);
      v9[3] = @"preferenceType";
      id v10[2] = v7;
      v10[3] = @"card";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
      +[PKAnalyticsReporter subject:@"inApp" sendEvent:v8];

      [(PKPaymentAuthorizationStateMachine *)self _updateModelBillingAddressIfNeededForPass:v5];
      [(PKPaymentAuthorizationStateMachine *)self _updateModelCanAddPasses];
    }
    [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
  }
}

- (void)didAuthenticateWithCredential:(id)a3
{
  id v9 = a3;
  if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 3)
  {
    id v4 = objc_alloc_init(PKPayment);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      uint64_t v6 = [v5 requestType];

      if (v6 == 15)
      {
        id v7 = [MEMORY[0x1E4F1C9B8] data];
        [(PKPayment *)v4 setCredential:v7];
      }
      else
      {
        [(PKPayment *)v4 setCredential:v9];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PKPayment *)v4 setAuthKitAuthenticationResults:v9];
      }
    }
    id v8 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithPayment:v4];
    [(PKPaymentAuthorizationStateMachine *)self _setState:12 param:v8];
  }
  else
  {
    id v4 = +[PKPaymentAuthorizationNonceStateParam paramWithCredential:v9];
    [(PKPaymentAuthorizationStateMachine *)self _setState:9 param:v4];
    if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 1) {
      [(PKPaymentAuthorizationDataModel *)self->_model setStatus:0 forItemWithType:3];
    }
  }
}

- (void)didAuthenticateWithAuthenticatorEvaluationResponse:(id)a3
{
  id v4 = +[PKPaymentAuthorizationNonceStateParam paramWithAuthenticatorEvaluationResponse:a3];
  [(PKPaymentAuthorizationStateMachine *)self _setState:9 param:v4];
}

- (void)didReceivePaymentAuthorizationResult:(id)a3
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 status];
  uint64_t v6 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"PKPaymentAuthorizationStatusSuccess";
    switch(v5)
    {
      case 0uLL:
        break;
      case 1uLL:
        id v7 = @"PKPaymentAuthorizationStatusFailure";
        break;
      case 2uLL:
        id v7 = @"PKPaymentAuthorizationStatusInvalidBillingPostalAddress";
        break;
      case 3uLL:
        id v7 = @"PKPaymentAuthorizationStatusInvalidShippingPostalAddress";
        break;
      case 4uLL:
        id v7 = @"PKPaymentAuthorizationStatusInvalidShippingContact";
        break;
      case 5uLL:
        id v7 = @"PKPaymentAuthorizationStatusPINRequired";
        break;
      case 6uLL:
        id v7 = @"PKPaymentAuthorizationStatusPINIncorrect";
        break;
      case 7uLL:
        id v7 = @"PKPaymentAuthorizationStatusPINLockout";
        break;
      default:
        if (v5 == 1000) {
          id v7 = @"PKPaymentAuthorizationStatusTryAgain";
        }
        else {
          id v7 = @"unknown";
        }
        break;
    }
    *(_DWORD *)buf = 138543362;
    v161 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Received didReceivePaymentAuthorizationStatus: %{public}@", buf, 0xCu);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 errors];
    *(_DWORD *)buf = 138412290;
    v161 = v8;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Client errors: %@", buf, 0xCu);
  }
  unint64_t state = self->_state;
  if (state > 0x10 || ((1 << state) & 0x1A000) == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    [(PKPaymentAuthorizationStateMachine *)self _cancelClientCallbackTimer];
    model = self->_model;
    uint64_t v15 = [v4 orderDetails];
    [(PKPaymentAuthorizationDataModel *)model setPendingOrderDetails:v15];

    BOOL v16 = [v4 errors];
    uint64_t v17 = [(PKPaymentAuthorizationStateMachine *)self sanitizeClientErrors:v16];

    if ([v17 count])
    {
      id v18 = [v17 firstObject];
      uint64_t v19 = [v18 domain];
      char v20 = [v19 isEqualToString:@"PKPaymentErrorDomain"];

      uint64_t v21 = [v18 domain];
      unsigned int v22 = [v21 isEqualToString:@"PKDisbursementErrorDomain"];

      if ((v20 & 1) == 0 && !v22)
      {
LABEL_58:

        [(PKPaymentAuthorizationDataModel *)self->_model setPaymentErrors:v17];
        uint64_t v34 = [v17 firstObject];
        v130 = (void *)v34;
        unsigned int v129 = v22;
        if (v34)
        {
          uint64_t v35 = (void *)v34;
          if (os_variant_has_internal_ui())
          {
            id v36 = [v35 localizedFailureReason];
            if (!v36)
            {
              id v36 = [v35 localizedDescription];
            }
          }
          else
          {
            id v36 = 0;
          }
          v158[0] = @"authorizationStatus";
          id v37 = v17;
          if (v5 > 7) {
            uint64_t v39 = @"unknown";
          }
          else {
            uint64_t v39 = off_1E56E21C8[v5];
          }
          v159[0] = v39;
          v158[1] = @"errorDomain";
          uint64_t v40 = [v35 domain];
          int v41 = (void *)v40;
          if (v40) {
            uint64_t v42 = (__CFString *)v40;
          }
          else {
            uint64_t v42 = &stru_1EE0F5368;
          }
          v159[1] = v42;
          v158[2] = @"errorCode";
          uint64_t v43 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", objc_msgSend(v35, "code"));
          long long v44 = (void *)v43;
          v158[3] = @"errorText";
          if (v36) {
            uint64_t v45 = v36;
          }
          else {
            uint64_t v45 = &stru_1EE0F5368;
          }
          v159[2] = v43;
          v159[3] = v45;
          uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:v158 count:4];
          [(PKPaymentAuthorizationStateMachine *)self _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:v46 eventType:@"transactionAuthorizationStatusUpdated"];
        }
        else
        {
          v156 = @"authorizationStatus";
          id v37 = v17;
          if (v5 > 7) {
            id v38 = @"unknown";
          }
          else {
            id v38 = off_1E56E21C8[v5];
          }
          v157 = v38;
          id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
          [(PKPaymentAuthorizationStateMachine *)self _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:v36 eventType:@"transactionAuthorizationStatusUpdated"];
        }

        uint64_t v26 = v37;
        switch(v5)
        {
          case 0uLL:
            id v47 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
            id v48 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
            char v49 = [v48 _isAMPPayment];

            if (v49)
            {
              uint64_t v50 = PKAggDKeyPaymentiTunesPurchaseAuthorizationSuccess;
            }
            else
            {
              if ([v47 requestType])
              {
LABEL_140:
                v100 = [v4 peerPaymentTransactionMetadata];
                v101 = +[PKPaymentAuthorizationSuccessStateParam paramWithPeerPaymentTransactionMetadata:v100];
                [(PKPaymentAuthorizationStateMachine *)self _setState:16 param:v101];

                BOOL v12 = 0;
                uint64_t v11 = 0;
                goto LABEL_169;
              }
              AnalyticsSendEvent();
              uint64_t v50 = PKAggDKeyPaymentInAppPaymentAuthorizationSuccess;
            }
            [(PKAggregateDictionaryProtocol *)self->_aggregateDictionary addValueForScalarKey:*v50 value:1];
            goto LABEL_140;
          case 1uLL:
            goto LABEL_84;
          case 2uLL:
            if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 2) {
              uint64_t v56 = 4;
            }
            else {
              uint64_t v56 = 3;
            }
            v57 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:v56];
            id v133 = 0;
            char v58 = [v57 isValidWithError:&v133];
            BOOL v12 = (__CFString *)v133;

            if ((v58 & 1) != 0
              || ([(__CFString *)v12 localizedFailureReason],
                  (v59 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              v59 = PKLocalizedPaymentString(&cfstr_InAppPaymentBi_1.isa, 0);
            }
            if (!v12)
            {
              BOOL v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-3002 userInfo:0];
            }
            v60 = (void *)MEMORY[0x1E4F28C58];
            v150[0] = *MEMORY[0x1E4F28588];
            uint64_t v61 = [v4 localizedErrorMessageOverride];
            v62 = (void *)v61;
            if (v61) {
              uint64_t v63 = v61;
            }
            else {
              uint64_t v63 = (uint64_t)v59;
            }
            v150[1] = *MEMORY[0x1E4F28A50];
            v151[0] = v63;
            v151[1] = v12;
            long long v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:v150 count:2];
            uint64_t v11 = [v60 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v64];

            long long v65 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
            uint64_t v66 = v56;
            goto LABEL_119;
          case 3uLL:
            long long v67 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:5];
            id v132 = 0;
            char v68 = [v67 isValidWithError:&v132];
            BOOL v12 = (__CFString *)v132;

            if ((v68 & 1) != 0
              || ([(__CFString *)v12 localizedFailureReason],
                  (v59 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              v69 = NSString;
              v70 = [(PKPaymentAuthorizationDataModel *)self->_model shippingType];
              v71 = [v69 stringWithFormat:@"IN_APP_PAYMENT_%@_ADDRESS_INCOMPLETE_REASON", v70];
              v59 = PKLocalizedPaymentString(v71, 0);
            }
            if (!v12)
            {
              BOOL v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-3003 userInfo:0];
            }
            v72 = (void *)MEMORY[0x1E4F28C58];
            v148[0] = *MEMORY[0x1E4F28588];
            uint64_t v73 = [v4 localizedErrorMessageOverride];
            v74 = (void *)v73;
            if (v73) {
              uint64_t v75 = v73;
            }
            else {
              uint64_t v75 = (uint64_t)v59;
            }
            v148[1] = *MEMORY[0x1E4F28A50];
            v149[0] = v75;
            v149[1] = v12;
            v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:v148 count:2];
            uint64_t v11 = [v72 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v76];

            long long v65 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
            uint64_t v66 = 5;
            goto LABEL_119;
          case 4uLL:
            v77 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:7];
            id v131 = 0;
            char v78 = [v77 isValidWithError:&v131];
            BOOL v12 = (__CFString *)v131;

            if ((v78 & 1) != 0
              || ([(__CFString *)v12 localizedFailureReason],
                  (v59 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              v59 = PKLocalizedPaymentString(&cfstr_InAppPaymentSh_0.isa, 0);
            }
            if (!v12)
            {
              BOOL v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-3010 userInfo:0];
            }
            v79 = (void *)MEMORY[0x1E4F28C58];
            v146[0] = *MEMORY[0x1E4F28588];
            uint64_t v80 = [v4 localizedErrorMessageOverride];
            v81 = (void *)v80;
            if (v80) {
              uint64_t v82 = v80;
            }
            else {
              uint64_t v82 = (uint64_t)v59;
            }
            v146[1] = *MEMORY[0x1E4F28A50];
            v147[0] = v82;
            v147[1] = v12;
            v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:2];
            uint64_t v11 = [v79 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v83];

            long long v65 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
            uint64_t v66 = 7;
LABEL_119:
            id v47 = +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:v66 status:1 error:v11 clientErrors:v65];

            [(PKPaymentAuthorizationStateMachine *)self _setState:3 param:v47];
            goto LABEL_169;
          case 5uLL:
            v84 = [(PKPaymentAuthorizationStateMachine *)self model];
            [v84 setStatus:3 forItemWithType:3];

            v85 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v144 = *MEMORY[0x1E4F28588];
            v86 = [v4 localizedErrorMessageOverride];
            v87 = v86;
            if (!v86)
            {
              v87 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_10.isa, 0);
            }
            v145 = v87;
            v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
            v89 = v85;
            uint64_t v90 = -1;
            goto LABEL_126;
          case 6uLL:
            v91 = [(PKPaymentAuthorizationStateMachine *)self model];
            [v91 setStatus:2 forItemWithType:3];

            v92 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v142 = *MEMORY[0x1E4F28588];
            v86 = [v4 localizedErrorMessageOverride];
            v87 = v86;
            if (!v86)
            {
              v87 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_10.isa, 0);
            }
            v143 = v87;
            v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
            v89 = v92;
            uint64_t v90 = -3011;
LABEL_126:
            uint64_t v11 = [v89 errorWithDomain:@"PKPassKitErrorDomain" code:v90 userInfo:v88];

            if (!v86) {
            id v47 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v11];
            }
            v93 = self;
            uint64_t v94 = 14;
            goto LABEL_134;
          case 7uLL:
            v95 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v140 = *MEMORY[0x1E4F28588];
            v96 = [v4 localizedErrorMessageOverride];
            v97 = v96;
            if (!v96)
            {
              v97 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_6.isa, 0);
            }
            v141 = v97;
            v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
            uint64_t v11 = [v95 errorWithDomain:@"PKPassKitErrorDomain" code:-3001 userInfo:v98];

            if (!v96) {
            v99 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
            }
            id v47 = +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:3 status:4 error:v11 clientErrors:v99];

            v93 = self;
            uint64_t v94 = 3;
LABEL_134:
            [(PKPaymentAuthorizationStateMachine *)v93 _setState:v94 param:v47];
            goto LABEL_168;
          default:
            uint64_t v26 = v37;
            if (v5 == 1000)
            {
              if (v129) {
                PKLocalizedFundsTransferString(&cfstr_FundsTransferP.isa, 0);
              }
              else {
              id v47 = PKLocalizedPaymentString(&cfstr_InAppPaymentTr.isa, 0);
              }
              v108 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v154 = *MEMORY[0x1E4F28588];
              uint64_t v109 = [v4 localizedErrorMessageOverride];
              v110 = (void *)v109;
              if (v109) {
                uint64_t v111 = v109;
              }
              else {
                uint64_t v111 = (uint64_t)v47;
              }
              uint64_t v155 = v111;
              v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
              uint64_t v11 = [v108 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v112];

              v113 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v11 clientFailure:v129];
              [(PKPaymentAuthorizationStateMachine *)self _setState:14 param:v113];

LABEL_168:
              BOOL v12 = 0;
LABEL_169:
              id v29 = v130;
LABEL_170:

              [(PKPaymentAuthorizationDataModel *)self->_model setPendingTransactions:0];
              [(PKPaymentAuthorizationDataModel *)self->_model setPendingOrderDetails:0];
              goto LABEL_171;
            }
            if (v5 == 1001)
            {
              id v47 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
              v51 = [v4 localizedErrorMessageOverride];
              uint64_t v52 = v51;
              if (v51)
              {
                id v53 = v51;
              }
              else
              {
                v114 = [v47 localizedErrorMessage];
                v115 = v114;
                if (v114)
                {
                  id v116 = v114;
                }
                else
                {
                  PKLocalizedPaymentString(&cfstr_InAppPaymentEr_9.isa, 0);
                  id v116 = (id)objc_claimAutoreleasedReturnValue();
                }
                id v53 = v116;
              }
              v126 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v152 = *MEMORY[0x1E4F28588];
              id v153 = v53;
              v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
              uint64_t v11 = [v126 errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v127];

              v128 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v11 clientFailure:1];
              [(PKPaymentAuthorizationStateMachine *)self _setState:14 param:v128];

              goto LABEL_168;
            }
LABEL_84:
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "The app failed to process the transaction (declined?)", buf, 2u);
            }

            ++self->_failureStatusCount;
            [(PKPaymentAuthorizationStateMachine *)self _promptTapToRadar];
            id v47 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
            v54 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];

            if (v54)
            {
              v55 = PKAggDKeyPaymentiTunesPurchaseAuthorizationFail;
            }
            else
            {
              if ([v47 requestType]) {
                goto LABEL_142;
              }
              AnalyticsSendEvent();
              v55 = PKAggDKeyPaymentInAppPaymentAuthorizationFail;
            }
            [(PKAggregateDictionaryProtocol *)self->_aggregateDictionary addValueForScalarKey:*v55 value:1];
LABEL_142:
            v102 = [v4 localizedErrorMessageOverride];
            v103 = v102;
            if (v102)
            {
              id v104 = v102;
            }
            else
            {
              v105 = [v47 localizedErrorMessage];
              v106 = v105;
              if (v105)
              {
                id v107 = v105;
              }
              else
              {
                PKLocalizedPaymentString(&cfstr_InAppPaymentEr_9.isa, 0);
                id v107 = (id)objc_claimAutoreleasedReturnValue();
              }
              id v104 = v107;
            }
            v117 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v138 = *MEMORY[0x1E4F28588];
            id v139 = v104;
            BOOL v118 = 1;
            v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
            uint64_t v11 = [v117 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v119];

            [(PKPaymentAuthorizationStateMachine *)self _reportToAutoBugCapture:v104];
            if (![v47 requestType]) {
              BOOL v118 = [v47 APIType] != 0;
            }
            uint64_t v120 = [v4 resultSource];
            v121 = [(PKPaymentAuthorizationStateMachine *)self paymentSheetExperiment];
            v122 = v121;
            id v29 = v130;
            if (v118
              || v120 == 1
              || ![v121 isTaggedForAllowInAppPaymentFailureRetry]
              || ([v122 trackExperimentExposure],
                  ![v122 shouldAllowInAppPaymentFailureRetry]))
            {
              v123 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v11];
              v124 = self;
              uint64_t v125 = 15;
            }
            else
            {
              v123 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v11 clientFailure:1];
              v124 = self;
              uint64_t v125 = 14;
            }
            [(PKPaymentAuthorizationStateMachine *)v124 _setState:v125 param:v123];

            BOOL v12 = 0;
            goto LABEL_170;
        }
      }
      unint64_t v5 = [(PKPaymentAuthorizationStateMachine *)self statusFromPaymentError:v18];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = @"PKPaymentAuthorizationStatusSuccess";
        switch(v5)
        {
          case 0uLL:
            break;
          case 1uLL:
            uint64_t v23 = @"PKPaymentAuthorizationStatusFailure";
            break;
          case 2uLL:
            uint64_t v23 = @"PKPaymentAuthorizationStatusInvalidBillingPostalAddress";
            break;
          case 3uLL:
            uint64_t v23 = @"PKPaymentAuthorizationStatusInvalidShippingPostalAddress";
            break;
          case 4uLL:
            uint64_t v23 = @"PKPaymentAuthorizationStatusInvalidShippingContact";
            break;
          case 5uLL:
            uint64_t v23 = @"PKPaymentAuthorizationStatusPINRequired";
            break;
          case 6uLL:
            uint64_t v23 = @"PKPaymentAuthorizationStatusPINIncorrect";
            break;
          case 7uLL:
            uint64_t v23 = @"PKPaymentAuthorizationStatusPINLockout";
            break;
          default:
            if (v5 == 1000) {
              uint64_t v23 = @"PKPaymentAuthorizationStatusTryAgain";
            }
            else {
              uint64_t v23 = @"unknown";
            }
            break;
        }
        *(_DWORD *)buf = 138543362;
        v161 = v23;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Overridden didReceivePaymentAuthorizationStatus: %{public}@", buf, 0xCu);
      }
      uint64_t v33 = v6;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Checking for errors based on legacy status", buf, 2u);
      }

      id v18 = [(PKPaymentAuthorizationStateMachine *)self model];
      uint64_t v32 = [v18 paymentErrorsFromLegacyStatus:v5];
      unsigned int v22 = 0;
      uint64_t v33 = v17;
      uint64_t v17 = v32;
    }

    goto LABEL_58;
  }
  uint64_t v10 = [v4 errors];
  uint64_t v11 = [v10 firstObject];

  if (v11)
  {
    if (os_variant_has_internal_ui())
    {
      BOOL v12 = [v11 localizedFailureReason];
      if (!v12)
      {
        BOOL v12 = [v11 localizedDescription];
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    v136[0] = @"authorizationStatus";
    if (v5 > 7) {
      __int16 v24 = @"unknown";
    }
    else {
      __int16 v24 = off_1E56E21C8[v5];
    }
    v137[0] = v24;
    v136[1] = @"errorDomain";
    uint64_t v25 = [v11 domain];
    uint64_t v26 = (void *)v25;
    if (v25) {
      uint64_t v27 = (__CFString *)v25;
    }
    else {
      uint64_t v27 = &stru_1EE0F5368;
    }
    v137[1] = v27;
    v136[2] = @"errorCode";
    uint64_t v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", objc_msgSend(v11, "code"));
    id v29 = (void *)v28;
    v136[3] = @"errorText";
    if (v12) {
      uint64_t v30 = v12;
    }
    else {
      uint64_t v30 = &stru_1EE0F5368;
    }
    v137[2] = v28;
    v137[3] = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:v136 count:4];
    [(PKPaymentAuthorizationStateMachine *)self _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:v31 eventType:@"transactionAuthorizationStatusUpdated"];

LABEL_171:
    goto LABEL_172;
  }
  v134 = @"authorizationStatus";
  if (v5 > 7) {
    uint64_t v13 = @"unknown";
  }
  else {
    uint64_t v13 = off_1E56E21C8[v5];
  }
  v135 = v13;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
  [(PKPaymentAuthorizationStateMachine *)self _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:v12 eventType:@"transactionAuthorizationStatusUpdated"];
  uint64_t v11 = 0;
LABEL_172:
}

- (id)sanitizeClientErrors:(id)a3
{
  return (id)objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_52);
}

id __59__PKPaymentAuthorizationStateMachine_sanitizeClientErrors___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 userInfo];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"PKPaymentErrorIsFromClient"];
  unint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = [v2 domain];
  uint64_t v7 = [v2 code];

  id v8 = [v5 errorWithDomain:v6 code:v7 userInfo:v4];

  return v8;
}

- (int64_t)statusFromPaymentError:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"PKPaymentErrorDomain"];

  if (!v6)
  {
    BOOL v12 = [v4 domain];
    int v13 = [v12 isEqualToString:@"PKDisbursementErrorDomain"];

    if (v13)
    {
      uint64_t v14 = [v4 code];
      int64_t v7 = 1000;
      if (v14 == -1 || v14 == 1) {
        goto LABEL_17;
      }
      if (v14 == 2)
      {
        if ([(PKPaymentAuthorizationStateMachine *)self isErrorAboutPostalAddressField:v4])
        {
          int64_t v7 = 2;
        }
        else
        {
          int64_t v7 = 4;
        }
        goto LABEL_17;
      }
    }
LABEL_11:
    int64_t v7 = 1;
    goto LABEL_17;
  }
  int64_t v7 = [v4 code];
  switch(v7)
  {
    case -1:
      id v8 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      uint64_t v9 = [v8 requestType];

      BOOL v10 = v9 == 0;
      uint64_t v11 = 1000;
      goto LABEL_13;
    case 1:
      BOOL v10 = ![(PKPaymentAuthorizationStateMachine *)self isErrorAboutPostalAddressField:v4];
      uint64_t v11 = 3;
LABEL_13:
      if (v10) {
        int64_t v7 = v11 + 1;
      }
      else {
        int64_t v7 = v11;
      }
      break;
    case 2:
      break;
    case 3:
      int64_t v7 = 3;
      break;
    default:
      goto LABEL_11;
  }
LABEL_17:

  return v7;
}

- (BOOL)isErrorAboutPostalAddressField:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"PKDisbursementErrorDomain"];

  int64_t v7 = (id *)&PKPaymentErrorContactFieldUserInfoKey;
  if (v6) {
    int64_t v7 = (id *)&PKDisbursementErrorContactFieldUserInfoKey;
  }
  id v8 = *v7;
  uint64_t v9 = [v4 userInfo];

  BOOL v10 = [v9 objectForKey:v8];

  char v11 = [v10 isEqualToString:@"post"];
  if ([v10 isEqualToString:@"name"]) {
    char v12 = 1;
  }
  else {
    char v12 = [v10 isEqualToString:@"phoneticName"];
  }
  int v13 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  uint64_t v14 = [v13 requiredShippingContactFields];
  char v15 = [v14 containsObject:@"post"];

  BOOL v16 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  char v17 = [v16 isShippingEditable];

  if (v11) {
    char v18 = 1;
  }
  else {
    char v18 = v12 & v15 & v17;
  }

  return v18;
}

- (void)didReceivePaymentAuthorizationStatus:(int64_t)a3
{
  unint64_t v5 = objc_alloc_init(PKPaymentAuthorizationResult);
  [(PKPaymentAuthorizationResult *)v5 setStatus:a3];
  [(PKPaymentAuthorizationStateMachine *)self didReceivePaymentAuthorizationResult:v5];
}

- (void)delayAuthorizedStateByDuration:(double)a3
{
  dispatch_group_enter((dispatch_group_t)self->_delayAuthorizedStateGroup);
  objc_initWeak(&location, self->_delayAuthorizedStateGroup);
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PKPaymentAuthorizationStateMachine_delayAuthorizedStateByDuration___block_invoke;
  v6[3] = &unk_1E56DD818;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x1E4F14428], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __69__PKPaymentAuthorizationStateMachine_delayAuthorizedStateByDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    dispatch_group_leave(WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)beginDelayingAuthorizedState
{
}

- (void)endDelayingAuthorizedState
{
}

- (void)didChangeFundingMode:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  BOOL v6 = state > 0x10;
  uint64_t v7 = (1 << state) & 0x1A000;
  if (!v6 && v7 != 0)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = PKPaymentAuthorizationFundingModeToString(a3);
      char v11 = (void *)v10;
      unint64_t v12 = self->_state;
      if (v12 > 0x14) {
        int v13 = @"unknown";
      }
      else {
        int v13 = off_1E56E2208[v12];
      }
      int v19 = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      unsigned int v22 = v13;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Not changing funding mode to %@ since the state is termainal \"%@\"", (uint8_t *)&v19, 0x16u);
    }
    return;
  }
  int64_t v14 = [(PKPaymentAuthorizationDataModel *)self->_model fundingMode];
  [(PKPaymentAuthorizationDataModel *)self->_model setFundingMode:a3];
  if (_os_feature_enabled_impl())
  {
    if (a3 == 2)
    {
      [(PKPaymentAuthorizationStateMachine *)self didSelectFinancingOption:0];
      char v17 = [(PKPaymentAuthorizationDataModel *)self->_model selectedPaymentOffer];
      char v18 = [(PKPaymentOffersController *)self->_paymentOffersController selectedOfferDetails];
      -[PKPaymentAuthorizationStateMachine didSelectPaymentOffer:updateReason:](self, "didSelectPaymentOffer:updateReason:", v17, [v18 updateReason]);

      goto LABEL_20;
    }
    if (a3 != 1)
    {
      if (!a3 && v14)
      {
        [(PKPaymentAuthorizationStateMachine *)self didSelectFinancingOption:0];
        [(PKPaymentAuthorizationStateMachine *)self didSelectPaymentOffer:0 updateReason:1];
        char v15 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
        BOOL v16 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
        [(PKPaymentAuthorizationStateMachine *)self didSelectPaymentPass:v15 paymentApplication:v16];

        [(PKPaymentAuthorizationDataModel *)self->_model refreshBillingAddressErrors];
      }
      goto LABEL_21;
    }
    if (v14 != 1)
    {
      [(PKPaymentAuthorizationStateMachine *)self didSelectPaymentOffer:0 updateReason:1];
      char v17 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
      [(PKPaymentAuthorizationStateMachine *)self didSelectFinancingOption:v17];
LABEL_20:
    }
  }
LABEL_21:
  [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
}

- (void)continuityPaymentCoordinatorDidTimeoutUpdatePaymentDevices:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinatorDidTimeoutUpdatePaymentDevices___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__97__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinatorDidTimeoutUpdatePaymentDevices___block_invoke(uint64_t a1)
{
  unint64_t result = *(void **)(a1 + 32);
  unint64_t v2 = result[14];
  BOOL v3 = v2 > 0x10;
  uint64_t v4 = (1 << v2) & 0x1A000;
  if (v3 || v4 == 0) {
    return (void *)[result _deviceUpdateDidFailWithNoEiligbleRemoteDevices:0];
  }
  return result;
}

- (void)continuityPaymentCoordinator:(id)a3 didTimeoutTotalWithPaymentDevices:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didTimeoutTotalWithPaymentDevices___block_invoke;
  v7[3] = &unk_1E56D8A90;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __101__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didTimeoutTotalWithPaymentDevices___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 112);
  if (v3 == 6)
  {
    if (!*(unsigned char *)(v2 + 9)) {
      objc_storeStrong((id *)(v2 + 200), *(id *)(a1 + 40));
    }
  }
  else if (v3 == 1)
  {
    [(id)v2 _updateModelWithRemoteDevices:*(void *)(a1 + 40)];
  }
}

- (void)continuityPaymentCoordinator:(id)a3 didReceiveUpdatedPaymentDevices:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didReceiveUpdatedPaymentDevices___block_invoke;
  v7[3] = &unk_1E56D8A90;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didReceiveUpdatedPaymentDevices___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v1 = *(void *)(*(void *)(a1 + 32) + 112);
  BOOL v2 = v1 > 0x10;
  uint64_t v3 = (1 << v1) & 0x1A000;
  if (v2 || v3 == 0)
  {
    if ([*(id *)(a1 + 40) count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v21;
LABEL_9:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
          unint64_t v12 = objc_msgSend(v11, "remotePaymentInstruments", (void)v20);
          int v13 = [*(id *)(*(void *)(a1 + 32) + 56) initialRemotePaymentInstrument];
          char v14 = [v12 containsObject:v13];

          if (v14) {
            break;
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v8) {
              goto LABEL_9;
            }
            goto LABEL_15;
          }
        }
        uint64_t v15 = [v11 proximityState];

        if (v15 != 2) {
          goto LABEL_20;
        }
        BOOL v16 = PKLogFacilityTypeGetObject(7uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v25 = 2;
          __int16 v26 = 2048;
          uint64_t v27 = 1;
          _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Skip updating remote devices: initialDeviceProximityState %ld, initialInstrumentValid %ld", buf, 0x16u);
        }
      }
      else
      {
LABEL_15:

LABEL_20:
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "updateRemoteDevices:ignoreProximity:", *(void *)(a1 + 40), 0, (void)v20);
        char v17 = *(unsigned char **)(a1 + 32);
        if (v17[9])
        {
          [v17 _advanceToNextState];
        }
        else
        {
          v17[9] = 1;
          [*(id *)(a1 + 32) _startPayment];
        }
      }
    }
    else
    {
      char v18 = *(void **)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      [v18 _deviceUpdateDidFailWithNoEiligbleRemoteDevices:v19];
    }
  }
}

- (void)continuityPaymentCoordinator:(id)a3 didReceivePayment:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didReceivePayment___block_invoke;
  v7[3] = &unk_1E56D8A90;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __85__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didReceivePayment___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) token];
  id v7 = [v2 retryNonce];

  if ([v7 length])
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 56) paymentRequest];
    uint64_t v4 = [v3 merchantSession];
    [v4 setRetryNonce:v7];
  }
  id v5 = *(void **)(a1 + 40);
  if (v5[14] == 5)
  {
    id v6 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithPayment:*(void *)(a1 + 32)];
    [v5 _setState:12 param:v6];
  }
  else
  {
    id v6 = objc_alloc_init(PKPaymentAuthorizationResult);
    [(PKPaymentAuthorizationResult *)v6 setStatus:1000];
    [*(id *)(a1 + 40) _performSendPaymentResult:v6];
  }
}

- (void)continuityPaymentCoordinatorDidReceiveCancellation:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinatorDidReceiveCancellation___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__89__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinatorDidReceiveCancellation___block_invoke(uint64_t a1)
{
  unint64_t result = *(void **)(a1 + 32);
  unint64_t v2 = result[14];
  BOOL v3 = v2 > 0x10;
  uint64_t v4 = (1 << v2) & 0x1A000;
  if (v3 || v4 == 0) {
    return (void *)[result _setState:13 param:0];
  }
  return result;
}

- (void)_processBluetoothState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  BOOL v4 = state > 0x10;
  uint64_t v5 = (1 << state) & 0x1A000;
  if (!v4 && v5 != 0) {
    return;
  }
  uint64_t v9 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = a3;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Processing bluetooth state: %d", (uint8_t *)v14, 8u);
  }

  if ((unint64_t)(a3 - 2) < 2) {
    goto LABEL_14;
  }
  if (a3 == 4)
  {
    if (!self->_detectedBluetoothOn)
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2015 userInfo:0];
      char v11 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v10];
      unint64_t v12 = self;
      uint64_t v13 = 14;
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2015 userInfo:0];
    char v11 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v10];
    unint64_t v12 = self;
    uint64_t v13 = 15;
LABEL_15:
    [(PKPaymentAuthorizationStateMachine *)v12 _setState:v13 param:v11];

    return;
  }
  if (a3 == 5 && !self->_detectedBluetoothOn)
  {
    self->_detectedBluetoothOn = 1;
    [(PKPaymentAuthorizationStateMachine *)self _startRemoteDeviceUpdate];
  }
}

- (void)_updateModelWithRemoteDevices:(id)a3
{
  id v5 = a3;
  char v4 = objc_msgSend(v5, "pk_containsObjectPassingTest:", &__block_literal_global_179);
  if ([v5 count] && (v4 & 1) != 0)
  {
    [(PKPaymentAuthorizationDataModel *)self->_model updateRemoteDevices:v5 ignoreProximity:0];

    if (self->_hasReceivedRemoteDeviceUpdate)
    {
      [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
    }
    else
    {
      self->_hasReceivedRemoteDeviceUpdate = 1;
      [(PKPaymentAuthorizationStateMachine *)self _startPayment];
    }
  }
  else
  {
    [(PKPaymentAuthorizationStateMachine *)self _deviceUpdateDidFailWithNoEiligbleRemoteDevices:v5];
  }
}

BOOL __68__PKPaymentAuthorizationStateMachine__updateModelWithRemoteDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 proximityState] == 0;
}

- (void)_deviceUpdateDidFailWithNoEiligbleRemoteDevices:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  model = self->_model;
  id v5 = a3;
  id v6 = [(PKPaymentAuthorizationDataModel *)model remoteDevice];
  id v7 = [v6 deviceName];

  if (v7)
  {
    char v11 = @"PKContinuityDeviceNameKey";
    v12[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2008 userInfo:v8];
  uint64_t v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v9];
  [(PKPaymentAuthorizationStateMachine *)self _setState:14 param:v10];

  [(PKPaymentAuthorizationDataModel *)self->_model updateRemoteDevices:v5 ignoreProximity:0];
}

- (void)_performUpdatePaymentDevices
{
  BOOL v3 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Updating remote payment devices", v4, 2u);
  }

  [(PKContinuityPaymentCoordinator *)self->_continuityPaymentCoordinator updatePaymentDevices];
}

- (void)_performSendRemotePaymentRequest
{
  BOOL v3 = [(PKPaymentAuthorizationStateMachine *)self _createNewRemotePaymentRequest];
  char v4 = +[PKPaymentAuthorizationContinuitySendParam paramWithRemotePaymentRequest:v3];
  [(PKPaymentAuthorizationStateMachine *)self _setState:4 param:v4];

  objc_initWeak(&location, self);
  id v5 = [v3 device];
  id v6 = [v5 deviceName];

  continuityPaymentCoordinator = self->_continuityPaymentCoordinator;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PKPaymentAuthorizationStateMachine__performSendRemotePaymentRequest__block_invoke;
  v9[3] = &unk_1E56E1A30;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [(PKContinuityPaymentCoordinator *)continuityPaymentCoordinator sendRemotePaymentRequest:v3 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __70__PKPaymentAuthorizationStateMachine__performSendRemotePaymentRequest__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPaymentAuthorizationStateMachine__performSendRemotePaymentRequest__block_invoke_2;
  v7[3] = &unk_1E56E1A08;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  char v11 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v10);
}

void __70__PKPaymentAuthorizationStateMachine__performSendRemotePaymentRequest__block_invoke_2(uint64_t a1)
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (!*(unsigned char *)(a1 + 56))
  {
    unint64_t v4 = [WeakRetained state];
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        v11[0] = *MEMORY[0x1E4F28A50];
        v11[1] = @"PKContinuityDeviceNameKey";
        uint64_t v7 = *(void *)(a1 + 40);
        v12[0] = v6;
        v12[1] = v7;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
        id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2010 userInfo:v8];
        id v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v9];
        [v3 _setState:14 param:v10];
      }
      else
      {
        [v3 _advanceToNextState];
      }
    }
  }
}

- (void)_performSendClientUpdateWithShippingMethods:(id)a3 paymentSummaryItems:(id)a4 multiTokenContexts:(id)a5 recurringPaymentRequest:(id)a6 automaticReloadPaymentRequest:(id)a7 deferredPaymentRequest:(id)a8 paymentApplication:(id)a9 status:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  long long v23 = [PKPaymentClientUpdate alloc];
  __int16 v24 = [v22 applicationIdentifier];
  uint64_t v25 = [v22 paymentType];
  uint64_t v35 = v17;
  id v36 = v16;
  id v26 = v17;
  uint64_t v27 = v18;
  uint64_t v28 = [(PKPaymentClientUpdate *)v23 initWithPaymentSummaryItems:v26 shippingMethods:v16 multiTokenContexts:v18 recurringPaymentRequest:v19 automaticReloadPaymentRequest:v20 deferredPaymentRequest:v21 status:a10 selectedAID:v24 selectedPaymentMethodType:v25];

  uint64_t v29 = +[PKPaymentAuthorizationStateParam param];
  [(PKPaymentAuthorizationStateMachine *)self _setState:4 param:v29];

  objc_initWeak(&location, self);
  uint64_t v30 = [(PKContinuityPaymentCoordinator *)self->_continuityPaymentCoordinator currentRemotePaymentRequest];
  uint64_t v31 = [v30 device];
  uint64_t v32 = [v31 deviceName];

  continuityPaymentCoordinator = self->_continuityPaymentCoordinator;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __224__PKPaymentAuthorizationStateMachine__performSendClientUpdateWithShippingMethods_paymentSummaryItems_multiTokenContexts_recurringPaymentRequest_automaticReloadPaymentRequest_deferredPaymentRequest_paymentApplication_status___block_invoke;
  v37[3] = &unk_1E56E1A30;
  objc_copyWeak(&v39, &location);
  id v34 = v32;
  id v38 = v34;
  [(PKContinuityPaymentCoordinator *)continuityPaymentCoordinator sendPaymentClientUpdate:v28 completion:v37];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

void __224__PKPaymentAuthorizationStateMachine__performSendClientUpdateWithShippingMethods_paymentSummaryItems_multiTokenContexts_recurringPaymentRequest_automaticReloadPaymentRequest_deferredPaymentRequest_paymentApplication_status___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __224__PKPaymentAuthorizationStateMachine__performSendClientUpdateWithShippingMethods_paymentSummaryItems_multiTokenContexts_recurringPaymentRequest_automaticReloadPaymentRequest_deferredPaymentRequest_paymentApplication_status___block_invoke_2;
  v7[3] = &unk_1E56E1A08;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  char v11 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v10);
}

void __224__PKPaymentAuthorizationStateMachine__performSendClientUpdateWithShippingMethods_paymentSummaryItems_multiTokenContexts_recurringPaymentRequest_automaticReloadPaymentRequest_deferredPaymentRequest_paymentApplication_status___block_invoke_2(uint64_t a1)
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (!*(unsigned char *)(a1 + 56))
  {
    unint64_t v4 = [WeakRetained state];
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        v11[0] = *MEMORY[0x1E4F28A50];
        v11[1] = @"PKContinuityDeviceNameKey";
        uint64_t v7 = *(void *)(a1 + 40);
        v12[0] = v6;
        v12[1] = v7;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
        id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2010 userInfo:v8];
        id v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v9];
        [v3 _setState:14 param:v10];
      }
      else
      {
        [v3 _advanceToNextState];
      }
    }
  }
}

- (void)_performSendPaymentResult:(id)a3
{
  id v4 = a3;
  id v5 = +[PKPaymentAuthorizationStateParam param];
  [(PKPaymentAuthorizationStateMachine *)self _setState:4 param:v5];

  objc_initWeak(&location, self);
  uint64_t v6 = [(PKContinuityPaymentCoordinator *)self->_continuityPaymentCoordinator currentRemotePaymentRequest];
  uint64_t v7 = [v6 device];

  id v8 = [v7 deviceName];
  continuityPaymentCoordinator = self->_continuityPaymentCoordinator;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __64__PKPaymentAuthorizationStateMachine__performSendPaymentResult___block_invoke;
  void v12[3] = &unk_1E56E1A80;
  objc_copyWeak(&v16, &location);
  id v10 = v8;
  id v13 = v10;
  char v14 = self;
  id v11 = v4;
  id v15 = v11;
  [(PKContinuityPaymentCoordinator *)continuityPaymentCoordinator sendPaymentResult:v11 completion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __64__PKPaymentAuthorizationStateMachine__performSendPaymentResult___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __64__PKPaymentAuthorizationStateMachine__performSendPaymentResult___block_invoke_2;
  v10[3] = &unk_1E56E1A58;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  char v16 = a2;
  id v11 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v15);
}

void __64__PKPaymentAuthorizationStateMachine__performSendPaymentResult___block_invoke_2(uint64_t a1)
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v3 = WeakRetained;
  if (!*(unsigned char *)(a1 + 72))
  {
    unint64_t v4 = [WeakRetained state];
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        v11[0] = *MEMORY[0x1E4F28A50];
        v11[1] = @"PKContinuityDeviceNameKey";
        uint64_t v7 = *(void *)(a1 + 40);
        v12[0] = v6;
        v12[1] = v7;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
        id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2010 userInfo:v8];
        id v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v9];
        [v3 _setState:14 param:v10];
      }
      else
      {
        [v3 _advanceToNextState];
      }
    }
  }
}

- (void)_performCancelRemotePaymentRequest
{
}

- (id)_createNewRemotePaymentRequest
{
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  unint64_t v4 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:4];
  id v5 = [v4 paymentApplication];
  uint64_t v6 = [v4 remoteDevice];
  uint64_t v7 = [v6 type];
  uint64_t v8 = [v6 majorOperatingSystemVersion];
  uint64_t v9 = v8;
  BOOL v10 = v7 == 1 && v8 < 16;
  if (v10 || (!v7 ? (BOOL v11 = v8 <= 8) : (BOOL v11 = 0), v11))
  {
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Bancomat", @"Bancontact", 0);
    uint64_t v13 = [v3 supportedNetworks];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__PKPaymentAuthorizationStateMachine__createNewRemotePaymentRequest__block_invoke;
    v22[3] = &unk_1E56D82D0;
    id v23 = v12;
    id v14 = v12;
    id v15 = objc_msgSend(v13, "pk_objectsPassingTest:", v22);

    [v3 setSupportedNetworks:v15];
  }
  BOOL v16 = v7 == 1 && v9 < 17;
  if (v16 || !v7 && v9 <= 9)
  {
    id v17 = [v3 supportedNetworks];
    id v18 = objc_msgSend(v17, "pk_objectsPassingTest:", &__block_literal_global_186);

    [v3 setSupportedNetworks:v18];
  }
  id v19 = [[PKRemotePaymentRequest alloc] initWithDevice:v6];
  [(PKRemotePaymentRequest *)v19 setPaymentRequest:v3];
  id v20 = [v5 applicationIdentifier];
  [(PKRemotePaymentRequest *)v19 setSelectedApplicationIdentifier:v20];

  -[PKRemotePaymentRequest setSelectedPaymentMethodType:](v19, "setSelectedPaymentMethodType:", [v5 paymentType]);
  return v19;
}

uint64_t __68__PKPaymentAuthorizationStateMachine__createNewRemotePaymentRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __68__PKPaymentAuthorizationStateMachine__createNewRemotePaymentRequest__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:@"PagoBancomat"] ^ 1;
}

- (void)_start
{
  if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 1)
  {
    [(PKPaymentAuthorizationStateMachine *)self _startPayment];
  }
  else if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 2)
  {
    [(PKPaymentAuthorizationStateMachine *)self _startHandoff];
  }
}

- (void)_startHandoff
{
  id v3 = [(PKPaymentAuthorizationStateMachine *)self bluetoothMonitor];
  -[PKPaymentAuthorizationStateMachine _processBluetoothState:](self, "_processBluetoothState:", [v3 state]);
}

- (void)_startRemoteDeviceUpdate
{
  [(PKPaymentAuthorizationStateMachine *)self _performUpdatePaymentDevices];
  [(PKPaymentAuthorizationStateMachine *)self _setState:1 param:0];
}

- (void)_startPayment
{
  id v4 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  id v3 = [v4 merchantSession];
  if (v3)
  {

    goto LABEL_6;
  }
  if (![v4 shouldUseMerchantSession])
  {
LABEL_6:
    if ([v4 requestType] == 5)
    {
      [(PKPaymentAuthorizationStateMachine *)self _performInstallmentBind];
    }
    else if ([v4 requestType] == 4)
    {
      [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
    }
    else
    {
      [(PKPaymentAuthorizationStateMachine *)self _updatePassRewardsInfo];
      [(PKPaymentAuthorizationStateMachine *)self _enqueueInitialCallbacks];
    }
    goto LABEL_12;
  }
  if ([v4 isVirtualCardRequest]) {
    [(PKPaymentAuthorizationStateMachine *)self _retrieveVPANPaymentSession];
  }
  else {
    [(PKPaymentAuthorizationStateMachine *)self _enqueueDidRequestMerchantSession];
  }
LABEL_12:
}

- (void)_performInstallmentBind
{
  self->_awaitingWebServiceResponse = 1;
  id v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  id v4 = [v3 installmentConfiguration];
  uint64_t v5 = [v4 feature];
  if (v5 == 2) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 2 * (v5 == 1);
  }

  uint64_t v7 = +[PKAccountService sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke;
  v9[3] = &unk_1E56E1AF0;
  id v10 = v3;
  BOOL v11 = self;
  id v8 = v3;
  [v7 defaultAccountForFeature:v6 completion:v9];
}

void __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) installmentConfiguration];
    id v8 = [*(id *)(a1 + 32) merchantIdentifier];
    if (!v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) merchantSession];
      id v8 = [v9 merchantIdentifier];

      if (!v8)
      {
        id v8 = [v7 installmentMerchantIdentifier];
      }
    }
    id v10 = objc_alloc_init(PKAccountWebServiceInstallmentBindRequest);
    BOOL v11 = [v5 accountIdentifier];
    [(PKAccountWebServiceInstallmentBindRequest *)v10 setAccountIdentifier:v11];

    id v12 = [v7 bindingTotalAmount];
    [(PKAccountWebServiceInstallmentBindRequest *)v10 setBindingAmount:v12];

    [(PKAccountWebServiceInstallmentBindRequest *)v10 setMerchantIdentifier:v8];
    uint64_t v13 = [v5 accountBaseURL];
    [(PKAccountWebServiceInstallmentBindRequest *)v10 setBaseURL:v13];

    objc_initWeak(&location, *(id *)(a1 + 40));
    id v14 = *(void **)(*(void *)(a1 + 40) + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_2;
    v16[3] = &unk_1E56E1AC8;
    objc_copyWeak(&v17, &location);
    [v14 performInstallmentBindWithRequest:v10 completion:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_4;
    block[3] = &unk_1E56D8AE0;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_3;
  block[3] = &unk_1E56DD038;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 11) = 0;
    id v7 = (id *)WeakRetained;
    if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
    {
      [*((id *)WeakRetained + 7) beginUpdates];
      id v5 = v7[7];
      id v6 = [*(id *)(a1 + 32) bindToken];
      [v5 setInstallmentBindToken:v6];

      [v7[7] endUpdates];
      [v7 _enqueueInitialCallbacks];
    }
    else
    {
      id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:15 userInfo:0];
      id v4 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v3];
      [v7 _setState:15 param:v4];
    }
    id WeakRetained = v7;
  }
}

void __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 11) = 0;
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:15 userInfo:0];
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v4];
  [v2 _setState:15 param:v3];
}

- (void)_enqueueInitialCallbacks
{
  id v39 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  if ([v39 shippingAddress])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [v39 shippingContact];
    id v5 = [v4 postalAddress];
    BOOL v3 = v5 != 0;
  }
  id v6 = [v39 requiredShippingContactFields];
  if ([v6 containsObject:@"post"] && !v3)
  {
    id v7 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:5];
    int v8 = [v7 isValidWithError:0];

    if (!v8) {
      goto LABEL_9;
    }
    id v6 = [(PKPaymentAuthorizationDataModel *)self->_model shippingAddress];
    [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectShippingContact:v6];
  }

LABEL_9:
  int64_t v9 = [(PKPaymentAuthorizationDataModel *)self->_model mode];
  if (v9 != 2)
  {
    if (v9 != 1) {
      goto LABEL_67;
    }
    if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode]) {
      BOOL v10 = [(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 2;
    }
    else {
      BOOL v10 = 1;
    }
    id v11 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    uint64_t v12 = [v11 requestType];
    uint64_t v13 = [(PKPaymentAuthorizationDataModel *)self->_model peerPaymentQuote];
    id v14 = v13;
    if (v10)
    {
      if (v13)
      {
        id v15 = [v13 firstQuoteItemOfType:1];
        BOOL v16 = v15 != 0;
      }
      else
      {
        BOOL v16 = 1;
      }
      BOOL v17 = v12 != 1 && v16;
      if (v12 == 4) {
        BOOL v17 = 0;
      }
      if (v12 != 2) {
        goto LABEL_45;
      }
    }
    else if (v12 != 2)
    {
LABEL_44:
      BOOL v17 = 0;
LABEL_45:
      BOOL v30 = v12 != 5 && v17;
      uint64_t v31 = [(PKPaymentAuthorizationDataModel *)self->_model financingController];
      uint64_t v32 = [v31 payLaterAccount];

      if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 1 && v32 != 0)
      {
        BOOL v30 = 0;
        [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectPayLaterFinancingWithAccount:v32];
      }
      if ([v11 isPayLaterPaymentRequest])
      {
        id v34 = [(PKPaymentAuthorizationDataModel *)self->_model bankAccount];

        if (v34)
        {
          uint64_t v35 = [(PKPaymentAuthorizationDataModel *)self->_model bankAccount];
          [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectBankAccount:v35];

          BOOL v30 = 0;
        }
      }
      if (v12 == 5)
      {
        id v36 = [(PKPaymentAuthorizationDataModel *)self->_model installmentBindToken];
        [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectPaymentMethodWithBindToken:v36];
      }
      if (v14) {
        char v37 = v30;
      }
      else {
        char v37 = 1;
      }
      if ((v37 & 1) == 0) {
        [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectPaymentMethodWithQuote:v14];
      }
      if (v30)
      {
        id v38 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
        [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectPaymentPass:v38];
      }
      goto LABEL_66;
    }
    uint64_t v18 = [v11 deviceSupportsPeerPaymentAccountPayment];
    if (v18 && [v11 accountPaymentUsePeerPaymentBalance])
    {
      id v19 = [(PKPaymentAuthorizationDataModel *)self->_model peerPaymentBalanceForAccountPayment];
    }
    else
    {
      id v19 = 0;
    }
    if ([v11 isAccountServiceTransferRequest])
    {
      id v20 = [v11 accountServiceTransferRequest];
      int v21 = [v20 supportsSplitPayment];

      id v22 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:2];

      id v23 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:9];
      if (v23) {
        BOOL v24 = v22 != 0;
      }
      else {
        BOOL v24 = 0;
      }
      if ((v24 & v21) != 0) {
        uint64_t v25 = 3;
      }
      else {
        uint64_t v25 = 2;
      }
      if (v22) {
        BOOL v26 = v25;
      }
      else {
        BOOL v26 = v23 != 0;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
    uint64_t v27 = [PKAccountServicePaymentMethod alloc];
    uint64_t v28 = [(PKPaymentAuthorizationDataModel *)self->_model bankAccount];
    uint64_t v29 = [(PKAccountServicePaymentMethod *)v27 initWithBankAccountInformation:v28 peerPaymentBalance:v19 deviceSupportsPeerPaymentAccountPayment:v18 selectedMethods:v26];

    [(PKPaymentAuthorizationStateMachine *)self _enqueueDidUpdateAccountServicePaymentMethod:v29];
    goto LABEL_44;
  }
  id v11 = [(PKPaymentAuthorizationDataModel *)self->_model remotePaymentInstrument];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectRemotePaymentInstrument:v11];
LABEL_66:

LABEL_67:
}

- (void)_sendDidTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4 withParam:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v8 = (__CFString *)a5;
  int64_t v9 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 0x14) {
      BOOL v10 = @"unknown";
    }
    else {
      BOOL v10 = off_1E56E2208[a3];
    }
    if (a4 > 0x14) {
      id v11 = @"unknown";
    }
    else {
      id v11 = off_1E56E2208[a4];
    }
    uint64_t v12 = @"<none>";
    int v14 = 138412802;
    if (v8) {
      uint64_t v12 = v8;
    }
    id v15 = v10;
    __int16 v16 = 2112;
    BOOL v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "State machine change state from %@ to %@ with param: %@", (uint8_t *)&v14, 0x20u);
  }

  [(PKPaymentAuthorizationStateMachine *)self _emitSignpostEvent:a4];
  uint64_t v13 = [(PKPaymentAuthorizationStateMachine *)self delegate];
  [v13 paymentAuthorizationStateMachine:self didTransitionFromState:a3 toState:a4 withParam:v8];
}

- (void)_emitSignpostEvent:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v5;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "initialize";
      break;
    case 1uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v4, self);
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v8;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "continuitySearch";
      break;
    case 3uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v4, self);
      if (v9 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v9;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "invalidData";
      break;
    case 4uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v4, self);
      if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v10;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "continuitySend";
      break;
    case 5uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v4, self);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v11;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "authenticate";
      break;
    case 6uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v4, self);
      if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v12;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "inactive";
      break;
    case 7uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v4, self);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v13;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "clientCallback";
      break;
    case 8uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v4, self);
      if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v14;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "prepareTransactionDetails";
      break;
    case 9uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v4, self);
      if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v15;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "nonce";
      break;
    case 0xAuLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v4, self);
      if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v16;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "authorize";
      break;
    case 0xBuLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v4, self);
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v17;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "rewrap";
      break;
    case 0xCuLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v4, self);
      if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v18;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "authorized";
      break;
    case 0xDuLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v4, self);
      if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v19;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "cancel";
      break;
    case 0xEuLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v4, self);
      if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v20;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "error";
      break;
    case 0xFuLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v4, self);
      if (v21 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v21;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "fatalError";
      break;
    case 0x10uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v4, self);
      if (v22 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v22;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "success";
      break;
    case 0x11uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v4, self);
      if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v26;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "updatingFinancingOptions";
      break;
    case 0x12uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v4, self);
      if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v23;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "dataProcessing";
      break;
    case 0x13uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v4, self);
      if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v24;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "updatingPaymentOffers";
      break;
    case 0x14uLL:
      PKLogFacilityTypeGetObject(7uLL);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v4, self);
      if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_63;
      }
      os_signpost_id_t v6 = v25;
      if (!os_signpost_enabled(v4)) {
        goto LABEL_63;
      }
      *(_WORD *)uint64_t v27 = 0;
      id v7 = "paymentOfferInvalid";
      break;
    default:
      return;
  }
  _os_signpost_emit_with_name_impl(&dword_190E10000, v4, OS_SIGNPOST_EVENT, v6, "stateMachine", v7, v27, 2u);
LABEL_63:
}

- (void)_advanceToNextState
{
}

- (void)_advanceToNextStateFromResolveError:(BOOL)a3
{
  BOOL v4 = a3;
  id v29 = 0;
  uint64_t v30 = 1;
  BOOL v6 = [(PKPaymentAuthorizationDataModel *)self->_model isValidWithError:&v29 errorStatus:&v30];
  id v7 = v29;
  if (*(_WORD *)&self->_awaitingClientCallbackReply || !v6 && self->_state == 3) {
    goto LABEL_61;
  }
  if (self->_hostApplicationState)
  {
    unint64_t state = self->_state;
    if (state - 9 >= 4 && state != 18)
    {
      os_signpost_id_t v9 = self;
      uint64_t v10 = 6;
      goto LABEL_60;
    }
  }
  if ([(NSMutableArray *)self->_callbackQueue count])
  {
    [(PKPaymentAuthorizationStateMachine *)self _dispatchNextCallbackParam];
    goto LABEL_61;
  }
  if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] != 1
    || [(PKPayLaterFinancingController *)self->_financingController loadingState] != 1)
  {
    if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 2 && v30 == 11 && !v6)
    {
      os_signpost_id_t v9 = self;
      uint64_t v10 = 19;
      goto LABEL_60;
    }
    if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 2
      && (v30 != 12 ? (char v12 = 1) : (char v12 = v6), (v12 & 1) == 0))
    {
      if (v4)
      {
        os_signpost_id_t v16 = [(PKPaymentAuthorizationDataModel *)self->_model selectedPaymentOffer];
        os_signpost_id_t v17 = [v16 criteriaIdentifier];
        os_signpost_id_t v18 = [v16 passUniqueID];
        [(PKPaymentOffersController *)self->_paymentOffersController resetLoadingDetailsForPaymentOffersForCriteriaIdentifier:v17 passUniqueID:v18];
        [(PKPaymentAuthorizationStateMachine *)self didChangeFundingMode:0];

LABEL_53:
        goto LABEL_61;
      }
      os_signpost_id_t v16 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v7 paymentOffersError:1];
      os_signpost_id_t v21 = self;
      uint64_t v22 = 14;
    }
    else
    {
      if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] != 2
        || (v30 != 13 ? (char v13 = 1) : (char v13 = v6), (v13 & 1) != 0))
      {
        os_signpost_id_t v14 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
        char v15 = [v14 isVirtualCardRequest];
        if (v15)
        {
          if (!self->_state) {
            goto LABEL_48;
          }
        }
        else
        {
          BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
          if ([v3 requestType] == 1 && !self->_state)
          {
LABEL_48:
            os_signpost_id_t v24 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
            os_signpost_id_t v25 = [v24 merchantSession];
            if (v25 && [(PKPaymentAuthorizationDataModel *)self->_model wantsInstructions])
            {
              os_signpost_id_t v26 = [(PKPaymentAuthorizationDataModel *)self->_model instructions];
              BOOL v27 = v26 == 0;
            }
            else
            {
              BOOL v27 = 0;
            }

            if (v15)
            {

              if (v27) {
                goto LABEL_59;
              }
            }
            else
            {

              if (v27)
              {
LABEL_59:
                os_signpost_id_t v9 = self;
                uint64_t v10 = 8;
                goto LABEL_60;
              }
            }
            goto LABEL_38;
          }
        }
LABEL_38:
        if (v6)
        {
          os_signpost_id_t v9 = self;
          uint64_t v10 = 5;
          goto LABEL_60;
        }
        if (self->_state == 3
          || [(PKPaymentAuthorizationDataModel *)self->_model isHideMyEmailLoading])
        {
          goto LABEL_61;
        }
        uint64_t v19 = v30;
        os_signpost_id_t v20 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
        os_signpost_id_t v16 = +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:0 status:v19 error:v7 clientErrors:v20];

        os_signpost_id_t v21 = self;
        uint64_t v22 = 3;
        goto LABEL_52;
      }
      os_signpost_id_t v23 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "The previously selected payment offer is no longer valid. User needs to take action.", v28, 2u);
      }

      os_signpost_id_t v16 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v7 paymentOffersError:1];
      os_signpost_id_t v21 = self;
      uint64_t v22 = 20;
    }
LABEL_52:
    [(PKPaymentAuthorizationStateMachine *)v21 _setState:v22 param:v16];
    goto LABEL_53;
  }
  if (v4 || self->_state != 14)
  {
    os_signpost_id_t v9 = self;
    uint64_t v10 = 17;
LABEL_60:
    [(PKPaymentAuthorizationStateMachine *)v9 _setState:v10 param:0];
  }
LABEL_61:
}

- (void)_updateModelWithPaymentSummaryItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  model = self->_model;
  id v5 = a3;
  BOOL v6 = [(PKPaymentAuthorizationDataModel *)model transactionAmount];
  [(PKPaymentAuthorizationDataModel *)self->_model setPaymentSummaryItems:v5];

  id v7 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
  os_signpost_id_t v8 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  os_signpost_id_t v9 = +[PKPaymentRequestValidator validatorWithObject:v8];
  id v16 = 0;
  char v10 = [v9 isValidWithError:&v16];
  id v11 = v16;

  if (v10)
  {
    if (v6 && v7)
    {
      if ([v6 isEqual:v7]) {
        goto LABEL_16;
      }
    }
    else if (v6 == v7)
    {
      goto LABEL_16;
    }
    if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 1)
    {
      os_signpost_id_t v14 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];

      if (v14)
      {
        char v15 = PKLogFacilityTypeGetObject(7uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v18 = v6;
          __int16 v19 = 2112;
          os_signpost_id_t v20 = v7;
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Payment Summary Items total amount has changed from %@ to %@. Updating the financing options and updating state machine state to show loading gylph.", buf, 0x16u);
        }

        [(PKPaymentAuthorizationStateMachine *)self _setState:17 param:0];
      }
    }
    [(PKPaymentAuthorizationStateMachine *)self _fetchAdditionalPaymentMethodDataIfNeeded];
  }
  else
  {
    char v12 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_error_impl(&dword_190E10000, v12, OS_LOG_TYPE_ERROR, "Updates to Payment Summary Items have caused an invalid Payment Request. Error: %@", buf, 0xCu);
    }

    char v13 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v11];
    [(PKPaymentAuthorizationStateMachine *)self _setState:15 param:v13];
  }
LABEL_16:
}

- (BOOL)_isMultiTokenContextsSupported
{
  unint64_t v2 = self;
  BOOL v3 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
  BOOL v4 = [v3 paymentWebService:v2->_paymentWebService supportedRegionFeatureOfType:4];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)_canUpdateWithMultiTokenContexts:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  os_signpost_id_t v8 = [v7 multiTokenContexts];

  if ([v8 count])
  {
    os_signpost_id_t v25 = v8;
    id v26 = v6;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      os_signpost_id_t v24 = a4;
      id v12 = 0;
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        uint64_t v14 = 0;
        char v15 = v12;
        do
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v9);
          }
          id v16 = +[PKPaymentTokenContextValidator validatorWithObject:](PKPaymentTokenContextValidator, "validatorWithObject:", *(void *)(*((void *)&v28 + 1) + 8 * v14), v24);
          os_signpost_id_t v17 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
          id v18 = [v17 currencyCode];
          [v16 setCurrencyCode:v18];

          __int16 v19 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
          uint64_t v20 = [v19 APIType];
          id v27 = v15;
          int v21 = [v16 isValidWithAPIType:v20 withError:&v27];
          id v12 = v27;

          if (!v21)
          {
            os_signpost_id_t v8 = v25;
            id v6 = v26;
            a4 = v24;
            goto LABEL_13;
          }
          ++v14;
          char v15 = v12;
        }
        while (v11 != v14);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v12 = 0;
    }

    BOOL v22 = 1;
    os_signpost_id_t v8 = v25;
    id v6 = v26;
  }
  else
  {
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34[0] = @"The original payment request didn't have multi token contexts";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v9];
LABEL_13:

    if (a4)
    {
      id v12 = v12;
      BOOL v22 = 0;
      *a4 = v12;
    }
    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

- (BOOL)_isDeviceTransactionAssessmentEnabled
{
  if ([(PKPaymentAuthorizationStateMachine *)self _isRequestUsedForTransactionAssessment])
  {
    if (PKHasSeenDeviceAssessmentEducation())
    {
      BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
      if (v3)
      {
        BOOL v4 = v3;
        char v5 = [(PKPrivacyDeviceAssessmentRetrieveStateRequest *)v3 supportsDeviceAssessmentAccordingToService:self->_paymentWebService];
      }
      else
      {
        os_signpost_id_t v8 = PKLogFacilityTypeGetObject(7uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v10 = 0;
          _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "No payment application found, returning device assessment as enabled.", v10, 2u);
        }

        BOOL v4 = 0;
        char v5 = 1;
      }
      goto LABEL_13;
    }
    id v6 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "User hasn't seen device assessment education, returning device assessment as disabled.", buf, 2u);
    }

    if (_os_feature_enabled_impl())
    {
      paymentWebService = self->_paymentWebService;
      BOOL v4 = objc_alloc_init(PKPrivacyDeviceAssessmentRetrieveStateRequest);
      [(PKPaymentWebService *)paymentWebService retrievePrivacyDeviceAssessmentStateWithRequest:v4 completion:&__block_literal_global_202];
      char v5 = 0;
LABEL_13:

      return v5;
    }
  }
  return 0;
}

void __75__PKPaymentAuthorizationStateMachine__isDeviceTransactionAssessmentEnabled__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(7uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4 || v5)
  {
    if (v7)
    {
      *(_WORD *)os_signpost_id_t v8 = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Could not sync Privacy UI state from server.", v8, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Synced Privacy UI state from server.", buf, 2u);
    }

    id v6 = [v4 privacyUiState];
    PKSetHasSeenPrivacyTermsVersion([v6 unsignedIntValue]);
  }
}

- (BOOL)_isRequestUsedForTransactionAssessment
{
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  char v4 = [v3 isPayLaterPaymentRequest];

  if (v4) {
    return 0;
  }
  id v5 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  char v6 = [v5 isPeerPaymentRequest];

  if (v6) {
    return 0;
  }
  os_signpost_id_t v8 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  char v9 = [v8 isAccountServiceTransferRequest];

  return v9 ^ 1;
}

- (id)_odiServiceProviderAssessmentIdentifier
{
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
  if (v3)
  {

LABEL_4:
    id v5 = (id)*MEMORY[0x1E4F5CB78];
    goto LABEL_5;
  }
  char v4 = [(PKPaymentAuthorizationDataModel *)self->_model assessmentCollection];

  if (v4) {
    goto LABEL_4;
  }
  BOOL v7 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  int v8 = [v7 isPayLaterPaymentRequest];

  if (v8)
  {
    char v9 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    uint64_t v10 = [v9 payLaterPaymentRequest];

    uint64_t v11 = [v10 payLaterPaymentIntentType];
    if (v11 == 2)
    {
      id v12 = (id *)MEMORY[0x1E4F5CB90];
      goto LABEL_13;
    }
    if (v11 == 1)
    {
      id v12 = (id *)MEMORY[0x1E4F5CB88];
LABEL_13:
      id v5 = *v12;

      goto LABEL_5;
    }
  }
  id v5 = 0;
LABEL_5:
  return v5;
}

- (BOOL)_isServiceProviderAssessmentEnabled
{
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  char v4 = [v3 isPeerPaymentRequest];

  if (v4) {
    return 0;
  }
  char v6 = [(PKPaymentAuthorizationStateMachine *)self _odiServiceProviderAssessmentIdentifier];
  BOOL v5 = v6 != 0;

  return v5;
}

- (BOOL)_isMerchantTokensSupported
{
  unint64_t v2 = self;
  BOOL v3 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
  char v4 = [v3 paymentWebService:v2->_paymentWebService supportedRegionFeatureOfType:3];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)_canUpdateWithRecurringPaymentRequest:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  int v8 = [v7 recurringPaymentRequest];

  if (v8)
  {
    [v6 sanitize];
    char v9 = [v6 billingAgreement];
    uint64_t v10 = [v8 billingAgreement];
    id v14 = 0;
    BOOL v11 = [(PKPaymentAuthorizationStateMachine *)self _canUpdateWithBillingAgreement:v9 oldAgreement:v10 error:&v14];
    id v12 = v14;
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"The original payment request didn't have a recurring payment request";
    char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v9];
    BOOL v11 = 0;
  }

  if (a4 && !v11) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_canUpdateWithAutomaticReloadPaymentRequest:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  int v8 = [v7 automaticReloadPaymentRequest];

  if (v8)
  {
    [v6 sanitize];
    char v9 = [v6 billingAgreement];
    uint64_t v10 = [v8 billingAgreement];
    id v14 = 0;
    BOOL v11 = [(PKPaymentAuthorizationStateMachine *)self _canUpdateWithBillingAgreement:v9 oldAgreement:v10 error:&v14];
    id v12 = v14;
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"The original payment request didn't have an automatic reload payment request";
    char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v9];
    BOOL v11 = 0;
  }

  if (a4 && !v11) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_canUpdateWithBillingAgreement:(id)a3 oldAgreement:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  if (!v9 || !v8)
  {

    goto LABEL_9;
  }
  char v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_7:
    id v12 = 0;
    BOOL v13 = 1;
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v16 = *MEMORY[0x1E4F28568];
  v17[0] = @"Billing agreements can't be changed";
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v14];

  if (a5)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a5 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_12:

  return v13;
}

- (BOOL)_canUpdateWithDeferredPaymentRequest:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  id v8 = [v7 deferredPaymentRequest];

  if (v8)
  {
    [v6 sanitize];
    id v9 = [v6 billingAgreement];
    uint64_t v10 = [v8 billingAgreement];
    id v14 = 0;
    BOOL v11 = [(PKPaymentAuthorizationStateMachine *)self _canUpdateWithBillingAgreement:v9 oldAgreement:v10 error:&v14];
    id v12 = v14;
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"The original payment request didn't have a deferred payment request";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v9];
    BOOL v11 = 0;
  }

  if (a4 && !v11) {
    *a4 = v12;
  }

  return v11;
}

- (void)_updateModelWithShippingMethods:(id)a3 paymentSummaryItems:(id)a4 multiTokenContexts:(id)a5 recurringPaymentRequest:(id)a6 automaticReloadPaymentRequest:(id)a7 deferredPaymentRequest:(id)a8 contentItems:(id)a9
{
  v114[1] = *MEMORY[0x1E4F143B8];
  id v108 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v107 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
  [(PKPaymentAuthorizationDataModel *)self->_model beginUpdates];
  v106 = v20;
  if ([v16 count]
    && [(PKPaymentAuthorizationStateMachine *)self _isMultiTokenContextsSupported])
  {
    id v112 = 0;
    BOOL v21 = [(PKPaymentAuthorizationStateMachine *)self _canUpdateWithMultiTokenContexts:v16 error:&v112];
    id v22 = v112;
    if (!v21)
    {
      id v53 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v53 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v53];
      v55 = id v54 = v19;
      uint64_t v56 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v55];
      goto LABEL_35;
    }
    [(PKPaymentAuthorizationDataModel *)self->_model setMultiTokenContexts:v16];
  }
  if (v17 && [(PKPaymentAuthorizationStateMachine *)self _isMerchantTokensSupported])
  {
    id v111 = 0;
    BOOL v23 = [(PKPaymentAuthorizationStateMachine *)self _canUpdateWithRecurringPaymentRequest:v17 error:&v111];
    id v24 = v111;
    if (!v23) {
      goto LABEL_33;
    }
    [(PKPaymentAuthorizationDataModel *)self->_model setRecurringPaymentRequest:v17];
  }
  if (v18 && [(PKPaymentAuthorizationStateMachine *)self _isMerchantTokensSupported])
  {
    id v110 = 0;
    BOOL v25 = [(PKPaymentAuthorizationStateMachine *)self _canUpdateWithAutomaticReloadPaymentRequest:v18 error:&v110];
    id v24 = v110;
    if (v25)
    {
      [(PKPaymentAuthorizationDataModel *)self->_model setAutomaticReloadPaymentRequest:v18];

      goto LABEL_13;
    }
LABEL_33:
    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v53 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:v53];
    v55 = id v54 = v19;
    uint64_t v56 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v55];
    id v22 = v24;
LABEL_35:
    v57 = (void *)v56;
    [(PKPaymentAuthorizationStateMachine *)self _setState:15 param:v56];

    char v58 = v22;
    v59 = v54;

LABEL_59:
    v86 = (void *)v107;
    goto LABEL_60;
  }
LABEL_13:
  if (v19 && [(PKPaymentAuthorizationStateMachine *)self _isMerchantTokensSupported])
  {
    id v109 = 0;
    BOOL v26 = [(PKPaymentAuthorizationStateMachine *)self _canUpdateWithDeferredPaymentRequest:v19 error:&v109];
    id v24 = v109;
    if (v26)
    {
      [(PKPaymentAuthorizationDataModel *)self->_model setDeferredPaymentRequest:v19];

      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_17:
  id v104 = v19;
  id v27 = [v108 methods];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    long long v29 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    [v29 setAvailableShippingMethods:v108];

    model = self->_model;
    long long v31 = [v108 defaultMethod];
    [(PKPaymentAuthorizationDataModel *)model setShippingMethod:v31];
  }
  uint64_t v32 = [v15 count];
  if (v32)
  {
    uint64_t v33 = v32;
    id v34 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    uint64_t v35 = [v34 requestType];

    uint64_t v36 = v33 - 1;
    if (v36 && v35 == 5)
    {
      char v37 = [v15 lastObject];
      id v38 = [v37 amount];

      uint64_t v39 = objc_msgSend(v15, "subarrayWithRange:", 0, v36);

      [(PKPaymentAuthorizationDataModel *)self->_model setInstallmentAuthorizationAmount:v38];
      id v15 = (id)v39;
    }
    [(PKPaymentAuthorizationStateMachine *)self _updateModelWithPaymentSummaryItems:v15];
  }
  if ([v20 count]) {
    [(PKPaymentAuthorizationDataModel *)self->_model setPaymentContentItems:v20];
  }
  [(PKPaymentAuthorizationDataModel *)self->_model endUpdates];
  [(PKPaymentAuthorizationStateMachine *)self _updateAssessmentAttributes];
  uint64_t v40 = [(PKPaymentAuthorizationDataModel *)self->_model paymentSummaryItems];
  v105 = [v40 lastObject];

  id v103 = v18;
  if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 1)
  {
    int v41 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
    if (![v41 hasAssociatedPeerPaymentAccount])
    {
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v42 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    if ([v42 requestType] == 10)
    {

      goto LABEL_30;
    }
    int64_t v60 = [(PKPaymentAuthorizationDataModel *)self->_model fundingMode];

    if (!v60)
    {
      uint64_t v61 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:3];
      if ([v61 status] == 5) {
        [(PKPaymentAuthorizationDataModel *)self->_model setStatus:0 forItemWithType:3];
      }
      v62 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
      uint64_t v63 = [v62 peerPaymentBalance];

      long long v64 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      long long v65 = [v63 currency];
      v101 = v64;
      uint64_t v66 = [v64 currencyCode];
      uint64_t v67 = [v65 caseInsensitiveCompare:v66];

      v99 = v61;
      if (v67)
      {
        char v68 = v63;
        BOOL v69 = 1;
      }
      else
      {
        v70 = [v63 amount];
        v71 = [v105 amount];
        char v68 = v63;
        BOOL v69 = [v70 compare:v71] != -1;
      }
      v72 = v68;
      uint64_t v73 = [v68 amount];
      v74 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v75 = [v73 compare:v74];

      uint64_t v76 = [v101 requestType];
      uint64_t v77 = [v101 requestType];
      if (!v69 || !v75 && v76 != 3 && v77 != 12)
      {
        id v78 = v17;
        v79 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v113 = *MEMORY[0x1E4F28588];
        uint64_t v80 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr.isa, 0);
        v114[0] = v80;
        v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:&v113 count:1];
        uint64_t v82 = [v79 errorWithDomain:@"PKPassKitErrorDomain" code:-3009 userInfo:v81];

        v83 = [(PKPaymentAuthorizationDataModel *)self->_model paymentErrors];
        v84 = +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:3 status:5 error:v82 clientErrors:v83];

        [(PKPaymentAuthorizationStateMachine *)self _setState:3 param:v84];
        if ([(PKPaymentAuthorizationStateMachine *)self hasPendingCallbacks]) {
          [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
        }

        id v17 = v78;
        goto LABEL_58;
      }

      goto LABEL_50;
    }
  }
LABEL_31:
  uint64_t v43 = [(PKContinuityPaymentCoordinator *)self->_continuityPaymentCoordinator currentRemotePaymentRequest];

  if (v43)
  {
    v100 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    v97 = [v100 multiTokenContexts];
    v98 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    long long v44 = [v98 recurringPaymentRequest];
    uint64_t v45 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    uint64_t v46 = [v45 automaticReloadPaymentRequest];
    id v47 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    [v47 deferredPaymentRequest];
    id v48 = v17;
    v50 = id v49 = v15;
    [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
    uint64_t v52 = v51 = v16;
    [(PKPaymentAuthorizationStateMachine *)self _performSendClientUpdateWithShippingMethods:v108 paymentSummaryItems:v49 multiTokenContexts:v97 recurringPaymentRequest:v44 automaticReloadPaymentRequest:v46 deferredPaymentRequest:v50 paymentApplication:v52 status:0];

    id v16 = v51;
    id v15 = v49;
    id v17 = v48;

LABEL_57:
    id v18 = v103;
LABEL_58:
    v59 = v104;
    char v58 = v105;
    goto LABEL_59;
  }
LABEL_50:
  if (![(PKPaymentAuthorizationDataModel *)self->_model wantsInstructions])
  {
    [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
    goto LABEL_57;
  }
  v85 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
  v86 = (void *)v107;
  char v87 = [v85 isEqualToValue:v107];

  v59 = v104;
  char v58 = v105;
  if ((v87 & 1) == 0) {
    [(PKPaymentAuthorizationDataModel *)self->_model setInstructions:0];
  }
  id v18 = v103;
  if ([(PKPaymentAuthorizationStateMachine *)self hasPendingCallbacks]
    || ([(PKPaymentAuthorizationDataModel *)self->_model instructions],
        v88 = objc_claimAutoreleasedReturnValue(),
        v88,
        v88))
  {
    [(PKPaymentAuthorizationStateMachine *)self _advanceToNextState];
  }
  else
  {
    v89 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    uint64_t v90 = [v89 merchantSession];
    [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
    v91 = id v102 = v15;
    v92 = [v91 secureElementIdentifier];
    v93 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
    [(PKPaymentAuthorizationDataModel *)self->_model currencyCode];
    v95 = id v94 = v17;
    v96 = +[PKPaymentAuthorizationPrepareTransactionDetailsStateParam paramWithMerchantSession:v90 secureElementIdentifier:v92 transactionAmount:v93 currencyCode:v95];

    id v17 = v94;
    v59 = v104;

    char v58 = v105;
    v86 = (void *)v107;

    id v15 = v102;
    id v18 = v103;

    [(PKPaymentAuthorizationStateMachine *)self _setState:8 param:v96];
  }
LABEL_60:
}

- (void)_updateAssessmentAttributes
{
  if ([(PKPaymentAuthorizationStateMachine *)self _isDeviceTransactionAssessmentEnabled]|| [(PKPaymentAuthorizationStateMachine *)self _isServiceProviderAssessmentEnabled])
  {
    if (![(PKODIAssessment *)self->_odiTransactionAssessment isAssessing]
      || ![(PKODIAssessment *)self->_odiServiceProviderAssessment isAssessing])
    {
      BOOL v3 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v4 = 0;
        _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "CoreODI not assessing, starting...", v4, 2u);
      }

      [(PKPaymentAuthorizationStateMachine *)self _startAssessmentIfNecessary];
    }
    [(PKODIAssessment *)self->_odiTransactionAssessment updateAssessmentWithModel:self->_model];
  }
}

- (void)_updatePassRewardsInfo
{
  if (PKIsPhone())
  {
    BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    if ([v3 requestType]
      || [(PKPaymentAuthorizationDataModel *)self->_model mode] != 1
      || !self->_accountService)
    {
      goto LABEL_21;
    }
    char v4 = [(PKPaymentAuthorizationDataModel *)self->_model appleCardPass];
    BOOL v5 = [v4 associatedAccountServiceAccountIdentifier];
    if (![v5 length])
    {
LABEL_20:

LABEL_21:
      return;
    }
    id v6 = [v3 hashedMerchantIdentifier];
    if (!v6)
    {
LABEL_19:

      goto LABEL_20;
    }
    objc_initWeak(location, self);
    if (!self->_enhancedMerchantsFetcher)
    {
      id v7 = [[PKAccountEnhancedMerchantsFetcher alloc] initWithAccountIdentifier:v5 accountService:self->_accountService];
      enhancedMerchantsFetcher = self->_enhancedMerchantsFetcher;
      self->_enhancedMerchantsFetcher = v7;

      id v9 = self->_enhancedMerchantsFetcher;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke;
      v23[3] = &unk_1E56DD818;
      objc_copyWeak(&v24, location);
      uint64_t v10 = [(PKAccountEnhancedMerchantsFetcher *)v9 addUpdateHandler:v23];
      enhancedMerchantsFetcherUpdateToken = self->_enhancedMerchantsFetcherUpdateToken;
      self->_enhancedMerchantsFetcherUpdateToken = v10;

      objc_destroyWeak(&v24);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke_2;
    aBlock[3] = &unk_1E56DD038;
    objc_copyWeak(&v22, location);
    aBlock[4] = self;
    id v21 = v6;
    id v12 = (void (**)(void))_Block_copy(aBlock);
    id v13 = [(PKAccount *)self->_appleCardAccount accountIdentifier];
    id v14 = v5;
    id v15 = v14;
    if (v13 == v14)
    {
    }
    else
    {
      if (!v14 || !v13)
      {

LABEL_17:
        accountService = self->_accountService;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke_3;
        v18[3] = &unk_1E56D8860;
        v18[4] = self;
        id v19 = v12;
        [(PKAccountService *)accountService accountWithIdentifier:v15 completion:v18];

        goto LABEL_18;
      }
      int v16 = [v13 isEqualToString:v14];

      if (!v16) {
        goto LABEL_17;
      }
    }
    v12[2](v12);
LABEL_18:

    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
    goto LABEL_19;
  }
}

void __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePassRewardsInfo];
}

void __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([*(id *)(*(void *)(a1 + 32) + 248) showPaymentSheetRewards]) {
    [WeakRetained _performPassRewardsUpdateForCooldownLevel:3 ignoreErrorBackoff:0 merchantIdentifier:*(void *)(a1 + 40)];
  }
}

void __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6 && !a3)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), a2);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = v7;
  }
}

- (void)_performPassRewardsUpdateForCooldownLevel:(unint64_t)a3 ignoreErrorBackoff:(BOOL)a4 merchantIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(PKPaymentAuthorizationDataModel *)self->_model appleCardPass];
  objc_initWeak(&location, self);
  enhancedMerchantsFetcher = self->_enhancedMerchantsFetcher;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118__PKPaymentAuthorizationStateMachine__performPassRewardsUpdateForCooldownLevel_ignoreErrorBackoff_merchantIdentifier___block_invoke;
  v13[3] = &unk_1E56E1B38;
  objc_copyWeak(v16, &location);
  id v11 = v9;
  id v14 = v11;
  v16[1] = (id)a3;
  id v12 = v8;
  id v15 = v12;
  [(PKAccountEnhancedMerchantsFetcher *)enhancedMerchantsFetcher updateDataWithCooldownLevel:a3 ignoreErrorBackoff:v5 completion:v13];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __118__PKPaymentAuthorizationStateMachine__performPassRewardsUpdateForCooldownLevel_ignoreErrorBackoff_merchantIdentifier___block_invoke(uint64_t a1, char a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
LABEL_8:
      [v5[7] setEnhancedMerchantInfo:0 forPass:*(void *)(a1 + 32)];
      goto LABEL_16;
    }
    uint64_t v6 = *(void *)(a1 + 56);
    char v7 = [WeakRetained[29] dataIsWithinThresholdForCooldownLevel:1];
    char v8 = v7;
    if (v6 == 1 && (v7 & 1) == 0)
    {
      id v9 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 56);
        int v13 = 134217984;
        uint64_t v14 = v10;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Unexpected error: current account merchant data does not meet requested level of %ld", (uint8_t *)&v13, 0xCu);
      }

      goto LABEL_8;
    }
    id v11 = [v5[29] enhancedMerchantMatchingPaymentIdentifier:*(void *)(a1 + 40)];
    if (v11) {
      char v12 = v8;
    }
    else {
      char v12 = 1;
    }
    if (v12) {
      [v5[7] setEnhancedMerchantInfo:v11 forPass:*(void *)(a1 + 32)];
    }
    else {
      [v5 _performPassRewardsUpdateForCooldownLevel:1 ignoreErrorBackoff:1 merchantIdentifier:*(void *)(a1 + 40)];
    }
  }
LABEL_16:
}

- (void)_dispatchNextCallbackParam
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaymentAuthorizationStateMachine *)self _dequeuePendingCallbackParam];
  char v4 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = [(PKPaymentAuthorizationClientCallbackStateParam *)v3 kind];
    if (v5 > 0xA) {
      uint64_t v6 = @"unknown";
    }
    else {
      uint64_t v6 = off_1E56E22B0[v5];
    }
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "State machine dispatching callback kind: %@", (uint8_t *)&v9, 0xCu);
  }

  self->_awaitingClientCallbackReply = 1;
  mostRecentClientCallback = self->_mostRecentClientCallback;
  self->_mostRecentClientCallback = v3;
  char v8 = v3;

  [(PKPaymentAuthorizationStateMachine *)self _startClientCallbackTimer];
  [(PKPaymentAuthorizationStateMachine *)self _setState:7 param:v8];
}

- (void)_enqueueCallbackOfKind:(int64_t)a3 withObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 0xA) {
      char v8 = @"unknown";
    }
    else {
      char v8 = off_1E56E22B0[a3];
    }
    int v13 = 138412546;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "State machine enqueueing callback kind: %@ object: %@", (uint8_t *)&v13, 0x16u);
  }

  callbackQueue = self->_callbackQueue;
  if (!callbackQueue)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = self->_callbackQueue;
    self->_callbackQueue = v10;

    callbackQueue = self->_callbackQueue;
  }
  char v12 = +[PKPaymentAuthorizationClientCallbackStateParam paramWithCallbackKind:a3 object:v6];
  [(NSMutableArray *)callbackQueue addObject:v12];

  if (!self->_awaitingClientCallbackReply) {
    [(PKPaymentAuthorizationStateMachine *)self _dispatchNextCallbackParam];
  }
}

- (id)_dequeuePendingCallbackParam
{
  BOOL v3 = [(NSMutableArray *)self->_callbackQueue firstObject];
  if (v3) {
    [(NSMutableArray *)self->_callbackQueue removeObjectAtIndex:0];
  }
  return v3;
}

- (BOOL)hasPendingCallbacks
{
  return self->_awaitingClientCallbackReply || [(NSMutableArray *)self->_callbackQueue count] != 0;
}

- (void)_startClientCallbackTimer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(PKPaymentAuthorizationStateMachine *)self _cancelClientCallbackTimer];
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  [v3 clientCallbackTimeout];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    int64_t v7 = 30000000000;
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v16 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Payment request specifies a custom client callback timeout of %f seconds.", buf, 0xCu);
    }

    int64_t v7 = (uint64_t)(v5 * 1000000000.0);
  }
  char v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  clientCallbackTimer = self->_clientCallbackTimer;
  self->_clientCallbackTimer = v8;

  uint64_t v10 = self->_clientCallbackTimer;
  dispatch_time_t v11 = dispatch_time(0, v7);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak((id *)buf, self);
  char v12 = self->_clientCallbackTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __63__PKPaymentAuthorizationStateMachine__startClientCallbackTimer__block_invoke;
  handler[3] = &unk_1E56DD818;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->_clientCallbackTimer);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __63__PKPaymentAuthorizationStateMachine__startClientCallbackTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clientCallbackTimedOut];
}

- (void)_cancelClientCallbackTimer
{
  clientCallbackTimer = self->_clientCallbackTimer;
  if (clientCallbackTimer)
  {
    dispatch_source_cancel(clientCallbackTimer);
    double v4 = self->_clientCallbackTimer;
    self->_clientCallbackTimer = 0;
  }
}

- (void)_clientCallbackTimedOut
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  clientCallbackTimer = self->_clientCallbackTimer;
  self->_clientCallbackTimer = 0;

  if ([(PKPaymentAuthorizationStateMachine *)self hasPendingCallbacks])
  {
    unint64_t state = self->_state;
    BOOL v5 = state >= 0x10;
    BOOL v7 = state == 16;
    uint64_t v6 = (1 << state) & 0x1A000;
    BOOL v7 = !v7 && v5 || v6 == 0;
    if (v7)
    {
      char v8 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        mostRecentClientCallback = self->_mostRecentClientCallback;
        int v12 = 138412290;
        int v13 = mostRecentClientCallback;
        _os_log_error_impl(&dword_190E10000, v8, OS_LOG_TYPE_ERROR, "Timed out waiting for client callback: %@", (uint8_t *)&v12, 0xCu);
      }

      AnalyticsSendEvent();
      [(PKAggregateDictionaryProtocol *)self->_aggregateDictionary addValueForScalarKey:@"com.apple.passbook.payment.in-app.client-callback-timeout" value:1];
      int v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2001 userInfo:0];
      uint64_t v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v9];
      [(PKPaymentAuthorizationStateMachine *)self _setState:15 param:v10];
    }
  }
}

- (void)_enqueueDidRequestMerchantSession
{
}

- (void)_enqueueDidSelectShippingContact:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [a3 sanitizedContact];
  uint64_t v6 = [v5 postalAddresses];
  BOOL v7 = [v6 firstObject];

  char v8 = [v7 value];
  int v9 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  int v10 = [v9 requiresAddressPrecision];
  if (v10)
  {
    BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model hostApplicationIdentifier];
    if ([v3 isEqualToString:@"W74U47NE8E.com.apple.store.Jolly"])
    {
LABEL_5:

      goto LABEL_10;
    }
    dispatch_time_t v11 = [(PKPaymentAuthorizationDataModel *)self->_model hostApplicationIdentifier];
    if ([v11 isEqualToString:@"MT9US5E2G8.com.apple.store.Jolly.MessagesExtension"])
    {

      goto LABEL_5;
    }
    id v20 = v11;
  }
  int v12 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  int v13 = [v12 originatingURL];
  char v14 = [v13 isAppleURL];

  if (v10)
  {
  }
  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [v8 redactedPostalAddress];
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v15 = [v8 redactedStreetAddress];
LABEL_12:
  double v16 = (void *)v15;

  uint64_t v22 = *MEMORY[0x1E4F1AF10];
  uint64_t v17 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:@"Shipping" value:v16];
  v23[0] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  id v19 = [MEMORY[0x1E4F1B8F8] pkContactWithNameComponents:0 labeledValues:v18];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:1 withObject:v19];
}

- (void)_enqueueDidSelectPaymentMethodWithBindToken:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[PKPaymentMethod alloc] initWithBindToken:v4];

  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:3 withObject:v5];
}

- (void)_enqueueDidSelectPaymentMethodWithQuote:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[PKPaymentMethod alloc] initWithPeerPaymentQuote:v4];

  if ([(PKPaymentAuthorizationDataModel *)self->_model supportsPreservePeerPaymentBalance])
  {
    [(PKPaymentMethod *)v5 setUsePeerPaymentBalance:[(PKPaymentAuthorizationDataModel *)self->_model usePeerPaymentBalance]];
  }
  [(PKPaymentAuthorizationDataModel *)self->_model setPaymentErrors:0];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:3 withObject:v5];
}

- (void)_enqueueDidSelectPayLaterFinancingWithAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[PKPaymentMethod alloc] initWithPayLaterAccount:v4 primaryAccountNumberSuffix:0 obfuscateNetworks:1];

  [(PKPaymentAuthorizationStateMachine *)self _updatePaymentRequestBillingAddressWithPaymentMethod:v5];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:3 withObject:v5];
}

- (void)_enqueueDidSelectBankAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[PKPaymentMethod alloc] initWithBankAccount:v4];

  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:3 withObject:v5];
}

- (void)_enqueueDidSelectPaymentPass:(id)a3
{
}

- (void)_enqueueDidSelectPaymentPass:(id)a3 paymentApplication:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (!v17)
  {
    [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:3 withObject:0];
    goto LABEL_12;
  }
  BOOL v7 = [[PKPaymentMethod alloc] initWithPaymentPass:v17 paymentApplication:v6 obfuscateNetworks:1];
  char v8 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  int v9 = [v17 associatedApplicationIdentifiers];
  int v10 = [(PKPaymentAuthorizationDataModel *)self->_model hostApplicationIdentifier];
  if ([v9 containsObject:v10]) {
    goto LABEL_5;
  }
  dispatch_time_t v11 = [v17 associatedWebDomains];
  int v12 = [v8 merchantSession];
  int v13 = [v12 domain];
  if ([v11 containsObject:v13])
  {

LABEL_5:
LABEL_6:
    char v14 = (void *)[v17 copy];
    [v14 sanitizePaymentApplications];
    [(PKPaymentMethod *)v7 setPaymentPass:v14];

    goto LABEL_7;
  }
  uint64_t v15 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  char v16 = [v15 isPeerPaymentRequest];

  if (v16) {
    goto LABEL_6;
  }
LABEL_7:
  [(PKPaymentAuthorizationStateMachine *)self _updatePaymentRequestBillingAddressWithPaymentMethod:v7];
  if ([v8 isPeerPaymentRequest]
    && [(PKPaymentAuthorizationDataModel *)self->_model supportsPreservePeerPaymentBalance])
  {
    [(PKPaymentMethod *)v7 setUsePeerPaymentBalance:[(PKPaymentAuthorizationDataModel *)self->_model usePeerPaymentBalance]];
  }
  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:3 withObject:v7];

LABEL_12:
}

- (void)_enqueueDidSelectRemotePaymentInstrument:(id)a3
{
  id v4 = a3;
  id v5 = [v4 primaryPaymentApplication];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueDidSelectRemotePaymentInstrument:v4 paymentApplication:v5];
}

- (void)_enqueueDidSelectRemotePaymentInstrument:(id)a3 paymentApplication:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  BOOL v7 = [[PKPaymentMethod alloc] initWithRemotePaymentInstrument:v13 paymentApplication:v6];

  char v8 = [v13 associatedWebDomains];
  int v9 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  int v10 = [v9 merchantSession];
  dispatch_time_t v11 = [v10 domain];
  int v12 = [v8 containsObject:v11];

  if (v12) {
    [(PKPaymentMethod *)v7 setRemoteInstrument:v13];
  }
  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:3 withObject:v7];
}

- (void)_enqueueDidUpdateAccountServicePaymentMethod:(id)a3
{
}

- (void)_enqueueDidAuthorizePaymentWithInstallmentAuthorizationToken:(id)a3 rewrapResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = objc_alloc_init(PKPayment);
  [(PKPayment *)v8 setInstallmentAuthorizationToken:v7];

  [(PKPaymentAuthorizationStateMachine *)self _applyBillingInformationToPayment:v8];
  [(PKPaymentAuthorizationStateMachine *)self _applyShippingMethodToPayment:v8];
  [(PKPaymentAuthorizationStateMachine *)self _applyShippingInformationToPayment:v8];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizePaymentWithPayment:v8 rewrapResponse:v6];
}

- (void)_enqueueDidAuthorizePaymentWithToken:(id)a3 rewrapResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [[PKPayment alloc] initWithToken:v7];

  [(PKPaymentAuthorizationStateMachine *)self _applyBillingInformationToPayment:v8];
  [(PKPaymentAuthorizationStateMachine *)self _applyShippingMethodToPayment:v8];
  [(PKPaymentAuthorizationStateMachine *)self _applyShippingInformationToPayment:v8];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizePaymentWithPayment:v8 rewrapResponse:v6];
}

- (void)_enqueueDidAuthorizePaymentWithByPassPayment:(id)a3 rewrapResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentAuthorizationStateMachine *)self _applyBillingInformationToPayment:v7];
  [(PKPaymentAuthorizationStateMachine *)self _applyShippingMethodToPayment:v7];
  [(PKPaymentAuthorizationStateMachine *)self _applyShippingInformationToPayment:v7];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizePaymentWithPayment:v7 rewrapResponse:v6];
}

- (void)_enqueueDidAuthorizePaymentWithRemotePayment:(id)a3 rewrapResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKPaymentAuthorizationStateMachine *)self _applyBillingInformationToPayment:v7];
  [(PKPaymentAuthorizationStateMachine *)self _applyShippingMethodToPayment:v7];
  [(PKPaymentAuthorizationStateMachine *)self _applyShippingInformationToPayment:v7];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizePaymentWithPayment:v7 rewrapResponse:v6];
}

- (void)_enqueueDidAuthorizeContext
{
}

- (void)_enqueueDidAuthorizePaymentWithPayment:(id)a3 rewrapResponse:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PKPaymentAuthorizationDataModel *)self->_model mode] != 3)
  {
    char v8 = [v6 token];
    int v9 = [(PKPaymentAuthorizationStateMachine *)self _transactionWithPaymentToken:v8];

    int v10 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
    uint64_t v11 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
    int v12 = (void *)v11;
    if (v9 && v10 && v11)
    {
      id v13 = [[PKPendingPaymentTransaction alloc] initWithTransaction:v9 pass:v10 paymentApplication:v11];
      model = self->_model;
      v29[0] = v13;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      [(PKPaymentAuthorizationDataModel *)model setPendingTransactions:v15];

      [(PKPaymentAuthorizationStateMachine *)self _enrichPaymentRewardsRedemptionWithPaymentTransaction:v9 usingPass:v10];
      char v16 = [v7 issuerInstallmentManagementURL];
      [v9 setIssuerInstallmentManagementURL:v16];
    }
    uint64_t v28 = v12;
    id v17 = +[PKPaymentOptionsDefaults defaults];
    if (v10)
    {
      uint64_t v18 = [(PKPaymentAuthorizationDataModel *)self->_model billingAddress];
      if (v18)
      {
        id v19 = (void *)v18;
        id v20 = +[PKPaymentOptionsDefaults defaults];
        id v21 = [v20 defaultBillingAddressForPaymentPass:v10];

        if (!v21)
        {
          uint64_t v22 = [(PKPaymentAuthorizationDataModel *)self->_model billingAddress];
          [v17 setDefaultBillingAddress:v22 forPaymentPass:v10];
        }
      }
    }
    BOOL v23 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    id v24 = [v23 requiredShippingContactFields];

    BOOL v25 = [(PKPaymentAuthorizationDataModel *)self->_model shippingName];
    if ((([v24 containsObject:@"name"] & 1) != 0
       || [v24 containsObject:@"phoneticName"])
      && ([v24 containsObject:@"post"] & 1) == 0)
    {
      if (v25)
      {
        BOOL v26 = [v17 defaultContactName];
        char v27 = [v25 isEqualIgnoringIdentifiers:v26];

        if ((v27 & 1) == 0) {
          [v17 setDefaultContactName:v25];
        }
      }
    }
  }
  [(PKPaymentAuthorizationDataModel *)self->_model setPayment:v6];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:5 withObject:v6];
}

- (void)_enqeueDidAuthorizePurchaseWithParam:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 purchase];
  id v6 = [v4 purchaseTransactionIdentifier];

  id v7 = [(PKPaymentAuthorizationStateMachine *)self _transactionWithPurchase:v5 paymentHash:v6];

  char v8 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
  uint64_t v9 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
  int v10 = (void *)v9;
  if (v7 && v8 && v9)
  {
    uint64_t v11 = [[PKPendingPaymentTransaction alloc] initWithTransaction:v7 pass:v8 paymentApplication:v9];
    model = self->_model;
    v14[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(PKPaymentAuthorizationDataModel *)model setPendingTransactions:v13];
  }
  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:6 withObject:v5];
}

- (void)_enqueueDidAuthorizePeerPaymentQuoteWithAuthorizedQuote:(id)a3
{
  id v11 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v11 peerPaymentQuote];
  char v6 = [v5 isRecurringPayment];

  if ((v6 & 1) == 0)
  {
    id v7 = [(PKPaymentAuthorizationStateMachine *)self _pendingTransactionOnPeerPaymentPassForAuthorizedPeerPaymentQuote:v11];
    [v4 safelyAddObject:v7];
    char v8 = [(PKPaymentAuthorizationStateMachine *)self _pendingTransactionOnAlternateFundingSourceForAutorizedPeerPaymentQuote:v11];
    [v4 safelyAddObject:v8];
  }
  model = self->_model;
  int v10 = (void *)[v4 copy];
  [(PKPaymentAuthorizationDataModel *)model setPendingTransactions:v10];

  [(PKPaymentAuthorizationStateMachine *)self _applyBillingInformationToAuthorizedQuote:v11];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueCallbackOfKind:7 withObject:v11];
}

- (void)_enqueueDidAuthorizeAccountServicePaymentRequestWithApplePayTrustSignature:(id)a3
{
}

- (void)_updatePaymentRequestBillingAddressWithPaymentMethod:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  char v6 = [v5 requiredBillingContactFields];
  if ([v6 count])
  {
    id v7 = [v5 requiredShippingContactFields];
    char v8 = [v7 containsObject:@"post"];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(PKPaymentAuthorizationDataModel *)self->_model billingAddress];
      int v10 = [v9 sanitizedContact];

      id v11 = [v10 postalAddresses];
      int v12 = [v11 firstObject];

      id v13 = [v12 value];
      char v14 = [v13 redactedPostalAddress];

      if (v14)
      {
        uint64_t v18 = *MEMORY[0x1E4F1AF10];
        uint64_t v15 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:@"Billing" value:v14];
        v19[0] = v15;
        char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

        id v17 = [MEMORY[0x1E4F1B8F8] pkContactWithNameComponents:0 labeledValues:v16];
        [v4 setBillingAddress:v17];
      }
    }
  }
  else
  {
  }
}

- (id)_pendingTransactionOnPeerPaymentPassForAuthorizedPeerPaymentQuote:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:2];
  char v6 = [v5 pass];

  if (!v6)
  {
    id v7 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Peer payment pass is not included in the data model. Fetching the pass from the pass library.", buf, 2u);
    }

    char v8 = +[PKPassLibrary sharedInstance];
    uint64_t v9 = [v8 peerPaymentPassUniqueID];
    int v10 = [v8 passWithUniqueID:v9];
    char v6 = [v10 paymentPass];
  }
  uint64_t v11 = [v6 devicePrimaryInAppPaymentApplication];
  int v12 = (void *)v11;
  if (v6) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    uint64_t v15 = [v4 peerPaymentQuote];
    v55 = [v15 firstQuoteItemOfType:2];
    uint64_t v16 = [v15 firstQuoteItemOfType:1];
    uint64_t v17 = [v15 firstQuoteItemOfType:3];
    id v54 = [v15 firstQuoteItemOfType:4];
    uint64_t v18 = [v15 recipient];
    id v19 = objc_alloc_init(PKPaymentTransaction);
    [(PKPaymentTransaction *)v19 setOriginatedByDevice:1];
    id v20 = [MEMORY[0x1E4F1C9C8] date];
    [(PKPaymentTransaction *)v19 setTransactionDate:v20];

    [(PKPaymentTransaction *)v19 addUpdateReasons:2];
    [(PKPaymentTransaction *)v19 setTransactionSource:2];
    [(PKPaymentTransaction *)v19 setTechnologyType:2];
    if (v18)
    {
      [(PKPaymentTransaction *)v19 setTransactionType:3];
      [(PKPaymentTransaction *)v19 setPeerPaymentType:1];
      id v21 = [v18 phoneOrEmail];
      [(PKPaymentTransaction *)v19 setPeerPaymentCounterpartHandle:v21];
LABEL_15:

      goto LABEL_36;
    }
    if (v16 && !v55)
    {
      [(PKPaymentTransaction *)v19 setTransactionType:6];
      goto LABEL_36;
    }
    if (v17)
    {
      uint64_t v48 = v16;
      [(PKPaymentTransaction *)v19 setTransactionType:5];
      [(PKPaymentTransaction *)v19 setSecondaryFundingSourceType:1];
      uint64_t v22 = [v15 bankName];
      BOOL v23 = [v15 accountNumber];
      id v51 = v23;
      uint64_t v53 = v17;
      if ((unint64_t)[v23 length] < 4)
      {
        char v27 = 0;
      }
      else
      {
        objc_msgSend(v23, "substringFromIndex:", objc_msgSend(v23, "length") - 4);
        BOOL v25 = v24 = v22;
        uint64_t v26 = PKMaskedPaymentPAN((uint64_t)v25);

        uint64_t v22 = v24;
        char v27 = (void *)v26;
      }
      uint64_t v16 = v48;
      id v47 = v22;
      uint64_t v33 = [v22 length];
      uint64_t v34 = [v27 length];
      uint64_t v50 = v27;
      if (v33 && v34)
      {
        uint64_t v43 = v27;
        uint64_t v35 = v47;
        PKLocalizedPeerPaymentString(&cfstr_TransactionSec.isa, &stru_1EE105568.isa, v47, v43);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v33)
        {
          if (v34)
          {
            char v37 = PKLocalizedPeerPaymentString(&cfstr_TransactionSec_0.isa, &stru_1EE0F6808.isa, v27);
          }
          else
          {
            char v37 = 0;
          }
          uint64_t v35 = v47;
          goto LABEL_35;
        }
        uint64_t v35 = v47;
        id v36 = v47;
      }
      char v37 = v36;
LABEL_35:
      [(PKPaymentTransaction *)v19 setSecondaryFundingSourceDescription:v37];

      uint64_t v17 = v53;
LABEL_36:
      id v38 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
      uint64_t v39 = v38;
      if (v38)
      {
        uint64_t v40 = [v38 localizedDescription];
        [(PKPaymentTransaction *)v19 setSecondaryFundingSourceDescription:v40];

        int v41 = [v39 primaryAccountIdentifier];
        [(PKPaymentTransaction *)v19 setSecondaryFundingSourceFPANIdentifier:v41];
      }
      else
      {
        if (!(v16 | v17)) {
          goto LABEL_39;
        }
        int v41 = PKLogFacilityTypeGetObject(0xBuLL);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v56 = 0;
          _os_log_impl(&dword_190E10000, v41, OS_LOG_TYPE_DEFAULT, "Could not find secondary funding source pass, pending transaction will not contain pass description.", v56, 2u);
        }
      }

LABEL_39:
      char v14 = [[PKPendingPaymentTransaction alloc] initWithTransaction:v19 pass:v6 paymentApplication:v12];
LABEL_40:

      goto LABEL_41;
    }
    if (!v54)
    {
      uint64_t v39 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v57 = 0;
        _os_log_impl(&dword_190E10000, v39, OS_LOG_TYPE_DEFAULT, "Could not find quote item to use for pending transaction. Not creating pending transaction on peer payment pass", v57, 2u);
      }
      char v14 = 0;
      goto LABEL_40;
    }
    [(PKPaymentTransaction *)v19 setTransactionType:5];
    [(PKPaymentTransaction *)v19 setSecondaryFundingSourceType:2];
    uint64_t v28 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
    uint64_t v52 = v28;
    if (!v28)
    {
      id v21 = 0;
LABEL_57:
      [(PKPaymentTransaction *)v19 setSecondaryFundingSourceDescription:v21];

      goto LABEL_15;
    }
    long long v29 = v28;
    uint64_t v45 = [v28 devicePrimaryPaymentApplication];
    id v49 = PKDisplayablePaymentNetworkNameForPaymentCredentialType([v45 paymentNetworkIdentifier]);

    uint64_t v30 = [v29 primaryAccountNumberSuffix];
    long long v31 = PKMaskedPaymentPAN(v30);
    id v44 = v31;
    uint64_t v46 = (void *)v30;
    if (v49 && v31)
    {
      PKLocalizedPeerPaymentString(&cfstr_TransactionSec_1.isa, &stru_1EE105568.isa, v49, v31);
    }
    else
    {
      if (v49)
      {
        id v32 = v49;
        goto LABEL_55;
      }
      if (!v31)
      {
        id v21 = 0;
        goto LABEL_56;
      }
      PKLocalizedPeerPaymentString(&cfstr_TransactionSec_2.isa, &stru_1EE0F6808.isa, v31);
    }
    id v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:
    id v21 = v32;
    long long v31 = v44;
LABEL_56:

    goto LABEL_57;
  }
  uint64_t v15 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v58 = 0;
    _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Could not find peer payment pass. Not creating pending transaction.", v58, 2u);
  }
  char v14 = 0;
LABEL_41:

  return v14;
}

- (id)_pendingTransactionOnAlternateFundingSourceForAutorizedPeerPaymentQuote:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
  char v6 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    int v10 = [v6 dpanIdentifier];
    uint64_t v11 = [v4 peerPaymentQuote];
    int v12 = [v11 items];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v13) {
      goto LABEL_18;
    }
    uint64_t v14 = v13;
    uint64_t v26 = v11;
    id v27 = v4;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v19 = objc_msgSend(v18, "dpanIdentifier", v26, v27);
        if ([v19 isEqualToString:v10])
        {
          id v20 = v18;

          uint64_t v15 = v20;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
    uint64_t v11 = v26;
    id v4 = v27;
    if (v15)
    {
      id v21 = objc_alloc_init(PKPaymentTransaction);
      [(PKPaymentTransaction *)v21 setOriginatedByDevice:1];
      [(PKPaymentTransaction *)v21 addUpdateReasons:2];
      uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
      [(PKPaymentTransaction *)v21 setTransactionDate:v22];

      [(PKPaymentTransaction *)v21 setTransactionType:0];
      [(PKPaymentTransaction *)v21 setTransactionSource:2];
      [(PKPaymentTransaction *)v21 setTechnologyType:2];
      BOOL v23 = [v15 totalAmount];
      [(PKPaymentTransaction *)v21 setAmount:v23];

      id v24 = [v15 totalAmountCurrency];
      [(PKPaymentTransaction *)v21 setCurrencyCode:v24];

      [(PKPaymentTransaction *)v21 setAssociatedFeatureIdentifier:1];
      uint64_t v9 = [[PKPendingPaymentTransaction alloc] initWithTransaction:v21 pass:v5 paymentApplication:v7];
    }
    else
    {
LABEL_18:
      uint64_t v15 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Could not find quote item matching dpan ID of pass in payment authorization data model", buf, 2u);
      }
      uint64_t v9 = 0;
    }
  }
  return v9;
}

- (void)_performNonceRequestWithParam:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
  if (v5 && [(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 1)
  {
    financingController = self->_financingController;
    id v7 = [v5 identifier];
    [(PKPayLaterFinancingController *)financingController stateMachineUpdatedAuthenticationState:4 selectedOptionIdentifier:v7 error:0 cancelReason:self->_cancelReason];
  }
  BOOL v8 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  [(PKPaymentAuthorizationStateMachine *)self _computeAssessmentIfNecessary];
  objc_initWeak(location, self);
  uint64_t v9 = [v8 merchantSession];
  if (!PKHandsOnDemoModeEnabled() && !PKUIOnlyDemoModeEnabled())
  {
    if ([v8 requestType] == 2
      || [v8 requestType] == 4
      || [v8 requestType] == 5)
    {
      goto LABEL_10;
    }
    if (v9)
    {
      self->_awaitingWebServiceResponse = 1;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_2;
      v31[3] = &unk_1E56E1B60;
      uint64_t v26 = &v34;
      objc_copyWeak(&v34, location);
      id v32 = v9;
      id v33 = v4;
      [(PKPaymentAuthorizationStateMachine *)self _augmentSessionResponseWithCompletion:v31];

      id v27 = v32;
    }
    else
    {
      if ([v8 isPeerPaymentRequest])
      {
LABEL_10:
        id v24 = [v4 credential];
        BOOL v25 = +[PKPaymentAuthorizationAuthorizeStateParam paramWithCredential:v24];

        [(PKPaymentAuthorizationStateMachine *)self _setState:10 param:v25];
        goto LABEL_11;
      }
      self->_awaitingWebServiceResponse = 1;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_4;
      v28[3] = &unk_1E56E1B88;
      uint64_t v26 = &v30;
      objc_copyWeak(&v30, location);
      id v29 = v4;
      [(PKPaymentAuthorizationStateMachine *)self _nonceResponseWithCompletion:v28];
      id v27 = v29;
    }

    objc_destroyWeak(v26);
    goto LABEL_11;
  }
  int v10 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
  uint64_t v11 = [v10 paymentNetworkIdentifier];

  int v12 = objc_msgSend(NSString, "stringWithFormat:", @"PKPaymentToken_%d", v11);
  uint64_t v13 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v14 = PKPassKitCoreBundle();
  uint64_t v15 = [v14 pathForResource:v12 ofType:@"archive"];
  uint64_t v16 = [v13 dataWithContentsOfFile:v15];

  uint64_t v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v16 error:0];
  uint32_t v38 = arc4random();
  uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v38 length:4];
  id v19 = [v18 SHA256Hash];
  id v20 = [v19 hexEncoding];

  [v17 setTransactionIdentifier:v20];
  uint32_t v21 = arc4random_uniform(0xAu);
  dispatch_time_t v22 = dispatch_time(0, (uint64_t)((1.0 / (double)(v21 + 1) + 1.0) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke;
  block[3] = &unk_1E56D9150;
  objc_copyWeak(&v37, location);
  id v36 = v17;
  id v23 = v17;
  dispatch_after(v22, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v37);
LABEL_11:

  objc_destroyWeak(location);
}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v2 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithPaymentToken:*(void *)(a1 + 32) rewrapResponse:0];
    [WeakRetained _setState:12 param:v2];
  }
}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_3;
  block[3] = &unk_1E56DECB0;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v5;
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_3(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v4 = [WeakRetained state];
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      v3[11] = 0;
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = *MEMORY[0x1E4F28A50];
        v21[0] = v6;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        uint64_t v9 = [v7 errorWithDomain:@"PKPassKitErrorDomain" code:-2004 userInfo:v8];

        id v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v9];
        [v3 _setState:14 param:v10];
      }
      else
      {
        id v11 = [*(id *)(a1 + 40) retryNonce];
        id v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [*(id *)(a1 + 40) nonce];
        }
        id v14 = v13;

        uint64_t v15 = *(void *)(a1 + 48);
        uint64_t v16 = objc_msgSend(v14, "pk_decodeHexadecimal");
        uint64_t v17 = [*(id *)(a1 + 56) cryptogramType];
        uint64_t v18 = [*(id *)(a1 + 56) networkMerchantIdentifier];
        id v19 = +[PKPaymentAuthorizationAuthorizeStateParam paramWithNonceParam:v15 nonce:v16 cryptogramType:v17 networkMerchantIdentifier:v18];

        [v3 _setState:10 param:v19];
      }
    }
  }
}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_5;
  v9[3] = &unk_1E56DEC10;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_5(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v3 = [*(id *)(a1 + 32) nonceData];
  unint64_t v4 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Nonce for pass: %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    unint64_t v5 = [WeakRetained state];
    if (v5 > 0x10 || ((1 << v5) & 0x1A000) == 0)
    {
      WeakRetained[11] = 0;
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6)
      {
        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F28A50];
        uint64_t v15 = v6;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        uint64_t v9 = [v7 errorWithDomain:@"PKPassKitErrorDomain" code:-2004 userInfo:v8];

        id v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v9];
        [WeakRetained _setState:14 param:v10];
      }
      else
      {
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v12 = [*(id *)(a1 + 32) cryptogramType];
        id v13 = [*(id *)(a1 + 32) networkMerchantIdentifier];
        uint64_t v9 = +[PKPaymentAuthorizationAuthorizeStateParam paramWithNonceParam:v11 nonce:v3 cryptogramType:v12 networkMerchantIdentifier:v13];

        [WeakRetained _setState:10 param:v9];
      }
    }
  }
}

- (void)_computeAssessmentIfNecessary
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaymentAuthorizationStateMachine *)self _activeODIAssessment];
  if (v3)
  {
    unint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Computing CoreODI assessment %@", (uint8_t *)&v5, 0xCu);
    }

    self->_odiAssessmentInFlight = 1;
    [v3 computeAssessment];
  }
}

- (void)_augmentSessionResponseWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__PKPaymentAuthorizationStateMachine__augmentSessionResponseWithCompletion___block_invoke;
    v5[3] = &unk_1E56E1BD8;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    [(PKPaymentAuthorizationStateMachine *)self _augmentBaseRequestWithCompletion:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __76__PKPaymentAuthorizationStateMachine__augmentSessionResponseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKPaymentAuthorizationStateMachine__augmentSessionResponseWithCompletion___block_invoke_2;
  block[3] = &unk_1E56E1BB0;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  id v15 = v9;
  id v10 = *(id *)(a1 + 32);
  id v17 = v8;
  id v18 = v10;
  id v16 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v19);
}

void __76__PKPaymentAuthorizationStateMachine__augmentSessionResponseWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      BOOL v3 = [WeakRetained[7] paymentRequest];
      id v4 = +[PKPaymentAugmentSessionRequest augmentSessionRequestWithBaseRequest:*(void *)(a1 + 40)];
      int v5 = [v3 merchantSession];
      [v4 setMerchantSession:v5];

      int v6 = [v3 isServiceProviderPaymentRequest];
      id v7 = v10[4];
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      if (v6) {
        [v7 serviceProviderAugmentSessionWithRequest:v4 serviceURL:v8 completion:v9];
      }
      else {
        [v7 augmentSessionWithRequest:v4 serviceURL:v8 completion:v9];
      }
    }
    id WeakRetained = v10;
  }
}

- (void)_nonceResponseWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke;
    v5[3] = &unk_1E56E1BD8;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    [(PKPaymentAuthorizationStateMachine *)self _augmentBaseRequestWithCompletion:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke_2;
  block[3] = &unk_1E56E1BB0;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  id v15 = v9;
  id v10 = *(id *)(a1 + 32);
  id v17 = v8;
  id v18 = v10;
  id v16 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v19);
}

void __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v4 = [WeakRetained[7] paymentRequest];
      int v5 = +[PKPaymentNonceRequest nonceRequestWithBaseRequest:*(void *)(a1 + 40)];
      id v6 = [v4 merchantIdentifier];
      [v5 setMerchantIdentifier:v6];

      if ([v4 isServiceProviderPaymentRequest])
      {
        [v3[4] serviceProviderNonceWithRequest:v5 serviceURL:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
      }
      else if ([v4 isPayLaterPaymentRequest])
      {
        id v7 = [v4 payLaterPaymentRequest];
        id v8 = objc_alloc_init(PKAccountWebServiceFinancingPlanNonceRequest);
        id v9 = [v7 accountBaseURL];
        [(PKAccountWebServiceFinancingPlanNonceRequest *)v8 setBaseURL:v9];

        id v10 = [v7 accountIdentifier];
        [(PKAccountWebServiceFinancingPlanNonceRequest *)v8 setAccountIdentifier:v10];

        id v11 = [v7 financingPlan];
        id v12 = [v11 planIdentifier];
        [(PKAccountWebServiceFinancingPlanNonceRequest *)v8 setPlanIdentifier:v12];

        [(PKAccountWebServiceFinancingPlanNonceRequest *)v8 setAugmentBaseRequest:*(void *)(a1 + 40)];
        id v13 = v3[4];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        void v14[2] = __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke_3;
        v14[3] = &unk_1E56E1C00;
        id v15 = *(id *)(a1 + 56);
        [v13 accountFinancingPlanNonceWithRequest:v8 completion:v14];
      }
      else
      {
        [v3[4] inAppPaymentNonceWithRequest:v5 serviceURL:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
      }
    }
  }
}

uint64_t __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_augmentBaseRequestWithCompletion:(id)a3
{
  id v49 = a3;
  id v4 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  int v5 = [v4 currencyCode];
  uint64_t v6 = [v4 countryCode];
  id v7 = [v4 boundInterfaceIdentifier];
  uint64_t v56 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
  id v8 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:3];
  id v9 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:9];
  id v10 = [v8 pass];
  uint64_t v11 = [v9 bankAccountInformation];
  uint64_t v12 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
  id v54 = v8;
  v55 = v4;
  uint64_t v52 = (void *)v11;
  uint64_t v53 = v9;
  uint64_t v50 = (void *)v6;
  id v51 = (void *)v12;
  if (v12)
  {
    id v13 = (void *)v12;
    if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 1)
    {
      uint64_t v14 = [v13 authAmount];
      uint64_t v48 = [v14 currency];

      id v15 = [(PKPayLaterFinancingController *)self->_financingController selectedFundingSource];
      uint64_t v16 = [v15 type];
      if (v16 == 2)
      {
        id v47 = v7;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
      }
      else
      {
        if (v16 != 1)
        {
LABEL_23:
          uint64_t v28 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
          BOOL v25 = [v28 paymentServicesBaseURL];

          if (!v25)
          {
            id v29 = PKLogFacilityTypeGetObject(0xEuLL);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Error: There is no paymentServicesBaseURL defined on the pay later account", buf, 2u);
            }
          }
          id v30 = [v13 dueNow];
          if (v30)
          {
            [v13 dueNow];
            v32 = long long v31 = v7;
            id v33 = [v32 currencyAmount];
            id v34 = [v33 amount];
            int v35 = objc_msgSend(v34, "pk_isZeroNumber");

            id v7 = v31;
            int v26 = v35 ^ 1;
          }
          else
          {
            int v26 = 0;
          }
          id v27 = v49;

          if (v15)
          {
            if ([v15 type] == 2) {
              int v26 = 0;
            }
          }
          else
          {
            int v26 = 1;
          }

          uint64_t v24 = 1;
          int v5 = (void *)v48;
          goto LABEL_36;
        }
        id v47 = v7;
        id v17 = v15;
        uint64_t v18 = [v17 paymentPass];

        uint64_t v19 = [v17 paymentApplication];
        id v10 = v17;
      }

      id v10 = (void *)v18;
      uint64_t v56 = (void *)v19;
      id v7 = v47;
      goto LABEL_23;
    }
  }
  int v20 = [v4 isPayLaterPaymentRequest];
  if (v10) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v11 == 0;
  }
  int v22 = v21;
  if (v21) {
    id v23 = v10;
  }
  else {
    id v23 = 0;
  }
  uint64_t v24 = 0;
  if (v20) {
    id v10 = v23;
  }
  BOOL v25 = 0;
  if (v20) {
    int v26 = v22;
  }
  else {
    int v26 = 1;
  }
  id v27 = v49;
LABEL_36:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentAuthorizationStateMachine__augmentBaseRequestWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56E1C28;
  uint64_t v68 = v24;
  id v36 = v10;
  id v61 = v36;
  id v37 = v56;
  id v62 = v37;
  id v38 = v50;
  id v63 = v38;
  id v39 = v5;
  id v64 = v39;
  id v40 = v7;
  id v65 = v40;
  id v41 = v27;
  id v67 = v41;
  id v42 = v25;
  id v66 = v42;
  uint64_t v43 = _Block_copy(aBlock);
  id v44 = v43;
  if (v26)
  {
    secureElement = self->_secureElement;
    uint64_t v46 = [v37 applicationIdentifier];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __72__PKPaymentAuthorizationStateMachine__augmentBaseRequestWithCompletion___block_invoke_2;
    v57[3] = &unk_1E56E1C50;
    id v58 = v37;
    id v59 = v44;
    [(PKSecureElement *)secureElement appletWithIdentifier:v46 completion:v57];
  }
  else
  {
    (*((void (**)(void *, void, void))v43 + 2))(v43, 0, 0);
  }
}

void __72__PKPaymentAuthorizationStateMachine__augmentBaseRequestWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc_init(PKPaymentAugmentBaseRequest);
  [(PKPaymentAugmentBaseRequest *)v7 setType:a1[11]];
  [(PKPaymentAugmentBaseRequest *)v7 setPass:a1[4]];
  [(PKPaymentAugmentBaseRequest *)v7 setPaymentApplication:a1[5]];
  [(PKPaymentAugmentBaseRequest *)v7 setApplet:v6];

  [(PKPaymentAugmentBaseRequest *)v7 setMerchantCountryCode:a1[6]];
  [(PKPaymentAugmentBaseRequest *)v7 setCurrencyCode:a1[7]];
  [(PKWebServiceRequest *)v7 setBoundInterfaceIdentifier:a1[8]];
  (*(void (**)(void))(a1[10] + 16))();
}

void __72__PKPaymentAuthorizationStateMachine__augmentBaseRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [NSString alloc];
    id v6 = [*(id *)(a1 + 32) applicationIdentifier];
    id v7 = (void *)[v5 initWithFormat:@"Failed to get applet with identifier: %@ from SE", v6];

    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28228];
    v11[0] = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v4 = [v8 errorWithDomain:@"PKPassKitErrorDomain" code:-2004 userInfo:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_performPrepareTransactionDetailsRequestWithParam:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  if (PKHandsOnDemoModeEnabled() || PKUIOnlyDemoModeEnabled())
  {
    id v5 = PKSharedCacheDirectoryPath();
    id v6 = [v5 stringByAppendingPathComponent:@"Demo/Instructions.plist"];

    id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
    id v29 = 0;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v7 error:&v29];
    id v9 = v29;
    if (v8
      && (uint64_t v10 = [[PKPaymentInstructions alloc] initWithDictionary:v8]) != 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke;
      block[3] = &unk_1E56D9150;
      objc_copyWeak(&v28, &location);
      id v27 = v10;
      uint64_t v11 = v10;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v28);
    }
    else
    {
      uint64_t v12 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v32 = v6;
        __int16 v33 = 2112;
        id v34 = v9;
        _os_log_error_impl(&dword_190E10000, v12, OS_LOG_TYPE_ERROR, "Demo mode requires valid Instructions.plist at:%@, error:%@", buf, 0x16u);
      }

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_277;
      v24[3] = &unk_1E56DD818;
      objc_copyWeak(&v25, &location);
      dispatch_async(MEMORY[0x1E4F14428], v24);
      objc_destroyWeak(&v25);
    }
  }
  else
  {
    id v13 = (void *)(self->_prepareTransactionDetailsCounter + 1);
    self->_prepareTransactionDetailsCounter = (unint64_t)v13;
    self->_awaitingWebServiceResponse = 1;
    paymentWebService = self->_paymentWebService;
    uint64_t v14 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    id v15 = [v14 merchantSession];
    uint64_t v16 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
    id v17 = [v16 secureElementIdentifier];
    uint64_t v18 = v17;
    if (!v17)
    {
      uint64_t v18 = [(PKSecureElement *)self->_secureElement primarySecureElementIdentifier];
    }
    uint64_t v19 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
    int v20 = [(PKPaymentAuthorizationDataModel *)self->_model currencyCode];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_2;
    v22[3] = &unk_1E56E1CA0;
    objc_copyWeak(v23, &location);
    v23[1] = v13;
    [(PKPaymentWebService *)paymentWebService prepareTransactionDetailsForMerchantSession:v15 secureElementIdentifier:v18 amount:v19 currencyCode:v20 completion:v22];

    if (!v17) {
    objc_destroyWeak(v23);
    }
  }
  objc_destroyWeak(&location);
}

void __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke(uint64_t a1)
{
  unint64_t v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Demo mode advancing to prepare transactions details state..", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained model];
  [v4 setInstructions:*(void *)(a1 + 32)];

  [WeakRetained _advanceToNextState];
}

void __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_277(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2014 userInfo:0];
  unint64_t v2 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v1];
  [WeakRetained _setState:15 param:v2];
}

void __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_3;
  v9[3] = &unk_1E56E1C78;
  objc_copyWeak(v12, (id *)(a1 + 32));
  v12[1] = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(v12);
}

void __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_3(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v4 = [WeakRetained state];
    BOOL v5 = v4 > 0x10 || ((1 << v4) & 0x1A000) == 0;
    if (v5 && *(void *)(a1 + 56) == *((void *)v3 + 23))
    {
      *((unsigned char *)v3 + 11) = 0;
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        uint64_t v10 = *MEMORY[0x1E4F28A50];
        v11[0] = v6;
        id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      }
      else
      {
        if (*(void *)(a1 + 40))
        {
          objc_msgSend(*((id *)v3 + 7), "setInstructions:");
          [v3 _advanceToNextState];
          goto LABEL_6;
        }
        id v7 = 0;
      }
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2014 userInfo:v7];
      id v9 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v8];
      [v3 _setState:15 param:v9];
    }
  }
LABEL_6:
}

- (void)_performRewrapRequestWithParam:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPaymentAuthorizationStateMachine *)self _activeODIAssessment];
  BOOL v6 = [(PKPaymentAuthorizationDataModel *)self->_model mode] != 1 || v5 == 0;
  if (v6
    || ([v5 currentAssessment], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    [(PKPaymentAuthorizationStateMachine *)self _performRewrapRequestImplWithParam:v4];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PKPaymentAuthorizationStateMachine__performRewrapRequestWithParam___block_invoke;
    v8[3] = &unk_1E56E1CC8;
    void v8[4] = self;
    id v9 = v4;
    [v5 waitForAssessmentWithContinueBlock:v8];
  }
}

void __69__PKPaymentAuthorizationStateMachine__performRewrapRequestWithParam___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __69__PKPaymentAuthorizationStateMachine__performRewrapRequestWithParam___block_invoke_2;
  v2[3] = &unk_1E56D8A90;
  unint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __69__PKPaymentAuthorizationStateMachine__performRewrapRequestWithParam___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRewrapRequestImplWithParam:*(void *)(a1 + 40)];
}

- (void)_performRewrapRequestImplWithParam:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 credential];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke;
  aBlock[3] = &unk_1E56E1CF0;
  objc_copyWeak(&v74, &location);
  void aBlock[4] = self;
  id v6 = v5;
  id v73 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:3];
  id v9 = [v8 pass];
  id v63 = [v9 paymentPass];

  id v62 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
  uint64_t v10 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  id v11 = [v10 merchantSession];

  if (v11)
  {
    self->_awaitingWebServiceResponse = 1;
    *(void *)buf = 0;
    uint64_t v12 = [(PKPaymentAuthorizationStateMachine *)self _rewrapCompleteSessionRequestWithParam:v4 serviceURL:buf];
    paymentWebService = self->_paymentWebService;
    uint64_t v14 = *(void *)buf;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_284;
    v69[3] = &unk_1E56E1D18;
    id v70 = v11;
    id v71 = v7;
    [(PKPaymentWebService *)paymentWebService completeSessionWithRequest:v12 serviceURL:v14 completion:v69];

    goto LABEL_38;
  }
  id v15 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  uint64_t v16 = [v15 serviceProviderPaymentRequest];

  if (v16)
  {
    id v17 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    uint64_t v18 = [v17 serviceProviderPaymentRequest];
    id v61 = [v18 serviceProviderOrder];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v61 serviceProviderData];
      int v20 = (void *)[v19 mutableCopy];

      BOOL v21 = [v63 primaryAccountIdentifier];
      [v20 safelySetObject:v21 forKey:@"primaryAccountIdentifier"];

      int v22 = [v62 dpanIdentifier];
      [v20 safelySetObject:v22 forKey:@"selectedDpanId"];

      id v23 = [v20 objectForKey:@"requestMPAN"];
      int v24 = [v23 BOOLValue];

      if (v24)
      {
        id v25 = [v63 devicePrimaryPaymentApplication];
        int v26 = [v25 dpanIdentifier];
        [v20 safelySetObject:v26 forKey:@"devicePrimaryAccountIdentifier"];

        id v27 = [v63 issuerCountryCode];
        [v20 safelySetObject:v27 forKey:@"issuerCountryCode"];
      }
      id v28 = (void *)[v20 copy];
      [v61 setServiceProviderData:v28];
    }
    [v61 setPaymentInstrumentType:1];
    id v29 = [v4 wrappedPayment];
    id v30 = [v29 transactionData];
    [v61 setAppletValue:v30];

    if ([v62 supportsBarcodePayment]
      && ([v62 supportsContactlessPayment] & 1) == 0)
    {
      long long v31 = [v4 wrappedPayment];
      id v32 = [v31 transactionIdentifier];
      [v61 setTransactionIdentifier:v32];
    }
    __int16 v33 = objc_alloc_init(PKPaymentServiceProviderPerformPaymentRequest);
    [(PKPaymentServiceProviderPerformPaymentRequest *)v33 setPass:v63];
    [(PKPaymentServiceProviderPerformPaymentRequest *)v33 setServiceProviderOrder:v61];
    id v34 = [v4 nonceData];
    [(PKPaymentServiceProviderPerformPaymentRequest *)v33 setNonce:v34];

    uint64_t v35 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    id v36 = [v35 serviceProviderPaymentRequest];
    id v37 = [v36 targetDeviceSerialNumber];
    [(PKPaymentServiceProviderPerformPaymentRequest *)v33 setTargetDeviceSerialNumber:v37];

    -[PKPaymentServiceProviderPerformPaymentRequest setCryptogramType:](v33, "setCryptogramType:", [v4 cryptogramType]);
    if (!_os_feature_enabled_impl())
    {
      id v44 = PKLogFacilityTypeGetObject(6uLL);
      int64_t v60 = v44;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v44, OS_LOG_TYPE_DEFAULT, "Device assessments not enabled for service provider payment requests", buf, 2u);
      }
      goto LABEL_37;
    }
    id v59 = [(PKPaymentAuthorizationStateMachine *)self _activeODIAssessment];
    if (v59)
    {
      if (![v63 supportsDeviceAssessmentAccordingToService:self->_paymentWebService])
      {
        uint64_t v46 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v46, OS_LOG_TYPE_DEFAULT, "Not attaching device assessment to service provider payment request, as pass does not support assessments (assessment was probably generated for a supported pass, but payment is being made with an unsupported pass)", buf, 2u);
        }

        [v59 provideSessionFeedback:1];
        goto LABEL_29;
      }
      id v38 = [v59 currentAssessment];
      id v39 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v59;
        _os_log_impl(&dword_190E10000, v39, OS_LOG_TYPE_DEFAULT, "Attaching device assessment to service provider payment request %@", buf, 0xCu);
      }

      [(PKPaymentServiceProviderPerformPaymentRequest *)v33 setDeviceAssessments:v38];
      [v59 provideSessionFeedback:0];
    }
    else
    {
      id v38 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v38, OS_LOG_TYPE_DEFAULT, "No device assessment generated for service provider payment request", buf, 2u);
      }
    }

LABEL_29:
    id v47 = [(PKPaymentAuthorizationDataModel *)self->_model shippingAddress];
    if (!v47
      || ([v63 shippingAddressSeed],
          uint64_t v48 = objc_claimAutoreleasedReturnValue(),
          BOOL v49 = v48 == 0,
          v48,
          v47,
          v49))
    {
      id v54 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v54, OS_LOG_TYPE_DEFAULT, "Address seed: Pass has no seed, skipping", buf, 2u);
      }
    }
    else
    {
      uint64_t v50 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v50, OS_LOG_TYPE_DEFAULT, "Address seed: Pass has seed, hashing", buf, 2u);
      }

      id v51 = [(PKPaymentAuthorizationDataModel *)self->_model shippingAddress];
      uint64_t v52 = [v51 postalAddresses];
      uint64_t v53 = [v52 firstObject];
      id v54 = [v53 value];

      v55 = [v63 shippingAddressSeed];
      uint64_t v56 = PKPostalAddressHash((uint64_t)v54, v55);

      v57 = [v56 base64EncodedStringWithOptions:0];
      [(PKPaymentServiceProviderPerformPaymentRequest *)v33 setShippingAddressHash:v57];
    }
LABEL_37:

    self->_awaitingWebServiceResponse = 1;
    id v58 = self->_paymentWebService;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_288;
    v66[3] = &unk_1E56E1D40;
    id v68 = v7;
    id v67 = v4;
    [(PKPaymentWebService *)v58 performServiceProviderPayment:v33 completion:v66];

    goto LABEL_38;
  }
  self->_awaitingWebServiceResponse = 1;
  *(void *)buf = 0;
  id v40 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  int v41 = [v40 isPayLaterPaymentRequest];

  if (v41)
  {
    id v42 = objc_alloc_init(PKAccountWebServiceFinancingPlanFundingSourceActionRequest);
    [(PKPaymentAuthorizationStateMachine *)self _updatePayLaterFundingSourceActionRequest:v42 param:v4];
    uint64_t v43 = 0;
  }
  else
  {
    id v42 = objc_alloc_init(PKPaymentRewrapRequest);
    [(PKPaymentAuthorizationStateMachine *)self _updateRewrapRequest:v42 param:v4 serviceURL:buf];
    uint64_t v43 = *(void *)buf;
  }
  uint64_t v45 = self->_paymentWebService;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_2_292;
  v64[3] = &unk_1E56E1D68;
  id v65 = v7;
  [(PKPaymentWebService *)v45 rewrapInAppPaymentWithRequest:v42 serviceURL:v43 completion:v64];

LABEL_38:
  objc_destroyWeak(&v74);
  objc_destroyWeak(&location);
}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_2;
  block[3] = &unk_1E56DECB0;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_2(uint64_t a1)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_6;
  }
  unint64_t v4 = [WeakRetained state];
  if (v4 <= 0x10 && ((1 << v4) & 0x1A000) != 0) {
    goto LABEL_6;
  }
  if (v3[13])
  {
    v3[13] = 0;
    id v6 = [*(id *)(a1 + 32) _activeODIAssessment];
    if ([v6 currentAssessmentDidTimeout]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
    [v6 provideSessionFeedback:v7];
  }
  v3[11] = 0;
  id v8 = *(void **)(a1 + 48);
  if (*(void *)(a1 + 40) && !v8)
  {
    objc_msgSend(v3, "_setState:param:", 18);
    goto LABEL_6;
  }
  id v9 = [v8 domain];
  if (![v9 isEqualToString:@"PKPaymentWebServiceErrorDomain"]) {
    goto LABEL_22;
  }
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 56) paymentRequest];
  if ([v10 requestType] != 1)
  {

LABEL_22:
LABEL_23:
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      uint64_t v45 = *MEMORY[0x1E4F28A50];
      v46[0] = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      uint64_t v16 = [*(id *)(a1 + 48) domain];
      int v17 = [v16 isEqualToString:@"PKPaymentWebServiceErrorDomain"];

      if (v17)
      {
        uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 56) paymentRequest];
        uint64_t v19 = [v18 merchantSession];

        if (v19)
        {
          int v20 = [v19 retryNonce];

          if (!v20)
          {
            id v28 = PKLogFacilityTypeGetObject(7uLL);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v38 = 0;
              _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Web service error without a retry nonce. Failing payment", v38, 2u);
            }

            id v29 = +[PKPaymentAuthorizationErrorStateParam paramWithError:*(void *)(a1 + 48)];
            [v3 _setState:15 param:v29];

            goto LABEL_46;
          }
        }
        uint64_t v21 = [*(id *)(a1 + 48) code];
        switch(v21)
        {
          case 60011:
            uint64_t v39 = *MEMORY[0x1E4F28588];
            id v30 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_6.isa, 0);
            id v40 = v30;
            uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];

            long long v31 = [*(id *)(a1 + 32) model];
            uint64_t v32 = [v31 mode];

            uint64_t v26 = -3001;
            if (v32 == 1)
            {
              uint64_t v27 = 4;
              goto LABEL_41;
            }
            break;
          case 60010:
            uint64_t v41 = *MEMORY[0x1E4F28588];
            __int16 v33 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_10.isa, 0);
            id v42 = v33;
            uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];

            id v34 = [*(id *)(a1 + 32) model];
            uint64_t v35 = [v34 mode];

            uint64_t v26 = -3011;
            if (v35 == 1)
            {
              uint64_t v27 = 2;
              goto LABEL_41;
            }
            break;
          case 40307:
            uint64_t v43 = *MEMORY[0x1E4F28588];
            int v22 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_11.isa, 0);
            id v44 = v22;
            uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];

            int v24 = [*(id *)(a1 + 32) model];
            uint64_t v25 = [v24 mode];

            uint64_t v26 = -3009;
            if (v25 == 1)
            {
              uint64_t v27 = 5;
LABEL_41:
              [*(id *)(*(void *)(a1 + 32) + 56) setStatus:v27 forItemWithType:3];
            }
            break;
          default:
            uint64_t v26 = -2007;
            goto LABEL_44;
        }
        id v15 = (void *)v23;
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      id v15 = 0;
    }
    uint64_t v26 = -2007;
LABEL_45:
    id v36 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:v26 userInfo:v15];
    id v37 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v36];
    [v3 _setState:14 param:v37];

LABEL_46:
    goto LABEL_6;
  }
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 56) mode];

  if (v11 != 1) {
    goto LABEL_23;
  }
  id v12 = [v3 model];
  [v12 fallbackToBypassMode];

  id v13 = objc_alloc_init(PKPayment);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PKPayment *)v13 setCredential:*(void *)(a1 + 56)];
  }
  [v3 _enqueueDidAuthorizePaymentWithPayment:v13 rewrapResponse:0];

LABEL_6:
}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_284(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v15 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = a4;
  [v11 setRetryNonce:v12];
  [v9 setRetryNonce:v12];

  uint64_t v13 = *(void *)(a1 + 40);
  if (v9)
  {
    uint64_t v14 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithPaymentToken:v9 rewrapResponse:v10];
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v15);
  }
  else
  {
    (*(void (**)(void, void, id))(v13 + 16))(*(void *)(a1 + 40), 0, v15);
  }
}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_288(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v13 = v5;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = a3;
    id v9 = [v7 wrappedPayment];
    id v10 = [v9 transactionIdentifier];
    uint64_t v11 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithPurchase:v13 purchaseTransactionIdentifier:v10];
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v11, v8);
  }
  else
  {
    id v12 = *(void (**)(uint64_t, void, id))(v6 + 16);
    id v9 = a3;
    v12(v6, 0, v9);
  }
}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_2_292(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    id v7 = a2;
    id v9 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithPaymentToken:a3 rewrapResponse:a4];
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    id v8 = *(void (**)(uint64_t, void))(v4 + 16);
    id v9 = a2;
    v8(v4, 0);
  }
}

- (void)_updatePayLaterFundingSourceActionRequest:(id)a3 param:(id)a4
{
  id v6 = a3;
  [(PKPaymentAuthorizationStateMachine *)self _updateRewrapRequest:v6 param:a4 serviceURL:0];
  id v7 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  id v12 = [v7 payLaterPaymentRequest];

  id v8 = [v12 accountBaseURL];
  [v6 setBaseURL:v8];

  id v9 = [v12 accountIdentifier];
  [v6 setAccountIdentifier:v9];

  id v10 = [v12 financingPlan];
  uint64_t v11 = [v10 planIdentifier];
  [v6 setPlanIdentifier:v11];

  objc_msgSend(v6, "setIntent:", objc_msgSend(v12, "payLaterPaymentIntentType"));
}

- (void)_updateRewrapRequest:(id)a3 param:(id)a4 serviceURL:(id *)a5
{
  model = self->_model;
  id v9 = a4;
  id v10 = a3;
  id v15 = [(PKPaymentAuthorizationDataModel *)model paymentRequest];
  uint64_t v11 = [(PKPaymentAuthorizationStateMachine *)self _updateRewrapBaseRequest:v10 param:v9];

  id v12 = [v15 merchantIdentifier];
  [v10 setMerchantIdentifier:v12];

  id v13 = [(PKPaymentAuthorizationDataModel *)self->_model hostApplicationIdentifier];
  [v10 setHostApplicationIdentifier:v13];

  uint64_t v14 = [(PKPaymentAuthorizationDataModel *)self->_model merchantName];
  [v10 setMerchantDisplayName:v14];

  if (a5) {
    objc_storeStrong(a5, v11);
  }
}

- (id)_rewrapCompleteSessionRequestWithParam:(id)a3 serviceURL:(id *)a4
{
  model = self->_model;
  id v7 = a3;
  id v8 = [(PKPaymentAuthorizationDataModel *)model paymentRequest];
  id v9 = [v8 merchantSession];
  id v10 = objc_alloc_init(PKPaymentCompleteSessionRequest);
  uint64_t v11 = [(PKPaymentAuthorizationStateMachine *)self _updateRewrapBaseRequest:v10 param:v7];

  [(PKPaymentCompleteSessionRequest *)v10 setMerchantSession:v9];
  if (a4) {
    objc_storeStrong(a4, v11);
  }

  return v10;
}

- (id)_updateRewrapBaseRequest:(id)a3 param:(id)a4
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  v126 = [(PKPaymentAuthorizationDataModel *)self->_model currencyCode];
  uint64_t v9 = [v8 boundInterfaceIdentifier];
  uint64_t v10 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
  uint64_t v11 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:3];
  id v112 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:9];
  id v111 = [v112 bankAccountInformation];
  id v109 = v11;
  v128 = [v11 pass];
  v124 = [v8 applicationData];
  id v12 = [v7 wrappedPayment];
  id v125 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 1)
  {
    id v13 = [(PKPaymentAuthorizationDataModel *)self->_model remoteDevice];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
  v117 = v115 = v12;
  v127 = (void *)v10;
  BOOL v118 = v14;
  if (!v117 || [(PKPaymentAuthorizationDataModel *)self->_model fundingMode] != 1)
  {
    if ([v8 isPayLaterPaymentRequest])
    {
      v122 = [v12 transactionIdentifier];
      if (!v128)
      {
        uint64_t v19 = (void *)v9;
        if (v112)
        {
          uint64_t v27 = [v8 payLaterPaymentRequest];
          id v28 = [v111 identifier];
          id v29 = [v27 accountPaymentFundingSourceForBankIdentifier:v28];

          uint64_t v25 = [[PKPayLaterFinancingOptionFundingSource alloc] initWithAccountFundingSource:v29];
          v123 = 0;
        }
        else
        {
          v123 = 0;
          uint64_t v25 = 0;
        }
        uint64_t v26 = 0;
        id v107 = 0;
        v128 = 0;
        goto LABEL_25;
      }
      uint64_t v19 = (void *)v9;
      uint64_t v25 = [[PKPayLaterFinancingOptionFundingSource alloc] initWithPaymentPass:v128 paymentApplication:v10];
      v123 = 0;
    }
    else
    {
      uint64_t v19 = (void *)v9;
      v122 = 0;
      v123 = 0;
      uint64_t v25 = 0;
    }
    uint64_t v26 = 0;
    id v107 = 0;
    goto LABEL_25;
  }
  id v15 = [v117 authAmount];
  uint64_t v16 = [v15 currency];

  v123 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
  int v17 = [(PKPayLaterFinancingController *)self->_financingController selectedFundingSource];
  uint64_t v18 = [v17 type];
  uint64_t v120 = (void *)v16;
  uint64_t v19 = (void *)v9;
  if (v18 == 2)
  {
    id v30 = v17;

    long long v31 = [PKPayLaterFinancingOptionFundingSource alloc];
    uint64_t v32 = [v30 accountPaymentFundingSource];

    int v24 = [(PKPayLaterFinancingOptionFundingSource *)v31 initWithAccountFundingSource:v32];
    id v12 = v115;
    v127 = 0;
    v128 = 0;
  }
  else if (v18 == 1)
  {
    id v20 = v17;
    uint64_t v21 = [v20 paymentPass];

    [v20 paymentApplication];
    v23 = id v22 = v7;

    int v24 = [[PKPayLaterFinancingOptionFundingSource alloc] initWithPaymentPass:v21 paymentApplication:v23];
    v128 = (void *)v21;
    id v12 = v115;
    v127 = (void *)v23;
    id v7 = v22;
  }
  else
  {
    int v24 = 0;
  }
  __int16 v33 = [v117 financingOptionData];
  [v125 addEntriesFromDictionary:v33];

  id v34 = [(PKPaymentAuthorizationStateMachine *)self _additionalPayLaterServiceProviderData];
  [v125 addEntriesFromDictionary:v34];

  uint64_t v35 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
  uint64_t v36 = [v35 paymentServicesBaseURL];

  v122 = [v12 transactionIdentifier];
  id v107 = (id)v36;
  if (!v36)
  {
    id v37 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "Error: There is no paymentServicesBaseURL defined on the pay later account", buf, 2u);
    }
  }
  uint64_t v25 = v24;
  [(PKPayLaterFinancingOptionFundingSource *)v24 setAutoPayment:[(PKPayLaterFinancingController *)self->_financingController autoPaymentOn]];

  uint64_t v26 = 1;
  v126 = v120;
LABEL_25:
  v121 = [(PKPayLaterFinancingOptionFundingSource *)v25 dictionaryRepresentation];
  id v38 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  char v39 = [v38 isVirtualCardEnrollmentRequest];

  id v108 = v25;
  if (v39)
  {
    uint64_t v40 = 2;
  }
  else
  {
    uint64_t v41 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    int v42 = [v41 isVirtualCardRefreshRequest];

    if (v42) {
      uint64_t v40 = 3;
    }
    else {
      uint64_t v40 = v26;
    }
  }
  uint64_t v43 = v19;
  id v44 = [(PKPaymentAuthorizationDataModel *)self->_model selectedPaymentOffer];
  uint64_t v45 = [(PKPaymentAuthorizationDataModel *)self->_model paymentOffersController];
  uint64_t v46 = [v128 uniqueID];
  id v47 = [v45 paymentOfferCriteriaForPassUniqueID:v46];
  id v116 = objc_msgSend(v47, "pk_firstObjectPassingTest:", &__block_literal_global_298);

  uint64_t v113 = v44;
  if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 2 && v44)
  {
    uint64_t v48 = [v44 type];
    BOOL v49 = v125;
    if (v48 == 2)
    {
      uint64_t v52 = [v44 rewardsRedemptionIntent];
      v55 = [v52 dictionaryRepresentation];
      [v125 safelySetObject:v55 forKey:@"rewardsRedemptionIntent"];

      uint64_t v40 = 5;
    }
    else
    {
      if (v48 != 1)
      {
LABEL_40:
        uint64_t v56 = [v44 serviceProviderData];
        [v125 addEntriesFromDictionary:v56];

        v57 = [v44 sessionIdentifier];
        [v125 safelySetObject:v57 forKey:@"sessionIdentifier"];

        id v58 = [v44 selectedOfferIdentifier];
        [v125 safelySetObject:v58 forKey:@"selectedOfferIdentifier"];

        uint64_t v53 = [v44 criteriaIdentifier];
        goto LABEL_41;
      }
      uint64_t v50 = [v44 installmentAssessment];
      id v51 = [v50 offers];
      uint64_t v52 = objc_msgSend(v51, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_301);

      [v125 safelySetObject:v52 forKey:@"allOfferIdentifiers"];
      uint64_t v40 = 4;
    }

    goto LABEL_40;
  }
  BOOL v49 = v125;
  if (!v116)
  {
    BOOL v54 = v118;
    goto LABEL_42;
  }
  uint64_t v53 = [v116 identifier];
LABEL_41:
  id v59 = (void *)v53;
  BOOL v54 = v118;
  [v49 safelySetObject:v53 forKey:@"criteriaIdentifier"];

LABEL_42:
  [v6 setType:v40];
  int64_t v60 = [v7 wrappedPayment];
  [v6 setWrappedPayment:v60];

  [v6 setPass:v128];
  [v6 setPaymentApplication:v127];
  [v6 setApplicationData:v124];
  [v6 setBoundInterfaceIdentifier:v43];
  objc_msgSend(v6, "setCryptogramType:", objc_msgSend(v7, "cryptogramType"));
  [v6 setCurrencyCode:v126];
  if ([v49 count])
  {
    id v61 = (void *)[v49 copy];
    [v6 setServiceProviderData:v61];
  }
  else
  {
    [v6 setServiceProviderData:0];
  }
  [v6 setPaymentHash:v122];
  [v6 setAccount:v123];
  [v6 setFundingSourceDetails:v121];
  if (v54)
  {
    id v62 = [(PKPaymentAuthorizationDataModel *)self->_model remoteDevice];
    id v63 = [v62 modelIdentifier];

    if ([v63 length]) {
      [v6 setRemoteDeviceModel:v63];
    }
  }
  id v64 = [v8 remoteNetworkRequestPaymentTopicID];
  uint64_t v65 = [v64 length];

  if (v65)
  {
    id v66 = [v8 remoteNetworkRequestPaymentTopicID];
    [v6 setRemoteNetworkRequestPaymentTopicID:v66];

    id v67 = [v8 userAgent];
    [v6 setRemoteNetworkRequestInitiatingUserAgent:v67];
  }
  else
  {
    id v67 = [v8 userAgent];
    [v6 setUserAgent:v67];
  }

  id v68 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
  uint64_t v69 = [v68 paymentWebService:self->_paymentWebService supportedRegionFeatureOfType:4];

  id v70 = v128;
  if ([v8 isMultiTokenRequest] && v69)
  {
    [v6 setInitiative:@"multi_token"];
    id v71 = [v8 multiTokenContexts];
    [v6 setMultiTokenContexts:v71];
  }
  v106 = (void *)v69;
  v72 = [v8 recurringPaymentRequest];
  v119 = [v8 automaticReloadPaymentRequest];
  id v73 = [v8 deferredPaymentRequest];
  id v74 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
  uint64_t v75 = [v74 paymentWebService:self->_paymentWebService supportedRegionFeatureOfType:3];

  id v110 = v7;
  v114 = (void *)v75;
  if (v72 && v75)
  {
    [v6 setInitiative:@"merchant_token"];
    uint64_t v76 = [v72 tokenNotificationURL];
    uint64_t v77 = [v76 absoluteString];
    [v6 setInitiativeContext:v77];

    id v78 = [v72 managementURL];
    v79 = [v78 absoluteString];
    [v6 setMerchantTokenManagementURL:v79];

    uint64_t v80 = PKMerchantTokenRequestUseCaseRecurring;
LABEL_61:
    [v6 setMerchantTokenUseCase:*v80];
    goto LABEL_62;
  }
  if (v119 && v75)
  {
    [v6 setInitiative:@"merchant_token"];
    v81 = [v119 tokenNotificationURL];
    uint64_t v82 = [v81 absoluteString];
    [v6 setInitiativeContext:v82];

    v83 = [v119 managementURL];
    v84 = [v83 absoluteString];
    [v6 setMerchantTokenManagementURL:v84];

    uint64_t v80 = PKMerchantTokenRequestUseCaseAutomaticReload;
    goto LABEL_61;
  }
  if (v73 && v75)
  {
    [v6 setInitiative:@"merchant_token"];
    id v102 = [v73 tokenNotificationURL];
    id v103 = [v102 absoluteString];
    [v6 setInitiativeContext:v103];

    id v104 = [v73 managementURL];
    v105 = [v104 absoluteString];
    [v6 setMerchantTokenManagementURL:v105];

    [v6 setMerchantTokenUseCase:@"merchant_token_deferred"];
    [v6 setIsDeferredPayment:1];
  }
LABEL_62:
  if ([v8 requestType] == 10) {
    [v6 setInitiative:@"transfer_funds"];
  }
  uint64_t v85 = [(PKPaymentAuthorizationDataModel *)self->_model shippingAddress];
  if (v85
    && (v86 = (void *)v85,
        [v128 shippingAddressSeed],
        char v87 = objc_claimAutoreleasedReturnValue(),
        v87,
        v86,
        v87))
  {
    v88 = v43;
    v89 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v89, OS_LOG_TYPE_DEFAULT, "Address seed: Pass has seed, hashing", buf, 2u);
    }

    uint64_t v90 = [(PKPaymentAuthorizationDataModel *)self->_model shippingAddress];
    v91 = [v90 postalAddresses];
    v92 = [v91 firstObject];
    v93 = [v92 value];

    id v70 = v128;
    id v94 = [v128 shippingAddressSeed];
    v95 = PKPostalAddressHash((uint64_t)v93, v94);

    v96 = [v95 base64EncodedStringWithOptions:0];
    [v6 setShippingAddressHash:v96];

    uint64_t v43 = v88;
  }
  else
  {
    v93 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v93, OS_LOG_TYPE_DEFAULT, "Address seed: Pass has no seed, skipping", buf, 2u);
    }
  }

  v97 = [(PKPaymentAuthorizationStateMachine *)self _activeODIAssessment];
  if (v97)
  {
    if ([v70 supportsDeviceAssessmentAccordingToService:self->_paymentWebService])
    {
      v98 = [v97 currentAssessment];
      v99 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v130 = v97;
        _os_log_impl(&dword_190E10000, v99, OS_LOG_TYPE_DEFAULT, "Setting device assessment %@", buf, 0xCu);
      }

      [v6 setDeviceAssessments:v98];
    }
    else
    {
      v98 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v98, OS_LOG_TYPE_DEFAULT, "Not attaching device assessment to rewrap request, as pass does not support assessments (assessment was probably generated for a supported pass, but payment is being made with an unsupported pass)", buf, 2u);
      }
    }
  }
  id v100 = v107;

  return v100;
}

BOOL __69__PKPaymentAuthorizationStateMachine__updateRewrapBaseRequest_param___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

uint64_t __69__PKPaymentAuthorizationStateMachine__updateRewrapBaseRequest_param___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)_additionalPayLaterServiceProviderData
{
  id v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  uint64_t v4 = [v3 APIType];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((unint64_t)(v4 - 1) < 2)
  {
    id v6 = [v3 merchantSession];
    id v7 = [v6 merchantIdentifier];
    id v8 = [v6 displayName];
    uint64_t v9 = [v6 domain];
    if (v7) {
      [v5 setObject:v7 forKey:@"webMerchantIdentifier"];
    }
    if (v8) {
      [v5 setObject:v8 forKey:@"webMerchantName"];
    }
    if (v9) {
      [v5 setObject:v9 forKey:@"originURL"];
    }

    goto LABEL_12;
  }
  if (!v4)
  {
    unint64_t v10 = [(PKPaymentAuthorizationStateMachine *)self _adamIdentifier];
    if (v10)
    {
      id v6 = [NSNumber numberWithUnsignedLongLong:v10];
      [v5 setObject:v6 forKey:@"adamIdentifier"];
LABEL_12:
    }
  }
  uint64_t v11 = (void *)[v5 copy];

  return v11;
}

- (void)_performDataProcessingWithParam:(id)a3
{
  id v4 = a3;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __70__PKPaymentAuthorizationStateMachine__performDataProcessingWithParam___block_invoke;
  int v17 = &unk_1E56D8A90;
  uint64_t v18 = self;
  id v5 = v4;
  id v19 = v5;
  id v6 = (void (**)(void))_Block_copy(&v14);
  id v7 = objc_msgSend(v5, "rewrapResponse", v14, v15, v16, v17, v18);
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 redemption];

    if (v9)
    {
      unint64_t v10 = [v8 redemption];
      [(PKPaymentAuthorizationStateMachine *)self _processPaymentRewardsRedemption:v10];
    }
    uint64_t v11 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
    if ([v11 isPayLaterPaymentRequest])
    {
      id v12 = [v8 financingPlan];
      id v13 = [v8 account];
      [(PKPaymentAuthorizationStateMachine *)self _updatePostPurchasePayLaterFinancingPlan:v12 account:v13 completion:v6];
    }
    else
    {
      v6[2](v6);
    }
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __70__PKPaymentAuthorizationStateMachine__performDataProcessingWithParam___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setState:12 param:*(void *)(a1 + 40)];
}

- (void)_processPaymentRewardsRedemption:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Got payment rewards redemption details %@", (uint8_t *)&v17, 0xCu);
  }

  id v6 = [(PKPaymentAuthorizationDataModel *)self->_model pass];
  id v7 = [v6 uniqueID];

  if (v7)
  {
    id v8 = [(PKPaymentAuthorizationDataModel *)self->_model selectedPaymentOffer];
    if ([v8 type] == 2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v8 rewardsRedemptionIntent];
        unint64_t v10 = v9;
        if (v9 && ([v9 isEmptyValued] & 1) == 0)
        {
          uint64_t v11 = [PKPaymentRewardsRedemptionUnit alloc];
          uint64_t v12 = [v10 rewardsType];
          id v13 = [v10 monetaryValue];
          uint64_t v14 = [v10 value];
          uint64_t v15 = [(PKPaymentRewardsRedemptionUnit *)v11 initWithType:v12 monetaryValue:v13 value:v14];

          uint64_t v16 = [[PKPaymentRewardsRedemptionDetails alloc] initWithIntended:v15 redeemed:0 originalTransactionDetails:0];
          [v4 setDetails:v16];
        }
      }
    }
    [(PKPaymentService *)self->_paymentService insertOrUpdatePaymentRewardsRedemption:v4 withPassUniqueIdentifier:v7];
    PKSharedCacheSetBoolForKey(1, @"PKSharedCacheHasEverMadeIssuerInstallmentTransaction");
  }
}

- (void)_enrichPaymentRewardsRedemptionWithPaymentTransaction:(id)a3 usingPass:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (!PKHideCardBenefitRewards())
  {
    paymentService = self->_paymentService;
    id v8 = [v21 paymentHash];
    uint64_t v9 = [(PKPaymentService *)paymentService paymentRewardsRedemptionForPaymentHash:v8];

    if (v9)
    {
      unint64_t v10 = [v21 merchant];
      uint64_t v11 = objc_alloc_init(PKPaymentRewardsRedemptionTransactionDetails);
      uint64_t v12 = [v21 identifier];
      [(PKPaymentRewardsRedemptionTransactionDetails *)v11 setIdentifier:v12];

      id v13 = [v21 merchantProvidedDescription];
      [(PKPaymentRewardsRedemptionTransactionDetails *)v11 setDescriptionText:v13];

      uint64_t v14 = [v10 name];
      [(PKPaymentRewardsRedemptionTransactionDetails *)v11 setMerchantRawName:v14];

      uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "category"));
      [(PKPaymentRewardsRedemptionTransactionDetails *)v11 setMerchantCategoryCode:v15];

      uint64_t v16 = [v21 transactionDate];
      [(PKPaymentRewardsRedemptionTransactionDetails *)v11 setTimestamp:v16];

      int v17 = [v21 currencyAmount];
      [(PKPaymentRewardsRedemptionTransactionDetails *)v11 setMonetaryValue:v17];

      id v18 = [v9 details];
      if (!v18) {
        id v18 = objc_alloc_init(PKPaymentRewardsRedemptionDetails);
      }
      [(PKPaymentRewardsRedemptionDetails *)v18 setOriginalTransaction:v11];
      [v9 setDetails:v18];
      uint64_t v19 = self->_paymentService;
      id v20 = [v6 uniqueID];
      [(PKPaymentService *)v19 insertOrUpdatePaymentRewardsRedemption:v9 withPassUniqueIdentifier:v20];
    }
  }
}

- (void)_updatePostPurchasePayLaterFinancingPlan:(id)a3 account:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  uint64_t v12 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  id v13 = [v12 payLaterPaymentRequest];
  uint64_t v14 = [v13 accountIdentifier];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v9 accountIdentifier];
  }
  int v17 = v16;

  accountService = self->_accountService;
  if (accountService)
  {
    uint64_t v19 = accountService;
  }
  else
  {
    uint64_t v19 = +[PKAccountService sharedInstance];
  }
  id v20 = v19;
  if (v8)
  {
    id v21 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v8;
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Updating post purchase pay later financing plan %@", buf, 0xCu);
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke;
    v31[3] = &unk_1E56E0B58;
    uint64_t v32 = v20;
    id v33 = v8;
    id v34 = v17;
    [(PKAsyncUnaryOperationComposer *)v11 addOperation:v31];
  }
  if (v9)
  {
    id v22 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v9;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Updating post purchase pay later account %@", buf, 0xCu);
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_336;
    v28[3] = &unk_1E56E1DD0;
    id v29 = v20;
    id v30 = v9;
    [(PKAsyncUnaryOperationComposer *)v11 addOperation:v28];
  }
  uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_4;
  v26[3] = &unk_1E56E1DF8;
  id v27 = v10;
  id v24 = v10;
  id v25 = [(PKAsyncUnaryOperationComposer *)v11 evaluateWithInput:v23 completion:v26];
}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)a1[4];
  v16[0] = a1[5];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v10 = a1[6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_2;
  v13[3] = &unk_1E56D89C8;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [v8 insertOrUpdateLocalFinancingPlans:v9 accountIdentifier:v10 completion:v13];
}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_3;
  v2[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_336(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_2_337;
  void v12[3] = &unk_1E56DD210;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v9 insertOrUpdateLocalAccount:v8 completion:v12];
}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_2_337(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_3_338;
  v2[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_3_338(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_5;
  block[3] = &unk_1E56D8360;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performDidAuthorizeCallbackWithParam:(id)a3
{
  id v10 = a3;
  id v4 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  unint64_t v5 = [v4 requestType];
  if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 1)
  {
    id v6 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
    id v7 = [v6 identifier];
  }
  else
  {
    id v7 = 0;
  }
  [(PKPayLaterFinancingController *)self->_financingController stateMachineUpdatedAuthenticationState:1 selectedOptionIdentifier:v7 error:0 cancelReason:self->_cancelReason];
  if ([v4 isServiceProviderPaymentRequest])
  {
    [(PKPaymentAuthorizationStateMachine *)self _enqeueDidAuthorizePurchaseWithParam:v10];
    goto LABEL_22;
  }
  if (![v4 isPeerPaymentRequest])
  {
    if (v5 != 2)
    {
      if (v5 == 5)
      {
        uint64_t v8 = [v10 installmentAuthorizationToken];
        id v9 = [v10 rewrapResponse];
        [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizePaymentWithInstallmentAuthorizationToken:v8 rewrapResponse:v9];
      }
      else
      {
        if (v5 == 4) {
          goto LABEL_11;
        }
        if ([(PKPaymentAuthorizationStateMachine *)self useSecureElement])
        {
          uint64_t v8 = [v10 paymentToken];
          id v9 = [v10 rewrapResponse];
          [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizePaymentWithToken:v8 rewrapResponse:v9];
        }
        else if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 3)
        {
          if (v5 <= 0xD && ((1 << v5) & 0x20C0) != 0)
          {
            [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizeContext];
            goto LABEL_22;
          }
          uint64_t v8 = [v10 payment];
          id v9 = [v10 rewrapResponse];
          [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizePaymentWithByPassPayment:v8 rewrapResponse:v9];
        }
        else
        {
          uint64_t v8 = [v10 payment];
          id v9 = [v10 rewrapResponse];
          [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizePaymentWithRemotePayment:v8 rewrapResponse:v9];
        }
      }

      goto LABEL_21;
    }
LABEL_11:
    uint64_t v8 = [v10 applePayTrustSignature];
    [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizeAccountServicePaymentRequestWithApplePayTrustSignature:v8];
    goto LABEL_21;
  }
  uint64_t v8 = [v10 authorizedPeerPaymentQuote];
  [(PKPaymentAuthorizationStateMachine *)self _enqueueDidAuthorizePeerPaymentQuoteWithAuthorizedQuote:v8];
LABEL_21:

LABEL_22:
}

- (void)_insertPendingPaymentTransactionsWithParam:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  if ([(PKPaymentAuthorizationDataModel *)self->_model mode] == 1
    && [(PKPaymentAuthorizationDataModel *)self->_model fundingMode] != 1)
  {
    [(PKPaymentAuthorizationDataModel *)self->_model pendingTransactions];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v29;
      *(void *)&long long v5 = 138412802;
      long long v25 = v5;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "paymentApplication", v25);
          id v11 = [v10 dpanIdentifier];

          id v12 = [v27 peerPaymentTransactionMetadata];
          id v13 = v12;
          if (v12)
          {
            id v14 = [v12 dpanIdentifier];
            int v15 = [v14 isEqual:v11];

            if (v15)
            {
              id v16 = [v9 transaction];
              int v17 = [v13 serviceIdentifier];
              [v16 setServiceIdentifier:v17];

              id v18 = [v13 requestDeviceScoreIdentifier];
              [v16 setRequestDeviceScoreIdentifier:v18];

              uint64_t v19 = [v13 sendDeviceScoreIdentifier];
              [v16 setSendDeviceScoreIdentifier:v19];
            }
          }
          id v20 = [v9 transaction];
          id v21 = [v9 paymentApplication];
          id v22 = [v9 pass];
          uint64_t v23 = [v22 uniqueID];

          id v24 = PKLogFacilityTypeGetObject(0x17uLL);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            id v33 = v20;
            __int16 v34 = 2112;
            uint64_t v35 = v23;
            __int16 v36 = 2112;
            uint64_t v37 = v21;
            _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Inserting transaction: %@ for pass: %@ paymentApplication: %@", buf, 0x20u);
          }

          [(PKPaymentService *)self->_paymentService insertOrUpdatePaymentTransaction:v20 forPassUniqueIdentifier:v23 paymentApplication:v21 completion:&__block_literal_global_344];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v6);
    }
  }
}

void __81__PKPaymentAuthorizationStateMachine__insertPendingPaymentTransactionsWithParam___block_invoke()
{
  v0 = PKLogFacilityTypeGetObject(0x17uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v1 = 0;
    _os_log_impl(&dword_190E10000, v0, OS_LOG_TYPE_DEFAULT, "Inserted transaction from PKPaymentAuthorizationStateMachine", v1, 2u);
  }
}

- (void)_insertPendingTransactionRegistration
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    if (PKDocumentDeliveryEnabled())
    {
      id v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
      uint64_t v4 = [v3 requestType];

      if ((unint64_t)(v4 - 1) >= 0xA
        && (unint64_t)(v4 - 12) >= 4
        && [(PKPaymentAuthorizationDataModel *)self->_model mode] == 1
        && +[PKWebServiceDocumentDeliveryFeature isEnabledWithWebService:self->_paymentWebService])
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v5 = [(PKPaymentAuthorizationDataModel *)self->_model pendingTransactions];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v16;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
              id v11 = objc_alloc_init((Class)getFKTrillianTransactionImporterClass[0]());
              id v12 = PKLogFacilityTypeGetObject(7uLL);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)id v14 = 0;
                _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Inserting pending transaction registration", v14, 2u);
              }

              id v13 = [v10 transaction];
              [v11 registerTransaction:v13];

              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v7);
        }
      }
    }
  }
}

- (void)_insertPendingOrderDetails:(BOOL *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v5 = [(PKPaymentAuthorizationDataModel *)self->_model payment];
  uint64_t v6 = [(PKPaymentAuthorizationDataModel *)self->_model pendingOrderDetails];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
LABEL_9:
    *a3 = 0;
    goto LABEL_13;
  }
  if (PKOrderManagementDisabled())
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Payment had order details, but user has disabled order management. Skipping.", (uint8_t *)&v20, 2u);
    }

    goto LABEL_9;
  }
  id v10 = [v5 token];
  id v11 = [v10 transactionIdentifier];

  id v12 = objc_alloc(_MergedGlobals_173());
  id v13 = [v7 orderTypeIdentifier];
  id v14 = [v7 orderIdentifier];
  long long v15 = [v7 webServiceURL];
  long long v16 = [v7 authenticationToken];
  long long v17 = (void *)[v12 initWithTransactionIdentifier:v11 orderTypeIdentifier:v13 orderIdentifier:v14 webServiceBaseURL:v15 authenticationToken:v16];

  id v18 = objc_alloc_init((Class)off_1EB402420());
  uint64_t v19 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v17;
    _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Inserting pending Apple Pay order with details: %@", (uint8_t *)&v20, 0xCu);
  }

  [v18 insertOrUpdatePendingApplePayOrder:v17];
  *a3 = 1;

LABEL_13:
}

- (void)_updateModelCanAddPasses
{
  paymentWebService = self->_paymentWebService;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__PKPaymentAuthorizationStateMachine__updateModelCanAddPasses__block_invoke;
  v3[3] = &unk_1E56DD7C8;
  v3[4] = self;
  +[PKPaymentRegistrationUtilities _shouldShowAddCardFlowForWebService:paymentWebService completion:v3];
}

uint64_t __62__PKPaymentAuthorizationStateMachine__updateModelCanAddPasses__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 56) beginUpdates];
  [*(id *)(*(void *)(a1 + 32) + 56) setCanAddPasses:a2];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
  return [v4 endUpdates];
}

- (void)_updateModelBillingAddressIfNeededForPass:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  long long v5 = [v4 requiredBillingContactFields];
  if ([v5 containsObject:@"post"])
  {
    uint64_t v6 = [(PKPaymentAuthorizationDataModel *)self->_model billingAddress];

    if (v6) {
      goto LABEL_7;
    }
    uint64_t v7 = +[PKPaymentOptionsDefaults defaults];
    uint64_t v4 = [v7 defaultBillingAddressForPaymentPass:v8];

    if (v4) {
      [(PKPaymentAuthorizationDataModel *)self->_model setBillingAddress:v4];
    }
  }
  else
  {
  }
LABEL_7:
}

- (void)_retrieveVPANPaymentSession
{
  self->_awaitingWebServiceResponse = 1;
  paymentWebService = self->_paymentWebService;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PKPaymentAuthorizationStateMachine__retrieveVPANPaymentSession__block_invoke;
  v3[3] = &unk_1E56E1E40;
  v3[4] = self;
  [(PKPaymentWebService *)paymentWebService virtualCardPaymentSessionWithCompletion:v3];
}

void __65__PKPaymentAuthorizationStateMachine__retrieveVPANPaymentSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKPaymentAuthorizationStateMachine__retrieveVPANPaymentSession__block_invoke_2;
  block[3] = &unk_1E56D8AB8;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__PKPaymentAuthorizationStateMachine__retrieveVPANPaymentSession__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 11) = 0;
  if (*(void *)(a1 + 40))
  {
    id v3 = [[PKPaymentRequestMerchantSessionUpdate alloc] initWithStatus:0 merchantSession:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "didReceiveMerchantSessionCompleteWithUpdate:");
    [*(id *)(a1 + 32) _advanceToNextState];
  }
  else
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = +[PKPaymentAuthorizationErrorStateParam paramWithError:*(void *)(a1 + 48)];
    objc_msgSend(v2, "_setState:param:", 15);
  }
}

- (void)_registerForNotifications
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 addObserver:self selector:sel__handleStateMachineWillStartNotification_ name:@"PKPaymentAuthorizationStateMachineWillStartNotification" object:0 suspensionBehavior:4];
}

- (void)_unregisterForNotifications
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];
}

- (void)_postStateMachineWillStartNotification
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 postNotificationName:@"PKPaymentAuthorizationStateMachineWillStartNotification" object:self->_instanceIdentifier userInfo:0 options:1];
}

- (void)_handleStateMachineWillStartNotification:(id)a3
{
  id v4 = a3;
  unint64_t state = self->_state;
  BOOL v6 = state > 0x10;
  uint64_t v7 = (1 << state) & 0x1A000;
  if (v6 || v7 == 0)
  {
    id v11 = v4;
    uint64_t v9 = [v4 object];
    char v10 = [v9 isEqual:self->_instanceIdentifier];

    id v4 = v11;
    if ((v10 & 1) == 0)
    {
      [(PKPaymentAuthorizationStateMachine *)self didCancel];
      id v4 = v11;
    }
  }
}

- (void)_performAuthorizationWithParam:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  id v5 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  BOOL v6 = (void *)[v5 requestType];

  uint64_t v7 = [v4 credential];
  id v8 = [v4 nonceData];
  uint64_t v9 = (void *)[v4 cryptogramType];
  char v10 = [v4 networkMerchantIdentifier];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke;
  aBlock[3] = &unk_1E56E1EB8;
  id v44 = v80;
  objc_copyWeak(v80, location);
  id v11 = v8;
  id v77 = v11;
  id v12 = v7;
  v80[1] = v9;
  v80[2] = v6;
  id v78 = v12;
  v79 = self;
  id v13 = _Block_copy(aBlock);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_354;
  v68[3] = &unk_1E56E1EE0;
  id v14 = v11;
  id v69 = v14;
  id v15 = v12;
  id v70 = v15;
  v75[1] = v9;
  id v40 = v10;
  id v71 = v40;
  v72 = self;
  id v16 = v4;
  id v73 = v16;
  id v17 = v13;
  id v74 = v17;
  uint64_t v43 = v75;
  objc_copyWeak(v75, location);
  v75[2] = v6;
  uint64_t v45 = (void (**)(void *, void *, void))_Block_copy(v68);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_365;
  v66[3] = &unk_1E56E1F08;
  int v42 = &v67;
  objc_copyWeak(&v67, location);
  id v18 = _Block_copy(v66);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_368;
  v63[3] = &unk_1E56E15D0;
  v63[4] = self;
  uint64_t v41 = &v65;
  objc_copyWeak(&v65, location);
  id v19 = v15;
  id v64 = v19;
  uint64_t v46 = (void (**)(void))_Block_copy(v63);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_380;
  v59[3] = &unk_1E56E1FD0;
  v59[4] = self;
  id v20 = v19;
  id v60 = v20;
  id v39 = v18;
  id v61 = v39;
  objc_copyWeak(&v62, location);
  id v47 = (void (**)(void *, void *, void))_Block_copy(v59);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_384;
  v56[3] = &unk_1E56DD038;
  objc_copyWeak(&v58, location);
  v56[4] = self;
  id v21 = v20;
  id v57 = v21;
  uint64_t v22 = (void (**)(void))_Block_copy(v56);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  void v50[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_388;
  v50[3] = &unk_1E56E2048;
  objc_copyWeak(&v55, location);
  v50[4] = self;
  id v23 = v14;
  id v51 = v23;
  id v24 = v21;
  id v52 = v24;
  id v38 = v16;
  id v53 = v38;
  id v25 = v17;
  id v54 = v25;
  uint64_t v26 = (void (**)(void))_Block_copy(v50);
  id v27 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  if ([v27 isPeerPaymentRequest])
  {
    peerPaymentSession = self->_peerPaymentSession;
    long long v29 = v47;
    if (peerPaymentSession) {
      goto LABEL_3;
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_393;
    v49[3] = &unk_1E56E2070;
    v49[4] = v47;
    id v35 = +[PKPaymentSession startPeerPaymentSessionWithCompletion:](PKPaymentSession, "startPeerPaymentSessionWithCompletion:", v49, v38, v39, v40, &v65, &v67, v75, v80);
    __int16 v36 = v49;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v30 = objc_msgSend(v27, "requestType", v38, v39, v40, &v65, &v67, v75, v80);
  long long v31 = v22;
  if (v30 == 2
    || (v32 = [v27 requestType], long long v31 = v22, v32 == 4)
    || (uint64_t v33 = [v27 requestType], v31 = v46, v33 == 5)
    || (BOOL v34 = [(PKPaymentAuthorizationStateMachine *)self _shouldSignPurpleTrustData],
        long long v31 = v26,
        v34))
  {
    v31[2]();
    goto LABEL_11;
  }
  peerPaymentSession = self->_inAppPaymentSession;
  long long v29 = v45;
  if (!peerPaymentSession)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_395;
    v48[3] = &unk_1E56E2098;
    v48[4] = v45;
    id v37 = +[PKPaymentSession startInAppSessionWithCompletion:v48];
    __int16 v36 = v48;
    goto LABEL_10;
  }
LABEL_3:
  v29[2](v29, peerPaymentSession, 0);
LABEL_11:

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v58);

  objc_destroyWeak(&v62);
  objc_destroyWeak(v41);

  objc_destroyWeak(v42);
  objc_destroyWeak(v43);

  objc_destroyWeak(v44);
  objc_destroyWeak(location);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2;
  block[3] = &unk_1E56E1E90;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  long long v13 = *(_OWORD *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3;
      block[3] = &unk_1E56E1E68;
      id v4 = v17;
      objc_copyWeak(v17, v2);
      id v14 = *(id *)(a1 + 32);
      id v15 = *(id *)(a1 + 40);
      id v5 = *(id *)(a1 + 48);
      id v6 = *(void **)(a1 + 72);
      id v16 = v5;
      v17[1] = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);

      uint64_t v7 = v14;
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      id v10[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4;
      v10[3] = &unk_1E56E1C78;
      id v4 = v12;
      objc_copyWeak(v12, v2);
      v12[1] = *(id *)(a1 + 80);
      int8x16_t v9 = *(int8x16_t *)(a1 + 48);
      id v8 = (id)v9.i64[0];
      int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
      dispatch_async(MEMORY[0x1E4F14428], v10);
      uint64_t v7 = (void *)v11.i64[1];
    }

    objc_destroyWeak(v4);
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    unint64_t v3 = [WeakRetained state];
    BOOL v4 = v3 > 0x10;
    uint64_t v5 = 1 << v3;
    id WeakRetained = v9;
    uint64_t v6 = v5 & 0x1A000;
    if (v4 || v6 == 0)
    {
      id v8 = +[PKPaymentAuthorizationRewrapStateParam paramWithWrappedPayment:*(void *)(a1 + 32) nonce:*(void *)(a1 + 40) credential:*(void *)(a1 + 48) cryptogramType:*(void *)(a1 + 64)];
      [v9 _setState:11 param:v8];

      id WeakRetained = v9;
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 56) == 1 && [*(id *)(*(void *)(a1 + 32) + 56) mode] == 1)
  {
    unint64_t v3 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Dual enrollment rewrap failed, performing regular buy", v9, 2u);
    }

    BOOL v4 = [WeakRetained model];
    [v4 fallbackToBypassMode];

    uint64_t v5 = objc_alloc_init(PKPayment);
    [(PKPayment *)v5 setCredential:*(void *)(a1 + 40)];
    [WeakRetained _enqueueDidAuthorizePaymentWithPayment:v5 rewrapResponse:0];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
    if (WeakRetained)
    {
      unint64_t v7 = [WeakRetained state];
      if (v7 > 0x10 || ((1 << v7) & 0x1A000) == 0)
      {
        id v8 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v6];
        [WeakRetained _setState:14 param:v8];
      }
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_354(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    char v25 = 0;
    uint64_t v6 = [[PKInAppPaymentSessionAuthorizeParamaters alloc] initWithNonce:*(void *)(a1 + 32) authenticationCredential:*(void *)(a1 + 40) networkMerchantIdentifier:*(void *)(a1 + 48) cryptogramType:*(void *)(a1 + 88)];
    [(PKInAppPaymentSessionAuthorizeParamaters *)v6 setIsFeatureNotSupportedError:&v25];
    unint64_t v7 = [*(id *)(a1 + 56) _inAppSessionAuthorizationRequest];
    id v8 = [v5 authorizeWithRequest:v7 authorizationParameters:v6];
    id v9 = [*(id *)(a1 + 64) evaluationResponse];
    id v10 = [v9 kextBlacklistVersion];
    [v8 setKextBlacklistVersion:v10];

    if (a3) {
      [v5 invalidateSession];
    }
    int8x16_t v11 = [*(id *)(*(void *)(a1 + 56) + 56) itemForType:3];
    id v12 = v11;
    if (v25
      && ([v11 pass],
          long long v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 hasAssociatedPeerPaymentAccount],
          v13,
          v14))
    {
      id v15 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "SE Error: Handling NFCD isFeatureNotSupported error. Re-registering for peer payment, then retrying quote authorization request again.", buf, 2u);
      }

      id v16 = [*(id *)(*(void *)(a1 + 56) + 56) peerPaymentService];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_356;
      v21[3] = &unk_1E56D8928;
      id v23 = *(id *)(a1 + 72);
      id v22 = v8;
      [v16 registerDeviceWithForceReregister:1 completion:v21];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_363;
    v18[3] = &unk_1E56E1C78;
    objc_copyWeak(v20, (id *)(a1 + 80));
    uint64_t v17 = *(void *)(a1 + 56);
    v20[1] = *(id *)(a1 + 96);
    v18[4] = v17;
    id v19 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v18);

    objc_destroyWeak(v20);
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_356(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = @"NO";
    if (a2) {
      unint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Completed peer payment re-register with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_363(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 56) == 1 && [*(id *)(*(void *)(a1 + 32) + 56) mode] == 1)
  {
    unint64_t v3 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Dual enrollment session not available, performing regular buy", v9, 2u);
    }

    BOOL v4 = [WeakRetained model];
    [v4 fallbackToBypassMode];

    id v5 = objc_alloc_init(PKPayment);
    [(PKPayment *)v5 setCredential:*(void *)(a1 + 40)];
    [WeakRetained _enqueueDidAuthorizePaymentWithPayment:v5 rewrapResponse:0];
  }
  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2005 userInfo:0];
  if (WeakRetained)
  {
    unint64_t v7 = [WeakRetained state];
    if (v7 > 0x10 || ((1 << v7) & 0x1A000) == 0)
    {
      int v8 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v6];
      [WeakRetained _setState:14 param:v8];
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_365(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_366;
  v5[3] = &unk_1E56D9150;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_366(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      unint64_t v3 = [WeakRetained state];
      BOOL v4 = v3 > 0x10;
      uint64_t v5 = 1 << v3;
      id WeakRetained = v11;
      uint64_t v6 = v5 & 0x1A000;
      if (!v4 && v6 != 0) {
        goto LABEL_13;
      }
      int v8 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithAuthorizedPeerPaymentQuote:*(void *)(a1 + 32)];
      [v11 _setState:12 param:v8];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
      unint64_t v9 = [v11 state];
      if (v9 > 0x10 || ((1 << v9) & 0x1A000) == 0)
      {
        __int16 v10 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v8];
        [v11 _setState:14 param:v10];
      }
    }

    id WeakRetained = v11;
  }
LABEL_13:
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_368(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) paymentRequest];
  unint64_t v3 = [v2 installmentConfiguration];
  uint64_t v4 = [v3 feature];
  if (v4 == 2) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 2 * (v4 == 1);
  }

  uint64_t v6 = +[PKAccountService sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_369;
  v7[3] = &unk_1E56E1FA8;
  void v7[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 40);
  [v6 defaultAccountForFeature:v5 completion:v7];

  objc_destroyWeak(&v9);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_369(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init(PKAccountWebServiceInstallmentAuthorizationRequest);
    id v8 = [v5 accountIdentifier];
    [(PKAccountWebServiceInstallmentAuthorizationRequest *)v7 setAccountIdentifier:v8];

    id v9 = [v5 accountBaseURL];
    [(PKAccountWebServiceInstallmentAuthorizationRequest *)v7 setBaseURL:v9];

    __int16 v10 = [*(id *)(*(void *)(a1 + 32) + 56) installmentBindToken];
    [(PKAccountWebServiceInstallmentAuthorizationRequest *)v7 setBindToken:v10];

    id v11 = [*(id *)(*(void *)(a1 + 32) + 56) installmentAuthorizationAmount];
    [(PKAccountWebServiceInstallmentAuthorizationRequest *)v7 setAuthorizationAmount:v11];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 56) installmentGroupIdentifier];
    [(PKAccountWebServiceInstallmentAuthorizationRequest *)v7 setInstallmentGroupIdentifier:v12];

    long long v13 = [*(id *)(*(void *)(a1 + 32) + 56) shippingAddress];

    if (v13)
    {
      int v14 = [*(id *)(*(void *)(a1 + 32) + 56) shippingAddress];
      id v15 = [v14 postalAddresses];
      id v16 = [v15 firstObject];
      uint64_t v17 = [v16 value];

      [(PKAccountWebServiceInstallmentAuthorizationRequest *)v7 setShippingAddress:v17];
    }
    id v18 = *(void **)(*(void *)(a1 + 32) + 32);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    id v23[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_5;
    v23[3] = &unk_1E56E1F80;
    objc_copyWeak(&v28, (id *)(a1 + 48));
    id v19 = v7;
    id v24 = v19;
    id v20 = *(id *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 32);
    id v25 = v20;
    uint64_t v26 = v21;
    id v27 = v5;
    [v18 performInstallmentAuthorizationWithRequest:v19 completion:v23];

    objc_destroyWeak(&v28);
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
    id v22 = *(void **)(a1 + 32);
    id v11 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v19];
    [v22 _setState:14 param:v11];
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_6;
  void v12[3] = &unk_1E56E1F58;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  id v13 = *(id *)(a1 + 32);
  id v7 = v5;
  id v14 = v7;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  __int16 v10 = *(void **)(a1 + 56);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = v10;
  id v11 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:v12];

  objc_destroyWeak(&v18);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) referenceIdentifier];
    id v6 = [v4 manifestHashWithReferenceIdentifier:v5];

    id v7 = [PKApplePayTrustSignatureRequest alloc];
    id v8 = [*(id *)(a1 + 40) nonce];
    uint64_t v9 = [(PKApplePayTrustSignatureRequest *)v7 initWithKeyIdentifier:@"com.apple.wallet.applepaytrust" manifestHash:v6 nonce:v8];

    __int16 v10 = [v3 signatureForRequest:v9 withAuthorization:*(void *)(a1 + 48)];
    [v3 invalidateSession];
    if (v10)
    {
      id v11 = [[PKAccountWebServiceApplePayTrustRequest alloc] initWithApplePayTrustProtocol:*(void *)(a1 + 32)];
      [(PKAccountWebServiceApplePayTrustRequest *)v11 setSignature:v10];
      uint64_t v12 = *(void *)(a1 + 64);
      id v13 = *(void **)(*(void *)(a1 + 56) + 32);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_374;
      v16[3] = &unk_1E56E1F30;
      objc_copyWeak(&v17, (id *)(a1 + 72));
      [v13 applePayTrustSignatureRequestWithRequest:v11 account:v12 completion:v16];
      objc_destroyWeak(&v17);
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_377;
      v14[3] = &unk_1E56DD818;
      objc_copyWeak(&v15, (id *)(a1 + 72));
      dispatch_async(MEMORY[0x1E4F14428], v14);
      objc_destroyWeak(&v15);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_7;
    block[3] = &unk_1E56DD818;
    objc_copyWeak(&v19, (id *)(a1 + 72));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v19);
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_7(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v3 = [WeakRetained state];
    if (v3 > 0x10 || ((1 << v3) & 0x1A000) == 0)
    {
      id v5 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315138;
        uint64_t v9 = "-[PKPaymentAuthorizationStateMachine _performAuthorizationWithParam:]_block_invoke_7";
        _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v8, 0xCu);
      }

      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
      id v7 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v6];
      [v2 _setState:14 param:v7];
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_374(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 authorizationToken];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_375;
  v5[3] = &unk_1E56D9150;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_375(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      unint64_t v3 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithInstallmentAuthorizationToken:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithInstallmentAuthorizationToken:");
      [v5 _setState:12 param:v3];
    }
    else
    {
      unint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
      id v4 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v3];
      [v5 _setState:14 param:v4];
    }
    id WeakRetained = v5;
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_377(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    unint64_t v2 = [WeakRetained state];
    BOOL v3 = v2 > 0x10;
    uint64_t v4 = 1 << v2;
    id WeakRetained = v9;
    uint64_t v5 = v4 & 0x1A000;
    if (v3 || v5 == 0)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
      int v8 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v7];
      [v9 _setState:14 param:v8];

      id WeakRetained = v9;
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_380(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 56) itemForType:3];
    id v7 = [v6 paymentApplication];
    char v18 = 0;
    int v8 = [*(id *)(*(void *)(a1 + 32) + 56) peerPaymentQuote];
    id v9 = [v5 authorizePeerPaymentQuote:v8 forPaymentApplication:v7 withAuthenticationCredential:*(void *)(a1 + 40) shouldReregister:&v18];

    if (a3) {
      [v5 invalidateSession];
    }
    if (v18)
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "SE Error: Handling NFCD shouldReregister error. Re-registering for peer payment, then retrying quote authorization request again.", buf, 2u);
      }

      id v11 = [*(id *)(*(void *)(a1 + 32) + 56) peerPaymentService];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_381;
      v14[3] = &unk_1E56D8928;
      id v16 = *(id *)(a1 + 48);
      id v15 = v9;
      [v11 registerDeviceWithForceReregister:1 completion:v14];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_382;
    block[3] = &unk_1E56DD818;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v13);
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_381(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Completed peer payment re-register with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_382(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2005 userInfo:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v4 = [WeakRetained state];
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      id v6 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v7];
      [v3 _setState:14 param:v6];
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_384(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_385;
  v4[3] = &unk_1E56E1FF8;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  unint64_t v2 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:v4];

  objc_destroyWeak(&v6);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_385(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 56) paymentRequest];
    id v5 = [v4 applePayTrustSignatureRequest];
    id v6 = [v3 signatureForRequest:v5 withAuthorization:*(void *)(a1 + 40)];
    [v3 invalidateSession];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_387;
    v8[3] = &unk_1E56D9150;
    objc_copyWeak(&v10, (id *)(a1 + 48));
    id v9 = v6;
    id v7 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_386;
    block[3] = &unk_1E56D9150;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    id v12 = 0;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v13);
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_386(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v4 = [WeakRetained state];
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      id v6 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315138;
        id v9 = "-[PKPaymentAuthorizationStateMachine _performAuthorizationWithParam:]_block_invoke_4";
        _os_log_error_impl(&dword_190E10000, v6, OS_LOG_TYPE_ERROR, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v8, 0xCu);
      }

      id v7 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithApplePayTrustSignature:*(void *)(a1 + 32)];
      [v3 _setState:12 param:v7];
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_387(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    unint64_t v3 = [WeakRetained state];
    BOOL v4 = v3 > 0x10;
    uint64_t v5 = 1 << v3;
    id WeakRetained = v10;
    uint64_t v6 = v5 & 0x1A000;
    if (v4 || v6 == 0)
    {
      if (*(void *)(a1 + 32))
      {
        int v8 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithApplePayTrustSignature:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithApplePayTrustSignature:");
        [v10 _setState:12 param:v8];
      }
      else
      {
        int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
        id v9 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v8];
        [v10 _setState:14 param:v9];
      }
      id WeakRetained = v10;
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_388(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = a1 + 9;
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  if (WeakRetained)
  {
    BOOL v4 = [a1[4] _paymentRequestPurpleTrustData];
    if (v4)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      id v12[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_389;
      void v12[3] = &unk_1E56E2020;
      objc_copyWeak(&v19, v2);
      id v13 = v4;
      id v14 = a1[5];
      id v5 = a1[6];
      id v6 = a1[4];
      id v15 = v5;
      id v16 = v6;
      id v17 = a1[7];
      id v18 = a1[8];
      id v7 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:v12];

      objc_destroyWeak(&v19);
    }
    else
    {
      int v8 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v21 = "-[PKPaymentAuthorizationStateMachine _performAuthorizationWithParam:]_block_invoke_2";
        _os_log_error_impl(&dword_190E10000, v8, OS_LOG_TYPE_ERROR, "Failed to get Apple Pay purple trust data for method: %s", buf, 0xCu);
      }

      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
      id v10 = a1[4];
      id v11 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v9];
      [v10 _setState:14 param:v11];
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_389(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = [[PKApplePayTrustSignatureRequest alloc] initWithKeyIdentifier:@"com.apple.wallet.applepaytrust" manifestHash:*(void *)(a1 + 32) nonce:*(void *)(a1 + 40)];
    id v5 = [v3 signatureForRequest:v4 withAuthorization:*(void *)(a1 + 48)];
    [v3 invalidateSession];
    if (v5)
    {
      id v6 = objc_alloc_init(PKWrappedPayment);
      id v7 = [v5 signatureData];
      [(PKWrappedPayment *)v6 setTransactionData:v7];

      int v8 = [*(id *)(*(void *)(a1 + 56) + 56) paymentRequest];
      id v9 = [v8 countryCode];
      [(PKWrappedPayment *)v6 setMerchantCountryCode:v9];

      id v10 = [*(id *)(a1 + 64) evaluationResponse];
      id v11 = [v10 kextBlacklistVersion];
      [(PKWrappedPayment *)v6 setKextBlacklistVersion:v11];

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      id v12[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_391;
      void v12[3] = &unk_1E56DD818;
      objc_copyWeak(&v13, (id *)(a1 + 80));
      dispatch_async(MEMORY[0x1E4F14428], v12);
      objc_destroyWeak(&v13);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_390;
    block[3] = &unk_1E56DD818;
    objc_copyWeak(&v15, (id *)(a1 + 80));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v15);
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_390(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v3 = [WeakRetained state];
    if (v3 > 0x10 || ((1 << v3) & 0x1A000) == 0)
    {
      id v5 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315138;
        id v9 = "-[PKPaymentAuthorizationStateMachine _performAuthorizationWithParam:]_block_invoke_2";
        _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v8, 0xCu);
      }

      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
      id v7 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v6];
      [v2 _setState:14 param:v7];
    }
  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_391(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    unint64_t v2 = [WeakRetained state];
    BOOL v3 = v2 > 0x10;
    uint64_t v4 = 1 << v2;
    id WeakRetained = v9;
    uint64_t v5 = v4 & 0x1A000;
    if (v3 || v5 == 0)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-2006 userInfo:0];
      int v8 = +[PKPaymentAuthorizationErrorStateParam paramWithError:v7];
      [v9 _setState:14 param:v8];

      id WeakRetained = v9;
    }
  }
}

uint64_t __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_393(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_395(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldSignPurpleTrustData
{
  unint64_t v2 = [(PKPaymentAuthorizationStateMachine *)self _paymentRequestPurpleTrustData];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_paymentRequestPurpleTrustData
{
  v23[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  uint64_t v4 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
  if (v4 && [(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 1)
  {
    uint64_t v5 = [(PKPayLaterFinancingController *)self->_financingController selectedFundingSource];
    if ([v5 type] != 2)
    {
LABEL_18:

      goto LABEL_19;
    }
    id v6 = [v5 accountPaymentFundingSource];
    id v7 = [v6 identifier];

    if (!v7)
    {
      int v8 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190E10000, v8, OS_LOG_TYPE_ERROR, "Error there is no bank identifier for the bank payment source", buf, 2u);
      }

      goto LABEL_18;
    }
  }
  else
  {
    if (![v3 isPayLaterPaymentRequest])
    {
LABEL_19:
      id v7 = 0;
      id v11 = 0;
      goto LABEL_20;
    }
    uint64_t v5 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:9];
    id v9 = [v5 bankAccountInformation];
    uint64_t v10 = [v9 identifier];
    if (!v10)
    {
      id v16 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190E10000, v16, OS_LOG_TYPE_ERROR, "Error there is no bank identifier for the bank payment source", buf, 2u);
      }

      goto LABEL_18;
    }
    id v7 = (void *)v10;
  }
  uint64_t v22 = @"bankIdentifier";
  v23[0] = v7;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  if (!v11)
  {
LABEL_20:
    id v15 = 0;
    goto LABEL_21;
  }
  id v19 = 0;
  id v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v11 options:0 error:&v19];
  id v13 = v19;
  id v14 = v13;
  if (!v12 || v13)
  {
    id v18 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v11;
      _os_log_error_impl(&dword_190E10000, v18, OS_LOG_TYPE_ERROR, "Error forming JSON for purple trust data %@", buf, 0xCu);
    }

    id v15 = 0;
  }
  else
  {
    id v15 = v12;
  }

LABEL_21:
  return v15;
}

- (id)_inAppSessionAuthorizationRequest
{
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  uint64_t v4 = [(PKPaymentAuthorizationDataModel *)self->_model itemForType:3];
  uint64_t v5 = [v4 paymentApplication];

  id v6 = [v3 currencyCode];
  id v7 = [v3 countryCode];
  int v8 = [v3 _transactionAmount];
  uint64_t v9 = [v3 merchantCapabilities];
  uint64_t v10 = [v3 supportedNetworks];
  id v11 = [(PKPaymentAuthorizationDataModel *)self->_model selectedFinancingOption];
  if (v11 && [(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 1)
  {
    id v12 = [(PKPayLaterFinancingController *)self->_financingController selectedFundingSource];
    uint64_t v13 = [v12 type];
    if (v13 == 2)
    {
      uint64_t v14 = 0;
    }
    else
    {
      if (v13 != 1)
      {
LABEL_8:
        id v15 = [v11 authAmount];
        uint64_t v24 = [v15 currency];

        id v16 = [v11 authAmount];
        uint64_t v17 = [v16 amount];

        uint64_t v9 = [v11 merchantCapabilities];
        uint64_t v18 = [v11 supportedRepaymentNetworks];

        uint64_t v10 = (void *)v18;
        int v8 = (void *)v17;
        id v6 = (void *)v24;
        goto LABEL_9;
      }
      uint64_t v14 = [v12 paymentApplication];
    }

    uint64_t v5 = (void *)v14;
    goto LABEL_8;
  }
LABEL_9:
  id v19 = objc_alloc_init(PKInAppPaymentSessionAuthorizationRequest);
  [(PKInAppPaymentSessionAuthorizationRequest *)v19 setPaymentApplication:v5];
  [(PKInAppPaymentSessionAuthorizationRequest *)v19 setCurrencyCode:v6];
  [(PKInAppPaymentSessionAuthorizationRequest *)v19 setCountryCode:v7];
  [(PKInAppPaymentSessionAuthorizationRequest *)v19 setTransactionAmount:v8];
  [(PKInAppPaymentSessionAuthorizationRequest *)v19 setMerchantCapabilities:v9];
  [(PKInAppPaymentSessionAuthorizationRequest *)v19 setSupportedNetworks:v10];
  id v20 = [v3 merchantIdentifier];
  [(PKInAppPaymentSessionAuthorizationRequest *)v19 setMerchantIdentifier:v20];

  uint64_t v21 = [v3 applicationData];
  [(PKInAppPaymentSessionAuthorizationRequest *)v19 setApplicationData:v21];

  uint64_t v22 = [v3 merchantSession];
  [(PKInAppPaymentSessionAuthorizationRequest *)v19 setMerchantSession:v22];

  return v19;
}

- (void)_applyShippingInformationToPayment:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  if ([v5 requestType] != 10)
  {
    id v6 = [v5 requiredShippingContactFields];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      int v8 = [v5 requiredShippingContactFields];
      int v9 = [v8 containsObject:@"email"];

      if (v9)
      {
        uint64_t v10 = [(PKPaymentAuthorizationDataModel *)self->_model shippingEmail];
        id v11 = [v10 emailAddresses];
        id v12 = [v11 firstObject];

        uint64_t v13 = (void *)MEMORY[0x1E4F1BA20];
        uint64_t v14 = [v12 value];
        id v15 = [v13 labeledValueWithLabel:@"Shipping" value:v14];
        v42[0] = v15;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
      }
      else
      {
        id v16 = 0;
      }
      uint64_t v17 = [v5 requiredShippingContactFields];
      int v18 = [v17 containsObject:@"phone"];

      if (v18)
      {
        id v19 = [(PKPaymentAuthorizationDataModel *)self->_model shippingPhone];
        id v20 = [v19 phoneNumbers];
        uint64_t v21 = [v20 firstObject];

        uint64_t v22 = (void *)MEMORY[0x1E4F1BA20];
        id v23 = [v21 value];
        uint64_t v24 = [v22 labeledValueWithLabel:@"Shipping" value:v23];
        uint64_t v41 = v24;
        id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      }
      else
      {
        id v25 = 0;
      }
      int v26 = [v5 isShippingEditable];
      id v27 = [v5 requiredShippingContactFields];
      int v28 = [v27 containsObject:@"post"];

      long long v29 = [v5 requiredShippingContactFields];
      int v30 = [v29 containsObject:@"name"];

      int v31 = v28 & v26;
      if (v28)
      {
        uint64_t v32 = [(PKPaymentAuthorizationDataModel *)self->_model shippingAddress];
        uint64_t v33 = [(PKPaymentAuthorizationDataModel *)self->_model shippingAddress];
      }
      else
      {
        uint64_t v32 = 0;
        uint64_t v33 = 0;
      }
      if (((v30 ^ 1 | v31) & 1) == 0)
      {
        uint64_t v34 = [(PKPaymentAuthorizationDataModel *)self->_model shippingName];

        uint64_t v33 = (void *)v34;
      }
      id v35 = (void *)MEMORY[0x1E4F1B8F8];
      __int16 v36 = [v33 nameComponents];
      id v37 = [v32 postalAddresses];
      id v38 = [v35 pkContactWithNameComponents:v36 postalAddresses:v37 emailAddresses:v16 phoneNumbers:v25];
      id v39 = [v38 sanitizedContact];

      id v40 = [[PKContact alloc] initWithCNContact:v39];
      [v4 setShippingContact:v40];
    }
  }
}

- (void)_applyShippingMethodToPayment:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPaymentAuthorizationDataModel *)self->_model shippingMethod];

  if (v4)
  {
    uint64_t v5 = [(PKPaymentAuthorizationDataModel *)self->_model shippingMethod];
    [v6 setShippingMethod:v5];
  }
}

- (void)_applyBillingInformationToPayment:(id)a3
{
  model = self->_model;
  id v5 = a3;
  id v7 = [(PKPaymentAuthorizationDataModel *)model paymentRequest];
  id v6 = [(PKPaymentAuthorizationStateMachine *)self _billingInformationFromPaymentRequest:v7];
  [v5 setBillingContact:v6];
}

- (void)_applyBillingInformationToAuthorizedQuote:(id)a3
{
  model = self->_model;
  id v5 = a3;
  id v7 = [(PKPaymentAuthorizationDataModel *)model paymentRequest];
  id v6 = [(PKPaymentAuthorizationStateMachine *)self _billingInformationFromPaymentRequest:v7];
  [v5 setContact:v6];
}

- (id)_billingInformationFromPaymentRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requiredBillingContactFields];
  uint64_t v6 = [v5 count];

  if ([v4 requestType] != 10)
  {
    if (!v6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = [v4 requiredBillingContactFields];
    int v11 = [v10 containsObject:@"post"];

    if (v11)
    {
      id v12 = [(PKPaymentAuthorizationDataModel *)self->_model billingAddress];
    }
    else
    {
      id v12 = 0;
    }
    if ([v4 requestType] == 10)
    {
      uint64_t v13 = [v12 nameComponents];
      uint64_t v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v20 = [(PKPaymentAuthorizationDataModel *)self->_model shippingName];
        id v15 = [v20 nameComponents];
      }
      uint64_t v21 = [v4 requiredShippingContactFields];
      int v22 = [v21 containsObject:@"email"];

      if (v22)
      {
        id v23 = [(PKPaymentAuthorizationDataModel *)self->_model shippingEmail];
        uint64_t v17 = [v23 emailAddresses];
      }
      else
      {
        uint64_t v17 = 0;
      }
      uint64_t v24 = [v4 requiredShippingContactFields];
      int v25 = [v24 containsObject:@"phone"];

      if (v25)
      {
        int v26 = [(PKPaymentAuthorizationDataModel *)self->_model shippingPhone];
        int v18 = [v26 phoneNumbers];
      }
      else
      {
        int v18 = 0;
      }
      id v27 = (void *)MEMORY[0x1E4F1B8F8];
      int v28 = [v12 postalAddresses];
      long long v29 = [v27 pkContactWithNameComponents:v15 postalAddresses:v28 emailAddresses:v17 phoneNumbers:v18];
      id v19 = [v29 sanitizedContact];
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F1B8F8];
      id v15 = [v12 nameComponents];
      uint64_t v17 = [v12 postalAddresses];
      int v18 = [v16 pkContactWithNameComponents:v15 postalAddresses:v17 emailAddresses:0 phoneNumbers:0];
      id v19 = [v18 sanitizedContact];
    }

    int v9 = [[PKContact alloc] initWithCNContact:v19];
    goto LABEL_21;
  }
  id v7 = [v4 requiredShippingContactFields];
  uint64_t v8 = [v7 count] | v6;

  if (v8) {
    goto LABEL_5;
  }
LABEL_3:
  int v9 = 0;
LABEL_21:

  return v9;
}

- (id)_transactionWithPaymentToken:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  uint64_t v6 = [v5 APIType];
  uint64_t v7 = v6;
  unint64_t v8 = v6 - 1;
  if ((unint64_t)(v6 - 1) >= 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 3;
  }
  if (!v6)
  {
    uint64_t v10 = [v5 merchantSession];

    if (v10) {
      uint64_t v9 = 3;
    }
  }
  int v11 = +[PKPaymentTransaction paymentTransactionWithSource:v9];
  [v11 setOriginatedByDevice:1];
  id v12 = [v4 transactionIdentifier];
  [v11 setPaymentHash:v12];

  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  [v11 setTransactionDate:v13];

  [v11 setTechnologyType:2];
  uint64_t v14 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
  [v11 setAmount:v14];

  id v15 = [(PKPaymentAuthorizationDataModel *)self->_model currencyCode];
  [v11 setCurrencyCode:v15];

  [v11 addUpdateReasons:2];
  if ([(PKPaymentAuthorizationDataModel *)self->_model fundingMode] == 2)
  {
    id v16 = [(PKPaymentAuthorizationDataModel *)self->_model selectedPaymentOffer];
    objc_msgSend(v11, "setIsIssuerInstallmentTransaction:", objc_msgSend(v16, "type") == 1);
  }
  else
  {
    [v11 setIsIssuerInstallmentTransaction:0];
  }
  uint64_t v17 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
  int v18 = [v17 dpanIdentifier];
  [v11 setDPANIdentifier:v18];

  objc_msgSend(v11, "setPaymentNetworkIdentifier:", objc_msgSend(v17, "paymentNetworkIdentifier"));
  id v19 = objc_alloc_init(PKMerchant);
  id v20 = [(PKPaymentAuthorizationDataModel *)self->_model merchantName];
  [(PKMerchant *)v19 setName:v20];

  if (v8 >= 2)
  {
    if (!v7)
    {
      unint64_t v27 = [(PKPaymentAuthorizationStateMachine *)self _adamIdentifier];
      if (v27) {
        [(PKMerchant *)v19 setAdamIdentifier:v27];
      }
    }
  }
  else
  {
    uint64_t v21 = [v5 merchantSession];
    int v22 = [v21 merchantIdentifier];
    [(PKMerchant *)v19 setWebMerchantIdentifier:v22];

    id v23 = [v21 displayName];
    [(PKMerchant *)v19 setWebMerchantName:v23];

    uint64_t v24 = (void *)MEMORY[0x1E4F1CB10];
    int v25 = [v21 domain];
    int v26 = [v24 URLWithString:v25];
    [(PKMerchant *)v19 setOriginURL:v26];
  }
  [v11 setMerchant:v19];

  return v11;
}

- (unint64_t)_adamIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentRequest];
  if (![v3 APIType])
  {
    id v5 = [(PKPaymentAuthorizationDataModel *)self->_model hostApplicationIdentifier];
    uint64_t v6 = [v5 rangeOfString:@"."];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v8 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v5;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "No bundle ID in app identifier %@", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      unint64_t v8 = [v5 substringFromIndex:v6 + v7];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];
      uint64_t v10 = [v9 iTunesMetadata];
      unint64_t v4 = [v10 storeItemIdentifier];

      if (v4)
      {

LABEL_12:
        goto LABEL_13;
      }
      int v11 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v8;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "No item ID for %@", (uint8_t *)&v13, 0xCu);
      }
    }
    unint64_t v4 = 0;
    goto LABEL_12;
  }
  unint64_t v4 = 0;
LABEL_13:

  return v4;
}

- (id)_transactionWithPurchase:(id)a3 paymentHash:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[PKPaymentTransaction paymentTransactionWithSource:2];
  [v6 setOriginatedByDevice:1];
  [v6 setPaymentHash:v5];

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v6 setTransactionDate:v7];

  [v6 setTechnologyType:2];
  unint64_t v8 = [(PKPaymentAuthorizationDataModel *)self->_model transactionAmount];
  [v6 setAmount:v8];

  uint64_t v9 = [(PKPaymentAuthorizationDataModel *)self->_model currencyCode];
  [v6 setCurrencyCode:v9];

  [v6 addUpdateReasons:2];
  uint64_t v10 = objc_alloc_init(PKMerchant);
  int v11 = [(PKPaymentAuthorizationDataModel *)self->_model merchantName];
  [(PKMerchant *)v10 setName:v11];

  [v6 setMerchant:v10];
  return v6;
}

- (void)_promptTapToRadar
{
  if (os_variant_has_internal_ui() && self->_paymentService && self->_failureStatusCount == 2)
  {
    uint64_t v9 = objc_alloc_init(PKTapToRadarRequest);
    BOOL v3 = NSString;
    unint64_t v4 = [(PKPaymentAuthorizationDataModel *)self->_model merchantName];
    id v5 = [v3 stringWithFormat:@"Apple Pay failed in %@", v4];
    [(PKTapToRadarRequest *)v9 setReason:v5];

    uint64_t v6 = NSString;
    uint64_t v7 = [(PKPaymentAuthorizationDataModel *)self->_model merchantName];
    unint64_t v8 = [v6 stringWithFormat:@"Apple Pay failure detected in %@", v7];
    [(PKTapToRadarRequest *)v9 setAlertHeader:v8];

    [(PKTapToRadarRequest *)v9 setAlertMessage:@"Help improve Apple Pay by reporting this problem."];
    [(PKPaymentService *)self->_paymentService displayTapToRadarAlertForRequest:v9 completion:0];
  }
}

- (void)_reportToAutoBugCapture:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_ui() && self->_failureStatusCount == 1)
  {
    unint64_t v4 = objc_alloc_init(PKAutoBugCaptureReporter);
    [(PKAutoBugCaptureReporter *)v4 reportIssueWithDomain:@"Wallet" type:@"PKPaymentAuthorization" subtype:@"StatusFailure" subtypeContext:v5 payload:0];
  }
}

- (void)_simulatePayment
{
  BOOL v3 = [(PKPaymentAuthorizationDataModel *)self->_model paymentApplication];
  unint64_t v4 = PKPaymentNetworkNameForPaymentCredentialType([v3 paymentNetworkIdentifier]);

  id v5 = +[PKPaymentToken simulatedTokenForNetwork:v4];
  objc_initWeak(&location, self);
  uint32_t v6 = arc4random_uniform(0xAu);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)((1.0 / (double)(v6 + 1) + 1.0) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentAuthorizationStateMachine__simulatePayment__block_invoke;
  block[3] = &unk_1E56D9150;
  objc_copyWeak(&v11, &location);
  id v10 = v5;
  id v8 = v5;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__PKPaymentAuthorizationStateMachine__simulatePayment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v2 = +[PKPaymentAuthorizationAuthorizedStateParam paramWithPaymentToken:*(void *)(a1 + 32) rewrapResponse:0];
  [WeakRetained _setState:12 param:v2];
}

- (id)_relevantAnalyticsSubject
{
  return @"inApp";
}

- (id)_additionalRelevantAnalyticsDictionary
{
  return 0;
}

- (void)_reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:(id)a3 eventType:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v8 addObject:@"inApp"];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 addEntriesFromDictionary:v6];
  id v10 = [(PKPaymentAuthorizationStateMachine *)self _additionalRelevantAnalyticsDictionary];
  [v9 addEntriesFromDictionary:v10];

  [v9 setObject:v7 forKey:@"eventType"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), v9, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)_trackCouponCodeOutcomeWithError:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v9 = [(PKPaymentAuthorizationDataModel *)self->_model couponCode];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      uint64_t v24 = @"eventType";
      v25[0] = @"couponCodeValid";
      id v11 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v12 = (__CFString **)v25;
      uint64_t v13 = &v24;
    }
    else
    {
      int v22 = @"eventType";
      id v23 = @"couponCodeCannotBeApplied";
      id v11 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v12 = &v23;
      uint64_t v13 = &v22;
    }
    uint64_t v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
    +[PKAnalyticsReporter subject:@"inApp" sendEvent:v15];
    goto LABEL_13;
  }
  id v6 = [v4 domain];
  int v7 = [v6 isEqualToString:@"PKPaymentErrorDomain"];

  if (v7)
  {
    if ([v5 code] == 5)
    {
      id v8 = PKAnalyticsReportEventTypeCouponCodeOutcomeExpired;
    }
    else
    {
      if ([v5 code] != 4) {
        goto LABEL_14;
      }
      id v8 = PKAnalyticsReportEventTypeCouponCodeOutcomeInvalid;
    }
    uint64_t v14 = *v8;
    if (v14)
    {
      uint64_t v15 = v14;
      long long v16 = [v5 userInfo];
      long long v17 = [v16 PKStringForKey:*MEMORY[0x1E4F28568]];

      v21[0] = v15;
      v20[0] = @"eventType";
      v20[1] = @"couponCodeErrorMerchantProvided";
      long long v18 = PKAnalyticsReportSwitchToggleResultValue([v17 length] != 0);
      v21[1] = v18;
      long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      +[PKAnalyticsReporter subject:@"inApp" sendEvent:v19];

LABEL_13:
    }
  }
LABEL_14:
}

- (PKPaymentService)paymentService
{
  return self->_paymentService;
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (PKPaymentAuthorizationDataModel)model
{
  return self->_model;
}

- (PKAggregateDictionaryProtocol)aggregateDictionary
{
  return self->_aggregateDictionary;
}

- (void)setAggregateDictionary:(id)a3
{
}

- (PKInAppPaymentSession)inAppPaymentSession
{
  return self->_inAppPaymentSession;
}

- (void)setInAppPaymentSession:(id)a3
{
}

- (PKPeerPaymentSession)peerPaymentSession
{
  return self->_peerPaymentSession;
}

- (void)setPeerPaymentSession:(id)a3
{
}

- (PKContinuityPaymentService)continuityPaymentService
{
  return self->_continuityPaymentService;
}

- (void)setContinuityPaymentService:(id)a3
{
}

- (double)updatePaymentDeviceTimeout
{
  return self->_updatePaymentDeviceTimeout;
}

- (PKPaymentAuthorizationStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPaymentAuthorizationStateMachineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (int64_t)cancelReason
{
  return self->_cancelReason;
}

- (BOOL)showingExternalPasswordEntry
{
  return self->_showingExternalPasswordEntry;
}

- (void)setShowingExternalPasswordEntry:(BOOL)a3
{
  self->_showingExternalPasswordEntry = a3;
}

- (PKContinuityPaymentCoordinator)continuityPaymentCoordinator
{
  return self->_continuityPaymentCoordinator;
}

- (void)setContinuityPaymentCoordinator:(id)a3
{
}

- (PKPayLaterFinancingController)financingController
{
  return self->_financingController;
}

- (void)setFinancingController:(id)a3
{
}

- (NSMutableArray)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (unint64_t)hostApplicationState
{
  return self->_hostApplicationState;
}

- (void)setHostApplicationState:(unint64_t)a3
{
  self->_unint64_t hostApplicationState = a3;
}

- (BOOL)hasReceivedRemoteDeviceUpdate
{
  return self->_hasReceivedRemoteDeviceUpdate;
}

- (void)setHasReceivedRemoteDeviceUpdate:(BOOL)a3
{
  self->_hasReceivedRemoteDeviceUpdate = a3;
}

- (BOOL)awaitingClientCallbackReply
{
  return self->_awaitingClientCallbackReply;
}

- (void)setAwaitingClientCallbackReply:(BOOL)a3
{
  self->_awaitingClientCallbackReply = a3;
}

- (OS_dispatch_source)clientCallbackTimer
{
  return self->_clientCallbackTimer;
}

- (void)setClientCallbackTimer:(id)a3
{
}

- (PKPaymentAuthorizationClientCallbackStateParam)mostRecentClientCallback
{
  return self->_mostRecentClientCallback;
}

- (void)setMostRecentClientCallback:(id)a3
{
}

- (BOOL)awaitingWebServiceResponse
{
  return self->_awaitingWebServiceResponse;
}

- (void)setAwaitingWebServiceResponse:(BOOL)a3
{
  self->_awaitingWebServiceResponse = a3;
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
}

- (unint64_t)prepareTransactionDetailsCounter
{
  return self->_prepareTransactionDetailsCounter;
}

- (void)setPrepareTransactionDetailsCounter:(unint64_t)a3
{
  self->_prepareTransactionDetailsCounter = a3;
}

- (BOOL)detectedBluetoothOn
{
  return self->_detectedBluetoothOn;
}

- (void)setDetectedBluetoothOn:(BOOL)a3
{
  self->_detectedBluetoothOn = a3;
}

- (OS_dispatch_group)delayAuthorizedStateGroup
{
  return self->_delayAuthorizedStateGroup;
}

- (void)setDelayAuthorizedStateGroup:(id)a3
{
}

- (NSArray)remoteDevicesToUpdate
{
  return self->_remoteDevicesToUpdate;
}

- (void)setRemoteDevicesToUpdate:(id)a3
{
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (PKODITransactionAssessment)odiTransactionAssessment
{
  return self->_odiTransactionAssessment;
}

- (void)setOdiTransactionAssessment:(id)a3
{
}

- (PKODIServiceProviderAssessment)odiServiceProviderAssessment
{
  return self->_odiServiceProviderAssessment;
}

- (void)setOdiServiceProviderAssessment:(id)a3
{
}

- (BOOL)odiAssessmentInFlight
{
  return self->_odiAssessmentInFlight;
}

- (void)setOdiAssessmentInFlight:(BOOL)a3
{
  self->_odiAssessmentInFlight = a3;
}

- (PKAccountEnhancedMerchantsFetcher)enhancedMerchantsFetcher
{
  return self->_enhancedMerchantsFetcher;
}

- (void)setEnhancedMerchantsFetcher:(id)a3
{
}

- (NSUUID)enhancedMerchantsFetcherUpdateToken
{
  return self->_enhancedMerchantsFetcherUpdateToken;
}

- (void)setEnhancedMerchantsFetcherUpdateToken:(id)a3
{
}

- (PKAccount)appleCardAccount
{
  return self->_appleCardAccount;
}

- (void)setAppleCardAccount:(id)a3
{
}

- (unint64_t)failureStatusCount
{
  return self->_failureStatusCount;
}

- (void)setFailureStatusCount:(unint64_t)a3
{
  self->_failureStatusCount = a3;
}

- (void)setPaymentSheetExperiment:(id)a3
{
}

- (PKPaymentOffersController)paymentOffersController
{
  return self->_paymentOffersController;
}

- (void)setPaymentOffersController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentOffersController, 0);
  objc_storeStrong((id *)&self->_paymentSheetExperiment, 0);
  objc_storeStrong((id *)&self->_appleCardAccount, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcherUpdateToken, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcher, 0);
  objc_storeStrong((id *)&self->_odiServiceProviderAssessment, 0);
  objc_storeStrong((id *)&self->_odiTransactionAssessment, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_remoteDevicesToUpdate, 0);
  objc_storeStrong((id *)&self->_delayAuthorizedStateGroup, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_mostRecentClientCallback, 0);
  objc_storeStrong((id *)&self->_clientCallbackTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_financingController, 0);
  objc_storeStrong((id *)&self->_continuityPaymentCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_continuityPaymentService, 0);
  objc_storeStrong((id *)&self->_peerPaymentSession, 0);
  objc_storeStrong((id *)&self->_inAppPaymentSession, 0);
  objc_storeStrong((id *)&self->_aggregateDictionary, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_bluetoothMonitor, 0);
}

@end