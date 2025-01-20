@interface CyclerCommandHandler
- (BOOL)_isBookmarkSyncEnabled;
- (BOOL)_isSpecialBookmark:(id)a3;
- (CyclerCommandHandler)init;
- (CyclerCommandHandler)initWithBookmarkCollection:(id)a3;
- (id)_cyclerRepresentationOfBookmark:(id)a3;
- (unint64_t)_adjustInsertionIndex:(unint64_t)a3 forInsertionIntoListWithIdentifier:(int)a4;
- (void)_startMonitoringSyncStatusWithCompletionHandler:(id)a3;
- (void)_tryToAcquireDatabaseLockWithCompletionHandler:(id)a3;
- (void)clearBookmarksWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)createBookmarkListWithTitle:(id)a3 inListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6;
- (void)createBookmarkWithTitle:(id)a3 url:(id)a4 inListWithIdentifier:(id)a5 atIndex:(unint64_t)a6 reply:(id)a7;
- (void)databaseLockAcquisitor:(id)a3 acquiredLock:(BOOL)a4;
- (void)deleteBookmarkWithIdentifier:(id)a3 reply:(id)a4;
- (void)fetchTopLevelBookmarkList:(id)a3;
- (void)moveBookmarkWithIdentifier:(id)a3 intoListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6;
- (void)setTitle:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5;
- (void)setURL:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5;
- (void)syncBookmarksWithCompletionHandler:(id)a3;
@end

@implementation CyclerCommandHandler

- (CyclerCommandHandler)init
{
  return 0;
}

- (CyclerCommandHandler)initWithBookmarkCollection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CyclerCommandHandler;
  v6 = [(CyclerCommandHandler *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bookmarkCollection, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    blocksAwaitingDatabaseLock = v7->_blocksAwaitingDatabaseLock;
    v7->_blocksAwaitingDatabaseLock = (NSMutableArray *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB6068]) initWithWebBookmarkCollectionClass:objc_opt_class()];
    bookmarkDatabaseLockAcquisitor = v7->_bookmarkDatabaseLockAcquisitor;
    v7->_bookmarkDatabaseLockAcquisitor = (WBDatabaseLockAcquisitor *)v10;

    [(WBDatabaseLockAcquisitor *)v7->_bookmarkDatabaseLockAcquisitor setDelegate:v7];
    v12 = v7;
  }

  return v7;
}

- (void)fetchTopLevelBookmarkList:(id)a3
{
  uint64_t v8 = (void (**)(id, void *))a3;
  v4 = [(WebBookmarkCollection *)self->_bookmarkCollection rootBookmark];
  id v5 = [(CyclerCommandHandler *)self _cyclerRepresentationOfBookmark:v4];

  v6 = [(WebBookmarkCollection *)self->_bookmarkCollection favoritesFolder];
  if (v6)
  {
    v7 = [(CyclerCommandHandler *)self _cyclerRepresentationOfBookmark:v6];
    [v5 insertChild:v7 atIndex:0];
  }
  v8[2](v8, v5);
}

- (void)clearBookmarksWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = @"local and remote";
    if ((a3 & 1) == 0) {
      uint64_t v8 = @"local";
    }
    *(_DWORD *)buf = 138543362;
    v15 = v8;
    _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_INFO, "Told to clear %{public}@ bookmarks", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke;
  v10[3] = &unk_1E6D78680;
  char v13 = a3 & 1;
  v10[4] = self;
  id v11 = v6;
  unint64_t v12 = a3;
  id v9 = v6;
  [(CyclerCommandHandler *)self _tryToAcquireDatabaseLockWithCompletionHandler:v10];
}

void __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    uint64_t v16 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_cold_2();
    }
    v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_24:
    v17();
    return;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v3 = [*(id *)(*(void *)(a1 + 32) + 8) rootList];
    v4 = [v3 bookmarkArray];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*(void *)(a1 + 32) + 8) deleteBookmark:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v6);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = [*(id *)(*(void *)(a1 + 32) + 8) favoritesFolderList];
    uint64_t v10 = [v9 bookmarkArray];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*(void *)(a1 + 32) + 8) deleteBookmark:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v12);
    }

    if (![*(id *)(*(void *)(a1 + 32) + 8) _usesCloudKit]
      && (*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_8;
      v23[3] = &unk_1E6D78658;
      v15 = *(void **)(a1 + 32);
      id v24 = *(id *)(a1 + 40);
      [v15 syncBookmarksWithCompletionHandler:v23];

      return;
    }
    v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_24;
  }
  v18 = *(void **)(*(void *)(a1 + 32) + 8);
  id v33 = 0;
  int v19 = [v18 mergeWithBookmarksDictionary:MEMORY[0x1E4F1CC08] clearHidden:1 error:&v33];
  id v20 = v33;
  if (v19)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) postBookmarksDidReloadNotification];
    v21 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_cold_1(v22, v20);
    }
    v21 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v21();
}

uint64_t __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_8(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) < 2 || !a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)createBookmarkWithTitle:(id)a3 url:(id)a4 inListWithIdentifier:(id)a5 atIndex:(unint64_t)a6 reply:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    id v28 = v12;
    __int16 v29 = 2114;
    id v30 = v13;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 1024;
    int v34 = a6;
    _os_log_impl(&dword_1E102C000, v16, OS_LOG_TYPE_INFO, "Told to create a bookmark (title: %{public}@, url: %{public}@) in list (identifier: %{public}@) at index %d", buf, 0x26u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke;
  v21[3] = &unk_1E6D786A8;
  id v25 = v15;
  unint64_t v26 = a6;
  v21[4] = self;
  id v22 = v14;
  id v23 = v12;
  id v24 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v14;
  id v20 = v15;
  [(CyclerCommandHandler *)self _tryToAcquireDatabaseLockWithCompletionHandler:v21];
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_5();
    }
    goto LABEL_7;
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_adjustInsertionIndex:forInsertionIntoListWithIdentifier:", *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_INFO, "Insertion index is not valid; bailing", v17, 2u);
    }
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    return;
  }
  uint64_t v6 = v3;
  id v7 = objc_alloc(MEMORY[0x1E4FB60E0]);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = objc_msgSend(*(id *)(a1 + 56), "safari_originalDataAsString");
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
  uint64_t v11 = objc_msgSend(v7, "initWithTitle:address:collectionType:", v8, v9, objc_msgSend(v10, "collectionType"));

  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "moveBookmark:toFolderWithID:", v11, objc_msgSend(*(id *)(a1 + 40), "integerValue")) & 1) == 0)
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_4();
    }
    goto LABEL_21;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 8) saveBookmark:v11] & 1) == 0)
  {
    id v14 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_3();
    }
    goto LABEL_21;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 8) reorderBookmark:v11 toIndex:v6] & 1) == 0)
  {
    id v15 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_2();
    }
    goto LABEL_21;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 8) saveBookmark:v11] & 1) == 0)
  {
    uint64_t v16 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_1();
    }
LABEL_21:
    id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_22;
  }
  id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_22:
  v12();
}

- (void)createBookmarkListWithTitle:(id)a3 inListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v11;
    __int16 v26 = 1024;
    int v27 = a5;
    _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_INFO, "Told to create a list (title: %{public}@) in list (identifier: %{public}@) at index %d", buf, 0x1Cu);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke;
  v17[3] = &unk_1E6D786D0;
  id v20 = v12;
  unint64_t v21 = a5;
  v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  [(CyclerCommandHandler *)self _tryToAcquireDatabaseLockWithCompletionHandler:v17];
}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_4();
    }
    goto LABEL_7;
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_adjustInsertionIndex:forInsertionIntoListWithIdentifier:", *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_INFO, "Insertion index is not valid; bailing", v15, 2u);
    }
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return;
  }
  uint64_t v6 = v3;
  id v7 = objc_alloc(MEMORY[0x1E4FB60E0]);
  uint64_t v8 = [*(id *)(a1 + 40) integerValue];
  id v9 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
  id v10 = objc_msgSend(v7, "initFolderWithParentID:collectionType:", v8, objc_msgSend(v9, "collectionType"));

  [v10 setTitle:*(void *)(a1 + 48)];
  if (([*(id *)(*(void *)(a1 + 32) + 8) saveBookmark:v10] & 1) == 0)
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_3();
    }
    goto LABEL_19;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 8) reorderBookmark:v10 toIndex:v6] & 1) == 0)
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_2();
    }
    goto LABEL_19;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 8) saveBookmark:v10] & 1) == 0)
  {
    id v14 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_1();
    }
    [*(id *)(*(void *)(a1 + 32) + 8) deleteBookmark:v10];
LABEL_19:
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_20;
  }
  id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_20:
  v11();
}

- (void)deleteBookmarkWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_INFO, "Told to delete a bookmark (identifier: %{public}@)", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E6D786F8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(CyclerCommandHandler *)self _tryToAcquireDatabaseLockWithCompletionHandler:v11];
}

void __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (uint64_t *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    if (v4)
    {
      if ([*(id *)(a1 + 32) _isSpecialBookmark:v4])
      {
        uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = *v3;
          int v11 = 138543362;
          uint64_t v12 = v6;
          _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Not deleting bookmark with identifier %{public}@ as it's a special bookmark", (uint8_t *)&v11, 0xCu);
        }
      }
      else
      {
        if ([*(id *)(*(void *)(a1 + 32) + 8) deleteBookmark:v4])
        {
          id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_16:
          v9();

          return;
        }
        id v10 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_2();
        }
      }
    }
    else
    {
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_1();
      }
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  id v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_3();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)moveBookmarkWithIdentifier:(id)a3 intoListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v11;
    __int16 v26 = 1024;
    int v27 = a5;
    _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_INFO, "Told to move a bookmark (identifier: %{public}@) into list (identifier: %{public}@) at index %d", buf, 0x1Cu);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke;
  v17[3] = &unk_1E6D786D0;
  v17[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [(CyclerCommandHandler *)self _tryToAcquireDatabaseLockWithCompletionHandler:v17];
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (uint64_t *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    if (!v4)
    {
      id v11 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_1();
      }
      goto LABEL_25;
    }
    if ([*(id *)(a1 + 32) _isSpecialBookmark:v4])
    {
      uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *v3;
        int v18 = 138543362;
        uint64_t v19 = v6;
        id v7 = "Not moving bookmark with identifier %{public}@ as it's a special bookmark";
        uint64_t v8 = v5;
        uint32_t v9 = 12;
LABEL_14:
        _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v18, v9);
      }
    }
    else
    {
      uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "_adjustInsertionIndex:forInsertionIntoListWithIdentifier:", *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 48), "integerValue"));
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          id v7 = "Insertion index is not valid; bailing";
          uint64_t v8 = v13;
          uint32_t v9 = 2;
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v14 = v12;
        if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "moveBookmark:toFolderWithID:", v4, objc_msgSend(*(id *)(a1 + 48), "integerValue")))
        {
          if ([*(id *)(*(void *)(a1 + 32) + 8) reorderBookmark:v4 toIndex:v14])
          {
            if ([*(id *)(*(void *)(a1 + 32) + 8) saveBookmark:v4])
            {
              (*(void (**)(void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 1);
LABEL_26:

              return;
            }
            id v17 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
              __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_2();
            }
          }
          else
          {
            id v16 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
              __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_3();
            }
          }
        }
        else
        {
          id v15 = WBS_LOG_CHANNEL_PREFIXCycler();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_4();
          }
        }
      }
    }
LABEL_25:
    (*(void (**)(void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0);
    goto LABEL_26;
  }
  id v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_5();
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)setTitle:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_INFO, "Told to change title of bookmark (identifier: %{public}@) to %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke;
  v15[3] = &unk_1E6D78720;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  [(CyclerCommandHandler *)self _tryToAcquireDatabaseLockWithCompletionHandler:v15];
}

void __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (uint64_t *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    if (v4)
    {
      if ([*(id *)(a1 + 32) _isSpecialBookmark:v4])
      {
        uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = *v3;
          int v11 = 138543362;
          uint64_t v12 = v6;
          _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Not changing title of bookmark with identifier %{public}@ as it's a special bookmark", (uint8_t *)&v11, 0xCu);
        }
      }
      else
      {
        [v4 setTitle:*(void *)(a1 + 48)];
        if ([*(id *)(*(void *)(a1 + 32) + 8) saveBookmark:v4])
        {
          id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_16:
          v9();

          return;
        }
        id v10 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_2();
        }
      }
    }
    else
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_1();
      }
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_16;
  }
  id v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_3();
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)setURL:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_INFO, "Told to change URL of bookmark (identifier: %{public}@) to %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke;
  v15[3] = &unk_1E6D78720;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  [(CyclerCommandHandler *)self _tryToAcquireDatabaseLockWithCompletionHandler:v15];
}

void __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (uint64_t *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    if (v4)
    {
      if ([*(id *)(a1 + 32) _isSpecialBookmark:v4])
      {
        uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = *v3;
          int v12 = 138543362;
          uint64_t v13 = v6;
          _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Not changing URL of bookmark with identifier %{public}@ as it's a special bookmark", (uint8_t *)&v12, 0xCu);
        }
      }
      else
      {
        id v9 = objc_msgSend(*(id *)(a1 + 48), "safari_originalDataAsString");
        [v4 setAddress:v9];

        if ([*(id *)(*(void *)(a1 + 32) + 8) saveBookmark:v4])
        {
          id v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_16:
          v10();

          return;
        }
        int v11 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_2();
        }
      }
    }
    else
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_1();
      }
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_16;
  }
  id v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_3();
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)syncBookmarksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Told to sync bookmarks", buf, 2u);
  }
  if ([(CyclerCommandHandler *)self _isBookmarkSyncEnabled])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__CyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E6D78748;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
  else
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Not syncing because bookmark sync is disabled", buf, 2u);
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 2);
  }
}

void __59__CyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_INFO, "Posting bookmark change notification", buf, 2u);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__CyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke_12;
  v4[3] = &unk_1E6D78658;
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 _startMonitoringSyncStatusWithCompletionHandler:v4];
  [*(id *)(*(void *)(a1 + 32) + 8) _postBookmarksChangedSyncNotification];
}

uint64_t __59__CyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)databaseLockAcquisitor:(id)a3 acquiredLock:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CyclerCommandHandler_databaseLockAcquisitor_acquiredLock___block_invoke;
  block[3] = &unk_1E6D780C8;
  BOOL v10 = a4;
  block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__CyclerCommandHandler_databaseLockAcquisitor_acquiredLock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 40), "releaseLock", (void)v8);
  }
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeAllObjects", (void)v8);
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return result;
}

- (void)_startMonitoringSyncStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ([(WebBookmarkCollection *)self->_bookmarkCollection _usesCloudKit])
  {
    uint64_t v5 = (__CFString *)(id)*MEMORY[0x1E4F98190];
    id v6 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "In CloudKit mode – waiting for notification from sync agent", buf, 2u);
    }
    uint64_t v7 = 0;
  }
  else
  {
    long long v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    uint64_t v7 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = 1;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_INFO, "In DAV mode – waiting for notification from DAV client", buf, 2u);
    }
    uint64_t v5 = @"com.apple.bookmarks.BookmarksFileChanged";
  }
  [(WBSDistributedNotificationObserver *)self->_syncAgentNotificationObserver stopWaiting];
  long long v9 = (WBSDistributedNotificationObserver *)[objc_alloc(MEMORY[0x1E4F98AC8]) initWithNotificationName:v5 type:v7];
  syncAgentNotificationObserver = self->_syncAgentNotificationObserver;
  self->_syncAgentNotificationObserver = v9;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E6D78770;
  objc_copyWeak(&v21, &location);
  id v11 = v4;
  id v20 = v11;
  [(WBSDistributedNotificationObserver *)self->_syncAgentNotificationObserver setNotificationHandler:v19];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_16;
  id v16 = &unk_1E6D78798;
  objc_copyWeak(&v18, &location);
  id v12 = v11;
  id v17 = v12;
  [(WBSDistributedNotificationObserver *)self->_syncAgentNotificationObserver setTimeoutHandler:&v13];
  -[WBSDistributedNotificationObserver waitWithTimeout:](self->_syncAgentNotificationObserver, "waitWithTimeout:", 60.0, v13, v14, v15, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

uint64_t __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_6;
  }
  if ([*((id *)WeakRetained + 1) _usesCloudKit])
  {
    id v6 = [v3 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F981B0]];

    if (!v7 || [v7 integerValue])
    {

LABEL_6:
      uint64_t v8 = 0;
      goto LABEL_11;
    }
  }
  long long v9 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_INFO, "Received notification from sync agent indicating sync has finished", v13, 2u);
  }
  long long v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  uint64_t v8 = 1;
  v10();
  id v11 = (void *)v5[3];
  v5[3] = 0;

LABEL_11:
  return v8;
}

void __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_16_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;
  }
}

- (BOOL)_isSpecialBookmark:(id)a3
{
  id v3 = a3;
  if ([v3 identifier]) {
    BOOL v4 = [v3 specialID] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (unint64_t)_adjustInsertionIndex:(unint64_t)a3 forInsertionIntoListWithIdentifier:(int)a4
{
  unint64_t v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if (a3)
    {
      id v6 = [(WebBookmarkCollection *)self->_bookmarkCollection favoritesFolder];

      if (v6) {
        uint64_t v7 = 4;
      }
      else {
        uint64_t v7 = 3;
      }
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        unint64_t v9 = v7 + v4;
        v10[0] = 67109376;
        v10[1] = v4;
        __int16 v11 = 1024;
        int v12 = v9;
        _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_INFO, "Adjusting insertion index %d to %d because it's offset by special bookmarks in the root folder", (uint8_t *)v10, 0xEu);
        return v9;
      }
      else
      {
        v4 += v7;
      }
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v4;
}

- (id)_cyclerRepresentationOfBookmark:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isFolder])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F98AA0]);
    id v6 = [v4 title];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "identifier"));
    uint64_t v8 = [v7 stringValue];
    unint64_t v9 = (void *)[v5 initWithTitle:v6 uniqueIdentifier:v8];

    long long v10 = -[WebBookmarkCollection listWithID:](self->_bookmarkCollection, "listWithID:", [v4 identifier]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    __int16 v11 = objc_msgSend(v10, "bookmarkArray", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [(CyclerCommandHandler *)self _cyclerRepresentationOfBookmark:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          [v9 addChild:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F1CB10];
    id v18 = [v4 address];
    long long v10 = objc_msgSend(v17, "safari_URLWithDataAsString:", v18);

    id v19 = objc_alloc(MEMORY[0x1E4F98A90]);
    __int16 v11 = [v4 title];
    id v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "identifier"));
    id v21 = [v20 stringValue];
    unint64_t v9 = (void *)[v19 initWithURL:v10 title:v11 uniqueIdentifier:v21];
  }
  if ([(WebBookmarkCollection *)self->_bookmarkCollection _usesCloudKit])
  {
    id v22 = [v4 extraAttributes];
    [v9 setExtraAttributes:v22];
  }
  return v9;
}

- (void)_tryToAcquireDatabaseLockWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__CyclerCommandHandler__tryToAcquireDatabaseLockWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6D78748;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71__CyclerCommandHandler__tryToAcquireDatabaseLockWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = (void *)MEMORY[0x1E4E42950](*(void *)(a1 + 40));
  [v2 addObject:v3];

  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 40))
  {
    [*(id *)(v4 + 32) acquireLockWithTimeout:5.0 retryInterval:0.1];
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  }
}

- (BOOL)_isBookmarkSyncEnabled
{
  id v2 = +[FeatureManager sharedFeatureManager];
  int v3 = [v2 isCloudSyncAvailable];

  if (!v3) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v5 = objc_msgSend(v4, "aa_primaryAppleAccountWithPreloadedDataclasses");
  char v6 = [v5 isEnabledForDataclass:*MEMORY[0x1E4F17A70]];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkDatabaseLockAcquisitor, 0);
  objc_storeStrong((id *)&self->_syncAgentNotificationObserver, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingDatabaseLock, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
}

void __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  char v6 = v4;
  _os_log_fault_impl(&dword_1E102C000, v3, OS_LOG_TYPE_FAULT, "Failed to clear local bookmarks - %{public}@", (uint8_t *)&v5, 0xCu);
}

void __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_1E102C000, v0, v1, "Failed to clear %{public}@ bookmarks - could not acquire database lock", v2, v3, v4, v5, v6);
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to save after moving bookmark into final position", v2, v3, v4, v5, v6);
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to move bookmark to final position", v2, v3, v4, v5, v6);
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to save after inserting bookmark", v2, v3, v4, v5, v6);
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to insert bookmark", v2, v3, v4, v5, v6);
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to create bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to save after moving bookmark list to final position", v2, v3, v4, v5, v6);
}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to move bookmark list to final position", v2, v3, v4, v5, v6);
}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to save after inserting bookmark list into initial position", v2, v3, v4, v5, v6);
}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to create bookmark list - could not acquire database lock", v2, v3, v4, v5, v6);
}

void __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_1E102C000, v0, v1, "Failed to delete bookmark - no bookmark exists with identifier %{public}@", v2, v3, v4, v5, v6);
}

void __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to delete bookmark from database", v2, v3, v4, v5, v6);
}

void __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to delete bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_1E102C000, v0, v1, "Failed to move bookmark - no bookmark exists with identifier %{public}@", v2, v3, v4, v5, v6);
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to save bookmarks after moving", v2, v3, v4, v5, v6);
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to reorder bookmark to final position", v2, v3, v4, v5, v6);
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to move bookmark to destination folder", v2, v3, v4, v5, v6);
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to move bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
}

void __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_1E102C000, v0, v1, "Failed to change title of bookmark - no bookmark exists with identifier %{public}@", v2, v3, v4, v5, v6);
}

void __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to save bookmarks after changing title", v2, v3, v4, v5, v6);
}

void __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to change title of bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
}

void __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_1E102C000, v0, v1, "Failed to change URL of bookmark - no bookmark exists with identifier %{public}@", v2, v3, v4, v5, v6);
}

void __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to save bookmarks after changing URL", v2, v3, v4, v5, v6);
}

void __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to change URL of bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
}

void __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Timed out waiting for sync agent to finish syncing", v2, v3, v4, v5, v6);
}

@end