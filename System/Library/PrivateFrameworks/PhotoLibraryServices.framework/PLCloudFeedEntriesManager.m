@interface PLCloudFeedEntriesManager
- (BOOL)_commentIsBatchCaption:(id)a3;
- (BOOL)_shouldIgnoreAsset:(id)a3;
- (BOOL)_shouldIgnoreComment:(id)a3;
- (BOOL)_shouldIgnoreInvitationRecord:(id)a3;
- (BOOL)_shouldMergeAsset:(id)a3 intoEntry:(id)a4;
- (BOOL)_tryMergingComment:(id)a3 withEntry:(id)a4;
- (BOOL)_wasAssetPublishedBeforeSubscription:(id)a3;
- (BOOL)_wasCommentPublishedBeforeSubscription:(id)a3;
- (PLCloudFeedEntriesManager)initWithPhotoLibrary:(id)a3;
- (PLPhotoLibrary)library;
- (id)_albumCreatedEntryForSharedAlbum:(id)a3;
- (id)_assetSortingComparator;
- (id)_commentSortingComparator;
- (id)_dateForAsset:(id)a3;
- (id)_firstEntryAfterDate:(id)a3;
- (id)_firstEntryOnOrAfterDate:(id)a3;
- (id)_firstEntryOnOrBeforeDate:(id)a3;
- (id)_firstEntryRelativeToDate:(id)a3 ascending:(BOOL)a4 includeSameDate:(BOOL)a5;
- (id)_invitationAcceptedEntryForInvitationRecord:(id)a3;
- (id)_invitationDeclinedEntryForInvitationRecord:(id)a3;
- (id)_invitationReceivedEntryForSharedAlbum:(id)a3;
- (id)_singleEntryOfType:(int64_t)a3 forInvitationRecord:(id)a4;
- (id)_singleEntryOfType:(int64_t)a3 forSharedAlbum:(id)a4;
- (id)_subscriptionDateForSharedAlbum:(id)a3;
- (id)_subscriptionEntryForSharedAlbum:(id)a3;
- (void)_addAsset:(id)a3 toEntry:(id)a4;
- (void)_getEarliestDate:(id *)a3 latestDate:(id *)a4 forRangeOfContiguousCommentsEntriesAroundDate:(id)a5;
- (void)_mergeEntriesAroundDate:(id)a3;
- (void)_mergeOlderEntry:(id)a3 intoMoreRecentEntry:(id)a4;
- (void)_noteContentDeletionAffectingAlbumCreatedEntry:(id)a3;
- (void)_noteContentDeletionAffectingAssetsEntry:(id)a3;
- (void)_noteContentDeletionAffectingCommentsEntry:(id)a3;
- (void)_noteContentDeletionAffectingInvitationEntry:(id)a3;
- (void)_noteContentDeletionAffectingInvitationResponseEntry:(id)a3;
- (void)_noteContentDeletionAffectingSubscriptionEntry:(id)a3;
- (void)_noteDidReceiveSharedAsset:(id)a3;
- (void)_noteDidReceiveSharedAssetPublishedBeforeSubscription:(id)a3;
- (void)_noteDidReceiveSharedComment:(id)a3;
- (void)_noteDidReceiveSharedComments:(id)a3;
- (void)_noteDidUpdateInvitationRecord:(id)a3;
- (void)_noteDidUpdateSharedAlbum:(id)a3;
- (void)_splitEntriesAtDate:(id)a3;
- (void)processAlbumUpdates:(id)a3 assetInserts:(id)a4 assetUpdates:(id)a5 commentInserts:(id)a6 invitationRecordUpdates:(id)a7 deletionEntries:(id)a8 completionHandler:(id)a9;
- (void)rebuildAllEntries:(id)a3;
@end

@implementation PLCloudFeedEntriesManager

- (void).cxx_destruct
{
}

- (PLPhotoLibrary)library
{
  return self->_library;
}

- (BOOL)_tryMergingComment:(id)a3 withEntry:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = NSStringFromSelector(a2);
    v11 = [v7 objectID];
    v12 = [v8 objectID];
    *(_DWORD *)buf = 138412802;
    uint64_t v50 = (uint64_t)v10;
    __int16 v51 = 2112;
    v52 = v11;
    __int16 v53 = 2112;
    v54 = v12;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "will %@ %@ %@", buf, 0x20u);
  }
  if ([v8 entryType] == 2)
  {
    id v13 = v8;
    v14 = [v7 asset];
    v15 = [v14 cloudShareAlbum];
    v16 = [v15 cloudGUID];

    v17 = [v13 entryAlbumGUID];
    int v18 = [v16 isEqualToString:v17];

    v19 = [v13 entryComments];
    uint64_t v20 = [v19 count];

    BOOL v21 = 0;
    if (!v20 && v18)
    {
      v43 = self;
      v44 = a2;
      v22 = [v7 commenterHashedPersonID];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v23 = [v13 entryLikeComments];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v46;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v46 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = [*(id *)(*((void *)&v45 + 1) + 8 * i) commenterHashedPersonID];
            v29 = v28;
            if (v28 != v22 && ![v28 isEqualToString:v22])
            {
              BOOL v21 = 0;
              goto LABEL_22;
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      v22 = [v7 commentDate];
      id v30 = objc_alloc(MEMORY[0x1E4F1CA70]);
      v31 = [v13 entryLikeComments];
      v23 = (void *)[v30 initWithOrderedSet:v31];

      uint64_t v32 = [v23 count];
      v29 = [(PLCloudFeedEntriesManager *)v43 _commentSortingComparator];
      v33 = [v23 array];
      uint64_t v34 = objc_msgSend(v33, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v32, 1024, v29);

      v35 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v50 = v34;
        _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEBUG, "insertionIndex=%lu", buf, 0xCu);
      }

      [v23 insertObject:v7 atIndex:v34];
      [v13 setEntryDate:v22];
      v36 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = [v13 objectID];
        *(_DWORD *)buf = 138412546;
        uint64_t v50 = (uint64_t)v22;
        __int16 v51 = 2112;
        v52 = v37;
        _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEBUG, "set date %@ for %@", buf, 0x16u);
      }
      [v13 setEntryCloudAssetGUID:0];
      [v13 setEntryLikeComments:v23];
      BOOL v21 = 1;
LABEL_22:
      a2 = v44;
    }
  }
  else
  {
    BOOL v21 = 0;
  }
  v38 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v39 = NSStringFromSelector(a2);
    v40 = [v7 objectID];
    v41 = [v8 objectID];
    *(_DWORD *)buf = 138413058;
    uint64_t v50 = (uint64_t)v39;
    __int16 v51 = 2112;
    v52 = v40;
    __int16 v53 = 2112;
    v54 = v41;
    __int16 v55 = 1024;
    BOOL v56 = v21;
    _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEBUG, "did %@ %@ %@ merged=%i", buf, 0x26u);
  }
  return v21;
}

- (void)_mergeEntriesAroundDate:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(a2);
    int v21 = 138412546;
    uint64_t v22 = (uint64_t)v7;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", (uint8_t *)&v21, 0x16u);
  }
  id v8 = [(PLCloudFeedEntriesManager *)self _firstEntryOnOrBeforeDate:v5];
  v9 = [(PLCloudFeedEntriesManager *)self _firstEntryAfterDate:v5];
  uint64_t v10 = [v8 entryType];
  uint64_t v11 = [v9 entryType];
  v12 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v8 objectID];
    v14 = [v9 objectID];
    int v21 = 138413058;
    uint64_t v22 = (uint64_t)v13;
    __int16 v23 = 2048;
    uint64_t v24 = v10;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "entryBefore=%@ type=%li entryAfter=%@ type=%li", (uint8_t *)&v21, 0x2Au);
  }
  if (v10 == 1 && v11 == 1)
  {
    v15 = [v9 entryAssets];
    v16 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v15 count];
      int v21 = 134217984;
      uint64_t v22 = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "entryAfterAssetsCount=%lu", (uint8_t *)&v21, 0xCu);
    }

    if ([v15 count])
    {
      int v18 = [v15 objectAtIndex:0];
      if ([(PLCloudFeedEntriesManager *)self _shouldMergeAsset:v18 intoEntry:v8]) {
        [(PLCloudFeedEntriesManager *)self _mergeOlderEntry:v8 intoMoreRecentEntry:v9];
      }
    }
  }
  v19 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = NSStringFromSelector(a2);
    int v21 = 138412546;
    uint64_t v22 = (uint64_t)v20;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v5;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "did %@ %@", (uint8_t *)&v21, 0x16u);
  }
}

- (void)_splitEntriesAtDate:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = (uint64_t)v7;
    __int16 v38 = 2112;
    uint64_t v39 = (uint64_t)v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);
  }
  id v8 = [(PLCloudFeedEntriesManager *)self _firstEntryOnOrAfterDate:v5];
  if ([v8 entryType] == 1)
  {
    v9 = v8;
    uint64_t v10 = [v9 entryAssets];
    uint64_t v11 = [v10 array];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __49__PLCloudFeedEntriesManager__splitEntriesAtDate___block_invoke;
    v34[3] = &unk_1E5875938;
    v34[4] = self;
    id v35 = v5;
    uint64_t v12 = objc_msgSend(v11, "pl_indexOfFirstObjectPassingTest:", v34);

    id v13 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [v10 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v37 = v12;
      __int16 v38 = 2048;
      uint64_t v39 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "splitIndex=%li entryAssetsCout=%lu", buf, 0x16u);
    }

    if (v12 >= 1 && v12 < (unint64_t)[v10 count])
    {
      uint64_t v29 = a2;
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v12);
      v16 = (void *)MEMORY[0x1E4F1CAA0];
      uint64_t v17 = [v10 objectsAtIndexes:v15];
      int v18 = [v16 orderedSetWithArray:v17];

      v33 = v18;
      v19 = [v18 lastObject];
      v31 = [(PLCloudFeedEntriesManager *)self _dateForAsset:v19];
      uint64_t v20 = [v19 cloudShareAlbum];
      id v30 = [v20 cloudGUID];

      int v21 = [v9 mutableEntryAssets];
      uint64_t v32 = (void *)v15;
      [v21 removeObjectsAtIndexes:v15];
      uint64_t v22 = +[PLCloudFeedAssetsEntry entityName];
      __int16 v23 = [(PLCloudFeedEntriesManager *)self library];
      uint64_t v24 = [v23 managedObjectContext];
      __int16 v25 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v22, (uint64_t)v24, 0);

      if (!v25)
      {

        goto LABEL_17;
      }
      [v25 setEntryTypeNumber:&unk_1EEBF0CE0];
      [v25 setEntryPriorityNumber:&unk_1EEBF0CB0];
      objc_msgSend(v25, "setEntryDate:");
      [v25 setEntryAssets:v33];
      objc_msgSend(v25, "setEntryAlbumGUID:");
      uint64_t v26 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = (uint64_t)v25;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
      }

      __int16 v27 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = (uint64_t)v9;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "original entry=%@", buf, 0xCu);
      }

      a2 = v29;
    }
  }
  v9 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = (uint64_t)v28;
    __int16 v38 = 2112;
    uint64_t v39 = (uint64_t)v5;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
  }
LABEL_17:
}

BOOL __49__PLCloudFeedEntriesManager__splitEntriesAtDate___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _dateForAsset:a2];
  BOOL v4 = [v3 compare:*(void *)(a1 + 40)] == 1;

  return v4;
}

- (void)_mergeOlderEntry:(id)a3 intoMoreRecentEntry:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = NSStringFromSelector(a2);
    uint64_t v10 = [v6 objectID];
    uint64_t v11 = [v7 objectID];
    int v25 = 138412802;
    uint64_t v26 = (uint64_t)v9;
    __int16 v27 = 2112;
    uint64_t v28 = (uint64_t)v10;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "will %@ %@ %@", (uint8_t *)&v25, 0x20u);
  }
  uint64_t v12 = [v6 entryType];
  uint64_t v13 = [v7 entryType];
  uint64_t v14 = v13;
  if (v12 == 1 && v13 == 1)
  {
    uint64_t v15 = [v6 entryAssets];
    v16 = [v7 mutableEntryAssets];
    uint64_t v17 = [v15 array];
    int v18 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[NSObject count](v15, "count"));
    [v16 insertObjects:v17 atIndexes:v18];

    v19 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = [v6 objectID];
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "delete %@", (uint8_t *)&v25, 0xCu);
    }
    int v21 = [v6 managedObjectContext];
    [v21 deleteObject:v6];

    uint64_t v22 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v7;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "merged entry=%@", (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    uint64_t v15 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v25 = 134218240;
      uint64_t v26 = v12;
      __int16 v27 = 2048;
      uint64_t v28 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "cannot merge entry of type %li into entry of type %li", (uint8_t *)&v25, 0x16u);
    }
  }

  __int16 v23 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = NSStringFromSelector(a2);
    int v25 = 138412290;
    uint64_t v26 = (uint64_t)v24;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "did %@", (uint8_t *)&v25, 0xCu);
  }
}

- (void)_addAsset:(id)a3 toEntry:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v7 objectID];
    uint64_t v12 = [v8 objectID];
    int v23 = 138412802;
    id v24 = v10;
    __int16 v25 = 2112;
    uint64_t v26 = v11;
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "will %@ %@ %@", (uint8_t *)&v23, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v8 mutableEntryAssets];
    uint64_t v14 = [v13 count];
    uint64_t v15 = [(PLCloudFeedEntriesManager *)self _assetSortingComparator];
    v16 = [v13 array];
    uint64_t v17 = objc_msgSend(v16, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v14, 1024, v15);

    [v13 insertObject:v7 atIndex:v17];
    int v18 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138412290;
      id v24 = v8;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "updated entry=%@", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    uint64_t v13 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      id v24 = v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "cannot add asset into entry %@", (uint8_t *)&v23, 0xCu);
    }
  }

  v19 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = NSStringFromSelector(a2);
    int v21 = [v7 objectID];
    uint64_t v22 = [v8 objectID];
    int v23 = 138412802;
    id v24 = v20;
    __int16 v25 = 2112;
    uint64_t v26 = v21;
    __int16 v27 = 2112;
    uint64_t v28 = v22;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "did %@ %@ %@", (uint8_t *)&v23, 0x20u);
  }
}

- (id)_commentSortingComparator
{
  v2 = (void *)[&__block_literal_global_136_114842 copy];
  return v2;
}

uint64_t __54__PLCloudFeedEntriesManager__commentSortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 commentDate];
  id v6 = [v4 commentDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_assetSortingComparator
{
  v2 = (void *)[&__block_literal_global_114845 copy];
  return v2;
}

uint64_t __52__PLCloudFeedEntriesManager__assetSortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 cloudBatchPublishDate];
  uint64_t v7 = [v5 cloudBatchPublishDate];
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    uint64_t v9 = [v6 compare:v7];
  }
  else
  {
    uint64_t v9 = v7 != 0;
    if (v6)
    {
      uint64_t v9 = -1;
      goto LABEL_9;
    }
  }
  if (!v9)
  {
    uint64_t v10 = [v4 dateCreated];
    uint64_t v11 = [v5 dateCreated];
    uint64_t v9 = [v10 compare:v11];

    if (!v9)
    {
      uint64_t v12 = [v4 cloudAssetGUID];
      uint64_t v13 = [v5 cloudAssetGUID];
      uint64_t v9 = [v12 compare:v13];
    }
  }
LABEL_9:

  return v9;
}

- (BOOL)_shouldMergeAsset:(id)a3 intoEntry:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 entryType] == 1)
  {
    id v8 = [v7 entryAssets];
    if ([v8 count])
    {
      uint64_t v9 = [v8 objectAtIndex:0];
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v11 = [v8 lastObject];
    uint64_t v12 = [v6 cloudShareAlbum];
    uint64_t v13 = [v9 cloudShareAlbum];
    uint64_t v14 = [(PLCloudFeedEntriesManager *)self _dateForAsset:v6];
    uint64_t v15 = [(PLCloudFeedEntriesManager *)self _dateForAsset:v9];
    uint64_t v10 = [(PLCloudFeedEntriesManager *)self _dateForAsset:v11];
    uint64_t v28 = (void *)v13;
    uint64_t v29 = v12;
    LODWORD(v13) = [v12 isEqual:v13];
    int v16 = [v6 cloudHasSameOwnerAsAsset:v9];
    __int16 v27 = (void *)v15;
    uint64_t v17 = v15;
    int v18 = (void *)v10;
    [v14 timeIntervalSinceDate:v17];
    double v20 = v19;
    [v14 timeIntervalSinceDate:v10];
    LOBYTE(v10) = 0;
    if (v13 && v16 && v20 >= -3600.0 && v21 <= 3600.0)
    {
      if (([v6 userCloudSharedLiked] & 1) != 0 || !objc_msgSend(v8, "count"))
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v22 = v8;
        uint64_t v10 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10)
        {
          uint64_t v26 = v11;
          uint64_t v23 = *(void *)v31;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v31 != v23) {
                objc_enumerationMutation(v22);
              }
              if (!objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "userCloudSharedLiked", v26))
              {
                LOBYTE(v10) = 1;
                goto LABEL_23;
              }
            }
            uint64_t v10 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
            if (v10) {
              continue;
            }
            break;
          }
LABEL_23:
          uint64_t v11 = v26;
        }
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_shouldIgnoreInvitationRecord:(id)a3
{
  v3 = [a3 album];
  char v4 = [v3 isOwnedCloudSharedAlbum];

  return v4 ^ 1;
}

- (BOOL)_shouldIgnoreComment:(id)a3
{
  id v4 = a3;
  if ([(PLCloudFeedEntriesManager *)self _commentIsBatchCaption:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v4 isMyComment];
    char v7 = [v6 BOOLValue];

    id v8 = [v4 asset];
    char v9 = [v8 cloudIsMyAsset];
    char v10 = [v4 isLikeBoolValue];
    BOOL v5 = 0;
    if ((v7 & 1) == 0 && (v9 & 1) == 0) {
      BOOL v5 = (v10 & 1) != 0 || ([v8 cloudHasCommentsConversation] & 1) == 0;
    }
  }
  return v5;
}

- (BOOL)_shouldIgnoreAsset:(id)a3
{
  return [a3 isDeleted];
}

- (BOOL)_commentIsBatchCaption:(id)a3
{
  id v3 = a3;
  id v4 = [v3 isBatchComment];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    char v7 = [v3 isCaption];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      char v9 = [v3 commentClientDate];
      char v10 = [v3 asset];
      uint64_t v11 = [v10 cloudBatchPublishDate];

      [v9 timeIntervalSinceDate:v11];
      BOOL v6 = fabs(v12) < 10.0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_wasCommentPublishedBeforeSubscription:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commentDate];
  BOOL v6 = [v4 asset];

  char v7 = [v6 cloudShareAlbum];

  int v8 = [(PLCloudFeedEntriesManager *)self _subscriptionDateForSharedAlbum:v7];
  if (v8) {
    BOOL v9 = [v5 compare:v8] == -1;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_wasAssetPublishedBeforeSubscription:(id)a3
{
  id v4 = a3;
  if ([v4 cloudIsMyAsset])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v6 = [v4 cloudBatchPublishDate];
    char v7 = [v4 cloudShareAlbum];
    int v8 = [(PLCloudFeedEntriesManager *)self _subscriptionDateForSharedAlbum:v7];
    if (v8) {
      BOOL v5 = [v6 compare:v8] == -1;
    }
    else {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (id)_subscriptionDateForSharedAlbum:(id)a3
{
  return (id)[a3 cloudSubscriptionDate];
}

- (id)_dateForAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 cloudServerPublishDate];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 cloudBatchPublishDate];
  }
  char v7 = v6;

  return v7;
}

- (void)_noteContentDeletionAffectingCommentsEntry:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 965, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];
  }
  id v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    char v7 = NSStringFromSelector(a2);
    int v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    __int16 v27 = v7;
    __int16 v28 = 2112;
    uint64_t v29 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);
  }
  BOOL v9 = [v5 entryLikeComments];
  char v10 = [v5 entryComments];
  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    uint64_t v11 = [v9 lastObject];
    double v12 = [v11 commentDate];

    uint64_t v13 = [v10 lastObject];
    uint64_t v14 = [v13 commentDate];

    if (v12)
    {
      id v15 = [v12 laterDate:v14];
    }
    else
    {
      id v15 = v14;
    }
    int v16 = v15;
    uint64_t v17 = [v5 entryDate];
    if (v16 && [v16 compare:v17] == -1)
    {
      [v5 setEntryDate:v16];
      int v18 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        double v19 = [v5 objectID];
        *(_DWORD *)buf = 138412546;
        __int16 v27 = v16;
        __int16 v28 = 2112;
        uint64_t v29 = v19;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "set date %@ for %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v23 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      id v24 = [v5 objectID];
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v24;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);
    }
    double v12 = [v5 managedObjectContext];
    [v12 deleteObject:v5];
  }

  double v20 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    double v21 = NSStringFromSelector(a2);
    id v22 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    __int16 v27 = v21;
    __int16 v28 = 2112;
    uint64_t v29 = v22;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
  }
}

- (void)_noteContentDeletionAffectingAssetsEntry:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 934, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];
  }
  id v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = NSStringFromSelector(a2);
    int v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    __int16 v25 = v7;
    __int16 v26 = 2112;
    __int16 v27 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "will %@ %@", buf, 0x16u);
  }
  BOOL v9 = [v5 entryAssets];
  char v10 = [v5 entryDate];
  uint64_t v11 = (void *)[v10 copy];

  if ([v9 count])
  {
    double v12 = [v9 lastObject];
    uint64_t v13 = [(PLCloudFeedEntriesManager *)self _dateForAsset:v12];
    uint64_t v14 = v13;
    if (v13 && [v13 compare:v11] == -1)
    {
      [(PLCloudFeedEntriesManager *)self _splitEntriesAtDate:v14];
      [v5 setEntryDate:v14];
      id v15 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v16 = [v5 objectID];
        *(_DWORD *)buf = 138412546;
        __int16 v25 = v14;
        __int16 v26 = 2112;
        __int16 v27 = v16;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "set date %@ for %@", buf, 0x16u);
      }
      [(PLCloudFeedEntriesManager *)self _mergeEntriesAroundDate:v11];
    }
  }
  else
  {
    uint64_t v17 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v18 = [v5 objectID];
      *(_DWORD *)buf = 138412290;
      __int16 v25 = v18;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);
    }
    double v19 = [v5 managedObjectContext];
    [v19 deleteObject:v5];

    [(PLCloudFeedEntriesManager *)self _mergeEntriesAroundDate:v11];
  }
  double v20 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    double v21 = NSStringFromSelector(a2);
    id v22 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    __int16 v25 = v21;
    __int16 v26 = 2112;
    __int16 v27 = v22;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
  }
}

- (void)_noteDidUpdateInvitationRecord:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 874, @"Invalid parameter not satisfying: %@", @"invitationRecord" object file lineNumber description];
  }
  id v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    char v7 = NSStringFromSelector(a2);
    int v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = v7;
    __int16 v31 = 2112;
    long long v32 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);
  }
  if (![(PLCloudFeedEntriesManager *)self _shouldIgnoreInvitationRecord:v5])
  {
    char v10 = [(PLCloudFeedEntriesManager *)self library];
    BOOL v9 = [v10 managedObjectContext];

    uint64_t v11 = [v5 invitationState];
    int v12 = [v11 intValue];

    uint64_t v13 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "invitationState=%li", buf, 0xCu);
    }

    uint64_t v14 = [v5 cloudGUID];
    if (!v14)
    {
      id v15 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v5;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "no GUID for invitation record %@", buf, 0xCu);
      }
      goto LABEL_35;
    }
    id v15 = [v5 album];
    int v16 = [v15 cloudGUID];
    if (!v16)
    {
      uint64_t v17 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v30 = v15;
        __int16 v31 = 2112;
        long long v32 = v5;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "no GUID for album %@ of invitation record %@", buf, 0x16u);
      }
      goto LABEL_34;
    }
    uint64_t v17 = [(PLCloudFeedEntriesManager *)self _invitationAcceptedEntryForInvitationRecord:v5];
    int v18 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      double v19 = [v17 objectID];
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "invitationAcceptedEntry=%@", buf, 0xCu);
    }
    if (v12 == 2)
    {
      if (!v17)
      {
        uint64_t v17 = [v5 inviteeSubscriptionDate];
        if (v17)
        {
          double v20 = +[PLCloudFeedEntry entityName];
          double v21 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v20, (uint64_t)v9, 0);

          if (!v21)
          {
LABEL_34:

LABEL_35:
            goto LABEL_36;
          }
          [v21 setEntryTypeNumber:&unk_1EEBF0D10];
          [v21 setEntryPriorityNumber:&unk_1EEBF0CB0];
          [v21 setEntryDate:v17];
          [v21 setEntryAlbumGUID:v16];
          [v21 setEntryInvitationRecordGUID:v14];
          id v22 = PLCloudFeedGetLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v21;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
          }
        }
        else
        {
          double v21 = 0;
        }

        uint64_t v17 = v21;
      }
    }
    else if (v17)
    {
      uint64_t v23 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        id v24 = [v17 objectID];
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v24;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);
      }
      [v9 deleteObject:v17];
    }
    __int16 v25 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      __int16 v26 = NSStringFromSelector(a2);
      __int16 v27 = [v5 objectID];
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v26;
      __int16 v31 = 2112;
      long long v32 = v27;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
    }
    goto LABEL_34;
  }
  BOOL v9 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "ignoring", buf, 2u);
  }
LABEL_36:
}

- (void)_noteDidReceiveSharedComment:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v69 = v5;
  if (!v5)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 725, @"Invalid parameter not satisfying: %@", @"comment" object file lineNumber description];
  }
  id v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    char v7 = NSStringFromSelector(a2);
    int v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);
  }
  if (![(PLCloudFeedEntriesManager *)self _shouldIgnoreComment:v69])
  {
    if ([(PLCloudFeedEntriesManager *)self _wasCommentPublishedBeforeSubscription:v69])
    {
      BOOL v9 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "comment published before subscription", buf, 2u);
      }
      goto LABEL_8;
    }
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    char v68 = 0;
    char v10 = [v69 commentDate];
    if (!v10)
    {
      uint64_t v11 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v69;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "no date for comment %@", buf, 0xCu);
      }
      goto LABEL_59;
    }
    [(PLCloudFeedEntriesManager *)self _splitEntriesAtDate:v10];
    id v63 = 0;
    id v64 = 0;
    [(PLCloudFeedEntriesManager *)self _getEarliestDate:&v64 latestDate:&v63 forRangeOfContiguousCommentsEntriesAroundDate:v10];
    uint64_t v11 = v64;
    id v12 = v63;
    long long v48 = [v69 asset];
    __int16 v51 = [v48 cloudAssetGUID];
    uint64_t v13 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [v48 objectID];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v71 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "dateRangeBegin=%@ dateRangeEnd=%@ asset=%@", buf, 0x20u);
    }
    if (!v51)
    {
      uint64_t v34 = PLCloudFeedGetLog();
      uint64_t v50 = v34;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v69;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "no GUID for asset %@ of comment %@", buf, 0x16u);
      }
      goto LABEL_58;
    }
    id v15 = [(PLCloudFeedEntriesManager *)self library];
    uint64_t v50 = [v15 managedObjectContext];

    id v49 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    int v16 = +[PLManagedObject entityInManagedObjectContext:v50];
    [v49 setEntity:v16];

    uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entryDate > %@) AND (entryDate < %@) AND (entryCloudAssetGUID == %@)", v11, v12, v51];
    [v49 setPredicate:v17];

    uint64_t v18 = +[PLCloudFeedEntry entriesSortDescriptorsAscending:1];
    [v49 setSortDescriptors:v18];
    long long v45 = (void *)v18;
    id v62 = 0;
    double v19 = [v50 executeFetchRequest:v49 error:&v62];
    id v46 = v62;
    if (!v19)
    {
      double v20 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v46;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "error fetching comments entry in date range %@", buf, 0xCu);
      }

      double v19 = 0;
    }
    long long v47 = v19;
    uint64_t v21 = [v19 count];
    if (v21 >= 1)
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      int v24 = [v69 isLikeBoolValue];
      char v25 = v24;
      if (v24) {
        __int16 v26 = v22;
      }
      else {
        __int16 v26 = v23;
      }
      [v26 addObject:v69];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v71 = __Block_byref_object_copy__114891;
      v72 = __Block_byref_object_dispose__114892;
      id v73 = 0;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __58__PLCloudFeedEntriesManager__noteDidReceiveSharedComment___block_invoke;
      v52[3] = &unk_1E58758D0;
      char v61 = v25;
      id v27 = v22;
      id v53 = v27;
      uint64_t v58 = buf;
      id v54 = v69;
      id v28 = v23;
      id v55 = v28;
      uint64_t v60 = v21;
      id v56 = v51;
      v57 = self;
      v59 = &v65;
      [v47 enumerateObjectsUsingBlock:v52];

      _Block_object_dispose(buf, 8);
    }
    if (!*((unsigned char *)v66 + 24) && [v69 isLikeBoolValue])
    {
      uint64_t v29 = [(PLCloudFeedEntriesManager *)self _firstEntryOnOrBeforeDate:v10];
      uint64_t v30 = [(PLCloudFeedEntriesManager *)self _firstEntryAfterDate:v10];
      if ([(PLCloudFeedEntriesManager *)self _tryMergingComment:v69 withEntry:v29]
        || [(PLCloudFeedEntriesManager *)self _tryMergingComment:v69 withEntry:v30])
      {
        *((unsigned char *)v66 + 24) = 1;
      }
    }
    if (!*((unsigned char *)v66 + 24))
    {
      __int16 v31 = [v48 cloudShareAlbum];
      long long v32 = [v31 cloudGUID];
      if (!v32)
      {
        uint64_t v35 = PLCloudFeedGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v31;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v69;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "no GUID for album %@ of comment %@", buf, 0x16u);
        }

        goto LABEL_57;
      }
      if ([v69 isLikeBoolValue])
      {
        v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithObjects:&v69 count:1];
        uint64_t v33 = 0;
      }
      else
      {
        uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithObjects:&v69 count:1];
        v44 = 0;
      }
      v36 = +[PLCloudFeedCommentsEntry entityName];
      uint64_t v37 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v36, (uint64_t)v50, 0);

      [v37 setEntryTypeNumber:&unk_1EEBF0CF8];
      [v37 setEntryPriorityNumber:&unk_1EEBF0CB0];
      [v37 setEntryDate:v10];
      [v37 setEntryCloudAssetGUID:v51];
      [v37 setEntryAlbumGUID:v32];
      __int16 v38 = v44;
      if (!v44)
      {
        __int16 v38 = [MEMORY[0x1E4F1CAA0] orderedSet];
      }
      [v37 setEntryLikeComments:v38];
      if (!v44) {

      }
      uint64_t v39 = v33;
      if (!v33)
      {
        uint64_t v39 = [MEMORY[0x1E4F1CAA0] orderedSet];
      }
      [v37 setEntryComments:v39];
      if (!v33) {

      }
      uint64_t v40 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v37;
        _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
      }
    }
    __int16 v31 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = [v69 objectID];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v42;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
    }
LABEL_57:

LABEL_58:
LABEL_59:

    _Block_object_dispose(&v65, 8);
    goto LABEL_60;
  }
  BOOL v9 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v69;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "ignoring %@", buf, 0xCu);
  }
LABEL_8:

LABEL_60:
}

void __58__PLCloudFeedEntriesManager__noteDidReceiveSharedComment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  char v7 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [v6 objectID];
    int v29 = 138412290;
    uint64_t v30 = v8;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "found entry %@", (uint8_t *)&v29, 0xCu);
  }
  BOOL v9 = [v6 entryLikeComments];
  if ([v9 count] && *(unsigned char *)(a1 + 96))
  {
    char v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v9 array];
    [v10 addObjectsFromArray:v11];

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
  }
  id v12 = [v6 entryComments];
  if ([v12 count])
  {
    if (!*(unsigned char *)(a1 + 96))
    {
      int v13 = [v6 entryIsMine];
      uint64_t v14 = [*(id *)(a1 + 40) isMyComment];
      int v15 = [v14 BOOLValue];

      if (v13 == v15)
      {
        int v16 = *(void **)(a1 + 48);
        uint64_t v17 = [v12 array];
        [v16 addObjectsFromArray:v17];

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
      }
    }
  }
  id v18 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (*(void *)(a1 + 88) - 1 != a3 && v18 == v6)
  {
    double v19 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = *(void **)(a1 + 56);
      int v29 = 138412290;
      uint64_t v30 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "found multiple entries for assetGUID: %@. Should only try to merge to the last one", (uint8_t *)&v29, 0xCu);
    }
LABEL_21:

    goto LABEL_22;
  }
  if (v18)
  {
    double v19 = [*(id *)(a1 + 64) _commentSortingComparator];
    [*(id *)(a1 + 32) sortUsingComparator:v19];
    [*(id *)(a1 + 48) sortUsingComparator:v19];
    uint64_t v21 = [*(id *)(a1 + 32) lastObject];
    id v22 = [v21 commentDate];

    id v23 = [*(id *)(a1 + 48) lastObject];
    int v24 = [v23 commentDate];

    if (v22)
    {
      id v25 = [v22 laterDate:v24];
    }
    else
    {
      id v25 = v24;
    }
    __int16 v26 = v25;
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setEntryDate:v25];
    id v27 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectID];
      int v29 = 138412546;
      uint64_t v30 = v26;
      __int16 v31 = 2112;
      long long v32 = v28;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "set date %@ for %@ and merged to last found entry", (uint8_t *)&v29, 0x16u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setEntryLikeComments:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setEntryComments:*(void *)(a1 + 48)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;

    goto LABEL_21;
  }
LABEL_22:
}

- (void)_noteDidReceiveSharedComments:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        char v10 = (void *)MEMORY[0x19F38D3B0](v5);
        -[PLCloudFeedEntriesManager _noteDidReceiveSharedComment:](self, "_noteDidReceiveSharedComment:", v9, (void)v11);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }
}

- (void)_noteDidReceiveSharedAssetPublishedBeforeSubscription:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 objectID];
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v9 = [v5 cloudShareAlbum];
  char v10 = [(PLCloudFeedEntriesManager *)self _subscriptionEntryForSharedAlbum:v9];
  if (v10)
  {
    [(PLCloudFeedEntriesManager *)self _addAsset:v5 toEntry:v10];
    long long v11 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      long long v12 = NSStringFromSelector(a2);
      long long v13 = [v5 objectID];
      int v14 = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "did %@ %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    long long v11 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "asset received with no subscription entry %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_noteDidReceiveSharedAsset:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 616, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    long long v48 = v7;
    __int16 v49 = 2112;
    uint64_t v50 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);
  }
  uint64_t v9 = [(PLCloudFeedEntriesManager *)self _dateForAsset:v5];
  char v10 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v48 = v9;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "assetDate=%@", buf, 0xCu);
  }

  if (!v9)
  {
    long long v11 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v48 = v5;
      long long v12 = "no date for asset %@";
      long long v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 12;
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  if ([(PLCloudFeedEntriesManager *)self _shouldIgnoreAsset:v5])
  {
    long long v11 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      long long v12 = "ignoring";
      long long v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
      uint32_t v15 = 2;
LABEL_13:
      _os_log_impl(&dword_19B3C7000, v13, v14, v12, buf, v15);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ([(PLCloudFeedEntriesManager *)self _wasAssetPublishedBeforeSubscription:v5])
  {
    __int16 v16 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v48 = v5;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "_wasAssetPublishedBeforeSubscription %@", buf, 0xCu);
    }

    [(PLCloudFeedEntriesManager *)self _noteDidReceiveSharedAssetPublishedBeforeSubscription:v5];
  }
  else
  {
    uint64_t v17 = [(PLCloudFeedEntriesManager *)self _firstEntryOnOrBeforeDate:v9];
    uint64_t v18 = [(PLCloudFeedEntriesManager *)self _firstEntryAfterDate:v9];
    BOOL v19 = [(PLCloudFeedEntriesManager *)self _shouldMergeAsset:v5 intoEntry:v17];
    BOOL v20 = [(PLCloudFeedEntriesManager *)self _shouldMergeAsset:v5 intoEntry:v18];
    uint64_t v21 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      [v17 objectID];
      long long v45 = a2;
      id v22 = v17;
      int v24 = v23 = v18;
      id v25 = [v23 objectID];
      *(_DWORD *)buf = 138413058;
      long long v48 = v24;
      __int16 v49 = 2112;
      uint64_t v50 = v25;
      __int16 v51 = 1024;
      BOOL v52 = v19;
      __int16 v53 = 1024;
      BOOL v54 = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "entryBefore=%@ entryAfter=%@ shouldMergeWithEntryBefore=%i shouldMergeWithEntryAfter=%i", buf, 0x22u);

      uint64_t v18 = v23;
      uint64_t v17 = v22;
      a2 = v45;
    }

    if (v19)
    {
      [(PLCloudFeedEntriesManager *)self _addAsset:v5 toEntry:v17];
      __int16 v26 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        id v27 = [v17 objectID];
        *(_DWORD *)buf = 138412546;
        long long v48 = v9;
        __int16 v49 = 2112;
        uint64_t v50 = v27;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "set date %@ for %@", buf, 0x16u);
      }
      [v17 setEntryDate:v9];
      if (v20) {
        [(PLCloudFeedEntriesManager *)self _mergeOlderEntry:v17 intoMoreRecentEntry:v18];
      }
    }
    else if (v20)
    {
      [(PLCloudFeedEntriesManager *)self _addAsset:v5 toEntry:v18];
    }
    else
    {
      v44 = v18;
      id v46 = v17;
      [(PLCloudFeedEntriesManager *)self _splitEntriesAtDate:v9];
      id v28 = [(PLCloudFeedEntriesManager *)self library];
      int v29 = [v28 managedObjectContext];

      uint64_t v30 = [v5 cloudShareAlbum];
      __int16 v31 = [v30 cloudGUID];
      if (v31)
      {
        long long v32 = +[PLCloudFeedAssetsEntry entityName];
        uint64_t v33 = v29;
        uint64_t v34 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v32, (uint64_t)v29, 0);

        [v34 setEntryTypeNumber:&unk_1EEBF0CE0];
        [v34 setEntryPriorityNumber:&unk_1EEBF0CB0];
        [v34 setEntryDate:v9];
        uint64_t v35 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v5];
        [v34 setEntryAssets:v35];

        [v34 setEntryAlbumGUID:v31];
        v36 = PLCloudFeedGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v48 = v34;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
        }

        if (v34)
        {
          int v29 = v33;
          if ([v5 cloudIsMyAsset]
            && [v30 isOwnedCloudSharedAlbum])
          {
            uint64_t v37 = [(PLCloudFeedEntriesManager *)self _albumCreatedEntryForSharedAlbum:v30];
            if (v37)
            {
              __int16 v38 = PLCloudFeedGetLog();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v39 = [v37 objectID];
                *(_DWORD *)buf = 138412290;
                long long v48 = v39;
                _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);
              }
              [v29 deleteObject:v37];
            }
          }
        }
        else
        {
          int v29 = v33;
        }
      }
      else
      {
        uint64_t v34 = PLCloudFeedGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          long long v48 = v30;
          __int16 v49 = 2112;
          uint64_t v50 = v5;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "no GUID for album %@ of asset %@", buf, 0x16u);
        }
      }

      uint64_t v18 = v44;
      uint64_t v17 = v46;
    }
    uint64_t v40 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      id v41 = NSStringFromSelector(a2);
      v42 = [v5 objectID];
      *(_DWORD *)buf = 138412546;
      long long v48 = v41;
      __int16 v49 = 2112;
      uint64_t v50 = v42;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
    }
  }
LABEL_15:
}

- (void)_noteContentDeletionAffectingAlbumCreatedEntry:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 600, @"Invalid parameter not satisfying: %@", @"albumCreatedEntry" object file lineNumber description];
  }
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    uint32_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", buf, 0x16u);
  }
  uint64_t v9 = [(PLCloudFeedEntriesManager *)self library];
  char v10 = [v9 managedObjectContext];

  long long v11 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [v5 objectID];
    *(_DWORD *)buf = 138412290;
    uint32_t v15 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "delete album entry: %@", buf, 0xCu);
  }
  [v10 deleteObject:v5];
}

- (void)_noteContentDeletionAffectingInvitationResponseEntry:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 586, @"Invalid parameter not satisfying: %@", @"invitationSentEntry" object file lineNumber description];
  }
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    BOOL v20 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);
  }
  uint64_t v9 = [(PLCloudFeedEntriesManager *)self library];
  char v10 = [v9 managedObjectContext];

  long long v11 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [v5 objectID];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "delete invitation response entry: %@", buf, 0xCu);
  }
  [v10 deleteObject:v5];
  long long v13 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    os_log_type_t v14 = NSStringFromSelector(a2);
    uint32_t v15 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    BOOL v20 = v15;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
  }
}

- (void)_noteContentDeletionAffectingSubscriptionEntry:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 567, @"Invalid parameter not satisfying: %@", @"subscriptionEntry" object file lineNumber description];
  }
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);
  }
  uint64_t v9 = [v5 entryAlbumGUID];
  char v10 = [(PLCloudFeedEntriesManager *)self library];
  long long v11 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v9 inLibrary:v10];
  long long v12 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v13 = [v11 objectID];
    int v14 = [v11 isDeleted];
    *(_DWORD *)buf = 138412546;
    id v23 = v13;
    __int16 v24 = 1024;
    LODWORD(v25) = v14;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "album=%@ isDeleted=%i", buf, 0x12u);
  }
  if (!v11 || [v11 isDeleted])
  {
    uint32_t v15 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [v5 objectID];
      *(_DWORD *)buf = 138412290;
      id v23 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "delete subscription entry: %@", buf, 0xCu);
    }
    uint64_t v17 = [v10 managedObjectContext];
    [v17 deleteObject:v5];
  }
  uint64_t v18 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    __int16 v19 = NSStringFromSelector(a2);
    BOOL v20 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    id v23 = v19;
    __int16 v24 = 2112;
    id v25 = v20;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
  }
}

- (void)_noteContentDeletionAffectingInvitationEntry:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 552, @"Invalid parameter not satisfying: %@", @"invitationReceivedEntry" object file lineNumber description];
  }
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    BOOL v20 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);
  }
  uint64_t v9 = [(PLCloudFeedEntriesManager *)self library];
  char v10 = [v9 managedObjectContext];

  long long v11 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [v5 objectID];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "delete invitation received entry: %@", buf, 0xCu);
  }
  [v10 deleteObject:v5];
  long long v13 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = NSStringFromSelector(a2);
    uint32_t v15 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    BOOL v20 = v15;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
  }
}

- (void)_noteDidUpdateSharedAlbum:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 425, @"Invalid parameter not satisfying: %@", @"sharedAlbum" object file lineNumber description];
  }
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    id v45 = v7;
    __int16 v46 = 2112;
    long long v47 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);
  }
  uint64_t v9 = [(PLCloudFeedEntriesManager *)self library];
  char v10 = [v9 managedObjectContext];

  int v11 = [v5 cloudRelationshipStateLocalValue];
  long long v12 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v45 = (id)v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "relationshipState=%li", buf, 0xCu);
  }

  long long v13 = [(PLCloudFeedEntriesManager *)self _invitationReceivedEntryForSharedAlbum:v5];
  int v14 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v13;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "invitationReceivedEntry=%@", buf, 0xCu);
  }

  if (v11 != 1)
  {
    if (v13)
    {
      BOOL v20 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = [v13 objectID];
        *(_DWORD *)buf = 138412290;
        id v45 = v21;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);
      }
      [v10 deleteObject:v13];
    }
LABEL_27:
    __int16 v16 = [(PLCloudFeedEntriesManager *)self _subscriptionEntryForSharedAlbum:v5];
    id v23 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v16;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "subscriptionEntry=%@", buf, 0xCu);
    }

    if (v11 == 2)
    {
      if (v16)
      {
        __int16 v24 = [v16 entryDate];
        [v16 setEntryDate:v24];

        id v25 = PLCloudFeedGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = [v16 objectID];
          *(_DWORD *)buf = 138412290;
          id v45 = v26;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "touched %@", buf, 0xCu);
        }
      }
      else
      {
        __int16 v16 = [(PLCloudFeedEntriesManager *)self _subscriptionDateForSharedAlbum:v5];
        if (v16)
        {
          int v29 = [v5 cloudGUID];
          if (v29)
          {
            uint64_t v30 = +[PLCloudFeedAssetsEntry entityName];
            __int16 v31 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v30, (uint64_t)v10, 0);

            if (!v31) {
              goto LABEL_72;
            }
            [v31 setEntryTypeNumber:&unk_1EEBF0C98];
            [v31 setEntryPriorityNumber:&unk_1EEBF0CB0];
            [v31 setEntryDate:v16];
            [v31 setEntryAlbumGUID:v29];
            long long v32 = [MEMORY[0x1E4F1CAA0] orderedSet];
            [v31 setEntryAssets:v32];

            uint64_t v33 = PLCloudFeedGetLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v45 = v13;
              _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v33 = PLCloudFeedGetLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v45 = v5;
              _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "no GUID for album %@", buf, 0xCu);
            }
            __int16 v31 = 0;
          }
        }
        else
        {
          __int16 v31 = 0;
        }

        __int16 v16 = v31;
      }
    }
    else if (v16)
    {
      id v27 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        id v28 = [v16 objectID];
        *(_DWORD *)buf = 138412290;
        id v45 = v28;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);
      }
      [v10 deleteObject:v16];
    }
    if (![v5 isOwnedCloudSharedAlbum]) {
      goto LABEL_70;
    }
    uint64_t v34 = [(PLCloudFeedEntriesManager *)self _albumCreatedEntryForSharedAlbum:v5];
    int v35 = [v5 isEmpty] ^ 1;
    if ((v35 & 1) != 0 || v34)
    {
      if (!v34) {
        int v35 = 0;
      }
      if (v35 == 1)
      {
        uint64_t v39 = PLCloudFeedGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = [v16 objectID];
          *(_DWORD *)buf = 138412290;
          id v45 = v40;
          _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "delete album created entry: %@", buf, 0xCu);
        }
        [v10 deleteObject:v34];
      }
      goto LABEL_69;
    }
    int v29 = [v5 cloudCreationDate];
    if (!v29)
    {
      int v29 = [v5 cloudLastInterestingChangeDate];
      if (!v29)
      {
        int v29 = PLCloudFeedGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v5;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "ignoring album with no creation date %@", buf, 0xCu);
        }
        uint64_t v34 = 0;
        goto LABEL_68;
      }
    }
    v36 = [v5 cloudGUID];
    if (!v36)
    {
      __int16 v38 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v5;
        _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "no GUID for album %@", buf, 0xCu);
      }
      uint64_t v34 = 0;
      goto LABEL_67;
    }
    uint64_t v37 = +[PLCloudFeedEntry entityName];
    uint64_t v34 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v37, (uint64_t)v10, 0);

    if (v34)
    {
      [v34 setEntryTypeNumber:&unk_1EEBF0CC8];
      [v34 setEntryPriorityNumber:&unk_1EEBF0CB0];
      [v34 setEntryDate:v29];
      [v34 setEntryAlbumGUID:v36];
      __int16 v38 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v13;
        _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
      }
LABEL_67:

LABEL_68:
LABEL_69:

LABEL_70:
      int v29 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        id v41 = NSStringFromSelector(a2);
        v42 = [v5 objectID];
        *(_DWORD *)buf = 138412546;
        id v45 = v41;
        __int16 v46 = 2112;
        long long v47 = v42;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);
      }
      goto LABEL_72;
    }

LABEL_72:
    goto LABEL_73;
  }
  if (v13) {
    goto LABEL_27;
  }
  long long v13 = [v5 cloudLastInterestingChangeDate];
  uint64_t v15 = [v5 cloudGUID];
  __int16 v16 = (void *)v15;
  if (v13)
  {
    if (v15) {
      goto LABEL_13;
    }
LABEL_23:
    __int16 v19 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v5;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "no GUID for album %@", buf, 0xCu);
    }
    uint64_t v18 = 0;
    goto LABEL_26;
  }
  id v22 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v5;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "couldn't find invitation date for %@, using current date instead", buf, 0xCu);
  }

  long long v13 = [MEMORY[0x1E4F1C9C8] date];
  if (!v16) {
    goto LABEL_23;
  }
LABEL_13:
  uint64_t v17 = +[PLCloudFeedEntry entityName];
  uint64_t v18 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v17, (uint64_t)v10, 0);

  if (v18)
  {
    [v18 setEntryTypeNumber:&unk_1EEBF0C68];
    [v18 setEntryPriorityNumber:&unk_1EEBF0C80];
    [v18 setEntryDate:v13];
    [v18 setEntryAlbumGUID:v16];
    __int16 v19 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v18;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
    }
LABEL_26:

    long long v13 = v18;
    goto LABEL_27;
  }
LABEL_73:
}

- (void)rebuildAllEntries:(id)a3
{
  id v4 = a3;
  id v5 = [(PLCloudFeedEntriesManager *)self library];
  uint64_t v6 = [v5 managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v6;
  char v10 = self;
  id v7 = v6;
  [v5 performTransaction:v8 completionHandler:v4 withPriority:1];
}

void __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  id v3 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "start rebuilding entries", buf, 2u);
  }

  id v4 = (void *)MEMORY[0x1E4F1C0D0];
  id v5 = +[PLCloudFeedEntry entityName];
  uint64_t v6 = [v4 fetchRequestWithEntityName:v5];

  [v6 setFetchBatchSize:100];
  id v7 = [*(id *)(a1 + 32) executeFetchRequest:v6 error:0];
  uint64_t v8 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 count];
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v46 = v9;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "deleting %li entries", buf, 0xCu);
  }

  char v10 = *(void **)(a1 + 32);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_76;
  v43[3] = &unk_1E58758A8;
  id v44 = v10;
  uint64_t v11 = [v44 enumerateWithIncrementalSaveUsingObjects:v7 shouldRefreshAfterSave:1 withBlock:v43];
  if (v11)
  {
    long long v12 = (void *)v11;
    long long v13 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v46 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "failed to delete feed entries with error: %@", buf, 0xCu);
    }

    goto LABEL_21;
  }

  int v14 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v15 = +[PLCloudSharedAlbum entityName];
  uint64_t v6 = [v14 fetchRequestWithEntityName:v15];

  [v6 setFetchBatchSize:100];
  id v7 = [*(id *)(a1 + 32) executeFetchRequest:v6 error:0];
  __int16 v16 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v7 count];
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v46 = v17;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "rebuilding from %li shared albums", buf, 0xCu);
  }

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_78;
  v42[3] = &unk_1E58758A8;
  uint64_t v18 = *(void **)(a1 + 32);
  v42[4] = *(void *)(a1 + 40);
  uint64_t v19 = [v18 enumerateWithIncrementalSaveUsingObjects:v7 shouldRefreshAfterSave:1 withBlock:v42];
  if (v19)
  {
    BOOL v20 = (void *)v19;
    uint64_t v21 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v46 = v20;
      id v22 = "failed to rebuild albums with error: %@";
LABEL_19:
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
      goto LABEL_20;
    }
    goto LABEL_20;
  }

  id v23 = (void *)MEMORY[0x1E4F1C0D0];
  __int16 v24 = +[PLManagedAsset entityName];
  uint64_t v6 = [v23 fetchRequestWithEntityName:v24];

  id v25 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCloudSharedAsset"), 1);
  [v6 setPredicate:v25];

  [v6 setFetchBatchSize:100];
  id v7 = [*(id *)(a1 + 32) executeFetchRequest:v6 error:0];
  uint64_t v26 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [v7 count];
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v46 = v27;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "rebuilding from %li shared assets", buf, 0xCu);
  }

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_80;
  v41[3] = &unk_1E58758A8;
  id v28 = *(void **)(a1 + 32);
  v41[4] = *(void *)(a1 + 40);
  uint64_t v29 = [v28 enumerateWithIncrementalSaveUsingObjects:v7 shouldRefreshAfterSave:1 withBlock:v41];
  if (v29)
  {
    BOOL v20 = (void *)v29;
    uint64_t v21 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v46 = v20;
      id v22 = "failed to rebuild assets with error: %@";
      goto LABEL_19;
    }
LABEL_20:

LABEL_21:
    int v30 = 0;
    goto LABEL_22;
  }

  uint64_t v33 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v34 = +[PLCloudSharedAlbumInvitationRecord entityName];
  uint64_t v6 = [v33 fetchRequestWithEntityName:v34];

  [v6 setFetchBatchSize:100];
  id v7 = [*(id *)(a1 + 32) executeFetchRequest:v6 error:0];
  int v35 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = [v7 count];
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v46 = v36;
    _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "rebuilding from %li invitations assets", buf, 0xCu);
  }

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_81;
  v40[3] = &unk_1E58758A8;
  uint64_t v37 = *(void **)(a1 + 32);
  v40[4] = *(void *)(a1 + 40);
  int v30 = 1;
  __int16 v38 = [v37 enumerateWithIncrementalSaveUsingObjects:v7 shouldRefreshAfterSave:1 withBlock:v40];
  if (v38)
  {
    uint64_t v39 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v46 = v38;
      _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "failed to rebuild invitations with error: %@", buf, 0xCu);
    }

    int v30 = 0;
  }

LABEL_22:
  __int16 v31 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v32 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)__int16 v46 = v30;
    *(_WORD *)&v46[4] = 2048;
    *(double *)&v46[6] = v32 - Current;
    _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "finished rebuilding entries (success=%i, time=%fs)", buf, 0x12u);
  }
}

uint64_t __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_76(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

uint64_t __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_78(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _noteDidUpdateSharedAlbum:a2];
}

void __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _noteDidReceiveSharedAsset:v4];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v4 likeComments];
  [v5 _noteDidReceiveSharedComments:v6];

  id v7 = *(void **)(a1 + 32);
  id v8 = [v4 cloudComments];

  [v7 _noteDidReceiveSharedComments:v8];
}

uint64_t __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_81(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _noteDidUpdateInvitationRecord:a2];
}

- (void)processAlbumUpdates:(id)a3 assetInserts:(id)a4 assetUpdates:(id)a5 commentInserts:(id)a6 invitationRecordUpdates:(id)a7 deletionEntries:(id)a8 completionHandler:(id)a9
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v21 = (void (**)(void))a9;
  id v22 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    id v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v54 = v23;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "will %@", buf, 0xCu);
  }
  __int16 v24 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v15;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEBUG, "albumUpdates=%@", buf, 0xCu);
  }

  id v25 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v16;
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "assetInserts=%@", buf, 0xCu);
  }

  uint64_t v26 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v17;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "assetUpdates=%@", buf, 0xCu);
  }

  uint64_t v27 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v18;
    _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "commentInserts=%@", buf, 0xCu);
  }

  id v28 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v19;
    _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "invitationRecordUpdates=%@", buf, 0xCu);
  }

  uint64_t v29 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v20;
    _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "deletionEntries=%@", buf, 0xCu);
  }

  if ([v15 count]
    || [v16 count]
    || [v17 count]
    || [v18 count]
    || [v19 count]
    || [v20 count])
  {
    int v30 = [(PLCloudFeedEntriesManager *)self library];
    __int16 v31 = [v30 managedObjectContext];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __148__PLCloudFeedEntriesManager_processAlbumUpdates_assetInserts_assetUpdates_commentInserts_invitationRecordUpdates_deletionEntries_completionHandler___block_invoke;
    v44[3] = &unk_1E5875880;
    id v45 = v15;
    id v46 = v31;
    uint64_t v47 = self;
    id v48 = v16;
    id v49 = v17;
    id v50 = v18;
    id v51 = v19;
    id v52 = v20;
    CFAbsoluteTime v32 = v31;
    [v30 performTransaction:v44 completionHandler:v21];
    uint64_t v33 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      SEL aSelectora = v32;
      id v34 = v15;
      id v35 = v16;
      id v36 = v20;
      id v37 = v17;
      id v38 = v19;
      id v39 = v18;
      v41 = uint64_t v40 = v21;
      *(_DWORD *)buf = 138412290;
      id v54 = v41;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEBUG, "did %@", buf, 0xCu);

      uint64_t v21 = v40;
      id v18 = v39;
      id v19 = v38;
      id v17 = v37;
      id v20 = v36;
      id v16 = v35;
      id v15 = v34;
      CFAbsoluteTime v32 = (char *)aSelectora;
    }
  }
  else if (v21)
  {
    v21[2](v21);
  }
}

void __148__PLCloudFeedEntriesManager_processAlbumUpdates_assetInserts_assetUpdates_commentInserts_invitationRecordUpdates_deletionEntries_completionHandler___block_invoke(id *a1)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if ([a1[4] count])
  {
    v2 = (void *)MEMORY[0x1E4F1C0D0];
    id v3 = +[PLCloudSharedAlbum entityName];
    id v4 = [v2 fetchRequestWithEntityName:v3];

    id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", a1[4]];
    [v4 setPredicate:v5];

    uint64_t v6 = [a1[5] executeFetchRequest:v4 error:0];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v72 objects:v82 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v73 != v9) {
            objc_enumerationMutation(v6);
          }
          [a1[6] _noteDidUpdateSharedAlbum:*(void *)(*((void *)&v72 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v72 objects:v82 count:16];
      }
      while (v8);
    }
  }
  if ([a1[7] count])
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1C0D0];
    long long v12 = +[PLManagedAsset entityName];
    long long v13 = [v11 fetchRequestWithEntityName:v12];

    int v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", a1[7]];
    [v13 setPredicate:v14];

    id v15 = [a1[5] executeFetchRequest:v13 error:0];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v68 objects:v81 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v69 != v18) {
            objc_enumerationMutation(v15);
          }
          [a1[6] _noteDidReceiveSharedAsset:*(void *)(*((void *)&v68 + 1) + 8 * j)];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v68 objects:v81 count:16];
      }
      while (v17);
    }
  }
  if ([a1[8] count])
  {
    id v20 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v21 = +[PLManagedAsset entityName];
    id v22 = [v20 fetchRequestWithEntityName:v21];

    id v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", a1[8]];
    [v22 setPredicate:v23];

    __int16 v24 = [a1[5] executeFetchRequest:v22 error:0];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v64 objects:v80 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v65 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v64 + 1) + 8 * k);
          int v30 = [v29 cloudFeedAssetsEntry];

          if (!v30) {
            [a1[6] _noteDidReceiveSharedAsset:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v64 objects:v80 count:16];
      }
      while (v26);
    }
  }
  if ([a1[9] count])
  {
    __int16 v31 = (void *)MEMORY[0x1E4F1C0D0];
    CFAbsoluteTime v32 = +[PLCloudSharedComment entityName];
    uint64_t v33 = [v31 fetchRequestWithEntityName:v32];

    id v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", a1[9]];
    [v33 setPredicate:v34];

    id v35 = [a1[5] executeFetchRequest:v33 error:0];
    [a1[6] _noteDidReceiveSharedComments:v35];
  }
  if ([a1[10] count])
  {
    id v36 = (void *)MEMORY[0x1E4F1C0D0];
    id v37 = +[PLCloudSharedAlbumInvitationRecord entityName];
    id v38 = [v36 fetchRequestWithEntityName:v37];

    id v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", a1[10]];
    [v38 setPredicate:v39];

    uint64_t v40 = [a1[5] executeFetchRequest:v38 error:0];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v79 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v61;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v61 != v43) {
            objc_enumerationMutation(v40);
          }
          [a1[6] _noteDidUpdateInvitationRecord:*(void *)(*((void *)&v60 + 1) + 8 * m)];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v60 objects:v79 count:16];
      }
      while (v42);
    }
  }
  if ([a1[11] count])
  {
    id v45 = (void *)MEMORY[0x1E4F1C0D0];
    id v46 = +[PLCloudFeedEntry entityName];
    uint64_t v47 = [v45 fetchRequestWithEntityName:v46];

    id v48 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", a1[11]];
    [v47 setPredicate:v48];

    id v49 = [a1[5] executeFetchRequest:v47 error:0];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v56 objects:v78 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v57;
      do
      {
        for (uint64_t n = 0; n != v51; ++n)
        {
          if (*(void *)v57 != v52) {
            objc_enumerationMutation(v49);
          }
          id v54 = *(void **)(*((void *)&v56 + 1) + 8 * n);
          switch([v54 entryType])
          {
            case 0:
              uint64_t v55 = PLCloudFeedGetLog();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v77 = v54;
                _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_ERROR, "invalid type for entry %@", buf, 0xCu);
              }

              break;
            case 1:
              [a1[6] _noteContentDeletionAffectingAssetsEntry:v54];
              break;
            case 2:
              [a1[6] _noteContentDeletionAffectingCommentsEntry:v54];
              break;
            case 3:
              [a1[6] _noteContentDeletionAffectingInvitationEntry:v54];
              break;
            case 4:
              [a1[6] _noteContentDeletionAffectingSubscriptionEntry:v54];
              break;
            case 5:
            case 6:
              [a1[6] _noteContentDeletionAffectingInvitationResponseEntry:v54];
              break;
            case 7:
              [a1[6] _noteContentDeletionAffectingAlbumCreatedEntry:v54];
              break;
            default:
              continue;
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v56 objects:v78 count:16];
      }
      while (v51);
    }
  }
}

- (id)_singleEntryOfType:(int64_t)a3 forInvitationRecord:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(PLCloudFeedEntriesManager *)self library];
  uint64_t v8 = [v7 managedObjectContext];

  uint64_t v9 = [v6 cloudGUID];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v11 = +[PLManagedObject entityInManagedObjectContext:v8];
  [v10 setEntity:v11];

  long long v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entryTypeNumber = %d) AND (entryInvitationRecordGUID = %@)", a3, v9];
  [v10 setPredicate:v12];

  [v10 setFetchLimit:2];
  id v19 = 0;
  long long v13 = [v8 executeFetchRequest:v10 error:&v19];
  id v14 = v19;
  if (!v13)
  {
    id v15 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v21 = a3;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "error fetching entry of type %li: %@", buf, 0x16u);
    }
  }
  if ((unint64_t)[v13 count] >= 2)
  {
    uint64_t v16 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v21 = a3;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "found multiple entres of type %li for invitation record: %@", buf, 0x16u);
    }
  }
  if ([v13 count])
  {
    uint64_t v17 = [v13 objectAtIndex:0];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)_invitationDeclinedEntryForInvitationRecord:(id)a3
{
  return [(PLCloudFeedEntriesManager *)self _singleEntryOfType:6 forInvitationRecord:a3];
}

- (id)_invitationAcceptedEntryForInvitationRecord:(id)a3
{
  return [(PLCloudFeedEntriesManager *)self _singleEntryOfType:5 forInvitationRecord:a3];
}

- (id)_singleEntryOfType:(int64_t)a3 forSharedAlbum:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(PLCloudFeedEntriesManager *)self library];
  uint64_t v8 = [v7 managedObjectContext];

  uint64_t v9 = [v6 cloudGUID];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v11 = +[PLManagedObject entityInManagedObjectContext:v8];
  [v10 setEntity:v11];

  long long v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entryTypeNumber = %d) AND (entryAlbumGUID = %@)", a3, v9];
  [v10 setPredicate:v12];

  [v10 setFetchLimit:2];
  id v19 = 0;
  long long v13 = [v8 executeFetchRequest:v10 error:&v19];
  id v14 = v19;
  if (!v13)
  {
    id v15 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v21 = a3;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "error fetching entry of type %li: %@", buf, 0x16u);
    }
  }
  if ((unint64_t)[v13 count] >= 2)
  {
    uint64_t v16 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v21 = a3;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "found multiple entres of type %li for album: %@", buf, 0x16u);
    }
  }
  if ([v13 count])
  {
    uint64_t v17 = [v13 objectAtIndex:0];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)_albumCreatedEntryForSharedAlbum:(id)a3
{
  return [(PLCloudFeedEntriesManager *)self _singleEntryOfType:7 forSharedAlbum:a3];
}

- (id)_subscriptionEntryForSharedAlbum:(id)a3
{
  id v5 = [(PLCloudFeedEntriesManager *)self _singleEntryOfType:4 forSharedAlbum:a3];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLCloudFeedEntriesManager.m", 155, @"wrong class for subscription entry %@", v5 object file lineNumber description];
    }
  }
  return v5;
}

- (id)_invitationReceivedEntryForSharedAlbum:(id)a3
{
  return [(PLCloudFeedEntriesManager *)self _singleEntryOfType:3 forSharedAlbum:a3];
}

- (void)_getEarliestDate:(id *)a3 latestDate:(id *)a4 forRangeOfContiguousCommentsEntriesAroundDate:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [(PLCloudFeedEntriesManager *)self library];
  id v10 = [v9 managedObjectContext];

  unint64_t v11 = 0x1E4F28000uLL;
  if (a3)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    long long v13 = +[PLManagedObject entityInManagedObjectContext:v10];
    [v12 setEntity:v13];

    id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entryDate <= %@) AND (entryPriorityNumber = %d) AND (entryTypeNumber != %d)", v8, 0, 2];
    [v12 setPredicate:v14];

    [v12 setFetchLimit:1];
    id v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:0];
    v35[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v12 setSortDescriptors:v16];

    id v31 = 0;
    uint64_t v17 = [v10 executeFetchRequest:v12 error:&v31];
    id v18 = v31;
    if (!v17)
    {
      id v19 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v18;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "error fetching earliest date %@", buf, 0xCu);
      }
    }
    if ([v17 count] == 1)
    {
      id v20 = [v17 objectAtIndex:0];
      *a3 = [v20 entryDate];

      unint64_t v11 = 0x1E4F28000;
    }
    else
    {
      *a3 = [MEMORY[0x1E4F1C9C8] distantPast];
    }

    if (a4) {
      goto LABEL_12;
    }
LABEL_9:
    id v21 = v18;
    goto LABEL_20;
  }
  id v18 = 0;
  if (!a4) {
    goto LABEL_9;
  }
LABEL_12:
  id v22 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v23 = +[PLManagedObject entityInManagedObjectContext:v10];
  [v22 setEntity:v23];

  uint64_t v24 = [*(id *)(v11 + 3936) predicateWithFormat:@"(entryDate > %@) AND (entryPriorityNumber = %d) AND (entryTypeNumber != %d)", v8, 0, 2];
  [v22 setPredicate:v24];

  [v22 setFetchLimit:1];
  uint64_t v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
  CFAbsoluteTime v32 = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [v22 setSortDescriptors:v26];

  id v30 = v18;
  uint64_t v27 = [v10 executeFetchRequest:v22 error:&v30];
  id v21 = v30;

  if (!v27)
  {
    id v28 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v21;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "error fetching latest date %@", buf, 0xCu);
    }
  }
  if ([v27 count] == 1)
  {
    uint64_t v29 = [v27 objectAtIndex:0];
    *a4 = [v29 entryDate];
  }
  else
  {
    *a4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }

LABEL_20:
}

- (id)_firstEntryRelativeToDate:(id)a3 ascending:(BOOL)a4 includeSameDate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v10 = [(PLCloudFeedEntriesManager *)self library];
  unint64_t v11 = [v10 managedObjectContext];

  id v12 = +[PLManagedObject entityInManagedObjectContext:v11];
  [v9 setEntity:v12];

  long long v13 = @"(entryDate < %@)";
  if (v5) {
    long long v13 = @"(entryDate <= %@)";
  }
  id v14 = @"(entryDate >= %@)";
  if (!v5) {
    id v14 = @"(entryDate > %@)";
  }
  if (v6) {
    long long v13 = v14;
  }
  id v15 = v13;
  uint64_t v16 = [(__CFString *)v15 stringByAppendingString:@" AND (entryPriorityNumber = %d)"];

  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v16, v8, 0);
  [v9 setPredicate:v17];

  [v9 setFetchLimit:1];
  id v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:v6];
  v32[0] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v9 setSortDescriptors:v19];

  id v25 = 0;
  id v20 = [v11 executeFetchRequest:v9 error:&v25];
  id v21 = v25;
  if (!v20)
  {
    id v22 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v27 = v8;
      __int16 v28 = 1024;
      BOOL v29 = v6;
      __int16 v30 = 2112;
      id v31 = v21;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "error fetching relative to date %@ %i: %@", buf, 0x1Cu);
    }
  }
  if ([v20 count])
  {
    id v23 = [v20 objectAtIndex:0];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)_firstEntryOnOrAfterDate:(id)a3
{
  return [(PLCloudFeedEntriesManager *)self _firstEntryRelativeToDate:a3 ascending:1 includeSameDate:1];
}

- (id)_firstEntryAfterDate:(id)a3
{
  return [(PLCloudFeedEntriesManager *)self _firstEntryRelativeToDate:a3 ascending:1 includeSameDate:0];
}

- (id)_firstEntryOnOrBeforeDate:(id)a3
{
  return [(PLCloudFeedEntriesManager *)self _firstEntryRelativeToDate:a3 ascending:0 includeSameDate:1];
}

- (PLCloudFeedEntriesManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLCloudFeedEntriesManager;
  BOOL v6 = [(PLCloudFeedEntriesManager *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_library, a3);
  }

  return v7;
}

@end