@interface PXSharingSuggestionSectionHeaderLayoutProvider
- (BOOL)successfullySharedAll;
- (BOOL)wantsHeaderForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (BOOL)wantsTopHeaderForDataSource:(id)a3;
- (NSDateIntervalFormatter)dateIntervalFormatter;
- (NSMutableSet)successfullySharedAssetCollections;
- (id)actionTextForActionType:(int64_t)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5;
- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (id)primaryTopHeaderTextForDataSource:(id)a3;
- (id)secondaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (id)secondaryTopHeaderTextForDataSource:(id)a3;
- (int64_t)actionTypeForHeaderLayout:(id)a3;
- (void)_handleShareAssetCollectionCompletion:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5;
- (void)setSuccessfullySharedAll:(BOOL)a3;
@end

@implementation PXSharingSuggestionSectionHeaderLayoutProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successfullySharedAssetCollections, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
}

- (void)setSuccessfullySharedAll:(BOOL)a3
{
  self->_successfullySharedAll = a3;
}

- (BOOL)successfullySharedAll
{
  return self->_successfullySharedAll;
}

- (void)_handleShareAssetCollectionCompletion:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v6)
    {
LABEL_3:
      if (v9)
      {
        v11 = [(PXSharingSuggestionSectionHeaderLayoutProvider *)self successfullySharedAssetCollections];
        [v11 addObject:v9];
      }
      else
      {
        [(PXSharingSuggestionSectionHeaderLayoutProvider *)self setSuccessfullySharedAll:1];
      }
      v12 = [(PXActionableSectionHeaderLayoutProvider *)self topHeaderInvalidationDelegate];
      [v12 photosSectionHeaderLayoutInvalidateConfiguredLayouts:self];

      v13 = [(PXActionableSectionHeaderLayoutProvider *)self invalidationDelegate];
      [v13 photosSectionHeaderLayoutInvalidateConfiguredLayouts:self];

      goto LABEL_11;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXSharingSuggestionSectionHeaderLayoutProvider.m", 202, @"Invalid parameter not satisfying: %@", @"NSThread.isMainThread" object file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
  }
  v15 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Failed to move items to shared library in section %@, error:%@", buf, 0x16u);
  }

LABEL_11:
}

- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    id v10 = [(PXActionableSectionHeaderLayoutProvider *)self viewModel];
    v11 = v10;
    if (a4 == 5)
    {
      v12 = 0;
    }
    else
    {
      v13 = [v10 currentDataSource];
      if (v8) {
        [v8 sectionIndexPath];
      }
      else {
        memset(v32, 0, sizeof(v32));
      }
      v12 = [v13 assetCollectionAtSectionIndexPath:v32];
    }
    v14 = [v11 selectionManager];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke;
    v29[3] = &unk_1E5DCFE48;
    BOOL v31 = a4 == 5;
    id v30 = v8;
    [v14 performChanges:v29];
    v15 = [v11 assetActionManager];
    v16 = [v15 actionPerformerForActionType:@"PXAssetActionTypeMoveToSharedLibrary"];

    if (!v16) {
      PXAssertGetLog();
    }
    BOOL v17 = a4 == 5;
    __int16 v18 = [v11 dataSourceManager];
    id v19 = v18;
    *(void *)buf = 0;
    v34 = buf;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__170392;
    v37 = __Block_byref_object_dispose__170393;
    id v38 = 0;
    if (v17)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_220;
      v28[3] = &unk_1E5DD1368;
      v28[4] = buf;
      [v18 performChanges:v28];
    }
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_2;
    v22[3] = &unk_1E5DC1A48;
    objc_copyWeak(&v26, &location);
    id v23 = v12;
    v25 = buf;
    id v20 = v19;
    id v24 = v20;
    [v16 performActionWithCompletionHandler:v22];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

    [v14 performChanges:&__block_literal_global_170394];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PXSharingSuggestionSectionHeaderLayoutProvider;
    [(PXActionableSectionHeaderLayoutProvider *)&v21 sectionHeader:v8 didPressButtonForActionType:a4 sender:v9];
  }
}

void __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 deselectAll];
  if (*(unsigned char *)(a1 + 40))
  {
    [v3 selectAllItems];
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    if (v4) {
      [v4 sectionIndexPath];
    }
    else {
      memset(v5, 0, sizeof(v5));
    }
    [v3 selectAllItemsInSection:v5];
  }
}

void __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_220(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 pauseChangeDeliveryWithTimeout:@"Sharing Suggestion" identifier:30.0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (id *)(a1 + 56);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleShareAssetCollectionCompletion:*(void *)(a1 + 32) success:a2 error:v6];

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (a2) {
      int64_t v8 = 2000000000;
    }
    else {
      int64_t v8 = 0;
    }
    dispatch_time_t v9 = dispatch_time(0, v8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_3;
    v12[3] = &unk_1E5DD0588;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = v10;
    uint64_t v14 = v11;
    dispatch_after(v9, MEMORY[0x1E4F14428], v12);
  }
}

uint64_t __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

uint64_t __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_4;
  v3[3] = &unk_1E5DD1368;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 performChanges:v3];
}

uint64_t __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 resumeChangeDeliveryAndBackgroundLoading:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (id)actionTextForActionType:(int64_t)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5
{
  id v9 = a4;
  if ((unint64_t)a3 > 0xA)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXSharingSuggestionSectionHeaderLayoutProvider.m" lineNumber:145 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v10 = v9;
  if (((1 << a3) & 0x7CF) != 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)PXSharingSuggestionSectionHeaderLayoutProvider;
    long long v11 = *(_OWORD *)&a5->item;
    v17[0] = *(_OWORD *)&a5->dataSourceIdentifier;
    v17[1] = v11;
    uint64_t v12 = [(PXActionableSectionHeaderLayoutProvider *)&v18 actionTextForActionType:a3 dataSource:v9 sectionIndexPath:v17];
  }
  else
  {
    if (a3 == 4) {
      v15 = @"PXSharedLibrarySharingSuggestionHeaderMoveAction";
    }
    else {
      v15 = @"PXSharedLibrarySharingSuggestionHeaderMoveAllAction";
    }
    uint64_t v12 = PXLocalizedSharedLibraryString(v15);
  }
  id v13 = (void *)v12;

  return v13;
}

- (int64_t)actionTypeForHeaderLayout:(id)a3
{
  id v4 = a3;
  if (![v4 isTopHeader])
  {
    if (![v4 isInSelectMode])
    {
      int64_t v5 = 4;
      goto LABEL_11;
    }
    id v10 = self;
    id v6 = (objc_super *)&v10;
    goto LABEL_8;
  }
  if (![(PXSharingSuggestionSectionHeaderLayoutProvider *)self successfullySharedAll])
  {
    v7 = [(PXActionableSectionHeaderLayoutProvider *)self viewModel];
    int v8 = [v7 isInSelectMode];

    if (!v8)
    {
      int64_t v5 = 5;
      goto LABEL_11;
    }
    v11.receiver = self;
    id v6 = &v11;
LABEL_8:
    v6->super_class = (Class)PXSharingSuggestionSectionHeaderLayoutProvider;
    int64_t v5 = (int64_t)-[objc_super actionTypeForHeaderLayout:](v6, sel_actionTypeForHeaderLayout_, v4, v10);
    goto LABEL_11;
  }
  int64_t v5 = 6;
LABEL_11:

  return v5;
}

- (id)secondaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  long long v4 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v4;
  int64_t v5 = [a3 assetCollectionAtSectionIndexPath:v8];
  id v6 = [v5 localizedSubtitle];

  return v6;
}

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  long long v4 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v4;
  int64_t v5 = [a3 assetCollectionAtSectionIndexPath:v8];
  id v6 = [v5 localizedTitle];

  return v6;
}

- (id)secondaryTopHeaderTextForDataSource:(id)a3
{
  if ([(PXSharingSuggestionSectionHeaderLayoutProvider *)self successfullySharedAll]) {
    uint64_t v3 = @"PXSharedLibrarySharingSuggestionHeaderMoveAllSuccessSubtitle";
  }
  else {
    uint64_t v3 = @"PXSharedLibrarySharingSuggestionHeaderMoveAllSubtitle";
  }
  long long v4 = PXLocalizedSharedLibraryString(v3);
  return v4;
}

- (id)primaryTopHeaderTextForDataSource:(id)a3
{
  id v4 = a3;
  int64_t v5 = PXLocalizedAssetCountForUsage([v4 totalNumberOfItems], 0, 0, 0);
  id v6 = [v4 containerCollection];
  if (objc_msgSend(v6, "px_isSharedLibrarySharingSuggestionsSmartAlbum")
    && [v4 containsAnyItems])
  {
    if (v4)
    {
      [v4 firstItemIndexPath];
      v7 = [v4 assetAtItemIndexPath:v21];
      [v4 lastItemIndexPath];
    }
    else
    {
      memset(v21, 0, sizeof(v21));
      v7 = [0 assetAtItemIndexPath:v21];
      memset(v20, 0, sizeof(v20));
    }
    id v9 = [v4 assetAtItemIndexPath:v20];
    if ([v4 startsAtEnd]) {
      id v10 = v7;
    }
    else {
      id v10 = v9;
    }
    objc_super v11 = [v10 creationDate];
    if ([v4 startsAtEnd]) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = v7;
    }
    uint64_t v13 = [v12 creationDate];
    uint64_t v14 = (void *)v13;
    int v8 = 0;
    if (v11 && v13)
    {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v13];
      v16 = [(PXSharingSuggestionSectionHeaderLayoutProvider *)self dateIntervalFormatter];
      int v8 = [v16 stringFromDateInterval:v15];
    }
  }
  else
  {
    int v8 = PXDisplayCollectionGetLocalizedSubtitleWithoutDelimiters(v6);
  }
  if ([v8 length])
  {
    BOOL v17 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySharingSuggestionHeaderMoveAllTitleFormat");
    PXStringWithValidatedFormat();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = v5;
  }

  return v18;
}

- (BOOL)wantsHeaderForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  id v4 = [a3 containerCollection];
  char v5 = objc_msgSend(v4, "px_isSharedLibrarySharingSuggestionsSmartAlbum") ^ 1;

  return v5;
}

- (BOOL)wantsTopHeaderForDataSource:(id)a3
{
  id v3 = a3;
  id v4 = [v3 containerCollection];
  BOOL v5 = (objc_msgSend(v4, "px_isSharedLibrarySharingSuggestionsSmartAlbum") & 1) != 0
    || [v3 numberOfSections] > 1;

  return v5;
}

- (NSMutableSet)successfullySharedAssetCollections
{
  successfullySharedAssetCollections = self->_successfullySharedAssetCollections;
  if (!successfullySharedAssetCollections)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    BOOL v5 = self->_successfullySharedAssetCollections;
    self->_successfullySharedAssetCollections = v4;

    successfullySharedAssetCollections = self->_successfullySharedAssetCollections;
  }
  return successfullySharedAssetCollections;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  dateIntervalFormatter = self->_dateIntervalFormatter;
  if (!dateIntervalFormatter)
  {
    id v4 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x1E4F28C20]);
    BOOL v5 = self->_dateIntervalFormatter;
    self->_dateIntervalFormatter = v4;

    id v6 = [(NSDateIntervalFormatter *)self->_dateIntervalFormatter px_dateTemplateForGranularity:8 abbreviated:1];
    [(NSDateIntervalFormatter *)self->_dateIntervalFormatter setDateTemplate:v6];

    dateIntervalFormatter = self->_dateIntervalFormatter;
  }
  return dateIntervalFormatter;
}

@end