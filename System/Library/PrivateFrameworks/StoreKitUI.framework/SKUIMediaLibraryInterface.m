@interface SKUIMediaLibraryInterface
- (BOOL)isItemLocalAudiobook:(id)a3;
- (BOOL)performActionForLibraryItem:(id)a3;
- (id)_newDefaultQuery;
- (id)_storePlatformKindForMediaItem:(id)a3;
- (id)exposedPlatformItemKinds;
- (id)stateForLibraryItem:(id)a3;
- (int64_t)_availabilityForMediaItem:(id)a3;
- (unint64_t)_AVTypesForMediaItem:(id)a3;
- (void)_restrictQueryToLocalContent:(id)a3;
- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4;
- (void)exposedPlatformItemKinds;
- (void)removeMediaItemsForLibraryItems:(id)a3;
@end

@implementation SKUIMediaLibraryInterface

- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *, SKUILibraryItemState *, unsigned char *))a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIMediaLibraryInterface enumerateStatesForLibraryItems:usingBlock:]();
  }
  v7 = (void *)SKUIMediaPlayerFramework();
  id v8 = [(SKUIMediaLibraryInterface *)self _newDefaultQuery];
  id v23 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v7);
  id v22 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v7);
  id v21 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v7);
  id v20 = SKUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v7);
  unsigned __int8 v35 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v25 = *(void *)v32;
LABEL_7:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v32 != v25) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1C8749310]();
      v14 = objc_alloc_init(SKUILibraryItemState);
      v15 = [v12 storeItemIdentifier];

      if (v15)
      {
        v16 = [v12 storeItemIdentifier];
        v17 = [v20 predicateWithValue:v16 forProperty:v21];

        [v8 addFilterPredicate:v17];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __71__SKUIMediaLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke;
        v26[3] = &unk_1E6425C40;
        v27 = v14;
        v28 = self;
        id v29 = v22;
        id v30 = v23;
        [v8 _enumerateUnorderedItemsUsingBlock:v26];
        [v8 removeFilterPredicate:v17];
      }
      v6[2](v6, v12, v14, &v35);
      int v18 = v35;

      if (v18) {
        break;
      }
      if (v10 == ++v11)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v10) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
}

void __71__SKUIMediaLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    id v7 = a2;
    objc_msgSend(v5, "setAvailability:", objc_msgSend(v6, "_availabilityForMediaItem:", v7));
    objc_msgSend(*(id *)(a1 + 32), "setAVTypes:", objc_msgSend(*(id *)(a1 + 40), "_AVTypesForMediaItem:", v7));
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v7 valueForProperty:*(void *)(a1 + 48)];
    objc_msgSend(v8, "setHighDefinition:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "setRental:", objc_msgSend(v7, "isRental"));
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v7 valueForProperty:*(void *)(a1 + 56)];
    [v10 setStoreAccountIdentifier:v11];

    v12 = *(void **)(a1 + 32);
    v13 = [*(id *)(a1 + 40) _storePlatformKindForMediaItem:v7];

    [v12 setStorePlatformKind:v13];
    *a3 = 1;
  }
}

- (id)exposedPlatformItemKinds
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIMediaLibraryInterface *)v2 exposedPlatformItemKinds];
      }
    }
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"book", @"movie", @"song", @"musicVideo", @"podcastEpisode", @"tvEpisode", 0);

  return v10;
}

- (BOOL)performActionForLibraryItem:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMediaLibraryInterface performActionForLibraryItem:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = (void *)SKUIMediaPlayerFramework();
  v14 = (objc_class *)SKUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, (uint64_t)v13);
  id v15 = SKUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v13);
  id v16 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v13);
  id v17 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyMediaType", v13);
  id v18 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStorePlaylistID", v13);
  id v19 = objc_alloc_init(v14);
  id v20 = [v4 storeItemIdentifier];
  v65 = v15;
  id v21 = [v15 predicateWithValue:v20 forProperty:v16];
  [v19 addFilterPredicate:v21];

  id v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v16, v17, v18, 0);
  [v19 setItemPropertiesToFetch:v22];

  [(SKUIMediaLibraryInterface *)self _restrictQueryToLocalContent:v19];
  v67 = v19;
  id v23 = [v19 items];
  v24 = [v23 firstObject];

  uint64_t v25 = v24;
  if (v24 && ([v24 mediaType] & 0xFF00) != 0)
  {
    id v26 = [NSString alloc];
    v27 = [v4 storeItemIdentifier];
    v28 = objc_msgSend(v26, "initWithFormat:", @"videos://play?adam-id=%lld&allowCloudPlayback=1", objc_msgSend(v27, "longLongValue"));

    id v29 = [MEMORY[0x1E4F1CB10] URLWithString:v28];
    SKUIMetricsOpenSensitiveURL(v29, 0);
    BOOL v30 = 1;
  }
  else
  {
    long long v31 = v4;
    id v32 = v17;
    long long v33 = [(objc_class *)v14 albumsQuery];
    v61 = self;
    [(SKUIMediaLibraryInterface *)self _restrictQueryToLocalContent:v33];
    long long v34 = v31;
    [v31 storeItemIdentifier];
    v36 = unsigned __int8 v35 = v25;
    uint64_t v37 = [v65 predicateWithValue:v36 forProperty:v18];
    [v33 addFilterPredicate:v37];

    v64 = v33;
    id v29 = [v33 items];
    uint64_t v38 = [v29 count];
    v39 = 0;
    v63 = v35;
    if (!v35 || v38)
    {
      id v17 = v32;
      id v4 = v34;
    }
    else
    {
      id v40 = v18;
      v41 = [v63 valueForProperty:v18];
      id v17 = v32;
      if (v41)
      {
        id v4 = v34;
        if (([v63 mediaType] & 4) != 0) {
          [(objc_class *)v14 audiobooksQuery];
        }
        else {
        v42 = [(objc_class *)v14 albumsQuery];
        }

        [(SKUIMediaLibraryInterface *)v61 _restrictQueryToLocalContent:v42];
        v43 = [v65 predicateWithValue:v41 forProperty:v40];
        [v42 addFilterPredicate:v43];

        uint64_t v44 = [v42 items];

        v39 = [v63 valueForProperty:v16];
        id v29 = (void *)v44;
        v64 = v42;
      }
      else
      {
        v39 = 0;
        id v4 = v34;
      }

      id v18 = v40;
    }
    uint64_t v45 = [v29 count];
    BOOL v30 = v45 != 0;
    if (v45)
    {
      v46 = objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Mpmediaitemcol.isa, (uint64_t)v13)), "initWithItems:", v29);
      v47 = objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Mpmusicplayerc.isa, (uint64_t)v13), "systemMusicPlayer");
      [v47 setQueueWithItemCollection:v46];
      if (v39)
      {
        v58 = v46;
        BOOL v59 = v30;
        id v60 = v18;
        id v62 = v17;
        id v66 = v4;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v48 = v29;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v68 objects:v72 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v69;
          v57 = v47;
          while (2)
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v69 != v51) {
                objc_enumerationMutation(v48);
              }
              v53 = *(void **)(*((void *)&v68 + 1) + 8 * i);
              v54 = [v53 valueForProperty:v16];
              int v55 = [v54 isEqualToNumber:v39];

              if (v55)
              {
                v47 = v57;
                [v57 setNowPlayingItem:v53];
                goto LABEL_30;
              }
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:&v68 objects:v72 count:16];
            v47 = v57;
            if (v50) {
              continue;
            }
            break;
          }
        }
LABEL_30:

        id v4 = v66;
        id v18 = v60;
        id v17 = v62;
        BOOL v30 = v59;
        v46 = v58;
      }
      [v47 play];
    }
    uint64_t v25 = v63;
    v28 = v64;
  }

  return v30;
}

- (BOOL)isItemLocalAudiobook:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIMediaLibraryInterface isItemLocalAudiobook:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = (void *)SKUIMediaPlayerFramework();
  id v13 = SKUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, (uint64_t)v12);
  id v14 = SKUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v12);
  id v15 = [v13 audiobooksQuery];
  id v16 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStorePlaylistID", v12);
  id v17 = [v3 storeItemIdentifier];

  id v18 = [v14 predicateWithValue:v17 forProperty:v16];

  [v15 addFilterPredicate:v18];
  id v19 = [v15 items];
  LOBYTE(v16) = [v19 count] != 0;

  return (char)v16;
}

- (id)stateForLibraryItem:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMediaLibraryInterface stateForLibraryItem:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = objc_alloc_init(SKUILibraryItemState);
  id v14 = (void *)SKUIMediaPlayerFramework();
  id v15 = [(SKUIMediaLibraryInterface *)self _newDefaultQuery];
  id v16 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v14);
  id v17 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v14);
  id v18 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v14);
  id v19 = SKUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v14);
  id v20 = [v4 storeItemIdentifier];

  id v21 = [v19 predicateWithValue:v20 forProperty:v18];

  [v15 addFilterPredicate:v21];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__SKUIMediaLibraryInterface_stateForLibraryItem___block_invoke;
  v28[3] = &unk_1E6425C40;
  id v22 = v13;
  id v29 = v22;
  BOOL v30 = self;
  id v31 = v17;
  id v32 = v16;
  id v23 = v16;
  id v24 = v17;
  [v15 _enumerateUnorderedItemsUsingBlock:v28];
  uint64_t v25 = v32;
  id v26 = v22;

  return v26;
}

void __49__SKUIMediaLibraryInterface_stateForLibraryItem___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if (a2)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    id v7 = a2;
    objc_msgSend(v5, "setAvailability:", objc_msgSend(v6, "_availabilityForMediaItem:", v7));
    objc_msgSend(*(id *)(a1 + 32), "setAVTypes:", objc_msgSend(*(id *)(a1 + 40), "_AVTypesForMediaItem:", v7));
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v7 valueForProperty:*(void *)(a1 + 48)];
    objc_msgSend(v8, "setHighDefinition:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "setRental:", objc_msgSend(v7, "isRental"));
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v7 valueForProperty:*(void *)(a1 + 56)];
    [v10 setStoreAccountIdentifier:v11];

    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = [*(id *)(a1 + 40) _storePlatformKindForMediaItem:v7];

    [v12 setStorePlatformKind:v13];
    *a3 = 1;
  }
}

- (void)removeMediaItemsForLibraryItems:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIMediaLibraryInterface removeMediaItemsForLibraryItems:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = (void *)SKUIMediaPlayerFramework();
  id v13 = (objc_class *)SKUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, (uint64_t)v12);
  id v14 = SKUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v12);
  id v27 = SKUIWeakLinkedClassForString(&cfstr_Mpmedialibrary_0.isa, (uint64_t)v12);
  id v15 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v12);
  id v16 = objc_alloc_init(v13);
  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(obj);
        }
        id v22 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v21), "storeItemIdentifier", v27);
        id v23 = [v14 predicateWithValue:v22 forProperty:v15];

        [v16 addFilterPredicate:v23];
        id v24 = [v16 items];
        uint64_t v25 = [v24 firstObject];

        if (v25) {
          [v17 addObject:v25];
        }
        [v16 removeFilterPredicate:v23];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v19);
  }

  if ([v17 count])
  {
    id v26 = [v27 defaultMediaLibrary];
    [v26 removeItems:v17];
  }
}

- (int64_t)_availabilityForMediaItem:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIMediaLibraryInterface _availabilityForMediaItem:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  if (_availabilityForMediaItem__sOnce != -1) {
    dispatch_once(&_availabilityForMediaItem__sOnce, &__block_literal_global_13);
  }
  uint64_t v12 = [v3 valueForProperty:_availabilityForMediaItem__sFamilyAccountIDProperty];
  if ([v12 unsignedLongLongValue] && (objc_msgSend(v3, "mediaType") & 0x300) != 0)
  {
    id v13 = [v3 valueForProperty:_availabilityForMediaItem__sFilePathProperty];
    if ([v13 length])
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v13 isDirectory:0];
      id v15 = (void *)[objc_alloc((Class)_availabilityForMediaItem__sPlayerItemClass) initWithURL:v14];
      if ([v15 isContentAuthorizedForPlayback]) {
        int64_t v16 = 2;
      }
      else {
        int64_t v16 = 0;
      }
    }
    else
    {
      int64_t v16 = 2;
    }
  }
  else
  {
    int64_t v16 = 2;
  }

  return v16;
}

id __55__SKUIMediaLibraryInterface__availabilityForMediaItem___block_invoke()
{
  v0 = (void *)SKUIMediaPlayerFramework();
  v1 = (id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreFamilyAccountID", v0);
  objc_storeStrong((id *)&_availabilityForMediaItem__sFamilyAccountIDProperty, *v1);
  BOOL v2 = (id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyFilePath", v0);
  objc_storeStrong((id *)&_availabilityForMediaItem__sFilePathProperty, *v2);
  uint64_t v3 = SKUIAVFoundationFramework();
  id result = SKUIWeakLinkedClassForString(&cfstr_Avplayeritem.isa, v3);
  _availabilityForMediaItem__sPlayerItemClass = (uint64_t)result;
  return result;
}

- (unint64_t)_AVTypesForMediaItem:(id)a3
{
  if (([a3 mediaType] & 0xFF00) != 0) {
    return 5;
  }
  else {
    return 1;
  }
}

- (id)_newDefaultQuery
{
  uint64_t v3 = (void *)SKUIMediaPlayerFramework();
  id v4 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, (uint64_t)v3));
  [(SKUIMediaLibraryInterface *)self _restrictQueryToLocalContent:v4];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  objc_msgSend(v5, "addObject:", *(void *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v3));
  objc_msgSend(v5, "addObject:", *(void *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsRental", v3));
  objc_msgSend(v5, "addObject:", *(void *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyMediaType", v3));
  objc_msgSend(v5, "addObject:", *(void *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v3));
  [v4 setItemPropertiesToFetch:v5];

  return v4;
}

- (void)_restrictQueryToLocalContent:(id)a3
{
  id v3 = a3;
  id v4 = (void *)SKUIMediaPlayerFramework();
  id v5 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsLocal", v4);
  objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v4), "predicateWithValue:forProperty:", MEMORY[0x1E4F1CC38], v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v3 addFilterPredicate:v6];
}

- (id)_storePlatformKindForMediaItem:(id)a3
{
  uint64_t v3 = [a3 mediaType];
  id result = 0;
  if (v3 <= 511)
  {
    switch(v3)
    {
      case 1:
        id result = @"song";
        break;
      case 2:
      case 8:
        return @"podcastEpisode";
      case 3:
      case 5:
      case 6:
      case 7:
        return result;
      case 4:
        id result = @"book";
        break;
      default:
        if (v3 == 256) {
          id result = @"movie";
        }
        else {
          id result = 0;
        }
        break;
    }
    return result;
  }
  if (v3 > 2047)
  {
    if (v3 == 2048) {
      return @"musicVideo";
    }
    if (v3 != 4096) {
      return result;
    }
    return @"podcastEpisode";
  }
  if (v3 == 512) {
    return @"tvEpisode";
  }
  if (v3 == 1024) {
    return @"podcastEpisode";
  }
  return result;
}

- (void)enumerateStatesForLibraryItems:usingBlock:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaLibraryInterface enumerateStatesForLibraryItems:usingBlock:]";
}

- (void)exposedPlatformItemKinds
{
}

- (void)performActionForLibraryItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isItemLocalAudiobook:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stateForLibraryItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeMediaItemsForLibraryItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_availabilityForMediaItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end