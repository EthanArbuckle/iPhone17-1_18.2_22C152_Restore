@interface PGPotentialUpNextMemory
- (BOOL)isBlockedByUserFeedback;
- (NSString)keyAssetLocalIdentifier;
- (NSString)memoryLocalIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (PGPotentialUpNextMemory)initWithMemory:(id)a3 photoLibrary:(id)a4 userFeedbackCalculator:(id)a5;
- (PHAsset)keyAsset;
- (PHMemory)memory;
@end

@implementation PGPotentialUpNextMemory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (PHMemory)memory
{
  return self->_memory;
}

- (BOOL)isBlockedByUserFeedback
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(PGPotentialUpNextMemory *)self keyAsset];
  if (v3)
  {
    v4 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    [v4 setIncludedDetectionTypes:&unk_1F28D3E58];
    v5 = [MEMORY[0x1E4F391F0] fetchPersonsInAsset:v3 options:v4];
    if ([v5 count])
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "uuid", (void)v20);
            [v6 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v9);
      }

      userFeedbackCalculator = self->_userFeedbackCalculator;
      v14 = [v3 uuid];
      v15 = [(PHMemory *)self->_memory blockableFeatures];
      [(PHUserFeedbackCalculator *)userFeedbackCalculator scoreForKeyAssetUUID:v14 personsUUIDsInKeyAsset:v6 memoryFeatures:v15];
      double v17 = v16;

      int v18 = [MEMORY[0x1E4F39338] score:v17 meetsScoreThreshold:*MEMORY[0x1E4F39848]] ^ 1;
    }
    else
    {
      LOBYTE(v18) = 0;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (NSString)keyAssetLocalIdentifier
{
  v2 = [(PGPotentialUpNextMemory *)self keyAsset];
  v3 = [v2 localIdentifier];

  return (NSString *)v3;
}

- (PHAsset)keyAsset
{
  keyAsset = self->_keyAsset;
  if (!keyAsset)
  {
    if (self->_noKeyAsset)
    {
      keyAsset = 0;
    }
    else
    {
      v4 = (void *)MEMORY[0x1E4F38EB8];
      memory = self->_memory;
      v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      id v7 = [v4 fetchKeyCuratedAssetInAssetCollection:memory referenceAsset:0 options:v6];
      uint64_t v8 = [v7 firstObject];
      uint64_t v9 = self->_keyAsset;
      self->_keyAsset = v8;

      keyAsset = self->_keyAsset;
      if (!keyAsset) {
        self->_noKeyAsset = 1;
      }
    }
  }
  return keyAsset;
}

- (NSString)subtitle
{
  return (NSString *)[(PHMemory *)self->_memory subtitle];
}

- (NSString)title
{
  return (NSString *)[(PHMemory *)self->_memory title];
}

- (NSString)memoryLocalIdentifier
{
  return (NSString *)[(PHMemory *)self->_memory localIdentifier];
}

- (PGPotentialUpNextMemory)initWithMemory:(id)a3 photoLibrary:(id)a4 userFeedbackCalculator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPotentialUpNextMemory;
  v12 = [(PGPotentialUpNextMemory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_memory, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_userFeedbackCalculator, a5);
  }

  return v13;
}

@end