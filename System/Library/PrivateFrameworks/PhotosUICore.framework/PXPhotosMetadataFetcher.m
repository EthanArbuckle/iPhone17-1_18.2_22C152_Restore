@interface PXPhotosMetadataFetcher
+ (id)sharedFetcherForPhotoLibrary:(id)a3;
- (BOOL)getAssetCounts:(id *)a3 guestAssetCounts:(id *)a4 forFetchResult:(id)a5 allowFetch:(BOOL)a6;
- (PHPhotoLibrary)photoLibrary;
- (PXPhotosMetadataFetcher)init;
- (PXPhotosMetadataFetcher)initWithPhotoLibrary:(id)a3;
- (id)_predicateForFact:(unint64_t)a3;
- (id)_queue_fetchResultForFact:(unint64_t)a3 allowFetch:(BOOL)a4;
- (id)_queue_oidsForFacts:(unint64_t)a3 allowFetch:(BOOL)a4;
- (void)photoLibraryWillChange:(id)a3;
@end

@implementation PXPhotosMetadataFetcher

+ (id)sharedFetcherForPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PXPhotosMetadataFetcher.m", 67, @"Invalid parameter not satisfying: %@", @"photoLibrary != nil" object file lineNumber description];
  }
  id v6 = a1;
  objc_sync_enter(v6);
  objc_getAssociatedObject(v5, &sharedFetcherForPhotoLibrary__sharedFetcherForPhotoLibraryKey);
  v7 = (PXPhotosMetadataFetcher *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = [[PXPhotosMetadataFetcher alloc] initWithPhotoLibrary:v5];
    objc_setAssociatedObject(v5, &sharedFetcherForPhotoLibrary__sharedFetcherForPhotoLibraryKey, v7, (void *)0x301);
  }
  objc_sync_exit(v6);

  return v7;
}

void __85__PXPhotosMetadataFetcher_getAssetCounts_guestAssetCounts_forFetchResult_allowFetch___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 1, *(unsigned __int8 *)(a1 + 80));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 2, *(unsigned __int8 *)(a1 + 80));
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 4, *(unsigned __int8 *)(a1 + 80));
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 5, *(unsigned __int8 *)(a1 + 80));
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "_queue_oidsForFacts:allowFetch:", 6, *(unsigned __int8 *)(a1 + 80));
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (id)_queue_oidsForFacts:(unint64_t)a3 allowFetch:(BOOL)a4
{
  queue_OIDsByDerivedFacts = self->_queue_OIDsByDerivedFacts;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v9 = [(NSMutableDictionary *)queue_OIDsByDerivedFacts objectForKeyedSubscript:v8];

  if (!v9)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 1;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v18 = (void (*)(void *))__58__PXPhotosMetadataFetcher__queue_oidsForFacts_allowFetch___block_invoke;
    v19 = &unk_1E5DB8DF0;
    v20 = self;
    BOOL v23 = a4;
    id v11 = v10;
    unint64_t v12 = 0;
    id v21 = v11;
    v22 = &v24;
    unsigned __int8 v28 = 0;
    do
    {
      if (((1 << v12) & a3) != 0)
      {
        v18(v17);
        int v13 = v28;
      }
      else
      {
        int v13 = 0;
      }
      if (v12 > 0x3E) {
        break;
      }
      ++v12;
    }
    while (!v13);
    if (*((unsigned char *)v25 + 24))
    {
      uint64_t v9 = PXSetsIntersection(v11);
      uint64_t v14 = self->_queue_OIDsByDerivedFacts;
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v14 setObject:v9 forKeyedSubscript:v15];
    }
    else
    {
      uint64_t v9 = 0;
    }

    _Block_object_dispose(&v24, 8);
  }
  return v9;
}

void __58__PXPhotosMetadataFetcher__queue_oidsForFacts_allowFetch___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_fetchResultForFact:allowFetch:", a2, *(unsigned __int8 *)(a1 + 56));
  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v8 = v5;
    v7 = [v5 fetchedObjectIDsSet];
    [v6 addObject:v7];

    uint64_t v5 = v8;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (id)_queue_fetchResultForFact:(unint64_t)a3 allowFetch:(BOOL)a4
{
  BOOL v4 = a4;
  queue_fetchResultByFetchedFact = self->_queue_fetchResultByFetchedFact;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v9 = [(NSMutableDictionary *)queue_fetchResultByFetchedFact objectForKeyedSubscript:v8];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    id v11 = [(PXPhotosMetadataFetcher *)self photoLibrary];
    unint64_t v12 = [v11 librarySpecificFetchOptions];

    [v12 setIsExclusivePredicate:1];
    int v13 = [(PXPhotosMetadataFetcher *)self _predicateForFact:a3];
    [v12 setInternalPredicate:v13];

    [v12 setInternalSortDescriptors:MEMORY[0x1E4F1CBF0]];
    uint64_t v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v12];
    uint64_t v14 = self->_queue_fetchResultByFetchedFact;
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v14 setObject:v9 forKeyedSubscript:v15];
  }
  return v9;
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (id)_predicateForFact:(unint64_t)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 4)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28BA0];
    BOOL v4 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
    v14[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F38EB8] filterPredicateForUnsavedSyndicationAssets];
    v14[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v7 = [v3 andPredicateWithSubpredicates:v6];
  }
  else
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d OR %K = %d", @"kind", 2, @"kind", 3);
    }
    else
    {
      if (a3 != 1)
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"PXPhotosMetadataFetcher.m" lineNumber:219 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kind", 1, v12, v13);
    v7 = };
  }
  return v7;
}

- (BOOL)getAssetCounts:(id *)a3 guestAssetCounts:(id *)a4 forFetchResult:(id)a5 allowFetch:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id object = a5;
  v55 = self;
  BOOL v10 = objc_opt_class();
  objc_sync_enter(v10);
  id v11 = objc_getAssociatedObject(object, &PXPhotosMetadataCountsCacheKey);
  objc_sync_exit(v10);

  if (v11)
  {
    [v11 assetCounts];
    unint64_t v12 = v88;
    uint64_t v57 = v90;
    uint64_t v58 = (uint64_t)v89;
    [v11 guestAssetCounts];
    unint64_t v13 = (unint64_t)v89;
    unint64_t v56 = v88;
    BOOL v14 = 1;
    unint64_t v15 = v90;
    goto LABEL_45;
  }
  unint64_t v17 = *(void *)off_1E5DAAEE0;
  unint64_t v16 = *((void *)off_1E5DAAEE0 + 1);
  unint64_t v18 = *((void *)off_1E5DAAEE0 + 2);
  if (v6)
  {
    unint64_t v56 = *(void *)off_1E5DAAEE0;
    uint64_t v57 = *((void *)off_1E5DAAEE0 + 2);
    uint64_t v58 = *((void *)off_1E5DAAEE0 + 1);
    uint64_t v53 = [object count];
    id v11 = [object fetchedObjectIDsSet];
    if (!v11)
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(object, "count"));
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v20 = object;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v94 objects:v103 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v95;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v95 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void **)(*((void *)&v94 + 1) + 8 * i);
            v25 = [v24 objectID];

            if (v25)
            {
              uint64_t v26 = [v24 objectID];
              [v19 addObject:v26];
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v94 objects:v103 count:16];
        }
        while (v21);
      }

      id v11 = (void *)[v19 copy];
    }
    unint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__93938;
    v92 = __Block_byref_object_dispose__93939;
    id v93 = 0;
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__93938;
    v86 = __Block_byref_object_dispose__93939;
    id v87 = 0;
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__93938;
    v80 = __Block_byref_object_dispose__93939;
    id v81 = 0;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__93938;
    v74 = __Block_byref_object_dispose__93939;
    id v75 = 0;
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__93938;
    v68 = __Block_byref_object_dispose__93939;
    id v69 = 0;
    queue = v55->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PXPhotosMetadataFetcher_getAssetCounts_guestAssetCounts_forFetchResult_allowFetch___block_invoke;
    block[3] = &unk_1E5DB8DC8;
    block[4] = v55;
    block[5] = &v88;
    BOOL v63 = v6;
    block[6] = &v82;
    block[7] = &v76;
    block[8] = &v70;
    block[9] = &v64;
    dispatch_sync(queue, block);
    unint64_t v28 = v89[5];
    if (v28 && v83[5] && v77[5] && v71[5] && v65[5])
    {
      v102[0] = v11;
      v102[1] = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
      v30 = PXSetsIntersection(v29);
      uint64_t v58 = [v30 count];

      uint64_t v31 = v83[5];
      v101[0] = v11;
      v101[1] = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
      v33 = PXSetsIntersection(v32);
      uint64_t v57 = [v33 count];

      unint64_t v12 = v53 - (v58 + v57);
      BOOL v35 = v57 == 0x7FFFFFFFFFFFFFFFLL || v58 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0x7FFFFFFFFFFFFFFFLL;
      if (v35 && v53 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v51 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v55, @"PXPhotosMetadataFetcher.m", 140, @"Total count doesn't match individual counts: %lu != %lu", v53, 0x7FFFFFFFFFFFFFFFLL);
      }
      uint64_t v36 = v77[5];
      v100[0] = v11;
      v100[1] = v36;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:2];
      v38 = PXSetsIntersection(v37);
      uint64_t v39 = [v38 count];

      uint64_t v40 = v71[5];
      v99[0] = v11;
      v99[1] = v40;
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:2];
      v42 = PXSetsIntersection(v41);
      unint64_t v13 = [v42 count];

      uint64_t v43 = v65[5];
      v98[0] = v11;
      v98[1] = v43;
      v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
      v45 = PXSetsIntersection(v44);
      unint64_t v15 = [v45 count];

      BOOL v46 = v15 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v56 = v39 - (v13 + v15);
      BOOL v47 = v46 || v39 - (v13 + v15) == 0x7FFFFFFFFFFFFFFFLL;
      if (v47 && v39 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v52 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v55, @"PXPhotosMetadataFetcher.m", 146, @"Guest total count doesn't match individual counts: %lu != %lu", v39, 0x7FFFFFFFFFFFFFFFLL);
      }
      v61[0] = v53 - (v58 + v57);
      v61[1] = v58;
      v61[2] = v57;
      v60[0] = v39 - (v13 + v15);
      v60[1] = v13;
      v60[2] = v15;
      v48 = [[PXPhotosMetadataCountsCache alloc] initWithAssetCounts:v61 guestAssetCounts:v60];
      v49 = objc_opt_class();
      objc_sync_enter(v49);
      objc_setAssociatedObject(object, &PXPhotosMetadataCountsCacheKey, v48, (void *)0x301);
      objc_sync_exit(v49);

      BOOL v14 = 1;
    }
    else
    {
      BOOL v14 = 0;
      unint64_t v15 = v57;
      unint64_t v13 = v58;
      unint64_t v12 = v56;
    }
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v76, 8);

    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(&v88, 8);

LABEL_45:
    unint64_t v18 = v57;
    unint64_t v16 = v58;
    unint64_t v17 = v56;
    if (!a3) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  BOOL v14 = 0;
  unint64_t v13 = *((void *)off_1E5DAAEE0 + 1);
  unint64_t v15 = *((void *)off_1E5DAAEE0 + 2);
  unint64_t v12 = *(void *)off_1E5DAAEE0;
  if (a3)
  {
LABEL_46:
    a3->var0 = v12;
    a3->var1 = v16;
    a3->var2 = v18;
  }
LABEL_47:
  if (a4)
  {
    a4->var0 = v17;
    a4->var1 = v13;
    a4->var2 = v15;
  }

  return v14;
}

- (PXPhotosMetadataFetcher)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosMetadataFetcher;
  uint64_t v5 = [(PXPhotosMetadataFetcher *)&v17 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_photoLibrary, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photos.metadata-fetcher-queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    BOOL v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queue_fetchResultByFetchedFact = v6->_queue_fetchResultByFetchedFact;
    v6->_queue_fetchResultByFetchedFact = v10;

    unint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queue_OIDsByDerivedFacts = v6->_queue_OIDsByDerivedFacts;
    v6->_queue_OIDsByDerivedFacts = v12;

    if (v4)
    {
      BOOL v14 = v6;
      unint64_t v15 = objc_msgSend(v4, "px_changeDistributor");
      [v15 registerInternalChangeObserver:v14];
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_queue_OIDsByDerivedFacts, 0);
  objc_storeStrong((id *)&self->_queue_fetchResultByFetchedFact, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)photoLibraryWillChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PXPhotosMetadataFetcher_photoLibraryWillChange___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __50__PXPhotosMetadataFetcher_photoLibraryWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PXPhotosMetadataFetcher_photoLibraryWillChange___block_invoke_2;
  v5[3] = &unk_1E5DB8E18;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __50__PXPhotosMetadataFetcher_photoLibraryWillChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) changeDetailsForFetchResult:a3];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 insertedIndexes];
    if (![v8 count])
    {
      uint64_t v9 = [v7 removedIndexes];
      if (![v9 count])
      {
        char v18 = [v7 hasIncrementalChanges];

        if (v18)
        {
LABEL_16:
          objc_super v17 = [v7 fetchResultAfterChanges];
          [*(id *)(*(void *)(a1 + 40) + 16) setObject:v17 forKeyedSubscript:v5];

          goto LABEL_17;
        }
LABEL_6:
        uint64_t v10 = [v5 unsignedIntegerValue];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v11 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "allKeys", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              unint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              if ((v10 & ~[v16 unsignedIntegerValue]) == 0) {
                [*(id *)(*(void *)(a1 + 40) + 24) setObject:0 forKeyedSubscript:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v13);
        }

        goto LABEL_16;
      }
    }
    goto LABEL_6;
  }
LABEL_17:
}

- (PXPhotosMetadataFetcher)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosMetadataFetcher.m", 92, @"%s is not available as initializer", "-[PXPhotosMetadataFetcher init]");

  abort();
}

@end