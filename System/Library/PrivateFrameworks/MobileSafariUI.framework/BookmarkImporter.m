@interface BookmarkImporter
- (BookmarkImporter)initWithBookmarkCollection:(id)a3;
- (id)_builtInBookmarkItemWithTemplate:(id)a3 forLocale:(id)a4 deviceClass:(int64_t)a5;
- (id)_builtinBookmarkWithInfo:(id)a3 asCarrierBookmark:(BOOL)a4;
- (id)_builtinFavoritesForLocale:(id)a3 deviceClass:(int64_t)a4;
- (id)_googleChannelReplacementStringForDeviceClass:(int64_t)a3;
- (id)_lastImportedCarrierBookmarksInfo;
- (id)_myAccountBookmarkInfo;
- (id)_oldDeletedStaticBookmarks;
- (id)_uniqueYouTubeBookmarkFolderName;
- (id)test_builtinFavoritesForLocale:(id)a3 deviceClass:(int64_t)a4;
- (int64_t)_currentDeviceClass;
- (void)_appendBookmarksFromSource:(id)a3 toParent:(int)a4;
- (void)_appendBuiltinBookmarkWithInfo:(id)a3 toParent:(int)a4 asCarrierBookmark:(BOOL)a5;
- (void)_clearOldDeletedStaticBookmarks;
- (void)_getCarrierBundleBuiltinBookmarkInfoWithCompletion:(id)a3;
- (void)_importBuiltinBookmarksWithCarrierBookmarkInfo:(id)a3;
- (void)_importCarrierBookmarksIfNecessary;
- (void)_importFavoritesFolderBuiltinBookmarks;
- (void)_importRootFolderBuiltinBookmarks;
- (void)_setLastImportedCarrierBookmarksInfo:(id)a3;
- (void)importBuiltinBookmarks;
- (void)migrateYouTubeBookmarks;
@end

@implementation BookmarkImporter

uint64_t __42__BookmarkImporter_importBuiltinBookmarks__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _importBuiltinBookmarksWithCarrierBookmarkInfo:*(void *)(a1 + 40)];
}

- (BookmarkImporter)initWithBookmarkCollection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BookmarkImporter;
  v6 = [(BookmarkImporter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    v8 = v7;
  }

  return v7;
}

- (void)importBuiltinBookmarks
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__BookmarkImporter_importBuiltinBookmarks__block_invoke;
  v2[3] = &unk_1E6D7E428;
  v2[4] = self;
  [(BookmarkImporter *)self _getCarrierBundleBuiltinBookmarkInfoWithCompletion:v2];
}

- (void)_getCarrierBundleBuiltinBookmarkInfoWithCompletion:(id)a3
{
  v3 = (void (**)(id, void))a3;
  if ((MGGetBoolAnswer() & 1) == 0) {
    v3[2](v3, MEMORY[0x1E4F1CBF0]);
  }
  v4 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke;
  block[3] = &unk_1E6D79320;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldDeletedStaticBookmarks, 0);
  objc_storeStrong((id *)&self->_carrierBookmarkInfo, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)_importBuiltinBookmarksWithCarrierBookmarkInfo:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_carrierBookmarkInfo, a3);
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v6 BOOLForKey:@"DidImportBuiltinBookmarks"])
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_INFO, "Safari has already imported built-in bookmarks; No need to import them again",
        (uint8_t *)buf,
        2u);
    }
    MEMORY[0x1E4E42160](buf, @"com.apple.MobileSafari.BookmarkImporter");
    if ([MEMORY[0x1E4FB60E8] lockSync])
    {
      [(BookmarkImporter *)self _importCarrierBookmarksIfNecessary];
      [MEMORY[0x1E4FB60E8] unlockSync];
    }
    else
    {
      objc_super v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[BookmarkImporter _importBuiltinBookmarksWithCarrierBookmarkInfo:]();
      }
    }
  }
  else
  {
    MEMORY[0x1E4E42160](buf, @"com.apple.MobileSafari.BookmarkImporter");
    if ([MEMORY[0x1E4FB60E8] lockSync])
    {
      if ([(WebBookmarkCollection *)self->_collection isEmpty])
      {
        v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_INFO, "Bookmarks collection is empty. Importing built-in bookmarks at root level", v15, 2u);
        }
        [(BookmarkImporter *)self _importRootFolderBuiltinBookmarks];
      }
      else
      {
        v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_INFO, "Bookmarks collection is not empty. Importing carrier bookmarks if needed", v15, 2u);
        }
        [(BookmarkImporter *)self _importCarrierBookmarksIfNecessary];
      }
      v12 = [(WebBookmarkCollection *)self->_collection bookmarksBarList];
      int v13 = [v12 bookmarkCount];

      if (!v13)
      {
        v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_INFO, "Favorites folder is empty. Importing built-in bookmarks for Favorites", v15, 2u);
        }
        [(BookmarkImporter *)self _importFavoritesFolderBuiltinBookmarks];
      }
      [MEMORY[0x1E4FB60E8] unlockSync];
      [(BookmarkImporter *)self _clearOldDeletedStaticBookmarks];
      [v6 setBool:1 forKey:@"DidImportBuiltinBookmarks"];
    }
    else
    {
      v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BookmarkImporter _importBuiltinBookmarksWithCarrierBookmarkInfo:]();
      }
    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(buf);
}

- (void)_importCarrierBookmarksIfNecessary
{
  carrierBookmarkInfo = self->_carrierBookmarkInfo;
  v4 = [(BookmarkImporter *)self _lastImportedCarrierBookmarksInfo];
  LOBYTE(carrierBookmarkInfo) = [(NSArray *)carrierBookmarkInfo isEqual:v4];

  if ((carrierBookmarkInfo & 1) == 0)
  {
    [(WebBookmarkCollection *)self->_collection clearCarrierBookmarks];
    id v5 = [(WebBookmarkCollection *)self->_collection rootBookmark];
    uint64_t v6 = [v5 identifier];

    [(BookmarkImporter *)self _appendBookmarksFromSource:@"CarrierBundle" toParent:v6];
  }
}

- (id)_lastImportedCarrierBookmarksInfo
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WebBookmarkCollection *)self->_collection syncDataForKey:@"LastImportedCarrierBookmarksArray"];
  if (v3)
  {
LABEL_4:
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v4 = 0;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7[0] = v4;
        id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      }
      else
      {
        id v5 = 0;
      }
    }

    goto LABEL_10;
  }
  v3 = [(WebBookmarkCollection *)self->_collection syncDataForKey:@"LastImportedCarrierBookmarksDictionary"];
  if (v3)
  {
    [(WebBookmarkCollection *)self->_collection setSyncData:0 forKey:@"LastImportedCarrierBookmarksDictionary"];
    goto LABEL_4;
  }
  id v5 = 0;
LABEL_10:
  return v5;
}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.BookmarkImporter", v2);

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v3];
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_252;
  v10[3] = &unk_1E6D7E400;
  uint64_t v6 = v5;
  v11 = v6;
  id v7 = v4;
  id v12 = v7;
  int v13 = &v14;
  [v7 getSubscriptionInfo:v10];
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if ([(id)v15[5] count])
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(id)v15[5] count];
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Successfully imported %ld carrier bookmarks.", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  _Block_object_dispose(&v14, 8);
}

void __42__BookmarkImporter_importBuiltinBookmarks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__BookmarkImporter_importBuiltinBookmarks__block_invoke_2;
  v5[3] = &unk_1E6D791E8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  v18 = v5;
  id v19 = v6;
  if (!v5 || v6)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(v7, "safari_privacyPreservingDescription", v5, v19);
      __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_252_cold_1(v17, buf, v8);
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = objc_msgSend(v5, "subscriptionsInUse", v5, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          int v13 = *(void **)(a1 + 32);
          uint64_t v14 = *(void **)(a1 + 40);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_253;
          v20[3] = &unk_1E6D7E3D8;
          id v15 = v13;
          uint64_t v16 = *(void *)(a1 + 48);
          id v21 = v15;
          uint64_t v22 = v16;
          [v14 copyCarrierBookmarks:v12 completion:v20];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_oldDeletedStaticBookmarks
{
  oldDeletedStaticBookmarks = self->_oldDeletedStaticBookmarks;
  if (!oldDeletedStaticBookmarks)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v5 = [v4 objectForKey:@"DeletedStaticBookmarks"];
    id v6 = self->_oldDeletedStaticBookmarks;
    self->_oldDeletedStaticBookmarks = v5;

    oldDeletedStaticBookmarks = self->_oldDeletedStaticBookmarks;
  }
  return oldDeletedStaticBookmarks;
}

- (void)_clearOldDeletedStaticBookmarks
{
  oldDeletedStaticBookmarks = self->_oldDeletedStaticBookmarks;
  self->_oldDeletedStaticBookmarks = 0;

  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObjectForKey:@"DeletedStaticBookmarks"];
}

- (id)_builtinFavoritesForLocale:(id)a3 deviceClass:(int64_t)a4
{
  v44[8] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  uint64_t v29 = [v30 objectForKey:*MEMORY[0x1E4F1C400]];
  if (![(__CFString *)v29 length])
  {

    uint64_t v29 = @"US";
  }
  v28 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"CN", 0);
  v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"TW", 0);
  long long v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"HK", @"MO", 0);
  long long v25 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"RU", @"UA", @"TR", @"KZ", @"BY", 0);
  long long v24 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"NL", @"DK", @"FI", @"NO", @"PL", @"PT", @"TH", @"HR", @"CZ", @"IL", @"HU", @"SK", @"KR", 0);
  long long v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"JP", 0);
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"GB", 0);
  id v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"IN", 0);
  if ([v28 containsObject:v29])
  {
    v44[0] = @"Apple";
    v44[1] = @"iCloud";
    v44[2] = @"Baidu";
    v44[3] = @"Sogou";
    v44[4] = @"Qihoo";
    v44[5] = @"Bing";
    v44[6] = @"Baike";
    v44[7] = @"Sina";
    id v6 = v44;
LABEL_9:
    uint64_t v7 = 8;
    goto LABEL_10;
  }
  if ([v27 containsObject:v29])
  {
    v43[0] = @"Apple";
    v43[1] = @"iCloud";
    v43[2] = @"Google";
    v43[3] = @"Yahoo";
    v43[4] = @"Wikipedia";
    v43[5] = @"Facebook";
    v43[6] = @"Twitter";
    v43[7] = @"iPeen";
    id v6 = v43;
    goto LABEL_9;
  }
  if ([v26 containsObject:v29])
  {
    v42[0] = @"Apple";
    v42[1] = @"iCloud";
    v42[2] = @"Google";
    v42[3] = @"Yahoo";
    v42[4] = @"Wikipedia";
    v42[5] = @"Facebook";
    v42[6] = @"Twitter";
    v42[7] = @"OpenRice";
    id v6 = v42;
    goto LABEL_9;
  }
  if ([v25 containsObject:v29])
  {
    v41[0] = @"Apple";
    v41[1] = @"Yandex";
    v41[2] = @"Bing";
    v41[3] = @"Google";
    id v6 = v41;
LABEL_24:
    uint64_t v7 = 4;
    goto LABEL_10;
  }
  if (![v24 containsObject:v29])
  {
    if ([v23 containsObject:v29])
    {
      v39[0] = @"Apple";
      v39[1] = @"iCloud";
      v39[2] = @"Google";
      v39[3] = @"Yahoo";
      v39[4] = @"Wikipedia";
      v39[5] = @"Facebook";
      v39[6] = @"Twitter";
      v39[7] = @"Asahi";
      id v6 = v39;
      goto LABEL_9;
    }
    if ([v22 containsObject:v29])
    {
      v38[0] = @"Apple";
      v38[1] = @"iCloud";
      v38[2] = @"Google";
      v38[3] = @"Yahoo";
      v38[4] = @"Wikipedia";
      v38[5] = @"Facebook";
      v38[6] = @"Twitter";
      v38[7] = @"BBC";
      id v6 = v38;
      goto LABEL_9;
    }
    if ([v21 containsObject:v29])
    {
      v37[0] = @"Apple";
      v37[1] = @"iCloud";
      v37[2] = @"Google";
      v37[3] = @"Yahoo";
      v37[4] = @"Facebook";
      v37[5] = @"Zomato";
      v37[6] = @"NDTV";
      v37[7] = @"Hotstar";
      id v6 = v37;
      goto LABEL_9;
    }
    v36[0] = @"Apple";
    v36[1] = @"Bing";
    v36[2] = @"Google";
    v36[3] = @"Yahoo";
    id v6 = v36;
    goto LABEL_24;
  }
  v40[0] = @"Apple";
  v40[1] = @"Bing";
  v40[2] = @"Google";
  id v6 = v40;
  uint64_t v7 = 3;
LABEL_10:
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:v7];
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
  v11 = [v10 pathForResource:@"BuiltInBookmarkItems" ofType:@"plist"];
  uint64_t v12 = [v9 dictionaryWithContentsOfFile:v11];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v20;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = [v12 objectForKey:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        v18 = [(BookmarkImporter *)self _builtInBookmarkItemWithTemplate:v17 forLocale:v30 deviceClass:a4];

        if (v18) {
          [v8 addObject:v18];
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  return v8;
}

- (id)test_builtinFavoritesForLocale:(id)a3 deviceClass:(int64_t)a4
{
  id v4 = [(BookmarkImporter *)self _builtinFavoritesForLocale:a3 deviceClass:a4];
  return v4;
}

- (id)_googleChannelReplacementStringForDeviceClass:(int64_t)a3
{
  if (a3) {
    return @"ipad_bm";
  }
  else {
    return @"iphone_bm";
  }
}

- (id)_builtInBookmarkItemWithTemplate:(id)a3 forLocale:(id)a4 deviceClass:(int64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v26 = a4;
  v27 = v8;
  if (!v8)
  {
    uint64_t v14 = 0;
    goto LABEL_33;
  }
  long long v23 = [v8 objectForKey:@"LocalizedTitle"];
  long long v24 = [v8 objectForKey:@"LocalizedURL"];
  uint64_t v22 = [v26 objectForKey:*MEMORY[0x1E4F1C400]];
  long long v25 = [v26 objectForKey:*MEMORY[0x1E4F1C438]];
  uint64_t v9 = [v22 length];
  uint64_t v10 = [v25 length];
  v28 = 0;
  if ([v23 count] && v9 | v10)
  {
    v28 = 0;
    if (v9 && v10)
    {
      v11 = [NSString stringWithFormat:@"%@_%@", v25, v22];
      v28 = [v23 objectForKey:v11];
    }
    if (!v28 && v10)
    {
      v28 = [v23 objectForKey:v25];
    }
  }
  uint64_t v12 = 0;
  if ([v24 count])
  {
    if (v9)
    {
      if (!v10
        || ([NSString stringWithFormat:@"%@_%@", v25, v22],
            id v13 = objc_claimAutoreleasedReturnValue(),
            [v24 objectForKey:v13],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            v13,
            !v12))
      {
        uint64_t v12 = [v24 objectForKey:v22];
        if (!v12)
        {
          if (v10)
          {
            uint64_t v12 = [v24 objectForKey:v25];
          }
        }
      }
    }
  }
  if (v28)
  {
    if (!v12) {
      goto LABEL_22;
    }
  }
  else
  {
    v28 = [v8 objectForKey:@"Title"];
    if (!v12)
    {
LABEL_22:
      uint64_t v12 = [v8 objectForKey:@"URL"];
    }
  }
  [v8 objectForKey:@"URLQueryStringParameterKeys"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v15);
        }
        if ([*(id *)(*((void *)&v29 + 1) + 8 * i) isEqualToString:@"$GOOGLE_CHANNEL"])
        {
          id v19 = [(BookmarkImporter *)self _googleChannelReplacementStringForDeviceClass:a5];
          uint64_t v20 = [v12 stringByReplacingOccurrencesOfString:@"$GOOGLE_CHANNEL" withString:v19];

          uint64_t v12 = (void *)v20;
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v16);
  }

  v33[0] = @"Title";
  v33[1] = @"URL";
  v34[0] = v28;
  v34[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

LABEL_33:
  return v14;
}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_253(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(v7, "safari_privacyPreservingDescription");
      __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_253_cold_1(v10, v11, v9);
    }
  }
  else
  {
    id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v8);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
    objc_sync_exit(v8);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_myAccountBookmarkInfo
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_carrierBookmarkInfo;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "safari_stringForKey:", @"MyAccountURLTitle_Localized");
        uint64_t v9 = objc_msgSend(v7, "safari_stringForKey:", @"MyAccountURL");
        uint64_t v10 = objc_msgSend(v9, "safari_bestURLForUserTypedString");
        v11 = [v10 absoluteString];

        if (v8) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {

          uint64_t v14 = v3;
          id v3 = 0;
          goto LABEL_14;
        }
        v21[0] = @"Title";
        v21[1] = @"URL";
        v22[0] = v8;
        v22[1] = v11;
        v21[2] = @"BookmarkType";
        v22[2] = @"CarrierBookmark";
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
        [(NSArray *)v3 addObject:v13];
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = obj;
LABEL_14:

  return v3;
}

- (id)_builtinBookmarkWithInfo:(id)a3 asCarrierBookmark:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F97E88] currentDevice];
  int v8 = [v7 deviceClass];

  BOOL v9 = v8 != 3;
  if (v8 == 3)
  {
    uint64_t v10 = @"iPadTitle";
LABEL_5:
    v11 = [v6 objectForKey:v10];
    if (v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v8 == 1)
  {
    uint64_t v10 = @"iPhoneTitle";
    goto LABEL_5;
  }
  BOOL v9 = 0;
LABEL_8:
  v11 = [v6 objectForKey:@"Title"];
LABEL_9:
  BOOL v12 = [MEMORY[0x1E4F28B50] mainBundle];
  id v13 = [v12 localizedStringForKey:v11 value:&stru_1F3C268E8 table:@"BuiltinBookmarks"];

  if (!v13)
  {
    long long v19 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[BookmarkImporter _builtinBookmarkWithInfo:asCarrierBookmark:]();
    }
    goto LABEL_14;
  }
  uint64_t v14 = [v6 objectForKey:@"IsFolder"];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4FB60E0]);
    long long v17 = [(WebBookmarkCollection *)self->_collection configuration];
    long long v18 = objc_msgSend(v16, "initFolderWithParentID:collectionType:", 0, objc_msgSend(v17, "collectionType"));

    [v18 setTitle:v13];
    goto LABEL_26;
  }
  if (v8 == 3)
  {
    long long v20 = [v6 objectForKey:@"iPadURL"];
    if (v9)
    {
LABEL_17:
      uint64_t v21 = [v6 objectForKey:@"iPhoneURL"];

      long long v20 = (void *)v21;
      if (v21) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else
  {
    long long v20 = 0;
    if (v9) {
      goto LABEL_17;
    }
  }
  if (v20) {
    goto LABEL_22;
  }
LABEL_21:
  long long v20 = [v6 objectForKey:@"URL"];
  if (!v20)
  {
    id v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[BookmarkImporter _builtinBookmarkWithInfo:asCarrierBookmark:]();
    }
LABEL_14:
    long long v18 = 0;
    goto LABEL_26;
  }
LABEL_22:
  uint64_t v22 = objc_msgSend(v6, "safari_stringForKey:", @"BookmarkType");
  long long v23 = v22;
  if (a4 || [v22 isEqualToString:@"CarrierBookmark"])
  {
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FB60E0]) initCarrierBookmarkWithTitle:v13 address:v20];
  }
  else if ([v23 isEqualToString:@"DeviceBookmark"])
  {
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FB60E0]) initBuiltinDeviceBookmarkWithTitle:v13 address:v20];
  }
  else
  {
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FB60E0]) initBuiltinBookmarkWithTitle:v13 address:v20];
  }
  long long v18 = (void *)v24;

LABEL_26:
  return v18;
}

- (void)_appendBookmarksFromSource:(id)a3 toParent:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"CarrierBundle"])
  {
    long long v18 = [(BookmarkImporter *)self _myAccountBookmarkInfo];
    if ([v18 count])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v6 = v18;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v29;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(v6);
            }
            [(BookmarkImporter *)self _appendBuiltinBookmarkWithInfo:*(void *)(*((void *)&v28 + 1) + 8 * v9++) toParent:v4 asCarrierBookmark:1];
          }
          while (v7 != v9);
          uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v7);
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obj = self->_carrierBookmarkInfo;
    uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v25;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v12), "safari_arrayForKey:", @"CarrierBookmarks");
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v21;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v21 != v16) {
                  objc_enumerationMutation(v14);
                }
                [(BookmarkImporter *)self _appendBuiltinBookmarkWithInfo:*(void *)(*((void *)&v20 + 1) + 8 * v17++) toParent:v4 asCarrierBookmark:1];
              }
              while (v15 != v17);
              uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
            }
            while (v15);
          }

          ++v12;
        }
        while (v12 != v10);
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v10);
    }

    [(BookmarkImporter *)self _setLastImportedCarrierBookmarksInfo:self->_carrierBookmarkInfo];
  }
}

- (void)_appendBuiltinBookmarkWithInfo:(id)a3 toParent:(int)a4 asCarrierBookmark:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = objc_msgSend(v8, "safari_stringForKey:", @"BookmarkType");
  int v10 = [v9 isEqualToString:@"BookmarkArray"];

  if (v10)
  {
    if (!v5)
    {
      uint64_t v11 = objc_msgSend(v8, "safari_stringForKey:", @"BookmarkArraySource");
      [(BookmarkImporter *)self _appendBookmarksFromSource:v11 toParent:v6];
    }
  }
  else
  {
    uint64_t v12 = [(BookmarkImporter *)self _builtinBookmarkWithInfo:v8 asCarrierBookmark:v5];
    if (v12
      && ([(BookmarkImporter *)self _oldDeletedStaticBookmarks],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v12 address],
          id v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v13 containsObject:v14],
          v14,
          v13,
          (v15 & 1) == 0))
    {
      [(WebBookmarkCollection *)self->_collection moveBookmark:v12 toFolderWithID:v6];
      [(WebBookmarkCollection *)self->_collection saveBookmark:v12];
      if ([v12 isFolder])
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v17 = objc_msgSend(v8, "objectForKey:", @"Bookmarks", 0);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v22;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v22 != v19) {
                objc_enumerationMutation(v17);
              }
              -[BookmarkImporter _appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:](self, "_appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:", *(void *)(*((void *)&v21 + 1) + 8 * v20++), [v12 identifier], v5);
            }
            while (v18 != v20);
            uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v27 count:16];
          }
          while (v18);
        }
      }
    }
    else
    {
      uint64_t v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v26 = v6;
        _os_log_impl(&dword_1E102C000, v16, OS_LOG_TYPE_DEFAULT, "Not appending bookmark to folder %d", buf, 8u);
      }
    }
  }
}

- (void)_importRootFolderBuiltinBookmarks
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v3 URLForResource:@"BuiltinBookmarks" withExtension:@"plist"];

  BOOL v5 = [MEMORY[0x1E4F1CA48] arrayWithContentsOfURL:v4];
  uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = [v5 count];
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Importing %zd root level built-in bookmarks", buf, 0xCu);
  }

  uint64_t v7 = [(WebBookmarkCollection *)self->_collection rootBookmark];
  uint64_t v8 = [v7 identifier];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        -[BookmarkImporter _appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:](self, "_appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), v8, 0, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_setLastImportedCarrierBookmarksInfo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:0];
  }
  else
  {
    BOOL v5 = 0;
  }
  [(WebBookmarkCollection *)self->_collection setSyncData:v5 forKey:@"LastImportedCarrierBookmarksArray"];
}

- (int64_t)_currentDeviceClass
{
  v2 = [MEMORY[0x1E4F97E88] currentDevice];
  int v3 = [v2 deviceClass];

  return v3 == 3;
}

- (void)_importFavoritesFolderBuiltinBookmarks
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Favorites folder does not exist. Importing built-in favorites will fail", v2, v3, v4, v5, v6);
}

- (id)_uniqueYouTubeBookmarkFolderName
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = [(WebBookmarkCollection *)self->_collection subfoldersOfID:0];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v20, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = v20;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = [v7 title];
        BOOL v9 = v8 == 0;

        if (!v9)
        {
          uint64_t v10 = [v7 title];
          [v2 addObject:v10];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  uint64_t v11 = [MEMORY[0x1E4F97E88] currentDevice];
  uint64_t v12 = [v11 userAssignedName];

  if (v12)
  {
    long long v13 = [NSString stringWithFormat:@"YouTube – %@", v12];
  }
  else
  {
    long long v13 = @"YouTube";
  }
  long long v14 = v13;
  uint64_t v15 = 1;
  for (j = v14; [v2 containsObject:j]; j = (void *)v18)
  {
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @" (%u)", v15);
    uint64_t v18 = [(__CFString *)v14 stringByAppendingString:v17];

    uint64_t v15 = (v15 + 1);
  }

  return j;
}

- (void)migrateYouTubeBookmarks
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Failed to remove migrated YouTube data", v2, v3, v4, v5, v6);
}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_252_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve carrier subscription info: %{public}@", buf, 0xCu);
}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_253_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Failed to copy carrier bookmarks: %{public}@", buf, 0xCu);
}

- (void)_builtinBookmarkWithInfo:asCarrierBookmark:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Cannot create a built-in bookmark without a title", v2, v3, v4, v5, v6);
}

- (void)_builtinBookmarkWithInfo:asCarrierBookmark:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Cannot create a built-in bookmark without a URL", v2, v3, v4, v5, v6);
}

- (void)_importBuiltinBookmarksWithCarrierBookmarkInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Couldn't acquire bookmarks lock to import carrier bookmarks. Will try again later.", v2, v3, v4, v5, v6);
}

- (void)_importBuiltinBookmarksWithCarrierBookmarkInfo:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Couldn't acquire bookmarks lock - failed to import builtin bookmarks. Will try again later.", v2, v3, v4, v5, v6);
}

@end