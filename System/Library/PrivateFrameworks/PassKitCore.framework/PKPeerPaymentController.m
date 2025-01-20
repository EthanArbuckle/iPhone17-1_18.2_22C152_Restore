@interface PKPeerPaymentController
+ (BOOL)errorIsIdentityVerificationRequiredError:(id)a3;
+ (BOOL)errorIsTermsAcceptanceRequiredError:(id)a3;
+ (id)_displayNameForRecipientAddress:(id)a3 contactResolver:(id)a4 foundInContacts:(BOOL *)a5;
+ (id)_displayableErrorOverrideForUnderlyingError:(id)a3;
+ (id)_paymentNotCompletedErrorWithError:(id)a3;
+ (id)_peerPaymentPassURL;
+ (id)displayNameForAddress:(id)a3 contactResolver:(id)a4;
+ (id)displayableErrorForError:(id)a3;
+ (unint64_t)proposedResolutionForError:(id)a3;
+ (void)_sendAuthorizedQuoteAnalyticsWithSuccess:(BOOL)a3 mode:(unint64_t)a4 authorizedQuote:(id)a5 status:(int64_t)a6;
+ (void)performNearbyAuthorizedQuote:(id)a3 completion:(id)a4;
- (BOOL)_contactInfoIsValidForAuthorizedQuote:(id)a3 errors:(id *)a4;
- (BOOL)_ensureState:(unint64_t)a3;
- (BOOL)_modeIsSendType:(unint64_t)a3;
- (BOOL)_modeSupportsExternalFundingSource:(unint64_t)a3;
- (BOOL)restoreStateWithExternalizedControllerState:(id)a3;
- (NSString)description;
- (NSString)recipientDisplayName;
- (NSString)recipientPhoneOrEmail;
- (NSString)senderPhoneOrEmail;
- (PKPaymentPass)peerPaymentPass;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentController)init;
- (PKPeerPaymentController)initWithPeerPaymentWebService:(id)a3;
- (PKPeerPaymentController)initWithPeerPaymentWebService:(id)a3 queue:(id)a4;
- (PKPeerPaymentControllerDelegate)delegate;
- (PKPeerPaymentPerformResponse)performQuoteResponse;
- (PKPeerPaymentQuote)quote;
- (PKPeerPaymentRecipient)recipient;
- (PKPeerPaymentRequestToken)requestToken;
- (PKPeerPaymentWebService)webService;
- (id)_contactResolver;
- (id)_defaultAlternateFundingSourceForMode:(unint64_t)a3;
- (id)_featureDescriptorForMode:(unint64_t)a3;
- (id)analyticsSessionSubjectForPaymentAuthorizationCoordinator:(id)a3;
- (id)analyticsSessionTokenForPaymentAuthorizationCoordinator:(id)a3;
- (id)contactForHandle:(id)a3;
- (id)displayNameForRecipientAddress:(id)a3;
- (id)displayNameForRecipientAddress:(id)a3 foundInContacts:(BOOL *)a4;
- (id)displayableErrorForError:(id)a3;
- (id)externalizedControllerState;
- (id)internalState;
- (id)presentationSceneBundleIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (id)summaryItemsForQuote:(id)a3;
- (unint64_t)mode;
- (unint64_t)state;
- (void)_handleAccountChanged:(id)a3;
- (void)_performAuthorizedQuote:(id)a3 completion:(id)a4;
- (void)_refreshRecipientWithCompletion:(id)a3;
- (void)_requestQuoteWithRequest:(id)a3 withCompletion:(id)a4;
- (void)_resetToState:(unint64_t)a3;
- (void)_sendAnalyticsForQuote:(id)a3 withRequest:(id)a4;
- (void)_setPerformQuoteSuccess:(BOOL)a3;
- (void)_setState:(unint64_t)a3 notify:(BOOL)a4;
- (void)_updateLastUsedAlternateFundingSource;
- (void)authorizeQuote:(id)a3 performOnAuthorization:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)formalRequestTokenForAmount:(id)a3 completion:(id)a4;
- (void)formalRequestTokenForAmount:(id)a3 source:(unint64_t)a4 completion:(id)a5;
- (void)handleIdentityVerificationWithError:(id)a3 completion:(id)a4;
- (void)handleTermsAcceptanceRequiredWithError:(id)a3 completion:(id)a4;
- (void)identifyRecipientDebitCardWithCompletion:(id)a3;
- (void)identifyRecipientSelf;
- (void)identifyRecipientWithAddress:(id)a3 completion:(id)a4;
- (void)identifyRecipientWithAddress:(id)a3 senderAddress:(id)a4 completion:(id)a5;
- (void)identifyRecipientWithRoutingNumber:(id)a3 accountNumber:(id)a4 accountName:(id)a5 completion:(id)a6;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePeerPaymentQuote:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)pendingRequestsWithCompletion:(id)a3;
- (void)performAction:(id)a3 withPaymentIdentifier:(id)a4 completion:(id)a5;
- (void)performPendingRequestAction:(id)a3 withRequestToken:(id)a4 completion:(id)a5;
- (void)performQuote:(id)a3 completion:(id)a4;
- (void)performQuoteWithCompletion:(id)a3;
- (void)quoteWithAmount:(id)a3 completion:(id)a4;
- (void)quoteWithAmount:(id)a3 requestToken:(id)a4 alternateFundingSource:(id)a5 completion:(id)a6;
- (void)quoteWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5;
- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 completion:(id)a5;
- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 alternateFundingSource:(id)a6 completion:(id)a7;
- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 alternateFundingSource:(id)a6 preserveCurrentBalance:(unint64_t)a7 recurringPaymentIdentifier:(id)a8 frequency:(unint64_t)a9 startDate:(id)a10 threshold:(id)a11 completion:(id)a12;
- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 completion:(id)a6;
- (void)requestTokenForAmount:(id)a3 completion:(id)a4;
- (void)reset;
- (void)selectMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)statusForPaymentIdentifier:(id)a3 withCompletion:(id)a4;
- (void)updatePreservePeerPaymentBalanceSetting:(BOOL)a3;
@end

@implementation PKPeerPaymentController

- (PKPeerPaymentController)init
{
  return 0;
}

- (PKPeerPaymentController)initWithPeerPaymentWebService:(id)a3
{
  return [(PKPeerPaymentController *)self initWithPeerPaymentWebService:a3 queue:0];
}

- (PKPeerPaymentController)initWithPeerPaymentWebService:(id)a3 queue:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (PKUseMockSURFServer() && (uint64_t v9 = objc_opt_class(), v9 == objc_opt_class()))
  {
    v27 = [[PKMockPeerPaymentController alloc] initWithPeerPaymentWebService:v7];
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PKPeerPaymentController;
    v10 = [(PKPeerPaymentController *)&v30 init];
    if (v10)
    {
      v11 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v32 = v10;
        __int16 v33 = 2112;
        id v34 = v7;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: %p initWithPeerPaymentWebService: %@", buf, 0x16u);
      }

      if (v8)
      {
        v12 = (OS_dispatch_queue *)v8;
        queue = v10->_queue;
        v10->_queue = v12;
      }
      else
      {
        v14 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
        id v15 = MEMORY[0x1E4F14428];
        queue = v10->_queue;
        v10->_queue = v14;
      }

      v16 = objc_alloc_init(PKPeerPaymentControllerInternalState);
      is = v10->_is;
      v10->_is = v16;

      objc_storeStrong((id *)&v10->_webService, a3);
      v10->_is->state = 1;
      v10->_is->mode = 0;
      v18 = [(PKPeerPaymentWebService *)v10->_webService peerPaymentService];
      v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 addObserver:v10 selector:sel__handleAccountChanged_ name:@"PKPeerPaymentServiceAccountChangedNotification" object:v18];

      uint64_t v20 = [v18 account];
      account = v10->_account;
      v10->_account = (PKPeerPaymentAccount *)v20;

      v22 = +[PKPassLibrary sharedInstance];
      v23 = [(PKPeerPaymentAccount *)v10->_account associatedPassUniqueID];
      v24 = [v22 passWithUniqueID:v23];
      uint64_t v25 = [v24 paymentPass];
      peerPaymentPass = v10->_peerPaymentPass;
      v10->_peerPaymentPass = (PKPaymentPass *)v25;

      v10->_is->supportsPreserveCurrentBalance = [(PKPeerPaymentAccount *)v10->_account supportsPreserveCurrentBalance];
    }
    v27 = v10;
    self = &v27->super;
  }
  p_super = &v27->super;

  return p_super;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentController;
  [(PKPeerPaymentController *)&v4 dealloc];
}

- (void)_setState:(unint64_t)a3 notify:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_is->state;
  if (state != a3)
  {
    BOOL v5 = a4;
    id v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (state - 1 > 6) {
        uint64_t v9 = @"Unknown";
      }
      else {
        uint64_t v9 = off_1E56E72C0[state - 1];
      }
      if (a3 - 1 > 6) {
        v10 = @"Unknown";
      }
      else {
        v10 = off_1E56E72C0[a3 - 1];
      }
      v11 = @"NO";
      int v13 = 134218754;
      v14 = self;
      if (v5) {
        v11 = @"YES";
      }
      __int16 v15 = 2114;
      v16 = v9;
      __int16 v17 = 2114;
      v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Changed state. From %{public}@ -> %{public}@. (shouldNotify: %{public}@)", (uint8_t *)&v13, 0x2Au);
    }

    self->_is->unint64_t state = a3;
    if (v5)
    {
      v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 postNotificationName:PKPeerPaymentControllerStateDidChangeNotification object:self];
    }
  }
}

- (BOOL)_ensureState:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_is->state;
  if (state != a3)
  {
    if (a3 - 1 > 6) {
      BOOL v5 = @"Unknown";
    }
    else {
      BOOL v5 = off_1E56E72C0[a3 - 1];
    }
    if (state - 1 > 6) {
      v6 = @"Unknown";
    }
    else {
      v6 = off_1E56E72C0[state - 1];
    }
    id v7 = [NSString stringWithFormat:@"PKPeerPaymentController: Error: Invalid state detected. (Expected: %@, Actual: %@)", v5, v6];
    id v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@", v7 format];
  }
  return state == a3;
}

- (void)reset
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    BOOL v5 = self;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Reset called.", (uint8_t *)&v4, 0xCu);
  }

  [(PKPeerPaymentController *)self _resetToState:1];
}

- (void)_resetToState:(unint64_t)a3
{
  is = self->_is;
  if (is->state != a3)
  {
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
        recipient = is->recipient;
        is->recipient = 0;

        id v7 = self->_is;
        recipientPhoneOrEmail = v7->recipientPhoneOrEmail;
        v7->recipientPhoneOrEmail = 0;

        uint64_t v9 = self->_is;
        recipientDisplayName = v9->recipientDisplayName;
        v9->recipientDisplayName = 0;

        v11 = self->_is;
        accountNumber = v11->accountNumber;
        v11->accountNumber = 0;

        int v13 = self->_is;
        routingNumber = v13->routingNumber;
        v13->routingNumber = 0;

        __int16 v15 = self->_is;
        accountName = v15->accountName;
        v15->accountName = 0;

        __int16 v17 = self->_is;
        quoteCertificatesResponse = v17->quoteCertificatesResponse;
        v17->quoteCertificatesResponse = 0;

        is = self->_is;
        goto LABEL_4;
      case 2uLL:
LABEL_4:
        is->mode = 0;
        is = self->_is;
        goto LABEL_5;
      case 3uLL:
        goto LABEL_6;
      case 4uLL:
        goto LABEL_7;
      case 5uLL:
        goto LABEL_8;
      case 6uLL:
LABEL_5:
        requestToken = is->requestToken;
        is->requestToken = 0;

        is = self->_is;
LABEL_6:
        quote = is->quote;
        is->quote = 0;

        uint64_t v21 = self->_is;
        quoteRequest = v21->quoteRequest;
        v21->quoteRequest = 0;

        v23 = self->_is;
        recurringPaymentIdentifier = v23->recurringPaymentIdentifier;
        v23->recurringPaymentIdentifier = 0;

        uint64_t v25 = self->_is;
        startDate = v25->startDate;
        v25->startDate = 0;

        self->_is->frequency = 0;
        v27 = self->_is;
        threshold = v27->threshold;
        v27->threshold = 0;

LABEL_7:
        self->_quoteAuthorizationSuccess = 0;
        quoteAuthorizationError = self->_quoteAuthorizationError;
        self->_quoteAuthorizationError = 0;

        [(PKPaymentAuthorizationCoordinator *)self->_quoteAuthorizationCoordinator dismissWithCompletion:0];
        quoteAuthorizationCoordinator = self->_quoteAuthorizationCoordinator;
        self->_quoteAuthorizationCoordinator = 0;

        self->_performOnAuthorization = 0;
        is = self->_is;
LABEL_8:
        performQuoteResponse = is->performQuoteResponse;
        is->performQuoteResponse = 0;

        self->_performQuoteSuccess = 0;
        performQuoteError = self->_performQuoteError;
        self->_performQuoteError = 0;

        break;
      default:
        break;
    }
    [(PKPeerPaymentController *)self _setState:a3 notify:1];
  }
}

- (id)externalizedControllerState
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_is requiringSecureCoding:1 error:0];
}

- (BOOL)restoreStateWithExternalizedControllerState:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_13;
  }
  id v19 = 0;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:&v19];
  id v6 = v19;
  id v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = *MEMORY[0x1E4F284E8];
      id v18 = 0;
      id v8 = [v5 decodeTopLevelObjectOfClass:v16 forKey:v17 error:&v18];
      id v7 = v18;
      [v5 finishDecoding];
      if (!v7) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
    [v5 finishDecoding];
  }
  id v8 = 0;
LABEL_6:
  uint64_t v9 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Failed to init unarchiver with peer payment controller state data: %@ %@.", buf, 0x20u);
  }

LABEL_9:
  if (!v8)
  {
LABEL_13:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  [(PKPeerPaymentController *)self reset];
  is = self->_is;
  self->_is = v8;
  v11 = v8;

  uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:PKPeerPaymentControllerStateDidChangeNotification object:self];

  int v13 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = self;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Successfully restored controller state.", buf, 0xCu);
  }

  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (unint64_t)state
{
  return self->_is->state;
}

- (unint64_t)mode
{
  return self->_is->mode;
}

- (NSString)senderPhoneOrEmail
{
  return self->_is->senderPhoneOrEmail;
}

- (NSString)recipientPhoneOrEmail
{
  return self->_is->recipientPhoneOrEmail;
}

- (PKPeerPaymentRecipient)recipient
{
  return self->_is->recipient;
}

- (NSString)recipientDisplayName
{
  is = self->_is;
  recipientDisplayName = is->recipientDisplayName;
  if (!recipientDisplayName)
  {
    if (is->recipientPhoneOrEmail)
    {
      BOOL v5 = -[PKPeerPaymentController displayNameForRecipientAddress:](self, "displayNameForRecipientAddress:");
      uint64_t v6 = [v5 copy];
      id v7 = self->_is;
      id v8 = v7->recipientDisplayName;
      v7->recipientDisplayName = (NSString *)v6;

      recipientDisplayName = self->_is->recipientDisplayName;
    }
    else
    {
      recipientDisplayName = 0;
    }
  }
  return recipientDisplayName;
}

- (PKPeerPaymentRequestToken)requestToken
{
  return self->_is->requestToken;
}

- (PKPeerPaymentQuote)quote
{
  return self->_is->quote;
}

- (PKPeerPaymentPerformResponse)performQuoteResponse
{
  return self->_is->performQuoteResponse;
}

- (void)identifyRecipientWithAddress:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: identifyRecipientWithAddress: %@ senderAddress: %@ called.", buf, 0x20u);
  }

  if ([(PKPeerPaymentController *)self _ensureState:1])
  {
    if (v8)
    {
      uint64_t v12 = dispatch_get_global_queue(2, 0);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __81__PKPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke;
      v13[3] = &unk_1E56D8BA8;
      id v14 = v8;
      __int16 v15 = self;
      id v16 = v9;
      id v17 = v10;
      dispatch_async(v12, v13);
    }
    else
    {
      (*((void (**)(id, uint64_t, void, void))v10 + 2))(v10, 2, 0, 0);
    }
  }
}

void __81__PKPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = +[PKPeerPaymentRecipientCache sharedCache];
  v3 = [v2 recipientForRecipientAddress:*(void *)(a1 + 32)];

  id v4 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v6;
      __int16 v31 = 2112;
      v32 = v3;
      __int16 v33 = 2112;
      uint64_t v34 = v7;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Found a cached recipient: %@ for address: %@.", buf, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
    uint64_t v8 = [*(id *)(a1 + 32) copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    uint64_t v11 = [*(id *)(a1 + 48) copy];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    int v13 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v11;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setPhoneOrEmail:*(void *)(a1 + 32)];
    id v14 = *(void **)(a1 + 40);
    __int16 v15 = *(void **)(v14[1] + 40);
    id v16 = [v14 recipientDisplayName];
    [v15 setDisplayName:v16];

    id v17 = *(void **)(a1 + 40);
    if (*(void *)(v17[1] + 8) == 1) {
      [v17 _setState:2 notify:1];
    }
    uint64_t v18 = *(void *)(a1 + 56);
    if (v18) {
      (*(void (**)(uint64_t, uint64_t, void *, void))(v18 + 16))(v18, [v3 status], v3, 0);
    }
  }
  else
  {
    if (v5)
    {
      __int16 v20 = *(void **)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Failed to find a cached recipient for address: %@. Attempting remote lookup request.", buf, 0x16u);
    }

    __int16 v22 = *(void **)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 40);
    id v23 = *(void **)(v21 + 128);
    uint64_t v24 = *(void *)(a1 + 48);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __81__PKPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke_56;
    v25[3] = &unk_1E56E6FB0;
    v25[4] = v21;
    id v26 = v22;
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    [v23 peerPaymentRecipientForRecipientAddress:v26 senderAddress:v24 source:1 completion:v25];
  }
}

void __81__PKPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 recipient];
  uint64_t v7 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 || !v6)
  {
    if (v8)
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void **)(a1 + 40);
      int v27 = 134218498;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Remote recipient lookup failed for address: %@ with error: %@.", (uint8_t *)&v27, 0x20u);
    }

    uint64_t v25 = *(void *)(a1 + 56);
    if (v25)
    {
      id v26 = [*(id *)(a1 + 32) displayableErrorForError:v5];
      (*(void (**)(uint64_t, void, void, void *))(v25 + 16))(v25, 0, 0, v26);
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(a1 + 40);
      int v27 = 134218498;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      uint64_t v30 = v6;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Remote recipient lookup succeeded with recipient: %@ for address: %@.", (uint8_t *)&v27, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
    uint64_t v11 = [*(id *)(a1 + 40) copy];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    int v13 = *(void **)(v12 + 32);
    *(void *)(v12 + 32) = v11;

    uint64_t v14 = [*(id *)(a1 + 48) copy];
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    id v16 = *(void **)(v15 + 24);
    *(void *)(v15 + 24) = v14;

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPhoneOrEmail:*(void *)(a1 + 40)];
    id v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(void **)(v17[1] + 40);
    uint64_t v19 = [v17 recipientDisplayName];
    [v18 setDisplayName:v19];

    __int16 v20 = +[PKPeerPaymentRecipientCache sharedCache];
    [v20 cacheRecipient:v6 forRecipientAddress:*(void *)(a1 + 40)];

    uint64_t v21 = *(void **)(a1 + 32);
    if (*(void *)(v21[1] + 8) == 1) {
      [v21 _setState:2 notify:1];
    }
    uint64_t v22 = *(void *)(a1 + 56);
    if (v22) {
      (*(void (**)(uint64_t, uint64_t, void *, void))(v22 + 16))(v22, [v6 status], v6, 0);
    }
  }
}

- (void)_refreshRecipientWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  recipientPhoneOrEmail = self->_is->recipientPhoneOrEmail;
  uint64_t v6 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (recipientPhoneOrEmail)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218242;
      id v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = recipientPhoneOrEmail;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Refreshing recipient %@.", buf, 0x16u);
    }

    BOOL v8 = +[PKPeerPaymentRecipientCache sharedCache];
    [v8 purgeRecipientWithRecipientAddress:self->_is->recipientPhoneOrEmail];

    webService = self->_webService;
    is = self->_is;
    senderPhoneOrEmail = is->senderPhoneOrEmail;
    uint64_t v11 = is->recipientPhoneOrEmail;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__PKPeerPaymentController__refreshRecipientWithCompletion___block_invoke;
    v14[3] = &unk_1E56E6FD8;
    v14[4] = self;
    id v15 = v4;
    [(PKPeerPaymentWebService *)webService peerPaymentRecipientForRecipientAddress:v11 senderAddress:senderPhoneOrEmail source:1 completion:v14];
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      id v17 = self;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Asked to refresh a nil recipientPhoneOrEmail. Refusing.", buf, 0xCu);
    }

    if (v4)
    {
      int v13 = [(PKPeerPaymentController *)self displayableErrorForError:0];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v13);
    }
  }
}

void __59__PKPeerPaymentController__refreshRecipientWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 recipient];
  BOOL v7 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 || !v6)
  {
    if (v8)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void **)(*(void *)(v19 + 8) + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v31 = v19;
      __int16 v32 = 2112;
      uint64_t v33 = v20;
      __int16 v34 = 2112;
      id v35 = v5;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Remote recipient lookup failed for address: %@ with error: %@. Recipient is no longer valid. Notifying and returning shouldContinue NO.", buf, 0x20u);
    }

    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 postNotificationName:PKPeerPaymentControllerRecipientDidBecomeInvalidNotification object:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) _resetToState:1];
    uint64_t v22 = *(void *)(a1 + 40);
    if (v22)
    {
      uint64_t v23 = [*(id *)(a1 + 32) displayableErrorForError:v5];
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(*(void *)(v9 + 8) + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v31 = v9;
      __int16 v32 = 2112;
      uint64_t v33 = v6;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Recipient refresh succeeded with recipient: %@ for address: %@.", buf, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPhoneOrEmail:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)];
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void **)(v11[1] + 40);
    int v13 = [v11 recipientDisplayName];
    [v12 setDisplayName:v13];

    uint64_t v14 = +[PKPeerPaymentRecipientCache sharedCache];
    [v14 cacheRecipient:v6 forRecipientAddress:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)];

    uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) status];
    BOOL v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v15 == 1)
    {
      if (v16)
      {
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v31 = v17;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Recipient is still valid. Returning shouldContinue YES.", buf, 0xCu);
      }

      uint64_t v18 = *(void *)(a1 + 40);
      if (v18) {
        (*(void (**)(uint64_t, uint64_t, void))(v18 + 16))(v18, 1, 0);
      }
    }
    else
    {
      if (v16)
      {
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v31 = v24;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Recipient is no longer valid. Notifying and returning shouldContinue NO.", buf, 0xCu);
      }

      uint64_t v25 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInv_7.isa, 0);
      id v26 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInv_8.isa, &stru_1EE0F6808.isa, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48));
      int v27 = PKDisplayableErrorCustomWithType(-1, v25, v26, 0, 0);

      uint64_t v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v28 postNotificationName:PKPeerPaymentControllerRecipientDidBecomeInvalidNotification object:*(void *)(a1 + 32)];

      [*(id *)(a1 + 32) _resetToState:1];
      uint64_t v29 = *(void *)(a1 + 40);
      if (v29) {
        (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v27);
      }
    }
  }
}

- (void)identifyRecipientWithRoutingNumber:(id)a3 accountNumber:(id)a4 accountName:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: identifyRecipientWithRoutingNumber:accountNumber:accountName:completion: called.", buf, 2u);
  }

  if ([(PKPeerPaymentController *)self _ensureState:1])
  {
    webService = self->_webService;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__PKPeerPaymentController_identifyRecipientWithRoutingNumber_accountNumber_accountName_completion___block_invoke;
    v16[3] = &unk_1E56E7000;
    v16[4] = self;
    id v17 = v11;
    id v18 = v10;
    id v19 = v12;
    id v20 = v13;
    [(PKPeerPaymentWebService *)webService peerPaymentQuoteCertificatesForDestination:2 completion:v16];
  }
}

void __99__PKPeerPaymentController_identifyRecipientWithRoutingNumber_accountNumber_accountName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v6 || v7)
  {
    if (v9)
    {
      uint64_t v22 = *(void *)(a1 + 32);
      int v25 = 134218242;
      uint64_t v26 = v22;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get quote certificates failed with error: %@.", (uint8_t *)&v25, 0x16u);
    }

    uint64_t v23 = *(void *)(a1 + 64);
    if (v23)
    {
      uint64_t v24 = [*(id *)(a1 + 32) displayableErrorForError:v7];
      (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v25 = 134218242;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Get quote certificates succeeded with certificates response: %@.", (uint8_t *)&v25, 0x16u);
    }

    uint64_t v11 = [*(id *)(a1 + 40) copy];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id v13 = *(void **)(v12 + 112);
    *(void *)(v12 + 112) = v11;

    uint64_t v14 = [*(id *)(a1 + 48) copy];
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v16 = *(void **)(v15 + 120);
    *(void *)(v15 + 120) = v14;

    uint64_t v17 = [*(id *)(a1 + 56) copy];
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
    id v19 = *(void **)(v18 + 104);
    *(void *)(v18 + 104) = v17;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 96), a2);
    id v20 = *(void **)(a1 + 32);
    if (*(void *)(v20[1] + 8) == 1) {
      [v20 _setState:2 notify:1];
    }
    uint64_t v21 = *(void *)(a1 + 64);
    if (v21) {
      (*(void (**)(uint64_t, uint64_t, void))(v21 + 16))(v21, 1, 0);
    }
  }
}

- (void)identifyRecipientDebitCardWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: identifyRecipientDebitCardWithCompletion: called.", buf, 2u);
  }

  if ([(PKPeerPaymentController *)self _ensureState:1])
  {
    webService = self->_webService;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PKPeerPaymentController_identifyRecipientDebitCardWithCompletion___block_invoke;
    v7[3] = &unk_1E56E7028;
    v7[4] = self;
    id v8 = v4;
    [(PKPeerPaymentWebService *)webService peerPaymentQuoteCertificatesForDestination:4 completion:v7];
  }
}

void __68__PKPeerPaymentController_identifyRecipientDebitCardWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v6 || v7)
  {
    if (v9)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v16 = 134218242;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get quote certificates failed with error: %@.", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    if (v14)
    {
      uint64_t v15 = [*(id *)(a1 + 32) displayableErrorForError:v7];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v16 = 134218242;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Get quote certificates succeeded with certificates response: %@.", (uint8_t *)&v16, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 96), a2);
    uint64_t v11 = *(void **)(a1 + 32);
    if (*(void *)(v11[1] + 8) == 1) {
      [v11 _setState:2 notify:1];
    }
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, 1, 0);
    }
  }
}

- (void)identifyRecipientSelf
{
  v3 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: identifyRecipientSelf:accountNumber: called.", v4, 2u);
  }

  if ([(PKPeerPaymentController *)self _ensureState:1])
  {
    if (self->_is->state == 1) {
      [(PKPeerPaymentController *)self _setState:2 notify:1];
    }
  }
}

- (void)selectMode:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 5) {
      id v6 = @"Unknown";
    }
    else {
      id v6 = off_1E56E72F8[a3 - 1];
    }
    unint64_t v7 = self->_is->mode - 1;
    if (v7 > 5) {
      id v8 = @"Unknown";
    }
    else {
      id v8 = off_1E56E72F8[v7];
    }
    int v15 = 134218498;
    int v16 = self;
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: selectMode: called. New mode: %{public}@ (previous mode: %{public}@)", (uint8_t *)&v15, 0x20u);
  }

  is = self->_is;
  if (is->state >= 3)
  {
    [(PKPeerPaymentController *)self _resetToState:2];
    is = self->_is;
  }
  if (a3 && is->mode != a3)
  {
    is->mode = a3;
    unint64_t state = self->_is->state;
    BOOL v13 = ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 4) && state == 2;
    uint64_t v14 = 3;
    if (a3 == 2 || v13) {
      goto LABEL_27;
    }
    if (a3 == 3 && state == 2)
    {
      uint64_t v14 = 6;
LABEL_27:
      [(PKPeerPaymentController *)self _setState:v14 notify:1];
    }
  }
}

- (BOOL)_modeSupportsExternalFundingSource:(unint64_t)a3
{
  return ((a3 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (BOOL)_modeIsSendType:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (id)_featureDescriptorForMode:(unint64_t)a3
{
  id v5 = [(PKPeerPaymentController *)self account];
  id v6 = v5;
  unint64_t v7 = 0;
  switch(a3)
  {
    case 1uLL:
      is = self->_is;
      if (is->recurringPaymentIdentifier || is->startDate || is->frequency)
      {
        uint64_t v9 = [v5 recurringPaymentsFeatureDescriptor];
      }
      else
      {
        uint64_t v9 = [v5 sendToUserFeatureDescriptor];
      }
      goto LABEL_10;
    case 2uLL:
      uint64_t v9 = [v5 deviceTapFeatureDescriptor];
      goto LABEL_10;
    case 3uLL:
      uint64_t v9 = [v5 requestFromUserFeatureDescriptor];
      goto LABEL_10;
    case 5uLL:
      uint64_t v9 = [v5 loadFromCardFeatureDescriptor];
      goto LABEL_10;
    case 6uLL:
      uint64_t v9 = [v5 instantWithdrawalPromotionFeatureDescriptor];
LABEL_10:
      unint64_t v7 = (void *)v9;
      break;
    default:
      break;
  }

  return v7;
}

- (void)quoteWithAmount:(id)a3 completion:(id)a4
{
}

- (void)quoteWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5
{
}

- (void)quoteWithAmount:(id)a3 requestToken:(id)a4 alternateFundingSource:(id)a5 completion:(id)a6
{
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 completion:(id)a6
{
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 alternateFundingSource:(id)a6 completion:(id)a7
{
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 alternateFundingSource:(id)a6 preserveCurrentBalance:(unint64_t)a7 recurringPaymentIdentifier:(id)a8 frequency:(unint64_t)a9 startDate:(id)a10 threshold:(id)a11 completion:(id)a12
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  __int16 v18 = (PKPeerPaymentRequestToken *)a5;
  id v19 = a6;
  id obj = a8;
  id v20 = a8;
  id v45 = a10;
  id v44 = a11;
  id v21 = a12;
  uint64_t v22 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v49 = self;
    __int16 v50 = 2112;
    id v51 = v17;
    __int16 v52 = 2112;
    v53 = v18;
    __int16 v54 = 2112;
    id v55 = v19;
    _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: quoteWithAmount: %@ requestToken: %@ alternateFundingSource: %@ completion: called.", buf, 0x2Au);
  }

  if ([(PKPeerPaymentController *)self _ensureState:3])
  {
    v43 = v17;
    objc_opt_class();
    id v40 = v20;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = [[PKPeerPaymentRequestToken alloc] initWithRequestToken:v18 deviceScoreIdentifier:0 expiryDate:0];

      __int16 v18 = v23;
    }
    uint64_t v24 = objc_alloc_init(PKPeerPaymentQuoteRequest);
    int v25 = [v43 amount];
    [(PKPeerPaymentQuoteRequest *)v24 setAmount:v25];

    uint64_t v26 = [v43 currency];
    [(PKPeerPaymentQuoteRequest *)v24 setCurrency:v26];

    [(PKPeerPaymentQuoteRequest *)v24 setRequestToken:v18];
    [(PKPeerPaymentQuoteRequest *)v24 setSenderAddress:self->_is->senderPhoneOrEmail];
    [(PKPeerPaymentQuoteRequest *)v24 setRecipientPhoneOrEmail:self->_is->recipientPhoneOrEmail];
    [(PKPeerPaymentQuoteRequest *)v24 setSource:a4];
    if ([(PKPeerPaymentController *)self _modeSupportsExternalFundingSource:self->_is->mode])
    {
      if (v19
        || ([(PKPeerPaymentController *)self _defaultAlternateFundingSourceForMode:self->_is->mode], (id v19 = (id)objc_claimAutoreleasedReturnValue()) != 0))
      {
        [(PKPeerPaymentQuoteRequest *)v24 updateWithPaymentPass:v19 externalFundingSource:self->_is->mode != 6];
      }
      else
      {
        unint64_t mode = self->_is->mode;
        BOOL v36 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (mode == 5)
        {
          if (v36)
          {
            *(_DWORD *)buf = 134217984;
            v49 = self;
            _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Failed to request top up quote as no suitable payment cards were found.", buf, 0xCu);
          }

          v37 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentNoC.isa, 0);
          v38 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentNoC_0.isa, 0);
          v39 = PKDisplayableErrorCustomWithType(-1, v37, v38, 0, 0);

          (*((void (**)(id, void, void, void *))v21 + 2))(v21, 0, 0, v39);
          id v19 = 0;
          id v20 = v40;
          uint64_t v29 = v44;
          id v28 = v45;
          goto LABEL_26;
        }
        if (v36)
        {
          *(_DWORD *)buf = 134217984;
          v49 = self;
          _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: No acceptable alternate funding source available. Proceeding with transfer quote request with caution.", buf, 0xCu);
        }

        id v19 = 0;
      }
    }
    if (![(PKPeerPaymentController *)self _modeIsSendType:self->_is->mode])
    {
LABEL_19:
      switch(self->_is->mode)
      {
        case 2uLL:
          [(PKPeerPaymentQuoteRequest *)v24 setDestination:5];
          [(PKPeerPaymentQuoteRequest *)v24 setDeviceTapFlow:2];
          [(PKPeerPaymentQuoteRequest *)v24 setPaymentMode:2];
          break;
        case 4uLL:
          [(PKPeerPaymentQuoteRequest *)v24 setDestination:2];
          [(PKPeerPaymentQuoteRequest *)v24 setBankName:self->_is->accountName];
          [(PKPeerPaymentQuoteRequest *)v24 setAccountNumber:self->_is->accountNumber];
          [(PKPeerPaymentQuoteRequest *)v24 setRoutingNumber:self->_is->routingNumber];
          [(PKPeerPaymentQuoteRequest *)v24 setQuoteCertificatesResponse:self->_is->quoteCertificatesResponse];
          break;
        case 5uLL:
          [(PKPeerPaymentQuoteRequest *)v24 setDestination:3];
          objc_storeStrong((id *)&self->_is->threshold, a11);
          objc_storeStrong((id *)&self->_is->recurringPaymentIdentifier, obj);
          [(PKPeerPaymentQuoteRequest *)v24 setThreshold:self->_is->threshold];
          [(PKPeerPaymentQuoteRequest *)v24 setRecurringPaymentIdentifier:self->_is->recurringPaymentIdentifier];
          break;
        case 6uLL:
          [(PKPeerPaymentQuoteRequest *)v24 setDestination:4];
          break;
        default:
          [(PKPeerPaymentQuoteRequest *)v24 setDestination:1];
          uint64_t v30 = [(PKPeerPaymentRecipient *)self->_is->recipient identifier];
          [(PKPeerPaymentQuoteRequest *)v24 setRecipientIdentifier:v30];

          objc_storeStrong((id *)&self->_is->recurringPaymentIdentifier, obj);
          self->_is->frequency = a9;
          objc_storeStrong((id *)&self->_is->startDate, a10);
          [(PKPeerPaymentQuoteRequest *)v24 setRecurringPaymentIdentifier:self->_is->recurringPaymentIdentifier];
          [(PKPeerPaymentQuoteRequest *)v24 setFrequency:self->_is->frequency];
          [(PKPeerPaymentQuoteRequest *)v24 setStartDate:self->_is->startDate];
          uint64_t v31 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          -[PKPeerPaymentQuoteRequest setSendImmediately:](v24, "setSendImmediately:", [v31 isDateInToday:self->_is->startDate]);

          break;
      }
      uint64_t v29 = v44;
      id v28 = v45;
      objc_storeStrong((id *)&self->_is->quoteRequest, v24);
      uint64_t v32 = [(PKPeerPaymentRequestToken *)v18 copy];
      is = self->_is;
      requestToken = is->requestToken;
      is->requestToken = (PKPeerPaymentRequestToken *)v32;

      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __177__PKPeerPaymentController_quoteWithAmount_source_requestToken_alternateFundingSource_preserveCurrentBalance_recurringPaymentIdentifier_frequency_startDate_threshold_completion___block_invoke;
      v46[3] = &unk_1E56E1300;
      v46[4] = self;
      id v47 = v21;
      [(PKPeerPaymentController *)self _requestQuoteWithRequest:v24 withCompletion:v46];

LABEL_26:
      id v17 = v43;
      goto LABEL_27;
    }
    if ([(PKPeerPaymentQuoteRequest *)v24 externalFundingSource] != 1
      || !self->_is->supportsPreserveCurrentBalance)
    {
      goto LABEL_17;
    }
    if (a7 == 1)
    {
      unint64_t v27 = 1;
      goto LABEL_18;
    }
    if (!a7) {
      unint64_t v27 = ([(PKObject *)self->_peerPaymentPass settings] >> 11) & 1;
    }
    else {
LABEL_17:
    }
      unint64_t v27 = 0;
LABEL_18:
    [(PKPeerPaymentQuoteRequest *)v24 setPreserveCurrentBalance:v27];
    goto LABEL_19;
  }
  uint64_t v29 = v44;
  id v28 = v45;
LABEL_27:
}

void __177__PKPeerPaymentController_quoteWithAmount_source_requestToken_alternateFundingSource_preserveCurrentBalance_recurringPaymentIdentifier_frequency_startDate_threshold_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  if (*(void *)(v8[1] + 8) == 3) {
    [v8 _setState:4 notify:1];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v9 + 16))(v9, a2, v10, v7);
  }
}

- (void)_requestQuoteWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webService = self->_webService;
  uint64_t v9 = [v6 recipientPhoneOrEmail];
  -[PKPeerPaymentWebService prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:](webService, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", @"quote", v9, [v6 destination]);

  id v10 = self->_webService;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKPeerPaymentController__requestQuoteWithRequest_withCompletion___block_invoke;
  v13[3] = &unk_1E56E7050;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(PKPeerPaymentWebService *)v10 peerPaymentQuoteWithRequest:v12 completion:v13];
}

void __67__PKPeerPaymentController__requestQuoteWithRequest_withCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 quote];
  id v7 = (void *)v6;
  if (!v5 && v6)
  {
    id v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = a1[4];
      *(_DWORD *)buf = 134218242;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: fetch quote succeeded with quote: %@.", buf, 0x16u);
    }

    objc_storeStrong((id *)(*((void *)a1[4] + 1) + 64), v7);
    [v7 setRecipient:*(void *)(*((void *)a1[4] + 1) + 40)];
    [v7 setBankName:*(void *)(*((void *)a1[4] + 1) + 104)];
    [v7 setAccountNumber:*(void *)(*((void *)a1[4] + 1) + 112)];
    [v7 setRoutingNumber:*(void *)(*((void *)a1[4] + 1) + 120)];
    [v7 setStartDate:*(void *)(*((void *)a1[4] + 1) + 144)];
    [v7 setFrequency:*(void *)(*((void *)a1[4] + 1) + 152)];
    [v7 setThreshold:*(void *)(*((void *)a1[4] + 1) + 160)];
    id v10 = [a1[5] recurringPaymentIdentifier];
    [v7 setIsNewRecurringPayment:v10 == 0];

    objc_msgSend(v7, "setDestinationType:", objc_msgSend(a1[5], "destination"));
    id v11 = (void (**)(id, uint64_t, void *, void))a1[6];
    if (v11) {
      v11[2](v11, 1, v7, 0);
    }
    [a1[4] _sendAnalyticsForQuote:v7 withRequest:a1[5]];
    goto LABEL_18;
  }
  id v12 = [v5 domain];
  if ([v12 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"])
  {
    uint64_t v13 = [v5 code];

    if (v13 == 40001)
    {
      id v14 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = a1[4];
        *(_DWORD *)buf = 134217984;
        id v28 = v15;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: fetch quote failed with stale recipient. Refreshing and then re-attempting fetch quote.", buf, 0xCu);
      }

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __67__PKPeerPaymentController__requestQuoteWithRequest_withCompletion___block_invoke_76;
      v23[3] = &unk_1E56E53B0;
      id v16 = a1[4];
      id v17 = a1[5];
      id v18 = a1[4];
      id v24 = v17;
      id v25 = v18;
      id v26 = a1[6];
      [v16 _refreshRecipientWithCompletion:v23];

      goto LABEL_18;
    }
  }
  else
  {
  }
  id v19 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = a1[4];
    *(_DWORD *)buf = 134218242;
    id v28 = v20;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get quote failed with error: %@.", buf, 0x16u);
  }

  id v21 = a1[6];
  if (v21)
  {
    uint64_t v22 = [a1[4] displayableErrorForError:v5];
    (*((void (**)(id, void, void, void *))v21 + 2))(v21, 0, 0, v22);
  }
LABEL_18:
}

void __67__PKPeerPaymentController__requestQuoteWithRequest_withCompletion___block_invoke_76(uint64_t a1, int a2)
{
  if (a2)
  {
    if ([*(id *)(a1 + 32) destination] == 1)
    {
      v3 = *(void **)(a1 + 32);
      id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) identifier];
      [v3 setRecipientIdentifier:v4];
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    [v5 _requestQuoteWithRequest:v6 withCompletion:v7];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "displayableErrorForError:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, id))(v8 + 16))(v8, 0, 0, v9);
  }
}

- (void)_sendAnalyticsForQuote:(id)a3 withRequest:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 destination] == 1)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = [v6 amount];
    id v9 = PKAnalyticsAmountCategoryForAmount(v8);
    [v7 setObject:v9 forKey:@"p2pAmountCategory"];

    id v10 = [v6 currency];
    [v7 setObject:v10 forKey:@"p2pCurrency"];

    id v11 = NSNumber;
    id v12 = [v6 requestToken];
    uint64_t v13 = [v11 numberWithBool:v12 != 0];
    [v7 setObject:v13 forKey:@"p2pHasRequestToken"];

    id v14 = PKPeerPaymentQuoteRequestSourceTypeToString([v6 source]);
    if ([v6 source] && objc_msgSend(v6, "hasUpdatedPaymentMethod"))
    {
      uint64_t v15 = [v14 stringByAppendingString:@"-update"];

      id v14 = (void *)v15;
    }
    [v7 setObject:v14 forKey:@"p2pSource"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = objc_msgSend(v5, "items", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      int v19 = 0;
      int v20 = 0;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v16);
          }
          uint64_t v23 = [*(id *)(*((void *)&v26 + 1) + 8 * i) type];
          if (v23 == 1)
          {
            int v20 = 1;
          }
          else if (v23 == 2)
          {
            int v19 = 1;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);

      if (((v19 | v20) & 1) == 0) {
        goto LABEL_24;
      }
      id v24 = PKAnalyticsPayloadValueP2PQuoteItemTypeTopUpAndTransfer;
      if ((v19 & 1 & v20) == 0) {
        id v24 = PKAnalyticsPayloadValueP2PQuoteItemTypeTransfer;
      }
      if ((v19 & 1) == 0) {
        id v24 = PKAnalyticsPayloadValueP2PQuoteItemTypeTopUp;
      }
      id v25 = *v24;
      if (!v25) {
        goto LABEL_24;
      }
      id v16 = v25;
      [v7 setObject:v25 forKey:@"p2pQuoteItemTypes"];
    }

LABEL_24:
    PKAnalyticsSendEventWithDailyLimit(@"com.apple.wallet.peer.payment.quote", v7, 2);
  }
}

- (id)_defaultAlternateFundingSourceForMode:(unint64_t)a3
{
  id v5 = [(PKPeerPaymentController *)self account];
  id v6 = v5;
  id v7 = 0;
  uint64_t v8 = 0;
  switch(a3)
  {
    case 1uLL:
      id v7 = [v5 sendToUserFeatureDescriptor];
      is = self->_is;
      if (is->recurringPaymentIdentifier || is->startDate || is->frequency)
      {
        uint64_t v10 = [v6 recurringPaymentsFeatureDescriptor];

        id v7 = (void *)v10;
      }
      if (!v7) {
        goto LABEL_14;
      }
      goto LABEL_7;
    case 2uLL:
      uint64_t v18 = [v5 deviceTapFeatureDescriptor];
      goto LABEL_13;
    case 5uLL:
      uint64_t v18 = [v5 loadFromCardFeatureDescriptor];
      goto LABEL_13;
    case 6uLL:
      uint64_t v18 = [v5 instantWithdrawalPromotionFeatureDescriptor];
LABEL_13:
      id v7 = (void *)v18;
      if (v18)
      {
LABEL_7:
        id v11 = objc_alloc_init(PKPeerPaymentRequest);
        id v12 = [v7 merchantIdentifier];
        [(PKPaymentRequest *)v11 setMerchantIdentifier:v12];

        uint64_t v13 = [v7 supportedNetworks];
        [(PKPaymentRequest *)v11 setSupportedNetworks:v13];

        -[PKPaymentRequest setMerchantCapabilities:](v11, "setMerchantCapabilities:", [v7 merchantCapabilities]);
        id v14 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v15 = [v6 countryCode];
        id v16 = [v14 setWithObject:v15];
        [(PKPaymentRequest *)v11 setSupportedCountries:v16];

        if (a3 == 6) {
          [(PKPaymentRequest *)v11 setSupportsInstantFundsIn:1];
        }
        uint64_t v17 = +[PKPassLibrary sharedInstance];
        uint64_t v8 = [v17 _defaultPaymentPassForPaymentRequest:v11];
      }
      else
      {
LABEL_14:
        uint64_t v8 = 0;
      }
      break;
    default:
      break;
  }

  return v8;
}

- (void)authorizeQuote:(id)a3 performOnAuthorization:(BOOL)a4 completion:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v64 = self;
    __int16 v65 = 2112;
    id v66 = v8;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: authorizeQuote: %@ completion: called.", buf, 0x16u);
  }

  if ([(PKPeerPaymentController *)self _ensureState:4])
  {
    self->_performOnAuthorization = a4;
    quoteAuthorizationGroup = self->_quoteAuthorizationGroup;
    if (!quoteAuthorizationGroup)
    {
      id v12 = (OS_dispatch_group *)dispatch_group_create();
      uint64_t v13 = self->_quoteAuthorizationGroup;
      self->_quoteAuthorizationGroup = v12;

      id v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.passkitcore.peerpayment.quoteauthorizationqueue", 0);
      quoteAuthorizationCallbackQueue = self->_quoteAuthorizationCallbackQueue;
      self->_quoteAuthorizationCallbackQueue = v14;

      dispatch_group_enter((dispatch_group_t)self->_quoteAuthorizationGroup);
      id v16 = self->_quoteAuthorizationGroup;
      uint64_t v17 = self->_quoteAuthorizationCallbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke;
      block[3] = &unk_1E56D8AE0;
      block[4] = self;
      dispatch_group_notify(v16, v17, block);
      quoteAuthorizationGroup = self->_quoteAuthorizationGroup;
    }
    uint64_t v18 = self->_quoteAuthorizationCallbackQueue;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke_84;
    v60[3] = &unk_1E56D8A18;
    v60[4] = self;
    id v61 = v9;
    dispatch_group_notify(quoteAuthorizationGroup, v18, v60);
    if (self->_quoteAuthorizationCoordinator) {
      goto LABEL_37;
    }
    unint64_t v19 = self->_is->mode - 2;
    if (v19 > 4) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = qword_191674B50[v19];
    }
    webService = self->_webService;
    uint64_t v22 = [v8 recipient];
    uint64_t v23 = [v22 phoneOrEmail];
    [(PKPeerPaymentWebService *)webService prewarmDeviceScoreForEndpoint:@"performQuote" recipientAddress:v23 quoteDestinationType:v20];

    id v24 = [[PKPeerPaymentRequest alloc] initWithPeerPaymentQuote:v8];
    id v25 = [v8 firstQuoteItemOfType:1];
    long long v26 = [v25 dpanIdentifier];

    if (v26)
    {
      long long v27 = +[PKPassLibrary sharedInstance];
      long long v28 = [v27 passWithDPANIdentifier:v26];

      long long v29 = [v28 serialNumber];
      [(PKPaymentRequest *)v24 setPassSerialNumber:v29];

      id v30 = [v28 passTypeIdentifier];
      [(PKPaymentRequest *)v24 setPassTypeIdentifier:v30];
    }
    is = self->_is;
    unint64_t mode = is->mode;
    if (mode - 4 <= 2)
    {
      [(PKPaymentRequest *)v24 setUseLocationBasedAuthorization:1];
      is = self->_is;
      unint64_t mode = is->mode;
    }
    if (mode != 2)
    {
      if (mode != 1) {
        goto LABEL_23;
      }
      uint64_t v33 = [v8 recipient];
      if (v33)
      {

        is = self->_is;
      }
      else
      {
        is = self->_is;
        if (is->mode != 2) {
          goto LABEL_23;
        }
      }
    }
    if (is->supportsPreserveCurrentBalance)
    {
      __int16 v34 = [(PKPeerPaymentController *)self _featureDescriptorForMode:is->mode];
      if ([v8 isRecurringPayment])
      {
        uint64_t v35 = [(PKPeerPaymentAccount *)self->_account recurringPaymentsFeatureDescriptor];

        __int16 v34 = (void *)v35;
      }
      BOOL v36 = [v34 merchantIdentifier];
      [(PKPaymentRequest *)v24 setMerchantIdentifier:v36];

      v37 = [v34 supportedNetworks];
      [(PKPaymentRequest *)v24 setSupportedNetworks:v37];

      -[PKPaymentRequest setMerchantCapabilities:](v24, "setMerchantCapabilities:", [v34 merchantCapabilities]);
      v38 = (void *)MEMORY[0x1E4F1CAD0];
      v39 = [(PKPeerPaymentAccount *)self->_account countryCode];
      id v40 = [v38 setWithObject:v39];
      [(PKPaymentRequest *)v24 setSupportedCountries:v40];

      is = self->_is;
    }
LABEL_23:
    if (is->mode == 2)
    {
      [(PKPeerPaymentRequest *)v24 setHasUndeterminedRecipient:1];
      [(PKPaymentRequest *)v24 setConfirmationStyle:1];
    }
    v41 = [(PKPeerPaymentController *)self summaryItemsForQuote:v8];
    [(PKPaymentRequest *)v24 setPaymentSummaryItems:v41];

    v42 = +[PKPaymentRequestValidator validatorWithObject:v24];
    id v59 = 0;
    char v43 = [v42 isValidWithError:&v59];
    id v44 = v59;

    if (v43)
    {
      id v45 = self->_is;
      if (v45->mode != 1
        || ([(PKPeerPaymentQuote *)v45->quote firstQuoteItemOfType:1],
            (uint64_t v46 = objc_claimAutoreleasedReturnValue()) == 0)
        || (id v47 = (void *)v46,
            [(PKPeerPaymentController *)self _defaultAlternateFundingSourceForMode:1], v48 = objc_claimAutoreleasedReturnValue(), v48, v47, v48))
      {
        v49 = [[PKPaymentAuthorizationCoordinator alloc] initWithPaymentRequest:v24];
        quoteAuthorizationCoordinator = self->_quoteAuthorizationCoordinator;
        self->_quoteAuthorizationCoordinator = v49;

        [(PKPaymentAuthorizationCoordinator *)self->_quoteAuthorizationCoordinator setDelegate:self];
        [(PKPaymentAuthorizationCoordinator *)self->_quoteAuthorizationCoordinator _setPrivateDelegate:self];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v64 = self;
          _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Presenting PKPaymentAuthorizationCoordinator...", buf, 0xCu);
        }

        id v51 = self->_quoteAuthorizationCoordinator;
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke_93;
        v58[3] = &unk_1E56DD7C8;
        v58[4] = self;
        [(PKPaymentAuthorizationCoordinator *)v51 presentWithCompletion:v58];
        goto LABEL_36;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v64 = self;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Generated PKPeerPaymentRequest is invalid because it is configured to use DPAN and there are no usable DPANs", buf, 0xCu);
      }

      self->_quoteAuthorizationSuccess = 0;
      __int16 v54 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon.isa, 0);
      id v55 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_0.isa, 0);
      PKDisplayableErrorCustomWithType(-1, v54, v55, 0, 0);
      uint64_t v56 = (NSError *)objc_claimAutoreleasedReturnValue();
      quoteAuthorizationError = self->_quoteAuthorizationError;
      self->_quoteAuthorizationError = v56;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v64 = self;
        __int16 v65 = 2112;
        id v66 = v44;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Generated PKPeerPaymentRequest is invalid with error: %@", buf, 0x16u);
      }

      self->_quoteAuthorizationSuccess = 0;
      __int16 v52 = [(PKPeerPaymentController *)self displayableErrorForError:v44];
      v53 = self->_quoteAuthorizationError;
      self->_quoteAuthorizationError = v52;
    }
    dispatch_group_leave((dispatch_group_t)self->_quoteAuthorizationGroup);
LABEL_36:

LABEL_37:
  }
}

void __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 72))
  {
    id v7 = *(void **)(v6 + 80);
    *(void *)(v6 + 80) = 0;

    [*(id *)(a1 + 32) _setState:5 notify:1];
  }
  else
  {
    uint64_t v8 = *(void *)(v6 + 8);
    id v9 = *(void **)(v8 + 72);
    *(void *)(v8 + 72) = 0;
  }
  uint64_t v10 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v11 + 72)) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    uint64_t v13 = *(void *)(v11 + 80);
    int v14 = 134218498;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Completed authorizeQuote: with success: %{public}@ error: %@", (uint8_t *)&v14, 0x20u);
  }
}

void __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke_84(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    uint64_t v2 = [(id)objc_opt_class() _paymentNotCompletedErrorWithError:*(void *)(*(void *)(a1 + 32) + 80)];
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = v2;
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 72));
    uint64_t v2 = v4;
  }
}

void __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke_93(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 134217984;
      uint64_t v9 = v6;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Succeeded presenting PKPaymentAuthorizationCoordinator.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Failed to present PKPaymentAuthorizationCoordinator.", (uint8_t *)&v8, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
  }
}

- (id)analyticsSessionSubjectForPaymentAuthorizationCoordinator:(id)a3
{
  if (self->_is->mode - 1 > 1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = @"p2p";
  }
  return v3;
}

- (id)analyticsSessionTokenForPaymentAuthorizationCoordinator:(id)a3
{
  if (self->_is->mode - 1 > 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[PKAnalyticsReporter archivedSessionTokenForSubject:@"p2p"];
  }
  return v3;
}

- (void)performQuote:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: performQuote: %@ completion: called.", buf, 0x16u);
  }

  if ([(PKPeerPaymentController *)self _ensureState:4])
  {
    performQuoteGroup = self->_performQuoteGroup;
    if (!performQuoteGroup)
    {
      uint64_t v10 = (OS_dispatch_group *)dispatch_group_create();
      uint64_t v11 = self->_performQuoteGroup;
      self->_performQuoteGroup = v10;

      id v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.passkitcore.peerpayment.performquotequeue", 0);
      performQuoteCallbackQueue = self->_performQuoteCallbackQueue;
      self->_performQuoteCallbackQueue = v12;

      dispatch_group_enter((dispatch_group_t)self->_performQuoteGroup);
      int v14 = self->_performQuoteGroup;
      uint64_t v15 = self->_performQuoteCallbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PKPeerPaymentController_performQuote_completion___block_invoke;
      block[3] = &unk_1E56D8AE0;
      block[4] = self;
      dispatch_group_notify(v14, v15, block);
      performQuoteGroup = self->_performQuoteGroup;
    }
    __int16 v16 = self->_performQuoteCallbackQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__PKPeerPaymentController_performQuote_completion___block_invoke_97;
    v17[3] = &unk_1E56D8A18;
    v17[4] = self;
    id v18 = v7;
    dispatch_group_notify(performQuoteGroup, v16, v17);
    [(PKPeerPaymentController *)self authorizeQuote:v6 performOnAuthorization:1 completion:0];
  }
}

void __51__PKPeerPaymentController_performQuote_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 112))
  {
    uint64_t v9 = *(void **)(v8 + 120);
    *(void *)(v8 + 120) = 0;

    [*(id *)(a1 + 32) _setState:7 notify:1];
    [*(id *)(a1 + 32) _updateLastUsedAlternateFundingSource];
  }
  else
  {
    uint64_t v10 = *(void *)(v8 + 8);
    uint64_t v11 = *(void **)(v10 + 80);
    *(void *)(v10 + 80) = 0;
  }
  id v12 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = @"YES";
    if (!*(unsigned char *)(v13 + 112)) {
      int v14 = @"NO";
    }
    uint64_t v15 = *(void *)(*(void *)(v13 + 8) + 80);
    uint64_t v16 = *(void *)(v13 + 120);
    int v17 = 134218754;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Completed performQuote: with success: %{public}@ response: %@ error: %@", (uint8_t *)&v17, 0x2Au);
  }
}

uint64_t __51__PKPeerPaymentController_performQuote_completion___block_invoke_97(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 120))
  {
    [(id)objc_opt_class() _paymentNotCompletedErrorWithError:*(void *)(*(void *)(a1 + 32) + 120)];
    objc_claimAutoreleasedReturnValue();
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(*(void *)(a1 + 32) + 112), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 80));
  }
  return MEMORY[0x1F4181870]();
}

- (void)performQuoteWithCompletion:(id)a3
{
}

+ (void)performNearbyAuthorizedQuote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: performAuthorizedQuote:completion: called.", buf, 2u);
  }

  uint64_t v9 = +[PKPeerPaymentPerformRequest requestWithAuthorizedPeerPaymentQuote:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 setDestination:5];
    objc_msgSend(v10, "setSenderAddressType:", objc_msgSend(v6, "senderAddressType"));
    uint64_t v11 = [v6 senderAddress];
    [v10 setSenderAddress:v11];

    id v12 = [v6 encryptedRecipientData];
    [v10 setEncryptedRecipientData:v12];

    objc_msgSend(v10, "setEncryptionScheme:", objc_msgSend(v6, "encryptionScheme"));
    uint64_t v13 = [v6 publicKeyHash];
    [v10 setPublicKeyHash:v13];

    int v14 = [v6 ephemeralPublicKey];
    [v10 setEphemeralPublicKey:v14];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke;
    aBlock[3] = &unk_1E56E7078;
    id v27 = a1;
    id v25 = v6;
    id v26 = v7;
    uint64_t v15 = _Block_copy(aBlock);
    uint64_t v16 = +[PKPeerPaymentWebService sharedService];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke_115;
    v21[3] = &unk_1E56E70C8;
    id v22 = v10;
    id v23 = v15;
    id v17 = v15;
    [v16 peerPaymentPerformQuoteWithRequest:v22 completion:v21];

    uint64_t v18 = v25;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    __int16 v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon.isa, 0);
    uint64_t v20 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_0.isa, 0);
    uint64_t v18 = PKDisplayableErrorCustomWithType(-1, v19, v20, 0, 0);

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v18);
    goto LABEL_7;
  }
LABEL_8:
}

void __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = v6;
    uint64_t v11 = [v10 domain];
    int v12 = [v11 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"];

    uint64_t v9 = v10;
    if (v12)
    {
      uint64_t v9 = v10;
      if ([v10 code] == 40311)
      {
        uint64_t v13 = [*(id *)(a1 + 32) peerPaymentQuote];
        int v14 = [v13 firstQuoteItemOfType:1];
        uint64_t v15 = [v14 dpanIdentifier];

        uint64_t v16 = +[PKPassLibrary sharedInstance];
        id v17 = [v16 passWithDPANIdentifier:v15];

        uint64_t v18 = [v17 organizationName];
        uint64_t v9 = v10;
        if (v18)
        {
          long long v28 = v15;
          if (PKIsPhone())
          {
            __int16 v19 = [v17 passURL];
            uint64_t v20 = [v19 URLByAppendingPathComponent:@"details"];

            __int16 v21 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentDec_1.isa, &stru_1EE0F6808.isa, v18);
            if (v20)
            {
              uint64_t v22 = *MEMORY[0x1E4F28590];
              uint64_t v31 = v21;
              v32[0] = v22;
              id v27 = v21;
              id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
              v32[1] = @"PKErrorRecoveryURL";
              v33[0] = v23;
              v33[1] = v20;
              uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

              __int16 v21 = v27;
            }
            else
            {
              uint64_t v24 = 0;
            }
          }
          else
          {
            uint64_t v24 = 0;
          }
          id v25 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentDec.isa, 0);
          id v26 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentDec_2.isa, &stru_1EE105568.isa, v18, v18);
          uint64_t v9 = PKDisplayableErrorCustomWithType(-1, v25, v26, 0, v24);

          uint64_t v15 = v28;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "_sendAuthorizedQuoteAnalyticsWithSuccess:mode:authorizedQuote:status:", 0, 2, *(void *)(a1 + 32), objc_msgSend(v5, "status"));
    uint64_t v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v10;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: Error: Perform nearby authorized quote failed with error: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_sendAuthorizedQuoteAnalyticsWithSuccess:mode:authorizedQuote:status:", 1, 2, *(void *)(a1 + 32), objc_msgSend(v5, "status"));
    uint64_t v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: Perform nearby authorized quote succeeded.", buf, 2u);
    }
    uint64_t v9 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 domain];
  if (![v7 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"])
  {

    goto LABEL_7;
  }
  uint64_t v8 = [v6 code];

  if (v8 != 40397)
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  uint64_t v9 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: Perform nearby authorized quote received a timeout response, attempting to perform again", buf, 2u);
  }

  id v10 = +[PKPeerPaymentWebService sharedService];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke_116;
  v12[3] = &unk_1E56E70A0;
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  [v10 peerPaymentPerformQuoteWithRequest:v11 completion:v12];

LABEL_8:
}

uint64_t __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performAuthorizedQuote:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    __int16 v34 = self;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: _performAuthorizedQuote: %@ completion: called.", buf, 0x16u);
  }

  uint64_t v9 = +[PKPeerPaymentPerformRequest requestWithAuthorizedPeerPaymentQuote:v6];
  id v10 = v9;
  if (v9)
  {
    [v9 setRecipientPhoneOrEmail:self->_is->recipientPhoneOrEmail];
    [v10 setAccountNumber:self->_is->accountNumber];
    [v10 setRoutingNumber:self->_is->routingNumber];
    unint64_t v11 = self->_is->mode - 2;
    if (v11 > 4) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = qword_191674B50[v11];
    }
    [v10 setDestination:v12];
    if (self->_is->mode == 2)
    {
      objc_msgSend(v10, "setSenderAddressType:", objc_msgSend(v6, "senderAddressType"));
      uint64_t v16 = [v6 senderAddress];
      [v10 setSenderAddress:v16];

      id v17 = [v6 encryptedRecipientData];
      [v10 setEncryptedRecipientData:v17];

      objc_msgSend(v10, "setEncryptionScheme:", objc_msgSend(v6, "encryptionScheme"));
      uint64_t v18 = [v6 publicKeyHash];
      [v10 setPublicKeyHash:v18];

      __int16 v19 = [v6 ephemeralPublicKey];
      [v10 setEphemeralPublicKey:v19];
    }
    uint64_t v20 = [v6 peerPaymentQuote];
    __int16 v21 = [v20 firstQuoteItemOfType:1];
    uint64_t v22 = [v21 dpanIdentifier];

    if ([(PKPeerPaymentQuote *)self->_is->quote isRecurringPayment])
    {
      id v23 = PKPaymentCryptogramTypeToString(0);
      [v10 setCryptogramType:v23];

      if (v22)
      {
        uint64_t v24 = +[PKPassLibrary sharedInstance];
        id v25 = [v24 passWithDPANIdentifier:v22];

        id v26 = [v25 serialNumber];
        [v10 setPassSerialNumber:v26];

        id v27 = [v25 passTypeIdentifier];
        [v10 setPassTypeIdentifier:v27];
      }
    }
    webService = self->_webService;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __62__PKPeerPaymentController__performAuthorizedQuote_completion___block_invoke;
    v29[3] = &unk_1E56E70F0;
    v29[4] = self;
    id v30 = v6;
    id v31 = v22;
    id v32 = v7;
    id v15 = v22;
    [(PKPeerPaymentWebService *)webService peerPaymentPerformQuoteWithRequest:v10 completion:v29];

    goto LABEL_15;
  }
  if (v7)
  {
    id v13 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon.isa, 0);
    int v14 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_0.isa, 0);
    PKDisplayableErrorCustomWithType(-1, v13, v14, 0, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v15);
LABEL_15:
  }
}

void __62__PKPeerPaymentController__performAuthorizedQuote_completion___block_invoke(void *a1, void *a2, void *a3)
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (id *)(*(void *)(a1[4] + 8) + 80);
  if (!v6 || v7)
  {
    id v16 = *v8;
    *uint64_t v8 = 0;

    objc_storeStrong((id *)(a1[4] + 120), a3);
    id v17 = [v7 domain];
    int v18 = [v17 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"];

    if (v18 && [v7 code] == 40311)
    {
      __int16 v19 = +[PKPassLibrary sharedInstance];
      uint64_t v20 = [v19 passWithDPANIdentifier:a1[6]];

      __int16 v21 = [v20 organizationName];
      if (v21)
      {
        if (PKIsPhone())
        {
          uint64_t v22 = [v20 passURL];
          id v23 = [v22 URLByAppendingPathComponent:@"details"];

          uint64_t v24 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentDec_1.isa, &stru_1EE0F6808.isa, v21);
          id v25 = (void *)v24;
          if (v23)
          {
            uint64_t v26 = *MEMORY[0x1E4F28590];
            uint64_t v39 = v24;
            v40[0] = v26;
            id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
            v40[1] = @"PKErrorRecoveryURL";
            v41[0] = v27;
            v41[1] = v23;
            long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
          }
          else
          {
            long long v28 = 0;
          }
        }
        else
        {
          long long v28 = 0;
        }
        long long v29 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentDec.isa, 0);
        id v30 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentDec_2.isa, &stru_1EE105568.isa, v21, v21);
        uint64_t v31 = PKDisplayableErrorCustomWithType(-1, v29, v30, 0, v28);
        uint64_t v32 = a1[4];
        uint64_t v33 = *(void **)(v32 + 120);
        *(void *)(v32 + 120) = v31;
      }
    }
    objc_msgSend((id)objc_opt_class(), "_sendAuthorizedQuoteAnalyticsWithSuccess:mode:authorizedQuote:status:", 0, *(void *)(*(void *)(a1[4] + 8) + 16), a1[5], objc_msgSend(v6, "status"));
    unint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = a1[4];
      *(_DWORD *)buf = 134218242;
      uint64_t v36 = v34;
      __int16 v37 = 2112;
      id v38 = v7;
      id v13 = "PKPeerPaymentController %p: Error: Perform authorized quote failed with error: %@";
      int v14 = v11;
      uint32_t v15 = 22;
      goto LABEL_18;
    }
  }
  else
  {
    objc_storeStrong(v8, a2);
    uint64_t v9 = a1[4];
    id v10 = *(void **)(v9 + 120);
    *(void *)(v9 + 120) = 0;

    objc_msgSend((id)objc_opt_class(), "_sendAuthorizedQuoteAnalyticsWithSuccess:mode:authorizedQuote:status:", 1, *(void *)(*(void *)(a1[4] + 8) + 16), a1[5], objc_msgSend(v6, "status"));
    unint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[4];
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = v12;
      id v13 = "PKPeerPaymentController %p: Perform authorized quote succeeded.";
      int v14 = v11;
      uint32_t v15 = 12;
LABEL_18:
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
  }

  (*(void (**)(void))(a1[7] + 16))();
}

- (void)_updateLastUsedAlternateFundingSource
{
  uint64_t v2 = self->_is->quoteRequest;
  uint64_t v3 = v2;
  if (v2 && [(PKPeerPaymentQuoteRequest *)v2 externalFundingSource] == 1)
  {
    uint64_t v4 = [(PKPeerPaymentQuoteRequest *)v3 dpanIdentifier];
    if ([v4 length])
    {
      id v5 = +[PKPassLibrary sharedInstance];
      id v6 = [v5 passWithDPANIdentifier:v4];

      if (v6)
      {
        id v7 = [v6 uniqueID];
        uint64_t v8 = +[PKPeerPaymentService sharedInstance];
        [v8 setLastUsedAlternateFundingSourcePassUniqueIdentifier:v7];
      }
      else
      {
        id v7 = PKLogFacilityTypeGetObject(0xBuLL);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Could not find alternate funding source pass by DPAN identifier in pass library.", v9, 2u);
        }
      }
    }
  }
}

- (void)formalRequestTokenForAmount:(id)a3 completion:(id)a4
{
}

- (void)formalRequestTokenForAmount:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: formalRequestTokenForAmount: %@ completion: called.", buf, 0x16u);
  }

  if ([(PKPeerPaymentController *)self _ensureState:6])
  {
    unint64_t v11 = objc_alloc_init(PKPeerPaymentRequestTokenRequest);
    uint64_t v12 = [(PKPeerPaymentController *)self recipient];
    id v13 = [v12 identifier];
    [(PKPeerPaymentRequestTokenRequest *)v11 setRecipientIdentifier:v13];

    int v14 = [v8 amount];
    [(PKPeerPaymentRequestTokenRequest *)v11 setAmount:v14];

    uint32_t v15 = [v8 currency];
    [(PKPeerPaymentRequestTokenRequest *)v11 setCurrency:v15];

    [(PKPeerPaymentRequestTokenRequest *)v11 setSenderAddress:self->_is->senderPhoneOrEmail];
    [(PKPeerPaymentRequestTokenRequest *)v11 setRecipientPhoneOrEmail:self->_is->recipientPhoneOrEmail];
    [(PKPeerPaymentRequestTokenRequest *)v11 setSource:a4];
    webService = self->_webService;
    id v17 = [(PKPeerPaymentRequestTokenRequest *)v11 recipientPhoneOrEmail];
    [(PKPeerPaymentWebService *)webService prewarmDeviceScoreForEndpoint:@"requestToken" recipientAddress:v17 quoteDestinationType:1];

    int v18 = self->_webService;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__PKPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke;
    v19[3] = &unk_1E56E7140;
    v19[4] = self;
    id v21 = v9;
    id v20 = v8;
    unint64_t v22 = a4;
    [(PKPeerPaymentWebService *)v18 peerPaymentRequestTokenWithRequest:v11 completion:v19];
  }
}

void __73__PKPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 success])
  {
    id v7 = [v5 requestToken];

    if (!v6)
    {
      if (v7)
      {
        id v8 = [v5 requestToken];
        id v9 = PKLogFacilityTypeGetObject(0xBuLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134218242;
          uint64_t v34 = v10;
          __int16 v35 = 2112;
          uint64_t v36 = v8;
          _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Get request token succeeded with requestToken: %@.", buf, 0x16u);
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 56), v8);
        unint64_t v11 = *(void **)(a1 + 32);
        if (*(void *)(v11[1] + 8) == 6) {
          [v11 _setState:7 notify:1];
        }
        uint64_t v12 = *(void *)(a1 + 48);
        if (v12) {
          (*(void (**)(uint64_t, uint64_t, __CFString *, void))(v12 + 16))(v12, 1, v8, 0);
        }

        id v6 = 0;
        goto LABEL_27;
      }
    }
  }
  id v13 = [v6 domain];
  if ([v13 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"])
  {
    uint64_t v14 = [v6 code];

    if (v14 == 40001)
    {
      uint32_t v15 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v34 = v16;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get request token failed with stale recipient. Refreshing and then re-attempting request token.", buf, 0xCu);
      }

      id v17 = *(void **)(a1 + 32);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __73__PKPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke_119;
      v29[3] = &unk_1E56E7118;
      v29[4] = v17;
      id v18 = *(id *)(a1 + 40);
      id v20 = *(void **)(a1 + 48);
      uint64_t v19 = *(void *)(a1 + 56);
      id v30 = v18;
      uint64_t v32 = v19;
      id v31 = v20;
      [v17 _refreshRecipientWithCompletion:v29];

      goto LABEL_27;
    }
  }
  else
  {
  }
  if (!v6)
  {
    if ([v5 success])
    {
      id v6 = 0;
    }
    else
    {
      id v21 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentRef.isa, 0);
      unint64_t v22 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentRef_0.isa, 0);
      PKDisplayableErrorCustomWithType(-1, v21, v22, 0, 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v23 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    int v25 = [v5 success];
    id v26 = @"NO";
    *(_DWORD *)buf = 134218498;
    uint64_t v34 = v24;
    if (v25) {
      id v26 = @"YES";
    }
    __int16 v35 = 2114;
    uint64_t v36 = v26;
    __int16 v37 = 2112;
    id v38 = v6;
    _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get request token failed with success: %{public}@ error: %@.", buf, 0x20u);
  }

  uint64_t v27 = *(void *)(a1 + 48);
  if (v27)
  {
    long long v28 = [*(id *)(a1 + 32) displayableErrorForError:v6];
    (*(void (**)(uint64_t, void, void, void *))(v27 + 16))(v27, 0, 0, v28);
  }
LABEL_27:
}

void __73__PKPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke_119(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    id v5 = *(void **)(a1 + 32);
    [v5 formalRequestTokenForAmount:v2 source:v3 completion:v4];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, id))(v6 + 16))(v6, 0, 0, v7);
  }
}

- (void)pendingRequestsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentWebService *)self->_webService peerPaymentService];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke;
  v8[3] = &unk_1E56E3CA0;
  uint64_t v10 = self;
  id v11 = v4;
  id v9 = v5;
  id v6 = v4;
  id v7 = v5;
  [v7 peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:v8];
}

void __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  if ([v20 count])
  {
    uint64_t v19 = a1;
    uint64_t v49 = 0;
    __int16 v50 = &v49;
    uint64_t v51 = 0x3032000000;
    __int16 v52 = __Block_byref_object_copy__31;
    v53 = __Block_byref_object_dispose__31;
    id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v43 = 0;
    id v44 = &v43;
    uint64_t v45 = 0x3032000000;
    uint64_t v46 = __Block_byref_object_copy__31;
    id v47 = __Block_byref_object_dispose__31;
    id v48 = [MEMORY[0x1E4F1CA48] array];
    id v21 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x3032000000;
    id v40 = __Block_byref_object_copy__31;
    v41 = __Block_byref_object_dispose__31;
    id v42 = [MEMORY[0x1E4F1C9C8] date];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v3 = v20;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v55 count:16];
    if (!v4) {
      goto LABEL_16;
    }
    uint64_t v5 = *(void *)v34;
    while (1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "requestToken", v19);
        [(id)v50[5] setValue:v7 forKey:v8];
        id v9 = [v7 expiryDate];
        if (v9)
        {
        }
        else
        {
          uint64_t v12 = [v7 status];
          if (!v12
            || ([v7 status],
                id v13 = objc_claimAutoreleasedReturnValue(),
                char v14 = [v13 isEqualToString:@"unknown"],
                v13,
                v12,
                (v14 & 1) != 0))
          {
            [v21 addObject:v8];
            goto LABEL_14;
          }
        }
        uint64_t v10 = [v7 expiryDate];
        BOOL v11 = [v10 compare:v38[5]] == 1;

        if (v11)
        {
          [(id)v44[5] addObject:v7];
          [(id)v50[5] removeObjectForKey:v8];
        }
LABEL_14:
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v55 count:16];
      if (!v4)
      {
LABEL_16:

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_129;
        aBlock[3] = &unk_1E56E7188;
        uint64_t v32 = &v49;
        id v30 = *(id *)(v19 + 32);
        id v31 = *(id *)(v19 + 48);
        uint32_t v15 = _Block_copy(aBlock);
        if ([v21 count])
        {
          uint64_t v16 = objc_alloc_init(PKPeerPaymentPendingRequestsRequest);
          [(PKPeerPaymentPendingRequestsRequest *)v16 setRequestTokens:v21];
          id v17 = *(void **)(*(void *)(v19 + 40) + 128);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_3;
          v22[3] = &unk_1E56E71B0;
          id v26 = &v37;
          uint64_t v27 = &v49;
          long long v28 = &v43;
          id v23 = *(id *)(v19 + 32);
          id v24 = v15;
          id v25 = *(id *)(v19 + 48);
          [v17 peerPaymentPendingRequestsWithRequest:v16 completion:v22];
        }
        else
        {
          (*((void (**)(void *, uint64_t))v15 + 2))(v15, v44[5]);
        }

        _Block_object_dispose(&v37, 8);
        _Block_object_dispose(&v43, 8);

        _Block_object_dispose(&v49, 8);
        goto LABEL_22;
      }
    }
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, void, void))(v18 + 16))(v18, 1, 0, 0);
  }
LABEL_22:
}

void __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_129(void *a1, void *a2)
{
  uint64_t v7 = [a2 sortedArrayUsingComparator:&__block_literal_global_95];
  if ([*(id *)(*(void *)(a1[6] + 8) + 40) count])
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) allKeys];
    [v3 deletePeerPaymentPendingRequestsForRequestTokens:v4];
  }
  uint64_t v5 = a1[5];
  id v6 = (void *)v7;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v5 + 16))(v5, 1, v7, 0);
    id v6 = (void *)v7;
  }
}

uint64_t __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 expiryDate];
  id v6 = [v4 expiryDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void, void, id))(v7 + 16))(v7, 0, 0, v6);
    }
  }
  else
  {
    id v24 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = [v5 requestSummaries];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          char v14 = [v13 status];
          int v15 = [v14 isEqualToString:@"pending"];

          uint64_t v16 = [v13 expiryDate];
          uint64_t v17 = [v16 compare:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

          if (v15) {
            BOOL v18 = v17 == -1;
          }
          else {
            BOOL v18 = 1;
          }
          if (!v18)
          {
            uint64_t v19 = [v13 requestToken];
            id v20 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) valueForKey:v19];
            if (v20)
            {
              id v21 = [v13 expiryDate];
              [v20 setExpiryDate:v21];

              unint64_t v22 = [v13 actions];
              [v20 setActions:v22];

              id v23 = [v13 status];
              [v20 setStatus:v23];

              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v20];
              [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeObjectForKey:v19];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 32) insertOrUpdatePeerPaymentPendingRequests:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) shouldScheduleNotifications:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = 0;
    id v5 = v24;
  }
}

- (void)performAction:(id)a3 withPaymentIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  webService = self->_webService;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PKPeerPaymentController_performAction_withPaymentIdentifier_completion___block_invoke;
  v11[3] = &unk_1E56E71D8;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(PKPeerPaymentWebService *)webService peerPaymentPerformAction:a3 withPaymentIdentifier:a4 completion:v11];
}

void __74__PKPeerPaymentController_performAction_withPaymentIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5) {
    int v6 = 0;
  }
  else {
    int v6 = [v10 success];
  }
  if (v10) {
    uint64_t v7 = [v10 status];
  }
  else {
    uint64_t v7 = -1;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(void, uint64_t, uint64_t, void))(v8 + 16))(*(void *)(a1 + 40), 1, v7, 0);
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) displayableErrorForError:v5];
      (*(void (**)(uint64_t, void, uint64_t, void *))(v8 + 16))(v8, 0, v7, v9);
    }
  }
}

- (void)performPendingRequestAction:(id)a3 withRequestToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  webService = self->_webService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PKPeerPaymentController_performPendingRequestAction_withRequestToken_completion___block_invoke;
  v15[3] = &unk_1E56E7200;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(PKPeerPaymentWebService *)webService peerPaymentPendingRequestPerformAction:v14 withRequestToken:v13 completion:v15];
}

void __83__PKPeerPaymentController_performPendingRequestAction_withRequestToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 success])
  {
    int v11 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = (__CFString *)*(id *)(a1 + 32);
  id v8 = @"reject";
  if (v7 == v8) {
    goto LABEL_24;
  }
  id v9 = v8;
  if (v7 && v8)
  {
    char v10 = [(__CFString *)v7 isEqualToString:v8];

    if (v10) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v7 = (__CFString *)*(id *)(a1 + 32);
  id v16 = @"cancel";
  if (v7 == v16)
  {
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v17 = v16;
  if (v7 && v16)
  {
    char v18 = [(__CFString *)v7 isEqualToString:v16];

    if ((v18 & 1) == 0) {
      goto LABEL_27;
    }
LABEL_25:
    id v19 = [*(id *)(*(void *)(a1 + 40) + 128) peerPaymentService];
    v21[0] = *(void *)(a1 + 48);
    int v11 = 1;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v19 deletePeerPaymentPendingRequestsForRequestTokens:v20];

    goto LABEL_9;
  }

LABEL_27:
  int v11 = 1;
LABEL_9:
  if (*(void *)(a1 + 56))
  {
    if (v5)
    {
      id v12 = [v5 status];
    }
    else
    {
      id v12 = @"unknown";
    }
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 56);
    if (v11)
    {
      (*(void (**)(void, uint64_t, __CFString *, void))(v14 + 16))(*(void *)(a1 + 56), 1, v12, 0);
    }
    else
    {
      int v15 = [*(id *)(a1 + 40) displayableErrorForError:v6];
      (*(void (**)(uint64_t, void, __CFString *, void *))(v14 + 16))(v14, 0, v13, v15);
    }
  }
}

- (void)statusForPaymentIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    webService = self->_webService;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__PKPeerPaymentController_statusForPaymentIdentifier_withCompletion___block_invoke;
    v11[3] = &unk_1E56E7228;
    v11[4] = self;
    id v12 = v7;
    [(PKPeerPaymentWebService *)webService peerPaymentStatusWithPaymentIdentifier:v6 completion:v11];
  }
  else if (v7)
  {
    char v10 = [(PKPeerPaymentController *)self displayableErrorForError:0];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
  }
}

void __69__PKPeerPaymentController_statusForPaymentIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8)
    {
      (*(void (**)(void, id, void))(v6 + 16))(*(void *)(a1 + 40), v8, 0);
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) displayableErrorForError:v5];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
  }
}

- (void)handleIdentityVerificationWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(id)objc_opt_class() errorIsIdentityVerificationRequiredError:v6])
  {
    id v8 = [v6 domain];
    int v9 = [v8 isEqualToString:@"PKDisplayableError"];

    if (v9)
    {
      char v10 = [v6 userInfo];
      uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      id v6 = (id)v11;
    }
    id v12 = [v6 userInfo];
    id v13 = [v12 objectForKey:@"PKIdentityVerificationResponse"];

    if (v13)
    {
      uint64_t v14 = [(PKPeerPaymentWebService *)self->_webService peerPaymentService];
      [v14 presentIdentityVerificationFlowWithResponse:v13 orientation:0 completion:v7];
    }
    else
    {
      int v15 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Cannot present identity verification flow because the response data is nil", v16, 2u);
      }

      if (v7) {
        v7[2](v7, 0);
      }
    }
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

- (void)handleTermsAcceptanceRequiredWithError:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(id)objc_opt_class() errorIsTermsAcceptanceRequiredError:v7];

  if (v8)
  {
    int v9 = [(PKPeerPaymentWebService *)self->_webService peerPaymentService];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__PKPeerPaymentController_handleTermsAcceptanceRequiredWithError_completion___block_invoke;
    v10[3] = &unk_1E56E7250;
    v10[4] = self;
    id v11 = v6;
    [v9 updateAccountWithCompletion:v10];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __77__PKPeerPaymentController_handleTermsAcceptanceRequiredWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 128) peerPaymentService];
    [v4 presentPeerPaymentTermsAndConditionsWithAccount:v3 orientation:0 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Cannot present terms acceptance flow because the account is nil", v7, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKPaymentPass)peerPaymentPass
{
  return self->_peerPaymentPass;
}

- (void)_handleAccountChanged:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PKPeerPaymentController__handleAccountChanged___block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__PKPeerPaymentController__handleAccountChanged___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 128) peerPaymentService];
  uint64_t v4 = [v3 account];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;

  id v7 = +[PKPassLibrary sharedInstance];
  int v8 = [*(id *)(*(void *)(a1 + 32) + 16) associatedPassUniqueID];
  int v9 = [v7 passWithUniqueID:v8];
  uint64_t v10 = [v9 paymentPass];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 24);
  *(void *)(v11 + 24) = v10;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "updateDeviceScorersWithEncryptedPayloadVersion:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "deviceScoreEncryptedPayloadVersion"));
  if ([*(id *)(*(void *)(a1 + 32) + 16) role] == 1)
  {
    uint64_t v13 = [v2 sendRestrictionType];
    if (v13 != [*(id *)(*(void *)(a1 + 32) + 16) sendRestrictionType])
    {
      uint64_t v14 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Resetting peer payment controller since the sendRestrictionType has changed", v16, 2u);
      }

      [*(id *)(a1 + 32) reset];
    }
  }
  int v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:PKPeerPaymentControllerAccountDidChangeNotification object:*(void *)(a1 + 32)];
}

+ (id)displayableErrorForError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"PKDisplayableError"];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    id v7 = [a1 _displayableErrorOverrideForUnderlyingError:v4];
    if (!v7)
    {
      int v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen.isa, 0);
      int v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen_0.isa, 0);
      PKDisplayableErrorCustomWithType(-1, v8, v9, v4, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)displayableErrorForError:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() displayableErrorForError:v3];

  return v4;
}

+ (id)_displayableErrorOverrideForUnderlyingError:(id)a3
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PKPeerPaymentService sharedInstance];
  uint64_t v5 = [v4 account];

  int v6 = [v3 domain];
  int v7 = [v6 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"];

  if (v7)
  {
    uint64_t v8 = [v3 localizedFailureReason];
    uint64_t v9 = [v3 localizedRecoverySuggestion];
    uint64_t v10 = [v3 code];
    uint64_t v11 = 0;
    if (v10 > 40311)
    {
      if (v10 == 40312)
      {
        v37[0] = *MEMORY[0x1E4F28590];
        PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAmb_1.isa, 0);
        id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        long long v36 = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        v38[0] = v13;
        v38[1] = MEMORY[0x1E4F1CC38];
        v37[1] = @"PKDisplayableErrorIsPreferredActionKey";
        v37[2] = @"PKErrorRecoveryURL";
        uint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"];
        v38[2] = v14;
        int v15 = (void *)MEMORY[0x1E4F1C9E8];
        id v16 = v38;
        uint64_t v17 = v37;
        uint64_t v18 = 3;
LABEL_30:
        uint64_t v11 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
LABEL_34:

        goto LABEL_35;
      }
      if (v10 != 40316) {
        goto LABEL_35;
      }
      if (+[PKWalletVisibility isWalletVisible])
      {
        id v12 = [NSString stringWithFormat:@"shoebox://%@", @"peerPaymentTopUp"];
      }
      else
      {
        id v12 = @"prefs:root=PASSBOOK&path=";
      }
      v40[0] = *MEMORY[0x1E4F28590];
      uint64_t v13 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentNeg_2.isa, 0);
      uint64_t v39 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
      v41[0] = v14;
      v40[1] = @"PKErrorRecoveryURL";
      uint64_t v30 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      v41[1] = v30;
      id v31 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v32 = v41;
      long long v33 = v40;
LABEL_33:
      uint64_t v11 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:2];

      goto LABEL_34;
    }
    if (v10 != 40301)
    {
      if (v10 != 40310) {
        goto LABEL_35;
      }
      v43[0] = *MEMORY[0x1E4F28590];
      PKLocalizedPeerPaymentString(&cfstr_PeerPaymentHsa_1.isa, 0);
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v42 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      v44[0] = v13;
      v43[1] = @"PKErrorRecoveryURL";
      uint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=PASSWORD_AND_SECURITY"];
      v44[1] = v14;
      int v15 = (void *)MEMORY[0x1E4F1C9E8];
      id v16 = v44;
      uint64_t v17 = v43;
      uint64_t v18 = 2;
      goto LABEL_30;
    }
    if (![v5 role])
    {
      if (+[PKWalletVisibility isWalletVisible]) {
        long long v29 = @"shoebox://";
      }
      else {
        long long v29 = @"prefs:root=PASSBOOK&path=";
      }
      id v12 = [(__CFString *)v29 stringByAppendingString:@"payment_setup"];
      v46[0] = *MEMORY[0x1E4F28590];
      uint64_t v13 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentIns_2.isa, 0);
      uint64_t v45 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      v47[0] = v14;
      v46[1] = @"PKErrorRecoveryURL";
      uint64_t v30 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      v47[1] = v30;
      id v31 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v32 = v47;
      long long v33 = v46;
      goto LABEL_33;
    }
LABEL_23:
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  id v19 = [v3 domain];
  int v20 = [v19 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v20)
  {
    if ([v3 code] == -1009)
    {
      uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentOff.isa, 0);
      id v21 = @"PEER_PAYMENT_OFFLINE_ERROR_MESSAGE";
LABEL_21:
      uint64_t v28 = PKLocalizedPeerPaymentString(&v21->isa, 0);
      goto LABEL_22;
    }
LABEL_20:
    uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentNet.isa, 0);
    id v21 = @"PEER_PAYMENT_NETWORK_ERROR_MESSAGE";
    goto LABEL_21;
  }
  unint64_t v22 = [v3 domain];
  int v23 = [v22 isEqualToString:@"PKWebServiceErrorDomain"];

  if (v23)
  {
    uint64_t v24 = [v3 code];
    if ((unint64_t)(v24 - 2) >= 4 && v24) {
      goto LABEL_42;
    }
    uint64_t v8 = [v3 localizedFailureReason];

    if (!v8)
    {
      uint64_t v11 = 0;
      uint64_t v9 = 0;
      goto LABEL_35;
    }
LABEL_19:
    uint64_t v8 = [v3 localizedFailureReason];
    uint64_t v28 = [v3 localizedRecoverySuggestion];
LABEL_22:
    uint64_t v9 = v28;
    goto LABEL_23;
  }
  long long v25 = [v3 domain];
  int v26 = [v25 isEqualToString:@"PKPaymentWebServiceErrorDomain"];

  if (v26)
  {
    long long v27 = [v3 localizedFailureReason];

    if (!v27) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_42:
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
LABEL_35:
  if (v8 | v9)
  {
    long long v34 = PKDisplayableErrorCustomWithType(-1, (void *)v8, (void *)v9, v3, v11);
  }
  else
  {
    long long v34 = 0;
  }

  return v34;
}

+ (unint64_t)proposedResolutionForError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"PKDisplayableError"];

  int v7 = v4;
  if (v6)
  {
    uint64_t v8 = [v4 userInfo];
    int v7 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if ([a1 errorIsTermsAcceptanceRequiredError:v7])
  {
    unint64_t v9 = 2;
  }
  else if ([a1 errorIsIdentityVerificationRequiredError:v7])
  {
    unint64_t v9 = 3;
  }
  else
  {
    uint64_t v10 = [v7 domain];
    if ([v10 isEqualToString:@"PKWebServiceErrorDomain"])
    {
      unint64_t v9 = [v7 code] != 1;
    }
    else
    {

      unint64_t v9 = 1;
    }
  }

  return v9;
}

+ (BOOL)errorIsIdentityVerificationRequiredError:(id)a3
{
  return PKPeerPaymentWebServiceErrorIsIdentityVerificationRequiredError(a3);
}

+ (BOOL)errorIsTermsAcceptanceRequiredError:(id)a3
{
  return PKPeerPaymentWebServiceErrorIsTermsAcceptanceRequiredError(a3);
}

+ (id)_paymentNotCompletedErrorWithError:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() displayableErrorForError:v3];

  uint64_t v5 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_12.isa, 0);
  int v6 = [v4 localizedRecoverySuggestion];
  int v7 = [v4 userInfo];
  uint64_t v8 = PKDisplayableErrorCustomWithType(-1, v5, v6, 0, v7);

  return v8;
}

+ (id)_peerPaymentPassURL
{
  if (+[PKWalletVisibility isWalletVisible])
  {
    id v2 = +[PKPeerPaymentService sharedInstance];
    id v3 = [v2 account];
    id v4 = [v3 associatedPassUniqueID];

    uint64_t v5 = [NSString stringWithFormat:@"shoebox://cards/%@", v4];
    int v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  }
  else
  {
    int v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSBOOK&path="];
  }
  return v6;
}

+ (id)displayNameForAddress:(id)a3 contactResolver:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [(id)objc_opt_class() _displayNameForRecipientAddress:v6 contactResolver:v5 foundInContacts:0];

  return v7;
}

- (id)displayNameForRecipientAddress:(id)a3
{
  return [(PKPeerPaymentController *)self displayNameForRecipientAddress:a3 foundInContacts:0];
}

- (id)displayNameForRecipientAddress:(id)a3 foundInContacts:(BOOL *)a4
{
  id v6 = a3;
  int v7 = objc_opt_class();
  uint64_t v8 = [(PKPeerPaymentController *)self _contactResolver];
  unint64_t v9 = [v7 _displayNameForRecipientAddress:v6 contactResolver:v8 foundInContacts:a4];

  return v9;
}

+ (id)_displayNameForRecipientAddress:(id)a3 contactResolver:(id)a4 foundInContacts:(BOOL *)a5
{
  id v7 = a3;
  uint64_t v8 = [a4 contactForHandle:v7];
  unint64_t v9 = (void *)v8;
  if (a5) {
    *a5 = v8 != 0;
  }
  uint64_t v10 = +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:v7 contact:v8];

  return v10;
}

- (id)contactForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentController *)self _contactResolver];
  id v6 = [v5 contactForHandle:v4];

  return v6;
}

- (id)_contactResolver
{
  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v5 = +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys];
    id v6 = [[PKContactResolver alloc] initWithContactStore:v4 keysToFetch:v5];
    id v7 = self->_contactResolver;
    self->_contactResolver = v6;

    contactResolver = self->_contactResolver;
  }
  return contactResolver;
}

- (id)summaryItemsForQuote:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v76 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v4 items];
  id v6 = [v4 totalFees];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28C28] zero];
    int v8 = [v6 isEqualToNumber:v7] ^ 1;
  }
  else
  {
    int v8 = 0;
  }
  is = self->_is;
  recipient = is->recipient;
  int v74 = v8;
  if (recipient || is->mode == 2)
  {
    if (v8)
    {
      uint64_t v11 = [(PKPeerPaymentRecipient *)recipient displayName];
      id v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra.isa, &stru_1EE0F6808.isa, v11);

      uint64_t v13 = [v4 totalReceiveAmount];
      uint64_t v14 = +[PKPaymentSummaryItem summaryItemWithLabel:v12 amount:v13 type:1];

      [v76 addObject:v14];
    }
    else
    {
      int v15 = [v4 items];
      uint64_t v16 = [v15 count];

      if (v16 == 1 || ([v4 isRecurringPayment] & 1) != 0)
      {
        uint64_t v17 = 0;
        goto LABEL_68;
      }
    }
  }
  v71 = v6;
  v72 = v5;
  id v73 = v4;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v5;
  uint64_t v80 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
  if (v80)
  {
    v75 = 0;
    uint64_t v79 = *(void *)v83;
    v77 = self;
LABEL_13:
    uint64_t v18 = 0;
    while (2)
    {
      if (*(void *)v83 != v79) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(*((void *)&v82 + 1) + 8 * v18);
      int v20 = [v19 fees];
      id v21 = [v19 totalAmount];
      switch([v19 type])
      {
        case 1:
          unint64_t v22 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTop.isa, 0);
          if (!self->_is->recipient)
          {
            int v23 = [(PKPass *)self->_peerPaymentPass localizedDescription];
            PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTop_0.isa, &stru_1EE0F6808.isa, v23);
            goto LABEL_33;
          }
          int v23 = [v19 dpanIdentifier];
          uint64_t v24 = +[PKPassLibrary sharedInstance];
          long long v25 = [v24 passWithDPANIdentifier:v23];

          if (!v25)
          {
            uint64_t v43 = PKLogFacilityTypeGetObject(0xBuLL);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v43, OS_LOG_TYPE_DEFAULT, "Could not find alternate funding source by DPAN identifier. Displaying unknown card line item.", buf, 2u);
            }

            long long v35 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_2.isa, 0);
            int v41 = 0;
            goto LABEL_51;
          }
          int v26 = [v25 localizedDescription];
          if ([v26 length])
          {
            if (v20)
            {
              long long v27 = [MEMORY[0x1E4F28C28] zero];
              char v28 = [v20 isEqualToNumber:v27];

              if ((v28 & 1) == 0)
              {
                v53 = [PKCurrencyAmount alloc];
                id v54 = [v19 feesCurrency];
                id v55 = [(PKCurrencyAmount *)v53 initWithAmount:v20 currency:v54 exponent:0];

                uint64_t v56 = [(PKCurrencyAmount *)v55 formattedStringValue];
                long long v35 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_0.isa, &stru_1EE105568.isa, v26, v56);

                int v41 = 1;
                goto LABEL_50;
              }
            }
            PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_1.isa, &stru_1EE0F6808.isa, v26);
          }
          else
          {
            uint64_t v46 = PKLogFacilityTypeGetObject(0xBuLL);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v46, OS_LOG_TYPE_DEFAULT, "Could not get description for alternate funding source pass. Displaying unknown card line item.", buf, 2u);
            }

            PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_2.isa, 0, v70);
          long long v35 = };
          int v41 = 0;
LABEL_50:

LABEL_51:
          self = v77;

          goto LABEL_52;
        case 2:
          unint64_t v22 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_3.isa, 0);
          int v23 = [(PKPass *)self->_peerPaymentPass localizedDescription];
          PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_1.isa, &stru_1EE0F6808.isa, v23);
          long long v35 = LABEL_33:;
          goto LABEL_34;
        case 3:
          unint64_t v22 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCas.isa, 0);
          long long v29 = NSString;
          uint64_t v30 = self->_is->accountName;
          id v31 = PKPANMask();
          if (self->_is->accountNumber) {
            accountNumber = (__CFString *)self->_is->accountNumber;
          }
          else {
            accountNumber = &stru_1EE0F5368;
          }
          long long v33 = PKFPANSuffixFromFPAN(accountNumber);
          long long v34 = [v29 stringWithFormat:@"(%@%@)", v31, v33];
          int v23 = PKLTRString((uint64_t)v34);

          self = v77;
          long long v35 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCas_0.isa, &stru_1EE105568.isa, v30, v23);

LABEL_34:
          int v41 = 0;
          goto LABEL_52;
        case 4:
          unint64_t v22 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentIns_3.isa, 0);
          uint64_t v36 = [v19 receiveAmount];

          int v23 = [v19 dpanIdentifier];
          uint64_t v37 = +[PKPassLibrary sharedInstance];
          id v38 = [v37 passWithDPANIdentifier:v23];

          if (v38)
          {
            uint64_t v39 = [v38 localizedDescription];
            if ([v39 length])
            {
              id v40 = v39;
            }
            else
            {
              id v44 = PKLogFacilityTypeGetObject(0xBuLL);
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_190E10000, v44, OS_LOG_TYPE_DEFAULT, "Could not get description for alternate funding source pass. Displaying unknown card line item.", buf, 2u);
              }

              PKLocalizedPeerPaymentString(&cfstr_PeerPaymentIns_4.isa, 0);
              id v40 = (id)objc_claimAutoreleasedReturnValue();
            }
            long long v35 = v40;

            self = v77;
          }
          else
          {
            id v42 = PKLogFacilityTypeGetObject(0xBuLL);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v42, OS_LOG_TYPE_DEFAULT, "Could not find alternate funding source by DPAN identifier. Displaying unknown card line item.", buf, 2u);
            }

            long long v35 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentIns_4.isa, 0);
          }
          uint64_t v45 = [v35 copy];

          int v41 = 0;
          id v21 = (void *)v36;
          v75 = (void *)v45;
LABEL_52:

          if (!v41)
          {
            if (v22)
            {
              if (v20)
              {
                id v47 = [MEMORY[0x1E4F28C28] zero];
                char v48 = [v20 isEqualToNumber:v47];

                if ((v48 & 1) == 0)
                {
                  uint64_t v49 = +[PKPaymentSummaryItem summaryItemWithLabel:v22 amount:v20];
                  [v76 addObject:v49];
                }
              }
            }
          }
          if (v35)
          {
            if (v21)
            {
              __int16 v50 = [MEMORY[0x1E4F28C28] zero];
              char v51 = [v21 isEqualToNumber:v50];

              if ((v51 & 1) == 0)
              {
                __int16 v52 = +[PKPaymentSummaryItem summaryItemWithLabel:v35 amount:v21];
                [v76 addObject:v52];
              }
            }
          }
          goto LABEL_61;
        default:
          long long v35 = 0;
          unint64_t v22 = 0;
LABEL_61:

          if (v80 != ++v18) {
            continue;
          }
          uint64_t v57 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
          uint64_t v80 = v57;
          if (!v57) {
            goto LABEL_67;
          }
          goto LABEL_13;
      }
    }
  }
  v75 = 0;
LABEL_67:

  id v5 = v72;
  id v4 = v73;
  id v6 = v71;
  uint64_t v17 = (NSString *)v75;
LABEL_68:
  v58 = [v4 calculatedTotalAmount];
  id v59 = self->_is;
  v60 = v59->recipient;
  if (v60)
  {
    if (!v74)
    {
      v63 = [(PKPeerPaymentRecipient *)v60 displayName];
      v64 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_5.isa, &stru_1EE0F6808.isa, v63);

      goto LABEL_80;
    }
    id v61 = @"PEER_PAYMENT_TRANSFER_WITH_FEES_TOTAL_DESCRIPTION";
  }
  else
  {
    if (v59->mode == 2)
    {
      uint64_t v62 = PKLocalizedNearbyPeerPaymentString(&cfstr_TransferAmount.isa, 0);
      goto LABEL_79;
    }
    __int16 v65 = [v4 firstQuoteItemOfType:1];

    if (!v65)
    {
      if (!v17) {
        uint64_t v17 = self->_is->accountName;
      }
      PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCas_1.isa, &stru_1EE0F6808.isa, v17);
      goto LABEL_72;
    }
    if (self->_is->threshold)
    {
      uint64_t v62 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentSheetRe.isa, 0);
      goto LABEL_79;
    }
    id v61 = @"PEER_PAYMENT_TOP_UP_TOTAL";
  }
  PKLocalizedPeerPaymentString(&v61->isa, 0, v70);
  uint64_t v62 = LABEL_72:;
LABEL_79:
  v64 = (void *)v62;
LABEL_80:
  id v66 = [v58 amount];
  uint64_t v67 = +[PKPaymentSummaryItem summaryItemWithLabel:v64 amount:v66];
  [v76 addObject:v67];

  v68 = (void *)[v76 copy];
  return v68;
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_quoteAuthorizationCoordinator == v4)
  {
    id v5 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v9 = self;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0xCu);
    }

    quoteAuthorizationCoordinator = self->_quoteAuthorizationCoordinator;
    self->_quoteAuthorizationCoordinator = 0;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PKPeerPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v7[3] = &unk_1E56D8AE0;
    v7[4] = self;
    [(PKPaymentAuthorizationCoordinator *)v4 dismissWithCompletion:v7];
  }
}

void __68__PKPeerPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = 96;
  if (!*(unsigned char *)(v1 + 88)) {
    uint64_t v2 = 56;
  }
  dispatch_group_leave(*(dispatch_group_t *)(v1 + v2));
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v8 = (PKPaymentAuthorizationCoordinator *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_quoteAuthorizationCoordinator != v8) {
    goto LABEL_42;
  }
  uint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)id v40 = self;
    *(_WORD *)&v40[8] = 2112;
    id v41 = v9;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: paymentAuthorizationCoordinator:didSelectPaymentMethod: %@ callback called.", buf, 0x16u);
  }

  id v12 = [v9 paymentPass];
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 devicePrimaryInAppPaymentApplication];
    int v15 = [v14 dpanIdentifier];

    if (v15)
    {
      uint64_t v16 = [(PKPeerPaymentQuoteRequest *)self->_is->quoteRequest dpanIdentifier];
      int v17 = [v16 isEqualToString:v15] ^ 1;
    }
    else
    {
      int v17 = 0;
    }
  }
  else
  {
    int v17 = 0;
    int v15 = 0;
  }
  is = self->_is;
  if (!is->supportsPreserveCurrentBalance
    || ![(PKPeerPaymentController *)self _modeIsSendType:is->mode])
  {
    int v26 = 0;
    goto LABEL_29;
  }
  uint64_t v19 = [(PKPeerPaymentController *)self _defaultAlternateFundingSourceForMode:self->_is->mode];
  int v20 = (void *)v19;
  if (v19)
  {
    uint64_t v36 = (void *)v19;
    int v21 = [v9 usePeerPaymentBalance];
    unint64_t v22 = [(PKPeerPaymentQuote *)self->_is->quote firstQuoteItemOfType:2];

    int v23 = [(PKPeerPaymentQuote *)self->_is->quote preservesCurrentBalance];
    int v24 = v21;
    unsigned int v35 = v21 ^ 1;
    if (v21 == v23)
    {
      char v33 = v21;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Toggled use peer payment balance. Getting a new quote.", buf, 2u);
      }

      [(PKPeerPaymentQuoteRequest *)self->_is->quoteRequest setPreserveCurrentBalance:v21 ^ 1u];
      int v26 = 1;
      int v20 = v36;
      if (v33) {
        goto LABEL_27;
      }
    }
    else
    {
      int v25 = v22 != 0;
      if (v24 == v25)
      {
        int v26 = 0;
        int v20 = v36;
        if (v24)
        {
LABEL_27:
          [(PKPeerPaymentController *)self updatePreservePeerPaymentBalanceSetting:v35];
          goto LABEL_28;
        }
      }
      else
      {
        char v32 = v24;
        int v20 = v36;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)id v40 = v25;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)&v40[6] = v35;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Current quote (currentQuoteHasTransferItem: %d) does not match preference for preserveCurrentBalance: %d. Getting a new quote.", buf, 0xEu);
        }

        int v26 = 1;
        if (v32) {
          goto LABEL_27;
        }
      }
    }
    long long v27 = [(PKPeerPaymentQuoteRequest *)self->_is->quoteRequest dpanIdentifier];
    uint64_t v34 = [v27 length];

    int v20 = v36;
    if (!v34) {
      [(PKPeerPaymentQuoteRequest *)self->_is->quoteRequest updateWithPaymentPass:v36 externalFundingSource:1];
    }
    goto LABEL_27;
  }
  [(PKPeerPaymentQuoteRequest *)self->_is->quoteRequest setPreserveCurrentBalance:0];
  int v26 = 0;
LABEL_28:

LABEL_29:
  if (((v17 | v26) & 1) != 0 || [(PKPeerPaymentQuote *)self->_is->quote hasExpired])
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v28 = [(PKPeerPaymentQuoteRequest *)self->_is->quoteRequest preserveCurrentBalance];
      long long v29 = @"disabled";
      *(_DWORD *)buf = 134218498;
      *(void *)id v40 = self;
      *(_WORD *)&v40[8] = 2112;
      if (v28) {
        long long v29 = @"enabled";
      }
      id v41 = v15;
      __int16 v42 = 2112;
      uint64_t v43 = v29;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Requesting updated quote for dpan %@ with 'preserveCurrentBalance' = %@.", buf, 0x20u);
    }

    if (v13) {
      [(PKPeerPaymentQuoteRequest *)self->_is->quoteRequest updateWithPaymentPass:v13];
    }
    [(PKPeerPaymentQuoteRequest *)self->_is->quoteRequest setHasUpdatedPaymentMethod:1];
    quoteRequest = self->_is->quoteRequest;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __90__PKPeerPaymentController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke;
    void v37[3] = &unk_1E56E1300;
    v37[4] = self;
    id v38 = v10;
    [(PKPeerPaymentController *)self _requestQuoteWithRequest:quoteRequest withCompletion:v37];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)id v40 = self;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: New quote request is not required. Returning: PKPaymentAuthorizationStatusSuccess to the authorization controller.", buf, 0xCu);
    }

    [(PKPeerPaymentQuoteRequest *)self->_is->quoteRequest setHasUpdatedPaymentMethod:0];
    id v31 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
    [(PKPaymentRequestUpdate *)v31 setStatus:0];
    (*((void (**)(id, PKPaymentRequestPaymentMethodUpdate *))v10 + 2))(v10, v31);
  }
LABEL_42:
}

void __90__PKPeerPaymentController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  id v9 = v8;
  if (!v6 || v7)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), a4);
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
    [(PKPaymentRequestUpdate *)v9 setStatus:1];
    uint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v19 = 134218242;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      id v22 = v7;
      uint64_t v13 = "PKPeerPaymentController %p: Error: Get updated quote failed with error: %@ Returning: PKPaymentAuthorization"
            "StatusFailure to the authorization controller.";
      uint64_t v14 = v11;
      uint32_t v15 = 22;
      goto LABEL_7;
    }
  }
  else
  {
    [(PKPaymentRequestPaymentMethodUpdate *)v8 setPeerPaymentQuote:v6];
    id v10 = [*(id *)(a1 + 32) summaryItemsForQuote:v6];
    [(PKPaymentRequestUpdate *)v9 setPaymentSummaryItems:v10];

    [(PKPaymentRequestUpdate *)v9 setStatus:0];
    uint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v19 = 134217984;
      uint64_t v20 = v12;
      uint64_t v13 = "PKPeerPaymentController %p: Get updated quote succeeded. Returning: PKPaymentAuthorizationStatusSuccess to t"
            "he authorization controller.";
      uint64_t v14 = v11;
      uint32_t v15 = 12;
LABEL_7:
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
    }
  }

  (*(void (**)(void, PKPaymentRequestPaymentMethodUpdate *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9, v17, v18);
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = [WeakRetained presentationSceneIdentifierForPeerPaymentController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)presentationSceneBundleIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = [WeakRetained presentationSceneBundleIdentifierForPeerPaymentController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_contactInfoIsValidForAuthorizedQuote:(id)a3 errors:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_is->mode - 5 <= 1)
  {
    int v8 = [v6 contact];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 name];
      uint64_t v11 = v10;
      if (v10)
      {
        uint64_t v12 = [v10 givenName];
        if (![v12 length])
        {
          uint64_t v13 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_3.isa, 0);
          uint64_t v14 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"name" localizedDescription:v13];
          [v7 addObject:v14];
        }
        uint32_t v15 = [v11 familyName];
        if (![v15 length])
        {
          uint64_t v16 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_4.isa, 0);
          uint64_t v17 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"name" localizedDescription:v16];
          [v7 addObject:v17];
        }
      }
      else
      {
        uint64_t v12 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo.isa, 0);
        uint32_t v15 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"name" localizedDescription:v12];
        [v7 addObject:v15];
      }

      int v19 = [v9 postalAddress];
      uint64_t v18 = v19;
      if (v19)
      {
        uint64_t v20 = [v19 street];
        uint64_t v21 = [v20 length];

        if (!v21)
        {
          id v22 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_5.isa, 0);
          uint64_t v23 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"post" localizedDescription:v22];
          [v7 addObject:v23];
        }
        int v24 = [v18 city];
        uint64_t v25 = [v24 length];

        if (!v25)
        {
          int v26 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_6.isa, 0);
          long long v27 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"post" localizedDescription:v26];
          [v7 addObject:v27];
        }
        BOOL v28 = [v18 state];
        uint64_t v29 = [v28 length];

        if (!v29)
        {
          uint64_t v30 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_7.isa, 0);
          id v31 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"post" localizedDescription:v30];
          [v7 addObject:v31];
        }
        char v32 = [v18 postalCode];
        uint64_t v33 = [v32 length];

        if (!v33)
        {
          uint64_t v34 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_8.isa, 0);
          unsigned int v35 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"post" localizedDescription:v34];
          [v7 addObject:v35];
        }
        uint64_t v36 = [v18 country];
        uint64_t v37 = [v36 length];

        if (v37) {
          goto LABEL_23;
        }
        id v38 = @"IN_APP_PAYMENT_CONTACT_INVALID_COUNTRY";
      }
      else
      {
        id v38 = @"IN_APP_PAYMENT_CONTACT_INVALID_BILLING_ADDRESS";
      }
      uint64_t v39 = PKLocalizedPaymentString(&v38->isa, 0);
      id v40 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"post" localizedDescription:v39];
      [v7 addObject:v40];
    }
    else
    {
      uint64_t v11 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_10.isa, 0);
      uint64_t v18 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"post" localizedDescription:v11];
      [v7 addObject:v18];
    }
LABEL_23:
  }
  if (a4) {
    *a4 = (id)[v7 copy];
  }
  BOOL v41 = [v7 count] == 0;

  return v41;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePeerPaymentQuote:(id)a4 handler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v8 = (PKPaymentAuthorizationCoordinator *)a3;
  id v9 = (PKPaymentAuthorizationResult *)a4;
  id v10 = a5;
  if (self->_quoteAuthorizationCoordinator == v8)
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      long long v27 = v9;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: paymentAuthorizationCoordinator:didAuthorizePeerPaymentQuote: %@ callback called.", buf, 0x16u);
    }

    if (v9)
    {
      id v23 = 0;
      BOOL v12 = [(PKPeerPaymentController *)self _contactInfoIsValidForAuthorizedQuote:v9 errors:&v23];
      uint64_t v13 = (PKPaymentAuthorizationResult *)v23;
      if (v12)
      {
        is = self->_is;
        self->_quoteAuthorizationSuccess = 1;
        [(PKPaymentAuthorizationResult *)v9 setPaymentMethodType:[(PKPeerPaymentQuoteRequest *)is->quoteRequest paymentMethodType]];
        objc_storeStrong((id *)&self->_is->authorizedQuote, a4);
        quoteAuthorizationError = self->_quoteAuthorizationError;
        self->_quoteAuthorizationError = 0;

        if (self->_performOnAuthorization)
        {
          dispatch_group_leave((dispatch_group_t)self->_quoteAuthorizationGroup);
          performQuoteGroup = self->_performQuoteGroup;
          if (performQuoteGroup) {
            dispatch_group_enter(performQuoteGroup);
          }
          objc_initWeak((id *)buf, self);
          authorizedQuote = self->_is->authorizedQuote;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __96__PKPeerPaymentController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke;
          v20[3] = &unk_1E56E7278;
          objc_copyWeak(&v22, (id *)buf);
          v20[4] = self;
          id v21 = v10;
          [(PKPeerPaymentController *)self _performAuthorizedQuote:authorizedQuote completion:v20];

          objc_destroyWeak(&v22);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          int v19 = objc_alloc_init(PKPaymentAuthorizationResult);
          [(PKPaymentAuthorizationResult *)v19 setStatus:!self->_quoteAuthorizationSuccess];
          (*((void (**)(id, PKPaymentAuthorizationResult *))v10 + 2))(v10, v19);
        }
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v25 = self;
          __int16 v26 = 2112;
          long long v27 = v13;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: contact information was invalid with errors %@. returning PKPaymentAuthorizationStatusFailure.", buf, 0x16u);
        }

        uint64_t v18 = [[PKPaymentAuthorizationResult alloc] initWithStatus:1 errors:v13];
        (*((void (**)(id, PKPaymentAuthorizationResult *))v10 + 2))(v10, v18);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = self;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: authorizedPeerPaymentQuote was nil. returning PKPaymentAuthorizationStatusFailure.", buf, 0xCu);
      }

      uint64_t v13 = [[PKPaymentAuthorizationResult alloc] initWithStatus:1 errors:0];
      (*((void (**)(id, PKPaymentAuthorizationResult *))v10 + 2))(v10, v13);
    }
  }
}

void __96__PKPeerPaymentController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_27;
  }
  id v8 = v6;
  id v9 = objc_alloc_init(PKPaymentAuthorizationResult);
  id v10 = v9;
  if (v5 && !v8)
  {
    [(PKPaymentAuthorizationResult *)v9 setStatus:0];
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 24) devicePrimaryInAppPaymentApplication];
    id v8 = [v11 dpanIdentifier];

    uint64_t v12 = [v5 transactionIdentifier];
    uint64_t v13 = (void *)v12;
    if (v8) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14)
    {
      uint32_t v15 = objc_alloc_init(PKPeerPaymentTransactionMetadata);
      [(PKPeerPaymentTransactionMetadata *)v15 setDPANIdentifier:v8];
      [(PKPeerPaymentTransactionMetadata *)v15 setServiceIdentifier:v13];
      uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) deviceScoreIdentifier];
      [(PKPeerPaymentTransactionMetadata *)v15 setRequestDeviceScoreIdentifier:v16];

      uint64_t v17 = [v5 deviceScoreIdentifier];
      [(PKPeerPaymentTransactionMetadata *)v15 setSendDeviceScoreIdentifier:v17];

      [(PKPaymentAuthorizationResult *)v10 setPeerPaymentTransactionMetadata:v15];
    }
    WeakRetained[112] = 1;

    uint64_t v18 = 0;
    goto LABEL_19;
  }
  [(PKPaymentAuthorizationResult *)v9 setStatus:1];
  int v19 = [v8 domain];
  if (![v19 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"]) {
    goto LABEL_14;
  }
  uint64_t v20 = [v8 code];

  if (v20 == 40397)
  {
    id v21 = [v8 userInfo];
    int v19 = [v21 objectForKey:*MEMORY[0x1E4F28588]];

    if ([v19 length])
    {
      [(PKPaymentAuthorizationResult *)v10 setLocalizedErrorMessageOverride:v19];

      id v8 = 0;
    }
LABEL_14:
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16) == 2) {
    [WeakRetained _resetToState:4];
  }
  WeakRetained[112] = 0;
  if (!v8)
  {
    uint64_t v18 = 0;
    goto LABEL_20;
  }
  uint64_t v18 = [(id)objc_opt_class() _paymentNotCompletedErrorWithError:v8];
LABEL_19:

LABEL_20:
  id v22 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = @"YES";
    uint64_t v24 = *(void *)(a1 + 32);
    int v26 = 134218754;
    if (!v5) {
      id v23 = @"NO";
    }
    uint64_t v27 = v24;
    __int16 v28 = 2112;
    uint64_t v29 = v23;
    __int16 v30 = 2112;
    id v31 = v18;
    __int16 v32 = 2112;
    uint64_t v33 = v10;
    _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: perform quote finished with success: %@, returning error: %@, returning: %@ to the authorization controller.", (uint8_t *)&v26, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  uint64_t v25 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (v25) {
    dispatch_group_leave(v25);
  }

LABEL_27:
}

+ (void)_sendAuthorizedQuoteAnalyticsWithSuccess:(BOOL)a3 mode:(unint64_t)a4 authorizedQuote:(id)a5 status:(int64_t)a6
{
  BOOL v8 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v9;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "NearbyPeerPayment: sending analytics for authorized quote: %@", buf, 0xCu);
  }

  uint64_t v11 = [v9 peerPaymentQuote];
  uint64_t v12 = [v11 totalReceiveAmount];
  uint64_t v13 = (void *)v12;
  if (a4 == 5)
  {
    if (v8)
    {
      uint64_t v27 = @"success";
      __int16 v28 = @"amount";
      uint64_t v29 = MEMORY[0x1E4F1CC38];
      uint64_t v30 = v12;
      BOOL v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint32_t v15 = &v29;
      uint64_t v16 = &v27;
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  if (a4 == 4)
  {
    if (v8)
    {
      id v31 = @"success";
      __int16 v32 = @"amount";
      uint64_t v33 = MEMORY[0x1E4F1CC38];
      uint64_t v34 = v12;
      BOOL v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint32_t v15 = &v33;
      uint64_t v16 = &v31;
LABEL_9:
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 2, v27, v28, v29, v30, v31, v32, v33, v34);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();
LABEL_21:

      goto LABEL_22;
    }
LABEL_15:
    AnalyticsSendEvent();
    goto LABEL_22;
  }
  if (a4 - 1 <= 1)
  {
    if (v8)
    {
      uint64_t v18 = [v11 items];
      uint64_t v19 = [v18 count];

      uint64_t v20 = [v11 items];
      id v21 = v20;
      if (v19 == 1)
      {
        id v22 = [v20 firstObject];

        if ([v22 type] == 1) {
          [v9 paymentMethodType];
        }
        AnalyticsSendEvent();

        goto LABEL_20;
      }
      uint64_t v23 = [v20 count];

      if (v23 != 2)
      {
LABEL_20:
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v24 = PKAnalyticsAmountCategoryForAmount(v13);
        [v17 setObject:v24 forKey:@"p2pAmountCategory"];

        uint64_t v25 = [v11 totalReceiveAmountCurrency];
        [v17 setObject:v25 forKey:@"p2pCurrency"];

        int v26 = PKPeerPaymentStatusToString(a6);
        [v17 setObject:v26 forKey:@"p2pPerformStatus"];

        PKAnalyticsSendEventWithDailyLimit(@"com.apple.wallet.peer.payment.perform", v17, 2);
        goto LABEL_21;
      }
      [v9 paymentMethodType];
    }
    AnalyticsSendEvent();
    goto LABEL_20;
  }
LABEL_22:
}

- (id)internalState
{
  return self->_is;
}

- (void)_setPerformQuoteSuccess:(BOOL)a3
{
  self->_quoteAuthorizationSuccess = a3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; state: %@>",
                       objc_opt_class(),
                       self,
                       self->_is);
}

- (void)updatePreservePeerPaymentBalanceSetting:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PKObject *)self->_peerPaymentPass settings];
  if (((v5 >> 11) & 1) != v3)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFF7FFLL;
    uint64_t v7 = 2048;
    if (!v3) {
      uint64_t v7 = 0;
    }
    peerPaymentPass = self->_peerPaymentPass;
    [(PKObject *)peerPaymentPass setSettings:v6 | v7];
  }
}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (PKPeerPaymentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPeerPaymentControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_performQuoteError, 0);
  objc_storeStrong((id *)&self->_performQuoteCallbackQueue, 0);
  objc_storeStrong((id *)&self->_performQuoteGroup, 0);
  objc_storeStrong((id *)&self->_quoteAuthorizationError, 0);
  objc_storeStrong((id *)&self->_quoteAuthorizationCallbackQueue, 0);
  objc_storeStrong((id *)&self->_quoteAuthorizationGroup, 0);
  objc_storeStrong((id *)&self->_quoteAuthorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_is, 0);
}

- (void)identifyRecipientWithAddress:(id)a3 completion:(id)a4
{
}

- (void)requestTokenForAmount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PKPeerPaymentController_PKDeprecated__requestTokenForAmount_completion___block_invoke;
  v8[3] = &unk_1E56E72A0;
  id v9 = v6;
  id v7 = v6;
  [(PKPeerPaymentController *)self formalRequestTokenForAmount:a3 source:0 completion:v8];
}

void __74__PKPeerPaymentController_PKDeprecated__requestTokenForAmount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v7 = a4;
    id v8 = [a3 requestToken];
    (*(void (**)(uint64_t, uint64_t, id, id))(v4 + 16))(v4, a2, v8, v7);
  }
}

@end