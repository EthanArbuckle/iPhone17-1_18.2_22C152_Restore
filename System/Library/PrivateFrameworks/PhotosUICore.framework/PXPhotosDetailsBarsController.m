@interface PXPhotosDetailsBarsController
- (BOOL)_dismissViewControllerIfSafeAnimated:(BOOL)a3;
- (BOOL)_shouldAddBarItemForBarItemIdentifier:(id)a3;
- (BOOL)_shouldEnableActionWithBarItemIdentifier:(id)a3;
- (BOOL)_showTitleView;
- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 dismissViewController:(id)a5 completionHandler:(id)a6;
- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 presentViewController:(id)a5;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)shouldAddActionButton;
- (BOOL)wantsActionMenu;
- (NSMutableDictionary)_barButtonItemByActionType;
- (NSMutableDictionary)_barButtonItemCacheByBarItemIdentifier;
- (PXActionPerformer)_activePerformer;
- (PXActionPerformer)_lastActionPerformer;
- (PXAssetActionManager)_assetActionManager;
- (PXAssetCollectionActionManager)_assetCollectionActionManager;
- (PXBarAppearance)_barAppearance;
- (PXBlockActionManager)blockActionManager;
- (PXExtendedTraitCollection)_extendedTraitCollection;
- (PXPhotoDetailsActionMenuController)_activeMenuController;
- (PXPhotosBarButtonItemsController)barButtonItemsController;
- (PXPhotosDataSource)_dataSource;
- (PXPhotosDetailsBarsController)init;
- (PXPhotosDetailsBarsController)initWithContext:(id)a3 viewModel:(id)a4 extendedTraitCollection:(id)a5;
- (PXPhotosDetailsContext)_context;
- (PXPhotosDetailsViewModel)_viewModel;
- (PXSectionedSelectionManager)_selectionManager;
- (UIView)_titleView;
- (id)_actionMenu;
- (id)_assetCollection;
- (id)_barButtonItemForBarItemIdentifier:(id)a3;
- (id)_barButtonItemsForBarItems:(id)a3 placement:(unint64_t)a4;
- (id)_centeredBarButtonItem;
- (id)_createActionMenuButton;
- (id)_createActionMenuController;
- (id)_flexibleSpaceBarButtonItem;
- (id)_localizedSelectionTitle;
- (id)_sourceBarButtonItemForActionType:(id)a3;
- (id)createAssetActionManager;
- (id)createAssetCollectionActionManager;
- (id)createTitleView;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)undoManagerForActionMenuController:(id)a3;
- (id)undoManagerForActionPerformer:(id)a3;
- (int64_t)_titleViewVerticalSizeClassForExtendedTraitCollection:(id)a3;
- (void)_invalidateAssetActionManager;
- (void)_invalidateAssetCollectionActionManager;
- (void)_setActivePerformer:(id)a3;
- (void)_setBarAppearance:(id)a3;
- (void)_setLastActionPerformer:(id)a3;
- (void)_setSelectionManager:(id)a3;
- (void)_setShowTitleView:(BOOL)a3;
- (void)_setupBlockActionManager;
- (void)_toggleFaceMode:(id)a3;
- (void)_updateTitleViewAlpha;
- (void)actionMenu:(id)a3 actionPerformer:(id)a4 didChangeState:(unint64_t)a5;
- (void)actionMenu:(id)a3 assetCollectionActionPerformer:(id)a4 playMovieForAssetCollection:(id)a5;
- (void)actionMenuButtonItemTapped:(id)a3;
- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4;
- (void)cancelBarButtonItemTapped:(id)a3;
- (void)doneBarButtonItemTapped:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosDataSource:(id)a3 didChange:(id)a4;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)removeActionButton;
- (void)selectBarButtonItemTapped:(id)a3;
- (void)setShouldAddActionButton:(BOOL)a3;
- (void)set_activeMenuController:(id)a3;
- (void)shouldShowTitleView:(BOOL)a3 animated:(BOOL)a4;
- (void)updateBars;
@end

@implementation PXPhotosDetailsBarsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__barButtonItemCacheByBarItemIdentifier, 0);
  objc_storeStrong((id *)&self->__barButtonItemByActionType, 0);
  objc_storeStrong((id *)&self->_barButtonItemsController, 0);
  objc_storeStrong((id *)&self->__extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->__dataSource, 0);
  objc_storeStrong((id *)&self->__context, 0);
  objc_storeStrong((id *)&self->__titleView, 0);
  objc_storeStrong((id *)&self->__activeMenuController, 0);
  objc_destroyWeak((id *)&self->__lastActionPerformer);
  objc_storeStrong((id *)&self->__activePerformer, 0);
  objc_storeStrong((id *)&self->_blockActionManager, 0);
  objc_storeStrong((id *)&self->__selectionManager, 0);
  objc_storeStrong((id *)&self->__viewModel, 0);
  objc_storeStrong((id *)&self->__barAppearance, 0);
  objc_storeStrong((id *)&self->__assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->__assetActionManager, 0);
}

- (void)setShouldAddActionButton:(BOOL)a3
{
  self->_shouldAddActionButton = a3;
}

- (BOOL)shouldAddActionButton
{
  return self->_shouldAddActionButton;
}

- (NSMutableDictionary)_barButtonItemCacheByBarItemIdentifier
{
  return self->__barButtonItemCacheByBarItemIdentifier;
}

- (NSMutableDictionary)_barButtonItemByActionType
{
  return self->__barButtonItemByActionType;
}

- (PXPhotosBarButtonItemsController)barButtonItemsController
{
  return self->_barButtonItemsController;
}

- (PXExtendedTraitCollection)_extendedTraitCollection
{
  return self->__extendedTraitCollection;
}

- (PXPhotosDataSource)_dataSource
{
  return self->__dataSource;
}

- (PXPhotosDetailsContext)_context
{
  return self->__context;
}

- (void)_setShowTitleView:(BOOL)a3
{
  self->__showTitleView = a3;
}

- (BOOL)_showTitleView
{
  return self->__showTitleView;
}

- (UIView)_titleView
{
  return self->__titleView;
}

- (void)set_activeMenuController:(id)a3
{
}

- (PXPhotoDetailsActionMenuController)_activeMenuController
{
  return self->__activeMenuController;
}

- (void)_setLastActionPerformer:(id)a3
{
}

- (PXActionPerformer)_lastActionPerformer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__lastActionPerformer);
  return (PXActionPerformer *)WeakRetained;
}

- (void)_setActivePerformer:(id)a3
{
}

- (PXActionPerformer)_activePerformer
{
  return self->__activePerformer;
}

- (PXBlockActionManager)blockActionManager
{
  return self->_blockActionManager;
}

- (PXSectionedSelectionManager)_selectionManager
{
  return self->__selectionManager;
}

- (PXPhotosDetailsViewModel)_viewModel
{
  return self->__viewModel;
}

- (void)_setBarAppearance:(id)a3
{
}

- (PXBarAppearance)_barAppearance
{
  return self->__barAppearance;
}

- (BOOL)_dismissViewControllerIfSafeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(PXBarsController *)self viewController];
  v5 = [v4 navigationController];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 visibleViewController];

    if (v7 == v4)
    {
      id v8 = (id)[v6 popViewControllerAnimated:v3];
LABEL_7:
      BOOL v10 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v9 = [v4 presentedViewController];

    if (!v9)
    {
      [v4 dismissViewControllerAnimated:v3 completion:0];
      goto LABEL_7;
    }
  }
  BOOL v10 = 0;
LABEL_8:

  return v10;
}

- (id)undoManagerForActionMenuController:(id)a3
{
  BOOL v3 = [(PXBarsController *)self viewController];
  v4 = [v3 undoManager];

  return v4;
}

- (void)actionMenu:(id)a3 assetCollectionActionPerformer:(id)a4 playMovieForAssetCollection:(id)a5
{
  id v5 = [(PXBarsController *)self viewController];
  [v5 playMovieWithCompletionHandler:&__block_literal_global_365];
}

void __103__PXPhotosDetailsBarsController_actionMenu_assetCollectionActionPerformer_playMovieForAssetCollection___block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PLMemoriesGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = @"NO";
    if (a2) {
      v4 = @"YES";
    }
    id v5 = v4;
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "Playing Memories movie with success: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)actionMenu:(id)a3 actionPerformer:(id)a4 didChangeState:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [v7 actionType];
  v9 = v8;
  if (a5 == 20)
  {
    if (([v8 isEqualToString:@"PXAssetCollectionActionTypeDeleteMemory"] & 1) != 0
      || ([v9 isEqualToString:@"PXAssetCollectionActionTypeBlockMemory"] & 1) != 0
      || ([v9 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate"] & 1) != 0
      || ([v9 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval"] & 1) != 0
      || ([v9 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeatureHoliday"] & 1) != 0
      || ([v9 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeaturePlace"] & 1) != 0
      || [v9 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeaturePerson"])
    {
      [(PXPhotosDetailsBarsController *)self _dismissViewControllerIfSafeAnimated:1];
    }
    BOOL v10 = [v7 actionType];
    int v11 = [v10 isEqualToString:@"PXAssetCollectionActionTypeCreateMemory"];

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E4F1CA80];
      v13 = [(PXPhotosDetailsBarsController *)self _viewModel];
      v14 = [v13 disabledActionTypes];
      v15 = [v12 setWithSet:v14];

      [v15 addObject:@"PXAssetCollectionActionTypeCreateMemory"];
      v16 = [(PXPhotosDetailsBarsController *)self _viewModel];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __75__PXPhotosDetailsBarsController_actionMenu_actionPerformer_didChangeState___block_invoke;
      v21[3] = &unk_1E5DC19A8;
      id v22 = v15;
      id v17 = v15;
      [v16 performChanges:v21];
    }
  }
  v18 = [(PXBarsController *)self actionPerformerDelegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    v20 = [(PXBarsController *)self actionPerformerDelegate];
    [v20 actionPerformer:v7 didChangeState:a5];
  }
}

uint64_t __75__PXPhotosDetailsBarsController_actionMenu_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisabledActionTypes:*(void *)(a1 + 32)];
}

- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 dismissViewController:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  uint64_t v8 = [(PXBarsController *)self viewController];
  v9 = [v8 presentedViewController];

  if (v9) {
    [v8 dismissViewControllerAnimated:1 completion:v7];
  }

  return v9 != 0;
}

- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 presentViewController:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(PXBarsController *)self viewController];
  if (v9)
  {
    BOOL v10 = [v8 popoverPresentationController];
    if (v10)
    {
      int v11 = [(PXPhotosDetailsBarsController *)self _barButtonItemCacheByBarItemIdentifier];
      v12 = [v11 objectForKeyedSubscript:@"PXBarItemIdentifierActionMenu"];

      if (v12) {
        [v10 setBarButtonItem:v12];
      }
      [v10 setDelegate:self];
    }
    v13 = [v7 actionType];
    int v14 = [v13 isEqualToString:@"PXAssetCollectionActionTypeFileRadar"];

    if (v14) {
      objc_msgSend(v9, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v8, 1, 0, 0);
    }
    else {
      [v9 presentViewController:v8 animated:1 completion:0];
    }
  }
  return v9 != 0;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v9 = a3;
  v4 = [v9 presentedViewController];
  id v5 = [(PXPhotosDetailsBarsController *)self _activePerformer];
  int v6 = [v5 presentedViewController];
  if (v4 == v6)
  {
    id v7 = [v5 actionType];

    if (!v7) {
      goto LABEL_5;
    }
    id v8 = [v5 actionType];
    int v6 = [(PXPhotosDetailsBarsController *)self _sourceBarButtonItemForActionType:v8];

    [v9 setBarButtonItem:v6];
  }

LABEL_5:
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  BOOL v3 = [(PXBarsController *)self viewController];
  v4 = v3;
  if (v3)
  {
    id v5 = PXPresentationEnvironmentForSender(v3);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  BOOL v3 = [(PXBarsController *)self viewController];
  v4 = [v3 undoManager];

  return v4;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = [(PXBarsController *)self viewController];
  id v8 = [v7 presentedViewController];

  if (v8) {
    [v7 dismissViewControllerAnimated:1 completion:v6];
  }

  return v8 != 0;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXBarsController *)self viewController];
  if (v8)
  {
    id v9 = [v7 popoverPresentationController];
    if (v9)
    {
      BOOL v10 = [v6 actionType];
      int v11 = [(PXPhotosDetailsBarsController *)self _sourceBarButtonItemForActionType:v10];

      if (v11) {
        [v9 setBarButtonItem:v11];
      }
      [v9 setDelegate:self];
    }
    [v8 presentViewController:v7 animated:1 completion:0];
  }
  return v8 != 0;
}

- (id)_sourceBarButtonItemForActionType:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(PXPhotosDetailsBarsController *)self _barButtonItemByActionType],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    if (([v4 isEqualToString:@"PXAssetActionTypeHide"] & 1) == 0
      && ([v4 isEqualToString:@"PXAssetActionTypeDuplicate"] & 1) == 0
      && ![v4 isEqualToString:@"PXAssetActionTypeSlideshow"]
      || ([(PXPhotosDetailsBarsController *)self _sourceBarButtonItemForActionType:@"PXAssetActionTypeShare"], (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (([v4 isEqualToString:@"PXAssetActionTypeTrash"] & 1) != 0
        || [v4 isEqualToString:@"PXAssetActionTypeRemove"])
      {
        id v6 = [(PXPhotosDetailsBarsController *)self _sourceBarButtonItemForActionType:@"PXAssetActionTypeUnifiedDestructive"];
      }
      else
      {
        id v6 = 0;
      }
    }
  }

  return v6;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  id v16 = v6;
  if (a4 == 10)
  {
    [(PXPhotosDetailsBarsController *)self _setActivePerformer:v6];
    [(PXPhotosDetailsBarsController *)self _setLastActionPerformer:v16];
  }
  else
  {
    id v7 = [(PXPhotosDetailsBarsController *)self _activePerformer];

    if (v7 == v16) {
      [(PXPhotosDetailsBarsController *)self _setActivePerformer:0];
    }
    if (a4 == 30 && [v16 success])
    {
      id v8 = [(PXPhotosDetailsBarsController *)self _lastActionPerformer];
      if (v8 == v16)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          BOOL v10 = [v16 actionType];
          char v11 = [v10 isEqual:@"PXAssetActionTypeSlideshow"];

          if ((v11 & 1) == 0)
          {
            v12 = [(PXPhotosDetailsBarsController *)self _viewModel];
            [v12 performChanges:&__block_literal_global_359];
          }
        }
      }
      else
      {
      }
    }
  }
  v13 = [(PXBarsController *)self actionPerformerDelegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [(PXBarsController *)self actionPerformerDelegate];
    [v15 actionPerformer:v16 didChangeState:a4];
  }
}

uint64_t __64__PXPhotosDetailsBarsController_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelecting:0];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXViewModelObservationContext_126675 == a5)
  {
    id v11 = v8;
    if (v6)
    {
      [(PXBarsController *)self invalidateBars];
      [(PXBarsController *)self setWantsAnimatedBarsUpdate:1];
    }
    if ((v6 & 0x1A) != 0) {
      [(PXBarsController *)self invalidateBars];
    }
    if ((v6 & 4) != 0)
    {
      id v9 = [(PXPhotosDetailsBarsController *)self _viewModel];
      BOOL v10 = [v9 selectionManager];

      [(PXPhotosDetailsBarsController *)self _setSelectionManager:v10];
      [(PXBarsController *)self invalidateBars];
    }
    goto LABEL_15;
  }
  if ((void *)PXExtendedTraitCollectionObservationContext_126676 == a5)
  {
    if ((v6 & 0xA) == 0) {
      goto LABEL_16;
    }
    id v11 = v8;
    goto LABEL_14;
  }
  if ((v6 & 1) != 0 && (void *)PXSelectionManagerObservationContext_126677 == a5)
  {
    id v11 = v8;
    [(PXPhotosDetailsBarsController *)self _invalidateAssetActionManager];
LABEL_14:
    [(PXBarsController *)self invalidateBars];
LABEL_15:
    [(PXBarsController *)self updateIfNeeded];
    id v8 = v11;
  }
LABEL_16:
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v8 = [(PXPhotosDetailsBarsController *)self _assetCollection];
  id v5 = [(PXPhotosDetailsBarsController *)self _assetCollectionActionManager];
  char v6 = [v5 assetCollectionReference];
  id v7 = [v6 assetCollection];

  if (v8 != v7)
  {
    [(PXPhotosDetailsBarsController *)self _invalidateAssetCollectionActionManager];
    [(PXBarsController *)self updateIfNeeded];
  }
}

- (void)removeActionButton
{
  [(PXPhotosDetailsBarsController *)self setShouldAddActionButton:0];
  BOOL v3 = [(PXPhotosDetailsBarsController *)self _barButtonItemCacheByBarItemIdentifier];
  id v10 = [v3 objectForKeyedSubscript:@"PXBarItemIdentifierActionMenu"];

  if (v10)
  {
    id v4 = [(PXBarsController *)self viewController];
    id v5 = [v4 navigationItem];

    char v6 = (void *)MEMORY[0x1E4F1CA48];
    id v7 = [v5 rightBarButtonItems];
    id v8 = [v6 arrayWithArray:v7];

    [v8 removeObject:v10];
    [v5 setRightBarButtonItems:v8];
    id v9 = [(PXPhotosDetailsBarsController *)self _barButtonItemCacheByBarItemIdentifier];
    [v9 removeObjectForKey:@"PXBarItemIdentifierActionMenu"];
  }
}

- (void)_setupBlockActionManager
{
  objc_initWeak(location, self);
  BOOL v3 = [(PXPhotosDetailsBarsController *)self _context];
  id v4 = [v3 people];

  id v5 = [PXBlockActionConfiguration alloc];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke;
  v24[3] = &unk_1E5DBCB58;
  objc_copyWeak(&v25, location);
  char v6 = [(PXBlockActionConfiguration *)v5 initWithBlock:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_2;
  v22[3] = &unk_1E5DBCB80;
  objc_copyWeak(&v23, location);
  [(PXBlockActionConfiguration *)v6 setCanPerformBlock:v22];
  id v7 = PXLocalizedStringForPeople(v4, @"PXPhotosDetailsMenuFaceModeAction");
  [(PXBlockActionConfiguration *)v6 setActionName:v7];

  id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"face.smiling"];
  [(PXBlockActionConfiguration *)v6 setImage:v8];

  id v9 = [(PXPhotosDetailsBarsController *)self blockActionManager];
  [v9 registerActionWithConfiguration:v6 forType:@"PXPhotosDetailsShowFaceAction"];

  id v10 = [PXBlockActionConfiguration alloc];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_3;
  v20[3] = &unk_1E5DBCB58;
  objc_copyWeak(&v21, location);
  id v11 = [(PXBlockActionConfiguration *)v10 initWithBlock:v20];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_4;
  v18 = &unk_1E5DBCB80;
  objc_copyWeak(&v19, location);
  [(PXBlockActionConfiguration *)v11 setCanPerformBlock:&v15];
  v12 = PXLocalizedStringForPeople(v4, @"PXPhotosDetailsMenuFaceModeAction");
  -[PXBlockActionConfiguration setActionName:](v11, "setActionName:", v12, v15, v16, v17, v18);

  v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"face.smiling"];
  [(PXBlockActionConfiguration *)v11 setImage:v13];

  [(PXBlockActionConfiguration *)v11 setSelected:1];
  char v14 = [(PXPhotosDetailsBarsController *)self blockActionManager];
  [v14 registerActionWithConfiguration:v11 forType:@"PXPhotosDetailsShowAssetAction"];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(location);
}

uint64_t __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  char v6 = [v4 sender];

  [WeakRetained _toggleFaceMode:v6];
  return 1;
}

uint64_t __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _viewModel];
  uint64_t v3 = [v2 isFaceModeEnabled] ^ 1;

  return v3;
}

uint64_t __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  char v6 = [v4 sender];

  [WeakRetained _toggleFaceMode:v6];
  return 1;
}

uint64_t __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _viewModel];
  uint64_t v3 = [v2 isFaceModeEnabled];

  return v3;
}

- (id)_actionMenu
{
  v2 = [(PXPhotosDetailsBarsController *)self _createActionMenuController];
  uint64_t v3 = [v2 actions];
  id v4 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 children:v3];

  return v4;
}

- (id)_createActionMenuController
{
  uint64_t v3 = [PXPhotoDetailsActionMenuController alloc];
  id v4 = [(PXPhotosDetailsBarsController *)self _selectionManager];
  id v5 = [(PXPhotosDetailsBarsController *)self _context];
  char v6 = [v5 displayTitleInfo];
  id v7 = [(PXPhotosDetailsBarsController *)self blockActionManager];
  id v8 = [(PXPhotoDetailsActionMenuController *)v3 initWithSelectionManager:v4 displayTitleInfo:v6 blockActionManager:v7];

  id v9 = [(PXPhotosDetailsBarsController *)self _context];
  id v10 = [v9 people];
  [(PXPhotoDetailsActionMenuController *)v8 setPeople:v10];

  id v11 = [(PXPhotosDetailsBarsController *)self _viewModel];
  v12 = [v11 disabledActionTypes];
  [(PXActionMenuController *)v8 setDisabledActionTypes:v12];

  v13 = [(PXPhotosDetailsBarsController *)self _dataSource];
  if (+[PXPhotosDetailsHeaderTileWidget canShowMovieHeaderForDataSource:v13])
  {
    [(PXActionMenuController *)v8 setExcludedActionTypes:0];
  }
  else
  {
    char v14 = [MEMORY[0x1E4F1CAD0] setWithObject:@"PXAssetCollectionActionTypePlayMovie"];
    [(PXActionMenuController *)v8 setExcludedActionTypes:v14];
  }
  [(PXPhotoDetailsActionMenuController *)v8 setDelegate:self];
  [(PXPhotosDetailsBarsController *)self set_activeMenuController:v8];
  return v8;
}

- (void)actionMenuButtonItemTapped:(id)a3
{
  id v5 = a3;
  char v6 = [(PXPhotosDetailsBarsController *)self _selectionManager];
  id v7 = [v6 dataSourceManager];
  id v8 = [v7 dataSource];

  if (![v8 numberOfSections]) {
    PXAssertGetLog();
  }
  if (![(PXPhotosDetailsBarsController *)self wantsActionMenu])
  {
    id v11 = [(PXPhotosDetailsBarsController *)self _createActionMenuController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsBarsController.m" lineNumber:608 description:@"Only support PXAssetsDataSource"];
    }
    if ([v8 numberOfSections] != 1) {
      PXAssertGetLog();
    }
    uint64_t v62 = [v8 identifier];
    long long v63 = xmmword_1AB359AA0;
    uint64_t v64 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v12 = [v8 assetCollectionAtSectionIndexPath:&v62];
    v13 = [(PXBarsController *)self viewController];
    uint64_t v14 = objc_msgSend(v13, "px_sharePresentation");

    v61 = (void *)v14;
    if (!v14)
    {
      v47 = [MEMORY[0x1E4F28B00] currentHandler];
      [v47 handleFailureInMethod:a2, self, @"PXPhotosDetailsBarsController.m", 613, @"Invalid parameter not satisfying: %@", @"sharePresentation" object file lineNumber description];
    }
    v59 = (void *)v12;
    uint64_t v15 = [[PXActivitySharingContext alloc] initWithAssetCollection:v12 assetsDataSource:v8];
    v60 = v11;
    uint64_t v16 = [v11 activityActions];
    [(PXActivitySharingContext *)v15 setActivities:v16];

    [(PXActivitySharingContext *)v15 setWantsActionSheet:1];
    id v17 = [(PXPhotosDetailsBarsController *)self _context];
    v18 = [v17 localizedTitle];

    id v19 = [(PXPhotosDetailsBarsController *)self _context];
    uint64_t v20 = [v19 people];
    if (v20)
    {
      id v21 = (void *)v20;
      uint64_t v22 = [v18 length];

      if (!v22)
      {
        uint64_t v23 = PXLocalizedStringFromTable(@"PXActionSheetMissingPeopleNameTitle", @"PhotosUICore");
        goto LABEL_18;
      }
    }
    else
    {
    }
    v24 = [off_1E5DA7230 defaultHelper];
    uint64_t v23 = [v24 displayableTextForTitle:v18 intent:1];

    v18 = v24;
LABEL_18:

    [(PXActivitySharingContext *)v15 setTitle:v23];
    id v25 = [(PXPhotosDetailsBarsController *)self _context];
    v26 = [v25 localizedSubtitle];
    [(PXActivitySharingContext *)v15 setSubtitle:v26];

    v27 = [(PXBarsController *)self viewController];
    v28 = [v27 presentedKeyAsset];
    if (v28)
    {
      [(PXActivitySharingContext *)v15 setKeyAsset:v28];
    }
    else
    {
      v29 = [v8 keyAsset];
      [(PXActivitySharingContext *)v15 setKeyAsset:v29];
    }
    v30 = [(PXPhotosDetailsBarsController *)self _context];
    v31 = [v30 people];

    if ([v31 count] == 1)
    {
      v32 = [v31 firstObject];
      [(PXActivitySharingContext *)v15 setPerson:v32];
    }
    id v58 = v5;
    v33 = [(PXPhotosDetailsBarsController *)self _context];
    -[PXActivitySharingContext setSourceOrigin:](v15, "setSourceOrigin:", [v33 viewSourceOrigin]);

    v34 = [v61 createActivitySharingControllerWithContext:v15];
    if (!v34)
    {
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      [v48 handleFailureInMethod:a2, self, @"PXPhotosDetailsBarsController.m", 634, @"Invalid parameter not satisfying: %@", @"activitySharingController" object file lineNumber description];
    }
    v35 = (void *)v23;
    v36 = [v34 activityViewController];
    if (v36)
    {
      SEL v37 = a2;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_27:
        v38 = [(PXBarsController *)self viewController];
        [v38 presentViewController:v36 animated:1 completion:0];

        id v5 = v58;
        goto LABEL_28;
      }
      v57 = [MEMORY[0x1E4F28B00] currentHandler];
      v54 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v54);
      v56 = objc_msgSend(v36, "px_descriptionForAssertionMessage");
      SEL v55 = v37;
      v49 = v57;
      [v57 handleFailureInMethod:v55, self, @"PXPhotosDetailsBarsController.m", 635, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController.activityViewController", v53, v56 object file lineNumber description];
    }
    else
    {
      v49 = [MEMORY[0x1E4F28B00] currentHandler];
      v50 = (objc_class *)objc_opt_class();
      uint64_t v51 = NSStringFromClass(v50);
      SEL v52 = a2;
      v53 = (void *)v51;
      [v49 handleFailureInMethod:v52, self, @"PXPhotosDetailsBarsController.m", 635, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController.activityViewController", v51 object file lineNumber description];
    }

    goto LABEL_27;
  }
  id v9 = v5;
  if (!v9)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    v40 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v40);
    [v39 handleFailureInMethod:a2, self, @"PXPhotosDetailsBarsController.m", 600, @"%@ should be an instance inheriting from %@, but it is nil", @"sender", v41 object file lineNumber description];
LABEL_31:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    v42 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v42);
    uint64_t v43 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    SEL v44 = a2;
    v45 = (void *)v43;
    [v39 handleFailureInMethod:v44, self, @"PXPhotosDetailsBarsController.m", 600, @"%@ should be an instance inheriting from %@, but it is %@", @"sender", v41, v43 object file lineNumber description];

    goto LABEL_31;
  }
LABEL_5:
  id v10 = [(PXPhotosDetailsBarsController *)self _actionMenu];
  [v9 setMenu:v10];

LABEL_28:
}

- (void)_toggleFaceMode:(id)a3
{
  id v3 = [(PXPhotosDetailsBarsController *)self _viewModel];
  if (([v3 isFaceModeEnabled] & 1) == 0) {
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.detailView.showFaces" withPayload:MEMORY[0x1E4F1CC08]];
  }
  [v3 performChanges:&__block_literal_global_315_126736];
}

void __49__PXPhotosDetailsBarsController__toggleFaceMode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setFaceModeEnabled:", objc_msgSend(v2, "isFaceModeEnabled") ^ 1);
}

- (void)doneBarButtonItemTapped:(id)a3
{
  id v3 = [(PXBarsController *)self viewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)cancelBarButtonItemTapped:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __59__PXPhotosDetailsBarsController_cancelBarButtonItemTapped___block_invoke;
  id v11 = &unk_1E5DD32D0;
  objc_copyWeak(&v12, &location);
  id v5 = (void (**)(void))_Block_copy(&v8);
  char v6 = [(PXPhotosDetailsBarsController *)self _activePerformer];
  id v7 = v6;
  if (v6)
  {
    if ([v6 isCancellable]) {
      [v7 cancelActionWithCompletionHandler:v5];
    }
  }
  else
  {
    v5[2](v5);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __59__PXPhotosDetailsBarsController_cancelBarButtonItemTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _viewModel];
  [v1 performChanges:&__block_literal_global_309_126740];
}

uint64_t __59__PXPhotosDetailsBarsController_cancelBarButtonItemTapped___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSelecting:0];
}

- (void)selectBarButtonItemTapped:(id)a3
{
  id v3 = [(PXPhotosDetailsBarsController *)self _viewModel];
  [v3 performChanges:&__block_literal_global_126742];
}

uint64_t __59__PXPhotosDetailsBarsController_selectBarButtonItemTapped___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelecting:1];
}

- (void)updateBars
{
  v59[10] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXPhotosDetailsBarsController *)self _titleView];

  if (!v3)
  {
    id v4 = [(PXPhotosDetailsBarsController *)self createTitleView];
    titleView = self->__titleView;
    self->__titleView = v4;
  }
  [(PXPhotosDetailsBarsController *)self _updateTitleViewAlpha];
  char v6 = [(PXPhotosDetailsBarsController *)self _barButtonItemByActionType];
  [v6 removeAllObjects];

  id v7 = [(PXBarsController *)self viewController];
  uint64_t v8 = objc_msgSend(v7, "px_barAppearance");
  [(PXPhotosDetailsBarsController *)self _setBarAppearance:v8];

  v59[0] = @"PXBarItemIdentifierActionMenu";
  v59[1] = @"PXBarItemIdentifierSelect";
  v59[2] = @"PXBarItemIdentifierShare";
  v59[3] = @"PXBarItemIdentifierSelectModeMenu";
  v59[4] = @"PXBarItemIdentifierTrash";
  v59[5] = @"PXBarItemIdentifierDone";
  v59[6] = @"PXBarItemIdentifierCancel";
  v59[7] = @"PXBarItemIdentifierFaceMode";
  v59[8] = @"PXBarItemIdentifierAssetMode";
  v59[9] = @"PXBarItemIdentifierInterButtonSpacing";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:10];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        if ([(PXPhotosDetailsBarsController *)self _shouldAddBarItemForBarItemIdentifier:v16])
        {
          id v17 = [[_PXPhotosDetailsBarItem alloc] initWithIdentifier:v16];
          [v10 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v13);
  }

  v18 = [(PXBarsController *)self barSpec];
  id v19 = [v18 sortedBarItemsByPlacement:v10];

  uint64_t v20 = [v7 navigationItem];
  id v21 = [(PXPhotosDetailsBarsController *)self _viewModel];
  int v22 = [v21 isSelecting];

  if (v22)
  {
    uint64_t v23 = [(PXPhotosDetailsBarsController *)self _localizedSelectionTitle];
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = [(PXPhotosDetailsBarsController *)self _titleView];
    v46 = objc_msgSend(v7, "px_extendedTraitCollection");
    int64_t v25 = [(PXPhotosDetailsBarsController *)self _titleViewVerticalSizeClassForExtendedTraitCollection:v46];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v26 = (void *)v24;
    }
    else {
      v26 = 0;
    }
    id v27 = v26;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __43__PXPhotosDetailsBarsController_updateBars__block_invoke;
    v50[3] = &unk_1E5DD0D90;
    id v51 = v27;
    id v52 = v7;
    int64_t v53 = v25;
    id v28 = v27;
    [v28 performChanges:v50];

    uint64_t v23 = 0;
  }
  objc_msgSend(v20, "setTitle:", v23, v23);
  SEL v44 = (void *)v24;
  [v20 setTitleView:v24];
  BOOL v29 = [(PXBarsController *)self wantsAnimatedBarsUpdate];
  objc_msgSend(v20, "px_setBackButtonDisplayMode:", 2);
  v47 = v7;
  v30 = [v7 title];
  [v20 setBackButtonTitle:v30];

  v31 = [v19 objectForKeyedSubscript:&unk_1F02D81A0];
  v32 = [(PXPhotosDetailsBarsController *)self _barButtonItemsForBarItems:v31 placement:2];
  [v20 setLeftBarButtonItems:v32 animated:v29];

  v33 = [v19 objectForKeyedSubscript:&unk_1F02D81B8];
  v34 = [(PXPhotosDetailsBarsController *)self _barButtonItemsForBarItems:v33 placement:3];
  [v20 setRightBarButtonItems:v34 animated:v29];

  v35 = [(PXPhotosDetailsBarsController *)self _viewModel];
  uint64_t v36 = [v35 isSelecting];

  [v20 setHidesBackButton:v36 animated:0];
  v45 = v19;
  SEL v37 = [v19 objectForKeyedSubscript:&unk_1F02D81D0];
  v38 = [(PXBarsController *)self viewController];
  v39 = [(PXPhotosDetailsBarsController *)self _barButtonItemsForBarItems:v37 placement:4];
  [v38 setToolbarItems:v39];

  v40 = [(PXPhotosDetailsBarsController *)self _barAppearance];
  if (v29) {
    v41 = [[PXBarAnimationOptions alloc] initWithType:1];
  }
  else {
    v41 = 0;
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __43__PXPhotosDetailsBarsController_updateBars__block_invoke_305;
  v48[3] = &unk_1E5DBCB30;
  id v49 = v37;
  id v42 = v37;
  [v40 performChangesWithAnimationOptions:v41 changes:v48];
}

uint64_t __43__PXPhotosDetailsBarsController_updateBars__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) title];
  [v2 setTitle:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(*(id *)(a1 + 40), "px_subtitle");
  [v4 setSubtitle:v5];

  char v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  return [v6 setVerticalSizeClass:v7];
}

void __43__PXPhotosDetailsBarsController_updateBars__block_invoke_305(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setPrefersStatusBarVisible:1];
  [v5 setPrefersNavigationBarVisible:1];
  uint64_t v3 = [*(id *)(a1 + 32) count];
  BOOL v4 = v3 == 0;
  [v5 setPrefersToolbarVisible:v3 != 0];
  [v5 setPrefersTabBarVisible:v4];
}

- (BOOL)wantsActionMenu
{
  return 0;
}

- (void)_updateTitleViewAlpha
{
  if ([(PXPhotosDetailsBarsController *)self _showTitleView]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [(PXPhotosDetailsBarsController *)self _titleView];
  if ([v4 conformsToProtocol:&unk_1F037C780]) {
    [v4 setSubviewsAlpha:v3];
  }
  else {
    [v4 setAlpha:v3];
  }
}

- (void)shouldShowTitleView:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__showTitleView != a3)
  {
    BOOL v4 = a4;
    -[PXPhotosDetailsBarsController _setShowTitleView:](self, "_setShowTitleView:");
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __62__PXPhotosDetailsBarsController_shouldShowTitleView_animated___block_invoke;
      v6[3] = &unk_1E5DD36F8;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.25];
    }
    else
    {
      [(PXPhotosDetailsBarsController *)self _updateTitleViewAlpha];
    }
  }
}

uint64_t __62__PXPhotosDetailsBarsController_shouldShowTitleView_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTitleViewAlpha];
}

- (id)createAssetCollectionActionManager
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v3 = [(PXPhotosDetailsBarsController *)self _assetCollection];
  if (v3)
  {
    BOOL v4 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:v3 displayTitleInfo:0];
  }
  else
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = [(PXPhotosDetailsBarsController *)self _dataSource];
      uint64_t v7 = [v6 collectionListFetchResult];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected number of asset collections: %@", (uint8_t *)&v9, 0xCu);
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (id)createAssetActionManager
{
  id v2 = [(PXPhotosDetailsBarsController *)self _selectionManager];
  double v3 = [[PXPhotoKitAssetActionManager alloc] initWithSelectionManager:v2];

  return v3;
}

- (id)createTitleView
{
  id v2 = [PXNavigationTitleView alloc];
  double v3 = -[PXNavigationTitleView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v3;
}

- (BOOL)_shouldEnableActionWithBarItemIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"PXBarItemIdentifierShare"])
  {
    id v5 = PXAssetActionTypeShare;
  }
  else if ([v4 isEqualToString:@"PXBarItemIdentifierSelectModeMenu"])
  {
    id v5 = &PXAssetActionTypeShowActionsMenu;
  }
  else
  {
    if (![v4 isEqualToString:@"PXBarItemIdentifierTrash"])
    {
      char v7 = 1;
      goto LABEL_8;
    }
    id v5 = PXAssetActionTypeUnifiedDestructive;
  }
  char v6 = [(PXPhotosDetailsBarsController *)self _assetActionManager];
  char v7 = [v6 canPerformActionType:*v5];

LABEL_8:
  return v7;
}

- (BOOL)_shouldAddBarItemForBarItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDetailsBarsController *)self _viewModel];
  if ([v5 isSelecting])
  {
    if (([v4 isEqualToString:@"PXBarItemIdentifierShare"] & 1) != 0
      || ([v4 isEqualToString:@"PXBarItemIdentifierSelectModeMenu"] & 1) != 0
      || ([v4 isEqualToString:@"PXBarItemIdentifierTrash"] & 1) != 0)
    {
      goto LABEL_5;
    }
    if ([v4 isEqualToString:@"PXBarItemIdentifierFaceMode"])
    {
      if ([v5 supportsFaceMode])
      {
        int v6 = [v5 isFaceModeEnabled] ^ 1;
        goto LABEL_11;
      }
      goto LABEL_22;
    }
    if ([v4 isEqualToString:@"PXBarItemIdentifierAssetMode"])
    {
      if (![v5 supportsFaceMode]) {
        goto LABEL_22;
      }
      char v8 = [v5 isFaceModeEnabled];
    }
    else
    {
      if ([v4 isEqualToString:@"PXBarItemIdentifierCancel"])
      {
LABEL_5:
        LOBYTE(v6) = 1;
        goto LABEL_11;
      }
      if (![v4 isEqualToString:@"PXBarItemIdentifierInterButtonSpacing"])
      {
LABEL_22:
        LOBYTE(v6) = 0;
        goto LABEL_11;
      }
      char v8 = [v5 supportsFaceMode];
    }
    LOBYTE(v6) = v8;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"PXBarItemIdentifierDone"]) {
    int v6 = 1;
  }
  else {
    int v6 = [v4 isEqualToString:@"PXBarItemIdentifierSelect"];
  }
  if ([v4 isEqualToString:@"PXBarItemIdentifierActionMenu"]) {
    v6 |= [(PXPhotosDetailsBarsController *)self shouldAddActionButton];
  }
LABEL_11:

  return v6;
}

- (id)_createActionMenuButton
{
  BOOL v3 = [(PXPhotosDetailsBarsController *)self wantsActionMenu];
  id v4 = [(PXPhotosDetailsBarsController *)self barButtonItemsController];
  id v5 = v4;
  int v6 = sel_actionMenuButtonItemTapped_;
  if (v3)
  {
    char v7 = 0;
  }
  else
  {
    char v7 = sel_actionMenuButtonItemTapped_;
    int v6 = 0;
  }
  char v8 = [v4 createBarButtonItemWithSystemItem:1 target:self action:v7 menuAction:v6];

  return v8;
}

- (id)_barButtonItemForBarItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDetailsBarsController *)self _barButtonItemCacheByBarItemIdentifier];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if ([v4 isEqualToString:@"PXBarItemIdentifierShare"])
  {
    char v7 = PXAssetActionTypeShare;
  }
  else
  {
    if (![v4 isEqualToString:@"PXBarItemIdentifierTrash"])
    {
      if (v6)
      {
        int v9 = 0;
        id v10 = (void *)v6;
        goto LABEL_25;
      }
      goto LABEL_14;
    }
    char v7 = PXAssetActionTypeUnifiedDestructive;
  }
  char v8 = *v7;
  int v9 = v8;
  id v10 = (void *)v6;
  if (v6)
  {
LABEL_8:
    if (v9)
    {
      uint64_t v12 = [(PXPhotosDetailsBarsController *)self _barButtonItemByActionType];
      [v12 setObject:v10 forKeyedSubscript:v9];
    }
LABEL_10:
    if (v6) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v8)
  {
    uint64_t v11 = [(PXPhotosDetailsBarsController *)self _assetActionManager];
    id v10 = [v11 barButtonItemForActionType:v9];

    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
LABEL_14:
  if (![v4 isEqualToString:@"PXBarItemIdentifierSelect"])
  {
    if ([v4 isEqualToString:@"PXBarItemIdentifierDone"])
    {
      uint64_t v13 = [(PXPhotosDetailsBarsController *)self barButtonItemsController];
      uint64_t v14 = PXLocalizedStringFromTable(@"PXPhotosDetailsBarDoneButton", @"PhotosUICore");
      uint64_t v15 = sel_doneBarButtonItemTapped_;
      goto LABEL_20;
    }
    if ([v4 isEqualToString:@"PXBarItemIdentifierCancel"])
    {
      uint64_t v13 = [(PXPhotosDetailsBarsController *)self barButtonItemsController];
      uint64_t v14 = PXLocalizedStringFromTable(@"PXPhotosDetailsBarCancelButton", @"PhotosUICore");
      uint64_t v15 = sel_cancelBarButtonItemTapped_;
      goto LABEL_20;
    }
    if ([v4 isEqualToString:@"PXBarItemIdentifierFaceMode"])
    {
      id v18 = objc_alloc(MEMORY[0x1E4FB14A8]);
      uint64_t v13 = [(PXPhotosDetailsBarsController *)self _context];
      uint64_t v14 = [v13 people];
      id v19 = PXLocalizedStringForPeople(v14, @"PXPhotosDetailsBarFaceModeButton");
      uint64_t v20 = [v18 initWithTitle:v19 style:0 target:self action:sel__toggleFaceMode_];
LABEL_30:
      id v10 = (void *)v20;

      goto LABEL_21;
    }
    if ([v4 isEqualToString:@"PXBarItemIdentifierAssetMode"])
    {
      id v21 = objc_alloc(MEMORY[0x1E4FB14A8]);
      uint64_t v13 = PXLocalizedStringFromTable(@"PXPhotosDetailsBarAssetModeButton", @"PhotosUICore");
      id v10 = (void *)[v21 initWithTitle:v13 style:0 target:self action:sel__toggleFaceMode_];
      goto LABEL_22;
    }
    if ([v4 isEqualToString:@"PXBarItemIdentifierActionMenu"])
    {
      uint64_t v22 = [(PXPhotosDetailsBarsController *)self _createActionMenuButton];
    }
    else
    {
      if ([v4 isEqualToString:@"PXBarItemIdentifierSelectModeMenu"])
      {
        uint64_t v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle"];
        uint64_t v23 = [(PXBarsController *)self delegate];
        uint64_t v14 = [v23 barsControllerActionsForSelectionContextMenu:self];

        id v19 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 children:v14];
        uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v13 menu:v19];
        goto LABEL_30;
      }
      if (![v4 isEqualToString:@"PXBarItemIdentifierInterButtonSpacing"])
      {
        int v9 = 0;
        id v10 = 0;
        goto LABEL_24;
      }
      uint64_t v22 = [MEMORY[0x1E4FB14A8] fixedSpaceItemOfWidth:8.0];
    }
    id v10 = (void *)v22;
    goto LABEL_23;
  }
  uint64_t v13 = [(PXPhotosDetailsBarsController *)self barButtonItemsController];
  uint64_t v14 = PXLocalizedStringFromTable(@"PXPhotosDetailsBarSelectButton", @"PhotosUICore");
  uint64_t v15 = sel_selectBarButtonItemTapped_;
LABEL_20:
  id v10 = [v13 createBarButtonItemWithTitle:v14 target:self action:v15 menuAction:0];
LABEL_21:

LABEL_22:
LABEL_23:
  int v9 = 0;
LABEL_24:
  uint64_t v16 = [(PXPhotosDetailsBarsController *)self _barButtonItemCacheByBarItemIdentifier];
  [v16 setObject:v10 forKeyedSubscript:v4];

LABEL_25:
  return v10;
}

- (id)_flexibleSpaceBarButtonItem
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  return v2;
}

- (id)_barButtonItemsForBarItems:(id)a3 placement:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    if ([v7 count] == 1)
    {
      int v9 = [v7 objectAtIndexedSubscript:0];
      id v10 = [v9 identifier];
      uint64_t v11 = [(PXPhotosDetailsBarsController *)self _barButtonItemForBarItemIdentifier:v10];

      if (!v11) {
        PXAssertGetLog();
      }
      uint64_t v12 = [v9 identifier];
      BOOL v13 = [(PXPhotosDetailsBarsController *)self _shouldEnableActionWithBarItemIdentifier:v12];

      [v11 setEnabled:v13];
      [v8 addObject:v11];
      if (a4 == 4)
      {
        uint64_t v14 = [(PXPhotosDetailsBarsController *)self _flexibleSpaceBarButtonItem];
        [v8 insertObject:v14 atIndex:0];

        uint64_t v15 = [(PXPhotosDetailsBarsController *)self _flexibleSpaceBarButtonItem];
        [v8 addObject:v15];
      }
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__PXPhotosDetailsBarsController__barButtonItemsForBarItems_placement___block_invoke;
      v17[3] = &unk_1E5DBCB00;
      v17[4] = self;
      unint64_t v20 = a4;
      id v8 = v8;
      id v18 = v8;
      id v19 = v7;
      SEL v21 = a2;
      [v19 enumerateObjectsUsingBlock:v17];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __70__PXPhotosDetailsBarsController__barButtonItemsForBarItems_placement___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [v5 identifier];
  id v8 = [v6 _barButtonItemForBarItemIdentifier:v7];

  if (!v8) {
    PXAssertGetLog();
  }
  int v9 = *(void **)(a1 + 32);
  id v10 = [v5 identifier];
  uint64_t v11 = [v9 _shouldEnableActionWithBarItemIdentifier:v10];

  [v8 setEnabled:v11];
  uint64_t v12 = [*(id *)(a1 + 32) _flexibleSpaceBarButtonItem];
  BOOL v13 = [*(id *)(a1 + 32) _centeredBarButtonItem];
  int v14 = [v8 isEqual:v13];

  if (v14)
  {
    if (*(void *)(a1 + 56) == 4) {
      [*(id *)(a1 + 40) addObject:v12];
    }
    uint64_t v15 = (id *)(a1 + 40);
    [*(id *)(a1 + 40) addObject:v8];
    uint64_t v16 = *(void **)(a1 + 48);
  }
  else
  {
    uint64_t v15 = (id *)(a1 + 40);
    [*(id *)(a1 + 40) addObject:v8];
    id v17 = [*(id *)(a1 + 32) _centeredBarButtonItem];

    if (v17) {
      goto LABEL_12;
    }
    uint64_t v16 = *(void **)(a1 + 48);
  }
  if ([v16 count] - 1 != a3 && *(void *)(a1 + 56) == 4) {
    [*v15 addObject:v12];
  }
LABEL_12:
}

- (id)_centeredBarButtonItem
{
  BOOL v3 = [(PXPhotosDetailsBarsController *)self _viewModel];
  if ([v3 supportsFaceMode] && !objc_msgSend(v3, "isFaceModeEnabled"))
  {
    id v4 = PXBarItemIdentifierFaceMode;
  }
  else
  {
    if (![v3 supportsFaceMode] || !objc_msgSend(v3, "isFaceModeEnabled"))
    {
      id v5 = 0;
      goto LABEL_9;
    }
    id v4 = &PXBarItemIdentifierAssetMode;
  }
  id v5 = [(PXPhotosDetailsBarsController *)self _barButtonItemForBarItemIdentifier:*v4];
LABEL_9:

  return v5;
}

- (id)_localizedSelectionTitle
{
  id v2 = [(PXPhotosDetailsBarsController *)self _viewModel];
  BOOL v3 = [v2 selectionManager];
  id v4 = [v3 selectionSnapshot];

  id v5 = [v4 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 dataSource];
    id v7 = [v6 photosDataSource];
  }
  else
  {
    id v7 = 0;
  }

  id v8 = [v4 selectedIndexPaths];
  int v9 = v8;
  if (v7 && [v8 count] >= 1)
  {
    id v10 = [v7 assetsAtIndexPaths:v9];
    PXLocalizedSelectionMessageForAssets(v10);
  }
  uint64_t v11 = PXLocalizedStringFromTable(@"PXPhotosDetailsBarSelectItemsTitle", @"PhotosUICore");

  return v11;
}

- (int64_t)_titleViewVerticalSizeClassForExtendedTraitCollection:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 layoutSizeClass] == 1 && objc_msgSend(v3, "layoutOrientation") == 2;

  return v4;
}

- (void)_setSelectionManager:(id)a3
{
  id v5 = (PXSectionedSelectionManager *)a3;
  selectionManager = self->__selectionManager;
  if (selectionManager != v5)
  {
    id v7 = v5;
    if (selectionManager) {
      [(PXSectionedSelectionManager *)selectionManager unregisterChangeObserver:self context:PXSelectionManagerObservationContext_126677];
    }
    objc_storeStrong((id *)&self->__selectionManager, a3);
    [(PXSectionedSelectionManager *)v7 registerChangeObserver:self context:PXSelectionManagerObservationContext_126677];
    id v5 = v7;
  }
}

- (PXAssetActionManager)_assetActionManager
{
  if (self->_needsUpdateFlags.assetActionManager)
  {
    self->_needsUpdateFlags.assetActionManager = 0;
    id v3 = [(PXPhotosDetailsBarsController *)self createAssetActionManager];
    assetActionManager = self->__assetActionManager;
    self->__assetActionManager = v3;

    [(PXActionManager *)self->__assetActionManager setPerformerDelegate:self];
  }
  id v5 = self->__assetActionManager;
  return v5;
}

- (void)_invalidateAssetActionManager
{
  self->_needsUpdateFlags.assetActionManager = 1;
  id v3 = [(PXPhotosDetailsBarsController *)self _barButtonItemCacheByBarItemIdentifier];
  [v3 removeAllObjects];

  [(PXBarsController *)self invalidateBars];
}

- (PXAssetCollectionActionManager)_assetCollectionActionManager
{
  if (self->_needsUpdateFlags.assetCollectionActionManager)
  {
    self->_needsUpdateFlags.assetCollectionActionManager = 0;
    id v3 = [(PXPhotosDetailsBarsController *)self createAssetCollectionActionManager];
    assetCollectionActionManager = self->__assetCollectionActionManager;
    self->__assetCollectionActionManager = v3;

    [(PXActionManager *)self->__assetCollectionActionManager setPerformerDelegate:self];
  }
  id v5 = self->__assetCollectionActionManager;
  return v5;
}

- (void)_invalidateAssetCollectionActionManager
{
  self->_needsUpdateFlags.assetCollectionActionManager = 1;
  [(PXBarsController *)self invalidateBars];
}

- (id)_assetCollection
{
  id v2 = [(PXPhotosDetailsBarsController *)self _dataSource];
  id v3 = [v2 collectionListFetchResult];
  int64_t v4 = [v3 firstObject];

  return v4;
}

- (PXPhotosDetailsBarsController)initWithContext:(id)a3 viewModel:(id)a4 extendedTraitCollection:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PXPhotosDetailsBarsController.m", 113, @"Invalid parameter not satisfying: %@", @"photosDetailsContext" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)PXPhotosDetailsBarsController;
  BOOL v13 = [(PXBarsController *)&v27 init];
  int v14 = v13;
  if (v13)
  {
    v13->_needsUpdateFlags = ($CAE9C588B8E9E3AD77CEC3411B0007B6)257;
    objc_storeStrong((id *)&v13->__context, a3);
    uint64_t v15 = [v10 photosDataSource];
    dataSource = v14->__dataSource;
    v14->__dataSource = (PXPhotosDataSource *)v15;

    [(PXPhotosDataSource *)v14->__dataSource registerChangeObserver:v14];
    objc_storeStrong((id *)&v14->__extendedTraitCollection, a5);
    [(PXExtendedTraitCollection *)v14->__extendedTraitCollection registerChangeObserver:v14 context:PXExtendedTraitCollectionObservationContext_126676];
    objc_storeStrong((id *)&v14->__viewModel, a4);
    [(PXPhotosDetailsViewModel *)v14->__viewModel registerChangeObserver:v14 context:PXViewModelObservationContext_126675];
    id v17 = [[PXPhotosBarButtonItemsController alloc] initWithExtendedTraitCollection:v12 viewModel:0];
    barButtonItemsController = v14->_barButtonItemsController;
    v14->_barButtonItemsController = v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    barButtonItemByActionType = v14->__barButtonItemByActionType;
    v14->__barButtonItemByActionType = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    barButtonItemCacheByBarItemIdentifier = v14->__barButtonItemCacheByBarItemIdentifier;
    v14->__barButtonItemCacheByBarItemIdentifier = (NSMutableDictionary *)v21;

    v14->_shouldAddActionButton = 1;
    uint64_t v23 = objc_alloc_init(PXBlockActionManager);
    blockActionManager = v14->_blockActionManager;
    v14->_blockActionManager = v23;

    [(PXPhotosDetailsBarsController *)v14 _setupBlockActionManager];
    [(PXPhotosDetailsBarsController *)v14 _setShowTitleView:1];
  }

  return v14;
}

- (PXPhotosDetailsBarsController)init
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosDetailsBarsController.m", 109, @"%s is not available as initializer", "-[PXPhotosDetailsBarsController init]");

  abort();
}

@end