@interface PUSidebarViewController
- (BOOL)_hasSidebarItemForDestination:(id)a3;
- (BOOL)_isPhotosPicker;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)isUpdating;
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (BOOL)selectingAlreadySelectedIndexPath;
- (NSPredicate)assetsFilterPredicate;
- (PHAssetCollection)pickerAllPhotosVirtualCollection;
- (PHPhotoLibrary)photoLibrary;
- (PUCollectionsCollectionViewDropDelegate)dropDelegate;
- (PUSidebarDataSectionEnablementController)sidebarDataSectionEnablementController;
- (PUSidebarReorderController)reorderController;
- (PUSidebarViewController)initWithNavigationRoot:(id)a3 photoLibrary:(id)a4 libraryFilterState:(id)a5;
- (PUSidebarViewController)initWithNavigationRoot:(id)a3 photoLibrary:(id)a4 libraryFilterState:(id)a5 options:(unint64_t)a6 additionalAssetsFilterPredicate:(id)a7 pickerAllPhotosVirtualCollection:(id)a8;
- (PXActionProviderDelegate)actionProviderDelegate;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXLibraryFilterState)libraryFilterState;
- (PXNavigationListItem)deferredNavigationItem;
- (PXNavigationListItem)fallbackNavigationItem;
- (PXProgrammaticNavigationDestination)currentNavigationDestination;
- (PXProgrammaticNavigationParticipant)navigationRoot;
- (PXSelectionContainerProvider)selectionProvider;
- (PXSidebarDataController)sidebarDataController;
- (PXSidebarOutlineSectionController)sidebarOutlineSectionController;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)_backNavigationRootItemForItem:(id)a3;
- (id)_collectionViewIndexPathForItemIdentifier:(id)a3;
- (id)_itemIndexPathForDestination:(id)a3;
- (id)_trailingSwipeActionConfigurationForIndexPath:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)collectionViewDropDelegate:(id)a3 collectionAtIndexPath:(id)a4;
- (id)generateLayout;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (unint64_t)options;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_createSharedAlbum;
- (void)_deleteItemTapped:(id)a3 sourceView:(id)a4 completion:(id)a5;
- (void)_handleDidSelectListItem:(id)a3 completionHandler:(id)a4;
- (void)_highlightNavigationDestination:(id)a3;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_navigateToDestinationForItem:(id)a3 sameItem:(BOOL)a4 completionHandler:(id)a5;
- (void)_performActionForType:(id)a3 completionHandler:(id)a4;
- (void)_triggerNavigationToDestination:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)_updateHeaderCell:(id)a3 forListItem:(id)a4;
- (void)_updateOutlineCell:(id)a3 forListItem:(id)a4;
- (void)_updateSelectedRowScrollToVisible:(BOOL)a3;
- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)configureDataSource;
- (void)configureViewHierarchy;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)navigateToFallbackForDestination:(id)a3;
- (void)newAlbum:(id)a3;
- (void)newFolder:(id)a3;
- (void)newSmartAlbum:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)outlineCell:(id)a3 updatedTitle:(id)a4 forItem:(id)a5;
- (void)pagingViewControllerDidUpdateItemList:(id)a3;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)ppt_runTabSwitchingTestWithName:(id)a3 options:(id)a4 delegate:(id)a5 completionHandler:(id)a6;
- (void)selectItemForDestination:(id)a3;
- (void)setActionProviderDelegate:(id)a3;
- (void)setAssetCollectionActionManager:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCurrentNavigationDestination:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDeferredNavigationItem:(id)a3;
- (void)setDropDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsUpdating:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setReorderController:(id)a3;
- (void)setSelectingAlreadySelectedIndexPath:(BOOL)a3;
- (void)setSidebarDataController:(id)a3;
- (void)setSidebarDataSectionEnablementController:(id)a3;
- (void)setSidebarOutlineSectionController:(id)a3;
- (void)setupDataSectionManagerWithLoadMode:(int64_t)a3;
- (void)sidebarOutlineSectionController:(id)a3 willApplySnapshotWithChangedItemsAfterChange:(id)a4 applyBlock:(id)a5;
- (void)splitViewControllerWillExpand:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUSidebarViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_deferredNavigationItem, 0);
  objc_storeStrong((id *)&self->_reorderController, 0);
  objc_storeStrong((id *)&self->_currentNavigationDestination, 0);
  objc_storeStrong((id *)&self->_dropDelegate, 0);
  objc_storeStrong((id *)&self->_sidebarDataController, 0);
  objc_storeStrong((id *)&self->_sidebarDataSectionEnablementController, 0);
  objc_storeStrong((id *)&self->_sidebarOutlineSectionController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_pickerAllPhotosVirtualCollection, 0);
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_navigationRoot, 0);
  objc_destroyWeak((id *)&self->_actionProviderDelegate);
}

- (void)setAssetCollectionActionManager:(id)a3
{
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setSelectingAlreadySelectedIndexPath:(BOOL)a3
{
  self->_selectingAlreadySelectedIndexPath = a3;
}

- (BOOL)selectingAlreadySelectedIndexPath
{
  return self->_selectingAlreadySelectedIndexPath;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setDeferredNavigationItem:(id)a3
{
}

- (PXNavigationListItem)deferredNavigationItem
{
  return self->_deferredNavigationItem;
}

- (void)setReorderController:(id)a3
{
}

- (PUSidebarReorderController)reorderController
{
  return self->_reorderController;
}

- (void)setCurrentNavigationDestination:(id)a3
{
}

- (PXProgrammaticNavigationDestination)currentNavigationDestination
{
  return self->_currentNavigationDestination;
}

- (void)setDropDelegate:(id)a3
{
}

- (PUCollectionsCollectionViewDropDelegate)dropDelegate
{
  return self->_dropDelegate;
}

- (void)setSidebarDataController:(id)a3
{
}

- (PXSidebarDataController)sidebarDataController
{
  return self->_sidebarDataController;
}

- (void)setSidebarDataSectionEnablementController:(id)a3
{
}

- (PUSidebarDataSectionEnablementController)sidebarDataSectionEnablementController
{
  return self->_sidebarDataSectionEnablementController;
}

- (void)setSidebarOutlineSectionController:(id)a3
{
}

- (PXSidebarOutlineSectionController)sidebarOutlineSectionController
{
  return self->_sidebarOutlineSectionController;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (PHAssetCollection)pickerAllPhotosVirtualCollection
{
  return self->_pickerAllPhotosVirtualCollection;
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXProgrammaticNavigationParticipant)navigationRoot
{
  return self->_navigationRoot;
}

- (void)setActionProviderDelegate:(id)a3
{
}

- (PXActionProviderDelegate)actionProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionProviderDelegate);
  return (PXActionProviderDelegate *)WeakRetained;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v7 = (void (**)(id, uint64_t, void))a5;
  PXLemonadeReroutedProgrammaticDestination();
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [(PUSidebarViewController *)self _highlightNavigationDestination:v24];
  v8 = [(PUSidebarViewController *)self splitViewController];
  v9 = [v8 viewControllerForColumn:2];

  v10 = objc_msgSend(v9, "px_navigationDestination");
  int v11 = [v24 isEquivalentToNavigationDestination:v10];

  if (v11)
  {
    id v12 = v9;
  }
  else
  {
    if (([v24 isLemonadeHome] & 1) != 0
      || [v24 isTargetingAsset] && (objc_msgSend(v24, "isTargetingAlbum") & 1) == 0)
    {
      v13 = [(PUSidebarViewController *)self navigationRoot];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v16 = [v13 lemonadeRootViewController];
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
    else
    {
      v13 = PXLemonadeViewControllerFactory();
      photoLibrary = self->_photoLibrary;
      v15 = [(PUSidebarViewController *)self px_splitViewController];
      uint64_t v16 = objc_msgSend(v13, "viewControllerForSidebarNavigationDestination:photoLibrary:sidebarVisible:", v24, photoLibrary, objc_msgSend(v15, "isSidebarVisible"));
    }
    id v12 = v9;
    if (v9 != (void *)v16)
    {
      if (objc_opt_respondsToSelector()) {
        v17 = (void *)v16;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;
      v19 = [(PUSidebarViewController *)self actionProviderDelegate];
      [v18 setActionProviderDelegate:v19];

      if (objc_opt_respondsToSelector()) {
        v20 = (void *)v16;
      }
      else {
        v20 = 0;
      }
      id v21 = v20;
      [v21 setPagingViewControllerDelegate:self];
      v22 = [(PUSidebarViewController *)self splitViewController];
      [v22 setViewController:0 forColumn:2];

      v23 = [(PUSidebarViewController *)self splitViewController];
      [v23 setViewController:v16 forColumn:2];

      id v12 = (id)v16;
    }
  }
  if ([v12 routingOptionsForDestination:v24] == 1) {
    [v12 navigateToDestination:v24 options:a4 completionHandler:v7];
  }
  else {
    v7[2](v7, 1, 0);
  }
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4 = a3;
  if ([v4 shouldExcludeSidebar])
  {
    unint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = PXLemonadeReroutedProgrammaticDestination();

    if ([(PUSidebarViewController *)self _hasSidebarItemForDestination:v6])
    {
      unint64_t v5 = 1;
    }
    else
    {
      v7 = PXLemonadeViewControllerFactory();
      unint64_t v5 = [v7 sidebarRoutingOptionsForDestination:v6];
    }
    id v4 = (id)v6;
  }

  return v5;
}

- (void)pagingViewControllerDidUpdateItemList:(id)a3
{
  id v6 = a3;
  id v4 = [(PUSidebarViewController *)self sidebarDataController];
  if ([v4 isChangeProcessingPaused])
  {
    uint64_t v5 = [v6 pagingViewControllerNumberOfItems];

    if (v5) {
      goto LABEL_6;
    }
    id v4 = [(PUSidebarViewController *)self fallbackNavigationItem];
    if (v4) {
      [(PUSidebarViewController *)self _navigateToDestinationForItem:v4 sameItem:0 completionHandler:0];
    }
  }

LABEL_6:
}

- (void)_createSharedAlbum
{
  id v3 = objc_alloc(MEMORY[0x1E4F90098]);
  photoLibrary = self->_photoLibrary;
  uint64_t v5 = [MEMORY[0x1E4F908D0] defaultPresenterWithViewController:self];
  id v6 = (id)[v3 initWithPhotoLibrary:photoLibrary presentationEnvironment:v5];

  [v6 performActionWithCompletionHandler:0];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXLibraryFilterStateObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUSidebarViewController.m" lineNumber:1211 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PUSidebarViewController *)self setupDataSectionManagerWithLoadMode:0];
    id v9 = v11;
  }
}

- (void)ppt_runTabSwitchingTestWithName:(id)a3 options:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v13) {
    id v13 = &__block_literal_global_318;
  }
  v15 = (void (**)(void *, void))_Block_copy(v13);
  uint64_t v16 = [(PUSidebarViewController *)self collectionView];
  v17 = [v11 objectForKeyedSubscript:@"tab"];
  if (([v17 isEqualToString:@"all"] & 1) == 0)
  {
    v19 = @"Sidebar currently only supports switching to all tabs";
    goto LABEL_7;
  }
  uint64_t v18 = [v16 numberOfItemsInSection:0];
  if (v18 <= 1)
  {
    v19 = @"couldn't find sidebar items to cycle through";
LABEL_7:
    [v12 failedTest:v10 withFailureFormat:v19];
    v15[2](v15, 0);
    goto LABEL_22;
  }
  uint64_t v20 = v18;
  v30 = v12;
  v31 = v17;
  v29 = v15;
  v33 = v11;
  v32 = v16;
  v34 = [v16 indexPathsForSelectedItems];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v22 = 0;
  uint64_t v23 = 0;
  while (1)
  {
    id v24 = [MEMORY[0x1E4F28D58] indexPathForItem:v23 inSection:0];
    v25 = [(PUSidebarViewController *)self dataSource];
    v26 = [v25 itemIdentifierForIndexPath:v24];

    v27 = [v26 collection];

    if (!v27) {
      break;
    }
    [v21 addObject:v26];
    if (!v22)
    {
      if ([v34 containsObject:v24]) {
        id v22 = v26;
      }
      else {
        id v22 = 0;
      }
    }

    if (v20 == ++v23)
    {
      if (v22) {
        goto LABEL_16;
      }
      goto LABEL_19;
    }
  }

  if (v22) {
    goto LABEL_16;
  }
LABEL_19:
  id v22 = [v21 firstObject];
LABEL_16:
  id v11 = v33;
  if ((unint64_t)[v21 count] > 1)
  {
    v28 = [v33 objectForKeyedSubscript:@"iterations"];
    [v28 integerValue];

    [v30 startedTest:v10];
    [v21 count];
    id v39 = v30;
    id v40 = v10;
    id v41 = v21;
    v15 = v29;
    v42 = v29;
    id v35 = v22;
    id v12 = v30;
    id v36 = v39;
    id v11 = v33;
    id v37 = v40;
    v38 = v42;
    PXIterateAsynchronously();
  }
  else
  {
    id v12 = v30;
    [v30 failedTest:v10 withFailureFormat:@"couldn't find enough sidebar items to cycle through"];
    v15 = v29;
    v29[2](v29, 0);
  }

  v17 = v31;
  uint64_t v16 = v32;
LABEL_22:
}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[8];
  uint64_t v5 = v3;
  id v4 = v3;
  PXIterateAsynchronously();
}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_8(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_9;
  v4[3] = &unk_1E5F26E28;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 _handleDidSelectListItem:v3 completionHandler:v4];
}

uint64_t __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedTest:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 index];
  uint64_t v5 = *(void *)(a1 + 72);
  if (v4 >= v5) {
    uint64_t v6 = 2 * v5 - v4 - 2;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v6 >= 1) {
    [*(id *)(a1 + 32) startedSubTest:@"SwitchTab" forTest:*(void *)(a1 + 40)];
  }
  BOOL v7 = v6 > 0;
  id v8 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v6];
  id v9 = *(void **)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_4;
  v12[3] = &unk_1E5F26F40;
  BOOL v17 = v7;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 64);
  id v15 = v3;
  id v16 = v10;
  id v11 = v3;
  [v9 _handleDidSelectListItem:v8 completionHandler:v12];
}

uint64_t __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F905E0] sharedScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_5;
  v9[3] = &unk_1E5F26F18;
  char v15 = *(unsigned char *)(a1 + 64);
  id v10 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v16 = a2;
  id v11 = v7;
  id v12 = v5;
  id v14 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  [v6 scheduleTaskAfterCATransactionCommits:v9];
}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) finishedSubTest:@"SwitchTab" forTest:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 73))
  {
    dispatch_time_t v2 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_6;
    block[3] = &unk_1E5F2ED10;
    id v5 = *(id *)(a1 + 56);
    dispatch_after(v2, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [*(id *)(a1 + 32) failedTest:*(void *)(a1 + 40), @"Error when changing sidebar item:%@", *(void *)(a1 + 48) withFailureFormat];
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
}

uint64_t __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  id v4 = a3;
  id v6 = [(PUSidebarViewController *)self collectionView];
  id v5 = [v4 userInfo];

  [(PUSidebarViewController *)self px_safeAreaInsets];
  objc_msgSend(v6, "px_adjustInsetsForKeyboardInfo:safeAreaInsets:", v5);
}

- (void)navigateToFallbackForDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(PUSidebarViewController *)self photoLibrary];
  objc_msgSend(v5, "px_virtualCollections");
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v4 collection];

  id v7 = [v12 allAlbumsCollection];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = [v12 rootAlbumCollectionList];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithObject:v9 revealMode:0];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithObject:v9 revealMode:0 sidebarNavigationBackButtonRootDestination:v10];
    [(PUSidebarViewController *)self _triggerNavigationToDestination:v11 animated:0 completionHandler:0];
  }
}

- (void)splitViewControllerWillExpand:(id)a3
{
  id v5 = [(PUSidebarViewController *)self navigationRoot];
  id v4 = objc_msgSend(v5, "px_navigationDestination");
  [(PUSidebarViewController *)self navigateToFallbackForDestination:v4];
}

- (void)sidebarOutlineSectionController:(id)a3 willApplySnapshotWithChangedItemsAfterChange:(id)a4 applyBlock:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  uint64_t v11 = [(PUSidebarViewController *)self deferredNavigationItem];
  if (v11)
  {
    id v12 = (void *)v11;
    v10[2](v10);
  }
  else
  {
    id v13 = [(PUSidebarViewController *)self collectionView];
    id v14 = [v13 indexPathsForSelectedItems];
    char v15 = [v14 firstObject];

    if (v15)
    {
      char v16 = [(PUSidebarViewController *)self dataSource];
      id v12 = [v16 itemIdentifierForIndexPath:v15];
    }
    else
    {
      id v12 = 0;
    }

    v10[2](v10);
    if (!v12)
    {
      v19 = 0;
      goto LABEL_30;
    }
  }
  BOOL v17 = [(PUSidebarViewController *)self dataSource];
  uint64_t v18 = [v17 indexPathForItemIdentifier:v12];

  if (v18)
  {
    v19 = 0;
  }
  else
  {
    id v47 = v9;
    id v48 = v8;
    uint64_t v20 = [v12 identifier];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v21 = [(PUSidebarViewController *)self dataSource];
    id v22 = [v21 snapshot];
    uint64_t v23 = [v22 itemIdentifiers];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v50;
      v46 = v10;
LABEL_11:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v50 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v49 + 1) + 8 * v27);
        v29 = objc_msgSend(v28, "identifier", v46);
        char v30 = [v29 isEqualToString:v20];

        if (v30) {
          break;
        }
        if (v25 == ++v27)
        {
          uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v57 count:16];
          id v10 = v46;
          if (v25) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
      v31 = [(PUSidebarViewController *)self dataSource];
      uint64_t v18 = [v31 indexPathForItemIdentifier:v28];

      id v10 = v46;
      if (!v18) {
        goto LABEL_20;
      }
      v19 = 0;
      id v8 = v48;
    }
    else
    {
LABEL_17:

LABEL_20:
      v32 = PLSidebarGetLog();
      id v8 = v48;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        id v35 = [v12 title];
        *(_DWORD *)buf = 138412546;
        v54 = v34;
        __int16 v55 = 2112;
        v56 = v35;
        _os_log_impl(&dword_1AE9F8000, v32, OS_LOG_TYPE_DEFAULT, "Selected item (%@ - %@) was no longer found after the sidebar contents were updated. Falling back to default selection", buf, 0x16u);
      }
      id v36 = [(PUSidebarViewController *)self fallbackNavigationItem];
      v19 = v36;
      if (v36) {
        id v37 = v36;
      }

      uint64_t v18 = 0;
    }
    id v9 = v47;
  }
  v38 = [(PUSidebarViewController *)self deferredNavigationItem];

  uint64_t v39 = 0;
  if (v38 && v18)
  {
    [(PUSidebarViewController *)self setDeferredNavigationItem:0];
    uint64_t v39 = 4;
  }
  id v40 = [(PUSidebarViewController *)self collectionView];
  [v40 selectItemAtIndexPath:v18 animated:0 scrollPosition:v39];

LABEL_30:
  id v41 = [(PUSidebarViewController *)self dataSource];
  v42 = [v41 snapshot];

  id v43 = v42;
  v44 = PXFilter();
  [v43 reloadItemsWithIdentifiers:v44];
  v45 = [(PUSidebarViewController *)self dataSource];
  objc_msgSend(v45, "applySnapshot:animatingDifferences:", v43, objc_msgSend(v8, "animateDataSourceUpdates"));

  if (v19) {
    [(PUSidebarViewController *)self _navigateToDestinationForItem:v19 sameItem:0 completionHandler:0];
  }
}

BOOL __115__PUSidebarViewController_sidebarOutlineSectionController_willApplySnapshotWithChangedItemsAfterChange_applyBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) indexOfItemIdentifier:a2] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)selectItemForDestination:(id)a3
{
  id v4 = a3;
  if (![(PUSidebarViewController *)self isUpdating]) {
    [(PUSidebarViewController *)self _highlightNavigationDestination:v4];
  }
}

- (void)_highlightNavigationDestination:(id)a3
{
  id v5 = a3;
  id v4 = [(PUSidebarViewController *)self currentNavigationDestination];
  if (([v4 isEqual:v5] & 1) == 0)
  {
    [(PUSidebarViewController *)self setCurrentNavigationDestination:v5];
    [(PUSidebarViewController *)self _updateSelectedRowScrollToVisible:1];
  }
}

- (void)newFolder:(id)a3
{
}

- (void)newSmartAlbum:(id)a3
{
}

- (void)newAlbum:(id)a3
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ([(PUSidebarViewController *)self options]) {
    goto LABEL_13;
  }
  if (sel_newAlbum_ != a3 && sel_newSharedAlbum_ != a3 && sel_newFolder_ != a3)
  {
    if (sel_newSmartAlbum_ != a3)
    {
      v14.receiver = self;
      v14.super_class = (Class)PUSidebarViewController;
      unsigned __int8 v12 = [(PUSidebarViewController *)&v14 canPerformAction:a3 withSender:v6];
      goto LABEL_14;
    }
LABEL_13:
    unsigned __int8 v12 = 0;
    goto LABEL_14;
  }
  id v9 = [(PUSidebarViewController *)self splitViewController];
  id v10 = [v9 viewIfLoaded];
  uint64_t v11 = [v10 window];
  unsigned __int8 v12 = v11 != 0;

LABEL_14:
  return v12;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  return (id)[MEMORY[0x1E4F908D0] defaultPresenterWithViewController:self];
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)MEMORY[0x1E4F90368];
    id v6 = v8;
    id v7 = [v5 moviePresenterWithPresentingViewController:self];
    [v7 presentMovieViewControllerForAssetCollection:v6 keyAssetFetchResult:0 preferredTransitionType:1];
  }
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 1:
      unsigned __int8 v12 = PXAssertGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)char v16 = 0;
        _os_log_fault_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_FAULT, "Navigation-type transition not supported anymore, falling back gracefully", v16, 2u);
      }

      BOOL v11 = [(PUSidebarViewController *)self actionPerformer:v9 transitionToViewController:v10 transitionType:2];
      break;
    case 2:
      id v13 = [(PUSidebarViewController *)self navigationController];
      BOOL v11 = 1;
      [v13 presentViewController:v10 animated:1 completion:0];

      break;
    case 0:
      char v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PUSidebarViewController.m" lineNumber:937 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      BOOL v11 = 0;
      break;
  }

  return v11;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = [(PUSidebarViewController *)self splitViewController];
  [v7 dismissViewControllerAnimated:1 completion:v6];

  return 1;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(PUSidebarViewController *)self splitViewController];
  [v6 presentViewController:v5 animated:1 completion:0];

  return 1;
}

- (id)collectionViewDropDelegate:(id)a3 collectionAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PUSidebarViewController *)self dataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  id v8 = [v7 collection];

  return v8;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PUSidebarViewController *)self reorderController];
  id v10 = [v9 targetIndexPathForMoveFromItemAtIndexPath:v8 toProposedIndexPath:v7];

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [(PUSidebarViewController *)self dropDelegate];
  char v12 = [v11 collectionView:v10 shouldSpringLoadItemAtIndexPath:v9 withContext:v8];

  return v12;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(PUSidebarViewController *)self dataSource];
  id v7 = [(id)v6 itemIdentifierForIndexPath:v5];

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  return (v6 & 1) == 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUSidebarViewController *)self dataSource];
  id v9 = [v8 itemIdentifierForIndexPath:v7];

  if ([v6 isEditing])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = [v9 isGroup] ^ 1;
  }
  BOOL v11 = [MEMORY[0x1E4F90308] sharedInstance];
  if ([v11 enableSidebarHeaderSelection]
    && ![(PUSidebarViewController *)self _isPhotosPicker])
  {
    if ([v6 isEditing])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_7;
      }
    }
    else
    {
      if (([v9 isGroup] & 1) == 0) {
        goto LABEL_7;
      }
      objc_super v14 = [v9 collection];

      if (v14) {
        goto LABEL_7;
      }
    }
LABEL_13:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  char v12 = [v6 indexPathsForSelectedItems];
  -[PUSidebarViewController setSelectingAlreadySelectedIndexPath:](self, "setSelectingAlreadySelectedIndexPath:", [v12 containsObject:v7]);

  BOOL v13 = 1;
LABEL_14:

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PUSidebarViewController *)self dataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  [(PUSidebarViewController *)self _handleDidSelectListItem:v7 completionHandler:0];
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = [a4 identifier];
  if (v8)
  {
    [v7 setPreferredCommitStyle:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __100__PUSidebarViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v9[3] = &unk_1E5F2ECC8;
    void v9[4] = self;
    id v10 = v8;
    [v7 addCompletion:v9];
  }
}

uint64_t __100__PUSidebarViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidSelectListItem:*(void *)(a1 + 40) completionHandler:0];
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PUSidebarViewController *)self dataSource];
  id v10 = [v9 itemIdentifierForIndexPath:v8];

  BOOL v11 = [v10 collection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    char v13 = [(PUSidebarViewController *)self options];
    uint64_t v14 = [v12 assetCollectionSubtype];
    uint64_t v15 = [v12 assetCollectionSubtype];
    if ((v13 & 1) == 0)
    {
      uint64_t v16 = v15;
      int v17 = [(PUSidebarViewController *)self isEditing];
      BOOL v18 = v14 == 2 || v16 == 101;
      BOOL v19 = v18;
      if (!v17 && v19)
      {
        uint64_t v20 = (void *)MEMORY[0x1E4FB1678];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
        v32[3] = &unk_1E5F26EA0;
        id v33 = v12;
        v34 = self;
        id v21 = v12;
        id v22 = [v20 configurationWithIdentifier:v10 previewProvider:0 actionProvider:v32];

LABEL_16:
        goto LABEL_19;
      }
    }
  }
  else if ([v11 canContainCollections])
  {
    id v21 = [v7 cellForItemAtIndexPath:v8];
    uint64_t v23 = (void *)MEMORY[0x1E4F908D0];
    uint64_t v24 = [(PUSidebarViewController *)self splitViewController];
    uint64_t v25 = [v23 popoverPresenterWithViewController:v24 sourceItem:v21];

    uint64_t v26 = [(PUSidebarViewController *)self undoManager];
    id v22 = PXCollectionActionMenuForCollection();

    if (v22)
    {
      uint64_t v27 = (void *)MEMORY[0x1E4FB1678];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3;
      v30[3] = &unk_1E5F26EC8;
      id v31 = v22;
      id v28 = v22;
      id v22 = [v27 configurationWithIdentifier:v10 previewProvider:0 actionProvider:v30];
    }
    goto LABEL_16;
  }
  id v22 = 0;
LABEL_19:

  return v22;
}

id __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = PXPhotosViewConfigurationForAssetCollection();
  id v3 = [v2 assetCollectionActionManager];
  id v4 = [v2 dataSourceManager];
  [v4 performChanges:&__block_literal_global_304_40781];
  [v3 setPerformerDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setAssetCollectionActionManager:v3];
  id v5 = [MEMORY[0x1E4F8FF70] contextMenuWithActionManager:v3 overrideActions:0];

  return v5;
}

id __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 ensureStartingSectionHasContent];
}

- (void)outlineCell:(id)a3 updatedTitle:(id)a4 forItem:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 collection];
  if ([v9 canPerformEditOperation:7])
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F90608]) initWithCollection:v9 title:v7];
    BOOL v11 = [(PUSidebarViewController *)self undoManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__PUSidebarViewController_outlineCell_updatedTitle_forItem___block_invoke;
    v19[3] = &unk_1E5F26E78;
    id v12 = v9;
    id v20 = v12;
    id v21 = v7;
    id v22 = self;
    [v10 executeWithUndoManager:v11 completionHandler:v19];

    char v13 = (void *)MEMORY[0x1E4F56658];
    uint64_t v25 = *MEMORY[0x1E4F56548];
    uint64_t v14 = v25;
    id v26 = v12;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [v13 sendEvent:@"com.apple.photos.CPAnalytics.albumRenamed" withPayload:v15];

    uint64_t v16 = (void *)MEMORY[0x1E4F56658];
    uint64_t v23 = v14;
    id v24 = v12;
    int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v16 sendEvent:@"com.apple.photos.CPAnalytics.albumRenamedFromSidebar" withPayload:v17];
  }
  else
  {
    BOOL v18 = PLUIGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      id v28 = v9;
      __int16 v29 = 2113;
      id v30 = v8;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_ERROR, "Renaming collection %{private}@ of item %{private}@ is not supported", buf, 0x16u);
    }

    id v10 = [(PUSidebarViewController *)self sidebarOutlineSectionController];
    objc_msgSend(v10, "reloadFromDataControllerApplyAnimated:onQueue:", objc_msgSend(v10, "animateDataSourceUpdates"), 0);
  }
}

void __60__PUSidebarViewController_outlineCell_updatedTitle_forItem___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138478339;
      uint64_t v11 = v7;
      __int16 v12 = 2113;
      uint64_t v13 = v8;
      __int16 v14 = 2113;
      id v15 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to rename collection %{private}@ to %{private}@ with error %{private}@", (uint8_t *)&v10, 0x20u);
    }

    id v9 = [*(id *)(a1 + 48) sidebarOutlineSectionController];
    objc_msgSend(v9, "reloadFromDataControllerApplyAnimated:onQueue:", objc_msgSend(v9, "animateDataSourceUpdates"), 0);
  }
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v11 = a3;
  id v7 = *a5;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 window];

    if (!v9)
    {
      int v10 = [(PUSidebarViewController *)self splitViewController];
      [v10 showColumn:0];
    }
  }
}

- (void)_deleteItemTapped:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v16 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v16 collection];
  if (!v11)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUSidebarViewController.m", 754, @"Expected a no nil collection on item %@", v16 object file lineNumber description];
  }
  __int16 v12 = [(PUSidebarViewController *)self undoManager];
  uint64_t v13 = PXCollectionDeletionAlertControllerForCollection();

  __int16 v14 = [v13 popoverPresentationController];
  [v14 setSourceView:v10];

  [v14 setDelegate:self];
  [(PUSidebarViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (id)_trailingSwipeActionConfigurationForIndexPath:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PUSidebarViewController *)self options])
  {
    uint64_t v13 = 0;
  }
  else
  {
    id v5 = [(PUSidebarViewController *)self dataSource];
    id v6 = [v5 itemIdentifierForIndexPath:v4];

    if ([v6 isDeletable])
    {
      id v7 = [v6 collection];
      uint64_t v8 = PXCollectionDeleteConfirmationTitle();

      id v9 = (void *)MEMORY[0x1E4FB1688];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      int v17 = __73__PUSidebarViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke;
      BOOL v18 = &unk_1E5F26E50;
      BOOL v19 = self;
      id v20 = v6;
      id v10 = [v9 contextualActionWithStyle:1 title:v8 handler:&v15];
      id v11 = (void *)MEMORY[0x1E4FB1CC0];
      v21[0] = v10;
      __int16 v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 1, v15, v16, v17, v18, v19);
      uint64_t v13 = [v11 configurationWithActions:v12];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  return v13;
}

void __73__PUSidebarViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PUSidebarViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke_2;
  v10[3] = &unk_1E5F2D990;
  id v11 = v6;
  id v9 = v6;
  [v8 _deleteItemTapped:v7 sourceView:a3 completion:v10];
}

uint64_t __73__PUSidebarViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUSidebarViewController;
  [(PUSidebarViewController *)&v18 setEditing:a3 animated:1];
  uint64_t v8 = [(PUSidebarViewController *)self collectionView];
  if (v5)
  {
    if ([(PUSidebarViewController *)self options])
    {
      int v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"PUSidebarViewController.m" lineNumber:713 description:@"Editing should not be allowed."];
    }
    id v9 = [PUSidebarReorderController alloc];
    id v10 = [(PUSidebarViewController *)self dataSource];
    id v11 = [(PUSidebarViewController *)self sidebarOutlineSectionController];
    __int16 v12 = [(PUSidebarReorderController *)v9 initWithDataSource:v10 outlineSectionController:v11];
  }
  else
  {
    __int16 v12 = 0;
  }
  [(PUSidebarViewController *)self setReorderController:v12];
  [v8 setEditing:v5];
  if (v5)
  {
    uint64_t v13 = +[PUTabbedLibrarySettings sharedInstance];
    int v14 = [v13 sidebarEditAutoExpandToEditableItem];

    if (v14)
    {
      uint64_t v15 = [(PUSidebarViewController *)self sidebarOutlineSectionController];
      id v16 = (id)[v15 expandItemsToRevealFirstEditableItemIfNeededAnimated:v4];
    }
  }
  else
  {
    [(PUSidebarViewController *)self _updateSelectedRowScrollToVisible:0];
  }
}

- (void)validateCommand:(id)a3
{
  id v6 = a3;
  if ((char *)[v6 action] == sel_newAlbum_)
  {
    id v3 = (id)*MEMORY[0x1E4F90E38];
    if (v3)
    {
      BOOL v4 = v3;
      BOOL v5 = [MEMORY[0x1E4F90470] localizedTitleForActionType:v3 collectionList:0];
      [v6 setDiscoverabilityTitle:v5];
    }
  }
}

- (PXSelectionContainerProvider)selectionProvider
{
  dispatch_time_t v2 = [(PUSidebarViewController *)self splitViewController];
  id v3 = PXSelectionProviderForViewController();

  return (PXSelectionContainerProvider *)v3;
}

- (void)_performActionForType:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUSidebarViewController.m", 638, @"Invalid parameter not satisfying: %@", @"actionType != nil" object file lineNumber description];
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F90E50]])
  {
    if (v8)
    {
      objc_super v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"PUSidebarViewController.m", 641, @"Invalid parameter not satisfying: %@", @"completionHandler == nil" object file lineNumber description];
    }
    [(PUSidebarViewController *)self _createSharedAlbum];
  }
  else
  {
    if (v8) {
      id v9 = v8;
    }
    else {
      id v9 = &__block_literal_global_271;
    }
    id v10 = _Block_copy(v9);

    [(PUSidebarViewController *)self _updateSelectedRowScrollToVisible:0];
    id v11 = objc_alloc(MEMORY[0x1E4F90470]);
    __int16 v12 = [(PUSidebarViewController *)self photoLibrary];
    uint64_t v13 = objc_msgSend(v12, "px_virtualCollections");
    int v14 = [v13 rootAlbumCollectionList];
    uint64_t v15 = (void *)[v11 initWithActionType:v7 collectionList:v14];

    if (!v15)
    {
      BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"PUSidebarViewController.m" lineNumber:679 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    [v15 setDelegate:self];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__PUSidebarViewController__performActionForType_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5F26E28;
    id v21 = v15;
    id v22 = self;
    id v8 = v10;
    id v23 = v8;
    id v16 = v15;
    [v16 performActionWithCompletionHandler:v20];
  }
}

void __67__PUSidebarViewController__performActionForType_completionHandler___block_invoke_2(id *a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a1[4] createdCollection];
  id v7 = (void *)v6;
  if (!a2 || !v6)
  {
    id v11 = [v5 domain];
    if ([v11 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v12 = [v5 code];

      if (v12 == 3072)
      {
        uint64_t v13 = PLSidebarGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          int v14 = "Album creation was cancelled by user";
          uint64_t v15 = v13;
          os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
          uint32_t v17 = 2;
LABEL_12:
          _os_log_impl(&dword_1AE9F8000, v15, v16, v14, buf, v17);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v13 = PLSidebarGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v5;
      int v14 = "Failed to perform album creation with error \"%@\".";
      uint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 12;
      goto LABEL_12;
    }
LABEL_13:

    [a1[5] _updateSelectedRowScrollToVisible:0];
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_16;
  }
  id v8 = +[PUTabbedLibrarySettings sharedInstance];
  int v9 = [v8 sidebarHideNavBackButtonForSelectedItem];

  if (v9) {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithObject:v7 revealMode:0];
  }
  else {
    id v10 = 0;
  }
  objc_super v18 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithObject:v7 revealMode:1 sidebarNavigationBackButtonRootDestination:v10];
  BOOL v19 = [a1[5] navigationRoot];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__PUSidebarViewController__performActionForType_completionHandler___block_invoke_3;
  v20[3] = &unk_1E5F26E00;
  void v20[4] = a1[5];
  id v21 = v7;
  id v22 = a1[6];
  char v23 = a2;
  [v19 navigateToDestination:v18 options:0 completionHandler:v20];

LABEL_16:
}

void __67__PUSidebarViewController__performActionForType_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 != 1)
  {
    uint64_t v6 = PLSidebarGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to navigate to a created album creation with Error \"%@\".", (uint8_t *)&v8, 0xCu);
    }
  }
  id v7 = PXNavigationListItemWithObject();
  [*(id *)(a1 + 32) setDeferredNavigationItem:v7];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_triggerNavigationToDestination:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(PUSidebarViewController *)self setIsUpdating:1];
  PXCATransactionSetShouldLoadContentImmediately();
  objc_initWeak(&location, self);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  BOOL v19 = __86__PUSidebarViewController__triggerNavigationToDestination_animated_completionHandler___block_invoke;
  id v20 = &unk_1E5F26DD8;
  id v10 = v8;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  objc_copyWeak(&v23, &location);
  uint64_t v12 = _Block_copy(&v17);
  uint64_t v13 = [(PUSidebarViewController *)self navigationRoot];
  int v14 = v13;
  if (v6) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 0;
  }
  [v13 navigateToDestination:v10 options:v15 completionHandler:v12];

  os_log_type_t v16 = [(PUSidebarViewController *)self px_splitViewController];
  [v16 dismissPrimaryColumnIfOverlay];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __86__PUSidebarViewController__triggerNavigationToDestination_animated_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 != 1)
  {
    BOOL v6 = PLSidebarGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412802;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = a2;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Sidebar navigation to destination %@failed with result %ld error %@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, a2 == 1, v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setIsUpdating:0];
}

- (void)_navigateToDestinationForItem:(id)a3 sameItem:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (a5) {
    id v10 = a5;
  }
  else {
    id v10 = &__block_literal_global_240_40824;
  }
  uint64_t v11 = (void (**)(void *, void, void *))_Block_copy(v10);
  uint64_t v12 = 3;
  if (!v6) {
    uint64_t v12 = 0;
  }
  uint64_t v40 = v12;
  uint64_t v13 = [v9 collection];
  __int16 v14 = [v9 destination];
  id v15 = [MEMORY[0x1E4F90308] sharedInstance];
  if ([v15 enableSidebarHeaderSelection]
    && ![(PUSidebarViewController *)self _isPhotosPicker])
  {
    int v16 = 1;
    if (v14)
    {
LABEL_17:
      id v17 = v13;
      goto LABEL_34;
    }
  }
  else
  {
    int v16 = [v9 isGroup] ^ 1;
    if (v14) {
      goto LABEL_17;
    }
  }
  if (!v13) {
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
      id v36 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v36);
      id v37 = objc_msgSend(v17, "px_descriptionForAssertionMessage");
      [v39 handleFailureInMethod:a2, self, @"PUSidebarViewController.m", 572, @"%@ should be an instance inheriting from %@, but it is %@", @"collection", v38, v37 object file lineNumber description];
    }
    uint64_t v18 = [v17 transientIdentifier];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F91068]];

    if (v19)
    {
      __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithType:21 revealMode:v40];
      goto LABEL_34;
    }
  }
  if (!v16) {
    goto LABEL_35;
  }
  id v20 = [v9 collection];
  int v21 = objc_msgSend(v20, "px_isMyAlbumsVirtualCollection");

  if (v21)
  {
    id v22 = [v13 photoLibrary];
    id v23 = objc_msgSend(v22, "px_virtualCollections");
    uint64_t v24 = [v23 rootAlbumCollectionList];
LABEL_23:
    id v17 = (id)v24;

    goto LABEL_25;
  }
  id v25 = [v9 collection];
  int v26 = objc_msgSend(v25, "px_isSharedAlbumsVirtualCollection");

  if (v26)
  {
    id v22 = [v13 photoLibrary];
    id v23 = objc_msgSend(v22, "px_virtualCollections");
    uint64_t v24 = [v23 sharedAlbumsCollectionList];
    goto LABEL_23;
  }
  id v17 = v13;
LABEL_25:
  uint64_t v27 = [v9 collection];
  if (objc_msgSend(v27, "px_isMyAlbumsVirtualCollection"))
  {
  }
  else
  {
    id v28 = [v9 collection];
    int v29 = objc_msgSend(v28, "px_isSharedAlbumsVirtualCollection");

    if (!v29)
    {
      uint64_t v31 = [(PUSidebarViewController *)self _backNavigationRootItemForItem:v9];
      v32 = [v31 collection];

      if (v32) {
        id v30 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithObject:v32 revealMode:0];
      }
      else {
        id v30 = 0;
      }

      goto LABEL_33;
    }
  }
  id v30 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithObject:v17 revealMode:0];
LABEL_33:
  __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithObject:v17 revealMode:v40 sidebarNavigationBackButtonRootDestination:v30];

LABEL_34:
  uint64_t v13 = v17;
  if (v14)
  {
LABEL_37:
    [(PUSidebarViewController *)self _triggerNavigationToDestination:v14 animated:v6 completionHandler:v11];
    goto LABEL_41;
  }
LABEL_35:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = objc_alloc(MEMORY[0x1E4F905E8]);
    v34 = [v9 importSource];
    __int16 v14 = (void *)[v33 initWithImportSource:v34 revealMode:v40];

    if (v14) {
      goto LABEL_37;
    }
  }
  id v35 = PLSidebarGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v13;
    _os_log_impl(&dword_1AE9F8000, v35, OS_LOG_TYPE_ERROR, "Sidebar navigation failed to create destination for collection %@", buf, 0xCu);
  }

  __int16 v14 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", *MEMORY[0x1E4F91328], -1, @"Sidebar navigation failed to create destination for collection");
  v11[2](v11, 0, v14);
LABEL_41:
}

- (void)_handleDidSelectListItem:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v8 actionType];
    [(PUSidebarViewController *)self _performActionForType:v7 completionHandler:v6];

    id v6 = (id)v7;
  }
  else
  {
    [(PUSidebarViewController *)self _navigateToDestinationForItem:v8 sameItem:[(PUSidebarViewController *)self selectingAlreadySelectedIndexPath] completionHandler:v6];
  }
}

- (PXNavigationListItem)fallbackNavigationItem
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  BOOL v4 = [(PUSidebarViewController *)self dataSource];
  id v5 = [v4 itemIdentifierForIndexPath:v3];

  return (PXNavigationListItem *)v5;
}

- (id)_backNavigationRootItemForItem:(id)a3
{
  id v4 = a3;
  id v5 = +[PUTabbedLibrarySettings sharedInstance];
  int v6 = [v5 sidebarHideNavBackButtonForSelectedItem];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    id v8 = [(PUSidebarViewController *)self sidebarOutlineSectionController];
    id v9 = [v8 currentSectionSnapshot];

    id v10 = v4;
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      while (![v11 isGroup])
      {
        id v7 = v11;

        uint64_t v11 = [v9 parentOfChild:v7];

        uint64_t v12 = v7;
        if (!v11) {
          goto LABEL_10;
        }
      }
      id v7 = v12;
LABEL_10:
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (void)_updateSelectedRowScrollToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = +[PUTabbedLibrarySettings sharedInstance];
  int v6 = [(PUSidebarViewController *)self currentNavigationDestination];
  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F905E8]);
    id v8 = [(PUSidebarViewController *)self photoLibrary];
    id v9 = objc_msgSend(v8, "px_virtualCollections");
    id v10 = [v9 momentsCollection];
    int v6 = (void *)[v7 initWithObject:v10 revealMode:1];
    [(PUSidebarViewController *)self setCurrentNavigationDestination:v6];
  }
  uint64_t v11 = [(PUSidebarViewController *)self _itemIndexPathForDestination:v6];
  uint64_t v12 = [(PUSidebarViewController *)self collectionView];
  uint64_t v13 = [v12 indexPathsForSelectedItems];
  __int16 v14 = v13;
  if (v11) {
    int v15 = [v13 containsObject:v11] ^ 1;
  }
  else {
    int v15 = 1;
  }
  HIDWORD(v41) = v15;
  if (!v3) {
    goto LABEL_12;
  }
  if (![v5 sidebarScrollSelectedItemToCenter]) {
    goto LABEL_12;
  }
  if (!v11) {
    goto LABEL_13;
  }
  if (![v5 sidebarOnlyScrollOffscreenItemOnScreen]) {
    goto LABEL_13;
  }
  uint64_t v16 = [v12 cellForItemAtIndexPath:v11];
  if (!v16) {
    goto LABEL_13;
  }
  id v17 = (void *)v16;
  [v12 bounds];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  [v17 frame];
  v49.origin.x = v26;
  v49.origin.y = v27;
  v49.size.width = v28;
  v49.size.height = v29;
  v48.origin.x = v19;
  v48.origin.y = v21;
  v48.size.width = v23;
  v48.size.height = v25;
  BOOL v30 = CGRectContainsRect(v48, v49);

  if (v30)
  {
LABEL_12:
    LODWORD(v41) = 0;
    uint64_t v39 = 0;
  }
  else
  {
LABEL_13:
    LODWORD(v41) = 1;
    uint64_t v39 = 2;
  }
  uint64_t v31 = v5;
  uint64_t v32 = objc_msgSend(v5, "sidebarAnimateSelectionUpdates", v39);
  id v33 = (void *)[v14 mutableCopy];
  [v33 removeObject:v11];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v34 = v33;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v43 != v37) {
          objc_enumerationMutation(v34);
        }
        [v12 deselectItemAtIndexPath:*(void *)(*((void *)&v42 + 1) + 8 * i) animated:v32];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v36);
  }

  if (![v12 isEditing] && v41) {
    [v12 selectItemAtIndexPath:v11 animated:v32 scrollPosition:v40];
  }
}

- (BOOL)_hasSidebarItemForDestination:(id)a3
{
  BOOL v3 = [(PUSidebarViewController *)self _itemIndexPathForDestination:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_itemIndexPathForDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(PUSidebarViewController *)self photoLibrary];
  id v6 = v4;
  id v7 = objc_msgSend(v5, "px_virtualCollections");
  id v8 = 0;
  switch([v6 type])
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      uint64_t v9 = [v7 photosCollection];
      goto LABEL_3;
    case 8:
    case 17:
      id v8 = [v6 collection];
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v17 = [MEMORY[0x1E4F28B00] currentHandler];
          double v18 = objc_msgSend(NSString, "stringWithUTF8String:", "PHCollection *CollectionForNavigationDestinationInPhotoLibrary(PXProgrammaticNavigationDestination *__strong, PHPhotoLibrary *__strong)");
          CGFloat v19 = (objc_class *)objc_opt_class();
          double v20 = NSStringFromClass(v19);
          CGFloat v21 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
          [v17 handleFailureInFunction:v18, @"PUSidebarViewController.m", 405, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"destination.collection", v20, v21 file lineNumber description];
        }
      }
      break;
    case 14:
      uint64_t v9 = [v7 searchCollection];
      goto LABEL_3;
    case 16:
      uint64_t v9 = [v7 prototypeCollection];
      goto LABEL_3;
    case 19:
      uint64_t v9 = [v7 sharedAlbumsCollectionList];
      goto LABEL_3;
    case 22:
      uint64_t v9 = [v7 allAlbumsCollection];
      goto LABEL_3;
    case 26:
      uint64_t v9 = [v7 eventsCollection];
      goto LABEL_3;
    case 27:
      uint64_t v9 = [v7 tripsCollection];
LABEL_3:
      id v8 = (void *)v9;
      break;
    default:
      break;
  }

  if (v8)
  {
    id v10 = ListItemIdentifierForCollection(v8);
    uint64_t v11 = [(PUSidebarViewController *)self _collectionViewIndexPathForItemIdentifier:v10];
    if (!v11)
    {
      uint64_t v12 = objc_msgSend(v8, "px_fetchAncestryIncludingRoot:", 1);
      uint64_t v13 = PXMap();

      __int16 v14 = [(PUSidebarViewController *)self sidebarOutlineSectionController];
      [v14 expandItemsForIdentifiersIfNeeded:v13 animated:1];

      uint64_t v11 = [(PUSidebarViewController *)self _collectionViewIndexPathForItemIdentifier:v10];
    }
    goto LABEL_7;
  }
  if ([v6 type] == 31)
  {
    int v15 = [v6 lemonadeNavigationDestination];
    uint64_t v16 = [v15 itemIdentifier];

    uint64_t v11 = [(PUSidebarViewController *)self _collectionViewIndexPathForItemIdentifier:v16];
  }
  else
  {
    if ([v6 type] == 20)
    {
      id v10 = [v6 importSourceUUID];
      if ([v10 length])
      {
        uint64_t v11 = [(PUSidebarViewController *)self _collectionViewIndexPathForItemIdentifier:v10];
      }
      else
      {
        uint64_t v11 = 0;
      }
LABEL_7:

      goto LABEL_25;
    }
    if ([v6 type] == 21)
    {
      uint64_t v11 = [(PUSidebarViewController *)self _collectionViewIndexPathForItemIdentifier:*MEMORY[0x1E4F91068]];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
LABEL_25:

  return v11;
}

id __56__PUSidebarViewController__itemIndexPathForDestination___block_invoke(uint64_t a1, void *a2)
{
  return ListItemIdentifierForCollection(a2);
}

- (id)_collectionViewIndexPathForItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PUSidebarViewController *)self sidebarDataController];
  id v6 = [v5 itemForIdentifier:v4];

  if (v6)
  {
    id v7 = [(PUSidebarViewController *)self dataSource];
    id v8 = [v7 indexPathForItemIdentifier:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setupDataSectionManagerWithLoadMode:(int64_t)a3
{
  id v5 = PLSidebarGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  id v8 = v7;
  unint64_t v31 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PUSidebarViewController.setupDataSectionManager", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;
  uint64_t v32 = v8;

  uint64_t v9 = [(PUSidebarViewController *)self photoLibrary];
  id v10 = [[PUSidebarDataSectionEnablementController alloc] initWithPhotoLibrary:v9 isPhotosPicker:[(PUSidebarViewController *)self _isPhotosPicker] excludesHiddenAlbum:([(PUSidebarViewController *)self options] >> 2) & 1];
  [(PUSidebarViewController *)self setSidebarDataSectionEnablementController:v10];
  uint64_t v11 = +[PUTabbedLibrarySettings sharedInstance];
  int v12 = [v11 sidebarUseMacStructure];

  uint64_t v13 = (objc_class *)objc_opt_class();
  if ([(PUSidebarViewController *)self _isPhotosPicker]) {
    uint64_t v14 = 7;
  }
  else {
    uint64_t v14 = v12 ^ 1u;
  }
  id v15 = [v13 alloc];
  uint64_t v16 = [(PUSidebarViewController *)self libraryFilterState];
  id v17 = [(PUSidebarViewController *)self assetsFilterPredicate];
  double v18 = [(PUSidebarViewController *)self pickerAllPhotosVirtualCollection];
  CGFloat v19 = (void *)[v15 initWithPhotoLibrary:v9 libraryFilterState:v16 sectionEnablementProvider:v10 options:v14 additionalAssetsFilterPredicate:v17 pickerAllPhotosVirtualCollection:v18];

  [(PUSidebarViewController *)self setSidebarDataController:v19];
  double v20 = +[PUTabbedLibrarySettings sharedInstance];
  id v21 = objc_alloc(MEMORY[0x1E4F906C0]);
  double v22 = [(PUSidebarViewController *)self dataSource];
  CGFloat v23 = (void *)[v21 initWithSidebarDataController:v19 dataSource:v22];

  [v23 setDelegate:self];
  if ([v20 sidebarAnimateDataSourceUpdates]) {
    uint64_t v24 = [(PUSidebarViewController *)self _isPhotosPicker] ^ 1;
  }
  else {
    uint64_t v24 = 0;
  }
  [v23 setAnimateDataSourceUpdates:v24];
  if ((unint64_t)(a3 - 2) < 2)
  {
    [v23 loadRootItems];
    CGFloat v27 = [MEMORY[0x1E4F905E0] sharedScheduler];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __63__PUSidebarViewController_setupDataSectionManagerWithLoadMode___block_invoke;
    v33[3] = &unk_1E5F2E0A8;
    int64_t v35 = a3;
    id v34 = v23;
    [v27 scheduleTaskAfterCATransactionCommits:v33];

LABEL_17:
    unint64_t v25 = v31;
    goto LABEL_20;
  }
  if (a3 == 1)
  {
    [v23 loadRootItems];
    goto LABEL_17;
  }
  unint64_t v25 = v31;
  if (!a3)
  {
    if ([v20 sidebarLaunchAnimateLoad]) {
      uint64_t v26 = [(PUSidebarViewController *)self _isPhotosPicker] ^ 1;
    }
    else {
      uint64_t v26 = 0;
    }
    [v23 reloadFromDataControllerApplyAnimated:v26 onQueue:0];
  }
LABEL_20:
  [(PUSidebarViewController *)self setSidebarOutlineSectionController:v23];
  CGFloat v28 = v32;
  CGFloat v29 = v28;
  if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v29, OS_SIGNPOST_INTERVAL_END, spid, "PUSidebarViewController.setupDataSectionManager", "", buf, 2u);
  }
}

uint64_t __63__PUSidebarViewController_setupDataSectionManagerWithLoadMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadFromDataControllerApplyAnimated:*(void *)(a1 + 40) == 3 onQueue:0];
}

- (BOOL)_isPhotosPicker
{
  return ([(PUSidebarViewController *)self options] >> 1) & 1;
}

- (void)configureDataSource
{
  BOOL v3 = PLSidebarGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  os_signpost_id_t v6 = v5;
  unint64_t v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PUSidebarViewController.configureDataSource", "", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v8 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v9 = self;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __46__PUSidebarViewController_configureDataSource__block_invoke;
  v42[3] = &unk_1E5F26CF0;
  objc_copyWeak(&v43, buf);
  id v10 = [v8 registrationWithCellClass:v9 configurationHandler:v42];

  uint64_t v11 = (void *)MEMORY[0x1E4FB1578];
  int v12 = self;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_2;
  v40[3] = &unk_1E5F26CF0;
  objc_copyWeak(&v41, buf);
  uint64_t v13 = [v11 registrationWithCellClass:v12 configurationHandler:v40];
  os_signpost_id_t spid = v4;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_3;
  aBlock[3] = &unk_1E5F26D18;
  id v14 = v10;
  id v38 = v14;
  id v15 = v13;
  id v39 = v15;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = objc_alloc(MEMORY[0x1E4FB1598]);
  double v18 = [(PUSidebarViewController *)self collectionView];
  CGFloat v19 = (void *)[v17 initWithCollectionView:v18 cellProvider:v16];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_4;
  v35[3] = &unk_1E5F26D40;
  objc_copyWeak(&v36, buf);
  double v20 = [v19 sectionSnapshotHandlers];
  [v20 setWillExpandItemHandler:v35];
  CGFloat v27 = v15;

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_6;
  v33[3] = &unk_1E5F26D40;
  objc_copyWeak(&v34, buf);
  id v21 = [v19 sectionSnapshotHandlers];
  [v21 setWillCollapseItemHandler:v33];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_7;
  v31[3] = &unk_1E5F26D68;
  objc_copyWeak(&v32, buf);
  double v22 = [v19 reorderingHandlers];
  [v22 setCanReorderItemHandler:v31];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_8;
  v29[3] = &unk_1E5F26D90;
  objc_copyWeak(&v30, buf);
  CGFloat v23 = [v19 reorderingHandlers];
  [v23 setDidReorderHandler:v29];

  [(PUSidebarViewController *)self setDataSource:v19];
  uint64_t v24 = v6;
  unint64_t v25 = v24;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)CGFloat v28 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v25, OS_SIGNPOST_INTERVAL_END, spid, "PUSidebarViewController.configureDataSource", "", v28, 2u);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(buf);
}

void __46__PUSidebarViewController_configureDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _updateHeaderCell:v7 forListItem:v6];
}

void __46__PUSidebarViewController_configureDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _updateOutlineCell:v7 forListItem:v6];
}

id __46__PUSidebarViewController_configureDataSource__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  int v10 = [v7 isGroup];
  uint64_t v11 = 40;
  if (v10) {
    uint64_t v11 = 32;
  }
  int v12 = [v9 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + v11) forIndexPath:v8 item:v7];

  return v12;
}

void __46__PUSidebarViewController_configureDataSource__block_invoke_4(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained sidebarOutlineSectionController];
  [v5 sectionControllerWillExpandItem:v3];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_5;
  block[3] = &unk_1E5F2E530;
  objc_copyWeak(&v7, v2);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v7);
}

void __46__PUSidebarViewController_configureDataSource__block_invoke_6(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  os_signpost_id_t v4 = [WeakRetained sidebarOutlineSectionController];
  [v4 sectionControllerWillCollapseItem:v3];
}

uint64_t __46__PUSidebarViewController_configureDataSource__block_invoke_7(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained reorderController];
  uint64_t v6 = [v5 canReorderItem:v3];

  return v6;
}

void __46__PUSidebarViewController_configureDataSource__block_invoke_8(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  os_signpost_id_t v4 = [WeakRetained reorderController];
  [v4 performReorderWithTransaction:v3];
}

void __46__PUSidebarViewController_configureDataSource__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSelectedRowScrollToVisible:0];
}

- (void)_updateOutlineCell:(id)a3 forListItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setDelegate:self];
  id v8 = [MEMORY[0x1E4FB1FF8] defaultOutlineCellConfigurationForState:0];
  [v6 _setContentViewConfiguration:v8];

  id v9 = [MEMORY[0x1E4FB1498] listSidebarCellConfiguration];
  [v6 setBackgroundConfiguration:v9];

  int v10 = [(PUSidebarViewController *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 6)
  {
    int v12 = (void *)MEMORY[0x1E4FB1810];
    uint64_t v13 = [MEMORY[0x1E4FB1808] effect];
    id v14 = [v12 styleWithEffect:v13 shape:0];
    [v6 setHoverStyle:v14];
  }
  id v15 = [v7 title];
  [v6 setText:v15];

  [v6 setItem:v7];
  uint64_t v16 = [(PUSidebarViewController *)self sidebarOutlineSectionController];
  id v17 = [v16 currentSectionSnapshot];

  if ([v17 containsItem:v7])
  {
    double v18 = [v17 parentOfChild:v7];
  }
  else
  {
    double v18 = 0;
  }
  unint64_t v19 = [v7 style];
  if (v19 <= 1) {
    [v6 setStyle:v19];
  }
  double v20 = [(PUSidebarViewController *)self sidebarDataController];
  objc_msgSend(v20, "cancelImageRequest:", objc_msgSend(v6, "mediaRequestID"));

  id v21 = [(PUSidebarViewController *)self sidebarDataController];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  CGFloat v27 = __58__PUSidebarViewController__updateOutlineCell_forListItem___block_invoke;
  CGFloat v28 = &unk_1E5F26CC8;
  id v29 = v6;
  id v30 = v7;
  id v22 = v7;
  id v23 = v6;
  uint64_t v24 = [v21 requestImageForItem:v22 parentItem:v18 completion:&v25];
  objc_msgSend(v23, "setMediaRequestID:", v24, v25, v26, v27, v28);
}

void __58__PUSidebarViewController__updateOutlineCell_forListItem___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) item];
  os_signpost_id_t v4 = *(void **)(a1 + 40);

  if (v3 == v4) {
    [*(id *)(a1 + 32) setImage:v5];
  }
}

- (void)_updateHeaderCell:(id)a3 forListItem:(id)a4
{
  id v15 = a3;
  id v6 = (void *)MEMORY[0x1E4FB1948];
  id v7 = a4;
  id v8 = [v6 headerConfiguration];
  id v9 = [v7 title];
  [v8 setText:v9];

  [v15 setContentConfiguration:v8];
  int v10 = [MEMORY[0x1E4F1CA48] array];
  int v11 = [v7 isExpandable];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1538]);
    uint64_t v13 = [MEMORY[0x1E4F90308] sharedInstance];
    if ([v13 enableSidebarHeaderSelection])
    {
      if ([(PUSidebarViewController *)self _isPhotosPicker]) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = 2;
      }
    }
    else
    {
      uint64_t v14 = 1;
    }
    [v12 setStyle:v14];
    [v10 addObject:v12];
  }
  [v15 setAccessories:v10];
}

- (id)generateLayout
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:3];
  [v2 setShowsSeparators:0];
  [v2 setHeaderMode:2];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __41__PUSidebarViewController_generateLayout__block_invoke;
  id v8 = &unk_1E5F26CA0;
  objc_copyWeak(&v9, &location);
  [v2 setTrailingSwipeActionsConfigurationProvider:&v5];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1580], "layoutWithListConfiguration:", v2, v5, v6, v7, v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v3;
}

id __41__PUSidebarViewController_generateLayout__block_invoke(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _trailingSwipeActionConfigurationForIndexPath:v3];

  return v5;
}

- (void)configureViewHierarchy
{
  id v3 = PLSidebarGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PUSidebarViewController.configureViewHierarchy", "", buf, 2u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4FB1568]);
  id v8 = [(PUSidebarViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = [(PUSidebarViewController *)self generateLayout];
  double v18 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v17, v10, v12, v14, v16);

  [v18 setAutoresizingMask:18];
  unint64_t v19 = [(PUSidebarViewController *)self traitCollection];
  if ([v19 userInterfaceIdiom] == 6) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  double v20 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  [v18 setBackgroundColor:v20];

  [v18 setDelegate:self];
  [v18 setSpringLoaded:1];
  [v18 setAlwaysBounceVertical:1];
  [v18 _setAllowsSelectionDuringEditing:1];
  id v21 = [(PUSidebarViewController *)self traitCollection];
  uint64_t v22 = [v21 userInterfaceIdiom];

  if (v22 == 5) {
    objc_msgSend(v18, "setContentInset:", 16.0, 0.0, 0.0, 0.0);
  }
  [v18 _setShouldPersistSelectionOnReloadDataWhenPossible:1];
  id v23 = [(PUSidebarViewController *)self view];
  [v23 addSubview:v18];

  [(PUSidebarViewController *)self setCollectionView:v18];
  uint64_t v24 = objc_alloc_init(PUCollectionsCollectionViewDropDelegate);
  [(PUCollectionsCollectionViewDropDelegate *)v24 setDropDataProvider:self];
  [v18 setDropDelegate:v24];
  [(PUSidebarViewController *)self setDropDelegate:v24];
  uint64_t v25 = v6;
  uint64_t v26 = v25;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)CGFloat v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v26, OS_SIGNPOST_INTERVAL_END, v4, "PUSidebarViewController.configureViewHierarchy", "", v27, 2u);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PUSidebarViewController;
  [(PUSidebarViewController *)&v24 traitCollectionDidChange:v4];
  uint64_t v5 = [(PUSidebarViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = [(PUSidebarViewController *)self sidebarDataController];
    [v8 appearanceDidChange];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v9 = [(PUSidebarViewController *)self collectionView];
    double v10 = [v9 visibleCells];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
          double v16 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v18 = v15;
            unint64_t v19 = [v18 item];
            [(PUSidebarViewController *)self _updateOutlineCell:v18 forListItem:v19];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUSidebarViewController;
  [(PUSidebarViewController *)&v7 viewDidDisappear:a3];
  id v4 = +[PUTabbedLibrarySettings sharedInstance];
  int v5 = [v4 sidebarPauseChangeProcessingWhenHidden];

  if (v5)
  {
    uint64_t v6 = [(PUSidebarViewController *)self sidebarDataController];
    [v6 setChangeProcessingPaused:1 forReason:@"Sidebar Hidden"];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUSidebarViewController;
  [(PUSidebarViewController *)&v5 viewWillAppear:a3];
  id v4 = [(PUSidebarViewController *)self sidebarDataController];
  [v4 setChangeProcessingPaused:0 forReason:@"Sidebar Hidden"];

  [(PUSidebarViewController *)self _updateSelectedRowScrollToVisible:0];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PUSidebarViewController;
  [(PUSidebarViewController *)&v13 viewDidLoad];
  id v3 = PLSidebarGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  objc_super v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PUSidebarViewController.viewDidLoad", "", v12, 2u);
  }

  [(PUSidebarViewController *)self configureViewHierarchy];
  [(PUSidebarViewController *)self configureDataSource];
  objc_super v7 = +[PUTabbedLibrarySettings sharedInstance];
  -[PUSidebarViewController setupDataSectionManagerWithLoadMode:](self, "setupDataSectionManagerWithLoadMode:", [v7 sidebarLaunchLoadMode]);

  if (([(PUSidebarViewController *)self options] & 1) == 0)
  {
    id v8 = [(PUSidebarViewController *)self editButtonItem];
    double v9 = [(PUSidebarViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
  double v10 = v6;
  uint64_t v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v11, OS_SIGNPOST_INTERVAL_END, v4, "PUSidebarViewController.viewDidLoad", "", v12, 2u);
  }
}

- (PUSidebarViewController)initWithNavigationRoot:(id)a3 photoLibrary:(id)a4 libraryFilterState:(id)a5 options:(unint64_t)a6 additionalAssetsFilterPredicate:(id)a7 pickerAllPhotosVirtualCollection:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PUSidebarViewController;
  id v18 = [(PUSidebarViewController *)&v24 initWithNibName:0 bundle:0];
  unint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_navigationRoot, a3);
    objc_storeStrong((id *)&v19->_photoLibrary, a4);
    objc_storeStrong((id *)&v19->_libraryFilterState, a5);
    v19->_options = a6;
    objc_storeStrong((id *)&v19->_assetsFilterPredicate, a7);
    objc_storeStrong((id *)&v19->_pickerAllPhotosVirtualCollection, a8);
    long long v20 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v22, v23);
    [v20 addObserver:v19 selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4FB2C48] object:0];

    [(PXLibraryFilterState *)v19->_libraryFilterState registerChangeObserver:v19 context:PXLibraryFilterStateObservationContext];
  }

  return v19;
}

- (PUSidebarViewController)initWithNavigationRoot:(id)a3 photoLibrary:(id)a4 libraryFilterState:(id)a5
{
  return [(PUSidebarViewController *)self initWithNavigationRoot:a3 photoLibrary:a4 libraryFilterState:a5 options:0 additionalAssetsFilterPredicate:0 pickerAllPhotosVirtualCollection:0];
}

@end