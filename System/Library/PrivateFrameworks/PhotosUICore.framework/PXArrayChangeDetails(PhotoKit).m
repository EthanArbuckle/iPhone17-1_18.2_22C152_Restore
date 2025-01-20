@interface PXArrayChangeDetails(PhotoKit)
+ (id)changeDetailsFromFetchResultChangeDetails:()PhotoKit originatingChange:;
+ (uint64_t)changeDetailsFromFetchResultChangeDetails:()PhotoKit;
@end

@implementation PXArrayChangeDetails(PhotoKit)

+ (id)changeDetailsFromFetchResultChangeDetails:()PhotoKit originatingChange:
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v17 = [a1 changeDetailsWithNoChanges];
LABEL_9:
    v18 = (void *)v17;
    goto LABEL_13;
  }
  if (([v6 hasIncrementalChanges] & 1) == 0)
  {
    uint64_t v17 = [a1 changeDetailsWithNoIncrementalChanges];
    goto LABEL_9;
  }
  v8 = [v6 changedIndexes];
  uint64_t v9 = [v8 count];

  v10 = 0;
  if (v7 && v9)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v12 = [v6 fetchResultAfterChanges];
    v13 = [v6 changedIndexes];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __94__PXArrayChangeDetails_PhotoKit__changeDetailsFromFetchResultChangeDetails_originatingChange___block_invoke;
    v29 = &unk_1E5DD3088;
    id v14 = v12;
    id v30 = v14;
    id v31 = v7;
    id v15 = v11;
    id v32 = v15;
    [v13 enumerateIndexesUsingBlock:&v26];

    if (objc_msgSend(v15, "count", v26, v27, v28, v29))
    {
      uint64_t v33 = *(void *)off_1E5DAAEF0;
      v16 = (void *)[v15 copy];
      v34[0] = v16;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    }
    else
    {
      v10 = 0;
    }
  }
  id v19 = objc_alloc((Class)a1);
  v20 = [v6 removedIndexes];
  v21 = [v6 insertedIndexes];
  v22 = [v6 movedIndexes];
  uint64_t v23 = [v6 movedFromIndexes];
  v24 = [v6 changedIndexes];
  v18 = (void *)[v19 initWithIncrementalChangeDetailsRemovedIndexes:v20 insertedIndexes:v21 movesToIndexes:v22 movesFromIndexes:v23 changedIndexes:v24 indexesWithChangesByProperty:v10];

LABEL_13:
  return v18;
}

+ (uint64_t)changeDetailsFromFetchResultChangeDetails:()PhotoKit
{
  return [a1 changeDetailsFromFetchResultChangeDetails:a3 originatingChange:0];
}

@end