@interface PKMemoIconChooserViewController
- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor;
- (PKMemoIconChooserViewController)initWithDelegate:(id)a3 memo:(id)a4 context:(int64_t)a5;
- (PKMemoIconChooserViewController)initWithDelegate:(id)a3 memo:(id)a4 context:(int64_t)a5 mode:(unint64_t)a6;
- (void)_cancelTapped;
- (void)_doneTapped;
- (void)cell:(id)a3 didUpdateText:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)invalidateLayout;
- (void)loadView;
- (void)memoIconChooserDidChooseMemo:(id)a3;
- (void)selectCellForItem:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PKMemoIconChooserViewController

- (PKMemoIconChooserViewController)initWithDelegate:(id)a3 memo:(id)a4 context:(int64_t)a5
{
  return [(PKMemoIconChooserViewController *)self initWithDelegate:a3 memo:a4 context:a5 mode:0];
}

- (PKMemoIconChooserViewController)initWithDelegate:(id)a3 memo:(id)a4 context:(int64_t)a5 mode:(unint64_t)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKMemoIconChooserViewController;
  v12 = [(PKDynamicCollectionViewController *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13->_context = a5;
    v13->_mode = a6;
    [(PKDynamicCollectionViewController *)v13 setUseItemIdentityWhenUpdating:1];
    v14 = [[PKMemoIconChooserSectionController alloc] initWithDelegate:v13 mode:a6 memo:v11];
    section = v13->_section;
    v13->_section = v14;

    v24[0] = v13->_section;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [(PKDynamicCollectionViewController *)v13 setSections:v16 animated:1];

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v13 action:sel__doneTapped];
    doneButton = v13->_doneButton;
    v13->_doneButton = (UIBarButtonItem *)v17;

    [(UIBarButtonItem *)v13->_doneButton setEnabled:0];
    v19 = [(PKMemoIconChooserViewController *)v13 navigationItem];
    [v19 setRightBarButtonItem:v13->_doneButton];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v13 action:sel__cancelTapped];
    [v19 setLeftBarButtonItem:v20];

    v21 = PKLocalizedPeerPaymentRecurringString(&cfstr_MemoPickerChoo.isa);
    [v19 setTitle:v21];
  }
  return v13;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)PKMemoIconChooserViewController;
  [(PKDynamicCollectionViewController *)&v6 loadView];
  v3 = [(PKDynamicCollectionViewController *)self collectionView];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(PKDynamicCollectionViewController *)self collectionView];
  [v5 setKeyboardDismissMode:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKMemoIconChooserViewController;
  [(PKDynamicCollectionViewController *)&v6 viewDidAppear:a3];
  if (self->_mode == 1)
  {
    v4 = [[PKMemoItem alloc] initWithMemo:0 type:2];
    v5 = [(PKDynamicCollectionViewController *)self cellForItem:v4];
    [v5 showEmojiKeyboardIfNeeded];
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKMemoIconChooserViewController;
  [(PKMemoIconChooserViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(PKMemoIconChooserViewController *)self view];
  [v3 bounds];
  unint64_t v4 = +[PKMemoIconChooserSectionController suggestedStyleForAvailableWidth:CGRectGetWidth(v6)];

  if ([(PKMemoIconChooserSectionController *)self->_section style] != v4) {
    [(PKMemoIconChooserSectionController *)self->_section setStyle:v4];
  }
}

- (void)_doneTapped
{
  v3 = [(PKMemoIconChooserViewController *)self presentingViewController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PKMemoIconChooserViewController__doneTapped__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

void __46__PKMemoIconChooserViewController__doneTapped__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1056));
  v2 = [*(id *)(*(void *)(a1 + 32) + 1064) selectedMemo];
  [WeakRetained memoIconChooserDidChooseMemo:v2];
}

- (void)_cancelTapped
{
  id v2 = [(PKMemoIconChooserViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)invalidateLayout
{
  id v3 = [(PKDynamicCollectionViewController *)self collectionView];
  id v2 = [v3 collectionViewLayout];
  [v2 invalidateLayout];
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (!self->_mode)
  {
    [(UIBarButtonItem *)self->_doneButton setEnabled:1];
    id v4 = v11;
  }
  BOOL v5 = [v4 type] == 1;
  CGRect v6 = v11;
  if (v5)
  {
    uint64_t v7 = [(PKMemoIconChooserViewController *)self overrideUserInterfaceStyle];
    v8 = [[PKMemoIconChooserViewController alloc] initWithDelegate:self memo:0 context:self->_context mode:1];
    [(PKMemoIconChooserViewController *)v8 setOverrideUserInterfaceStyle:v7];
    v9 = [[PKNavigationController alloc] initWithRootViewController:v8];
    [(PKNavigationController *)v9 setOverrideUserInterfaceStyle:v7];
    if (self->_context == 9 && (PKIsPad() & 1) != 0)
    {
      uint64_t v10 = 0;
    }
    else
    {
      if (![(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
      {
LABEL_11:
        [(PKMemoIconChooserViewController *)self presentViewController:v9 animated:1 completion:0];

        CGRect v6 = v11;
        goto LABEL_12;
      }
      uint64_t v10 = 16;
    }
    [(PKNavigationController *)v9 setModalPresentationStyle:v10];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)selectCellForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDynamicCollectionViewController *)self cellForItem:v4];
  [v5 setSelected:1];
  [(PKDynamicCollectionViewController *)self reloadItem:v4 animated:0];
}

- (void)cell:(id)a3 didUpdateText:(id)a4
{
  doneButton = self->_doneButton;
  BOOL v5 = objc_msgSend(a4, "length", a3) != 0;

  [(UIBarButtonItem *)doneButton setEnabled:v5];
}

- (void)memoIconChooserDidChooseMemo:(id)a3
{
  id v4 = a3;
  PKPeerPaymentAddRecurringPaymentRecentMemoIcon();
  [(PKMemoIconChooserSectionController *)self->_section reloadItems];
  id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:1 inSection:1];
  BOOL v5 = [(PKDynamicCollectionViewController *)self collectionView];
  [v5 selectItemAtIndexPath:v6 animated:1 scrollPosition:0];

  [(UIBarButtonItem *)self->_doneButton setEnabled:1];
  [(PKMemoIconChooserSectionController *)self->_section setMemoSelection:v4];
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  BOOL v2 = [(PKMemoIconChooserViewController *)self overrideUserInterfaceStyle] == 2;
  int64_t v3 = v2;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_section, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end