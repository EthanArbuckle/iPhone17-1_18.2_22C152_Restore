@interface VUIHomeShareViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)homeShares;
- (VUIHomeShareViewController)init;
- (VUIHomeShareViewControllerDelegate)delegate;
- (VUILibraryMenuItemViewCell)menuItemSizingCell;
- (VUIViewControllerContentPresenter)contentPresenter;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_homeShareMediaLibrariesDidChange:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureWithCollectionView:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setContentPresenter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeShares:(id)a3;
- (void)setMenuItemSizingCell:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation VUIHomeShareViewController

- (VUIHomeShareViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)VUIHomeShareViewController;
  v2 = [(VUILibraryStackViewController *)&v8 init];
  if (v2)
  {
    v3 = +[VUIMediaLibraryManager defaultManager];
    v4 = [v3 homeShareMediaLibraries];
    [(VUIHomeShareViewController *)v2 setHomeShares:v4];

    v5 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v2->_contentPresenter;
    v2->_contentPresenter = v5;

    [(VUIViewControllerContentPresenter *)v2->_contentPresenter setLogName:@"VUIHomeShareViewController"];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIHomeShareViewController;
  [(VUIHomeShareViewController *)&v4 dealloc];
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)VUIHomeShareViewController;
  [(VUIHomeShareViewController *)&v8 loadView];
  v3 = +[VUILocalizationManager sharedInstance];
  objc_super v4 = [v3 localizedStringForKey:@"LIBRARY_HOMESHARES"];
  [(VUIHomeShareViewController *)self setTitle:v4];

  v5 = objc_alloc_init(VUILibraryMenuItemViewCell);
  menuItemSizingCell = self->_menuItemSizingCell;
  self->_menuItemSizingCell = v5;

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__homeShareMediaLibrariesDidChange_ name:@"VUIMediaLibraryManagerHomeSharesDidChangeNotification" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VUIHomeShareViewController;
  -[VUIHomeShareViewController viewWillAppear:](&v16, sel_viewWillAppear_);
  v5 = [(VUILibraryStackViewController *)self stackCollectionView];
  v6 = [v5 indexPathsForSelectedItems];
  v7 = [v6 firstObject];

  if (v7)
  {
    objc_super v8 = [(VUIHomeShareViewController *)self transitionCoordinator];
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __45__VUIHomeShareViewController_viewWillAppear___block_invoke;
      v12[3] = &unk_1E6DF3E68;
      id v13 = v5;
      id v14 = v7;
      BOOL v15 = a3;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__VUIHomeShareViewController_viewWillAppear___block_invoke_2;
      v9[3] = &unk_1E6DF3E90;
      id v10 = v13;
      id v11 = v14;
      [v8 animateAlongsideTransition:v12 completion:v9];
    }
    else
    {
      [v5 deselectItemAtIndexPath:v7 animated:1];
    }
  }
  +[VUILibraryMetrics recordPageEventWithPageType:@"LibraryHomeSharing"];
}

uint64_t __45__VUIHomeShareViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __45__VUIHomeShareViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    objc_super v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 selectItemAtIndexPath:v5 animated:0 scrollPosition:0];
  }
  return result;
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUIHomeShareViewController;
  [(VUIHomeShareViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(VUIHomeShareViewController *)self contentPresenter];
  objc_super v4 = [(VUIHomeShareViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)VUIHomeShareViewController;
  [(VUILibraryStackViewController *)&v10 viewDidLoad];
  v3 = [(VUILibraryStackViewController *)self stackCollectionView];
  [v3 reloadData];

  objc_super v4 = [(VUIHomeShareViewController *)self contentPresenter];
  [v4 setRootViewForViewController:self];

  objc_super v5 = [(VUIHomeShareViewController *)self contentPresenter];
  v6 = [(VUILibraryStackViewController *)self stackCollectionView];
  [v5 setContentView:v6];

  v7 = [(VUIHomeShareViewController *)self contentPresenter];
  [v7 setCurrentContentViewType:3];

  objc_super v8 = [(VUIHomeShareViewController *)self view];
  v9 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library.id=\"HomeSharing\""];
  [v8 setAccessibilityIdentifier:v9];
}

- (void)configureWithCollectionView:(id)a3
{
  id v5 = a3;
  [v5 setDataSource:self];
  objc_super v4 = (void *)MEMORY[0x1E4FB1F48];
  [v5 bounds];
  objc_msgSend(v4, "vui_paddingForWindowWidth:", CGRectGetWidth(v7));
  objc_msgSend(v5, "setContentInset:");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  CGRect v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"VUILibraryMenuCellReuseIdentifier" forIndexPath:v6];
  objc_super v8 = [(VUIHomeShareViewController *)self homeShares];
  uint64_t v9 = [v6 row];

  objc_super v10 = [v8 objectAtIndex:v9];

  id v11 = [v10 title];
  v12 = [v7 titleLabel];
  id v13 = [v12 textLayout];
  id v14 = [v7 titleLabel];
  id v15 = +[VUILabel labelWithString:v11 textLayout:v13 existingLabel:v14];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  objc_super v4 = [(VUIHomeShareViewController *)self homeShares];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  CGRect v7 = [(VUIHomeShareViewController *)self view];
  [v7 bounds];
  double Width = CGRectGetWidth(v22);

  uint64_t v9 = [(VUIHomeShareViewController *)self homeShares];
  uint64_t v10 = [v6 row];

  id v11 = [v9 objectAtIndex:v10];

  v12 = [v11 title];
  id v13 = [(VUILibraryMenuItemViewCell *)self->_menuItemSizingCell titleLabel];
  id v14 = [v13 textLayout];
  id v15 = [(VUILibraryMenuItemViewCell *)self->_menuItemSizingCell titleLabel];
  id v16 = +[VUILabel labelWithString:v12 textLayout:v14 existingLabel:v15];

  -[VUILibraryMenuItemViewCell sizeThatFits:](self->_menuItemSizingCell, "sizeThatFits:", Width, 1.79769313e308);
  double v18 = v17;

  double v19 = Width;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(VUIHomeShareViewController *)self homeShares];
  uint64_t v7 = [v5 row];

  id v9 = [v6 objectAtIndex:v7];

  objc_super v8 = [(VUIHomeShareViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 homeShareViewController:self didSelectHomeShare:v9];
  }
}

- (void)_homeShareMediaLibrariesDidChange:(id)a3
{
  objc_super v4 = +[VUIMediaLibraryManager defaultManager];
  id v5 = [v4 homeShareMediaLibraries];
  [(VUIHomeShareViewController *)self setHomeShares:v5];

  id v8 = [(VUIHomeShareViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(VUIHomeShareViewController *)self homeShares];
    [v8 homeShareViewController:self didUpdateWith:v6];
  }
  uint64_t v7 = [(VUILibraryStackViewController *)self stackCollectionView];
  [v7 reloadData];
}

- (VUIHomeShareViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIHomeShareViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)homeShares
{
  return self->_homeShares;
}

- (void)setHomeShares:(id)a3
{
}

- (VUILibraryMenuItemViewCell)menuItemSizingCell
{
  return self->_menuItemSizingCell;
}

- (void)setMenuItemSizingCell:(id)a3
{
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_menuItemSizingCell, 0);
  objc_storeStrong((id *)&self->_homeShares, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end