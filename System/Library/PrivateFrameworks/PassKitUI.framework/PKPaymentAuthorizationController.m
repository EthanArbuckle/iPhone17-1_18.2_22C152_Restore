@interface PKPaymentAuthorizationController
+ (BOOL)canMakePayments;
+ (BOOL)canMakePaymentsUsingNetworks:(NSArray *)supportedNetworks;
+ (BOOL)canMakePaymentsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilties;
+ (BOOL)isPlatformSupported;
+ (BOOL)supportsDisbursements;
+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks;
+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilties;
+ (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 completion:(id)a4;
- (PKPaymentAuthorizationController)init;
- (PKPaymentAuthorizationController)initWithCoder:(id)a3;
- (PKPaymentAuthorizationController)initWithDisbursementRequest:(PKDisbursementRequest *)request;
- (PKPaymentAuthorizationController)initWithPaymentRequest:(PKPaymentRequest *)request;
- (PKPaymentAuthorizationControllerPrivateDelegate)privateDelegate;
- (PKPaymentAuthorizationCoordinator)paymentCoordinator;
- (id)delegate;
- (id)presentationSceneBundleIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)dealloc;
- (void)dismissWithCompletion:(void *)completion;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeContextWithHandler:(id)a4;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePeerPaymentQuote:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4;
- (void)paymentAuthorizationCoordinator:(id)a3 didRequestMerchantSessionUpdate:(id)a4;
- (void)paymentAuthorizationCoordinator:(id)a3 didRequestMerchantSessionWithURL:(id)a4 merchantSessionUpdate:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingAddress:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 willFinishWithError:(id)a4;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)paymentAuthorizationCoordinatorWillAuthorizePayment:(id)a3;
- (void)presentWithCompletion:(void *)completion;
- (void)setDelegate:(id)delegate;
- (void)setPaymentCoordinator:(id)a3;
- (void)setPrivateDelegate:(id)a3;
@end

@implementation PKPaymentAuthorizationController

+ (BOOL)isPlatformSupported
{
  if (isPlatformSupported_onceToken_0[0] != -1) {
    dispatch_once(isPlatformSupported_onceToken_0, &__block_literal_global_243);
  }
  return isPlatformSupported_supported_0;
}

void __55__PKPaymentAuthorizationController_isPlatformSupported__block_invoke()
{
  if (PKProcessIsiOSOnMac())
  {
    if (dyld_program_sdk_at_least())
    {
      id v1 = [MEMORY[0x1E4F28B50] mainBundle];
      v0 = [v1 executablePath];
      isPlatformSupported_supported_0 = PKHasImplementationOfSelectorInImage();
    }
    else
    {
      isPlatformSupported_supported_0 = 0;
    }
  }
}

+ (BOOL)canMakePayments
{
  int v2 = [a1 isPlatformSupported];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F84A10];
    LOBYTE(v2) = [v3 canMakePayments];
  }
  return v2;
}

+ (BOOL)canMakePaymentsUsingNetworks:(NSArray *)supportedNetworks
{
  v4 = supportedNetworks;
  if ([a1 isPlatformSupported]) {
    char v5 = [MEMORY[0x1E4F84A10] canMakePaymentsUsingNetworks:v4 webDomain:0];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)canMakePaymentsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilties
{
  v6 = supportedNetworks;
  if ([a1 isPlatformSupported]) {
    char v7 = [MEMORY[0x1E4F84A10] canMakePaymentsUsingNetworks:v6 capabilities:capabilties webDomain:0];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsDisbursements
{
  return [MEMORY[0x1E4F84A10] supportsDisbursements];
}

+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks
{
  return [MEMORY[0x1E4F84A10] supportsDisbursementsUsingNetworks:supportedNetworks];
}

+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilties
{
  return [MEMORY[0x1E4F84A10] supportsDisbursementsUsingNetworks:supportedNetworks capabilities:capabilties];
}

- (PKPaymentAuthorizationController)initWithDisbursementRequest:(PKDisbursementRequest *)request
{
  v4 = (objc_class *)MEMORY[0x1E4F84660];
  char v5 = request;
  v6 = (void *)[[v4 alloc] initWithDisbursementRequest:v5];

  char v7 = [(PKPaymentAuthorizationController *)self initWithPaymentRequest:v6];
  return v7;
}

+ (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F84798]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__PKPaymentAuthorizationController_paymentServicesMerchantURLForAPIType_completion___block_invoke;
  v8[3] = &unk_1E59DB2E8;
  id v9 = v5;
  id v7 = v5;
  [v6 paymentServicesMerchantURLForAPIType:a3 completion:v8];
}

void __84__PKPaymentAuthorizationController_paymentServicesMerchantURLForAPIType_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v8 = v5;
    if (a2)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:0];
      uint64_t v6 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);

    id v5 = v8;
  }
}

- (PKPaymentAuthorizationController)initWithCoder:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"This class is not NSCoding compliant"];

  return [(PKPaymentAuthorizationController *)self init];
}

- (PKPaymentAuthorizationController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F84BE8]);
  v4 = [(PKPaymentAuthorizationController *)self initWithPaymentRequest:v3];

  return v4;
}

- (PKPaymentAuthorizationController)initWithPaymentRequest:(PKPaymentRequest *)request
{
  v4 = request;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentAuthorizationController;
  id v5 = [(PKPaymentAuthorizationController *)&v10 init];
  if (v5)
  {
    if ([(PKPaymentAuthorizationController *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84A10]) initWithPaymentRequest:v4];
      [v6 setDelegate:v5];
      [v6 _setPrivateDelegate:v5];
      paymentCoordinator = v5->_paymentCoordinator;
      v5->_paymentCoordinator = (PKPaymentAuthorizationCoordinator *)v6;
    }
    else
    {
      paymentCoordinator = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(paymentCoordinator, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v9 = 0;
        _os_log_error_impl(&dword_19F450000, paymentCoordinator, OS_LOG_TYPE_ERROR, "PKPaymentAuthorizationController does not support subclassing.", v9, 2u);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationController;
  [(PKPaymentAuthorizationController *)&v2 dealloc];
}

- (void)presentWithCompletion:(void *)completion
{
  v4 = completion;
  kdebug_trace();
  if (self->_paymentCoordinator)
  {
    objc_storeStrong((id *)&self->_retainSelf, self);
    paymentCoordinator = self->_paymentCoordinator;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke;
    v11[3] = &unk_1E59CF408;
    v11[4] = self;
    v12 = v4;
    id v6 = v4;
    [(PKPaymentAuthorizationCoordinator *)paymentCoordinator presentWithCompletion:v11];
    id v7 = v12;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke_69;
    block[3] = &unk_1E59CAA98;
    objc_super v10 = v4;
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v7 = v10;
  }
}

void __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CF278;
  char v5 = a2;
  objc_super v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    objc_super v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v5 = 0;
      _os_log_error_impl(&dword_19F450000, v2, OS_LOG_TYPE_ERROR, "Connection to remote alert view service failed", v5, 2u);
    }

    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:0];
    [*(id *)(a1 + 32) paymentAuthorizationCoordinator:*(void *)(*(void *)(a1 + 32) + 24) willFinishWithError:v3];
    [*(id *)(a1 + 32) paymentAuthorizationCoordinatorDidFinish:*(void *)(*(void *)(a1 + 32) + 24)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

uint64_t __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke_69(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)dismissWithCompletion:(void *)completion
{
  id v4 = completion;
  char v5 = v4;
  paymentCoordinator = self->_paymentCoordinator;
  if (paymentCoordinator)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__PKPaymentAuthorizationController_dismissWithCompletion___block_invoke;
    v7[3] = &unk_1E59CAD68;
    v7[4] = self;
    id v8 = v4;
    [(PKPaymentAuthorizationCoordinator *)paymentCoordinator dismissWithCompletion:v7];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __58__PKPaymentAuthorizationController_dismissWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;

  [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:0];
  char v5 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v5 _setPrivateDelegate:0];
}

- (void)paymentAuthorizationCoordinatorWillAuthorizePayment:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKPaymentAuthorizationController_paymentAuthorizationCoordinatorWillAuthorizePayment___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__PKPaymentAuthorizationController_paymentAuthorizationCoordinatorWillAuthorizePayment___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v4 paymentAuthorizationControllerWillAuthorizePayment:*(void *)(a1 + 32)];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v3 = objc_opt_respondsToSelector();

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v4;
  if (v3)
  {
    [v4 paymentAuthorizationController:v5 didAuthorizePayment:v6 handler:*(void *)(a1 + 48)];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2;
    v8[3] = &unk_1E59DB338;
    id v9 = *(id *)(a1 + 48);
    [v7 paymentAuthorizationController:v5 didAuthorizePayment:v6 completion:v8];
  }
}

void __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F84A30]);
  [v4 setStatus:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKPaymentAuthorizationController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __77__PKPaymentAuthorizationController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained paymentAuthorizationControllerDidFinish:*(void *)(a1 + 32)];

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;

  [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:0];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v5 _setPrivateDelegate:0];
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v3 = objc_opt_respondsToSelector();

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v9 = v4;
  if (v3)
  {
    [v4 paymentAuthorizationController:*(void *)(a1 + 32) didSelectShippingMethod:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke_2;
      v10[3] = &unk_1E59DB360;
      id v11 = *(id *)(a1 + 48);
      [v6 paymentAuthorizationController:v7 didSelectShippingMethod:v8 completion:v10];

      return;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F84C10]);
    [v9 setStatus:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = (objc_class *)MEMORY[0x1E4F84C10];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setStatus:a2];
  [v7 setPaymentSummaryItems:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingAddress:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  id v12 = v7;
  id v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __101__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F845D0]) initWithCNContact:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  char v4 = objc_opt_respondsToSelector();

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  id v6 = v5;
  if (v4)
  {
    [v5 paymentAuthorizationController:*(void *)(a1 + 40) didSelectShippingContact:v2 handler:*(void *)(a1 + 48)];
LABEL_6:

    goto LABEL_7;
  }
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F84C08]);
    [v6 setStatus:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_6;
  }
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_2;
  v10[3] = &unk_1E59DB388;
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [v8 paymentAuthorizationController:v9 didSelectShippingContact:v2 completion:v10];

LABEL_7:
}

void __101__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  char v7 = (objc_class *)MEMORY[0x1E4F84C08];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v11 = (id)[v10 initWithErrors:MEMORY[0x1E4F1CBF0] paymentSummaryItems:v8 shippingMethods:v9];

  [v11 setStatus:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v3 = objc_opt_respondsToSelector();

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v9 = v4;
  if (v3)
  {
    [v4 paymentAuthorizationController:*(void *)(a1 + 32) didSelectPaymentMethod:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke_2;
      v10[3] = &unk_1E59CACF0;
      id v11 = *(id *)(a1 + 48);
      [v6 paymentAuthorizationController:v7 didSelectPaymentMethod:v8 completion:v10];

      return;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F84C00]);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (objc_class *)MEMORY[0x1E4F84C00];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setPaymentSummaryItems:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationCoordinator:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didChangeCouponCode_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didChangeCouponCode_handler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained paymentAuthorizationController:a1[4] didChangeCouponCode:a1[5] handler:a1[6]];
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F84BF0]);
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = [WeakRetained presentationWindowForPaymentAuthorizationController:self];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [v5 windowScene];
  id v7 = [v6 _sceneIdentifier];

  id v8 = objc_loadWeakRetained((id *)&self->_privateDelegate);
  if (![v7 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = [v8 presentationSceneIdentifierForPaymentAuthorizationController:self];

    id v7 = (void *)v9;
  }

  return v7;
}

- (id)presentationSceneBundleIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = [WeakRetained presentationSceneBundleIdentifierForPaymentAuthorizationController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)paymentAuthorizationCoordinator:(id)a3 willFinishWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_willFinishWithError___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __88__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_willFinishWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v4 paymentAuthorizationController:*(void *)(a1 + 32) willFinishWithError:*(void *)(a1 + 40)];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didRequestMerchantSessionUpdate:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke;
  v7[3] = &unk_1E59CAD18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v3 = objc_opt_respondsToSelector();

  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    id v9 = objc_loadWeakRetained((id *)(v4 + 16));
    [v9 paymentAuthorizationController:*(void *)(a1 + 32) didRequestMerchantSessionUpdate:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)(v4 + 32));
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke_2;
      v10[3] = &unk_1E59DB310;
      uint64_t v8 = *(void *)(a1 + 32);
      id v11 = *(id *)(a1 + 40);
      [v7 paymentAuthorizationController:v8 didRequestMerchantSession:v10];

      return;
    }
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F84BF8]) initWithStatus:1 merchantSession:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2) {
    BOOL v4 = a3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = !v4;
  char v6 = (objc_class *)MEMORY[0x1E4F84BF8];
  id v7 = a2;
  id v8 = (id)[[v6 alloc] initWithStatus:v5 merchantSession:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationCoordinator:(id)a3 didRequestMerchantSessionWithURL:(id)a4 merchantSessionUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __123__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionWithURL_merchantSessionUpdate___block_invoke;
  v14[3] = &unk_1E59CE9B0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __123__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionWithURL_merchantSessionUpdate___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  char v3 = objc_opt_respondsToSelector();

  BOOL v4 = (id *)a1[4];
  if (v3)
  {
    id v7 = objc_loadWeakRetained(v4 + 4);
    [v7 paymentAuthorizationController:a1[4] didRequestMerchantSessionWithURL:a1[5] merchantSessionUpdate:a1[7]];
  }
  else
  {
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    [v4 paymentAuthorizationCoordinator:v5 didRequestMerchantSessionUpdate:v6];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeContextWithHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke;
  v7[3] = &unk_1E59CAD18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v6 paymentAuthorizationController:*(void *)(a1 + 32) didAuthorizeContextWithHandler:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = objc_alloc(MEMORY[0x1E4F84A30]);
    id v6 = (id)[v5 initWithStatus:1 errors:MEMORY[0x1E4F1CBF0]];
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)(a1[4] + 32));
    [v5 paymentAuthorizationController:a1[4] didAuthorizePurchase:a1[5] completion:a1[6]];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(a1[6] + 16);
    v4();
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePeerPaymentQuote:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __105__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = objc_loadWeakRetained((id *)(a1[4] + 32));
    [v6 paymentAuthorizationController:a1[4] didAuthorizePeerPaymentQuote:a1[5] handler:a1[6]];
  }
  else
  {
    uint64_t v4 = a1[6];
    id v5 = objc_alloc(MEMORY[0x1E4F84A30]);
    id v6 = (id)[v5 initWithStatus:1 errors:MEMORY[0x1E4F1CBF0]];
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didEncounterAuthorizationEvent___block_invoke;
  v4[3] = &unk_1E59CB460;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didEncounterAuthorizationEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v4 paymentAuthorizationController:*(void *)(a1 + 32) didEncounterAuthorizationEvent:*(void *)(a1 + 40)];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __113__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 32));
    [v4 paymentAuthorizationController:a1[4] didUpdateAccountServicePaymentMethod:a1[5] handler:a1[6]];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __111__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 32));
    [v4 paymentAuthorizationController:a1[4] didAuthorizeApplePayTrustSignature:a1[5] handler:a1[6]];
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (PKPaymentAuthorizationCoordinator)paymentCoordinator
{
  return self->_paymentCoordinator;
}

- (void)setPaymentCoordinator:(id)a3
{
}

- (PKPaymentAuthorizationControllerPrivateDelegate)privateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateDelegate);

  return (PKPaymentAuthorizationControllerPrivateDelegate *)WeakRetained;
}

- (void)setPrivateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_storeStrong((id *)&self->_paymentCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_retainSelf, 0);
}

@end