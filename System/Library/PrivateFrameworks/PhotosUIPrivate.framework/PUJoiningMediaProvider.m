@interface PUJoiningMediaProvider
- (NSMapTable)_mediaProviderByClass;
- (NSMutableArray)_mediaProviderPredicateRecords;
- (PUJoiningMediaProvider)init;
- (id)_mediaProviderForAsset:(id)a3 requestType:(int64_t)a4;
- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int)a3;
- (void)registerMediaProvider:(id)a3 forAssetClass:(Class)a4;
- (void)registerMediaProvider:(id)a3 forAssetPassingTest:(id)a4;
@end

@implementation PUJoiningMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mediaProviderPredicateRecords, 0);
  objc_storeStrong((id *)&self->__mediaProviderByClass, 0);
}

- (NSMutableArray)_mediaProviderPredicateRecords
{
  return self->__mediaProviderPredicateRecords;
}

- (NSMapTable)_mediaProviderByClass
{
  return self->__mediaProviderByClass;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(PUJoiningMediaProvider *)self _mediaProviderByClass];
  v5 = [v4 objectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) cancelImageRequest:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(PUJoiningMediaProvider *)self _mediaProviderForAsset:v10 requestType:4];
  int v12 = [v11 requestAnimatedImageForAsset:v10 options:v9 resultHandler:v8];

  return v12;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [(PUJoiningMediaProvider *)self _mediaProviderForAsset:v15 requestType:3];
  LODWORD(a5) = objc_msgSend(v16, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  return a5;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(PUJoiningMediaProvider *)self _mediaProviderForAsset:v10 requestType:2];
  int v12 = [v11 requestPlayerItemForVideo:v10 options:v9 resultHandler:v8];

  return v12;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(PUJoiningMediaProvider *)self _mediaProviderForAsset:v10 requestType:1];
  int v12 = [v11 requestImageURLForAsset:v10 options:v9 resultHandler:v8];

  return v12;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(PUJoiningMediaProvider *)self _mediaProviderForAsset:v10 requestType:1];
  int v12 = [v11 requestImageDataForAsset:v10 options:v9 resultHandler:v8];

  return v12;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [(PUJoiningMediaProvider *)self _mediaProviderForAsset:v15 requestType:0];
  LODWORD(a5) = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  return a5;
}

- (id)_mediaProviderForAsset:(id)a3 requestType:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v7 = [(PUJoiningMediaProvider *)self _mediaProviderPredicateRecords];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
        id v13 = [v12 predicate];
        char v14 = ((uint64_t (**)(void, id, int64_t))v13)[2](v13, v6, a4);

        if (v14) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v15 = [v12 mediaProvider];

      if (v15) {
        goto LABEL_26;
      }
    }
    else
    {
LABEL_10:
    }
    v16 = [(PUJoiningMediaProvider *)self _mediaProviderByClass];
    id v15 = [v16 objectForKey:objc_opt_class()];

    if (!v15)
    {
      v17 = [(PUJoiningMediaProvider *)self _mediaProviderByClass];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v18 = objc_msgSend(v17, "keyEnumerator", 0);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            if ([(id)objc_opt_class() isSubclassOfClass:v23])
            {
              id v15 = [v17 objectForKey:v23];

              if (v15) {
                [v17 setObject:v15 forKey:objc_opt_class()];
              }
              goto LABEL_25;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      id v15 = 0;
LABEL_25:
    }
LABEL_26:
    v24 = [(PUMediaProvider *)self loadingStatusManager];

    if (v24)
    {
      v25 = [(PUMediaProvider *)self loadingStatusManager];
      [v15 setLoadingStatusManager:v25];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)registerMediaProvider:(id)a3 forAssetPassingTest:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (v14)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUJoiningMediaProvider.m", 40, @"Invalid parameter not satisfying: %@", @"mediaProvider != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PUJoiningMediaProvider.m", 41, @"Invalid parameter not satisfying: %@", @"predicate != nil" object file lineNumber description];

LABEL_3:
  uint64_t v8 = [[PUJoiningMediaProviderPredicateRecord alloc] initWithMediaProvider:v14 predicate:v7];
  if (!self->__mediaProviderPredicateRecords)
  {
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mediaProviderPredicateRecords = self->__mediaProviderPredicateRecords;
    self->__mediaProviderPredicateRecords = v9;
  }
  uint64_t v11 = [(PUJoiningMediaProvider *)self _mediaProviderPredicateRecords];
  [v11 addObject:v8];
}

- (void)registerMediaProvider:(id)a3 forAssetClass:(Class)a4
{
  id v10 = a3;
  if (v10)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUJoiningMediaProvider.m", 34, @"Invalid parameter not satisfying: %@", @"mediaProvider != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"PUJoiningMediaProvider.m", 35, @"Invalid parameter not satisfying: %@", @"assetClass != nil" object file lineNumber description];

LABEL_3:
  id v7 = [(PUJoiningMediaProvider *)self _mediaProviderByClass];
  [v7 setObject:v10 forKey:a4];
}

- (PUJoiningMediaProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUJoiningMediaProvider;
  v2 = [(PUJoiningMediaProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    mediaProviderByClass = v2->__mediaProviderByClass;
    v2->__mediaProviderByClass = (NSMapTable *)v3;

    mediaProviderPredicateRecords = v2->__mediaProviderPredicateRecords;
    v2->__mediaProviderPredicateRecords = 0;
  }
  return v2;
}

@end