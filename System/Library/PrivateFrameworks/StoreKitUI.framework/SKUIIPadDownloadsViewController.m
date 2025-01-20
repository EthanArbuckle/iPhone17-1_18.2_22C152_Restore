@interface SKUIIPadDownloadsViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NSArray)downloads;
- (SKUIClientContext)clientContext;
- (SKUIDownloadsChildViewControllerDelegate)delegate;
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

@implementation SKUIIPadDownloadsViewController

- (void)setDownloads:(id)a3
{
  id v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v5 = (NSArray *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIIPadDownloadsViewController setDownloads:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_downloads = &self->_downloads;
  if (self->_downloads != v5)
  {
    v15 = [MEMORY[0x1E4F1CA48] array];
    if (self->_editing)
    {
      id v27 = v3;
      v28 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v16 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = -[NSArray objectAtIndex:](*p_downloads, "objectAtIndex:", [*(id *)(*((void *)&v29 + 1) + 8 * v20) item]);
            v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v21, "persistentIdentifier"));
            [v15 addObject:v22];

            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v18);
      }

      id v3 = v27;
      v5 = v28;
    }
    objc_storeStrong((id *)&self->_downloads, v3);
    [(SKUIIPadDownloadsViewController *)self _reload];
    if ([(NSArray *)*p_downloads count])
    {
      uint64_t v23 = 0;
      while (1)
      {
        v24 = [(NSArray *)*p_downloads objectAtIndex:v23];
        v25 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v24, "persistentIdentifier"));
        if (![v15 containsObject:v25]) {
          goto LABEL_20;
        }
        int v26 = [v24 isCancelable];

        if (v26) {
          break;
        }
LABEL_21:

        if (++v23 >= [(NSArray *)*p_downloads count]) {
          goto LABEL_22;
        }
      }
      v25 = [MEMORY[0x1E4F28D58] indexPathForItem:v23 inSection:0];
      [(UICollectionView *)self->_collectionView selectItemAtIndexPath:v25 animated:0 scrollPosition:0];
LABEL_20:

      goto LABEL_21;
    }
LABEL_22:
  }
}

- (void)reloadDownloadsAtIndexes:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIIPadDownloadsViewController reloadDownloadsAtIndexes:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__SKUIIPadDownloadsViewController_reloadDownloadsAtIndexes___block_invoke;
  v13[3] = &unk_1E6426698;
  v13[4] = self;
  [v4 enumerateIndexesUsingBlock:v13];
}

void __60__SKUIIPadDownloadsViewController_reloadDownloadsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 976);
  BOOL v5 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:0];
  id v12 = [v4 cellForItemAtIndexPath:v5];

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 984) objectAtIndex:a2];
  uint64_t v7 = [v12 cellView];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
  uint64_t v9 = [WeakRetained childViewController:*(void *)(a1 + 32) artworkForDownload:v6];
  SKUIConfigureDownloadsCellView(v7, v6, v9, 1u, *(void **)(*(void *)(a1 + 32) + 1016));

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
}

- (void)viewDidLayoutSubviews
{
  [(SKUIIPadDownloadsViewController *)self _reloadLayout];
  v3.receiver = self;
  v3.super_class = (Class)SKUIIPadDownloadsViewController;
  [(SKUIIPadDownloadsViewController *)&v3 viewDidLayoutSubviews];
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
  uint64_t v13 = [WeakRetained childViewController:self artworkForDownload:v9];
  SKUIConfigureDownloadsCellView(v11, v9, v13, 1u, self->_clientContext);

  if (self->_editing)
  {
    if ([v9 isCancelable]) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
    v15 = [v10 cellView];
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIIPadDownloadsViewController collectionView:numberOfItemsInSection:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
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
    [(SKUIIPadDownloadsViewController *)self _reloadNavigationItem];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v6 = -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", [v7 item]);
    [WeakRetained childViewController:self performActionForDownload:v6];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v7 = a4;
  if (self->_editing)
  {
    [(SKUIIPadDownloadsViewController *)self _reloadNavigationItem];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v6 = -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", [v7 item]);
    [WeakRetained childViewController:self performActionForDownload:v6];
  }
}

- (void)_editAction:(id)a3
{
  self->_editing = 1;
  [(SKUIIPadDownloadsViewController *)self _reload];
}

- (void)_cancelAction:(id)a3
{
  self->_editing = 0;
  [(SKUIIPadDownloadsViewController *)self _reload];
}

- (void)_deleteAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
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
  [(SKUIIPadDownloadsViewController *)self _reload];
}

- (void)_reload
{
  if ([(NSArray *)self->_downloads count])
  {
    [(UICollectionView *)self->_collectionView reloadData];
    objc_super v3 = [(SKUIIPadDownloadsViewController *)self view];
    [v3 setOverlayView:0];
  }
  else
  {
    if (!self->_noContentView)
    {
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SKUIClientContext *)clientContext localizedStringForKey:@"NO_CONTENT_TITLE" inTable:@"Download"];
      }
      else {
      char v5 = +[SKUIClientContext localizedStringForKey:@"NO_CONTENT_TITLE" inBundles:0 inTable:@"Download"];
      }
      uint64_t v6 = self->_clientContext;
      if (v6) {
        [(SKUIClientContext *)v6 localizedStringForKey:@"NO_CONTENT_MESSAGE" inTable:@"Download"];
      }
      else {
      uint64_t v7 = +[SKUIClientContext localizedStringForKey:@"NO_CONTENT_MESSAGE" inBundles:0 inTable:@"Download"];
      }
      id v8 = objc_alloc(MEMORY[0x1E4FB2070]);
      uint64_t v9 = (_UIContentUnavailableView *)objc_msgSend(v8, "initWithFrame:title:style:", v5, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      noContentView = self->_noContentView;
      self->_noContentView = v9;

      uint64_t v11 = self->_noContentView;
      long long v12 = [MEMORY[0x1E4FB1618] whiteColor];
      [(_UIContentUnavailableView *)v11 setBackgroundColor:v12];

      [(_UIContentUnavailableView *)self->_noContentView setMessage:v7];
    }
    long long v13 = [(SKUIIPadDownloadsViewController *)self view];
    [v13 setOverlayView:self->_noContentView];

    [(UICollectionView *)self->_collectionView reloadData];
  }

  [(SKUIIPadDownloadsViewController *)self _reloadNavigationItem];
}

- (void)_reloadLayout
{
  collectionView = self->_collectionView;
  double v4 = SKUILayoutGuideInsets(self);
  SKUIScrollViewSetDefaultContentInsets(collectionView, v4, v5, v6, v7);
  id v8 = [(SKUIIPadDownloadsViewController *)self view];
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
  v22[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(SKUIIPadDownloadsViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:1];

  if ([(NSArray *)self->_downloads count])
  {
    if (self->_editing)
    {
      double v4 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
      uint64_t v5 = [v4 count];

      clientContext = self->_clientContext;
      if (clientContext) {
        [(SKUIClientContext *)clientContext localizedStringForKey:@"CANCEL" inTable:@"Download"];
      }
      else {
      double v7 = +[SKUIClientContext localizedStringForKey:@"CANCEL" inBundles:0 inTable:@"Download"];
      }
      double v10 = self->_clientContext;
      if (v5)
      {
        if (v10) {
          [(SKUIClientContext *)v10 localizedStringForKey:@"DELETE_FORMAT" inTable:@"Download"];
        }
        else {
        uint64_t v11 = +[SKUIClientContext localizedStringForKey:@"DELETE_FORMAT" inBundles:0 inTable:@"Download"];
        }
        double v12 = NSString;
        id v13 = [NSNumber numberWithInteger:v5];
        long long v14 = [v12 stringWithValidatedFormat:v11, @"%@", 0, v13 validFormatSpecifiers error];
      }
      else
      {
        if (v10) {
          [(SKUIClientContext *)v10 localizedStringForKey:@"DELETE" inTable:@"Download"];
        }
        else {
        long long v14 = +[SKUIClientContext localizedStringForKey:@"DELETE" inBundles:0 inTable:@"Download"];
        }
      }
      long long v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v7 style:2 target:self action:sel__cancelAction_];
      v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v14 style:0 target:self action:sel__deleteAction_];
      uint64_t v17 = [MEMORY[0x1E4FB1618] systemRedColor];
      [v16 setTintColor:v17];

      [v16 setEnabled:v5 > 0];
      uint64_t v18 = [(SKUIIPadDownloadsViewController *)self navigationItem];
      v21[0] = v15;
      v21[1] = v16;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      [v18 setLeftBarButtonItems:v19];
    }
    else
    {
      double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__editAction_];
      id v8 = [(SKUIIPadDownloadsViewController *)self navigationItem];
      v22[0] = v7;
      double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [v8 setLeftBarButtonItems:v9];
    }
  }
  else
  {
    id v20 = [(SKUIIPadDownloadsViewController *)self navigationItem];
    [v20 setLeftBarButtonItems:0];
  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIDownloadsChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIDownloadsChildViewControllerDelegate *)WeakRetained;
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

- (void)setDownloads:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadDownloadsAtIndexes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)collectionView:(uint64_t)a3 numberOfItemsInSection:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end