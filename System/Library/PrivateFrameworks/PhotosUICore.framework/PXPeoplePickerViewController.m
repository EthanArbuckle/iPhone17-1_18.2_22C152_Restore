@interface PXPeoplePickerViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)compactMode;
- (BOOL)transparentBackground;
- (CGSize)_sizeForItemWithCollectionViewSize:(CGSize)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)collectionViewSize;
- (NSArray)disabledLocalIdentifiers;
- (NSArray)personLocalIdentifiers;
- (NSArray)preselectedLocalIdentifiers;
- (NSDiffableDataSourceSnapshot)snapshot;
- (NSString)prompt;
- (NSUUID)identifier;
- (PHFetchResult)people;
- (PHPhotoLibrary)library;
- (PXPeoplePickerConfigurationControllerDelegate)configControllerDelegate;
- (PXPeoplePickerDataSourceManager)personDataSourceManager;
- (PXPeoplePickerViewController)initWithCoder:(id)a3;
- (PXPeoplePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXPeoplePickerViewController)initWithPersonIdentifiers:(id)a3 selectedLocalIdentifiers:(id)a4 disabledLocalIdentifiers:(id)a5 compactMode:(BOOL)a6 transparentBackground:(BOOL)a7 prompt:(id)a8 selectionCoordinator:(id)a9 library:(id)a10 wantsPets:(BOOL)a11;
- (PXPeoplePickerViewControllerActionHandler)peoplePickerActionHandler;
- (PXSelectionCoordinator)selectionCoordinator;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)_marginForLayoutWithCollectionViewSize:(CGSize)a3;
- (id)_collectionViewLayoutSectionForEnvironment:(id)a3;
- (id)_personAtIndexPath:(id)a3;
- (int64_t)dataType;
- (unint64_t)_unverifiedPeopleVisibility;
- (void)_configureCellForCollectionView:(id)a3 cell:(id)a4 indexPath:(id)a5;
- (void)_configureDataSourceManager;
- (void)_facesDidChange:(id)a3;
- (void)_performAction:(int64_t)a3 forPerson:(id)a4;
- (void)_performAction:(int64_t)a3 forPersonAtIndexPath:(id)a4;
- (void)_updatePersonDataSource;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)deselectAllPeople;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCollectionViewSize:(CGSize)a3;
- (void)setConfigControllerDelegate:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeoplePickerActionHandler:(id)a3;
- (void)setPersonDataSourceManager:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PXPeoplePickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_disabledLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_preselectedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_personDataSourceManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_destroyWeak((id *)&self->_configControllerDelegate);
  objc_destroyWeak((id *)&self->_peoplePickerActionHandler);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (BOOL)transparentBackground
{
  return self->_transparentBackground;
}

- (BOOL)compactMode
{
  return self->_compactMode;
}

- (void)setCollectionViewSize:(CGSize)a3
{
  self->_collectionViewSize = a3;
}

- (CGSize)collectionViewSize
{
  double width = self->_collectionViewSize.width;
  double height = self->_collectionViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (PHFetchResult)people
{
  return self->_people;
}

- (NSArray)disabledLocalIdentifiers
{
  return self->_disabledLocalIdentifiers;
}

- (NSArray)preselectedLocalIdentifiers
{
  return self->_preselectedLocalIdentifiers;
}

- (NSArray)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (void)setPersonDataSourceManager:(id)a3
{
}

- (PXPeoplePickerDataSourceManager)personDataSourceManager
{
  return self->_personDataSourceManager;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setSnapshot:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setConfigControllerDelegate:(id)a3
{
}

- (PXPeoplePickerConfigurationControllerDelegate)configControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configControllerDelegate);
  return (PXPeoplePickerConfigurationControllerDelegate *)WeakRetained;
}

- (void)setPeoplePickerActionHandler:(id)a3
{
}

- (PXPeoplePickerViewControllerActionHandler)peoplePickerActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peoplePickerActionHandler);
  return (PXPeoplePickerViewControllerActionHandler *)WeakRetained;
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXPeopleDataSourceManagerObservationContext == a5) {
    [(PXPeoplePickerViewController *)self _updatePersonDataSource];
  }
}

- (void)_updatePersonDataSource
{
  v3 = [(PXPeoplePickerViewController *)self personDataSourceManager];
  v4 = [v3 dataSource];

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [v4 allSelectedLocalIdentifiers];
  v7 = [v5 setWithArray:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4) {
    [v4 firstItemIndexPath];
  }
  else {
    memset(v36, 0, sizeof(v36));
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke;
  v31[3] = &unk_1E5DC88E0;
  id v32 = v4;
  id v33 = v9;
  id v34 = v7;
  id v10 = v8;
  id v35 = v10;
  id v11 = v7;
  id v12 = v9;
  id v13 = v4;
  [v13 enumerateItemIndexPathsStartingAtIndexPath:v36 reverseDirection:0 usingBlock:v31];
  id v14 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v14 appendSectionsWithIdentifiers:&unk_1F02D54B8];
  [v14 appendItemsWithIdentifiers:v12];
  [(PXPeoplePickerViewController *)self setSnapshot:v14];
  v15 = [(PXPeoplePickerViewController *)self dataSource];
  [v15 applySnapshot:v14 animatingDifferences:1];

  v16 = [(PXPeoplePickerViewController *)self selectionCoordinator];
  v17 = [v13 newlyDeselectedObjectIDs];
  v18 = [v13 newlySelectedObjectIDs];
  [v16 modifySelectionWithRemovedOIDs:v17 insertedOIDs:v18];

  v19 = [(PXPeoplePickerViewController *)self collectionView];
  v20 = [v19 indexPathsForSelectedItems];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke_2;
  v28[3] = &unk_1E5DC8908;
  id v29 = v10;
  id v21 = v19;
  id v30 = v21;
  id v22 = v10;
  [v20 enumerateObjectsUsingBlock:v28];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke_3;
  v25[3] = &unk_1E5DC9B58;
  id v26 = v20;
  id v27 = v21;
  id v23 = v21;
  id v24 = v20;
  [v22 enumerateObjectsUsingBlock:v25];
}

void __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  v6 = [v4 personAtItemIndexPath:v9];
  v7 = [v6 localIdentifier];
  [*(id *)(a1 + 40) addObject:v7];
  if ([*(id *)(a1 + 48) containsObject:v7])
  {
    id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(a2 + 16) inSection:*(void *)(a2 + 8)];
    [*(id *)(a1 + 56) addObject:v8];
  }
}

void __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) deselectItemAtIndexPath:v3 animated:0];
  }
}

void __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) selectItemAtIndexPath:v3 animated:0 scrollPosition:0];
  }
}

- (void)_facesDidChange:(id)a3
{
  long long v5 = [a3 userInfo];
  v6 = [v5 objectForKey:@"PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey"];

  if (!v6)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXPeoplePickerViewController.m", 545, @"%@ should be an instance inheriting from %@, but it is nil", @"[notification.userInfo objectForKey:PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey]", v10 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v11);
    id v12 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXPeoplePickerViewController.m", 545, @"%@ should be an instance inheriting from %@, but it is %@", @"[notification.userInfo objectForKey:PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey]", v10, v12 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PXPeoplePickerViewController__facesDidChange___block_invoke;
  block[3] = &unk_1E5DD32A8;
  block[4] = self;
  id v14 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__PXPeoplePickerViewController__facesDidChange___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) snapshot];
  v2 = (void *)MEMORY[0x1E4F1CA80];
  id v3 = [v7 itemIdentifiers];
  v4 = [v2 setWithArray:v3];

  [v4 intersectSet:*(void *)(a1 + 40)];
  long long v5 = [v4 allObjects];
  [v7 reloadItemsWithIdentifiers:v5];

  v6 = [*(id *)(a1 + 32) dataSource];
  [v6 applySnapshot:v7 animatingDifferences:1];
}

- (void)_performAction:(int64_t)a3 forPerson:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    id v7 = [(PXPeoplePickerViewController *)self personDataSourceManager];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __57__PXPeoplePickerViewController__performAction_forPerson___block_invoke_2;
    id v13 = &unk_1E5DC8888;
    id v8 = &v14;
    id v14 = v6;
    id v9 = &v10;
    goto LABEL_5;
  }
  if (!a3)
  {
    id v7 = [(PXPeoplePickerViewController *)self personDataSourceManager];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __57__PXPeoplePickerViewController__performAction_forPerson___block_invoke;
    v18 = &unk_1E5DC8888;
    id v8 = &v19;
    id v19 = v6;
    id v9 = &v15;
LABEL_5:
    objc_msgSend(v7, "performChanges:", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

void __57__PXPeoplePickerViewController__performAction_forPerson___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 localIdentifier];
  v6[0] = v4;
  long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 setLocalIdentifiers:v5 selected:1];
}

void __57__PXPeoplePickerViewController__performAction_forPerson___block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 localIdentifier];
  v6[0] = v4;
  long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 setLocalIdentifiers:v5 selected:0];
}

- (void)_performAction:(int64_t)a3 forPersonAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PXPeoplePickerViewController *)self personDataSourceManager];
  id v8 = [v7 dataSource];

  uint64_t v9 = [v8 identifier];
  uint64_t v10 = [v6 item];

  v12[0] = v9;
  v12[1] = 0;
  v12[2] = v10;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v11 = [v8 personAtItemIndexPath:v12];
  [(PXPeoplePickerViewController *)self _performAction:a3 forPerson:v11];
}

- (id)_personAtIndexPath:(id)a3
{
  id v4 = a3;
  long long v5 = [(PXPeoplePickerViewController *)self personDataSourceManager];
  id v6 = [v5 dataSource];

  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [v4 section];
  uint64_t v9 = [v4 item];

  v12[0] = v7;
  v12[1] = v8;
  v12[2] = v9;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = [v6 personAtItemIndexPath:v12];

  return v10;
}

- (void)_configureDataSourceManager
{
  id v4 = +[PXPeoplePickerDataSourceManager currentDataSourceManager];
  long long v5 = [(PXPeoplePickerViewController *)self people];
  id v6 = [(PXPeoplePickerViewController *)self personLocalIdentifiers];
  int64_t v7 = [(PXPeoplePickerViewController *)self dataType];
  if (!v7)
  {
    if (v5)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PXPeoplePickerViewController.m", 488, @"Invalid parameter not satisfying: %@", @"people == nil" object file lineNumber description];

      if (v6) {
        goto LABEL_8;
      }
    }
    else if (v6)
    {
LABEL_8:
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke_2;
      v21[3] = &unk_1E5DC88B0;
      uint64_t v8 = (id *)v22;
      v22[0] = v6;
      v22[1] = self;
      uint64_t v9 = v21;
      goto LABEL_9;
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXPeoplePickerViewController.m", 489, @"Invalid parameter not satisfying: %@", @"localIdentifiers != nil" object file lineNumber description];

    goto LABEL_8;
  }
  if (v7 == 1)
  {
    if (v5)
    {
      if (!v6)
      {
LABEL_5:
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke;
        v23[3] = &unk_1E5DC8888;
        uint64_t v8 = &v24;
        id v24 = v5;
        uint64_t v9 = v23;
LABEL_9:
        [v4 performChanges:v9];

        goto LABEL_10;
      }
    }
    else
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PXPeoplePickerViewController.m", 480, @"Invalid parameter not satisfying: %@", @"people != nil" object file lineNumber description];

      if (!v6) {
        goto LABEL_5;
      }
    }
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXPeoplePickerViewController.m", 481, @"Invalid parameter not satisfying: %@", @"localIdentifiers == nil" object file lineNumber description];

    goto LABEL_5;
  }
LABEL_10:
  uint64_t v10 = [(PXPeoplePickerViewController *)self preselectedLocalIdentifiers];
  uint64_t v11 = [(PXPeoplePickerViewController *)self disabledLocalIdentifiers];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke_3;
  v18[3] = &unk_1E5DC88B0;
  id v19 = v10;
  id v20 = v11;
  id v12 = v11;
  id v13 = v10;
  [v4 performChanges:v18];
  [v4 registerChangeObserver:self context:PXPeopleDataSourceManagerObservationContext];
  [(PXPeoplePickerViewController *)self setPersonDataSourceManager:v4];
  [(PXPeoplePickerViewController *)self _updatePersonDataSource];
}

uint64_t __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPeople:*(void *)(a1 + 32)];
}

void __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 library];
  [v4 setSuggestedLocalIdentifiers:v2 withPhotoLibrary:v5];
}

void __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [v3 setLocalIdentifiers:*(void *)(a1 + 32) selected:1];
  }
  if ([*(id *)(a1 + 40) count]) {
    [v3 setDisabledLocalIdentifiers:*(void *)(a1 + 40)];
  }
}

- (void)_configureCellForCollectionView:(id)a3 cell:(id)a4 indexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v8 tag] + 1;
  [v8 setTag:v11];
  id v12 = [(PXPeoplePickerViewController *)self _personAtIndexPath:v9];

  id v13 = objc_msgSend(v12, "px_localizedName");
  id v14 = [v8 nameLabel];
  [v14 setText:v13];

  if ([(PXPeoplePickerViewController *)self transparentBackground]) {
    [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  else {
  uint64_t v15 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  }
  uint64_t v16 = [v8 imageView];
  [v16 setBackgroundColor:v15];

  objc_msgSend(v8, "setFavorite:", objc_msgSend(v12, "type") == 1);
  v17 = [(PXPeoplePickerViewController *)self personDataSourceManager];
  v18 = [v17 dataSource];

  id v19 = [v12 localIdentifier];
  id v20 = [v18 allSelectedLocalIdentifiers];
  objc_msgSend(v8, "setSelected:", objc_msgSend(v20, "containsObject:", v19));

  id v21 = [v18 disabledLocalIdentifiers];
  objc_msgSend(v8, "setDisabled:", objc_msgSend(v21, "containsObject:", v19));

  [v8 setIsAccessibilityElement:1];
  id v22 = objc_msgSend(v12, "px_localizedName");
  uint64_t v23 = [v22 length];

  if (v23) {
    objc_msgSend(v12, "px_localizedName");
  }
  else {
  id v24 = PXLocalizedStringForPersonOrPetAndVisibility(v12, 0, @"PXPeoplePickerUnkownPersonAccessibilityLabel");
  }
  [v8 setAccessibilityLabel:v24];

  if ([v8 isSelected])
  {
    uint64_t v25 = [v8 accessibilityTraits];
    uint64_t v26 = *MEMORY[0x1E4FB2590] | v25;
  }
  else
  {
    uint64_t v27 = *MEMORY[0x1E4FB2590];
    uint64_t v26 = [v8 accessibilityTraits] & ~v27;
  }
  [v8 setAccessibilityTraits:v26];
  objc_msgSend(v10, "px_screenScale");
  double v29 = v28;
  [v10 frame];
  double v31 = v30;
  double v33 = v32;

  -[PXPeoplePickerViewController _sizeForItemWithCollectionViewSize:](self, "_sizeForItemWithCollectionViewSize:", v31, v33);
  v36 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v12, v34, v35, v29);
  [(PXPeopleFaceCropFetchOptions *)v36 setUseLowMemoryMode:1];
  v37 = +[PXPeopleFaceCropManager sharedManager];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __79__PXPeoplePickerViewController__configureCellForCollectionView_cell_indexPath___block_invoke;
  v39[3] = &unk_1E5DD15E0;
  id v40 = v8;
  uint64_t v41 = v11;
  id v38 = v8;
  [v37 requestFaceCropForOptions:v36 resultHandler:v39];
}

void __79__PXPeoplePickerViewController__configureCellForCollectionView_cell_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
  [(id)objc_claimAutoreleasedReturnValue() CGRectValue];
  id v6 = *(id *)(a1 + 32);
  id v7 = v5;
  px_dispatch_on_main_queue();
}

void __79__PXPeoplePickerViewController__configureCellForCollectionView_cell_indexPath___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) tag] == *(void *)(a1 + 48))
  {
    id v7 = [*(id *)(a1 + 32) imageView];
    double v2 = *(double *)(a1 + 56);
    double v3 = *(double *)(a1 + 64);
    double v4 = *(double *)(a1 + 72);
    double v5 = *(double *)(a1 + 80);
    id v6 = [v7 layer];
    objc_msgSend(v6, "setContentsRect:", v2, v3, v4, v5);

    [v7 setImage:*(void *)(a1 + 40)];
  }
}

- (double)_marginForLayoutWithCollectionViewSize:(CGSize)a3
{
  +[PXPeopleGridSizer marginForGridClass:width:](PXPeopleGridSizer, "marginForGridClass:width:", 1, a3.width, a3.height);
  return result;
}

- (CGSize)_sizeForItemWithCollectionViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(PXPeoplePickerViewController *)self compactMode])
  {
    +[PXPeopleGridSizer marginForGridClass:1 width:width];
    double v6 = height + v5 * -2.0;
    double v7 = v6;
  }
  else
  {
    +[PXPeopleGridSizer cellSizeForGridClass:1 width:width];
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (id)_collectionViewLayoutSectionForEnvironment:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  double v4 = [a3 container];
  [v4 contentSize];
  double v6 = v5;
  double v8 = v7;

  -[PXPeoplePickerViewController _sizeForItemWithCollectionViewSize:](self, "_sizeForItemWithCollectionViewSize:", v6, v8);
  double v10 = v9;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1308], "absoluteDimension:");
  id v12 = [MEMORY[0x1E4FB1308] absoluteDimension:v10];
  id v13 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v11 heightDimension:v12];
  id v14 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v13];
  uint64_t v15 = (void *)MEMORY[0x1E4FB1338];
  uint64_t v16 = (void *)MEMORY[0x1E4FB1308];
  [v11 dimension];
  v17 = objc_msgSend(v16, "absoluteDimension:");
  v18 = [v15 sizeWithWidthDimension:v17 heightDimension:v12];

  id v19 = (void *)MEMORY[0x1E4FB1318];
  v25[0] = v14;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v21 = [v19 horizontalGroupWithLayoutSize:v18 subitems:v20];

  id v22 = [MEMORY[0x1E4FB1330] sectionWithGroup:v21];
  [v22 setInterGroupSpacing:25.0];
  -[PXPeoplePickerViewController _marginForLayoutWithCollectionViewSize:](self, "_marginForLayoutWithCollectionViewSize:", v6, v8);
  objc_msgSend(v22, "setContentInsets:", v23, v23, v23, v23);

  return v22;
}

- (void)deselectAllPeople
{
  id v2 = [(PXPeoplePickerViewController *)self personDataSourceManager];
  [v2 performChanges:&__block_literal_global_327];
}

uint64_t __49__PXPeoplePickerViewController_deselectAllPeople__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAllLocalIdentifiers];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [a3 frame];
  -[PXPeoplePickerViewController _sizeForItemWithCollectionViewSize:](self, "_sizeForItemWithCollectionViewSize:", v6, v7);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [a3 frame];
  -[PXPeoplePickerViewController _marginForLayoutWithCollectionViewSize:](self, "_marginForLayoutWithCollectionViewSize:", v6, v7);
  double v9 = v8;
  double v10 = v8;
  double v11 = v8;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v8 = [(PXPeoplePickerViewController *)self _personAtIndexPath:a4];
  -[PXPeoplePickerViewController _performAction:forPerson:](self, "_performAction:forPerson:", 0);
  double v5 = [(PXPeoplePickerViewController *)self selectionCoordinator];

  if (!v5)
  {
    double v6 = [(PXPeoplePickerViewController *)self personDataSourceManager];
    [v6 performChanges:&__block_literal_global_233907];
  }
  double v7 = [(PXPeoplePickerViewController *)self peoplePickerActionHandler];
  [v7 peoplePicker:self didTapItem:v8];
}

uint64_t __72__PXPeoplePickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAllLocalIdentifiers];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(PXPeoplePickerViewController *)self personDataSourceManager];
  double v7 = [v6 dataSource];

  long long v9 = 0u;
  long long v10 = 0u;
  [v7 identifier];
  PXSimpleIndexPathFromIndexPath();
}

- (unint64_t)_unverifiedPeopleVisibility
{
  id v2 = [(PXPeoplePickerViewController *)self library];
  double v3 = +[PXPeopleSwiftUtilities fetchAddPeopleCandidatesIn:v2];

  __int16 v7 = 0;
  +[PXPeopleUtilities people:v3 hasHumans:(char *)&v7 + 1 hasPets:&v7];
  uint64_t v4 = 2;
  if (HIBYTE(v7)) {
    uint64_t v4 = 3;
  }
  if ((_BYTE)v7) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 1;
  }

  return v5;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeoplePickerViewController;
  [(PXPeoplePickerViewController *)&v5 viewWillDisappear:a3];
  if (([(PXPeoplePickerViewController *)self isBeingDismissed] & 1) != 0
    || [(PXPeoplePickerViewController *)self isMovingFromParentViewController])
  {
    uint64_t v4 = [(PXPeoplePickerViewController *)self configControllerDelegate];
    [v4 viewControllerWillBePopped:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeoplePickerViewController;
  [(PXPeoplePickerViewController *)&v3 viewDidLayoutSubviews];
  [(PXPeoplePickerViewController *)self collectionView];
  [(id)objc_claimAutoreleasedReturnValue() frame];
  [(PXPeoplePickerViewController *)self collectionViewSize];
  PXSizeApproximatelyEqualToSize();
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)PXPeoplePickerViewController;
  [(PXPeoplePickerViewController *)&v35 viewDidLoad];
  objc_super v3 = PXLocalizedStringForPeoplePetsHomeTitle([(PXPeoplePickerViewController *)self _unverifiedPeopleVisibility]);
  [(PXPeoplePickerViewController *)self setTitle:v3];

  uint64_t v4 = [(PXPeoplePickerViewController *)self parentViewController];
  if (v4
    && (objc_super v5 = (void *)v4,
        [(PXPeoplePickerViewController *)self parentViewController],
        double v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) == 0))
  {
    id v8 = [(PXPeoplePickerViewController *)self parentViewController];
  }
  else
  {
    id v8 = self;
  }
  long long v9 = v8;
  long long v10 = [(PXPeoplePickerViewController *)self prompt];
  double v11 = [(PXPeoplePickerViewController *)v9 navigationItem];
  [v11 setPrompt:v10];

  id v12 = [(PXPeoplePickerViewController *)self collectionView];
  if ([(PXPeoplePickerViewController *)self transparentBackground]) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v13 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  [v12 setBackgroundColor:v13];

  BOOL v14 = [(PXPeoplePickerViewController *)self transparentBackground];
  uint64_t v15 = [v12 layer];
  [v15 setHitTestsAsOpaque:v14];

  [v12 setAllowsSelection:1];
  uint64_t v16 = [(PXPeoplePickerViewController *)self selectionCoordinator];
  [v12 setAllowsMultipleSelection:v16 != 0];

  [v12 setDelegate:self];
  if ([(PXPeoplePickerViewController *)self compactMode]) {
    [(UICollectionViewFlowLayout *)self->_layout setScrollDirection:1];
  }
  objc_initWeak(&location, self);
  v17 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v18 = objc_opt_class();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __43__PXPeoplePickerViewController_viewDidLoad__block_invoke;
  v31[3] = &unk_1E5DC8810;
  objc_copyWeak(&v33, &location);
  id v19 = v12;
  id v32 = v19;
  id v20 = [v17 registrationWithCellClass:v18 configurationHandler:v31];
  id v21 = objc_alloc(MEMORY[0x1E4FB1598]);
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  double v28 = __43__PXPeoplePickerViewController_viewDidLoad__block_invoke_2;
  double v29 = &unk_1E5DC8838;
  id v22 = v20;
  id v30 = v22;
  double v23 = (void *)[v21 initWithCollectionView:v19 cellProvider:&v26];
  -[PXPeoplePickerViewController setDataSource:](self, "setDataSource:", v23, v26, v27, v28, v29);

  [(PXPeoplePickerViewController *)self _configureDataSourceManager];
  id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v25 = +[PXPeopleFaceCropManager sharedManager];
  [v24 addObserver:self selector:sel__facesDidChange_ name:@"PXPeopleFaceCropManagerDidInvalidateCacheNotification" object:v25];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __43__PXPeoplePickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_super v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _configureCellForCollectionView:*(void *)(a1 + 32) cell:v7 indexPath:v6];
}

uint64_t __43__PXPeoplePickerViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

- (PXPeoplePickerViewController)initWithPersonIdentifiers:(id)a3 selectedLocalIdentifiers:(id)a4 disabledLocalIdentifiers:(id)a5 compactMode:(BOOL)a6 transparentBackground:(BOOL)a7 prompt:(id)a8 selectionCoordinator:(id)a9 library:(id)a10 wantsPets:(BOOL)a11
{
  BOOL v13 = a6;
  v67[3] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v59 = a5;
  id v58 = a8;
  id v56 = a9;
  id v19 = a10;
  v57 = v19;
  if (!v17)
  {
    double v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PXPeoplePickerViewController.m", 204, @"Invalid parameter not satisfying: %@", @"personLocalIdentifiers" object file lineNumber description];

    id v19 = v57;
  }
  if (v18)
  {
    if (v19) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXPeoplePickerViewController.m", 206, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PXPeoplePickerViewController.m", 205, @"Invalid parameter not satisfying: %@", @"selectedLocalIdentifiers" object file lineNumber description];

  if (!v57) {
    goto LABEL_8;
  }
LABEL_5:
  if (v13)
  {
LABEL_6:
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __188__PXPeoplePickerViewController_initWithPersonIdentifiers_selectedLocalIdentifiers_disabledLocalIdentifiers_compactMode_transparentBackground_prompt_selectionCoordinator_library_wantsPets___block_invoke;
    aBlock[3] = &unk_1E5DC87C0;
    objc_copyWeak(&v64, &location);
    id v20 = _Block_copy(aBlock);
    id v21 = objc_alloc_init(MEMORY[0x1E4FB1588]);
    [v21 setScrollDirection:1];
    id v22 = (id)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSectionProvider:v20 configuration:v21];

    objc_destroyWeak(&v64);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
LABEL_9:
  id v22 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v22 setMinimumLineSpacing:25.0];
LABEL_10:
  v62.receiver = self;
  v62.super_class = (Class)PXPeoplePickerViewController;
  uint64_t v26 = [(PXPeoplePickerViewController *)&v62 initWithCollectionViewLayout:v22];
  uint64_t v27 = v26;
  if (v26)
  {
    v26->_compactMode = v13;
    v26->_transparentBackground = a7;
    if ([v17 count])
    {
      v27->_dataType = 0;
      uint64_t v28 = [v17 copy];
      personLocalIdentifiers = v27->_personLocalIdentifiers;
      v27->_personLocalIdentifiers = (NSArray *)v28;
    }
    else
    {
      personLocalIdentifiers = [v57 librarySpecificFetchOptions];
      [personLocalIdentifiers setPersonContext:1];
      id v30 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"type" ascending:0];
      v67[0] = v30;
      double v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"manualOrder" ascending:1];
      v67[1] = v31;
      id v32 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
      v67[2] = v32;
      id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
      [personLocalIdentifiers setSortDescriptors:v33];

      if (a11)
      {
        double v34 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
        [personLocalIdentifiers setIncludedDetectionTypes:v34];
      }
      uint64_t v35 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:personLocalIdentifiers];
      people = v27->_people;
      v27->_people = (PHFetchResult *)v35;

      v27->_dataType = 1;
    }

    if (v13) {
      goto LABEL_20;
    }
    v37 = (UICollectionViewFlowLayout *)v22;
    if (v37)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_19:
        layout = v27->_layout;
        v27->_layout = v37;

LABEL_20:
        uint64_t v39 = [v18 copy];
        preselectedLocalIdentifiers = v27->_preselectedLocalIdentifiers;
        v27->_preselectedLocalIdentifiers = (NSArray *)v39;

        uint64_t v41 = [v59 copy];
        disabledLocalIdentifiers = v27->_disabledLocalIdentifiers;
        v27->_disabledLocalIdentifiers = (NSArray *)v41;

        uint64_t v43 = [v58 copy];
        prompt = v27->_prompt;
        v27->_prompt = (NSString *)v43;

        objc_storeStrong((id *)&v27->_selectionCoordinator, a9);
        objc_storeStrong((id *)&v27->_library, a10);
        v45 = [(PXPeoplePickerViewController *)v27 collectionViewLayout];
        v66[0] = objc_opt_class();
        v66[1] = objc_opt_class();
        v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __188__PXPeoplePickerViewController_initWithPersonIdentifiers_selectedLocalIdentifiers_disabledLocalIdentifiers_compactMode_transparentBackground_prompt_selectionCoordinator_library_wantsPets___block_invoke_2;
        v60[3] = &unk_1E5DC87E8;
        id v61 = v45;
        id v47 = v45;
        id v48 = (id)[(PXPeoplePickerViewController *)v27 registerForTraitChanges:v46 withHandler:v60];

        goto LABEL_21;
      }
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v53);
      v54 = [(UICollectionViewFlowLayout *)v37 px_descriptionForAssertionMessage];
      [v50 handleFailureInMethod:a2, v27, @"PXPeoplePickerViewController.m", 248, @"%@ should be an instance inheriting from %@, but it is %@", @"layout", v52, v54 object file lineNumber description];
    }
    else
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      [v50 handleFailureInMethod:a2, v27, @"PXPeoplePickerViewController.m", 248, @"%@ should be an instance inheriting from %@, but it is nil", @"layout", v52 object file lineNumber description];
    }

    goto LABEL_19;
  }
LABEL_21:

  return v27;
}

id __188__PXPeoplePickerViewController_initWithPersonIdentifiers_selectedLocalIdentifiers_disabledLocalIdentifiers_compactMode_transparentBackground_prompt_selectionCoordinator_library_wantsPets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained _collectionViewLayoutSectionForEnvironment:v4];

  return v6;
}

uint64_t __188__PXPeoplePickerViewController_initWithPersonIdentifiers_selectedLocalIdentifiers_disabledLocalIdentifiers_compactMode_transparentBackground_prompt_selectionCoordinator_library_wantsPets___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateLayout];
}

- (PXPeoplePickerViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerViewController.m", 192, @"%s is not available as initializer", "-[PXPeoplePickerViewController initWithCoder:]");

  abort();
}

- (PXPeoplePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerViewController.m", 188, @"%s is not available as initializer", "-[PXPeoplePickerViewController initWithNibName:bundle:]");

  abort();
}

@end