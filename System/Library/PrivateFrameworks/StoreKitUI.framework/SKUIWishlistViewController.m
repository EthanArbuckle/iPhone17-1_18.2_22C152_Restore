@interface SKUIWishlistViewController
+ (id)wishlistBarButtonItemWithClientContext:(id)a3;
- (BOOL)_isEditingEnabled;
- (SKUIWishlistDelegate)delegate;
- (SKUIWishlistViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_emptyWishlistView;
- (id)_itemListViewController;
- (id)_wishlist;
- (id)contentScrollView;
- (int64_t)_wishlistState;
- (void)_deleteAction:(id)a3;
- (void)_deleteItemsAtIndexPaths:(id)a3;
- (void)_destroyEmptyWishlistView;
- (void)_doneAction:(id)a3;
- (void)_finishSignInWithResponse:(id)a3 error:(id)a4;
- (void)_finishSyncWithResult:(BOOL)a3 didChange:(BOOL)a4 error:(id)a5;
- (void)_reloadChildView;
- (void)_reloadForAccountsChanged;
- (void)_reloadNavigationBarAnimated:(BOOL)a3;
- (void)_reloadWishlist;
- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)_signInAction:(id)a3;
- (void)_syncWishlist;
- (void)_toggleEditAction:(id)a3;
- (void)_updateDeleteButton;
- (void)_wishlistDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)itemList:(id)a3 didDeselectItem:(id)a4 atIndexPath:(id)a5;
- (void)itemList:(id)a3 didRemoveItemAtIndexPath:(id)a4;
- (void)itemList:(id)a3 didSelectItem:(id)a4 atIndexPath:(id)a5;
- (void)loadView;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIWishlistViewController

- (SKUIWishlistViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIWishlistViewController initWithNibName:bundle:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIWishlistViewController;
  v8 = [(SKUIWishlistViewController *)&v12 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    if (([MEMORY[0x1E4FB1438] shouldMakeUIForDefaultPNG] & 1) == 0) {
      [(SKUIWishlistViewController *)v8 setTitle:@"Wish List"];
    }
    v8->_wishlistState = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)__AccountsChanged, (CFStringRef)*MEMORY[0x1E4FA89F0], 0, CFNotificationSuspensionBehaviorCoalesce);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v8 selector:sel__wishlistDidChangeNotification_ name:0x1F1C95908 object:0];
  }
  return v8;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4FA89F0], 0);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:0x1F1C95908 object:0];
  [(SKUIItemListTableViewController *)self->_itemListViewController setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)SKUIWishlistViewController;
  [(SKUIViewController *)&v5 dealloc];
}

+ (id)wishlistBarButtonItemWithClientContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
  if (v3) {
    [v3 localizedStringForKey:@"WISH_LIST_BUTTON"];
  }
  else {
  objc_super v5 = +[SKUIClientContext localizedStringForKey:@"WISH_LIST_BUTTON" inBundles:0];
  }
  [v4 setAccessibilityLabel:v5];

  id v6 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UIButtonBarListIcon.png"];
  id v7 = [v6 imageFlippedForRightToLeftLayoutDirection];
  [v4 setImage:v7];

  v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  double v10 = 2.0;
  if (v9 == 1) {
    double v10 = 3.0;
  }
  objc_msgSend(v4, "setImageInsets:", v10, 0.0, 0.0, 0.0);

  return v4;
}

- (void)setClientContext:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4FB1438] shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    if (v4) {
      [v4 localizedStringForKey:@"WISH_LIST_TAB_TITLE"];
    }
    else {
    objc_super v5 = +[SKUIClientContext localizedStringForKey:@"WISH_LIST_TAB_TITLE" inBundles:0];
    }
    [(SKUIWishlistViewController *)self setTitle:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIWishlistViewController;
  [(SKUIViewController *)&v6 setClientContext:v4];
}

- (id)contentScrollView
{
  v2 = [(SKUIWishlistViewController *)self _itemListViewController];
  id v3 = [v2 tableView];

  return v3;
}

- (void)loadView
{
  id v13 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v13 setBackgroundColor:v3];

  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v4 userInterfaceIdiom])
  {
    objc_super v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_super v6 = [v5 keyWindow];
    [v6 bounds];
    double v8 = v7;
    double v9 = SKUICompactThreshold();

    if (v8 > v9) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  backdropView = self->_backdropView;
  if (!backdropView)
  {
    v11 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:10060];
    objc_super v12 = self->_backdropView;
    self->_backdropView = v11;

    backdropView = self->_backdropView;
  }
  [v13 addSubview:backdropView];
LABEL_8:
  [(SKUIWishlistViewController *)self setView:v13];
  [(SKUIWishlistViewController *)self _reloadChildView];
}

- (void)viewDidLayoutSubviews
{
  if (!self->_backdropView)
  {
    id v3 = [(SKUIWishlistViewController *)self view];
    SKUIPopoverBackdropViewForView(v3);
    id v4 = (_UIBackdropView *)objc_claimAutoreleasedReturnValue();
    backdropView = self->_backdropView;
    self->_backdropView = v4;
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIWishlistViewController;
  [(SKUIWishlistViewController *)&v6 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ((unint64_t)([(SKUIWishlistViewController *)self _wishlistState] - 3) <= 1) {
    [(SKUIWishlistViewController *)self _syncWishlist];
  }
  if (self->_reloadOnNextAppear)
  {
    self->_reloadOnNextAppear = 0;
    [(SKUIWishlistViewController *)self _reloadWishlist];
  }
  [(SKUIWishlistViewController *)self _reloadNavigationBarAnimated:0];
  v5.receiver = self;
  v5.super_class = (Class)SKUIWishlistViewController;
  [(SKUIViewController *)&v5 viewWillAppear:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = (void *)MEMORY[0x1E4FB1618];
  id v8 = a4;
  double v9 = [v7 whiteColor];
  double v10 = [(SKUIWishlistViewController *)self view];
  [v10 setBackgroundColor:v9];

  [(_UIBackdropView *)self->_backdropView setHidden:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__SKUIWishlistViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_1E6422278;
  v12[4] = self;
  [v8 animateAlongsideTransition:&__block_literal_global_43 completion:v12];
  v11.receiver = self;
  v11.super_class = (Class)SKUIWishlistViewController;
  -[SKUIWishlistViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

void __81__SKUIWishlistViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1048) setHidden:0];
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  v2 = [*(id *)(a1 + 32) view];
  [v2 setBackgroundColor:v3];
}

- (void)itemList:(id)a3 didDeselectItem:(id)a4 atIndexPath:(id)a5
{
  if (self->_editing) {
    [(SKUIWishlistViewController *)self _updateDeleteButton];
  }
}

- (void)itemList:(id)a3 didRemoveItemAtIndexPath:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  objc_super v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  double v7 = [v5 arrayWithObjects:&v8 count:1];

  -[SKUIWishlistViewController _deleteItemsAtIndexPaths:](self, "_deleteItemsAtIndexPaths:", v7, v8, v9);
}

- (void)itemList:(id)a3 didSelectItem:(id)a4 atIndexPath:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  if (self->_editing)
  {
    [(SKUIWishlistViewController *)self _updateDeleteButton];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      double v10 = (SKUIIPhoneProductPageViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      [(SKUIViewController *)v10 wishlist:self didSelectItem:v13 atIndexPath:v7];
    }
    else
    {
      double v10 = [[SKUIIPhoneProductPageViewController alloc] initWithItem:v13];
      objc_super v11 = [(SKUIViewController *)self clientContext];
      [(SKUIViewController *)v10 setClientContext:v11];

      objc_super v12 = [(SKUIWishlistViewController *)self navigationController];
      [v12 pushViewController:v10 animated:1];
    }
  }
}

- (void)_wishlistDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SKUIWishlistViewController *)self _wishlist];
  id v6 = [v4 object];

  if (v5 == v6)
  {
    if (SKUIViewControllerIsVisible(self))
    {
      [(SKUIWishlistViewController *)self _reloadWishlist];
    }
    else
    {
      if (self->_reloadOnNextAppear) {
        char v7 = 1;
      }
      else {
        char v7 = [(SKUIWishlistViewController *)self isViewLoaded];
      }
      self->_reloadOnNextAppear = v7;
    }
  }
}

- (void)_deleteAction:(id)a3
{
  id v4 = [(SKUIItemListTableViewController *)self->_itemListViewController tableView];
  id v5 = [v4 indexPathsForSelectedRows];

  [(SKUIWishlistViewController *)self _deleteItemsAtIndexPaths:v5];
  [(SKUIWishlistViewController *)self _setEditing:0 animated:1];
}

- (void)_doneAction:(id)a3
{
}

- (void)_signInAction:(id)a3
{
  id v4 = a3;
  [v4 setEnabled:0];
  id v5 = objc_alloc(MEMORY[0x1E4FA8260]);
  id v6 = [MEMORY[0x1E4FA8100] defaultStore];
  char v7 = [v6 activeAccount];
  id v8 = (void *)[v5 initWithAccount:v7];

  [v8 setPromptStyle:1];
  objc_initWeak(&location, self);
  char v9 = (void *)[objc_alloc(MEMORY[0x1E4FA8128]) initWithAuthenticationContext:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__SKUIWishlistViewController__signInAction___block_invoke;
  v10[3] = &unk_1E6424220;
  objc_copyWeak(&v11, &location);
  [v9 startWithAuthenticateResponseBlock:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __44__SKUIWishlistViewController__signInAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SKUIWishlistViewController__signInAction___block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __44__SKUIWishlistViewController__signInAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishSignInWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_toggleEditAction:(id)a3
{
}

- (void)_deleteItemsAtIndexPaths:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18 = self;
  id v5 = [(SKUIWishlist *)self->_wishlist items];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) row];
        [v6 addIndex:v13];
        v14 = [v5 objectAtIndex:v13];
        v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "itemIdentifier"));
        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  [(SKUIWishlist *)v18->_wishlist removeItemsWithItemIdentifiers:v7];
  [(SKUIItemListTableViewController *)v18->_itemListViewController deleteRowsAtIndexPaths:v8];
  v16 = [(SKUIWishlist *)v18->_wishlist items];
  uint64_t v17 = [v16 count];

  if (!v17) {
    [(SKUIWishlistViewController *)v18 _reloadChildView];
  }
}

- (void)_destroyEmptyWishlistView
{
  [(_UIContentUnavailableView *)self->_emptyWishlistView removeFromSuperview];
  emptyWishlistView = self->_emptyWishlistView;
  self->_emptyWishlistView = 0;
}

- (id)_emptyWishlistView
{
  emptyWishlistView = self->_emptyWishlistView;
  if (!emptyWishlistView)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x1E4FB2070]);
    id v5 = (_UIContentUnavailableView *)objc_msgSend(v4, "initWithFrame:title:style:", 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_emptyWishlistView;
    self->_emptyWishlistView = v5;

    id v7 = self->_emptyWishlistView;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__SKUIWishlistViewController__emptyWishlistView__block_invoke;
    v9[3] = &unk_1E6422250;
    objc_copyWeak(&v10, &location);
    [(_UIContentUnavailableView *)v7 setButtonAction:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    emptyWishlistView = self->_emptyWishlistView;
  }

  return emptyWishlistView;
}

void __48__SKUIWishlistViewController__emptyWishlistView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _signInAction:0];
}

- (void)_finishSignInWithResponse:(id)a3 error:(id)a4
{
  if ([a3 authenticateResponseType] == 4)
  {
    self->_wishlistState = 4;
    [(SKUIWishlistViewController *)self _reloadChildView];
    [(SKUIWishlistViewController *)self _syncWishlist];
  }
}

- (void)_finishSyncWithResult:(BOOL)a3 didChange:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v12 = a5;
  [(SKUISyncWishlistOperation *)self->_syncOperation setResultBlock:0];
  syncOperation = self->_syncOperation;
  self->_syncOperation = 0;

  if (v6)
  {
    self->_wishlistState = 2;
    if (v5) {
      [(SKUIWishlist *)self->_wishlist postChangeNotification];
    }
  }
  else
  {
    uint64_t v9 = v12;
    if (self->_wishlistState != 4) {
      goto LABEL_11;
    }
    if ([v12 code] != 1
      || ([v12 domain],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isEqualToString:*MEMORY[0x1E4FA89B8]],
          v10,
          !v11))
    {
      [(SKUIViewController *)self showError:v12];
      goto LABEL_10;
    }
    self->_wishlistState = 1;
  }
  [(SKUIWishlistViewController *)self _reloadChildView];
LABEL_10:
  uint64_t v9 = v12;
LABEL_11:
}

- (BOOL)_isEditingEnabled
{
  v2 = [(SKUIWishlistViewController *)self _wishlist];
  id v3 = [v2 items];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_itemListViewController
{
  itemListViewController = self->_itemListViewController;
  if (!itemListViewController)
  {
    BOOL v4 = objc_alloc_init(SKUIItemListTableViewController);
    BOOL v5 = self->_itemListViewController;
    self->_itemListViewController = v4;

    BOOL v6 = self->_itemListViewController;
    id v7 = [(SKUIViewController *)self clientContext];
    [(SKUIItemListTableViewController *)v6 setClientContext:v7];

    [(SKUIItemListTableViewController *)self->_itemListViewController setDelegate:self];
    [(SKUIItemListTableViewController *)self->_itemListViewController setRowHeight:84.0];
    [(SKUIItemListTableViewController *)self->_itemListViewController setSelectionStyle:1];
    id v8 = +[SKUIItemArtworkContext wishlistContext];
    [(SKUIItemListTableViewController *)self->_itemListViewController setArtworkContext:v8];
    uint64_t v9 = self->_itemListViewController;
    [v8 imageSizeForItem:0];
    -[SKUIItemListTableViewController setImageBoundingSize:](v9, "setImageBoundingSize:");
    [(SKUIItemListTableViewController *)self->_itemListViewController setItemCellClass:objc_opt_class()];
    [(SKUIWishlistViewController *)self addChildViewController:self->_itemListViewController];
    id v10 = [(SKUIItemListTableViewController *)self->_itemListViewController tableView];
    [v10 setAllowsMultipleSelectionDuringEditing:0];
    int v11 = [MEMORY[0x1E4FB1618] clearColor];
    [v10 setBackgroundColor:v11];

    [v10 setSeparatorStyle:0];
    itemListViewController = self->_itemListViewController;
  }

  return itemListViewController;
}

- (void)_reloadChildView
{
  int64_t v3 = [(SKUIWishlistViewController *)self _wishlistState];
  if ((unint64_t)(v3 - 2) >= 2)
  {
    if (v3 != 1)
    {
      uint64_t v9 = 0;
      goto LABEL_25;
    }
    BOOL v5 = [(SKUIViewController *)self clientContext];
    id v20 = [(SKUIWishlistViewController *)self _emptyWishlistView];
    if (v5) {
      [v5 localizedStringForKey:@"EMPTY_WISHLIST_SIGN_IN_TITLE"];
    }
    else {
    id v12 = +[SKUIClientContext localizedStringForKey:@"EMPTY_WISHLIST_SIGN_IN_TITLE" inBundles:0];
    }
    [v20 setTitle:v12];

    if (v5) {
      [v5 localizedStringForKey:@"EMPTY_WISHLIST_SIGN_IN_MESSAGE"];
    }
    else {
    uint64_t v13 = +[SKUIClientContext localizedStringForKey:@"EMPTY_WISHLIST_SIGN_IN_MESSAGE" inBundles:0];
    }
    [v20 setMessage:v13];

    if (v5) {
      [v5 localizedStringForKey:@"EMPTY_WISHLIST_SIGN_IN_BUTTON"];
    }
    else {
    BOOL v6 = +[SKUIClientContext localizedStringForKey:@"EMPTY_WISHLIST_SIGN_IN_BUTTON" inBundles:0];
    }
    [v20 setButtonTitle:v6];
  }
  else
  {
    BOOL v4 = [(SKUIWishlistViewController *)self _wishlist];
    BOOL v5 = [v4 items];

    if (![v5 count])
    {
      id v20 = [(SKUIWishlistViewController *)self _emptyWishlistView];
      id v10 = [(SKUIViewController *)self clientContext];
      int v11 = v10;
      if (v10) {
        [v10 localizedStringForKey:@"EMPTY_WISHLIST_TITLE"];
      }
      else {
      v14 = +[SKUIClientContext localizedStringForKey:@"EMPTY_WISHLIST_TITLE" inBundles:0];
      }
      [v20 setTitle:v14];

      v15 = [(SKUIViewController *)self clientContext];
      v16 = v15;
      if (v15) {
        [v15 localizedStringForKey:@"EMPTY_WISHLIST_MESSAGE"];
      }
      else {
      uint64_t v17 = +[SKUIClientContext localizedStringForKey:@"EMPTY_WISHLIST_MESSAGE" inBundles:0];
      }
      [v20 setMessage:v17];

      [v20 setButtonTitle:0];
      goto LABEL_24;
    }
    BOOL v6 = [(SKUIWishlistViewController *)self _itemListViewController];
    id v7 = objc_alloc_init(SKUIItemList);
    [(SKUIItemList *)v7 setItems:v5];
    id v8 = [v6 artworkContext];
    [v8 largestImageSizeForItems:v5];
    objc_msgSend(v6, "setImageBoundingSize:");

    [v6 setItemList:v7];
    id v20 = [v6 view];
  }
LABEL_24:

  uint64_t v9 = (_UIContentUnavailableView *)v20;
LABEL_25:
  long long v21 = v9;
  if (v9 != self->_emptyWishlistView)
  {
    [(SKUIWishlistViewController *)self _destroyEmptyWishlistView];
    uint64_t v9 = v21;
  }
  if (v9)
  {
    v18 = [(SKUIWishlistViewController *)self view];
    [(_UIContentUnavailableView *)v21 setAutoresizingMask:18];
    long long v19 = [v18 backgroundColor];
    [(_UIContentUnavailableView *)v21 setBackgroundColor:v19];

    [v18 bounds];
    -[_UIContentUnavailableView setFrame:](v21, "setFrame:");
    [v18 addSubview:v21];

    uint64_t v9 = v21;
  }
}

- (void)_reloadForAccountsChanged
{
  uint64_t v3 = +[SKUIWishlist activeWishlist];
  uint64_t wishlist = (uint64_t)self->_wishlist;
  if (wishlist != v3)
  {
    id obj = (id)v3;
    uint64_t wishlist = [(id)wishlist isEqual:v3];
    uint64_t v3 = (uint64_t)obj;
    if ((wishlist & 1) == 0)
    {
      objc_storeStrong((id *)&self->_wishlist, obj);
      [(SKUIWishlistViewController *)self _destroyEmptyWishlistView];
      self->_wishlistState = 0;
      [(SKUIWishlistViewController *)self _reloadWishlist];
      uint64_t wishlist = [(SKUIWishlistViewController *)self _wishlistState];
      uint64_t v3 = (uint64_t)obj;
      if ((unint64_t)(wishlist - 3) <= 1)
      {
        uint64_t wishlist = [(SKUIWishlistViewController *)self _syncWishlist];
        uint64_t v3 = (uint64_t)obj;
      }
    }
  }

  MEMORY[0x1F41817F8](wishlist, v3);
}

- (void)_reloadNavigationBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v33 = [(SKUIViewController *)self clientContext];
  BOOL v5 = [(SKUIWishlistViewController *)self navigationItem];
  if ((unint64_t)([(SKUIWishlistViewController *)self _wishlistState] - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (self->_editing)
    {
      if (!self->_deleteButton)
      {
        BOOL v6 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x1E4FB14A8]);
        deleteButton = self->_deleteButton;
        self->_deleteButton = v6;

        [(UIBarButtonItem *)self->_deleteButton setAction:sel__deleteAction_];
        [(UIBarButtonItem *)self->_deleteButton setEnabled:0];
        [(UIBarButtonItem *)self->_deleteButton setTarget:self];
        id v8 = self->_deleteButton;
        if (v33) {
          [v33 localizedStringForKey:@"WISH_LIST_DELETE_BUTTON"];
        }
        else {
        id v12 = +[SKUIClientContext localizedStringForKey:@"WISH_LIST_DELETE_BUTTON" inBundles:0];
        }
        [(UIBarButtonItem *)v8 setTitle:v12];

        id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v14 = [MEMORY[0x1E4FB1618] systemRedColor];
        uint64_t v15 = *MEMORY[0x1E4FB0700];
        v16 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, *MEMORY[0x1E4FB0700], 0);

        [(UIBarButtonItem *)self->_deleteButton setTitleTextAttributes:v16 forState:0];
        id v17 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v18 = [MEMORY[0x1E4FB1618] systemGrayColor];
        long long v19 = objc_msgSend(v17, "initWithObjectsAndKeys:", v18, v15, 0);

        [(UIBarButtonItem *)self->_deleteButton setTitleTextAttributes:v19 forState:2];
      }
      id v9 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
      [v9 setAction:sel__toggleEditAction_];
      [v9 setStyle:2];
      [v9 setTarget:self];
      if (v33) {
        [v33 localizedStringForKey:@"WISH_LIST_CANCEL_BUTTON"];
      }
      else {
      id v20 = +[SKUIClientContext localizedStringForKey:@"WISH_LIST_CANCEL_BUTTON" inBundles:0];
      }
      [v9 setTitle:v20];

      [v5 setLeftBarButtonItem:self->_deleteButton animated:v3];
      [v5 setRightBarButtonItem:v9 animated:v3];
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
      [v9 setAction:sel__toggleEditAction_];
      objc_msgSend(v9, "setEnabled:", -[SKUIWishlistViewController _isEditingEnabled](self, "_isEditingEnabled"));
      [v9 setTarget:self];
      if (v33) {
        [v33 localizedStringForKey:@"WISH_LIST_EDIT_BUTTON"];
      }
      else {
      id v10 = +[SKUIClientContext localizedStringForKey:@"WISH_LIST_EDIT_BUTTON" inBundles:0];
      }
      [v9 setTitle:v10];

      [v5 setLeftBarButtonItem:v9 animated:v3];
      [v5 setRightBarButtonItem:0 animated:v3];
      int v11 = self->_deleteButton;
      self->_deleteButton = 0;
    }
  }
  else
  {
    [v5 setLeftBarButtonItem:0];
    [v5 setRightBarButtonItem:0];
  }
  if (!self->_editing)
  {
    long long v21 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v21 userInterfaceIdiom])
    {
      long long v22 = [MEMORY[0x1E4FB1438] sharedApplication];
      v23 = [v22 keyWindow];
      [v23 bounds];
      double v25 = v24;
      double v26 = SKUICompactThreshold();

      if (v25 > v26) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    id v27 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
    [v27 setAction:sel__doneAction_];
    [v27 setStyle:2];
    [v27 setTarget:self];
    if (v33) {
      [v33 localizedStringForKey:@"WISH_LIST_DONE_BUTTON"];
    }
    else {
    v28 = +[SKUIClientContext localizedStringForKey:@"WISH_LIST_DONE_BUTTON" inBundles:0];
    }
    [v27 setTitle:v28];

    [v5 setRightBarButtonItem:v27 animated:v3];
  }
LABEL_27:
  v29 = [(SKUIWishlistViewController *)self navigationController];
  v30 = [v29 view];
  [v30 setSemanticContentAttribute:storeSemanticContentAttribute()];

  v31 = [(SKUIWishlistViewController *)self navigationController];
  v32 = [v31 navigationBar];
  [v32 setSemanticContentAttribute:storeSemanticContentAttribute()];
}

- (void)_reloadWishlist
{
  [(SKUIWishlistViewController *)self _reloadChildView];

  [(SKUIWishlistViewController *)self _reloadNavigationBarAnimated:0];
}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_editing = a3;
    id v8 = [(SKUIWishlistViewController *)self _itemListViewController];
    id v7 = [v8 tableView];
    [v7 setAllowsMultipleSelectionDuringEditing:v5];

    [v8 setEditing:v5 animated:v4];
    [(SKUIWishlistViewController *)self _reloadNavigationBarAnimated:v4];
  }
}

- (void)_syncWishlist
{
  if (!self->_syncOperation)
  {
    BOOL v3 = [SKUISyncWishlistOperation alloc];
    BOOL v4 = [(SKUIViewController *)self clientContext];
    BOOL v5 = [(SKUISyncWishlistOperation *)v3 initWithClientContext:v4];
    syncOperation = self->_syncOperation;
    self->_syncOperation = v5;

    objc_initWeak(&location, self);
    id v7 = self->_syncOperation;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    int v11 = __43__SKUIWishlistViewController__syncWishlist__block_invoke;
    id v12 = &unk_1E64284F0;
    objc_copyWeak(&v13, &location);
    [(SKUISyncWishlistOperation *)v7 setResultBlock:&v9];
    id v8 = SKUIWishlistOperationQueue();
    objc_msgSend(v8, "addOperation:", self->_syncOperation, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __43__SKUIWishlistViewController__syncWishlist__block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SKUIWishlistViewController__syncWishlist__block_invoke_2;
  block[3] = &unk_1E6428C80;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  char v12 = a2;
  char v13 = a3;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
}

void __43__SKUIWishlistViewController__syncWishlist__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishSyncWithResult:*(unsigned __int8 *)(a1 + 48) didChange:*(unsigned __int8 *)(a1 + 49) error:*(void *)(a1 + 32)];
}

- (void)_updateDeleteButton
{
  BOOL v3 = [(SKUIItemListTableViewController *)self->_itemListViewController tableView];
  BOOL v4 = [v3 indexPathsForSelectedRows];
  uint64_t v5 = [v4 count];

  [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:0];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v6 setNumberStyle:1];
    id v7 = [(SKUIViewController *)self clientContext];
    id v8 = v7;
    if (v7) {
      [v7 localizedStringForKey:@"WISH_LIST_DELETE_BUTTON_SELECTED"];
    }
    else {
    id v11 = +[SKUIClientContext localizedStringForKey:@"WISH_LIST_DELETE_BUTTON_SELECTED" inBundles:0];
    }

    [(UIBarButtonItem *)self->_deleteButton setEnabled:1];
    deleteButton = self->_deleteButton;
    char v13 = NSString;
    v14 = [NSNumber numberWithInteger:v5];
    uint64_t v15 = [v6 stringFromNumber:v14];
    v16 = [v13 stringWithValidatedFormat:v11, @"%@", 0, v15 validFormatSpecifiers error];
    [(UIBarButtonItem *)deleteButton setTitle:v16];
  }
  else
  {
    [(UIBarButtonItem *)self->_deleteButton setEnabled:0];
    uint64_t v9 = self->_deleteButton;
    id v10 = [(SKUIViewController *)self clientContext];
    id v6 = v10;
    if (v10) {
      [v10 localizedStringForKey:@"WISH_LIST_DELETE_BUTTON"];
    }
    else {
    id v11 = +[SKUIClientContext localizedStringForKey:@"WISH_LIST_DELETE_BUTTON" inBundles:0];
    }
    [(UIBarButtonItem *)v9 setTitle:v11];
  }

  id v17 = (void *)MEMORY[0x1E4FB1EB0];

  [v17 setAnimationsEnabled:1];
}

- (id)_wishlist
{
  uint64_t wishlist = self->_wishlist;
  if (!wishlist)
  {
    BOOL v4 = +[SKUIWishlist activeWishlist];
    uint64_t v5 = self->_wishlist;
    self->_uint64_t wishlist = v4;

    uint64_t wishlist = self->_wishlist;
  }

  return wishlist;
}

- (int64_t)_wishlistState
{
  int64_t result = self->_wishlistState;
  if (!result)
  {
    BOOL v4 = [MEMORY[0x1E4FA8100] defaultStore];
    uint64_t v5 = [v4 activeAccount];

    if (v5)
    {
      id v6 = [v5 uniqueIdentifier];
      uint64_t v7 = [v6 longLongValue];

      if ([MEMORY[0x1E4FA8398] existsForAccountIdentifier:v7])
      {
        id v8 = (void *)[objc_alloc(MEMORY[0x1E4FA8398]) initWithAccountIdentifier:v7];
        uint64_t v9 = [v8 lastSyncTime];

        int64_t v10 = 3;
        if (!v9) {
          int64_t v10 = 4;
        }
        self->_wishlistState = v10;

        goto LABEL_10;
      }
      int64_t v11 = 4;
    }
    else
    {
      int64_t v11 = 1;
    }
    self->_wishlistState = v11;
LABEL_10:

    return self->_wishlistState;
  }
  return result;
}

- (SKUIWishlistDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIWishlistDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wishlist, 0);
  objc_storeStrong((id *)&self->_syncOperation, 0);
  objc_storeStrong((id *)&self->_itemListViewController, 0);
  objc_storeStrong((id *)&self->_emptyWishlistView, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIWishlistViewController initWithNibName:bundle:]";
}

@end