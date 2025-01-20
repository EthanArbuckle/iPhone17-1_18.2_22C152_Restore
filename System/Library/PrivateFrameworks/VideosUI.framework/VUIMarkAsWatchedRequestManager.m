@interface VUIMarkAsWatchedRequestManager
+ (id)sharedInstance;
- (NSMutableDictionary)ongoingItemIDOperationDictionary;
- (VUIMarkAsWatchedRequestManager)init;
- (id)_init;
- (void)sendRequestForItemID:(id)a3 itemType:(id)a4 channelID:(id)a5 adamID:(id)a6;
- (void)setOngoingItemIDOperationDictionary:(id)a3;
@end

@implementation VUIMarkAsWatchedRequestManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_4 != -1) {
    dispatch_once(&sharedInstance___onceToken_4, &__block_literal_global_41);
  }
  v2 = (void *)sharedInstance___instance_2;
  return v2;
}

void __48__VUIMarkAsWatchedRequestManager_sharedInstance__block_invoke()
{
  id v0 = [[VUIMarkAsWatchedRequestManager alloc] _init];
  v1 = (void *)sharedInstance___instance_2;
  sharedInstance___instance_2 = (uint64_t)v0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIMarkAsWatchedRequestManager;
  v2 = [(VUIMarkAsWatchedRequestManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    ongoingItemIDOperationDictionary = v2->_ongoingItemIDOperationDictionary;
    v2->_ongoingItemIDOperationDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (VUIMarkAsWatchedRequestManager)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Unimplemented", @"-[VUIMarkAsWatchedRequestManager init] not supported, use +sharedInstance instead", 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)sendRequestForItemID:(id)a3 itemType:(id)a4 channelID:(id)a5 adamID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(NSMutableDictionary *)self->_ongoingItemIDOperationDictionary objectForKey:v10];
  v15 = v14;
  if (!v14 || [v14 isCancelled])
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB50D0]) initWithItemID:v10];
    if (v16)
    {
      objc_initWeak(&location, v16);
      objc_initWeak(&from, self);
      v17 = +[VUIStreamingBookmarkCache sharedInstance];
      [v17 removeBookmarkForCanonicalID:v10];
      id v23 = v11;

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke;
      block[3] = &unk_1E6DF3D58;
      id v18 = v13;
      id v29 = v18;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v19 = objc_msgSend(MEMORY[0x1E4F31928], "vui_mediaItemForStoreIdentifierString:", v18);
      v20 = v19;
      if (v19) {
        [v19 setValue:&unk_1F3F3C8F0 forProperty:*MEMORY[0x1E4F31318] withCompletionBlock:0];
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_28;
      v24[3] = &unk_1E6DF65E0;
      objc_copyWeak(&v26, &location);
      objc_copyWeak(&v27, &from);
      id v21 = v10;
      id v25 = v21;
      [v16 setCompletionBlock:v24];
      [(NSMutableDictionary *)self->_ongoingItemIDOperationDictionary setValue:v16 forKey:v21];
      v22 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
      [v22 addOperation:v16];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      id v11 = v23;
    }
  }
}

void __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v3 = [v2 sidebandMediaLibrary];
    id v7 = [v3 videoForAdamID:*(void *)(a1 + 32) useMainThreadContext:1];

    if (v7)
    {
      v4 = [MEMORY[0x1E4F1C9C8] date];
      [v7 setBookmarkTime:&unk_1F3F3C8F0];
      [v7 setBookmarkTimeStamp:v4];
      [v7 setMainContentRelativeBookmarkTime:&unk_1F3F3C8F0];
      [v7 setMainContentRelativeBookmarkTimeStamp:v4];
      v5 = +[VUIMediaLibraryManager defaultManager];
      objc_super v6 = [v5 sidebandMediaLibrary];
      [v6 saveChangesToManagedObjects];
    }
  }
}

void __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_28(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_2;
  block[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v7, a1 + 6);
  id v5 = a1[4];
  id v6 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
}

void __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained ongoingItemIDOperationDictionary];
  [v3 removeObjectForKey:a1[4]];

  v4 = [a1[5] error];

  if (!v4)
  {
    id v5 = +[VUIFeaturesConfiguration sharedInstance];
    id v6 = [v5 upNextConfig];
    uint64_t v7 = [v6 upNextCallDelayAfterMarkAsWatched];

    if (v7 < 1)
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"VUIPlayHistoryUpdatedNotification" object:a1[4]];

      id v10 = [MEMORY[0x1E4F28C40] defaultCenter];
      objc_msgSend(v10, "vui_postNotificationName:object:userInfo:", @"com.apple.VideosUI.PlayHistoryUpdatedNotification", a1[4], 0);
    }
    else
    {
      dispatch_time_t v8 = dispatch_time(0, 1000000 * v7);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_3;
      block[3] = &unk_1E6DF3D58;
      id v12 = a1[4];
      dispatch_after(v8, MEMORY[0x1E4F14428], block);
    }
  }
}

void __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VUIPlayHistoryUpdatedNotification" object:*(void *)(a1 + 32)];

  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  objc_msgSend(v3, "vui_postNotificationName:object:userInfo:", @"com.apple.VideosUI.PlayHistoryUpdatedNotification", *(void *)(a1 + 32), 0);
}

- (NSMutableDictionary)ongoingItemIDOperationDictionary
{
  return self->_ongoingItemIDOperationDictionary;
}

- (void)setOngoingItemIDOperationDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sendRequestForItemID:(os_log_t)log itemType:channelID:adamID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIMarkAsWatchRequestManager -- caught exception while getting request operation", v1, 2u);
}

@end