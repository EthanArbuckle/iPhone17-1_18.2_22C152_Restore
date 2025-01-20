@interface ML3UpdateSpotlightIndexOperation
- (BOOL)_batchIndexWithTrackPersistentIDsToUpdate:(id)a3 playlistsPersistentIDsToUpdateSet:(id)a4 entityStringsToDelete:(id)a5 currentRevision:(id)a6 targetRevision:(id)a7 error:(id *)a8;
- (BOOL)_deleteAllIndexedItemsWithError:(id *)a3;
- (BOOL)_deleteIndexedItemsWithEntityStringIDs:(id)a3 error:(id *)a4;
- (BOOL)_enumerateSearchableItemsWithPersistentIDs:(id)a3 entityType:(int64_t)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)_execute:(id *)a3;
- (BOOL)_indexItemsFromLibrarySinceRevision:(int64_t)a3 targetRevision:(int64_t)a4 error:(id *)a5;
- (BOOL)_indexTracksWithPersistentIDs:(id)a3 playlistsWithPersistentIDs:(id)a4 error:(id *)a5;
- (BOOL)_updateIndexedItemsWithIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3;
- (CSSearchableIndex)index;
- (NSString)bundleIdentifier;
- (id)_createSearchableItemsForPlaylistsWithQuery:(id)a3 error:(id *)a4;
- (id)_createSearchableItemsForTracksWithQuery:(id)a3 error:(id *)a4;
- (id)_createSearchableItemsWithPersistentIDs:(id)a3 entityType:(int64_t)a4 error:(id *)a5;
- (id)_queryForPlaylistsContainingMusicShowsMissedByQuery:(id)a3 inContainerPIDs:(id)a4;
- (unint64_t)batchCount;
- (unint64_t)bundle;
- (unint64_t)type;
- (void)setBatchCount:(unint64_t)a3;
- (void)setBundle:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIndex:(id)a3;
@end

@implementation ML3UpdateSpotlightIndexOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_index, 0);
}

- (void)setBatchCount:(unint64_t)a3
{
  self->_batchCount = a3;
}

- (unint64_t)batchCount
{
  return self->_batchCount;
}

- (void)setBundle:(unint64_t)a3
{
  self->_bundle = a3;
}

- (unint64_t)bundle
{
  return self->_bundle;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setIndex:(id)a3
{
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ML3UpdateSpotlightIndexOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v10, sel__verifyLibraryConnectionAndAttributesProperties_))return 0; {
  v5 = [(ML3DatabaseOperation *)self attributes];
  }
  v6 = [v5 objectForKey:@"MLDatabaseOperationAttributeBundleIDKey"];

  uint64_t v7 = _MLDUpdateSpotlightIndexBundleForBundleIdentifier(v6);
  BOOL v8 = v7 != 0;
  if (a3 && !v7)
  {
    *a3 = +[ML3MediaLibraryWriter writerErrorWithCode:500 description:@"ML3UpdateSpotlightIndexOperation requires a bundleID attribute"];
  }

  return v8;
}

- (id)_queryForPlaylistsContainingMusicShowsMissedByQuery:(id)a3 inContainerPIDs:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA80] setWithArray:a4];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __104__ML3UpdateSpotlightIndexOperation__queryForPlaylistsContainingMusicShowsMissedByQuery_inContainerPIDs___block_invoke;
  v36[3] = &unk_1E5FB7EE0;
  id v7 = v6;
  id v37 = v7;
  v28 = v5;
  [v5 enumeratePersistentIDsUsingBlock:v36];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v13 = +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", @"container_item.container_pid", [v12 longLongValue]);
        v39[0] = v13;
        v14 = +[ML3ComparisonPredicate predicateWithProperty:@"media_type" value:&unk_1F09124D8 comparison:10];
        v39[1] = v14;
        v15 = +[ML3ComparisonPredicate predicateWithProperty:@"item.is_music_show" equalToInt64:1];
        v39[2] = v15;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
        v17 = +[ML3CompoundPredicate predicateMatchingPredicates:v16];

        v18 = [(ML3DatabaseOperation *)self library];
        v19 = +[ML3Entity unrestrictedQueryWithLibrary:v18 predicate:v17 orderingTerms:MEMORY[0x1E4F1CBF0]];

        if ([v19 hasEntities]) {
          [v29 addObject:v12];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v9);
  }

  if ([v29 count])
  {
    v20 = +[ML3PersistentIDsPredicate predicateWithPersistentIDs:v29 shouldContain:1];
    v38[0] = v20;
    v21 = +[ML3ComparisonPredicate predicateWithProperty:@"smart_is_folder" equalToInteger:0];
    v38[1] = v21;
    v22 = +[ML3ComparisonPredicate predicateWithProperty:@"is_hidden" equalToInteger:0];
    v38[2] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
    v24 = +[ML3CompoundPredicate predicateMatchingPredicates:v23];

    v25 = [(ML3DatabaseOperation *)self library];
    v26 = +[ML3Entity unrestrictedQueryWithLibrary:v25 predicate:v24 orderingTerms:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __104__ML3UpdateSpotlightIndexOperation__queryForPlaylistsContainingMusicShowsMissedByQuery_inContainerPIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 removeObject:v3];
}

- (id)_createSearchableItemsForPlaylistsWithQuery:(id)a3 error:(id *)a4
{
  v30[9] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__24607;
  v28 = __Block_byref_object_dispose__24608;
  id v29 = 0;
  v30[0] = @"name";
  v30[1] = @"description";
  v30[2] = @"play_count_user";
  v30[3] = @"date_created";
  v30[4] = @"date_played_local";
  v30[5] = @"cloud_global_id";
  v30[6] = @"store_cloud_id";
  v30[7] = @"cloud_universal_library_id";
  v30[8] = @"sync_id";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:9];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Creating searchable items for playlists", buf, 2u);
  }

  uint64_t v10 = [(ML3DatabaseOperation *)self attributes];
  v11 = [v10 objectForKeyedSubscript:@"MLDatabaseOperationAttributeSpotlightIndexAppEntityAssociatorKey"];

  v12 = (void *)MEMORY[0x1B3E93C70]();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__ML3UpdateSpotlightIndexOperation__createSearchableItemsForPlaylistsWithQuery_error___block_invoke;
  v17[3] = &unk_1E5FB7E78;
  v22 = &v24;
  id v13 = v11;
  id v18 = v13;
  id v14 = v7;
  id v19 = v14;
  v20 = self;
  id v15 = v8;
  id v21 = v15;
  [v6 enumeratePersistentIDsAndProperties:v14 usingBlock:v17];

  if (v25[5])
  {

    id v15 = 0;
  }
  if (a4) {
    *a4 = (id) v25[5];
  }

  _Block_object_dispose(&v24, 8);

  return v15;
}

void __86__ML3UpdateSpotlightIndexOperation__createSearchableItemsForPlaylistsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, unsigned char *a5)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    context = (void *)MEMORY[0x1B3E93C70]();
    id v8 = *a3;
    id v9 = a3[1];
    id v38 = a3[2];
    id v10 = a3[3];
    [v10 doubleValue];
    if (fabs(v11) <= 0.00000011920929)
    {
      id v37 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1C9C8];
      [v10 doubleValue];
      id v37 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    }
    id v19 = a3[4];
    [v19 doubleValue];
    if (fabs(v20) <= 0.00000011920929)
    {
      v22 = 0;
    }
    else
    {
      id v21 = (void *)MEMORY[0x1E4F1C9C8];
      [v19 doubleValue];
      v22 = objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
    }
    id v23 = objc_alloc(MEMORY[0x1E4F23850]);
    uint64_t v24 = (void *)[v23 initWithContentType:*MEMORY[0x1E4F44478]];
    [v24 setDisplayName:v8];
    [v24 setTitle:v8];
    long long v35 = v9;
    [v24 setInformation:v9];
    [v24 setPlayCount:v38];
    [v24 setContentCreationDate:v37];
    [v24 setLastUsedDate:v22];
    if (_os_feature_enabled_impl())
    {
      if (*(void *)(a1 + 32))
      {
        v25 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v26 = *(void **)(a1 + 40);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __86__ML3UpdateSpotlightIndexOperation__createSearchableItemsForPlaylistsWithQuery_error___block_invoke_2;
        void v39[3] = &unk_1E5FB7E50;
        id v40 = v25;
        uint64_t v41 = a3;
        id v27 = v25;
        [v26 enumerateObjectsUsingBlock:v39];
        v28 = *(void **)(a1 + 32);
        id v29 = [*(id *)(a1 + 48) library];
        [v28 associateAppEntityForEntityOfType:1 persistentID:a2 library:v29 properties:v27 withSearchableItemWithAttributeSet:v24];
      }
    }
    v30 = [*(id *)(a1 + 48) library];
    v31 = [v30 libraryUID];
    long long v32 = +[ML3Entity URLForEntityWithPersistentID:a2 libraryUID:v31];
    long long v33 = [v32 absoluteString];

    long long v34 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v33 domainIdentifier:0 attributeSet:v24];
    [*(id *)(a1 + 56) addObject:v34];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    v43[0] = @"Failed to create CSSearchable playlist items from the library.";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    uint64_t v16 = [v14 errorWithDomain:@"MLDSpotlightIndexOperationErrorDomain" code:1003 userInfo:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    *a5 = 1;
  }
}

uint64_t __86__ML3UpdateSpotlightIndexOperation__createSearchableItemsForPlaylistsWithQuery_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(a1 + 40) + 8 * a3) forKeyedSubscript:a2];
}

- (id)_createSearchableItemsForTracksWithQuery:(id)a3 error:(id *)a4
{
  v30[29] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__24607;
  v28 = __Block_byref_object_dispose__24608;
  id v29 = 0;
  v30[0] = @"media_type";
  v30[1] = @"item_extra.title";
  v30[2] = @"item_extra.copyright";
  v30[3] = @"date_added";
  v30[4] = @"item_extra.total_time_ms";
  v30[5] = @"(item.remote_location_id >= 50 AND item.remote_location_id < 300)";
  v30[6] = @"item_stats.user_rating";
  v30[7] = @"item_stats.play_count_user";
  v30[8] = @"item_video.movie_info";
  v30[9] = @"genre.genre";
  void v30[10] = @"(item.base_location_id >= 250)";
  v30[11] = @"(item_extra.content_rating == 1)";
  v30[12] = @"composer.composer";
  v30[13] = @"album.album";
  v30[14] = @"item_artist.item_artist";
  v30[15] = @"track_number";
  v30[16] = @"item_store.subscription_store_item_id";
  v30[17] = @"item_store.store_item_id";
  v30[18] = @"item_extra.content_rating_level";
  v30[19] = @"item_extra.sort_title";
  v30[20] = @"item_stats.date_played";
  v30[21] = @"in_my_library";
  v30[22] = @"item_store.is_artist_uploaded_content";
  v30[23] = @"item_store.sync_id";
  v30[24] = @"item_store.store_saga_id";
  v30[25] = @"item_store.cloud_universal_library_id";
  v30[26] = @"item_store.cloud_album_id";
  v30[27] = @"item_store.reporting_store_item_id";
  v30[28] = @"item_store.asset_store_item_id";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:29];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Creating searchable items for tracks", buf, 2u);
  }

  id v10 = [(ML3DatabaseOperation *)self attributes];
  double v11 = [v10 objectForKeyedSubscript:@"MLDatabaseOperationAttributeSpotlightIndexAppEntityAssociatorKey"];

  v12 = (void *)MEMORY[0x1B3E93C70]();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__ML3UpdateSpotlightIndexOperation__createSearchableItemsForTracksWithQuery_error___block_invoke;
  v17[3] = &unk_1E5FB7E78;
  v22 = &v24;
  id v13 = v11;
  id v18 = v13;
  id v14 = v7;
  id v19 = v14;
  double v20 = self;
  id v15 = v8;
  id v21 = v15;
  [v6 enumeratePersistentIDsAndProperties:v14 usingBlock:v17];

  if (v25[5])
  {

    id v15 = 0;
  }
  if (a4) {
    *a4 = (id) v25[5];
  }

  _Block_object_dispose(&v24, 8);

  return v15;
}

void __83__ML3UpdateSpotlightIndexOperation__createSearchableItemsForTracksWithQuery_error___block_invoke(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, unsigned char *a5)
{
  v90[1] = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v89 = *MEMORY[0x1E4F28568];
    v90[0] = @"Failed to create CSSearchable track items from the library.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
    uint64_t v15 = [v13 errorWithDomain:@"MLDSpotlightIndexOperationErrorDomain" code:1003 userInfo:v14];
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    *a5 = 1;
    return;
  }
  id v8 = (void *)MEMORY[0x1B3E93C70]();
  __int16 v9 = [*a3 unsignedIntValue];
  __int16 v10 = v9;
  if ((v9 & 0x2E00) != 0)
  {
    double v11 = (id *)MEMORY[0x1E4F44520];
  }
  else
  {
    if ((v9 & 8) == 0)
    {
      id v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Skipping library item with invalid media type", buf, 2u);
      }
      goto LABEL_52;
    }
    double v11 = (id *)MEMORY[0x1E4F44330];
  }
  uint64_t v19 = [*v11 identifier];
  if (v19)
  {
    uint64_t v20 = v19;
    v60 = v8;
    if ((v10 & 0x400) != 0)
    {
      id v21 = (id *)MEMORY[0x1E4F229B8];
    }
    else if ((v10 & 0x800) != 0)
    {
      id v21 = (id *)MEMORY[0x1E4F229B0];
    }
    else if ((v10 & 0x2000) != 0)
    {
      id v21 = (id *)MEMORY[0x1E4F229A8];
    }
    else if ((v10 & 0x200) != 0)
    {
      id v21 = (id *)MEMORY[0x1E4F229C8];
    }
    else
    {
      if ((v10 & 8) == 0)
      {
        id v80 = 0;
        goto LABEL_22;
      }
      id v21 = (id *)MEMORY[0x1E4F229C0];
    }
    id v80 = *v21;
LABEL_22:
    id v79 = a3[1];
    id v78 = a3[2];
    id v22 = a3[3];
    [v22 doubleValue];
    v58 = v22;
    if (fabs(v23) <= 0.00000011920929)
    {
      v77 = 0;
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F1C9C8];
      [v22 doubleValue];
      v77 = objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:");
    }
    v76 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3[4], "unsignedIntValue") / 0x3E8uLL);
    id v75 = a3[5];
    v74 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3[6], "unsignedIntValue") / 0x14uLL);
    id v73 = a3[7];
    id v25 = a3[8];
    v57 = v25;
    if (![v25 length])
    {
      v70 = 0;
      v71 = 0;
      v72 = 0;
LABEL_35:
      id v33 = a3[9];
      v69 = v33;
      if ((v10 & 8) != 0) {
        id v68 = v33;
      }
      else {
        id v68 = 0;
      }
      id v67 = a3[10];
      id v66 = a3[11];
      id v65 = a3[12];
      id v64 = a3[13];
      id v63 = a3[14];
      id v62 = a3[15];
      id v34 = a3[16];
      if (![v34 longLongValue])
      {
        id v35 = a3[17];

        id v34 = v35;
      }
      id v61 = a3[18];
      id v36 = a3[19];
      id v37 = a3[20];
      [v37 doubleValue];
      if (fabs(v38) <= 0.00000011920929)
      {
        uint64_t v42 = 0;
      }
      else
      {
        uint64_t v39 = v20;
        id v40 = (void *)MEMORY[0x1E4F1C9C8];
        [v37 doubleValue];
        uint64_t v41 = v40;
        uint64_t v20 = v39;
        uint64_t v42 = objc_msgSend(v41, "dateWithTimeIntervalSinceReferenceDate:");
      }
      v59 = v20;
      v43 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:v20];
      [v43 setDisplayName:v79];
      [v43 setTitle:v79];
      [v43 setCopyright:v78];
      [v43 setContentCreationDate:v77];
      [v43 setDuration:v76];
      if (v80)
      {
        id v86 = v80;
        v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
        [v43 setMediaTypes:v44];
      }
      else
      {
        [v43 setMediaTypes:MEMORY[0x1E4F1CBF0]];
      }
      [v43 setStreamable:v75];
      [v43 setRating:v74];
      [v43 setPlayCount:v73];
      [v43 setDirector:v71];
      [v43 setProducer:v70];
      [v43 setGenre:v69];
      [v43 setPerformers:v72];
      [v43 setLocal:v67];
      [v43 setContentRating:v66];
      [v43 setComposer:v65];
      [v43 setAlbum:v64];
      [v43 setArtist:v63];
      [v43 setAudioTrackNumber:v62];
      [v43 setMusicalGenre:v68];
      v45 = [v34 stringValue];
      [v43 setAdamID:v45];

      [v43 setExtendedContentRating:v61];
      if ([v36 length])
      {
        id v85 = v36;
        v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
        [v43 setAlternateNames:v46];
      }
      [v43 setLastUsedDate:v42];
      if (_os_feature_enabled_impl())
      {
        if (*(void *)(a1 + 32))
        {
          v47 = [MEMORY[0x1E4F1CA60] dictionary];
          v48 = *(void **)(a1 + 40);
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __83__ML3UpdateSpotlightIndexOperation__createSearchableItemsForTracksWithQuery_error___block_invoke_74;
          v81[3] = &unk_1E5FB7E50;
          id v82 = v47;
          v83 = a3;
          id v49 = v47;
          [v48 enumerateObjectsUsingBlock:v81];
          v50 = *(void **)(a1 + 32);
          v51 = [*(id *)(a1 + 48) library];
          [v50 associateAppEntityForEntityOfType:0 persistentID:a2 library:v51 properties:v49 withSearchableItemWithAttributeSet:v43];
        }
      }
      v52 = [*(id *)(a1 + 48) library];
      v53 = [v52 libraryUID];
      v54 = +[ML3Entity URLForEntityWithPersistentID:a2 libraryUID:v53];
      v55 = [v54 absoluteString];

      v56 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v55 domainIdentifier:0 attributeSet:v43];
      [*(id *)(a1 + 56) addObject:v56];

      id v18 = v59;
      id v8 = v60;
LABEL_52:

      goto LABEL_53;
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F28F98];
    id v27 = [v25 dataUsingEncoding:4];
    id v84 = 0;
    v28 = [v26 propertyListWithData:v27 options:0 format:0 error:&v84];
    id v29 = v84;

    if (v29)
    {
      v30 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v88 = v29;
        _os_log_impl(&dword_1B022D000, v30, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to decode movie info plist with error: %{public}@", buf, 0xCu);
      }
      v71 = 0;
      v72 = 0;
      v70 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v71 = 0;
        v72 = 0;
        v70 = 0;
        goto LABEL_34;
      }
      v72 = [v28 valueForKeyPath:@"cast.name"];
      v30 = [v28 valueForKeyPath:@"directors.name"];
      v71 = [v30 firstObject];
      [v28 valueForKeyPath:@"producers.name"];
      long long v32 = v31 = v20;
      v70 = [v32 firstObject];

      uint64_t v20 = v31;
    }

LABEL_34:
    goto LABEL_35;
  }
LABEL_53:
}

uint64_t __83__ML3UpdateSpotlightIndexOperation__createSearchableItemsForTracksWithQuery_error___block_invoke_74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(a1 + 40) + 8 * a3) forKeyedSubscript:a2];
}

- (id)_createSearchableItemsWithPersistentIDs:(id)a3 entityType:(int64_t)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  __int16 v9 = v8;
  if (!a4)
  {
    unint64_t v19 = [(ML3UpdateSpotlightIndexOperation *)self bundle];
    if (v19 == 2)
    {
      v57 = self;
      v28 = +[ML3ComparisonPredicate predicateWithProperty:@"media_type" value:&unk_1F0912508 comparison:10];
      *(void *)&long long buf = v28;
      v30 = +[ML3PropertyPredicate predicateWithProperty:@"in_my_library"];
      *((void *)&buf + 1) = v30;
      id v29 = +[ML3PropertyPredicate predicateWithProperty:@"(item.base_location_id OR item.remote_location_id)"];
      id v64 = v29;
      uint64_t v20 = +[ML3ComparisonPredicate predicateWithProperty:@"item.is_music_show" equalToInteger:0];
      id v65 = v20;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:4];
      id v18 = +[ML3CompoundPredicate predicateMatchingPredicates:v21];
    }
    else
    {
      if (v19 != 1)
      {
        v28 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B022D000, v28, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Trying to build searchable items with an unknown bundle id", (uint8_t *)&buf, 2u);
        }
        id v18 = 0;
        goto LABEL_13;
      }
      v57 = self;
      *(void *)&long long v54 = +[ML3PropertyPredicate predicateWithProperty:@"in_my_library"];
      *((void *)&v54 + 1) = +[ML3PropertyPredicate predicateWithProperty:@"(item.base_location_id OR item.remote_location_id)"];
      long long buf = v54;
      uint64_t v53 = +[ML3ComparisonPredicate predicateWithProperty:@"media_type" value:&unk_1F09124F0 comparison:10];
      uint64_t v67 = v53;
      uint64_t v20 = +[ML3ComparisonPredicate predicateWithProperty:@"media_type" value:&unk_1F09124D8 comparison:10];
      v66[0] = v20;
      id v21 = +[ML3PropertyPredicate predicateWithProperty:@"item.is_music_show"];
      v66[1] = v21;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
      id v22 = +[ML3CompoundPredicate predicateMatchingPredicates:v52];
      id v68 = v22;
      double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:2];
      +[ML3CompoundPredicate predicateMatchingPredicates:v23];
      uint64_t v24 = a5;
      uint64_t v26 = v25 = v9;
      id v64 = v26;
      id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:3];
      id v18 = +[ML3CompoundPredicate predicateMatchingPredicates:v27];

      v28 = v54;
      __int16 v9 = v25;
      a5 = v24;
      id v29 = (void *)v53;

      v30 = (void *)*((void *)&v54 + 1);
    }

    self = v57;
LABEL_13:

    goto LABEL_14;
  }
  if (a4 == 1)
  {
    id v55 = v8;
    v56 = a5;
    __int16 v10 = +[ML3ComparisonPredicate predicateWithProperty:@"smart_is_folder" equalToInteger:0];
    *(void *)&long long buf = v10;
    double v11 = +[ML3ComparisonPredicate predicateWithProperty:@"is_hidden" equalToInteger:0];
    *((void *)&buf + 1) = v11;
    v12 = +[ML3ComparisonPredicate predicateWithProperty:@"contained_media_type" equalToInteger:0];
    uint64_t v67 = (uint64_t)v12;
    id v13 = +[ML3ComparisonPredicate predicateWithProperty:@"contained_media_type" value:&unk_1F09124F0 comparison:10];
    id v68 = v13;
    id v14 = self;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:2];
    uint64_t v16 = +[ML3CompoundPredicate predicateMatchingPredicates:v15];
    id v64 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:3];
    id v18 = +[ML3CompoundPredicate predicateMatchingPredicates:v17];

    self = v14;
    __int16 v9 = v55;
    a5 = v56;
  }
  else
  {
    id v18 = 0;
  }
LABEL_14:
  if ([v9 count] && v18)
  {
    v62[0] = v18;
    uint64_t v31 = +[ML3PersistentIDsPredicate predicateWithPersistentIDs:v9 shouldContain:1];
    v62[1] = v31;
    long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    uint64_t v33 = +[ML3CompoundPredicate predicateMatchingPredicates:v32];

    id v18 = (void *)v33;
  }
  if (a4)
  {
    if (a4 != 1)
    {
      id v36 = 0;
      goto LABEL_41;
    }
    id v34 = [(ML3DatabaseOperation *)self library];
    id v35 = +[ML3Entity unrestrictedQueryWithLibrary:v34 predicate:v18 orderingTerms:MEMORY[0x1E4F1CBF0]];

    id v60 = 0;
    id v36 = [(ML3UpdateSpotlightIndexOperation *)self _createSearchableItemsForPlaylistsWithQuery:v35 error:&v60];
    id v37 = v60;
    if (!v36)
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      [v50 handleFailureInMethod:a2 object:self file:@"ML3UpdateSpotlightIndexOperation.m" lineNumber:567 description:@"_createSearchableItemsForPlaylistsWithQuery must return an array of CSSearchableItems."];
    }
    if ([(ML3UpdateSpotlightIndexOperation *)self bundle] == 1)
    {
      uint64_t v38 = [v36 count];
      if (v38 != [v9 count] && !v37)
      {
        uint64_t v39 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B022D000, v39, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Some playlists might contain Music Shows & Movies items only, investigating...", (uint8_t *)&buf, 2u);
        }

        id v40 = v9;
        uint64_t v41 = [(ML3UpdateSpotlightIndexOperation *)self _queryForPlaylistsContainingMusicShowsMissedByQuery:v35 inContainerPIDs:v9];
        id v59 = 0;
        [(ML3UpdateSpotlightIndexOperation *)self _createSearchableItemsForPlaylistsWithQuery:v41 error:&v59];
        v43 = uint64_t v42 = self;
        id v37 = v59;
        if (!v43)
        {
          v51 = [MEMORY[0x1E4F28B00] currentHandler];
          [v51 handleFailureInMethod:a2 object:v42 file:@"ML3UpdateSpotlightIndexOperation.m" lineNumber:576 description:@"_createSearchableItemsForPlaylistsWithQuery must return an array of CSSearchableItems."];
        }
        if ([v43 count])
        {
          v44 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = [v43 count];
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v45;
            _os_log_impl(&dword_1B022D000, v44, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Found %ld playlists with Music Shows & Movies items only. Adding them to the searchable items array", (uint8_t *)&buf, 0xCu);
          }

          uint64_t v46 = [v36 arrayByAddingObjectsFromArray:v43];

          id v36 = (void *)v46;
        }

        __int16 v9 = v40;
      }
    }
  }
  else
  {
    v47 = [(ML3DatabaseOperation *)self library];
    id v35 = +[ML3Entity unrestrictedQueryWithLibrary:v47 predicate:v18 orderingTerms:MEMORY[0x1E4F1CBF0]];

    id v61 = 0;
    id v36 = [(ML3UpdateSpotlightIndexOperation *)self _createSearchableItemsForTracksWithQuery:v35 error:&v61];
    id v37 = v61;
  }

  if (v37)
  {
    if (!a5) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_41:
  id v49 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B022D000, v49, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Finished searchable items creation", (uint8_t *)&buf, 2u);
  }

  id v37 = 0;
  if (a5) {
LABEL_36:
  }
    *a5 = v37;
LABEL_37:

  return v36;
}

- (BOOL)_enumerateSearchableItemsWithPersistentIDs:(id)a3 entityType:(int64_t)a4 error:(id *)a5 usingBlock:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  __int16 v10 = (void (**)(id, NSObject *))a6;
  if (v10)
  {
    double v11 = (void *)MEMORY[0x1B3E93C70]();
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Evaluating the need of batching for database fetch", buf, 2u);
    }

    if ((unint64_t)[v9 count] < 0x321)
    {
      id v30 = 0;
      id v18 = [(ML3UpdateSpotlightIndexOperation *)self _createSearchableItemsWithPersistentIDs:v9 entityType:a4 error:&v30];
      os_log_t v20 = (os_log_t)v30;
      uint64_t v24 = os_log_create("com.apple.amp.medialibrary", "Default");
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v25)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to create searchable items", buf, 2u);
        }

        BOOL v23 = 1;
        goto LABEL_34;
      }
      id v27 = v11;
      v28 = a5;
      if (v25)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Created searchable items batch", buf, 2u);
      }

      v10[2](v10, v18);
    }
    else
    {
      id v27 = v11;
      v28 = a5;
      id v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v33 = 800;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Library fetch batching is needed, fetching from the DB in chuncks of %lu", buf, 0xCu);
      }

      if ([v9 count])
      {
        uint64_t v14 = 0;
        unint64_t v15 = 0;
        while (1)
        {
          uint64_t v16 = [v9 count];
          uint64_t v17 = (unint64_t)(v16 + v14) >= 0x320 ? 800 : v16 + v14;
          id v18 = objc_msgSend(v9, "subarrayWithRange:", v15, v17);
          id v31 = 0;
          unint64_t v19 = [(ML3UpdateSpotlightIndexOperation *)self _createSearchableItemsWithPersistentIDs:v18 entityType:a4 error:&v31];
          os_log_t v20 = (os_log_t)v31;
          id v21 = os_log_create("com.apple.amp.medialibrary", "Default");
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v20) {
            break;
          }
          if (v22)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Created searchable items batch with library fetch batching", buf, 2u);
          }

          v10[2](v10, v19);
          v15 += 800;
          v14 -= 800;
          if (v15 >= [v9 count]) {
            goto LABEL_27;
          }
        }
        if (v22)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to create searchable items batch with library fetch batching", buf, 2u);
        }

        BOOL v23 = 1;
        goto LABEL_33;
      }
    }
LABEL_27:
    id v18 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Searchable item creation is done", buf, 2u);
    }
    BOOL v23 = 0;
    os_log_t v20 = 0;
LABEL_33:
    double v11 = v27;
    a5 = v28;
LABEL_34:

    if (a5)
    {
      os_log_t v20 = v20;
      *a5 = v20;
    }
    goto LABEL_36;
  }
  os_log_t v20 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Attempted to enumerate searchable items without block, returning", buf, 2u);
  }
  BOOL v23 = 1;
LABEL_36:

  return v23;
}

- (BOOL)_batchIndexWithTrackPersistentIDsToUpdate:(id)a3 playlistsPersistentIDsToUpdateSet:(id)a4 entityStringsToDelete:(id)a5 currentRevision:(id)a6 targetRevision:(id)a7 error:(id *)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v40 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 1;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = __Block_byref_object_copy__24607;
  long long v54 = __Block_byref_object_dispose__24608;
  id v55 = 0;
  ++self->_batchCount;
  uint64_t v17 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = [(ML3UpdateSpotlightIndexOperation *)self batchCount];
    *(_DWORD *)long long buf = 134218240;
    unint64_t v63 = v18;
    __int16 v64 = 2048;
    id v65 = self;
    _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┏ Beginning Core Spotlight index batch %lu for operation %p", buf, 0x16u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v20 = v19;
  id v21 = [(ML3UpdateSpotlightIndexOperation *)self index];
  [v21 beginIndexBatch];

  BOOL v22 = (id *)(v51 + 5);
  id obj = (id)v51[5];
  BOOL v23 = [(ML3UpdateSpotlightIndexOperation *)self _deleteIndexedItemsWithEntityStringIDs:v14 error:&obj];
  objc_storeStrong(v22, obj);
  *((unsigned char *)v57 + 24) = v23;
  uint64_t v24 = (id *)(v51 + 5);
  if (!v51[5])
  {
    id v48 = 0;
    BOOL v25 = [(ML3UpdateSpotlightIndexOperation *)self _indexTracksWithPersistentIDs:v39 playlistsWithPersistentIDs:v40 error:&v48];
    objc_storeStrong(v24, v48);
    *((unsigned char *)v57 + 24) = v25;
  }
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", _MLDUpdateSpotlightIndexVersionForBundle(-[ML3UpdateSpotlightIndexOperation bundle](self, "bundle")));
  if (!v51[5])
  {
    v61[0] = v15;
    v60[0] = @"revision";
    v60[1] = @"libraryID";
    id v27 = [(ML3DatabaseOperation *)self library];
    v28 = [v27 libraryUID];
    v61[1] = v28;
    v61[2] = v26;
    v60[2] = @"version";
    v60[3] = @"targetRevision";
    v61[3] = v16;
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:4];

    id v30 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v29 format:200 options:0 error:0];
    id v31 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v32 = [(ML3UpdateSpotlightIndexOperation *)self batchCount];
      uint64_t v33 = [v30 length];
      *(_DWORD *)long long buf = 134218240;
      unint64_t v63 = v32;
      __int16 v64 = 2048;
      id v65 = (ML3UpdateSpotlightIndexOperation *)v33;
      _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Updating indexed client state and fininshing index batch %lu with client state data size: %lu", buf, 0x16u);
    }

    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    id v35 = [(ML3UpdateSpotlightIndexOperation *)self index];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __171__ML3UpdateSpotlightIndexOperation__batchIndexWithTrackPersistentIDsToUpdate_playlistsPersistentIDsToUpdateSet_entityStringsToDelete_currentRevision_targetRevision_error___block_invoke;
    v41[3] = &unk_1E5FB7D38;
    uint64_t v47 = v20;
    id v42 = v29;
    v43 = self;
    uint64_t v45 = &v56;
    uint64_t v46 = &v50;
    id v36 = v34;
    v44 = v36;
    [v35 endIndexBatchWithClientState:v30 completionHandler:v41];

    dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a8) {
    *a8 = (id) v51[5];
  }
  BOOL v37 = *((unsigned char *)v57 + 24) != 0;

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  return v37;
}

void __171__ML3UpdateSpotlightIndexOperation__batchIndexWithTrackPersistentIDsToUpdate_playlistsPersistentIDsToUpdateSet_entityStringsToDelete_currentRevision_targetRevision_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  id v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Failed to update client state", (uint8_t *)&v18, 2u);
    }

    id v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = v5 - *(double *)(a1 + 72);
      int v18 = 134217984;
      double v19 = v9;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┗ FAILED Core Spotlight batch operation in %.3f seconds", (uint8_t *)&v18, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id v11 = v3;
    v12 = *(NSObject **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }
  else
  {
    if (v7)
    {
      id v13 = [*(id *)(a1 + 32) objectForKey:@"revision"];
      id v14 = [*(id *)(a1 + 32) objectForKey:@"targetRevision"];
      id v15 = [*(id *)(a1 + 32) objectForKey:@"version"];
      int v18 = 138543874;
      double v19 = *(double *)&v13;
      __int16 v20 = 2114;
      id v21 = v14;
      __int16 v22 = 2114;
      BOOL v23 = v15;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Client state updated with revision:%{public}@, target revision:%{public}@, version:%{public}@", (uint8_t *)&v18, 0x20u);
    }
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = v5 - *(double *)(a1 + 72);
      uint64_t v17 = *(void **)(a1 + 40);
      int v18 = 134218240;
      double v19 = v16;
      __int16 v20 = 2048;
      id v21 = v17;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┗ Successfully finished Core Spotlight batch operation in %.3f seconds for operation %p", (uint8_t *)&v18, 0x16u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)_indexTracksWithPersistentIDs:(id)a3 playlistsWithPersistentIDs:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v24 = 0;
  BOOL v25 = (id *)&v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__24607;
  v28 = __Block_byref_object_dispose__24608;
  id v29 = 0;
  if ([v8 count] && !v25[5])
  {
    uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Started to index track items", buf, 2u);
    }

    id v11 = v25;
    id v12 = v25[5];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke;
    v21[3] = &unk_1E5FB7D10;
    v21[4] = self;
    v21[5] = &v30;
    v21[6] = &v24;
    id obj = v12;
    [(ML3UpdateSpotlightIndexOperation *)self _enumerateSearchableItemsWithPersistentIDs:v8 entityType:0 error:&obj usingBlock:v21];
    objc_storeStrong(v11 + 5, obj);
  }
  if (-[ML3UpdateSpotlightIndexOperation bundle](self, "bundle") == 1 && [v9 count] && !v25[5])
  {
    id v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Started to index playlists", buf, 2u);
    }

    id v14 = v25;
    id v15 = v25[5];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_43;
    v19[3] = &unk_1E5FB7D10;
    v19[4] = self;
    v19[5] = &v30;
    v19[6] = &v24;
    id v20 = v15;
    [(ML3UpdateSpotlightIndexOperation *)self _enumerateSearchableItemsWithPersistentIDs:v9 entityType:1 error:&v20 usingBlock:v19];
    objc_storeStrong(v14 + 5, v20);
  }
  double v16 = v25;
  if (v25[5]) {
    *((unsigned char *)v31 + 24) = 0;
  }
  if (a5) {
    *a5 = v16[5];
  }
  char v17 = *((unsigned char *)v31 + 24);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v17;
}

void __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  double v5 = [*(id *)(a1 + 32) index];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_2;
  v9[3] = &unk_1E5FB7CE8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  long long v13 = *(_OWORD *)(a1 + 40);
  dispatch_semaphore_t v12 = v4;
  BOOL v7 = v4;
  id v8 = v3;
  [v5 indexSearchableItems:v8 completionHandler:v9];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  double v5 = [*(id *)(a1 + 32) index];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_2_44;
  v9[3] = &unk_1E5FB7CE8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  long long v13 = *(_OWORD *)(a1 + 40);
  dispatch_semaphore_t v12 = v4;
  BOOL v7 = v4;
  id v8 = v3;
  [v5 indexSearchableItems:v8 completionHandler:v9];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_2_44(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_semaphore_t v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to index spotlight playlists", (uint8_t *)&v10, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = v3;
    dispatch_semaphore_t v4 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    uint64_t v8 = [*(id *)(a1 + 32) count];
    id v9 = [*(id *)(a1 + 40) bundleIdentifier];
    int v10 = 134218242;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    long long v13 = v9;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Updated %lu playlists in spotlight index with bundle ID:%{public}@", (uint8_t *)&v10, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __99__ML3UpdateSpotlightIndexOperation__indexTracksWithPersistentIDs_playlistsWithPersistentIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_semaphore_t v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to index spotlight track items", (uint8_t *)&v10, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = v3;
    dispatch_semaphore_t v4 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    uint64_t v8 = [*(id *)(a1 + 32) count];
    id v9 = [*(id *)(a1 + 40) bundleIdentifier];
    int v10 = 134218242;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    long long v13 = v9;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Updated %lu track items in spotlight index with bundle ID:%@", (uint8_t *)&v10, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)_deleteIndexedItemsWithEntityStringIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__24607;
  BOOL v23 = __Block_byref_object_dispose__24608;
  id v24 = 0;
  if ([v6 count])
  {
    id v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Started to delete items", buf, 2u);
    }

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = [(ML3UpdateSpotlightIndexOperation *)self index];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__ML3UpdateSpotlightIndexOperation__deleteIndexedItemsWithEntityStringIDs_error___block_invoke;
    v13[3] = &unk_1E5FB7CC0;
    id v14 = v6;
    double v16 = &v25;
    char v17 = &v19;
    int v10 = v8;
    id v15 = v10;
    [v9 deleteSearchableItemsWithIdentifiers:v14 completionHandler:v13];

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v26 + 24);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v11;
}

void __81__ML3UpdateSpotlightIndexOperation__deleteIndexedItemsWithEntityStringIDs_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_semaphore_t v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Failed to delete spotlight items", (uint8_t *)&v9, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = v3;
    dispatch_semaphore_t v4 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    uint64_t v8 = [*(id *)(a1 + 32) count];
    int v9 = 134217984;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation]  ┃  Successfully deleted %lu spotlight index items", (uint8_t *)&v9, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_deleteAllIndexedItemsWithError:(id *)a3
{
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__24607;
  id v20 = __Block_byref_object_dispose__24608;
  id v21 = 0;
  BOOL v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Deleting all indexed items", buf, 2u);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [(ML3UpdateSpotlightIndexOperation *)self index];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__ML3UpdateSpotlightIndexOperation__deleteAllIndexedItemsWithError___block_invoke;
  v11[3] = &unk_1E5FB7CC0;
  v11[4] = self;
  long long v13 = &v22;
  id v14 = &v16;
  uint64_t v8 = v6;
  __int16 v12 = v8;
  [v7 deleteAllSearchableItemsWithCompletionHandler:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v17[5];
  }
  char v9 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v9;
}

void __68__ML3UpdateSpotlightIndexOperation__deleteAllIndexedItemsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_semaphore_t v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Failed to delete spotlight items", (uint8_t *)&v9, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = v3;
    dispatch_semaphore_t v4 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    uint64_t v8 = [*(id *)(a1 + 32) bundleIdentifier];
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Delete all called in spotlight index for bundle ID %{public}@ called", (uint8_t *)&v9, 0xCu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_indexItemsFromLibrarySinceRevision:(int64_t)a3 targetRevision:(int64_t)a4 error:(id *)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  int v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a4;
    _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Will index items with initial revision %lu target revision %lu", buf, 0x16u);
  }

  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 1;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v62 = __Block_byref_object_copy__24607;
  unint64_t v63 = __Block_byref_object_dispose__24608;
  id v64 = 0;
  uint64_t v10 = (void *)MEMORY[0x1B3E93C70]();
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__24607;
  uint64_t v53 = __Block_byref_object_dispose__24608;
  id v54 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__24607;
  uint64_t v47 = __Block_byref_object_dispose__24608;
  id v48 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__24607;
  uint64_t v41 = __Block_byref_object_dispose__24608;
  id v42 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [(ML3DatabaseOperation *)self library];
  uint64_t v12 = [v11 currentRevision];

  uint64_t v33 = 0;
  dispatch_semaphore_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = v12;
  if (a4 | a3) {
    int64_t v13 = a4;
  }
  else {
    int64_t v13 = v12;
  }
  id v14 = [(ML3DatabaseOperation *)self library];
  int64_t v15 = +[ML3Entity revisionTrackingCode];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __93__ML3UpdateSpotlightIndexOperation__indexItemsFromLibrarySinceRevision_targetRevision_error___block_invoke;
  v32[3] = &unk_1E5FB7C98;
  v32[4] = self;
  v32[5] = &v49;
  v32[6] = &v43;
  v32[7] = &v37;
  v32[8] = &v55;
  v32[9] = buf;
  v32[10] = &v33;
  v32[11] = v13;
  [v14 enumeratePersistentIDsAfterRevision:a3 revisionTrackingCode:v15 maximumRevisionType:1 forMediaTypes:0 inUsersLibrary:1 usingBlock:v32];

  if (*((unsigned char *)v56 + 24))
  {
    if ([(ML3UpdateSpotlightIndexOperation *)self isCancelled])
    {
      uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] **The operation was cancelled. Skipping searchable item creation.**", v30, 2u);
      }

      *((unsigned char *)v56 + 24) = 0;
      char v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      id v60 = @"The operation was cancelled on searchable items creation";
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      uint64_t v19 = [v17 errorWithDomain:@"MLDSpotlightIndexOperationErrorDomain" code:1004 userInfo:v18];
      id v20 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v19;
    }
    else
    {
      if (v12 <= v34[3]) {
        uint64_t v21 = v34[3];
      }
      else {
        uint64_t v21 = v12;
      }
      v34[3] = v21;
      uint64_t v22 = v50[5];
      uint64_t v23 = v44[5];
      uint64_t v24 = v38[5];
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:");
      uint64_t v25 = *(void *)&buf[8];
      id obj = *(id *)(*(void *)&buf[8] + 40);
      BOOL v26 = [(ML3UpdateSpotlightIndexOperation *)self _batchIndexWithTrackPersistentIDsToUpdate:v22 playlistsPersistentIDsToUpdateSet:v23 entityStringsToDelete:v24 currentRevision:v18 targetRevision:&unk_1F09124C0 error:&obj];
      objc_storeStrong((id *)(v25 + 40), obj);
      *((unsigned char *)v56 + 24) = v26;
    }

    if (*((unsigned char *)v56 + 24))
    {
      uint64_t v27 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Finished items index batch", v30, 2u);
      }
    }
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v28 = *((unsigned char *)v56 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v55, 8);
  return v28;
}

void __93__ML3UpdateSpotlightIndexOperation__indexItemsFromLibrarySinceRevision_targetRevision_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unint64_t a6, unsigned char *a7)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  if (a6 > 1) {
    goto LABEL_26;
  }
  if (!a5)
  {
    if (a6) {
      uint64_t v13 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v13 = *(void *)(a1 + 40);
    }
    id v14 = *(void **)(*(void *)(v13 + 8) + 40);
    int64_t v15 = [NSNumber numberWithLongLong:a2];
    uint64_t v16 = v14;
    goto LABEL_13;
  }
  if (*(void *)(a1 + 88) < a3)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    if (a6) {
      uint64_t v12 = ML3Container;
    }
    else {
      uint64_t v12 = ML3Track;
    }
    char v17 = [v11 library];
    uint64_t v18 = [v17 libraryUID];
    uint64_t v19 = [(__objc2_class *)v12 URLForEntityWithPersistentID:a2 libraryUID:v18];
    int64_t v15 = [v19 absoluteString];

    if (!v15) {
      goto LABEL_14;
    }
    uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
LABEL_13:
    [v16 addObject:v15];
LABEL_14:
  }
  uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] + v20;
  if ((unint64_t)(v21 + [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]) >= 0x320)
  {
    if ([*(id *)(a1 + 32) isCancelled])
    {
      uint64_t v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] **The operation was cancelled. Stopping searchable item creation**", buf, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v40[0] = @"The operation was cancelled while batching searchable item creation";
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      uint64_t v25 = [v23 errorWithDomain:@"MLDSpotlightIndexOperationErrorDomain" code:1004 userInfo:v24];
      uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;
    }
    else
    {
      context = (void *)MEMORY[0x1B3E93C70]();
      if (*(void *)(a1 + 88) <= a3) {
        uint64_t v28 = 0;
      }
      else {
        uint64_t v28 = *(void *)(a1 + 88);
      }
      id v29 = *(void **)(a1 + 32);
      uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v33 = [NSNumber numberWithLongLong:a3];
      dispatch_semaphore_t v34 = [NSNumber numberWithLongLong:v28];
      uint64_t v35 = *(void *)(*(void *)(a1 + 72) + 8);
      id obj = *(id *)(v35 + 40);
      LOBYTE(v29) = [v29 _batchIndexWithTrackPersistentIDsToUpdate:v30 playlistsPersistentIDsToUpdateSet:v31 entityStringsToDelete:v32 currentRevision:v33 targetRevision:v34 error:&obj];
      objc_storeStrong((id *)(v35 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (_BYTE)v29;

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeAllObjects];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeAllObjects];
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    *a7 = 1;
  }
LABEL_26:
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a3;
}

- (BOOL)_updateIndexedItemsWithIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Checking for updates and deletes for the received identifiers", buf, 2u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
        uint64_t v13 = [(ML3DatabaseOperation *)self library];
        id v14 = +[ML3Entity entityFromURL:v12 inLibrary:v13 verifyExistence:1];

        if (v14)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          uint64_t v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "persistentID"));
          if (isKindOfClass) {
            char v17 = v24;
          }
          else {
            char v17 = v23;
          }
          [v17 addObject:v16];
        }
        else
        {
          [v25 addObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  id v28 = 0;
  BOOL v18 = [(ML3UpdateSpotlightIndexOperation *)self _deleteIndexedItemsWithEntityStringIDs:v25 error:&v28];
  id v19 = v28;
  if (!v19)
  {
    id v27 = 0;
    BOOL v18 = [(ML3UpdateSpotlightIndexOperation *)self _indexTracksWithPersistentIDs:v24 playlistsWithPersistentIDs:v23 error:&v27];
    id v19 = v27;
  }
  uint64_t v20 = v19;
  if (a4) {
    *a4 = v19;
  }

  return v18;
}

- (BOOL)_execute:(id *)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  char v102 = 0;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__24607;
  v97 = __Block_byref_object_dispose__24608;
  id v98 = 0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  uint64_t v7 = [(ML3DatabaseOperation *)self attributes];
  uint64_t v8 = [v7 objectForKey:@"MLDatabaseOperationAttributeBundleIDKey"];
  [(ML3UpdateSpotlightIndexOperation *)self setBundleIdentifier:v8];

  uint64_t v9 = [(ML3UpdateSpotlightIndexOperation *)self bundleIdentifier];
  [(ML3UpdateSpotlightIndexOperation *)self setBundle:_MLDUpdateSpotlightIndexBundleForBundleIdentifier(v9)];

  id v10 = objc_alloc(MEMORY[0x1E4F23838]);
  unint64_t v11 = [(ML3UpdateSpotlightIndexOperation *)self bundle];
  if (v11 == 1)
  {
    uint64_t v12 = @"Music";
  }
  else if (v11 == 2)
  {
    uint64_t v12 = @"Videos";
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Trying create an index name with an unknown bundle", buf, 2u);
    }

    uint64_t v12 = @"Unkown bundle index";
  }
  id v14 = [(ML3UpdateSpotlightIndexOperation *)self bundleIdentifier];
  int64_t v15 = (void *)[v10 initWithName:v12 protectionClass:*MEMORY[0x1E4F28358] bundleIdentifier:v14];
  [(ML3UpdateSpotlightIndexOperation *)self setIndex:v15];

  uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    char v17 = [(ML3UpdateSpotlightIndexOperation *)self bundleIdentifier];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Operation %p started for bundleID %{public}@", buf, 0x16u);
  }
  BOOL v18 = [(ML3DatabaseOperation *)self attributes];
  id v19 = [v18 objectForKey:@"MLDatabaseOperationAttributeEntityURLsArrayKey"];

  if (![v19 count])
  {
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v110 = __Block_byref_object_copy__24607;
    v111 = __Block_byref_object_dispose__24608;
    id v112 = 0;
    uint64_t v25 = [(ML3UpdateSpotlightIndexOperation *)self index];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __45__ML3UpdateSpotlightIndexOperation__execute___block_invoke;
    v87[3] = &unk_1E5FB7C70;
    uint64_t v89 = buf;
    v90 = &v99;
    v91 = &v93;
    uint64_t v26 = v24;
    id v88 = v26;
    [v25 fetchLastClientStateWithCompletionHandler:v87];

    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    if ([(ML3UpdateSpotlightIndexOperation *)self isCancelled])
    {
      id v27 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v105 = 0;
        _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] **The operation was cancelled before the indexed client state was evaluated**", v105, 2u);
      }

      *((unsigned char *)v100 + 24) = 0;
      id v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v103 = *MEMORY[0x1E4F28568];
      v104 = @"The operation was cancelled before the indexed client state was evaluated.";
      long long v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
      uint64_t v30 = [v28 errorWithDomain:@"MLDSpotlightIndexOperationErrorDomain" code:1004 userInfo:v29];
      long long v31 = (void *)v94[5];
      v94[5] = v30;

      goto LABEL_37;
    }
    if (v94[5])
    {
LABEL_37:

      _Block_object_dispose(buf, 8);
      goto LABEL_38;
    }
    uint64_t v32 = *(void *)(*(void *)&buf[8] + 40);
    if (!v32)
    {
      uint64_t v52 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v105 = 0;
        _os_log_impl(&dword_1B022D000, v52, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] No client state indexed, it's a fresh start. Wiping the index and indexing everything", v105, 2u);
      }

      uint64_t v53 = (id *)(v94 + 5);
      id v79 = (id)v94[5];
      BOOL v54 = [(ML3UpdateSpotlightIndexOperation *)self _deleteAllIndexedItemsWithError:&v79];
      objc_storeStrong(v53, v79);
      *((unsigned char *)v100 + 24) = v54;
      if (v54)
      {
        uint64_t v55 = (id *)(v94 + 5);
        id v78 = (id)v94[5];
        BOOL v56 = [(ML3UpdateSpotlightIndexOperation *)self _indexItemsFromLibrarySinceRevision:0 targetRevision:0 error:&v78];
        objc_storeStrong(v55, v78);
        *((unsigned char *)v100 + 24) = v56;
      }
      goto LABEL_37;
    }
    v77 = [MEMORY[0x1E4F28F98] propertyListWithData:v32 options:0 format:0 error:0];
    if (!_NSIsNSDictionary()) {
      goto LABEL_27;
    }
    uint64_t v33 = [v77 objectForKey:@"libraryID"];
    dispatch_semaphore_t v34 = [(ML3DatabaseOperation *)self library];
    uint64_t v35 = [v34 libraryUID];
    int v36 = [v33 isEqualToString:v35];

    if (v36)
    {
      uint64_t v37 = _MLDUpdateSpotlightIndexVersionForBundle([(ML3UpdateSpotlightIndexOperation *)self bundle]);
      uint64_t v38 = [v77 objectForKey:@"version"];
      uint64_t v39 = [v38 longLongValue];

      if (v39 == v37)
      {
        id v40 = [v77 objectForKey:@"revision"];
        uint64_t v41 = [v40 longLongValue];

        id v42 = [v77 objectForKey:@"targetRevision"];
        uint64_t v76 = [v42 longLongValue];

        uint64_t v43 = [(ML3DatabaseOperation *)self library];
        uint64_t v44 = [v43 currentRevision];

        if (v41 == v44)
        {
          uint64_t v45 = _ML3LogCategoryDefault();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v105 = 134217984;
            uint64_t v106 = v41;
            _os_log_impl(&dword_1B022D000, v45, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed database revision and client library revision (%lld) are the same, no index update needed", v105, 0xCu);
          }

          *((unsigned char *)v100 + 24) = 1;
          uint64_t v46 = (void *)v94[5];
          v94[5] = 0;

          goto LABEL_32;
        }
        uint64_t v69 = _ML3LogCategoryDefault();
        BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
        if (v41 < v44)
        {
          if (v70)
          {
            *(_DWORD *)v105 = 134218240;
            uint64_t v106 = v41;
            __int16 v107 = 2048;
            uint64_t v108 = v44;
            _os_log_impl(&dword_1B022D000, v69, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Revisions differ, indexed:%lld current:%lld, updating index with delta changes", v105, 0x16u);
          }

          v71 = (id *)(v94 + 5);
          id v86 = (id)v94[5];
          BOOL v72 = [(ML3UpdateSpotlightIndexOperation *)self _indexItemsFromLibrarySinceRevision:v41 targetRevision:v76 error:&v86];
          objc_storeStrong(v71, v86);
          *((unsigned char *)v100 + 24) = v72;
          goto LABEL_32;
        }
        if (v70)
        {
          *(_DWORD *)v105 = 134218240;
          uint64_t v106 = v41;
          __int16 v107 = 2048;
          uint64_t v108 = v44;
          _os_log_impl(&dword_1B022D000, v69, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed client state %lld is invalid (current library state is: %lld), wiping the index and re-indexing everything", v105, 0x16u);
        }

        id v73 = (id *)(v94 + 5);
        id v85 = (id)v94[5];
        BOOL v74 = [(ML3UpdateSpotlightIndexOperation *)self _deleteAllIndexedItemsWithError:&v85];
        objc_storeStrong(v73, v85);
        *((unsigned char *)v100 + 24) = v74;
        if (!v74) {
          goto LABEL_32;
        }
        id v75 = (id *)(v94 + 5);
        id v84 = (id)v94[5];
        BOOL v51 = [(ML3UpdateSpotlightIndexOperation *)self _indexItemsFromLibrarySinceRevision:0 targetRevision:0 error:&v84];
        objc_storeStrong(v75, v84);
      }
      else
      {
        uint64_t v65 = _ML3LogCategoryDefault();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 134218240;
          uint64_t v106 = v39;
          __int16 v107 = 2048;
          uint64_t v108 = v37;
          _os_log_impl(&dword_1B022D000, v65, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed client state has an index version (%lld) that's not the current (%lld), wiping the index and re-indexing everything", v105, 0x16u);
        }

        uint64_t v66 = (id *)(v94 + 5);
        id v83 = (id)v94[5];
        BOOL v67 = [(ML3UpdateSpotlightIndexOperation *)self _deleteAllIndexedItemsWithError:&v83];
        objc_storeStrong(v66, v83);
        *((unsigned char *)v100 + 24) = v67;
        if (!v67) {
          goto LABEL_32;
        }
        id v68 = (id *)(v94 + 5);
        id v82 = (id)v94[5];
        BOOL v51 = [(ML3UpdateSpotlightIndexOperation *)self _indexItemsFromLibrarySinceRevision:0 targetRevision:0 error:&v82];
        objc_storeStrong(v68, v82);
      }
    }
    else
    {
LABEL_27:
      uint64_t v47 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 138543362;
        uint64_t v106 = (uint64_t)v77;
        _os_log_impl(&dword_1B022D000, v47, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed client state is invalid or indexed library differs from the current library, wiping the index and re-indexing everything. Fetched client state: %{public}@", v105, 0xCu);
      }

      id v48 = (id *)(v94 + 5);
      id v81 = (id)v94[5];
      BOOL v49 = [(ML3UpdateSpotlightIndexOperation *)self _deleteAllIndexedItemsWithError:&v81];
      objc_storeStrong(v48, v81);
      *((unsigned char *)v100 + 24) = v49;
      if (!v49) {
        goto LABEL_32;
      }
      uint64_t v50 = (id *)(v94 + 5);
      id v80 = (id)v94[5];
      BOOL v51 = [(ML3UpdateSpotlightIndexOperation *)self _indexItemsFromLibrarySinceRevision:0 targetRevision:0 error:&v80];
      objc_storeStrong(v50, v80);
    }
    *((unsigned char *)v100 + 24) = v51;
LABEL_32:

    goto LABEL_37;
  }
  uint64_t v20 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [v19 count];
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Index update operation will process %lu items for content updates and deletes", buf, 0xCu);
  }

  uint64_t v22 = (id *)(v94 + 5);
  id obj = (id)v94[5];
  BOOL v23 = [(ML3UpdateSpotlightIndexOperation *)self _updateIndexedItemsWithIdentifiers:v19 error:&obj];
  objc_storeStrong(v22, obj);
  *((unsigned char *)v100 + 24) = v23;
LABEL_38:
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v76);
  double v58 = v57 - v6;
  int v59 = *((unsigned __int8 *)v100 + 24);
  id v60 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
  if (v59)
  {
    if (!v61) {
      goto LABEL_44;
    }
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v58;
    id v62 = "[ML3UpdateSpotlightIndexOperation] Index update operation %p finished successfully in %.3f seconds";
  }
  else
  {
    if (!v61) {
      goto LABEL_44;
    }
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v58;
    id v62 = "[ML3UpdateSpotlightIndexOperation] Index update operation %p failed in %.3f seconds";
  }
  _os_log_impl(&dword_1B022D000, v60, OS_LOG_TYPE_DEFAULT, v62, buf, 0x16u);
LABEL_44:

  if (a3) {
    *a3 = (id) v94[5];
  }
  BOOL v63 = *((unsigned char *)v100 + 24) != 0;

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);
  return v63;
}

void __45__ML3UpdateSpotlightIndexOperation__execute___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Indexed client state fetch failed, failing the operation.", v10, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v9 = a1 + 56;
  }
  else
  {
    uint64_t v9 = a1 + 40;
    a3 = a2;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v9 + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)type
{
  return 4;
}

@end