@interface SKUIIPhoneDownloadsViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSArray)downloads;
- (SKUIClientContext)clientContext;
- (SKUIDownloadsChildViewControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reload;
- (void)loadView;
- (void)reloadDownloadsAtIndexes:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloads:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation SKUIIPhoneDownloadsViewController

- (void)reloadDownloadsAtIndexes:(id)a3
{
  downloads = self->_downloads;
  id v5 = a3;
  v6 = (void *)[(NSArray *)downloads copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SKUIIPhoneDownloadsViewController_reloadDownloadsAtIndexes___block_invoke;
  v8[3] = &unk_1E6424780;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:v8];
}

void __62__SKUIIPhoneDownloadsViewController_reloadDownloadsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 976);
  id v5 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:0];
  id v10 = [v4 cellForRowAtIndexPath:v5];

  v6 = 0;
  if ([*(id *)(a1 + 40) count] > a2)
  {
    v6 = [*(id *)(a1 + 40) objectAtIndex:a2];
  }
  id v7 = [v10 cellView];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 992));
  id v9 = [WeakRetained childViewController:*(void *)(a1 + 32) artworkForDownload:v6];
  SKUIConfigureDownloadsCellView(v7, v6, v9, 0, *(void **)(*(void *)(a1 + 32) + 1008));
}

- (void)setDownloads:(id)a3
{
  id v5 = (NSArray *)a3;
  p_downloads = &self->_downloads;
  if (self->_downloads != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_downloads, a3);
    p_downloads = (NSArray **)[(SKUIIPhoneDownloadsViewController *)self _reload];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_downloads, v5);
}

- (void)loadView
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIPhoneDownloadsViewController loadView]";
}

- (void)viewDidLayoutSubviews
{
  tableView = self->_tableView;
  double v4 = SKUILayoutGuideInsets(self);
  SKUIScrollViewSetDefaultContentInsets(tableView, v4, v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)SKUIIPhoneDownloadsViewController;
  [(SKUIIPhoneDownloadsViewController *)&v8 viewDidLayoutSubviews];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  double v7 = -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", [v8 row]);
  [WeakRetained childViewController:self performActionForDownload:v7];

  [(UITableView *)self->_tableView deselectRowAtIndexPath:v8 animated:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  downloads = self->_downloads;
  id v6 = a4;
  double v7 = -[NSArray objectAtIndex:](downloads, "objectAtIndex:", [v6 item]);
  id v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"a" forIndexPath:v6];

  id v9 = [v8 cellView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = [WeakRetained childViewController:self artworkForDownload:v7];
  SKUIConfigureDownloadsCellView(v9, v7, v11, 0, self->_clientContext);

  [v8 setSelectionStyle:0];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPhoneDownloadsViewController tableView:numberOfRowsInSection:]();
  }
  return [(NSArray *)self->_downloads count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 64.0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 row];
  if (v6 >= [(NSArray *)self->_downloads count])
  {
    char v8 = 0;
  }
  else
  {
    double v7 = -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", [v5 row]);
    char v8 = [v7 isCancelable];
  }
  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    p_delegate = &self->_delegate;
    id v7 = a5;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    downloads = self->_downloads;
    uint64_t v10 = [v7 row];

    v11 = [(NSArray *)downloads objectAtIndex:v10];
    v13[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [WeakRetained childViewController:self removeDownloads:v12];
  }
}

- (void)_reload
{
  if ([(NSArray *)self->_downloads count])
  {
    [(UITableView *)self->_tableView reloadData];
    v3 = [(SKUIIPhoneDownloadsViewController *)self view];
    id v14 = v3;
    double v4 = 0;
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
      unint64_t v6 = +[SKUIClientContext localizedStringForKey:@"NO_CONTENT_TITLE" inBundles:0 inTable:@"Download"];
      }
      id v7 = self->_clientContext;
      if (v7) {
        [(SKUIClientContext *)v7 localizedStringForKey:@"NO_CONTENT_MESSAGE" inTable:@"Download"];
      }
      else {
      char v8 = +[SKUIClientContext localizedStringForKey:@"NO_CONTENT_MESSAGE" inBundles:0 inTable:@"Download"];
      }
      id v9 = objc_alloc(MEMORY[0x1E4FB2070]);
      uint64_t v10 = (_UIContentUnavailableView *)objc_msgSend(v9, "initWithFrame:title:style:", v6, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      noContentView = self->_noContentView;
      self->_noContentView = v10;

      v12 = self->_noContentView;
      v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [(_UIContentUnavailableView *)v12 setBackgroundColor:v13];

      [(_UIContentUnavailableView *)self->_noContentView setMessage:v8];
    }
    [(UITableView *)self->_tableView reloadData];
    v3 = [(SKUIIPhoneDownloadsViewController *)self view];
    id v14 = v3;
    double v4 = self->_noContentView;
  }
  [v3 setOverlayView:v4];
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
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_noContentView, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

- (void)tableView:numberOfRowsInSection:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIPhoneDownloadsViewController tableView:numberOfRowsInSection:]";
}

@end