@interface PUPhotoSelectionEntry
- (BOOL)isIndexSelected:(unint64_t)a3;
- (NSArray)selectedAssets;
- (NSIndexSet)selectedIndexes;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)fetchResult;
- (PUPhotoSelectionEntry)initWithAssetCollection:(id)a3 fetchResult:(id)a4 uniqueSelectedAssets:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_ensureValidAssetIndexes;
- (void)deselectAssetsAtIndexes:(id)a3;
- (void)enumerateSelectedAssetsWithBlock:(id)a3;
- (void)handlePhotoLibraryChange:(id)a3;
- (void)invalidateAllAssetIndexes;
- (void)selectAssetsAtIndexes:(id)a3;
- (void)setSelectedAssetsSet:(id)a3;
@end

@implementation PUPhotoSelectionEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexes, 0);
  objc_storeStrong((id *)&self->_selectedAssets, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PUPhotoSelectionEntry allocWithZone:](PUPhotoSelectionEntry, "allocWithZone:") init];
  v5->_hasValidAssetIndexes = self->_hasValidAssetIndexes;
  objc_storeStrong((id *)&v5->_assetCollection, self->_assetCollection);
  uint64_t v6 = [(PHFetchResult *)self->_fetchResult copyWithZone:a3];
  fetchResult = v5->_fetchResult;
  v5->_fetchResult = (PHFetchResult *)v6;

  uint64_t v8 = [(NSMutableSet *)self->_selectedAssets copyWithZone:a3];
  selectedAssets = v5->_selectedAssets;
  v5->_selectedAssets = (NSMutableSet *)v8;

  uint64_t v10 = [(NSMutableIndexSet *)self->_selectedIndexes copyWithZone:a3];
  selectedIndexes = v5->_selectedIndexes;
  v5->_selectedIndexes = (NSMutableIndexSet *)v10;

  return v5;
}

- (void)setSelectedAssetsSet:(id)a3
{
  v4 = (NSMutableSet *)a3;
  selectedAssets = self->_selectedAssets;
  if (selectedAssets != v4)
  {
    v7 = v4;
    char v6 = [(NSMutableSet *)selectedAssets isEqualToSet:v4];
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      [(NSMutableSet *)self->_selectedAssets setSet:v7];
      [(PUPhotoSelectionEntry *)self invalidateAllAssetIndexes];
      v4 = v7;
    }
  }
}

- (void)handlePhotoLibraryChange:(id)a3
{
  id v4 = a3;
  v5 = [(PUPhotoSelectionEntry *)self fetchResult];
  id v14 = [v4 changeDetailsForFetchResult:v5];

  char v6 = v14;
  if (v14)
  {
    if (![v14 hasIncrementalChanges] || objc_msgSend(v14, "hasMoves")) {
      [(PUPhotoSelectionEntry *)self invalidateAllAssetIndexes];
    }
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = [v14 removedObjects];
    v9 = [v7 setWithArray:v8];

    if (self->_hasValidAssetIndexes)
    {
      uint64_t v10 = [v14 removedIndexes];
      if (v10) {
        [(NSMutableIndexSet *)self->_selectedIndexes pl_adjustIndexesForDeletions:v10];
      }
      v11 = [v14 insertedIndexes];
      if (v11) {
        [(NSMutableIndexSet *)self->_selectedIndexes pl_adjustIndexesForInsertions:v11];
      }
    }
    if ([v9 count]) {
      [(NSMutableSet *)self->_selectedAssets minusSet:v9];
    }
    v12 = [v14 fetchResultAfterChanges];
    fetchResult = self->_fetchResult;
    self->_fetchResult = v12;

    char v6 = v14;
  }
}

- (void)enumerateSelectedAssetsWithBlock:(id)a3
{
  id v4 = a3;
  [(PUPhotoSelectionEntry *)self _ensureValidAssetIndexes];
  v5 = [(PUPhotoSelectionEntry *)self selectedIndexes];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PUPhotoSelectionEntry_enumerateSelectedAssetsWithBlock___block_invoke;
  v7[3] = &unk_1E5F2A050;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  v9 = v10;
  [v5 enumerateIndexesUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

void __58__PUPhotoSelectionEntry_enumerateSelectedAssetsWithBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v6 = [*(id *)(a1 + 32) fetchResult];
  id v7 = [v6 objectAtIndex:a2];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
}

- (BOOL)isIndexSelected:(unint64_t)a3
{
  [(PUPhotoSelectionEntry *)self _ensureValidAssetIndexes];
  selectedIndexes = self->_selectedIndexes;
  return [(NSMutableIndexSet *)selectedIndexes containsIndex:a3];
}

- (void)deselectAssetsAtIndexes:(id)a3
{
  id v4 = a3;
  [(PUPhotoSelectionEntry *)self _ensureValidAssetIndexes];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(PHFetchResult *)self->_fetchResult objectsAtIndexes:v4];
  id v7 = [v5 setWithArray:v6];

  [(NSMutableSet *)self->_selectedAssets minusSet:v7];
  [(NSMutableIndexSet *)self->_selectedIndexes removeIndexes:v4];
}

- (void)selectAssetsAtIndexes:(id)a3
{
  id v4 = a3;
  [(PUPhotoSelectionEntry *)self _ensureValidAssetIndexes];
  id v5 = [(PHFetchResult *)self->_fetchResult objectsAtIndexes:v4];
  [(NSMutableSet *)self->_selectedAssets addObjectsFromArray:v5];
  [(NSMutableIndexSet *)self->_selectedIndexes addIndexes:v4];
}

- (NSArray)selectedAssets
{
  [(PUPhotoSelectionEntry *)self _ensureValidAssetIndexes];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  selectedIndexes = self->_selectedIndexes;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PUPhotoSelectionEntry_selectedAssets__block_invoke;
  v8[3] = &unk_1E5F2BCD0;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = self;
  [(NSMutableIndexSet *)selectedIndexes enumerateIndexesUsingBlock:v8];
  id v6 = (NSArray *)v5;

  return v6;
}

void __39__PUPhotoSelectionEntry_selectedAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 24) objectAtIndex:a2];
  [v2 addObject:v3];
}

- (NSIndexSet)selectedIndexes
{
  [(PUPhotoSelectionEntry *)self _ensureValidAssetIndexes];
  selectedIndexes = self->_selectedIndexes;
  return (NSIndexSet *)selectedIndexes;
}

- (void)invalidateAllAssetIndexes
{
  self->_hasValidAssetIndexes = 0;
  [(NSMutableIndexSet *)self->_selectedIndexes removeAllIndexes];
}

- (void)_ensureValidAssetIndexes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_hasValidAssetIndexes)
  {
    self->_hasValidAssetIndexes = 1;
    id v3 = (NSMutableIndexSet *)objc_opt_new();
    selectedIndexes = self->_selectedIndexes;
    self->_selectedIndexes = v3;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = self->_selectedAssets;
    uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          NSUInteger v10 = -[PHFetchResult indexOfObject:](self->_fetchResult, "indexOfObject:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [(NSMutableIndexSet *)self->_selectedIndexes addIndex:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (PUPhotoSelectionEntry)initWithAssetCollection:(id)a3 fetchResult:(id)a4 uniqueSelectedAssets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PUPhotoSelectionEntry;
  long long v12 = [(PUPhotoSelectionEntry *)&v19 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollection, a3);
    objc_storeStrong((id *)&v13->_fetchResult, a4);
    if (v11)
    {
      long long v14 = (NSMutableSet *)v11;
    }
    else
    {
      long long v14 = [MEMORY[0x1E4F1CA80] set];
    }
    selectedAssets = v13->_selectedAssets;
    v13->_selectedAssets = v14;

    uint64_t v16 = [MEMORY[0x1E4F28E60] indexSet];
    selectedIndexes = v13->_selectedIndexes;
    v13->_selectedIndexes = (NSMutableIndexSet *)v16;
  }
  return v13;
}

@end