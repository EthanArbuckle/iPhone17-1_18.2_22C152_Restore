@interface PXCuratedLibraryBarsController
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (PXActionPerformer)activeActionPerformer;
- (PXActionPerformer)lastActionPerformer;
- (PXBarAppearance)barAppearance;
- (PXBarsControllerDelegate)delegate;
- (PXCuratedLibraryBarsController)init;
- (PXCuratedLibraryBarsController)initWithCuratedLibraryViewController:(id)a3 viewModel:(id)a4;
- (PXCuratedLibraryViewModel)viewModel;
- (UIButton)selectModeChevronButton;
- (UILabel)selectModeCaptionLabel;
- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3;
- (double)interbuttonSpacing;
- (id)_defaultToolbarItemIdentifiers;
- (id)_identifierForActionType:(id)a3;
- (id)_selectionModeIdentifier;
- (id)createAssetActionManagerForAssetReference:(id)a3;
- (id)createBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)rightBarButtonItemIdentifiers;
- (id)toolbarItemIdentifiers;
- (id)undoManagerForActionPerformer:(id)a3;
- (void)_applyZoomLevel:(int64_t)a3;
- (void)_invalidateToolbarItems;
- (void)_updateSelectModeCaption;
- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4;
- (void)handleCancelBarButtonItem:(id)a3;
- (void)handleSelectBarButtonItem:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setActiveActionPerformer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterbuttonSpacing:(double)a3;
- (void)setLastActionPerformer:(id)a3;
- (void)updateBars;
@end

@implementation PXCuratedLibraryBarsController

- (id)toolbarItemIdentifiers
{
  v3 = [(PXCuratedLibraryBarsController *)self viewModel];
  if ([v3 isSelecting])
  {
    v4 = [(PXCuratedLibraryBarsController *)self _defaultToolbarItemIdentifiers];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)rightBarButtonItemIdentifiers
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PXCuratedLibraryBarsController *)self viewModel];
  char v3 = [v2 libraryState];
  if (PXCuratedLibraryStateIsEmptyLibrary(v3))
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else if ((v3 & 2) != 0)
  {
    if ([v2 isSelecting])
    {
      v8[0] = @"PXBarItemIdentifierCancel";
      v5 = (__CFString **)v8;
    }
    else
    {
      v7 = @"PXBarItemIdentifierSelect";
      v5 = &v7;
    }
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)updateBars
{
  char v3 = [(PXCuratedLibraryBarsController *)self viewModel];
  char v4 = [v3 wantsNavigationBarVisible];
  char v5 = [v3 wantsTabBarVisible];
  char v6 = [v3 wantsToolbarVisible];
  [v3 lastChromeVisibilityChangeReason];
  v7 = [[PXBarAnimationOptions alloc] initWithType:0];
  v8 = [(PXCuratedLibraryBarsController *)self barAppearance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__PXCuratedLibraryBarsController_updateBars__block_invoke;
  v11[3] = &__block_descriptor_35_e34_v16__0___PXMutableBarAppearance__8l;
  char v12 = v4;
  char v13 = v6;
  char v14 = v5;
  [v8 performChangesWithAnimationOptions:v7 changes:v11];

  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryBarsController;
  [(PXBarsController *)&v10 updateBars];
  v9 = [(PXCuratedLibraryBarsController *)self delegate];
  [v9 curatedLibraryBarsControllerDidUpdateBars:self];
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXBarsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (PXBarsControllerDelegate *)WeakRetained;
}

- (PXBarAppearance)barAppearance
{
  v2 = [(PXBarsController *)self viewController];
  char v3 = objc_msgSend(v2, "px_barAppearance");

  return (PXBarAppearance *)v3;
}

void __44__PXCuratedLibraryBarsController_updateBars__block_invoke(unsigned __int8 *a1, void *a2)
{
  uint64_t v3 = a1[32];
  id v4 = a2;
  [v4 setPrefersNavigationBarVisible:v3];
  [v4 setPrefersToolbarVisible:a1[33]];
  [v4 setPrefersTabBarVisible:a1[34]];
  id v5 = +[PXCuratedLibrarySettings sharedInstance];
  objc_msgSend(v4, "setPrefersStatusBarVisible:", objc_msgSend(v5, "showStatusBar"));
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v8 = a3;
  if ((void *)PXCuratedLibraryBarsControllerViewModelObserverContext == a5)
  {
    id v9 = v8;
    if ((*(void *)&v6 & 0x400041) != 0) {
      [(PXBarsController *)self invalidateBars];
    }
    if ((v6 & 9) != 0) {
      [(PXCuratedLibraryBarsController *)self _invalidateToolbarItems];
    }
    if ((v6 & 2) != 0) {
      [(PXCuratedLibraryBarsController *)self _updateSelectModeCaption];
    }
    [(PXBarsController *)self updateIfNeeded];
    id v8 = v9;
  }
}

- (id)createBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4
{
  id v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PXCuratedLibraryBarsController;
  id v8 = [(PXBarsController *)&v39 createBarButtonItemForIdentifier:v7 placement:a4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PXCuratedLibraryBarsController_createBarButtonItemForIdentifier_placement___block_invoke;
  aBlock[3] = &unk_1E5DB3FE8;
  aBlock[4] = self;
  id v9 = (void (**)(void *, void *, char *))_Block_copy(aBlock);
  if ([v7 isEqualToString:@"PXBarItemIdentifierSelect"])
  {
    objc_super v10 = sel_handleSelectBarButtonItem_;
LABEL_5:
    v9[2](v9, v8, v10);
LABEL_6:
    v11 = v8;
    goto LABEL_15;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierCancel"])
  {
    objc_super v10 = sel_handleCancelBarButtonItem_;
    goto LABEL_5;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierShare"])
  {
    char v12 = @"PXAssetActionTypeShare";
LABEL_13:
    char v13 = v12;
    v11 = v8;
LABEL_14:
    char v14 = [(PXCuratedLibraryBarsController *)self viewModel];
    v15 = [v14 assetActionManager];
    v16 = [v15 barButtonItemForActionType:v12];

    v17 = [(PXCuratedLibraryBarsController *)self viewModel];
    v18 = [v17 assetActionManager];
    objc_msgSend(v16, "setEnabled:", objc_msgSend(v18, "canPerformActionType:", v12));

    v11 = v16;
    goto LABEL_15;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierAddTo"])
  {
    char v12 = @"PXAssetActionTypeAddToAlbum";
    goto LABEL_13;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierTrash"])
  {
    char v12 = @"PXAssetActionTypeUnifiedDestructive";
    goto LABEL_13;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierPlaceholder"])
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
LABEL_29:

    goto LABEL_15;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierSelectModeCaption"])
  {
    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v21 = [(PXCuratedLibraryBarsController *)self selectModeCaptionLabel];
    v11 = (void *)[v20 initWithCustomView:v21];

    [v11 setEnabled:1];
    id v8 = [(PXCuratedLibraryBarsController *)self viewModel];
    v22 = [v8 photoLibrary];
    v23 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v22];

    if ([v23 hasPreview])
    {
      v24 = [v8 selectionSnapshot];
      int v25 = [v24 isAnyItemSelected];

      if (v25)
      {
        v26 = [v8 assetActionManager];
        int v27 = [v26 canPerformActionType:@"PXAssetActionTypeMoveToPersonalLibrary"];
        unsigned __int8 v28 = [v26 canPerformActionType:@"PXAssetActionTypeMoveToSharedLibrary"];
        if (v27 && (v28 & 1) != 0)
        {
          v29 = @"PXAssetActionTypeMoveToLibrary";
        }
        else
        {
          v29 = @"PXAssetActionTypeMoveToPersonalLibrary";
          if (!v27) {
            v29 = @"PXAssetActionTypeMoveToSharedLibrary";
          }
          if (((v27 | v28) & 1) == 0)
          {
            v37 = [MEMORY[0x1E4F28B00] currentHandler];
            [v37 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryBarsController.m" lineNumber:214 description:@"Code which should be unreachable has been reached"];

            abort();
          }
        }
        char v12 = v29;

        goto LABEL_14;
      }
    }

    goto LABEL_29;
  }
  if (![v7 isEqualToString:@"PXBarItemIdentifierSelectModeMenu"]) {
    goto LABEL_6;
  }
  v30 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle"];
  v31 = [(PXCuratedLibraryBarsController *)self delegate];
  v32 = [v31 barsControllerActionsForSelectionContextMenu:self];

  v33 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 children:v32];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v30 menu:v33];

  v34 = [(PXCuratedLibraryBarsController *)self viewModel];
  v35 = [v34 selectionSnapshot];
  v36 = [v35 selectedIndexPaths];
  objc_msgSend(v11, "setEnabled:", objc_msgSend(v36, "count") > 0);

LABEL_15:
  return v11;
}

void __77__PXCuratedLibraryBarsController_createBarButtonItemForIdentifier_placement___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = a2;
    [v5 setTarget:v4];
    [v5 setAction:a3];
  }
}

- (void)_invalidateToolbarItems
{
  uint64_t v3 = [(PXCuratedLibraryBarsController *)self viewModel];
  uint64_t v4 = [v3 assetActionManager];
  [v4 setPerformerDelegate:self];

  id v5 = [(PXCuratedLibraryBarsController *)self _defaultToolbarItemIdentifiers];
  [(PXBarsController *)self purgeCachedBarButtonItemsForIdentifiers:v5];

  [(PXBarsController *)self invalidateBars];
}

- (void)setDelegate:(id)a3
{
}

- (PXCuratedLibraryBarsController)initWithCuratedLibraryViewController:(id)a3 viewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXCuratedLibraryBarsController;
  id v8 = [(PXBarsController *)&v16 init];
  id v9 = v8;
  if (v8)
  {
    [(PXBarsController *)v8 setViewController:v6];
    objc_storeStrong((id *)&v9->_viewModel, a4);
    [v7 registerChangeObserver:v9 context:PXCuratedLibraryBarsControllerViewModelObserverContext];
    objc_super v10 = [v6 navigationItem];
    objc_msgSend(v10, "px_setBackButtonDisplayMode:", 2);

    v11 = [v6 navigationItem];
    objc_msgSend(v11, "px_setPreferredLargeTitleDisplayMode:", 2);

    char v12 = [v7 specManager];
    char v13 = [v12 spec];
    [v13 interbuttonSpacing];
    v9->_interbuttonSpacing = v14;
  }
  return v9;
}

- (id)_defaultToolbarItemIdentifiers
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v6[0] = @"PXBarItemIdentifierShare";
  v6[1] = @"PXBarItemIdentifierPlaceholder";
  v6[2] = @"PXBarItemIdentifierSelectModeCaption";
  v6[3] = @"PXBarItemIdentifierPlaceholder";
  v6[4] = @"PXBarItemIdentifierTrash";
  v6[5] = @"PXBarItemIdentifierInterButtonSpacing";
  v6[6] = @"PXBarItemIdentifierSelectModeMenu";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:7];
  uint64_t v4 = [v2 arrayWithArray:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActionPerformer, 0);
  objc_storeStrong((id *)&self->_activeActionPerformer, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_selectModeChevronButton, 0);
  objc_storeStrong((id *)&self->_selectModeCaptionLabel, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)setInterbuttonSpacing:(double)a3
{
  self->_interbuttonSpacing = a3;
}

- (double)interbuttonSpacing
{
  return self->_interbuttonSpacing;
}

- (void)setLastActionPerformer:(id)a3
{
}

- (PXActionPerformer)lastActionPerformer
{
  return self->_lastActionPerformer;
}

- (void)setActiveActionPerformer:(id)a3
{
}

- (PXActionPerformer)activeActionPerformer
{
  return self->_activeActionPerformer;
}

- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3
{
  uint64_t v3 = [(PXCuratedLibraryBarsController *)self viewModel];
  uint64_t v4 = [v3 styleGuide];

  double v5 = 0.0;
  if ((unint64_t)([v4 secondaryToolbarPlacement] - 1) <= 1)
  {
    [v4 secondaryToolbarPadding];
    double v7 = v6;
    [v4 secondaryToolbarSize];
    double v5 = v7 + v8;
  }

  return v5;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  uint64_t v4 = [a3 actionType];
  double v5 = [(PXCuratedLibraryBarsController *)self _identifierForActionType:v4];
  double v6 = [(PXBarsController *)self cachedBarButtonItemForIdentifier:v5];
  double v7 = [(PXBarsController *)self viewController];
  double v8 = +[PXViewControllerPresenter popoverPresenterWithViewController:v7 sourceItem:v6];

  return v8;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  uint64_t v3 = [(PXBarsController *)self viewController];
  uint64_t v4 = [v3 undoManager];

  return v4;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  double v7 = [(PXBarsController *)self viewController];
  double v8 = [v7 presentedViewController];

  if (v8) {
    [v7 dismissViewControllerAnimated:1 completion:v6];
  }

  return v8 != 0;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
    v11 = [v10 popoverPresentationController];
    if (!v11) {
      goto LABEL_15;
    }
    char v12 = [v7 sender];
    int v13 = [v12 conformsToProtocol:&unk_1F02E1808];

    if (v13)
    {
      id v14 = [v7 sender];
      [v11 setSourceItem:v14];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:
        v21 = [v11 sourceItem];
        if (!v21)
        {
          v22 = [v11 sourceView];

          if (v22) {
            goto LABEL_15;
          }
          v21 = [(PXBarsController *)self cachedBarButtonItemForIdentifier:@"PXBarItemIdentifierSelectModeMenu"];
          [v11 setSourceItem:v21];
        }

LABEL_15:
        v23 = [(PXBarsController *)self viewController];
        [v23 presentViewController:v10 animated:1 completion:0];

        goto LABEL_16;
      }
      v15 = [v7 selectionSnapshot];
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__50570;
      v37 = __Block_byref_object_dispose__50571;
      id v38 = 0;
      objc_super v16 = [v15 selectedIndexPaths];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      int v27 = __72__PXCuratedLibraryBarsController_actionPerformer_presentViewController___block_invoke;
      unsigned __int8 v28 = &unk_1E5DCF698;
      v31 = &v33;
      id v14 = v15;
      SEL v32 = a2;
      id v29 = v14;
      v30 = self;
      [v16 enumerateItemIndexPathsUsingBlock:&v25];

      v17 = [(PXCuratedLibraryBarsController *)self curatedLibraryViewController];
      v18 = [v17 viewProvider];
      v19 = [v18 gridView];

      if (v34[5])
      {
        id v20 = objc_msgSend(v19, "regionOfInterestForObjectReference:");
        if (v20)
        {
          [v11 setSourceView:v19];
          [v20 rectInCoordinateSpace:v19];
          objc_msgSend(v11, "setSourceRect:");
        }
      }
      else
      {
        id v20 = 0;
      }

      _Block_object_dispose(&v33, 8);
    }

    goto LABEL_12;
  }
LABEL_16:

  return v9 != 0;
}

void __72__PXCuratedLibraryBarsController_actionPerformer_presentViewController___block_invoke(uint64_t a1, _OWORD *a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(void *)(v3 + 40) = 0;

    *a3 = 1;
    return;
  }
  id v8 = [*(id *)(a1 + 32) dataSource];
  long long v9 = a2[1];
  v22[0] = *a2;
  v22[1] = v9;
  id v10 = [v8 objectReferenceAtIndexPath:v22];

  if (!v10)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 40);
    objc_super v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [v13 handleFailureInMethod:v14, v15, @"PXCuratedLibraryBarsController.m", 339, @"%@ should be an instance inheriting from %@, but it is nil", @"[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]", v17 object file lineNumber description];
LABEL_9:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v20);
    v21 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:v18, v19, @"PXCuratedLibraryBarsController.m", 339, @"%@ should be an instance inheriting from %@, but it is %@", @"[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]", v17, v21 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_5:
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  char v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  id v10 = v6;
  if (a4 == 10)
  {
    [(PXCuratedLibraryBarsController *)self setActiveActionPerformer:v6];
    [(PXCuratedLibraryBarsController *)self setLastActionPerformer:v10];
  }
  else
  {
    id v7 = [(PXCuratedLibraryBarsController *)self activeActionPerformer];

    if (v7 == v10) {
      [(PXCuratedLibraryBarsController *)self setActiveActionPerformer:0];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v10 shouldExitSelectModeForState:a4])
    {
      id v8 = [(PXCuratedLibraryBarsController *)self lastActionPerformer];

      if (v8 == v10)
      {
        long long v9 = [(PXCuratedLibraryBarsController *)self viewModel];
        [v9 performChanges:&__block_literal_global_230];
      }
    }
  }
}

uint64_t __65__PXCuratedLibraryBarsController_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:0];
}

- (void)handleCancelBarButtonItem:(id)a3
{
  id v3 = [(PXCuratedLibraryBarsController *)self viewModel];
  [v3 performChanges:&__block_literal_global_227_50591];
}

uint64_t __60__PXCuratedLibraryBarsController_handleCancelBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:0];
}

- (void)handleSelectBarButtonItem:(id)a3
{
  id v3 = [(PXCuratedLibraryBarsController *)self viewModel];
  [v3 performChanges:&__block_literal_global_50593];
}

uint64_t __60__PXCuratedLibraryBarsController_handleSelectBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:1];
}

- (void)_applyZoomLevel:(int64_t)a3
{
  uint64_t v4 = [(PXCuratedLibraryBarsController *)self viewModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PXCuratedLibraryBarsController__applyZoomLevel___block_invoke;
  v5[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
  v5[4] = a3;
  [v4 performChanges:v5];
}

uint64_t __50__PXCuratedLibraryBarsController__applyZoomLevel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:*(void *)(a1 + 32)];
}

- (id)_identifierForActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PXAssetActionTypeShare"])
  {
    uint64_t v4 = PXBarItemIdentifierShare;
LABEL_6:
    double v5 = *v4;
    goto LABEL_7;
  }
  if (([v3 isEqualToString:@"PXAssetActionTypeUnifiedDestructive"] & 1) != 0
    || ([v3 isEqualToString:@"PXAssetActionTypeTrash"] & 1) != 0)
  {
    uint64_t v4 = PXBarItemIdentifierTrash;
    goto LABEL_6;
  }
  if ([v3 isEqualToString:@"PXAssetActionTypeHide"])
  {
    uint64_t v4 = PXBarItemIdentifierSelectModeMenu;
    goto LABEL_6;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

- (UIButton)selectModeChevronButton
{
  selectModeChevronButton = self->_selectModeChevronButton;
  if (!selectModeChevronButton)
  {
    PXPhotosBarsSelectModeChevronButton(self);
    uint64_t v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_selectModeChevronButton;
    self->_selectModeChevronButton = v4;

    [(PXCuratedLibraryBarsController *)self _updateSelectModeCaption];
    selectModeChevronButton = self->_selectModeChevronButton;
  }
  return selectModeChevronButton;
}

- (UILabel)selectModeCaptionLabel
{
  selectModeCaptionLabel = self->_selectModeCaptionLabel;
  if (!selectModeCaptionLabel)
  {
    PXPhotosBarsCreateSelectModeCaptionLabel();
    uint64_t v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_selectModeCaptionLabel;
    self->_selectModeCaptionLabel = v4;

    [(PXCuratedLibraryBarsController *)self _updateSelectModeCaption];
    selectModeCaptionLabel = self->_selectModeCaptionLabel;
  }
  return selectModeCaptionLabel;
}

- (void)_updateSelectModeCaption
{
  id v3 = [(PXCuratedLibraryBarsController *)self viewModel];
  id v4 = [v3 selectModeCaption];

  PXPhotosBarsUpdateSelectModeCaption(v4, self->_selectModeCaptionLabel, self->_selectModeChevronButton);
}

- (id)_selectionModeIdentifier
{
  v2 = [(PXCuratedLibraryBarsController *)self viewModel];
  id v3 = [v2 photoLibrary];
  id v4 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v3];

  if ([v4 hasPreview])
  {
    double v5 = [v2 libraryFilterState];
    uint64_t v6 = [v5 viewMode];

    if (v6 != 2) {
      goto LABEL_8;
    }
  }
  id v7 = [v2 selectionSnapshot];
  if (([v7 isAnyItemSelected] & 1) == 0)
  {

LABEL_8:
    id v10 = @"PXBarItemIdentifierSelectModeCaption";
    goto LABEL_9;
  }
  id v8 = +[PXPhotosGridSettings sharedInstance];
  int v9 = [v8 enableMultiSelectMenu];

  if (v9) {
    id v10 = @"PXBarItemIdentifierSelectModeMenu";
  }
  else {
    id v10 = @"PXBarItemIdentifierSelectModeCaption";
  }
LABEL_9:
  uint64_t v11 = v10;

  return v11;
}

- (id)createAssetActionManagerForAssetReference:(id)a3
{
  id v4 = a3;
  double v5 = [PXPhotoKitAssetActionManager alloc];
  uint64_t v6 = [(PXCuratedLibraryBarsController *)self viewModel];
  id v7 = [v6 assetsDataSourceManager];
  id v8 = [v7 currentPhotoKitAssetsDataSourceManager];
  int v9 = [(PXAssetActionManager *)v5 initWithSelectedObjectReference:v4 dataSourceManager:v8];

  [(PXActionManager *)v9 setPerformerDelegate:self];
  id v10 = [(PXCuratedLibraryBarsController *)self viewModel];
  uint64_t v11 = [v10 assetActionManager];
  char v12 = [v11 allowedActionTypes];
  [(PXActionManager *)v9 setAllowedActionTypes:v12];

  return v9;
}

- (PXCuratedLibraryBarsController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryBarsController.m", 64, @"%s is not available as initializer", "-[PXCuratedLibraryBarsController init]");

  abort();
}

@end