void sub_100004054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004088(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004098(uint64_t a1)
{
}

void sub_1000040A0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [*(id *)(a1 + 32) currentFetchRequest];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 count] == 0;
  uint64_t v6 = [v5 mt_compactMap:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [*(id *)(a1 + 32) _entitiesByRemovingAlreadyProcessedFrom:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

id sub_10000434C(id a1, NSManagedObject *a2)
{
  v2 = a2;

  return v2;
}

uint64_t sub_100004374(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8) - 1;
    if (0x8F5C28F5C28F5C29 * v3 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70)
    {
      uint64_t v4 = _MTLogCategorySpotlight();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = +[NSNumber numberWithInteger:v3];
        uint64_t v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) count]);
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 138412802;
        uint64_t v9 = v5;
        __int16 v10 = 2112;
        v11 = v6;
        __int16 v12 = 2112;
        uint64_t v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Indexing] *** batch processing - continuing batch #%@ with %@ entities [%@]", (uint8_t *)&v8, 0x20u);
      }
      uint64_t result = *(void *)(a1 + 56);
    }
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 48), *(void *)(a1 + 40));
  }
  return result;
}

uint64_t sub_100004720(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 externallyProcessedMOIDs];
  v5 = [v3 objectID];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

void sub_100004858(id a1)
{
  qword_10001A3A8 = (uint64_t)dispatch_queue_create(0, 0);

  _objc_release_x1();
}

uint64_t sub_100004894(uint64_t result)
{
  uint64_t v1 = MTCoreSpotlightIndexBatchGeneratorNextDebugID;
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = MTCoreSpotlightIndexBatchGeneratorNextDebugID;
  MTCoreSpotlightIndexBatchGeneratorNextDebugID = v1 + 1;
  return result;
}

NSString *__cdecl sub_1000059C4(id a1, NSSortDescriptor *a2)
{
  return [(NSSortDescriptor *)a2 key];
}

void sub_10000612C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006144(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[MTRecencyUtil upNextForPodcastUuid:v2 excludeExplicit:0 ctx:*(void *)(a1 + 40)];

  uint64_t v4 = [v3 episodeUuid];
  v5 = [*(id *)(a1 + 32) nextEpisodeUuid];
  uint64_t v6 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) uuid];
    int v8 = [v3 episodeUuid];
    [v3 modifiedDate];
    int v14 = 138543874;
    v15 = v7;
    __int16 v16 = 2114;
    v17 = v8;
    __int16 v18 = 2050;
    uint64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "UpNext result from update cursor position for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", (uint8_t *)&v14, 0x20u);
  }
  __int16 v10 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v3 episodeUuid];
    int v14 = 138543618;
    v15 = v5;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    __int16 v12 = [*(id *)(a1 + 40) episodeForUuid:v4];
    uint64_t v13 = [*(id *)(a1 + 40) episodeForUuid:v5];
    if ([v13 listenNowEpisode])
    {
      [v13 setListenNowEpisode:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (v12 && ([v12 listenNowEpisode] & 1) == 0)
    {
      [v12 setListenNowEpisode:1];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      [v3 modifiedDate];
      [*(id *)(a1 + 32) setModifiedDate:];
    }
  }
  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) saveInCurrentBlock];
  }
}

void sub_100006534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000654C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000655C(uint64_t a1)
{
}

void sub_100006564(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) podcastForFeedUrl:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100006998(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1000069B0(uint64_t a1)
{
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  uint64_t v4 = +[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:v3];
  [v2 setPredicate:v4];

  [v2 setFetchLimit:1];
  id v5 = *(void **)(a1 + 40);
  id v8 = 0;
  uint64_t v6 = [v5 executeFetchRequest:v2 error:&v8];
  id v7 = v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 count] != 0;

  [v7 logAndThrow:0];
}

void sub_100006C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006C20(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchRequestForDistinctSeasons];
  uint64_t v3 = *(void **)(a1 + 40);
  id v9 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v2 error:&v9];
  id v5 = v9;
  [v5 logAndThrow:0];
  uint64_t v6 = [v4 valueForKey:kEpisodeSeasonNumber];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_100006E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006E40(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) predicateForPodcast:*(void *)(a1 + 40)];
  uint64_t v2 = +[MTEpisode predicateForEpisodeType:1];
  uint64_t v3 = +[MTEpisode predicateForSeasonNumberWithNoEpisodeNumber:*(void *)(a1 + 64)];
  uint64_t v4 = [v10 AND:v2];
  id v5 = [v4 AND:v3];

  uint64_t v6 = +[MTEpisode sortDescriptorsForPubDateAscending:0];
  uint64_t v7 = [*(id *)(a1 + 48) objectsInEntity:kMTEpisodeEntityName predicate:v5 sortDescriptors:v6 returnsObjectsAsFaults:0 limit:1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

id sub_1000070C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) allObjects];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007198;
  v8[3] = &unk_1000146F8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 mt_compactMap:v8];

  return v6;
}

id sub_100007198(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) playlistForUuid:a2];
}

void sub_100007268(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasBeenIndexed])
  {
    uint64_t v2 = _MTLogCategorySpotlight();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[IndexAll] bailing.  already indexed...", (uint8_t *)&v15, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return;
  }
  uint64_t v3 = [*(id *)(a1 + 32) indexAllBatchGenerator];
  if (!v3
    || (uint64_t v4 = (void *)v3,
        [*(id *)(a1 + 32) indexAllBatchGenerator],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 finished],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    uint64_t v7 = [*(id *)(a1 + 32) savedPartialUploadStateIndexPath];
    uint64_t v8 = [[MTCoreSpotlightIndexBatchGenerator alloc] initWithStartingIndexPath:v7];
    [*(id *)(a1 + 32) setIndexAllBatchGenerator:v8];
    id v9 = [*(id *)(a1 + 32) indexAllBatchGenerator];
    id v10 = [v9 indexAllCompletions];
    id v11 = objc_retainBlock(*(id *)(a1 + 40));
    [v10 addObject:v11];

    __int16 v12 = _MTLogCategorySpotlight();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      __int16 v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Indexing] *** scheduling indexAll in batches [%@] ***", (uint8_t *)&v15, 0xCu);
    }

    [*(id *)(a1 + 32) _onIndexingQueueHandleNextBatchOrUpdateRequest];
    goto LABEL_14;
  }
  uint64_t v13 = _MTLogCategorySpotlight();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[IndexAll] bailing.  already running...", (uint8_t *)&v15, 2u);
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 32) indexAllBatchGenerator];
    uint64_t v8 = [v7 indexAllCompletions];
    id v14 = objc_retainBlock(*(id *)(a1 + 40));
    [(MTCoreSpotlightIndexBatchGenerator *)v8 addObject:v14];

LABEL_14:
  }
}

void sub_1000075EC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasDeferredIndexAll])
  {
    _MTLogCategorySpotlight();
    uint64_t v2 = (MTCSUpdateIndexRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v2->super, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(MTCSUpdateIndexRequest **)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, &v2->super, OS_LOG_TYPE_DEFAULT, "[Update] Dropping index request (reason '%@') since we haven't yet received the initial indexAllData", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    uint64_t v2 = [[MTCSUpdateIndexRequest alloc] initWithReason:*(void *)(a1 + 40) entityLoadingBlock:*(void *)(a1 + 56) searchableIndex:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
    uint64_t v4 = [*(id *)(a1 + 32) updateIndexRequests];
    [v4 addObject:v2];

    id v5 = _MTLogCategorySpotlight();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Indexing] *** scheduling update [%@] ***", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) _onIndexingQueueHandleNextBatchOrUpdateRequest];
  }
}

void sub_100007970(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000079F8;
  v2[3] = &unk_1000147D8;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t sub_1000079F8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

void sub_100007C18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entityLoadingBlock];
  id v3 = v2[2](v2, *(void *)(a1 + 40));

  uint64_t v4 = _MTLogCategorySpotlight();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Indexing] *** handling update [BEGIN] [%@] ***", buf, 0xCu);
  }

  int v6 = [*(id *)(a1 + 48) indexAllBatchGenerator];

  if (v6)
  {
    uint64_t v7 = [v3 mt_compactMap:&stru_100014840];
    uint64_t v8 = [*(id *)(a1 + 48) indexAllBatchGenerator];
    [v8 markUpdateUnnecessaryForObjectIDs:v7];
  }
  id v9 = [*(id *)(a1 + 48) annotator];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007DF0;
  v11[3] = &unk_1000148B8;
  id v10 = *(void **)(a1 + 56);
  v11[4] = *(void *)(a1 + 48);
  id v12 = v10;
  id v13 = *(id *)(a1 + 32);
  +[MTCoreSpotlightUtil prepareSearchableItemsForObjectInArray:v3 annotator:v9 completion:v11];
}

NSManagedObjectID *__cdecl sub_100007DE8(id a1, NSManagedObject *a2)
{
  return [(NSManagedObject *)a2 objectID];
}

void sub_100007DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007F7C;
  v10[3] = &unk_100014868;
  id v11 = *(id *)(a1 + 48);
  [v4 searchableIndex:v5 indexSearchableItems:a2 completionHandler:v10];
  int v6 = _MTLogCategorySpotlight();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Indexing] *** handling update [DONE] [%@] ***", buf, 0xCu);
  }

  uint64_t v8 = [*(id *)(a1 + 32) indexingQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007FFC;
  v9[3] = &unk_100014890;
  v9[4] = *(void *)(a1 + 32);
  dispatch_async(v8, v9);
}

void sub_100007F7C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) completion];
    v3[2]();
  }
}

id sub_100007FFC(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasIndexingOperationInProgress:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _onIndexingQueueHandleNextBatchOrUpdateRequest];
}

id sub_100008114(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _startProcessNextBatchInGenerator:*(void *)(a1 + 40) searchableIndex:*(void *)(a1 + 48)];
}

void sub_1000081E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  int v6 = [v4 annotator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000082C0;
  v9[3] = &unk_1000148B8;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  id v12 = *(id *)(a1 + 48);
  +[MTCoreSpotlightUtil prepareSearchableItemsForObjectInArray:v5 annotator:v6 completion:v9];
}

void sub_1000082C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] && !objc_msgSend(*(id *)(a1 + 32), "finished"))
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000083AC;
    v7[3] = &unk_100014930;
    v7[4] = v5;
    id v8 = *(id *)(a1 + 32);
    [v5 searchableIndex:v6 indexSearchableItems:v3 completionHandler:v7];
  }
  else
  {
    if ([*(id *)(a1 + 32) canceled]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 4;
    }
    [*(id *)(a1 + 40) _didCompleteBatchProcessingBatchGenerator:*(void *)(a1 + 32) state:v4 error:0];
  }
}

void sub_1000083AC(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _didCompleteBatchProcessingBatchGenerator:v4 state:3 error:a2];
  }
  else
  {
    id v5 = [v3 indexingQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008480;
    v8[3] = &unk_100014800;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    dispatch_async(v5, v8);
  }
}

void sub_100008480(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nextIndexPath];
  [*(id *)(a1 + 40) savePartialUploadStateIndexPath:v2];
  [*(id *)(a1 + 40) setHasIndexingOperationInProgress:0];
  [*(id *)(a1 + 40) _onIndexingQueueHandleNextBatchOrUpdateRequest];
}

id sub_1000085EC(uint64_t a1)
{
  id v2 = _MTLogCategorySpotlight();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = *(void *)(a1 + 56) - 1;
    if (v3 > 3) {
      CFStringRef v4 = @"inactive";
    }
    else {
      CFStringRef v4 = off_100014AD8[v3];
    }
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138412546;
    CFStringRef v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Indexing] *** completed indexAll (%@) in batches [%@] ***", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [*(id *)(a1 + 40) indexAllBatchGenerator];
  uint64_t v7 = *(void **)(a1 + 32);

  if (v6 == v7) {
    [*(id *)(a1 + 40) setIndexAllBatchGenerator:0];
  }
  [*(id *)(a1 + 40) _onQueuePerformCompletionsForGenerator:*(void *)(a1 + 32) error:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setHasIndexingOperationInProgress:0];
  return [*(id *)(a1 + 40) _onIndexingQueueHandleNextBatchOrUpdateRequest];
}

void sub_1000089AC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100008A6C;
    v5[3] = &unk_1000149C8;
    id v6 = *(id *)(a1 + 48);
    [v2 indexSearchableItems:v3 completionHandler:v5];
  }
  else
  {
    CFStringRef v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

uint64_t sub_100008A6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008B50(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) searchableIndex];
    uint64_t v3 = [*(id *)(a1 + 40) allObjects];
    [v4 deleteSearchableItemsWithIdentifiers:v3 completionHandler:0];
  }
}

void sub_100008DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008DF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008E00(uint64_t a1)
{
}

void sub_100008E08(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) changesForEntityName:kMTPodcastEntityName];
  uint64_t v3 = [v2 updatedObjectIDs];
  id v4 = +[NSMutableSet setWithSet:v3];

  uint64_t v5 = [*(id *)(a1 + 32) changesForEntityName:kMTEpisodeEntityName];
  id v6 = [v5 updatedObjectIDs];
  [v4 unionSet:v6];

  uint64_t v7 = [*(id *)(a1 + 32) changesForEntityName:kMTPlaylistEntityName];
  id v8 = [v7 updatedObjectIDs];
  [v4 unionSet:v8];

  int v9 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) existingObjectWithID:*(void *)(*((void *)&v19 + 1) + 8 * (void)v14) error:0];
        if (v15) {
          [v9 addObject:v15];
        }

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  __int16 v16 = [v9 allObjects];
  v17 = [*(id *)(a1 + 40) annotator];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000090A4;
  v18[3] = &unk_100014A18;
  v18[4] = *(void *)(a1 + 40);
  +[MTCoreSpotlightUtil prepareSearchableItemsForObjectInArray:v16 annotator:v17 completion:v18];
}

void sub_1000090A4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 searchableIndex];
  [v2 searchableIndex:v4 indexSearchableItems:v3 completionHandler:0];
}

void sub_1000091E8(uint64_t a1)
{
  id v2 = _MTLogCategorySpotlight();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Indexing] *** received indexAll request ***", buf, 2u);
  }

  [*(id *)(a1 + 32) _onQueueCancelCurrentReindexAll];
  [*(id *)(a1 + 32) clearHasBeenIndexed];
  [*(id *)(a1 + 32) clearPartialUploadState];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000092E0;
  v5[3] = &unk_1000149C8;
  id v6 = *(id *)(a1 + 48);
  [v3 indexAllDataWithSearchableIndex:v4 completionHandler:v5];
}

uint64_t sub_1000092E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000093F4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  id v3 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v20 = a1;
  id v21 = objc_alloc_init((Class)NSMutableSet);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v9, "length", v20) >= 2)
        {
          id v10 = [v9 substringFromIndex:1];
          unsigned __int8 v11 = [v9 hasPrefix:@"p"];
          id v12 = v2;
          if ((v11 & 1) != 0
            || (v13 = [v9 hasPrefix:@"e"], id v12 = v3, (v13 & 1) != 0)
            || (v14 = [v9 hasPrefix:@"s"], id v12 = v21, v14))
          {
            [v12 addObject:v10];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }

  uint64_t v15 = *(void **)(v20 + 40);
  uint64_t v16 = *(void *)(v20 + 48);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000096A0;
  v24[3] = &unk_100014A68;
  id v25 = v2;
  id v26 = v3;
  id v27 = v21;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100009938;
  v22[3] = &unk_100014A90;
  id v23 = *(id *)(v20 + 56);
  id v17 = v21;
  id v18 = v3;
  id v19 = v2;
  [v15 updateSearchableIndexWithReason:@"System Re-index request" searchableIndex:v16 entityLoadingBlock:v24 completion:v22];
}

id sub_1000096A0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSPredicate predicateWithFormat:@"%K IN %@", kPodcastFeedUrl, a1[4]];
  id v5 = +[MTCoreSpotlightUtil fetchRequestForIndexType:0 additionalPredicate:v4];
  v28[0] = v5;
  id v6 = +[NSPredicate predicateWithFormat:@"%K IN %@", kEpisodeGuid, a1[5]];
  uint64_t v7 = +[MTCoreSpotlightUtil fetchRequestForIndexType:1 additionalPredicate:v6];
  v28[1] = v7;
  id v8 = +[NSPredicate predicateWithFormat:@"%K IN %@", kPlaylistUuid, a1[6]];
  int v9 = +[MTCoreSpotlightUtil fetchRequestForIndexType:2 additionalPredicate:v8];
  v28[2] = v9;
  id v10 = +[NSArray arrayWithObjects:v28 count:3];

  unsigned __int8 v11 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v22 = 0;
        id v18 = [v3 executeFetchRequest:v17 error:&v22];
        id v19 = v22;
        uint64_t v20 = v19;
        if (v19) {
          [v19 logAndThrow:1];
        }
        if (v18) {
          [v11 addObjectsFromArray:v18];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  return v11;
}

uint64_t sub_100009938(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10000A5D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A5E0(uint64_t a1)
{
}

void sub_10000A5E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 32);
  if (!v2) {
    id v2 = *(void **)(v1 + 56);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void sub_10000A6B8(uint64_t a1)
{
  id v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: Setting active account: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

void sub_10000A8A4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasFetchedInitialAccount] & 1) == 0) {
    [*(id *)(a1 + 32) _updateActiveAccount];
  }
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A958;
    block[3] = &unk_100014A90;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t sub_10000A958(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000ACBC(uint64_t a1)
{
  id v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: updating active account", v7, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) _activeAccountBlocking];
  int v4 = [v3 ams_DSID];
  uint64_t v5 = [v4 stringValue];

  unint64_t v6 = *(void *)(a1 + 40);
  if (v6 | v5 && ([(id)v6 isEqualToString:v5] & 1) == 0) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100014B30);
  }
  [*(id *)(a1 + 32) setActiveAccount:v3];
  [*(id *)(a1 + 32) setHasFetchedInitialAccount:1];
}

void sub_10000ADA8(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"AccountDSIDChangedNotification" object:0];
}

void sub_10000B3D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000B488;
    v5[3] = &unk_100014800;
    int v4 = *(NSObject **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    id v7 = v3;
    dispatch_sync(v4, v5);
  }
}

id sub_10000B488(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void sub_10000B494(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B578;
  v6[3] = &unk_100014B80;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  +[MTCoreSpotlightUtil prepareSearchableItemForObject:v3 annotator:v5 completion:v6];
}

void sub_10000B578(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

uint64_t sub_10000B5BC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10000B8E4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000B8FC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
  else
  {
    int v4 = +[MTImageStore defaultStore];
    uint64_t v5 = kMTLibraryDefaultImageKey;
    double v6 = *(double *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000BA04;
    v7[3] = &unk_100014C20;
    id v8 = *(id *)(a1 + 32);
    [v4 asyncImageURLForKey:v5 squareDimension:0 cacheKeyModifier:v7 completionHandler:v6];
  }
}

uint64_t sub_10000BA04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000C09C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 attributeSet];
  [v5 setThumbnailURL:v4];

  double v6 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v6();
}

uint64_t sub_10000C6C4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 attributeSet];
  [v5 setThumbnailURL:v4];

  double v6 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v6();
}

CSSearchableItem __swiftcall AppCoreSpotlightEntityAnnotator.annotate(item:with:)(CSSearchableItem item, NSManagedObject with)
{
  id v2 = (void *)sub_10000CBA0((uint64_t)item.super.isa, with.super.isa);

  return (CSSearchableItem)v2;
}

id AppCoreSpotlightEntityAnnotator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id AppCoreSpotlightEntityAnnotator.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppCoreSpotlightEntityAnnotator();
  return [super init];
}

id AppCoreSpotlightEntityAnnotator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppCoreSpotlightEntityAnnotator();
  return [super dealloc];
}

uint64_t sub_10000CBA0(uint64_t a1, void *a2)
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    *((void *)&v10 + 1) = sub_10000D0A0();
    uint64_t v11 = sub_10000D008(&qword_10001A398, (void (*)(uint64_t))&type metadata accessor for EpisodeEntity);
    sub_10000CEF8((uint64_t *)&v9);
    id v4 = a2;
    sub_10000D090();
  }
  else
  {
    self;
    if (swift_dynamicCastObjCClass())
    {
      *((void *)&v10 + 1) = sub_10000D060();
      uint64_t v11 = sub_10000D008(&qword_10001A390, (void (*)(uint64_t))&type metadata accessor for ShowEntity);
      sub_10000CEF8((uint64_t *)&v9);
      id v5 = a2;
      sub_10000D050();
    }
    else
    {
      self;
      if (swift_dynamicCastObjCClass())
      {
        *((void *)&v10 + 1) = sub_10000D080();
        uint64_t v11 = sub_10000D008(&qword_10001A388, (void (*)(uint64_t))&type metadata accessor for ChannelEntity);
        sub_10000CEF8((uint64_t *)&v9);
        id v6 = a2;
        sub_10000D070();
      }
      else
      {
        self;
        if (!swift_dynamicCastObjCClass())
        {
          uint64_t v11 = 0;
          long long v9 = 0u;
          long long v10 = 0u;
          sub_10000CE54((uint64_t)&v9);
          return a1;
        }
        *((void *)&v10 + 1) = sub_10000D0C0();
        uint64_t v11 = sub_10000D008(&qword_10001A380, (void (*)(uint64_t))&type metadata accessor for StationEntity);
        sub_10000CEF8((uint64_t *)&v9);
        id v7 = a2;
        sub_10000D0B0();
      }
    }
  }
  sub_10000CF5C(&v9, (uint64_t)v12);
  sub_10000CF74(v12, v12[3]);
  sub_10000D0D0();
  sub_10000CFB8(v12);
  return a1;
}

uint64_t type metadata accessor for AppCoreSpotlightEntityAnnotator()
{
  return self;
}

uint64_t sub_10000CE54(uint64_t a1)
{
  uint64_t v2 = sub_10000CEB4(&qword_10001A378);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000CEB4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_10000CEF8(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000CF5C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10000CF74(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000CFB8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000D008(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D050()
{
  return ShowEntity.init(model:)();
}

uint64_t sub_10000D060()
{
  return type metadata accessor for ShowEntity();
}

uint64_t sub_10000D070()
{
  return ChannelEntity.init(model:)();
}

uint64_t sub_10000D080()
{
  return type metadata accessor for ChannelEntity();
}

uint64_t sub_10000D090()
{
  return EpisodeEntity.init(model:)();
}

uint64_t sub_10000D0A0()
{
  return type metadata accessor for EpisodeEntity();
}

uint64_t sub_10000D0B0()
{
  return StationEntity.init(model:)();
}

uint64_t sub_10000D0C0()
{
  return type metadata accessor for StationEntity();
}

uint64_t sub_10000D0D0()
{
  return CSSearchableItem.associateAppEntity<A>(_:priority:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t NSPersistentStringForMTDisplayType()
{
  return _NSPersistentStringForMTDisplayType();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MTLogCategoryDatabase()
{
  return __MTLogCategoryDatabase();
}

uint64_t _MTLogCategoryDefault()
{
  return __MTLogCategoryDefault();
}

uint64_t _MTLogCategorySpotlight()
{
  return __MTLogCategorySpotlight();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

id objc_msgSend_AND_(void *a1, const char *a2, ...)
{
  return [a1 AND:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__activeAccountBlocking(void *a1, const char *a2, ...)
{
  return _[a1 _activeAccountBlocking];
}

id objc_msgSend__didCompleteBatchProcessingBatchGenerator_state_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didCompleteBatchProcessingBatchGenerator:state:error:");
}

id objc_msgSend__entitiesByRemovingAlreadyProcessedFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entitiesByRemovingAlreadyProcessedFrom:");
}

id objc_msgSend__fetchRequestForDistinctSeasons(void *a1, const char *a2, ...)
{
  return _[a1 _fetchRequestForDistinctSeasons];
}

id objc_msgSend__onIndexingQueueHandleNextBatchOrUpdateRequest(void *a1, const char *a2, ...)
{
  return _[a1 _onIndexingQueueHandleNextBatchOrUpdateRequest];
}

id objc_msgSend__onIndexingQueuePerformUpdateRequest_(void *a1, const char *a2, ...)
{
  return [_onIndexingQueuePerformUpdateRequest:];
}

id objc_msgSend__onQueueCancelCurrentReindexAll(void *a1, const char *a2, ...)
{
  return _[a1 _onQueueCancelCurrentReindexAll];
}

id objc_msgSend__onQueuePerformCompletionsForGenerator_error_(void *a1, const char *a2, ...)
{
  return [_onQueuePerformCompletionsForGenerator:error:];
}

id objc_msgSend__onQueueStartProcessNextBatchInGenerator_searchableIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueStartProcessNextBatchInGenerator:searchableIndex:");
}

id objc_msgSend__prepareToHandleNextBatchWithReadyBlock_(void *a1, const char *a2, ...)
{
  return [a1 _prepareToHandleNextBatchWithReadyBlock:];
}

id objc_msgSend__uniqueIdentifierForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uniqueIdentifierForPodcast:");
}

id objc_msgSend__updateActiveAccount(void *a1, const char *a2, ...)
{
  return _[a1 _updateActiveAccount];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeAccount];
}

id objc_msgSend_activeDsid(void *a1, const char *a2, ...)
{
  return _[a1 activeDsid];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _[a1 adamID];
}

id objc_msgSend_addChangeNotifier_(void *a1, const char *a2, ...)
{
  return [a1 addChangeNotifier:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return [a1 ams_DSID];
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return [a1 ams_activeiTunesAccount];
}

id objc_msgSend_ams_fullName(void *a1, const char *a2, ...)
{
  return [a1 ams_fullName];
}

id objc_msgSend_ams_isManagedAppleID(void *a1, const char *a2, ...)
{
  return [a1 ams_isManagedAppleID];
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return [a1 ams_sharedAccountStore];
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return [a1 ams_storefront];
}

id objc_msgSend_annotateItem_withManagedObject_(void *a1, const char *a2, ...)
{
  return [a1 annotateItem:withManagedObject:];
}

id objc_msgSend_annotator(void *a1, const char *a2, ...)
{
  return _[a1 annotator];
}

id objc_msgSend_applyShowTypeSetting_(void *a1, const char *a2, ...)
{
  return [a1 applyShowTypeSetting:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return _[a1 assetURL];
}

id objc_msgSend_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 asyncImageURLForKey:squareDimension:cacheKeyModifier:completionHandler:];
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return _[a1 attributeSet];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return _[a1 author];
}

id objc_msgSend_bestDescription(void *a1, const char *a2, ...)
{
  return _[a1 bestDescription];
}

id objc_msgSend_bestSummary(void *a1, const char *a2, ...)
{
  return _[a1 bestSummary];
}

id objc_msgSend_bestTitle(void *a1, const char *a2, ...)
{
  return _[a1 bestTitle];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_canExtensionOpenDatabase(void *a1, const char *a2, ...)
{
  return _[a1 canExtensionOpenDatabase];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _[a1 canceled];
}

id objc_msgSend_changesForEntityName_(void *a1, const char *a2, ...)
{
  return [a1 changesForEntityName:];
}

id objc_msgSend_clearHasBeenIndexed(void *a1, const char *a2, ...)
{
  return _[a1 clearHasBeenIndexed];
}

id objc_msgSend_clearPartialUploadState(void *a1, const char *a2, ...)
{
  return _[a1 clearPartialUploadState];
}

id objc_msgSend_collectNextBatch_(void *a1, const char *a2, ...)
{
  return [a1 collectNextBatch:];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_configureArtworkForSearchableItemAttributeSet_withPodcastUuid_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureArtworkForSearchableItemAttributeSet:withPodcastUuid:completion:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentFeedURL(void *a1, const char *a2, ...)
{
  return _[a1 currentFeedURL];
}

id objc_msgSend_currentFetchRequest(void *a1, const char *a2, ...)
{
  return _[a1 currentFetchRequest];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return _[a1 databaseID];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_deleteSearchableItemsWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteSearchableItemsWithIdentifiers:completionHandler:];
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 didChangeValueForKey:];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_downloadDate(void *a1, const char *a2, ...)
{
  return _[a1 downloadDate];
}

id objc_msgSend_downloadedDate(void *a1, const char *a2, ...)
{
  return _[a1 downloadedDate];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_entityLoadingBlock(void *a1, const char *a2, ...)
{
  return _[a1 entityLoadingBlock];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_episodeForUuid_(void *a1, const char *a2, ...)
{
  return [a1 episodeForUuid:];
}

id objc_msgSend_episodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 episodeUuid];
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 executeFetchRequest:error:];
}

id objc_msgSend_existingObjectWithID_error_(void *a1, const char *a2, ...)
{
  return [a1 existingObjectWithID:error:];
}

id objc_msgSend_externalType(void *a1, const char *a2, ...)
{
  return _[a1 externalType];
}

id objc_msgSend_externallyProcessedMOIDs(void *a1, const char *a2, ...)
{
  return _[a1 externallyProcessedMOIDs];
}

id objc_msgSend_feedChangedDate(void *a1, const char *a2, ...)
{
  return _[a1 feedChangedDate];
}

id objc_msgSend_feedURL(void *a1, const char *a2, ...)
{
  return _[a1 feedURL];
}

id objc_msgSend_fetchRequestForIndexType_(void *a1, const char *a2, ...)
{
  return [a1 fetchRequestForIndexType:];
}

id objc_msgSend_fetchRequestForIndexType_additionalPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestForIndexType:additionalPredicate:");
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return [a1 fetchRequestWithEntityName:];
}

id objc_msgSend_findEpisodeWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 findEpisodeWithRequest:];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _[a1 finished];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_generatedDate(void *a1, const char *a2, ...)
{
  return _[a1 generatedDate];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return _[a1 guid];
}

id objc_msgSend_hasBeenIndexed(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenIndexed];
}

id objc_msgSend_hasDeferredIndexAll(void *a1, const char *a2, ...)
{
  return _[a1 hasDeferredIndexAll];
}

id objc_msgSend_hasFetchedInitialAccount(void *a1, const char *a2, ...)
{
  return _[a1 hasFetchedInitialAccount];
}

id objc_msgSend_hasHTML(void *a1, const char *a2, ...)
{
  return _[a1 hasHTML];
}

id objc_msgSend_hasIndexingOperationInProgress(void *a1, const char *a2, ...)
{
  return _[a1 hasIndexingOperationInProgress];
}

id objc_msgSend_hasInsertsForEntityNames_(void *a1, const char *a2, ...)
{
  return [a1 hasInsertsForEntityNames:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_iTunesAccountDidChangeForACAccountNotification_(void *a1, const char *a2, ...)
{
  return [a1 iTunesAccountDidChangeForACAccountNotification:];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _[a1 identifiers];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
}

id objc_msgSend_importContext(void *a1, const char *a2, ...)
{
  return _[a1 importContext];
}

id objc_msgSend_indexAllBatchGenerator(void *a1, const char *a2, ...)
{
  return _[a1 indexAllBatchGenerator];
}

id objc_msgSend_indexAllCompletions(void *a1, const char *a2, ...)
{
  return _[a1 indexAllCompletions];
}

id objc_msgSend_indexAllDataWithSearchableIndex_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAllDataWithSearchableIndex:completionHandler:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForRow:inSection:];
}

id objc_msgSend_indexSearchableItems_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSearchableItems:completionHandler:");
}

id objc_msgSend_indexingQueue(void *a1, const char *a2, ...)
{
  return _[a1 indexingQueue];
}

id objc_msgSend_initWithAnnotator_(void *a1, const char *a2, ...)
{
  return [a1 initWithAnnotator:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithEntityName_(void *a1, const char *a2, ...)
{
  return [a1 initWithEntityName:];
}

id objc_msgSend_initWithItemContentType_(void *a1, const char *a2, ...)
{
  return [a1 initWithItemContentType:];
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 initWithKey:ascending:];
}

id objc_msgSend_initWithName_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:bundleIdentifier:];
}

id objc_msgSend_initWithReason_entityLoadingBlock_searchableIndex_completion_(void *a1, const char *a2, ...)
{
  return [a1 initWithReason:entityLoadingBlock:searchableIndex:completion:];
}

id objc_msgSend_initWithStartingIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithStartingIndexPath:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isDownloaded(void *a1, const char *a2, ...)
{
  return _[a1 isDownloaded];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isExplicit(void *a1, const char *a2, ...)
{
  return _[a1 isExplicit];
}

id objc_msgSend_isSerialShowTypeInFeed(void *a1, const char *a2, ...)
{
  return _[a1 isSerialShowTypeInFeed];
}

id objc_msgSend_isUserLoggedIn(void *a1, const char *a2, ...)
{
  return _[a1 isUserLoggedIn];
}

id objc_msgSend_isValidShowTypeSetting_(void *a1, const char *a2, ...)
{
  return [a1 isValidShowTypeSetting:];
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return _[a1 itemDescription];
}

id objc_msgSend_lastDatePlayed(void *a1, const char *a2, ...)
{
  return _[a1 lastDatePlayed];
}

id objc_msgSend_lastImplicitlyFollowedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastImplicitlyFollowedDate];
}

id objc_msgSend_lastTouchDate(void *a1, const char *a2, ...)
{
  return _[a1 lastTouchDate];
}

id objc_msgSend_latestSeasonNumber(void *a1, const char *a2, ...)
{
  return _[a1 latestSeasonNumber];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lenientSharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 lenientSharedInstance];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _[a1 library];
}

id objc_msgSend_listenNowEpisode(void *a1, const char *a2, ...)
{
  return _[a1 listenNowEpisode];
}

id objc_msgSend_logAndThrow_(void *a1, const char *a2, ...)
{
  return [a1 logAndThrow:];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectContext];
}

id objc_msgSend_markHasBeenIndexed(void *a1, const char *a2, ...)
{
  return _[a1 markHasBeenIndexed];
}

id objc_msgSend_markPlaylistsForUpdate(void *a1, const char *a2, ...)
{
  return _[a1 markPlaylistsForUpdate];
}

id objc_msgSend_markSubscriptionSyncDirty_for_(void *a1, const char *a2, ...)
{
  return [a1 markSubscriptionSyncDirty:for:];
}

id objc_msgSend_markUpdateUnnecessaryForObjectIDs_(void *a1, const char *a2, ...)
{
  return [a1 markUpdateUnnecessaryForObjectIDs];
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return _[a1 modifiedDate];
}

id objc_msgSend_mt_compactMap_(void *a1, const char *a2, ...)
{
  return [a1 mt_compactMap:];
}

id objc_msgSend_mt_filter_(void *a1, const char *a2, ...)
{
  return [a1 mt_filter:];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return _[a1 needsUpdate];
}

id objc_msgSend_newestEpisodeWithFilter_(void *a1, const char *a2, ...)
{
  return [a1 newestEpisodeWithFilter:];
}

id objc_msgSend_nextBatchWithTransformationBlock_(void *a1, const char *a2, ...)
{
  return [a1 nextBatchWithTransformationBlock:];
}

id objc_msgSend_nextEpisodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 nextEpisodeUuid];
}

id objc_msgSend_nextIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 nextIndexPath];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return _[a1 objectID];
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_returnsObjectsAsFaults_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return [a1 performBlock:];
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return [a1 performBlockAndWait:];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_playCount(void *a1, const char *a2, ...)
{
  return _[a1 playCount];
}

id objc_msgSend_playState(void *a1, const char *a2, ...)
{
  return _[a1 playState];
}

id objc_msgSend_playbackNewestToOldest(void *a1, const char *a2, ...)
{
  return _[a1 playbackNewestToOldest];
}

id objc_msgSend_playlist(void *a1, const char *a2, ...)
{
  return _[a1 playlist];
}

id objc_msgSend_playlistIfDefault(void *a1, const char *a2, ...)
{
  return _[a1 playlistIfDefault];
}

id objc_msgSend_playlistSettings(void *a1, const char *a2, ...)
{
  return _[a1 playlistSettings];
}

id objc_msgSend_podcast(void *a1, const char *a2, ...)
{
  return _[a1 podcast];
}

id objc_msgSend_podcastForFeedUrl_(void *a1, const char *a2, ...)
{
  return [a1 podcastForFeedUrl:];
}

id objc_msgSend_podcastUuid(void *a1, const char *a2, ...)
{
  return _[a1 podcastUuid];
}

id objc_msgSend_podcastUuidForFeedUrlString_ctx_(void *a1, const char *a2, ...)
{
  return [a1 podcastUuidForFeedUrlString:ctx:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_predicateForEpisodeType_(void *a1, const char *a2, ...)
{
  return [a1 predicateForEpisodeType:];
}

id objc_msgSend_predicateForEpisodesWithSeasonNumbersOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return [a1 predicateForEpisodesWithSeasonNumbersOnPodcastUuid:];
}

id objc_msgSend_predicateForNotHiddenNotImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNotHiddenNotImplicitlyFollowedPodcasts];
}

id objc_msgSend_predicateForPodcast_(void *a1, const char *a2, ...)
{
  return [a1 predicateForPodcast:];
}

id objc_msgSend_predicateForPodcastIsNotHiddenNotImplicitlyFollowed(void *a1, const char *a2, ...)
{
  return _[a1 predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
}

id objc_msgSend_predicateForSeasonNumberWithNoEpisodeNumber_(void *a1, const char *a2, ...)
{
  return [a1 predicateForSeasonNumberWithNoEpisodeNumber];
}

id objc_msgSend_predicateForSubscriptionSyncType_(void *a1, const char *a2, ...)
{
  return [a1 predicateForSubscriptionSyncType:];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_predicateWithValue_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithValue:];
}

id objc_msgSend_prepareSearchableItemForEpisode_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForEpisode:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForObject_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForObject:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForPodcast_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForPodcast:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForStation_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForStation:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemsForObjectInArray_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemsForObjectInArray:annotator:completion:");
}

id objc_msgSend_privateQueueContext(void *a1, const char *a2, ...)
{
  return _[a1 privateQueueContext];
}

id objc_msgSend_pubDate(void *a1, const char *a2, ...)
{
  return _[a1 pubDate];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return _[a1 saveInCurrentBlock];
}

id objc_msgSend_savePartialUploadStateIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 savePartialUploadStateIndexPath:];
}

id objc_msgSend_savedPartialUploadStateIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 savedPartialUploadStateIndexPath];
}

id objc_msgSend_searchableIndex(void *a1, const char *a2, ...)
{
  return _[a1 searchableIndex];
}

id objc_msgSend_searchableIndex_indexSearchableItems_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex:indexSearchableItems:completionHandler:");
}

id objc_msgSend_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:");
}

id objc_msgSend_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler_(void *a1, const char *a2, ...)
{
  return [a1 searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:];
}

id objc_msgSend_seasonNumbers(void *a1, const char *a2, ...)
{
  return _[a1 seasonNumbers];
}

id objc_msgSend_seasonSortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return _[a1 seasonSortDescriptorsForSortOrder];
}

id objc_msgSend_seasonTrailerInSeason_(void *a1, const char *a2, ...)
{
  return [a1 seasonTrailerInSeason:];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActiveAccount_(void *a1, const char *a2, ...)
{
  return [a1 setActiveAccount];
}

id objc_msgSend_setAttributeSet_(void *a1, const char *a2, ...)
{
  return [a1 setAttributeSet:];
}

id objc_msgSend_setAuthorNames_(void *a1, const char *a2, ...)
{
  return [a1 setAuthorNames:];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return [a1 setCanceled:];
}

id objc_msgSend_setCompletionDate_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionDate:];
}

id objc_msgSend_setContainerTitle_(void *a1, const char *a2, ...)
{
  return [a1 setContainerTitle:];
}

id objc_msgSend_setContentCreationDate_(void *a1, const char *a2, ...)
{
  return [a1 setContentCreationDate:];
}

id objc_msgSend_setContentDescription_(void *a1, const char *a2, ...)
{
  return [a1 setContentDescription:];
}

id objc_msgSend_setContentRating_(void *a1, const char *a2, ...)
{
  return [a1 setContentRating:];
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return [a1 setContentType:];
}

id objc_msgSend_setContentURL_(void *a1, const char *a2, ...)
{
  return [a1 setContentURL:];
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayName:];
}

id objc_msgSend_setDomainIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setDomainIdentifier:];
}

id objc_msgSend_setDownloadedDate_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadedDate:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEpisodeGuid_(void *a1, const char *a2, ...)
{
  return [a1 setEpisodeGuid:];
}

id objc_msgSend_setEpisodeTitle_(void *a1, const char *a2, ...)
{
  return [a1 setEpisodeTitle:];
}

id objc_msgSend_setExcludeUnentitled_(void *a1, const char *a2, ...)
{
  return [a1 setExcludeUnentitled:];
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationDate:];
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return [a1 setFetchLimit:];
}

id objc_msgSend_setFetchOffset_(void *a1, const char *a2, ...)
{
  return [a1 setFetchOffset:];
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return [a1 setFinished:];
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return [a1 setFlags:];
}

id objc_msgSend_setHasFetchedInitialAccount_(void *a1, const char *a2, ...)
{
  return [a1 setHasFetchedInitialAccount:];
}

id objc_msgSend_setHasIndexingOperationInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setHasIndexingOperationInProgress:];
}

id objc_msgSend_setIndexAllBatchGenerator_(void *a1, const char *a2, ...)
{
  return [a1 setIndexAllBatchGenerator:];
}

id objc_msgSend_setIndexDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setIndexDelegate:];
}

id objc_msgSend_setInformation_(void *a1, const char *a2, ...)
{
  return [a1 setInformation:];
}

id objc_msgSend_setLastUsedDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastUsedDate:];
}

id objc_msgSend_setListenNowEpisode_(void *a1, const char *a2, ...)
{
  return [a1 setListenNowEpisode:];
}

id objc_msgSend_setLocal_(void *a1, const char *a2, ...)
{
  return [a1 setLocal:];
}

id objc_msgSend_setModifiedDate_(void *a1, const char *a2, ...)
{
  return [a1 setModifiedDate:];
}

id objc_msgSend_setNeedsUpdate_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdate:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setPersistentID_(void *a1, const char *a2, ...)
{
  return [a1 setPersistentID:];
}

id objc_msgSend_setPlayCount_(void *a1, const char *a2, ...)
{
  return [a1 setPlayCount:];
}

id objc_msgSend_setPodcastFeedUrl_(void *a1, const char *a2, ...)
{
  return [a1 setPodcastFeedUrl:];
}

id objc_msgSend_setPodcastTitle_(void *a1, const char *a2, ...)
{
  return [a1 setPodcastTitle:];
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setPredicate:];
}

id objc_msgSend_setPrimitiveValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setPrimitiveValue:forKey:];
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return [a1 setPropertiesToFetch:];
}

id objc_msgSend_setRelatedUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setRelatedUniqueIdentifier:];
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return [a1 setResultType:];
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return [a1 setReturnsDistinctResults:];
}

id objc_msgSend_setSortAscending_(void *a1, const char *a2, ...)
{
  return [a1 setSortAscending:];
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 setSortDescriptors:];
}

id objc_msgSend_setStoreTrackId_(void *a1, const char *a2, ...)
{
  return [a1 setStoreTrackId:];
}

id objc_msgSend_setStreamUrl_(void *a1, const char *a2, ...)
{
  return [a1 setStreamUrl:];
}

id objc_msgSend_setStreamable_(void *a1, const char *a2, ...)
{
  return [a1 setStreamable:];
}

id objc_msgSend_setThumbnailURL_(void *a1, const char *a2, ...)
{
  return [a1 setThumbnailURL:];
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setUniqueIdentifier:];
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return [a1 setUuid:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setWithCapacity:];
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return [a1 setWithSet:];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_showTypeInFeed(void *a1, const char *a2, ...)
{
  return _[a1 showTypeInFeed];
}

id objc_msgSend_showTypeSetting(void *a1, const char *a2, ...)
{
  return _[a1 showTypeSetting];
}

id objc_msgSend_sortAscending(void *a1, const char *a2, ...)
{
  return _[a1 sortAscending];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:selector:];
}

id objc_msgSend_sortDescriptorsForPlayOrderByEpisodeNumber(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForPlayOrderByEpisodeNumber];
}

id objc_msgSend_sortDescriptorsForPlayOrderByPubDate(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForPlayOrderByPubDate];
}

id objc_msgSend_sortDescriptorsForPubDateAscending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForPubDateAscending];
}

id objc_msgSend_sortOrderAscForShowType_(void *a1, const char *a2, ...)
{
  return [a1 sortOrderAscForShowType:];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_storeCollectionId(void *a1, const char *a2, ...)
{
  return _[a1 storeCollectionId];
}

id objc_msgSend_streamURL(void *a1, const char *a2, ...)
{
  return _[a1 streamURL];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringBySmartlyStrippingHTML(void *a1, const char *a2, ...)
{
  return _[a1 stringBySmartlyStrippingHTML];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_subscribed(void *a1, const char *a2, ...)
{
  return _[a1 subscribed];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return _[a1 syncType];
}

id objc_msgSend_timestampBoundByNow_(void *a1, const char *a2, ...)
{
  return [a1 timestampBoundByNow:];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topLevelPlaylistsPredicate(void *a1, const char *a2, ...)
{
  return _[a1 topLevelPlaylistsPredicate];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_uniqueIdentifierForObject_(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifierForObject:];
}

id objc_msgSend_universalStore(void *a1, const char *a2, ...)
{
  return _[a1 universalStore];
}

id objc_msgSend_upNextForPodcastUuid_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return [a1 upNextForPodcastUuid:excludeExplicit:ctx:];
}

id objc_msgSend_updateAvg(void *a1, const char *a2, ...)
{
  return _[a1 updateAvg];
}

id objc_msgSend_updateIndexRequests(void *a1, const char *a2, ...)
{
  return _[a1 updateIndexRequests];
}

id objc_msgSend_updateSearchableIndexWithReason_searchableIndex_entityLoadingBlock_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateSearchableIndexWithReason:searchableIndex:entityLoadingBlock:completion:];
}

id objc_msgSend_updateStdDev(void *a1, const char *a2, ...)
{
  return _[a1 updateStdDev];
}

id objc_msgSend_updatedObjectIDs(void *a1, const char *a2, ...)
{
  return _[a1 updatedObjectIDs];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _[a1 vendorID];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _[a1 webpageURL];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}