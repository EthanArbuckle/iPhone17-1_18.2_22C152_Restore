@interface ICQRemoteUINavigationController
- (BOOL)didCompletePurchaseFlowWithSuccess;
- (BOOL)shouldSignalDelegateOnDismiss;
- (ICQRemoteUINavigationController)initWithRootViewController:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setDidCompletePurchaseFlowWithSuccess:(BOOL)a3;
- (void)setShouldSignalDelegateOnDismiss:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ICQRemoteUINavigationController

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICQRemoteUINavigationController;
  [(ICQRemoteUINavigationController *)&v7 viewDidDisappear:a3];
  if ([(ICQRemoteUINavigationController *)self shouldSignalDelegateOnDismiss])
  {
    v4 = [(ICQRemoteUINavigationController *)self delegate];
    if ([v4 conformsToProtocol:&unk_26E021968])
    {
      v5 = [(ICQRemoteUINavigationController *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0) {
        return;
      }
      v4 = [(ICQRemoteUINavigationController *)self delegate];
      [v4 remoteUIControllerDidDismiss:0];
    }
  }
}

- (ICQRemoteUINavigationController)initWithRootViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteUINavigationController;
  result = [(ICQRemoteUINavigationController *)&v4 initWithRootViewController:a3];
  if (result) {
    result->_shouldSignalDelegateOnDismiss = 1;
  }
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = +[ICQUIExtensionKitHelpers isExtensionKitProcess];
  v8 = _ICQGetLogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      -[ICQRemoteUINavigationController dismissViewControllerAnimated:completion:](v8);
    }

    if ([(ICQRemoteUINavigationController *)self didCompletePurchaseFlowWithSuccess])
    {
      v10 = 0;
    }
    else
    {
      v10 = ICQCreateError();
    }
    +[ICQUIRemoteExtensionEntry dismissRemoteViewControllerWithError:v10];
  }
  else
  {
    if (v9) {
      -[ICQRemoteUINavigationController dismissViewControllerAnimated:completion:](v8);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__ICQRemoteUINavigationController_dismissViewControllerAnimated_completion___block_invoke;
    block[3] = &unk_264922160;
    BOOL v13 = a3;
    block[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
    v10 = v12;
  }
}

id __76__ICQRemoteUINavigationController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ICQRemoteUINavigationController;
  return objc_msgSendSuper2(&v4, sel_dismissViewControllerAnimated_completion_, v1, v2);
}

- (BOOL)shouldSignalDelegateOnDismiss
{
  return self->_shouldSignalDelegateOnDismiss;
}

- (void)setShouldSignalDelegateOnDismiss:(BOOL)a3
{
  self->_shouldSignalDelegateOnDismiss = a3;
}

- (BOOL)didCompletePurchaseFlowWithSuccess
{
  return self->_didCompletePurchaseFlowWithSuccess;
}

- (void)setDidCompletePurchaseFlowWithSuccess:(BOOL)a3
{
  self->_didCompletePurchaseFlowWithSuccess = a3;
}

- (void)dismissViewControllerAnimated:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "Dismissing extension view controller", v1, 2u);
}

- (void)dismissViewControllerAnimated:(os_log_t)log completion:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "Dismissing remote view controller", v1, 2u);
}

@end