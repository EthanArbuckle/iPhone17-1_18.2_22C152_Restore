@interface SUUIQuicklinksViewController
- (CGRect)frameForLinkAtIndex:(int64_t)a3;
- (NSArray)indexPathsForVisibleItems;
- (NSArray)links;
- (SUUIQuicklinksViewControllerDelegate)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)_numberOfRows;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLinks:(id)a3;
- (void)setTitle:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIQuicklinksViewController

- (void)dealloc
{
  [(UICollectionView *)self->_collectionView setDelegate:0];
  [(UICollectionView *)self->_collectionView setDataSource:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIQuicklinksViewController;
  [(SUUIQuicklinksViewController *)&v3 dealloc];
}

- (CGRect)frameForLinkAtIndex:(int64_t)a3
{
  collectionView = self->_collectionView;
  v4 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  v5 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v4];

  if (v5)
  {
    [v5 bounds];
    objc_msgSend(v5, "convertRect:toView:", 0);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A0];
    double v9 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (NSArray)indexPathsForVisibleItems
{
  return [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
}

- (void)setColoringWithColorScheme:(id)a3
{
  if (self->_colorScheme != a3)
  {
    v4 = (SUUIColorScheme *)[a3 copy];
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;
    MEMORY[0x270F9A758](v4, colorScheme);
  }
}

- (void)setLinks:(id)a3
{
  if (self->_links != a3)
  {
    v4 = (NSArray *)[a3 copy];
    links = self->_links;
    self->_links = v4;

    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView reloadData];
  }
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width = a3.width;
  id v6 = (id)[(SUUIQuicklinksViewController *)self view];
  if (width <= 682.0) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }
  id v11 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  objc_msgSend(v11, "setItemSize:", floor(width / (double)v7), 44.0);
  [v11 setNumberOfColumns:v7];
  [(UICollectionView *)self->_collectionView frame];
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v8, v9, v10, ceilf((float)[(SUUIQuicklinksViewController *)self _numberOfRows] * 44.0));
  [(SUUIQuicklinksView *)self->_quicklinksView sizeToFit];
}

- (void)loadView
{
  objc_super v3 = objc_alloc_init(SUUIQuicklinksView);
  quicklinksView = self->_quicklinksView;
  self->_quicklinksView = v3;

  v5 = self->_quicklinksView;
  id v6 = [(SUUIQuicklinksViewController *)self title];
  [(SUUIQuicklinksView *)v5 setTitle:v6];

  [(SUUIQuicklinksViewController *)self setView:self->_quicklinksView];
  double v16 = objc_alloc_init(SUUIItemGridCollectionViewLayout);
  uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 1;
  }
  [(SUUIItemGridCollectionViewLayout *)v16 setNumberOfColumns:v9];
  [(UICollectionViewFlowLayout *)v16 setMinimumLineSpacing:0.0];
  [(UICollectionViewFlowLayout *)v16 setMinimumInteritemSpacing:0.0];
  double v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 bounds];
  -[UICollectionViewFlowLayout setItemSize:](v16, "setItemSize:", v11, 44.0);

  uint64_t v12 = [(SUUIQuicklinksViewController *)self _numberOfRows];
  double v13 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x263F82528]), "initWithFrame:collectionViewLayout:", v16, 0.0, 0.0, 0.0, ceilf((float)v12 * 44.0));
  collectionView = self->_collectionView;
  self->_collectionView = v13;

  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"a"];
  double v15 = [(SUUIColorScheme *)self->_colorScheme backgroundColor];
  if (!v15)
  {
    double v15 = [MEMORY[0x263F825C8] whiteColor];
  }
  [(UICollectionView *)self->_collectionView setBackgroundColor:v15];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setScrollEnabled:0];
  [(UICollectionView *)self->_collectionView setScrollsToTop:0];
  [(UICollectionView *)self->_collectionView setPrefetchingEnabled:0];
  [(SUUIQuicklinksView *)self->_quicklinksView setCollectionView:self->_collectionView];
  [(SUUIQuicklinksView *)self->_quicklinksView setColoringWithColorScheme:self->_colorScheme];
  [(SUUIQuicklinksView *)self->_quicklinksView sizeToFit];
}

- (void)setTitle:(id)a3
{
  quicklinksView = self->_quicklinksView;
  id v5 = a3;
  [(SUUIQuicklinksView *)quicklinksView setTitle:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIQuicklinksViewController;
  [(SUUIQuicklinksViewController *)&v6 setTitle:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)SUUIQuicklinksViewController;
  [(SUUIQuicklinksViewController *)&v13 viewWillAppear:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) animated:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3, a4);
  uint64_t v6 = [v5 userInterfaceIdiom];

  int64_t result = [(NSArray *)self->_links count];
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    int64_t v8 = result / 3;
    if (result != 3 * (result / 3)) {
      ++v8;
    }
    return 3 * v8;
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"a" forIndexPath:v6];
  unint64_t v9 = [v6 item];

  if (v9 >= [(NSArray *)self->_links count])
  {
    [v8 configureForLink:0];
  }
  else
  {
    long long v10 = [(NSArray *)self->_links objectAtIndex:v9];
    [v8 configureForLink:v10];
  }
  long long v11 = [v7 backgroundColor];

  [v8 setBackgroundColor:v11];
  [v8 setColoringWithColorScheme:self->_colorScheme];
  long long v12 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
  if (!v12)
  {
    long long v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  }
  [v8 setSeparatorColor:v12];
  [v8 setSeparatorStyle:1];

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v10 = a4;
  unint64_t v5 = [v10 item];
  if (v5 < [(NSArray *)self->_links count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      int64_t v8 = [(NSArray *)self->_links objectAtIndex:v5];
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "quicklinksViewController:didSelectLink:atIndex:", self, v8, objc_msgSend(v10, "item"));
    }
  }
}

- (int64_t)_numberOfRows
{
  uint64_t v3 = [(NSArray *)self->_links count];
  v4 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  uint64_t v5 = [v4 numberOfColumns];

  if (v3 % v5) {
    return v3 / v5 + 1;
  }
  else {
    return v3 / v5;
  }
}

- (SUUIQuicklinksViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIQuicklinksViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)links
{
  return self->_links;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quicklinksView, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end