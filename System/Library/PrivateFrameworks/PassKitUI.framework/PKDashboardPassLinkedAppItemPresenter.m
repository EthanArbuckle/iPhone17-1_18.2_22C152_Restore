@interface PKDashboardPassLinkedAppItemPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardPassLinkedAppItemPresenter)initWithDelegate:(id)a3;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 animated:(BOOL)a7;
- (void)appViewContentSizeChanged:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKDashboardPassLinkedAppItemPresenter

- (PKDashboardPassLinkedAppItemPresenter)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKDashboardPassLinkedAppItemPresenter;
  v5 = [(PKDashboardPassLinkedAppItemPresenter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"PassLinkedAppItem";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"PassLinkedAppItem" forIndexPath:v8];
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  objc_msgSend(v11, "setHostedContentInset:", 0.0, v12, 0.0, v12);
  [(PKDashboardPassLinkedAppItemPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8 animated:0];

  return v11;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  [(PKDashboardPassLinkedAppItemPresenter *)self _configureCell:a3 forItem:a4 inCollectionView:v10 forIndexPath:v11 animated:1];
  id v12 = objc_alloc_init(MEMORY[0x1E4FB15E8]);
  v19[0] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v12 invalidateItemsAtIndexPaths:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__PKDashboardPassLinkedAppItemPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke;
  v16[3] = &unk_1E59CA870;
  id v17 = v10;
  id v18 = v12;
  id v14 = v12;
  id v15 = v10;
  [v15 performBatchUpdates:v16 completion:0];
}

void __89__PKDashboardPassLinkedAppItemPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke(uint64_t a1)
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

    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    -[PKDashboardContentHostCollectionViewCell setHostedContentInset:](self->_sampleCell, "setHostedContentInset:", 0.0, v15, 0.0, v15);
    sampleCell = self->_sampleCell;
  }
  [(PKDashboardPassLinkedAppItemPresenter *)self _configureCell:sampleCell forItem:v8 inCollectionView:v9 forIndexPath:v10 animated:0];
  v16 = self->_sampleCell;
  [v9 bounds];
  -[PKDashboardContentHostCollectionViewCell sizeThatFits:](v16, "sizeThatFits:", v17, 1.79769313e308);
  double v19 = v18;
  double v21 = v20;
  [(PKDashboardContentHostCollectionViewCell *)self->_sampleCell prepareForReuse];

  double v22 = v19;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 animated:(BOOL)a7
{
  id v15 = a3;
  id v9 = [a4 linkedApplication];
  id v10 = [v15 hostedContentView];
  id v11 = v10;
  if (!v10
    || ([(PKLinkedAppContentView *)v10 linkedApplication],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v9))
  {
    v13 = [[PKLinkedAppContentView alloc] initWithLinkedApplication:v9];

    [(PKLinkedAppContentView *)v13 setDelegate:self];
    id v14 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(PKLinkedAppContentView *)v13 setBackgroundColor:v14];

    [(UIView *)v13 pkui_setMaskType:3];
    [v15 setHostedContentView:v13];
    id v11 = v13;
  }
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (void)appViewContentSizeChanged:(id)a3
{
  id v4 = [a3 superview];
  v6 = [v4 superview];

  if (self->_sampleCell != v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained invalidateLayoutForCell:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end