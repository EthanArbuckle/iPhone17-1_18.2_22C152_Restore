@interface SUUIIPadDownloadsViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NSArray)downloads;
- (SUUIClientContext)clientContext;
- (SUUIDownloadsChildViewControllerDelegate)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_cancelAction:(id)a3;
- (void)_deleteAction:(id)a3;
- (void)_editAction:(id)a3;
- (void)_reload;
- (void)_reloadLayout;
- (void)_reloadNavigationItem;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)reloadDownloadsAtIndexes:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloads:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SUUIIPadDownloadsViewController

- (void)setDownloads:(id)a3
{
  id v3 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  v5 = (NSArray *)a3;
  p_downloads = &self->_downloads;
  if (self->_downloads != v5)
  {
    v7 = [MEMORY[0x263EFF980] array];
    if (self->_editing)
    {
      id v19 = v3;
      v20 = v5;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v8 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = -[NSArray objectAtIndex:](*p_downloads, "objectAtIndex:", [*(id *)(*((void *)&v21 + 1) + 8 * v12) item]);
            v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "persistentIdentifier"));
            [v7 addObject:v14];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v10);
      }

      id v3 = v19;
      v5 = v20;
    }
    objc_storeStrong((id *)&self->_downloads, v3);
    [(SUUIIPadDownloadsViewController *)self _reload];
    if ([(NSArray *)*p_downloads count])
    {
      uint64_t v15 = 0;
      while (1)
      {
        v16 = [(NSArray *)*p_downloads objectAtIndex:v15];
        v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "persistentIdentifier"));
        if (![v7 containsObject:v17]) {
          goto LABEL_16;
        }
        int v18 = [v16 isCancelable];

        if (v18) {
          break;
        }
LABEL_17:

        if (++v15 >= [(NSArray *)*p_downloads count]) {
          goto LABEL_18;
        }
      }
      v17 = [MEMORY[0x263F088C8] indexPathForItem:v15 inSection:0];
      [(UICollectionView *)self->_collectionView selectItemAtIndexPath:v17 animated:0 scrollPosition:0];
LABEL_16:

      goto LABEL_17;
    }
LABEL_18:
  }
}

- (void)reloadDownloadsAtIndexes:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__SUUIIPadDownloadsViewController_reloadDownloadsAtIndexes___block_invoke;
  v3[3] = &unk_265400FC8;
  v3[4] = self;
  [a3 enumerateIndexesUsingBlock:v3];
}

void __60__SUUIIPadDownloadsViewController_reloadDownloadsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 976);
  v5 = [MEMORY[0x263F088C8] indexPathForRow:a2 inSection:0];
  id v12 = [v4 cellForItemAtIndexPath:v5];

  v6 = [*(id *)(*(void *)(a1 + 32) + 984) objectAtIndex:a2];
  v7 = [v12 cellView];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
  uint64_t v9 = [WeakRetained childViewController:*(void *)(a1 + 32) artworkForDownload:v6];
  SUUIConfigureDownloadsCellView(v7, v6, v9, 1u, *(void **)(*(void *)(a1 + 32) + 1016));

  if (*(unsigned char *)(*(void *)(a1 + 32) + 1008))
  {
    if ([v6 isCancelable]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    uint64_t v11 = [v12 cellView];
    [v11 setButtonType:0];
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v12 setCellState:v10];
}

- (void)loadView
{
  uint64_t v9 = objc_alloc_init(SUUIDownloadsView);
  [(SUUIIPadDownloadsViewController *)self setView:v9];
  id v3 = objc_alloc_init(SUUISearchCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:0.0];
  [(UICollectionViewFlowLayout *)v3 setMinimumLineSpacing:0.0];
  [(SUUISearchCollectionViewFlowLayout *)v3 setBackfills:0];
  id v4 = objc_alloc(MEMORY[0x263F82528]);
  [(SUUIDownloadsView *)v9 bounds];
  v5 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"a"];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  v7 = self->_collectionView;
  v8 = [MEMORY[0x263F825C8] whiteColor];
  [(UICollectionView *)v7 setBackgroundColor:v8];

  [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:1];
  [(UICollectionView *)self->_collectionView setAllowsMultipleSelection:1];
  [(UICollectionView *)self->_collectionView setPrefetchingEnabled:0];
  [(SUUIDownloadsView *)v9 setContentView:self->_collectionView];
  [(SUUIIPadDownloadsViewController *)self _reload];
}

- (void)viewDidLayoutSubviews
{
  [(SUUIIPadDownloadsViewController *)self _reloadLayout];
  v3.receiver = self;
  v3.super_class = (Class)SUUIIPadDownloadsViewController;
  [(SUUIIPadDownloadsViewController *)&v3 viewDidLayoutSubviews];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  downloads = self->_downloads;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = -[NSArray objectAtIndex:](downloads, "objectAtIndex:", [v7 item]);
  uint64_t v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"a" forIndexPath:v7];

  uint64_t v11 = [v10 cellView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = [WeakRetained childViewController:self artworkForDownload:v9];
  SUUIConfigureDownloadsCellView(v11, v9, v13, 1u, self->_clientContext);

  if (self->_editing)
  {
    if ([v9 isCancelable]) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
    uint64_t v15 = [v10 cellView];
    [v15 setButtonType:0];
  }
  else
  {
    uint64_t v14 = 0;
  }
  [v10 setCellState:v14];

  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_downloads count];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v4 = -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(a4, "item", a3));
  char v5 = [v4 isCancelable];

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7 = a4;
  if (self->_editing)
  {
    [(SUUIIPadDownloadsViewController *)self _reloadNavigationItem];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", [v7 item]);
    [WeakRetained childViewController:self performActionForDownload:v6];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v7 = a4;
  if (self->_editing)
  {
    [(SUUIIPadDownloadsViewController *)self _reloadNavigationItem];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", [v7 item]);
    [WeakRetained childViewController:self performActionForDownload:v6];
  }
}

- (void)_editAction:(id)a3
{
  self->_editing = 1;
  [(SUUIIPadDownloadsViewController *)self _reload];
}

- (void)_cancelAction:(id)a3
{
  self->_editing = 0;
  [(SUUIIPadDownloadsViewController *)self _reload];
}

- (void)_deleteAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v5 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", [*(id *)(*((void *)&v12 + 1) + 8 * v9) item]);
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained childViewController:self removeDownloads:v4];

  self->_editing = 0;
  [(SUUIIPadDownloadsViewController *)self _reload];
}

- (void)_reload
{
  if ([(NSArray *)self->_downloads count])
  {
    [(UICollectionView *)self->_collectionView reloadData];
    objc_super v3 = [(SUUIIPadDownloadsViewController *)self view];
    [v3 setOverlayView:0];
  }
  else
  {
    if (!self->_noContentView)
    {
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"NO_CONTENT_TITLE" inTable:@"Download"];
      }
      else {
      char v5 = +[SUUIClientContext localizedStringForKey:@"NO_CONTENT_TITLE" inBundles:0 inTable:@"Download"];
      }
      uint64_t v6 = self->_clientContext;
      if (v6) {
        [(SUUIClientContext *)v6 localizedStringForKey:@"NO_CONTENT_MESSAGE" inTable:@"Download"];
      }
      else {
      uint64_t v7 = +[SUUIClientContext localizedStringForKey:@"NO_CONTENT_MESSAGE" inBundles:0 inTable:@"Download"];
      }
      id v8 = objc_alloc(MEMORY[0x263F82EF0]);
      uint64_t v9 = (_UIContentUnavailableView *)objc_msgSend(v8, "initWithFrame:title:style:", v5, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      noContentView = self->_noContentView;
      self->_noContentView = v9;

      uint64_t v11 = self->_noContentView;
      long long v12 = [MEMORY[0x263F825C8] whiteColor];
      [(_UIContentUnavailableView *)v11 setBackgroundColor:v12];

      [(_UIContentUnavailableView *)self->_noContentView setMessage:v7];
    }
    long long v13 = [(SUUIIPadDownloadsViewController *)self view];
    [v13 setOverlayView:self->_noContentView];

    [(UICollectionView *)self->_collectionView reloadData];
  }
  [(SUUIIPadDownloadsViewController *)self _reloadNavigationItem];
}

- (void)_reloadLayout
{
  collectionView = self->_collectionView;
  double v4 = SUUILayoutGuideInsets(self);
  SUUIScrollViewSetDefaultContentInsets(collectionView, v4, v5, v6, v7);
  id v8 = [(SUUIIPadDownloadsViewController *)self view];
  [v8 frame];
  double v10 = v9;

  uint64_t v11 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  id v13 = v11;
  double v12 = 2.0;
  if (v10 > 1000.0) {
    double v12 = 3.0;
  }
  objc_msgSend(v11, "setItemSize:", v10 / v12, 100.0);
  [v13 invalidateLayout];
}

- (void)_reloadNavigationItem
{
  v22[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(SUUIIPadDownloadsViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:1];

  if ([(NSArray *)self->_downloads count])
  {
    if (self->_editing)
    {
      double v4 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
      uint64_t v5 = [v4 count];

      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"CANCEL" inTable:@"Download"];
      }
      else {
      double v7 = +[SUUIClientContext localizedStringForKey:@"CANCEL" inBundles:0 inTable:@"Download"];
      }
      double v10 = self->_clientContext;
      if (v5)
      {
        if (v10) {
          [(SUUIClientContext *)v10 localizedStringForKey:@"DELETE_FORMAT" inTable:@"Download"];
        }
        else {
        uint64_t v11 = +[SUUIClientContext localizedStringForKey:@"DELETE_FORMAT" inBundles:0 inTable:@"Download"];
        }
        double v12 = NSString;
        id v13 = [NSNumber numberWithInteger:v5];
        long long v14 = [v12 stringWithValidatedFormat:v11, @"%@", 0, v13 validFormatSpecifiers error];
      }
      else
      {
        if (v10) {
          [(SUUIClientContext *)v10 localizedStringForKey:@"DELETE" inTable:@"Download"];
        }
        else {
        long long v14 = +[SUUIClientContext localizedStringForKey:@"DELETE" inBundles:0 inTable:@"Download"];
        }
      }
      long long v15 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v7 style:2 target:self action:sel__cancelAction_];
      v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v14 style:0 target:self action:sel__deleteAction_];
      uint64_t v17 = [MEMORY[0x263F825C8] systemRedColor];
      [v16 setTintColor:v17];

      [v16 setEnabled:v5 > 0];
      int v18 = [(SUUIIPadDownloadsViewController *)self navigationItem];
      v21[0] = v15;
      v21[1] = v16;
      id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
      [v18 setLeftBarButtonItems:v19];
    }
    else
    {
      double v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:2 target:self action:sel__editAction_];
      id v8 = [(SUUIIPadDownloadsViewController *)self navigationItem];
      v22[0] = v7;
      double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      [v8 setLeftBarButtonItems:v9];
    }
  }
  else
  {
    id v20 = [(SUUIIPadDownloadsViewController *)self navigationItem];
    [v20 setLeftBarButtonItems:0];
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIDownloadsChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIDownloadsChildViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)downloads
{
  return self->_downloads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end