@interface PKPassSharesListViewController
- (PKPassSharesListViewController)initWithSharesController:(id)a3;
- (void)_donePressed;
- (void)_setIsLoading:(BOOL)a3;
- (void)_showDisplayableError:(id)a3;
- (void)loadView;
- (void)passSharesListSectionController:(id)a3 didSelectShare:(id)a4;
- (void)passSharesListSectionController:(id)a3 presentAlert:(id)a4;
- (void)passSharesListSectionController:(id)a3 setIsLoading:(BOOL)a4;
- (void)passSharesListSectionControllerDidFinishRevokingShares:(id)a3;
- (void)passSharesListSectionControllerDidSelectAddShare:(id)a3;
- (void)reloadDataAnimated:(BOOL)a3;
- (void)shareSecureElementPassViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPassSharesListViewController

- (PKPassSharesListViewController)initWithSharesController:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassSharesListViewController;
  v6 = [(PKDynamicCollectionViewController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharesController, a3);
    v8 = (PKShareAuthorizationSession *)objc_alloc_init(MEMORY[0x1E4F84FF8]);
    authorizer = v7->_authorizer;
    v7->_authorizer = v8;

    v10 = [[PKPassSharesListSectionController alloc] initWithMode:2 sharesController:v7->_sharesController rootShare:0 delegate:v7];
    sharesSectionController = v7->_sharesSectionController;
    v7->_sharesSectionController = v10;

    [(PKDynamicCollectionViewController *)v7 setUseItemIdentityWhenUpdating:1];
    v15[0] = v7->_sharesSectionController;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(PKDynamicCollectionViewController *)v7 setSections:v12 animated:0];
  }
  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassSharesListViewController;
  -[PKDynamicCollectionViewController viewWillAppear:](&v9, sel_viewWillAppear_);
  [(PKSharedPassSharesController *)self->_sharesController updateSharesWithCompletion:0];
  v8.receiver = self;
  v8.super_class = (Class)PKPassSharesListViewController;
  [(PKDynamicCollectionViewController *)&v8 reloadDataAnimated:v3];
  id v5 = [(PKPassSharesListViewController *)self navigationController];
  v6 = [v5 navigationBar];
  [v6 setPrefersLargeTitles:1];

  v7 = [(PKPassSharesListViewController *)self navigationItem];
  [v7 setLargeTitleDisplayMode:1];
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassSharesListViewController;
  [(PKDynamicCollectionViewController *)&v9 loadView];
  BOOL v3 = [(PKPassSharesListViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  id v5 = [(PKDynamicCollectionViewController *)self collectionView];
  [v5 setBackgroundColor:v4];

  [v3 setBackgroundColor:v4];
  v6 = [(PKPassSharesListViewController *)self navigationItem];
  v7 = PKLocalizedShareableCredentialString(&cfstr_SharesListTitl.isa);
  [v6 setTitle:v7];

  objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__donePressed];
  [v6 setRightBarButtonItem:v8];
}

- (void)_donePressed
{
}

- (void)_setIsLoading:(BOOL)a3
{
  if (a3)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v9 startAnimating];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v9];
    id v5 = [(PKPassSharesListViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];

    v6 = [(PKDynamicCollectionViewController *)self collectionView];
    [v6 setUserInteractionEnabled:0];
  }
  else
  {
    v7 = [(PKPassSharesListViewController *)self navigationItem];
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__donePressed];
    [v7 setRightBarButtonItem:v8];

    id v9 = [(PKDynamicCollectionViewController *)self collectionView];
    [v9 setUserInteractionEnabled:1];
  }
}

- (void)_showDisplayableError:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = a3;
  v6 = PKTitleForDisplayableError();
  v7 = MEMORY[0x1A6221F20](v5);

  id v11 = [v4 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  objc_super v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  v10 = [v8 actionWithTitle:v9 style:0 handler:0];
  [v11 addAction:v10];

  [(PKPassSharesListViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)reloadDataAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPassSharesListViewController *)self presentedViewController];

  if (!v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPassSharesListViewController;
    [(PKDynamicCollectionViewController *)&v6 reloadDataAnimated:v3];
  }
}

- (void)passSharesListSectionController:(id)a3 didSelectShare:(id)a4
{
  id v5 = a4;
  authorizer = self->_authorizer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PKPassSharesListViewController_passSharesListSectionController_didSelectShare___block_invoke;
  v8[3] = &unk_1E59CAEA8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  [(PKShareAuthorizationSession *)authorizer authorizeDeviceOwnerWithAuthHandler:0 completion:v8];
}

void __81__PKPassSharesListViewController_passSharesListSectionController_didSelectShare___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v4 = [[PKPassShareDetailsViewController alloc] initWithShare:*(void *)(a1 + 32) sharesController:*(void *)(*(void *)(a1 + 40) + 1056) authorizer:*(void *)(*(void *)(a1 + 40) + 1064)];
    BOOL v3 = [*(id *)(a1 + 40) navigationController];
    [v3 pushViewController:v4 animated:1];
  }
}

- (void)passSharesListSectionControllerDidSelectAddShare:(id)a3
{
  sharesController = self->_sharesController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__PKPassSharesListViewController_passSharesListSectionControllerDidSelectAddShare___block_invoke;
  v4[3] = &unk_1E59CD658;
  v4[4] = self;
  [(PKSharedPassSharesController *)sharesController canSendInvitationWithCompletion:v4];
}

void __83__PKPassSharesListViewController_passSharesListSectionControllerDidSelectAddShare___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    BOOL v3 = (PKShareSecureElementPassViewController *)PKAlertForDisplayableErrorWithHandlers(a2, 0, 0, 0);
    v4 = *(void **)(a1 + 32);
    id v9 = v3;
    uint64_t v5 = 1;
  }
  else
  {
    objc_super v6 = [PKShareSecureElementPassViewController alloc];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 1056) pass];
    id v9 = [(PKShareSecureElementPassViewController *)v6 initWithSecureElementPass:v7 environment:0 isFromPeopleScreen:1 delegate:*(void *)(a1 + 32)];

    [(PKShareSecureElementPassViewController *)v9 setModalPresentationStyle:5];
    objc_super v8 = *(void **)(a1 + 32);
    uint64_t v5 = [(PKShareSecureElementPassViewController *)v9 shouldViewControllerBeAnimatedIn];
    v4 = v8;
    BOOL v3 = v9;
  }
  [v4 presentViewController:v3 animated:v5 completion:0];
}

- (void)passSharesListSectionController:(id)a3 setIsLoading:(BOOL)a4
{
}

- (void)passSharesListSectionControllerDidFinishRevokingShares:(id)a3
{
}

- (void)passSharesListSectionController:(id)a3 presentAlert:(id)a4
{
}

- (void)shareSecureElementPassViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassSharesListViewController;
  -[PKDynamicCollectionViewController reloadDataAnimated:](&v5, sel_reloadDataAnimated_, 1, a4);
  [(PKPassSharesListViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharesSectionController, 0);
  objc_storeStrong((id *)&self->_authorizer, 0);

  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end