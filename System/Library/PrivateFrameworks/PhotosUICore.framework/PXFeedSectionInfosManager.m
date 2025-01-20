@interface PXFeedSectionInfosManager
+ (NSDate)mostRecentCreationDate;
- (BOOL)_shouldPerformFullReloadForFeedEntriesChangeNotifications:(id)a3 commentsChangeNotifications:(id)a4;
- (BOOL)hasEnoughCloudFeedAssetEntriesToDisplay;
- (BOOL)reconfigureToIncludeCloudFeedEntry:(id)a3;
- (NSDate)earliestDate;
- (PXFeedSectionInfosManager)initWithPhotoLibrary:(id)a3 configurationBlock:(id)a4;
- (PXFeedSectionInfosManager)initWithPhotoLibraryForTesting:(id)a3 filter:(int64_t)a4;
- (PXFeedSectionInfosManagerDelegate)delegate;
- (id)_sectionInfoSortingComparator;
- (id)indexesOfInvitationsReceivedSectionInfos;
- (id)indexesOfUnloadedSectionInfosAtIndexes:(id)a3;
- (id)sectionInfoAtIndex:(int64_t)a3;
- (id)sectionInfoWithIdentifier:(id)a3;
- (id)sectionInfosAtIndexes:(id)a3;
- (int64_t)entryFilter;
- (int64_t)indexOfSectionInfo:(id)a3;
- (int64_t)indexOfSectionInfoForCloudFeedEntry:(id)a3;
- (int64_t)numberOfInvitationsReceived;
- (int64_t)numberOfSectionInfos;
- (unint64_t)fetchLimit;
- (void)_didFinishPostingNotifications:(id)a3;
- (void)_getEarliestDate:(id *)a3 mostRecentEntries:(id *)a4 forBatchWithLatestDate:(id)a5;
- (void)_rebuildSectionInfos;
- (void)_updateSectionInfosForFeedEntriesChangeNotifications:(id)a3 commentsChangeNotifications:(id)a4 assetsChangeNotifications:(id)a5;
- (void)assetsDidChange:(id)a3;
- (void)cloudCommentsDidChange:(id)a3;
- (void)cloudFeedEntriesDidChange:(id)a3;
- (void)dealloc;
- (void)loadSectionInfosAtIndexes:(id)a3;
- (void)reconfigure:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEarliestDate:(id)a3;
- (void)setEntryFilter:(int64_t)a3;
- (void)setFetchLimit:(unint64_t)a3;
- (void)shouldReload:(id)a3;
@end

@implementation PXFeedSectionInfosManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_earliestDate, 0);
  objc_storeStrong((id *)&self->_pendingAssetsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingCommentsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingFeedEntriesChangeNotifications, 0);
  objc_storeStrong((id *)&self->_sectionInfosByCloudFeedEntry, 0);
  objc_storeStrong((id *)&self->_sectionInfos, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXFeedSectionInfosManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFeedSectionInfosManagerDelegate *)WeakRetained;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setEarliestDate:(id)a3
{
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (void)setEntryFilter:(int64_t)a3
{
  self->_entryFilter = a3;
}

- (int64_t)entryFilter
{
  return self->_entryFilter;
}

- (PXFeedSectionInfosManager)initWithPhotoLibraryForTesting:(id)a3 filter:(int64_t)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PXFeedSectionInfosManager;
  v8 = [(PXFeedSectionInfosManager *)&v25 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a3);
    v9->_entryFilter = a4;
    v10 = [(PXFeedTestSectionInfo *)[PXFeedTestInvitationSectionInfo alloc] initWithPhotoLibrary:v9->_photoLibrary];
    v11 = [(PXFeedTestSectionInfo *)[PXFeedTestInvitationSectionInfo alloc] initWithPhotoLibrary:v9->_photoLibrary];
    v12 = [(PXFeedTestSectionInfo *)[PXFeedTestCommentsSectionInfo alloc] initWithPhotoLibrary:v9->_photoLibrary];
    v13 = [(PXFeedTestSectionInfo *)[PXFeedTestCommentsSectionInfo alloc] initWithPhotoLibrary:v9->_photoLibrary];
    v14 = [[PXFeedTestAssetsSectionInfo alloc] initWithPhotoLibrary:v9->_photoLibrary];
    v15 = [[PXFeedTestAssetsSectionInfo alloc] initWithPhotoLibrary:v9->_photoLibrary];
    v16 = v15;
    switch(v9->_entryFilter)
    {
      case 0:
      case 2:
      case 5:
      case 6:
        v17 = (void *)MEMORY[0x1E4F1CA48];
        v26[0] = v13;
        v26[1] = v15;
        v26[2] = v12;
        v26[3] = v14;
        v26[4] = v11;
        v26[5] = v10;
        v18 = (void *)MEMORY[0x1E4F1C978];
        v19 = v26;
        uint64_t v20 = 6;
        goto LABEL_9;
      case 1:
        v17 = (void *)MEMORY[0x1E4F1CA48];
        v29[0] = v11;
        v29[1] = v10;
        v18 = (void *)MEMORY[0x1E4F1C978];
        v19 = v29;
        goto LABEL_8;
      case 3:
        v17 = (void *)MEMORY[0x1E4F1CA48];
        v28[0] = v15;
        v28[1] = v14;
        v28[2] = v11;
        v28[3] = v10;
        v18 = (void *)MEMORY[0x1E4F1C978];
        v19 = v28;
        uint64_t v20 = 4;
        goto LABEL_9;
      case 4:
        v17 = (void *)MEMORY[0x1E4F1CA48];
        v27[0] = v12;
        v27[1] = v13;
        v18 = (void *)MEMORY[0x1E4F1C978];
        v19 = v27;
LABEL_8:
        uint64_t v20 = 2;
LABEL_9:
        v22 = [v18 arrayWithObjects:v19 count:v20];
        uint64_t v21 = [v17 arrayWithArray:v22];

        break;
      default:
        uint64_t v21 = 0;
        break;
    }
    sectionInfos = v9->_sectionInfos;
    v9->_sectionInfos = (NSMutableArray *)v21;
  }
  return v9;
}

- (id)_sectionInfoSortingComparator
{
  v2 = (void *)[&__block_literal_global_88446 copy];
  return v2;
}

uint64_t __58__PXFeedSectionInfosManager__sectionInfoSortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 cloudFeedEntry];
  v6 = [v4 cloudFeedEntry];

  uint64_t v7 = [v5 entryPriority];
  uint64_t v8 = [v6 entryPriority];
  if (v7 >= v8)
  {
    if (v7 <= v8)
    {
      v10 = [v5 entryDate];
      v11 = [v6 entryDate];
      uint64_t v9 = [v10 compare:v11];
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)_updateSectionInfosForFeedEntriesChangeNotifications:(id)a3 commentsChangeNotifications:(id)a4 assetsChangeNotifications:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = NSStringFromSelector(a2);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "will %@", (uint8_t *)&buf, 0xCu);
  }
  v13 = [(PXFeedSectionInfosManager *)self earliestDate];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v16 = v15;

  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v17 = [(PXFeedSectionInfosManager *)self _sectionInfoSortingComparator];
  v41 = self->_sectionInfosByCloudFeedEntry;
  v18 = (void *)[(NSMutableArray *)self->_sectionInfos mutableCopy];
  v39 = (void *)v17;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  id v19 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v38 = a2;
  id v21 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__88453;
  v83 = __Block_byref_object_dispose__88454;
  id v84 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__88453;
  v72 = __Block_byref_object_dispose__88454;
  id v73 = 0;
  photoLibrary = self->_photoLibrary;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __136__PXFeedSectionInfosManager__updateSectionInfosForFeedEntriesChangeNotifications_commentsChangeNotifications_assetsChangeNotifications___block_invoke;
  v51[3] = &unk_1E5DB8460;
  id v32 = v49;
  id v52 = v32;
  id v34 = v16;
  id v53 = v34;
  id v36 = v47;
  id v54 = v36;
  v48 = v41;
  v55 = v48;
  id v42 = v45;
  id v56 = v42;
  id v44 = v43;
  id v57 = v44;
  id v50 = v18;
  id v58 = v50;
  id v23 = v19;
  id v59 = v23;
  id v46 = v39;
  id v64 = v46;
  id v24 = v20;
  id v60 = v24;
  id v25 = v21;
  id v61 = v25;
  v65 = &v74;
  id v40 = v9;
  id v62 = v40;
  p_long long buf = &buf;
  id v26 = v10;
  id v63 = v26;
  v67 = &v68;
  [(PLPhotoLibrary *)photoLibrary performBlockAndWait:v51];
  objc_storeStrong((id *)&self->_sectionInfos, v18);
  v27 = objc_alloc_init(PXFeedSectionInfosChange);
  v28 = v27;
  if (*((unsigned char *)v75 + 24))
  {
    -[PXFeedSectionInfosChange setShouldReload:](v27, "setShouldReload:", 1, v32, v34, v36);
  }
  else
  {
    -[PXFeedSectionInfosChange setDeletedIndexes:](v27, "setDeletedIndexes:", v23, v32, v34, v36);
    [(PXFeedSectionInfosChange *)v28 setInsertedIndexes:v24];
    [(PXFeedSectionInfosChange *)v28 setUpdatedIndexes:v25];
    [(PXFeedSectionInfosChange *)v28 setSectionInfosWithCommentChanges:*(void *)(*((void *)&buf + 1) + 40)];
    [(PXFeedSectionInfosChange *)v28 setUpdatedAssets:v69[5]];
  }
  v29 = [(PXFeedSectionInfosManager *)self delegate];
  [v29 feedSectionInfosManager:self sectionInfosDidChange:v28];

  v30 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v31 = NSStringFromSelector(v38);
    *(_DWORD *)v78 = 138412290;
    v79 = v31;
    _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEBUG, "did %@", v78, 0xCu);
  }
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v74, 8);
}

void __136__PXFeedSectionInfosManager__updateSectionInfosForFeedEntriesChangeNotifications_commentsChangeNotifications_assetsChangeNotifications___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v106 = v1;
  uint64_t v100 = [obj countByEnumeratingWithState:&v139 objects:v155 count:16];
  if (v100)
  {
    uint64_t v99 = *(void *)v140;
    v104 = (id *)(v1 + 48);
    v2 = (id *)(v1 + 72);
    v103 = (id *)(v1 + 64);
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v140 != v99) {
          objc_enumerationMutation(obj);
        }
        uint64_t v102 = v3;
        id v4 = *(void **)(*((void *)&v139 + 1) + 8 * v3);
        long long v135 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        v5 = [v4 insertedEntries];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v135 objects:v154 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v136;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v136 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v135 + 1) + 8 * i);
              v11 = [v10 entryDate];
              if ([*(id *)(v1 + 40) compare:v11] == -1) {
                [*v104 addObject:v10];
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v135 objects:v154 count:16];
          }
          while (v7);
        }

        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        v101 = v4;
        v12 = [v4 updatedEntries];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v131 objects:v153 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v132;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v132 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v131 + 1) + 8 * j);
              v18 = [v17 entryDate];
              uint64_t v19 = [*(id *)(v1 + 40) compare:v18];
              id v20 = *(void **)(v1 + 56);
              id v21 = [v17 objectID];
              v22 = [v20 objectForKey:v21];

              if (v19 == -1)
              {
                id v23 = v104;
                if (v22) {
                  id v23 = v103;
                }
LABEL_25:
                [*v23 addObject:v17];
                goto LABEL_26;
              }
              id v23 = v2;
              if (v22) {
                goto LABEL_25;
              }
LABEL_26:

              uint64_t v1 = v106;
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v131 objects:v153 count:16];
          }
          while (v14);
        }

        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        id v24 = [v101 deletedEntries];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v127 objects:v152 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v128;
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v128 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v127 + 1) + 8 * k);
              v30 = *(void **)(v1 + 56);
              v31 = [v29 objectID];
              id v32 = [v30 objectForKey:v31];

              if (v32) {
                [*v2 addObject:v29];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v127 objects:v152 count:16];
          }
          while (v26);
        }

        uint64_t v3 = v102 + 1;
      }
      while (v102 + 1 != v100);
      uint64_t v100 = [obj countByEnumeratingWithState:&v139 objects:v155 count:16];
    }
    while (v100);
  }

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v33 = *(id *)(v1 + 72);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v123 objects:v151 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v124;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v124 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v123 + 1) + 8 * m);
        v39 = *(void **)(v1 + 56);
        id v40 = [v38 objectID];
        v41 = [v39 objectForKey:v40];

        uint64_t v42 = [*(id *)(v1 + 80) indexOfObjectIdenticalTo:v41];
        if (v42 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [*(id *)(v1 + 88) addIndex:v42];
          id v43 = *(void **)(v1 + 56);
          id v44 = [v38 objectID];
          [v43 removeObjectForKey:v44];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v123 objects:v151 count:16];
    }
    while (v35);
  }

  [*(id *)(v1 + 80) removeObjectsAtIndexes:*(void *)(v1 + 88)];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v45 = *(id *)(v1 + 48);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v119 objects:v150 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v120;
    do
    {
      for (uint64_t n = 0; n != v47; ++n)
      {
        if (*(void *)v120 != v48) {
          objc_enumerationMutation(v45);
        }
        id v50 = *(void **)(*((void *)&v119 + 1) + 8 * n);
        if (([v50 isDeleted] & 1) == 0)
        {
          v51 = *(void **)(v106 + 56);
          id v52 = [v50 objectID];
          id v53 = [v51 objectForKey:v52];

          if (v53)
          {
            [*(id *)(v106 + 64) addObject:v50];
          }
          else
          {
            id v54 = +[PXFeedSectionInfo sectionInfoWithCloudFeedEntry:v50];
            v55 = *(void **)(v106 + 56);
            id v56 = [v50 objectID];
            [v55 setObject:v54 forKey:v56];

            uint64_t v57 = objc_msgSend(*(id *)(v106 + 80), "indexOfObject:inSortedRange:options:usingComparator:", v54, 0, objc_msgSend(*(id *)(v106 + 80), "count"), 1024, *(void *)(v106 + 128));
            [*(id *)(v106 + 80) insertObject:v54 atIndex:v57];
            id v58 = *(void **)(v106 + 96);
            id v59 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v57];
            objc_msgSend(v58, "pl_adjustIndexesForInsertions:", v59);

            [*(id *)(v106 + 96) addIndex:v57];
          }
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v119 objects:v150 count:16];
    }
    while (v47);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  uint64_t v60 = v106;
  id v105 = *(id *)(v106 + 64);
  uint64_t v61 = [v105 countByEnumeratingWithState:&v115 objects:v149 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v116;
    do
    {
      for (iuint64_t i = 0; ii != v62; ++ii)
      {
        if (*(void *)v116 != v63) {
          objc_enumerationMutation(v105);
        }
        v65 = *(void **)(v60 + 56);
        v66 = [*(id *)(*((void *)&v115 + 1) + 8 * ii) objectID];
        v67 = [v65 objectForKey:v66];

        uint64_t v68 = [*(id *)(v60 + 80) indexOfObjectIdenticalTo:v67];
        if (v68 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v69 = v68;
          if ([v67 isLoaded])
          {
            [v67 reload];
            [*(id *)(v60 + 104) addIndex:v69];
          }
          if (v69 < 1)
          {
            uint64_t v70 = 0;
          }
          else
          {
            uint64_t v70 = [*(id *)(v60 + 80) objectAtIndex:v69 - 1];
          }
          if (v69 >= (unint64_t)([*(id *)(v60 + 80) count] - 1))
          {
            v71 = 0;
            if (v70) {
              goto LABEL_74;
            }
            goto LABEL_75;
          }
          v71 = [*(id *)(v60 + 80) objectAtIndex:v69 + 1];
          if (!v70) {
            goto LABEL_75;
          }
LABEL_74:
          if ((*(uint64_t (**)(void))(*(void *)(v106 + 128) + 16))() == -1)
          {
LABEL_75:
            if (v71 && (*(uint64_t (**)(void))(*(void *)(v106 + 128) + 16))() != -1) {
              goto LABEL_77;
            }
          }
          else
          {
LABEL_77:
            [*(id *)(v106 + 80) removeObjectAtIndex:v69];
            uint64_t v72 = objc_msgSend(*(id *)(v106 + 80), "indexOfObject:inSortedRange:options:usingComparator:", v67, 0, objc_msgSend(*(id *)(v106 + 80), "count"), 1024, *(void *)(v106 + 128));
            [*(id *)(v106 + 80) insertObject:v67 atIndex:v72];
            *(unsigned char *)(*(void *)(*(void *)(v106 + 136) + 8) + 24) = 1;
            id v73 = PLCloudFeedGetLog();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 134218240;
              uint64_t v146 = v69;
              __int16 v147 = 2048;
              uint64_t v148 = v72;
              _os_log_impl(&dword_1A9AE7000, v73, OS_LOG_TYPE_DEBUG, "Section move detected (%li -> %li)", buf, 0x16u);
            }
          }
          uint64_t v60 = v106;
        }
      }
      uint64_t v62 = [v105 countByEnumeratingWithState:&v115 objects:v149 count:16];
    }
    while (v62);
  }

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v74 = *(id *)(v60 + 112);
  uint64_t v75 = [v74 countByEnumeratingWithState:&v111 objects:v144 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v112;
    do
    {
      for (juint64_t j = 0; jj != v76; ++jj)
      {
        if (*(void *)v112 != v77) {
          objc_enumerationMutation(v74);
        }
        v79 = [*(id *)(*((void *)&v111 + 1) + 8 * jj) asset];
        v80 = [v79 cloudFeedAssetsEntry];
        uint64_t v81 = *(void **)(v106 + 56);
        v82 = [v80 objectID];
        v83 = [v81 objectForKey:v82];

        if (v83)
        {
          id v84 = *(void **)(*(void *)(*(void *)(v106 + 144) + 8) + 40);
          if (!v84)
          {
            id v85 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            uint64_t v86 = *(void *)(*(void *)(v106 + 144) + 8);
            v87 = *(void **)(v86 + 40);
            *(void *)(v86 + 40) = v85;

            id v84 = *(void **)(*(void *)(*(void *)(v106 + 144) + 8) + 40);
          }
          [v84 addObject:v83];
        }
      }
      uint64_t v76 = [v74 countByEnumeratingWithState:&v111 objects:v144 count:16];
    }
    while (v76);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(v106 + 136) + 8) + 24) && [*(id *)(v106 + 120) count])
  {
    id v88 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v89 = *(void *)(*(void *)(v106 + 152) + 8);
    v90 = *(void **)(v89 + 40);
    *(void *)(v89 + 40) = v88;

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v91 = *(id *)(v106 + 120);
    uint64_t v92 = [v91 countByEnumeratingWithState:&v107 objects:v143 count:16];
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = *(void *)v108;
      do
      {
        for (kuint64_t k = 0; kk != v93; ++kk)
        {
          if (*(void *)v108 != v94) {
            objc_enumerationMutation(v91);
          }
          v96 = *(void **)(*(void *)(*(void *)(v106 + 152) + 8) + 40);
          v97 = [*(id *)(*((void *)&v107 + 1) + 8 * kk) updatedAssets];
          [v96 unionSet:v97];
        }
        uint64_t v93 = [v91 countByEnumeratingWithState:&v107 objects:v143 count:16];
      }
      while (v93);
    }
  }
}

- (BOOL)_shouldPerformFullReloadForFeedEntriesChangeNotifications:(id)a3 commentsChangeNotifications:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(PXFeedSectionInfosManager *)self entryFilter] == 4)
  {
    uint64_t v6 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "filter is \"Inbox\", always performing full reload", buf, 2u);
    }
LABEL_16:
    LOBYTE(v7) = 1;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "shouldReload", (void)v12))
          {
            id v10 = PLCloudFeedGetLog();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)long long buf = 0;
            }

            goto LABEL_16;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }

  return v7;
}

- (void)_didFinishPostingNotifications:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    uint64_t v7 = [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications count];
    uint64_t v8 = [(NSMutableArray *)self->_pendingCommentsChangeNotifications count];
    uint64_t v9 = [(NSMutableArray *)self->_pendingAssetsChangeNotifications count];
    int v15 = 138544130;
    v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ (pendingFeedEntries: %lu, pendingCommentsChange: %lu, pendingAssetsChange: %lu)", (uint8_t *)&v15, 0x2Au);
  }
  if ([(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications count]
    || [(NSMutableArray *)self->_pendingCommentsChangeNotifications count]
    || [(NSMutableArray *)self->_pendingAssetsChangeNotifications count])
  {
    id v10 = (void *)[(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications copy];
    v11 = (void *)[(NSMutableArray *)self->_pendingCommentsChangeNotifications copy];
    long long v12 = (void *)[(NSMutableArray *)self->_pendingAssetsChangeNotifications copy];
    [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications removeAllObjects];
    [(NSMutableArray *)self->_pendingCommentsChangeNotifications removeAllObjects];
    [(NSMutableArray *)self->_pendingAssetsChangeNotifications removeAllObjects];
    BOOL v13 = [(PXFeedSectionInfosManager *)self _shouldPerformFullReloadForFeedEntriesChangeNotifications:v10 commentsChangeNotifications:v11];
    long long v14 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 67109120;
      LODWORD(v16) = v13;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEBUG, "needsFullReload=%i", (uint8_t *)&v15, 8u);
    }

    if (v13) {
      [(PXFeedSectionInfosManager *)self _rebuildSectionInfos];
    }
    else {
      [(PXFeedSectionInfosManager *)self _updateSectionInfosForFeedEntriesChangeNotifications:v10 commentsChangeNotifications:v11 assetsChangeNotifications:v12];
    }
  }
}

- (void)shouldReload:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v7, 0xCu);
  }
  [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications removeAllObjects];
  [(NSMutableArray *)self->_pendingCommentsChangeNotifications removeAllObjects];
  [(NSMutableArray *)self->_pendingAssetsChangeNotifications removeAllObjects];
  [(PXFeedSectionInfosManager *)self _rebuildSectionInfos];
}

- (void)assetsDidChange:(id)a3
{
}

- (void)cloudCommentsDidChange:(id)a3
{
  id v4 = a3;
  if (([(PXFeedSectionInfosManager *)self entryFilter] & 0xFFFFFFFFFFFFFFFDLL) != 1) {
    [(NSMutableArray *)self->_pendingCommentsChangeNotifications addObject:v4];
  }
}

- (void)cloudFeedEntriesDidChange:(id)a3
{
  id v13 = a3;
  int64_t v4 = [(PXFeedSectionInfosManager *)self entryFilter];
  if (([v13 shouldReload] & 1) != 0 || !v4)
  {
    [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications addObject:v13];
  }
  else
  {
    id v5 = [v13 insertedEntries];
    uint64_t v6 = (void *)[v5 mutableCopy];

    int v7 = [v13 updatedEntries];
    uint64_t v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = [v13 deletedEntries];
    id v10 = (void *)[v9 mutableCopy];

    v11 = [MEMORY[0x1E4F8A710] notificationPredicateForFilter:v4];
    [v6 filterUsingPredicate:v11];
    [v8 filterUsingPredicate:v11];
    [v10 filterUsingPredicate:v11];
    long long v12 = [MEMORY[0x1E4F8A708] notificationWithInsertedEntries:v6 updatedEntries:v8 deletedEntries:v10];
    [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications addObject:v12];
  }
}

- (void)_getEarliestDate:(id *)a3 mostRecentEntries:(id *)a4 forBatchWithLatestDate:(id)a5
{
  id v8 = a5;
  int64_t v9 = [(PXFeedSectionInfosManager *)self entryFilter];
  if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 75;
  }
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__88453;
  v29 = __Block_byref_object_dispose__88454;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__88453;
  uint64_t v23 = __Block_byref_object_dispose__88454;
  id v24 = 0;
  photoLibrary = self->_photoLibrary;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PXFeedSectionInfosManager__getEarliestDate_mostRecentEntries_forBatchWithLatestDate___block_invoke;
  v13[3] = &unk_1E5DB8438;
  v13[4] = self;
  id v12 = v8;
  uint64_t v17 = v10;
  int64_t v18 = v9;
  id v14 = v12;
  int v15 = &v25;
  v16 = &v19;
  [(PLPhotoLibrary *)photoLibrary performBlockAndWait:v13];
  if (a3) {
    *a3 = (id) v26[5];
  }
  if (a4) {
    *a4 = (id) v20[5];
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
}

void __87__PXFeedSectionInfosManager__getEarliestDate_mostRecentEntries_forBatchWithLatestDate___block_invoke(void *a1)
{
  id v20 = [MEMORY[0x1E4F8A710] recentEntriesInLibrary:*(void *)(a1[4] + 8) earliestDate:0 latestDate:a1[5] limit:a1[8] filter:a1[9] sortDescriptors:0];
  if ((unint64_t)[v20 count] >= a1[8])
  {
    id v8 = [v20 lastObject];
    uint64_t v9 = [v8 entryDate];
    uint64_t v10 = *(void *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = [v20 count];
    do
    {
      uint64_t v13 = v12--;
      if (v12 < 1) {
        break;
      }
      id v14 = *(void **)(*(void *)(a1[6] + 8) + 40);
      int v15 = [v20 objectAtIndexedSubscript:v12];
      v16 = [v15 entryDate];
      uint64_t v17 = [v14 compare:v16];
    }
    while (v17 != -1);
    uint64_t v18 = objc_msgSend(v20, "subarrayWithRange:", 0, v13);
    uint64_t v19 = *(void *)(a1[7] + 8);
    int v7 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] distantPast];
    uint64_t v3 = *(void *)(a1[6] + 8);
    int64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void *)(a1[7] + 8);
    id v6 = v20;
    int v7 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
}

- (void)_rebuildSectionInfos
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "will rebuild section infos", buf, 2u);
  }

  int64_t v4 = [(PXFeedSectionInfosManager *)self earliestDate];
  uint64_t v23 = v4;
  if (v4)
  {
    *(void *)long long buf = 0;
    id v32 = buf;
    uint64_t v33 = 0x3032000000;
    uint64_t v34 = __Block_byref_object_copy__88453;
    uint64_t v35 = __Block_byref_object_dispose__88454;
    id v36 = 0;
    photoLibrary = self->_photoLibrary;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__PXFeedSectionInfosManager__rebuildSectionInfos__block_invoke;
    v28[3] = &unk_1E5DCCA20;
    id v30 = buf;
    void v28[4] = self;
    id v29 = v4;
    [(PLPhotoLibrary *)photoLibrary performBlockAndWait:v28];
    id v6 = *((id *)v32 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v37 = 0;
    uint64_t v38 = 0;
    [(PXFeedSectionInfosManager *)self _getEarliestDate:&v38 mostRecentEntries:&v37 forBatchWithLatestDate:0];
    uint64_t v7 = v38;
    id v6 = v37;
    [(PXFeedSectionInfosManager *)self setEarliestDate:v7];
  }
  id v8 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  sectionInfos = self->_sectionInfos;
  self->_sectionInfos = v8;

  uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sectionInfosByCloudFeedEntry = self->_sectionInfosByCloudFeedEntry;
  self->_sectionInfosByCloudFeedEntry = v10;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [v6 reverseObjectEnumerator];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v17 = +[PXFeedSectionInfo sectionInfoWithCloudFeedEntry:v16];
        uint64_t v18 = self->_sectionInfosByCloudFeedEntry;
        uint64_t v19 = [v16 objectID];
        [(NSMutableDictionary *)v18 setObject:v17 forKey:v19];

        [(NSMutableArray *)self->_sectionInfos addObject:v17];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v39 count:16];
    }
    while (v13);
  }

  id v20 = objc_alloc_init(PXFeedSectionInfosChange);
  [(PXFeedSectionInfosChange *)v20 setShouldReload:1];
  uint64_t v21 = [(PXFeedSectionInfosManager *)self delegate];
  [v21 feedSectionInfosManager:self sectionInfosDidChange:v20];

  uint64_t v22 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEBUG, "did rebuild section infos", buf, 2u);
  }
}

void __49__PXFeedSectionInfosManager__rebuildSectionInfos__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F8A710], "recentEntriesInLibrary:earliestDate:latestDate:limit:filter:sortDescriptors:", *(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "fetchLimit"), objc_msgSend(*(id *)(a1 + 32), "entryFilter"), 0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)indexesOfInvitationsReceivedSectionInfos
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  sectionInfos = self->_sectionInfos;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PXFeedSectionInfosManager_indexesOfInvitationsReceivedSectionInfos__block_invoke;
  v7[3] = &unk_1E5DD2AB8;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableArray *)sectionInfos enumerateObjectsWithOptions:2 usingBlock:v7];

  return v5;
}

uint64_t __69__PXFeedSectionInfosManager_indexesOfInvitationsReceivedSectionInfos__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 sectionType];
  if (result == 2)
  {
    id v8 = *(void **)(a1 + 32);
    return [v8 addIndex:a3];
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (int64_t)numberOfInvitationsReceived
{
  uint64_t v2 = [(PXFeedSectionInfosManager *)self indexesOfInvitationsReceivedSectionInfos];
  int64_t v3 = [v2 count];

  return v3;
}

- (BOOL)reconfigureToIncludeCloudFeedEntry:(id)a3
{
  int64_t v4 = [a3 entryDate];
  id v5 = [v4 dateByAddingTimeInterval:-1.0];

  id v6 = [(NSMutableArray *)self->_sectionInfos lastObject];
  uint64_t v7 = [v6 cloudFeedEntry];
  id v8 = [v7 entryDate];

  BOOL v9 = 0;
  if (v5 && v8)
  {
    if ([v5 compare:v8] == -1)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __64__PXFeedSectionInfosManager_reconfigureToIncludeCloudFeedEntry___block_invoke;
      v11[3] = &unk_1E5DB8410;
      id v12 = v5;
      [(PXFeedSectionInfosManager *)self reconfigure:v11];

      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

void __64__PXFeedSectionInfosManager_reconfigureToIncludeCloudFeedEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setEarliestDate:v2];
  [v3 setFetchLimit:0];
}

- (void)reconfigure:(id)a3
{
  (*((void (**)(id, PXFeedSectionInfosManager *))a3 + 2))(a3, self);
  [(PXFeedSectionInfosManager *)self _rebuildSectionInfos];
}

- (void)loadSectionInfosAtIndexes:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  sectionInfos = self->_sectionInfos;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __55__PXFeedSectionInfosManager_loadSectionInfosAtIndexes___block_invoke;
  v35[3] = &unk_1E5DD2AB8;
  id v8 = v6;
  id v36 = v8;
  [(NSMutableArray *)sectionInfos enumerateObjectsAtIndexes:v4 options:0 usingBlock:v35];
  int64_t v9 = [(PXFeedSectionInfosManager *)self entryFilter];
  if ([v4 containsIndex:0])
  {
    if ([(PXFeedSectionInfosManager *)self fetchLimit])
    {
      unint64_t v10 = [(NSMutableArray *)self->_sectionInfos count];
      if (v10 < [(PXFeedSectionInfosManager *)self fetchLimit] && (v9 | 2) != 6)
      {
        long long v27 = v5;
        id v28 = v4;
        v11 = PLCloudFeedGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          id v12 = [MEMORY[0x1E4F29060] callStackSymbols];
          *(_DWORD *)long long buf = 138412290;
          v39 = v12;
          _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "will load next batch of sections %@", buf, 0xCu);
        }
        id v33 = 0;
        id v34 = 0;
        [(PXFeedSectionInfosManager *)self _getEarliestDate:&v34 mostRecentEntries:&v33 forBatchWithLatestDate:self->_earliestDate];
        id v13 = v34;
        id v14 = v33;
        [(PXFeedSectionInfosManager *)self setEarliestDate:v13];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v21 = +[PXFeedSectionInfo sectionInfoWithCloudFeedEntry:v20];
              sectionInfosByCloudFeedEntry = self->_sectionInfosByCloudFeedEntry;
              uint64_t v23 = [v20 objectID];
              [(NSMutableDictionary *)sectionInfosByCloudFeedEntry setObject:v21 forKey:v23];

              [(NSMutableArray *)self->_sectionInfos insertObject:v21 atIndex:0];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v17);
        }

        id v5 = v27;
        objc_msgSend(v27, "addIndexesInRange:", 0, objc_msgSend(v15, "count"));
        objc_msgSend(v8, "pl_adjustIndexesForInsertions:", v27);
        long long v24 = PLCloudFeedGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_DEBUG, "did load next batch of sections", buf, 2u);
        }

        id v4 = v28;
      }
    }
  }
  if ([v5 count] || objc_msgSend(v8, "count"))
  {
    long long v25 = objc_alloc_init(PXFeedSectionInfosChange);
    [(PXFeedSectionInfosChange *)v25 setInsertedIndexes:v5];
    [(PXFeedSectionInfosChange *)v25 setUpdatedIndexes:v8];
    long long v26 = [(PXFeedSectionInfosManager *)self delegate];
    [v26 feedSectionInfosManager:self sectionInfosDidChange:v25];
  }
}

void __55__PXFeedSectionInfosManager_loadSectionInfosAtIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([v5 isLoaded] & 1) == 0)
  {
    [v5 reload];
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

- (id)indexesOfUnloadedSectionInfosAtIndexes:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  sectionInfos = self->_sectionInfos;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PXFeedSectionInfosManager_indexesOfUnloadedSectionInfosAtIndexes___block_invoke;
  v10[3] = &unk_1E5DD2AB8;
  id v8 = v6;
  id v11 = v8;
  [(NSMutableArray *)sectionInfos enumerateObjectsAtIndexes:v5 options:0 usingBlock:v10];

  return v8;
}

uint64_t __68__PXFeedSectionInfosManager_indexesOfUnloadedSectionInfosAtIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 isLoaded];
  if ((result & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 addIndex:a3];
  }
  return result;
}

- (int64_t)indexOfSectionInfoForCloudFeedEntry:(id)a3
{
  sectionInfosByCloudFeedEntry = self->_sectionInfosByCloudFeedEntry;
  id v5 = [a3 objectID];
  id v6 = [(NSMutableDictionary *)sectionInfosByCloudFeedEntry objectForKey:v5];

  int64_t v7 = [(NSMutableArray *)self->_sectionInfos indexOfObject:v6];
  return v7;
}

- (id)sectionInfoWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_sectionInfos;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = objc_msgSend(v9, "transientIdentifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)indexOfSectionInfo:(id)a3
{
  return [(NSMutableArray *)self->_sectionInfos indexOfObject:a3];
}

- (id)sectionInfosAtIndexes:(id)a3
{
  return (id)[(NSMutableArray *)self->_sectionInfos objectsAtIndexes:a3];
}

- (id)sectionInfoAtIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    id v6 = 0;
  }
  else
  {
    if ([(NSMutableArray *)self->_sectionInfos count] <= (unint64_t)a3)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [(NSMutableArray *)self->_sectionInfos objectAtIndexedSubscript:a3];
    }
  }
  return v6;
}

- (BOOL)hasEnoughCloudFeedAssetEntriesToDisplay
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = self->_sectionInfos;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "cloudFeedEntry", (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [v7 entryAssets];
          v4 += [v8 count];

          if (v4 >= 4)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (int64_t)numberOfSectionInfos
{
  return [(NSMutableArray *)self->_sectionInfos count];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F8A6E8] defaultCenter];
  [v3 removeCloudFeedEntriesObserver:self];
  [v3 removeCloudCommentsChangeObserver:self asset:0];
  [v3 removeAssetChangeObserver:self];
  [v3 removeShouldReloadObserver:self];
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F8AD20] object:0];

  v5.receiver = self;
  v5.super_class = (Class)PXFeedSectionInfosManager;
  [(PXFeedSectionInfosManager *)&v5 dealloc];
}

- (PXFeedSectionInfosManager)initWithPhotoLibrary:(id)a3 configurationBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int64_t v9 = (void (**)(id, PXFeedSectionInfosManager *))a4;
  v24.receiver = self;
  v24.super_class = (Class)PXFeedSectionInfosManager;
  long long v10 = [(PXFeedSectionInfosManager *)&v24 init];
  long long v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibrary, a3);
    earliestDate = v11->_earliestDate;
    v11->_entryFilter = 0;
    v11->_earliestDate = 0;

    v11->_fetchLimit = 0;
    if (v9) {
      v9[2](v9, v11);
    }
    long long v13 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      long long v14 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412290;
      long long v26 = v14;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    [(PXFeedSectionInfosManager *)v11 _rebuildSectionInfos];
    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingFeedEntriesChangeNotifications = v11->_pendingFeedEntriesChangeNotifications;
    v11->_pendingFeedEntriesChangeNotifications = v15;

    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingCommentsChangeNotifications = v11->_pendingCommentsChangeNotifications;
    v11->_pendingCommentsChangeNotifications = v17;

    uint64_t v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingAssetsChangeNotifications = v11->_pendingAssetsChangeNotifications;
    v11->_pendingAssetsChangeNotifications = v19;

    uint64_t v21 = [MEMORY[0x1E4F8A6E8] defaultCenter];
    [v21 addCloudFeedEntriesObserver:v11];
    [v21 addCloudCommentsChangeObserver:v11 asset:0];
    [v21 addAssetChangeObserver:v11];
    [v21 addShouldReloadObserver:v11];
    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v11 selector:sel__didFinishPostingNotifications_ name:*MEMORY[0x1E4F8AD20] object:0];
  }
  return v11;
}

+ (NSDate)mostRecentCreationDate
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F8AA78] cloudSharingPhotoLibrary];
  uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:0];
  v28[0] = v15;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  int v4 = [MEMORY[0x1E4F8A710] recentEntriesInLibrary:v2 earliestDate:0 latestDate:0 limit:1 filter:3 sortDescriptors:v3];
  objc_super v5 = [MEMORY[0x1E4F8A710] recentEntriesInLibrary:v2 earliestDate:0 latestDate:0 limit:3 filter:4 sortDescriptors:v3];
  id v6 = [v4 firstObject];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    long long v25 = __Block_byref_object_copy__88453;
    long long v26 = __Block_byref_object_dispose__88454;
    id v27 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__PXFeedSectionInfosManager_mostRecentCreationDate__block_invoke;
    v19[3] = &unk_1E5DD0588;
    uint64_t v21 = &v22;
    id v20 = v6;
    [v2 performBlockAndWait:v19];
    id v8 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v8 = 0;
  }
  int64_t v9 = [v5 firstObject];
  long long v10 = v9;
  if (!v9)
  {
    id v11 = 0;
    id v12 = 0;
    if (!v8) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__88453;
  long long v26 = __Block_byref_object_dispose__88454;
  id v27 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__PXFeedSectionInfosManager_mostRecentCreationDate__block_invoke_2;
  v16[3] = &unk_1E5DD0588;
  uint64_t v18 = &v22;
  id v17 = v9;
  [v2 performBlockAndWait:v16];
  id v11 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  if (v8 && v11)
  {
    id v12 = [v8 laterDate:v11];
    goto LABEL_12;
  }
  if (v8)
  {
LABEL_11:
    id v12 = v8;
    goto LABEL_12;
  }
  if (v11)
  {
    id v12 = v11;
    id v11 = v12;
  }
  else
  {
    id v12 = 0;
  }
LABEL_12:
  long long v13 = (NSDate *)v12;

  return v13;
}

void __51__PXFeedSectionInfosManager_mostRecentCreationDate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __51__PXFeedSectionInfosManager_mostRecentCreationDate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end