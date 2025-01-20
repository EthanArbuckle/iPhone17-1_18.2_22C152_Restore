@interface PXStoryMiroMemoryConverter
- (BOOL)containsAnyData;
- (NSString)flexMusicID;
- (PHMemory)memory;
- (PXDisplayAsset)keyAsset;
- (PXDisplayAssetFetchResult)curatedAssets;
- (PXStoryMiroMemoryConverter)init;
- (PXStoryMiroMemoryConverter)initWithMemory:(id)a3 keyAsset:(id)a4;
- (id)_fetchMiroCuratedAssetsInMemory:(id)a3;
- (id)createNewRecipeFromMiroMetadataWithError:(id *)a3;
- (id)description;
- (void)_loadSavedMetadataForMemory:(id)a3;
@end

@implementation PXStoryMiroMemoryConverter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_flexMusicID, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (NSString)flexMusicID
{
  return self->_flexMusicID;
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  return self->_curatedAssets;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (id)_fetchMiroCuratedAssetsInMemory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F38EB8] fetchMovieCuratedAssetsInMemory:v3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v3, "movieStateDataForAsset:", v11, (void)v15);
        if (v12)
        {
          v13 = +[PXStoryMiroAssetInfo infoWithData:v12];
          if ([v13 isUsed]) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_loadSavedMetadataForMemory:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXStoryMiroMemoryConverter *)self _fetchMiroCuratedAssetsInMemory:v4];
  if ([v5 count]) {
    PXDisplayAssetFetchResultFromArray();
  }
}

- (id)description
{
  v2 = NSString;
  id v3 = [(PXStoryMiroMemoryConverter *)self curatedAssets];
  id v4 = objc_msgSend(v2, "stringWithFormat:", @"< assets:%lu >", objc_msgSend(v3, "count"));

  return v4;
}

- (id)createNewRecipeFromMiroMetadataWithError:(id *)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (![(PXStoryMiroMemoryConverter *)self containsAnyData])
  {
    id v8 = 0;
    long long v18 = 0;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v5 = [MEMORY[0x1E4F8CDD0] createRecipe];
  uint64_t v6 = (void *)[v5 mutableCopyWithZone:0];

  uint64_t v7 = [(PXStoryMiroMemoryConverter *)self curatedAssets];
  id v26 = 0;
  +[PFStoryRecipe_PXStoryExtension addPHAssets:v7 toRecipe:v6 withCategory:3 error:&v26];
  id v8 = v26;

  long long v9 = *MEMORY[0x1E4F8D280];
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 16);
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 48);
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 32);
  long long v24 = v10;
  uint64_t v25 = *(void *)(MEMORY[0x1E4F8D280] + 64);
  long long v21 = v9;
  uint64_t v20 = 2;
  [v6 setOverallDurationInfo:&v20];
  uint64_t v11 = [(PXStoryMiroMemoryConverter *)self flexMusicID];

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E4F8CDD8];
    uint64_t v13 = *MEMORY[0x1E4F8D2A0];
    v14 = [(PXStoryMiroMemoryConverter *)self flexMusicID];
    long long v15 = [v12 createAssetWithCategory:2 subcategory:0 catalog:v13 songID:v14 title:0 subtitle:0 colorGradeCategory:0];

    [v6 addAsset:v15];
    uint64_t v27 = v13;
    long long v16 = [v15 identifier];
    v28[0] = v16;
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    [v6 setSeedSongIdentifiersByCatalog:v17];
  }
  long long v18 = (void *)[v6 copyWithZone:0];

  if (a3) {
LABEL_7:
  }
    *a3 = v8;
LABEL_8:

  return v18;
}

- (BOOL)containsAnyData
{
  v2 = [(PXStoryMiroMemoryConverter *)self curatedAssets];
  BOOL v3 = [v2 count] > 0;

  return v3;
}

- (PXStoryMiroMemoryConverter)initWithMemory:(id)a3 keyAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryMiroMemoryConverter;
  long long v9 = [(PXStoryMiroMemoryConverter *)&v12 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    objc_storeStrong((id *)&v10->_keyAsset, a4);
    [(PXStoryMiroMemoryConverter *)v10 _loadSavedMetadataForMemory:v7];
  }

  return v10;
}

- (PXStoryMiroMemoryConverter)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMiroMemoryConverter.m", 22, @"%s is not available as initializer", "-[PXStoryMiroMemoryConverter init]");

  abort();
}

@end