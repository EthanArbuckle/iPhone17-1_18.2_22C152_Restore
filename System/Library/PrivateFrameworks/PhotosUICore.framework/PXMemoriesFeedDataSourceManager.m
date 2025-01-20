@interface PXMemoriesFeedDataSourceManager
- (BOOL)_isGeneratingAdditionalEntries;
- (PXMemoriesFeedDataSourceManager)initWithPhotoLibrary:(id)a3;
- (id)objectReferenceForMemory:(id)a3;
- (unint64_t)_indexOfEntry:(id)a3 inSortedEntries:(id)a4 options:(unint64_t)a5;
- (unint64_t)_indexOfEntryForMemory:(id)a3 inSortedEntries:(id)a4 options:(unint64_t)a5;
- (void)_generateAdditionalEntriesWithOldDataSource:(id)a3 startingIndex:(unint64_t)a4 sync:(BOOL)a5;
- (void)_handleFinishedGeneratingAdditionalEntriesWithNewDataSource:(id)a3 changeDetails:(id)a4 firstUngroupedMemoryIndex:(unint64_t)a5;
- (void)_setGeneratingAdditionalEntries:(BOOL)a3;
- (void)generateAdditionalEntriesIfPossible;
- (void)generateAdditionalEntriesWithOldDataSource:(id)a3 startingIndex:(unint64_t)a4 sync:(BOOL)a5;
- (void)handleChangedKeyAssetsForMemories:(id)a3;
- (void)handleIncrementalFetchResultChange:(id)a3 updatedFetchResultsForMemoriesWithChangedKeyAssets:(id)a4;
- (void)handleNonIncrementalFetchResultChange:(id)a3;
- (void)reloadMemories:(BOOL)a3;
- (void)startGeneratingMemories;
@end

@implementation PXMemoriesFeedDataSourceManager

- (void).cxx_destruct
{
}

- (void)_setGeneratingAdditionalEntries:(BOOL)a3
{
  self->__generatingAdditionalEntries = a3;
}

- (BOOL)_isGeneratingAdditionalEntries
{
  return self->__generatingAdditionalEntries;
}

- (id)objectReferenceForMemory:(id)a3
{
  id v4 = a3;
  v5 = [(PXSectionedDataSourceManager *)self dataSource];
  v6 = [v5 entries];
  unint64_t v7 = [(PXMemoriesFeedDataSourceManager *)self _indexOfEntryForMemory:v4 inSortedEntries:v6 options:256];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    unint64_t v9 = v7;
    v10 = [v6 objectAtIndex:v7];
    uint64_t v11 = [v10 indexOfMemory:v4];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      uint64_t v12 = v11;
      v14[0] = [v5 identifier];
      v14[1] = v9;
      v14[2] = v12;
      v14[3] = 0x7FFFFFFFFFFFFFFFLL;
      v8 = [v5 objectReferenceAtIndexPath:v14];
    }
  }
  return v8;
}

- (unint64_t)_indexOfEntry:(id)a3 inSortedEntries:(id)a4 options:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(v7, "count"), a5, &__block_literal_global_253);

  return v9;
}

uint64_t __73__PXMemoriesFeedDataSourceManager__indexOfEntry_inSortedEntries_options___block_invoke(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

- (unint64_t)_indexOfEntryForMemory:(id)a3 inSortedEntries:(id)a4 options:(unint64_t)a5
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v9 count];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__PXMemoriesFeedDataSourceManager__indexOfEntryForMemory_inSortedEntries_options___block_invoke_2;
  v14[3] = &unk_1E5DB3278;
  id v15 = &__block_literal_global_42314;
  SEL v16 = a2;
  void v14[4] = self;
  unint64_t v12 = objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, v11, a5, v14);

  return v12;
}

uint64_t __82__PXMemoriesFeedDataSourceManager__indexOfEntryForMemory_inSortedEntries_options___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v5 compare:v6];
LABEL_6:
      uint64_t v8 = v7;
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (*(uint64_t (**)(void))(a1[5] + 16))();
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a1[6] object:a1[4] file:@"PXMemoriesFeedDataSourceManager.m" lineNumber:527 description:@"Unexpected class for comparison"];

    abort();
  }
  uint64_t v8 = -(*(uint64_t (**)(void))(a1[5] + 16))();
LABEL_9:

  return v8;
}

uint64_t __82__PXMemoriesFeedDataSourceManager__indexOfEntryForMemory_inSortedEntries_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 creationDate];
  id v6 = [v4 startDate];
  if ([v5 isEqualToDate:v6])
  {

LABEL_4:
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  uint64_t v7 = [v4 endDate];
  char v8 = [v5 isEqualToDate:v7];

  if (v8) {
    goto LABEL_4;
  }
  uint64_t v11 = [v4 startDate];
  unint64_t v12 = [v5 earlierDate:v11];

  if (v12 == v5)
  {
    uint64_t v9 = 1;
  }
  else
  {
    v13 = [v4 endDate];
    v14 = [v5 laterDate:v13];

    if (v14 == v5) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = 0;
    }
  }
LABEL_5:

  return v9;
}

- (void)handleChangedKeyAssetsForMemories:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSectionedDataSourceManager *)self dataSource];
  v19 = [v5 entries];

  id v6 = (void *)[v19 mutableCopy];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__PXMemoriesFeedDataSourceManager_handleChangedKeyAssetsForMemories___block_invoke;
  v22[3] = &unk_1E5DB3230;
  v22[4] = self;
  id v23 = v6;
  id v24 = v7;
  id v8 = v7;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v22];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__PXMemoriesFeedDataSourceManager_handleChangedKeyAssetsForMemories___block_invoke_2;
  v20[3] = &unk_1E5DD3038;
  id v21 = v10;
  id v11 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v20];
  unint64_t v12 = [[PXMemoriesFeedDataSource alloc] initWithEntries:v9];
  id v13 = objc_alloc((Class)off_1E5DA8488);
  v14 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v15 = [v14 identifier];
  uint64_t v16 = [(PXMemoriesFeedDataSource *)v12 identifier];
  v17 = [off_1E5DA5568 changeDetailsWithNoChanges];
  v18 = (void *)[v13 initWithFromDataSourceIdentifier:v15 toDataSourceIdentifier:v16 sectionChanges:v17 itemChangeDetailsBySection:v11 subitemChangeDetailsByItemBySection:0];

  [(PXSectionedDataSourceManager *)self setDataSource:v12 changeDetails:v18];
}

void __69__PXMemoriesFeedDataSourceManager_handleChangedKeyAssetsForMemories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) _indexOfEntryForMemory:v20 inSortedEntries:*(void *)(a1 + 40) options:256];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v6];
    uint64_t v9 = [v8 indexOfMemory:v20];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = v9;
      id v11 = [v8 memories];
      unint64_t v12 = [v11 objectAtIndexedSubscript:v10];
      id v13 = [v12 memoryInfoWithUpdatedKeyAssetFetchResult:v5];

      v14 = [v8 entryByReplacingMemoryInfoAtIndex:v10 withMemoryInfo:v13];
      [*(id *)(a1 + 40) replaceObjectAtIndex:v7 withObject:v14];
      uint64_t v15 = *(void **)(a1 + 48);
      uint64_t v16 = [NSNumber numberWithInteger:v7];
      id v17 = [v15 objectForKeyedSubscript:v16];

      if (!v17)
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        v18 = *(void **)(a1 + 48);
        v19 = [NSNumber numberWithInteger:v7];
        [v18 setObject:v17 forKeyedSubscript:v19];
      }
      [v17 addIndex:v10];
    }
  }
}

void __69__PXMemoriesFeedDataSourceManager_handleChangedKeyAssetsForMemories___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (id)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v5];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (void)handleNonIncrementalFetchResultChange:(id)a3
{
  id v4 = [a3 fetchResultAfterChanges];
  id v5 = [(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult];

  if (v4 != v5)
  {
    id v6 = PLMemoriesGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "Handling non-incremental memories feed update", v8, 2u);
    }

    [(PXMemoriesFeedDataSourceManagerBase *)self setMemoriesFetchResult:v4];
    id v7 = +[PXSectionedDataSource emptyDataSource];
    [(PXMemoriesFeedDataSourceManager *)self generateAdditionalEntriesWithOldDataSource:v7 startingIndex:0 sync:0];
  }
}

- (void)handleIncrementalFetchResultChange:(id)a3 updatedFetchResultsForMemoriesWithChangedKeyAssets:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  privateWorkQueue = self->_privateWorkQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke;
  v12[3] = &unk_1E5DD1508;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(privateWorkQueue, v12);
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke(uint64_t a1)
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  uint64_t v151 = 0;
  v152 = &v151;
  uint64_t v153 = 0x3032000000;
  v154 = __Block_byref_object_copy__42337;
  v155 = __Block_byref_object_dispose__42338;
  id v156 = 0;
  v150[0] = 0;
  v150[1] = v150;
  v150[2] = 0x2020000000;
  v150[3] = 0;
  uint64_t v144 = 0;
  v145 = &v144;
  uint64_t v146 = 0x3032000000;
  v147 = __Block_byref_object_copy__42337;
  v148 = __Block_byref_object_dispose__42338;
  id v149 = 0;
  uint64_t v138 = 0;
  v139 = &v138;
  uint64_t v140 = 0x3032000000;
  v141 = __Block_byref_object_copy__42337;
  v142 = __Block_byref_object_dispose__42338;
  id v143 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_201;
  block[3] = &unk_1E5DB30D0;
  v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  v133 = &v151;
  id v3 = v2;
  uint64_t v75 = a1;
  uint64_t v137 = *(void *)(a1 + 56);
  id v132 = v3;
  v134 = v150;
  v135 = &v144;
  v136 = &v138;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  id v4 = PLMemoriesGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "Handling incremental update to memories feed data", buf, 2u);
  }

  *(void *)buf = 0;
  v128 = buf;
  uint64_t v129 = 0x2020000000;
  uint64_t v130 = 0;
  uint64_t v5 = [(id)v145[5] count];
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5) {
    uint64_t v6 = 0;
  }
  uint64_t v130 = v6;
  v71 = [(id)v152[5] removedObjects];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v9 = PLMemoriesGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v71 count];
    LODWORD(v161) = 134217984;
    *(void *)((char *)&v161 + 4) = v10;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Removing %lu memories from the feed.", (uint8_t *)&v161, 0xCu);
  }

  uint64_t v11 = [*(id *)(a1 + 32) firstUngroupedMemoryIndex];
  *(void *)&long long v161 = 0;
  *((void *)&v161 + 1) = &v161;
  uint64_t v162 = 0x2020000000;
  uint64_t v163 = 0;
  unint64_t v12 = [(id)v152[5] removedIndexes];
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_203;
  v117[3] = &unk_1E5DB30F8;
  uint64_t v13 = *(void *)(a1 + 32);
  v120 = &v161;
  v117[4] = v13;
  v121 = &v151;
  v122 = &v144;
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v125 = v11;
  uint64_t v126 = v14;
  id v15 = v7;
  id v118 = v15;
  v123 = &v138;
  v124 = buf;
  id v83 = v8;
  id v119 = v83;
  [v12 enumerateIndexesUsingBlock:v117];
  uint64_t v70 = v11;

  uint64_t v69 = *(void *)(*((void *)&v161 + 1) + 24);
  uint64_t v16 = [v15 allKeys];
  id v17 = [v16 sortedArrayUsingSelector:sel_compare_];

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  obuint64_t j = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v113 objects:v160 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v114;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v114 != v19) {
          objc_enumerationMutation(obj);
        }
        unint64_t v21 = [*(id *)(*((void *)&v113 + 1) + 8 * i) unsignedIntegerValue];
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_214;
        v112[3] = &__block_descriptor_40_e12_B24__0Q8_B16l;
        v112[4] = v21;
        v22 = [v83 indexesPassingTest:v112];
        unint64_t v23 = [v22 count];
        unint64_t v24 = v21 - v23;
        if (v21 >= v23)
        {
          v25 = [NSNumber numberWithUnsignedInteger:v21];
          v26 = [v15 objectForKeyedSubscript:v25];
          v27 = [NSNumber numberWithUnsignedInteger:v24];
          [v15 setObject:v26 forKeyedSubscript:v27];

          v28 = [NSNumber numberWithUnsignedInteger:v21];
          [v15 setObject:0 forKeyedSubscript:v28];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v113 objects:v160 count:16];
    }
    while (v18);
  }

  [(id)v139[5] removeObjectsAtIndexes:v83];
  v74 = [(id)v152[5] insertedObjects];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v30 = PLMemoriesGetLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = [v74 count];
    *(_DWORD *)v158 = 134217984;
    uint64_t v159 = v31;
    _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEFAULT, "Inserting %lu memories into the feed.", v158, 0xCu);
  }

  id v32 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_216;
  v105[3] = &unk_1E5DB3168;
  uint64_t v33 = *(void *)(v75 + 32);
  v109 = &v138;
  v105[4] = v33;
  id v72 = v32;
  id v106 = v72;
  id v34 = v29;
  uint64_t v111 = *(void *)(v75 + 56);
  id v73 = v34;
  id v107 = v34;
  v110 = buf;
  id v81 = v15;
  id v108 = v81;
  [v74 enumerateObjectsWithOptions:2 usingBlock:v105];
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_233;
  v101[3] = &unk_1E5DB3190;
  v101[4] = *(void *)(v75 + 32);
  uint64_t v36 = *(void *)(v75 + 56);
  v103 = &v138;
  uint64_t v104 = v36;
  id v80 = v35;
  id v102 = v80;
  [v73 enumerateKeysAndObjectsUsingBlock:v101];
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v39 = [(id)v152[5] changedIndexes];
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_3;
  v96[3] = &unk_1E5DB31B8;
  uint64_t v40 = *(void *)(v75 + 32);
  v99 = &v151;
  v96[4] = v40;
  v100 = &v138;
  id v79 = v37;
  id v97 = v79;
  id v76 = v38;
  id v98 = v76;
  [v39 enumerateIndexesUsingBlock:v96];

  v41 = *(void **)(v75 + 48);
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_4;
  v95[3] = &unk_1E5DB31E0;
  v95[4] = *(void *)(v75 + 32);
  v95[5] = &v138;
  [v41 enumerateKeysAndObjectsUsingBlock:v95];
  v82 = [MEMORY[0x1E4F1CA80] set];
  v42 = [v81 allKeys];
  [v82 addObjectsFromArray:v42];

  v43 = [v80 allKeys];
  [v82 addObjectsFromArray:v43];

  v44 = [MEMORY[0x1E4F1CA80] set];
  v45 = [v79 allKeys];
  [v44 addObjectsFromArray:v45];

  [v44 unionSet:v82];
  if (*((void *)v128 + 3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v46 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v44 addObject:v46];
  }
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v94 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v91 = 0u;
  id v77 = v44;
  uint64_t v48 = [v77 countByEnumeratingWithState:&v91 objects:v157 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v92;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v92 != v49) {
          objc_enumerationMutation(v77);
        }
        v51 = *(void **)(*((void *)&v91 + 1) + 8 * j);
        id v52 = objc_alloc((Class)off_1E5DA5568);
        v53 = [v81 objectForKeyedSubscript:v51];
        v54 = [v80 objectForKeyedSubscript:v51];
        v55 = [v79 objectForKeyedSubscript:v51];
        v56 = (void *)[v52 initWithIncrementalChangeDetailsRemovedIndexes:v53 insertedIndexes:v54 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v55];

        [v47 setObject:v56 forKeyedSubscript:v51];
        if ([v82 containsObject:v51]) {
          objc_msgSend(v76, "addIndex:", objc_msgSend(v51, "unsignedIntegerValue"));
        }
      }
      uint64_t v48 = [v77 countByEnumeratingWithState:&v91 objects:v157 count:16];
    }
    while (v48);
  }

  v57 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v83 insertedIndexes:v72 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v76];
  uint64_t v58 = [v74 count];
  v59 = [PXMemoriesFeedDataSource alloc];
  v60 = [(PXMemoriesFeedDataSource *)v59 initWithEntries:v139[5]];
  id v61 = objc_alloc((Class)off_1E5DA8488);
  v62 = [*(id *)(v75 + 32) dataSource];
  v63 = objc_msgSend(v61, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v62, "identifier"), -[PXMemoriesFeedDataSource identifier](v60, "identifier"), v57, v47, 0);

  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_5;
  v84[3] = &unk_1E5DB3208;
  uint64_t v64 = *(void *)(v75 + 32);
  uint64_t v65 = *(void *)(v75 + 56);
  v88 = &v151;
  uint64_t v89 = v65;
  uint64_t v90 = v70 - v69 + v58;
  v84[4] = v64;
  v85 = v60;
  id v86 = v63;
  v87 = v150;
  id v66 = v63;
  v67 = v60;
  v68 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v84);

  _Block_object_dispose(&v161, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v138, 8);
  _Block_object_dispose(&v144, 8);

  _Block_object_dispose(v150, 8);
  _Block_object_dispose(&v151, 8);
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_201(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) memoriesFetchResult];
  uint64_t v3 = [*(id *)(a1 + 40) changeDetailsForFetchResult:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v6) {
    PXAssertGetLog();
  }
  id v7 = [v6 fetchResultAfterChanges];

  if (!v7) {
    PXAssertGetLog();
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 168) + 1;
  *(void *)(v8 + 168) = v9;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
  uint64_t v10 = [*(id *)(a1 + 32) dataSource];
  uint64_t v11 = [v10 entries];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) mutableCopy];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_203(uint64_t a1, unint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 96) > a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) fetchResultBeforeChanges];
    uint64_t v5 = [v4 objectAtIndexedSubscript:a2];

    unint64_t v6 = [*(id *)(a1 + 32) _indexOfEntryForMemory:v5 inSortedEntries:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) options:256];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:*(void *)(a1 + 104) object:*(void *)(a1 + 32) file:@"PXMemoriesFeedDataSourceManager.m" lineNumber:207 description:@"Unable to find entry for removed memory"];
    }
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndex:v6];
    uint64_t v8 = [v7 indexOfMemory:v5];
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v6];
    id v11 = [v9 objectForKeyedSubscript:v10];

    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      uint64_t v12 = *(void **)(a1 + 40);
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:v6];
      [v12 setObject:v11 forKeyedSubscript:v13];
    }
    [v11 addIndex:v8];
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) objectAtIndex:v6];
    uint64_t v15 = PLMemoriesGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412802;
      unint64_t v27 = (unint64_t)v5;
      __int16 v28 = 2048;
      unint64_t v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = v8;
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEBUG, "Removing memory %@ from feed with memory index path [%lu, %lu]", (uint8_t *)&v26, 0x20u);
    }

    uint64_t v16 = [v14 memories];
    uint64_t v17 = [v16 count];

    if (v17 != 1)
    {
      uint64_t v24 = [v14 entryByRemovingMemory:v5];

      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) replaceObjectAtIndex:v6 withObject:v24];
      uint64_t v14 = (void *)v24;
      goto LABEL_18;
    }
    uint64_t v18 = PLMemoriesGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 134217984;
      unint64_t v27 = v6;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEBUG, "Only remaining memory removed from entry %lu. Removing entry.", (uint8_t *)&v26, 0xCu);
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8);
    unint64_t v20 = *(void *)(v19 + 24);
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6 != v20)
    {
      if (v20 == 0x7FFFFFFFFFFFFFFFLL || v6 >= v20) {
        goto LABEL_16;
      }
      uint64_t v21 = v20 - 1;
    }
    *(void *)(v19 + 24) = v21;
LABEL_16:
    [*(id *)(a1 + 48) addIndex:v6];
    v22 = *(void **)(a1 + 40);
    unint64_t v23 = [NSNumber numberWithUnsignedInteger:v6];
    [v22 setObject:0 forKeyedSubscript:v23];

LABEL_18:
  }
}

BOOL __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_214(uint64_t a1, unint64_t a2)
{
  return *(void *)(a1 + 32) > a2;
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_216(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 creationDate];
  uint64_t v5 = PLMemoriesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v3;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "Seeking destination feed entry for memory: %@", buf, 0xCu);
  }

  unint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_217;
  v45[3] = &unk_1E5DB3140;
  v45[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v46 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v45];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = +[PXMemoryInfo memoryInfoWithMemory:v3];
    uint64_t v10 = [PXMemoryEntryInfo alloc];
    v39 = (void *)v9;
    uint64_t v48 = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    uint64_t v12 = [(PXMemoryEntryInfo *)v10 initWithSortedMemories:v11];

    unint64_t v13 = [*(id *)(a1 + 32) _indexOfEntry:v12 inSortedEntries:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) options:1024];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 32) file:@"PXMemoriesFeedDataSourceManager.m" lineNumber:310 description:@"Unable to find insertion index for new entry"];
    }
    id v40 = v7;
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    unint64_t v15 = *(void *)(v14 + 24);
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v13 <= v15) {
        ++v15;
      }
      *(void *)(v14 + 24) = v15;
    }
    id v38 = (void *)v12;
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) insertObject:v12 atIndex:v13];
    [*(id *)(a1 + 40) shiftIndexesStartingAtIndex:v13 by:1];
    [*(id *)(a1 + 40) addIndex:v13];
    uint64_t v16 = [*(id *)(a1 + 56) allKeys];
    uint64_t v17 = [v16 sortedArrayUsingSelector:sel_compare_];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v37 = v17;
    uint64_t v18 = [v17 reverseObjectEnumerator];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v18);
          }
          unint64_t v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          unint64_t v24 = [v23 integerValue];
          if (v24 >= v13)
          {
            v25 = [NSNumber numberWithInteger:v24 + 1];
            int v26 = [*(id *)(a1 + 56) objectForKeyedSubscript:v25];

            if (v26)
            {
              __int16 v28 = [MEMORY[0x1E4F28B00] currentHandler];
              [v28 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"PXMemoriesFeedDataSourceManager.m", 325, @"Invalid parameter not satisfying: %@", @"removedMemoryIndexesBySection[adjustedSectionNumber] == nil" object file lineNumber description];
            }
            unint64_t v27 = [*(id *)(a1 + 56) objectForKeyedSubscript:v23];
            [*(id *)(a1 + 56) setObject:v27 forKeyedSubscript:v25];

            [*(id *)(a1 + 56) setObject:0 forKeyedSubscript:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v20);
    }

    id v7 = v40;
    __int16 v30 = v38;
    unint64_t v29 = v39;
    uint64_t v31 = v37;
  }
  else
  {
    uint64_t v32 = v8;
    unint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectAtIndexedSubscript:v8];
    __int16 v30 = [v29 entryByAddingMemory:v3];
    if (([*(id *)(a1 + 40) containsIndex:v32] & 1) == 0)
    {
      uint64_t v33 = [*(id *)(a1 + 48) objectForKeyedSubscript:v29];
      if (v33)
      {
        id v34 = v33;
        id v35 = [v33 setByAddingObject:v3];

        [*(id *)(a1 + 48) setObject:0 forKeyedSubscript:v29];
      }
      else
      {
        id v35 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
      }
      [*(id *)(a1 + 48) setObject:v35 forKeyedSubscript:v30];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) replaceObjectAtIndex:v32 withObject:v30];
    uint64_t v31 = PLMemoriesGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v3;
      __int16 v51 = 2048;
      uint64_t v52 = v32;
      _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_DEBUG, "Inserted memory %@ is grouped with entry %lu. Inserting there.", buf, 0x16u);
    }
  }
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_233(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) _indexOfEntry:v5 inSortedEntries:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) options:256];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXMemoriesFeedDataSourceManager.m" lineNumber:339 description:@"Unable to find inserted entry"];
  }
  uint64_t v8 = [v5 memories];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_2;
  v16[3] = &unk_1E5DB8F50;
  id v9 = v6;
  id v17 = v9;
  uint64_t v10 = [v8 indexesOfObjectsPassingTest:v16];

  uint64_t v11 = [v9 count];
  if (v11 != [v10 count])
  {
    unint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"PXMemoriesFeedDataSourceManager.m", 346, @"Count of inserted memories (%lu) doesn't match with count of inserted indexes (%lu)", objc_msgSend(v9, "count"), objc_msgSend(v10, "count"));
  }
  uint64_t v12 = *(void **)(a1 + 40);
  unint64_t v13 = [NSNumber numberWithUnsignedInteger:v7];
  [v12 setObject:v10 forKeyedSubscript:v13];
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fetchResultAfterChanges];
  id v17 = [v4 objectAtIndexedSubscript:a2];

  uint64_t v5 = [*(id *)(a1 + 32) _indexOfEntryForMemory:v17 inSortedEntries:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) options:256];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectAtIndex:v5];
    uint64_t v8 = [v7 indexOfMemory:v17];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      uint64_t v10 = +[PXMemoryInfo memoryInfoWithMemory:v17];
      uint64_t v11 = [v7 entryByReplacingMemoryInfoAtIndex:v9 withMemoryInfo:v10];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) replaceObjectAtIndex:v6 withObject:v11];
      uint64_t v12 = *(void **)(a1 + 40);
      unint64_t v13 = [NSNumber numberWithUnsignedInteger:v6];
      id v14 = [v12 objectForKeyedSubscript:v13];

      if (!v14)
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        unint64_t v15 = *(void **)(a1 + 40);
        uint64_t v16 = [NSNumber numberWithUnsignedInteger:v6];
        [v15 setObject:v14 forKeyedSubscript:v16];
      }
      [v14 addIndex:v9];
      [*(id *)(a1 + 48) addIndex:v6];
    }
  }
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v5 _indexOfEntryForMemory:v8 inSortedEntries:v6 options:256];
  id v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndex:v9];
  uint64_t v10 = [v15 indexOfMemory:v8];

  uint64_t v11 = [v15 memories];
  uint64_t v12 = [v11 objectAtIndexedSubscript:v10];
  unint64_t v13 = [v12 memoryInfoWithUpdatedKeyAssetFetchResult:v7];

  id v14 = [v15 entryByReplacingMemoryInfoAtIndex:v10 withMemoryInfo:v13];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) replaceObjectAtIndex:v9 withObject:v14];
}

void __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_5(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == *(void *)(*(void *)(a1 + 32) + 168))
  {
    v2 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) fetchResultAfterChanges];
    if (!v2) {
      PXAssertGetLog();
    }
    id v3 = (id)[v2 firstObject];
    [*(id *)(a1 + 32) setMemoriesFetchResult:v2];
    [*(id *)(a1 + 32) setFirstUngroupedMemoryIndex:*(void *)(a1 + 80)];
    [*(id *)(a1 + 32) setDataSource:*(void *)(a1 + 40) changeDetails:*(void *)(a1 + 48)];
  }
}

uint64_t __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 assetCollection];
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];

  return v4;
}

uint64_t __121__PXMemoriesFeedDataSourceManager_handleIncrementalFetchResultChange_updatedFetchResultsForMemoriesWithChangedKeyAssets___block_invoke_217(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v3 endDate];
  if ([v4 shouldGroupTogetherMemoriesWithCreationDate:v5 andCreationDate:v6])
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [v3 startDate];
    uint64_t v7 = [v8 shouldGroupTogetherMemoriesWithCreationDate:v9 andCreationDate:v10];
  }
  return v7;
}

- (void)_handleFinishedGeneratingAdditionalEntriesWithNewDataSource:(id)a3 changeDetails:(id)a4 firstUngroupedMemoryIndex:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [(PXMemoriesFeedDataSourceManagerBase *)self setFirstUngroupedMemoryIndex:a5];
  [(PXMemoriesFeedDataSourceManager *)self _setGeneratingAdditionalEntries:0];
  [(PXSectionedDataSourceManager *)self setDataSource:v9 changeDetails:v8];
}

- (void)_generateAdditionalEntriesWithOldDataSource:(id)a3 startingIndex:(unint64_t)a4 sync:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  id v9 = +[PXMemoriesFeedSettings sharedInstance];
  uint64_t v10 = [v9 groupsPerBatch];

  int v26 = [(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult];
  uint64_t v11 = [(id)objc_opt_class() generateEntriesFromMemories:v26 startingFromIndex:a4 maximumNumberOfEntries:v10 finalMemoryIndex:&v36];
  if (![v11 count])
  {
    v25 = (void *)a4;
    id v14 = (PXMemoriesFeedDataSource *)v8;
    unint64_t v23 = 0;
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__PXMemoriesFeedDataSourceManager__generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke_2;
    block[3] = &unk_1E5DC8380;
    objc_copyWeak(v30, &location);
    __int16 v28 = v14;
    id v29 = v23;
    v30[1] = v25;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
    goto LABEL_6;
  }
  v25 = (void *)(v36 + 1);
  uint64_t v12 = [v8 entries];
  unint64_t v13 = [v12 arrayByAddingObjectsFromArray:v11];
  id v14 = [[PXMemoriesFeedDataSource alloc] initWithEntries:v13];
  uint64_t v15 = [v12 count];
  uint64_t v16 = [v11 count];
  objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v15, v16);
  v17 = BOOL v24 = v5;
  uint64_t v18 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:v17 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __98__PXMemoriesFeedDataSourceManager__generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke;
  v32[3] = &unk_1E5DD2E68;
  id v33 = v12;
  id v34 = v13;
  id v35 = v19;
  id v20 = v19;
  id v21 = v13;
  id v22 = v12;
  [v11 enumerateObjectsUsingBlock:v32];
  unint64_t v23 = objc_msgSend(objc_alloc((Class)off_1E5DA8488), "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v8, "identifier"), -[PXMemoriesFeedDataSource identifier](v14, "identifier"), v18, v20, 0);

  if (!v24) {
    goto LABEL_5;
  }
LABEL_3:
  [(PXMemoriesFeedDataSourceManager *)self _handleFinishedGeneratingAdditionalEntriesWithNewDataSource:v14 changeDetails:v23 firstUngroupedMemoryIndex:v25];
LABEL_6:
}

void __98__PXMemoriesFeedDataSourceManager__generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) count] + a3;
  id v11 = [*(id *)(a1 + 40) objectAtIndex:v4];
  BOOL v5 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v6 = [v11 memories];
  uint64_t v7 = objc_msgSend(v5, "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "count"));

  id v8 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:v7 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
  id v9 = *(void **)(a1 + 48);
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v4];
  [v9 setObject:v8 forKeyedSubscript:v10];
}

void __98__PXMemoriesFeedDataSourceManager__generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleFinishedGeneratingAdditionalEntriesWithNewDataSource:*(void *)(a1 + 32) changeDetails:*(void *)(a1 + 40) firstUngroupedMemoryIndex:*(void *)(a1 + 56)];
}

- (void)reloadMemories:(BOOL)a3
{
  BOOL v3 = a3;
  [(PXMemoriesFeedDataSourceManager *)self startGeneratingMemories];
  id v5 = +[PXSectionedDataSource emptyDataSource];
  [(PXMemoriesFeedDataSourceManager *)self generateAdditionalEntriesWithOldDataSource:v5 startingIndex:0 sync:v3];
}

- (void)generateAdditionalEntriesIfPossible
{
  unint64_t v3 = [(PXMemoriesFeedDataSourceManagerBase *)self firstUngroupedMemoryIndex];
  id v6 = [(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult];
  unint64_t v4 = [v6 count];
  if (v4 && v3 < v4)
  {
    id v5 = [(PXSectionedDataSourceManager *)self dataSource];
    [(PXMemoriesFeedDataSourceManager *)self generateAdditionalEntriesWithOldDataSource:v5 startingIndex:v3 sync:0];
  }
}

- (void)generateAdditionalEntriesWithOldDataSource:(id)a3 startingIndex:(unint64_t)a4 sync:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([(PXMemoriesFeedDataSourceManager *)self _isGeneratingAdditionalEntries])
  {
    id v9 = PLMemoriesGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring update request while update is already in progress", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    [(PXMemoriesFeedDataSourceManager *)self _setGeneratingAdditionalEntries:1];
    if (v5)
    {
      [(PXMemoriesFeedDataSourceManager *)self _generateAdditionalEntriesWithOldDataSource:v8 startingIndex:a4 sync:1];
    }
    else
    {
      objc_initWeak(buf, self);
      privateWorkQueue = self->_privateWorkQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __97__PXMemoriesFeedDataSourceManager_generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke;
      block[3] = &unk_1E5DCCBD8;
      objc_copyWeak(v13, buf);
      id v12 = v8;
      v13[1] = (id)a4;
      dispatch_async(privateWorkQueue, block);

      objc_destroyWeak(v13);
      objc_destroyWeak(buf);
    }
  }
}

void __97__PXMemoriesFeedDataSourceManager_generateAdditionalEntriesWithOldDataSource_startingIndex_sync___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _generateAdditionalEntriesWithOldDataSource:*(void *)(a1 + 32) startingIndex:*(void *)(a1 + 48) sync:0];
}

- (void)startGeneratingMemories
{
  v6.receiver = self;
  v6.super_class = (Class)PXMemoriesFeedDataSourceManager;
  [(PXMemoriesFeedDataSourceManagerBase *)&v6 startGeneratingMemories];
  unint64_t v3 = [(PXSectionedDataSourceManager *)self dataSource];
  char v4 = [v3 containsAnyItems];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = [(PXSectionedDataSourceManager *)self dataSource];
    [(PXMemoriesFeedDataSourceManager *)self generateAdditionalEntriesWithOldDataSource:v5 startingIndex:0 sync:1];
  }
}

- (PXMemoriesFeedDataSourceManager)initWithPhotoLibrary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXMemoriesFeedDataSourceManager;
  unint64_t v3 = [(PXMemoriesFeedDataSourceManagerBase *)&v7 initWithPhotoLibrary:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.PXMemoriesFeedDataSourceManager", 0);
    privateWorkQueue = v3->_privateWorkQueue;
    v3->_privateWorkQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

@end