@interface NSOperationQueue
@end

@implementation NSOperationQueue

uint64_t __64__NSOperationQueue_CloudKit__existingOperationToDeleteRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 recordIDsToDelete];
    uint64_t v5 = [v4 containsObject:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __63__NSOperationQueue_CloudKit__existingOperationToFetchRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 recordIDs];
    uint64_t v5 = [v4 containsObject:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __62__NSOperationQueue_CloudKit__existingOperationToSaveRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 recordsToSave];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__NSOperationQueue_CloudKit__existingOperationToSaveRecordID___block_invoke_2;
    v7[3] = &unk_2640CE208;
    id v8 = *(id *)(a1 + 32);
    uint64_t v5 = objc_msgSend(v4, "ic_containsObjectPassingTest:", v7);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __62__NSOperationQueue_CloudKit__existingOperationToSaveRecordID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

@end