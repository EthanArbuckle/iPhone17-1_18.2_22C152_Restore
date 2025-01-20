@interface PKPaymentAuthorizationViewController
+ (BOOL)canMakePayments;
+ (BOOL)canMakePaymentsUsingNetworks:(NSArray *)supportedNetworks;
+ (BOOL)canMakePaymentsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilties;
+ (BOOL)isPlatformSupported;
+ (BOOL)supportsDisbursements;
+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks;
+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilities;
+ (void)paymentServicesMerchantURL:(id)a3;
+ (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 completion:(id)a4;
- (BOOL)_requiresPresentationContext;
- (BOOL)viewHasAppeared;
- (PKPaymentAuthorizationCoordinator)paymentCoordinator;
- (PKPaymentAuthorizationViewController)initWithCoder:(id)a3;
- (PKPaymentAuthorizationViewController)initWithDisbursementRequest:(PKDisbursementRequest *)request;
- (PKPaymentAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKPaymentAuthorizationViewController)initWithPaymentRequest:(PKPaymentRequest *)request;
- (PKPaymentAuthorizationViewControllerPrivateDelegate)privateDelegate;
- (id)delegate;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (int64_t)modalPresentationStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_presentInAppPaymentInterface;
- (void)_presentInAppPaymentInterfaceWithWindow:(id)a3;
- (void)dealloc;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
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
- (void)setDelegate:(id)delegate;
- (void)setPaymentCoordinator:(id)a3;
- (void)setPrivateDelegate:(id)a3;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPaymentAuthorizationViewController

+ (BOOL)isPlatformSupported
{
  if (isPlatformSupported_onceToken != -1) {
    dispatch_once(&isPlatformSupported_onceToken, &__block_literal_global_179);
  }
  return isPlatformSupported_supported;
}

void __59__PKPaymentAuthorizationViewController_isPlatformSupported__block_invoke()
{
  if (PKProcessIsiOSOnMac())
  {
    if (dyld_program_sdk_at_least())
    {
      id v1 = [MEMORY[0x1E4F28B50] mainBundle];
      v0 = [v1 executablePath];
      isPlatformSupported_supported = PKHasImplementationOfSelectorInImage();
    }
    else
    {
      isPlatformSupported_supported = 0;
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

+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilities
{
  return [MEMORY[0x1E4F84A10] supportsDisbursementsUsingNetworks:supportedNetworks capabilities:capabilities];
}

- (PKPaymentAuthorizationViewController)initWithDisbursementRequest:(PKDisbursementRequest *)request
{
  v4 = (objc_class *)MEMORY[0x1E4F84660];
  char v5 = request;
  v6 = (void *)[[v4 alloc] initWithDisbursementRequest:v5];

  char v7 = [(PKPaymentAuthorizationViewController *)self initWithPaymentRequest:v6];
  return v7;
}

+ (void)paymentServicesMerchantURL:(id)a3
{
}

+ (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F84798]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__PKPaymentAuthorizationViewController_paymentServicesMerchantURLForAPIType_completion___block_invoke;
  v8[3] = &unk_1E59DB2E8;
  id v9 = v5;
  id v7 = v5;
  [v6 paymentServicesMerchantURLForAPIType:a3 completion:v8];
}

void __88__PKPaymentAuthorizationViewController_paymentServicesMerchantURLForAPIType_completion___block_invoke(uint64_t a1, char a2, void *a3)
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

- (PKPaymentAuthorizationViewController)initWithCoder:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"This class is not NSCoding compliant"];

  return [(PKPaymentAuthorizationViewController *)self init];
}

- (PKPaymentAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F84BE8]);
  uint64_t v6 = [(PKPaymentAuthorizationViewController *)self initWithPaymentRequest:v5];

  return v6;
}

- (PKPaymentAuthorizationViewController)initWithPaymentRequest:(PKPaymentRequest *)request
{
  v4 = (objc_class *)MEMORY[0x1E4F84A10];
  id v5 = request;
  uint64_t v6 = (void *)[[v4 alloc] initWithPaymentRequest:v5];

  if (!v6) {
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentAuthorizationViewController;
  self = [(PKPaymentAuthorizationViewController *)&v10 initWithNibName:0 bundle:0];
  if (self)
  {
    if ([(PKPaymentAuthorizationViewController *)self isMemberOfClass:objc_opt_class()])
    {
      [v6 setDelegate:self];
      [v6 _setPrivateDelegate:self];
      objc_storeStrong((id *)&self->_paymentCoordinator, v6);
      goto LABEL_9;
    }
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_19F450000, v7, OS_LOG_TYPE_ERROR, "PKPaymentAuthorizationViewController does not support subclassing.", v9, 2u);
    }

LABEL_8:
    self = 0;
  }
LABEL_9:

  return self;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationViewController;
  [(PKPaymentAuthorizationViewController *)&v2 dealloc];
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationViewController;
  [(PKPaymentAuthorizationViewController *)&v5 viewWillAppear:v3];
  if (!self->_viewHasAppeared)
  {
    self->_viewHasAppeared = 1;
    if (![(PKPaymentAuthorizationViewController *)self _requiresPresentationContext]) {
      [(PKPaymentAuthorizationViewController *)self _presentInAppPaymentInterface];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationViewController;
  [(PKPaymentAuthorizationViewController *)&v6 viewDidAppear:a3];
  if ([(PKPaymentAuthorizationViewController *)self _requiresPresentationContext])
  {
    v4 = [(PKPaymentAuthorizationViewController *)self view];
    objc_super v5 = [v4 window];
    [(PKPaymentAuthorizationViewController *)self _presentInAppPaymentInterfaceWithWindow:v5];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationViewController;
  [(PKPaymentAuthorizationViewController *)&v4 viewWillDisappear:a3];
  if (([(PKPaymentAuthorizationViewController *)self isBeingDismissed] & 1) != 0
    || ([(PKPaymentAuthorizationViewController *)self isMovingFromParentViewController] & 1) == 0)
  {
    [(PKPaymentAuthorizationCoordinator *)self->_paymentCoordinator setDelegate:0];
    [(PKPaymentAuthorizationCoordinator *)self->_paymentCoordinator _setPrivateDelegate:0];
    [(PKPaymentAuthorizationCoordinator *)self->_paymentCoordinator dismissWithCompletion:0];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didRequestMerchantSessionUpdate:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke;
  v7[3] = &unk_1E59CAD18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  char v3 = objc_opt_respondsToSelector();

  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    id v9 = objc_loadWeakRetained((id *)(v4 + 984));
    [v9 paymentAuthorizationViewController:*(void *)(a1 + 32) didRequestMerchantSessionUpdate:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)(v4 + 1000));
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke_2;
      v10[3] = &unk_1E59DB310;
      uint64_t v8 = *(void *)(a1 + 32);
      id v11 = *(id *)(a1 + 40);
      [v7 paymentAuthorizationViewController:v8 didRequestMerchantSession:v10];

      return;
    }
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F84BF8]) initWithStatus:1 merchantSession:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
  v14[2] = __127__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionWithURL_merchantSessionUpdate___block_invoke;
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

void __127__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionWithURL_merchantSessionUpdate___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1000));
  char v3 = objc_opt_respondsToSelector();

  BOOL v4 = (id *)a1[4];
  if (v3)
  {
    id v7 = objc_loadWeakRetained(v4 + 125);
    [v7 paymentAuthorizationViewController:a1[4] didRequestMerchantSessionWithURL:a1[5] merchantSessionUpdate:a1[7]];
  }
  else
  {
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    [v4 paymentAuthorizationCoordinator:v5 didRequestMerchantSessionUpdate:v6];
  }
}

- (void)paymentAuthorizationCoordinatorWillAuthorizePayment:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinatorWillAuthorizePayment___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __92__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinatorWillAuthorizePayment___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
    [v4 paymentAuthorizationViewControllerWillAuthorizePayment:*(void *)(a1 + 32)];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  char v3 = objc_opt_respondsToSelector();

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v4;
  if (v3)
  {
    [v4 paymentAuthorizationViewController:v5 didAuthorizePayment:v6 handler:*(void *)(a1 + 48)];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2;
    v8[3] = &unk_1E59DB338;
    id v9 = *(id *)(a1 + 48);
    [v7 paymentAuthorizationViewController:v5 didAuthorizePayment:v6 completion:v8];
  }
}

void __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F84A30]);
  [v4 setStatus:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __81__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  [WeakRetained paymentAuthorizationViewControllerDidFinish:*(void *)(a1 + 32)];
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  char v3 = objc_opt_respondsToSelector();

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  id v9 = v4;
  if (v3)
  {
    [v4 paymentAuthorizationViewController:*(void *)(a1 + 32) didSelectShippingMethod:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke_2;
      v10[3] = &unk_1E59DB360;
      id v11 = *(id *)(a1 + 48);
      [v6 paymentAuthorizationViewController:v7 didSelectShippingMethod:v8 completion:v10];

      return;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F84C10]);
    [v9 setStatus:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
  block[2] = __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  id v12 = v7;
  id v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke(uint64_t a1)
{
  objc_super v2 = (void *)[objc_alloc(MEMORY[0x1E4F845D0]) initWithCNContact:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 984));
  char v4 = objc_opt_respondsToSelector();

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 984));
  id v6 = v5;
  if (v4)
  {
    [v5 paymentAuthorizationViewController:*(void *)(a1 + 40) didSelectShippingContact:v2 handler:*(void *)(a1 + 48)];
LABEL_9:

    goto LABEL_10;
  }
  char v7 = objc_opt_respondsToSelector();

  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 984));
  if (v7)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_2;
    v17[3] = &unk_1E59DB388;
    uint64_t v9 = *(void *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    [v8 paymentAuthorizationViewController:v9 didSelectShippingContact:v2 completion:v17];

    id v10 = v18;
  }
  else
  {
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F84C08]);
      [v6 setStatus:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_9;
    }
    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 984));
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 32) ABPerson];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_3;
    v15[3] = &unk_1E59DB388;
    id v16 = *(id *)(a1 + 48);
    [v12 paymentAuthorizationViewController:v13 didSelectShippingAddress:v14 completion:v15];

    id v10 = v16;
  }

LABEL_10:
}

void __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  char v7 = (objc_class *)MEMORY[0x1E4F84C08];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v11 = (id)[v10 initWithErrors:MEMORY[0x1E4F1CBF0] paymentSummaryItems:v8 shippingMethods:v9];

  [v11 setStatus:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  block[2] = __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  char v3 = objc_opt_respondsToSelector();

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  id v9 = v4;
  if (v3)
  {
    [v4 paymentAuthorizationViewController:*(void *)(a1 + 32) didSelectPaymentMethod:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke_2;
      v10[3] = &unk_1E59CACF0;
      id v11 = *(id *)(a1 + 48);
      [v6 paymentAuthorizationViewController:v7 didSelectPaymentMethod:v8 completion:v10];

      return;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F84C00]);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke_2(uint64_t a1, void *a2)
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
  block[2] = __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didChangeCouponCode_handler___block_invoke;
  block[3] = &unk_1E59CE110;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didChangeCouponCode_handler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 984));
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained paymentAuthorizationViewController:a1[4] didChangeCouponCode:a1[5] handler:a1[6]];
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F84BF0]);
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 willFinishWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_willFinishWithError___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __92__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_willFinishWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
    [v4 paymentAuthorizationViewController:*(void *)(a1 + 32) willFinishWithError:*(void *)(a1 + 40)];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didEncounterAuthorizationEvent___block_invoke;
  v4[3] = &unk_1E59CB460;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didEncounterAuthorizationEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
    [v4 paymentAuthorizationViewController:*(void *)(a1 + 32) didEncounterAuthorizationEvent:*(void *)(a1 + 40)];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __117__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke;
  v14[3] = &unk_1E59CB728;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __117__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1000));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 1000));
    [v4 paymentAuthorizationCoordinator:a1[5] didUpdateAccountServicePaymentMethod:a1[6] handler:a1[7]];
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __115__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke;
  v14[3] = &unk_1E59CB728;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __115__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1000));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 1000));
    [v4 paymentAuthorizationCoordinator:a1[5] didAuthorizeApplePayTrustSignature:a1[6] handler:a1[7]];
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  char v3 = [(PKPaymentAuthorizationViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)_presentInAppPaymentInterface
{
}

- (void)_presentInAppPaymentInterfaceWithWindow:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke;
  aBlock[3] = &unk_1E59CDF18;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  paymentCoordinator = self->_paymentCoordinator;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke_77;
  v7[3] = &unk_1E59CA9F8;
  id v8 = v4;
  id v6 = v4;
  [(PKPaymentAuthorizationCoordinator *)paymentCoordinator presentWithCompletion:v7];
}

void __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke_2;
    v7[3] = &unk_1E59CA870;
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke_2(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_19F450000, v2, OS_LOG_TYPE_ERROR, "Connection to remote alert view service failed", v4, 2u);
  }

  [*(id *)(a1 + 32) paymentAuthorizationCoordinator:*(void *)(*(void *)(a1 + 32) + 992) willFinishWithError:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) paymentAuthorizationCoordinatorDidFinish:*(void *)(*(void *)(a1 + 32) + 992)];
}

void __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke_77(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    char v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

- (BOOL)_requiresPresentationContext
{
  return 0;
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

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (PKPaymentAuthorizationViewControllerPrivateDelegate)privateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateDelegate);

  return (PKPaymentAuthorizationViewControllerPrivateDelegate *)WeakRetained;
}

- (void)setPrivateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_storeStrong((id *)&self->_paymentCoordinator, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end