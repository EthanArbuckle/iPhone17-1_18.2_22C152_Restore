@interface PUSyndicationAttributionTileViewController
- (BOOL)wantsVisibleRectChanges;
- (PUAssetViewModel)assetViewModel;
- (PUSyndicationAttributionTileViewControllerDelegate)delegate;
- (SLAttributionView)attributionView;
- (SLHighlight)highlight;
- (double)occupiedLeadingWidth;
- (id)contextMenuItemsForAttributionView:(id)a3;
- (id)loadView;
- (void)_handleHighlight:(id)a3 withAssetUUID:(id)a4;
- (void)_invalidateAttributionView;
- (void)_setupAttributionView;
- (void)_updateAttributionView;
- (void)becomeReusable;
- (void)didChangeVisibleRect;
- (void)setAssetViewModel:(id)a3;
- (void)setAttributionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setOccupiedLeadingWidth:(double)a3;
@end

@implementation PUSyndicationAttributionTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
}

- (void)setOccupiedLeadingWidth:(double)a3
{
  self->_occupiedLeadingWidth = a3;
}

- (double)occupiedLeadingWidth
{
  return self->_occupiedLeadingWidth;
}

- (void)setAttributionView:(id)a3
{
}

- (SLAttributionView)attributionView
{
  return self->_attributionView;
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setDelegate:(id)a3
{
}

- (PUSyndicationAttributionTileViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUSyndicationAttributionTileViewControllerDelegate *)WeakRetained;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUSyndicationAttributionTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUSyndicationAttributionTileViewController *)self _invalidateAttributionView];
  [(PUSyndicationAttributionTileViewController *)self setAssetViewModel:0];
  [(PUSyndicationAttributionTileViewController *)self setHighlight:0];
}

- (void)didChangeVisibleRect
{
  objc_super v3 = [(PUSyndicationAttributionTileViewController *)self attributionView];
  if (v3)
  {
    id v4 = v3;
    [(PUSyndicationAttributionTileViewController *)self _updateAttributionView];
    objc_super v3 = v4;
  }
}

- (BOOL)wantsVisibleRectChanges
{
  return 1;
}

- (id)contextMenuItemsForAttributionView:(id)a3
{
  id v4 = [(PUSyndicationAttributionTileViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(PUSyndicationAttributionTileViewController *)self delegate];
    v7 = [v6 additionalContextMenuActionsForAttributionTileViewController:self];
  }
  else
  {
    v7 = 0;
  }
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = v8;

  return v9;
}

- (void)_updateAttributionView
{
  id v13 = [(PUSyndicationAttributionTileViewController *)self highlight];
  objc_super v3 = [(PUSyndicationAttributionTileViewController *)self attributionView];
  if (v13)
  {
    id v4 = [MEMORY[0x1E4F90090] sharedInstance];
    uint64_t v5 = [v4 syndicated1upPillAlignment];

    if (!v3)
    {
      objc_super v3 = PXContentSyndicationAttributionViewForSocialLayerHighlight();
      [v3 setDelegate:self];
      if (v5 == 1) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
      [v3 updateAlignment:v6];
      v7 = [(PUTileViewController *)self view];
      [v7 addSubview:v3];

      [(PUSyndicationAttributionTileViewController *)self setAttributionView:v3];
    }
    v8 = [(PUTileViewController *)self view];
    [v8 bounds];
    double v10 = v9;

    [v3 prepareLayoutWithMaxWidth:v10];
    [v3 intrinsicContentSize];
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, v11, v12);
  }
  else
  {
    [v3 removeFromSuperview];

    [(PUSyndicationAttributionTileViewController *)self setAttributionView:0];
  }
}

- (void)_invalidateAttributionView
{
  objc_super v3 = [(PUSyndicationAttributionTileViewController *)self attributionView];
  [v3 removeFromSuperview];

  [(PUSyndicationAttributionTileViewController *)self setAttributionView:0];
}

- (void)setHighlight:(id)a3
{
  v7 = (SLHighlight *)a3;
  uint64_t v5 = self->_highlight;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(SLHighlight *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      [(PUSyndicationAttributionTileViewController *)self _invalidateAttributionView];
      objc_storeStrong((id *)&self->_highlight, a3);
      [(PUSyndicationAttributionTileViewController *)self _updateAttributionView];
    }
  }
}

- (void)_handleHighlight:(id)a3 withAssetUUID:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(PUSyndicationAttributionTileViewController *)self assetViewModel];
    double v9 = [v8 asset];
    double v10 = [v9 uuid];
    int v11 = [v7 isEqualToString:v10];

    if (v11) {
      [(PUSyndicationAttributionTileViewController *)self setHighlight:v6];
    }
  }
  else
  {
    double v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = v7;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "1up nil SLHighlight from PHAsset: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_setupAttributionView
{
  id v4 = [(PUSyndicationAttributionTileViewController *)self assetViewModel];
  uint64_t v5 = [v4 asset];
  int ShouldShowAttributionViewForAsset = PXContentSyndicationShouldShowAttributionViewForAsset();

  if (ShouldShowAttributionViewForAsset)
  {
    id v7 = [(PUSyndicationAttributionTileViewController *)self assetViewModel];
    v8 = [v7 asset];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        double v9 = [v8 uuid];
        double v10 = (void *)[v9 copy];

        [v8 fetchPropertySetsIfNeeded];
        int v11 = [MEMORY[0x1E4F90088] sharedInstance];
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __67__PUSyndicationAttributionTileViewController__setupAttributionView__block_invoke;
        v18[3] = &unk_1E5F2B1F0;
        objc_copyWeak(&v20, &location);
        id v12 = v10;
        id v19 = v12;
        [v11 fetchSocialLayerHighlightForAsset:v8 completion:v18];

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);

        return;
      }
      int v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v16);
      v17 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
      [v13 handleFailureInMethod:a2, self, @"PUSyndicationAttributionTileViewController.m", 79, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetViewModel.asset", v15, v17 object file lineNumber description];
    }
    else
    {
      int v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      [v13 handleFailureInMethod:a2, self, @"PUSyndicationAttributionTileViewController.m", 79, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetViewModel.asset", v15 object file lineNumber description];
    }

    goto LABEL_4;
  }
}

void __67__PUSyndicationAttributionTileViewController__setupAttributionView__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleHighlight:v4 withAssetUUID:*(void *)(a1 + 32)];
}

- (id)loadView
{
  v2 = objc_alloc_init(_PUSyndicationAttributionTileView);
  return v2;
}

- (void)setAssetViewModel:(id)a3
{
  uint64_t v5 = (PUAssetViewModel *)a3;
  if (self->_assetViewModel != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUSyndicationAttributionTileViewController *)self _setupAttributionView];
    uint64_t v5 = v6;
  }
}

@end