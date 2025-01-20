@interface PKPeerPaymentMessagesContentBaseViewController
- (PKPeerPaymentMessagesAppViewController)appController;
- (PKPeerPaymentMessagesContentBaseViewController)initWithMessagesAppController:(id)a3;
- (PKPeerPaymentMessagesContentView)contentView;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPeerPaymentMessagesContentBaseViewController

- (PKPeerPaymentMessagesContentBaseViewController)initWithMessagesAppController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentMessagesContentBaseViewController;
  v5 = [(PKPeerPaymentMessagesContentBaseViewController *)&v10 initWithNibName:0 bundle:0];
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
  }

  return v5;
}

- (void)loadView
{
  v3 = objc_alloc_init(PKPeerPaymentMessagesContentView);
  contentView = self->_contentView;
  self->_contentView = v3;

  v5 = self->_contentView;

  [(PKPeerPaymentMessagesContentBaseViewController *)self setView:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesContentBaseViewController;
  [(PKPeerPaymentMessagesContentBaseViewController *)&v4 viewWillAppear:a3];
  [(PKPeerPaymentMessagesContentBaseViewController *)self reloadContent];
}

- (PKPeerPaymentMessagesAppViewController)appController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appController);

  return (PKPeerPaymentMessagesAppViewController *)WeakRetained;
}

- (PKPeerPaymentMessagesContentView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_destroyWeak((id *)&self->_appController);
}

@end