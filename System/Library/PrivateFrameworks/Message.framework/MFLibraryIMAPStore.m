@interface MFLibraryIMAPStore
+ (id)copyRemoteIDForTemporaryUid:(unsigned int)a3;
+ (id)log;
- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6;
- (BOOL)allowsAppend;
- (BOOL)bodyFetchRequiresNetworkActivity;
- (BOOL)canCompact;
- (BOOL)canFetchMessageIDs;
- (BOOL)canFetchSearchResults;
- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5;
- (EDServerMessagePersistence)serverMessagePersistence;
- (MFLibraryIMAPStore)initWithMailbox:(id)a3 readOnly:(BOOL)a4;
- (id)_dataForMessage:(int)a3 readHeadersOnly:;
- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6;
- (id)_fetchFullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 didDownload:(BOOL *)a6;
- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)_serverMessageIndexer;
- (id)flagsForRemoteIDs:(id)a3;
- (id)mailboxPersistence;
- (id)messageForRemoteID:(id)a3;
- (id)messageIdRollCall:(id)a3;
- (id)messagesWithRemoteIDs:(id)a3;
- (id)replayAction:(id)a3;
- (id)storeSearchResultMatchingQuery:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 useLocalIndex:(BOOL)a7;
- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4;
- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5;
- (uint64_t)mailboxRowID;
- (unint64_t)growFetchWindow;
- (unsigned)uidNext;
- (unsigned)uidValidity;
- (void)_handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5;
- (void)close;
- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4;
- (void)doCompact;
- (void)reselectMailbox;
- (void)setAllowsAppend:(BOOL)a3;
- (void)setLibrary:(id)a3;
- (void)setUidNext:(unsigned int)a3;
- (void)setUidValidity:(unsigned int)a3;
- (void)updateServerUnreadCountClosingConnection:(BOOL)a3;
@end

@implementation MFLibraryIMAPStore

+ (id)log
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MFLibraryIMAPStore_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  v1 = (void *)log_log_2;
  return v1;
}

void __25__MFLibraryIMAPStore_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

- (MFLibraryIMAPStore)initWithMailbox:(id)a3 readOnly:(BOOL)a4
{
  BOOL v6 = a4;
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFLibraryIMAPStore;
  v9 = [(MFLibraryStore *)&v15 initWithMailbox:v8 readOnly:v6];
  if (v9)
  {
    v10 = [v8 account];
    v11 = [v10 taskManager];
    if (v11)
    {
      v12 = [MFSwiftIMAPMailboxTaskManager alloc];
      v4 = [v8 account];
      v5 = [(MFLegacyIMAPMailboxTaskManager *)v4 taskManager];
      v13 = [(MFSwiftIMAPMailboxTaskManager *)v12 initWithMailbox:v8 taskManager:v5];
    }
    else
    {
      v13 = [[MFLegacyIMAPMailboxTaskManager alloc] initWithMailbox:v8];
    }
    objc_storeStrong((id *)&v9->_taskManager, v13);
    if (v11)
    {

      v13 = v4;
    }
  }
  return v9;
}

- (id)mailboxPersistence
{
  if (a1)
  {
    os_log_t v1 = [a1 library];
    v2 = [v1 persistence];
    id v3 = [v2 mailboxPersistence];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (uint64_t)mailboxRowID
{
  if (!a1) {
    return 0;
  }
  os_log_t v1 = [a1 mailbox];
  uint64_t v2 = [v1 mailboxRowID];

  return v2;
}

- (void)close
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v6 = +[MFInvocationQueue sharedInvocationQueue];
    v4 = +[NSInvocation mf_invocationWithSelector:a2 target:self];
    [v6 addInvocation:v4];
  }
  else
  {
    if (self) {
      taskManager = self->_taskManager;
    }
    else {
      taskManager = 0;
    }
    [(MFIMAPMailboxTaskManager *)taskManager close];
  }
}

- (void)setLibrary:(id)a3
{
  id v5 = a3;
  id v6 = [(MFLibraryStore *)self library];

  if (v6 != v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)MFLibraryIMAPStore;
    [(MFLibraryStore *)&v15 setLibrary:v5];
    if (self) {
      taskManager = self->_taskManager;
    }
    else {
      taskManager = 0;
    }
    [(MFIMAPMailboxTaskManager *)taskManager setLibrary:v5];
    if (v5)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      id v8 = (void *)MEMORY[0x1E4F60D70];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __33__MFLibraryIMAPStore_setLibrary___block_invoke;
      v11[3] = &unk_1E5D3BCD8;
      objc_copyWeak(v13, &location);
      v13[1] = (id)a2;
      id v12 = v5;
      v9 = [v8 lazyFutureWithBlock:v11];
      serverMessagePersistenceFuture = self->_serverMessagePersistenceFuture;
      self->_serverMessagePersistenceFuture = v9;

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

id __33__MFLibraryIMAPStore_setLibrary___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (a2) {
    *a2 = 0;
  }
  id v6 = [WeakRetained mailbox];
  v7 = [v6 URL];

  if (!v7)
  {
    id v8 = [NSString stringWithFormat:@"Store %@ has no mailboxURL", v5];
    qword_1E974F2F0 = [v8 UTF8String];
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 48) object:v5 file:@"LibraryIMAPStore.m" lineNumber:100 description:@"We have a library IMAP store without a mailboxURL"];
  }
  v10 = [*(id *)(a1 + 32) persistence];
  v11 = [v10 serverMessagePersistenceFactory];
  id v12 = [v5 mailbox];
  v13 = [v12 URL];
  v14 = [v11 serverMessagePersistenceForMailboxURL:v13];

  return v14;
}

- (BOOL)allowsAppend
{
  return (*(unsigned char *)&self->super._flags & 1) == 0;
}

- (void)setAllowsAppend:(BOOL)a3
{
  self->super._flags = ($835FD4CD3CFECF79DE90309A635A882F)(*(_DWORD *)&self->super._flags & 0xFFFFFFFE | !a3);
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 1;
}

- (BOOL)canCompact
{
  v6.receiver = self;
  v6.super_class = (Class)MFLibraryIMAPStore;
  if ([(MFLibraryStore *)&v6 canCompact] && self->super._state == 3)
  {
    id v3 = [(MFLibraryStore *)self account];
    int v4 = [v3 isOffline] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)canFetchMessageIDs
{
  if (self) {
    self = (MFLibraryIMAPStore *)self->_taskManager;
  }
  return [(MFLibraryIMAPStore *)self canFetchMessageIDs];
}

- (BOOL)canFetchSearchResults
{
  return 1;
}

- (unint64_t)growFetchWindow
{
  uint64_t v2 = self;
  if (self) {
    self = (MFLibraryIMAPStore *)self->_taskManager;
  }
  [(MFLibraryIMAPStore *)self growFetchWindow];
  v4.receiver = v2;
  v4.super_class = (Class)MFLibraryIMAPStore;
  return [(MFLibraryStore *)&v4 growFetchWindow];
}

- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    taskManager = self->_taskManager;
  }
  else {
    taskManager = 0;
  }
  int64_t v8 = [(MFIMAPMailboxTaskManager *)taskManager fetchMessagesWithMessageIDs:v6 andSetFlags:a4];

  return v8;
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  if (self) {
    taskManager = self->_taskManager;
  }
  else {
    taskManager = 0;
  }
  int64_t v10 = [(MFIMAPMailboxTaskManager *)taskManager fetchNumMessages:a3 preservingUID:v8 options:a5];

  return v10;
}

- (void)updateServerUnreadCountClosingConnection:(BOOL)a3
{
  if (self) {
    self = (MFLibraryIMAPStore *)self->_taskManager;
  }
  [(MFLibraryIMAPStore *)self updateServerUnreadCountClosingConnection:a3];
}

- (id)messageIdRollCall:(id)a3
{
  id v4 = a3;
  if (self) {
    taskManager = self->_taskManager;
  }
  else {
    taskManager = 0;
  }
  id v6 = [(MFIMAPMailboxTaskManager *)taskManager messageIdRollCall:v4];

  return v6;
}

- (id)_serverMessageIndexer
{
  if (a1)
  {
    os_log_t v1 = [a1 library];
    uint64_t v2 = [v1 persistence];
    id v3 = [v2 serverMessagesIndexer];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)storeSearchResultMatchingQuery:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 useLocalIndex:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a5;
  v63[1] = *MEMORY[0x1E4F143B8];
  v11 = (MFServerMessagesIndexQuery *)a3;
  id v12 = a4;
  v13 = [(MFLibraryStore *)self mailbox];
  v14 = [v13 URL];

  if (v14)
  {
    objc_super v15 = [(MFLibraryStore *)self mailbox];
    v16 = [v15 account];
    v17 = [v16 identifier];

    if (v17)
    {
      if (v7)
      {
        -[MFLibraryIMAPStore _serverMessageIndexer](self);
        v18 = (MFIMAPMailboxTaskManager *)objc_claimAutoreleasedReturnValue();
        char v19 = _os_feature_enabled_impl();
        if (v18) {
          char v20 = v19;
        }
        else {
          char v20 = 0;
        }
        if (v20)
        {
          v49 = [MEMORY[0x1E4F60E18] promise];
          v21 = [MFServerMessagesIndexQuery alloc];
          v22 = [(MFServerMessagesIndexQuery *)v11 suggestion];
          v63[0] = v14;
          v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
          v50 = [(MFServerMessagesIndexQuery *)v21 initWithSuggestion:v22 accountID:v17 mailboxes:v23 limit:v8];

          v24 = +[MFLibraryIMAPStore log]();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v60 = v50;
            __int16 v61 = 2112;
            v62 = self;
            _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "Performing ServerMessageIndexer search for %@ in store: %@", buf, 0x16u);
          }

          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke;
          v56[3] = &unk_1E5D3BD00;
          id v25 = v49;
          id v57 = v25;
          id v58 = v14;
          [(MFIMAPMailboxTaskManager *)v18 performSearchQuery:v50 completion:v56];
          v26 = [v25 future];
          v27 = [v26 result:0];

          if (v27)
          {
            if (self) {
              taskManager = self->_taskManager;
            }
            else {
              taskManager = 0;
            }
            v29 = taskManager;
            v30 = [(MFIMAPMailboxTaskManager *)v29 downloadSearchResults:v27];
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_41;
            v55[3] = &unk_1E5D3BD28;
            v55[4] = self;
            v31 = [v30 map:v55];
          }
          else
          {
            v46 = +[MFLibraryIMAPStore log]();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A7EFF000, v46, OS_LOG_TYPE_DEFAULT, "No results from local index of server messages", buf, 2u);
            }

            v47 = (void *)MEMORY[0x1E4F60D70];
            v29 = (MFIMAPMailboxTaskManager *)objc_opt_new();
            v31 = [v47 futureWithResult:v29];
          }
        }
        else
        {
          v44 = (void *)MEMORY[0x1E4F60D70];
          v45 = objc_opt_new();
          v31 = [v44 futureWithResult:v45];
        }
        goto LABEL_34;
      }
      if (![MEMORY[0x1E4F602E0] preferenceEnabled:18])
      {
        v40 = +[MFLibraryIMAPStore log]();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v60 = v11;
          __int16 v61 = 2112;
          v62 = self;
          _os_log_impl(&dword_1A7EFF000, v40, OS_LOG_TYPE_DEFAULT, "Performing remote server search for %@ in store: %@", buf, 0x16u);
        }

        if (self) {
          v41 = self->_taskManager;
        }
        else {
          v41 = 0;
        }
        v18 = v41;
        v42 = [(MFIMAPMailboxTaskManager *)v18 searchWithCriterion:v12 limit:v8];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_44;
        v52[3] = &unk_1E5D3BD78;
        v52[4] = self;
        id v53 = v14;
        id v54 = v17;
        v43 = [v42 then:v52];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_48;
        v51[3] = &unk_1E5D3BD28;
        v51[4] = self;
        v31 = [v43 map:v51];

        goto LABEL_34;
      }
      v36 = +[MFLibraryIMAPStore log]();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v11;
        _os_log_impl(&dword_1A7EFF000, v36, OS_LOG_TYPE_DEFAULT, "#search-manager: Skipping server-side search for search context: %@", buf, 0xCu);
      }
    }
    else
    {
      v36 = +[MFLibraryIMAPStore log]();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = [(MFLibraryStore *)self mailbox];
        v38 = objc_msgSend(v37, "ef_publicDescription");
        -[MFLibraryIMAPStore storeSearchResultMatchingQuery:criterion:limit:offset:useLocalIndex:](v38, buf, v36, v37);
      }
    }

    v39 = (void *)MEMORY[0x1E4F60D70];
    v18 = (MFIMAPMailboxTaskManager *)objc_opt_new();
    v31 = [v39 futureWithResult:v18];
LABEL_34:

    goto LABEL_35;
  }
  v32 = +[MFLibraryIMAPStore log]();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v33 = [(MFLibraryStore *)self mailbox];
    v34 = objc_msgSend(v33, "ef_publicDescription");
    -[MFLibraryIMAPStore storeSearchResultMatchingQuery:criterion:limit:offset:useLocalIndex:](v34, buf, v32, v33);
  }

  v35 = (void *)MEMORY[0x1E4F60D70];
  v17 = objc_opt_new();
  v31 = [v35 futureWithResult:v17];
LABEL_35:

  return v31;
}

void __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[MFLibraryIMAPStore log]();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v3 count];
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "Received %lu results from SearchIndexer.", (uint8_t *)&v8, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v7 = v6;
  if (!v6) {
    BOOL v7 = objc_opt_new();
  }
  [v5 finishWithResult:v7];
  if (!v6) {
}
  }

id __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = [v3 uids];
  id v6 = [*(id *)(a1 + 32) mailbox];
  [v4 addRemoteIDs:v5 mailbox:v6];

  return v4;
}

id __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[MFLibraryIMAPStore _serverMessageIndexer](*(void **)(a1 + 32));
  char v5 = _os_feature_enabled_impl();
  if (v4) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  if (v6)
  {
    BOOL v7 = objc_opt_new();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    objc_super v15 = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_2;
    v16 = &unk_1E5D3BD50;
    id v17 = v3;
    id v10 = v7;
    id v18 = v10;
    [v4 excludeIndexedUIDsInMailbox:v8 ofAccount:v9 fromUIDs:v17 completion:&v13];
    v11 = objc_msgSend(v10, "future", v13, v14, v15, v16);
  }
  else
  {
    v11 = [MEMORY[0x1E4F60D70] futureWithResult:v3];
  }

  return v11;
}

void __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[MFLibraryIMAPStore log]();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count") - objc_msgSend(v3, "count"));
    int v6 = 138412290;
    BOOL v7 = v5;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "#search-manager: Filtered out %@ results using SearchIndexer", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 40) finishWithResult:v3];
}

id __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  char v5 = [v3 uids];
  int v6 = [*(id *)(a1 + 32) mailbox];
  [v4 addRemoteIDs:v5 mailbox:v6];

  return v4;
}

- (void)doCompact
{
  if (self) {
    self = (MFLibraryIMAPStore *)self->_taskManager;
  }
  [(MFLibraryIMAPStore *)self compact];
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  if (self) {
    self = (MFLibraryIMAPStore *)self->_taskManager;
  }
  [(MFLibraryIMAPStore *)self deleteMessagesOlderThanNumberOfDays:*(void *)&a3 compact:a4];
}

- (id)_dataForMessage:(int)a3 readHeadersOnly:
{
  id v5 = a2;
  int v6 = v5;
  if (a1)
  {
    if (([v5 hasTemporaryUid] & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_10:
      a1 = 0;
      goto LABEL_11;
    }
    BOOL v7 = [v6 messageData];
    a1 = v7;
    if (a3 && v7)
    {
      uint64_t v9 = objc_msgSend(v7, "mf_rangeOfRFC822HeaderData");
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v10 = +[MFLibraryIMAPStore log]();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_INFO, "-[MFLibraryIMAPStore _dataForMessage:] bad message data", v13, 2u);
        }

        goto LABEL_10;
      }
      uint64_t v12 = objc_msgSend(a1, "mf_subdataWithRange:", v9, v8);

      a1 = (void *)v12;
    }
  }
LABEL_11:

  return a1;
}

- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a6;
  BOOL v17 = 0;
  if (self) {
    taskManager = self->_taskManager;
  }
  else {
    taskManager = 0;
  }
  char v14 = -[MFIMAPMailboxTaskManager fetchDataForMimePart:range:isComplete:consumer:](taskManager, "fetchDataForMimePart:range:isComplete:consumer:", v11, location, length, &v17, v12);
  char v15 = v14 ^ 1;
  if (!a5) {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    *a5 = v17;
  }

  return v14;
}

- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if ([v11 conformsToProtocol:&unk_1EFF60DC8])
  {
    if (self) {
      taskManager = self->_taskManager;
    }
    else {
      taskManager = 0;
    }
    char v13 = [(MFIMAPMailboxTaskManager *)taskManager downloadMimePartNumber:v8 message:v11 withProgressBlock:v10];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)_fetchFullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 didDownload:(BOOL *)a6
{
  id v9 = a3;
  if (self) {
    taskManager = self->_taskManager;
  }
  else {
    taskManager = 0;
  }
  id v11 = taskManager;
  id v12 = [(MFIMAPMailboxTaskManager *)v11 fetchDataForMessage:v9 didDownload:a6];

  if (v12
    && (uint64_t v13 = objc_msgSend(v12, "mf_rangeOfRFC822HeaderData"),
        uint64_t v15 = v14,
        uint64_t v16 = v13 + v14,
        v13 + v14 <= (unint64_t)[v12 length]))
  {
    BOOL v17 = objc_msgSend(v12, "mf_subdataWithRange:", v13 + v15, objc_msgSend(v12, "length") - v16);
    if (v17)
    {
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F734F8]) initWithData:v17 partial:0 incomplete:0];
      id v19 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v9 valueIfNotPresent:v18];
      if (a6) {
        *a6 = 1;
      }
    }
    if (a4)
    {
      objc_msgSend(v12, "mf_subdataWithRange:", v13, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = +[MFActivityMonitor currentMonitor];
  [v11 recordTransportType:1];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v20.receiver = self,
        v20.super_class = (Class)MFLibraryIMAPStore,
        [(MFLibraryStore *)&v20 _fetchBodyDataForMessage:v10 andHeaderDataIfReadilyAvailable:a4 downloadIfNecessary:v7 partial:a6], (id v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v13 = -[MFLibraryIMAPStore _dataForMessage:readHeadersOnly:](self, v10, 0);
    if (!v13 && v7)
    {
      if (self) {
        taskManager = self->_taskManager;
      }
      else {
        taskManager = 0;
      }
      uint64_t v15 = taskManager;
      uint64_t v13 = [(MFIMAPMailboxTaskManager *)v15 fetchDataForMessage:v10 partial:a6];
    }
    if (v13)
    {
      uint64_t v16 = objc_msgSend(v13, "mf_rangeOfRFC822HeaderData");
      unint64_t v18 = v17;
      if (v17 > [v13 length])
      {
        id v12 = 0;
        if (!a4) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      id v12 = objc_msgSend(v13, "mf_subdataWithRange:", v16 + v18, objc_msgSend(v13, "length") - (v16 + v18));
      if (a4)
      {
LABEL_14:
        objc_msgSend(v13, "mf_subdataWithRange:", v16, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v12 = 0;
    }
LABEL_15:
  }
  return v12;
}

- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v15.receiver = self,
        v15.super_class = (Class)MFLibraryIMAPStore,
        [(MFLibraryStore *)&v15 _fetchHeaderDataForMessage:v6 downloadIfNecessary:v4], (BOOL v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_opt_respondsToSelector())
    {
      int v8 = [v6 uid];
      uint64_t v9 = -[MFLibraryIMAPStore _dataForMessage:readHeadersOnly:](self, v6, 1);
      BOOL v7 = (void *)v9;
      if (v4 && !v9 && v8)
      {
        id v10 = +[MFLibraryIMAPStore log]();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [(MFLibraryStore *)self description];
          id v12 = objc_msgSend(v6, "ef_publicDescription");
          *(_DWORD *)buf = 138412546;
          unint64_t v17 = v11;
          __int16 v18 = 2114;
          id v19 = v12;
          _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "%@ Fetching headers for UID %{public}@", buf, 0x16u);
        }
        if (self) {
          taskManager = self->_taskManager;
        }
        else {
          taskManager = 0;
        }
        BOOL v7 = [(MFIMAPMailboxTaskManager *)taskManager fetchHeadersForMessage:v6];
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)_handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MFLibraryIMAPStore;
  [(MFLibraryStore *)&v12 _handleFlagsChangedForMessages:v8 flags:v9 oldFlagsByMessage:v10];
  if (self) {
    taskManager = self->_taskManager;
  }
  else {
    taskManager = 0;
  }
  [(MFIMAPMailboxTaskManager *)taskManager handleFlagsChangedForMessages:v8 flags:v9 oldFlagsByMessage:v10];
}

- (id)messageForRemoteID:(id)a3
{
  id v4 = a3;
  id v5 = [(MFLibraryStore *)self library];
  id v6 = [(MFLibraryStore *)self mailbox];
  BOOL v7 = [v6 URLString];
  id v8 = [v5 messageWithRemoteID:v4 inRemoteMailbox:v7];

  [v8 setMessageStore:self];
  return v8;
}

- (id)messagesWithRemoteIDs:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  id v5 = [(MFLibraryStore *)self mailbox];
  id v6 = [(MFLibraryStore *)self copyMessagesWithRemoteIDs:v4 options:7346239 inMailbox:v5];

  return v6;
}

- (id)flagsForRemoteIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(MFLibraryStore *)self library];
  id v6 = [(MFLibraryStore *)self mailbox];
  BOOL v7 = [v6 URLString];
  id v8 = [v5 flagsForRemoteIDs:v4 inRemoteMailbox:v7];

  return v8;
}

+ (id)copyRemoteIDForTemporaryUid:(unsigned int)a3
{
  if (copyRemoteIDForTemporaryUid__sRemoteIDHandlerPred != -1) {
    dispatch_once(&copyRemoteIDForTemporaryUid__sRemoteIDHandlerPred, &__block_literal_global_10);
  }
  id v4 = __50__MFLibraryIMAPStore_copyRemoteIDForTemporaryUid___block_invoke_2(copyRemoteIDForTemporaryUid__sRemoteIDHandler, a3);
  id v5 = (void *)[v4 copy];

  return v5;
}

void __50__MFLibraryIMAPStore_copyRemoteIDForTemporaryUid___block_invoke()
{
  uint64_t v0 = (void *)copyRemoteIDForTemporaryUid__sRemoteIDHandler;
  copyRemoteIDForTemporaryUid__sRemoteIDHandler = (uint64_t)&__block_literal_global_68;
}

id __50__MFLibraryIMAPStore_copyRemoteIDForTemporaryUid___block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"temp-%lu", a2);
  return v2;
}

- (EDServerMessagePersistence)serverMessagePersistence
{
  return (EDServerMessagePersistence *)[(EFFuture *)self->_serverMessagePersistenceFuture result:0];
}

- (unsigned)uidNext
{
  uint64_t v2 = self;
  id v3 = -[MFLibraryIMAPStore mailboxPersistence](self);
  LODWORD(v2) = [v3 uidNextForMailbox:-[MFLibraryIMAPStore mailboxRowID](v2)];

  return v2;
}

- (void)setUidNext:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[MFLibraryIMAPStore mailboxPersistence](self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setUidNext:v3 forMailbox:-[MFLibraryIMAPStore mailboxRowID](self)];
}

- (unsigned)uidValidity
{
  uint64_t v2 = self;
  uint64_t v3 = -[MFLibraryIMAPStore mailboxPersistence](self);
  LODWORD(v2) = [v3 uidValidityForMailbox:-[MFLibraryIMAPStore mailboxRowID](v2)];

  return v2;
}

- (void)setUidValidity:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[MFLibraryIMAPStore mailboxPersistence](self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setUidValidity:v3 forMailbox:-[MFLibraryIMAPStore mailboxRowID](self)];
}

- (id)replayAction:(id)a3
{
  id v4 = a3;
  if (self) {
    taskManager = self->_taskManager;
  }
  else {
    taskManager = 0;
  }
  id v6 = [(MFIMAPMailboxTaskManager *)taskManager replayAction:v4];

  return v6;
}

- (void)reselectMailbox
{
  if (self) {
    self = (MFLibraryIMAPStore *)self->_taskManager;
  }
  [(MFLibraryIMAPStore *)self reselectMailbox];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_serverMessagePersistenceFuture, 0);
}

- (void)storeSearchResultMatchingQuery:(os_log_t)log criterion:(void *)a4 limit:offset:useLocalIndex:.cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "No mailbox URL for mailbox: %{public}@", buf, 0xCu);
}

- (void)storeSearchResultMatchingQuery:(os_log_t)log criterion:(void *)a4 limit:offset:useLocalIndex:.cold.2(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "No account identifier for mailbox: %{public}@", buf, 0xCu);
}

@end