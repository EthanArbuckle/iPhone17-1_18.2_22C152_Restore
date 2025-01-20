@interface NSOperationQueue(CloudKit)
- (BOOL)containsOperationToDeleteRecordID:()CloudKit;
- (BOOL)containsOperationToFetchRecordID:()CloudKit;
- (BOOL)containsOperationToSaveRecordID:()CloudKit;
- (id)existingOperationToDeleteRecordID:()CloudKit;
- (id)existingOperationToFetchRecordID:()CloudKit;
- (id)existingOperationToSaveRecordID:()CloudKit;
- (id)iterativelyCancelDependentOperations:()CloudKit;
@end

@implementation NSOperationQueue(CloudKit)

- (id)existingOperationToDeleteRecordID:()CloudKit
{
  id v4 = a3;
  v5 = [a1 operations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__NSOperationQueue_CloudKit__existingOperationToDeleteRecordID___block_invoke;
  v9[3] = &unk_2640CDF48;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "ic_objectPassingTest:", v9);

  return v7;
}

- (BOOL)containsOperationToDeleteRecordID:()CloudKit
{
  v1 = objc_msgSend(a1, "existingOperationToDeleteRecordID:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)existingOperationToFetchRecordID:()CloudKit
{
  id v4 = a3;
  v5 = [a1 operations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__NSOperationQueue_CloudKit__existingOperationToFetchRecordID___block_invoke;
  v9[3] = &unk_2640CDF48;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "ic_objectPassingTest:", v9);

  return v7;
}

- (BOOL)containsOperationToFetchRecordID:()CloudKit
{
  v1 = objc_msgSend(a1, "existingOperationToFetchRecordID:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)existingOperationToSaveRecordID:()CloudKit
{
  id v4 = a3;
  v5 = [a1 operations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__NSOperationQueue_CloudKit__existingOperationToSaveRecordID___block_invoke;
  v9[3] = &unk_2640CDF48;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "ic_objectPassingTest:", v9);

  return v7;
}

- (BOOL)containsOperationToSaveRecordID:()CloudKit
{
  v1 = objc_msgSend(a1, "existingOperationToSaveRecordID:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)iterativelyCancelDependentOperations:()CloudKit
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] arrayWithObject:v4];
  id v6 = [a1 operations];
  v7 = (void *)[v6 mutableCopy];

  v28 = [MEMORY[0x263EFF980] array];
  v29 = v5;
  uint64_t v8 = [v5 lastObject];
  if (v8)
  {
    v9 = (void *)v8;
    v26 = v7;
    while (1)
    {
      if (!objc_msgSend(v7, "count", v26)) {
        goto LABEL_23;
      }
      [v29 removeLastObject];
      uint64_t v27 = [v29 lastObject];

      id v10 = [MEMORY[0x263EFF980] array];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (!v12) {
        goto LABEL_22;
      }
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
          os_log_t v17 = [v16 dependencies];
          if (![v17 containsObject:v4]) {
            goto LABEL_15;
          }
          char v18 = [v16 isCancelled];

          if (v18) {
            goto LABEL_16;
          }
          int v19 = objc_msgSend(v16, "ic_resistsCancellation");
          os_log_t v17 = os_log_create("com.apple.notes", "Cloud");
          BOOL v20 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
          if (v19)
          {
            if (v20)
            {
              v21 = objc_msgSend(v16, "ic_loggingDescription");
              *(_DWORD *)buf = 138412290;
              v35 = v21;
              _os_log_impl(&dword_20C263000, v17, OS_LOG_TYPE_INFO, "Operation resisted cancellation: %@", buf, 0xCu);
            }
LABEL_15:

            goto LABEL_16;
          }
          if (v20)
          {
            v22 = objc_msgSend(v16, "ic_loggingDescription");
            *(_DWORD *)buf = 138412290;
            v35 = v22;
            _os_log_impl(&dword_20C263000, v17, OS_LOG_TYPE_INFO, "Canceling operation: %@", buf, 0xCu);
          }
          [v16 cancel];
          [v29 addObject:v16];
          [v10 addObject:v16];
          [v28 addObject:v16];
LABEL_16:
          ++v15;
        }
        while (v13 != v15);
        uint64_t v23 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
        uint64_t v13 = v23;
      }
      while (v23);
LABEL_22:

      [v11 removeObjectsInArray:v10];
      v7 = v26;
      v9 = (void *)v27;
      if (!v27)
      {
LABEL_23:

        break;
      }
    }
  }
  v24 = (void *)[v28 copy];

  return v24;
}

@end