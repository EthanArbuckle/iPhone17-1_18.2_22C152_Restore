@interface PKPeerPaymentActionViewController
+ (id)navigationBarBackgroundColor;
+ (id)peerPaymentActionViewControllerForAction:(unint64_t)a3 paymentPass:(id)a4 webService:(id)a5 passLibraryDataProvider:(id)a6 context:(int64_t)a7;
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (BOOL)showCancelButton;
- (NSDecimalNumber)cardBalance;
- (NSDecimalNumber)currentAmount;
- (NSDecimalNumber)maxBalance;
- (NSDecimalNumber)maxLoadAmount;
- (NSDecimalNumber)minBalance;
- (NSDecimalNumber)minLoadAmount;
- (PKPassLibraryDataProvider)passLibraryDataProvider;
- (PKPaymentPass)pass;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentAccountFeatureDescriptor)feature;
- (PKPeerPaymentActionController)actionController;
- (PKPeerPaymentActionViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6;
- (PKPeerPaymentActionViewControllerDelegate)delegate;
- (PKPeerPaymentWebService)webService;
- (id)_cancelBarButton;
- (id)presentationSceneBundleIdentifierForPeerPaymentActionController:(id)a3;
- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3;
- (int64_t)context;
- (unint64_t)controllerAction;
- (void)_cancelledAction;
- (void)_handleApplicationDidBecomeActiveNotification:(id)a3;
- (void)_handlePeerPaymentAccountDidChangeNotification:(id)a3;
- (void)_performedAction;
- (void)dealloc;
- (void)loadView;
- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4;
- (void)peerPaymentActionController:(id)a3 requestPresentViewController:(id)a4;
- (void)setAccount:(id)a3;
- (void)setCardBalance:(id)a3;
- (void)setControllerAction:(unint64_t)a3;
- (void)setCurrentAmount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxBalance:(id)a3;
- (void)setMaxLoadAmount:(id)a3;
- (void)setMinBalance:(id)a3;
- (void)setMinLoadAmount:(id)a3;
- (void)setPassLibraryDataProvider:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)updateAccountValues;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willDismissViewController;
@end

@implementation PKPeerPaymentActionViewController

+ (id)peerPaymentActionViewControllerForAction:(unint64_t)a3 paymentPass:(id)a4 webService:(id)a5 passLibraryDataProvider:(id)a6 context:(int64_t)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 1)
  {
    v14 = off_1E59C4B50;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v14 = off_1E59C4B60;
LABEL_5:
    v15 = (void *)[objc_alloc(*v14) initWithPaymentPass:v11 webService:v12 passLibraryDataProvider:v13 context:a7];
    goto LABEL_7;
  }
  v15 = 0;
LABEL_7:

  return v15;
}

- (PKPeerPaymentActionViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentActionViewController;
  v14 = [(PKPeerPaymentActionViewController *)&v29 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    objc_storeStrong((id *)&v15->_webService, a4);
    v15->_context = a6;
    uint64_t v16 = [MEMORY[0x1E4F28C28] zero];
    currentAmount = v15->_currentAmount;
    v15->_currentAmount = (NSDecimalNumber *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28C28] zero];
    cardBalance = v15->_cardBalance;
    v15->_cardBalance = (NSDecimalNumber *)v18;

    objc_storeWeak((id *)&v15->_passLibraryDataProvider, v13);
    v20 = [[PKPeerPaymentActionController alloc] initWithPaymentPass:v11 webService:v12 context:v15->_context passLibraryDataProvider:v13 delegate:v15];
    actionController = v15->_actionController;
    v15->_actionController = v20;

    [(PKPeerPaymentActionViewController *)v15 setShowCancelButton:1];
    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v23 = *MEMORY[0x1E4F87CC8];
    v24 = [v12 targetDevice];
    [v22 addObserver:v15 selector:sel__handlePeerPaymentAccountDidChangeNotification_ name:v23 object:v24];

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v15 selector:sel__handleApplicationDidBecomeActiveNotification_ name:*MEMORY[0x1E4FB2628] object:0];

    v26 = [(PKPeerPaymentWebService *)v15->_webService targetDevice];
    v27 = [v26 account];

    [(PKPeerPaymentActionViewController *)v15 setAccount:v27];
  }

  return v15;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionViewController;
  [(PKPeerPaymentActionViewController *)&v4 dealloc];
}

+ (id)navigationBarBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBackgroundColor];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionViewController;
  [(PKPeerPaymentActionViewController *)&v5 loadView];
  v3 = [(PKPeerPaymentActionViewController *)self view];
  objc_super v4 = [(id)objc_opt_class() navigationBarBackgroundColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionViewController;
  [(PKPeerPaymentActionViewController *)&v4 viewWillDisappear:a3];
  self->_viewHasAppeared = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionViewController;
  [(PKPeerPaymentActionViewController *)&v4 viewDidAppear:a3];
  self->_viewHasAppeared = 1;
  if (!self->_dismissingViewController) {
    [(PKPeerPaymentActionViewController *)self updateFirstResponder];
  }
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
    case 3uLL:
      id v7 = v6;
      [(PKPeerPaymentActionViewController *)self _performedAction];
      goto LABEL_5;
    case 4uLL:
      id v7 = v6;
      [(PKPeerPaymentActionViewController *)self _cancelledAction];
      goto LABEL_5;
    case 5uLL:
      id v7 = v6;
      [(PKPeerPaymentActionViewController *)self updateAccountValues];
LABEL_5:
      id v6 = v7;
      break;
    default:
      break;
  }
}

- (void)peerPaymentActionController:(id)a3 requestPresentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPeerPaymentActionViewController *)self navigationController];
  [v6 presentViewController:v5 animated:1 completion:0];
}

- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3
{
  v3 = [(PKPeerPaymentActionViewController *)self view];
  objc_super v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (id)presentationSceneBundleIdentifierForPeerPaymentActionController:(id)a3
{
  return 0;
}

- (void)_cancelledAction
{
  [(PKPeerPaymentActionViewController *)self willDismissViewController];
  v3 = [(PKPeerPaymentActionViewController *)self delegate];
  id v5 = v3;
  if (v3)
  {
    [v3 peerPaymentActionViewControllerDidCancel:self];
  }
  else
  {
    objc_super v4 = [(PKPeerPaymentActionViewController *)self navigationController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_performedAction
{
  [(PKPeerPaymentActionViewController *)self willDismissViewController];
  v3 = [(PKPeerPaymentActionViewController *)self delegate];
  id v5 = v3;
  if (v3)
  {
    [v3 peerPaymentActionViewControllerDidPerformAction:self];
  }
  else
  {
    objc_super v4 = [(PKPeerPaymentActionViewController *)self navigationController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)setShowCancelButton:(BOOL)a3
{
  if (self->_showCancelButton != a3)
  {
    BOOL v3 = a3;
    self->_showCancelButton = a3;
    id v6 = [(PKPeerPaymentActionViewController *)self navigationItem];
    if (v3)
    {
      id v5 = [(PKPeerPaymentActionViewController *)self _cancelBarButton];
      [v6 setLeftBarButtonItem:v5];
    }
    else
    {
      [v6 setLeftBarButtonItem:0];
    }
  }
}

- (void)willDismissViewController
{
  self->_dismissingViewController = 1;
}

- (void)setControllerAction:(unint64_t)a3
{
  id v5 = [(PKPeerPaymentActionViewController *)self actionController];
  [v5 setControllerAction:a3];

  [(PKPeerPaymentActionViewController *)self updateAccountValues];
}

- (unint64_t)controllerAction
{
  v2 = [(PKPeerPaymentActionViewController *)self actionController];
  unint64_t v3 = [v2 controllerAction];

  return v3;
}

- (void)setAccount:(id)a3
{
  id v5 = (PKPeerPaymentAccount *)a3;
  if (self->_account != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_account, a3);
    [(PKPeerPaymentActionViewController *)self updateAccountValues];
    id v6 = [(PKPeerPaymentActionViewController *)self viewIfLoaded];
    [v6 setNeedsLayout];

    id v5 = v7;
  }
}

- (void)updateAccountValues
{
  id v9 = [(PKPeerPaymentAccount *)self->_account currentBalance];
  unint64_t v3 = [MEMORY[0x1E4F28C28] zero];
  objc_super v4 = [(PKPeerPaymentActionViewController *)self feature];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 maximumAmount];
    id v7 = [v5 minimumAmount];
  }
  else
  {
    id v7 = 0;
    id v6 = 0;
  }
  v8 = [v9 amount];
  [(PKPeerPaymentActionViewController *)self setCardBalance:v8];

  [(PKPeerPaymentActionViewController *)self setMaxBalance:0];
  [(PKPeerPaymentActionViewController *)self setMinBalance:v3];
  [(PKPeerPaymentActionViewController *)self setMinLoadAmount:v7];
  [(PKPeerPaymentActionViewController *)self setMaxLoadAmount:v6];
}

- (PKPeerPaymentAccountFeatureDescriptor)feature
{
  unint64_t v3 = [(PKPeerPaymentActionViewController *)self controllerAction];
  switch(v3)
  {
    case 3uLL:
      objc_super v4 = [(PKPeerPaymentAccount *)self->_account transferToBankFeatureDescriptor];
      break;
    case 2uLL:
      objc_super v4 = [(PKPeerPaymentAccount *)self->_account instantWithdrawalPromotionFeatureDescriptor];
      break;
    case 1uLL:
      objc_super v4 = [(PKPeerPaymentAccount *)self->_account loadFromCardFeatureDescriptor];
      break;
    default:
      objc_super v4 = 0;
      break;
  }

  return (PKPeerPaymentAccountFeatureDescriptor *)v4;
}

- (void)setMaxBalance:(id)a3
{
  obj = (NSDecimalNumber *)a3;
  objc_super v4 = [MEMORY[0x1E4F28C28] zero];
  int v5 = [(NSDecimalNumber *)obj isEqualToNumber:v4];

  if (v5)
  {

    id v6 = 0;
  }
  else
  {
    id v6 = obj;
  }
  p_maxBalance = &self->_maxBalance;
  if (v6 != *p_maxBalance)
  {
    obja = v6;
    char v8 = -[NSDecimalNumber isEqualToNumber:](v6, "isEqualToNumber:");
    id v6 = obja;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_maxBalance, obja);
      id v6 = obja;
    }
  }
}

- (void)setMinBalance:(id)a3
{
  int v5 = (NSDecimalNumber *)a3;
  id v6 = v5;
  p_minBalance = &self->_minBalance;
  if (*p_minBalance != v5)
  {
    id v9 = v5;
    char v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    id v6 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_minBalance, a3);
      id v6 = v9;
    }
  }
}

- (void)setMinLoadAmount:(id)a3
{
  int v5 = (NSDecimalNumber *)a3;
  id v6 = v5;
  p_minLoadAmount = &self->_minLoadAmount;
  if (*p_minLoadAmount != v5)
  {
    id v9 = v5;
    char v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    id v6 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_minLoadAmount, a3);
      id v6 = v9;
    }
  }
}

- (void)setMaxLoadAmount:(id)a3
{
  int v5 = (NSDecimalNumber *)a3;
  id v6 = v5;
  p_maxLoadAmount = &self->_maxLoadAmount;
  if (*p_maxLoadAmount != v5)
  {
    id v9 = v5;
    char v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    id v6 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_maxLoadAmount, a3);
      id v6 = v9;
    }
  }
}

- (void)setCardBalance:(id)a3
{
  int v5 = (NSDecimalNumber *)a3;
  id v6 = v5;
  p_cardBalance = &self->_cardBalance;
  if (*p_cardBalance != v5)
  {
    id v13 = v5;
    char v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    id v6 = v13;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_cardBalance, a3);
      if (!*p_cardBalance
        || ([MEMORY[0x1E4F28C28] notANumber],
            id v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [(NSDecimalNumber *)v13 isEqual:v9],
            v9,
            id v6 = v13,
            v10))
      {
        uint64_t v11 = [MEMORY[0x1E4F28C28] zero];
        id v12 = *p_cardBalance;
        *p_cardBalance = (NSDecimalNumber *)v11;

        id v6 = v13;
      }
    }
  }
}

- (void)setCurrentAmount:(id)a3
{
  int v5 = (NSDecimalNumber *)a3;
  id v6 = v5;
  p_currentAmount = &self->_currentAmount;
  if (*p_currentAmount != v5)
  {
    id v13 = v5;
    char v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    id v6 = v13;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_currentAmount, a3);
      if (!*p_currentAmount
        || ([MEMORY[0x1E4F28C28] notANumber],
            id v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [(NSDecimalNumber *)v13 isEqual:v9],
            v9,
            id v6 = v13,
            v10))
      {
        uint64_t v11 = [MEMORY[0x1E4F28C28] zero];
        id v12 = *p_currentAmount;
        *p_currentAmount = (NSDecimalNumber *)v11;

        id v6 = v13;
      }
    }
  }
}

- (void)_handlePeerPaymentAccountDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKPeerPaymentActionViewController__handlePeerPaymentAccountDidChangeNotification___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __84__PKPeerPaymentActionViewController__handlePeerPaymentAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1016) targetDevice];
  id v3 = [v2 account];

  [*(id *)(a1 + 32) setAccount:v3];
}

- (void)_handleApplicationDidBecomeActiveNotification:(id)a3
{
  if (self->_viewHasAppeared) {
    [(PKPeerPaymentActionViewController *)self updateFirstResponder];
  }
}

- (id)_cancelBarButton
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed_];
  [v2 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];

  return v2;
}

- (PKPeerPaymentActionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentActionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPassLibraryDataProvider)passLibraryDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);

  return (PKPassLibraryDataProvider *)WeakRetained;
}

- (void)setPassLibraryDataProvider:(id)a3
{
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKPeerPaymentActionController)actionController
{
  return self->_actionController;
}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (int64_t)context
{
  return self->_context;
}

- (NSDecimalNumber)currentAmount
{
  return self->_currentAmount;
}

- (NSDecimalNumber)cardBalance
{
  return self->_cardBalance;
}

- (NSDecimalNumber)minBalance
{
  return self->_minBalance;
}

- (NSDecimalNumber)maxBalance
{
  return self->_maxBalance;
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
  objc_storeStrong((id *)&self->_maxBalance, 0);
  objc_storeStrong((id *)&self->_minBalance, 0);
  objc_storeStrong((id *)&self->_cardBalance, 0);
  objc_storeStrong((id *)&self->_currentAmount, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_passLibraryDataProvider);

  objc_destroyWeak((id *)&self->_delegate);
}

@end