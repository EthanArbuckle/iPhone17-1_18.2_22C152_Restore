@interface SYDocumentFetchRequest
+ (BOOL)_isSearchableItemValid:(id)a3 loggableErrorDescription:(id *)a4;
+ (id)_buildResultWithMatches:(id)a3;
+ (id)_contentURLForItem:(id)a3;
+ (id)_itemIdFromSearchableItem:(id)a3;
+ (void)_fetchDocumentsWithReason:(id)a3 queryString:(id)a4 completion:(id)a5;
+ (void)fetchAllDocumentsMatchingAnyIndexIdWithCompletion:(id)a3;
+ (void)fetchDocumentsWithIndexIds:(id)a3 completion:(id)a4;
@end

@implementation SYDocumentFetchRequest

+ (void)fetchAllDocumentsMatchingAnyIndexIdWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "Fetching all documents matching any id", buf, 2u);
  }

  v6 = [NSString stringWithFormat:@"(%@ = '*') && (kMDItemIsTrashed != 1)", @"SYDocumentRelatedUniqueIdentifierKey"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SYDocumentFetchRequest_fetchAllDocumentsMatchingAnyIndexIdWithCompletion___block_invoke;
  v8[3] = &unk_1E6463820;
  id v9 = v4;
  id v10 = a1;
  id v7 = v4;
  [a1 _fetchDocumentsWithReason:@"Document Workflows: Fetch documents to update link state." queryString:v6 completion:v8];
}

void __76__SYDocumentFetchRequest_fetchAllDocumentsMatchingAnyIndexIdWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = [v5 _buildResultWithMatches:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)fetchDocumentsWithIndexIds:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v21 = v6;
    _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_DEFAULT, "Fetching documents matching ids: %{private}@", buf, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F28E78] string];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__SYDocumentFetchRequest_fetchDocumentsWithIndexIds_completion___block_invoke;
  v17[3] = &unk_1E6463848;
  id v18 = v9;
  id v19 = v6;
  id v10 = v6;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:v17];
  v12 = [NSString stringWithFormat:@"(kMDItemIsTrashed != 1) && (%@)", v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__SYDocumentFetchRequest_fetchDocumentsWithIndexIds_completion___block_invoke_2;
  v14[3] = &unk_1E6463820;
  id v15 = v7;
  id v16 = a1;
  id v13 = v7;
  [a1 _fetchDocumentsWithReason:@"Document Workflows: Fetch documents for unlinking." queryString:v12 completion:v14];
}

uint64_t __64__SYDocumentFetchRequest_fetchDocumentsWithIndexIds_completion___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  [*(id *)(a1 + 32) appendFormat:@"(%@ = '%@')", @"SYDocumentRelatedUniqueIdentifierKey", a2];
  uint64_t result = [*(id *)(a1 + 40) count];
  if (result - 1 > a3)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 appendString:@" || "];
  }
  return result;
}

void __64__SYDocumentFetchRequest_fetchDocumentsWithIndexIds_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = [v5 _buildResultWithMatches:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_fetchDocumentsWithReason:(id)a3 queryString:(id)a4 completion:(id)a5
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F23830];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setReason:v10];

  v26[0] = @"SYDocumentRelatedUniqueIdentifierKey";
  v26[1] = @"kMDItemContentURL";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [v11 setFetchAttributes:v12];

  id v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[SYDocumentFetchRequest _fetchDocumentsWithReason:queryString:completion:]((uint64_t)v7, v13);
  }

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v7 context:v11];
  id v15 = [MEMORY[0x1E4F1CA48] array];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__SYDocumentFetchRequest__fetchDocumentsWithReason_queryString_completion___block_invoke;
  v24[3] = &unk_1E6463870;
  id v16 = v15;
  id v25 = v16;
  [v14 setFoundItemsHandler:v24];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__SYDocumentFetchRequest__fetchDocumentsWithReason_queryString_completion___block_invoke_2;
  v20[3] = &unk_1E6463898;
  id v21 = v14;
  id v22 = v16;
  id v23 = v8;
  id v17 = v8;
  id v18 = v16;
  id v19 = v14;
  [v19 setCompletionHandler:v20];
  [v19 start];
}

uint64_t __75__SYDocumentFetchRequest__fetchDocumentsWithReason_queryString_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

void __75__SYDocumentFetchRequest__fetchDocumentsWithReason_queryString_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [*(id *)(a1 + 40) count];
    int v7 = 134218242;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "Query finished with matches count: %ld, error: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)_buildResultWithMatches:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 138412546;
    long long v20 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v21 = 0;
        char v13 = objc_msgSend(a1, "_isSearchableItemValid:loggableErrorDescription:", v12, &v21, v20);
        id v14 = v21;
        if (v13)
        {
          id v15 = [a1 _itemIdFromSearchableItem:v12];
          id v16 = +[SYDocumentFetchRequest _contentURLForItem:v12];
          id v17 = [[SYDocumentFetchResult alloc] initWithDocumentId:v15 fileURL:v16];
          [v5 addObject:v17];
        }
        else
        {
          id v15 = os_log_create("com.apple.synapse", "DocumentWorkflows");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            uint64_t v27 = v12;
            __int16 v28 = 2112;
            id v29 = v14;
            _os_log_impl(&dword_1C2C5F000, v15, OS_LOG_TYPE_INFO, "Searchable item isn't valid: %@, error: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  id v18 = (void *)[v5 copy];
  return v18;
}

+ (BOOL)_isSearchableItemValid:(id)a3 loggableErrorDescription:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 attributeSet];
  long long v8 = [v7 bundleID];

  if (v8 && ![v8 isEqualToString:@"com.apple.mobilemail"])
  {
    uint64_t v10 = [a1 _itemIdFromSearchableItem:v6];
    uint64_t v11 = +[SYDocumentFetchRequest _contentURLForItem:v6];
    uint64_t v12 = v11;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    BOOL v9 = !v13;
    if (a4 && !v9)
    {
      id v14 = NSString;
      id v15 = [v11 path];
      *a4 = [v14 stringWithFormat:@"Skip invalid searchable with itemId: %@, contentURL: %@", v10, v15];
    }
  }
  else if (a4)
  {
    [NSString stringWithFormat:@"Skip searchable item with bundle id: %@", v8];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)_itemIdFromSearchableItem:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F237C0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithKeyName:@"SYDocumentRelatedUniqueIdentifierKey"];
  id v6 = [v4 attributeSet];

  uint64_t v7 = [v6 valueForCustomKey:v5];

  return v7;
}

+ (id)_contentURLForItem:(id)a3
{
  id v3 = [a3 attributeSet];
  id v4 = [v3 contentURL];

  return v4;
}

+ (void)_fetchDocumentsWithReason:(uint64_t)a1 queryString:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_DEBUG, "Query: %@", (uint8_t *)&v2, 0xCu);
}

@end