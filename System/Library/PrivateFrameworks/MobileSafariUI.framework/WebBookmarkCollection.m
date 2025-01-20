@interface WebBookmarkCollection
+ (PPTWebBookmarkCollection)bookmarkCollectionForPPTTest;
+ (id)leadImageURLForBookmark:(uint64_t)a1;
+ (void)_startBookmarkCollectionOpenRetryTimer;
+ (void)_stopBookmarkCollectionOpenRetryTimer;
+ (void)observeDatabaseVacuumNotification;
+ (void)stopObservingDatabaseVacuumNotification;
+ (void)test_overrideMainBookmarkCollection;
- (uint64_t)dropOperationForReadingListDropSession:(uint64_t)result;
- (uint64_t)markReadingListBookmark:(int)a3 asRead:(int)a4 postNotification:;
- (uint64_t)saveReadingListBookmarkWithTitle:(void *)a3 address:(void *)a4 previewText:(void *)a5 thumbnailURL:(void *)a6 siteName:(void *)a7 tabDocument:(int)a8 didFetchPage:(void *)a9 updateController:(_DWORD *)a10 savedBookmarkID:(unsigned __int8)a11 shouldFetchMetadata:;
- (uint64_t)updateBookmark:(void *)a3 withLeadImageURL:;
- (uint64_t)updateReadingListBookmarkWithID:(void *)a3 setTitle:(void *)a4 address:(void *)a5 previewText:(void *)a6 thumbnailURL:(void *)a7 siteName:;
- (void)_markDuplicateReadingListBookmarkUnread:(void *)a3 updatingController:;
- (void)_saveWebArchiveForTabDocument:(void *)a3 bookmark:;
- (void)dropBookmarks:(uint64_t)a3 inFolderWithID:(void *)a4 presentingViewController:(int)a5 isAddingBookmark:;
- (void)dropDragItemsInReadingList:(void *)a3 updatingController:;
- (void)saveReadingListBookmarkWithTitle:(void *)a3 address:;
@end

@implementation WebBookmarkCollection

+ (void)observeDatabaseVacuumNotification
{
  uint64_t v0 = self;
  if (!databaseVacuumDistributedNotificationToken)
  {
    uint64_t v1 = v0;
    v2 = [MEMORY[0x1E4F28C40] defaultCenter];
    uint64_t v3 = *MEMORY[0x1E4FB6150];
    v4 = [MEMORY[0x1E4F28F08] mainQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__WebBookmarkCollection_SafariExtras__observeDatabaseVacuumNotification__block_invoke;
    v7[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
    v7[4] = v1;
    uint64_t v5 = [v2 addObserverForName:v3 object:0 queue:v4 usingBlock:v7];
    v6 = (void *)databaseVacuumDistributedNotificationToken;
    databaseVacuumDistributedNotificationToken = v5;
  }
}

+ (void)_startBookmarkCollectionOpenRetryTimer
{
  uint64_t v0 = self;
  if (!bookmarkCollectionOpenRetryTimer)
  {
    uint64_t v1 = v0;
    dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    uint64_t v3 = (void *)bookmarkCollectionOpenRetryTimer;
    bookmarkCollectionOpenRetryTimer = (uint64_t)v2;

    v4 = bookmarkCollectionOpenRetryTimer;
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v4, v5, 0x2540BE400uLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __77__WebBookmarkCollection_SafariExtras___startBookmarkCollectionOpenRetryTimer__block_invoke;
    handler[3] = &__block_descriptor_40_e5_v8__0l;
    handler[4] = v1;
    dispatch_source_set_event_handler((dispatch_source_t)bookmarkCollectionOpenRetryTimer, handler);
    dispatch_resume((dispatch_object_t)bookmarkCollectionOpenRetryTimer);
  }
}

void __72__WebBookmarkCollection_SafariExtras__observeDatabaseVacuumNotification__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) mainBookmarkCollection];
  if (v1)
  {
    id v6 = v1;
    if (postedBookmarkCollectionHasBecomeAvailableNotification)
    {
      dispatch_source_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v3 = v2;
      v4 = (__CFString *)*MEMORY[0x1E4FB6148];
      id v5 = v6;
    }
    else
    {
      postedBookmarkCollectionHasBecomeAvailableNotification = 1;
      dispatch_source_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v3 = v2;
      v4 = @"bookmarkCollectionHasBecomeAvailableNotification";
      id v5 = 0;
    }
    [v2 postNotificationName:v4 object:v5];

    uint64_t v1 = v6;
  }
}

+ (void)stopObservingDatabaseVacuumNotification
{
  self;
  if (databaseVacuumDistributedNotificationToken)
  {
    uint64_t v0 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v0 removeObserver:databaseVacuumDistributedNotificationToken name:*MEMORY[0x1E4FB6150] object:0];

    uint64_t v1 = (void *)databaseVacuumDistributedNotificationToken;
    databaseVacuumDistributedNotificationToken = 0;
  }
}

void __77__WebBookmarkCollection_SafariExtras___startBookmarkCollectionOpenRetryTimer__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) mainBookmarkCollection];

  if (v1)
  {
    +[WebBookmarkCollection _stopBookmarkCollectionOpenRetryTimer]();
    if ((postedBookmarkCollectionHasBecomeAvailableNotification & 1) == 0)
    {
      postedBookmarkCollectionHasBecomeAvailableNotification = 1;
      id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v2 postNotificationName:@"bookmarkCollectionHasBecomeAvailableNotification" object:0];
    }
  }
}

+ (void)_stopBookmarkCollectionOpenRetryTimer
{
  self;
  if (bookmarkCollectionOpenRetryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)bookmarkCollectionOpenRetryTimer);
    uint64_t v0 = (void *)bookmarkCollectionOpenRetryTimer;
    bookmarkCollectionOpenRetryTimer = 0;
  }
}

+ (PPTWebBookmarkCollection)bookmarkCollectionForPPTTest
{
  self;
  [(id)objc_opt_class() lockSync];
  uint64_t v0 = [PPTWebBookmarkCollection alloc];
  uint64_t v1 = [MEMORY[0x1E4FB6060] inMemoryBookmarkCollectionConfiguration];
  id v2 = [(PPTWebBookmarkCollection *)v0 initWithConfiguration:v1];

  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = [v3 BOOLForKey:@"DidImportBuiltinBookmarks"];
  [v3 setBool:0 forKey:@"DidImportBuiltinBookmarks"];
  id v5 = [[BookmarkImporter alloc] initWithBookmarkCollection:v2];
  [(BookmarkImporter *)v5 importBuiltinBookmarks];
  [v3 setBool:v4 forKey:@"DidImportBuiltinBookmarks"];
  [(PPTWebBookmarkCollection *)v2 test_restoreMissingSpecialBookmarks];
  [(id)objc_opt_class() unlockSync];

  return v2;
}

+ (void)test_overrideMainBookmarkCollection
{
  uint64_t v0 = [NSString stringWithFormat:&stru_1F3C268E8];
  uint64_t v1 = NSString;
  id v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Safari/iOS/MobileSafari/SafariWebBookmarkCollectionExtras.m"];
  uint64_t v3 = [v2 lastPathComponent];
  if ([v0 length])
  {
    id v5 = [NSString stringWithFormat:@", %@", v0];
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "[UIApplication sharedApplication].launchedToTest", "+[WebBookmarkCollection(SafariExtras) test_overrideMainBookmarkCollection]", v3, 189, v5];
  }
  else
  {
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "[UIApplication sharedApplication].launchedToTest", "+[WebBookmarkCollection(SafariExtras) test_overrideMainBookmarkCollection]", v3, 189, &stru_1F3C268E8];
  }

  id v6 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog((NSString *)@"%@\n%@", v4, v6);

  abort();
}

- (void)saveReadingListBookmarkWithTitle:(void *)a3 address:
{
  if (result) {
    return (void *)-[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:previewText:thumbnailURL:siteName:tabDocument:didFetchPage:updateController:savedBookmarkID:shouldFetchMetadata:](result, a2, a3, 0, 0, 0, 0, 0, 0, 0, 1u);
  }
  return result;
}

- (uint64_t)saveReadingListBookmarkWithTitle:(void *)a3 address:(void *)a4 previewText:(void *)a5 thumbnailURL:(void *)a6 siteName:(void *)a7 tabDocument:(int)a8 didFetchPage:(void *)a9 updateController:(_DWORD *)a10 savedBookmarkID:(unsigned __int8)a11 shouldFetchMetadata:
{
  id v18 = a2;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a9;
  if (!a1)
  {
    unsigned __int8 v49 = 0;
    goto LABEL_10;
  }
  if (([(id)objc_opt_class() lockSync] & 1) == 0)
  {
    v29 = [MEMORY[0x1E4FB6098] defaultReadingList];
    unsigned __int8 v49 = [v29 addReadingListItemWithURL:v19 title:v18 previewText:v20 error:0];

LABEL_10:
    v25 = v18;
    goto LABEL_30;
  }
  int v46 = a8;
  id v47 = v22;
  v25 = [MEMORY[0x1E4FB60E0] _trimmedTitle:v18];

  if (v20)
  {
    uint64_t v26 = [MEMORY[0x1E4FB60E0] _trimmedPreviewText:v20];

    id v20 = (id)v26;
  }
  v27 = [v19 absoluteString];
  v28 = [a1 firstReadingListBookmarkWithURLMatchingString:v27 prefixMatch:0];

  if (v28)
  {
    -[WebBookmarkCollection _markDuplicateReadingListBookmarkUnread:updatingController:](a1, v28, v24);
    [(id)objc_opt_class() unlockSync];
    if (a10) {
      *a10 = [v28 identifier];
    }
    unsigned __int8 v49 = 1;
  }
  else
  {
    v45 = v21;
    id v30 = objc_alloc(MEMORY[0x1E4FB60E0]);
    v31 = [v19 absoluteString];
    v32 = (void *)[v30 initReadingListBookmarkWithTitle:v25 address:v31 previewText:v20];

    v33 = [a1 readingListFolder];
    objc_msgSend(a1, "moveBookmark:toFolderWithID:", v32, objc_msgSend(v33, "identifier"));

    if (v46)
    {
      v34 = [MEMORY[0x1E4F1C9C8] date];
      [v32 setDateLastFetched:v34];
    }
    [v32 setAddedLocally:1];
    if (v45)
    {
      v35 = objc_msgSend(v45, "safari_originalDataAsString");
      [v32 setReadingListIconURL:v35];
    }
    v36 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v37 = objc_msgSend(v36, "safari_shouldAutomaticallyDownloadReadingListItems");

    if (v23 && ([v23 isReaderAvailable] & 1) == 0 && ((v37 ^ 1) & 1) == 0) {
      -[WebBookmarkCollection _saveWebArchiveForTabDocument:bookmark:]((uint64_t)a1, v23, v32);
    }
    [a1 saveBookmark:v32];
    if (((a11 ^ 1 | v37) & 1) == 0)
    {
      v38 = +[ReadingListMetadataFetcher sharedMetadataFetcher];
      v39 = v38;
      if (v46) {
        id v40 = v23;
      }
      else {
        id v40 = 0;
      }
      [v38 fetchMetadataForReadingListBookmark:v32 withProvider:v40];
    }
    v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v41 postNotificationName:@"ReadingListBookmarkAddedNotification" object:0];

    v42 = +[Application sharedApplication];
    [v42 setReadingListWidgetNeedsReload];

    v43 = WBS_LOG_CHANNEL_PREFIXWidgets();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v43, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item addition", buf, 2u);
    }
    [(id)objc_opt_class() unlockSync];
    id v22 = v47;
    if (a10) {
      *a10 = [v32 identifier];
    }
    unsigned __int8 v49 = 1;

    id v21 = v45;
  }

LABEL_30:
  return v49;
}

- (void)_saveWebArchiveForTabDocument:(void *)a3 bookmark:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = [v6 webarchivePathInReaderForm:0 fileExists:0];
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = [v8 stringByDeletingLastPathComponent];
    int v11 = objc_msgSend(v9, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v10, 0);

    if (v11)
    {
      uint64_t v19 = 0;
      id v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v22 = *MEMORY[0x1E4FB2748];
      v12 = (void *)*MEMORY[0x1E4FB2608];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __78__WebBookmarkCollection_SafariExtras___saveWebArchiveForTabDocument_bookmark___block_invoke;
      v18[3] = &unk_1E6D77CE0;
      v18[4] = &v19;
      uint64_t v13 = [v12 beginBackgroundTaskWithName:@"com.apple.mobilesafari.SaveWebArchive" expirationHandler:v18];
      v20[3] = v13;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __78__WebBookmarkCollection_SafariExtras___saveWebArchiveForTabDocument_bookmark___block_invoke_2;
      v14[3] = &unk_1E6D7E080;
      id v15 = v7;
      uint64_t v16 = a1;
      v17 = &v19;
      [v5 saveWebArchiveToPath:v8 completion:v14];

      _Block_object_dispose(&v19, 8);
    }
  }
}

void __78__WebBookmarkCollection_SafariExtras___saveWebArchiveForTabDocument_bookmark___block_invoke(uint64_t a1)
{
  NSLog((NSString *)@"Background task expired while waiting for current page's webarchive to save.");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    id v2 = (void *)*MEMORY[0x1E4FB2608];
    objc_msgSend(v2, "endBackgroundTask:");
  }
}

uint64_t __78__WebBookmarkCollection_SafariExtras___saveWebArchiveForTabDocument_bookmark___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setArchiveStatus:1];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [v3 setDateLastArchived:v4];

    if ([MEMORY[0x1E4FB60E8] isLockedSync])
    {
      [*(id *)(a1 + 40) saveBookmark:*(void *)(a1 + 32)];
    }
    else if ([(id)objc_opt_class() lockSync])
    {
      [*(id *)(a1 + 40) saveBookmark:*(void *)(a1 + 32)];
      [(id)objc_opt_class() unlockSync];
    }
  }
  uint64_t result = [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *MEMORY[0x1E4FB2748];
  return result;
}

- (void)_markDuplicateReadingListBookmarkUnread:(void *)a3 updatingController:
{
  id v5 = a2;
  if (a1)
  {
    id v12 = v5;
    id v6 = a3;
    int v7 = [v6 showingAllBookmarks];
    if ((v7 & 1) != 0
      || v6
      && ([v12 dateLastViewed], v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      uint64_t v9 = [a1 indexOfReadingListBookmark:v12 countingOnlyUnread:v7 ^ 1u];
    }
    else
    {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v10 = [MEMORY[0x1E4F1C9C8] date];
    [v12 setDateAdded:v10];

    [v12 setReadingListDateLastViewed:0];
    [a1 saveBookmark:v12];
    int v11 = [a1 readingListWithUnreadOnly:0];
    objc_msgSend(a1, "reorderBookmark:toIndex:", v12, objc_msgSend(v11, "bookmarkCount") - 1);

    [v6 didMarkBookmarkUnreadAtIndex:v9];
    id v5 = v12;
  }
}

- (uint64_t)updateBookmark:(void *)a3 withLeadImageURL:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int v7 = [v5 localAttributes];
    v8 = (void *)[v7 mutableCopy];

    if (!v8)
    {
      v8 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v9 = objc_msgSend(v6, "safari_originalDataAsString");
    [v8 setObject:v9 forKeyedSubscript:@"leadImageURL"];

    [v5 setLocalAttributes:v8];
    if ([(id)objc_opt_class() lockSync])
    {
      uint64_t v10 = [a1 saveBookmark:v5];
      [(id)objc_opt_class() unlockSync];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)leadImageURLForBookmark:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 localAttributes];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"leadImageURL"];

  if ([v4 length])
  {
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (uint64_t)markReadingListBookmark:(int)a3 asRead:(int)a4 postNotification:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = v7;
  if (!a1) {
    goto LABEL_27;
  }
  uint64_t v9 = [v7 dateLastViewed];
  char v10 = (v9 == 0) ^ a3;

  if (v10)
  {
LABEL_3:
    uint64_t v11 = 1;
    goto LABEL_4;
  }
  if (a3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    [v8 setReadingListDateLastViewed:v13];
  }
  else
  {
    [v8 setReadingListDateLastViewed:0];
  }
  if (([(id)objc_opt_class() lockSync] & 1) == 0)
  {
    v17 = +[FeatureManager sharedFeatureManager];
    int v18 = [v17 isInMemoryBookmarkChangeTrackingAvailable];

    if (v18)
    {
      [a1 modifyBookmarkInMemory:v8];
      if (a4)
      {
        uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v19 postNotificationName:@"ReadingListBookmarkDidUpdateNotification" object:v8];
      }
      id v20 = +[Application sharedApplication];
      [v20 setReadingListWidgetNeedsReload];

      uint64_t v21 = WBS_LOG_CHANNEL_PREFIXWidgets();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = @"unread";
        if (a3) {
          uint64_t v22 = @"read";
        }
        int v26 = 138477827;
        v27 = v22;
        _os_log_impl(&dword_1E102C000, v21, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item being marked %{private}@", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_3;
    }
    id v23 = +[Application sharedApplication];
    [v23 setReadingListWidgetNeedsReload];

    id v24 = WBS_LOG_CHANNEL_PREFIXWidgets();
    uint64_t v11 = 0;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    v25 = @"unread";
    if (a3) {
      v25 = @"read";
    }
    int v26 = 138477827;
    v27 = v25;
    _os_log_impl(&dword_1E102C000, v24, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item being marked %{private}@", (uint8_t *)&v26, 0xCu);
LABEL_27:
    uint64_t v11 = 0;
    goto LABEL_4;
  }
  uint64_t v11 = [a1 saveBookmark:v8];
  if (v11 && a4)
  {
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"ReadingListBookmarkDidUpdateNotification" object:v8];
  }
  [(id)objc_opt_class() unlockSync];
  WBSReloadReadingListWidget();
  id v15 = WBS_LOG_CHANNEL_PREFIXWidgets();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = @"unread";
    if (a3) {
      uint64_t v16 = @"read";
    }
    int v26 = 138477827;
    v27 = v16;
    _os_log_impl(&dword_1E102C000, v15, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item being marked %{private}@", (uint8_t *)&v26, 0xCu);
  }
LABEL_4:

  return v11;
}

- (uint64_t)updateReadingListBookmarkWithID:(void *)a3 setTitle:(void *)a4 address:(void *)a5 previewText:(void *)a6 thumbnailURL:(void *)a7 siteName:
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (a1 && [(id)objc_opt_class() lockSync])
  {
    int v18 = [a1 bookmarkWithID:a2];
    uint64_t v19 = v18;
    if (v18)
    {
      char v28 = 0;
      id v20 = [v18 webarchivePathInReaderForm:0 fileExists:&v28];
      uint64_t v21 = [v20 stringByDeletingPathExtension];

      if (v28
        && ([v21 stringByRemovingPercentEncoding],
            uint64_t v22 = objc_claimAutoreleasedReturnValue(),
            char v23 = [v14 containsString:v22],
            v22,
            (v23 & 1) != 0))
      {
        uint64_t v24 = 0;
      }
      else
      {
        v25 = [MEMORY[0x1E4F1C9C8] date];
        [v19 setTitle:v13 previewText:v15 dateLastFetched:v25];

        [v19 setAddress:v14];
        if (v16) {
          [v19 setReadingListIconURL:v16];
        }
        uint64_t v24 = [a1 saveBookmark:v19];
        if (v24)
        {
          int v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v26 postNotificationName:@"ReadingListBookmarkDidUpdateNotification" object:v19];
        }
      }
      [(id)objc_opt_class() unlockSync];
    }
    else
    {
      [(id)objc_opt_class() unlockSync];
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (void)dropBookmarks:(uint64_t)a3 inFolderWithID:(void *)a4 presentingViewController:(int)a5 isAddingBookmark:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  if (a1 && [v9 count])
  {
    uint64_t v11 = [MEMORY[0x1E4F781E8] sharedCoordinator];
    if ([v11 lockBookmarks])
    {
      if (([v10 isEditing] & 1) == 0)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __110__WebBookmarkCollection_SafariExtras__dropBookmarks_inFolderWithID_presentingViewController_isAddingBookmark___block_invoke;
        v23[3] = &unk_1E6D77E20;
        id v24 = v11;
        [v12 setHandler:v23];
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v13 = v9;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(a1, "saveAndMoveBookmark:toFolderID:", *(void *)(*((void *)&v19 + 1) + 8 * v17++), a3, (void)v19);
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v15);
      }

      if (!a5) {
        goto LABEL_17;
      }
      int v18 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v18 didAddBookmarkWithMethod:2];
    }
    else
    {
      [MEMORY[0x1E4F781E8] showLockedDatabaseAlertForAction:0 fromViewController:v10];
      int v18 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v18 didPreventBookmarkActionWithBookmarkType:0 actionType:3];
    }

LABEL_17:
  }
}

uint64_t __110__WebBookmarkCollection_SafariExtras__dropBookmarks_inFolderWithID_presentingViewController_isAddingBookmark___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unlockBookmarksSoon];
}

- (uint64_t)dropOperationForReadingListDropSession:(uint64_t)result
{
  if (result)
  {
    id v2 = [a2 items];
    int v3 = objc_msgSend(v2, "safari_containsObjectPassingTest:", &__block_literal_global_56);

    if (v3) {
      return 2;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)dropDragItemsInReadingList:(void *)a3 updatingController:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = (void *)MEMORY[0x1E4F1CB10];
    id v7 = objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_82_0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__WebBookmarkCollection_SafariExtras__dropDragItemsInReadingList_updatingController___block_invoke;
    v8[3] = &unk_1E6D7B058;
    v8[4] = a1;
    id v9 = v5;
    objc_msgSend(v6, "_sf_urlsFromDragItems:completionHandler:", v7, v8);
  }
}

void __85__WebBookmarkCollection_SafariExtras__dropDragItemsInReadingList_updatingController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = *(void **)(a1 + 32);
        uint64_t v10 = [v8 _title];
        uint64_t v11 = (void *)v10;
        if (v10) {
          id v12 = (__CFString *)v10;
        }
        else {
          id v12 = &stru_1F3C268E8;
        }
        int v13 = -[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:previewText:thumbnailURL:siteName:tabDocument:didFetchPage:updateController:savedBookmarkID:shouldFetchMetadata:](v9, v12, v8, 0, 0, 0, 0, 0, *(void **)(a1 + 40), 0, 1u);

        if (v13)
        {
          uint64_t v14 = [MEMORY[0x1E4F97E48] sharedLogger];
          [v14 didAddReadingListItemWithMethod:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

@end