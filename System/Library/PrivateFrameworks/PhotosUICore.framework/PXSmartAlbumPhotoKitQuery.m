@interface PXSmartAlbumPhotoKitQuery
+ (id)queryWithSmartAlbum:(id)a3 collectionList:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
+ (void)_createSmartAlbumWithTitle:(id)a3 inCollectionList:(id)a4 query:(id)a5 photoLibrary:(id)a6 completionHandler:(id)a7;
+ (void)_editSmartAlbum:(id)a3 title:(id)a4 query:(id)a5 completionHandler:(id)a6;
- (BOOL)canPersistChanges;
- (NSArray)conditions;
- (NSArray)conjunctionValues;
- (NSString)statusString;
- (NSString)title;
- (PXLabeledValue)conjunctionValue;
- (PXSmartAlbumPhotoKitQuery)init;
- (PXSmartAlbumQueryDelegate)delegate;
- (id)_initWithSmartAlbum:(id)a3 collectionList:(id)a4 photoLibrary:(id)a5 query:(id)a6 editingContext:(id)a7 conditions:(id)a8;
- (id)addNewConditionAfterCondition:(id)a3;
- (id)replaceCondition:(id)a3 withConditionOfType:(int64_t)a4;
- (void)_updateCanPersistChanges;
- (void)_updateFetchResultCountObserver;
- (void)_updateQueryFromConditions;
- (void)_updateStatusString;
- (void)persistChangesWithCompletion:(id)a3;
- (void)removeCondition:(id)a3;
- (void)setCanPersistChanges:(BOOL)a3;
- (void)setConditions:(id)a3;
- (void)setConjunctionValue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStatusString:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXSmartAlbumPhotoKitQuery

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_conjunctionValue, 0);
  objc_storeStrong((id *)&self->_conjunctionValues, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fetchResultCountObserver, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_editingContext, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_albumToEdit, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXSmartAlbumQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSmartAlbumQueryDelegate *)WeakRetained;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (BOOL)canPersistChanges
{
  return self->_canPersistChanges;
}

- (void)setConditions:(id)a3
{
}

- (NSArray)conditions
{
  return &self->_conditions->super;
}

- (NSArray)conjunctionValues
{
  return self->_conjunctionValues;
}

- (NSString)title
{
  return self->_title;
}

- (void)_updateStatusString
{
  if ([MEMORY[0x1E4F8AB08] includesHiddenAssetsKeyInQuery:self->_query]
    && PLIsContentPrivacyEnabled())
  {
    v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: Query contains hidden assets so clearing status string", buf, 2u);
    }

    v4 = &stru_1F00B0030;
  }
  else
  {
    int64_t v5 = [(PXFetchResultCountObserver *)self->_fetchResultCountObserver fetchResultCount];
    v6 = PXLocalizedStringFromTable(@"PXSmartAlbumResultsCountString", @"PXSmartAlbumStrings");
    int64_t v7 = v5;
    PXLocalizedStringWithValidatedFormat(v6, @"%ld");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[PXSmartAlbumPhotoKitQuery setStatusString:](self, "setStatusString:", v4, v7);
}

- (void)_updateQueryFromConditions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(PLQuery *)self->_query clearSingleQueries];
  conditions = self->_conditions;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PXSmartAlbumPhotoKitQuery__updateQueryFromConditions__block_invoke;
  v6[3] = &unk_1E5DB0B98;
  v6[4] = self;
  [(NSMutableArray *)conditions enumerateObjectsUsingBlock:v6];
  v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int64_t v5 = [(PLQuery *)self->_query logDescription];
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: updated query: %@", buf, 0xCu);
  }
  [(PXSmartAlbumPhotoKitQuery *)self _updateStatusString];
  [(PXSmartAlbumPhotoKitQuery *)self _updateFetchResultCountObserver];
}

void __55__PXSmartAlbumPhotoKitQuery__updateQueryFromConditions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 singleQuery];
  [*(id *)(*(void *)(a1 + 32) + 48) addSingleQueries:v3];
}

- (void)_updateFetchResultCountObserver
{
  id v3 = [(PHPhotoLibrary *)self->_photoLibrary photoLibrary];
  id v4 = objc_alloc_init(MEMORY[0x1E4F8AB00]);
  int64_t v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v6 = [MEMORY[0x1E4F8AB08] predicateForQuery:self->_query inLibrary:v3 changeDetectionCriteria:v4];
  [v5 setInternalPredicate:v6];

  objc_msgSend(v5, "setIncludeHiddenAssets:", objc_msgSend(MEMORY[0x1E4F8AB08], "includesHiddenAssetsKeyInQuery:", self->_query));
  int64_t v7 = [PXFetchResultCountObserver alloc];
  photoLibrary = self->_photoLibrary;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__PXSmartAlbumPhotoKitQuery__updateFetchResultCountObserver__block_invoke;
  v14[3] = &unk_1E5DC9B30;
  id v9 = v5;
  id v15 = v9;
  v10 = [(PXFetchResultCountObserver *)v7 initWithQOSClass:25 photoLibrary:photoLibrary fetchResultBlock:v14];
  fetchResultCountObserver = self->_fetchResultCountObserver;
  self->_fetchResultCountObserver = v10;

  [(PXFetchResultCountObserver *)self->_fetchResultCountObserver setDelegate:self];
  v12 = PLUIGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: updated asset count observer", v13, 2u);
  }
}

uint64_t __60__PXSmartAlbumPhotoKitQuery__updateFetchResultCountObserver__block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:*(void *)(a1 + 32)];
}

- (void)_updateCanPersistChanges
{
  id v3 = [(PXSmartAlbumPhotoKitQuery *)self title];
  -[PXSmartAlbumPhotoKitQuery setCanPersistChanges:](self, "setCanPersistChanges:", [v3 length] != 0);
}

- (void)setStatusString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = (NSString *)a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitQuery.m", 230, @"Invalid parameter not satisfying: %@", @"statusString" object file lineNumber description];
  }
  int64_t v7 = self->_statusString;
  if (v7 == v6)
  {
  }
  else
  {
    v8 = v7;
    BOOL v9 = [(NSString *)v7 isEqualToString:v6];

    if (!v9)
    {
      objc_storeStrong((id *)&self->_statusString, a3);
      v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: status string set to: \"%@\"", buf, 0xCu);
      }

      v11 = [(PXSmartAlbumPhotoKitQuery *)self delegate];
      [v11 statusStringDidChangeForQuery:self];
    }
  }
}

- (void)persistChangesWithCompletion:(id)a3
{
  id v4 = a3;
  albumToEdit = self->_albumToEdit;
  v6 = objc_opt_class();
  if (albumToEdit)
  {
    int64_t v7 = self->_albumToEdit;
    title = self->_title;
    query = self->_query;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__PXSmartAlbumPhotoKitQuery_persistChangesWithCompletion___block_invoke;
    v19[3] = &unk_1E5DB0BC0;
    v10 = &v20;
    id v20 = v4;
    id v11 = v4;
    [v6 _editSmartAlbum:v7 title:title query:query completionHandler:v19];
  }
  else
  {
    v12 = self->_title;
    v13 = self->_query;
    collectionList = self->_collectionList;
    photoLibrary = self->_photoLibrary;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__PXSmartAlbumPhotoKitQuery_persistChangesWithCompletion___block_invoke_2;
    v17[3] = &unk_1E5DB0BC0;
    v10 = &v18;
    id v18 = v4;
    id v16 = v4;
    [v6 _createSmartAlbumWithTitle:v12 inCollectionList:collectionList query:v13 photoLibrary:photoLibrary completionHandler:v17];
  }
}

uint64_t __58__PXSmartAlbumPhotoKitQuery_persistChangesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __58__PXSmartAlbumPhotoKitQuery_persistChangesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setCanPersistChanges:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_canPersistChanges != a3)
  {
    BOOL v3 = a3;
    self->_canPersistChanges = a3;
    int64_t v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = @"NO";
      if (v3) {
        v6 = @"YES";
      }
      int64_t v7 = v6;
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: can persist changes set to: %@", (uint8_t *)&v9, 0xCu);
    }
    v8 = [(PXSmartAlbumPhotoKitQuery *)self delegate];
    [v8 canPersistChangesDidChangeForQuery:self];
  }
}

- (void)removeCondition:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:0];
  [(NSMutableArray *)self->_conditions removeObject:v4];

  [(PXSmartAlbumPhotoKitQuery *)self _updateQueryFromConditions];
}

- (id)replaceCondition:(id)a3 withConditionOfType:(int64_t)a4
{
  id v7 = a3;
  uint64_t v8 = [(NSMutableArray *)self->_conditions indexOfObject:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitQuery.m", 188, @"Invalid parameter not satisfying: %@", @"index != NSNotFound" object file lineNumber description];
  }
  [v7 setDelegate:0];
  int v9 = +[PXSmartAlbumCondition conditionWithConditionType:a4 editingContext:self->_editingContext];
  [v9 setDelegate:self];
  [(NSMutableArray *)self->_conditions replaceObjectAtIndex:v8 withObject:v9];
  [(PXSmartAlbumPhotoKitQuery *)self _updateQueryFromConditions];

  return v9;
}

- (id)addNewConditionAfterCondition:(id)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_conditions indexOfObject:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitQuery.m", 178, @"Invalid parameter not satisfying: %@", @"index != NSNotFound" object file lineNumber description];
  }
  v6 = +[PXSmartAlbumCondition conditionWithConditionType:4 editingContext:self->_editingContext];
  [v6 setDelegate:self];
  [(NSMutableArray *)self->_conditions insertObject:v6 atIndex:v5 + 1];
  [(PXSmartAlbumPhotoKitQuery *)self _updateQueryFromConditions];
  return v6;
}

- (void)setConjunctionValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitQuery.m", 165, @"Invalid parameter not satisfying: %@", @"conjunctionValue" object file lineNumber description];
  }
  v6 = [v5 value];
  uint64_t v7 = [v6 integerValue];
  if ([(PLQuery *)self->_query conjunction] != v7)
  {
    [(PLQuery *)self->_query setConjunction:v7];
    uint64_t v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = PLStringFromPLQueryConjunction();
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: conjunction value set to: \"%@\"", buf, 0xCu);
    }
    [(PXSmartAlbumPhotoKitQuery *)self _updateFetchResultCountObserver];
  }
}

- (PXLabeledValue)conjunctionValue
{
  uint64_t v3 = [(PLQuery *)self->_query conjunction];
  id v4 = [(PXSmartAlbumPhotoKitQuery *)self conjunctionValues];
  id v5 = [NSNumber numberWithInt:v3];
  v6 = PXLabeledValueForValueInLabeledValues(v4, v5);

  return (PXLabeledValue *)v6;
}

- (void)setTitle:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = (NSString *)a3;
  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitQuery.m", 148, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  uint64_t v7 = self->_title;
  if (v7 == v6)
  {
  }
  else
  {
    uint64_t v8 = v7;
    BOOL v9 = [(NSString *)v7 isEqualToString:v6];

    if (!v9)
    {
      objc_storeStrong((id *)&self->_title, a3);
      v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v6;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: title set to: \"%@\"", buf, 0xCu);
      }

      [(PXSmartAlbumPhotoKitQuery *)self _updateCanPersistChanges];
    }
  }
}

- (id)_initWithSmartAlbum:(id)a3 collectionList:(id)a4 photoLibrary:(id)a5 query:(id)a6 editingContext:(id)a7 conditions:(id)a8
{
  id v39 = a3;
  id v38 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_13:
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitQuery.m", 75, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitQuery.m", 74, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

  if (!v16) {
    goto LABEL_13;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_14:
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitQuery.m", 76, @"Invalid parameter not satisfying: %@", @"editingContext" object file lineNumber description];

LABEL_4:
  if (![v18 count])
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitQuery.m", 77, @"Invalid parameter not satisfying: %@", @"conditions.count" object file lineNumber description];
  }
  v42.receiver = self;
  v42.super_class = (Class)PXSmartAlbumPhotoKitQuery;
  v19 = [(PXSmartAlbumPhotoKitQuery *)&v42 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_albumToEdit, a3);
    objc_storeStrong((id *)&v20->_collectionList, a4);
    objc_storeStrong((id *)&v20->_photoLibrary, a5);
    objc_storeStrong((id *)&v20->_query, a6);
    v21 = [v39 localizedTitle];
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      PXLocalizedStringFromTable(@"PXSmartAlbumDefaultName", @"PXSmartAlbumStrings");
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    title = v20->_title;
    v20->_title = v23;

    v25 = PXSmartAlbumLocalizedStringsForConjunctionValues(&unk_1F02D3418);
    uint64_t v26 = PXLabeledValuesWithValuesAndLocalizedLabels(&unk_1F02D3418, v25);
    conjunctionValues = v20->_conjunctionValues;
    v20->_conjunctionValues = (NSArray *)v26;

    objc_storeStrong((id *)&v20->_editingContext, a7);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __109__PXSmartAlbumPhotoKitQuery__initWithSmartAlbum_collectionList_photoLibrary_query_editingContext_conditions___block_invoke;
    v40[3] = &unk_1E5DB0B98;
    v28 = v20;
    v41 = v28;
    [v18 enumerateObjectsUsingBlock:v40];
    uint64_t v29 = [v18 mutableCopy];
    conditions = v28->_conditions;
    v28->_conditions = (NSMutableArray *)v29;

    [(PXSmartAlbumPhotoKitQuery *)v28 _updateCanPersistChanges];
    statusString = v28->_statusString;
    v28->_statusString = (NSString *)&stru_1F00B0030;

    [(PXSmartAlbumPhotoKitQuery *)v28 _updateFetchResultCountObserver];
  }

  return v20;
}

uint64_t __109__PXSmartAlbumPhotoKitQuery__initWithSmartAlbum_collectionList_photoLibrary_query_editingContext_conditions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

- (PXSmartAlbumPhotoKitQuery)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSmartAlbumPhotoKitQuery.m", 70, @"%s is not available as initializer", "-[PXSmartAlbumPhotoKitQuery init]");

  abort();
}

+ (void)_editSmartAlbum:(id)a3 title:(id)a4 query:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 315, @"Invalid parameter not satisfying: %@", @"albumToEdit" object file lineNumber description];
  }
  if ([v11 assetCollectionType] != 2)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 316, @"Invalid parameter not satisfying: %@", @"albumToEdit.assetCollectionType == PHAssetCollectionTypeSmartAlbum" object file lineNumber description];
  }
  if ([v12 length])
  {
    if (v13) {
      goto LABEL_7;
    }
LABEL_10:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 318, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v14) {
      goto LABEL_8;
    }
LABEL_11:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 319, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_8;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 317, @"Invalid parameter not satisfying: %@", @"title.length" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_7:
  if (!v14) {
    goto LABEL_11;
  }
LABEL_8:
  id v15 = [v11 photoLibrary];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke;
  v29[3] = &unk_1E5DD0F30;
  id v30 = v11;
  id v31 = v12;
  id v32 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke_2;
  v25[3] = &unk_1E5DD1B00;
  id v26 = v30;
  id v27 = v32;
  id v28 = v14;
  id v16 = v14;
  id v17 = v32;
  id v18 = v30;
  id v19 = v12;
  [v15 performChanges:v29 completionHandler:v25];
}

void __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x1E4F392F8] changeRequestForSmartAlbum:a1[4]];
  [v2 setTitle:a1[5]];
  [v2 setUserQuery:a1[6]];
}

void __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke_2(id *a1, int a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = [a1[4] localIdentifier];
    uint64_t v7 = [a1[4] photoLibrary];
    uint64_t v8 = [v7 librarySpecificFetchOptions];

    [v8 setIncludeUserSmartAlbums:1];
    BOOL v9 = (void *)MEMORY[0x1E4F38EE8];
    v23[0] = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    id v11 = [v9 fetchAssetCollectionsWithLocalIdentifiers:v10 options:v8];

    id v12 = [v11 firstObject];
    id v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [a1[5] logDescription];
      *(_DWORD *)buf = 138412546;
      id v20 = v12;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: Edited existing smart album: %@, query: %@", buf, 0x16u);
    }
    id v15 = 0;
  }
  else
  {
    id v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "PXSmartAlbums: Failed to edit existing smart album: %@", buf, 0xCu);
    }

    id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXSmartAlbumErrorDomain", -1001, v5, @"Failed to edit existing smart album: underlying error");
    id v12 = 0;
  }
  a1[6];
  id v17 = v15;
  id v18 = v12;
  px_dispatch_on_main_queue();
}

uint64_t __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke_280(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)_createSmartAlbumWithTitle:(id)a3 inCollectionList:(id)a4 query:(id)a5 photoLibrary:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ([v13 length])
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 275, @"Invalid parameter not satisfying: %@", @"title.length" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 276, @"Invalid parameter not satisfying: %@", @"collectionList" object file lineNumber description];

  if (v15)
  {
LABEL_4:
    if (v16) {
      goto LABEL_5;
    }
LABEL_10:
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 278, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    if (v17) {
      goto LABEL_6;
    }
LABEL_11:
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 279, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_6;
  }
LABEL_9:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 277, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

  if (!v16) {
    goto LABEL_10;
  }
LABEL_5:
  if (!v17) {
    goto LABEL_11;
  }
LABEL_6:
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__17821;
  v39[4] = __Block_byref_object_dispose__17822;
  id v40 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke;
  v33[3] = &unk_1E5DBDC78;
  id v18 = v13;
  id v34 = v18;
  id v35 = v15;
  id v38 = v39;
  id v36 = v16;
  id v19 = v14;
  id v37 = v19;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke_2;
  v28[3] = &unk_1E5DCD048;
  id v20 = v36;
  id v29 = v20;
  id v32 = v39;
  id v21 = v35;
  id v30 = v21;
  id v22 = v17;
  id v31 = v22;
  [v20 performChanges:v33 completionHandler:v28];

  _Block_object_dispose(v39, 8);
}

void __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F392F8] creationRequestForSmartAlbumWithTitle:*(void *)(a1 + 32) userQuery:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 placeholderForCreatedSmartAlbum];
  uint64_t v4 = [v3 localIdentifier];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*(id *)(a1 + 48) librarySpecificFetchOptions];
  [v7 setIncludeUserSmartAlbums:1];
  uint64_t v8 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:*(void *)(a1 + 56) options:v7];
  BOOL v9 = [MEMORY[0x1E4F39010] changeRequestForCollectionList:*(void *)(a1 + 56) childCollections:v8];
  v12[0] = v3;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v11 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v9 insertChildCollections:v10 atIndexes:v11];
}

void __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
    [v6 setIncludeUserSmartAlbums:1];
    uint64_t v7 = (void *)MEMORY[0x1E4F38EE8];
    v21[0] = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    BOOL v9 = [v7 fetchAssetCollectionsWithLocalIdentifiers:v8 options:v6];

    v10 = [v9 firstObject];
    id v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 40) logDescription];
      *(_DWORD *)buf = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: Created new smart album: %@, query: %@", buf, 0x16u);
    }
    id v13 = 0;
  }
  else
  {
    id v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "PXSmartAlbums: Failed to create new smart album: %@", buf, 0xCu);
    }

    id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXSmartAlbumErrorDomain", -1001, v5, @"Failed to create new smart album: underlying error");
    v10 = 0;
  }
  *(id *)(a1 + 48);
  id v15 = v13;
  id v16 = v10;
  px_dispatch_on_main_queue();
}

uint64_t __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke_269(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)queryWithSmartAlbum:(id)a3 collectionList:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v13;
  if (v11 || v12 && v13)
  {
    if (a6) {
      goto LABEL_5;
    }
  }
  else
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 107, @"Invalid parameter not satisfying: %@", @"albumToEdit || (collectionList && photoLibrary)" object file lineNumber description];

    if (a6)
    {
LABEL_5:
      if (v14) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  id v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 108, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

  if (!v14)
  {
LABEL_6:
    id v14 = [v11 photoLibrary];
  }
LABEL_7:
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__17821;
  id v40 = __Block_byref_object_dispose__17822;
  id v41 = 0;
  if (v11)
  {
    id v15 = [v11 photoLibrary];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __83__PXSmartAlbumPhotoKitQuery_queryWithSmartAlbum_collectionList_photoLibrary_error___block_invoke;
    v33[3] = &unk_1E5DD0588;
    id v34 = v11;
    id v35 = &v36;
    id v32 = 0;
    [v15 performChangesAndWait:v33 error:&v32];
    id v16 = v32;

    id v17 = v34;
  }
  else
  {
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F8B9A8]) initWithConjunction:1];
    [v17 addIsFavoriteQuery:1];
    uint64_t v18 = [v17 query];
    __int16 v19 = (void *)v37[5];
    v37[5] = v18;

    id v16 = 0;
  }

  if (v37[5])
  {
    id v20 = [[PXSmartAlbumPhotoKitEditingContext alloc] initWithPhotoLibrary:v14];
    uint64_t v21 = v37[5];
    id v31 = 0;
    id v22 = +[PXSmartAlbumCondition conditionsForQuery:v21 editingContext:v20 error:&v31];
    id v23 = v31;
    if (v22)
    {
      if (![v22 count])
      {
        id v30 = [MEMORY[0x1E4F28B00] currentHandler];
        [v30 handleFailureInMethod:a2, a1, @"PXSmartAlbumPhotoKitQuery.m", 133, @"Invalid parameter not satisfying: %@", @"conditions.count" object file lineNumber description];
      }
      id v24 = objc_alloc((Class)a1);
      v25 = (void *)[v24 _initWithSmartAlbum:v11 collectionList:v12 photoLibrary:v14 query:v37[5] editingContext:v20 conditions:v22];
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    id v26 = PLUIGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v16;
      _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "PXSmartAlbums: Failed to get query from smart album: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXSmartAlbumErrorDomain", -1001, v16, @"Failed to get query from smart album: underlying error");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
  }
  if (v23)
  {

    v25 = 0;
    *a6 = v23;
  }

  _Block_object_dispose(&v36, 8);
  return v25;
}

void __83__PXSmartAlbumPhotoKitQuery_queryWithSmartAlbum_collectionList_photoLibrary_error___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F392F8] changeRequestForSmartAlbum:*(void *)(a1 + 32)];
  uint64_t v2 = [v5 userQuery];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end