@interface PUBadgeTileViewController
+ (CGSize)badgeTileSizeForAssetViewModel:(id)a3 contentWidth:(double)a4;
+ (CGSize)leadingBadgesSizeForAssetViewModel:(id)a3 contentWidth:(double)a4;
+ (id)_adjustmentDataLoadingQueue;
+ (void)_configureBadgeView:(id)a3 withBadgeInfo:(PXAssetBadgeInfo *)a4 isOverContent:(BOOL)a5 contentWidth:(double)a6 animated:(BOOL)a7;
+ (void)_logEffectNameApplied:(id)a3 toAsset:(id)a4;
+ (void)logAppliedLivePhotoEffect:(int64_t)a3 toAsset:(id)a4;
+ (void)logToggledDepthEffect:(BOOL)a3 onAsset:(id)a4;
- (BOOL)_isOverContent;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateBadgeInfo;
- (BOOL)_needsUpdateBadgeProvider;
- (BOOL)_needsUpdateBadgeView;
- (BOOL)isBadgeVisible;
- (PUAssetViewModel)assetViewModel;
- (PUBadgeInfoProvider)_badgeInfoProvider;
- (PUBadgeTileViewControllerDelegate)delegate;
- (PXAssetBadgeInfo)_badgeInfo;
- (PXUIAssetBadgeView)_badgeView;
- (UIView)livePhotoBadgeContainerView;
- (double)_contentWidth;
- (id)_depthMenuElementsForDepthEnabled:(BOOL)a3 depthControllerExists:(BOOL)a4;
- (id)_depthToggleActionForEnable:(BOOL)a3 handler:(id)a4;
- (id)_depthToggleMenuForBadges:(unint64_t)a3;
- (id)_disabledDepthMenuElementsDepthEnabled:(BOOL)a3;
- (id)_liveVariationsMenuForBadges:(unint64_t)a3;
- (id)_menuForBadges:(unint64_t)a3;
- (id)assetBadgeView:(id)a3 menuForBadges:(unint64_t)a4;
- (id)loadView;
- (id)undoManagerForActionPerformer:(id)a3;
- (void)_invalidateBadgeInfo;
- (void)_invalidateBadgeProvider;
- (void)_invalidateBadgeView;
- (void)_performEditsIfAllowedOnAsset:(id)a3 edits:(id)a4;
- (void)_setBadgeInfo:(PXAssetBadgeInfo *)a3;
- (void)_setContentWidth:(double)a3;
- (void)_setNeedsUpdateBadgeInfo:(BOOL)a3;
- (void)_setNeedsUpdateBadgeProvider:(BOOL)a3;
- (void)_setNeedsUpdateBadgeView:(BOOL)a3;
- (void)_setOverContent:(BOOL)a3;
- (void)_toggleDepthForAsset:(id)a3 enable:(BOOL)a4 undoManager:(id)a5;
- (void)_updateBadgeInfoIfNeeded;
- (void)_updateBadgeProviderIfNeeded;
- (void)_updateBadgeViewIfNeeded;
- (void)_updateIfNeeded;
- (void)applyLayoutInfo:(id)a3;
- (void)applyLivePhotoEffect:(int64_t)a3 toAsset:(id)a4 undoManager:(id)a5;
- (void)assetBadgeView:(id)a3 dismissAnyPresentedViewControllerWithCompletion:(id)a4;
- (void)becomeReusable;
- (void)didChangeActive;
- (void)disableLivePhotoForAsset:(id)a3 undoManager:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)setAssetViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)set_badgeInfoProvider:(id)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUBadgeTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__badgeView, 0);
  objc_storeStrong((id *)&self->__badgeInfoProvider, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (double)_contentWidth
{
  return self->__contentWidth;
}

- (BOOL)_isOverContent
{
  return self->__isOverContent;
}

- (PXUIAssetBadgeView)_badgeView
{
  return self->__badgeView;
}

- (void)set_badgeInfoProvider:(id)a3
{
}

- (PUBadgeInfoProvider)_badgeInfoProvider
{
  return self->__badgeInfoProvider;
}

- (PXAssetBadgeInfo)_badgeInfo
{
  long long v3 = *(_OWORD *)&self[7].duration;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[6].fileSize;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (void)_setNeedsUpdateBadgeView:(BOOL)a3
{
  self->__needsUpdateBadgeView = a3;
}

- (BOOL)_needsUpdateBadgeView
{
  return self->__needsUpdateBadgeView;
}

- (void)_setNeedsUpdateBadgeProvider:(BOOL)a3
{
  self->__needsUpdateBadgeProvider = a3;
}

- (BOOL)_needsUpdateBadgeProvider
{
  return self->__needsUpdateBadgeProvider;
}

- (void)_setNeedsUpdateBadgeInfo:(BOOL)a3
{
  self->__needsUpdateBadgeInfo = a3;
}

- (BOOL)_needsUpdateBadgeInfo
{
  return self->__needsUpdateBadgeInfo;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUBadgeTileViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUBadgeTileViewControllerDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if (a4 == 1 && (void *)PUBadgeInfoProviderObservationContext == a5) {
    [(PUBadgeTileViewController *)self _invalidateBadgeView];
  }
  [(PUBadgeTileViewController *)self _updateIfNeeded];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "badgeInfoChanged", a3)) {
    [(PUBadgeTileViewController *)self _invalidateBadgeInfo];
  }
  [(PUBadgeTileViewController *)self _updateIfNeeded];
}

- (id)undoManagerForActionPerformer:(id)a3
{
  long long v3 = [(PUBadgeTileViewController *)self _badgeView];
  v4 = [v3 undoManager];

  return v4;
}

- (void)assetBadgeView:(id)a3 dismissAnyPresentedViewControllerWithCompletion:(id)a4
{
  if (self->_delegateRespondsTo.userDidTapBadgeView)
  {
    id v5 = a4;
    id v6 = [(PUBadgeTileViewController *)self delegate];
    [v6 dismissPresentedViewController:self presentMenuWithCompletion:v5];
  }
}

- (id)assetBadgeView:(id)a3 menuForBadges:(unint64_t)a4
{
  return [(PUBadgeTileViewController *)self _menuForBadges:a4];
}

- (id)_depthToggleActionForEnable:(BOOL)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = PLServicesLivePortraitLocalizedFrameworkString();
  if (a3) {
    [MEMORY[0x1E4FB1818] systemImageNamed:@"f.cursive.circle"];
  }
  else {
  v7 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"f.cursive.circle.slash"];
  }
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PUBadgeTileViewController__depthToggleActionForEnable_handler___block_invoke;
  v12[3] = &unk_1E5F2A928;
  id v13 = v5;
  id v9 = v5;
  v10 = [v8 actionWithTitle:v6 image:v7 identifier:0 handler:v12];

  return v10;
}

uint64_t __65__PUBadgeTileViewController__depthToggleActionForEnable_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_disabledDepthMenuElementsDepthEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(PUBadgeTileViewController *)self _depthToggleActionForEnable:1 handler:0];
  id v6 = [(PUBadgeTileViewController *)self _depthToggleActionForEnable:0 handler:0];
  [v5 setAttributes:1];
  [v6 setAttributes:1];
  if (v3) {
    v7 = v5;
  }
  else {
    v7 = v6;
  }
  [v7 setState:1];
  v10[0] = v5;
  v10[1] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  return v8;
}

- (id)_depthMenuElementsForDepthEnabled:(BOOL)a3 depthControllerExists:(BOOL)a4
{
  BOOL v5 = a3;
  v35[2] = *MEMORY[0x1E4F143B8];
  if (self->_delegateRespondsTo.undoManager)
  {
    v7 = [(PUBadgeTileViewController *)self delegate];
    v8 = [v7 undoManagerForAssetActionPerformer:0];
  }
  else
  {
    v8 = 0;
  }
  id v9 = [(PUBadgeTileViewController *)self assetViewModel];
  v10 = [v9 asset];

  objc_initWeak(&location, self);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __85__PUBadgeTileViewController__depthMenuElementsForDepthEnabled_depthControllerExists___block_invoke;
  v28[3] = &unk_1E5F23DC8;
  BOOL v32 = v5;
  BOOL v33 = a4;
  objc_copyWeak(&v31, &location);
  id v11 = v10;
  id v29 = v11;
  id v12 = v8;
  id v30 = v12;
  id v13 = [(PUBadgeTileViewController *)self _depthToggleActionForEnable:1 handler:v28];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __85__PUBadgeTileViewController__depthMenuElementsForDepthEnabled_depthControllerExists___block_invoke_2;
  v22 = &unk_1E5F23DC8;
  BOOL v26 = v5;
  BOOL v27 = a4;
  objc_copyWeak(&v25, &location);
  id v14 = v11;
  id v23 = v14;
  id v15 = v12;
  id v24 = v15;
  v16 = [(PUBadgeTileViewController *)self _depthToggleActionForEnable:0 handler:&v19];
  objc_msgSend(v13, "setState:", v5, v19, v20, v21, v22);
  [v16 setState:!v5];
  v35[0] = v13;
  v35[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v17;
}

void __85__PUBadgeTileViewController__depthMenuElementsForDepthEnabled_depthControllerExists___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56) || !*(unsigned char *)(a1 + 57))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _toggleDepthForAsset:*(void *)(a1 + 32) enable:1 undoManager:*(void *)(a1 + 40)];
  }
}

void __85__PUBadgeTileViewController__depthMenuElementsForDepthEnabled_depthControllerExists___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) || !*(unsigned char *)(a1 + 57))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _toggleDepthForAsset:*(void *)(a1 + 32) enable:0 undoManager:*(void *)(a1 + 40)];
  }
}

- (id)_depthToggleMenuForBadges:(unint64_t)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (PECanRenderPortrait())
  {
    objc_initWeak(&location, self);
    BOOL v5 = (void *)MEMORY[0x1E4FB16B8];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke;
    id v14 = &unk_1E5F23DA0;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a3;
    id v15 = self;
    id v6 = [v5 elementWithUncachedProvider:&v11];
    v7 = (void *)MEMORY[0x1E4FB1970];
    v18[0] = v6;
    v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 1, v11, v12, v13, v14);
    id v9 = [v7 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v8];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

void __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    if ((*(_WORD *)(a1 + 48) & 0x380) != 0)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      id v6 = [v5 _disabledDepthMenuElementsDepthEnabled:0];
      v3[2](v3, v6);
    }
    else
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 40));
      v8 = [v7 assetViewModel];
      id v9 = [v8 asset];

      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v5 = v9;

        if (v5)
        {
          v10 = dispatch_group_create();
          dispatch_group_enter(v10);
          uint64_t v35 = 0;
          v36 = &v35;
          uint64_t v37 = 0x2020000000;
          char v38 = 0;
          uint64_t v31 = 0;
          BOOL v32 = &v31;
          uint64_t v33 = 0x2020000000;
          char v34 = 0;
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x2020000000;
          char v30 = 0;
          uint64_t v11 = (void *)MEMORY[0x1E4F911C0];
          id v12 = objc_loadWeakRetained((id *)(a1 + 40));
          id v13 = [(id)objc_opt_class() _adjustmentDataLoadingQueue];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_2;
          v20[3] = &unk_1E5F23D78;
          objc_copyWeak(&v26, (id *)(a1 + 40));
          id v14 = v10;
          v21 = v14;
          id v23 = &v27;
          id v15 = v3;
          v22 = v15;
          id v24 = &v35;
          id v25 = &v31;
          [v11 assetHasDepthEnabled:v5 queue:v13 handler:v20];

          dispatch_time_t v16 = dispatch_time(0, 100000000);
          intptr_t v17 = dispatch_group_wait(v14, v16);
          *((unsigned char *)v28 + 24) = v17 != 0;
          if (v17)
          {
            v18 = PLOneUpGetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19[0] = 0;
              _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEFAULT, "Badge tile menu synchronous depth enabled check timed out, continuing asynchronously with loading indicator", (uint8_t *)v19, 2u);
            }
          }
          else
          {
            v18 = [*(id *)(a1 + 32) _depthMenuElementsForDepthEnabled:*((unsigned __int8 *)v36 + 24) depthControllerExists:*((unsigned __int8 *)v32 + 24)];
            v15[2](v15, v18);
          }

          objc_destroyWeak(&v26);
          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v31, 8);
          _Block_object_dispose(&v35, 8);

          goto LABEL_13;
        }
      }
      else
      {
      }
      v3[2](v3, (void *)MEMORY[0x1E4F1CBF0]);
      id v5 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  v3[2](v3, (void *)MEMORY[0x1E4F1CBF0]);
LABEL_14:
}

void __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_2(uint64_t a1, char a2, char a3)
{
  id v6 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));

  if (WeakRetained)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      objc_copyWeak(&v9, v6);
      char v10 = a2;
      char v11 = a3;
      id v8 = *(id *)(a1 + 40);
      px_dispatch_on_main_queue();

      objc_destroyWeak(&v9);
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_3;
      id v15 = &unk_1E5F2EBA0;
      id v16 = *(id *)(a1 + 40);
      px_dispatch_on_main_queue();
    }
  }
}

uint64_t __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__PUBadgeTileViewController__depthToggleMenuForBadges___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _depthMenuElementsForDepthEnabled:*(unsigned __int8 *)(a1 + 48) depthControllerExists:*(unsigned __int8 *)(a1 + 49)];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_liveVariationsMenuForBadges:(unint64_t)a3
{
  v72[5] = *MEMORY[0x1E4F143B8];
  if (self->_delegateRespondsTo.undoManager)
  {
    id v5 = [(PUBadgeTileViewController *)self delegate];
    id v6 = [v5 undoManagerForAssetActionPerformer:0];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(PUBadgeTileViewController *)self assetViewModel];
  id v8 = [v7 asset];

  v50 = PULocalizedString(@"LIVE_PHOTO_BADGE_MENU_ACTION_LIVE");
  v49 = [MEMORY[0x1E4FB1818] systemImageNamed:@"livephoto"];
  char v46 = [v8 mediaSubtypes];
  if ((v46 & 0x10) != 0)
  {
    uint64_t v9 = PLServicesLivePortraitLocalizedFrameworkString();

    uint64_t v10 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"livephoto.portrait"];

    v49 = (void *)v10;
    v50 = (void *)v9;
  }
  objc_initWeak(&location, self);
  char v11 = (void *)MEMORY[0x1E4FB13F0];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke;
  v67[3] = &unk_1E5F2D468;
  v44 = &v70;
  objc_copyWeak(&v70, &location);
  id v12 = v8;
  id v68 = v12;
  id v13 = v6;
  id v69 = v13;
  v48 = [v11 actionWithTitle:v50 image:v49 identifier:0 handler:v67];
  id v14 = (void *)MEMORY[0x1E4FB13F0];
  id v15 = PULocalizedString(@"LIVE_PHOTO_BADGE_MENU_ACTION_LOOP");
  id v16 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"livephoto.loop"];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_2;
  v63[3] = &unk_1E5F2D468;
  v45 = &v66;
  objc_copyWeak(&v66, &location);
  id v17 = v12;
  id v64 = v17;
  id v18 = v13;
  id v65 = v18;
  v47 = [v14 actionWithTitle:v15 image:v16 identifier:0 handler:v63];

  uint64_t v19 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v20 = PULocalizedString(@"LIVE_PHOTO_BADGE_MENU_ACTION_BOUNCE");
  v21 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"livephoto.bounce"];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_3;
  v59[3] = &unk_1E5F2D468;
  v43 = &v62;
  objc_copyWeak(&v62, &location);
  id v22 = v17;
  id v60 = v22;
  id v23 = v18;
  id v61 = v23;
  id v24 = [v19 actionWithTitle:v20 image:v21 identifier:0 handler:v59];

  id v25 = (void *)MEMORY[0x1E4FB13F0];
  id v26 = PULocalizedString(@"LIVE_PHOTO_BADGE_MENU_ACTION_LONG_EXPOSURE");
  uint64_t v27 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"livephoto.long.exposure"];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_4;
  v55[3] = &unk_1E5F2D468;
  v42 = &v58;
  objc_copyWeak(&v58, &location);
  id v28 = v22;
  id v56 = v28;
  id v29 = v23;
  id v57 = v29;
  char v30 = [v25 actionWithTitle:v26 image:v27 identifier:0 handler:v55];

  uint64_t v31 = [MEMORY[0x1E4FB1818] systemImageNamed:@"livephoto.slash"];
  if ((v46 & 0x10) != 0)
  {
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:", @"livephoto.slash.portrait", &v58, &v62, &v70, &v66);

    uint64_t v31 = (void *)v32;
  }
  uint64_t v33 = (void *)MEMORY[0x1E4FB13F0];
  char v34 = PULocalizedString(@"LIVE_PHOTO_BADGE_MENU_ACTION_DISABLE_LIVE_PHOTO");
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_5;
  v51[3] = &unk_1E5F2D468;
  objc_copyWeak(&v54, &location);
  id v35 = v28;
  id v52 = v35;
  id v36 = v29;
  id v53 = v36;
  uint64_t v37 = [v33 actionWithTitle:v34 image:v31 identifier:0 handler:v51];

  [v48 setState:!(a3 & 0x1000000) & (a3 >> 6)];
  [v47 setState:(a3 >> 7) & 1];
  [v24 setState:(a3 >> 8) & 1];
  [v30 setState:(a3 >> 9) & 1];
  [v37 setState:(a3 >> 24) & 1];
  char v38 = (void *)MEMORY[0x1E4FB1970];
  v72[0] = v48;
  v72[1] = v47;
  v72[2] = v24;
  v72[3] = v30;
  v72[4] = v37;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:5];
  v40 = [v38 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v39];

  objc_destroyWeak(&v54);
  objc_destroyWeak(v42);

  objc_destroyWeak(v43);
  objc_destroyWeak(v45);

  objc_destroyWeak(v44);
  objc_destroyWeak(&location);

  return v40;
}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained applyLivePhotoEffect:0 toAsset:*(void *)(a1 + 32) undoManager:*(void *)(a1 + 40)];
}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained applyLivePhotoEffect:1 toAsset:*(void *)(a1 + 32) undoManager:*(void *)(a1 + 40)];
}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained applyLivePhotoEffect:2 toAsset:*(void *)(a1 + 32) undoManager:*(void *)(a1 + 40)];
}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained applyLivePhotoEffect:3 toAsset:*(void *)(a1 + 32) undoManager:*(void *)(a1 + 40)];
}

void __58__PUBadgeTileViewController__liveVariationsMenuForBadges___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained disableLivePhotoForAsset:*(void *)(a1 + 32) undoManager:*(void *)(a1 + 40)];
}

- (id)_menuForBadges:(unint64_t)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x40000002000) != 0)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ((a3 & 0x2000) != 0)
    {
      id v6 = [(PUBadgeTileViewController *)self _liveVariationsMenuForBadges:a3];
      [v5 addObject:v6];
    }
    if ((a3 & 0x40000000000) != 0)
    {
      id v7 = [(PUBadgeTileViewController *)self _depthToggleMenuForBadges:a3];
      if (v7) {
        [v5 addObject:v7];
      }
    }
    if ([v5 count])
    {
      id v8 = [MEMORY[0x1E4FB1970] menuWithChildren:v5];
    }
    else
    {
      id v8 = 0;
    }
    goto LABEL_23;
  }
  if ((a3 & 0x2000000000) == 0)
  {
    id v8 = 0;
    goto LABEL_24;
  }
  uint64_t v10 = [(PUBadgeTileViewController *)self assetViewModel];
  id v5 = [v10 asset];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_15;
    }
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v31 = (objc_class *)objc_opt_class();
    char v30 = NSStringFromClass(v31);
    uint64_t v32 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v28 handleFailureInMethod:a2, self, @"PUBadgeTileViewController.m", 426, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetViewModel.asset", v30, v32 object file lineNumber description];
  }
  else
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    id v29 = (objc_class *)objc_opt_class();
    char v30 = NSStringFromClass(v29);
    [v28 handleFailureInMethod:a2, self, @"PUBadgeTileViewController.m", 426, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetViewModel.asset", v30 object file lineNumber description];
  }

LABEL_15:
  char v11 = [MEMORY[0x1E4F90468] dataSourceManagerWithAsset:v5];
  id v12 = (void *)MEMORY[0x1E4F91268];
  id v13 = [v11 dataSource];
  v41[0] = [v13 identifier];
  v41[1] = 0;
  v41[2] = 0;
  v41[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v14 = [v12 indexPathSetWithIndexPath:v41];

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F912D0]) initWithDataSourceManager:v11];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke;
  v39[3] = &unk_1E5F23D28;
  id v16 = v14;
  id v40 = v16;
  [v15 performChanges:v39];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F90430]) initWithSelectionManager:v15];
  [v17 setDataSourceManager:v11];
  [v17 setPerformerDelegate:self];
  if ((a3 & 0x8000000000) != 0)
  {
    id v18 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v19 = PXLocalizedSharedLibraryString();
    uint64_t v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.fill"];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke_2;
    v36[3] = &unk_1E5F2A180;
    v21 = &v37;
    id v37 = v17;
    id v22 = &v38;
    id v38 = v5;
    id v23 = v36;
  }
  else
  {
    if ((a3 & 0x4000000000) == 0)
    {
LABEL_21:
      id v8 = 0;
      goto LABEL_22;
    }
    id v18 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v19 = PXLocalizedSharedLibraryString();
    uint64_t v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2.fill"];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke_301;
    v33[3] = &unk_1E5F2A180;
    v21 = &v34;
    id v34 = v17;
    id v22 = &v35;
    id v35 = v5;
    id v23 = v33;
  }
  id v24 = [v18 actionWithTitle:v19 image:v20 identifier:0 handler:v23];

  if (!v24) {
    goto LABEL_21;
  }
  id v25 = (void *)MEMORY[0x1E4FB1970];
  v42[0] = v24;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  id v8 = [v25 menuWithChildren:v26];

LABEL_22:
LABEL_23:

LABEL_24:
  return v8;
}

uint64_t __44__PUBadgeTileViewController__menuForBadges___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

void __44__PUBadgeTileViewController__menuForBadges___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actionPerformerForActionType:*MEMORY[0x1E4F90D10]];
  id v3 = (void *)MEMORY[0x1E4F908D0];
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v5 = objc_msgSend(v4, "px_firstKeyWindow");
  id v6 = [v5 rootViewController];
  id v7 = [v3 defaultPresenterWithViewController:v6];
  [v2 setPresentationEnvironment:v7];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke_3;
  v8[3] = &unk_1E5F2E3B8;
  id v9 = *(id *)(a1 + 40);
  [v2 performActionWithCompletionHandler:v8];
}

void __44__PUBadgeTileViewController__menuForBadges___block_invoke_301(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actionPerformerForActionType:*MEMORY[0x1E4F90D18]];
  id v3 = (void *)MEMORY[0x1E4F908D0];
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v5 = objc_msgSend(v4, "px_firstKeyWindow");
  id v6 = [v5 rootViewController];
  id v7 = [v3 defaultPresenterWithViewController:v6];
  [v2 setPresentationEnvironment:v7];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PUBadgeTileViewController__menuForBadges___block_invoke_2_302;
  v8[3] = &unk_1E5F2E3B8;
  id v9 = *(id *)(a1 + 40);
  [v2 performActionWithCompletionHandler:v8];
}

void __44__PUBadgeTileViewController__menuForBadges___block_invoke_2_302(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) uuid];
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Error moving asset %{public}@ to shared library:%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __44__PUBadgeTileViewController__menuForBadges___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) uuid];
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Error moving asset %{public}@ to personal library:%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_updateBadgeViewIfNeeded
{
  if ([(PUBadgeTileViewController *)self _needsUpdateBadgeView])
  {
    [(PUBadgeTileViewController *)self _setNeedsUpdateBadgeView:0];
    id v3 = [(PUBadgeTileViewController *)self _badgeInfoProvider];
    long long v12 = 0u;
    long long v13 = 0u;
    [(PUBadgeTileViewController *)self _badgeInfo];
    long long v10 = 0u;
    long long v11 = 0u;
    if (v3) {
      [v3 outputBadgeInfo];
    }
    uint64_t v4 = [v3 outputShouldAnimate];
    id v5 = [(PUBadgeTileViewController *)self _badgeView];
    long long v8 = v12;
    long long v9 = v13;
    if ((PXAssetBadgeInfoIsNull() & 1) == 0)
    {
      if (v5)
      {
        id v6 = objc_opt_class();
        BOOL v7 = [(PUBadgeTileViewController *)self _isOverContent];
        [(PUBadgeTileViewController *)self _contentWidth];
        long long v8 = v10;
        long long v9 = v11;
        objc_msgSend(v6, "_configureBadgeView:withBadgeInfo:isOverContent:contentWidth:animated:", v5, &v8, v7, v4);
      }
    }
  }
}

- (void)_invalidateBadgeView
{
  [(PUBadgeTileViewController *)self _setNeedsUpdateBadgeView:1];
  [(PUBadgeTileViewController *)self _setNeedsUpdate];
}

- (void)_updateBadgeProviderIfNeeded
{
  if ([(PUBadgeTileViewController *)self _needsUpdateBadgeProvider])
  {
    [(PUBadgeTileViewController *)self _setNeedsUpdateBadgeProvider:0];
    id v3 = [(PUBadgeTileViewController *)self _badgeInfoProvider];
    if (!v3)
    {
      id v3 = objc_alloc_init(PUBadgeInfoProvider);
      [(PUBadgeInfoProvider *)v3 registerChangeObserver:self context:PUBadgeInfoProviderObservationContext];
      [(PUBadgeTileViewController *)self set_badgeInfoProvider:v3];
    }
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__PUBadgeTileViewController__updateBadgeProviderIfNeeded__block_invoke;
    v4[3] = &unk_1E5F2B538;
    v4[4] = self;
    [(PUBadgeInfoProvider *)v3 performChanges:v4];
  }
}

void __57__PUBadgeTileViewController__updateBadgeProviderIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) assetViewModel];
  [v3 setAssetViewModel:v4];

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    [v5 _badgeInfo];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  v6[0] = v7;
  v6[1] = v8;
  [v3 setBadgeInfo:v6];
}

- (void)_invalidateBadgeProvider
{
  [(PUBadgeTileViewController *)self _setNeedsUpdateBadgeProvider:1];
  [(PUBadgeTileViewController *)self _setNeedsUpdate];
}

- (void)_updateBadgeInfoIfNeeded
{
  if ([(PUBadgeTileViewController *)self _needsUpdateBadgeInfo])
  {
    [(PUBadgeTileViewController *)self _setNeedsUpdateBadgeInfo:0];
    long long v7 = 0u;
    long long v8 = 0u;
    id v3 = [(PUBadgeTileViewController *)self assetViewModel];
    uint64_t v4 = [v3 badgeInfoPromise];
    id v5 = v4;
    if (v4)
    {
      [v4 badgeInfo];
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
    }

    v6[0] = v7;
    v6[1] = v8;
    [(PUBadgeTileViewController *)self _setBadgeInfo:v6];
  }
}

- (void)_invalidateBadgeInfo
{
  [(PUBadgeTileViewController *)self _setNeedsUpdateBadgeInfo:1];
  [(PUBadgeTileViewController *)self _setNeedsUpdate];
}

- (BOOL)_needsUpdate
{
  if ([(PUBadgeTileViewController *)self _needsUpdateBadgeInfo]
    || [(PUBadgeTileViewController *)self _needsUpdateBadgeProvider])
  {
    return 1;
  }
  return [(PUBadgeTileViewController *)self _needsUpdateBadgeView];
}

- (void)_updateIfNeeded
{
  if ([(PUBadgeTileViewController *)self _needsUpdate])
  {
    if ([(PUTileViewController *)self isViewLoaded])
    {
      [(PUBadgeTileViewController *)self _updateBadgeInfoIfNeeded];
      [(PUBadgeTileViewController *)self _updateBadgeProviderIfNeeded];
      [(PUBadgeTileViewController *)self _updateBadgeViewIfNeeded];
      if ([(PUBadgeTileViewController *)self _needsUpdate])
      {
        id v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:a2 object:self file:@"PUBadgeTileViewController.m" lineNumber:322 description:@"updates still needed after an update cycle"];
      }
    }
  }
}

- (void)_setContentWidth:(double)a3
{
  if (self->__contentWidth != a3)
  {
    self->__contentWidth = a3;
    [(PUBadgeTileViewController *)self _invalidateBadgeView];
  }
}

- (void)_setOverContent:(BOOL)a3
{
  if (self->__isOverContent != a3)
  {
    self->__isOverContent = a3;
    [(PUBadgeTileViewController *)self _invalidateBadgeView];
  }
}

- (void)_setBadgeInfo:(PXAssetBadgeInfo *)a3
{
  p_PXAssetBadgeInfo badgeInfo = &self->__badgeInfo;
  PXAssetBadgeInfo v8 = *a3;
  PXAssetBadgeInfo badgeInfo = self->__badgeInfo;
  if ((PXAssetBadgeInfoEqualToBadgeInfo() & 1) == 0)
  {
    long long v6 = *(_OWORD *)&a3->count;
    *(_OWORD *)&p_badgeInfo->badges = *(_OWORD *)&a3->badges;
    *(_OWORD *)&p_badgeInfo->count = v6;
    [(PUBadgeTileViewController *)self _invalidateBadgeProvider];
    [(PUBadgeTileViewController *)self _invalidateBadgeView];
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PUBadgeTileViewController;
  [(PUTileViewController *)&v5 prepareForReuse];
  [(PUBadgeTileViewController *)self setAssetViewModel:0];
  id v3 = [(PUBadgeTileViewController *)self _badgeView];
  [v3 prepareForReuse];

  id v4 = [(PUBadgeTileViewController *)self _badgeInfoProvider];
  [v4 performChanges:&__block_literal_global_263];
}

uint64_t __44__PUBadgeTileViewController_prepareForReuse__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prepareForReuse];
}

- (void)applyLayoutInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUBadgeTileViewController;
  [(PUTileViewController *)&v8 applyLayoutInfo:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    -[PUBadgeTileViewController _setOverContent:](self, "_setOverContent:", [v5 isOverContent]);
    [v5 contentWidth];
    double v7 = v6;

    [(PUBadgeTileViewController *)self _setContentWidth:v7];
  }
  [(PUBadgeTileViewController *)self _updateIfNeeded];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->userDidTapBadgeView = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->badgeVisibilityDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->undoManager = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->presentViewController = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setAssetViewModel:(id)a3
{
  id v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    double v7 = v5;
    [(PUAssetViewModel *)assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)self->_assetViewModel registerChangeObserver:self];
    [(PUBadgeTileViewController *)self _invalidateBadgeInfo];
    [(PUBadgeTileViewController *)self _invalidateBadgeProvider];
    [(PUBadgeTileViewController *)self _invalidateBadgeView];
    [(PUBadgeTileViewController *)self _updateIfNeeded];
    id v5 = v7;
  }
}

- (UIView)livePhotoBadgeContainerView
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUTileViewController *)self view];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(PUTileViewController *)self view];
  id v5 = [v4 subviews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v15 = v3;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v10;
          long long v17 = 0u;
          long long v18 = 0u;
          [(PUBadgeTileViewController *)self _badgeInfo];
          long long v11 = [v3 text];
          v16[0] = v17;
          v16[1] = v18;
          long long v12 = [MEMORY[0x1E4F90008] textForBadgeInfo:v16 style:3];
          int v13 = [v11 isEqualToString:v12];

          if (v13)
          {

            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    id v3 = v15;
  }
LABEL_13:

  return (UIView *)v3;
}

- (BOOL)isBadgeVisible
{
  v3.receiver = self;
  v3.super_class = (Class)PUBadgeTileViewController;
  return [(PUTileController *)&v3 isActive];
}

- (void)didChangeActive
{
  if (self->_delegateRespondsTo.badgeVisibilityDidChange)
  {
    id v3 = [(PUBadgeTileViewController *)self delegate];
    [v3 badgeVisibilityDidChange:self];
  }
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUBadgeTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUBadgeTileViewController *)self setAssetViewModel:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUBadgeTileViewController;
  [(PUTileViewController *)&v3 viewDidLoad];
  [(PUBadgeTileViewController *)self _invalidateBadgeView];
  [(PUBadgeTileViewController *)self _updateIfNeeded];
}

- (id)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F90840]);
  id v4 = (PXUIAssetBadgeView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  badgeView = self->__badgeView;
  self->__badgeView = v4;

  [(PXUIAssetBadgeView *)self->__badgeView setDelegate:self];
  uint64_t v6 = self->__badgeView;
  return v6;
}

- (void)_performEditsIfAllowedOnAsset:(id)a3 edits:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = v6;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  int v10 = [v9 isSpatialMedia];
  if (v10)
  {
    long long v11 = (void *)MEMORY[0x1E4FB1418];
    long long v12 = PELocalizedString();
    int v13 = PELocalizedString();
    id v14 = [v11 alertControllerWithTitle:v12 message:v13 preferredStyle:1];

    id v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = PELocalizedString();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __65__PUBadgeTileViewController__performEditsIfAllowedOnAsset_edits___block_invoke;
    v23[3] = &unk_1E5F2E898;
    long long v17 = v7;
    id v24 = v17;
    long long v18 = [v15 actionWithTitle:v16 style:0 handler:v23];
    [v14 addAction:v18];

    long long v19 = (void *)MEMORY[0x1E4FB1410];
    long long v20 = PELocalizedString();
    long long v21 = [v19 actionWithTitle:v20 style:1 handler:&__block_literal_global_14188];
    [v14 addAction:v21];

    if (self->_delegateRespondsTo.presentViewController)
    {
      long long v22 = [(PUBadgeTileViewController *)self delegate];
      [v22 badgeTileViewController:self presentViewController:v14];
    }
    else
    {
      v17[2](v17);
    }
  }
  else
  {
    v7[2](v7);
  }
}

uint64_t __65__PUBadgeTileViewController__performEditsIfAllowedOnAsset_edits___block_invoke(uint64_t a1)
{
  v2 = PLOneUpGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "User approved 1up edit of spatial asset", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__PUBadgeTileViewController__performEditsIfAllowedOnAsset_edits___block_invoke_240()
{
  v0 = PLOneUpGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AE9F8000, v0, OS_LOG_TYPE_DEFAULT, "User cancelled 1up edit of spatial asset", v1, 2u);
  }
}

- (void)_toggleDepthForAsset:(id)a3 enable:(BOOL)a4 undoManager:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUBadgeTileViewController.m", 139, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PUBadgeTileViewController__toggleDepthForAsset_enable_undoManager___block_invoke;
  v14[3] = &unk_1E5F2DCD0;
  BOOL v17 = a4;
  id v15 = v9;
  id v16 = v10;
  id v11 = v10;
  id v12 = v9;
  [(PUBadgeTileViewController *)self _performEditsIfAllowedOnAsset:v12 edits:v14];
}

void __69__PUBadgeTileViewController__toggleDepthForAsset_enable_undoManager___block_invoke(uint64_t a1)
{
  v2 = PXAssetEditOperationTypeForDepthToggle();
  id v3 = [MEMORY[0x1E4F8FFD0] sharedManager];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PUBadgeTileViewController__toggleDepthForAsset_enable_undoManager___block_invoke_2;
  v7[3] = &unk_1E5F29930;
  char v9 = *(unsigned char *)(a1 + 48);
  id v8 = v4;
  id v6 = (id)[v3 performEditOperationWithType:v2 asset:v8 undoManager:v5 completionHandler:v7];
}

void __69__PUBadgeTileViewController__toggleDepthForAsset_enable_undoManager___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    +[PUBadgeTileViewController logToggledDepthEffect:*(unsigned __int8 *)(a1 + 40) onAsset:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = PLOneUpGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 40)) {
        id v8 = @"enable";
      }
      else {
        id v8 = @"disable";
      }
      int v9 = 138412802;
      id v10 = v8;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to %@ depth for asset %@ with error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)disableLivePhotoForAsset:(id)a3 undoManager:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 canPlayPhotoIris])
  {
    uint64_t v7 = *MEMORY[0x1E4F90E20];
    id v8 = [MEMORY[0x1E4F8FFD0] sharedManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__PUBadgeTileViewController_disableLivePhotoForAsset_undoManager___block_invoke;
    v11[3] = &unk_1E5F2E3B8;
    uint64_t v12 = v5;
    id v9 = (id)[v8 performEditOperationWithType:v7 asset:v12 undoManager:v6 completionHandler:v11];

    id v10 = v12;
  }
  else
  {
    id v10 = PLOneUpGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "User selected Live Photo Off for asset %@, but it is already off. No-op.", buf, 0xCu);
    }
  }
}

void __66__PUBadgeTileViewController_disableLivePhotoForAsset_undoManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x1E4F56658];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v14 = *MEMORY[0x1E4F56558];
    v15[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v6 sendEvent:@"com.apple.photos.CPAnalytics.oneUpLivePhotoDisabled" withPayload:v8];
  }
  else
  {
    id v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Failed to disable Live photo for asset %@ with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)applyLivePhotoEffect:(int64_t)a3 toAsset:(id)a4 undoManager:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUBadgeTileViewController.m", 96, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if ([v9 canPlayPhotoIris]
    && (int v11 = PFMetadataPlaybackVariationFromPXAssetVariation(),
        v11 == [v9 playbackVariation]))
  {
    __int16 v12 = PLOneUpGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = PXAssetVariationTypeDescription();
      *(_DWORD *)buf = 138412546;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "User selected variation %@ for asset %@, but it is already applied. No-op.", buf, 0x16u);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PUBadgeTileViewController_applyLivePhotoEffect_toAsset_undoManager___block_invoke;
    aBlock[3] = &unk_1E5F2D2C8;
    int64_t v21 = a3;
    uint64_t v14 = v9;
    long long v19 = v14;
    id v20 = v10;
    uint64_t v15 = _Block_copy(aBlock);
    id v16 = v15;
    if (a3) {
      [(PUBadgeTileViewController *)self _performEditsIfAllowedOnAsset:v14 edits:v15];
    }
    else {
      (*((void (**)(void *))v15 + 2))(v15);
    }

    __int16 v12 = v19;
  }
}

void __70__PUBadgeTileViewController_applyLivePhotoEffect_toAsset_undoManager___block_invoke(void *a1)
{
  v2 = PXAssetEditOperationTypeForVariationType();
  id v3 = [MEMORY[0x1E4F8FFD0] sharedManager];
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PUBadgeTileViewController_applyLivePhotoEffect_toAsset_undoManager___block_invoke_2;
  v7[3] = &unk_1E5F2E8E0;
  uint64_t v9 = a1[6];
  id v8 = v4;
  id v6 = (id)[v3 performEditOperationWithType:v2 asset:v8 undoManager:v5 completionHandler:v7];
}

void __70__PUBadgeTileViewController_applyLivePhotoEffect_toAsset_undoManager___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    +[PUBadgeTileViewController logAppliedLivePhotoEffect:*(void *)(a1 + 40) toAsset:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = PLOneUpGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to apply suggested variation with error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (id)_adjustmentDataLoadingQueue
{
  if (_adjustmentDataLoadingQueue_onceToken != -1) {
    dispatch_once(&_adjustmentDataLoadingQueue_onceToken, &__block_literal_global_366);
  }
  v2 = (void *)_adjustmentDataLoadingQueue_loadingQueue;
  return v2;
}

void __56__PUBadgeTileViewController__adjustmentDataLoadingQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.DepthEnabledLoadingQueue", 0);
  v1 = (void *)_adjustmentDataLoadingQueue_loadingQueue;
  _adjustmentDataLoadingQueue_loadingQueue = (uint64_t)v0;
}

+ (void)_configureBadgeView:(id)a3 withBadgeInfo:(PXAssetBadgeInfo *)a4 isOverContent:(BOOL)a5 contentWidth:(double)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  long long v12 = *(_OWORD *)&a4->count;
  long long v16 = *(_OWORD *)&a4->badges;
  long long v17 = v12;
  v14[2] = __99__PUBadgeTileViewController__configureBadgeView_withBadgeInfo_isOverContent_contentWidth_animated___block_invoke;
  v14[3] = &unk_1E5F23CE0;
  id v15 = v11;
  BOOL v19 = a5;
  double v18 = a6;
  id v13 = v11;
  [v13 performChanges:v14 animated:v7];
}

uint64_t __99__PUBadgeTileViewController__configureBadgeView_withBadgeInfo_isOverContent_contentWidth_animated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  [v2 setBadgeInfo:v5];
  [*(id *)(a1 + 32) setStyle:3];
  [*(id *)(a1 + 32) setOverContent:*(unsigned __int8 *)(a1 + 80)];
  return [*(id *)(a1 + 32) setContentWidth:*(double *)(a1 + 72)];
}

+ (CGSize)leadingBadgesSizeForAssetViewModel:(id)a3 contentWidth:(double)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 badgeInfoPromise];
  id v6 = v5;
  if (v5)
  {
    [v5 badgeInfo];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = v13;
  long long v10 = v14;
  [MEMORY[0x1E4F90008] topLeftPrimaryBadgeInfoForBadgeInfo:&v9];
  long long v9 = v11;
  long long v10 = v12;
  [MEMORY[0x1E4F90840] sizeForBadgeInfo:&v9 contentWidth:a4];
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGSize)badgeTileSizeForAssetViewModel:(id)a3 contentWidth:(double)a4
{
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [a3 badgeInfoPromise];
  id v6 = v5;
  if (v5)
  {
    [v5 badgeInfo];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }

  v9[0] = v10;
  v9[1] = v11;
  [MEMORY[0x1E4F90840] sizeForBadgeInfo:v9 contentWidth:a4];
  result.height = v8;
  result.width = v7;
  return result;
}

+ (void)_logEffectNameApplied:(id)a3 toAsset:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PUBadgeTileViewController.m", 87, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  long long v9 = (void *)[[NSString alloc] initWithFormat:@"com.apple.photos.CPAnalytics.oneUpLivePhoto%@EffectSuggestionApplied", v7];
  long long v10 = (void *)MEMORY[0x1E4F56658];
  uint64_t v13 = *MEMORY[0x1E4F56558];
  v14[0] = v8;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v10 sendEvent:v9 withPayload:v11];
}

+ (void)logToggledDepthEffect:(BOOL)a3 onAsset:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v5 = objc_opt_class();
  if (v4) {
    id v6 = @"DepthOn";
  }
  else {
    id v6 = @"DepthOff";
  }
  [v5 _logEffectNameApplied:v6 toAsset:v7];
}

+ (void)logAppliedLivePhotoEffect:(int64_t)a3 toAsset:(id)a4
{
  id v4 = a4;
  id v5 = objc_opt_class();
  PXAssetVariationTypeDescription();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 _logEffectNameApplied:v6 toAsset:v4];
}

@end