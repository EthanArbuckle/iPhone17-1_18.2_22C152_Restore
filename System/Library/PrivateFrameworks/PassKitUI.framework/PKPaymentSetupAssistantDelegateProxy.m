@interface PKPaymentSetupAssistantDelegateProxy
- (PKPaymentSetupAssistantDelegateProxy)initWithDelegate:(id)a3 provisioningController:(id)a4;
- (void)_setExternalDelegate:(id)a3;
- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6;
- (void)viewController:(id)a3 didExitPasscodeUpgradeWithShouldContinue:(BOOL)a4 error:(id)a5;
- (void)viewController:(id)a3 didShowProvisioningError:(id)a4;
- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5;
- (void)viewController:(id)a3 requestPasscodeUpgradeWithCompletion:(id)a4;
- (void)viewControllerDidBeginSetupFlow:(id)a3;
- (void)viewControllerDidFailToChangePasscodeComplex:(id)a3;
- (void)viewControllerDidFinishChangingPasscodeComplex:(id)a3;
- (void)viewControllerDidShowEligibilityIssue:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation PKPaymentSetupAssistantDelegateProxy

- (PKPaymentSetupAssistantDelegateProxy)initWithDelegate:(id)a3 provisioningController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupAssistantDelegateProxy;
  v8 = [(PKPaymentSetupAssistantDelegateProxy *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_provisioningController, a4);
    [(PKPaymentSetupAssistantDelegateProxy *)v9 _setExternalDelegate:v6];
  }

  return v9;
}

- (void)_setExternalDelegate:(id)a3
{
  id v6 = (PKPaymentSetupViewControllerDelegate *)a3;
  externalDelegate = self->_externalDelegate;
  if (externalDelegate != v6)
  {
    object = v6;
    if (externalDelegate)
    {
      objc_setAssociatedObject(externalDelegate, a2, 0, (void *)1);
      id v6 = object;
    }
    if (v6) {
      objc_setAssociatedObject(object, a2, self, (void *)1);
    }
    objc_storeStrong((id *)&self->_externalDelegate, a3);
    id v6 = object;
  }
}

- (void)viewControllerDidBeginSetupFlow:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  self->_didTerminateSetupFlow = 0;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    v10 = [v5 description];
    int v11 = 138412802;
    v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v11, 0x20u);
  }
  [(PKPaymentProvisioningController *)self->_provisioningController noteProvisioningUserInterfaceDidAppear];
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentSetupViewControllerDelegate *)self->_externalDelegate viewControllerDidBeginSetupFlow:v5];
  }
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL didTerminateSetupFlow = self->_didTerminateSetupFlow;
  id v7 = PKLogFacilityTypeGetObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (didTerminateSetupFlow)
  {
    if (v8)
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v11 = NSStringFromSelector(a2);
      v12 = [v5 description];
      int v17 = 138412802;
      v18 = v10;
      __int16 v19 = 2112;
      v20 = v11;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "%@ - %@ - Called twice by: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    if (v8)
    {
      __int16 v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      __int16 v15 = NSStringFromSelector(a2);
      v16 = [v5 description];
      int v17 = 138412802;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v17, 0x20u);
    }
    self->_BOOL didTerminateSetupFlow = 1;
    [(PKPaymentProvisioningController *)self->_provisioningController noteProvisioningUserInterfaceDidDisappear];
    [(PKPaymentSetupViewControllerDelegate *)self->_externalDelegate viewControllerDidTerminateSetupFlow:v5];
  }
}

- (void)viewController:(id)a3 didShowProvisioningError:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    int v11 = NSStringFromClass(v10);
    v12 = NSStringFromSelector(a2);
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v13, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentSetupViewControllerDelegate *)self->_externalDelegate viewController:v7 didShowProvisioningError:v8];
  }
}

- (void)viewControllerDidShowEligibilityIssue:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    int v10 = 138412546;
    int v11 = v8;
    __int16 v12 = 2112;
    int v13 = v9;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v10, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentSetupViewControllerDelegate *)self->_externalDelegate viewControllerDidShowEligibilityIssue:v5];
  }
}

- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    __int16 v15 = NSStringFromSelector(a2);
    int v17 = 138412546;
    v18 = v14;
    __int16 v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v17, 0x16u);
  }
  v16 = self->_externalDelegate;
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentSetupViewControllerDelegate *)v16 viewController:v9 requestPasscodeUpgradeForPasscodeUpgradeFlowController:v10 completion:v11];
  }
}

- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    int v17 = NSStringFromSelector(a2);
    int v19 = 138412546;
    v20 = v16;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v19, 0x16u);
  }
  v18 = self->_externalDelegate;
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentSetupViewControllerDelegate *)v18 viewController:v11 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:v12 withShouldContinue:v7 error:v13];
  }
}

- (void)viewControllerDidFinishChangingPasscodeComplex:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    BOOL v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)viewControllerDidFailToChangePasscodeComplex:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    BOOL v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)viewController:(id)a3 requestPasscodeUpgradeWithCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    uint64_t v12 = NSStringFromSelector(a2);
    int v14 = 138412546;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    int v17 = v12;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v14, 0x16u);
  }
  id v13 = self->_externalDelegate;
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentSetupViewControllerDelegate *)v13 viewController:v7 requestPasscodeUpgradeWithCompletion:v8];
  }
}

- (void)viewController:(id)a3 didExitPasscodeUpgradeWithShouldContinue:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    int v14 = NSStringFromSelector(a2);
    int v16 = 138412546;
    int v17 = v13;
    __int16 v18 = 2112;
    int v19 = v14;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v16, 0x16u);
  }
  __int16 v15 = self->_externalDelegate;
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentSetupViewControllerDelegate *)v15 viewController:v9 didExitPasscodeUpgradeWithShouldContinue:v6 error:v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDelegate, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end