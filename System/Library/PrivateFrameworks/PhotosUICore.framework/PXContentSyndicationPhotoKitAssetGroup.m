@interface PXContentSyndicationPhotoKitAssetGroup
- (NSArray)originalAssets;
- (NSArray)syndicationIdentifiers;
- (NSArray)unsavedCMMSyndicatedAssets;
- (NSArray)unsavedSyndicatedAssets;
- (NSArray)userLibraryAssets;
- (PXContentSyndicationPhotoKitAssetGroup)initWithAssets:(id)a3;
@end

@implementation PXContentSyndicationPhotoKitAssetGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_unsavedCMMSyndicatedAssets, 0);
  objc_storeStrong((id *)&self->_unsavedSyndicatedAssets, 0);
  objc_storeStrong((id *)&self->_userLibraryAssets, 0);
  objc_storeStrong((id *)&self->_originalAssets, 0);
}

- (NSArray)syndicationIdentifiers
{
  return self->_syndicationIdentifiers;
}

- (NSArray)unsavedCMMSyndicatedAssets
{
  return self->_unsavedCMMSyndicatedAssets;
}

- (NSArray)unsavedSyndicatedAssets
{
  return self->_unsavedSyndicatedAssets;
}

- (NSArray)userLibraryAssets
{
  return self->_userLibraryAssets;
}

- (NSArray)originalAssets
{
  return self->_originalAssets;
}

- (PXContentSyndicationPhotoKitAssetGroup)initWithAssets:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v51.receiver = self;
    v51.super_class = (Class)PXContentSyndicationPhotoKitAssetGroup;
    v6 = [(PXContentSyndicationPhotoKitAssetGroup *)&v51 init];
    v7 = v6;
    if (v6)
    {
      v40 = v6;
      uint64_t v8 = [v5 count];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      v42 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      v46 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v41 = v5;
      id v11 = v5;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v48;
        uint64_t v43 = *(void *)v48;
        do
        {
          uint64_t v15 = 0;
          uint64_t v45 = v13;
          do
          {
            if (*(void *)v48 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
            [v9 addObject:v16];
            if (objc_msgSend(v16, "px_isSyndicatedAsset"))
            {
              [v16 fetchPropertySetsIfNeeded];
              v17 = [v16 curationProperties];
              v18 = [v17 syndicationIdentifier];

              if (!v18) {
                PXAssertGetLog();
              }
              [v46 addObject:v18];
              if (objc_msgSend(v16, "px_isUnsavedSyndicatedAsset"))
              {
                id v19 = v11;
                v20 = v9;
                v21 = v10;
                [v44 addObject:v16];
                v22 = (void *)MEMORY[0x1E4F38EB8];
                v52 = v18;
                v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
                v24 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
                v25 = [v24 librarySpecificFetchOptions];
                v26 = [v22 fetchAssetsWithSyndicationIdentifiers:v23 options:v25];

                v27 = [v26 firstObject];
                if ([v27 sourceType] == 8) {
                  [v42 addObject:v27];
                }

                v10 = v21;
                v9 = v20;
                id v11 = v19;
                uint64_t v14 = v43;
                uint64_t v13 = v45;
              }
            }
            else
            {
              [v10 addObject:v16];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v13);
      }

      uint64_t v28 = [v9 copy];
      v7 = v40;
      originalAssets = v40->_originalAssets;
      v40->_originalAssets = (NSArray *)v28;

      uint64_t v30 = [v10 copy];
      userLibraryAssets = v40->_userLibraryAssets;
      v40->_userLibraryAssets = (NSArray *)v30;

      uint64_t v32 = [v44 copy];
      unsavedSyndicatedAssets = v40->_unsavedSyndicatedAssets;
      v40->_unsavedSyndicatedAssets = (NSArray *)v32;

      uint64_t v34 = [v42 copy];
      unsavedCMMSyndicatedAssets = v40->_unsavedCMMSyndicatedAssets;
      v40->_unsavedCMMSyndicatedAssets = (NSArray *)v34;

      uint64_t v36 = [v46 copy];
      syndicationIdentifiers = v40->_syndicationIdentifiers;
      v40->_syndicationIdentifiers = (NSArray *)v36;

      v5 = v41;
    }
    self = v7;
    v38 = self;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

@end