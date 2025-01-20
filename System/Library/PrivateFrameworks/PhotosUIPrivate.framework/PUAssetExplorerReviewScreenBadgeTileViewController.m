@interface PUAssetExplorerReviewScreenBadgeTileViewController
+ (CGSize)badgeTileSize;
+ (void)_configureBadgeView:(id)a3 isOverContent:(BOOL)a4 isLivePhotoDisabled:(BOOL)a5;
- (BOOL)_isOverContent;
- (BOOL)_isPerformingChanges;
- (BOOL)_needsUpdateBadgeView;
- (PUAssetActionManager)actionManager;
- (PUAssetReference)assetReference;
- (PUBrowsingViewModel)browsingViewModel;
- (PXUIAssetBadgeView)_badgeView;
- (id)_disableLivePhotosSelectionManager;
- (id)_reviewActionManager;
- (id)loadView;
- (void)_invalidateBadgeView;
- (void)_setNeedsUpdateBadgeView:(BOOL)a3;
- (void)_setOverContent:(BOOL)a3;
- (void)_setPerformingChanges:(BOOL)a3;
- (void)_updateBadgeViewIfNeeded;
- (void)_updateIfNeeded;
- (void)applyLayoutInfo:(id)a3;
- (void)assetBadgeView:(id)a3 userDidSelectBadges:(unint64_t)a4;
- (void)becomeReusable;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)prepareForReuse;
- (void)setActionManager:(id)a3;
- (void)setAssetReference:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUAssetExplorerReviewScreenBadgeTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__badgeView, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

- (BOOL)_isOverContent
{
  return self->__isOverContent;
}

- (void)_setNeedsUpdateBadgeView:(BOOL)a3
{
  self->__needsUpdateBadgeView = a3;
}

- (BOOL)_needsUpdateBadgeView
{
  return self->__needsUpdateBadgeView;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__performingChanges = a3;
}

- (BOOL)_isPerformingChanges
{
  return self->__performingChanges;
}

- (PXUIAssetBadgeView)_badgeView
{
  return self->__badgeView;
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self browsingViewModel];

  if (v8 == v6)
  {
    v9 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self assetReference];
    v10 = [v7 assetViewModelChangesByAssetReference];
    if (v9)
    {
      v11 = [v6 assetsDataSource];
      v12 = [v11 assetReferenceForAssetReference:v9];

      [v10 objectForKeyedSubscript:v12];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        while (2)
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17), "assetChanged", (void)v18))
            {

              [(PUAssetExplorerReviewScreenBadgeTileViewController *)self setAssetReference:v12];
              goto LABEL_13;
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

LABEL_13:
    }
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PUAssetExplorerReviewScreenBadgeTileViewControllerSelectionManagerObserverContext == a5)
  {
    id v11 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _disableLivePhotosSelectionManager];

    if (v11 == v9)
    {
      if ((v6 & 1) == 0) {
        goto LABEL_6;
      }
    }
    else
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenBadgeTileViewController.m" lineNumber:259 description:@"Expecting observable to match the current selection manager"];

      if ((v6 & 1) == 0) {
        goto LABEL_6;
      }
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__PUAssetExplorerReviewScreenBadgeTileViewController_observable_didChange_context___block_invoke;
    v13[3] = &unk_1E5F2ED10;
    v13[4] = self;
    [(PUAssetExplorerReviewScreenBadgeTileViewController *)self performChanges:v13];
    goto LABEL_6;
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenBadgeTileViewController.m" lineNumber:267 description:@"Not expecting any other observables"];

LABEL_6:
}

uint64_t __83__PUAssetExplorerReviewScreenBadgeTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateBadgeView];
}

- (void)assetBadgeView:(id)a3 userDidSelectBadges:(unint64_t)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v5 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self assetReference];
  char v6 = [v5 asset];
  id v7 = [v6 uuid];
  id v8 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _disableLivePhotosSelectionManager];
  char v9 = [v8 isSelectedUUID:v7];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __89__PUAssetExplorerReviewScreenBadgeTileViewController_assetBadgeView_userDidSelectBadges___block_invoke;
  long long v19 = &unk_1E5F23A00;
  char v21 = v9 ^ 1;
  id v20 = v7;
  id v10 = v7;
  [v8 performChanges:&v16];
  id v11 = objc_msgSend(v5, "assetCollection", v16, v17, v18, v19);
  v22 = v6;
  uint64_t v23 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v24[0] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  uint64_t v14 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _reviewActionManager];
  uint64_t v15 = [v14 actionPerformerForSimpleActionType:46 onAssetsByAssetCollection:v13];
  [v15 performWithCompletionHandler:0];
}

uint64_t __89__PUAssetExplorerReviewScreenBadgeTileViewController_assetBadgeView_userDidSelectBadges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [a2 addSelectedUUID:v2];
  }
  else {
    return [a2 removeSelectedUUID:v2];
  }
}

- (void)_updateBadgeViewIfNeeded
{
  if ([(PUAssetExplorerReviewScreenBadgeTileViewController *)self _needsUpdateBadgeView])
  {
    [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _setNeedsUpdateBadgeView:0];
    v3 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _badgeView];
    if (v3)
    {
      id v11 = v3;
      v4 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _reviewActionManager];
      v5 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self assetReference];
      char v6 = [v5 asset];
      id v7 = [v5 assetCollection];
      uint64_t v8 = [v4 canPerformActionType:46 onAsset:v6 inAssetCollection:v7] ^ 1;
      [v11 setHidden:v8];
      if ((v8 & 1) == 0)
      {
        char v9 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _disableLivePhotosSelectionManager];
        id v10 = [v6 uuid];
        objc_msgSend((id)objc_opt_class(), "_configureBadgeView:isOverContent:isLivePhotoDisabled:", v11, -[PUAssetExplorerReviewScreenBadgeTileViewController _isOverContent](self, "_isOverContent"), objc_msgSend(v9, "isSelectedUUID:", v10));
      }
      v3 = v11;
    }
  }
}

- (void)_invalidateBadgeView
{
  if (![(PUAssetExplorerReviewScreenBadgeTileViewController *)self _isPerformingChanges])
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenBadgeTileViewController.m" lineNumber:189 description:@"must be inside change block"];
  }
  [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _setNeedsUpdateBadgeView:1];
}

- (void)_updateIfNeeded
{
  if ([(PUAssetExplorerReviewScreenBadgeTileViewController *)self _needsUpdate])
  {
    if ([(PUTileViewController *)self isViewLoaded])
    {
      [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _updateBadgeViewIfNeeded];
      if ([(PUAssetExplorerReviewScreenBadgeTileViewController *)self _needsUpdate])
      {
        id v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenBadgeTileViewController.m" lineNumber:180 description:@"updates still needed after an update cycle"];
      }
    }
  }
}

- (void)_setOverContent:(BOOL)a3
{
  if (self->__isOverContent != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __70__PUAssetExplorerReviewScreenBadgeTileViewController__setOverContent___block_invoke;
    v3[3] = &unk_1E5F2E120;
    v3[4] = self;
    BOOL v4 = a3;
    [(PUAssetExplorerReviewScreenBadgeTileViewController *)self performChanges:v3];
  }
}

uint64_t __70__PUAssetExplorerReviewScreenBadgeTileViewController__setOverContent___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 170) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateBadgeView];
}

- (void)applyLayoutInfo:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUAssetExplorerReviewScreenBadgeTileViewController;
  [(PUTileViewController *)&v5 applyLayoutInfo:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[PUAssetExplorerReviewScreenBadgeTileViewController _setOverContent:](self, "_setOverContent:", [v4 isOverContent]);
  }
}

- (id)_disableLivePhotosSelectionManager
{
  uint64_t v2 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _reviewActionManager];
  v3 = [v2 disableLivePhotosSelectionManager];

  return v3;
}

- (id)_reviewActionManager
{
  uint64_t v2 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self actionManager];
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
  objc_super v5 = v4;
  if (self->_actionManager != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__PUAssetExplorerReviewScreenBadgeTileViewController_setActionManager___block_invoke;
    v6[3] = &unk_1E5F2ECC8;
    v6[4] = self;
    id v7 = v4;
    [(PUAssetExplorerReviewScreenBadgeTileViewController *)self performChanges:v6];
  }
}

void __71__PUAssetExplorerReviewScreenBadgeTileViewController_setActionManager___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _disableLivePhotosSelectionManager];
  [v3 unregisterChangeObserver:*(void *)(a1 + 32) context:PUAssetExplorerReviewScreenBadgeTileViewControllerSelectionManagerObserverContext];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) _disableLivePhotosSelectionManager];
  [v2 registerChangeObserver:*(void *)(a1 + 32) context:PUAssetExplorerReviewScreenBadgeTileViewControllerSelectionManagerObserverContext];
  [*(id *)(a1 + 32) _invalidateBadgeView];
}

- (void)setAssetReference:(id)a3
{
  id v4 = (PUAssetReference *)a3;
  objc_super v5 = v4;
  if (self->_assetReference != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__PUAssetExplorerReviewScreenBadgeTileViewController_setAssetReference___block_invoke;
    v6[3] = &unk_1E5F2ECC8;
    v6[4] = self;
    id v7 = v4;
    [(PUAssetExplorerReviewScreenBadgeTileViewController *)self performChanges:v6];
  }
}

uint64_t __72__PUAssetExplorerReviewScreenBadgeTileViewController_setAssetReference___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateBadgeView];
}

- (void)setBrowsingViewModel:(id)a3
{
  id v4 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v4)
  {
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    [(PUBrowsingViewModel *)v4 registerChangeObserver:self];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__PUAssetExplorerReviewScreenBadgeTileViewController_setBrowsingViewModel___block_invoke;
    v6[3] = &unk_1E5F2ECC8;
    v6[4] = self;
    id v7 = v4;
    [(PUAssetExplorerReviewScreenBadgeTileViewController *)self performChanges:v6];
  }
}

uint64_t __75__PUAssetExplorerReviewScreenBadgeTileViewController_setBrowsingViewModel___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateBadgeView];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PUAssetExplorerReviewScreenBadgeTileViewController;
  [(PUTileViewController *)&v3 prepareForReuse];
  [(PUAssetExplorerReviewScreenBadgeTileViewController *)self setAssetReference:0];
  [(PUAssetExplorerReviewScreenBadgeTileViewController *)self setActionManager:0];
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUAssetExplorerReviewScreenBadgeTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUAssetExplorerReviewScreenBadgeTileViewController *)self setAssetReference:0];
  [(PUAssetExplorerReviewScreenBadgeTileViewController *)self setActionManager:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUAssetExplorerReviewScreenBadgeTileViewController;
  [(PUTileViewController *)&v4 viewDidLoad];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PUAssetExplorerReviewScreenBadgeTileViewController_viewDidLoad__block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUAssetExplorerReviewScreenBadgeTileViewController *)self performChanges:v3];
}

uint64_t __65__PUAssetExplorerReviewScreenBadgeTileViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateBadgeView];
}

- (id)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F90840]);
  objc_super v4 = (PXUIAssetBadgeView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  badgeView = self->__badgeView;
  self->__badgeView = v4;

  [(PXUIAssetBadgeView *)self->__badgeView setDelegate:self];
  char v6 = self->__badgeView;
  return v6;
}

- (void)performChanges:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  BOOL v5 = [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _isPerformingChanges];
  [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _setPerformingChanges:1];
  v4[2](v4);

  [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _setPerformingChanges:v5];
  if (!v5)
  {
    [(PUAssetExplorerReviewScreenBadgeTileViewController *)self _updateIfNeeded];
  }
}

+ (void)_configureBadgeView:(id)a3 isOverContent:(BOOL)a4 isLivePhotoDisabled:(BOOL)a5
{
  BOOL v5 = a4;
  id v6 = a3;
  [v6 setStyle:4];
  PXAssetBadgeInfoCreateWithBadges();
  [v6 setBadgeInfo:&v7];
  [v6 setOverContent:v5];
}

+ (CGSize)badgeTileSize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PUAssetExplorerReviewScreenBadgeTileViewController_badgeTileSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (badgeTileSize_onceToken != -1) {
    dispatch_once(&badgeTileSize_onceToken, block);
  }
  double v2 = *(double *)&badgeTileSize_badgeTileSize_0;
  double v3 = *(double *)&badgeTileSize_badgeTileSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __67__PUAssetExplorerReviewScreenBadgeTileViewController_badgeTileSize__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F90840]);
  id v11 = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  char v3 = 0;
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  char v6 = 1;
  do
  {
    char v7 = v6;
    [*(id *)(a1 + 32) _configureBadgeView:v11 isOverContent:0 isLivePhotoDisabled:v3 & 1];
    objc_msgSend(v11, "sizeThatFits:", v4, v5);
    char v6 = 0;
    if (*(double *)&badgeTileSize_badgeTileSize_0 >= *(double *)&v8) {
      uint64_t v8 = badgeTileSize_badgeTileSize_0;
    }
    badgeTileSize_badgeTileSize_0 = v8;
    uint64_t v10 = badgeTileSize_badgeTileSize_1;
    if (*(double *)&badgeTileSize_badgeTileSize_1 < v9) {
      *(double *)&uint64_t v10 = v9;
    }
    badgeTileSize_badgeTileSize_1 = v10;
    char v3 = 1;
  }
  while ((v7 & 1) != 0);
}

@end