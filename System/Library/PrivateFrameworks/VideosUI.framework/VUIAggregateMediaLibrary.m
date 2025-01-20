@interface VUIAggregateMediaLibrary
+ (id)keyPathsForValuesAffectingConnectionState;
- (BOOL)isInitialUpdateInProgress;
- (BOOL)isUpdating;
- (VUIAggregateMediaLibrary)initWithManager:(id)a3 deviceMediaLibrary:(id)a4 sidebandMediaLibrary:(id)a5;
- (VUIDeviceMediaLibrary)deviceMediaLibrary;
- (VUISidebandMediaLibrary)sidebandMediaLibrary;
- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (id)_imageLoadParamsForImageLoaderObject:(id)a3;
- (id)_imageLoaderIdentifier;
- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4;
- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3;
- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4;
- (id)title;
- (unint64_t)connectionState;
- (void)connectWithCompletionHandler:(id)a3 progressHandler:(id)a4;
- (void)dealloc;
- (void)updateFromCloudWithReason:(int64_t)a3;
- (void)updateProgressWithCompletionHandler:(id)a3;
@end

@implementation VUIAggregateMediaLibrary

- (VUIAggregateMediaLibrary)initWithManager:(id)a3 deviceMediaLibrary:(id)a4 sidebandMediaLibrary:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = objc_alloc_init(VUIAggregateLibraryIdentifier);
  v17.receiver = self;
  v17.super_class = (Class)VUIAggregateMediaLibrary;
  v13 = [(VUIMediaLibrary *)&v17 initWithIdentifier:v12 type:0 manager:v11];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_deviceMediaLibrary, a4);
    objc_storeStrong((id *)&v13->_sidebandMediaLibrary, a5);
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v13 selector:sel__deviceMediaLibraryContentsDidChange_ name:@"VUIMediaLibraryContentsDidChangeNotification" object:v9];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v13 selector:sel__sidebandMediaLibraryContentsDidChangeNotification_ name:@"VUIMediaLibraryContentsDidChangeNotification" object:v10];
  }
  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIAggregateMediaLibrary;
  [(VUIMediaLibraryImageLoader *)&v4 dealloc];
}

- (BOOL)isUpdating
{
  v3 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  if ([v3 isUpdating])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(VUIAggregateMediaLibrary *)self sidebandMediaLibrary];
    char v4 = [v5 isUpdating];
  }
  return v4;
}

- (BOOL)isInitialUpdateInProgress
{
  v3 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  if ([v3 isInitialUpdateInProgress])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(VUIAggregateMediaLibrary *)self sidebandMediaLibrary];
    char v4 = [v5 isInitialUpdateInProgress];
  }
  return v4;
}

- (void)updateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  [v5 updateProgressWithCompletionHandler:v4];
}

- (void)updateFromCloudWithReason:(int64_t)a3
{
  id v4 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  [v4 updateFromCloudWithReason:a3];
}

- (id)title
{
  v2 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  v3 = [v2 title];

  return v3;
}

- (unint64_t)connectionState
{
  v2 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  unint64_t v3 = [v2 connectionState];

  return v3;
}

- (void)connectWithCompletionHandler:(id)a3 progressHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  [v8 connectWithCompletionHandler:v7 progressHandler:v6];
}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  id v6 = [(VUIMediaLibrary *)self manager];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__36;
  v32[4] = __Block_byref_object_dispose__36;
  id v33 = 0;
  dispatch_group_enter(v5);
  id v8 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke;
  v28[3] = &unk_1E6DFD3D8;
  id v9 = v7;
  id v29 = v9;
  v31 = v32;
  id v10 = v5;
  v30 = v10;
  id v11 = [v8 enqueueMediaItemEntityTypesFetchWithCompletionHandler:v28];

  v12 = [(VUIAggregateMediaLibrary *)self sidebandMediaLibrary];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2;
  v24[3] = &unk_1E6DFD3D8;
  id v13 = v9;
  id v25 = v13;
  v27 = v32;
  v14 = v10;
  v26 = v14;
  id v15 = (id)[v12 enqueueMediaItemEntityTypesFetchWithCompletionHandler:v24];

  v16 = [v6 completionDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E6DFD400;
  id v21 = v13;
  id v22 = v4;
  v23 = v32;
  id v17 = v13;
  id v18 = v4;
  dispatch_group_notify(v14, v16, block);

  _Block_object_dispose(v32, 8);
  return v11;
}

void __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v15 = a1;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      int v5 = 0;
      uint64_t v6 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v9 = objc_msgSend(v8, "mediaItemEntityTypes", v15);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v18 != v12) {
                  objc_enumerationMutation(v9);
                }
                [v2 addObject:*(void *)(*((void *)&v17 + 1) + 8 * j)];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v11);
          }

          v5 |= [v8 areLocalMediaItemsAvailable];
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v4);
    }
    else
    {
      LOBYTE(v5) = 0;
    }

    v14 = objc_alloc_init(VUIMediaItemEntityTypesFetchResponse);
    [(VUIMediaItemEntityTypesFetchResponse *)v14 setMediaItemEntityTypes:v2];
    [(VUIMediaItemEntityTypesFetchResponse *)v14 setLocalMediaItemsAvailable:v5 & 1];
    (*(void (**)(void))(*(void *)(v15 + 40) + 16))();
  }
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_group_create();
  id v9 = [(VUIMediaLibrary *)self manager];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__36;
  v38[4] = __Block_byref_object_dispose__36;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__36;
  v36[4] = __Block_byref_object_dispose__36;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__36;
  v34[4] = __Block_byref_object_dispose__36;
  id v35 = 0;
  dispatch_group_enter(v8);
  uint64_t v10 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke;
  v30[3] = &unk_1E6DFD428;
  v32 = v38;
  id v33 = v34;
  uint64_t v11 = v8;
  v31 = v11;
  uint64_t v12 = [v10 enqueueFetchRequests:v6 completionHandler:v30];

  dispatch_group_enter(v11);
  id v13 = [(VUIAggregateMediaLibrary *)self sidebandMediaLibrary];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2;
  v26[3] = &unk_1E6DFD428;
  v28 = v36;
  id v29 = v34;
  v14 = v11;
  uint64_t v27 = v14;
  id v15 = (id)[v13 enqueueFetchRequests:v6 completionHandler:v26];

  v16 = [v9 completionDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3;
  block[3] = &unk_1E6DFD478;
  long long v23 = v36;
  long long v24 = v38;
  id v21 = v6;
  id v22 = v7;
  id v25 = v34;
  id v17 = v7;
  id v18 = v6;
  dispatch_group_notify(v14, v16, block);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
  return v12;
}

void __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_4;
  v6[3] = &unk_1E6DFD450;
  uint64_t v9 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  id v4 = v2;
  id v8 = v4;
  [v3 enumerateObjectsUsingBlock:v6];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v4, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
}

void __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id v37 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v37 mediaEntities];
  if ([v6 count]) {
    [v5 addObjectsFromArray:v6];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] > a3)
  {
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndex:a3];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 mediaEntities];
      if ([v9 count]) {
        [v5 addObjectsFromArray:v9];
      }
    }
  }
  if ([*(id *)(a1 + 32) count] > a3)
  {
    id v35 = v6;
    id v36 = v5;
    id v10 = v5;
    id v11 = [*(id *)(a1 + 32) objectAtIndex:a3];
    unint64_t v12 = [v11 range];
    uint64_t v14 = v13;
    id v15 = [v11 predicate];

    if (v15)
    {
      v16 = [v11 predicate];
      uint64_t v17 = [v10 filteredArrayUsingPredicate:v16];

      id v10 = (id)v17;
    }
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || !v14)
    {
      id v18 = v10;
    }
    else
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v12 < v12 + v14)
      {
        do
        {
          if (v12 >= [v10 count]) {
            break;
          }
          long long v19 = [v10 objectAtIndex:v12];
          [v18 addObject:v19];

          ++v12;
          --v14;
        }
        while (v14);
      }
    }
    id v20 = v18;
    id v21 = VUISidebandMediaItemKind();
    if ([v11 _isItemsFetch])
    {
      uint64_t v22 = VUISidebandMediaItemKind();
    }
    else if ([v11 _isShowsFetch])
    {
      uint64_t v22 = VUISidebandSeriesMediaCollectionKind();
    }
    else
    {
      if (![v11 _isSeasonsFetch]) {
        goto LABEL_26;
      }
      uint64_t v22 = VUISidebandSeasonMediaCollectionKind();
    }
    long long v23 = (void *)v22;

    id v21 = v23;
LABEL_26:
    uint64_t v24 = [v11 _manualSortDescriptorsWithMediaEntityKind:v21 propertiesRequiredForSort:0];
    id v25 = v20;
    if (v24)
    {
      id v25 = [v20 sortedArrayUsingDescriptors:v24];
    }
    v26 = [v11 _sortIndexPropertyKeyWithMediaEntityKind:v21];
    id v33 = (void *)v24;
    if (v26)
    {
      uint64_t v27 = +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:v25 sortIndexPropertyKey:v26];
    }
    else
    {
      uint64_t v27 = 0;
    }
    v34 = v20;
    v28 = [v11 groupingKeyPath];
    if (v28)
    {
      id v29 = [v11 groupingSortComparator];
      v30 = +[VUIMediaLibraryUtilities groupingForMediaEntities:v25 groupingKeyPath:v28 groupingSortComparator:v29 performDefaultSort:1 sortIndexPropertyKey:v26];

      if ([v11 _shouldGenerateGroupingSortIndexes])
      {
        v31 = +[VUIMediaLibraryUtilities sortIndexesForGrouping:v30];
LABEL_36:
        v32 = objc_alloc_init(VUIMediaEntityFetchResponse);
        [(VUIMediaEntityFetchResponse *)v32 setMediaEntities:v25];
        [(VUIMediaEntityFetchResponse *)v32 setSortIndexes:v27];
        [(VUIMediaEntityFetchResponse *)v32 setGrouping:v30];
        [(VUIMediaEntityFetchResponse *)v32 setGroupingSortIndexes:v31];
        [*(id *)(a1 + 40) addObject:v32];

        id v6 = v35;
        id v5 = v36;
        goto LABEL_37;
      }
    }
    else
    {
      v30 = 0;
    }
    v31 = 0;
    goto LABEL_36;
  }
LABEL_37:
}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [(VUIMediaLibrary *)self manager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__VUIAggregateMediaLibrary_saveMediaEntity_completionHandler___block_invoke;
    v9[3] = &unk_1E6DF3DD0;
    id v10 = v5;
    [v6 _enqueueCompletionQueueBlock:v9];
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:0];

  return v7;
}

uint64_t __62__VUIAggregateMediaLibrary_saveMediaEntity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_imageLoaderIdentifier
{
  id v2 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  uint64_t v3 = [v2 _imageLoaderIdentifier];

  return v3;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  id v6 = [v5 _imageLoadParamsForImageLoaderObject:v4];

  return v6;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = [(VUIAggregateMediaLibrary *)self deviceMediaLibrary];
  id v11 = objc_msgSend(v10, "_imageLoadOperationWithParams:scaleToSize:cropToFit:", v9, v5, width, height);

  return v11;
}

+ (id)keyPathsForValuesAffectingConnectionState
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"connectionState"];
}

- (VUIDeviceMediaLibrary)deviceMediaLibrary
{
  return self->_deviceMediaLibrary;
}

- (VUISidebandMediaLibrary)sidebandMediaLibrary
{
  return self->_sidebandMediaLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebandMediaLibrary, 0);
  objc_storeStrong((id *)&self->_deviceMediaLibrary, 0);
}

@end