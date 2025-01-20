@interface PXPhotosBarsController
- (BOOL)_actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5;
- (BOOL)shouldUseCompactBarButtons;
- (BOOL)wantsToggleSidebarButton;
- (NSArray)leftBarButtonItemIdentifiers;
- (NSArray)rightBarButtonItemIdentifiers;
- (NSArray)toolbarItemIdentifiers;
- (NSMapTable)actionTypeByBarButtonItem;
- (NSString)selectModeCaptionText;
- (PLDateRangeFormatter)dateRangeFormatter;
- (PXActionPerformer)activeActionPerformer;
- (PXActionPerformer)lastActionPerformer;
- (PXAssetSelectionTypeCounter)assetTypeCounter;
- (PXBarsControllerDelegate)delegate;
- (PXLibraryFilterState)libraryFilterState;
- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory;
- (PXMoviePresenter)moviePresenter;
- (PXPhotosBarButtonItemsController)barButtonItemsController;
- (PXPhotosBarsController)init;
- (PXPhotosBarsController)initWithPhotosContentController:(id)a3;
- (PXPhotosContentController)contentController;
- (PXPhotosGridActionMenuController)menuController;
- (PXPhotosViewModel)viewModel;
- (PXPresentationEnvironment)presentationEnvironment;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (UIButton)selectModeChevronButton;
- (UILabel)selectModeCaptionLabel;
- (UITraitChangeRegistration)horizontalSizeClassObservation;
- (double)endButtonSpacing;
- (double)interButtonSpacing;
- (id)_identifierForActionType:(id)a3;
- (id)barAppearance;
- (id)barItemIdentifiersToInvalidateForPhotosViewModelChange:(unint64_t)a3;
- (id)createActionMenuController;
- (id)createAssetActionManagerForAssetReference:(id)a3;
- (id)createBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)undoManagerForActionPerformer:(id)a3;
- (int64_t)abilityToPlayMovieForAssetCollection:(id)a3;
- (int64_t)contentSizeCategory;
- (void)_handleActionTypeBarButtonItem:(id)a3;
- (void)_updateSelectModeCaption;
- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4;
- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4;
- (void)handleActionMenuBarButtonItem:(id)a3;
- (void)handleAddButtonItem:(id)a3;
- (void)handleCancelBarButtonItem:(id)a3;
- (void)handleDeselectAllBarButtonItem:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)handleExplicitBackButton:(id)a3;
- (void)handleInfoButton:(id)a3;
- (void)handleMergeDuplicatesButton:(id)a3;
- (void)handleSearchButton:(id)a3;
- (void)handleSelectAllBarButtonItem:(id)a3;
- (void)handleSelectBarButtonItem:(id)a3;
- (void)handleToggleSidebar:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosGridActionPerformer:(id)a3 contentFilterStateChanged:(id)a4;
- (void)setActiveActionPerformer:(id)a3;
- (void)setContentSizeCategory:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEndButtonSpacing:(double)a3;
- (void)setHorizontalSizeClassObservation:(id)a3;
- (void)setInterButtonSpacing:(double)a3;
- (void)setLastActionPerformer:(id)a3;
- (void)setLeftBarButtonItemIdentifiers:(id)a3;
- (void)setMenuController:(id)a3;
- (void)setMoviePresenter:(id)a3;
- (void)setRightBarButtonItemIdentifiers:(id)a3;
- (void)setToolbarItemIdentifiers:(id)a3;
- (void)setWantsToggleSidebarButton:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateBars;
- (void)viewControllerDidChange:(id)a3;
@end

@implementation PXPhotosBarsController

- (id)barItemIdentifiersToInvalidateForPhotosViewModelChange:(unint64_t)a3
{
  v4 = self;
  PXPhotosBarsController.barItemIdentifiersToInvalidateForPhotosViewModelChange(_:)(a3);

  v5 = (void *)sub_1AB23AABC();
  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)shouldUseCompactBarButtons
{
  v2 = self;
  PXPhotosBarsController.shouldUseCompactBarButtons.getter();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItemsController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_horizontalSizeClassObservation, 0);
  objc_storeStrong((id *)&self->_actionTypeByBarButtonItem, 0);
  objc_storeStrong((id *)&self->_moviePresenter, 0);
  objc_storeStrong((id *)&self->_menuController, 0);
  objc_storeStrong((id *)&self->_lastActionPerformer, 0);
  objc_storeStrong((id *)&self->_activeActionPerformer, 0);
  objc_storeStrong((id *)&self->_assetTypeCounter, 0);
  objc_destroyWeak((id *)&self->_contentController);
  objc_storeStrong((id *)&self->_dateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_selectModeChevronButton, 0);
  objc_storeStrong((id *)&self->_selectModeCaptionLabel, 0);
  objc_storeStrong((id *)&self->_toolbarItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItemIdentifiers, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (PXPhotosBarButtonItemsController)barButtonItemsController
{
  return self->_barButtonItemsController;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (void)setHorizontalSizeClassObservation:(id)a3
{
}

- (UITraitChangeRegistration)horizontalSizeClassObservation
{
  return self->_horizontalSizeClassObservation;
}

- (BOOL)wantsToggleSidebarButton
{
  return self->_wantsToggleSidebarButton;
}

- (double)endButtonSpacing
{
  return self->_endButtonSpacing;
}

- (double)interButtonSpacing
{
  return self->_interButtonSpacing;
}

- (int64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (NSMapTable)actionTypeByBarButtonItem
{
  return self->_actionTypeByBarButtonItem;
}

- (void)setMoviePresenter:(id)a3
{
}

- (PXMoviePresenter)moviePresenter
{
  return self->_moviePresenter;
}

- (void)setMenuController:(id)a3
{
}

- (PXPhotosGridActionMenuController)menuController
{
  return self->_menuController;
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

- (PXAssetSelectionTypeCounter)assetTypeCounter
{
  return self->_assetTypeCounter;
}

- (PXPhotosContentController)contentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentController);
  return (PXPhotosContentController *)WeakRetained;
}

- (void)setToolbarItemIdentifiers:(id)a3
{
}

- (NSArray)toolbarItemIdentifiers
{
  return self->_toolbarItemIdentifiers;
}

- (void)setRightBarButtonItemIdentifiers:(id)a3
{
}

- (NSArray)rightBarButtonItemIdentifiers
{
  return self->_rightBarButtonItemIdentifiers;
}

- (void)setLeftBarButtonItemIdentifiers:(id)a3
{
}

- (NSArray)leftBarButtonItemIdentifiers
{
  return self->_leftBarButtonItemIdentifiers;
}

- (void)setDelegate:(id)a3
{
}

- (PXBarsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (PXBarsControllerDelegate *)WeakRetained;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v9 = a4;
  v5 = NSStringFromSelector(sel_enableNewActionMenu);
  if ([v9 isEqualToString:v5]) {
    goto LABEL_4;
  }
  v6 = NSStringFromSelector(sel_enableNewActionContextMenu);
  if ([v9 isEqualToString:v6])
  {

LABEL_4:
LABEL_5:
    [(PXPhotosBarsController *)self updateBars];
    goto LABEL_6;
  }
  v7 = NSStringFromSelector(sel_enableContentFiltering);
  char v8 = [v9 isEqualToString:v7];

  if (v8) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v26[18] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ((void *)PXPhotosBarsControllerViewModelObserverContext == a5)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v11 = (a4 & 0x100000200026) != 0;
    if ((a4 & 0x100000200026) != 0)
    {
      v26[0] = @"PXBarItemIdentifierActionMenu";
      v26[1] = @"PXBarItemIdentifierSelect";
      v26[2] = @"PXBarItemIdentifierSelectModeCaption";
      v26[3] = @"PXBarItemIdentifierAdd";
      v26[4] = @"PXBarItemIdentifierShare";
      v26[5] = @"PXBarItemIdentifierTrash";
      v26[6] = @"PXBarItemIdentifierDelete";
      v26[7] = @"PXBarItemIdentifierRestore";
      v26[8] = @"PXBarItemIdentifierFileRadar";
      v26[9] = @"PXBarItemIdentifierInfo";
      v26[10] = @"PXBarItemIdentifierAddToLibrary";
      v26[11] = @"PXBarItemIdentifierContentSyndicationSaveAll";
      v26[12] = @"PXBarItemIdentifierMergeDuplicates";
      v26[13] = @"PXBarItemIdentifierMoveToLibrary";
      v26[14] = @"PXBarItemIdentifierMoveToPersonalLibrary";
      v26[15] = @"PXBarItemIdentifierMoveToSharedLibrary";
      v26[16] = @"PXBarItemIdentifierSelectModeMenu";
      v26[17] = @"PXBarItemIdentifierSearch";
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:18];
      [v10 addObjectsFromArray:v12];
    }
    if ((a4 & 0x84000) != 0)
    {
      [v10 addObject:@"PXBarItemIdentifierToggleAspectFit"];
      BOOL v11 = 1;
    }
    v13 = [(PXPhotosBarsController *)self barItemIdentifiersToInvalidateForPhotosViewModelChange:a4];
    if ([v13 count])
    {
      [v10 addObjectsFromArray:v13];
    }
    else
    {
      BOOL v21 = !v11;
      if ((a4 & 0x2403002020) != 0) {
        BOOL v21 = 0;
      }
      if (v21) {
        goto LABEL_24;
      }
    }
    [(PXBarsController *)self purgeCachedBarButtonItemsForIdentifiers:v10];
    [(PXBarsController *)self invalidateBars];
LABEL_24:

    goto LABEL_28;
  }
  if ((void *)PXPhotosBarsControllerSpecObserverContext == a5)
  {
    if (a4)
    {
      v14 = [(PXPhotosBarsController *)self viewModel];
      v15 = [v14 specManager];
      v16 = [v15 spec];

      -[PXPhotosBarsController setContentSizeCategory:](self, "setContentSizeCategory:", [v16 contentSizeCategory]);
      [v16 interButtonSpacing];
      -[PXPhotosBarsController setInterButtonSpacing:](self, "setInterButtonSpacing:");
      [v16 endButtonSpacing];
      -[PXPhotosBarsController setEndButtonSpacing:](self, "setEndButtonSpacing:");
      -[PXPhotosBarsController setWantsToggleSidebarButton:](self, "setWantsToggleSidebarButton:", [v16 wantsToggleSidebarButton]);
    }
  }
  else
  {
    if ((void *)PXPhotosBarsControllerAssetTypeCountObserverContext != a5)
    {
      if ((void *)PXSharedLibraryStatusProviderObservationContext_273576 == a5)
      {
        if ((a4 & 3) == 0) {
          goto LABEL_28;
        }
        v24 = @"PXBarItemIdentifierActionMenu";
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
        [(PXBarsController *)self purgeCachedBarButtonItemsForIdentifiers:v22];
      }
      else
      {
        if ((void *)PXLibraryFilterStateObservationContext_273577 != a5)
        {
          v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:a2 object:self file:@"PXPhotosBarsController.m" lineNumber:1145 description:@"Code which should be unreachable has been reached"];

          abort();
        }
        if ((a4 & 1) == 0) {
          goto LABEL_28;
        }
      }
      [(PXBarsController *)self invalidateBars];
      goto LABEL_28;
    }
    if (a4)
    {
      v25[0] = @"PXBarItemIdentifierSelectModeCaption";
      v25[1] = @"PXBarItemIdentifierMergeDuplicates";
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      v18 = [(PXPhotosBarsController *)self viewModel];
      int v19 = [v18 wantsSelectModeCaptionInContextMenu];

      if (v19)
      {
        uint64_t v20 = [v17 arrayByAddingObject:@"PXBarItemIdentifierSelectModeMenu"];

        v17 = (void *)v20;
      }
      [(PXBarsController *)self purgeCachedBarButtonItemsForIdentifiers:v17];
      [(PXBarsController *)self invalidateBars];
    }
  }
LABEL_28:
  [(PXBarsController *)self updateIfNeeded];
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(PXBarsController *)self viewController];
  if ([v6 tryToPresentMovieForAssetCollection:v5]) {
    goto LABEL_2;
  }
  id v13 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v14 = v13;

    if (v14)
    {
      v15 = [(PXPhotosBarsController *)self moviePresenter];
      v16 = v15;
      if (v15)
      {
        v17 = [v15 presentingViewController];
        if (v6 == v17)
        {

          goto LABEL_18;
        }

        if (!v6) {
          goto LABEL_18;
        }
      }
      else if (!v6)
      {
        v16 = 0;
        goto LABEL_18;
      }
      uint64_t v18 = +[PXMoviePresenter moviePresenterWithPresentingViewController:v6];

      [(PXPhotosBarsController *)self setMoviePresenter:v18];
      v16 = (void *)v18;
LABEL_18:
      [v16 presentMovieViewControllerForAssetCollection:v14 keyAssetFetchResult:0 preferredTransitionType:1];

LABEL_2:
      v7 = (void *)MEMORY[0x1E4F56658];
      uint64_t v8 = *MEMORY[0x1E4F56548];
      v21[0] = v5;
      uint64_t v9 = *MEMORY[0x1E4F56560];
      uint64_t v19 = v8;
      uint64_t v20 = v9;
      id v10 = (objc_class *)objc_opt_class();
      BOOL v11 = NSStringFromClass(v10);
      v21[1] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v19 count:2];
      objc_msgSend(v7, "sendEvent:withPayload:", @"com.apple.photos.CPAnalytics.assetCollectionMoviePlayed", v12, v19, v20, v21[0]);

      goto LABEL_13;
    }
  }
  else
  {
  }
  BOOL v11 = PLGridZeroGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v13;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Can't play movie for unexpected asset collection: %@", buf, 0xCu);
  }
LABEL_13:
}

- (int64_t)abilityToPlayMovieForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXBarsController *)self viewController];
  int64_t v6 = [v5 abilityToPlayMovieForAssetCollection:v4];

  if (!v6)
  {
    objc_opt_class();
    int64_t v6 = objc_opt_isKindOfClass() & 1;
  }

  return v6;
}

- (void)photosGridActionPerformer:(id)a3 contentFilterStateChanged:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(PXPhotosBarsController *)self viewModel];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PXPhotosBarsController_photosGridActionPerformer_contentFilterStateChanged___block_invoke;
  v8[3] = &unk_1E5DCF6C0;
  id v9 = v5;
  id v7 = v5;
  [v6 performChanges:v8];
}

uint64_t __78__PXPhotosBarsController_photosGridActionPerformer_contentFilterStateChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentFilterState:*(void *)(a1 + 32)];
}

- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory
{
  v3 = [(PXPhotosBarsController *)self viewModel];
  id v4 = [v3 viewDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(PXPhotosBarsController *)self viewModel];
    int64_t v6 = [v5 viewDelegate];
    id v7 = [v6 memoryAssetsActionFactory];
  }
  else
  {
    id v7 = 0;
  }

  return (PXMemoryAssetsActionFactory *)v7;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  id v4 = [a3 actionType];
  id v5 = [(PXPhotosBarsController *)self _identifierForActionType:v4];
  int64_t v6 = [(PXBarsController *)self cachedBarButtonItemForIdentifier:v5];
  id v7 = [(PXPhotosBarsController *)self delegate];
  uint64_t v8 = [v7 presentationEnvironmentForPhotosBarsController:self withSourceItem:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    BOOL v11 = [(PXBarsController *)self viewController];
    PXPresentationEnvironmentForSender(v11);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  v3 = [(PXPhotosBarsController *)self contentController];
  id v4 = [v3 undoManager];

  return v4;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(PXPhotosBarsController *)self presentationEnvironment];
  id v10 = v7;
  [v9 dismissViewController:v10 animated:1 completionHandler:v8];

  return v9 != 0;
}

- (BOOL)_actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v8)
  {
    char v18 = 0;
    goto LABEL_23;
  }
  id v10 = v8;
  BOOL v11 = [v10 popoverPresentationController];
  if (v11)
  {
    v12 = [v7 actionType];
    uint64_t v13 = [(PXPhotosBarsController *)self _identifierForActionType:v12];
    id v14 = (void *)v13;
    v15 = @"PXBarItemIdentifierShare";
    if (v13) {
      v15 = (__CFString *)v13;
    }
    v16 = v15;

    id v17 = [v7 sender];
    if (!v17)
    {
      id v17 = [(PXBarsController *)self cachedBarButtonItemForIdentifier:v16];
      if (!v17)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = [v7 selectionSnapshot];
          uint64_t v46 = 0;
          v47 = &v46;
          uint64_t v48 = 0x3032000000;
          v49 = __Block_byref_object_copy__273596;
          v50 = __Block_byref_object_dispose__273597;
          id v51 = 0;
          v25 = [v24 selectedIndexPaths];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __65__PXPhotosBarsController__actionPerformer_presentViewController___block_invoke;
          v41[3] = &unk_1E5DCF698;
          v44 = &v46;
          SEL v45 = a2;
          id v38 = v24;
          id v42 = v38;
          v43 = self;
          [v25 enumerateItemIndexPathsUsingBlock:v41];

          if (v47[5])
          {
            v26 = [(PXPhotosBarsController *)self contentController];
            v27 = [v26 regionOfInterestForAssetReference:v47[5]];

            if (v27)
            {
              v28 = [(PXBarsController *)self viewController];
              v29 = [v28 view];

              [v11 setSourceView:v29];
              [v27 rectInCoordinateSpace:v29];
              objc_msgSend(v11, "setSourceRect:");
            }
          }

          _Block_object_dispose(&v46, 8);
        }
        else
        {
          v30 = [(PXBarsController *)self viewController];
          v31 = [v30 view];
          [v11 setSourceView:v31];
        }
        goto LABEL_19;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v39 = [MEMORY[0x1E4F28B00] currentHandler];
        v32 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v32);
        v34 = objc_msgSend(v17, "px_descriptionForAssertionMessage");
        [v39 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 942, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"sender", v36, v34 object file lineNumber description];
      }
      [v11 setSourceView:v17];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v19 = [(PXBarsController *)self viewController];
        uint64_t v20 = [v19 view];
        [v11 setSourceView:v20];

        goto LABEL_18;
      }
      id v17 = v17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v40 = [MEMORY[0x1E4F28B00] currentHandler];
        v33 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v33);
        v35 = objc_msgSend(v17, "px_descriptionForAssertionMessage");
        [v40 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 945, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"sender", v37, v35 object file lineNumber description];
      }
      [v11 setBarButtonItem:v17];
    }

LABEL_18:
LABEL_19:
  }
  BOOL v21 = [(PXPhotosBarsController *)self presentationEnvironment];
  char v18 = 1;
  [v21 presentViewController:v10 animated:1 completionHandler:0];

  v22 = [v10 presentingViewController];
  if (!v22) {
    char v18 = objc_msgSend(v10, "px_isDelayingPresentation");
  }

LABEL_23:
  return v18;
}

void __65__PXPhotosBarsController__actionPerformer_presentViewController___block_invoke(uint64_t a1, _OWORD *a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
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
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 40);
    v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    [v13 handleFailureInMethod:v14, v15, @"PXPhotosBarsController.m", 956, @"%@ should be an instance inheriting from %@, but it is nil", @"[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]", v17 object file lineNumber description];
LABEL_9:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v20);
    BOOL v21 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:v18, v19, @"PXPhotosBarsController.m", 956, @"%@ should be an instance inheriting from %@, but it is %@", @"[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]", v17, v21 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_5:
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 1:
      v12 = [(PXBarsController *)self viewController];
      uint64_t v13 = [v12 navigationController];

      BOOL v11 = v13 != 0;
      if (v13) {
        [v13 pushViewController:v10 animated:1];
      }

      break;
    case 2:
      BOOL v11 = [(PXPhotosBarsController *)self _actionPerformer:v9 presentViewController:v10];
      break;
    case 0:
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PXPhotosBarsController.m" lineNumber:926 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      BOOL v11 = 0;
      break;
  }

  return v11;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  id v10 = v6;
  if (a4 == 10)
  {
    [(PXPhotosBarsController *)self setActiveActionPerformer:v6];
    [(PXPhotosBarsController *)self setLastActionPerformer:v10];
  }
  else
  {
    id v7 = [(PXPhotosBarsController *)self activeActionPerformer];

    if (v7 == v10) {
      [(PXPhotosBarsController *)self setActiveActionPerformer:0];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v10 shouldExitSelectModeForState:a4])
    {
      id v8 = [(PXPhotosBarsController *)self lastActionPerformer];

      if (v8 == v10)
      {
        id v9 = [(PXPhotosBarsController *)self viewModel];
        [v9 performChanges:&__block_literal_global_361];
      }
    }
  }
}

uint64_t __57__PXPhotosBarsController_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attemptSetInSelectMode:0];
}

- (void)_handleActionTypeBarButtonItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXPhotosBarsController *)self actionTypeByBarButtonItem];
  id v6 = [v5 objectForKey:v4];

  if (!v6) {
    PXAssertGetLog();
  }
  id v7 = [(PXPhotosBarsController *)self viewModel];
  id v8 = [v7 assetActionManager];

  id v9 = [v8 actionPerformerForActionType:v6];

  if (v9) {
    goto LABEL_5;
  }
  id v10 = [(PXPhotosBarsController *)self viewModel];
  BOOL v11 = [v10 gridActionManager];

  id v9 = [v11 actionPerformerForActionType:v6];

  if (v9) {
    goto LABEL_5;
  }
  v12 = [(PXPhotosBarsController *)self viewModel];
  uint64_t v13 = [v12 assetCollectionActionManager];

  id v9 = [v13 actionPerformerForActionType:v6];

  if (v9)
  {
LABEL_5:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__PXPhotosBarsController__handleActionTypeBarButtonItem___block_invoke;
    v14[3] = &unk_1E5DD3158;
    id v15 = v6;
    [v9 performActionWithCompletionHandler:v14];
  }
  else
  {
    id v9 = PLGridZeroGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Missing action performer for bar button action type %{public}@", buf, 0xCu);
    }
  }
}

void __57__PXPhotosBarsController__handleActionTypeBarButtonItem___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLGridZeroGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Action failed for bar button action type %{public}@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)handleToggleSidebar:(id)a3
{
  id v4 = [(PXBarsController *)self viewController];
  uint64_t v3 = objc_msgSend(v4, "px_splitViewController");
  [v3 toggleSidebarVisibilityAnimated];
}

- (void)handleSearchButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosBarsController *)self delegate];
  [v5 photosBarsController:self didRequestSearchWithSender:v4];
}

- (void)handleInfoButton:(id)a3
{
  id v4 = [(PXPhotosBarsController *)self viewModel];
  id v6 = [v4 infoActionHandler];

  if (v6)
  {
    id v5 = [(PXBarsController *)self viewController];
    v6[2](v6, v5);
  }
}

- (void)handleAddButtonItem:(id)a3
{
  id v4 = [(PXPhotosBarsController *)self viewModel];
  id v5 = [v4 assetCollectionActionManager];
  id v6 = [v5 actionPerformerForActionType:@"PXAssetCollectionActionTypeAddFrom"];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PXPhotosBarsController_handleAddButtonItem___block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  [v6 performActionWithCompletionHandler:v7];
}

void __46__PXPhotosBarsController_handleAddButtonItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"No";
    if (a2) {
      uint64_t v7 = @"Yes";
    }
    int v11 = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Add action completed with success: %@, error: %@", (uint8_t *)&v11, 0x16u);
  }

  if (a2)
  {
    int v8 = [*(id *)(a1 + 32) viewModel];
    int v9 = [v8 canExitSelectMode];

    if (v9)
    {
      __int16 v10 = [*(id *)(a1 + 32) viewModel];
      [v10 performChanges:&__block_literal_global_357];
    }
  }
}

uint64_t __46__PXPhotosBarsController_handleAddButtonItem___block_invoke_354(uint64_t a1, void *a2)
{
  return [a2 attemptSetInSelectMode:0];
}

- (void)handleExplicitBackButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosBarsController *)self delegate];
  [v5 photosBarsController:self didRequestDismissWithSender:v4];
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosBarsController *)self delegate];
  [v5 photosBarsController:self didRequestDismissWithSender:v4];
}

- (void)handleActionMenuBarButtonItem:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXPhotosBarsController *)self createActionMenuController];
  [(PXPhotosBarsController *)self setMenuController:v5];

  id v6 = [(PXPhotosBarsController *)self menuController];
  uint64_t v7 = [(PXPhotosBarsController *)self viewModel];
  int v8 = [v7 customExcludedActionTypesProvider];
  int v9 = v8[2]();
  [v6 setExcludedActionTypes:v9];

  __int16 v10 = +[PXSharingSettings sharedInstance];
  LODWORD(v9) = [v10 enableNewActionContextMenu];

  if (!v9)
  {
    __int16 v13 = [v7 currentDataSource];
    uint64_t v24 = [v13 containerCollection];
    int v25 = [v24 canContainAssets];

    if ((v25 & 1) == 0)
    {
      uint64_t v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 787, @"Invalid parameter not satisfying: %@", @"dataSource.containerCollection.canContainAssets" object file lineNumber description];
    }
    id v14 = [v13 containerCollection];
    id v23 = [v14 startDate];
    uint64_t v26 = [v14 endDate];
    v27 = (void *)v26;
    if (!v23
      || !v26
      || ([(PXPhotosBarsController *)self dateRangeFormatter],
          v28 = objc_claimAutoreleasedReturnValue(),
          [v28 stringFromDate:v23 toDate:v27],
          uint64_t v29 = objc_claimAutoreleasedReturnValue(),
          v28,
          !v29))
    {
      v30 = [(PXPhotosBarsController *)self contentController];
      v31 = [v30 countsController];
      v32 = v31;
      if (v31) {
        [v31 counts];
      }

      uint64_t v29 = 0;
    }
    v60 = v27;
    v33 = [[PXActivitySharingContext alloc] initWithAssetCollection:v14 assetsDataSource:v13];
    v65 = v6;
    v34 = [v6 activityActions];
    [(PXActivitySharingContext *)v33 setActivities:v34];

    [(PXActivitySharingContext *)v33 setWantsActionSheet:1];
    v35 = [v14 localizedTitle];
    [(PXActivitySharingContext *)v33 setTitle:v35];

    v59 = (void *)v29;
    [(PXActivitySharingContext *)v33 setSubtitle:v29];
    -[PXActivitySharingContext setExcludeShareActivity:](v33, "setExcludeShareActivity:", [v7 allowsShareAllAction] ^ 1);
    v36 = [v13 keyAsset];
    [(PXActivitySharingContext *)v33 setKeyAsset:v36];

    [(PXActivitySharingContext *)v33 setSourceOrigin:3];
    v37 = [(PXBarsController *)self viewController];
    id v38 = objc_msgSend(v37, "px_sharePresentation");

    if (!v38)
    {
      v47 = [MEMORY[0x1E4F28B00] currentHandler];
      [v47 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 814, @"Invalid parameter not satisfying: %@", @"sharePresentation" object file lineNumber description];
    }
    v62 = v7;
    v39 = [v38 createActivitySharingControllerWithContext:v33];
    if (!v39)
    {
      uint64_t v48 = [MEMORY[0x1E4F28B00] currentHandler];
      [v48 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 816, @"Invalid parameter not satisfying: %@", @"activitySharingController" object file lineNumber description];
    }
    id v40 = v4;
    v41 = [v39 activityViewController];
    if (v41)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_28:
        id v42 = [(PXBarsController *)self viewController];
        [v42 presentViewController:v41 animated:1 completion:0];

        id v4 = v40;
        id v6 = v65;
        uint64_t v7 = v62;
        goto LABEL_29;
      }
      v57 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = (objc_class *)objc_opt_class();
      uint64_t v54 = NSStringFromClass(v53);
      v56 = objc_msgSend(v41, "px_descriptionForAssertionMessage");
      v58 = (void *)v54;
      uint64_t v55 = v54;
      v49 = v57;
      [v57 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 817, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController.activityViewController", v55, v56 object file lineNumber description];
    }
    else
    {
      v49 = [MEMORY[0x1E4F28B00] currentHandler];
      v50 = (objc_class *)objc_opt_class();
      v58 = NSStringFromClass(v50);
      [v49 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 817, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController.activityViewController", v58 object file lineNumber description];
    }

    goto LABEL_28;
  }
  int v11 = (void *)MEMORY[0x1E4FB1970];
  uint64_t v12 = [v6 actions];
  __int16 v13 = [v11 menuWithChildren:v12];

  id v14 = [(PXPhotosBarsController *)self presentationEnvironment];
  if (v14)
  {
    id v61 = v4;
    v64 = v6;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v15 = v7;
    v16 = [v7 internalMenuProducers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v67;
      do
      {
        uint64_t v20 = 0;
        BOOL v21 = v13;
        do
        {
          if (*(void *)v67 != v19) {
            objc_enumerationMutation(v16);
          }
          v22 = [*(id *)(*((void *)&v66 + 1) + 8 * v20) makeInternalMenuWithPresentationEnvironment:v14];
          __int16 v13 = [v21 mergingWithPhotosInternalMenu:v22];

          ++v20;
          BOOL v21 = v13;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v66 objects:v70 count:16];
      }
      while (v18);
    }

    id v6 = v64;
    uint64_t v7 = v15;
    id v4 = v61;
  }
  id v23 = v4;
  if (!v23)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    v44 = (objc_class *)objc_opt_class();
    SEL v45 = NSStringFromClass(v44);
    [v43 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 782, @"%@ should be an instance inheriting from %@, but it is nil", @"sender", v45 object file lineNumber description];
LABEL_33:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    id v51 = (objc_class *)objc_opt_class();
    SEL v45 = NSStringFromClass(v51);
    v52 = objc_msgSend(v23, "px_descriptionForAssertionMessage");
    [v43 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 782, @"%@ should be an instance inheriting from %@, but it is %@", @"sender", v45, v52 object file lineNumber description];

    goto LABEL_33;
  }
LABEL_13:
  [v23 setMenu:v13];
LABEL_29:
}

- (id)createActionMenuController
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v2 = [(PXPhotosBarsController *)self viewModel];
  uint64_t v3 = [v2 assetCollectionActionManager];
  id v4 = +[PXPhotosGridSettings sharedInstance];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v2 supportsPeopleActions])
  {
    v28[0] = @"PXPhotosGridActionToggleFaceMode";
    v28[1] = @"PXAssetCollectionActionTypeFavoritePerson";
    v28[2] = @"PXAssetCollectionActionTypeAddPersonToHome";
    v28[3] = @"PXAssetCollectionActionTypeCustomizePeopleAlbum";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v5 addObjectsFromArray:v6];
  }
  if ([v2 supportsSocialGroupActions])
  {
    v27 = @"PXAssetCollectionActionTypeCustomizeSocialGroupAlbum";
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    [v5 addObjectsFromArray:v7];
  }
  if ([v2 allowsShowDetails] && objc_msgSend(v4, "enableDetailsMenuAction")) {
    [v5 addObject:@"PXAssetCollectionActionTypeShowDetails"];
  }
  int v8 = +[PXLemonadeSettings sharedInstance];
  char v9 = [v8 enableCollectionsSortButton];

  if ([v4 enableSortAction] && (v9 & 1) == 0) {
    [v5 addObject:@"PXAssetCollectionActionTypeSetSortOrder"];
  }
  if ([v2 allowsSlideshowAction])
  {
    [v5 addObject:@"PXAssetActionTypeSlideshow"];
    [v5 addObject:@"PXAssetActionTypePlayMovie"];
  }
  if ([v2 allowsShowMapAction]) {
    [v5 addObject:@"PXAssetCollectionActionTypeShowMap"];
  }
  [v5 addObject:@"PXAssetCollectionActionTypeMediaViewDemo"];
  if ([v2 allowsFileRadarAction]) {
    [v5 addObject:@"PXAssetActionTypeFileRadar"];
  }
  uint64_t v26 = v4;
  if ([v2 allowsCMMActions])
  {
    [v5 addObject:@"PXAssetCollectionActionTypeCopyLink"];
    [v5 addObject:@"PXAssetCollectionActionTypeTrashMomentShare"];
  }
  [v5 addObject:@"PXAssetActionTypeClearRecentlyViewed"];
  [v5 addObject:@"PXAssetActionTypeClearRecentlyShared"];
  __int16 v10 = (void *)v3;
  int v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);
  uint64_t v12 = [v2 gridActionManager];
  if (v12) {
    [v11 addObject:v12];
  }
  __int16 v13 = [v2 assetActionManager];
  if (v13) {
    [v11 addObject:v13];
  }
  id v14 = [[PXPhotosGridActionMenuController alloc] initWithActionManagers:v11 viewModel:v2];
  uint64_t v15 = +[PXSharingSettings sharedInstance];
  int v16 = [v15 enableNewActionContextMenu];

  if (v16)
  {
    if ([v2 allowsShareAllAction]
      && ([v2 wantsShareGridButtonVisible] & 1) == 0)
    {
      [v5 addObject:@"PXPhotosGridActionShare"];
    }
    uint64_t v17 = [(PXBarsController *)self viewController];
    uint64_t v18 = objc_msgSend(v17, "px_sharePresentation");

    if (!v18)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 748, @"Invalid parameter not satisfying: %@", @"sharePresentation" object file lineNumber description];
    }
    uint64_t v19 = [v18 defaultActivityTypeOrder];
    if (!v19)
    {
      id v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"PXPhotosBarsController.m", 750, @"Invalid parameter not satisfying: %@", @"defaultActivityTypeOrder" object file lineNumber description];
    }
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v19];
    [(PXActionMenuController *)v14 setDefaultActivityTypeOrder:v20];
  }
  [(PXPhotosGridActionMenuController *)v14 setAdditionalActionTypes:v5];

  return v14;
}

- (void)handleCancelBarButtonItem:(id)a3
{
  id v3 = [(PXPhotosBarsController *)self viewModel];
  [v3 performChanges:&__block_literal_global_313_273649];
}

uint64_t __52__PXPhotosBarsController_handleCancelBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attemptSetInSelectMode:0];
}

- (void)handleDeselectAllBarButtonItem:(id)a3
{
  id v4 = [(PXPhotosBarsController *)self viewModel];
  id v3 = [v4 selectionManager];
  [v3 performChanges:&__block_literal_global_311_273652];
}

uint64_t __57__PXPhotosBarsController_handleDeselectAllBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)handleSelectAllBarButtonItem:(id)a3
{
  id v4 = [(PXPhotosBarsController *)self viewModel];
  id v3 = [v4 selectionManager];
  [v3 performChanges:&__block_literal_global_309_273654];
}

uint64_t __55__PXPhotosBarsController_handleSelectAllBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (void)handleSelectBarButtonItem:(id)a3
{
  id v3 = [(PXPhotosBarsController *)self viewModel];
  [v3 performChanges:&__block_literal_global_273656];
}

uint64_t __52__PXPhotosBarsController_handleSelectBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attemptSetInSelectMode:1];
}

- (void)handleMergeDuplicatesButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosBarsController *)self viewModel];
  id v6 = [v5 assetActionManager];

  [v6 executeActionForActionType:@"PXAssetActionTypeMergeDuplicates" sender:v4 completionHandler:0];
  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.deduplicationFromAlbumSelection" withPayload:MEMORY[0x1E4F1CC08]];
}

- (id)_identifierForActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PXAssetActionTypeShare"])
  {
    id v4 = PXBarItemIdentifierShare;
LABEL_9:
    id v5 = *v4;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"PXAssetActionTypeHide"])
  {
    id v4 = PXBarItemIdentifierSelectModeMenu;
    goto LABEL_9;
  }
  if (([v3 isEqualToString:@"PXAssetActionTypeTrash"] & 1) != 0
    || ([v3 isEqualToString:@"PXAssetActionTypeRemove"] & 1) != 0
    || ([v3 isEqualToString:@"PXAssetActionTypeUnifiedDestructive"] & 1) != 0)
  {
    id v4 = PXBarItemIdentifierTrash;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"PXAssetActionTypeDelete"])
  {
    id v4 = PXBarItemIdentifierDelete;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"PXAssetActionTypeRestore"])
  {
    id v4 = PXBarItemIdentifierRestore;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"PXAssetActionTypeRecover"])
  {
    id v4 = PXBarItemIdentifierRecover;
    goto LABEL_9;
  }
  if (([v3 isEqualToString:@"PXAssetCollectionActionTypeSetSortOrder"] & 1) != 0
    || ([v3 isEqualToString:@"PXPhotosGridActionShowFilters"] & 1) != 0)
  {
    id v4 = &PXBarItemIdentifierActionMenu;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"PXAssetActionTypeMergeDuplicates"])
  {
    id v4 = PXBarItemIdentifierMergeDuplicates;
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (id)createBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = [(PXBarsController *)self viewController];
  char v9 = objc_msgSend(v8, "px_extendedTraitCollection");

  v80 = [(PXPhotosBarsController *)self barButtonItemsController];
  __int16 v10 = [(PXPhotosBarsController *)self viewModel];
  int v11 = v10;
  if (a4 - 2 >= 2)
  {
    if (a4 <= 1)
    {
      v63 = [MEMORY[0x1E4F28B00] currentHandler];
      [v63 handleFailureInMethod:a2 object:self file:@"PXPhotosBarsController.m" lineNumber:399 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    int v12 = 0;
  }
  else if ([v10 navBarStyle] && objc_msgSend(v11, "navBarStyle") != 8)
  {
    int v12 = 1;
  }
  else
  {
    int v12 = [v11 wantsModernNavBarButtons];
  }
  id v79 = v7;
  val = self;
  if ([v7 isEqualToString:@"PXBarItemIdentifierSelect"])
  {
    __int16 v13 = [(PXPhotosBarsController *)self viewModel];
    if ([v13 wantsAdaptiveSelectModeBarButton])
    {
      BOOL v14 = [(PXPhotosBarsController *)self shouldUseCompactBarButtons];

      if (v14)
      {
        uint64_t v15 = [v80 createBarButtonItemWithSystemIconName:@"checkmark" target:self action:sel_handleSelectBarButtonItem_ menuAction:0];
LABEL_12:
        int v16 = (char *)v15;
        uint64_t v17 = 0;
        goto LABEL_13;
      }
    }
    else
    {
    }
    int v77 = v12;
    v82 = 0;
    uint64_t v71 = 0;
    uint64_t v73 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v17 = 0;
    int v16 = sel_handleSelectBarButtonItem_;
LABEL_27:
    int v74 = 1;
    int v75 = 1;
    goto LABEL_28;
  }
  int v77 = v12;
  if ([v7 isEqualToString:@"PXBarItemIdentifierSelectAll"])
  {
    v82 = 0;
    uint64_t v71 = 0;
    uint64_t v73 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v17 = 0;
    int v16 = sel_handleSelectAllBarButtonItem_;
    goto LABEL_27;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierDeselectAll"])
  {
    v82 = 0;
    uint64_t v71 = 0;
    uint64_t v73 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v17 = 0;
    int v16 = sel_handleDeselectAllBarButtonItem_;
    goto LABEL_27;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierCancel"])
  {
    v82 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
    uint64_t v71 = 0;
    uint64_t v73 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v17 = 0;
    int v16 = sel_handleCancelBarButtonItem_;
    goto LABEL_27;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierPlaceholder"])
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierShare"])
  {
    if ([v11 wantsShareGridButtonVisible]
      && ([v11 isInSelectMode] & 1) == 0)
    {
      uint64_t v17 = @"PXPhotosGridActionShare";
    }
    else
    {
      uint64_t v17 = @"PXAssetActionTypeShare";
    }
    id v42 = v17;
    v82 = 0;
    int v16 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    int v74 = 1;
    int v75 = 0;
    uint64_t v43 = 2;
    goto LABEL_72;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierAddTo"])
  {
    uint64_t v17 = @"PXAssetActionTypeAddToAlbum";
LABEL_67:
    v41 = v17;
    v82 = 0;
    uint64_t v71 = 0;
    uint64_t v73 = 0;
    int v16 = 0;
    goto LABEL_26;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierAdd"])
  {
    v82 = 0;
    uint64_t v71 = 0;
    uint64_t v73 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v17 = 0;
    int v16 = sel_handleAddButtonItem_;
    goto LABEL_27;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierTrash"])
  {
    uint64_t v17 = @"PXAssetActionTypeUnifiedDestructive";
    v44 = @"PXAssetActionTypeUnifiedDestructive";
    v82 = 0;
    int v16 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    int v74 = 1;
    int v75 = 0;
    uint64_t v43 = 3;
LABEL_72:
    uint64_t v71 = 0;
    uint64_t v73 = v43;
    goto LABEL_28;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierRecover"])
  {
    uint64_t v17 = @"PXAssetActionTypeRecover";
    goto LABEL_67;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierRestore"])
  {
    uint64_t v17 = @"PXAssetActionTypeRestore";
    goto LABEL_67;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierDelete"])
  {
    uint64_t v17 = @"PXAssetActionTypeDelete";
    goto LABEL_67;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierSlideshow"])
  {
    uint64_t v17 = @"PXAssetActionTypeSlideshow";
    goto LABEL_67;
  }
  SEL v45 = v11;
  if ([v7 isEqualToString:@"PXBarItemIdentifierActionMenu"])
  {
    uint64_t v46 = +[PXSharingSettings sharedInstance];
    int v47 = [v46 enableNewActionContextMenu];

    if (v47)
    {
      if (v12)
      {
        v82 = 0;
        int v16 = 0;
        uint64_t v19 = 0;
        uint64_t v17 = 0;
        uint64_t v20 = sel_handleActionMenuBarButtonItem_;
        uint64_t v71 = 0;
        uint64_t v73 = 1;
        int v74 = 1;
        int v75 = 0;
        int v77 = 1;
        goto LABEL_28;
      }
      objc_initWeak((id *)buf, self);
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __69__PXPhotosBarsController_createBarButtonItemForIdentifier_placement___block_invoke;
      v96[3] = &unk_1E5DCF520;
      objc_copyWeak(&v97, (id *)buf);
      uint64_t v19 = _Block_copy(v96);
      objc_destroyWeak(&v97);
      objc_destroyWeak((id *)buf);
      v82 = 0;
      int v75 = 0;
      uint64_t v71 = 0;
      int v16 = 0;
      uint64_t v20 = 0;
      uint64_t v17 = 0;
      int v77 = 0;
    }
    else
    {
      v82 = 0;
      int v75 = 0;
      uint64_t v71 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v17 = 0;
      int v16 = sel_handleActionMenuBarButtonItem_;
    }
    uint64_t v73 = 1;
    int v74 = 1;
LABEL_28:
    BOOL v21 = objc_msgSend(v11, "assetActionManager", v71);
    v22 = [v11 gridActionManager];
    v76 = v11;
    id v23 = [v11 assetCollectionActionManager];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PXPhotosBarsController_createBarButtonItemForIdentifier_placement___block_invoke_2;
    aBlock[3] = &unk_1E5DCF610;
    v92 = v16;
    unint64_t v93 = a4;
    id v85 = v7;
    v86 = val;
    id v18 = v19;
    id v91 = v18;
    uint64_t v17 = v17;
    v87 = v17;
    id v24 = v21;
    id v88 = v24;
    id v25 = v22;
    id v89 = v25;
    id v26 = v23;
    id v90 = v26;
    v27 = (void (**)(void))_Block_copy(aBlock);
    v28 = v27;
    if (!v77) {
      goto LABEL_52;
    }
    uint64_t v29 = v82;
    if ((v75 & v74) != 1 || v82)
    {
      if (v17) {
        v32 = sel__handleActionTypeBarButtonItem_;
      }
      else {
        v32 = v16;
      }
      if (!v82)
      {
        if (v75)
        {
          if (v74)
          {
            int v16 = 0;
            v82 = 0;
            if (!v17) {
              goto LABEL_52;
            }
            goto LABEL_55;
          }
          uint64_t v36 = [v80 createBarButtonItemWithSystemIconName:v72 target:val action:v32 menuAction:v20];
        }
        else
        {
          uint64_t v36 = [v80 createBarButtonItemWithSystemItem:v73 target:val action:v32 menuAction:v20];
        }
        int v16 = (char *)v36;
        v82 = 0;
        if (!v17) {
          goto LABEL_51;
        }
LABEL_55:
        if (([v24 canPerformActionType:v17] & 1) != 0
          || ([v25 canPerformActionType:v17] & 1) != 0)
        {
          uint64_t v39 = 1;
        }
        else
        {
          uint64_t v39 = [v26 canPerformActionType:v17];
        }
        [v16 setEnabled:v39];
        id v40 = [(PXPhotosBarsController *)val actionTypeByBarButtonItem];
        [v40 setObject:v17 forKey:v16];

        if (v16) {
          goto LABEL_53;
        }
        goto LABEL_52;
      }
      v33 = v80;
      v34 = val;
      v35 = v20;
    }
    else
    {
      v78 = v20;
      v30 = v27[2](v27);
      uint64_t v31 = [v30 title];

      if (!v31) {
        PXAssertGetLog();
      }
      if (v17) {
        v32 = sel__handleActionTypeBarButtonItem_;
      }
      else {
        v32 = v16;
      }
      v33 = v80;
      v34 = val;
      v82 = (void *)v31;
      uint64_t v29 = (void *)v31;
      v35 = v78;
    }
    int v16 = [v33 createBarButtonItemWithTitle:v29 target:v34 action:v32 menuAction:v35];
    if (!v17)
    {
LABEL_51:
      if (v16)
      {
LABEL_53:

        id v7 = v79;
        int v11 = v76;
        goto LABEL_54;
      }
LABEL_52:
      v28[2](v28);
      int v16 = (char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
    goto LABEL_55;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierToggleAspectFit"])
  {
    uint64_t v48 = [(PXPhotosBarsController *)self viewModel];
    if ([v48 aspectFitContent]) {
      v49 = @"PXLibraryAllPhotosToggleSquares";
    }
    else {
      v49 = @"PXLibraryAllPhotosToggleFullFrames";
    }
    v82 = PXLocalizedStringFromTable(v49, @"PhotosUICore");

    uint64_t v17 = @"PXPhotosGridActionToggleAspectFit";
    v50 = @"PXPhotosGridActionToggleAspectFit";
    goto LABEL_92;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierSelectModeCaption"])
  {
    id v51 = [(PXPhotosBarsController *)self selectModeCaptionLabel];
    [(PXPhotosBarsController *)self _updateSelectModeCaption];
    int v16 = (char *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v51];

LABEL_112:
    uint64_t v17 = 0;
LABEL_113:
    id v7 = v79;
    int v11 = v45;
    int v12 = v77;
    goto LABEL_13;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierSelectModeMenu"])
  {
    v83 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle"];
    v52 = [(PXPhotosBarsController *)self delegate];
    v53 = [v52 barsControllerActionsForSelectionContextMenu:self];

    if ([v11 wantsSelectModeCaptionInContextMenu])
    {
      uint64_t v54 = [(PXPhotosBarsController *)val selectModeCaptionText];
    }
    else
    {
      uint64_t v54 = &stru_1F00B0030;
    }
    v56 = [MEMORY[0x1E4FB1970] menuWithTitle:v54 children:v53];
    int v16 = (char *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v83 menu:v56];
    v57 = [v11 currentDataSource];
    v58 = [v57 containerCollection];

    if ((objc_msgSend(v58, "px_isRecentlyDeletedSmartAlbum") & 1) != 0
      || (objc_msgSend(v58, "px_isRecoveredSmartAlbum") & 1) != 0)
    {
      uint64_t v59 = 1;
    }
    else
    {
      v60 = [v45 selectionSnapshot];
      uint64_t v59 = [v60 isAnyItemSelected];
    }
    [v16 setEnabled:v59];

    goto LABEL_112;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierDismiss"])
  {
    v82 = 0;
    uint64_t v73 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v17 = 0;
    int v16 = sel_handleDismissButton_;
    int v74 = 0;
    int v75 = 1;
    uint64_t v55 = @"xmark";
    goto LABEL_117;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierAddToLibrary"])
  {
    uint64_t v17 = @"PXAssetActionTypeAddToLibrary";
LABEL_116:
    id v61 = v17;
    v82 = 0;
    uint64_t v73 = 0;
    int v16 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    int v74 = 0;
    int v75 = 1;
    uint64_t v55 = @"square.and.arrow.down";
    goto LABEL_117;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierContentSyndicationSaveAll"])
  {
    uint64_t v17 = @"PXAssetCollectionActionTypeContentSyndicationSaveToLibrary";
    goto LABEL_116;
  }
  if ([v7 isEqualToString:@"PXBarItemIdentifierInterButtonSpacing"])
  {
    v95[0] = self;
    v95[1] = PXPhotosBarsController;
    v62 = (objc_super *)v95;
  }
  else
  {
    if (![v7 isEqualToString:@"PXBarItemIdentifierButtonEndSpacing"])
    {
      if ([v7 isEqualToString:@"PXBarItemIdentifierFileRadar"])
      {
        uint64_t v17 = @"PXAssetActionTypeFileRadar";
      }
      else
      {
        if ([v7 isEqualToString:@"PXBarItemIdentifierInfo"])
        {
          v82 = 0;
          uint64_t v73 = 0;
          uint64_t v19 = 0;
          uint64_t v20 = 0;
          uint64_t v17 = 0;
          int v16 = sel_handleInfoButton_;
          int v74 = 0;
          int v75 = 1;
          uint64_t v55 = @"info.circle";
          goto LABEL_117;
        }
        if ([v7 isEqualToString:@"PXBarItemIdentifierReply"])
        {
          uint64_t v17 = @"PXAssetActionTypeReply";
          v65 = @"PXAssetActionTypeReply";
          v82 = 0;
          uint64_t v73 = 0;
          int v16 = 0;
          uint64_t v19 = 0;
          uint64_t v20 = 0;
          int v74 = 0;
          int v75 = 1;
          uint64_t v55 = @"arrowshape.turn.up.left";
          goto LABEL_117;
        }
        if ([v7 isEqualToString:@"PXBarItemIdentifierTapback"])
        {
          uint64_t v17 = @"PXAssetActionTypeTapback";
          long long v66 = @"PXAssetActionTypeTapback";
          v82 = 0;
          uint64_t v73 = 0;
          int v16 = 0;
          uint64_t v19 = 0;
          uint64_t v20 = 0;
          int v74 = 0;
          int v75 = 1;
          uint64_t v55 = @"plus.bubble.tapback";
          goto LABEL_117;
        }
        if ([v7 isEqualToString:@"PXBarItemIdentifierMergeDuplicates"])
        {
          long long v67 = [v11 assetActionManager];
          long long v68 = @"PXAssetActionTypeMergeDuplicates";
          int v16 = [v67 barButtonItemForActionType:@"PXAssetActionTypeMergeDuplicates"];
          if ([v67 canPerformActionType:@"PXAssetActionTypeMergeDuplicates"]) {
            uint64_t v69 = [v67 shouldEnableActionType:@"PXAssetActionTypeMergeDuplicates" onAsset:0];
          }
          else {
            uint64_t v69 = 0;
          }
          [v16 setEnabled:v69];
          [v16 setTarget:self];
          [v16 setAction:sel_handleMergeDuplicatesButton_];

          uint64_t v17 = @"PXAssetActionTypeMergeDuplicates";
          goto LABEL_113;
        }
        if ([v7 isEqualToString:@"PXBarItemIdentifierMoveToLibrary"])
        {
          uint64_t v17 = @"PXAssetActionTypeMoveToLibrary";
        }
        else if ([v7 isEqualToString:@"PXBarItemIdentifierMoveToPersonalLibrary"])
        {
          uint64_t v17 = @"PXAssetActionTypeMoveToPersonalLibrary";
        }
        else
        {
          if (![v7 isEqualToString:@"PXBarItemIdentifierMoveToSharedLibrary"])
          {
            if ([v7 isEqualToString:@"PXBarItemIdentifierExplicitBack"])
            {
              if ([v9 userInterfaceIdiom] == 5)
              {
                uint64_t v70 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:101 target:self action:sel_handleExplicitBackButton_];
              }
              else
              {
                uint64_t v70 = [v80 createStandardBackButtonWithTarget:self action:sel_handleExplicitBackButton_];
              }
              int v16 = (char *)v70;
              goto LABEL_112;
            }
            if ([v7 isEqualToString:@"PXBarItemIdentifierSearch"])
            {
              v82 = 0;
              uint64_t v73 = 0;
              uint64_t v19 = 0;
              uint64_t v20 = 0;
              uint64_t v17 = 0;
              int v16 = sel_handleSearchButton_;
              int v74 = 0;
              int v75 = 1;
              uint64_t v55 = @"magnifyingglass";
            }
            else
            {
              if (![v7 isEqualToString:@"PXBarItemIdentifierToggleSidebar"])
              {
                v82 = 0;
                uint64_t v71 = 0;
                uint64_t v73 = 0;
                int v16 = 0;
                uint64_t v19 = 0;
                uint64_t v20 = 0;
                uint64_t v17 = 0;
                goto LABEL_93;
              }
              v82 = 0;
              uint64_t v73 = 0;
              uint64_t v19 = 0;
              uint64_t v20 = 0;
              uint64_t v17 = 0;
              int v77 = 0;
              int v16 = sel_handleToggleSidebar_;
              int v74 = 0;
              int v75 = 1;
              uint64_t v55 = @"sidebar.leading";
            }
LABEL_117:
            uint64_t v71 = v55;
            goto LABEL_28;
          }
          uint64_t v17 = @"PXAssetActionTypeMoveToSharedLibrary";
        }
      }
      v64 = v17;
      v82 = 0;
LABEL_92:
      uint64_t v71 = 0;
      uint64_t v73 = 0;
      int v16 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
LABEL_93:
      int v74 = 1;
      int v75 = 1;
      goto LABEL_28;
    }
    v94.receiver = self;
    v94.super_class = (Class)PXPhotosBarsController;
    v62 = &v94;
  }
  int v16 = [(objc_super *)v62 createBarButtonItemForIdentifier:v7 placement:a4];
  int v12 = 0;
  uint64_t v17 = 0;
LABEL_13:
  if (!v16)
  {
    int v77 = v12;
    v82 = 0;
    uint64_t v71 = 0;
    uint64_t v73 = 0;
LABEL_26:
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    goto LABEL_27;
  }
  id v18 = 0;
  v82 = 0;
LABEL_54:
  v37 = v16;

  return v37;
}

id __69__PXPhotosBarsController_createBarButtonItemForIdentifier_placement___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained createActionMenuController];
  id v4 = objc_loadWeakRetained(v1);
  [v4 setMenuController:v3];

  id v5 = (void *)MEMORY[0x1E4FB1970];
  id v6 = objc_loadWeakRetained(v1);
  id v7 = [v6 menuController];
  int v8 = [v7 actions];
  char v9 = [v5 menuWithTitle:&stru_1F00B0030 children:v8];

  return v9;
}

id __69__PXPhotosBarsController_createBarButtonItemForIdentifier_placement___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 88))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 96);
    v11.receiver = *(id *)(a1 + 40);
    v11.super_class = (Class)PXPhotosBarsController;
    id v4 = objc_msgSendSuper2(&v11, sel_createBarButtonItemForIdentifier_placement_, v2, v3);
    [v4 setTarget:*(void *)(a1 + 40)];
    [v4 setAction:*(void *)(a1 + 88)];
    if (v4) {
      goto LABEL_17;
    }
  }
  else if (*(void *)(a1 + 80))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 96);
    v10.receiver = *(id *)(a1 + 40);
    v10.super_class = (Class)PXPhotosBarsController;
    id v4 = objc_msgSendSuper2(&v10, sel_createBarButtonItemForIdentifier_placement_, v5, v6);
    [v4 _setSecondaryActionsProvider:*(void *)(a1 + 80)];
    if (v4) {
      goto LABEL_17;
    }
  }
  else if (*(void *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 56), "supportsActionType:"))
    {
      id v4 = [*(id *)(a1 + 56) barButtonItemForActionType:*(void *)(a1 + 48)];
      objc_msgSend(v4, "setEnabled:", objc_msgSend(*(id *)(a1 + 56), "canPerformActionType:", *(void *)(a1 + 48)));
      if (v4) {
        goto LABEL_17;
      }
    }
    if ([*(id *)(a1 + 64) supportsActionType:*(void *)(a1 + 48)])
    {
      id v4 = [*(id *)(a1 + 64) barButtonItemForActionType:*(void *)(a1 + 48)];
      objc_msgSend(v4, "setEnabled:", objc_msgSend(*(id *)(a1 + 64), "canPerformActionType:", *(void *)(a1 + 48)));
      if (v4) {
        goto LABEL_17;
      }
    }
    if ([*(id *)(a1 + 72) supportsActionType:*(void *)(a1 + 48)])
    {
      id v4 = [*(id *)(a1 + 72) barButtonItemForActionType:*(void *)(a1 + 48)];
      objc_msgSend(v4, "setEnabled:", objc_msgSend(*(id *)(a1 + 72), "canPerformActionType:", *(void *)(a1 + 48)));
      if (v4) {
        goto LABEL_17;
      }
    }
  }
  id v7 = PLGridZeroGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Couldn't create bar button item for %@", buf, 0xCu);
  }

  id v4 = 0;
LABEL_17:
  return v4;
}

- (void)setWantsToggleSidebarButton:(BOOL)a3
{
  if (self->_wantsToggleSidebarButton != a3)
  {
    self->_wantsToggleSidebarButton = a3;
    [(PXBarsController *)self invalidateBars];
  }
}

- (void)setEndButtonSpacing:(double)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_endButtonSpacing != a3)
  {
    self->_endButtonSpacing = a3;
    v5[0] = @"PXBarItemIdentifierButtonEndSpacing";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [(PXBarsController *)self purgeCachedBarButtonItemsForIdentifiers:v4];

    [(PXBarsController *)self invalidateBars];
  }
}

- (void)setInterButtonSpacing:(double)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_interButtonSpacing != a3)
  {
    self->_interButtonSpacing = a3;
    v5[0] = @"PXBarItemIdentifierInterButtonSpacing";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [(PXBarsController *)self purgeCachedBarButtonItemsForIdentifiers:v4];

    [(PXBarsController *)self invalidateBars];
  }
}

- (void)setContentSizeCategory:(int64_t)a3
{
  if (self->_contentSizeCategory != a3)
  {
    [(PXBarsController *)self purgeCachedBarButtonItems];
    [(PXBarsController *)self invalidateBars];
  }
}

- (PLDateRangeFormatter)dateRangeFormatter
{
  dateRangeFormatter = self->_dateRangeFormatter;
  if (!dateRangeFormatter)
  {
    id v4 = (PLDateRangeFormatter *)[objc_alloc(MEMORY[0x1E4F8A798]) initWithPreset:0];
    uint64_t v5 = self->_dateRangeFormatter;
    self->_dateRangeFormatter = v4;

    dateRangeFormatter = self->_dateRangeFormatter;
  }
  return dateRangeFormatter;
}

- (PXPresentationEnvironment)presentationEnvironment
{
  uint64_t v3 = [(PXPhotosBarsController *)self delegate];
  id v4 = [v3 presentationEnvironmentForPhotosBarsController:self withSourceItem:0];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(PXBarsController *)self viewController];
    PXPresentationEnvironmentForSender(v7);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (PXPresentationEnvironment *)v6;
}

- (id)barAppearance
{
  uint64_t v2 = [(PXBarsController *)self viewController];
  uint64_t v3 = objc_msgSend(v2, "px_barAppearance");

  return v3;
}

- (void)updateBars
{
  uint64_t v3 = [(PXPhotosBarsController *)self viewModel];
  id v4 = [v3 currentDataSource];
  uint64_t v5 = [v3 title];

  v53 = v4;
  if (!v5)
  {
    id v6 = [v4 firstAssetCollection];
    uint64_t v7 = [v6 localizedTitle];
    goto LABEL_5;
  }
  id v6 = [v3 title];
  if ([v6 length])
  {
    uint64_t v7 = [v3 title];
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  char v9 = [(PXPhotosBarsController *)self sharedLibraryStatusProvider];
  uint64_t v10 = [v9 hasSharedLibraryOrPreview];

  objc_super v11 = [(PXPhotosBarsController *)self viewModel];
  __int16 v12 = [v11 allowedChromeItems];

  id v13 = (id)MEMORY[0x1E4F1CBF0];
  if ((v12 & 0x800) != 0)
  {
    int v16 = PXPhotosBarsItemIdentifierProviderForModel(v3);
    id v66 = v13;
    v67[0] = v8;
    id v64 = 0;
    id v65 = v13;
    [v16 valuesForModel:v3 title:v67 leadingIdentifiers:&v66 trailingIdentifiers:&v65 toolbarIdentifiers:&v64 hasSharedLibraryOrPreview:v10];
    id v17 = v67[0];

    id v15 = v66;
    id v13 = v65;
    id v14 = v64;

    uint64_t v8 = v17;
  }
  else
  {
    id v14 = 0;
    id v15 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v18 = (void *)[v15 copy];
  [(PXPhotosBarsController *)self setLeftBarButtonItemIdentifiers:v18];

  uint64_t v19 = (void *)[v13 copy];
  [(PXPhotosBarsController *)self setRightBarButtonItemIdentifiers:v19];

  v49 = v14;
  uint64_t v20 = (void *)[v14 copy];
  [(PXPhotosBarsController *)self setToolbarItemIdentifiers:v20];

  BOOL v21 = [(PXBarsController *)self viewController];
  [v21 setTitle:v8];

  if ([v3 navBarStyle] && objc_msgSend(v3, "navBarStyle") != 8 && objc_msgSend(v3, "navBarStyle") != 7)
  {
    v22 = [(PXBarsController *)self viewController];
    id v23 = [v22 navigationItem];
    [v23 setTitle:&stru_1F00B0030];
  }
  id v24 = [(PXBarsController *)self viewController];
  id v25 = [v24 navigationItem];
  [v25 setBackButtonTitle:v8];

  id v26 = [(PXBarsController *)self viewController];
  v27 = [v26 navigationItem];
  objc_msgSend(v27, "px_setBackButtonDisplayMode:", 2);

  uint64_t v28 = [v3 _shouldMimicSystemChromelessUsingManualScrollEdgeAppearance];
  uint64_t v29 = [(PXBarsController *)self viewController];
  v30 = [v29 navigationItem];
  [v30 _setManualScrollEdgeAppearanceEnabled:v28];

  char v48 = [v3 isEmbedded];
  int v31 = [v3 wantsTabBarVisible];
  int v32 = [v3 wantsNavbarVisible];
  v52 = v8;
  if ([v3 wantsToolbarVisible]) {
    int v33 = [v3 toolbarStyle] == 0;
  }
  else {
    int v33 = 0;
  }
  v50 = v15;
  id v51 = v13;
  if ([v3 requiresLightTopBars])
  {
    id v34 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v35 = 2;
  }
  else
  {
    id v34 = 0;
    uint64_t v35 = 0;
  }
  uint64_t v36 = [(PXPhotosBarsController *)self barAppearance];
  if ([v3 isAppearing]) {
    goto LABEL_29;
  }
  id v37 = [v36 navigationBarTintColor];
  if (v34 == v37)
  {
  }
  else
  {
    int v38 = [v34 isEqual:v37];

    if (!v38) {
      goto LABEL_27;
    }
  }
  if (v35 == [v36 barAppearancePreferredStatusBarStyle]
    && v32 == [v36 prefersNavigationBarVisible])
  {
    int v47 = [v36 prefersToolbarVisible];

    if (v33 == v47) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_27:

LABEL_28:
  if (v31 == [v36 prefersTabBarVisible])
  {
    uint64_t v39 = [PXBarAnimationOptions alloc];
    double v40 = 0.3;
    uint64_t v41 = 1;
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v39 = [PXBarAnimationOptions alloc];
  double v40 = 0.0;
  uint64_t v41 = 0;
LABEL_31:
  id v42 = [(PXBarAnimationOptions *)v39 initWithType:v41 duration:v40];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PXPhotosBarsController_updateBars__block_invoke;
  block[3] = &unk_1E5DCF470;
  id v56 = v36;
  v57 = v42;
  char v60 = v32;
  char v61 = v33;
  char v62 = v31;
  char v63 = v48;
  id v58 = v34;
  uint64_t v59 = v35;
  id v43 = v34;
  v44 = v42;
  id v45 = v36;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v54.receiver = self;
  v54.super_class = (Class)PXPhotosBarsController;
  [(PXBarsController *)&v54 updateBars];
  uint64_t v46 = [(PXPhotosBarsController *)self delegate];
  [v46 photosBarsControllerDidUpdateBars:self];
}

void __36__PXPhotosBarsController_updateBars__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PXPhotosBarsController_updateBars__block_invoke_2;
  v6[3] = &unk_1E5DCF448;
  char v9 = *(unsigned char *)(a1 + 64);
  __int16 v10 = *(_WORD *)(a1 + 65);
  id v4 = *(id *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 67);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 performChangesWithAnimationOptions:v3 changes:v6];
}

void __36__PXPhotosBarsController_updateBars__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPrefersNavigationBarVisible:*(unsigned __int8 *)(a1 + 48)];
  [v3 setPrefersToolbarVisible:*(unsigned __int8 *)(a1 + 49)];
  [v3 setPrefersTabBarVisible:*(unsigned __int8 *)(a1 + 50)];
  [v3 setNavigationBarTintColor:*(void *)(a1 + 32)];
  if (!*(unsigned char *)(a1 + 51))
  {
    [v3 setBarAppearancePreferredStatusBarStyle:*(void *)(a1 + 40)];
    [v3 setPrefersStatusBarVisible:1];
  }
}

- (id)createAssetActionManagerForAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotosBarsController *)self viewModel];
  id v6 = [v5 assetActionManager];
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = [v5 dataSourceManager];
  char v9 = (void *)[v7 initWithSelectedObjectReference:v4 dataSourceManager:v8];

  [v9 setPerformerDelegate:self];
  return v9;
}

- (void)viewControllerDidChange:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PXPhotosBarsController;
  [(PXBarsController *)&v29 viewControllerDidChange:v4];
  uint64_t v5 = [(PXBarsController *)self viewController];
  id v6 = [v5 navigationItem];
  objc_msgSend(v6, "px_setPreferredLargeTitleDisplayMode:", 2);

  id v7 = [(PXPhotosBarsController *)self viewModel];
  unint64_t v8 = [v7 navBarStyle];

  if (v8 > 8 || ((1 << v8) & 0x181) == 0)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v9 configureWithOpaqueBackground];
    __int16 v10 = +[PXPhotosGridSettings sharedInstance];
    if ([v10 colorNavbarArea]) {
      [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3];
    }
    else {
    char v11 = [MEMORY[0x1E4FB1618] clearColor];
    }
    [v9 setBackgroundColor:v11];

    [v9 setShadowColor:0];
    __int16 v12 = [v5 navigationItem];
    [v12 setStandardAppearance:v9];

    id v13 = [(PXPhotosBarsController *)self delegate];
    [v13 photosBarsControllerDidUpdateNavigationItemAppearance:self];
  }
  id v14 = objc_msgSend(v5, "px_extendedTraitCollection");
  id v15 = [PXPhotosBarButtonItemsController alloc];
  int v16 = [(PXPhotosBarsController *)self viewModel];
  id v17 = [(PXPhotosBarButtonItemsController *)v15 initWithExtendedTraitCollection:v14 viewModel:v16];
  barButtonItemsController = self->_barButtonItemsController;
  self->_barButtonItemsController = v17;

  uint64_t v19 = [(PXPhotosBarsController *)self horizontalSizeClassObservation];

  if (v19)
  {
    uint64_t v20 = [(PXPhotosBarsController *)self horizontalSizeClassObservation];
    [v4 unregisterForTraitChanges:v20];

    [(PXPhotosBarsController *)self setHorizontalSizeClassObservation:0];
  }
  objc_initWeak(&location, self);
  v30[0] = objc_opt_class();
  BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __50__PXPhotosBarsController_viewControllerDidChange___block_invoke;
  id v26 = &unk_1E5DCF420;
  objc_copyWeak(&v27, &location);
  v22 = [v5 registerForTraitChanges:v21 withHandler:&v23];
  -[PXPhotosBarsController setHorizontalSizeClassObservation:](self, "setHorizontalSizeClassObservation:", v22, v23, v24, v25, v26);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __50__PXPhotosBarsController_viewControllerDidChange___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = @"PXBarItemIdentifierSelect";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [WeakRetained purgeCachedBarButtonItemsForIdentifiers:v3];

  id v4 = objc_loadWeakRetained(v1);
  [v4 invalidateBars];
}

- (UIButton)selectModeChevronButton
{
  selectModeChevronButton = self->_selectModeChevronButton;
  if (!selectModeChevronButton)
  {
    PXPhotosBarsSelectModeChevronButton(self);
    id v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_selectModeChevronButton;
    self->_selectModeChevronButton = v4;

    [(PXPhotosBarsController *)self _updateSelectModeCaption];
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
    id v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_selectModeCaptionLabel;
    self->_selectModeCaptionLabel = v4;

    [(PXPhotosBarsController *)self _updateSelectModeCaption];
    selectModeCaptionLabel = self->_selectModeCaptionLabel;
  }
  return selectModeCaptionLabel;
}

- (void)_updateSelectModeCaption
{
  id v3 = [(PXPhotosBarsController *)self selectModeCaptionText];
  PXPhotosBarsUpdateSelectModeCaption(v3, self->_selectModeCaptionLabel, self->_selectModeChevronButton);
}

- (NSString)selectModeCaptionText
{
  uint64_t v2 = [(PXPhotosBarsController *)self viewModel];
  int v3 = [v2 isInSelectMode];
  id v4 = [v2 selectionManager];
  uint64_t v5 = [v4 assetTypeCounter];
  uint64_t v6 = [v5 typedCount];
  unint64_t v8 = PXLocalizedSelectModeCaption(v3, v6, v7);

  return (NSString *)v8;
}

- (PXPhotosBarsController)initWithPhotosContentController:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PXPhotosBarsController;
  uint64_t v5 = [(PXBarsController *)&v29 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_contentController, v4);
    uint64_t v7 = [v4 viewModel];
    viewModel = v6->_viewModel;
    v6->_viewModel = v7;
    id v9 = v7;

    [(PXPhotosViewModel *)v9 registerChangeObserver:v6 context:PXPhotosBarsControllerViewModelObserverContext];
    __int16 v10 = [(PXPhotosViewModel *)v9 specManager];
    [v10 registerChangeObserver:v6 context:PXPhotosBarsControllerSpecObserverContext];

    char v11 = [(PXPhotosViewModel *)v9 specManager];
    __int16 v12 = [v11 spec];

    v6->_contentSizeCategory = [v12 contentSizeCategory];
    [v12 interButtonSpacing];
    v6->_interButtonSpacing = v13;
    [v12 endButtonSpacing];
    v6->_endButtonSpacing = v14;
    v6->_wantsToggleSidebarButton = [v12 wantsToggleSidebarButton];
    id v15 = [(PXPhotosViewModel *)v9 gridActionManager];
    [v15 setPerformerDelegate:v6];

    int v16 = [(PXPhotosViewModel *)v9 assetActionManager];
    [v16 setPerformerDelegate:v6];

    id v17 = [(PXPhotosViewModel *)v9 assetCollectionActionManager];
    [v17 setPerformerDelegate:v6];

    id v18 = [(PXPhotosViewModel *)v9 selectionManager];
    uint64_t v19 = [v18 assetTypeCounter];
    assetTypeCounter = v6->_assetTypeCounter;
    v6->_assetTypeCounter = (PXAssetSelectionTypeCounter *)v19;

    [(PXAssetSelectionTypeCounter *)v6->_assetTypeCounter registerChangeObserver:v6 context:PXPhotosBarsControllerAssetTypeCountObserverContext];
    uint64_t v21 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    actionTypeByBarButtonItem = v6->_actionTypeByBarButtonItem;
    v6->_actionTypeByBarButtonItem = (NSMapTable *)v21;

    uint64_t v23 = +[PXPhotosGridSettings sharedInstance];
    [v23 addDeferredKeyObserver:v6];

    uint64_t v24 = [(PXPhotosViewModel *)v9 sharedLibraryStatusProvider];
    sharedLibraryStatusProvider = v6->_sharedLibraryStatusProvider;
    v6->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v24;

    [(PXSharedLibraryStatusProvider *)v6->_sharedLibraryStatusProvider registerChangeObserver:v6 context:PXSharedLibraryStatusProviderObservationContext_273576];
    uint64_t v26 = [(PXPhotosViewModel *)v9 libraryFilterState];
    libraryFilterState = v6->_libraryFilterState;
    v6->_libraryFilterState = (PXLibraryFilterState *)v26;

    [(PXLibraryFilterState *)v6->_libraryFilterState registerChangeObserver:v6 context:PXLibraryFilterStateObservationContext_273577];
  }

  return v6;
}

- (PXPhotosBarsController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosBarsController.m", 132, @"%s is not available as initializer", "-[PXPhotosBarsController init]");

  abort();
}

@end