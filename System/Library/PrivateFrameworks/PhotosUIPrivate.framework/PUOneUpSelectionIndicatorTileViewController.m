@interface PUOneUpSelectionIndicatorTileViewController
- (BOOL)_isButtonVisible;
- (BOOL)_isPerformingChanges;
- (BOOL)_needsUpdateButton;
- (PUAssetActionManager)actionManager;
- (PUAssetReference)assetReference;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingViewModel)browsingViewModel;
- (UIButton)_button;
- (id)_reviewActionManager;
- (id)_selectionManager;
- (void)_handleButton:(id)a3;
- (void)_invalidateButton;
- (void)_setButton:(id)a3;
- (void)_setButtonVisible:(BOOL)a3;
- (void)_setButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setNeedsUpdateButton:(BOOL)a3;
- (void)_setPerformingChanges:(BOOL)a3;
- (void)_updateButtonIfNeeded;
- (void)_updateIfNeeded;
- (void)becomeReusable;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setActionManager:(id)a3;
- (void)setAssetReference:(id)a3;
- (void)setAssetViewModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUOneUpSelectionIndicatorTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->__button, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (BOOL)_isButtonVisible
{
  return self->__buttonVisible;
}

- (void)_setButton:(id)a3
{
}

- (UIButton)_button
{
  return self->__button;
}

- (void)_setNeedsUpdateButton:(BOOL)a3
{
  self->__needsUpdateButton = a3;
}

- (BOOL)_needsUpdateButton
{
  return self->__needsUpdateButton;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__performingChanges = a3;
}

- (BOOL)_isPerformingChanges
{
  return self->__performingChanges;
}

- (PUAssetActionManager)actionManager
{
  return self->_actionManager;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUOneUpSelectionIndicatorTileViewController *)self assetViewModel];

  if (v8 == v7 && [v6 importStateChanged])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__PUOneUpSelectionIndicatorTileViewController_viewModel_didChange___block_invoke;
    v9[3] = &unk_1E5F2ED10;
    v9[4] = self;
    [(PUOneUpSelectionIndicatorTileViewController *)self performChanges:v9];
  }
}

uint64_t __67__PUOneUpSelectionIndicatorTileViewController_viewModel_didChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateButton];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)AssetExplorerSelectionManagerObservationContext == a5)
  {
    id v16 = [(PUOneUpSelectionIndicatorTileViewController *)self _selectionManager];

    if (v16 != v9)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = v11;
      SEL v13 = a2;
      v14 = self;
      uint64_t v15 = 334;
LABEL_10:
      [v11 handleFailureInMethod:v13 object:v14 file:@"PUOneUpSelectionIndicatorTileViewController.m" lineNumber:v15 description:@"Expecting observable to match the current selection manager"];

      if ((v6 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PhotosUICoreSelectionManagerObservationContext_47920 != a5)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"PUOneUpSelectionIndicatorTileViewController.m" lineNumber:342 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v10 = [(PUOneUpSelectionIndicatorTileViewController *)self _selectionManager];

    if (v10 != v9)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = v11;
      SEL v13 = a2;
      v14 = self;
      uint64_t v15 = 338;
      goto LABEL_10;
    }
  }
  if (v6)
  {
LABEL_7:
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__PUOneUpSelectionIndicatorTileViewController_observable_didChange_context___block_invoke;
    v18[3] = &unk_1E5F2ED10;
    v18[4] = self;
    [(PUOneUpSelectionIndicatorTileViewController *)self performChanges:v18];
  }
LABEL_8:
}

uint64_t __76__PUOneUpSelectionIndicatorTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateButton];
}

- (void)_setButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__buttonVisible != a3)
  {
    BOOL v5 = a3;
    self->__buttonVisible = a3;
    char v6 = [(PUOneUpSelectionIndicatorTileViewController *)self _button];
    id v7 = v6;
    if (v5) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.0;
    }
    if (a4)
    {
      id v9 = (void *)MEMORY[0x1E4FB1EB0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __74__PUOneUpSelectionIndicatorTileViewController__setButtonVisible_animated___block_invoke;
      v10[3] = &unk_1E5F2E0A8;
      id v11 = v6;
      double v12 = v8;
      [v9 animateWithDuration:4 delay:v10 options:0 animations:0.15 completion:0.0];
    }
    else
    {
      [v6 setAlpha:v8];
    }
  }
}

uint64_t __74__PUOneUpSelectionIndicatorTileViewController__setButtonVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_setButtonVisible:(BOOL)a3
{
}

- (void)_updateButtonIfNeeded
{
  if (![(PUOneUpSelectionIndicatorTileViewController *)self _needsUpdateButton]) {
    return;
  }
  [(PUOneUpSelectionIndicatorTileViewController *)self _setNeedsUpdateButton:0];
  id v25 = [(PUOneUpSelectionIndicatorTileViewController *)self assetReference];
  v3 = [(PUOneUpSelectionIndicatorTileViewController *)self _selectionManager];
  v4 = [(PUOneUpSelectionIndicatorTileViewController *)self assetViewModel];
  if (v25 && v3 && -[PUTileViewController isViewLoaded](self, "isViewLoaded") && ![v4 importState])
  {
    id v9 = [(PUOneUpSelectionIndicatorTileViewController *)self actionManager];
    id v10 = [v25 asset];
    id v11 = [v25 assetCollection];
    int v12 = [v9 canPerformActionType:42 onAsset:v10 inAssetCollection:v11];

    uint64_t v13 = [(PUOneUpSelectionIndicatorTileViewController *)self _button];
    BOOL v5 = (void *)v13;
    if (v12)
    {
      if (!v13)
      {
        v24 = [(PUTileViewController *)self view];
        v14 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
        uint64_t v15 = [MEMORY[0x1E4FB1618] systemWhiteColor];
        id v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
        v17 = [v16 imageWithSymbolConfiguration:v14];
        v18 = [MEMORY[0x1E4FB1618] systemWhiteColor];
        v19 = [MEMORY[0x1E4FB1618] systemBlueColor];
        v20 = objc_msgSend(v17, "px_tintedCircularImageWithColor:backgroundColor:", v18, v19);

        v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
        v22 = [v21 imageWithSymbolConfiguration:v14];
        v23 = objc_msgSend(v22, "px_tintedCircularImageWithColor:backgroundColor:", v15, 0);

        BOOL v5 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
        [v5 setImage:v23 forState:0];
        [v5 setImage:v23 forState:1];
        [v5 setImage:v20 forState:4];
        [v5 setImage:v20 forState:5];
        [v5 addTarget:self action:sel__handleButton_ forControlEvents:64];
        [v5 setAutoresizingMask:18];
        [v24 bounds];
        objc_msgSend(v5, "setFrame:");
        [v24 addSubview:v5];
        [v5 setAlpha:0.0];
        [(PUOneUpSelectionIndicatorTileViewController *)self _setButton:v5];
      }
      objc_msgSend(v5, "setSelected:", objc_msgSend(v3, "pu_isAssetReferenceSelected:", v25));
      char v6 = self;
      uint64_t v7 = 1;
      uint64_t v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = [(PUOneUpSelectionIndicatorTileViewController *)self _button];
  }
  char v6 = self;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
LABEL_8:
  [(PUOneUpSelectionIndicatorTileViewController *)v6 _setButtonVisible:v7 animated:v8];
}

- (void)_invalidateButton
{
}

- (void)_updateIfNeeded
{
  if ([(PUOneUpSelectionIndicatorTileViewController *)self _needsUpdate])
  {
    [(PUOneUpSelectionIndicatorTileViewController *)self _updateButtonIfNeeded];
    if ([(PUOneUpSelectionIndicatorTileViewController *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PUOneUpSelectionIndicatorTileViewController.m" lineNumber:202 description:@"update still needed after update pass"];
    }
  }
}

- (void)performChanges:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL v5 = [(PUOneUpSelectionIndicatorTileViewController *)self _isPerformingChanges];
  [(PUOneUpSelectionIndicatorTileViewController *)self _setPerformingChanges:1];
  v4[2](v4);

  [(PUOneUpSelectionIndicatorTileViewController *)self _setPerformingChanges:v5];
  if (!v5)
  {
    [(PUOneUpSelectionIndicatorTileViewController *)self _updateIfNeeded];
  }
}

- (void)_handleButton:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PUOneUpSelectionIndicatorTileViewController *)self assetReference];
  BOOL v5 = [v4 asset];
  uint64_t v6 = [v4 assetCollection];
  uint64_t v7 = (void *)v6;
  if (v5 && v6)
  {
    uint64_t v8 = [(PUOneUpSelectionIndicatorTileViewController *)self actionManager];
    v12[0] = v4;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v10 = [v8 actionPerformerForSimpleActionType:42 onAssetReferences:v9];

    [v10 performWithCompletionHandler:&__block_literal_global_47945];
  }
  else
  {
    uint64_t v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Attempted to toggle selection but could not find one of asset or assetCollection", v11, 2u);
    }
  }
}

void __61__PUOneUpSelectionIndicatorTileViewController__handleButton___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Failed to perform selection action with error %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)_selectionManager
{
  v3 = [(PUOneUpSelectionIndicatorTileViewController *)self _reviewActionManager];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 selectionManager];
  }
  else
  {
    int v6 = [(PUOneUpSelectionIndicatorTileViewController *)self actionManager];
    BOOL v5 = objc_msgSend(v6, "px_selectionManager");
  }
  return v5;
}

- (id)_reviewActionManager
{
  v2 = [(PUOneUpSelectionIndicatorTileViewController *)self actionManager];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setActionManager:(id)a3
{
  id v4 = (PUAssetActionManager *)a3;
  BOOL v5 = v4;
  if (self->_actionManager != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__PUOneUpSelectionIndicatorTileViewController_setActionManager___block_invoke;
    v6[3] = &unk_1E5F2ECC8;
    v6[4] = self;
    id v7 = v4;
    [(PUOneUpSelectionIndicatorTileViewController *)self performChanges:v6];
  }
}

void __64__PUOneUpSelectionIndicatorTileViewController_setActionManager___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _selectionManager];
  objc_msgSend(v3, "pu_unregisterSelectionIndicatorObserver:", *(void *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), *(id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) _selectionManager];
  objc_msgSend(v2, "pu_registerSelectionIndicatorObserver:", *(void *)(a1 + 32));
  [*(id *)(a1 + 32) _invalidateButton];
}

- (void)setAssetReference:(id)a3
{
  BOOL v5 = (PUAssetReference *)a3;
  int v6 = v5;
  if (self->_assetReference != v5 && !-[PUAssetReference isEqual:](v5, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_assetReference, a3);
    if (v6)
    {
      id v7 = [(PUOneUpSelectionIndicatorTileViewController *)self browsingViewModel];
      uint64_t v8 = [v7 assetViewModelForAssetReference:v6];
    }
    else
    {
      uint64_t v8 = 0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PUOneUpSelectionIndicatorTileViewController_setAssetReference___block_invoke;
    v10[3] = &unk_1E5F2ECC8;
    void v10[4] = self;
    id v11 = v8;
    id v9 = v8;
    [(PUOneUpSelectionIndicatorTileViewController *)self performChanges:v10];
  }
}

uint64_t __65__PUOneUpSelectionIndicatorTileViewController_setAssetReference___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAssetViewModel:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateButton];
}

- (void)setBrowsingViewModel:(id)a3
{
  BOOL v5 = (PUBrowsingViewModel *)a3;
  if (self->_browsingViewModel != v5)
  {
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    int v6 = [(PUOneUpSelectionIndicatorTileViewController *)self assetReference];

    if (v6)
    {
      id v7 = [(PUOneUpSelectionIndicatorTileViewController *)self assetReference];
      uint64_t v8 = [(PUBrowsingViewModel *)v5 assetViewModelForAssetReference:v7];

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68__PUOneUpSelectionIndicatorTileViewController_setBrowsingViewModel___block_invoke;
      v10[3] = &unk_1E5F2ECC8;
      void v10[4] = self;
      id v11 = v8;
      id v9 = v8;
      [(PUOneUpSelectionIndicatorTileViewController *)self performChanges:v10];
    }
  }
}

uint64_t __68__PUOneUpSelectionIndicatorTileViewController_setBrowsingViewModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssetViewModel:*(void *)(a1 + 40)];
}

- (void)setAssetViewModel:(id)a3
{
  BOOL v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    [(PUAssetViewModel *)assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)self->_assetViewModel registerChangeObserver:self];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__PUOneUpSelectionIndicatorTileViewController_setAssetViewModel___block_invoke;
    v7[3] = &unk_1E5F2ED10;
    v7[4] = self;
    [(PUOneUpSelectionIndicatorTileViewController *)self performChanges:v7];
  }
}

uint64_t __65__PUOneUpSelectionIndicatorTileViewController_setAssetViewModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateButton];
}

- (void)becomeReusable
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpSelectionIndicatorTileViewController;
  [(PUTileViewController *)&v4 becomeReusable];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__PUOneUpSelectionIndicatorTileViewController_becomeReusable__block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUOneUpSelectionIndicatorTileViewController *)self performChanges:v3];
}

uint64_t __61__PUOneUpSelectionIndicatorTileViewController_becomeReusable__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAssetViewModel:0];
  [*(id *)(a1 + 32) setBrowsingViewModel:0];
  [*(id *)(a1 + 32) setAssetReference:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setActionManager:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpSelectionIndicatorTileViewController;
  [(PUTileViewController *)&v3 viewDidLoad];
  [(PUOneUpSelectionIndicatorTileViewController *)self _updateIfNeeded];
}

@end