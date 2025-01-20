@interface PKPeerPaymentMessagesContentNavigationController
- (PKPeerPaymentMessagesAppViewController)appController;
- (PKPeerPaymentMessagesContentNavigationController)initWithMessagesAppController:(id)a3;
- (PKPeerPaymentMessagesContentView)contentView;
- (void)reloadContent;
@end

@implementation PKPeerPaymentMessagesContentNavigationController

- (PKPeerPaymentMessagesContentNavigationController)initWithMessagesAppController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentMessagesContentNavigationController;
  v5 = [(PKNavigationController *)&v10 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      __int16 v13 = 2048;
      v14 = v5;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p>: Initialized.", buf, 0x16u);
    }
    objc_storeWeak((id *)&v5->_appController, v4);
    [(PKPeerPaymentMessagesContentNavigationController *)v5 setDelegate:v5];
  }

  return v5;
}

- (void)reloadContent
{
  v2 = [(PKPeerPaymentMessagesContentNavigationController *)self viewControllers];
  id v3 = [v2 firstObject];

  [v3 reloadContent];
}

- (PKPeerPaymentMessagesContentView)contentView
{
  v2 = [(PKPeerPaymentMessagesContentNavigationController *)self viewControllers];
  id v3 = [v2 firstObject];

  id v4 = [v3 contentView];

  return (PKPeerPaymentMessagesContentView *)v4;
}

- (PKPeerPaymentMessagesAppViewController)appController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appController);

  return (PKPeerPaymentMessagesAppViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end