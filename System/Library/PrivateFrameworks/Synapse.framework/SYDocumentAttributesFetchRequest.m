@interface SYDocumentAttributesFetchRequest
+ (BOOL)_isValidSearchableItem:(id)a3 loggableErrorDescription:(id *)a4;
+ (id)_buildQueryStringWithIndexKeys:(id)a3;
+ (id)_buildResultWithMatches:(id)a3;
+ (void)fetchAttributesForDocumentsWithIndexKeys:(id)a3 completion:(id)a4;
@end

@implementation SYDocumentAttributesFetchRequest

+ (void)fetchAttributesForDocumentsWithIndexKeys:(id)a3 completion:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F1CAA0];
  id v8 = a3;
  v9 = (void *)[[v7 alloc] initWithArray:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F23830]);
  [v10 setFetchAttributes:&unk_1F1E26E10];
  [v10 setReason:@"Document Workflows: Get attachment info for document with index key"];
  v11 = [v9 array];
  v12 = [a1 _buildQueryStringWithIndexKeys:v11];

  v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[SYDocumentFetchRequest _fetchDocumentsWithReason:queryString:completion:]((uint64_t)v12, v13);
  }

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v12 context:v10];
  if (objc_opt_respondsToSelector()) {
    [v14 setPrivateQuery:1];
  }
  v29[0] = @"com.apple.mobilemail";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  [v14 setBundleIDs:v15];

  v16 = [MEMORY[0x1E4F1CA48] array];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__SYDocumentAttributesFetchRequest_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke;
  v27[3] = &unk_1E6463870;
  id v17 = v16;
  id v28 = v17;
  [v14 setFoundItemsHandler:v27];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __88__SYDocumentAttributesFetchRequest_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_2;
  v23 = &unk_1E6464938;
  id v25 = v6;
  id v26 = a1;
  id v24 = v17;
  id v18 = v6;
  id v19 = v17;
  [v14 setCompletionHandler:&v20];
  objc_msgSend(v14, "start", v20, v21, v22, v23);
}

uint64_t __88__SYDocumentAttributesFetchRequest_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

void __88__SYDocumentAttributesFetchRequest_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = 0;
  }
  else
  {
    v3 = [*(id *)(a1 + 48) _buildResultWithMatches:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_buildQueryStringWithIndexKeys:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] string];
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v3 objectAtIndex:v5];
      [v4 appendFormat:@"(kMDItemRelatedUniqueIdentifier == '%@')", v6];
      if (v5 < [v3 count] - 1) {
        [v4 appendFormat:@" || "];
      }

      ++v5;
    }
    while (v5 < [v3 count]);
  }
  v7 = NSString;
  id v8 = (void *)[v4 copy];
  v9 = [v7 stringWithFormat:@"(kMDItemIsTrashed != 1) && (%@)", v8];

  return v9;
}

+ (id)_buildResultWithMatches:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v54;
    uint64_t v44 = *(void *)v54;
    id v45 = a1;
    do
    {
      uint64_t v8 = 0;
      uint64_t v46 = v6;
      do
      {
        if (*(void *)v54 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v53 + 1) + 8 * v8);
        id v52 = 0;
        char v10 = [a1 _isValidSearchableItem:v9 loggableErrorDescription:&v52];
        id v11 = v52;
        v12 = v11;
        if (v10)
        {
          id v48 = v11;
          v13 = [v9 attributeSet];
          uint64_t v14 = [v13 bundleID];
          v15 = (void *)v14;
          if (v14) {
            v16 = (__CFString *)v14;
          }
          else {
            v16 = &stru_1F1E16740;
          }
          id v17 = v16;

          id v18 = [v9 attributeSet];
          uint64_t v19 = [v18 relatedUniqueIdentifier];
          uint64_t v20 = (void *)v19;
          if (v19) {
            uint64_t v21 = (__CFString *)v19;
          }
          else {
            uint64_t v21 = &stru_1F1E16740;
          }
          v22 = v21;

          v23 = [v9 attributeSet];
          v49 = [v23 contentURL];

          id v24 = [v9 attributeSet];
          id v25 = [v24 userSharedReceivedSender];
          uint64_t v26 = [v25 firstObject];
          v27 = (void *)v26;
          if (v26) {
            id v28 = (__CFString *)v26;
          }
          else {
            id v28 = &stru_1F1E16740;
          }
          v29 = v28;

          v30 = [v9 attributeSet];
          v31 = [v30 userSharedReceivedSenderHandle];
          uint64_t v32 = [v31 firstObject];
          v33 = (void *)v32;
          if (v32) {
            v34 = (__CFString *)v32;
          }
          else {
            v34 = &stru_1F1E16740;
          }
          v35 = v34;

          v36 = [v9 attributeSet];
          v37 = [v36 userSharedReceivedDate];
          v38 = [v37 firstObject];

          if (v38)
          {
            v39 = [[SYDocumentSender alloc] initWithName:v29 handle:v35];
            v40 = [[SYDocumentAttributes alloc] initWithSourceBundleIdentifier:v17 indexKey:v22 originalFileURL:v49 receivedDate:v38 sender:v39];
            [v43 addObject:v40];
          }
          else
          {
            v39 = (SYDocumentSender *)os_log_create("com.apple.synapse", "DocumentWorkflows");
            if (os_log_type_enabled(&v39->super, OS_LOG_TYPE_ERROR)) {
              +[SYDocumentAttributesFetchRequest _buildResultWithMatches:&v39->super];
            }
          }
          uint64_t v7 = v44;
          a1 = v45;
          v12 = v48;

          uint64_t v6 = v46;
        }
        else
        {
          id v17 = os_log_create("com.apple.synapse", "DocumentWorkflows");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v58 = v9;
            __int16 v59 = 2112;
            v60 = v12;
            _os_log_error_impl(&dword_1C2C5F000, v17, OS_LOG_TYPE_ERROR, "Searchable item isn't valid: %@, error: %@", buf, 0x16u);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v6);
  }

  v41 = (void *)[v43 copy];
  return v41;
}

+ (BOOL)_isValidSearchableItem:(id)a3 loggableErrorDescription:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 attributeSet];
  uint64_t v7 = [v6 contentURL];

  if (v7)
  {
    uint64_t v8 = [v5 attributeSet];
    v9 = [v8 contentTypeTree];

    if ([v9 count])
    {
      if (+[SYDocumentWorkflows isSupportedContentTypeTree:v9])
      {
        char v10 = [v5 attributeSet];
        id v11 = [v10 userSharedReceivedSender];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          v13 = [v5 attributeSet];
          uint64_t v14 = [v13 userSharedReceivedSenderHandle];
          uint64_t v15 = [v14 count];
          BOOL v16 = v15 != 0;

          if (!a4 || v15) {
            goto LABEL_19;
          }
          id v17 = @"Searchable item doesn't have sender handle info.";
          goto LABEL_15;
        }
        if (a4)
        {
          id v17 = @"Searchable item doesn't have sender info.";
          goto LABEL_15;
        }
LABEL_18:
        BOOL v16 = 0;
        goto LABEL_19;
      }
      if (!a4) {
        goto LABEL_18;
      }
      id v18 = @"Searchable item isn't a supported content type, found: %@";
    }
    else
    {
      if (!a4) {
        goto LABEL_18;
      }
      id v18 = @"Searchable item doesn't have a valid content type, found: %@";
    }
    objc_msgSend(NSString, "stringWithFormat:", v18, v9);
    id v17 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    BOOL v16 = 0;
    *a4 = v17;
LABEL_19:

    goto LABEL_20;
  }
  BOOL v16 = 0;
  if (a4) {
    *a4 = @"Searchable item doesn't have a file.";
  }
LABEL_20:

  return v16;
}

+ (void)_buildResultWithMatches:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Searchable item doesn't have a valid received date.", buf, 2u);
}

@end