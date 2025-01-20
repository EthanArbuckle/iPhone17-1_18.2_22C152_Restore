@interface DownloadsViewController
+ (id)tableViewCellForSizeEstimation;
- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGSize)preferredContentSize;
- (DownloadOpenHandler)downloadOpenHandler;
- (DownloadsViewController)initWithStyle:(int64_t)a3;
- (id)quickLookTransitionViewForDownload:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)maximumNumberOfRows;
- (int64_t)minimumNumberOfRows;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_clearAllDownloads;
- (void)_dismiss;
- (void)_downloadsDidChange:(id)a3;
- (void)_updateDoneButton;
- (void)cancelDownload:(id)a3;
- (void)resumeDownload:(id)a3;
- (void)revealDownload:(id)a3;
- (void)setDownloadOpenHandler:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DownloadsViewController

+ (id)tableViewCellForSizeEstimation
{
  return +[DownloadTableViewCell tableViewCellForSizeEstimation];
}

- (DownloadsViewController)initWithStyle:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)DownloadsViewController;
  v3 = [(DownloadsViewController *)&v18 initWithStyle:0];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F3AF68] sharedManager];
    downloadManager = v3->_downloadManager;
    v3->_downloadManager = (_SFDownloadManager *)v4;

    v6 = [(_SFDownloadManager *)v3->_downloadManager downloads];
    uint64_t v7 = [v6 mutableCopy];
    downloads = v3->_downloads;
    v3->_downloads = (NSMutableArray *)v7;

    v9 = [(DownloadsViewController *)v3 navigationItem];
    v10 = _WBSLocalizedString();
    [v9 setTitle:v10];

    id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v12 = _WBSLocalizedString();
    v13 = (void *)[v11 initWithTitle:v12 style:0 target:v3 action:sel__clearAllDownloads];
    [v9 setRightBarButtonItem:v13];

    v14 = [v9 rightBarButtonItem];
    [v14 setAccessibilityIdentifier:@"ClearDownloads"];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v3 selector:sel__downloadsDidChange_ name:*MEMORY[0x1E4F3B170] object:0];

    v16 = v3;
  }

  return v3;
}

- (void)_clearAllDownloads
{
  downloadManager = self->_downloadManager;
  id v4 = [(_SFDownloadManager *)downloadManager downloads];
  v3 = objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_17);
  [(_SFDownloadManager *)downloadManager removeDownloads:v3];
}

uint64_t __45__DownloadsViewController__clearAllDownloads__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isIdle];
}

- (int64_t)minimumNumberOfRows
{
  return 1;
}

- (int64_t)maximumNumberOfRows
{
  v2 = [(DownloadsViewController *)self presentingViewController];
  v3 = [v2 traitCollection];
  if ([v3 horizontalSizeClass] == 2) {
    int64_t v4 = 10;
  }
  else {
    int64_t v4 = 5;
  }

  return v4;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadsViewController;
  [(SFPopoverSizingTableViewController *)&v4 viewDidLoad];
  v3 = [(DownloadsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"DownloadCell"];
  [v3 setDragDelegate:self];
  [v3 setAccessibilityIdentifier:@"Downloads"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadsViewController;
  [(SFPopoverSizingTableViewController *)&v4 viewWillAppear:a3];
  [(DownloadsViewController *)self _updateDoneButton];
  [(_SFDownloadManager *)self->_downloadManager didBeginViewingDownloads];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadsViewController;
  [(DownloadsViewController *)&v4 viewWillDisappear:a3];
  [(_SFDownloadManager *)self->_downloadManager didEndViewingDownloads];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DownloadsViewController;
  -[SFPopoverSizingTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(DownloadsViewController *)self _updateDoneButton];
}

- (CGSize)preferredContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadsViewController;
  [(SFPopoverSizingTableViewController *)&v4 preferredContentSize];
  double v3 = 360.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)_updateDoneButton
{
  char v3 = [(DownloadsViewController *)self _isInPopoverPresentation];
  id v8 = [(DownloadsViewController *)self navigationItem];
  objc_super v4 = [v8 leftBarButtonItem];

  if (v3)
  {
    if (v4) {
      [v8 setLeftBarButtonItem:0];
    }
  }
  else if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v6 = objc_msgSend(v5, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E4FB14A8], "_sf_popoverDoneButtonItem"), self, sel__dismiss);
    [v8 setLeftBarButtonItem:v6];

    uint64_t v7 = [v8 leftBarButtonItem];
    [v7 setAccessibilityIdentifier:@"DoneButton"];
  }
}

- (void)_dismiss
{
  id v2 = [(DownloadsViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_downloadsDidChange:(id)a3
{
  objc_super v4 = [(_SFDownloadManager *)self->_downloadManager downloads];
  id v5 = (void *)[(NSMutableArray *)self->_downloads copy];
  if ([v4 count])
  {
    v6 = [(DownloadsViewController *)self tableView];
    uint64_t v7 = [v4 differenceFromArray:v5 withOptions:4];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __47__DownloadsViewController__downloadsDidChange___block_invoke;
    objc_super v18 = &unk_1E6D78AE8;
    id v19 = v7;
    id v20 = v6;
    v21 = self;
    id v22 = v4;
    id v8 = v6;
    id v9 = v7;
    [v8 performBatchUpdates:&v15 completion:0];
    [(DownloadsViewController *)self preferredContentSize];
    double v11 = v10;
    double v13 = v12;
    v14 = [(DownloadsViewController *)self navigationController];
    objc_msgSend(v14, "setPreferredContentSize:", v11, v13);
  }
  else
  {
    [(DownloadsViewController *)self _dismiss];
  }
}

void __47__DownloadsViewController__downloadsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v2 = [*(id *)(a1 + 32) insertions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v7 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v8 = *(void **)(a1 + 40);
          id v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v7, "index"), 0);
          v33 = v9;
          double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          [v8 insertRowsAtIndexPaths:v10 withRowAnimation:100];
        }
        else
        {
          id v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v7, "associatedIndex"), 0);
          double v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v7, "index"), 0);
          [*(id *)(a1 + 40) moveRowAtIndexPath:v9 toIndexPath:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v4);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v11 = objc_msgSend(*(id *)(a1 + 32), "removals", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        if ([v16 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = *(void **)(a1 + 40);
          objc_super v18 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v16, "index"), 0);
          v31 = v18;
          id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
          [v17 deleteRowsAtIndexPaths:v19 withRowAnimation:100];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v13);
  }

  uint64_t v20 = [*(id *)(a1 + 56) mutableCopy];
  uint64_t v21 = *(void *)(a1 + 48);
  id v22 = *(void **)(v21 + 1072);
  *(void *)(v21 + 1072) = v20;
}

- (id)quickLookTransitionViewForDownload:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_downloads indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = [(DownloadsViewController *)self tableView];
    id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:v6 inSection:0];
    id v9 = [v7 cellForRowAtIndexPath:v8];

    uint64_t v5 = [v9 iconView];
  }
  return v5;
}

- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return 1;
}

- (void)cancelDownload:(id)a3
{
}

- (void)revealDownload:(id)a3
{
  id v3 = a3;
  [v3 reveal];
  id v6 = [MEMORY[0x1E4F97E48] sharedLogger];
  uint64_t v4 = [v3 mimeType];
  uint64_t v5 = [v3 uti];

  [v6 didRevealDownloadWithMIMEType:v4 uti:v5 result:0];
}

- (void)resumeDownload:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_downloads count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"DownloadCell"];
  uint64_t v8 = [(DownloadsViewController *)self _isInPopoverPresentation];
  if (v8) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v9 = [MEMORY[0x1E4FB1618] tableCellPlainBackgroundColor];
  }
  [v7 setBackgroundColor:v9];

  objc_msgSend(v7, "sf_setUsesVibrantSelection:", v8);
  downloads = self->_downloads;
  uint64_t v11 = [v6 row];

  uint64_t v12 = [(NSMutableArray *)downloads objectAtIndexedSubscript:v11];
  uint64_t v13 = [(_SFDownloadManager *)self->_downloadManager iconCache];
  [v7 setIconCache:v13];

  [v7 setDownload:v12];
  [v7 setDelegate:self];

  return v7;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v4 = -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  BOOL v5 = [v4 state] != 1;

  return v5;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return (id)_WBSLocalizedString();
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a5, "row", a3, a4));
  downloadManager = self->_downloadManager;
  v9[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(_SFDownloadManager *)downloadManager removeDownloads:v8];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  BOOL v5 = [v4 state] == 4;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  downloads = self->_downloads;
  id v7 = a4;
  id v8 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](downloads, "objectAtIndexedSubscript:", [v7 row]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v8 deselectRowAtIndexPath:v7 animated:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadOpenHandler);
  [WeakRetained openDownload:v10];
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a5, "row", a3, a4));
  if ([v5 state] == 4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    id v7 = [v5 filename];
    [v6 setSuggestedName:v7];

    id v8 = [v5 uti];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__DownloadsViewController_tableView_itemsForBeginningDragSession_atIndexPath___block_invoke;
    v13[3] = &unk_1E6D7AAE8;
    id v9 = v5;
    id v14 = v9;
    [v6 registerFileRepresentationForTypeIdentifier:v8 fileOptions:1 visibility:0 loadHandler:v13];

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v6];
    [v10 setLocalObject:v9];
    v15[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

uint64_t __78__DownloadsViewController_tableView_itemsForBeginningDragSession_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v6 = 0;
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 completedFileURL:&v6];
  (*((void (**)(id, void *, void, void))v3 + 2))(v3, v4, v6, 0);

  return 0;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 didStartDragWithDragContentType:7];
}

- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  BOOL v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  return v4;
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", [v11 row]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = objc_msgSend(v10, "items", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_super v18 = [*(id *)(*((void *)&v21 + 1) + 8 * i) localObject];

        if (v18 == v12)
        {

          id v19 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_11;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v19 = [(DownloadsViewController *)self tableView:v9 itemsForBeginningDragSession:v10 atIndexPath:v11];
LABEL_11:

  return v19;
}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  BOOL v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a5, "row", a3, a4));
  int64_t v6 = [v5 dataOwner];

  return v6;
}

- (DownloadOpenHandler)downloadOpenHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadOpenHandler);
  return (DownloadOpenHandler *)WeakRetained;
}

- (void)setDownloadOpenHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_downloadOpenHandler);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
}

@end