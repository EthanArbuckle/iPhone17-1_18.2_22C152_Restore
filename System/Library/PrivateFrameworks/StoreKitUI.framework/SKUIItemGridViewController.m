@interface SKUIItemGridViewController
- (CGPoint)contentOffset;
- (CGSize)imageBoundingSize;
- (NSArray)items;
- (NSOperationQueue)operationQueue;
- (SKUIClientContext)clientContext;
- (SKUIItemArtworkContext)artworkContext;
- (SKUIItemGridDelegate)delegate;
- (SKUIItemGridViewController)initWithRowHeight:(double)a3;
- (SKUIStyledImageDataConsumer)iconDataConsumer;
- (SKUIUber)uber;
- (_NSRange)itemCollectionController:(id)a3 itemPageRangeForOffset:(CGPoint)a4;
- (_NSRange)visibleItemRangeForItemCollectionController:(id)a3;
- (double)rowHeight;
- (id)_collectionView;
- (id)_collectionViewLayout;
- (id)_itemCollectionController;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)itemCollectionController:(id)a3 cellLayoutForItemIndex:(int64_t)a4;
- (id)popIconImageViewForItemAtIndex:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_reloadLayout;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)itemCollectionView:(id)a3 didConfirmItemOfferForCell:(id)a4;
- (void)itemCollectionView:(id)a3 didPerformEditActionForCell:(id)a4;
- (void)loadNextPageOfArtworkWithReason:(int64_t)a3;
- (void)loadView;
- (void)removeItemsAtIndexes:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setArtworkContext:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setIconDataConsumer:(id)a3;
- (void)setImageBoundingSize:(CGSize)a3;
- (void)setItemCellClass:(Class)a3;
- (void)setItems:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setUber:(id)a3;
- (void)unhideIcons;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SKUIItemGridViewController

- (SKUIItemGridViewController)initWithRowHeight:(double)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemGridViewController initWithRowHeight:]();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIItemGridViewController;
  result = [(SKUIItemGridViewController *)&v6 init];
  if (result) {
    result->_rowHeight = a3;
  }
  return result;
}

- (void)dealloc
{
  [(UICollectionView *)self->_collectionView setDataSource:0];
  [(UICollectionView *)self->_collectionView setDelegate:0];
  [(SKUIItemCollectionController *)self->_itemCollectionController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIItemGridViewController;
  [(SKUIItemGridViewController *)&v3 dealloc];
}

- (SKUIItemArtworkContext)artworkContext
{
  return [(SKUIItemCollectionController *)self->_itemCollectionController artworkContext];
}

- (CGPoint)contentOffset
{
  collectionView = self->_collectionView;
  if (collectionView)
  {
    [(UICollectionView *)collectionView contentOffset];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (SKUIStyledImageDataConsumer)iconDataConsumer
{
  return [(SKUIItemCollectionController *)self->_itemCollectionController iconDataConsumer];
}

- (void)loadNextPageOfArtworkWithReason:(int64_t)a3
{
  id v4 = [(SKUIItemGridViewController *)self _itemCollectionController];
  [v4 loadNextPageOfArtworkWithReason:a3];
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:2];
    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (id)popIconImageViewForItemAtIndex:(int64_t)a3
{
  collectionView = self->_collectionView;
  objc_super v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  v7 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v6];

  v8 = [v7 layout];
  v9 = [v8 iconImage];

  if (v9)
  {
    v10 = [v8 iconImageView];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    id v19 = objc_alloc(MEMORY[0x1E4FB1838]);
    v20 = [v8 iconImage];
    v9 = (void *)[v19 initWithImage:v20];

    v21 = [(SKUIItemGridViewController *)self view];
    objc_msgSend(v21, "convertRect:fromView:", v7, v12, v14, v16, v18);
    objc_msgSend(v9, "setFrame:");

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

  return v9;
}

- (void)removeItemsAtIndexes:(id)a3
{
  [(NSMutableArray *)self->_items removeObjectsAtIndexes:a3];
  [(SKUIItemCollectionController *)self->_itemCollectionController setItems:self->_items];
  collectionView = self->_collectionView;

  [(UICollectionView *)collectionView reloadData];
}

- (void)setArtworkContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIItemGridViewController *)self _itemCollectionController];
  [v5 setArtworkContext:v4];
}

- (void)setContentOffset:(CGPoint)a3
{
}

- (void)setIconDataConsumer:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIItemGridViewController *)self _itemCollectionController];
  [v5 setIconDataConsumer:v4];
}

- (void)setItemCellClass:(Class)a3
{
  id v4 = [(SKUIItemGridViewController *)self _collectionView];
  [v4 registerClass:a3 forCellWithReuseIdentifier:@"ItemCellReuseIdentifier"];
}

- (void)setItems:(id)a3
{
  if (self->_items != a3)
  {
    id v4 = (NSMutableArray *)[a3 mutableCopy];
    items = self->_items;
    self->_items = v4;

    [(SKUIItemCollectionController *)self->_itemCollectionController setItems:self->_items];
    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView reloadData];
  }
}

- (void)unhideIcons
{
  hiddenIconIndexSet = self->_hiddenIconIndexSet;
  if (hiddenIconIndexSet)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__SKUIItemGridViewController_unhideIcons__block_invoke;
    v5[3] = &unk_1E6426698;
    v5[4] = self;
    [(NSMutableIndexSet *)hiddenIconIndexSet enumerateIndexesWithOptions:0 usingBlock:v5];
    id v4 = self->_hiddenIconIndexSet;
    self->_hiddenIconIndexSet = 0;
  }
}

void __41__SKUIItemGridViewController_unhideIcons__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 976);
  double v3 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:0];
  id v5 = [v2 cellForItemAtIndexPath:v3];

  id v4 = [v5 layout];
  [v4 setIconImageHidden:0];
}

- (void)loadView
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  double v3 = [(SKUIItemGridViewController *)self _collectionView];
  [v3 reloadData];
  [v5 addSubview:v3];
  id v4 = [v3 backgroundColor];
  [v5 setBackgroundColor:v4];

  [(SKUIItemGridViewController *)self setView:v5];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SKUIItemCollectionController *)self->_itemCollectionController enterForeground];
  id v5 = [(SKUIItemGridViewController *)self _itemCollectionController];
  [(UICollectionView *)self->_collectionView contentOffset];
  objc_msgSend(v5, "precacheNextPageArtworkForOffset:direction:");

  v6.receiver = self;
  v6.super_class = (Class)SKUIItemGridViewController;
  [(SKUIItemGridViewController *)&v6 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIItemGridViewController;
  [(SKUIItemGridViewController *)&v4 viewDidDisappear:a3];
  [(SKUIItemCollectionController *)self->_itemCollectionController enterBackground];
}

- (void)viewDidLayoutSubviews
{
  [(SKUIItemGridViewController *)self _reloadLayout];
  v3.receiver = self;
  v3.super_class = (Class)SKUIItemGridViewController;
  [(SKUIItemGridViewController *)&v3 viewDidLayoutSubviews];
}

- (id)itemCollectionController:(id)a3 cellLayoutForItemIndex:(int64_t)a4
{
  collectionView = self->_collectionView;
  id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a4 inSection:0];
  objc_super v6 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v5];

  v7 = [v6 layout];

  return v7;
}

- (_NSRange)itemCollectionController:(id)a3 itemPageRangeForOffset:(CGPoint)a4
{
  NSUInteger v4 = SKUIItemCollectionItemPageRangeForCollectionView(self->_collectionView, a4.x, a4.y);
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)visibleItemRangeForItemCollectionController:(id)a3
{
  NSUInteger v3 = SKUIItemCollectionVisibleItemRangeForCollectionView(self->_collectionView);
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)itemCollectionView:(id)a3 didConfirmItemOfferForCell:(id)a4
{
  id v9 = a4;
  objc_super v6 = objc_msgSend(a3, "indexPathForCell:");
  v7 = -[SKUIItemCollectionController performActionForItemAtIndex:](self->_itemCollectionController, "performActionForItemAtIndex:", [v6 item]);
  if (v7)
  {
    v8 = [v9 layout];
    [v8 setItemState:v7 animated:1];
  }
}

- (void)itemCollectionView:(id)a3 didPerformEditActionForCell:(id)a4
{
  NSUInteger v5 = [a3 indexPathForCell:a4];
  if (v5)
  {
    id v9 = v5;
    objc_super v6 = [(SKUIItemGridViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v9 item];
      v8 = [(NSMutableArray *)self->_items objectAtIndex:v7];
      [v6 itemGrid:self didPerformEditActionForItem:v8 atIndex:v7];
    }
    NSUInteger v5 = v9;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  NSUInteger v5 = [a3 dequeueReusableCellWithReuseIdentifier:@"ItemCellReuseIdentifier" forIndexPath:a4];
  [v5 setSeparatorStyle:1];
  objc_super v6 = [v5 layout];
  [v6 setClientContext:self->_clientContext];

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t v5 = [(NSMutableArray *)self->_items count];
  objc_super v6 = [(SKUIItemGridViewController *)self _collectionViewLayout];
  uint64_t v7 = [v6 numberOfColumns];

  if (v5 % v7) {
    return v7 + v5 - v5 % v7;
  }
  else {
    return v5;
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  v8 = [v14 layout];
  id v9 = [(SKUIUber *)self->_uber colorScheme];
  v10 = [v9 primaryTextColor];
  [v14 setSeparatorColor:v10];

  unint64_t v11 = [v7 item];
  if (v11 >= [(NSMutableArray *)self->_items count])
  {
    [v14 configureForItem:0 clientContext:self->_clientContext];
    [v8 resetLayout];
  }
  else
  {
    double v12 = [(NSMutableArray *)self->_items objectAtIndex:v11];
    [v14 configureForItem:v12 clientContext:self->_clientContext];
    [(SKUIItemCollectionController *)self->_itemCollectionController configureCellLayout:v8 forIndex:v11];
    objc_msgSend(v8, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", v11));
    objc_msgSend(v8, "setSelected:", -[NSMutableIndexSet containsIndex:](self->_selectedItemIndexSet, "containsIndex:", v11));
    double v13 = [(SKUIUber *)self->_uber colorScheme];
    [v8 setColoringWithColorScheme:v13];

    if (self->_imageBoundingSize.width != *MEMORY[0x1E4F1DB30]
      || self->_imageBoundingSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      objc_msgSend(v8, "setImageBoundingSize:");
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  unint64_t v6 = objc_msgSend(a5, "item", a3, a4);
  if (v6 < [(NSMutableArray *)self->_items count])
  {
    itemCollectionController = self->_itemCollectionController;
    [(SKUIItemCollectionController *)itemCollectionController didEndDisplayingItemAtIndex:v6];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    unint64_t v7 = [v10 item];
    if (v7 < [(NSMutableArray *)self->_items count])
    {
      v8 = [(NSMutableArray *)self->_items objectAtIndex:v7];
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 itemGrid:self didSelectItem:v8 atIndex:v7];
    }
  }
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
    [v6 itemGridWillBeginDragging:self];
  }
  [(SKUIItemCollectionController *)self->_itemCollectionController scrollViewWillBeginDragging:v7];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
}

- (id)_collectionView
{
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
    char v5 = objc_alloc_init(SKUIItemGridCollectionViewLayout);
    id v6 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v7 = self->_collectionView;
    self->_collectionView = v6;

    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"a"];
    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"a"];
    [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:1];
    [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
    v8 = self->_collectionView;
    id v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UICollectionView *)v8 setBackgroundColor:v9];

    [(UICollectionView *)self->_collectionView setSemanticContentAttribute:storeSemanticContentAttribute()];
    [(UICollectionView *)self->_collectionView setDataSource:self];
    [(UICollectionView *)self->_collectionView setDelegate:self];
    [(UICollectionView *)self->_collectionView setPrefetchingEnabled:0];
    [(SKUIItemGridViewController *)self _reloadLayout];
    collectionView = self->_collectionView;
  }

  return collectionView;
}

- (id)_collectionViewLayout
{
  return [(UICollectionView *)self->_collectionView collectionViewLayout];
}

- (void)_reloadLayout
{
  NSUInteger v3 = [(SKUIItemGridViewController *)self view];
  [v3 frame];
  double v5 = v4;

  if (v5 > 0.00000011920929)
  {
    id v6 = [(SKUIItemGridViewController *)self _collectionViewLayout];
    id v9 = v6;
    if (v5 <= 1000.0) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 3;
    }
    [v6 setNumberOfColumns:v7];
    float v8 = v5 / (double)v7;
    objc_msgSend(v9, "setItemSize:", floorf(v8), self->_rowHeight);
    [v9 invalidateLayout];
    [(UICollectionView *)self->_collectionView reloadData];
  }
}

- (id)_itemCollectionController
{
  itemCollectionController = self->_itemCollectionController;
  if (!itemCollectionController)
  {
    double v4 = [[SKUIItemCollectionController alloc] initWithClientContext:self->_clientContext];
    double v5 = self->_itemCollectionController;
    self->_itemCollectionController = v4;

    [(SKUIItemCollectionController *)self->_itemCollectionController setDelegate:self];
    id v6 = self->_itemCollectionController;
    uint64_t v7 = +[SKUIStyledImageDataConsumer listIconConsumer];
    [(SKUIItemCollectionController *)v6 setIconDataConsumer:v7];

    [(SKUIItemCollectionController *)self->_itemCollectionController setItems:self->_items];
    [(SKUIItemCollectionController *)self->_itemCollectionController setNumberOfItemsPerPage:20];
    [(SKUIItemCollectionController *)self->_itemCollectionController setNumberOfPagesToCacheAhead:3.0];
    itemCollectionController = self->_itemCollectionController;
  }

  return itemCollectionController;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIItemGridDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIItemGridDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (NSArray)items
{
  return &self->_items->super;
}

- (void)setOperationQueue:(id)a3
{
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedItemIndexSet, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_itemCollectionController, 0);
  objc_storeStrong((id *)&self->_hiddenIconIndexSet, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

- (void)initWithRowHeight:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItemGridViewController initWithRowHeight:]";
}

@end