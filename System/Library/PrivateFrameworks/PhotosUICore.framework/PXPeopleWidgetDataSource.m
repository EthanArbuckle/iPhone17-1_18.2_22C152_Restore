@interface PXPeopleWidgetDataSource
- (BOOL)containsSocialGroups;
- (BOOL)isForOneUp;
- (BOOL)prefetchingStarted;
- (PHPhotoLibrary)photoLibrary;
- (PXPeopleDetailsContext)context;
- (PXPeopleWidgetDataSource)initWithPhotoLibrary:(id)a3 name:(id)a4 objectsReloadBlock:(id)a5;
- (id)titleAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)imageCacheDidChanged:(id)a3;
- (void)loadMembersWithCompletionBlock:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
- (void)prefetchThumbnailsForTargetSize:(CGSize)a3 displayScale:(double)a4 maxFetchCount:(unint64_t)a5;
- (void)setContext:(id)a3;
- (void)setIsForOneUp:(BOOL)a3;
- (void)setPrefetchingStarted:(BOOL)a3;
- (void)startListeningForChanges;
- (void)stopListeningForChanges;
@end

@implementation PXPeopleWidgetDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
}

- (void)setPrefetchingStarted:(BOOL)a3
{
  self->_prefetchingStarted = a3;
}

- (BOOL)prefetchingStarted
{
  return self->_prefetchingStarted;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setIsForOneUp:(BOOL)a3
{
  self->_isForOneUp = a3;
}

- (BOOL)isForOneUp
{
  return self->_isForOneUp;
}

- (void)setContext:(id)a3
{
}

- (PXPeopleDetailsContext)context
{
  return self->_context;
}

- (BOOL)containsSocialGroups
{
  return self->_containsSocialGroups;
}

- (void)loadMembersWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PXPeopleDataSource *)self objects];
  v6 = [v5 fetchedObjects];

  if ([v6 count])
  {
    fetchQueue = self->_fetchQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_2;
    v10[3] = &unk_1E5DD0E78;
    v10[4] = self;
    id v11 = v6;
    id v12 = v4;
    dispatch_async(fetchQueue, v10);

    v8 = v11;
LABEL_5:

    goto LABEL_6;
  }
  if (v4)
  {
    v9 = [off_1E5DA8380 sharedScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke;
    v13[3] = &unk_1E5DD3128;
    id v14 = v4;
    [v9 dispatchInMainTransaction:v13];

    v8 = v14;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) isForOneUp];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    id v4 = [MEMORY[0x1E4F1CA80] setWithArray:v3];
  }
  else
  {
    v5 = +[PXPeopleWidgetUtilities verifiedPersonsFromMergeCandidatesForPersons:v3];
    id v4 = (void *)[v5 mutableCopy];
  }
  v6 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) localIdentifier];
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  v13 = [v7 allObjects];
  id v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_222_127298];
  v15 = (void *)[v14 mutableCopy];

  v16 = [*(id *)(a1 + 32) filterPredicate];
  if (v16) {
    [v15 filterUsingPredicate:v16];
  }
  v17 = *(void **)(a1 + 32);
  v18 = (void *)[v15 copy];
  [v17 setMembers:v18];

  v19 = [off_1E5DA8380 sharedScheduler];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_4;
  v20[3] = &unk_1E5DD3280;
  v20[4] = *(void *)(a1 + 32);
  id v21 = *(id *)(a1 + 48);
  [v19 dispatchInMainTransaction:v20];
}

void __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 peopleDataSourceMembersChanged:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
}

uint64_t __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 name];
  uint64_t v7 = [v6 length];

  uint64_t v8 = [v5 name];
  uint64_t v9 = [v8 length];

  if (v7 && !v9) {
    goto LABEL_6;
  }
  if (!v7 && v9)
  {
LABEL_8:
    uint64_t v12 = 1;
    goto LABEL_9;
  }
  unint64_t v10 = [v4 faceCount];
  unint64_t v11 = [v5 faceCount];
  if (v10 <= v11)
  {
    if (v10 >= v11)
    {
      id v14 = [v4 localIdentifier];
      v15 = [v5 localIdentifier];
      uint64_t v12 = [v14 compare:v15];

      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v12 = -1;
LABEL_9:

  return v12;
}

- (void)prefetchThumbnailsForTargetSize:(CGSize)a3 displayScale:(double)a4 maxFetchCount:(unint64_t)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (![(PXPeopleWidgetDataSource *)self prefetchingStarted])
  {
    [(PXPeopleWidgetDataSource *)self setPrefetchingStarted:1];
    fetchQueue = self->_fetchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PXPeopleWidgetDataSource_prefetchThumbnailsForTargetSize_displayScale_maxFetchCount___block_invoke;
    block[3] = &unk_1E5DD3630;
    block[4] = self;
    *(double *)&block[5] = a4;
    *(CGFloat *)&block[6] = width;
    *(CGFloat *)&block[7] = height;
    block[8] = a5;
    dispatch_async(fetchQueue, block);
  }
}

void __87__PXPeopleWidgetDataSource_prefetchThumbnailsForTargetSize_displayScale_maxFetchCount___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PXPeopleFaceCropManager sharedManager];
  double v3 = *(double *)(a1 + 40);
  if (v3 < 1.0)
  {
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    double v3 = v5;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [*(id *)(a1 + 32) members];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v14 = 0;
    uint64_t v9 = *(void *)v16;
LABEL_5:
    uint64_t v10 = 0;
    uint64_t v11 = v14 + 1;
    v14 += v8;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", *(void *)(*((void *)&v15 + 1) + 8 * v10), *(double *)(a1 + 48), *(double *)(a1 + 56), v3);
      [v2 requestFaceCropForOptions:v12 resultHandler:&__block_literal_global_127304];
      unint64_t v13 = *(void *)(a1 + 64);

      if (v11 + v10 >= v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (id)titleAtIndex:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v3 = [(PXPeopleDataSource *)self memberAtIndex:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 valueForKey:@"name"];
    double v5 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = objc_opt_class();
          if (v12 == objc_opt_class() || !objc_msgSend(v11, "length", (void)v20))
          {
            objc_msgSend(v5, "removeAllObjects", (void)v20);
            goto LABEL_17;
          }
          unint64_t v13 = [v11 componentsSeparatedByString:@" "];
          uint64_t v14 = [v13 firstObject];

          [v5 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    long long v18 = [v5 componentsJoinedByString:@", "];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v3 name];
      long long v16 = (void *)v15;
      long long v17 = &stru_1F00B0030;
      if (v15) {
        long long v17 = (__CFString *)v15;
      }
      long long v18 = v17;
    }
    else
    {
      long long v18 = 0;
    }
  }

  return v18;
}

- (void)imageCacheDidChanged:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey"];

  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXPeopleWidgetDataSource_imageCacheDidChanged___block_invoke;
  aBlock[3] = &unk_1E5DBCD10;
  id v7 = v6;
  id v20 = v7;
  long long v21 = &v22;
  uint64_t v8 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(PXPeopleDataSource *)self members];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v9);
      }
      v8[2](v8, *(void *)(*((void *)&v15 + 1) + 8 * v12));
      if (*((unsigned char *)v23 + 24)) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v26 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (*((unsigned char *)v23 + 24))
  {
    unint64_t v13 = [(PXPeopleDataSource *)self reloadBlock];
    uint64_t v14 = v13[2]();
    [(PXPeopleDataSource *)self setObjects:v14];

    [(PXPeopleWidgetDataSource *)self loadMembersWithCompletionBlock:0];
  }

  _Block_object_dispose(&v22, 8);
}

void __49__PXPeopleWidgetDataSource_imageCacheDidChanged___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = [a2 localIdentifier];
  LODWORD(v3) = [v3 containsObject:v4];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  id v7 = [(PXPeopleDataSource *)self objects];
  double v5 = objc_msgSend(v4, "changeDetailsForFetchResult:");

  if (v5)
  {
    id v6 = [v5 fetchResultAfterChanges];
    [(PXPeopleDataSource *)self setObjects:v6];
    [(PXPeopleWidgetDataSource *)self loadMembersWithCompletionBlock:0];
  }
}

- (void)stopListeningForChanges
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(PXPeopleWidgetDataSource *)self photoLibrary];
  [v4 unregisterChangeObserver:self];
}

- (void)startListeningForChanges
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = +[PXPeopleFaceCropManager sharedManager];
  [v3 addObserver:self selector:sel_imageCacheDidChanged_ name:@"PXPeopleFaceCropManagerDidInvalidateCacheNotification" object:v4];

  id v5 = [(PXPeopleWidgetDataSource *)self photoLibrary];
  [v5 registerChangeObserver:self];
}

- (void)dealloc
{
  [(PXPeopleWidgetDataSource *)self stopListeningForChanges];
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleWidgetDataSource;
  [(PXPeopleDataSource *)&v3 dealloc];
}

- (PXPeopleWidgetDataSource)initWithPhotoLibrary:(id)a3 name:(id)a4 objectsReloadBlock:(id)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXPeopleWidgetDataSource;
  uint64_t v10 = [(PXPeopleDataSource *)&v16 initWithName:a4 objectsReloadBlock:a5 asynchronousLoad:1 callbackDelegate:0];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibrary, a3);
    uint64_t v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photos.peopleWidgetFetchQueue", v12);
    fetchQueue = v11->_fetchQueue;
    v11->_fetchQueue = (OS_dispatch_queue *)v13;

    v11->_prefetchingStarted = 0;
  }

  return v11;
}

@end