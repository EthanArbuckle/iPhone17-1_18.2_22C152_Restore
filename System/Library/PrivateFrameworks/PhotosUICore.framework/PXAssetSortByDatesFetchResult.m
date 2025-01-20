@interface PXAssetSortByDatesFetchResult
- (NSDictionary)dateByIndex;
- (NSIndexSet)fetchedIndexes;
- (NSSortDescriptor)sortDescriptor;
- (PXAssetSortByDatesFetchResult)initWithSortDescriptor:(id)a3 fetchedIndexes:(id)a4 dateByIndex:(id)a5;
- (void)enumerateFetchedItemsUsingBlock:(id)a3;
@end

@implementation PXAssetSortByDatesFetchResult

- (PXAssetSortByDatesFetchResult)initWithSortDescriptor:(id)a3 fetchedIndexes:(id)a4 dateByIndex:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXAssetSortByDatesFetchResult;
  v12 = [(PXAssetSortByDatesFetchResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sortDescriptor, a3);
    objc_storeStrong((id *)&v13->_fetchedIndexes, a4);
    objc_storeStrong((id *)&v13->_dateByIndex, a5);
  }

  return v13;
}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (NSIndexSet)fetchedIndexes
{
  return self->_fetchedIndexes;
}

- (NSDictionary)dateByIndex
{
  return self->_dateByIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateByIndex, 0);
  objc_storeStrong((id *)&self->_fetchedIndexes, 0);
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
}

- (void)enumerateFetchedItemsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PXAssetSortByDatesFetchResult *)self dateByIndex];
  v6 = [(PXAssetSortByDatesFetchResult *)self fetchedIndexes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PXAssetSortByDatesFetchResult_enumerateFetchedItemsUsingBlock___block_invoke;
  v9[3] = &unk_1E5DD06A8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 enumerateIndexesUsingBlock:v9];
}

void __65__PXAssetSortByDatesFetchResult_enumerateFetchedItemsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = [v3 objectForKeyedSubscript:v4];

  v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v5 = v6;
  }
}

@end