@interface SKUIItemListTableViewController
- (BOOL)isSuspended;
- (BOOL)loadsMoreItems;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (CGRect)frameForItemAtIndex:(int64_t)a3;
- (CGSize)imageBoundingSize;
- (NSOperationQueue)operationQueue;
- (NSString)visibleMetricsImpressions;
- (SKUIClientContext)clientContext;
- (SKUIItemArtworkContext)artworkContext;
- (SKUIItemList)itemList;
- (SKUIItemListTableDelegate)delegate;
- (SKUIItemListTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SKUIResourceLoader)artworkLoader;
- (SKUIStyledImageDataConsumer)iconDataConsumer;
- (SKUIUber)uber;
- (_NSRange)itemCollectionController:(id)a3 itemPageRangeForOffset:(CGPoint)a4;
- (_NSRange)visibleItemRangeForItemCollectionController:(id)a3;
- (double)rowHeight;
- (id)_itemCollectionController;
- (id)itemCollectionController:(id)a3 cellLayoutForItemIndex:(int64_t)a4;
- (id)popIconImageViewForItemAtIndex:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)selectionStyle;
- (int64_t)separatorStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_finishLoadMoreOperationWithItems:(id)a3 error:(id)a4;
- (void)_loadRemainingItemsWithPriority:(int64_t)a3;
- (void)addItems:(id)a3;
- (void)dealloc;
- (void)deleteRowsAtIndexPaths:(id)a3;
- (void)itemTableView:(id)a3 didConfirmItemOfferForTableViewCell:(id)a4;
- (void)itemTableView:(id)a3 didRemoveCell:(id)a4;
- (void)loadNextPageOfArtworkWithReason:(int64_t)a3;
- (void)loadView;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setArtworkContext:(id)a3;
- (void)setArtworkLoader:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconDataConsumer:(id)a3;
- (void)setImageBoundingSize:(CGSize)a3;
- (void)setItemArtworkContext:(id)a3;
- (void)setItemCellClass:(Class)a3;
- (void)setItemList:(id)a3;
- (void)setLoadsMoreItems:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
- (void)setRowHeight:(double)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setUber:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)unhideIcons;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SKUIItemListTableViewController

- (SKUIItemListTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemListTableViewController initWithNibName:bundle:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIItemListTableViewController;
  v8 = [(SKUIItemListTableViewController *)&v13 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    double v11 = 95.0;
    if (v10 != 1) {
      double v11 = 84.0;
    }
    v8->_rowHeight = v11;
    v8->_selectionStyle = v10 != 1;
  }

  return v8;
}

- (void)dealloc
{
  [(SKUIItemCollectionController *)self->_itemCollectionController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIItemListTableViewController;
  [(SKUIItemListTableViewController *)&v3 dealloc];
}

- (void)addItems:(id)a3
{
  id v14 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(SKUIItemList *)self->_itemList items];
  uint64_t v6 = [v5 count];

  if ([v14 count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [MEMORY[0x1E4F28D58] indexPathForRow:v6 + v7 inSection:0];
      [v4 addObject:v8];

      itemList = self->_itemList;
      uint64_t v10 = [v14 objectAtIndex:v7];
      [(SKUIItemList *)itemList addItem:v10];

      ++v7;
    }
    while (v7 < [v14 count]);
  }
  itemCollectionController = self->_itemCollectionController;
  v12 = [(SKUIItemList *)self->_itemList items];
  [(SKUIItemCollectionController *)itemCollectionController setItems:v12];

  objc_super v13 = [(SKUIItemListTableViewController *)self tableView];
  [v13 beginUpdates];
  [v13 insertRowsAtIndexPaths:v4 withRowAnimation:5];
  [v13 endUpdates];
}

- (SKUIItemArtworkContext)artworkContext
{
  v2 = [(SKUIItemListTableViewController *)self _itemCollectionController];
  objc_super v3 = [v2 artworkContext];

  return (SKUIItemArtworkContext *)v3;
}

- (SKUIResourceLoader)artworkLoader
{
  return [(SKUIItemCollectionController *)self->_itemCollectionController artworkLoader];
}

- (void)deleteRowsAtIndexPaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10++), "row", (void)v14));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(SKUIItemList *)self->_itemList removeItemsAtIndexes:v5];
  itemCollectionController = self->_itemCollectionController;
  v12 = [(SKUIItemList *)self->_itemList items];
  [(SKUIItemCollectionController *)itemCollectionController setItems:v12];

  objc_super v13 = [(SKUIItemListTableViewController *)self tableView];
  [v13 deleteRowsAtIndexPaths:v6 withRowAnimation:100];
}

- (CGRect)frameForItemAtIndex:(int64_t)a3
{
  id v4 = [(SKUIItemListTableViewController *)self tableView];
  id v5 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  id v6 = [v4 cellForRowAtIndexPath:v5];

  if (v6)
  {
    [v6 bounds];
    objc_msgSend(v6, "convertRect:toView:", 0);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (SKUIStyledImageDataConsumer)iconDataConsumer
{
  v2 = [(SKUIItemListTableViewController *)self _itemCollectionController];
  objc_super v3 = [v2 iconDataConsumer];

  return (SKUIStyledImageDataConsumer *)v3;
}

- (void)loadNextPageOfArtworkWithReason:(int64_t)a3
{
  id v4 = [(SKUIItemListTableViewController *)self _itemCollectionController];
  [v4 loadNextPageOfArtworkWithReason:a3];
}

- (id)popIconImageViewForItemAtIndex:(int64_t)a3
{
  id v5 = [(SKUIItemListTableViewController *)self tableView];
  id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  double v7 = [v5 cellForRowAtIndexPath:v6];

  if (v7)
  {
    double v8 = [v7 layout];
    double v9 = [v8 iconImageView];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    id v18 = objc_alloc(MEMORY[0x1E4FB1838]);
    uint64_t v19 = [v8 iconImage];
    v20 = (void *)[v18 initWithImage:v19];

    v21 = [(SKUIItemListTableViewController *)self view];
    objc_msgSend(v21, "convertRect:fromView:", v7, v11, v13, v15, v17);
    objc_msgSend(v20, "setFrame:");

    hiddenIconIndexSet = self->_hiddenIconIndexSet;
    if (!hiddenIconIndexSet)
    {
      v23 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
      v24 = self->_hiddenIconIndexSet;
      self->_hiddenIconIndexSet = v23;

      hiddenIconIndexSet = self->_hiddenIconIndexSet;
    }
    [(NSMutableIndexSet *)hiddenIconIndexSet addIndex:a3];
    [v8 setIconImageHidden:1];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)setArtworkLoader:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIItemListTableViewController *)self _itemCollectionController];
  [v5 setArtworkLoader:v4];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateWantsCanRemove = objc_opt_respondsToSelector() & 1;

    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateWantsDidRemove = objc_opt_respondsToSelector() & 1;

    self->_delegateWantsWillDisplay = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setIconDataConsumer:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIItemListTableViewController *)self _itemCollectionController];
  [v5 setIconDataConsumer:v4];
}

- (void)setItemArtworkContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIItemListTableViewController *)self _itemCollectionController];
  [v5 setArtworkContext:v4];
}

- (void)setItemCellClass:(Class)a3
{
  id v4 = [(SKUIItemListTableViewController *)self tableView];
  [v4 registerClass:a3 forCellReuseIdentifier:@"ItemCellReuseIdentifier"];
}

- (void)setItemList:(id)a3
{
  id v5 = (SKUIItemList *)a3;
  if (self->_itemList != v5)
  {
    double v13 = v5;
    objc_storeStrong((id *)&self->_itemList, a3);
    self->_didLoadMore = 0;
    if ([(SKUIItemListTableViewController *)self isViewLoaded])
    {
      id v6 = [(SKUIItemListTableViewController *)self tableView];
    }
    else
    {
      id v6 = 0;
    }
    loadMoreOperation = self->_loadMoreOperation;
    if (loadMoreOperation)
    {
      [(SSVLoadURLOperation *)loadMoreOperation setOutputBlock:0];
      [(SSVLoadURLOperation *)self->_loadMoreOperation cancel];
      double v8 = self->_loadMoreOperation;
      self->_loadMoreOperation = 0;

      double v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
      [v6 deleteSections:v9 withRowAnimation:5];
    }
    itemCollectionController = self->_itemCollectionController;
    double v11 = [(SKUIItemList *)self->_itemList items];
    [(SKUIItemCollectionController *)itemCollectionController setItems:v11];

    if (v6)
    {
      [v6 reloadData];
      double v12 = self->_itemCollectionController;
      [v6 contentOffset];
      -[SKUIItemCollectionController precacheNextPageArtworkForOffset:direction:](v12, "precacheNextPageArtworkForOffset:direction:");
    }

    id v5 = v13;
  }
}

- (void)setRowHeight:(double)a3
{
  if (self->_rowHeight != a3)
  {
    self->_rowHeight = a3;
    if ([(SKUIItemListTableViewController *)self isViewLoaded])
    {
      id v4 = [(SKUIItemListTableViewController *)self tableView];
      [v4 setRowHeight:self->_rowHeight];
    }
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    if ([(SKUIItemListTableViewController *)self isViewLoaded])
    {
      id v4 = [(SKUIItemListTableViewController *)self tableView];
      [v4 reloadData];
    }
  }
}

- (void)unhideIcons
{
  if (self->_hiddenIconIndexSet)
  {
    if ([(SKUIItemListTableViewController *)self isViewLoaded])
    {
      objc_super v3 = [(SKUIItemListTableViewController *)self tableView];
      hiddenIconIndexSet = self->_hiddenIconIndexSet;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __46__SKUIItemListTableViewController_unhideIcons__block_invoke;
      v7[3] = &unk_1E6426698;
      id v8 = v3;
      id v5 = v3;
      [(NSMutableIndexSet *)hiddenIconIndexSet enumerateIndexesWithOptions:0 usingBlock:v7];
    }
    id v6 = self->_hiddenIconIndexSet;
    self->_hiddenIconIndexSet = 0;
  }
}

void __46__SKUIItemListTableViewController_unhideIcons__block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:0];
  objc_super v3 = [*(id *)(a1 + 32) cellForRowAtIndexPath:v5];
  id v4 = [v3 layout];
  [v4 setIconImageHidden:0];
}

- (NSString)visibleMetricsImpressions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_alloc_init(SKUIMetricsImpressionSession);
  id v4 = [(SKUIItemListTableViewController *)self tableView];
  id v5 = [v4 indexPathsForVisibleRows];

  id v6 = [(SKUIItemList *)self->_itemList items];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v13 = objc_msgSend(v12, "row", (void)v18);
        if ([v12 section] || v13 >= objc_msgSend(v6, "count"))
        {
          uint64_t v15 = 0;
        }
        else
        {
          double v14 = [v6 objectAtIndex:v13];
          uint64_t v15 = [v14 itemIdentifier];
        }
        [(SKUIMetricsImpressionSession *)v3 addItemIdentifier:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  double v16 = [(SKUIMetricsImpressionSession *)v3 impressionsString];

  return (NSString *)v16;
}

- (id)itemCollectionController:(id)a3 cellLayoutForItemIndex:(int64_t)a4
{
  id v5 = [(SKUIItemListTableViewController *)self tableView];
  id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:a4 inSection:0];
  id v7 = [v5 cellForRowAtIndexPath:v6];

  uint64_t v8 = [v7 layout];

  return v8;
}

- (_NSRange)itemCollectionController:(id)a3 itemPageRangeForOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = [(SKUIItemListTableViewController *)self tableView];
  uint64_t v7 = SKUIItemCollectionItemPageRangeForTableView(v6, x, y);
  NSUInteger v9 = v8;

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)visibleItemRangeForItemCollectionController:(id)a3
{
  objc_super v3 = [(SKUIItemListTableViewController *)self tableView];
  uint64_t v4 = SKUIItemCollectionVisibleItemRangeForTableView(v3);
  NSUInteger v6 = v5;

  NSUInteger v7 = v4;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIItemListTableViewController;
  [(SKUIItemListTableViewController *)&v6 loadView];
  objc_super v3 = [(SKUIItemListTableViewController *)self tableView];
  [v3 setRowHeight:self->_rowHeight];
  [v3 setSeparatorStyle:0];
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", objc_msgSend(v4, "userInterfaceIdiom") == 0);

  NSUInteger v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v5];

  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"LoadMoreCellReuseIdentifier"];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SKUIItemCollectionController *)self->_itemCollectionController enterForeground];
  NSUInteger v5 = [(SKUIItemListTableViewController *)self _itemCollectionController];
  objc_super v6 = [(SKUIItemListTableViewController *)self tableView];
  [v6 contentOffset];
  objc_msgSend(v5, "precacheNextPageArtworkForOffset:direction:");

  v7.receiver = self;
  v7.super_class = (Class)SKUIItemListTableViewController;
  [(SKUIItemListTableViewController *)&v7 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIItemListTableViewController;
  [(SKUIItemListTableViewController *)&v4 viewDidDisappear:a3];
  [(SKUIItemCollectionController *)self->_itemCollectionController enterBackground];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 itemListWillBeginDragging:self];
  }
  [(SKUIItemCollectionController *)self->_itemCollectionController scrollViewWillBeginDragging:v7];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  double v10 = a5->y;
  id v12 = v9;
  [v9 contentSize];
  if (v10 >= v11 * 0.33) {
    [(SKUIItemListTableViewController *)self _loadRemainingItemsWithPriority:0];
  }
  -[SKUIItemCollectionController scrollViewWillEndDragging:withVelocity:targetContentOffset:](self->_itemCollectionController, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_loadMoreOperation) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  if (!self->_delegateWantsCanRemove) {
    return self->_delegateWantsDidRemove;
  }
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = [WeakRetained itemList:self canRemoveItemAtIndexPath:v5];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section])
  {
    NSUInteger v8 = [v7 dequeueReusableCellWithIdentifier:@"LoadMoreCellReuseIdentifier" forIndexPath:v6];
  }
  else
  {
    NSUInteger v8 = [v7 dequeueReusableCellWithIdentifier:@"ItemCellReuseIdentifier" forIndexPath:v6];

    [v8 setSelectionStyle:self->_selectionStyle];
    id v9 = [v8 multipleSelectionBackgroundView];

    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v11 = [MEMORY[0x1E4FB1618] clearColor];
      [v10 setBackgroundColor:v11];

      [v8 setMultipleSelectionBackgroundView:v10];
    }
    id v7 = [v8 layout];
    [v7 setClientContext:self->_clientContext];
  }

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  id v5 = [(SKUIItemList *)self->_itemList items];
  int64_t v6 = [v5 count];

  return v6;
}

- (void)itemTableView:(id)a3 didConfirmItemOfferForTableViewCell:(id)a4
{
  id v14 = a4;
  int64_t v6 = objc_msgSend(a3, "indexPathForCell:");
  if (![v6 section])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(SKUIItemCollectionController *)self->_itemCollectionController items];
      id v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));

      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      id v12 = [v11 itemList:self didConfirmItemOfferForItem:v10 atIndexPath:v6];

      if (!v12) {
        goto LABEL_7;
      }
    }
    else
    {
      id v12 = -[SKUIItemCollectionController performActionForItemAtIndex:](self->_itemCollectionController, "performActionForItemAtIndex:", [v6 row]);
      if (!v12)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    unint64_t v13 = [v14 layout];
    [v13 setItemState:v12 animated:1];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)itemTableView:(id)a3 didRemoveCell:(id)a4
{
  id v5 = [a3 indexPathForCell:a4];
  if (v5)
  {
    id v9 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    id v5 = v9;
    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 itemList:self didRemoveItemAtIndexPath:v9];

      id v5 = v9;
    }
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a5;
  BOOL v8 = -[SKUIItemListTableViewController tableView:canEditRowAtIndexPath:](self, "tableView:canEditRowAtIndexPath:", a3);
  if (a4 == 1 && v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained itemList:self didRemoveItemAtIndexPath:v10];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  if (![v10 section])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      char v7 = [(SKUIItemList *)self->_itemList items];
      BOOL v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v10, "row"));

      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 itemList:self didDeselectItem:v8 atIndexPath:v10];
    }
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if ([v7 section] == 1) {
    [v8 stopAnimating];
  }
  else {
    -[SKUIItemCollectionController didEndDisplayingItemAtIndex:](self->_itemCollectionController, "didEndDisplayingItemAtIndex:", [v7 row]);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  if (![v10 section])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(SKUIItemList *)self->_itemList items];
      id v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v10, "row"));

      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 itemList:self didSelectItem:v8 atIndexPath:v10];
    }
  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  char v6 = [(SKUIItemListTableViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 itemList:self titleForDeleteConfirmationButtonForRowAtIndexPath:v5];
  }
  else
  {
    id v8 = [(SKUIItemListTableViewController *)self clientContext];
    id v9 = v8;
    if (v8) {
      [v8 localizedStringForKey:@"SWIPE_TO_DELETE_BUTTON"];
    }
    else {
    id v7 = +[SKUIClientContext localizedStringForKey:@"SWIPE_TO_DELETE_BUTTON" inBundles:0];
    }
  }

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SKUIUber *)self->_uber colorScheme];
  id v11 = [v10 backgroundColor];

  if (v11)
  {
    [v8 setBackgroundColor:v11];
  }
  else
  {
    id v12 = [v25 backgroundColor];
    [v8 setBackgroundColor:v12];
  }
  if (self->_separatorStyle == 1)
  {
    [v8 setBottomBorderColor:0];
  }
  else
  {
    unint64_t v13 = [(SKUIUber *)self->_uber colorScheme];
    id v14 = [v13 primaryTextColor];
    if (v14)
    {
      [v8 setBottomBorderColor:v14];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.75 alpha:1.0];
      [v8 setBottomBorderColor:v15];
    }
  }
  if ([v9 section] == 1)
  {
    [v8 startAnimating];
  }
  else
  {
    double v16 = [v8 layout];
    uint64_t v17 = [v9 row];
    long long v18 = [(SKUIItemList *)self->_itemList items];
    long long v19 = [v18 objectAtIndex:v17];

    [v8 configureForItem:v19 clientContext:self->_clientContext rowIndex:v17];
    long long v20 = [(SKUIItemListTableViewController *)self _itemCollectionController];
    [v20 configureCellLayout:v16 forIndex:v17];

    objc_msgSend(v16, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", v17));
    long long v21 = [(SKUIUber *)self->_uber colorScheme];
    [v16 setColoringWithColorScheme:v21];

    if (self->_imageBoundingSize.width != *MEMORY[0x1E4F1DB30]
      || self->_imageBoundingSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      objc_msgSend(v16, "setImageBoundingSize:");
    }
    if (self->_delegateWantsWillDisplay)
    {
      v22 = [(SKUIItemList *)self->_itemList items];
      uint64_t v23 = objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v9, "row"));

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained itemList:self willDisplayCellForItem:v23 atIndexPath:v9];
    }
  }
}

- (void)_finishLoadMoreOperationWithItems:(id)a3 error:(id)a4
{
  id v18 = a3;
  self->_didLoadMore = 1;
  [(SSVLoadURLOperation *)self->_loadMoreOperation setOutputBlock:0];
  loadMoreOperation = self->_loadMoreOperation;
  self->_loadMoreOperation = 0;

  char v6 = 0;
  if ([(SKUIItemListTableViewController *)self isViewLoaded])
  {
    char v6 = [(SKUIItemListTableViewController *)self tableView];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = [(SKUIItemList *)self->_itemList items];
    uint64_t v9 = [v8 count];

    uint64_t v10 = [v18 count];
    if (v9 < v10)
    {
      uint64_t v11 = v10;
      do
      {
        id v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:0];
        [v7 addObject:v12];

        itemList = self->_itemList;
        id v14 = [v18 objectAtIndex:v9];
        [(SKUIItemList *)itemList addItem:v14];

        ++v9;
      }
      while (v11 != v9);
    }
    itemCollectionController = self->_itemCollectionController;
    double v16 = [(SKUIItemList *)self->_itemList items];
    [(SKUIItemCollectionController *)itemCollectionController setItems:v16];

    [v6 beginUpdates];
    uint64_t v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v6 deleteSections:v17 withRowAnimation:5];

    [v6 insertRowsAtIndexPaths:v7 withRowAnimation:5];
    [v6 endUpdates];
    [(SKUIItemListTableViewController *)self loadNextPageOfArtworkWithReason:-1];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v6 deleteSections:v7 withRowAnimation:5];
  }
}

- (id)_itemCollectionController
{
  itemCollectionController = self->_itemCollectionController;
  if (!itemCollectionController)
  {
    objc_super v4 = [[SKUIItemCollectionController alloc] initWithClientContext:self->_clientContext];
    id v5 = self->_itemCollectionController;
    self->_itemCollectionController = v4;

    [(SKUIItemCollectionController *)self->_itemCollectionController setDelegate:self];
    char v6 = self->_itemCollectionController;
    id v7 = +[SKUIStyledImageDataConsumer listIconConsumer];
    [(SKUIItemCollectionController *)v6 setIconDataConsumer:v7];

    [(SKUIItemCollectionController *)self->_itemCollectionController setArtworkContext:self->_artworkContext];
    id v8 = self->_itemCollectionController;
    uint64_t v9 = [(SKUIItemList *)self->_itemList items];
    [(SKUIItemCollectionController *)v8 setItems:v9];

    [(SKUIItemCollectionController *)self->_itemCollectionController setNumberOfItemsPerPage:10];
    [(SKUIItemCollectionController *)self->_itemCollectionController setNumberOfPagesToCacheAhead:1.5];
    itemCollectionController = self->_itemCollectionController;
  }

  return itemCollectionController;
}

- (void)_loadRemainingItemsWithPriority:(int64_t)a3
{
  if (!self->_didLoadMore && self->_loadsMoreItems && !self->_loadMoreOperation)
  {
    id v5 = [(SKUIItemList *)self->_itemList seeAllURLString];
    if (v5)
    {
      char v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
      id v7 = (SSVLoadURLOperation *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v6];
      loadMoreOperation = self->_loadMoreOperation;
      self->_loadMoreOperation = v7;

      [(SSVLoadURLOperation *)self->_loadMoreOperation setQueuePriority:a3];
      uint64_t v9 = self->_loadMoreOperation;
      uint64_t v10 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
      [(SSVLoadURLOperation *)v9 setStoreFrontSuffix:v10];

      uint64_t v11 = +[SSVURLDataConsumer consumer];
      id v12 = [(SKUIItemList *)self->_itemList unavailableItemIdentifiers];
      [v11 setUnavailableItemIdentifiers:v12];

      [(SSVLoadURLOperation *)self->_loadMoreOperation setDataConsumer:v11];
      objc_initWeak(&location, self);
      unint64_t v13 = self->_loadMoreOperation;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __67__SKUIItemListTableViewController__loadRemainingItemsWithPriority___block_invoke;
      long long v19 = &unk_1E6423C58;
      objc_copyWeak(&v20, &location);
      [(SSVLoadURLOperation *)v13 setOutputBlock:&v16];
      if ([(SKUIItemListTableViewController *)self isViewLoaded])
      {
        id v14 = [(SKUIItemListTableViewController *)self tableView];
        uint64_t v15 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
        [v14 insertSections:v15 withRowAnimation:5];
      }
      [(NSOperationQueue *)self->_operationQueue addOperation:self->_loadMoreOperation];
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
}

void __67__SKUIItemListTableViewController__loadRemainingItemsWithPriority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SKUIItemListTableViewController__loadRemainingItemsWithPriority___block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __67__SKUIItemListTableViewController__loadRemainingItemsWithPriority___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishLoadMoreOperationWithItems:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (SKUIItemListTableDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIItemListTableDelegate *)WeakRetained;
}

- (void)setArtworkContext:(id)a3
{
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (CGSize)imageBoundingSize
{
  double width = self->_imageBoundingSize.width;
  double height = self->_imageBoundingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageBoundingSize:(CGSize)a3
{
  self->_imageBoundingSize = a3;
}

- (SKUIItemList)itemList
{
  return self->_itemList;
}

- (BOOL)loadsMoreItems
{
  return self->_loadsMoreItems;
}

- (void)setLoadsMoreItems:(BOOL)a3
{
  self->_loadsMoreItems = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (int64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (void)setSelectionStyle:(int64_t)a3
{
  self->_selectionStyle = a3;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (SKUIUber)uber
{
  return self->_uber;
}

- (void)setUber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uber, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_itemList, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadMoreOperation, 0);
  objc_storeStrong((id *)&self->_itemCollectionController, 0);
  objc_storeStrong((id *)&self->_artworkContext, 0);

  objc_storeStrong((id *)&self->_hiddenIconIndexSet, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItemListTableViewController initWithNibName:bundle:]";
}

@end