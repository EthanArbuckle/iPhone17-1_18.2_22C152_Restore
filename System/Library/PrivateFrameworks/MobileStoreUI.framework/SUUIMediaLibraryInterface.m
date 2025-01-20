@interface SUUIMediaLibraryInterface
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
- (void)removeMediaItemsForLibraryItems:(id)a3;
@end

@implementation SUUIMediaLibraryInterface

- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *, SUUILibraryItemState *, unsigned char *))a4;
  v8 = (void *)SUUIMediaPlayerFramework();
  v22 = self;
  id v9 = [(SUUIMediaLibraryInterface *)self _newDefaultQuery];
  id v25 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v8);
  id v24 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v8);
  id v23 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v8);
  id v21 = SUUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v8);
  unsigned __int8 v36 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v26 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v33 != v26) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x25A2A9B80]();
      v15 = objc_alloc_init(SUUILibraryItemState);
      v16 = [v13 storeItemIdentifier];

      if (v16)
      {
        v17 = [v13 storeItemIdentifier];
        v18 = [v21 predicateWithValue:v17 forProperty:v23];

        [v9 addFilterPredicate:v18];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __71__SUUIMediaLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke;
        v27[3] = &unk_265408278;
        v28 = v15;
        v29 = v22;
        id v30 = v24;
        id v31 = v25;
        [v9 _enumerateUnorderedItemsUsingBlock:v27];
        [v9 removeFilterPredicate:v18];
      }
      v7[2](v7, v13, v15, &v36);
      int v19 = v36;

      if (v19) {
        break;
      }
      if (v11 == ++v12)
      {
        uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __71__SUUIMediaLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v7 = a2;
    objc_msgSend(v5, "setAvailability:", objc_msgSend(v6, "_availabilityForMediaItem:", v7));
    objc_msgSend(*(id *)(a1 + 32), "setAVTypes:", objc_msgSend(*(id *)(a1 + 40), "_AVTypesForMediaItem:", v7));
    v8 = *(void **)(a1 + 32);
    id v9 = [v7 valueForProperty:*(void *)(a1 + 48)];
    objc_msgSend(v8, "setHighDefinition:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "setRental:", objc_msgSend(v7, "isRental"));
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v7 valueForProperty:*(void *)(a1 + 56)];
    [v10 setStoreAccountIdentifier:v11];

    uint64_t v12 = *(void **)(a1 + 32);
    v13 = [*(id *)(a1 + 40) _storePlatformKindForMediaItem:v7];

    [v12 setStorePlatformKind:v13];
    *a3 = 1;
  }
}

- (id)exposedPlatformItemKinds
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"book", @"movie", @"song", @"musicVideo", @"podcastEpisode", @"tvEpisode", 0);
}

- (BOOL)performActionForLibraryItem:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)SUUIMediaPlayerFramework();
  id v6 = (objc_class *)SUUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, (uint64_t)v5);
  id v7 = SUUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v5);
  id v8 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v5);
  id v9 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyMediaType", v5);
  id v10 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStorePlaylistID", v5);
  v56 = v6;
  id v11 = objc_alloc_init(v6);
  uint64_t v12 = [v4 storeItemIdentifier];
  v13 = v7;
  v14 = [v7 predicateWithValue:v12 forProperty:v8];
  [v11 addFilterPredicate:v14];

  v15 = v9;
  v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v8, v9, v10, 0);
  [v11 setItemPropertiesToFetch:v16];

  v58 = self;
  [(SUUIMediaLibraryInterface *)self _restrictQueryToLocalContent:v11];
  id v60 = v11;
  v17 = [v11 items];
  v18 = [v17 firstObject];

  if (v18 && ([v18 mediaType] & 0xFF00) != 0)
  {
    id v19 = [NSString alloc];
    v20 = [v4 storeItemIdentifier];
    id v21 = objc_msgSend(v19, "initWithFormat:", @"videos://play?adam-id=%lld&allowCloudPlayback=1", objc_msgSend(v20, "longLongValue"));

    v22 = [NSURL URLWithString:v21];
    SUUIMetricsOpenSensitiveURL(v22, 0);

    BOOL v23 = 1;
  }
  else
  {
    id v24 = v15;
    id v25 = [(objc_class *)v56 albumsQuery];
    [(SUUIMediaLibraryInterface *)v58 _restrictQueryToLocalContent:v25];
    id v52 = v4;
    uint64_t v26 = [v4 storeItemIdentifier];
    v27 = v13;
    id v51 = v10;
    v28 = [v13 predicateWithValue:v26 forProperty:v10];
    [v25 addFilterPredicate:v28];

    v53 = v25;
    v54 = [v25 items];
    uint64_t v29 = [v54 count];
    id v30 = 0;
    if (!v18 || v29)
    {
      id v10 = v51;
      v15 = v24;
      id v31 = v54;
      id v11 = v60;
    }
    else
    {
      id v10 = v51;
      id v30 = [v18 valueForProperty:v51];
      v15 = v24;
      if (v30)
      {
        if (([v18 mediaType] & 4) != 0) {
          [(objc_class *)v56 audiobooksQuery];
        }
        else {
        long long v33 = [(objc_class *)v56 albumsQuery];
        }

        [(SUUIMediaLibraryInterface *)v58 _restrictQueryToLocalContent:v33];
        long long v34 = [v27 predicateWithValue:v30 forProperty:v51];
        [v33 addFilterPredicate:v34];

        id v31 = [v33 items];

        uint64_t v35 = [v18 valueForProperty:v8];
        long long v32 = v30;
        id v30 = (void *)v35;
        v53 = v33;
      }
      else
      {
        long long v32 = 0;
        id v31 = v54;
      }
      id v11 = v60;
    }
    uint64_t v36 = [v31 count];
    BOOL v23 = v36 != 0;
    if (v36)
    {
      uint64_t v37 = objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(&cfstr_Mpmediaitemcol.isa, (uint64_t)v5)), "initWithItems:", v31);
      uint64_t v38 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Mpmusicplayerc.isa, (uint64_t)v5), "systemMusicPlayer");
      v59 = (void *)v37;
      [v38 setQueueWithItemCollection:v37];
      if (v30)
      {
        BOOL v49 = v23;
        v50 = v18;
        v55 = v31;
        v57 = v15;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v39 = v31;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v62;
          while (2)
          {
            v43 = v38;
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v62 != v42) {
                objc_enumerationMutation(v39);
              }
              v45 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              v46 = [v45 valueForProperty:v8];
              int v47 = [v46 isEqualToNumber:v30];

              if (v47)
              {
                uint64_t v38 = v43;
                [v43 setNowPlayingItem:v45];
                goto LABEL_26;
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v61 objects:v65 count:16];
            uint64_t v38 = v43;
            if (v41) {
              continue;
            }
            break;
          }
        }
LABEL_26:

        id v10 = v51;
        id v4 = v52;
        id v31 = v55;
        v15 = v57;
        v18 = v50;
        BOOL v23 = v49;
      }
      [v38 play];

      id v11 = v60;
    }
  }
  return v23;
}

- (BOOL)isItemLocalAudiobook:(id)a3
{
  id v3 = a3;
  id v4 = (void *)SUUIMediaPlayerFramework();
  id v5 = SUUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, (uint64_t)v4);
  id v6 = SUUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v4);
  id v7 = [v5 audiobooksQuery];
  id v8 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStorePlaylistID", v4);
  id v9 = [v3 storeItemIdentifier];

  id v10 = [v6 predicateWithValue:v9 forProperty:v8];

  [v7 addFilterPredicate:v10];
  id v11 = [v7 items];
  LOBYTE(v8) = [v11 count] != 0;

  return (char)v8;
}

- (id)stateForLibraryItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SUUILibraryItemState);
  id v6 = (void *)SUUIMediaPlayerFramework();
  id v7 = [(SUUIMediaLibraryInterface *)self _newDefaultQuery];
  id v8 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v6);
  id v9 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v6);
  id v10 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v6);
  id v11 = SUUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v6);
  uint64_t v12 = [v4 storeItemIdentifier];

  v13 = [v11 predicateWithValue:v12 forProperty:v10];

  [v7 addFilterPredicate:v13];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __49__SUUIMediaLibraryInterface_stateForLibraryItem___block_invoke;
  v20[3] = &unk_265408278;
  v14 = v5;
  id v21 = v14;
  v22 = self;
  id v23 = v9;
  id v24 = v8;
  id v15 = v8;
  id v16 = v9;
  [v7 _enumerateUnorderedItemsUsingBlock:v20];
  v17 = v24;
  v18 = v14;

  return v18;
}

void __49__SUUIMediaLibraryInterface_stateForLibraryItem___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v7 = a2;
    objc_msgSend(v5, "setAvailability:", objc_msgSend(v6, "_availabilityForMediaItem:", v7));
    objc_msgSend(*(id *)(a1 + 32), "setAVTypes:", objc_msgSend(*(id *)(a1 + 40), "_AVTypesForMediaItem:", v7));
    id v8 = *(void **)(a1 + 32);
    id v9 = [v7 valueForProperty:*(void *)(a1 + 48)];
    objc_msgSend(v8, "setHighDefinition:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "setRental:", objc_msgSend(v7, "isRental"));
    id v10 = *(void **)(a1 + 32);
    id v11 = [v7 valueForProperty:*(void *)(a1 + 56)];
    [v10 setStoreAccountIdentifier:v11];

    uint64_t v12 = *(void **)(a1 + 32);
    v13 = [*(id *)(a1 + 40) _storePlatformKindForMediaItem:v7];

    [v12 setStorePlatformKind:v13];
    *a3 = 1;
  }
}

- (void)removeMediaItemsForLibraryItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)SUUIMediaPlayerFramework();
  id v5 = (objc_class *)SUUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, (uint64_t)v4);
  id v6 = SUUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v4);
  id v19 = SUUIWeakLinkedClassForString(&cfstr_Mpmedialibrary.isa, (uint64_t)v4);
  id v7 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v4);
  id v8 = objc_alloc_init(v5);
  id v9 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v13), "storeItemIdentifier", v19);
        id v15 = [v6 predicateWithValue:v14 forProperty:v7];

        [v8 addFilterPredicate:v15];
        id v16 = [v8 items];
        v17 = [v16 firstObject];

        if (v17) {
          [v9 addObject:v17];
        }
        [v8 removeFilterPredicate:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  if ([v9 count])
  {
    v18 = [v19 defaultMediaLibrary];
    [v18 removeItems:v9];
  }
}

- (int64_t)_availabilityForMediaItem:(id)a3
{
  id v3 = a3;
  if (_availabilityForMediaItem__sOnce != -1) {
    dispatch_once(&_availabilityForMediaItem__sOnce, &__block_literal_global_59);
  }
  id v4 = [v3 valueForProperty:_availabilityForMediaItem__sFamilyAccountIDProperty];
  if ([v4 unsignedLongLongValue] && (objc_msgSend(v3, "mediaType") & 0x300) != 0)
  {
    id v5 = [v3 valueForProperty:_availabilityForMediaItem__sFilePathProperty];
    if ([v5 length])
    {
      id v6 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v5 isDirectory:0];
      id v7 = (void *)[objc_alloc((Class)_availabilityForMediaItem__sPlayerItemClass) initWithURL:v6];
      if ([v7 isContentAuthorizedForPlayback]) {
        int64_t v8 = 2;
      }
      else {
        int64_t v8 = 0;
      }
    }
    else
    {
      int64_t v8 = 2;
    }
  }
  else
  {
    int64_t v8 = 2;
  }

  return v8;
}

id __55__SUUIMediaLibraryInterface__availabilityForMediaItem___block_invoke()
{
  v0 = (void *)SUUIMediaPlayerFramework();
  v1 = (id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreFamilyAccountID", v0);
  objc_storeStrong((id *)&_availabilityForMediaItem__sFamilyAccountIDProperty, *v1);
  v2 = (id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyFilePath", v0);
  objc_storeStrong((id *)&_availabilityForMediaItem__sFilePathProperty, *v2);
  uint64_t v3 = SUUIAVFoundationFramework();
  id result = SUUIWeakLinkedClassForString(&cfstr_Avplayeritem.isa, v3);
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
  uint64_t v3 = (void *)SUUIMediaPlayerFramework();
  id v4 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, (uint64_t)v3));
  [(SUUIMediaLibraryInterface *)self _restrictQueryToLocalContent:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  objc_msgSend(v5, "addObject:", *(void *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v3));
  objc_msgSend(v5, "addObject:", *(void *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsRental", v3));
  objc_msgSend(v5, "addObject:", *(void *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyMediaType", v3));
  objc_msgSend(v5, "addObject:", *(void *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v3));
  [v4 setItemPropertiesToFetch:v5];

  return v4;
}

- (void)_restrictQueryToLocalContent:(id)a3
{
  id v3 = a3;
  id v4 = (void *)SUUIMediaPlayerFramework();
  id v5 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsLocal", v4);
  objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, (uint64_t)v4), "predicateWithValue:forProperty:", MEMORY[0x263EFFA88], v5);
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

@end