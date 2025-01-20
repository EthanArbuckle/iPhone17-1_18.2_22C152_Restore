@interface PXSelectionContainer
- (BOOL)allowImplicitSelectionForProjectsOrSharing;
- (BOOL)containsAssetsWithNonEditableProperties;
- (BOOL)containsContentSyndicationAssets;
- (BOOL)containsNonContentSyndicationAssets;
- (BOOL)containsObjectOfClass:(Class)a3 passingTest:(id)a4;
- (BOOL)containsPeople;
- (BOOL)containsRAWAssets;
- (BOOL)containsRAWPlusJPEGAssets;
- (BOOL)containsReferencedFileAssets;
- (BOOL)containsSpatialAssets;
- (BOOL)containsSpatialVideoAssets;
- (BOOL)containsUnsavedContentSyndicationAssets;
- (BOOL)hasAnyChangesFromSelection:(id)a3;
- (BOOL)hasExplicitSelection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSelection:(id)a3;
- (NSString)title;
- (NSUndoManager)undoManager;
- (PXContentPrivacyController)privacyController;
- (PXDisplayCollection)collection;
- (PXDisplayCollectionFetcher)collectionFetcher;
- (PXFastEnumeration)allDataSourceObjects;
- (PXFastEnumeration)selectedContainedAssets;
- (PXFastEnumeration)selectedContainedAssetsForProjectsOrSharing;
- (PXFastEnumeration)selectedObjects;
- (PXSectionedChangeDetailsRepository)changeHistory;
- (PXSelectionContainer)init;
- (PXSelectionContainer)initWithCollection:(id)a3 collectionFetcher:(id)a4 undoManager:(id)a5 context:(int64_t)a6;
- (PXSelectionContainer)initWithContent:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6;
- (PXSelectionContainer)initWithContent:(id)a3 undoManager:(id)a4 context:(int64_t)a5;
- (PXSelectionContainer)initWithDataSection:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6;
- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6;
- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6 privacyController:(id)a7 changeHistory:(id)a8;
- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 undoManager:(id)a4 context:(int64_t)a5;
- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 undoManager:(id)a4 context:(int64_t)a5 privacyController:(id)a6;
- (PXSelectionSnapshot)selectionSnapshot;
- (id)description;
- (id)firstSelectedObjectOfClass:(Class)a3;
- (id)selectedContainedAssets:(BOOL)a3;
- (id)selectedContainedAssets:(BOOL)a3 allowedClasses:(id)a4;
- (id)selectedObjects:(BOOL)a3;
- (id)selectedObjectsOfClass:(Class)a3;
- (id)singleSelectedObjectOfClass:(Class)a3;
- (int64_t)context;
- (int64_t)selectionCount;
- (unint64_t)hash;
- (void)enumerateSelectedObjectsOfClass:(Class)a3 usingBlock:(id)a4;
@end

@implementation PXSelectionContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_changeHistory, 0);
  objc_destroyWeak((id *)&self->_collectionFetcher);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_allDataSourceObjects, 0);
  objc_storeStrong((id *)&self->_selectedObjects, 0);
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (int64_t)context
{
  return self->_context;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (PXSectionedChangeDetailsRepository)changeHistory
{
  return self->_changeHistory;
}

- (PXDisplayCollectionFetcher)collectionFetcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionFetcher);
  return (PXDisplayCollectionFetcher *)WeakRetained;
}

- (PXDisplayCollection)collection
{
  return self->_collection;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(PXSelectionContainer *)self context];
  if ((unint64_t)(v5 - 1) > 0x1E) {
    v6 = @"Undefined";
  }
  else {
    v6 = off_1E5DBE1D0[v5 - 1];
  }
  v7 = v6;
  v8 = [v3 stringWithFormat:@"<%@: %p context = %@>", v4, self, v7];;

  return v8;
}

- (unint64_t)hash
{
  v3 = [(PXSelectionContainer *)self selectionSnapshot];
  uint64_t v4 = [v3 dataSource];
  uint64_t v5 = [v4 hash];
  v6 = [(PXSelectionContainer *)self selectionSnapshot];
  v7 = [v6 selectedIndexPaths];
  unint64_t v8 = [v7 hash] ^ v5;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXSelectionContainer *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PXSelectionContainer *)self isEqualToSelection:v4];
  }

  return v5;
}

- (BOOL)hasAnyChangesFromSelection:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXSelectionContainer *)self selectionCount];
  if (v5 == [v4 selectionCount])
  {
    v6 = [v4 selectionSnapshot];
    v7 = [v6 dataSource];
    uint64_t v8 = [v7 identifier];

    v9 = [(PXSelectionContainer *)self selectionSnapshot];
    v10 = [v9 dataSource];
    uint64_t v11 = [v10 identifier];

    v12 = [(PXSelectionContainer *)self changeHistory];
    v13 = [v12 coalescedChangeDetailsFromDataSourceIdentifier:v8 toDataSourceIdentifier:v11];

    if (v13)
    {
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      char v27 = 0;
      v14 = [(PXSelectionContainer *)self selectionSnapshot];
      v18 = [v14 selectedIndexPaths];

      v15 = [v4 selectionSnapshot];
      v16 = [v15 selectedIndexPaths];

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __51__PXSelectionContainer_hasAnyChangesFromSelection___block_invoke;
      v20[3] = &unk_1E5DBE1B0;
      id v21 = v13;
      id v17 = v18;
      id v22 = v17;
      v23 = &v24;
      [v16 enumerateItemIndexPathsUsingBlock:v20];
      LOBYTE(v18) = *((unsigned char *)v25 + 24) != 0;

      _Block_object_dispose(&v24, 8);
    }
    else
    {
      LODWORD(v18) = ![(PXSelectionContainer *)self isEqualToSelection:v4];
    }
  }
  else
  {
    LOBYTE(v18) = 1;
  }

  return (char)v18;
}

uint64_t __51__PXSelectionContainer_hasAnyChangesFromSelection___block_invoke(void *a1, long long *a2, unsigned char *a3)
{
  char v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v5 = (void *)a1[4];
  if (v5)
  {
    long long v6 = a2[1];
    long long v9 = *a2;
    long long v10 = v6;
    uint64_t result = [v5 indexPathAfterApplyingChangesToIndexPath:&v9 hasIncrementalChanges:0 objectChanged:&v13];
    if (v13) {
      goto LABEL_4;
    }
  }
  uint64_t v8 = (void *)a1[5];
  long long v9 = v11;
  long long v10 = v12;
  uint64_t result = [v8 containsIndexPath:&v9];
  if ((result & 1) == 0)
  {
LABEL_4:
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isEqualToSelection:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXSelectionContainer *)self selectionCount];
  if (v5 != [v4 selectionCount]) {
    goto LABEL_5;
  }
  int64_t v6 = [(PXSelectionContainer *)self context];
  if (v6 != [v4 context]) {
    goto LABEL_5;
  }
  v7 = [(PXSelectionContainer *)self selectionSnapshot];
  uint64_t v8 = [v7 dataSource];
  long long v9 = [v4 selectionSnapshot];
  long long v10 = [v9 dataSource];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    long long v12 = [(PXSelectionContainer *)self selectionSnapshot];
    char v13 = [v12 selectedIndexPaths];
    v14 = [v4 selectionSnapshot];
    v15 = [v14 selectedIndexPaths];
    char v16 = [v13 isEqual:v15];
  }
  else
  {
LABEL_5:
    char v16 = 0;
  }

  return v16;
}

- (NSString)title
{
  v3 = [(PXSelectionContainer *)self selectionSnapshot];
  id v4 = [v3 dataSource];

  int64_t v5 = [(PXSelectionContainer *)self selectionSnapshot];
  int64_t v6 = [v5 selectedIndexPaths];

  if ([(PXSelectionContainer *)self context] == 17)
  {
    v7 = [(PXSelectionContainer *)self selectionSnapshot];
    uint64_t v8 = [v7 firstObject];

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    v19 = [(PXSelectionContainer *)self selectionSnapshot];
    v20 = [v19 firstObject];

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    id v22 = [(PXSelectionContainer *)self collection];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    if (v9)
    {
      uint64_t v24 = [(PXSelectionContainer *)self selectionSnapshot];
      v25 = [v24 allItemsEnumerator];
      uint64_t v26 = +[PXPeopleUtilities titleStringForPeople:v25];
    }
    else
    {
      if (v21)
      {
        char v27 = +[PXPeopleUtilities titleStringForSocialGroup:v21];
        goto LABEL_24;
      }
      if (!v23)
      {
        char v27 = 0;
        goto LABEL_24;
      }
      if (![v4 totalNumberOfItems])
      {
        char v27 = &stru_1F00B0030;
        goto LABEL_24;
      }
      uint64_t v24 = [v23 photoLibrary];
      v25 = PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v24, "px_peoplePetsHomeVisibility"), @"PXPeopleHomeSummaryQuantityTitle");
      uint64_t v26 = PXLocalizedStringWithValidatedFormat(v25, @"%ld");
    }
    char v27 = (__CFString *)v26;

LABEL_24:
    goto LABEL_27;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__PXSelectionContainer_title__block_invoke;
  aBlock[3] = &unk_1E5DBE110;
  id v11 = v10;
  id v48 = v11;
  long long v12 = _Block_copy(aBlock);
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  v40 = __29__PXSelectionContainer_title__block_invoke_2;
  v41 = &unk_1E5DBE188;
  id v42 = v4;
  id v9 = v11;
  id v43 = v9;
  v46 = &v49;
  id v13 = v12;
  v44 = self;
  id v45 = v13;
  [v6 enumerateItemIndexSetsUsingBlock:&v38];
  if (v50[3] < 3)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v9];
    v18 = [v14 array];
  }
  else
  {
    v14 = PXLocalizedStringFromTable(@"PXCollectionPickerAdditionalMomentsFormat", @"PhotosUICore");
    uint64_t v37 = v50[3] - 1;
    v15 = PXLocalizedStringWithValidatedFormat(v14, @"%ld");
    char v16 = (void *)MEMORY[0x1E4F1C978];
    id v17 = objc_msgSend(v9, "firstObject", v37);
    v18 = objc_msgSend(v16, "arrayWithObjects:", v17, v15, 0, v38, v39, v40, v41, v42, v43);
  }
  if ([v18 count])
  {
    v28 = PXLocalizedStringFromTable(@"PXCollectionPickerNewCollectionNameComponentsSeparator", @"PhotosUICore");
    char v27 = [v18 componentsJoinedByString:v28];
  }
  else
  {
    char v27 = 0;
  }

  _Block_object_dispose(&v49, 8);
LABEL_27:

  if (!v27)
  {
    v29 = [(PXSelectionContainer *)self collection];
    char v27 = [v29 localizedTitle];

    if (!v27)
    {
      v30 = [(PXSelectionContainer *)self collection];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = (objc_class *)MEMORY[0x1E4F8A798];
        id v32 = v30;
        v33 = (void *)[[v31 alloc] initWithPreset:2];
        v34 = [v32 localStartDate];
        v35 = [v32 localEndDate];

        char v27 = [v33 stringFromDate:v34 toDate:v35];
      }
      else if ([(PXSelectionContainer *)self context] == 23)
      {
        PXLocalizedStringFromTable(@"SEARCH_TITLE", @"PhotosUICore");
        char v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v27 = 0;
      }
    }
  }

  return (NSString *)v27;
}

void __29__PXSelectionContainer_title__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 localizedTitle];
  id v5 = [v3 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

void __29__PXSelectionContainer_title__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, BOOL *a5)
{
  id v9 = a4;
  if ([v9 count])
  {
    id v10 = *(void **)(a1 + 32);
    v29[0] = a2;
    v29[1] = a3;
    int64x2_t v30 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    id v11 = [v10 objectAtIndexPath:v29];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      if ([v12 assetCollectionType] != 2 || objc_msgSend(v12, "assetCollectionSubtype") == 1000000204)
      {
        id v13 = [v12 localizedSubtitle];
        if (v13 || ([v12 localizedTitle], (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          [*(id *)(a1 + 40) addObject:v13];
        }
        ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v11;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __29__PXSelectionContainer_title__block_invoke_3;
        v25[3] = &unk_1E5DBE138;
        id v26 = v14;
        id v15 = *(id *)(a1 + 56);
        uint64_t v16 = *(void *)(a1 + 64);
        id v27 = v15;
        uint64_t v28 = v16;
        [v9 enumerateIndexesUsingBlock:v25];

        id v12 = v26;
      }
      else
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __29__PXSelectionContainer_title__block_invoke_4;
        v19[3] = &unk_1E5DBE160;
        id v20 = *(id *)(a1 + 32);
        uint64_t v23 = a2;
        uint64_t v24 = a3;
        id v17 = *(id *)(a1 + 56);
        uint64_t v18 = *(void *)(a1 + 64);
        id v21 = v17;
        uint64_t v22 = v18;
        [v9 enumerateIndexesUsingBlock:v19];

        id v12 = v20;
      }
    }

    *a5 = [*(id *)(a1 + 48) context] == 6;
  }
}

void __29__PXSelectionContainer_title__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) memories];
  id v5 = [v4 objectAtIndex:a2];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void __29__PXSelectionContainer_title__block_invoke_4(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 56);
  uint64_t v6 = a2;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = [v3 objectAtIndexPath:&v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (PXFastEnumeration)allDataSourceObjects
{
  if (!self->_allDataSourceObjects)
  {
    v3 = [(PXSelectionContainer *)self selectionSnapshot];
    id v4 = [v3 dataSource];

    long long v5 = [v4 fetchAllItemObjects];
    allDataSourceObjects = self->_allDataSourceObjects;
    self->_allDataSourceObjects = v5;
  }
  uint64_t v7 = [(PXSelectionContainer *)self privacyController];
  char v8 = [v7 isLocked];

  if (v8) {
    id v9 = (PXFastEnumeration *)MEMORY[0x1E4F1CBF0];
  }
  else {
    id v9 = self->_allDataSourceObjects;
  }
  return v9;
}

- (PXFastEnumeration)selectedContainedAssetsForProjectsOrSharing
{
  BOOL v3 = [(PXSelectionContainer *)self allowImplicitSelectionForProjectsOrSharing];
  return (PXFastEnumeration *)[(PXSelectionContainer *)self selectedContainedAssets:v3];
}

- (BOOL)allowImplicitSelectionForProjectsOrSharing
{
  unint64_t v3 = [(PXSelectionContainer *)self context];
  if (v3 > 0x1C) {
    return 0;
  }
  if (((1 << v3) & 0x1808008) != 0) {
    return 1;
  }
  if (((1 << v3) & 0x18000000) == 0) {
    return 0;
  }
  long long v5 = [(PXSelectionContainer *)self collection];
  char v6 = objc_msgSend(v5, "px_allowsImplicitSelectionForProjectOrSharingAction");

  return v6;
}

- (PXFastEnumeration)selectedContainedAssets
{
  return (PXFastEnumeration *)[(PXSelectionContainer *)self selectedContainedAssets:0];
}

- (id)selectedContainedAssets:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  char v6 = [(PXSelectionContainer *)self selectedContainedAssets:v3 allowedClasses:v5];

  return v6;
}

- (id)selectedContainedAssets:(BOOL)a3 allowedClasses:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  char v8 = [(PXSelectionContainer *)self selectedObjects:v4];
  id v9 = [v8 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __63__PXSelectionContainer_selectedContainedAssets_allowedClasses___block_invoke;
    int64x2_t v30 = &unk_1E5DBE0C8;
    v31 = self;
    SEL v32 = a2;
    PXMap();
  }
  if ([v9 conformsToProtocol:&unk_1F0387268]) {
    PXMap();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_opt_isKindOfClass())
        {

          uint64_t v16 = [PXArrayDataSection alloc];
          id v17 = v8;
          goto LABEL_16;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v34 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = +[PXDataSection dataSectionForAssetsInAssetContainers:](PXStackedDataSection, "dataSectionForAssetsInAssetContainers:", v8, v23);
LABEL_17:
    uint64_t v18 = (void *)v15;
    goto LABEL_18;
  }
  if (v9
    || !v4
    || ([(PXSelectionContainer *)self collection],
        id v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        !v20))
  {
    uint64_t v16 = [PXArrayDataSection alloc];
    id v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_16:
    uint64_t v15 = -[PXArrayDataSection initWithSectionContent:](v16, "initWithSectionContent:", v17, v23);
    goto LABEL_17;
  }
  id v21 = [(PXSelectionContainer *)self collection];
  v33 = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  uint64_t v18 = +[PXDataSection dataSectionForAssetsInAssetContainers:v22];

LABEL_18:
  return v18;
}

uint64_t __63__PXSelectionContainer_selectedContainedAssets_allowedClasses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetCollection];
}

uint64_t __63__PXSelectionContainer_selectedContainedAssets_allowedClasses___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 assetCollection];
}

- (BOOL)containsPeople
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_326];
}

uint64_t __38__PXSelectionContainer_containsPeople__block_invoke()
{
  return 1;
}

- (BOOL)containsAssetsWithNonEditableProperties
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_322_135477];
}

uint64_t __63__PXSelectionContainer_containsAssetsWithNonEditableProperties__block_invoke(uint64_t a1, void *a2)
{
  return [a2 canPerformEditOperation:3] ^ 1;
}

- (BOOL)containsNonContentSyndicationAssets
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_320];
}

uint64_t __59__PXSelectionContainer_containsNonContentSyndicationAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isSyndicatedAsset") ^ 1;
}

- (BOOL)containsContentSyndicationAssets
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_318];
}

uint64_t __56__PXSelectionContainer_containsContentSyndicationAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isSyndicatedAsset");
}

- (BOOL)containsUnsavedContentSyndicationAssets
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_316];
}

uint64_t __63__PXSelectionContainer_containsUnsavedContentSyndicationAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isUnsavedSyndicatedAsset");
}

- (BOOL)containsSpatialVideoAssets
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_314];
}

BOOL __50__PXSelectionContainer_containsSpatialVideoAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSpatialMedia]) {
    BOOL v3 = [v2 mediaType] == 2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)containsSpatialAssets
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_312];
}

uint64_t __45__PXSelectionContainer_containsSpatialAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSpatialMedia];
}

- (BOOL)containsRAWAssets
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_310];
}

uint64_t __41__PXSelectionContainer_containsRAWAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isRAW]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isRAWPlusJPEG];
  }

  return v3;
}

- (BOOL)containsRAWPlusJPEGAssets
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_308];
}

uint64_t __49__PXSelectionContainer_containsRAWPlusJPEGAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRAWPlusJPEG];
}

- (BOOL)containsReferencedFileAssets
{
  uint64_t v3 = objc_opt_class();
  return [(PXSelectionContainer *)self containsObjectOfClass:v3 passingTest:&__block_literal_global_135480];
}

uint64_t __52__PXSelectionContainer_containsReferencedFileAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isReferencedAsset];
}

- (BOOL)containsObjectOfClass:(Class)a3 passingTest:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PXSelectionContainer_containsObjectOfClass_passingTest___block_invoke;
  v9[3] = &unk_1E5DBE060;
  uint64_t v11 = &v12;
  id v7 = v6;
  id v10 = v7;
  [(PXSelectionContainer *)self enumerateSelectedObjectsOfClass:a3 usingBlock:v9];
  LOBYTE(a3) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)a3;
}

uint64_t __58__PXSelectionContainer_containsObjectOfClass_passingTest___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *a3;
  }
  *a3 = v6;
  return result;
}

- (id)selectedObjectsOfClass:(Class)a3
{
  long long v5 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PXSelectionContainer_selectedObjectsOfClass___block_invoke;
  v8[3] = &unk_1E5DC44A8;
  id v6 = v5;
  id v9 = v6;
  [(PXSelectionContainer *)self enumerateSelectedObjectsOfClass:a3 usingBlock:v8];

  return v6;
}

uint64_t __47__PXSelectionContainer_selectedObjectsOfClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateSelectedObjectsOfClass:(Class)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(PXSelectionContainer *)self selectionSnapshot];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PXSelectionContainer_enumerateSelectedObjectsOfClass_usingBlock___block_invoke;
  v9[3] = &unk_1E5DBE038;
  id v10 = v6;
  Class v11 = a3;
  id v8 = v6;
  [v7 enumerateSelectedObjectsUsingBlock:v9];
}

void __67__PXSelectionContainer_enumerateSelectedObjectsOfClass_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)singleSelectedObjectOfClass:(Class)a3
{
  if ([(PXSelectionContainer *)self selectionCount] == 1)
  {
    long long v5 = [(PXSelectionContainer *)self firstSelectedObjectOfClass:a3];
  }
  else
  {
    long long v5 = 0;
  }
  return v5;
}

- (id)firstSelectedObjectOfClass:(Class)a3
{
  id v3 = [(PXSelectionContainer *)self selectionSnapshot];
  BOOL v4 = [v3 firstObject];

  if (objc_opt_isKindOfClass()) {
    long long v5 = v4;
  }
  else {
    long long v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (PXFastEnumeration)selectedObjects
{
  if (!self->_selectedObjects)
  {
    id v3 = [(PXSelectionContainer *)self selectionSnapshot];
    BOOL v4 = [v3 fetchSelectedObjects];
    selectedObjects = self->_selectedObjects;
    self->_selectedObjects = v4;
  }
  id v6 = [(PXSelectionContainer *)self privacyController];
  char v7 = [v6 isLocked];

  if (v7) {
    id v8 = (PXFastEnumeration *)MEMORY[0x1E4F1CBF0];
  }
  else {
    id v8 = self->_selectedObjects;
  }
  return v8;
}

- (id)selectedObjects:(BOOL)a3
{
  if (a3 && ![(PXSelectionContainer *)self hasExplicitSelection])
  {
    BOOL v4 = [(PXSelectionContainer *)self allDataSourceObjects];
  }
  else
  {
    BOOL v4 = [(PXSelectionContainer *)self selectedObjects];
  }
  return v4;
}

- (BOOL)hasExplicitSelection
{
  return [(PXSelectionContainer *)self selectionCount] > 0;
}

- (int64_t)selectionCount
{
  id v3 = [(PXSelectionContainer *)self privacyController];
  char v4 = [v3 isLocked];

  if (v4) {
    return 0;
  }
  id v6 = [(PXSelectionContainer *)self selectionSnapshot];
  char v7 = [v6 selectedIndexPaths];
  int64_t v8 = [v7 count];

  return v8;
}

- (PXSelectionContainer)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSelectionContainer.m", 165, @"%s is not available as initializer", "-[PXSelectionContainer init]");

  abort();
}

- (PXSelectionContainer)initWithCollection:(id)a3 collectionFetcher:(id)a4 undoManager:(id)a5 context:(int64_t)a6
{
  id v10 = a4;
  Class v11 = [(PXSelectionContainer *)self initWithContent:MEMORY[0x1E4F1CBF0] collection:a3 undoManager:a5 context:a6];
  uint64_t v12 = v11;
  if (v11) {
    objc_storeWeak((id *)&v11->_collectionFetcher, v10);
  }

  return v12;
}

- (PXSelectionContainer)initWithContent:(id)a3 undoManager:(id)a4 context:(int64_t)a5
{
  return [(PXSelectionContainer *)self initWithContent:a3 collection:0 undoManager:a4 context:a5];
}

- (PXSelectionContainer)initWithContent:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[PXArrayDataSection alloc] initWithSectionContent:v12];

  uint64_t v14 = [(PXSelectionContainer *)self initWithDataSection:v13 collection:v11 undoManager:v10 context:a6];
  return v14;
}

- (PXSelectionContainer)initWithDataSection:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v24 = a4;
  id v9 = a5;
  id v10 = [PXStackedDataSource alloc];
  v26[0] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v12 = [(PXStackedDataSource *)v10 initWithDataSections:v11];

  id v13 = objc_alloc_init((Class)off_1E5DA7430);
  if ([v8 count] >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    while (1)
    {
      v25[0] = [(PXStackedDataSource *)v12 identifier];
      v25[1] = 0;
      v25[2] = v15;
      v25[3] = 0x7FFFFFFFFFFFFFFFLL;
      [v13 addIndexPath:v25];
      if (!v14) {
        break;
      }
LABEL_14:
      if (++v15 >= [v8 count]) {
        goto LABEL_18;
      }
    }
    id v16 = [v8 objectAtIndex:v15];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v17 = v16;

      if (!v17)
      {
        uint64_t v14 = 0;
        goto LABEL_13;
      }
      uint64_t v18 = +[PXContentPrivacyController privacyControllerForCollection:v17];
      id v16 = v18;
      if (v18 && [v18 isLocked])
      {
        id v16 = v16;
        uint64_t v14 = v16;
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  uint64_t v14 = 0;
LABEL_18:
  v19 = (void *)[objc_alloc((Class)off_1E5DA84E8) initWithDataSource:v12 selectedIndexPaths:v13];
  id v20 = [(PXSelectionContainer *)self initWithSelectionSnapshot:v19 collection:v24 undoManager:v9 context:a6 privacyController:v14 changeHistory:0];

  return v20;
}

- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 undoManager:(id)a4 context:(int64_t)a5
{
  return [(PXSelectionContainer *)self initWithSelectionSnapshot:a3 collection:0 undoManager:a4 context:a5 privacyController:0 changeHistory:0];
}

- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 undoManager:(id)a4 context:(int64_t)a5 privacyController:(id)a6
{
  return [(PXSelectionContainer *)self initWithSelectionSnapshot:a3 collection:0 undoManager:a4 context:a5 privacyController:a6 changeHistory:0];
}

- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6
{
  return [(PXSelectionContainer *)self initWithSelectionSnapshot:a3 collection:a4 undoManager:a5 context:a6 privacyController:0 changeHistory:0];
}

- (PXSelectionContainer)initWithSelectionSnapshot:(id)a3 collection:(id)a4 undoManager:(id)a5 context:(int64_t)a6 privacyController:(id)a7 changeHistory:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v28 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)PXSelectionContainer;
  uint64_t v18 = [(PXSelectionContainer *)&v29 init];
  if (v18)
  {
    id v26 = v16;
    v19 = (PXDisplayCollection *)v15;
    if (!v19)
    {
      id v20 = [v14 dataSource];
      id v25 = v14;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }

      v19 = [v21 containerCollection];

      id v14 = v25;
    }
    objc_storeStrong((id *)&v18->_selectionSnapshot, a3);
    objc_storeStrong((id *)&v18->_undoManager, a5);
    v18->_context = a6;
    collection = v18->_collection;
    v18->_collection = v19;
    long long v23 = v19;

    objc_storeStrong((id *)&v18->_privacyController, a7);
    objc_storeStrong((id *)&v18->_changeHistory, a8);

    id v16 = v26;
  }

  return v18;
}

@end