@interface PKDashboardPassTilesItemPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardPassTilesItemPresenterDelegate)delegate;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 animated:(BOOL)a7;
- (void)passTileGroupView:(id)a3 executeSEActionForPass:(id)a4 tile:(id)a5 withCompletion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKDashboardPassTilesItemPresenter

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"PassTilesItem";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"PassTilesItem" forIndexPath:v8];
  [(PKDashboardPassTilesItemPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8 animated:0];

  return v11;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  [(PKDashboardPassTilesItemPresenter *)self _configureCell:a3 forItem:a4 inCollectionView:v10 forIndexPath:v11 animated:1];
  id v12 = objc_alloc_init(MEMORY[0x1E4FB15E8]);
  v19[0] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v12 invalidateItemsAtIndexPaths:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PKDashboardPassTilesItemPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke;
  v16[3] = &unk_1E59CA870;
  id v17 = v10;
  id v18 = v12;
  id v14 = v12;
  id v15 = v10;
  [v15 performBatchUpdates:v16 completion:0];
}

void __85__PKDashboardPassTilesItemPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionViewLayout];
  [v2 invalidateLayoutWithContext:*(void *)(a1 + 40)];
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sampleCell = self->_sampleCell;
  if (!sampleCell)
  {
    id v12 = [PKDashboardContentHostCollectionViewCell alloc];
    v13 = -[PKDashboardContentHostCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v14 = self->_sampleCell;
    self->_sampleCell = v13;

    sampleCell = self->_sampleCell;
  }
  [(PKDashboardPassTilesItemPresenter *)self _configureCell:sampleCell forItem:v8 inCollectionView:v9 forIndexPath:v10 animated:0];
  id v15 = self->_sampleCell;
  [v9 bounds];
  -[PKDashboardContentHostCollectionViewCell sizeThatFits:](v15, "sizeThatFits:", v16, 1.79769313e308);
  double v18 = v17;
  double v20 = v19;
  [(PKDashboardContentHostCollectionViewCell *)self->_sampleCell prepareForReuse];

  double v21 = v18;
  double v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 hostedContentView];
  v13 = (PKPassTileGroupView *)v12;
  if (!v12)
  {
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    double v15 = v14;
    v13 = objc_alloc_init(PKPassTileGroupView);
    [(PKPassTileGroupView *)v13 setDelegate:self];
    -[PKPassTileGroupView setContentInset:](v13, "setContentInset:", 0.0, v15, 0.0, v15);
    [v10 setHostedContentView:v13];
  }
  double v16 = [v11 pass];
  double v17 = [v11 passView];
  double v18 = [v11 groupTile];
  uint64_t v19 = [v11 maximumRowsOverride];

  v21[0] = 0;
  if (v12) {
    BOOL v20 = v7;
  }
  else {
    BOOL v20 = 0;
  }
  uint64_t v22 = 0;
  uint64_t v23 = v19;
  [(PKPassTileGroupView *)v13 setPass:v16 passView:v17 groupTile:v18 context:v21 animated:v20];
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (void)passTileGroupView:(id)a3 executeSEActionForPass:(id)a4 tile:(id)a5 withCompletion:(id)a6
{
  id v13 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, void))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v12 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained passTilesItemPresenter:self executeSEActionForPass:v13 tile:v9 withCompletion:v10];
  }
  else {
    v10[2](v10, 0);
  }
}

- (PKDashboardPassTilesItemPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDashboardPassTilesItemPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end