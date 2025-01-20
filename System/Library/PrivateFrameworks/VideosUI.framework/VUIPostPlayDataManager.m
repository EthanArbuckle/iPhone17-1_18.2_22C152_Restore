@interface VUIPostPlayDataManager
+ (id)_generateMediaInfoFromJSResponse:(id)a3;
+ (id)_metricsForPostPlayMediaItemFromLibrary:(id)a3;
+ (void)_fetchContentFromLibraryForCurrentMediaItem:(id)a3 completion:(id)a4;
+ (void)_fetchPostPlayItemFromJSForSeriesCanonicalID:(id)a3 andVideoCanonicalID:(id)a4 seasonNumber:(id)a5 completion:(id)a6;
+ (void)_fetchPostPlayItemFromLibraryContentForStoreID:(id)a3 completion:(id)a4;
+ (void)fetchPostPlayItemForCurrentMediaItem:(id)a3 completion:(id)a4;
@end

@implementation VUIPostPlayDataManager

+ (void)fetchPostPlayItemForCurrentMediaItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (fetchPostPlayItemForCurrentMediaItem_completion__onceToken[0] != -1) {
    dispatch_once(fetchPostPlayItemForCurrentMediaItem_completion__onceToken, &__block_literal_global_90);
  }
  if (![v5 hasTrait:*MEMORY[0x1E4FAA198]])
  {
    v8 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA080]];
    v9 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
    v10 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA060]];
    if (v9)
    {
      v11 = [MEMORY[0x1E4FB3CF8] sharedInstance];
      int v12 = [v11 isNetworkReachable];

      if (v12)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_74;
        v20[3] = &unk_1E6DF91F8;
        v13 = &v21;
        id v21 = v6;
        +[VUIPostPlayDataManager _fetchPostPlayItemFromJSForSeriesCanonicalID:v8 andVideoCanonicalID:v9 seasonNumber:v10 completion:v20];
LABEL_15:

        goto LABEL_16;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_76;
      v18[3] = &unk_1E6DF9220;
      v13 = &v19;
      id v19 = v6;
      v15 = v18;
    }
    else
    {
      v14 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Current Item has no canonical id; checking with storeID",
          buf,
          2u);
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_78;
      v16[3] = &unk_1E6DF9220;
      v13 = &v17;
      id v17 = v6;
      v15 = v16;
    }
    +[VUIPostPlayDataManager _fetchContentFromLibraryForCurrentMediaItem:v5 completion:v15];
    goto LABEL_15;
  }
  v7 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Current Item is a Scene, no post play allowed", buf, 2u);
  }
  (*((void (**)(id, void, void, void, void, void, void))v6 + 2))(v6, 0, 0, 0, 0, 0, 0);
LABEL_16:
}

void __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIPostPlayDataManager");
  v1 = (void *)sLogObject_13;
  sLogObject_13 = (uint64_t)v0;
}

void __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_74(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    id v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else if (v15)
  {
    id v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v18 = sLogObject_13;
    if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find post play item from JS", v19, 2u);
    }
    id v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v17();
}

void __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[VUIPostPlayDataManager _metricsForPostPlayMediaItemFromLibrary:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[VUIPostPlayDataManager _metricsForPostPlayMediaItemFromLibrary:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_metricsForPostPlayMediaItemFromLibrary:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
    if ([v5 length])
    {
      id v6 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA080]];
      id v7 = (void *)MEMORY[0x1E4F1CA60];
      v26[0] = @"dialogId";
      v26[1] = @"dialogType";
      v27[0] = v5;
      v27[1] = @"PostPlay";
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
      v9 = [v7 dictionaryWithDictionary:v8];

      if ([v6 length])
      {
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:@"showId"];
        [v9 setObject:v10 forKeyedSubscript:@"details"];
      }
      v11 = +[VUIMetricsMediaEvent clickMetricsDataFromTVPMediaItem:v4];
      id v12 = (void *)[v11 mutableCopy];

      v24[0] = @"actionType";
      v24[1] = @"targetType";
      v25[0] = @"play";
      v25[1] = @"lockup";
      v24[2] = @"targetId";
      v25[2] = v5;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
      [v12 addEntriesFromDictionary:v13];

      [v12 addEntriesFromDictionary:v9];
      id v14 = +[VUIMetricsMediaEvent impressionsMetricsDataFromTVPMediaItem:v4];
      id v15 = (void *)[v14 mutableCopy];

      [v15 setObject:@"lockup" forKeyedSubscript:@"impressionType"];
      id v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v9];
      id v17 = (void *)[v15 copy];
      [v16 setObject:v17 forKeyedSubscript:@"impressions"];

      v22[0] = @"VUIContentMetadataPostPlayItemMetricsClickDataKey";
      v18 = (void *)[v12 copy];
      v22[1] = @"VUIContentMetadataPostPlayItemMetricsImpressionsDataKey";
      v23[0] = v18;
      id v19 = (void *)[v16 copy];
      v23[1] = v19;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (void)_fetchPostPlayItemFromJSForSeriesCanonicalID:(id)a3 andVideoCanonicalID:(id)a4 seasonNumber:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v9 length]) {
    [v13 setObject:v9 forKey:@"showCanonicalId"];
  }
  if ([v10 length]) {
    [v13 setObject:v10 forKey:@"canonicalId"];
  }
  if (v11) {
    [v13 setObject:v11 forKey:@"seasonNumber"];
  }
  id v14 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Fetching MediaEntity from JS for current TVPMediaItem", buf, 2u);
  }
  id v15 = +[VUITVAppLauncher sharedInstance];
  id v16 = [v15 appController];

  id v17 = [v16 appContext];
  if (v17)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __115__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_seasonNumber_completion___block_invoke;
    v18[3] = &unk_1E6DF5FE0;
    id v19 = v13;
    id v20 = v12;
    [v17 evaluate:v18];
  }
  else
  {
    (*((void (**)(id, void, void, void, void, void, void))v12 + 2))(v12, 0, 0, 0, 0, 0, 0);
  }
}

void __115__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_seasonNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"PostPlayItemInterface"];
  v12[0] = *(void *)(a1 + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __115__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_seasonNumber_completion___block_invoke_2;
  id v10 = &unk_1E6DF5FB8;
  id v11 = *(id *)(a1 + 40);
  v4 = _Block_copy(&v7);
  v12[1] = v4;
  id v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 2, v7, v8, v9, v10);
  id v6 = (id)[v3 invokeMethod:@"getPostPlayItem" withArguments:v5];
}

void __115__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_seasonNumber_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __115__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_seasonNumber_completion___block_invoke_3;
  uint64_t v8 = &unk_1E6DF4AD0;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = v3;
  if (objc_msgSend(v4, "isMainThread", v6[0], 3221225472)) {
    v7((uint64_t)v6);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __115__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_seasonNumber_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    int v16 = 138412290;
    id v17 = v3;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "PostPlay JS Fetch Complete: %@", (uint8_t *)&v16, 0xCu);
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "vui_dictionaryForKey:", @"playable");
  id v5 = objc_msgSend(*(id *)(a1 + 32), "vui_dictionaryForKey:", @"postPlayViewEntity");
  id v6 = objc_msgSend(*(id *)(a1 + 32), "vui_dictionaryForKey:", @"metrics");
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "vui_dictionaryForKey:", @"routerDataSource");
  uint64_t v8 = (void *)v7;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "vui_BOOLForKey:defaultValue:", @"canAutoPlay", 1);
    id v9 = +[VUIPostPlayDataManager _generateMediaInfoFromJSResponse:v4];
    id v10 = [v9 tvpPlaylist];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 trackList];
      id v13 = [v12 firstObject];

      id v14 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v13;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Found Next Media Item for Post Play: <%@>", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      id v13 = 0;
    }

    id v15 = 0;
  }
  else
  {
    if (v7) {
      id v15 = [[VUIRouterDataSource alloc] initWithRouterData:v7 appContext:0];
    }
    else {
      id v15 = 0;
    }
    id v13 = 0;
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)_fetchPostPlayItemFromLibraryContentForStoreID:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[VUIMediaLibraryManager defaultManager];
  uint64_t v8 = [v7 aggregateMediaLibrary];

  id v9 = +[VUIMediaEntityFetchRequest episodesFetchRequest];
  [v9 addAdamIdPredicate:v5];
  id v10 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Fetching MediaEntity from Library for current TVPMediaItem", buf, 2u);
  }
  v19[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke;
  v15[3] = &unk_1E6DF92C0;
  id v16 = v5;
  id v17 = v6;
  id v12 = v5;
  id v13 = v6;
  id v14 = (id)[v8 enqueueFetchRequests:v11 completionHandler:v15];
}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke(uint64_t a1, void *a2)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 firstObject];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 mediaEntities];
    id v6 = [v5 firstObject];

    if (!v6)
    {
      id v15 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_ERROR)) {
        __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_cold_2(v15);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      id v21 = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_98;
      v22 = &unk_1E6DF3DD0;
      id v23 = *(id *)(a1 + 40);
      if ([MEMORY[0x1E4F29060] isMainThread]) {
        v21((uint64_t)block);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      uint64_t v8 = v23;
      goto LABEL_21;
    }
    uint64_t v7 = [v6 showIdentifier];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = +[VUIMediaEntityFetchRequest episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:v7];
      id v10 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Fetching Series for current MediaEntity", buf, 2u);
      }
      id v11 = [v6 mediaLibrary];
      v32[0] = v9;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_89;
      void v24[3] = &unk_1E6DF9298;
      id v25 = *(id *)(a1 + 32);
      id v26 = *(id *)(a1 + 40);
      id v13 = (id)[v11 enqueueFetchRequests:v12 completionHandler:v24];

LABEL_21:
      goto LABEL_24;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v29 = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_2;
    v30 = &unk_1E6DF3DD0;
    id v31 = *(id *)(a1 + 40);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v29((uint64_t)v28);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v28);
    }
  }
  else
  {
    id v14 = sLogObject_13;
    if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_ERROR)) {
      __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_cold_1(v14);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v17 = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_99;
    uint64_t v18 = &unk_1E6DF3DD0;
    id v19 = *(id *)(a1 + 40);
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v16[0], 3221225472)) {
      v17((uint64_t)v16);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v16);
    }
    id v6 = v19;
  }
LABEL_24:
}

uint64_t __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 firstObject];
  uint64_t v8 = [v7 grouping];
  if ([v8 count])
  {
    *(void *)buf = 0;
    v58 = buf;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__17;
    v61 = __Block_byref_object_dispose__17;
    id v62 = 0;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__17;
    v55 = __Block_byref_object_dispose__17;
    id v56 = 0;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_90;
    v47[3] = &unk_1E6DF9270;
    v49 = buf;
    v50 = &v51;
    id v48 = *(id *)(a1 + 32);
    [v8 enumerateObjectsUsingBlock:v47];
    id v9 = (void *)v52[5];
    if (!v9)
    {
      v29 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v63 = 0;
        _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "No Next Episode for Post Play", v63, 2u);
      }
      uint64_t v18 = 0;
      id v19 = 0;
      LOBYTE(v16) = 0;
      goto LABEL_26;
    }
    id v10 = [v9 episodeIndexInSeries];
    if (v10)
    {
      id v11 = [*((id *)v58 + 5) episodeIndexInSeries];
      BOOL v12 = v11 == 0;

      if (!v12)
      {
        id v13 = [(id)v52[5] episodeIndexInSeries];
        uint64_t v14 = [v13 longValue];
        id v15 = [*((id *)v58 + 5) episodeIndexInSeries];
        BOOL v16 = v14 == [v15 longValue] + 1;

        goto LABEL_13;
      }
    }
    id v20 = [*((id *)v58 + 5) seasonIdentifier];
    id v21 = [(id)v52[5] seasonIdentifier];
    if (([v20 isEqual:v21] & 1) != 0
      && ([(id)v52[5] episodeNumber], (v22 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v23 = [*((id *)v58 + 5) episodeNumber];
      BOOL v24 = v23 == 0;

      if (!v24)
      {
        id v25 = [(id)v52[5] episodeNumber];
        uint64_t v26 = [v25 longValue];
        v27 = [*((id *)v58 + 5) episodeNumber];
        BOOL v16 = v26 == [v27 longValue] + 1;

LABEL_13:
        if (v16) {
          uint64_t v28 = 9;
        }
        else {
          uint64_t v28 = 11;
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
    LOBYTE(v16) = 0;
    uint64_t v28 = 11;
LABEL_21:
    v30 = [VUIMediaInfo alloc];
    v65[0] = v52[5];
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
    id v19 = [(VUIMediaInfo *)v30 initWithPlaybackContext:v28 vuiMediaItems:v31];

    [(VUIMediaInfo *)v19 setIntent:1];
    v32 = [(VUIMediaInfo *)v19 tvpPlaylist];
    v33 = v32;
    if (v32)
    {
      v34 = [v32 trackList];
      uint64_t v18 = [v34 firstObject];

      v35 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v63 = 138412290;
        v64 = v18;
        _os_log_impl(&dword_1E2BD7000, v35, OS_LOG_TYPE_DEFAULT, "Found Next Episode for Post Play: <%@>", v63, 0xCu);
      }
    }
    else
    {
      uint64_t v18 = 0;
    }

LABEL_26:
    _Block_object_dispose(&v51, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_27;
  }
  id v17 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Failed to find Series for current MediaEntity", buf, 2u);
  }
  uint64_t v18 = 0;
  id v19 = 0;
  LOBYTE(v16) = 0;
LABEL_27:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v41 = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_96;
  v42 = &unk_1E6DF8470;
  id v36 = *(id *)(a1 + 40);
  id v44 = v18;
  id v45 = v36;
  v43 = v19;
  BOOL v46 = v16;
  v37 = (void *)MEMORY[0x1E4F29060];
  id v38 = v18;
  v39 = v19;
  if ([v37 isMainThread]) {
    v41((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_90(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a2 mediaEntities];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_2_91;
  v9[3] = &unk_1E6DF9248;
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = a4;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v8;
  long long v10 = v8;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_2_91(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      id v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) seasonIdentifier];
      long long v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) seasonIdentifier];
      if ([v7 isEqual:v8])
      {
        id v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) episodeIndexInSeries];
        uint64_t v10 = [v9 unsignedIntegerValue];
        uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) episodeIndexInSeries];
        uint64_t v12 = [v11 unsignedIntegerValue] + 1;

        if (v10 == v12)
        {
          *a4 = 1;
          **(unsigned char **)(a1 + 56) = 1;
        }
      }
      else
      {
      }
      id v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isLocal];
      int v14 = [v13 BOOLValue];

      if (v14)
      {
        *a4 = 1;
        **(unsigned char **)(a1 + 56) = 1;
      }
    }
    id v15 = v18;
    BOOL v16 = [v15 storeID];
    int v17 = [v16 isEqualToNumber:*(void *)(a1 + 32)];

    if (v17) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

uint64_t __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_fetchContentFromLibraryForCurrentMediaItem:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  id v7 = v6;
  if (v6)
  {
    long long v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__VUIPostPlayDataManager__fetchContentFromLibraryForCurrentMediaItem_completion___block_invoke;
    v11[3] = &unk_1E6DF9220;
    id v12 = v5;
    +[VUIPostPlayDataManager _fetchPostPlayItemFromLibraryContentForStoreID:v8 completion:v11];
  }
  else
  {
    id v9 = sLogObject_13;
    if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Failed to find StoreID for currentMediaItem", v10, 2u);
    }
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
  }
}

uint64_t __81__VUIPostPlayDataManager__fetchContentFromLibraryForCurrentMediaItem_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_generateMediaInfoFromJSResponse:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"videosPlayables"];
  id v5 = [v3 objectForKey:@"contentMetadata"];
  id v6 = +[VUIVideosPlayable videosPlayablesFromDictionaries:v4 andMetadataDictionary:v5];

  if ([v6 count])
  {
    id v7 = objc_msgSend(v3, "vui_stringForKey:", @"postPlayPlaybackType");
    if ([v7 isEqualToString:@"nextEpisodeSameSeason"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"nextEpisodeDifferentSeason"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"other"])
    {
      uint64_t v8 = 11;
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v9 = [[VUIMediaInfo alloc] initWithPlaybackContext:v8 videosPlayables:v6 imageProxies:0 storeDictionary:0];
    [(VUIMediaInfo *)v9 setIntent:1];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Failed to receive a VUIMediaEntityFetchResponse for current TVPMediaItem", v1, 2u);
}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Failed to find MediaEntity for current TVPMediaItem", v1, 2u);
}

@end