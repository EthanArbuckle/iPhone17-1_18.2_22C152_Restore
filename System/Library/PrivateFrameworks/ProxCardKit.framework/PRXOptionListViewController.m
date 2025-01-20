@interface PRXOptionListViewController
- (NSArray)options;
- (NSArray)selectedOptions;
- (PRXOptionListViewController)initWithContentView:(id)a3;
- (PRXOptionListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UICollectionView)collectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)formatterBlock;
- (id)selectionHandler;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_createCollectionViewLayout;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setFormatterBlock:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSelectedOptions:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation PRXOptionListViewController

- (PRXOptionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = [PRXScrollableContentView alloc];
  id v6 = objc_alloc(MEMORY[0x263F1C4E0]);
  id v7 = objc_alloc_init(MEMORY[0x263F1C508]);
  v8 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v7, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = [(PRXScrollableContentView *)v5 initWithCardStyle:0 scrollView:v8];
  v10 = [(PRXOptionListViewController *)self initWithContentView:v9];

  return v10;
}

- (PRXOptionListViewController)initWithContentView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PRXOptionListViewController;
  v3 = [(PRXCardContentViewController *)&v8 initWithContentView:a3];
  v4 = v3;
  if (v3)
  {
    options = v3->_options;
    v3->_options = (NSArray *)MEMORY[0x263EFFA68];

    id v6 = v4;
  }

  return v4;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PRXOptionListViewController;
  [(PRXCardContentViewController *)&v16 viewDidLoad];
  v3 = [(PRXCardContentViewController *)self contentView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v3 scrollView],
        v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) == 0))
  {
    v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF4A0];
    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [v11 stringWithFormat:@"%@ requires a PRXScrollableContentView with a UICollectionView", v13];
    id v15 = [v9 exceptionWithName:v10 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  id v6 = [v3 scrollView];
  collectionView = self->_collectionView;
  self->_collectionView = v6;

  objc_super v8 = [MEMORY[0x263F1C550] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v8];

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PRXOptionCell"];
  [(PRXOptionListViewController *)self _createCollectionViewLayout];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)PRXOptionListViewController;
  [(PRXCardContentViewController *)&v2 viewDidLayoutSubviews];
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PRXOptionListViewController;
  [(PRXOptionListViewController *)&v3 viewLayoutMarginsDidChange];
  [(PRXOptionListViewController *)self _createCollectionViewLayout];
}

- (void)_createCollectionViewLayout
{
  v17[1] = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)MEMORY[0x263F1C310];
  v4 = [MEMORY[0x263F1C2F0] fractionalWidthDimension:1.0];
  v5 = [MEMORY[0x263F1C2F0] estimatedDimension:50.0];
  id v6 = [v3 sizeWithWidthDimension:v4 heightDimension:v5];

  id v7 = [MEMORY[0x263F1C300] itemWithLayoutSize:v6];
  objc_super v8 = (void *)MEMORY[0x263F1C2F8];
  v17[0] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  uint64_t v10 = [v8 verticalGroupWithLayoutSize:v6 subitems:v9];

  v11 = [MEMORY[0x263F1C308] sectionWithGroup:v10];
  [v11 setInterGroupSpacing:8.0];
  v12 = [(PRXCardContentViewController *)self contentView];
  [v12 directionalLayoutMargins];
  double v14 = v13;
  id v15 = [(PRXCardContentViewController *)self contentView];
  [v15 directionalLayoutMargins];
  objc_msgSend(v11, "setContentInsets:", 0.0, v14, 0.0);

  objc_super v16 = (void *)[objc_alloc(MEMORY[0x263F1C4F0]) initWithSection:v11];
  [(UICollectionView *)self->_collectionView setCollectionViewLayout:v16];
}

- (void)setOptions:(id)a3
{
  id v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_options, "isEqualToArray:"))
  {
    v4 = [(PRXOptionListViewController *)self selectedOptions];
    v5 = (NSArray *)[v7 copy];
    options = self->_options;
    self->_options = v5;

    [(UICollectionView *)self->_collectionView reloadData];
    [(PRXOptionListViewController *)self setSelectedOptions:v4];
  }
}

- (NSArray)selectedOptions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F089C8] indexSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "item"));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v9 = [(NSArray *)self->_options objectsAtIndexes:v3];

  return (NSArray *)v9;
}

- (void)setSelectedOptions:(id)a3
{
  id v4 = a3;
  if ([v4 count]
    || ([(UICollectionView *)self->_collectionView indexPathsForSelectedItems],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v4];
    collectionView = self->_collectionView;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__PRXOptionListViewController_setSelectedOptions___block_invoke;
    v10[3] = &unk_264418258;
    v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    [(UICollectionView *)collectionView performBatchUpdates:v10 completion:0];
  }
}

void __50__PRXOptionListViewController_setSelectedOptions___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(*(void *)(a1 + 32) + 1072);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__PRXOptionListViewController_setSelectedOptions___block_invoke_2;
  v5[3] = &unk_2644183C0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __50__PRXOptionListViewController_setSelectedOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F088C8];
  id v6 = a2;
  id v8 = [v5 indexPathForItem:a3 inSection:0];
  LODWORD(a3) = [*(id *)(a1 + 32) containsObject:v6];

  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 1096);
  if (a3) {
    [v7 selectItemAtIndexPath:v8 animated:0 scrollPosition:0];
  }
  else {
    [v7 deselectItemAtIndexPath:v8 animated:0];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_options count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"PRXOptionCell" forIndexPath:v6];
  options = self->_options;
  uint64_t v9 = [v6 item];

  uint64_t v10 = [(NSArray *)options objectAtIndexedSubscript:v9];
  formatterBlock = (void (**)(id, void *))self->_formatterBlock;
  if (formatterBlock) {
    formatterBlock[2](formatterBlock, v10);
  }
  else {
  long long v12 = [NSString stringWithFormat:@"%@", v10];
  }
  long long v13 = [v7 textLabel];
  [v13 setText:v12];

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if (self->_selectionHandler)
  {
    -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_selectionHandler + 2))();
  }
}

- (NSArray)options
{
  return self->_options;
}

- (id)formatterBlock
{
  return self->_formatterBlock;
}

- (void)setFormatterBlock:(id)a3
{
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong(&self->_formatterBlock, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end