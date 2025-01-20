@interface PKPaymentAuthorizationPaymentUIInterface
- (PKPaymentAuthorizationPaymentUIInterface)initWithContext:(id)a3 configuration:(id)a4;
- (PKPaymentAuthorizationServiceProtocol)serviceDelegate;
- (UIViewController)primaryViewController;
- (id)createPaymentUIInterfaceConfigurationWithContext:(id)a3 configuration:(id)a4;
- (id)createPaymentUIInterfaceWithContext:(id)a3 configuration:(id)a4;
- (void)_startObservingLockButtonPresses;
- (void)_stopObservingLockButtonPresses;
- (void)consumeSinglePressUpForButtonKind:(int64_t)a3;
- (void)dealloc;
- (void)didAppear;
- (void)initializePrimaryViewController;
- (void)invalidate;
- (void)willAppear;
@end

@implementation PKPaymentAuthorizationPaymentUIInterface

- (PKPaymentAuthorizationPaymentUIInterface)initWithContext:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentAuthorizationPaymentUIInterface;
  v9 = [(PKPaymentAuthorizationPaymentUIInterface *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v11 = [(PKPaymentAuthorizationPaymentUIInterface *)v10 createPaymentUIInterfaceWithContext:v7 configuration:v8];
    if (!v11)
    {
      v18 = 0;
      goto LABEL_6;
    }
    paymentUIInterface = v10->_paymentUIInterface;
    v10->_paymentUIInterface = v11;
    v13 = v11;

    uint64_t v14 = [(PKPaymentRequestViewInterface *)v13 serviceDelegate];
    serviceDelegate = v10->_serviceDelegate;
    v10->_serviceDelegate = (PKPaymentAuthorizationServiceProtocol *)v14;

    uint64_t v16 = [(PKPaymentRequestViewInterface *)v13 viewController];
    primaryViewController = v10->_primaryViewController;
    v10->_primaryViewController = (UIViewController *)v16;

    [(PKPaymentAuthorizationPaymentUIInterface *)v10 initializePrimaryViewController];
  }
  v18 = v10;
LABEL_6:

  return v18;
}

- (void)initializePrimaryViewController
{
  [(UIViewController *)self->_primaryViewController setModalPresentationStyle:5];
  id v4 = [(UIViewController *)self->_primaryViewController view];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v3];
}

- (id)createPaymentUIInterfaceWithContext:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPaymentAuthorizationPaymentUIInterface *)self createPaymentUIInterfaceConfigurationWithContext:a3 configuration:v6];
  id v8 = [PKPaymentRequestViewInterface alloc];
  v9 = [v6 host];

  v10 = [(PKPaymentRequestViewInterface *)v8 initWithConfiguration:v7 delegate:v9];

  return v10;
}

- (id)createPaymentUIInterfaceConfigurationWithContext:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(PKPaymentRequestViewInterfaceConfiguration);
  id v8 = [v6 request];
  [(PKPaymentRequestViewInterfaceConfiguration *)v7 setRequest:v8];

  v9 = [v6 hostLocalizedAppName];
  [(PKPaymentRequestViewInterfaceConfiguration *)v7 setLocalizedApplicationName:v9];

  v10 = [v6 hostBundleIdentifier];
  [(PKPaymentRequestViewInterfaceConfiguration *)v7 setBundleIdentifier:v10];

  v11 = [v6 hostApplicationIdentifier];
  [(PKPaymentRequestViewInterfaceConfiguration *)v7 setApplicationIdentifier:v11];

  v12 = [v6 paymentSheetExperiment];

  [(PKPaymentRequestViewInterfaceConfiguration *)v7 setPaymentSheetExperiment:v12];
  v13 = [v5 relevantPassID];
  [(PKPaymentRequestViewInterfaceConfiguration *)v7 setRelevantPassUniqueID:v13];

  uint64_t v14 = [v5 presenter];

  [(PKPaymentRequestViewInterfaceConfiguration *)v7 setPresenter:v14];

  return v7;
}

- (void)willAppear
{
  [(PKPaymentAuthorizationPaymentUIInterface *)self _startObservingLockButtonPresses];
  paymentUIInterface = self->_paymentUIInterface;

  [(PKPaymentRequestViewInterface *)paymentUIInterface performSelector:sel_start];
}

- (void)didAppear
{
  id v2 = [(PKPaymentAuthorizationContext *)self->_context paymentSheetExperiment];
  if ([v2 isAA]) {
    [v2 trackExperimentExposure];
  }
}

- (void)invalidate
{
  [(PKPaymentAuthorizationPaymentUIInterface *)self _stopObservingLockButtonPresses];
  paymentUIInterface = self->_paymentUIInterface;

  [(PKPaymentRequestViewInterface *)paymentUIInterface performSelector:sel_invalidate];
}

- (void)dealloc
{
  [(PKPaymentAuthorizationPaymentUIInterface *)self _stopObservingLockButtonPresses];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationPaymentUIInterface;
  [(PKPaymentAuthorizationPaymentUIInterface *)&v3 dealloc];
}

- (void)_startObservingLockButtonPresses
{
  if (!self->_lockButtonObserver)
  {
    id v5 = [MEMORY[0x1E4FA6AA8] sharedInstance];
    objc_super v3 = [v5 beginConsumingPressesForButtonKind:2 eventConsumer:self priority:0];
    lockButtonObserver = self->_lockButtonObserver;
    self->_lockButtonObserver = v3;
  }
}

- (void)_stopObservingLockButtonPresses
{
  [(BSInvalidatable *)self->_lockButtonObserver invalidate];
  lockButtonObserver = self->_lockButtonObserver;
  self->_lockButtonObserver = 0;
}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentAuthorizationPaymentUIInterface_consumeSinglePressUpForButtonKind___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__PKPaymentAuthorizationPaymentUIInterface_consumeSinglePressUpForButtonKind___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 134349056;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPaymentUIInterface (%{public}p): Dismissing due to a lock button press", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) request];
  uint64_t v5 = [v4 requestType];

  if (v5 == 1)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 16) host];
    [v6 didEncounterAuthorizationEvent:11];
  }
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) presenter];
  [v7 dismissWithReason:3 error:0 completion:0];
}

- (UIViewController)primaryViewController
{
  return self->_primaryViewController;
}

- (PKPaymentAuthorizationServiceProtocol)serviceDelegate
{
  return self->_serviceDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDelegate, 0);
  objc_storeStrong((id *)&self->_primaryViewController, 0);
  objc_storeStrong((id *)&self->_lockButtonObserver, 0);
  objc_storeStrong((id *)&self->_paymentUIInterface, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end