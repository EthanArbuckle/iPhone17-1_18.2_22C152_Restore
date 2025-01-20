@interface SYLastModifiedDocumentFetchRequest
+ (id)_buildQueryStringWithDocumentRelatedUniqueIdentifier:(id)a3;
+ (id)_buildResultWithMatches:(id)a3;
+ (id)_createSearchQueryWithString:(id)a3;
+ (void)fetchLastModifiedDocument:(id)a3 completion:(id)a4;
@end

@implementation SYLastModifiedDocumentFetchRequest

+ (void)fetchLastModifiedDocument:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_INFO, "Fetching last modified document attributes for document with index key: %@", buf, 0xCu);
  }

  v9 = [a1 _buildQueryStringWithDocumentRelatedUniqueIdentifier:v6];
  v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[SYDocumentFetchRequest _fetchDocumentsWithReason:queryString:completion:]((uint64_t)v9, v10);
  }

  v11 = [a1 _createSearchQueryWithString:v9];
  v12 = [MEMORY[0x1E4F1CA48] array];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke;
  v27[3] = &unk_1E6463870;
  id v13 = v12;
  id v28 = v13;
  [v11 setFoundItemsHandler:v27];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke_2;
  v21 = &unk_1E64649D0;
  id v22 = v11;
  id v23 = v13;
  id v25 = v7;
  id v26 = a1;
  id v24 = v6;
  id v14 = v7;
  id v15 = v6;
  id v16 = v13;
  id v17 = v11;
  [v17 setCompletionHandler:&v18];
  objc_msgSend(v17, "start", v18, v19, v20, v21);
}

uint64_t __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

void __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [*(id *)(a1 + 40) count];
    uint64_t v7 = *(void *)(a1 + 48);
    int v11 = 134218498;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "Found %ld matching document(s) with index key: %@, error: %@", (uint8_t *)&v11, 0x20u);
  }

  v8 = [*(id *)(a1 + 64) _buildResultWithMatches:*(void *)(a1 + 40)];
  v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_16];
  v10 = [v9 lastObject];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 modifiedDate];
  uint64_t v6 = [v4 modifiedDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_createSearchQueryWithString:(id)a3
{
  v9[4] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F23830];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = @"SYDocumentRelatedUniqueIdentifierKey";
  v9[1] = @"kMDItemContentURL";
  v9[2] = @"kMDItemContentCreationDate";
  v9[3] = @"kMDItemContentModificationDate";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  [v5 setFetchAttributes:v6];

  [v5 setReason:@"Document Workflows: Get last modified document"];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v4 context:v5];

  return v7;
}

+ (id)_buildQueryStringWithDocumentRelatedUniqueIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"(kMDItemIsTrashed != 1) && (%@ == '%@')", @"SYDocumentRelatedUniqueIdentifierKey", a3];
}

+ (id)_buildResultWithMatches:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v29;
    *(void *)&long long v5 = 138478851;
    long long v25 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v10 = +[SYDocumentFetchRequest _contentURLForItem:](SYDocumentFetchRequest, "_contentURLForItem:", v9, v25);
        int v11 = [v9 attributeSet];
        uint64_t v12 = [v11 contentCreationDate];

        __int16 v13 = [v9 attributeSet];
        uint64_t v14 = [v13 contentModificationDate];

        id v15 = v10;
        if ([v15 isFileURL])
        {
          id v16 = [v15 pathExtension];
          int v17 = [v16 hasPrefix:@"sb-"];
        }
        else
        {
          int v17 = 0;
        }

        if (v15) {
          BOOL v18 = v14 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (v18)
        {
          int v19 = 0;
        }
        else if ([v12 compare:v14])
        {
          int v19 = v17 ^ 1;
        }
        else
        {
          int v19 = 0;
        }
        v20 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = [v15 path];
          *(_DWORD *)buf = v25;
          v33 = v21;
          __int16 v34 = 2113;
          v35 = v12;
          __int16 v36 = 2113;
          v37 = v14;
          __int16 v38 = 1024;
          int v39 = v17;
          __int16 v40 = 1024;
          int v41 = v19;
          _os_log_impl(&dword_1C2C5F000, v20, OS_LOG_TYPE_INFO, "Found searchable item with contentURL: %{private}@, creationDate: %{private}@, lastModifiedDate: %{private}@, isAutosaveFileURL: %{BOOL}d, isValid: %{BOOL}d", buf, 0x2Cu);
        }
        if (v19)
        {
          id v22 = [[SYLastModifiedDocumentAttributes alloc] initWithFileURL:v15 modifiedDate:v14];
          [v26 addObject:v22];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
    }
    while (v6);
  }

  id v23 = (void *)[v26 copy];

  return v23;
}

@end